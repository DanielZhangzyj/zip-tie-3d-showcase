# 3D 扎带交互展示应用

## 在线体验
**[👉 点击访问在线演示](https://ej3lnrjo4xxkk.ok.kimi.link)**

## 项目简介
基于 Three.js 和 MediaPipe Hands 的 3D 扎带产品交互展示应用。用户可以通过摄像头捕捉手势，实现对 3D 扎带模型的旋转、缩放和平移操作。

## 功能特性

### 3D 渲染
- 10款不同型号的扎带产品 3D 模型（程序生成）
- 逼真的材质渲染（塑料、金属、PEEK、魔术贴等）
- 专业光照系统（环境光 + 方向光 + 点光源）
- 阴影效果和地面网格
- 7种不同结构的扎带 3D 模型类型

### 手势控制
- **手掌移动**：旋转 3D 模型
- **张开手掌**：放大模型
- **握拳**：缩小模型
- **握拳 + 移动**：平移模型

### 降级方案（无摄像头）
- 鼠标左键拖拽：旋转模型
- 鼠标滚轮：缩放模型
- 鼠标右键拖拽：平移模型

## 产品列表
| 编号 | 型号 | 名称 | 材质 | 耐温 |
|------|------|------|------|------|
| 1 | T30R | 内锯齿 PA66HS 扎带 | PA66HS | +105°C |
| 2 | PT2A | PEEK 外锯齿高温扎带 | PEEK | +240°C |
| 3 | MBT8S | 不锈钢 316L 扎带 | SS316L | -60~+300°C |
| 4 | TEXTIE M | 魔术贴可释放扎带 | PA66/PP | -40~+85°C |
| 5 | T50SVCOC25-31 | 带管道固定夹扎带 | PA66HS/PA66HIRHS | +105°C |
| 6 | KR8/43 | 无锯齿玻璃纤维销锁定扎带 | PA66HS | +105°C |
| 7 | T18R | PA46 耐高温扎带 | PA46 | +150°C |
| 8 | T30RFT5 | 带杉树固定脚扎带 | PA66HS/PA66HIRHS | +105°C |
| 9 | KR8/S1 | 无尽长度扎带系统 | PA66HS | +105°C |
| 10 | SR255S | 可释放重型扎带 | PA66HIRHSUV | +105°C |

## 技术栈
- Three.js (r160+) - 3D 渲染引擎
- MediaPipe Hands - 手势识别
- ES6 Modules - 模块化开发
- Nginx - 静态文件服务
- Docker / Docker Compose - 容器化部署

## 快速开始

### 方法一：在线访问（推荐）
直接访问已部署的网站： **[https://ej3lnrjo4xxkk.ok.kimi.link](https://ej3lnrjo4xxkk.ok.kimi.link)**

### 方法二：Docker 部署

```bash
# 克隆仓库
git clone https://github.com/DanielZhangzyj/zip-tie-3d-showcase.git
cd zip-tie-3d-showcase

# 下载产品图片
bash download-images.sh

# 构建并运行 Docker 容器
docker-compose up -d

# 访问应用
open http://localhost:8080
```

### 方法三：本地开发

```bash
# 克隆仓库
git clone https://github.com/DanielZhangzyj/zip-tie-3d-showcase.git
cd zip-tie-3d-showcase

# 下载产品图片
bash download-images.sh

# 启动本地 HTTP 服务器（需要支持 ES6 Modules）
python3 -m http.server 8080
# 或
npx serve .

# 访问 http://localhost:8080
```

### 方法四：直接使用 Docker 命令

```bash
# 下载图片
bash download-images.sh

# 构建镜像
docker build -t zip-tie-3d-showcase .

# 运行容器
docker run -d -p 8080:80 --name zip-tie-3d-showcase zip-tie-3d-showcase
```

## 手势操作指南

| 手势 | 3D 操作 |
|------|---------|
| ✋ 手掌上下左右移动 | 旋转模型 |
| 🖐️ 张开手掌（五指张开）| 放大 |
| ✊ 握拳（四指弯曲）| 缩小 |
| ✊ + ⬅️➡️ 握拳移动 | 平移模型 |

## 项目结构

```
zip-tie-3d-showcase/
├── index.html              # 主应用（3D 渲染 + 手势识别 + UI）
├── Dockerfile              # Docker 镜像配置
├── docker-compose.yml      # Docker Compose 配置
├── nginx.conf              # Nginx 服务器配置
├── download-images.sh      # 图片下载脚本
├── README.md               # 项目说明
├── .dockerignore           # Docker 忽略规则
└── assets/
    └── images/             # 产品图片目录
        ├── tie1_T30R_main.jpg
        ├── tie2_PT2A_main.jpg
        ├── tie3_MBT8S_main.jpg
        ├── tie4_TEXTIE_main.jpg
        ├── tie5_SVCOC_main.jpg
        ├── tie6_KR8_main.jpg
        ├── tie7_T18R_main.jpg
        ├── tie8_RFT5_main.jpg
        ├── tie9_KR8S1_main.jpg
        └── tie10_SR255S_main.jpg
```

## Docker 支持

本项目包含完整的 Docker 配置：
- **Dockerfile**: 基于 Nginx Alpine 的轻量级镜像
- **docker-compose.yml**: 一键启动，端口映射 8080:80
- **nginx.conf**: 配置 gzip 压缩、缓存策略、安全头
- **Health Check**: 容器健康检查

```bash
# 一键部署
docker-compose up -d

# 查看容器状态
docker ps

# 查看日志
docker logs zip-tie-3d-showcase

# 停止服务
docker-compose down
```

## 浏览器兼容性
- Chrome 90+
- Firefox 90+
- Safari 15+
- Edge 90+

> 注意：使用摄像头功能需要 HTTPS 或 localhost 环境。

## 数据来源
- 产品图片来源于 [HellermannTyton 官网](https://www.hellermanntyton.com)
- 产品规格信息来源于 HellermannTyton 产品目录

## 开源协议
MIT License
