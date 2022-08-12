###开发环境测试预生产都需要建库

CREATE DATABASE marketing_ma_dev DEFAULT CHARSET utf8mb4  COLLATE utf8mb4_unicode_ci;
CREATE DATABASE marketing_ma_staging DEFAULT CHARSET utf8mb4  COLLATE utf8mb4_unicode_ci;
CREATE DATABASE marketing_ma_testing DEFAULT CHARSET utf8mb4  COLLATE utf8mb4_unicode_ci;

###开发人员需要dev库的所有权限，testing，staging的查询权限

grant all privileges on marketing_ma_dev.* to c_aa_ourdev@"%" identified by "C_aa_ourdev*";
grant SELECT on marketing_ma_testing.* to c_aa_ourdev@"%" identified by "C_aa_ourdev*";
grant SELECT on marketing_ma_staging.* to c_aa_ourdev@"%" identified by "C_aa_ourdev*";

###测试人员需要testing，staging的查询、删除、新增权限
grant  all privileges on marketing_ma_testing.* to c_aa_testers@"%" identified by "123456";
grant SELECT,INSERT,DELETE on marketing_ma_staging.* to c_aa_testers@"%" identified by "123456";


###testing账号需要testing库的所有权限

grant all privileges on marketing_ma_testing.* to c_aa_testing@"192.168.96.0/255.255.224.0" identified by "C_aa_testing~~!";
grant all privileges on marketing_ma_testing.* to c_aa_testing@"192.168.160.0/255.255.224.0" identified by "C_aa_testing~~!";
grant all privileges on marketing_ma_testing.* to c_aa_testing@"192.168.128.0/255.255.224.0" identified by "C_aa_testing~~!";

###staging账号需要staging库的所有权限

grant all privileges on marketing_ma_staging.* to c_aa_staging@"192.168.96.0/255.255.224.0" identified by "C_aa_staging!";
grant all privileges on marketing_ma_staging.* to c_aa_staging@"192.168.160.0/255.255.224.0" identified by "C_aa_staging!";
grant all privileges on marketing_ma_staging.* to c_aa_staging@"192.168.128.0/255.255.224.0" identified by "C_aa_staging!";
