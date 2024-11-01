module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire186;
  wire [(4'hb):(1'h0)] wire185;
  wire [(5'h12):(1'h0)] wire184;
  wire [(3'h4):(1'h0)] wire182;
  wire [(5'h10):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire105;
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire182,
                 wire108,
                 wire107,
                 wire79,
                 wire5,
                 wire82,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire105,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg81,
                 reg109,
                 (1'h0)};
  assign wire5 = wire3[(4'h9):(4'h8)];
  always
    @(posedge clk) begin
      if (((^($unsigned(wire4) ?
              wire4 : ($signed(wire3) ? (-wire3) : (wire1 != wire4)))) ?
          {wire4} : (^(wire2 ?
              $signed(wire3) : ((8'hbb) ? wire1 : $signed(wire5))))))
        begin
          reg6 <= $signed($signed(wire5[(3'h6):(3'h4)]));
          if ((-((($unsigned(wire3) ?
                  (wire2 ^~ (8'h9c)) : wire2[(4'h8):(2'h2)]) ?
              $signed($signed(wire2)) : $signed((wire1 ?
                  wire4 : wire1))) <<< wire0[(2'h2):(2'h2)])))
            begin
              reg7 <= $unsigned(wire3[(4'h8):(3'h5)]);
              reg8 <= ((~&(~|{$signed((8'h9c)), $signed(wire2)})) ?
                  ($unsigned((wire1 >>> (wire3 <= wire1))) ?
                      (((^~wire5) ? wire1 : (reg7 << wire4)) ?
                          $signed($unsigned(wire2)) : (reg6 && (wire3 >> (8'hae)))) : ($signed(wire2[(3'h4):(1'h1)]) ^ $unsigned(wire1[(1'h0):(1'h0)]))) : (^~($signed((8'had)) & wire0[(2'h2):(1'h0)])));
            end
          else
            begin
              reg7 <= $unsigned($unsigned(wire1));
              reg8 <= $signed(wire3);
              reg9 <= (^wire1);
            end
          if (wire0)
            begin
              reg10 <= ((reg9[(4'ha):(3'h5)] ?
                      ((reg6[(2'h2):(1'h1)] | (reg8 > wire0)) ?
                          {$signed(reg8),
                              {(8'hb0)}} : $signed($unsigned(wire3))) : (reg9 ?
                          (~|wire1[(4'hb):(2'h2)]) : ((reg8 ? wire4 : reg9) ?
                              (reg9 ?
                                  wire2 : (8'hb2)) : reg8[(4'hc):(4'ha)]))) ?
                  (+(wire5[(2'h3):(1'h1)] ?
                      (wire4 >> $unsigned(reg6)) : ($signed(wire5) || (~(8'h9f))))) : reg8);
              reg11 <= $unsigned(((~|(~|{wire1, wire2})) != ({(reg9 ?
                          (8'hb3) : (8'hb4))} ?
                  reg8 : ($signed((8'h9c)) | (~wire0)))));
              reg12 <= (reg6 << (8'hb2));
            end
          else
            begin
              reg10 <= $signed(($unsigned($signed($signed((8'had)))) == (reg7[(1'h1):(1'h1)] ?
                  (^~$signed((8'ha6))) : {$unsigned(reg11)})));
              reg11 <= ($unsigned((~^((wire2 || wire3) ?
                  $signed((8'ha3)) : reg6[(3'h5):(3'h5)]))) ~^ (~|$unsigned(($unsigned(reg10) >> $signed((8'hbd))))));
              reg12 <= $signed($signed($unsigned(wire4[(3'h6):(2'h3)])));
            end
        end
      else
        begin
          reg6 <= $unsigned(wire5[(2'h2):(2'h2)]);
          reg7 <= reg11;
          if (({reg10,
                  ($signed(reg8[(4'ha):(2'h3)]) >> ((wire4 ? wire5 : wire0) ?
                      {(8'hb7)} : wire4[(4'h8):(3'h6)]))} ?
              reg11[(2'h2):(1'h1)] : $unsigned($unsigned(wire4))))
            begin
              reg8 <= $unsigned(wire0[(3'h4):(1'h0)]);
              reg9 <= (wire5 ?
                  ($signed(({wire4, wire1} ^ wire2[(1'h1):(1'h0)])) ?
                      reg6[(4'hb):(4'ha)] : ({(reg6 >>> reg7),
                          wire0[(2'h3):(2'h3)]} && (&(^wire3)))) : $signed(reg8));
              reg10 <= ($unsigned(reg6) << reg11[(1'h0):(1'h0)]);
              reg11 <= ($unsigned((~|((reg7 >= wire5) ?
                  wire2[(4'h8):(4'h8)] : {reg12}))) | $signed($signed($signed(wire1))));
            end
          else
            begin
              reg8 <= (reg9[(1'h0):(1'h0)] < $signed((wire5[(4'h9):(3'h5)] ?
                  (~^(reg10 ? reg12 : (8'hbf))) : (^(8'hab)))));
              reg9 <= (8'hb8);
              reg10 <= ($unsigned($signed(reg12[(3'h4):(1'h0)])) ^ $unsigned($unsigned($unsigned((~^wire3)))));
              reg11 <= (($unsigned(reg10[(3'h5):(3'h4)]) ?
                      wire0[(1'h0):(1'h0)] : $signed($unsigned((wire4 != wire0)))) ?
                  (|((8'ha6) ?
                      wire1[(1'h1):(1'h1)] : ((wire3 ?
                          wire2 : reg8) < (reg6 ^ reg6)))) : reg9[(3'h4):(3'h4)]);
            end
          reg12 <= (-wire2[(3'h7):(2'h3)]);
          reg13 <= (~|(8'haa));
        end
      reg14 <= reg8[(4'hc):(1'h0)];
    end
  module15 #() modinst80 (wire79, clk, wire2, reg14, wire1, reg7, wire5);
  always
    @(posedge clk) begin
      reg81 <= wire3[(1'h0):(1'h0)];
    end
  assign wire82 = (8'hac);
  assign wire83 = $unsigned($signed((-reg7[(3'h5):(1'h1)])));
  assign wire84 = wire79;
  assign wire85 = (|(8'hb0));
  assign wire86 = wire85[(1'h0):(1'h0)];
  assign wire87 = $unsigned($unsigned($unsigned({(reg9 && (7'h42)),
                      (+(8'ha9))})));
  module88 #() modinst106 (wire105, clk, wire3, wire5, reg13, wire79, reg6);
  assign wire107 = {$signed(wire85[(4'h8):(4'h8)]),
                       (|((wire2 != (8'hbb)) ? reg6 : wire87[(2'h3):(1'h1)]))};
  assign wire108 = ({(!$signed((reg13 ? reg6 : wire5))),
                       wire82[(3'h5):(2'h3)]} >= (^~$signed({$signed(reg12),
                       {(8'had)}})));
  always
    @(posedge clk) begin
      reg109 <= ((|$signed((wire4 && wire3))) - wire83[(4'hc):(1'h0)]);
    end
  module110 #() modinst183 (wire182, clk, wire1, wire3, reg13, wire0, wire107);
  assign wire184 = wire1[(5'h10):(1'h0)];
  assign wire185 = reg8[(4'hb):(2'h2)];
  assign wire186 = $signed(wire84);
endmodule

module module110
#(parameter param181 = (({(((8'hac) + (7'h44)) >>> {(8'hb3), (8'hb7)})} ? ({((8'ha8) < (8'haf))} << ({(8'hac)} && (-(8'hb6)))) : {({(7'h44)} ? (|(8'hb7)) : ((8'hbe) == (8'hb4))), (((8'ha7) || (8'hab)) || {(8'ha5)})}) ? ({(((7'h43) ? (8'hb4) : (8'h9e)) <<< {(8'hb5), (7'h42)}), (((8'hb8) | (8'ha2)) ^~ ((8'hb9) == (8'hbb)))} ? (8'ha7) : (({(8'haa)} == ((8'h9d) >>> (8'ha4))) <<< (~((8'ha9) ? (8'hae) : (8'hbc))))) : (((((8'h9d) ^ (8'ha9)) ? ((8'haf) | (7'h43)) : (-(8'ha7))) <= (8'ha6)) ? (((-(8'hb5)) && {(8'h9d), (8'haa)}) & {((8'hbe) ? (8'hb9) : (8'hb1)), ((8'ha9) ? (8'ha6) : (8'hb0))}) : (^(((8'hb7) && (8'ha3)) ? {(8'haf), (8'hb1)} : ((8'h9e) ? (8'h9c) : (8'ha7)))))))
(y, clk, wire111, wire112, wire113, wire114, wire115);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire111;
  input wire signed [(5'h10):(1'h0)] wire112;
  input wire signed [(5'h15):(1'h0)] wire113;
  input wire [(4'hf):(1'h0)] wire114;
  input wire signed [(5'h15):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire175;
  wire [(4'hf):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire118;
  wire signed [(5'h11):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire173;
  reg [(5'h12):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(5'h10):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg176 = (1'h0);
  assign y = {wire175,
                 wire116,
                 wire117,
                 wire118,
                 wire119,
                 wire173,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 (1'h0)};
  assign wire116 = ($unsigned((^~($unsigned(wire113) <<< (wire112 ?
                           (8'hb2) : wire114)))) ?
                       (wire112[(1'h1):(1'h0)] && ((&$signed(wire113)) ?
                           wire114 : wire111)) : wire111[(4'h9):(1'h1)]);
  assign wire117 = wire115[(4'h8):(4'h8)];
  assign wire118 = wire112[(1'h0):(1'h0)];
  assign wire119 = {({{wire112[(1'h0):(1'h0)]},
                               $unsigned(wire115[(5'h10):(1'h0)])} ?
                           wire116[(4'h8):(2'h2)] : $unsigned((!(+wire111)))),
                       (^~(~^($unsigned(wire117) ?
                           $unsigned(wire116) : wire111[(4'h8):(3'h5)])))};
  module120 #() modinst174 (wire173, clk, wire115, wire113, wire112, wire114, wire118);
  assign wire175 = ((wire111[(4'ha):(2'h3)] > {$signed(wire115[(4'h9):(3'h6)])}) >= wire111);
  always
    @(posedge clk) begin
      if ((^~$signed(($unsigned(wire111[(1'h1):(1'h1)]) ?
          $unsigned(wire113) : wire115[(5'h14):(3'h5)]))))
        begin
          reg176 <= (wire175[(3'h5):(1'h0)] ?
              $signed($signed({wire111[(4'h8):(3'h4)]})) : ((wire118[(5'h14):(5'h13)] ?
                  ($signed(wire117) ?
                      (wire118 + wire116) : $unsigned(wire111)) : $signed((wire119 - wire118))) <= wire116));
          reg177 <= wire175[(2'h2):(1'h0)];
          reg178 <= $signed(((~^(8'hb2)) & (!$unsigned(wire116))));
          reg179 <= (8'hb1);
          reg180 <= (wire115[(4'he):(4'hb)] ?
              (|$unsigned(wire111[(4'hb):(2'h2)])) : ($unsigned($signed((reg177 <<< reg176))) >>> ($signed($unsigned(reg178)) ?
                  ($signed((8'hb2)) ~^ reg178) : $signed((wire112 ?
                      wire119 : reg179)))));
        end
      else
        begin
          reg176 <= (7'h43);
        end
    end
endmodule

module module88
#(parameter param104 = (!(({((8'hb0) ^ (8'ha1))} ? (8'hab) : (((8'hbd) + (7'h40)) && (8'hb9))) ^ (!({(8'hb9), (7'h44)} ? {(8'haf), (8'hb2)} : (+(8'ha7)))))))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire93;
  input wire signed [(2'h3):(1'h0)] wire92;
  input wire signed [(5'h12):(1'h0)] wire91;
  input wire signed [(2'h3):(1'h0)] wire90;
  input wire [(4'hc):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire signed [(5'h12):(1'h0)] wire94;
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg99,
                 (1'h0)};
  assign wire94 = $unsigned((($unsigned((wire91 - wire92)) >= $signed($signed(wire90))) ?
                      (8'hb2) : $unsigned($unsigned($unsigned((8'hab))))));
  assign wire95 = ($signed(wire93[(4'hd):(4'hd)]) * $signed($unsigned((wire94 ~^ $signed((8'h9c))))));
  assign wire96 = wire92;
  assign wire97 = (^($signed(($unsigned(wire90) ? {wire89} : (-(8'hb5)))) ?
                      (((wire92 ? (8'hab) : wire92) << wire90[(2'h3):(2'h2)]) ?
                          $signed(wire94) : $signed(wire91)) : (~&($signed(wire95) ?
                          {wire93, wire96} : (wire91 || wire89)))));
  assign wire98 = (+$unsigned($unsigned($signed((wire92 && wire90)))));
  always
    @(posedge clk) begin
      reg99 <= (&(~|(~^((wire93 * wire89) ?
          (^wire93) : wire94[(4'hf):(4'hf)]))));
    end
  assign wire100 = $signed(((wire91[(1'h0):(1'h0)] >> (8'hb6)) ?
                       $unsigned((!((8'ha1) <= wire96))) : wire89[(3'h4):(3'h4)]));
  assign wire101 = $signed((($signed(wire97[(1'h0):(1'h0)]) != reg99[(1'h0):(1'h0)]) ?
                       wire92[(2'h2):(1'h1)] : {wire95[(3'h5):(2'h2)],
                           {wire90, wire91[(4'hd):(1'h1)]}}));
  assign wire102 = ((&{((8'h9e) <<< (~&wire90)),
                       $unsigned((wire90 ?
                           wire92 : wire100))}) - $unsigned(((wire97[(2'h2):(1'h1)] ?
                       $unsigned(wire89) : (-wire97)) || $unsigned($signed(wire92)))));
  assign wire103 = wire100[(4'hf):(4'he)];
endmodule

module module15
#(parameter param77 = ((((((8'ha7) ^~ (8'h9d)) ^~ ((8'h9c) >> (8'had))) ? (8'hb0) : ((^(8'hbc)) * ((8'hbe) <= (8'hb9)))) != ((((8'hb7) ? (8'hbd) : (8'ha4)) >>> (!(8'ha3))) & ((8'hb3) ? {(8'hbe)} : ((8'hac) ? (8'hb3) : (8'hb0))))) - (((((8'hb5) ^ (7'h40)) * ((8'hb0) ? (8'ha7) : (8'hbe))) >= (^~(+(8'h9d)))) ? (+(8'hb2)) : ((((8'hb7) ? (7'h41) : (8'ha3)) <<< ((8'hab) && (8'hb7))) ? ({(8'ha2)} ? {(8'ha2), (8'ha4)} : {(7'h41)}) : (^(~^(8'hae)))))), 
parameter param78 = ((-({(param77 != (8'ha7))} ? {(~param77)} : param77)) >>> ({param77} ? (param77 ? param77 : (((8'hb9) & param77) ? param77 : {param77, param77})) : (~|(~|param77)))))
(y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire [(3'h4):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire63;
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire65,
                 wire21,
                 wire22,
                 wire40,
                 wire41,
                 wire42,
                 wire63,
                 reg72,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 (1'h0)};
  assign wire21 = wire17[(4'hb):(2'h3)];
  assign wire22 = (($unsigned({(wire18 ? wire21 : wire18), (+wire16)}) ?
                          (wire21[(1'h1):(1'h0)] * wire21[(2'h3):(2'h2)]) : wire17) ?
                      $signed(wire17[(3'h5):(2'h2)]) : wire16);
  always
    @(posedge clk) begin
      if ({$unsigned($signed({(~^wire19)}))})
        begin
          reg23 <= {$signed((+$unsigned(wire20[(2'h3):(1'h0)]))),
              (wire16[(1'h0):(1'h0)] & {((!wire16) + (wire19 ?
                      wire18 : wire19)),
                  wire17})};
          reg24 <= $unsigned({(-$unsigned($signed(wire19)))});
        end
      else
        begin
          reg23 <= wire18;
          reg24 <= wire20;
          reg25 <= (~^wire19[(3'h6):(3'h5)]);
        end
      if ($unsigned({(-wire22[(4'h9):(3'h5)]),
          {((reg23 ? (8'haa) : wire19) ?
                  $signed((8'hb5)) : wire18[(3'h5):(1'h1)]),
              {(wire20 >= wire20), (wire20 ? reg25 : wire18)}}}))
        begin
          if (((wire16 ? wire21[(3'h4):(2'h2)] : $signed(reg25)) ?
              (((7'h42) ?
                  $signed((wire21 ?
                      reg25 : wire22)) : wire18[(1'h0):(1'h0)]) && ($signed(((8'ha8) + wire17)) ?
                  reg24 : (~|(wire20 ^ wire16)))) : (wire19[(3'h7):(3'h4)] ~^ (-(~reg25[(3'h6):(3'h5)])))))
            begin
              reg26 <= (^~{(((reg23 <= wire16) ?
                      $signed(wire16) : wire20[(3'h4):(1'h0)]) && ($unsigned(wire16) >> (reg24 ?
                      reg23 : reg25))),
                  {(~|(wire16 ^~ reg24))}});
              reg27 <= $signed((8'haa));
              reg28 <= ($signed(wire18) <= ((~(~{wire20, reg24})) ?
                  $signed(reg26[(4'hc):(4'h9)]) : $unsigned((8'hb9))));
              reg29 <= reg28[(2'h3):(2'h3)];
            end
          else
            begin
              reg26 <= wire21;
              reg27 <= reg27;
              reg28 <= $signed((wire19[(2'h2):(1'h0)] ?
                  $unsigned($unsigned(reg25[(4'h9):(3'h7)])) : (~wire16)));
              reg29 <= (($unsigned(reg26[(2'h3):(1'h1)]) ?
                      $signed(((~^wire21) ?
                          {wire18,
                              wire17} : (reg24 || reg29))) : {(~&$signed(wire17))}) ?
                  (8'hb9) : (&{($signed((8'hb4)) < (!wire19)),
                      (wire21[(2'h3):(2'h3)] ^~ reg26)}));
              reg30 <= wire18;
            end
        end
      else
        begin
          reg26 <= $signed((wire16 * ($signed((8'hb5)) == $signed((wire22 ?
              reg29 : wire18)))));
          reg27 <= ((+(reg28 != (+reg25[(3'h4):(1'h0)]))) <= reg25[(4'hb):(2'h2)]);
          if ($unsigned($unsigned((|((wire19 ^~ wire18) ?
              (wire20 || wire20) : $unsigned(reg23))))))
            begin
              reg28 <= (7'h42);
              reg29 <= wire16[(2'h2):(1'h1)];
            end
          else
            begin
              reg28 <= (((~|$unsigned($signed(wire20))) ?
                      reg29 : $unsigned($unsigned(reg30))) ?
                  (~{($signed(wire16) ?
                          (wire18 ? (8'ha3) : wire18) : $signed(wire22)),
                      (~&$unsigned(reg26))}) : $unsigned($unsigned({(wire21 ?
                          reg25 : wire21)})));
              reg29 <= ((($unsigned({wire22, wire21}) ?
                          ((~reg25) ?
                              $signed(wire16) : (wire19 ^ (8'hb3))) : reg28) ?
                      reg27[(2'h3):(2'h3)] : {((~wire18) >= (reg30 ?
                              reg23 : wire18)),
                          (wire17 || ((7'h43) ? (8'hb2) : reg27))}) ?
                  ($unsigned($signed($signed(wire18))) * $unsigned(($unsigned(reg27) == {wire19,
                      reg26}))) : $signed(wire16[(2'h3):(1'h1)]));
              reg30 <= $unsigned($unsigned(reg29[(4'ha):(3'h6)]));
            end
        end
      if (reg28)
        begin
          if (wire18)
            begin
              reg31 <= (((^$unsigned(reg26)) << reg23[(4'hd):(2'h2)]) ?
                  reg26 : reg24[(1'h1):(1'h0)]);
              reg32 <= (reg25[(4'h9):(3'h4)] != $signed(reg29[(4'h8):(3'h6)]));
              reg33 <= $signed(($unsigned((((8'ha1) == reg27) * reg32[(3'h4):(1'h1)])) & $unsigned(((wire18 - (7'h43)) + (wire17 == reg32)))));
              reg34 <= $signed((wire16 * $signed($signed($unsigned((8'hb9))))));
              reg35 <= reg31;
            end
          else
            begin
              reg31 <= (wire22 ? reg25 : wire16[(2'h2):(2'h2)]);
              reg32 <= (&$signed((^~$signed((!wire20)))));
              reg33 <= $unsigned($signed((wire20 ?
                  $unsigned((reg26 ? reg33 : wire22)) : $unsigned((!reg35)))));
              reg34 <= (reg31 ^ reg33[(3'h4):(2'h2)]);
              reg35 <= (~|wire16[(2'h3):(2'h3)]);
            end
          reg36 <= wire19;
          if (($unsigned({$signed($signed(reg27))}) * {{((~^wire22) + reg34[(1'h1):(1'h0)])},
              (-wire20[(3'h4):(2'h2)])}))
            begin
              reg37 <= $signed((reg36 ?
                  wire21 : ((-(reg23 - wire19)) ?
                      wire17[(4'h9):(4'h8)] : ((^~reg28) + (wire17 ?
                          reg34 : reg32)))));
            end
          else
            begin
              reg37 <= (^~reg26);
            end
        end
      else
        begin
          if ((^$unsigned(({reg34[(1'h0):(1'h0)], (reg32 ^~ reg33)} ?
              (^((8'hbc) ? reg35 : wire18)) : $unsigned(reg26)))))
            begin
              reg31 <= reg24;
              reg32 <= (!($unsigned({{(8'had)}}) && $unsigned((~^reg27[(2'h3):(1'h0)]))));
              reg33 <= $signed($unsigned($signed(reg32[(5'h10):(2'h3)])));
            end
          else
            begin
              reg31 <= ((((|(+reg35)) ?
                          ((8'had) ?
                              (wire22 ?
                                  reg36 : reg35) : (wire16 ^~ reg37)) : ($signed(wire19) & reg29[(2'h2):(1'h1)])) ?
                      $unsigned(reg28) : wire17[(1'h1):(1'h0)]) ?
                  $signed(reg29[(3'h5):(2'h2)]) : $signed((-$signed(reg29[(2'h3):(2'h3)]))));
              reg32 <= $signed({$unsigned($unsigned(((8'ha0) ?
                      wire18 : wire16)))});
              reg33 <= $signed((({(8'hb5), (-(8'hbd))} ?
                      (~^$signed((7'h41))) : $signed({reg25, wire17})) ?
                  $signed(($signed(wire20) <= reg23)) : $signed((&wire22[(4'h8):(4'h8)]))));
              reg34 <= {wire17};
            end
        end
      reg38 <= (!reg24);
      reg39 <= reg33;
    end
  assign wire40 = wire19[(3'h4):(3'h4)];
  assign wire41 = ((8'hbb) ?
                      reg35 : $unsigned($signed($signed(((7'h41) >= wire18)))));
  assign wire42 = wire19;
  module43 #() modinst64 (wire63, clk, wire16, reg28, reg34, reg37);
  assign wire65 = $signed($unsigned(({wire40[(4'he):(2'h3)],
                      {wire21}} || (~&$unsigned(reg39)))));
  always
    @(posedge clk) begin
      reg66 <= (8'haa);
      reg67 <= ((((reg39 ? wire16 : (wire65 < reg27)) ?
              $signed((~^reg30)) : $signed($signed(reg30))) ?
          $signed($unsigned({wire21})) : ((((8'h9d) <<< reg30) ?
              $unsigned(reg35) : reg31[(2'h2):(2'h2)]) >>> reg27[(1'h1):(1'h0)])) > $signed(wire42));
      reg68 <= $signed(reg39[(2'h3):(1'h1)]);
      reg69 <= $unsigned($signed((wire41[(4'h8):(1'h1)] <= $unsigned(reg39))));
      reg70 <= (($signed((^~wire16)) ?
              {{(reg37 ^ (8'h9c))}} : ((~&(-wire19)) ?
                  reg26 : reg33[(2'h3):(1'h1)])) ?
          {(reg27 ?
                  wire40[(4'ha):(3'h7)] : $unsigned($signed(reg37)))} : $unsigned(({(~&(8'ha6))} ?
              (^~(reg30 >>> wire63)) : (8'ha8))));
    end
  assign wire71 = (~|$signed(($unsigned(wire20) >= (~(reg38 ?
                      wire17 : wire17)))));
  always
    @(posedge clk) begin
      reg72 <= reg69;
    end
  assign wire73 = ((7'h43) >> wire16[(4'ha):(4'h9)]);
  assign wire74 = $unsigned((7'h44));
  assign wire75 = wire18[(2'h2):(1'h1)];
  assign wire76 = $signed($signed(wire73[(4'he):(3'h4)]));
endmodule

module module43
#(parameter param62 = {(~(-(-((7'h44) ? (8'h9d) : (8'hbe))))), {((8'hae) * ((|(8'ha3)) ? (^(8'ha1)) : ((8'hb2) && (8'hb6)))), (&((7'h44) ^~ {(8'ha9)}))}})
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire47;
  input wire [(5'h11):(1'h0)] wire46;
  input wire signed [(3'h5):(1'h0)] wire45;
  input wire signed [(4'h9):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire56;
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= $signed(wire44);
      reg49 <= wire45;
      reg50 <= (^(~&((wire46[(1'h0):(1'h0)] ? $signed((8'hac)) : (^wire47)) ?
          $signed((~&wire46)) : wire47)));
      reg51 <= reg48;
    end
  always
    @(posedge clk) begin
      reg52 <= (~^(^wire44));
      if (reg52[(4'ha):(1'h1)])
        begin
          reg53 <= reg49[(4'h8):(3'h6)];
        end
      else
        begin
          reg53 <= reg51;
          reg54 <= (reg50 ?
              (~reg51[(2'h3):(1'h0)]) : $unsigned(($signed(wire45[(3'h4):(3'h4)]) != $signed((reg50 ?
                  wire45 : reg48)))));
          reg55 <= wire45[(1'h0):(1'h0)];
        end
    end
  assign wire56 = {reg55,
                      ({(&(wire44 >= wire47)),
                              ($unsigned(wire47) >= (wire45 != wire47))} ?
                          (reg51[(1'h0):(1'h0)] ?
                              ((^~reg54) == $unsigned(reg55)) : reg53) : reg55)};
  assign wire57 = wire46[(3'h6):(2'h3)];
  assign wire58 = (^~reg55[(4'ha):(1'h1)]);
  assign wire59 = $unsigned(wire57);
  assign wire60 = $unsigned(wire46[(5'h11):(4'he)]);
  assign wire61 = wire45[(1'h0):(1'h0)];
endmodule

module module120
#(parameter param172 = (~^(8'ha7)))
(y, clk, wire125, wire124, wire123, wire122, wire121);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire125;
  input wire [(4'hf):(1'h0)] wire124;
  input wire [(5'h10):(1'h0)] wire123;
  input wire [(4'hf):(1'h0)] wire122;
  input wire signed [(3'h5):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire171;
  wire [(2'h3):(1'h0)] wire167;
  wire [(5'h12):(1'h0)] wire166;
  wire signed [(4'he):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire140;
  wire signed [(5'h12):(1'h0)] wire139;
  wire signed [(4'h9):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire126;
  reg signed [(5'h10):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg [(5'h14):(1'h0)] reg168 = (1'h0);
  reg [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg164 = (1'h0);
  reg [(3'h7):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(3'h4):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  assign y = {wire171,
                 wire167,
                 wire166,
                 wire156,
                 wire155,
                 wire154,
                 wire140,
                 wire139,
                 wire138,
                 wire126,
                 reg170,
                 reg169,
                 reg168,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
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
                 (1'h0)};
  assign wire126 = wire123;
  always
    @(posedge clk) begin
      reg127 <= wire125;
      reg128 <= {$signed(reg127[(4'ha):(3'h7)])};
    end
  always
    @(posedge clk) begin
      if ((($signed(reg128[(3'h6):(1'h0)]) ?
              ($unsigned($signed(reg128)) ^~ reg128) : (reg127 ?
                  (~&wire125[(2'h2):(2'h2)]) : ((~&wire121) ?
                      wire124[(4'hd):(1'h1)] : wire125))) ?
          (wire123[(4'h9):(3'h4)] ?
              ((^~{(8'hac)}) ?
                  $unsigned((-wire126)) : (reg128 < $signed(reg127))) : ({$signed(wire121),
                      wire122} ?
                  $unsigned($unsigned(wire123)) : ($signed(wire125) ?
                      (wire122 ?
                          wire126 : wire121) : $unsigned(wire126)))) : ($unsigned(wire126) ?
              (~|(wire123[(4'ha):(3'h7)] ?
                  wire125 : (wire123 && (8'hbf)))) : $unsigned($unsigned((~|reg128))))))
        begin
          reg129 <= wire126[(3'h5):(1'h0)];
        end
      else
        begin
          reg129 <= (~&$unsigned($signed($signed($signed(wire122)))));
        end
      reg130 <= (wire121 && ((~|wire123) && wire121));
      if ($signed((reg129[(1'h1):(1'h0)] ?
          wire125 : $signed(reg130[(3'h4):(2'h2)]))))
        begin
          reg131 <= (+(-$signed((|reg127))));
          reg132 <= (((~{$unsigned(reg127)}) ?
              ($unsigned($unsigned(wire124)) & (~&{reg131})) : $unsigned($unsigned((^~(7'h40))))) >= reg127[(3'h4):(1'h1)]);
          if (($unsigned($signed($signed($unsigned(wire125)))) & wire125))
            begin
              reg133 <= ((-($unsigned({reg127, wire125}) ?
                      ($signed(wire124) > (8'h9e)) : (wire121 || (~^reg132)))) ?
                  reg130[(1'h1):(1'h1)] : wire123[(1'h1):(1'h0)]);
              reg134 <= ($signed(wire125) ?
                  $signed((~&(~&(!reg132)))) : $signed((($unsigned(reg129) ?
                      (^reg132) : (~^wire122)) * {(reg133 || (8'ha0)),
                      (~&wire126)})));
              reg135 <= $unsigned(wire123);
              reg136 <= wire122[(4'hf):(4'hb)];
              reg137 <= {$unsigned({$unsigned(reg131[(1'h0):(1'h0)]),
                      reg134[(4'hc):(4'h9)]})};
            end
          else
            begin
              reg133 <= (+(~^reg127[(3'h7):(3'h4)]));
              reg134 <= $signed(($signed(((wire124 ? reg133 : reg136) ?
                      $signed((8'hb3)) : wire125)) ?
                  wire125[(1'h0):(1'h0)] : reg131));
              reg135 <= reg131;
              reg136 <= $signed($signed((~|((reg135 <<< (8'ha7)) ?
                  wire126 : (wire126 != wire123)))));
              reg137 <= (-reg128[(3'h6):(3'h4)]);
            end
        end
      else
        begin
          reg131 <= $signed(((reg136 ? reg132 : ($unsigned(wire126) - reg129)) ?
              $signed($unsigned((wire122 ?
                  (8'had) : reg129))) : {$signed((wire123 * wire123)),
                  (!wire125)}));
          reg132 <= $signed((wire124[(4'h8):(3'h6)] ?
              (8'hb6) : reg132[(1'h1):(1'h1)]));
          reg133 <= $signed(reg133);
          reg134 <= (~&(^~wire123));
        end
    end
  assign wire138 = $signed(wire124);
  assign wire139 = (($signed(($unsigned(wire138) <<< (-reg128))) ?
                           ($signed({wire138, reg136}) ?
                               (reg129 == reg130[(1'h0):(1'h0)]) : (reg130 == (8'had))) : {(!$signed(reg133)),
                               (~^$unsigned(wire138))}) ?
                       reg130 : wire126);
  assign wire140 = $unsigned($unsigned($signed($signed(reg137[(4'h8):(3'h5)]))));
  always
    @(posedge clk) begin
      reg141 <= $unsigned($unsigned((^wire126)));
      reg142 <= (|(|$signed(reg129)));
      reg143 <= reg130[(3'h4):(1'h1)];
      if ((((~^$signed(wire124[(3'h7):(3'h5)])) || $signed($unsigned((|reg143)))) ~^ reg128[(2'h3):(2'h2)]))
        begin
          reg144 <= ((+reg136[(1'h1):(1'h1)]) ?
              (|$unsigned((8'had))) : (reg137[(1'h1):(1'h1)] ?
                  $signed(wire140) : ((((8'hb8) ? reg128 : (8'ha8)) ?
                          reg142 : (^reg131)) ?
                      $signed((wire138 || wire126)) : ($signed((8'hb2)) & wire124[(2'h3):(1'h0)]))));
          reg145 <= (~reg129);
          reg146 <= {wire122[(3'h7):(3'h5)]};
          reg147 <= {(~|$signed($signed(reg144))),
              $signed((((reg144 ? reg127 : wire140) ?
                      $signed(reg146) : {wire123, wire123}) ?
                  ((reg145 != reg127) ?
                      (wire140 ^~ reg142) : {reg128, reg143}) : {{reg144,
                          wire138}}))};
          if (wire138)
            begin
              reg148 <= reg135[(3'h7):(3'h6)];
              reg149 <= ($signed($unsigned((~((7'h43) ? wire121 : (8'hb2))))) ?
                  reg143 : (|(~|(~&(reg134 - reg127)))));
              reg150 <= (reg136[(1'h1):(1'h0)] == (reg146[(1'h0):(1'h0)] ?
                  $signed(($unsigned(wire121) ^~ reg134[(1'h1):(1'h1)])) : (-(reg127 == (reg136 << reg143)))));
              reg151 <= {$unsigned($signed($unsigned({(7'h41)})))};
              reg152 <= (~&(reg151[(3'h4):(2'h3)] ?
                  $unsigned((8'had)) : (reg144[(3'h6):(3'h6)] ?
                      (8'hb7) : (&reg130))));
            end
          else
            begin
              reg148 <= $signed(reg128[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg144 <= $signed((~|$signed(($unsigned(reg150) << ((8'hbb) ?
              reg136 : wire124)))));
          if ({$signed({(|$signed(reg148)), wire121})})
            begin
              reg145 <= (&(~^(~^reg141[(1'h1):(1'h0)])));
              reg146 <= ($unsigned(($unsigned(reg132[(2'h3):(2'h3)]) ?
                      reg137[(1'h0):(1'h0)] : wire138[(2'h2):(1'h0)])) ?
                  (((8'ha0) ^ $unsigned($signed(wire125))) <<< ({(~^reg147)} == {reg145[(4'h8):(1'h1)]})) : ((~&$unsigned((~^wire124))) >> (wire124[(3'h7):(3'h6)] ?
                      wire140[(4'ha):(2'h2)] : $signed(wire123))));
              reg147 <= (($unsigned($unsigned($unsigned((8'ha8)))) ?
                  reg130 : reg136) ^ reg145);
              reg148 <= $signed((reg128[(4'h8):(4'h8)] ?
                  reg151[(1'h1):(1'h1)] : (reg143 <= (+(reg146 ?
                      (8'hba) : wire126)))));
            end
          else
            begin
              reg145 <= ($unsigned(wire140) ~^ ($unsigned((((8'hb6) ?
                          reg150 : reg136) ?
                      (|wire124) : reg131)) ?
                  ($unsigned((reg151 ?
                      reg142 : (7'h40))) == reg145[(4'h8):(1'h1)]) : reg130));
            end
          reg149 <= reg152;
        end
    end
  always
    @(posedge clk) begin
      reg153 <= reg131[(2'h3):(1'h1)];
    end
  assign wire154 = {reg136[(1'h0):(1'h0)], (8'hae)};
  assign wire155 = (reg129[(2'h2):(1'h0)] ?
                       $signed($signed(reg141[(3'h4):(3'h4)])) : (reg132 <<< reg127[(4'hf):(4'hb)]));
  assign wire156 = $signed(reg131);
  always
    @(posedge clk) begin
      if ((wire123 > reg150))
        begin
          reg157 <= (((!((reg134 >>> reg145) << reg127)) ? reg136 : wire123) ?
              ((reg144[(1'h1):(1'h1)] ?
                      $unsigned(((8'hb9) ? reg152 : reg134)) : {{reg130}}) ?
                  ($signed($unsigned(wire139)) ^~ $unsigned((reg146 != reg153))) : (!$unsigned((reg151 == reg152)))) : ($unsigned(({wire123} ?
                  (+(7'h42)) : (~^reg131))) != $unsigned((reg142[(1'h0):(1'h0)] ?
                  reg130 : (reg146 > (8'ha4))))));
          reg158 <= $unsigned(($signed(reg133[(1'h0):(1'h0)]) ?
              {$unsigned({reg136})} : (^~$unsigned((reg141 ?
                  reg153 : reg135)))));
          if ($unsigned($signed($unsigned((-(reg127 >= reg130))))))
            begin
              reg159 <= reg130[(1'h1):(1'h0)];
            end
          else
            begin
              reg159 <= ({(wire138[(3'h5):(2'h2)] ?
                          $signed((reg127 ?
                              (8'hb0) : wire123)) : wire121[(2'h3):(2'h2)]),
                      (reg159 || (|{(8'hb1)}))} ?
                  (wire122[(4'hb):(4'h9)] ?
                      (reg136[(1'h1):(1'h0)] ?
                          ($signed(reg149) ?
                              $unsigned(wire125) : reg151[(4'h8):(4'h8)]) : (+(|wire121))) : reg147[(2'h2):(1'h0)]) : $unsigned((reg131[(1'h1):(1'h1)] ?
                      {$signed(reg157), {wire125, reg136}} : ((reg146 ?
                              wire126 : reg132) ?
                          reg150 : reg133[(3'h6):(3'h6)]))));
              reg160 <= ($signed((!$signed($unsigned(wire138)))) <<< $unsigned($unsigned({(^~reg132)})));
              reg161 <= (~|($signed(reg143) > $signed($unsigned(reg152))));
              reg162 <= $signed((-(|($signed(reg131) & (wire126 ^~ wire122)))));
              reg163 <= $signed({wire154[(4'he):(2'h2)],
                  {$unsigned(reg135[(2'h3):(1'h0)]), wire121[(1'h0):(1'h0)]}});
            end
          reg164 <= reg127[(4'he):(3'h5)];
        end
      else
        begin
          reg157 <= (~|(!($unsigned((reg137 ?
              reg132 : wire125)) <<< $signed((&reg159)))));
          reg158 <= reg127;
          reg159 <= (!wire139);
          reg160 <= (!(-$signed((8'hb2))));
        end
      reg165 <= wire121;
    end
  assign wire166 = reg128[(1'h1):(1'h0)];
  assign wire167 = (8'hba);
  always
    @(posedge clk) begin
      reg168 <= ((|reg129[(2'h2):(2'h2)]) ?
          $signed((((+reg162) >> ((8'hb6) ^~ reg147)) | {$signed(reg130),
              {wire139, wire139}})) : (($signed((&wire123)) ?
                  $signed((wire124 ?
                      reg131 : wire124)) : (!$unsigned(reg159))) ?
              (reg136[(2'h2):(1'h1)] ?
                  reg163 : {$unsigned(reg137)}) : (((reg160 == wire167) * (~&reg142)) != $unsigned((reg133 ?
                  reg141 : reg130)))));
      reg169 <= ((wire167[(2'h2):(1'h0)] || $signed(reg135[(2'h3):(2'h2)])) ?
          $unsigned(($signed(wire121) ?
              $signed({reg144}) : ({reg141} >>> ((7'h43) == reg150)))) : $signed($unsigned(((^reg152) | $signed((8'ha7))))));
      reg170 <= $signed($unsigned((({reg151} ? reg158 : reg147) - wire139)));
    end
  assign wire171 = $unsigned($unsigned($unsigned((reg129[(1'h1):(1'h1)] | (wire140 << reg148)))));
endmodule
