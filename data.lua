-- To run this code, open a new iTorch notebook
-- at the same directory as this file,
-- and run this command:
-- require "data"
-- or
-- dofile "data.lua"
-- the first one caches the file, but not the second one
Plot = require 'itorch.Plot'
-- This is the number of data points:
N = 1000
-- This is the number of parameters for each point:
M = 2
--[[ First we make a set of random data points.
torch.rand(dim1,dim2) generates a dim1 x dim2 tensor with uniformrandom numbers 
--]]
allData = torch.rand(N,M):mul(2.3)
-- :mul multiplies the tensor generated by torch. 

-- The polynomial function code is obtained from:
-- https://github.com/xfbs/PiL3/blob/master/06MoreAboutFunctions/polynomial.lua
function polynomial(coefficients)
    return function(x)
        y = 0
        cur_x = 1
        for i = #coefficients, 1, -1 do
            y = y + cur_x * coefficients[i]
            if i ~= 1 then cur_x = cur_x * x end
        end
        return y
    end
end

idealBoundary = polynomial{1, -2.3, 1.32, 0.82}

for i = 1,N do
    if allData[i][2] > idealBoundary(allData[i][1]) then
        if not torch.isTensor(positiveData) then
        	positiveData = torch.reshape(allData[i], 1, M)
        else
        	positiveData = torch.cat(positiveData, torch.reshape(allData[i], 1, M), 1)
    	end
    else
        if not torch.isTensor(negativeData) then
        	negativeData = torch.reshape(allData[i], 1, M)
        else
        	negativeData = torch.cat(negativeData, torch.reshape(allData[i], 1, M), 1)
    	end
    end
end

idealBoundaryPoints = {}
i = 0
for x = 0,2.01,0.01 do
    i = i + 1
    if i == 1 then
        idealBoundaryPoints = torch.Tensor({{x, idealBoundary(x)}})
    else
        idealBoundaryPoints = torch.cat(idealBoundaryPoints, torch.Tensor({{x, idealBoundary(x)}}), 1)
    end
end

plot = Plot():circle(positiveData:narrow(2,1,1):squeeze(), positiveData:narrow(2,2,1):squeeze(), 'green', 'Positive')
plot:circle(negativeData:narrow(2,1,1):squeeze(), negativeData:narrow(2,2,1):squeeze(), 'red', 'Negative')
plot:line(idealBoundaryPoints:narrow(2,1,1):squeeze(), idealBoundaryPoints:narrow(2,2,1):squeeze(), 'black', 'Ideal'):draw()
