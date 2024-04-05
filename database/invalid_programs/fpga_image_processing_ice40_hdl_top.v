`include "../../hdl/image_processing.v"
`include "ram_interface.v"
`include "spi_interface.v"

module top(input [3:0] SW, input clk, output LED_R, output LED_G, output LED_B, input SPI_SCK, input SPI_SS, input SPI_MOSI, output SPI_MISO);

reg [2:0] led;

//leds are active low
assign LED_R = ~led[0];
assign LED_G = ~led[1];
assign LED_B = ~led[2];

reg reset_ip;

wire [31:0] ip_mem_addr;
wire ip_mem_wr_en;
wire ip_mem_rd_en;
wire [15:0] ip_mem_data_write;
wire [15:0] ip_mem_data_read;
wire ip_mem_data_read_valid;

wire [7:0] ip_comm_cmd;
wire [7:0] ip_comm_data_in;
wire ip_comm_data_in_valid;
wire [7:0] ip_comm_data_out;
wire ip_comm_data_out_valid;
wire ip_comm_data_out_free;

wire [2:0] spi_led_debug;

image_processing image_processing(.clk(clk), .reset(reset_ip),
   .addr(ip_mem_addr), .wr_en(ip_mem_wr_en), .rd_en(ip_mem_rd_en), .data_read(ip_mem_data_read), .data_read_valid(ip_mem_data_read_valid), .data_write(ip_mem_data_write),
   .comm_cmd(ip_comm_cmd), .comm_data_in(ip_comm_data_in), .comm_data_in_valid(ip_comm_data_in_valid), .comm_data_out(ip_comm_data_out), .comm_data_out_valid(ip_comm_data_out_valid),
   .comm_data_out_free(ip_comm_data_out_free)
);

ram_interface ram_interface(.clk(clk), .addr(ip_mem_addr), .wr_en(ip_mem_wr_en), .rd_en(ip_mem_rd_en),
   .data_write(ip_mem_data_write), .data_read(ip_mem_data_read), .data_read_valid(ip_mem_data_read_valid)
);

spi_interface spi_interface(.clk(clk), .spi_sck(SPI_SCK), .spi_ss(SPI_SS), .spi_mosi(SPI_MOSI), .spi_miso(SPI_MISO),
   .spi_cmd(ip_comm_cmd), .spi_data_out(ip_comm_data_in), .spi_data_out_valid(ip_comm_data_in_valid), .spi_data_in(ip_comm_data_out), .spi_data_in_valid(ip_comm_data_out_valid),
   .spi_data_in_free(ip_comm_data_out_free), .led_debug(spi_led_debug)
);

initial begin
   led <= 3'b000;
end

always @(posedge clk)
begin
   led <= spi_led_debug;
end

endmodule
