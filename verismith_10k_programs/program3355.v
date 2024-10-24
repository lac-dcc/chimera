module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire26,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg28,
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
                 (1'h0)};
  assign wire5 = $signed(wire3[(3'h6):(3'h4)]);
  assign wire6 = ((8'ha5) ? wire0[(3'h7):(1'h1)] : $signed((^(-(~wire3)))));
  assign wire7 = (|(wire6 ?
                     (~wire3[(4'hc):(4'hc)]) : {((~wire2) ?
                             (wire6 ? wire2 : wire0) : wire2),
                         (wire3 ^~ ((7'h42) >>> (8'ha5)))}));
  assign wire8 = ((wire0 ?
                         {$unsigned(wire2[(3'h6):(3'h4)])} : (~&wire6[(1'h0):(1'h0)])) ?
                     {(((wire2 ? wire7 : wire0) ?
                             (wire1 + wire4) : wire4[(2'h2):(2'h2)]) << (+wire1)),
                         wire7[(1'h1):(1'h0)]} : wire6);
  assign wire9 = (wire1[(1'h0):(1'h0)] <= ({(wire8 ? wire1 : $signed(wire8)),
                     wire7[(4'hf):(4'hf)]} * $unsigned(((wire3 >= wire6) ^ (+(8'hac))))));
  always
    @(posedge clk) begin
      if ($unsigned(($signed($unsigned(((8'ha0) ? (8'hae) : wire7))) << wire0)))
        begin
          reg10 <= $unsigned($unsigned($signed(wire5)));
          if ((&{((wire8[(1'h1):(1'h0)] ?
                      (wire5 ? wire7 : wire3) : $unsigned(wire9)) ?
                  wire3 : $signed({wire1})),
              $unsigned((8'h9d))}))
            begin
              reg11 <= $unsigned($unsigned((+$unsigned({wire7}))));
              reg12 <= ($signed(reg10[(1'h0):(1'h0)]) < (8'hb1));
            end
          else
            begin
              reg11 <= (~&wire4);
              reg12 <= (-(($signed((-wire8)) ?
                  ((wire2 ? wire2 : wire9) ?
                      {reg11} : ((7'h42) + (8'hb3))) : ((^~reg12) ?
                      (reg10 ?
                          wire1 : (8'ha2)) : wire7[(3'h6):(1'h1)])) | $signed($unsigned((wire8 <<< wire1)))));
              reg13 <= (8'hb1);
              reg14 <= (+reg13);
            end
        end
      else
        begin
          reg10 <= $unsigned(reg13);
          reg11 <= $signed(wire0);
          reg12 <= $signed({(~&$signed((8'ha7))), {wire6[(4'he):(1'h1)]}});
          reg13 <= (!wire0[(3'h4):(2'h3)]);
          reg14 <= {$signed($unsigned(reg10[(1'h1):(1'h0)])),
              $signed((!{(&reg10)}))};
        end
      reg15 <= reg12[(3'h7):(1'h1)];
      reg16 <= reg13;
      if (((wire9[(5'h10):(2'h2)] ?
              ($unsigned($signed(reg11)) || wire9[(4'hf):(4'hd)]) : $unsigned(((wire5 ?
                  wire7 : reg14) << {reg15}))) ?
          $unsigned(wire7[(4'he):(1'h1)]) : $unsigned(wire5)))
        begin
          reg17 <= {({(reg11 * $unsigned(wire8)), wire4[(3'h5):(2'h2)]} ?
                  wire2 : reg12)};
          reg18 <= wire7[(5'h12):(5'h12)];
          reg19 <= wire7[(4'hc):(3'h6)];
          reg20 <= (reg13[(2'h2):(1'h0)] << (+reg19[(5'h11):(4'ha)]));
        end
      else
        begin
          if ($signed(($unsigned($unsigned(reg11)) + (^reg13))))
            begin
              reg17 <= $unsigned($signed(($signed((wire4 ?
                  wire5 : wire6)) ^~ (~^$unsigned(reg18)))));
              reg18 <= reg17[(4'hb):(3'h7)];
              reg19 <= $unsigned((~^$signed(((wire1 ?
                  wire5 : reg17) & $signed((8'hac))))));
            end
          else
            begin
              reg17 <= reg17[(4'hb):(4'h8)];
              reg18 <= wire1[(2'h2):(2'h2)];
              reg19 <= (reg12[(3'h4):(2'h3)] ^~ (~|(((wire9 || wire6) ?
                      (reg13 < reg16) : $signed(reg11)) ?
                  wire2[(4'h8):(1'h0)] : (wire3 <<< $unsigned(wire9)))));
              reg20 <= (($unsigned($signed((|reg12))) ?
                      (((reg11 | wire8) >>> (wire3 ^~ reg10)) <= (~|(wire5 == wire2))) : ($unsigned((8'ha9)) >= ((wire4 ?
                          reg10 : (8'hac)) >> (reg17 ? (8'hb2) : reg12)))) ?
                  ((^(8'hb2)) ?
                      $unsigned($unsigned($unsigned(wire4))) : $signed(($signed(reg18) ~^ reg18))) : $unsigned($unsigned(((reg13 == reg15) < (^~reg17)))));
            end
          if (reg13)
            begin
              reg21 <= ({(reg20[(3'h4):(2'h3)] ?
                          ((wire8 ?
                              (7'h44) : wire7) & reg19[(2'h3):(1'h1)]) : $signed((reg10 ?
                              (7'h44) : reg11)))} ?
                  $unsigned(reg20) : wire5[(2'h3):(1'h1)]);
            end
          else
            begin
              reg21 <= $unsigned($unsigned(wire2));
              reg22 <= $unsigned((wire3 ?
                  (^(&reg16[(5'h13):(3'h4)])) : (~|(reg21[(1'h1):(1'h0)] ?
                      $signed(reg18) : (reg21 && reg18)))));
              reg23 <= ((~^reg21[(1'h1):(1'h0)]) ?
                  wire8 : (wire7 ?
                      {(wire9 ? reg16[(3'h5):(1'h0)] : (-reg19)),
                          $signed($unsigned(wire4))} : (8'ha3)));
            end
          reg24 <= (7'h41);
          reg25 <= ($signed(reg13) ?
              (wire6[(3'h7):(3'h6)] ?
                  $unsigned((7'h42)) : $unsigned($unsigned(wire6))) : $unsigned($signed(((wire7 - reg18) ?
                  (wire1 ? (8'ha0) : reg15) : $unsigned(reg11)))));
        end
    end
  assign wire26 = ({$signed((-(!wire4)))} ^ wire1[(3'h5):(2'h3)]);
  assign wire27 = (&reg25[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      reg28 <= reg22;
    end
  assign wire29 = (reg14 ?
                      ({(reg24 + $signed(reg22))} ?
                          (~&(^wire9[(5'h10):(1'h0)])) : $unsigned({wire6,
                              wire3[(2'h2):(1'h1)]})) : (^~$unsigned(reg12)));
  assign wire30 = ({$unsigned(($unsigned(reg16) ?
                          reg11[(1'h1):(1'h0)] : ((8'hb6) ^ reg23))),
                      ({$signed(reg12)} <<< ($unsigned(reg28) ?
                          {reg22} : $signed(reg10)))} > (8'hb9));
  assign wire31 = (8'hb3);
  assign wire32 = {(reg10[(1'h1):(1'h0)] && wire26[(4'ha):(3'h4)]),
                      ((&((reg10 ?
                          reg11 : wire31) >>> {reg22})) ^ {(!wire26[(3'h6):(1'h1)])})};
  assign wire33 = $signed($unsigned((&wire29[(1'h0):(1'h0)])));
  assign wire34 = (-$signed((|$unsigned(reg20))));
  assign wire35 = $signed(reg15);
  assign wire36 = ((wire26[(1'h0):(1'h0)] ? wire1 : reg18) && wire8);
  assign wire37 = {{(~|(~|$unsigned(reg19))), wire27[(3'h4):(1'h0)]},
                      wire7[(4'hc):(4'h9)]};
endmodule
