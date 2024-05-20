// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module t77_decode(
  input CLKSYS,
  input start,
  input [15:0] data,
  input data_stb,
  input rewind,
  output reg [24:0] sdram_addr,
  output reg sdram_rd,
  output sout
);

reg clk_9us = 0;
reg pstart;
reg [15:0] counter = 0;
reg s;
reg [14:0] len;
reg sending;
reg [24:0] addr = 25'h62;//25'd16;
reg [15:0] init;

assign sout = s;

always @(posedge CLKSYS) begin
  if (counter >= DIV_9us) begin
    counter <= 16'd0;
    clk_9us <= ~clk_9us;
  end
  else begin
    counter <= counter + 16'd1;
  end
end

always @(posedge CLKSYS) begin
  pstart <= start;
  if (~pstart & start) begin
    init <= 16'h4000;
    $display("--------- motor on ---------");
  end
  if (~start & pstart) begin
    sending <= 1'b0;
    $display("--------- motor off---------");
  end
  if (init) begin
    init <= init - 16'h1;
    if (init == 16'h1) sending <= 1'b1;
  end
end

always @(posedge clk_9us, posedge rewind) begin
  if (rewind) begin
    addr <= 25'd16;
    sdram_addr <= addr;
  end
  else begin
    if (sdram_rd) begin
      if (data_stb) begin
        sdram_rd <= 1'b0;
        s <= data[7];
        len <= { data[6:0], data[15:8] };
      end
    end
    else if (sending) begin
      if (len) begin
        len <= len - 15'd1;
      end
      else begin
        sdram_addr <= addr;
        sdram_rd <= 1'b1;
        addr <= addr + 25'd2;
      end
    end
  end
end


endmodule
