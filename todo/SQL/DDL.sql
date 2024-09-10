-- Active: 1725903926546@@127.0.0.1@3306@yuj_clush
-- 스키마 생성
CREATE DATABASE `YuJ_clush`

-- 테이블 생성
CREATE TABLE `todo` (
  `no` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `status` int DEFAULT '0', -- 0은 기본, 1은 완료
  `due_date` date NOT NULL,
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`)
) COMMENT='할일';

-- 기본 CRUD 이외의 우선순위 설정 기능 추가
ALTER TABLE todo
ADD COLUMN priority ENUM('LOW', 'MEDIUM', 'HIGH') DEFAULT 'MEDIUM';
