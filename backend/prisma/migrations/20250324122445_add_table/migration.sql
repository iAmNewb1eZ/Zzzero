-- CreateTable
CREATE TABLE `Character` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `element` VARCHAR(191) NOT NULL,
    `role` VARCHAR(191) NOT NULL,
    `faction` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Character_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WEngine` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `rank` VARCHAR(191) NOT NULL,
    `mainStat` VARCHAR(191) NOT NULL,
    `effect` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `WEngine_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DiskDrive` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `setBonus` VARCHAR(191) NOT NULL,
    `mainStat` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `DiskDrive_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RecommendedBuild` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `characterId` INTEGER NOT NULL,
    `wEngineId` INTEGER NOT NULL,
    `diskDriveId` INTEGER NOT NULL,
    `description` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `RecommendedBuild` ADD CONSTRAINT `RecommendedBuild_characterId_fkey` FOREIGN KEY (`characterId`) REFERENCES `Character`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RecommendedBuild` ADD CONSTRAINT `RecommendedBuild_wEngineId_fkey` FOREIGN KEY (`wEngineId`) REFERENCES `WEngine`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RecommendedBuild` ADD CONSTRAINT `RecommendedBuild_diskDriveId_fkey` FOREIGN KEY (`diskDriveId`) REFERENCES `DiskDrive`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
