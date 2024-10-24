module top
#(parameter param21 = ({((~|(~|(8'ha9))) ? (8'hb2) : {((8'hb6) + (8'hbf)), ((8'hba) ? (8'haa) : (8'haa))}), (^({(8'hb4), (8'hb8)} != ((8'ha3) ? (8'ha1) : (8'h9d))))} ? (((+{(8'ha8), (8'h9c)}) && (8'ha7)) ? ((((8'hb6) ? (8'hb4) : (7'h43)) ? {(8'ha0)} : (~(8'hba))) > {(8'hac), (~(8'ha5))}) : ((((8'hbd) ? (8'h9d) : (8'hb8)) ? (8'hbc) : ((8'hae) >> (8'hb5))) ? {(&(8'hb2))} : (-((8'hb2) * (8'h9e))))) : {((~^(8'hac)) - ((^(8'hac)) ? ((8'h9c) ? (8'ha5) : (8'haf)) : ((8'hb7) ? (8'hb3) : (8'hb2)))), {{((7'h40) <<< (8'ha1))}}}), 
parameter param22 = (^(~^({((8'ha0) ? param21 : param21)} ? (&(param21 ? param21 : (8'haa))) : (param21 ? {param21, param21} : (+param21))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire19;
  assign y = {wire4, wire5, wire6, wire19, (1'h0)};
  assign wire4 = (+wire1[(3'h7):(1'h1)]);
  assign wire5 = (~^wire4);
  assign wire6 = ((|wire1[(2'h2):(1'h1)]) > (~^(-$unsigned((wire0 ?
                     wire2 : wire4)))));
  module7 #() modinst20 (.wire12(wire2), .y(wire19), .wire8(wire0), .wire9(wire1), .wire11(wire5), .wire10(wire4), .clk(clk));
endmodule

module module7
#(parameter param17 = (~(((^{(8'hbe), (8'hbc)}) & (7'h44)) ? (-(((7'h41) ? (8'hbd) : (8'hb3)) + ((8'ha1) & (8'ha2)))) : ((((8'hae) <= (8'hb6)) ? (~&(8'hb0)) : ((7'h40) ? (8'hac) : (8'h9c))) ? (~((8'hba) ? (8'hb1) : (8'ha9))) : (8'hb1)))), 
parameter param18 = (param17 ? (param17 >>> (({param17, param17} ? param17 : ((8'ha4) ~^ param17)) ? param17 : {((8'ha8) * param17)})) : (+({(|param17)} >>> param17))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h20):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  assign y = {wire15, wire14, wire13, reg16, (1'h0)};
  assign wire13 = wire8;
  assign wire14 = $unsigned($unsigned((wire9 ?
                      wire11 : {(wire12 | wire10), (^wire8)})));
  assign wire15 = (~|wire9[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg16 <= $signed($signed((($unsigned(wire10) ?
              (wire11 >= wire8) : (wire13 <<< wire15)) ?
          (^$unsigned(wire13)) : (wire14[(4'h8):(3'h4)] <= $signed(wire12)))));
    end
endmodule
