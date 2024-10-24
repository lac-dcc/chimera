module top
#(parameter param160 = {(~&(-(~|((8'ha4) ? (8'hae) : (7'h41))))), {((((8'hb0) == (8'hbc)) ? ((8'h9d) ^ (8'ha5)) : {(8'hb9), (8'hb4)}) ? {((8'ha6) & (8'ha2)), (~(8'hbd))} : (((8'ha8) || (8'haf)) && (~^(8'ha3))))}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire159;
  wire [(3'h5):(1'h0)] wire157;
  wire signed [(4'hd):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire136;
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg [(5'h10):(1'h0)] reg155 = (1'h0);
  reg [(2'h2):(1'h0)] reg154 = (1'h0);
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg140 = (1'h0);
  assign y = {wire159,
                 wire157,
                 wire139,
                 wire138,
                 wire5,
                 wire6,
                 wire7,
                 wire136,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  assign wire5 = $signed(wire1);
  assign wire6 = wire3[(1'h0):(1'h0)];
  assign wire7 = (wire0[(3'h7):(3'h5)] ?
                     $signed($unsigned(wire3[(1'h1):(1'h0)])) : (^$signed((wire2[(3'h4):(1'h0)] ~^ (wire2 >= wire6)))));
  module8 #() modinst137 (.wire12(wire6), .wire10(wire5), .y(wire136), .clk(clk), .wire11(wire1), .wire9(wire0), .wire13(wire3));
  assign wire138 = wire7;
  assign wire139 = $signed(wire7);
  always
    @(posedge clk) begin
      if (wire136[(3'h4):(2'h3)])
        begin
          reg140 <= {($signed($unsigned(wire2[(2'h3):(1'h1)])) <= wire139),
              ($signed(wire0[(3'h5):(3'h5)]) < wire5)};
        end
      else
        begin
          reg140 <= wire136;
          if ((-wire136[(4'h9):(2'h3)]))
            begin
              reg141 <= wire5;
              reg142 <= wire6;
              reg143 <= (^~(^((~&reg141[(1'h0):(1'h0)]) <= ($signed((8'hbb)) <<< {wire138,
                  (8'hb0)}))));
              reg144 <= reg140[(3'h6):(1'h0)];
              reg145 <= (^~((((8'ha6) == $signed(wire1)) >> ((wire136 | (8'ha3)) != reg144)) ?
                  wire136 : ((reg143[(2'h2):(1'h1)] ?
                      {reg144, wire7} : (wire2 ^~ wire139)) && wire2)));
            end
          else
            begin
              reg141 <= $signed($unsigned($unsigned(wire138)));
              reg142 <= $unsigned(({{(+reg143),
                      wire2}} + $signed((^~(wire4 ~^ wire4)))));
              reg143 <= wire5[(2'h3):(2'h3)];
            end
          reg146 <= ((8'hb2) ?
              $signed(wire7) : ((((reg142 ? wire6 : wire0) ?
                          $signed(wire0) : {wire2, reg144}) ?
                      ((^~reg144) ?
                          $signed(wire136) : {reg141}) : $signed($unsigned(wire6))) ?
                  reg142 : wire3));
          reg147 <= (|wire0);
          reg148 <= $unsigned((^($unsigned(reg141[(4'he):(1'h1)]) ?
              reg142[(4'hb):(2'h2)] : (8'hb9))));
        end
      reg149 <= wire1;
      if (($signed(reg144[(3'h6):(3'h6)]) ?
          reg141[(4'h8):(3'h7)] : $unsigned(($unsigned((wire7 > reg141)) ?
              ((+wire139) ? (~|wire2) : ((8'ha3) ? wire3 : wire4)) : wire1))))
        begin
          reg150 <= reg141;
          reg151 <= reg148[(2'h3):(1'h1)];
          if ((reg145 & $unsigned({wire1})))
            begin
              reg152 <= $unsigned((((8'hbe) ?
                  (reg150[(3'h5):(2'h3)] ^ {wire2,
                      reg141}) : $signed($unsigned((8'hbf)))) * wire7));
              reg153 <= (~^{wire2, reg145});
              reg154 <= $signed($unsigned(wire139));
              reg155 <= reg153[(2'h2):(1'h0)];
            end
          else
            begin
              reg152 <= wire1[(4'hf):(4'hf)];
              reg153 <= reg155;
              reg154 <= wire3[(4'ha):(1'h0)];
            end
        end
      else
        begin
          reg150 <= ($unsigned(reg143) ?
              $unsigned((($signed((8'hb0)) ? reg144 : (~reg153)) ?
                  $signed((reg154 ? reg153 : wire3)) : $unsigned((reg151 ?
                      wire136 : (8'hba))))) : {((~|$unsigned((8'hb2))) ?
                      reg145[(3'h6):(1'h1)] : (~|$signed(reg150)))});
          if (wire6)
            begin
              reg151 <= {$unsigned($signed((-(reg154 >>> reg152)))),
                  {(-{reg152[(1'h0):(1'h0)], $unsigned(reg143)}),
                      (~^(&(reg152 ? wire7 : reg145)))}};
              reg152 <= wire0;
            end
          else
            begin
              reg151 <= ({{(~^$signed(reg155)), (|{wire3})}} ?
                  (((~&$unsigned(reg155)) >= reg155[(1'h1):(1'h0)]) >> reg148[(2'h3):(2'h3)]) : $signed((^reg144[(1'h0):(1'h0)])));
            end
          reg153 <= wire6[(4'hb):(4'h8)];
          reg154 <= wire136[(3'h7):(1'h1)];
        end
      reg156 <= ($signed(($signed(((8'ha4) ^ reg151)) ?
              {$unsigned((7'h42))} : {reg147[(4'hb):(4'hb)]})) ?
          ((7'h44) ?
              $unsigned((^reg150)) : ((~|$signed(reg149)) ?
                  (reg155 >= (reg145 >>> wire0)) : reg147[(3'h4):(2'h2)])) : $signed(reg151[(4'hb):(1'h0)]));
    end
  module59 #() modinst158 (wire157, clk, reg143, wire136, reg152, wire2);
  assign wire159 = wire0[(1'h0):(1'h0)];
endmodule

module module8
#(parameter param135 = {(((~^(^~(8'hac))) <= (~&{(7'h43)})) > {({(7'h44), (8'hb8)} ? {(8'ha2)} : (8'hba)), {((8'had) & (7'h40)), ((8'ha2) ? (8'ha8) : (8'hbb))}}), ((|{((8'ha2) * (8'hb1)), ((7'h44) * (8'h9d))}) ? ((&((7'h42) ? (8'h9e) : (8'ha4))) != ({(8'ha4)} ? ((8'hbe) >>> (8'h9d)) : ((7'h42) && (8'hb6)))) : (((~^(8'hab)) > ((8'hab) ? (8'hb7) : (7'h43))) ? ((~(8'ha3)) ? ((8'hbe) || (8'hbe)) : ((8'hba) + (8'hae))) : (~^((8'hb2) ? (8'hb1) : (8'hb2)))))})
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire134;
  wire [(5'h10):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire107;
  wire signed [(4'hf):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire94;
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire14,
                 wire15,
                 wire57,
                 wire75,
                 wire77,
                 wire78,
                 wire79,
                 wire83,
                 wire94,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg80,
                 reg81,
                 reg82,
                 (1'h0)};
  assign wire14 = {({({wire13} ? $signed(wire12) : $signed(wire9)),
                          $signed($unsigned((8'ha1)))} << (+{(+wire12),
                          wire11}))};
  assign wire15 = wire9[(5'h13):(5'h10)];
  module16 #() modinst58 (wire57, clk, wire14, wire13, wire10, wire9);
  module59 #() modinst76 (wire75, clk, wire57, wire10, wire12, wire15);
  assign wire77 = $signed((+$unsigned($unsigned($signed(wire13)))));
  assign wire78 = ($signed($unsigned(wire11)) ? wire11 : wire75);
  assign wire79 = wire77[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg80 <= (^~(7'h43));
      reg81 <= {(8'ha9)};
      reg82 <= (|wire15[(2'h2):(2'h2)]);
    end
  assign wire83 = (~^(~^($signed((wire79 - wire75)) ?
                      ($unsigned(wire75) != wire15) : $unsigned((wire13 >> wire79)))));
  module84 #() modinst95 (wire94, clk, wire12, reg82, wire15, wire75);
  always
    @(posedge clk) begin
      if (wire75)
        begin
          reg96 <= ($unsigned({(((8'h9d) != wire83) >= wire9[(4'hd):(3'h5)])}) ?
              (((wire11[(4'h8):(3'h6)] < (wire83 ?
                  wire15 : wire83)) == $signed((wire94 <= (8'hb8)))) | $unsigned({(8'hb7),
                  $unsigned(wire94)})) : wire12[(3'h7):(2'h3)]);
          reg97 <= {((wire11[(3'h7):(3'h7)] ^ reg81[(1'h1):(1'h1)]) < $signed($unsigned(reg82[(4'ha):(3'h6)])))};
          reg98 <= wire57;
        end
      else
        begin
          reg96 <= ($signed(($signed((wire10 | reg97)) ^~ ($signed(wire12) ~^ reg82))) == reg98);
          reg97 <= wire94[(3'h7):(3'h5)];
          if (wire77)
            begin
              reg98 <= wire9;
              reg99 <= (~reg96[(2'h2):(1'h0)]);
              reg100 <= $signed((|$unsigned($signed($signed((8'hbf))))));
              reg101 <= $signed($signed(({$unsigned((8'hb0)),
                      (reg100 ~^ reg98)} ?
                  ((8'h9f) ?
                      (reg100 ?
                          (7'h44) : wire78) : wire77[(2'h2):(2'h2)]) : wire13[(2'h2):(1'h0)])));
              reg102 <= reg100[(4'h8):(3'h4)];
            end
          else
            begin
              reg98 <= $unsigned((wire13[(4'hb):(3'h7)] ?
                  reg97 : $signed(reg100)));
              reg99 <= {wire57, wire83};
            end
        end
      reg103 <= {$signed($unsigned($unsigned($unsigned(wire83))))};
    end
  assign wire104 = $unsigned({$unsigned(reg102[(2'h3):(1'h0)])});
  assign wire105 = reg99[(4'hc):(2'h2)];
  assign wire106 = ((((^$unsigned(wire9)) << reg98) < $unsigned((^~(|wire57)))) ?
                       reg82[(4'hd):(4'hb)] : wire10);
  assign wire107 = (-reg103);
  assign wire108 = $signed((reg96 << reg81[(4'hd):(1'h1)]));
  module109 #() modinst131 (.wire110(wire108), .wire113(wire11), .wire112(wire78), .wire111(wire106), .clk(clk), .y(wire130));
  assign wire132 = (~&($unsigned(($signed(wire106) << (reg98 ?
                       wire57 : wire105))) ^ ({{wire83},
                       (reg101 ?
                           (8'h9d) : wire106)} + ($unsigned(reg96) > $signed(wire14)))));
  assign wire133 = wire78[(5'h10):(5'h10)];
  assign wire134 = ($signed({(reg102[(1'h0):(1'h0)] ?
                               (wire13 ? wire13 : wire130) : wire130)}) ?
                       (wire83 ?
                           (-$signed((~(8'h9c)))) : (reg81 ?
                               ($signed(reg100) <<< wire94[(3'h4):(1'h1)]) : (((8'hab) < (8'ha3)) == reg100[(5'h11):(2'h3)]))) : $signed($unsigned(reg101[(3'h5):(2'h3)])));
endmodule

module module109
#(parameter param129 = ((~&(({(8'ha7)} || ((8'had) * (8'hb1))) ? ((~^(8'hb0)) >>> ((8'ha3) ? (8'ha2) : (8'h9e))) : (((8'haa) ~^ (8'hb6)) - (-(8'hbb))))) < ((^({(8'hbe)} || {(8'hbd)})) - (~&(|((7'h41) + (8'ha2)))))))
(y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire113;
  input wire signed [(4'he):(1'h0)] wire112;
  input wire signed [(3'h6):(1'h0)] wire111;
  input wire [(5'h15):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire128;
  wire [(2'h2):(1'h0)] wire127;
  wire signed [(4'ha):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire123;
  wire signed [(3'h7):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire signed [(5'h10):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  wire [(4'h8):(1'h0)] wire114;
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 (1'h0)};
  assign wire114 = {(~(8'hb6)),
                       $signed((((wire112 - wire111) ?
                           (|wire113) : {(8'hb6),
                               wire112}) ~^ $signed(wire111)))};
  assign wire115 = $signed((~|wire112));
  assign wire116 = $signed($unsigned({wire114[(3'h4):(1'h1)], wire114}));
  assign wire117 = {wire116[(1'h0):(1'h0)],
                       ($unsigned(({wire110} ?
                               wire113 : wire115[(1'h1):(1'h1)])) ?
                           (~^wire115) : $signed($unsigned(wire115)))};
  assign wire118 = $signed(((7'h40) ?
                       ($signed(wire113[(4'he):(3'h4)]) ?
                           wire112 : (|((8'hb5) ?
                               wire117 : wire112))) : (8'ha2)));
  assign wire119 = {$unsigned($unsigned($unsigned(((8'ha5) == wire113))))};
  assign wire120 = ($unsigned($unsigned(((wire110 ?
                       wire110 : wire119) <<< $unsigned(wire116)))) || (&($signed($unsigned(wire118)) & $signed($signed(wire114)))));
  assign wire121 = wire114;
  assign wire122 = (~^((wire113[(4'he):(2'h2)] ?
                           {{wire117, wire110}, wire114} : ($signed(wire114) ?
                               $signed(wire113) : wire118[(1'h1):(1'h0)])) ?
                       (~wire111[(3'h6):(3'h6)]) : wire110[(2'h3):(1'h1)]));
  assign wire123 = (({((wire117 != wire114) + (wire118 > wire110)),
                           ({(8'hb8)} ?
                               (!wire114) : (wire118 ? wire113 : wire115))} ?
                       $signed((wire116 > (wire122 < wire117))) : wire119) >> ((!wire122) && (wire113 ?
                       ((wire114 ?
                           wire110 : (8'hbb)) + $signed((8'hbf))) : {{wire117}})));
  assign wire124 = $signed((wire123[(2'h2):(2'h2)] ?
                       (+wire113[(2'h2):(2'h2)]) : {wire112}));
  assign wire125 = wire116;
  assign wire126 = (^~wire111);
  assign wire127 = (wire122[(2'h3):(1'h1)] ?
                       ((wire124 * wire123) ?
                           wire126 : {(+wire113)}) : wire112[(2'h2):(2'h2)]);
  assign wire128 = $signed($unsigned($unsigned($signed(wire120[(3'h5):(1'h1)]))));
endmodule

module module84  (y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire88;
  input wire [(4'hf):(1'h0)] wire87;
  input wire signed [(4'ha):(1'h0)] wire86;
  input wire [(5'h12):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  assign y = {wire93, wire92, wire91, wire90, reg89, (1'h0)};
  always
    @(posedge clk) begin
      reg89 <= ({(((wire87 - wire85) ?
                      (wire87 ? wire88 : wire85) : $signed(wire85)) ?
                  $signed((wire86 ?
                      (8'hbd) : wire85)) : (wire88[(2'h2):(2'h2)] > $unsigned(wire88)))} ?
          wire87 : wire85[(4'hb):(2'h2)]);
    end
  assign wire90 = ((wire86[(4'ha):(4'h9)] >= wire88) == wire85[(4'ha):(4'h8)]);
  assign wire91 = ((~|(wire87 ? $signed(wire88) : $unsigned({wire86}))) ?
                      ($unsigned(((wire87 ? wire86 : reg89) != {wire87})) ?
                          $signed($unsigned((wire86 + wire88))) : reg89) : wire88[(2'h2):(1'h1)]);
  assign wire92 = $signed($unsigned(wire86[(4'h8):(2'h2)]));
  assign wire93 = ({$unsigned($unsigned((wire87 != wire85))), wire86} ?
                      {wire91[(4'hc):(4'h8)]} : $unsigned({(~^$signed(wire88)),
                          wire85}));
endmodule

module module59
#(parameter param73 = ((((+{(8'hab), (8'hb5)}) ? (^((8'ha4) ? (8'h9f) : (8'ha1))) : (8'hbf)) ? (((~|(8'ha0)) | (&(8'ha8))) ^~ (((8'ha1) < (8'hbf)) >> ((8'hbd) ? (8'hab) : (8'hbc)))) : {({(8'hbd)} ? ((8'h9e) >> (8'hb7)) : ((8'hb7) ^~ (7'h42))), ({(8'ha8), (8'ha1)} >= ((8'hb1) <= (8'ha6)))}) < (7'h43)), 
parameter param74 = (^({(^(param73 ? param73 : param73))} ? (-param73) : {{{param73}, {param73, param73}}, {(-(8'hab)), (param73 * param73)}})))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire63;
  input wire signed [(5'h15):(1'h0)] wire62;
  input wire [(4'hb):(1'h0)] wire61;
  input wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg65,
                 reg64,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg64 <= (-wire63);
      reg65 <= ($unsigned(($unsigned((wire61 >>> wire61)) >= wire60)) * wire62[(4'h8):(1'h1)]);
    end
  assign wire66 = $unsigned($unsigned(((&$unsigned((8'ha6))) ?
                      (~|reg65[(4'h9):(2'h3)]) : reg64[(4'h8):(2'h3)])));
  assign wire67 = $unsigned(reg65[(3'h6):(1'h1)]);
  assign wire68 = $unsigned(((^((~|reg65) | {(8'ha5)})) ?
                      $signed(wire66) : ((|{wire61,
                          wire60}) << $unsigned((wire61 ? wire63 : reg65)))));
  assign wire69 = (~|{(^~wire62[(5'h11):(3'h6)]), {wire62[(4'ha):(1'h1)]}});
  assign wire70 = wire66[(3'h4):(1'h0)];
  assign wire71 = ($unsigned((&((|wire67) ?
                      (reg64 + reg64) : $unsigned(wire69)))) << $signed($unsigned((((8'hb7) ?
                      wire63 : wire61) << (~^(8'hbc))))));
  assign wire72 = $unsigned((~&((^~(|wire61)) >> ((^~wire66) <<< {(8'hb7),
                      wire66}))));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire39;
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg40,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire19[(4'hf):(1'h1)]))
        begin
          reg21 <= {$unsigned((~(8'ha0))),
              (~|((8'hbc) ?
                  $signed(wire19[(3'h6):(2'h3)]) : $signed((wire19 ?
                      wire17 : wire18))))};
          reg22 <= {wire17, {wire20, reg21[(3'h6):(3'h6)]}};
          reg23 <= wire18[(2'h3):(2'h3)];
        end
      else
        begin
          reg21 <= (wire20 ?
              $unsigned((((wire20 ? reg22 : wire17) ?
                  wire17[(1'h0):(1'h0)] : reg23) | $unsigned({(8'haa)}))) : {(8'ha9),
                  $unsigned(wire18)});
          if ((8'hb5))
            begin
              reg22 <= ({$signed({(reg23 << wire20), {reg22, wire17}}),
                  $unsigned(wire19[(3'h7):(3'h6)])} ^~ wire18);
              reg23 <= ($signed(((wire18 ?
                      (reg22 ? wire18 : wire17) : {reg23}) << ((reg21 ?
                      reg21 : (8'hb5)) & $signed(reg23)))) ?
                  wire18 : wire20[(3'h4):(3'h4)]);
              reg24 <= $unsigned(reg23[(3'h7):(3'h6)]);
              reg25 <= reg24[(3'h4):(3'h4)];
            end
          else
            begin
              reg22 <= wire20[(1'h0):(1'h0)];
              reg23 <= (wire19 > reg24);
              reg24 <= $signed((reg25[(2'h3):(2'h3)] ?
                  {$unsigned(reg23), $signed(reg23[(2'h3):(2'h2)])} : wire17));
              reg25 <= reg22[(2'h3):(2'h2)];
            end
        end
      reg26 <= wire17[(1'h0):(1'h0)];
      if ($signed(wire20))
        begin
          if ((((!$signed((+reg22))) | wire19) ? (^~(~^(|{(8'ha6)}))) : reg24))
            begin
              reg27 <= {reg21[(4'hc):(2'h3)]};
              reg28 <= ($signed($signed((&reg24))) * {$signed(($signed(wire19) >>> (wire19 + wire20))),
                  (!(wire17[(1'h0):(1'h0)] ? (+wire20) : (&reg27)))});
              reg29 <= $unsigned(({{reg22, ((8'hbc) - reg25)},
                  ((wire19 != wire18) ^ reg27)} ^ $unsigned({reg25})));
              reg30 <= wire20[(2'h3):(1'h1)];
              reg31 <= $signed(($signed($signed($unsigned(reg26))) <<< (~|(^wire20[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg27 <= (reg24 * ({reg28} ?
                  (reg28 ?
                      $signed(reg24[(1'h0):(1'h0)]) : ((wire20 ?
                          reg21 : (8'hb3)) & $signed(reg22))) : $signed(reg27)));
              reg28 <= reg31;
            end
          if ((~$unsigned($signed(reg31[(4'h9):(1'h0)]))))
            begin
              reg32 <= $signed((reg25[(2'h2):(1'h0)] ^~ $unsigned($signed($unsigned(reg30)))));
              reg33 <= wire17[(2'h2):(1'h0)];
              reg34 <= $signed(($unsigned(((+reg30) ?
                  $unsigned(wire19) : reg30[(4'he):(3'h6)])) != reg31[(3'h4):(2'h3)]));
            end
          else
            begin
              reg32 <= (~|(^~$signed($unsigned($signed((8'ha2))))));
              reg33 <= $unsigned(reg23[(3'h6):(1'h1)]);
              reg34 <= wire18;
              reg35 <= reg21[(4'h9):(1'h0)];
              reg36 <= (reg29[(1'h1):(1'h0)] + reg23);
            end
          reg37 <= reg36;
        end
      else
        begin
          reg27 <= $signed({$signed((^(reg23 >> (8'hbd))))});
          if (wire19)
            begin
              reg28 <= $unsigned(((8'ha5) * $signed($signed({reg27}))));
              reg29 <= $signed($signed($unsigned({$signed(reg22)})));
              reg30 <= (reg22[(4'hc):(3'h5)] >> $signed({((|reg31) ?
                      {reg31} : (wire18 ? (8'ha1) : reg29)),
                  (reg26 ?
                      (reg36 ? reg33 : (7'h41)) : (reg31 ? reg22 : reg34))}));
              reg31 <= $signed($unsigned((reg24[(1'h1):(1'h1)] ?
                  reg21 : (^~{wire20}))));
              reg32 <= (~^{{reg27[(2'h2):(2'h2)]}});
            end
          else
            begin
              reg28 <= reg37[(3'h6):(1'h0)];
              reg29 <= reg21;
              reg30 <= ((((reg34 ? (^~reg37) : $unsigned(reg37)) ?
                  wire20 : (8'hbf)) & (~&{reg32[(1'h1):(1'h0)]})) > (($unsigned((reg22 ?
                          reg36 : reg33)) ?
                      (reg30[(2'h2):(1'h0)] ?
                          (reg26 - wire20) : (~&reg34)) : reg23) ?
                  $signed({$signed(reg25)}) : reg27[(1'h0):(1'h0)]));
            end
        end
      reg38 <= reg22[(1'h0):(1'h0)];
    end
  assign wire39 = wire18[(4'ha):(1'h0)];
  always
    @(posedge clk) begin
      reg40 <= reg26[(4'h8):(4'h8)];
    end
  assign wire41 = $unsigned((!reg36));
  assign wire42 = (~&reg28);
  assign wire43 = $signed((!(~^$signed({(8'hb7)}))));
  assign wire44 = $unsigned(reg36);
  always
    @(posedge clk) begin
      reg45 <= reg21[(4'h8):(2'h2)];
      if ({reg32[(1'h0):(1'h0)]})
        begin
          reg46 <= (($unsigned(((+wire41) ^~ reg38[(4'hc):(3'h5)])) ^~ reg29) ?
              $unsigned(({reg31[(3'h7):(3'h5)], $signed(wire44)} ?
                  $signed($unsigned(wire20)) : $unsigned((wire19 ?
                      reg32 : reg29)))) : {(^{(8'hb7), $signed((8'ha7))})});
          reg47 <= ($unsigned(reg36) ?
              ($unsigned((^~$signed(wire19))) ?
                  reg26 : ((reg36[(1'h0):(1'h0)] ?
                          (reg34 ? reg32 : reg45) : wire44[(3'h7):(3'h6)]) ?
                      ($unsigned(reg45) > wire43[(3'h7):(2'h2)]) : reg28)) : (~&(((~|wire39) ^~ $unsigned(reg27)) ^~ ((wire19 && reg27) || ((8'hba) ?
                  reg31 : reg40)))));
          reg48 <= wire42;
        end
      else
        begin
          reg46 <= (~&(~(((~&reg32) ?
              (+reg26) : (|(8'ha4))) && reg35[(1'h1):(1'h1)])));
          if ((^~(&$unsigned((~&((8'hbe) ^~ reg30))))))
            begin
              reg47 <= (~((-((wire39 | (8'hbb)) ? reg36 : reg29)) << reg38));
              reg48 <= $unsigned($signed(reg37));
            end
          else
            begin
              reg47 <= (^~(|($unsigned(reg24[(1'h0):(1'h0)]) ?
                  $unsigned(reg45) : $signed((|(8'ha2))))));
            end
          if ((~^(reg47[(1'h0):(1'h0)] & $signed(wire42[(1'h0):(1'h0)]))))
            begin
              reg49 <= (~|reg46[(2'h3):(1'h0)]);
              reg50 <= ($unsigned($signed($signed((reg49 * (8'h9d))))) ~^ reg35);
              reg51 <= $signed(reg33[(2'h2):(2'h2)]);
              reg52 <= ((!reg46[(1'h0):(1'h0)]) ^~ (reg38[(3'h5):(1'h1)] ?
                  reg40 : (reg32[(1'h0):(1'h0)] <= $unsigned(wire17))));
            end
          else
            begin
              reg49 <= ($signed(reg48[(1'h1):(1'h0)]) ?
                  reg38 : (~($unsigned($signed(reg25)) ?
                      reg36[(4'h9):(1'h0)] : (reg26[(3'h6):(1'h0)] ?
                          $signed(reg46) : {reg51, reg32}))));
              reg50 <= (($signed($signed(reg37)) ?
                  $signed(({reg27, reg34} ?
                      reg50 : (reg37 ? wire43 : reg21))) : {$signed(wire19),
                      (8'hb6)}) - $signed((-(-(8'hbb)))));
              reg51 <= (reg31 << wire20);
              reg52 <= $signed($unsigned(($signed($signed(reg35)) ?
                  wire20[(4'hd):(3'h5)] : (-reg46))));
            end
          reg53 <= $unsigned(reg45);
        end
      reg54 <= reg26[(3'h6):(2'h3)];
    end
  assign wire55 = ($signed(reg45[(4'h8):(1'h0)]) | wire41);
  assign wire56 = (~^$unsigned((~&(!reg40))));
endmodule
