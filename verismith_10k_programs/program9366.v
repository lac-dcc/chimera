module top
#(parameter param167 = {{((~((8'hb4) - (8'ha2))) + ((+(7'h41)) ? ((8'hb0) ~^ (8'ha1)) : (~^(8'hb6)))), ((((8'hb4) ? (8'hb8) : (8'h9f)) ? ((8'haf) ? (8'h9c) : (8'ha7)) : {(8'ha2)}) <= (((8'hb7) ? (8'haf) : (7'h40)) ? ((7'h40) <<< (8'ha2)) : ((8'had) ? (8'ha5) : (8'hb8))))}, ((|(~{(7'h44), (8'hbf)})) == ((((8'haa) ~^ (8'ha7)) ? ((8'h9d) ? (8'ha6) : (7'h41)) : ((8'hab) ~^ (7'h42))) ? (((7'h41) ? (8'ha5) : (8'ha1)) * (&(8'hac))) : (~{(8'h9f)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire165;
  wire [(3'h5):(1'h0)] wire150;
  wire signed [(5'h11):(1'h0)] wire149;
  wire [(5'h11):(1'h0)] wire147;
  reg signed [(4'hc):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg160 = (1'h0);
  reg [(4'h9):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  assign y = {wire165,
                 wire150,
                 wire149,
                 wire147,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 (1'h0)};
  module5 #() modinst148 (wire147, clk, wire0, wire1, wire4, wire3);
  assign wire149 = ($signed(wire147[(2'h3):(2'h3)]) + wire147[(3'h5):(1'h1)]);
  assign wire150 = (wire2 ?
                       (+wire2) : $unsigned($unsigned(((wire0 >= (8'ha0)) > $unsigned(wire4)))));
  always
    @(posedge clk) begin
      reg151 <= {wire2[(3'h7):(3'h4)]};
      reg152 <= ((-reg151) ?
          wire3 : {(wire149 && wire150[(2'h2):(1'h0)]),
              $signed((wire3[(5'h12):(4'hf)] ?
                  reg151[(1'h0):(1'h0)] : wire147[(2'h3):(2'h3)]))});
      reg153 <= (8'hbd);
      reg154 <= ($unsigned(((&(8'haf)) <= $signed($signed(wire147)))) ?
          reg151[(4'ha):(3'h6)] : {(~(!(~^wire4)))});
      reg155 <= (~&wire149);
    end
  always
    @(posedge clk) begin
      reg156 <= ($signed(reg155) * ((((wire2 >>> wire149) * (+(8'ha4))) ?
          wire4[(2'h3):(2'h3)] : $unsigned(wire0[(5'h11):(5'h10)])) && $unsigned({(+(8'hbe))})));
      if ($unsigned({$unsigned($unsigned(wire150)), wire3}))
        begin
          if (($unsigned({$signed((8'hbb)),
                  ($signed(reg152) + $unsigned(wire4))}) ?
              ((-{reg156[(4'he):(4'ha)], {wire149}}) ?
                  wire1[(3'h7):(2'h3)] : (~^reg152[(2'h2):(1'h0)])) : wire2[(4'hb):(2'h2)]))
            begin
              reg157 <= (reg151 == $unsigned((((-(8'hab)) ?
                  reg156 : (+wire1)) ^~ $signed((~^wire4)))));
              reg158 <= $signed($unsigned((+((|reg152) - (~^wire4)))));
            end
          else
            begin
              reg157 <= $unsigned(((8'h9e) >>> wire1));
              reg158 <= $signed(reg153);
              reg159 <= (8'ha8);
            end
        end
      else
        begin
          reg157 <= reg151;
          if (reg153)
            begin
              reg158 <= $unsigned(reg158[(3'h5):(1'h1)]);
              reg159 <= (({reg159} == $unsigned({reg158})) && reg151);
            end
          else
            begin
              reg158 <= ((+$unsigned(((wire149 ?
                  (8'haf) : wire2) ~^ $unsigned(reg157)))) << ((($signed(reg156) ?
                      (wire150 ?
                          reg152 : wire1) : ((8'hb7) >= wire149)) - $unsigned(reg159)) ?
                  {((8'hb3) >>> wire1[(3'h4):(3'h4)]),
                      (wire149[(4'ha):(4'ha)] ?
                          {reg157} : wire149[(4'hb):(3'h5)])} : (wire147[(3'h4):(2'h3)] ?
                      reg157[(2'h3):(2'h3)] : $signed((wire147 - wire1)))));
            end
          reg160 <= (^~reg152[(2'h2):(2'h2)]);
        end
      reg161 <= wire149;
      reg162 <= $signed((reg160 < $signed((reg154[(3'h4):(2'h2)] <= (~&reg152)))));
    end
  always
    @(posedge clk) begin
      reg163 <= wire0;
      reg164 <= (!(~&(8'hba)));
    end
  module5 #() modinst166 (wire165, clk, wire149, wire3, wire147, wire4);
endmodule

module module5
#(parameter param145 = (((~{((7'h40) ? (8'hb8) : (8'ha4))}) ~^ {(((8'hb4) ? (8'hb9) : (8'ha4)) ~^ ((8'ha4) ~^ (8'hae))), ({(7'h44)} <<< (8'hb9))}) >= (((((8'haa) ^~ (8'hb5)) <<< (7'h44)) + (^~(^~(8'hba)))) ? (^~(-((8'hab) ? (8'h9c) : (7'h42)))) : ((((8'ha9) > (7'h42)) ? (-(8'hb9)) : ((8'hbb) + (8'ha3))) > (&((8'hb7) > (8'h9f)))))), 
parameter param146 = ({param145} ~^ (((+(param145 & param145)) > (param145 ? (param145 ? param145 : param145) : {param145})) > param145)))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire6;
  input wire [(4'h9):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire144;
  wire [(5'h10):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire103;
  wire [(5'h15):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire141;
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire118,
                 wire103,
                 wire101,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire120,
                 wire141,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= (!wire9[(2'h2):(1'h1)]);
    end
  module11 #() modinst61 (.wire12(wire6), .wire15(wire9), .wire13(wire7), .clk(clk), .wire14(reg10), .y(wire60));
  assign wire62 = $signed($unsigned((wire7 - (wire8 <<< {wire8}))));
  assign wire63 = {reg10[(1'h0):(1'h0)]};
  assign wire64 = ((wire8 > {wire62[(2'h3):(1'h1)],
                          {$unsigned(wire62), wire7[(3'h4):(2'h2)]}}) ?
                      reg10[(2'h2):(1'h1)] : (!(~&(wire60[(3'h6):(2'h3)] ?
                          wire7 : (^~(8'hb1))))));
  assign wire65 = ((((8'hba) && ((wire6 | wire9) <= (wire62 ?
                              wire63 : (8'hae)))) ?
                          $unsigned($unsigned((wire8 >= wire62))) : $signed(({reg10,
                              reg10} >>> (wire64 ? wire60 : wire8)))) ?
                      (wire6 ?
                          $signed($unsigned({wire60})) : ($unsigned(reg10) ^~ $signed((reg10 && wire62)))) : {(-$unsigned((~&wire9))),
                          $unsigned(((^reg10) >> $signed(wire7)))});
  module66 #() modinst102 (.wire70(wire9), .clk(clk), .y(wire101), .wire69(wire62), .wire71(reg10), .wire68(wire7), .wire67(wire65));
  assign wire103 = $unsigned({(~|((wire7 >>> wire63) ?
                           $unsigned(wire101) : (wire63 ? wire7 : wire101)))});
  module104 #() modinst119 (.wire106(wire7), .wire108(wire6), .clk(clk), .wire109(wire60), .wire107(wire101), .wire105(wire62), .y(wire118));
  assign wire120 = (~wire6[(5'h10):(4'hc)]);
  module121 #() modinst142 (.wire125(wire118), .clk(clk), .y(wire141), .wire124(wire62), .wire122(reg10), .wire123(wire65));
  assign wire143 = $signed(wire141);
  assign wire144 = (-wire120[(2'h2):(1'h0)]);
endmodule

module module121
#(parameter param140 = (((8'ha3) <<< (8'haa)) ? {((8'ha8) && (((8'hb4) >= (8'hb7)) <= ((7'h40) != (8'hb1))))} : (((((7'h41) ? (8'haf) : (8'hbd)) - ((8'hab) != (8'hb2))) ~^ ({(8'ha4)} * ((8'hb6) >>> (8'hab)))) < ({((7'h42) > (8'ha6))} >>> (((8'h9f) ? (8'haa) : (8'ha3)) ? ((8'had) ? (8'hb0) : (8'hb4)) : ((8'hbf) ? (8'haa) : (8'hba)))))))
(y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire125;
  input wire signed [(4'h9):(1'h0)] wire124;
  input wire signed [(4'hf):(1'h0)] wire123;
  input wire signed [(2'h2):(1'h0)] wire122;
  wire signed [(4'hf):(1'h0)] wire139;
  wire [(5'h13):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire133;
  wire signed [(5'h10):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire126;
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg127 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire126,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire126 = ($signed((wire124 ?
                       (^~((8'hba) ~^ wire125)) : ($unsigned(wire125) ?
                           $signed((7'h43)) : wire124[(3'h7):(3'h5)]))) ^ {wire123});
  always
    @(posedge clk) begin
      reg127 <= (((~&wire125[(3'h7):(1'h1)]) <= $unsigned((wire124 ?
              (wire122 != wire123) : wire123))) ?
          (8'hb7) : $unsigned((-$signed($signed(wire123)))));
      reg128 <= $signed(reg127[(3'h6):(3'h5)]);
      reg129 <= ({wire126,
              (&($unsigned(reg128) ? $unsigned(wire125) : (~&reg127)))} ?
          wire126 : {(!reg127[(4'h9):(3'h6)]), wire126});
    end
  assign wire130 = (wire123 >> (($unsigned((wire126 | (8'had))) >= wire125[(4'hc):(2'h2)]) == $signed($unsigned((reg127 ~^ reg128)))));
  assign wire131 = $signed(($unsigned(wire126) << $signed($unsigned((wire122 ?
                       wire130 : reg129)))));
  assign wire132 = (wire123 <= wire130);
  assign wire133 = ((wire132[(3'h7):(3'h4)] | (((wire125 >>> wire130) ?
                           $unsigned(wire124) : (wire132 ?
                               wire131 : (8'hba))) < ($signed((8'h9e)) && (wire124 == wire132)))) ?
                       (&wire123[(2'h3):(2'h2)]) : (-(-($unsigned(wire122) ?
                           wire123[(4'ha):(3'h7)] : $unsigned(wire122)))));
  assign wire134 = {reg127[(4'hb):(4'hb)],
                       $signed(($unsigned((wire131 ?
                           wire132 : wire130)) << $signed((reg127 & wire122))))};
  assign wire135 = $signed((8'ha1));
  assign wire136 = $unsigned((-wire132[(4'he):(2'h2)]));
  assign wire137 = wire136[(4'ha):(1'h1)];
  assign wire138 = (wire135 >= ($signed((wire135 ?
                       wire134 : {wire123})) >>> $unsigned({wire126,
                       wire134[(5'h12):(1'h1)]})));
  assign wire139 = wire125;
endmodule

module module104
#(parameter param116 = {((|(^((8'ha6) ~^ (8'hb2)))) ? {((~|(8'hb9)) ? ((8'hbd) ? (8'hb2) : (8'h9f)) : (~(8'ha7))), (!((8'hb7) ? (8'hb1) : (8'h9c)))} : (-{((8'hb1) ? (8'ha4) : (8'hab))})), ((({(8'hb2), (8'ha9)} ? ((7'h44) && (8'hbf)) : {(8'hac), (8'hba)}) ^ (+(~|(7'h42)))) ? (|({(7'h40), (8'hba)} ? ((8'hbf) > (8'hac)) : ((8'hb7) > (8'had)))) : ((|((8'hbf) ? (8'had) : (8'hb2))) ? (((8'hb7) ? (8'hae) : (8'h9d)) ? ((8'ha1) > (8'hb6)) : ((8'hb4) ? (8'hb4) : (7'h41))) : (!{(8'ha9)})))}, 
parameter param117 = (({param116} && {{param116}, (~|param116)}) ? (param116 ? param116 : ((+(&(7'h40))) ? (~param116) : ((8'h9c) < {param116}))) : (((&param116) - {param116, param116}) ? param116 : param116)))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire109;
  input wire [(5'h11):(1'h0)] wire108;
  input wire signed [(5'h11):(1'h0)] wire107;
  input wire [(3'h5):(1'h0)] wire106;
  input wire signed [(4'hd):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  assign y = {wire115, wire114, wire113, wire112, wire111, wire110, (1'h0)};
  assign wire110 = $unsigned($unsigned(($unsigned((^wire107)) > ({wire109} || (wire109 ?
                       wire105 : wire105)))));
  assign wire111 = wire106[(1'h1):(1'h0)];
  assign wire112 = wire108[(4'hb):(3'h7)];
  assign wire113 = wire110[(1'h1):(1'h0)];
  assign wire114 = {(~(8'hb2)), $unsigned((^{$signed(wire109)}))};
  assign wire115 = wire113[(1'h0):(1'h0)];
endmodule

module module66  (y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire71;
  input wire signed [(5'h13):(1'h0)] wire70;
  input wire signed [(5'h13):(1'h0)] wire69;
  input wire [(4'h8):(1'h0)] wire68;
  input wire [(5'h10):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire72;
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire72 = wire71;
  assign wire73 = wire68[(3'h4):(2'h2)];
  assign wire74 = {(wire70 != (~^((wire71 & wire70) ?
                          $unsigned(wire69) : (wire68 ? wire69 : wire73)))),
                      $unsigned(wire67[(4'ha):(1'h0)])};
  assign wire75 = (8'hb4);
  assign wire76 = (^~(wire67[(3'h5):(2'h2)] | $signed(wire74[(4'h9):(4'h9)])));
  assign wire77 = $unsigned(((wire74[(4'h8):(3'h6)] ?
                          (&wire75) : (~$unsigned(wire67))) ?
                      wire73[(4'hd):(4'hc)] : wire74[(2'h2):(2'h2)]));
  assign wire78 = wire75[(2'h3):(2'h2)];
  assign wire79 = (wire69 || {(~|$signed((+wire69)))});
  assign wire80 = $unsigned((8'hab));
  assign wire81 = (~{(-{{wire76, wire71}}), wire70[(3'h5):(1'h0)]});
  assign wire82 = ($unsigned($unsigned({wire76[(4'h8):(4'h8)]})) ?
                      $unsigned({wire73[(2'h2):(2'h2)]}) : wire79);
  assign wire83 = wire71[(2'h2):(2'h2)];
  assign wire84 = wire79[(3'h4):(2'h3)];
  assign wire85 = $signed($signed((8'hac)));
  assign wire86 = wire71[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg87 <= ((&(!wire77)) ? $unsigned($unsigned({{wire80}})) : wire84);
      reg88 <= (wire79 * ({((|wire71) ? wire84 : (wire76 >> wire78)),
          (8'hb7)} * (~wire67)));
      reg89 <= (((|(~|wire77[(1'h1):(1'h0)])) <= wire78[(2'h3):(1'h1)]) >= (~|$signed(wire74[(3'h4):(1'h0)])));
      if (wire77)
        begin
          if ($signed($unsigned(((~{wire81}) ? wire78 : $unsigned((!wire71))))))
            begin
              reg90 <= ($signed({$signed(wire67)}) ?
                  ($signed({wire71[(1'h1):(1'h0)]}) ?
                      ($signed(wire75[(3'h4):(2'h3)]) <= $signed((wire78 ?
                          wire78 : wire84))) : (wire70[(5'h10):(4'h8)] ?
                          wire82[(3'h6):(3'h5)] : (~$signed(wire73)))) : $signed($unsigned($signed($unsigned(wire78)))));
              reg91 <= $signed((8'hbb));
              reg92 <= $signed($unsigned((wire81[(4'ha):(4'h8)] ?
                  wire68 : {(^~wire79)})));
              reg93 <= $signed($signed($unsigned(({wire68,
                  reg88} > (^~wire80)))));
              reg94 <= $unsigned(($signed({(!reg92),
                      (wire78 ? wire68 : wire67)}) ?
                  (($unsigned((8'h9d)) << (wire79 < wire83)) ?
                      ($signed(wire77) ?
                          (wire79 ? reg91 : wire74) : {(8'hbb),
                              wire67}) : ((reg92 && (8'hbe)) ?
                          wire78 : $signed(wire74))) : $signed((wire74[(4'ha):(4'h8)] * (!wire78)))));
            end
          else
            begin
              reg90 <= wire73;
            end
          reg95 <= $unsigned(reg87);
          if ((^~{wire83}))
            begin
              reg96 <= wire71[(2'h2):(1'h1)];
              reg97 <= {$signed((~^reg94)), (8'hb3)};
              reg98 <= $unsigned(($unsigned(((wire71 | wire80) + $unsigned((7'h43)))) ?
                  $unsigned(reg96[(1'h0):(1'h0)]) : $signed($unsigned({reg91,
                      wire82}))));
              reg99 <= {(((^~(~^wire72)) ?
                          $unsigned((~^wire77)) : ($unsigned(reg93) < (wire85 < wire80))) ?
                      {reg97[(2'h2):(1'h1)]} : $unsigned(wire86)),
                  (wire85[(5'h11):(2'h2)] != wire80)};
            end
          else
            begin
              reg96 <= {$signed($signed(wire80[(2'h3):(2'h2)])),
                  $unsigned(wire81)};
              reg97 <= reg88[(4'h8):(2'h2)];
              reg98 <= reg93[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg90 <= ((($signed({reg95, (8'hb4)}) >> $unsigned(wire69)) ?
              reg90[(3'h4):(1'h0)] : ((~&(wire67 ? wire69 : wire80)) ?
                  (reg97 ?
                      wire75[(1'h0):(1'h0)] : $unsigned(wire76)) : reg91[(2'h3):(2'h2)])) <= ($signed(wire85) ?
              wire83[(3'h7):(3'h7)] : (+{$signed((8'h9c)),
                  (wire81 ? wire67 : wire82)})));
        end
      reg100 <= $unsigned(((|(reg89 == wire77)) + (wire72[(3'h5):(1'h0)] ?
          $signed((reg98 ? wire71 : reg93)) : ((~&wire86) ?
              $unsigned(reg87) : $unsigned(wire84)))));
    end
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire59,
                 wire56,
                 wire55,
                 wire37,
                 wire36,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg58,
                 reg57,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 (1'h0)};
  assign wire16 = $signed($unsigned($unsigned(wire14[(4'h8):(1'h1)])));
  assign wire17 = {$unsigned(wire12)};
  assign wire18 = $signed({(~|wire13[(4'h8):(3'h5)]),
                      $signed(($signed((8'hb1)) || (wire15 ?
                          (8'hbd) : wire12)))});
  assign wire19 = (~^$unsigned($unsigned($signed((^wire15)))));
  assign wire20 = $signed((^wire15));
  assign wire21 = (8'ha3);
  assign wire22 = ($unsigned(wire12[(3'h7):(1'h0)]) ?
                      wire15[(3'h5):(2'h3)] : (&(&((wire19 ? wire14 : wire18) ?
                          wire18[(1'h1):(1'h1)] : {(8'ha9), wire13}))));
  assign wire23 = (wire22 & wire21);
  assign wire24 = {$unsigned(wire12),
                      {$signed((wire13[(3'h5):(3'h4)] ? wire23 : wire18)),
                          ((wire12[(4'h9):(3'h5)] ? (-wire18) : wire22) ?
                              wire18[(4'hb):(4'ha)] : wire16)}};
  always
    @(posedge clk) begin
      reg25 <= wire23;
      if (((^(8'h9c)) ?
          ($unsigned((~|{wire23,
              wire13})) & $signed($unsigned((wire19 == wire19)))) : $unsigned($signed((8'ha1)))))
        begin
          reg26 <= wire16;
          reg27 <= (wire20[(3'h4):(1'h0)] <= wire24);
          reg28 <= wire17[(4'ha):(4'ha)];
        end
      else
        begin
          if ($unsigned({wire13[(1'h1):(1'h1)],
              (^~(wire23 >= ((8'hb9) ? wire22 : reg28)))}))
            begin
              reg26 <= wire21;
              reg27 <= (((wire21[(3'h6):(3'h4)] ?
                      {$signed(reg26),
                          wire13} : {(+wire18)}) <= (wire24[(4'hb):(4'ha)] * $unsigned((reg27 >>> reg25)))) ?
                  wire19[(2'h3):(1'h1)] : (wire23[(3'h4):(2'h3)] ^ (~|((wire14 ?
                      reg25 : wire17) <= $unsigned(wire12)))));
              reg28 <= $unsigned((wire19 | (~^(+wire16))));
            end
          else
            begin
              reg26 <= (-($unsigned(reg27) >= ($signed($unsigned(wire14)) <= ((wire21 ?
                      wire13 : wire21) ?
                  reg28[(3'h7):(3'h6)] : {wire17}))));
            end
          reg29 <= (8'ha9);
          if ((~&wire20[(3'h4):(1'h0)]))
            begin
              reg30 <= ($unsigned(((wire14[(1'h0):(1'h0)] ?
                          (^~reg28) : (^wire19)) ?
                      {(reg27 ? wire18 : wire23),
                          wire15[(1'h0):(1'h0)]} : $unsigned(((8'hb8) <<< wire21)))) ?
                  $signed((((wire12 ^~ reg25) ? wire19 : (-wire13)) ?
                      (wire12 ?
                          $unsigned(reg28) : wire13[(1'h0):(1'h0)]) : (|(wire24 ?
                          reg29 : wire16)))) : $signed((|$unsigned(wire14))));
              reg31 <= (wire19 ?
                  $signed(((~|$unsigned(wire14)) || (wire15 <<< $unsigned(wire18)))) : $signed($signed($signed($signed(reg28)))));
            end
          else
            begin
              reg30 <= $signed((wire14[(3'h6):(3'h4)] - ((&$unsigned(wire16)) ?
                  reg28[(1'h0):(1'h0)] : wire20[(1'h0):(1'h0)])));
              reg31 <= reg30[(1'h0):(1'h0)];
              reg32 <= wire13[(3'h4):(1'h0)];
              reg33 <= $unsigned($signed((!(7'h44))));
            end
          reg34 <= (-{$signed((~&$unsigned(reg26))), reg32});
        end
      reg35 <= reg28;
    end
  assign wire36 = wire12;
  assign wire37 = $signed($signed(wire22[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      if ({(-$signed({(&reg27)}))})
        begin
          reg38 <= $unsigned($signed({wire37[(2'h3):(2'h3)],
              wire18[(4'hb):(3'h4)]}));
          reg39 <= ($signed((((~^wire19) & reg32[(3'h7):(3'h5)]) <= (~^reg29[(2'h2):(1'h1)]))) << reg26);
          reg40 <= $signed(((^~reg30) < reg25));
        end
      else
        begin
          reg38 <= (|($signed($unsigned(reg28)) ? (8'hae) : reg29));
        end
      if ($signed((^~$signed($unsigned((wire12 ? wire24 : reg25))))))
        begin
          reg41 <= (|wire19[(5'h15):(4'hc)]);
          reg42 <= ((wire24 == (&((~&(8'h9e)) <= (wire12 ? wire15 : wire19)))) ?
              $unsigned($unsigned((8'hb2))) : $unsigned($signed(((reg35 ?
                      reg25 : reg32) ?
                  (&reg33) : reg35[(4'hf):(4'he)]))));
          reg43 <= wire22[(5'h12):(4'he)];
          reg44 <= $unsigned((((7'h43) ?
              $signed((&wire18)) : (8'ha7)) < (^~$unsigned(reg27[(3'h7):(1'h0)]))));
        end
      else
        begin
          reg41 <= {(8'hac)};
          reg42 <= $unsigned({(~^reg40),
              ({wire36, wire37} ? wire16 : wire13[(4'h9):(2'h3)])});
          reg43 <= wire13[(1'h1):(1'h0)];
        end
      reg45 <= ((~^(reg34[(2'h2):(1'h0)] < wire21)) < {$unsigned(((reg27 != wire16) == $signed(wire20))),
          $signed($unsigned($unsigned((8'had))))});
      reg46 <= reg28;
    end
  always
    @(posedge clk) begin
      reg47 <= (~|(((^reg34) >>> reg35[(4'hb):(4'h8)]) ?
          $signed($signed(wire21[(4'h8):(3'h5)])) : wire15));
      reg48 <= {reg29, wire13};
      reg49 <= reg31;
    end
  always
    @(posedge clk) begin
      reg50 <= reg33[(3'h7):(2'h2)];
      reg51 <= (~&(+$unsigned((8'h9f))));
      reg52 <= ((reg39 ^ reg45[(3'h4):(3'h4)]) << reg35[(4'h9):(2'h2)]);
      reg53 <= wire19[(4'hd):(4'hd)];
      reg54 <= $signed((reg43 ?
          $unsigned(($signed(reg41) > {wire23})) : reg47));
    end
  assign wire55 = $unsigned({(^~(^~$signed(wire24))), reg52});
  assign wire56 = reg32;
  always
    @(posedge clk) begin
      reg57 <= ((8'hb0) ?
          $unsigned(({(reg52 || reg30), reg44[(1'h0):(1'h0)]} ^ ({reg32,
              wire16} > $signed(reg31)))) : {$signed($unsigned($signed((8'ha0)))),
              (~|(7'h42))});
      reg58 <= (-(8'ha2));
    end
  assign wire59 = (($signed($unsigned((^(8'hbc)))) ?
                          (+reg47[(5'h13):(4'h9)]) : wire56[(4'hf):(2'h3)]) ?
                      $signed(wire12[(1'h1):(1'h0)]) : (~(^~reg52)));
endmodule
