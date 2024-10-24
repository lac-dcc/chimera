module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire74;
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire76,
                 wire74,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  module5 #() modinst75 (.y(wire74), .wire7(wire3), .wire9(wire2), .clk(clk), .wire6(wire1), .wire8(wire4));
  assign wire76 = $unsigned(($unsigned((!(wire3 ?
                      wire2 : wire74))) - wire4[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire74)
        begin
          reg77 <= (wire1 >>> ({(|{(8'hab), wire1})} + wire4[(4'hc):(4'hb)]));
          reg78 <= ($signed(wire4[(4'he):(4'ha)]) ?
              ((^$unsigned({(8'ha5)})) ?
                  {wire4[(2'h2):(2'h2)]} : $unsigned(($signed((8'ha8)) << ((8'ha1) ?
                      wire3 : wire2)))) : $signed({wire76}));
          if ((-(8'h9c)))
            begin
              reg79 <= $signed($unsigned(wire74));
              reg80 <= $unsigned($unsigned((((8'hbc) ? wire2 : {wire0}) ?
                  wire1 : $signed((8'hb3)))));
            end
          else
            begin
              reg79 <= (8'hb6);
              reg80 <= (reg79[(4'h8):(4'h8)] ?
                  (^$signed((^~$unsigned(wire4)))) : ((&reg77) ?
                      $signed(wire74[(4'hd):(4'h9)]) : $signed(wire3)));
              reg81 <= $unsigned(reg79[(3'h4):(2'h3)]);
              reg82 <= $signed((~^wire76[(1'h0):(1'h0)]));
              reg83 <= reg80;
            end
          reg84 <= $signed({($unsigned((^~wire74)) ?
                  (reg79 < wire4[(4'hf):(2'h3)]) : wire3[(1'h1):(1'h1)])});
          if (wire74[(4'h9):(4'h9)])
            begin
              reg85 <= reg78;
              reg86 <= $signed(wire3);
            end
          else
            begin
              reg85 <= $unsigned($signed((^~wire2)));
              reg86 <= reg78;
              reg87 <= reg80;
              reg88 <= ((&$signed(($unsigned(reg84) ?
                      (~|reg84) : $unsigned(wire1)))) ?
                  reg77[(3'h4):(2'h2)] : reg85);
            end
        end
      else
        begin
          if ((($unsigned(((reg78 ? reg86 : reg80) || (wire74 + reg78))) ?
              reg83 : (~|$unsigned((wire3 ? (8'h9f) : reg87)))) >> wire1))
            begin
              reg77 <= wire76;
              reg78 <= (wire74 ~^ wire74);
            end
          else
            begin
              reg77 <= (8'hbf);
            end
          if (reg83)
            begin
              reg79 <= $unsigned(((|(~^$signed(reg84))) ?
                  $unsigned($unsigned(wire1[(3'h7):(2'h3)])) : (^~(~&(reg87 ?
                      reg82 : reg86)))));
            end
          else
            begin
              reg79 <= wire1[(2'h3):(1'h1)];
            end
          reg80 <= (({wire74} + reg84) ?
              ($unsigned(((reg81 ? reg82 : reg78) ?
                      (wire1 ^ reg83) : (wire74 ? reg88 : reg78))) ?
                  (&reg84[(3'h4):(2'h3)]) : wire3[(2'h2):(1'h0)]) : $signed($signed({(wire1 ?
                      wire74 : wire2),
                  (reg88 ? wire0 : reg83)})));
          if ({$unsigned((!(~&$unsigned(reg87))))})
            begin
              reg81 <= (({(~|(!reg84))} + $signed(reg85[(2'h3):(1'h1)])) ?
                  ((($unsigned(wire74) ? (8'h9d) : reg84[(3'h7):(1'h1)]) ?
                      wire3[(4'he):(1'h0)] : reg85[(1'h1):(1'h1)]) * ((~$signed(wire0)) != wire74)) : reg82);
              reg82 <= $unsigned($unsigned(wire76[(2'h2):(1'h1)]));
              reg83 <= reg87[(4'hc):(3'h7)];
              reg84 <= (-$unsigned((($signed((8'hb6)) << $unsigned(wire1)) ?
                  (^~wire0[(4'hc):(4'h9)]) : (reg84 ? {wire2} : reg87))));
              reg85 <= $signed(((^(8'hb2)) ~^ reg85));
            end
          else
            begin
              reg81 <= ((reg86[(3'h7):(1'h0)] ?
                      wire0 : (reg86 & ((reg85 ?
                          reg83 : wire0) >>> (|(7'h43))))) ?
                  {reg83[(4'hb):(4'ha)]} : (reg86 ?
                      (~$unsigned($unsigned(reg84))) : (((reg86 ?
                              reg86 : wire0) * wire74[(5'h11):(4'h9)]) ?
                          (8'ha8) : ($unsigned(wire2) & reg81))));
            end
        end
      reg89 <= wire4[(3'h7):(1'h1)];
      reg90 <= reg78;
    end
  assign wire91 = {(~^(($signed(reg88) + (reg80 ? (8'hb7) : wire4)) ?
                          reg84[(3'h6):(3'h6)] : (+reg80)))};
  assign wire92 = wire4;
  assign wire93 = $signed($signed(($signed(reg81[(4'hd):(1'h0)]) == wire74[(3'h6):(3'h6)])));
endmodule

module module5
#(parameter param72 = (~|(^(~&((+(8'hb3)) | ((8'ha2) + (8'h9e)))))), 
parameter param73 = (((^(param72 >> param72)) * ((-(&param72)) <<< (param72 ? (8'ha6) : {param72}))) && param72))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire56,
                 wire20,
                 wire11,
                 wire10,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = wire9;
  assign wire11 = wire7;
  always
    @(posedge clk) begin
      if ((8'haa))
        begin
          if (wire6)
            begin
              reg12 <= wire9;
              reg13 <= $unsigned($signed(wire10[(3'h4):(3'h4)]));
              reg14 <= {({wire7[(4'h8):(1'h1)]} - (~wire10))};
            end
          else
            begin
              reg12 <= $signed((((!(!wire10)) ?
                  (^~(~&wire8)) : (reg12[(3'h4):(1'h0)] ?
                      (wire7 == reg12) : (reg14 ?
                          wire9 : reg13))) ^~ ($signed($signed(reg13)) << wire9[(4'h8):(3'h5)])));
              reg13 <= (wire11[(4'h8):(1'h0)] ?
                  (((8'hbf) + wire11) ?
                      wire11 : {wire7[(5'h12):(3'h7)],
                          wire9[(4'h9):(3'h6)]}) : reg12);
              reg14 <= (($signed({$signed(wire9)}) ?
                  (|(~|$unsigned(wire10))) : $unsigned(($signed((8'haf)) >>> reg12))) ^ reg14[(3'h7):(3'h7)]);
              reg15 <= $signed((reg12 <= wire11[(3'h4):(1'h1)]));
              reg16 <= {wire6,
                  ({$unsigned((wire10 ^ wire7))} && (+(~&(wire8 ?
                      (8'ha5) : reg15))))};
            end
          reg17 <= ((7'h43) ?
              (reg15 ?
                  ((~|(^(8'ha1))) ?
                      $unsigned($signed((7'h43))) : $signed((wire10 || wire7))) : reg14[(2'h2):(2'h2)]) : $signed(((~^$unsigned(reg15)) ?
                  $signed((^~wire7)) : $unsigned(((8'h9c) | wire10)))));
          reg18 <= $signed((-(|((wire11 || reg14) ?
              (wire7 && reg17) : reg13[(2'h2):(1'h0)]))));
          reg19 <= $unsigned($unsigned(reg13[(2'h2):(1'h0)]));
        end
      else
        begin
          reg12 <= (+(~(($signed(reg12) | $unsigned(wire6)) ?
              $signed(wire8[(1'h0):(1'h0)]) : wire6[(1'h1):(1'h1)])));
          reg13 <= {$unsigned($unsigned(reg13)),
              (reg14 ?
                  $unsigned($unsigned($signed((8'hab)))) : reg17[(1'h0):(1'h0)])};
          reg14 <= wire11;
          reg15 <= wire6;
        end
    end
  assign wire20 = reg16;
  module21 #() modinst57 (.wire24(wire9), .clk(clk), .wire22(wire6), .wire23(wire8), .y(wire56), .wire25(wire10));
  always
    @(posedge clk) begin
      if ({(|$unsigned(wire7))})
        begin
          reg58 <= wire8;
          reg59 <= {$signed($signed($signed((reg17 ? wire8 : wire9)))),
              $signed(($unsigned((reg19 >= reg15)) ?
                  ($unsigned(wire10) ?
                      (8'hab) : reg15[(2'h2):(1'h1)]) : wire8))};
          reg60 <= ((($signed(reg15) + $unsigned($unsigned(wire8))) ?
              wire10 : reg16) >> (~$unsigned(($signed((8'ha7)) ?
              $unsigned(wire8) : $signed(wire20)))));
          reg61 <= $signed(reg12[(2'h2):(1'h0)]);
        end
      else
        begin
          reg58 <= reg60;
          reg59 <= (8'hb4);
          reg60 <= (!((reg60[(1'h1):(1'h1)] ?
              $signed(((8'hb6) + wire11)) : reg14[(3'h4):(3'h4)]) - reg60));
        end
      reg62 <= reg18;
      reg63 <= (|$signed($signed($unsigned($unsigned(reg13)))));
      if (reg61)
        begin
          reg64 <= $signed(wire9);
          reg65 <= (wire20[(3'h6):(3'h6)] ?
              $unsigned((|(reg17 ^~ $unsigned(reg62)))) : (!reg63[(2'h2):(1'h0)]));
        end
      else
        begin
          reg64 <= wire10;
          if ((^~(&$unsigned(reg61[(4'he):(3'h5)]))))
            begin
              reg65 <= (((($signed(wire9) ?
                      ((8'hbf) ? wire10 : reg18) : $unsigned(reg64)) + {wire9,
                      $signed(wire11)}) ^ $unsigned({{wire9, wire8}})) ?
                  ((wire6[(4'h9):(1'h0)] ?
                      wire11 : ((wire7 - reg62) & (~&(8'hba)))) - $signed((-wire11))) : ($unsigned(((8'had) > reg65[(3'h5):(3'h4)])) ^~ ($signed((reg18 << wire9)) ?
                      ((reg19 ? reg15 : wire10) ?
                          (8'haf) : $signed((8'hb7))) : reg14[(2'h2):(1'h1)])));
              reg66 <= $unsigned(reg61[(3'h4):(2'h3)]);
              reg67 <= {(~^$signed((reg64 ?
                      (wire6 ? reg19 : reg65) : (reg62 ? (8'h9f) : wire9))))};
            end
          else
            begin
              reg65 <= $unsigned($unsigned((~|reg19)));
              reg66 <= {$signed((wire8 ?
                      wire6[(3'h5):(2'h3)] : (wire56[(3'h6):(3'h5)] ?
                          reg16 : $unsigned(wire56))))};
            end
          reg68 <= reg67;
        end
    end
  assign wire69 = wire6[(4'h9):(1'h1)];
  assign wire70 = $signed((+(({(8'hb7), wire69} * reg18[(3'h4):(2'h3)]) ?
                      reg19[(1'h1):(1'h1)] : (reg65 & (reg59 >>> (7'h44))))));
  assign wire71 = $unsigned((reg12[(2'h2):(1'h1)] ?
                      wire7[(3'h6):(1'h1)] : {(reg63 ?
                              reg13[(4'h9):(3'h6)] : reg67)}));
endmodule

module module21
#(parameter param55 = ((-(+{((8'hae) << (8'hac))})) ? ((&((~&(7'h40)) ? ((8'hbc) & (8'ha8)) : (7'h43))) ? ((((8'hb7) ? (8'hb3) : (8'hac)) ? ((8'hbf) ? (8'ha4) : (8'h9f)) : ((8'hb8) ? (8'hb8) : (8'h9c))) ? (((8'ha4) ? (8'hb6) : (8'hac)) ? ((8'ha8) && (8'ha8)) : (|(8'hb2))) : ((&(8'h9d)) >> ((8'ha6) ? (8'h9f) : (7'h40)))) : (^~{(8'ha7), (8'hbb)})) : (((((8'hb3) >> (7'h43)) >> ((8'h9e) ? (8'ha2) : (8'hb7))) >>> (!(!(8'ha9)))) ? {(((8'h9e) ? (8'hb1) : (8'ha5)) ~^ (8'hb7))} : ((((7'h44) ? (8'ha7) : (8'hab)) != ((8'hbf) && (8'hab))) && (((8'h9c) ? (8'hb4) : (8'h9d)) ? (-(8'hbc)) : ((8'hb6) ? (8'hbf) : (8'ha4)))))))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire [(3'h6):(1'h0)] wire23;
  input wire [(4'ha):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg29,
                 (1'h0)};
  assign wire26 = $signed((8'hab));
  assign wire27 = {(~$signed($unsigned({wire25})))};
  assign wire28 = ((&wire23) ? wire24[(3'h4):(3'h4)] : wire27[(5'h12):(1'h0)]);
  always
    @(posedge clk) begin
      reg29 <= $signed({$unsigned($unsigned($unsigned((8'hb7)))),
          $signed(({wire28} ^ {wire25, wire22}))});
    end
  assign wire30 = (wire24[(3'h5):(2'h3)] | (~|wire24));
  assign wire31 = {($unsigned({(wire30 << wire25)}) != wire24),
                      wire24[(5'h10):(2'h3)]};
  assign wire32 = ((~|(~|$signed(((8'ha6) == wire22)))) ?
                      $signed($unsigned(($signed(wire24) ?
                          (wire28 ~^ reg29) : wire26))) : {{((wire28 + (8'hb7)) > (reg29 * wire22)),
                              (reg29[(1'h0):(1'h0)] ~^ wire30[(4'hf):(3'h6)])}});
  assign wire33 = ($signed($unsigned((wire28[(2'h2):(1'h1)] != $signed(wire26)))) + (8'ha1));
  assign wire34 = (|$signed((-$unsigned((~^wire23)))));
  always
    @(posedge clk) begin
      if ((({wire32[(3'h4):(2'h2)],
              {(^reg29), (|wire30)}} | $unsigned($unsigned((8'hbb)))) ?
          wire33 : (-$unsigned((8'ha7)))))
        begin
          reg35 <= (!$unsigned(wire23[(3'h6):(2'h2)]));
          reg36 <= wire24[(2'h3):(1'h0)];
          reg37 <= (^((-wire32[(4'hc):(2'h2)]) >> $unsigned(({wire30} ?
              (reg36 == (8'hb6)) : (reg29 ? wire32 : (7'h43))))));
          reg38 <= (+($unsigned((wire34[(3'h6):(1'h1)] ?
              (8'hb5) : wire22[(4'ha):(4'ha)])) > $unsigned($unsigned((~^wire33)))));
        end
      else
        begin
          reg35 <= reg36;
          reg36 <= reg38;
        end
      reg39 <= (~&{($unsigned(reg29) ?
              ($signed(wire30) ?
                  {wire26, wire22} : wire28) : reg37[(5'h10):(4'hb)])});
      reg40 <= $unsigned((~wire32[(3'h7):(3'h5)]));
    end
  assign wire41 = (+(~^{({reg35, wire33} << reg35), wire30[(4'h8):(3'h5)]}));
  assign wire42 = ($signed($unsigned((|wire22[(3'h6):(3'h5)]))) > $unsigned(reg39));
  assign wire43 = reg39[(1'h1):(1'h1)];
  assign wire44 = wire30[(1'h0):(1'h0)];
  assign wire45 = ((~^$signed(($signed(reg29) ?
                      (~^reg29) : {wire44}))) ^~ (^~{$signed($signed((8'haa)))}));
  always
    @(posedge clk) begin
      reg46 <= reg36;
      reg47 <= {$signed((~&(((7'h40) ~^ wire33) ^~ ((8'hac) > wire28))))};
      reg48 <= (&(8'hb2));
      reg49 <= $unsigned($unsigned((^~$signed((reg40 * (8'h9c))))));
      reg50 <= {((8'ha0) ?
              (~^$signed((-reg47))) : {{(reg35 >>> wire30)},
                  (wire28[(3'h4):(2'h2)] << {wire43})}),
          {$signed(((8'hb5) != $unsigned(wire22)))}};
    end
  assign wire51 = ({({$signed(reg48)} ~^ (reg29 - wire42[(3'h4):(1'h0)])),
                      (((wire26 >> reg29) | wire31) ?
                          (((7'h43) ?
                              wire27 : wire45) == (wire45 || wire31)) : $signed(wire24[(3'h7):(2'h3)]))} << {(~(~^(wire23 ?
                          reg46 : wire34)))});
  assign wire52 = $signed(reg37);
  assign wire53 = (($signed($unsigned(wire28[(3'h5):(2'h3)])) ?
                          $unsigned(($unsigned(reg39) ?
                              (wire43 && reg47) : $signed((7'h40)))) : $unsigned($unsigned(((8'hb0) > wire23)))) ?
                      {(!$unsigned($signed(wire44)))} : $unsigned(reg37));
  assign wire54 = (^wire26);
endmodule
