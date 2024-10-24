module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  assign y = {wire42,
                 wire24,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $unsigned({wire3[(3'h4):(1'h0)]});
  assign wire6 = $signed((^(~&wire0[(1'h1):(1'h1)])));
  assign wire7 = $signed(((wire0[(1'h1):(1'h0)] ?
                     (8'h9f) : {$unsigned(wire0),
                         $signed(wire1)}) ^~ (!($signed(wire5) ?
                     wire2[(4'hd):(2'h2)] : (~&(8'ha0))))));
  assign wire8 = (((((wire1 ? wire1 : wire2) ? (wire1 ^ wire1) : (7'h43)) ?
                         $signed(wire0) : (^wire1)) ?
                     $signed(wire0[(2'h3):(1'h1)]) : (8'hac)) | (|((wire3 ?
                     {(8'ha5)} : ((8'hb7) & wire7)) ^ $signed($signed(wire7)))));
  always
    @(posedge clk) begin
      reg9 <= (wire7 ? wire7 : wire4);
      if (reg9)
        begin
          reg10 <= {(((wire5 ^~ (!wire5)) ?
                      (~$unsigned(wire5)) : wire1[(4'hf):(3'h5)]) ?
                  ($unsigned($signed(wire5)) ?
                      (|$signed(wire5)) : $signed({wire1,
                          (8'hb1)})) : wire1[(1'h1):(1'h0)])};
          reg11 <= {(-wire2)};
          if ((wire3 ?
              wire8[(5'h10):(4'hc)] : {(wire6 - (|wire4[(4'hb):(4'hb)])),
                  wire3}))
            begin
              reg12 <= wire4[(4'h9):(3'h7)];
              reg13 <= {$signed($unsigned((!{wire7, wire8}))),
                  ((((~^(8'hb1)) >> $signed(reg10)) ?
                          ((wire1 & wire8) ?
                              wire2 : reg12[(4'h9):(3'h6)]) : $unsigned(wire7[(4'h9):(1'h1)])) ?
                      $unsigned({$signed(wire8), reg9[(3'h6):(1'h0)]}) : {wire6,
                          $signed($signed(reg9))})};
            end
          else
            begin
              reg12 <= wire2;
              reg13 <= ((+$signed(reg13)) == wire6[(1'h0):(1'h0)]);
              reg14 <= ($unsigned($signed((reg11 ?
                  $unsigned((7'h40)) : (^~reg10)))) << reg12);
              reg15 <= $unsigned(wire0[(3'h5):(2'h3)]);
            end
          if ($unsigned((+$unsigned(wire5))))
            begin
              reg16 <= reg10[(4'hf):(3'h6)];
              reg17 <= $signed((8'hb3));
            end
          else
            begin
              reg16 <= wire6[(3'h4):(2'h3)];
            end
          reg18 <= ({({{reg15, reg14}} ?
                  ($unsigned(reg13) ?
                      $unsigned((7'h44)) : $signed(wire5)) : (^~{wire0})),
              (((wire8 <= wire2) <= (wire6 ?
                  reg17 : wire1)) != $unsigned((-reg12)))} >>> wire4);
        end
      else
        begin
          reg10 <= (reg12 ? $signed($signed(wire5)) : wire7[(3'h4):(2'h2)]);
          if ((((|$unsigned(((8'h9f) ? reg12 : reg12))) ?
                  ((|(wire2 ~^ wire5)) ?
                      $signed((~^reg9)) : (&(-wire2))) : $signed(((wire5 ?
                          (8'hb4) : reg18) ?
                      reg16 : reg14[(4'hf):(2'h2)]))) ?
              $signed(wire8) : $signed($signed($unsigned((wire6 ?
                  (7'h40) : wire7))))))
            begin
              reg11 <= $unsigned((|{($signed((8'h9e)) >= {reg10, (8'hb4)}),
                  reg10[(4'hb):(3'h6)]}));
            end
          else
            begin
              reg11 <= (($signed($unsigned($unsigned(wire5))) ~^ ($unsigned($unsigned(reg11)) ?
                      $signed((^~reg14)) : wire8)) ?
                  reg16[(3'h5):(3'h4)] : reg17[(5'h14):(4'h8)]);
              reg12 <= {$signed((reg12[(3'h6):(3'h4)] ?
                      $unsigned(reg17[(4'hb):(4'hb)]) : (8'hba)))};
            end
          reg13 <= (-$signed($signed(wire3[(5'h10):(1'h1)])));
        end
      reg19 <= (wire0 ?
          reg15[(4'h8):(1'h1)] : (!$unsigned(reg13[(1'h0):(1'h0)])));
      if (({(~^wire7[(4'hc):(3'h7)]), wire7} ?
          reg11 : ((wire1 + reg12) ? (|(8'h9d)) : wire0[(1'h1):(1'h0)])))
        begin
          reg20 <= wire5;
          reg21 <= $unsigned((wire6 + ({wire4} ?
              (((8'h9d) ? reg15 : reg13) ?
                  $unsigned((8'hb2)) : reg9[(3'h7):(1'h0)]) : $unsigned(reg14[(4'hc):(4'ha)]))));
        end
      else
        begin
          reg20 <= wire8[(4'ha):(4'h9)];
          reg21 <= $unsigned(($signed(($signed((7'h44)) >> (wire3 >= wire2))) ?
              (!$unsigned($unsigned(wire2))) : $unsigned(reg16[(1'h0):(1'h0)])));
          reg22 <= $signed(wire2);
          reg23 <= (reg20[(2'h2):(2'h2)] ? (^~wire1[(4'h8):(3'h4)]) : reg9);
        end
    end
  assign wire24 = ((8'hb0) || reg15[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      if ((&(-$unsigned((+reg14[(1'h1):(1'h1)])))))
        begin
          if ($signed($signed($signed(wire2))))
            begin
              reg25 <= {($signed(reg23[(1'h1):(1'h0)]) ?
                      {((reg21 + wire6) ^ (wire7 << (8'hb5)))} : (~^(+reg14)))};
              reg26 <= $signed((reg22 <<< (&((~^reg14) ?
                  $unsigned(wire7) : (8'hb7)))));
              reg27 <= $unsigned(reg17);
              reg28 <= wire8;
            end
          else
            begin
              reg25 <= $unsigned(reg14[(3'h7):(3'h5)]);
              reg26 <= ((reg23[(3'h4):(3'h4)] ?
                  {$signed((reg9 & wire0)),
                      $unsigned($unsigned(reg19))} : ({((8'hac) ^~ (8'h9c)),
                      (wire2 ?
                          (8'haa) : wire5)} ^~ (-$unsigned(reg27)))) >= ($unsigned((~&(wire6 ^ reg18))) ~^ $signed($signed((reg16 ?
                  wire2 : reg21)))));
              reg27 <= reg14[(4'h9):(3'h6)];
              reg28 <= (((!$signed($unsigned(reg13))) ?
                      reg21 : $signed((~&wire1))) ?
                  ({$unsigned(reg23)} ?
                      (((reg10 == wire1) || (wire8 & reg9)) ?
                          $signed((reg23 ?
                              reg9 : wire1)) : $unsigned(reg14)) : ({(reg14 ?
                              (7'h42) : wire3),
                          {wire3}} || ({reg20} ?
                          $unsigned(reg22) : (|wire5)))) : $signed((wire7 + $signed((~|wire8)))));
              reg29 <= reg9[(2'h2):(1'h0)];
            end
        end
      else
        begin
          if (reg17)
            begin
              reg25 <= $signed(reg14);
              reg26 <= ($unsigned($signed($signed((~|wire1)))) <<< $signed($signed($signed((~reg23)))));
              reg27 <= reg16[(2'h2):(1'h0)];
              reg28 <= reg20[(3'h5):(3'h4)];
              reg29 <= reg22[(3'h7):(1'h0)];
            end
          else
            begin
              reg25 <= reg29[(3'h4):(3'h4)];
              reg26 <= reg15;
              reg27 <= wire8[(5'h10):(3'h4)];
              reg28 <= wire4[(4'h9):(3'h7)];
              reg29 <= wire1;
            end
        end
      if ($unsigned((!(!$unsigned($unsigned(reg26))))))
        begin
          if ((8'ha6))
            begin
              reg30 <= {(~|(+$signed((reg17 ? wire4 : wire4)))),
                  {((reg26[(1'h1):(1'h0)] ?
                              (reg14 & wire7) : ((8'hab) & (7'h41))) ?
                          (^~(&reg27)) : (~|((8'h9c) ? reg23 : reg16)))}};
              reg31 <= (reg25[(5'h10):(3'h6)] ?
                  ($signed((wire0 ?
                      (wire24 - reg19) : reg12)) ~^ reg17) : $unsigned((^~$signed((reg17 | reg30)))));
              reg32 <= wire3;
            end
          else
            begin
              reg30 <= (8'hba);
              reg31 <= reg30[(5'h10):(3'h4)];
            end
          reg33 <= $unsigned($signed((~|($signed(reg13) ?
              reg28 : wire2[(4'h9):(1'h1)]))));
        end
      else
        begin
          reg30 <= reg17;
        end
      if (($signed(($signed($unsigned(reg25)) ?
          reg12 : ((&(8'ha3)) <= ((8'ha3) - reg13)))) >>> reg32[(3'h4):(1'h0)]))
        begin
          reg34 <= (~^reg11[(1'h0):(1'h0)]);
          reg35 <= reg22[(4'h9):(3'h4)];
        end
      else
        begin
          reg34 <= $unsigned((&reg20));
          if ((~wire3))
            begin
              reg35 <= ((~|reg29) ?
                  ((~&(+reg30)) ?
                      $unsigned(wire24[(4'hb):(3'h4)]) : $unsigned($signed((reg35 - wire2)))) : $signed(wire4));
              reg36 <= (^~(reg18[(1'h1):(1'h1)] ?
                  reg14 : $signed((wire7 >> (~reg14)))));
              reg37 <= wire0;
            end
          else
            begin
              reg35 <= {$signed((($signed(wire6) ?
                      $signed(reg33) : $unsigned((8'ha7))) != (((8'ha2) ?
                      reg36 : reg32) >= reg10))),
                  $signed(($signed($unsigned(wire1)) <= reg12[(3'h4):(2'h2)]))};
            end
          if ((8'hb0))
            begin
              reg38 <= (^reg34);
              reg39 <= {({($signed((8'h9e)) >> $signed(wire6))} ?
                      $signed(($unsigned(reg23) && (reg17 ?
                          wire5 : reg34))) : reg11[(1'h1):(1'h1)])};
            end
          else
            begin
              reg38 <= reg14;
            end
          reg40 <= (-wire8[(2'h2):(1'h0)]);
          reg41 <= reg20;
        end
    end
  assign wire42 = ($signed(reg37[(3'h4):(1'h1)]) ?
                      ($unsigned($signed($unsigned(reg18))) >>> $signed($signed($unsigned(wire0)))) : (reg13[(1'h1):(1'h0)] >>> (~reg22[(3'h7):(3'h6)])));
endmodule
