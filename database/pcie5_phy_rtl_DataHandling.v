module DataHandling #(parameter GEN1_PIPEWIDTH = 8, parameter GEN2_PIPEWIDTH = 16, parameter GEN3_PIPEWIDTH = 32, parameter GEN4_PIPEWIDTH = 8,
					 parameter GEN5_PIPEWIDTH = 8)(input wire [511:0] LMCIn, input wire [2:0]GEN, input wire [4:0]LANESNUMBER, input wire [63:0]descramblerDataK,
													output wire [511:0]stripedData, output wire [63:0]stripedDataK, output wire [5:0]PIPEWIDTH);

	reg [511:0]handledData, shiftedData;
	reg [63:0]handledDataK, shiftedDataK;
	reg [5:0]pipeWidth;

	always@*
		begin
		shiftedData = (LANESNUMBER == 16)? LMCIn:
						(LANESNUMBER == 8)? LMCIn >> 256:
						(LANESNUMBER == 4)? LMCIn >> 384:
						(LANESNUMBER == 2)? LMCIn >> 448: 
						(LANESNUMBER == 1)? LMCIn >> 480: LMCIn >> 512 ;
	
		shiftedDataK = (LANESNUMBER == 16)? descramblerDataK:
						(LANESNUMBER == 8)? descramblerDataK >> 32:
						(LANESNUMBER == 4)? descramblerDataK >> 48:
						(LANESNUMBER == 2)? descramblerDataK >> 56: 
						(LANESNUMBER == 1)? descramblerDataK >> 60: descramblerDataK >> 64 ;
		if(GEN == 1)
			begin
			handledData = {shiftedData[(480+GEN1_PIPEWIDTH)-1:480], shiftedData[(448+GEN1_PIPEWIDTH)-1:448], shiftedData[(416+GEN1_PIPEWIDTH)-1:416], 
							shiftedData[(384+GEN1_PIPEWIDTH)-1:384], shiftedData[(352+GEN1_PIPEWIDTH)-1:352], shiftedData[(320+GEN1_PIPEWIDTH)-1:320], 
							shiftedData[(288+GEN1_PIPEWIDTH)-1:288], shiftedData[(256+GEN1_PIPEWIDTH)-1:256], shiftedData[(224+GEN1_PIPEWIDTH)-1:224], 
							shiftedData[(192+GEN1_PIPEWIDTH)-1:192], shiftedData[(160+GEN1_PIPEWIDTH)-1:160], shiftedData[(128+GEN1_PIPEWIDTH)-1:128], 
							shiftedData[(96+GEN1_PIPEWIDTH)-1:96], shiftedData[(64+GEN1_PIPEWIDTH)-1:64], 
							shiftedData[(32+GEN1_PIPEWIDTH)-1:32], shiftedData[GEN1_PIPEWIDTH-1:0]};
			
			handledDataK = {shiftedDataK[(60+(GEN1_PIPEWIDTH/8))-1:60], shiftedDataK[(56+(GEN1_PIPEWIDTH/8))-1:56], 
							shiftedDataK[(52+(GEN1_PIPEWIDTH/8))-1:52], shiftedDataK[(48+(GEN1_PIPEWIDTH/8))-1:48], shiftedDataK[(44+(GEN1_PIPEWIDTH/8))-1:44], 
							shiftedDataK[(40+(GEN1_PIPEWIDTH/8))-1:40], shiftedDataK[(36+(GEN1_PIPEWIDTH/8))-1:36], shiftedDataK[(32+(GEN1_PIPEWIDTH/8))-1:32], 
							shiftedDataK[(28+(GEN1_PIPEWIDTH/8))-1:28], shiftedDataK[(24+(GEN1_PIPEWIDTH/8))-1:24], shiftedDataK[(20+(GEN1_PIPEWIDTH/8))-1:20], 
							shiftedDataK[(16+(GEN1_PIPEWIDTH/8))-1:16], shiftedDataK[(12+(GEN1_PIPEWIDTH/8))-1:12], shiftedDataK[(8+(GEN1_PIPEWIDTH/8))-1:8],
							shiftedDataK[(4+(GEN1_PIPEWIDTH/8))-1:4], shiftedDataK[(GEN1_PIPEWIDTH/8)-1:0]};
			pipeWidth = GEN1_PIPEWIDTH;
			end
		else if(GEN == 2)
			begin
			handledData = {shiftedData[(480+GEN2_PIPEWIDTH)-1:480], shiftedData[(448+GEN2_PIPEWIDTH)-1:448], shiftedData[(416+GEN2_PIPEWIDTH)-1:416], 
							shiftedData[(384+GEN2_PIPEWIDTH)-1:384], shiftedData[(352+GEN2_PIPEWIDTH)-1:352], shiftedData[(320+GEN2_PIPEWIDTH)-1:320], 
							shiftedData[(288+GEN2_PIPEWIDTH)-1:288], shiftedData[(256+GEN2_PIPEWIDTH)-1:256], shiftedData[(224+GEN2_PIPEWIDTH)-1:224], 
							shiftedData[(192+GEN2_PIPEWIDTH)-1:192], shiftedData[(160+GEN2_PIPEWIDTH)-1:160], shiftedData[(128+GEN2_PIPEWIDTH)-1:128], 
							shiftedData[(96+GEN2_PIPEWIDTH)-1:96], shiftedData[(64+GEN2_PIPEWIDTH)-1:64], 
							shiftedData[(32+GEN2_PIPEWIDTH)-1:32], shiftedData[GEN2_PIPEWIDTH-1:0]};

			handledDataK = {shiftedDataK[(60+(GEN2_PIPEWIDTH/8))-1:60], shiftedDataK[(56+(GEN2_PIPEWIDTH/8))-1:56], 
							shiftedDataK[(52+(GEN2_PIPEWIDTH/8))-1:52], shiftedDataK[(48+(GEN2_PIPEWIDTH/8))-1:48], shiftedDataK[(44+(GEN2_PIPEWIDTH/8))-1:44], 
							shiftedDataK[(40+(GEN2_PIPEWIDTH/8))-1:40], shiftedDataK[(36+(GEN2_PIPEWIDTH/8))-1:36], shiftedDataK[(32+(GEN2_PIPEWIDTH/8))-1:32], 
							shiftedDataK[(28+(GEN2_PIPEWIDTH/8))-1:28], shiftedDataK[(24+(GEN2_PIPEWIDTH/8))-1:24], shiftedDataK[(20+(GEN2_PIPEWIDTH/8))-1:20], 
							shiftedDataK[(16+(GEN2_PIPEWIDTH/8))-1:16], shiftedDataK[(12+(GEN2_PIPEWIDTH/8))-1:12], shiftedDataK[(8+(GEN2_PIPEWIDTH/8))-1:8],
							shiftedDataK[(4+(GEN2_PIPEWIDTH/8))-1:4], shiftedDataK[(GEN2_PIPEWIDTH/8)-1:0]};
			pipeWidth = GEN2_PIPEWIDTH;
			end
		else if(GEN == 3)
			begin
			handledData = {shiftedData[(480+GEN3_PIPEWIDTH)-1:480], shiftedData[(448+GEN3_PIPEWIDTH)-1:448], shiftedData[(416+GEN3_PIPEWIDTH)-1:416], 
							shiftedData[(384+GEN3_PIPEWIDTH)-1:384], shiftedData[(352+GEN3_PIPEWIDTH)-1:352], shiftedData[(320+GEN3_PIPEWIDTH)-1:320], 
							shiftedData[(288+GEN3_PIPEWIDTH)-1:288], shiftedData[(256+GEN3_PIPEWIDTH)-1:256], shiftedData[(224+GEN3_PIPEWIDTH)-1:224], 
							shiftedData[(192+GEN3_PIPEWIDTH)-1:192], shiftedData[(160+GEN3_PIPEWIDTH)-1:160], shiftedData[(128+GEN3_PIPEWIDTH)-1:128], 
							shiftedData[(96+GEN3_PIPEWIDTH)-1:96], shiftedData[(64+GEN3_PIPEWIDTH)-1:64], 
							shiftedData[(32+GEN3_PIPEWIDTH)-1:32], shiftedData[GEN3_PIPEWIDTH-1:0]};

			handledDataK = {shiftedDataK[(60+(GEN3_PIPEWIDTH/8))-1:60], shiftedDataK[(56+(GEN3_PIPEWIDTH/8))-1:56], 
							shiftedDataK[(52+(GEN3_PIPEWIDTH/8))-1:52], shiftedDataK[(48+(GEN3_PIPEWIDTH/8))-1:48], shiftedDataK[(44+(GEN3_PIPEWIDTH/8))-1:44], 
							shiftedDataK[(40+(GEN3_PIPEWIDTH/8))-1:40], shiftedDataK[(36+(GEN3_PIPEWIDTH/8))-1:36], shiftedDataK[(32+(GEN3_PIPEWIDTH/8))-1:32], 
							shiftedDataK[(28+(GEN3_PIPEWIDTH/8))-1:28], shiftedDataK[(24+(GEN3_PIPEWIDTH/8))-1:24], shiftedDataK[(20+(GEN3_PIPEWIDTH/8))-1:20], 
							shiftedDataK[(16+(GEN3_PIPEWIDTH/8))-1:16], shiftedDataK[(12+(GEN3_PIPEWIDTH/8))-1:12], shiftedDataK[(8+(GEN3_PIPEWIDTH/8))-1:8],
							shiftedDataK[(4+(GEN3_PIPEWIDTH/8))-1:4], shiftedDataK[(GEN3_PIPEWIDTH/8)-1:0]};
			pipeWidth = GEN3_PIPEWIDTH;
			end
		else if(GEN == 4)
			begin
			handledData = {shiftedData[(480+GEN4_PIPEWIDTH)-1:480], shiftedData[(448+GEN4_PIPEWIDTH)-1:448], shiftedData[(416+GEN4_PIPEWIDTH)-1:416], 
							shiftedData[(384+GEN4_PIPEWIDTH)-1:384], shiftedData[(352+GEN4_PIPEWIDTH)-1:352], shiftedData[(320+GEN4_PIPEWIDTH)-1:320], 
							shiftedData[(288+GEN4_PIPEWIDTH)-1:288], shiftedData[(256+GEN4_PIPEWIDTH)-1:256], shiftedData[(224+GEN4_PIPEWIDTH)-1:224], 
							shiftedData[(192+GEN4_PIPEWIDTH)-1:192], shiftedData[(160+GEN4_PIPEWIDTH)-1:160], shiftedData[(128+GEN4_PIPEWIDTH)-1:128], 
							shiftedData[(96+GEN4_PIPEWIDTH)-1:96], shiftedData[(64+GEN4_PIPEWIDTH)-1:64], 
							shiftedData[(32+GEN4_PIPEWIDTH)-1:32], shiftedData[GEN4_PIPEWIDTH-1:0]};

			handledDataK = {shiftedDataK[(60+(GEN4_PIPEWIDTH/8))-1:60], shiftedDataK[(56+(GEN4_PIPEWIDTH/8))-1:56], 
							shiftedDataK[(52+(GEN4_PIPEWIDTH/8))-1:52], shiftedDataK[(48+(GEN4_PIPEWIDTH/8))-1:48], shiftedDataK[(44+(GEN4_PIPEWIDTH/8))-1:44], 
							shiftedDataK[(40+(GEN4_PIPEWIDTH/8))-1:40], shiftedDataK[(36+(GEN4_PIPEWIDTH/8))-1:36], shiftedDataK[(32+(GEN4_PIPEWIDTH/8))-1:32], 
							shiftedDataK[(28+(GEN4_PIPEWIDTH/8))-1:28], shiftedDataK[(24+(GEN4_PIPEWIDTH/8))-1:24], shiftedDataK[(20+(GEN4_PIPEWIDTH/8))-1:20], 
							shiftedDataK[(16+(GEN4_PIPEWIDTH/8))-1:16], shiftedDataK[(12+(GEN4_PIPEWIDTH/8))-1:12], shiftedDataK[(8+(GEN4_PIPEWIDTH/8))-1:8],
							shiftedDataK[(4+(GEN4_PIPEWIDTH/8))-1:4], shiftedDataK[(GEN4_PIPEWIDTH/8)-1:0]};
			pipeWidth = GEN4_PIPEWIDTH;
			end
		else if(GEN == 5)
			begin
			handledData = {shiftedData[(480+GEN5_PIPEWIDTH)-1:480], shiftedData[(448+GEN5_PIPEWIDTH)-1:448], shiftedData[(416+GEN5_PIPEWIDTH)-1:416], 
							shiftedData[(384+GEN5_PIPEWIDTH)-1:384], shiftedData[(352+GEN5_PIPEWIDTH)-1:352], shiftedData[(320+GEN5_PIPEWIDTH)-1:320], 
							shiftedData[(288+GEN5_PIPEWIDTH)-1:288], shiftedData[(256+GEN5_PIPEWIDTH)-1:256], shiftedData[(224+GEN5_PIPEWIDTH)-1:224], 
							shiftedData[(192+GEN5_PIPEWIDTH)-1:192], shiftedData[(160+GEN5_PIPEWIDTH)-1:160], shiftedData[(128+GEN5_PIPEWIDTH)-1:128], 
							shiftedData[(96+GEN5_PIPEWIDTH)-1:96], shiftedData[(64+GEN5_PIPEWIDTH)-1:64], 
							shiftedData[(32+GEN5_PIPEWIDTH)-1:32], shiftedData[GEN5_PIPEWIDTH-1:0]};

			handledDataK = {shiftedDataK[(60+(GEN5_PIPEWIDTH/8))-1:60], shiftedDataK[(56+(GEN5_PIPEWIDTH/8))-1:56], 
							shiftedDataK[(52+(GEN5_PIPEWIDTH/8))-1:52], shiftedDataK[(48+(GEN5_PIPEWIDTH/8))-1:48], shiftedDataK[(44+(GEN5_PIPEWIDTH/8))-1:44], 
							shiftedDataK[(40+(GEN5_PIPEWIDTH/8))-1:40], shiftedDataK[(36+(GEN5_PIPEWIDTH/8))-1:36], shiftedDataK[(32+(GEN5_PIPEWIDTH/8))-1:32], 
							shiftedDataK[(28+(GEN5_PIPEWIDTH/8))-1:28], shiftedDataK[(24+(GEN5_PIPEWIDTH/8))-1:24], shiftedDataK[(20+(GEN5_PIPEWIDTH/8))-1:20], 
							shiftedDataK[(16+(GEN5_PIPEWIDTH/8))-1:16], shiftedDataK[(12+(GEN5_PIPEWIDTH/8))-1:12], shiftedDataK[(8+(GEN5_PIPEWIDTH/8))-1:8],
							shiftedDataK[(4+(GEN5_PIPEWIDTH/8))-1:4], shiftedDataK[(GEN5_PIPEWIDTH/8)-1:0]};
			pipeWidth = GEN5_PIPEWIDTH;
			end
		else 
			begin
			handledData = 0;
			handledDataK = 0;
			pipeWidth = 0;
			end
		end

	assign stripedData = handledData;
	assign stripedDataK = handledDataK;
	assign PIPEWIDTH = pipeWidth;

endmodule