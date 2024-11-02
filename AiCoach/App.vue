<template>
  <div id="app">
    <video ref="videoElement" autoplay muted></video>
    <button @click="startPoseCorrection">Start Pose Correction</button>
  </div>
</template>

<script>
export default {
  name: 'App',
  methods: {
    startPoseCorrection() {
      // 调用后端API来处理视频流并进行姿势矫正
      // 请确保后端服务正在运行，并且API路径正确
      console.log('Starting pose correction...');
      // 这里可以添加Axios调用后端API的代码
    }
  }
}
</script>

<style>
/* 每个页面公共css */
#app {
  text-align: center;
  margin-top: 60px;
}
video {
  max-width: 100%;
  height: auto;
}
button {
  margin-top: 20px;
}
</style>