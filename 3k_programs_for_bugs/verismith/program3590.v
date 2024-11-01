module top
#(parameter param178 = (~^(((~^((8'hbb) ? (8'ha4) : (8'hbf))) * (((7'h41) != (8'ha3)) - ((8'h9f) <= (8'hab)))) < ((((8'hb7) ? (8'ha3) : (8'had)) ? {(8'hb8), (8'hb5)} : ((8'haa) ? (8'hb3) : (8'h9d))) ? (+(&(8'hab))) : {((7'h41) ? (8'ha6) : (8'ha2)), (^(7'h44))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire176;
  wire [(4'he):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  assign y = {wire176,
                 wire68,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire5,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire5 = $unsigned(($unsigned((wire2[(3'h7):(1'h1)] ?
                     {wire4, wire3} : $unsigned(wire0))) <= (wire3 ?
                     wire1 : ((wire4 ? wire3 : wire0) ~^ $signed(wire0)))));
  module6 #() modinst48 (wire47, clk, wire5, wire1, wire2, wire0);
  assign wire49 = wire1[(4'he):(2'h3)];
  assign wire50 = $signed((|wire2[(1'h0):(1'h0)]));
  assign wire51 = wire4;
  assign wire52 = (~^wire50[(1'h1):(1'h1)]);
  assign wire53 = $signed((~|wire51));
  assign wire54 = (^~(wire4[(4'h9):(1'h1)] ^ ((^~(wire4 ? wire51 : wire52)) ?
                      $signed((wire53 > (8'hb6))) : ($unsigned(wire1) >> (wire0 >> wire50)))));
  assign wire55 = $signed(wire47[(3'h5):(2'h2)]);
  assign wire56 = (wire1 ^~ ((wire2[(4'hd):(2'h3)] ?
                      (|{wire51, wire4}) : (^~{(7'h40),
                          wire54})) << wire1[(1'h1):(1'h0)]));
  assign wire57 = wire1;
  assign wire58 = (~^$unsigned((^((^~wire47) ?
                      wire57[(2'h3):(2'h2)] : {wire50, wire1}))));
  assign wire59 = ($unsigned((($signed((8'hb8)) ?
                      wire49 : {wire52,
                          wire4}) + ($unsigned(wire55) & wire0))) & wire58);
  assign wire60 = (~&$unsigned((-(7'h43))));
  always
    @(posedge clk) begin
      reg61 <= wire1;
      if ($unsigned(($unsigned($signed(wire53)) ?
          wire5[(4'hb):(3'h4)] : (-($unsigned(wire60) ?
              wire52 : $signed(reg61))))))
        begin
          if ($signed(reg61))
            begin
              reg62 <= wire3[(2'h3):(2'h3)];
              reg63 <= wire59;
              reg64 <= (8'ha3);
              reg65 <= $unsigned(wire2);
              reg66 <= (({wire5[(2'h2):(2'h2)],
                      $signed(reg65)} + $signed($unsigned(wire0))) ?
                  (8'hab) : ($unsigned($unsigned({(8'h9f)})) + ($unsigned({(8'ha5),
                          wire55}) ?
                      ((wire47 >= wire47) + $signed(wire54)) : ((reg63 ?
                              wire52 : wire60) ?
                          wire52 : $signed(wire51)))));
            end
          else
            begin
              reg62 <= $unsigned(((reg64[(1'h0):(1'h0)] && ((reg65 <= reg64) ?
                      {(7'h40)} : wire54[(3'h4):(2'h2)])) ?
                  $unsigned({(wire56 && wire47),
                      (wire47 ? wire53 : wire47)}) : reg61));
              reg63 <= wire0[(2'h3):(1'h0)];
            end
        end
      else
        begin
          reg62 <= reg64[(1'h0):(1'h0)];
          reg63 <= wire59;
        end
      reg67 <= $unsigned($unsigned($signed($signed(wire49[(2'h2):(1'h1)]))));
    end
  assign wire68 = (wire50 && $signed(wire54));
  module69 #() modinst177 (wire176, clk, wire68, wire5, wire53, wire51);
endmodule

module module69
#(parameter param174 = (((~((~(8'hae)) != ((8'hba) * (8'hac)))) ? ((((8'hb9) ? (8'h9d) : (8'hba)) ^~ ((8'hba) ^ (8'h9f))) + ((~|(8'h9f)) <= (-(8'ha5)))) : ((((8'ha3) <= (8'h9d)) ~^ (~|(7'h43))) ? ({(8'ha4), (8'hb6)} ? ((8'hb1) ^ (8'ha3)) : (!(8'hbf))) : (-(~^(8'ha3))))) << (~|((+(~(8'h9d))) <<< (((8'hb5) == (8'hb7)) ^~ (~|(8'h9c)))))), 
parameter param175 = (param174 && ((~|(param174 ^~ (param174 ^~ param174))) ? param174 : param174)))
(y, clk, wire70, wire71, wire72, wire73);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire70;
  input wire signed [(5'h15):(1'h0)] wire71;
  input wire [(4'hb):(1'h0)] wire72;
  input wire [(4'h9):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire172;
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  assign y = {wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire94,
                 wire95,
                 wire172,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 (1'h0)};
  assign wire74 = $unsigned(wire73);
  assign wire75 = (+$signed(wire73));
  assign wire76 = ((!(^~$signed(wire72))) << ({$signed(((8'ha9) ~^ wire70))} ?
                      $unsigned($unsigned((&(8'ha0)))) : wire75[(4'hd):(4'h9)]));
  assign wire77 = (~(wire75 ?
                      (!({wire74} ~^ (~^wire72))) : ($signed((wire70 & wire72)) - (~&wire72))));
  assign wire78 = ((~|wire74) ?
                      (wire72 ?
                          {$signed((~^wire75))} : ($signed((wire70 >>> wire71)) != wire74)) : ({wire77[(4'hd):(3'h4)],
                              $unsigned($unsigned(wire74))} ?
                          (~&(wire72 ^ (wire76 ?
                              wire73 : wire74))) : (~|wire73[(3'h5):(3'h4)])));
  always
    @(posedge clk) begin
      if ((^((wire71 ~^ wire74[(1'h0):(1'h0)]) && (~&$unsigned(wire73[(4'h8):(1'h0)])))))
        begin
          reg79 <= {((wire73[(3'h4):(2'h2)] ~^ ((wire78 ?
                  wire76 : wire75) <<< wire76)) ^ $signed($unsigned(wire74))),
              $signed(((((8'ha9) & wire71) ? (wire72 <= wire76) : (~|wire73)) ?
                  ({wire71} ? $signed(wire78) : (wire70 ^ wire73)) : {(+wire76),
                      $unsigned(wire70)}))};
          reg80 <= wire70;
          if ($signed((wire76 | (reg79[(2'h3):(1'h1)] && $signed(reg79)))))
            begin
              reg81 <= $signed($unsigned($signed({wire73,
                  wire75[(4'h8):(1'h1)]})));
              reg82 <= ((~&reg81) >= reg81);
              reg83 <= (~^$unsigned($signed(($signed(wire73) & (+reg79)))));
              reg84 <= {$signed((^~reg81[(3'h5):(2'h2)])),
                  wire72[(3'h6):(2'h2)]};
            end
          else
            begin
              reg81 <= (8'hbf);
              reg82 <= (+($signed(reg83[(1'h0):(1'h0)]) + wire73));
              reg83 <= $unsigned((wire72 ?
                  (&({wire78, reg84} ?
                      $signed(wire77) : (reg83 ~^ wire70))) : $unsigned(($unsigned(wire72) < (^~reg80)))));
              reg84 <= {$signed((8'hbb)), wire75};
              reg85 <= (8'hb9);
            end
          reg86 <= {$signed($signed($signed((^wire76))))};
        end
      else
        begin
          reg79 <= {$unsigned(reg82[(1'h1):(1'h1)])};
          reg80 <= (wire72 >>> $unsigned(wire76));
          reg81 <= $signed(reg83);
        end
      if (((wire78 ? wire73 : wire74) ?
          reg83[(2'h2):(1'h1)] : $unsigned(($unsigned({wire77,
              (8'hb4)}) * $signed($unsigned((8'hb6)))))))
        begin
          if ((reg81 ? wire77[(2'h3):(2'h2)] : $unsigned(reg85)))
            begin
              reg87 <= reg86;
              reg88 <= ($unsigned(reg83) << reg84);
              reg89 <= $signed(reg87[(3'h5):(1'h0)]);
              reg90 <= ((~$signed(reg83)) << $unsigned($signed(reg83)));
            end
          else
            begin
              reg87 <= $signed((reg79 ?
                  wire70[(2'h2):(1'h1)] : {$unsigned($unsigned(reg81))}));
              reg88 <= (|$unsigned((~^(~(wire78 ? wire73 : wire73)))));
            end
          reg91 <= ($signed((^~$unsigned(wire73))) > (((~(reg81 ?
                      wire73 : reg90)) ?
                  $signed((reg89 ? reg85 : reg84)) : reg82) ?
              (-wire77[(4'h8):(3'h5)]) : (({reg82} ?
                      reg84[(2'h2):(1'h1)] : wire75) ?
                  ((reg82 > wire71) || reg86[(4'ha):(4'ha)]) : ($signed(wire76) && reg88))));
          reg92 <= $unsigned(reg89[(2'h2):(1'h1)]);
          reg93 <= {(+(reg86 >>> ({wire71, wire70} >= $unsigned(reg85))))};
        end
      else
        begin
          reg87 <= (wire78 - ($signed(($unsigned(wire73) * (8'ha5))) ?
              ((reg82[(2'h3):(1'h0)] < (reg91 ? reg85 : wire76)) ?
                  ((^reg87) ?
                      reg87 : $unsigned(reg87)) : $unsigned($signed(wire78))) : (((~^(8'h9d)) >>> (reg80 ?
                  (8'h9d) : reg90)) > (reg86 - reg86[(4'h8):(4'h8)]))));
          reg88 <= reg93;
          reg89 <= ($signed($unsigned($signed((~^reg87)))) != $unsigned($signed(($unsigned(reg92) ?
              (reg90 < (8'h9d)) : $signed(wire70)))));
        end
    end
  assign wire94 = (~^(8'ha2));
  assign wire95 = (|$signed(reg93[(1'h1):(1'h1)]));
  module96 #() modinst173 (.wire97(wire94), .clk(clk), .wire98(wire76), .y(wire172), .wire100(wire73), .wire99(reg84));
endmodule

module module6
#(parameter param46 = {(^~((&(7'h41)) >= (&((8'hbd) ? (7'h40) : (8'haa)))))})
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire12,
                 wire11,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg30,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = {($unsigned(((wire9 == wire8) & wire9)) <= $signed(wire8))};
  assign wire12 = {($signed((~&((8'hb2) ? (8'hb1) : wire10))) | (~wire11))};
  always
    @(posedge clk) begin
      if (wire10)
        begin
          if (wire7[(4'h9):(3'h6)])
            begin
              reg13 <= $signed(wire9);
              reg14 <= (((&wire8) == ((^$signed(wire12)) ?
                  reg13[(3'h6):(3'h5)] : $unsigned($unsigned(wire7)))) >>> (~&((-wire7) ?
                  $unsigned((wire11 ? wire12 : reg13)) : ($signed((8'haa)) ?
                      wire7[(4'hf):(1'h0)] : {wire12, wire8}))));
              reg15 <= ($signed(($unsigned((wire11 ?
                      wire8 : wire12)) ~^ $signed(((8'hbd) ?
                      wire9 : wire10)))) ?
                  wire11[(5'h13):(4'hb)] : $signed(wire9));
            end
          else
            begin
              reg13 <= (|reg14[(3'h5):(1'h0)]);
              reg14 <= wire12[(4'h8):(3'h4)];
              reg15 <= wire12;
              reg16 <= ($unsigned(((wire10[(3'h6):(3'h5)] ?
                      reg14 : $signed(wire8)) ?
                  {(~^wire12), $unsigned(reg14)} : wire7)) | $signed(reg15));
            end
        end
      else
        begin
          reg13 <= (($signed(reg15[(5'h14):(5'h12)]) ?
                  {$unsigned(reg13[(2'h3):(2'h2)]),
                      ((^~(8'ha6)) < (^reg14))} : $unsigned(((wire11 ?
                          wire10 : reg14) ?
                      (~|reg16) : wire9[(1'h1):(1'h1)]))) ?
              $signed((((~&wire10) <= wire9[(3'h5):(2'h3)]) == (~&$unsigned(reg16)))) : $signed((~|$unsigned($unsigned(reg14)))));
          reg14 <= {{({{(8'hb7), reg15}, $signed(reg13)} <= (((8'hbe) ?
                      (8'hb1) : wire11) >>> (reg14 && wire11))),
                  ((wire11 ? reg16 : wire12[(1'h1):(1'h1)]) ?
                      (reg13[(4'h8):(3'h7)] ?
                          (&wire10) : $signed(wire10)) : wire8)},
              (8'hbf)};
          reg15 <= $signed($unsigned($unsigned((^~((8'hb9) ?
              wire10 : wire8)))));
          if ({($unsigned($signed((wire11 ? (8'hb9) : (7'h44)))) || (8'h9e)),
              (^~(wire7[(4'hc):(4'hb)] ?
                  ($signed(wire12) ?
                      (wire11 ^ reg14) : $unsigned(wire12)) : wire7))})
            begin
              reg16 <= ((wire7 ?
                      ($unsigned({wire11, wire12}) ?
                          (wire9 ?
                              (-wire11) : $unsigned(wire7)) : reg16[(3'h5):(1'h0)]) : (-(~^wire11[(1'h1):(1'h1)]))) ?
                  $unsigned((((!(8'hbb)) ?
                      (~(7'h41)) : (wire9 ?
                          wire7 : reg13)) < $unsigned(reg16))) : $signed(($signed(reg14[(2'h3):(1'h1)]) ?
                      $unsigned({wire9, reg16}) : wire8)));
              reg17 <= ($unsigned(wire11[(5'h11):(3'h6)]) < {{((8'ha0) ?
                          $unsigned(reg13) : (~|wire8)),
                      reg16[(3'h5):(1'h1)]},
                  (^{$unsigned(reg15)})});
              reg18 <= (!{((|reg15) ?
                      $unsigned({reg15, reg16}) : $unsigned({wire7}))});
              reg19 <= reg13;
              reg20 <= (~^$signed($signed($signed((reg18 >> reg14)))));
            end
          else
            begin
              reg16 <= ((!reg14) ? wire12 : reg14[(2'h3):(2'h2)]);
              reg17 <= wire8;
              reg18 <= ($signed(wire11[(4'hd):(1'h0)]) ^~ reg20);
              reg19 <= ($signed((8'ha5)) < $signed($unsigned({(wire7 != reg18),
                  (reg14 >> (8'h9c))})));
              reg20 <= $unsigned($unsigned($unsigned($signed((+reg16)))));
            end
        end
      if (reg15)
        begin
          if (wire12[(4'hd):(4'ha)])
            begin
              reg21 <= $unsigned($unsigned(reg16));
              reg22 <= ((~$signed($signed((wire8 ?
                  reg16 : wire11)))) <= (~reg19[(4'h8):(1'h1)]));
              reg23 <= $signed($signed($unsigned(($signed((7'h44)) ?
                  reg22 : (^reg15)))));
              reg24 <= wire12;
            end
          else
            begin
              reg21 <= (^~$unsigned((((reg17 ? reg14 : reg21) ?
                  $unsigned(wire11) : wire11) >> (reg17[(4'hb):(3'h5)] ?
                  (wire9 + reg14) : wire11))));
              reg22 <= reg17[(4'h9):(4'h9)];
              reg23 <= ($unsigned($signed(reg24)) ?
                  (&$signed((reg14[(3'h7):(2'h2)] | reg22))) : ($signed(reg18) & $signed($signed((+reg15)))));
              reg24 <= ((-(~reg20[(3'h7):(2'h2)])) <<< wire11);
            end
          reg25 <= $unsigned(($signed(reg14[(4'h9):(3'h4)]) ?
              (~($unsigned(wire11) << $unsigned(reg19))) : (reg21[(3'h6):(2'h3)] ?
                  $unsigned(reg16[(1'h1):(1'h1)]) : $signed((wire9 && wire7)))));
          reg26 <= (8'hb7);
          if (reg25[(2'h2):(2'h2)])
            begin
              reg27 <= $signed({(8'hbe), $signed({(reg23 ? wire8 : wire9)})});
            end
          else
            begin
              reg27 <= reg27[(4'h8):(1'h1)];
              reg28 <= reg15[(4'hb):(4'ha)];
            end
        end
      else
        begin
          if (($signed($unsigned(wire9)) ?
              (^(~(^~$signed(reg18)))) : wire7[(5'h10):(5'h10)]))
            begin
              reg21 <= $signed(reg16[(3'h4):(3'h4)]);
              reg22 <= $unsigned({$signed($unsigned($signed((7'h43))))});
            end
          else
            begin
              reg21 <= $signed(((reg14 << (wire8 ?
                      $signed(reg14) : $signed(reg22))) ?
                  $signed(reg14[(3'h5):(3'h5)]) : $signed($signed(reg27))));
              reg22 <= (8'ha1);
            end
          if ((&$signed((8'haf))))
            begin
              reg23 <= (((reg18[(4'hd):(4'hd)] ?
                      ((!(8'hb3)) ?
                          wire8[(2'h2):(1'h0)] : (~|reg18)) : reg14[(2'h2):(1'h0)]) || reg17) ?
                  reg23[(1'h1):(1'h0)] : (reg23 <<< reg19[(3'h7):(3'h7)]));
            end
          else
            begin
              reg23 <= {reg14, $unsigned(wire7[(2'h3):(2'h3)])};
              reg24 <= {$signed($signed((reg25[(2'h2):(2'h2)] == (8'ha7))))};
              reg25 <= ((reg13[(1'h0):(1'h0)] | (($signed(wire11) ?
                      $signed((8'ha1)) : $signed((8'hbb))) ?
                  (~(~&reg26)) : (^{reg19}))) ^~ $unsigned(({$signed((8'ha6))} ?
                  ((~&(8'hab)) ?
                      $unsigned(reg19) : (reg25 ?
                          reg18 : reg25)) : (reg14[(2'h3):(2'h3)] ^~ (8'hb0)))));
            end
          reg26 <= reg24[(3'h5):(1'h1)];
          reg27 <= reg24;
          reg28 <= $signed($unsigned(reg24[(4'he):(3'h7)]));
        end
      reg29 <= wire10;
      reg30 <= (($signed((^~(~&reg27))) - reg26) ?
          (((reg13[(4'ha):(4'h8)] ?
                  (~&(7'h40)) : $unsigned(reg15)) ~^ ($signed(reg21) && $signed(reg17))) ?
              $signed($signed((8'hb2))) : (~|($unsigned(reg29) <= ((8'h9f) ?
                  reg26 : (8'ha2))))) : $signed(($signed((&wire8)) ?
              (8'hbe) : ((reg15 != reg19) << reg22[(3'h6):(3'h4)]))));
    end
  assign wire31 = $unsigned(($unsigned((|(reg25 != reg24))) ?
                      wire8[(1'h0):(1'h0)] : ((&(!reg14)) <<< ($signed(wire9) || (reg14 ?
                          (8'hab) : reg23)))));
  assign wire32 = (~&$unsigned(wire12));
  assign wire33 = reg19;
  assign wire34 = wire32;
  always
    @(posedge clk) begin
      reg35 <= reg29;
      reg36 <= (wire7 ? reg18 : {reg27});
      reg37 <= (~(!(wire11[(4'he):(3'h6)] - reg17)));
      if ($signed({wire33[(3'h5):(2'h2)], $unsigned({reg13})}))
        begin
          reg38 <= reg20[(1'h0):(1'h0)];
          reg39 <= $unsigned(wire7[(4'hb):(2'h2)]);
        end
      else
        begin
          reg38 <= {$signed(wire33)};
          reg39 <= (&({$unsigned((~^reg29)), reg39} ?
              (((wire34 ? reg30 : wire32) & reg35) >= {(&reg15),
                  $signed(reg28)}) : ((reg22[(5'h10):(3'h5)] != reg14) * wire33)));
          if ((~&$unsigned((reg17 >> reg19[(4'hf):(1'h1)]))))
            begin
              reg40 <= reg18;
            end
          else
            begin
              reg40 <= (~^$signed((reg35[(1'h1):(1'h1)] ?
                  $signed($unsigned(reg16)) : $unsigned($signed(reg27)))));
              reg41 <= {reg30};
            end
          if ($signed(reg38))
            begin
              reg42 <= wire31[(4'h8):(1'h0)];
              reg43 <= wire10[(4'hd):(4'hc)];
              reg44 <= $unsigned(reg14[(3'h7):(3'h4)]);
            end
          else
            begin
              reg42 <= reg36[(4'h8):(3'h6)];
              reg43 <= (reg43 ? wire31[(4'ha):(3'h4)] : reg24);
              reg44 <= reg35[(1'h0):(1'h0)];
              reg45 <= (~&$signed((~^$signed($signed(wire12)))));
            end
        end
    end
endmodule

module module96  (y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h31b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire100;
  input wire [(4'h9):(1'h0)] wire99;
  input wire [(5'h15):(1'h0)] wire98;
  input wire signed [(3'h7):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire153;
  wire signed [(2'h2):(1'h0)] wire152;
  wire signed [(3'h7):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire122;
  wire [(5'h13):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire [(4'hc):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire102;
  wire [(2'h2):(1'h0)] wire101;
  reg [(3'h5):(1'h0)] reg171 = (1'h0);
  reg [(4'h8):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(4'hf):(1'h0)] reg166 = (1'h0);
  reg [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(4'he):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire105,
                 wire104,
                 wire102,
                 wire101,
                 reg171,
                 reg170,
                 reg169,
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
                 reg140,
                 reg139,
                 reg138,
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
                 reg126,
                 reg125,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg103,
                 (1'h0)};
  assign wire101 = ($signed((&(&wire98[(2'h3):(2'h3)]))) ?
                       ($signed({wire100, (wire97 ? wire100 : wire97)}) ?
                           wire100[(2'h2):(2'h2)] : wire100) : wire99);
  assign wire102 = $unsigned(wire101);
  always
    @(posedge clk) begin
      reg103 <= $signed({(((^~wire97) ?
              (|(8'hb4)) : (wire99 == wire99)) || {wire97, $signed(wire102)})});
    end
  assign wire104 = wire100[(3'h6):(3'h4)];
  assign wire105 = wire99;
  always
    @(posedge clk) begin
      reg106 <= (~|(^$signed((reg103[(3'h4):(2'h3)] ?
          (~&(8'hb6)) : $signed(wire101)))));
      if (($unsigned(wire102) ?
          $signed($signed($signed(reg103[(2'h3):(1'h0)]))) : {((8'hb6) ?
                  $unsigned((~^(8'hb7))) : $unsigned(wire105)),
              {$unsigned($signed(wire97))}}))
        begin
          reg107 <= (&(+wire100[(2'h3):(2'h2)]));
          reg108 <= wire97;
        end
      else
        begin
          reg107 <= ((^~(reg106 ^~ ((wire98 ?
                  wire102 : wire100) <<< (-(8'ha8))))) ?
              $unsigned($unsigned(((wire99 < reg108) >= (wire100 << reg108)))) : $signed($signed(({(8'ha9)} > $signed(wire102)))));
          reg108 <= (reg103[(3'h4):(2'h3)] ? $unsigned(reg103) : wire102);
          reg109 <= reg107[(1'h0):(1'h0)];
          reg110 <= reg103[(1'h1):(1'h1)];
          reg111 <= $signed(wire98[(3'h7):(2'h3)]);
        end
      if ((wire97 ^ (((|(wire98 ? wire102 : reg111)) ?
          wire105 : $signed(reg106)) ^~ wire99)))
        begin
          reg112 <= wire97;
          reg113 <= $unsigned(reg108[(2'h2):(1'h1)]);
          reg114 <= wire98[(4'ha):(3'h5)];
          reg115 <= wire98[(4'hc):(4'ha)];
        end
      else
        begin
          reg112 <= ($unsigned({$signed((~|reg113)), reg109[(3'h5):(2'h3)]}) ?
              $unsigned($unsigned(reg108)) : (-reg106[(4'hb):(2'h2)]));
          reg113 <= {$unsigned(wire101)};
        end
    end
  assign wire116 = ($signed(wire98) ?
                       reg109[(3'h6):(2'h2)] : $unsigned(reg111[(1'h1):(1'h1)]));
  assign wire117 = (wire98 >>> (^$unsigned($unsigned((wire102 && wire100)))));
  assign wire118 = $signed((!$unsigned($signed($signed(wire99)))));
  assign wire119 = (reg112[(4'hd):(3'h6)] ? wire100[(3'h4):(2'h2)] : (-wire97));
  assign wire120 = $unsigned($unsigned({((~^reg112) ^ $unsigned(wire101))}));
  assign wire121 = $unsigned(wire98[(4'h8):(3'h6)]);
  assign wire122 = wire105;
  assign wire123 = reg112[(4'hf):(4'h8)];
  assign wire124 = ((reg112 > wire123[(4'hf):(1'h1)]) ?
                       wire119[(2'h2):(1'h0)] : (wire117[(4'ha):(2'h2)] == wire123[(4'hd):(1'h1)]));
  always
    @(posedge clk) begin
      if (wire104)
        begin
          reg125 <= (^~$unsigned((-({reg108, (7'h44)} <= wire98))));
          reg126 <= wire104[(1'h1):(1'h0)];
          reg127 <= reg113;
        end
      else
        begin
          reg125 <= $unsigned($signed(wire98));
          reg126 <= ({(8'ha6),
              (8'ha3)} << (reg108[(1'h0):(1'h0)] <<< ($unsigned($unsigned(reg112)) ?
              wire105 : reg107)));
          if (($signed((~&(-(8'had)))) | reg112))
            begin
              reg127 <= (&wire121[(2'h2):(1'h1)]);
              reg128 <= $signed(($signed(((|reg109) ?
                  wire97[(3'h7):(3'h4)] : reg125[(4'h9):(2'h3)])) - (!$unsigned({reg115}))));
            end
          else
            begin
              reg127 <= reg111[(4'h9):(4'h9)];
              reg128 <= reg125[(4'h8):(3'h7)];
            end
          reg129 <= (~((reg111[(4'h9):(3'h6)] << (~reg109[(2'h3):(2'h3)])) ?
              reg125[(3'h6):(1'h0)] : $unsigned((reg110[(2'h2):(1'h0)] | (reg106 <<< reg111)))));
          reg130 <= (~((8'hb5) ?
              (wire104[(2'h2):(2'h2)] ?
                  ({reg112} & (wire116 < reg107)) : (~&((7'h40) == reg110))) : reg114[(2'h2):(2'h2)]));
        end
      reg131 <= wire118[(3'h5):(2'h2)];
      reg132 <= wire117;
      if ((~^$signed((wire122[(3'h7):(1'h1)] >>> (8'had)))))
        begin
          reg133 <= wire100[(3'h5):(3'h4)];
          if ((($unsigned(((!wire122) << wire123)) >= (+$signed(wire117))) <<< reg125))
            begin
              reg134 <= reg115;
              reg135 <= (8'hb9);
              reg136 <= (~^(^~(($unsigned((8'ha5)) ?
                      (~reg129) : (reg135 ? wire119 : wire102)) ?
                  $unsigned($signed(reg106)) : $signed(wire102[(2'h3):(1'h0)]))));
            end
          else
            begin
              reg134 <= (+($unsigned(reg127) || (($unsigned(reg107) ?
                  reg127 : (~^reg106)) << reg129[(1'h0):(1'h0)])));
            end
          if (($unsigned(reg110[(1'h0):(1'h0)]) && ((~^{$signed(reg133),
                  {reg131}}) ?
              ((~&(wire98 ^ reg129)) ?
                  $unsigned(((8'hb4) ?
                      reg134 : reg135)) : $unsigned(reg131[(1'h0):(1'h0)])) : reg112[(4'he):(2'h3)])))
            begin
              reg137 <= $unsigned($unsigned(reg132));
              reg138 <= (~^wire120[(2'h2):(1'h1)]);
              reg139 <= (~reg114[(2'h3):(2'h3)]);
              reg140 <= reg137;
            end
          else
            begin
              reg137 <= (((($unsigned((8'h9c)) ?
                          (8'hba) : reg135) <= (^~reg132)) ?
                      reg126[(1'h1):(1'h1)] : $signed(reg126[(4'hf):(2'h2)])) ?
                  (reg112[(3'h4):(1'h0)] ?
                      reg103 : $unsigned($signed({reg111}))) : wire102);
              reg138 <= (((8'hbe) ?
                  $unsigned((-(~reg134))) : $unsigned(wire121)) * ((-(+(~&reg127))) ?
                  reg133 : $signed(reg107)));
            end
          if ($signed($unsigned((^~$signed({wire122})))))
            begin
              reg141 <= (wire118[(3'h7):(3'h6)] ^~ (|reg103[(1'h0):(1'h0)]));
              reg142 <= ($unsigned((8'hba)) ?
                  reg113 : ((wire124[(1'h1):(1'h1)] ?
                      $unsigned((~(7'h40))) : {(reg140 >= reg127),
                          reg134}) <<< (|(&(reg133 * (8'hac))))));
              reg143 <= reg112[(4'hd):(3'h7)];
              reg144 <= (^~(^~wire123));
              reg145 <= wire105;
            end
          else
            begin
              reg141 <= $unsigned($signed(($unsigned((wire116 ?
                      reg107 : reg135)) ?
                  (-reg142[(3'h5):(2'h2)]) : reg129[(4'ha):(3'h5)])));
              reg142 <= $signed(($signed((((8'haa) - wire121) ?
                  $unsigned(wire121) : reg125[(5'h13):(5'h11)])) >= $signed(($signed((8'hab)) ?
                  $unsigned(wire102) : $signed((8'ha4))))));
            end
          if ($unsigned(($signed(reg129[(5'h12):(5'h12)]) << $unsigned((-$signed(wire121))))))
            begin
              reg146 <= ((wire121 ?
                      (($signed((8'h9d)) ? ((8'hbb) ^ reg142) : {reg127}) ?
                          reg127 : {reg130[(3'h4):(2'h2)],
                              $signed(reg110)}) : $signed($unsigned(reg112[(3'h4):(1'h1)]))) ?
                  reg106[(4'hd):(3'h7)] : {$unsigned($signed(wire97[(3'h6):(2'h3)])),
                      $signed($signed((^~reg133)))});
              reg147 <= (^~($unsigned({$signed(wire121), $unsigned((8'hab))}) ?
                  reg130[(2'h3):(2'h3)] : (7'h42)));
              reg148 <= (wire101[(1'h0):(1'h0)] ^~ {(({(7'h42)} && wire100[(3'h5):(3'h5)]) - reg111[(4'hb):(4'ha)])});
              reg149 <= $unsigned(reg125[(2'h3):(1'h1)]);
              reg150 <= (wire105 ?
                  {(~|$unsigned($signed(wire117)))} : {$unsigned(reg133[(2'h2):(1'h1)])});
            end
          else
            begin
              reg146 <= wire119[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg133 <= {(^$unsigned($unsigned(wire97))),
              ($signed(({reg134} == wire124[(3'h6):(2'h2)])) < (((reg127 | (8'hbc)) ?
                  $unsigned(reg108) : (-reg139)) << reg139))};
          reg134 <= (-((+$unsigned(((7'h40) ?
              wire122 : reg148))) <= ($unsigned((reg112 * (8'hb8))) ?
              ((&wire104) || (|(8'h9c))) : (wire117[(1'h1):(1'h0)] ?
                  $signed(wire120) : $signed(reg149)))));
          reg135 <= $unsigned((~{$signed((wire105 >>> wire100))}));
        end
      reg151 <= $unsigned($unsigned(($unsigned({reg128, wire122}) ?
          ((wire102 >>> reg113) * wire118[(1'h0):(1'h0)]) : $unsigned(((8'hb8) >> reg112)))));
    end
  assign wire152 = (wire104[(2'h3):(1'h1)] << (^~{((wire119 == reg134) << reg112[(4'hf):(1'h1)]),
                       $unsigned($signed(reg147))}));
  assign wire153 = wire104[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg154 <= (($unsigned(((wire105 - reg143) != reg128)) ^~ wire98[(3'h5):(1'h0)]) && reg115);
      if (reg111[(3'h7):(3'h6)])
        begin
          if ({{(8'hb5), $unsigned($unsigned(reg147[(4'ha):(4'ha)]))}})
            begin
              reg155 <= $signed(reg106);
              reg156 <= (reg106 ?
                  wire105 : ($signed($signed($signed(reg144))) ~^ (^wire153[(2'h3):(2'h2)])));
              reg157 <= {(~^($signed(reg112[(1'h0):(1'h0)]) <= $signed((~^reg144)))),
                  (wire153[(2'h2):(1'h0)] ?
                      (reg113 ?
                          {$unsigned(reg137),
                              (reg127 ?
                                  wire97 : (7'h41))} : (~^$unsigned(reg138))) : reg130)};
              reg158 <= $unsigned(reg143[(4'h9):(3'h6)]);
              reg159 <= reg111;
            end
          else
            begin
              reg155 <= {$unsigned(((wire101 | (reg146 & reg147)) ?
                      (!$unsigned((8'hba))) : $signed({wire102})))};
              reg156 <= (reg148 ? reg137[(1'h0):(1'h0)] : wire104);
            end
          reg160 <= (reg150[(2'h2):(1'h0)] ?
              (((reg154 ?
                      reg133[(2'h2):(1'h0)] : (wire121 <= wire120)) <<< (reg137[(1'h0):(1'h0)] ?
                      (wire153 ? reg154 : reg146) : $unsigned(wire100))) ?
                  (-((wire102 ?
                      (8'hb6) : (8'ha4)) ~^ reg143)) : $signed($signed((~&reg132)))) : reg129[(3'h6):(1'h1)]);
          if ($signed(wire152))
            begin
              reg161 <= (|$signed($unsigned(((reg136 ?
                  reg147 : reg141) | $signed(wire122)))));
            end
          else
            begin
              reg161 <= $unsigned($unsigned($signed((wire124[(2'h3):(1'h0)] ?
                  wire119[(1'h0):(1'h0)] : reg128))));
              reg162 <= (|$signed($signed($unsigned((wire153 ?
                  (8'haa) : wire153)))));
            end
        end
      else
        begin
          if ($signed(($unsigned($signed((reg108 ~^ reg126))) ^~ ($signed(reg130[(3'h4):(1'h0)]) ?
              reg112[(2'h3):(1'h0)] : wire97[(3'h6):(3'h6)]))))
            begin
              reg155 <= reg106;
              reg156 <= (((|(&(reg128 ? reg148 : reg157))) ?
                  (~|$unsigned({wire122})) : $signed(wire105[(4'hc):(4'ha)])) <= $unsigned(reg162));
              reg157 <= (reg110[(2'h2):(1'h1)] << {$signed({reg106[(2'h3):(2'h3)],
                      $unsigned(reg158)})});
            end
          else
            begin
              reg155 <= ((wire98 * reg148[(4'he):(4'h9)]) ?
                  reg103[(2'h3):(1'h1)] : (^~$unsigned($signed($signed(reg126)))));
              reg156 <= (~(reg115[(4'h8):(1'h0)] >>> (8'hbd)));
            end
          reg158 <= reg159[(4'hb):(4'ha)];
          reg159 <= (reg126[(4'hc):(3'h7)] << reg103[(2'h3):(1'h0)]);
        end
      if ((^$unsigned((8'h9c))))
        begin
          if (reg162)
            begin
              reg163 <= $unsigned($unsigned($signed((~$signed(reg137)))));
              reg164 <= {wire98};
            end
          else
            begin
              reg163 <= (8'hb2);
            end
          reg165 <= (7'h41);
          reg166 <= (wire152[(2'h2):(1'h0)] > (~&(((reg154 ?
                      (8'hab) : wire122) ?
                  reg140 : (8'ha5)) ?
              $signed((reg125 && (8'hbd))) : {(^reg129), (8'ha8)})));
          if ((^~(!$signed($signed($unsigned(reg115))))))
            begin
              reg167 <= (-($unsigned(reg134) ?
                  (~^(8'hb4)) : $signed($unsigned(((8'ha1) ?
                      (8'hbd) : reg154)))));
              reg168 <= ({reg166} * ((wire102[(5'h13):(4'he)] ?
                      $signed(wire153[(4'hb):(3'h6)]) : $signed((8'ha7))) ?
                  ((((8'hb4) >>> reg115) ? wire124 : $signed(reg167)) ?
                      $unsigned({reg113}) : (8'hb6)) : $unsigned((~|$signed(reg158)))));
              reg169 <= wire152[(2'h2):(1'h1)];
            end
          else
            begin
              reg167 <= ($signed(reg125) <= $signed($unsigned((reg136[(2'h2):(1'h0)] ?
                  $signed(reg160) : reg126))));
              reg168 <= (^$unsigned((reg167 ?
                  reg140[(3'h7):(1'h1)] : $signed(((8'ha6) ?
                      reg156 : (8'hb6))))));
            end
        end
      else
        begin
          reg163 <= $unsigned(((8'hbe) + reg169));
        end
      reg170 <= reg151[(5'h10):(4'h8)];
      reg171 <= $signed((reg160 >> (8'ha2)));
    end
endmodule
