# Create SMSTO DB
CREATE DATABASE IF NOT EXISTS smsto /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS smsto@'%' IDENTIFIED BY 'smsto';
GRANT ALL PRIVILEGES ON smsto.* TO 'smsto'@'%';

# Create Messages Microservice DB
CREATE DATABASE IF NOT EXISTS msms /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS msms@'%' IDENTIFIED BY 'msms';
GRANT ALL PRIVILEGES ON msms.* TO 'msms'@'%';

# Create Failed Jobs DB
CREATE DATABASE IF NOT EXISTS failed_jobs /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS failed_jobs@'%' IDENTIFIED BY 'failed_jobs';
GRANT ALL PRIVILEGES ON failed_jobs.* TO 'failed_jobs'@'%';

# Create Authentication Microservice DB
CREATE DATABASE IF NOT EXISTS msas /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS msas@'%' IDENTIFIED BY 'msas';
GRANT ALL PRIVILEGES ON msas.* TO 'msas'@'%';

# Create mockserver DB
CREATE DATABASE IF NOT EXISTS mockserver /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS mockserver@'%' IDENTIFIED BY 'mockserver';
GRANT ALL PRIVILEGES ON mockserver.* TO 'mockserver'@'%';

# Create Contacts DB
CREATE DATABASE IF NOT EXISTS contacts /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS contacts@'%' IDENTIFIED BY 'contacts';
GRANT ALL PRIVILEGES ON contacts.* TO 'contacts'@'%';

# Create EmailVerifier DB
CREATE DATABASE IF NOT EXISTS emailverifier /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER IF NOT EXISTS emailverifier@'%' IDENTIFIED BY 'emailverifier';
GRANT ALL PRIVILEGES ON emailverifier.* TO 'emailverifier'@'%';

# Reload privileges
FLUSH PRIVILEGES;
