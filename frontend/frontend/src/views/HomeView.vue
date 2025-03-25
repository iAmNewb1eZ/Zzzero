<template>
  <v-app>
    <main class="py-12">
      <v-container>
        <!-- ส่วน Top-rated -->
        <h2 class="text-h3 font-weight-semibold text-Black mb-4 d-flex align-center">
          <span>🔥 Top-rated 🔥</span>
        </h2>
        <v-row>
          <!-- Zhu Yuan -->
          <v-col cols="12" md="4">
            <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6 hover:scale-105 transition" flat>
              <v-card-title class="text-h6 font-weight-bold text-blue-lighten-2 mb-4">
                Zhu Yuan
              </v-card-title>
              <v-img
                src="https://media1.tenor.com/m/jHuUgYVbjxkAAAAC/zhuyuan-chibi.gif"
                alt="Zhu Yuan"
                aspect-ratio="1.5"
                class="rounded-lg mb-4"
              ></v-img>
              <v-card-text class="text-grey-lighten-2">
                จับผมเลยคุณตำรวจ
              </v-card-text>
            </v-card>
          </v-col>
          <!-- Ellen Joe -->
          <v-col cols="12" md="4">
            <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6 hover:scale-105 transition" flat>
              <v-card-title class="text-h6 font-weight-bold text-blue-lighten-2 mb-4">
                Ellen Joe
              </v-card-title>
              <v-img
                src="https://media1.tenor.com/m/npyNLbpWqpgAAAAC/ellen-joe-zenless-zone-zero.gif"
                alt="Ellen Joe"
                aspect-ratio="1.5"
                class="rounded-lg mb-4"
              ></v-img>
              <v-card-text class="text-grey-lighten-2">
                จับหางโดนกัดนะ
              </v-card-text>
            </v-card>
          </v-col>
          <!-- Burnice -->
          <v-col cols="12" md="4">
            <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6 hover:scale-105 transition" flat>
              <v-card-title class="text-h6 font-weight-bold text-blue-lighten-2 mb-4">
                Burnice
              </v-card-title>
              <v-img
                src="https://media1.tenor.com/m/o3D3rceQK2EAAAAC/burnice-white-burnice-zzz.gif"
                alt="Burnice"
                aspect-ratio="1.5"
                class="rounded-lg mb-4"
              ></v-img>
              <v-card-text class="text-grey-lighten-2">
                Still Warm
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>

        <!-- ส่วน What's New -->
        <h4 class="text-h3 font-weight-semibold text-black mt-12 mb-4 d-flex align-center">
          <span>✨ What's New ✨</span>
        </h4>
        <v-row>
          <!-- Astral Voice-4 -->
          <v-col cols="12" md="4">
            <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6 hover:scale-105 transition" flat>
              <v-card-title class="text-h6 font-weight-bold text-blue-lighten-2 mb-4">
                Astra
              </v-card-title>
              <v-img
                src="https://media1.tenor.com/m/AjDfgOXnLr0AAAAd/zenless-zone-zero-astra-yao.gif"
                alt="Astra"
                aspect-ratio="1.5"
                class="rounded-lg mb-4"
              ></v-img>
              <v-card-text class="text-grey-lighten-2">
                Sing along with me
              </v-card-text>
            </v-card>
          </v-col>
          <!-- Caesar -->
          <v-col cols="12" md="4">
            <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6 hover:scale-105 transition" flat>
              <v-card-title class="text-h6 font-weight-bold text-blue-lighten-2 mb-4">
                Caesar
              </v-card-title>
              <v-img
                src="https://media1.tenor.com/m/Cu3rbIf-5_0AAAAd/anime-blush-caesar.gif"
                alt="Caesar"
                aspect-ratio="1.5"
                class="rounded-lg mb-4"
              ></v-img>
              <v-card-text class="text-grey-lighten-2">
                Zhongli at Home
              </v-card-text>
            </v-card>
          </v-col>
          <!-- Qingyi -->
          <v-col cols="12" md="4">
            <v-card color="grey-darken-3" class="pa-6 rounded-lg elevation-6 hover:scale-105 transition" flat>
              <v-card-title class="text-h6 font-weight-bold text-blue-lighten-2 mb-4">
                Qingyi
              </v-card-title>
              <v-img
                src="https://media1.tenor.com/m/TncWhqLMiAEAAAAd/zzz-zzzero.gif"
                alt="Qingyi"
                aspect-ratio="1.5"
                class="rounded-lg mb-4"
              ></v-img>
              <v-card-text class="text-grey-lighten-2">
                Frieren at Home
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </main>

    <!-- Footer -->
    <footer class="bg-grey-darken-4 text-center py-4 mt-12">
      <p class="text-grey-lighten-2">© Zenless Zone Zero</p>
    </footer>
  </v-app>
</template>

<script>
export default {
  name: 'HomeView',
};
</script>

<style scoped>
/* กำหนดพื้นหลังให้ <body> หรือ <v-app> */
body,
.v-app {
  background-color: #1a2238; /* สีน้ำเงินเข้มเหมือนในภาพ */
  color: #ffffff;
  margin: 0;
  padding: 0;
}

.hover\:scale-105:hover {
  transform: scale(1.05);
}

.transition {
  transition: transform 0.3s ease;
}

.text-center {
  text-align: center;
}

.v-card {
  transition: transform 0.3s ease;
}
</style>