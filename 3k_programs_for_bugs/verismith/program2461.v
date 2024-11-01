module top
#(parameter param110 = (8'hbe), 
parameter param111 = (((((param110 ? param110 : param110) ? {param110, (8'hb1)} : (param110 ? param110 : param110)) ? ((!param110) ? (param110 + param110) : (param110 >> param110)) : {param110}) * ({(param110 ^~ param110)} < {(-param110)})) - param110))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire106,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $unsigned((wire4 ?
                     $signed($signed(wire0)) : $unsigned($unsigned((8'ha5)))));
  assign wire6 = (wire2[(1'h1):(1'h1)] ? (+wire5[(4'h8):(2'h3)]) : wire5);
  assign wire7 = (wire3[(2'h3):(2'h2)] < (((wire3[(3'h4):(2'h3)] >> (wire4 ?
                         wire3 : wire4)) ?
                     ((wire1 ? wire6 : wire6) ?
                         {wire6,
                             wire2} : $signed(wire0)) : $signed(wire5)) - (+wire0[(2'h2):(1'h0)])));
  assign wire8 = $unsigned(((~&$unsigned(wire1)) & $signed(((8'ha0) ~^ (wire4 * wire7)))));
  always
    @(posedge clk) begin
      reg9 <= wire0;
      reg10 <= ($unsigned($unsigned($unsigned({wire5}))) + $signed($unsigned($unsigned(wire6[(4'h8):(3'h6)]))));
      reg11 <= {$signed({((wire3 ? wire2 : wire7) ?
                  ((7'h44) ^ wire7) : $unsigned(wire3)),
              ($unsigned(reg10) && wire1)}),
          (&(7'h41))};
      if (wire5[(3'h4):(3'h4)])
        begin
          reg12 <= wire8;
        end
      else
        begin
          if ($unsigned($signed(reg9)))
            begin
              reg12 <= wire0;
              reg13 <= (wire0[(1'h0):(1'h0)] <<< ((^wire0) ~^ (wire2 ?
                  $unsigned(wire6[(4'he):(1'h0)]) : wire5)));
              reg14 <= ({reg13[(2'h3):(1'h1)]} ?
                  (8'ha0) : ((wire8[(1'h0):(1'h0)] & (^{wire7,
                      wire6})) * $unsigned(wire1)));
            end
          else
            begin
              reg12 <= reg12;
              reg13 <= reg14;
              reg14 <= $unsigned((($unsigned(wire1) ?
                  $signed($unsigned((7'h43))) : wire5) ^~ ({(reg9 ^~ (8'hbf))} ?
                  $signed($signed(reg12)) : wire2)));
              reg15 <= wire8[(1'h1):(1'h1)];
            end
        end
      reg16 <= $unsigned(((wire0[(4'ha):(3'h4)] ? wire5 : (&{wire7, wire4})) ?
          (^~$signed((^(8'ha3)))) : (wire6[(5'h10):(3'h5)] != (wire6 ?
              ((8'hbf) || wire1) : (wire3 ? reg15 : wire2)))));
    end
  assign wire17 = ($unsigned({((reg9 - reg10) && reg12[(3'h5):(2'h2)]),
                          ((+wire8) ?
                              (reg10 + (8'hbc)) : {(8'ha0), (8'h9c)})}) ?
                      (~&((!wire8[(1'h0):(1'h0)]) >> reg16)) : ($unsigned((~^wire6)) && ({{reg13,
                                  wire0}} ?
                          $signed((reg9 ? (8'hb6) : reg16)) : wire8)));
  assign wire18 = (^~$unsigned((~^$unsigned(wire4[(4'hf):(2'h3)]))));
  assign wire19 = (wire7[(1'h1):(1'h1)] > $unsigned($unsigned((~^$unsigned(wire17)))));
  assign wire20 = wire6[(3'h6):(1'h1)];
  assign wire21 = $unsigned(((reg16[(2'h2):(1'h0)] ? $signed((8'ha3)) : reg16) ?
                      $unsigned(($signed((7'h41)) - wire4[(2'h3):(1'h0)])) : $unsigned(wire7)));
  assign wire22 = wire17[(1'h1):(1'h1)];
  module23 #() modinst107 (wire106, clk, wire4, wire21, wire1, wire8);
  assign wire108 = wire6[(3'h7):(3'h4)];
  assign wire109 = $signed(wire0);
endmodule

module module23
#(parameter param104 = (~^(~(~&((7'h42) ? ((8'had) || (8'hb2)) : ((8'hba) <= (8'hb6)))))), 
parameter param105 = param104)
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h23d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire signed [(3'h7):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire103;
  wire signed [(4'hc):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  assign y = {wire103,
                 wire89,
                 wire88,
                 wire87,
                 wire70,
                 wire69,
                 wire64,
                 wire62,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
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
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire28 = wire25[(1'h1):(1'h1)];
  assign wire29 = wire25[(1'h0):(1'h0)];
  assign wire30 = (|$unsigned((8'hbf)));
  assign wire31 = ($unsigned((wire27 ^~ $unsigned($unsigned(wire26)))) ?
                      wire29[(3'h6):(1'h1)] : wire24);
  assign wire32 = wire29[(1'h1):(1'h0)];
  assign wire33 = (^~((~^(~$signed(wire28))) ^~ wire29));
  assign wire34 = {((wire33 == $signed((wire32 ?
                          wire26 : wire33))) >> $signed(wire24[(1'h1):(1'h1)])),
                      {(!(~&((8'h9c) ? wire26 : (8'ha1)))), wire30}};
  module35 #() modinst63 (.clk(clk), .wire37(wire34), .wire39(wire33), .wire36(wire31), .wire38(wire25), .y(wire62));
  assign wire64 = wire30[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg65 <= wire27[(1'h0):(1'h0)];
      reg66 <= $unsigned(($signed(wire33[(4'h9):(3'h7)]) ?
          reg65[(5'h10):(1'h0)] : (~^({wire64,
              wire34} <<< wire27[(2'h3):(1'h1)]))));
      reg67 <= $unsigned((-reg66));
      reg68 <= (wire30 ?
          (&($unsigned((&wire33)) == wire34[(3'h4):(2'h2)])) : wire27[(1'h0):(1'h0)]);
    end
  assign wire69 = wire34[(3'h7):(2'h2)];
  assign wire70 = (reg65[(4'h9):(1'h0)] << $signed((~($signed(reg67) ?
                      (wire34 ? wire69 : wire34) : (|(8'hb9))))));
  always
    @(posedge clk) begin
      reg71 <= (8'hb4);
      reg72 <= $unsigned({wire25,
          (((wire64 <<< reg68) ?
              wire27[(2'h2):(1'h1)] : (wire26 & wire34)) >>> (wire33 * $signed((8'h9c))))});
      if ((8'h9d))
        begin
          if (reg67)
            begin
              reg73 <= $signed($unsigned(wire32[(4'hb):(2'h3)]));
              reg74 <= $signed(wire30);
              reg75 <= reg67[(2'h2):(1'h0)];
            end
          else
            begin
              reg73 <= wire62[(2'h3):(2'h3)];
              reg74 <= (~{({wire64, $signed(wire69)} >>> (~&wire70)),
                  $signed((~|$unsigned(wire28)))});
              reg75 <= wire62;
              reg76 <= (wire64[(3'h6):(3'h6)] ?
                  ((+(~&(+wire24))) ?
                      reg73[(3'h5):(3'h5)] : reg73) : $signed($unsigned($unsigned((wire33 << wire69)))));
              reg77 <= (!({(8'h9c)} ?
                  (wire31[(4'ha):(1'h1)] ?
                      (reg65 ?
                          (wire69 == wire27) : $unsigned(wire70)) : $signed($unsigned((8'hbe)))) : wire62));
            end
          if (wire64[(2'h3):(1'h1)])
            begin
              reg78 <= {((&wire64[(3'h4):(3'h4)]) >= (((~^wire29) & $signed(reg73)) ?
                      $unsigned((reg75 * reg65)) : $signed($unsigned(wire64)))),
                  wire28};
              reg79 <= ((((~&wire33) || wire24) ^~ $unsigned(((8'h9c) ?
                      reg66 : reg71))) ?
                  wire30 : (((~|{reg73}) <<< $unsigned({wire34, reg74})) ?
                      ($unsigned({wire30, reg74}) | ($unsigned(reg78) ?
                          reg71 : ((8'ha3) >>> wire30))) : $unsigned(reg67)));
              reg80 <= ({$signed(($signed((8'ha7)) ^ (wire31 && wire28))),
                      (+$unsigned((^wire24)))} ?
                  wire33[(2'h2):(2'h2)] : (~(8'h9e)));
              reg81 <= ((8'hba) && wire30[(3'h4):(1'h1)]);
            end
          else
            begin
              reg78 <= ($signed($signed(($unsigned(wire33) ?
                      (reg75 + wire30) : (wire64 ? wire70 : wire25)))) ?
                  ({(reg67[(1'h1):(1'h0)] >>> wire62),
                      wire62[(1'h1):(1'h0)]} >> reg79[(1'h1):(1'h0)]) : (~$unsigned({$signed(reg73)})));
            end
          reg82 <= (reg81 ?
              (({(wire33 >> wire33)} ?
                      wire28[(2'h3):(2'h3)] : (~^(wire28 | reg72))) ?
                  $unsigned({reg80,
                      (reg66 != wire25)}) : (-wire26[(3'h6):(3'h6)])) : {wire62,
                  $unsigned(({reg75, reg75} ~^ wire64[(1'h0):(1'h0)]))});
          reg83 <= $unsigned(($unsigned($signed((8'hbf))) ?
              $unsigned(($signed(wire34) ?
                  reg79 : (wire64 ? wire32 : wire25))) : reg77));
          reg84 <= ((+$unsigned(((wire29 ? wire69 : reg81) ?
              $signed(reg82) : wire29))) ^~ reg73);
        end
      else
        begin
          reg73 <= $unsigned((|reg75[(3'h5):(1'h0)]));
          reg74 <= wire70[(1'h1):(1'h1)];
          reg75 <= (|((7'h43) | reg72));
          reg76 <= wire64[(2'h3):(1'h0)];
        end
      reg85 <= {$signed((($signed(reg67) ?
                  reg80[(1'h1):(1'h1)] : (reg83 ? reg74 : reg68)) ?
              ((~^reg74) | $signed(wire64)) : ($unsigned(wire25) ^~ (~^wire27))))};
      reg86 <= {reg85[(1'h1):(1'h1)]};
    end
  assign wire87 = (&$signed(wire70[(1'h1):(1'h0)]));
  assign wire88 = reg84[(5'h12):(2'h2)];
  assign wire89 = reg74;
  always
    @(posedge clk) begin
      reg90 <= reg67;
      reg91 <= (((~|(8'h9f)) == (($unsigned(reg65) ?
                  (wire64 << wire70) : $unsigned((8'hbe))) ?
              ((reg84 & reg83) ?
                  wire33 : (&wire32)) : $signed($unsigned((8'hb3))))) ?
          (8'hab) : (|wire30[(2'h2):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg92 <= (^(wire70[(1'h0):(1'h0)] ?
          $unsigned(wire89[(4'hb):(4'hb)]) : $unsigned(reg86)));
      if ((reg91 ~^ (((&(reg82 ? reg82 : reg71)) ?
          (reg91[(3'h7):(3'h7)] ?
              $unsigned(reg77) : $signed((8'hb1))) : wire28[(1'h0):(1'h0)]) == {reg91,
          wire24})))
        begin
          if ($signed(reg67))
            begin
              reg93 <= $signed($unsigned((reg73 & (+(~&reg66)))));
            end
          else
            begin
              reg93 <= ((((((8'hb9) + wire34) >= (reg80 >>> (7'h43))) && ($unsigned(reg73) >>> (reg79 & reg86))) | (~&$unsigned((~|reg85)))) > ({((^(8'ha1)) & (-wire25))} ?
                  wire69 : $signed(({wire69} ? $unsigned(wire89) : (8'haa)))));
            end
          reg94 <= $unsigned(((^~wire88) | $unsigned($unsigned($signed((8'haf))))));
          reg95 <= (8'h9c);
        end
      else
        begin
          reg93 <= $unsigned((8'ha6));
          reg94 <= (^$signed(wire34[(1'h0):(1'h0)]));
        end
      reg96 <= reg67[(2'h2):(1'h0)];
      if (wire89[(2'h3):(1'h0)])
        begin
          if ($unsigned({reg66[(3'h6):(1'h1)]}))
            begin
              reg97 <= reg84;
              reg98 <= (8'had);
              reg99 <= $unsigned(($unsigned($signed((reg72 ^ wire62))) >> ($unsigned($unsigned(reg84)) ?
                  $signed((8'ha0)) : $unsigned(reg65))));
              reg100 <= $unsigned({reg80[(3'h6):(2'h3)], $unsigned((~^reg79))});
              reg101 <= wire64[(1'h0):(1'h0)];
            end
          else
            begin
              reg97 <= (|reg72);
              reg98 <= $unsigned($unsigned(((reg83 ?
                  wire31 : reg75) - ($unsigned(reg99) ?
                  $signed(reg101) : (reg67 ? reg101 : wire34)))));
              reg99 <= wire64;
              reg100 <= (reg86 <<< (&(^((&reg100) >= $unsigned(wire31)))));
            end
        end
      else
        begin
          reg97 <= (8'h9e);
          reg98 <= reg101;
        end
      reg102 <= $signed({(((reg100 != wire26) ?
                  (wire62 ? (8'ha9) : (8'h9d)) : reg93[(1'h0):(1'h0)]) ?
              $signed($signed(reg90)) : reg65[(4'h8):(3'h5)])});
    end
  assign wire103 = (({{reg101}} || reg99[(1'h1):(1'h1)]) ?
                       (wire25 ?
                           ($unsigned((8'h9d)) ^ ((wire89 - wire31) ^ {wire89})) : reg98[(4'he):(3'h5)]) : ($unsigned(($unsigned(reg99) ?
                           (~&reg100) : wire25)) * (^$unsigned((~|wire87)))));
endmodule

module module35
#(parameter param60 = ((((~^((8'ha9) ? (7'h42) : (8'ha5))) ? {((8'hb9) <= (8'h9e)), ((8'h9c) ? (8'ha0) : (8'ha1))} : {((8'hbf) ? (8'hbf) : (8'hbd)), (-(8'hbc))}) ? (~&(((7'h44) >> (8'ha8)) ^ (!(8'ha9)))) : ((((8'hb8) * (7'h42)) ? (~(8'hb9)) : ((8'hb8) - (8'hb9))) ~^ (((8'ha9) ? (7'h42) : (8'ha1)) == {(8'hb7), (8'hac)}))) >> (((^((8'h9d) * (8'hb0))) & {((7'h42) ^ (8'had)), ((8'h9c) >= (8'h9e))}) ? (&(-((8'hb4) - (8'ha5)))) : {(((8'hbf) < (8'hb4)) == (+(8'hae))), (+((8'ha8) ? (8'hb0) : (8'hb5)))})), 
parameter param61 = (8'hbf))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire39;
  input wire signed [(4'hb):(1'h0)] wire38;
  input wire [(3'h5):(1'h0)] wire37;
  input wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  assign y = {wire59,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire42,
                 wire41,
                 wire40,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire40 = (|($signed($unsigned(wire37)) ?
                      (($signed(wire39) >= (wire36 > wire39)) ?
                          wire37[(1'h0):(1'h0)] : (wire39[(1'h1):(1'h0)] ?
                              (wire39 ?
                                  wire37 : wire36) : wire38[(3'h4):(1'h1)])) : wire39[(3'h4):(1'h0)]));
  assign wire41 = $signed($unsigned(wire38[(4'h8):(4'h8)]));
  assign wire42 = (8'hb3);
  always
    @(posedge clk) begin
      reg43 <= wire36;
      reg44 <= wire38[(1'h0):(1'h0)];
    end
  assign wire45 = (wire37[(3'h4):(1'h1)] << ((($unsigned((8'had)) ~^ $signed(wire40)) ?
                          $unsigned((wire40 ?
                              wire36 : wire39)) : ((-wire41) * $unsigned(wire36))) ?
                      (8'hbc) : wire36[(4'h8):(3'h7)]));
  assign wire46 = (8'hb6);
  assign wire47 = (+{($signed((7'h44)) ?
                          wire38[(1'h1):(1'h0)] : reg44[(4'h8):(3'h4)])});
  assign wire48 = $unsigned(((reg43 ?
                      (8'h9e) : (^~(reg43 ?
                          (8'ha4) : wire38))) + ((reg44 * wire47[(3'h7):(3'h4)]) ?
                      (wire45 << (&(8'hb0))) : {wire37[(1'h1):(1'h0)]})));
  assign wire49 = (reg43 ? wire37 : $unsigned(wire37));
  always
    @(posedge clk) begin
      if (($unsigned(($signed(wire41[(3'h4):(1'h1)]) > (~^reg43))) ?
          (&$unsigned((&wire47[(2'h2):(1'h1)]))) : wire46[(3'h7):(2'h3)]))
        begin
          reg50 <= (wire48[(4'hd):(4'h9)] - $signed(({reg44,
              (+wire41)} <= $unsigned((wire38 & wire45)))));
          if ($signed(wire36))
            begin
              reg51 <= $unsigned(wire41[(2'h3):(1'h1)]);
            end
          else
            begin
              reg51 <= {$unsigned(wire41)};
              reg52 <= wire39[(3'h5):(1'h0)];
              reg53 <= ((wire37 * wire47) || $unsigned((wire49 ?
                  (wire47 || reg51) : (8'hb1))));
              reg54 <= wire41;
            end
          reg55 <= (($signed(reg51) ?
              ($signed({reg51}) | wire40[(1'h0):(1'h0)]) : $unsigned({$signed(wire42),
                  $unsigned(wire36)})) ~^ (!(^(~&(reg50 || wire41)))));
        end
      else
        begin
          reg50 <= {(~|$signed(wire36[(5'h13):(4'h9)]))};
          reg51 <= ((-{reg54}) >= (-(8'hb1)));
        end
      reg56 <= $signed((&$unsigned($unsigned(reg50))));
      reg57 <= wire40;
      reg58 <= wire36[(4'h9):(4'h9)];
    end
  assign wire59 = $unsigned((&$unsigned(wire41)));
endmodule
