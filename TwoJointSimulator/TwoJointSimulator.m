%% Two Joint Simulator
% This script simulates the position of a two-joint robotic arm. It assumes
% a configuration where there is a portion of the arm pointing upwards in
% the y axis with a rotation vector along the same direction, with the
% second joint some distance above the first joint and with the vector of
% rotation pointing perpendicular to the first vector of rotation, pointing
% parallel to the x-z axis. You feed in angles and the program returns a
% position matrix, made up of position vectors for every joint

clc; clear all; close all;
angle = [0 pi/2];                 % Angle for joint one and then zero. In radians
lengths = [275.50 290.00]';     % Lenghts of each segment. In mm

angle(1) = input('What is the first angle?: ');
angle(2) = input('What is the second angle?: ');

pos = [0 0 0;    % Positions for joint 1 (always fixed y and rest zero)
       0 0 0];   % Positions for joint 2 (oh this is gonna be fun)

pos(1,:) = [0 lengths(1) 0];
pos(2,:) = [cos(angle(1))*cos(angle(2)) sin(angle(2)) cos(angle(2))*sin(angle(1))]*lengths(2) + pos(1,:);

% Plot the lines
figure

pos = [zeros(1,3); pos];
plot3(pos(:,1), pos(:,3), pos(:,2));

pos
