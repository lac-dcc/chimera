module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire4, reg12, reg11, reg10, reg9, reg8, reg7, reg6, reg5, (1'h0)};
  assign wire4 = $signed(wire2);
  always
    @(posedge clk) begin
      reg5 <= (~&wire2[(1'h1):(1'h0)]);
      reg6 <= ($unsigned((|$signed((wire1 && wire3)))) >> ((wire3[(1'h0):(1'h0)] ?
              $unsigned(wire3) : $unsigned((wire1 ? wire3 : wire4))) ?
          $signed((+$signed(wire0))) : wire4));
      reg7 <= wire4[(4'he):(4'he)];
    end
  always
    @(posedge clk) begin
      reg8 <= (^~$signed($unsigned(wire2)));
      reg9 <= reg7;
      reg10 <= wire4;
    end
  always
    @(posedge clk) begin
      reg11 <= wire1[(4'hc):(1'h0)];
      reg12 <= wire0[(5'h11):(4'hd)];
    end
endmodule
