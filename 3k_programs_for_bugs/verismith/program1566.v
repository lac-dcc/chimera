module top
#(parameter param12 = (({(7'h41)} ? (~(|{(8'hb3)})) : ((-((8'hb9) ? (8'hb5) : (8'ha5))) ~^ ((7'h44) ? ((8'haa) <= (8'hba)) : ((8'ha2) < (7'h40))))) - (((((8'h9c) ~^ (8'hbe)) && ((7'h40) >= (8'hb9))) ^~ {((8'hb9) ^ (8'hb5))}) ? {(^~((8'had) || (8'hbe)))} : (~^(~|((8'ha7) ? (7'h41) : (8'ha2)))))), 
parameter param13 = param12)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire11, wire10, wire9, wire5, wire4, reg8, reg7, reg6, (1'h0)};
  assign wire4 = {wire2[(4'hf):(4'hb)]};
  assign wire5 = $signed(wire2[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg6 <= $unsigned((~^$unsigned($signed((^wire0)))));
      reg7 <= $signed((wire4[(2'h2):(1'h0)] ? (^~wire1) : reg6));
      reg8 <= $unsigned(wire3[(2'h2):(2'h2)]);
    end
  assign wire9 = reg6;
  assign wire10 = wire3[(2'h2):(2'h2)];
  assign wire11 = ($signed((~^$signed($signed(wire3)))) ?
                      wire10[(4'he):(4'hc)] : $signed($unsigned(wire1)));
endmodule
