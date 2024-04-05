`include "marco.h"
`include "opcode.h"

module NPC(PC4,i26,Op,npc);

    /**   
     * NPCOp in opcode.h
     * `define NPCOPB 0
     * `define NPCOPJ 1
     */
    input          Op;
    input  [`i32] PC4;
    input  [`i26] i26;//b type only use I26[15:0]
    output [`i32] npc;
    wire   [`i16] i16;

    assign i16 = i26[`i16];
    assign npc = (Op==`NPCOPB) ?  
                    {14'b0, i16, 2'b00} + PC4 :
                    {PC4[31:28], i26, 2'b00};
endmodule
