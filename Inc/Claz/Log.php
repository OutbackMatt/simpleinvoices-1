<?php
/**
 * @name Log.php
 * @author Richard Rowley
 * @license GPL V3 or above
 * Created: 20181009
 */

namespace Inc\Claz;

/**
 * Class Log
 * @package Inc\Claz
 */
class Log
{
    private static $logger = null;
    private static $folder = null;
    private static $file = null;
    private static $path = null;

    public static function open(string $level = "EMERG", string $folder = "tmp/log/", string $file = "si.log") {
        // Create log file if it doesn't exist
        if (preg_match('/^.*\/$/', $folder) == 1) {
            self::$folder = $folder;
        } else {
            self::$$folder = $folder . '/';
        }
        self::$path = self::$folder . $file;
        self::$file = $file;

        // Create file if it doesn't exist.
        if (!is_file(self::$path)) {
            /**
             * @var mixed $fp
             */
            if ($fp = fopen(self::$path, 'w') === false) {
                SiError::out('notWritable', 'folder', self::$folder);
            }
            fclose($fp);
        }

        // Assure file is writable
        if (!is_writable(self::$path)) {
            SiError::out('notWritable', 'file', self::$path);
        }

        try {
            $writer = new \Zend_Log_Writer_Stream(self::$path);
            self::$logger = new \Zend_Log($writer);
        } catch (\Zend_Log_Exception $zle) {
            SiError::out("generic", "Zend_Log_Exception", $zle->getMessage());
        }
        switch($level) {
            case 'DEBUG':
                $level = \Zend_Log::DEBUG;
                break;

            case 'INFO':
                $level = \Zend_Log::INFO;
                break;

            case 'NOTICE':
                $level = \Zend_Log::NOTICE;
                break;

            case 'WARN':
                $level = \Zend_Log::WARN;
                break;

            case 'ERR':
                $level = \Zend_Log::ERR;
                break;

            case 'CRIT':
                $level = \Zend_Log::CRIT;
                break;

            case 'ALERT':
                $level = \Zend_Log::ALERT;
                break;

            case 'EMERG':
            default:
                $level = \Zend_Log::EMERG;
                break;
        }

        try {
            $filter = new \Zend_Log_Filter_Priority($level);
            self::$logger->addFilter($filter);
        } catch (\Zend_Log_Exception $zle) {
            SiError::out("generic", "Zend_Log_Exception", $zle->getMessage());
        }
    }

    /**
     * @param string $msg
     * @param int $level one of: DEBUG, INFO, NOTICE, WARN, ERR, CRIT, ALERT, EMERG
     */
    public static function out(string $msg, $level = \Zend_Log::DEBUG) {
        self::$logger->log($msg, $level);
    }

}