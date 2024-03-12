module Md5BruteForcer(
	input wire clk,
	input wire reset,
	input wire hasReceived,
	input wire [31:0] dataIn,
	output reg hasMatched = 0,
	output reg [31:0] dataOut = 0,
	output reg [127:0] text = 0,
	output reg resetGenerator = 0
);

reg matchFound = 0;

wire [31:0] a, b, c, d;
reg [31:0] expectedA = 'hffffffff, expectedB = 0, expectedC = 0, expectedD = 0;
reg [63:0] count;
reg [7:0] min = 'h61, max = 'h7a;
wire [511:0] chunk;

reg [127:0] textBuffer [0:63];

Md5PrintableChunkGenerator g(
	.clk(clk), 
	.reset(resetGenerator),
	.chunk(chunk),
	.min(min),
	.max(max)	
);

/*
Md5ChunkGenerator g(
	.clk(clk), 
	.reset(resetGenerator),
	.chunk(chunk)
);
*/

Md5Core md5 (
	.clk(clk), 
	.wb(chunk), 
	.a0('h67452301), 
	.b0('hefcdab89), 
	.c0('h98badcfe), 
	.d0('h10325476), 
	.a64(a), 
	.b64(b), 
	.c64(c), 
	.d64(d)
);

reg reset2 = 0;

always @(posedge clk or posedge reset2)
	begin
		if (reset2)
			begin
				matchFound <= 0;
				text <= 0;
            count <= 0;
			end
		else
			begin
				if (!matchFound)
					begin
						textBuffer[0] <= chunk[127:0];
						textBuffer[1] <= textBuffer[0];
						textBuffer[2] <= textBuffer[1];
						textBuffer[3] <= textBuffer[2];
						textBuffer[4] <= textBuffer[3];
						textBuffer[5] <= textBuffer[4];
						textBuffer[6] <= textBuffer[5];
						textBuffer[7] <= textBuffer[6];
						textBuffer[8] <= textBuffer[7];
						textBuffer[9] <= textBuffer[8];
						textBuffer[10] <= textBuffer[9];
						textBuffer[11] <= textBuffer[10];
						textBuffer[12] <= textBuffer[11];
						textBuffer[13] <= textBuffer[12];
						textBuffer[14] <= textBuffer[13];
						textBuffer[15] <= textBuffer[14];
						textBuffer[16] <= textBuffer[15];
						textBuffer[17] <= textBuffer[16];
						textBuffer[18] <= textBuffer[17];
						textBuffer[19] <= textBuffer[18];
						textBuffer[20] <= textBuffer[19];
						textBuffer[21] <= textBuffer[20];
						textBuffer[22] <= textBuffer[21];
						textBuffer[23] <= textBuffer[22];
						textBuffer[24] <= textBuffer[23];
						textBuffer[25] <= textBuffer[24];
						textBuffer[26] <= textBuffer[25];
						textBuffer[27] <= textBuffer[26];
						textBuffer[28] <= textBuffer[27];
						textBuffer[29] <= textBuffer[28];
						textBuffer[30] <= textBuffer[29];
						textBuffer[31] <= textBuffer[30];
						textBuffer[32] <= textBuffer[31];
						textBuffer[33] <= textBuffer[32];
						textBuffer[34] <= textBuffer[33];
						textBuffer[35] <= textBuffer[34];
						textBuffer[36] <= textBuffer[35];
						textBuffer[37] <= textBuffer[36];
						textBuffer[38] <= textBuffer[37];
						textBuffer[39] <= textBuffer[38];
						textBuffer[40] <= textBuffer[39];
						textBuffer[41] <= textBuffer[40];
						textBuffer[42] <= textBuffer[41];
						textBuffer[43] <= textBuffer[42];
						textBuffer[44] <= textBuffer[43];
						textBuffer[45] <= textBuffer[44];
						textBuffer[46] <= textBuffer[45];
						textBuffer[47] <= textBuffer[46];
						textBuffer[48] <= textBuffer[47];
						textBuffer[49] <= textBuffer[48];
						textBuffer[50] <= textBuffer[49];
						textBuffer[51] <= textBuffer[50];
						textBuffer[52] <= textBuffer[51];
						textBuffer[53] <= textBuffer[52];
						textBuffer[54] <= textBuffer[53];
						textBuffer[55] <= textBuffer[54];
						textBuffer[56] <= textBuffer[55];
						textBuffer[57] <= textBuffer[56];
						textBuffer[58] <= textBuffer[57];
						textBuffer[59] <= textBuffer[58];
						textBuffer[60] <= textBuffer[59];
						textBuffer[61] <= textBuffer[60];
						textBuffer[62] <= textBuffer[61];
						textBuffer[63] <= textBuffer[62];
						text <= textBuffer[63];
						
						if (a == expectedA &&
							b == expectedB &&
							c == expectedC &&
							d == expectedD)
							begin
								matchFound <= 1;
								hasMatched <= 1;						
							end
                     
                  count <= count + 1;
					end
			end
	end

	
`define Controller_Waiting 			'h1
`define Controller_SetExpectedA		'h2
`define Controller_SetExpectedB		'h3
`define Controller_SetExpectedC		'h4
`define Controller_SetExpectedD		'h5
`define Controller_SetRange			'h6

`define Command_NoOp                'h00000000

`define Command_ResetGenerator 		'h52300000
`define Command_StartGenerator 		'h52300001

`define Command_SetExpectedA		 	'h52301000
`define Command_SetExpectedB		 	'h52301001
`define Command_SetExpectedC		 	'h52301002
`define Command_SetExpectedD		 	'h52301003

`define Command_SetRange				'h52302000

`define Command_GetCountLow         'h52303000
`define Command_GetCountHigh        'h52303001

reg [7:0] controllerState = `Controller_Waiting;

always @(posedge hasReceived)
	begin
		case (controllerState)
			`Controller_Waiting:
				begin
					case (dataIn)
						`Command_ResetGenerator: 
							begin
								resetGenerator <= 1;
								reset2 <= 1;
							end
						`Command_StartGenerator: 
							begin
								resetGenerator <= 0;
								reset2 <= 0;
							end
						`Command_SetExpectedA: controllerState <= `Controller_SetExpectedA;
						`Command_SetExpectedB: controllerState <= `Controller_SetExpectedB;
						`Command_SetExpectedC: controllerState <= `Controller_SetExpectedC;
						`Command_SetExpectedD: controllerState <= `Controller_SetExpectedD;
						`Command_SetRange: controllerState <= `Controller_SetRange;
                  `Command_GetCountLow: dataOut <= count[31:0];
                  `Command_GetCountHigh: dataOut <= count[63:32];
					endcase					
				end
			`Controller_SetExpectedA:
				begin
					expectedA <= dataIn;
					controllerState <= `Controller_Waiting;
				end
			`Controller_SetExpectedB:
				begin
					expectedB <= dataIn;
					controllerState <= `Controller_Waiting;
				end
			`Controller_SetExpectedC:
				begin
					expectedC <= dataIn;
					controllerState <= `Controller_Waiting;
				end
			`Controller_SetExpectedD:
				begin
					expectedD <= dataIn;
					controllerState <= `Controller_Waiting;
				end
				
			`Controller_SetRange:
				begin
					min <= dataIn[7:0];
					max <= dataIn[15:8];
					//min <= 8'h61;
					//max <= 8'h7a;
					controllerState <= `Controller_Waiting;
				end
		endcase	
	end

endmodule
