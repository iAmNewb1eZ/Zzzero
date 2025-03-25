<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-blue-lighten-2 mb-8">
        แก้ไข W-Engine
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

      <!-- ฟอร์มแก้ไข W-Engine -->
      <v-row v-else-if="wEngine" class="justify-center">
        <v-col cols="12" md="8">
          <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6">
            <v-form @submit.prevent="updateWEngine">
              <!-- รูป W-Engine (แสดงเท่านั้น) -->
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
                    รูปภาพ W-Engine
                  </h2>
                  <p class="text-grey-lighten-2">
                    รูปภาพนี้ไม่สามารถแก้ไขได้
                  </p>
                </v-col>
              </v-row>

              <!-- ชื่อ W-Engine -->
              <v-text-field
                v-model="wEngine.name"
                label="ชื่อ W-Engine"
                color="blue-lighten-2"
                variant="outlined"
                required
                :error-messages="nameError"
                class="mb-4"
              ></v-text-field>

              <!-- Effect -->
              <v-textarea
                v-model="wEngine.effect"
                label="Effect"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
              ></v-textarea>

              <!-- ปุ่มบันทึกและยกเลิก -->
              <v-btn
                type="submit"
                color="blue-lighten-2"
                dark
                class="mt-4"
                :loading="isSubmitting"
              >
                บันทึก
              </v-btn>
              <v-btn
                color="grey-lighten-2"
                dark
                @click="goBack"
                class="mt-4 ml-4"
              >
                ยกเลิก
              </v-btn>
            </v-form>
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
  name: "WEngineEditView",
  setup() {
    const router = useRouter();
    const route = useRoute();
    return { router, route };
  },
  data() {
    return {
      wEngine: null,
      isLoading: false,
      isSubmitting: false,
      error: null,
      nameError: "",
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
    async updateWEngine() {
      // ตรวจสอบว่าชื่อ W-Engine ถูกกรอกหรือไม่
      if (!this.wEngine.name) {
        this.nameError = "กรุณากรอกชื่อ W-Engine";
        return;
      }
      this.nameError = "";

      this.isSubmitting = true;
      try {
        // สร้างข้อมูลที่ต้องการอัพเดท (เฉพาะ name และ effect)
        const updatedData = {
          name: this.wEngine.name,
          effect: this.wEngine.effect,
        };

        const response = await axios.put(
          `http://localhost:8800/api/w-engine/${this.wEngine.id}`,
          updatedData
        );
        console.log("W-Engine updated:", response.data);
        alert("แก้ไข W-Engine สำเร็จ!");
        this.router.push("/w-engineS");
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการแก้ไข W-Engine:", error);
        if (error.response) {
          alert(`เกิดข้อผิดพลาด: ${error.response.status} - ${error.response.data.error || error.message}`);
        } else {
          alert("ไม่สามารถแก้ไข W-Engine ได้ กรุณาลองใหม่");
        }
      } finally {
        this.isSubmitting = false;
      }
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

.v-form {
  max-width: 600px;
  margin: 0 auto;
}
</style>