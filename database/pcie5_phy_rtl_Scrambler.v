module Scrambler (input wire pclk, input wire reset_n, input wire turnOff, input wire [5:0]PIPEWIDTH, input wire [1:0]LMCSyncHeader_1,
				  input wire [23:0]seedValue, input wire [31:0]dataout_1, input wire [3:0]d_k_out_1, input wire data_valid_out_1, 
				  input wire [2:0]GEN , output wire [31:0]scramblerDataOut, output wire [3:0]scramblerDataK, output wire scramblerDataValid,
				  output wire [1:0]scramblerSyncHeader);

	wire patternReset;
	wire [3:0]advance;
	wire [1:0]lfsrSel;
	wire [3:0]scramblingEnable;
	wire [31:0]lfsrOut_8, lfsrOut_16, lfsrOut_32, lfsrOut_8_gen3, lfsrOut_16_gen3, lfsrOut_32_gen3;
	reg [7:0] reg1, reg2, reg3, reg4;
	reg [31:0]data, lfsrOut;

//sync header: 01 -> data block , 10 -> OS

// seedValue of Lane 1 = 1dbfbc
// seedValue of Lane 2 = 0607bb
// seedValue of Lane 3 = 1ec760
// seedValue of Lane 4 = 18c0db
// seedValue of Lane 5 = 010f12
// seedValue of Lane 6 = 19cfc9
// seedValue of Lane 7 = 0277ce
// seedValue of Lane 8 = 1bb807


	LFSR_8 lfsr_8(.scrambler_reset(patternReset), .reset_n(reset_n), .pclk(pclk), .data_out(lfsrOut_8[7:0]));
	LFSR_16 lfsr_16(.scrambler_reset(patternReset), .reset_n(reset_n), .pclk(pclk), .data_out(lfsrOut_16[15:0]));
	LFSR_32 lfsr_32(.scrambler_reset(patternReset), .reset_n(reset_n), .pclk(pclk), .data_out(lfsrOut_32));					


	LFSR_8_gen3 lfsr_8_gen3(.seedValue(seedValue), .scrambler_reset(patternReset), .reset_n(reset_n), .pclk(pclk), .data_out(lfsrOut_8_gen3[7:0]));
	LFSR_16_gen3 lfsr_16_gen3(.seedValue(seedValue), .scrambler_reset(patternReset), .reset_n(reset_n), .pclk(pclk), .data_out(lfsrOut_16_gen3[15:0]));
	LFSR_32_gen3 lfsr_32_gen3(.seedValue(seedValue), .scrambler_reset(patternReset), .reset_n(reset_n), .pclk(pclk), .data_out(lfsrOut_32_gen3));					


	Master_Tx master_tx(.turnOff(turnOff), .syncHeader(LMCSyncHeader_1), .PIPEWIDTH(PIPEWIDTH), .masterData(dataout_1), .GEN(GEN),
				 .patternReset(patternReset), .LFSRSel(lfsrSel), .advance(advance), .scramblingEnable(scramblingEnable));

	always@*

	if(GEN < 3) begin
		if(lfsrSel == 0)
			lfsrOut = lfsrOut_8;
		else if(lfsrSel == 1)
			lfsrOut = lfsrOut_16;
		else 
			lfsrOut = lfsrOut_32;
	end
	else begin
		if(lfsrSel == 0)
			lfsrOut = lfsrOut_8_gen3;
		else if(lfsrSel == 1)
			lfsrOut = lfsrOut_16_gen3;
		else 
			lfsrOut = lfsrOut_32_gen3;
	end


	always@(*)
		if(!reset_n)
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
				if(d_k_out_1[0] == 0)
					data[7:0] = reg1 ^ dataout_1[7:0];
				else 
					data[7:0] = dataout_1[7:0];
				if(d_k_out_1[1] == 0)
					data[15:8] = reg2 ^ dataout_1[15:8];
				else 
					data[15:8] = dataout_1[15:8];
				if(d_k_out_1[2] == 0)
					data[23:16] = reg3 ^ dataout_1[23:16];
				else 
					data[23:16] = dataout_1[23:16];
				if(d_k_out_1[3] == 0)
					data[31:24] = reg4 ^ dataout_1[31:24];
				else 
					data[31:24] = dataout_1[31:24];
			end
		end
			
	always@*
		begin
			if(GEN >= 3)
			begin
				if(scramblingEnable[0])
					data[7:0] = reg1 ^ dataout_1[7:0];
				else
					data[7:0] = dataout_1[7:0];
				if(scramblingEnable[1])
					data[15:8] = reg2 ^ dataout_1[15:8];
				else 
					data[15:8] = dataout_1[15:8];
				if(scramblingEnable[2])
					data[23:16] = reg3 ^ dataout_1[23:16];
				else 
					data[23:16] = dataout_1[23:16];
				if(scramblingEnable[3])
					data[31:24] = reg4 ^ dataout_1[31:24];
				else 
					data[31:24] = dataout_1[31:24];
			end
		end
			

	assign scramblerDataOut =   (turnOff == 1 && GEN < 3)? dataout_1 : 
								(PIPEWIDTH ==8)? {24'b0, data[7:0]} :
								(PIPEWIDTH ==16)? {16'b0, data[15:0]} :
								(PIPEWIDTH ==32)? data : 32'b0 ;

	assign scramblerDataK = d_k_out_1;	
	assign scramblerDataValid = data_valid_out_1;
	assign scramblerSyncHeader = LMCSyncHeader_1;

endmodule

