module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h246):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire140;
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire46,
                 wire47,
                 wire140,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
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
                 reg34,
                 reg33,
                 reg32,
                 reg31,
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
                 (1'h0)};
  assign wire5 = ((~(~^({(8'hbf), (8'hb9)} ?
                         (wire3 ^ wire2) : (wire4 <<< wire3)))) ?
                     (($unsigned($unsigned(wire2)) >> wire1[(1'h0):(1'h0)]) >> (((^(8'hb0)) ?
                         (|wire3) : wire3[(1'h1):(1'h0)]) < (~$unsigned(wire0)))) : (~((+$signed(wire1)) ?
                         (wire1 ?
                             wire4[(4'h8):(4'h8)] : $unsigned(wire3)) : ((^~wire0) * wire1))));
  assign wire6 = $signed($signed($unsigned((wire1[(4'ha):(1'h1)] || (-wire0)))));
  assign wire7 = $unsigned(({$signed($unsigned((8'ha3)))} >> $signed(((wire6 * wire5) ?
                     wire4[(4'h9):(3'h6)] : wire6))));
  assign wire8 = (|(8'hb9));
  assign wire9 = wire1;
  assign wire10 = wire0;
  assign wire11 = (~^{wire1, ($signed(wire10) - (8'hbd))});
  always
    @(posedge clk) begin
      if ({wire8[(1'h0):(1'h0)],
          $signed({((wire8 ? wire11 : wire9) != wire9)})})
        begin
          reg12 <= wire10;
          if ($unsigned({reg12, $unsigned((8'ha2))}))
            begin
              reg13 <= $unsigned(wire8[(2'h2):(2'h2)]);
            end
          else
            begin
              reg13 <= ((wire3[(2'h2):(1'h1)] ?
                      {$unsigned(wire1)} : $signed(wire5[(4'hc):(2'h3)])) ?
                  $signed(wire9[(4'h9):(4'h9)]) : wire4[(4'hc):(3'h4)]);
              reg14 <= $unsigned($unsigned(wire0));
              reg15 <= wire8;
              reg16 <= (~^$unsigned(reg15));
            end
          reg17 <= $signed(wire8[(3'h7):(2'h2)]);
        end
      else
        begin
          reg12 <= reg15[(3'h4):(2'h3)];
          reg13 <= (((wire9[(3'h6):(1'h0)] ?
                  ((wire9 + wire5) >>> (8'hba)) : $unsigned($signed(reg14))) || (|reg12)) ?
              {(-((~^wire8) ? $signed(wire6) : wire10[(4'h9):(3'h4)])),
                  (~&(-(wire0 >= wire9)))} : wire0);
          reg14 <= reg16;
        end
      reg18 <= wire9[(4'h9):(1'h1)];
      if ({(($unsigned($signed(wire4)) != (&reg12[(1'h1):(1'h1)])) ^ $unsigned($signed((8'h9c))))})
        begin
          if ((~&wire9[(3'h7):(2'h3)]))
            begin
              reg19 <= ($signed($signed((8'hbb))) << $signed($unsigned(($unsigned(reg14) ?
                  $unsigned((8'had)) : (wire6 ? wire9 : reg12)))));
              reg20 <= (~|$unsigned((reg18 - (^~(+wire0)))));
            end
          else
            begin
              reg19 <= wire7;
              reg20 <= (reg13[(3'h6):(2'h3)] ?
                  wire4[(1'h1):(1'h1)] : ((&(reg15 ^ (~|wire2))) ?
                      (wire9 >= reg13) : $signed($signed({wire9, wire5}))));
              reg21 <= (^~wire1[(4'hf):(3'h6)]);
            end
        end
      else
        begin
          if ($signed(wire11[(2'h2):(1'h1)]))
            begin
              reg19 <= $signed($unsigned(reg20));
              reg20 <= $signed($signed(((8'h9c) & wire4[(4'hf):(3'h5)])));
              reg21 <= wire2[(1'h1):(1'h1)];
            end
          else
            begin
              reg19 <= wire7;
              reg20 <= $unsigned($signed($signed($unsigned((+reg15)))));
            end
          reg22 <= (|$unsigned((!((wire0 && reg13) <= $signed(wire3)))));
        end
      if ((^~$unsigned($signed((reg20 == $signed(reg17))))))
        begin
          if ($signed(reg21[(4'h8):(3'h4)]))
            begin
              reg23 <= wire4[(4'he):(2'h2)];
              reg24 <= {$signed($unsigned((wire7 << $signed((8'haf))))),
                  $signed((reg18 > ((^~reg18) << reg21[(5'h12):(5'h11)])))};
              reg25 <= $signed($unsigned(((~$signed(reg21)) ?
                  ((wire4 << reg23) >>> (8'haf)) : (^~wire2[(2'h2):(1'h1)]))));
              reg26 <= (wire8[(1'h0):(1'h0)] >>> $unsigned((8'ha8)));
            end
          else
            begin
              reg23 <= $signed((~^reg12));
              reg24 <= wire7;
            end
          if ($unsigned($unsigned(reg14[(4'hf):(4'hb)])))
            begin
              reg27 <= (^~(reg26 ?
                  wire11[(4'hd):(2'h2)] : reg22[(3'h6):(1'h1)]));
              reg28 <= (8'hac);
              reg29 <= $unsigned((reg17 <<< reg20[(1'h0):(1'h0)]));
              reg30 <= {(^~((((8'hb9) || reg21) ?
                          $unsigned((8'ha3)) : (reg25 ? reg27 : (7'h41))) ?
                      (~^wire1) : $signed((reg26 ? wire4 : reg19)))),
                  $unsigned($signed($signed({reg17, wire2})))};
            end
          else
            begin
              reg27 <= $unsigned(reg18);
              reg28 <= reg16[(1'h1):(1'h0)];
              reg29 <= $unsigned($unsigned((wire3[(1'h0):(1'h0)] > (!reg14))));
              reg30 <= wire10;
            end
          if (((7'h41) ?
              (^$unsigned(((wire2 <= wire10) ?
                  {wire3} : (-reg12)))) : ($signed((|reg14)) != ((wire9[(4'hb):(1'h1)] ?
                  wire10[(3'h6):(2'h2)] : wire5) & ((reg26 ? wire11 : (8'hb0)) ?
                  (reg22 ? reg24 : reg13) : reg14[(3'h6):(1'h0)])))))
            begin
              reg31 <= (8'ha5);
              reg32 <= $signed((+(8'haa)));
              reg33 <= $signed($signed(((^~reg24) ? (~&(!reg14)) : wire8)));
            end
          else
            begin
              reg31 <= ($unsigned($signed((8'hbb))) ?
                  $unsigned($signed(wire10)) : (&((-$signed(reg23)) | $unsigned($unsigned(reg28)))));
            end
          reg34 <= ({wire1,
              (reg30 ^ {$unsigned(wire5),
                  reg26[(2'h2):(1'h0)]})} ^~ wire9[(2'h2):(1'h0)]);
        end
      else
        begin
          if ((($unsigned((((8'had) == reg18) ~^ reg28)) ?
                  wire5[(4'hb):(3'h7)] : $unsigned(($unsigned(reg28) >> (^~(8'ha6))))) ?
              $unsigned(($signed($signed(wire5)) ?
                  reg28 : ((reg21 << reg18) ?
                      reg14 : (&wire7)))) : $unsigned($unsigned($signed((reg19 ?
                  reg22 : wire1))))))
            begin
              reg23 <= wire6[(4'h8):(2'h2)];
              reg24 <= reg15[(2'h2):(1'h1)];
            end
          else
            begin
              reg23 <= (!reg16);
              reg24 <= reg18[(1'h1):(1'h1)];
            end
          reg25 <= ({$signed(reg27[(4'ha):(1'h1)])} ?
              ({(((8'hbc) > (8'haa)) * (wire8 + wire2))} ?
                  (^(~$signed(reg18))) : (~($unsigned(wire7) ?
                      $unsigned(reg17) : $unsigned(reg16)))) : $signed(reg22[(3'h5):(3'h4)]));
          if (reg27)
            begin
              reg26 <= $signed((wire3 ~^ reg14));
            end
          else
            begin
              reg26 <= (reg34[(3'h7):(3'h6)] ?
                  (wire3[(1'h0):(1'h0)] * ($signed(reg14) ?
                      wire6 : wire2)) : reg17);
              reg27 <= ($signed(wire1) ? (~^wire1) : (~^wire11));
              reg28 <= {reg30, (~&$unsigned($unsigned({wire10, reg24})))};
              reg29 <= (~wire3[(1'h1):(1'h1)]);
            end
          reg30 <= wire0[(3'h5):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      if ((^(8'ha3)))
        begin
          reg35 <= reg32;
        end
      else
        begin
          reg35 <= (^~$unsigned($unsigned((-reg14[(2'h2):(1'h1)]))));
          reg36 <= {$unsigned({wire0,
                  {(wire9 ? reg33 : wire8), (wire1 ? wire0 : wire0)}}),
              reg27};
          reg37 <= $signed({(~|$unsigned((8'ha2)))});
          reg38 <= $unsigned($unsigned(((|{reg32}) ?
              {wire1} : ($unsigned(reg24) ? reg36 : $signed((8'hae))))));
        end
      reg39 <= (!reg38[(1'h0):(1'h0)]);
      if ($unsigned((($signed($signed(reg18)) ?
              reg22 : {{wire8, wire5}, (reg15 ? reg12 : wire4)}) ?
          reg13[(1'h0):(1'h0)] : ($signed((wire5 >= (8'ha0))) && reg32[(1'h0):(1'h0)]))))
        begin
          reg40 <= ($unsigned(wire4) <<< (wire11 && $signed(((reg12 ?
              reg33 : reg14) < $unsigned(reg12)))));
          reg41 <= reg26;
          if (wire6[(4'hb):(3'h7)])
            begin
              reg42 <= reg30;
              reg43 <= $unsigned($signed($signed($signed((wire1 >= reg40)))));
              reg44 <= $signed($unsigned(((reg18[(3'h4):(2'h3)] * {reg28}) - reg21)));
            end
          else
            begin
              reg42 <= $signed({(reg15 >>> (reg16[(3'h7):(2'h3)] ?
                      reg20 : {wire6, wire10}))});
              reg43 <= (^wire0[(2'h3):(1'h1)]);
            end
        end
      else
        begin
          reg40 <= reg17;
          reg41 <= reg21;
          if (({(reg27 >> $signed((reg31 ~^ reg25)))} ?
              $unsigned($unsigned({$signed((8'hbc))})) : reg16[(1'h0):(1'h0)]))
            begin
              reg42 <= {$unsigned(reg44)};
              reg43 <= (8'hac);
              reg44 <= $unsigned({$unsigned({reg31[(4'he):(3'h7)]})});
            end
          else
            begin
              reg42 <= $signed({(~|{$signed(reg31), {reg32}}), (8'h9c)});
              reg43 <= $unsigned({(8'had)});
            end
        end
      reg45 <= $unsigned($unsigned(reg23));
    end
  assign wire46 = (~|$unsigned((+$signed({wire7}))));
  assign wire47 = (($unsigned(reg16) + (!{$unsigned(wire10),
                          $unsigned(reg26)})) ?
                      wire7 : $signed($unsigned($signed((~^reg27)))));
  module48 #() modinst141 (wire140, clk, reg25, reg29, reg20, reg12, wire46);
  always
    @(posedge clk) begin
      reg142 <= ((7'h42) * (^{reg32[(3'h4):(1'h0)]}));
      reg143 <= ((-reg44[(2'h3):(1'h1)]) <<< (~&(($unsigned(reg14) ?
              reg16[(2'h3):(2'h2)] : (~reg34)) ?
          $signed($unsigned(reg24)) : reg30)));
      reg144 <= $signed($unsigned(wire6));
      reg145 <= wire7;
      reg146 <= $unsigned(reg19[(3'h5):(2'h3)]);
    end
endmodule

module module48
#(parameter param138 = ({({((8'hbd) ? (8'h9d) : (7'h43))} & (&((8'hb2) <<< (8'ha4)))), ((+((8'h9c) ? (8'ha4) : (8'ha6))) >> (~{(8'hb7)}))} ? {((|(8'hbf)) - {(~(8'hae))})} : ({({(8'hb8), (8'hae)} ? {(8'hb2)} : (^~(8'hae))), ((^~(8'hb3)) <<< (^~(8'hbd)))} ? (8'hb2) : (+(8'haa)))), 
parameter param139 = (^~(~|{((~^param138) ? param138 : (~param138))})))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire53;
  input wire signed [(3'h7):(1'h0)] wire52;
  input wire signed [(4'h9):(1'h0)] wire51;
  input wire [(4'hd):(1'h0)] wire50;
  input wire [(3'h4):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  assign y = {wire136,
                 wire112,
                 wire111,
                 wire109,
                 wire74,
                 wire67,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 (1'h0)};
  assign wire54 = (8'hb4);
  assign wire55 = ($unsigned($unsigned(((-(8'ha5)) ?
                      wire52[(3'h5):(3'h4)] : (~|(8'hb6))))) ^~ (&((-(^(8'ha1))) ?
                      wire49 : $signed($unsigned(wire49)))));
  assign wire56 = $signed(($signed(($signed((8'hb0)) + $signed(wire53))) >>> $signed(wire54)));
  assign wire57 = ($unsigned($unsigned(wire53)) & {$unsigned((|$signed((8'h9e))))});
  always
    @(posedge clk) begin
      reg58 <= ($unsigned(((wire53[(2'h3):(1'h0)] << wire49) > $signed(wire57[(1'h1):(1'h1)]))) ?
          wire50 : (-(~&wire55[(3'h5):(3'h5)])));
      reg59 <= wire56[(1'h0):(1'h0)];
      if ($signed((wire52 ?
          (({wire55, wire49} ? $signed(wire49) : wire56) ?
              ((+wire52) ?
                  $unsigned(wire55) : $signed(wire50)) : (|(+wire57))) : wire50)))
        begin
          if (wire55[(1'h0):(1'h0)])
            begin
              reg60 <= {$unsigned(wire55), reg59};
              reg61 <= $signed((((!$unsigned(wire54)) & $signed((reg59 - wire55))) >= ((^~wire50[(3'h7):(2'h3)]) ?
                  $signed(wire53) : ($signed(wire49) ?
                      (wire52 ? wire49 : reg59) : (~&(8'hb6))))));
              reg62 <= reg61;
              reg63 <= ((!$signed((-(reg61 ^ reg58)))) >>> wire49[(1'h1):(1'h1)]);
              reg64 <= ($signed(reg61[(2'h3):(1'h1)]) && reg62);
            end
          else
            begin
              reg60 <= (((((^~(8'hbe)) >>> wire57[(1'h0):(1'h0)]) >= $signed(wire50[(4'h8):(1'h1)])) ?
                      wire55 : (+($unsigned((8'ha0)) ?
                          $unsigned(wire52) : $signed(wire52)))) ?
                  reg59[(3'h5):(1'h0)] : ($signed(reg64[(3'h5):(1'h1)]) ?
                      (($signed((8'hbd)) <= $signed(reg58)) ~^ (^$unsigned((8'hb4)))) : ($signed($signed(reg63)) ~^ (~^((8'ha9) ?
                          reg60 : (8'haa))))));
              reg61 <= (~|wire56[(4'hd):(1'h1)]);
              reg62 <= {($unsigned((7'h42)) ?
                      $unsigned((+(reg61 ?
                          reg60 : reg62))) : $unsigned($signed(wire54)))};
              reg63 <= $signed(reg60);
            end
        end
      else
        begin
          reg60 <= (wire49 && $signed(reg61[(2'h2):(1'h1)]));
          reg61 <= $signed($unsigned($unsigned($signed({reg62, wire52}))));
          reg62 <= wire52[(2'h2):(1'h0)];
          reg63 <= {{({((8'hb4) ? wire56 : wire57)} ?
                      ($signed(wire54) ?
                          $unsigned(wire54) : $unsigned(reg62)) : $unsigned(wire49)),
                  ((reg60 ?
                          (wire50 ? wire55 : reg64) : (reg61 ?
                              wire57 : wire53)) ?
                      (&((8'hbb) ?
                          reg63 : (8'h9f))) : ((&reg63) == reg64[(2'h2):(1'h0)]))}};
        end
      reg65 <= reg63[(2'h3):(1'h1)];
      reg66 <= {(|(~&((wire51 >>> (8'hba)) ?
              (wire55 ? reg65 : (8'hb6)) : (wire53 ? reg60 : wire57)))),
          reg63};
    end
  assign wire67 = $unsigned((((~wire57) ?
                          (wire50[(3'h5):(2'h3)] * (wire54 <= wire49)) : $signed($unsigned(reg65))) ?
                      (~&((reg63 <= wire55) > (wire55 << reg65))) : reg65[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire49)
        begin
          if ((reg63 + $signed(((!(reg59 & wire55)) <= reg65[(2'h3):(2'h3)]))))
            begin
              reg68 <= wire67;
              reg69 <= reg66;
              reg70 <= $signed(({reg64[(3'h4):(3'h4)], wire52} ?
                  $signed(reg66[(3'h5):(1'h0)]) : (($signed(reg64) != reg64) ?
                      wire67 : (~&{wire55}))));
            end
          else
            begin
              reg68 <= $unsigned($signed(($unsigned(((8'h9f) ?
                      reg62 : wire67)) ?
                  (~|$unsigned(reg65)) : $unsigned($unsigned((8'had))))));
            end
          reg71 <= ((!(+((~wire51) & (wire49 != wire50)))) + (!(&(+reg65[(3'h5):(2'h3)]))));
        end
      else
        begin
          reg68 <= ($unsigned($signed(reg65[(3'h6):(3'h4)])) ?
              $unsigned(reg60) : $unsigned((reg71[(5'h12):(5'h12)] ?
                  reg66 : reg69)));
          reg69 <= (wire55[(2'h3):(2'h2)] | (wire53[(1'h0):(1'h0)] == $unsigned(wire53[(4'h9):(1'h1)])));
          if (reg62)
            begin
              reg70 <= (reg68 ? (reg59 ^ reg61) : wire53);
              reg71 <= wire55[(3'h5):(3'h4)];
              reg72 <= reg69;
              reg73 <= (~&{((wire53[(4'he):(4'hc)] && (|reg59)) < (-(~^reg65)))});
            end
          else
            begin
              reg70 <= (!reg70);
              reg71 <= (|{(($unsigned((8'hb0)) * reg69) ?
                      {wire49} : reg69[(2'h3):(2'h3)]),
                  ({$signed(reg64)} ?
                      reg59[(2'h2):(1'h0)] : (reg60 ?
                          $unsigned(reg66) : (reg66 ~^ reg73)))});
            end
        end
    end
  assign wire74 = wire49[(3'h4):(3'h4)];
  module75 #() modinst110 (.wire77(reg58), .wire76(wire57), .clk(clk), .y(wire109), .wire79(wire53), .wire78(reg66));
  assign wire111 = ($unsigned((reg71[(5'h11):(4'hd)] ?
                       $signed({reg58}) : (wire57[(3'h6):(3'h6)] >= ((7'h42) ^~ (7'h42))))) >>> $signed({({reg58,
                           wire74} >= (reg59 ? wire52 : reg68))}));
  assign wire112 = $signed(wire57[(4'h9):(3'h7)]);
  module113 #() modinst137 (.y(wire136), .clk(clk), .wire117(wire111), .wire114(reg59), .wire116(reg65), .wire115(reg58), .wire118(wire54));
endmodule

module module113
#(parameter param135 = (((&(8'hbf)) ? {(((8'had) + (8'ha7)) ? ((8'hbb) ? (8'hb7) : (8'hb2)) : (^(8'hb3))), {(~&(8'hbf)), (~(8'hb9))}} : (|((8'ha8) ? (~|(8'haf)) : ((8'ha8) ? (8'hae) : (8'hab))))) ? {((((8'hb1) & (8'hb8)) <<< (|(8'ha7))) ? (((8'ha0) < (8'hb3)) >= (8'hb7)) : {((8'hb8) == (8'hb8))})} : (((((8'hab) ? (8'hba) : (7'h42)) != (^(8'hb5))) ? (8'h9f) : (((8'haf) ? (8'ha0) : (8'hb3)) ? ((8'hbc) ? (8'hb4) : (8'hbe)) : (&(8'hba)))) ? (8'hb0) : {((~(8'had)) ? ((7'h42) ? (7'h43) : (8'hbd)) : ((8'hb5) < (8'hb1))), {((8'hba) <<< (8'ha4))}})))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire118;
  input wire signed [(5'h10):(1'h0)] wire117;
  input wire [(3'h7):(1'h0)] wire116;
  input wire signed [(4'hc):(1'h0)] wire115;
  input wire signed [(4'h8):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire129;
  wire [(5'h13):(1'h0)] wire128;
  wire [(4'he):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire119;
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire119,
                 reg130,
                 reg125,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire119 = $unsigned(wire114);
  always
    @(posedge clk) begin
      reg120 <= wire115;
      reg121 <= $unsigned(reg120[(2'h2):(1'h1)]);
      reg122 <= wire117;
      reg123 <= (reg122 ?
          (wire116 ?
              $signed(reg121) : ($unsigned((reg122 < wire116)) & (-(7'h44)))) : $signed(wire116));
    end
  assign wire124 = wire116;
  always
    @(posedge clk) begin
      reg125 <= (((($signed(reg122) >= (^wire119)) * ((reg120 >= reg121) ^~ (wire124 + wire118))) != (^~$unsigned((reg120 >> reg121)))) ?
          reg122[(3'h6):(3'h4)] : wire114);
    end
  assign wire126 = reg125;
  assign wire127 = $unsigned(reg125[(4'hc):(3'h6)]);
  assign wire128 = reg125[(4'hd):(4'hb)];
  assign wire129 = ((wire118[(2'h2):(1'h1)] >> reg122) ?
                       ((($signed(wire114) >>> (!(7'h40))) ^~ (+(wire116 ^~ wire115))) || (!$signed((wire128 ?
                           reg121 : wire114)))) : ($signed((7'h44)) ?
                           wire127 : wire126[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg130 <= wire118[(3'h6):(1'h1)];
    end
  assign wire131 = reg123[(4'h8):(3'h7)];
  assign wire132 = wire128[(4'hc):(4'hb)];
  assign wire133 = reg123;
  assign wire134 = reg123[(4'h9):(1'h0)];
endmodule

module module75
#(parameter param107 = ((((^(^(8'hb8))) ? ({(8'hbe)} * ((7'h41) && (7'h43))) : (^~((8'hb2) ? (8'ha8) : (8'haf)))) ^ {(!((8'ha8) != (8'h9f)))}) & (~^{(((7'h41) ? (7'h42) : (7'h43)) >> (~^(8'hb0))), {((8'hb4) + (8'hb4)), ((8'hb4) - (8'ha0))}})), 
parameter param108 = param107)
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire79;
  input wire [(4'h9):(1'h0)] wire78;
  input wire [(4'ha):(1'h0)] wire77;
  input wire signed [(3'h4):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  wire [(5'h10):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire80;
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire80 = wire77[(4'ha):(3'h4)];
  assign wire81 = ((wire77[(3'h5):(3'h4)] ?
                          $signed(wire77) : wire78[(3'h6):(3'h5)]) ?
                      (+$signed((&wire77[(4'h9):(3'h4)]))) : (wire80 ~^ {$signed($unsigned((8'h9f))),
                          $signed($unsigned(wire76))}));
  assign wire82 = wire79;
  assign wire83 = $signed((((-(+wire77)) || (^~$unsigned(wire77))) ^ (wire82[(3'h4):(2'h3)] >= wire79[(2'h2):(1'h0)])));
  assign wire84 = ($unsigned((8'hb7)) == (wire82[(1'h1):(1'h0)] ?
                      $unsigned((-{wire82})) : {wire83}));
  assign wire85 = (((~^(7'h43)) ?
                      (!($signed(wire81) * (wire79 ?
                          wire78 : wire82))) : {$unsigned(wire79[(1'h0):(1'h0)]),
                          (+$unsigned((8'hac)))}) || $unsigned(wire78[(1'h1):(1'h0)]));
  assign wire86 = wire82[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      if ((&((^({wire80} ? {wire79} : (wire77 << (8'hb1)))) ?
          $signed($signed((wire78 ^ wire82))) : (((!(8'hbd)) + (8'hbd)) ?
              ((~^wire82) - (wire85 ? wire84 : wire85)) : wire85))))
        begin
          reg87 <= (+($unsigned(wire76[(1'h0):(1'h0)]) ?
              (({wire77, (8'hb3)} ^~ $unsigned(wire84)) ?
                  ({wire76,
                      wire78} >> $unsigned(wire79)) : ((wire79 <= wire79) ?
                      wire77[(2'h3):(2'h3)] : wire79[(1'h0):(1'h0)])) : $signed(((wire77 ?
                  wire85 : wire83) - $unsigned(wire76)))));
          reg88 <= wire80;
          if ((!wire86))
            begin
              reg89 <= (((~^(wire81 != (~wire82))) ^ ($signed(wire80[(2'h2):(1'h1)]) >>> ((!wire80) || $unsigned(wire80)))) - (8'hb9));
              reg90 <= $unsigned({wire76, $unsigned($unsigned((&(8'ha0))))});
              reg91 <= wire83[(3'h6):(1'h1)];
            end
          else
            begin
              reg89 <= (^(($signed(reg89) | ({wire83} ?
                      $unsigned(wire86) : (reg88 > wire83))) ?
                  ($signed((!(8'hb1))) != $unsigned({wire78,
                      reg87})) : (reg87[(4'hc):(3'h6)] ?
                      {$unsigned(wire77)} : $signed($signed(wire83)))));
            end
          reg92 <= reg90;
          reg93 <= (~^(~&((~^reg87) ?
              {$unsigned(reg92)} : ($signed((7'h42)) ?
                  (reg87 ? reg91 : wire84) : (reg88 & wire79)))));
        end
      else
        begin
          reg87 <= reg87[(3'h6):(2'h2)];
          reg88 <= $unsigned((({$unsigned(reg88)} >= ((reg92 ~^ wire82) ?
                  $signed(reg90) : (wire81 ? wire76 : wire76))) ?
              ($signed(((8'ha8) << reg90)) ~^ (~&$unsigned(wire85))) : $signed(reg87[(4'hd):(4'h9)])));
          reg89 <= ({reg93} <= (-$unsigned(reg87[(3'h4):(1'h1)])));
          if ($unsigned(wire76[(2'h2):(1'h0)]))
            begin
              reg90 <= $unsigned((-{((wire79 ?
                      wire79 : wire80) != (reg87 >= wire85)),
                  {{wire86, reg93}, (^reg93)}}));
              reg91 <= (wire78 ?
                  {reg92,
                      (reg89[(3'h7):(2'h2)] ?
                          $unsigned((|wire77)) : (+wire81[(3'h4):(3'h4)]))} : wire86);
              reg92 <= ($unsigned(((+(reg93 | reg90)) ?
                      wire80[(2'h2):(2'h2)] : ((8'hb4) <= reg87[(4'hb):(1'h1)]))) ?
                  ($unsigned((&$signed((8'hbb)))) ?
                      (!((^~reg91) ?
                          (wire84 >>> wire81) : (reg88 ?
                              reg92 : wire81))) : ($signed((reg90 ?
                              wire80 : (8'haf))) ?
                          wire84 : (reg92 ?
                              (reg87 ? wire80 : (8'hae)) : {wire83,
                                  wire79}))) : (~|{((^reg92) ?
                          wire78 : (|wire85)),
                      $signed(wire77)}));
              reg93 <= (((&{(!reg93)}) ?
                      $unsigned((wire78 ?
                          reg92[(4'hc):(1'h0)] : (reg88 ^~ reg87))) : $signed(wire79)) ?
                  (~&$unsigned(reg88)) : {$unsigned($signed((wire86 ?
                          reg87 : (8'hab)))),
                      (|(wire82 ? ((8'hb4) ? wire81 : wire77) : (&reg90)))});
            end
          else
            begin
              reg90 <= ((~&reg88) ?
                  reg93[(2'h2):(1'h0)] : (~|(reg89[(4'hb):(2'h2)] ?
                      (wire76 ? (-wire81) : (8'hbc)) : (&((8'hb5) ?
                          wire86 : reg93)))));
              reg91 <= wire85;
              reg92 <= wire80;
              reg93 <= wire82;
            end
          reg94 <= wire80;
        end
    end
  assign wire95 = (((&{reg87[(1'h1):(1'h1)], $signed(reg90)}) ?
                      (^$unsigned((wire81 <<< reg87))) : $signed({wire84})) >= $signed((wire76[(3'h4):(2'h2)] >> $signed($unsigned((8'ha6))))));
  assign wire96 = (reg90 ? {(|reg90), reg87} : reg91);
  assign wire97 = $unsigned(($signed((wire78[(2'h3):(1'h1)] & reg93)) <= wire77));
  assign wire98 = (~(wire83[(1'h0):(1'h0)] != wire80[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg99 <= reg87[(1'h0):(1'h0)];
      reg100 <= $unsigned((^~$unsigned(wire98)));
      reg101 <= $unsigned(($unsigned(reg87[(4'hf):(4'h9)]) ?
          $unsigned(((wire95 & wire79) || (reg87 < wire95))) : $signed(((^~(8'hac)) ?
              {wire79, reg100} : (~&wire79)))));
      reg102 <= (wire78[(1'h1):(1'h0)] ?
          wire78 : (reg101[(3'h5):(2'h2)] && (-($unsigned(wire86) + (reg101 <<< wire79)))));
    end
  assign wire103 = (^(((|(|wire83)) ~^ ((reg87 * reg87) ?
                       wire95[(2'h3):(1'h0)] : wire79[(1'h0):(1'h0)])) <<< (|($unsigned(reg91) ?
                       wire81 : wire76[(2'h3):(2'h3)]))));
  assign wire104 = wire98[(3'h5):(3'h5)];
  assign wire105 = (($unsigned(((wire103 ? wire78 : (8'hb1)) >> wire97)) ?
                       $signed($unsigned($signed(wire77))) : (~|(~|reg90[(4'hd):(4'hc)]))) >>> $unsigned(((((8'hb9) ?
                       wire76 : reg91) ~^ $signed(wire86)) | ($signed(wire77) ^ wire98[(2'h3):(1'h1)]))));
  assign wire106 = (reg101 >> $unsigned(reg92[(2'h2):(2'h2)]));
endmodule
