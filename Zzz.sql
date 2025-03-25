-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Mar 25, 2025 at 01:09 PM
-- Server version: 9.2.0
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutorial`
--

-- --------------------------------------------------------

--
-- Table structure for table `Character`
--

CREATE TABLE `Character` (
  `id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` enum('Electric','Fire','Ice','Frost','Ether','Physical') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Defense','Attack','Support','Stun','Anomaly') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `faction` enum('N.E.P.S.','Victoria Housekeeping','Sons of Calydon','Cunning Hares','Belobog Heavy Industries','Section 6','Stars of Lyra','Obol Squad') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attackType` enum('Strike','Slash','Pierce') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rank` enum('S-RANK','A-RANK') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Character`
--

INSERT INTO `Character` (`id`, `name`, `element`, `role`, `faction`, `attackType`, `imageUrl`, `rank`) VALUES
(1, 'Ellen Joe', 'Ice', 'Attack', 'Victoria Housekeeping', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_ellen.png', 'S-RANK'),
(2, 'Zhu Yuan', 'Ether', 'Attack', 'N.E.P.S.', 'Pierce', 'https://rerollcdn.com/ZZZ/Character/portrait_zhu_yuan.png', 'S-RANK'),
(3, 'Qingyi', 'Electric', 'Stun', 'N.E.P.S.', 'Strike', 'https://rerollcdn.com/ZZZ/Character/portrait_qingyi.png', 'S-RANK'),
(4, 'Jane Doe', 'Physical', 'Anomaly', 'N.E.P.S.', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_jane_doe.png', 'S-RANK'),
(5, 'Caesar', 'Physical', 'Defense', 'Sons of Calydon', 'Strike', 'https://rerollcdn.com/ZZZ/Character/portrait_caesar.png', 'S-RANK'),
(6, 'Burnice', 'Fire', 'Anomaly', 'Sons of Calydon', 'Pierce', 'https://rerollcdn.com/ZZZ/Character/portrait_burnice.png', 'S-RANK'),
(7, 'Piper', 'Physical', 'Anomaly', 'Sons of Calydon', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_piper.png', 'A-RANK'),
(8, 'Pulchra', 'Physical', 'Stun', 'Sons of Calydon', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_pulchra.png', 'A-RANK'),
(9, 'Lighter', 'Fire', 'Stun', 'Sons of Calydon', 'Strike', 'https://rerollcdn.com/ZZZ/Character/portrait_lighter.png', 'S-RANK'),
(10, 'Lucy', 'Fire', 'Support', 'Sons of Calydon', 'Strike', 'https://rerollcdn.com/ZZZ/Character/portrait_lucy.png', 'A-RANK'),
(11, 'Seth', 'Electric', 'Defense', 'N.E.P.S.', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_seth.png', 'A-RANK'),
(12, 'Nicole', 'Ether', 'Support', 'Cunning Hares', 'Strike', 'https://rerollcdn.com/ZZZ/Character/portrait_nicole.png', 'A-RANK'),
(13, 'Anby', 'Electric', 'Stun', 'Cunning Hares', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_anby.png', 'A-RANK'),
(14, 'Billy', 'Physical', 'Attack', 'Cunning Hares', 'Pierce', 'https://rerollcdn.com/ZZZ/Character/portrait_billy.png', 'A-RANK'),
(15, 'Nekomata', 'Physical', 'Attack', 'Cunning Hares', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_nekomata.png', 'S-RANK'),
(16, 'Corin', 'Physical', 'Attack', 'Victoria Housekeeping', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_corin.png', 'A-RANK'),
(17, 'Rina', 'Electric', 'Support', 'Victoria Housekeeping', 'Strike', 'https://rerollcdn.com/ZZZ/Character/portrait_rina.png', 'S-RANK'),
(18, 'Lycaon', 'Ice', 'Stun', 'Victoria Housekeeping', 'Strike', 'https://rerollcdn.com/ZZZ/Character/portrait_lycaon.png', 'S-RANK'),
(19, 'Anton', 'Electric', 'Attack', 'Belobog Heavy Industries', 'Pierce', 'https://rerollcdn.com/ZZZ/Character/portrait_anton.png', 'A-RANK'),
(20, 'Ben', 'Fire', 'Defense', 'Belobog Heavy Industries', 'Strike', 'https://rerollcdn.com/ZZZ/Character/portrait_ben.png', 'A-RANK'),
(21, 'Grace', 'Electric', 'Anomaly', 'Belobog Heavy Industries', 'Pierce', 'https://rerollcdn.com/ZZZ/Character/portrait_grace.png', 'S-RANK'),
(22, 'Koleda', 'Fire', 'Stun', 'Belobog Heavy Industries', 'Strike', 'https://rerollcdn.com/ZZZ/Character/portrait_koleda.png', 'S-RANK'),
(23, 'Anby Soldier 0', 'Electric', 'Attack', 'Obol Squad', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_anby_soldier_0.png', 'S-RANK'),
(24, 'Soldier 11', 'Fire', 'Attack', 'Obol Squad', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_soldier_11.png', 'S-RANK'),
(25, 'Soukaku', 'Ice', 'Support', 'Section 6', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_soukaku.png', 'A-RANK'),
(26, 'Yanagi', 'Electric', 'Anomaly', 'Section 6', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_yanagi.png', 'S-RANK'),
(27, 'Harumasa', 'Electric', 'Attack', 'Section 6', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_harumasa.png', 'S-RANK'),
(28, 'Miyabi', 'Frost', 'Anomaly', 'Section 6', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_miyabi.png', 'S-RANK'),
(29, 'Astra', 'Ether', 'Support', 'Stars of Lyra', 'Strike', 'https://rerollcdn.com/ZZZ/Character/portrait_astra_yao.png', 'S-RANK'),
(30, 'Evelyn', 'Fire', 'Attack', 'Stars of Lyra', 'Slash', 'https://rerollcdn.com/ZZZ/Character/portrait_evelyn.png', 'S-RANK'),
(31, 'Trigger', 'Electric', 'Stun', 'Obol Squad', 'Pierce', 'https://shorturl.at/qACNh', 'S-RANK');

-- --------------------------------------------------------

--
-- Table structure for table `DiskDrive`
--

CREATE TABLE `DiskDrive` (
  `id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fourPieceBonus` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `twoPieceBonus` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `DiskDrive`
--

INSERT INTO `DiskDrive` (`id`, `name`, `fourPieceBonus`, `imageUrl`, `twoPieceBonus`) VALUES
(1, 'Polar Metal', 'การ [โจมตีปกติ] และการ [พุ่งโจมตี] สร้างความเสียหายเพิ่มขึ้น [20]% โดยเมื่อตัวละครใดก็ตามในทีม ทำให้ศัตรูถูกเอฟเฟกต์ [แช่แข็ง] หรือทำให้เกิดเอฟเฟกต์ [น้ำแข็งแตก] เอฟเฟกต์บัฟนี้ จะเพิ่มขึ้นอีก [20]% ต่อเนื่อง [12] วินาที', 'https://rerollcdn.com/ZZZ/Drive/1/SuitPolarMetal.webp', 'DMG ธาตุน้ำแข็ง เพิ่มขึ้น 10%'),
(2, 'Fanged Metal', 'มื่อตัวละครใดก็ตามในทีม ทำให้ศัตรูติดเอฟเฟกต์ [จู่โจม] ผู้ใช้จะสร้างความเสียหายต่อเป้าหมายเพิ่มขึ้น [20]% ต่อเนื่อง [12] วินาที', 'https://rerollcdn.com/ZZZ/Drive/1/SuitFangedMetal.webp', 'DMG กายภาพ เพิ่มขึ้น 10%'),
(3, 'Thunder Metal', 'เมื่อในสนามมีศัตรูที่อยู่ในสถานะ [ชาร์จไฟฟ้า] ATK ของผู้ใช้จะเพิ่มขึ้น [28]%', 'https://rerollcdn.com/ZZZ/Drive/1/SuitThunderMetal.webp', 'DMG ธาตุไฟฟ้า เพิ่มขึ้น 10%'),
(4, 'Chaotic Metal', 'CRIT DMG ของผู้ใช้จะเพิ่มขึ้น [20]% เมื่อตัวละครใดก็ตามในทีม ทำให้เกิดความเสียหายเพิ่มเติมจากเอฟเฟกต์ [กัดกร่อน] เอฟเฟกต์บัฟนี้จะเพิ่มขึ้น [5.5]% ซ้อนทับได้มากสุด [6] ชั้น ต่อเนื่อง [8] วินาที เมื่อเกิดซ้ำ จะรีเฟรชช่วงเวลาต่อเนื่อง', 'https://rerollcdn.com/ZZZ/Drive/1/SuitChaoticMetal.webp', 'DMG อีเทอร์ เพิ่มขึ้น 10%'),
(5, 'Inferno Metal', 'เมื่อโจมตีถูกศัตรูที่อยู่ในสถานะ [ไหม้เกรียม] CRIT Rate ของผู้ใช้จะเพิ่มขึ้น [28]% ต่อเนื่อง [8] วินาที', 'https://rerollcdn.com/ZZZ/Drive/1/SuitInfernoMetal.webp', 'DMG ธาตุไฟ เพิ่มขึ้น 10%'),
(6, 'Soul Rock', 'เมื่อถูกศัตรูโจมตี และสูญเสีย HP ผู้ใช้จะได้รับความเสียหายลดลง [40]% ต่อเนื่อง [2.5] วินาที โดยภายใน [15] วินาที จะเกิดขึ้นได้มากสุดหนึ่งครั้ง', 'https://rerollcdn.com/ZZZ/Drive/1/SuitSoulRock.webp', 'DEF เพิ่มขึ้น 16%'),
(7, 'Freedom Blues', 'เมื่อ [สกิลพิเศษ-EX] ถูกศัตรู จะทำให้ความต้านทานการสะสม Attribute Anomaly ที่เกี่ยวข้องของเป้าหมายลดลง [20]% โดยขึ้นกับประเภทธาตุของผู้ใช้ ต่อเนื่อง [8] วินาที ซึ่งเอฟเฟกต์ของธาตุประเภทเดียวกัน จะไม่ซ้อนทับกัน', 'https://rerollcdn.com/ZZZ/Drive/1/SuitFreedomBlues.webp', 'ความชำนาญ Anomaly เพิ่มขึ้น 30 แต้ม'),
(8, 'Hormone Punk', 'เมื่อเข้าสู่การต่อสู้ หรือถูกเปลี่ยนเข้าในสนาม ATK ของผู้ใช้จะเพิ่มขึ้น [25]% ต่อเนื่อง [10] วินาที โดยที่ภายใน [20] วินาที จะเกิดขึ้นได้มากสุดหนึ่งครั้ง', 'https://rerollcdn.com/ZZZ/Drive/1/SuitHormonePunk.webp', 'ATK เพิ่มขึ้น 10%'),
(9, 'Puffer Electro', '[สกิลอัลติเมท] สร้างความเสียหายเพิ่มขึ้น [20]%; เมื่อใช้ [สกิลอัลติเมท] ATK ของผู้ใช้จะเพิ่มขึ้น [15]% ต่อเนื่อง [12] วินาที', 'https://rerollcdn.com/ZZZ/Drive/1/SuitPufferElectro.webp', 'PEN Ratio เพิ่มขึ้น 8%'),
(10, 'Shockstar Disco', 'การ [โจมตีปกติ], [พุ่งโจมตี] และ [หลบหลีกสวนกลับ] สร้าง Daze ต่อเป้าหมายการโจมตีหลักเพิ่มขึ้น [20]%', 'https://rerollcdn.com/ZZZ/Drive/1/SuitShockstarDisco.webp', 'Impact เพิ่มขึ้น 6%'),
(11, 'Swing Jazz', 'เมื่อใช้ [สกิลต่อเนื่อง] หรือ [สกิลอัลติเมท] ทั้งทีมจะสร้างความเสียหายเพิ่มขึ้น [15]% ต่อเนื่อง [12] วินาที โดยที่เอฟเฟกต์พาสซีฟชื่อเดียวกัน จะไม่ซ้อนทับกัน', 'https://rerollcdn.com/ZZZ/Drive/1/SuitSwingJazz.webp', 'การฟื้นฟูพลังงาน เพิ่มขึ้น 20%'),
(12, 'Woodpecker Electro', 'เมื่อการ [โจมตีปกติ], [หลบหลีกสวนกลับ] หรือ [สกิลพิเศษ-EX] ถูกศัตรู และทำให้เกิดคริติคอล จะแยกกันมอบเอฟเฟกต์บัฟให้แก่ผู้ใช้ 1 ชั้น โดยที่เอฟเฟกต์บัฟแต่ละชั้น จะทำให้ ATK ของผู้ใช้เพิ่มขึ้น [9]% ต่อเนื่อง [6] วินาที และการโจมตีที่ต่างกัน จะคิดช่วงเวลาต่อเนื่องแยกกัน', 'https://rerollcdn.com/ZZZ/Drive/1/SuitWoodpeckerElectro.webp', 'CRIT Rate เพิ่มขึ้น 8%'),
(13, 'Astral Voice', 'เมื่อตัวละครใดก็ตามในทีม เข้าสนามผ่านการ [ซัพพอร์ตอย่างรวดเร็ว] ทั้งทีมจะได้รับ [Astral] 1 ชั้น (ซ้อนทับได้มากสุด 3 ชั้น) ต่อเนื่อง 15 วินาที และเมื่อเกิดซ้ำ จะรีเฟรชช่วงเวลาต่อเนื่อง โดย [Astral] ทุก 1 ชั้นที่มี จะทำให้ตัวละครที่เข้าสนามผ่านทาง [ซัพพอร์ตอย่างรวดเร็ว] สร้างความเสียหายเพิ่มขึ้น 8% ซึ่งในเวลาเดียวกัน ทั้งทีมจะเกิดเอฟเฟกต์นี้ได้เพียงครั้งเดียว', 'https://rerollcdn.com/ZZZ/Drive/1/SuitAstralVoice.webp', 'ATK เพิ่มขึ้น 10%'),
(14, 'Branch & Blade Song', 'เมื่อการควบคุม Anomaly มากกว่าหรือเท่ากับ 115 แต้ม ผู้ใช้จะมี CRIT DMG เพิ่มขึ้น 30%;\r\nเมื่อตัวละครใดก็ตามในทีมทำให้ศัตรูติดเอฟเฟกต์ [แช่แข็ง] หรือทำให้เกิดเอฟเฟกต์ [น้ำแข็งแตก] ผู้ใช้จะมี CRIT Rate เพิ่มขึ้น 12% ต่อเนื่อง 15 วินาที', 'https://rerollcdn.com/ZZZ/Drive/1/SuitBranch&BladeSong.webp', 'CRIT DMG เพิ่มขึ้น 16%'),
(15, 'Proto Punk', 'เมื่อตัวละครใดก็ตามในทีมใช้ [ซัพพอร์ตตั้งรับ] หรือ [ซัพพอร์ตเมื่อหลบหลีก] ทั้งทีมจะสร้างความเสียหายเพิ่มขึ้น 15% ต่อเนื่อง 10 วินาที โดยที่เอฟเฟกต์พาสซีฟชื่อเดียวกัน จะไม่ซ้อนทับกัน', 'https://rerollcdn.com/ZZZ/Drive/1/SuitProtoPunk.webp', 'Shield ที่มอบให้เพิ่มขึ้น 15%'),
(16, 'Phaethon\'s Melody', 'When any squad member uses an EX Special Attack, the equipper\'s Anomaly Proficiency increases by 45 for 8s. If the character using the EX Special Attack is not the equipper, the equipper\'s Ether DMG is increased by 25%\r\n', 'https://rerollcdn.com/ZZZ/Drive/1/SuitPhaethon\'sMelody.webp', 'Anomaly Mastery +8%'),
(17, 'Shadow Harmony', 'Upon hitting an enemy with an Aftershock or Dash Attack, if the DMG dealt aligns with the equipper\'s attribute, the equipper gains 1 stack of a buff effect, at most once per use of a skill. For each stack, the equipper\'s ATK increases by 4%, and CRIT Rate increases by 4%. The effect can stack up to 3 times and lasts for 15s. Repeated triggers reset the duration', 'https://rerollcdn.com/ZZZ/Drive/1/SuitShadowHarmony.webp', 'The DMG of Aftershocks and Dash Attacks is increased by 15%'),
(18, 'Chaos Jazz', 'Fire DMG and Electric DMG are increased by 15%. When off-field, DMG dealt by EX Special Attacks and Assist Attacks is increased by 20%. When the character switches back onto the field, this buff continues for 5s. The lasting effect can be triggered once every 7.55', 'https://rerollcdn.com/ZZZ/Drive/1/SuitChaosJazz.webp', 'Increases Anomaly Proficiency by 30');

-- --------------------------------------------------------

--
-- Table structure for table `RecommendedBuild`
--

CREATE TABLE `RecommendedBuild` (
  `id` int NOT NULL,
  `characterId` int NOT NULL,
  `wEngineId` int NOT NULL,
  `diskDriveId` int NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `RecommendedBuild`
--

INSERT INTO `RecommendedBuild` (`id`, `characterId`, `wEngineId`, `diskDriveId`, `description`) VALUES
(2, 1, 12, 1, 'ฉลามดุ');

-- --------------------------------------------------------

--
-- Table structure for table `WEngine`
--

CREATE TABLE `WEngine` (
  `id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainStat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `effect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `WEngine`
--

INSERT INTO `WEngine` (`id`, `name`, `rank`, `mainStat`, `effect`, `imageUrl`) VALUES
(1, 'Heartstring Nocturne', 'S-Rank', 'CRIT Rate', 'CRIT DMG เพิ่มขึ้น 50%/57.5%/65%/72.5%/80%; เมื่อผู้ใช้เข้าสู่การต่อสู้ หรือใช้ [สกิลต่อเนื่อง] หรือ [สกิลอัลติเมท] จะได้รับ [Heartstring] 1 ชั้น ซึ่ง [Heartstring] แต่ละชั้น จะทำให้ [สกิลต่อเนื่อง] และ [สกิลอัลติเมท] ของผู้ใช้มองข้าม 12.5%/14.5%/16.5%/18.5%/20% ของความต้านทานความเสียหายไฟของเป้าหมาย โดยจะซ้อนทับได้มากสุด 2 ชั้น ต่อเนื่อง 30 วินาที และเมื่อเกิดซ้ำ จะรีเฟรชช่วงเวลาต่อเนื่อง', 'https://rerollcdn.com/ZZZ/Engine/heartstring_nocturne.png'),
(2, 'Zanshin Herb Case', 'S-Rank', 'CRIT DMG', 'CRIT Rate เพิ่มขึ้น 10%/11.5%/13%/14.5%/16%; [พุ่งโจมตี] สร้างความเสียหายธาตุไฟฟ้าเพิ่มขึ้น 40%/46%/52%/58%/64%; เมื่อตัวละครใดก็ตามในทีม ทำให้ศัตรูติดเอฟเฟกต์ Attribute Anomaly หรือทำให้เกิดการสตั๊น ผู้ใช้จะมี CRIT Rate เพิ่มขึ้นอีก 10%/11.5%/13%/14.5%/16% ต่อเนื่อง 15 วินาที', 'https://rerollcdn.com/ZZZ/Engine/zanshin_herb_case.png'),
(3, 'Hailstorm Shrine', 'S-Rank', 'CRIT Rate', 'CRIT DMG เพิ่มขึ้น 50%/57%/65%/72%/80%; เมื่อใช้ [สกิลพิเศษ-EX] หรือเมื่อตัวละครใดก็ตามในทีม ทำให้ศัตรูติดเอฟเฟกต์ Attribute Anomaly ผู้ใช้จะสร้างความเสียหายธาตุน้ำแข็งเพิ่มขึ้น 20%/23%/26%/29%/32% โดยจะซ้อนทับได้มากสุด 2 ชั้น ต่อเนื่อง 15 วินาที และเอฟเฟกต์ในแต่ละชั้น จะคำนวณช่วงเวลาต่อเนื่องแยกกัน', 'https://rerollcdn.com/ZZZ/Engine/hailstorm_shrine.png'),
(4, 'Blazing Laurel', 'S-Rank', 'Impact', 'เมื่อใช้ [ซัปพอร์ตอย่างรวดเร็ว] หรือ [ซัปพอร์ตสมบูรณ์] ผู้ใช้จะมี Impact เพิ่มขึ้น 25%/28.75%/32.5%/36.25%/40% ต่อเนื่อง 8 วินาที; เมื่อผู้ใช้ปล่อยการ [โจมตีปกติ] ถูกศัตรู จะมอบ [Wilt] หนึ่งชั้นให้แก่เป้าหมาย โดยจะซ้อนทับได้มากสุด 20 ชั้น ต่อเนื่อง 30 วินาที และเมื่อเกิดซ้ำ จะรีเฟรชช่วงเวลาต่อเนื่อง; เมื่อตัวละครใดก็ตามในทีมโจมตีถูกศัตรู [Wilt] ทุกหนึ่งชั้นที่เป้าหมายมี จะทำให้ความเสียหายธาตุน้ำแข็ง และความเสียหายธาตุไฟของการโจมตีในครั้งนี้มี CRIT DMG เพิ่มขึ้น 2%/2.3%/2.6%/2.9%/3.2% โดยที่ในเวลาเดียวกัน ทั้งทีมจะเกิดเอฟเฟกต์นี้ได้เพียงครั้งเดียว', 'https://rerollcdn.com/ZZZ/Engine/blazing_laurel.png'),
(5, 'Flamemaker Shaker', 'S-Rank', 'ATK %', 'เมื่ออยู่นอกสนาม ผู้ใช้จะมีการฟื้นฟูพลังงานเพิ่มขึ้น 0.6/0.75/0.9/1.05/1.2 แต้ม/วินาที; เมื่อ [สกิลพิเศษ-EX] หรือ [การโจมตีซัปพอร์ต] ถูกศัตรู ผู้ใช้จะสร้างความเสียหายเพิ่มขึ้น 3.5%/4.4%/5.2%/6.1%/7% โดยจะซ้อนทับได้มากสุด 10 ชั้น ต่อเนื่อง 6 วินาที ใน 0.3 วินาที จะเกิดขึ้นได้มากสุดหนึ่งครั้ง ซึ่งเมื่ออยู่นอกสนาม ประสิทธิภาพการซ้อนทับจะเพิ่มเป็นสองเท่า และเมื่อเกิดซ้ำ จะรีเฟรชช่วงเวลาต่อเนื่อง; เมื่อได้รับเอฟเฟกต์เพิ่มความเสียหาย หากจำนวนชั้นการซ้อนทับมีมากกว่าหรือเท่ากับ 5 ชั้น ผู้ใช้จะมีความชำนาญ Anomaly เพิ่มขึ้นอีก 50/62/75/87/100 แต้ม (เอฟเฟกต์เพิ่มความชำนาญ Anomaly ไม่สามารถซ้อนทับได้) ต่อเนื่อง 6 วินาที', 'https://rerollcdn.com/ZZZ/Engine/flamemaker_shaker.png'),
(6, 'Timeweaver', 'S-Rank', 'ATK %', 'ผู้ใช้มีประสิทธิภาพการสะสม Electric Anomaly เพิ่มขึ้น 30％/35%/40%/45%/50%; เมื่อ [สกิลพิเศษ] หรือ [สกิลพิเศษ-EX] ถูกศัตรูที่อยู่ในสถานะ Attribute Anomaly ผู้ใช้จะมีความชำนาญ Anomaly เพิ่มขึ้น 75/85/95/105/115 แต้ม ต่อเนื่อง 15 วินาที; เมื่อผู้ใช้มีความชำนาญ Anomaly มากกว่าหรือเท่ากับ 375 แต้ม ผู้ใช้จะสร้างความเสียหาย [โกลาหล] เพิ่มขึ้น 25％/27.5%/30%/32.5%/35%', 'https://rerollcdn.com/ZZZ/Engine/timeweaver.png'),
(7, 'Sharpened Stinger', 'S-Rank', 'ความชำนาญ Anomaly', 'เมื่อใช้การ [พุ่งโจมตี] จะได้รับ [Predatory Instinct] 1 ชั้น ซึ่ง [Predatory Instinct] แต่ละชั้น จะทำให้ผู้ใช้สร้างความเสียหายกายภาพเพิ่มขึ้น 12%/15%/18%/21%/24% (ซ้อนทับได้มากสุด 3 ชั้น) ต่อเนื่อง 10 วินาที โดยที่ใน 0.5 วินาที จะเกิดขึ้นได้มากสุดหนึ่งครั้ง และเมื่อเกิดซ้ำ จะรีเฟรชช่วงเวลาต่อเนื่อง; เมื่อเข้าสู่สถานะต่อสู้ หรือทำให้เกิด [หลบหลีกสมบูรณ์] จะได้รับ [Predatory Instinct] 3 ชั้นโดยทันที; หลังจากที่ [Predatory Instinct] ซ้อนทับถึงจำนวนชั้นสูงสุด ผู้ใช้จะมีประสิทธิภาพการสะสม Attribute Anomaly เพิ่มขึ้น 40%/50%/60%/70%/80%', 'https://rerollcdn.com/ZZZ/Engine/sharpened_stinger.png'),
(8, 'Tusks of Fury', 'S-Rank', 'Impact', 'ผู้ใช้มอบ Shield เพิ่มขึ้น 30%/38%/46%/52%/60%; เมื่อตัวละครใดก็ตามในทีม ทำให้เกิด [Interrupt] หรือ [หลบหลีกสมบูรณ์] ทั้งทีมจะสร้างความเสียหายเพิ่มขึ้น 18%/22.5%/27%/31.5%/36% และสร้าง Daze เพิ่มขึ้น 12%/15%/18%/21%/24% ต่อเนื่อง 20 วินาที ซึ่งเอฟเฟกต์พาสซีฟชื่อเดียวกัน จะไม่ซ้อนทับกัน', 'https://rerollcdn.com/ZZZ/Engine/tusks_of_fury.png'),
(9, 'Ice-Jade Teapot', 'S-Rank', 'Impact', 'เมื่อการ [โจมตีปกติ] ถูกศัตรู จะได้รับ [Tea-riffic] 1 ชั้น โดยที่ [Tea-riffic] แต่ละชั้น จะทำให้ผู้ใช้มี Impact เพิ่มขึ้น 0.7%/0.88%/1.05%/1.22%/1.4% (ซ้อนทับได้สูงสุด 30 ชั้น) ต่อเนื่อง 8 วินาที ซึ่งเอฟเฟกต์ในแต่ละชั้น จะคำนวณช่วงเวลาต่อเนื่องแยกกัน; เมื่อได้รับ [Tea-riffic] หากผู้ใช้มีจำนวนชั้นของ [Tea-riffic] มากกว่า หรือเท่ากับ 15 ชั้น ทั้งทีมจะสร้างความเสียหายเพิ่มขึ้น 20%/23%/26%/29%/32% ต่อเนื่อง 10 วินาที โดยที่เอฟเฟกต์พาสซีฟชื่อเดียวกัน จะไม่ซ้อนทับกัน', 'https://rerollcdn.com/ZZZ/Engine/ice-jade_teapot.png'),
(10, 'Riot Suppressor Mark VI', 'S-Rank', 'CRIT DMG', 'ความเสียหายอีเทอร์เพิ่มขึ้น 25%; เมื่อปล่อย [สกิลพิเศษ-EX] ผู้ใช้จะได้รับเอฟเฟกต์ Charge 8 ชั้น (ซ้อนทับมากสุด 8 ชั้น); เมื่อการ [โจมตีปกติ] หรือการ [พุ่งโจมตี] ทำให้เกิดความเสียหายอีเทอร์ จะใช้ Charge 1 ชั้น เพื่อทำให้การโจมตีในขณะนั้น สร้างความเสียหายเพิ่มขึ้น 45%', 'https://rerollcdn.com/ZZZ/Engine/riot_suppressor_mark_vi.png'),
(11, 'Fusion Complier', 'S-Rank', 'PEN Ratio', 'ความเสียหายธาตุไฟฟ้าเพิ่มขึ้น [21]%; เมื่อใช้ [สกิลพิเศษ] หรือ [สกิลพิเศษ-EX] ผู้ใช้จะมีความชำนาญ Anomaly เพิ่มขึ้น [43] แต้ม (ซ้อนทับมากสุด 3 ชั้น) ต่อเนื่อง [8] วินาที และเอฟเฟกต์ในแต่ละชั้น จะคำนวณช่วงเวลาต่อเนื่องแยกกัน', 'https://rerollcdn.com/ZZZ/Engine/fusion_compiler.png'),
(12, 'Deep Sea Visitor', 'S-Rank', 'CRIT Rate', 'ความเสียหายธาตุน้ำแข็งเพิ่มขึ้น 25%/31.5%/38%/44.5%/50%; เมื่อการ [โจมตีปกติ] ถูกศัตรู CRIT Rate ของผู้ใช้จะเพิ่มขึ้น 10%/12.5%/15%/17.5%/20% ต่อเนื่อง 8 วินาที; เมื่อการ [พุ่งโจมตี] ทำให้เกิดความเสียหายธาตุน้ำแข็ง CRIT Rate ของผู้ใช้จะเพิ่มขึ้นอีก 10%/12.5%/15%/17.5%/20% ต่อเนื่อง 15 วินาที โดยที่เอฟเฟกต์บัฟแต่ละชนิด จะคำนวณช่วงเวลาต่อเนื่องแยกกัน', 'https://rerollcdn.com/ZZZ/Engine/deep_sea_visitor.png'),
(13, 'Weeping Cradle', 'S-Rank', 'PEN Ratio', 'เมื่ออยู่นอกสนาม การฟื้นฟูพลังงานจะเพิ่มขึ้น 0.6 แต้ม/วินาที; เมื่อสร้างความเสียหายธาตุไฟฟ้า ทั้งทีมจะสร้างความเสียหายต่อเป้าหมายเพิ่มขึ้น 15% ต่อเนื่อง 3 วินาที; ระหว่างช่วงเวลาต่อเนื่องของเอฟเฟกต์ ในทุก 0.5 วินาที เอฟเฟกต์บัฟนี้จะเพิ่มขึ้นอีก 2.5%% (เพิ่มขึ้นอีกได้มากสุด 15%) โดยเมื่อเกิดซ้ำ จะรีเฟรชช่วงเวลาต่อเนื่องเท่านั้น ไม่รีเฟรชเอฟเฟกต์เพิ่มความเสียหาย และเอฟเฟกต์พาสซีฟชื่อเดียวกัน จะไม่ซ้อนทับกัน', 'https://rerollcdn.com/ZZZ/Engine/weeping_cradle.png'),
(14, 'Hellfire Gears', 'S-Rank', 'Impact', 'ความเสียหายธาตุไฟเพิ่มขึ้น [1.2]%; เมื่อใช้ [สกิลพิเศษ-EX] ผู้ใช้จะมี Impact เพิ่มขึ้น [20]% (ซ้อนทับมากสุด 2 ชั้น) ต่อเนื่อง [10] วินาที และเอฟเฟกต์ในแต่ละชั้น จะคำนวณช่วงเวลาต่อเนื่องแยกกัน', 'https://rerollcdn.com/ZZZ/Engine/hellfire_gears.png'),
(15, 'The Restrained', 'S-Rank', 'Impact', 'ความเสียหายธาตุน้ำแข็งเพิ่มขึ้น [12]%; การ [โจมตีปกติ] สร้างความเสียหายและ Daze เพิ่มขึ้น [12]%', 'https://rerollcdn.com/ZZZ/Engine/the_restrained.png'),
(16, 'Steel Cushion', 'S-Rank', 'CRIT Rate', 'ความเสียหายกายภาพเพิ่มขึ้น [40]%; เมื่อโจมตีถูกศัตรูจากทางด้านหลัง ผู้ใช้จะสร้างความเสียหายเพิ่มขึ้น [50]%', 'https://rerollcdn.com/ZZZ/Engine/steel_cushion.png'),
(17, 'The Brimstone', 'S-Rank', 'ATK %', 'ความเสียหายธาตุไฟเพิ่มขึ้น [6]%; เมื่อการ [โจมตีปกติ], [พุ่งโจมตี] หรือ [หลบหลีกสวนกลับ] ถูกศัตรู ผู้ใช้จะมี ATK เพิ่มขึ้น [6]% (ซ้อนทับมากสุด 8 ชั้น) ต่อเนื่อง [8] วินาที โดยภายใน [0.5] วินาที จะเกิดขึ้นได้มากสุดหนึ่งครั้ง ซึ่งเอฟเฟกต์ในแต่ละชั้น จะคำนวณช่วงเวลาต่อเนื่องแยกกัน', 'https://rerollcdn.com/ZZZ/Engine/the_brimstone.png'),
(18, 'Roaring Ride', 'A-Rank', 'ATK %', 'เมื่อ [สกิลพิเศษ-EX] ถูกศัตรู จะสุ่มทำให้เกิด 1 ใน 3 ประเภทของเอฟเฟกต์ต่อไปนี้ ต่อเนื่อง 5 วินาที โดยที่ใน 0.3 วินาที จะเกิดขึ้นได้มากสุดหนึ่งครั้ง, เอฟเฟกต์ประเภทเดียวกันจะไม่ซ้อนทับกัน, เมื่อเกิดซ้ำ จะรีเฟรชช่วงเวลาต่อเนื่อง และสามารถมีหลายเอฟเฟกต์ในช่วงเวลาเดียวกันได้: ATK ของผู้ใช้เพิ่มขึ้น 8%/9.2%/10.4%/11.6%/12.8%; ความชำนาญ Anomaly ของผู้ใช้เพิ่มขึ้น 40/46/52/58/64 แต้ม; ประสิทธิภาพการสะสม Attribute Anomaly ของผู้ใช้เพิ่มขึ้น 25%/28%/32%/36%/40%', 'https://rerollcdn.com/ZZZ/Engine/roaring_ride.png'),
(19, 'Bashful Demon', 'A-Rank', 'ATK %', 'ความเสียหายธาตุน้ำแข็งเพิ่มขึ้น [22]%; เมื่อปล่อย [สกิลพิเศษ-EX] ทั้งทีมจะมี ATK เพิ่มขึ้น [2.9]% (ซ้อนทับมากสุด 4 ชั้น) ต่อเนื่อง [12] วินาที ซึ่งเมื่อเกิดซ้ำ จะรีเฟรชช่วงเวลาต่อเนื่อง และเอฟเฟกต์พาสซีฟชื่อเดียวกัน จะไม่ซ้อนทับกัน', 'https://rerollcdn.com/ZZZ/Engine/bashful_demon.png'),
(20, 'Starlight Engine Replica', 'A-Rank', 'ATK %', 'เมื่อการ [โจมตีปกติ] หรือการ [พุ่งโจมตี] ถูกศัตรูที่อยู่ไกลเกิน 6 เมตร ผู้ใช้จะสร้างความเสียหายกายภาพ ต่อเป้าหมายเพิ่มขึ้น [57.5]% ต่อเนื่อง [8] วินาที', 'https://rerollcdn.com/ZZZ/Engine/starlight_engine_replica.png'),
(21, 'Drill Rig - Red Axis', 'A-Rank', 'การฟื้นฟูพลังงาน', 'เมื่อใช้ [สกิลพิเศษ-EX] การ [โจมตีปกติ] และการ [พุ่งโจมตี] จะสร้างความเสียหายธาตุไฟฟ้าเพิ่มขึ้น [80]% ต่อเนื่อง [10] วินาที โดยภายใน [15] วินาที จะเกิดขึ้นได้มากสุดหนึ่งครั้ง', 'https://rerollcdn.com/ZZZ/Engine/drill_rig_-_red_axis.png'),
(22, 'The Vault', 'A-Rank', 'การฟื้นฟูพลังงาน', 'เมื่อ [สกิลพิเศษ-EX], [สกิลต่อเนื่อง] หรือ [สกิลอัลติเมท] สร้างความเสียหายอีเทอร์ ทั้งทีมจะสร้างความเสียหายต่อเป้าหมายเพิ่มขึ้น [24]% และการฟื้นฟูพลังงานของผู้ใช้ จะเพิ่มขึ้น [0.8] แต้ม/วินาที ต่อเนื่อง [2] วินาที โดยที่เอฟเฟกต์พาสซีฟชื่อเดียวกัน จะไม่ซ้อนทับกัน', 'https://rerollcdn.com/ZZZ/Engine/the_vault.png'),
(23, 'Housekeeper', 'A-Rank', 'ATK %', 'เมื่ออยู่นอกสนาม การฟื้นฟูพลังงานจะเพิ่มขึ้น [0.72] แต้ม/วินาที; เมื่อ [สกิลพิเศษ-EX] ถูกศัตรู ผู้ใช้จะสร้างความเสียหายกายภาพเพิ่มขึ้น [4.8]% โดยจะซ้อนทับได้มากสุด 15 ชั้น ต่อเนื่อง [1] วินาที และเมื่อเกิดซ้ำ จะรีเฟรชช่วงเวลาต่อเนื่อง', 'https://rerollcdn.com/ZZZ/Engine/housekeeper.png'),
(24, 'Demara Battery Mark II', 'S-Rank', 'Impact', 'Increases Electric DMG by 24%. When the equipper hits an enemy with a Dodge Counter or Assist Attack, their Energy Generation Rate increases by 27.5% for 8s.', 'https://rerollcdn.com/ZZZ/Engine/demara_battery_mark_ii.png'),
(26, 'Kaboom the Cannon', 'A-Rank', 'Energy Regen', 'When any friendly unit in the squad attacks and hits an enemy, all friendly units\' ATK increases by 3.6% for 8s, stacking up to 4 times. The duration of each stack is calculated separately, and each friendly unit can provide 1 stack of the buff. Passive effects of the same name do not stack.', 'https://rerollcdn.com/ZZZ/Engine/kaboom_the_cannon.png');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('0ef63b30-bf77-4804-84ba-bddf78833648', '8f008b3999f6aec30297927a8711d95a6c48f70bdcd15ee785954003b6dbf659', '2025-03-24 12:52:15.636', '20250324125215_add_image_url', NULL, NULL, '2025-03-24 12:52:15.543', 1),
('cdc65102-69c1-428e-a49e-0990c1943c61', '5ec145553f4ae3cda7a0b50390fb3a48654f150c38bd16dfd5c3eeb38b66f2fe', '2025-03-24 12:24:45.271', '20250324122445_add_table', NULL, NULL, '2025-03-24 12:24:45.130', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Character`
--
ALTER TABLE `Character`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Character_name_key` (`name`);

--
-- Indexes for table `DiskDrive`
--
ALTER TABLE `DiskDrive`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `DiskDrive_name_key` (`name`);

--
-- Indexes for table `RecommendedBuild`
--
ALTER TABLE `RecommendedBuild`
  ADD PRIMARY KEY (`id`),
  ADD KEY `RecommendedBuild_characterId_fkey` (`characterId`),
  ADD KEY `RecommendedBuild_wEngineId_fkey` (`wEngineId`),
  ADD KEY `RecommendedBuild_diskDriveId_fkey` (`diskDriveId`);

--
-- Indexes for table `WEngine`
--
ALTER TABLE `WEngine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `WEngine_name_key` (`name`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Character`
--
ALTER TABLE `Character`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `DiskDrive`
--
ALTER TABLE `DiskDrive`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `RecommendedBuild`
--
ALTER TABLE `RecommendedBuild`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `WEngine`
--
ALTER TABLE `WEngine`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `RecommendedBuild`
--
ALTER TABLE `RecommendedBuild`
  ADD CONSTRAINT `RecommendedBuild_characterId_fkey` FOREIGN KEY (`characterId`) REFERENCES `Character` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `RecommendedBuild_diskDriveId_fkey` FOREIGN KEY (`diskDriveId`) REFERENCES `DiskDrive` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `RecommendedBuild_wEngineId_fkey` FOREIGN KEY (`wEngineId`) REFERENCES `WEngine` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
