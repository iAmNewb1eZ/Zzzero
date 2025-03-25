<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-blue-lighten-2 mb-8">
        แก้ไขตัวละคร
      </h1>

      <!-- แสดงข้อความ Error ถ้ามี -->
      <v-row v-if="error" class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-red-lighten-2">{{ error }}</p>
          <v-btn color="blue-lighten-2" dark @click="goBack">
            กลับไปยังรายการตัวละคร
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

      <!-- ฟอร์มแก้ไขตัวละคร -->
      <v-row v-else-if="character" class="justify-center">
        <v-col cols="12" md="8">
          <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6">
            <v-form @submit.prevent="updateCharacter">
              <!-- ชื่อตัวละคร -->
              <v-text-field
                v-model="character.name"
                label="ชื่อตัวละคร"
                color="blue-lighten-2"
                variant="outlined"
                required
                :error-messages="nameError"
                class="mb-4"
              ></v-text-field>

              <!-- Element -->
              <v-select
                v-model="character.element"
                :items="elements"
                label="Element"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
              ></v-select>

              <!-- Role -->
              <v-select
                v-model="character.role"
                :items="roles"
                label="Role"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
              ></v-select>

              <!-- Faction -->
              <v-text-field
                v-model="character.faction"
                label="Faction"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
              ></v-text-field>

              <!-- Attack Type -->
              <v-select
                v-model="character.attackType"
                :items="attackTypes"
                label="Attack Type"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
              ></v-select>

              <!-- Rank -->
              <v-select
                v-model="character.rank"
                :items="ranks"
                label="Rank"
                color="blue-lighten-2"
                variant="outlined"
                class="mb-4"
              ></v-select>

              <!-- Image URL -->
              <v-text-field
                v-model="character.imageUrl"
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

      <!-- แสดงข้อความถ้าไม่พบตัวละคร -->
      <v-row v-else class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-grey-lighten-2">ไม่พบตัวละครนี้ในระบบ</p>
          <v-btn color="blue-lighten-2" dark @click="goBack">
            กลับไปยังรายการตัวละคร
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
  name: "EditCharacterView",
  setup() {
    const router = useRouter();
    const route = useRoute();
    return { router, route };
  },
  data() {
    return {
      character: null,
      elements: ["Fire", "Ice", "Electric", "Ether", "Physical"],
      roles: ["Attack", "Stun", "Anomaly", "Support", "Defense"],
      attackTypes: ["Slash", "Strike", "Pierce"],
      ranks: ["S-Rank", "A-Rank", "B-Rank"],
      isLoading: false,
      isSubmitting: false,
      error: null,
      nameError: "",
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
      console.log("Fetching Character with ID:", characterId);
      try {
        const response = await axios.get(
          `http://localhost:8800/api/character/${characterId}`
        );
        console.log("Character fetched:", response.data);
        this.character = response.data;
        if (!this.character) {
          this.error = "ไม่พบตัวละครนี้ในระบบ";
        }
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการดึงข้อมูลตัวละคร:", error);
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
    async updateCharacter() {
      // ตรวจสอบว่าชื่อตัวละครถูกกรอกหรือไม่
      if (!this.character.name) {
        this.nameError = "กรุณากรอกชื่อตัวละคร";
        return;
      }
      this.nameError = "";

      this.isSubmitting = true;
      try {
        const response = await axios.put(
          `http://localhost:8800/api/character/${this.character.id}`,
          this.character
        );
        console.log("Character updated:", response.data);
        alert("แก้ไขตัวละครสำเร็จ!");
        this.router.push("/characters");
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการแก้ไขตัวละคร:", error);
        if (error.response) {
          alert(`เกิดข้อผิดพลาด: ${error.response.status} - ${error.response.data.error || error.message}`);
        } else {
          alert("ไม่สามารถแก้ไขตัวละครได้ กรุณาลองใหม่");
        }
      } finally {
        this.isSubmitting = false;
      }
    },
    goBack() {
      this.router.push("/characters");
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