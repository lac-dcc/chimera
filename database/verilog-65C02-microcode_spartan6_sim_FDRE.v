/*
 * Implementation of Spartan-6 FDRE for simulation. This is a
 * D-flipflop with enable and synchronous reset.
 */
module FDRE(
    output reg Q, 
    input C, 
    input CE, 
    input D, 
    input R );

    always @(posedge C)
        if( R )
            Q <= 0;
        else if( CE )
            Q <=  D;

endmodule
