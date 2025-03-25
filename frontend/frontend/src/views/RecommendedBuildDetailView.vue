<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-blue-lighten-2 mb-8">
        รายละเอียด Recommended Build
      </h1>

      <!-- แสดงข้อความ Error ถ้ามี -->
      <v-row v-if="error" class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-red-lighten-2">{{ error }}</p>
          <v-btn color="blue-lighten-2" dark @click="goBack">
            กลับไปยังรายการ Recommended Builds
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

      <!-- แสดงรายละเอียด Recommended Build -->
      <v-row v-else-if="build" class="justify-center">
        <v-col cols="12" md="8">
          <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6">
            <v-card-text>
              <!-- รูปตัวละคร -->
              <v-row class="mb-4">
                <v-col cols="12" md="4" class="d-flex justify-center">
                  <v-img
                    :src="build.character?.imageUrl || 'https://via.placeholder.com/300'"
                    :alt="build.character?.name || 'ตัวละคร'"
                    class="rounded-lg character-image"
                    max-width="200"
                    max-height="250"
                  ></v-img>
                </v-col>
                <v-col cols="12" md="8">
                  <h2 class="text-h5 font-weight-bold text-blue-lighten-2 mb-2">
                    Build สำหรับ {{ build.character?.name || "ไม่มีชื่อ" }}
                  </h2>
                  <p class="text-grey-lighten-2">
                    <strong>Element:</strong> {{ build.character?.element || "-" }}
                  </p>
                  <p class="text-grey-lighten-2">
                    <strong>Role:</strong> {{ build.character?.role || "-" }}
                  </p>
                  <p class="text-grey-lighten-2">
                    <strong>Faction:</strong> {{ build.character?.faction || "-" }}
                  </p>
                  <p class="text-grey-lighten-2">
                    <strong>Rank:</strong> {{ build.character?.rank || "-" }}
                  </p>
                </v-col>
              </v-row>

              <!-- ข้อมูล Build -->
              <v-divider class="mb-4"></v-divider>
              <h3 class="text-h6 font-weight-bold text-blue-lighten-2 mb-2">
                รายละเอียด Build
              </h3>

              <!-- W-Engine -->
              <v-row class="mb-4">
                <v-col cols="12" md="4" class="d-flex justify-center">
                  <v-img
                    :src="build.wEngine?.imageUrl || 'https://via.placeholder.com/150'"
                    :alt="build.wEngine?.name || 'W-Engine'"
                    class="rounded-lg equipment-image"
                    max-width="150"
                    max-height="150"
                  ></v-img>
                </v-col>
                <v-col cols="12" md="8">
                  <p class="text-grey-lighten-2">
                    <strong>W-Engine:</strong> {{ build.wEngine?.name || "-" }}
                  </p>
                  <p class="text-grey-lighten-2">
                    <strong>Rank:</strong> {{ build.wEngine?.rank || "-" }}
                  </p>
                  <p class="text-grey-lighten-2">
                    <strong>Effect:</strong> {{ build.wEngine?.effect || "-" }}
                  </p>
                </v-col>
              </v-row>

              <!-- Disk Drive -->
              <v-row class="mb-4">
                <v-col cols="12" md="4" class="d-flex justify-center">
                  <v-img
                    :src="build.diskDrive?.imageUrl || 'https://via.placeholder.com/150'"
                    :alt="build.diskDrive?.name || 'Disk Drive'"
                    class="rounded-lg equipment-image"
                    max-width="150"
                    max-height="150"
                  ></v-img>
                </v-col>
                <v-col cols="12" md="8">
                  <p class="text-grey-lighten-2">
                    <strong>Disk Drive:</strong> {{ build.diskDrive?.name || "-" }}
                  </p>
                  <p class="text-grey-lighten-2">
                    <strong>Effect (2 ชิ้น):</strong> {{ build.diskDrive?.twoPieceBonus || "-" }}
                  </p>
                  <p class="text-grey-lighten-2">
                    <strong>Effect (4 ชิ้น):</strong> {{ build.diskDrive?.fourPieceBonus || "-" }}
                  </p>
                </v-col>
              </v-row>

              <!-- คำอธิบายและวันที่ -->
              <p class="text-grey-lighten-2">
                <strong>คำอธิบาย:</strong> {{ build.description || "-" }}
              </p>
              <!-- ปุ่มลบและกลับ -->
              <v-btn
                color="red"
                dark
                @click="deleteBuild"
                class="mt-4"
              >
                ลบ Build
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

      <!-- แสดงข้อความถ้าไม่พบ Build -->
      <v-row v-else class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-grey-lighten-2">ไม่พบ Recommended Build นี้ในระบบ</p>
          <v-btn color="blue-lighten-2" dark @click="goBack">
            กลับไปยังรายการ Recommended Builds
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
  name: "RecommendedBuildDetailView",
  setup() {
    const router = useRouter();
    const route = useRoute();
    return { router, route };
  },
  data() {
    return {
      build: null,
      isLoading: false,
      error: null,
    };
  },
  mounted() {
    this.fetchRecommendedBuild();
  },
  methods: {
    async fetchRecommendedBuild() {
      this.isLoading = true;
      this.error = null;
      const buildId = this.route.params.id;
      console.log("Fetching Recommended Build with ID:", buildId);
      try {
        const response = await axios.get(
          `http://localhost:8800/api/recommendation/${buildId}` // แก้ endpoint ให้ตรง
        );
        console.log("Recommended Build fetched:", response.data);
        this.build = response.data;
        if (!this.build) {
          this.error = "ไม่พบ Recommended Build นี้ในระบบ";
        }
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการดึงข้อมูล Recommended Build:", error);
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
    formatDate(date) {
      if (!date) return "-";
      return new Date(date).toLocaleString("th-TH", {
        dateStyle: "medium",
        timeStyle: "short",
      });
    },
    async deleteBuild() {
      if (confirm("คุณแน่ใจหรือไม่ว่าต้องการลบ Recommended Build นี้?")) {
        try {
          await axios.delete(
            `http://localhost:8800/api/recommendation/${this.build.id}` // แก้ endpoint ให้ตรง
          );
          alert("ลบ Recommended Build สำเร็จ!");
          this.goBack();
        } catch (error) {
          console.error("เกิดข้อผิดพลาดในการลบ Recommended Build:", error);
          alert("ไม่สามารถลบ Recommended Build ได้ กรุณาลองใหม่");
        }
      }
    },
    goBack() {
      this.router.push("/recommendations"); // แก้ path ให้ตรง
    },
  },
};
</script>

<style scoped>
.character-image {
  object-fit: cover;
  border: 2px solid #1976d2;
}

.equipment-image {
  object-fit: cover;
  border: 2px solid #1976d2;
}
</style>