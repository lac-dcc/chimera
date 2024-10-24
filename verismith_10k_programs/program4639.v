module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire214;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire216;
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  assign y = {wire214,
                 wire18,
                 wire17,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire216,
                 reg16,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $unsigned((wire1 ?
                     (wire4[(2'h3):(1'h1)] <<< $unsigned($unsigned((7'h43)))) : $signed($unsigned((wire3 ?
                         wire4 : wire1)))));
  assign wire6 = (&(($signed($signed((8'h9d))) ?
                     wire3 : ($signed(wire3) | wire5[(3'h5):(2'h2)])) < (~^wire2[(2'h2):(1'h0)])));
  assign wire7 = ({{$unsigned(wire6)},
                         $unsigned(((wire6 + (8'hbb)) ? (8'hb9) : wire1))} ?
                     ((~^(^~(+wire3))) ?
                         $unsigned((~|(wire4 + wire6))) : wire5[(1'h1):(1'h0)]) : (~^$unsigned(wire2[(1'h1):(1'h1)])));
  assign wire8 = (wire2 ?
                     $unsigned((wire1 >= (wire0 & (&wire7)))) : ($signed($signed((wire1 || wire7))) ?
                         {((wire1 ? wire3 : (8'ha0)) << wire4[(4'h9):(4'h9)]),
                             $signed((wire3 ? wire2 : wire7))} : wire3));
  always
    @(posedge clk) begin
      reg9 <= ((~|wire5) ?
          wire2 : ((~{$signed(wire7)}) <<< {((wire2 && wire6) * wire1[(4'hc):(4'h9)])}));
      reg10 <= $unsigned((~(-({wire6, wire4} ?
          (wire8 ? wire3 : (8'hba)) : wire5))));
      reg11 <= (8'hb5);
    end
  assign wire12 = reg9;
  assign wire13 = ($signed({$signed((wire5 ?
                          reg11 : wire8))}) ~^ {$signed(($signed(reg10) ?
                          (8'h9c) : (wire12 - reg9))),
                      (~|reg9)});
  assign wire14 = ($signed((~|reg10)) == wire7);
  assign wire15 = $unsigned(wire6);
  always
    @(posedge clk) begin
      reg16 <= {(~$signed({reg9, (wire12 ? wire6 : wire15)})),
          wire3[(3'h7):(2'h2)]};
    end
  assign wire17 = $unsigned(wire1);
  assign wire18 = ($unsigned(wire7) ?
                      $signed($signed(wire13)) : ($unsigned(($unsigned(wire5) != $signed((8'hb3)))) ?
                          wire13[(3'h7):(3'h4)] : $unsigned(($unsigned(wire8) <= (~|wire7)))));
  module19 #() modinst215 (.wire24(wire6), .clk(clk), .wire20(wire8), .wire21(wire1), .wire23(wire7), .wire22(wire2), .y(wire214));
  module141 #() modinst217 (wire216, clk, wire1, wire7, wire17, wire12, wire2);
endmodule

module module19
#(parameter param212 = (~^(~&(~(~((8'hb3) ? (8'hb4) : (8'hb6)))))), 
parameter param213 = {(~^(param212 || param212)), (param212 << ({{param212, param212}, (param212 | param212)} ? ((param212 ^~ param212) > (param212 ? param212 : param212)) : (~^param212)))})
(y, clk, wire20, wire21, wire22, wire23, wire24);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire23;
  input wire [(3'h5):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire211;
  wire signed [(4'h8):(1'h0)] wire210;
  wire signed [(4'hc):(1'h0)] wire209;
  wire [(2'h2):(1'h0)] wire167;
  wire signed [(3'h6):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire139;
  wire signed [(5'h12):(1'h0)] wire138;
  wire signed [(4'hb):(1'h0)] wire137;
  wire [(5'h14):(1'h0)] wire134;
  wire [(4'he):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire110;
  wire signed [(3'h4):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire169;
  wire [(4'ha):(1'h0)] wire170;
  wire [(3'h5):(1'h0)] wire207;
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  assign y = {wire211,
                 wire210,
                 wire209,
                 wire167,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire134,
                 wire123,
                 wire111,
                 wire110,
                 wire109,
                 wire25,
                 wire26,
                 wire69,
                 wire107,
                 wire169,
                 wire170,
                 wire207,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg135,
                 reg136,
                 (1'h0)};
  assign wire25 = (+$unsigned(((^wire21[(4'hd):(3'h7)]) >>> {$signed(wire24)})));
  assign wire26 = wire21;
  module27 #() modinst70 (wire69, clk, wire23, wire25, wire22, wire21);
  module71 #() modinst108 (wire107, clk, wire21, wire23, wire25, wire69, wire22);
  assign wire109 = (($unsigned($signed((~^wire20))) ?
                       (8'hba) : ($signed((wire21 ?
                           wire23 : (8'ha0))) != wire26[(3'h5):(3'h5)])) && wire69);
  assign wire110 = $unsigned(wire21[(1'h0):(1'h0)]);
  assign wire111 = $unsigned(((~&($unsigned(wire23) | $signed(wire110))) ?
                       {(8'ha8),
                           $signed((wire109 || wire110))} : {$signed(wire109[(2'h2):(2'h2)])}));
  module112 #() modinst124 (.wire116(wire25), .y(wire123), .wire114(wire20), .clk(clk), .wire113(wire24), .wire115(wire26));
  always
    @(posedge clk) begin
      reg125 <= $signed((7'h41));
      if ((&reg125[(3'h5):(3'h5)]))
        begin
          reg126 <= $signed((wire23[(4'hb):(4'h9)] ^ $signed($signed(wire110))));
        end
      else
        begin
          if (wire22)
            begin
              reg126 <= $signed(wire110[(4'ha):(4'h9)]);
            end
          else
            begin
              reg126 <= $unsigned($signed(((+((8'hb9) ?
                  wire110 : wire22)) + ((wire110 ?
                  wire22 : wire109) << $unsigned(wire107)))));
              reg127 <= $signed(((wire109[(2'h2):(1'h0)] ?
                  ((wire20 ? (8'h9d) : wire26) ?
                      reg126[(4'hd):(4'h9)] : wire107) : (~(8'haa))) * (((~|(8'hbb)) > $signed(wire20)) ~^ $signed(wire110))));
              reg128 <= $signed({(reg126[(1'h1):(1'h0)] == (^$signed((8'haf)))),
                  (~&({wire21} < (wire69 | reg126)))});
            end
          reg129 <= (wire21[(3'h6):(1'h0)] == wire111[(1'h0):(1'h0)]);
          reg130 <= $signed($unsigned($signed(reg127[(2'h2):(1'h0)])));
          reg131 <= reg129;
          reg132 <= wire22;
        end
      reg133 <= (~($unsigned((wire69 ?
              $unsigned((8'hab)) : $unsigned(reg128))) ?
          wire21 : $signed(wire110)));
    end
  assign wire134 = (reg125[(1'h0):(1'h0)] ?
                       $unsigned({{(|wire25), (wire22 + wire69)},
                           (^~reg127[(1'h0):(1'h0)])}) : {({reg130,
                               ((8'haa) ?
                                   reg131 : wire22)} || ($unsigned(wire20) ?
                               $unsigned(reg132) : $signed(wire24)))});
  always
    @(posedge clk) begin
      reg135 <= $signed($signed($unsigned(wire107[(3'h5):(2'h2)])));
      reg136 <= wire25[(4'h9):(1'h1)];
    end
  assign wire137 = ((wire23 == ($unsigned($unsigned(wire22)) ?
                       $unsigned((~wire69)) : (-$signed(reg128)))) && wire123[(2'h3):(2'h3)]);
  assign wire138 = wire110;
  assign wire139 = $signed(((($unsigned(reg133) < (wire110 <<< (8'hb3))) ?
                       wire26 : {wire111[(1'h1):(1'h1)]}) < (~|(^$unsigned(reg126)))));
  assign wire140 = ((^~reg128) ?
                       reg132 : (reg128[(2'h3):(2'h3)] || wire138[(3'h5):(3'h4)]));
  module141 #() modinst168 (.y(wire167), .wire142(wire21), .wire146(reg136), .wire143(reg132), .clk(clk), .wire144(wire123), .wire145(wire134));
  assign wire169 = $unsigned($signed((~|wire24)));
  assign wire170 = $signed($unsigned(((~|(|wire22)) <<< $signed($signed(wire110)))));
  module171 #() modinst208 (.y(wire207), .wire174(wire25), .wire175(wire26), .clk(clk), .wire172(wire140), .wire173(reg136));
  assign wire209 = $signed(wire110[(1'h0):(1'h0)]);
  assign wire210 = wire110;
  assign wire211 = (^~(~|wire20));
endmodule

module module171
#(parameter param205 = (~&(&(~(|(!(7'h44)))))), 
parameter param206 = (8'hac))
(y, clk, wire175, wire174, wire173, wire172);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire175;
  input wire signed [(2'h3):(1'h0)] wire174;
  input wire signed [(4'h8):(1'h0)] wire173;
  input wire [(2'h2):(1'h0)] wire172;
  wire [(4'ha):(1'h0)] wire189;
  wire [(3'h4):(1'h0)] wire188;
  wire signed [(2'h2):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire186;
  wire [(3'h7):(1'h0)] wire185;
  wire signed [(4'ha):(1'h0)] wire183;
  wire [(5'h11):(1'h0)] wire182;
  wire [(5'h11):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire180;
  wire signed [(5'h11):(1'h0)] wire179;
  wire signed [(5'h15):(1'h0)] wire178;
  wire [(5'h12):(1'h0)] wire177;
  wire signed [(5'h14):(1'h0)] wire176;
  reg [(4'hd):(1'h0)] reg204 = (1'h0);
  reg [(3'h4):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg200 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg198 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg193 = (1'h0);
  reg [(4'hf):(1'h0)] reg192 = (1'h0);
  reg [(4'h9):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg184 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg184,
                 (1'h0)};
  assign wire176 = (!wire173);
  assign wire177 = wire176[(5'h11):(5'h11)];
  assign wire178 = $unsigned(((~^$unsigned($unsigned((8'hba)))) ?
                       ($unsigned((wire174 & wire173)) ?
                           (&wire174[(2'h3):(1'h1)]) : $signed((~wire175))) : (($unsigned(wire177) >> (8'hb3)) - ((wire172 | (8'ha8)) != wire172))));
  assign wire179 = (8'hba);
  assign wire180 = wire172[(1'h0):(1'h0)];
  assign wire181 = ($signed($unsigned($unsigned((~&(8'ha1))))) ?
                       $signed(wire177[(4'hf):(2'h2)]) : $unsigned($unsigned(($signed(wire177) >>> (8'had)))));
  assign wire182 = wire181[(3'h4):(2'h2)];
  assign wire183 = (wire175[(2'h2):(1'h0)] ?
                       wire173[(3'h6):(3'h5)] : (wire177 & {((wire178 ?
                               (7'h41) : wire173) ~^ (wire173 ?
                               wire181 : wire175))}));
  always
    @(posedge clk) begin
      reg184 <= wire176;
    end
  assign wire185 = wire177[(4'he):(4'h8)];
  assign wire186 = $unsigned(wire174[(2'h2):(1'h0)]);
  assign wire187 = wire172[(2'h2):(1'h0)];
  assign wire188 = {wire174[(2'h2):(2'h2)], wire182};
  assign wire189 = $unsigned((^reg184));
  always
    @(posedge clk) begin
      reg190 <= (&$signed(({$signed(wire188), {wire182}} ?
          {reg184[(2'h2):(2'h2)],
              (wire181 ? wire183 : (8'hbe))} : (!wire186))));
      reg191 <= ((wire180 != (((wire183 ? wire174 : reg184) ?
                  wire180 : $unsigned(reg190)) ?
              $unsigned((wire173 ^ wire188)) : wire187[(1'h0):(1'h0)])) ?
          wire185[(3'h7):(1'h0)] : ((8'ha0) ?
              (wire178[(5'h14):(4'hd)] >>> $signed($unsigned(wire176))) : ((wire177 ?
                  $unsigned(wire181) : (~wire176)) && (wire182 ?
                  ((8'hac) ~^ wire172) : (^reg184)))));
      reg192 <= wire176[(4'he):(1'h1)];
      if (wire182)
        begin
          reg193 <= wire175;
          reg194 <= $unsigned($unsigned(wire173[(3'h7):(3'h4)]));
          if ($unsigned((wire175 == $unsigned(((wire177 ?
              (8'h9f) : (8'hae)) || wire176)))))
            begin
              reg195 <= $signed($unsigned($signed((&(wire174 | wire176)))));
            end
          else
            begin
              reg195 <= ($unsigned($signed(reg193[(3'h5):(3'h5)])) != ((wire179[(2'h2):(1'h0)] ^~ ((reg192 ?
                  wire183 : wire185) <<< ((8'ha3) ?
                  wire177 : wire173))) <<< $signed(($signed(wire178) ?
                  (|wire185) : {reg184}))));
            end
          reg196 <= reg193;
          if (wire188[(2'h2):(1'h0)])
            begin
              reg197 <= $signed(reg195);
              reg198 <= $unsigned($signed(reg193));
              reg199 <= (|((~|$unsigned(wire182)) ?
                  (wire174[(2'h3):(2'h2)] * ((8'hb2) != $signed((8'hbc)))) : {$unsigned((wire178 >>> wire177))}));
              reg200 <= $signed(wire181);
              reg201 <= (8'hbd);
            end
          else
            begin
              reg197 <= $signed(({$signed((~^reg184)),
                  $signed((wire178 ? reg191 : wire189))} >= wire177));
              reg198 <= $signed({wire189[(1'h1):(1'h1)], wire189});
              reg199 <= (8'hae);
            end
        end
      else
        begin
          if (wire183[(3'h7):(1'h1)])
            begin
              reg193 <= $unsigned($unsigned($unsigned(((^wire172) ?
                  {(7'h43), wire173} : $signed(wire182)))));
              reg194 <= $signed(reg199[(4'h9):(4'h9)]);
              reg195 <= (~&$signed((7'h40)));
              reg196 <= ((&$unsigned((~&(reg201 ?
                  wire173 : (8'ha1))))) ~^ wire185);
              reg197 <= wire174;
            end
          else
            begin
              reg193 <= (|({($unsigned((8'hae)) ?
                      (reg200 < reg200) : wire179)} >>> (+(^~(reg190 * wire173)))));
              reg194 <= ((!$unsigned(($signed(reg190) > (wire176 ?
                      reg192 : reg196)))) ?
                  (~&{(8'hac),
                      $signed((wire172 ?
                          wire174 : wire178))}) : (((~&(wire181 != reg201)) ?
                      reg190 : ($unsigned(reg199) ?
                          $signed(reg194) : (wire179 ?
                              wire176 : reg197))) * (~&((wire176 ?
                          (8'had) : reg195) ?
                      reg198 : $signed(reg201)))));
              reg195 <= $signed($signed($unsigned($signed($signed(wire180)))));
              reg196 <= (!$unsigned($unsigned($unsigned((|reg192)))));
              reg197 <= (^~$unsigned($unsigned(reg190[(4'ha):(2'h2)])));
            end
          reg198 <= (~&(($unsigned((|wire174)) >>> $unsigned({wire181,
                  reg191})) ?
              (8'h9f) : {(~&((8'ha2) * (8'hb9))), $signed((~^reg193))}));
          if (reg184)
            begin
              reg199 <= wire172[(1'h0):(1'h0)];
              reg200 <= ($unsigned({((^~wire172) != (&wire172))}) ?
                  reg198[(1'h0):(1'h0)] : ((((&reg196) * (|reg200)) ?
                      ((wire175 ? wire188 : wire189) <= ((8'hba) ?
                          reg198 : wire180)) : ((^~reg192) > (&(7'h41)))) ^ (~reg195[(3'h7):(3'h4)])));
            end
          else
            begin
              reg199 <= ($signed((((reg195 && wire177) <<< $signed(reg191)) ?
                      ($unsigned(wire174) ?
                          $signed(wire186) : (wire174 <<< wire173)) : (8'hb3))) ?
                  (8'h9e) : wire175[(3'h6):(1'h0)]);
              reg200 <= {reg196[(4'hb):(3'h7)],
                  $signed(wire180[(4'h9):(3'h5)])};
              reg201 <= reg192;
              reg202 <= ((reg190 >> (8'haa)) - $signed($signed(wire189[(2'h2):(1'h0)])));
            end
          reg203 <= {$signed(wire185[(2'h3):(2'h3)])};
          reg204 <= $unsigned(reg201);
        end
    end
endmodule

module module141
#(parameter param166 = ((8'hbb) ? ((({(8'hb6)} ? ((8'hb8) | (8'ha7)) : ((8'hb6) | (8'hab))) ? (((8'h9f) >> (8'ha5)) ? ((8'h9e) ? (8'ha2) : (7'h40)) : ((7'h40) ^ (8'haf))) : {(~(8'ha7)), {(7'h43)}}) <= (~^{(|(8'ha7)), ((8'haf) ? (8'ha7) : (8'hb1))})) : {{{(^~(8'ha4))}, ({(8'hb8)} ^ ((8'ha3) ? (8'ha8) : (8'hbf)))}}))
(y, clk, wire146, wire145, wire144, wire143, wire142);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire146;
  input wire signed [(5'h14):(1'h0)] wire145;
  input wire signed [(3'h6):(1'h0)] wire144;
  input wire [(3'h5):(1'h0)] wire143;
  input wire [(4'hd):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire165;
  wire [(3'h5):(1'h0)] wire164;
  wire signed [(4'h9):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire160;
  wire signed [(4'he):(1'h0)] wire159;
  wire [(5'h15):(1'h0)] wire158;
  wire [(3'h6):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire156;
  wire signed [(3'h4):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire154;
  wire signed [(4'hd):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire152;
  wire signed [(5'h14):(1'h0)] wire151;
  wire signed [(4'h8):(1'h0)] wire150;
  wire signed [(5'h12):(1'h0)] wire149;
  wire [(5'h11):(1'h0)] wire148;
  wire signed [(3'h5):(1'h0)] wire147;
  reg signed [(5'h11):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire147 = wire145[(4'h9):(3'h7)];
  assign wire148 = (8'hb4);
  assign wire149 = $signed($unsigned(wire148[(3'h7):(3'h5)]));
  assign wire150 = ((8'hb9) ^ (((~wire144) >= wire148[(4'hf):(4'ha)]) > ((&$unsigned(wire143)) ?
                       (^~(wire147 * wire148)) : $signed((wire143 ?
                           wire143 : wire145)))));
  assign wire151 = wire149[(3'h5):(2'h2)];
  assign wire152 = ({(((|wire144) || wire150) != {(wire149 * wire146)}),
                           ($unsigned(wire148) ?
                               $signed(wire146) : ((|wire149) ?
                                   $unsigned(wire142) : wire143[(2'h3):(1'h1)]))} ?
                       (wire146[(3'h4):(2'h2)] >= $unsigned($signed((wire146 ?
                           (8'hba) : wire149)))) : (8'haf));
  assign wire153 = {(^~wire151[(4'hd):(1'h1)]), {$unsigned((^~{wire143}))}};
  assign wire154 = {wire143};
  assign wire155 = (~wire150[(4'h8):(4'h8)]);
  assign wire156 = (wire146 < $unsigned((~&$signed($unsigned((8'ha1))))));
  assign wire157 = (|((+(|(wire150 * wire143))) ?
                       $unsigned((((7'h40) ? wire156 : wire147) ?
                           (wire151 ?
                               wire145 : wire142) : wire153[(1'h1):(1'h0)])) : $unsigned($unsigned({(7'h43)}))));
  assign wire158 = {((wire155 - $signed((wire156 <<< (7'h42)))) ?
                           (wire146 ?
                               wire145 : wire157[(3'h4):(2'h3)]) : wire147)};
  assign wire159 = (wire152[(3'h4):(2'h3)] <<< (wire148 <<< wire147[(1'h1):(1'h0)]));
  assign wire160 = $signed((wire147[(1'h1):(1'h1)] ?
                       $signed(wire148) : wire145));
  assign wire161 = $signed($unsigned(wire152));
  always
    @(posedge clk) begin
      reg162 <= $signed((~$unsigned(wire143)));
      reg163 <= wire147[(3'h4):(3'h4)];
    end
  assign wire164 = $signed((8'ha7));
  assign wire165 = $signed(wire154[(4'hd):(4'ha)]);
endmodule

module module112  (y, clk, wire116, wire115, wire114, wire113);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire116;
  input wire signed [(4'ha):(1'h0)] wire115;
  input wire [(4'ha):(1'h0)] wire114;
  input wire signed [(3'h5):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire122;
  wire signed [(4'hf):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire [(3'h7):(1'h0)] wire119;
  wire [(3'h5):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  assign y = {wire122, wire121, wire120, wire119, wire118, wire117, (1'h0)};
  assign wire117 = (~&wire114);
  assign wire118 = (~|$unsigned((~^wire115)));
  assign wire119 = wire117[(4'hc):(4'hc)];
  assign wire120 = wire114;
  assign wire121 = ((~$signed(($signed(wire115) - {wire120, (8'hbc)}))) ?
                       {$unsigned(wire113[(3'h5):(2'h3)])} : (($signed((wire118 ?
                           (8'hba) : wire117)) >>> wire115) >>> wire113[(1'h1):(1'h0)]));
  assign wire122 = (wire115[(1'h0):(1'h0)] * ((!$unsigned((^~(8'ha4)))) ?
                       $unsigned(wire114) : (wire120[(3'h5):(2'h2)] > wire113)));
endmodule

module module71
#(parameter param105 = (~{{(((8'hac) ? (8'hb0) : (8'hab)) & ((8'hb1) - (8'hac))), (((8'hb9) ? (8'ha1) : (7'h42)) ? ((8'hba) ? (8'ha8) : (8'hab)) : {(8'hbb)})}}), 
parameter param106 = ((((((8'hb0) | param105) ? ((8'ha2) ? param105 : param105) : (-param105)) ? param105 : param105) ? ((param105 + (param105 ? (8'h9f) : param105)) ? (+((8'hb6) ? param105 : param105)) : (((8'hb8) ~^ (8'hbd)) ? param105 : param105)) : (|(+(8'hb2)))) ? (param105 <= param105) : {((8'hbd) | param105), param105}))
(y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire76;
  input wire signed [(4'hb):(1'h0)] wire75;
  input wire signed [(4'h8):(1'h0)] wire74;
  input wire [(5'h15):(1'h0)] wire73;
  input wire signed [(3'h4):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire95,
                 wire91,
                 wire90,
                 wire89,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg97,
                 reg96,
                 reg94,
                 reg93,
                 reg92,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire77 = ({(($unsigned(wire72) && {wire73}) ?
                          $signed((|wire73)) : {((8'h9e) == wire72),
                              (wire74 >= wire74)})} << {(&$signed((wire73 << wire73))),
                      (^wire76)});
  assign wire78 = (($signed(wire75[(1'h0):(1'h0)]) <= ((~&wire72) > {wire73[(4'hc):(3'h5)],
                      ((8'ha6) < wire75)})) << $unsigned($signed(($signed(wire77) & {wire72}))));
  assign wire79 = $signed($signed((~^$unsigned(wire72))));
  assign wire80 = wire74;
  assign wire81 = (wire77 ?
                      (+wire73) : $signed((wire73 ?
                          $signed((wire72 - wire77)) : wire76)));
  assign wire82 = (wire78 << {wire74[(1'h0):(1'h0)],
                      (~((wire81 ? wire75 : wire74) | wire73[(4'he):(4'h8)]))});
  assign wire83 = $unsigned((^~($unsigned(wire82) ?
                      $unsigned((wire73 ?
                          wire80 : wire75)) : $unsigned((~wire72)))));
  assign wire84 = ({(~&wire83[(1'h0):(1'h0)])} ^~ wire77);
  assign wire85 = ((wire74 ?
                          $signed(wire73) : ($unsigned(wire76) ~^ (&(wire81 ?
                              wire76 : wire76)))) ?
                      wire79[(2'h3):(1'h0)] : (($unsigned(wire75) * ((wire73 >>> wire82) ?
                          ((8'ha7) ?
                              (8'h9d) : wire73) : (8'ha3))) << wire75[(1'h1):(1'h0)]));
  assign wire86 = (-(&$unsigned((8'hbe))));
  always
    @(posedge clk) begin
      reg87 <= ((^~wire77[(4'ha):(2'h2)]) ?
          (+{(wire76 ? wire80[(4'h8):(3'h7)] : wire73[(2'h2):(1'h0)]),
              $unsigned(wire72)}) : (!(^wire81[(3'h6):(1'h1)])));
      reg88 <= (8'hbb);
    end
  assign wire89 = $signed(({$unsigned($signed(wire80)),
                      ($unsigned(wire81) ?
                          $unsigned(wire85) : $unsigned((8'ha5)))} >>> wire86[(3'h4):(2'h2)]));
  assign wire90 = ($signed(($signed((wire79 + wire78)) >>> (~^reg87[(3'h6):(3'h6)]))) <= {(((reg88 <<< wire80) ?
                          ((8'ha4) ?
                              wire76 : (7'h40)) : wire78[(3'h7):(3'h4)]) ^ $unsigned((^~wire77)))});
  assign wire91 = $unsigned((wire83[(2'h2):(1'h1)] && {$signed($unsigned(wire72))}));
  always
    @(posedge clk) begin
      reg92 <= (-wire82[(2'h2):(2'h2)]);
      reg93 <= $unsigned(($unsigned(wire80) | $signed({$unsigned(wire86)})));
      reg94 <= {(wire90[(3'h4):(3'h4)] ~^ (8'ha1)),
          $unsigned((($signed((8'haa)) ?
              $unsigned(reg87) : $unsigned((8'hb3))) > ({(8'h9f), wire75} ?
              $unsigned(reg88) : (wire83 ? wire89 : wire72))))};
    end
  assign wire95 = (~^$signed(($unsigned(wire73) ?
                      (&$signed(wire91)) : (((8'ha9) ? wire85 : (8'hb7)) ?
                          ((7'h41) ? reg87 : (8'hb9)) : $signed(wire81)))));
  always
    @(posedge clk) begin
      reg96 <= wire80[(3'h5):(1'h1)];
      reg97 <= $unsigned(wire89);
    end
  assign wire98 = (&(~&(~&((wire85 ? wire72 : reg88) >>> $unsigned(wire79)))));
  assign wire99 = (~|(wire72[(2'h3):(2'h2)] ? $unsigned(reg97) : wire81));
  always
    @(posedge clk) begin
      if ($signed(wire82))
        begin
          reg100 <= (wire80 == {(!(8'hbf))});
          reg101 <= $unsigned(($unsigned($unsigned((reg88 && wire91))) ?
              $unsigned($signed($signed(wire72))) : $signed($unsigned((wire81 ?
                  wire89 : wire73)))));
          reg102 <= (reg101 ?
              wire86[(3'h6):(2'h2)] : {(((wire84 & wire78) + wire86[(3'h7):(3'h5)]) ?
                      $signed((8'hbc)) : (~&((8'ha9) >= (8'ha5)))),
                  wire84});
        end
      else
        begin
          reg100 <= (((+$signed($signed(wire75))) == $unsigned(((+wire90) ^ ((8'hbc) ?
              wire72 : reg92)))) || reg87[(3'h4):(3'h4)]);
        end
      reg103 <= (((((+(8'hb6)) >> {wire84, wire82}) - ((wire81 ?
                  (8'ha4) : wire75) || {wire77})) ?
              wire75[(4'h9):(2'h2)] : $unsigned((wire83[(1'h1):(1'h0)] <<< $unsigned((8'ha8))))) ?
          (7'h41) : (wire72[(3'h4):(3'h4)] ? wire85 : reg88[(4'h8):(1'h0)]));
      reg104 <= $unsigned(reg88);
    end
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h1d9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire29;
  input wire [(3'h5):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
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
                 reg37,
                 (1'h0)};
  assign wire32 = (^$unsigned($signed(wire29[(5'h12):(5'h10)])));
  assign wire33 = {{$signed($unsigned(wire30)), {wire30}}};
  assign wire34 = (($signed($unsigned(wire32)) & (({wire31} ?
                          $unsigned(wire29) : (wire33 <= (8'hb6))) ?
                      ((wire30 ? wire31 : wire29) ?
                          (&wire28) : (wire33 ?
                              (8'ha4) : wire28)) : {$signed(wire32)})) + wire33[(5'h14):(4'he)]);
  assign wire35 = {{$unsigned(((^wire30) ? (&wire28) : (|wire29)))}};
  assign wire36 = wire34;
  always
    @(posedge clk) begin
      reg37 <= (wire30 ^~ $unsigned((~^wire31[(4'h8):(3'h5)])));
    end
  always
    @(posedge clk) begin
      if ($signed((&{$unsigned($unsigned(wire33))})))
        begin
          reg38 <= $signed(($signed(wire31[(3'h7):(1'h0)]) ~^ {$unsigned(((8'h9d) * (7'h42)))}));
          reg39 <= wire30[(1'h0):(1'h0)];
          if (((wire34[(2'h3):(2'h2)] ?
                  wire28 : $signed(((&wire36) ~^ (~^wire33)))) ?
              (wire30 ? $signed(wire32) : wire35) : $signed(wire32)))
            begin
              reg40 <= $signed(($unsigned(wire33) ?
                  ((reg37 ?
                      $signed(wire32) : (wire31 >> (7'h44))) >> (wire28[(1'h1):(1'h0)] < (~&reg38))) : wire28[(3'h5):(1'h0)]));
              reg41 <= wire31;
              reg42 <= wire32;
              reg43 <= wire28[(1'h0):(1'h0)];
              reg44 <= {$signed(wire28), $signed((8'haf))};
            end
          else
            begin
              reg40 <= $unsigned(((reg39 ?
                      reg43[(4'h9):(3'h7)] : $unsigned((~wire32))) ?
                  $unsigned(wire32) : reg43[(4'hc):(1'h0)]));
              reg41 <= (^~reg42[(5'h11):(3'h5)]);
              reg42 <= {(reg44[(1'h1):(1'h1)] ~^ (8'h9e))};
            end
        end
      else
        begin
          reg38 <= $signed((((|(reg42 | (8'hb6))) ?
              reg41[(1'h1):(1'h1)] : ($unsigned(wire30) ?
                  $unsigned((8'hbd)) : $unsigned(reg37))) - reg44));
          reg39 <= $signed(($signed(($signed((8'hbc)) ?
              {reg43, wire34} : {(8'hbc)})) && (-((wire29 ?
              reg38 : wire34) > (^~reg37)))));
          if ($unsigned($unsigned((reg39 ?
              ((!wire35) != ((8'had) ? wire34 : reg39)) : $signed({wire34})))))
            begin
              reg40 <= $signed((^(^~wire34[(3'h6):(2'h2)])));
              reg41 <= (wire36[(4'hb):(2'h3)] <= $unsigned(wire28));
            end
          else
            begin
              reg40 <= ($unsigned(wire30[(3'h6):(2'h3)]) ?
                  $signed((~&$unsigned((wire30 - (8'hb4))))) : wire30[(3'h5):(2'h3)]);
              reg41 <= {{wire31}};
              reg42 <= (((((wire34 + reg41) < (8'ha3)) ?
                      (reg39 || (wire34 < wire32)) : ((reg42 ?
                          wire36 : reg38) < $signed(wire29))) ~^ (wire30 ?
                      reg43 : ($unsigned((8'haf)) - (reg39 == wire32)))) ?
                  (|((^(reg39 != (8'had))) ?
                      wire29[(4'hc):(4'hc)] : wire29)) : (&{$signed(reg42[(4'hd):(1'h1)]),
                      wire29}));
              reg43 <= (&reg40[(1'h1):(1'h0)]);
            end
          reg44 <= $signed($signed((((wire35 ^~ reg44) ?
              {reg38, wire34} : reg39[(4'hd):(4'h9)]) != (((7'h40) < (8'hb9)) ?
              {(8'hb1), (8'hab)} : (reg39 ^~ (8'hb0))))));
          reg45 <= (&(($unsigned(wire28) >= reg40) && {(-(~&wire29)),
              ((reg40 && (8'h9e)) ?
                  (wire35 ? reg44 : wire31) : $signed(wire29))}));
        end
      reg46 <= wire30;
    end
  always
    @(posedge clk) begin
      reg47 <= ((!(&wire33[(3'h7):(1'h0)])) ?
          ($signed(wire32[(2'h2):(1'h1)]) <<< (8'had)) : wire30[(1'h1):(1'h0)]);
      reg48 <= ($signed($unsigned($unsigned((wire29 == reg44)))) | ((((reg47 ?
              wire32 : wire31) ?
          (&(8'hb0)) : {wire33,
              reg40}) >> ((wire32 + reg43) ~^ $unsigned(reg41))) < $signed($signed((wire30 ^~ reg42)))));
    end
  assign wire49 = reg47[(1'h1):(1'h0)];
  assign wire50 = wire31[(4'hd):(4'hc)];
  assign wire51 = reg48;
  assign wire52 = wire31;
  assign wire53 = wire28[(1'h0):(1'h0)];
  assign wire54 = $unsigned((&$signed((8'ha4))));
  assign wire55 = {{(-$signed($signed(wire50)))}};
  always
    @(posedge clk) begin
      reg56 <= ($signed((+(!(wire55 ?
          reg43 : reg42)))) != $unsigned((+$unsigned(reg38[(1'h1):(1'h1)]))));
      if ($signed(wire35[(4'hb):(4'ha)]))
        begin
          reg57 <= $signed(reg37);
          if ((~&((~$unsigned(wire53[(1'h1):(1'h1)])) <<< $unsigned(({wire49} > (reg40 ?
              (8'hbf) : (8'hae)))))))
            begin
              reg58 <= $signed($unsigned((((~(8'hb6)) ?
                      $unsigned((8'ha9)) : (~|(8'hb6))) ?
                  reg46 : (^~reg37))));
              reg59 <= $unsigned(wire54);
              reg60 <= $unsigned(reg41[(2'h2):(2'h2)]);
              reg61 <= {(^(^(^~{reg58, reg38}))), reg60};
              reg62 <= reg42[(4'he):(3'h4)];
            end
          else
            begin
              reg58 <= ((reg47[(2'h3):(1'h0)] ? (~^reg38) : {wire33}) ?
                  reg42 : $unsigned(wire52));
              reg59 <= reg57[(1'h1):(1'h0)];
              reg60 <= {{(reg58[(2'h2):(1'h0)] < (!wire50[(4'ha):(3'h6)]))}};
              reg61 <= wire30;
            end
          reg63 <= reg61[(1'h1):(1'h0)];
          reg64 <= $signed((^~(((&wire54) ^ $unsigned(reg41)) ?
              ((^~reg37) ?
                  $unsigned(reg37) : $unsigned(wire28)) : ($signed(reg61) ?
                  (reg45 ? wire36 : wire31) : (wire35 >> wire31)))));
          reg65 <= $signed((reg40 <<< (reg60 ?
              (^{wire50}) : $unsigned(wire51[(3'h4):(1'h0)]))));
        end
      else
        begin
          reg57 <= reg44[(2'h2):(1'h1)];
          reg58 <= (8'hb7);
          reg59 <= $signed((^(~|(-wire30))));
          reg60 <= (+wire35[(4'hb):(4'h8)]);
          reg61 <= wire34[(4'hd):(4'h9)];
        end
    end
  assign wire66 = ((~|$signed($signed(wire53))) <<< {(8'hb6)});
  assign wire67 = reg63;
  assign wire68 = wire33;
endmodule
