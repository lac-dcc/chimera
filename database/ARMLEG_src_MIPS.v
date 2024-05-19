// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

// ALL CODE TAKEN FROM THE BOOK, COMPUTER ORGANISATION AND DESIGN : THE HARDWARE/SOFTWARE INTERFACE, ARM EDITION

module CPU (clock);
	parameter LW = 6'b100011, SW = 6'b101011, BEQ=6'b000100, J=6'd2;
	input clock; //the clock is an external input

	// The architecturally visible registers and scratch registers for implementation
	reg [31:0] PC, Regs[0:31], Memory [0:1023], IR, ALUOut, MDR, A, B;
	reg [2:0] state; // processor state
	wire [5:0] opcode; //use to get opcode easily
	wire [31:0] SignExtend,PCOffset; //used to get sign-extended offset field

	assign opcode = IR[31:26]; //opcode is upper 6 bits
	assign SignExtend = {{16{IR[15]}},IR[15:0]}; //sign extension of lower 16 bits of instruction
	assign PCOffset = SignExtend << 2; //PC offset is shifted

	// set the PC to 0 and start the control in state 0
	initial begin PC = 0; state = 1; end

	//The state machine--triggered on a rising clock
	always @(posedge clock) begin
		Regs[0] = 0; //make R0 0 //shortcut way to make sure R0 is always 0

		case (state) //action depends on the state
			1: begin // first step: fetch the instruction, increment PC, go to next state
				IR <= Memory[PC>>2];
				PC <= PC + 4;
				state = 2; //next state
			end

			2: begin // second step: Instruction decode, register fetch, also compute branch address
				A <= Regs[IR[25:21]];
				B <= Regs[IR[20:16]];
				state = 3;
				ALUOut <= PC + PCOffset; // compute PC-relative branch target
			end

			3: begin // third step: Load-store execution, ALU execution, Branch completion
				state = 4; // default next state
				if ((opcode==LW) |(opcode==SW)) ALUOut <= A + SignExtend; //compute effective address
				else if (opcode==6'b0) case (IR[5:0]) //case for the various R-type instructions
					32: ALUOut = A + B; //add operation
					default: ALUOut = A; //other R-type operations: subtract, SLT, etc.
				endcase
				else if (opcode == BEQ) begin
					if (A==B) PC <= ALUOut; // branch taken--update PC
					state = 1;
				end
				else if (opcode==J) begin
					PC = {PC[31:28], IR[25:0],2'b00}; // the branch target PC
					state = 1;
				end //Jumps
				else ; // other opcodes or exception for undefined instruction would go here
			end

			4: begin
				if (opcode==6'b0) begin //ALU Operation
					Regs[IR[15:11]] <= ALUOut; // write the result
					state = 1;
				end //R-type finishes
				else if (opcode == LW) begin // load instruction
					MDR <= Memory[ALUOut>>2]; // read the memory
					state = 5; // next state
				end
				else if (opcode == LW) begin
					Memory[ALUOut>>2] <= B; // write the memory
					state = 1; // return to state 1
				end //store finishes
				else ; // other instructions go here
			end

			5: begin // LW is the only instruction still in execution
				Regs[IR[20:16]] = MDR; // write the MDR to the register
				state = 1;
			end //complete an LW instruction
		endcase
	end
endmodule

module Datapath (ALUOp, RegDst, MemtoReg, MemRead, MemWrite, IorD, RegWrite, IRWrite, PCWrite,
	PCWriteCond, ALUSrcA, ALUSrcB, PCSource, opcode, clock); // the control inputs + clock
	input [1:0] ALUOp, ALUSrcB, PCSource; // 2-bit control signals
	input RegDst, MemtoReg, MemRead, MemWrite, IorD, RegWrite, IRWrite, PCWrite, PCWriteCond, ALUSrcA, clock; // 1-bit control signals
	output [5:0] opcode ; // opcode is needed as an output by control
	reg [31:0] PC, Memory [0:1023], MDR,IR, ALUOut; // CPU state + some temporaries
	wire [31:0] A,B,SignExtendOffset, PCOffset, ALUResultOut, PCValue, JumpAddr, Writedata, ALUAin,
	ALUBin,MemOut; // these are signals derived from registers
	wire [3:0] ALUCtl; //. the ALU control lines
	wire Zero; //the Zero out signal from the ALU
	wire[4:0] Writereg; // the signal used to communicate the destination register
	initial PC = 0; //start the PC at 0

	//Combinational signals used in the datapath
	// Read using word address with either ALUOut or PC as the address source
	assign MemOut = MemRead ? Memory[(IorD ? ALUOut : PC)>>2]:0;
	assign opcode = IR[31:26]; // opcode shortcut
	// Get the write register address from one of two fields depending on RegDst
	assign Writereg = RegDst ? IR[15:11]: IR[20:16];
	// Get the write register data either from the ALUOut or from the MDR
	assign Writedata = MemtoReg ? MDR : ALUOut;
	// Sign-extend the lower half of the IR from load/store/branch offsets
	assign SignExtendOffset = {{16{IR[15]}},IR[15:0]}; //sign-extend lower 16 bits;
	// The branch offset is also shifted to make it a word offset
	assign PCOffset = SignExtendOffset << 2;
	// The A input to the ALU is either the rs register or the PC
	assign ALUAin = ALUSrcA ? A : PC; //ALU input is PC or A
	// Compose the Jump address
	assign JumpAddr = {PC[31:28], IR[25:0],2'b00}; //The jump address

	// Creates an instance of the ALU control unit (see the module defined in Figure B.5.16
	// Input ALUOp is control-unit set and used to describe the instruction class as in Chapter 4
	// Input IR[5:0] is the function code field for an ALU instruction
	// Output ALUCtl are the actual ALU control bits as in Chapter 4
	ALUControl alucontroller (ALUOp,IR[5:0],ALUCtl); //ALU control unit
	// Creates a 3-to-1 multiplexor used to select the source of the next PC
	// Inputs are ALUResultOut (the incremented PC) , ALUOut (the branch address), the jump target address
	// PCSource is the selector input and PCValue is the multiplexor output
	Mult3to1 PCdatasrc (ALUResultOut,ALUOut,JumpAddr, PCSource , PCValue);
	// Creates a 4-to-1 multiplexor used to select the B input of the ALU
	// Inputs are register B,constant 4, sign-extended lower half of IR, sign-extended lower half of IR << 2
	// ALUSrcB is the selector input
	// ALUBin is the multiplexor output
	Mult4to1 ALUBinput (B,32'd4,SignExtendOffset,PCOffset,ALUSrcB,ALUBin);
	// Creates a MIPS ALU
	// Inputs are ALUCtl (the ALU control), ALU value inputs (ALUAin, ALUBin)
	// Outputs are ALUResultOut (the 32-bit output) and Zero (zero detection output)
	MIPSALU ALU (ALUCtl, ALUAin, ALUBin, ALUResultOut,Zero); //the ALU
	// Creates a MIPS register file
	// Inputs are
	// the rs and rt fields of the IR used to specify which registers to read,
	// Writereg (the write register number), Writedata (the data to be written), RegWrite (indicates a write), the clock
	// Outputs are A and B, the registers read
	registerfile regs (IR[25:21],IR[20:16],Writereg,Writedata,RegWrite,A,B,clock); //Register file

	// The clock-triggered actions of the datapath
	always @(posedge clock) begin
		if (MemWrite) Memory[ALUOut>>2] <= B; // Write memory--must be a store
		ALUOut <= ALUResultOut; //Save the ALU result for use on a later clock cycle
		if (IRWrite) IR <= MemOut; // Write the IR if an instruction fetch
		MDR <= MemOut; // Always save the memory read value
		// The PC is written both conditionally (controlled by PCWrite) and unconditionally
		if (PCWrite || (PCWriteCond & Zero)) PC <=PCValue;
	end
endmodule

module MIPSCPU (clock);
	parameter LW = 6'b100011, SW = 6'b101011, BEQ = 6'b000100, J = 6'd2; //constants
	input clock; reg [2:0] state;
	wire [1:0] ALUOp, ALUSrcB, PCSource; wire [5:0] opcode;
	wire RegDst, MemRead, MemWrite, IorD, RegWrite, IRWrite, PCWrite, PCWriteCond,
	ALUSrcA, MemoryOp, IRWwrite, Mem2Reg;

	// Create an instance of the MIPS datapath, the inputs are the control signals; opcode is only output
	Datapath MIPSDP (ALUOp,RegDst,Mem2Reg, MemRead, MemWrite, IorD, RegWrite,
		IRWrite, PCWrite, PCWriteCond, ALUSrcA, ALUSrcB, PCSource, opcode, clock);

	initial begin state = 1; end // start the state machine in state 1

	// These are the definitions of the control signals
	assign IRWrite = (state==1);
	assign Mem2Reg = ~ RegDst;

	assign MemoryOp = (opcode==LW)|(opcode==SW); // a memory operation
	assign ALUOp = ((state==1)|(state==2)|((state==3)&MemoryOp)) ? 2'b00 : // add
	((state==3)&(opcode==BEQ)) ? 2'b01 : 2'b10; // subtract or use function code

	assign RegDst = ((state==4)&(opcode==0)) ? 1 : 0;
	assign MemRead = (state==1) | ((state==4)&(opcode==LW));
	assign MemWrite = (state==4)&(opcode==SW);
	assign IorD = (state==1) ? 0 : (state==4) ? 1 : X;
	assign RegWrite = (state==5) | ((state==4) &(opcode==0));
	assign PCWrite = (state==1) | ((state==3)&(opcode==J));
	assign PCWriteCond = (state==3)&(opcode==BEQ);
	assign ALUSrcA = ((state==1)|(state==2)) ? 0 :1;

	assign ALUSrcB = ((state==1) | ((state==3)&(opcode==BEQ))) ? 2'b01 : (state==2) ? 2'b11 :
	((state==3)&MemoryOp) ? 2'b10 : 2'b00; // memory operation or other

	assign PCSource = (state==1) ? 2'b00 : ((opcode==BEQ) ? 2'b01 : 2'b10);

	// Here is the state machine, which only has to sequence states
	always @(posedge clock) begin // all state updates on a positive clock edge
		case (state)
			1: state = 2; //unconditional next state
			2: state = 3; //unconditional next state
			3: // third step: jumps and branches complete
			state = ((opcode==BEQ) | (opcode==J)) ? 1 : 4; // branch or jump go back else next state
			4: state = (opcode==LW) ? 5 : 1; //R-type and SW finish
			5: state = 1; // go back
		endcase
	end
endmodule

module Mult4to1 (In1, In2, In3, In4, Sel, Out);
	input[31:0] In1, In2, In3, In4; //four of 32 bits
	input[1:0] Sel; //selector signal
	output reg [31:0] Out; // 32-bit output
	always@(In1, In2, In3, In4, Sel)
	case(Sel) // a 4->1 multiplexor
		0: Out <= In1;
		1: Out <= In2;
		2: Out <= In3;
		default : Out <= In4;
	endcase
endmodule

module Mult3to1 (In1, In2, In3, Sel, Out);
	input[31:0] In1, In2, In3; //three of 32 bits
	input[1:0] Sel; //selector signal
	output reg [31:0] Out; // 32-bit output
	always@(In1, In2, In3, Sel)
	case(Sel) // a 3->1 multiplexor
		0: Out <= In1;
		1: Out <= In2;
		default : Out <= In3;
	endcase
endmodule

module MIPSALU(ALUctl, A, B, ALUOut, Zero);
	input [3:0] ALUctl;
	input [31:0] A, B;
	output reg [31:0] ALUOut;
	output Zero;
	assign Zero = (ALUOut==0); //Zero is true if ALUOut is 0; goes anywhere
	always @(ALUctl, A, B) //reevaluate if these change
	case (ALUctl)
		0: ALUOut <= A & B;
		1: ALUOut <= A | B;
		2: ALUOut <= A + B;
		6: ALUOut <= A - B;
		7: ALUOut <= A < B ? 1:0;
		12: ALUOut <= ~(A | B);
		default: ALUOut <= 0;
	endcase
endmodule

module ALUControl (ALUOp, FuncCode, ALUCtl);
	input [1:0] ALUOp;
	input [5:0] FuncCode;
	output reg[3:0] ALUCtl;

	always case (FuncCode)
		32: ALUOp<=2; //add
		34: ALUOp<=6; //subtract
		36: ALUOp<=0; //and
		37: ALUOp<=1; //or
		39: ALUOp<=12; //nor
		42: ALUOp<=7; // slt
		default: ALUOp<=15; //should not happen
	endcase
endmodule

//module CLOCK (clock);
//	reg clock;
//	always@(*) begin
//		#1 clock = 1;
//		#1 clock = 0;
//		end
//endmodule


module registerfile (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock);
	input [5:0] Read1, Read2, WriteReg; // the register numbers to read or write
	input[63:0] WriteData; // data to write
	reg clock; // the clock to trigger write
	output [63:0] Data1, Data2; // the register values read
	reg [63:0] RF [31:0];
	assign Data1 = RF[Read1];
	assign Data2 = RF[Read2];
	always begin
		// write the register with the new value if Regwirte is high
		@(posedge clock) if (RegWrite)
			RF[WriteReg] <= WriteData;
	end
endmodule
