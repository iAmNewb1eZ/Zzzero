<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-blue-lighten-2 mb-8">
        รายการ W-Engines
      </h1>

      <!-- ปุ่มเพิ่ม W-Engine -->
      <v-row class="mb-4">
        <v-col cols="12" class="text-right">
          <v-btn
            color="blue-lighten-2"
            dark
            @click="router.push('/w-engine/create')"
          >
            เพิ่ม W-Engine ใหม่
          </v-btn>
        </v-col>
      </v-row>

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

      <!-- แสดงรายการ W-Engines -->
      <v-row v-else-if="wEngines.length > 0" class="justify-center">
        <v-col
          v-for="wEngine in wEngines"
          :key="wEngine.id"
          cols="12"
          sm="6"
          md="4"
          lg="3"
          class="d-flex justify-center"
        >
          <v-card
            color="grey-darken-3"
            class="pa-4 elevation-8 rounded-lg w-engine-card"
            max-width="350"
            @click="viewWEngine(wEngine.id)" 
          >
            <!-- รูป W-Engine -->
            <v-img
              :src="wEngine.imageUrl || 'https://via.placeholder.com/150'"
              :alt="wEngine.name"
              class="rounded-lg mb-4 w-engine-image"
              max-height="150"
            ></v-img>

            <!-- ชื่อ W-Engine -->
            <v-card-title class="text-h6 font-weight-bold text-blue-lighten-2">
              {{ wEngine.name }}
            </v-card-title>

            <!-- ข้อมูล W-Engine -->
            <v-card-subtitle class="text-grey-lighten-2">
              <p><strong>Rank:</strong> {{ wEngine.rank || "-" }}</p>
              <p><strong>Effect:</strong> {{ wEngine.effect || "-" }}</p>
            </v-card-subtitle>

            <!-- ปุ่มแก้ไขและลบ -->
            <v-card-actions>
              <v-btn
                color="blue-lighten-2"
                dark
                @click.stop="editWEngine(wEngine.id)" 
              >
                แก้ไข
              </v-btn>
              <v-btn
                color="red"
                dark
                @click.stop="deleteWEngine(wEngine.id)" 
                class="ml-2"
              >
                ลบ
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>

      <!-- แสดงข้อความถ้าไม่มี W-Engine -->
      <v-row v-else class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-grey-lighten-2">ไม่มี W-Engines ในระบบ</p>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import axios from "axios";
import { useRouter } from "vue-router";

export default {
  name: "WEngineView",
  setup() {
    const router = useRouter();
    return { router };
  },
  data() {
    return {
      wEngines: [],
      isLoading: false,
      error: null,
    };
  },
  mounted() {
    this.fetchWEngines();
  },
  methods: {
    async fetchWEngines() {
      this.isLoading = true;
      this.error = null;
      try {
        const response = await axios.get("http://localhost:8800/api/w-engines");
        console.log("W-Engines fetched:", response.data);
        this.wEngines = response.data;
        if (this.wEngines.length === 0) {
          this.error = "ไม่มี W-Engines ในระบบ";
        }
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการดึงข้อมูล W-Engines:", error);
        if (error.response) {
          this.error = `เกิดข้อผิดพลาด: ${error.response.status} - ${error.response.data.error || error.message}`;
        } else if (error.request) {
          this.error = "ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้ กรุณาตรวจสอบว่าเซิร์ฟเวอร์ทำงานอยู่";
        } else {
          this.error = "เกิดข้อผิดพลาดในการดึงข้อมูล: " + error.message;
        }
        this.wEngines = [];
      } finally {
        this.isLoading = false;
      }
    },
    viewWEngine(wEngineId) {
      this.router.push(`/w-engine/${wEngineId}`); // นำไปยังหน้ารายละเอียด
    },
    editWEngine(wEngineId) {
      this.router.push(`/w-engine/${wEngineId}/edit`);
    },
    async deleteWEngine(wEngineId) {
      if (confirm("คุณแน่ใจหรือไม่ว่าต้องการลบ W-Engine นี้?")) {
        try {
          await axios.delete(`http://localhost:8800/api/w-engine/${wEngineId}`);
          alert("ลบ W-Engine สำเร็จ!");
          this.fetchWEngines(); // รีเฟรชข้อมูลหลังลบ
        } catch (error) {
          console.error("เกิดข้อผิดพลาดในการลบ W-Engine:", error);
          alert("ไม่สามารถลบ W-Engine ได้ กรุณาลองใหม่");
        }
      }
    },
  },
};
</script>

<style scoped>
.w-engine-card {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  cursor: pointer; /* เพิ่ม cursor เพื่อบ่งบอกว่าคลิกได้ */
}

.w-engine-card:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.w-engine-image {
  object-fit: cover;
}
</style>