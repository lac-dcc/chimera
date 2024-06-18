// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

///////////////////////////////////////////////////////////////////////////////
//
//        This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 1994-2002 SYNOPSYS, INC.
//                              ALL RIGHTS RESERVED
//
//        The entire notice above must be reproduced on all authorized
//       copies.
//
// ABSTRACT: The GTECH library Verilog Simulation Model
//
// DesignWare_version : 948f711f
// DesignWare_release : B-2008.09-DWBB_0811
//
///////////////////////////////////////////////////////////////////////////////

`ifdef GTECH_default_delay
`else
`define GTECH_default_delay 1
`endif


//
// Verilog Simulation model for GTECH_ADD_AB
//

module GTECH_ADD_AB(A,B,S,COUT);
parameter delay = `GTECH_default_delay;
input	A,B;
output	S,COUT;
xor	#(delay)	U1(S,A,B);
and	#(delay)	U2(COUT,A,B);
endmodule

//
// Verilog Simulation model for GTECH_ADD_ABC
//

module GTECH_ADD_ABC(A,B,C,S,COUT);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	S,COUT;
wire	AB,AC,BC;
xor	#(delay)	U1(S,A,B,C);
and			U2(AB,A,B);
and			U3(AC,A,C);
and			U4(BC,B,C);
or	#(delay)	U5(COUT,AB,AC,BC);
endmodule

//
// Verilog Simulation model for GTECH_AND2
//

module GTECH_AND2(A,B,Z);
parameter delay = `GTECH_default_delay;
input	A,B;
output	Z;
and	#(delay)	U(Z,A,B);
endmodule

//
// Verilog Simulation model for GTECH_AND3
//

module GTECH_AND3(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
and	#(delay)	U(Z,A,B,C);
endmodule

//
// Verilog Simulation model for GTECH_AND4
//

module GTECH_AND4(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
and	#(delay)	U(Z,A,B,C,D);
endmodule

//
// Verilog Simulation model for GTECH_AND5
//

module GTECH_AND5(A,B,C,D,E,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D,E;
output	Z;
and	#(delay)	U(Z,A,B,C,D,E);
endmodule

//
// Verilog Simulation model for GTECH_AND8
//

module GTECH_AND8(A,B,C,D,E,F,G,H,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D,E,F,G,H;
output	Z;
and	#(delay)	U(Z,A,B,C,D,E,F,G,H);
endmodule

//
// Verilog Simulation model for GTECH_AND_NOT
//

module GTECH_AND_NOT(A,B,Z);
parameter delay = `GTECH_default_delay;
input	A,B;
output	Z;
wire	BN;
not			U1(BN,B);
and	#(delay)	U2(Z,A,BN);
endmodule

//
// Verilog Simulation model for GTECH_AO21
//

module GTECH_AO21(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
wire	AB;
and			U1(AB,A,B);
or	#(delay)	U2(Z,AB,C);
endmodule

//
// Verilog Simulation model for GTECH_AO22
//

module GTECH_AO22(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
wire	AB,CD;
and			U1(AB,A,B);
and			U2(CD,C,D);
or	#(delay)	U3(Z,AB,CD);
endmodule

//
// Verilog Simulation model for GTECH_AOI21
//

module GTECH_AOI21(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
wire	AB;
and			U1(AB,A,B);
nor	#(delay)	U2(Z,AB,C);
endmodule

//
// Verilog Simulation model for GTECH_AOI22
//

module GTECH_AOI22(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
wire	AB,CD;
and			U1(AB,A,B);
and			U2(CD,C,D);
nor	#(delay)	U3(Z,AB,CD);
endmodule

//
// Verilog Simulation model for GTECH_AOI222
//

module GTECH_AOI222(A,B,C,D,E,F,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D,E,F;
output	Z;
wire	AB,CD,EF;
and			U1(AB,A,B);
and			U2(CD,C,D);
and			U3(EF,E,F);
nor	#(delay)	U4(Z,AB,CD,EF);
endmodule

//
// Verilog Simulation model for GTECH_AOI2N2
//

module GTECH_AOI2N2(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
wire	AB,CD;
and			U1(AB,A,B);
nor			U2(CD,C,D);
nor	#(delay)	U3(Z,AB,CD);
endmodule

//
// Verilog Simulation model for GTECH_BUF
//

module GTECH_BUF(A,Z);
parameter delay = `GTECH_default_delay;
input	A;
output	Z;
buf	#(delay)	U(Z,A);
endmodule

//
// Verilog Simulation model for GTECH_FD1
//

module GTECH_FD1(D,CP,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,CP;
output	Q,QN;

        GTECH_UDP_FD1  (Q_int, D, CP);
        buf #(delay) (Q, Q_int);
        not #(delay) (QN, Q_int);

endmodule

//
// Verilog Simulation model for GTECH_FD14
//

module GTECH_FD14(D0, D1, D2, D3, CP,
		Q0, Q1, Q2, Q3,
		QN0, QN1, QN2, QN3);
parameter delay = `GTECH_default_delay;
input		D0;
input		D1;
input		D2;
input		D3;
input		CP;
output		Q0,QN0;
output		Q1,QN1;
output		Q2,QN2;
output		Q3,QN3;

        GTECH_UDP_FD1  (Q0_int, D0, CP);
        GTECH_UDP_FD1  (Q1_int, D1, CP);
        GTECH_UDP_FD1  (Q2_int, D2, CP);
        GTECH_UDP_FD1  (Q3_int, D3, CP);
        buf #(delay) (Q0, Q0_int); 
        buf #(delay) (Q1, Q1_int); 
        buf #(delay) (Q2, Q2_int); 
        buf #(delay) (Q3, Q3_int); 
        not #(delay) (QN0, Q0_int);  
        not #(delay) (QN1, Q1_int);
        not #(delay) (QN2, Q2_int);
        not #(delay) (QN3, Q3_int);
endmodule

//
// Verilog Simulation model for GTECH_FD18
//

module GTECH_FD18(D0, D1, D2, D3, D4, D5, D6, D7, CP,
		Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7,
		QN0, QN1, QN2, QN3, QN4, QN5, QN6, QN7);
parameter delay = `GTECH_default_delay;
input		D0;
input		D1;
input		D2;
input		D3;
input		D4;
input		D5;
input		D6;
input		D7;
input		CP;
output		Q0,QN0;
output		Q1,QN1;
output		Q2,QN2;
output		Q3,QN3;
output		Q4,QN4;
output		Q5,QN5;
output		Q6,QN6;
output		Q7,QN7;

        GTECH_UDP_FD1  (Q0_int, D0, CP);
        GTECH_UDP_FD1  (Q1_int, D1, CP);
        GTECH_UDP_FD1  (Q2_int, D2, CP);
        GTECH_UDP_FD1  (Q3_int, D3, CP);
        GTECH_UDP_FD1  (Q4_int, D4, CP);
        GTECH_UDP_FD1  (Q5_int, D5, CP);
        GTECH_UDP_FD1  (Q6_int, D6, CP);
        GTECH_UDP_FD1  (Q7_int, D7, CP);
        buf #(delay) (Q0, Q0_int);  
        buf #(delay) (Q1, Q1_int);
        buf #(delay) (Q2, Q2_int);
        buf #(delay) (Q3, Q3_int);
        buf #(delay) (Q4, Q4_int);  
        buf #(delay) (Q5, Q5_int);
        buf #(delay) (Q6, Q6_int);
        buf #(delay) (Q7, Q7_int);
        not #(delay) (QN0, Q0_int);   
        not #(delay) (QN1, Q1_int);
        not #(delay) (QN2, Q2_int); 
        not #(delay) (QN3, Q3_int); 
        not #(delay) (QN4, Q4_int);   
        not #(delay) (QN5, Q5_int);
        not #(delay) (QN6, Q6_int); 
        not #(delay) (QN7, Q7_int); 
endmodule

//
// Verilog Simulation model for GTECH_FD1S
//

module GTECH_FD1S(D,TI,TE,CP,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,TI,TE,CP;
output	Q,QN;

        GTECH_UDP_MUX2 (DT, D, TI, TE);
        GTECH_UDP_FD1 (Q_int, DT, CP);
        buf #(delay) (Q, Q_int);
        not #(delay) (QN, Q_int);
endmodule

//
// Verilog Simulation model for GTECH_FD2
//

module GTECH_FD2(D,CP,CD,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,CP,CD;
output	Q,QN;

        GTECH_UDP_FD2 (Q_int, D, CP, CD); 
        buf #(delay) (Q, Q_int); 
        not #(delay) (QN, Q_int); 

endmodule

//
// Verilog Simulation model for GTECH_FD24
//

module GTECH_FD24(D0, D1, D2, D3, CP, CD,
		Q0, Q1, Q2, Q3,
		QN0, QN1, QN2, QN3);
parameter delay = `GTECH_default_delay;
input		D0;
input		D1;
input		D2;
input		D3;
input		CP;
input		CD;
output		Q0,QN0;
output		Q1,QN1;
output		Q2,QN2;
output		Q3,QN3;

        GTECH_UDP_FD2  (Q0_int, D0, CP, CD);
        GTECH_UDP_FD2  (Q1_int, D1, CP, CD);
        GTECH_UDP_FD2  (Q2_int, D2, CP, CD);
        GTECH_UDP_FD2  (Q3_int, D3, CP, CD);
        buf #(delay) (Q0, Q0_int);
        buf #(delay) (Q1, Q1_int);
        buf #(delay) (Q2, Q2_int);
        buf #(delay) (Q3, Q3_int);
        not #(delay) (QN0, Q0_int);
        not #(delay) (QN1, Q1_int);
        not #(delay) (QN2, Q2_int);
        not #(delay) (QN3, Q3_int);
endmodule

//
// Verilog Simulation model for GTECH_FD28
//

module GTECH_FD28(D0, D1, D2, D3, D4, D5, D6, D7, CP, CD,
		Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7,
		QN0, QN1, QN2, QN3, QN4, QN5, QN6, QN7);
parameter delay = `GTECH_default_delay;
input		D0;
input		D1;
input		D2;
input		D3;
input		D4;
input		D5;
input		D6;
input		D7;
input		CP;
input		CD;
output		Q0,QN0;
output		Q1,QN1;
output		Q2,QN2;
output		Q3,QN3;
output		Q4,QN4;
output		Q5,QN5;
output		Q6,QN6;
output		Q7,QN7;


        GTECH_UDP_FD2  (Q0_int, D0, CP, CD);
        GTECH_UDP_FD2  (Q1_int, D1, CP, CD);
        GTECH_UDP_FD2  (Q2_int, D2, CP, CD);
        GTECH_UDP_FD2  (Q3_int, D3, CP, CD);
        GTECH_UDP_FD2  (Q4_int, D4, CP, CD);
        GTECH_UDP_FD2  (Q5_int, D5, CP, CD);
        GTECH_UDP_FD2  (Q6_int, D6, CP, CD);
        GTECH_UDP_FD2  (Q7_int, D7, CP, CD);
        buf #(delay) (Q0, Q0_int);
        buf #(delay) (Q1, Q1_int);
        buf #(delay) (Q2, Q2_int);
        buf #(delay) (Q3, Q3_int);
        buf #(delay) (Q4, Q4_int);
        buf #(delay) (Q5, Q5_int);
        buf #(delay) (Q6, Q6_int);
        buf #(delay) (Q7, Q7_int);
        not #(delay) (QN0, Q0_int);
        not #(delay) (QN1, Q1_int);
        not #(delay) (QN2, Q2_int);
        not #(delay) (QN3, Q3_int);
        not #(delay) (QN4, Q4_int);
        not #(delay) (QN5, Q5_int);
        not #(delay) (QN6, Q6_int);
        not #(delay) (QN7, Q7_int);

endmodule

//
// Verilog Simulation model for GTECH_FD2S
//

module GTECH_FD2S(D,TI,TE,CP,CD,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,TI,TE,CP,CD;
output	Q,QN;

        GTECH_UDP_MUX2 (DT, D, TI, TE);
        GTECH_UDP_FD2 (Q_int, DT, CP, CD);
        buf #(delay) (Q, Q_int);
        not #(delay) (QN, Q_int);


endmodule

//
// Verilog Simulation model for GTECH_FD3
//

module GTECH_FD3(D,CP,CD,SD,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,CP,CD,SD;
output	Q,QN;
wire Q_int_int;

        GTECH_UDP_FD3 (Q_int, D, CP, CD, SD); 
        buf #(delay) (Q, Q_int); 
        assign Q_int_int = ((SD === 1'b0) & (CD === 1'b0))?1'b1: Q_int;
        not #(delay) (QN, Q_int_int); 
endmodule

//
// Verilog Simulation model for GTECH_FD34
//

module GTECH_FD34(D0, D1, D2, D3, CP, CD, SD,
		Q0, Q1, Q2, Q3,
		QN0, QN1, QN2, QN3);
parameter delay = `GTECH_default_delay;
input		D0;
input		D1;
input		D2;
input		D3;
input		CP,CD,SD;
output		Q0,QN0;
output		Q1,QN1;
output		Q2,QN2;
output		Q3,QN3;

        GTECH_UDP_FD3 FD34_00 (Q0_int, D0, CP, CD, SD);
        GTECH_UDP_FD3 FD34_01 (Q1_int, D1, CP, CD, SD);
        GTECH_UDP_FD3 FD34_02 (Q2_int, D2, CP, CD, SD);
        GTECH_UDP_FD3 FD34_03 (Q3_int, D3, CP, CD, SD);
        buf #(delay) (Q0, Q0_int); 
        buf #(delay) (Q1, Q1_int); 
        buf #(delay) (Q2, Q2_int); 
        buf #(delay) (Q3, Q3_int); 
        not #(delay) (QN0, Q0_int);  
        not #(delay) (QN1, Q1_int);
        not #(delay) (QN2, Q2_int);
        not #(delay) (QN3, Q3_int);

endmodule

//
// Verilog Simulation model for GTECH_FD38
//

module GTECH_FD38(D0, D1, D2, D3, D4, D5, D6, D7, CP, CD, SD,
		Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7,
		QN0, QN1, QN2, QN3, QN4, QN5, QN6, QN7);
parameter delay = `GTECH_default_delay;
input		D0;
input		D1;
input		D2;
input		D3;
input		D4;
input		D5;
input		D6;
input		D7;
input		CP,CD,SD;
output		Q0,QN0;
output		Q1,QN1;
output		Q2,QN2;
output		Q3,QN3;
output		Q4,QN4;
output		Q5,QN5;
output		Q6,QN6;
output		Q7,QN7;

        GTECH_UDP_FD3 FD38_00 (Q0_int, D0, CP, CD, SD);
        GTECH_UDP_FD3 FD38_01 (Q1_int, D1, CP, CD, SD);
        GTECH_UDP_FD3 FD38_02 (Q2_int, D2, CP, CD, SD);
        GTECH_UDP_FD3 FD38_03 (Q3_int, D3, CP, CD, SD);
        GTECH_UDP_FD3 FD38_04 (Q4_int, D4, CP, CD, SD);
        GTECH_UDP_FD3 FD38_05 (Q5_int, D5, CP, CD, SD);
        GTECH_UDP_FD3 FD38_06 (Q6_int, D6, CP, CD, SD);
        GTECH_UDP_FD3 FD38_07 (Q7_int, D7, CP, CD, SD);
        buf #(delay) (Q0, Q0_int); 
        buf #(delay) (Q1, Q1_int); 
        buf #(delay) (Q2, Q2_int); 
        buf #(delay) (Q3, Q3_int); 
        buf #(delay) (Q4, Q4_int); 
        buf #(delay) (Q5, Q5_int); 
        buf #(delay) (Q6, Q6_int); 
        buf #(delay) (Q7, Q7_int); 
        not #(delay) (QN0, Q0_int);  
        not #(delay) (QN1, Q1_int);
        not #(delay) (QN2, Q2_int);
        not #(delay) (QN3, Q3_int);
        not #(delay) (QN4, Q4_int);  
        not #(delay) (QN5, Q5_int);
        not #(delay) (QN6, Q6_int);
        not #(delay) (QN7, Q7_int);

endmodule

//
// Verilog Simulation model for GTECH_FD3S
//

module GTECH_FD3S(D,TI,TE,CP,CD,SD,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,TI,TE,CP,CD,SD;
output	Q,QN;
wire Q_int_int;

        GTECH_UDP_MUX2  (DT, D, TI, TE);
        GTECH_UDP_FD3 (Q_int, DT, CP, CD, SD);
        buf #(delay) (Q, Q_int);
        assign Q_int_int = ((SD === 1'b0) & (CD === 1'b0))?1'b1: Q_int;
        not #(delay) (QN, Q_int_int);

endmodule

//
// Verilog Simulation model for GTECH_FD4
//

module GTECH_FD4(D,CP,SD,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,CP,SD;
output	Q,QN;

        GTECH_UDP_FD4 (Q_int, D, CP, SD); 
        buf #(delay) (Q, Q_int);   
        not #(delay) (QN, Q_int); 

endmodule

//
// Verilog Simulation model for GTECH_FD44
//

module GTECH_FD44(D0, D1, D2, D3, CP, SD,
		Q0, Q1, Q2, Q3,
		QN0, QN1, QN2, QN3);
parameter delay = `GTECH_default_delay;
input		D0;
input		D1;
input		D2;
input		D3;
input		CP;
input		SD;
output		Q0,QN0;
output		Q1,QN1;
output		Q2,QN2;
output		Q3,QN3;

        GTECH_UDP_FD4  (Q0_int, D0, CP, SD);
        GTECH_UDP_FD4  (Q1_int, D1, CP, SD);
        GTECH_UDP_FD4  (Q2_int, D2, CP, SD);
        GTECH_UDP_FD4  (Q3_int, D3, CP, SD);
        buf #(delay) (Q0, Q0_int);
        buf #(delay) (Q1, Q1_int);
        buf #(delay) (Q2, Q2_int);
        buf #(delay) (Q3, Q3_int);
        not #(delay) (QN0, Q0_int);
        not #(delay) (QN1, Q1_int);
        not #(delay) (QN2, Q2_int);
        not #(delay) (QN3, Q3_int);

endmodule

//
// Verilog Simulation model for GTECH_FD48
//

module GTECH_FD48(D0, D1, D2, D3, D4, D5, D6, D7, CP, SD,
		Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7,
		QN0, QN1, QN2, QN3, QN4, QN5, QN6, QN7);
parameter delay = `GTECH_default_delay;
input		D0;
input		D1;
input		D2;
input		D3;
input		D4;
input		D5;
input		D6;
input		D7;
input		CP;
input		SD;
output		Q0,QN0;
output		Q1,QN1;
output		Q2,QN2;
output		Q3,QN3;
output		Q4,QN4;
output		Q5,QN5;
output		Q6,QN6;
output		Q7,QN7;

        GTECH_UDP_FD4  (Q0_int, D0, CP, SD);
        GTECH_UDP_FD4  (Q1_int, D1, CP, SD);
        GTECH_UDP_FD4  (Q2_int, D2, CP, SD);
        GTECH_UDP_FD4  (Q3_int, D3, CP, SD);
        GTECH_UDP_FD4  (Q4_int, D4, CP, SD);
        GTECH_UDP_FD4  (Q5_int, D5, CP, SD);
        GTECH_UDP_FD4  (Q6_int, D6, CP, SD);
        GTECH_UDP_FD4  (Q7_int, D7, CP, SD);
        buf #(delay) (Q0, Q0_int);
        buf #(delay) (Q1, Q1_int);
        buf #(delay) (Q2, Q2_int);
        buf #(delay) (Q3, Q3_int);
        buf #(delay) (Q4, Q4_int);
        buf #(delay) (Q5, Q5_int);
        buf #(delay) (Q6, Q6_int);
        buf #(delay) (Q7, Q7_int);
        not #(delay) (QN0, Q0_int);
        not #(delay) (QN1, Q1_int);
        not #(delay) (QN2, Q2_int);
        not #(delay) (QN3, Q3_int);
        not #(delay) (QN4, Q4_int);
        not #(delay) (QN5, Q5_int);
        not #(delay) (QN6, Q6_int);
        not #(delay) (QN7, Q7_int);

endmodule

//
// Verilog Simulation model for GTECH_FD4S
//

module GTECH_FD4S(D,TI,TE,CP,SD,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,TI,TE,CP,SD;
output	Q,QN;

        GTECH_UDP_MUX2 (DT, D, TI, TE);
        GTECH_UDP_FD4 (Q_int, DT, CP, SD);
        buf #(delay) (Q, Q_int);
        not #(delay) (QN, Q_int);

endmodule

//
// Verilog Simulation model for GTECH_FJK1
//

module GTECH_FJK1(J,K,CP,Q,QN);
parameter delay = `GTECH_default_delay;
input	J,K,CP;
output	Q,QN;
   
        GTECH_UDP_FJK1 (Q_int, J, K, CP);
        buf #(delay) (Q, Q_int);
        not #(delay) (QN, Q_int);

endmodule

//
// Verilog Simulation model for GTECH_FJK1S
//

module GTECH_FJK1S(J,K,TI,TE,CP,Q,QN);
parameter delay = `GTECH_default_delay;
input	J,K,TI,TE,CP;
output	Q,QN;

        not (TIB, TI);
        GTECH_UDP_MUX2 (J_int, J, TI, TE);
        GTECH_UDP_MUX2 (K_int, K, TIB, TE);
        GTECH_UDP_FJK1 (Q_int, J_int, K_int, CP);
        buf #(delay) (Q, Q_int);
        not #(delay) (QN, Q_int);

endmodule

//
// Verilog Simulation model for GTECH_FJK2
//

module GTECH_FJK2(J,K,CP,CD,Q,QN);
parameter delay = `GTECH_default_delay;
input	J,K,CP,CD;
output	Q,QN;

        GTECH_UDP_FJK2 (Q_int, J, K, CP, CD); 
        buf #(delay) (Q, Q_int); 
        not #(delay) (QN, Q_int); 

endmodule

//
// Verilog Simulation model for GTECH_FJK2S
//

module GTECH_FJK2S(J,K,TI,TE,CP,CD,Q,QN);
parameter delay = `GTECH_default_delay;
input	J,K,TI,TE,CP,CD;
output	Q,QN;

        not (TIB, TI); 
        GTECH_UDP_MUX2 (J_int, J, TI, TE);
        GTECH_UDP_MUX2 (K_int, K, TIB, TE);
        GTECH_UDP_FJK2 (Q_int, J_int, K_int, CP, CD); 
        buf #(delay) (Q, Q_int); 
        not #(delay) (QN, Q_int); 

endmodule

//
// Verilog Simulation model for GTECH_FJK3
//

module GTECH_FJK3(J,K,CP,CD,SD,Q,QN);
parameter delay = `GTECH_default_delay;
input	J,K,CP,CD,SD;
output	Q,QN;
wire Q_int_int;

        GTECH_UDP_FJK3 (Q_int, J, K, CP, CD, SD);  
        buf #(delay) (Q, Q_int);  
        assign Q_int_int = ((SD === 1'b0) & (CD === 1'b0))?1'b1: Q_int;
        not #(delay) (QN, Q_int_int); 

endmodule

//
// Verilog Simulation model for GTECH_FJK3S
//

module GTECH_FJK3S(J,K,TI,TE,CP,CD,SD,Q,QN);
parameter delay = `GTECH_default_delay;
input	J,K,TI,TE,CP,CD,SD;
output	Q,QN;
wire Q_int_int;

        not (TIB, TI); 
        GTECH_UDP_MUX2 (J_int, J, TI, TE);
        GTECH_UDP_MUX2 (K_int, K, TIB, TE);
        GTECH_UDP_FJK3 (Q_int, J_int, K_int, CP, CD, SD);
        buf #(delay) (Q, Q_int);   
        assign Q_int_int = ((SD === 1'b0) & (CD === 1'b0))?1'b1: Q_int;
        not #(delay) (QN, Q_int_int); 

endmodule

//
// Verilog Simulation model for GTECH_FJK4
//

module GTECH_FJK4(J,K,CP,SD,Q,QN);
parameter delay = `GTECH_default_delay;
input	J,K,CP,SD;
output	Q,QN;

        GTECH_UDP_FJK4 (Q_int, J, K, CP, SD);
        buf #(delay) (Q, Q_int);      
        not #(delay) (QN, Q_int);   

endmodule

//
// Verilog Simulation model for GTECH_FJK4S
//

module GTECH_FJK4S(J,K,TI,TE,CP,SD,Q,QN);
parameter delay = `GTECH_default_delay;
input	J,K,TI,TE,CP,SD;
output	Q,QN;

        not (TIB, TI); 
        GTECH_UDP_MUX2 (J_int, J, TI, TE);
        GTECH_UDP_MUX2 (K_int, K, TIB, TE);
        GTECH_UDP_FJK4 (Q_int, J_int, K_int, CP, SD);
        buf #(delay) (Q, Q_int);      
        not #(delay) (QN, Q_int);   
endmodule

//
// Verilog Simulation model for GTECH_INBUF
//

module GTECH_INBUF(PAD_IN,DATA_IN);
parameter delay = `GTECH_default_delay;
output	DATA_IN;
input	PAD_IN;
assign  #(delay) DATA_IN = PAD_IN & 1'b1;
endmodule

//
// Verilog Simulation model for GTECH_INOUTBUF
//

module GTECH_INOUTBUF(DATA_OUT,OE,PAD_INOUT,DATA_IN);
parameter delay = `GTECH_default_delay;
input	DATA_OUT,OE;
output	DATA_IN;
inout	PAD_INOUT;
assign	#(delay) PAD_INOUT = OE? (DATA_OUT & 1'b1) : 1'bz;
assign  #(delay) DATA_IN = PAD_INOUT & 1'b1;
endmodule

//
// Verilog Simulation model for GTECH_ISO0
//

module GTECH_ISO0_EN1(EN,DI,DO);
parameter delay = `GTECH_default_delay;
input	EN,DI;
output	DO;
and	#(delay)	U(DO,EN,DI);
endmodule

//
// Verilog Simulation model for GTECH_ISO1
//

module GTECH_ISO1_EN1(EN,DI,DO);
parameter delay = `GTECH_default_delay;
input	EN,DI;
output	DO;
wire	en_n;
not			U1(en_n,EN);
or	#(delay)	U2(DO,DI,en_n);
endmodule

//
// Verilog Simulation model for GTECH_ISO0
//

module GTECH_ISO0_EN0(EN,DI,DO);
parameter delay = `GTECH_default_delay;
input	EN,DI;
output	DO;
wire	en_n;
not			U1(en_n,EN);
and	#(delay)	U2(DO,en_n,DI);
endmodule

//
// Verilog Simulation model for GTECH_ISO1
//

module GTECH_ISO1_EN0(EN,DI,DO);
parameter delay = `GTECH_default_delay;
input	EN,DI;
output	DO;
or	#(delay)	U2(DO,DI,EN);
endmodule

//
// Verilog Simulation model for GTECH_ISOLATCH_EN1
//

module GTECH_ISOLATCH_EN1(EN,DI,DO);
parameter delay = `GTECH_default_delay;
input   EN,DI;
output  DO;
wire	Q;
 
        GTECH_UDP_LD1_Q (Q, DI, EN);
        buf #(delay) (DO, Q);
endmodule

//
// Verilog Simulation model for GTECH_ISOLATCH_EN0
//

module GTECH_ISOLATCH_EN0(EN,DI,DO);
parameter delay = `GTECH_default_delay;
input   EN,DI;
output  DO;
wire	Q;
 
        GTECH_UDP_LD2_Q (Q, DI, EN);
        buf #(delay) (DO, Q);
endmodule

//
// Verilog Simulation model for GTECH_LD1
//

module GTECH_LD1(D,G,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,G;
output	Q,QN;

        GTECH_UDP_LD1_Q (Q_int, D, G); 
        buf #(delay) (Q, Q_int);       
        not #(delay) (QN, Q_int);    

endmodule

//
// Verilog Simulation model for GTECH_LD2
//

module GTECH_LD2(D,GN,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,GN;
output	Q,QN;

        GTECH_UDP_LD2_Q (Q_int, D, GN);  
        buf #(delay) (Q, Q_int);        
        not #(delay) (QN, Q_int);     
endmodule

//
// Verilog Simulation model for GTECH_LD2_1
//

module GTECH_LD2_1(D,GN,Q);
parameter delay = `GTECH_default_delay;
input   D,GN;
output  Q;
 
        GTECH_UDP_LD2_Q (Q_int, D, GN);
        buf #(delay) (Q, Q_int);
endmodule

//
// Verilog Simulation model for GTECH_LD3
//

module GTECH_LD3(D,G,CD,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,G,CD;
output	Q,QN;

        GTECH_UDP_LD3_Q (Q_int, D, G, CD);   
        buf #(delay) (Q, Q_int);         
        not #(delay) (QN, Q_int);      

endmodule

//
// Verilog Simulation model for GTECH_LD4
//

module GTECH_LD4(D,GN,CD,Q,QN);
parameter delay = `GTECH_default_delay;
input	D,GN,CD;
output	Q,QN;

        GTECH_UDP_LD4_Q (Q_int, D, GN, CD);    
        buf #(delay) (Q, Q_int);          
        not #(delay) (QN, Q_int);      

endmodule

//
// Verilog Simulation model for GTECH_LD4_1
//

module GTECH_LD4_1(D,GN,CD,Q);
parameter delay = `GTECH_default_delay;
input   D,GN,CD;
output  Q;
 
        GTECH_UDP_LD4_Q (Q_int, D, GN, CD);
        buf #(delay) (Q, Q_int);
endmodule

//
// Verilog Simulation model for GTECH_LSR0
//

module GTECH_LSR0(S,R,Q,QN);
parameter delay = `GTECH_default_delay;
input	S,R;
output	Q,QN;
wire Q_int_int;

        GTECH_UDP_LSR0_Q (Q_int, S, R);    
        buf #(delay) (Q, Q_int);           
        assign Q_int_int = ((S === 1'b0) & (R === 1'b0))?1'b1: Q_int;
        not #(delay) (QN, Q_int_int);

endmodule

//
// Verilog Simulation model for GTECH_MAJ23
//

module GTECH_MAJ23(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
wire	AB,AC,BC;
and			U1(AB,A,B);
and			U2(AC,A,C);
and			U3(BC,B,C);
or	#(delay)	U4(Z,AB,AC,BC);
endmodule

//
// Verilog Simulation model for GTECH_MUX2
//

module GTECH_MUX2(A,B,S,Z);
parameter delay = `GTECH_default_delay;
input	A,B,S;
output	Z;
       
        GTECH_UDP_MUX2 (Z_int, A, B, S);
        buf #(delay) (Z, Z_int);
endmodule

//
// Verilog Simulation model for GTECH_MUX4
//

module GTECH_MUX4(D0,D1,D2,D3,A,B,Z);
parameter delay = `GTECH_default_delay;
input	D0,D1,D2,D3,A,B;
output	Z;

        GTECH_UDP_MUX4 (Z_int, D0, D1, D2, D3, A, B);
        buf #(delay) (Z, Z_int);
endmodule

//
// Verilog Simulation model for GTECH_MUX8
//

module GTECH_MUX8(D0,D1,D2,D3,D4,D5,D6,D7,A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	D0,D1,D2,D3,D4,D5,D6,D7,A,B,C;
output	Z;

        GTECH_UDP_MUX4 (D1_int, D0, D1, D2, D3, A, B);
        GTECH_UDP_MUX4 (D2_int, D4, D5, D6, D7, A, B);
        GTECH_UDP_MUX2 (Z_int, D1_int, D2_int, C);
        buf #(delay) (Z, Z_int);

endmodule

//
// Verilog Simulation model for GTECH_MUXI2
//

module GTECH_MUXI2(A,B,S,Z);
parameter delay = `GTECH_default_delay;
input	A,B,S;
output	Z;
       
        GTECH_UDP_MUX2 (Z_int, A, B, S);
        not #(delay) (Z, Z_int);
endmodule

//
// Verilog Simulation model for GTECH_NAND2
//

module GTECH_NAND2(A,B,Z);
parameter delay = `GTECH_default_delay;
input	A,B;
output	Z;
nand	#(delay)	U(Z,A,B);
endmodule

//
// Verilog Simulation model for GTECH_NAND3
//

module GTECH_NAND3(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
nand	#(delay)	U(Z,A,B,C);
endmodule

//
// Verilog Simulation model for GTECH_NAND4
//

module GTECH_NAND4(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
nand	#(delay)	U(Z,A,B,C,D);
endmodule

//
// Verilog Simulation model for GTECH_NAND5
//

module GTECH_NAND5(A,B,C,D,E,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D,E;
output	Z;
nand	#(delay)	U(Z,A,B,C,D,E);
endmodule

//
// Verilog Simulation model for GTECH_NAND8
//

module GTECH_NAND8(A,B,C,D,E,F,G,H,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D,E,F,G,H;
output	Z;
nand	#(delay)	U(Z,A,B,C,D,E,F,G,H);
endmodule

//
// Verilog Simulation model for GTECH_NOR2
//

module GTECH_NOR2(A,B,Z);
parameter delay = `GTECH_default_delay;
input	A,B;
output	Z;
nor	#(delay)	U(Z,A,B);
endmodule

//
// Verilog Simulation model for GTECH_NOR3
//

module GTECH_NOR3(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
nor	#(delay)	U(Z,A,B,C);
endmodule

//
// Verilog Simulation model for GTECH_NOR4
//

module GTECH_NOR4(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
nor	#(delay)	U(Z,A,B,C,D);
endmodule

//
// Verilog Simulation model for GTECH_NOR5
//

module GTECH_NOR5(A,B,C,D,E,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D,E;
output	Z;
nor	#(delay)	U(Z,A,B,C,D,E);
endmodule

//
// Verilog Simulation model for GTECH_NOR8
//

module GTECH_NOR8(A,B,C,D,E,F,G,H,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D,E,F,G,H;
output	Z;
nor	#(delay)	U(Z,A,B,C,D,E,F,G,H);
endmodule

//
// Verilog Simulation model for GTECH_NOT
//

module GTECH_NOT(A,Z);
parameter delay = `GTECH_default_delay;
input	A;
output	Z;
not	#(delay)	U(Z,A);
endmodule

//
// Verilog Simulation model for GTECH_OA21
//

module GTECH_OA21(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
wire	AB;
or			U1(AB,A,B);
and	#(delay)	U2(Z,AB,C);
endmodule

//
// Verilog Simulation model for GTECH_OA22
//

module GTECH_OA22(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
wire	AB,CD;
or			U1(AB,A,B);
or			U2(CD,C,D);
and	#(delay)	U3(Z,AB,CD);
endmodule

//
// Verilog Simulation model for GTECH_OAI21
//

module GTECH_OAI21(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
wire	AB;
or			U1(AB,A,B);
nand	#(delay)	U2(Z,AB,C);
endmodule

//
// Verilog Simulation model for GTECH_OAI22
//

module GTECH_OAI22(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
wire	AB,CD;
or			U1(AB,A,B);
or			U2(CD,C,D);
nand	#(delay)	U3(Z,AB,CD);
endmodule

//
// Verilog Simulation model for GTECH_OAI2N2
//

module GTECH_OAI2N2(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
wire	AB,CD;
or			U1(AB,A,B);
nand			U2(CD,C,D);
nand	#(delay)	U3(Z,AB,CD);
endmodule

//
// Verilog Simulation model for GTECH_ONE
//

module GTECH_ONE(Z);
parameter delay = `GTECH_default_delay;
output	Z;
wire	Z;
assign	Z = 1'b1;
endmodule

//
// Verilog Simulation model for GTECH_OR2
//

module GTECH_OR2(A,B,Z);
parameter delay = `GTECH_default_delay;
input	A,B;
output	Z;
or	#(delay)	U(Z,A,B);
endmodule

//
// Verilog Simulation model for GTECH_OR3
//

module GTECH_OR3(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
or	#(delay)	U(Z,A,B,C);
endmodule

//
// Verilog Simulation model for GTECH_OR4
//

module GTECH_OR4(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
or	#(delay)	U(Z,A,B,C,D);
endmodule

//
// Verilog Simulation model for GTECH_OR5
//

module GTECH_OR5(A,B,C,D,E,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D,E;
output	Z;
or	#(delay)	U(Z,A,B,C,D,E);
endmodule

//
// Verilog Simulation model for GTECH_OR8
//

module GTECH_OR8(A,B,C,D,E,F,G,H,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D,E,F,G,H;
output	Z;
or	#(delay)	U(Z,A,B,C,D,E,F,G,H);
endmodule

//
// Verilog Simulation model for GTECH_OR_NOT
//

module GTECH_OR_NOT(A,B,Z);
parameter delay = `GTECH_default_delay;
input	A,B;
output	Z;
wire	BN;
not			U1(BN,B);
or	#(delay)	U2(Z,A,BN);
endmodule

//
// Verilog Simulation model for GTECH_OUTBUF
//

module GTECH_OUTBUF(DATA_OUT,OE,PAD_OUT);
parameter delay = `GTECH_default_delay;
input	DATA_OUT,OE;
output	PAD_OUT;
assign	#(delay) PAD_OUT = OE? (DATA_OUT & 1'b1) : 1'bz;
endmodule

//
// Verilog Simulation model for GTECH_TBUF
//

module GTECH_TBUF(A,E,Z);
parameter delay = `GTECH_default_delay;
input   A,E;
output  Z;
bufif1 #(delay) U1 ( Z,A,E);
endmodule

//
// Verilog Simulation model for GTECH_XNOR2
//

module GTECH_XNOR2(A,B,Z);
parameter delay = `GTECH_default_delay;
input	A,B;
output	Z;
xnor	#(delay)	U(Z,A,B);
endmodule

//
// Verilog Simulation model for GTECH_XNOR3
//

module GTECH_XNOR3(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
xnor	#(delay)	U(Z,A,B,C);
endmodule

//
// Verilog Simulation model for GTECH_XNOR4
//

module GTECH_XNOR4(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
xnor	#(delay)	U(Z,A,B,C,D);
endmodule

//
// Verilog Simulation model for GTECH_XOR2
//

module GTECH_XOR2(A,B,Z);
parameter delay = `GTECH_default_delay;
input	A,B;
output	Z;
xor	#(delay)	U(Z,A,B);
endmodule

//
// Verilog Simulation model for GTECH_XOR3
//

module GTECH_XOR3(A,B,C,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C;
output	Z;
xor	#(delay)	U(Z,A,B,C);
endmodule

//
// Verilog Simulation model for GTECH_XOR4
//

module GTECH_XOR4(A,B,C,D,Z);
parameter delay = `GTECH_default_delay;
input	A,B,C,D;
output	Z;
xor	#(delay)	U(Z,A,B,C,D);
endmodule

//
// Verilog Simulation model for GTECH_ZERO
//

module GTECH_ZERO(Z);
parameter delay = `GTECH_default_delay;
output	Z;
wire	Z;
assign	Z = 1'b0;
endmodule

//
// Verilog User Primitive definition for GTECH_UDP_FD1
//

primitive GTECH_UDP_FD1  (Q, D, CP);
    output Q;
    input D, CP;
    reg Q;

// FUNCTION :  DFF 

    table
   //   D   CP  :  Q   : Qt+1
   //-------------------------
        0  (01) :  ?   :  0;
        1  (01) :  ?   :  1;
        0  (0x) :  0   :  0;
        0  (x1) :  0   :  0;
        1  (0x) :  1   :  1;
        1  (x1) :  1   :  1;
        ?  (?0) :  ?   :  -;
        ?  (1x) :  ?   :  -;
        *   ?   :  ?   :  -;

    endtable
endprimitive    

//
// Verilog User Primitive definition for GTECH_UDP_FD2
//

primitive GTECH_UDP_FD2  (Q, D, CP, CD);
    output Q;
    input D, CP, CD;
    reg Q;

// FUNCTION :  DFF WITH ASYNC RESET

    table
   //   D   CP   CD  :  Q   : Qt+1
   //-----------------------------
        0   (01) ?   :  ?   :  0;
        1   (01) 1   :  ?   :  1;
        0   (0x) ?   :  0   :  0;
        0   (x1) ?   :  0   :  0;
        1   (0x) 1   :  1   :  1;
        1   (x1) 1   :  1   :  1;
        ?    ?  (?0) :  ?   :  0;
        ?    ?  (?x) :  0   :  0;
        ?   (?0) ?   :  ?   :  -;
        ?   (1x) ?   :  ?   :  -;
        *    ?   ?   :  ?   :  -;
        ?    ?  (?1) :  ?   :  -;
        ?    *   0   :  0   :  0; 

    endtable
endprimitive   

//
// Verilog User Primitive definition for GTECH_UDP_FD3
//

primitive GTECH_UDP_FD3 (Q, D, CP, CD, SD);

    output Q;
    input  D, CP, CD, SD;
    reg    Q;


// FUNCTION :  DFF WITH ASYNC SET AND RESET
    table

    //  D      CP      CD  SD   :   Qt  :   Qt+1
    //------------------------------------------
        1      (01)    1   ?    :   ?   :   1;  
        0      (01)    ?   1    :   ?   :   0;  

        0      (0x)    ?   1    :   0   :   0;
        0      (x1)    ?   1    :   0   :   0;

        1      (0x)    1   ?    :   1   :   1;
        1      (x1)    1   ?    :   1   :   1;

        ?      (?0)    ?   ?    :   ?   :   -;
        ?      (1x)    ?   ?    :   ?   :   -;
        
        ?       ?     (?0) ?    :   ?   :   0;
        ?       ?     (?x) 1    :   0   :   0;
        *       ?      ?   ?    :   ?   :   -;
        ?       ?      0   *    :   ?   :   0;

        ?       ?      1  (?0)  :   ?   :   1;
        ?       ?      1  (?x)  :   1   :   1;
        ?       ?     (?1) 0    :   ?   :   1;

    
        ?       ?     (?1) 1    :   ?   :   -;
        ?       ?      1  (?1)  :   ?   :   -;
        ?       *      0   ?    :   0   :   0;
        ?       *      1   0    :   1   :   1;



    endtable
endprimitive

//
// Verilog User Primitive definition for GTECH_UDP_FD4
//

primitive GTECH_UDP_FD4  (Q, D, CP, SD); 
    output Q;  
    input D, CP, SD; 
    reg Q;
 
// FUNCTION :  DFF WITH ASYNC SET 
 
    table 
   //   D   CP   SD  :  Q   : Qt+1 
   //--------------------------- 
        0   (01) 1   :  ?   :  0; 
        1   (01) ?   :  ?   :  1;
        0   (0x) 1   :  0   :  0; 
        0   (x1) 1   :  0   :  0; 
        1   (0x) ?   :  1   :  1; 
        1   (x1) ?   :  1   :  1; 
        ?    ?  (?0) :  ?   :  1; 
        ?    ?  (?x) :  1   :  1; 
        *    ?   ?   :  ?   :  -; 
        ?   (?0) ?   :  ?   :  -;
        ?   (1x) ?   :  ?   :  -;
        ?    ?  (?1) :  ?   :  -;
        ?    *   0   :  1   :  1; 
 
    endtable 
endprimitive    

//
// Verilog User Primitive definition for GTECH_UDP_FJK1
//

primitive GTECH_UDP_FJK1  (Q, J, K,CP);
    output Q;
    input J, K, CP;
    reg Q;
 
// FUNCTION :  DFF
 
    table
   //   J  K   CP   : Q   : Qt+1
   //----------------------------
        0  1   (01) :  ?   :  0;
        0  x   (01) :  0   :  0;
        1  0   (01) :  ?   :  1;
        x  0   (01) :  1   :  1;
        1  1   (01) :  1   :  0;
        1  1   (01) :  0   :  1;
        0  ?   (0x) :  0   :  0;
        0  ?   (x1) :  0   :  0;
        ?  0   (0x) :  1   :  1;
        ?  0   (x1) :  1   :  1;
        ?  ?   (?0) :  ?   :  -;
        ?  ?   (1x) :  ?   :  -;
        *  ?    ?   :  ?   :  -;
        ?  *    ?   :  ?   :  -;
        0  0   (01) :  ?   :  -;

    endtable
endprimitive

//
// Verilog User Primitive definition for GTECH_UDP_FJK2
//

primitive GTECH_UDP_FJK2  (Q, J, K,CP, CD); 
    output Q; 
    input J, K, CP, CD; 
    reg Q; 
  
// FUNCTION :  DFF 
  
    table 
   //   J  K   CP   CD  :  Q   : Qt+1 
   //--------------------------------- 
        0  1   (01) ?   :  ?   :  0; 
        0  x   (01) ?   :  0   :  0;
        1  0   (01) 1   :  ?   :  1; 
        x  0   (01) 1   :  1   :  1;
        1  1   (01) 1   :  1   :  0;
        1  1   (01) 1   :  0   :  1;
        0  ?   (0x) ?   :  0   :  0; 
        0  ?   (x1) ?   :  0   :  0; 
        ?  0   (0x) 1   :  1   :  1; 
        ?  0   (x1) 1   :  1   :  1; 
        ?  ?    ?  (?0) :  ?   :  0;
        ?  ?    ?  (?x) :  0   :  0;
        *  ?    ?   ?   :  ?   :  -;
        ?  *    ?   ?   :  ?   :  -; 
        ?  ?    ?  (?1) :  ?   :  -;
        ?  ?   (?0) ?   :  ?   :  -; 
        ?  ?   (1x) ?   :  ?   :  -; 
        0  0   (01) ?   :  ?   :  -; 
        ?  ?    *   0   :  0   :  0;
 
    endtable 
endprimitive 

//
// Verilog User Primitive definition for GTECH_UDP_FJK3
//

primitive GTECH_UDP_FJK3  (Q, J, K,CP, CD, SD); 
    output Q;    
    input J, K, CP, CD, SD;  
    reg Q; 
    
// FUNCTION :  DFF 
  
    table 
   //   J  K   CP   CD   SD  : Q   : Qt+1 
   //------------------------------------ 
        0  1   (01) ?     1   : ?   :  0; 
        0  x   (01) ?     1   : 0   :  0; 
        1  0   (01) 1     ?   : ?   :  1; 
        x  0   (01) 1     ?   : 1   :  1; 
        1  1   (01) 1     1   : 1   :  0; 
        1  1   (01) 1     1   : 0   :  1; 
        0  ?   (0x) ?     1   : 0   :  0; 
        0  ?   (x1) ?     1   : 0   :  0; 
        ?  0   (0x) 1     ?   : 1   :  1; 
        ?  0   (x1) 1     ?   : 1   :  1; 
        ?  ?    ?   1    (?0) : ?   :  1;  
        ?  ?    ?   1    (?x) : 1   :  1; 
        ?  ?    ?  (?1)   0   : ?   :  1;
        ?  ?    ?  (?0)   ?   : ?   :  0;   
        ?  ?    ?  (?x)   1   : 0   :  0;  
        ?  ?    ?   0     *   : ?   :  0;
        ?  ?    ?   1    (?1) : ?   :  -; 
        ?  ?    ? (?1)    1   : ?   :  -; 
        ?  ?   (?0) ?     ?   : ?   :  -; 
        ?  ?   (1x) ?     ?   : ?   :  -; 
        *  ?    ?   ?     ?   : ?   :  -; 
        ?  *    ?   ?     ?   : ?   :  -; 
        0  0   (01) ?     ?   : ?   :  -; 
        ?  ?    *   0     ?   : 0   :  0;
        ?  ?    *   1     0   : 1   :  1;
  
    endtable  
endprimitive 

//
// Verilog User Primitive definition for GTECH_UDP_FJK4
//

primitive GTECH_UDP_FJK4  (Q, J, K,CP, SD); 
    output Q;  
    input J, K, CP, SD; 
    reg Q; 
   
// FUNCTION :  DFF
 
    table
   //   J  K   CP   SD  : Q   : Qt+1
   //-------------------------------
        0  1   (01) 1   : ?   :  0;
        0  x   (01) 1   : 0   :  0;
        1  0   (01) ?   : ?   :  1;
        x  0   (01) ?   : 1   :  1;
        1  1   (01) 1   : 1   :  0;
        1  1   (01) 1   : 0   :  1;
        0  ?   (0x) 1   : 0   :  0;
        0  ?   (x1) 1   : 0   :  0;
        ?  0   (0x) ?   : 1   :  1;
        ?  0   (x1) ?   : 1   :  1;
        ?  ?    ?  (?0) : ?   :  1; 
        ?  ?    ?  (?x) : 1   :  1;
        *  ?    ?   ?   : ?   :  -; 
        ?  *    ?   ?   : ?   :  -;
        ?  ?    ?  (?1) : ?   :  -;
        ?  ?   (?0) ?   : ?   :  -;
        ?  ?   (1x) ?   : ?   :  -;
        0  0   (01) ?   : ?   :  -;
        ?  ?    *   0   : 1   :  1; 
 
    endtable 
endprimitive

//
// Verilog User Primitive definition for GTECH_UDP_LD1
//

primitive GTECH_UDP_LD1_Q  (Q, D, G);
    output Q;
    input D, G;
    reg Q;
 
// FUNCTION :  D Latch
 
    table
   //   D   G   :  Q   : Qt+1
   //-----------------------
      (?0)  1   :  ?   :  0;
      (?1)  1   :  ?   :  1;
      (?0)  x   :  0   :  0;
      (?1)  x   :  1   :  1;
        0  (?1) :  ?   :  0;
        1  (?1) :  ?   :  1;
        0  (0x) :  0   :  0; 
        1  (0x) :  1   :  1;
        ?  (?0) :  ?   :  -; 
        ?  (1x) :  ?   :  -; 
        *   0   :  ?   :  -;
 
    endtable
endprimitive

//
// Verilog User Primitive definition for GTECH_UDP_LD2
//

primitive GTECH_UDP_LD2_Q  (Q, D, GN);
    output Q;
    input D, GN;
    reg Q;
 
// FUNCTION :  D Latch Active Low
 
    table
   //   D   GN  :  Q   : Qt+1
   //-----------------------
      (?0)  0   :  ?   :  0;
      (?1)  0   :  ?   :  1;
      (?0)  x   :  0   :  0;
      (?1)  x   :  1   :  1;
        0  (?0) :  ?   :  0;
        1  (?0) :  ?   :  1;
        0  (1x) :  0   :  0;
        1  (1x) :  1   :  1;
        ?  (?1) :  ?   :  -;
        ?  (0x) :  ?   :  -;
        *   1   :  ?   :  -;
    endtable
endprimitive

//
// Verilog User Primitive definition for GTECH_UDP_LD3
//

primitive GTECH_UDP_LD3_Q  (Q, D, G, CD);
    output Q;
    input D, G, CD;
    reg Q;
 
// FUNCTION :  D Latch
 
    table
   //   D   G   CD  :  Q   : Qt+1
   //----------------------------
      (?0)  1   ?   :  ?   :  0;
      (?1)  1   1   :  ?   :  1;
      (?0)  x   ?   :  0   :  0;
      (?1)  x   1   :  1   :  1;
        0  (?1) ?   :  ?   :  0;
        1  (?1) 1   :  ?   :  1;
        0  (0x) ?   :  0   :  0;
        1  (0x) 1   :  1   :  1;
        ?   ?  (?0) :  ?   :  0;
        *   ?   0   :  ?   :  0;
        ?   *   0   :  ?   :  0;
        0   *   x   :  0   :  0;
        0   ?  (?x) :  0   :  0;
        0   1  (?1) :  ?   :  0;
        0   x  (?1) :  0   :  0;
        1   x  (?1) :  1   :  1;
        1   1  (?1) :  ?   :  1;
        ?   0  (?1) :  ?   :  -;
        ?  (?0) 1   :  ?   :  -;
        ?  (1x) 1   :  ?   :  -;
        *   0   1   :  ?   :  -;
        
    endtable
endprimitive

//
// Verilog User Primitive definition for GTECH_UDP_LD4
//

primitive GTECH_UDP_LD4_Q  (Q, D, GN, CD);
    output Q;
    input D, GN, CD;
    reg Q;
 
// FUNCTION :  D Latch Active Low with Reset
 
    table
   //   D   GN   CD :   Q   : Qt+1
   //----------------------------
      (?0)  0   ?   :  ?   :  0;
      (?1)  0   1   :  ?   :  1;
      (?0)  x   ?   :  0   :  0;
      (?1)  x   1   :  1   :  1;
        0  (?0) ?   :  ?   :  0;
        1  (?0) 1   :  ?   :  1;
        0  (1x) ?   :  0   :  0;
        1  (1x) 1   :  1   :  1;
        ?   ?  (?0) :  ?   :  0; 
        *   ?   0   :  ?   :  0;
        ?   *   0   :  ?   :  0;
        0   *   x   :  0   :  0;
        0   ?  (?x) :  0   :  0; 
        0   0  (?1) :  ?   :  0; 
        0   x  (?1) :  0   :  0; 
        1   0  (?1) :  ?   :  1; 
        1   x  (?1) :  1   :  1; 
        ?   1  (?1) :  ?   :  -;
        ?  (?1) 1   :  ?   :  -;
        ?  (0x) 1   :  ?   :  -;
        *   1   1   :  ?   :  -;

    endtable
endprimitive

//
// Verilog User Primitive definition for GTECH_UDP_LSR0
//

primitive GTECH_UDP_LSR0_Q  (Q, S, R);
    output Q;
    input S, R;
    reg Q;
 
// FUNCTION :  SR Latch Active Low 
 
    table
   //   S   R  : Q   : Qt+1
   //---------------------
        ?  (?0):  ?  :  0;
        *   0  :  ?  :  0;
       (?0) 1  :  ?  :  1;
        0  (?1):  ?  :  1;
       (?1) 1  :  ?  :  -;
       (?x) 1  :  ?  :  -;
        1  (?x):  ?  :  -;
        1  (?1):  ?  :  -;
        
    endtable
endprimitive

//
// Verilog User Primitive definition for GTECH_UDP_MUX2
//

primitive GTECH_UDP_MUX2 (Z, A, B, S);
   output Z;
   input A, B, S;

   // FUNCTION: 2:1 MUX

   table 
   //   A   B  S :  Z
   //----------------
        0   ?  0 :  0;
        1   ?  0 :  1;
        ?   0  1 :  0;
        ?   1  1 :  1;
        0   0  x :  0;
        1   1  x :  1;
    endtable
endprimitive

//
// Verilog User Primitive definition for GTECH_UDP_MUX4
//

primitive GTECH_UDP_MUX4 (Z, D0, D1, D2, D3, A, B);
    output Z;
    input D0, D1, D2, D3, A, B;

    // FUNCTION: 4:1 MUX

    table
   //D0  D1  D2  D3  A  B  : Z
   //-------------------------
     0   ?   ?   ?   0  0  : 0 ;
     1   ?   ?   ?   0  0  : 1 ;

     ?   0   ?   ?   1  0  : 0 ;
     ?   1   ?   ?   1  0  : 1 ;

     ?   ?   0   ?   0  1  : 0 ;
     ?   ?   1   ?   0  1  : 1 ;

     ?   ?   ?   0   1  1  : 0 ;
     ?   ?   ?   1   1  1  : 1 ;


     0   0   0   0   ?  ?  : 0 ;
 
     1   1   1   1   ?  ?  : 1 ;
 
     0   0   ?   ?   ?  0  : 0 ;
     1   1   ?   ?   ?  0  : 1 ;
 
     ?   ?   0   0   ?  1  : 0 ;
     ?   ?   1   1   ?  1  : 1 ;
 
     0   ?   0   ?   0  ?  : 0 ;
     1   ?   1   ?   0  ?  : 1 ;
 
     ?   0   ?   0   1  ?  : 0 ;
     ?   1   ?   1   1  ?  : 1 ;

    endtable
endprimitive
