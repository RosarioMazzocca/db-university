create database `test_university`;
use `test_university`;

create table `dipartimenti`(
`id` INT not null auto_increment,
`nome` VARCHAR(100) not null,
`indirizzo` VARCHAR(255),
`numero` INT(15),
`email` VARCHAR(255),
`website` VARCHAR(255) NULL,
`rettore del dipartimento` VARCHAR(255),
primary key (`id`)
);

create table `corsidilaurea`(
`id` INT not null auto_increment,
`nome` VARCHAR(100) not null,
`indirizzo` VARCHAR(255),
`email` VARCHAR(255),
`website` VARCHAR(255) NULL,
`tipo di laurea` VARCHAR(255),
`dipartimenti_id` INT NOT null,
primary key (`id`),
FOREIGN KEY(`dipartimenti_id`) REFERENCES dipartimenti(`id`)
);

create table `corsidellematerie`(
`id` INT not null auto_increment,
`nome` VARCHAR(100) not null,
`capienza` INT,
`descrizione` TEXT,
`website` VARCHAR(255),
`cfu` smallint not null,
primary key (`id`)
);

create table `corsidellematerie_corsidilaurea`(
	`corsidellematerie_id` INT NOT NULL,
	`corsidilaurea_id` INT NOT NULL,
	PRIMARY KEY(`corsidellematerie_id`,`corsidilaurea_id`),
	FOREIGN KEY(`corsidellematerie_id`) REFERENCES corsidellematerie(`id`),
	FOREIGN KEY(`corsidilaurea_id`) REFERENCES corsidilaurea(`id`)
);

create table `appelli`(
`id` INT not null auto_increment,
`data` DATETIME not null,
`sede` VARCHAR(255) not null,
`indirizzo` VARCHAR(255),
`corsidellematerie_id` INT not null,
primary key (`id`),
FOREIGN KEY(`corsidellematerie_id`) REFERENCES corsidellematerie(`id`)
);

create table `professori`(
`id` INT not null auto_increment,
`nome` VARCHAR(100) not null,
`cognome` VARCHAR(100) not null,
`numero di cellulare` INT(15),
`email` VARCHAR(255) not null,
`indirizzo ufficio` VARCHAR(255),
primary key (`id`)
);

create table `studenti`(
`id` INT not null auto_increment,
`nome` VARCHAR(100) not null,
`cognome` VARCHAR(100) not null,
`numero di matricola` INT not null,
`email` VARCHAR(255) not null,
`anno di nascita` DATE,
`corsidilaurea_id` INT not null,
primary key (`id`),
FOREIGN KEY(`corsidilaurea_id`) REFERENCES corsidilaurea(`id`)
);

CREATE TABLE `corsidellematerie_professori`(
	`corsidellematerie_id` INT NOT NULL,
	`professori_id` INT NOT NULL,
	PRIMARY KEY(`corsidellematerie_id`,`professori_id`),
	FOREIGN KEY(`corsidellematerie_id`) REFERENCES corsidellematerie(`id`),
	FOREIGN KEY(`professori_id`) REFERENCES professori(`id`)
);

create table `voto`(
`id` INT not null auto_increment,
`voto esame` SMALLINT not null,
`appelli_id` INT not null,
`studenti_id` INT not null,
primary key (`id`),
FOREIGN KEY(`appelli_id`) REFERENCES appelli(`id`),
FOREIGN KEY(`studenti_id`) REFERENCES studenti(`id`)
);