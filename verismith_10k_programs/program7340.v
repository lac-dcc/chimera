module top
#(parameter param100 = {(((~&(+(8'hb5))) ? ((~&(8'had)) ? ((8'ha4) & (8'ha3)) : (~^(8'h9c))) : (((7'h43) && (8'ha3)) ? ((8'h9e) ? (7'h42) : (8'had)) : ((8'hb7) ? (7'h43) : (8'hb1)))) <= ((((8'ha0) ? (7'h40) : (8'hbd)) ? (8'hb8) : {(8'hb0), (7'h44)}) && (!((8'hb1) <<< (8'hb8))))), (((~&((8'ha0) > (8'h9f))) ? ({(8'hbd)} & ((8'hb0) ~^ (7'h44))) : {((8'ha9) >= (8'hba))}) ? (((~^(7'h43)) ? ((8'ha0) ? (8'hb2) : (8'had)) : ((8'ha5) >>> (7'h40))) ? (&((8'ha4) && (8'ha2))) : (((8'hb8) ? (8'hab) : (8'hb4)) ? ((8'ha5) ? (8'hb5) : (8'ha0)) : ((8'hba) <<< (8'hb0)))) : (8'hab))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire79;
  reg signed [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire79,
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
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  module5 #() modinst80 (wire79, clk, wire2, wire3, wire1, wire0, wire4);
  assign wire81 = (8'hb5);
  assign wire82 = ((($unsigned($signed(wire0)) ^ wire79) >>> $signed(wire3)) ?
                      wire4[(5'h13):(4'hc)] : (~&(wire4 ?
                          $signed($unsigned(wire0)) : {(~&wire81), wire81})));
  always
    @(posedge clk) begin
      reg83 <= wire82;
      if ({$unsigned(wire81[(2'h2):(2'h2)])})
        begin
          if (($unsigned((~^(^~(wire1 ?
              wire1 : wire82)))) ^~ ((~&$signed($unsigned(wire81))) ~^ ((~&(wire81 ?
              (7'h40) : wire0)) >>> (~((8'haa) >>> (8'hbc)))))))
            begin
              reg84 <= wire2;
              reg85 <= wire3[(2'h2):(1'h0)];
              reg86 <= wire0[(4'hb):(4'h8)];
              reg87 <= $unsigned(wire2[(4'h8):(2'h3)]);
            end
          else
            begin
              reg84 <= reg85;
              reg85 <= $signed((~^reg86[(3'h7):(3'h5)]));
            end
          if ($unsigned((wire2[(3'h7):(2'h3)] ?
              $unsigned((^$signed(reg84))) : wire1)))
            begin
              reg88 <= $signed(wire81[(1'h0):(1'h0)]);
              reg89 <= (reg84 + (&$unsigned(((wire82 ?
                  reg88 : wire79) - $signed(wire1)))));
              reg90 <= wire4;
              reg91 <= (^$unsigned((~$signed((wire0 ? wire0 : wire2)))));
            end
          else
            begin
              reg88 <= {$signed(($signed($unsigned(wire3)) ?
                      reg86 : $unsigned($signed(wire4)))),
                  {$signed(reg90[(3'h7):(3'h6)]),
                      (wire0 >> $unsigned(reg84[(1'h1):(1'h0)]))}};
            end
          reg92 <= reg91;
        end
      else
        begin
          if ($unsigned($signed($signed(reg86[(2'h2):(1'h1)]))))
            begin
              reg84 <= reg87;
              reg85 <= (((wire4[(2'h2):(1'h0)] ?
                      ((reg86 ? (8'had) : reg85) ?
                          $unsigned(wire82) : (!(8'ha2))) : reg86) ?
                  wire82[(4'hf):(4'hb)] : (8'hb3)) ^ $unsigned({((^reg85) || $unsigned(reg86))}));
              reg86 <= (((reg92 * ((reg83 < reg85) ?
                  reg86 : (wire0 ~^ wire4))) ~^ $signed((~^(reg86 || reg91)))) ~^ (~|$signed((!reg92))));
              reg87 <= (-$signed(reg85));
              reg88 <= (&wire79[(4'h8):(3'h6)]);
            end
          else
            begin
              reg84 <= wire4;
              reg85 <= (~&wire3);
              reg86 <= $signed((wire79 ?
                  {($unsigned(reg84) ? wire0[(4'hb):(4'h9)] : $unsigned(wire1)),
                      reg84[(2'h2):(1'h0)]} : (~&reg88)));
              reg87 <= (($signed(reg90) ?
                      (~^wire81) : ((-reg84) | $signed(reg88[(1'h0):(1'h0)]))) ?
                  wire79 : ((-(~$signed(reg86))) ^~ reg88[(2'h2):(1'h1)]));
            end
        end
      reg93 <= (8'hbd);
    end
  always
    @(posedge clk) begin
      if (wire79)
        begin
          reg94 <= reg93[(1'h1):(1'h0)];
        end
      else
        begin
          reg94 <= reg92[(3'h7):(3'h4)];
          if ((~&wire81))
            begin
              reg95 <= $signed({(~$signed(((7'h40) >> wire82))),
                  wire0[(5'h10):(4'ha)]});
              reg96 <= $signed({((-reg93[(1'h1):(1'h1)]) >> ((reg84 | wire2) <<< (reg88 <<< wire81))),
                  ((reg93 & $signed(wire82)) ^~ $signed(reg90))});
              reg97 <= $unsigned(((reg88 - reg94) == ((!{reg90,
                  wire2}) ^~ $signed(wire79[(4'h8):(4'h8)]))));
              reg98 <= $unsigned($signed($unsigned((&(|reg96)))));
            end
          else
            begin
              reg95 <= $signed((((&(~|reg87)) ?
                  reg94 : reg95[(1'h0):(1'h0)]) <= $unsigned((&$signed(reg93)))));
            end
        end
      reg99 <= reg90;
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire53;
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  assign y = {wire38,
                 wire13,
                 wire12,
                 wire11,
                 wire40,
                 wire53,
                 reg78,
                 reg77,
                 reg76,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire11 = ($signed($signed($signed(wire6))) == (wire9 ?
                      (wire7 >= $unsigned((8'ha5))) : $unsigned((wire7 & (~wire7)))));
  assign wire12 = wire8;
  assign wire13 = (8'ha6);
  module14 #() modinst39 (.wire15(wire12), .clk(clk), .wire16(wire6), .wire18(wire11), .wire19(wire13), .y(wire38), .wire17(wire10));
  assign wire40 = (8'hbc);
  module41 #() modinst54 (wire53, clk, wire13, wire6, wire12, wire7, wire38);
  always
    @(posedge clk) begin
      reg55 <= $signed((wire12[(3'h7):(2'h2)] ~^ (^wire12)));
      if ($unsigned((~&(wire38[(4'hb):(2'h3)] <<< ({wire13} ?
          wire53[(1'h1):(1'h0)] : (8'hb9))))))
        begin
          if (wire38)
            begin
              reg56 <= $unsigned(((~wire12[(4'he):(4'h8)]) ?
                  $signed(wire40[(5'h13):(3'h6)]) : {$signed((wire8 && wire6)),
                      $unsigned((wire10 ^~ (8'ha4)))}));
              reg57 <= {(&$unsigned(((wire11 <= (8'hac)) <<< (^wire12)))),
                  $unsigned(($unsigned({wire38, (8'hb9)}) >> (-{wire8})))};
            end
          else
            begin
              reg56 <= reg57[(3'h6):(2'h3)];
              reg57 <= wire53[(1'h0):(1'h0)];
              reg58 <= (&(8'ha9));
            end
        end
      else
        begin
          reg56 <= (({{reg55[(3'h4):(1'h1)]}, (8'hba)} >> (~wire9)) ?
              (!wire9) : ((($unsigned(reg55) ? $signed(wire9) : wire40) ?
                      {(wire6 ? wire9 : wire8)} : wire38[(4'h8):(3'h7)]) ?
                  $unsigned(((reg58 * reg56) ^ (wire38 + wire9))) : (-wire10[(3'h7):(3'h7)])));
          reg57 <= {({($unsigned(wire8) && ((8'h9d) ? wire10 : wire11)),
                  wire12} >>> {{wire8[(2'h2):(1'h0)]}, wire13})};
          reg58 <= ((($unsigned((wire38 ?
                  wire6 : wire53)) >>> (reg57[(3'h6):(1'h0)] * wire11)) ?
              (($unsigned(reg55) ~^ $signed(reg57)) >> wire8) : wire53[(2'h2):(2'h2)]) | wire12);
          if (($signed($unsigned((((8'ha3) <= reg57) < (reg55 ?
                  (8'h9c) : wire12)))) ?
              $signed((~$unsigned(wire10))) : wire10[(4'h9):(2'h2)]))
            begin
              reg59 <= wire6[(4'hb):(3'h5)];
              reg60 <= wire38;
              reg61 <= $unsigned(wire10[(4'h8):(4'h8)]);
              reg62 <= $signed(($signed({wire40[(3'h4):(2'h3)]}) ~^ reg56[(4'h8):(2'h2)]));
              reg63 <= {$signed($signed(wire40[(3'h7):(3'h4)]))};
            end
          else
            begin
              reg59 <= (-wire11);
              reg60 <= $signed((^$signed($unsigned((reg63 ^~ reg62)))));
              reg61 <= ((reg61 ?
                  $signed($signed((8'h9d))) : reg61) <<< (reg61[(1'h0):(1'h0)] & {$unsigned(wire6),
                  ((reg62 || reg55) || reg62[(4'hd):(3'h6)])}));
              reg62 <= ({$signed(wire53)} ^ ($signed(({reg55, (8'hba)} ?
                  {wire8, wire13} : (!wire6))) | $unsigned((|(wire6 ?
                  wire12 : wire11)))));
              reg63 <= {(reg60[(3'h4):(2'h3)] ?
                      $signed((|(wire10 == wire9))) : reg61[(2'h3):(2'h3)])};
            end
        end
      reg64 <= (!reg56);
      if (wire12[(4'ha):(2'h2)])
        begin
          reg65 <= $unsigned((^(-((reg62 < wire38) & (wire53 ?
              wire9 : wire38)))));
          reg66 <= (~&({wire38} > (|wire12[(5'h11):(3'h6)])));
          reg67 <= (reg61 | (-wire6[(4'hc):(2'h3)]));
          reg68 <= (~^((($unsigned(reg61) ?
              wire6[(1'h0):(1'h0)] : ((7'h43) ?
                  wire13 : reg67)) >> $unsigned(((8'haa) ?
              (8'h9f) : wire8))) * ((wire53[(2'h3):(2'h3)] ^~ wire53[(2'h3):(2'h2)]) ^ (^~(+reg60)))));
        end
      else
        begin
          if (wire13[(4'hd):(4'hb)])
            begin
              reg65 <= ($unsigned($signed((&reg56))) <= (!(reg65 ?
                  (~&((8'ha2) ? wire11 : reg68)) : ($unsigned(wire13) ?
                      (reg58 ? reg63 : wire10) : wire12))));
              reg66 <= $unsigned(wire11[(1'h1):(1'h1)]);
              reg67 <= {reg58, (^~$signed((&((8'hbd) ? (8'haa) : wire40))))};
              reg68 <= (8'ha1);
              reg69 <= $signed(reg61[(2'h2):(2'h2)]);
            end
          else
            begin
              reg65 <= $unsigned(wire13[(3'h6):(3'h6)]);
            end
          if (reg63[(4'ha):(2'h2)])
            begin
              reg70 <= ({{(wire8 ? (8'ha0) : reg58[(1'h1):(1'h0)]),
                      $unsigned((^(8'hb6)))}} == reg61);
              reg71 <= reg61;
              reg72 <= $unsigned(reg71[(4'ha):(2'h2)]);
              reg73 <= ($signed(wire10[(2'h3):(2'h2)]) ?
                  $signed((wire6 == ((reg70 == reg67) ?
                      reg63[(4'hc):(2'h3)] : (reg67 ?
                          reg59 : wire13)))) : (~reg60));
              reg74 <= ($unsigned((reg61 ^ ((reg70 ?
                  wire13 : reg65) && (~|reg64)))) ^ reg72[(3'h4):(2'h3)]);
            end
          else
            begin
              reg70 <= $signed((~&(reg74[(4'ha):(4'ha)] ?
                  $unsigned($signed(reg61)) : $signed($unsigned(reg60)))));
              reg71 <= ((((^(reg65 ? reg59 : reg61)) ?
                          wire13[(1'h1):(1'h1)] : (~$unsigned(reg63))) ?
                      ((~^(reg57 <= wire8)) <= reg66[(2'h2):(1'h1)]) : $signed(reg63[(3'h7):(3'h7)])) ?
                  (({$signed(wire9)} || reg72[(1'h1):(1'h1)]) | reg59) : $signed(($unsigned(wire8[(2'h3):(1'h0)]) ?
                      wire6[(5'h14):(3'h6)] : reg57)));
              reg72 <= {reg62[(1'h0):(1'h0)], reg59};
            end
          if ((($signed(reg71[(3'h7):(3'h6)]) ?
                  (!(|$signed((8'hb4)))) : (({wire9} == $signed(wire13)) - reg58[(1'h0):(1'h0)])) ?
              $signed(wire10) : wire38[(3'h4):(3'h4)]))
            begin
              reg75 <= ({($unsigned((|wire13)) <= $signed($unsigned(reg64))),
                  reg70[(3'h7):(1'h0)]} - $signed($signed((reg64[(1'h1):(1'h0)] ?
                  (&reg56) : (reg66 ^ reg66)))));
              reg76 <= ($unsigned((reg64 * ({wire13, reg68} ?
                  reg67[(2'h2):(1'h0)] : (^(8'hb8))))) << reg67);
              reg77 <= (!$signed((8'ha5)));
            end
          else
            begin
              reg75 <= $unsigned(reg55);
              reg76 <= ((^~$unsigned(((wire40 ? wire40 : reg67) ?
                      reg71[(3'h4):(2'h2)] : reg55[(3'h5):(1'h1)]))) ?
                  reg75[(4'ha):(2'h2)] : ((|reg67) ~^ $unsigned((reg75 ?
                      {(8'ha0), wire12} : reg70[(1'h0):(1'h0)]))));
              reg77 <= {$signed($unsigned(wire13))};
              reg78 <= $unsigned(reg75[(1'h1):(1'h1)]);
            end
        end
    end
endmodule

module module41
#(parameter param51 = (8'hab), 
parameter param52 = (|param51))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h1b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire46;
  input wire signed [(5'h14):(1'h0)] wire45;
  input wire signed [(4'ha):(1'h0)] wire44;
  input wire [(3'h7):(1'h0)] wire43;
  input wire [(4'h9):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire47;
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  assign y = {wire49, wire47, reg50, reg48, (1'h0)};
  assign wire47 = (((~|$unsigned($signed(wire43))) ?
                          wire43[(3'h5):(3'h4)] : ($unsigned(wire45[(5'h12):(4'h8)]) >= $signed(wire43[(3'h5):(1'h0)]))) ?
                      wire43[(2'h2):(1'h1)] : (($signed((wire45 ~^ (8'hb9))) ?
                              $unsigned(wire44) : (^~(8'hab))) ?
                          (wire45[(5'h11):(1'h1)] ?
                              ((wire44 ? wire43 : wire45) ?
                                  (~wire42) : wire42) : ($signed(wire42) ?
                                  wire45[(4'hb):(1'h0)] : $signed(wire43))) : ({wire43,
                              (!wire43)} << (^wire45))));
  always
    @(posedge clk) begin
      reg48 <= wire46;
    end
  assign wire49 = wire47;
  always
    @(posedge clk) begin
      reg50 <= (wire42[(1'h1):(1'h0)] ? reg48 : $unsigned(wire42));
    end
endmodule

module module14
#(parameter param36 = ((((~^((8'h9c) > (8'ha4))) ? (^~(8'ha7)) : ((~(8'hb3)) ? ((8'hab) ? (8'ha1) : (8'h9e)) : ((8'hbc) ? (8'h9c) : (8'hab)))) ? ((((8'h9c) && (8'hb8)) ? ((8'haf) ^ (8'ha6)) : ((8'ha4) <= (8'had))) ? (^~(~^(8'hab))) : ((+(7'h44)) ^ ((8'hb1) ? (8'hb3) : (8'ha0)))) : (~((-(8'ha3)) ? (^(8'ha8)) : ((8'hb2) ? (8'ha0) : (8'hb9))))) << (~|({(^(7'h42)), ((7'h42) & (8'hb3))} ? (~|((8'hac) ? (8'ha8) : (8'haa))) : {(-(8'hac)), (|(8'ha9))}))), 
parameter param37 = (((!({param36, param36} ^~ (~param36))) <= {((~param36) ? (|param36) : ((8'had) >>> param36)), ({(8'h9e)} == (param36 < param36))}) >>> ((param36 ? (-(~|param36)) : ((param36 && param36) && (&param36))) && ((8'hb7) >> param36))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire18;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire28;
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire28,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= ($unsigned($signed($signed((wire19 && wire18)))) ?
          (^$unsigned(($unsigned(wire19) ?
              wire16 : wire15))) : (^~$signed((-wire17[(2'h3):(2'h3)]))));
      reg21 <= (+({({wire16} >>> $unsigned(wire18))} == wire16));
      if (wire18[(4'h8):(4'h8)])
        begin
          reg22 <= ({((~^(~|(8'hbc))) ?
                  {(reg21 || wire18)} : wire17)} | ($unsigned($unsigned(reg20[(2'h3):(1'h1)])) ?
              $signed(wire17) : $unsigned($unsigned(wire16))));
          reg23 <= (~|((wire18 ?
                  {{wire17, wire18},
                      reg20[(3'h6):(3'h5)]} : (wire17[(1'h1):(1'h0)] ?
                      $unsigned(reg21) : reg21[(1'h0):(1'h0)])) ?
              (~^wire16) : $unsigned($unsigned((wire15 << wire18)))));
          reg24 <= $signed(wire17);
        end
      else
        begin
          reg22 <= (wire17[(3'h7):(2'h2)] ? (8'hb7) : reg20);
          reg23 <= reg21;
          if ($signed(($signed((^(~^wire16))) ?
              reg23 : ((~wire16[(5'h10):(3'h4)]) <= wire15[(5'h11):(4'he)]))))
            begin
              reg24 <= {wire17[(1'h1):(1'h1)],
                  (~|$unsigned(({reg24} == (wire17 ? wire18 : wire15))))};
              reg25 <= (|(($signed((!(8'hba))) ^ reg22[(4'h9):(4'h8)]) << (^((reg20 ?
                      wire15 : (8'h9c)) ?
                  $unsigned(reg20) : reg22))));
              reg26 <= wire16[(4'h8):(1'h1)];
            end
          else
            begin
              reg24 <= $unsigned((-$unsigned(reg24[(3'h5):(2'h3)])));
            end
        end
      reg27 <= $signed({({(wire18 >> reg21)} == wire15),
          $signed($unsigned((reg22 ? wire18 : (8'ha3))))});
    end
  assign wire28 = $unsigned(reg24);
  always
    @(posedge clk) begin
      reg29 <= $unsigned({((~&$signed(reg20)) ?
              {reg27[(3'h5):(1'h0)],
                  (wire17 ? reg20 : reg27)} : $unsigned((reg24 ?
                  (8'hbd) : reg24)))});
      reg30 <= wire17[(1'h1):(1'h1)];
    end
  assign wire31 = reg24[(3'h4):(3'h4)];
  assign wire32 = (((reg23 ?
                      $signed(reg23) : wire28) | reg21[(2'h2):(2'h2)]) != {wire17[(3'h6):(3'h4)],
                      $signed($unsigned($unsigned(reg24)))});
  assign wire33 = reg24;
  assign wire34 = ($signed(wire31) ?
                      $unsigned(reg29[(3'h7):(1'h1)]) : {((&(reg20 >> reg23)) & ($signed(reg24) ?
                              $unsigned(reg20) : $signed(wire28))),
                          (((reg25 == reg21) ?
                                  wire31[(3'h4):(2'h3)] : ((7'h41) ?
                                      wire31 : reg29)) ?
                              $unsigned((8'ha8)) : reg25[(3'h4):(2'h2)])});
  assign wire35 = ($signed(reg29) << (~&wire17[(3'h6):(2'h3)]));
endmodule
