const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const WEngineController = {
  createWEngine: async (req, res) => {
    try {
      const { name, rank, mainStat, effect, imageUrl } = req.body;
      const wEngine = await prisma.wEngine.create({
        data: {
          name,
          rank,
          mainStat,
          effect,
          imageUrl: imageUrl || '', // ถ้าไม่มี imageUrl ให้ใช้ค่าว่าง
        },
      });
      res.status(201).json(wEngine);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการสร้าง W-Engine' });
    }
  },

  getAllWEngines: async (req, res) => {
    try {
      const wEngines = await prisma.wEngine.findMany();
      res.status(200).json(wEngines);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการดึงข้อมูล W-Engines' });
    }
  },

  getWEngineById: async (req, res) => {
    try {
      const wEngine = await prisma.wEngine.findUnique({
        where: { id: parseInt(req.params.id) },
      });
      if (!wEngine) return res.status(404).json({ error: 'ไม่พบ W-Engine' });
      res.status(200).json(wEngine);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการดึงข้อมูล W-Engine' });
    }
  },

  updateWEngine: async (req, res) => {
    try {
      const { name, rank, mainStat, effect, imageUrl } = req.body;
      const wEngine = await prisma.wEngine.findUnique({
        where: { id: parseInt(req.params.id) },
      });
      if (!wEngine) return res.status(404).json({ error: 'ไม่พบ W-Engine' });

      const updatedWEngine = await prisma.wEngine.update({
        where: { id: parseInt(req.params.id) },
        data: {
          name,
          rank,
          mainStat,
          effect,
          imageUrl: imageUrl || wEngine.imageUrl, // ถ้าไม่มี imageUrl ใหม่ ให้ใช้ค่าเดิม
        },
      });
      res.status(200).json(updatedWEngine);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการอัปเดต W-Engine' });
    }
  },

  deleteWEngine: async (req, res) => {
    try {
      await prisma.wEngine.delete({ where: { id: parseInt(req.params.id) } });
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ W-Engine' });
    }
  },
};

module.exports = WEngineController;