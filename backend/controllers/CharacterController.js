const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const CharacterController = {
  createCharacter: async (req, res) => {
    try {
      const { name, element, role, faction, rank, attackType, imageUrl } = req.body;
      const character = await prisma.character.create({
        data: {
          name,
          element,
          role,
          faction,
          rank,
          attackType,
          imageUrl: imageUrl || '', // ถ้าไม่มี imageUrl ให้ใช้ค่าว่าง
        },
      });
      res.status(201).json(character);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการสร้างตัวละคร' });
    }
  },

  getAllCharacters: async (req, res) => {
    try {
      // ดึงพารามิเตอร์ role และ elements จาก query
      const { role, elements } = req.query;

      // สร้างเงื่อนไข where สำหรับการกรอง
      const where = {};
      if (role && role !== '') {
        where.role = role;
      }
      if (elements) {
        // ถ้า elements เป็น string (เช่น "Ice") ให้แปลงเป็น array
        const elementsArray = Array.isArray(elements) ? elements : [elements];
        if (elementsArray.length > 0) {
          where.element = { in: elementsArray }; // ใช้ in เพื่อกรอง element ที่อยู่ใน array
        }
      }

      // ดึงข้อมูลตัวละครทั้งหมดตามเงื่อนไข
      const characters = await prisma.character.findMany({
        where,
      });

      // ส่ง Response กลับเป็น array ของตัวละคร
      res.status(200).json(characters);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการดึงข้อมูลตัวละคร' });
    }
  },

  getCharacterById: async (req, res) => {
    try {
      const character = await prisma.character.findUnique({
        where: { id: parseInt(req.params.id) },
      });
      if (!character) return res.status(404).json({ error: 'ไม่พบตัวละคร' });
      res.status(200).json(character);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการดึงข้อมูลตัวละคร' });
    }
  },

  updateCharacter: async (req, res) => {
    try {
      const { name, element, role, faction, rank, attackType, imageUrl } = req.body;
      const character = await prisma.character.findUnique({
        where: { id: parseInt(req.params.id) },
      });
      if (!character) return res.status(404).json({ error: 'ไม่พบตัวละคร' });

      const updatedCharacter = await prisma.character.update({
        where: { id: parseInt(req.params.id) },
        data: {
          name,
          element,
          role,
          faction,
          rank,
          attackType,
          imageUrl: imageUrl || character.imageUrl, // ถ้าไม่มี imageUrl ใหม่ ให้ใช้ค่าเดิม
        },
      });
      res.status(200).json(updatedCharacter);
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการอัปเดตตัวละคร' });
    }
  },

  deleteCharacter: async (req, res) => {
    try {
      const character = await prisma.character.findUnique({
        where: { id: parseInt(req.params.id) },
      });
      if (!character) return res.status(404).json({ error: 'ไม่พบตัวละคร' });

      await prisma.character.delete({ where: { id: parseInt(req.params.id) } });
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบตัวละคร' });
    }
  },
};

module.exports = CharacterController;