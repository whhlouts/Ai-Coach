<template>
  <view>
	<video ref="video" id="videoElementId" autoplay muted playsinline style="width: 640px; height: 480px;"></video>
    <button @click="OpenCamera">开始姿势估计</button>
    <canvas ref="canvas" id="canvasCamera" :width="canvasWidth" :height="canvasHeight"></canvas>
  </view>
</template>

<script>
import * as posenet from '@tensorflow-models/posenet';
import '@tensorflow/tfjs';
import { log } from '@tensorflow/tfjs';

export default {
  data() {
    return {
      videoElement: null,
      poseNetModel: null,
      intervalId: null,
	  canvas: null,
		context: null,
      canvasWidth: 640,  // 设置画布宽度
      canvasHeight: 480, // 设置画布高度
    };
  },
  mounted() {
	  this.$nextTick(() => {
	        // 获取 video 元素
	        this.videoElement = this.$refs.videoElement;
	      });
	      this.initializePoseNet();
		  this.getCamera()
  },
  methods: {
    // 初始化 PoseNet 模型
    async initializePoseNet() {
      try {
        this.poseNetModel = await posenet.load();
        console.log('PoseNet 模型加载成功');
      } catch (error) {
        console.error('PoseNet 模型加载失败:', error);
      }
    },
    getCamera() {
          // 获取 canvas 画布
          this.canvas = document.getElementById('canvasCamera');
          // this.context = this.canvas.getContext('2d');
          // 旧版本浏览器可能根本不支持mediaDevices，我们首先设置一个空对象
          if (navigator.mediaDevices === undefined) {
            navigator.mediaDevices = {};
          }
          // 正常支持版本
          navigator.mediaDevices
            .getUserMedia({
              video: true,
            })
              .then((stream) => {
              // 摄像头开启成功
              this.$refs.video.srcObject = stream;
			  console.log(this.$refs.video)
              this.$refs.video.play();
            })
            .catch(err => {
              console.log(err);
            });
        },
        // 拍照 绘制图片
        setImage() {
          console.log('拍照');
          // 点击canvas画图
          this.context.drawImage(
            this.$refs.video,
            0,
            0,
            200,
            100,
          );
          // 获取图片base64链接
          const image = this.cancas.toDataURL('image/png');
          this.imgSrc = image;
          this.$emit('refreshDataList', this.imgSrc);
        },
        // 打开摄像头
        OpenCamera() {
          console.log('打开摄像头');
          this.getCamera();
        },
        // 关闭摄像头
        CloseCamera() {
          console.log('关闭摄像头');
          this.$refs.video.srcObject.getTracks()[0].stop();
        },
    // 开始姿势估计的循环
    async startPoseEstimation() {
      this.intervalId = setInterval(async () => {
        try {
          const pose = await this.estimateSinglePose();
          if (pose) {
            console.log('成功估计到姿势:', pose);
            this.drawPose(pose);
          } else {
            console.log('未成功获取到姿势');
          }
        } catch (error) {
          console.error('姿势估计错误:', error);
        }
      }, 100); // 每100毫秒进行一次姿势估计
    },
    // 进行单次姿势估计
    async estimateSinglePose() {
      if (!this.videoElement || this.videoElement.videoWidth === 0 || this.videoElement.videoHeight === 0) {
        console.error('视频元素未准备好，无法进行姿势估计。');
        return null;
      }

      const pose = await this.poseNetModel.estimateSinglePose(this.videoElement, {
        flipHorizontal: false,
      });
      return pose;
    },
    // 绘制姿势到画布上
    drawPose(pose) {
      const canvas = this.$refs.canvas;
      const context = canvas.getContext('2d');
      context.clearRect(0, 0, canvas.width, canvas.height);

      // 绘制关键点
      pose.keypoints.forEach(keypoint => {
        if (keypoint.score > 0.5) {
          context.beginPath();
          context.arc(keypoint.position.x, keypoint.position.y, 5, 0, 2 * Math.PI);
          context.fillStyle = 'red';
          context.fill();
        }
      });

      // 绘制骨架
      const adjacentKeyPoints = posenet.getAdjacentKeyPoints(pose.keypoints, 0.5);
      adjacentKeyPoints.forEach(pair => {
        context.beginPath();
        context.moveTo(pair[0].position.x, pair[0].position.y);
        context.lineTo(pair[1].position.x, pair[1].position.y);
        context.strokeStyle = 'blue';
        context.lineWidth = 2;
        context.stroke();
      });
    },
  },
  beforeDestroy() {
    clearInterval(this.intervalId); // 清除定时器
    if (this.videoElement.srcObject) {
      this.videoElement.srcObject.getTracks().forEach(track => track.stop());
    }
  },
};
</script>

<style>
canvas {
  position: absolute;
  top: 0;
  left: 0;
  border: 1px solid black; 
}
</style>