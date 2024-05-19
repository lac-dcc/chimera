// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

module hps_interface
(
    // HPS interface
    input      [15:0]  gp_in,
    output reg [31:0]  gp_out,
    output reg         io_strobe,

    // HPS SPI
    input  spi_mosi,
    output spi_miso,
    input  spi_clk,
    input  spi_cs,

    // other HPS signals
    input fpga_enable,
    input osd_enable,
    input io_enable,

    input  sync_clk,
    input  sys_clk,
    input  reset
);

wire [15:0] gp_word_out;
wire        spi_rx_strobe;

reg  cs,      _cs;
reg  mosi,    _mosi;
reg  sck,     _sck;
reg  fpga_en, _fpga_en;
reg  osd_en,  _osd_en;
reg  io_en,   _io_en;

always @(posedge sync_clk) begin
    if (reset) begin
        cs <= 0;      _cs <= 0;
        mosi <= 0;    _mosi <= 0;
        sck <= 0;     _sck <= 0;
        fpga_en <= 0; _fpga_en <= 0;
        osd_en <= 0;  _osd_en <= 0;
        io_en <= 0;   _io_en <= 0;
    end else begin
        cs      <= _cs;      _cs      <= spi_cs;
        mosi    <= _mosi;    _mosi    <= spi_mosi;
        sck     <= _sck;     _sck     <= spi_clk;
        fpga_en <= _fpga_en; _fpga_en <= fpga_enable;
        osd_en  <= _osd_en;  _osd_en  <= osd_enable;
        io_en   <= _io_en;   _io_en   <= io_enable;
    end
end

spi_slave spi_slave (
    .spi_device__sck(sck),
    .spi_device__sdo(spi_miso),
    .spi_device__sdi(mosi),
    .spi_device__cs(cs),
    .word_in(gp_word_out),
    .word_out(gp_in),
    .word_complete(spi_rx_strobe),
    .clk(sys_clk),
    .rst(reset)
);

always @(posedge sys_clk) begin
    if (reset) begin
        gp_out    <= 0;
        io_strobe <= 0;
    end else begin
        gp_out <= {
            11'b0,          // [31:21]
            io_en,          // [20]
            osd_en,         // [19]
            fpga_en,        // [18]
            2'b0,           // [17:16]
            gp_word_out     // [15:0]
        };
        io_strobe <= spi_rx_strobe;
    end
end

endmodule
