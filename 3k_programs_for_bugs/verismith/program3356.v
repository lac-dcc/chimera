module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire53;
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire4,
                 wire53,
                 (1'h0)};
  assign wire4 = wire3[(2'h2):(1'h1)];
  module5 #() modinst54 (wire53, clk, wire2, wire0, wire3, wire1, wire4);
  assign wire55 = $signed($unsigned(wire0));
  assign wire56 = $signed(($unsigned(wire1[(2'h3):(2'h3)]) != wire53));
  assign wire57 = wire2;
  assign wire58 = wire56;
  assign wire59 = $signed(wire3);
  assign wire60 = $unsigned(wire3[(5'h15):(2'h2)]);
  assign wire61 = wire1[(2'h3):(1'h1)];
  assign wire62 = (!wire56);
endmodule

module module5
#(parameter param51 = (({{((8'hae) < (8'ha2))}, ((8'ha6) ? (^~(8'ha3)) : {(7'h42), (8'hb7)})} == ((((7'h40) ? (8'haf) : (8'h9f)) << ((7'h42) && (8'h9f))) + (((8'h9f) >>> (8'h9c)) ? {(8'ha9), (8'hb0)} : (~&(8'ha4))))) ? {{((^~(8'ha0)) * ((8'hb6) ~^ (8'hba))), (((8'hac) << (7'h40)) > ((8'ha3) ? (8'hbc) : (7'h40)))}} : {(|(~&((7'h44) ? (8'ha8) : (8'h9f))))}), 
parameter param52 = ((param51 <= ({{param51, param51}} ^ (-((8'hb6) | param51)))) ? (param51 ? (((param51 ? param51 : param51) <= param51) > (8'hbe)) : (param51 && ({param51, (8'ha6)} ? (param51 ? (7'h40) : param51) : param51))) : ((({param51} ? (~^param51) : {param51}) | {(param51 ? param51 : param51)}) + (((param51 ? param51 : param51) ? param51 : (param51 | param51)) ? (param51 ? (param51 ~^ (8'h9c)) : ((8'hb9) ? (8'ha9) : (8'hb7))) : ((param51 ? param51 : param51) ? (param51 | param51) : param51)))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire6;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire46;
  assign y = {wire50, wire49, wire48, wire11, wire12, wire46, (1'h0)};
  assign wire11 = ((^$signed((wire9 ? (8'ha1) : $signed(wire9)))) ?
                      wire7[(5'h11):(4'h9)] : (wire9[(2'h3):(2'h3)] ?
                          wire10[(4'hb):(3'h6)] : wire9[(3'h4):(1'h0)]));
  assign wire12 = wire9[(2'h2):(1'h0)];
  module13 #() modinst47 (wire46, clk, wire9, wire7, wire6, wire8, wire10);
  assign wire48 = $unsigned($unsigned((^~($unsigned(wire6) ~^ wire11[(3'h7):(1'h1)]))));
  assign wire49 = ({wire11,
                          (wire46[(4'h9):(1'h0)] * $unsigned($signed(wire6)))} ?
                      ($signed(($signed(wire7) ?
                          (~^wire48) : wire11)) & wire8) : (~|$signed(wire7[(5'h12):(4'hd)])));
  assign wire50 = (wire49[(4'hc):(4'h8)] >> (wire7 << (wire46[(3'h7):(3'h5)] != $unsigned($unsigned(wire46)))));
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  input wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire38,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire19 = ({$signed(wire14)} ?
                      {$unsigned($unsigned($signed((8'hb4))))} : ($unsigned(wire18[(2'h2):(2'h2)]) ?
                          (((wire18 ? (8'hb1) : wire16) ?
                                  (~&wire16) : (|wire17)) ?
                              {$unsigned(wire17)} : {(8'hac),
                                  (wire18 ^~ wire18)}) : wire17));
  assign wire20 = (wire19 ?
                      $unsigned($signed((+$signed(wire19)))) : (wire19[(1'h0):(1'h0)] ?
                          {(wire16[(4'hb):(3'h5)] <<< (wire14 ?
                                  (8'ha8) : wire18)),
                              (wire19 ^ $unsigned(wire18))} : $unsigned((wire14 ?
                              $signed(wire14) : $unsigned(wire17)))));
  assign wire21 = ({$signed((^~(~(8'h9e)))),
                          (wire15[(4'ha):(1'h0)] * $unsigned({wire19}))} ?
                      (~^{$signed((wire18 && wire18)),
                          ((~&wire14) - wire19[(2'h3):(2'h3)])}) : {$signed(wire16[(4'h8):(2'h2)])});
  assign wire22 = ($unsigned((((^~wire21) || $signed(wire21)) ?
                      (~$unsigned(wire19)) : $unsigned(wire17[(4'h8):(2'h2)]))) * wire16);
  assign wire23 = wire14;
  assign wire24 = (-wire22);
  assign wire25 = (($signed($unsigned((wire24 & wire22))) >> (wire14 - wire22[(3'h7):(3'h7)])) ?
                      $signed(($signed((wire21 ?
                          wire22 : wire18)) != (7'h44))) : $unsigned((-(wire20[(4'h9):(3'h7)] ?
                          {wire14} : (wire21 << (8'hba))))));
  assign wire26 = {wire17};
  assign wire27 = $signed((^wire24[(4'h8):(1'h1)]));
  assign wire28 = wire14[(2'h3):(1'h1)];
  assign wire29 = (wire23[(3'h6):(2'h3)] ?
                      (&({$signed(wire21),
                          {wire18}} < wire17[(4'h8):(2'h3)])) : wire22[(2'h3):(1'h1)]);
  assign wire30 = $unsigned((^wire14[(2'h3):(1'h1)]));
  assign wire31 = $unsigned((&(8'hbe)));
  assign wire32 = wire30[(4'h9):(2'h3)];
  assign wire33 = wire19[(1'h1):(1'h1)];
  assign wire34 = $signed({$unsigned($signed((~&wire20)))});
  assign wire35 = $unsigned($unsigned($unsigned($signed($signed(wire16)))));
  always
    @(posedge clk) begin
      reg36 <= wire24;
      reg37 <= ($signed($unsigned(((~^wire19) ?
              wire28 : ((8'hb5) ? (8'ha2) : wire19)))) ?
          {$signed({wire19})} : $signed((wire23 ?
              ((reg36 != wire35) > (~|wire32)) : (~wire20))));
    end
  assign wire38 = wire19;
  always
    @(posedge clk) begin
      reg39 <= $unsigned(wire29);
      reg40 <= ($unsigned(wire20) ?
          ((+wire28[(1'h1):(1'h0)]) ^~ (wire16[(3'h7):(3'h7)] ?
              $unsigned((~reg36)) : (!wire19[(3'h4):(1'h0)]))) : reg39[(1'h1):(1'h1)]);
      reg41 <= reg40;
      reg42 <= reg36[(2'h3):(1'h1)];
      reg43 <= $signed({wire19[(2'h2):(1'h1)],
          (($signed((8'hb0)) ? $unsigned(reg41) : wire34) * wire22)});
    end
  assign wire44 = wire17[(1'h1):(1'h0)];
  assign wire45 = ((8'ha5) >> ((wire22[(4'hb):(4'h8)] && ((wire31 ?
                      wire29 : (8'hbe)) != (wire20 ^ wire22))) << $signed(wire20[(4'hc):(1'h0)])));
endmodule
