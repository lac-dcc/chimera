module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire37,
                 wire36,
                 wire28,
                 wire27,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
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
                 reg24,
                 reg25,
                 reg26,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({(|{wire0[(3'h6):(3'h6)], $signed($signed(wire0))})})
        begin
          if (wire3[(3'h4):(2'h2)])
            begin
              reg4 <= {(((~(wire3 ? wire2 : (8'hba))) ?
                      wire2 : {{wire3, wire3},
                          wire0[(3'h5):(1'h0)]}) >= $signed($unsigned((&wire1)))),
                  (~(wire0[(2'h2):(1'h1)] >> $signed($signed(wire3))))};
              reg5 <= (wire3 ?
                  ({(~&$unsigned(reg4))} ~^ (wire1[(2'h2):(1'h0)] ?
                      reg4 : $unsigned($signed((8'hb4))))) : $signed(wire1));
              reg6 <= (-((|$signed(reg5)) < reg5[(2'h3):(1'h1)]));
              reg7 <= (wire1 < wire0);
            end
          else
            begin
              reg4 <= (wire2[(1'h1):(1'h0)] ?
                  ((|$signed((wire0 & (8'ha7)))) << (&{wire3[(2'h2):(1'h1)]})) : $signed(($unsigned(wire3[(2'h3):(2'h2)]) > (~|{wire1}))));
              reg5 <= (~&(~|{($signed(reg7) ? (^~wire3) : (wire0 < (8'ha3)))}));
            end
          if ($unsigned(reg7[(1'h0):(1'h0)]))
            begin
              reg8 <= (~$unsigned($unsigned((wire2[(1'h1):(1'h0)] & (-wire0)))));
            end
          else
            begin
              reg8 <= (&$signed($unsigned(($signed((8'hb7)) ?
                  (&reg8) : $signed(reg6)))));
              reg9 <= reg7[(2'h3):(2'h3)];
            end
          reg10 <= (^($signed(reg9) ? (+$signed({(8'hab), (8'hb2)})) : reg9));
          reg11 <= (+wire1[(2'h2):(1'h1)]);
        end
      else
        begin
          if ($unsigned((&(($unsigned(reg11) <= (reg11 && reg11)) ?
              {$unsigned(reg5), (wire2 - wire2)} : ($unsigned(reg6) ?
                  (reg6 * (8'ha9)) : $unsigned(wire2))))))
            begin
              reg4 <= wire0[(3'h5):(2'h2)];
              reg5 <= reg11;
            end
          else
            begin
              reg4 <= (reg4[(4'ha):(1'h0)] <<< reg6);
              reg5 <= reg7;
            end
          reg6 <= reg8;
          if ($unsigned($signed(wire0)))
            begin
              reg7 <= $unsigned(wire2[(1'h1):(1'h1)]);
              reg8 <= ($unsigned($signed(((reg11 || wire2) << reg4[(4'hd):(4'h9)]))) >> $unsigned(reg8[(5'h10):(2'h3)]));
            end
          else
            begin
              reg7 <= reg10[(3'h4):(1'h0)];
              reg8 <= (~|$unsigned(wire3));
              reg9 <= ($unsigned((wire3[(4'h8):(3'h4)] - ((wire3 ^~ reg5) | (~reg5)))) > $unsigned($unsigned(reg9[(4'h8):(3'h4)])));
              reg10 <= {reg9[(3'h5):(2'h2)],
                  ($unsigned(wire0[(3'h5):(3'h5)]) >> wire0)};
              reg11 <= $signed((8'hb7));
            end
        end
      if (reg9)
        begin
          reg12 <= $unsigned($unsigned({(^wire2)}));
        end
      else
        begin
          reg12 <= $signed((^~reg6));
          if (((($unsigned((&wire1)) ?
                  reg10 : {reg6, (reg10 ? wire0 : reg11)}) ?
              ((8'hb3) ?
                  reg4[(3'h7):(3'h7)] : $signed($signed(reg10))) : $signed((~$unsigned(reg8)))) ~^ reg7))
            begin
              reg13 <= (8'haf);
            end
          else
            begin
              reg13 <= $unsigned($unsigned((8'hb0)));
            end
        end
      reg14 <= ($unsigned((|wire3[(4'ha):(3'h4)])) ?
          (+(reg9 ?
              $signed((reg13 ?
                  wire2 : (8'had))) : (~^((8'hb0) ^~ reg7)))) : reg13);
      if ($signed(reg10[(2'h2):(2'h2)]))
        begin
          reg15 <= ({$unsigned(((reg4 + reg4) ? (+reg14) : (&reg10)))} || reg6);
          reg16 <= $unsigned(reg4);
        end
      else
        begin
          reg15 <= $signed($unsigned((^~($signed((7'h41)) ?
              {reg14} : $unsigned(reg7)))));
          reg16 <= $signed((~|(reg6 ?
              $signed((reg11 ?
                  reg16 : reg6)) : ((reg9 <= reg14) + reg13[(4'hf):(3'h6)]))));
          if ($unsigned(($signed({(reg13 ?
                  reg15 : reg6)}) ^~ ($unsigned((reg9 >>> reg4)) >> (reg8[(4'hd):(4'hc)] >> $unsigned(reg9))))))
            begin
              reg17 <= ((reg11 ? $signed(wire1) : (~|(reg16 | (~|reg5)))) ?
                  $signed(wire0[(2'h3):(2'h2)]) : (~&(&(|((8'hb1) ?
                      reg13 : reg7)))));
              reg18 <= $signed((~|$signed($unsigned((reg13 ?
                  reg15 : (8'hac))))));
              reg19 <= $unsigned((8'hb4));
            end
          else
            begin
              reg17 <= (8'hb3);
              reg18 <= (&(!($unsigned(wire2[(2'h2):(2'h2)]) == {{reg9, reg12},
                  {reg4}})));
              reg19 <= $signed((8'hb8));
            end
        end
      if ($signed($signed(reg11)))
        begin
          reg20 <= $unsigned(((&(reg17[(3'h4):(3'h4)] <<< ((8'ha1) ~^ wire1))) * ((reg5 && reg6[(1'h0):(1'h0)]) ~^ reg10)));
          reg21 <= {($signed((reg17 ?
                  (reg20 ? reg12 : (8'h9e)) : (reg5 ?
                      reg8 : (8'hb4)))) & ($unsigned({reg4, reg6}) ?
                  wire2 : ($unsigned(reg14) ? $signed((8'ha8)) : (!reg13))))};
          reg22 <= reg11[(2'h2):(1'h0)];
        end
      else
        begin
          reg20 <= $unsigned(reg18);
          reg21 <= (~&$unsigned(reg4[(4'hd):(4'hd)]));
          if ({$signed($signed($unsigned($signed(reg22)))),
              (($unsigned(reg18) ?
                  (-$unsigned(reg4)) : reg21[(1'h1):(1'h1)]) <<< (&$signed({reg14,
                  reg7})))})
            begin
              reg22 <= (^~$signed({wire1,
                  ({reg11} ? reg10[(5'h10):(3'h5)] : $signed(reg22))}));
              reg23 <= reg17;
              reg24 <= $signed(wire0);
              reg25 <= $signed(((~$signed(((8'ha5) || reg23))) == (!reg16[(2'h2):(1'h1)])));
            end
          else
            begin
              reg22 <= ((~&reg21) ?
                  (8'hbb) : ((reg4 | reg4) >= $unsigned($signed(reg15))));
            end
          reg26 <= ($unsigned({$signed($unsigned(reg20)),
              $unsigned({reg10, reg13})}) < reg5[(1'h1):(1'h0)]);
        end
    end
  assign wire27 = $signed((~|(^~reg16)));
  assign wire28 = reg20[(4'hc):(3'h7)];
  always
    @(posedge clk) begin
      reg29 <= (8'ha6);
      if ($unsigned($unsigned((~((8'hb8) >= (reg11 ? reg16 : reg15))))))
        begin
          reg30 <= $signed($unsigned(($signed({reg24}) | ((reg4 ?
              reg9 : (8'hb7)) <<< (reg23 || (8'ha2))))));
          reg31 <= ((reg30 != (~|{(^~reg17)})) ?
              ((wire1[(2'h2):(1'h0)] || (8'ha5)) ?
                  (-$signed((reg10 ?
                      (8'h9f) : wire0))) : reg24[(3'h7):(2'h2)]) : ((((wire3 <<< reg10) << {reg15,
                  reg10}) + $signed(((8'hac) | reg9))) ^ $signed({(reg8 ?
                      reg15 : reg23)})));
          reg32 <= $signed($signed(((reg26 ?
              $unsigned((8'hbe)) : reg26[(3'h5):(2'h2)]) >> wire27)));
          if (reg6[(1'h1):(1'h0)])
            begin
              reg33 <= ($unsigned(reg4[(4'ha):(3'h7)]) ?
                  (8'hbc) : $unsigned(reg9[(2'h2):(1'h0)]));
              reg34 <= (($unsigned((reg15 > (reg24 - (8'hb1)))) ?
                  (7'h41) : wire27) ^ reg30[(4'ha):(4'ha)]);
            end
          else
            begin
              reg33 <= $unsigned((+$signed($unsigned({reg11}))));
            end
        end
      else
        begin
          reg30 <= reg8[(2'h3):(1'h1)];
          reg31 <= $unsigned((~^reg33));
        end
      reg35 <= reg31[(1'h0):(1'h0)];
    end
  assign wire36 = (8'hb7);
  assign wire37 = $unsigned(reg33);
  module38 #() modinst59 (wire58, clk, reg30, reg15, reg16, wire27, wire1);
  assign wire60 = (reg29 ?
                      $signed(({$signed(wire0)} - $signed({reg24,
                          (8'hb4)}))) : $signed((~^{(reg14 ~^ reg9)})));
  assign wire61 = (reg17 ?
                      ($unsigned({$signed(reg17)}) ?
                          $unsigned(reg14) : reg31[(2'h3):(2'h2)]) : (^(8'hb2)));
  assign wire62 = reg17[(1'h1):(1'h1)];
  assign wire63 = {wire58[(5'h10):(5'h10)], $signed(reg12)};
  always
    @(posedge clk) begin
      if ((~^$signed(wire63[(4'hc):(3'h6)])))
        begin
          if ($unsigned((wire0[(3'h7):(3'h6)] >>> (reg23 ?
              reg18 : $signed($signed(reg15))))))
            begin
              reg64 <= reg23[(1'h0):(1'h0)];
              reg65 <= $unsigned(wire28[(4'h8):(3'h5)]);
              reg66 <= reg15;
              reg67 <= ($unsigned($unsigned((^~$unsigned(reg22)))) ^ (|(($unsigned(wire63) ?
                  $unsigned(reg11) : $unsigned(reg5)) | ((reg13 ?
                  reg23 : reg64) ^ wire28))));
              reg68 <= $unsigned((reg30 ~^ wire63));
            end
          else
            begin
              reg64 <= ((|wire61[(2'h2):(1'h1)]) ?
                  reg26 : ($signed((reg8 <<< $unsigned(reg22))) == (reg5 ?
                      (8'h9e) : {$signed(wire61)})));
            end
          reg69 <= $unsigned(((8'ha8) ?
              $signed((^reg31[(3'h6):(2'h2)])) : ($unsigned($signed(wire28)) ?
                  $unsigned({wire2, reg25}) : reg32[(1'h0):(1'h0)])));
        end
      else
        begin
          reg64 <= $signed($unsigned((!$unsigned((reg13 ? wire0 : reg69)))));
          reg65 <= ((({reg32[(4'h8):(3'h5)], wire1} ^~ reg14[(3'h5):(2'h3)]) ?
                  $signed($unsigned({reg10, wire1})) : (~reg11)) ?
              {{$signed((reg8 ? reg9 : reg69)),
                      wire28[(3'h5):(1'h0)]}} : (~^(-((wire60 ~^ wire28) >> (-reg13)))));
          reg66 <= (+reg35);
          reg67 <= (~|wire37[(4'h9):(3'h6)]);
          if (reg9)
            begin
              reg68 <= $unsigned((((+(reg8 ? wire27 : wire2)) ?
                      reg18 : $unsigned(reg21[(2'h3):(2'h2)])) ?
                  reg8[(4'hc):(4'h9)] : (^wire63)));
            end
          else
            begin
              reg68 <= {reg11[(1'h1):(1'h0)], reg30};
            end
        end
      reg70 <= ($signed((-$unsigned(((8'hac) ? reg20 : reg17)))) ?
          (reg32 ?
              (((wire2 + (8'had)) && $unsigned(reg5)) - ($unsigned(reg26) > reg8)) : wire1) : reg25);
      reg71 <= reg9[(3'h6):(2'h3)];
    end
endmodule

module module38
#(parameter param57 = ((((((8'hbd) ? (8'hac) : (8'ha0)) ^ {(8'ha9), (8'ha9)}) ? ({(8'hae)} ? (^~(8'hb5)) : (~&(8'hac))) : {((8'hac) | (8'hb1))}) * (+(8'hb5))) * (((((8'hac) ^~ (8'ha5)) && {(8'hbf), (8'h9c)}) ? (^~{(8'haa)}) : (!((7'h41) ^~ (8'ha1)))) ? ({((8'hbb) <= (8'hbf))} ? (^~((8'h9c) ? (8'hb2) : (8'h9c))) : (|((8'ha9) | (8'ha0)))) : (!{(&(8'hb4))}))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire43;
  input wire [(5'h14):(1'h0)] wire42;
  input wire signed [(2'h2):(1'h0)] wire41;
  input wire signed [(5'h15):(1'h0)] wire40;
  input wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 (1'h0)};
  assign wire44 = $signed(wire43);
  assign wire45 = $unsigned($signed($signed({$unsigned(wire44)})));
  assign wire46 = ((&wire43[(2'h2):(2'h2)]) ?
                      $signed(((~|(8'h9e)) >> $unsigned({(8'hb0)}))) : (+$unsigned({wire42,
                          $unsigned(wire43)})));
  assign wire47 = (((((wire43 | wire42) ^~ wire40) | $unsigned($unsigned((8'haa)))) ?
                      wire41 : (+($unsigned(wire39) < $signed((8'hb1))))) ~^ $unsigned({$unsigned(wire43[(1'h0):(1'h0)])}));
  assign wire48 = {(-(!(8'hb1)))};
  assign wire49 = $unsigned(((8'hbb) ?
                      (&wire47) : ($signed(wire42[(5'h12):(4'hf)]) || (wire40 ?
                          (wire47 && wire40) : $signed(wire46)))));
  assign wire50 = wire49[(2'h2):(1'h1)];
  assign wire51 = wire49[(1'h0):(1'h0)];
  assign wire52 = {(8'hb8)};
  assign wire53 = $unsigned($signed(wire46[(5'h10):(1'h1)]));
  assign wire54 = (8'ha0);
  assign wire55 = (^$unsigned($signed((^(~&(7'h43))))));
  assign wire56 = wire41[(1'h1):(1'h1)];
endmodule
