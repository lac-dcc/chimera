module top
#(parameter param187 = ((((^~((8'ha3) >> (7'h43))) ? (8'hae) : ((8'hbd) == ((8'had) ? (8'hb1) : (8'hbf)))) | (8'hbc)) ? (((((8'hb8) ? (8'hac) : (8'hb7)) == (8'hb0)) ? ((-(8'ha3)) ? ((8'hb2) ? (8'hb2) : (8'hb4)) : (+(8'hba))) : (~|{(7'h43), (8'hab)})) ^ ((((8'ha6) ? (7'h42) : (8'hb9)) >>> ((8'hbe) ? (7'h42) : (8'hb0))) || (((8'hb1) ? (8'ha1) : (8'hb7)) >= {(8'hbb)}))) : (((+((8'hae) ? (8'haf) : (8'had))) ? (((8'hbe) ? (8'hae) : (8'ha9)) ? {(8'hb4)} : ((8'hb5) ~^ (8'hb4))) : {((8'hbc) * (8'hb6)), ((8'hbc) ? (8'hac) : (8'ha7))}) ? ({{(8'h9c), (8'haa)}, ((7'h43) ? (7'h44) : (8'ha4))} ? ((~(8'hb0)) ? ((8'hbe) & (8'ha6)) : (-(8'hb4))) : (~^(^~(8'hb4)))) : ((((8'had) ~^ (8'hb2)) ? (~(8'ha6)) : ((8'had) ? (8'ha4) : (7'h42))) ? (((8'ha4) ? (8'ha2) : (8'hb5)) ? ((8'h9f) ? (8'hbe) : (8'had)) : (~(8'hb6))) : (~{(8'hab), (8'h9f)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire174;
  wire [(4'hd):(1'h0)] wire173;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire171;
  reg signed [(5'h15):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(4'h9):(1'h0)] reg183 = (1'h0);
  reg [(5'h14):(1'h0)] reg182 = (1'h0);
  reg [(5'h11):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg180 = (1'h0);
  reg [(4'hb):(1'h0)] reg179 = (1'h0);
  reg [(3'h4):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg177 = (1'h0);
  reg [(4'hb):(1'h0)] reg176 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire85,
                 wire26,
                 wire87,
                 wire88,
                 wire89,
                 wire171,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  module4 #() modinst27 (wire26, clk, wire2, wire1, wire3, wire0);
  module28 #() modinst86 (.wire33(wire0), .y(wire85), .wire30(wire2), .wire32(wire3), .wire29(wire1), .wire31(wire26), .clk(clk));
  assign wire87 = (^~((+((wire85 >> wire26) ?
                      $signed(wire1) : (^~wire0))) * ($signed((wire3 ?
                          wire26 : wire85)) ?
                      wire26[(1'h0):(1'h0)] : {{(8'hb9)}})));
  assign wire88 = (&$signed($signed($signed((~^wire3)))));
  assign wire89 = (!{$signed(((~wire1) ^~ (wire3 ? wire0 : wire26)))});
  always
    @(posedge clk) begin
      reg90 <= ((wire1[(4'ha):(4'ha)] == $unsigned(wire3)) > ($unsigned($unsigned((wire3 + wire89))) ?
          wire1[(2'h2):(2'h2)] : $signed(wire3[(4'hb):(1'h1)])));
      reg91 <= (~&((8'ha1) ?
          $unsigned(($unsigned(wire2) >= wire88[(4'ha):(1'h0)])) : reg90[(3'h6):(2'h2)]));
      if (wire89)
        begin
          reg92 <= $signed(($signed((~^(reg90 <<< wire85))) ?
              (((wire89 * reg91) ?
                  wire88 : wire88[(4'ha):(4'h8)]) >>> ((~^(8'hb6)) ^ (~^wire89))) : ({wire26[(3'h7):(1'h1)],
                  (&wire1)} < ((wire85 || wire26) >= $unsigned(wire87)))));
        end
      else
        begin
          reg92 <= wire89[(5'h14):(4'hc)];
          if ((({$signed($signed(wire3))} ?
                  $unsigned(wire87) : ((!(wire3 ? wire26 : wire26)) ?
                      ($signed(wire2) ?
                          (wire85 ?
                              wire0 : wire88) : $unsigned(wire0)) : {$unsigned(wire88),
                          wire2[(4'hc):(3'h6)]})) ?
              ((~&wire26[(3'h4):(3'h4)]) <= (($signed(reg91) - $signed((8'ha8))) & {wire3[(2'h2):(2'h2)]})) : $unsigned(wire26[(1'h0):(1'h0)])))
            begin
              reg93 <= {($signed({{wire1}, (~&wire2)}) ?
                      (!wire26) : $unsigned(($unsigned(wire0) ?
                          (reg90 <<< wire87) : $unsigned(wire0)))),
                  $signed((^$unsigned($unsigned((8'hb2)))))};
              reg94 <= (~|reg91);
              reg95 <= reg91[(1'h1):(1'h1)];
            end
          else
            begin
              reg93 <= (!(wire0[(3'h5):(2'h3)] != (^{$unsigned(wire2)})));
            end
          reg96 <= ((^~({wire0, $signed(wire88)} > (&reg90))) ?
              $unsigned(($signed((wire87 == (7'h40))) ?
                  wire3 : $unsigned(reg94))) : (reg94 & reg92));
          reg97 <= $signed(reg96);
        end
    end
  module98 #() modinst172 (wire171, clk, wire87, wire85, reg94, wire2, reg96);
  assign wire173 = reg92;
  assign wire174 = $signed($unsigned($signed((8'hb8))));
  assign wire175 = reg94[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      reg176 <= wire173[(4'hb):(4'ha)];
      reg177 <= (wire1 == reg176[(4'ha):(3'h4)]);
      reg178 <= wire175;
      if ((((reg96[(4'h8):(4'h8)] != ((wire173 ?
          (8'ha8) : wire171) ^~ ((8'hb8) & wire85))) <= $signed({wire88})) || (8'hbe)))
        begin
          reg179 <= (8'had);
          reg180 <= $unsigned({wire174[(2'h3):(1'h0)],
              (((-wire0) ? $unsigned((7'h41)) : (8'hbf)) >>> ({wire89} ?
                  $signed(wire3) : (8'hb6)))});
        end
      else
        begin
          reg179 <= $unsigned(wire85[(4'ha):(4'ha)]);
          if (wire2)
            begin
              reg180 <= $signed($signed(wire173[(2'h2):(1'h1)]));
              reg181 <= (8'had);
              reg182 <= wire26;
              reg183 <= $unsigned(wire1[(5'h15):(4'hd)]);
            end
          else
            begin
              reg180 <= (reg96[(2'h3):(2'h2)] ?
                  $unsigned({(((8'haf) ? reg96 : reg183) ?
                          (reg97 ^~ (7'h42)) : (8'hac)),
                      wire89}) : (reg180 + (~&(~|$signed(wire87)))));
              reg181 <= (({reg181, reg95} ?
                  (wire85[(1'h1):(1'h0)] << ((!wire173) ?
                      $unsigned(reg91) : wire89[(2'h3):(1'h0)])) : $unsigned(reg94[(3'h5):(2'h3)])) * $signed(($signed(wire175[(1'h0):(1'h0)]) ?
                  reg180[(4'ha):(1'h1)] : {(wire88 ? reg183 : wire89),
                      (^reg181)})));
              reg182 <= reg95;
            end
          reg184 <= $unsigned({({(wire85 ? reg92 : wire173)} ?
                  reg183[(1'h0):(1'h0)] : reg176),
              ((reg179[(2'h2):(1'h0)] > $unsigned(reg177)) ?
                  $unsigned(wire26) : (&reg183[(3'h7):(3'h6)]))});
          reg185 <= $unsigned($unsigned((wire87[(4'hb):(3'h7)] ?
              {$signed(reg176)} : $unsigned(wire2[(5'h10):(2'h2)]))));
          reg186 <= $unsigned({$signed({(reg94 ? wire89 : wire2),
                  $signed(wire3)})});
        end
    end
endmodule

module module98  (y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire103;
  input wire [(4'h8):(1'h0)] wire102;
  input wire [(4'ha):(1'h0)] wire101;
  input wire signed [(4'ha):(1'h0)] wire100;
  input wire signed [(3'h7):(1'h0)] wire99;
  wire signed [(4'hb):(1'h0)] wire170;
  wire signed [(2'h3):(1'h0)] wire169;
  wire signed [(4'hf):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire150;
  wire [(5'h11):(1'h0)] wire149;
  wire [(5'h11):(1'h0)] wire147;
  wire [(4'ha):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire111;
  wire [(4'hc):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire104;
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg166 = (1'h0);
  reg [(5'h11):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg164 = (1'h0);
  reg [(3'h6):(1'h0)] reg163 = (1'h0);
  reg [(4'h8):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg [(4'hc):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg153 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire104,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
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
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 (1'h0)};
  assign wire104 = ($signed($unsigned(wire100[(1'h1):(1'h0)])) & (+$signed(((wire101 ?
                           wire99 : (8'ha7)) ?
                       wire101 : wire100))));
  always
    @(posedge clk) begin
      reg105 <= ($unsigned((($signed(wire100) ^ (wire99 ?
              wire99 : wire103)) == (wire103 ~^ wire102[(1'h0):(1'h0)]))) ?
          (~&(wire102 + $unsigned((^wire99)))) : $signed((|(8'h9e))));
      reg106 <= ($signed($unsigned($unsigned(wire102[(4'h8):(3'h5)]))) ?
          $unsigned((~&reg105)) : ((8'hab) ?
              (wire100[(4'h8):(1'h0)] ?
                  ({wire100, wire101} ?
                      (wire101 ?
                          wire104 : wire100) : wire102) : ((+wire99) == $unsigned(wire102))) : wire103));
      reg107 <= ({{(^~(&wire102))}} ?
          ((^~wire102) + $unsigned((+reg105[(1'h1):(1'h1)]))) : ($unsigned({(~^wire100)}) ?
              $signed(wire103) : {wire102[(2'h3):(2'h2)]}));
      reg108 <= (!($unsigned($signed(((8'hab) > wire104))) ?
          $unsigned($signed($unsigned(reg107))) : (((wire101 ?
                  wire101 : wire102) ?
              (|wire101) : wire103) <<< ($unsigned((8'hb8)) != (~|wire101)))));
    end
  assign wire109 = $signed((-$signed(reg106[(4'hc):(4'hc)])));
  assign wire110 = {wire104,
                       ($signed($signed(wire102)) || wire102[(3'h5):(2'h3)])};
  assign wire111 = (-(wire102 ~^ wire104));
  assign wire112 = ((8'hb3) ?
                       $signed((+{$signed(wire104)})) : $unsigned(wire99[(3'h6):(1'h0)]));
  module113 #() modinst148 (wire147, clk, reg106, wire112, wire109, wire102, wire111);
  assign wire149 = $unsigned(($unsigned($unsigned((wire104 ?
                           (8'h9e) : reg108))) ?
                       $unsigned(wire111[(3'h6):(1'h1)]) : $signed((~$unsigned((7'h43))))));
  assign wire150 = (|($unsigned(wire149[(1'h0):(1'h0)]) ?
                       reg107[(4'hd):(4'ha)] : (wire110 <= (~^(wire112 ?
                           wire110 : wire101)))));
  assign wire151 = $unsigned(wire104[(3'h6):(1'h1)]);
  assign wire152 = wire112[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ({$unsigned((^~$unsigned((wire111 ? wire103 : reg106)))),
          $signed(reg106[(5'h10):(2'h2)])})
        begin
          reg153 <= ((7'h42) >>> {{$signed((wire151 ? wire109 : reg106))}});
          reg154 <= $unsigned((wire103 >> wire150[(5'h13):(4'h8)]));
          if ($signed({($signed((wire150 ?
                  reg154 : reg153)) & $signed((reg107 * (8'hbd)))),
              $signed(wire109)}))
            begin
              reg155 <= (wire149 ? (^wire100) : wire111[(3'h7):(1'h0)]);
              reg156 <= wire100[(3'h5):(2'h3)];
              reg157 <= wire149;
              reg158 <= ($signed($signed(((reg107 + reg106) * wire110[(3'h5):(3'h4)]))) && wire110[(1'h1):(1'h0)]);
            end
          else
            begin
              reg155 <= ({(|wire152)} ?
                  $unsigned((&$signed(reg156[(2'h3):(2'h2)]))) : (+$unsigned(({(8'ha6)} || (wire102 ^~ (8'hbb))))));
              reg156 <= ($unsigned((7'h42)) ?
                  ((^$signed(wire109[(3'h5):(1'h0)])) == (reg107[(3'h6):(3'h5)] + ($signed(wire150) ?
                      (!reg155) : (wire111 <= wire110)))) : (&(^~{reg156[(3'h7):(1'h0)]})));
            end
        end
      else
        begin
          if (($signed($signed(wire112[(3'h5):(2'h3)])) <= $signed(wire111[(1'h0):(1'h0)])))
            begin
              reg153 <= reg106;
            end
          else
            begin
              reg153 <= reg154;
              reg154 <= (reg107[(4'hc):(4'hb)] ?
                  wire109[(1'h0):(1'h0)] : reg154);
              reg155 <= ((wire100 ?
                  (+(~(wire103 != wire103))) : (((wire109 >>> wire111) && reg157) == $unsigned(reg106[(4'h9):(3'h7)]))) <<< $signed(((reg154[(4'h8):(3'h6)] ^~ (reg107 || (8'hb1))) ?
                  $signed((wire103 ?
                      (8'h9f) : wire100)) : (wire150 <<< {wire101, reg155}))));
              reg156 <= $signed($unsigned($unsigned(wire104[(2'h2):(1'h1)])));
              reg157 <= {(-(wire112[(3'h7):(3'h4)] - ($signed(reg156) ?
                      wire151 : $unsigned(reg158)))),
                  $signed(({reg107[(4'he):(4'hd)], $signed(reg107)} ?
                      ((wire104 ? wire149 : wire104) ?
                          (~^(8'hb9)) : (^(8'hae))) : (|((7'h40) ^ reg154))))};
            end
          if ((~^(($unsigned((wire102 >> wire112)) || $unsigned(reg155[(1'h0):(1'h0)])) ?
              (~|($signed(wire112) - wire112[(3'h5):(1'h0)])) : {wire147[(1'h1):(1'h0)]})))
            begin
              reg158 <= $unsigned({reg108});
              reg159 <= $unsigned($unsigned({{wire152,
                      wire112[(4'h8):(1'h1)]}}));
              reg160 <= ($signed($signed($signed($signed(reg106)))) ?
                  ((((reg108 >= reg156) | reg154) ?
                      wire110 : $unsigned((-wire99))) - reg156) : $signed(reg153));
              reg161 <= {(|((&(^~reg108)) ?
                      ($unsigned(wire112) ?
                          wire109 : (reg157 ^~ (7'h42))) : wire100[(3'h7):(1'h1)])),
                  (^~{((&reg107) ?
                          (reg160 >> wire149) : (wire109 ?
                              reg157 : (8'h9e)))})};
              reg162 <= (+$unsigned(wire112));
            end
          else
            begin
              reg158 <= (8'ha7);
              reg159 <= (8'hb3);
              reg160 <= ($signed(wire100) ?
                  $signed($unsigned(reg106)) : $signed((~^reg156)));
            end
          reg163 <= {{$signed($unsigned(reg158[(3'h6):(2'h2)])),
                  (&(~&wire111))},
              $signed({(!(wire150 ? wire104 : reg108)), wire110})};
          if ((8'hbc))
            begin
              reg164 <= ($signed($signed((~|(wire112 ? wire102 : (8'hb3))))) ?
                  (~^wire152) : {$signed($signed(wire152))});
              reg165 <= $unsigned((7'h44));
              reg166 <= ((wire101[(4'h9):(4'h8)] ^ (&($unsigned(wire101) ?
                  (wire101 ^~ wire102) : $unsigned(wire150)))) == $unsigned({(((8'haa) < reg157) ?
                      $unsigned(wire102) : reg156[(3'h6):(3'h4)])}));
              reg167 <= (wire109[(5'h12):(4'h9)] << $signed(({$signed(reg163),
                  $signed(wire102)} <<< wire104[(2'h2):(2'h2)])));
            end
          else
            begin
              reg164 <= $unsigned((reg154[(3'h7):(1'h1)] ?
                  $signed(reg166[(5'h10):(3'h4)]) : (reg154 >>> reg166[(4'hc):(3'h5)])));
              reg165 <= $unsigned($signed({$signed((~wire150)),
                  $signed((wire152 + (8'hbd)))}));
              reg166 <= $unsigned(reg161[(1'h1):(1'h1)]);
            end
          reg168 <= ($signed($unsigned(wire152[(3'h7):(3'h4)])) | (~|($unsigned({wire112,
              wire149}) * ($signed(wire109) ^~ wire152))));
        end
    end
  assign wire169 = (+(~(-(|(&wire150)))));
  assign wire170 = reg160[(2'h3):(1'h1)];
endmodule

module module28
#(parameter param84 = {({(~((8'ha4) >> (8'ha3))), {((8'hb7) | (8'hb3)), {(8'ha0)}}} ^~ (({(8'hae), (8'ha3)} ? ((8'hb1) ? (8'hb7) : (8'ha0)) : (~(8'ha5))) ? (((8'hb8) - (8'hbc)) ? ((8'hb7) ? (8'hab) : (8'hb8)) : {(8'hbf)}) : ((!(8'ha7)) ? ((8'hbd) >= (8'ha8)) : ((8'hac) && (8'h9c)))))})
(y, clk, wire29, wire30, wire31, wire32, wire33);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire29;
  input wire signed [(5'h13):(1'h0)] wire30;
  input wire signed [(4'h9):(1'h0)] wire31;
  input wire signed [(4'hd):(1'h0)] wire32;
  input wire [(4'ha):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire53;
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  assign y = {wire83,
                 wire55,
                 wire34,
                 wire35,
                 wire53,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire34 = wire32[(3'h5):(1'h1)];
  assign wire35 = (((($signed(wire33) ? $signed(wire32) : $unsigned(wire29)) ?
                              $signed($signed(wire33)) : $unsigned((wire32 ^~ wire34))) ?
                          $unsigned($signed($signed(wire31))) : wire30[(4'hd):(4'hc)]) ?
                      $signed((wire34 ?
                          (|wire31[(2'h3):(2'h3)]) : ((wire34 ?
                              (8'hbc) : wire30) ^ {wire32}))) : ((|($signed(wire30) ?
                          $signed(wire30) : $unsigned(wire29))) + $signed({wire32})));
  module36 #() modinst54 (wire53, clk, wire33, wire34, wire35, wire32, wire29);
  assign wire55 = $unsigned((~|(wire34[(4'he):(4'ha)] <<< wire33)));
  always
    @(posedge clk) begin
      if ($signed($unsigned((!{wire29[(2'h3):(1'h1)], wire34}))))
        begin
          reg56 <= $unsigned((wire32 & wire31[(4'h8):(1'h1)]));
          reg57 <= $signed($unsigned(($unsigned((-wire30)) ?
              $signed($unsigned(wire33)) : wire55)));
          if (({$signed((^$unsigned(reg57)))} - $signed(($unsigned(wire32) ^ (!(~&wire55))))))
            begin
              reg58 <= $unsigned(($unsigned((!wire35[(4'h8):(3'h4)])) ?
                  {{reg57[(2'h2):(1'h0)], (~^wire32)}} : reg56));
              reg59 <= wire53;
              reg60 <= $unsigned(($unsigned((wire55[(1'h1):(1'h0)] ?
                  (wire33 != wire34) : {reg58})) < $signed({(wire53 & (8'hb0)),
                  reg57[(3'h6):(3'h5)]})));
              reg61 <= {{$signed($unsigned(((8'h9f) ? reg56 : wire53))),
                      (wire35 ^~ {(wire31 ? wire29 : wire53)})}};
              reg62 <= {wire31[(3'h5):(3'h5)],
                  ($unsigned($unsigned((wire34 ? wire31 : reg58))) ?
                      (~^reg59[(2'h3):(1'h1)]) : $unsigned($signed($unsigned((8'hb3)))))};
            end
          else
            begin
              reg58 <= $unsigned({(reg60[(1'h0):(1'h0)] <<< wire55[(1'h0):(1'h0)]),
                  (!$signed(wire32))});
              reg59 <= $unsigned((reg60[(1'h1):(1'h0)] ?
                  (&($signed(wire29) >> reg60)) : wire31[(1'h1):(1'h1)]));
              reg60 <= $signed(reg59[(3'h5):(2'h3)]);
              reg61 <= {(^~(8'h9c))};
              reg62 <= reg61;
            end
        end
      else
        begin
          if (wire55[(4'h8):(4'h8)])
            begin
              reg56 <= ($unsigned(((~|reg56[(1'h1):(1'h0)]) ~^ (^(~^reg56)))) ?
                  (~^(^$unsigned({wire30}))) : ((&($signed(wire30) <<< (~^wire31))) - (-wire30[(5'h11):(3'h6)])));
              reg57 <= wire29[(4'he):(4'hc)];
              reg58 <= $unsigned({{(reg57[(3'h5):(1'h0)] + $signed(reg61))},
                  wire29});
              reg59 <= wire34;
              reg60 <= reg57[(4'h9):(3'h4)];
            end
          else
            begin
              reg56 <= (reg57[(4'hc):(1'h0)] ?
                  $unsigned(reg60) : ($unsigned((|reg57)) ?
                      ((reg56 != (~reg58)) >= (wire35 ^ {wire31})) : wire35));
              reg57 <= $signed($signed(wire53));
              reg58 <= wire33[(2'h2):(1'h1)];
              reg59 <= (-$signed((7'h41)));
            end
          if (((~wire34) ?
              $unsigned((wire35 ?
                  ((^~(8'hb4)) ?
                      (-wire30) : (wire30 >>> reg60)) : $unsigned({wire53,
                      reg56}))) : (reg62 - (reg61[(4'hb):(4'ha)] ^~ ((+(8'hb6)) ?
                  reg57[(5'h12):(3'h4)] : (^~wire35))))))
            begin
              reg61 <= ($unsigned(reg58) >>> $unsigned($signed(reg60)));
              reg62 <= {wire29, reg57[(5'h12):(3'h6)]};
              reg63 <= $unsigned(wire31);
              reg64 <= ((^~$unsigned($unsigned($unsigned(wire33)))) + reg56);
            end
          else
            begin
              reg61 <= wire55[(3'h4):(2'h3)];
            end
          if ((reg64[(2'h3):(1'h1)] & {wire32[(3'h4):(2'h3)],
              ((~|(wire31 ? reg57 : wire55)) | (|$signed(reg57)))}))
            begin
              reg65 <= $signed((reg64 ?
                  (|($signed((8'ha7)) ?
                      $unsigned(wire32) : wire31[(1'h1):(1'h0)])) : (((!wire55) ?
                      $unsigned(reg62) : (+wire35)) + wire33[(1'h1):(1'h1)])));
              reg66 <= $unsigned($unsigned(((~|$unsigned(reg58)) | (&reg59[(2'h2):(1'h1)]))));
              reg67 <= wire55[(3'h6):(3'h6)];
              reg68 <= (+$signed(wire33[(3'h5):(3'h5)]));
              reg69 <= $signed((wire29 == $unsigned($signed((^~reg59)))));
            end
          else
            begin
              reg65 <= (^~wire33);
              reg66 <= wire33[(2'h2):(1'h1)];
              reg67 <= reg64;
            end
          if ($signed($signed((-$signed($unsigned(wire30))))))
            begin
              reg70 <= reg56[(1'h0):(1'h0)];
              reg71 <= (reg58 >>> wire35[(4'h8):(3'h6)]);
              reg72 <= $signed((^~(({reg57} ?
                  reg57 : (wire55 > reg61)) | (reg70[(4'hc):(1'h1)] ?
                  (reg71 ^ reg57) : (8'hab)))));
            end
          else
            begin
              reg70 <= $signed($unsigned(reg65[(3'h6):(3'h6)]));
              reg71 <= (($unsigned($unsigned((-wire31))) ?
                      $unsigned((+(reg67 ^ reg59))) : reg66[(3'h5):(1'h0)]) ?
                  reg60 : wire55);
              reg72 <= (-(((-(reg68 ? wire32 : reg68)) ?
                      $signed(((8'hbb) ?
                          reg64 : reg58)) : wire34[(2'h2):(1'h1)]) ?
                  $unsigned((((7'h40) | reg64) ?
                      $unsigned(wire55) : {wire53})) : wire29));
            end
          reg73 <= wire31;
        end
      reg74 <= $unsigned($unsigned((wire31 ? wire33 : reg66[(3'h5):(3'h5)])));
      if ((+$unsigned((!({reg62} + ((8'hbb) ? reg57 : (8'hbb)))))))
        begin
          reg75 <= $unsigned((~&(!reg63[(3'h6):(2'h3)])));
          reg76 <= reg70;
        end
      else
        begin
          reg75 <= ({$signed((~reg60))} ? wire35[(4'hf):(3'h6)] : (8'hb6));
          if (wire35[(4'hd):(4'hd)])
            begin
              reg76 <= reg70;
              reg77 <= $signed((|($signed(wire55[(2'h2):(1'h0)]) << (8'hab))));
              reg78 <= $signed(($unsigned($signed(reg65[(3'h6):(3'h5)])) ?
                  $signed(reg56) : reg61));
              reg79 <= $signed($unsigned((-reg65[(3'h4):(3'h4)])));
            end
          else
            begin
              reg76 <= (($signed(((reg76 ?
                      reg70 : reg78) ^~ (wire33 != wire35))) ?
                  (!{(reg68 <<< (8'hbe)),
                      ((8'hac) >= reg69)}) : reg57) >>> ({$signed($signed(wire32))} ?
                  $unsigned($signed((8'h9f))) : $unsigned($signed(wire31))));
              reg77 <= (reg57[(4'hf):(4'h9)] ? (-reg70) : reg62[(2'h3):(2'h3)]);
              reg78 <= reg61;
              reg79 <= {$signed(reg71[(1'h0):(1'h0)])};
              reg80 <= {(~^{(~^(reg56 - reg73))})};
            end
          reg81 <= {reg57, $signed(wire31)};
          reg82 <= (!{$signed($unsigned((8'hb1)))});
        end
    end
  assign wire83 = $signed(reg77[(4'hd):(4'h9)]);
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire11,
                 wire10,
                 wire9,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire9 = (wire8 * ({(8'had), (~^wire7)} < $unsigned($signed({wire7}))));
  assign wire10 = (~&wire7);
  assign wire11 = wire9;
  always
    @(posedge clk) begin
      reg12 <= $signed(((wire10 ? wire7 : ($signed(wire8) >>> $signed(wire7))) ?
          {(&wire11)} : ($unsigned($unsigned(wire8)) >> ($signed(wire8) ?
              (wire8 - wire10) : $unsigned((8'hb8))))));
      if (wire10)
        begin
          reg13 <= (^~wire8[(1'h1):(1'h0)]);
          reg14 <= $unsigned($unsigned((^{wire7[(1'h1):(1'h1)]})));
          reg15 <= wire8;
          if (((~|(wire7 != {(wire6 == (8'ha6))})) == (wire8 || $unsigned(((reg14 ?
              (8'hb1) : wire5) <<< (~^reg12))))))
            begin
              reg16 <= (reg14[(2'h2):(1'h0)] > (({(wire9 ? reg12 : (8'ha8))} ?
                      $signed((reg15 ? wire10 : wire7)) : (wire6 ?
                          $signed(wire6) : (-(8'hb8)))) ?
                  ($signed($signed(wire9)) ?
                      wire7 : ({wire5,
                          (8'hbb)} != (!wire11))) : wire9[(1'h1):(1'h0)]));
              reg17 <= wire10;
            end
          else
            begin
              reg16 <= (!$signed((8'ha5)));
              reg17 <= (^(&(reg14[(1'h0):(1'h0)] >> wire7[(2'h2):(1'h0)])));
              reg18 <= (&reg12);
            end
        end
      else
        begin
          reg13 <= reg14;
          reg14 <= $signed(reg13[(2'h2):(2'h2)]);
          reg15 <= reg16;
          reg16 <= wire5[(2'h3):(2'h3)];
        end
      reg19 <= $signed((reg15 ?
          (wire10[(1'h0):(1'h0)] | (~^((8'had) >> reg17))) : (wire11 >>> (&wire11[(5'h10):(4'hb)]))));
    end
  always
    @(posedge clk) begin
      reg20 <= $unsigned($unsigned(reg13[(2'h2):(2'h2)]));
      reg21 <= (wire8 ? wire9[(2'h3):(1'h0)] : wire6);
    end
  assign wire22 = (+$signed(((^~$signed(reg17)) ?
                      reg14[(4'hc):(4'ha)] : {(8'ha2), {wire11, wire5}})));
  assign wire23 = (((~|(((8'hb0) ? reg14 : reg12) < (reg14 >> reg12))) ?
                          $unsigned((+$signed(reg20))) : $unsigned($signed($signed((8'hab))))) ?
                      (^$signed($signed((reg12 ?
                          reg18 : reg13)))) : $signed((~^(^(^reg20)))));
  assign wire24 = wire7[(1'h0):(1'h0)];
  assign wire25 = (wire8 - {wire10});
endmodule

module module36
#(parameter param51 = ((((((8'h9f) | (8'h9c)) ? (7'h44) : ((8'ha9) << (8'hbb))) ? (~&(8'ha5)) : (!{(8'hb6), (8'ha9)})) << ({{(8'had)}, ((8'ha5) != (8'ha8))} ? (8'hb4) : ({(8'hb7), (8'ha1)} ? (^~(8'ha4)) : ((8'hb9) >>> (7'h44))))) >> (7'h43)), 
parameter param52 = (+(param51 ? (~((param51 ? param51 : param51) > (param51 ? param51 : param51))) : ((+(param51 != param51)) ~^ ((~|param51) & (param51 ? param51 : param51))))))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire41;
  input wire [(4'ha):(1'h0)] wire40;
  input wire [(4'h8):(1'h0)] wire39;
  input wire signed [(4'hd):(1'h0)] wire38;
  input wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 (1'h0)};
  assign wire42 = (+(wire39 ^~ $signed(($unsigned(wire38) || (^wire38)))));
  assign wire43 = wire42;
  assign wire44 = {(($signed($signed(wire37)) ?
                          wire38 : $unsigned($signed(wire40))) || $signed(wire41[(1'h0):(1'h0)])),
                      (((wire43 <= (wire41 & wire38)) - (wire43 ?
                          ((7'h42) != wire42) : {wire39, wire38})) << wire43)};
  assign wire45 = (|(~&(^~(~&(wire37 * wire39)))));
  assign wire46 = (wire41 != (^~$signed(($unsigned(wire42) <<< (^~wire44)))));
  assign wire47 = ((^~wire38[(4'h9):(4'h8)]) <= wire41[(4'h9):(3'h6)]);
  assign wire48 = ((-wire42) >>> ($signed($unsigned((~&wire38))) << $signed((+$unsigned(wire45)))));
  assign wire49 = wire41;
  assign wire50 = wire46[(3'h6):(1'h0)];
endmodule

module module113
#(parameter param145 = (~(((((8'hac) ? (8'h9d) : (7'h40)) * ((8'hab) ? (8'h9f) : (8'h9e))) | {{(8'hb9)}}) >= (!(((8'hb6) ? (8'hae) : (8'h9d)) ^ ((8'hb3) & (8'hbd)))))), 
parameter param146 = (~&param145))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire118;
  input wire [(2'h2):(1'h0)] wire117;
  input wire signed [(5'h11):(1'h0)] wire116;
  input wire signed [(2'h3):(1'h0)] wire115;
  input wire signed [(3'h7):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire144;
  wire signed [(4'h9):(1'h0)] wire143;
  wire signed [(4'hd):(1'h0)] wire142;
  wire signed [(3'h7):(1'h0)] wire141;
  wire [(5'h14):(1'h0)] wire140;
  wire signed [(2'h2):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire138;
  wire [(5'h10):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire125;
  wire signed [(5'h10):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire120;
  wire signed [(5'h14):(1'h0)] wire119;
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
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
                 (1'h0)};
  assign wire119 = $unsigned($signed($unsigned(($unsigned(wire116) ?
                       $unsigned((8'ha4)) : $signed(wire116)))));
  assign wire120 = wire119;
  assign wire121 = {wire116[(2'h3):(2'h3)]};
  assign wire122 = (wire115 ?
                       (8'hb3) : {$unsigned(({wire115, wire116} ^~ wire120))});
  assign wire123 = $signed((($signed((~&wire116)) ?
                       (wire116 ^~ $unsigned(wire116)) : $unsigned((wire116 ?
                           wire114 : wire121))) >>> ((~|$signed(wire115)) ~^ {((7'h44) ?
                           wire119 : (8'h9f))})));
  assign wire124 = ($unsigned(($unsigned((wire120 + wire115)) ?
                           ((wire115 >> wire121) ?
                               (~|(8'ha6)) : (~wire123)) : ($signed(wire117) ?
                               (-wire120) : (8'hb8)))) ?
                       (^$signed($unsigned(wire117[(1'h1):(1'h0)]))) : (+$signed((-$signed(wire114)))));
  assign wire125 = (((|(^~wire120[(3'h6):(3'h4)])) | (!$signed(wire114))) ?
                       (wire114 ? wire117 : wire121) : (^((~(wire114 ?
                           wire115 : wire120)) * $unsigned(wire124[(5'h10):(4'hf)]))));
  always
    @(posedge clk) begin
      if ($unsigned((8'haf)))
        begin
          reg126 <= {({(8'hb9)} ^ (&((~|wire121) * $signed((7'h40))))),
              (wire122[(1'h1):(1'h1)] || wire120)};
          reg127 <= ((~&$signed(($unsigned(wire118) ? wire120 : (~|(8'ha8))))) ?
              (~&wire117[(2'h2):(2'h2)]) : {((~&(~&wire114)) - ((+wire117) ^ (wire116 >>> wire118)))});
          reg128 <= wire117[(2'h2):(2'h2)];
        end
      else
        begin
          reg126 <= $signed(wire123[(3'h6):(3'h6)]);
        end
      reg129 <= $unsigned(wire115[(1'h0):(1'h0)]);
      if (($signed($unsigned($unsigned((~|wire125)))) <<< {{(^(wire116 ?
                  wire118 : reg127))},
          (reg127 ? $unsigned($unsigned(wire119)) : $signed((~|wire125)))}))
        begin
          reg130 <= $signed({$signed((~^reg129)),
              ($unsigned({(8'hac)}) ?
                  (&$unsigned(wire116)) : $signed(wire119[(5'h12):(1'h0)]))});
        end
      else
        begin
          reg130 <= {(wire118 << (wire124 ?
                  {wire125, wire119[(1'h1):(1'h0)]} : wire118[(3'h4):(3'h4)]))};
          reg131 <= wire123;
          if ((reg131[(3'h5):(1'h0)] >> (^{(~|wire123[(1'h0):(1'h0)])})))
            begin
              reg132 <= $unsigned($signed($signed(wire125)));
              reg133 <= $signed($signed((|wire125)));
            end
          else
            begin
              reg132 <= $signed((((7'h43) ?
                  $unsigned((^~(8'ha1))) : reg131) <<< (~^(!(|wire114)))));
              reg133 <= wire119;
              reg134 <= wire122;
              reg135 <= (-(!(~wire120)));
            end
        end
      reg136 <= (|(+reg131));
    end
  assign wire137 = (((~&reg136[(4'ha):(3'h7)]) << (wire125 ?
                           wire117 : ($signed(wire114) ?
                               (|wire122) : (^~wire118)))) ?
                       ($signed($signed((-reg129))) ~^ $signed({{wire114}})) : ((((-reg132) ?
                                   (~&(8'hae)) : wire117[(2'h2):(2'h2)]) ?
                               $unsigned($unsigned(wire124)) : {$signed(wire117)}) ?
                           $unsigned($unsigned($signed((8'hb4)))) : $signed(wire121)));
  assign wire138 = $unsigned($unsigned(($signed({wire123,
                       reg131}) ^ $signed((~^wire125)))));
  assign wire139 = (|$unsigned(wire120));
  assign wire140 = reg132;
  assign wire141 = $unsigned(($unsigned(wire121[(1'h0):(1'h0)]) && $signed(reg134)));
  assign wire142 = wire120[(3'h5):(2'h2)];
  assign wire143 = $unsigned(wire137);
  assign wire144 = (+wire143);
endmodule
