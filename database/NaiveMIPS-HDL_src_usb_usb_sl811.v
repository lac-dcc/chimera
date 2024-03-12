`default_nettype none
module usb_sl811 (/*autoport*/
//inout
      sl811_data,
//output
      bus_data_o,
      bus_stall,
      bus_irq,
      sl811_a0,
      sl811_we_n,
      sl811_rd_n,
      sl811_cs_n,
      sl811_rst_n,
      sl811_drq,
//input
      clk_bus,
      rst_n,
      bus_address,
      bus_data_i,
      bus_read,
      bus_write,
      sl811_dack,
      sl811_int);

input wire clk_bus;
input wire rst_n;

input wire[2:0] bus_address;
input wire[31:0] bus_data_i;
output wire[31:0] bus_data_o;
input wire bus_read;
input wire bus_write;
output wire bus_stall;
output reg bus_irq;

output wire sl811_a0;
inout wire[7:0] sl811_data;
output wire sl811_we_n;
output wire sl811_rd_n;
output wire sl811_cs_n;
output wire sl811_rst_n;
input wire sl811_dack;
input wire sl811_int;
output wire sl811_drq;

parallel_ifce #(.RW_BUS_CYCLE(4)) u_ifce(
  .clk_bus    (clk_bus),
  .rst_n      (rst_n),
  .bus_address({21'h0,bus_address}),
  .bus_data_i (bus_data_i),
  .bus_data_o (bus_data_o[7:0]),
  .bus_read   (bus_read),
  .bus_write  (bus_write),
  .bus_stall  (bus_stall),
  .dev_address({sl811_a0,2'bzz}),
  .dev_data   ({{24{1'bz}},sl811_data}),
  .dev_we_n   (sl811_we_n),
  .dev_oe_n   (sl811_rd_n),
  .dev_ce_n   (sl811_cs_n)
);

reg irq_sync;
always @(posedge clk_bus or negedge rst_n) begin : proc_irq
  if(~rst_n) begin
    bus_irq <= 0;
    irq_sync <= 0;
  end else begin
    irq_sync <= sl811_int;
    bus_irq <= irq_sync;
  end
end

assign bus_data_o[31:8] = 24'b0;

assign sl811_rst_n = rst_n;
assign sl811_drq = 1'b1;

endmodule