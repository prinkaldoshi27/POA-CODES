def conversion(a):
    q = a
    temp = count - len(a)+1
    if (len(a)<(count+1)):
        q = "0"*temp + a
    return q

def twoc(a):
    k = a[-1]
    a = list(a)
    for i in range(len(a)):
        if a[i]=='0':
            a[i]='1'
        else:
            a[i]='0'
    a[-1]= k
    a = ''.join(a)
    return a

def leftshift(ac, q):
    a = ''
    b = ''
    for i in range (1, len(ac)):
        a += ac[i]
    a += q[0]
    for i in range(1, len(q)):
        b+= q[i]
    b+='_'
    return a,b

def add(a, b):
    max_len = max(len(a),len(b))
    carry = 0 
    result = ''
    for i in range(max_len-1, -1,-1):
        r = carry
        if a[i]=="1":
            r+=1
        if b[i]=="1":
            r+=1
        if r%2==1:
            result = '1'+result
        else:
            result = "0"+result
        if r < 2 :
            carry = 0
        else:
            carry = 1 
    return result

x = int(input("Enter Dividend (Q) : "))
y = int ( input("Enter Divisor (M) : "))

Q = bin(x).replace("0b","")
M = bin(y).replace("0b","")

count = len(Q)
M = conversion(M)
M2 = twoc(M)
A = conversion("0")

count1 = count
print("Count \t AC \t Q \t Operatins \n")
print(f" \t {A} \t {Q} \t Initial \n")
while(count1!=0):
    A, Q = leftshift(A, Q)
    print(f"{count1} \t {A} \t {Q} \t Left Shift \n")
    if A[0]=='1':
        A = add(A, M)
        print(f"\t {A} \t {Q} \t A = A + M \n ")
    else:
        A = add(A, M2)
        print(f"\t {A} \t {Q} \t A = A - M \n ")
    
    if A[0] == '1':
        Q = Q.replace("_","0")
        print(f"\t {A} \t {Q} \t Updated Q=0 \n")
    else:
        Q = Q.replace("_","1")
        print(f"\t {A} \t {Q} \t Updated Q=1 \n")
    count1 -= 1
if A[0]=='1':
    A = add(A, M)
    print(f"\t {A} \t {Q} \t A = A + M \n ")

print(f"Quotient : {Q} = {int(Q,2)}\n")
print(f"Remainder : {A} = {int(A,2)} \n")