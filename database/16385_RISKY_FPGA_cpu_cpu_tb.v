// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module cpu_tb();

localparam WIDTH = 32;
localparam DURATION = 10000;

reg clk;
reg reset;
reg irq;

reg [31:0] id;
reg [31:0] mrd;
wire wr;
wire [31:0] data_out;
wire [31:0] addr_out;
wire [15:0] wr_mask;

wire [31:0] ia_bus;

reg [31:0] test_memory [10:0];

cpu cpu0 (
  .id(id),
  .mrd(mrd),
  .irq(irq),
  .clk(clk),
  .reset(reset),
  .ia(ia_bus),
  .wr(wr),
  .data_out(data_out),
  .addr_out(addr_out),
  .wr_mask(wr_mask)
);

initial begin
  $readmemh("instruction_8.mem", test_memory);
  clk <= 1'b0;
  irq <= 1'b0;
  reset = 1'b1;
  reset = 1'b0;
  id <= test_memory[ia_bus/4];
  forever begin
    #10 clk <= ~clk;
  end
end


always @ (*) begin
  mrd <= 32'b1111_1111_1111_1111_1111_1111_1111_1111;
  id <= test_memory[ia_bus/4];
end

initial begin
  $dumpfile("cpu_tb.vcd");
  $dumpvars(0, cpu_tb);
  #(DURATION)
  $display("Finished!");
  $finish;
end

endmodule
