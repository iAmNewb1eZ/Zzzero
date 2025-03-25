<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-blue-lighten-2 mb-8">
        Recommended Builds ทั้งหมด
      </h1>

      <!-- แสดงข้อความ Error ถ้ามี -->
      <v-row v-if="error" class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-red-lighten-2">{{ error }}</p>
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

      <!-- แสดงรายการ Recommended Builds -->
      <v-row v-else-if="recommendedBuilds.length > 0" class="justify-center">
        <v-col
          v-for="build in recommendedBuilds"
          :key="build.id"
          cols="12"
          sm="6"
          md="4"
          lg="3"
          class="d-flex justify-center"
        >
          <v-card
            color="grey-darken-3"
            class="pa-4 elevation-8 rounded-lg build-card"
            max-width="350"
            @click="viewBuild(build.id)"
          >
            <!-- รูปตัวละคร -->
            <v-img
              :src="build.character?.imageUrl || 'https://via.placeholder.com/300'"
              :alt="build.character?.name || 'ตัวละคร'"
              class="rounded-lg mb-4 character-image"
              max-height="150"
            ></v-img>

            <!-- ชื่อตัวละคร -->
            <v-card-title class="text-h6 font-weight-bold text-blue-lighten-2">
              {{ build.character?.name || "ไม่มีชื่อ" }}
            </v-card-title>

            <!-- ข้อมูล Build -->
            <v-card-subtitle class="text-grey-lighten-2">
              <p>
                <strong>W-Engine:</strong>
                {{ build.wEngine?.name || "-" }}
              </p>
              <p>
                <strong>Disk Drive:</strong>
                {{ build.diskDrive?.name || "-" }}
              </p>
              <p>
                <strong>คำอธิบาย:</strong>
                {{ build.description || "-" }}
              </p>
            </v-card-subtitle>

            <!-- ปุ่มแก้ไขและลบ -->
            <v-card-actions>
              <v-btn
                color="blue-lighten-2"
                dark
                @click.stop="editBuild(build.id)"
              >
                แก้ไข
              </v-btn>
              <v-btn
                color="red"
                dark
                @click.stop="deleteBuild(build.id)"
                class="ml-2"
              >
                ลบ
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>

      <!-- แสดงข้อความถ้าไม่มี Build -->
      <v-row v-else class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-grey-lighten-2">ไม่มี Recommended Builds ในระบบ</p>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import axios from "axios";
import { useRouter } from "vue-router";

export default {
  name: "RecommendBuildsView",
  setup() {
    const router = useRouter();
    return { router };
  },
  data() {
    return {
      recommendedBuilds: [],
      isLoading: false,
      error: null,
    };
  },
  mounted() {
    this.fetchRecommendedBuilds();
  },
  methods: {
    async fetchRecommendedBuilds() {
      this.isLoading = true;
      this.error = null;
      try {
        const response = await axios.get(
          "http://localhost:8800/api/recommendations"
        );
        console.log("Recommended Builds fetched:", response.data);
        this.recommendedBuilds = response.data;
        if (this.recommendedBuilds.length === 0) {
          this.error = "ไม่มี Recommended Builds ในระบบ";
        }
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการดึงข้อมูล Recommended Builds:", error);
        if (error.response) {
          this.error = `เกิดข้อผิดพลาด: ${error.response.status} - ${error.response.data.error || error.message}`;
        } else if (error.request) {
          this.error = "ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้ กรุณาตรวจสอบว่าเซิร์ฟเวอร์ทำงานอยู่";
        } else {
          this.error = "เกิดข้อผิดพลาดในการดึงข้อมูล: " + error.message;
        }
        this.recommendedBuilds = [];
      } finally {
        this.isLoading = false;
      }
    },
    viewBuild(buildId) {
      this.router.push(`/recommendation/${buildId}`);
    },
    editBuild(buildId) {
      alert(`แก้ไข Build ID: ${buildId} (ยังไม่ได้ implement หน้าแก้ไข)`);
      // this.router.push(`/recommended-builds/${buildId}/edit`);
    },
    async deleteBuild(buildId) {
      if (confirm("คุณแน่ใจหรือไม่ว่าต้องการลบ Recommended Build นี้?")) {
        try {
          await axios.delete(
            `http://localhost:8800/api/recommendation/${buildId}`
          );
          alert("ลบ Recommended Build สำเร็จ!");
          this.fetchRecommendedBuilds(); // รีเฟรชข้อมูลหลังลบ
        } catch (error) {
          console.error("เกิดข้อผิดพลาดในการลบ Recommended Build:", error);
          alert("ไม่สามารถลบ Recommended Build ได้ กรุณาลองใหม่");
        }
      }
    },
  },
};
</script>

<style scoped>
.build-card {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  cursor: pointer;
}

.build-card:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.character-image {
  object-fit: cover;
}
</style>