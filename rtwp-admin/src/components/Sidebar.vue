<template>
  <div
    class="c-sidebar c-sidebar-dark c-sidebar-fixed"
    :class="{ 'c-sidebar-minimized': isSidebarMin, 'c-sidebar-show': isSidebarShown }"
    id="sidebar"
  >
    <div class="c-sidebar-brand d-md-down-none">
      <router-link to="/">
        <img
          class="c-sidebar-brand-full"
          src="../assets/NS2-logo-white.svg"
          alt="NS2 logo"
          width="86"
        />
        <img
          class="c-sidebar-brand-minimized"
          src="../assets/NS2-icon-white.svg"
          height="30"
          alt="NS2 Logo"
        />
      </router-link>
    </div>
    <ul class="c-sidebar-nav" @mouseenter="mouseEnter" @mouseleave="mouseLeave">
      <li class="c-sidebar-nav-item">
        <router-link class="c-sidebar-nav-link" to="/home/map" @click.native="closeOnMobile">
          <i class="c-sidebar-nav-icon cil-map"></i> Labs Map
        </router-link>
      </li>
      <li class="c-sidebar-nav-item">
        <router-link class="c-sidebar-nav-link" to="/home/visitors" @click.native="closeOnMobile">
          <i class="c-sidebar-nav-icon cil-people"></i> Visitors
        </router-link>
      </li>
      <li class="c-sidebar-nav-item">
        <router-link class="c-sidebar-nav-link" to="/home/stats" @click.native="closeOnMobile">
          <i class="c-sidebar-nav-icon cil-chart-line"></i> Statistics
        </router-link>
      </li>
      <li class="c-sidebar-nav-item">
        <router-link class="c-sidebar-nav-link" to="/home/about" @click.native="closeOnMobile">
          <i class="c-sidebar-nav-icon cil-code"></i> About
        </router-link>
      </li>
      <li class="c-sidebar-nav-item">
        <a class="c-sidebar-nav-link" href="https://github.com/openNS2" target="_blank">
          <i class="c-sidebar-nav-icon cib-github"></i> Github
        </a>
      </li>
    </ul>
    <button class="c-sidebar-minimizer c-class-toggler" type="button" @click="toggleMin"></button>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'AppSidebar',
  data() {
    return {
      isMouseEnter: false
    }
  },
  computed: mapState(['isSidebarMin', 'isSidebarShown']),
  methods: {
    toggleMin() {
      this.$store.commit('toggleSidebarMin')
    },
    mouseEnter() {
      if (this.isSidebarMin) {
        this.$store.commit('sidebarMax')
        this.isMouseEnter = true
      }
    },
    mouseLeave() {
      if (this.isMouseEnter) {
        this.$store.commit('sidebarMin')
        this.isMouseEnter = false
      }
    },
    closeOnMobile() {
      if (this.$isMobile()) {
        this.$store.commit('sidebarHide')
      }
    }
  },
  created() {
    if (this.$isMobile() && this.isSidebarShown) {
      this.$store.commit('sidebarHide')
    }
  }
}
</script>
