<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-blue-lighten-2 mb-8">
        เพิ่ม W-Engine ใหม่
      </h1>

      <v-row class="justify-center">
        <v-col cols="12" md="8">
          <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6">
            <v-form @submit.prevent="addWEngine">
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

              <!-- Rank -->
              <v-select
                v-model="wEngine.rank"
                :items="ranks"
                label="Rank"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
              ></v-select>

                <!-- Main Stat -->
              <v-text-field
                v-model="wEngine.mainStat"
                label="mainStat"
                color="blue-lighten-2"
                variant="outlined"
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

              <!-- Image URL -->
              <v-text-field
                v-model="wEngine.imageUrl"
                label="Image URL"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
                placeholder="เช่น https://example.com/image.png"
              ></v-text-field>

              <!-- ปุ่มบันทึกและยกเลิก -->
              <v-btn
                type="submit"
                color="blue-lighten-2"
                dark
                class="mt-4"
                :loading="isLoading"
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
    </v-container>
  </v-app>
</template>

<script>
import axios from "axios";
import { useRouter } from "vue-router";

export default {
  name: "AddWEngineView",
  setup() {
    const router = useRouter();
    return { router };
  },
  data() {
    return {
      wEngine: {
        name: "",
        rank: null,
        mainStat: "",
        effect: "",
        imageUrl: "",
      },
      ranks: ["S-Rank", "A-Rank", "B-Rank"],
      isLoading: false,
      nameError: "",
    };
  },
  methods: {
    async addWEngine() {
      // ตรวจสอบว่าชื่อ W-Engine ถูกกรอกหรือไม่
      if (!this.wEngine.name) {
        this.nameError = "กรุณากรอกชื่อ W-Engine";
        return;
      }
      this.nameError = "";

      this.isLoading = true;
      try {
        const response = await axios.post(
          "http://localhost:8800/api/w-engine",
          this.wEngine
        );
        console.log("W-Engine added:", response.data);
        alert("เพิ่ม W-Engine สำเร็จ!");
        this.router.push("/w-engines");
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการเพิ่ม W-Engine:", error);
        if (error.response) {
          alert(`เกิดข้อผิดพลาด: ${error.response.status} - ${error.response.data.error || error.message}`);
        } else {
          alert("ไม่สามารถเพิ่ม W-Engine ได้ กรุณาลองใหม่");
        }
      } finally {
        this.isLoading = false;
      }
    },
    goBack() {
      this.router.push("/w-engines");
    },
  },
};
</script>

<style scoped>
.v-form {
  max-width: 600px;
  margin: 0 auto;
}
</style>