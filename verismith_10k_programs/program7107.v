module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire100;
  reg signed [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  assign y = {wire107,
                 wire103,
                 wire102,
                 wire100,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  module5 #() modinst101 (wire100, clk, wire1, wire2, wire0, wire4, wire3);
  assign wire102 = ($signed($unsigned(wire3)) ?
                       {(wire1 != wire3[(1'h1):(1'h0)]),
                           (~&((7'h43) - (wire4 && wire0)))} : wire100[(4'hc):(2'h3)]);
  assign wire103 = ({((wire102 ?
                           (wire2 ? wire2 : wire1) : (wire0 ?
                               wire100 : wire0)) | $unsigned((wire102 <= wire4)))} >= ($unsigned((wire4[(3'h6):(2'h3)] * (wire102 ?
                           wire1 : wire1))) ?
                       ($signed({(8'ha7), (8'ha4)}) ?
                           ($unsigned(wire4) >>> (wire3 <= (8'ha5))) : {$signed(wire4)}) : wire3));
  always
    @(posedge clk) begin
      reg104 <= $signed((~{(~^$signed(wire2)), {wire102, $unsigned(wire4)}}));
      reg105 <= wire2[(4'hd):(1'h0)];
      reg106 <= (($signed((reg104[(1'h1):(1'h0)] & (reg104 >= wire103))) != {{(wire3 ?
                  (8'hab) : (8'hbd)),
              {wire4}}}) >= $signed($unsigned(wire0)));
    end
  assign wire107 = (reg104 >> ({wire103[(5'h12):(2'h3)],
                           reg106[(4'hb):(1'h0)]} ?
                       $unsigned($unsigned($unsigned(wire100))) : $unsigned($signed($unsigned(wire102)))));
endmodule

module module5
#(parameter param98 = (-{(((-(8'haf)) <<< ((8'hb1) >> (7'h43))) << (~&((7'h43) <<< (8'h9e)))), (7'h42)}), 
parameter param99 = {(~(param98 >> {((8'hba) > param98), param98}))})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(4'h9):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire [(4'hb):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire40,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire11 = (((wire9 << (|(-wire10))) ?
                          (wire6[(1'h1):(1'h0)] ?
                              $signed($unsigned(wire6)) : $unsigned(wire9)) : $unsigned({$unsigned(wire9),
                              (wire10 ? wire10 : wire8)})) ?
                      {$unsigned($signed($unsigned(wire9)))} : (((~$signed(wire9)) ?
                          wire6[(4'h8):(3'h7)] : wire7[(2'h3):(2'h2)]) == (^~wire6)));
  assign wire12 = (wire9[(3'h7):(3'h7)] ^~ (-(($unsigned(wire7) < wire7[(4'ha):(1'h0)]) <<< (~|{wire10,
                      wire10}))));
  assign wire13 = $signed((&$signed(($unsigned(wire6) * (wire10 ?
                      wire10 : wire7)))));
  assign wire14 = ((wire12[(1'h1):(1'h0)] ?
                      wire8 : wire11) ^~ wire9[(3'h4):(1'h1)]);
  module15 #() modinst41 (.wire18(wire12), .wire19(wire14), .clk(clk), .wire16(wire7), .wire17(wire10), .y(wire40));
  module42 #() modinst86 (wire85, clk, wire10, wire11, wire40, wire7);
  assign wire87 = (wire14[(3'h5):(2'h3)] ?
                      $signed(((+wire10[(4'hf):(4'hd)]) ?
                          wire8[(4'ha):(3'h6)] : (wire10[(4'h9):(4'h9)] > wire9[(4'h8):(3'h5)]))) : {($unsigned((wire11 ?
                                  wire9 : (8'hb6))) ?
                              (~^(wire6 ?
                                  wire85 : wire10)) : $signed((wire7 >> wire12))),
                          ((wire85 ?
                              {wire11} : $unsigned((8'ha1))) <= wire7[(4'ha):(4'h9)])});
  assign wire88 = (~|$signed(wire87[(4'ha):(3'h5)]));
  assign wire89 = ((|$unsigned(wire9)) ?
                      $signed(((~^$unsigned((8'hb3))) && $signed((~^wire10)))) : wire7);
  assign wire90 = (((wire13[(1'h1):(1'h0)] ?
                              ($signed(wire8) >= {(8'ha1),
                                  wire14}) : (+$unsigned(wire8))) ?
                          wire11 : $signed(wire13)) ?
                      {wire9[(4'hc):(4'ha)],
                          $signed(((wire9 ? wire8 : (8'hb2)) ?
                              (8'hbb) : $signed((8'hab))))} : wire88);
  assign wire91 = ($unsigned(wire13) >>> {$signed(((~wire40) * (^wire40))),
                      ($unsigned(((8'hb0) ? wire12 : wire11)) ?
                          $unsigned((&wire40)) : ((wire10 ? wire8 : wire8) ?
                              (wire88 != wire40) : wire12))});
  assign wire92 = $unsigned((^~wire14));
  always
    @(posedge clk) begin
      reg93 <= ({wire6} ^ wire92);
      reg94 <= $signed({wire7[(4'hc):(4'ha)]});
    end
  assign wire95 = (~&(!wire92[(1'h1):(1'h0)]));
  assign wire96 = (((((|wire11) <= (~&wire12)) ?
                          $signed((^~wire6)) : $signed((^~wire90))) ?
                      ($unsigned($signed(wire87)) ?
                          wire92 : (wire10 | (&wire14))) : ((!{wire88}) ?
                          wire91 : (&(~&wire91)))) < wire13);
  assign wire97 = ($unsigned(($unsigned((wire6 ? (8'ha2) : (8'hb6))) ?
                          wire95[(3'h7):(3'h4)] : $signed((reg94 ?
                              wire12 : wire40)))) ?
                      wire90[(3'h4):(2'h3)] : wire89[(3'h6):(3'h6)]);
endmodule

module module42
#(parameter param83 = (({(^(!(8'h9f)))} ~^ ((((7'h43) ? (8'hb7) : (8'ha4)) ? {(8'hb7), (8'had)} : {(8'had), (8'hac)}) == (((8'ha6) * (8'ha9)) + {(8'ha5), (8'hb8)}))) ? {((((8'h9d) ? (8'ha4) : (8'ha2)) ? ((8'ha3) <= (8'had)) : ((8'hac) & (8'hb7))) ? (8'ha7) : (((8'hb8) ? (7'h44) : (8'hb0)) ? ((8'hb7) * (8'h9e)) : ((8'ha3) - (8'hb0)))), ((8'hac) < (((8'h9d) >>> (8'h9c)) ? ((8'ha4) ? (8'hae) : (7'h44)) : ((8'ha8) <= (8'hb8))))} : (~^((((7'h40) ? (8'hb2) : (8'ha8)) ? ((8'hbe) ? (8'hbf) : (8'hbe)) : ((7'h43) & (7'h40))) ? (((8'h9d) ? (8'hbd) : (7'h43)) ? (^(8'hbd)) : (&(8'hbd))) : (8'hb9)))), 
parameter param84 = (&param83))
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire46;
  input wire signed [(2'h3):(1'h0)] wire45;
  input wire signed [(5'h15):(1'h0)] wire44;
  input wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
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
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire47 = {$signed((-wire46)), wire45[(2'h3):(1'h1)]};
  assign wire48 = $unsigned((wire44[(3'h6):(1'h1)] & wire44[(4'h8):(1'h0)]));
  assign wire49 = $unsigned((($signed((wire47 == wire43)) != $signed((wire46 | wire44))) << wire48[(4'ha):(4'h9)]));
  assign wire50 = ((!wire48[(3'h7):(3'h7)]) ?
                      wire48 : $signed(($signed(wire49[(3'h7):(3'h4)]) << ((wire46 ?
                              wire48 : wire48) ?
                          wire45[(2'h2):(1'h0)] : $signed((8'hb2))))));
  assign wire51 = ($unsigned($unsigned($unsigned({(8'hab)}))) ?
                      $unsigned($unsigned(wire49[(5'h12):(4'h9)])) : (((~&(wire43 ?
                              wire49 : wire47)) ?
                          wire49 : wire45) ^~ (($unsigned(wire50) ?
                              (wire50 || wire46) : wire47[(4'ha):(3'h7)]) ?
                          wire46 : $signed(wire44[(5'h11):(4'ha)]))));
  assign wire52 = ((+($signed(wire48[(4'hb):(3'h6)]) ?
                          ($signed(wire51) < $unsigned(wire51)) : $signed((wire49 ?
                              wire49 : (8'ha4))))) ?
                      {(~|(+$signed(wire43))), wire47} : wire45[(2'h3):(1'h0)]);
  assign wire53 = (8'hb5);
  always
    @(posedge clk) begin
      reg54 <= (wire48 >> (8'haa));
      if (wire48)
        begin
          reg55 <= (~&((~^$unsigned({wire51})) || (~^((~&(8'ha0)) ?
              (~|wire48) : (reg54 & (8'ha5))))));
          if (reg55)
            begin
              reg56 <= (|wire53);
            end
          else
            begin
              reg56 <= ((|((!wire49) ?
                      $signed($signed(wire53)) : (!{wire43, wire50}))) ?
                  {(wire52 >>> $unsigned($unsigned(wire47)))} : (~^$unsigned(wire48[(3'h6):(1'h1)])));
            end
          reg57 <= (|wire45[(2'h2):(1'h1)]);
          reg58 <= $unsigned($unsigned((~^$unsigned(wire51[(1'h1):(1'h0)]))));
        end
      else
        begin
          reg55 <= wire52;
          if (reg57[(3'h4):(1'h0)])
            begin
              reg56 <= (($unsigned((-wire43[(3'h4):(2'h2)])) ?
                      (((reg58 ~^ reg54) == (&wire52)) <<< ({wire44, reg55} ?
                          wire50[(4'hc):(1'h0)] : wire48[(2'h2):(2'h2)])) : $signed(wire48[(2'h3):(1'h0)])) ?
                  {wire43[(2'h3):(2'h2)]} : $signed(((&$unsigned(wire45)) ?
                      (8'hab) : (~{reg54, wire49}))));
            end
          else
            begin
              reg56 <= $signed(($signed($unsigned((|wire53))) << ((~(wire50 ?
                  (8'hba) : reg54)) & {reg56[(3'h4):(2'h3)],
                  $signed(wire51)})));
              reg57 <= $unsigned($signed((wire53[(4'hc):(4'h8)] ^~ $unsigned({wire51,
                  wire49}))));
            end
          reg58 <= $signed(wire45);
        end
      reg59 <= (~|(~$unsigned(($unsigned((8'hb5)) ?
          {reg58} : $unsigned((8'hab))))));
      if ((^(reg56 ^~ $signed(reg59))))
        begin
          reg60 <= $signed(wire43[(4'hb):(3'h7)]);
          reg61 <= $unsigned(reg56[(1'h0):(1'h0)]);
          if ((($unsigned((wire43 ?
                  (reg57 ? reg59 : wire47) : (reg57 != wire51))) ?
              reg57 : $unsigned((((8'ha9) | reg59) << $unsigned((8'ha3))))) && (^reg56)))
            begin
              reg62 <= (~&wire47[(4'hf):(3'h5)]);
            end
          else
            begin
              reg62 <= (reg57 ?
                  ((wire43[(4'hb):(4'h8)] >>> (^~(^wire44))) + ({reg59} < $signed($signed(wire43)))) : reg60);
              reg63 <= wire44;
            end
        end
      else
        begin
          reg60 <= {(8'had)};
          reg61 <= ($unsigned({$signed($signed(reg57)),
              (8'h9c)}) ^~ {{{{wire51}},
                  ((wire44 ? wire48 : wire52) ?
                      wire49[(2'h3):(2'h2)] : $signed((8'ha7)))},
              (reg54 & $unsigned((reg56 ? (8'hb3) : wire45)))});
          reg62 <= (reg60[(4'h9):(3'h5)] ?
              {wire46[(4'hf):(4'hb)]} : $unsigned(($signed($signed(wire46)) < $unsigned((8'hac)))));
        end
      reg64 <= $unsigned(reg55[(3'h4):(1'h0)]);
    end
  assign wire65 = $unsigned($unsigned($signed((wire52 ?
                      (wire49 ? wire44 : wire43) : reg64))));
  assign wire66 = ((reg54 <<< ($unsigned((-(8'hb4))) ?
                      $unsigned((wire44 ?
                          wire52 : reg60)) : ((wire45 || reg64) ?
                          ((8'ha7) ?
                              reg55 : wire44) : (8'ha3)))) >> (|{reg55}));
  assign wire67 = (8'hb9);
  assign wire68 = ((((|{reg54,
                      reg59}) <<< (~^wire44[(4'hc):(4'h8)])) - ((wire47 < $unsigned(wire46)) ?
                      (!(~|wire46)) : wire51[(4'h8):(3'h6)])) <= (!(^~$signed(((8'h9f) <<< (8'hb1))))));
  assign wire69 = {{(^reg59)}};
  assign wire70 = wire43;
  always
    @(posedge clk) begin
      if ($signed($signed({$unsigned((8'h9f)), reg54})))
        begin
          reg71 <= reg58;
          reg72 <= $unsigned((-wire70));
          reg73 <= (&(wire65 ?
              {((-wire51) | (~|(8'hb0))), wire48} : (^~((reg57 ?
                      wire69 : wire43) ?
                  (reg71 ? (7'h43) : reg60) : (wire43 > reg71)))));
        end
      else
        begin
          if ($unsigned((-(-reg62))))
            begin
              reg71 <= (reg72[(4'he):(3'h6)] ? $unsigned(wire53) : reg59);
            end
          else
            begin
              reg71 <= $unsigned((~|(+$unsigned(wire47[(4'hf):(3'h7)]))));
              reg72 <= $unsigned($signed($signed({{reg61},
                  ((8'hb4) ? wire45 : wire70)})));
              reg73 <= (-(wire53[(4'ha):(3'h7)] ?
                  (wire45 ?
                      reg63[(2'h2):(1'h0)] : ((&reg61) | (reg59 & wire49))) : reg72));
            end
          reg74 <= $signed($unsigned(reg71[(4'hd):(4'ha)]));
          if ((~&(~&$unsigned($signed(reg74[(4'h9):(1'h0)])))))
            begin
              reg75 <= (^reg58);
              reg76 <= reg75[(4'hb):(3'h5)];
              reg77 <= $unsigned({($signed(wire53[(1'h1):(1'h1)]) ?
                      ((reg57 ? reg57 : wire51) ?
                          $unsigned(wire69) : (reg57 && reg73)) : reg71)});
              reg78 <= wire67[(5'h12):(4'hf)];
              reg79 <= wire65[(1'h0):(1'h0)];
            end
          else
            begin
              reg75 <= wire51[(4'hb):(4'h9)];
              reg76 <= {reg71,
                  (~(((!wire49) ?
                      (reg73 != wire43) : $signed((8'hae))) | reg61))};
            end
          if ((wire47[(3'h5):(2'h2)] * (^reg71)))
            begin
              reg80 <= ($unsigned($unsigned((reg77 + reg64))) ?
                  $signed((+wire66)) : (+(~^wire53)));
              reg81 <= (wire50 ~^ wire65);
              reg82 <= $unsigned(((wire66 ?
                      {reg78} : $signed({wire47, wire67})) ?
                  $unsigned($unsigned((reg80 ?
                      reg57 : reg55))) : reg77[(1'h1):(1'h1)]));
            end
          else
            begin
              reg80 <= {(^(~&$unsigned((reg61 ? reg54 : wire45)))),
                  {((-(8'hb9)) ~^ $unsigned({(8'ha3)}))}};
              reg81 <= (~&($signed(wire46) ?
                  ((7'h44) + {(reg78 ? reg76 : wire53)}) : wire47));
            end
        end
    end
endmodule

module module15
#(parameter param38 = (7'h40), 
parameter param39 = (((|(+{param38})) <= (((param38 ? (8'ha0) : param38) ? param38 : (7'h43)) < {(!param38), param38})) + ((((|param38) <<< (8'hb9)) ? (8'haa) : param38) ? ((param38 == {param38}) ? ({(7'h42), param38} ? (+(8'h9c)) : (param38 ? param38 : param38)) : ((param38 ? param38 : param38) ? (param38 ? param38 : param38) : (~|param38))) : (~((param38 ? (8'hb7) : param38) >>> {param38})))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(3'h5):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 (1'h0)};
  assign wire20 = $signed((~&$unsigned((wire17 && wire17[(3'h5):(3'h4)]))));
  assign wire21 = $unsigned(wire17[(1'h0):(1'h0)]);
  assign wire22 = wire20[(4'hb):(3'h7)];
  assign wire23 = ($unsigned({{{wire19}, wire16}}) ?
                      (!(~^(!$signed(wire17)))) : (~&wire18));
  assign wire24 = wire16[(3'h4):(2'h2)];
  assign wire25 = wire16;
  assign wire26 = wire22[(3'h5):(2'h3)];
  assign wire27 = wire19[(3'h4):(2'h2)];
  assign wire28 = ($unsigned(wire26[(1'h1):(1'h0)]) ?
                      wire21[(4'h8):(2'h2)] : $unsigned(wire22[(2'h3):(2'h2)]));
  assign wire29 = $unsigned(wire27[(5'h14):(5'h10)]);
  assign wire30 = wire20;
  assign wire31 = (&($unsigned(wire18[(2'h2):(2'h2)]) >> $signed($signed($unsigned(wire28)))));
  assign wire32 = {$signed(wire17),
                      $signed((wire18 ?
                          $unsigned((!(8'hb4))) : (wire27[(1'h0):(1'h0)] ?
                              {wire26} : $signed(wire27))))};
  assign wire33 = wire21;
  assign wire34 = {($unsigned({$signed(wire22)}) || ($unsigned(wire21[(3'h7):(3'h5)]) ?
                          $unsigned(wire17) : {(8'hb1),
                              (wire25 ? wire18 : wire24)})),
                      wire24};
  assign wire35 = wire27;
  assign wire36 = wire27;
  assign wire37 = (-$signed((&wire24)));
endmodule
