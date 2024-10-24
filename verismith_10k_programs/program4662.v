module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire28;
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire89,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire28,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = (wire3 ?
                     wire2 : ({wire3[(1'h0):(1'h0)]} ?
                         wire1[(4'h8):(3'h5)] : (({wire3} ?
                                 $unsigned(wire0) : $signed((8'hbe))) ?
                             wire4 : ($unsigned(wire4) ?
                                 $signed((8'ha8)) : wire0))));
  assign wire6 = wire2;
  assign wire7 = ({wire3} != ($signed(wire6) <= ({wire6[(1'h0):(1'h0)],
                     wire4[(2'h2):(1'h1)]} * wire5)));
  assign wire8 = (^~(8'hb5));
  assign wire9 = $unsigned($signed(wire8));
  assign wire10 = ((wire0 || wire0[(1'h1):(1'h1)]) ?
                      wire4 : (^($unsigned(wire4) ^~ wire8[(3'h7):(3'h6)])));
  assign wire11 = (^$unsigned($unsigned(($signed(wire4) != (^wire1)))));
  assign wire12 = ((8'hac) <<< {(-{(wire5 << wire8)})});
  always
    @(posedge clk) begin
      reg13 <= wire0[(2'h3):(2'h3)];
      reg14 <= wire10;
      reg15 <= ($signed(reg13) <<< (wire12[(3'h5):(2'h3)] ?
          $signed($signed((~wire8))) : wire12));
    end
  module16 #() modinst29 (wire28, clk, wire11, wire7, wire1, wire2, wire5);
  assign wire30 = wire4;
  assign wire31 = (^$unsigned(($signed(wire1[(2'h3):(1'h0)]) ? wire6 : wire6)));
  assign wire32 = (~^$unsigned($unsigned(wire4[(3'h5):(2'h2)])));
  assign wire33 = (8'ha8);
  assign wire34 = $unsigned(($unsigned((wire7[(3'h6):(2'h3)] * ((8'hae) + wire28))) ~^ (wire4 ?
                      ((wire2 >= (8'ha8)) ?
                          (wire4 ? (8'hbc) : reg13) : (wire33 ?
                              (8'h9f) : reg13)) : $unsigned($unsigned((8'ha9))))));
  module35 #() modinst90 (wire89, clk, wire6, wire12, wire28, wire3);
  always
    @(posedge clk) begin
      reg91 <= (wire89 <= wire28[(3'h5):(2'h2)]);
      reg92 <= (((^~{(8'hbb)}) ? wire9 : reg13[(4'h9):(3'h6)]) < wire6);
      reg93 <= (~|wire5);
      reg94 <= {wire11[(4'hd):(3'h5)], wire34};
      reg95 <= (wire33[(1'h0):(1'h0)] != (($signed(wire32) ?
              (~^(~^wire0)) : ($unsigned((8'hb3)) ?
                  {wire5, wire5} : (wire32 << wire4))) ?
          $signed((+wire0)) : (~$unsigned($signed(wire7)))));
    end
  assign wire96 = reg93[(3'h5):(2'h2)];
  assign wire97 = (($unsigned((&reg91[(3'h5):(2'h2)])) ?
                      ({wire7, $unsigned(reg95)} < $unsigned(((7'h44) ?
                          wire3 : wire4))) : $signed($signed((wire89 ?
                          (8'hba) : reg93)))) >>> ($unsigned($unsigned($signed(wire1))) ?
                      {$signed($signed(wire96))} : (-$unsigned($unsigned(wire33)))));
  assign wire98 = (^({($signed(wire97) && $signed((8'hb1))),
                      {{wire9, wire10}, reg13[(3'h4):(2'h3)]}} >> (wire97 ?
                      wire28[(4'ha):(3'h5)] : ($signed(wire11) ?
                          (wire8 ? wire97 : (8'hac)) : $signed(reg14)))));
  assign wire99 = wire5[(3'h5):(1'h0)];
endmodule

module module35
#(parameter param88 = ((&(~^({(7'h42), (7'h44)} ? ((8'ha1) && (8'h9e)) : ((8'h9f) ? (8'hba) : (8'hb3))))) ? ((~^(((8'ha4) ^ (8'hb3)) ? (-(8'h9f)) : (~|(7'h43)))) ? ((~((8'hb2) ? (8'hb4) : (8'hbb))) ^ (~|((8'hb6) ~^ (8'hae)))) : (~|(((8'ha8) & (7'h40)) ? ((7'h43) >= (8'h9f)) : ((8'hbc) ? (8'ha5) : (8'hb0))))) : {((&((8'h9d) ? (8'hb5) : (8'hba))) == {{(8'ha7), (8'hb0)}, ((8'hbe) & (8'hbb))}), (!(((8'haa) ? (8'h9c) : (8'hba)) && (~(8'ha2))))}))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire39;
  input wire [(5'h10):(1'h0)] wire38;
  input wire signed [(5'h13):(1'h0)] wire37;
  input wire signed [(5'h11):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire66,
                 wire42,
                 wire41,
                 wire40,
                 reg87,
                 reg86,
                 reg85,
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
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire40 = (8'hb7);
  assign wire41 = $signed((8'hab));
  assign wire42 = ($unsigned(wire37) >>> wire39);
  module43 #() modinst67 (wire66, clk, wire36, wire38, wire37, wire39);
  always
    @(posedge clk) begin
      if (wire39[(3'h4):(3'h4)])
        begin
          reg68 <= wire42;
          reg69 <= ({(((wire39 && wire37) - {wire38,
                      wire36}) >> $signed((8'hbd))),
                  (wire40 & (~$signed(wire42)))} ?
              wire42[(3'h6):(3'h6)] : (~&$unsigned(((wire41 <<< wire66) ?
                  wire38[(4'ha):(4'h8)] : wire38[(4'hf):(4'hc)]))));
        end
      else
        begin
          if ((|wire41[(3'h7):(2'h2)]))
            begin
              reg68 <= $signed(wire66[(2'h3):(1'h1)]);
              reg69 <= (wire37 >= ($signed((wire39 ?
                      (reg69 ? reg68 : wire42) : $unsigned(reg68))) ?
                  $unsigned($unsigned($unsigned(wire41))) : (((8'hab) * (wire37 ?
                          wire42 : wire37)) ?
                      ($unsigned(wire39) ?
                          (wire41 != (8'ha5)) : wire39) : (|$signed((8'hb4))))));
            end
          else
            begin
              reg68 <= wire41[(3'h7):(3'h5)];
              reg69 <= wire66[(3'h4):(1'h1)];
              reg70 <= $signed((((wire66 != (wire39 <= wire39)) ^ $signed($unsigned(wire39))) >>> ({wire41,
                      wire42[(3'h7):(2'h3)]} ?
                  (&$signed(wire36)) : ($signed(wire39) ?
                      $signed(wire41) : (wire41 ^ wire37)))));
              reg71 <= $unsigned((({((8'ha3) < (8'hbf))} ?
                      (~$signed(wire36)) : ($unsigned(wire38) ?
                          (|wire38) : wire66[(4'h8):(3'h7)])) ?
                  reg69[(3'h6):(1'h1)] : $unsigned($signed({wire66, wire66}))));
              reg72 <= (($signed(({wire40, wire38} & reg71)) ?
                      $signed((reg68[(1'h1):(1'h0)] != wire42[(2'h2):(2'h2)])) : (!(8'hbb))) ?
                  $signed($signed((-reg71[(3'h6):(2'h3)]))) : ({wire37[(4'ha):(1'h1)],
                          {$signed(reg70)}} ?
                      (reg71 ?
                          reg70[(2'h2):(1'h0)] : (&$signed(wire38))) : $unsigned($signed((reg71 ?
                          (7'h43) : reg69)))));
            end
          reg73 <= (~^reg71);
          reg74 <= (((reg69 ?
              $signed(wire41[(4'hc):(2'h3)]) : $unsigned($unsigned(reg71))) - wire41) >> (-$signed(reg71[(1'h0):(1'h0)])));
          reg75 <= {reg70};
        end
      reg76 <= $unsigned(reg75[(1'h0):(1'h0)]);
      if (reg70[(2'h2):(1'h0)])
        begin
          reg77 <= (($signed((reg75 ? reg68 : wire66[(3'h7):(1'h1)])) ?
              (&(&wire40[(1'h0):(1'h0)])) : (($signed(reg75) <= reg70) ?
                  reg68 : {(reg69 && wire38),
                      reg75})) ~^ $signed($signed(reg71[(3'h7):(3'h7)])));
          reg78 <= wire42[(1'h1):(1'h1)];
        end
      else
        begin
          if ({($unsigned($unsigned($unsigned(reg68))) & $signed({(reg73 ?
                      reg75 : reg69),
                  reg74})),
              $signed(wire66[(3'h5):(3'h5)])})
            begin
              reg77 <= (~|reg75);
              reg78 <= {$unsigned((|wire66[(2'h3):(1'h1)]))};
              reg79 <= ((8'hb2) >> (8'hbc));
            end
          else
            begin
              reg77 <= reg69[(1'h0):(1'h0)];
              reg78 <= $unsigned((reg70 ^~ $signed({{wire41, (8'ha1)},
                  reg69})));
            end
        end
      reg80 <= (!reg79[(1'h0):(1'h0)]);
      reg81 <= wire38[(1'h0):(1'h0)];
    end
  assign wire82 = wire42[(2'h3):(2'h3)];
  assign wire83 = reg68;
  assign wire84 = $signed($signed(($unsigned($unsigned(reg77)) ?
                      $signed((reg77 || wire41)) : ({wire66} <= $signed(wire38)))));
  always
    @(posedge clk) begin
      reg85 <= (reg80 < reg73);
      reg86 <= reg76;
      reg87 <= wire39;
    end
endmodule

module module16
#(parameter param26 = {({(~^((7'h42) <<< (8'haa))), (((8'haa) > (8'hb8)) ? ((8'hb5) ? (8'h9e) : (8'ha7)) : (~^(8'ha1)))} ? ((~{(8'ha9)}) ? (-((8'hb7) | (8'ha8))) : (((7'h43) - (8'hb4)) ^~ (~(8'hac)))) : (((7'h44) ? (|(8'haa)) : (^~(7'h42))) ~^ (((8'ha8) - (8'ha4)) ? (!(8'ha4)) : (8'hac))))}, 
parameter param27 = (param26 > param26))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  assign y = {wire25, wire24, wire23, wire22, (1'h0)};
  assign wire22 = (wire19 | $unsigned({(^{wire21})}));
  assign wire23 = wire20[(3'h5):(2'h2)];
  assign wire24 = wire23[(2'h2):(1'h1)];
  assign wire25 = ($unsigned(wire20[(3'h6):(1'h0)]) ?
                      $signed(wire17[(5'h12):(3'h4)]) : wire18);
endmodule

module module43
#(parameter param65 = (+{{((-(8'hac)) || {(8'ha1)})}}))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire47;
  input wire [(4'ha):(1'h0)] wire46;
  input wire [(5'h10):(1'h0)] wire45;
  input wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 (1'h0)};
  assign wire48 = wire45;
  assign wire49 = $unsigned($unsigned({$unsigned(wire46[(4'h9):(1'h1)])}));
  assign wire50 = (($signed(wire45[(4'ha):(1'h1)]) && $signed(wire47[(3'h7):(3'h4)])) ?
                      $signed($signed((wire47[(4'hc):(4'ha)] ?
                          (wire46 ?
                              wire49 : wire47) : $signed(wire47)))) : $signed((!$unsigned((~^wire49)))));
  assign wire51 = ((~&($signed(wire46[(2'h3):(1'h1)]) ?
                          {$signed(wire45)} : wire49[(2'h3):(1'h1)])) ?
                      wire44[(2'h2):(1'h1)] : ((8'haa) ^ (~(^$unsigned(wire44)))));
  assign wire52 = (7'h42);
  assign wire53 = wire52[(3'h7):(2'h2)];
  assign wire54 = $signed(wire48[(1'h1):(1'h0)]);
  assign wire55 = (~^({wire50[(1'h0):(1'h0)]} ?
                      wire48[(1'h1):(1'h0)] : wire51));
  assign wire56 = ($signed((8'hb8)) ? wire54 : wire50[(1'h1):(1'h0)]);
  assign wire57 = wire51;
  assign wire58 = ((!wire49[(2'h3):(2'h2)]) + ($unsigned(wire44) && wire49[(2'h3):(2'h2)]));
  assign wire59 = (~^wire49[(4'h9):(2'h2)]);
  assign wire60 = ((({(wire44 > wire57),
                          ((7'h41) ? wire49 : wire51)} << {{wire59, wire59},
                          wire58[(4'he):(4'he)]}) ?
                      ($signed($unsigned(wire47)) ?
                          wire51 : ((wire44 * wire49) ?
                              $signed(wire47) : $signed(wire47))) : $unsigned(wire54)) >= ((+wire51[(1'h0):(1'h0)]) ?
                      wire45 : $signed(((+(8'ha9)) ?
                          (~^wire50) : ((8'h9f) ? wire44 : wire55)))));
  assign wire61 = $signed(($unsigned(($unsigned(wire59) ^~ $signed((8'hbe)))) ?
                      wire54[(1'h0):(1'h0)] : ($unsigned((wire54 ?
                              wire48 : wire51)) ?
                          (&(wire52 ?
                              wire57 : wire49)) : (~&$signed(wire58)))));
  assign wire62 = $unsigned(wire54);
  assign wire63 = wire52;
  assign wire64 = $unsigned({wire52[(4'h9):(3'h4)]});
endmodule
