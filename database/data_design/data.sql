CREATE TABLE `country` (
  `country_id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `alpha_code` char(3),
  `language_id` integer NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp,
  `deleted_at` timestamp
);

CREATE TABLE `users` (
  `user_id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `password` char(100) NOT NULL,
  `phone` char(15),
  `email` char(50) NOT NULL,
  `address` char(255),
  `role_id` char(2) NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp,
  `deleted_at` timestamp
);

CREATE TABLE `language` (
  `language_id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `code` char(10) NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp,
  `deleted_at` timestamp
);

CREATE TABLE `roles` (
  `role_id` char(2) PRIMARY KEY,
  `name` char(10) NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp,
  `deleted_at` timestamp
);

CREATE TABLE `movie` (
  `movie_id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `link_url` char(150) NOT NULL,
  `description` longText,
  `status` integer NOT NULL,
  `start_time` date NOT NULL,
  `total_time` char(10) NOT NULL,
  `main_actor` text NOT NULL,
  `director` char(100),
  `movie_type_id` integer NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp,
  `deleted_at` timestamp
);

CREATE TABLE `movie_type` (
  `movie_type_id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `type` char(20) NOT NULL,
  `country_id` integer NOT NULL,
  `language_id` integer NOT NULL,
  `created_at` timestamp,
  `updated_at` timestamp,
  `deleted_at` timestamp
);

ALTER TABLE `country` ADD FOREIGN KEY (`country_id`) REFERENCES `language` (`language_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `movie_type` ADD FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`);

ALTER TABLE `movie` ADD FOREIGN KEY (`movie_type_id`) REFERENCES `movie_type` (`movie_type_id`);
