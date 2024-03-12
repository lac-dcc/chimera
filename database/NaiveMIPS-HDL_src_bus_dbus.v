`default_nettype none
module dbus(/*autoport*/
//output
            master_rddata,
            master_stall,
            uart_address,
            uart_data_i,
            uart_rd,
            uart_wr,
            gpio_address,
            gpio_data_i,
            gpio_rd,
            gpio_wr,
            ticker_address,
            ticker_data_i,
            ticker_rd,
            ticker_wr,
            gpu_address,
            gpu_data_i,
            gpu_rd,
            gpu_wr,
            ram_address,
            ram_data_i,
            ram_data_enable,
            ram_rd,
            ram_wr,
            flash_address,
            flash_data_i,
            flash_data_enable,
            flash_rd,
            flash_wr,
            usb_data_i,
            usb_address,
            usb_read,
            usb_write,
//input
            master_address,
            master_byteenable,
            master_read,
            master_write,
            master_wrdata,
            uart_data_o,
            gpio_data_o,
            ticker_data_o,
            gpu_data_o,
            ram_data_o,
            ram_stall,
            flash_data_o,
            flash_stall,
            usb_data_o,
            usb_stall);

input wire[31:0] master_address;
input wire[3:0] master_byteenable;
input wire master_read;
input wire master_write;
input wire[31:0] master_wrdata;
output reg[31:0] master_rddata;
output reg master_stall;

output wire[3:0] uart_address;
output wire[31:0] uart_data_i;
input wire[31:0] uart_data_o;
output reg uart_rd;
output reg uart_wr;

output wire[7:0] gpio_address;
output wire[31:0] gpio_data_i;
input wire[31:0] gpio_data_o;
output reg gpio_rd;
output reg gpio_wr;

output wire[7:0] ticker_address;
output wire[31:0] ticker_data_i;
input wire[31:0] ticker_data_o;
output reg ticker_rd;
output reg ticker_wr;

output wire[23:0] gpu_address;
output wire[31:0] gpu_data_i;
input wire[31:0] gpu_data_o;
output reg gpu_rd;
output reg gpu_wr;

output wire[23:0] ram_address;
output wire[31:0] ram_data_i;
input wire[31:0] ram_data_o;
output wire[3:0] ram_data_enable;
output reg ram_rd;
output reg ram_wr;
input wire ram_stall;

output wire[23:0] flash_address;
output wire[31:0] flash_data_i;
input wire[31:0] flash_data_o;
output wire[3:0] flash_data_enable;
output reg flash_rd;
output reg flash_wr;
input wire flash_stall;

input wire [31:0]usb_data_o;
output wire [31:0]usb_data_i;
output wire [2:0]usb_address;
output reg usb_read;
output reg usb_write;
input wire usb_stall;

assign ram_data_enable = master_byteenable;
assign ram_data_i = master_wrdata;
assign ram_address = master_address[23:0];

assign flash_data_enable = master_byteenable;
assign flash_data_i = master_wrdata;
assign flash_address = master_address[23:0];

assign usb_data_i = master_wrdata;
assign usb_address = master_address[2:0];

assign uart_data_i = master_wrdata;
assign uart_address = master_address[3:0];

assign gpio_data_i = master_wrdata;
assign gpio_address = master_address[7:0];

assign ticker_data_i = master_wrdata;
assign ticker_address = master_address[7:0];

assign gpu_data_i = master_wrdata;
assign gpu_address = master_address[23:0];

always @(*) begin
    ram_rd <= 1'b0;
    ram_wr <= 1'b0;
    flash_rd <= 1'b0;
    flash_wr <= 1'b0;
    uart_rd <= 1'b0;
    uart_wr <= 1'b0;
    gpio_rd <= 1'b0;
    gpio_wr <= 1'b0;
    ticker_rd <= 1'b0;
    ticker_wr <= 1'b0;
    gpu_rd <= 1'b0;
    gpu_wr <= 1'b0;
    usb_read <= 1'b0;
    usb_write <= 1'b0;
    master_rddata <= 32'h0;
    master_stall <= 1'b0;
    if(master_address[31:24] == 8'h00) begin
        ram_rd <= master_read;
        ram_wr <= master_write;
        master_rddata <= ram_data_o;
        master_stall <= ram_stall;
    end else if(master_address[31:24] == 8'h1e) begin
        flash_rd <= master_read;
        flash_wr <= master_write;
        master_rddata <= flash_data_o;
        master_stall <= flash_stall;
    end else if(master_address[31:24] == 8'h1b) begin
        gpu_rd <= master_read;
        gpu_wr <= master_write;
        master_rddata <= gpu_data_o;
    end else if(master_address[31:4] == 28'h1c02000) begin
        usb_read <= master_read;
        usb_write <= master_write;
        master_rddata <= usb_data_o;
        master_stall <= usb_stall;
    end else if(master_address[31:4] == 28'h1fd003f) begin
        uart_rd <= master_read;
        uart_wr <= master_write;
        master_rddata <= uart_data_o;
    end else if(master_address[31:8] == 28'h1fd004) begin
        gpio_rd <= master_read;
        gpio_wr <= master_write;
        master_rddata <= gpio_data_o;
    end else if(master_address[31:8] == 28'h1fd005) begin
        ticker_rd <= master_read;
        ticker_wr <= master_write;
        master_rddata <= ticker_data_o;
    end
end

endmodule
