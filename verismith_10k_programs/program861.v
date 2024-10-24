module top #(parameter param214 = (8'hbd)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h208):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire212;
  wire [(5'h13):(1'h0)] wire211;
  wire [(5'h14):(1'h0)] wire209;
  wire signed [(5'h15):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  assign y = {wire212,
                 wire211,
                 wire209,
                 wire123,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire91,
                 wire4,
                 reg6,
                 reg5,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 (1'h0)};
  assign wire4 = {wire3};
  always
    @(posedge clk) begin
      reg5 <= (|($signed(wire1[(3'h4):(1'h1)]) ?
          wire3[(2'h2):(1'h1)] : (8'hba)));
      reg6 <= $unsigned($unsigned($signed(wire0[(1'h0):(1'h0)])));
    end
  module7 #() modinst92 (wire91, clk, wire4, wire3, reg5, wire2, wire1);
  always
    @(posedge clk) begin
      reg93 <= $signed((((wire3 < $signed(wire1)) && ({reg5, wire3} ?
          $unsigned(wire2) : $unsigned(wire4))) >> wire3[(4'h8):(3'h7)]));
      reg94 <= ($signed(((&(reg5 + wire2)) ?
              ((reg5 && (8'had)) > wire2) : (((8'hbf) > wire1) ?
                  (wire2 ? wire3 : wire1) : (wire4 ? reg93 : reg93)))) ?
          (~^(((wire2 & (8'hac)) - reg5[(3'h6):(3'h5)]) ?
              reg93 : (wire3 >> (~|(8'ha5))))) : (|(&reg5)));
    end
  always
    @(posedge clk) begin
      reg95 <= {(($signed((+wire0)) ?
              ((+reg5) ?
                  (reg5 > wire2) : (wire1 ?
                      wire2 : wire2)) : reg94) ^ $unsigned(reg94[(2'h2):(1'h0)]))};
      reg96 <= {(~&wire2),
          ($unsigned(($unsigned((7'h42)) && reg94)) ?
              reg6[(2'h2):(1'h0)] : wire1[(4'h8):(2'h2)])};
    end
  always
    @(posedge clk) begin
      reg97 <= ($signed(wire3) * $unsigned((($unsigned((8'hb1)) - {reg95}) ?
          wire3 : ($unsigned(reg96) - reg93))));
      reg98 <= $signed(wire4[(4'h9):(4'h9)]);
    end
  assign wire99 = $signed(((~|((reg94 != (8'h9c)) ?
                      reg97[(3'h7):(3'h6)] : (+wire91))) <<< wire2[(3'h5):(1'h1)]));
  assign wire100 = $unsigned(reg93);
  assign wire101 = wire1[(2'h2):(1'h1)];
  assign wire102 = $unsigned((!wire101[(1'h1):(1'h0)]));
  assign wire103 = $signed((|($signed((wire102 ? (8'hb2) : wire0)) ?
                       (^((8'hb6) ?
                           reg94 : reg95)) : $unsigned((wire2 < (8'hb5))))));
  assign wire104 = ($unsigned($unsigned($signed(reg94))) != wire0[(4'h8):(4'h8)]);
  always
    @(posedge clk) begin
      if ((($unsigned(wire91[(3'h5):(2'h2)]) ^~ (&wire0)) >>> $unsigned(reg97[(4'hb):(3'h7)])))
        begin
          reg105 <= wire3;
          reg106 <= ((~&(8'hab)) || $signed((-($unsigned(reg98) ?
              reg5 : (reg98 ? wire101 : reg95)))));
          reg107 <= $unsigned($unsigned($signed({$signed(wire4)})));
          reg108 <= $signed($unsigned(({{wire91}} ?
              reg97 : (wire0[(3'h5):(2'h2)] > reg98))));
        end
      else
        begin
          if ($unsigned((((8'hba) > ($unsigned(reg96) ?
                  $unsigned((8'hbe)) : (^~(8'h9c)))) ?
              $unsigned(($signed(reg94) || reg6)) : (reg94 + wire2[(4'h9):(3'h6)]))))
            begin
              reg105 <= $signed((|reg95));
              reg106 <= $signed((reg105[(3'h4):(1'h0)] ?
                  wire0[(1'h0):(1'h0)] : reg94));
              reg107 <= $unsigned($unsigned((wire91[(4'h8):(1'h1)] ?
                  ((^~wire104) * {reg108}) : wire0)));
              reg108 <= {reg6[(1'h0):(1'h0)], $signed((~&(&$signed(reg94))))};
            end
          else
            begin
              reg105 <= (((-$unsigned($signed(reg6))) ?
                      (8'h9f) : {$unsigned((8'hbf)), ((8'haf) <<< {reg6})}) ?
                  (((^~(reg95 ? reg105 : wire4)) - (reg106 ?
                          reg105 : (reg107 ? reg107 : reg93))) ?
                      (($unsigned(reg95) ?
                          reg105 : (wire1 | wire1)) << (reg107[(1'h1):(1'h1)] ?
                          (8'ha6) : $signed((8'hae)))) : reg95) : wire4[(2'h2):(2'h2)]);
              reg106 <= ((^~reg94) ? $signed((8'ha8)) : wire1[(4'h8):(1'h0)]);
              reg107 <= (wire4 ?
                  {($signed((^wire104)) ? (&{wire100}) : (-{reg94})),
                      wire0[(1'h0):(1'h0)]} : $signed((($unsigned(wire101) > {(8'ha2)}) ?
                      $unsigned($unsigned(wire99)) : reg94)));
              reg108 <= (|$unsigned((!wire2[(2'h2):(1'h0)])));
            end
          reg109 <= reg106;
          reg110 <= reg93;
          reg111 <= wire104;
        end
      reg112 <= $unsigned({(reg95 < $unsigned(reg108))});
      if (wire99)
        begin
          if ((reg112[(3'h7):(1'h0)] ?
              (^~$signed($signed(((8'haa) ?
                  reg107 : reg6)))) : ($signed($unsigned($unsigned((8'hb8)))) ?
                  (reg111 * reg96) : $signed((8'hb8)))))
            begin
              reg113 <= (^((~&(~^((8'h9e) ?
                  (8'hbe) : reg109))) ~^ ($signed($unsigned(wire99)) ?
                  {(reg110 ? wire103 : wire0)} : reg97)));
              reg114 <= $unsigned((~&(^((!wire100) ?
                  wire4[(4'ha):(4'ha)] : wire2[(2'h3):(2'h3)]))));
              reg115 <= (~|(reg97[(4'h9):(1'h0)] ?
                  $unsigned((~^(wire102 ?
                      reg95 : reg113))) : {reg112[(2'h3):(1'h0)],
                      $unsigned($unsigned(wire102))}));
            end
          else
            begin
              reg113 <= $signed(wire1[(4'he):(3'h5)]);
            end
          reg116 <= ({(~^((wire100 == (8'ha9)) + reg96)),
                  ((wire0[(3'h7):(1'h0)] < $unsigned(wire2)) >= $signed(wire1[(5'h10):(1'h0)]))} ?
              (((wire0[(1'h1):(1'h1)] > reg113) | ($unsigned((8'h9d)) < {wire104})) > wire104) : {(!(~|wire3))});
          reg117 <= (^wire99[(3'h6):(3'h4)]);
          if (({wire103[(5'h11):(4'h9)], wire102} ?
              ((reg106[(2'h3):(2'h2)] != $signed(reg106)) >> ($signed($unsigned(wire0)) ?
                  ($signed(wire104) >>> (reg113 ?
                      (8'hb9) : (8'ha5))) : (^~(reg95 ?
                      reg108 : wire4)))) : (-$unsigned($signed((&reg115))))))
            begin
              reg118 <= $signed($signed($signed($unsigned({reg94}))));
            end
          else
            begin
              reg118 <= wire100[(2'h3):(2'h2)];
              reg119 <= reg113[(4'hc):(1'h0)];
            end
          reg120 <= reg107;
        end
      else
        begin
          if (wire4)
            begin
              reg113 <= (!reg117);
              reg114 <= $signed(reg98);
              reg115 <= (~|($signed($unsigned(reg109[(4'h9):(4'h9)])) ?
                  ($unsigned((reg110 * reg105)) - ($unsigned(wire104) > $signed((8'hb6)))) : reg117[(4'hd):(2'h3)]));
              reg116 <= reg115[(3'h5):(1'h1)];
              reg117 <= (wire103 ?
                  ($signed($unsigned($unsigned(reg5))) ?
                      $unsigned($unsigned($unsigned(reg115))) : ((!$signed((8'ha8))) ?
                          (~&reg110[(4'h9):(2'h3)]) : $unsigned(reg95))) : ((reg96 ?
                          (reg119[(3'h7):(1'h1)] ?
                              $signed(reg115) : (reg118 & reg114)) : $unsigned({(8'haa),
                              wire103})) ?
                      $signed($signed((|(7'h42)))) : reg119));
            end
          else
            begin
              reg113 <= (!(&$signed($unsigned((reg94 ? wire4 : (8'ha2))))));
            end
        end
      reg121 <= wire91[(3'h5):(2'h3)];
      reg122 <= reg119;
    end
  assign wire123 = $unsigned($unsigned((~reg108[(2'h2):(2'h2)])));
  module124 #() modinst210 (wire209, clk, reg118, reg95, reg98, reg106);
  assign wire211 = (reg122[(3'h5):(2'h2)] <= (!wire101[(2'h2):(2'h2)]));
  module7 #() modinst213 (.wire9(reg118), .y(wire212), .wire10(reg109), .clk(clk), .wire8(wire123), .wire11(reg117), .wire12(wire0));
endmodule

module module124
#(parameter param207 = {({(-(&(8'haa))), ((~|(8'hba)) ? {(8'h9f), (8'ha5)} : (-(8'hbc)))} < {(8'hba), {((7'h43) ? (8'ha3) : (8'hbe)), (~|(8'hbd))}}), {((8'ha6) ? {((8'hb9) > (8'hb8)), (^~(8'ha4))} : (((8'ha6) ? (8'hba) : (7'h40)) | {(8'ha2)})), (&(((8'h9d) && (8'hb0)) > ((8'h9f) <= (8'hb3))))}}, 
parameter param208 = (({(^(~param207)), (^~(~^(8'hb1)))} ? (((param207 >= param207) & (8'ha2)) <= (-(~|param207))) : (((param207 ? param207 : param207) ? (param207 ? param207 : param207) : param207) >> {(param207 ? param207 : param207)})) > (+((~&param207) && ((param207 ^~ param207) ? param207 : param207)))))
(y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire128;
  input wire signed [(3'h5):(1'h0)] wire127;
  input wire [(4'h9):(1'h0)] wire126;
  input wire [(5'h13):(1'h0)] wire125;
  wire [(4'hd):(1'h0)] wire198;
  wire signed [(4'h8):(1'h0)] wire197;
  wire signed [(4'hc):(1'h0)] wire196;
  wire signed [(2'h2):(1'h0)] wire195;
  wire signed [(4'hb):(1'h0)] wire194;
  wire signed [(5'h13):(1'h0)] wire193;
  wire signed [(4'h8):(1'h0)] wire191;
  wire [(4'h9):(1'h0)] wire174;
  wire [(5'h11):(1'h0)] wire172;
  wire signed [(4'ha):(1'h0)] wire140;
  wire [(5'h13):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire129;
  reg signed [(5'h10):(1'h0)] reg206 = (1'h0);
  reg [(4'hb):(1'h0)] reg205 = (1'h0);
  reg [(3'h4):(1'h0)] reg204 = (1'h0);
  reg [(4'hc):(1'h0)] reg203 = (1'h0);
  reg [(4'hd):(1'h0)] reg202 = (1'h0);
  reg [(4'he):(1'h0)] reg201 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(4'hb):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire191,
                 wire174,
                 wire172,
                 wire140,
                 wire139,
                 wire129,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
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
  assign wire129 = (&(($unsigned(wire128) ?
                           (wire127 ?
                               wire126[(3'h4):(3'h4)] : (wire127 ?
                                   wire127 : (8'ha3))) : wire127) ?
                       $signed((wire127[(2'h3):(2'h3)] ?
                           $unsigned(wire128) : $unsigned(wire125))) : ((wire127 ?
                           wire128 : (^(8'ha6))) ~^ (wire126 ?
                           wire128[(2'h3):(1'h1)] : $unsigned(wire125)))));
  always
    @(posedge clk) begin
      reg130 <= (-$signed(wire128));
      reg131 <= {($signed((+(~|(8'hbd)))) >> wire128[(2'h2):(1'h0)]),
          $signed(($unsigned(((8'h9d) ? (8'hb3) : wire126)) ?
              ((wire129 ? wire129 : wire128) ?
                  ((8'had) >>> (8'h9c)) : $signed(wire126)) : ((wire129 & wire129) ~^ wire129)))};
      reg132 <= wire126[(4'h9):(1'h0)];
      if ($unsigned(wire125))
        begin
          reg133 <= wire126;
          if ((^wire129))
            begin
              reg134 <= $signed({$unsigned(reg132)});
              reg135 <= $unsigned(($signed($signed(reg130[(4'he):(4'hd)])) || ($signed((^~reg130)) ~^ $signed((~|wire128)))));
              reg136 <= $unsigned(((8'hac) < wire128[(3'h7):(1'h1)]));
            end
          else
            begin
              reg134 <= $signed(reg132);
              reg135 <= $unsigned($signed($unsigned(((8'hab) ?
                  reg136 : $unsigned(reg132)))));
              reg136 <= (reg134 ?
                  $unsigned((reg136[(2'h2):(1'h1)] || ($signed(reg134) * wire125[(2'h2):(1'h0)]))) : ($unsigned(reg135) ?
                      reg130[(4'hf):(4'ha)] : wire129));
            end
          reg137 <= reg131;
          reg138 <= reg134;
        end
      else
        begin
          if ($signed((({reg136[(2'h2):(1'h1)]} ?
              reg132[(2'h3):(1'h0)] : ((reg138 ? wire129 : wire129) ?
                  $unsigned(wire126) : wire129[(3'h6):(3'h6)])) | ((reg136[(2'h2):(2'h2)] << {wire126}) ?
              reg131 : reg138[(2'h2):(2'h2)]))))
            begin
              reg133 <= {((~^((&wire129) > $signed(reg135))) ?
                      $unsigned($signed((reg138 == reg131))) : reg135[(1'h1):(1'h1)]),
                  (wire125[(2'h2):(2'h2)] ? wire126 : $unsigned(reg131))};
              reg134 <= (~&(8'hbc));
              reg135 <= {wire128};
              reg136 <= ({(+wire127),
                  reg131[(3'h5):(3'h5)]} - reg130[(2'h2):(2'h2)]);
              reg137 <= wire128[(4'h8):(2'h3)];
            end
          else
            begin
              reg133 <= {reg137};
              reg134 <= reg131[(4'hf):(3'h6)];
            end
        end
    end
  assign wire139 = reg137[(3'h4):(1'h0)];
  assign wire140 = reg132[(2'h3):(2'h2)];
  module141 #() modinst173 (.wire142(reg137), .wire144(reg133), .wire143(wire125), .wire146(wire139), .y(wire172), .wire145(reg136), .clk(clk));
  assign wire174 = reg135[(2'h2):(2'h2)];
  module175 #() modinst192 (.wire177(wire129), .y(wire191), .wire179(reg137), .clk(clk), .wire176(wire125), .wire178(reg133));
  assign wire193 = reg132[(3'h4):(3'h4)];
  assign wire194 = reg138;
  assign wire195 = {wire128, (&{wire127})};
  assign wire196 = $signed(wire128);
  assign wire197 = wire127;
  assign wire198 = (wire129 ? reg131 : (&$signed(reg135)));
  always
    @(posedge clk) begin
      reg199 <= reg132[(1'h1):(1'h0)];
      if ($unsigned(wire194))
        begin
          reg200 <= ((wire194[(2'h3):(1'h0)] <<< $signed((~&$signed(wire193)))) * (wire172 >= (8'hab)));
          reg201 <= $unsigned((|reg199));
          if ((($signed($unsigned(wire127)) < $signed($unsigned(wire125))) >>> wire139))
            begin
              reg202 <= reg137[(5'h12):(4'hf)];
              reg203 <= wire139;
            end
          else
            begin
              reg202 <= $signed($signed($unsigned({{(8'h9f)},
                  wire128[(2'h3):(2'h2)]})));
              reg203 <= $unsigned((~&(((~^reg136) >>> $unsigned(reg201)) ?
                  $signed($signed(reg131)) : ({reg201, reg131} ?
                      reg201 : reg133[(1'h0):(1'h0)]))));
              reg204 <= ((wire129 ?
                  $unsigned(reg138) : reg200[(1'h0):(1'h0)]) <<< $signed(($unsigned(reg202) ?
                  {(wire193 * reg130)} : (wire195[(1'h1):(1'h1)] ?
                      (-reg199) : wire126))));
              reg205 <= {$signed(wire195),
                  ({(^((8'hbe) == reg134))} * {(~|{wire127}),
                      $unsigned({(8'ha6), reg137})})};
              reg206 <= reg131[(5'h10):(5'h10)];
            end
        end
      else
        begin
          reg200 <= reg138[(3'h6):(1'h1)];
          reg201 <= ((^reg206) - {$unsigned({$signed((8'hb6))}),
              (($unsigned(wire195) ?
                  $signed(reg205) : (8'hb4)) <= (!(wire128 == reg137)))});
          reg202 <= {reg131, (~|$unsigned((~^wire194[(3'h5):(1'h0)])))};
        end
    end
endmodule

module module7
#(parameter param90 = (8'h9e))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire60;
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire64,
                 wire63,
                 wire62,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire60,
                 (1'h0)};
  assign wire13 = {wire9, $unsigned({(~^wire11), wire8[(1'h0):(1'h0)]})};
  assign wire14 = $signed(({{wire10}} ?
                      (!(&wire12)) : (wire13 ?
                          (!(^~wire11)) : $unsigned((wire9 ?
                              wire8 : wire12)))));
  assign wire15 = ($unsigned(($unsigned((|wire14)) ?
                          (wire14[(1'h1):(1'h1)] ?
                              (wire14 ?
                                  wire14 : wire11) : (wire8 ^~ wire14)) : wire13[(3'h6):(3'h4)])) ?
                      wire13[(5'h11):(3'h7)] : (wire9[(3'h6):(1'h1)] <<< {wire12[(5'h12):(1'h1)]}));
  assign wire16 = (($signed(wire9) ? wire8 : $unsigned(wire10)) ?
                      (8'ha1) : ((wire11[(2'h2):(1'h1)] ^ {wire15[(2'h2):(1'h0)]}) << $signed({((8'hb5) >> wire13),
                          $signed(wire9)})));
  assign wire17 = ((((^~{wire8}) <<< {wire8, wire8}) ?
                          (8'hb5) : (-wire16[(1'h1):(1'h0)])) ?
                      (~&(&{$signed(wire9)})) : ((-$signed({wire9})) + (wire16 <= (wire9 | wire8[(1'h0):(1'h0)]))));
  assign wire18 = wire10[(1'h1):(1'h1)];
  assign wire19 = {wire11[(1'h1):(1'h1)], wire16};
  module20 #() modinst61 (.wire24(wire16), .wire22(wire19), .wire21(wire13), .y(wire60), .clk(clk), .wire25(wire15), .wire23(wire8));
  assign wire62 = $signed((($unsigned($signed(wire9)) ^~ wire12[(2'h2):(2'h2)]) - ((~wire18[(2'h2):(1'h1)]) ?
                      ((~^wire8) ?
                          (wire10 ?
                              (8'ha7) : wire10) : ((8'ha0) ^ wire13)) : {wire9,
                          wire15})));
  assign wire63 = {$signed((&$unsigned((wire15 > wire18))))};
  assign wire64 = wire8[(3'h4):(3'h4)];
  module65 #() modinst85 (.wire68(wire13), .wire66(wire11), .wire67(wire60), .wire69(wire19), .clk(clk), .y(wire84));
  assign wire86 = $signed(($unsigned(wire8) * ($signed(wire12[(1'h1):(1'h0)]) ~^ wire10)));
  assign wire87 = $unsigned((~wire86[(4'hf):(2'h2)]));
  assign wire88 = wire64;
  assign wire89 = wire62[(1'h1):(1'h1)];
endmodule

module module65  (y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire69;
  input wire [(2'h3):(1'h0)] wire68;
  input wire signed [(4'he):(1'h0)] wire67;
  input wire [(4'hb):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire70;
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire70 = $signed($unsigned((({wire66} ?
                      $unsigned(wire69) : $signed((8'ha8))) * wire69[(4'hf):(4'hd)])));
  assign wire71 = (wire68[(1'h0):(1'h0)] ^ (~((|{(8'h9c)}) <<< {wire69})));
  assign wire72 = wire67;
  assign wire73 = wire66;
  always
    @(posedge clk) begin
      reg74 <= (wire73[(4'hd):(4'ha)] ?
          wire68[(2'h2):(2'h2)] : $unsigned($unsigned($unsigned($unsigned(wire69)))));
      reg75 <= (wire69 ?
          (^~((wire72 & $unsigned(wire72)) ?
              (reg74[(4'hf):(4'hd)] ?
                  (~|wire67) : $unsigned(reg74)) : wire69)) : {(($unsigned(wire67) + wire71[(2'h2):(1'h0)]) - $unsigned((wire70 ?
                  (8'hb7) : wire69))),
              $unsigned((reg74 & (7'h43)))});
      reg76 <= $unsigned({wire73[(2'h2):(2'h2)]});
      reg77 <= $signed(wire71);
    end
  assign wire78 = {wire71, reg75};
  assign wire79 = {reg76[(3'h5):(3'h5)],
                      (($unsigned(wire68[(2'h2):(2'h2)]) >> ({wire72} | (reg77 <<< wire67))) * (wire69[(4'hd):(3'h7)] ?
                          ((8'hbe) >>> wire71[(1'h0):(1'h0)]) : $signed((wire66 < wire71))))};
  assign wire80 = (^~$signed($signed((^(~&wire79)))));
  assign wire81 = {((|($signed(wire73) >>> ((8'hb9) ?
                          wire78 : wire78))) >= wire78[(2'h2):(2'h2)])};
  assign wire82 = wire69;
  assign wire83 = ($signed(wire67[(3'h5):(2'h2)]) ?
                      ($signed({(~^wire73), $signed(reg77)}) != {wire78,
                          reg75[(1'h0):(1'h0)]}) : wire70[(2'h3):(1'h1)]);
endmodule

module module20
#(parameter param59 = ((^(!{((8'h9d) == (8'h9d)), {(8'hb4)}})) ~^ ((((7'h41) && (~^(8'ha3))) * (((7'h41) ? (8'hb5) : (8'ha6)) ? ((8'hbb) ? (8'hab) : (8'hb4)) : ((8'ha1) + (8'hbe)))) == (+(((8'hac) ? (8'h9e) : (8'hb3)) ? {(8'ha6)} : ((8'hb3) | (8'hb2)))))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h1b1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire25;
  input wire signed [(4'h9):(1'h0)] wire24;
  input wire [(4'hc):(1'h0)] wire23;
  input wire [(4'h9):(1'h0)] wire22;
  input wire [(4'h9):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire27,
                 wire26,
                 reg58,
                 reg57,
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
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire26 = wire24;
  assign wire27 = ((($signed((wire24 | wire24)) ?
                      ($unsigned(wire21) != wire23[(4'h9):(2'h3)]) : $unsigned({wire26,
                          wire23})) * (~^(~(wire24 ?
                      wire25 : wire23)))) & $unsigned(($signed(wire24) ?
                      wire21 : ({wire21, wire22} ?
                          ((8'ha2) ? wire21 : wire26) : (~|wire22)))));
  always
    @(posedge clk) begin
      reg28 <= $signed({wire26});
      reg29 <= wire25;
      reg30 <= ({$signed(($unsigned((8'hb8)) ?
              (wire24 == wire22) : (reg28 >>> (7'h42)))),
          reg29[(2'h2):(1'h0)]} <<< $signed(wire26[(4'h9):(3'h6)]));
      reg31 <= wire25[(2'h2):(1'h0)];
      if ((((reg28[(4'hc):(3'h7)] ?
          reg29[(1'h1):(1'h0)] : $unsigned((reg31 && wire23))) << ((wire24 << $unsigned((8'hbc))) ?
          wire24[(3'h6):(3'h4)] : ((8'hbe) ~^ wire22))) & reg30[(3'h7):(3'h5)]))
        begin
          if ((+{((!wire27[(2'h2):(1'h0)]) && (wire26[(4'h8):(3'h5)] ~^ wire26[(4'ha):(4'ha)])),
              (+reg28)}))
            begin
              reg32 <= (^~$unsigned(wire27));
              reg33 <= (-$signed($unsigned(({wire25, reg28} ^ {wire23}))));
              reg34 <= wire22[(4'h8):(3'h5)];
              reg35 <= ((wire22 << (&reg32[(4'ha):(3'h5)])) ?
                  (reg28[(2'h3):(2'h3)] ?
                      $unsigned(wire21) : (~(|((8'hbf) >= reg30)))) : wire21[(1'h0):(1'h0)]);
              reg36 <= wire22;
            end
          else
            begin
              reg32 <= (-wire23);
            end
          if ((reg32 ?
              {$signed($unsigned($unsigned(wire23)))} : $signed((|$signed((~|wire21))))))
            begin
              reg37 <= $unsigned(((($signed((7'h42)) == $unsigned(wire22)) != (+(reg32 ?
                  reg32 : (8'hae)))) == (wire24 || wire22)));
            end
          else
            begin
              reg37 <= (+$unsigned((+$signed(reg31))));
              reg38 <= $unsigned(reg33[(4'h9):(4'h8)]);
            end
        end
      else
        begin
          if (wire26)
            begin
              reg32 <= (wire24[(1'h1):(1'h1)] ?
                  ((~|(~$unsigned(wire23))) ?
                      (~$unsigned((wire25 ^ (8'ha8)))) : wire25) : (~|reg29[(4'hb):(2'h3)]));
              reg33 <= (8'hbc);
            end
          else
            begin
              reg32 <= ((~|$signed((reg29 & reg37))) ?
                  ($unsigned(wire26) ?
                      (($signed(reg29) << $unsigned((8'hb3))) > reg33[(2'h3):(2'h3)]) : (((|reg33) + reg35[(1'h0):(1'h0)]) ^~ $unsigned((reg29 ?
                          reg34 : wire27)))) : {reg34,
                      ($signed($signed(reg28)) || (~^(+reg38)))});
              reg33 <= (|$unsigned($signed(($unsigned((8'h9f)) ~^ $unsigned(reg30)))));
              reg34 <= ($unsigned($signed($unsigned($signed(wire23)))) ?
                  reg35 : reg30);
              reg35 <= $signed({(^{(wire23 ? reg34 : wire23), $signed(wire22)}),
                  (^~((8'had) ? (wire27 == reg29) : (^(8'hbf))))});
              reg36 <= wire24;
            end
          if ($signed(reg33))
            begin
              reg37 <= reg34[(1'h0):(1'h0)];
              reg38 <= reg29[(4'ha):(2'h2)];
              reg39 <= $signed(wire27);
              reg40 <= wire26[(4'hb):(3'h5)];
            end
          else
            begin
              reg37 <= (wire23[(1'h1):(1'h1)] << reg32);
              reg38 <= reg34[(3'h5):(2'h2)];
              reg39 <= reg32;
            end
          if (reg32)
            begin
              reg41 <= wire26[(4'h8):(3'h4)];
              reg42 <= wire23[(2'h2):(2'h2)];
              reg43 <= reg39;
              reg44 <= wire21[(4'h9):(1'h1)];
              reg45 <= (^~$signed(($unsigned(wire25) ?
                  $signed(reg41) : reg28)));
            end
          else
            begin
              reg41 <= reg34;
            end
        end
    end
  assign wire46 = (({((|wire27) != reg40[(4'h8):(1'h1)])} ^ $signed($signed({reg36}))) && $unsigned((8'ha3)));
  assign wire47 = (({reg33, (|$signed(reg40))} ?
                          $unsigned($signed($signed(reg35))) : ({$signed((8'haa)),
                                  $unsigned(wire23)} ?
                              ($unsigned(reg31) ?
                                  $signed(wire46) : reg45) : wire27[(5'h13):(2'h3)])) ?
                      (7'h42) : $signed({{((8'h9c) > (8'hb7)), (~wire22)}}));
  assign wire48 = (-$signed({(^~$signed(wire47)),
                      $unsigned((reg28 ? reg36 : (8'ha3)))}));
  assign wire49 = reg44[(3'h5):(3'h4)];
  assign wire50 = reg30;
  assign wire51 = $signed((-reg34[(1'h0):(1'h0)]));
  assign wire52 = $signed((((+(reg28 ~^ wire47)) ? $signed((!reg28)) : wire51) ?
                      $signed((^(reg35 ?
                          (8'ha8) : reg45))) : ((!reg37[(1'h1):(1'h1)]) ?
                          ($signed(reg35) ?
                              $signed(wire25) : wire50[(2'h3):(2'h2)]) : ((wire46 != reg40) ?
                              reg38[(1'h1):(1'h0)] : (reg43 <<< reg30)))));
  assign wire53 = reg38[(2'h2):(1'h1)];
  assign wire54 = reg36[(4'hf):(4'hf)];
  assign wire55 = (+reg33[(3'h7):(2'h3)]);
  assign wire56 = reg34;
  always
    @(posedge clk) begin
      reg57 <= (&$unsigned((~^(^~wire46))));
      reg58 <= ($signed((-(wire52[(3'h5):(3'h5)] > $unsigned(reg43)))) == (((~(~|(7'h42))) <<< $unsigned(wire23)) ?
          reg43[(4'h8):(1'h1)] : (({reg32, (8'hbe)} ?
              (reg35 ^ wire27) : {wire56, reg36}) >> wire48)));
    end
endmodule

module module175  (y, clk, wire179, wire178, wire177, wire176);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire179;
  input wire signed [(4'h8):(1'h0)] wire178;
  input wire signed [(3'h4):(1'h0)] wire177;
  input wire signed [(3'h6):(1'h0)] wire176;
  wire [(5'h14):(1'h0)] wire190;
  wire [(4'he):(1'h0)] wire189;
  wire signed [(5'h15):(1'h0)] wire188;
  reg [(4'hf):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg185 = (1'h0);
  reg [(5'h10):(1'h0)] reg184 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg [(3'h4):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg180 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg180 <= wire176;
      if ($unsigned($signed($signed($signed((-(8'hb1)))))))
        begin
          if (wire178)
            begin
              reg181 <= $unsigned((+(^~wire177[(1'h1):(1'h0)])));
              reg182 <= $signed(($signed($unsigned((wire179 ?
                      (8'ha9) : wire179))) ?
                  (($signed(wire177) ? wire177 : reg180[(1'h0):(1'h0)]) ?
                      wire176[(1'h0):(1'h0)] : $signed((reg181 ?
                          wire179 : reg181))) : $unsigned(wire176[(3'h4):(1'h0)])));
              reg183 <= (wire177[(2'h3):(1'h1)] ?
                  (8'had) : reg180[(2'h2):(1'h0)]);
              reg184 <= $unsigned({(~&$signed(reg182[(3'h4):(2'h2)]))});
            end
          else
            begin
              reg181 <= wire179;
              reg182 <= wire176;
              reg183 <= (wire177[(2'h2):(1'h1)] < {$unsigned($unsigned($unsigned(reg182)))});
              reg184 <= ($signed(reg180[(2'h2):(1'h0)]) ?
                  $unsigned(wire177[(1'h0):(1'h0)]) : (~^($signed((reg183 - reg180)) * wire178[(2'h3):(1'h0)])));
              reg185 <= wire176[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg181 <= $signed(($unsigned(reg180[(2'h2):(2'h2)]) ?
              $signed({reg185, $unsigned(wire178)}) : reg181[(2'h2):(2'h2)]));
          reg182 <= $signed(wire176[(1'h1):(1'h0)]);
          if (reg184[(3'h4):(2'h3)])
            begin
              reg183 <= $unsigned($signed(({$signed((8'hbf)),
                  $unsigned(reg183)} && $unsigned(reg182[(3'h7):(1'h0)]))));
              reg184 <= $unsigned((|{wire176, $signed($unsigned((8'hbf)))}));
            end
          else
            begin
              reg183 <= $unsigned((|$signed(reg180[(1'h1):(1'h1)])));
              reg184 <= ($signed(reg182) ?
                  (^(wire178[(1'h1):(1'h0)] ?
                      (8'hae) : ({reg182} < reg185[(3'h4):(3'h4)]))) : (^~wire179));
              reg185 <= (($unsigned($signed((reg180 ? reg184 : (8'hb6)))) ?
                  (((&wire177) ? $unsigned(reg182) : {wire179, reg185}) ?
                      (wire177[(1'h1):(1'h1)] ?
                          (wire178 <= wire178) : (reg185 ?
                              wire177 : reg180)) : reg182) : (wire178[(2'h2):(1'h0)] ?
                      ((~wire179) ?
                          $unsigned(reg180) : (reg183 && (8'hae))) : (~wire179))) >> (reg183[(3'h7):(2'h3)] && ({(+wire176)} ?
                  (-(8'h9c)) : (((8'h9c) >= reg183) ?
                      (~^(8'hb7)) : $unsigned(wire179)))));
              reg186 <= reg182[(4'hb):(4'h8)];
              reg187 <= $unsigned($unsigned(wire176[(2'h2):(2'h2)]));
            end
        end
    end
  assign wire188 = (^reg185[(4'hc):(1'h1)]);
  assign wire189 = wire177[(1'h1):(1'h0)];
  assign wire190 = {($unsigned($signed((reg185 << reg183))) ?
                           $signed(reg187) : wire178[(3'h6):(2'h2)])};
endmodule

module module141
#(parameter param171 = ((~|{(~|(7'h44)), (((8'ha8) <= (8'hb8)) + ((8'ha6) ~^ (7'h44)))}) || ((~&({(8'hbe), (8'hab)} ? ((8'hba) ? (8'hb6) : (8'haf)) : ((8'hba) ? (7'h42) : (8'hb0)))) == (7'h44))))
(y, clk, wire146, wire145, wire144, wire143, wire142);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire146;
  input wire [(4'hc):(1'h0)] wire145;
  input wire [(4'hf):(1'h0)] wire144;
  input wire signed [(5'h13):(1'h0)] wire143;
  input wire signed [(5'h14):(1'h0)] wire142;
  wire signed [(5'h11):(1'h0)] wire170;
  wire [(5'h10):(1'h0)] wire168;
  wire [(4'hb):(1'h0)] wire166;
  wire signed [(4'ha):(1'h0)] wire164;
  wire signed [(2'h3):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire156;
  wire signed [(3'h5):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire154;
  reg signed [(5'h10):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  assign y = {wire170,
                 wire168,
                 wire166,
                 wire164,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 reg169,
                 reg167,
                 reg165,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg147 <= wire145;
      reg148 <= wire142[(5'h10):(5'h10)];
      reg149 <= ($unsigned($signed(wire144[(4'hb):(4'h8)])) == wire142);
      if ({(wire145[(4'hb):(3'h6)] ?
              $signed({wire146, (wire145 ~^ reg147)}) : {(wire142 || (reg147 ?
                      reg147 : reg147)),
                  $unsigned((8'ha0))})})
        begin
          if (wire142)
            begin
              reg150 <= wire144;
              reg151 <= ($unsigned(({(^~reg150)} ?
                  wire144[(3'h7):(2'h2)] : $signed((wire144 ?
                      wire144 : reg149)))) && wire146[(3'h4):(2'h3)]);
            end
          else
            begin
              reg150 <= wire142;
              reg151 <= (~(&wire144[(4'hb):(4'ha)]));
              reg152 <= (^~(~$signed($signed((~|wire146)))));
            end
          reg153 <= wire146[(5'h11):(4'hd)];
        end
      else
        begin
          reg150 <= $unsigned($unsigned($signed($signed($unsigned(reg148)))));
        end
    end
  assign wire154 = ($signed((wire142 >= reg150[(5'h12):(2'h2)])) ?
                       wire144 : wire145[(1'h0):(1'h0)]);
  assign wire155 = {(wire143[(4'h9):(4'h8)] || {$unsigned(reg153)}), reg150};
  assign wire156 = $signed({(reg148[(4'h9):(2'h3)] ?
                           reg149[(1'h1):(1'h1)] : (((8'ha7) & wire145) ?
                               wire145 : {reg150})),
                       $signed(wire142)});
  assign wire157 = ($signed($signed({reg151[(4'h9):(2'h3)],
                       $unsigned(wire142)})) | $signed(((reg149 >> reg149) || wire143)));
  always
    @(posedge clk) begin
      reg158 <= wire154;
      reg159 <= reg158;
      reg160 <= {reg152[(1'h0):(1'h0)]};
      reg161 <= wire144;
      if ($signed((^{((reg160 & wire144) ? $signed(reg161) : (~reg161))})))
        begin
          reg162 <= wire142[(5'h13):(4'hf)];
        end
      else
        begin
          reg162 <= (&reg151[(4'h9):(4'h9)]);
          reg163 <= ((8'hb4) ?
              reg149[(1'h0):(1'h0)] : ($signed(reg160) ?
                  ($signed($unsigned(reg161)) & (wire154 | ((7'h41) ?
                      wire156 : (8'haf)))) : wire144[(3'h4):(1'h0)]));
        end
    end
  assign wire164 = (~|{$unsigned({$unsigned(wire154)}),
                       (!reg163[(2'h2):(1'h0)])});
  always
    @(posedge clk) begin
      reg165 <= $signed(wire157[(1'h1):(1'h1)]);
    end
  assign wire166 = $signed((&{(reg163[(4'ha):(2'h2)] ?
                           reg147[(2'h3):(1'h0)] : (reg153 <<< wire144)),
                       $signed($signed(wire143))}));
  always
    @(posedge clk) begin
      reg167 <= reg147[(4'hb):(4'h9)];
    end
  assign wire168 = (!reg165);
  always
    @(posedge clk) begin
      reg169 <= reg165[(2'h2):(1'h1)];
    end
  assign wire170 = ($signed((reg150 ?
                       {reg152,
                           $signed(wire168)} : $unsigned({reg167}))) ~^ wire145);
endmodule
