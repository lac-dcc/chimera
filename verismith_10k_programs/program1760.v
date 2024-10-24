module top
#(parameter param97 = ((&{(((7'h41) > (8'ha3)) ? (|(8'hbb)) : ((8'ha2) ? (8'hae) : (8'hb2))), (((8'hab) >> (8'had)) >>> ((7'h43) >>> (8'hbc)))}) && ({(((8'hbc) ? (8'ha1) : (8'ha2)) ? ((7'h41) ? (8'haa) : (8'hab)) : ((8'hb6) ? (8'hbe) : (8'hb2))), (((8'hbf) || (8'hb0)) * ((8'ha4) ? (8'hb9) : (8'hbc)))} >= {{(~(8'hba)), ((8'hb3) ? (8'hae) : (8'ha9))}})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire23;
  assign y = {wire96, wire95, wire93, wire26, wire25, wire5, wire23, (1'h0)};
  assign wire5 = $unsigned($unsigned($signed(wire4)));
  module6 #() modinst24 (.wire10(wire4), .wire11(wire2), .wire8(wire5), .y(wire23), .wire9(wire3), .wire7(wire1), .clk(clk));
  assign wire25 = (+{wire2, (&wire2)});
  assign wire26 = wire1[(3'h5):(1'h0)];
  module27 #() modinst94 (.wire28(wire2), .wire30(wire1), .clk(clk), .wire29(wire23), .y(wire93), .wire31(wire5));
  assign wire95 = $unsigned(wire25);
  assign wire96 = {wire0};
endmodule

module module27
#(parameter param92 = (((+({(8'h9e)} | (|(8'hbc)))) | {(((8'hb5) ? (8'hba) : (8'h9e)) ? ((8'h9d) ? (8'h9f) : (8'ha4)) : (+(8'hab)))}) <= (&{(((8'ha3) ? (8'hb0) : (8'hb6)) ~^ (+(8'hb4))), ((^(8'hb3)) ? (^~(8'hb9)) : (8'hb1))})))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h219):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(3'h6):(1'h0)] wire29;
  input wire [(5'h12):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire46;
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire52,
                 wire49,
                 wire48,
                 wire46,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
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
                 reg71,
                 reg70,
                 reg69,
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
                 reg53,
                 reg51,
                 reg50,
                 (1'h0)};
  module32 #() modinst47 (wire46, clk, wire31, wire29, wire30, wire28, (8'ha0));
  assign wire48 = (^wire30);
  assign wire49 = wire31;
  always
    @(posedge clk) begin
      reg50 <= ((((wire48[(3'h5):(3'h5)] ~^ wire31) || wire49[(1'h1):(1'h1)]) ?
              $signed((~|wire31)) : (wire31[(4'h8):(2'h2)] ?
                  $unsigned((^~wire31)) : $signed($unsigned(wire48)))) ?
          ($signed((wire28 >= ((8'hbf) < (8'hbf)))) ?
              wire28[(5'h12):(4'hc)] : (wire46 ?
                  (wire48[(4'ha):(4'ha)] ?
                      $signed(wire28) : (+wire46)) : wire30[(4'hf):(4'hc)])) : wire30);
      reg51 <= ((7'h41) >= (((wire46[(3'h4):(1'h0)] ?
              wire29[(3'h6):(3'h4)] : (wire46 ? wire48 : wire49)) ?
          $signed(wire48[(4'hb):(4'h9)]) : (wire48[(3'h6):(3'h6)] ?
              (wire31 & wire30) : {wire29,
                  wire48})) << $unsigned((wire46 && reg50[(1'h1):(1'h0)]))));
    end
  assign wire52 = ({$signed({wire31[(4'hc):(4'ha)], $signed(wire30)}),
                      (wire28 * ((8'ha3) >>> wire30[(4'hb):(1'h1)]))} >> wire30[(4'hf):(4'h8)]);
  always
    @(posedge clk) begin
      if (wire29[(3'h5):(2'h2)])
        begin
          reg53 <= {$unsigned(wire52[(4'ha):(3'h4)])};
          reg54 <= ($signed(reg51) ?
              (((&(wire46 >>> wire31)) ?
                      $unsigned(wire29[(1'h0):(1'h0)]) : $unsigned((wire29 ?
                          wire48 : reg53))) ?
                  (^wire31) : $unsigned(wire28[(2'h2):(1'h0)])) : $signed(reg51[(5'h10):(3'h4)]));
          reg55 <= ((-$unsigned(wire48[(3'h5):(3'h4)])) ?
              (-($unsigned((wire52 <<< wire30)) ?
                  ((wire46 ?
                      wire28 : (7'h41)) < $unsigned(wire46)) : (&((8'ha8) ?
                      wire52 : (8'hbc))))) : wire31[(4'hb):(4'h8)]);
        end
      else
        begin
          reg53 <= $unsigned((8'hbe));
          if ((($unsigned((8'hbc)) > ((!reg51) >= $unsigned(wire48[(4'hb):(1'h1)]))) | ((~(!reg55)) <<< reg51)))
            begin
              reg54 <= wire30[(5'h10):(4'ha)];
            end
          else
            begin
              reg54 <= ({{reg50}} ?
                  {$signed(reg55[(1'h1):(1'h0)])} : ((+(wire28 ?
                      wire29 : (reg51 > wire52))) ~^ ($unsigned(((8'hba) ?
                          wire48 : wire46)) ?
                      wire30 : wire30)));
              reg55 <= (^~$signed(($unsigned((wire29 ?
                  wire31 : wire46)) > (((8'hb2) >= reg55) ? wire46 : wire31))));
            end
          if (reg50)
            begin
              reg56 <= reg51;
              reg57 <= (wire31[(2'h3):(2'h3)] <<< reg53);
            end
          else
            begin
              reg56 <= $signed(reg51[(4'hc):(3'h7)]);
              reg57 <= (((~^wire48) ?
                  $signed((8'ha1)) : reg50[(1'h1):(1'h1)]) ~^ $unsigned(((~|$unsigned(reg55)) ?
                  reg50[(2'h2):(1'h1)] : (wire48[(3'h7):(3'h7)] >> $signed((8'had))))));
              reg58 <= $unsigned((((-$unsigned(wire28)) ?
                  ({reg53, wire49} > (~reg56)) : ((reg53 >= wire52) ?
                      $unsigned(reg53) : reg54[(3'h5):(3'h5)])) & ($unsigned((-reg53)) << {(wire28 ?
                      reg54 : (8'hb8))})));
              reg59 <= $unsigned(wire46);
              reg60 <= ($unsigned((8'hba)) | $signed($signed($signed($signed(reg59)))));
            end
          reg61 <= ((~&(wire31[(3'h5):(2'h3)] - (~&{(8'hb5), reg56}))) ?
              (((reg51[(4'h9):(3'h6)] >= reg50[(1'h1):(1'h0)]) - ((reg56 ^ wire49) >>> $unsigned(reg54))) ?
                  ({wire46, wire31} ?
                      $signed((~^wire28)) : $signed(((8'hba) && (7'h42)))) : $unsigned((wire30 ?
                      ((8'ha3) ? wire30 : wire29) : reg57))) : wire48);
        end
      if (((8'hb0) >= wire49))
        begin
          reg62 <= $unsigned(((($unsigned(wire30) - (wire52 == (8'ha1))) ?
                  (wire28 ? (+(8'hba)) : $signed((8'ha8))) : $signed({reg57,
                      reg57})) ?
              {{$signed(reg57)}} : wire46[(2'h2):(1'h0)]));
        end
      else
        begin
          if ($signed((($unsigned($signed((7'h42))) ? wire30 : (-wire48)) ?
              ((reg50 ? wire52 : reg53) != $signed((wire28 ?
                  (8'ha5) : (7'h41)))) : $unsigned(reg50))))
            begin
              reg62 <= (((8'hab) >> $unsigned($signed($unsigned(wire48)))) ?
                  $unsigned($unsigned((~^$signed(reg51)))) : $unsigned(wire30[(3'h7):(3'h7)]));
            end
          else
            begin
              reg62 <= ((wire48 ? reg57 : $signed((~|{reg61}))) ?
                  reg61 : $unsigned(wire31[(4'hb):(3'h4)]));
              reg63 <= $signed($unsigned(reg55));
              reg64 <= (|(wire29[(3'h4):(1'h1)] ?
                  reg58[(3'h5):(2'h3)] : ($unsigned((wire46 ~^ (8'ha9))) ?
                      wire49 : ($signed(wire31) && ((8'hb2) - wire48)))));
            end
        end
      reg65 <= {wire30[(1'h0):(1'h0)]};
    end
  assign wire66 = (~&(~&((~&(&wire28)) ?
                      (^~reg62[(3'h4):(3'h4)]) : (&(8'ha6)))));
  assign wire67 = ($signed($unsigned(reg56)) >>> {((8'hb1) ?
                          $signed($signed(reg54)) : $unsigned(reg64))});
  assign wire68 = $unsigned((((-(wire30 ? reg61 : (8'ha8))) ?
                          ((~^(8'hbf)) ?
                              (reg62 ?
                                  wire48 : reg51) : $unsigned(wire52)) : wire67[(4'hc):(3'h7)]) ?
                      (~&reg62[(4'h9):(1'h0)]) : $unsigned((wire66 ?
                          (~^(7'h40)) : (wire48 + wire30)))));
  always
    @(posedge clk) begin
      reg69 <= reg50;
      reg70 <= (wire67[(4'hc):(2'h3)] ?
          (({$signed(wire52)} ?
              wire49[(1'h1):(1'h1)] : (|(wire52 < reg55))) <= reg64[(3'h7):(1'h0)]) : reg69[(1'h0):(1'h0)]);
      if ((($unsigned({(-reg61)}) ?
          ((wire30 | (reg60 > wire28)) < (~^$unsigned(reg59))) : $unsigned(((reg53 ?
                  wire30 : reg51) ?
              (^~(8'hb7)) : (reg65 ?
                  wire66 : wire30)))) * (^reg51[(3'h7):(2'h2)])))
        begin
          if (reg70[(2'h2):(2'h2)])
            begin
              reg71 <= wire29[(1'h0):(1'h0)];
              reg72 <= (((reg69[(1'h1):(1'h0)] >>> reg71) ?
                      $unsigned((~|(wire48 ? reg59 : reg60))) : reg59) ?
                  ($unsigned(reg50) || $unsigned(reg70[(4'h8):(2'h2)])) : $unsigned($unsigned($signed(reg65))));
              reg73 <= ($unsigned({$unsigned(reg53[(1'h0):(1'h0)])}) ?
                  reg62[(3'h7):(3'h4)] : wire30[(3'h5):(3'h5)]);
              reg74 <= (($signed({wire49, (~wire68)}) ?
                      reg63[(3'h5):(1'h0)] : (reg60[(3'h4):(2'h2)] ~^ ((reg55 ~^ reg63) ?
                          (~^wire66) : wire28))) ?
                  ($signed(wire67) && $unsigned(wire46)) : (~&$signed(({wire49} + (reg51 ?
                      reg57 : reg61)))));
            end
          else
            begin
              reg71 <= (reg63 ?
                  $unsigned(((8'hb9) ?
                      (reg51 ?
                          (reg51 && wire30) : (reg58 ?
                              reg57 : reg57)) : (|reg59[(3'h6):(2'h2)]))) : reg60);
              reg72 <= wire68[(4'h8):(3'h4)];
              reg73 <= reg53[(3'h4):(1'h1)];
              reg74 <= reg59[(2'h2):(1'h1)];
              reg75 <= $unsigned($signed(reg69));
            end
          reg76 <= ((~{$signed($signed(wire31))}) >= (~|reg72[(4'h8):(2'h3)]));
          reg77 <= ($signed(wire48) <<< ((&(~&(~reg53))) ^ (+$unsigned(wire31))));
          reg78 <= $unsigned($signed(($unsigned($unsigned(reg76)) == $unsigned(wire28))));
        end
      else
        begin
          reg71 <= ($unsigned($unsigned((((8'ha0) && reg65) ?
              (wire48 >> reg61) : {(8'hba)}))) ~^ (|$unsigned(((&(7'h42)) & (reg76 >>> reg65)))));
          reg72 <= (((reg65[(3'h6):(3'h4)] ?
                  (reg74 >> reg72) : {reg69[(1'h0):(1'h0)], (|reg57)}) ?
              $signed($signed((&wire52))) : (!reg63)) && reg73[(1'h0):(1'h0)]);
          reg73 <= $unsigned((reg59[(4'hd):(3'h7)] && (^(reg71[(2'h2):(1'h1)] != (~|reg75)))));
        end
      reg79 <= (wire46 <= {$signed({wire48, (reg56 ? reg75 : reg77)})});
    end
  always
    @(posedge clk) begin
      reg80 <= $unsigned($signed(((&$unsigned((8'ha4))) ?
          {(reg65 ? wire28 : reg70)} : (!$unsigned(reg74)))));
      reg81 <= ($signed((reg79[(1'h1):(1'h1)] ?
              ((+reg71) - $unsigned(reg70)) : (8'hb2))) ?
          (~{$unsigned($signed(reg57)),
              (~&$signed((8'hbb)))}) : $unsigned($unsigned(reg55[(2'h3):(2'h3)])));
      if (wire46)
        begin
          reg82 <= (&reg60[(3'h4):(1'h1)]);
          reg83 <= $signed(wire52[(4'hd):(3'h5)]);
          if ((((7'h44) ?
              $signed($unsigned(reg71[(2'h3):(1'h1)])) : reg82[(4'h9):(1'h1)]) ~^ $signed(wire49[(1'h0):(1'h0)])))
            begin
              reg84 <= (~|((8'h9d) ?
                  reg76 : {$unsigned((reg62 << reg58)),
                      (~^(reg58 ? reg81 : (8'hb2)))}));
            end
          else
            begin
              reg84 <= $unsigned((&reg60[(4'h8):(3'h5)]));
            end
          reg85 <= $unsigned((~^$unsigned((wire68 ?
              (8'ha6) : reg62[(4'ha):(4'h9)]))));
          reg86 <= $unsigned((reg76[(1'h0):(1'h0)] + $unsigned($unsigned((8'ha3)))));
        end
      else
        begin
          reg82 <= $unsigned(((reg79 ? $signed(wire48[(4'hb):(3'h7)]) : reg53) ?
              wire29 : reg69));
          reg83 <= reg62[(4'h9):(2'h3)];
          reg84 <= $unsigned({$signed(((reg79 - reg80) || reg60[(4'hb):(3'h4)])),
              (~&$unsigned(reg79[(1'h1):(1'h1)]))});
          if ((~&reg77[(4'hb):(2'h2)]))
            begin
              reg85 <= ($unsigned({((reg72 ? reg60 : wire30) <<< {reg71,
                          reg79}),
                      ((reg77 != reg79) != $signed(reg60))}) ?
                  reg50[(1'h0):(1'h0)] : (8'ha3));
              reg86 <= {{(reg83[(3'h7):(3'h6)] ?
                          (&(+reg63)) : {{reg71, reg55},
                              (reg62 ? reg58 : reg81)})},
                  (~&$signed(($unsigned(wire28) ?
                      (~^wire67) : $unsigned(reg73))))};
              reg87 <= reg71;
            end
          else
            begin
              reg85 <= reg83[(1'h0):(1'h0)];
            end
        end
      if ({(8'ha3), $signed($unsigned(reg62))})
        begin
          if ((-reg70))
            begin
              reg88 <= (($signed(reg54) ?
                  $unsigned(reg78) : (8'ha3)) == $unsigned(reg50));
            end
          else
            begin
              reg88 <= $signed(((&(!reg57)) && {($unsigned(reg85) > ((8'hb1) >= (8'hbd)))}));
              reg89 <= (((-($unsigned(reg62) ?
                      (~reg78) : {wire52, reg55})) != reg72) ?
                  ({(~$unsigned(reg78)),
                      reg54} >= reg50[(2'h2):(1'h1)]) : reg75[(3'h4):(3'h4)]);
              reg90 <= (({reg76[(2'h2):(1'h0)],
                  (wire30[(4'hf):(4'hb)] ?
                      $signed(wire30) : $signed((8'hb5)))} | $unsigned($unsigned((reg55 * wire46)))) * wire67[(4'hc):(1'h0)]);
            end
        end
      else
        begin
          reg88 <= ({$unsigned($unsigned($unsigned((8'ha7)))),
                  (reg50[(1'h0):(1'h0)] ?
                      reg65 : (^(reg59 ? wire66 : (8'ha4))))} ?
              {(|(~$signed(reg53)))} : reg86[(3'h7):(1'h1)]);
          reg89 <= (&$signed((~^($unsigned(reg83) ?
              $signed(reg77) : (!reg71)))));
          reg90 <= $signed(($unsigned($unsigned((reg72 >>> reg88))) >>> reg71));
        end
      reg91 <= (reg55[(2'h3):(2'h2)] & $signed(reg73[(2'h3):(1'h1)]));
    end
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire12;
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire12,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = wire7;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((wire8 ^ {$unsigned(wire7),
          wire7[(3'h5):(2'h3)]}))))
        begin
          reg13 <= $signed(((8'had) | ($unsigned((wire8 ~^ wire7)) << wire7)));
          reg14 <= wire9[(3'h6):(2'h3)];
          reg15 <= (($unsigned(wire11[(1'h0):(1'h0)]) ~^ wire10[(1'h0):(1'h0)]) ?
              (((wire12[(3'h6):(3'h6)] ?
                      wire12[(3'h6):(3'h6)] : $unsigned(wire11)) ?
                  $unsigned({wire8}) : (-wire12[(5'h10):(1'h1)])) + ($unsigned(wire7[(2'h2):(1'h0)]) >= ({reg13,
                  (8'h9e)} ^ $unsigned(wire7)))) : {wire12,
                  $signed(wire8[(1'h1):(1'h1)])});
        end
      else
        begin
          reg13 <= reg15;
          reg14 <= wire8;
        end
      if (reg13[(3'h5):(3'h4)])
        begin
          reg16 <= wire10;
          reg17 <= reg14[(4'h8):(3'h7)];
        end
      else
        begin
          reg16 <= (!$signed(wire12[(2'h3):(2'h3)]));
          reg17 <= $unsigned(wire9);
          reg18 <= $unsigned(wire10[(1'h0):(1'h0)]);
          reg19 <= $signed((wire7[(4'h8):(1'h1)] ?
              $unsigned(reg16[(3'h4):(2'h2)]) : reg17));
          reg20 <= $unsigned($unsigned($signed($signed(wire7))));
        end
    end
  assign wire21 = (reg16[(2'h3):(1'h1)] ?
                      $unsigned(($unsigned(reg14[(1'h1):(1'h0)]) ~^ (^~{wire10,
                          reg15}))) : $signed((~^($signed(wire11) ?
                          $signed((8'ha4)) : wire12))));
  assign wire22 = ((((reg18 ? (~(8'hb7)) : $unsigned(wire11)) > (wire10 ?
                          (reg19 < wire21) : $signed(reg17))) >> (+wire10)) ?
                      (wire10[(1'h1):(1'h1)] ?
                          ($signed($signed((8'ha5))) == ((reg19 & reg17) && $unsigned(wire11))) : {wire9[(1'h0):(1'h0)],
                              $signed($signed((8'ha7)))}) : $signed((~^$signed((wire11 ^ (8'ha3))))));
endmodule

module module32  (y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire37;
  input wire signed [(3'h6):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 (1'h0)};
  assign wire38 = wire37[(1'h1):(1'h1)];
  assign wire39 = $unsigned(wire38);
  assign wire40 = $signed($signed({wire34[(4'hc):(4'h9)],
                      {wire33[(4'hb):(3'h7)], {(7'h43), wire37}}}));
  assign wire41 = $signed((-wire37[(3'h4):(3'h4)]));
  assign wire42 = (8'hba);
  assign wire43 = wire37;
  assign wire44 = {$unsigned({(wire42 ? (wire38 - wire40) : wire42),
                          ($signed(wire34) > (~^wire43))}),
                      (&(8'hbb))};
  assign wire45 = (~&$signed(((8'ha3) & (~$unsigned(wire39)))));
endmodule
