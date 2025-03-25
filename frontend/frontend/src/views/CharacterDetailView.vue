<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-white mb-8">
        รายละเอียดตัวละคร
      </h1>
      <v-row v-if="error" class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-red-lighten-2">{{ error }}</p>
          <v-btn color="blue-lighten-2" dark @click="goBack">
            กลับไปยังรายชื่อตัวละคร
          </v-btn>
        </v-col>
      </v-row>
      <v-row v-else-if="isLoading" class="justify-center">
        <v-col cols="12" class="text-center">
          <v-progress-circular
            indeterminate
            color="blue-lighten-2"
            size="50"
          ></v-progress-circular>
          <p class="text-h6 text-grey-lighten-2 mt-2">กำลังโหลดข้อมูล...</p>
        </v-col>
      </v-row>
      <v-row v-else-if="character">
        <v-col cols="12" md="6" class="d-flex justify-center">
          <v-img
            :src="character.imageUrl || 'https://via.placeholder.com/300'"
            :alt="character.name || 'ตัวละคร'"
            class="rounded-lg character-image"
            max-width="400"
            max-height="500"
          ></v-img>
        </v-col>
        <v-col cols="12" md="6">
          <v-card
            color="grey-darken-3"
            class="pa-6 elevation-8 rounded-lg character-detail-card"
          >
            <v-card-title class="text-h4 font-weight-bold text-blue-lighten-2">
              {{ character.name || "ไม่มีชื่อ" }}
            </v-card-title>
            <v-card-text class="text-grey-lighten-2">
              <p class="text-h6">
                <strong>Faction:</strong> {{ character.faction || "-" }}
              </p>
              <p class="text-h6">
                <strong>Element:</strong> {{ character.element || "-" }}
              </p>
              <p class="text-h6">
                <strong>Role:</strong> {{ character.role || "-" }}
              </p>
              <p class="text-h6">
                <strong>Rank:</strong> {{ character.rank || "-" }}
              </p>
              <p class="text-h6">
                <strong>Attack Type:</strong> {{ character.attackType || "-" }}
              </p>
            </v-card-text>
            <v-card-actions>
              <v-btn
                color="blue-lighten-2"
                dark
                @click="editCharacter(character.id)"
              >
                แก้ไข
              </v-btn>
              <v-btn
                color="green-lighten-2"
                dark
                @click="createBuild(character.id)"
                class="ml-2"
              >
                สร้าง Build
              </v-btn>
              <v-btn color="grey-lighten-2" dark @click="goBack" class="ml-2">
                กลับ
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
      <v-row v-else class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-grey-lighten-2">ไม่พบตัวละครนี้ในระบบ</p>
          <v-btn color="blue-lighten-2" dark @click="goBack">
            กลับไปยังรายชื่อตัวละคร
          </v-btn>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import axios from "axios";
import { useRouter, useRoute } from "vue-router";

export default {
  name: "CharacterDetailView",
  setup() {
    const router = useRouter();
    const route = useRoute();
    return { router, route };
  },
  data() {
    return {
      character: null,
      isLoading: false,
      error: null,
    };
  },
  mounted() {
    this.fetchCharacter();
  },
  methods: {
    async fetchCharacter() {
      this.isLoading = true;
      this.error = null;
      const characterId = this.route.params.id;
      console.log("Fetching character with ID:", characterId);
      try {
        const response = await axios.get(
          `http://localhost:8800/api/character/${characterId}`
        );
        console.log("API Response in CharacterDetailView:", response.data);
        this.character = response.data;
        console.log("Set character:", this.character);
        if (!this.character) {
          this.error = "ไม่พบตัวละคร กรุณาตรวจสอบ ID หรือลองใหม่";
        }
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการดึงข้อมูลตัวละคร:", error);
        if (error.response) {
          this.error = `เกิดข้อผิดพลาด: ${error.response.status} - ${error.response.data.error || error.message}`;
        } else if (error.request) {
          this.error = "ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้ กรุณาตรวจสอบว่าเซิร์ฟเวอร์ทำงานอยู่ และตั้งค่า CORS ถูกต้อง";
        } else {
          this.error = "เกิดข้อผิดพลาดในการดึงข้อมูล: " + error.message;
        }
      } finally {
        this.isLoading = false;
      }
    },
    editCharacter(characterId) {
      this.router.push(`/character/${characterId}/edit`);
    },
    createBuild(characterId) {
      this.router.push(`/character/${characterId}/build`);
    },
    goBack() {
      this.router.push("/characters");
    },
  },
};
</script>

<style scoped>
.character-detail-card {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.character-detail-card:hover {
  transform: scale(1.02);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.character-image {
  object-fit: cover;
  border: 2px solid #1976d2;
}
</style>