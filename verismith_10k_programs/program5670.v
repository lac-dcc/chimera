module top
#(parameter param106 = ((-((~{(8'hbb), (8'hb6)}) * (&(8'ha8)))) == (^(8'h9e))), 
parameter param107 = (param106 && ((~((param106 ^~ param106) ? (param106 & param106) : (param106 && param106))) | (~&((8'hbf) ? param106 : (param106 > param106))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h225):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire84;
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire86,
                 wire4,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire84,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
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
                 reg5,
                 (1'h0)};
  assign wire4 = $signed(wire2);
  always
    @(posedge clk) begin
      reg5 <= (wire0[(3'h5):(2'h2)] ?
          (((wire1 ?
              $unsigned((7'h41)) : $unsigned(wire3)) || $unsigned($unsigned((8'hbd)))) <<< (!($signed(wire4) ?
              $unsigned(wire4) : {wire4}))) : ($signed(($unsigned(wire2) ?
              wire3[(4'he):(2'h3)] : (~^(7'h40)))) ~^ wire4[(3'h6):(3'h4)]));
    end
  assign wire6 = (^(wire3 ? $signed({reg5, (~^reg5)}) : wire4));
  assign wire7 = (((8'hb7) ?
                         wire3[(4'he):(4'h9)] : ((-((7'h42) ?
                             wire1 : wire4)) || $unsigned((reg5 <= wire3)))) ?
                     (~(((~reg5) ?
                             (wire6 ? wire2 : reg5) : reg5[(1'h1):(1'h0)]) ?
                         wire4[(3'h4):(2'h2)] : (reg5 ~^ wire0))) : $unsigned((wire2 >> (reg5[(1'h1):(1'h1)] & $signed(wire1)))));
  assign wire8 = (^(wire6 ?
                     (~($unsigned(wire1) ?
                         (!(8'hb4)) : (~^wire7))) : (~&wire3)));
  assign wire9 = wire7[(5'h10):(4'hd)];
  always
    @(posedge clk) begin
      if (((~wire8) && $signed((8'ha3))))
        begin
          reg10 <= wire4[(3'h6):(1'h1)];
        end
      else
        begin
          reg10 <= (reg5[(1'h1):(1'h1)] < $unsigned($signed(wire2[(3'h4):(1'h1)])));
        end
      if ($signed(($signed(((+wire7) ?
          ((8'hb8) >>> wire7) : $unsigned(reg10))) >= (~$unsigned($unsigned(wire1))))))
        begin
          reg11 <= wire9;
          reg12 <= (~(8'ha6));
          reg13 <= reg12;
        end
      else
        begin
          reg11 <= $unsigned(wire0[(3'h4):(2'h2)]);
          reg12 <= ((((reg12 == (&(8'hb4))) ?
                      reg13[(3'h4):(2'h2)] : $unsigned(wire7[(4'hb):(3'h7)])) ?
                  (|(reg5 ?
                      $unsigned((8'hb0)) : {(8'hb0)})) : ($signed((wire2 <<< reg11)) * (^~(^(8'ha4))))) ?
              {({wire9[(4'he):(3'h7)]} ?
                      (wire8[(5'h11):(1'h1)] <<< {wire6}) : reg5)} : (|(reg10[(1'h1):(1'h1)] ?
                  wire2 : reg12[(3'h6):(3'h6)])));
          reg13 <= wire8[(5'h12):(2'h2)];
          reg14 <= wire8;
        end
      reg15 <= reg12[(4'hb):(1'h1)];
      if (wire0)
        begin
          reg16 <= $signed(({$signed($signed(wire4))} ?
              $signed((&(wire4 ?
                  wire9 : reg5))) : (reg11[(1'h1):(1'h1)] && ($signed(wire9) ?
                  (wire3 != wire4) : wire6))));
          if ((|((({wire0, (8'ha9)} ? wire7 : $unsigned(wire3)) ?
              (wire2[(2'h2):(1'h1)] ^~ $unsigned(wire2)) : {(wire2 ?
                      wire9 : wire6),
                  $unsigned((8'h9d))}) | ({wire9} >> wire7))))
            begin
              reg17 <= $signed(reg13);
              reg18 <= $unsigned((~^{wire3, reg12}));
              reg19 <= $signed($unsigned({(&(reg14 ? wire6 : reg15))}));
              reg20 <= (reg15 ?
                  $unsigned(($signed((reg12 ? wire6 : reg10)) >= ({reg19,
                          reg15} ?
                      $signed(wire3) : (wire4 ?
                          wire2 : wire2)))) : ($signed(($unsigned(reg19) & (~^reg11))) != {(~reg17),
                      reg18[(3'h4):(3'h4)]}));
            end
          else
            begin
              reg17 <= $unsigned($unsigned($unsigned(({reg11,
                  wire9} * (8'ha7)))));
            end
          if (wire3)
            begin
              reg21 <= (wire1[(2'h2):(1'h0)] || reg14[(2'h3):(2'h3)]);
              reg22 <= reg21;
              reg23 <= wire9;
              reg24 <= {($unsigned(((reg12 != wire9) ?
                      (reg16 <= reg20) : (+(8'hb4)))) == reg10[(4'hb):(4'h9)]),
                  $unsigned($unsigned(wire6[(4'h8):(1'h1)]))};
            end
          else
            begin
              reg21 <= (wire4 ? reg16[(3'h7):(1'h1)] : reg22);
              reg22 <= $unsigned(((^~reg16) ?
                  $signed((~wire9[(5'h12):(4'ha)])) : $unsigned($signed($unsigned(reg15)))));
              reg23 <= reg19[(3'h5):(1'h0)];
            end
          reg25 <= reg11[(1'h0):(1'h0)];
        end
      else
        begin
          reg16 <= reg15;
          if ($signed($unsigned($unsigned((!{reg25})))))
            begin
              reg17 <= $signed($unsigned((~|reg20)));
            end
          else
            begin
              reg17 <= $signed($unsigned(($unsigned((wire0 ? reg19 : (8'hb3))) ?
                  reg5[(1'h1):(1'h0)] : wire6)));
              reg18 <= $unsigned(($unsigned(wire0) < ((wire7[(2'h3):(2'h2)] ^ (reg14 ?
                  (8'ha3) : wire0)) >= (~(8'hb9)))));
              reg19 <= reg11;
              reg20 <= $unsigned($unsigned(reg22[(5'h10):(2'h3)]));
            end
          reg21 <= $signed(((~(8'hbf)) ?
              wire0 : $signed(($signed(reg18) ?
                  $signed(reg14) : ((8'h9d) ? (8'ha4) : reg16)))));
        end
    end
  module26 #() modinst85 (.wire30(reg10), .wire27(wire8), .y(wire84), .wire31(reg25), .clk(clk), .wire28(wire9), .wire29(wire4));
  assign wire86 = (wire0[(3'h4):(2'h2)] ?
                      $unsigned(reg10) : (~^(((-reg14) ?
                          (reg24 <= reg5) : ((8'had) ?
                              wire8 : (8'ha7))) | $signed(reg12))));
  always
    @(posedge clk) begin
      reg87 <= wire9[(4'hf):(4'h8)];
      if (reg20[(2'h2):(1'h0)])
        begin
          reg88 <= {reg24[(4'hf):(4'hf)],
              ($unsigned($unsigned(((8'ha7) ? (8'hab) : reg87))) <<< reg11)};
          reg89 <= reg22[(2'h3):(1'h1)];
          reg90 <= reg16;
          reg91 <= ({reg22} ?
              reg22 : $signed({(7'h43), $signed((wire0 ? reg87 : reg20))}));
          if ($unsigned({(wire7 >>> $unsigned({(8'hb3)}))}))
            begin
              reg92 <= {({(((8'ha9) <= wire84) <= reg13),
                      wire4} && ((+$unsigned(reg19)) != $unsigned(reg15)))};
              reg93 <= {($unsigned((-{reg15})) <= reg16[(1'h1):(1'h0)])};
            end
          else
            begin
              reg92 <= $signed(wire84[(3'h4):(1'h1)]);
              reg93 <= $unsigned(((reg87[(3'h5):(3'h5)] ^ (&(+reg23))) ?
                  {reg18} : (^~reg11[(1'h1):(1'h0)])));
              reg94 <= reg15;
            end
        end
      else
        begin
          reg88 <= $signed({($signed(reg92[(3'h7):(2'h3)]) >> {{(8'hb3)},
                  (reg25 ^ reg24)})});
        end
      if (wire86)
        begin
          reg95 <= (~^reg5[(1'h0):(1'h0)]);
          reg96 <= $unsigned($signed((~|$unsigned((~^reg22)))));
        end
      else
        begin
          reg95 <= $unsigned(((~$signed($signed(wire4))) ?
              ($unsigned((reg92 ?
                  reg14 : wire86)) >> $unsigned(reg20[(3'h4):(2'h3)])) : (reg14 >>> reg23)));
          reg96 <= (&(!$unsigned($unsigned($unsigned(reg24)))));
        end
      if ($unsigned(wire2))
        begin
          reg97 <= $unsigned($signed($unsigned($signed(wire2))));
          reg98 <= reg18[(4'h8):(3'h7)];
          reg99 <= (-{$unsigned({{reg15}, wire86})});
          if ($unsigned((~|((~^$signed(reg21)) >= $signed(wire8)))))
            begin
              reg100 <= (|reg87);
              reg101 <= (~^(-(~&(reg13 ? (wire3 ? reg15 : wire7) : wire8))));
              reg102 <= (($signed((wire9[(3'h6):(3'h4)] ?
                          $signed((8'hb8)) : (&(8'hb2)))) ?
                      $unsigned(reg100[(3'h5):(3'h5)]) : reg14) ?
                  $signed(wire0[(3'h4):(3'h4)]) : ({reg98, reg99} ?
                      (^~(+reg90[(4'he):(1'h0)])) : reg91[(4'h9):(3'h7)]));
              reg103 <= reg95[(3'h6):(3'h6)];
              reg104 <= (reg5 - ((7'h42) != $signed((+(!reg11)))));
            end
          else
            begin
              reg100 <= $unsigned(reg14);
              reg101 <= ((({$signed(reg13)} >> ((wire2 + reg18) ?
                      ((8'ha2) <= wire3) : reg5[(1'h1):(1'h1)])) == ((^~(reg90 >= reg103)) << (^~(reg102 >> wire0)))) ?
                  $unsigned((~$signed($unsigned(reg99)))) : ($signed($signed((reg16 >= reg89))) >>> reg100[(5'h12):(1'h1)]));
              reg102 <= $unsigned((-(~|$unsigned((8'ha0)))));
            end
          reg105 <= (~|($unsigned(((+reg21) ?
              (reg5 ? reg99 : (8'hb1)) : (7'h44))) >> (-((~reg87) ?
              {reg14, reg103} : (reg94 ? wire8 : reg15)))));
        end
      else
        begin
          reg97 <= wire4;
          reg98 <= $signed(wire3);
          if (reg96[(3'h5):(2'h2)])
            begin
              reg99 <= $unsigned(reg20);
              reg100 <= reg100[(5'h10):(1'h0)];
              reg101 <= $signed((-reg20[(1'h0):(1'h0)]));
              reg102 <= reg97[(3'h6):(3'h4)];
            end
          else
            begin
              reg99 <= $signed((+($signed((8'h9c)) << $signed((~^reg15)))));
              reg100 <= reg98;
              reg101 <= (&wire8[(1'h1):(1'h1)]);
            end
        end
    end
endmodule

module module26
#(parameter param83 = {(~&(!{{(8'haa)}}))})
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire [(5'h11):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire43,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire32 = $signed(wire28[(3'h7):(3'h4)]);
  assign wire33 = $signed(wire27[(4'h8):(3'h6)]);
  assign wire34 = $signed(wire32);
  assign wire35 = $signed($unsigned($unsigned((-wire34[(4'hc):(2'h3)]))));
  always
    @(posedge clk) begin
      if ((($unsigned((~^(wire34 == wire27))) + $unsigned($signed($signed(wire31)))) ?
          ($unsigned($signed((&wire29))) >> ((~^wire33) <= $unsigned($signed(wire32)))) : wire29[(4'hc):(3'h6)]))
        begin
          reg36 <= $unsigned({({(wire34 ? wire32 : wire31), $signed(wire28)} ?
                  $unsigned((8'hb1)) : $signed((wire35 == wire28)))});
          reg37 <= $unsigned($unsigned($signed({$unsigned(wire29),
              (reg36 ~^ wire29)})));
          reg38 <= wire31;
          reg39 <= wire32[(3'h7):(3'h7)];
        end
      else
        begin
          if (reg39)
            begin
              reg36 <= ((~&$unsigned(((~&reg38) ^~ (wire28 ?
                  wire31 : wire30)))) | wire28);
              reg37 <= {((~((wire35 << wire35) ?
                      ((8'hb4) * wire35) : (wire28 | wire30))) >= $signed(wire29[(4'hd):(4'h9)]))};
            end
          else
            begin
              reg36 <= (wire32 >= wire35[(3'h7):(2'h3)]);
              reg37 <= (wire29[(4'hc):(2'h3)] >> wire29);
              reg38 <= reg38[(3'h5):(1'h0)];
            end
          reg39 <= ($unsigned(($unsigned((wire32 - wire29)) ?
                  wire30[(3'h5):(1'h0)] : $signed((~|(8'ha2))))) ?
              wire34[(3'h4):(2'h3)] : (wire35 << ($unsigned(wire33) ?
                  (wire35[(4'h9):(3'h4)] ?
                      wire34[(4'h8):(3'h6)] : wire35) : $unsigned((wire32 >>> reg37)))));
          reg40 <= wire33;
          reg41 <= (wire33[(3'h6):(3'h5)] ?
              ($signed((~|((8'hb6) ?
                  (8'hb4) : wire28))) ^ $signed((^~(^~wire31)))) : (wire34[(4'hc):(4'h9)] ?
                  wire33 : reg36));
        end
      reg42 <= (8'ha1);
    end
  assign wire43 = $signed($signed((((wire28 ? (8'ha2) : reg36) ?
                      $signed(wire33) : $unsigned(wire27)) << (&$signed(wire30)))));
  module44 #() modinst79 (.wire47(wire35), .wire48(wire32), .clk(clk), .wire46(wire34), .y(wire78), .wire45(wire29));
  assign wire80 = reg42[(4'hc):(3'h5)];
  assign wire81 = $unsigned(wire34[(1'h0):(1'h0)]);
  assign wire82 = $signed((8'hb9));
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire signed [(4'he):(1'h0)] wire46;
  input wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire61,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire49 = ((!$unsigned(wire48[(2'h2):(2'h2)])) ?
                      (|wire47[(5'h13):(2'h3)]) : wire48);
  assign wire50 = (wire49[(3'h6):(2'h3)] ?
                      ($unsigned($signed($unsigned(wire49))) ?
                          wire47 : (wire47 <= wire46[(3'h6):(2'h3)])) : wire46[(4'hc):(2'h3)]);
  assign wire51 = (($unsigned((wire49 <= $unsigned(wire49))) ?
                          wire45 : (8'hba)) ?
                      wire50 : ({{{wire46, wire46}, $signed(wire49)},
                          $signed((8'ha1))} || (((~wire49) ?
                          (wire50 <= wire46) : wire49) | wire45[(4'h8):(4'h8)])));
  assign wire52 = (~($unsigned(wire51) ?
                      ((8'ha7) < ((!wire46) ?
                          (~^(8'hac)) : wire47)) : $unsigned(wire45[(3'h7):(2'h3)])));
  assign wire53 = ($unsigned($unsigned(wire50)) ^~ (^wire45[(4'ha):(2'h3)]));
  assign wire54 = $unsigned($unsigned({(-(wire50 >= wire49)),
                      (^(wire51 & wire48))}));
  assign wire55 = (^~{wire49[(3'h6):(1'h0)]});
  always
    @(posedge clk) begin
      reg56 <= {wire50};
      reg57 <= wire53[(3'h5):(1'h0)];
      reg58 <= wire52[(1'h0):(1'h0)];
      reg59 <= (((wire46[(4'hc):(4'hc)] <= {$signed(reg56),
              (^reg56)}) & wire52) ?
          $unsigned((wire53 >> wire51)) : (($signed(wire46) ?
                  ($signed(wire45) == $unsigned(wire50)) : {(wire49 & (8'ha5)),
                      $signed((8'hae))}) ?
              (7'h40) : wire51[(3'h6):(3'h4)]));
      reg60 <= ($signed((($signed(wire54) ?
          (wire53 == (8'hbe)) : reg57[(1'h1):(1'h1)]) + $signed((~|wire50)))) || $unsigned(({(wire55 ?
                  (8'hb5) : wire48)} ?
          (-$signed(wire51)) : (wire45 >= (8'hae)))));
    end
  assign wire61 = (reg60[(3'h6):(2'h2)] ?
                      ($signed($unsigned((wire52 << (8'ha9)))) >>> $signed(wire52)) : $unsigned({$unsigned(wire48[(1'h1):(1'h1)]),
                          $signed(wire45[(1'h1):(1'h0)])}));
  always
    @(posedge clk) begin
      reg62 <= $unsigned(reg59[(4'h9):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg63 <= (7'h42);
      reg64 <= {($signed((+$unsigned(reg58))) ?
              (($unsigned(wire61) ~^ (wire47 ^~ reg63)) ?
                  reg57 : ((wire45 ? wire49 : wire52) ?
                      $unsigned(wire46) : reg58)) : ($signed((reg60 * (8'ha3))) | $signed((wire50 ?
                  reg60 : reg62))))};
      if (reg63)
        begin
          reg65 <= $unsigned((8'hb4));
          reg66 <= $signed(reg58[(4'hf):(4'h9)]);
          reg67 <= {$signed(($signed(((8'h9c) ?
                  (8'ha6) : reg58)) - ($signed(reg65) <= $unsigned(reg62))))};
          reg68 <= $signed({(~&((-(8'hb2)) ? (8'hb1) : {wire53, (8'hbc)})),
              $signed($signed($signed(wire54)))});
        end
      else
        begin
          reg65 <= wire47[(3'h6):(3'h5)];
          reg66 <= wire61;
          if ($signed($signed((8'haf))))
            begin
              reg67 <= reg66;
              reg68 <= wire47[(3'h4):(3'h4)];
              reg69 <= ({$unsigned((wire45[(3'h4):(3'h4)] << wire48[(1'h1):(1'h0)])),
                  wire54} < ((~|wire55[(2'h3):(2'h2)]) ?
                  (~^$signed($unsigned((8'hb6)))) : $unsigned($signed(wire49))));
              reg70 <= wire45[(2'h3):(1'h0)];
            end
          else
            begin
              reg67 <= {$signed(((|(&wire46)) ?
                      (reg57[(2'h2):(2'h2)] ? reg64 : wire53) : reg66)),
                  $unsigned(wire49[(3'h5):(3'h5)])};
              reg68 <= wire54[(2'h2):(1'h1)];
              reg69 <= $unsigned((~&(wire54[(2'h2):(1'h0)] ?
                  $unsigned($signed(wire50)) : wire52)));
            end
          if ($unsigned($unsigned(reg68[(2'h3):(1'h0)])))
            begin
              reg71 <= (^~$signed((((~|wire49) * (+reg60)) ?
                  $unsigned($unsigned(reg67)) : wire45[(3'h6):(3'h6)])));
              reg72 <= $unsigned({reg58[(1'h0):(1'h0)], {wire46}});
            end
          else
            begin
              reg71 <= (~|reg63);
              reg72 <= $unsigned($signed($unsigned({reg57})));
              reg73 <= (~^((~^$unsigned((~^reg60))) < reg67[(1'h0):(1'h0)]));
              reg74 <= wire61;
            end
          reg75 <= $unsigned($unsigned($unsigned((reg59 >> (8'ha9)))));
        end
    end
  assign wire76 = $unsigned((reg64 <= {wire48[(2'h2):(2'h2)], wire50}));
  assign wire77 = (~wire52);
endmodule
