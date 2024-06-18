// This program was cloned from: https://github.com/Revenantx86/tt07-tinytpu
// License: Apache License 2.0

module dff_mem #
(
    parameter D_W = 8, 
    parameter WORD = 8
)
(
    input wire clk,
    input wire rst,
    // Read Logic
    input wire rd_en,
    input wire [$clog2(WORD)-1:0] addr,
    // Write logic
    input wire wr_en,
    // IO
    input wire [D_W-1:0] data_in,
    output reg [D_W-1:0] data_out
);
//
// Memory Array
reg [D_W-1:0] mem [WORD-1:0];
//
// Write Logic
always @(posedge clk) begin
    if(wr_en) begin
        mem[addr] <= data_in;
    end
end

// Read Logic
always @(*) begin
    if(rd_en) begin
        data_out <= mem[addr];  // Update output only if rd_en is high
    end
    else if(!rd_en) begin
        data_out <= 0;  // Update output only if rd_en is high
    end 
    else if(rst) begin
        data_out <= 0;          // Optionally reset the output to 0 on reset
    end
end


endmodule