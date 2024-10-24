module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire26;
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  assign y = {wire72,
                 wire70,
                 wire44,
                 wire43,
                 wire42,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  module4 #() modinst27 (.wire5((7'h41)), .wire8(wire2), .wire7(wire0), .clk(clk), .wire9(wire3), .y(wire26), .wire6(wire1));
  assign wire28 = $signed($unsigned(wire2[(4'h9):(4'h8)]));
  assign wire29 = ($signed((((wire3 > wire0) ? wire0 : wire26) && wire26)) ?
                      (wire1[(2'h3):(1'h0)] ?
                          ((~wire2[(1'h0):(1'h0)]) > (~|(^wire26))) : wire28[(2'h3):(1'h0)]) : (((-(-(8'h9f))) || $unsigned((8'hbd))) ?
                          $unsigned(wire28[(3'h7):(3'h7)]) : $signed($unsigned($signed(wire26)))));
  assign wire30 = wire3;
  assign wire31 = (8'had);
  assign wire32 = wire2;
  always
    @(posedge clk) begin
      if ((|$signed($signed(wire28))))
        begin
          reg33 <= $signed(wire0[(4'hf):(4'hd)]);
          reg34 <= $unsigned(wire30[(4'h8):(2'h2)]);
          if (wire28)
            begin
              reg35 <= ($unsigned((($unsigned(wire3) ?
                      {wire3, wire1} : wire29) * $unsigned($unsigned(reg34)))) ?
                  $signed(wire26[(1'h0):(1'h0)]) : {wire31});
              reg36 <= (~^wire2[(3'h6):(3'h6)]);
              reg37 <= wire28[(2'h2):(1'h0)];
            end
          else
            begin
              reg35 <= wire28[(1'h0):(1'h0)];
              reg36 <= $unsigned({((^~wire29[(4'h9):(3'h6)]) ?
                      (wire32[(4'hb):(2'h3)] ?
                          wire1[(1'h1):(1'h0)] : ((8'hbe) ?
                              wire1 : reg36)) : {((8'hb7) < (8'hb5))})});
            end
          reg38 <= {((wire32[(4'he):(4'hc)] && (wire3 ?
                  $unsigned(wire2) : $signed(wire30))) >> $unsigned($unsigned((8'hbf)))),
              (!$signed({$unsigned(wire32), (wire1 != wire30)}))};
          reg39 <= (reg36[(5'h13):(3'h7)] ?
              (($signed($signed(reg36)) ?
                      $signed((wire3 ?
                          (8'hb2) : reg34)) : $signed($signed(wire3))) ?
                  $signed((|(-wire0))) : (~^$signed((8'had)))) : $unsigned($unsigned((-(wire3 >>> wire29)))));
        end
      else
        begin
          reg33 <= {$signed(reg39)};
          reg34 <= (^~reg36);
        end
      reg40 <= {(~(($signed(reg34) ? $signed(wire30) : (reg38 > reg36)) ?
              $signed((|wire29)) : (wire29[(3'h7):(3'h7)] ?
                  $unsigned(wire1) : wire31)))};
      reg41 <= (7'h42);
    end
  assign wire42 = reg41[(5'h12):(3'h5)];
  assign wire43 = $signed(reg35[(4'ha):(3'h7)]);
  assign wire44 = (!($signed($signed(((8'hb0) + reg33))) * ({(~&wire32),
                          (wire26 ? wire2 : reg36)} ?
                      ((~wire30) & wire2) : ({reg35,
                          (8'ha9)} << $unsigned(wire0)))));
  module45 #() modinst71 (.wire47(wire2), .wire46(wire32), .wire50(wire44), .y(wire70), .wire49(wire0), .clk(clk), .wire48(reg39));
  assign wire72 = $signed(($signed(reg38[(1'h1):(1'h0)]) >> $signed((reg33 ?
                      $signed(wire70) : reg36))));
endmodule

module module45  (y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire50;
  input wire [(4'hc):(1'h0)] wire49;
  input wire [(5'h15):(1'h0)] wire48;
  input wire [(3'h6):(1'h0)] wire47;
  input wire signed [(5'h13):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire63,
                 wire62,
                 wire61,
                 reg65,
                 reg64,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed((wire47[(3'h6):(1'h0)] == wire50[(4'h8):(3'h5)]))))
        begin
          reg51 <= $signed($unsigned((($signed(wire46) ?
                  $unsigned(wire50) : $signed((8'ha1))) ?
              (!((8'ha7) + wire47)) : (8'h9c))));
        end
      else
        begin
          reg51 <= $unsigned($unsigned(((+wire50) + wire48[(3'h5):(3'h5)])));
          if (((((!$unsigned(wire48)) ?
                  (|(reg51 * reg51)) : $signed(wire49)) != (~|wire50)) ?
              wire50[(3'h7):(2'h3)] : (8'hbb)))
            begin
              reg52 <= {wire48};
              reg53 <= wire49;
              reg54 <= (+reg53[(4'h9):(2'h2)]);
            end
          else
            begin
              reg52 <= (wire49 ?
                  ($signed({$unsigned(reg52)}) ?
                      wire49[(2'h3):(2'h3)] : (&($unsigned((7'h42)) ?
                          (wire48 | reg51) : (reg52 | reg53)))) : $unsigned(($signed(((8'haf) ?
                      wire47 : reg53)) <<< (^~reg52[(4'hd):(4'hc)]))));
              reg53 <= (8'ha6);
            end
          if ($unsigned(wire50[(5'h10):(4'h9)]))
            begin
              reg55 <= wire46[(2'h3):(2'h3)];
              reg56 <= (|(reg55[(3'h6):(2'h2)] > $signed(wire48[(1'h0):(1'h0)])));
              reg57 <= reg52[(4'hd):(4'h8)];
              reg58 <= (~reg52[(4'ha):(3'h4)]);
            end
          else
            begin
              reg55 <= wire48;
              reg56 <= ((wire47 < wire46[(4'h9):(3'h4)]) & reg57[(1'h1):(1'h0)]);
              reg57 <= $signed((~^$signed((+$signed((8'h9d))))));
              reg58 <= wire46[(1'h0):(1'h0)];
              reg59 <= ($unsigned(reg54[(1'h0):(1'h0)]) ?
                  (wire46[(3'h4):(1'h1)] > (!(wire46 <= (wire50 <<< reg55)))) : wire50);
            end
          reg60 <= reg51;
        end
    end
  assign wire61 = {$signed(({(reg54 == (8'hb5))} << (reg57[(2'h2):(1'h1)] ?
                          {reg59} : {wire48, reg57})))};
  assign wire62 = $signed((~|(($signed(reg60) ? (wire47 - reg51) : reg51) ?
                      {wire46[(4'hf):(2'h3)],
                          {wire61, reg53}} : $signed($unsigned(reg53)))));
  assign wire63 = (reg57[(1'h0):(1'h0)] ?
                      reg58[(2'h3):(2'h3)] : ((wire46[(4'hf):(3'h6)] ~^ ((wire61 || reg54) ?
                              wire48[(5'h11):(2'h2)] : (~^wire61))) ?
                          (+$signed(wire48)) : $signed({reg58})));
  always
    @(posedge clk) begin
      reg64 <= $unsigned(wire48[(2'h3):(2'h2)]);
      reg65 <= (-((8'hbe) && (wire49[(4'hb):(4'h9)] >= $signed((reg57 ?
          reg60 : (8'hb1))))));
    end
  assign wire66 = {(^wire46[(4'ha):(4'h9)])};
  assign wire67 = $unsigned($unsigned(wire48));
  assign wire68 = ({$signed((~^$signed(wire50))),
                          (((wire47 > reg53) ^ wire67) ?
                              wire50 : (~&(wire66 ? reg51 : wire67)))} ?
                      ({wire61[(1'h0):(1'h0)]} + wire50[(1'h0):(1'h0)]) : reg60);
  assign wire69 = $unsigned(wire48);
endmodule

module module4
#(parameter param24 = ((!((~^((8'hbe) ^~ (8'had))) ? (8'hb3) : ((~^(8'hb0)) + ((8'ha4) ? (8'ha3) : (8'had))))) ? {((^~(&(8'haa))) ? {{(8'hb1), (8'ha4)}, (^~(8'hba))} : ((~^(7'h40)) >> ((7'h41) == (7'h42))))} : (~&(|{{(8'hb8), (8'hb7)}, (|(8'ha8))}))), 
parameter param25 = ((8'hb8) ^~ (^(^param24))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire6;
  input wire signed [(3'h6):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire10;
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire10,
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
                 (1'h0)};
  assign wire10 = {wire6};
  always
    @(posedge clk) begin
      if (($signed((~&$unsigned((wire9 | wire5)))) ?
          $signed((~|$unsigned((wire6 ?
              wire6 : wire9)))) : ((wire5 == ($unsigned(wire8) ~^ (^wire8))) ?
              wire5[(2'h2):(1'h1)] : ({wire8, wire5} ?
                  ((8'ha3) ?
                      $unsigned((8'hbe)) : (wire10 ?
                          (7'h41) : wire6)) : wire8[(1'h1):(1'h1)]))))
        begin
          reg11 <= $unsigned($unsigned((($signed(wire10) ^~ $signed(wire6)) || (wire6[(4'hb):(3'h6)] != $signed((8'h9c))))));
          if (((8'ha6) ? $unsigned((|wire9[(3'h7):(3'h7)])) : wire7))
            begin
              reg12 <= $unsigned(wire8);
              reg13 <= $signed(wire9);
              reg14 <= $unsigned((^(&(reg13[(4'hb):(4'h8)] ?
                  $signed(wire10) : {wire5}))));
              reg15 <= $signed(reg11[(4'hb):(3'h6)]);
              reg16 <= (reg13 ?
                  reg12 : ((!reg15) << $signed({(wire9 ? reg13 : wire10)})));
            end
          else
            begin
              reg12 <= wire7;
              reg13 <= wire10[(5'h12):(1'h0)];
              reg14 <= wire6;
              reg15 <= $unsigned(($signed(reg13[(5'h10):(1'h1)]) >>> $unsigned($unsigned($signed(reg15)))));
            end
          if (wire5[(1'h1):(1'h0)])
            begin
              reg17 <= wire10[(4'h8):(2'h3)];
              reg18 <= $signed($signed({$signed((wire5 >= wire8))}));
              reg19 <= (reg14[(3'h5):(3'h4)] == {reg15});
            end
          else
            begin
              reg17 <= $signed(($unsigned(($signed((8'hae)) ?
                  reg19 : wire9[(3'h7):(2'h3)])) ^~ (~&$unsigned($signed(reg19)))));
              reg18 <= $signed(({$signed((~&reg17)), reg11[(1'h1):(1'h1)]} ?
                  $signed({wire5[(1'h1):(1'h0)], reg15}) : (8'hba)));
              reg19 <= $unsigned($signed(((wire5[(1'h0):(1'h0)] ?
                  $signed(wire10) : (|reg17)) && $signed({(8'hb7)}))));
              reg20 <= reg14[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg11 <= $unsigned({(|wire9[(3'h6):(2'h3)])});
          reg12 <= $unsigned((reg14[(2'h3):(2'h3)] ?
              (wire5[(3'h6):(3'h5)] != (&$unsigned(reg19))) : $unsigned((reg16 ?
                  (wire10 || (8'hbf)) : $unsigned((8'h9e))))));
          if ((wire9[(1'h0):(1'h0)] <= $signed(wire8[(1'h0):(1'h0)])))
            begin
              reg13 <= ($unsigned((reg20 << (~&(-reg11)))) ?
                  $signed(wire5[(1'h1):(1'h1)]) : (8'hbc));
              reg14 <= {((8'hac) ?
                      (~|((!wire9) ?
                          (reg20 ? wire9 : wire7) : reg17)) : reg13)};
              reg15 <= reg15;
            end
          else
            begin
              reg13 <= (reg13 ?
                  {{reg13[(2'h3):(2'h2)]}} : (wire8[(1'h0):(1'h0)] ^~ {((^(7'h40)) ?
                          {(8'hb0), reg17} : (wire6 ? reg19 : (8'hab))),
                      wire6}));
              reg14 <= $signed($signed(reg20[(5'h14):(1'h1)]));
              reg15 <= wire8[(1'h1):(1'h1)];
              reg16 <= wire5;
              reg17 <= (reg17[(3'h5):(1'h1)] > {(reg15[(4'h9):(4'h9)] ?
                      $signed($signed(reg14)) : $signed(reg13[(2'h2):(2'h2)]))});
            end
          reg18 <= $unsigned(wire9[(3'h6):(2'h3)]);
          reg19 <= (!$signed((~(7'h43))));
        end
    end
  assign wire21 = $signed(((reg15[(4'ha):(3'h5)] ?
                          $unsigned($signed((8'ha1))) : reg18[(4'hc):(3'h5)]) ?
                      ((^~(wire5 ~^ wire7)) ?
                          $unsigned((^reg11)) : ((-reg14) ?
                              (reg19 >= reg18) : ((8'ha9) > (7'h42)))) : reg15[(3'h5):(2'h2)]));
  assign wire22 = ({$signed(reg14[(2'h2):(2'h2)])} ?
                      (($signed(reg16) | ((reg18 ? (8'ha5) : reg18) * reg18)) ?
                          wire5 : ($signed((reg16 ?
                              (8'ha5) : reg19)) >= ((reg20 ? reg14 : reg17) ?
                              {reg15} : (!wire10)))) : (~|(~|((reg16 ?
                          (7'h42) : reg14) & $unsigned(wire9)))));
  assign wire23 = $unsigned(wire7[(3'h6):(1'h0)]);
endmodule
