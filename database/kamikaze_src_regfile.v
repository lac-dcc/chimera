module kamikaze_regfile (clk_i,
			
			waddr_i,
			wdata_i,
			we_i,
			
			raddr1_i,
			rdata1_o,
			
			raddr2_i,
			rdata2_o);
	input clk_i;

	
	input [4:0] waddr_i;
	input [31:0] wdata_i;
	input we_i;
	
	input [4:0] raddr1_i;
	input [4:0] raddr2_i;
	
	output reg [31:0] rdata1_o;
	output reg [31:0] rdata2_o;

	/* 可能可以加倍时钟速度换取非双口的RAM实现，2R 1W */
				
	reg [31:0]memory[0:31];
	
	wire [31:0]cpureg_1 = memory[1];
	wire [31:0]cpureg_2 = memory[2];
	wire [31:0]cpureg_3 = memory[3];
	wire [31:0]cpureg_4 = memory[4];
	wire [31:0]cpureg_5 = memory[5];
	wire [31:0]cpureg_6 = memory[6];
	wire [31:0]cpureg_7 = memory[7];
	wire [31:0]cpureg_8 = memory[8];
	wire [31:0]cpureg_9 = memory[9];
	wire [31:0]cpureg_10 = memory[10];
	wire [31:0]cpureg_11 = memory[11];
	wire [31:0]cpureg_12 = memory[12];
	wire [31:0]cpureg_13 = memory[13];
	wire [31:0]cpureg_14 = memory[14];
	wire [31:0]cpureg_15 = memory[15];
	wire [31:0]cpureg_16 = memory[16];
	wire [31:0]cpureg_17 = memory[17];
	wire [31:0]cpureg_18 = memory[18];
	wire [31:0]cpureg_19 = memory[19];
	wire [31:0]cpureg_20 = memory[20];
	wire [31:0]cpureg_21 = memory[21];
	wire [31:0]cpureg_22 = memory[22];
	wire [31:0]cpureg_23 = memory[23];
	wire [31:0]cpureg_24 = memory[24];
	wire [31:0]cpureg_25 = memory[25];
	wire [31:0]cpureg_26 = memory[26];
	wire [31:0]cpureg_27 = memory[27];
	wire [31:0]cpureg_28 = memory[28];
	wire [31:0]cpureg_29 = memory[29];
	wire [31:0]cpureg_30 = memory[30];
	wire [31:0]cpureg_31 = memory[31];	

	integer i;
	initial
		for(i = 0; i < 32; i++)
			memory[i] <= 32'h0;
	
	always @(posedge clk_i)
	begin
		if(we_i)
			memory[waddr_i] <= wdata_i;
	end
	
	always @*
	begin
		rdata1_o = raddr1_i? memory[raddr1_i]: 0;
		rdata2_o = raddr2_i? memory[raddr2_i]: 0;
	end
endmodule
