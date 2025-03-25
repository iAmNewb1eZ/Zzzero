import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import CharacterView from '../views/CharacterView.vue'
import CharacterDetailView from '../views/CharacterDetailView.vue'
import CharacterBuildView from '../views/CharacterBuildView.vue'
import RecommendedBuildsView from '../views/RecommendedBuildsView.vue'
import RecommendedBuildDetailView from '../views/RecommendedBuildDetailView.vue'
import AddCharacterView from '../views/AddCharacterView.vue'
import CharacterEditView from '../views/CharacterEditView.vue'
import WEngineView from '../views/WEngineView.vue'
import WEngineDetailView from '../views/WEngineDetailView.vue'
import WEngineEditView from '../views/WEngineEditView.vue'
import AddWEngineView from '../views/AddWEngineView.vue'


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/characters',
      name: 'CharacterView',
      component: CharacterView,
    },
    {
      path: '/character/:id',
      name: 'CharacterDetailView',
      component: CharacterDetailView,
    },
    {
      path: '/character/:id/build',
      name: 'CharacterBuildView',
      component: CharacterBuildView,
    },
    {
      path: '/recommendations',
      name: 'RecommendedBuildsView',
      component: RecommendedBuildsView
    },
    {
      path: '/recommendation/:id',
      name: 'RecommendedBuildDetailView',
      component: RecommendedBuildDetailView
    },
    {
      path: '/character/create',
      name: 'AddCharacterView',
      component: AddCharacterView
    },
    {
      path: '/character/:id/edit',
      name: 'CharacterEditView',
      component: CharacterEditView
    },
    {
      path: '/w-engines',
      name: 'WEngineView',
      component: WEngineView
    },
    {
      path: '/w-engine/:id',
      name: 'WEngineDetailView',
      component: WEngineDetailView
    },
    {
      path: '/w-engine/:id/edit',
      name: 'WEngineEditView',
      component: WEngineEditView
    },
    {
      path: '/w-engine/create',
      name: 'AddWEngineView',
      component: AddWEngineView
    }


  ],
})

export default router
