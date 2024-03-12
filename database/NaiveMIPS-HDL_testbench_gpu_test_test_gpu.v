`timescale 1ns/1ns
module test_gpu ();

reg clk_bus;
reg clk_pixel;
reg rst_n;
wire de;
wire vsync;
wire hsync;
wire[8:0] pxlData;

reg bus_write;
reg[23:0] bus_address;
reg[31:0] bus_data_i;

gpu dut( 
    .clk_bus  (clk_bus),
    .clk_pixel(clk_pixel),
    .rst_n    (rst_n),
    .bus_read (1'b0),
    .bus_write(bus_write),
    .bus_address(bus_address),
    .bus_data_i(bus_data_i),
    .bus_stall(),
    .bus_data_o(),
    .de       (de),
    .vsync    (vsync),
    .hsync    (hsync),
    .pxlData  (pxlData)
);

initial begin 
    bus_write = 0;
    clk_bus = 0;
    clk_pixel = 0;
    rst_n = 0;
    #5 rst_n = 1;
    @(negedge clk_bus);
    @(negedge clk_bus);
    @(negedge clk_bus);
    bus_write = 1;
    bus_address = 24'h50000; //REG_PIX_OFFSET
    bus_data_i = 800*2/32; //offset = 2 line
    @(negedge clk_bus);
    bus_address = 0;
    bus_data_i = 32'haaaaaaaa;
    @(negedge clk_bus);
    bus_address = (800*600/32-1)*4;
    bus_data_i = 32'h55555555;
    @(negedge clk_bus);
    bus_write = 0;
end

always #10 clk_pixel = ~clk_pixel; //50MHz
always #50 clk_bus = ~clk_bus; //10Mhz

endmodule