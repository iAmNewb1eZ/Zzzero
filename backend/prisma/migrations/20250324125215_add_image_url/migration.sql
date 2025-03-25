/*
  Warnings:

  - You are about to drop the column `mainStat` on the `DiskDrive` table. All the data in the column will be lost.
  - You are about to drop the column `setBonus` on the `DiskDrive` table. All the data in the column will be lost.
  - Added the required column `attackType` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rank` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fourPieceBonus` to the `DiskDrive` table without a default value. This is not possible if the table is not empty.
  - Added the required column `twoPieceBonus` to the `DiskDrive` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Character` ADD COLUMN `attackType` VARCHAR(191) NOT NULL,
    ADD COLUMN `imageUrl` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN `rank` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `DiskDrive` DROP COLUMN `mainStat`,
    DROP COLUMN `setBonus`,
    ADD COLUMN `fourPieceBonus` VARCHAR(191) NOT NULL,
    ADD COLUMN `imageUrl` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN `twoPieceBonus` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `WEngine` ADD COLUMN `imageUrl` VARCHAR(191) NOT NULL DEFAULT '';
