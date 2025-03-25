const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const DiskDriveController = {
  createDiskDrive: async (req, res) => {
    try {
      const { name, twoPieceBonus, fourPieceBonus, imageUrl } = req.body;
      const diskDrive = await prisma.diskDrive.create({
        data: {
          name,
          twoPieceBonus,
          fourPieceBonus,
          imageUrl: imageUrl || '', // ถ้าไม่มี imageUrl ให้ใช้ค่าว่าง
        },
      });
      res.status(201).json(diskDrive);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการสร้าง Disk Drive' });
    }
  },

  getAllDiskDrives: async (req, res) => {
    try {
      const diskDrives = await prisma.diskDrive.findMany();
      res.status(200).json(diskDrives);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการดึงข้อมูล Disk Drives' });
    }
  },

  getDiskDriveById: async (req, res) => {
    try {
      const diskDrive = await prisma.diskDrive.findUnique({
        where: { id: parseInt(req.params.id) },
      });
      if (!diskDrive) return res.status(404).json({ error: 'ไม่พบ Disk Drive' });
      res.status(200).json(diskDrive);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการดึงข้อมูล Disk Drive' });
    }
  },

  updateDiskDrive: async (req, res) => {
    try {
      const { name, twoPieceBonus, fourPieceBonus, imageUrl } = req.body;
      const diskDrive = await prisma.diskDrive.findUnique({
        where: { id: parseInt(req.params.id) },
      });
      if (!diskDrive) return res.status(404).json({ error: 'ไม่พบ Disk Drive' });

      const updatedDiskDrive = await prisma.diskDrive.update({
        where: { id: parseInt(req.params.id) },
        data: {
          name,
          twoPieceBonus,
          fourPieceBonus,
          imageUrl: imageUrl || diskDrive.imageUrl, // ถ้าไม่มี imageUrl ใหม่ ให้ใช้ค่าเดิม
        },
      });
      res.status(200).json(updatedDiskDrive);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการอัปเดต Disk Drive' });
    }
  },

  deleteDiskDrive: async (req, res) => {
    try {
      await prisma.diskDrive.delete({ where: { id: parseInt(req.params.id) } });
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ Disk Drive' });
    }
  },
};

module.exports = DiskDriveController;