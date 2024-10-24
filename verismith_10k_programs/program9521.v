module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire9, wire8, wire4, reg7, reg6, reg5, (1'h0)};
  assign wire4 = $unsigned(wire1);
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire4);
      reg6 <= ($signed($unsigned(reg5[(4'hd):(3'h5)])) ?
          {wire2,
              ((~&{wire0}) ?
                  $unsigned({wire2,
                      wire3}) : (+wire1))} : $signed((~(~^wire2))));
      reg7 <= wire1[(1'h1):(1'h0)];
    end
  assign wire8 = $signed((^~$unsigned({wire0, ((8'hb1) ? wire3 : wire2)})));
  assign wire9 = (wire2 <<< ((|$unsigned(wire4[(5'h10):(4'ha)])) || (8'hb8)));
endmodule
