// This program was cloned from: https://github.com/WangXuan95/UniPlug-FPGA
// License: GNU General Public License v3.0


module flash_w25qxx_get_id (
    input  wire        rstn,
    input  wire        clk,
    // Flash SPI interface
    output reg         spi_ss,
    output reg         spi_sck,
    output reg         spi_mosi,
    input  wire        spi_miso,
    // ID output
    output reg         id_valid,
    output reg  [15:0] id
);


initial spi_ss   = 1'b1;
initial spi_sck  = 1'b0;
initial spi_mosi = 1'b0;

initial id_valid = 1'b0;
initial id       = 0;

reg [7:0] cnt = 0;


always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        cnt <= 0;
    end else begin
        if (cnt < 8'hff)
            cnt <= cnt + 8'h1;
    end

always @ (posedge clk or negedge rstn)
    if (~rstn)
        spi_ss <= 1'b1;
    else
        spi_ss <= (cnt < 8'h70 || cnt >= 8'hf0);

always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        spi_sck <= 1'b0;
        spi_mosi <= 1'b0;
    end else begin
        if (cnt >= 8'h80 && cnt <= 8'he0) begin
            spi_sck  <= cnt[0];
            spi_mosi <= (cnt == 8'h80 || cnt == 8'h81 || cnt == 8'h86 || cnt == 8'h87);
        end
    end

always @ (posedge clk or negedge rstn)
    if (~rstn) begin
        id_valid <= 1'b0;
        id <= 0;
    end else begin
        id_valid <= (cnt==8'hfe) ? 1'b1 : 1'b0;
        if (cnt > 8'hc0 && cnt < 8'he0 && cnt[0])
            id <= {id[14:0], spi_miso};
    end

endmodule
