<template>
  <div class="video-background">
    <video autoplay loop muted>
      <source src="/static/static/video/do.mp4" type="video/mp4" />
      Your browser does not support the video tag.
    </video>
    <div class="overlay">
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {
  name: "VideoBackground"
};
</script>

<style scoped>
.video-background {
  position: relative;
  width: 100%;
  height: 100vh; /* 根据需要设置高度 */
  overflow: hidden;
}

video {
  position: absolute;
  top: 50%;
  left: 50%;
  min-width: 100%;  /* 确保视频宽度最小为 100% */
  min-height: 100%; /* 确保视频高度最小为 100% */
  width: auto;      /* 自动宽度调整 */
  height: auto;     /* 自动高度调整 */
  z-index: 1;
  transform: translate(-50%, -50%); /* 中心对齐 */
}

.overlay {
  position: relative;
  z-index: 2; /* 确保内容在视频上方 */
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}
</style>
