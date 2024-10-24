module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire164;
  wire [(4'ha):(1'h0)] wire163;
  wire [(3'h6):(1'h0)] wire162;
  wire signed [(4'hf):(1'h0)] wire156;
  wire [(5'h13):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire156,
                 wire5,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 (1'h0)};
  assign wire5 = wire2;
  module6 #() modinst157 (wire156, clk, wire4, wire3, wire5, wire1);
  always
    @(posedge clk) begin
      reg158 <= wire4[(1'h0):(1'h0)];
      reg159 <= ($unsigned($signed(((|wire3) ? wire0 : (~(8'ha1))))) ?
          (($signed($unsigned(reg158)) && wire2) ~^ ((~&wire4) ?
              $signed(wire0) : (~|(wire1 ?
                  (8'hb3) : wire5)))) : ($unsigned(wire156) ?
              $unsigned(($signed(wire2) & {(8'h9f)})) : $unsigned(((+wire1) ?
                  ((8'hb2) != wire5) : (8'hab)))));
      reg160 <= {(+wire0[(2'h2):(2'h2)])};
      reg161 <= wire2[(4'h8):(3'h6)];
    end
  assign wire162 = $unsigned(((~^$signed(wire2[(4'ha):(4'h8)])) >= (wire4 <= {(wire3 ~^ reg159)})));
  assign wire163 = $unsigned($unsigned({{$signed(reg161), {wire4, (8'hbe)}}}));
  assign wire164 = $signed($signed((^reg161[(4'ha):(1'h0)])));
endmodule

module module6
#(parameter param155 = (~^{({(-(8'hbd))} >>> ({(8'ha0), (8'hba)} >>> (8'haf))), (~&({(8'had)} ? {(7'h42)} : (~(8'ha9))))}))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire154;
  wire [(5'h12):(1'h0)] wire153;
  wire [(4'h9):(1'h0)] wire152;
  wire signed [(5'h10):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire116;
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire150,
                 wire100,
                 wire57,
                 wire11,
                 wire55,
                 wire102,
                 wire103,
                 wire116,
                 (1'h0)};
  assign wire11 = ((wire7 ^~ (!(-{wire7}))) << ($unsigned({(~^wire7),
                      (|wire7)}) << ($signed(wire7[(2'h2):(1'h1)]) ?
                      $signed($signed(wire9)) : wire7[(2'h3):(2'h2)])));
  module12 #() modinst56 (.wire13(wire8), .y(wire55), .wire14(wire7), .wire16(wire11), .clk(clk), .wire17(wire10), .wire15(wire9));
  assign wire57 = wire55[(3'h5):(2'h2)];
  module58 #() modinst101 (.wire63(wire10), .y(wire100), .wire59(wire55), .wire61(wire8), .wire62(wire7), .wire60(wire57), .clk(clk));
  assign wire102 = $signed(wire57);
  assign wire103 = (wire7[(5'h12):(4'hb)] ?
                       {((|(~|(7'h40))) ?
                               ($signed(wire10) - wire102) : (~^(wire10 ^~ wire11))),
                           wire8} : ((+(~|$unsigned((8'ha7)))) ?
                           $signed({(^~(7'h40)),
                               ((8'hbf) + wire11)}) : {$signed($unsigned(wire7))}));
  module104 #() modinst117 (.clk(clk), .wire105(wire8), .y(wire116), .wire107(wire55), .wire108(wire102), .wire109(wire10), .wire106(wire9));
  module118 #() modinst151 (.wire119(wire7), .y(wire150), .wire121(wire9), .clk(clk), .wire122(wire10), .wire120(wire11));
  assign wire152 = ((~^(((|(8'hb8)) | {wire100}) ?
                       $signed((wire11 >= wire102)) : $signed((wire7 ?
                           wire116 : wire100)))) == $signed((^~$unsigned($signed(wire9)))));
  assign wire153 = $signed(wire152[(1'h1):(1'h0)]);
  assign wire154 = $signed((~&wire153));
endmodule

module module118  (y, clk, wire122, wire121, wire120, wire119);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire122;
  input wire signed [(3'h7):(1'h0)] wire121;
  input wire [(4'h9):(1'h0)] wire120;
  input wire signed [(3'h4):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire149;
  wire signed [(4'hc):(1'h0)] wire124;
  wire signed [(2'h2):(1'h0)] wire123;
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(4'hc):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(3'h7):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  assign y = {wire149,
                 wire124,
                 wire123,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  assign wire123 = wire121;
  assign wire124 = (~|($signed($unsigned((wire123 ~^ wire119))) ?
                       wire119 : wire120[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg125 <= wire122;
      reg126 <= ($signed(($signed(wire121) ?
          wire120[(3'h4):(1'h1)] : $signed((~&wire122)))) == {{wire121[(2'h3):(1'h1)],
              (((8'h9c) ? wire124 : wire119) ?
                  (wire124 ? wire124 : wire123) : (wire119 == reg125))}});
      if ($unsigned(($signed(((wire123 <= wire124) ?
          (+(8'hb8)) : wire123[(1'h1):(1'h0)])) >> (~&reg125[(3'h4):(2'h3)]))))
        begin
          reg127 <= (reg125[(3'h4):(2'h3)] && (8'ha1));
        end
      else
        begin
          if ($signed($signed(wire121)))
            begin
              reg127 <= $signed(wire119);
              reg128 <= (reg125 ? (8'h9f) : wire120[(4'h8):(2'h2)]);
            end
          else
            begin
              reg127 <= ((wire124 >> reg126) ?
                  ((reg126 ?
                      (^wire123) : (reg126[(3'h4):(3'h4)] ?
                          $unsigned(wire120) : (wire119 ?
                              wire121 : reg127))) & ($signed(wire121) != $unsigned($unsigned((8'ha5))))) : (8'haa));
            end
        end
      reg129 <= ((^(reg126 ?
              $unsigned((wire121 && reg126)) : ({reg125} << (~&reg126)))) ?
          {wire122[(3'h7):(2'h3)],
              $signed(wire122)} : {$signed($signed((~^(8'hb6)))),
              (wire124 ? $signed(wire121) : wire123)});
      reg130 <= $unsigned((wire124 <<< reg128[(1'h1):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg131 <= $signed($signed($unsigned(({reg127} ?
          wire120[(1'h0):(1'h0)] : (^reg126)))));
      reg132 <= {$unsigned((wire120[(3'h5):(1'h0)] ^ $unsigned(((7'h43) * wire122)))),
          (!({reg129[(1'h0):(1'h0)]} <<< (|$unsigned((8'hbc)))))};
      reg133 <= {reg128[(1'h0):(1'h0)], $unsigned({wire120[(2'h3):(1'h0)]})};
    end
  always
    @(posedge clk) begin
      if ((reg132[(4'hb):(4'h8)] > (({$signed(wire120), reg126} | ((^wire123) ?
          $unsigned((8'hbb)) : wire119)) < reg130[(4'h9):(3'h5)])))
        begin
          reg134 <= wire124[(3'h4):(2'h3)];
        end
      else
        begin
          if (reg132)
            begin
              reg134 <= (~&{reg134[(2'h3):(1'h1)],
                  $unsigned(($unsigned(reg127) ?
                      {reg126, wire121} : {wire123}))});
            end
          else
            begin
              reg134 <= ((+(+(^~$unsigned((8'hb9))))) || (reg127 ?
                  ($signed((~^reg127)) != (8'hbd)) : (~|$signed(wire121[(3'h7):(3'h5)]))));
            end
        end
      if ($signed(reg127[(2'h3):(1'h0)]))
        begin
          if ((({(~&$signed(reg126)),
              {((8'hab) ? wire121 : reg129),
                  ((8'haa) - wire123)}} <<< wire122[(4'ha):(4'ha)]) | $signed({((~|reg133) ?
                  wire123[(1'h1):(1'h0)] : (-reg131))})))
            begin
              reg135 <= ($signed(reg134[(2'h2):(1'h1)]) >>> $unsigned($unsigned($unsigned($unsigned(wire120)))));
              reg136 <= reg129;
              reg137 <= ($signed($unsigned($unsigned($signed(wire122)))) ~^ $signed($unsigned(($signed(reg135) * $signed(reg125)))));
              reg138 <= (^$unsigned(wire124));
              reg139 <= (~^$signed(reg132));
            end
          else
            begin
              reg135 <= wire124[(3'h5):(2'h3)];
            end
          reg140 <= wire122[(3'h6):(1'h1)];
        end
      else
        begin
          if ((&(~&reg137)))
            begin
              reg135 <= reg130;
              reg136 <= {reg133,
                  $unsigned($signed($unsigned(reg130[(2'h3):(2'h3)])))};
              reg137 <= (wire121[(3'h4):(3'h4)] >> $signed(reg136));
              reg138 <= $signed(((({reg139, reg126} ?
                  reg131[(4'hd):(3'h7)] : (reg126 ?
                      reg139 : reg132)) >>> $unsigned($signed(reg139))) ^~ reg139[(4'he):(4'h8)]));
              reg139 <= $unsigned($signed({reg135[(2'h2):(1'h0)],
                  $unsigned({reg140, reg140})}));
            end
          else
            begin
              reg135 <= $signed((~&((reg132 ^ $unsigned(wire121)) ^ $unsigned($unsigned((8'hb8))))));
              reg136 <= $unsigned((~^$unsigned((|$signed(reg125)))));
              reg137 <= $unsigned(($unsigned((8'hb4)) ^~ (8'ha0)));
              reg138 <= (~&(($signed({wire121}) ?
                  $unsigned(reg131) : (reg131[(3'h4):(2'h2)] || wire120)) >= {(-{reg132,
                      reg129})}));
            end
          if ({reg137, $signed(reg130[(3'h5):(1'h1)])})
            begin
              reg140 <= $signed((reg128[(3'h4):(1'h0)] <<< (!(&((8'hb6) ?
                  reg136 : reg129)))));
              reg141 <= wire121[(2'h3):(1'h0)];
              reg142 <= $unsigned((wire119 ?
                  (($unsigned(reg136) == $signed(reg134)) ?
                      $unsigned(reg139[(4'hd):(4'hb)]) : reg126) : (8'ha0)));
              reg143 <= {{{((wire120 ?
                              (8'haf) : reg136) & $unsigned(reg131))}}};
              reg144 <= $signed(($unsigned({wire124}) <<< (reg131 << (+$unsigned(reg138)))));
            end
          else
            begin
              reg140 <= $signed((!$unsigned(reg137)));
            end
          reg145 <= ($signed(reg132[(1'h1):(1'h1)]) ?
              wire124[(4'hb):(2'h2)] : $unsigned($unsigned(reg128)));
        end
      reg146 <= (8'ha6);
      reg147 <= reg127[(3'h4):(2'h2)];
      reg148 <= ({{($unsigned(reg137) ? $unsigned(reg128) : $unsigned(wire119)),
              $signed($unsigned(reg143))}} == (reg145 && {$unsigned(reg131[(4'h8):(1'h0)]),
          (+(reg143 ? reg140 : reg143))}));
    end
  assign wire149 = $signed($signed((({wire120} ^~ {(8'ha1)}) << (reg131[(4'h9):(3'h4)] ?
                       $signed((8'h9c)) : reg148))));
endmodule

module module104
#(parameter param115 = ((~{(7'h40)}) ? (~{(((8'ha8) ? (8'h9f) : (8'ha8)) * (~&(8'ha1))), (7'h41)}) : (((+((8'ha5) << (8'ha7))) && ({(8'h9e), (8'hb0)} ? ((8'ha1) ? (8'ha5) : (8'had)) : {(8'ha4), (8'ha0)})) + (~|(((8'hba) ? (8'hb0) : (8'ha0)) ? (7'h40) : ((8'h9c) ? (8'hb9) : (8'ha8)))))))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire109;
  input wire signed [(5'h10):(1'h0)] wire108;
  input wire signed [(4'hd):(1'h0)] wire107;
  input wire signed [(3'h6):(1'h0)] wire106;
  input wire [(4'hc):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire114;
  wire signed [(3'h4):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire110;
  assign y = {wire114, wire113, wire112, wire111, wire110, (1'h0)};
  assign wire110 = wire109[(1'h0):(1'h0)];
  assign wire111 = (wire110 && ($signed($unsigned(wire107[(4'hd):(3'h6)])) | $signed((wire105[(4'ha):(2'h2)] != wire110[(4'h9):(3'h7)]))));
  assign wire112 = (wire106[(2'h3):(2'h2)] <<< {(&(&wire110[(4'hd):(4'hb)])),
                       ((wire106 * ((8'haa) < wire107)) ?
                           {wire105[(3'h5):(2'h2)]} : wire111[(2'h2):(1'h0)])});
  assign wire113 = ($signed(((((8'hb7) ? wire108 : wire111) ?
                           (wire112 ? (8'ha5) : wire109) : (~&wire106)) ?
                       $unsigned(wire107[(1'h0):(1'h0)]) : wire106)) ~^ $signed($signed($unsigned($unsigned(wire111)))));
  assign wire114 = $unsigned((~^wire111[(1'h0):(1'h0)]));
endmodule

module module58  (y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire63;
  input wire [(2'h3):(1'h0)] wire62;
  input wire signed [(4'he):(1'h0)] wire61;
  input wire signed [(4'h8):(1'h0)] wire60;
  input wire signed [(5'h11):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire64;
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire64,
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
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire64 = ((wire59[(2'h3):(2'h3)] ?
                          wire61[(2'h2):(2'h2)] : $signed(({wire60} >= wire59[(3'h6):(1'h0)]))) ?
                      $unsigned(wire62) : wire61);
  always
    @(posedge clk) begin
      reg65 <= $unsigned((~&$signed(wire59[(4'h9):(2'h2)])));
      reg66 <= wire63[(4'h8):(4'h8)];
      reg67 <= ({wire64} ? wire59 : $unsigned((^~wire62[(2'h2):(2'h2)])));
    end
  assign wire68 = (~|(-wire64));
  assign wire69 = ((8'hb8) ?
                      $unsigned($unsigned((~&(^(8'ha9))))) : (^~wire60[(1'h0):(1'h0)]));
  assign wire70 = (((wire69 <<< wire60) ? wire61 : wire62) ?
                      (^$signed($unsigned((reg66 & (8'hb0))))) : (-{wire61}));
  assign wire71 = $unsigned($signed(reg66[(1'h1):(1'h1)]));
  assign wire72 = $signed((7'h43));
  always
    @(posedge clk) begin
      reg73 <= (wire62 ?
          (&wire63) : (~^((~&(!wire62)) ?
              ({wire69} ?
                  (wire60 ?
                      reg66 : reg65) : $unsigned(wire71)) : {(~wire71)})));
      reg74 <= ((+({(reg67 ^~ wire63)} ?
              wire72[(3'h5):(3'h4)] : (reg65[(4'ha):(2'h3)] != reg66))) ?
          (8'h9e) : $signed(wire72[(4'h9):(1'h0)]));
      reg75 <= (-(+((!wire70) ?
          (^(~^reg65)) : {wire64[(4'ha):(4'h9)], (+wire63)})));
      reg76 <= (&($unsigned($signed((wire60 | reg75))) | reg74[(3'h6):(1'h0)]));
    end
  assign wire77 = $unsigned($unsigned(((^(&reg65)) ?
                      $unsigned(wire61) : (reg67[(2'h3):(2'h3)] == $unsigned(wire72)))));
  assign wire78 = wire59;
  assign wire79 = $unsigned($unsigned(reg65));
  assign wire80 = $signed($unsigned($unsigned({wire60, (-(7'h41))})));
  assign wire81 = reg76;
  always
    @(posedge clk) begin
      if (((~&$unsigned($signed((reg67 ? wire72 : wire68)))) ?
          reg74 : $unsigned(((+wire61[(2'h3):(1'h0)]) ? wire59 : reg73))))
        begin
          if (wire77[(3'h6):(1'h1)])
            begin
              reg82 <= reg76;
              reg83 <= {(~&{reg66})};
              reg84 <= wire70[(4'ha):(4'h8)];
              reg85 <= wire62;
            end
          else
            begin
              reg82 <= reg85;
              reg83 <= $unsigned($signed((|{wire80[(1'h0):(1'h0)]})));
              reg84 <= wire64[(2'h3):(2'h3)];
              reg85 <= $unsigned($unsigned(reg82[(2'h3):(1'h0)]));
            end
          reg86 <= wire64;
          reg87 <= $signed($unsigned($unsigned(($signed(reg75) ?
              (reg67 ? (8'ha6) : reg76) : (reg84 ? wire72 : wire81)))));
          reg88 <= reg83[(3'h7):(2'h3)];
          reg89 <= $unsigned($signed(($unsigned((wire70 ? reg82 : (7'h44))) ?
              ((wire68 >>> (8'hb4)) ?
                  (reg65 ? (8'ha1) : reg74) : (8'haa)) : reg75)));
        end
      else
        begin
          if ((reg75 ?
              wire77[(4'h9):(4'h8)] : ($unsigned($signed(reg89)) ?
                  $signed((~(^~wire80))) : reg88)))
            begin
              reg82 <= $signed(wire77);
              reg83 <= $signed($unsigned(wire61));
              reg84 <= {{wire69,
                      ({$unsigned((8'ha3)), (reg74 * reg75)} ?
                          reg89[(2'h2):(1'h1)] : (+{reg67}))},
                  (!$signed($signed((wire78 | wire70))))};
            end
          else
            begin
              reg82 <= {{((!{reg88, reg85}) >> reg89)}};
              reg83 <= wire68[(1'h1):(1'h0)];
              reg84 <= (~&{(wire69 > (wire69 >> (~^(8'ha1))))});
            end
          reg85 <= $unsigned((!wire70[(2'h3):(1'h1)]));
          reg86 <= (^~((!(~^wire71)) || $signed($unsigned((wire63 ?
              wire61 : wire62)))));
          if ($unsigned($unsigned((((-wire61) <<< $unsigned(wire71)) ?
              (|wire63) : {{wire64}}))))
            begin
              reg87 <= reg74;
              reg88 <= {($unsigned((+$signed(wire60))) >>> $unsigned($unsigned($unsigned((8'hb3)))))};
              reg89 <= $unsigned((8'hbd));
            end
          else
            begin
              reg87 <= (({((-wire70) ? $signed(wire78) : $unsigned(wire59)),
                      wire60[(2'h3):(1'h0)]} <= (-$signed($signed(reg86)))) ?
                  $unsigned(reg74[(2'h3):(2'h3)]) : ({$unsigned((~&wire79))} ?
                      {$signed($signed(reg83))} : $unsigned(wire70[(2'h2):(1'h0)])));
              reg88 <= $unsigned(reg85[(1'h1):(1'h1)]);
              reg89 <= $signed($unsigned(reg67));
              reg90 <= {$unsigned(($signed($unsigned((8'hbd))) || ($unsigned(reg75) ?
                      $signed(wire77) : $unsigned(reg89)))),
                  $signed(($signed((reg66 >= reg85)) ?
                      reg84[(5'h12):(4'hb)] : reg65))};
              reg91 <= (^~(~$signed($unsigned((reg85 * wire69)))));
            end
        end
      reg92 <= wire61[(4'hb):(4'hb)];
      reg93 <= reg74;
    end
  assign wire94 = $unsigned({$unsigned((8'ha9))});
  assign wire95 = (~^wire68[(1'h0):(1'h0)]);
  assign wire96 = $signed(reg89[(1'h0):(1'h0)]);
  assign wire97 = $unsigned($unsigned((^reg91[(3'h5):(1'h0)])));
  assign wire98 = {(((8'ha1) ? wire61 : ((&reg67) >= $signed(reg73))) ?
                          ({wire77, $signed(reg84)} ?
                              $unsigned($signed(wire69)) : ((reg85 < reg75) & (wire78 ?
                                  wire71 : wire80))) : {$signed((wire60 ?
                                  wire68 : wire63))})};
  assign wire99 = wire59[(4'he):(4'he)];
endmodule

module module12
#(parameter param54 = (8'hae))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire17;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire38,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 wire31,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg37,
                 reg33,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire15[(3'h5):(2'h2)] ^ ($signed(wire17) ?
          wire13 : $signed(((!wire15) ? {wire13} : $signed(wire14))))))
        begin
          if ($unsigned($signed(wire14[(3'h6):(1'h0)])))
            begin
              reg18 <= (^~wire13[(1'h1):(1'h1)]);
              reg19 <= {wire16[(4'ha):(3'h5)]};
              reg20 <= reg19;
              reg21 <= (((($unsigned((8'hb9)) ?
                      wire15[(4'hb):(4'ha)] : $signed(wire16)) == (reg18 || wire17)) | $signed(({wire16} ^~ (wire17 ?
                      wire17 : wire14)))) ?
                  (8'h9d) : {(((wire17 >= wire17) || (wire16 ?
                              reg19 : wire16)) ?
                          wire14 : ((wire17 ? reg19 : wire14) ?
                              (wire17 ? wire14 : (8'hac)) : (wire16 ?
                                  wire17 : reg20))),
                      $unsigned($unsigned(reg20))});
              reg22 <= ($signed((reg19[(2'h3):(1'h1)] ?
                      ((wire14 < wire16) ?
                          (+wire16) : (wire13 > wire13)) : $signed(reg19[(2'h3):(1'h0)]))) ?
                  wire16[(4'ha):(3'h4)] : $unsigned(reg19[(3'h6):(3'h5)]));
            end
          else
            begin
              reg18 <= (|(wire13[(1'h0):(1'h0)] >= wire14));
              reg19 <= $signed({$unsigned((-$signed(wire15)))});
              reg20 <= $unsigned((wire17[(2'h2):(1'h1)] ?
                  $unsigned(reg20[(3'h6):(3'h6)]) : ({$unsigned((8'h9e)),
                      $unsigned((8'ha9))} >> {wire15[(3'h5):(3'h5)]})));
              reg21 <= ((^~{{(reg19 <<< (8'hb8))},
                  (&$signed(reg20))}) || wire13);
            end
          reg23 <= $unsigned((reg19[(1'h1):(1'h1)] ?
              wire13 : ($signed($signed(reg19)) ?
                  $signed((~&reg18)) : wire17[(3'h6):(1'h0)])));
        end
      else
        begin
          reg18 <= reg19;
          reg19 <= (wire16[(2'h2):(1'h0)] ^ (~|($signed(wire17) * $unsigned($signed(wire14)))));
          reg20 <= $signed(wire17);
        end
      if ($signed(($unsigned(($signed(reg18) ?
              (reg19 ? wire14 : wire16) : (wire17 ? (8'h9f) : reg18))) ?
          $signed($signed(wire16[(2'h2):(1'h0)])) : {{$unsigned((8'ha0))}})))
        begin
          reg24 <= $unsigned(((~|(wire17 ?
                  reg23 : ((7'h44) ? wire15 : reg20))) ?
              (~&$unsigned($unsigned(wire16))) : {wire13, wire13}));
          reg25 <= ((wire15[(3'h4):(2'h2)] ?
              ((reg24[(1'h0):(1'h0)] && reg23[(1'h1):(1'h0)]) ?
                  reg23 : (reg18 <<< $signed(wire16))) : reg20[(2'h3):(1'h0)]) != (~((~^(reg22 <= wire13)) ?
              $unsigned((wire17 ? reg22 : wire14)) : wire14)));
          reg26 <= ({reg24} ? wire17 : $unsigned(reg20));
          reg27 <= (!($signed((~^wire16[(4'h9):(3'h6)])) >= (((~reg18) ~^ $unsigned(wire16)) ~^ ((reg18 ?
                  wire13 : reg18) ?
              (reg19 != wire17) : $signed(wire17)))));
        end
      else
        begin
          reg24 <= ((8'ha5) ?
              $unsigned(((^wire13) ?
                  (~^(reg18 ?
                      reg21 : reg25)) : $unsigned(reg23[(2'h2):(1'h0)]))) : $unsigned(reg24));
          reg25 <= $unsigned($unsigned($signed(wire15)));
        end
      reg28 <= $signed((~((reg19 | $unsigned((8'h9e))) ?
          ((reg27 & reg21) << (reg26 != reg27)) : (^~$unsigned(reg25)))));
      reg29 <= (((reg24 ?
              $signed($signed(reg21)) : $unsigned((reg21 > (8'hae)))) + (~&(reg27 + reg18))) ?
          ({(reg20[(5'h11):(4'hb)] ? wire13 : reg23[(1'h0):(1'h0)])} ?
              (8'h9e) : $unsigned((^~(reg28 && reg21)))) : $unsigned((reg20[(2'h2):(2'h2)] < ((wire15 * wire13) ?
              ((8'ha5) ? reg23 : wire13) : wire14[(4'ha):(3'h4)]))));
      reg30 <= reg19[(3'h4):(3'h4)];
    end
  assign wire31 = {{(-reg23), reg29[(2'h2):(2'h2)]},
                      (reg21 > ($unsigned((~|reg24)) ?
                          reg22[(3'h6):(1'h0)] : ($signed((8'hb5)) ?
                              (reg23 ^~ reg24) : {reg22})))};
  assign wire32 = (wire17 + (!$unsigned((-(reg21 ? reg18 : (8'hb4))))));
  always
    @(posedge clk) begin
      reg33 <= (~&wire17);
    end
  assign wire34 = wire31[(4'hb):(3'h6)];
  assign wire35 = (($unsigned($unsigned($signed(reg33))) - ({$signed(reg22),
                          (reg28 >>> reg25)} != $signed({reg22, reg24}))) ?
                      $signed((~|(^$unsigned(reg25)))) : $unsigned(($unsigned((&reg29)) | {$signed(reg22)})));
  assign wire36 = (^((((reg21 ? reg33 : reg30) << reg27) ?
                          $unsigned({reg18, wire34}) : wire15) ?
                      (~&(!reg20[(5'h12):(1'h0)])) : $signed($signed($unsigned(wire14)))));
  always
    @(posedge clk) begin
      reg37 <= (8'h9c);
    end
  assign wire38 = $unsigned(reg21[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg39 <= ($signed((reg30[(4'h8):(1'h1)] << (&(reg26 >>> reg18)))) ?
          $signed(((~$unsigned(reg37)) + reg37)) : $signed(reg23));
      if ($unsigned(($signed($signed(((8'ha5) <<< wire38))) <<< wire13)))
        begin
          reg40 <= (wire31[(2'h3):(1'h0)] == ($unsigned($signed(((8'hbd) < (8'hb2)))) ?
              (((reg37 == reg20) == $signed(wire13)) << (&$unsigned(reg19))) : {((wire36 ?
                      wire34 : reg27) >>> $signed(reg37))}));
          reg41 <= $signed((~{((wire13 == wire38) ?
                  (wire32 | wire31) : $signed((8'ha5))),
              $unsigned((reg20 ? reg25 : reg28))}));
          if (wire13[(2'h2):(1'h0)])
            begin
              reg42 <= (^~wire38[(2'h2):(2'h2)]);
              reg43 <= wire14[(4'he):(4'h9)];
              reg44 <= ($signed((|$signed((reg28 ? wire15 : wire31)))) ?
                  $signed(((~|(wire36 ? reg40 : wire16)) ?
                      $signed((^~(8'ha2))) : (~|reg29))) : (|$signed((reg41[(3'h6):(3'h4)] ^~ (^wire36)))));
              reg45 <= ((8'ha8) ?
                  $unsigned({$unsigned((reg25 & reg28))}) : $signed(reg27[(4'h9):(2'h3)]));
              reg46 <= wire15[(2'h3):(1'h1)];
            end
          else
            begin
              reg42 <= ($signed($signed((~(8'ha7)))) - ((reg41 ?
                  reg46[(3'h4):(2'h2)] : (|wire13[(1'h1):(1'h1)])) ^ (~|(^(&(8'ha2))))));
            end
          if ((|reg27[(4'he):(4'hb)]))
            begin
              reg47 <= $unsigned($unsigned((~^(+(reg41 <<< wire16)))));
              reg48 <= reg39;
              reg49 <= {$signed($unsigned(reg44)),
                  ($unsigned(($unsigned(reg46) <= (reg39 ?
                          (8'had) : (8'hbc)))) ?
                      $unsigned(reg39[(2'h3):(2'h2)]) : (reg33 || (reg33[(4'ha):(2'h3)] ?
                          reg25 : wire13)))};
              reg50 <= wire15[(3'h4):(1'h0)];
            end
          else
            begin
              reg47 <= wire34;
              reg48 <= $signed($signed($signed({$signed((8'hb1)),
                  (reg45 - wire32)})));
              reg49 <= $unsigned(reg20);
              reg50 <= $signed((^$unsigned(wire17[(2'h2):(2'h2)])));
            end
          reg51 <= (reg33 && {(8'h9f), (&(~^$unsigned(reg25)))});
        end
      else
        begin
          reg40 <= (($unsigned(reg48) ? reg47 : (-reg27[(2'h2):(1'h0)])) ?
              $signed($signed((!(reg33 ?
                  wire34 : reg24)))) : reg41[(4'ha):(1'h1)]);
          reg41 <= (8'had);
          reg42 <= wire36[(4'hc):(4'hb)];
        end
    end
  assign wire52 = {$unsigned(reg43[(1'h0):(1'h0)]), (7'h44)};
  assign wire53 = {$unsigned(wire38[(3'h4):(1'h0)]),
                      $signed(((reg21 + (reg46 < reg50)) << ((8'ha3) ?
                          (reg44 ? (8'hb3) : reg18) : $unsigned(reg41))))};
endmodule
