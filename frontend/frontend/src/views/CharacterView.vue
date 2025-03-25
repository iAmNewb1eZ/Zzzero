<template>
  <v-app>
    <v-container class="py-12">
      <h1 class="text-h3 font-weight-bold text-white mb-8">
        รายชื่อตัวละคร
      </h1>
      <!-- แถวแรก: v-tabs สำหรับเลือก Role และปุ่ม "เพิ่มตัวละคร" -->
      <v-row align="center" class="mb-4">
        <v-col cols="12" md="8">
          <v-tabs
            v-model="selectedRole"
            color="blue-lighten-2"
            align-tabs="center"
            class="custom-tabs"
            dense
            @update:model-value="fetchCharacters"
          >
            <v-tab value="All" class="custom-tab">All</v-tab>
            <v-tab value="Attack" class="custom-tab">Attack</v-tab>
            <v-tab value="Support" class="custom-tab">Support</v-tab>
            <v-tab value="Anomaly" class="custom-tab">Anomaly</v-tab>
            <v-tab value="Stun" class="custom-tab">Stun</v-tab>
            <v-tab value="Defense" class="custom-tab">Defense</v-tab>
          </v-tabs>
        </v-col>
        <v-col cols="12" md="4" class="d-flex justify-end">
          <v-btn color="blue-lighten-2" dark @click="createNewCharacter">
            เพิ่มตัวละคร
          </v-btn>
        </v-col>
      </v-row>
      <!-- แถวที่สอง: v-tabs สำหรับเลือก Element -->
      <v-row align="center" class="mb-4">
        <v-col cols="12" md="8">
          <v-tabs
            v-model="selectedElementTab"
            color="blue-lighten-2"
            align-tabs="center"
            class="custom-tabs"
            dense
            @update:model-value="updateSelectedElements"
          >
            <v-tab value="All" class="custom-tab">All</v-tab>
            <v-tab value="Fire" class="custom-tab">Fire</v-tab>
            <v-tab value="Ice" class="custom-tab">Ice</v-tab>
            <v-tab value="Electric" class="custom-tab">Electric</v-tab>
            <v-tab value="Ether" class="custom-tab">Ether</v-tab>
            <v-tab value="Physical" class="custom-tab">Physical</v-tab>
          </v-tabs>
        </v-col>
      </v-row>
      <v-row v-if="error" class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-red-lighten-2">{{ error }}</p>
        </v-col>
      </v-row>
      <v-row
        v-else-if="characters.length > 0"
        class="characters"
        align="center"
        justify="center"
      >
        <v-col
          v-for="character in characters"
          :key="character.id"
          cols="12"
          sm="6"
          md="4"
          lg="3"
          class="d-flex justify-center"
        >
          <v-card
            color="grey-darken-3"
            class="character-card pa-4 elevation-8 rounded-lg"
            max-width="350"
            @click="showCharacterDetail(character.id)"
          >
            <v-img
              :src="character.imageUrl || 'https://via.placeholder.com/300'"
              :alt="character.name || 'ตัวละคร'"
              aspect-ratio="1.5"
              class="rounded-lg mb-4 character-image"
              max-height="250"
            ></v-img>
            <v-card-title class="text-h6 font-weight-bold text-blue-lighten-2">
              {{ character.name || "ไม่มีชื่อ" }}
            </v-card-title>
            <v-card-subtitle class="text-grey-lighten-2">
              <p>Faction: {{ character.faction || "-" }}</p>
              <p>Element: {{ character.element || "-" }}</p>
              <p>Role: {{ character.role || "-" }}</p>
            </v-card-subtitle>
            <v-card-actions>
              <v-btn
                color="blue-lighten-2"
                dark
                @click.stop="editCharacter(character.id)"
              >
                แก้ไข
              </v-btn>
              <v-btn
                color="red"
                dark
                @click.stop="deleteCharacter(character.id)"
                class="ml-2"
              >
                ลบ
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
      <v-row v-else-if="!isLoading" class="justify-center">
        <v-col cols="12" class="text-center">
          <p class="text-h6 text-grey-lighten-2">ไม่มีตัวละครในระบบ</p>
        </v-col>
      </v-row>
      <v-row v-if="isLoading" class="justify-center">
        <v-col cols="12" class="text-center">
          <v-progress-circular
            indeterminate
            color="blue-lighten-2"
            size="50"
          ></v-progress-circular>
          <p class="text-h6 text-grey-lighten-2 mt-2">กำลังโหลดข้อมูล...</p>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import axios from "axios";
import { useRouter } from "vue-router";

export default {
  name: "CharacterView",
  setup() {
    const router = useRouter();
    return { router };
  },
  data() {
    return {
      characters: [],
      selectedRole: "All",
      selectedElementTab: "All",
      selectedElements: [],
      isLoading: false,
      error: null,
    };
  },
  mounted() {
    this.fetchCharacters();
  },
  methods: {
    updateSelectedElements() {
      if (this.selectedElementTab === "All") {
        this.selectedElements = [];
      } else if (this.selectedElementTab === "Ice") {
        this.selectedElements = ["Ice", "Frost"];
      } else {
        this.selectedElements = [this.selectedElementTab];
      }
      this.fetchCharacters();
    },
    async fetchCharacters() {
      this.isLoading = true;
      this.error = null;
      try {
        const roleToSend = this.selectedRole === "All" ? undefined : this.selectedRole;
        const elementsToSend = this.selectedElements.length > 0 ? this.selectedElements : undefined;
        console.log("Fetching characters with params:", {
          role: roleToSend,
          elements: elementsToSend,
        });
        const response = await axios.get("http://localhost:8800/api/characters", {
          params: {
            role: roleToSend,
            elements: elementsToSend,
          },
          paramsSerializer: (params) => {
            const searchParams = new URLSearchParams();
            for (const key in params) {
              if (Array.isArray(params[key])) {
                params[key].forEach((value) => {
                  searchParams.append(key, value);
                });
              } else if (params[key] !== undefined) {
                searchParams.append(key, params[key]);
              }
            }
            return searchParams.toString();
          },
        });
        console.log("API Response in CharacterView:", response.data);
        if (Array.isArray(response.data)) {
          this.characters = response.data || [];
        } else {
          this.characters = response.data.characters || [];
        }
        console.log("Characters after fetch:", this.characters);
        if (this.characters.length === 0 && !this.selectedRole && this.selectedElements.length === 0) {
          this.error = "ไม่พบตัวละครในระบบ กรุณาตรวจสอบ backend และฐานข้อมูล";
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
        this.characters = [];
      } finally {
        this.isLoading = false;
      }
    },
    showCharacterDetail(characterId) {
      console.log("Navigating to character ID:", characterId);
      this.router.push(`/character/${characterId}`);
    },
    editCharacter(characterId) {
      this.router.push(`/character/${characterId}/edit`);
    },
    async deleteCharacter(characterId) {
      if (confirm("คุณแน่ใจหรือไม่ว่าต้องการลบตัวละครนี้?")) {
        try {
          await axios.delete(`http://localhost:8800/api/character/${characterId}`);
          this.fetchCharacters();
          alert("ลบตัวละครสำเร็จ!");
        } catch (error) {
          console.error("เกิดข้อผิดพลาดในการลบตัวละคร:", error);
          alert("ไม่สามารถลบตัวละครได้ กรุณาลองใหม่");
        }
      }
    },
    createNewCharacter() {
      this.router.push("/character/create");
    },
  },
};
</script>

<style scoped>
.character-card {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  cursor: pointer;
}

.character-card:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.character-image {
  object-fit: cover;
}

.characters {
  gap: 30px;
}

.custom-tabs {
  border-radius: 8px;
  padding: 4px;
}

.custom-tab {
  border-radius: 6px;
  margin: 0 4px;
  padding: 8px;
  min-width: 60px;
  transition: transform 0.3s ease;
}

.custom-tab.v-tab--selected {
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.custom-tab:hover {
  transform: scale(1.05);
}
</style>