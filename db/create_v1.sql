-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema beshbarmak
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema beshbarmak
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `beshbarmak` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `beshbarmak` ;

-- -----------------------------------------------------
-- Table `beshbarmak`.`product_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`product_categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `beshbarmak`.`product_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`product_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `beshbarmak`.`pickup_points`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`pickup_points` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `postal_code` INT NOT NULL,
  `city` TEXT NOT NULL,
  `street` TEXT NOT NULL,
  `house_number` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `beshbarmak`.`order_statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`order_statuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `beshbarmak`.`user_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`user_roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `beshbarmak`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role_id` INT NOT NULL,
  `full_name` TEXT NOT NULL,
  `email` TEXT NOT NULL,
  `password` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `gg_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `beshbarmak`.`user_roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `beshbarmak`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_date` TEXT NOT NULL,
  `delivery_date` TEXT NOT NULL,
  `pickup_point_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `pickup_code` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `f_idx` (`user_id` ASC) VISIBLE,
  INDEX `dsa_idx` (`status_id` ASC) VISIBLE,
  INDEX `asd_idx` (`pickup_point_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_pickup_point`
    FOREIGN KEY (`pickup_point_id`)
    REFERENCES `beshbarmak`.`pickup_points` (`id`),
  CONSTRAINT `fk_orders_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `beshbarmak`.`order_statuses` (`id`),
  CONSTRAINT `fk_orders_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `beshbarmak`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `beshbarmak`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`suppliers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `beshbarmak`.`manufacturers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`manufacturers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `beshbarmak`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sku` TEXT NOT NULL,
  `product_type_id` INT NOT NULL,
  `unit` TEXT NOT NULL,
  `price` INT NOT NULL,
  `supplier_id` INT NOT NULL,
  `manufacturer_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `discount_percent` INT NOT NULL,
  `stock_quantity` INT NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `image_filename` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `po_idx` (`product_type_id` ASC) VISIBLE,
  INDEX `da_idx` (`supplier_id` ASC) VISIBLE,
  INDEX `s_idx` (`manufacturer_id` ASC) VISIBLE,
  INDEX `d_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `beshbarmak`.`product_categories` (`id`),
  CONSTRAINT `fk_products_supplier`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `beshbarmak`.`suppliers` (`id`),
  CONSTRAINT `fk_products_type`
    FOREIGN KEY (`product_type_id`)
    REFERENCES `beshbarmak`.`product_types` (`id`),
  CONSTRAINT `fk_products_manufacturer`
    FOREIGN KEY (`manufacturer_id`)
    REFERENCES `beshbarmak`.`manufacturers` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `beshbarmak`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beshbarmak`.`order_items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fg_idx` (`order_id` ASC) VISIBLE,
  INDEX `sdfdsf_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_items_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `beshbarmak`.`orders` (`id`),
  CONSTRAINT `fk_order_items_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `beshbarmak`.`products` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
