const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const RecommendBuildController = {
  createRecommendation: async (req, res) => {
    try {
      const recommendation = await prisma.recommendedBuild.create({
        data: req.body,
      });
      res.status(201).json(recommendation);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการสร้าง Recommended Build' });
    }
  },

  getAllRecommendations: async (req, res) => {
    try {
      const recommendations = await prisma.recommendedBuild.findMany({
        include: {
          character: true, // ดึงข้อมูลตัวละคร รวมถึง imageUrl
          wEngine: true,   // ดึงข้อมูล W-Engine รวมถึง imageUrl
          diskDrive: true, // ดึงข้อมูล Disk Drive รวมถึง imageUrl
        },
      });
      res.status(200).json(recommendations);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการดึงข้อมูล Recommended Builds' });
    }
  },

  getRecommendationById: async (req, res) => {
    try {
      const recommendation = await prisma.recommendedBuild.findUnique({
        where: { id: parseInt(req.params.id) },
        include: {
          character: true, // ดึงข้อมูลตัวละคร รวมถึง imageUrl
          wEngine: true,   // ดึงข้อมูล W-Engine รวมถึง imageUrl
          diskDrive: true, // ดึงข้อมูล Disk Drive รวมถึง imageUrl
        },
      });
      if (!recommendation) return res.status(404).json({ error: 'ไม่พบ Recommended Build' });
      res.status(200).json(recommendation);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการดึงข้อมูล Recommended Build' });
    }
  },

  getRecommendationsByCharacter: async (req, res) => {
    try {
      const recommendations = await prisma.recommendedBuild.findMany({
        where: { characterId: parseInt(req.params.characterId) },
        include: {
          character: true, // ดึงข้อมูลตัวละคร รวมถึง imageUrl
          wEngine: true,   // ดึงข้อมูล W-Engine รวมถึง imageUrl
          diskDrive: true, // ดึงข้อมูล Disk Drive รวมถึง imageUrl
        },
      });
      res.status(200).json(recommendations);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการดึงข้อมูล Recommended Builds' });
    }
  },

  updateRecommendation: async (req, res) => {
    try {
      const recommendation = await prisma.recommendedBuild.update({
        where: { id: parseInt(req.params.id) },
        data: req.body,
      });
      res.status(200).json(recommendation);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการอัปเดต Recommended Build' });
    }
  },

  deleteRecommendation: async (req, res) => {
    try {
      await prisma.recommendedBuild.delete({ where: { id: parseInt(req.params.id) } });
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ Recommended Build' });
    }
  },
};

module.exports = RecommendBuildController;