
RM3 = rand(2,1000):mul(2.3)
plot = Plot():circle(RM3[1],RM3[2], 'green', 'All'):draw()

RM3 = torch.rand(2,1000):mul(2.3)
plot = Plot():circle(RM3[1],RM3[2], 'green', 'All'):draw()

Plot = require 'itorch.Plot'

RM3 = torch.rand(2,1000):mul(2.3)
plot = Plot():circle(RM3[1],RM3[2], 'green', 'All'):draw()

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

f = polynomial{0.82, 1.32, -2.3, 1}

xv = {}
for x = 0,2.5,0.01 do

xv = {}
y = {}
i = 0
for x = 0,2.5,0.01 do
    i = i+1
    xv[i]=x
    y[i]=f(x)
end

f(3)

xv = {}
yv = {}
i = 0
for x = 0,2.5,0.01 do
    i = i+1
    xv[i]=x
    y[i]=f(x)
end

xv

y

xv = {}
yv = {}
i = 0
for x = 0,2.5,0.01 do
    i = i+1
    xv[i]=x
    yv[i]=f(x)
end

plot:line(xv, yv, 'red', 'AtaL'):redraw()

f = polynomial{1, -2.3, 1.32, 0.82}

xv = {}
yv = {}
i = 0
for x = 0,2.5,0.01 do
    i = i+1
    xv[i]=x
    yv[i]=f(x)
end

plot:line(xv, yv, 'red', 'AtaL'):redraw()

RMP = {{},{}}
RMN = {{},{}}
for i = 1,#RM3 do
    if (RM3[2][i] > f(RM3[1][i])) then
        table.insert(RMP[1], RM3[1][i])
        table.insert(RMP[2], RM3[2][i])
    else
        table.insert(RMN[1], RM3[1][i])
        table.insert(RMN[2], RM3[2][i])
    end
end

RMP = {{},{}}
RMN = {{},{}}
for i = 1,N do
    if (RM3[2][i] > f(RM3[1][i])) then
        table.insert(RMP[1], RM3[1][i])
        table.insert(RMP[2], RM3[2][i])
    else
        table.insert(RMN[1], RM3[1][i])
        table.insert(RMN[2], RM3[2][i])
    end
end

RMP = {}
RMP[1] = {}
RMP[2] = {}
RMN = {}
RMN[1] = {}
RMN[2] = {}
for i = 1,N do
    if (RM3[2][i] > f(RM3[1][i])) then
        table.insert(RMP[1], RM3[1][i])
        table.insert(RMP[2], RM3[2][i])
    else
        table.insert(RMN[1], RM3[1][i])
        table.insert(RMN[2], RM3[2][i])
    end
end

N

N = 1000

RMP = {}
RMP[1] = {}
RMP[2] = {}
RMN = {}
RMN[1] = {}
RMN[2] = {}
for i = 1,N do
    if (RM3[2][i] > f(RM3[1][i])) then
        table.insert(RMP[1], RM3[1][i])
        table.insert(RMP[2], RM3[2][i])
    else
        table.insert(RMN[1], RM3[1][i])
        table.insert(RMN[2], RM3[2][i])
    end
end

#RMN

#RMP

#RMN[1]

#RMP[2]

plot = Plot():circle(RMP[1],RMP[2], 'green', 'Positive')
plot:circle(RMN[1],RMN[2], 'red', 'Negative')
plot:line(xv, yv, 'black', 'Ideal'):draw()


