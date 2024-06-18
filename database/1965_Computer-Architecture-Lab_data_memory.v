// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module DataMemory(
    input clk, rst,
    input [31:0] memAdr, writeData,
    input memRead, memWrite,
    output reg [31:0] readData
);


    reg [31:0] dataMem [0:63]; // 256B memory

    wire [31:0] dataAdr, adr;
    assign dataAdr = memAdr - 32'd1024;
    assign adr = {2'b00, dataAdr[31:2]}; // Align address to the word boundary

    integer i;

    always @(negedge clk, posedge rst) begin
        if (rst)
            for (i = 0; i < 64; i = i + 1) begin
                dataMem[i] <= 32'd0;
            end
        else if (memWrite)
            dataMem[adr] <= writeData;
    end

    always @(memRead or adr) begin
        if (memRead)
            readData = dataMem[adr];
    end
endmodule
