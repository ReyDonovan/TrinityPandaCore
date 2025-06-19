CREATE DATABASE `world` DEFAULT CHARACTER SET utf8 COLLATE utf8mb3_unicode_ci;

CREATE DATABASE `characters` DEFAULT CHARACTER SET utf8 COLLATE utf8mb3_unicode_ci;

CREATE DATABASE `auth` DEFAULT CHARACTER SET utf8 COLLATE utf8mb3_unicode_ci;

GRANT ALL PRIVILEGES ON `world` . * TO 'trinity'@'localhost' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `characters` . * TO 'trinity'@'localhost' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `auth` . * TO 'trinity'@'localhost' WITH GRANT OPTION;