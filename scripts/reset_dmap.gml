/// reset_dmap
i = 0;
repeat (80) {
    j = 0;
    repeat (80) {
        global.dmap[i, j] = 0;
        global.dmapPrev[i, j] = 0;
        j += 1;
    }
    i += 1;
}
