module top
#(parameter param137 = {(~(|(((8'hb2) ? (8'h9c) : (8'haa)) ? (!(8'hb4)) : ((8'ha3) * (8'h9c)))))}, 
parameter param138 = (8'hba))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire134;
  wire signed [(4'ha):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire120;
  wire signed [(5'h15):(1'h0)] wire116;
  wire signed [(5'h12):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire118;
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire123,
                 wire122,
                 wire120,
                 wire116,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 wire118,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 (1'h0)};
  module4 #() modinst95 (.clk(clk), .wire8(wire1), .wire5(wire2), .wire7(wire0), .wire6(wire3), .y(wire94));
  assign wire96 = ((-(((~|(8'ha2)) & (wire94 ? (8'ha8) : wire2)) ?
                          {$unsigned((8'ha5))} : wire1[(4'h8):(4'h8)])) ?
                      (wire1[(2'h2):(1'h0)] ~^ $unsigned((8'ha0))) : wire0[(3'h6):(3'h4)]);
  assign wire97 = ((~$unsigned(wire0)) ?
                      $unsigned({wire1[(4'h8):(3'h4)]}) : (^wire0));
  assign wire98 = (($unsigned({(~^wire97),
                          (~&(8'haa))}) ^~ $unsigned((^wire2[(4'ha):(2'h3)]))) ?
                      {(wire97[(3'h4):(3'h4)] ?
                              ($unsigned(wire97) ?
                                  wire3[(3'h6):(3'h4)] : ((7'h42) << wire1)) : {wire0,
                                  (~|(8'hbd))}),
                          (wire0 ?
                              wire94[(4'h8):(1'h0)] : $signed($signed((7'h43))))} : $signed(wire2[(4'hd):(2'h3)]));
  assign wire99 = (wire98 != (~$unsigned((^(|wire98)))));
  assign wire100 = {(~|((~&wire94) * $signed($unsigned(wire1)))),
                       $unsigned(wire0)};
  module101 #() modinst117 (wire116, clk, wire96, wire100, wire3, wire98, wire94);
  module42 #() modinst119 (.clk(clk), .wire43(wire97), .y(wire118), .wire46(wire0), .wire44(wire98), .wire45(wire116), .wire47(wire99));
  module11 #() modinst121 (wire120, clk, wire96, wire116, wire99, wire3);
  assign wire122 = {wire96[(3'h6):(2'h2)]};
  assign wire123 = (wire116 ?
                       wire118[(1'h0):(1'h0)] : $unsigned(($unsigned((wire3 <<< wire122)) ?
                           ((wire96 ?
                               wire94 : wire100) != (~&wire122)) : $signed(((8'haa) << wire98)))));
  always
    @(posedge clk) begin
      reg124 <= wire122[(4'ha):(1'h0)];
      if (wire120[(2'h3):(2'h2)])
        begin
          reg125 <= $signed((wire94 ? wire120 : wire120[(2'h2):(1'h0)]));
          reg126 <= wire0;
          reg127 <= (^~$unsigned((wire96[(1'h0):(1'h0)] ?
              ({reg125, wire2} ?
                  (|reg125) : {reg124,
                      wire97}) : ((|(8'hb7)) > (reg124 >= wire98)))));
          reg128 <= $signed({((reg124 ?
                  (8'hbb) : (|wire123)) || (-wire118[(1'h1):(1'h1)])),
              $unsigned(wire3)});
        end
      else
        begin
          if (wire120[(2'h3):(2'h3)])
            begin
              reg125 <= ((wire120[(1'h1):(1'h1)] ^ $signed(($signed(wire2) >> reg127[(3'h5):(2'h2)]))) < reg124);
            end
          else
            begin
              reg125 <= ($signed($signed(reg125[(2'h2):(2'h2)])) ?
                  {{$unsigned($unsigned(wire2)),
                          ($unsigned((7'h42)) ^~ (|wire96))}} : reg128);
              reg126 <= ($signed((reg127[(4'he):(2'h2)] >= (wire3[(3'h5):(1'h1)] ~^ (|wire123)))) ?
                  $signed(wire99[(4'ha):(2'h2)]) : wire2[(4'ha):(3'h6)]);
            end
          if (wire3[(3'h7):(3'h5)])
            begin
              reg127 <= ($signed(($unsigned($unsigned(reg126)) < $unsigned((wire118 ?
                      wire120 : wire3)))) ?
                  ((wire116 <= ((~^wire98) ^ $unsigned(wire118))) * $unsigned((wire1 ?
                      (&reg125) : (|(8'hb4))))) : (~|wire100));
              reg128 <= $signed(wire0);
              reg129 <= wire96[(4'ha):(4'h8)];
              reg130 <= ((&((~reg129[(2'h3):(2'h2)]) >= ($signed(wire120) ?
                      $unsigned(reg127) : (~^reg127)))) ?
                  ({wire94[(5'h11):(5'h10)],
                      $signed((8'hbb))} <= $signed((8'hb5))) : (((|(&wire123)) - {(|reg124),
                          (reg125 ? wire94 : wire98)}) ?
                      $unsigned((^~((8'hb0) <= (7'h41)))) : (^($signed(wire116) - (wire123 << wire122)))));
            end
          else
            begin
              reg127 <= wire98;
              reg128 <= wire98;
              reg129 <= (((((!wire98) != $signed(wire94)) > $signed(wire99)) ~^ (~|(~|(reg124 ?
                  wire2 : reg124)))) << wire98);
            end
        end
      reg131 <= (~^(wire3 >>> ((~&(wire97 == wire3)) ^ $unsigned($unsigned(wire118)))));
      reg132 <= reg128[(2'h2):(1'h0)];
      reg133 <= {($signed(wire100) ^~ $signed(wire120[(1'h0):(1'h0)])),
          (|$unsigned($signed(reg128[(4'ha):(3'h4)])))};
    end
  assign wire134 = reg133[(1'h0):(1'h0)];
  assign wire135 = $signed({$unsigned(($signed(wire116) || $unsigned(reg124))),
                       wire94[(4'hd):(4'hd)]});
  assign wire136 = reg128[(4'h9):(2'h3)];
endmodule

module module101
#(parameter param114 = (~&(+(&((&(8'ha2)) ? ((8'ha3) >= (8'h9d)) : (!(8'hb6)))))), 
parameter param115 = ({({param114, param114} ? (~&param114) : ({param114} >= (!param114))), param114} ? (~((param114 || {param114, param114}) || (&(^(8'hbd))))) : param114))
(y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire106;
  input wire signed [(5'h10):(1'h0)] wire105;
  input wire signed [(3'h4):(1'h0)] wire104;
  input wire signed [(4'ha):(1'h0)] wire103;
  input wire [(5'h14):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  assign y = {wire113,
                 wire108,
                 wire107,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire107 = ((~((wire102 ? $unsigned(wire103) : $unsigned(wire104)) ?
                           wire105[(5'h10):(2'h3)] : wire104)) ?
                       ({$unsigned(wire104[(1'h0):(1'h0)]),
                               $unsigned((-(8'haf)))} ?
                           ($signed($signed(wire105)) ?
                               ($unsigned(wire102) < {wire102}) : $unsigned({wire106,
                                   wire106})) : $unsigned(($signed(wire106) ~^ $unsigned((8'hb1))))) : ({$signed((7'h40)),
                           wire105[(2'h2):(2'h2)]} ^ $signed($signed(((8'had) <= wire106)))));
  assign wire108 = wire107[(4'he):(3'h6)];
  always
    @(posedge clk) begin
      reg109 <= wire105[(4'h8):(3'h5)];
      reg110 <= (($signed((^~{wire104})) * ((!wire107) <<< ((reg109 - wire105) ~^ (~&wire102)))) ~^ $unsigned($signed({wire103})));
      reg111 <= $unsigned($unsigned(wire103));
      reg112 <= $unsigned((wire103[(1'h1):(1'h0)] >>> $signed(wire106)));
    end
  assign wire113 = reg112;
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire91;
  assign y = {wire93,
                 wire70,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire10,
                 wire9,
                 wire72,
                 wire91,
                 (1'h0)};
  assign wire9 = $signed(wire8);
  assign wire10 = ((!$unsigned(wire9[(3'h5):(1'h0)])) ?
                      $signed($unsigned(($signed(wire8) ?
                          wire5 : $unsigned(wire6)))) : (wire5 ^ ($unsigned(wire7[(2'h2):(2'h2)]) ?
                          wire7[(3'h7):(3'h4)] : (!(wire7 ? wire5 : wire8)))));
  module11 #() modinst37 (wire36, clk, wire9, wire5, wire7, wire6);
  assign wire38 = wire10;
  assign wire39 = ($unsigned(((|((8'hb5) ? wire7 : wire8)) - wire8)) ?
                      wire7 : ({({wire5,
                              (8'hb2)} == {(8'ha8)})} <= $signed((!$signed(wire5)))));
  assign wire40 = $signed((($unsigned($signed((8'had))) == $unsigned($signed(wire39))) == (((wire5 ?
                          wire39 : (8'hb2)) >>> (wire6 >>> wire8)) ?
                      ((wire39 ? wire5 : wire6) ?
                          (8'h9f) : $unsigned(wire38)) : $signed(wire5))));
  assign wire41 = {({wire38[(2'h3):(1'h0)],
                          wire5[(3'h7):(3'h5)]} > {($unsigned(wire39) <= {(8'ha4)})})};
  module42 #() modinst71 (wire70, clk, wire6, wire5, wire36, wire39, wire41);
  assign wire72 = ((8'ha8) ? wire38 : $signed($unsigned(wire8[(4'h9):(3'h4)])));
  module73 #() modinst92 (wire91, clk, wire40, wire39, wire5, wire72, wire36);
  assign wire93 = wire38[(2'h3):(2'h3)];
endmodule

module module73
#(parameter param90 = ((~((((8'hb7) * (8'hba)) >= ((7'h43) << (8'hb6))) * ({(8'hba), (8'ha6)} ? ((7'h44) ? (8'ha5) : (8'hab)) : (~&(8'had))))) || ((({(8'ha1), (8'ha9)} ^~ ((8'hb3) ~^ (7'h40))) >> (^~{(8'h9d), (7'h42)})) ? (+(!(8'hb3))) : ((((8'ha9) > (8'ha5)) || {(8'haa)}) == (((8'hbf) ? (8'had) : (8'hbb)) >>> ((8'haa) ? (8'ha9) : (8'hb6)))))))
(y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire78;
  input wire signed [(3'h7):(1'h0)] wire77;
  input wire signed [(5'h11):(1'h0)] wire76;
  input wire [(5'h11):(1'h0)] wire75;
  input wire [(4'hb):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire87;
  wire [(3'h4):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg84,
                 (1'h0)};
  assign wire79 = wire75[(4'h9):(2'h3)];
  assign wire80 = wire76[(4'h8):(3'h7)];
  assign wire81 = wire77[(1'h0):(1'h0)];
  assign wire82 = (^~(8'ha7));
  assign wire83 = $unsigned(($unsigned(wire82) ^ $signed(wire77[(3'h4):(3'h4)])));
  always
    @(posedge clk) begin
      reg84 <= ($unsigned((~{wire79[(4'h9):(1'h0)]})) ?
          $signed(wire76[(5'h11):(4'h8)]) : (((wire79 * wire81[(3'h4):(1'h0)]) ?
                  (wire81[(3'h4):(3'h4)] ^ wire80) : {$signed(wire83),
                      {wire74}}) ?
              wire77[(1'h0):(1'h0)] : $unsigned($signed((wire77 ?
                  wire76 : wire81)))));
    end
  assign wire85 = $unsigned(wire78);
  assign wire86 = (~|wire79);
  assign wire87 = wire77;
  assign wire88 = wire85[(2'h3):(2'h3)];
  assign wire89 = wire87[(3'h4):(2'h3)];
endmodule

module module42
#(parameter param69 = {({(8'haf)} * ((((8'ha1) ? (7'h44) : (8'ha5)) ? {(8'hbd), (8'h9e)} : (^(8'hb5))) ? {{(8'ha1)}} : ((|(8'hbb)) ? ((7'h41) ~^ (7'h41)) : (&(8'hb5)))))})
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire47;
  input wire signed [(4'hd):(1'h0)] wire46;
  input wire [(4'hc):(1'h0)] wire45;
  input wire signed [(5'h10):(1'h0)] wire44;
  input wire [(5'h15):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  reg signed [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
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
                 (1'h0)};
  assign wire48 = $signed(wire47[(2'h3):(1'h0)]);
  assign wire49 = (^$unsigned(wire48));
  assign wire50 = wire49[(4'hb):(3'h6)];
  assign wire51 = wire46[(3'h6):(1'h0)];
  assign wire52 = (^wire46[(2'h2):(1'h1)]);
  assign wire53 = (^~(({$unsigned(wire48), wire49} << wire45[(4'h9):(1'h0)]) ?
                      (~^(-wire49)) : $unsigned(wire47[(2'h3):(2'h3)])));
  assign wire54 = (^~($signed({(7'h42)}) ?
                      (wire53[(4'ha):(3'h6)] ^ (wire53 ?
                          wire50[(3'h5):(2'h2)] : (wire44 != wire47))) : (8'ha2)));
  assign wire55 = $signed((+wire53));
  assign wire56 = (wire52[(3'h4):(1'h0)] ?
                      wire43[(2'h2):(2'h2)] : (wire51 ?
                          wire43 : ((|wire43) ?
                              $unsigned($unsigned(wire55)) : $signed(((8'hb6) && wire43)))));
  always
    @(posedge clk) begin
      reg57 <= ($signed($signed($signed(((8'hb0) ?
          wire51 : (8'haf))))) < $unsigned((^$unsigned((~&wire48)))));
      reg58 <= ((~|wire44[(4'ha):(3'h7)]) || (8'ha4));
      reg59 <= ((-{(&$unsigned(wire48)),
          wire55}) * $signed((+$unsigned(wire49[(4'hb):(3'h4)]))));
    end
  always
    @(posedge clk) begin
      reg60 <= reg57[(3'h4):(2'h2)];
      if (wire52)
        begin
          if ({$unsigned((($unsigned(reg57) != $signed(wire54)) ^ ($unsigned(wire51) * reg59))),
              wire45})
            begin
              reg61 <= $signed((wire48 ^~ $unsigned(wire43)));
              reg62 <= $signed($signed($unsigned(((wire50 ?
                  wire53 : wire51) <= wire53))));
              reg63 <= wire51;
              reg64 <= (~&$signed(reg58));
              reg65 <= ($unsigned(wire50[(1'h0):(1'h0)]) <= {wire44,
                  ((~^(wire56 ? reg59 : wire44)) <= (^~(wire52 ?
                      wire43 : reg64)))});
            end
          else
            begin
              reg61 <= ((~(8'hb8)) ?
                  reg58[(4'hd):(3'h4)] : (&$unsigned((^~(wire50 ?
                      wire46 : wire45)))));
              reg62 <= $unsigned({(($signed((8'ha1)) ?
                      $signed(wire52) : (^~wire53)) - $signed($unsigned(wire49)))});
            end
          reg66 <= {($unsigned(reg59) < ((reg62[(4'h9):(4'h9)] - reg58[(5'h11):(1'h0)]) ?
                  (~&wire44[(2'h3):(2'h3)]) : ((wire52 ?
                      wire44 : wire55) * wire51[(4'hc):(3'h5)])))};
          reg67 <= reg61[(2'h2):(1'h1)];
          reg68 <= (8'hb9);
        end
      else
        begin
          if (reg60[(5'h10):(1'h0)])
            begin
              reg61 <= (wire56 >= {$unsigned(wire49[(4'hd):(4'hb)]),
                  {$signed(((8'haa) ? wire48 : (7'h42)))}});
              reg62 <= wire54;
            end
          else
            begin
              reg61 <= $unsigned({($unsigned(wire43) ?
                      wire51 : reg61[(4'hb):(2'h3)]),
                  {(&(wire49 ? wire56 : reg58)),
                      $unsigned($unsigned(wire56))}});
              reg62 <= (^$signed((((~&(8'h9c)) ? $unsigned(wire48) : wire46) ?
                  (reg61 ? (|reg63) : $unsigned(wire48)) : $signed(reg57))));
              reg63 <= (reg65 < reg65[(1'h0):(1'h0)]);
            end
          reg64 <= ((^(~^(^~(|wire47)))) ?
              $unsigned((+($signed(reg59) ?
                  (wire54 ?
                      wire44 : wire48) : $unsigned((8'hbc))))) : $signed(reg63[(1'h1):(1'h1)]));
          if (wire46)
            begin
              reg65 <= $signed(reg58[(4'hd):(4'hc)]);
            end
          else
            begin
              reg65 <= (~^(+($unsigned($unsigned(reg58)) ? reg67 : (~|reg58))));
            end
          reg66 <= $signed(reg63[(1'h0):(1'h0)]);
        end
    end
endmodule

module module11
#(parameter param35 = (((!({(8'hb0), (8'hbe)} ? (8'haa) : (^~(7'h40)))) ^ ({(!(8'hb9)), ((8'hac) ? (8'hb4) : (8'hb5))} | ((|(8'ha1)) < (~^(8'ha2))))) ^~ ({({(8'ha0), (8'ha2)} ? ((8'hab) - (8'ha5)) : {(8'h9e), (8'ha3)}), {((8'ha5) ? (8'hbf) : (8'hb5))}} ? {(((7'h43) ? (8'hbb) : (8'h9c)) + {(8'ha3), (8'ha9)})} : (-((^~(8'ha2)) ? (8'hb5) : (^(8'hba)))))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  input wire [(3'h4):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire16;
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire16,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg17,
                 (1'h0)};
  assign wire16 = (wire13[(1'h1):(1'h1)] ?
                      $signed(wire12) : $unsigned(($unsigned((wire12 ?
                              wire12 : wire14)) ?
                          (-$unsigned(wire12)) : ($signed(wire13) < (wire14 ?
                              wire13 : (8'hb9))))));
  always
    @(posedge clk) begin
      reg17 <= $unsigned(wire12);
    end
  assign wire18 = wire14[(3'h5):(1'h0)];
  assign wire19 = $signed($unsigned(((^(wire16 ?
                      wire16 : wire16)) > wire12[(3'h6):(3'h6)])));
  assign wire20 = wire12;
  assign wire21 = (^~{wire19});
  assign wire22 = $unsigned(wire15);
  assign wire23 = (~&(wire14 && $unsigned(wire20)));
  assign wire24 = $unsigned((~|wire21[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      if ((wire24[(4'he):(1'h1)] > $signed((({wire20,
          wire20} | (wire18 | wire24)) <= wire21))))
        begin
          if ((~$unsigned((wire19 ?
              $unsigned((~&wire16)) : wire19[(4'hd):(3'h5)]))))
            begin
              reg25 <= (~&{($unsigned((wire18 ?
                      wire15 : wire21)) >= $unsigned((wire23 ^ (8'hb3))))});
              reg26 <= $signed((^~$unsigned($unsigned($signed(wire24)))));
              reg27 <= reg17;
            end
          else
            begin
              reg25 <= wire18;
            end
        end
      else
        begin
          reg25 <= $unsigned((($unsigned((wire13 ?
              reg25 : (8'had))) >= (~(reg25 ?
              reg26 : wire24))) || $unsigned((wire15 ?
              wire22 : $unsigned(wire23)))));
        end
      reg28 <= (($unsigned((&reg17[(2'h2):(2'h2)])) == (wire20 ~^ wire19)) << $signed((reg25[(3'h4):(2'h3)] ?
          $unsigned(wire24[(5'h12):(5'h10)]) : (-(reg26 ? wire20 : wire13)))));
      reg29 <= wire24;
      reg30 <= $signed(wire13[(1'h1):(1'h0)]);
      reg31 <= reg30;
    end
  always
    @(posedge clk) begin
      reg32 <= $unsigned((($unsigned((|reg28)) <<< (-(^~wire15))) ?
          (8'hb2) : (+$signed((reg28 ? reg27 : reg25)))));
      reg33 <= $unsigned($signed($unsigned({reg26[(1'h0):(1'h0)]})));
      reg34 <= $unsigned(({({wire16, wire24} ?
              ((8'h9c) || reg27) : $signed((8'hbd))),
          {wire24[(3'h6):(3'h4)]}} && reg28[(3'h6):(3'h5)]));
    end
endmodule
