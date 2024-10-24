module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire188;
  wire [(3'h5):(1'h0)] wire186;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire78;
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire188,
                 wire186,
                 wire81,
                 wire80,
                 wire7,
                 wire78,
                 reg5,
                 reg6,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {(~|wire2[(1'h0):(1'h0)])};
      reg6 <= $signed((($unsigned(wire2) ~^ (~&$signed((8'hb5)))) >> ($unsigned(wire2) ?
          $signed(wire3) : wire0[(4'h8):(3'h6)])));
    end
  assign wire7 = (^~($unsigned($unsigned((wire4 ?
                     wire3 : wire0))) <= {$signed(reg6)}));
  module8 #() modinst79 (wire78, clk, reg6, wire7, reg5, wire2, wire0);
  assign wire80 = wire2[(1'h0):(1'h0)];
  assign wire81 = ($signed(((((8'hb3) * wire0) ?
                              ((7'h40) ? wire2 : wire4) : (reg6 ?
                                  wire3 : wire0)) ?
                          reg6[(4'h9):(4'h8)] : {(wire80 ? wire80 : wire4),
                              $signed(wire3)})) ?
                      wire0[(4'hd):(3'h5)] : wire2[(4'hb):(3'h4)]);
  module82 #() modinst187 (.y(wire186), .wire83(wire2), .clk(clk), .wire85(wire0), .wire84(wire4), .wire86(reg6), .wire87(wire1));
  assign wire188 = $unsigned(wire1[(4'hd):(4'h9)]);
endmodule

module module82  (y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h26f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire87;
  input wire signed [(5'h10):(1'h0)] wire86;
  input wire [(5'h14):(1'h0)] wire85;
  input wire [(4'ha):(1'h0)] wire84;
  input wire [(5'h10):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire183;
  wire signed [(5'h10):(1'h0)] wire168;
  wire signed [(5'h11):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire116;
  wire [(4'hb):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire164;
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(4'ha):(1'h0)] reg184 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(4'he):(1'h0)] reg180 = (1'h0);
  reg [(5'h12):(1'h0)] reg179 = (1'h0);
  reg [(2'h2):(1'h0)] reg178 = (1'h0);
  reg [(4'h8):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg176 = (1'h0);
  reg [(3'h5):(1'h0)] reg175 = (1'h0);
  reg [(5'h12):(1'h0)] reg174 = (1'h0);
  reg [(4'hd):(1'h0)] reg173 = (1'h0);
  reg [(5'h12):(1'h0)] reg172 = (1'h0);
  reg [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  assign y = {wire183,
                 wire168,
                 wire167,
                 wire166,
                 wire114,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire116,
                 wire120,
                 wire124,
                 wire128,
                 wire164,
                 reg185,
                 reg184,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg94,
                 reg117,
                 reg118,
                 reg119,
                 reg121,
                 reg122,
                 reg123,
                 reg125,
                 reg126,
                 reg127,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 (1'h0)};
  assign wire88 = ((^~wire85) ?
                      wire84 : (+$signed(((+wire85) ?
                          $unsigned(wire83) : (^wire87)))));
  assign wire89 = {(~|((8'ha0) ?
                          {$unsigned(wire88),
                              (wire84 - wire86)} : wire86[(3'h6):(3'h5)]))};
  assign wire90 = $unsigned(wire89[(2'h2):(1'h0)]);
  assign wire91 = wire85[(3'h6):(3'h6)];
  assign wire92 = $signed(($signed(wire84) ?
                      ($unsigned((wire89 >> wire88)) ?
                          (~wire84) : wire89[(1'h0):(1'h0)]) : ({((8'hbb) > (8'ha9)),
                              {wire83, wire87}} ?
                          $signed({(8'hbb), wire86}) : wire86)));
  assign wire93 = (&((wire91[(1'h1):(1'h0)] ?
                      wire87 : wire88) + (($unsigned(wire84) <<< wire85[(4'hd):(1'h1)]) ?
                      (^wire87[(4'hb):(3'h4)]) : {(wire85 ? wire92 : (8'hac)),
                          wire83[(3'h4):(1'h0)]})));
  always
    @(posedge clk) begin
      reg94 <= $signed((8'hbf));
    end
  module95 #() modinst115 (wire114, clk, wire88, wire83, wire86, wire93, wire85);
  assign wire116 = wire93[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg117 <= wire114;
      reg118 <= {($signed(((reg94 ? wire92 : wire84) ?
                  wire87 : $signed(wire88))) ?
              wire85 : wire88[(1'h0):(1'h0)])};
      reg119 <= $signed(wire114[(4'hd):(1'h0)]);
    end
  assign wire120 = reg118;
  always
    @(posedge clk) begin
      reg121 <= wire114;
      reg122 <= ((-$unsigned(wire87)) < (reg119[(2'h3):(1'h0)] ?
          (^(~(reg119 >= reg118))) : $unsigned(wire87[(1'h1):(1'h1)])));
      reg123 <= (reg121[(3'h5):(3'h4)] ?
          (~($signed((reg117 ? wire116 : wire92)) ?
              (reg118[(4'hb):(2'h3)] ?
                  (wire92 << reg121) : (~|(8'h9e))) : $unsigned($unsigned((7'h42))))) : {wire83,
              $signed({$unsigned(wire93), (+wire87)})});
    end
  assign wire124 = (!wire92);
  always
    @(posedge clk) begin
      reg125 <= (!$signed($signed(wire89[(2'h3):(1'h1)])));
      reg126 <= (reg118 ^~ wire87[(2'h3):(1'h1)]);
      reg127 <= $unsigned((((reg126[(4'h8):(1'h0)] ?
          (wire120 && reg121) : (wire85 <<< reg123)) >> $unsigned(((8'ha3) | reg126))) && (((wire90 ?
              (7'h43) : reg94) ^ $unsigned(wire84)) ?
          $signed((~(8'hb4))) : $unsigned((wire87 ? (8'hba) : (7'h41))))));
    end
  assign wire128 = wire90;
  always
    @(posedge clk) begin
      reg129 <= (!$unsigned($signed({{wire83}, $signed((8'had))})));
      reg130 <= ((8'hb8) ? reg121 : (8'hbd));
      if (($signed($unsigned(wire88[(4'h9):(1'h0)])) >= $unsigned($signed($unsigned((wire116 ^~ wire91))))))
        begin
          reg131 <= $signed(((&$signed((wire114 ? (8'haa) : wire116))) ?
              $unsigned((8'ha6)) : $unsigned($signed($signed(reg94)))));
          reg132 <= $unsigned({((wire89 <<< reg123[(3'h5):(2'h3)]) ?
                  (~(wire116 >>> wire90)) : $unsigned((reg126 * wire88)))});
          reg133 <= reg119;
        end
      else
        begin
          reg131 <= reg125[(2'h2):(1'h1)];
          reg132 <= reg126;
          if (wire90)
            begin
              reg133 <= $unsigned({(8'hb4)});
              reg134 <= (($signed($unsigned(wire124)) < $unsigned($unsigned($signed(wire120)))) ?
                  $unsigned(((((8'had) | wire120) ?
                      $unsigned(reg130) : wire86) > {(wire85 ~^ reg123),
                      (wire92 ?
                          wire92 : wire92)})) : (~&(wire124[(3'h7):(3'h5)] ?
                      $signed(((8'hbe) ?
                          reg122 : reg94)) : $signed(reg121[(3'h6):(2'h2)]))));
              reg135 <= (-$signed({({reg130, reg133} <= (~^reg122))}));
              reg136 <= (wire85 < $unsigned((~&reg126)));
            end
          else
            begin
              reg133 <= reg130;
              reg134 <= (~($signed(wire90[(1'h0):(1'h0)]) >> (reg122[(4'h9):(1'h1)] ?
                  ((reg121 << reg125) - $signed(wire83)) : {$unsigned(wire84)})));
            end
          reg137 <= (^(($signed($signed(wire90)) ?
              ((reg118 ? reg129 : wire114) ?
                  (~^wire91) : ((8'ha4) ? reg131 : wire91)) : ((~|(8'hbf)) ?
                  wire128 : (wire93 >>> (8'h9d)))) ^ ($signed($signed(reg132)) >>> (reg129[(2'h2):(1'h1)] ?
              $signed(wire89) : (wire87 ? reg134 : (7'h42))))));
        end
      reg138 <= reg130[(1'h0):(1'h0)];
    end
  module139 #() modinst165 (.wire140(wire85), .y(wire164), .wire142(reg134), .wire141(wire83), .clk(clk), .wire143(wire116));
  assign wire166 = ((7'h44) ?
                       (~&$unsigned(wire124)) : $unsigned($unsigned((reg136[(3'h7):(3'h7)] ?
                           $signed((8'ha7)) : $unsigned(reg137)))));
  assign wire167 = ((8'h9d) ? $unsigned((^~(~|(8'hae)))) : reg138);
  assign wire168 = (reg126 || (+wire116[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg169 <= ({wire114,
              $signed({(wire168 ? wire86 : reg132), $unsigned((8'hba))})} ?
          $signed(reg123[(3'h6):(3'h6)]) : (~|(-reg126)));
      if (reg134[(3'h5):(3'h5)])
        begin
          reg170 <= (&$unsigned(reg136));
          if (reg125)
            begin
              reg171 <= {(&reg126[(4'hb):(4'hb)])};
              reg172 <= wire168[(4'hc):(4'ha)];
              reg173 <= (&$unsigned($unsigned((wire116 ?
                  {reg130, (8'h9f)} : $signed((8'haa))))));
            end
          else
            begin
              reg171 <= reg94[(1'h1):(1'h1)];
              reg172 <= ((reg123 ~^ ((^(!reg130)) | $unsigned((~|wire167)))) ?
                  (^~$signed($signed((reg137 >= (8'h9e))))) : (reg119[(4'h9):(2'h3)] ?
                      $unsigned((|(~^reg94))) : reg172));
              reg173 <= $unsigned(((((reg173 * wire166) || $signed(reg122)) ?
                      wire86 : wire91[(2'h2):(2'h2)]) ?
                  (&($signed(reg130) >> wire167[(4'h9):(3'h4)])) : wire84));
            end
          if (reg135)
            begin
              reg174 <= $signed(((^($signed(reg130) ?
                  (wire88 == reg129) : $signed(wire85))) ^ (-$unsigned(reg123[(3'h4):(2'h2)]))));
              reg175 <= {((!((~&(8'hae)) ?
                      {wire166,
                          reg117} : (^(8'ha5)))) >>> ((8'hbe) >>> (7'h44))),
                  {wire167, $unsigned({(~wire83)})}};
              reg176 <= (reg121 ?
                  reg126[(1'h0):(1'h0)] : {$unsigned(({reg121,
                          reg130} || $signed(reg129)))});
              reg177 <= $unsigned((reg118[(4'hf):(1'h0)] >= $unsigned({{reg133,
                      reg135}})));
              reg178 <= wire120;
            end
          else
            begin
              reg174 <= wire120;
            end
          if ({reg119[(4'ha):(4'h8)],
              ({(~|$signed(wire90)),
                  wire166[(3'h4):(3'h4)]} != (~(^(reg125 + reg177))))})
            begin
              reg179 <= reg119;
              reg180 <= reg175[(3'h5):(1'h0)];
            end
          else
            begin
              reg179 <= reg180;
              reg180 <= reg125;
              reg181 <= {{($signed((wire128 ? wire92 : reg130)) > reg180)}};
              reg182 <= ((~&((7'h40) <<< $signed((wire93 ? reg123 : reg175)))) ?
                  ((-$unsigned((8'h9c))) ?
                      $signed(reg126) : $signed(($unsigned(wire166) ?
                          $signed(wire85) : wire114[(2'h2):(1'h0)]))) : $unsigned(($unsigned($signed(reg125)) >>> ((^~wire87) <= wire114[(4'hf):(4'hb)]))));
            end
        end
      else
        begin
          reg170 <= reg122[(4'h8):(2'h2)];
          reg171 <= ($signed((((8'hae) && (-wire84)) ?
              (reg126[(4'hb):(3'h5)] ?
                  (^wire87) : reg129) : reg178)) ^~ ($unsigned((reg122 ?
                  $unsigned(reg177) : reg94[(1'h1):(1'h0)])) ?
              {$signed(reg179[(4'hb):(3'h7)]),
                  $signed((|(8'had)))} : $signed({(reg136 - reg121)})));
          if ((+$unsigned($unsigned((reg131[(3'h5):(2'h3)] | (!(7'h42)))))))
            begin
              reg172 <= wire166;
            end
          else
            begin
              reg172 <= reg138[(4'h9):(3'h6)];
              reg173 <= $unsigned(((reg173 ?
                  $unsigned($unsigned(wire168)) : reg136) <= reg133[(2'h2):(2'h2)]));
              reg174 <= reg179;
              reg175 <= {reg126, $signed(reg94[(1'h1):(1'h1)])};
              reg176 <= $signed($unsigned($unsigned((~^$signed(reg133)))));
            end
          reg177 <= wire86[(2'h3):(2'h3)];
        end
    end
  assign wire183 = reg132;
  always
    @(posedge clk) begin
      reg184 <= $signed($signed(($signed((8'hb4)) < $unsigned((wire88 ?
          reg118 : reg127)))));
      reg185 <= $signed(reg174[(3'h7):(3'h4)]);
    end
endmodule

module module8
#(parameter param77 = ((^~(-((~|(8'hbc)) >= {(8'ha0), (8'ha5)}))) - (~&(+((8'ha2) <= (|(8'hbb)))))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire68;
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire14,
                 wire15,
                 wire32,
                 wire34,
                 wire35,
                 wire36,
                 wire52,
                 wire54,
                 wire55,
                 wire56,
                 wire68,
                 (1'h0)};
  assign wire14 = wire9;
  assign wire15 = (~|$unsigned(wire11));
  module16 #() modinst33 (wire32, clk, wire14, wire15, wire12, wire11);
  assign wire34 = $signed($unsigned({$unsigned($unsigned((8'hb6)))}));
  assign wire35 = ((^~wire10) >>> $unsigned(wire10));
  assign wire36 = wire14;
  module37 #() modinst53 (.wire41(wire36), .wire39(wire13), .clk(clk), .wire38(wire10), .y(wire52), .wire40(wire34));
  assign wire54 = ($unsigned((((+wire13) ?
                          (wire9 ? wire13 : wire10) : (wire35 > (8'hb8))) ?
                      $signed(((8'haa) < wire34)) : ((!wire11) ?
                          (!wire15) : (^wire12)))) | wire13);
  assign wire55 = $signed((wire32 ?
                      ($unsigned({wire11, wire36}) ?
                          {(~|wire52)} : $signed(wire54)) : $signed($signed((wire14 ?
                          (7'h42) : wire52)))));
  assign wire56 = ((($signed(wire34[(5'h13):(2'h2)]) + $signed((^wire9))) == wire36[(3'h7):(1'h0)]) ?
                      wire11 : $signed(wire9));
  module57 #() modinst69 (.wire60(wire32), .wire59(wire9), .wire62(wire15), .wire58(wire52), .wire61(wire12), .clk(clk), .y(wire68));
  assign wire70 = $signed(({(~&wire55), (^(wire11 ? wire10 : wire35))} ?
                      wire34[(3'h5):(3'h4)] : (((wire52 - wire10) <<< (+wire9)) < (&wire56))));
  assign wire71 = wire14;
  assign wire72 = wire52;
  assign wire73 = wire10[(1'h1):(1'h0)];
  assign wire74 = $unsigned($signed((+{wire54[(3'h6):(3'h6)]})));
  assign wire75 = wire15;
  assign wire76 = $unsigned($unsigned($unsigned($signed({wire32, wire34}))));
endmodule

module module57
#(parameter param67 = {({((-(8'hb6)) ? (~^(8'hba)) : (8'ha0))} ^~ (!(!((7'h43) ? (8'ha8) : (8'ha5))))), (~|({{(8'hbe)}} && (8'ha7)))})
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire62;
  input wire signed [(3'h6):(1'h0)] wire61;
  input wire [(4'h8):(1'h0)] wire60;
  input wire [(4'hd):(1'h0)] wire59;
  input wire [(4'hb):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  assign y = {wire66, wire65, wire64, wire63, (1'h0)};
  assign wire63 = (~&wire62[(3'h5):(2'h3)]);
  assign wire64 = ($signed((wire58 == (^~((8'ha1) ?
                      wire58 : (8'hb0))))) < (8'hb0));
  assign wire65 = wire61;
  assign wire66 = $unsigned((^(wire65 ? wire58[(1'h0):(1'h0)] : wire60)));
endmodule

module module37
#(parameter param51 = (8'hb2))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire [(5'h15):(1'h0)] wire40;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire signed [(3'h5):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire42 = $unsigned(($unsigned((wire41[(1'h1):(1'h1)] ?
                          $signed(wire38) : (wire38 ? (8'hb2) : wire40))) ?
                      wire41 : $unsigned($signed((+wire39)))));
  assign wire43 = $unsigned((-wire41[(4'hc):(4'h9)]));
  assign wire44 = $signed((8'haf));
  assign wire45 = $unsigned(wire41[(5'h11):(4'hb)]);
  always
    @(posedge clk) begin
      reg46 <= (wire45[(1'h1):(1'h1)] < $signed($signed(($unsigned(wire40) ?
          wire41[(2'h3):(1'h0)] : $signed(wire43)))));
      reg47 <= $unsigned(reg46[(3'h7):(3'h7)]);
      reg48 <= (wire38[(3'h5):(1'h1)] && (8'ha4));
    end
  assign wire49 = $signed($signed((wire45 ?
                      wire39 : $unsigned(wire44[(4'hb):(3'h6)]))));
  assign wire50 = (!{{wire41[(4'hc):(2'h2)]}});
endmodule

module module16
#(parameter param31 = (8'hb3))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire18;
  input wire signed [(2'h3):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire22,
                 wire21,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire21 = wire20[(3'h4):(1'h0)];
  assign wire22 = (~|(8'hbf));
  always
    @(posedge clk) begin
      reg23 <= wire20;
    end
  always
    @(posedge clk) begin
      reg24 <= $signed(wire22);
    end
  assign wire25 = ($unsigned({$unsigned((reg24 << (8'haf)))}) == wire21);
  assign wire26 = (~&(wire21 ?
                      $signed(wire19[(3'h5):(1'h0)]) : {reg24[(1'h0):(1'h0)],
                          {$unsigned(wire25), wire20[(2'h2):(1'h0)]}}));
  assign wire27 = (~|$signed(wire22[(2'h2):(2'h2)]));
  assign wire28 = (($signed($unsigned((wire20 && wire18))) ?
                      wire25 : wire22) != wire21[(1'h0):(1'h0)]);
  assign wire29 = {(((~wire25) ~^ $signed($signed(reg24))) ?
                          wire17 : $signed(wire18)),
                      ($unsigned(wire28) ?
                          wire18[(4'ha):(3'h5)] : reg23[(1'h0):(1'h0)])};
  assign wire30 = $signed($signed($signed((^wire28[(4'hb):(3'h5)]))));
endmodule

module module139
#(parameter param162 = {(-{{(~^(8'haa)), ((8'h9d) < (8'hb1))}})}, 
parameter param163 = ({param162, (param162 || (^~(&param162)))} ? ((8'hb2) ? param162 : (!((param162 ? param162 : param162) || (param162 ? param162 : (8'hb0))))) : {(((param162 ? param162 : param162) - (param162 ? param162 : (8'hb4))) ? {param162, (~^param162)} : ({param162} ~^ (|param162)))}))
(y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire143;
  input wire [(4'he):(1'h0)] wire142;
  input wire signed [(5'h10):(1'h0)] wire141;
  input wire signed [(5'h10):(1'h0)] wire140;
  wire signed [(4'hf):(1'h0)] wire161;
  wire signed [(2'h3):(1'h0)] wire156;
  wire signed [(4'ha):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire [(5'h11):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire151;
  wire signed [(4'h8):(1'h0)] wire150;
  wire [(5'h11):(1'h0)] wire149;
  wire signed [(4'h8):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire147;
  wire [(4'h8):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire145;
  wire signed [(3'h5):(1'h0)] wire144;
  reg [(2'h2):(1'h0)] reg160 = (1'h0);
  reg [(4'hd):(1'h0)] reg159 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  assign y = {wire161,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire144 = (+$unsigned($unsigned(wire140)));
  assign wire145 = (wire140 ?
                       $unsigned(wire140[(1'h1):(1'h0)]) : $signed($signed(($signed(wire144) ?
                           wire142[(4'h9):(1'h0)] : (~|(7'h44))))));
  assign wire146 = $unsigned(({(~&(wire142 <= wire144))} ?
                       $unsigned({(wire144 >>> wire142)}) : wire140));
  assign wire147 = (wire141[(4'h9):(2'h3)] ?
                       ($unsigned((-((8'ha7) > wire145))) >> wire146) : (&wire144));
  assign wire148 = wire146[(3'h4):(2'h3)];
  assign wire149 = $unsigned(((wire148[(2'h3):(1'h0)] ?
                       ($signed(wire143) <= wire144[(3'h4):(3'h4)]) : $signed((~|wire147))) ^ {((~^wire141) ^~ $unsigned(wire140)),
                       $signed(wire145[(3'h7):(3'h5)])}));
  assign wire150 = {{wire148},
                       (^~($signed({wire145}) ?
                           $unsigned(wire148[(4'h8):(3'h7)]) : (~(-wire141))))};
  assign wire151 = (^wire146);
  assign wire152 = ((!((wire143 & $signed(wire148)) ?
                       ($signed(wire151) || (wire149 ?
                           wire140 : wire147)) : ($signed(wire146) ?
                           {wire144,
                               wire151} : (wire141 << wire147)))) || (~$signed(wire140[(4'he):(4'hd)])));
  assign wire153 = {$unsigned((({wire142} ?
                               $signed(wire140) : (wire140 ?
                                   wire148 : wire144)) ?
                           wire149[(4'h9):(4'h9)] : (-wire145)))};
  assign wire154 = {$signed($signed(($signed((7'h43)) ?
                           (wire152 << wire142) : wire146[(1'h1):(1'h0)]))),
                       ((~|wire142) ^ ((wire145 >>> wire145[(3'h7):(3'h7)]) ?
                           $unsigned($signed(wire146)) : wire143[(3'h4):(2'h2)]))};
  assign wire155 = $signed((!($unsigned((wire143 <= wire147)) ?
                       (&wire148[(2'h2):(2'h2)]) : ($unsigned(wire146) ?
                           (wire145 ?
                               wire153 : wire144) : $unsigned(wire149)))));
  assign wire156 = $signed(((-$signed(((8'ha8) && wire147))) ?
                       ((-(~^wire142)) ?
                           ((8'h9e) * wire143[(3'h4):(3'h4)]) : ((wire144 ?
                               wire140 : (7'h41)) << $unsigned(wire145))) : $unsigned($signed($unsigned(wire148)))));
  always
    @(posedge clk) begin
      reg157 <= (8'hb4);
      reg158 <= wire143;
      reg159 <= ((({wire150[(2'h2):(1'h1)], (wire146 ? wire142 : (8'ha7))} ?
              (wire148[(3'h4):(2'h3)] ?
                  wire152[(4'ha):(4'ha)] : (wire152 ^~ wire146)) : $unsigned((^wire144))) ?
          $unsigned($unsigned((wire156 ~^ (8'ha2)))) : (reg158[(1'h0):(1'h0)] + (~&wire156[(1'h1):(1'h0)]))) > (|$unsigned(($signed(wire146) ?
          $unsigned((8'hb5)) : (wire153 ? (7'h43) : wire140)))));
      reg160 <= (wire140 ^ (wire149 <<< wire142));
    end
  assign wire161 = (^(+wire150));
endmodule

module module95  (y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire100;
  input wire signed [(3'h7):(1'h0)] wire99;
  input wire [(4'hc):(1'h0)] wire98;
  input wire signed [(5'h10):(1'h0)] wire97;
  input wire signed [(3'h4):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire109;
  wire [(2'h3):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire101;
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire102,
                 wire101,
                 reg113,
                 reg112,
                 reg111,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire101 = wire99;
  assign wire102 = wire98[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (({$unsigned((wire102 ? wire97[(4'h8):(1'h1)] : {wire97}))} ?
          wire102[(2'h3):(2'h3)] : $signed(wire98[(4'hb):(2'h2)])))
        begin
          reg103 <= (-{(-{$unsigned(wire98), wire99[(3'h5):(3'h4)]})});
          reg104 <= (~^$signed(($signed((reg103 <= wire96)) ?
              ((reg103 ? wire98 : wire102) ?
                  (reg103 ? wire97 : wire102) : {wire99}) : (~^(wire98 ?
                  (8'ha8) : wire99)))));
        end
      else
        begin
          reg103 <= {$unsigned(wire100), wire97};
          reg104 <= (wire100 - wire100);
          reg105 <= $unsigned((|$unsigned(((wire101 ?
              (8'hb1) : wire102) | wire96[(2'h2):(1'h1)]))));
        end
    end
  always
    @(posedge clk) begin
      reg106 <= wire102[(2'h2):(1'h1)];
      reg107 <= ($signed($unsigned((+$signed(wire96)))) >= $signed($signed(wire101[(3'h5):(1'h0)])));
      reg108 <= reg103;
    end
  assign wire109 = wire102[(2'h2):(1'h0)];
  assign wire110 = (({$signed((wire100 ? wire102 : reg104))} < (+((~wire101) ?
                           $unsigned(wire96) : wire96))) ?
                       $unsigned(wire97[(4'h9):(2'h3)]) : $signed(wire101[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg111 <= (($signed((reg107[(3'h4):(2'h3)] ?
          (8'hb7) : wire101[(1'h0):(1'h0)])) ~^ (~(-(8'hb3)))) ~^ reg103[(4'h9):(3'h5)]);
      reg112 <= ({(+($signed(reg104) ? $signed(wire97) : {reg103, wire98}))} ?
          {wire109[(4'hd):(4'hd)],
              ($unsigned(wire101) ?
                  reg108[(3'h4):(1'h0)] : wire99)} : $signed(reg107[(2'h3):(1'h1)]));
      reg113 <= reg103[(4'h9):(1'h1)];
    end
endmodule
