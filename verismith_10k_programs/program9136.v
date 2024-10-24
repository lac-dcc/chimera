module top
#(parameter param114 = (+((+(((8'hb7) && (8'ha3)) ? ((8'hbd) >= (8'ha9)) : ((8'hb4) ? (8'hae) : (7'h41)))) ? (^~(~|((8'hb5) ^ (8'ha7)))) : ({((8'hb4) ? (7'h40) : (7'h41)), ((7'h43) + (8'hb1))} != (^((8'hbb) ? (8'hb5) : (8'hb7)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire110;
  reg signed [(4'hf):(1'h0)] reg4 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire74,
                 wire24,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire110,
                 reg4,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0;
    end
  assign wire5 = (wire1[(1'h1):(1'h0)] ?
                     {$unsigned(reg4),
                         $unsigned(wire2[(1'h0):(1'h0)])} : {$signed({$unsigned(wire1),
                             $unsigned(wire1)}),
                         (|{$unsigned(wire3)})});
  assign wire6 = wire0[(3'h5):(1'h0)];
  assign wire7 = (wire6[(4'hc):(4'hb)] << $unsigned(({$unsigned(wire2),
                     {wire6}} - ((wire6 ? wire3 : wire3) - wire2))));
  assign wire8 = ((wire5 | $signed({(wire3 ?
                         (8'ha8) : wire6)})) || ($signed($unsigned($unsigned(wire5))) ^~ wire0));
  assign wire9 = {{$signed($signed($signed(wire2))),
                         $signed(($signed(wire7) ?
                             $unsigned(wire1) : (7'h43)))}};
  assign wire10 = wire0[(1'h1):(1'h1)];
  assign wire11 = $unsigned(wire3);
  always
    @(posedge clk) begin
      reg12 <= ($unsigned((($unsigned(reg4) ?
                  $signed(wire9) : (wire9 != wire10)) ?
              wire7[(2'h2):(1'h0)] : {$unsigned(reg4)})) ?
          ((!$unsigned(((8'ha2) ?
              wire8 : wire3))) - (&wire1)) : $unsigned({reg4[(3'h5):(2'h2)],
              ({wire1} && $unsigned(wire3))}));
      reg13 <= wire11[(1'h0):(1'h0)];
      reg14 <= $unsigned({wire1, $unsigned((wire3 ? wire11 : (~&wire1)))});
      if (reg4[(4'h8):(3'h4)])
        begin
          reg15 <= wire0;
          if ((wire5 ?
              (($unsigned({reg15}) ?
                      $signed($unsigned(wire6)) : ((-wire1) ?
                          (&wire10) : (wire5 & wire5))) ?
                  (!wire11) : $unsigned(wire3[(5'h13):(4'hf)])) : reg12))
            begin
              reg16 <= $unsigned($unsigned((|$signed((+wire6)))));
              reg17 <= (^~reg15[(2'h3):(1'h0)]);
              reg18 <= wire11;
            end
          else
            begin
              reg16 <= (wire11 ?
                  $unsigned(wire2[(1'h0):(1'h0)]) : (($signed({reg17}) ?
                          reg4[(4'ha):(4'ha)] : wire2[(2'h3):(2'h3)]) ?
                      $unsigned(wire7[(1'h0):(1'h0)]) : (+((^reg13) ~^ reg14))));
              reg17 <= reg14[(4'h8):(2'h2)];
              reg18 <= $unsigned((8'hbb));
            end
          reg19 <= ($signed(($signed(reg18) ? wire1 : (~|$unsigned(reg4)))) ?
              $signed($signed($unsigned($unsigned(wire1)))) : $signed($signed(reg17)));
          reg20 <= wire5;
        end
      else
        begin
          reg15 <= reg19;
          reg16 <= ($signed($signed(((reg20 == reg19) << (^wire9)))) < (|{wire11,
              wire1}));
          reg17 <= ((~^$signed(wire8[(2'h2):(1'h1)])) >>> wire7);
          if ($unsigned({{$unsigned((wire9 << reg16)), reg12},
              ({$signed(reg14), reg20} && (((8'hbc) ?
                  wire10 : wire9) && (^~wire1)))}))
            begin
              reg18 <= (reg12 ~^ (^$unsigned(((+reg16) <<< (wire0 && wire5)))));
              reg19 <= $signed(((($signed(wire9) ^~ (wire10 & reg4)) ?
                      ({(8'haf), reg16} ?
                          (&reg15) : {wire2, wire2}) : {reg19}) ?
                  (wire0 ?
                      $unsigned((^wire9)) : {$unsigned(reg15)}) : (($signed(wire5) ?
                          (reg20 ? reg16 : reg15) : {wire2, (8'had)}) ?
                      wire8[(3'h4):(2'h2)] : $unsigned(((8'ha6) | wire3)))));
              reg20 <= $signed((reg14[(3'h4):(1'h0)] - (8'hb2)));
              reg21 <= (~^(8'ha1));
            end
          else
            begin
              reg18 <= reg17;
              reg19 <= (^(&reg19[(1'h0):(1'h0)]));
            end
          reg22 <= (~^((reg15 >> ($signed(wire5) ?
                  (wire0 ? reg12 : wire3) : (reg4 ? (8'h9d) : wire7))) ?
              wire0[(1'h1):(1'h0)] : $unsigned(((&reg21) || (reg16 ^~ wire11)))));
        end
      reg23 <= wire11[(2'h2):(2'h2)];
    end
  assign wire24 = ($unsigned($signed(((reg20 ?
                      wire5 : wire10) != $signed(reg17)))) * (-reg16));
  always
    @(posedge clk) begin
      if ($signed((reg17 ?
          {$unsigned($unsigned(reg23)), reg4} : $signed(((!reg22) ?
              wire7 : reg4[(4'hc):(2'h3)])))))
        begin
          reg25 <= $unsigned(reg4);
          if ((({wire9[(4'hd):(2'h2)],
              {$signed(reg22),
                  wire11[(2'h3):(1'h0)]}} * $unsigned(((~^reg15) + $signed(reg23)))) ^~ (~^$signed(reg14))))
            begin
              reg26 <= ((-$unsigned(reg23[(1'h1):(1'h1)])) ?
                  ((reg15 ? reg18[(4'h9):(4'h9)] : reg25[(4'ha):(4'h8)]) ?
                      wire1[(1'h1):(1'h0)] : $unsigned($signed(wire5))) : ({{$signed(wire9)},
                          {(~^reg15)}} ?
                      (((reg14 ? wire3 : (8'hb5)) ? reg15 : {wire0}) ?
                          $signed(wire8[(2'h2):(1'h0)]) : {(reg16 ?
                                  reg18 : reg13),
                              reg23}) : $signed((~&(reg19 ^ (8'hb5))))));
              reg27 <= reg22;
              reg28 <= ($signed($unsigned(wire0[(1'h1):(1'h0)])) ?
                  wire3[(1'h1):(1'h1)] : $unsigned(reg13));
              reg29 <= {(!({(~reg13), wire5} & wire1[(4'h8):(3'h5)])),
                  (wire11 ?
                      (wire1 ?
                          (!wire2) : $unsigned($unsigned((8'hbc)))) : reg25)};
              reg30 <= wire11[(1'h0):(1'h0)];
            end
          else
            begin
              reg26 <= $unsigned($signed(($signed($signed(wire6)) * $unsigned(reg13))));
              reg27 <= $unsigned(($signed($signed($unsigned(reg18))) ?
                  $signed($unsigned(reg30)) : reg20));
              reg28 <= (wire8[(2'h3):(2'h2)] ?
                  reg18 : $unsigned($signed({reg14})));
            end
          reg31 <= ($signed($unsigned((|reg29))) ?
              $signed(reg16[(3'h5):(1'h1)]) : ({$unsigned((reg4 ?
                          (8'hbe) : reg15))} ?
                  wire24[(3'h4):(3'h4)] : reg29));
          reg32 <= ((reg20[(1'h1):(1'h0)] && {(wire24[(4'hc):(4'h8)] >> $unsigned(wire5))}) ?
              $signed(((7'h40) || $signed($unsigned(reg12)))) : (!(($signed(reg20) ?
                      (~|reg25) : (wire10 >> reg22)) ?
                  reg19[(3'h6):(2'h3)] : (wire6[(4'he):(2'h2)] ?
                      (reg4 ? wire9 : wire0) : wire1))));
          reg33 <= {(~|reg4[(1'h1):(1'h1)]),
              (^((8'ha1) == wire7[(3'h6):(3'h5)]))};
        end
      else
        begin
          reg25 <= reg29[(2'h3):(2'h2)];
          reg26 <= reg17[(3'h5):(2'h2)];
          reg27 <= wire0;
          reg28 <= ((reg16[(3'h5):(3'h4)] ~^ $unsigned($unsigned((reg23 ?
                  reg15 : wire5)))) ?
              $signed({{(^~reg17), (reg22 && wire3)}}) : reg29[(1'h1):(1'h1)]);
          reg29 <= reg12;
        end
    end
  module34 #() modinst75 (wire74, clk, reg14, reg16, reg15, wire3);
  assign wire76 = (~|({(~reg26), reg33} ?
                      ((wire10 ? (8'hab) : reg32) || ($unsigned((8'h9d)) ?
                          (^reg12) : {reg13})) : $unsigned(reg17[(3'h5):(3'h5)])));
  assign wire77 = $signed(reg17[(4'h8):(2'h3)]);
  assign wire78 = ((&$unsigned(wire7)) ?
                      ($signed((|$unsigned(reg33))) ~^ $unsigned(($unsigned(wire1) ?
                          (~reg29) : wire7))) : {$unsigned(wire5),
                          ((reg26[(4'h9):(1'h1)] ? $signed((8'h9c)) : reg29) ?
                              reg28[(2'h2):(1'h0)] : wire0)});
  assign wire79 = $unsigned($signed($unsigned(wire9)));
  module80 #() modinst111 (wire110, clk, reg30, reg19, wire77, reg21, reg18);
  assign wire112 = ($unsigned((+wire110[(3'h4):(3'h4)])) ?
                       wire11[(1'h1):(1'h1)] : (~&(+(reg26 ?
                           (^reg27) : reg28))));
  assign wire113 = {$unsigned($signed((^(reg32 ? wire9 : wire7)))),
                       (^$unsigned({(&(8'hbb)), (wire74 ^ reg26)}))};
endmodule

module module80
#(parameter param108 = (((((!(8'ha9)) + (^(8'h9e))) + {(|(8'hb4))}) ? (&({(8'ha7)} <<< {(8'ha3)})) : (~^((~|(8'h9e)) ? ((8'ha6) ? (8'hb0) : (8'hbd)) : ((8'hb8) - (8'h9e))))) <<< ((^~{((8'hb8) ~^ (8'h9d)), ((8'hbb) >> (8'hbc))}) ? (((!(7'h40)) - {(8'h9c), (8'hac)}) >>> ({(8'hb5), (8'hac)} ? ((8'haa) <<< (8'hab)) : ((8'hac) ? (8'hbf) : (8'ha1)))) : (8'hab))), 
parameter param109 = {{(((+(8'hb8)) != param108) & (-((8'haa) ? param108 : param108))), param108}})
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire85;
  input wire signed [(5'h11):(1'h0)] wire84;
  input wire [(4'hf):(1'h0)] wire83;
  input wire [(3'h4):(1'h0)] wire82;
  input wire [(4'hf):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire103;
  wire [(5'h15):(1'h0)] wire86;
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire104,
                 wire103,
                 wire86,
                 reg105,
                 reg102,
                 reg101,
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
  assign wire86 = (~|{((~^wire85[(5'h12):(5'h11)]) & $unsigned((wire82 ?
                          wire81 : wire84))),
                      wire84[(3'h4):(1'h0)]});
  always
    @(posedge clk) begin
      reg87 <= (-$signed($signed(wire84)));
      reg88 <= wire85;
      if ((!wire82[(1'h1):(1'h0)]))
        begin
          reg89 <= (wire85[(4'hb):(2'h3)] > ((|(wire82[(3'h4):(2'h2)] ?
              $unsigned(reg87) : $signed(wire83))) * (-$unsigned($unsigned((8'hb7))))));
          reg90 <= $signed(reg87[(3'h6):(2'h2)]);
          reg91 <= reg89[(3'h7):(1'h0)];
          if (((+$signed($unsigned($signed(reg89)))) ?
              reg89[(3'h6):(3'h4)] : reg88[(2'h3):(1'h0)]))
            begin
              reg92 <= {reg91, ($unsigned(reg87) * wire86)};
              reg93 <= $signed((!(wire81[(1'h1):(1'h0)] ?
                  wire86[(4'hd):(3'h5)] : (!((7'h41) ? reg91 : (8'ha4))))));
              reg94 <= ((+({(wire81 ? reg87 : (8'had))} ?
                      reg91 : $unsigned(reg92))) ?
                  $signed($unsigned((reg92[(2'h2):(2'h2)] <<< ((8'haa) || wire84)))) : (($signed((~^(8'h9f))) & $unsigned((8'h9e))) && {{$signed(wire84),
                          ((7'h43) ? wire81 : reg93)}}));
              reg95 <= $unsigned((+(($signed(wire81) >= $unsigned(reg88)) || reg92[(3'h6):(2'h3)])));
              reg96 <= reg89[(1'h1):(1'h1)];
            end
          else
            begin
              reg92 <= (8'hbe);
              reg93 <= $signed($unsigned(reg95[(3'h4):(2'h2)]));
              reg94 <= (reg96[(3'h7):(3'h4)] >> wire82[(3'h4):(1'h0)]);
            end
          reg97 <= reg91;
        end
      else
        begin
          if ((&((^(|$signed(reg91))) ~^ $signed((7'h40)))))
            begin
              reg89 <= $signed((^~((~$unsigned(wire85)) ?
                  ($unsigned(reg89) ?
                      reg93[(2'h3):(1'h1)] : {(8'h9f)}) : $unsigned((reg91 >>> wire86)))));
            end
          else
            begin
              reg89 <= reg88[(4'h8):(2'h3)];
              reg90 <= $signed($signed(wire81));
              reg91 <= (-$signed(($unsigned($signed(wire81)) & $unsigned(reg94[(4'ha):(3'h4)]))));
            end
          reg92 <= (~&((-wire81) ?
              {($unsigned(reg91) ? reg94 : reg97),
                  (reg96[(1'h1):(1'h0)] * $unsigned(reg97))} : $signed((8'had))));
        end
      reg98 <= (wire85[(4'hc):(3'h6)] ?
          ((8'ha0) >= ($unsigned(reg89) ?
              $unsigned(wire82[(3'h4):(2'h2)]) : $unsigned((wire83 ?
                  wire81 : reg94)))) : $unsigned((8'hb4)));
      reg99 <= $signed({$unsigned(wire81[(1'h1):(1'h0)]),
          reg89[(4'hd):(1'h1)]});
    end
  always
    @(posedge clk) begin
      reg100 <= $signed($signed((reg96 ? reg94[(4'h9):(3'h6)] : (~reg92))));
      reg101 <= (!(^$signed(((-reg96) & (wire85 * reg97)))));
      reg102 <= (({wire86} ? $unsigned(reg98[(4'hf):(4'hb)]) : reg93) ?
          wire86[(5'h14):(3'h4)] : ($unsigned(wire82) > (~&$signed(reg100[(2'h2):(1'h1)]))));
    end
  assign wire103 = $signed(((^$unsigned((!wire81))) < (+reg98)));
  assign wire104 = (reg90[(4'hf):(1'h1)] && ($signed(wire86[(5'h15):(2'h2)]) ?
                       (((reg93 <<< reg95) == $signed(reg87)) ?
                           (-reg89) : $unsigned($unsigned((7'h41)))) : (~$signed($unsigned(reg88)))));
  always
    @(posedge clk) begin
      reg105 <= $signed({(($signed(reg92) != (wire81 > reg90)) * (reg94 <= $unsigned((8'hb3)))),
          (~|(&$unsigned(reg94)))});
    end
  assign wire106 = $signed((~(wire85[(3'h6):(3'h6)] >= $signed(wire81[(4'ha):(1'h1)]))));
  assign wire107 = (wire83[(3'h7):(3'h6)] || (|reg92[(4'hf):(4'hc)]));
endmodule

module module34
#(parameter param72 = (&(+((((8'ha5) ? (8'hb4) : (8'hb9)) ? ((8'ha7) ? (8'hae) : (7'h41)) : ((8'ha0) || (8'ha9))) ? ((7'h40) ? ((8'ha5) ? (8'h9f) : (7'h43)) : ((8'hbe) ? (8'hb7) : (8'hbe))) : ((&(8'hb6)) ? ((8'ha9) ? (8'hb0) : (8'hb9)) : ((7'h40) <= (8'ha6)))))), 
parameter param73 = (&(8'h9f)))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire38;
  input wire signed [(3'h6):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(3'h7):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire58,
                 wire57,
                 wire55,
                 wire41,
                 wire40,
                 wire39,
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
                 (1'h0)};
  assign wire39 = $unsigned(($signed($signed({(8'hb4)})) || ((8'hbb) ?
                      wire37 : (|$unsigned(wire37)))));
  assign wire40 = ($signed(wire37[(1'h1):(1'h1)]) ?
                      wire39[(3'h4):(3'h4)] : ({((|wire38) <= $unsigned((8'ha8))),
                              $unsigned(wire35[(3'h4):(3'h4)])} ?
                          {$unsigned(((8'ha5) ^ wire37)),
                              wire38} : $signed((wire36[(2'h3):(1'h1)] >> ((8'ha6) ?
                              wire37 : wire37)))));
  assign wire41 = ($unsigned(wire40) ?
                      {$signed(wire37[(3'h4):(2'h2)]),
                          $signed(wire38[(2'h2):(1'h1)])} : wire36);
  module42 #() modinst56 (wire55, clk, wire41, wire39, wire36, wire40);
  assign wire57 = wire35[(3'h4):(2'h2)];
  assign wire58 = (!$signed($signed((~|(&wire57)))));
  always
    @(posedge clk) begin
      reg59 <= ({wire39} ?
          $unsigned(((^(wire57 ^ wire37)) ?
              (+(wire37 ? wire58 : wire37)) : (^~wire57))) : (wire37 + wire37));
      reg60 <= ((8'hb4) ?
          wire37[(2'h2):(2'h2)] : $unsigned(({wire39[(3'h7):(3'h4)],
              $signed(wire58)} >> wire37[(3'h5):(2'h2)])));
      reg61 <= (8'hac);
      reg62 <= reg60;
      if (wire36[(1'h1):(1'h1)])
        begin
          if (($signed(reg62[(1'h0):(1'h0)]) | $signed(($signed((reg62 >>> reg59)) <<< (&(wire39 ?
              wire41 : (8'hba)))))))
            begin
              reg63 <= (~|$signed((wire39 * wire36)));
              reg64 <= $unsigned(($unsigned($unsigned({reg59})) ?
                  $signed(wire57[(3'h5):(2'h3)]) : wire41[(3'h5):(3'h4)]));
              reg65 <= reg64;
            end
          else
            begin
              reg63 <= (^{{reg62, reg63[(3'h4):(1'h0)]}});
            end
        end
      else
        begin
          if ((wire39[(4'h8):(3'h4)] || $unsigned((~((wire38 && wire40) >>> wire41[(4'hc):(3'h4)])))))
            begin
              reg63 <= (&$unsigned($signed(wire38)));
              reg64 <= $unsigned($unsigned((&$unsigned((wire58 >= wire35)))));
              reg65 <= (^~$signed((|(wire36 ~^ $unsigned(wire39)))));
            end
          else
            begin
              reg63 <= (wire55 ?
                  reg65[(3'h5):(3'h4)] : $unsigned($unsigned(((wire57 ?
                      wire37 : reg63) != (reg61 >> reg63)))));
            end
          if ($signed((reg60 ? wire55 : (~^reg62[(2'h3):(1'h1)]))))
            begin
              reg66 <= $signed((8'ha2));
              reg67 <= reg60;
              reg68 <= reg61[(1'h1):(1'h0)];
            end
          else
            begin
              reg66 <= (reg62[(3'h6):(1'h1)] ?
                  wire36[(3'h6):(2'h3)] : (^$signed(reg62[(2'h2):(1'h1)])));
              reg67 <= (-{$signed($unsigned(reg63[(1'h0):(1'h0)])), wire58});
            end
          reg69 <= $unsigned(reg62);
        end
    end
  assign wire70 = wire58;
  assign wire71 = (|reg69[(4'hf):(4'hd)]);
endmodule

module module42
#(parameter param53 = ((^~(((~(8'hab)) > (+(8'hb0))) ? (~&(^(7'h42))) : ((~&(8'had)) & (!(8'ha1))))) <= (((~|((8'h9f) ^~ (8'had))) >>> {((8'hae) ? (7'h41) : (8'hbf)), ((7'h44) == (8'had))}) - (((~&(8'ha8)) ? ((8'hb9) ? (8'ha0) : (8'ha6)) : ((8'hb5) ? (8'h9d) : (8'hbf))) ? (+(~^(8'h9f))) : {((7'h40) ? (8'ha7) : (8'hac)), ((8'h9f) ? (8'ha6) : (8'h9c))}))), 
parameter param54 = param53)
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire46;
  input wire [(4'ha):(1'h0)] wire45;
  input wire [(4'h8):(1'h0)] wire44;
  input wire [(4'ha):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  assign y = {wire50, wire48, wire47, reg52, reg51, reg49, (1'h0)};
  assign wire47 = (((^wire44) || $unsigned(wire43[(1'h1):(1'h0)])) ?
                      (~&((^(wire46 ?
                          wire44 : (8'hbb))) - (~&wire44))) : (&(((wire44 ?
                                  wire44 : (8'hbc)) ?
                              (~|wire45) : (~&wire45)) ?
                          $unsigned({wire44}) : ($unsigned(wire44) ?
                              wire44 : $signed(wire44)))));
  assign wire48 = (((~&$signed(wire43)) >> wire43[(3'h4):(1'h1)]) ?
                      $signed(wire46[(1'h0):(1'h0)]) : wire43[(4'ha):(4'h8)]);
  always
    @(posedge clk) begin
      reg49 <= wire43[(3'h6):(3'h5)];
    end
  assign wire50 = wire43;
  always
    @(posedge clk) begin
      reg51 <= wire44;
      reg52 <= wire44[(3'h7):(3'h7)];
    end
endmodule
