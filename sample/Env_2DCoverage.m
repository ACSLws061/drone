function typical_Env_2DCoverage(agent)
%% environment class demo
% env property ��Env class�̃C���X�^���X�z��Ƃ��Ē�`
env_param.name="";
env_param.d = 0.1;
         %env_param.q	= [25 25];%�e�X�g�P�̗p
         %env_param.q	= [60 50;50 60;25 25];%�e�X�g�P�̗p
%env_param.q	= [9 74;13 72;13 77;25 45;31 36;32 31;35 38;36 25;40 28;42 24;44 20;49 25;50 28;52 20;54 23;77 88;83 81;84 73;85 78;89 86];%�d�v�_�ʒu
%env_param.q = env_param.q/10;
% Vertex �͈�M�����Ŕ����v���ɂȂ�悤�ɕ��ׂ�D
env_param.q	= [1 0;2, 1;4 -2];%�e�X�g�P�̗p
% env_param.Vertices=[0 0;100 30;50 100;0 30];
% env_param.Vertices=[-10 -20;100 0;100 50;0 50];
% env_param.Vertices=[-10 -20;100 0;100 50;50 80;0 50];
% env_param.Vertices=[0 0;100 0;100 100;0 100];
%env_param.Vertices=[0 0;10 0;10 10;0 10];
env_param.Vertices=[-2 -2.5;5.5 -2.5;5.5 3;-2 3]; % �S�̈�̃T�C�Y
assignin('base',"env_param",env_param);
evalin('base',"Env = DensityMap_sim([],env_param);");

for i = 1:length(agent)
    env(i).name = "density";
    env_param.q = []; % �d�v�x���͊ϑ����Ȃ��Ƃ킩��Ȃ��Ƃ����}�b�v
    env(i).type = "DensityMap_sim";
    env(i).param = env_param;
    env(i).param.id=i;
    agent(i).set_env(env(i));
end
end