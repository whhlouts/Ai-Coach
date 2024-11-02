# Ai-Coach
# 项目描述：
## 该项目旨在开发一个基于人工智能的健身教练系统，解决用户个性化服务不足的问题，为用户提供个性化的健身计划、实时运动监测和营养建议，通过Open Pose算法帮助用户进行动作矫正，建立简单的知识库并引入gpt4o进行健身咨询。
# 主要工作内容：
## 1.针对健身用户在使用现有教练系统时反馈流程复杂、个性化服务不足的问题，对100名健身用户进行深度调研，采用线上问卷调查和线下深度访谈相结合的方法，识别主要痛点，包括用户体验痛点、功能痛点、支持与服务痛点、信息透明度痛点等；
## 2.基于反馈进行需求分析，设计3个原型文件，确保系统简化流程并提升个性化服务；
## 3.针对主要痛点进行产品详细设计，包括简化登录流程，优化UI界面，使用gpt4o进行健身咨询等环节；
## 4.在使用gpt4o时出现答非所问、回答不够详细等问题，针对出现的问题进行搜索与思考，最终使用大模型RAG建立简单知识库，使用爬虫爬取健身相关文档，包括健身食谱、健身动作和健身计划等内容，填充知识库，方便对用户提出的问题进行针对性回答。
# 需求分析	
## 用户负责管理个人身体数据、设定健身目标、生成和跟踪训练计划，并通过系统进行动作评测和日常打卡，通过与GPT4O 进行对话获取健身知识。
## 总体业务分析：
## # ![活动图](https://github.com/user-attachments/assets/ed6d8ee5-0698-403e-bca4-02cb99243322)
# 系统总体设计：
## 采用“4+1"视图进行总体设计，如下所示：
## ![包图](https://github.com/user-attachments/assets/2c7c3580-5152-4e20-88c7-84326ac6bace)
## ![类图](https://github.com/user-attachments/assets/ef3f792b-122d-4f00-b2ed-391a34bf01ba)
## ![时序图](https://github.com/user-attachments/assets/7a0cc98b-4e28-471c-9b30-6ce71ce5baa3)
## ![E-R图](https://github.com/user-attachments/assets/4b703c9e-ef00-42d8-8d18-ecdc2bf456d4)
# 系统详细设计：
## 不同模块的时序图如下：
## 
# ![gpt4o 对话](https://github.com/user-attachments/assets/40f0a7b0-82ce-4651-8b0a-eb40392d9f23)