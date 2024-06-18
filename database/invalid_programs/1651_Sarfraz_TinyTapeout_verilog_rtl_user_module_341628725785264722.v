// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/* Automatically generated from https://wokwi.com/projects/341628725785264722 */

`default_nettype none

module div4_341628725785264722 ( clk ,rst, out_clk );
    output out_clk;
    input clk ;
    input rst;

    reg [1:0] data;
    assign out_clk = data[1];

    always @(posedge clk)
    begin
    if (rst)
         data <= 2'b0;
    else
         data <= data+1;	
    end
endmodule

module user_module_341628725785264722(
  input [7:0] io_in,
  output [7:0] io_out
);

wire clk, rst_n, shift_clk, shift_dta;
wire [2:0] clk_source;

assign clk = io_in[0];
assign rst_n = io_in[1];
assign shift_clk = io_in[2];
assign shift_dta = io_in[3];
assign clk_source[0] = io_in[4];
assign clk_source[1] = io_in[5];
assign clk_source[2] = io_in[6];


/*Shift register chain, 16-bit*/
reg [11:0] shifter;

always @(posedge shift_clk)
begin
    shifter[11:1] <= shifter[10:0];
    shifter[0]   <= shift_dta;
end

/*Clock sources*/
//0
wire c0_1 = clk;
wire c0_output;
div4_341628725785264722 tmp0(c0_1, rst_n, c0_output);

//1
wire c1_1, c1_2, c1_3, c1_output;
assign c1_1 = c1_3 ^ shifter[0];
assign c1_2 = c1_1 ^ shifter[1];
assign c1_3 = c1_2 ^ shifter[2];
div4_341628725785264722 tmp1(c1_3, rst_n, c1_output);

//2
wire c2_1, c2_2, c2_3, c2_4, c2_5, c2_output;
assign c2_1 = c2_5 ^ shifter[0];
assign c2_2 = c2_1 ^ shifter[1];
assign c2_3 = c2_2 ^ shifter[2];
assign c2_4 = c2_3 ^ shifter[3];
assign c2_5 = c2_4 ^ shifter[4];
div4_341628725785264722 tmp2(c2_5, rst_n, c2_output);

//3
wire c3_1, c3_output;
assign c3_1 = c3_1 ^ shifter[0];
div4_341628725785264722 tmp3(c3_1, rst_n, c3_output);

//4 - requires shifter configuration to convert one stage to buffer 
wire c4_1, c4_2, c4_output;
assign c4_1 = c4_2 ^ shifter[0];
assign c4_2 = c4_1 ^ shifter[1];
div4_341628725785264722 tmp4(c4_2, rst_n, c4_output);

//5 - NAND version
wire c5_1, c5_2, c5_3, c5_4, c5_5, c5_output;
assign c5_1 = ~(c5_5 & shifter[0]);
assign c5_2 = ~(c5_1 & shifter[1]);
assign c5_3 = ~(c5_2 & shifter[2]);
assign c5_4 = ~(c5_3 & shifter[3]);
assign c5_5 = ~(c5_4 & shifter[4]);
div4_341628725785264722 tmp5(c5_5, rst_n, c5_output);

//6 - NOR version
wire c6_1, c6_2, c6_3, c6_4, c6_5, c6_output;
assign c6_1 = ~(c6_5 | shifter[0]);
assign c6_2 = ~(c6_1 | shifter[1]);
assign c6_3 = ~(c6_2 | shifter[2]);
assign c6_4 = ~(c6_3 | shifter[3]);
assign c6_5 = ~(c6_4 | shifter[4]);
div4_341628725785264722 tmp6(c6_5, rst_n, c6_output);

//7 - + version
wire c7_1, c7_2, c7_3, c7_4, c7_5, c7_output;
assign c7_1 = (c7_5 + shifter[0] + shifter[1]);
assign c7_2 = (c7_1 + shifter[2] + shifter[3]);
assign c7_3 = (c7_2 + shifter[4] + shifter[5]);
assign c7_4 = (c7_3 + shifter[6] + shifter[7]);
assign c7_5 = (c7_4 + shifter[8] + shifter[9]);
div4_341628725785264722 tmp7(c7_5, rst_n, c7_output);

/*Clock selector*/
reg selected_clock;
always @ (*) begin
    case (clk_source)
        3'b000 : selected_clock = c0_output;  
        3'b001 : selected_clock = c1_output;  
        3'b010 : selected_clock = c2_output;  
        3'b011 : selected_clock = c3_output;  
        3'b100 : selected_clock = c4_output;
        3'b101 : selected_clock = c5_output;
        3'b110 : selected_clock = c6_output;
        3'b111 : selected_clock = c7_output;
    endcase
end
  
reg [29 : 0] data;
assign io_out[0] = data[7];
assign io_out[1] = data[11];
assign io_out[2] = data[15];
assign io_out[3] = data[19];
assign io_out[4] = data[23];
assign io_out[5] = data[27];
assign io_out[6] = data[29];
assign io_out[7] = shifter[11];
//div4_341628725785264722 tmp1(clk, rst_n, io_out[6]);

always @ (posedge selected_clock or posedge rst_n) begin
  if (rst_n) begin
    data <= 'b0;
  end
  else begin
    data <= data + 1'b1;
  end
end

endmodule
