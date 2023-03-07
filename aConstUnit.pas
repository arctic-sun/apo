unit aConstUnit;

interface

const
     APP_SETTINGS_VER = 1;

     APP_CAPTION            = 'Arctic Profile Optimizer';
     SQLStatusVerCaption    = 'SQLite: %s';
     AppVerCaption          = 'apo: %sa'; //0.X.Xa'
     AppVerPortableCaption  = 'portable: %sa'; //0.X.Xa'

     FINAL_BUILD_DATE       = '07/03/2023';
     GITHUB_APO_HOME        = 'https://github.com/arctic-sun/apo';
     APO_VER_INFO           = 'Arctic Profile Optimizer: %s alpha ( %s )';

     APP_SYSTEM_SETTINGS_PATH       = '%LOCALAPPDATA%\Arctics\ProfileOptimizer\';

     APP_PORTABLE_SETTINGS_PATH     = 'ProfileOptimizer\';
     APP_CUSTOM_PROFILES_FILENAME   = 'custom.profiles';
     APP_SETTINGS_FILENAME          = 'micro.cfg';
     APP_DISABLED_PROFILES_FILENAME = 'disabled.profiles';
     APP_CACHE_FILENAME             = 'profiles.cache';
     APP_WND_SETTINGS               = 'wnd.ini';
     APP_JSETTINGS_V1               = 'S1.json';

     DEFAULT_BAT_FILE_NAME = 'OptimizationJob.bat';


     VST_PROFILENAME_COLUMN_INDEX = 0;
     VST_FILESCOUNT_COLUMN_INDEX  = 1;
     VST_SIZEBEFORE_COLUMN_INDEX  = 2;
     VST_SIZEAFTER_COLUMN_INDEX   = 3;
     VST_RATE_COLUMN_INDEX        = 4;
     VST_OPTIMIZED_COLUMN_INDEX   = 5;
     VST_CACHING_COLUMN_INDEX     = 6;

     CNST_LOAD_AND_SEARCH        = 0;
     CNST_LOAD_ONLY              = 1;
     CNST_SEARCH_ONLY            = 2;

     SQLITE_DB_SIGNATURE_LENGTH = 16; // Длинна сигнатуры файла SQlite


     // *** Эта последовательность не может быть нарушена ***
     // * Нарушение последовательности допустимо только в тексте JSON

    const SettingsNameArray : array of string = [   'app.settings.version'                  ,
                                                    'GLOBAL.ui.language'                    ,
                                                    'GLOBAL.ui.theme'                       ,
                                                    'GLOBAL.ui.font.name'                   ,
                                                    'GLOBAL.ui.font.size'                   ,
                                                    'GLOBAL.check.running.browsers'         ,
                                                    'GLOBAL.show.showlog'                   ,
                                                    'GLOBAL.show.nonexisting.profiles'      ,
                                                    'GLOBAL.show.hidden.profiles'           ,
                                                    'GLOBAL.show.toolbar'
                                                 ];










implementation

end.
