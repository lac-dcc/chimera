module top
#(parameter param92 = (&(({((7'h42) ~^ (8'hb5)), (~^(8'hb6))} || (((7'h40) >>> (8'hb3)) ? ((8'ha1) ? (8'hb6) : (8'ha0)) : ((7'h44) ? (8'ha1) : (8'hb2)))) == (((+(8'hb8)) ~^ ((8'ha7) ? (7'h43) : (7'h44))) > {(-(8'h9f)), ((8'ha2) ? (8'h9f) : (8'hae))}))), 
parameter param93 = ((^~(((param92 ? param92 : param92) + {param92}) ? param92 : ((^~param92) ? (|param92) : (^~param92)))) ? (!(((^~param92) ? (param92 & param92) : {(8'haf), param92}) ? (~|(param92 >> param92)) : (((8'hb4) ? param92 : param92) != ((8'hab) ? param92 : param92)))) : {param92}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h246):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire73,
                 wire71,
                 wire33,
                 wire32,
                 wire31,
                 wire5,
                 wire4,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned(wire3[(1'h0):(1'h0)]);
  assign wire5 = ((({wire2} ~^ $unsigned((wire1 ^~ wire3))) | $unsigned(((+wire2) ?
                     (~&wire4) : wire1))) ^ ({((8'ha9) ?
                             (wire4 >>> wire3) : (8'ha9))} ?
                     ((wire2 ?
                         wire2[(2'h3):(2'h3)] : {wire2}) < ((~^wire3) ^ {wire4})) : {($unsigned(wire4) ?
                             (wire3 == wire0) : (wire0 || wire4))}));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          if ((~$unsigned((8'haa))))
            begin
              reg6 <= ((^$unsigned($unsigned({wire4}))) ~^ ($signed(wire5[(3'h5):(2'h3)]) ?
                  wire1 : (wire5 ?
                      $unsigned($signed(wire0)) : {wire1, $unsigned(wire2)})));
              reg7 <= (wire3 & $signed($unsigned($unsigned((^wire0)))));
              reg8 <= reg7;
              reg9 <= (~&((reg8 ?
                      {(reg6 >= reg8), wire4} : ((8'hb3) ?
                          wire4 : wire2[(5'h11):(2'h2)])) ?
                  reg7 : ((|wire1) + $unsigned($signed(wire2)))));
            end
          else
            begin
              reg6 <= $unsigned(($unsigned(reg9[(1'h1):(1'h1)]) ?
                  reg9 : wire1));
              reg7 <= (&({wire3[(1'h1):(1'h0)], wire5[(3'h7):(2'h2)]} ?
                  ((8'ha9) ?
                      {(wire2 >> wire4)} : {wire1[(4'h9):(2'h2)]}) : (8'hae)));
              reg8 <= (((-$unsigned($unsigned(reg6))) * (($signed(reg9) <<< $signed(reg8)) ?
                      wire4[(3'h4):(2'h3)] : $unsigned(reg8[(3'h4):(1'h1)]))) ?
                  ($unsigned(reg9[(1'h0):(1'h0)]) + {reg9[(2'h3):(1'h1)]}) : reg9[(2'h2):(1'h1)]);
              reg9 <= $unsigned($unsigned($unsigned((wire1[(3'h6):(3'h6)] ?
                  $unsigned(wire4) : {wire5}))));
            end
          if (wire0[(4'h9):(4'h9)])
            begin
              reg10 <= $unsigned(($signed(($unsigned(wire3) != wire0)) ?
                  (^((!reg6) >> $unsigned((8'haa)))) : $unsigned($unsigned((wire2 ~^ (8'hbc))))));
              reg11 <= $unsigned(wire0);
              reg12 <= ({reg8} ?
                  ($signed((^((8'h9c) ~^ wire1))) ?
                      $unsigned($unsigned((wire3 & (8'ha2)))) : (reg10[(1'h1):(1'h1)] && (&reg8))) : ((((^~reg11) ?
                          (wire0 ?
                              wire4 : wire1) : $unsigned(reg10)) | wire2[(3'h5):(2'h3)]) ?
                      $signed($unsigned((~^wire4))) : wire0));
              reg13 <= {wire1[(1'h1):(1'h1)], (&reg9[(3'h5):(2'h2)])};
            end
          else
            begin
              reg10 <= wire4;
              reg11 <= ($unsigned((7'h41)) * $signed((+$signed($unsigned(reg7)))));
              reg12 <= ($signed((reg13 ?
                  {(8'h9c), (&reg8)} : ((reg13 ^~ reg7) ?
                      (wire2 ? reg10 : reg7) : wire5))) <= ((-$unsigned((reg11 ?
                      reg13 : reg7))) ?
                  (wire1[(4'h9):(4'h8)] ?
                      {(8'hac), $signed(reg10)} : {(~&(7'h40)),
                          $signed(wire3)}) : (8'hb2)));
            end
          reg14 <= $unsigned($unsigned({reg11}));
          reg15 <= ((reg8 ?
              $signed((8'hb6)) : wire3[(1'h1):(1'h0)]) ~^ wire0[(3'h5):(1'h0)]);
          reg16 <= $signed($signed(reg10));
        end
      else
        begin
          if ({reg7[(5'h11):(4'h8)],
              ($unsigned($signed((wire1 + reg7))) ?
                  $signed((-$signed((7'h42)))) : (reg14[(1'h1):(1'h0)] & ($unsigned(reg6) + {(8'hb1)})))})
            begin
              reg6 <= $unsigned($unsigned(wire1[(3'h7):(3'h6)]));
            end
          else
            begin
              reg6 <= $unsigned(wire5[(3'h6):(1'h0)]);
              reg7 <= $unsigned($unsigned((({(8'hb3),
                  reg14} >>> (-reg12)) && reg14[(1'h0):(1'h0)])));
              reg8 <= wire2;
              reg9 <= wire0[(3'h5):(2'h3)];
              reg10 <= $unsigned((8'ha2));
            end
          reg11 <= $signed(wire0);
          reg12 <= (&$signed($unsigned(reg9)));
          reg13 <= wire4[(3'h5):(3'h5)];
          if (wire5)
            begin
              reg14 <= wire4;
            end
          else
            begin
              reg14 <= wire5[(3'h5):(1'h1)];
              reg15 <= wire0;
              reg16 <= wire5[(1'h0):(1'h0)];
            end
        end
      reg17 <= reg15[(4'h9):(3'h4)];
      reg18 <= reg12;
      if ($signed($signed(((reg8 >>> $unsigned((7'h40))) ?
          (-(reg14 ? reg13 : wire5)) : ((-reg16) ?
              ((8'ha4) <= wire0) : $signed(wire1))))))
        begin
          reg19 <= wire0[(4'hb):(3'h7)];
          if (((8'hbb) ?
              wire4 : ((($signed(wire1) ?
                      (wire5 ?
                          reg11 : (8'hb4)) : $signed(reg15)) <<< {$unsigned(reg8)}) ?
                  (|{(reg18 ? wire2 : reg15)}) : {(reg18 ?
                          ((8'h9c) ? (8'haf) : wire2) : wire3[(1'h0):(1'h0)]),
                      reg12[(2'h3):(2'h2)]})))
            begin
              reg20 <= wire0;
            end
          else
            begin
              reg20 <= (wire1[(2'h3):(2'h3)] <= ((reg9 ?
                  wire4[(2'h3):(2'h3)] : reg16) | ((&wire3[(3'h4):(1'h0)]) ^ (reg14 ?
                  (~|reg6) : (!reg19)))));
              reg21 <= (+reg19);
            end
          reg22 <= (~^reg8[(3'h7):(3'h5)]);
        end
      else
        begin
          if ($unsigned(reg18))
            begin
              reg19 <= {(&$unsigned($signed(reg12))),
                  (!((8'hbf) - (!$unsigned(reg9))))};
            end
          else
            begin
              reg19 <= reg17;
              reg20 <= reg19;
              reg21 <= ($signed(($unsigned((reg17 || (8'hbb))) >= (~&reg19[(5'h13):(4'hf)]))) >= wire1);
            end
          if ({(^~((~^(~(8'hb5))) | ({(8'haf), wire2} <= reg14)))})
            begin
              reg22 <= reg20;
              reg23 <= (((+$unsigned($unsigned(wire5))) ?
                  $unsigned($signed($unsigned(reg15))) : (reg7 > wire2[(5'h14):(5'h14)])) ^ ($unsigned({(reg14 <<< reg9),
                  reg21}) * $signed(wire5[(3'h5):(2'h2)])));
              reg24 <= (-(((wire5[(3'h7):(3'h6)] || $unsigned(reg20)) ?
                  (&(wire1 << reg14)) : ({wire3} ^ reg14[(2'h3):(2'h2)])) >> {(^~(reg23 << (8'hb9))),
                  $unsigned(reg11[(4'hd):(4'hb)])}));
              reg25 <= (~reg23[(2'h2):(2'h2)]);
              reg26 <= ($unsigned(((+{reg16}) >>> (wire4[(2'h2):(1'h0)] + $signed((7'h40))))) ?
                  wire3[(1'h1):(1'h0)] : (~$unsigned(reg6[(1'h0):(1'h0)])));
            end
          else
            begin
              reg22 <= $signed((({reg20, wire3} != ($signed(reg12) ?
                      (reg7 ? reg6 : reg15) : $signed(reg23))) ?
                  (reg20 ?
                      (!(!(8'hb3))) : $unsigned($signed(wire2))) : {((!reg23) ?
                          reg24 : (reg22 ? (8'ha4) : wire3)),
                      reg15[(3'h6):(2'h2)]}));
              reg23 <= reg21[(4'h9):(1'h0)];
            end
          if ($signed($unsigned((((wire1 * reg26) ?
              reg13[(4'hc):(3'h7)] : ((8'hbb) - (8'hab))) ~^ (|$signed((8'ha4)))))))
            begin
              reg27 <= $signed(reg25[(1'h1):(1'h1)]);
              reg28 <= ($unsigned(wire0) ?
                  {reg13, (-$unsigned(wire1))} : reg18);
              reg29 <= $signed(($unsigned(reg27[(4'hb):(3'h4)]) ?
                  $unsigned($unsigned((reg11 ?
                      reg6 : reg20))) : ((((8'ha8) * wire5) ^~ (~&reg15)) <= (^$unsigned((8'hbf))))));
              reg30 <= (|$unsigned(wire2[(4'hd):(3'h4)]));
            end
          else
            begin
              reg27 <= $unsigned((reg8 ?
                  ((reg9 ? (~^wire5) : (reg24 ? reg24 : reg12)) ?
                      {(reg28 >>> reg7),
                          (wire2 ?
                              reg14 : reg28)} : (8'ha2)) : $signed({$signed(reg29),
                      (reg10 ^ wire5)})));
            end
        end
    end
  assign wire31 = $unsigned((reg23 ?
                      (-$signed(reg14[(1'h0):(1'h0)])) : $signed((reg26[(1'h1):(1'h1)] * reg15))));
  assign wire32 = (reg28 ?
                      ($unsigned($unsigned((reg14 & reg21))) ?
                          (+((reg8 || reg9) * (~|reg18))) : (-$unsigned($signed(reg22)))) : wire0[(1'h1):(1'h1)]);
  assign wire33 = (~(reg23[(1'h1):(1'h1)] != ($unsigned($unsigned(reg13)) && wire1)));
  module34 #() modinst72 (wire71, clk, reg28, reg27, reg25, reg9);
  assign wire73 = $unsigned($signed(reg19[(4'hc):(3'h6)]));
  always
    @(posedge clk) begin
      reg74 <= reg11[(4'hd):(4'h9)];
      reg75 <= {reg8[(4'hb):(4'h8)]};
      if ($unsigned($signed(($unsigned(reg14) == wire33[(2'h2):(1'h1)]))))
        begin
          if (wire0)
            begin
              reg76 <= {{{reg16[(5'h10):(3'h6)]}, (8'ha4)}};
              reg77 <= (~^wire3[(3'h7):(1'h0)]);
              reg78 <= ($unsigned(({{reg29},
                      $unsigned((8'hb1))} ^ (-(~reg30)))) ?
                  (reg28 < ({$signed(reg19), reg26[(1'h1):(1'h0)]} ?
                      (reg29[(3'h4):(1'h0)] ?
                          (reg19 ? wire0 : wire1) : reg27) : ($unsigned(reg15) ?
                          ((8'ha0) ?
                              (8'hbf) : (7'h44)) : $signed((8'ha1))))) : (reg77[(4'hb):(1'h0)] ?
                      (reg11 | (reg74 || (7'h44))) : $signed(reg12)));
              reg79 <= (!$unsigned($signed((^(wire3 ? (7'h41) : reg11)))));
            end
          else
            begin
              reg76 <= (~^(((8'ha2) <<< $signed(reg8[(4'h9):(3'h7)])) - reg76));
              reg77 <= $signed((reg77[(4'hb):(4'h9)] && ($unsigned($signed(reg74)) << (8'h9c))));
              reg78 <= $unsigned((((~|(reg26 ?
                      reg24 : wire32)) <<< ((reg20 >= (8'hb1)) >>> wire5[(2'h3):(2'h3)])) ?
                  (((reg16 > reg16) ?
                          (reg19 ? reg12 : reg78) : reg28[(1'h0):(1'h0)]) ?
                      reg16 : {(^reg27)}) : reg27[(5'h11):(1'h0)]));
              reg79 <= $signed(($unsigned(((reg6 ^~ (8'hb2)) ?
                      wire0[(1'h1):(1'h0)] : reg75)) ?
                  (reg11[(4'he):(3'h4)] ?
                      reg25[(2'h3):(1'h1)] : $unsigned(reg17[(2'h3):(1'h0)])) : (({reg24,
                      reg75} > (+reg30)) - ((wire32 ^ reg28) >> (reg28 ?
                      (8'hac) : reg17)))));
              reg80 <= (8'ha5);
            end
          reg81 <= $signed((^$unsigned($signed((reg77 ? wire31 : (8'hb9))))));
          if ($signed($unsigned(reg26[(2'h2):(1'h1)])))
            begin
              reg82 <= (8'h9e);
              reg83 <= wire73[(4'hc):(4'ha)];
              reg84 <= (8'haa);
              reg85 <= $unsigned(reg17);
              reg86 <= (reg19 * $signed((~($unsigned(reg81) ?
                  $unsigned(reg16) : wire1))));
            end
          else
            begin
              reg82 <= $signed((~&(wire0 ?
                  (-reg10[(3'h4):(1'h1)]) : $unsigned(wire1))));
              reg83 <= ((+(!$unsigned(reg12))) || ($unsigned((!(reg6 || reg77))) || (8'haa)));
            end
          reg87 <= wire5;
          reg88 <= reg16[(4'h8):(3'h7)];
        end
      else
        begin
          reg76 <= reg88;
          reg77 <= (reg29[(1'h0):(1'h0)] < {(!$unsigned($signed(reg15))),
              (|(reg86 ^ (reg23 ? reg78 : wire5)))});
          reg78 <= $unsigned(reg85);
          reg79 <= $signed($unsigned((($signed(reg10) > (reg30 ~^ reg83)) & $signed((reg27 - reg24)))));
        end
      reg89 <= reg84[(2'h3):(2'h3)];
    end
  assign wire90 = (((((wire3 ? wire73 : wire5) ?
                          (reg84 || reg24) : (reg25 ?
                              reg12 : (8'hbe))) ^ wire1[(3'h5):(1'h0)]) < ($unsigned($unsigned(reg79)) >= (reg17 ?
                          (&reg75) : {wire5, wire32}))) ?
                      reg28 : reg83[(3'h6):(2'h3)]);
  assign wire91 = (8'ha4);
endmodule

module module34
#(parameter param70 = (((((|(8'hbf)) ? ((8'hbd) ? (8'haa) : (7'h42)) : {(8'hbd), (7'h40)}) > (((8'ha9) == (8'hbc)) ? (!(8'hac)) : ((7'h41) * (8'h9e)))) ? ((((8'hbd) && (8'ha9)) ? {(8'hb5)} : ((7'h43) == (8'hb8))) ? ({(8'hb9), (8'hb4)} ? {(8'ha4)} : ((8'hb9) ? (8'hb0) : (8'ha1))) : ((8'ha8) ~^ ((7'h41) ? (8'hb1) : (8'hb1)))) : (8'hba)) >>> (7'h40)))
(y, clk, wire35, wire36, wire37, wire38);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire35;
  input wire [(4'h9):(1'h0)] wire36;
  input wire [(3'h7):(1'h0)] wire37;
  input wire [(4'hc):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire56;
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire60,
                 wire59,
                 wire58,
                 wire39,
                 wire40,
                 wire56,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire39 = ($signed(wire37[(1'h1):(1'h0)]) - $signed((wire38[(1'h1):(1'h0)] ?
                      wire35 : wire37[(3'h6):(1'h0)])));
  assign wire40 = (wire39[(3'h6):(3'h6)] * ((((wire36 | wire36) ?
                              $unsigned(wire36) : $signed(wire38)) ?
                          (+wire38) : (wire35[(5'h11):(3'h5)] + (wire35 <<< wire35))) ?
                      $unsigned(($signed(wire37) != (wire38 ?
                          wire36 : wire35))) : (8'ha8)));
  module41 #() modinst57 (wire56, clk, wire40, wire38, wire39, wire36, wire35);
  assign wire58 = (8'haa);
  assign wire59 = $unsigned({$signed($signed($unsigned(wire40)))});
  assign wire60 = {wire35, {(&(~^{wire58, wire40}))}};
  always
    @(posedge clk) begin
      reg61 <= (-wire39);
      reg62 <= ($signed($signed(wire37[(3'h4):(1'h1)])) ?
          wire35[(3'h5):(1'h0)] : ($unsigned(wire59[(4'h8):(2'h2)]) != {({(7'h42),
                      reg61} ?
                  $signed(wire39) : (~&reg61)),
              ((8'ha4) * (wire36 - (8'hbd)))}));
    end
  assign wire63 = wire36[(3'h5):(3'h5)];
  assign wire64 = $unsigned(wire40[(4'hb):(1'h0)]);
  assign wire65 = (!$signed(wire36[(2'h3):(1'h0)]));
  assign wire66 = $unsigned(($signed(((~^wire56) || $unsigned(wire35))) | wire65));
  assign wire67 = $unsigned(((~&wire39) ?
                      wire35[(4'h8):(3'h6)] : ({(wire56 ?
                              wire60 : wire59)} * ((8'hb6) <<< {wire60,
                          wire65}))));
  assign wire68 = $unsigned((((~|reg62[(1'h0):(1'h0)]) ?
                          wire66[(2'h3):(2'h2)] : wire63) ?
                      (&$signed($signed(wire59))) : (wire59 + wire36[(3'h5):(2'h3)])));
  assign wire69 = (($signed((8'h9e)) | $unsigned($unsigned((|wire68)))) - ($unsigned(((^wire66) << {wire67})) << (wire68[(3'h5):(1'h1)] << {wire63})));
endmodule

module module41
#(parameter param55 = (({(-((8'hb9) <<< (8'ha6)))} ? ((!(-(8'hb5))) | ((+(8'haf)) && ((8'ha5) ? (8'h9d) : (8'ha9)))) : (~|{{(8'haa)}})) ? (((~^(8'hbe)) ? ((+(8'haa)) * (~(8'had))) : (((8'ha7) - (8'h9c)) ? ((7'h41) ? (8'hb0) : (8'ha5)) : (^(7'h43)))) ? (~({(7'h40), (8'ha8)} ? {(8'ha5)} : (-(8'hb0)))) : ((((7'h43) << (7'h40)) ? ((8'hae) ? (8'ha5) : (8'hbb)) : ((7'h43) ? (8'hbe) : (8'had))) < (((8'hb6) ^~ (8'haa)) <= (+(8'ha4))))) : ((~^((+(8'hac)) ~^ {(7'h42), (8'ha8)})) ? (~^(((8'hb3) & (8'hb3)) ? ((8'ha0) < (8'hb2)) : ((8'ha2) ? (8'hb8) : (8'hb5)))) : (^~(~|(8'hbd))))))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire46;
  input wire [(4'hc):(1'h0)] wire45;
  input wire signed [(3'h6):(1'h0)] wire44;
  input wire signed [(3'h6):(1'h0)] wire43;
  input wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  assign y = {wire54,
                 wire48,
                 wire47,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire47 = (~^(wire45[(2'h3):(1'h0)] * (wire42 ?
                      ((wire43 ^ wire43) ?
                          (wire45 ?
                              wire42 : wire45) : wire45[(4'hb):(1'h1)]) : wire45[(3'h4):(3'h4)])));
  assign wire48 = ((((8'hb0) <<< (wire43[(3'h5):(2'h2)] ^ $signed(wire43))) | ((8'hbb) ~^ {$signed(wire45)})) <= $signed((~^(wire45[(4'hc):(4'ha)] ?
                      $unsigned(wire45) : wire45[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      reg49 <= {($signed(wire42) ?
              wire47[(1'h1):(1'h1)] : $signed((!wire45[(4'hb):(2'h2)])))};
      reg50 <= wire46[(2'h2):(1'h1)];
      reg51 <= wire44[(1'h1):(1'h1)];
      reg52 <= wire43;
      reg53 <= (!wire48);
    end
  assign wire54 = (((reg51 ?
                          {$signed(wire44)} : ({reg51} == (wire47 >> wire42))) ?
                      (+(&(reg52 ?
                          wire43 : wire43))) : $unsigned(((reg49 | wire45) ^~ (wire43 || wire42)))) > $signed((reg53 == $unsigned((wire42 ?
                      reg52 : wire47)))));
endmodule
