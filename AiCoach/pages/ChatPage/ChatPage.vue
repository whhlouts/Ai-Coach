<template>
  <view class="chat-container">
    <view class="messages">
      <view 
        v-for="(msg, index) in messages" 
        :key="index" 
        :class="{'user-message': msg.sender === 'user', 'ai-message': msg.sender === 'ai'}"
      >
        <text>{{ msg.content }}</text>
      </view>
    </view>
    <view class="input-area">
      <input v-model="userInput" placeholder="输入消息..." @keyup.enter="sendMessage" />
      <button @click="sendMessage">发送</button>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      userInput: '',
      messages: [],
      lastRequestTime: 0, // 记录上次请求的时间
      requestInterval: 1000, // 设置请求间隔为 1 秒
    };
  },
  methods: {
    async sendMessage() {
      if (!this.userInput.trim()) return;

      // 添加用户消息
      this.messages.push({ sender: 'user', content: this.userInput });

      try {
        // 检查请求间隔
        const currentTime = Date.now();
        if (currentTime - this.lastRequestTime < this.requestInterval) {
          // 等待直到达到请求间隔
          await this.delay(this.requestInterval - (currentTime - this.lastRequestTime));
        }

        // 调用ChatGPT API
        const response = await this.callChatGPT(this.userInput);
        
        // 添加AI消息
        this.messages.push({ sender: 'ai', content: response });
        this.lastRequestTime = Date.now(); // 更新上次请求时间
      } catch (error) {
        console.error("Error during message send:", error);
        this.messages.push({ sender: 'ai', content: "抱歉，我无法回应。" });
      } finally {
        // 清空输入框
        this.userInput = '';
      }
    },
    async callChatGPT(input) {
      const maxRetries = 3; // 最大重试次数
      let attempts = 0;
    
      while (attempts < maxRetries) {
        try {
          const response = await uni.request({
            url: 'https://api.openai.com/v1/chat/completions',
            method: 'POST',
            header: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer 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'
            },
            data: {
              model: "gpt-3.5-turbo", // 确保使用正确的模型
              messages: [{ role: 'user', content: input }],
              max_tokens: 3000
            }
          });
    
          // 确保返回的数据结构正确
          if (response && response.data && response.data.choices && response.data.choices.length > 0) {
            return response.data.choices[0].message.content; // 返回 AI 的响应内容
          } else {
            console.error("Invalid response structure:", response); // 输出完整响应以帮助调试
            throw new Error("无效的响应结构");
          }
        } catch (error) {
          console.error("Error calling ChatGPT API:", error);
          return "抱歉，我无法回应。";
        }
      }
      return "抱歉，我无法回应。"; // 超过最大重试次数仍然失败
    },
    delay(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }
  }
};
</script>

<style>
.chat-container {
  padding: 20rpx;
  background-color: #f8f8f8;
  min-height: 100vh;
}

.messages {
  max-height: 70vh;
  overflow-y: auto;
  margin-bottom: 20rpx;
}

.user-message {
  align-self: flex-end;
  background-color: #4caf50;
  color: white;
  border-radius: 10rpx;
  padding: 10rpx;
  margin: 5rpx 0;
}

.ai-message {
  align-self: flex-start;
  background-color: #e0e0e0;
  border-radius: 10rpx;
  padding: 10rpx;
  margin: 5rpx 0;
}

.input-area {
  display: flex;
  justify-content: space-between;
}

input {
  flex: 1;
  padding: 10rpx;
  border-radius: 5rpx;
  border: 1rpx solid #ccc;
}

button {
  margin-left: 10rpx;
  background-color: #4a90e2;
  color: white;
  border: none;
  border-radius: 5rpx;
  padding: 10rpx;
}
</style>
