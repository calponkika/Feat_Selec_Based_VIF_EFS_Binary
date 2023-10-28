function OUT= My_network(InputsP,Targets)
%%This algorithm uses three 3 metrics
[Inp,~]=size(InputsP);
 n =(round((Inp *2)/3))+2; %The number of output is 2
net = patternnet(n);
net.performFcn = 'crossentropy';
net.trainFcn = 'trainscg';
% % % net.layer{1}.transferFcn='Relu';
net=configure(net,InputsP, Targets);
 net.divideParam.trainRatio = 80/100;
 net.divideParam.valRatio = 10/100;
 net.divideParam.testRatio = 10/100;
 [net,~] = train(net, InputsP, Targets);
 outputs = net(InputsP);
 OUT={n,outputs};
end