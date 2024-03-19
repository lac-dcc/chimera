module LPIF_tb();

	reg [2:0]GEN;
	reg [3:0]state;
	reg clk, reset, lp_force_detect;
	reg [511:0]packetData;
	reg [63:0]stp, sdp, tlpEND, dllpEND, EDB, packetValid;
	wire [511:0]lpifData;
	wire [2:0]pl_speedmode;
	wire [3:0]pl_state_sts;
	wire [63:0]pl_dllpend, pl_dllpstart, pl_tlpStart, pl_tlpedb, pl_tlpend, pl_valid;

	LPIF_RX_Control_DataFlow lpif(.clk(clk),  .reset(reset), .tlpstart(stp), .dllpstart(sdp), .tlpend(tlpEND), .dllpend(dllpEND), .edb(EDB), 
							.packetValid(packetValid), .packetData(packetData), .lp_force_detect(lp_force_detect), .GEN(GEN), .state(state), 
							.pl_tlpstart(pl_tlpStart), .pl_dllpstart(pl_dllpstart), .pl_tlpend(pl_tlpend), .pl_dllpend(pl_dllpend), 
							.pl_tlpedb(pl_tlpedb), .pl_valid(pl_valid), .pl_data(lpifData), .pl_speedmode(pl_speedmode), .pl_state_sts(pl_state_sts), 
							.ltssmForceDetect(ltssmForceDetect));

    always
	begin
		#50
		clk = ~clk;
	end

	always@(posedge clk)
		$monitor ("%0dns: \$monitor:packetData = %h LPIF Data = %h", $stime, packetData, lpifData);

	initial 
	begin
		//==== initialize clk ====
		clk = 1;
		//==== reset ====
		reset = 0;
		#50
		reset = 1;
		#50;
		//=== test===
		GEN = 1;
		state = 1;
		lp_force_detect = 1;
		stp = 64'b0; 
		sdp = 64'b0;
		tlpEND = 64'b0;
		dllpEND = 64'b0;
		EDB = 64'b0;
		packetValid = 64'hFFFFFFFFFFFFFFFF;
		packetData = 512'h01_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== test===
		GEN = 2;
		state = 2;
		lp_force_detect = 0;
		stp = {1'b1, 63'b0}; 
		sdp = 0;
		tlpEND = 0;
		dllpEND = 0;
		EDB = 0;
		packetValid = {4'b0111,60'hFFFFFFFFFFFFFFF};
		packetData = 512'hFB_05_0A_0E__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		//=== test===
		GEN = 3;
		state = 3;
		lp_force_detect = 1;
		stp = 0; 
		sdp = {4'b1,60'b0};
		tlpEND = 0;
		dllpEND = 0;
		EDB = 0;
		packetValid = {4'b1110,60'hFFFFFFFFFFFFFFF};
		packetData = 512'h01_05_0A_5C__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_3A;
		#100;
		sdp = 0;
		tlpEND = 64'b1;
		packetValid = {60'hFFFFFFFFFFFFFFF,4'b1110};
		packetData = 512'h01_05_0A_4B__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_FD;
		#100;
		tlpEND = 0;
		EDB = {4'b1000,60'b0};
		sdp = {4'b1,60'b0};
		dllpEND = {63'b0,1'b1};
		packetValid = {4'b0110,60'hFFFFFFFFFFFFFFE};
		packetData = 512'hFE_05_0A_5C__02_06_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_FD;
		#100;
		dllpEND = 0;
		EDB = {1'b1, 63'b0};
		sdp = {8'b00010100,56'b0};
		packetValid = {8'b01101011,56'hFFFFFFFFFFFFFF};
		packetData = 512'hFE_05_0A_5C__02_5C_0B_0F__03_07_0C_1A__04_08_0D_1B__05_09_0E_1C__06_10_0F_1D__07_11_1A_1E__08_12_1B_1F__09_13_1C_0E__10_14_1D_2A__11_15_1E_2B__12_16_1F_2C__13_17_2A_2D__14_18_2B_2E__15_19_2C_2F__16_20_2D_FD;
		#100;
		$stop;
	end

endmodule
