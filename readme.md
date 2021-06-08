# snort3 docker

## 下载依赖

```
mkdir ./docker
./get_docker.sh
```

## 编译&&启动

```
docker build -t snort3 .
docker run -d --name snort3 snort3
```

## 使用

```
docker-compose exec snort bash
snort -A alert_fast -k none -q -c /usr/local/etc/snort/snort.lua -R /opt/rules/local.rules --pcap-dir=/opt/pcap --pcap-show
```

![](./index.png)

## 其他

snort3规则编写变化参考 [规则变化说明](https://snort-org-site.s3.amazonaws.com/production/document_files/files/000/000/596/original/Rules_Writers_Guide_to_Snort_3_Rules.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIXACIED2SPMSC7GA%2F20210608%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210608T013255Z&X-Amz-Expires=172800&X-Amz-SignedHeaders=host&X-Amz-Signature=8dfdea8e15ec9e5730f7db4e095fedc812920aa2488ca9fa2c5f34a20cc15ac0)