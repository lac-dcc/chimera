module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire69;
  reg [(3'h6):(1'h0)] reg4 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire69,
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
                 reg27,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire1[(3'h6):(3'h4)])
        begin
          reg4 <= ($unsigned((|(+((8'h9e) + wire1)))) << $signed(wire1));
          if (reg4)
            begin
              reg5 <= reg4;
            end
          else
            begin
              reg5 <= (~|$signed(wire0));
              reg6 <= (wire0[(4'hd):(3'h7)] ?
                  ($signed(reg4[(2'h3):(1'h1)]) <= $unsigned($unsigned(reg4))) : ((wire2[(2'h3):(1'h1)] | {$signed(wire1),
                          ((8'hb7) ? reg4 : reg5)}) ?
                      wire2 : ({wire3,
                          (wire0 + wire2)} + $unsigned($unsigned(reg4)))));
              reg7 <= (^~wire2);
              reg8 <= (~^(~^$signed($unsigned(wire2[(2'h2):(1'h0)]))));
              reg9 <= wire2;
            end
          if ((wire1[(4'hb):(4'ha)] + (reg6[(2'h3):(2'h2)] ~^ $unsigned($signed((wire0 && wire1))))))
            begin
              reg10 <= ((($signed($unsigned(wire1)) ?
                          ($signed((8'hb9)) < $signed(reg9)) : (~(reg4 ?
                              wire2 : (8'hbf)))) ?
                      (((wire3 >> wire1) ?
                              reg8[(5'h13):(4'hb)] : $signed(wire1)) ?
                          ((reg5 >= (8'hb9)) && wire3) : $unsigned({reg4})) : {{wire1[(4'hc):(3'h7)],
                              (wire0 ? reg9 : reg6)}}) ?
                  $signed(({$signed(reg9)} != ((wire0 ? reg5 : wire0) ?
                      reg6[(3'h4):(2'h3)] : reg6))) : reg7[(3'h4):(3'h4)]);
              reg11 <= $unsigned(((^~(~(wire2 ?
                  wire1 : reg7))) << (($unsigned(wire1) ^ reg7) ?
                  (!wire0) : reg6)));
              reg12 <= $unsigned($unsigned({reg8, (8'ha0)}));
              reg13 <= reg9;
              reg14 <= reg10;
            end
          else
            begin
              reg10 <= reg11[(2'h2):(1'h0)];
              reg11 <= reg13;
            end
        end
      else
        begin
          reg4 <= $signed((reg14[(3'h6):(2'h2)] ? wire1 : (|reg12)));
          reg5 <= $unsigned(wire2[(1'h0):(1'h0)]);
        end
      if (wire0[(1'h1):(1'h1)])
        begin
          reg15 <= reg9;
          if ($signed((!($signed(((7'h42) ? wire3 : reg8)) < ($signed(wire2) ?
              (^~(8'ha7)) : (reg8 ? reg4 : reg15))))))
            begin
              reg16 <= (+reg10);
              reg17 <= (!($unsigned({{reg4}}) ?
                  $unsigned($unsigned((reg5 >> wire2))) : $signed(((wire2 ?
                      reg9 : reg11) != (reg14 ? wire2 : (8'ha2))))));
              reg18 <= (~|((~|((~^wire0) == reg9)) >= (({reg7} ?
                  {(8'ha4)} : reg6[(1'h1):(1'h0)]) << (&reg8[(4'hc):(4'h8)]))));
              reg19 <= ($signed((~^((~&reg12) ?
                  $unsigned(reg15) : {reg11, reg14}))) + reg14);
            end
          else
            begin
              reg16 <= $unsigned($signed($signed((+(wire1 < reg12)))));
            end
        end
      else
        begin
          reg15 <= {$unsigned((~(^~$unsigned((8'hb9)))))};
          reg16 <= {reg9[(3'h5):(2'h2)],
              (($unsigned(wire2[(1'h1):(1'h0)]) ?
                  ($unsigned(reg14) + (+(8'hae))) : (7'h43)) ^~ (wire1 >> $signed($unsigned((8'h9f)))))};
          if ($unsigned($signed((($unsigned(reg15) != $signed(reg10)) || (reg7 ?
              (+reg12) : $unsigned(wire0))))))
            begin
              reg17 <= $signed($signed({reg10, reg12[(4'h8):(3'h7)]}));
              reg18 <= (&((^((reg10 == (8'ha4)) ^~ (wire2 ?
                  reg6 : reg7))) >>> $signed($signed(((8'ha0) ?
                  reg14 : reg15)))));
              reg19 <= $signed(reg12[(3'h7):(1'h0)]);
              reg20 <= $signed(wire2[(1'h1):(1'h0)]);
            end
          else
            begin
              reg17 <= reg6[(4'h9):(2'h3)];
              reg18 <= (~(($signed((~|(8'hb2))) > $signed(reg11[(3'h6):(3'h5)])) ^~ (reg13[(2'h3):(1'h1)] || $signed($unsigned((8'hba))))));
              reg19 <= ($unsigned(reg13[(1'h1):(1'h0)]) ?
                  reg5[(2'h2):(1'h1)] : (&$signed({$signed((7'h43))})));
              reg20 <= $signed(((&reg15) ? {$signed((~|reg15))} : (&reg5)));
            end
        end
      if ($unsigned(reg12[(4'h8):(3'h5)]))
        begin
          if (reg17[(3'h6):(3'h6)])
            begin
              reg21 <= (-(~&(reg18 ? $unsigned({reg7, wire0}) : (8'ha8))));
              reg22 <= ($unsigned({wire0[(3'h7):(1'h0)],
                  (^$unsigned(wire3))}) ^ ($signed(reg5) != (((reg12 ~^ (8'hbc)) ?
                      reg19 : (reg14 >> reg10)) ?
                  {$unsigned(reg9)} : ((reg6 ? reg14 : reg21) ?
                      wire3[(4'hf):(1'h0)] : wire0[(2'h3):(1'h0)]))));
              reg23 <= (!{$unsigned(($signed(wire2) ?
                      reg17 : reg22[(4'ha):(2'h3)]))});
              reg24 <= $unsigned({wire3});
            end
          else
            begin
              reg21 <= {$unsigned((~|wire2)), $signed(reg5)};
              reg22 <= reg24[(2'h3):(2'h2)];
            end
          reg25 <= {(~|($signed({reg5}) * wire2[(1'h0):(1'h0)])),
              $unsigned(reg23[(4'hf):(3'h6)])};
          reg26 <= (~|((8'hb8) ?
              (reg25 >> $signed((~|wire3))) : $unsigned((reg4[(1'h1):(1'h1)] >= $unsigned(reg7)))));
          reg27 <= (+reg13);
        end
      else
        begin
          reg21 <= (~^reg22);
          reg22 <= {$signed(reg6[(4'h9):(3'h4)]), reg5[(1'h0):(1'h0)]};
          reg23 <= (((reg9[(4'he):(3'h7)] ?
                  {$unsigned(reg4)} : ((8'haa) <<< (reg17 >= reg22))) ?
              (~^$signed({reg26, wire1})) : ((-(reg24 ? reg15 : reg21)) ?
                  reg24 : $unsigned($signed(reg5)))) <<< (~reg17));
          reg24 <= reg8[(4'hd):(4'h9)];
          reg25 <= (((reg10 ^ $signed(reg15[(4'hd):(3'h4)])) ?
                  reg10 : (+(+$unsigned(reg19)))) ?
              reg22 : $unsigned(reg10[(3'h4):(2'h2)]));
        end
      reg28 <= (reg17 || (reg7[(3'h6):(3'h6)] ?
          (!((8'hb6) | ((8'hab) && reg17))) : ((8'hb0) > $signed($unsigned(wire3)))));
    end
  assign wire29 = {($unsigned($signed((7'h40))) >= $unsigned(reg28)),
                      (&$signed(reg10))};
  assign wire30 = wire3;
  assign wire31 = $signed($unsigned($unsigned($signed(wire3))));
  assign wire32 = reg21;
  assign wire33 = (wire1 ?
                      ($signed($unsigned($unsigned(wire31))) ?
                          reg7[(4'hd):(4'ha)] : {$unsigned((!reg14))}) : $signed(((reg21[(4'hd):(2'h3)] ?
                          (&wire30) : ((8'ha9) == reg5)) ~^ $signed($unsigned((8'hb8))))));
  assign wire34 = $signed(($signed((8'hb6)) ?
                      ((wire33[(4'h9):(3'h6)] <= (reg7 ? reg23 : reg4)) ?
                          ($unsigned(reg8) ?
                              $unsigned(reg18) : {reg7,
                                  reg25}) : reg7) : (^reg7[(3'h5):(3'h5)])));
  module35 #() modinst70 (.y(wire69), .wire36(wire30), .wire38(wire2), .wire39(wire0), .wire37(reg10), .clk(clk));
  assign wire71 = ((&(~$signed({reg22,
                      (8'hb6)}))) > $signed({$unsigned(reg9[(3'h6):(3'h5)])}));
  assign wire72 = $signed($signed(reg8));
  assign wire73 = reg14[(3'h5):(3'h5)];
  assign wire74 = $unsigned((~^(~{$signed(reg20)})));
  assign wire75 = $signed({reg6, $signed((+reg26))});
endmodule

module module35
#(parameter param67 = (!{((((8'hb5) > (8'ha4)) & ((8'ha2) ? (8'ha4) : (8'hb1))) ? ({(8'hae)} <= ((8'h9c) != (8'hbf))) : ((8'ha6) * (^(8'hbc)))), ((8'hb4) == {((8'hbc) ? (8'had) : (8'ha0)), {(7'h42), (8'hae)}})}), 
parameter param68 = (~&({(|param67), (+param67)} ? (7'h42) : (((param67 ? param67 : param67) ^ param67) > {(~|param67)}))))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire39;
  input wire signed [(5'h12):(1'h0)] wire38;
  input wire signed [(3'h7):(1'h0)] wire37;
  input wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
                 wire57,
                 wire42,
                 wire41,
                 wire40,
                 reg60,
                 reg58,
                 reg56,
                 reg55,
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
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire40 = wire37[(2'h3):(1'h1)];
  assign wire41 = (wire37 << ($unsigned(((+wire37) != wire36[(1'h0):(1'h0)])) ?
                      (($signed(wire37) & wire40[(3'h5):(1'h1)]) ?
                          (|wire37[(3'h5):(3'h4)]) : wire39[(1'h0):(1'h0)]) : (($signed((8'hbf)) ?
                              wire39[(1'h0):(1'h0)] : (wire38 ^ wire38)) ?
                          $unsigned((|(8'hbc))) : (~&{(8'hbe)}))));
  assign wire42 = $unsigned(wire36);
  always
    @(posedge clk) begin
      reg43 <= wire40;
      reg44 <= ($signed(($unsigned(reg43[(2'h2):(1'h1)]) << ((wire37 | wire39) + (-wire42)))) ?
          wire40 : ($signed(wire37[(3'h4):(2'h3)]) ?
              $unsigned($signed(wire39)) : wire40[(2'h2):(1'h0)]));
      if ($signed(wire42[(4'h9):(3'h4)]))
        begin
          reg45 <= ({((^~(+wire42)) - (reg43[(1'h1):(1'h1)] ?
                  (wire36 != wire39) : (wire38 ? wire36 : wire36))),
              (|{(!wire39),
                  {reg44, wire37}})} < ($signed($unsigned($signed((8'haf)))) ?
              (-$unsigned({wire38, wire38})) : wire40));
          if ((~|wire39[(2'h2):(1'h0)]))
            begin
              reg46 <= wire37[(1'h0):(1'h0)];
              reg47 <= $signed(({wire40[(1'h1):(1'h0)],
                  (&$unsigned(wire41))} <<< $signed(wire40[(3'h5):(2'h3)])));
              reg48 <= (^(reg47 ^ (^~(^$unsigned(wire36)))));
              reg49 <= reg48[(3'h6):(1'h1)];
            end
          else
            begin
              reg46 <= ((+$unsigned(((^(8'hba)) >= (reg48 != wire40)))) < $unsigned((~^(reg44 ?
                  reg46 : (!reg44)))));
              reg47 <= (reg48 ?
                  (-(~|$unsigned(wire41))) : {{reg43[(1'h1):(1'h0)]}});
              reg48 <= wire42;
              reg49 <= $unsigned(((wire39[(2'h2):(2'h2)] ?
                  reg44 : $signed($signed(wire37))) != wire37));
            end
          reg50 <= $signed(((((reg47 || reg45) >>> (reg48 ? reg43 : wire39)) ?
              {$unsigned(wire42),
                  $signed(wire41)} : $unsigned(reg45)) <= $signed({(wire39 ^ reg48)})));
          reg51 <= (wire37 & ((~&reg45) > reg43[(2'h2):(2'h2)]));
          if (reg47[(1'h0):(1'h0)])
            begin
              reg52 <= (wire40 << {$unsigned((^$signed((8'h9e))))});
              reg53 <= $unsigned((~|$unsigned($signed((reg43 == (8'h9c))))));
              reg54 <= $unsigned($unsigned((wire41[(1'h0):(1'h0)] ?
                  $unsigned((reg47 ? wire38 : reg49)) : {(wire42 ?
                          reg52 : (8'hbf))})));
              reg55 <= $signed($unsigned(($unsigned(reg53[(4'ha):(3'h5)]) < {(reg48 || reg54)})));
            end
          else
            begin
              reg52 <= ((((^(|(8'hb6))) ? reg48 : $unsigned((~^wire39))) ?
                  wire37[(3'h4):(3'h4)] : (wire36 + $unsigned((~^wire42)))) == (reg48 ?
                  (~^(~&(~&(8'h9e)))) : ((reg49[(4'hf):(4'hb)] ?
                      (reg49 || (8'hb0)) : wire37[(3'h4):(2'h3)]) >= $signed($unsigned(reg44)))));
              reg53 <= $unsigned((wire40[(2'h3):(1'h1)] ?
                  (-((reg45 < reg51) >= {reg51})) : $unsigned($signed({wire42,
                      (8'hb9)}))));
              reg54 <= $unsigned((wire36 ?
                  (~^($signed(wire38) ^~ (-reg47))) : (&{$unsigned(reg54)})));
            end
        end
      else
        begin
          reg45 <= $unsigned(reg49[(5'h14):(3'h5)]);
          reg46 <= ({reg47[(5'h12):(3'h4)],
              (((^reg52) - (!reg47)) ?
                  ((reg52 >= reg52) ~^ $unsigned((8'hab))) : wire37)} << ({(reg44[(3'h4):(1'h1)] ?
                  (wire40 ? reg55 : reg51) : reg55),
              ($unsigned(reg45) > wire38)} != $unsigned(wire36)));
          reg47 <= $signed($unsigned($unsigned((reg46 == wire42[(3'h6):(2'h3)]))));
          reg48 <= (($signed($unsigned((&(8'hb9)))) * (!(~^(wire37 ?
              reg43 : wire41)))) & $signed($signed(({wire40, reg52} ?
              $unsigned(reg43) : $unsigned(reg51)))));
        end
      reg56 <= $unsigned(((&($unsigned(reg52) ?
          (wire38 ?
              reg47 : wire40) : $signed(reg49))) > $signed($unsigned($signed(reg50)))));
    end
  assign wire57 = (({$signed($unsigned(wire39)),
                      wire42[(4'ha):(1'h1)]} < {({wire39} * reg48[(4'h8):(3'h5)]),
                      (8'ha0)}) + (((8'had) >>> ($signed(wire38) & $unsigned(reg51))) && reg55));
  always
    @(posedge clk) begin
      reg58 <= (((&(reg52 >> (~^reg50))) < reg50[(2'h3):(2'h3)]) ^ $signed(($signed($signed(reg55)) & (wire36[(3'h4):(2'h2)] ?
          reg47 : reg43))));
    end
  assign wire59 = $unsigned($signed(wire39[(3'h7):(2'h2)]));
  always
    @(posedge clk) begin
      reg60 <= wire36[(2'h3):(2'h2)];
    end
  assign wire61 = reg50[(3'h7):(3'h5)];
  assign wire62 = (8'hb3);
  assign wire63 = (&wire41[(1'h0):(1'h0)]);
  assign wire64 = {(8'hb0), $signed($unsigned({(wire62 ? reg53 : wire62)}))};
  assign wire65 = (^(((wire64 ? (8'ha1) : (~&(8'ha8))) ^ reg44[(2'h2):(1'h0)]) ?
                      $unsigned($unsigned(wire36)) : (reg53 & ($signed((8'hbd)) ?
                          $signed(wire41) : $unsigned(wire38)))));
  assign wire66 = $unsigned({wire41[(2'h2):(1'h0)]});
endmodule
