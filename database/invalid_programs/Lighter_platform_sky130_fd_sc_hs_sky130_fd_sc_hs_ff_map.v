/*
 	Copyright 2022 AUC Open Source Hardware Lab
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/



module \$adffe (ARST, CLK, D, EN, Q);
    parameter ARST_POLARITY =1'b1;
    parameter ARST_VALUE  =1'b0;
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter WIDTH =1;

    input ARST, CLK, EN;
    input [WIDTH -1 :0] D; 
    output [WIDTH -1 :0] Q;

    wire GCLK;

    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hs__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hs__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else begin
                sky130_fd_sc_hs__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
        end
    endgenerate

    $adff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .ARST_VALUE(ARST_VALUE) ,
            .ARST_POLARITY (ARST_POLARITY)
            ) 
            flipflop(  
            .CLK(GCLK), 
            .ARST(ARST),
            .D(D), 
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

module \$dffe ( CLK, D, EN, Q);
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter WIDTH =1;

    input  CLK, EN;
    input [WIDTH -1:0] D; 
    output [WIDTH -1:0] Q;

    wire GCLK;

    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hs__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hs__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else begin
                sky130_fd_sc_hs__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
        end
    endgenerate

    $dff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            ) 
            flipflop(  
            .CLK(GCLK), 
            .D(D), 
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

module \$dffsre ( CLK, EN, CLR, SET, D, Q);
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter CLR_POLARITY =1'b1;
    parameter SET_POLARITY =1'b1;
    parameter WIDTH =1;

    input  CLK, EN, CLR, SET;
    input [WIDTH -1:0] D; 
    output [WIDTH -1:0] Q;

    wire GCLK;

    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hs__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hs__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else begin
                sky130_fd_sc_hs__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
        end
    endgenerate

    $dffsr  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .CLR_POLARITY(CLR_POLARITY), 
            .SET_POLARITY(SET_POLARITY)
            ) 
            flipflop(  
            .CLK(GCLK), 
            .CLR(CLR),
            .SET(SET),
            .D(D), 
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

module \$aldffe ( CLK, EN, ALOAD, AD, D, Q);
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter ALOAD_POLARITY =1'b1;
    parameter WIDTH =1;

    input  CLK, EN, ALOAD;
    input [WIDTH -1:0] D; 
    input [WIDTH-1:0] AD;
    output [WIDTH -1:0] Q;

    wire GCLK;

    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hs__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hs__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else begin
                sky130_fd_sc_hs__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
        end
    endgenerate

    $aldff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .ALOAD_POLARITY(ALOAD_POLARITY), 
            ) 
            flipflop(  
            .CLK(GCLK), 
            .D(D),
            .AD(AD),
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

//module \$sdffe ( CLK, EN, SRST, D, Q);
//    parameter CLK_POLARITY =1'b1;
//    parameter EN_POLARITY =1'b1;
//    parameter SRST_POLARITY =1'b1;
//    parameter SRST_VALUE =1'b1;
//    parameter WIDTH =1;


//    input  CLK, EN, SRST;
//    input [WIDTH -1:0] D; 
//    output [WIDTH -1:0] Q;

//    wire GCLK;

//    generate
//        if (WIDTH < 5) begin
//                sky130_fd_sc_hs__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
//                end
//            else if (WIDTH < 17) begin
//                sky130_fd_sc_hs__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
//                end
//            else begin
//                sky130_fd_sc_hs__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
//        end
//    endgenerate

//    $sdff  #( 
//            .WIDTH(WIDTH), 
//            .CLK_POLARITY(CLK_POLARITY),
//            .SRST_POLARITY(SRST_POLARITY), 
//            .SRST_VALUE(SRST_VALUE)
//            ) 
//            flipflop(  
//            .CLK(GCLK), 
//            .SRST(SRST),
//            .D(D), 
//            .Q(Q)
//            );
//endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

module \$sdffce ( CLK, EN, SRST, D, Q);
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter SRST_POLARITY =1'b1;
    parameter SRST_VALUE =1'b1;
    parameter WIDTH =1;

    input  CLK, EN, SRST;
    input [WIDTH -1:0] D; 
    output [WIDTH -1:0] Q;

    wire GCLK;

    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hs__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hs__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
                end
            else begin
                sky130_fd_sc_hs__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(CLK), .GATE(EN) );
        end
    endgenerate

    $sdff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .SRST_POLARITY(SRST_POLARITY), 
            .SRST_VALUE(SRST_VALUE)
            ) 
            flipflop(  
            .CLK(GCLK), 
            .SRST(SRST),
            .D(D), 
            .Q(Q)
            );
endmodule
