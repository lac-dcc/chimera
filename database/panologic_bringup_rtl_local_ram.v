
module local_ram #(
    parameter integer WORDS = 256
) (
    input                           clk,
    input      [3:0]                wr,
    input                           rd,
    input      [15:0]               addr,
    input      [31:0]               wdata,
    output reg [31:0]               rdata
);
    reg [7:0] mem0 [0:WORDS-1];
    reg [7:0] mem1 [0:WORDS-1];
    reg [7:0] mem2 [0:WORDS-1];
    reg [7:0] mem3 [0:WORDS-1];

    initial begin
        $readmemh("progmem0.hex", mem0);
        $readmemh("progmem1.hex", mem1);
        $readmemh("progmem2.hex", mem2);
        $readmemh("progmem3.hex", mem3);
    end

    always @(posedge clk) begin
        if (wr[0]) mem0[addr] <= wdata[ 7: 0];
        if (wr[1]) mem1[addr] <= wdata[15: 8];
        if (wr[2]) mem2[addr] <= wdata[23:16];
        if (wr[3]) mem3[addr] <= wdata[31:24];

        rdata <= { mem3[addr], mem2[addr], mem1[addr], mem0[addr] };
    end

endmodule
