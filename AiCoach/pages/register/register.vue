<template>
  <view class="register-container">
    <view class="form-item">
      <input type="text" placeholder="请输入账号" v-model="account" />
    </view>
    <view class="form-item">
      <input type="email" placeholder="请输入邮箱" v-model="email" />
    </view>
    <view class="form-item">
      <input type="password" placeholder="请输入密码" v-model="password" />
    </view>
    <view class="form-item">
      <input type="password" placeholder="确认密码" v-model="confirmPassword" />
    </view>
    <button @click="register">注册</button>
  </view>
</template>

<script>
export default {
  data() {
    return {
      account: '',          // 修改为 account
      email: '',
      password: '',
      confirmPassword: ''
    };
  },
  methods: {
    register() {
      if (this.password !== this.confirmPassword) {
        uni.showToast({
          title: '两次输入的密码不一致',
          icon: 'none'
        });
        return;
      }

      uni.request({
        url: "http://localhost:8080/users/register",
        method: 'POST',
        data: {
          account: this.account,  // 确保使用 account
          email: this.email,
          password: this.password
        },
        success: (res) => {
          if (res.statusCode === 200) {
            uni.showToast({
              title: '注册成功',
              icon: 'success'
            });
            uni.navigateTo({
              url: '/pages/login/login'
            });
          } else {
            uni.showToast({
              title: res.data.message || '注册失败',
              icon: 'none'
            });
          }
        },
        fail: (err) => {  // 添加失败处理
          uni.showToast({
            title: '请求失败，请稍后再试',
            icon: 'none'
          });
        }
      });
    }
  }
};
</script>

<style scoped>
.register-container {
  padding: 20px;
}
.form-item {
  margin-bottom: 15px;
}
</style>
