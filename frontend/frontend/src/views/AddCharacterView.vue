<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-blue-lighten-2 mb-8">
        เพิ่มตัวละครใหม่
      </h1>

      <v-row class="justify-center">
        <v-col cols="12" md="8">
          <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6">
            <v-form @submit.prevent="addCharacter">
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
  name: "AddCharacterView",
  setup() {
    const router = useRouter();
    return { router };
  },
  data() {
    return {
      character: {
        name: "",
        element: null,
        role: null,
        faction: "",
        attackType: null,
        rank: null,
        imageUrl: "",
      },
      elements: ["Fire", "Ice", "Electric", "Ether", "Physical"],
      roles: ["Attack", "Stun", "Anomaly", "Support", "Defense"],
      attackTypes: ["Slash", "Strike", "Pierce"],
      ranks: ["S-Rank", "A-Rank", "B-Rank"],
      isLoading: false,
      nameError: "",
    };
  },
  methods: {
    async addCharacter() {
      // ตรวจสอบว่าชื่อตัวละครถูกกรอกหรือไม่
      if (!this.character.name) {
        this.nameError = "กรุณากรอกชื่อตัวละคร";
        return;
      }
      this.nameError = "";

      this.isLoading = true;
      try {
        const response = await axios.post(
          "http://localhost:8800/api/character",
          this.character
        );
        console.log("Character added:", response.data);
        alert("เพิ่มตัวละครสำเร็จ!");
        this.router.push("/characters");
      } catch (error) {
        console.error("เกิดข้อผิดพลาดในการเพิ่มตัวละคร:", error);
        if (error.response) {
          alert(`เกิดข้อผิดพลาด: ${error.response.status} - ${error.response.data.error || error.message}`);
        } else {
          alert("ไม่สามารถเพิ่มตัวละครได้ กรุณาลองใหม่");
        }
      } finally {
        this.isLoading = false;
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