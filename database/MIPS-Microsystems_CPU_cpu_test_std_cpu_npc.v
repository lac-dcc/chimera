module npc(
    input [31:0] pc,
    input [25:0] Imm,
    input [31:0] ra,
    input [1:0] NPCOp,
    output reg [31:0] npc
);

    always @(*) begin
        case(NPCOp)
            2'b00:      npc <= pc + 32'd4;
            2'b01:      npc <= pc + 32'd4 + {{14{Imm[15]}}, Imm[15:0], 2'b00};
            2'b10:      npc <= {pc[31:28], Imm[25:0], 2'b00};
            2'b11:      npc <= ra;
            default:    npc <= 32'hxxxx_xxxx;
        endcase
    end


endmodule // npc