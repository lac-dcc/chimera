`default_nettype none
module twiddle_rom 
#(
    parameter FILE_REAL = "hdl/twiddle_real.list",
    parameter FILE_IMAJ = "hdl/twiddle_imag.list",
    parameter addr_w    = 7,
    parameter data_w    = 8
)
(
    input wire                  clk,
    input wire [addr_w-1:0]     addr,
    output reg [data_w-1:0]     dout_real,
    output reg [data_w-1:0]     dout_imag
);

    reg [data_w-1:0] rom_real [(1 << addr_w)-1:0];
    reg [data_w-1:0] rom_imag [(1 << addr_w)-1:0];

    initial begin
        if (FILE_REAL) $readmemh(FILE_REAL, rom_real);
        if (FILE_IMAJ) $readmemh(FILE_IMAJ, rom_imag);
    end

    always @(posedge clk) begin
        dout_real = rom_real[addr];
        dout_imag = rom_imag[addr];
    end

endmodule
