# Create SMSTO DB
CREATE DATABASE IF NOT EXISTS smsto /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS smsto@'%' IDENTIFIED BY 'smsto';
GRANT ALL PRIVILEGES ON smsto.* TO 'smsto'@'%';

# Create Messages Microservice DB
CREATE DATABASE IF NOT EXISTS msms /*\!40100 DEFAULT CHARACTER SET utf8 */;
GRANT ALL PRIVILEGES ON smsto.* TO 'smsto'@'%';

# Create Authentication Microservice DB
CREATE DATABASE IF NOT EXISTS msas /*\!40100 DEFAULT CHARACTER SET utf8 */;
GRANT ALL PRIVILEGES ON smsto.* TO 'smsto'@'%';

# Create EmailVerifier DB
CREATE DATABASE IF NOT EXISTS emailverifier /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS emailverifier@'%' IDENTIFIED BY 'emailverifier';
GRANT ALL PRIVILEGES ON emailverifier.* TO 'emailverifier'@'%';

# Reload privileges
FLUSH PRIVILEGES;
