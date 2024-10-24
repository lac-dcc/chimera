module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h222):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire151;
  wire [(5'h12):(1'h0)] wire150;
  wire [(4'h9):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire148;
  wire signed [(4'ha):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire74;
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg136 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire120,
                 wire118,
                 wire116,
                 wire114,
                 wire111,
                 wire77,
                 wire76,
                 wire4,
                 wire5,
                 wire74,
                 reg154,
                 reg153,
                 reg152,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg113,
                 reg115,
                 (1'h0)};
  assign wire4 = wire3[(4'hb):(4'h8)];
  assign wire5 = wire1;
  module6 #() modinst75 (.wire7(wire3), .wire8(wire2), .wire11(wire5), .wire10(wire4), .y(wire74), .wire9(wire0), .clk(clk));
  assign wire76 = (7'h40);
  assign wire77 = (((~^$unsigned({(8'hba), wire4})) ?
                          (!(|(wire0 ? wire4 : (8'hb8)))) : (8'hb2)) ?
                      (((^(wire74 != wire0)) < (|wire1[(3'h6):(3'h6)])) ?
                          $signed(((-wire76) ^ (wire4 >> (8'hb1)))) : {(~wire4)}) : (wire76 >>> ((~&$unsigned(wire2)) ?
                          ((|wire5) != (wire4 ?
                              wire2 : wire3)) : $unsigned((&wire1)))));
  module78 #() modinst112 (wire111, clk, wire5, wire77, wire3, wire0);
  always
    @(posedge clk) begin
      reg113 <= $signed((~wire76[(2'h2):(2'h2)]));
    end
  assign wire114 = ((8'hb2) - (8'hbd));
  always
    @(posedge clk) begin
      reg115 <= $signed((^~wire0[(4'ha):(2'h2)]));
    end
  module53 #() modinst117 (wire116, clk, wire76, wire2, wire74, wire5);
  module6 #() modinst119 (.wire7(wire2), .clk(clk), .y(wire118), .wire10(reg115), .wire9(wire114), .wire8(wire76), .wire11(wire74));
  assign wire120 = ($signed((~|wire118)) ?
                       wire2 : $signed($signed($signed(wire3[(4'hc):(4'ha)]))));
  always
    @(posedge clk) begin
      reg121 <= {$signed((wire5[(5'h13):(5'h11)] == {wire114[(4'hb):(4'ha)],
              (wire114 ? wire111 : wire4)})),
          (reg115[(3'h5):(1'h0)] && {$signed($signed(wire1))})};
      reg122 <= ((({$signed(wire74)} ?
                  wire76[(4'h9):(2'h3)] : ((&(8'ha4)) ?
                      $signed((8'ha4)) : {wire77, wire1})) ?
              {{$signed(wire118), reg121}} : ((~&((8'hb8) - (8'hb8))) ?
                  ((&wire3) && {wire77, (8'hab)}) : (^(-wire5)))) ?
          {(~|$signed((+(7'h41))))} : (~|$signed(wire3[(1'h1):(1'h0)])));
      if (wire118[(5'h11):(4'hc)])
        begin
          if ($unsigned(((wire5 > $signed((wire74 | wire5))) ~^ wire114[(5'h11):(4'hc)])))
            begin
              reg123 <= wire77;
            end
          else
            begin
              reg123 <= wire5;
              reg124 <= wire76[(3'h7):(3'h6)];
              reg125 <= wire3[(3'h6):(1'h1)];
              reg126 <= $signed((wire114 ?
                  wire118[(5'h12):(4'hd)] : (((~&wire76) ?
                      reg122 : (wire4 & wire120)) >>> $signed($unsigned(reg113)))));
            end
          reg127 <= $signed((-$unsigned({wire4[(4'he):(3'h7)],
              (wire2 ? reg124 : wire3)})));
          reg128 <= reg124[(4'h8):(4'h8)];
          if (wire120)
            begin
              reg129 <= (~|($unsigned($unsigned($signed(wire116))) ?
                  $unsigned(((wire77 ? (8'hb4) : wire114) ?
                      $signed((8'ha0)) : (reg121 ?
                          wire4 : reg123))) : ((&reg115[(5'h11):(5'h11)]) << {$unsigned(reg124),
                      {(8'hb2), (7'h43)}})));
              reg130 <= (~|$signed($unsigned(reg121)));
              reg131 <= wire4[(4'hd):(4'hb)];
              reg132 <= (-reg113[(1'h1):(1'h1)]);
              reg133 <= ((|({$signed((8'hb5))} ?
                  ($signed(wire4) < $signed(reg127)) : (wire114 ?
                      $unsigned(wire74) : (wire111 ?
                          (7'h42) : reg121)))) - {$unsigned(reg130),
                  (^wire76[(4'h8):(1'h0)])});
            end
          else
            begin
              reg129 <= reg132;
              reg130 <= $unsigned($unsigned(reg128[(2'h3):(2'h2)]));
            end
        end
      else
        begin
          if ($unsigned(($unsigned($unsigned((wire0 > reg130))) ^~ (((8'ha7) && $unsigned(wire76)) != wire114))))
            begin
              reg123 <= {reg121,
                  {($signed({reg133}) + (!(wire0 ? (8'hb6) : reg130)))}};
              reg124 <= (^~$signed($signed($signed(wire77))));
              reg125 <= $signed($unsigned((((^~reg113) != (7'h42)) & ({wire3} & wire76[(4'hc):(3'h6)]))));
            end
          else
            begin
              reg123 <= {wire118, wire118[(4'hd):(1'h1)]};
              reg124 <= reg125;
              reg125 <= $unsigned(wire76[(3'h7):(2'h2)]);
              reg126 <= $unsigned((reg132[(3'h6):(2'h3)] ?
                  ((wire114 ? (wire111 < wire116) : {reg132, (8'haa)}) ?
                      wire76[(4'h8):(3'h4)] : ($signed(wire74) <= $signed(wire118))) : (~&(-{reg130,
                      reg125}))));
            end
          reg127 <= $unsigned(wire0);
          if ((+reg115[(4'h9):(2'h3)]))
            begin
              reg128 <= $signed((~&(&(^~reg126[(5'h15):(3'h4)]))));
              reg129 <= $signed(wire76[(4'hd):(4'h9)]);
            end
          else
            begin
              reg128 <= ((~&(&$signed($signed((8'h9d))))) >> (&(wire76[(4'h8):(4'h8)] * wire1)));
            end
          reg130 <= $unsigned($unsigned((wire114 << $unsigned(reg125))));
        end
      if (wire77[(3'h6):(3'h6)])
        begin
          reg134 <= wire0[(4'h8):(3'h5)];
          reg135 <= (|(^~$unsigned(($signed(wire118) >> $signed((8'ha1))))));
          reg136 <= {reg125, reg128};
          if ($signed(wire74[(4'h8):(4'h8)]))
            begin
              reg137 <= reg121[(4'hf):(1'h0)];
              reg138 <= $signed(((($signed(reg136) ?
                  $signed((8'hb1)) : $unsigned(reg134)) == $unsigned(reg123)) ~^ (-$unsigned((8'ha9)))));
              reg139 <= (wire3 <<< reg127[(1'h0):(1'h0)]);
              reg140 <= $signed((-$unsigned($unsigned(wire111[(4'h8):(2'h3)]))));
              reg141 <= $unsigned(wire74);
            end
          else
            begin
              reg137 <= reg138[(3'h7):(3'h6)];
              reg138 <= $signed(wire114);
            end
        end
      else
        begin
          reg134 <= $unsigned({wire1, wire116});
        end
    end
  always
    @(posedge clk) begin
      reg142 <= reg125[(3'h6):(3'h5)];
      reg143 <= $unsigned(($signed(((~^reg133) ?
              ((8'hb6) ? reg139 : reg113) : ((8'ha0) ? reg131 : wire116))) ?
          reg127[(3'h7):(3'h5)] : $signed($signed(reg134))));
      reg144 <= reg140;
      reg145 <= $unsigned(($signed((((8'ha7) >>> (8'had)) ?
          $unsigned((8'hb3)) : (reg136 << reg115))) ^~ (^~$signed(reg126))));
      if ($unsigned($signed(($unsigned((~|wire5)) ?
          wire120 : ($unsigned(reg144) >= $signed(reg131))))))
        begin
          reg146 <= (|({$signed({wire118, (8'ha1)}),
              (^~$unsigned(reg137))} <<< (wire3 ?
              (reg129[(2'h2):(2'h2)] ^ wire111[(4'hd):(4'ha)]) : ($signed(wire120) ^~ $unsigned(wire3)))));
          reg147 <= reg131[(1'h1):(1'h0)];
        end
      else
        begin
          reg146 <= (^~$signed(reg138));
          reg147 <= $signed({(8'hb1)});
        end
    end
  assign wire148 = reg143;
  assign wire149 = wire1;
  assign wire150 = (|reg126[(1'h0):(1'h0)]);
  assign wire151 = $signed(((|reg143[(4'he):(4'hb)]) | $signed((reg121 <<< ((7'h43) >= wire3)))));
  always
    @(posedge clk) begin
      reg152 <= {wire120[(3'h7):(3'h6)]};
      reg153 <= $signed($signed(reg124));
      reg154 <= $signed((wire76 <= reg115[(4'he):(1'h0)]));
    end
endmodule

module module78  (y, clk, wire79, wire80, wire81, wire82);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire79;
  input wire [(2'h3):(1'h0)] wire80;
  input wire [(5'h15):(1'h0)] wire81;
  input wire [(4'hc):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire108;
  assign y = {wire110, wire83, wire84, wire108, (1'h0)};
  assign wire83 = {(~|((-{wire79}) ~^ ((wire80 ? wire82 : (8'hb8)) - (wire79 ?
                          wire80 : (8'ha4))))),
                      ((wire79 == ($signed(wire81) <<< $unsigned((8'hbb)))) ?
                          ({wire79} >> wire82[(2'h2):(2'h2)]) : $unsigned($signed(((8'hb3) & wire81))))};
  assign wire84 = {(wire82 >>> (~^wire83[(5'h15):(3'h7)]))};
  module85 #() modinst109 (wire108, clk, wire79, wire81, wire80, wire82, wire83);
  assign wire110 = wire108[(4'hb):(2'h2)];
endmodule

module module6
#(parameter param72 = ({((((8'hb2) ? (8'hac) : (8'h9c)) << ((8'hbe) | (8'ha3))) ? (((8'haa) ? (8'ha8) : (8'hb4)) ? {(8'hab), (8'ha4)} : ((8'hb4) ? (8'hb5) : (8'ha3))) : {{(8'haf), (8'hb7)}, (!(8'ha4))}), ((+((8'haf) ? (8'hb6) : (8'hba))) <<< (!(8'hba)))} << (((8'hb5) * (&(^~(8'hae)))) ? (+{((8'ha9) + (7'h40))}) : {((~&(7'h40)) ? {(8'ha6), (8'hba)} : ((8'hb2) ? (8'hbe) : (8'ha8)))})), 
parameter param73 = ({param72} ? {((8'hb2) ? (^param72) : {(param72 * param72), (param72 ? param72 : param72)})} : ((8'hab) ? {((param72 ? (8'ha7) : param72) || {param72}), param72} : param72)))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire12;
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire51,
                 wire12,
                 (1'h0)};
  assign wire12 = wire10[(4'hf):(4'h9)];
  module13 #() modinst52 (.clk(clk), .wire14(wire10), .wire16(wire12), .wire15(wire11), .wire17(wire7), .y(wire51));
  module53 #() modinst64 (.y(wire63), .wire55(wire7), .wire57(wire12), .wire56(wire10), .clk(clk), .wire54(wire51));
  assign wire65 = ($signed($signed((wire63 && (8'ha7)))) < wire11);
  assign wire66 = (~&(wire9[(3'h7):(3'h5)] ^~ ((~&wire9[(4'ha):(1'h0)]) ?
                      {wire65, wire11[(1'h0):(1'h0)]} : ((wire12 ?
                          (8'hab) : wire8) ^ ((7'h44) && wire63)))));
  assign wire67 = wire51;
  assign wire68 = wire65;
  assign wire69 = $signed(wire7[(1'h1):(1'h1)]);
  assign wire70 = (-$unsigned($signed(wire65[(3'h5):(2'h2)])));
  assign wire71 = ($unsigned(wire10) ?
                      $signed((($unsigned(wire12) * (!wire8)) - ((8'hb2) ?
                          wire70[(2'h3):(1'h0)] : {(8'hb6)}))) : (~&($unsigned((wire68 || wire7)) ?
                          wire12[(3'h6):(2'h3)] : ((wire7 >>> (8'had)) ?
                              (8'hb4) : (wire70 ? wire69 : wire69)))));
endmodule

module module53  (y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire57;
  input wire signed [(5'h11):(1'h0)] wire56;
  input wire [(3'h4):(1'h0)] wire55;
  input wire [(5'h15):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire58;
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  assign y = {wire60, wire59, wire58, reg62, reg61, (1'h0)};
  assign wire58 = (&(wire56[(4'hb):(3'h7)] >> $signed(wire57[(2'h2):(1'h0)])));
  assign wire59 = $signed(wire57[(3'h6):(2'h2)]);
  assign wire60 = wire58[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg61 <= wire54[(3'h7):(1'h0)];
      reg62 <= wire60[(3'h5):(2'h2)];
    end
endmodule

module module13
#(parameter param49 = {((-({(8'hb0), (8'hb2)} ? ((8'ha8) & (8'hb2)) : (+(8'ha4)))) == (!(((8'hac) >= (8'ha9)) + ((8'h9c) << (8'ha6))))), {(((!(8'hbb)) ? ((8'h9f) << (8'hae)) : {(8'ha2)}) - {(~|(8'hb7))}), ((((8'hb4) ? (8'hb3) : (7'h40)) * ((8'ha0) || (8'hbf))) + (((8'hb5) ? (8'ha3) : (8'hb1)) ? ((8'hb0) ? (8'h9d) : (8'hb8)) : ((8'ha9) ^~ (8'h9c))))}}, 
parameter param50 = (&((^~((~(7'h42)) << (+param49))) | (^~{(8'ha6), {param49, param49}}))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire signed [(2'h3):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire18;
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  assign y = {wire48,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
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
                 wire18,
                 reg47,
                 reg46,
                 reg42,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire18 = (^~((((^wire17) * wire17[(2'h2):(2'h2)]) && $signed(wire16)) >>> {wire17}));
  assign wire19 = {$signed({(~^(wire18 ? wire14 : wire14)),
                          wire18[(4'he):(2'h3)]})};
  assign wire20 = $signed((((-(wire19 > wire18)) ?
                          wire18 : (^(wire16 <= wire18))) ?
                      {(wire16[(3'h7):(2'h2)] ? $signed(wire15) : (+(8'h9e))),
                          $unsigned((wire19 >> wire15))} : (~|wire15[(2'h3):(2'h2)])));
  assign wire21 = ((^~(wire17 & (wire16[(4'hb):(3'h4)] ^~ (wire18 ?
                      wire16 : wire19)))) & $unsigned($signed(wire18)));
  assign wire22 = wire19[(1'h1):(1'h0)];
  assign wire23 = $unsigned({$unsigned(((wire14 ? wire22 : wire14) ?
                          (&wire14) : $unsigned(wire16)))});
  assign wire24 = (+wire16);
  assign wire25 = $signed((~^{(-(wire18 ? wire24 : wire19))}));
  assign wire26 = ((~&((+{wire21, (8'hba)}) & $signed($signed(wire17)))) ?
                      ((((wire16 != wire15) ?
                          (wire21 != wire24) : wire15) <<< $signed({wire20,
                          (8'hbd)})) || wire23) : wire15[(2'h2):(1'h0)]);
  assign wire27 = wire14[(4'h8):(1'h1)];
  assign wire28 = $signed(wire27);
  assign wire29 = wire18[(5'h13):(4'hc)];
  always
    @(posedge clk) begin
      reg30 <= (&$signed(wire20[(5'h12):(2'h2)]));
      reg31 <= ((wire25 >= $signed($unsigned($signed(wire14)))) >>> (^(~^$unsigned(wire18))));
      if ($unsigned(wire15))
        begin
          reg32 <= wire15[(1'h0):(1'h0)];
        end
      else
        begin
          reg32 <= (wire19 >= wire29);
          reg33 <= wire27;
          reg34 <= wire15[(1'h0):(1'h0)];
          reg35 <= $unsigned(wire27[(4'hb):(2'h3)]);
        end
      reg36 <= (+(~wire23));
      reg37 <= (~&reg35);
    end
  assign wire38 = reg36;
  assign wire39 = ($signed(({$signed((8'hbb))} ?
                          wire27 : (wire26[(3'h5):(3'h5)] ?
                              ((8'had) < wire19) : $signed(wire38)))) ?
                      wire15 : (^~reg37[(2'h3):(1'h1)]));
  assign wire40 = ({wire39[(3'h4):(2'h2)]} - $unsigned($unsigned((-$signed(reg36)))));
  assign wire41 = reg36[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg42 <= ((($signed(((8'ha0) ? wire29 : wire14)) ?
                  (((8'hb3) ~^ wire22) ?
                      wire26 : wire23[(2'h3):(2'h2)]) : wire22) ?
              wire28[(1'h0):(1'h0)] : wire21[(4'h9):(4'h9)]) ?
          wire14 : $unsigned($signed($unsigned($unsigned(reg32)))));
    end
  assign wire43 = (-({((wire39 >> wire28) ?
                          (wire41 ? (8'hb5) : wire38) : (~wire26)),
                      (~|(wire16 >= wire29))} && {wire28[(1'h1):(1'h1)],
                      $signed(reg37[(4'hc):(1'h0)])}));
  assign wire44 = ({reg37} ? (8'hb1) : wire18);
  assign wire45 = (8'hb9);
  always
    @(posedge clk) begin
      reg46 <= (+wire16);
      reg47 <= $signed(wire26);
    end
  assign wire48 = (!(wire43[(1'h0):(1'h0)] ?
                      wire21 : $signed($unsigned({wire43, wire28}))));
endmodule

module module85
#(parameter param107 = (7'h42))
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire90;
  input wire [(4'hf):(1'h0)] wire89;
  input wire signed [(2'h3):(1'h0)] wire88;
  input wire signed [(4'hc):(1'h0)] wire87;
  input wire signed [(3'h4):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire [(5'h15):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 (1'h0)};
  assign wire91 = (wire88 | wire86);
  assign wire92 = $signed((wire87[(4'h9):(4'h8)] == (^(&wire90))));
  assign wire93 = (+(8'h9c));
  assign wire94 = wire90[(2'h3):(2'h2)];
  assign wire95 = (~($signed(($signed((8'hae)) ^~ wire89)) ?
                      wire93[(4'h8):(1'h0)] : $signed((~^$signed(wire86)))));
  assign wire96 = wire89[(4'hc):(4'ha)];
  assign wire97 = wire89[(4'h8):(3'h4)];
  assign wire98 = {$unsigned(((8'ha4) ?
                          $unsigned($unsigned(wire95)) : wire97[(1'h0):(1'h0)])),
                      wire91[(3'h5):(2'h3)]};
  assign wire99 = $signed($signed(wire96[(1'h0):(1'h0)]));
  assign wire100 = $unsigned((8'hb3));
  assign wire101 = (wire86[(1'h0):(1'h0)] >= (~wire86));
  assign wire102 = (+(^(+({wire89} ? {wire92} : $unsigned((8'hac))))));
  assign wire103 = ($signed({((wire101 <= wire88) ?
                           (8'hb7) : wire102[(4'ha):(1'h1)])}) - wire102);
  assign wire104 = ($unsigned(({$signed((7'h41))} ?
                           wire102 : $signed($unsigned((8'ha9))))) ?
                       {wire92,
                           (wire93[(4'ha):(4'ha)] ^~ $signed($unsigned(wire96)))} : wire93);
  assign wire105 = (({{(wire93 - wire103), (-wire94)}} ?
                       $unsigned(wire93) : (wire104[(1'h0):(1'h0)] ?
                           $unsigned((wire88 >> wire88)) : wire98[(2'h3):(1'h1)])) | $signed(((!wire87[(1'h1):(1'h1)]) > ((wire89 || wire102) ?
                       ((8'hba) ? wire98 : wire86) : $unsigned(wire96)))));
  assign wire106 = (8'hb9);
endmodule
