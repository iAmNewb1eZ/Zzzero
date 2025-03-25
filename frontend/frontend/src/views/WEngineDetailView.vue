<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-blue-lighten-2 mb-8">
        รายละเอียด W-Engine
      </h1>

      <!-- แสดงข้อความ Error ถ้ามี -->
      <v-row v-if="error" class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-red-lighten-2">{{ error }}</p>
          <v-btn color="blue-lighten-2" dark @click="goBack">
            กลับไปยังรายการ W-Engines
          </v-btn>
        </v-col>
      </v-row>

      <!-- แสดง Loading ถ้าข้อมูลยังโหลดไม่เสร็จ -->
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

      <!-- แสดงรายละเอียด W-Engine -->
      <v-row v-else-if="wEngine" class="justify-center">
        <v-col cols="12" md="8">
          <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6">
            <v-card-text>
              <!-- รูป W-Engine -->
              <v-row class="mb-4">
                <v-col cols="12" md="4" class="d-flex justify-center">
                  <v-img
                    :src="wEngine.imageUrl || 'https://via.placeholder.com/150'"
                    :alt="wEngine.name"
                    class="rounded-lg w-engine-image"
                    max-width="150"
                    max-height="150"
                  ></v-img>
                </v-col>
                <v-col cols="12" md="8">
                  <h2 class="text-h5 font-weight-bold text-blue-lighten-2 mb-2">
                    {{ wEngine.name }}
                  </h2>
                  <p class="text-grey-lighten-2">
                    <strong>Rank:</strong> {{ wEngine.rank || "-" }}
                  </p>
                  <p class="text-grey-lighten-2">
                    <strong>Effect:</strong> {{ wEngine.effect || "-" }}
                  </p>
                </v-col>
              </v-row>

              <!-- ปุ่มแก้ไขและกลับ -->
              <v-btn
                color="blue-lighten-2"
                dark
                @click="editWEngine"
                class="mt-4"
              >
                แก้ไข
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

      <!-- แสดงข้อความถ้าไม่พบ W-Engine -->
      <v-row v-else class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-grey-lighten-2">ไม่พบ W-Engine นี้ในระบบ</p>
          <v-btn color="blue-lighten-2" dark @click="goBack">
            กลับไปยังรายการ W-Engines
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
  name: "WEngineDetailView",
  setup() {
    const router = useRouter();
    const route = useRoute();
    return { router, route };
  },
  data() {
    return {
      wEngine: null,
      isLoading: false,
      error: null,
    };
  },
  mounted() {
    this.fetchWEngine();
  },
  methods: {
    async fetchWEngine() {
      this.isLoading = true;
      this.error = null;
      const wEngineId = this.route.params.id;
      console.log("Fetching W-Engine with ID:", wEngineId);
      try {
        const response = await axios.get(
          `http://localhost:8800/api/w-engine/${wEngineId}`
        );
        console.log("W-Engine fetched:", response.data);
        this.wEngine = response.data;
        if (!this.wEngine) {
          this.error = "ไม่พบ W-Engine นี้ในระบบ";
        }
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการดึงข้อมูล W-Engine:", error);
        if (error.response) {
          this.error = `เกิดข้อผิดพลาด: ${error.response.status} - ${error.response.data.error || error.message}`;
        } else if (error.request) {
          this.error = "ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้ กรุณาตรวจสอบว่าเซิร์ฟเวอร์ทำงานอยู่";
        } else {
          this.error = "เกิดข้อผิดพลาดในการดึงข้อมูล: " + error.message;
        }
      } finally {
        this.isLoading = false;
      }
    },
    editWEngine() {
      this.router.push(`/w-engine/${this.wEngine.id}/edit`);
    },
    goBack() {
      this.router.push("/w-engines");
    },
  },
};
</script>

<style scoped>
.w-engine-image {
  object-fit: cover;
  border: 2px solid #1976d2;
}
</style>