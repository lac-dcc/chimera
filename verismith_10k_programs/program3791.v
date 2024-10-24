module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire41,
                 wire17,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg42,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = (({{wire0},
                     $unsigned($unsigned((8'hbd)))} & wire3) > {($unsigned((8'hb9)) > wire0),
                     $unsigned(wire3[(4'h8):(2'h2)])});
  assign wire5 = wire2;
  assign wire6 = ((8'h9f) <= wire2);
  assign wire7 = (({(^(wire1 ? wire1 : (7'h40)))} ?
                     $signed((!(wire0 != wire6))) : (wire1[(5'h12):(3'h5)] ?
                         wire5[(1'h0):(1'h0)] : $signed($signed(wire3)))) - (wire0[(2'h2):(1'h1)] ^~ $unsigned($signed($signed(wire2)))));
  assign wire8 = $unsigned(($unsigned(wire6[(1'h0):(1'h0)]) ?
                     $unsigned($unsigned(wire2)) : wire1[(4'hd):(3'h4)]));
  always
    @(posedge clk) begin
      if ((~^((~wire2) < (wire6 ?
          (wire0 ?
              wire5[(2'h2):(2'h2)] : (wire0 ?
                  wire0 : (8'ha6))) : ($signed(wire5) >= (wire8 ?
              (8'hbb) : (8'ha5)))))))
        begin
          reg9 <= {{({$unsigned(wire1)} ?
                      wire4[(3'h4):(3'h4)] : ({wire0, wire8} <<< (~(8'ha4)))),
                  $signed((+$signed((8'haa))))}};
          reg10 <= ($unsigned((($unsigned(reg9) * $signed((8'h9c))) ~^ ((8'hb8) ^ (wire6 ?
                  (8'ha2) : wire0)))) ?
              {(((!wire3) > (wire2 | wire6)) ?
                      (8'hb9) : (reg9[(5'h13):(4'ha)] || wire7))} : ($signed((8'ha9)) ?
                  wire0[(3'h5):(2'h3)] : (~|$signed((wire0 <<< (8'hb7))))));
        end
      else
        begin
          if ((~($unsigned(($unsigned(wire1) < $signed(wire1))) ?
              (~^((wire7 ? wire5 : wire1) ?
                  wire6 : $signed(wire3))) : (~|($unsigned(reg9) ?
                  $signed(wire8) : (wire1 ? (8'hbc) : wire4))))))
            begin
              reg9 <= wire2;
              reg10 <= $signed((!wire4[(5'h14):(5'h14)]));
            end
          else
            begin
              reg9 <= $signed(((8'h9d) ? $unsigned($signed((!wire1))) : wire1));
              reg10 <= (((!$unsigned($unsigned(wire6))) ?
                  $signed(wire1) : wire2) * wire1);
            end
          if ((~|$signed(wire8[(3'h6):(3'h4)])))
            begin
              reg11 <= $signed(wire7[(4'hf):(2'h3)]);
              reg12 <= $signed(((~|(&(wire6 <<< reg9))) ?
                  (-(+((8'hbd) ? (8'hbd) : wire6))) : (-((wire7 ^~ reg9) ?
                      (reg9 && wire1) : $signed(reg11)))));
            end
          else
            begin
              reg11 <= (($signed(wire2[(4'h9):(3'h6)]) >= wire3) ?
                  wire0 : (8'hb3));
              reg12 <= reg9[(4'he):(4'hc)];
              reg13 <= {(reg10 * $signed(wire4[(3'h6):(3'h6)])),
                  (($unsigned($unsigned(wire3)) != (wire3[(1'h1):(1'h0)] | wire7)) ?
                      $unsigned($unsigned($unsigned(reg12))) : (wire4 & (^((8'ha8) >> wire1))))};
            end
          reg14 <= wire2[(3'h7):(1'h0)];
          reg15 <= wire1;
        end
      reg16 <= (7'h41);
    end
  assign wire17 = wire6[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((-wire2))
        begin
          if ({((~($unsigned(wire4) ? $unsigned(wire0) : $unsigned(wire5))) ?
                  (-$unsigned(reg9)) : reg9[(5'h12):(1'h0)]),
              wire5[(1'h0):(1'h0)]})
            begin
              reg18 <= wire4;
              reg19 <= $signed((reg16 ?
                  $unsigned((~^(wire6 ? (8'h9e) : reg14))) : (((~^(8'ha2)) ?
                      reg9 : wire8) ^ (wire7 - wire3))));
            end
          else
            begin
              reg18 <= $signed(wire1[(3'h7):(3'h5)]);
              reg19 <= wire4;
              reg20 <= ($unsigned($unsigned((reg16 ^ (&reg10)))) ?
                  (~($signed($signed(reg19)) | reg10)) : reg12);
            end
          reg21 <= {$unsigned($unsigned((reg19[(3'h7):(3'h7)] ?
                  $signed((8'hb5)) : $unsigned((8'hb1)))))};
          reg22 <= reg20;
          reg23 <= (reg20[(2'h2):(1'h0)] ? wire7 : $signed((+(~&(&wire2)))));
        end
      else
        begin
          if ((-((wire0 ? $signed($unsigned(reg23)) : reg20[(2'h2):(1'h0)]) ?
              {(~|(reg22 <= reg19)),
                  $signed((wire3 ^ wire3))} : $signed(reg16))))
            begin
              reg18 <= $unsigned((($unsigned({wire3}) ?
                  (wire6[(1'h0):(1'h0)] ?
                      wire6[(1'h1):(1'h1)] : $unsigned(wire0)) : ($unsigned((8'ha2)) ?
                      (8'ha3) : wire8[(2'h3):(2'h2)])) == reg10[(4'h8):(3'h5)]));
              reg19 <= $unsigned($unsigned($unsigned(((wire6 > (8'ha0)) ?
                  (reg12 >> reg20) : (|wire17)))));
            end
          else
            begin
              reg18 <= $unsigned({$unsigned({wire8, (reg16 << reg12)})});
              reg19 <= (~^reg14);
              reg20 <= $unsigned(({$signed(wire17)} ?
                  $signed(wire5) : {(reg22 ? reg13 : (^wire5)),
                      $signed($signed((8'hb3)))}));
              reg21 <= wire5[(1'h0):(1'h0)];
              reg22 <= reg20[(3'h5):(3'h4)];
            end
          if (({(((reg9 ? wire7 : reg11) ^ $unsigned((8'hb9))) ?
                      $unsigned((reg16 ?
                          reg18 : (7'h40))) : ($unsigned(reg14) * $signed(wire4)))} ?
              $unsigned((8'ha6)) : (8'hbc)))
            begin
              reg23 <= $signed(((($signed(wire2) ?
                  (wire7 ?
                      reg19 : wire1) : $signed(reg12)) ~^ ((reg19 ~^ reg10) < (reg9 ?
                  wire5 : (8'hbf)))) > $signed(reg20)));
              reg24 <= wire4;
              reg25 <= ((^$unsigned({(reg23 ?
                      wire8 : reg21)})) ^~ reg10[(2'h3):(1'h0)]);
            end
          else
            begin
              reg23 <= (wire17[(3'h4):(1'h0)] ?
                  reg23[(3'h7):(3'h5)] : $signed((~^wire3)));
            end
          reg26 <= reg22[(3'h4):(2'h2)];
          if ($unsigned(reg14))
            begin
              reg27 <= $unsigned((8'hab));
              reg28 <= $signed($signed((~|(wire3[(3'h6):(1'h1)] == reg21))));
              reg29 <= reg10[(4'hc):(4'h8)];
            end
          else
            begin
              reg27 <= reg27[(1'h0):(1'h0)];
              reg28 <= ((7'h41) & $signed(reg28[(1'h0):(1'h0)]));
            end
        end
      reg30 <= (&wire1);
      if ($unsigned((8'hb2)))
        begin
          reg31 <= ((reg25[(4'h9):(3'h6)] >> ($unsigned($unsigned(reg29)) ?
              (+wire1) : {(reg24 > reg19)})) <<< $unsigned($unsigned($signed($signed(reg11)))));
          reg32 <= $unsigned(wire4);
        end
      else
        begin
          reg31 <= (-reg12);
          reg32 <= reg22[(1'h0):(1'h0)];
          if ((-({wire3[(2'h3):(1'h1)],
              $signed(reg25[(2'h2):(2'h2)])} ^~ ({$signed(reg15)} ^ $signed((reg10 | reg16))))))
            begin
              reg33 <= ($signed($signed((!((8'ha9) << reg15)))) - (8'ha5));
              reg34 <= $unsigned({($signed((wire2 - reg16)) && $signed((reg28 - wire17)))});
              reg35 <= reg20;
              reg36 <= (!reg23);
            end
          else
            begin
              reg33 <= (wire0[(1'h1):(1'h1)] ?
                  (~(+($unsigned(wire0) ?
                      (&(8'ha6)) : (reg36 - reg21)))) : reg10);
              reg34 <= (((~^{$unsigned((8'hb0))}) << $unsigned($unsigned((~|reg34)))) > (~|($unsigned(((8'hb8) ?
                      reg27 : reg35)) ?
                  {reg21[(2'h3):(1'h1)]} : $unsigned((^(8'ha3))))));
              reg35 <= $signed(reg27);
              reg36 <= $signed((|$signed({(wire7 ? reg12 : reg22)})));
              reg37 <= (reg32 ^ $signed($unsigned((^~{reg31}))));
            end
          reg38 <= (^~$unsigned((({reg35} ?
              $unsigned(reg22) : (wire7 || (8'ha5))) + $signed(reg13[(2'h3):(2'h2)]))));
          reg39 <= (^($unsigned(reg34) ?
              ((((8'hb2) ? reg23 : (8'hbe)) ?
                  (~|(7'h43)) : (reg10 < reg30)) >> reg25[(3'h5):(2'h3)]) : reg30[(2'h2):(1'h0)]));
        end
      reg40 <= wire3;
    end
  assign wire41 = (reg37 ?
                      {(~&$unsigned((~|reg20)))} : ($unsigned((-$unsigned((8'hb4)))) ?
                          (8'haa) : (+((&wire6) ?
                              (wire2 ? reg15 : wire17) : $unsigned(reg15)))));
  always
    @(posedge clk) begin
      reg42 <= (reg27[(2'h3):(1'h0)] ?
          $signed($unsigned($signed($unsigned(wire5)))) : wire8[(1'h1):(1'h1)]);
    end
endmodule
