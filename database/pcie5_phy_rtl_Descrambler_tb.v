module descrambler_tb();

	reg clk, reset, turnOff, PIPEDataValid;
	reg [1:0]PIPESyncHeader;
	reg [5:0]PIPEWIDTH = 32;
	reg [31:0]PIPEData;
	reg [3:0]PIPEDataK;
	wire descramblerDataValid, scramblerDataValid;
	wire [1:0]descramblerSyncHeader;
	wire [31:0]descramblerData, scramblerData;
	wire [3:0]descramblerDataK, scramblerDataK;


	Descrambler descrambler(.clk(clk), .reset(reset), .turnOff(turnOff), .PIPEDataValid(PIPEDataValid), .PIPEWIDTH(PIPEWIDTH), .PIPESyncHeader(PIPESyncHeader),
					.seedValue(24'b0), .PIPEData(scramblerData), .PIPEDataK(PIPEDataK), .descramblerDataValid(descramblerDataValid),
					.descramblerData(descramblerData), .descramblerDataK(descramblerDataK), .descramblerSyncHeader(descramblerSyncHeader));
	
	Descrambler scrambler(.clk(clk), .reset(reset), .turnOff(turnOff), .PIPEDataValid(PIPEDataValid), .PIPEWIDTH(PIPEWIDTH), .PIPESyncHeader(PIPESyncHeader),
					.seedValue(24'b0), .PIPEData(PIPEData), .PIPEDataK(PIPEDataK), .descramblerDataValid(scramblerDataValid),
					.descramblerData(scramblerData), .descramblerDataK(scramblerDataK), .descramblerSyncHeader(descramblerSyncHeader));


	always
	begin
		#50
		clk = ~clk;
	end

	always@(posedge clk)
		$monitor ("%0dns: \$monitor: PIPEData = %h ScramblerData = %h DescramblerData = %h", $stime, PIPEData, scramblerData, descramblerData);

	initial 
	begin
		//==== initialize clk ====
		clk = 1;
		//==== reset ====
		reset = 0;
		#50
		reset = 1;
		#50
		//===  disable Scrambler and Descrambler ===
		PIPEData = 32'hAF_AF_AF_AF;
		PIPEDataK = 4'b1010;
		turnOff = 1;
		PIPEDataValid = 1;
		#100;
		//===  data ===
		turnOff = 0;
		PIPEData = 32'hAF_AF_AF_AF;
		PIPEDataK = 4'b0000;
		#100;
		//===  data ===
		turnOff = 0;
		PIPEData = 32'hBF_BF_BF_BF;
		PIPEDataK = 4'b0000;
		#100;
		//===  disable Scrambler and Descrambler ===
		PIPEData = 32'hAF_AF_AF_AF;
		PIPEDataK = 4'b1010;
		turnOff = 1;
		PIPEDataValid = 1;
		#100;
		//===  Control ===
		turnOff = 0;
		PIPEData = 32'hAF_AF_AF_AF;
		PIPEDataK = 4'b1111;
		#100;
		//===  Data & COM character ===
		PIPEData = 32'hAF_AF_BC_AF;
		PIPEDataK = 4'b0010;
		#100;
		//===  Data ===
		PIPEData = 32'hAF_AF_AF_AF;
		PIPEDataK = 4'b0000;
		#100;
		//===  Data & SKP ===
		PIPEData = 32'hAF_1C_AF_AF;
		PIPEDataK = 4'b0100;
		#100;
	end

endmodule
