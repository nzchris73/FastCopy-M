*FastCopy-M*ultilanguage
===========
"FastCopy-M" "FastCopy" 
FastCopy-M is a fork of open source soft FastCopy.

** The official final opensource version is 3.63, so FastCopy-M cannot follow up on the update.This project was modified to archive status because the source code has not been provided for more than one year.**

Now has the following language:

| Language | LCID Dec | Detail |
| --- | --- | --- |
| Japanese | 1041 | 日本語,Original |
| English | 1033 | Official translation by H.Shirouzu |
| Chinese, simplified | 2052 | 简体中文，从英文翻译而来 |
| Chinese, traditional | 1028 | 繁体中文，用MS Word從簡中轉換而來，稍加修訂 |

## Original FastCopy feature | FastCopy
1. FastCopy is the Fastest Copy/Backup Software on Windows.
1. It supports UNICODE and over MAX_PATH (260 characters) file pathnames.
1. Because it uses multi-threads for Read/Write/Verify, Overlapped I/O, Direct I/O, so it brings out the best speed of devices.
1. It supports Include/Exclude filter like a UNIX wildcard.
1. It runs fast and does not hog resources, because MFC is not used. (Designed using Win32 API and C Runtime only)
## FastCopy-M feature
FastCopy Chinesization and modify to support other language more overall, add language only need add new resources
Support use http url to replace "chm" help files, change "IDS_FASTCOPYHELP" in resource to your URL.  
![URL help](http://ww4.sinaimg.cn/large/6c84b2d6gw1ewbd1y0bygj20rw0le4bq.jpg)
## How to Build | 
FastCopy-M used [VS2017](https://www.visualstudio.com/en-us/downloads/download-visual-studio-vs.aspx) with v141 tools.

### Auto zip release | 
1. Use VS2017 to build 32-bit and 64-bit release for FastCopy projects.
1. Create a `vendor` folder in the code root directory and place the `hhc.exe`, `hha.dll`([HTML Help Workshop](https://docs.microsoft.com/zh-cn/previous-versions/windows/desktop/htmlhelp/microsoft-html-help-downloads)) and `7z.exe`([7-Zip](https://sparanoid.com/lab/7z/)) three files in.
1. `AutoZipRelease.vbs`。  
Execute `AutoZipRelease.vbs`.
1. A 32-bit and 64-bit two zip compression packages will be generated under the code root directory.

## Website
* ### FastCopy-M website | FastCopy-M
  http://mapaler.github.io/FastCopy-M/
* ### Official website | FastCopy
  https://fastcopy.jp/

* ### Official GitHub Repository | FastCopy
  https://github.com/shirouzu/FastCopy
  >FastCopy-M GitHub FastCopy
  >Because FastCopy-M uploaded the source code at GitHub earlier than FastCopy official (previously only posted on the official website), this repository does not directly clone the official repository.
## Official License | FastCopy
>FastCopy ver3.x  
>&nbsp;Copyright(C) 2004-2019 SHIROUZU Hiroaki All rights reserved.  
>&nbsp;Copyright(C) 2018-2019 FastCopy Lab, LLC. All rights reserved.
> 
> This program is free software. You can redistribute it and/or modify it under the GNU General Public License version 3(GPLv3).  
> [License details](https://fastcopy.jp/help/license-gpl3.txt)

> xxHash Library Copyright (c) 2012-2016, Yann Collet All rights reserved.  
> [License details](https://fastcopy.jp/help/xxhash-LICENSE.txt).
