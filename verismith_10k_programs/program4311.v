module top
#(parameter param95 = (~|(8'hb0)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire80;
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire82,
                 wire80,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg4,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (-($unsigned($signed((~^wire3))) ?
          {((wire1 ? wire3 : wire1) ?
                  wire3[(5'h10):(2'h2)] : wire0[(4'hb):(4'h9)]),
              wire2[(4'hf):(3'h4)]} : (((wire1 > wire2) ?
              {wire2} : $signed(wire1)) || {(8'hb3), ((8'hb7) ^ wire1)})));
      reg5 <= (($unsigned((8'ha0)) & (($signed(wire2) ?
          {wire2} : wire2[(3'h6):(3'h4)]) <<< (~&(wire0 ?
          wire3 : wire2)))) <= (~|(-reg4)));
    end
  module6 #() modinst81 (wire80, clk, wire1, wire3, reg4, wire2);
  assign wire82 = reg4[(4'hc):(4'hc)];
  always
    @(posedge clk) begin
      if ($unsigned(wire0[(4'hb):(4'ha)]))
        begin
          if ((~wire1[(3'h7):(1'h0)]))
            begin
              reg83 <= (~$signed(((~^wire0) ?
                  {(8'ha3), $signed(reg4)} : $signed(wire82[(3'h4):(2'h3)]))));
            end
          else
            begin
              reg83 <= $unsigned(({reg5[(3'h4):(2'h2)]} & $unsigned(wire0)));
              reg84 <= {wire1};
              reg85 <= (~|(|((~|wire82) ?
                  $unsigned($unsigned(wire0)) : ((~&reg5) > (reg84 * reg83)))));
              reg86 <= {(^~wire82),
                  ($unsigned(({reg83,
                      wire2} ^ wire1[(3'h4):(1'h1)])) - $unsigned(((wire0 <= wire0) >> wire2)))};
            end
          reg87 <= (8'hba);
          reg88 <= (($signed($unsigned((+wire2))) + (reg83[(2'h3):(1'h0)] <<< {(reg86 ?
                      wire0 : reg5),
                  reg87})) ?
              (~|reg85) : {(($signed(wire82) ^~ (wire1 ?
                      (8'hb6) : reg4)) ~^ ((reg84 ? reg85 : reg87) * {reg4})),
                  reg84[(5'h10):(1'h0)]});
        end
      else
        begin
          reg83 <= {(&reg83[(2'h2):(2'h2)])};
        end
      reg89 <= {{(reg88[(3'h7):(1'h1)] + reg5)}};
      reg90 <= wire82[(1'h1):(1'h0)];
      reg91 <= ((((reg89[(4'h9):(4'h8)] - (reg83 ? reg87 : reg90)) ?
          ({reg86} + $unsigned(wire80)) : ($signed((8'hbc)) ?
              {reg83} : (wire3 == (8'ha5)))) + (-$signed($signed(reg85)))) * (((^~$unsigned(reg84)) ^~ wire82) >>> wire82[(2'h2):(1'h1)]));
      reg92 <= (~&$unsigned(wire82));
    end
  assign wire93 = {(reg91 <= (reg5[(4'h8):(3'h5)] ^~ $signed({reg90}))),
                      ({((reg87 ? reg92 : wire3) ?
                              $unsigned(wire82) : wire2[(4'hb):(1'h0)])} <= (^{{wire80},
                          $signed(reg83)}))};
  assign wire94 = {reg5[(2'h3):(2'h3)],
                      (($signed(reg83[(4'h9):(2'h3)]) ?
                          $signed({wire93}) : wire1) - reg91)};
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire78;
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  assign y = {wire48,
                 wire23,
                 wire22,
                 wire21,
                 wire50,
                 wire51,
                 wire52,
                 wire78,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed(wire8[(3'h4):(1'h0)]) && (-wire10[(1'h1):(1'h0)])))
        begin
          if ((~($signed($unsigned(wire10)) && wire7)))
            begin
              reg11 <= $unsigned($unsigned((((wire9 < (8'hb7)) >= (wire7 ?
                      wire9 : (7'h41))) ?
                  ($signed(wire8) ^ (wire7 ?
                      wire9 : wire8)) : wire8[(4'hb):(3'h6)])));
              reg12 <= ($signed((~|wire7[(3'h5):(3'h4)])) == {($signed((wire8 ?
                          reg11 : (8'ha9))) ?
                      wire7 : wire9)});
            end
          else
            begin
              reg11 <= (~^$unsigned($signed(wire8[(5'h13):(4'hc)])));
              reg12 <= $unsigned($unsigned($unsigned((~|$signed(wire9)))));
              reg13 <= $signed(wire10[(2'h3):(1'h1)]);
            end
        end
      else
        begin
          reg11 <= wire8[(4'hd):(4'hd)];
          if (wire8[(4'hd):(2'h2)])
            begin
              reg12 <= {$unsigned($unsigned(reg13))};
              reg13 <= $unsigned($unsigned($signed(({reg12} ^ wire7[(3'h7):(3'h5)]))));
              reg14 <= reg11;
              reg15 <= wire9[(3'h6):(3'h6)];
            end
          else
            begin
              reg12 <= $unsigned(wire9[(3'h5):(2'h3)]);
              reg13 <= reg14[(4'h9):(1'h1)];
            end
          reg16 <= $signed($signed(wire9[(4'hc):(4'h9)]));
          reg17 <= reg15;
        end
      reg18 <= reg14;
      reg19 <= reg15;
      reg20 <= ((^$signed($unsigned($signed(wire9)))) ?
          (^~$unsigned($unsigned((~^reg11)))) : wire9[(4'hf):(4'h8)]);
    end
  assign wire21 = wire7[(1'h1):(1'h0)];
  assign wire22 = $unsigned(((-reg13[(3'h4):(2'h3)]) >= wire21[(4'h9):(1'h0)]));
  assign wire23 = ({wire8,
                      ((^~(wire8 ?
                          wire8 : wire8)) ~^ reg12)} > ($signed(((|reg11) ?
                          wire9[(4'hc):(4'h8)] : (wire8 >> reg16))) ?
                      ({(wire7 == reg15),
                          (wire22 ?
                              wire9 : wire9)} ^ $signed($unsigned((8'hb6)))) : $signed((+wire9))));
  module24 #() modinst49 (.wire26(wire22), .wire25(wire7), .y(wire48), .wire28(reg20), .wire27(wire21), .clk(clk));
  assign wire50 = reg17;
  assign wire51 = (&$unsigned(reg14[(4'h9):(4'h8)]));
  assign wire52 = reg13;
  module53 #() modinst79 (.clk(clk), .wire55(reg11), .wire57(reg14), .wire58(reg16), .y(wire78), .wire56(reg18), .wire54(wire23));
endmodule

module module53
#(parameter param77 = ((|(({(8'haa), (8'hbb)} < {(8'ha9), (8'ha5)}) || (((8'hb5) != (8'hbd)) ^ ((8'haf) ? (8'hae) : (8'hac))))) - (({(|(8'hb1))} < (((8'h9c) || (8'ha1)) ? (|(8'ha1)) : ((8'haa) | (8'ha2)))) ? ({{(8'hbe), (8'hbd)}, (^~(8'h9e))} ? (((8'hbe) ^~ (8'had)) ~^ ((8'hb7) ? (8'ha5) : (8'hae))) : {((8'had) ? (8'hb2) : (8'haf)), (&(8'hb5))}) : {({(8'hbf), (8'hbd)} ? ((8'hbe) ? (8'hb2) : (8'hb8)) : (~|(7'h41))), (~^(|(8'hb8)))})))
(y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire58;
  input wire signed [(5'h10):(1'h0)] wire57;
  input wire [(4'ha):(1'h0)] wire56;
  input wire signed [(3'h7):(1'h0)] wire55;
  input wire signed [(3'h5):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire59;
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire59 = wire54[(1'h1):(1'h0)];
  assign wire60 = $unsigned({(((8'hbd) && wire57) ?
                          ((^~wire58) && (wire56 ?
                              wire58 : wire56)) : $unsigned(((8'hae) ?
                              wire57 : wire54))),
                      wire54});
  assign wire61 = wire56;
  assign wire62 = (((+(~&wire59[(4'h8):(4'h8)])) >= wire54) ~^ wire61);
  assign wire63 = $unsigned(((!wire61[(5'h10):(4'hf)]) ?
                      (wire55[(1'h0):(1'h0)] | wire61[(4'ha):(3'h5)]) : wire57[(3'h7):(1'h1)]));
  assign wire64 = $signed((^{((wire56 < wire63) ?
                          wire59[(2'h3):(2'h3)] : $signed(wire60))}));
  assign wire65 = wire63[(3'h6):(3'h6)];
  assign wire66 = {(wire54[(3'h4):(1'h1)] <<< (|wire63)), (&wire63)};
  assign wire67 = (~wire60[(2'h2):(1'h1)]);
  assign wire68 = (&wire64[(2'h2):(1'h0)]);
  assign wire69 = $signed(wire60);
  assign wire70 = ($signed((wire63 >= (|$signed(wire68)))) <<< (~&(((~^wire59) ?
                          (wire60 > wire65) : $unsigned(wire61)) ?
                      wire59 : (wire61[(4'h8):(1'h1)] ~^ $signed(wire58)))));
  assign wire71 = (~|(~|(wire57[(3'h7):(3'h5)] ?
                      $unsigned((wire61 ? wire63 : wire57)) : wire56)));
  always
    @(posedge clk) begin
      reg72 <= wire56[(3'h7):(3'h5)];
      reg73 <= ((($signed({wire63}) >= wire66[(3'h4):(2'h2)]) ?
          (8'hb3) : ((8'hb9) ?
              (wire61 <= wire64) : wire55[(3'h5):(1'h1)])) > ((^~((reg72 && wire61) == {wire60,
          reg72})) != wire68[(4'hb):(3'h4)]));
      reg74 <= reg72[(3'h7):(1'h1)];
      reg75 <= (($signed($unsigned((wire64 ? wire70 : reg72))) ?
          ({wire67} ?
              wire69 : wire71) : $unsigned((|$unsigned((8'hba))))) == ($signed($unsigned((reg74 ?
              wire64 : reg73))) ?
          (($unsigned(wire62) && wire56[(2'h3):(1'h1)]) <<< (~|(wire64 ?
              wire62 : wire61))) : ($unsigned(wire69) ~^ ($unsigned(wire62) || $signed(wire61)))));
      reg76 <= wire69[(4'ha):(4'h8)];
    end
endmodule

module module24  (y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire28;
  input wire [(5'h11):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire26;
  input wire signed [(4'h8):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
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
  assign wire29 = ($signed((^~{((8'hb6) ? wire25 : (8'ha3)),
                      (wire26 ? wire25 : wire28)})) && wire26);
  assign wire30 = $unsigned(wire28);
  assign wire31 = (8'ha6);
  assign wire32 = (-$unsigned((&($unsigned((8'hb6)) ?
                      (wire31 != wire29) : $signed((8'hb0))))));
  assign wire33 = $signed($unsigned($unsigned(($signed((8'hbb)) ?
                      wire26 : wire26))));
  assign wire34 = {($unsigned(wire27[(5'h11):(4'hc)]) || $signed($signed(((8'h9c) ?
                          wire27 : wire25))))};
  assign wire35 = (|$signed($signed(((-wire31) < $signed(wire28)))));
  assign wire36 = ((+$signed((~&wire28))) + (wire35[(3'h6):(2'h3)] > $signed(((wire35 ?
                          (8'ha1) : wire35) ?
                      (wire30 > wire29) : wire35[(3'h5):(3'h5)]))));
  always
    @(posedge clk) begin
      reg37 <= wire26[(4'h8):(3'h5)];
      if ({($unsigned(((8'hab) - reg37)) >= wire36[(2'h2):(2'h2)])})
        begin
          reg38 <= $unsigned({wire28[(5'h13):(1'h0)],
              $signed(wire35[(3'h4):(2'h3)])});
          reg39 <= wire36;
        end
      else
        begin
          reg38 <= $unsigned((~^$signed((wire30[(3'h7):(1'h0)] ?
              ((8'hb0) || wire29) : $unsigned(wire36)))));
          reg39 <= (!(-($signed((+wire31)) ?
              ($signed(wire29) > ((8'hbf) ^~ wire28)) : (~&(wire25 ?
                  reg39 : wire26)))));
          reg40 <= wire35[(2'h3):(2'h3)];
          reg41 <= ((($unsigned((wire33 != reg39)) ?
              (wire31 ~^ (wire27 ? wire27 : wire25)) : (wire30[(4'h9):(4'h9)] ?
                  wire32[(2'h3):(2'h2)] : (!wire32))) < wire27) >= ($signed(wire36) & $unsigned(({wire32,
                  reg38} ?
              reg39 : wire29[(1'h0):(1'h0)]))));
        end
      reg42 <= (reg37 ?
          {(~&wire30),
              ((wire35[(4'h8):(1'h1)] + (wire25 >= (8'hb7))) * (wire35 ?
                  (~|wire30) : $unsigned(wire25)))} : (~|((|(&wire31)) ?
              wire28 : $signed((wire25 ? wire31 : wire30)))));
      reg43 <= reg38[(1'h1):(1'h0)];
      reg44 <= (reg40 > ($signed($unsigned($unsigned(reg37))) ?
          (&{((8'ha5) ? reg43 : wire25), (reg42 < wire31)}) : (~{(~&wire30),
              $signed(reg39)})));
    end
  always
    @(posedge clk) begin
      reg45 <= ((8'had) ?
          (~$unsigned((reg43 + (reg43 ?
              wire25 : wire31)))) : (&(((reg40 ^~ wire30) <= $signed(reg42)) || {(~^reg41),
              (~^wire28)})));
      reg46 <= wire25;
      reg47 <= ({$unsigned((^~(reg42 ? reg38 : wire34))),
              ((^$unsigned(reg37)) ?
                  (wire32[(3'h7):(3'h4)] ?
                      {wire31} : {reg38, wire33}) : (^~(8'hbd)))} ?
          ((8'h9d) < wire28) : {(~|$unsigned($unsigned(reg46)))});
    end
endmodule
