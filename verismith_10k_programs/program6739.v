module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire191;
  wire [(5'h10):(1'h0)] wire190;
  wire signed [(5'h12):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire162;
  wire signed [(5'h11):(1'h0)] wire164;
  wire signed [(5'h10):(1'h0)] wire165;
  wire signed [(4'ha):(1'h0)] wire166;
  wire signed [(4'hf):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire168;
  wire signed [(4'ha):(1'h0)] wire169;
  wire signed [(2'h3):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire187;
  wire signed [(4'hf):(1'h0)] wire188;
  reg [(4'hb):(1'h0)] reg170 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg173 = (1'h0);
  reg [(5'h15):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg176 = (1'h0);
  reg [(4'hc):(1'h0)] reg177 = (1'h0);
  reg [(4'he):(1'h0)] reg178 = (1'h0);
  reg [(3'h6):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg180 = (1'h0);
  reg [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(3'h4):(1'h0)] reg182 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg183 = (1'h0);
  reg [(3'h7):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg185 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire46,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire48,
                 wire49,
                 wire50,
                 wire162,
                 wire164,
                 wire165,
                 wire166,
                 wire167,
                 wire168,
                 wire169,
                 wire186,
                 wire187,
                 wire188,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = $signed((~&$signed((&(^~wire4)))));
  assign wire6 = ((($unsigned(wire5) ?
                     ($signed(wire4) * $unsigned(wire5)) : ((8'ha0) ^~ (wire2 ^~ wire3))) != wire1[(3'h4):(1'h0)]) ^ (8'hb4));
  assign wire7 = $signed($unsigned({((~&wire0) <<< wire2[(3'h5):(1'h1)])}));
  module8 #() modinst47 (wire46, clk, wire4, wire0, wire1, wire6, wire3);
  assign wire48 = wire5[(3'h6):(3'h5)];
  assign wire49 = wire5[(4'h9):(3'h4)];
  assign wire50 = wire5;
  module51 #() modinst163 (.y(wire162), .wire54(wire48), .wire55(wire5), .wire53(wire6), .clk(clk), .wire52(wire50));
  assign wire164 = {wire6};
  assign wire165 = wire7[(4'hc):(4'hb)];
  assign wire166 = $signed(((8'hb5) == wire162[(4'h9):(3'h5)]));
  assign wire167 = $unsigned($signed((((^wire48) ?
                           (~^wire50) : $unsigned(wire2)) ?
                       ((wire166 & wire50) != $unsigned(wire5)) : (^~wire2))));
  assign wire168 = $signed($unsigned($signed(wire1[(1'h0):(1'h0)])));
  assign wire169 = wire166;
  always
    @(posedge clk) begin
      reg170 <= $unsigned((~$signed($unsigned($signed(wire4)))));
      reg171 <= (8'ha7);
      reg172 <= $unsigned(reg170[(3'h6):(2'h2)]);
      if ({$unsigned(wire5[(1'h0):(1'h0)]),
          ($unsigned(reg171[(3'h5):(3'h4)]) ? {wire2} : (~&wire168))})
        begin
          reg173 <= ((reg172[(3'h5):(2'h2)] ? wire0 : wire4) ?
              ($unsigned({reg172[(3'h4):(1'h0)],
                  (^~(8'hac))}) + $signed({wire48[(1'h0):(1'h0)],
                  wire168[(3'h7):(2'h2)]})) : (^~wire169[(3'h4):(1'h0)]));
        end
      else
        begin
          if (reg170)
            begin
              reg173 <= ((-wire46[(4'hf):(1'h1)]) >>> wire0[(3'h6):(1'h0)]);
            end
          else
            begin
              reg173 <= ((($signed(wire1) ?
                  $signed($unsigned(reg170)) : wire169) && reg172[(3'h7):(2'h3)]) | (+$signed({wire48[(4'hc):(3'h5)]})));
              reg174 <= {(($signed((wire162 ? wire1 : wire5)) == {{wire169},
                      reg172}) >= ((wire4[(3'h5):(1'h1)] ?
                      wire165[(2'h3):(2'h2)] : ((7'h42) ?
                          wire1 : (8'hb3))) < {(^(8'hbc))}))};
              reg175 <= ((7'h41) ?
                  (~^(~^reg173)) : (($unsigned((8'ha0)) != {wire169[(4'h8):(1'h0)],
                      $unsigned(wire3)}) | (!{(wire0 ^~ wire162)})));
              reg176 <= $unsigned(($unsigned(wire167[(2'h2):(2'h2)]) >> wire46));
              reg177 <= (!((wire4 ?
                      $unsigned(((8'hac) ?
                          (8'ha0) : (8'ha1))) : (+wire0[(5'h10):(2'h3)])) ?
                  $unsigned({{(8'hb0),
                          wire3}}) : $signed((&(wire0 == wire169)))));
            end
          reg178 <= wire168[(3'h7):(3'h6)];
          reg179 <= ((|$signed((&(8'ha3)))) < ((&($signed(wire162) || $unsigned(reg173))) ^ reg178[(2'h3):(2'h3)]));
        end
      if (wire165)
        begin
          reg180 <= (((&($unsigned(wire5) ?
                  (wire168 ?
                      wire5 : reg174) : reg175[(3'h5):(1'h1)])) < {wire6}) ?
              wire164[(4'hd):(4'hc)] : ({(wire49 * $signed(wire164)),
                      reg174[(3'h4):(3'h4)]} ?
                  reg176[(3'h6):(2'h2)] : ($signed(wire162[(3'h6):(2'h2)]) ?
                      ((8'ha7) & (wire7 <= wire6)) : ((wire46 >>> reg171) ?
                          reg176 : wire167))));
          if (wire49)
            begin
              reg181 <= (^wire1[(3'h4):(2'h3)]);
              reg182 <= (reg173[(4'ha):(4'h8)] ?
                  (~^(^~(reg181[(3'h6):(3'h5)] >> (wire49 <= wire46)))) : (wire46 != (((wire48 ?
                      reg177 : wire167) == wire50) <= (reg180 ?
                      (-reg180) : (~wire168)))));
              reg183 <= wire49;
            end
          else
            begin
              reg181 <= $signed((wire166 >>> (-$unsigned($unsigned(reg183)))));
              reg182 <= reg172;
              reg183 <= $signed($signed(((~(|reg181)) - (wire162[(1'h1):(1'h0)] ?
                  (reg180 ? reg183 : (8'hac)) : $unsigned(wire6)))));
              reg184 <= (((8'had) ?
                      ((+$signed(wire166)) ?
                          $unsigned((^(8'hbd))) : (8'hbe)) : wire3[(4'hc):(4'h9)]) ?
                  $unsigned($unsigned(wire6[(4'h9):(2'h3)])) : (8'hae));
            end
        end
      else
        begin
          if ($signed((reg175 ?
              $unsigned($signed((~^reg184))) : (|$unsigned((8'hac))))))
            begin
              reg180 <= (^~$unsigned({($unsigned(reg177) ^~ wire168[(4'h9):(2'h3)]),
                  reg176}));
            end
          else
            begin
              reg180 <= (|$unsigned(reg175));
              reg181 <= wire164[(3'h7):(1'h1)];
              reg182 <= wire166[(3'h7):(1'h0)];
              reg183 <= wire46;
              reg184 <= (8'hb8);
            end
          reg185 <= reg179[(1'h1):(1'h1)];
        end
    end
  assign wire186 = (8'ha0);
  assign wire187 = reg180;
  module51 #() modinst189 (wire188, clk, reg175, reg172, wire3, reg179);
  assign wire190 = $signed(($signed($unsigned($signed((8'ha9)))) ?
                       wire46[(4'hf):(4'h8)] : (8'hba)));
  assign wire191 = reg178[(4'h9):(3'h7)];
endmodule

module module51
#(parameter param161 = ((((((7'h42) ^~ (8'ha4)) - {(8'hb4)}) >> ((^~(8'hb7)) - ((7'h40) ? (8'hb5) : (8'hb7)))) ? ((((8'hbc) ? (8'ha5) : (8'haa)) ? (&(8'hb4)) : ((8'hb6) < (8'hb9))) <= (((8'hae) ? (8'ha8) : (8'ha3)) == ((8'ha2) || (8'ha2)))) : (^~(-(&(7'h40))))) ? (-(!{(8'ha3)})) : (^~((|(!(7'h43))) | ((~(8'hbb)) >>> (~(8'hb8)))))))
(y, clk, wire52, wire53, wire54, wire55);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire [(4'hc):(1'h0)] wire53;
  input wire signed [(2'h3):(1'h0)] wire54;
  input wire [(3'h4):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire160;
  wire signed [(5'h15):(1'h0)] wire134;
  wire [(4'h8):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire113;
  wire signed [(4'he):(1'h0)] wire112;
  wire signed [(3'h6):(1'h0)] wire111;
  wire [(4'hc):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire109;
  wire [(5'h15):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire107;
  wire [(3'h7):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire137;
  wire signed [(4'hb):(1'h0)] wire138;
  wire signed [(5'h12):(1'h0)] wire158;
  assign y = {wire160,
                 wire134,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire101,
                 wire136,
                 wire137,
                 wire138,
                 wire158,
                 (1'h0)};
  assign wire56 = $unsigned(wire53);
  assign wire57 = $signed(($unsigned({(wire53 ~^ wire53),
                      wire52}) > $signed(wire53)));
  assign wire58 = $signed(wire56);
  assign wire59 = (~^(wire58 - {wire54}));
  module60 #() modinst102 (wire101, clk, wire52, wire56, wire54, wire53, wire55);
  assign wire103 = $unsigned((~|(!wire57)));
  assign wire104 = wire56[(2'h2):(1'h0)];
  assign wire105 = $unsigned({(~|(wire58 ? wire101 : {wire53})),
                       {wire101,
                           (wire53[(1'h1):(1'h1)] ?
                               {wire104} : (wire54 >= (8'hae)))}});
  assign wire106 = (((({wire101,
                       wire105} ~^ $signed(wire54)) == wire59[(4'hf):(4'hd)]) <<< wire105[(3'h7):(3'h4)]) > wire59);
  assign wire107 = ({(8'hb0)} > (8'ha7));
  assign wire108 = (7'h41);
  assign wire109 = (^~(wire104[(4'hc):(1'h0)] ?
                       {(~^(wire55 ? wire54 : wire107)),
                           $unsigned(wire107[(3'h5):(1'h0)])} : (wire57 ?
                           wire101[(3'h4):(2'h3)] : (|(wire108 || wire57)))));
  assign wire110 = $signed($signed({($unsigned((8'haa)) ? wire103 : wire52)}));
  assign wire111 = wire106[(2'h3):(2'h2)];
  assign wire112 = ((((wire110[(3'h5):(3'h4)] ?
                               (wire57 ?
                                   wire104 : wire105) : (wire101 > wire108)) * wire108) ?
                           ($unsigned($unsigned(wire109)) ?
                               $signed((wire108 < wire110)) : ((wire53 ?
                                   wire105 : wire54) && {wire109})) : $signed((wire103 ?
                               $signed(wire105) : $unsigned(wire58)))) ?
                       wire110 : $unsigned($signed(((~wire107) ?
                           (~|wire53) : $signed(wire57)))));
  assign wire113 = wire52;
  assign wire114 = wire112;
  module115 #() modinst135 (wire134, clk, wire108, wire101, wire111, wire58, wire110);
  assign wire136 = (+wire59[(2'h3):(2'h3)]);
  assign wire137 = $signed((wire106 != $signed(wire112[(2'h2):(1'h1)])));
  assign wire138 = (8'hb6);
  module139 #() modinst159 (wire158, clk, wire105, wire136, wire134, wire59, wire58);
  assign wire160 = $unsigned(wire108);
endmodule

module module8
#(parameter param45 = ((+((&(^(8'hb6))) - (~&((8'ha8) ? (8'hab) : (8'ha5))))) ? ({(((8'hac) ? (7'h44) : (8'hbf)) - ((8'haa) * (8'ha7))), ({(8'ha2), (8'hb0)} ? ((8'hb8) & (8'hb8)) : ((8'hb2) ? (8'hb1) : (8'hb4)))} ? ((((8'hbf) & (8'ha3)) - ((8'ha8) ? (8'had) : (8'h9e))) ? (((8'hba) <= (8'had)) != ((8'h9c) ? (8'haa) : (8'ha0))) : ({(8'hbf)} << {(8'hba), (8'haf)})) : (~^(~&(8'hac)))) : (!(((~(8'hbb)) ^~ (-(7'h42))) ? {((8'h9c) ? (8'ha4) : (8'h9f))} : (~&(+(8'hb6)))))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire signed [(4'hb):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire16,
                 wire15,
                 wire14,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire14 = wire11;
  assign wire15 = $unsigned($signed(wire9));
  assign wire16 = {wire14[(4'hb):(2'h2)]};
  module17 #() modinst31 (wire30, clk, wire16, wire12, wire13, wire11);
  assign wire32 = (-($unsigned($unsigned((wire12 ?
                      wire30 : (8'ha8)))) == wire14));
  assign wire33 = ((8'hba) ~^ wire10[(2'h2):(1'h1)]);
  assign wire34 = $signed(((8'h9d) ?
                      $unsigned($unsigned($unsigned(wire33))) : ((~^wire11[(3'h7):(3'h7)]) ^ wire11)));
  always
    @(posedge clk) begin
      reg35 <= wire16[(4'h8):(1'h1)];
      reg36 <= (!wire16[(4'h8):(3'h7)]);
      reg37 <= $signed($signed($unsigned((wire34 >= $unsigned((7'h44))))));
    end
  assign wire38 = wire15[(3'h4):(2'h2)];
  assign wire39 = $unsigned({($unsigned((reg37 ? wire10 : wire34)) ?
                          $signed({wire15}) : reg36[(5'h10):(2'h2)])});
  assign wire40 = $signed({$unsigned($unsigned((wire32 ? wire32 : wire30))),
                      wire15});
  assign wire41 = ((~|$unsigned(({(8'ha4)} >> ((8'hb6) ? wire15 : wire39)))) ?
                      (8'ha5) : $unsigned($unsigned((((8'haa) ?
                              wire12 : wire9) ?
                          ((8'ha8) ? wire34 : wire16) : $signed(wire39)))));
  assign wire42 = wire34[(4'hd):(3'h6)];
  assign wire43 = wire33;
  assign wire44 = (wire40 ?
                      $signed(wire32[(3'h7):(2'h3)]) : (~|(((&wire9) && wire39[(3'h6):(3'h6)]) <= (~(wire16 ?
                          wire34 : reg36)))));
endmodule

module module17
#(parameter param29 = ({{{((8'hb1) ? (8'hbc) : (8'h9f))}, (((8'hab) ^~ (8'hbd)) > (8'hb9))}, ((8'hb5) >>> (((8'hb5) ? (8'hb5) : (7'h44)) ? ((8'h9c) ? (8'hb5) : (8'hb7)) : ((8'ha2) > (8'hb2))))} - (!{{((8'haf) && (8'hb6))}, (((8'ha9) ? (8'hb3) : (8'hb9)) || (~|(8'hba)))})))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  assign y = {wire28, wire27, wire26, wire25, wire24, wire23, wire22, (1'h0)};
  assign wire22 = (wire18 ?
                      (wire20[(4'hc):(2'h3)] ?
                          wire20[(1'h1):(1'h0)] : wire20) : (^wire19[(3'h6):(3'h6)]));
  assign wire23 = ((wire18 & (wire18 & ((+wire20) ?
                      (^~wire19) : (~&(8'hbd))))) > (|$unsigned((((8'hbf) < wire20) >> wire18[(4'h9):(1'h0)]))));
  assign wire24 = $unsigned({wire19,
                      (wire18[(2'h2):(2'h2)] ?
                          ($signed(wire20) * wire22) : (^~wire18[(3'h7):(2'h3)]))});
  assign wire25 = ($signed($signed((|wire23))) ?
                      $signed(wire18[(3'h6):(3'h4)]) : ($signed(((wire24 | wire20) ?
                          (~|wire20) : {wire18, wire22})) || wire22));
  assign wire26 = wire18;
  assign wire27 = (~|wire24[(2'h2):(1'h0)]);
  assign wire28 = {(8'ha3), {{(7'h44)}, $signed($unsigned(wire23))}};
endmodule

module module139
#(parameter param157 = (^({(((8'hb8) ? (8'ha3) : (8'h9c)) - ((8'hae) ? (8'hb7) : (8'hb2)))} ? (^{((7'h40) <<< (8'hb7))}) : (^((^~(8'ha1)) >= ((8'hb3) & (8'hb5)))))))
(y, clk, wire144, wire143, wire142, wire141, wire140);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire144;
  input wire signed [(4'hd):(1'h0)] wire143;
  input wire signed [(5'h10):(1'h0)] wire142;
  input wire [(5'h11):(1'h0)] wire141;
  input wire signed [(3'h7):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire156;
  wire signed [(4'he):(1'h0)] wire155;
  wire [(5'h11):(1'h0)] wire154;
  wire signed [(4'h9):(1'h0)] wire153;
  wire [(4'h9):(1'h0)] wire152;
  wire [(3'h4):(1'h0)] wire151;
  wire [(4'h9):(1'h0)] wire150;
  wire signed [(4'h8):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire148;
  wire signed [(4'hc):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire [(4'hc):(1'h0)] wire145;
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 (1'h0)};
  assign wire145 = wire142[(3'h6):(2'h3)];
  assign wire146 = ((wire143[(4'ha):(2'h2)] ?
                           wire144 : wire144[(2'h2):(2'h2)]) ?
                       $unsigned($unsigned(wire142[(4'h8):(3'h4)])) : {((&(wire142 << (8'hbf))) ?
                               (|(wire141 + (8'hbe))) : $unsigned($unsigned(wire142)))});
  assign wire147 = wire140[(3'h4):(1'h1)];
  assign wire148 = (wire147 ?
                       $unsigned(wire145[(4'hc):(4'ha)]) : $unsigned(wire145));
  assign wire149 = {$unsigned(((&$signed(wire147)) ?
                           $signed(wire147) : ((wire141 >>> wire140) ?
                               $unsigned(wire143) : {(8'hb0), wire148}))),
                       $unsigned(wire144[(2'h3):(2'h2)])};
  assign wire150 = (~&{wire146});
  assign wire151 = ((^~$unsigned(wire140[(3'h7):(2'h2)])) && $unsigned(((|wire144[(1'h0):(1'h0)]) | (-wire145[(2'h2):(1'h1)]))));
  assign wire152 = ((&(~(wire143[(1'h0):(1'h0)] <= wire147[(3'h6):(3'h5)]))) > $unsigned(((+(!wire140)) ^ {$signed(wire147),
                       $unsigned(wire141)})));
  assign wire153 = $signed(wire141);
  assign wire154 = $unsigned(wire152);
  assign wire155 = {({(~^wire150)} ?
                           ((|{wire154}) >> wire153[(1'h0):(1'h0)]) : ($unsigned(((8'hab) >= wire144)) ?
                               (^~$signed(wire151)) : wire151)),
                       ($unsigned((wire154[(1'h1):(1'h1)] > $unsigned((8'hb0)))) >> (~$unsigned($unsigned(wire140))))};
  assign wire156 = $unsigned((((wire141 ^~ wire152[(3'h5):(1'h1)]) ?
                           wire144[(4'ha):(1'h0)] : wire149[(4'h8):(3'h6)]) ?
                       (($unsigned(wire155) <<< (~&wire141)) ?
                           {((8'hb7) ?
                                   wire147 : wire152)} : ($signed(wire151) <= wire145[(3'h6):(2'h2)])) : ($signed((8'h9c)) + wire147[(3'h4):(2'h2)])));
endmodule

module module115
#(parameter param133 = (-{(((&(8'hb9)) >> ((8'ha1) ? (8'hb4) : (8'hb6))) << ((8'h9d) ? ((8'h9c) ? (8'ha3) : (8'hb2)) : ((8'hb1) != (8'ha5)))), (8'hb1)}))
(y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire120;
  input wire signed [(3'h5):(1'h0)] wire119;
  input wire signed [(3'h6):(1'h0)] wire118;
  input wire signed [(4'he):(1'h0)] wire117;
  input wire signed [(4'hc):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire128;
  wire signed [(4'h8):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire123;
  wire signed [(3'h7):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire121;
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 (1'h0)};
  assign wire121 = ($unsigned(wire118) ?
                       (&$signed(((7'h41) ~^ wire118[(1'h1):(1'h1)]))) : (((~wire119) ?
                           (!(-wire117)) : $signed((wire117 ?
                               wire116 : wire119))) & wire118));
  assign wire122 = wire118;
  assign wire123 = $signed($unsigned({($unsigned(wire117) <= (~^(8'hb6))),
                       $unsigned(((8'hbe) | wire122))}));
  assign wire124 = wire116[(4'h9):(2'h3)];
  assign wire125 = $signed((~|(^~(-$unsigned(wire121)))));
  assign wire126 = wire121[(4'h8):(3'h7)];
  assign wire127 = $unsigned(($unsigned((8'h9d)) >= (wire124 ?
                       ((&wire124) && {wire116}) : (wire124[(3'h6):(2'h2)] ?
                           wire116[(1'h1):(1'h0)] : wire122))));
  assign wire128 = (!(^($signed(wire116) ?
                       {(wire117 ?
                               wire120 : (8'h9f))} : wire118[(1'h0):(1'h0)])));
  assign wire129 = (($signed($unsigned($unsigned(wire123))) ?
                       wire124 : ({$unsigned(wire118),
                           (wire128 & wire118)} < $signed((+wire122)))) || ($signed(((wire118 - (7'h42)) ?
                       {wire120, wire120} : {wire118,
                           (8'ha8)})) >= {wire119[(1'h1):(1'h1)]}));
  assign wire130 = $signed(wire124[(1'h0):(1'h0)]);
  assign wire131 = ({(wire119 & wire128[(3'h4):(2'h3)])} == $signed((^((~|wire118) ?
                       {wire120} : (wire127 << wire118)))));
  assign wire132 = {($unsigned(wire118[(3'h4):(1'h1)]) | wire118[(2'h3):(2'h3)])};
endmodule

module module60
#(parameter param99 = (^(((|((8'ha9) ? (8'hb4) : (7'h42))) <= ((^~(8'ha9)) ? ((8'hbe) < (8'ha3)) : {(8'hb2), (8'hb6)})) <= {(((7'h44) >>> (7'h41)) - ((8'hb4) < (8'hb6)))})), 
parameter param100 = (8'hbc))
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire65;
  input wire signed [(5'h10):(1'h0)] wire64;
  input wire signed [(2'h3):(1'h0)] wire63;
  input wire [(4'hc):(1'h0)] wire62;
  input wire [(3'h4):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire [(5'h11):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg95,
                 reg94,
                 reg93,
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
                 (1'h0)};
  assign wire66 = wire64;
  assign wire67 = wire61[(2'h3):(1'h1)];
  assign wire68 = wire64[(4'ha):(3'h4)];
  assign wire69 = wire65;
  assign wire70 = wire67[(3'h6):(1'h0)];
  assign wire71 = (&wire62);
  assign wire72 = wire63;
  assign wire73 = ($signed(($signed((~|wire67)) <<< wire63[(2'h2):(1'h1)])) ?
                      (((wire70 * (wire66 ?
                          wire64 : wire70)) << wire71) >>> wire70) : $signed(wire67));
  assign wire74 = {{({{(8'ha1), wire66}} ?
                              (~^(-wire63)) : ((wire61 - wire68) ?
                                  wire63 : {wire61, (8'ha0)})),
                          ($signed($unsigned(wire67)) || wire64)}};
  always
    @(posedge clk) begin
      reg75 <= ($signed((~{$unsigned(wire62),
          (^(8'ha7))})) == $signed(((wire61[(2'h3):(2'h3)] ?
          (wire65 != wire64) : (wire68 ?
              wire68 : wire71)) >>> $unsigned(wire69[(4'h8):(2'h3)]))));
      if (wire61)
        begin
          reg76 <= (($signed((&$signed(wire71))) ?
                  (wire70 >= (|$signed(wire72))) : (($unsigned((8'ha6)) >= (wire67 ?
                          reg75 : wire72)) ?
                      {wire64[(4'hf):(1'h1)],
                          (wire66 > wire73)} : ($signed((8'hbd)) ?
                          (~|reg75) : $unsigned(wire74)))) ?
              {((&$signed(wire63)) > {wire66, wire71}),
                  $signed(((wire74 >= wire70) ?
                      (wire64 * wire65) : (~wire72)))} : ($unsigned($unsigned((wire64 ?
                  wire65 : wire69))) ^ wire65[(3'h6):(2'h2)]));
          reg77 <= $signed(($unsigned(wire61[(2'h2):(1'h1)]) <= ($signed((reg76 >= wire62)) ?
              wire74 : $signed($unsigned(wire68)))));
        end
      else
        begin
          if ((|{wire74,
              (wire71[(1'h1):(1'h1)] ? wire72[(3'h5):(3'h4)] : (^(!(8'ha2))))}))
            begin
              reg76 <= wire63;
              reg77 <= $unsigned($signed(({(|wire67)} ?
                  ($signed(wire66) ? (wire63 < (8'ha5)) : wire70) : ((reg77 ?
                          reg77 : wire67) ?
                      $signed(wire72) : ((8'hbe) ? (8'ha1) : (7'h44))))));
              reg78 <= (!(^(~|$signed(wire61))));
              reg79 <= $unsigned($signed(((wire74[(4'hb):(1'h0)] & (&wire71)) ?
                  reg78[(2'h3):(2'h2)] : (7'h42))));
              reg80 <= $unsigned((~|wire61));
            end
          else
            begin
              reg76 <= $signed(reg76[(4'he):(4'h9)]);
              reg77 <= (^~reg77);
              reg78 <= (8'hb7);
            end
          if ($signed(({{(wire64 ? (8'hb7) : reg80)},
                  $signed($signed(wire72))} ?
              (^~$unsigned((reg77 && wire73))) : $unsigned($signed((wire66 != (8'hb6)))))))
            begin
              reg81 <= $unsigned({reg76,
                  $signed(($unsigned(wire70) <<< {wire69}))});
              reg82 <= wire67;
              reg83 <= ((|({$unsigned((8'ha2))} || $signed($signed(wire63)))) * wire69);
            end
          else
            begin
              reg81 <= wire64[(5'h10):(5'h10)];
              reg82 <= wire62;
              reg83 <= $unsigned($signed($unsigned(((wire67 ?
                      (8'ha9) : (8'hb0)) ?
                  $unsigned(reg75) : $signed(wire65)))));
            end
          reg84 <= reg78[(3'h4):(1'h0)];
        end
    end
  assign wire85 = {(reg82[(2'h2):(1'h1)] >> $signed(wire72))};
  assign wire86 = (8'haa);
  assign wire87 = {reg81[(2'h2):(1'h1)]};
  assign wire88 = wire63[(2'h3):(1'h1)];
  assign wire89 = ((^~wire69) + wire68[(3'h4):(3'h4)]);
  assign wire90 = {wire88};
  assign wire91 = wire70;
  assign wire92 = (reg78[(3'h6):(2'h2)] - $signed(($unsigned(wire62[(2'h2):(1'h1)]) <= reg80)));
  always
    @(posedge clk) begin
      reg93 <= ($unsigned((($unsigned(wire88) >>> $unsigned(wire66)) > (((7'h42) == reg77) ?
              (!reg80) : wire71))) ?
          $signed(($signed((wire92 <<< wire89)) | wire69)) : (~|{reg84[(3'h5):(1'h1)],
              wire64}));
      reg94 <= (-(~|$unsigned(reg93[(2'h3):(2'h2)])));
      reg95 <= $unsigned(($unsigned(((^~reg94) ^~ (-reg83))) ?
          {wire73[(5'h12):(3'h5)]} : wire63));
    end
  assign wire96 = wire64[(4'hc):(2'h3)];
  assign wire97 = ({((~|$unsigned(wire73)) <<< ($signed((8'hbb)) ?
                          reg77 : (wire91 >> wire65)))} || ((wire96[(2'h2):(1'h0)] | reg79[(3'h6):(1'h1)]) & wire63[(2'h3):(1'h1)]));
  assign wire98 = wire67;
endmodule
