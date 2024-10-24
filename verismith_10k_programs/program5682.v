module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  assign y = {wire61, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed((&$unsigned($unsigned(wire1[(1'h1):(1'h1)]))));
  assign wire5 = $signed((~^$signed(($signed(wire2) ?
                     $signed(wire0) : (8'ha5)))));
  assign wire6 = $signed($signed(wire0[(3'h5):(1'h0)]));
  module7 #() modinst62 (wire61, clk, wire3, wire1, wire6, wire5);
endmodule

module module7
#(parameter param59 = (({({(8'hb0), (7'h42)} ? ((8'ha6) - (8'ha2)) : (&(8'haa))), (-((8'hb1) ? (8'ha4) : (8'hb4)))} * (^{((8'ha4) ^ (8'hb6))})) << ((~&(^((8'ha7) <= (8'ha4)))) < ((((7'h41) ? (7'h44) : (8'hb4)) ? ((7'h40) ? (8'ha4) : (7'h42)) : {(8'hb1)}) > (((8'hbd) ? (8'haa) : (8'hbb)) >>> ((8'ha9) ? (8'ha1) : (8'hba)))))), 
parameter param60 = param59)
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h200):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire17,
                 wire16,
                 reg58,
                 reg57,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= (wire8[(4'hc):(4'ha)] ?
          wire9[(3'h7):(1'h1)] : (({wire11[(1'h0):(1'h0)],
                  ((8'hae) ? wire8 : wire11)} ?
              wire9 : $signed(wire8[(4'ha):(2'h3)])) <<< wire8[(1'h0):(1'h0)]));
      reg13 <= wire11;
      reg14 <= $signed($signed(($signed($unsigned((8'hb1))) ?
          wire9[(1'h1):(1'h0)] : reg13)));
      reg15 <= (reg12[(3'h5):(2'h3)] ?
          $unsigned((^~{$unsigned((8'h9f)),
              (8'hb8)})) : $signed((((|wire10) >= $unsigned(reg13)) + (8'had))));
    end
  assign wire16 = reg12[(4'hc):(4'h8)];
  assign wire17 = wire8[(4'hf):(3'h5)];
  always
    @(posedge clk) begin
      reg18 <= (reg12[(3'h4):(1'h1)] ?
          reg13[(3'h5):(3'h4)] : (({wire11} ?
                  $signed($signed(reg14)) : (reg15[(2'h2):(2'h2)] <<< $unsigned(wire9))) ?
              $signed(wire10[(4'h9):(3'h6)]) : wire16));
      reg19 <= wire16[(2'h2):(1'h0)];
      reg20 <= (8'hb3);
    end
  always
    @(posedge clk) begin
      reg21 <= (~$signed(reg12));
      reg22 <= reg21[(5'h12):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg23 <= reg13;
      reg24 <= $signed((^~(-(^(+reg19)))));
      if (wire11[(2'h3):(2'h3)])
        begin
          reg25 <= ($signed($signed(wire10[(4'he):(4'h8)])) >>> (~|wire17));
        end
      else
        begin
          if ($unsigned((8'ha0)))
            begin
              reg25 <= reg23[(2'h2):(1'h0)];
            end
          else
            begin
              reg25 <= $unsigned(((&$signed((reg14 <<< reg12))) ?
                  $unsigned((reg25 ?
                      wire8 : (reg12 ?
                          wire11 : (8'had)))) : {$signed((reg24 >= wire16))}));
              reg26 <= (~|$unsigned(((!(~^wire8)) ? reg14 : $unsigned(wire8))));
            end
          reg27 <= $signed({($unsigned((reg18 ?
                  (8'had) : reg26)) <= (&(|reg14)))});
          reg28 <= $unsigned({wire9[(1'h1):(1'h1)]});
          reg29 <= reg21;
        end
    end
  always
    @(posedge clk) begin
      if ((reg15 ?
          ((~^reg15) && $signed({(reg15 ?
                  reg22 : (8'ha9))})) : $signed(((wire8[(4'hf):(1'h1)] < (wire9 ?
                  reg25 : reg18)) ?
              $signed($unsigned((8'hbf))) : reg15[(1'h1):(1'h1)]))))
        begin
          reg30 <= ($unsigned({reg24[(4'h8):(2'h3)], reg12[(2'h3):(1'h0)]}) ?
              reg14 : (wire8[(2'h3):(1'h0)] ?
                  {(8'hb9), reg25} : $unsigned((((8'h9e) ?
                      reg14 : reg18) > wire11[(2'h2):(1'h0)]))));
          reg31 <= (((~$signed(reg29)) && reg23) != {(-(reg30 < $unsigned(wire9))),
              {(~&(reg26 ? (8'hbf) : reg22))}});
          if ((!(reg14[(3'h4):(1'h0)] != {((wire9 >>> reg15) ?
                  reg18[(1'h1):(1'h1)] : reg23)})))
            begin
              reg32 <= $signed(((reg23 ?
                      (~|(reg12 ? wire16 : reg24)) : ((+reg29) ?
                          (reg21 != reg19) : $unsigned((8'h9c)))) ?
                  $signed(wire11) : reg18[(2'h2):(1'h1)]));
              reg33 <= reg18[(2'h3):(2'h2)];
              reg34 <= ((~(((^reg19) - reg21[(5'h11):(3'h7)]) <<< $unsigned($signed(reg29)))) << {(+{wire11[(3'h4):(1'h1)]}),
                  {{reg23, (reg28 ? reg27 : reg15)}}});
            end
          else
            begin
              reg32 <= (^wire9);
              reg33 <= (reg29 ^~ ($unsigned((!$unsigned((8'hb5)))) ?
                  $signed($signed((wire11 ?
                      wire8 : reg21))) : reg25[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          reg30 <= (^$signed($signed($unsigned((7'h42)))));
          reg31 <= $unsigned(reg20);
          if ($unsigned($unsigned(reg23[(3'h4):(1'h0)])))
            begin
              reg32 <= (+(reg29 ?
                  ($signed($unsigned(reg13)) >= ($unsigned(reg32) == (reg21 ?
                      reg13 : reg25))) : $signed({$signed(wire16),
                      {reg23, wire11}})));
              reg33 <= (~(|reg12));
              reg34 <= $unsigned((wire9[(2'h3):(1'h0)] ?
                  $unsigned((wire16 > (reg25 ? (8'ha7) : reg15))) : {reg30,
                      (8'hb2)}));
            end
          else
            begin
              reg32 <= reg21;
              reg33 <= reg15[(1'h1):(1'h0)];
              reg34 <= (((^~({reg28} ?
                      (wire17 ?
                          reg23 : reg20) : reg18)) >= $unsigned(($signed(reg28) != {wire17}))) ?
                  (reg28 >>> $unsigned(reg15)) : (^~($signed(wire16[(1'h1):(1'h0)]) ^ (wire10 > $unsigned(reg18)))));
              reg35 <= $unsigned(wire10[(5'h10):(3'h6)]);
              reg36 <= (~|$signed(reg23[(1'h0):(1'h0)]));
            end
        end
      reg37 <= ((8'had) ?
          (((~|reg35) ?
              {$unsigned(reg32),
                  $signed(reg14)} : wire9) ^ $signed(reg29[(3'h5):(1'h1)])) : ($signed(reg13[(1'h1):(1'h0)]) ~^ reg36[(2'h3):(1'h0)]));
      if (reg15[(1'h1):(1'h1)])
        begin
          reg38 <= $signed((8'ha6));
          if ((7'h41))
            begin
              reg39 <= $unsigned((^~(!reg24)));
              reg40 <= reg32;
              reg41 <= $signed($signed((~reg25)));
            end
          else
            begin
              reg39 <= reg36;
              reg40 <= reg26;
              reg41 <= (+reg18[(2'h2):(1'h0)]);
            end
        end
      else
        begin
          reg38 <= $unsigned({$unsigned((~^reg41[(3'h5):(1'h1)])),
              ((reg18[(1'h0):(1'h0)] ?
                  reg23[(1'h1):(1'h1)] : reg20[(3'h4):(1'h0)]) <= reg12)});
        end
      reg42 <= (^~reg41);
      reg43 <= (((((^~(8'ha6)) ? $signed((8'ha3)) : reg33[(2'h2):(1'h1)]) ?
          $unsigned((reg12 < reg13)) : reg36[(3'h5):(2'h3)]) ^~ reg38) >>> ($unsigned($signed((~reg14))) + wire9[(2'h3):(2'h2)]));
    end
  assign wire44 = $signed($unsigned((reg19[(2'h2):(2'h2)] <= reg20)));
  assign wire45 = reg32[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      if ($signed(reg18))
        begin
          reg46 <= reg29;
        end
      else
        begin
          if (reg38)
            begin
              reg46 <= reg32;
              reg47 <= ((^wire16) ?
                  (((reg30[(3'h4):(3'h4)] & $unsigned(reg36)) - reg27) ?
                      {{$unsigned(reg42)}} : {(+wire44),
                          ($unsigned((7'h41)) == $unsigned(reg29))}) : ($signed(reg13[(3'h5):(3'h5)]) ^~ ($signed(reg21[(4'hf):(4'hc)]) ?
                      wire16 : ($signed((8'hbd)) ?
                          (reg30 ? reg46 : reg21) : (^reg33)))));
              reg48 <= (~|reg35[(2'h3):(2'h3)]);
              reg49 <= (-reg33[(3'h7):(3'h4)]);
              reg50 <= (reg15 - reg15);
            end
          else
            begin
              reg46 <= (-((reg28 <= ((~reg47) >= $unsigned(reg22))) < ((!(reg18 || wire10)) << (reg22[(2'h3):(2'h3)] ~^ reg21[(3'h7):(3'h4)]))));
            end
          reg51 <= {reg38[(2'h3):(1'h1)]};
        end
      if (reg39[(3'h4):(2'h2)])
        begin
          reg52 <= reg18[(2'h3):(2'h3)];
          reg53 <= (7'h43);
          reg54 <= reg53[(2'h3):(1'h0)];
          reg55 <= $unsigned((~$unsigned((~(reg50 ^ reg32)))));
        end
      else
        begin
          reg52 <= $signed(wire16[(1'h0):(1'h0)]);
        end
      reg56 <= reg34[(2'h3):(2'h2)];
      if ((^($unsigned(wire45[(3'h7):(3'h7)]) ?
          reg46[(3'h4):(1'h0)] : ($unsigned((reg52 <<< reg46)) - (~|(reg33 < reg19))))))
        begin
          reg57 <= (^reg48[(1'h0):(1'h0)]);
        end
      else
        begin
          reg57 <= {$signed((reg43[(2'h3):(1'h0)] <= {$signed(reg23),
                  (reg43 ~^ (8'ha9))}))};
          reg58 <= (($unsigned(((~&wire44) ?
                  reg19[(1'h0):(1'h0)] : (-reg43))) >= reg34[(1'h1):(1'h1)]) ?
              reg13[(2'h3):(2'h3)] : (($signed($unsigned(reg12)) ^ wire17) <= ((((8'hae) >= reg31) ~^ $signed(wire44)) ?
                  ({(8'hb9),
                      reg22} && $signed(reg18)) : (-$unsigned(wire44)))));
        end
    end
endmodule
