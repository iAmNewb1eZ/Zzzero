<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-blue-lighten-2 mb-8">
        สร้าง Build สำหรับ {{ character?.name || "ตัวละคร" }}
      </h1>
      <v-row v-if="error" class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-red-lighten-2">{{ error }}</p>
          <v-btn color="blue-lighten-2" dark @click="goBack">
            กลับไปยังรายละเอียดตัวละคร
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
        <v-col cols="12">
          <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6">
            <v-card-text>
              <!-- แสดงข้อมูลตัวละคร -->
              <v-row class="mb-4">
                <v-col cols="12" md="4" class="d-flex justify-center">
                  <v-img
                    :src="character.imageUrl || 'https://via.placeholder.com/300'"
                    :alt="character.name || 'ตัวละคร'"
                    class="rounded-lg character-image"
                    max-width="200"
                    max-height="250"
                  ></v-img>
                </v-col>
                <v-col cols="12" md="8">
                  <h2 class="text-h5 font-weight-bold text-blue-lighten-2 mb-2">
                    {{ character.name }}
                  </h2>
                  <p class="text-grey-lighten-2">
                    <strong>Element:</strong> {{ character.element || "-" }}
                  </p>
                  <p class="text-grey-lighten-2">
                    <strong>Role:</strong> {{ character.role || "-" }}
                  </p>
                </v-col>
              </v-row>

              <!-- ฟอร์มสร้าง Build -->
              <v-select
                v-model="build.wEngineId"
                :items="wEngines"
                item-title="name"
                item-value="id"
                label="W-Engine"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
                :rules="[v => !!v || 'กรุณาเลือก W-Engine']"
              ></v-select>

              <v-select
                v-model="build.diskDriveId"
                :items="diskDrives"
                item-title="name"
                item-value="id"
                label="Disk Drives"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
                :rules="[v => !!v || 'กรุณาเลือก Disk Drives']"
              ></v-select>

              <v-textarea
                v-model="build.description"
                label="คำอธิบาย Build"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
                :rules="[v => !!v || 'กรุณากรอกคำอธิบาย Build']"
              ></v-textarea>

              <v-btn
                color="blue-lighten-2"
                dark
                @click="saveBuild"
                :disabled="!isFormValid"
                class="mt-4"
              >
                บันทึก Build
              </v-btn>
              <v-btn
                color="grey-lighten-2"
                dark
                @click="goBack"
                class="mt-4 ml-4"
              >
                กลับ
              </v-btn>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
      <v-row v-else class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-grey-lighten-2">ไม่พบตัวละครนี้ในระบบ</p>
          <v-btn color="blue-lighten-2" dark @click="goBack">
            กลับไปยังรายละเอียดตัวละคร
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
  name: "CharacterBuildView",
  setup() {
    const router = useRouter();
    const route = useRoute();
    return { router, route };
  },
  data() {
    return {
      character: null,
      build: {
        wEngineId: null,
        diskDriveId: null,
        description: "",
      },
      wEngines: [],
      diskDrives: [],
      isLoading: false,
      error: null,
    };
  },
  computed: {
    isFormValid() {
      return !!this.build.wEngineId && !!this.build.diskDriveId && !!this.build.description;
    },
  },
  mounted() {
    this.fetchCharacter();
    this.fetchWEngines();
    this.fetchDiskDrives();
  },
  methods: {
    async fetchCharacter() {
      this.isLoading = true;
      this.error = null;
      const characterId = this.route.params.id;
      console.log("Fetching character with ID for build:", characterId);
      try {
        const response = await axios.get(
          `http://localhost:8800/api/character/${characterId}`
        );
        console.log("API Response in CharacterBuildView:", response.data);
        this.character = response.data;
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
    async fetchWEngines() {
      try {
        const response = await axios.get("http://localhost:8800/api/w-engines");
        console.log("W-Engines fetched:", response.data);
        this.wEngines = response.data;
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการดึงข้อมูล W-Engines:", error);
        this.error = "ไม่สามารถดึงข้อมูล W-Engines ได้";
      }
    },
    async fetchDiskDrives() {
      try {
        const response = await axios.get("http://localhost:8800/api/disk-drives");
        console.log("Disk Drives fetched:", response.data);
        this.diskDrives = response.data;
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการดึงข้อมูล Disk Drives:", error);
        this.error = "ไม่สามารถดึงข้อมูล Disk Drives ได้";
      }
    },
    async saveBuild() {
      this.isLoading = true;
      this.error = null;
      try {
        const buildData = {
          characterId: parseInt(this.route.params.id),
          wEngineId: this.build.wEngineId,
          diskDriveId: this.build.diskDriveId,
          description: this.build.description,
        };
        console.log("Saving recommended build:", buildData);
        const response = await axios.post(
          `http://localhost:8800/api/recommendation`,
          buildData
        );
        console.log("Build saved successfully:", response.data);
        alert("บันทึก Recommended Build สำเร็จ!");
        this.goBack();
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการบันทึก Recommended Build:", error);
        if (error.response) {
          this.error = `เกิดข้อผิดพลาด: ${error.response.status} - ${error.response.data.error || error.message}`;
        } else if (error.request) {
          this.error = "ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้ กรุณาตรวจสอบว่าเซิร์ฟเวอร์ทำงานอยู่";
        } else {
          this.error = "เกิดข้อผิดพลาดในการบันทึก: " + error.message;
        }
      } finally {
        this.isLoading = false;
      }
    },
    goBack() {
      this.router.push(`/character/${this.route.params.id}`);
    },
  },
};
</script>

<style scoped>
.character-image {
  object-fit: cover;
  border: 2px solid #1976d2;
}
</style>