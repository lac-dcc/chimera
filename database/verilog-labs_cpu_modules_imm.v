// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module imm(
  
  /* Current instruction encoding */
  input wire [31:0]instr,

  /* Type of immidiate arg encoded in instruction */
  input wire [1:0]imm_type,

  /* Output 32-bit sign extended imm */
  output wire [31:0]imm32 
);

assign imm32 = /* I */ (imm_type == 2'h0)? 
                {{20{instr[31]}},instr[31:20]} :

               /* S */ (imm_type == 2'h1)? 
                {{20{instr[31]}},instr[31:25],instr[11:7]} :

               /* B */ (imm_type == 2'h2)? 
                {{20{instr[31]}},instr[7],instr[30:25],instr[11:8],1'b0} :

               /* J    (imm_type == 2'h3) */ 
                {{13{instr[31]}},instr[19:12],instr[20],instr[30:21],1'b0}; 

endmodule
