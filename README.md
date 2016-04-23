taobaoip
=========

Given an IPv4 address, get its geography information
via [ip.taobao.com][] (淘宝IP地址库).

Given a domain, get geography information of routes.

[ip.taobao.com]: http://ip.taobao.com/

Install
--------

### Dependencies

- curl
- jq
- mtr

### With basher

```sh
; basher install weakish/taobaoip
```

Require [basher][] version: `>=39875bc`.

[basher]: https://github.com/basherpm/basher


### Manually

You just need to download `taobaoip.sh` and put it into your `$PATH`,
probably after renaming to `taobaoip` and `chomd a+x`.


Usage
-------

```sh
; taobaoip -h
Usage: taobaoip <ip>|<hostname>
(64) ; taobaoip 140.205.140.33
中国华东上海市上海市阿里巴巴
; taobaoip ip.taobao.com
未分配或者内网IP
未分配或者内网IP
中国华东江苏省南京市
中国华东江苏省南京市
中国华东江苏省南京市
中国华东江苏省南京市
中国华东江苏省南京市
中国华东江苏省南京市联通
中国华东江苏省南京市联通
中国华东江苏省南京市联通
中国华北北京市北京市联通
中国华东上海市上海市联通
中国华东上海市上海市联通
中国华东上海市上海市阿里巴巴
```
