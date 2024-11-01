module top
#(parameter param63 = (8'hb2))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire60;
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  assign y = {wire62,
                 wire5,
                 wire9,
                 wire10,
                 wire11,
                 wire29,
                 wire60,
                 reg6,
                 reg7,
                 reg8,
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
  assign wire5 = wire3;
  always
    @(posedge clk) begin
      if ($signed((!$unsigned(((wire1 ?
          (7'h43) : wire3) == $unsigned(wire4))))))
        begin
          reg6 <= ($unsigned($unsigned((((8'hab) ? wire1 : wire4) ?
              wire1[(1'h0):(1'h0)] : $signed(wire4)))) && $unsigned((~&(~|$signed(wire4)))));
          if ($unsigned({$unsigned(wire1),
              (^~((wire4 ? (8'had) : reg6) ^ $unsigned(wire0)))}))
            begin
              reg7 <= $unsigned(wire2[(2'h2):(1'h0)]);
              reg8 <= ($unsigned((wire3 ?
                  $signed((reg7 ? wire4 : wire1)) : {(wire2 | wire0),
                      $unsigned(reg6)})) << wire2[(4'he):(4'ha)]);
            end
          else
            begin
              reg7 <= $signed((!wire0[(3'h5):(2'h2)]));
            end
        end
      else
        begin
          reg6 <= reg7[(2'h2):(2'h2)];
        end
    end
  assign wire9 = $signed($unsigned(($signed($signed(wire0)) ?
                     $signed({wire0, reg7}) : (^((8'haa) ? reg7 : wire2)))));
  assign wire10 = (~|$unsigned($unsigned((~&reg8))));
  assign wire11 = $unsigned((-(^reg6[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if ({reg7[(1'h0):(1'h0)], reg6})
        begin
          reg12 <= ((~&({((8'ha1) >= (8'hb4)), (wire0 - (7'h42))} ?
                  (wire3 ?
                      (wire3 ?
                          wire10 : (8'ha1)) : (&wire2)) : ((^~wire4) == (^wire11)))) ?
              wire0[(1'h0):(1'h0)] : wire3[(3'h4):(2'h3)]);
          reg13 <= {wire1[(4'ha):(3'h5)]};
        end
      else
        begin
          if (wire4[(2'h2):(1'h0)])
            begin
              reg12 <= {wire11[(4'ha):(3'h4)], reg8};
            end
          else
            begin
              reg12 <= ($unsigned($signed($unsigned(reg7[(1'h1):(1'h1)]))) == (($signed((wire0 ^~ wire4)) >> ((wire11 <<< wire3) ?
                  wire10 : (8'hba))) | (wire3[(2'h3):(2'h3)] ?
                  wire3 : (^((8'hbc) ? wire9 : reg13)))));
              reg13 <= $unsigned(wire2[(5'h14):(5'h13)]);
            end
        end
      reg14 <= (wire4[(3'h4):(2'h3)] < ((wire0 ~^ wire2[(4'h8):(3'h7)]) ?
          wire11[(4'hc):(2'h2)] : ((wire10[(1'h0):(1'h0)] ?
              (wire11 >= wire2) : (wire9 ~^ wire0)) >> (7'h42))));
      reg15 <= $signed(((|{$signed(reg14)}) << wire1[(1'h0):(1'h0)]));
      reg16 <= (reg12[(4'h8):(3'h6)] && (~|(~&(8'hb4))));
      if ($signed(reg12))
        begin
          reg17 <= $unsigned({wire1});
          reg18 <= (~&$unsigned(wire11[(3'h4):(2'h2)]));
          if ((reg12[(4'ha):(3'h6)] ?
              reg16[(2'h3):(1'h0)] : (($unsigned(wire3) < reg7) ?
                  {$unsigned($unsigned(reg14))} : wire5)))
            begin
              reg19 <= reg15[(1'h0):(1'h0)];
              reg20 <= (wire10 ?
                  $signed($signed(wire1)) : $signed(reg19[(1'h1):(1'h0)]));
              reg21 <= (wire0 ?
                  (reg6 || (($signed(reg18) ^~ {reg20}) ?
                      (~reg12[(1'h1):(1'h0)]) : reg13)) : $unsigned($signed({wire10[(2'h2):(1'h0)],
                      (reg19 ? (8'ha3) : wire2)})));
              reg22 <= wire0;
            end
          else
            begin
              reg19 <= (((~^$signed({wire11, (7'h44)})) - wire4) ?
                  wire9 : {$unsigned(({reg15, (8'hbd)} ?
                          {reg17} : wire3[(3'h4):(2'h2)]))});
              reg20 <= $unsigned(($unsigned(((~|wire11) && $signed(reg7))) ^ (|$signed(reg17))));
            end
          if (reg12[(4'hd):(3'h4)])
            begin
              reg23 <= $signed(($unsigned(reg15) >>> (reg19[(3'h4):(1'h1)] >= {(wire1 ?
                      (7'h41) : reg16),
                  (+(8'hb7))})));
              reg24 <= (8'hb0);
              reg25 <= reg23[(2'h3):(1'h0)];
              reg26 <= (~|($unsigned(((reg25 ? reg19 : (8'ha6)) ?
                  $unsigned(wire3) : reg25[(2'h2):(2'h2)])) <= wire2[(5'h10):(3'h4)]));
              reg27 <= (+(((|$signed(reg13)) ?
                  $unsigned(reg6[(3'h6):(2'h3)]) : ((wire10 ? reg19 : reg6) ?
                      reg14 : $signed(reg12))) - ({reg20[(2'h3):(2'h3)],
                      $signed(reg13)} ?
                  wire3 : wire5)));
            end
          else
            begin
              reg23 <= ((~&wire0) ?
                  reg18 : {(((&reg15) != ((8'ha6) && (8'ha7))) ?
                          {{reg27}} : reg20)});
              reg24 <= (~&reg22[(3'h7):(2'h3)]);
            end
          reg28 <= $signed(reg15[(3'h5):(1'h1)]);
        end
      else
        begin
          reg17 <= reg19[(2'h3):(2'h2)];
        end
    end
  assign wire29 = ($unsigned((&(reg25[(3'h4):(2'h2)] & $unsigned(reg6)))) ?
                      reg18 : {($unsigned(wire0[(3'h4):(2'h3)]) > wire9[(2'h3):(2'h2)])});
  module30 #() modinst61 (wire60, clk, reg28, reg13, reg8, wire10);
  assign wire62 = $signed({{$signed((reg22 < (8'hbe))), wire9[(2'h3):(2'h3)]},
                      $signed((8'hb9))});
endmodule

module module30  (y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire33;
  input wire signed [(5'h14):(1'h0)] wire32;
  input wire [(4'he):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire36,
                 wire35,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire35 = (((wire34[(3'h4):(1'h0)] >> $unsigned($signed((8'haa)))) < ((wire31 ^ {wire33}) <= {wire32})) <= ($unsigned(wire32[(4'he):(4'hd)]) ?
                      ((7'h41) ?
                          ((&(8'hac)) > (wire31 << wire33)) : (~&(wire31 ?
                              (8'ha6) : wire31))) : (($signed(wire31) ?
                              $signed(wire34) : wire31) ?
                          wire31[(4'h9):(1'h0)] : (~|wire32[(4'he):(2'h2)]))));
  assign wire36 = $signed(wire32);
  always
    @(posedge clk) begin
      if ({{(~^(wire35[(3'h5):(2'h3)] ?
                  $signed(wire32) : (wire31 ? wire31 : wire33)))}})
        begin
          if ({(~&($unsigned($signed(wire33)) ?
                  $signed(wire33[(1'h1):(1'h0)]) : wire31[(3'h7):(3'h4)])),
              ((wire32 >>> ({(8'h9d)} > wire31)) || (8'had))})
            begin
              reg37 <= wire36;
              reg38 <= ((!(~((wire35 ? wire34 : wire36) ?
                      wire32 : (~|wire33)))) ?
                  $unsigned(((wire35[(1'h0):(1'h0)] ?
                      (wire34 > wire33) : $signed((8'ha4))) <= ({wire36,
                      wire31} != wire33))) : $signed({wire33[(2'h2):(1'h1)],
                      $unsigned((wire33 ? wire33 : wire31))}));
              reg39 <= (|((8'hb1) ?
                  {($unsigned(wire31) < (wire36 ? wire36 : wire34)),
                      (reg38 ?
                          (reg37 ?
                              wire34 : wire36) : $signed((8'ha4)))} : {wire35}));
              reg40 <= $signed((~|({(wire34 + wire32)} || (~^$unsigned(wire31)))));
            end
          else
            begin
              reg37 <= (^$unsigned((~&{(wire31 ? wire32 : reg40)})));
            end
          reg41 <= ($unsigned(((&(~^wire36)) ? wire32 : $signed((^wire32)))) ?
              reg38 : {reg37[(3'h4):(3'h4)],
                  $signed(((-reg40) != wire36[(1'h1):(1'h0)]))});
          if (($unsigned($signed(wire32)) ?
              (-$signed(($unsigned(wire31) + $unsigned(wire36)))) : $unsigned((wire36 ?
                  $signed({(8'hb6)}) : $unsigned($signed(wire33))))))
            begin
              reg42 <= ((({$unsigned(wire31),
                      reg39} ^ (^reg39)) + $unsigned(($unsigned(wire36) ~^ $unsigned(wire31)))) ?
                  (^~reg40[(1'h0):(1'h0)]) : $unsigned($signed($signed((~|wire32)))));
              reg43 <= $unsigned(reg38[(2'h2):(2'h2)]);
              reg44 <= ($signed((!({wire35} >>> reg43))) ?
                  $unsigned(($unsigned(wire34[(2'h2):(2'h2)]) ^ $signed(wire34[(2'h2):(1'h0)]))) : $unsigned(reg37[(1'h1):(1'h1)]));
              reg45 <= $signed($unsigned($signed({$signed(reg43)})));
              reg46 <= (reg39 & reg38);
            end
          else
            begin
              reg42 <= reg45[(3'h7):(3'h6)];
              reg43 <= $signed($signed(wire31));
            end
          if (((8'hb0) ~^ $signed((((reg43 ? reg39 : wire35) ?
              reg38 : reg40[(2'h3):(2'h3)]) >> $signed((^(8'ha9)))))))
            begin
              reg47 <= $unsigned(reg37);
              reg48 <= ($unsigned((-(8'haf))) >>> reg42[(1'h0):(1'h0)]);
              reg49 <= reg45[(4'h9):(4'h8)];
              reg50 <= (reg42 ?
                  $signed(((^~(reg49 ? reg42 : reg43)) ?
                      $unsigned($signed(wire31)) : (~^$unsigned(reg48)))) : ((wire36[(1'h0):(1'h0)] > (+(reg44 >> wire35))) | reg49));
            end
          else
            begin
              reg47 <= reg37[(4'hd):(2'h3)];
              reg48 <= $unsigned($unsigned((reg40 ?
                  $unsigned(((8'ha0) ? reg45 : reg50)) : $signed(reg44))));
              reg49 <= reg45[(3'h6):(3'h4)];
            end
        end
      else
        begin
          reg37 <= (~^wire33);
          reg38 <= $signed(reg39[(4'hc):(4'hc)]);
        end
      if ($unsigned($signed(($unsigned($unsigned((8'hae))) <<< (^~$unsigned(reg38))))))
        begin
          reg51 <= reg49[(2'h2):(2'h2)];
          reg52 <= {$signed($signed($signed((reg50 ? reg42 : wire34))))};
          reg53 <= (^~({$signed((wire31 ?
                  wire32 : (8'h9f)))} >= {reg37[(4'hb):(1'h0)]}));
        end
      else
        begin
          reg51 <= $signed((^~wire33));
          reg52 <= ($unsigned(reg43[(1'h1):(1'h1)]) >> ((reg45 ~^ $unsigned($signed((8'hb3)))) - reg52[(1'h0):(1'h0)]));
          reg53 <= reg38[(1'h0):(1'h0)];
        end
      reg54 <= reg51[(4'hc):(3'h6)];
      reg55 <= $unsigned(((~reg48) ?
          (wire32 > reg42[(4'hd):(4'h9)]) : (~|(((8'ha9) ? (8'hb9) : reg49) ?
              (reg48 ? wire36 : reg43) : (wire33 ^ reg38)))));
      reg56 <= ((reg55[(2'h2):(2'h2)] * $signed(((|reg50) ?
              $unsigned(reg48) : (reg44 ? reg45 : reg40)))) ?
          ((reg46[(2'h2):(1'h0)] ?
                  ($unsigned((8'ha9)) ?
                      $signed(wire34) : wire34) : $signed($signed(reg49))) ?
              reg51[(2'h3):(2'h2)] : (($unsigned(reg45) + $unsigned(reg50)) >= (8'ha8))) : reg43);
    end
  assign wire57 = {$unsigned(wire33[(2'h3):(2'h2)])};
  assign wire58 = ((({$unsigned(reg45)} + ({wire31, reg54} ?
                              (~wire34) : wire33)) ?
                          $signed(($unsigned(reg55) ?
                              {wire35} : {wire36})) : $signed({{reg55},
                              {wire31, reg43}})) ?
                      $signed(reg44) : {$unsigned(reg41), $signed(reg55)});
  assign wire59 = wire34[(3'h4):(2'h2)];
endmodule
