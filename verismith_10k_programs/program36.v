module top
#(parameter param156 = {(((-((7'h43) | (8'hbb))) != (~&(~(8'had)))) != (-(((7'h42) < (8'hbc)) >= {(8'had), (8'hbd)}))), (({(~(8'ha5)), (^~(8'ha6))} && (((8'hb8) ? (8'hbc) : (7'h44)) ^ {(8'ha0)})) ? ({((8'ha3) ? (8'h9d) : (8'hab)), ((8'hb7) ? (8'ha1) : (8'ha1))} * (((8'haa) ? (8'hb9) : (8'hbf)) ? ((8'hbf) ? (7'h43) : (8'ha7)) : {(8'ha0), (7'h42)})) : {((!(8'hbb)) > ((8'h9e) <<< (8'hb1))), (~^{(8'hb6), (8'ha3)})})})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire154;
  wire [(3'h5):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire35;
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  assign y = {wire154,
                 wire50,
                 wire49,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire35,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = $signed($unsigned(wire3));
  assign wire6 = wire2[(3'h7):(3'h4)];
  assign wire7 = (!(~^(wire1[(2'h2):(2'h2)] ?
                     wire4 : (wire2[(3'h7):(1'h1)] ?
                         $unsigned(wire3) : (-wire5)))));
  assign wire8 = wire7;
  module9 #() modinst36 (.y(wire35), .wire10(wire8), .wire11(wire4), .wire14(wire0), .wire12(wire7), .wire13(wire6), .clk(clk));
  assign wire37 = $unsigned((+$unsigned((~|(~&wire1)))));
  assign wire38 = wire4;
  assign wire39 = wire6[(3'h5):(2'h3)];
  assign wire40 = $unsigned(wire6[(3'h7):(2'h3)]);
  assign wire41 = (wire4[(3'h5):(1'h0)] >> ($unsigned({$unsigned((8'hb9))}) ~^ wire37));
  always
    @(posedge clk) begin
      reg42 <= (wire1[(4'h9):(4'h8)] ^~ (wire40[(3'h7):(3'h6)] > {(wire41 ~^ $signed(wire35)),
          (~|wire2)}));
      if (wire1)
        begin
          reg43 <= ({(~|$signed($unsigned(wire5))), wire38[(4'hd):(2'h2)]} ?
              (wire5 ?
                  $signed((wire35 >>> wire40)) : (~&(^~(wire38 > wire7)))) : wire1[(4'h8):(1'h1)]);
          reg44 <= ($signed(reg42) ^~ ($signed((|(~&wire6))) + wire8[(3'h6):(1'h0)]));
        end
      else
        begin
          reg43 <= (8'hb1);
          reg44 <= (wire35 & (&(($signed(wire0) ?
              $unsigned(reg42) : wire41[(5'h10):(2'h3)]) <<< {wire2[(3'h4):(3'h4)],
              $signed((8'hbc))})));
          reg45 <= $unsigned(wire4);
          reg46 <= {(($signed(wire7) <<< wire5[(4'ha):(4'h8)]) ^~ wire0[(3'h4):(1'h0)]),
              ($signed(((-wire35) && wire0)) > $unsigned(((wire5 ?
                      wire7 : wire35) ?
                  (|wire6) : wire3[(2'h2):(1'h0)])))};
          reg47 <= $signed($signed(wire39[(4'hf):(4'he)]));
        end
      reg48 <= ($signed((^((~|(8'hb3)) ? (&wire7) : ((8'had) > (8'hb7))))) ?
          ($unsigned(reg47) ?
              (~|wire4[(1'h0):(1'h0)]) : reg46[(2'h2):(1'h1)]) : $unsigned(({wire1} <<< (^$unsigned(wire40)))));
    end
  assign wire49 = (~^(!wire5[(1'h0):(1'h0)]));
  assign wire50 = reg44;
  module51 #() modinst155 (.wire54(wire40), .clk(clk), .wire55(wire7), .wire52(reg42), .y(wire154), .wire53(reg45));
endmodule

module module51
#(parameter param153 = (((({(8'haa), (8'hb5)} ? ((7'h40) ? (8'hb2) : (8'hbf)) : ((8'h9c) ? (8'hac) : (8'hae))) ? ((7'h41) ? ((8'ha4) == (8'hbb)) : ((8'hb1) ? (7'h43) : (8'hb0))) : (!((7'h41) + (7'h40)))) ? (~&(((8'hb2) >= (8'hb1)) << ((8'ha2) ? (8'hb8) : (7'h41)))) : ((-(^(8'hb7))) ? ((8'hb2) ? (~(7'h43)) : ((7'h42) ? (8'hb4) : (8'hb3))) : ((^~(7'h40)) ? ((8'hbd) ? (8'ha2) : (8'haa)) : (~(8'hab))))) & (|(&(|((8'h9f) ? (8'ha1) : (8'ha9)))))))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire55;
  input wire [(5'h15):(1'h0)] wire54;
  input wire [(5'h10):(1'h0)] wire53;
  input wire [(5'h10):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire151;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  wire signed [(2'h3):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire104;
  assign y = {wire151, wire108, wire107, wire106, wire104, (1'h0)};
  module56 #() modinst105 (.wire58(wire55), .wire59(wire52), .y(wire104), .clk(clk), .wire57(wire54), .wire60(wire53));
  assign wire106 = (wire54[(4'h9):(3'h5)] ^ wire53);
  assign wire107 = {(wire52 ? (!(|{wire53, wire54})) : (~|{(-wire52)}))};
  assign wire108 = ($unsigned($signed(wire52[(4'h9):(3'h4)])) ?
                       (8'ha9) : wire55);
  module109 #() modinst152 (.wire110(wire52), .wire113(wire104), .y(wire151), .wire112(wire53), .wire111(wire55), .clk(clk));
endmodule

module module9
#(parameter param34 = {((8'hb9) ? (({(8'ha4), (8'hae)} ? {(8'hb6)} : ((8'haa) ? (8'h9f) : (8'hba))) <= ((~(8'hbf)) ? ((8'hab) ? (8'ha4) : (8'hb7)) : ((8'hb4) ? (8'hbf) : (8'hb7)))) : {((^(8'hb8)) ? (~&(7'h44)) : ((8'hb0) ? (8'h9f) : (8'h9d)))}), {((+(8'ha6)) | (((8'ha6) ^ (8'hb7)) ? ((8'h9c) ^ (7'h41)) : ((8'hba) & (8'hbb)))), (8'hb3)}})
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire15 = wire10;
  assign wire16 = $unsigned($unsigned((|wire14[(4'ha):(4'h9)])));
  assign wire17 = ($signed((+$signed((wire10 && wire14)))) == ((wire11 ?
                      $unsigned($signed(wire12)) : ((wire15 ? wire10 : wire15) ?
                          wire13 : wire12[(4'h9):(2'h3)])) << wire15[(4'h9):(1'h0)]));
  assign wire18 = (wire15 + $unsigned({(|(8'hbd)),
                      ((!(7'h44)) ? wire13 : wire11)}));
  assign wire19 = $signed((^wire11[(4'h8):(2'h2)]));
  always
    @(posedge clk) begin
      reg20 <= ((wire13 || wire16) ?
          (^~wire12[(1'h0):(1'h0)]) : wire12[(3'h6):(3'h5)]);
      if ($signed((~^(wire15[(4'hc):(3'h7)] > wire16))))
        begin
          reg21 <= ((wire17 != wire10) ?
              (($signed((8'ha5)) != $unsigned((reg20 ? wire16 : wire14))) ?
                  (7'h42) : $signed(wire15[(4'ha):(1'h0)])) : {($signed(reg20) ?
                      (!$unsigned(wire18)) : wire18),
                  (((^wire12) ^ {wire16,
                      wire14}) | ($signed((8'hb8)) >> $unsigned(reg20)))});
        end
      else
        begin
          reg21 <= ((^$unsigned(wire11[(3'h4):(3'h4)])) ?
              wire11[(3'h4):(2'h3)] : $signed($signed($signed((wire11 || reg21)))));
          reg22 <= wire11;
          if ((((wire11 ? $unsigned((8'hba)) : wire19) ?
              $unsigned($signed(wire11)) : $signed(wire15)) ~^ $unsigned(wire18[(4'hf):(4'he)])))
            begin
              reg23 <= (^$unsigned(wire14[(4'hd):(4'h9)]));
            end
          else
            begin
              reg23 <= ($signed($unsigned({reg22})) ?
                  ((|((-(7'h41)) * wire19)) != $signed({((8'h9e) * wire12),
                      (reg22 ? wire18 : reg21)})) : {wire10,
                      $signed(((8'h9e) < wire16))});
              reg24 <= $unsigned((~|(((reg20 != wire11) ?
                  (reg22 >= wire17) : (+wire15)) >> ($unsigned(wire19) ?
                  {reg23} : ((7'h41) ? wire14 : wire17)))));
              reg25 <= (^wire10);
              reg26 <= $signed(($signed(((wire14 > reg20) | (reg24 ^~ reg24))) > {{$unsigned(wire19),
                      (reg25 ? reg20 : wire14)},
                  (wire15[(4'he):(3'h6)] << $signed(wire13))}));
            end
        end
      reg27 <= reg23;
      reg28 <= (&($unsigned((-(wire13 ? wire11 : wire12))) ?
          (wire11[(3'h6):(2'h2)] + $signed(reg27)) : $unsigned(reg27)));
      reg29 <= ((~|$signed(wire11)) ? wire15 : $signed($unsigned(reg22)));
    end
  assign wire30 = wire12[(3'h6):(2'h3)];
  assign wire31 = (^((&{$signed(wire19), (~|(8'hbc))}) != $signed(wire10)));
  assign wire32 = wire18;
  assign wire33 = wire19;
endmodule

module module109
#(parameter param149 = ({((((7'h44) <= (7'h44)) ? ((8'haf) ? (8'hbc) : (8'ha6)) : ((8'ha7) > (8'hb5))) ? {((7'h44) * (8'hac))} : (~((8'hb4) | (8'haf))))} ? (~((~^((8'ha5) ? (8'hb1) : (8'hbb))) ^ ((^~(8'hb2)) || ((8'ha0) ? (8'hb9) : (8'hbc))))) : ((~((!(8'hb1)) ? ((8'hb4) ^~ (8'ha7)) : ((8'haf) & (8'hb4)))) ? (+((^~(8'hb3)) || {(8'hb3), (8'ha7)})) : ((^((8'hbb) ? (8'haa) : (8'h9f))) <<< {((8'hb4) < (8'hbb))}))), 
parameter param150 = param149)
(y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire113;
  input wire signed [(3'h5):(1'h0)] wire112;
  input wire [(4'ha):(1'h0)] wire111;
  input wire signed [(5'h10):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire148;
  wire signed [(5'h10):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire135;
  wire signed [(5'h12):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(4'h8):(1'h0)] wire131;
  wire [(5'h11):(1'h0)] wire130;
  wire [(5'h12):(1'h0)] wire129;
  wire [(5'h15):(1'h0)] wire128;
  wire signed [(3'h6):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  assign y = {wire148,
                 wire142,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg141,
                 reg140,
                 reg139,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire114 = (~wire111[(3'h5):(2'h2)]);
  assign wire115 = wire114[(2'h2):(2'h2)];
  assign wire116 = wire114;
  assign wire117 = ($unsigned(wire111) ?
                       wire110[(4'h8):(1'h1)] : (^((wire112 ?
                               wire115[(4'hd):(3'h5)] : (wire112 == (8'hae))) ?
                           (wire114[(3'h7):(3'h7)] ~^ (-wire110)) : $unsigned(wire116))));
  always
    @(posedge clk) begin
      if ((+$unsigned(wire114[(3'h4):(3'h4)])))
        begin
          reg118 <= $signed($unsigned($unsigned(($unsigned(wire114) ?
              wire110 : $signed(wire116)))));
          if (wire116[(2'h2):(2'h2)])
            begin
              reg119 <= (($unsigned(wire113[(3'h5):(1'h1)]) ?
                  {$signed((^~wire115))} : ((wire110[(4'h8):(4'h8)] ~^ {wire116,
                      wire113}) <= (~wire116[(3'h7):(2'h2)]))) ^ wire110);
              reg120 <= $signed(wire114[(4'h8):(3'h7)]);
              reg121 <= {wire112[(3'h5):(1'h1)],
                  {((((8'ha2) ? wire111 : wire115) ?
                          wire112[(3'h5):(3'h4)] : $unsigned(wire111)) > $signed((~wire113))),
                      (wire112 && (((8'ha2) + wire110) ?
                          (wire113 & wire117) : wire116[(3'h7):(3'h5)]))}};
              reg122 <= wire116[(4'ha):(2'h3)];
              reg123 <= (reg120 <= {(+wire110[(4'ha):(3'h6)])});
            end
          else
            begin
              reg119 <= $signed((($unsigned({wire115}) * {$unsigned((8'ha0))}) - $unsigned({reg120[(3'h6):(3'h6)],
                  {reg123, reg121}})));
              reg120 <= ((-((reg123[(4'hf):(4'hb)] >> (wire112 ?
                      wire116 : wire110)) == $signed($signed(wire117)))) ?
                  $signed({reg123[(3'h7):(1'h1)]}) : (|(^~$signed({reg120}))));
              reg121 <= $unsigned(reg118);
              reg122 <= $unsigned(reg123);
              reg123 <= $signed(reg123[(4'hb):(2'h2)]);
            end
          reg124 <= ($unsigned((($signed(reg123) ? (~&reg118) : (^~(7'h42))) ?
              wire113[(3'h4):(1'h1)] : $signed((wire116 + wire115)))) & wire113);
          reg125 <= {($signed(reg119) ?
                  (($signed(wire115) != reg123) ^ $unsigned((8'ha3))) : reg123),
              $signed($unsigned((^~wire113[(3'h6):(1'h0)])))};
        end
      else
        begin
          reg118 <= (reg122[(2'h2):(1'h1)] >>> (reg121[(2'h3):(1'h0)] ?
              $unsigned((+$signed((8'hb9)))) : (^{(reg124 >= wire112),
                  {reg120, reg125}})));
          reg119 <= reg125;
          if ($signed(($unsigned(reg120[(4'h9):(3'h5)]) ^~ $unsigned(((~|wire111) ?
              $signed((8'haf)) : $unsigned((7'h44)))))))
            begin
              reg120 <= ((!reg124[(4'hb):(3'h5)]) ?
                  $unsigned(reg118) : wire117);
              reg121 <= (({(wire114 ?
                              $unsigned(wire111) : wire112[(2'h3):(1'h1)])} ?
                      {$signed((reg118 ? wire116 : wire110)),
                          $unsigned(reg121)} : $unsigned($signed((reg121 >= wire113)))) ?
                  {wire113} : reg118);
              reg122 <= ((reg125[(4'ha):(1'h0)] ?
                      $signed(($signed(wire110) ?
                          (reg120 & wire111) : reg120[(3'h4):(3'h4)])) : $unsigned((^(reg123 + wire115)))) ?
                  (&wire117[(1'h0):(1'h0)]) : reg124[(1'h1):(1'h0)]);
              reg123 <= reg124[(3'h7):(3'h6)];
            end
          else
            begin
              reg120 <= $signed((~|(&reg120)));
              reg121 <= $signed(wire114);
            end
        end
      reg126 <= reg122[(3'h6):(2'h3)];
      reg127 <= ($unsigned((^~$unsigned($signed(reg118)))) ?
          $signed(wire117) : wire111);
    end
  assign wire128 = $unsigned($unsigned((+(!((8'hb4) ? wire113 : (8'haf))))));
  assign wire129 = (~(reg124[(4'h8):(2'h3)] <= $unsigned(reg122[(1'h0):(1'h0)])));
  assign wire130 = ((^(~^(((8'ha9) && reg127) ?
                       (^~reg118) : (wire112 < wire110)))) & (~reg127[(3'h5):(2'h3)]));
  assign wire131 = (((|((wire130 >>> reg125) | reg123)) ?
                           (($unsigned(wire116) ~^ (&wire114)) << $signed((reg122 || wire129))) : reg126) ?
                       (^~{(((8'hbe) >= reg120) && wire113),
                           $unsigned((reg118 <<< wire130))}) : wire115[(4'h9):(3'h6)]);
  assign wire132 = $signed((8'ha7));
  assign wire133 = wire131[(3'h5):(1'h1)];
  assign wire134 = ((!reg120[(3'h6):(1'h1)]) ^ (^~(|$unsigned(reg122))));
  assign wire135 = $signed({reg118[(3'h4):(2'h3)]});
  assign wire136 = reg126[(3'h5):(1'h0)];
  assign wire137 = {($signed({$signed((8'hb9)), (wire131 < reg119)}) ?
                           reg125[(4'hb):(1'h0)] : ((&$signed(wire116)) ?
                               reg126 : (wire112 ~^ reg118))),
                       $signed((~&wire117))};
  assign wire138 = wire128;
  always
    @(posedge clk) begin
      reg139 <= $signed(((|wire110) << wire136[(2'h2):(1'h1)]));
      reg140 <= ((+$unsigned(wire128[(5'h12):(4'hb)])) * wire138[(2'h2):(1'h1)]);
      reg141 <= (reg126 >> $signed($signed((8'h9c))));
    end
  assign wire142 = reg126[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg143 <= $unsigned(reg121);
      reg144 <= (8'hac);
      reg145 <= (($signed((&$signed(reg141))) ?
          $signed((wire117 ?
              (8'h9e) : {reg140, wire111})) : reg123[(2'h2):(1'h1)]) & wire138);
      reg146 <= ((~&(+wire128[(4'ha):(3'h5)])) ^~ ($signed((((8'haa) ?
              wire129 : wire142) ?
          (reg126 | reg123) : (~|wire115))) + (((wire133 ? reg123 : wire135) ?
          (+reg118) : wire133) ^ {wire135})));
      reg147 <= wire112;
    end
  assign wire148 = (wire116 ^~ $unsigned((7'h42)));
endmodule

module module56
#(parameter param103 = (~(~^((^~(8'hb2)) ? (~^(^(8'ha7))) : (+((8'hbd) >> (8'hb6)))))))
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire60;
  input wire [(3'h4):(1'h0)] wire59;
  input wire signed [(5'h11):(1'h0)] wire58;
  input wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire61;
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire61,
                 reg95,
                 reg94,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire61 = ({$signed((-wire59[(1'h1):(1'h0)]))} || wire58);
  always
    @(posedge clk) begin
      reg62 <= (~&(((^~((8'ha4) ?
          wire57 : wire60)) * wire57) >>> ({(wire61 & (8'ha0)),
          ((8'h9d) ? wire60 : wire58)} || $signed(wire58))));
      reg63 <= $signed($signed($unsigned((-(reg62 ? wire59 : wire61)))));
      reg64 <= (^(wire61 || $unsigned(wire60)));
    end
  always
    @(posedge clk) begin
      if (((|reg64[(1'h0):(1'h0)]) == $signed(wire59)))
        begin
          reg65 <= reg62;
        end
      else
        begin
          reg65 <= {$signed(wire59)};
          reg66 <= $unsigned($signed(reg65));
          reg67 <= wire58;
        end
      if (wire58)
        begin
          if ($unsigned(((reg67[(4'h8):(3'h6)] ?
                  reg67 : wire59[(1'h1):(1'h0)]) ?
              $signed(reg62) : $signed(($signed((8'hb9)) ?
                  {wire58, wire58} : (reg67 ? reg63 : reg65))))))
            begin
              reg68 <= {$unsigned((wire61 * reg66))};
              reg69 <= reg64;
            end
          else
            begin
              reg68 <= $signed(((wire61 ?
                  $unsigned((8'ha0)) : reg62) >> $unsigned((&(!reg68)))));
            end
          if ($unsigned(($unsigned((-(8'ha0))) ^ reg62[(4'hf):(3'h4)])))
            begin
              reg70 <= ($signed(reg65[(4'ha):(3'h6)]) << wire61[(3'h5):(1'h1)]);
            end
          else
            begin
              reg70 <= wire60[(4'h9):(3'h7)];
              reg71 <= $unsigned($signed(($unsigned((reg67 ?
                  reg68 : reg67)) > reg62)));
              reg72 <= ($unsigned($unsigned(wire61)) ?
                  $unsigned({($unsigned(wire58) ~^ (8'hae))}) : $unsigned(wire61[(1'h1):(1'h0)]));
              reg73 <= wire60;
              reg74 <= reg73;
            end
          reg75 <= (^(reg63 ^ (&{reg62[(4'hc):(4'ha)]})));
        end
      else
        begin
          reg68 <= reg67;
          reg69 <= $unsigned(wire58);
          reg70 <= ((reg65 ?
                  ($unsigned((!wire58)) ?
                      wire58 : (7'h42)) : reg75[(4'h8):(1'h1)]) ?
              ($signed($unsigned(reg65[(2'h2):(2'h2)])) || $unsigned(($unsigned(wire60) << reg65[(2'h3):(2'h2)]))) : reg64);
        end
      if (($signed((reg73 != ({reg68, wire61} >> reg73))) ?
          $unsigned((&(~^reg75[(3'h6):(2'h2)]))) : wire59))
        begin
          if ({{$unsigned($signed({(7'h43)})), $unsigned($unsigned(reg72))},
              (^~$signed(($signed(wire61) > (!wire57))))})
            begin
              reg76 <= $unsigned(wire57[(1'h0):(1'h0)]);
              reg77 <= $unsigned(((|(!(reg65 * reg68))) ^~ reg66));
              reg78 <= $signed(($signed(reg66[(2'h3):(2'h2)]) - (|$signed((wire57 || wire57)))));
              reg79 <= $unsigned(reg74[(4'he):(3'h4)]);
            end
          else
            begin
              reg76 <= $signed((8'hb1));
              reg77 <= ((~(+$signed((!reg78)))) || reg66);
              reg78 <= {wire61[(3'h4):(3'h4)]};
              reg79 <= reg75;
              reg80 <= ((wire59 ?
                  $unsigned(((reg79 != reg79) ?
                      $signed(reg68) : reg74)) : $signed(($signed(reg64) >>> (reg78 + reg71)))) >> (+((~&(reg63 >>> reg76)) < $unsigned((-wire61)))));
            end
          reg81 <= {$signed(reg74[(4'h8):(2'h2)])};
          reg82 <= $unsigned((8'ha3));
          reg83 <= (reg78 ? {reg62} : wire60[(2'h3):(1'h0)]);
          reg84 <= ((7'h41) ?
              (reg63 << (~&(wire59 >>> reg81))) : (reg69 ?
                  (wire57 ?
                      $signed((^reg72)) : (reg81 ?
                          (reg75 ? reg82 : reg76) : (reg72 ?
                              wire61 : reg69))) : (8'ha0)));
        end
      else
        begin
          if (reg67[(5'h12):(1'h1)])
            begin
              reg76 <= ($signed($unsigned({(~^(8'hb7)),
                      wire57[(4'hf):(3'h5)]})) ?
                  $unsigned((wire58[(4'h8):(2'h3)] ?
                      (~^reg68) : (^~(reg84 ?
                          wire58 : wire58)))) : (reg63[(3'h7):(3'h4)] ?
                      ((+{(8'hac)}) ? reg71 : (!reg72)) : reg77));
              reg77 <= ($signed(reg75[(1'h1):(1'h0)]) ?
                  $unsigned(wire57) : reg73[(3'h7):(3'h7)]);
              reg78 <= reg74[(3'h6):(1'h0)];
            end
          else
            begin
              reg76 <= (^~(($signed(reg66) ?
                  reg83 : $unsigned(reg77)) >>> wire60));
            end
          reg79 <= $unsigned($signed(reg84[(2'h2):(2'h2)]));
          reg80 <= reg82;
        end
    end
  assign wire85 = $unsigned($signed($signed((reg76 & $unsigned(reg66)))));
  assign wire86 = ($unsigned({$signed(reg76[(1'h1):(1'h0)])}) ?
                      {(((~^reg75) << (!reg82)) ? {$signed(reg80)} : reg68),
                          reg75} : $unsigned(reg77[(1'h0):(1'h0)]));
  assign wire87 = (((^~(~$signed(reg83))) && (8'h9e)) * $unsigned(reg70[(3'h7):(2'h2)]));
  assign wire88 = (reg76 ? (+reg67) : $signed(wire60));
  assign wire89 = $unsigned((wire88 & (wire87[(2'h2):(1'h1)] ?
                      $signed((wire58 & reg67)) : wire88)));
  assign wire90 = (!(|(reg62 == (reg71 ? reg67 : ((8'ha7) > wire61)))));
  assign wire91 = (|((~$signed((reg73 + reg63))) << (!($signed(reg79) != (reg80 ?
                      reg69 : wire87)))));
  assign wire92 = $signed($unsigned(($signed(((8'ha5) - wire87)) | (^reg62))));
  assign wire93 = reg78;
  always
    @(posedge clk) begin
      reg94 <= $unsigned($unsigned({$signed(reg71),
          (~^wire88[(2'h2):(1'h1)])}));
      reg95 <= (~^wire57);
    end
  assign wire96 = (^(~&$signed((reg66[(2'h3):(2'h3)] && (-(8'ha1))))));
  assign wire97 = (wire96 ?
                      (&$signed({(wire96 ?
                              reg81 : reg70)})) : (({reg72[(3'h6):(1'h1)]} ?
                              (|reg75[(4'h9):(2'h2)]) : ((reg79 || (8'ha9)) && (8'hab))) ?
                          {reg74[(2'h2):(1'h1)]} : (reg83 ^ (&reg82[(3'h4):(3'h4)]))));
  assign wire98 = {reg84[(4'he):(1'h0)], $unsigned({{(|(8'ha1))}})};
  assign wire99 = (&$signed($signed(($signed((8'had)) ?
                      (wire88 ? wire57 : wire88) : $signed(reg83)))));
  assign wire100 = reg63;
  assign wire101 = reg73;
  assign wire102 = (((wire86[(4'h8):(4'h8)] >> (!wire60)) ?
                           wire96[(4'hf):(3'h4)] : wire87[(4'ha):(3'h5)]) ?
                       {$signed(reg94[(3'h5):(2'h3)]),
                           ((~|(reg66 ?
                               reg77 : reg72)) > (8'h9e))} : {(&{{wire89},
                               wire57[(3'h5):(3'h5)]})});
endmodule
