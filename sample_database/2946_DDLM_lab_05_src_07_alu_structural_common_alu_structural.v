// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

//ALU commands
//ALU_AND 2'b00
//ALU_ADD 2'b01
//ALU_SLL 2'b10
//ALU_SLT 2'b11

module alu_structural
#(
    parameter WIDTH = 4,
    parameter SHIFT = 2
)
(
    input  [WIDTH - 1:0] x, y,
    input  [SHIFT - 1:0] shamt,
    input  [ 1:0]        operation,
    input                carry_in,
    output               zero,
    output               overflow,
    output [WIDTH - 1:0] result
);

    wire [4 * WIDTH - 1: 0] t;// This ALU supports 4 operations
    
    //Bitwise AND
    bitwise_and #( .WIDTH( WIDTH ) ) i_and
    (
        .x( x                  ),
        .y( y                  ),
        .z( t[ WIDTH - 1 : 0 ] )
    );
    
    //Adder
    adder #( .WIDTH( WIDTH ) ) i_adder
    (
        .x        ( x                          ),
        .y        ( y                          ),
        .carry_in ( carry_in                   ),
        .z        ( t[ 2 * WIDTH - 1 : WIDTH ] ),
        .carry_out( overflow                   )
    );
    
    //Shifter
    left_shifter
    #(
        .WIDTH( WIDTH ),
        .SHIFT( SHIFT )
    )
    i_shifter
    (
        .x    ( x                              ),
        .shamt( shamt                          ),
        .z    ( t[ 3 * WIDTH - 1 : 2 * WIDTH ] )
    );
    
    //SLT
    slt #( .WIDTH( WIDTH ) ) i_slt
    (
        .x( x                              ),
        .y( y                              ),
        .z( t[ 4 * WIDTH - 1 : 3 * WIDTH ] )
    );
    
    //Multiplexer
    bn_mux_n_1_generate
    #(
        .DATA_WIDTH( WIDTH),
        .SEL_WIDTH ( 2 )
    )
    i_mux
    (
        .data( t         ),
        .sel ( operation ),
        .y   ( result    )
    );
    
    //Flags
    assign zero = (result == 0);

endmodule