module UnStriping(input wire clk, input wire reset, input wire [5:0]PIPEWIDTH,  input wire [4:0]LANESNUMBER, input wire [63:0]strippedDataK,
					input wire [511:0]strippedData, output wire[511:0]unstripedData, output wire [63:0]unstripedDataK);

	reg [511:0]data, data_next;
	reg [63:0]dataK, dataK_next;
	
	always@(posedge clk or negedge reset)
		if(!reset)
			begin
			data <= 0;
			dataK <= 0;
			end
		else 
			begin
			data <= data_next;
			dataK <= dataK_next;
			end

	always@*
	begin	
	if(PIPEWIDTH == 8)
		case(LANESNUMBER)
		1: 
			begin
			data_next =strippedData;

			dataK_next = strippedDataK;
			end
		2: 
			begin
			data_next = {strippedData[7:0], strippedData[15:8]};
	
			dataK_next = {strippedDataK[0], strippedDataK[1]};
			end
		4: 
			begin
			data_next = {strippedData[7:0], strippedData[15:8], strippedData[23:16], strippedData[31:24]};
	
			dataK_next = {strippedDataK[0:0], strippedDataK[2:2], strippedDataK[4:4], strippedDataK[6:6],
	 						strippedDataK[1:1], strippedDataK[3:3], strippedDataK[5:5], strippedDataK[7:7]};
			end
		8: 
			begin
			data_next = {strippedData[7:0], strippedData[15:8],strippedData[23:16], strippedData[31:24], 
							strippedData[39:32], strippedData[47:40], strippedData[55:48], strippedData[63:56]};
		
			dataK_next = {strippedDataK[0], strippedDataK[1], strippedDataK[2], strippedDataK[3],
							strippedDataK[4], strippedDataK[5], strippedDataK[6], strippedDataK[7]};
			end
		16: 
			begin
			data_next = {strippedData[7:0], strippedData[15:8],strippedData[23:16], strippedData[31:24], 
							strippedData[39:32], strippedData[47:40], strippedData[55:48], strippedData[63:56],
							strippedData[71:64], strippedData[79:72],strippedData[87:80], strippedData[95:88], 
							strippedData[103:96], strippedData[111:104], strippedData[119:112], strippedData[127:120]};
	
			dataK_next = {strippedDataK[0], strippedDataK[1], strippedDataK[2], strippedDataK[3],
							strippedDataK[4], strippedDataK[5], strippedDataK[6], strippedDataK[7],
							strippedDataK[8], strippedDataK[9], strippedDataK[10], strippedDataK[11],
							strippedDataK[12], strippedDataK[13], strippedDataK[14], strippedDataK[15]};
			end
		default: begin data_next = 0; dataK_next = 0; end
		endcase
	else if(PIPEWIDTH == 16)
		case(LANESNUMBER)
		1: 
			begin
			data_next = {strippedData[7:0], strippedData[15:8]};

			dataK_next = {strippedDataK[0:0], strippedDataK[1:1]};
			end
		2: 
			begin
			data_next = {strippedData[7:0], strippedData[23:16], strippedData[15:8], strippedData[31:24]};
	
			dataK_next = {strippedDataK[0:0], strippedDataK[2:2], strippedDataK[1:1], strippedDataK[3:3]};
			end
		4: 
			begin
			data_next = {strippedData[7:0], strippedData[23:16], strippedData[39:32], strippedData[55:48], 
							strippedData[15:8], strippedData[31:24], strippedData[47:40], strippedData[63:56]};
	
			dataK_next = {strippedDataK[0:0], strippedDataK[2:2], strippedDataK[4:4], strippedDataK[6:6],
	 						strippedDataK[1:1], strippedDataK[3:3], strippedDataK[5:5], strippedDataK[7:7]};
			end
		8: 
			begin
			data_next = {strippedData[7:0], strippedData[23:16], strippedData[39:32], strippedData[55:48], 
							strippedData[71:64], strippedData[87:80], strippedData[103:96], strippedData[119:112], 
							strippedData[15:8], strippedData[31:24], strippedData[47:40], strippedData[63:56], 
							strippedData[79:72], strippedData[95:88], strippedData[111:104], strippedData[127:120]};
		
			dataK_next = {strippedDataK[0:0], strippedDataK[2:2], strippedDataK[4:4], strippedDataK[6:6],
							strippedDataK[8:8], strippedDataK[10:10], strippedDataK[12:12], strippedDataK[14:14], 
							strippedDataK[1:1], strippedDataK[3:3], strippedDataK[5:5], strippedDataK[7:7],
							strippedDataK[9:9], strippedDataK[11:11], strippedDataK[13:13], strippedDataK[15:15]};
			end
		16: 
			begin
			data_next = {strippedData[7:0], strippedData[23:16], strippedData[39:32], strippedData[55:48], 
							strippedData[71:64], strippedData[87:80], strippedData[103:96], strippedData[119:112], 
							strippedData[135:128], strippedData[151:144], strippedData[167:160], strippedData[183:176], 
							strippedData[199:192], strippedData[215:208], strippedData[231:224], strippedData[247:240], 
							strippedData[15:8], strippedData[31:24], strippedData[47:40], strippedData[63:56], 
							strippedData[79:72], strippedData[95:88], strippedData[111:104], strippedData[127:120], 
							strippedData[143:136], strippedData[159:152], strippedData[175:168], strippedData[191:184], 
							strippedData[207:200], strippedData[223:216], strippedData[239:232], strippedData[255:248]};
	
			dataK_next = {strippedDataK[0:0], strippedDataK[2:2], strippedDataK[4:4], strippedDataK[6:6], 
							strippedDataK[8:8], strippedDataK[10:10], strippedDataK[12:12], strippedDataK[14:14], 
							strippedDataK[16:16], strippedDataK[18:18], strippedDataK[20:20], strippedDataK[22:22], 
							strippedDataK[24:24], strippedDataK[26:26], strippedDataK[28:28], strippedDataK[30:30], 
							strippedDataK[1:1], strippedDataK[3:3], strippedDataK[5:5], strippedDataK[7:7], 
							strippedDataK[9:9], strippedDataK[11:11], strippedDataK[13:13], strippedDataK[15:15], 
							strippedDataK[17:17], strippedDataK[19:19], strippedDataK[21:21], strippedDataK[23:23], 
							strippedDataK[25:25], strippedDataK[27:27], strippedDataK[29:29], strippedDataK[31:31]};
			end
		default: begin data_next = 0; dataK_next = 0; end
		endcase
	else if(PIPEWIDTH == 32)
		case(LANESNUMBER)
		1: 
			begin
			data_next = {strippedData[7:0], strippedData[15:8], strippedData[23:16], strippedData[31:24]};

			dataK_next = {strippedDataK[0], strippedDataK[1], strippedDataK[2], strippedDataK[3]};
			end
		2: 
			begin
			data_next = {strippedData[7:0], strippedData[39:32], strippedData[15:8], strippedData[47:40], 
							strippedData[23:16], strippedData[55:48], strippedData[31:24], strippedData[63:56]};
	
			dataK_next = {strippedDataK[0:0], strippedDataK[4:4], strippedDataK[1:1], strippedDataK[5:5],
					 		strippedDataK[2:2], strippedDataK[6:6], strippedDataK[3:3], strippedDataK[7:7]};
			end

		4:
			begin
			data_next = {strippedData[7:0], strippedData[39:32], strippedData[71:64], strippedData[103:96], 
							strippedData[15:8], strippedData[47:40], strippedData[79:72], strippedData[111:104], 
							strippedData[23:16], strippedData[55:48], strippedData[87:80], strippedData[119:112], 
							strippedData[31:24], strippedData[63:56], strippedData[95:88], strippedData[127:120]};
		
			dataK_next = {strippedDataK[0:0], strippedDataK[4:4], strippedDataK[8:8], strippedDataK[12:12], 
							strippedDataK[1:1], strippedDataK[5:5], strippedDataK[9:9], strippedDataK[13:13], 
							strippedDataK[2:2], strippedDataK[6:6], strippedDataK[10:10], strippedDataK[14:14], 
							strippedDataK[3:3], strippedDataK[7:7], strippedDataK[11:11], strippedDataK[15:15]};
			end

		8: 
			begin
			data_next = {strippedData[7:0], strippedData[39:32], strippedData[71:64], strippedData[103:96], 
							strippedData[135:128], strippedData[167:160], strippedData[199:192], strippedData[231:224], 
							strippedData[15:8], strippedData[47:40], strippedData[79:72], strippedData[111:104], 
							strippedData[143:136], strippedData[175:168], strippedData[207:200], strippedData[239:232], 
							strippedData[23:16], strippedData[55:48], strippedData[87:80], strippedData[119:112], 
							strippedData[151:144], strippedData[183:176], strippedData[215:208], strippedData[247:240], 
							strippedData[31:24], strippedData[63:56], strippedData[95:88], strippedData[127:120], 
							strippedData[159:152], strippedData[191:184], strippedData[223:216], strippedData[255:248]};
			
			dataK_next = {strippedDataK[0:0], strippedDataK[4:4], strippedDataK[8:8], strippedDataK[12:12], 
							strippedDataK[16:16], strippedDataK[20:20], strippedDataK[24:24], strippedDataK[28:28], 
							strippedDataK[1:1], strippedDataK[5:5], strippedDataK[9:9], strippedDataK[13:13], 
							strippedDataK[17:17], strippedDataK[21:21], strippedDataK[25:25], strippedDataK[29:29], 
							strippedDataK[2:2], strippedDataK[6:6], strippedDataK[10:10], strippedDataK[14:14], 
							strippedDataK[18:18], strippedDataK[22:22], strippedDataK[26:26], strippedDataK[30:30], 
							strippedDataK[3:3], strippedDataK[7:7], strippedDataK[11:11], strippedDataK[15:15], 
							strippedDataK[19:19], strippedDataK[23:23], strippedDataK[27:27], strippedDataK[31:31]};
			end
		
		16: 
			begin
			data_next = {strippedData[7:0], strippedData[39:32], strippedData[71:64], strippedData[103:96], 
						strippedData[135:128], strippedData[167:160], strippedData[199:192], strippedData[231:224],
					 	strippedData[263:256], strippedData[295:288], strippedData[327:320], strippedData[359:352],
				 		strippedData[391:384], strippedData[423:416], strippedData[455:448], strippedData[487:480], 

						strippedData[15:8], strippedData[47:40], strippedData[79:72], strippedData[111:104], 
						strippedData[143:136], strippedData[175:168], strippedData[207:200], strippedData[239:232], 
						strippedData[271:264], strippedData[303:296], strippedData[335:328], strippedData[367:360], 
						strippedData[399:392], strippedData[431:424], strippedData[463:456], strippedData[495:488],
 
						strippedData[23:16], strippedData[55:48], strippedData[87:80], strippedData[119:112], 
						strippedData[151:144], strippedData[183:176], strippedData[215:208], strippedData[247:240], 
						strippedData[279:272], strippedData[311:304], strippedData[343:336], strippedData[375:368], 
						strippedData[407:400], strippedData[439:432], strippedData[471:464], strippedData[503:496],
	 
						strippedData[31:24], strippedData[63:56], strippedData[95:88], strippedData[127:120], 
						strippedData[159:152], strippedData[191:184], strippedData[223:216], strippedData[255:248], 
						strippedData[287:280], strippedData[319:312], strippedData[351:344], strippedData[383:376], 
						strippedData[415:408], strippedData[447:440], strippedData[479:472], strippedData[511:504]};

			dataK_next = {strippedDataK[0:0], strippedDataK[4:4], strippedDataK[8:8], strippedDataK[12:12], 
						strippedDataK[16:16], strippedDataK[20:20], strippedDataK[24:24], strippedDataK[28:28], 
						strippedDataK[32:32], strippedDataK[36:36], strippedDataK[40:40], strippedDataK[44:44], 
						strippedDataK[48:48], strippedDataK[52:52], strippedDataK[56:56], strippedDataK[60:60], 

						strippedDataK[1:1], strippedDataK[5:5], strippedDataK[9:9], strippedDataK[13:13], 
						strippedDataK[17:17], strippedDataK[21:21], strippedDataK[25:25], strippedDataK[29:29], 
						strippedDataK[33:33], strippedDataK[37:37], strippedDataK[41:41], strippedDataK[45:45], 
						strippedDataK[49:49], strippedDataK[53:53], strippedDataK[57:57], strippedDataK[61:61], 

						strippedDataK[2:2], strippedDataK[6:6], strippedDataK[10:10], strippedDataK[14:14], 
						strippedDataK[18:18], strippedDataK[22:22], strippedDataK[26:26], strippedDataK[30:30], 
						strippedDataK[34:34], strippedDataK[38:38], strippedDataK[42:42], strippedDataK[46:46], 
						strippedDataK[50:50], strippedDataK[54:54], strippedDataK[58:58], strippedDataK[62:62], 

						strippedDataK[3:3], strippedDataK[7:7], strippedDataK[11:11], strippedDataK[15:15], 
						strippedDataK[19:19], strippedDataK[23:23], strippedDataK[27:27], strippedDataK[31:31], 
						strippedDataK[35:35], strippedDataK[39:39], strippedDataK[43:43], strippedDataK[47:47], 
						strippedDataK[51:51], strippedDataK[55:55], strippedDataK[59:59], strippedDataK[63:63]};
					end
		default: begin data_next = 0; dataK_next = 0; end
		endcase
		else 
			begin
			data_next = 0;
			dataK_next = 0;
			end
	end

	assign unstripedData = data;
	assign unstripedDataK = dataK;

endmodule


