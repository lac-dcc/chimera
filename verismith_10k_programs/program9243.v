module top
#(parameter param36 = ((((((8'hb8) ? (8'h9e) : (8'h9d)) ? ((8'ha8) || (7'h41)) : ((8'h9c) ? (8'hb2) : (8'h9c))) >> {((8'hbc) != (8'hba))}) ? {(^~(~|(8'ha9))), {((8'hb2) ? (8'h9d) : (8'haa)), (8'ha3)}} : ((!((8'hb0) > (8'had))) ? ((~&(7'h43)) ? (~&(8'h9d)) : (&(8'hb5))) : (((7'h41) ? (8'h9e) : (8'hbd)) ? (^(8'h9c)) : (~(8'hba))))) ? (8'hba) : ({(((8'haa) - (8'ha6)) <<< ((8'ha0) ? (8'hae) : (8'hb9))), (~&(+(7'h44)))} != {(+((8'ha4) ? (8'hb0) : (8'hb6))), (8'hb4)})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire23;
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire10,
                 wire23,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2;
      reg6 <= $unsigned(({$unsigned($unsigned(wire1)),
          $signed(wire3[(3'h4):(1'h1)])} >>> {$unsigned(wire4[(4'hd):(3'h6)])}));
      reg7 <= (8'hab);
      reg8 <= wire2;
      reg9 <= ($unsigned(($signed((8'hbe)) ~^ (8'hac))) || $signed(($signed(reg6) << wire2[(2'h2):(1'h1)])));
    end
  assign wire10 = (~|{(wire3 ?
                          ($signed(reg7) != wire0) : $unsigned($unsigned(wire3)))});
  module11 #() modinst24 (.wire14(reg9), .wire12(reg5), .clk(clk), .wire13(wire0), .wire15(wire1), .wire16(wire2), .y(wire23));
  assign wire25 = (^(~|(^((~^reg6) <= (wire4 || wire2)))));
  assign wire26 = ($signed(($signed(reg9[(4'hb):(1'h0)]) && $signed($signed(wire3)))) ?
                      ($signed(reg9) ?
                          ($signed({wire3}) ?
                              ((wire25 ? reg7 : wire0) ?
                                  {reg7} : {wire4,
                                      wire1}) : (7'h40)) : ($signed((wire10 ?
                                  wire25 : wire1)) ?
                              reg9 : $unsigned($unsigned(wire25)))) : reg7);
  assign wire27 = {wire0[(4'hb):(1'h0)], reg9[(3'h4):(3'h4)]};
  assign wire28 = wire2[(4'ha):(4'ha)];
  always
    @(posedge clk) begin
      reg29 <= wire27[(1'h0):(1'h0)];
      reg30 <= ((&$unsigned(((+reg29) >= wire4))) ?
          ((wire1[(4'ha):(3'h6)] ?
              $unsigned($signed((8'ha5))) : (reg6[(2'h3):(2'h2)] * (wire23 ?
                  (8'hb3) : wire2))) != ({{reg29}} ?
              ($unsigned(reg5) <= (^wire27)) : reg7)) : ((|reg29) ?
              wire3 : ((wire3[(3'h4):(1'h0)] && reg29) <<< ((8'ha2) ?
                  $unsigned(wire27) : {reg5}))));
      reg31 <= (8'hba);
      reg32 <= wire2[(2'h3):(1'h0)];
      reg33 <= (wire1[(4'h9):(1'h0)] <<< $unsigned($unsigned(wire25)));
    end
  assign wire34 = reg31;
  assign wire35 = wire34[(3'h4):(3'h4)];
endmodule

module module11
#(parameter param22 = ((((~^((8'ha1) ? (8'hb0) : (8'ha3))) <= (-((7'h41) ? (7'h40) : (8'ha6)))) ? ((((8'ha4) ? (8'hb3) : (8'ha1)) >>> ((8'hb4) > (8'ha0))) ? {((8'hb0) >>> (8'hbc))} : ((&(8'had)) ? ((8'haa) * (8'hb9)) : ((8'hb5) ? (8'hba) : (8'h9e)))) : ({(!(8'hba))} > (^~((8'ha3) || (7'h42))))) || (8'hb8)))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  assign y = {wire21, wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = $signed($unsigned((((wire13 < (8'h9e)) ?
                          $signed(wire14) : $signed((8'hbb))) ?
                      $signed($signed(wire12)) : ((wire16 ? (7'h42) : wire13) ?
                          wire12[(2'h3):(1'h0)] : wire16))));
  assign wire18 = $signed((~|(+$unsigned((wire15 ? wire17 : wire14)))));
  assign wire19 = (~$signed(wire12));
  assign wire20 = ((|$unsigned(wire18[(4'hc):(4'ha)])) == (+$unsigned($signed(wire13))));
  assign wire21 = $unsigned(wire14);
endmodule
