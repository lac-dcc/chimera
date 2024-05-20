// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../cpu/cpu.v"
`include "../vga/vga_sync.v"
`include "../vga/framebuffer.v"
`include "../io_controller/io_controller.v"
`include "../clock_reducer/clk_reducer.v"
`include "../fifo/sync_dual_port_ram.v"


module top_module(
  input clk,
  input reset,
  input ps2c,
  input ps2d,
  output [7:0] rgb_out,
  output hsync,
  output vsync
);

localparam RAM_SIZE = 4096;
localparam STATE_RUN = 1'b0; 
localparam STATE_BOOT = 1'b1;

wire [31:0] id_bus;
wire [31:0] ia_bus;
wire [31:0] data_bus;
wire [31:0] addr_bus;
wire [15:0] mask_bus;
wire [31:0] mrd;
wire [31:0] io_ia_in;
wire [31:0] ram_wdata_in;
wire [31:0] boot_instruct_bus;
wire [31:0] cpu_id_in;
wire [7:0] rgb;
wire ram_en;
wire wr;
wire done;
wire sclk;

reg state;

assign rgb_out = rgb;

clk_reducer slower (
  .master_clk(clk),
  .slow_clk(sclk),
  .reset(reset)
);

x_bit_mux_2 #(.WIDTH(32)) io_boot (
  .a(ia_bus),
  .b(addr_bus),
  .s(0),
  .out(io_ia_in)
);

x_bit_mux_2 #(.WIDTH(32)) ram_boot (
  .a(data_bus),
  .b(id_bus),
  .s(0),
  .out(ram_wdata_in)
);

x_bit_mux_2 #(.WIDTH(32)) cpu_boot (
  .a(id_bus),
  .b(boot_instruct_bus),
  .s(0),
  .out(cpu_id_in)
);

simple_dual_ram #(.SIZE(32), .DEPTH(4096)) rammy (
.wclk(clk),
.waddr(addr_bus[13:2]),
.write_data(ram_wdata_in),
.write_en(ram_en),
.rclk(~clk),
.raddr(addr_bus[13:2]),
.read_data(mrd)
);


cpu cpu0 (
  .clk(sclk),
  .id(cpu_id_in),
  .mrd(mrd),
  .irq(),
  .reset(reset),
  .ia(ia_bus),
  .wr(wr),
  .data_out(data_bus),
  .addr_out(addr_bus),
  .wr_mask(mask_bus)
);


io_controller io (
  .addr_in(addr_bus),
  .data_in(data_bus),
  .ia(io_ia_in),
  .id(id_bus),
  .wr(wr),
  .wr_mask(mask_bus),
  .clk(clk),
  .reset(reset),
  .irq(),
  .rgb(rgb),
  .ram_en(ram_en),
  .mrd(mrd),
  .hsync(hsync),
  .vsync(vsync)
);

start_up_rom boot (
  .clk(clk),
  .rst(reset),
  .instruction_address(ia_bus),
  .instruction_data(boot_instruct_bus),
  .done(done)
);

always @(posedge clk or posedge reset) begin
  if (reset == 1'b1) begin
    state <= STATE_BOOT;
  end 
end

always @(posedge clk) begin
  case (state)
    STATE_BOOT: begin
      if(done) begin
        state <= STATE_RUN;
      end
    end
    STATE_RUN: begin
      if (reset) begin
        state <= STATE_BOOT;
      end
    end
  endcase
end

endmodule
