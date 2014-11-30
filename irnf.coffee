$blab.irnf = (NF, Gain) ->
    lin = (x) -> 10.pow(x/10)
    dB = (x) -> 10*log(x)/log(10)
    IRNF = NF # initialize
    for k in [NF.length-2..0]
        nf = lin NF[k]
        g = lin Gain[k]
        IRNF[k] = dB(nf+(lin(IRNF[k+1])-1)/g)
    IRNF
