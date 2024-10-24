module top
#(parameter param97 = (+(((((7'h41) <= (8'hb3)) <= ((8'hae) * (8'ha1))) == ((8'hb2) ~^ ((8'hb3) <<< (8'hb8)))) ? (+(~^((8'hbc) ? (8'hbc) : (8'hb1)))) : {(((8'ha6) ? (8'hbd) : (8'ha1)) << ((8'hae) >= (8'hab)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire79;
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire5,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire79,
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
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = ($unsigned((&wire4[(3'h5):(3'h5)])) ?
                     $unsigned((^~$signed((wire2 || wire2)))) : (~wire3[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire1);
      reg7 <= wire4;
      reg8 <= $unsigned((&wire0[(1'h0):(1'h0)]));
      reg9 <= (reg7[(5'h12):(3'h5)] ?
          $signed(wire1[(2'h2):(2'h2)]) : ({(+(^(8'hb5))),
              (+(reg8 <<< wire2))} <<< $signed((8'hbb))));
      reg10 <= {$signed(($signed(wire4) == {wire0}))};
    end
  assign wire11 = (|reg6[(3'h5):(1'h1)]);
  assign wire12 = ((((((8'ha5) ? wire0 : reg7) ?
                      reg9 : (~^wire3)) ^~ wire1[(2'h3):(1'h0)]) <= (^~reg7[(3'h4):(2'h3)])) || $signed($unsigned(reg7[(4'hb):(1'h0)])));
  assign wire13 = ($signed($unsigned(wire0[(1'h0):(1'h0)])) ?
                      wire4[(3'h7):(3'h5)] : (~($signed((+(7'h40))) | ((~|wire0) >> (reg8 << wire4)))));
  assign wire14 = ($signed((reg8 << ($signed(reg8) ?
                          (wire5 <<< reg6) : (reg8 ^ wire0)))) ?
                      wire11[(3'h7):(1'h0)] : ({reg9[(4'h9):(3'h7)],
                          $signed((wire3 && reg10))} != (|(wire11 ?
                          {(8'ha1), wire0} : $signed(reg8)))));
  assign wire15 = $signed(wire3[(2'h2):(1'h1)]);
  assign wire16 = ((wire2[(3'h4):(2'h2)] ?
                      {$signed($signed((8'hb8)))} : (7'h40)) || $signed(wire11[(4'hc):(3'h7)]));
  always
    @(posedge clk) begin
      reg17 <= reg10;
      reg18 <= (wire1[(1'h0):(1'h0)] > (~$signed((^~(wire1 == wire3)))));
      if ((!$signed(wire3[(2'h3):(1'h1)])))
        begin
          reg19 <= (~&(+((^(wire11 ? wire2 : wire14)) ^~ ($unsigned(reg17) ?
              (wire15 >= reg8) : (wire12 <= wire4)))));
          reg20 <= ((reg7[(3'h5):(3'h4)] ?
              wire15[(4'hb):(4'ha)] : (^~{(wire3 * reg17)})) - ($unsigned(reg18) ?
              wire2[(4'ha):(3'h5)] : (8'ha1)));
          if ({wire2, {wire0}})
            begin
              reg21 <= (~($signed($unsigned(reg6[(3'h4):(2'h2)])) ?
                  $signed((wire13 >>> (wire14 ^~ (8'ha9)))) : reg9[(3'h6):(3'h6)]));
              reg22 <= {($signed({reg6, wire4}) ?
                      reg19 : $unsigned($unsigned(reg18[(2'h2):(1'h1)])))};
              reg23 <= reg17;
            end
          else
            begin
              reg21 <= (|$unsigned(($signed((&wire0)) >>> {$signed((8'hbf)),
                  $signed(reg18)})));
              reg22 <= $signed($signed((~^(~&$unsigned(reg9)))));
            end
        end
      else
        begin
          if ((-(reg7 ? $signed($signed(reg22)) : (8'ha0))))
            begin
              reg19 <= (&(~&$unsigned($signed(reg21))));
              reg20 <= (^$signed(((wire16 ?
                  wire12[(2'h3):(1'h1)] : wire3[(2'h2):(1'h1)]) * reg18[(3'h5):(1'h0)])));
              reg21 <= reg8;
              reg22 <= (!reg8);
            end
          else
            begin
              reg19 <= wire5;
              reg20 <= wire11[(1'h0):(1'h0)];
              reg21 <= reg6;
              reg22 <= (wire5 != $signed(((8'haa) ~^ ($unsigned(wire15) ?
                  $signed((8'hb0)) : $unsigned(reg18)))));
            end
        end
      reg24 <= reg10;
    end
  module25 #() modinst80 (wire79, clk, wire12, wire13, wire2, reg9, reg7);
  always
    @(posedge clk) begin
      reg81 <= reg21[(4'hb):(3'h5)];
      reg82 <= wire14;
      reg83 <= $unsigned(wire2);
      reg84 <= ((reg10 ? reg9 : reg24[(2'h2):(2'h2)]) ?
          (~^$unsigned($unsigned({wire13}))) : wire15);
      if ($signed(({wire11[(2'h2):(2'h2)],
          ((^~reg9) ?
              reg7[(5'h11):(4'hb)] : reg9[(5'h11):(4'hf)])} > (-wire3[(1'h0):(1'h0)]))))
        begin
          if ({reg19[(3'h5):(2'h3)]})
            begin
              reg85 <= (&$signed($signed(reg9[(2'h3):(2'h3)])));
              reg86 <= reg10[(3'h6):(1'h1)];
              reg87 <= (8'ha3);
              reg88 <= ((reg7 ?
                  reg85[(5'h10):(4'hd)] : $unsigned(reg22)) * $unsigned((~^wire79[(3'h4):(1'h1)])));
            end
          else
            begin
              reg85 <= reg21;
              reg86 <= (wire2[(2'h3):(2'h3)] + $signed($signed(reg6)));
            end
          if ($signed(($signed(wire5) ?
              wire15[(3'h5):(1'h1)] : (reg8 == {(wire16 ? wire16 : reg9),
                  $unsigned(wire14)}))))
            begin
              reg89 <= (-$unsigned($unsigned((&$signed(wire16)))));
              reg90 <= $unsigned($signed(reg19[(2'h3):(2'h2)]));
              reg91 <= (8'ha5);
              reg92 <= reg88;
            end
          else
            begin
              reg89 <= ($unsigned((reg17[(2'h2):(2'h2)] ?
                  $signed((reg89 - reg84)) : (((8'hb4) + reg19) << wire15))) - (reg22[(3'h6):(1'h1)] <= ((reg85 < reg85) + wire13[(4'hc):(2'h2)])));
              reg90 <= reg83;
              reg91 <= reg81[(1'h1):(1'h0)];
            end
          reg93 <= reg84;
        end
      else
        begin
          reg85 <= (wire14 ?
              (reg19 & wire12) : {$unsigned(($unsigned(reg21) < $unsigned(wire3)))});
          if (({(reg87 - ((reg8 ? reg8 : reg90) & reg21[(2'h2):(1'h1)])),
                  ($signed($unsigned((8'h9f))) >>> reg86)} ?
              (wire13[(3'h5):(2'h3)] | wire11) : ($signed((reg84[(4'hf):(1'h0)] - $signed((8'hb2)))) > ((((7'h42) ?
                      (8'haf) : wire14) <= $unsigned(wire11)) ?
                  ($unsigned((8'hac)) ?
                      ((8'hb2) ?
                          reg23 : reg20) : (^~reg23)) : $unsigned({wire16,
                      (8'hb9)})))))
            begin
              reg86 <= $signed((~|$signed($signed($unsigned(reg23)))));
              reg87 <= (|$signed(({reg82} << {reg92[(2'h2):(2'h2)],
                  reg8[(2'h3):(2'h3)]})));
              reg88 <= $signed((^{reg86, $signed((reg7 ? reg86 : reg6))}));
              reg89 <= {$unsigned($unsigned(({wire79,
                      (8'hbd)} >= $unsigned(wire2)))),
                  {{wire16[(4'h8):(4'h8)], $signed((~|reg19))}}};
              reg90 <= wire13[(3'h7):(3'h4)];
            end
          else
            begin
              reg86 <= (-(((reg23 ? (~&reg23) : $unsigned(reg19)) ?
                  (+reg92) : reg88) < $signed((!$unsigned(wire2)))));
            end
          if (wire0)
            begin
              reg91 <= $signed($unsigned(reg85[(4'hf):(3'h7)]));
              reg92 <= ((8'ha6) == reg83[(1'h0):(1'h0)]);
              reg93 <= wire14[(5'h13):(4'h8)];
              reg94 <= $signed($unsigned((^(8'ha9))));
            end
          else
            begin
              reg91 <= ({$signed((8'h9f))} + $signed(((8'ha4) ?
                  ($unsigned((8'hb7)) | wire0) : $signed(reg19))));
              reg92 <= $unsigned(reg24);
              reg93 <= (reg89[(2'h3):(2'h3)] ?
                  $unsigned((8'hb1)) : $unsigned(reg22[(1'h1):(1'h0)]));
              reg94 <= (~^($unsigned(((^~reg91) <<< $signed(wire14))) ?
                  {reg6, reg19} : wire1[(1'h1):(1'h0)]));
            end
          reg95 <= $signed($signed(((((8'hbd) | reg91) ?
              {reg20} : (wire3 ^ reg21)) >>> ($unsigned(wire4) ?
              wire3 : wire79[(4'hb):(3'h4)]))));
          reg96 <= (~&reg82);
        end
    end
endmodule

module module25
#(parameter param78 = (8'haa))
(y, clk, wire26, wire27, wire28, wire29, wire30);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire signed [(3'h7):(1'h0)] wire29;
  input wire [(4'hb):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire62;
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire31,
                 wire32,
                 wire33,
                 wire62,
                 reg73,
                 (1'h0)};
  assign wire31 = ((wire29[(3'h7):(2'h2)] | wire27) >>> $unsigned($signed((wire28 << $signed(wire28)))));
  assign wire32 = $signed(wire30);
  assign wire33 = ($unsigned((!$signed({wire27}))) >> (wire29 ?
                      wire30[(4'h9):(4'h8)] : (wire29 * $signed(wire31[(2'h3):(2'h3)]))));
  module34 #() modinst63 (wire62, clk, wire30, wire26, wire31, wire27, wire28);
  assign wire64 = ($signed((!wire29)) ?
                      ((&((wire27 * wire29) <= wire62[(2'h3):(2'h3)])) | (~&wire33[(2'h3):(1'h1)])) : wire26[(1'h0):(1'h0)]);
  assign wire65 = $unsigned((wire30 && (wire32[(2'h3):(2'h2)] ?
                      wire30[(4'ha):(4'h9)] : ((wire62 ?
                          wire28 : wire29) | $signed(wire33)))));
  assign wire66 = wire28[(1'h0):(1'h0)];
  assign wire67 = (~^(|($signed((-(8'h9d))) ?
                      wire64[(1'h1):(1'h1)] : wire64[(4'hf):(4'hb)])));
  assign wire68 = wire29;
  assign wire69 = $signed((($unsigned($unsigned(wire29)) ?
                          wire62 : ($unsigned(wire30) < $signed((8'ha7)))) ?
                      ((^wire27) ?
                          wire31[(1'h0):(1'h0)] : ($unsigned(wire30) >>> wire33[(2'h2):(2'h2)])) : (8'hb2)));
  assign wire70 = (wire65 & {wire30[(4'ha):(3'h7)],
                      $signed(({wire32, wire27} ?
                          (wire26 ^ wire64) : wire68))});
  assign wire71 = wire32;
  assign wire72 = $unsigned(((8'ha8) ~^ $unsigned($unsigned({wire69}))));
  always
    @(posedge clk) begin
      reg73 <= $unsigned(wire32);
    end
  assign wire74 = (^~(+wire32));
  assign wire75 = $unsigned({wire71, {(^((8'ha2) & wire67)), wire32}});
  assign wire76 = wire31;
  assign wire77 = $signed((&{(^wire26)}));
endmodule

module module34
#(parameter param60 = {{{(~((8'h9f) | (8'hb0)))}}, (~&{(((8'hb6) ? (8'ha9) : (8'hb0)) || (^(8'hae))), (~^((8'hbf) ? (8'hb1) : (8'ha3)))})}, 
parameter param61 = (((param60 ? param60 : param60) - param60) >>> param60))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire39;
  input wire [(5'h11):(1'h0)] wire38;
  input wire signed [(3'h5):(1'h0)] wire37;
  input wire [(5'h12):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire44,
                 wire41,
                 wire40,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = ({wire37, (8'h9e)} ?
                      (((wire37[(3'h5):(3'h4)] >= wire37) == $unsigned($unsigned(wire37))) ?
                          (~|$signed((8'h9f))) : $signed((|wire37[(3'h5):(1'h1)]))) : ((({wire36,
                                  wire35} ?
                              (wire37 << (8'hb2)) : {wire37, wire37}) ?
                          $unsigned((wire35 ?
                              wire38 : wire38)) : wire39) && wire36));
  assign wire41 = $unsigned(({(~|(wire37 <<< (7'h41)))} <<< (wire38[(4'h8):(3'h5)] ^~ ($signed((8'h9c)) < (wire35 >= wire37)))));
  always
    @(posedge clk) begin
      reg42 <= wire39;
      reg43 <= wire37;
    end
  assign wire44 = wire38[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg45 <= (|$unsigned((^~{wire44[(2'h3):(1'h0)]})));
      if (wire40)
        begin
          reg46 <= (7'h43);
          if (wire38)
            begin
              reg47 <= (wire38[(4'hb):(4'h9)] >> {((8'hb9) ?
                      reg43[(2'h3):(2'h2)] : {((8'ha7) >> reg42),
                          $signed(reg43)})});
            end
          else
            begin
              reg47 <= (~(!$signed($signed((wire44 ? reg42 : wire38)))));
              reg48 <= wire36;
              reg49 <= (wire40 | (wire39 == ($signed({reg47}) - (&(+reg43)))));
            end
        end
      else
        begin
          reg46 <= (!(|((&(reg48 ? (8'ha5) : wire39)) ?
              $signed($unsigned(reg43)) : wire44[(1'h1):(1'h1)])));
          if (((-wire39[(3'h6):(3'h4)]) <= (wire41 ?
              $unsigned(((wire36 ? wire38 : reg42) & (reg43 ?
                  wire40 : (8'hb6)))) : reg42[(3'h4):(3'h4)])))
            begin
              reg47 <= $unsigned($signed(($signed(wire39[(3'h7):(3'h6)]) <<< (^((7'h43) >> reg46)))));
              reg48 <= reg48[(4'h9):(3'h6)];
              reg49 <= (|(|{((wire41 <<< wire39) > {(8'ha8)})}));
              reg50 <= wire40[(1'h1):(1'h1)];
              reg51 <= wire38[(4'hc):(1'h1)];
            end
          else
            begin
              reg47 <= $signed($unsigned(wire44));
              reg48 <= ($signed(reg45[(3'h5):(3'h4)]) ^ reg51[(4'ha):(4'h9)]);
              reg49 <= $signed(wire38);
              reg50 <= ($unsigned(wire35) == $signed({$unsigned($unsigned((8'ha6)))}));
            end
          reg52 <= ($unsigned(reg49) ?
              ($unsigned((+wire37[(2'h3):(2'h3)])) ?
                  ((^$signed(wire39)) ?
                      wire40[(1'h0):(1'h0)] : ((wire36 ? reg47 : reg45) ?
                          (reg46 & wire39) : wire35)) : wire36[(3'h7):(3'h4)]) : wire37);
        end
      if ($signed((~(((reg42 <= reg47) >> (reg50 + reg49)) & wire35[(2'h3):(1'h1)]))))
        begin
          reg53 <= (~&(&reg46[(3'h7):(1'h0)]));
        end
      else
        begin
          reg53 <= wire37;
        end
      reg54 <= (8'haf);
    end
  assign wire55 = (~&((($unsigned(reg52) ?
                          (wire37 ? reg42 : reg45) : wire39[(4'h8):(3'h6)]) ?
                      $unsigned((+reg50)) : (|wire41)) << (+(reg45 ?
                      (+wire41) : (reg53 != reg43)))));
  assign wire56 = reg46;
  assign wire57 = reg43;
  assign wire58 = $unsigned((reg50[(3'h6):(3'h5)] ^~ ((!(^wire41)) ?
                      (~{(8'ha1), (8'hbc)}) : wire41[(2'h3):(1'h0)])));
  assign wire59 = (^~$unsigned(wire38[(3'h4):(2'h2)]));
endmodule
