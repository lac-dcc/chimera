module top
#(parameter param213 = (((((~(8'hb2)) <= ((8'ha4) && (8'hb4))) <<< (~^((8'h9c) + (8'had)))) ? (~&(~|(~^(8'ha9)))) : (({(7'h40)} ? ((8'hbf) || (8'hb6)) : ((8'hb9) ? (8'ha0) : (8'hb5))) || ((&(8'hbf)) ? (-(8'ha4)) : (-(8'hb0))))) ? (({{(8'ha9)}} > (((8'ha4) * (8'hb8)) ? ((8'hab) ? (8'h9d) : (8'hbb)) : {(8'hb2), (8'h9c)})) ? ((~^(~(8'hbe))) ? ((~|(7'h41)) ? (^(8'hab)) : ((8'hb6) + (8'hbb))) : ((8'hb5) <<< ((8'ha2) <= (8'hb4)))) : ((^(~|(8'h9c))) ? (((8'ha6) ? (8'hbc) : (8'hbc)) & {(8'ha4)}) : (!((8'had) > (8'hb4))))) : (-(((8'hb7) >> (^(8'hbd))) ^~ {((8'ha6) ? (8'hb7) : (8'haf))}))), 
parameter param214 = (~|param213))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire212;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire106;
  wire [(4'hd):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire210;
  assign y = {wire212,
                 wire4,
                 wire5,
                 wire98,
                 wire100,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire210,
                 (1'h0)};
  assign wire4 = (~&(~|$signed(wire0)));
  assign wire5 = (~|($signed((+(+(8'hb8)))) ?
                     (((wire3 ? wire3 : wire4) ?
                             $unsigned(wire3) : $unsigned(wire3)) ?
                         wire4[(3'h4):(2'h3)] : $signed((!wire2))) : $signed((-$signed(wire4)))));
  module6 #() modinst99 (wire98, clk, wire4, wire0, wire5, wire3);
  assign wire100 = (wire2[(5'h14):(3'h4)] >>> wire3);
  assign wire101 = wire4;
  assign wire102 = ((8'hb0) && wire1);
  assign wire103 = (~&(wire98[(4'h8):(2'h3)] ?
                       (-(~|(^wire2))) : $signed($signed(wire100))));
  assign wire104 = ($unsigned(wire0[(4'hf):(4'hb)]) ?
                       (wire101 && wire102) : (8'hbc));
  assign wire105 = ((wire101[(3'h7):(3'h4)] ?
                           wire102[(2'h3):(1'h1)] : ($unsigned(wire104) ?
                               ((~&wire1) ?
                                   (wire1 + wire103) : wire100) : ((&wire1) & wire1[(1'h1):(1'h1)]))) ?
                       $signed((-$signed(wire3))) : wire0);
  assign wire106 = ((-wire5) ?
                       $signed($unsigned($unsigned((wire3 ?
                           wire4 : (8'ha7))))) : (~^(!{(~^wire101)})));
  assign wire107 = $unsigned((~|((wire4 <= {wire106,
                       wire3}) >>> $signed(wire100[(1'h0):(1'h0)]))));
  assign wire108 = (8'ha6);
  assign wire109 = (~wire101);
  module110 #() modinst211 (.clk(clk), .wire112(wire101), .wire111(wire106), .wire115(wire107), .wire114(wire103), .y(wire210), .wire113(wire4));
  assign wire212 = $unsigned(wire102[(4'ha):(1'h0)]);
endmodule

module module110
#(parameter param208 = ({(&(|(^~(8'ha0))))} ? (^(((~^(8'haa)) ? {(8'hb3)} : ((8'hb0) | (8'hb8))) ? (((8'ha4) | (8'hb8)) ? (^~(8'hb2)) : (-(8'ha2))) : (~((8'ha4) ? (8'hba) : (7'h43))))) : {(((~(8'haf)) << ((8'hbe) <<< (7'h40))) >>> ({(8'hb8), (8'ha2)} ? (|(8'hb0)) : {(8'hbc)}))}), 
parameter param209 = param208)
(y, clk, wire111, wire112, wire113, wire114, wire115);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire111;
  input wire signed [(4'h8):(1'h0)] wire112;
  input wire signed [(5'h11):(1'h0)] wire113;
  input wire signed [(4'hf):(1'h0)] wire114;
  input wire signed [(3'h4):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire207;
  wire [(2'h2):(1'h0)] wire206;
  wire signed [(4'hc):(1'h0)] wire205;
  wire [(4'hd):(1'h0)] wire203;
  wire signed [(4'hb):(1'h0)] wire172;
  wire [(5'h14):(1'h0)] wire150;
  wire signed [(4'he):(1'h0)] wire149;
  wire [(3'h6):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire117;
  wire [(5'h11):(1'h0)] wire118;
  wire signed [(5'h15):(1'h0)] wire119;
  wire [(5'h14):(1'h0)] wire121;
  wire [(5'h14):(1'h0)] wire122;
  wire signed [(5'h11):(1'h0)] wire123;
  wire [(5'h15):(1'h0)] wire124;
  wire [(2'h3):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire126;
  wire [(5'h11):(1'h0)] wire127;
  wire [(5'h10):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire130;
  wire [(5'h14):(1'h0)] wire147;
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  assign y = {wire207,
                 wire206,
                 wire205,
                 wire203,
                 wire172,
                 wire150,
                 wire149,
                 wire116,
                 wire117,
                 wire118,
                 wire119,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire127,
                 wire128,
                 wire129,
                 wire130,
                 wire147,
                 reg120,
                 (1'h0)};
  assign wire116 = ($unsigned(({(wire115 - wire112)} ?
                       $unsigned((~&wire113)) : wire112[(4'h8):(1'h0)])) <<< wire112[(3'h7):(1'h1)]);
  assign wire117 = $unsigned({(wire114 + (~^wire111))});
  assign wire118 = ($signed($unsigned((-(-wire113)))) >> ($unsigned(((wire116 ?
                           wire115 : wire112) ?
                       (wire116 ?
                           wire117 : wire113) : wire116[(2'h3):(1'h0)])) && $signed(wire112)));
  assign wire119 = wire116[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg120 <= $unsigned((~|wire116[(1'h1):(1'h0)]));
    end
  assign wire121 = (wire116 ?
                       (($signed((~^wire114)) ?
                           wire116 : wire116[(3'h6):(3'h5)]) >>> wire117) : (&($unsigned((wire114 ?
                               wire111 : wire112)) ?
                           wire115[(2'h2):(1'h1)] : wire116)));
  assign wire122 = (^~$signed($signed($signed((wire119 <<< (8'hba))))));
  assign wire123 = $signed(wire119[(5'h12):(4'h8)]);
  assign wire124 = (^~$signed(((-wire122[(4'hd):(4'hd)]) ?
                       $unsigned(wire117[(3'h6):(3'h4)]) : wire117[(1'h1):(1'h1)])));
  assign wire125 = {wire123[(3'h6):(2'h2)]};
  assign wire126 = {(wire118[(5'h11):(3'h5)] - ((wire124[(4'hc):(3'h4)] > $signed(wire122)) ^ $unsigned((&reg120)))),
                       $unsigned((wire115[(3'h4):(3'h4)] ?
                           $signed((wire114 ?
                               wire114 : wire111)) : $signed((^wire125))))};
  assign wire127 = $signed(($signed(wire124[(5'h13):(1'h0)]) << (8'ha1)));
  assign wire128 = $signed($signed($unsigned(((wire114 * wire115) ?
                       wire115[(1'h0):(1'h0)] : wire118))));
  assign wire129 = {($unsigned(wire119[(3'h4):(2'h2)]) ? (8'ha0) : wire122)};
  assign wire130 = ($unsigned($unsigned((((8'h9c) ?
                       wire116 : wire121) || (wire126 ?
                       wire125 : (8'h9d))))) & ((+((wire111 ?
                           wire126 : wire116) + wire119[(4'hc):(4'hc)])) ?
                       wire126 : wire128[(3'h4):(2'h2)]));
  module131 #() modinst148 (.clk(clk), .wire136(wire122), .y(wire147), .wire135(wire115), .wire133(wire127), .wire134(wire129), .wire132(wire124));
  assign wire149 = {(wire119[(4'hf):(4'ha)] > ($signed({wire123}) ?
                           (wire128 ?
                               wire123[(4'hc):(4'ha)] : wire116) : wire111[(2'h2):(2'h2)]))};
  assign wire150 = ((^~wire118[(4'hd):(4'h8)]) ?
                       (&(wire116 >> wire125)) : $signed(wire130));
  module151 #() modinst173 (.wire153(wire149), .wire155(wire126), .clk(clk), .wire154(wire147), .wire152(wire122), .y(wire172));
  module174 #() modinst204 (.wire176(wire123), .wire178(wire126), .clk(clk), .wire175(wire150), .y(wire203), .wire177(wire122));
  assign wire205 = (wire128 ?
                       $unsigned(reg120[(3'h5):(1'h1)]) : (((~^$unsigned((8'ha7))) < (~&$signed(wire113))) ?
                           $signed($signed($unsigned(wire113))) : (((wire114 - wire172) != $signed((8'hbf))) ?
                               $signed((!wire147)) : ((reg120 ?
                                       wire150 : wire123) ?
                                   (wire129 & wire112) : $signed(wire128)))));
  assign wire206 = wire123[(2'h2):(2'h2)];
  assign wire207 = (($unsigned(((^~wire111) ?
                               ((8'ha6) ?
                                   wire125 : wire121) : $unsigned(wire126))) ?
                           {((wire115 + wire126) ?
                                   $unsigned(wire121) : {wire150}),
                               ((|wire172) ?
                                   (wire127 ?
                                       reg120 : wire112) : (wire150 < wire147))} : (($unsigned(wire149) ?
                                   wire116[(1'h1):(1'h1)] : wire203[(4'h8):(3'h6)]) ?
                               ((wire203 ? (8'h9f) : wire127) ?
                                   $signed(wire129) : (wire111 ?
                                       wire115 : (8'hbe))) : ($unsigned(wire122) ?
                                   $unsigned(wire115) : wire113))) ?
                       $unsigned(wire172[(1'h0):(1'h0)]) : $signed((!wire116)));
endmodule

module module6
#(parameter param97 = ({(!({(8'hab), (8'hb2)} >= ((8'hba) < (7'h40))))} ? {((((8'ha8) || (8'hbc)) + {(8'hbf)}) >> (((8'hb5) ? (8'hbd) : (7'h43)) ~^ ((8'ha7) <= (8'h9d))))} : ((|{((7'h44) >= (8'hac))}) == ((^~{(8'ha3), (8'hb7)}) ? ((~^(8'hab)) == (!(8'hb1))) : ({(8'ha4), (8'hbc)} ? {(8'hb6)} : ((8'haa) & (7'h43)))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire94;
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  assign y = {wire96,
                 wire20,
                 wire21,
                 wire42,
                 wire44,
                 wire45,
                 wire50,
                 wire51,
                 wire68,
                 wire94,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= ($signed(wire8[(2'h3):(1'h0)]) ~^ (wire8 << $unsigned((wire8 ~^ wire8[(2'h2):(2'h2)]))));
      if (((^wire8) >> {wire9}))
        begin
          reg12 <= (~$signed({$signed(wire9)}));
          reg13 <= $signed({wire8[(1'h1):(1'h0)]});
        end
      else
        begin
          reg12 <= ($signed(reg12[(3'h6):(3'h5)]) <<< (({(^~reg11),
                  $unsigned((8'hb5))} ?
              wire9 : {reg12[(2'h3):(2'h3)],
                  $signed((8'haa))}) & wire7[(5'h10):(4'h8)]));
        end
      if ({wire8, {(8'ha6), wire9}})
        begin
          if (reg12)
            begin
              reg14 <= {(+(8'ha2)),
                  (reg11 ?
                      ($signed({reg11}) - reg12) : (((reg12 <<< wire10) ?
                              $signed(wire7) : (~&wire7)) ?
                          (-wire8) : ((-wire7) ?
                              (wire8 | (7'h42)) : $signed(wire8))))};
            end
          else
            begin
              reg14 <= (&$unsigned((reg14[(4'h8):(2'h3)] ?
                  $unsigned(reg11) : ((~&(8'ha6)) ?
                      wire10[(3'h5):(2'h3)] : wire9))));
              reg15 <= (+reg14[(4'hd):(3'h7)]);
              reg16 <= (reg12 << $unsigned((({(7'h43), wire8} ?
                      $unsigned(reg11) : (reg12 >>> wire8)) ?
                  reg12 : ((^wire8) ? {reg13, reg14} : wire10))));
              reg17 <= (~^$signed((wire8 ?
                  wire9[(3'h7):(1'h1)] : (&(reg15 ? reg14 : wire10)))));
              reg18 <= (^~reg16[(3'h6):(2'h2)]);
            end
          reg19 <= (reg12[(4'h9):(3'h4)] ?
              $signed(($signed({wire9}) >>> wire8[(1'h0):(1'h0)])) : reg11[(3'h4):(2'h3)]);
        end
      else
        begin
          reg14 <= ((|(~^$signed(reg16))) ?
              ((reg15[(1'h0):(1'h0)] ?
                      ({reg12, wire10} ?
                          $unsigned(reg14) : (reg17 ?
                              (8'ha2) : reg11)) : (&$signed(reg14))) ?
                  (8'hb0) : $unsigned(wire10)) : ($signed((+$unsigned(reg11))) ?
                  (reg19 ?
                      ($signed(wire7) ?
                          $signed(reg14) : $unsigned(reg17)) : ($unsigned(reg15) >>> ((8'h9e) ?
                          wire8 : reg18))) : (($unsigned(wire8) >> {reg14}) ?
                      $signed(((8'h9d) * (8'hb8))) : (~|(reg19 ?
                          reg15 : reg12)))));
          reg15 <= {(&reg18[(2'h3):(1'h0)]), reg17[(1'h1):(1'h0)]};
          reg16 <= $signed((($signed($unsigned(reg14)) | wire9[(3'h6):(3'h5)]) ?
              $unsigned(((reg17 ? reg11 : (8'h9f)) ?
                  (wire10 >> wire7) : ((8'haa) & reg12))) : (-wire8)));
          reg17 <= reg17[(4'ha):(4'h9)];
          reg18 <= ((reg19[(2'h2):(1'h1)] ?
              reg18[(3'h4):(2'h2)] : (~&$unsigned($signed(reg18)))) < reg17[(1'h1):(1'h1)]);
        end
    end
  assign wire20 = reg11;
  assign wire21 = reg18;
  module22 #() modinst43 (wire42, clk, wire9, wire7, reg17, reg16, reg18);
  assign wire44 = (|((~(~(wire7 ? (8'hae) : (8'h9d)))) - $signed(reg16)));
  assign wire45 = $signed($unsigned((!($unsigned(wire42) | (!reg19)))));
  always
    @(posedge clk) begin
      reg46 <= reg16[(3'h7):(3'h4)];
      reg47 <= (wire42[(1'h0):(1'h0)] ?
          ((~&(+$unsigned(wire21))) ?
              wire9 : $unsigned($unsigned((wire20 + reg46)))) : $unsigned((8'haf)));
      reg48 <= (8'hb7);
      reg49 <= ($signed((($signed(reg17) ? (8'ha7) : {wire45, reg13}) ?
          $signed(wire8[(1'h0):(1'h0)]) : ($unsigned(wire21) ?
              {reg47} : $unsigned((8'hb1))))) ~^ (wire21[(4'ha):(4'ha)] >= (^wire8[(2'h3):(2'h3)])));
    end
  assign wire50 = $signed((^(-$signed({(8'hb9), reg16}))));
  assign wire51 = (-(8'ha5));
  always
    @(posedge clk) begin
      if ({(reg47[(1'h0):(1'h0)] ?
              $unsigned((reg12[(3'h5):(3'h4)] >> $signed((8'hb7)))) : $unsigned($unsigned($unsigned(wire20))))})
        begin
          if ((reg14 << ((reg11[(3'h4):(2'h2)] > reg17[(4'ha):(4'h9)]) && wire51[(4'he):(4'h9)])))
            begin
              reg52 <= reg15;
              reg53 <= (!((wire8[(2'h3):(1'h0)] ?
                  {{(8'hbb)}} : reg49[(3'h5):(3'h5)]) ~^ wire20[(4'ha):(2'h3)]));
              reg54 <= {($unsigned(wire50) << wire42[(2'h2):(1'h0)])};
              reg55 <= (($signed(reg49[(2'h3):(1'h1)]) ?
                  $unsigned({(~reg48)}) : ($signed((wire9 - wire7)) <<< $signed($unsigned(wire10)))) < $signed((reg46 ?
                  {(reg46 ? reg19 : wire7),
                      wire44[(1'h1):(1'h1)]} : wire10[(2'h3):(1'h1)])));
              reg56 <= $signed(wire50[(4'h9):(3'h6)]);
            end
          else
            begin
              reg52 <= $signed(((7'h41) & ((~|(|reg18)) >>> $unsigned((reg15 + reg47)))));
            end
        end
      else
        begin
          reg52 <= $unsigned(reg15);
          reg53 <= {wire45[(1'h1):(1'h1)]};
          if (reg17[(3'h6):(3'h6)])
            begin
              reg54 <= $unsigned(reg52);
              reg55 <= reg19[(4'hd):(4'ha)];
              reg56 <= (wire44[(2'h2):(1'h0)] >> reg56);
              reg57 <= (($signed({(~|reg46),
                      reg14[(2'h2):(1'h1)]}) <<< (reg12[(3'h4):(2'h3)] > wire51)) ?
                  (-({$signed(reg56), (8'had)} ?
                      ((wire21 ?
                          (8'ha3) : wire21) & wire45) : reg19[(1'h0):(1'h0)])) : wire42[(2'h3):(1'h1)]);
              reg58 <= $unsigned((^~(reg13 ?
                  $unsigned(reg47) : $signed((^reg56)))));
            end
          else
            begin
              reg54 <= reg52;
              reg55 <= ((reg14[(3'h7):(1'h1)] >>> {((reg16 * reg57) ?
                      $signed(reg16) : (reg46 || wire20))}) != reg19);
              reg56 <= ($signed($signed((~&(wire51 <<< reg54)))) ?
                  $signed($unsigned(reg58)) : $signed((&{reg46[(2'h2):(1'h0)]})));
            end
          reg59 <= $unsigned($unsigned(wire10[(3'h7):(3'h7)]));
        end
      reg60 <= $signed(wire20[(4'h8):(1'h1)]);
      if ((8'hbb))
        begin
          reg61 <= $signed((reg56[(2'h3):(1'h0)] ?
              $unsigned(($unsigned(reg55) ?
                  reg14 : reg53)) : $signed(reg49[(3'h7):(1'h1)])));
          reg62 <= (($unsigned($signed(((7'h42) ~^ wire50))) ?
              reg57 : {(&$signed(reg13)),
                  ($signed(reg12) >= (~|reg59))}) <<< reg59[(1'h0):(1'h0)]);
          if ($unsigned({$unsigned($signed($signed(wire20))),
              {((^~reg52) ? (wire7 != wire9) : reg19)}}))
            begin
              reg63 <= wire51;
              reg64 <= $unsigned(reg18);
            end
          else
            begin
              reg63 <= reg60;
              reg64 <= {{(~{$signed(reg63)})}};
            end
          reg65 <= ($signed($signed(reg15[(4'h9):(4'h8)])) <= {(^~{$signed((8'ha3))})});
          reg66 <= reg63[(2'h3):(1'h0)];
        end
      else
        begin
          if (wire44[(2'h2):(1'h0)])
            begin
              reg61 <= wire8;
              reg62 <= $signed((7'h44));
              reg63 <= $signed($signed(reg65));
              reg64 <= reg55[(3'h7):(3'h7)];
            end
          else
            begin
              reg61 <= $signed(((((reg46 << (8'hb2)) < $signed(reg57)) * reg55) == $signed(reg12[(1'h1):(1'h1)])));
              reg62 <= $unsigned((wire8 ?
                  reg47[(1'h1):(1'h0)] : $unsigned((~|{reg58, reg54}))));
              reg63 <= wire50[(2'h3):(2'h3)];
            end
        end
      reg67 <= ($unsigned($unsigned((-$signed(reg12)))) ~^ $signed(({(reg62 == reg49),
              $unsigned((7'h40))} ?
          $unsigned({reg12, wire45}) : $signed((^~reg66)))));
    end
  assign wire68 = {(((reg46[(1'h1):(1'h0)] >> (reg19 == reg65)) <= $unsigned((~^reg16))) ?
                          {$signed(((8'ha6) - reg53)),
                              wire8[(2'h3):(2'h3)]} : ($signed((!reg58)) == wire10[(3'h4):(2'h3)])),
                      ($unsigned($unsigned($signed(reg62))) >= $signed((((8'hb7) ?
                          wire10 : wire21) << (reg67 + reg56))))};
  module69 #() modinst95 (wire94, clk, reg48, wire68, reg57, reg55);
  assign wire96 = $signed(reg58);
endmodule

module module69
#(parameter param92 = ((((((8'hbc) ? (7'h44) : (8'ha4)) != ((8'hb8) ^ (8'ha0))) || (~&{(8'hbe), (8'h9d)})) ? {((|(8'hb0)) != {(8'ha2), (8'ha4)}), (((8'ha4) ? (8'ha2) : (7'h40)) ? ((8'hb7) ? (8'hb7) : (8'hb7)) : (~|(8'hbc)))} : ((((7'h41) ? (8'hb5) : (8'had)) ? (+(7'h40)) : ((8'h9e) ? (8'h9e) : (7'h44))) < (-(!(8'hbe))))) ? (&(({(7'h42)} ? ((8'hb7) && (8'hbd)) : (&(8'hb9))) + (+((8'h9d) <<< (8'haa))))) : (~^((((8'hbc) ? (8'ha6) : (8'had)) ? ((8'hac) || (8'had)) : (!(8'ha8))) && ((7'h41) ? ((8'h9c) ? (7'h43) : (8'haa)) : (+(7'h42)))))), 
parameter param93 = ((!((param92 ? ((8'haa) ? param92 : param92) : param92) ? ((8'haa) - (param92 - param92)) : ((param92 == param92) | (param92 || param92)))) ? (!param92) : (8'hbf)))
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire73;
  input wire signed [(3'h5):(1'h0)] wire72;
  input wire [(4'hf):(1'h0)] wire71;
  input wire [(5'h10):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire74 = (!$unsigned((-$unsigned((wire71 != wire73)))));
  assign wire75 = $signed($signed(wire73));
  assign wire76 = (^~(&{wire70[(4'ha):(4'h8)]}));
  assign wire77 = $unsigned({(-$signed({wire75, wire70}))});
  assign wire78 = (wire75 ? $unsigned(wire74[(4'hb):(4'h8)]) : wire72);
  assign wire79 = (~|wire70[(3'h6):(3'h4)]);
  assign wire80 = wire71[(4'hb):(3'h7)];
  assign wire81 = $signed($unsigned((^~$signed((|wire79)))));
  assign wire82 = $signed({$signed(((+(8'hbd)) <<< (wire75 << wire80))),
                      wire70[(4'hd):(2'h2)]});
  always
    @(posedge clk) begin
      reg83 <= ({(wire77[(3'h7):(3'h4)] ?
                  ($signed(wire70) ?
                      $unsigned(wire71) : $unsigned(wire78)) : {(wire79 ?
                          (8'hb8) : wire82)}),
              ($unsigned((wire74 ? wire80 : wire75)) ?
                  ((wire70 ? wire75 : (8'hb0)) << (wire71 ?
                      wire71 : wire82)) : (!wire78))} ?
          $signed(wire72) : wire82[(3'h5):(3'h4)]);
      reg84 <= wire79;
    end
  assign wire85 = (wire74 ?
                      (wire81 ?
                          wire73 : wire76) : ($unsigned(($unsigned(wire76) ?
                          (+wire81) : (8'hbe))) > ({(wire80 >= wire72),
                          (~^wire78)} << (reg84[(1'h1):(1'h0)] ?
                          wire75 : $unsigned((8'h9d))))));
  assign wire86 = $unsigned($signed($signed(((|wire71) || ((8'ha8) ?
                      (8'hae) : wire85)))));
  assign wire87 = {((((~&wire73) != {wire78, wire70}) ?
                          (^((7'h41) && wire74)) : wire76) + ($signed($unsigned((8'hbf))) < $signed((wire74 <= wire78))))};
  assign wire88 = $signed($unsigned(wire87));
  assign wire89 = $unsigned({((((8'ha5) & wire86) ?
                          wire85[(4'he):(2'h3)] : $unsigned(wire76)) ~^ {wire73,
                          (~^wire87)})});
  assign wire90 = (&wire82[(4'he):(2'h2)]);
  assign wire91 = {(7'h44)};
endmodule

module module22
#(parameter param41 = ((~|((((8'haf) ^~ (7'h41)) != (~(8'h9e))) >>> (+((7'h41) + (8'had))))) & (({((8'ha7) >= (7'h43)), (!(8'had))} & (&((7'h43) > (8'ha0)))) ? ((((8'hb8) - (8'hb6)) ? ((8'hbd) ? (8'ha9) : (8'hb1)) : {(8'ha8), (7'h42)}) ? (+((8'hbc) ? (8'hb1) : (7'h42))) : (|{(8'hb4), (7'h41)})) : (^(((8'hac) && (8'hbd)) ? ((8'hbb) && (8'hb4)) : (~(8'hb0)))))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire [(4'h8):(1'h0)] wire26;
  input wire [(4'hd):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire28;
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire31,
                 wire30,
                 wire28,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg32,
                 reg29,
                 (1'h0)};
  assign wire28 = ($unsigned(($unsigned((wire26 + wire25)) ?
                          $unsigned($signed(wire25)) : $signed((wire26 && wire26)))) ?
                      ((|(8'ha4)) >>> wire23) : $signed($signed(wire26)));
  always
    @(posedge clk) begin
      reg29 <= (((|wire23[(3'h6):(2'h2)]) || wire26[(2'h2):(1'h0)]) >= ((($signed(wire25) * wire24[(4'hc):(4'h8)]) ?
          wire28[(1'h1):(1'h0)] : $unsigned($signed(wire24))) ~^ (((wire24 <= wire26) < $signed(wire23)) > (&$unsigned(wire26)))));
    end
  assign wire30 = (^~wire26[(3'h5):(2'h3)]);
  assign wire31 = wire27[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg32 <= ({(+((&wire24) || (~wire31)))} ?
          {($unsigned((wire25 + (8'hbb))) ?
                  {$unsigned(wire31),
                      wire27[(5'h14):(4'hf)]} : $unsigned((+wire25)))} : {$unsigned(wire28)});
    end
  assign wire33 = (~^$signed((~{(reg32 ? wire25 : (8'hbc))})));
  assign wire34 = wire30;
  always
    @(posedge clk) begin
      reg35 <= ((-$unsigned($unsigned($signed(wire34)))) ?
          wire26 : wire24[(3'h7):(2'h2)]);
      if ((~$signed(($unsigned($unsigned((8'hbe))) ?
          (~&$signed(reg29)) : (~&reg35)))))
        begin
          reg36 <= {(8'ha3)};
          reg37 <= {{wire33, (7'h42)}};
          reg38 <= wire23[(4'hf):(4'h9)];
        end
      else
        begin
          reg36 <= (^$unsigned((7'h42)));
          reg37 <= $signed({$unsigned(wire24[(5'h11):(3'h5)]),
              (^~$unsigned((wire26 & wire23)))});
          if (reg36[(1'h1):(1'h0)])
            begin
              reg38 <= $unsigned(((((wire34 <<< wire25) != wire27) <= wire25[(3'h6):(2'h2)]) ?
                  reg32[(4'h8):(3'h6)] : $signed($signed(reg37))));
            end
          else
            begin
              reg38 <= {(-$signed((^$signed(wire34)))),
                  (+{((reg38 + reg35) >> $signed(wire23)),
                      reg35[(1'h1):(1'h1)]})};
              reg39 <= wire24;
            end
        end
      reg40 <= reg37[(4'ha):(2'h2)];
    end
endmodule

module module174
#(parameter param202 = (~^{(((^~(8'hb9)) ? ((7'h42) ? (8'h9e) : (8'ha5)) : (~|(7'h40))) ? ((~(7'h40)) > ((8'hb4) ? (8'hbb) : (8'hb8))) : (((8'hba) ? (7'h44) : (8'ha5)) >>> (8'ha3))), {(((8'h9d) & (8'hba)) ? (&(8'h9d)) : {(8'ha2), (8'h9c)}), (((8'hab) <<< (7'h43)) ? ((8'hac) ~^ (8'hb2)) : ((8'hba) | (8'h9e)))}}))
(y, clk, wire178, wire177, wire176, wire175);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire178;
  input wire signed [(5'h11):(1'h0)] wire177;
  input wire signed [(3'h6):(1'h0)] wire176;
  input wire signed [(3'h4):(1'h0)] wire175;
  wire [(4'hc):(1'h0)] wire201;
  wire [(5'h15):(1'h0)] wire200;
  wire [(5'h13):(1'h0)] wire199;
  wire [(3'h6):(1'h0)] wire198;
  wire [(3'h6):(1'h0)] wire197;
  wire signed [(2'h3):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire191;
  wire [(5'h15):(1'h0)] wire190;
  wire [(4'h8):(1'h0)] wire189;
  wire [(4'hf):(1'h0)] wire188;
  wire signed [(5'h10):(1'h0)] wire182;
  wire signed [(3'h4):(1'h0)] wire181;
  wire signed [(5'h12):(1'h0)] wire180;
  wire signed [(5'h10):(1'h0)] wire179;
  reg [(3'h5):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg194 = (1'h0);
  reg [(5'h14):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg187 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg186 = (1'h0);
  reg [(4'hc):(1'h0)] reg185 = (1'h0);
  reg [(4'hf):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg183 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 (1'h0)};
  assign wire179 = $signed(wire176[(1'h1):(1'h0)]);
  assign wire180 = (~&(~&($signed(wire177) >= ($signed(wire176) ?
                       $signed(wire178) : $signed(wire178)))));
  assign wire181 = {wire177, $signed({$signed((~&wire180))})};
  assign wire182 = wire178[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg183 <= (-{wire175[(1'h0):(1'h0)], wire181[(2'h2):(2'h2)]});
      reg184 <= {({$signed((~wire182))} - (~|((reg183 ?
              wire181 : wire176) | {wire182, wire176}))),
          {$unsigned(wire178)}};
      reg185 <= {wire177};
      reg186 <= ($unsigned($signed((((8'hb9) ? wire176 : wire176) ?
          (!wire182) : (!wire178)))) ^ reg184);
      reg187 <= reg185;
    end
  assign wire188 = {(8'hbe),
                       ({((wire181 ~^ (8'haf)) ~^ (reg187 ^~ reg185))} ?
                           (~wire181) : $signed((~&$signed(reg184))))};
  assign wire189 = $signed($signed($signed($signed(wire178))));
  assign wire190 = (^~$unsigned(wire178));
  assign wire191 = (|reg187);
  assign wire192 = (((reg185[(4'h8):(2'h3)] > wire178[(2'h3):(2'h3)]) <= wire176[(2'h2):(2'h2)]) | {wire189[(4'h8):(2'h3)]});
  always
    @(posedge clk) begin
      reg193 <= $unsigned(($unsigned(((~|wire181) & $signed((7'h40)))) ?
          ((8'hbc) ?
              $signed((+wire181)) : wire182) : (~(^reg185[(2'h2):(2'h2)]))));
      reg194 <= {(((!$unsigned(reg185)) - (wire181 << reg186)) ?
              $unsigned($signed((^~reg183))) : $signed(($unsigned((8'hbd)) <<< {wire191,
                  wire177})))};
      reg195 <= $unsigned($unsigned($unsigned(((wire188 ^ reg187) ?
          wire177[(3'h5):(2'h3)] : (wire178 >= reg183)))));
      reg196 <= $unsigned(wire179);
    end
  assign wire197 = (+((wire190 != ((reg184 ~^ wire175) ^ (|wire181))) ^~ $signed((!wire188))));
  assign wire198 = wire176;
  assign wire199 = ({(8'haf)} ?
                       $unsigned(($signed((~wire189)) >> ({wire178, wire175} ?
                           $unsigned(wire198) : $unsigned((8'ha8))))) : wire180);
  assign wire200 = wire175[(3'h4):(2'h3)];
  assign wire201 = {((8'hb0) || (((wire182 ? wire192 : (8'hb3)) - (wire180 ?
                           (8'ha1) : reg185)) <= $unsigned(wire198[(3'h5):(2'h2)])))};
endmodule

module module151
#(parameter param170 = (8'ha5), 
parameter param171 = {(~^((!(param170 ? param170 : (8'ha6))) & {(-param170), param170})), param170})
(y, clk, wire155, wire154, wire153, wire152);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire155;
  input wire [(5'h13):(1'h0)] wire154;
  input wire [(2'h3):(1'h0)] wire153;
  input wire signed [(4'hb):(1'h0)] wire152;
  wire [(4'hf):(1'h0)] wire169;
  wire [(5'h15):(1'h0)] wire168;
  wire [(5'h14):(1'h0)] wire167;
  wire [(2'h2):(1'h0)] wire159;
  wire [(4'hf):(1'h0)] wire158;
  wire signed [(5'h12):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire156;
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 (1'h0)};
  assign wire156 = {((~|$unsigned({wire152})) << {(^~(wire155 ~^ wire155))})};
  assign wire157 = wire156[(4'h8):(4'h8)];
  assign wire158 = wire157[(4'he):(4'hc)];
  assign wire159 = wire155;
  always
    @(posedge clk) begin
      reg160 <= (wire158[(2'h2):(1'h1)] * $signed($unsigned((wire152[(4'hb):(1'h1)] >> wire154[(4'h8):(3'h7)]))));
      if (wire155[(4'ha):(2'h3)])
        begin
          reg161 <= wire154;
        end
      else
        begin
          reg161 <= $signed($signed((wire158[(2'h3):(1'h1)] ?
              $unsigned((wire153 == wire152)) : (~wire154[(4'hb):(4'h9)]))));
          if ($unsigned((~^$signed(($signed(wire159) != wire155)))))
            begin
              reg162 <= $signed((&(^~reg161)));
              reg163 <= wire157;
              reg164 <= $signed($signed(wire159));
              reg165 <= ($unsigned((!$unsigned((wire152 ?
                      wire153 : wire155)))) ?
                  (reg161 ?
                      (8'had) : ($unsigned(wire153) ?
                          ($signed(reg162) ?
                              reg160 : (wire158 <<< reg164)) : reg164[(3'h5):(1'h1)])) : $signed(wire153));
              reg166 <= $signed($signed((reg161[(5'h11):(5'h10)] << $signed((!reg162)))));
            end
          else
            begin
              reg162 <= wire153[(1'h0):(1'h0)];
            end
        end
    end
  assign wire167 = ((+{$unsigned($signed(wire152)),
                       (((8'hb6) ^ reg162) ?
                           {wire154,
                               wire158} : ((8'ha8) < reg160))}) & wire154);
  assign wire168 = reg166;
  assign wire169 = reg166[(4'he):(4'h9)];
endmodule

module module131
#(parameter param146 = ((~|((((8'hb1) ? (8'ha2) : (7'h42)) ? {(8'hbb), (8'ha0)} : (|(8'hbb))) > (-(~(8'ha4))))) ? (-((((8'ha0) + (8'hbc)) ? ((8'hbe) ? (8'ha8) : (8'hbe)) : ((8'ha9) ? (8'hbe) : (7'h40))) ? (|((8'h9c) ? (8'h9f) : (8'h9d))) : ((!(8'hbf)) ? {(8'h9d), (8'had)} : (^~(7'h41))))) : {({((7'h40) << (8'ha0)), ((8'hb7) - (8'hae))} ? (((8'haf) < (8'ha2)) < ((8'hb6) <= (8'ha7))) : (((8'ha1) >> (8'hb0)) ? ((8'hb8) - (8'ha7)) : ((8'hb9) ? (8'hae) : (7'h40))))}))
(y, clk, wire136, wire135, wire134, wire133, wire132);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire136;
  input wire [(2'h2):(1'h0)] wire135;
  input wire [(4'hd):(1'h0)] wire134;
  input wire [(5'h11):(1'h0)] wire133;
  input wire [(5'h15):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire145;
  wire [(4'he):(1'h0)] wire144;
  wire [(5'h14):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire137;
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire137,
                 reg139,
                 reg138,
                 (1'h0)};
  assign wire137 = (~^{wire132, wire136});
  always
    @(posedge clk) begin
      if ($unsigned((^~((~^(~&wire137)) ?
          $signed(((8'haa) | wire137)) : (wire136[(5'h12):(4'ha)] ?
              (wire137 >= wire136) : (wire133 ? wire134 : wire136))))))
        begin
          reg138 <= $signed(wire134[(4'ha):(3'h4)]);
          reg139 <= ($signed(wire134[(4'hb):(4'h8)]) >> (~^(^(wire137[(2'h2):(2'h2)] ?
              (wire135 + reg138) : (wire136 & wire133)))));
        end
      else
        begin
          reg138 <= (~^((-reg138[(1'h0):(1'h0)]) ?
              ((|(!wire134)) ?
                  (8'hb7) : wire136[(5'h14):(4'h9)]) : (reg139[(3'h6):(2'h3)] ?
                  (!(wire136 <= wire134)) : $unsigned(wire136[(4'hb):(1'h1)]))));
          reg139 <= (wire135 ?
              (~(8'ha6)) : ($unsigned($signed((wire137 ? wire136 : wire137))) ?
                  ($unsigned((~wire136)) ?
                      (~|(~wire137)) : wire133[(2'h3):(1'h1)]) : (8'h9c)));
        end
    end
  assign wire140 = wire135;
  assign wire141 = {wire134[(4'hc):(3'h7)],
                       ((reg139 ?
                           (|(8'hba)) : (reg139[(2'h2):(1'h0)] ?
                               {wire134,
                                   wire136} : wire137)) >>> (^$signed((wire136 >> (8'hac)))))};
  assign wire142 = reg138;
  assign wire143 = {({(~|$signed(wire136))} ?
                           (|wire140[(1'h1):(1'h0)]) : wire137[(1'h1):(1'h1)])};
  assign wire144 = wire134[(2'h2):(1'h0)];
  assign wire145 = (((&(reg138 | $signed(wire143))) ?
                       $unsigned((^~reg139[(3'h7):(2'h2)])) : (wire133[(4'hc):(3'h4)] >>> wire143)) << (wire134[(3'h6):(3'h5)] ?
                       (-(wire137[(2'h2):(1'h1)] >>> (wire142 ?
                           wire134 : wire134))) : $unsigned({{wire136,
                               wire134}})));
endmodule
