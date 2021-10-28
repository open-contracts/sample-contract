import opencontracts
import urllib.request, certifi, ssl
import os


with opencontracts.enclave_backend() as enclave:

  enclave.print("Enclave says hello!")

  # you need to call this before trying to connect to a domain
  enclave.open_up_domain("en.wikipedia.org")

  # use e.g. urllib to perform a secure https requests as you would anywhere
  ssl_context = ssl.create_default_context(cafile=certifi.where()) # checks certificate validity relative to Mozillas CA store

  # with open('/backend/test.txt', 'w') as f:
  #   f.write("testing writing to backend/test.txt")

  ret = subprocess.check_output('echo "testing writing to backend/test.txt" > /backend/test.txt', shell=True)
  # with open('/backend/test.txt', 'r') as f:
  #   ret = f.read()
  print(ret)
  enclave.print(ret)

  # ret = ' '.join(os.listdir('/backend'))
  # print(ret)
  # enclave.print(ret)

  with urllib.request.urlopen('https://en.wikipedia.org/wiki/Charles_Hoskinson', context=ssl_context) as f:
    html = f.read().decode('utf-8')
    enclave.print(html[:400])

  # starts an interactive chrome session at http://<EC2_IP>:14500
  # (en.wikipedia.org is still the only open domain)
  html = enclave.interactive_session(url='en.wikipedia.org', instructions="Do the thing then push the button.", tcp_port=14500)
  enclave.print(html[:200])

  key = enclave.user_input("Please enter your website.com API key")
  enclave.print(f"API key received: {key}")
  enclave.submit(key+html[:100], types=("string",), function_name="saveFromEnclaveOnly")
