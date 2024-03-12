`default_nettype none
module flash_top(/*autoport*/
//inout
           flash_data,
//output
           bus_data_o,
           bus_stall,
           flash_address,
           flash_we_n,
           flash_byte_n,
           flash_oe_n,
           flash_rp_n,
           flash_ce,
           flash_vpen,
//input
           clk_bus,
           rst_n,
           bus_address,
           bus_data_i,
           bus_read,
           bus_write);

input wire clk_bus;
input wire rst_n;

input wire[23:0] bus_address;
input wire[31:0] bus_data_i;
output wire[31:0] bus_data_o;
input wire bus_read;
input wire bus_write;
output wire bus_stall;

output wire[21:0] flash_address;
inout wire[15:0] flash_data;
output wire flash_we_n;
output wire flash_byte_n;
output wire flash_oe_n;
output wire flash_rp_n;
output wire[2:0] flash_ce;
output wire flash_vpen;

parallel_ifce #(.RW_BUS_CYCLE(3)) f_ifce(
  .clk_bus    (clk_bus),
  .rst_n      (rst_n),
  .bus_address(bus_address),
  .bus_data_i (bus_data_i),
  .bus_data_o (bus_data_o),
  .bus_read   (bus_read),
  .bus_write  (bus_write),
  .bus_stall  (bus_stall),
  .dev_address({flash_address,2'bzz}),
  .dev_data   ({{16{1'bz}},flash_data}),
  .dev_we_n   (flash_we_n),
  .dev_oe_n   (flash_oe_n),
  .dev_ce_n   ()
);

assign flash_rp_n = rst_n;
assign flash_byte_n = 1'b1;
assign flash_ce = 3'b000;
assign flash_vpen = 1'b1;

endmodule
