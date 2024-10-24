module top
#(parameter param12 = ((&(((~|(8'hba)) ~^ (~^(8'hba))) ? (!((8'hbc) ? (7'h42) : (8'h9c))) : ((~&(8'hae)) ? {(8'haa), (8'h9f)} : ((8'ha1) - (8'hbc))))) != (~|((8'had) ^~ (((8'ha0) ? (8'ha7) : (7'h43)) ? (8'ha9) : (&(8'haf)))))), 
parameter param13 = (!({((param12 ? param12 : param12) ? (param12 && (8'hba)) : param12)} ? ((param12 || {param12, param12}) ~^ (^((7'h42) || param12))) : (((param12 ? param12 : param12) ^ ((8'hb7) ? param12 : param12)) ^~ param12))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire11, wire10, wire4, reg9, reg8, reg7, reg6, reg5, (1'h0)};
  assign wire4 = wire0[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg5 <= $signed(wire3[(4'hb):(1'h1)]);
      reg6 <= (reg5 - {wire2});
      reg7 <= ($signed(wire3[(4'hd):(3'h5)]) ?
          (-($unsigned((8'h9f)) - $signed((wire0 ?
              wire1 : reg6)))) : wire1[(2'h3):(2'h2)]);
      reg8 <= $unsigned($signed((8'hb1)));
      reg9 <= (~|($signed(reg5[(1'h1):(1'h1)]) ?
          (((^~(8'hb9)) ^ reg7) ^ (~^{wire3,
              wire1})) : $unsigned($unsigned(wire0[(1'h0):(1'h0)]))));
    end
  assign wire10 = $unsigned(((|((wire4 & reg5) ? $signed(reg8) : (8'hb3))) ?
                      ($signed((wire0 == reg6)) ?
                          (wire4[(1'h1):(1'h0)] ~^ $unsigned(wire3)) : (+$unsigned((8'h9d)))) : wire1));
  assign wire11 = reg7;
endmodule
