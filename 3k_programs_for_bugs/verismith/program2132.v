module top
#(parameter param115 = (((~^((~&(8'ha8)) <= ((8'hba) && (7'h41)))) ? (({(8'hbb)} ? {(8'haf)} : (+(8'ha1))) ? {((8'hb6) ? (8'hb8) : (8'h9d)), (~|(8'hae))} : (((8'hb6) == (7'h44)) + (-(8'ha7)))) : {(~&{(8'hb0)}), ((+(8'h9d)) >> (^~(7'h42)))}) ~^ ({({(8'hb6)} ? {(8'ha5), (7'h41)} : ((8'hbe) ? (8'ha3) : (7'h42))), (((8'hb2) <= (8'hb2)) * (~&(8'hbe)))} != ((((8'had) ? (8'hb3) : (8'hb0)) ~^ ((8'hbb) ^ (8'ha2))) ? {((8'ha6) + (8'hae)), ((7'h42) ? (8'haf) : (8'h9c))} : (~|((8'h9f) ? (8'hac) : (8'hb0)))))), 
parameter param116 = param115)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire100;
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(4'hf):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire102,
                 wire100,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  module5 #() modinst101 (.wire9(wire4), .wire8(wire0), .y(wire100), .wire6(wire1), .wire7(wire2), .clk(clk));
  assign wire102 = ((8'hb6) ?
                       (!$unsigned((7'h43))) : {(&wire100[(3'h7):(3'h6)]),
                           (|{(wire3 ? wire0 : wire100), {wire3}})});
  always
    @(posedge clk) begin
      reg103 <= $unsigned($unsigned($signed(((+wire4) ? wire0 : wire102))));
    end
  always
    @(posedge clk) begin
      reg104 <= $unsigned((({(wire4 ? wire4 : (8'ha2))} && $unsigned(((8'ha7) ?
              wire100 : reg103))) ?
          {$unsigned(wire100[(1'h0):(1'h0)])} : $signed($unsigned(wire3))));
      reg105 <= $signed((wire3[(4'ha):(1'h1)] ?
          {((reg104 ? reg104 : wire100) ?
                  $unsigned(wire2) : (wire100 ? wire1 : wire4)),
              ((wire4 ? wire3 : wire3) ?
                  (reg104 ? wire1 : wire100) : {wire1,
                      wire1})} : $unsigned(((wire3 ? (8'ha1) : wire100) ?
              wire1 : (wire3 ? wire2 : wire2)))));
      if (wire2)
        begin
          if (wire0)
            begin
              reg106 <= (reg104[(4'h8):(3'h5)] ~^ ((8'ha4) ?
                  (($signed(wire102) << (wire4 ? wire2 : wire1)) ?
                      reg105[(4'hd):(2'h3)] : (-(~wire2))) : $signed($signed(wire100))));
              reg107 <= (^$unsigned({(|(wire1 ? (8'hb9) : reg106)),
                  (~|$signed(wire1))}));
              reg108 <= (wire3[(2'h3):(1'h1)] ?
                  $signed((+(~|(wire102 & wire3)))) : (wire100[(3'h6):(3'h4)] >= (&wire4)));
              reg109 <= ($signed({reg108}) ?
                  wire2 : $unsigned(({$unsigned((8'ha8))} & $unsigned(wire4[(4'hc):(4'hb)]))));
            end
          else
            begin
              reg106 <= ($unsigned({$signed(reg105[(4'h8):(3'h4)]),
                      $signed($unsigned(wire2))}) ?
                  $signed($signed(wire4)) : $unsigned(reg103[(2'h2):(1'h1)]));
              reg107 <= wire102;
              reg108 <= $signed(wire0);
              reg109 <= ((wire100 ~^ ($unsigned(wire102[(3'h5):(1'h1)]) ?
                  wire0 : $unsigned((wire102 ?
                      wire2 : reg108)))) <<< wire102[(4'h8):(3'h6)]);
              reg110 <= ({($signed((wire0 ? reg104 : reg105)) ?
                          wire100 : ((^~reg104) ~^ $unsigned(wire4))),
                      wire2} ?
                  reg109[(4'ha):(4'h8)] : $signed($signed((8'ha2))));
            end
          reg111 <= $signed((~|$unsigned(({wire1, reg106} ?
              reg104[(4'he):(4'he)] : (wire0 ? reg105 : reg108)))));
          reg112 <= ((reg103[(3'h4):(2'h3)] ?
              wire3 : $signed(reg111[(3'h7):(3'h5)])) > ($signed(wire2[(1'h1):(1'h1)]) & (reg108 ?
              $signed(reg106[(4'hc):(4'hb)]) : $signed($unsigned(reg104)))));
        end
      else
        begin
          reg106 <= ((^(({reg109} ?
              wire3[(1'h1):(1'h1)] : $signed(reg108)) * (8'haa))) && ($signed(((reg111 ?
              wire100 : reg105) < (reg104 ~^ wire3))) <<< $unsigned(reg108)));
          reg107 <= wire1[(4'hb):(3'h4)];
          reg108 <= {wire3[(1'h0):(1'h0)]};
          if ((~|(~&$signed($signed((reg104 ? wire0 : wire0))))))
            begin
              reg109 <= $unsigned($unsigned($unsigned(reg103)));
              reg110 <= reg112;
              reg111 <= {reg108[(2'h2):(1'h1)]};
              reg112 <= (wire1[(2'h3):(2'h2)] ?
                  (~&$unsigned(wire2[(1'h1):(1'h0)])) : reg110);
            end
          else
            begin
              reg109 <= $signed(((($signed((8'ha3)) ?
                      {wire1} : reg111[(5'h13):(5'h13)]) ?
                  (~&(wire2 ?
                      wire0 : reg104)) : $signed((|reg112))) - (-(!(wire2 ?
                  wire100 : reg106)))));
            end
        end
    end
  assign wire113 = reg106;
  assign wire114 = (~^$unsigned(wire113));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire96;
  wire [(5'h12):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire69;
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire96,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire10,
                 wire11,
                 wire13,
                 wire69,
                 reg12,
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
                 (1'h0)};
  assign wire10 = $unsigned(wire7[(3'h4):(1'h1)]);
  assign wire11 = (wire7 ?
                      wire7[(3'h7):(3'h4)] : (wire7 && $signed({$signed(wire10)})));
  always
    @(posedge clk) begin
      reg12 <= {$signed($signed({(|wire6), {wire11}}))};
    end
  assign wire13 = wire9[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg14 <= (wire6 ? (~wire9[(2'h2):(2'h2)]) : wire7);
      if ({(+(((wire13 ? reg14 : wire10) ? $unsigned(wire11) : $signed(reg14)) ?
              (!reg12) : ($unsigned(wire8) ? {wire13} : $signed(wire13)))),
          (7'h40)})
        begin
          reg15 <= ($unsigned($unsigned((((7'h41) == wire10) ?
              (reg14 != wire11) : $signed(wire10)))) >>> wire7);
          if ({($signed($unsigned(wire7)) * wire10[(3'h4):(1'h1)]),
              (reg14 - $signed($signed($signed((8'ha1)))))})
            begin
              reg16 <= $unsigned((+(wire6 ?
                  $signed($signed(wire8)) : wire10[(2'h3):(1'h1)])));
            end
          else
            begin
              reg16 <= (|({(reg16 ? wire7[(4'h9):(3'h6)] : $unsigned((8'hb5))),
                      $signed((~wire10))} ?
                  $unsigned({wire7[(1'h0):(1'h0)]}) : (reg12[(1'h1):(1'h1)] ?
                      wire11 : (~^{wire9, wire10}))));
              reg17 <= (8'hb7);
              reg18 <= $signed($unsigned($signed((!(wire6 >>> reg12)))));
              reg19 <= $signed({wire10});
              reg20 <= reg19[(3'h6):(1'h1)];
            end
          reg21 <= $unsigned((reg18[(4'hb):(4'hb)] ?
              wire7[(3'h6):(2'h2)] : $signed(reg17[(2'h3):(1'h1)])));
          if (reg17[(2'h2):(1'h1)])
            begin
              reg22 <= reg14;
              reg23 <= (((wire8[(2'h3):(1'h0)] < $unsigned($unsigned((8'hbd)))) == $unsigned($unsigned((wire7 > reg19)))) ~^ {(~|$signed(((7'h43) ?
                      (8'had) : wire7)))});
              reg24 <= reg21[(3'h5):(3'h4)];
            end
          else
            begin
              reg22 <= wire10;
              reg23 <= wire10;
            end
          if (((wire9[(3'h6):(1'h0)] ?
              (((^~(8'hb5)) >>> reg23) ?
                  (~&(^reg12)) : ((8'hbd) ?
                      reg14[(1'h1):(1'h1)] : $unsigned(wire10))) : ((8'hb3) & {wire7})) && $unsigned((~^$signed((|reg15))))))
            begin
              reg25 <= wire6[(3'h5):(3'h5)];
              reg26 <= (~|reg17);
              reg27 <= (-($signed({wire8}) >> wire13[(3'h5):(2'h2)]));
              reg28 <= $unsigned(((8'ha0) ?
                  $signed((reg27[(2'h2):(2'h2)] <= (wire13 ?
                      reg24 : reg27))) : (8'hab)));
            end
          else
            begin
              reg25 <= ({(^~{reg12})} ?
                  reg26 : (wire7[(3'h7):(1'h1)] ?
                      reg17 : ($unsigned(wire8) ?
                          ({reg27} ?
                              wire13[(3'h4):(1'h0)] : $unsigned(wire9)) : ({wire10,
                              reg20} >>> reg21))));
              reg26 <= (~&reg15);
              reg27 <= $signed($signed((($signed(wire13) == (wire7 ?
                      (8'had) : reg14)) ?
                  $signed((reg26 ? (8'ha8) : wire8)) : reg15[(3'h6):(1'h0)])));
            end
        end
      else
        begin
          reg15 <= reg24[(4'hb):(2'h2)];
        end
      reg29 <= (reg22[(3'h4):(2'h3)] ? (8'ha0) : $signed(reg20[(3'h6):(2'h3)]));
      if ($unsigned((~|(~^({wire9, reg12} ? (reg19 > reg23) : (^~(8'hbc)))))))
        begin
          reg30 <= $signed(((reg25 ?
              reg12[(4'hc):(2'h3)] : (~|reg16)) | {(~reg21[(1'h0):(1'h0)])}));
          if (reg28[(2'h2):(1'h1)])
            begin
              reg31 <= ((8'hab) ?
                  $signed($unsigned($unsigned((reg17 | reg15)))) : {($signed($unsigned(wire10)) < (8'haa)),
                      (8'hb6)});
              reg32 <= ((!(~$unsigned((wire7 ? reg31 : reg21)))) == reg25);
              reg33 <= ($signed((reg15 <<< $unsigned((8'hab)))) ^ ($signed((reg19[(3'h7):(3'h7)] ?
                      ((8'ha7) == (8'ha5)) : $unsigned((8'ha3)))) ?
                  reg18[(3'h6):(1'h0)] : (^((reg15 ?
                      reg23 : wire7) || $signed(reg15)))));
              reg34 <= $unsigned(reg17);
              reg35 <= reg28[(1'h1):(1'h1)];
            end
          else
            begin
              reg31 <= $signed((^(&wire7[(4'h8):(1'h1)])));
              reg32 <= (((reg20 + reg23) == (($signed((8'ha0)) ?
                      $unsigned(reg19) : (|(7'h43))) | (reg23[(1'h0):(1'h0)] << wire6[(2'h2):(1'h1)]))) ?
                  $signed($signed($unsigned($unsigned(wire10)))) : $signed((-{reg12,
                      $unsigned(reg33)})));
              reg33 <= ((reg28[(3'h4):(1'h1)] ?
                  ((^~(wire13 ? wire9 : reg20)) >= reg33) : ({{reg30},
                      (reg29 <<< reg14)} < (reg22 ?
                      (wire7 ? reg15 : reg25) : (reg28 >> reg19)))) || (reg28 ?
                  $signed($unsigned((reg22 ?
                      wire11 : reg15))) : (($signed((8'h9e)) ?
                      (~wire11) : $signed(reg33)) > reg30)));
              reg34 <= wire8;
            end
        end
      else
        begin
          if ((|reg28))
            begin
              reg30 <= (~&reg23);
              reg31 <= $signed({$signed($unsigned({reg28, reg35})),
                  ($signed((reg27 ? reg27 : reg19)) ? reg32 : reg16)});
              reg32 <= ($unsigned($signed({$unsigned(wire10)})) == $unsigned(reg18[(4'hc):(3'h4)]));
              reg33 <= ({($unsigned(reg14) ?
                      $signed(reg14) : (+(wire7 ? reg28 : (8'hbb))))} | reg21);
            end
          else
            begin
              reg30 <= $signed(($unsigned(reg14[(3'h4):(2'h3)]) ?
                  wire11[(4'h9):(3'h5)] : {reg12[(4'hc):(3'h7)],
                      ({reg16} ? (~|reg23) : (reg28 - reg16))}));
            end
        end
    end
  module36 #() modinst70 (.wire39(reg23), .clk(clk), .wire38(wire10), .wire37(reg25), .wire40(reg20), .y(wire69));
  assign wire71 = (((wire10[(2'h3):(1'h1)] ?
                          ((reg21 ?
                              wire9 : wire6) == $unsigned((8'haa))) : $signed($unsigned(reg27))) ?
                      {(8'hbc)} : $signed(wire11)) | (({(~^reg24)} ?
                      (reg15[(1'h1):(1'h0)] >> wire6) : reg14[(1'h0):(1'h0)]) ^~ ((wire13[(3'h7):(1'h0)] <= reg14) ?
                      reg16[(1'h1):(1'h0)] : (^~(reg22 ? wire9 : wire8)))));
  assign wire72 = $unsigned($signed(reg14));
  assign wire73 = $signed($unsigned((&reg22[(3'h4):(3'h4)])));
  assign wire74 = (((reg15[(1'h0):(1'h0)] << (((8'hb8) == wire7) ?
                          wire69[(2'h3):(2'h2)] : (wire10 ? reg20 : wire6))) ?
                      $unsigned((wire6 ?
                          $signed(wire13) : ((8'hb8) ?
                              reg18 : reg12))) : reg24) < reg35);
  module75 #() modinst97 (wire96, clk, reg20, reg34, reg17, reg25);
  assign wire98 = ($unsigned((reg18[(3'h4):(2'h2)] ?
                          (reg14 ?
                              (-reg24) : reg35[(2'h2):(2'h2)]) : $unsigned((reg16 || wire8)))) ?
                      $unsigned((^reg34[(4'h8):(2'h2)])) : $signed($signed($signed(((8'hb6) ?
                          reg28 : reg19)))));
  assign wire99 = (((wire9 >>> $signed((wire71 ?
                      reg27 : reg24))) > ((^~(wire11 ?
                      wire74 : reg32)) | (^~(wire71 ?
                      reg20 : reg21)))) * wire7);
endmodule

module module75
#(parameter param95 = {(~&{(^(^~(8'haf))), (((8'hb1) - (8'hbe)) || ((8'hb2) ? (8'ha9) : (8'had)))}), (8'ha2)})
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire79;
  input wire [(4'hb):(1'h0)] wire78;
  input wire [(3'h7):(1'h0)] wire77;
  input wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire signed [(4'h8):(1'h0)] wire89;
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((&wire78[(4'ha):(3'h4)]))
        begin
          reg80 <= $signed($unsigned(((~$signed(wire78)) ?
              $signed((wire78 ?
                  wire76 : wire78)) : $signed($unsigned(wire76)))));
          reg81 <= $unsigned(({$signed($signed(wire77)),
              (-(wire78 ? wire79 : (8'hb4)))} - wire76));
          reg82 <= $signed($signed((+((8'hab) ? $signed(wire79) : reg81))));
          reg83 <= wire77[(1'h0):(1'h0)];
        end
      else
        begin
          reg80 <= $unsigned(((+(~&(^~wire78))) <= reg83));
          reg81 <= (8'hba);
        end
      if ({$unsigned(wire77)})
        begin
          reg84 <= $signed((($signed((wire78 * (8'ha3))) ?
                  $signed($unsigned(reg82)) : (~|(wire77 < reg82))) ?
              (~&{$unsigned(wire76),
                  $unsigned(wire79)}) : (~|{$unsigned(wire77), wire78})));
        end
      else
        begin
          reg84 <= ($unsigned($signed(wire77[(3'h5):(3'h5)])) || ((~|$signed((!wire76))) ?
              {{reg82}} : (((!reg83) >= (~^wire78)) - (reg83[(3'h6):(1'h1)] ?
                  reg80[(3'h4):(1'h0)] : wire78[(3'h4):(2'h3)]))));
          reg85 <= $unsigned((~&$unsigned($unsigned((reg82 ?
              wire79 : reg84)))));
          reg86 <= wire76[(1'h1):(1'h1)];
        end
      reg87 <= reg82;
      reg88 <= (~|(-reg82[(5'h11):(3'h7)]));
    end
  assign wire89 = wire79;
  assign wire90 = {$signed((~($signed(reg86) > {wire76, reg84})))};
  assign wire91 = (+(wire78 >= reg86[(1'h1):(1'h1)]));
  assign wire92 = ($unsigned(($signed({reg85}) ?
                          ((~&reg86) > wire91[(2'h2):(2'h2)]) : reg80[(4'hb):(4'hb)])) ?
                      ((!wire90) | $unsigned($unsigned((reg87 ?
                          reg88 : (8'hac))))) : (^$signed(reg88)));
  assign wire93 = $unsigned(wire91);
  assign wire94 = (-(^{reg87[(1'h0):(1'h0)]}));
endmodule

module module36
#(parameter param68 = {(((((8'hb8) | (8'haa)) ^ {(7'h43), (8'ha8)}) ? (|(~&(8'h9e))) : (8'ha5)) * {(^~((8'hae) ? (8'hbd) : (8'ha3))), (((8'haa) ? (8'h9f) : (8'ha6)) ? (8'haa) : (|(8'hb9)))}), ((~({(8'ha9), (8'hba)} ? ((8'h9d) ~^ (8'hb6)) : ((8'hb0) - (8'hbb)))) ? (|{(8'hb5), (!(8'hbe))}) : (((~^(8'hba)) & (^~(8'hae))) || (+{(8'hb9), (8'ha6)})))})
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire40;
  input wire signed [(3'h4):(1'h0)] wire39;
  input wire signed [(5'h12):(1'h0)] wire38;
  input wire signed [(4'hb):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire41 = (((-($unsigned(wire39) ?
                              $unsigned(wire39) : wire38[(3'h6):(3'h4)])) ?
                          wire38[(3'h5):(1'h0)] : (8'hb7)) ?
                      (^~(wire40[(2'h3):(2'h3)] > $signed((wire37 ?
                          (8'haa) : wire37)))) : ((wire40[(3'h7):(3'h4)] <= $signed((wire39 != wire39))) & (^~{wire40})));
  assign wire42 = (wire40[(3'h6):(3'h4)] ?
                      (8'hbc) : {(((wire38 ? wire40 : wire40) ?
                              wire38 : $signed(wire38)) ~^ (wire41[(3'h6):(3'h5)] ?
                              $unsigned(wire37) : wire40[(3'h7):(3'h6)])),
                          ($unsigned((wire41 + wire39)) ?
                              ((wire38 >= wire38) && wire41[(3'h5):(3'h5)]) : wire37[(2'h3):(2'h2)])});
  assign wire43 = {(wire41 ?
                          {$signed({wire39}),
                              {(wire38 ?
                                      wire42 : (8'hbf))}} : {(|(wire38 ~^ wire41)),
                              $unsigned((~&(8'ha7)))}),
                      ($signed({$signed(wire40)}) ?
                          {(!(~|wire39)), wire41} : wire41)};
  assign wire44 = (((!(wire39[(1'h1):(1'h1)] + $unsigned(wire41))) >>> wire43) ?
                      wire39[(1'h0):(1'h0)] : (~&$unsigned($signed((wire39 ?
                          wire42 : wire42)))));
  assign wire45 = ((~&$unsigned(($signed(wire40) <= (~^wire40)))) ?
                      (~^((!$signed((8'hbb))) ?
                          {(wire38 > wire38)} : (~^wire39))) : $signed($unsigned({(wire37 > (8'ha9)),
                          {wire41}})));
  assign wire46 = (|(({{wire42},
                          $signed(wire42)} ^ ($signed(wire37) > (~wire39))) ?
                      wire42[(4'ha):(3'h4)] : (wire37[(2'h2):(1'h1)] <= wire44)));
  assign wire47 = wire39[(3'h4):(2'h3)];
  assign wire48 = wire45[(2'h2):(1'h0)];
  assign wire49 = {wire40[(2'h3):(2'h2)],
                      ((^~((~^wire46) ?
                              wire42[(4'hc):(3'h6)] : {wire39, wire41})) ?
                          (&(8'ha7)) : wire40)};
  always
    @(posedge clk) begin
      if ((8'h9c))
        begin
          if (wire43)
            begin
              reg50 <= wire39[(2'h3):(1'h0)];
              reg51 <= (8'h9d);
              reg52 <= ((wire45 <<< $signed(reg51)) ^~ $signed($signed(wire44[(3'h5):(3'h5)])));
            end
          else
            begin
              reg50 <= $signed({wire40});
              reg51 <= wire44[(3'h4):(3'h4)];
              reg52 <= (((~&{((8'hb9) ? wire38 : wire37),
                      wire46[(3'h6):(2'h2)]}) && $unsigned($unsigned(wire37))) ?
                  $signed((((~|wire47) << ((7'h44) >= wire39)) * $signed(wire42))) : (wire49 > $signed({reg52})));
            end
          reg53 <= {({((8'hb1) ? $signed(reg51) : {wire38})} < (wire42 ?
                  (~^$unsigned(wire37)) : wire43[(3'h6):(3'h4)])),
              {$unsigned($unsigned((reg52 ? (8'haf) : wire42)))}};
        end
      else
        begin
          reg50 <= (&(!$unsigned($signed((wire44 ? wire45 : wire44)))));
          if ((-(+wire40[(4'h9):(3'h6)])))
            begin
              reg51 <= wire45[(2'h2):(2'h2)];
              reg52 <= {$unsigned((((wire40 ? wire43 : wire38) ?
                      wire49 : reg51[(2'h3):(2'h2)]) >> $unsigned(wire38[(4'ha):(2'h2)])))};
              reg53 <= (8'h9c);
            end
          else
            begin
              reg51 <= ((reg50 >> (+wire45[(2'h3):(2'h3)])) ^ $unsigned($unsigned($signed((^~wire42)))));
              reg52 <= $unsigned((8'ha3));
              reg53 <= (+(8'ha8));
              reg54 <= $unsigned($signed($unsigned((~^((8'hb6) > reg53)))));
              reg55 <= ($signed($unsigned({(reg53 ?
                      reg53 : wire46)})) <<< (wire44 >>> $signed($signed($unsigned(wire46)))));
            end
        end
      reg56 <= wire44;
    end
  assign wire57 = (~&(~|$signed(($unsigned((7'h42)) ?
                      (^wire40) : (wire44 ? reg55 : (8'hbc))))));
  assign wire58 = (wire48[(4'hc):(3'h5)] ?
                      (~&(~^$unsigned($signed(wire45)))) : wire45[(1'h0):(1'h0)]);
  assign wire59 = reg54;
  assign wire60 = ((^$signed((wire42 ~^ $signed((8'hbd))))) >> (wire42[(4'hc):(3'h6)] && wire45));
  assign wire61 = $signed({(^~reg50[(2'h2):(1'h0)])});
  assign wire62 = reg52[(3'h6):(2'h3)];
  assign wire63 = (^(reg56 ? (8'hb6) : {$unsigned($signed(wire44))}));
  assign wire64 = wire48;
  assign wire65 = (((((^wire40) ?
                          {reg50,
                              wire38} : reg56[(3'h4):(1'h0)]) | wire45[(2'h2):(2'h2)]) ?
                      wire40[(3'h7):(3'h6)] : wire40[(3'h7):(3'h6)]) & ((({reg52,
                              (8'hb9)} + (wire59 ? wire41 : wire61)) ?
                          (~|(reg53 ^ wire44)) : $unsigned(wire42[(4'hd):(4'hd)])) ?
                      (~&(^~{wire49, wire57})) : reg52));
  assign wire66 = reg52;
  assign wire67 = ($signed((8'hbb)) < $signed($unsigned($signed((wire59 << wire45)))));
endmodule
