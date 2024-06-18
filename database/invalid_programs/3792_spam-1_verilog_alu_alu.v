// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef  V_ALU
`define  V_ALU
/* verilator lint_off ASSIGNDLY */

// EG USE M27C322 21bit address x16 data

// TODO TODO TODO - generate rom images for Warren

/// FIXME NEED A BINARY TO BCD OPERATION AS THIS IS HARD - https://www.nandland.com/vhdl/modules/double-dabble.html

// FIXME - need to be able to shift with carry in or do this with an OR/AND operation?

/// EG USING ROM 28C512


/// MANY OPS NOT REQUIRED IF R CAN BE IMMEDIATE eg "A+1" is same as "A+immediate 1" as long as both treat carry the same
/// HMMMM .. But can't do "B+immediate 1" unless instreg is available on A bus too.

//// THIS IS THE MOST RECENT Jun 2020 ALU layout from CSCVon8
// | 0           | B-1               | A*B (low bits)    | A ROR B       |
// | A           | __A+B+Cin (0)__   | A*B (high bits)   | A AND B       |
// | B           | __A-B-Cin (0)__   | A/B               | A OR B        |
// | -A          | __B-A-Cin (0)__   | A%B               | A XOR B       |
// | -B          | A-B (special)     | A << B            | NOT A         |
// | A+1         | __A+B+Cin (1)__   | A >> B logical    | NOT B         |
// | B+1         | __A-B-Cin (1)__   | A >> B arithmetic | A+B (BCD)     |
// | A-1         | __B-A-Cin (1)__   | A ROL B           | A-B (BCD)     |

// My wiring here is ....
// | 0           | B-1               | A*B (low bits)    | A RRC B       |
// | A           | __A+B+Cin (0)__   | A*B (high bits)   | A AND B       |
// | B           | __A-B-Cin (0)__   | A/B               | A OR B        |
// | -A          | __B-A-Cin (0)__   | A%B               | A XOR B       |
// | -B          | A-B signedmag     | A << B            | NOT A         |
// | A+1         | __A+B+Cin (1)__   | A >> B logical    | NOT B         |
// | B+1         | __A-B-Cin (1)__   | A >> B arithmetic | A+B (BCD)     |
// | A-1         | __B-A-Cin (1)__   | A RLC B           | A-B (BCD)     |


`include "../74138/hct74138.v"
`include "../74157/hct74157.v"
`include "../rom/rom.v"
`include "alu_ops.v"
`include "alu_code.v"

// See also carry vs overflow http://teaching.idallen.com/dat2343/10f/notes/040_overflow.txt#:~:text=The%20ALU%20doesn't%20know,after%20the%20math%20is%20done.


`timescale 1ns/1ns

/* 
    If Inputs to arithmentic are two's complement then value will be 7 bits plus sign and Overflow is relevant, but ignore Carry

    The comparator outputs GT/LT are only valid for logical values (not twos complement).
    For contrast: 74AS885 permits selection of logical or arithmetic magnitude comparison https://www.ti.com/lit/ds/symlink/sn74as885.pdf?ts=1592517566383&ref_url=https%253A%252F%252Fwww.google.com%252F

    If I wanted to do a signed magnitude check then I have to do maths. 
    If do A-B with carry-cleared and then look at the Z and C flags. 
    
    Z set means they were equal, 
    if Overflow is not set and
    C set means B>A, 
    Z and C unset means A>B  
    ... but only as long as O is not set
    what about -2 and 3 which will become -5 which is not Z and not C
*/

module alu #(parameter LOG=0, PD=120) (
    output tri [7:0] result,
    output tri _flag_c,
    output tri _flag_z,
    output tri _flag_o,
    output tri _flag_n,
    output tri _flag_eq,
    output tri _flag_ne,
    output tri _flag_gt,
    output tri _flag_lt,
    input  [7:0] a,
    input  [7:0] b,
    input  [4:0] alu_op,
    input  _flag_c_in
);
    import alu_ops::*;

    //////////////////////////////////////////////////////
    // CARRY-IN LOGIC - EXTERNAL LOGIC
    //////////////////////////////////////////////////////

    wire aluop_4,aluop_3,aluop_2,aluop_1,aluop_0;
    assign aluop_4=alu_op[4];
    assign aluop_3=alu_op[3];
    assign aluop_2=alu_op[2];
    assign aluop_1=alu_op[1];
    assign aluop_0=alu_op[0];

    logic use_hw=1;
    
//`define USE_HW
`ifdef USE_HW

        wire [7:0] _decoded;
        hct74138 alu_op_decoder(.Enable1_bar(aluop_4), .Enable2_bar(1'b0), .Enable3(aluop_3), .A({aluop_2,aluop_1,aluop_0}), .Y(_decoded) );

        wire _use_cin;
        and #(8) use_cin_decoder(_use_cin, _decoded[7], _decoded[6],  _decoded[5]); 

        wire flag_c_in;
        not #(8) hct7404(flag_c_in, _flag_c_in); // inverter

        wire effective_aluop_2;
        hct74157 #(.WIDTH(1)) effective_bit_sel(._E(1'b0), .S(_use_cin), .I1({aluop_2}), .I0({flag_c_in}), .Y({ effective_aluop_2 })); // decoder

        wire [4:0] alu_op_effective = {aluop_4, aluop_3, effective_aluop_2, aluop_1, aluop_0};
`else

        logic effective_aluop_2;

        always @* begin
            effective_aluop_2 = (( alu_op == 13 || alu_op == 14 || alu_op == 15 )? !_flag_c_in: aluop_2);
        end
        
        wire [4:0] alu_op_effective = {aluop_4, aluop_3, effective_aluop_2, aluop_1, aluop_0};
`endif


    //////////////////////////////////////////////////////
    // ROM PROGRAMMING
    // ROM PROGRAMMING
    // ROM PROGRAMMING
    //////////////////////////////////////////////////////
if (1) begin
    wire [20:0] A = { alu_op_effective, a, b};
    tri [15:0] D;

    if (LOG) always @* begin
        if ($isunknown(A)) begin
            // not a problem unless happening near the exec edge
            $display("%9t", $time, " GLITCHING ADDRESS Z or X for OP:%5b A:%8b B:%8b /CIN:%1b", alu_op_effective, a, b, _flag_c_in);
        end
    end

    rom #(.AWIDTH(21), .DWIDTH(16), .FILENAME("../alu/roms/alu-hex.rom"), .LOG(0)) ALU_ROM(._CS(1'b0), ._OE(1'b0), .A, .D);

    assign { _flag_c, _flag_z, _flag_n, _flag_o, _flag_eq, _flag_ne, _flag_gt, _flag_lt, result} = D;

    if (LOG) 
    always @(*) 
        $display("%9t ALU", $time,
        " aluop_eff=%-1s (op:%d)", aluopName(alu_op_effective), alu_op_effective, 
        " aluop=%-1s (op:%d)", aluopName(alu_op), alu_op, 
        "  ",
        " a=%08b (u%-3d/h%-02h) ", a, a, a,
        " b=%08b (u%-3d/h%-02h) ", b, b, b,
        "  ",
        " address = %021b (d %d, h %04x)", A, A, A,
        " data = %16b (d %d, h %04x)", D,D,D,
        "  ",
        " out=%08b (u%-3d/h%-02h) ", result, result, result,
        " _c%1b",  _flag_c,
        " _z%1b",  _flag_z,
        " _o%1b",  _flag_o,
        " _n%1b",  _flag_n,
        " _eq%1b", _flag_eq,
        " _ne%1b", _flag_ne,
        " _gt%1b", _flag_gt,
        " _lt%1b", _flag_lt
         );

end
else  
begin
    alu_code ALU_CODE( .o(result), ._flag_c, ._flag_z, ._flag_n, ._flag_o, ._flag_eq, ._flag_ne, ._flag_gt, ._flag_lt, .a, .b, .alu_op(alu_op_effective));
end

if (LOG) 
    always @(*) 
        $display("%9t ALU", $time,
        " aluop_eff=%-10s (op:%d)", aluopName(alu_op_effective), alu_op_effective, 
        " aluop=%-10s (op:%d)", aluopName(alu_op), alu_op, 
        "  ",
        " a=%08b (u%-3d/h%-02h) ", a, a, a,
        " b=%08b (u%-3d/h%-02h) ", b, b, b,
        "  ",
        " out=%08b (u%-3d/h%-02h) ", result, result, result,
        " _c%1b",  _flag_c,
        " _z%1b",  _flag_z,
        " _n%1b",  _flag_n,
        " _o%1b",  _flag_o,
        " _eq%1b", _flag_eq,
        " _ne%1b", _flag_ne,
        " _gt%1b", _flag_gt,
        " _lt%1b", _flag_lt
         );

endmodule: alu

`endif
