// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0


`default_nettype none

module user_module_341528610027340372(
  input [7:0] io_in,
  output [7:0] io_out
);

MCPU5 MCPU5_top (
  .clk(io_in[0]),
  .rst(io_in[1]),
  .inst_in(io_in[7:2]),
  .cpu_out(io_out[7:0])
);

endmodule


module MCPU5(inst_in,cpu_out,rst,clk);

input [5:0] inst_in;
output [7:0] cpu_out;
input rst;
input clk;

localparam OP_BCC  = 2'b00;      //00IIII
localparam OP_STA  = 3'b101;     //101RRR
localparam OP_JMPA = 6'b111010;  //111010

reg [8:0] accu; // accu(6) is carry !
reg [7:0] pc;
reg [7:0] regfile [0:8];
reg iflag;
integer i;

initial begin
end
    //handle register file writes (STA)
    always @(*)
        if ((inst_in[5:3] == OP_STA) && ~rst && ~clk)
            regfile[inst_in[2:0]] <= accu;

	always @(posedge clk)
		if (rst) begin
			accu <= 0;	
			pc <= 0;
            iflag <= 0;
		end
		else begin

            if ((inst_in[5:4] == OP_BCC) && ~accu[8])            // conditional branch (BCC)            
                pc <= pc + {{4{inst_in[3]}}, inst_in[3:0]};  
            else if (inst_in == OP_JMPA)                        // JMPA
                pc <= accu[7:0];
            else
                pc <= pc + 1'b1;
                       
            // ALU path + carry flag
            casex(inst_in)
                6'b00????: accu[8]   <= 1'b0;                                                                     // BCC #imm4
                6'b01????: accu[7:0] <= iflag ? { inst_in[3:0], accu[3:0]}: {{4{inst_in[3]}}, inst_in[3:0]}  ;    // LDI #simm4
                6'b100???: accu[8:0] <= {1'b0,regfile[inst_in[2:0]]} + {1'b0,accu[7:0]};                          // ADD reg8
                6'b101???: ;                                                                                      // STA reg8
                6'b110???: accu[7:0] <= regfile[inst_in[2:0]];                                                    // LDA reg8
                6'b11100?: accu[7:0] <= ~accu[7:0] + inst_in[0];                                                  // NEG / NOT
                6'b111010: ;                                                                                      // JMP A
                6'b111011: ;                                                                                      // OUT
                6'b1111??: ;                                                                                      // Free imm2
            endcase

            // Flags
            casex(inst_in)
                6'b01????: iflag <= 1'b1;           // LDI #simm4
                default:   iflag <= 1'b0;           // all others
            endcase		
        end

assign cpu_out = clk ? {pc[7:0]} :  accu[7:0] ; 

endmodule
