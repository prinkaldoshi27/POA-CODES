def conversion(a):
    q = ''
    temp = count - len(a)
    if (len(a)!=count):
        q = "0"* temp+a
    return q

def twoc(a):
    l = list(a)
    for i in range(len(l)):
         if l[i] == "1" :
             l[i] = "0"
         else: l[i] ="1"
    b = "0"*(len(l)-1) + "1" 
    return add("".join(l),b)

def add(a, b):
    max_len = max(len(a),len(b))
    carry = 0
    result = ''
    for i in range(max_len-1,-1,-1):
        r = carry
        if a[i]=='1':
            r+=1
        if b[i]=='1':
            r+=1
        if r%2==1:
            result = '1'+result
        else:
            result = '0'+result
        if r<2:
            carry = 0
        else:
            carry = 1
    return result

def rightshift(ac,q,q1):
    a = ac[0]
    for i in range(1,len(ac)):
        a+=ac[i-1]
    b = ac[-1]
    for j in range(1,len(q)):
        b+=q[j-1]
    c = q[-1]
    return a,b,c
   
x = int(input("Enter Multiplicand (Q) : "))
y = int(input("Enter Multiplier (M) : "))

a = bin(x).replace("0b","")
b = bin(y).replace("0b","")

neg_a = 0
neg_b = 0

if a[0] == '-':
    neg_a = 1
    a = a.replace("-","")
if b[0] == '-':
    neg_b = 1
    b = b.replace("-","")
    

if len(a)> len(b):
    count = len(a)+1
else:
    count = len(b)+1

firstP = conversion(a)
firstN = twoc(firstP)
secondP = conversion(b)
secondN = twoc(secondP)

if neg_a == 0:
    M = firstP
    M2 = firstN
else:
    M = firstN
    M2 = firstP

if neg_b == 0:
    Q = secondP
else:
    Q = secondN

AC = conversion("0")
Q1 = '0'

count1 = count
print("Count \t AC \t Q \t Q1 \t Operations \n")
print(f" \t {AC} \t {Q} \t {Q1} \t Initial \n")

while(count1 > 0):
    compare = Q[-1] + Q1
    if compare[0] == compare[-1]:
        AC, Q, Q1 = rightshift(AC,Q,Q1)
        print(f"{count1} \t {AC} \t {Q} \t {Q1} \t Right Shift \n")
    elif compare == "10":
        AC = add(AC,M2)
        AC, Q, Q1 = rightshift(AC,Q,Q1)
        print(f"{count1} \t {AC} \t {Q} \t {Q1} \t AC = AC - M2 \n")
    elif compare == "01":
        AC = add(AC,M)
        AC, Q, Q1 = rightshift(AC,Q,Q1)
        print(f"{count1}\t {AC} \t {Q} \t {Q1} \t AC = AC + M \n")
    count1 -=1
    answer = AC + Q
    
if neg_a == neg_b:
    ans = str(int(answer,2))
else:
    ans = twoc(answer)
    ans = '-'+str(int(ans,2))
print(f"Product of {x} and {y} is {ans}")

