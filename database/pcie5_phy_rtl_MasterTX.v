module Mastertx(input wire turnOff, input wire [5:0]PIPEWIDTH, input wire [31:0]masterData,
		output wire patternReset, output wire [1:0]LFSRSel, output wire [3:0]advance);

	//LSREnable is instead od regWrite but temporarly until now.

	localparam SKP = 28;
	localparam COM = 188;
	reg ptrnReset;
	reg [3:0]write;
	
	always@*
		if(turnOff)	//must be turned off by LTSSM to make sure that TS1&TS2 data doesn't get scrambled
			begin
			ptrnReset = 1;
			write = 4'hF;
			end
		else
			begin	
			write = 4'hF;
			ptrnReset = 0;
			if(masterData[7:0] == COM || masterData[15:8] == COM || masterData[23:16] == COM || masterData[31:24] == COM)
				ptrnReset = 1;
			if(masterData[7:0] == SKP)
				write[0] = 0; 
			if(masterData[15:8] == SKP)
				write[1] = 0;
			if(masterData[23:16] == SKP)
				write[2] = 0;
			if(masterData[31:24] == SKP)
				write[3] = 0;
			end

	assign LFSRSel = (PIPEWIDTH == 8)?	0 : 
					 (PIPEWIDTH == 16)?	1 : 2;
	assign advance = write;
	assign patternReset = ptrnReset;

endmodule
