# fMRI数据处理工具包

一个基于MATLAB的适配dpabi的数据处理与统计分析工具包,提供图形界面操作,简化从数据整理到统计分析的全流程。

## ✨ 功能特性

### 1. 数据整理模块
- **智能文件分类**: 自动识别并整理DPABI/DPARSF预处理后的结果文件
- **批量重命名**: 支持被试数据的批量重命名
- **文件夹结构优化**: 按照实验设计自动创建规范的文件夹结构

### 2. 指标提取模块

#### 静态指标
- **功能连接 (FC)**: 提取ROI间的功能连接矩阵
- **局部一致性 (ReHo)**: 计算局部区域的活动一致性
- **低频振幅 (ALFF)**: 提取低频振幅指标
- **分数低频振幅 (fALFF)**: 计算分数低频振幅
- **ROI信号**: 提取感兴趣区的时间序列信号
- **Fisher Z变换**: 对功能连接进行Fisher Z标准化

#### 动态指标
- **动态功能连接 (dFC)**: 
  - 均值 (Mean)
  - 标准差 (Std)
  - 变异系数 (CV)
- **动态ReHo**: 提取ReHo的时间动态特性
- **动态ALFF/fALFF**: 提取低频振幅的动态变化

### 3. 统计分析模块
- **配对/独立样本t检验**: 两组间差异比较
- **单因素重复测量方差分析**: 一个因素多个水平的比较
- **双因素重复测量方差分析**: 支持2×2, 2×3, 2×4, 3×3, 3×4设计
- **SPM集成**: 自动生成SPM批处理脚本并执行统计分析

## 🔧 系统要求

### 必需软件
- **MATLAB**: R2019b或更高版本
- **SPM12**: 用于统计参数映射分析
- **DPABI/DPARSF**: fMRI数据预处理工具包

## 📥 安装说明

### 方法1: 直接下载
```bash
# 克隆仓库
git clone https://github.com/yourusername/fmri-toolkit.git

# 进入项目目录
cd fmri-toolkit
```

### 方法2: 手动配置

1. 下载所有.m文件到同一文件夹
2. 在MATLAB中添加路径:
```matlab
% 添加工具包路径
addpath('path/to/fmri-toolkit');

% 如果需要,添加SPM12路径
addpath('path/to/spm12');
```

3. 运行主程序:
```matlab
Better  % 启动主界面
```

## 📖 使用指南

### 快速开始

#### 1. 启动主程序
```matlab
Better
```

#### 2. 数据整理流程

**文件夹分类整理**
1. 在"文件夹处理"面板选择源文件夹
2. 设置被试前缀(如'sub', 'S', 'A'等)
3. 输入要复制的文件夹关键词
4. 选择目标输出路径
5. 点击"开始整理"

**示例**:
```matlab
% 或直接调用函数
IMAsort('D:/rawdata', 'sub', 'FunImg', 'D:/output');
```

#### 3. 指标提取流程

**静态指标提取**
1. 在"预处理后结果分类"面板选择工作路径
2. 输入文件处理方式标识(如'ARCWSF')
3. 选择平滑方式(results/resultsS)
4. 勾选需要提取的指标
5. 设置输出路径
6. 点击"开始分类"

**动态指标提取**
1. 选择动态指标类型(CV/Mean/Std)
2. 勾选需要的动态指标(FC/ReHo/ALFF/fALFF)
3. 其他步骤同静态指标

#### 4. 统计分析流程

**双因素方差分析示例 (2×3设计)**
1. 启动统计分析界面:
```matlab
mix
```
2. 选择工作目录(包含分组数据的根目录)
3. 输入因素名称和水平名称:
   - 因子1名称: 如"组别"
   - 因子1各水平: 如"对照组,实验组"
   - 因子2名称: 如"时间点"
   - 因子2各水平: 如"基线,治疗中,治疗后"
4. 选择设计类型(2×3)
5. 点击"统计"开始分析

## 🗂️ 模块说明

### 核心模块

#### Better.m
主程序GUI界面,整合所有功能模块:
- 数据整理面板
- 指标提取面板
- 统计分析入口

#### IMAsort.m
智能文件分类整理工具:
```matlab
IMAsort(A_path, prefix, keyword, output_path)
% A_path: 母文件夹路径
% prefix: 被试文件夹前缀 (如'sub', 'S')
% keyword: 需要复制的文件夹关键词
% output_path: 目标根目录
```

**功能**:
- 递归搜索匹配关键词的文件夹
- 自动提取被试编号
- 批量复制到规范化路径

#### 静态指标提取模块

**FC.m** - 功能连接提取
```matlab
FC(A_path, prefix, suffix, D_path)
% 提取 zROI*FCMap 文件
% 按ROI编号自动分类
% 支持多被试批处理
```

**RF.m** - ReHo指标提取
```matlab
RF(A_path, prefix, suffix, D_path)
% 提取 zReHoMap 文件
% 自动识别被试编号
% 创建规范化输出结构
```

**FisherZ.m** - Fisher Z变换提取
```matlab
FisherZ(A_path, prefix, suffix, D_path)
% 提取 ROICorrelation_FisherZ 文件
% 保留.mat格式的相关矩阵
```

**ROI.m** - ROI信号提取
```matlab
ROI(A_path, prefix, suffix, D_path)
% 提取 ROISignals 文件
% 时间序列数据
```

#### 动态指标提取模块

**dFCmean.m / dFCstd.m / dFCcv.m** - 动态功能连接
```matlab
dFCmean(A_path, prefix, suffix, D_path)  % 均值
dFCstd(A_path, prefix, suffix, D_path)   % 标准差
dFCcv(A_path, prefix, suffix, D_path)    % 变异系数
% 从 TemporalDynamics 文件夹提取
% 支持多ROI并行处理
```

**dRFmean.m / dRFstd.m / dRFcv.m** - 动态ReHo
```matlab
dRFmean(A_path, prefix, suffix, D_path)  % 均值
dRFstd(A_path, prefix, suffix, D_path)   % 标准差
dRFcv(A_path, prefix, suffix, D_path)    % 变异系数
```

#### 统计分析模块

**mix.m**
统计分析GUI界面:
- 因素和水平设置
- 设计类型选择
- 自动调用相应分析函数

**x23.m** - 2×3设计
```matlab
x23(path, factor1, factor2, level1, level2)
% path: 数据根目录
% factor1/2: 因素名称
% level1/2: 各水平名称(逗号分隔)
```

**x24.m** - 2×4设计
**x33.m** - 3×3设计
**x34.m** - 3×4设计

所有统计函数自动:
- 读取.nii文件
- 构建SPM批处理
- 执行模型估计
- 生成SPM.mat

## 📁 文件结构

```
fmri-toolkit/
├── Better.m              # 主程序GUI
├── mix.m                 # 统计分析GUI
├── IMAsort.m            # 文件整理工具
├── 静态指标提取/
│   ├── FC.m             # 功能连接
│   ├── FCS.m            # 功能连接(平滑版)
│   ├── RF.m             # ReHo
│   ├── RFS.m            # ReHo(平滑版)
│   ├── FisherZ.m        # Fisher Z变换
│   └── ROI.m            # ROI信号
├── 动态指标提取/
│   ├── dFCmean.m        # 动态FC均值
│   ├── dFCstd.m         # 动态FC标准差
│   ├── dFCcv.m          # 动态FC变异系数
│   ├── dRFmean.m        # 动态ReHo均值
│   ├── dRFstd.m         # 动态ReHo标准差
│   └── dRFcv.m          # 动态ReHo变异系数
├── 统计分析/
│   ├── x23.m            # 2×3方差分析
│   ├── x24.m            # 2×4方差分析
│   ├── x33.m            # 3×3方差分析
│   └── x34.m            # 3×4方差分析
├── untitled.m           # 工具函数
└── README.md            # 说明文档
```

## 📊 数据组织示例

### 输入数据结构
```
原始数据/
├── sub01/
│   └── Results/
│       ├── FunImg/
│       └── TemporalDynamics/
├── sub02/
│   └── S1_Results/
│       ├── FunImg/
│       └── TemporalDynamics/
└── ...
```

### 输出数据结构
```
输出目录/
├── ReHo/              # 静态ReHo
│   ├── dataset1/
│   │   ├── S1/
│   │   ├── S2/
│   │   └── ...
│   └── dataset2/
├── FC1/               # ROI1的功能连接
│   ├── dataset1/
│   └── dataset2/
├── dynamic/           # 动态指标
│   ├── meanReHo/
│   ├── stdReHo/
│   ├── cvFC1/
│   └── ...
└── two-way-anova/     # 统计分析结果
    └── SPM.mat
```


## 🙏 致谢

- SPM开发团队
- DPABI/DPARSF开发团队
- 所有贡献者和使用者

## 📚 相关资源

- [SPM12文档](https://www.fil.ion.ucl.ac.uk/spm/doc/)
- [DPABI官网](http://rfmri.org/dpabi)
