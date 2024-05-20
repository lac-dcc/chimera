// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module TC_Ram (clk, rst, load, save, address, in0, in1, in2, in3, out0, out1, out2, out3);
    parameter UUID = 0;
    parameter NAME = "";
    parameter WORD_WIDTH = 256;
    parameter WORD_COUNT = 256;
    input clk;
    input rst;
    input load;
    input save;
    input [31:0] address;
    input [63:0] in0;
    input [63:0] in1;
    input [63:0] in2;
    input [63:0] in3;
    output reg [63:0] out0;
    output reg [63:0] out1;
    output reg [63:0] out2;
    output reg [63:0] out3;
    
    reg [WORD_WIDTH-1:0] mem [0:WORD_COUNT];
    
    integer i;
    
    initial begin
        for (i=0; i<WORD_COUNT; i=i+1) mem[i] = {WORD_WIDTH{1'b0}};
        out0 = {64{1'b0}};
        out1 = {64{1'b0}};
        out2 = {64{1'b0}};
        out3 = {64{1'b0}};
    end
  
    generate
    if (WORD_WIDTH < 64) begin
        always @ (address or rst or load) begin
            if (load && !rst)
                out0 = {{(64-WORD_WIDTH){1'b0}}, mem[address][WORD_WIDTH-1:0]};
            else 
                out0 = {64{1'b0}};
            out1 = {64{1'b0}};
            out2 = {64{1'b0}};
            out3 = {64{1'b0}};
        end
        always @ (negedge clk) begin
            if (rst)
                for (i=0; i<WORD_COUNT; i=i+1) mem[i] = {WORD_WIDTH{1'b0}};
            else if (save)
                mem[address] = in0[WORD_WIDTH-1:0];
	    end
	end else if (WORD_WIDTH == 64) begin
        always @ (address or rst or load) begin
            if (load && !rst)
                out0 = mem[address][63:0];
            else 
                out0 = {64{1'b0}};
            out1 = {WORD_WIDTH{1'b0}};
            out2 = {WORD_WIDTH{1'b0}};
            out3 = {WORD_WIDTH{1'b0}};
        end
        always @ (negedge clk) begin
            if (rst)
                for (i=0; i<WORD_COUNT; i=i+1) mem[i] = {WORD_WIDTH{1'b0}};
            else if (save)
                mem[address][63:0] <= in0;
	    end
	end else if (WORD_WIDTH == 128) begin
        always @ (address or rst or load) begin
            if (load && !rst) begin
                out0 = mem[address][63:0];
                out1 = mem[address][127:64];
            end else begin
                out0 = {WORD_WIDTH{1'b0}};
                out1 = {WORD_WIDTH{1'b0}};
            end
            out2 = {WORD_WIDTH{1'b0}};
            out3 = {WORD_WIDTH{1'b0}};
        end
        always @ (negedge clk) begin
            if (rst)
                for (i=0; i<WORD_COUNT; i=i+1) mem[i] = {WORD_WIDTH{1'b0}};
            else if (save) begin
                mem[address][63:0] <= in0;
                mem[address][127:64] <= in1;
            end
	    end
	end else if (WORD_WIDTH == 256) begin
        always @ (address or rst or load) begin
            if (load && !rst) begin
                out0 = mem[address][63:0];
                out1 = mem[address][127:64];
                out2 = mem[address][191:128];
                out3 = mem[address][255:192];
            end else begin
                out0 = {WORD_WIDTH{1'b0}};
                out1 = {WORD_WIDTH{1'b0}};
                out2 = {WORD_WIDTH{1'b0}};
                out3 = {WORD_WIDTH{1'b0}};
            end
        end
        always @ (negedge clk) begin
            if (rst)
                for (i=0; i<WORD_COUNT; i=i+1) mem[i] = {WORD_WIDTH{1'b0}};
            else if (save) begin
                mem[address][63:0] = in0;
                mem[address][127:64] = in1;
                mem[address][191:128] = in2;
                mem[address][255:192] = in3;
            end
	    end
    end endgenerate
endmodule
