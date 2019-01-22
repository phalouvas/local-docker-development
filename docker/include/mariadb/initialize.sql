# Create SMSTO DB
CREATE DATABASE IF NOT EXISTS smsto /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS smsto@'%' IDENTIFIED BY 'smsto';
GRANT ALL PRIVILEGES ON smsto.* TO 'smsto'@'%';


# Create SMSTO TEST DB
CREATE DATABASE IF NOT EXISTS smsto_test /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS smsto@'%' IDENTIFIED BY 'smsto';
GRANT ALL PRIVILEGES ON smsto_test.* TO 'smsto'@'%';


# Create EmailVerifier DB
CREATE DATABASE IF NOT EXISTS emailverifier /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS emailverifier@'%' IDENTIFIED BY 'emailverifier';
GRANT ALL PRIVILEGES ON emailverifier.* TO 'emailverifier'@'%';

# Reload privileges
FLUSH PRIVILEGES;
