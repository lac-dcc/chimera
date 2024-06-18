// This program was cloned from: https://github.com/tioluwanimofe/cpu_verilog
// License: MIT License

module cpu(CLOCK_50, KEY, SW, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
 
 input CLOCK_50;
 input [1:0] KEY;
 input [9:0] SW;
 output [9:0] LEDR;
 output [7:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
 
 reg [7:0] PC;
 reg reset_reg;
 wire [31:0] INSTRUCTION;
 wire [7:0] PCRESULT;
 wire CLK, RESET, isZero;


 reg writeEnable, isAdd, isImediate, isJump;
 reg [2:0] aluOp, regRead1Addres, regRead2Addres, writeRegAddres;
 wire [31:0] immediateVal, mux1out, mux2out, ALURESULT, minusVal, IN, OUT1, OUT2;
 wire [7:0] OPCODE; 
 wire [2:0] DESTINATION, SOURCE1, SOURCE2;
 
 reg [31:0] clock_div;
 always @(posedge CLOCK_50)
 begin
   clock_div <= clock_div + 1;
 end
 
	 
// Choose from the lines below which clock to use.   
assign CLK = clock_div[24];  // Clock divider to produce about 1.5Hz clock
//assign CLK = CLOCK_50;  // CLOCK_50 is a board driven 50MHz clock

assign RESET = KEY[0];
assign LEDR = {CLK, 1'b0, PC};
	 
// Set Hex displays on FPGA board to display the 24-bit value coming out of the ALU
// Make sure to end your program with the ALU output displaying the contents of the Register you want displayed!!
hex_to_seven h0(ALURESULT[3:0],HEX0);
hex_to_seven h1(ALURESULT[7:4],HEX1);
hex_to_seven h2(ALURESULT[11:8],HEX2);
hex_to_seven h3(ALURESULT[15:12],HEX3);
hex_to_seven h4(ALURESULT[19:16],HEX4);
hex_to_seven h5(ALURESULT[23:20],HEX5);
	 
	 
//adder myadder(PC, PCRESULT); // Adder to increment PC value by 4
assign PCRESULT = PC + 1;

// Use DFF to capture RESET from external button.  Value of ~RESET is high when button is pushed.
// Wait until next clock cycle to use this reset value.  Can help with "key_bounce" due to pressing buttons
always@(posedge CLK)
begin
  reset_reg <= ~RESET;
  
  if (reset_reg)  PC <= 0;  // Reset PC to zero when RESET is high
  else if (isJump) PC <= INSTRUCTION[23:16];  // PC gets Destination Value from Instruction for Jump command
  else PC <= PCRESULT;  //When not RESET and not Jump command, just go to next instruction
end
 
inst_rom my_prog(PC, INSTRUCTION); // Instruction ROM uses PC as input and provides instruction output

assign OPCODE = INSTRUCTION[31:24];  // taking the opcode from the instruction

always @(OPCODE)
 begin  
     
   //decoding the opcode
  case(OPCODE)
   8'b00000000:
   begin
    writeEnable = 1'b1;
    aluOp = 3'b000;
    isAdd = 1'b1;
    isImediate = 1'b1;
	 isJump = 1'b0;
   end
   8'b00000001:
   begin
    writeEnable = 1'b1;  
    aluOp = 3'b000;
    isAdd = 1'b1;
    isImediate = 1'b0;
 	 isJump = 1'b0;
   end
   8'b00000010:
   begin
    writeEnable = 1'b1;
    aluOp = 3'b001;
    isAdd = 1'b1;
    isImediate = 1'b0;
 	 isJump = 1'b0;
   end
   8'b00000011:
   begin
    writeEnable = 1'b1;
    aluOp = 3'b001;
    isAdd = 1'b0;
    isImediate = 1'b0;
	 isJump = 1'b0;
   end
   8'b00000100:
   begin
    writeEnable = 1'b1;
    aluOp = 3'b010;
    isAdd = 1'b1;
    isImediate = 1'b0; 
	 isJump = 1'b0;
   end
   8'b00000101:
   begin
    writeEnable = 1'b1;
    aluOp = 3'b011;
    isAdd  =1'b1;
    isImediate = 1'b0; 
 	 isJump = 1'b0;
   end     
   8'b00001000:
   begin
    writeEnable = 1'b0;
    aluOp = 3'b100;
    isAdd  =1'b1;
    isImediate = 1'b0; 
 	 isJump = 1'b1;
   end
	default:
	begin
    writeEnable = 1'b0;
    aluOp = 3'b100;
    isAdd  =1'b1;
    isImediate = 1'b0; 
 	 isJump = 1'b0;
   end
    
  endcase        
 end
 
 //including the register file
    reg_file myReg(IN,OUT1,OUT2,DESTINATION,SOURCE1,SOURCE2,writeEnable,CLK,reset_reg);
 
 assign DESTINATION  = INSTRUCTION[18:16];
 assign SOURCE1   = INSTRUCTION[10:8];
 assign SOURCE2 = INSTRUCTION[2:0];
 assign immediateVal = {24'h000000, INSTRUCTION[7:0]};

 // This is two's complement unit to substraction
 twosCompliment mytwo(OUT2,minusVal);//multiplexer to choose between minus value and plus value
 mux2_1 mymux1(OUT2,minusVal,isAdd,mux1out);
 
 //multiplexer to chose between immediate value and mux1 output
 mux2_1 mymux2(immediateVal, mux1out, isImediate, mux2out);
 
 //allu module
 alu myalu(OUT1, mux2out, ALURESULT, aluOp, isZero);
 
 assign IN = ALURESULT;  //setting the reg input with the alu result
 
 endmodule
