def convert_bool(s):
    s1 = ''
    c1 = ''
    for c in s:
        if c == "'":
            s1 += '0'
            c1 = ''
        elif len(c1) == 0:
            c1 += c
        elif len(c1) != 0:
            s1 += '1'
            c1 = c
    if len(c1) == 1:
        s1 += '1'
    return s1


def convert_string(e):
    s = ''
    for i in range(len(e)):
        if e[i] == 'x':
            continue
        elif e[i] == '1':
            s += chr(i + 97)
        elif e[i] == '0':
            s += chr(i + 97) + "'"
    return s


def unique(l):
    L = []
    for i in range(len(l)):
        if l[i] not in L:
            L.append(l[i])
    return L


def comb_function_expansion(func_TRUE, func_DC):
    func_T = [convert_bool(x) for x in func_TRUE]
    func_D = [convert_bool(x) for x in func_DC]
    size = len(func_T[0])
    l = helper(func_T, func_D)
    r = []
    for e in func_T:
        max_x_count = 0
        ind = 0
        for i in range(len(l)):
            x_count = 0

            found = True
            for j in range(size):
                if l[i][j] == 'x':
                    x_count += 1
                    continue
                elif l[i][j] != e[j]:
                    found = False
            if (found and x_count > max_x_count) or (found and x_count==0 and max_x_count==0):
                max_x_count = x_count
                ind = i
        r.append(l[ind])
    return r


def helper(func_T, func_D):
    size = len(func_T[0])
    output = []
    for i in range(len(func_T)):
        l = []
        for j in range(len(func_T)):
            count = 0
            new = ''
            if i == j:
                continue
            for k in range(size):
                if count == 0 and func_T[i][k] != func_T[j][k]:
                    new += 'x'
                    count += 1
                elif func_T[i][k] == func_T[j][k]:
                    new += func_T[i][k]

            if len(new) == size:
                l.append(new)

        for j in range(0, len(func_D)):
            count = 0
            new = ''
            for k in range(size):
                if count == 0 and func_T[i][k] != func_D[j][k]:
                    new += 'x'
                    count += 1
                elif func_T[i][k] == func_D[j][k]:
                    new += func_T[i][k]

            if len(new) == size:
                l.append(new)

        if len(l) == 0:
            output.append(func_T[i])

    l = []
    for i in range(len(func_T)):
        for j in range(i + 1, len(func_T)):
            count = 0
            new = ''
            for k in range(size):
                if count == 0 and func_T[i][k] != func_T[j][k]:
                    new += 'x'
                    count += 1
                elif (count == 0 or count == 1) and func_T[i][k] == func_T[j][k]:
                    new += func_T[j][k]
                else:
                    break
            if len(new) == size:
                l.append(new)

        for j in range(0, len(func_D)):
            count = 0
            new = ''
            for k in range(size):
                if count == 0 and func_T[i][k] != func_D[j][k]:
                    new += 'x'
                    count += 1
                elif (count == 0 or count == 1) and func_T[i][k] == func_D[j][k]:
                    new += func_D[j][k]
                else:
                    break
            if len(new) == size:
                l.append(new)
    l = unique(l)
    if len(l) != 0:
        output += (helper(l, []))
    return output

def check(element,prime_imp):
    length = len(list(element))
    found = True
    i = 0
    while found and i < length:
        if  (element[i] == prime_imp[i]) or prime_imp[i] == "x":
            i += 1
        else:
            found = False
    return found

def opt_function_reduce(func_TRUE, func_DC):
    l = comb_function_expansion(func_TRUE,func_DC)
    l = unique(l)
    for i in range(len(func_TRUE)):
        func_TRUE[i] = convert_bool(func_TRUE[i])
    table = []
    for i in range(len(l)):
        possible_ele = []
        for j in range(len(func_TRUE)):
            if check(func_TRUE[j],l[i]):
                possible_ele.append(func_TRUE[j])
            else:
                pass
        table.append([l[i],possible_ele])
    for x in table:
        k = table.index(x)
        truth = []
        others_one = []
        for i in range(len(table)):
            if i == k:
                pass
            else:
                others_one += table[i][1]
        others_one = unique(others_one)
        for i in range(len(x[1])):
            if others_one.count(x[1][i]) > 0:
                truth.append(1)
            else:
                truth.append(0)
        if truth.count(0) == 0:
            table.remove(x)
        else:
            pass
    ans = []
    for i in range(len(table)):
        ans.append(table[i][0])
    for i in range(len(ans)):
        ans[i] = convert_string(ans[i])
    return ans

# def demo():
#     pass
