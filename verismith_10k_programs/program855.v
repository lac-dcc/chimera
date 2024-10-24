module top
#(parameter param93 = (^(|(^((^(8'hb6)) ? {(8'hab), (8'hbc)} : ((8'hbc) <<< (8'ha5)))))), 
parameter param94 = param93)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire80,
                 wire79,
                 wire78,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire6,
                 wire5,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
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
                 (1'h0)};
  assign wire5 = $signed(wire0[(4'hd):(4'hd)]);
  assign wire6 = wire5;
  module7 #() modinst55 (.y(wire54), .wire11(wire1), .wire8(wire6), .wire10(wire0), .wire9(wire5), .clk(clk));
  assign wire56 = (wire54 ?
                      ((~&((-(8'hb4)) ?
                          $unsigned(wire54) : (^wire5))) < $signed(($unsigned(wire0) > $signed(wire6)))) : {(+wire3)});
  assign wire57 = $unsigned($signed($unsigned($signed($signed(wire54)))));
  assign wire58 = $unsigned($signed(wire57[(2'h3):(1'h1)]));
  assign wire59 = (wire5[(4'hb):(4'h8)] ?
                      (wire1[(4'hc):(4'ha)] != wire0) : (((~^wire1[(4'he):(2'h2)]) ?
                              ((wire5 > (7'h43)) ?
                                  (^~wire2) : {wire2}) : (8'ha2)) ?
                          wire3 : $unsigned((!wire1))));
  assign wire60 = wire4;
  assign wire61 = (~(~^$unsigned($unsigned(wire3))));
  assign wire62 = ($signed($signed($signed((wire2 ~^ wire60)))) == ((~|wire0) - ($signed($signed(wire57)) ^~ wire1[(1'h1):(1'h0)])));
  assign wire63 = wire62[(4'h8):(2'h3)];
  assign wire64 = $signed(wire61);
  always
    @(posedge clk) begin
      reg65 <= wire0[(4'hf):(3'h4)];
      if (((($signed($signed((8'hae))) ?
              $signed($unsigned(wire59)) : $unsigned({wire56})) << wire54) ?
          (~&$unsigned((8'had))) : wire64))
        begin
          reg66 <= {(wire6 ?
                  $signed(((wire56 == wire0) ?
                      $unsigned(wire58) : (^wire56))) : wire4),
              {(((wire58 ?
                      wire57 : wire62) ^ {reg65}) >>> $signed(wire58[(4'hf):(3'h7)]))}};
          if ($unsigned($signed({wire6[(2'h3):(2'h3)],
              $signed($unsigned(wire63))})))
            begin
              reg67 <= (~&wire5);
              reg68 <= wire5[(1'h1):(1'h0)];
              reg69 <= $unsigned(($signed($signed(wire61[(3'h4):(1'h0)])) >>> wire64[(1'h0):(1'h0)]));
            end
          else
            begin
              reg67 <= wire61[(4'ha):(3'h7)];
              reg68 <= (($unsigned($unsigned((~wire58))) >>> wire64) ?
                  $unsigned(($unsigned(wire2) ?
                      ((8'ha8) | $signed(wire3)) : $signed($signed((8'had))))) : $signed((+((wire54 + wire56) ^~ wire1))));
              reg69 <= (($unsigned($unsigned((-reg67))) ?
                  reg67 : $signed(((^wire59) ?
                      $signed((8'ha2)) : (8'hbc)))) - wire57[(1'h0):(1'h0)]);
              reg70 <= ((8'ha1) <<< wire0);
            end
          if ((^~$unsigned($unsigned(($signed(wire3) ?
              (wire61 + wire63) : {reg69, wire57})))))
            begin
              reg71 <= (^~$unsigned(($signed(reg65) ? wire54 : wire57)));
              reg72 <= $signed({reg71[(4'hd):(4'hb)]});
              reg73 <= wire2[(2'h3):(2'h3)];
              reg74 <= ($unsigned({$signed(((8'hbe) ?
                      wire3 : wire0))}) << wire56);
              reg75 <= (+$unsigned(wire0));
            end
          else
            begin
              reg71 <= reg73[(3'h4):(1'h1)];
              reg72 <= $signed({($signed({wire58}) ?
                      {$unsigned(wire63), (~&wire3)} : reg69)});
              reg73 <= (~|$signed(wire61));
              reg74 <= $unsigned(wire60);
            end
          reg76 <= (!reg68);
        end
      else
        begin
          if ($unsigned((-(&$unsigned((8'hbc))))))
            begin
              reg66 <= wire62;
              reg67 <= (^(wire64 <<< $signed(($signed(reg65) ?
                  $unsigned(wire5) : (^reg72)))));
              reg68 <= reg66;
              reg69 <= wire64[(2'h3):(2'h3)];
              reg70 <= {(reg70[(1'h0):(1'h0)] ? wire3 : (8'hbd)),
                  ((-$signed(reg72[(3'h7):(3'h6)])) ?
                      (((8'hbe) ?
                          reg74 : {wire63}) | reg69[(5'h11):(5'h10)]) : $signed(($unsigned(wire63) ?
                          {wire63, wire61} : (reg71 >> wire56))))};
            end
          else
            begin
              reg66 <= $signed((((8'ha8) && reg69[(4'hd):(4'hd)]) | (^~$signed((wire61 ?
                  reg66 : reg66)))));
              reg67 <= reg75[(2'h3):(1'h1)];
              reg68 <= {{$unsigned((((8'hbb) << reg72) ? reg68 : (-wire58)))},
                  wire6[(1'h1):(1'h0)]};
            end
          reg71 <= (!$signed((8'haa)));
        end
      reg77 <= $unsigned((7'h43));
    end
  assign wire78 = ($unsigned($unsigned(wire60)) <<< $unsigned($signed((wire57 ?
                      (~|wire61) : reg67[(3'h6):(2'h2)]))));
  assign wire79 = reg74;
  assign wire80 = $unsigned({(+wire60[(4'ha):(4'ha)])});
  always
    @(posedge clk) begin
      reg81 <= $signed(wire60[(3'h7):(2'h3)]);
      if ((wire4 ? reg72[(3'h4):(1'h0)] : reg66[(1'h0):(1'h0)]))
        begin
          reg82 <= (&({reg73} ?
              ($signed({reg65}) <= (reg73 * (^~(8'hb2)))) : $unsigned(((wire57 ?
                  (8'hbb) : (8'hbe)) << ((8'ha6) ^~ (7'h44))))));
          reg83 <= ((wire4 || wire62) | (((&wire2) <<< reg72) ?
              wire78 : wire54));
          if (wire59[(3'h4):(2'h2)])
            begin
              reg84 <= wire79[(1'h0):(1'h0)];
              reg85 <= wire6;
            end
          else
            begin
              reg84 <= ((!($unsigned(wire64) >>> $unsigned(wire63))) ^ $signed((((wire2 ?
                      (8'ha1) : reg85) != {reg85, reg71}) ?
                  (~&(wire60 <= (8'hab))) : wire63)));
              reg85 <= (wire0[(4'ha):(4'h8)] ?
                  $unsigned(({(+reg66), reg77[(3'h6):(3'h5)]} ?
                      $signed((wire54 ?
                          reg72 : wire3)) : wire61)) : ((~wire58[(2'h3):(1'h1)]) ?
                      reg73 : $unsigned($unsigned((wire64 ? reg85 : wire59)))));
              reg86 <= ($unsigned({(7'h44)}) ?
                  {{((reg82 ^~ reg69) > reg69)},
                      $signed(({(8'ha4), wire62} ?
                          (~&wire60) : {wire58}))} : (~&reg84));
            end
        end
      else
        begin
          reg82 <= $signed((~wire62));
        end
      if ((~^($unsigned((wire56 | (wire62 ?
          reg75 : wire0))) | $signed(((~|wire3) + wire63[(4'hc):(1'h0)])))))
        begin
          reg87 <= ($signed((|$signed(reg66[(1'h1):(1'h0)]))) - ((+(~$unsigned(reg67))) ?
              wire60[(1'h1):(1'h1)] : {reg71[(4'ha):(4'h8)]}));
        end
      else
        begin
          reg87 <= {wire58[(3'h6):(2'h2)]};
          reg88 <= (-$unsigned(wire78[(2'h3):(2'h2)]));
        end
      reg89 <= ($unsigned($unsigned($unsigned(wire2))) < ((((wire4 ?
              (8'hb6) : wire6) ^ $unsigned(reg73)) ?
          {(wire60 ? reg86 : (8'hac)),
              $signed(reg83)} : $signed(((7'h44) & (8'hbb)))) && $signed($unsigned((^~wire57)))));
    end
  assign wire90 = $unsigned((^(|(~&(wire54 <= (8'hb5))))));
  assign wire91 = reg87[(3'h7):(3'h5)];
  assign wire92 = reg65[(5'h12):(3'h6)];
endmodule

module module7
#(parameter param52 = (&(((8'hae) ? (((8'ha6) < (8'hb2)) || ((8'haa) & (8'hb1))) : (~|{(7'h41), (8'hba)})) ? ({((8'hb9) | (8'ha0))} < {((8'had) * (8'haa))}) : ((((8'hb8) << (8'h9d)) > (8'hb1)) >>> {((8'hbf) <<< (8'ha7))}))), 
parameter param53 = (-(param52 ? (((param52 >> param52) ? param52 : (param52 ? param52 : param52)) >= {((8'hb8) ? (8'hbb) : (8'hac))}) : ({(param52 >>> param52), {(8'hb1), param52}} ? param52 : ((^(8'hab)) ? (param52 ? param52 : param52) : ((7'h43) >> param52))))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire12;
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  assign y = {wire49,
                 wire36,
                 wire35,
                 wire34,
                 wire24,
                 wire12,
                 reg51,
                 reg50,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
  assign wire12 = wire10[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg13 <= $unsigned($unsigned((wire11 ?
          $signed($signed(wire11)) : wire9)));
      reg14 <= (wire10[(4'hd):(2'h2)] ^~ ((8'hab) != (^$signed($signed(wire11)))));
      if ((wire9 != wire9))
        begin
          reg15 <= (($signed($unsigned($unsigned((8'ha8)))) ?
              {({wire8, wire11} ?
                      wire11 : (wire11 ?
                          (8'h9e) : wire12))} : $unsigned(reg14)) & (8'h9c));
        end
      else
        begin
          if (wire8)
            begin
              reg15 <= wire8[(1'h0):(1'h0)];
              reg16 <= $signed($signed((~^($unsigned(reg13) ~^ reg15))));
              reg17 <= {{$unsigned($signed(reg13))}, (wire8 >= wire9)};
            end
          else
            begin
              reg15 <= {(!(+(~$signed(wire11)))),
                  $unsigned(wire9[(3'h4):(3'h4)])};
              reg16 <= wire9;
              reg17 <= $signed(($signed($signed($signed(wire8))) ?
                  (+($unsigned((8'hbe)) | {wire8})) : reg13[(2'h3):(1'h1)]));
              reg18 <= (reg17 <= (^{reg16[(1'h0):(1'h0)],
                  ((~^wire11) ? $unsigned(reg14) : (~wire8))}));
              reg19 <= (wire11[(4'h9):(3'h6)] ~^ {{(wire10[(3'h4):(3'h4)] ^~ ((7'h44) ?
                          reg15 : (8'hbd)))},
                  {reg18[(3'h7):(3'h7)]}});
            end
          reg20 <= reg15;
          reg21 <= reg15;
          reg22 <= (8'hae);
          reg23 <= ($signed(($signed($unsigned(reg22)) ?
              $unsigned((wire11 && wire9)) : reg22)) || reg16[(4'hb):(3'h5)]);
        end
    end
  assign wire24 = $signed({(+(wire8 ? $signed((8'ha1)) : reg17)), wire9});
  always
    @(posedge clk) begin
      if (((^(~&(reg20[(3'h7):(3'h4)] + (wire11 <= reg23)))) && ((reg23[(1'h1):(1'h0)] >> $signed(reg14[(4'h8):(2'h3)])) ?
          reg20 : (^~$unsigned(reg20)))))
        begin
          reg25 <= reg19[(3'h6):(3'h5)];
        end
      else
        begin
          reg25 <= ($signed({wire9[(3'h6):(2'h3)], (|(~reg13))}) ?
              $signed($signed((8'ha3))) : reg20);
          reg26 <= {(((|$signed(wire10)) ?
                      reg23[(2'h3):(2'h3)] : (reg25 ?
                          reg18[(4'hd):(4'hc)] : reg17[(1'h1):(1'h0)])) ?
                  reg25 : (!(!{wire9})))};
          reg27 <= $signed((((wire24[(3'h4):(1'h1)] || (reg16 && reg13)) >= {(reg18 >> wire10),
              wire10}) * $signed(reg21[(1'h0):(1'h0)])));
        end
      reg28 <= ($unsigned(reg26[(3'h7):(3'h6)]) ?
          (8'hbd) : {{($unsigned((8'hae)) ? $signed(reg15) : (wire9 ^ reg23)),
                  reg14[(1'h0):(1'h0)]},
              $signed(($unsigned(reg23) && (!reg21)))});
      if ((reg22 ? wire11 : (^(~^$unsigned(wire10)))))
        begin
          reg29 <= (({wire10[(2'h2):(1'h0)]} > ((8'hae) - reg13[(1'h0):(1'h0)])) ?
              $signed($unsigned($signed((-wire9)))) : reg13[(4'h9):(1'h1)]);
          reg30 <= ($signed((-$signed($unsigned(reg25)))) >> ((reg13 > $signed((reg18 <<< (8'h9e)))) ?
              $signed(wire11[(4'hc):(2'h2)]) : (^$unsigned($signed((8'hae))))));
          reg31 <= (+reg23);
        end
      else
        begin
          reg29 <= $unsigned(reg27[(3'h4):(1'h0)]);
          reg30 <= $unsigned((~&$signed((reg27 ?
              (reg31 << wire24) : $signed(reg29)))));
        end
      reg32 <= $unsigned((reg16 ? wire11[(2'h2):(1'h0)] : reg22));
      reg33 <= (8'hbb);
    end
  assign wire34 = $unsigned(($signed(($unsigned(wire11) <= $signed(reg31))) ^ (&reg31[(2'h2):(2'h2)])));
  assign wire35 = $signed(((^($signed(reg15) + $signed(reg21))) ?
                      reg13[(3'h4):(1'h0)] : (-(wire8[(1'h0):(1'h0)] >> (reg26 ?
                          wire10 : reg14)))));
  assign wire36 = $unsigned($signed(reg13));
  always
    @(posedge clk) begin
      reg37 <= reg21[(4'ha):(4'h9)];
      reg38 <= $unsigned(reg18);
      reg39 <= reg31[(1'h1):(1'h0)];
      if (($unsigned((($unsigned(reg23) ? ((8'hbd) ? reg29 : wire8) : reg38) ?
              reg23[(1'h1):(1'h0)] : {wire8})) ?
          reg25[(3'h4):(1'h1)] : (wire10 ? wire9 : reg37)))
        begin
          if ((^~reg26))
            begin
              reg40 <= reg30;
              reg41 <= (reg16[(3'h5):(1'h1)] ? reg15 : (^~reg37));
              reg42 <= reg22;
              reg43 <= (-(&(^~(8'ha5))));
            end
          else
            begin
              reg40 <= ($unsigned(((|(~wire8)) != wire11)) - {reg42});
              reg41 <= (reg42[(4'h8):(2'h3)] ?
                  ({$signed({reg27}),
                      ({(8'hae), reg16} ?
                          reg13 : (reg27 ?
                              reg26 : reg31))} != ($signed((reg37 || reg19)) & reg26)) : wire24);
              reg42 <= reg18[(2'h3):(2'h3)];
              reg43 <= $signed((8'hbd));
              reg44 <= $signed(reg26);
            end
          reg45 <= ((^$signed(reg31[(1'h0):(1'h0)])) ? (|reg41) : reg44);
          reg46 <= {(~reg44[(1'h0):(1'h0)]), (~&wire34)};
          reg47 <= $signed((^~$unsigned({{reg43}, (reg26 ? (7'h42) : reg38)})));
        end
      else
        begin
          reg40 <= (wire34 ?
              $signed({{((8'ha2) ? reg40 : reg32), reg47},
                  $signed((reg22 ?
                      reg19 : wire34))}) : $signed(reg47[(1'h1):(1'h1)]));
        end
      reg48 <= reg17;
    end
  assign wire49 = (~|$unsigned((|($unsigned(reg38) ?
                      ((7'h40) ? reg30 : reg47) : (wire34 > reg28)))));
  always
    @(posedge clk) begin
      reg50 <= $unsigned(((({wire34, reg38} ?
          $signed(reg48) : (reg16 < reg26)) && reg46[(5'h11):(2'h2)]) <<< $unsigned(wire35[(4'ha):(4'h9)])));
      reg51 <= ((+(8'hae)) ^ (~|wire34));
    end
endmodule
