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


/***************************************************
Reference: yosys/techlibs/common/simlib.v

module \$adffe (CLK, ARST, EN, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter EN_POLARITY = 1'b1;
parameter ARST_POLARITY = 1'b1;
parameter ARST_VALUE = 0;

input CLK, ARST, EN;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;
wire pos_clk = CLK == CLK_POLARITY;
wire pos_arst = ARST == ARST_POLARITY;

always @(posedge pos_clk, posedge pos_arst) begin
	if (pos_arst)
		Q <= ARST_VALUE;
	else if (EN == EN_POLARITY)
		Q <= D;
end

endmodule

******************************************************/

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
    wire cg_enb;
    wire cg_clk;
    wire cg_gclk;

    // Check the Polarity of Clock Gate Enable
    generate
        if(EN_POLARITY == 0) begin
          assign cg_enb = ~EN;
        end else begin
          assign cg_enb = EN;
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_clk = ~CLK;
        end else begin
          assign cg_clk = CLK;
        end
    endgenerate

    // Check the Width the Data
    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_gclk = ~GCLK;
        end else begin
          assign cg_gclk = GCLK;
        end
    endgenerate

    $adff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .ARST_VALUE(ARST_VALUE) ,
            .ARST_POLARITY (ARST_POLARITY)
            ) 
            flipflop(  
            .CLK(cg_gclk), 
            .ARST(ARST),
            .D(D), 
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

/**************************************************************
Reference: yosys/techlibs/common/simlib.v

module \$dffe (CLK, EN, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter EN_POLARITY = 1'b1;

input CLK, EN;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;
wire pos_clk = CLK == CLK_POLARITY;

always @(posedge pos_clk) begin
	if (EN == EN_POLARITY) Q <= D;
end

endmodule
******************************************************************/

module \$dffe ( CLK, D, EN, Q);
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter WIDTH =1;

    input  CLK, EN;
    input [WIDTH -1:0] D; 
    output [WIDTH -1:0] Q;

    wire GCLK;
    wire cg_enb;
    wire cg_clk;
    wire cg_gclk;

    // Check the Polarity of Clock Gate Enable
    generate
        if(EN_POLARITY == 0) begin
          assign cg_enb = ~EN;
        end else begin
          assign cg_enb = EN;
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_clk = ~CLK;
        end else begin
          assign cg_clk = CLK;
        end
    endgenerate

    // Check the Width the Data
    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_gclk = ~GCLK;
        end else begin
          assign cg_gclk = GCLK;
        end
    endgenerate

    $dff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            ) 
            flipflop(  
            .CLK(cg_gclk), 
            .D(D), 
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

/**********************************************************
Reference: yosys/techlibs/common/simlib.v

module \$dffsre (CLK, SET, CLR, EN, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter SET_POLARITY = 1'b1;
parameter CLR_POLARITY = 1'b1;
parameter EN_POLARITY = 1'b1;

input CLK, EN;
input [WIDTH-1:0] SET, CLR, D;
output reg [WIDTH-1:0] Q;

wire pos_clk = CLK == CLK_POLARITY;
wire [WIDTH-1:0] pos_set = SET_POLARITY ? SET : ~SET;
wire [WIDTH-1:0] pos_clr = CLR_POLARITY ? CLR : ~CLR;

genvar i;
generate
	for (i = 0; i < WIDTH; i = i+1) begin:bitslices
		always @(posedge pos_set[i], posedge pos_clr[i], posedge pos_clk)
			if (pos_clr[i])
				Q[i] <= 0;
			else if (pos_set[i])
				Q[i] <= 1;
			else if (EN == EN_POLARITY)
				Q[i] <= D[i];
	end
endgenerate

endmodule

***********************************************************/
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
    wire cg_enb;
    wire cg_clk;
    wire cg_gclk;

    // Check the Polarity of Clock Gate Enable
    generate
        if(EN_POLARITY == 0) begin
          assign cg_enb = ~EN;
        end else begin
          assign cg_enb = EN;
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_clk = ~CLK;
        end else begin
          assign cg_clk = CLK;
        end
    endgenerate

    // Check the Width the Data
    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_gclk = ~GCLK;
        end else begin
          assign cg_gclk = GCLK;
        end
    endgenerate

    $dffsr  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .CLR_POLARITY(CLR_POLARITY), 
            .SET_POLARITY(SET_POLARITY)
            ) 
            flipflop(  
            .CLK(cg_gclk), 
            .CLR(CLR),
            .SET(SET),
            .D(D), 
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
/*****************************
Reference: yosys/techlibs/common/simlib.v

module \$aldffe (CLK, ALOAD, AD, EN, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter EN_POLARITY = 1'b1;
parameter ALOAD_POLARITY = 1'b1;

input CLK, ALOAD, EN;
input [WIDTH-1:0] D;
input [WIDTH-1:0] AD;
output reg [WIDTH-1:0] Q;
wire pos_clk = CLK == CLK_POLARITY;
wire pos_aload = ALOAD == ALOAD_POLARITY;

always @(posedge pos_clk, posedge pos_aload) begin
	if (pos_aload)
		Q <= AD;
	else if (EN == EN_POLARITY)
		Q <= D;
end

endmodule

*************************************************/

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
    wire cg_enb;
    wire cg_clk;
    wire cg_gclk;

    // Check the Polarity of Clock Gate Enable
    generate
        if(EN_POLARITY == 0) begin
          assign cg_enb = ~EN;
        end else begin
          assign cg_enb = EN;
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_clk = ~CLK;
        end else begin
          assign cg_clk = CLK;
        end
    endgenerate

    // Check the Width the Data
    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_gclk = ~GCLK;
        end else begin
          assign cg_gclk = GCLK;
        end
    endgenerate

    $aldff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .ALOAD_POLARITY(ALOAD_POLARITY), 
            ) 
            flipflop(  
            .CLK(cg_gclk), 
            .D(D),
            .AD(AD),
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
/*************************************************************************************

Reference: yosys/techlibs/common/simlib.v

module \$sdffe (CLK, SRST, EN, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter EN_POLARITY = 1'b1;
parameter SRST_POLARITY = 1'b1;
parameter SRST_VALUE = 0;

input CLK, SRST, EN;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;
wire pos_clk = CLK == CLK_POLARITY;
wire pos_srst = SRST == SRST_POLARITY;

always @(posedge pos_clk) begin
	if (pos_srst)
		Q <= SRST_VALUE;
	else if (EN == EN_POLARITY)
		Q <= D;
end

endmodule

Note: This is synchronous FF and EN valid after reset assertion. To use the clock gate we need to propgate clock during reset phase

*******************************/

module \$sdffe ( CLK, EN, SRST, D, Q);
    parameter CLK_POLARITY =1'b1;
    parameter EN_POLARITY =1'b1;
    parameter SRST_POLARITY =1'b1;
    parameter SRST_VALUE =1'b1;
    parameter WIDTH =1;


    input  CLK, EN, SRST;
    input [WIDTH -1:0] D; 
    output [WIDTH -1:0] Q;

    wire GCLK;
    wire cg_enb;
    wire cg_clk;
    wire cg_gclk;
    wire cg_rstenb;

    // Check the Polarity of Clock Gate Enable
    generate
        if(SRST_POLARITY == 0) begin
          assign cg_rstenb = ~SRST;
        end else begin
          assign cg_rstenb = SRST;
        end
    endgenerate

    // Check the Polarity of Clock Gate Enable
    // We need to enable clock during reset assertion
    generate
        if(EN_POLARITY == 0) begin
          assign cg_enb = (~EN) | cg_rstenb;
        end else begin
          assign cg_enb = EN | cg_rstenb;
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_clk = ~CLK;
        end else begin
          assign cg_clk = CLK;
        end
    endgenerate

    // Check the Width the Data
    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_gclk = ~GCLK;
        end else begin
          assign cg_gclk = GCLK;
        end
    endgenerate

    $sdff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .SRST_POLARITY(SRST_POLARITY), 
            .SRST_VALUE(SRST_VALUE)
            ) 
            flipflop(  
            .CLK(cg_gclk), 
            .SRST(SRST),
            .D(D), 
            .Q(Q)
            );
endmodule

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

/********************************************************************

module \$sdffce (CLK, SRST, EN, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter EN_POLARITY = 1'b1;
parameter SRST_POLARITY = 1'b1;
parameter SRST_VALUE = 0;

input CLK, SRST, EN;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;
wire pos_clk = CLK == CLK_POLARITY;
wire pos_srst = SRST == SRST_POLARITY;

always @(posedge pos_clk) begin
	if (EN == EN_POLARITY) begin
		if (pos_srst)
			Q <= SRST_VALUE;
		else
			Q <= D;
	end
end

endmodule
***********************************************************************/

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
    wire cg_enb;
    wire cg_clk;
    wire cg_gclk;


    // Check the Polarity of Clock Gate Enable
    // We need to enable clock during reset assertion
    generate
        if(EN_POLARITY == 0) begin
          assign cg_enb = ~EN ;
        end else begin
          assign cg_enb = EN ;
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_clk = ~CLK;
        end else begin
          assign cg_clk = CLK;
        end
    endgenerate

    // Check the Width the Data
    generate
        if (WIDTH < 5) begin
                sky130_fd_sc_hd__dlclkp_1  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else if (WIDTH < 17) begin
                sky130_fd_sc_hd__dlclkp_2  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
                end
            else begin
                sky130_fd_sc_hd__dlclkp_4  clk_gate ( .GCLK(GCLK), .CLK(cg_clk), .GATE(cg_enb) );
        end
    endgenerate
    
    // Check the Polarity of Clock 
    generate
        if(CLK_POLARITY == 0) begin
          assign cg_gclk = ~GCLK;
        end else begin
          assign cg_gclk = GCLK;
        end
    endgenerate

    $sdff  #( 
            .WIDTH(WIDTH), 
            .CLK_POLARITY(CLK_POLARITY),
            .SRST_POLARITY(SRST_POLARITY), 
            .SRST_VALUE(SRST_VALUE)
            ) 
            flipflop(  
            .CLK(cg_gclk), 
            .SRST(SRST),
            .D(D), 
            .Q(Q)
            );
endmodule
