module top
#(parameter param169 = {({(-((8'had) >>> (8'hb2)))} && ({(-(8'had))} + {(+(8'ha8))}))}, 
parameter param170 = {((|(|(param169 ? param169 : param169))) + param169)})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire167;
  wire [(3'h7):(1'h0)] wire166;
  wire [(3'h5):(1'h0)] wire162;
  wire [(4'he):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire160;
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg163 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire162,
                 wire4,
                 wire20,
                 wire21,
                 wire160,
                 reg168,
                 reg165,
                 reg164,
                 reg163,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
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
                 reg5,
                 (1'h0)};
  assign wire4 = ((8'hbf) ?
                     ($unsigned((7'h42)) << {((8'h9d) ?
                             wire2[(3'h5):(2'h2)] : $unsigned(wire1))}) : wire2);
  always
    @(posedge clk) begin
      reg5 <= ((wire1[(3'h4):(2'h3)] | wire1) == wire2);
      if ($unsigned({$signed(({(8'hb2)} ^~ wire1)), (!{(^~wire2)})}))
        begin
          if ((8'hb1))
            begin
              reg6 <= (^~(reg5 ? (8'hab) : wire2[(3'h6):(2'h2)]));
              reg7 <= ((|$unsigned((~^wire1[(3'h4):(1'h1)]))) > reg6[(1'h1):(1'h0)]);
              reg8 <= wire0;
            end
          else
            begin
              reg6 <= $unsigned(wire1);
            end
          reg9 <= reg5[(3'h4):(1'h1)];
          reg10 <= wire0[(5'h10):(4'he)];
        end
      else
        begin
          reg6 <= {{(&((wire4 && (8'hbb)) ? reg7 : (reg7 << (8'hae))))}};
          reg7 <= (!$signed(wire4[(3'h5):(1'h0)]));
          reg8 <= {reg5};
        end
      reg11 <= {reg9[(1'h0):(1'h0)], (7'h44)};
      reg12 <= ($unsigned(wire3) ^ (&{(wire0 & (reg9 ? wire2 : reg5))}));
      if ((wire0 != ((~&(~|$unsigned(reg6))) > (^reg7[(4'hc):(4'hb)]))))
        begin
          reg13 <= reg8[(5'h11):(3'h7)];
          reg14 <= ($signed((~&(^~reg6[(1'h1):(1'h0)]))) ?
              $unsigned($unsigned((reg9 ?
                  {reg5} : reg8))) : ({($signed((8'h9e)) == reg10[(3'h5):(1'h0)])} == (^~reg6)));
          reg15 <= ($unsigned(($unsigned(reg5[(3'h6):(3'h5)]) ?
                  $unsigned(wire3[(3'h5):(3'h4)]) : ((wire4 == reg8) >> {reg10}))) ?
              reg12 : reg11[(3'h4):(1'h1)]);
          reg16 <= (|$unsigned($unsigned($unsigned($unsigned(wire1)))));
          reg17 <= $unsigned(((~|$unsigned(reg10)) ?
              (reg7[(4'h9):(2'h2)] ?
                  $unsigned((~|reg12)) : $unsigned(((8'hab) * wire1))) : (~&({(8'ha1)} ?
                  reg6[(2'h3):(2'h2)] : ((8'hbc) ? reg10 : (8'hab))))));
        end
      else
        begin
          reg13 <= reg16;
          if ($unsigned($unsigned(wire1[(2'h3):(1'h1)])))
            begin
              reg14 <= reg10;
              reg15 <= reg8[(4'ha):(4'h9)];
              reg16 <= reg10;
            end
          else
            begin
              reg14 <= reg14[(3'h5):(2'h2)];
            end
          reg17 <= {reg6[(2'h3):(1'h0)],
              (reg16[(4'h9):(3'h7)] != reg12[(1'h0):(1'h0)])};
          if ($signed((reg17[(1'h1):(1'h1)] ?
              (((+wire0) ^~ ((8'hb5) <<< reg11)) ?
                  {(+reg16)} : $signed((reg17 <= reg17))) : {$unsigned((!reg15)),
                  (reg16[(3'h7):(1'h0)] ? (+reg17) : (-reg15))})))
            begin
              reg18 <= {(reg6 | $unsigned($unsigned(reg14[(1'h1):(1'h1)])))};
            end
          else
            begin
              reg18 <= ($signed((8'hb5)) ?
                  $unsigned(reg14[(2'h2):(2'h2)]) : ($signed({$signed(reg11),
                          (&reg9)}) ?
                      ({reg15, (~reg14)} ?
                          $signed(reg17[(3'h7):(1'h1)]) : {reg11}) : (~^$unsigned(reg17))));
              reg19 <= $unsigned(($signed(((reg14 | reg6) ?
                      (reg9 ? reg14 : wire1) : $signed((8'hba)))) ?
                  ($unsigned(((8'hac) ?
                      reg8 : reg12)) + reg18) : $unsigned($unsigned((reg10 ?
                      reg17 : reg13)))));
            end
        end
    end
  assign wire20 = $unsigned(($unsigned((~&(wire0 - reg8))) ?
                      (wire2 ?
                          reg19[(1'h1):(1'h0)] : (|reg16[(2'h3):(1'h0)])) : reg16[(4'hd):(2'h3)]));
  assign wire21 = ((8'ha1) >> ((({reg8, reg16} > (reg17 ?
                      reg12 : (8'hb6))) ^ (reg9 * $unsigned(reg19))) >> (wire20[(3'h7):(3'h7)] ?
                      $signed($unsigned(reg9)) : ($signed(reg14) | reg16[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg22 <= (~^$signed((^~reg13)));
      if ($signed($unsigned({reg19[(4'hf):(1'h0)]})))
        begin
          reg23 <= {(reg7[(4'ha):(2'h2)] != {{{reg18}}}),
              ($signed($unsigned($unsigned(wire4))) ?
                  reg5 : ((~|wire3) && {$unsigned(wire2)}))};
        end
      else
        begin
          reg23 <= (7'h43);
          reg24 <= (~^(&$signed(($signed(wire2) + (reg15 ? (8'haa) : wire3)))));
        end
      reg25 <= (($unsigned((!$unsigned(reg22))) ?
          reg19 : $unsigned(reg19)) >= $unsigned($unsigned((!(wire0 * reg22)))));
    end
  module26 #() modinst161 (wire160, clk, wire0, wire3, reg5, reg7, wire1);
  assign wire162 = (($signed(((reg6 ?
                           wire0 : reg24) && (reg22 ~^ reg22))) ^ wire20) ?
                       $unsigned((((reg22 ? (8'hb8) : reg15) ?
                           (reg15 > reg17) : reg6[(1'h0):(1'h0)]) + $unsigned(wire1[(5'h14):(5'h14)]))) : reg16);
  always
    @(posedge clk) begin
      reg163 <= (-{{reg10[(2'h3):(2'h3)], reg11}});
      reg164 <= wire20;
      reg165 <= reg5[(3'h6):(2'h3)];
    end
  assign wire166 = (~^$unsigned($unsigned(reg164)));
  assign wire167 = ((8'hbb) && ($unsigned($signed((reg14 ? reg165 : reg165))) ?
                       $unsigned(($signed((8'hb6)) ?
                           reg24[(1'h1):(1'h1)] : (!wire21))) : (wire162 != ((reg8 ?
                               wire4 : reg164) ?
                           ((8'hb8) ^ wire20) : $signed(reg10)))));
  always
    @(posedge clk) begin
      reg168 <= (|$signed($unsigned((+{(8'ha5), reg19}))));
    end
endmodule

module module26
#(parameter param159 = (8'ha2))
(y, clk, wire27, wire28, wire29, wire30, wire31);
  output wire [(32'h2da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire27;
  input wire signed [(4'h9):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire29;
  input wire [(4'hf):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire115;
  wire [(5'h15):(1'h0)] wire156;
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  assign y = {wire158,
                 wire32,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire74,
                 wire89,
                 wire90,
                 wire112,
                 wire114,
                 wire115,
                 wire156,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
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
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
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
                 (1'h0)};
  assign wire32 = $signed($unsigned($signed((|(^wire27)))));
  always
    @(posedge clk) begin
      reg33 <= ({((wire32 >>> (~wire27)) || $unsigned($signed(wire32))),
              wire30} ?
          $signed(wire32[(2'h2):(2'h2)]) : {(~|wire29[(4'h8):(3'h6)])});
      reg34 <= wire27[(2'h3):(1'h0)];
      reg35 <= $unsigned((wire27[(4'hc):(3'h6)] >>> ((^~(wire28 ?
          (8'hb6) : reg33)) != wire29[(4'h8):(2'h2)])));
      if ({(reg33[(2'h2):(2'h2)] ?
              wire31 : ($unsigned((wire31 == reg34)) >>> (8'hb6)))})
        begin
          reg36 <= $signed(wire30[(1'h1):(1'h1)]);
          reg37 <= (wire31[(3'h7):(2'h3)] + $signed(({reg34[(2'h3):(2'h3)]} <<< $signed((reg36 ?
              wire31 : (7'h42))))));
          if ((reg35 ?
              ($unsigned(($signed((7'h43)) ?
                  wire32[(4'h8):(3'h7)] : (wire30 || (8'haf)))) * reg34[(1'h0):(1'h0)]) : ({((reg34 || wire32) | $unsigned(reg33)),
                  ($unsigned(wire27) ^~ (reg34 ?
                      wire28 : reg36))} >>> $signed($unsigned($signed(reg35))))))
            begin
              reg38 <= $unsigned(((|reg37[(2'h3):(2'h2)]) >= wire28));
            end
          else
            begin
              reg38 <= $signed(((wire27 | ($unsigned(reg35) || (reg35 ^~ wire30))) | wire27[(4'ha):(1'h0)]));
              reg39 <= (-(|wire27[(2'h3):(1'h0)]));
              reg40 <= ($signed(wire32) - wire27[(1'h1):(1'h0)]);
              reg41 <= {(reg36[(1'h0):(1'h0)] ?
                      $signed(wire29) : $signed($signed(reg34[(3'h7):(3'h5)]))),
                  reg33[(1'h0):(1'h0)]};
            end
          reg42 <= (^~reg36[(3'h6):(2'h2)]);
          reg43 <= $signed((|reg42));
        end
      else
        begin
          reg36 <= reg43[(4'h8):(3'h7)];
          reg37 <= $signed((8'ha9));
          if ($signed((reg38 || (~|($unsigned(wire32) ~^ $signed(wire29))))))
            begin
              reg38 <= $unsigned(wire30);
              reg39 <= wire28;
              reg40 <= $unsigned($unsigned(wire28[(3'h4):(1'h1)]));
              reg41 <= reg41;
            end
          else
            begin
              reg38 <= (-$unsigned($signed(reg42[(1'h0):(1'h0)])));
              reg39 <= ($unsigned(wire31) ?
                  (^reg41) : $unsigned($unsigned($signed(((8'hac) ?
                      reg38 : (8'hb9))))));
            end
          reg42 <= (&$signed(reg42));
          reg43 <= $unsigned(wire27);
        end
      reg44 <= reg33[(1'h1):(1'h0)];
    end
  assign wire45 = reg36;
  assign wire46 = $signed($unsigned($unsigned(((wire27 ?
                      reg41 : reg44) && $signed(reg37)))));
  assign wire47 = $signed($unsigned($unsigned($signed((^reg34)))));
  assign wire48 = ((+(-($unsigned((8'hb6)) & (reg38 ? wire30 : wire32)))) ?
                      $signed((!(~^(wire46 ? reg35 : wire29)))) : wire28);
  assign wire49 = $unsigned(($signed($unsigned({wire28})) ^ (reg36 ^ reg44)));
  assign wire50 = $unsigned((({reg44[(4'h9):(3'h7)],
                      (!wire32)} == reg33[(1'h0):(1'h0)]) + {(reg40[(4'hc):(3'h4)] <<< (~reg38))}));
  assign wire51 = ({$signed(reg34),
                      $unsigned({$signed(wire29)})} && wire45[(2'h2):(2'h2)]);
  assign wire52 = wire32;
  always
    @(posedge clk) begin
      reg53 <= (reg33 ?
          $unsigned(reg40[(4'h8):(1'h0)]) : $unsigned(wire52[(1'h1):(1'h1)]));
      if ($signed($signed($unsigned({(reg40 ~^ reg38)}))))
        begin
          reg54 <= (-$unsigned(($signed({reg33}) >= ((8'ha2) ?
              (wire31 + reg38) : reg53[(4'h9):(2'h3)]))));
          reg55 <= $signed(($signed(reg44) ?
              (|$unsigned(wire32[(2'h2):(1'h1)])) : (((8'hb6) ?
                  $unsigned(wire46) : (wire31 ^~ reg34)) >> reg41)));
          if ($unsigned(wire47[(3'h6):(2'h3)]))
            begin
              reg56 <= (^wire50);
              reg57 <= reg44[(4'hb):(3'h7)];
              reg58 <= ($signed(wire45) - wire45);
              reg59 <= reg35;
              reg60 <= wire31;
            end
          else
            begin
              reg56 <= wire28[(3'h4):(1'h1)];
              reg57 <= reg39[(4'hd):(2'h3)];
            end
          reg61 <= $signed($signed(($unsigned(((8'hba) ?
              reg40 : reg37)) <= {reg38[(4'hb):(1'h0)]})));
          reg62 <= (wire30[(3'h5):(2'h2)] ?
              {($signed((wire52 ^~ (8'haa))) || $unsigned(wire31[(5'h11):(4'hc)])),
                  $unsigned($signed((reg41 ?
                      wire28 : wire45)))} : ((&$unsigned((~|wire27))) * wire28));
        end
      else
        begin
          if (reg59)
            begin
              reg54 <= reg41;
              reg55 <= ((~(^~(~^$signed(wire31)))) ? reg57 : (7'h42));
              reg56 <= reg41[(4'ha):(3'h4)];
              reg57 <= reg34;
            end
          else
            begin
              reg54 <= (8'ha2);
              reg55 <= $unsigned(wire50);
              reg56 <= wire31[(4'hf):(3'h7)];
            end
        end
      if (wire31[(3'h6):(3'h6)])
        begin
          if ((+({{(wire29 && reg40), $unsigned(wire27)}} & $signed(reg59))))
            begin
              reg63 <= (((^$signed({reg59})) ?
                  wire27 : $signed($signed((reg41 >> wire29)))) == (reg41 + $signed(((+(8'h9f)) > wire51[(1'h1):(1'h1)]))));
              reg64 <= ((wire29 ?
                  wire47 : $unsigned(reg53[(4'h8):(1'h0)])) >= $unsigned($signed(((reg42 <= wire45) ?
                  wire32 : wire49))));
            end
          else
            begin
              reg63 <= $unsigned(reg34);
              reg64 <= reg62;
              reg65 <= (8'hb7);
            end
          reg66 <= $unsigned($signed($unsigned(wire51[(2'h2):(1'h1)])));
          reg67 <= ({(reg58 >> (+((8'hbd) < wire52)))} && $unsigned(reg61[(4'ha):(2'h2)]));
          if ($unsigned(($signed({(8'had)}) ?
              $signed($unsigned(reg54[(3'h6):(1'h1)])) : $signed(reg64))))
            begin
              reg68 <= $unsigned((wire29[(4'ha):(1'h0)] <<< (wire47 ?
                  ((wire32 ?
                      wire32 : reg54) | $unsigned(reg36)) : wire30[(2'h3):(2'h3)])));
              reg69 <= wire51;
              reg70 <= $unsigned({reg57});
              reg71 <= (~|((!{$unsigned(reg63),
                  ((8'hab) ~^ wire32)}) <= $signed(((~^wire51) ?
                  {reg57, reg67} : (wire46 + wire30)))));
              reg72 <= reg61;
            end
          else
            begin
              reg68 <= $signed($unsigned(($signed($signed(wire51)) ?
                  wire29 : wire45)));
              reg69 <= (reg36[(3'h6):(3'h6)] >= {$signed(reg43)});
              reg70 <= reg60[(4'h8):(4'h8)];
              reg71 <= wire30;
            end
        end
      else
        begin
          reg63 <= {wire46};
          reg64 <= $signed($signed($signed((8'ha6))));
          reg65 <= reg41;
          if (reg70[(3'h6):(1'h0)])
            begin
              reg66 <= $signed((~(~^reg43)));
              reg67 <= $signed(reg65[(4'hc):(3'h4)]);
              reg68 <= reg58[(2'h3):(1'h0)];
              reg69 <= reg57;
            end
          else
            begin
              reg66 <= wire28[(1'h0):(1'h0)];
              reg67 <= reg61;
              reg68 <= $signed((wire48[(3'h4):(2'h3)] ?
                  (($signed(wire50) ? reg70[(2'h3):(1'h0)] : (reg68 + wire28)) ?
                      reg56 : wire49[(2'h2):(1'h1)]) : $signed(reg39)));
              reg69 <= reg36;
            end
          reg70 <= $signed(($unsigned($signed((reg72 >= reg66))) ?
              reg53[(1'h1):(1'h0)] : ($unsigned((reg41 | reg64)) != reg43)));
        end
      reg73 <= (!reg57[(1'h1):(1'h0)]);
    end
  assign wire74 = (&{(|reg56[(4'hd):(1'h0)]),
                      ((|$signed(reg72)) >= ((reg33 ?
                          wire31 : wire50) << {reg67, reg42}))});
  always
    @(posedge clk) begin
      if ((((8'ha3) && $signed((~^(-wire45)))) ^ {$unsigned($signed((reg54 ?
              reg62 : reg39)))}))
        begin
          reg75 <= wire29;
          reg76 <= reg68;
          reg77 <= ($signed(((reg54 <<< wire48[(2'h2):(1'h1)]) >= $unsigned(reg36[(3'h7):(3'h4)]))) ?
              $signed(((^~(reg43 ?
                  (8'haf) : reg41)) >>> reg53)) : {$unsigned({reg73,
                      {wire52, reg37}}),
                  (wire47 < $unsigned((8'hbb)))});
        end
      else
        begin
          reg75 <= ((~&((8'ha6) ? $signed(reg61) : reg60[(4'hd):(1'h1)])) ?
              $unsigned(((reg68[(4'hb):(4'h8)] * $unsigned(reg60)) ?
                  $unsigned($signed(reg68)) : reg43)) : reg67);
          if ((~|reg55[(4'he):(4'ha)]))
            begin
              reg76 <= {(($signed((-wire49)) ~^ ((&reg58) ~^ $unsigned(wire52))) & (((^wire27) && (8'hbf)) ?
                      (~&reg73) : $signed({wire52})))};
              reg77 <= {(reg65 != $signed((-$signed(reg67)))),
                  $signed(wire31[(4'hd):(2'h3)])};
              reg78 <= $signed(wire28[(2'h2):(1'h0)]);
              reg79 <= $signed($signed({$unsigned($unsigned(reg62)),
                  {reg35[(1'h1):(1'h0)]}}));
            end
          else
            begin
              reg76 <= ($signed(reg53[(4'hb):(2'h2)]) ?
                  (-(^~(~|(~reg75)))) : (+(^(~&((8'hbf) | (8'hb8))))));
              reg77 <= wire50[(1'h0):(1'h0)];
            end
          if (($signed((+$signed((^~reg35)))) && reg62))
            begin
              reg80 <= $unsigned((~&$unsigned((^reg69))));
              reg81 <= (reg77[(2'h2):(1'h1)] ^ (~(($signed(reg80) * (^~(8'ha6))) ?
                  $signed(wire46[(4'h8):(1'h1)]) : $unsigned($unsigned(reg38)))));
            end
          else
            begin
              reg80 <= (wire48[(2'h2):(1'h0)] ? reg41 : (~|reg71));
              reg81 <= reg64;
              reg82 <= $unsigned(($signed({(reg34 > wire49)}) != (+($unsigned((8'hac)) ?
                  reg67[(5'h12):(1'h1)] : reg57))));
            end
          reg83 <= ((~&(reg54 ?
              reg69[(2'h3):(2'h3)] : reg36[(4'hc):(4'ha)])) - reg73);
          reg84 <= (8'hb0);
        end
      if (wire29[(3'h7):(1'h1)])
        begin
          reg85 <= {reg61[(1'h1):(1'h1)], $unsigned($signed(reg64))};
          reg86 <= reg44[(4'hf):(4'hc)];
          reg87 <= (+$signed((~|reg69)));
        end
      else
        begin
          reg85 <= $unsigned($signed(reg36[(3'h7):(3'h5)]));
          reg86 <= ((8'hba) ? reg61 : reg36[(3'h6):(1'h0)]);
          reg87 <= $signed((reg38[(4'ha):(3'h4)] ?
              ($signed({wire47, reg79}) ?
                  ((reg62 && (8'hbf)) ?
                      reg67 : {wire32,
                          reg59}) : reg55[(4'hd):(1'h0)]) : (~wire50[(2'h2):(2'h2)])));
        end
      reg88 <= (reg79[(2'h2):(1'h1)] ?
          ($unsigned((&wire28)) ^ {((|(8'hba)) ^~ reg54[(1'h0):(1'h0)])}) : ((-$signed(reg42[(3'h5):(2'h3)])) * {($unsigned((8'ha7)) ~^ reg79)}));
    end
  assign wire89 = (|(7'h43));
  assign wire90 = $unsigned($unsigned(reg33));
  module91 #() modinst113 (.wire94(reg57), .clk(clk), .wire96(reg35), .wire95(reg40), .y(wire112), .wire92(reg34), .wire93(reg84));
  assign wire114 = $signed($signed(($unsigned(wire30[(4'hb):(2'h2)]) ?
                       $signed({reg81}) : reg53[(4'h9):(2'h2)])));
  assign wire115 = reg82[(3'h6):(1'h1)];
  module116 #() modinst157 (.clk(clk), .wire119(wire31), .y(wire156), .wire117(reg82), .wire120(reg77), .wire118(reg59), .wire121(reg66));
  assign wire158 = wire50[(1'h1):(1'h1)];
endmodule

module module116
#(parameter param154 = ({((+(~^(7'h42))) >> ((~^(8'ha6)) ^~ ((8'hb9) <= (8'hbf))))} ? (7'h42) : (8'ha7)), 
parameter param155 = (!(param154 != param154)))
(y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire121;
  input wire signed [(3'h6):(1'h0)] wire120;
  input wire signed [(5'h15):(1'h0)] wire119;
  input wire signed [(4'h8):(1'h0)] wire118;
  input wire signed [(5'h14):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire153;
  wire signed [(3'h7):(1'h0)] wire152;
  wire [(3'h7):(1'h0)] wire137;
  wire [(3'h7):(1'h0)] wire135;
  wire [(4'hb):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  wire signed [(5'h14):(1'h0)] wire122;
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(5'h10):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire137,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire122,
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
                 reg136,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire122 = ((wire118[(2'h2):(2'h2)] > (wire121[(1'h0):(1'h0)] << (wire119[(4'h9):(1'h1)] ?
                       wire121[(1'h0):(1'h0)] : $unsigned(wire117)))) <<< $unsigned($signed((8'hbc))));
  always
    @(posedge clk) begin
      if ($signed(wire117))
        begin
          reg123 <= {wire121, (-(&wire121[(1'h0):(1'h0)]))};
          reg124 <= ($signed($unsigned((~wire121))) ?
              wire119 : (wire117 ?
                  (reg123[(4'h9):(3'h6)] ^~ (8'hbf)) : (!((wire118 ?
                      wire117 : wire119) ^ $signed(wire122)))));
        end
      else
        begin
          if ({wire122[(3'h7):(3'h4)],
              ($signed($unsigned((wire120 > wire119))) <<< $signed({((8'hbf) <<< wire119)}))})
            begin
              reg123 <= (8'h9d);
              reg124 <= (($signed((8'h9d)) | (wire121 & reg124)) ?
                  (^{(8'hb2),
                      ({wire119} - (wire119 ?
                          wire120 : wire121))}) : wire122[(3'h4):(2'h2)]);
              reg125 <= (!wire121);
            end
          else
            begin
              reg123 <= $signed(({$signed((+wire121))} != $unsigned(wire120[(3'h5):(1'h1)])));
              reg124 <= ((|$signed(($signed((8'hb5)) ?
                      (~^reg124) : (reg124 > (8'hb8))))) ?
                  reg125[(4'hf):(3'h5)] : reg125[(4'hd):(3'h7)]);
              reg125 <= $unsigned(wire118);
            end
        end
      if ((~wire121))
        begin
          reg126 <= reg125[(4'hf):(2'h2)];
          reg127 <= ($signed((~&((8'h9e) ?
                  (~|wire117) : ((8'hbb) ? reg123 : wire121)))) ?
              (8'haa) : (((~^(!wire117)) ?
                      (~&((8'h9e) ~^ (8'h9c))) : $unsigned((8'hbe))) ?
                  ((8'haa) ?
                      (wire122[(3'h4):(1'h1)] == (^reg126)) : ((~reg124) ?
                          {reg125, wire121} : $signed(reg124))) : (|((wire119 ?
                      (8'hb8) : wire118) + wire121))));
          reg128 <= $unsigned(reg123);
          if ({{wire118,
                  ($unsigned($unsigned(reg125)) ? reg125 : $unsigned(reg126))},
              (wire119[(5'h10):(5'h10)] << ($unsigned((reg125 < reg125)) > ((~^(8'hb1)) * $unsigned((7'h40)))))})
            begin
              reg129 <= reg123[(4'h8):(1'h1)];
            end
          else
            begin
              reg129 <= (~($unsigned((wire120[(1'h0):(1'h0)] >= (reg124 < reg128))) ?
                  $signed(((8'hbb) ?
                      (~reg125) : {(8'h9e), wire119})) : ($signed(((8'ha0) ?
                          reg125 : reg128)) ?
                      wire121[(2'h2):(1'h0)] : $signed((reg126 | wire121)))));
            end
        end
      else
        begin
          if ($unsigned((8'hbf)))
            begin
              reg126 <= {(wire120 >> ($unsigned((reg124 ? wire122 : (8'ha1))) ?
                      $unsigned((wire118 < wire121)) : $signed(reg124))),
                  (8'h9f)};
              reg127 <= reg129;
              reg128 <= ((!$unsigned(((wire121 ? reg129 : reg129) == reg128))) ?
                  (!$unsigned({wire119[(5'h10):(3'h5)]})) : (wire117 && (^~((8'h9d) ?
                      (~^(8'h9d)) : {(8'hb7)}))));
              reg129 <= ({$signed(($signed(wire122) ~^ {reg123, wire117})),
                  ((^wire119) != reg127)} - $unsigned(wire122[(2'h3):(1'h0)]));
            end
          else
            begin
              reg126 <= (!$unsigned($unsigned((wire121 ?
                  $unsigned(wire119) : (reg129 ? (8'h9d) : reg128)))));
              reg127 <= (((reg125 ?
                  $unsigned((wire121 < wire117)) : ((wire122 && wire118) || $unsigned(reg128))) - reg128) & $signed((+$signed(wire120))));
              reg128 <= reg127;
            end
          reg130 <= $unsigned($unsigned({reg125[(3'h5):(3'h5)],
              ($signed((7'h43)) ? reg128 : reg124)}));
        end
      reg131 <= wire122[(3'h6):(3'h5)];
    end
  assign wire132 = {({reg128[(4'h9):(2'h3)], (&$unsigned(wire118))} ?
                           (reg123[(4'h9):(3'h6)] << ((^wire120) ?
                               wire119[(4'h8):(3'h4)] : (-(8'had)))) : ((|{wire119}) >= (+wire117))),
                       (|wire117[(5'h12):(4'he)])};
  assign wire133 = reg131;
  assign wire134 = (^~(reg125[(4'h9):(1'h0)] ^~ ((wire132[(1'h1):(1'h1)] ?
                           wire133[(2'h3):(2'h2)] : {reg125, wire122}) ?
                       ($unsigned((8'ha8)) - $signed(wire132)) : (((7'h43) ?
                           wire120 : wire121) >>> reg127[(2'h2):(1'h0)]))));
  assign wire135 = (~^$unsigned(reg125));
  always
    @(posedge clk) begin
      reg136 <= (|((~$signed((+reg126))) ?
          reg128 : ($signed({wire133}) ?
              ({reg127, reg131} ?
                  $signed(reg128) : reg131) : (~|$signed(reg131)))));
    end
  assign wire137 = wire120[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg138 <= $signed(reg124[(4'h9):(4'h9)]);
      if (reg128)
        begin
          if (reg123[(4'h8):(3'h4)])
            begin
              reg139 <= ((((((8'hbd) <= (8'hb8)) ?
                          {reg136, reg131} : (wire119 + reg130)) ?
                      (wire122[(4'h9):(3'h5)] << (wire134 & reg131)) : $signed(wire118[(3'h6):(2'h2)])) ?
                  $unsigned(($unsigned(wire117) >>> $signed(reg129))) : wire117[(5'h10):(1'h1)]) == $signed((reg124[(4'hd):(4'h8)] < reg124)));
              reg140 <= {reg129[(3'h6):(3'h4)]};
              reg141 <= (((($signed(wire119) >= (~&wire135)) ?
                      {(&reg123),
                          reg140} : (~&$signed(reg140))) != $signed(wire118)) ?
                  $unsigned((reg126[(4'h9):(1'h1)] && ($unsigned((8'hb1)) & $signed(wire118)))) : (wire122[(4'hc):(4'ha)] == {$signed($signed(reg139))}));
              reg142 <= $signed({($unsigned({reg126, wire132}) ?
                      (reg129[(3'h5):(3'h5)] & $unsigned(wire132)) : (8'hbd))});
            end
          else
            begin
              reg139 <= (~^$signed((($signed(reg131) - wire122[(4'he):(4'hd)]) ?
                  wire135[(2'h2):(1'h1)] : reg127)));
              reg140 <= $signed($unsigned($signed($signed(reg126[(3'h5):(2'h3)]))));
              reg141 <= ((reg125[(4'hc):(2'h2)] ^~ (($unsigned(wire121) ?
                  (-reg139) : $unsigned(wire118)) ~^ (reg131 ?
                  wire134[(3'h7):(3'h5)] : reg126))) || (~(~|$unsigned(reg125))));
              reg142 <= $unsigned($unsigned($unsigned(($signed((8'h9f)) | (~|wire121)))));
            end
          reg143 <= (reg124[(4'ha):(4'h8)] & $unsigned(($signed($unsigned(reg123)) ?
              (reg141 ?
                  $unsigned((8'haf)) : $unsigned((8'hb5))) : wire122[(3'h7):(3'h7)])));
          reg144 <= reg128[(2'h2):(1'h1)];
          reg145 <= ((^~({reg139} ? reg123[(4'hd):(3'h5)] : wire132)) ?
              (^$unsigned($signed($unsigned(wire118)))) : $signed($signed(($signed(reg123) ?
                  $signed(wire119) : (reg129 ? wire133 : (8'hbb))))));
          reg146 <= $signed((reg139 ? reg142 : reg142));
        end
      else
        begin
          reg139 <= (wire122[(3'h6):(1'h0)] ?
              $signed(($signed((-reg141)) << (((8'ha9) ?
                  reg141 : (8'ha9)) <<< $unsigned(wire135)))) : (8'ha8));
        end
      if (($unsigned($unsigned(((reg136 ? (8'ha9) : reg139) <<< (^reg138)))) ?
          (wire132 < reg145) : (|((+(~|wire117)) ?
              reg145[(3'h7):(3'h4)] : (&reg143[(3'h5):(1'h1)])))))
        begin
          reg147 <= ((($signed(wire122) ?
                  (((8'hb4) << reg125) == {reg128, wire134}) : ((wire132 ?
                          reg124 : (8'ha2)) ?
                      reg130 : wire137[(2'h2):(1'h1)])) ?
              $signed($unsigned((reg123 * reg123))) : $unsigned((reg139 << $unsigned(reg139)))) >> ((-$signed(reg144)) ?
              $unsigned($unsigned({wire121, wire122})) : {$signed(((8'h9f) ?
                      reg123 : reg145))}));
          reg148 <= (~|$signed(reg136[(1'h0):(1'h0)]));
          reg149 <= (~&(~{reg126, wire133}));
          reg150 <= $unsigned({(+($signed(wire133) ?
                  reg126[(4'h8):(3'h4)] : {wire134, wire132}))});
          reg151 <= wire132;
        end
      else
        begin
          reg147 <= $unsigned((~|((wire133 ^ $unsigned(reg131)) > reg145)));
          reg148 <= wire137;
          reg149 <= wire134[(2'h3):(1'h0)];
          reg150 <= (((8'hbd) ? reg131[(3'h7):(3'h7)] : reg144[(1'h1):(1'h1)]) ?
              $signed($unsigned({((8'h9d) == wire119)})) : (^reg147[(4'hb):(3'h4)]));
        end
    end
  assign wire152 = (~reg143);
  assign wire153 = $signed($unsigned((wire132 ?
                       reg138 : (^(wire117 != (8'hb7))))));
endmodule

module module91  (y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire96;
  input wire [(4'hc):(1'h0)] wire95;
  input wire [(5'h15):(1'h0)] wire94;
  input wire [(5'h14):(1'h0)] wire93;
  input wire signed [(3'h7):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire104;
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 reg105,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg97 <= ($signed((|wire93[(4'he):(1'h0)])) >>> $signed((&$signed($signed((8'hb1))))));
      reg98 <= $signed($signed(($unsigned(((8'hb3) & wire95)) ?
          (wire95[(4'h9):(1'h0)] == ((8'hb9) ?
              wire96 : wire95)) : $unsigned((!wire94)))));
      if ($unsigned(wire92[(3'h6):(2'h3)]))
        begin
          if ({$unsigned((((wire95 ? wire94 : wire92) ?
                  wire96[(4'h8):(3'h6)] : (~^reg98)) <<< reg97)),
              $signed(wire92[(2'h3):(2'h2)])})
            begin
              reg99 <= $signed(($unsigned(wire95[(2'h3):(1'h1)]) <<< wire93[(3'h4):(2'h3)]));
              reg100 <= (reg98 ?
                  ((~((reg98 ?
                      wire94 : reg98) & $signed(wire93))) * (~|(8'ha9))) : $signed((^$signed($signed((8'ha9))))));
              reg101 <= $unsigned(($unsigned(wire95) ?
                  $unsigned((~&(^~(8'hb6)))) : ($unsigned(wire94[(3'h7):(3'h4)]) >>> $unsigned((reg97 ?
                      wire95 : reg97)))));
            end
          else
            begin
              reg99 <= wire93[(1'h1):(1'h0)];
              reg100 <= $unsigned($unsigned((reg99[(2'h3):(1'h0)] ?
                  ($signed(reg100) ?
                      $unsigned((8'hb8)) : (reg99 >>> reg99)) : reg98)));
              reg101 <= (($signed($unsigned((reg101 <<< (7'h42)))) ?
                  $unsigned((^(+wire94))) : wire93[(4'he):(4'hc)]) <<< $signed($signed(((wire92 ?
                  wire94 : reg97) - (wire95 ? reg100 : wire96)))));
              reg102 <= reg100;
            end
        end
      else
        begin
          reg99 <= {wire93[(3'h7):(1'h0)], wire93[(4'hd):(4'h9)]};
        end
      reg103 <= (~&(wire95[(4'h8):(4'h8)] ? reg98 : wire96));
    end
  assign wire104 = $unsigned($unsigned($signed({(8'hb1)})));
  always
    @(posedge clk) begin
      reg105 <= reg101;
    end
  assign wire106 = wire95;
  assign wire107 = reg103[(2'h2):(1'h0)];
  assign wire108 = (reg101 <= $unsigned((($signed(wire106) <= reg98[(1'h0):(1'h0)]) ?
                       ($unsigned(reg103) ?
                           $unsigned(wire94) : wire106[(2'h2):(1'h0)]) : reg102[(4'h8):(3'h7)])));
  assign wire109 = (!$unsigned((wire104 ?
                       ((8'hbb) << (~^reg99)) : $signed((reg103 ?
                           wire94 : wire93)))));
  assign wire110 = wire106;
  assign wire111 = (~reg97[(3'h7):(1'h1)]);
endmodule
