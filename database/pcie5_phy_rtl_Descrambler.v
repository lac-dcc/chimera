module Descrambler(input wire clk, input wire reset, input wire turnOff, input wire PIPEDataValid, input wire [1:0]PIPESyncHeader, input wire [5:0]PIPEWIDTH,
					input wire [23:0]seedValue, input wire [31:0]PIPEData, input wire [3:0]PIPEDataK, input [2:0]GEN, output wire descramblerDataValid,
					output wire [1:0]descramblerSyncHeader, output wire [31:0]descramblerData, output wire [3:0]descramblerDataK);


	//sync header: 01 -> data block , 10 -> OS
	wire patternReset;
	wire [3:0]advance;
	wire [1:0]lfsrSel;
	wire [3:0]descramblingEnable;
	wire [31:0]lfsrOut_8, lfsrOut_16, lfsrOut_32, lfsrOut_8_gen3, lfsrOut_16_gen3, lfsrOut_32_gen3;
	reg [7:0] reg1, reg2, reg3, reg4;
	reg [31:0]data, lfsrOut;

	LFSR_8 lfsr_8(.scrambler_reset(patternReset), .reset_n(reset), .pclk(clk), .data_out(lfsrOut_8[7:0]));
	LFSR_16 lfsr_16(.scrambler_reset(patternReset), .reset_n(reset), .pclk(clk), .data_out(lfsrOut_16[15:0]));
	LFSR_32 lfsr_32(.scrambler_reset(patternReset), .reset_n(reset), .pclk(clk), .data_out(lfsrOut_32));
	
	LFSR_8_gen3 lfsr_8_gen3(.seedValue(seedValue), .scrambler_reset(patternReset), .reset_n(reset), .pclk(clk), .data_out(lfsrOut_8_gen3[7:0]));
	LFSR_16_gen3 lfsr_16_gen3(.seedValue(seedValue), .scrambler_reset(patternReset), .reset_n(reset), .pclk(clk), .data_out(lfsrOut_16_gen3[15:0]));
	LFSR_32_gen3 lfsr_32_gen3(.seedValue(seedValue), .scrambler_reset(patternReset), .reset_n(reset), .pclk(clk), .data_out(lfsrOut_32_gen3));		
		
	
	Master master(.turnOff(turnOff), .syncHeader(PIPESyncHeader), .PIPEWIDTH(PIPEWIDTH), .masterData(PIPEData), .GEN(GEN),
					.patternReset(patternReset), .LFSRSel(lfsrSel), .advance(advance), .descramblingEnable(descramblingEnable));

	always@*
		if(GEN < 3) 
		begin
			if(lfsrSel == 0)
				lfsrOut = lfsrOut_8;
			else if(lfsrSel == 1)
				lfsrOut = lfsrOut_16;
			else 
				lfsrOut = lfsrOut_32;
		end
		else 
		begin
			if(lfsrSel == 0)
				lfsrOut = lfsrOut_8_gen3;
			else if(lfsrSel == 1)
				lfsrOut = lfsrOut_16_gen3;
			else 
				lfsrOut = lfsrOut_32_gen3;
		end

	always@(*)
		if(!reset)
			begin
			reg1 <= 0;
			reg2 <= 0;
			reg3 <= 0;
			reg4 <= 0;
			end
		else 
			begin
			if(advance[0] == 1)
				reg1 <= lfsrOut[7:0];
			if(advance[1] == 1)
				reg2 <= lfsrOut[15:8];
			if(advance[2] == 1)
				reg3 <= lfsrOut[23:16];
			if(advance[3] == 1)
				reg4 <= lfsrOut[31:24];
			end

	always@*
		begin
			if(GEN < 3)
			begin
				if(PIPEDataK[0] == 0)
					data[7:0] = reg1 ^ PIPEData[7:0];
				else
					data[7:0] = PIPEData[7:0];
				if(PIPEDataK[1] == 0)
					data[15:8] = reg2 ^ PIPEData[15:8];
				else 
					data[15:8] = PIPEData[15:8];
				if(PIPEDataK[2] == 0)
					data[23:16] = reg3 ^ PIPEData[23:16];
				else 
					data[23:16] = PIPEData[23:16];
				if(PIPEDataK[3] == 0)
					data[31:24] = reg4 ^ PIPEData[31:24];
				else 
					data[31:24] = PIPEData[31:24];
			end
		end
		
		always@*
		begin
			if(GEN >= 3)
			begin
				if(descramblingEnable[0])
					data[7:0] = reg1 ^ PIPEData[7:0];
				else
					data[7:0] = PIPEData[7:0];
				if(descramblingEnable[1])
					data[15:8] = reg2 ^ PIPEData[15:8];
				else 
					data[15:8] = PIPEData[15:8];
				if(descramblingEnable[2])
					data[23:16] = reg3 ^ PIPEData[23:16];
				else 
					data[23:16] = PIPEData[23:16];
				if(descramblingEnable[3])
					data[31:24] = reg4 ^ PIPEData[31:24];
				else 
					data[31:24] = PIPEData[31:24];
			end
		end
			

	assign descramblerData =  (turnOff == 1 && GEN < 3)? PIPEData :  
							  (PIPEWIDTH == 8)? {24'b0, data[7:0]} : 
							  (PIPEWIDTH == 16)? {16'b0, data[15:0]} :
							  (PIPEWIDTH == 32)? data : 32'b0;
	assign descramblerDataK = PIPEDataK;	
	assign descramblerDataValid = PIPEDataValid;
	assign descramblerSyncHeader = PIPESyncHeader;

endmodule
