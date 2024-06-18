// This program was cloned from: https://github.com/tharunchitipolu/Dadda-Multiplier-using-CSA
// License: Mozilla Public License 2.0


// A - 16 bits , B - 16 bits, Y(output) - 32 bits
//Here we used 8*8 dadda to implement 16*16.

module dadda_16(A,B,Y);
    
    input [15:0]A;
    input [15:0]B;
    
    output wire [31:0] Y;
//outputs of 8*8 dadda.    
    wire [15:0]y11,y12,y21,y22;

//sum and carry of final 2 stages.     
    wire [15:0]s_1,c_1;    
    wire [22:0] c_2;
    
    dadda_8 d1(.A(A[7:0]),.B(B[7:0]),.y(y11));
    dadda_8 d2(.A(A[7:0]),.B(B[15:8]),.y(y12));
    dadda_8 d3(.A(A[15:8]),.B(B[7:0]),.y(y21));
    dadda_8 d4(.A(A[15:8]),.B(B[15:8]),.y(y22));
    assign Y[7:0] = y11[7:0];
    
//Stage 1 - reducing fom 3 to 2
    
    csa_dadda c_11(.A(y11[8]),.B(y12[0]),.Cin(y21[0]),.Y(s_1[0]),.Cout(c_1[0]));
    assign Y[8] = s_1[0];
    csa_dadda c_12(.A(y11[9]),.B(y12[1]),.Cin(y21[1]),.Y(s_1[1]),.Cout(c_1[1]));
    csa_dadda c_13(.A(y11[10]),.B(y12[2]),.Cin(y21[2]),.Y(s_1[2]),.Cout(c_1[2]));
    csa_dadda c_14(.A(y11[11]),.B(y12[3]),.Cin(y21[3]),.Y(s_1[3]),.Cout(c_1[3]));
    csa_dadda c_15(.A(y11[12]),.B(y12[4]),.Cin(y21[4]),.Y(s_1[4]),.Cout(c_1[4]));
    csa_dadda c_16(.A(y11[13]),.B(y12[5]),.Cin(y21[5]),.Y(s_1[5]),.Cout(c_1[5]));
    csa_dadda c_17(.A(y11[14]),.B(y12[6]),.Cin(y21[6]),.Y(s_1[6]),.Cout(c_1[6]));
    csa_dadda c_18(.A(y11[15]),.B(y12[7]),.Cin(y21[7]),.Y(s_1[7]),.Cout(c_1[7]));
    csa_dadda c_19(.A(y22[0]),.B(y12[8]),.Cin(y21[8]),.Y(s_1[8]),.Cout(c_1[8]));
    csa_dadda c_110(.A(y22[1]),.B(y12[9]),.Cin(y21[9]),.Y(s_1[9]),.Cout(c_1[9]));
    csa_dadda c_111(.A(y22[2]),.B(y12[10]),.Cin(y21[10]),.Y(s_1[10]),.Cout(c_1[10]));
    csa_dadda c_112(.A(y22[3]),.B(y12[11]),.Cin(y21[11]),.Y(s_1[11]),.Cout(c_1[11]));
    csa_dadda c_113(.A(y22[4]),.B(y12[12]),.Cin(y21[12]),.Y(s_1[12]),.Cout(c_1[12]));
    csa_dadda c_114(.A(y22[5]),.B(y12[13]),.Cin(y21[13]),.Y(s_1[13]),.Cout(c_1[13]));
    csa_dadda c_115(.A(y22[6]),.B(y12[14]),.Cin(y21[14]),.Y(s_1[14]),.Cout(c_1[14]));
    csa_dadda c_116(.A(y22[7]),.B(y12[15]),.Cin(y21[15]),.Y(s_1[15]),.Cout(c_1[15]));
    
//Stage 2 - reducing fom 2 to 1
        // adding total sum and carry to get final output
    HA h1(.a(s_1[1]),.b(c_1[0]),.Sum(Y[9]),.Cout(c_2[0]));


    csa_dadda c_22(.A(s_1[2]),.B(c_1[1]),.Cin(c_2[0]),.Y(Y[10]),.Cout(c_2[1]));
    csa_dadda c_23(.A(s_1[3]),.B(c_1[2]),.Cin(c_2[1]),.Y(Y[11]),.Cout(c_2[2]));
    csa_dadda c_24(.A(s_1[4]),.B(c_1[3]),.Cin(c_2[2]),.Y(Y[12]),.Cout(c_2[3]));
    csa_dadda c_25(.A(s_1[5]),.B(c_1[4]),.Cin(c_2[3]),.Y(Y[13]),.Cout(c_2[4]));
    csa_dadda c_26(.A(s_1[6]),.B(c_1[5]),.Cin(c_2[4]),.Y(Y[14]),.Cout(c_2[5]));
    csa_dadda c_27(.A(s_1[7]),.B(c_1[6]),.Cin(c_2[5]),.Y(Y[15]),.Cout(c_2[6]));
    csa_dadda c_28(.A(s_1[8]),.B(c_1[7]),.Cin(c_2[6]),.Y(Y[16]),.Cout(c_2[7]));
    csa_dadda c_29(.A(s_1[9]),.B(c_1[8]),.Cin(c_2[7]),.Y(Y[17]),.Cout(c_2[8]));
    csa_dadda c_210(.A(s_1[10]),.B(c_1[9]),.Cin(c_2[8]),.Y(Y[18]),.Cout(c_2[9]));
    csa_dadda c_211(.A(s_1[11]),.B(c_1[10]),.Cin(c_2[9]),.Y(Y[19]),.Cout(c_2[10]));
    csa_dadda c_212(.A(s_1[12]),.B(c_1[11]),.Cin(c_2[10]),.Y(Y[20]),.Cout(c_2[11]));
    csa_dadda c_213(.A(s_1[13]),.B(c_1[12]),.Cin(c_2[11]),.Y(Y[21]),.Cout(c_2[12]));
    csa_dadda c_214(.A(s_1[14]),.B(c_1[13]),.Cin(c_2[12]),.Y(Y[22]),.Cout(c_2[13]));
    csa_dadda c_215(.A(s_1[15]),.B(c_1[14]),.Cin(c_2[13]),.Y(Y[23]),.Cout(c_2[14]));
    csa_dadda c_216(.A(y22[8]),.B(c_1[15]),.Cin(c_2[14]),.Y(Y[24]),.Cout(c_2[15]));

    HA h2(.a(y22[9]),.b(c_2[15]),.Sum(Y[25]),.Cout(c_2[16]));
    HA h3(.a(y22[10]),.b(c_2[16]),.Sum(Y[26]),.Cout(c_2[17]));
    HA h4(.a(y22[11]),.b(c_2[17]),.Sum(Y[27]),.Cout(c_2[18]));
    HA h5(.a(y22[12]),.b(c_2[18]),.Sum(Y[28]),.Cout(c_2[19]));
    HA h6(.a(y22[13]),.b(c_2[19]),.Sum(Y[29]),.Cout(c_2[20]));
    HA h7(.a(y22[14]),.b(c_2[20]),.Sum(Y[30]),.Cout(c_2[21]));
    HA h8(.a(y22[15]),.b(c_2[21]),.Sum(Y[31]),.Cout(c_2[22]));
    
    
    
endmodule
