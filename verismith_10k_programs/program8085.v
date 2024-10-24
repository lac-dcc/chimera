module top
#(parameter param88 = (^(!(((-(8'hba)) ? {(8'haa), (8'hb1)} : ((7'h43) ? (8'ha4) : (8'haa))) <= ((~&(8'hb3)) < (!(7'h44)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire22,
                 wire21,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg20,
                 reg19,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = wire0[(4'hc):(4'hb)];
  assign wire5 = wire3;
  assign wire6 = $unsigned($signed($unsigned(({wire3, wire4} ?
                     (!wire2) : $unsigned(wire1)))));
  assign wire7 = {wire2,
                     ($unsigned(wire3[(4'he):(3'h5)]) & (wire6[(4'he):(3'h6)] >>> $unsigned((wire4 ?
                         wire1 : wire1))))};
  always
    @(posedge clk) begin
      reg8 <= (!((wire3 >>> $unsigned($unsigned(wire7))) ?
          ((|$signed(wire3)) ?
              (~((8'hac) ?
                  wire3 : wire0)) : wire4) : $unsigned($signed((~&wire1)))));
      if ((((wire0[(2'h2):(1'h0)] > $signed(wire4)) + wire3) != {$unsigned(wire6[(4'hd):(4'h9)]),
          wire2[(4'hb):(3'h4)]}))
        begin
          if (({$signed(wire1), $unsigned(wire2)} | $unsigned($signed(wire7))))
            begin
              reg9 <= wire5[(3'h6):(1'h0)];
            end
          else
            begin
              reg9 <= (((8'h9c) >>> wire1[(2'h2):(1'h0)]) ?
                  (~({$signed(reg9)} ?
                      $signed((8'had)) : ({reg9} ?
                          $signed(wire2) : wire5))) : wire2[(4'hc):(4'hb)]);
            end
          reg10 <= $signed(wire2[(3'h6):(1'h1)]);
          reg11 <= reg8[(1'h1):(1'h0)];
        end
      else
        begin
          reg9 <= wire4;
          if ($signed(wire6))
            begin
              reg10 <= wire1[(2'h2):(1'h0)];
              reg11 <= ($unsigned($signed(wire2[(2'h2):(1'h1)])) < (-$unsigned(reg9)));
              reg12 <= ((~^$signed(reg11[(2'h2):(2'h2)])) ?
                  $signed($unsigned($signed($signed(reg11)))) : reg8[(3'h4):(2'h3)]);
              reg13 <= {reg12[(4'h9):(3'h7)],
                  (~^$signed($signed($unsigned((8'hbb)))))};
            end
          else
            begin
              reg10 <= (8'h9c);
              reg11 <= (~|$signed($unsigned($signed(wire2))));
            end
        end
      reg14 <= (wire6[(4'hb):(1'h0)] & $unsigned((!reg10[(4'hb):(1'h1)])));
    end
  assign wire15 = (wire5 - $signed(({{wire6, reg9}} ?
                      ($signed(wire0) ?
                          (&(8'hb7)) : (reg8 >> wire4)) : wire7[(3'h6):(3'h6)])));
  assign wire16 = $unsigned($signed((8'hbd)));
  assign wire17 = $signed(wire5);
  assign wire18 = (~(((^(^wire5)) << (7'h43)) ?
                      (($unsigned(reg8) ?
                          ((8'haf) ?
                              wire17 : wire2) : ((8'ha6) <<< reg12)) ^~ ((~|(8'hbc)) * wire2[(5'h10):(2'h3)])) : ({$unsigned(reg13),
                              (reg10 ? wire6 : wire17)} ?
                          $unsigned((reg12 >= reg13)) : $signed($unsigned(reg13)))));
  always
    @(posedge clk) begin
      reg19 <= (!((!wire1) != wire17[(1'h1):(1'h1)]));
      reg20 <= $signed($signed(($unsigned((reg10 ? (8'hb1) : (8'h9c))) ?
          reg19[(1'h0):(1'h0)] : ({reg11} & $signed((8'ha5))))));
    end
  assign wire21 = wire15[(2'h2):(2'h2)];
  assign wire22 = wire2;
  module23 #() modinst71 (.wire26(wire22), .wire27(wire21), .wire24(wire2), .clk(clk), .wire25(wire5), .y(wire70));
  assign wire72 = wire0;
  assign wire73 = (&{$signed(((reg12 <= reg13) ?
                          {wire7} : (wire1 ? reg13 : reg19)))});
  assign wire74 = wire0[(3'h6):(1'h1)];
  assign wire75 = (&(($unsigned($signed(reg20)) == $unsigned((|wire0))) ?
                      $unsigned((~|wire7)) : (~|((|wire72) || wire22))));
  always
    @(posedge clk) begin
      if ((7'h40))
        begin
          if ({(~&wire74[(2'h2):(1'h1)])})
            begin
              reg76 <= ({(-(8'hb2))} <<< (wire4[(4'h9):(3'h6)] ~^ ($unsigned((wire6 ~^ wire73)) ?
                  (~^reg8[(2'h2):(2'h2)]) : {(&reg11)})));
              reg77 <= (({($signed(reg8) ?
                          $unsigned(reg20) : (wire73 ? wire1 : wire72)),
                      wire70} || $signed($signed((wire4 ? reg19 : (8'hbe))))) ?
                  wire3 : $signed($unsigned(((~&wire16) ?
                      (|(8'hbc)) : wire6))));
            end
          else
            begin
              reg76 <= (~wire70);
            end
          reg78 <= ($signed($unsigned(wire74[(2'h3):(1'h0)])) == wire2[(4'h8):(3'h7)]);
          if (reg76[(3'h6):(3'h4)])
            begin
              reg79 <= {$signed((~&wire70)),
                  ($unsigned((wire5 ?
                      (wire3 ? wire21 : (8'haa)) : (reg78 ?
                          (8'hac) : (8'hbb)))) * (^~({wire18, wire16} ?
                      $unsigned(reg8) : (wire73 ? (8'hb7) : wire7))))};
              reg80 <= $unsigned({wire73});
              reg81 <= ((^(-wire4)) == reg78[(4'h8):(1'h1)]);
              reg82 <= $signed(wire70);
              reg83 <= reg81[(3'h4):(1'h1)];
            end
          else
            begin
              reg79 <= ({$signed((~|$signed(wire17))),
                  ({$unsigned(wire4),
                      $unsigned(reg83)} ^ $signed($signed(wire16)))} >> {$signed((~&{wire70}))});
              reg80 <= (~&$signed($signed($signed({reg82, wire15}))));
              reg81 <= (~^wire18);
            end
        end
      else
        begin
          reg76 <= ((7'h40) ?
              wire4 : ((-$unsigned($unsigned(wire22))) ?
                  (wire6 ?
                      (wire21[(4'ha):(4'h9)] == wire17) : $unsigned($signed(reg19))) : $signed($signed(reg83[(3'h5):(3'h5)]))));
        end
    end
  assign wire84 = wire22;
  assign wire85 = wire3[(4'h9):(4'h8)];
  assign wire86 = reg8;
  assign wire87 = {($unsigned($signed((reg8 ?
                          reg20 : reg80))) << ($signed($signed(wire16)) ?
                          (wire4 && $signed(wire2)) : $unsigned((+wire73)))),
                      (^$unsigned((!(wire16 && wire3))))};
endmodule

module module23
#(parameter param69 = {{(({(8'hb5), (7'h41)} ? {(8'hbd)} : (^(8'hae))) ? ((^~(8'hbc)) ? (&(7'h41)) : {(8'hbb), (8'ha9)}) : (~((8'hbf) ? (8'ha4) : (7'h42))))}, (8'hbe)})
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire26;
  input wire [(4'h9):(1'h0)] wire25;
  input wire signed [(2'h2):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 (1'h0)};
  assign wire28 = wire25;
  assign wire29 = (($unsigned((~wire26)) > (!(wire28[(4'hf):(4'ha)] ?
                          (wire25 ? (7'h40) : wire27) : $signed(wire28)))) ?
                      ($signed((~&$signed(wire27))) ?
                          (wire28 ?
                              ($signed((7'h40)) ?
                                  $signed(wire26) : (&(8'ha5))) : ((~wire27) == (8'ha3))) : $unsigned($unsigned($signed(wire24)))) : $signed(wire24[(2'h2):(1'h0)]));
  assign wire30 = (&((~^wire28[(5'h10):(4'ha)]) ?
                      ($signed(wire29[(3'h7):(1'h1)]) * (8'hb4)) : ((~^(wire26 ?
                          wire28 : wire24)) ^ ($signed((7'h43)) | wire27))));
  assign wire31 = (!{$signed($signed($unsigned((8'hb5)))),
                      $signed({{wire24}})});
  assign wire32 = (^wire26);
  assign wire33 = ($unsigned(wire29) ?
                      wire25[(4'h9):(1'h0)] : {$signed(wire26[(3'h5):(1'h0)])});
  assign wire34 = (wire26 <= $unsigned((^~wire27)));
  assign wire35 = (wire32 ?
                      wire34 : (~&(((wire27 << (8'hab)) ?
                              wire33[(4'hc):(4'hc)] : wire24[(1'h1):(1'h0)]) ?
                          $signed($unsigned(wire31)) : wire24)));
  assign wire36 = ($signed({wire34[(3'h5):(1'h1)],
                          ({wire27, wire29} ? $unsigned(wire32) : wire25)}) ?
                      wire34[(4'hc):(3'h7)] : ($signed(((wire34 == wire28) ?
                          $unsigned(wire26) : {wire27})) | ($unsigned($unsigned(wire31)) ?
                          ((wire25 ? (8'hac) : wire28) << (wire35 ?
                              wire26 : wire27)) : ((wire35 ?
                              wire33 : (8'haa)) ^ wire28))));
  assign wire37 = wire24[(1'h0):(1'h0)];
  module38 #() modinst60 (.wire40(wire37), .clk(clk), .wire39(wire29), .wire42(wire26), .wire41(wire34), .y(wire59));
  assign wire61 = $signed(($signed($unsigned((wire32 ? wire32 : wire37))) ?
                      {$signed((wire59 ?
                              (8'hb6) : (7'h41)))} : {(-(wire28 || wire34)),
                          {wire30, (!wire31)}}));
  assign wire62 = {(wire61[(3'h5):(3'h4)] ?
                          wire33 : $unsigned((wire59[(5'h12):(4'h9)] >>> {wire28,
                              (8'hb7)}))),
                      ({(wire37 < $signed(wire24))} ?
                          (~|$unsigned((wire35 && wire59))) : $signed($signed($unsigned(wire24))))};
  assign wire63 = $signed($signed(wire24));
  assign wire64 = ((8'h9e) ?
                      $signed(wire30[(1'h1):(1'h1)]) : $unsigned($signed((~(+wire37)))));
  assign wire65 = $unsigned(wire35);
  assign wire66 = ({(8'ha1),
                          $signed(($unsigned(wire61) ?
                              {wire63, wire59} : {(8'h9e), wire35}))} ?
                      wire33 : {$unsigned(wire28), wire35});
  assign wire67 = (|((((wire28 & wire61) > wire31) ?
                      {{wire62},
                          (wire61 <= (8'hb9))} : ((wire34 >= wire27) >> {wire27})) & $unsigned((~|$signed(wire35)))));
  assign wire68 = ($unsigned($unsigned($signed($unsigned(wire35)))) ?
                      (-{wire67[(4'ha):(1'h0)],
                          $signed({wire61,
                              wire62})}) : $signed((wire30[(4'h8):(4'h8)] ?
                          $signed(wire26) : $signed($unsigned(wire25)))));
endmodule

module module38
#(parameter param58 = ((((((8'ha2) > (8'hb4)) ? (~&(8'hb8)) : (|(7'h40))) & (8'hbb)) ? ((-(|(7'h42))) ? (((7'h40) ~^ (8'hab)) ~^ (~(7'h42))) : (((8'hbe) >= (8'hb1)) && (~&(8'hb7)))) : (((-(7'h43)) ? ((8'hbb) ? (8'had) : (7'h43)) : ((8'hbc) ? (8'ha9) : (7'h44))) ? (!((8'hae) ? (7'h43) : (8'h9c))) : ((~&(8'h9d)) > ((8'ha8) ? (8'h9e) : (8'had))))) >> (((((8'ha0) ? (8'hb6) : (8'ha2)) >> ((8'hb3) == (8'hab))) >= (((8'hbb) ? (7'h42) : (8'had)) ? (^~(7'h42)) : {(8'hac), (8'ha7)})) ^~ (~(((8'hb4) >= (8'ha7)) - ((8'had) ? (8'h9e) : (8'h9c)))))))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire41;
  input wire signed [(5'h14):(1'h0)] wire40;
  input wire signed [(4'hf):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg50,
                 (1'h0)};
  assign wire43 = wire40;
  assign wire44 = ({({(wire43 - wire42), (wire42 ~^ wire41)} ?
                          ($unsigned(wire40) <<< $unsigned(wire41)) : $unsigned($unsigned(wire40)))} << (+$unsigned(wire41)));
  assign wire45 = wire42;
  assign wire46 = wire44;
  assign wire47 = ($unsigned((wire39[(4'hd):(2'h2)] ?
                      ($signed(wire43) ?
                          (wire46 ?
                              (8'ha0) : wire39) : (wire41 <<< wire43)) : {$unsigned(wire46)})) > (wire41[(2'h2):(1'h1)] > wire40[(4'h8):(2'h2)]));
  assign wire48 = $unsigned(wire45[(2'h2):(2'h2)]);
  assign wire49 = (wire39 ?
                      $signed(wire45[(3'h5):(2'h3)]) : (+((wire44 <<< (wire47 ?
                              wire45 : wire43)) ?
                          wire40 : (^~$unsigned(wire46)))));
  always
    @(posedge clk) begin
      reg50 <= (!{wire49});
    end
  assign wire51 = $unsigned((|$signed(wire45)));
  assign wire52 = reg50[(3'h6):(2'h3)];
  assign wire53 = $unsigned($signed(wire49));
  assign wire54 = $signed((($signed((wire47 <= (8'ha4))) || $unsigned((reg50 ?
                          wire44 : reg50))) ?
                      {(wire45 ?
                              $unsigned(wire44) : (wire42 ? wire39 : wire53)),
                          wire44} : reg50[(4'hd):(1'h0)]));
  assign wire55 = $signed((~^(($signed(wire44) ^~ wire53[(3'h6):(2'h2)]) ?
                      ($signed(wire46) | ((7'h43) == wire40)) : ({(8'ha1)} ?
                          wire42 : (wire52 ? wire52 : wire46)))));
  assign wire56 = ((((((8'hb1) ? wire41 : wire42) >> {wire52,
                          wire43}) || wire44) == wire48[(3'h5):(3'h5)]) ?
                      $signed((wire54 > $unsigned(wire47))) : $unsigned($signed(wire44[(4'h8):(3'h4)])));
  assign wire57 = $unsigned({((wire55 ?
                          wire53[(4'h8):(3'h4)] : (wire46 ?
                              (8'haa) : wire56)) ^ $signed($signed(wire51)))});
endmodule
