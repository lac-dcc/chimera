// This program was cloned from: https://github.com/Shiva9361/Simple_Processor
// License: MIT License

module left_shifter(input1,input2,out);
input [31:0] input1;
input [31:0] input2; 
output [31:0] out;
wire [31:0] shifted;

genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin
        assign shifted[i] = (i < input2) ? 0 : input1[i - input2];
    end
endgenerate

assign out = shifted;
endmodule

module right_shifter(input1,input2,out);
input [31:0] input1;
input [31:0] input2; 
output [31:0] out;
wire [31:0] shifted;

genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin
        assign shifted[i] = (i + input2 > 31) ? 0 : input1[i + input2];
    end
endgenerate

assign out = shifted;
endmodule

module right_shifter_arith(input1,input2,out);
input [31:0] input1;
input [31:0] input2; 
output [31:0] out;
wire [31:0] shifted;
assign sign = input1[31];

genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin
        assign shifted[i] = (i + input2 > 31) ? sign : input1[i + input2];
    end
endgenerate

assign out = shifted;
endmodule

