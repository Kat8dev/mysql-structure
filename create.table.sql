CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optica`.`supplier` (
  `supplier_id` INT NOT NULL,
  `country` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `street_number` INT NULL,
  `apartment` VARCHAR(45) NULL,
  `floor` INT NULL,
  `door` VARCHAR(45) NULL,
  `postal_code` INT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`marks` (
  `mark_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`mark_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`glasses` (
  `glasses_id` INT NOT NULL,
  `mark` INT NULL,
  `glass_graduation` FLOAT(9,2) NULL,
  `mount_type` VARCHAR(45) NULL,
  `mount_color` VARCHAR(45) NULL,
  `glass_color` VARCHAR(45) NULL,
  `price` FLOAT(9,2) NULL,
  `glassescol` VARCHAR(45) NULL,
  `supplier` INT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `supplier_idx` (`supplier` ASC) VISIBLE,
  INDEX `mark_idx` (`mark` ASC) VISIBLE,
  CONSTRAINT `supplier`
    FOREIGN KEY (`supplier`)
    REFERENCES `optica`.`supplier` (`supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mark`
    FOREIGN KEY (`mark`)
    REFERENCES `optica`.`marks` (`mark_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `optica`.`employees` (
  `employee_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`clients` (
  `client_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `post_address` VARCHAR(45) NULL,
  `phone_number` INT NULL,
  `email` VARCHAR(45) NULL,
  `register_date` DATE NULL,
  `recomeded_by` INT NULL,
  `assisted_by` INT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `recomended_by_idx` (`recomeded_by` ASC) VISIBLE,
  INDEX `assisted_by_idx` (`assisted_by` ASC) VISIBLE,
  CONSTRAINT `recomended_by`
    FOREIGN KEY (`recomeded_by`)
    REFERENCES `optica`.`clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `assisted_by`
    FOREIGN KEY (`assisted_by`)
    REFERENCES `optica`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

