def levenshteinDDP(token1, token2):
    t1=len(token1)
    t2=len(token2)
    d = [ [0] * (t2+1) for _ in range(t1+1) ]
    for i in range(t1+1):
        d[i][0] = i
    for i in range(t2+1):
        d[0][i] = i
    for i in range(1, t1+1):
        for j in range(1, t2+1):
            left=d[i-1][j]+1
            down=d[i][j-1]+1
            ld=d[i-1][j-1]
            # if they match, we don't need to add the difference
            # ld should be always the lowest
            if token1[i-1] != token2[j-1]:
                ld+=1
            d[i][j]=min(left,down,ld)
    print(d[t1][t2])
levenshteinDDP("hello", "hello")
levenshteinDDP("hell", "hello")
levenshteinDDP("hello", "hell11")
