// This program was cloned from: https://github.com/Maculos/BOG-1
// License: Creative Commons Zero v1.0 Universal

/*
RV64I CPU Project
Module is based on version 20191213 of the Unprivileged RISC-V ISA Chapter(s) 2.1 Page 14
These comments are left both for anyone for some reason leaveraging my work but also to give myself a quick reference before this gets too into the weeds
I would to thank Professor Onur Mutlu for being so kind to publish his lectures online, they have been a great resource I could not have gone without.
*/

`ifndef regfile
`define regfile

module regfile (
    input clock,
    input writeEN,

    //Data to be put onto a register, 64 bits
    input [63:0] data,
    
    //Register Source 1&2, Register Destination, encoded with 5 bits represending a value up to 32
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,

    //Register value 1&2 outputs
    output [63:0] rv1,
    output [63:0] rv2
);
    //A 64 bit wide data storage (reg [63:0]) that is 32 objects wide ([31:0]) assigned to the name regs
    reg [63:0] regs [31:0];

    //Assign the output variables to the selected register position
    assign rv1 = regs[rs1];
    assign rv2 = regs[rs2];

    always @(posedge clock) begin
        if (writeEN) begin
            regs[rd] <= data;
        end
    end

endmodule

`endif