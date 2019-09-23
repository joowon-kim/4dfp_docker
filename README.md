# 4dfp docker

* Docker recipe for 4dfp (https://dosenbachlab.wustl.edu/wiki/4dfp/)

---

### Installation
* Download `4dfp_scripts.tar` and `nil-tools.tar` from `ftp://imaging.wustl.edu/pub/raichlab/4dfp_tools`.
* If you have `diff_4dfp_js.c` and `diff_4dfp_js.mak`, copy them here and modify Dockerfile.
* build docker: `docker build -t 4dfp .`
* copy `4dfp_d.sh` into your PATH environment directory.

* Note: If you want to install altas, download `refdir.tar` and modify Dockerfile to uncompress it and set REFDIR environment variable.

