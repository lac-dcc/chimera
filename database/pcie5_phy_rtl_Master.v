module Master(input wire turnOff, input wire [1:0]syncHeader, input wire [5:0]PIPEWIDTH, input wire [31:0]masterData, input [2:0]GEN,
		output wire patternReset, output wire [1:0]LFSRSel, output wire [3:0]advance, output reg [3:0]descramblingEnable);

		
	localparam SKP = 28, COM = 188, SKPGEN3 = 8'hAA, EIEOS = 8'h00, TS1 = 8'h1E, TS2 = 8'h2D;
	localparam os = 2'b00, osInside = 2'b01, data = 2'b10;
	reg [1:0]state;
	reg ptrnReset, ptrnResetGEN3, EIEOSFlag, dataFlag;
	reg [3:0]write, writeGEN3;
	
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
			
	always@*
		begin
		if(syncHeader == 2'b10)
			begin
			state = os;
			dataFlag = 0;
			end
		else if(syncHeader == 2'b01)
			begin
			state = data;
			dataFlag = 1;
			end
		else
			begin
			dataFlag = dataFlag;
			state = (dataFlag)? data:osInside;
			end
			
		case(state)
			os: 
				begin
				writeGEN3 = 4'hF;
				ptrnResetGEN3 = 0;
				descramblingEnable = 0;
				EIEOSFlag = 0;
				if (masterData[7:0]==TS1 || masterData[15:8]==TS1 || masterData[23:16]==TS1 || masterData[31:24]==TS1)
					descramblingEnable = ~{masterData[31:24]==TS1, masterData[23:16]==TS1, masterData[15:8]==TS1, masterData[7:0]==TS1};
				else if (masterData[7:0]==TS2 || masterData[15:8]==TS2 || masterData[23:16]==TS2 || masterData[31:24]==TS2)
					descramblingEnable = ~{masterData[31:24]==TS2, masterData[23:16]==TS2, masterData[15:8]==TS2, masterData[7:0]==TS2};
				else if(masterData[7:0] == EIEOS || ((masterData[15:8] == EIEOS)&&PIPEWIDTH>=16) || ((masterData[23:16] == EIEOS || masterData[31:24] == EIEOS)&&PIPEWIDTH==32))
					EIEOSFlag = 1;
				else if(masterData[7:0] == SKPGEN3)
					writeGEN3 = ~{masterData[31:24]==SKPGEN3, masterData[23:16]==SKPGEN3, masterData[15:8]==SKPGEN3, masterData[7:0]==SKPGEN3};
				end
			osInside:
				begin
				ptrnResetGEN3 = (EIEOSFlag)? 1:0;
				writeGEN3 = (writeGEN3 == 4'hF)? writeGEN3 : 4'b0;
				descramblingEnable = (descramblingEnable == 0)? 0 : 4'hF;
				end
			data: 
				begin
				EIEOSFlag = 0;
				ptrnResetGEN3 = 0;
				writeGEN3 = 4'hF;
				descramblingEnable = 4'b1111;
				end
		endcase
		end

	assign LFSRSel = (PIPEWIDTH == 8)?	0 : 
					 (PIPEWIDTH == 16)?	1 : 2;
	assign advance = (GEN < 3)? write:writeGEN3;
	assign patternReset = (GEN < 3)? ptrnReset:ptrnResetGEN3;

endmodule
