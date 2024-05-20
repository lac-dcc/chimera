// This program was cloned from: https://github.com/HurleyResearch/nRFICE
// License: GNU General Public License v3.0


module spi (
	clock,
	reset,
	clk,

	csn,
	mosi,
	ramReadData,

	debug4,
	miso,
	ramAddr,
	ramCLK,
	ramCLKEn,
	ramWriteData,
	ramWriteEn,
	stateDebug,
	pwmRegs
);


input  clk;
input  clock;
input  csn;
input  mosi;
input [15:0] ramReadData;
input  reset;

output [3:0] debug4;
output  miso;
output [7:0] ramAddr;
output  ramCLK;
output  ramCLKEn;
output [15:0] ramWriteData;
output  ramWriteEn;
output [19:0] stateDebug;
output [47:0] pwmRegs;


// ------------------------------
//        Define States          
// ------------------------------

parameter [4:0] CLKHIGH = 5'b0001;
parameter [4:0] CLKHIGHREAD = 5'b1010;
parameter [4:0] CLKHIGHREADLOOP = 5'b1110;
parameter [4:0] CLKLOW = 5'b0010;
parameter [4:0] CLKLOWREAD = 5'b1100;
parameter [4:0] CSNHIGH = 5'b0000;
parameter [4:0] CSNLOW = 5'b1000;
parameter [4:0] COMMAND = 5'b0110;
parameter [4:0] LASTBIT = 5'b0101;
parameter [4:0] LASTBITCLKHIGH = 5'b10010;
parameter [4:0] LASTBITCLKLOW = 5'b10011;
parameter [4:0] LATCHBIT = 5'b0100;
parameter [4:0] LATCHREADWORD = 5'b1011;
parameter [4:0] READLOWERCLK = 5'b10000;
parameter [4:0] READRAISECLK = 5'b1111;
parameter [4:0] READRAISECLK2 = 5'b10001;
parameter [4:0] SHIFT = 5'b0011;
parameter [4:0] SHIFTREAD = 5'b1101;
parameter [4:0] WRITEPWMREG0 = 5'b10100;
parameter [4:0] WRITEPWMREG1 = 5'b10101;
parameter [4:0] WRITEPWMREG2 = 5'b10110;
parameter [4:0] WRITERAM = 5'b0111;
parameter [4:0] WRITERAMSTORE = 5'b1001;

parameter  newParameter = 1'b0;



// ------------------------------
//        Definitions          
// ------------------------------


wire  clk;
wire  clock;
wire  csn;
wire [3:0] debug4;
wire  miso;
wire  mosi;
wire [7:0] ramAddr;
wire  ramCLK;
wire  ramCLKEn;
wire [15:0] ramReadData;
wire [15:0] ramWriteData;
wire  ramWriteEn;
wire  reset;
wire [19:0] stateDebug;

reg [7:0] bitCount;
reg  clkBuf;
reg  csnBuf;
reg  mosiBuf;
reg [47:0] pwmRegs;
reg [7:0] ramAddrReg;
reg  ramCLKEnReg;
reg  ramCLKReg;
reg  ramWriteEnReg;
reg  readMode;
reg [15:0] readWord;
reg [31:0] spiInWord;

reg [22:0] state;
reg [22:0] next;
// ------------------------------
//       Common Code, not used         
// ------------------------------


// ------------------------------
//       Code Block         
// ------------------------------
assign ramCLK = ramCLKReg;
assign ramWriteEn = ramWriteEnReg;
assign ramAddr[7:0] = readMode == 1'b0 ? spiInWord[23:16] : spiInWord[8:1];
assign ramWriteData[15:0] = spiInWord[15:0];
assign miso = readWord[15];
assign stateDebug[19:0] = state[19:0];
assign debug4[3:0] = spiInWord[3:0];
assign ramCLKEn = ramCLKEnReg;


// ------------------------------
//       Input Buffering         
// ------------------------------



always @ (posedge clock or posedge reset) begin 
	if (reset) begin
		clkBuf <= 1'b0;
		csnBuf <= 1'b1;
		mosiBuf <= 1'b0;
	end
	else begin
		clkBuf <= clk;
		csnBuf <= csn;
		mosiBuf <= mosi;
	end
end


// ------------------------------
//   State Switching Block       
// ------------------------------


always @ (posedge clock or posedge reset) begin
	if (reset)	begin
            state <= 23'b0;
            state[CSNHIGH] <= 1'b1;
	end
	else state <= next;
end



// ------------------------------
//          Input Block         
// ------------------------------


always @ ( state , bitCount , clkBuf , csnBuf , readMode , spiInWord) begin
	next = 23'b0;
	case (1'b1)
		state[CLKHIGH]  :  begin
			if( readMode == 1'b1 )
				next[CLKHIGHREAD] = 1'b1;
			else if( clkBuf == 1'b0 && readMode == 1'b0 )
				next[CLKLOW] = 1'b1;
			else if( csnBuf == 1'b1 )
				next[CSNHIGH] = 1'b1;
			else 
				next[CLKHIGH] = 1'b1;
		end
		state[CLKHIGHREAD]  :  begin
			next[READRAISECLK] = 1'b1;
		end
		state[CLKHIGHREADLOOP]  :  begin
			if( clkBuf == 1'b0 )
				next[SHIFTREAD] = 1'b1;
			else 
				next[CLKHIGHREADLOOP] = 1'b1;
		end
		state[CLKLOW]  :  begin
			if( csnBuf == 1'b1 )
				next[CSNHIGH] = 1'b1;
			else if( clkBuf == 1'b1 )
				next[SHIFT] = 1'b1;
			else 
				next[CLKLOW] = 1'b1;
		end
		state[CLKLOWREAD]  :  begin
			if( clkBuf == 1'b1 )
				next[CLKHIGHREADLOOP] = 1'b1;
			else if( csnBuf == 1'b1 )
				next[CSNHIGH] = 1'b1;
			else if( bitCount[7:0] == 8'h10 )
				next[CSNLOW] = 1'b1;
			else 
				next[CLKLOWREAD] = 1'b1;
		end
		state[CSNHIGH]  :  begin
			if( csnBuf == 1'b0 )
				next[CLKHIGH] = 1'b1;
			else 
				next[CSNHIGH] = 1'b1;
		end
		state[CSNLOW]  :  begin
			if( csnBuf == 1'b1 )
				next[CSNHIGH] = 1'b1;
			else 
				next[CSNLOW] = 1'b1;
		end
		state[COMMAND]  :  begin
			if( csnBuf == 1'b1 && spiInWord[31:24] != 8'h10 )
				next[CSNHIGH] = 1'b1;
			else if( spiInWord[31:24] != 8'h10 && spiInWord[31:24] != 8'h11 && spiInWord[31:24] != 8'h12 && spiInWord[31:24] != 8'h13 && spiInWord[31:24] != 8'h14 && clkBuf == 1'b1 )
				next[CSNLOW] = 1'b1;
			else if( spiInWord[31:24] == 8'h12 )
				next[WRITEPWMREG0] = 1'b1;
			else if( spiInWord[31:24] == 8'h13 )
				next[WRITEPWMREG1] = 1'b1;
			else if( spiInWord[31:24] == 8'h14 )
				next[WRITEPWMREG2] = 1'b1;
			else if( spiInWord[31:24] == 8'h10 )
				next[WRITERAM] = 1'b1;
			else 
				next[COMMAND] = 1'b1;
		end
		state[LASTBIT]  :  begin
			if( clkBuf == 1'b0 )
				next[COMMAND] = 1'b1;
			else 
				next[LASTBIT] = 1'b1;
		end
		state[LASTBITCLKHIGH]  :  begin
			if( clkBuf == 1'b0 )
				next[LASTBITCLKLOW] = 1'b1;
			else 
				next[LASTBITCLKHIGH] = 1'b1;
		end
		state[LASTBITCLKLOW]  :  begin
			if( clkBuf == 1'b1 )
				next[LASTBIT] = 1'b1;
			else 
				next[LASTBITCLKLOW] = 1'b1;
		end
		state[LATCHBIT]  :  begin
			if( bitCount == 8'h1F )
				next[LASTBITCLKHIGH] = 1'b1;
			else 
				next[CLKHIGH] = 1'b1;
		end
		state[LATCHREADWORD]  :  begin
			if( clkBuf == 1'b0 )
				next[CLKLOWREAD] = 1'b1;
			else 
				next[LATCHREADWORD] = 1'b1;
		end
		state[READLOWERCLK]  :  begin
			next[READRAISECLK2] = 1'b1;
		end
		state[READRAISECLK]  :  begin
			next[READLOWERCLK] = 1'b1;
		end
		state[READRAISECLK2]  :  begin
			next[LATCHREADWORD] = 1'b1;
		end
		state[SHIFT]  :  begin
			next[LATCHBIT] = 1'b1;
		end
		state[SHIFTREAD]  :  begin
			next[CLKLOWREAD] = 1'b1;
		end
		state[WRITEPWMREG0]  :  begin
			next[CSNLOW] = 1'b1;
		end
		state[WRITEPWMREG1]  :  begin
			next[CSNLOW] = 1'b1;
		end
		state[WRITEPWMREG2]  :  begin
			next[CSNLOW] = 1'b1;
		end
		state[WRITERAM]  :  begin
			next[WRITERAMSTORE] = 1'b1;
		end
		state[WRITERAMSTORE]  :  begin
			next[CSNLOW] = 1'b1;
		end
	endcase
end      // end of input block


// ------------------------------
//         Output Block          
// ------------------------------



always @ (posedge clock or posedge reset) begin 
	if (reset) begin
		bitCount <= 8'b11111111;
		pwmRegs <= 48'b0;
		ramAddrReg <= 8'b0;
		ramCLKEnReg <= 1'b0;
		ramCLKReg <= 1'b0;
		ramWriteEnReg <= 1'b0;
		readMode <= 1'b0;
		readWord <= 16'hf00f;
		spiInWord <= 32'b0;
	end
	else begin
		bitCount <= bitCount[7:0];
		pwmRegs <= pwmRegs;
		ramAddrReg <= ramAddrReg;
		ramCLKEnReg <= ramCLKEnReg;
		ramCLKReg <= ramCLKReg;
		ramWriteEnReg <= ramWriteEnReg;
		readMode <= readMode;
		readWord <= readWord;
		spiInWord <= spiInWord[31:0];
		case (1'b1)
			state[CLKHIGH]  :  begin
				ramAddrReg <= spiInWord[8:1];
			end
			state[CLKHIGHREAD]  :  begin
				bitCount <= 8'b0;
				ramCLKEnReg <= 1'b1;
				ramCLKReg <= 1'b0;
			end
			state[CLKHIGHREADLOOP]  :  begin
			end
			state[CLKLOW]  :  begin
				spiInWord[0] <= mosiBuf;
			end
			state[CLKLOWREAD]  :  begin
			end
			state[CSNHIGH]  :  begin
				bitCount <= 8'b0;
				ramAddrReg <= 8'b0;
				ramCLKEnReg <= 1'b0;
				ramCLKReg <= 1'b0;
				ramWriteEnReg <= 1'b0;
				readMode <= 1'b0;
				readWord <= 16'hffff;
				spiInWord <= 32'b0;
			end
			state[CSNLOW]  :  begin
				ramCLKEnReg <= 1'b0;
				ramCLKReg <= 1'b0;
				ramWriteEnReg <= 1'b0;
			end
			state[COMMAND]  :  begin
			end
			state[LASTBIT]  :  begin
				spiInWord[0] <= mosiBuf;
			end
			state[LASTBITCLKHIGH]  :  begin
			end
			state[LASTBITCLKLOW]  :  begin
			end
			state[LATCHBIT]  :  begin
				readMode <= (bitCount[7:0] == 8'h10 && spiInWord[16:9] == 8'h11) ? 1'b1 :  readMode;
			end
			state[LATCHREADWORD]  :  begin
				readWord[15:0] <= ramReadData[15:0];
			end
			state[READLOWERCLK]  :  begin
				ramCLKReg <= 1'b0;
			end
			state[READRAISECLK]  :  begin
				ramCLKReg <= 1'b1;
			end
			state[READRAISECLK2]  :  begin
				ramCLKReg <= 1'b1;
			end
			state[SHIFT]  :  begin
				bitCount <= bitCount + 1'b1;
				spiInWord <= spiInWord << 1;
			end
			state[SHIFTREAD]  :  begin
				bitCount <= bitCount + 1'b1;
				readWord <= readWord << 1;
			end
			state[WRITEPWMREG0]  :  begin
				pwmRegs[15:0] <= spiInWord[15:0];
			end
			state[WRITEPWMREG1]  :  begin
				pwmRegs[31:16] <= spiInWord[15:0];
			end
			state[WRITEPWMREG2]  :  begin
				pwmRegs[47:32] <= spiInWord[15:0];
			end
			state[WRITERAM]  :  begin
				ramCLKEnReg <= 1'b1;
				ramCLKReg <= 1'b0;
				ramWriteEnReg <= 1'b1;
			end
			state[WRITERAMSTORE]  :  begin
				ramCLKReg <= 1'b1;
			end

		endcase
	end

end      // end of output always block

endmodule      // end of module spi
