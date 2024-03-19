module b9_6bit_dec_mips_maindec(input wire [5:0] op,
               output wire   memtoreg, memwrite, 
               output wire   branch, alusrc, 
               output wire   regdst, regwrite, 
               output wire   jump, 
               output wire[1:0] aluop); 
  reg [8:0] controls; 
  assign {regwrite, regdst, alusrc, branch, memwrite, 
          memtoreg, jump, aluop} = controls; 
  always@(*) begin
    case(op) 
      6'b000000: controls <= 9'b110000010; // RTYPE 
      6'b100011: controls <= 9'b101001000; // LW 
      6'b101011: controls <= 9'b001010000; // SW 
      6'b000100: controls <= 9'b000100001; // BEQ 
      6'b001000: controls <= 9'b101000000; // ADDI 
		6'b000010: controls <= 9'b000000100; // J 
      default:   controls <= 9'bxxxxxxxxx; // illegal op 
    endcase
  end
endmodule

module b9_6bit_dec_mips_aludec(input  wire [5:0] funct,
              input  wire [1:0] aluop, 
              output reg [2:0] alucontrol); 
  always @(*) begin
    case(aluop) 
      2'b00: alucontrol <= 3'b010; // add (for lw/sw/addi) 
      2'b01: alucontrol <= 3'b110; // sub (for beq) 
      default: case(funct)        // R-type instructions 
          6'b100000: alucontrol <= 3'b010; // add 
          6'b100010: alucontrol <= 3'b110; // sub 
          6'b100100: alucontrol <= 3'b000; // and 
          6'b100101: alucontrol <= 3'b001; // or 
          6'b101010: alucontrol <= 3'b111; // slt 
          default:   alucontrol <= 3'bxxx; // ??? 
	 endcase
	endcase
  end
endmodule


module timeQuest_wrapper(clock,SW,LED);
	input clock;
	input [5:0] SW;
	output [9:0] LED;
 
	reg [5:0] SW_reg;
	reg [9:0] LED_reg; // registers for 'catching' time
 
	wire [9:0] LED_wire;
	wire [5:0] SW_wire;
	assign SW_wire = SW_reg;
	
	// creating our test instance
	b9_6bit_dec_mips_maindec (SW_reg,LED_wire[0],LED_wire[1],LED_wire[2],
										LED_wire[3],LED_wire[4],LED_wire[5],LED_wire[6],{LED_wire[7],LED_wire[8]});
  
   // clock needed to determine at which step register was filled with data
	always @(posedge clock)
		begin
			SW_reg <= SW; // avoiding race and latch by setting '<=' instead of '='
			LED_reg<=LED_wire;
		end
	assign LED = LED_reg;
endmodule


module lab3
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

	b9_6bit_dec_mips_maindec (SW,LEDR[0],LEDR[1],LEDR[2],
										LEDR[3],LEDR[4],LEDR[5],LEDR[6],{LEDR[7],LEDR[8]});
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	//timeQuest_wrapper(KEY[1],SW,LEDR);
	
endmodule