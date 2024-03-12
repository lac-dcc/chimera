`define PCINITIAL 32'h0000_3000
module PC #(parameter  WIDTH = 32)
          (Clk,Rst,We,NPC,PC);

    input Clk,Rst,We;
    input [WIDTH-1:0] NPC;
    output reg[WIDTH-1:0] PC;

    always @(posedge Clk) begin
        if (Rst === 1) begin
            PC = `PCINITIAL; 
        end
        else if( We === 1 )begin
            PC = NPC;
        end
    end

 endmodule
