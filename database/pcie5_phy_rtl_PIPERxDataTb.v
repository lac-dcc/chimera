module PIPERxDataTb();
	

	reg reset, clk, RxValid, PhyStatus, RxStartBlock;
	reg [3:0]RxDataK;
	reg [1:0] RxSyncHeader;
	reg [2:0] RxStatus, GEN;
	reg [31:0] RxData;
	wire PIPEDataValid;
	wire [3:0]PIPEDataK;
	wire [1:0]PIPESyncHeader;
	wire [31:0]PIPEData;

	PIPE_Rx_Data PIPE(.reset(reset), .clk(clk), .GEN(GEN), .RxValid(RxValid), .RxStatus(RxStatus), .PhyStatus(PhyStatus),
					.RxData(RxData), .RxDataK(RxDataK), .RxStartBlock(RxStartBlock), .RxSyncHeader(RxSyncHeader), .PIPESyncHeader(PIPESyncHeader),
					.PIPEDataValid(PIPEDataValid), .PIPEData(PIPEData), .PIPEDataK(PIPEDataK));

	always
	begin
		#50
		clk = ~clk;
	end

	always@(posedge clk)
		$monitor ("%0dns: \$monitor: PIPEDataValid = %d PIPEData = %h PIPEDataK = %d", $stime, PIPEDataValid, PIPEData, PIPEDataK);

	initial 
	begin
		//==== initialize clk ====
		clk = 0;
		//==== reset ====
		reset = 1;
		#50
		reset = 0;
		#50
		reset = 1;
		//=== GEN3 data ===
		RxStartBlock = 1;
		RxSyncHeader = 0;
		//=== Good Scenario (data) with PIPEWIDTH = 8 ===
		GEN = 1;
		RxValid = 1;
		RxStatus = 0;
		PhyStatus = 1;
		RxData = 8'hAB;
		RxDataK = 0;
		#100
		//=== Bad Scenario_1 ===
		RxValid = 0;
		RxStatus = 0;
		RxData = 3;
		RxDataK = 1;
		#100
		//=== Good Scenario (control) with PIPEWIDTH = 16===
		GEN = 2;
		RxValid = 1;
		RxStatus = 0;
		RxData = 16'hAB_CD;
		RxDataK = 2;
		#100
		//=== Bad Scenario_2 ===
		RxValid = 1;
		RxStatus = 1;
		RxData = 7;
		RxDataK = 3;
		#100
		//=== Good Scenario (data) with PIPEWIDTH = 32 ===
		GEN = 3;
		RxSyncHeader = 2'b01;
		RxValid = 1;
		RxStatus = 0;
		RxData = 32'hAB_CD_EF_FF;
		RxDataK = 0;
		#100
		$stop;
	end

endmodule

		