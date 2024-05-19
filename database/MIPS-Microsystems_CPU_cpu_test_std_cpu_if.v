// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

module ifetch(
    input clk, reset, WE, flush, epc_WE,
    input [1:0] NPCOp_ID,
    input [31:0] npcValue_ID, epcValue_MEM,
    output [31:0] pcValue_IF, Instr_IF,
    output [4:0] ExcCode_out
);

    wire [31:0] npcValue_IF;
    pc myPC(
        .clk(clk), .reset(reset), .WE(WE | flush),
        .npc(npcValue_IF), .pc(pcValue_IF)
    );
    im myIM(.addr(pcValue_IF), .Instr(Instr_IF));

    assign npcValue_IF =    (epc_WE)            ?   epcValue_MEM        :
                            (flush)             ?   32'h0000_4180       :
                            (NPCOp_ID==2'b00)   ?   pcValue_IF+32'd4    :
                                                    npcValue_ID;
    assign ExcCode_out =    (pcValue_IF[1:0]!=2'b00 || (pcValue_IF[31:12]!=20'h0000_3 && pcValue_IF[31:12]!=20'h0000_4)) ?
                            5'd4 : 5'd0;

endmodule // if