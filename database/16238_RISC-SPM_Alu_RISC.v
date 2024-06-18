// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

/*ALU
Instruction         Action
ADD         Adds the datapaths to form data_1 + data_2.
SUB			Subtracts the datapaths to form data_1 - data_2.
AND			Takes the bitwise-and of the datapaths, data_1 & data_2.
NOT			Takes the bitwise Boolean complement of data_1.
*/
//!< Note: the carries are ignored in this model.

module Alu_RISC #(
    parameter word_size = 8,
    op_size = 4,
    // Opcodes
    NOP 	= 4'b0000,
    ADD 	= 4'b0001,
    SUB 	= 4'b0010,
    AND 	= 4'b0011,
    NOT 	= 4'b0100,
    RD  	= 4'b0101,
    WR		= 4'b0110,
    BR		= 4'b0111,
    BRZ 	= 4'b1000,
    EQZ     = 4'b1001,
    LDR     = 4'b1010
) (
    output alu_zero_flag,
    output reg[word_size-1: 0] alu_out,
    // data_1 := Reg_Y, data_2 := Bus_1
    input[word_size-1: 0] data_1, data_2,
    input[op_size-1: 0] sel
);
    assign  alu_zero_flag = ~|alu_out;
    always @ (sel or data_1 or data_2)  
        case  (sel)
            NOP:	    alu_out = 0;
            ADD:	    alu_out = data_1 + data_2;  // Reg_Y + Bus_1
            SUB, EQZ:	alu_out = data_2 - data_1;
            AND:	    alu_out = data_1 & data_2;
            NOT:	    alu_out = ~ data_2;	 // Gets data from Bus_1
            
        default: 	alu_out = 0;
        endcase 
endmodule