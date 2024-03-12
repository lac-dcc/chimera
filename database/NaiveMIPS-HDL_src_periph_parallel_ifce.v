`default_nettype none
module parallel_ifce (/*autoport*/
//inout
          dev_data,
//output
          bus_data_o,
          bus_stall,
          dev_address,
          dev_we_n,
          dev_oe_n,
          dev_ce_n,
//input
          clk_bus,
          rst_n,
          bus_address,
          bus_data_i,
          bus_read,
          bus_write);

parameter RW_BUS_CYCLE = 4;

input wire clk_bus;
input wire rst_n;

input wire[23:0] bus_address;
input wire[31:0] bus_data_i;
output reg[31:0] bus_data_o;
input wire bus_read;
input wire bus_write;
output wire bus_stall;

output reg[23:0] dev_address;
inout wire[31:0] dev_data;
output reg dev_we_n;
output reg dev_oe_n;
output reg dev_ce_n;

reg[31:0]dev_wrdata;
reg[3:0] hold_cycle;

always @(posedge clk_bus or negedge rst_n) begin
  if (!rst_n) begin
    dev_address <= 22'b0;
    dev_wrdata <= 16'b0;
    dev_we_n <= 1'b1;
    dev_oe_n <= 1'b1;
    dev_ce_n <= 1'b1;
    hold_cycle <= 4'b0;
    bus_data_o <= 32'h0;
  end else begin
    hold_cycle <= (hold_cycle && hold_cycle < (RW_BUS_CYCLE+1)) ?(hold_cycle+4'b1): 4'b0;
    if ((bus_read || bus_write) && hold_cycle == 4'b0) begin
      dev_address <= bus_address;
      dev_wrdata <= bus_data_i;
      dev_we_n <= ~bus_write;
      dev_oe_n <= ~bus_read;
      dev_ce_n <= 1'b0;
      hold_cycle <= 4'b1;
    end else if(hold_cycle == RW_BUS_CYCLE) begin
      dev_we_n <= 1'b1;
      dev_oe_n <= 1'b1;
      dev_ce_n <= 1'b1;
    end
    if(!dev_oe_n)
      bus_data_o <= dev_data;
  end
end

assign dev_data = (~dev_we_n) ? dev_wrdata : {32{1'bz}};
assign bus_stall = (bus_read || bus_write) && (hold_cycle < (RW_BUS_CYCLE+1));

endmodule
