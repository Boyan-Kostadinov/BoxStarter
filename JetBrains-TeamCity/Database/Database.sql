CREATE DATABASE [TeamCity] CONTAINMENT = NONE
ON
PRIMARY (NAME = N'TeamCity', FILENAME = N'D:\SQLData\TeamCity.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB)
LOG ON (NAME = N'TeamCity_log', FILENAME = N'D:\SQLData\TeamCity_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB)

USE [TeamCity]
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM]
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]