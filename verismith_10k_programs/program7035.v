module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire [(3'h5):(1'h0)] wire124;
  wire signed [(4'hf):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire122;
  wire signed [(3'h5):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire118;
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire118,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = ($signed((^$unsigned(wire1))) ~^ wire2);
  assign wire5 = (~^(!(~&(wire4[(4'ha):(3'h5)] & {wire3, wire3}))));
  assign wire6 = (((8'hbf) ?
                     ((wire3 ? {wire1, wire1} : wire1[(3'h7):(2'h2)]) ?
                         {((8'ha1) ?
                                 (8'hb5) : wire1)} : wire2[(2'h3):(1'h1)]) : $unsigned($unsigned((wire5 ?
                         wire1 : wire5)))) || {$unsigned((wire1 >>> (~|(8'ha5)))),
                     wire1});
  assign wire7 = wire1;
  always
    @(posedge clk) begin
      reg8 <= ($signed(wire2[(4'he):(3'h5)]) - ($unsigned(wire1[(5'h10):(4'hb)]) != $signed(wire7)));
      if ((wire3[(1'h1):(1'h0)] > ($unsigned(((wire0 ~^ wire3) ^~ {(8'haf),
          wire6})) >= wire4[(3'h4):(1'h0)])))
        begin
          if (wire0)
            begin
              reg9 <= ((~&(-$signed($unsigned(wire3)))) ^ (({((8'ha1) ?
                              wire3 : wire4)} ?
                      $unsigned(wire4) : wire1[(4'hc):(4'hb)]) ?
                  (($signed((8'hb1)) > $signed(wire0)) ?
                      ((wire6 ^ wire0) ?
                          reg8 : wire7[(3'h7):(3'h7)]) : ((&wire3) && (wire2 > (8'hb2)))) : (-(+wire3))));
            end
          else
            begin
              reg9 <= $unsigned(wire2);
            end
          reg10 <= wire3;
          if ({((&(+{reg8,
                  wire3})) * (wire7[(1'h0):(1'h0)] >>> (reg8[(3'h6):(3'h4)] ?
                  {wire0, wire1} : (wire0 ? wire7 : wire4))))})
            begin
              reg11 <= $unsigned(((+(~|$unsigned(wire2))) ?
                  $unsigned(((+wire0) ?
                      $unsigned(wire3) : wire3)) : $signed(wire5)));
              reg12 <= wire6;
              reg13 <= (~wire6[(4'h8):(3'h5)]);
              reg14 <= (!wire3);
              reg15 <= wire1;
            end
          else
            begin
              reg11 <= (reg8[(4'hb):(4'ha)] ?
                  $signed(wire3[(2'h3):(1'h1)]) : wire3);
              reg12 <= $unsigned({(((reg15 ? (8'hb2) : (8'hbe)) ?
                          $unsigned(reg12) : ((8'ha6) <= reg13)) ?
                      $signed(wire3[(3'h7):(1'h1)]) : {wire6})});
              reg13 <= reg9[(3'h7):(2'h3)];
              reg14 <= $signed($unsigned((8'ha8)));
              reg15 <= $signed({($signed(reg14) != $signed((reg9 ?
                      reg14 : wire4))),
                  (8'haf)});
            end
          reg16 <= reg13;
          reg17 <= ((|((-wire6) >= reg10)) ?
              ({$unsigned(reg10), {reg14[(3'h7):(1'h1)]}} ?
                  $signed(wire7) : wire3[(4'h8):(2'h3)]) : ((+reg12[(4'hd):(3'h6)]) * $unsigned(wire4[(1'h1):(1'h0)])));
        end
      else
        begin
          reg9 <= ((&(($unsigned(reg13) ?
              $unsigned((8'h9c)) : (reg9 ? (8'hb1) : wire4)) >= (^(reg16 ?
              reg11 : reg15)))) ^~ $unsigned($signed({(reg8 ? reg11 : reg16),
              (reg10 ? wire7 : wire7)})));
          reg10 <= ($unsigned((wire6 || reg17[(3'h4):(1'h0)])) ?
              wire3 : $signed($unsigned(((8'ha1) ?
                  (wire4 && (8'ha9)) : $unsigned(reg15)))));
        end
    end
  assign wire18 = (^$unsigned(wire5));
  assign wire19 = $signed($signed((&(&(~|reg8)))));
  assign wire20 = ({reg13, $unsigned($unsigned($signed(wire1)))} ?
                      {((^~$unsigned(reg17)) ?
                              ((reg9 ?
                                  wire1 : reg10) << (reg17 * wire5)) : reg11)} : ($signed(wire19) > $unsigned((reg11 ?
                          $unsigned(wire18) : wire7))));
  assign wire21 = $unsigned((^(|(wire5[(3'h6):(3'h6)] ?
                      wire18 : (reg14 ? reg12 : wire18)))));
  assign wire22 = {(8'ha5),
                      ($signed({$unsigned(reg10), (^~reg8)}) ?
                          wire3[(1'h1):(1'h0)] : reg8)};
  module23 #() modinst119 (wire118, clk, wire22, wire4, wire6, reg11, reg8);
  assign wire120 = (wire20[(4'h8):(3'h6)] ?
                       $unsigned(wire20) : {$unsigned(wire2),
                           $unsigned(($signed(reg11) && $unsigned(reg10)))});
  assign wire121 = (reg16 ?
                       $signed((wire19[(5'h10):(2'h2)] ?
                           (wire22 ~^ {wire4, (8'ha6)}) : $signed((wire118 ?
                               reg16 : (8'hb0))))) : ((((wire5 ?
                               wire21 : (8'ha6)) & wire6) ?
                           reg11 : (8'hbb)) || $unsigned(wire18)));
  assign wire122 = $signed($unsigned((!(((8'ha8) >= wire21) ?
                       wire22[(3'h5):(2'h2)] : $unsigned(reg11)))));
  assign wire123 = (wire120 | $unsigned((-({wire121} ? wire2 : (~reg10)))));
  assign wire124 = $signed((!(^$signed($signed(reg10)))));
  assign wire125 = wire124[(2'h2):(2'h2)];
  assign wire126 = ({wire124[(1'h0):(1'h0)]} ? $unsigned(wire7) : reg8);
endmodule

module module23
#(parameter param117 = (({{((8'hab) && (8'hb0)), ((8'hb9) ? (8'ha9) : (7'h42))}} >>> (|(-(|(8'ha5))))) ? (8'hbd) : ((^~(((8'hab) >>> (8'hb6)) >>> (~(8'ha9)))) & ((+((8'ha5) ? (8'had) : (7'h44))) * (!((8'haa) <<< (8'hb8)))))))
(y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'h1fa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire25;
  input wire signed [(3'h5):(1'h0)] wire26;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire signed [(4'he):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire116;
  wire [(4'hc):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire74;
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire86,
                 wire29,
                 wire31,
                 wire32,
                 wire33,
                 wire74,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg30,
                 (1'h0)};
  assign wire29 = wire28[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg30 <= ((wire27 ~^ $signed(((wire27 ? wire28 : wire29) ?
              (^wire29) : $unsigned(wire29)))) ?
          {$signed((~wire29)),
              $unsigned(wire28)} : $signed(((~&wire27[(2'h2):(1'h1)]) ?
              wire25[(2'h2):(1'h1)] : ((wire28 > wire28) ?
                  (wire24 > wire25) : (wire28 ? (7'h40) : wire29)))));
    end
  assign wire31 = (~^$unsigned({(reg30 ? reg30 : (wire24 ? (8'h9f) : wire25)),
                      {wire29}}));
  assign wire32 = {$signed(wire27), {wire24}};
  assign wire33 = (^~(^((wire26 ? $unsigned(reg30) : (^~wire27)) ?
                      wire27 : $signed(wire25))));
  module34 #() modinst75 (.clk(clk), .wire38(wire31), .y(wire74), .wire37(reg30), .wire36(wire33), .wire35(wire28));
  always
    @(posedge clk) begin
      reg76 <= wire32[(2'h2):(2'h2)];
      if ($signed(wire25))
        begin
          reg77 <= (8'hb7);
          reg78 <= (~&wire27);
          reg79 <= wire31[(2'h2):(1'h1)];
          reg80 <= $signed((&(-({wire32} | {wire28, (8'hab)}))));
          if ((wire32[(4'h8):(2'h2)] ?
              (~|($unsigned({wire29, (8'hbf)}) * ($unsigned(reg80) ?
                  wire25[(1'h1):(1'h1)] : (~&reg30)))) : (((~&wire74[(2'h2):(1'h0)]) ?
                      (&wire74) : {{wire27, reg30}, (reg30 != wire32)}) ?
                  wire29[(2'h3):(2'h2)] : wire27[(3'h7):(2'h2)])))
            begin
              reg81 <= wire29;
              reg82 <= $signed(reg77);
            end
          else
            begin
              reg81 <= $unsigned($signed(wire26));
              reg82 <= reg82[(4'h9):(4'h9)];
            end
        end
      else
        begin
          reg77 <= (|$unsigned(reg81));
          reg78 <= (&$unsigned($unsigned({(wire26 ? wire24 : wire32),
              {reg78}})));
          reg79 <= ((^(-((wire74 ? wire33 : wire29) && ((8'ha4) * (8'had))))) ?
              reg79 : reg77[(2'h3):(1'h1)]);
        end
      reg83 <= wire25;
      reg84 <= (8'hbb);
      reg85 <= (+{((~|wire26) ?
              $unsigned(reg79[(2'h3):(2'h3)]) : $signed((reg83 ?
                  reg81 : reg82))),
          (^(8'h9c))});
    end
  assign wire86 = wire33;
  always
    @(posedge clk) begin
      reg87 <= wire74[(3'h4):(2'h3)];
      reg88 <= ((~reg85[(4'hb):(4'ha)]) & $unsigned((~^wire28)));
      reg89 <= wire28[(4'hb):(2'h3)];
      if ((8'hba))
        begin
          reg90 <= (^~$unsigned((&{wire28, wire28[(3'h4):(1'h1)]})));
          if (wire28[(1'h0):(1'h0)])
            begin
              reg91 <= $unsigned(wire25);
              reg92 <= (($signed((&(reg81 ? reg81 : wire25))) ?
                      $unsigned((wire32[(2'h3):(2'h3)] && reg79)) : (^~($signed(reg84) || reg87))) ?
                  $signed((^~wire29[(3'h4):(2'h3)])) : wire25[(4'h8):(3'h7)]);
              reg93 <= wire25;
              reg94 <= ($signed(($unsigned($signed(reg80)) ?
                      (~&reg82[(1'h1):(1'h0)]) : ((^reg91) ?
                          wire86[(4'hf):(4'ha)] : (wire33 ? wire33 : reg93)))) ?
                  wire86 : (((^reg80[(2'h2):(2'h2)]) <= ((reg92 <= wire29) ~^ (reg30 ?
                          (8'hbc) : (8'ha7)))) ?
                      {($signed(reg91) >> reg82[(4'h9):(3'h7)]),
                          (^reg85[(4'hd):(2'h3)])} : $signed($unsigned((wire33 <= wire74)))));
            end
          else
            begin
              reg91 <= reg85[(1'h1):(1'h1)];
            end
          if ((|({((reg83 <<< (8'hae)) ? reg94 : (reg79 ? wire32 : (8'hbd)))} ?
              $signed(($unsigned(reg90) < (^reg82))) : reg89[(4'he):(3'h7)])))
            begin
              reg95 <= ((wire29 >>> wire26[(3'h4):(1'h1)]) + (-(wire86[(3'h6):(1'h1)] ^~ reg30[(2'h3):(2'h2)])));
              reg96 <= $unsigned((reg85[(5'h11):(4'hc)] ~^ wire25));
            end
          else
            begin
              reg95 <= ($signed((&reg77)) ^ reg79);
              reg96 <= ((^(!reg83[(3'h5):(2'h3)])) ?
                  $signed(reg30[(3'h4):(2'h2)]) : (~(reg92[(2'h2):(1'h1)] <<< reg90)));
              reg97 <= wire25;
              reg98 <= reg85;
              reg99 <= ({$unsigned((reg79[(3'h7):(3'h6)] >> (reg30 >>> wire28)))} ?
                  (wire31[(4'h9):(3'h7)] ?
                      $unsigned(reg90) : $signed($unsigned(((7'h43) ?
                          (8'h9f) : wire29)))) : reg91);
            end
        end
      else
        begin
          reg90 <= $unsigned((reg94 ?
              ({reg81[(1'h1):(1'h1)], (wire32 ~^ wire86)} ?
                  $unsigned($signed(reg79)) : wire26[(3'h5):(1'h0)]) : reg88));
          reg91 <= reg83;
        end
      if ((({{$signed(reg92), reg84[(3'h6):(1'h1)]}, $signed(wire86)} ?
              ((^~(reg98 - reg84)) != $signed(reg85)) : $signed({$unsigned(reg89)})) ?
          $signed(($unsigned(((8'ha0) ? (8'had) : wire33)) ?
              ((wire25 ?
                  wire29 : reg91) * (!reg78)) : $unsigned((+wire33)))) : {(((wire33 < (7'h43)) ?
                  reg98 : $unsigned(reg96)) & $signed($signed(reg88)))}))
        begin
          reg100 <= reg76;
          reg101 <= (~reg88);
          reg102 <= reg77;
          reg103 <= ({{(~^reg85), reg30}} ?
              wire24[(4'ha):(4'h8)] : wire33[(3'h4):(1'h0)]);
          reg104 <= (reg101[(3'h7):(3'h4)] >= (&reg98));
        end
      else
        begin
          if ($unsigned(reg100[(1'h0):(1'h0)]))
            begin
              reg100 <= $signed(wire24);
            end
          else
            begin
              reg100 <= reg95[(1'h0):(1'h0)];
              reg101 <= ($signed($unsigned(($signed(wire33) ?
                      $signed((8'hb1)) : {reg30, reg85}))) ?
                  $signed(reg100[(4'he):(4'hc)]) : $signed(({(-reg99)} ?
                      $unsigned(((8'h9d) ?
                          reg76 : (8'ha8))) : (reg103 <= (^(8'haf))))));
              reg102 <= (wire31 || ($signed(({wire25, reg90} ?
                  (wire26 ?
                      reg94 : reg103) : ((8'hbf) >>> (8'hae)))) <= (($unsigned(reg98) <<< (reg92 ?
                  (8'hba) : reg82)) != wire25[(1'h0):(1'h0)])));
              reg103 <= (~&{((reg79[(2'h2):(2'h2)] == $unsigned(wire26)) ?
                      $unsigned((|reg83)) : (reg101[(1'h0):(1'h0)] >>> $signed(reg95))),
                  reg94});
            end
          if (reg92)
            begin
              reg104 <= ($unsigned((!wire86)) ?
                  wire31[(4'h8):(2'h2)] : (8'h9e));
              reg105 <= (!$unsigned({{$signed(reg102), (^wire29)},
                  $unsigned(reg91[(4'h9):(3'h6)])}));
              reg106 <= $unsigned(reg91);
            end
          else
            begin
              reg104 <= (+reg92);
              reg105 <= $unsigned(((({reg96} + (!reg105)) ?
                  (reg90 ?
                      (wire24 ?
                          reg96 : wire33) : $unsigned((8'ha3))) : (|(wire86 < wire32))) != reg99));
              reg106 <= $unsigned($unsigned(($unsigned((^reg80)) << $signed(reg100[(2'h3):(2'h2)]))));
              reg107 <= wire28[(4'ha):(2'h2)];
              reg108 <= $signed(($unsigned(((reg99 || (8'haa)) == $signed(wire28))) && $unsigned($unsigned($signed(reg81)))));
            end
          reg109 <= wire28;
          if (((((reg98 ? (reg107 - reg101) : (wire26 ? wire86 : (8'ha3))) ?
                      $unsigned(reg84) : ($unsigned(wire28) ?
                          (|reg85) : (reg99 ? reg79 : reg100))) ?
                  $unsigned($signed(reg76[(5'h12):(4'ha)])) : ($signed(reg103[(2'h3):(1'h0)]) >>> wire24[(2'h2):(1'h1)])) ?
              $signed(reg92) : $unsigned(($signed((reg102 << wire86)) ?
                  (reg97[(2'h2):(1'h1)] ?
                      $signed((8'hb3)) : ((8'hac) ?
                          (8'h9c) : reg95)) : ((~^reg108) > (8'hb2))))))
            begin
              reg110 <= wire27;
              reg111 <= $signed(((|reg107[(3'h4):(2'h3)]) ?
                  $signed({reg85[(1'h1):(1'h0)],
                      $signed(reg89)}) : $unsigned((~&$unsigned(wire32)))));
              reg112 <= $signed((wire32[(4'h8):(1'h1)] ?
                  $unsigned((~|$unsigned(reg76))) : $unsigned(reg98[(2'h3):(2'h2)])));
              reg113 <= (~|$unsigned((!((reg95 ^~ (7'h40)) ?
                  (wire29 >> reg82) : (reg30 - (8'hb8))))));
            end
          else
            begin
              reg110 <= (^reg107[(2'h2):(2'h2)]);
            end
          reg114 <= {reg106};
        end
    end
  assign wire115 = reg98;
  assign wire116 = $signed((^$signed($unsigned($unsigned((8'ha9))))));
endmodule

module module34
#(parameter param72 = (+((((+(7'h41)) ? ((8'hb8) + (8'hb1)) : ((8'hbe) ? (8'h9f) : (8'ha3))) ? (((8'hbb) ? (8'hac) : (8'hb7)) ? (^(8'ha8)) : (+(8'hbf))) : (((8'hbe) <<< (7'h43)) ? ((8'had) != (7'h44)) : (8'hbc))) ? (((|(8'hbe)) && ((8'hb4) ? (8'hb9) : (8'ha9))) ? (8'hac) : (((8'ha1) ^ (8'hbe)) + ((8'hb1) > (8'hb2)))) : ((|((8'ha0) >= (8'haf))) ~^ ({(8'hbf)} - ((8'ha5) ? (8'ha9) : (8'hab)))))), 
parameter param73 = (8'ha9))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire38;
  input wire [(5'h13):(1'h0)] wire37;
  input wire signed [(5'h14):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
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
                 reg45,
                 (1'h0)};
  assign wire39 = $unsigned((wire35[(3'h6):(3'h4)] ?
                      wire35[(4'hc):(4'hc)] : $signed({(wire35 ?
                              wire36 : wire36)})));
  assign wire40 = ($signed((((wire36 <= wire38) ?
                          wire39[(4'h9):(3'h6)] : (wire39 * wire35)) - (&(wire35 ?
                          wire39 : wire39)))) ?
                      {(8'haf)} : (+wire39));
  assign wire41 = ((wire35[(4'he):(4'hc)] ?
                          (~&$unsigned(wire37[(2'h3):(2'h2)])) : ($signed((wire40 >> wire39)) != $unsigned($unsigned(wire37)))) ?
                      (&wire39) : (wire38 ?
                          wire37 : {wire35, $signed((~&wire39))}));
  assign wire42 = {($signed($unsigned($unsigned(wire38))) ?
                          $signed($unsigned($signed(wire38))) : ((-$signed((8'ha9))) > $signed((+wire37)))),
                      ($unsigned(wire35) ?
                          (^~$unsigned({wire41, wire41})) : (wire37 ?
                              (8'hbf) : $unsigned(wire38)))};
  assign wire43 = wire37[(4'he):(3'h6)];
  assign wire44 = (((wire38 << $signed(wire38)) << ($unsigned((wire43 ?
                              (8'haf) : wire39)) ?
                          $unsigned((+wire40)) : (wire40 ?
                              $unsigned(wire38) : (|wire39)))) ?
                      (^{((wire35 ? wire36 : wire36) ?
                              (wire37 ? wire41 : wire41) : wire39),
                          (|(wire39 ? wire41 : wire38))}) : (8'ha4));
  always
    @(posedge clk) begin
      reg45 <= ({($unsigned($unsigned(wire38)) ?
              $signed(((8'ha8) ? wire38 : (8'had))) : $unsigned((~|wire36))),
          wire41} == $unsigned(wire36[(4'hc):(3'h6)]));
      reg46 <= {(wire40 ?
              $unsigned(((!wire39) ?
                  (~wire44) : wire35[(4'he):(3'h6)])) : (+wire44[(4'h9):(1'h1)]))};
      reg47 <= ($signed(($signed((wire39 <= wire40)) != $unsigned((wire39 ?
          wire38 : reg45)))) <<< $signed((((wire41 ?
          wire43 : reg45) ^~ wire43) >> wire44)));
      if ((&($unsigned(wire36) << wire44[(3'h5):(1'h0)])))
        begin
          reg48 <= $signed($unsigned(wire41));
          reg49 <= wire44;
          reg50 <= {$unsigned(wire35[(3'h6):(3'h5)]),
              {{wire39[(3'h6):(3'h5)], $unsigned(reg47[(2'h2):(1'h0)])},
                  ((+$signed(wire42)) == $unsigned($signed((7'h44))))}};
          reg51 <= wire35;
          if ($unsigned((wire40[(3'h5):(2'h2)] ?
              ((^(reg48 ? (8'hbd) : reg47)) ?
                  (wire40[(4'ha):(3'h7)] | wire44) : ($signed(reg48) ~^ reg51)) : (!(!$signed(wire41))))))
            begin
              reg52 <= $unsigned((~|wire40[(3'h7):(2'h3)]));
              reg53 <= {(reg48 ^ ($signed($signed(reg52)) * ((reg51 ?
                      wire42 : wire40) <<< wire36))),
                  $unsigned(((+$signed(reg50)) && $signed($signed(reg51))))};
              reg54 <= wire38[(2'h2):(1'h0)];
            end
          else
            begin
              reg52 <= {wire43};
              reg53 <= (wire41[(3'h4):(2'h2)] < reg52);
              reg54 <= ($unsigned(($signed($signed((7'h40))) ^ wire43)) || ((+{$signed((8'hbe))}) + (((reg46 > (8'ha3)) ?
                      wire43 : $signed((7'h41))) ?
                  (^~$unsigned(wire41)) : reg53[(2'h3):(2'h3)])));
              reg55 <= $signed({(!(^(+wire36))),
                  $signed(({reg46} ? (wire37 > (8'ha1)) : wire41))});
              reg56 <= reg47;
            end
        end
      else
        begin
          reg48 <= $signed(reg48[(3'h6):(3'h4)]);
          reg49 <= $signed((^~wire40[(4'hb):(4'hb)]));
        end
      reg57 <= ((8'hb5) ?
          (^(wire37[(3'h4):(2'h3)] ?
              ((^~reg56) ~^ (~&reg55)) : wire37)) : {$signed((~|$unsigned(wire39))),
              (~|wire42)});
    end
  assign wire58 = reg53[(4'h9):(3'h6)];
  assign wire59 = reg57[(4'hb):(4'h8)];
  assign wire60 = $signed(($signed((~|(reg57 ? (7'h42) : reg54))) ^~ (((reg48 ?
                      wire38 : wire37) + (!wire41)) + (reg54[(3'h6):(1'h1)] ?
                      {reg47} : $unsigned((8'ha6))))));
  assign wire61 = $signed(reg52);
  assign wire62 = $signed($unsigned((+$unsigned((8'hb5)))));
  always
    @(posedge clk) begin
      if ((reg50 ? wire41 : wire35[(4'h8):(2'h2)]))
        begin
          reg63 <= $signed((&$signed(reg46[(1'h0):(1'h0)])));
        end
      else
        begin
          reg63 <= ({wire39[(1'h1):(1'h1)],
                  $unsigned(($unsigned(reg45) == ((8'hb4) > wire62)))} ?
              {$unsigned(((wire58 ?
                      (8'hb0) : reg52) >>> (~reg53)))} : reg52[(4'hc):(3'h7)]);
          reg64 <= $unsigned(wire36);
        end
      if (wire43[(4'h8):(3'h4)])
        begin
          reg65 <= $unsigned(reg50[(4'hb):(1'h1)]);
        end
      else
        begin
          if (($unsigned((&({(8'hbe)} ? (-reg55) : (~&reg65)))) ?
              ((wire61[(5'h11):(2'h2)] ?
                      wire37[(4'ha):(4'ha)] : $unsigned((8'hba))) ?
                  (+$signed($signed(wire60))) : (wire61 ?
                      (8'ha8) : (|(8'hb5)))) : {(8'ha1)}))
            begin
              reg65 <= $unsigned(reg50[(4'hd):(4'hb)]);
              reg66 <= ((!reg52) ?
                  {wire59, $signed($unsigned(reg53))} : ({wire59[(4'h8):(1'h1)],
                      $unsigned($signed(wire41))} | (+$unsigned($unsigned(wire42)))));
              reg67 <= {(($unsigned(((8'hb7) != wire35)) | ((reg55 * reg66) ?
                      $signed(reg64) : (wire37 == wire60))) < $unsigned(reg51)),
                  $unsigned(($signed((^wire35)) ~^ (~^reg64[(1'h1):(1'h1)])))};
              reg68 <= $unsigned($signed($signed(($unsigned(reg52) ?
                  {reg45} : $unsigned(reg45)))));
            end
          else
            begin
              reg65 <= {wire35};
              reg66 <= ($signed((({wire38} ^~ reg56[(2'h2):(1'h0)]) >= reg66)) ~^ (^~(reg48[(4'ha):(1'h1)] && $unsigned(wire44[(3'h5):(2'h3)]))));
              reg67 <= (8'hbf);
              reg68 <= (^~((~^reg51) ?
                  wire58[(2'h2):(1'h1)] : wire40[(3'h6):(3'h6)]));
              reg69 <= ($signed(wire39) ~^ (^~$unsigned(wire42)));
            end
        end
      reg70 <= (wire35[(3'h7):(1'h0)] ?
          ((($unsigned(wire38) ^ wire42) ?
                  (reg52[(4'h8):(3'h5)] ?
                      $signed(wire38) : $signed(wire60)) : (~&wire42)) ?
              reg46[(1'h0):(1'h0)] : wire39[(3'h7):(3'h4)]) : (8'ha8));
      reg71 <= reg63;
    end
endmodule
