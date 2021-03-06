CREATE TABLE class_unit (
  id smallint(6) NOT NULL auto_increment COMMENT 'pk',
  `name` varchar(255) NOT NULL COMMENT 'Наименование единицы измерения',
  number_code varchar(5) NOT NULL COMMENT 'Код',
  rus_name1 varchar(50) default NULL COMMENT 'Условное обозначение национальное',
  eng_name1 varchar(50) default NULL COMMENT 'Условное обозначение международное',
  rus_name2 varchar(50) default NULL COMMENT 'Кодовое буквенное обозначение национальное',
  eng_name2 varchar(50) default NULL COMMENT 'Кодовое буквенное обозначение международное',
  class_unit_group_id tinyint(4) NOT NULL COMMENT 'Группа единиц измерения',
  class_unit_type_id tinyint(4) NOT NULL COMMENT 'Раздел/приложение в которое входит единица измерения',
  visible tinyint(4) NOT NULL default '1' COMMENT 'Видимость',
  `comment` varchar(255) default NULL COMMENT 'Комментарий',
  PRIMARY KEY  (id),
  UNIQUE KEY number_code (number_code),
  KEY class_unit_group_id (class_unit_group_id),
  KEY class_unit_type_id (class_unit_type_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Общероссийский классификатор единиц измерения ОКЕИ' AUTO_INCREMENT=461 ;

CREATE TABLE class_unit_group (
  id tinyint(4) NOT NULL auto_increment COMMENT 'pk',
  `name` varchar(255) NOT NULL COMMENT 'Наименование группы',
  PRIMARY KEY  (id),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Группы единиц измерения' AUTO_INCREMENT=8 ;

CREATE TABLE class_unit_type (
  id tinyint(4) NOT NULL auto_increment COMMENT 'pk',
  `name` varchar(255) NOT NULL COMMENT 'Наименование раздела/приложения',
  PRIMARY KEY  (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Разделы/приложения, в которые включены единицы измерения' AUTO_INCREMENT=4 ;

ALTER TABLE `class_unit`
  ADD CONSTRAINT class_unit_ibfk_2 FOREIGN KEY (class_unit_type_id) REFERENCES class_unit_type (id),
  ADD CONSTRAINT class_unit_ibfk_1 FOREIGN KEY (class_unit_group_id) REFERENCES class_unit_group (id);