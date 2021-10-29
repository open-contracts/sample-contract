mkdir -p oracle/pip_wheels
pip3 install wheel
pip3 wheel --wheel-dir oracle/pip_wheels -r oracle/requirements.txt -f https://download.pytorch.org/whl/cpu/torch_stable.html
zip -r -s 48m pip_wheels.zip oracle/pip_wheels/
rm -rf ./oracle/pip_wheels
cat $(find oracle -type f | sort) | sha256sum | awk '{print $1}'
