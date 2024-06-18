def main():
    menu = """
    [d] Depositar
    [s] Sacar
    [e] Extrato
    [q] Sair

    => """

    saldo = 0
    LIMITE = 500
    extrato = ""
    numero_saques = 0
    LIMITE_SAQUES = 3

    while True:
        opcao = input(menu).lower()

        if opcao == "d":
            saldo, extrato = depositar(saldo, extrato)
        elif opcao == "s":
            saldo, extrato, numero_saques = sacar(saldo, LIMITE, extrato, numero_saques, LIMITE_SAQUES)
        elif opcao == "e":
            exibir_extrato(saldo, extrato)
        elif opcao == "q":
            break
        else:
            print("Operação inválida, por favor selecione novamente a operação desejada.")

def depositar(saldo, extrato):
    try:
        valor = float(input("Informe o valor do depósito: "))
        if valor > 0:
            saldo += valor
            extrato += f"Depósito: R$ {valor:.2f}\n"
            print("Depósito realizado com sucesso!")
        else:
            print("Operação falhou! O valor informado é inválido.")
    except ValueError:
        print("Operação falhou! Valor inválido.")
    return saldo, extrato

def sacar(saldo, LIMITE, extrato, numero_saques, LIMITE_SAQUES):
    try:
        valor = float(input("Informe o valor do saque: "))
        if valor <= 0:
            print("Operação falhou! O valor informado é inválido.")
        elif valor > saldo:
            print("Operação falhou! Você não tem saldo suficiente.")
        elif valor > LIMITE:
            print("Operação falhou! O valor do saque excede o limite.")
        elif numero_saques >= LIMITE_SAQUES:
            print("Operação falhou! Número máximo de saques excedido.")
        else:
            saldo -= valor
            extrato += f"Saque: R$ {valor:.2f}\n"
            numero_saques += 1
            print("Saque realizado com sucesso!")
    except ValueError:
        print("Operação falhou! Valor inválido.")
    return saldo, extrato, numero_saques

def exibir_extrato(saldo, extrato):
    print("\n================ EXTRATO ================")
    if not extrato:
        print("Não foram realizadas movimentações.")
    else:
        print(extrato)
    print(f"\nSaldo: R$ {saldo:.2f}")
    print("==========================================")

if __name__ == "__main__":
    main()
