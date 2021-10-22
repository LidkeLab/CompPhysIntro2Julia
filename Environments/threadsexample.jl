# Show using threads and working with Julia Environments

# Add Julia extension (once)

# Start Julia REPL using cntr-shift-p
# Open Pkg environment using `]`

# add LinearAlgebra

# Backspace returns to Julia REPL

using LinearAlgebra
# Set number of threads in vscode Julie extenstion settings
Threads.nthreads()

sz=256
data = rand(sz, sz, 10)
datainv = zeros(size(data))

## Double # defines a blok - run with shift-enter
@time begin 
    for ii = 1:size(data, 3)
        println(ii)
        sleep(1)
    end
end

## use threads
@time begin 
    Threads.@threads for ii = 1:size(data, 3)
        println(ii)
        sleep(1)
    end
end
