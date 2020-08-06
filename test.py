import chirality1

nx1 = 0
ny1 = 0
nz1 = 0

nx2 = 1
ny2 = 0
nz2 = 1

nx3 = 0
ny3 = 1
nz3 = 0

nx4 = 0
ny4 = 0
nz4 = 1

m1 = 1 #1 = 0.5 (I think)
m2 = -1 #-1 = -0.5
m3 = 1
m4 = 1

t1 = 1
t2 = 1
t3 = 1
t4 = 1

L = 5.0

twistx = 0.0
twisty = 0.0
twistz = 0.0

real_mat, im_mat = chiral_pot(nx1, ny1, nz1, nx2, ny2, nz2, nx3, ny3, nz3,
      nx4, ny4, nz4, m1, m2, m3, m4, t1, t2, t3, t4, L,
      twistx, twisty, twistz)

print(real_mat, im_mat)
