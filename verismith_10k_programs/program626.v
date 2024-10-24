module top
#(parameter param207 = (((~&((^~(8'hb2)) ? ((8'ha1) && (8'ha0)) : {(8'hb3), (8'hbd)})) ? ((8'hb7) ? (~&((8'hba) <<< (7'h43))) : {((8'ha9) + (8'hb2)), ((8'ha2) << (8'hb3))}) : {(~^(8'hab))}) ? ((8'ha4) ~^ {((~^(7'h42)) ^~ ((8'ha1) ? (8'hbc) : (8'haa)))}) : (^({((8'ha3) ? (8'hb5) : (8'h9d)), (&(8'ha7))} ? (&((8'hb7) ? (8'h9e) : (8'hb9))) : (((8'h9f) ? (8'had) : (8'ha3)) <= ((8'hae) && (8'ha8)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire205;
  wire signed [(4'hb):(1'h0)] wire203;
  wire [(4'ha):(1'h0)] wire202;
  wire signed [(2'h2):(1'h0)] wire201;
  wire [(5'h11):(1'h0)] wire200;
  wire signed [(4'he):(1'h0)] wire187;
  wire [(5'h15):(1'h0)] wire185;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire189;
  wire [(5'h10):(1'h0)] wire190;
  wire [(4'he):(1'h0)] wire191;
  wire signed [(5'h12):(1'h0)] wire192;
  wire signed [(5'h12):(1'h0)] wire193;
  wire signed [(3'h5):(1'h0)] wire194;
  wire signed [(3'h5):(1'h0)] wire195;
  wire [(5'h11):(1'h0)] wire196;
  wire signed [(3'h4):(1'h0)] wire197;
  wire [(3'h6):(1'h0)] wire198;
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  assign y = {wire205,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire187,
                 wire185,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 wire189,
                 wire190,
                 wire191,
                 wire192,
                 wire193,
                 wire194,
                 wire195,
                 wire196,
                 wire197,
                 wire198,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 (1'h0)};
  module4 #() modinst95 (wire94, clk, wire1, wire2, wire0, wire3);
  assign wire96 = (wire0 - $unsigned($signed(((|wire94) ?
                      (^~wire3) : (-wire3)))));
  assign wire97 = wire96;
  assign wire98 = ((|((wire97[(4'hc):(4'h9)] ?
                              (wire97 == wire94) : (wire2 ? wire94 : wire2)) ?
                          $signed(wire2) : $unsigned(((8'h9c) <<< wire1)))) ?
                      $signed((((^~wire0) ?
                          (wire97 ? wire2 : wire96) : ((8'hb4) ?
                              wire2 : wire97)) - (~&$signed(wire96)))) : $unsigned(wire94));
  always
    @(posedge clk) begin
      if ((-(!$unsigned((wire96[(3'h4):(2'h3)] ?
          (-wire94) : (wire3 >= wire98))))))
        begin
          reg99 <= $unsigned((wire94[(4'ha):(1'h0)] | (^wire2[(5'h11):(3'h4)])));
          reg100 <= (~wire94[(4'hb):(2'h3)]);
        end
      else
        begin
          reg99 <= (!$signed({reg99[(2'h2):(1'h1)],
              ($unsigned(reg99) == $unsigned(wire1))}));
          reg100 <= wire0;
          reg101 <= ($signed((~$signed(((8'ha9) < wire94)))) ^ wire94);
          if ((wire98[(3'h5):(3'h5)] ?
              {$unsigned(wire97[(4'h8):(2'h2)]),
                  (~&((-wire98) && $signed(reg100)))} : ($unsigned((wire1 < (7'h44))) ^~ (wire0 ?
                  (^(wire98 >> (8'haf))) : $signed(wire94[(4'ha):(1'h1)])))))
            begin
              reg102 <= ((8'h9e) ?
                  ((reg100 ?
                      (!(-wire98)) : $unsigned({reg101})) <<< (($signed(wire97) ?
                          $unsigned(wire96) : (~wire98)) ?
                      ($signed((8'hbf)) >> (reg101 ?
                          wire98 : reg100)) : (wire2[(5'h10):(4'h8)] ?
                          $unsigned(reg100) : ((8'hac) ?
                              wire0 : (8'ha3))))) : $signed((!wire0)));
            end
          else
            begin
              reg102 <= (7'h40);
              reg103 <= (8'hb9);
            end
          reg104 <= $signed($signed(wire3[(3'h6):(1'h1)]));
        end
      reg105 <= (8'ha8);
    end
  always
    @(posedge clk) begin
      reg106 <= {reg103[(3'h5):(3'h5)], $signed(reg102[(4'hb):(3'h4)])};
      reg107 <= (~&(wire1 ?
          (wire96 ^~ $unsigned(((8'hb4) || wire94))) : {(8'ha5)}));
      reg108 <= reg105[(1'h1):(1'h0)];
    end
  module109 #() modinst186 (wire185, clk, reg102, reg101, wire0, reg103, wire96);
  module122 #() modinst188 (.wire125(reg101), .wire126(wire3), .wire123(reg108), .clk(clk), .y(wire187), .wire124(reg106));
  assign wire189 = wire98;
  assign wire190 = $signed(reg108);
  assign wire191 = (wire94 ?
                       ({(+(8'hb6))} ?
                           reg99[(5'h11):(3'h6)] : wire2) : ((($unsigned(wire98) ?
                               (reg100 >> wire0) : (~^(8'hb9))) || wire2[(4'hd):(4'h8)]) ?
                           reg103[(3'h4):(1'h0)] : reg103[(3'h5):(2'h2)]));
  assign wire192 = ($signed((&wire1[(4'hf):(4'hc)])) * $signed((($signed(wire187) >>> $signed(wire191)) >>> $unsigned($unsigned((8'ha6))))));
  assign wire193 = (reg100[(4'hf):(4'hd)] ?
                       $signed(({$signed(reg108),
                           (reg102 ?
                               wire3 : (8'haa))} << $signed($signed(wire3)))) : wire3);
  assign wire194 = {reg100[(4'hb):(3'h6)]};
  assign wire195 = (~^$unsigned(wire97[(4'h9):(3'h7)]));
  assign wire196 = ($signed(reg103) ~^ $unsigned((($unsigned(wire193) << (reg107 ?
                       wire1 : (8'hbd))) && (^~reg100[(3'h5):(3'h5)]))));
  assign wire197 = ({(^~reg102[(5'h11):(3'h5)])} ?
                       wire185[(3'h5):(3'h4)] : wire98);
  module48 #() modinst199 (wire198, clk, wire191, wire193, wire195, reg102, reg105);
  assign wire200 = ((8'hb0) ?
                       (((!$unsigned(reg108)) * ((wire1 ? wire0 : reg99) ?
                               $signed(wire0) : wire97[(3'h4):(1'h0)])) ?
                           $unsigned(wire195) : ($signed({wire194}) ?
                               ($unsigned((8'hb4)) == reg104) : ((!wire196) & (reg106 ?
                                   wire187 : wire193)))) : ((reg103 ?
                               wire197[(1'h0):(1'h0)] : wire189) ?
                           wire191 : wire98[(4'hd):(3'h4)]));
  assign wire201 = wire0[(3'h6):(3'h4)];
  assign wire202 = (~^(~|$signed(wire94[(4'h8):(3'h7)])));
  module10 #() modinst204 (wire203, clk, wire202, reg99, wire2, reg100);
  module48 #() modinst206 (wire205, clk, reg108, wire3, wire194, wire198, wire190);
endmodule

module module109  (y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire114;
  input wire signed [(4'hb):(1'h0)] wire113;
  input wire signed [(3'h7):(1'h0)] wire112;
  input wire signed [(3'h7):(1'h0)] wire111;
  input wire [(2'h2):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire180;
  wire [(3'h5):(1'h0)] wire179;
  wire [(4'hd):(1'h0)] wire178;
  wire [(3'h7):(1'h0)] wire174;
  wire signed [(3'h7):(1'h0)] wire173;
  wire signed [(3'h7):(1'h0)] wire172;
  wire signed [(4'hb):(1'h0)] wire171;
  wire signed [(5'h12):(1'h0)] wire170;
  wire [(3'h5):(1'h0)] wire169;
  wire [(4'h9):(1'h0)] wire163;
  wire signed [(5'h14):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire118;
  wire signed [(4'h8):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  reg [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(3'h7):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg signed [(4'he):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire163,
                 wire121,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg177,
                 reg176,
                 reg175,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire115 = wire112;
  assign wire116 = wire115;
  assign wire117 = wire112;
  assign wire118 = wire114[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg119 <= $signed(($unsigned($signed($signed((8'hb8)))) ?
          $signed($unsigned((wire113 == wire117))) : ($unsigned($signed(wire111)) && (^~$signed(wire111)))));
      reg120 <= (($signed($unsigned(((7'h44) ? (7'h40) : wire112))) ?
          {(~^$unsigned(wire118))} : $unsigned((^~(wire118 - wire117)))) <= $signed(wire110[(1'h0):(1'h0)]));
    end
  assign wire121 = (|$unsigned($signed(((-wire114) * $signed((8'ha8))))));
  module122 #() modinst164 (.wire124(wire113), .clk(clk), .wire126(wire114), .wire123(wire115), .wire125(wire121), .y(wire163));
  always
    @(posedge clk) begin
      reg165 <= (wire115[(5'h12):(4'h8)] ?
          $unsigned(({(reg119 > wire121)} ?
              $unsigned(wire110) : wire112)) : (~&wire163[(4'h9):(3'h5)]));
      reg166 <= wire114;
      reg167 <= {$signed((wire116 ?
              ($signed((8'ha3)) <= $signed(wire118)) : wire113))};
      reg168 <= $signed(reg165[(3'h6):(2'h3)]);
    end
  assign wire169 = $unsigned({wire113[(2'h3):(2'h3)],
                       $signed(($signed(wire121) || (+reg167)))});
  assign wire170 = ((^~(wire115 ?
                           $signed((wire115 ?
                               reg166 : (8'hb5))) : $unsigned((reg165 + wire116)))) ?
                       (wire111[(1'h1):(1'h0)] ~^ (^~wire116)) : (8'hb8));
  assign wire171 = ((reg120 ?
                           ($signed(((8'h9d) ^~ wire169)) >= $signed((^wire110))) : ({wire163[(3'h7):(1'h1)]} ?
                               (^(^(7'h44))) : $signed({wire118, wire169}))) ?
                       $unsigned(((~&(wire121 ?
                           wire115 : (8'ha9))) && $unsigned((8'hbe)))) : wire121[(4'h9):(3'h5)]);
  assign wire172 = wire163[(1'h1):(1'h1)];
  assign wire173 = wire115;
  assign wire174 = wire171[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg175 <= (8'ha3);
      reg176 <= $signed($unsigned(wire110));
      reg177 <= (~|wire111[(1'h0):(1'h0)]);
    end
  assign wire178 = wire111[(3'h6):(2'h2)];
  assign wire179 = reg120[(4'h8):(3'h5)];
  assign wire180 = reg119;
  always
    @(posedge clk) begin
      if ($unsigned(((&$signed($unsigned(wire179))) + (((wire173 ?
                  wire111 : wire179) ?
              reg176[(2'h3):(2'h2)] : (wire110 & wire115)) ?
          $signed($signed(wire171)) : wire172[(3'h4):(2'h3)]))))
        begin
          reg181 <= ($signed(reg177) ~^ (!(wire117 << wire169[(1'h1):(1'h0)])));
        end
      else
        begin
          reg181 <= wire170;
          reg182 <= wire116[(5'h10):(4'hd)];
          reg183 <= (!$unsigned(wire118[(3'h6):(2'h3)]));
          reg184 <= wire172[(3'h6):(1'h0)];
        end
    end
endmodule

module module4
#(parameter param92 = {((((-(8'hb6)) <= ((8'hb7) | (8'h9f))) ? (-(8'h9d)) : (((7'h44) | (8'ha7)) ? ((8'had) >> (7'h44)) : ((8'hac) ? (8'ha2) : (8'ha2)))) ^ (!{((8'hab) ? (8'hb1) : (8'had)), ((8'h9c) != (8'hb8))})), (^{(~|((8'haf) | (8'hb1))), {((8'hb9) && (8'ha3))}})}, 
parameter param93 = ((!param92) ? ((({(8'hbf), param92} ? (param92 || (8'hbf)) : (&param92)) ? ((param92 <<< param92) && (param92 & param92)) : (~&{param92, param92})) >= param92) : (param92 >> {param92, {(param92 <<< param92)}})))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire5;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire90;
  assign y = {wire9,
                 wire29,
                 wire31,
                 wire32,
                 wire44,
                 wire46,
                 wire47,
                 wire90,
                 (1'h0)};
  assign wire9 = $signed((~|wire6[(4'hf):(2'h2)]));
  module10 #() modinst30 (wire29, clk, wire8, wire6, wire7, wire9);
  assign wire31 = ($signed(($unsigned($signed(wire29)) || $unsigned(wire7))) ?
                      $unsigned($unsigned((~|((8'haa) ?
                          wire7 : wire7)))) : ((((wire6 ? wire9 : wire8) ?
                          (~^wire29) : wire9) || $unsigned(((8'ha8) ?
                          wire6 : wire8))) + (((wire5 >>> wire7) ?
                          wire5[(2'h3):(1'h0)] : {wire7,
                              wire9}) == (wire5 ^ wire7))));
  assign wire32 = $unsigned(($unsigned((~&$signed((8'hbb)))) >>> (+wire7)));
  module33 #() modinst45 (wire44, clk, wire7, wire29, wire8, wire5);
  assign wire46 = $unsigned((((~^$unsigned(wire5)) != (8'hbd)) > $signed({wire8,
                      wire31[(3'h6):(2'h3)]})));
  assign wire47 = $signed((((wire29[(4'ha):(4'h8)] ?
                      (~^(8'h9f)) : wire32[(1'h1):(1'h1)]) > wire29) <= {{wire5,
                          $signed(wire32)}}));
  module48 #() modinst91 (.wire51(wire5), .wire50(wire8), .wire49(wire46), .clk(clk), .wire52(wire6), .wire53(wire29), .y(wire90));
endmodule

module module48
#(parameter param89 = {{((((8'hbc) ? (8'h9f) : (8'had)) ? ((8'ha1) ? (7'h43) : (8'ha6)) : {(8'h9c), (8'hb1)}) < ((8'ha2) | ((8'hb9) || (8'ha8))))}})
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire53;
  input wire [(2'h3):(1'h0)] wire52;
  input wire signed [(3'h5):(1'h0)] wire51;
  input wire [(3'h6):(1'h0)] wire50;
  input wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire69;
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire71,
                 wire69,
                 reg86,
                 reg85,
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
                 reg70,
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
                 reg55,
                 reg54,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire52 + $signed($unsigned((~|$unsigned(wire49))))))
        begin
          if ({$signed(wire52),
              {wire52,
                  ((&(wire49 >> wire49)) - {(wire52 == wire53),
                      $signed((8'hb2))})}})
            begin
              reg54 <= (((|$unsigned((!wire49))) ?
                      wire52[(2'h2):(1'h0)] : wire52[(1'h0):(1'h0)]) ?
                  wire50[(1'h0):(1'h0)] : (((wire49 ?
                              (7'h42) : (wire53 ^ wire51)) ?
                          wire53[(4'h8):(4'h8)] : wire51[(2'h3):(1'h0)]) ?
                      ($unsigned((wire50 >> (8'hb0))) && $signed(wire50)) : wire51[(2'h2):(1'h1)]));
              reg55 <= (~^($signed($signed($unsigned((7'h42)))) >> {wire51,
                  ($unsigned(wire50) ?
                      (-wire51) : (wire52 ? (8'haf) : wire51))}));
              reg56 <= wire53[(3'h7):(2'h3)];
              reg57 <= (reg54[(2'h3):(1'h1)] ?
                  $unsigned(reg55) : $signed(({$signed(reg56),
                          wire51[(1'h0):(1'h0)]} ?
                      $signed((wire52 ? wire52 : (8'ha6))) : wire53)));
            end
          else
            begin
              reg54 <= (!wire53);
              reg55 <= (((wire50 ?
                      ((-wire52) ~^ wire49) : ((wire49 & (8'hb7)) ^ wire49)) | (((!wire53) ?
                      ((8'ha2) ?
                          wire53 : wire53) : (~(8'ha0))) | $unsigned((+reg54)))) ?
                  (~^((~|$unsigned((8'ha3))) ~^ $unsigned($unsigned(reg57)))) : $signed($unsigned($unsigned((&(8'h9c))))));
              reg56 <= {$unsigned((reg54[(3'h7):(1'h0)] ?
                      $signed(wire49) : wire49))};
              reg57 <= (({wire52[(2'h2):(2'h2)]} ?
                      $unsigned(reg57[(1'h0):(1'h0)]) : (((reg54 ?
                                  wire52 : wire49) ?
                              (&reg57) : (reg57 ? (8'hab) : (8'ha1))) ?
                          reg54 : wire51)) ?
                  wire53 : wire51[(2'h3):(1'h0)]);
              reg58 <= wire52[(2'h3):(2'h3)];
            end
          reg59 <= $signed($unsigned((!reg54)));
          if (wire49)
            begin
              reg60 <= $unsigned(($signed($signed($unsigned((8'ha7)))) ?
                  reg56[(2'h3):(2'h2)] : {reg57[(2'h3):(1'h1)]}));
              reg61 <= wire50;
            end
          else
            begin
              reg60 <= wire52[(1'h0):(1'h0)];
              reg61 <= (!{(|(|$signed(reg55))),
                  (wire50[(2'h2):(1'h0)] - reg57[(2'h2):(1'h0)])});
            end
          if (({reg58[(5'h10):(4'hc)]} >> ($unsigned(((reg56 ?
              (8'ha3) : reg56) == wire51)) << {(&wire50)})))
            begin
              reg62 <= (&$signed(reg57));
              reg63 <= $signed(reg60[(1'h1):(1'h0)]);
              reg64 <= $unsigned((((~(reg62 - reg56)) ?
                  (&(wire50 ?
                      reg58 : reg58)) : $unsigned($unsigned(reg63))) >> (!wire53)));
              reg65 <= ((&(reg56 ?
                      $unsigned((reg63 ?
                          reg62 : reg64)) : $signed((reg64 * reg59)))) ?
                  $signed(reg58) : reg61);
              reg66 <= (8'h9c);
            end
          else
            begin
              reg62 <= reg63[(4'hb):(4'h8)];
              reg63 <= ((wire50 ?
                  $signed(((reg65 ? reg57 : wire53) ?
                      $unsigned(reg59) : $signed(reg66))) : $signed(((reg59 == wire51) ?
                      {(8'hbc)} : $unsigned(wire50)))) - $signed($signed(((reg58 ?
                  reg66 : reg61) >= (~|reg61)))));
            end
          reg67 <= (&(reg57 ^~ {((reg62 > wire52) ~^ {reg54, reg57}),
              ({reg56} == $signed((8'h9e)))}));
        end
      else
        begin
          if ((7'h42))
            begin
              reg54 <= wire49[(4'ha):(3'h5)];
              reg55 <= $unsigned(reg61);
              reg56 <= wire52;
            end
          else
            begin
              reg54 <= (~wire51);
              reg55 <= (~^{(reg65 <= wire51[(2'h2):(1'h0)]),
                  (|$signed(((7'h44) ? reg64 : reg56)))});
              reg56 <= $signed($signed($unsigned((8'ha9))));
            end
          if ((~^(reg58[(4'ha):(4'h9)] ?
              ($signed(reg66) ?
                  reg66 : (^$unsigned(reg57))) : $unsigned($signed(reg54[(4'hd):(4'h8)])))))
            begin
              reg57 <= $unsigned((~|($signed((reg56 ?
                  wire53 : (7'h42))) < ((8'ha9) * reg56))));
              reg58 <= (-$unsigned((~&{{reg56, reg63}})));
              reg59 <= ($unsigned($unsigned(wire52[(1'h1):(1'h1)])) > {reg66,
                  (wire52 <= wire51)});
            end
          else
            begin
              reg57 <= wire50;
              reg58 <= {((+(^(&reg66))) ?
                      $signed(($unsigned(reg55) ?
                          (reg67 ?
                              reg67 : reg59) : reg55[(3'h5):(2'h2)])) : $signed($signed(wire51[(2'h2):(2'h2)])))};
            end
          reg60 <= $signed(reg66[(4'hb):(4'hb)]);
          reg61 <= $unsigned(({(8'h9d),
              (8'had)} >> $signed(reg61[(3'h6):(1'h0)])));
          reg62 <= ((((+(reg57 ~^ reg65)) || $signed((reg62 ?
                  reg58 : reg54))) <<< $signed((reg63 ^ (reg64 << reg66)))) ?
              reg66[(3'h6):(2'h3)] : $unsigned($unsigned({(^reg56)})));
        end
      reg68 <= $unsigned(reg66);
    end
  assign wire69 = reg62;
  always
    @(posedge clk) begin
      reg70 <= ((-{reg61[(3'h5):(1'h1)]}) ?
          (|$signed(wire49)) : $signed(wire53));
    end
  assign wire71 = wire69[(4'ha):(3'h7)];
  always
    @(posedge clk) begin
      reg72 <= reg59[(4'hd):(3'h7)];
    end
  always
    @(posedge clk) begin
      reg73 <= ($unsigned((8'hae)) ?
          ($signed(reg62) ^~ $signed(((~^wire51) ?
              $signed(reg65) : $signed(wire51)))) : (!wire49[(4'h8):(2'h3)]));
      reg74 <= {($signed((~|$unsigned(reg59))) == wire51[(3'h5):(2'h3)])};
    end
  always
    @(posedge clk) begin
      if ($signed((wire52[(1'h0):(1'h0)] << (+$signed(reg57)))))
        begin
          reg75 <= $unsigned((reg61[(3'h6):(3'h6)] ?
              $signed($unsigned(wire51[(2'h3):(2'h2)])) : $signed(reg63)));
        end
      else
        begin
          reg75 <= ($signed((((+wire52) - reg72[(4'h8):(1'h1)]) ?
              $unsigned((reg57 ?
                  reg74 : reg70)) : reg67[(4'h9):(2'h3)])) > reg65[(3'h6):(3'h5)]);
          reg76 <= ({$signed({reg64[(4'he):(3'h6)]})} >>> reg67[(2'h3):(1'h0)]);
          reg77 <= $unsigned(reg61[(3'h5):(3'h4)]);
          reg78 <= ((-(^(8'haf))) ?
              reg73[(2'h2):(1'h0)] : ((wire53[(4'hd):(4'hb)] ?
                      $unsigned(reg59) : ($unsigned(wire71) ?
                          (~&reg57) : reg74)) ?
                  $unsigned(((reg59 ? wire51 : wire71) ?
                      (8'hbf) : (~|reg76))) : (reg63[(4'hf):(4'ha)] != $unsigned(wire50))));
          reg79 <= {(^~$signed($unsigned({reg76}))), reg64};
        end
      reg80 <= {$unsigned(reg67[(3'h7):(3'h4)]),
          (!($signed({wire71}) ?
              $signed((reg56 == reg63)) : ((reg74 + reg77) <<< (reg64 ?
                  reg67 : reg54))))};
      if ({(~|(($unsigned(reg57) & (^reg61)) ?
              ({reg57, reg62} ?
                  (reg79 <<< (8'hb9)) : (~|reg54)) : (|$unsigned(reg77))))})
        begin
          reg81 <= ({wire52[(1'h0):(1'h0)],
              (reg65 | reg77[(4'hb):(2'h2)])} >>> (8'ha0));
          reg82 <= reg78;
          reg83 <= $signed(reg81[(2'h2):(1'h1)]);
          reg84 <= wire69[(1'h0):(1'h0)];
          reg85 <= (8'ha6);
        end
      else
        begin
          reg81 <= $signed(reg59);
          reg82 <= (&$signed(reg84));
          if ($unsigned($signed($unsigned(((reg66 ?
              reg81 : (8'h9f)) <<< ((8'haa) ? reg57 : reg61))))))
            begin
              reg83 <= $unsigned((!{($unsigned(reg56) << wire71[(2'h3):(2'h3)])}));
              reg84 <= ((((((8'ha1) != (8'ha8)) > reg79) != reg57) ?
                      (^$unsigned(reg77[(4'he):(4'ha)])) : (!reg75[(4'h9):(3'h6)])) ?
                  reg59[(4'he):(3'h7)] : (7'h41));
            end
          else
            begin
              reg83 <= reg65[(3'h7):(1'h0)];
              reg84 <= $unsigned((reg74 ?
                  (((reg54 ? (8'had) : reg70) ? $signed((8'hb3)) : wire52) ?
                      reg61[(1'h1):(1'h0)] : $signed((wire69 - reg79))) : $signed((~&reg84[(1'h0):(1'h0)]))));
            end
          reg85 <= $signed(({reg54} ?
              reg72[(5'h10):(3'h7)] : $unsigned(reg68)));
        end
      reg86 <= reg70[(4'hd):(1'h0)];
    end
  assign wire87 = ($signed($unsigned((8'ha7))) ?
                      $signed($signed(reg82[(4'hd):(3'h7)])) : {(^($signed(reg86) ?
                              (reg68 ? (8'haa) : reg64) : (reg66 ?
                                  wire71 : reg68)))});
  assign wire88 = {$signed((8'haf)),
                      (reg70[(3'h5):(3'h5)] & ($signed($unsigned(wire87)) < ({reg73,
                          wire69} && reg63[(5'h12):(3'h4)])))};
endmodule

module module33
#(parameter param42 = (|((~|(7'h43)) ? (({(7'h41), (8'hbb)} * ((8'hb1) ? (8'hb0) : (8'hb7))) ? ((8'hab) ? (~^(8'hbd)) : (&(8'ha6))) : (^((8'hb8) ? (7'h40) : (8'hbc)))) : {(((8'hab) ? (8'hb0) : (8'hba)) <= ((8'hbb) ? (8'hb1) : (8'hb2))), (!{(8'ha3)})})), 
parameter param43 = ((7'h41) >>> {((~&{param42}) ? param42 : (param42 ? param42 : (param42 ^~ param42)))}))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire37;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire signed [(2'h2):(1'h0)] wire35;
  input wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  assign y = {wire41, wire40, wire39, wire38, (1'h0)};
  assign wire38 = ($signed($signed($signed(wire35[(2'h2):(1'h1)]))) ?
                      ({($unsigned(wire35) ^~ (wire36 ^~ wire35)), (8'hb1)} ?
                          $unsigned(($signed((8'hac)) > $unsigned(wire36))) : ($unsigned($unsigned(wire34)) <<< wire35[(2'h2):(1'h1)])) : wire37);
  assign wire39 = {$unsigned((wire35 ~^ $signed(wire37[(2'h2):(1'h1)]))),
                      $signed((8'hae))};
  assign wire40 = $signed($signed($signed(wire36)));
  assign wire41 = ($unsigned((-(8'hb7))) >> $unsigned($unsigned(wire36[(2'h2):(1'h0)])));
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire15;
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire15,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire15 = wire11[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if ($unsigned(((~|{wire11[(3'h6):(2'h3)]}) ?
          {$unsigned($signed(wire14))} : $unsigned(wire14))))
        begin
          reg16 <= (((^{(wire12 && wire14),
                  wire11[(3'h6):(2'h2)]}) + wire11[(3'h4):(1'h0)]) ?
              wire14 : wire11[(3'h7):(3'h7)]);
          reg17 <= ($unsigned(((-(wire11 > (8'hab))) <= {(^wire14),
                  (wire12 ? (8'ha2) : wire11)})) ?
              reg16[(5'h10):(4'hc)] : ($signed({(wire15 == wire12),
                  $unsigned(wire11)}) - (wire15 ?
                  ((wire15 | wire15) ?
                      wire15 : $unsigned(wire13)) : {$unsigned(wire12)})));
        end
      else
        begin
          reg16 <= wire12[(2'h2):(1'h1)];
        end
      reg18 <= $signed(((wire11[(2'h3):(2'h2)] || (8'hb8)) ?
          (^~$unsigned((reg16 == reg17))) : wire14[(1'h0):(1'h0)]));
      reg19 <= reg16[(2'h3):(2'h3)];
      reg20 <= ((~&(($signed(reg16) <<< reg16[(3'h7):(2'h3)]) || $signed($signed(wire11)))) ?
          $signed($signed(((reg16 ?
              reg18 : wire14) * (wire14 << (8'hb2))))) : (8'hae));
      reg21 <= (reg16[(4'h9):(3'h4)] ?
          ((+$unsigned((wire14 ?
              wire13 : reg19))) ^~ reg16[(5'h13):(3'h5)]) : (($unsigned((reg16 < wire13)) * $signed((&wire15))) ~^ (((wire14 >> wire14) <<< ((8'hb1) ^~ wire12)) << (&$unsigned(wire11)))));
    end
  assign wire22 = $unsigned({$signed(wire15[(4'h8):(3'h4)]),
                      $unsigned((reg19[(1'h1):(1'h1)] ?
                          $unsigned(wire12) : (wire15 >> reg16)))});
  assign wire23 = $signed($unsigned(($signed((+reg18)) >>> $signed(reg19[(1'h0):(1'h0)]))));
  assign wire24 = (&(^~(wire12 ?
                      ($signed((8'hab)) > $unsigned(wire11)) : $signed(((8'hbc) ?
                          reg17 : reg20)))));
  assign wire25 = reg19[(1'h1):(1'h1)];
  assign wire26 = wire23[(4'hb):(3'h6)];
  assign wire27 = reg21[(4'hb):(4'hb)];
  assign wire28 = wire12[(1'h1):(1'h0)];
endmodule

module module122
#(parameter param161 = ({{({(8'hb5), (8'hae)} << (~(8'h9c)))}} > (((((8'hbe) & (8'ha3)) ? ((8'hb0) ? (8'ha3) : (7'h43)) : (7'h41)) == (8'haf)) != ((((8'had) ? (8'ha2) : (8'hba)) ? ((7'h41) ? (8'hb4) : (8'ha0)) : ((8'hb2) ? (8'hb2) : (8'ha2))) >= {(|(7'h43)), (&(8'hb9))}))), 
parameter param162 = ((+(|((&param161) ? (param161 <= (8'hbe)) : (param161 ? (8'had) : param161)))) ? param161 : {(((8'ha3) ? ((7'h44) != param161) : (+param161)) ^~ param161), (param161 ? param161 : ({param161, param161} ? (param161 || param161) : (param161 < param161)))}))
(y, clk, wire126, wire125, wire124, wire123);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire126;
  input wire signed [(4'hc):(1'h0)] wire125;
  input wire signed [(4'hb):(1'h0)] wire124;
  input wire signed [(5'h11):(1'h0)] wire123;
  wire [(3'h6):(1'h0)] wire160;
  wire signed [(4'hb):(1'h0)] wire159;
  wire signed [(4'he):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  wire signed [(4'h9):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire140;
  wire [(5'h11):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire137;
  wire signed [(4'h8):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire134;
  wire [(3'h7):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire130;
  wire [(4'h8):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire127;
  reg signed [(2'h3):(1'h0)] reg158 = (1'h0);
  reg [(5'h14):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg [(4'hb):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
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
                 wire127,
                 reg158,
                 reg157,
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
                 (1'h0)};
  assign wire127 = (wire124 ?
                       wire126[(1'h0):(1'h0)] : {(~&((wire123 ?
                                   (8'hb1) : wire124) ?
                               wire124 : wire123))});
  assign wire128 = wire123;
  assign wire129 = ($unsigned(wire128[(1'h1):(1'h0)]) >>> $signed(wire123[(4'h8):(1'h1)]));
  assign wire130 = wire124;
  assign wire131 = wire130;
  assign wire132 = wire124;
  assign wire133 = wire131;
  assign wire134 = (wire133[(2'h3):(1'h1)] | $signed($signed(($signed(wire128) ?
                       ((8'ha2) <= wire130) : $signed(wire133)))));
  assign wire135 = wire133;
  assign wire136 = wire127[(3'h5):(2'h3)];
  assign wire137 = $unsigned((~^((~^wire132) ?
                       ({(8'h9f)} ^~ (&wire127)) : $unsigned((wire123 | wire130)))));
  assign wire138 = ($signed(((&$signed((8'ha5))) ?
                       wire124[(4'ha):(3'h7)] : $signed((wire132 <= wire135)))) <<< $signed({wire124}));
  assign wire139 = {wire123[(3'h5):(2'h2)]};
  assign wire140 = $signed(($signed((~{wire131})) ?
                       {((8'hac) ?
                               (~^wire129) : (wire131 ?
                                   wire132 : wire136))} : $signed(($unsigned(wire129) ?
                           wire136 : $unsigned(wire131)))));
  assign wire141 = wire131[(2'h2):(2'h2)];
  assign wire142 = (wire126 ?
                       (~|wire131) : (~|{(!$signed((8'hb8))),
                           wire131[(3'h4):(2'h3)]}));
  assign wire143 = wire128;
  assign wire144 = {(!($unsigned(wire130) ? (7'h44) : $unsigned((|wire132))))};
  always
    @(posedge clk) begin
      if (($unsigned($unsigned((~|(+wire127)))) >>> (wire129 * wire142)))
        begin
          reg145 <= ($unsigned($unsigned($unsigned(wire129))) ?
              (!(wire136[(3'h7):(3'h5)] - (8'hb9))) : wire127[(4'he):(4'he)]);
          if (wire127[(5'h10):(3'h6)])
            begin
              reg146 <= {(8'h9d), (8'ha2)};
              reg147 <= {$signed(($signed({wire142}) ?
                      $unsigned(wire133) : $signed($signed((8'ha8)))))};
              reg148 <= {((^(((8'h9c) ^ wire131) >>> $signed(wire132))) ?
                      wire125[(3'h6):(2'h3)] : wire140)};
            end
          else
            begin
              reg146 <= $unsigned((wire135 >>> ((&wire134[(3'h5):(1'h1)]) ?
                  wire128 : (wire135[(1'h1):(1'h0)] ?
                      reg148 : (wire127 ? wire126 : wire125)))));
              reg147 <= wire142;
              reg148 <= $signed((~^$unsigned((wire131 <<< $signed((8'hb5))))));
              reg149 <= $signed((|$signed(((~^(8'ha1)) ?
                  $signed((8'ha0)) : wire126))));
            end
          reg150 <= (|(~$unsigned(wire132[(3'h5):(3'h5)])));
        end
      else
        begin
          reg145 <= (!reg145[(4'ha):(2'h3)]);
          reg146 <= wire135[(3'h4):(2'h3)];
          reg147 <= $signed(($unsigned(({wire139, wire134} ^~ (8'haf))) ?
              ((wire129 ^~ (wire129 ? wire138 : wire127)) ?
                  (reg149[(1'h1):(1'h0)] ?
                      $unsigned(wire125) : (+wire143)) : {$signed(reg146),
                      (wire141 ?
                          wire131 : wire144)}) : $unsigned(wire124[(4'h8):(2'h3)])));
        end
      reg151 <= (reg148[(1'h0):(1'h0)] > $unsigned({($unsigned(wire144) && (|wire140)),
          wire139[(3'h7):(1'h0)]}));
      reg152 <= (|{(($signed(wire125) && (reg146 + wire123)) - ((~reg150) >> wire127)),
          $unsigned((^~((7'h44) && reg151)))});
      reg153 <= (wire136[(3'h4):(3'h4)] && (($signed(wire135[(4'ha):(1'h1)]) ?
              (~&$unsigned(reg150)) : reg147) ?
          (8'h9c) : ($unsigned((+wire135)) ^ (reg146 ~^ wire133[(3'h5):(1'h0)]))));
      if (reg147)
        begin
          reg154 <= wire143[(4'hd):(1'h0)];
          reg155 <= {$signed(reg154[(4'hc):(2'h2)])};
          reg156 <= $unsigned((({(wire136 ? (8'hb4) : wire140)} ?
                  $signed($unsigned(wire144)) : ($signed(reg153) << $signed(wire137))) ?
              $signed($unsigned(reg150)) : wire143));
          reg157 <= ({($unsigned(((8'haf) ? wire128 : (8'hae))) ?
                      reg146 : ((wire140 && reg147) ?
                          (reg146 ? wire143 : reg152) : (wire124 & wire131)))} ?
              reg150 : wire135[(3'h7):(3'h4)]);
          reg158 <= $unsigned(wire131[(2'h3):(2'h2)]);
        end
      else
        begin
          reg154 <= (((($signed(reg153) ? {reg156, wire132} : wire141) ?
                  (~^$signed(wire124)) : (&wire125[(4'ha):(3'h7)])) ^ (!$unsigned((reg151 - (8'ha5))))) ?
              ($unsigned((wire123[(1'h1):(1'h0)] ?
                  {(8'hbb),
                      reg152} : $signed(reg145))) <<< $unsigned($unsigned(wire123[(3'h6):(3'h5)]))) : $signed($signed($unsigned((reg158 * (8'hb8))))));
          reg155 <= wire128[(1'h1):(1'h1)];
        end
    end
  assign wire159 = (($signed(($signed(wire143) ?
                           (8'ha3) : ((8'hb2) ? wire134 : reg150))) ?
                       wire133[(1'h0):(1'h0)] : {$unsigned((reg157 ?
                               wire137 : wire131)),
                           ((wire125 ?
                               reg149 : wire123) >>> wire131[(1'h0):(1'h0)])}) >= reg148);
  assign wire160 = (~(wire127[(3'h7):(2'h3)] ?
                       wire159 : $signed(wire159[(3'h6):(1'h1)])));
endmodule
