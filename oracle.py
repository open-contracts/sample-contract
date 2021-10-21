import opencontracts
import urllib.request, certifi, ssl


with opencontracts.enclave_backend() as enclave:

  enclave.print("Enclave says hello!")

  # you need to call this before trying to connect to a domain
  enclave.open_up_domain("en.wikipedia.org")

  # use e.g. urllib to perform a secure https requests as you would anywhere
  ssl_context = ssl.create_default_context(cafile=certifi.where()) # checks certificate validity relative to Mozillas CA store
  with urllib.request.urlopen('https://en.wikipedia.org/wiki/Vitalik_Buterin', context=ssl_context) as f:
    html = f.read().decode('utf-8')
    enclave.print(html[:400])

  # starts an interactive chrome session at http://<EC2_IP>:14500
  # (en.wikipedia.org is still the only open domain)
  html = enclave.interactive_session(url='en.wikipedia.org', instructions="Do the thing then push the button.", tcp_port=14500)
  enclave.print(html[:200])

  pw = enclave.user_input("Gimme ya password")
  enclave.print(f"HAHA! Your password is {pw}.")
  enclave.submit(html[:200], pw, types=("string", "string"))


