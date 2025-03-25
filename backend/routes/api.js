const express = require('express');
const rateLimit = require('express-rate-limit');

// กำหนด rate limit: 100 คำขอใน 3 นาที
const apiLimit = rateLimit({
  windowMs: 1000 * 60 * 3, // 3 นาที
  max: 100,
  message: 'คุณส่งคำขอมากเกินไปจาก IP นี้ กรุณาลองใหม่หลังจาก 3 นาที',
});

const router = express.Router();

// นำเข้า controllers
const CharacterController = require('../controllers/CharacterController');
const WEngineController = require('../controllers/WEngineController');
const DiskDriveController = require('../controllers/DiskDriveController');
const RecommendBuildController = require('../controllers/RecommendBuildController');

// Routes สำหรับข้อมูลเกม Zenless Zone Zero
// Character (CharacterController)
router.post('/character', apiLimit, CharacterController.createCharacter);
router.get('/characters', CharacterController.getAllCharacters);
router.get('/character/:id', CharacterController.getCharacterById);
router.put('/character/:id', CharacterController.updateCharacter);
router.delete('/character/:id', CharacterController.deleteCharacter);

// W-Engine (WEngineController)
router.post('/w-engine', apiLimit, WEngineController.createWEngine);
router.get('/w-engines', WEngineController.getAllWEngines);
router.get('/w-engine/:id', WEngineController.getWEngineById);
router.put('/w-engine/:id', WEngineController.updateWEngine);
router.delete('/w-engine/:id', WEngineController.deleteWEngine);

// Disk Drive (DiskDriveController)
router.post('/disk-drive', apiLimit, DiskDriveController.createDiskDrive);
router.get('/disk-drives', DiskDriveController.getAllDiskDrives);
router.get('/disk-drive/:id', DiskDriveController.getDiskDriveById);
router.put('/disk-drive/:id', DiskDriveController.updateDiskDrive);
router.delete('/disk-drive/:id', DiskDriveController.deleteDiskDrive);

// Recommended Build (RecommendBuildController)
router.post('/recommendation', apiLimit, RecommendBuildController.createRecommendation);
router.get('/recommendations', RecommendBuildController.getAllRecommendations);
router.get('/recommendation/:id', RecommendBuildController.getRecommendationById);
router.get('/recommendations/character/:characterId', RecommendBuildController.getRecommendationsByCharacter);
router.put('/recommendation/:id', RecommendBuildController.updateRecommendation);
router.delete('/recommendation/:id', RecommendBuildController.deleteRecommendation);

module.exports = router;