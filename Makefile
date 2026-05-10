
NAME:=frankliu1 
REPO:=ubuntu
TAG:=novnc_xfce
UNAME_M := $(shell uname -m)

ifeq ($(UNAME_M),x86_64)
  ARCH := amd64
else ifeq ($(UNAME_M),aarch64)
  ARCH := arm64
else ifeq ($(UNAME_M),arm64)
  ARCH := arm64
else
  ARCH := $(UNAME_M)
endif

.PHONY: build_xfce

##build: build_ubuntu build_ctan build_custom
build: build_xfce

build_xfce: Dockerfile.xfce.$(ARCH)
	@docker build --no-cache -f Dockerfile.xfce.$(ARCH) -t frankliu1/ubuntu:novnc_xfce.$(ARCH) .

build_lxqt: Dockerfile.lxqt.$(ARCH)
	@docker build --no-cache -f Dockerfile.lxqt.$(ARCH) -t frankliu1/ubuntu:novnc_lxqt.$(ARCH) .

ALL: build

##
