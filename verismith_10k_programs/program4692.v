module top
#(parameter param165 = (~^(^(8'hac))), 
parameter param166 = ({{param165}, {{param165}}} && param165))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire155;
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg [(3'h4):(1'h0)] reg157 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire155,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = wire4[(2'h2):(2'h2)];
  assign wire6 = (wire0[(2'h3):(1'h1)] + ((~&$signed(wire1[(4'ha):(4'ha)])) != ((wire4[(1'h0):(1'h0)] == $unsigned(wire1)) == $signed((8'hb6)))));
  assign wire7 = $unsigned(wire2[(4'h8):(3'h6)]);
  assign wire8 = (($signed((wire7 <= wire7[(5'h14):(4'ha)])) ?
                         {{wire5[(1'h1):(1'h1)], wire1[(1'h1):(1'h0)]},
                             wire4[(3'h5):(1'h1)]} : {wire7,
                             (wire2[(1'h0):(1'h0)] <<< $unsigned((8'hba)))}) ?
                     (($unsigned(wire5[(2'h2):(2'h2)]) ?
                         {{wire5}} : ((wire5 ? wire4 : wire4) ?
                             (wire3 ?
                                 wire2 : (8'ha5)) : wire5[(3'h4):(2'h2)])) <<< $signed(wire0[(1'h0):(1'h0)])) : $signed(wire1));
  assign wire9 = ($signed($signed(($unsigned(wire0) ?
                     (wire5 ?
                         wire0 : wire2) : $signed((8'hb6))))) <= $unsigned({$unsigned((^~wire1)),
                     $unsigned((wire5 || wire4))}));
  assign wire10 = ((~^(((~^wire3) ^ (~|wire2)) ?
                      {(wire5 ? wire0 : wire4),
                          (!wire0)} : wire5[(4'h8):(3'h6)])) > (($signed(wire7[(5'h14):(5'h11)]) && (((8'h9d) ?
                          wire5 : wire7) >> {wire2})) ?
                      wire7 : $unsigned({$signed((8'hab))})));
  assign wire11 = wire10;
  assign wire12 = (((^~(8'hb0)) ?
                      wire7 : wire3) | $unsigned($unsigned($unsigned(wire8))));
  module13 #() modinst156 (wire155, clk, wire3, wire11, wire0, wire12, wire7);
  always
    @(posedge clk) begin
      if (((($signed((-wire0)) * $unsigned((~&wire11))) ?
              (!wire5) : wire11[(2'h3):(1'h0)]) ?
          wire8[(1'h0):(1'h0)] : ($signed($unsigned((wire12 <<< wire2))) ?
              (($signed(wire155) <<< (8'h9f)) ?
                  {$signed(wire9), (8'ha8)} : ($signed(wire1) <<< (wire5 ?
                      wire8 : (8'hae)))) : (wire12[(5'h14):(4'hf)] ?
                  (&wire155) : wire4))))
        begin
          if ($signed((wire8 ?
              (wire12[(5'h12):(5'h12)] && {{wire4, (8'hb3)}}) : wire6)))
            begin
              reg157 <= wire7;
              reg158 <= (!wire10[(1'h1):(1'h0)]);
              reg159 <= ({($signed((^~wire155)) ?
                      wire2[(3'h7):(3'h5)] : ({wire10,
                          wire10} ~^ (wire1 >>> (8'hac)))),
                  wire11} ~^ (((8'ha7) ?
                      ((wire8 ? wire0 : wire0) ?
                          $signed((8'ha6)) : (wire6 ?
                              wire5 : wire3)) : ((~wire2) + $signed(wire12))) ?
                  (~^{wire9}) : (~&(8'hab))));
              reg160 <= {$unsigned($unsigned(($signed(wire9) * $signed((8'h9d))))),
                  reg159};
              reg161 <= ((wire7 == (wire4[(1'h0):(1'h0)] ?
                      $unsigned(wire3[(3'h4):(1'h0)]) : ({wire6,
                          wire12} > (~&reg157)))) ?
                  ($signed(({reg157} ?
                      $signed(wire10) : (wire3 ?
                          (8'haa) : wire9))) < reg157) : (wire2 >= (&wire2[(3'h7):(2'h2)])));
            end
          else
            begin
              reg157 <= $unsigned(((wire5[(2'h3):(2'h3)] ?
                      (~&$unsigned(wire5)) : wire1[(5'h10):(3'h7)]) ?
                  reg159[(3'h6):(1'h0)] : $signed((wire155 ?
                      (+wire0) : (wire8 && reg158)))));
              reg158 <= {($unsigned($unsigned((wire7 ? wire5 : wire7))) ?
                      (((reg159 ? reg157 : (8'h9e)) ?
                          ((8'ha2) ? wire3 : wire9) : (wire3 ?
                              wire155 : wire155)) < $signed(reg158)) : wire7),
                  (wire0[(2'h2):(1'h0)] ?
                      $signed((((7'h42) ?
                          wire3 : wire3) ~^ wire12)) : wire8[(2'h2):(1'h0)])};
              reg159 <= wire10[(4'h9):(4'h9)];
              reg160 <= reg158[(2'h3):(2'h2)];
            end
          reg162 <= (~^($signed(wire1) ?
              ($signed((wire0 || reg161)) ^ $unsigned(wire4)) : (reg159[(3'h6):(1'h0)] ?
                  $signed((reg159 ? wire5 : (8'ha6))) : wire4[(3'h5):(2'h3)])));
          reg163 <= {(+wire1)};
          reg164 <= {$unsigned(wire155[(3'h6):(1'h0)]),
              (wire10[(4'hb):(3'h6)] ?
                  ($unsigned((wire6 ^~ (8'hbb))) ^~ (+(~^wire11))) : (reg159[(4'hb):(2'h2)] & $unsigned((^~reg160))))};
        end
      else
        begin
          if ($signed($signed((wire1 ~^ reg162))))
            begin
              reg157 <= ($unsigned(wire9) != wire12);
              reg158 <= wire7;
            end
          else
            begin
              reg157 <= (^~($unsigned(reg157[(2'h2):(1'h0)]) ?
                  $unsigned($unsigned(((8'hb4) ?
                      wire9 : wire12))) : (wire1 >> (reg162 ?
                      (reg163 ? reg157 : wire9) : $signed(reg162)))));
              reg158 <= ($unsigned((8'haf)) ?
                  $unsigned(reg160[(5'h13):(3'h7)]) : $unsigned(((~(+reg157)) ?
                      $unsigned(((8'hbd) * wire12)) : $signed(wire10))));
              reg159 <= (8'hac);
              reg160 <= $unsigned((wire6 ?
                  wire3 : $signed(({wire7} ?
                      (reg158 ^ wire3) : $unsigned(wire11)))));
            end
          reg161 <= (~wire1);
          reg162 <= wire3[(1'h1):(1'h0)];
          reg163 <= $unsigned($signed(reg159));
          reg164 <= (wire4[(3'h5):(3'h5)] > $unsigned(wire9));
        end
    end
endmodule

module module13  (y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire154;
  wire [(5'h12):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire112;
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire151,
                 wire115,
                 wire19,
                 wire25,
                 wire26,
                 wire52,
                 wire112,
                 reg114,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  assign wire19 = ({wire14[(3'h4):(3'h4)], wire15} ?
                      $unsigned((|($signed((7'h43)) ?
                          $signed((8'ha3)) : wire18))) : $signed((8'ha4)));
  always
    @(posedge clk) begin
      reg20 <= (wire18[(1'h0):(1'h0)] ?
          {$unsigned({$unsigned((8'ha6)),
                  $signed((8'ha2))})} : wire16[(1'h1):(1'h1)]);
      reg21 <= (8'ha9);
      reg22 <= wire16;
      if ({$unsigned((~$unsigned(reg21)))})
        begin
          reg23 <= ($unsigned(wire18[(2'h2):(1'h1)]) ?
              $unsigned($signed(((wire14 < reg20) > (wire19 == reg22)))) : $signed($signed(reg22[(3'h5):(1'h0)])));
        end
      else
        begin
          reg23 <= wire19;
        end
      reg24 <= $unsigned($signed((|$unsigned(wire18[(1'h1):(1'h1)]))));
    end
  assign wire25 = $unsigned(reg24[(2'h2):(1'h1)]);
  assign wire26 = wire14[(2'h3):(1'h1)];
  module27 #() modinst53 (wire52, clk, wire14, reg24, reg21, wire16);
  module54 #() modinst113 (.wire56(reg24), .wire57(wire16), .wire58(wire17), .wire55(wire15), .clk(clk), .y(wire112));
  always
    @(posedge clk) begin
      reg114 <= wire52;
    end
  assign wire115 = $unsigned(wire15[(2'h3):(2'h3)]);
  module116 #() modinst152 (.clk(clk), .wire119(reg21), .wire118(wire14), .wire117(wire19), .y(wire151), .wire120(reg22));
  assign wire153 = $unsigned((+$signed(((7'h44) ^ wire15))));
  assign wire154 = (+wire18[(2'h3):(2'h2)]);
endmodule

module module116  (y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire120;
  input wire signed [(4'hc):(1'h0)] wire119;
  input wire [(4'he):(1'h0)] wire118;
  input wire [(3'h5):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire150;
  wire signed [(4'hb):(1'h0)] wire149;
  wire signed [(5'h10):(1'h0)] wire144;
  wire [(2'h2):(1'h0)] wire143;
  wire [(2'h2):(1'h0)] wire142;
  wire [(3'h6):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire136;
  wire signed [(4'h9):(1'h0)] wire135;
  wire [(4'hd):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire132;
  wire [(2'h2):(1'h0)] wire129;
  wire [(3'h5):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire [(5'h10):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire123;
  wire [(4'ha):(1'h0)] wire122;
  wire [(5'h13):(1'h0)] wire121;
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire129,
                 wire128,
                 wire127,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg131,
                 reg130,
                 reg126,
                 reg125,
                 (1'h0)};
  assign wire121 = $signed((wire119 ?
                       (+((^wire117) ?
                           (-wire118) : wire120)) : $signed($signed(wire117))));
  assign wire122 = wire121[(1'h0):(1'h0)];
  assign wire123 = ($unsigned(((wire122 > wire121) ?
                           wire121 : (~&$signed(wire117)))) ?
                       wire120 : $unsigned((8'h9c)));
  assign wire124 = wire123;
  always
    @(posedge clk) begin
      reg125 <= {(8'hbc),
          (({wire119[(2'h3):(2'h2)]} <<< (wire118 && wire119)) | wire123)};
      reg126 <= $unsigned($signed((~$unsigned(reg125))));
    end
  assign wire127 = wire124;
  assign wire128 = reg125[(1'h0):(1'h0)];
  assign wire129 = (~^wire117);
  always
    @(posedge clk) begin
      reg130 <= (7'h40);
      reg131 <= wire129;
    end
  assign wire132 = (wire122 << $signed((+wire127[(1'h1):(1'h0)])));
  assign wire133 = ((wire132[(4'h9):(2'h3)] ?
                           (+((~^wire120) > $unsigned((8'hba)))) : wire122[(1'h0):(1'h0)]) ?
                       wire119 : (^~(wire123 >> wire122[(1'h1):(1'h1)])));
  assign wire134 = (~wire129);
  assign wire135 = $unsigned($signed(({{wire123}, (|wire122)} != wire119)));
  assign wire136 = {($signed($signed(wire119)) == {wire117[(3'h4):(3'h4)]}),
                       {(wire127[(2'h2):(2'h2)] ?
                               {{wire134, wire127}} : $unsigned((~&wire120))),
                           wire122[(3'h5):(1'h0)]}};
  always
    @(posedge clk) begin
      reg137 <= $signed(wire128[(3'h5):(2'h2)]);
      reg138 <= {(!(-(8'hba))),
          $unsigned((wire133[(1'h0):(1'h0)] ?
              $signed((wire129 ? wire132 : wire132)) : (|(wire119 ?
                  wire120 : wire134))))};
    end
  always
    @(posedge clk) begin
      reg139 <= $signed(wire129[(1'h1):(1'h0)]);
      reg140 <= ($unsigned(wire124[(2'h3):(2'h3)]) - (8'hb9));
    end
  assign wire141 = reg138[(3'h7):(1'h1)];
  assign wire142 = {$signed((^{{wire129}}))};
  assign wire143 = $signed(wire141);
  assign wire144 = wire127;
  always
    @(posedge clk) begin
      reg145 <= $signed({$unsigned($unsigned((^~wire118))), wire141});
      reg146 <= (!(wire133[(1'h1):(1'h0)] ?
          $unsigned($unsigned((reg125 || reg137))) : ((8'ha6) ?
              reg126 : reg126)));
      reg147 <= $signed(reg145);
      reg148 <= $unsigned(wire120);
    end
  assign wire149 = $unsigned(wire128);
  assign wire150 = ((~&wire122[(1'h1):(1'h0)]) ?
                       (wire143 ?
                           $unsigned($unsigned($signed(reg146))) : {$signed($signed(reg131)),
                               $unsigned($unsigned(wire129))}) : reg147);
endmodule

module module54
#(parameter param111 = (((((!(8'ha3)) ? ((8'h9d) ? (8'ha7) : (7'h44)) : ((8'haf) ? (8'hbd) : (8'hbc))) ? {(&(8'ha2))} : ({(7'h40), (8'hb1)} & (8'hae))) ^~ (({(8'h9f), (8'hb6)} <<< ((8'ha9) - (8'hb1))) ? (8'hb8) : (~&((7'h42) == (8'hba))))) ? (~&(~{{(8'h9d), (8'ha9)}})) : ((&((^~(8'ha7)) <= ((8'hab) ? (8'hbc) : (8'ha4)))) < (((^~(8'hac)) ? ((8'h9e) ^ (8'had)) : {(8'h9c), (8'hb3)}) <<< {(^(8'hae))}))))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h267):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire58;
  input wire [(2'h2):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire99;
  wire signed [(4'ha):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire signed [(4'hb):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  wire [(2'h2):(1'h0)] wire94;
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg101,
                 reg100,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg59 <= (~&{$unsigned(wire56)});
      if (((wire56 ?
              {(wire57[(1'h0):(1'h0)] ^ wire56)} : {(+(~&reg59)), wire58}) ?
          wire57 : (8'h9c)))
        begin
          reg60 <= $signed(($signed({wire57[(1'h0):(1'h0)]}) ?
              {$unsigned(wire55)} : $signed(((reg59 <<< wire58) ?
                  wire57 : {wire57}))));
          reg61 <= (+$unsigned((~&$signed((~&wire57)))));
          reg62 <= wire55;
          reg63 <= $unsigned(($unsigned({{(8'hab)}}) ?
              $signed({$signed(reg62)}) : wire58));
          if (wire57)
            begin
              reg64 <= wire56;
              reg65 <= (8'hab);
              reg66 <= (reg63 == reg65[(4'h9):(4'h8)]);
              reg67 <= $unsigned(($unsigned((&(reg60 ?
                  reg63 : reg64))) << reg63));
            end
          else
            begin
              reg64 <= (((&$signed((8'hbd))) ?
                  reg64 : (((-wire56) && wire57) ?
                      ($signed(wire55) ?
                          (wire58 ?
                              wire55 : wire55) : $unsigned((8'ha5))) : (~^(wire57 ?
                          reg63 : reg62)))) - $unsigned($unsigned(((-reg66) & {reg62,
                  (8'h9e)}))));
              reg65 <= reg62;
              reg66 <= $unsigned((wire55 || $signed((&(~reg62)))));
            end
        end
      else
        begin
          reg60 <= $unsigned(((~((reg63 ?
              (8'h9c) : (8'hb8)) <<< reg65[(4'hc):(1'h1)])) >>> ((~^{reg66}) >= (!$signed(reg62)))));
        end
      if (({((^~reg63) < ($signed(reg66) ? {reg64, wire55} : (-reg64))),
          reg66} > (-(~^(!((8'ha2) <<< reg62))))))
        begin
          reg68 <= $signed(($unsigned(wire56[(3'h4):(2'h3)]) + $signed($signed({reg66,
              reg60}))));
          reg69 <= $signed($unsigned({((~^reg64) ?
                  ((8'h9d) ~^ reg66) : (~&reg62)),
              (|$unsigned(wire57))}));
          if (((!{(reg61 ?
                  reg59[(4'he):(4'h8)] : $signed((8'hb2)))}) | ((~&$unsigned((reg63 ?
              reg66 : (8'hbb)))) - (({reg61, (7'h41)} ?
                  reg60 : ((8'had) - reg64)) ?
              wire56 : reg60))))
            begin
              reg70 <= $signed(reg59);
            end
          else
            begin
              reg70 <= reg60[(2'h3):(2'h3)];
              reg71 <= reg63;
              reg72 <= reg71[(3'h7):(3'h6)];
              reg73 <= (&(^~(~^wire56[(4'h8):(1'h0)])));
            end
        end
      else
        begin
          if (((~(-reg73)) ?
              wire58 : (~|{reg64[(2'h3):(1'h0)], wire58[(4'hc):(4'hb)]})))
            begin
              reg68 <= ((8'ha7) > (((^~wire57[(2'h2):(1'h1)]) >= $signed(reg71[(3'h7):(3'h5)])) ?
                  $unsigned((+reg63)) : ($unsigned(reg63) > $signed(wire56))));
              reg69 <= $signed($unsigned(({(wire58 <<< wire55)} ?
                  $signed($unsigned((7'h43))) : ((reg60 >= (8'hac)) ~^ (wire55 - reg70)))));
            end
          else
            begin
              reg68 <= ((|{$unsigned({reg69}), wire56[(3'h7):(3'h5)]}) ?
                  (|{wire56,
                      $unsigned(reg69[(1'h0):(1'h0)])}) : reg69[(1'h0):(1'h0)]);
              reg69 <= ($signed(reg60) ?
                  (($signed((reg63 ? wire56 : (8'ha0))) ?
                      reg66[(2'h2):(1'h0)] : wire57[(2'h2):(1'h1)]) + reg61[(3'h6):(3'h6)]) : (reg70 ~^ ((8'ha3) | $signed((reg68 & (8'ha3))))));
            end
          if ((&((reg60 ?
                  (reg67[(3'h7):(3'h5)] >>> {(8'haa), (8'h9f)}) : ({reg66} ?
                      reg61 : (reg63 ? (8'hb7) : (8'h9d)))) ?
              ($unsigned(reg59) ?
                  $unsigned(reg72) : $unsigned(wire55[(3'h6):(2'h2)])) : (8'ha9))))
            begin
              reg70 <= (+reg71[(3'h6):(2'h2)]);
              reg71 <= ({reg69} ^~ ((~(&(^(8'haa)))) ?
                  reg66 : $unsigned(((8'ha5) ?
                      (reg69 ? reg59 : wire55) : $unsigned(reg70)))));
              reg72 <= {$unsigned({($unsigned(wire57) ?
                          (reg67 > reg60) : (reg72 ^ wire57))}),
                  (|(($signed(reg65) ?
                      wire55 : (!reg67)) >>> reg69[(2'h2):(1'h1)]))};
              reg73 <= $unsigned((~(reg68 ?
                  ($signed(wire57) ?
                      (reg73 ?
                          reg70 : reg67) : reg65[(2'h3):(2'h3)]) : (~reg67[(2'h3):(1'h1)]))));
              reg74 <= (!((reg65 ?
                  ((reg63 ?
                      wire56 : (8'hab)) ~^ {reg64}) : $unsigned($unsigned(reg60))) && $signed(($signed(reg70) + reg61[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg70 <= (|(wire55 <<< (~&(-{reg70, reg70}))));
              reg71 <= $unsigned({$unsigned(((~wire57) ^~ $unsigned(reg65)))});
            end
          if (({(8'hb9)} ?
              ($unsigned((^~wire56[(3'h5):(3'h4)])) ?
                  $signed(((wire55 ? reg66 : reg67) ?
                      wire57 : (reg67 && reg63))) : (^$unsigned((reg70 ?
                      wire56 : reg66)))) : ($unsigned(reg73) | $unsigned(({wire55,
                  reg72} & $unsigned(reg71))))))
            begin
              reg75 <= (|reg69[(1'h1):(1'h0)]);
              reg76 <= ((((~&$signed(reg72)) + wire57[(1'h0):(1'h0)]) ~^ (reg62[(3'h4):(2'h3)] ~^ reg70[(2'h3):(1'h0)])) ?
                  reg70 : ($signed({reg60, {reg69, reg67}}) ?
                      $signed($unsigned(reg65[(3'h5):(2'h3)])) : $unsigned(reg62[(4'hf):(4'hb)])));
              reg77 <= reg60[(4'ha):(1'h1)];
              reg78 <= reg60;
              reg79 <= $signed((|$signed((reg76 ?
                  $unsigned((7'h40)) : (^wire56)))));
            end
          else
            begin
              reg75 <= ((~&(reg68[(1'h1):(1'h1)] ?
                      $unsigned((reg59 ? (8'ha6) : (8'had))) : {(-reg65),
                          (reg76 ? (8'had) : reg77)})) ?
                  (+(-$unsigned($unsigned(reg69)))) : $unsigned((|$unsigned(wire57))));
              reg76 <= (reg73[(4'hc):(2'h3)] ?
                  $unsigned(($signed((reg76 <<< reg79)) ?
                      (^~$signed(wire55)) : wire56)) : (~^$unsigned($unsigned({reg61}))));
              reg77 <= (reg63[(2'h3):(2'h2)] ?
                  (reg64 || reg72) : $unsigned({wire56[(4'hd):(3'h5)],
                      ($unsigned(reg78) ? (~|reg72) : $unsigned(reg66))}));
              reg78 <= (8'ha8);
              reg79 <= ($unsigned($unsigned((reg63[(4'hf):(1'h1)] ?
                      (reg73 ? reg59 : reg62) : $signed(reg77)))) ?
                  (&$signed($unsigned(reg71[(4'ha):(3'h5)]))) : (reg64[(4'ha):(2'h3)] - {$unsigned((-reg69)),
                      wire57}));
            end
          reg80 <= $signed((8'hb9));
          reg81 <= reg60[(3'h7):(3'h7)];
        end
      reg82 <= (wire58 >= $unsigned(reg72));
      reg83 <= reg60[(4'hf):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg84 <= reg81[(5'h13):(5'h10)];
      if (reg69[(2'h2):(1'h1)])
        begin
          if (reg60)
            begin
              reg85 <= reg66;
              reg86 <= (!(^~{reg80[(3'h5):(3'h4)]}));
            end
          else
            begin
              reg85 <= reg84;
              reg86 <= reg81;
              reg87 <= $signed(($unsigned($unsigned(reg61)) && (reg77 ?
                  ($signed((8'haf)) ?
                      (reg71 || reg60) : ((8'h9f) ?
                          reg79 : reg77)) : (+(~^reg81)))));
              reg88 <= reg62[(4'h9):(3'h6)];
              reg89 <= reg67;
            end
          reg90 <= {(reg78 << $signed(reg76[(4'hc):(4'hc)])),
              {reg71[(2'h2):(1'h1)],
                  {($signed(reg74) * $unsigned(reg70)),
                      $unsigned(reg62[(3'h7):(3'h5)])}}};
          reg91 <= {{$unsigned(reg62)},
              $signed($unsigned(((reg66 && wire57) ?
                  wire56[(5'h14):(4'hb)] : {reg68, reg66})))};
        end
      else
        begin
          reg85 <= $unsigned(((reg91[(2'h3):(2'h3)] ^~ (~reg60)) | $unsigned(((8'hbb) || $signed(reg63)))));
        end
      reg92 <= reg80;
      reg93 <= (($signed(($signed((8'ha3)) ^ (reg63 ?
          reg78 : reg63))) <<< reg89[(1'h1):(1'h1)]) != $signed($unsigned((!$signed(reg80)))));
    end
  assign wire94 = ($unsigned($unsigned(($unsigned(reg81) ?
                      (+reg62) : reg72[(4'hb):(4'h8)]))) == $unsigned($unsigned($signed({reg84,
                      reg86}))));
  assign wire95 = reg86[(4'h8):(3'h4)];
  assign wire96 = ({(!(reg70[(1'h0):(1'h0)] < (~|(8'hae)))),
                          (((reg65 ? (8'hb4) : reg74) ?
                              {(8'ha4), reg73} : (reg88 ?
                                  (8'ha5) : reg64)) < $unsigned(((8'ha9) ?
                              reg80 : reg75)))} ?
                      (reg67 >> (8'ha0)) : $signed(reg60[(5'h11):(4'hc)]));
  assign wire97 = wire94[(1'h1):(1'h0)];
  assign wire98 = (($unsigned(reg81) ?
                      wire56[(1'h0):(1'h0)] : reg92[(2'h3):(2'h2)]) | $signed($unsigned($signed($unsigned(reg71)))));
  assign wire99 = ((^~reg91) < reg84);
  always
    @(posedge clk) begin
      reg100 <= reg91[(3'h4):(1'h1)];
      reg101 <= ((reg92 != $unsigned({reg100,
          (+reg75)})) >>> ((((reg61 ~^ (8'ha9)) ?
              $unsigned(reg71) : (^~wire94)) ?
          {reg65, (wire96 <<< reg84)} : reg81) | $signed(wire94)));
    end
  assign wire102 = (^($signed(wire98[(2'h3):(1'h0)]) == reg73[(4'h9):(4'h9)]));
  assign wire103 = reg67[(3'h7):(2'h3)];
  assign wire104 = ((8'h9f) >> ((reg91 ?
                       $signed(reg82[(3'h5):(3'h5)]) : (reg71[(2'h2):(1'h1)] <= $signed(reg85))) + (~^{wire102[(3'h4):(1'h1)]})));
  assign wire105 = wire99;
  assign wire106 = (~|({reg91[(3'h5):(3'h4)],
                       ((reg87 ?
                           wire103 : wire95) == (reg70 ^~ wire58))} ^~ $unsigned($signed((wire96 != wire105)))));
  assign wire107 = {((reg78[(1'h1):(1'h1)] ^~ (&(8'hb8))) - reg87)};
  assign wire108 = {$unsigned($signed(($unsigned(reg87) || wire55[(3'h7):(1'h0)])))};
  assign wire109 = $unsigned($unsigned(reg84[(4'h9):(3'h7)]));
  assign wire110 = (((8'hba) ?
                           {reg78,
                               ((reg74 ? reg59 : reg71) ?
                                   reg81 : (+reg100))} : (~&((wire102 ?
                                   wire107 : (7'h40)) ?
                               $unsigned(reg63) : (~^reg64)))) ?
                       (!(8'ha9)) : reg83[(3'h6):(3'h5)]);
endmodule

module module27
#(parameter param50 = (({(!(+(8'h9d)))} ? (8'hbe) : (({(8'ha4)} ? (^(8'hba)) : (8'hb7)) << ((^~(8'ha6)) ? ((8'ha6) > (8'hb0)) : {(8'hb6)}))) ? ((&(~^((8'haf) && (8'ha7)))) ? ((((8'ha9) ~^ (8'hb7)) >>> ((8'h9f) == (8'ha9))) ? (((8'ha5) ^~ (8'haa)) ? ((8'ha5) ? (7'h42) : (8'h9f)) : ((8'hb0) != (8'hb9))) : (-(~|(8'ha5)))) : (((+(8'ha6)) ? ((8'hbd) ? (8'ha6) : (8'hab)) : {(8'hb9), (8'hb4)}) ? {((8'h9c) ? (8'hb1) : (8'hb7))} : (7'h41))) : (^(({(8'ha2)} & (^~(8'ha8))) >> (7'h41)))), 
parameter param51 = (|(8'hb0)))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire signed [(4'hc):(1'h0)] wire29;
  input wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({(~wire29[(4'hc):(4'hc)]), wire31})
        begin
          reg32 <= (^~((|wire29[(3'h5):(1'h0)]) ?
              wire29 : (~|$unsigned(((8'ha2) | wire30)))));
          reg33 <= $unsigned(reg32[(4'hb):(4'h9)]);
          reg34 <= reg33;
          reg35 <= (({({reg32, reg33} ? (-wire29) : (reg33 ? reg34 : (8'hb7))),
              (&$unsigned(wire30))} ^ $unsigned(((reg32 ?
              (8'hb7) : wire29) || (wire31 | reg34)))) <<< $signed(reg34));
        end
      else
        begin
          reg32 <= $signed($unsigned($signed(reg35[(1'h0):(1'h0)])));
          if (wire30)
            begin
              reg33 <= $signed((8'hbe));
              reg34 <= ({{reg32[(4'he):(3'h5)],
                      $unsigned({reg34,
                          reg34})}} < (^($unsigned(reg33) == reg32[(3'h6):(2'h3)])));
              reg35 <= ({$unsigned($unsigned($unsigned(reg35))),
                  ({$signed(reg32)} ?
                      reg32 : (reg34[(3'h7):(1'h1)] ?
                          ((8'hbf) | reg33) : (8'ha7)))} < wire30);
              reg36 <= wire29[(4'h9):(3'h5)];
            end
          else
            begin
              reg33 <= $unsigned($unsigned($signed((^~{reg35, reg36}))));
              reg34 <= reg32;
            end
          if ((((~((wire30 ~^ wire31) < $unsigned(reg36))) >= $unsigned(((~reg35) ?
                  reg33[(3'h4):(2'h2)] : (^~reg35)))) ?
              (wire31 ?
                  {wire28,
                      (-reg33)} : $unsigned(($signed(wire30) + reg35[(4'ha):(4'ha)]))) : $unsigned((wire29 ?
                  wire29 : reg34))))
            begin
              reg37 <= $signed($unsigned((&$unsigned(wire31))));
              reg38 <= ((reg34[(2'h2):(1'h0)] ?
                      $signed((-(wire31 ?
                          reg36 : reg32))) : {(wire30 ^ (~reg34)),
                          wire28[(2'h3):(1'h0)]}) ?
                  $signed((wire30 != $unsigned((|reg34)))) : ((8'ha1) ?
                      (reg37[(1'h0):(1'h0)] ?
                          (+{reg32, reg36}) : reg33) : ((((8'haf) ?
                              (8'hb2) : wire30) ^~ $signed(reg37)) ?
                          $unsigned({wire31}) : ((reg33 ? wire28 : reg33) ?
                              $signed(wire30) : $unsigned(wire30)))));
              reg39 <= wire28[(2'h2):(1'h0)];
            end
          else
            begin
              reg37 <= {$signed(wire31)};
              reg38 <= {$unsigned($signed((&(~^reg38)))), reg35[(4'ha):(4'h8)]};
              reg39 <= wire28;
            end
          reg40 <= ($unsigned($unsigned((|((8'h9c) | reg34)))) - {((+(wire28 ^~ (8'h9f))) >>> reg32),
              $unsigned($unsigned((reg34 ^ wire28)))});
          if ((7'h40))
            begin
              reg41 <= (wire30 ~^ ($unsigned($signed((~&reg39))) ?
                  $signed((-(reg37 >> reg39))) : (($signed(reg39) ?
                      reg35 : (reg40 | reg32)) && $unsigned($unsigned(wire28)))));
            end
          else
            begin
              reg41 <= reg32;
              reg42 <= $signed(reg41[(4'h8):(3'h5)]);
              reg43 <= wire29;
            end
        end
      reg44 <= ((~&wire28) == wire28);
      reg45 <= (-(reg32[(3'h6):(3'h6)] ?
          $signed((8'h9d)) : (~&$signed($signed(reg32)))));
    end
  assign wire46 = $signed(reg33);
  assign wire47 = wire30[(1'h1):(1'h0)];
  assign wire48 = ({reg35[(4'hd):(1'h0)],
                          (^~$signed((reg34 ? reg44 : reg36)))} ?
                      wire47[(4'h9):(1'h0)] : (~&(~&$signed(reg43[(1'h1):(1'h1)]))));
  assign wire49 = $unsigned(((~|$signed((reg44 ?
                      reg35 : reg44))) <<< wire46[(2'h3):(1'h0)]));
endmodule
