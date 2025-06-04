import base64

arquivo = 'qrcode.png'

with open(arquivo, 'rb') as arquivo:
    conteudo_binario = arquivo.read()

conteudo_base64 = base64.b64encode(conteudo_binario)

conteudo_base64_str = conteudo_base64.decode('utf-8')

print(conteudo_base64_str)