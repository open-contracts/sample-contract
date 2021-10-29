mkdir pip_wheels
pip3 install wheel
pip3 wheel --wheel-dir pip_wheels -r requirements.txt -f https://download.pytorch.org/whl/cpu/torch_stable.html
zip -r -s 48m pip_wheels.zip pip_wheels/
rm -rf ./pip_wheels
