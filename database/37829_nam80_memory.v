// This program was cloned from: https://github.com/namberino/nam80
// License: BSD 2-Clause "Simplified" License

module memory(
    input clk,
    input rst,
    input[15:0] data_in,
    input mar_write_en,
    input mem_write_en,
    output[7:0] out
);

    reg[7:0] mem[0:65535];
    reg[15:0] mar;

    initial begin
        $readmemh("program.bin", mem);
    end

    // mar handling
    always @ (posedge clk, posedge rst)
    begin
        if (rst)
            mar <= 16'b0;
        else if (mar_write_en)
            mar <= data_in;
    end

    // writing to mem
    always @ (posedge clk)
    begin
        if (mem_write_en)
            mem[mar] <= data_in[7:0];
    end

    assign out = mem[mar];

endmodule
