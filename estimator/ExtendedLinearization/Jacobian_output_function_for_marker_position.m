function dhi_sub = Jacobian_output_function_for_marker_position(in1,in2)
%JACOBIAN_OUTPUT_FUNCTION_FOR_MARKER_POSITION
%    DHI_SUB = JACOBIAN_OUTPUT_FUNCTION_FOR_MARKER_POSITION(IN1,IN2)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    23-Mar-2020 10:54:17

X_sym4 = in1(4,:);
X_sym5 = in1(5,:);
X_sym6 = in1(6,:);
mx1 = in2(1,:);
mx2 = in2(2,:);
mx3 = in2(3,:);
t2 = conj(X_sym4);
t3 = conj(X_sym5);
t4 = conj(X_sym6);
t5 = conj(mx1);
t6 = conj(mx2);
t7 = conj(mx3);
t8 = cos(t2);
t9 = cos(t3);
t10 = cos(t4);
t11 = sin(t2);
t12 = sin(t3);
t13 = sin(t4);
t14 = t8.*t10;
t15 = t8.*t13;
t16 = t10.*t11;
t17 = t11.*t13;
t18 = t12.*t14;
t19 = t12.*t15;
t20 = t12.*t16;
t21 = t12.*t17;
t22 = -t19;
t23 = -t20;
t24 = t14+t21;
t25 = t17+t18;
t26 = t15+t23;
t27 = t16+t22;
dhi_sub = reshape([1.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,1.0,t6.*t25+t7.*t26,-t7.*t24-t6.*t27,t6.*t8.*t9-t7.*t9.*t11,-t5.*t10.*t12+t7.*t9.*t14+t6.*t9.*t16,-t5.*t12.*t13+t7.*t9.*t15+t6.*t9.*t17,-t5.*t9-t7.*t8.*t12-t6.*t11.*t12,-t6.*t24+t7.*t27-t5.*t9.*t13,-t6.*t26+t7.*t25+t5.*t9.*t10,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[3,12]);
