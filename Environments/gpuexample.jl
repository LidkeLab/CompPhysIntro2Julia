## add CUDA

# https://juliagpu.org/
# https://cuda.juliagpu.org/dev/
using CUDA

CUDA.versioninfo()

#make gpu arrays
a=CuArray(rand(16,16));
b=CuArray(rand(16,16));

#matrix multiplication on gpu
c=a*b

#get it back from GPU
d=collect(c)


## kernel programming

function elemmult!(a,b,c)
    ii=threadIdx().x
    jj=threadIdx().y 
    sz=blockDim().x
    c[(ii-1)*sz+jj]=a[(ii-1)*sz+jj]*b[(ii-1)*sz+jj]
return nothing
end

a=CuArray(rand(16,16));
b=CuArray(rand(16,16));
c=CUDA.zeros(16,16)

@cuda threads=(16,16) blocks=1 elemmult!(a,b,c) 
d=collect(c)


