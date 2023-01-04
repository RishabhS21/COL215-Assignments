def slice_horizontal_ele(l, a, b):
    if a == None and b == None:
        return l, (0, 3)
    elif a == None:
        if b == 0:
            return [l[0], l[3]], (3, 0)
        else:
            return [l[1], l[2]], (1, 2)
    elif b == None:
        if a == 0:
            return [l[0], l[1]], (0, 1)
        else:
            return [l[2], l[3]], (2, 3)
    else:
        if a == 1 and b == 0:
            return [l[3]], (3, 3)
        else:
            return [l[a + b]], (a + b, a + b)


def is_legal_region(kmap_function, term):

    # Handling 2-input kmap
    legal = False
    if len(kmap_function) == 2 and len(kmap_function[0]) == 2:
        if term[0] == None and term[1] == None:
            if (kmap_function[0].count(0)) == 0 and kmap_function[1].count(0) == 0:
                legal = True
            return ((0,0),(1,1),legal)
        elif term[0] == None:
            if (kmap_function[0][term[1]]) != 0 and (kmap_function[1][term[1]]) != 0:
                legal = True
            return ((term[1],0),(term[1],1),legal)
        elif term[1] == None:
            if (kmap_function[0][term[0]]) != 0 and (kmap_function[1][term[0]]) != 0:
                legal = True
            return ((0,term[0]),(1,term[0]),legal)
        else:
            if kmap_function[term[1]][term[0]] != 0:
                legal = True
            return ((term[1],term[0]),(term[1],term[0]),legal)

    # Handling 3-input kmap
    elif len(kmap_function) == 2 and len(kmap_function[0]) == 4:

        if term[2] != None:
            region, pos = slice_horizontal_ele(kmap_function[term[2]], term[0], term[1])
            if (region.count(0) == 0):
                legal = True
            return ((term[2],pos[0]),(term[2],pos[1]),legal)
        else:
            region1, pos1 = slice_horizontal_ele(kmap_function[0], term[0], term[1])
            region2, pos2 = slice_horizontal_ele(kmap_function[1], term[0], term[1])
            if region1.count(0) == 0 and region2.count(0) == 0:
                legal = True
            return ((0,pos1[0]),(1,pos1[1]),legal)

    # Handling 4-input kmap
    else:
        if (term[3] == None) and (term[2] == None):
            region1, pos1 = slice_horizontal_ele(kmap_function[0], term[0], term[1])
            region2, pos2 = slice_horizontal_ele(kmap_function[1], term[0], term[1])
            region3, pos3 = slice_horizontal_ele(kmap_function[2], term[0], term[1])
            region4, pos4 = slice_horizontal_ele(kmap_function[3], term[0], term[1])
            if (region1.count(0) == 0 and region2.count(0) == 0) and (region3.count(0) == 0 and region4.count(0) == 0):
                legal = True
            return ((0,pos1[0]),(3,pos1[1]),legal)
        elif term[2] == None:
            if term[3] == 0:
                region1, pos1 = slice_horizontal_ele(kmap_function[3], term[0], term[1])
                region2, pos2 = slice_horizontal_ele(kmap_function[0], term[0], term[1])
                if region1.count(0) == 0 and region2.count(0) == 0:
                    legal = True
                return ((3,pos1[0]),(0,pos1[1]),legal)
            else:
                region1, pos1 = slice_horizontal_ele(kmap_function[1], term[0], term[1])
                region2, pos2 = slice_horizontal_ele(kmap_function[2], term[0], term[1])
                if region1.count(0) == 0 and region2.count(0) == 0:
                    legal = True
                return ((1,pos1[0]),(2,pos1[1]),legal)
        elif term[3] == None:
            if term[2] == 0:
                region1, pos1 = slice_horizontal_ele(kmap_function[0], term[0], term[1])
                region2, pos2 = slice_horizontal_ele(kmap_function[1], term[0], term[1])
                if region1.count(0) == 0 and region2.count(0) == 0:
                    legal = True
                return ((0,pos1[0]),(1,pos1[1]),legal)
            else:
                region1, pos1 = slice_horizontal_ele(kmap_function[2], term[0], term[1])
                region2, pos2 = slice_horizontal_ele(kmap_function[3], term[0], term[1])
                if region1.count(0) == 0 and region2.count(0) == 0:
                    legal = True
                return ((2,pos1[0]),(3,pos1[1]),legal)
        else:
            if term[2] == 1 and term[3] == 0:
                vertical_pos = 3
            else:
                vertical_pos = term[2] + term[3]

            region, pos = slice_horizontal_ele(kmap_function[vertical_pos], term[0], term[1])
            if region.count(0) == 0:
                legal = True
            return ((vertical_pos,pos[0]),(vertical_pos,pos[1]),legal)
