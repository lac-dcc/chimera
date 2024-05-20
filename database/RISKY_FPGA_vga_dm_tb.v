// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module dm_tb();

localparam DURATION = 100000;

reg clk;
reg reset;

reg [31:0] addr_out;
reg [31:0] data_out;
reg wr;

wire hsync;
wire vsync;
wire [7:0] rgb;
wire [9:0] x;
wire [9:0] y;
wire ptk;

display_module dm0 (
  .clk(clk),
  .rst(reset),
  .data(data_out),
  .waddr(addr_out),
  .w_en(wr),
  .rgb(rgb),
  .hsync(hsync),
  .vsync(vsync),
  .x_out(x),
  .y_out(y),
  .ptk(ptk)
);


initial begin
  reset <= 1;
  #5
  reset <= 0;
  #5
  // wr but not good address
  clk <= 1;
  wr <= 1;
  addr_out <= 32'h00000001;
  data_out <= 32'h000000FF;
  #5;
  clk <= 0;
  #5;
  // wr and good address
  clk <= 1;
  wr <= 1;
  addr_out <= 32'h10000001;
  data_out <= 32'h000000FF;
  #5;
  clk <= 0;
  #5;
  // no wr but good address
  clk <= 1;
  wr <= 0;
  addr_out <= 32'h10000001;
  data_out <= 32'h000000FF;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  #5
  clk <= 0;
  #5
  clk <= 1;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  wr <= 1;
  addr_out <= 32'h10000000;
  data_out <= 32'h000000FF;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  wr <= 1;
  addr_out <= 32'h10000281;
  data_out <= 32'h000000FF;
  #5;
  clk <= 0;
  #5;

  clk <= 1;
  wr <= 1;
  addr_out <= 32'h10000502;
  data_out <= 32'h000000FF;
  #5;
  clk <= 0;
  #5;
  clk <= 1;
  wr <= 1;
  addr_out <= 32'h10000a04;
  data_out <= 32'h000000FF;
  #5;
  clk <= 0;
  #5;
  forever begin
    #5 clk <= ~clk;
  end
end


  
initial begin
  $dumpfile("dm_tb.vcd");
  $dumpvars(0, dm_tb);
  #(DURATION)
  $display("Finished!");
  $finish;
end

endmodule


