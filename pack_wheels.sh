mkdir -p oracle/pip_wheels
pip3 install wheel
pip3 wheel --wheel-dir oracle/pip_wheels -r oracle/requirements.txt -f https://download.pytorch.org/whl/cpu/torch_stable.html
tar -czvf - oracle/pip_wheels | split -b 32M - oracle/pip_wheels.tar.gz
rm -rf ./oracle/pip_wheels
cat $(find oracle -type f | sort) | sha256sum | awk '{print $1}'
