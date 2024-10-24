module top
#(parameter param11 = ((~^{(+(~|(7'h40)))}) ? {((((8'hab) ? (8'h9f) : (8'hb2)) ? (+(8'h9f)) : ((8'ha5) | (8'hb3))) * ((|(8'ha4)) + (~^(8'haf)))), ((((8'ha5) ? (8'ha6) : (8'hb5)) && {(8'hbb)}) ^~ (((8'h9d) & (8'h9f)) ? ((8'had) * (8'hb2)) : (~^(8'hb1))))} : ((|(((8'hb6) == (7'h43)) & (^~(8'hbd)))) ? (8'hba) : (|{((8'hbf) <= (8'hb4)), {(8'ha8)}}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire8, wire7, reg10, reg9, reg6, reg5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (-$unsigned((({wire0} << $unsigned(wire0)) ?
          wire3 : ($unsigned((8'hae)) ~^ ((8'hb5) ? wire1 : wire1)))));
      reg5 <= $signed({(+($unsigned(wire1) && (8'hb1)))});
      reg6 <= $unsigned(wire3);
    end
  assign wire7 = (wire3[(4'he):(2'h3)] > (&((!$signed(wire2)) <<< $unsigned($unsigned(wire2)))));
  assign wire8 = (~|reg5);
  always
    @(posedge clk) begin
      reg9 <= $signed((^$unsigned((+(wire2 >>> reg6)))));
      reg10 <= (~^(~^wire3));
    end
endmodule
