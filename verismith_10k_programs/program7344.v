module top
#(parameter param12 = ((!(~^(&{(8'ha5)}))) || {{(~|((8'hb8) ? (8'hb8) : (8'hb0)))}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire11, wire10, wire5, wire4, reg9, reg8, reg7, reg6, (1'h0)};
  assign wire4 = wire0[(1'h0):(1'h0)];
  assign wire5 = (wire3 + ($signed($unsigned((~&wire4))) | (~^$unsigned(wire1))));
  always
    @(posedge clk) begin
      reg6 <= wire4[(5'h12):(4'hf)];
    end
  always
    @(posedge clk) begin
      reg7 <= wire3[(1'h0):(1'h0)];
      reg8 <= wire3;
      reg9 <= (reg8[(3'h4):(1'h0)] > $unsigned((((8'h9d) ?
          $signed(reg8) : (wire2 ? (8'h9e) : reg7)) & reg7)));
    end
  assign wire10 = reg8;
  assign wire11 = ($unsigned((~^($signed(wire5) ?
                          (wire1 || wire1) : ((8'ha7) << wire3)))) ?
                      wire5 : (!(!wire4[(4'he):(4'ha)])));
endmodule
