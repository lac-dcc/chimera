module top
#(parameter param80 = (~&(~&((|((7'h44) > (7'h40))) > ({(8'ha9)} ? ((8'h9f) ? (8'hba) : (8'haa)) : ((8'hbf) << (8'ha9)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire72;
  assign y = {wire79, wire78, wire77, wire76, wire75, wire74, wire72, (1'h0)};
  module4 #() modinst73 (wire72, clk, wire3, wire2, wire0, wire1);
  assign wire74 = $unsigned($signed(wire3[(5'h12):(4'hd)]));
  assign wire75 = ((({(wire72 ? wire74 : wire0)} ?
                          (wire3 ? (~&wire2) : wire1[(1'h1):(1'h1)]) : {{wire1},
                              $signed(wire72)}) ^ (8'hbe)) ?
                      wire2[(4'h9):(3'h4)] : (^~$unsigned((8'h9f))));
  assign wire76 = $signed($unsigned(wire3[(5'h10):(4'hd)]));
  assign wire77 = wire0;
  assign wire78 = $signed(wire76);
  assign wire79 = (wire77 ? wire77 : wire76);
endmodule

module module4
#(parameter param70 = ((!(((-(8'had)) > ((8'hb0) | (8'hbe))) | ((8'h9f) ? {(8'hae)} : (^~(8'hb3))))) > (8'hb8)), 
parameter param71 = ((!param70) < (({(~&param70), param70} ? (param70 >= {param70, param70}) : {param70, param70}) * (~(param70 ? (~|param70) : param70)))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire5;
  input wire signed [(4'hf):(1'h0)] wire6;
  input wire [(4'he):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire63;
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire40,
                 wire42,
                 wire43,
                 wire44,
                 wire63,
                 (1'h0)};
  module9 #() modinst41 (wire40, clk, wire8, wire7, wire6, wire5);
  assign wire42 = $signed(((~(wire5 ?
                      (~|wire5) : (~&wire6))) && $signed(((wire7 >> (8'hb7)) ?
                      $unsigned(wire8) : (~^wire5)))));
  assign wire43 = (-$unsigned($unsigned($signed($signed(wire6)))));
  assign wire44 = (((($signed(wire40) >>> $unsigned(wire43)) ?
                          ((wire40 || (8'hbe)) ?
                              $signed(wire42) : $unsigned((8'hba))) : $unsigned(wire43)) - wire6[(4'hf):(1'h0)]) ?
                      wire43 : wire5[(2'h3):(1'h0)]);
  module45 #() modinst64 (.wire46(wire6), .y(wire63), .wire50(wire5), .clk(clk), .wire47(wire40), .wire48(wire44), .wire49(wire43));
  assign wire65 = wire8[(4'hd):(4'hd)];
  assign wire66 = $unsigned($signed(wire6[(2'h2):(1'h1)]));
  assign wire67 = ($unsigned(wire6) ?
                      (wire8 & (7'h44)) : (wire7[(4'hd):(1'h1)] ?
                          {(8'ha5),
                              {wire5,
                                  (~|wire65)}} : (($unsigned((8'hba)) <= $signed(wire7)) * {(&wire43),
                              {(8'hb6), wire43}})));
  assign wire68 = $unsigned(wire43[(4'he):(1'h0)]);
  assign wire69 = {$unsigned((wire44 < $unsigned((wire44 ? wire5 : wire7)))),
                      $signed($unsigned($unsigned({wire65})))};
endmodule

module module45
#(parameter param62 = (~&({(((8'ha2) ? (8'hb4) : (8'ha7)) ? ((8'hbd) != (8'hb5)) : ((8'ha7) * (7'h41)))} | {{(|(8'hae)), ((8'hb5) >> (8'ha2))}})))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire50;
  input wire signed [(3'h4):(1'h0)] wire49;
  input wire signed [(4'hb):(1'h0)] wire48;
  input wire signed [(3'h7):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire51;
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 reg52,
                 (1'h0)};
  assign wire51 = ((wire48 && (wire46 ?
                      ($signed(wire46) != {wire49}) : $unsigned($signed(wire48)))) < (~&$unsigned(wire46[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg52 <= wire48[(2'h2):(2'h2)];
    end
  assign wire53 = $signed($unsigned(($unsigned((^~wire50)) ?
                      ({wire50, wire48} != (wire46 ?
                          wire49 : wire47)) : wire47)));
  assign wire54 = wire48[(3'h6):(1'h0)];
  assign wire55 = wire49;
  assign wire56 = ($unsigned(wire49) ? wire50 : (8'hba));
  assign wire57 = (-$signed(((^~(^wire49)) ?
                      $unsigned(wire55) : wire50[(4'he):(4'hb)])));
  assign wire58 = $unsigned(wire53[(3'h7):(3'h6)]);
  assign wire59 = (({wire48[(1'h1):(1'h1)]} > {$unsigned((|wire55))}) == $unsigned(({(wire51 ?
                          wire47 : wire54),
                      wire47} + (^reg52[(4'ha):(4'ha)]))));
  assign wire60 = wire57;
  assign wire61 = $signed(($unsigned(wire48[(2'h2):(1'h1)]) ?
                      (|((wire48 ?
                          wire59 : wire48) ^ wire55)) : ((|wire57) && wire60[(5'h10):(4'h9)])));
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg37,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= (^{$signed(wire11)});
      reg15 <= (+wire13[(4'ha):(3'h4)]);
      reg16 <= wire13[(3'h5):(1'h0)];
      reg17 <= reg14[(4'he):(3'h6)];
    end
  assign wire18 = (~(^~{$unsigned(reg15), {wire11}}));
  assign wire19 = {$unsigned($signed((8'hb5))), reg17[(1'h1):(1'h0)]};
  assign wire20 = $unsigned((reg16[(4'hb):(1'h1)] + {({wire11,
                          reg17} >>> (~&(8'hbc))),
                      (^wire19)}));
  assign wire21 = ({$signed(((wire10 ? (8'hb4) : wire12) > (wire18 - reg14))),
                      (wire18[(4'hc):(4'h9)] << (((8'hbd) ? wire10 : wire13) ?
                          (wire18 ?
                              wire13 : reg15) : (~&wire10)))} != wire12[(1'h1):(1'h1)]);
  assign wire22 = {reg16, reg14};
  assign wire23 = ($unsigned(wire18) == wire13);
  assign wire24 = wire22[(4'h9):(2'h3)];
  assign wire25 = wire24[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg26 <= wire12;
      reg27 <= $unsigned((8'ha4));
      reg28 <= (($signed((wire23[(2'h3):(1'h0)] ?
              $signed(reg16) : reg14)) << $signed(((~(8'ha2)) ?
              (8'hb2) : $unsigned(wire24)))) ?
          $signed((wire10 ?
              $unsigned((wire20 ?
                  reg27 : reg27)) : (reg17 <= {reg17}))) : ($unsigned((+(reg17 << reg16))) * wire23));
      reg29 <= ($signed($signed(($signed(wire25) < {(8'ha7),
          reg27}))) >>> (&((~&(wire21 + wire19)) <= {(reg27 ?
              wire12 : wire21)})));
    end
  assign wire30 = $unsigned({(~^{wire23, wire24[(3'h5):(2'h3)]})});
  assign wire31 = (wire13[(3'h4):(1'h0)] || $signed($signed(wire23)));
  assign wire32 = wire22;
  assign wire33 = (~$unsigned((^~((^reg16) & (7'h41)))));
  assign wire34 = ($signed($unsigned($signed({(8'hbe),
                      wire10}))) != ({$unsigned($signed((8'h9e)))} || $unsigned($signed((wire18 << wire22)))));
  assign wire35 = $unsigned($unsigned($unsigned(wire11)));
  assign wire36 = wire30;
  always
    @(posedge clk) begin
      reg37 <= wire30[(3'h4):(2'h2)];
    end
  assign wire38 = $signed(((|($unsigned(wire35) ?
                          $unsigned(wire35) : $unsigned(reg37))) ?
                      $signed((wire33 << reg16[(4'hb):(2'h3)])) : $unsigned($unsigned((wire10 ?
                          wire25 : wire10)))));
  assign wire39 = ((|$unsigned(wire33)) ?
                      $unsigned(wire38[(3'h5):(1'h0)]) : ($signed($signed($signed(reg28))) ?
                          (~^wire30[(4'h9):(2'h2)]) : {({wire36,
                                  wire13} <= (8'ha5))}));
endmodule
