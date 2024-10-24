module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire142;
  wire signed [(4'hd):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire [(3'h4):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire130;
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire134,
                 wire133,
                 wire132,
                 wire4,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire130,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg137,
                 reg136,
                 reg135,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ({$signed($unsigned((&wire3))),
                         {wire0[(2'h2):(2'h2)], (wire0 ? (8'hb0) : wire2)}} ?
                     $signed((^~(!$signed(wire1)))) : (&$unsigned($signed($unsigned(wire0)))));
  always
    @(posedge clk) begin
      reg5 <= wire1;
      reg6 <= $unsigned((wire4 ?
          wire0 : (|((wire3 ? reg5 : wire2) ?
              (wire1 >>> (8'hb2)) : (^~wire3)))));
    end
  assign wire7 = wire3[(2'h2):(1'h1)];
  assign wire8 = wire4;
  assign wire9 = $signed(wire3[(4'h9):(3'h6)]);
  assign wire10 = ((~&wire1[(3'h6):(3'h5)]) + (~^wire0));
  assign wire11 = wire1;
  module12 #() modinst131 (wire130, clk, wire1, wire2, wire11, wire7, wire8);
  assign wire132 = {(wire130 | reg5), wire8[(3'h7):(3'h6)]};
  assign wire133 = (8'hb4);
  assign wire134 = {(wire8 + ($signed(((8'ha7) >> (8'hbc))) ?
                           wire2 : (!wire11[(2'h3):(1'h0)])))};
  always
    @(posedge clk) begin
      reg135 <= {wire3};
      reg136 <= (~|$unsigned((~&wire7)));
      reg137 <= (wire4[(1'h0):(1'h0)] ?
          wire11 : $unsigned(reg135[(3'h5):(3'h4)]));
    end
  assign wire138 = $signed((((wire133 ?
                       $unsigned((8'h9c)) : wire133) & (^~(^~reg136))) ~^ ($signed($unsigned(wire3)) ?
                       wire132[(1'h0):(1'h0)] : ((wire130 ?
                           wire134 : reg136) >> (wire10 < reg135)))));
  assign wire139 = (+{$unsigned((&wire7))});
  assign wire140 = ((~&{((8'haf) < reg136[(3'h5):(2'h3)])}) != ($unsigned((wire9[(1'h0):(1'h0)] ?
                           wire138[(1'h1):(1'h0)] : $unsigned(wire130))) ?
                       ((reg5 ?
                           ((8'h9c) < wire11) : (+wire3)) >>> $signed((~reg6))) : ((|(8'hbb)) ?
                           reg6 : ($unsigned(wire2) ?
                               {wire10, wire0} : $signed(wire132)))));
  assign wire141 = ((((~{wire1}) ?
                           wire11[(4'hd):(3'h4)] : ((reg6 ? wire9 : reg5) ?
                               $signed(wire9) : $unsigned(wire133))) ?
                       (^~((wire11 >= reg135) && (^~wire0))) : $signed(reg136)) | ($signed($signed($signed((8'hb2)))) ?
                       {((^(8'hb2)) ? (&(8'hb1)) : $unsigned(wire7)),
                           $unsigned($unsigned((8'ha4)))} : {(wire139[(4'h9):(3'h4)] + wire4[(3'h6):(1'h0)]),
                           (8'hb3)}));
  assign wire142 = (wire140[(3'h6):(3'h5)] ^~ wire139[(4'h9):(2'h2)]);
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg143 <= ((~&(($unsigned(wire4) != wire141[(1'h1):(1'h1)]) ?
                  wire9[(1'h1):(1'h0)] : $signed((^wire139)))) ?
              ($unsigned(reg5) ?
                  $unsigned(wire1) : $unsigned(wire138[(3'h4):(1'h1)])) : (~^reg6));
          reg144 <= (wire140 ?
              wire0[(4'he):(4'hd)] : (^(wire3 ?
                  wire8[(4'he):(3'h7)] : $signed(wire1))));
          if ($unsigned($signed($unsigned($signed({reg136, reg143})))))
            begin
              reg145 <= $unsigned($signed((($signed(reg144) == $unsigned((8'had))) ^ reg135)));
              reg146 <= reg5;
              reg147 <= (8'hb8);
            end
          else
            begin
              reg145 <= $signed($signed(($signed(reg5[(4'h9):(3'h7)]) ^ ((^wire10) ?
                  $unsigned((7'h44)) : (wire4 ? wire142 : (8'hab))))));
              reg146 <= ((wire4 ~^ $unsigned($unsigned((!reg144)))) ^ (^((wire8[(1'h1):(1'h1)] ?
                  (wire132 < wire3) : $signed(wire139)) > $unsigned(reg136))));
              reg147 <= $unsigned(($signed($signed(wire0[(5'h11):(1'h0)])) ?
                  wire7[(4'h9):(3'h5)] : wire141[(3'h6):(3'h4)]));
              reg148 <= (-$unsigned((wire134[(4'hc):(2'h3)] ?
                  (+(wire9 && wire130)) : (^~$signed(reg5)))));
              reg149 <= (wire140 > ((wire139[(3'h7):(1'h1)] ?
                  (^reg147[(4'h8):(1'h0)]) : (|(&wire132))) > wire140));
            end
          reg150 <= $unsigned($signed(wire3[(1'h1):(1'h1)]));
        end
      else
        begin
          reg143 <= wire7;
          reg144 <= $unsigned(reg144);
          reg145 <= ($signed((~^$unsigned($signed(wire133)))) >> wire4);
          reg146 <= wire10[(4'he):(4'hc)];
        end
      if (((reg146 ?
              (~$signed($signed(wire4))) : ($signed((reg136 ~^ reg144)) <<< wire134)) ?
          $signed($signed($unsigned(reg150[(1'h0):(1'h0)]))) : wire7))
        begin
          reg151 <= wire2[(2'h2):(1'h1)];
          reg152 <= $signed($signed($unsigned({wire8,
              ((8'hbf) ? reg148 : reg135)})));
          if (({reg145[(5'h10):(4'hb)],
              $unsigned(($signed((8'ha3)) == reg136[(4'h8):(2'h3)]))} <<< wire140[(1'h1):(1'h0)]))
            begin
              reg153 <= reg149[(4'hd):(3'h7)];
              reg154 <= $unsigned((~^(&$unsigned(reg151[(3'h7):(3'h6)]))));
            end
          else
            begin
              reg153 <= {wire142};
              reg154 <= {{($unsigned((wire11 < wire7)) && (&(reg144 ?
                          reg135 : (8'hb6)))),
                      {reg147, (~&((8'haa) ? wire9 : wire0))}},
                  $unsigned((((wire141 >= (8'hbe)) ?
                          wire0 : {wire138, reg146}) ?
                      $unsigned($signed((8'hb4))) : ($unsigned((8'ha4)) ?
                          wire8 : wire4)))};
              reg155 <= {reg153[(4'he):(4'hb)]};
              reg156 <= (|wire7);
              reg157 <= reg150[(2'h3):(1'h0)];
            end
          reg158 <= (wire3[(2'h3):(2'h2)] && $unsigned($signed({(8'hb8)})));
        end
      else
        begin
          reg151 <= $unsigned({($signed((wire130 <<< wire10)) ?
                  wire4 : ((reg153 * wire8) ? reg155 : $signed(reg135))),
              reg5});
          if ((wire7[(5'h12):(4'hf)] * $signed($signed(wire141))))
            begin
              reg152 <= reg157[(1'h1):(1'h0)];
              reg153 <= wire0[(1'h1):(1'h0)];
              reg154 <= reg135[(3'h4):(1'h0)];
              reg155 <= $signed(({reg149,
                  ($signed(reg157) + $unsigned((8'hb1)))} | wire139[(3'h7):(2'h3)]));
              reg156 <= ((($unsigned(wire9) >= (wire9 ^~ wire9)) ?
                  ((8'hae) ?
                      ((8'hbe) ?
                          (reg6 - wire138) : wire141) : $unsigned(wire138[(3'h4):(2'h2)])) : $signed(((wire8 ?
                          wire0 : wire9) ?
                      $signed(reg146) : (wire8 >= reg157)))) != wire134);
            end
          else
            begin
              reg152 <= $unsigned(wire9);
              reg153 <= reg150[(5'h12):(2'h2)];
              reg154 <= reg6[(3'h7):(3'h6)];
            end
          reg157 <= ($signed((8'hba)) ^~ (wire2[(4'h8):(3'h6)] == $signed(wire2)));
          reg158 <= wire11;
          reg159 <= (!(~^wire141));
        end
    end
endmodule

module module12
#(parameter param129 = ((~({{(8'hb2), (8'hae)}, (~&(8'h9d))} ? ({(7'h42), (8'ha2)} << ((8'ha1) * (8'hbd))) : (((8'ha6) == (8'hb5)) >= ((8'hba) >> (8'h9d))))) ^ ((-(~|((8'ha3) ? (8'haa) : (8'ha6)))) << ((~((8'hbc) | (7'h44))) ? ({(8'hac), (8'ha7)} ? ((8'ha3) != (8'had)) : (~(8'ha2))) : (((8'ha7) < (8'hb4)) ? {(8'hb4), (8'h9d)} : {(8'ha2), (8'ha0)})))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire [(4'ha):(1'h0)] wire122;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire120;
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire122,
                 wire61,
                 wire26,
                 wire18,
                 wire120,
                 reg124,
                 reg123,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = (wire13[(3'h5):(3'h4)] ?
                      wire17[(4'h9):(4'h8)] : (wire17[(3'h6):(2'h3)] ?
                          wire13[(5'h11):(4'hd)] : ((~$signed(wire14)) && $unsigned(wire14[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg19 <= wire17[(2'h2):(2'h2)];
      if (wire14[(2'h2):(2'h2)])
        begin
          reg20 <= (8'hb4);
        end
      else
        begin
          if (wire18)
            begin
              reg20 <= reg19[(3'h6):(1'h1)];
              reg21 <= reg19[(2'h2):(1'h1)];
              reg22 <= $signed(wire17);
              reg23 <= (^wire15[(5'h12):(1'h1)]);
            end
          else
            begin
              reg20 <= reg23;
              reg21 <= ((+$unsigned(({(8'h9d)} | $unsigned(reg21)))) ?
                  (^wire14) : (($unsigned({wire18,
                          wire15}) * {wire18[(2'h3):(2'h3)], $signed(wire16)}) ?
                      (wire17[(1'h0):(1'h0)] <= (~(^~(7'h40)))) : $unsigned(reg20)));
              reg22 <= (!$signed({reg22[(2'h2):(2'h2)]}));
              reg23 <= (+wire15);
              reg24 <= $signed(wire17);
            end
          reg25 <= (^(+(|{(~reg21)})));
        end
    end
  assign wire26 = $unsigned(wire16[(2'h2):(2'h2)]);
  module27 #() modinst62 (.wire28(wire14), .wire31(reg21), .wire29(reg20), .wire30(wire16), .clk(clk), .wire32(wire18), .y(wire61));
  module63 #() modinst121 (.wire64(wire14), .wire68(wire61), .wire65(reg24), .wire67(wire15), .wire66(reg23), .clk(clk), .y(wire120));
  assign wire122 = ($unsigned(reg24[(1'h1):(1'h0)]) ?
                       ($unsigned($signed($signed(reg22))) ?
                           (((reg20 != wire14) ^~ $unsigned(wire120)) ?
                               {(|wire18)} : ((^~wire61) | (reg25 ~^ wire26))) : reg25[(3'h5):(3'h5)]) : reg24[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg123 <= (!$unsigned(reg24[(1'h1):(1'h0)]));
      reg124 <= reg22[(2'h2):(1'h1)];
    end
  assign wire125 = (wire120[(1'h1):(1'h0)] ^~ (8'ha0));
  assign wire126 = (wire26[(4'he):(2'h2)] <= (-$signed($unsigned((reg124 ?
                       reg123 : wire14)))));
  assign wire127 = {$unsigned($signed(wire26))};
  assign wire128 = reg24[(3'h5):(3'h4)];
endmodule

module module63  (y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h27c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire68;
  input wire [(3'h5):(1'h0)] wire67;
  input wire signed [(3'h4):(1'h0)] wire66;
  input wire signed [(3'h7):(1'h0)] wire65;
  input wire signed [(2'h3):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire119;
  wire signed [(3'h6):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  assign y = {wire119,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire90,
                 wire70,
                 wire69,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
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
                 reg92,
                 reg91,
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
                 (1'h0)};
  assign wire69 = wire68;
  assign wire70 = (($signed(wire67[(2'h3):(1'h1)]) * $unsigned(wire64[(2'h3):(1'h0)])) ?
                      $unsigned(wire65[(1'h1):(1'h0)]) : (wire64[(2'h3):(2'h2)] ?
                          {(~&(wire68 ?
                                  wire67 : wire64))} : $signed((|wire65))));
  always
    @(posedge clk) begin
      reg71 <= wire67[(1'h0):(1'h0)];
      reg72 <= ($signed(wire68[(1'h0):(1'h0)]) - $signed(($signed({(8'hb5)}) ?
          $signed(reg71[(1'h0):(1'h0)]) : ((wire65 ? wire67 : wire64) ?
              $unsigned(reg71) : (^~(8'hb0))))));
      if ((!(~$signed($signed((^wire70))))))
        begin
          reg73 <= wire65;
        end
      else
        begin
          reg73 <= $unsigned(($signed((8'haa)) ?
              wire65 : (|$unsigned(wire66))));
          reg74 <= wire65;
          if ({(+(($unsigned(wire67) ?
                  (wire70 != (7'h43)) : (reg72 ^ (8'haf))) - reg74)),
              (($unsigned(((8'hbe) ? wire67 : wire70)) ?
                  {{wire69},
                      wire67} : reg71[(2'h2):(1'h1)]) <<< (($signed(wire68) <= (+wire64)) ?
                  (&wire64[(1'h1):(1'h1)]) : reg71[(2'h3):(1'h1)]))})
            begin
              reg75 <= (wire69 ? wire65 : reg74);
              reg76 <= (($signed($unsigned($unsigned(reg75))) ?
                  ($signed({(8'h9c), (8'ha0)}) ?
                      (+wire68) : wire64) : wire65) > $signed(reg74));
              reg77 <= wire68[(3'h5):(2'h2)];
              reg78 <= (~(((+(wire64 ?
                      wire64 : wire70)) != ($unsigned(wire64) - $signed(reg72))) ?
                  {{$unsigned(reg71), reg76[(5'h15):(5'h12)]},
                      (~&(reg72 - reg76))} : $unsigned((reg77[(1'h1):(1'h0)] ?
                      (+reg72) : (wire68 ? (8'hb9) : (7'h42))))));
            end
          else
            begin
              reg75 <= $unsigned(reg74);
            end
          reg79 <= ($unsigned((wire66 + (~wire70[(3'h5):(1'h1)]))) ?
              $unsigned(({$signed(reg78),
                  $signed(reg78)} - wire66[(2'h2):(2'h2)])) : ($signed(reg74[(2'h2):(2'h2)]) ?
                  $signed((~^(reg73 ? reg74 : wire67))) : $unsigned((reg78 ?
                      wire67[(1'h0):(1'h0)] : (reg72 ? reg72 : wire69)))));
          if ((wire69[(2'h2):(2'h2)] ?
              ($unsigned(wire64[(1'h0):(1'h0)]) * reg78[(2'h2):(1'h0)]) : reg75))
            begin
              reg80 <= (^$unsigned($signed((^(reg71 ? reg74 : reg76)))));
              reg81 <= wire64[(1'h1):(1'h1)];
              reg82 <= ((+(-$signed((-(8'ha9))))) & ((((~reg77) ?
                  reg78[(4'hc):(3'h4)] : {reg76,
                      wire68}) >= wire68) != wire68));
              reg83 <= (~&($signed((+wire69[(5'h11):(4'h8)])) * ($signed((wire64 ?
                      reg80 : reg77)) ?
                  $unsigned((wire64 ?
                      (8'hb4) : wire64)) : (wire66[(2'h2):(1'h0)] & $unsigned(reg78)))));
            end
          else
            begin
              reg80 <= reg71;
            end
        end
      if (wire64[(2'h3):(2'h3)])
        begin
          reg84 <= $signed((wire68[(4'h8):(2'h3)] ?
              ({wire70} ?
                  $unsigned($signed(reg78)) : {$signed(reg77),
                      reg71}) : reg76));
          reg85 <= $signed(reg80[(1'h0):(1'h0)]);
          reg86 <= reg81[(1'h1):(1'h1)];
          reg87 <= $signed((+$signed((((8'hb3) ? reg75 : reg83) ?
              {reg80, (8'ha8)} : $unsigned(reg78)))));
          reg88 <= ($unsigned(reg73[(3'h4):(2'h3)]) >>> reg71);
        end
      else
        begin
          reg84 <= ($signed((8'ha2)) > reg83);
          reg85 <= $signed(reg77);
          reg86 <= (wire66[(2'h2):(1'h1)] ?
              $signed({$unsigned(reg78[(4'he):(3'h6)])}) : {$unsigned((8'hb0)),
                  {$signed($signed(reg71)),
                      (((8'ha9) != (8'h9d)) ? (~|wire64) : (&(8'hae)))}});
          reg87 <= reg86;
          reg88 <= ($unsigned(reg87) ? (|(8'ha6)) : wire68[(3'h4):(3'h4)]);
        end
      reg89 <= $unsigned(reg75);
    end
  assign wire90 = {(+$signed($unsigned($unsigned((8'hb4))))),
                      reg74[(3'h5):(2'h2)]};
  always
    @(posedge clk) begin
      if (wire70)
        begin
          reg91 <= (wire90[(4'hb):(4'ha)] ?
              ($unsigned({wire69[(4'he):(4'h9)],
                  reg89}) || ($unsigned(reg82) << ({wire69, wire68} ?
                  reg80 : $signed(wire65)))) : wire65);
          reg92 <= (+(~&({reg71} ^~ reg75)));
        end
      else
        begin
          reg91 <= $signed(wire90[(3'h4):(2'h2)]);
          reg92 <= wire66;
        end
    end
  assign wire93 = wire65;
  assign wire94 = reg85;
  assign wire95 = reg75;
  assign wire96 = ({{(wire69[(4'hf):(3'h6)] >= wire95[(3'h6):(1'h0)]),
                          reg87}} > ((($unsigned(reg73) ?
                          $unsigned((8'ha0)) : (reg91 ?
                              (8'hbb) : reg72)) >> {(reg73 ? reg82 : reg81)}) ?
                      {reg71,
                          (reg72[(2'h3):(1'h0)] ?
                              (reg80 & reg87) : {reg87})} : wire90[(3'h4):(2'h3)]));
  assign wire97 = (^~{($unsigned(((7'h43) != reg75)) > $signed(reg73)),
                      $unsigned((^~(&reg80)))});
  assign wire98 = reg73[(2'h2):(1'h1)];
  assign wire99 = (&$signed((~^reg82)));
  assign wire100 = $unsigned(((wire94[(2'h3):(2'h3)] ?
                           reg73[(2'h2):(1'h1)] : reg84[(4'ha):(1'h1)]) ?
                       (wire70[(3'h5):(1'h1)] ?
                           (((8'ha7) ^ reg72) - wire66[(2'h2):(1'h0)]) : ({wire70,
                                   reg74} ?
                               $signed(reg82) : (wire98 ?
                                   (8'ha1) : reg88))) : (~^({reg86} ?
                           {reg87, wire98} : (wire99 ? reg91 : reg84)))));
  always
    @(posedge clk) begin
      if ((8'ha6))
        begin
          reg101 <= (+$signed((($signed(reg73) ?
              reg72 : (wire65 ~^ reg80)) >>> $unsigned(wire97))));
          reg102 <= (8'hb5);
          reg103 <= $unsigned({(reg77 ? {(~^wire68)} : $unsigned((^reg78)))});
          reg104 <= (^~((((wire90 ? reg78 : wire99) ?
              reg88 : wire90[(4'h8):(3'h6)]) >= (wire97 || reg74)) + $unsigned((^reg101))));
          reg105 <= {$signed((reg103 > (^wire90))), wire96[(2'h2):(2'h2)]};
        end
      else
        begin
          if ((^~$unsigned($signed($unsigned(wire99[(4'hf):(1'h0)])))))
            begin
              reg101 <= (reg88[(2'h3):(1'h1)] ?
                  ((^$unsigned(reg77[(2'h3):(1'h0)])) | ({wire67,
                          $signed(reg105)} ?
                      reg78[(1'h0):(1'h0)] : reg75)) : (|$unsigned($unsigned((~reg91)))));
            end
          else
            begin
              reg101 <= (reg74[(3'h6):(3'h6)] ?
                  $unsigned(reg81[(1'h1):(1'h1)]) : reg74);
              reg102 <= (+$unsigned(($unsigned((8'haa)) || wire68[(2'h3):(2'h2)])));
            end
          reg103 <= $unsigned(reg89);
          reg104 <= ($signed(((reg91[(4'hb):(2'h2)] - (reg73 <<< reg76)) ?
                  reg103 : (reg88[(4'hd):(2'h3)] ?
                      (reg79 ? wire64 : (8'ha9)) : $unsigned(wire94)))) ?
              ((wire67[(3'h4):(3'h4)] << (wire70[(3'h7):(1'h0)] ?
                  (~&wire64) : reg101[(4'h8):(3'h7)])) >= (reg101[(1'h0):(1'h0)] ?
                  (^~{wire100,
                      wire65}) : ($unsigned(wire66) != reg71))) : wire95);
          reg105 <= $signed((^~(7'h44)));
        end
      reg106 <= (-$signed(wire67[(3'h4):(2'h2)]));
      if ((^(~&$unsigned((&(wire67 ? wire97 : reg82))))))
        begin
          reg107 <= ($unsigned($unsigned($unsigned((reg86 ?
                  (8'ha5) : reg82)))) ?
              {{wire99[(4'hf):(4'h8)]},
                  $unsigned((&reg87[(4'h8):(3'h5)]))} : (!$unsigned(wire95)));
          if (($signed((^~($signed(wire90) ?
              {wire99} : $signed(wire68)))) ~^ reg83))
            begin
              reg108 <= (&reg74);
              reg109 <= (~|(8'hbf));
            end
          else
            begin
              reg108 <= $signed($signed($signed(wire69)));
              reg109 <= $unsigned(reg104);
              reg110 <= reg77[(4'h8):(3'h5)];
              reg111 <= (!(reg103 ?
                  (~^$signed($unsigned((8'ha8)))) : ($signed(((8'h9c) ?
                          wire95 : wire95)) ?
                      $signed((reg76 ? reg88 : reg76)) : $signed(((8'hbc) ?
                          reg71 : wire95)))));
              reg112 <= reg75[(2'h3):(2'h2)];
            end
          reg113 <= (|wire94);
          reg114 <= wire97;
        end
      else
        begin
          if (((^{(~|wire98), $unsigned((reg112 ? reg103 : reg75))}) ?
              reg78[(3'h4):(1'h0)] : (~$signed($signed(reg91)))))
            begin
              reg107 <= {$unsigned($unsigned({$signed(wire100),
                      $signed(reg102)}))};
              reg108 <= reg83[(1'h0):(1'h0)];
              reg109 <= reg80;
            end
          else
            begin
              reg107 <= ((~{$unsigned((-wire99))}) ?
                  (~|($signed(reg101[(3'h5):(3'h5)]) ?
                      $signed(reg72) : reg79[(2'h2):(1'h0)])) : $signed(reg92[(1'h0):(1'h0)]));
            end
        end
      if (reg79)
        begin
          reg115 <= (8'hbc);
          reg116 <= $unsigned($unsigned((reg106[(1'h1):(1'h1)] ?
              $unsigned($signed(reg82)) : (wire97[(1'h1):(1'h1)] < {wire96}))));
        end
      else
        begin
          reg115 <= reg106[(2'h2):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      reg117 <= wire64[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg118 <= $unsigned(wire94);
    end
  assign wire119 = (reg113 ^ (((&(~^(8'ha0))) ?
                       ($signed(reg86) ?
                           $signed(reg110) : (reg116 ?
                               reg79 : reg112)) : (&(8'ha8))) && ($signed(((8'ha6) ?
                           reg76 : reg89)) ?
                       ($unsigned(reg78) ?
                           reg107 : (reg83 - reg87)) : reg78[(3'h5):(3'h4)])));
endmodule

module module27
#(parameter param60 = (({({(7'h44)} * ((8'hba) - (8'ha7)))} != {(7'h41), (((8'ha4) <<< (8'hb3)) == (~|(8'ha9)))}) ? (({(^(8'hbe)), ((8'ha1) * (8'hbd))} ? {((8'hb9) ? (8'had) : (8'hb2)), ((8'h9d) >>> (8'had))} : (+((8'ha7) && (8'h9e)))) <<< ({((8'h9f) <<< (8'hb9))} ? (((7'h40) ? (8'hb3) : (8'hbf)) ? {(8'haa), (8'ha8)} : ((8'ha4) & (8'hb0))) : ({(7'h42), (8'hb2)} ~^ (!(8'hac))))) : ((|(~|((8'hb9) <<< (7'h40)))) | (~|(((8'hac) ? (8'hbc) : (8'hb9)) ? (&(8'hb0)) : ((8'ha4) ? (8'ha7) : (8'haf)))))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire32;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire signed [(4'he):(1'h0)] wire30;
  input wire [(2'h2):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  assign y = {wire59,
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
                 wire34,
                 wire33,
                 reg47,
                 reg46,
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
                 (1'h0)};
  assign wire33 = (wire29 ?
                      (~^wire28) : ($unsigned((((8'hbe) >>> (8'hb7)) < (7'h41))) ?
                          (8'hbf) : (($signed(wire29) && (wire28 ?
                                  (8'ha8) : (8'hb8))) ?
                              (wire32 || $signed(wire32)) : wire31)));
  assign wire34 = ({(^wire33),
                          $unsigned(((wire32 + wire32) ?
                              $signed(wire32) : $signed(wire28)))} ?
                      ((!{$unsigned(wire31)}) ~^ ($signed({wire28,
                          wire32}) >> wire30[(4'hc):(4'hc)])) : wire33[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg35 <= ($signed(($signed((8'ha2)) ?
              wire29[(1'h0):(1'h0)] : (~$unsigned(wire31)))) ?
          {(~^$unsigned((wire28 ? wire31 : wire32))),
              wire34} : $unsigned($signed((~$signed(wire30)))));
      reg36 <= $signed($unsigned(({{wire28, wire29},
          (wire31 ? wire30 : wire30)} < reg35[(3'h6):(3'h6)])));
      reg37 <= wire33[(4'h9):(2'h2)];
      reg38 <= (^~{(~|(wire31 ^~ (^wire29))),
          ($signed(wire33[(4'hb):(1'h0)]) ?
              ($unsigned((8'h9e)) != $signed(wire32)) : $unsigned($unsigned(wire30)))});
      if ((7'h44))
        begin
          reg39 <= $signed((wire31[(1'h1):(1'h0)] >>> (8'haa)));
          reg40 <= (8'ha2);
          reg41 <= $unsigned(($unsigned($signed((wire32 || reg35))) ?
              $unsigned((~^reg37[(2'h3):(1'h1)])) : $signed(((wire31 * reg37) && wire33[(4'hd):(4'hc)]))));
          reg42 <= wire33[(1'h0):(1'h0)];
          reg43 <= reg41[(3'h7):(1'h1)];
        end
      else
        begin
          if (((wire33 ?
              (-(8'ha2)) : (($unsigned(reg37) >= (+wire30)) ?
                  {wire34[(3'h5):(1'h1)]} : (8'ha4))) ^ $signed($unsigned(((reg42 ?
              wire31 : reg40) <= $unsigned(wire29))))))
            begin
              reg39 <= ((~wire29) ?
                  ($unsigned({(~^(8'ha3)), reg35}) ?
                      ($signed($signed((8'h9c))) > ((wire32 ? reg41 : wire34) ?
                          reg41[(1'h0):(1'h0)] : reg40[(2'h3):(1'h1)])) : wire31[(2'h2):(1'h0)]) : $signed(((reg38 != (wire32 >>> reg39)) ?
                      $unsigned((~^(8'ha6))) : reg35)));
              reg40 <= ($signed((wire30 >= wire34[(2'h3):(1'h0)])) * reg40[(2'h2):(1'h1)]);
            end
          else
            begin
              reg39 <= $signed($signed((wire28 > ({(8'h9c), reg39} ?
                  $unsigned(reg35) : (^~reg35)))));
              reg40 <= (8'ha8);
              reg41 <= (^~reg38);
              reg42 <= ($signed((reg40[(3'h4):(2'h3)] ?
                  $unsigned((reg37 ? wire28 : reg37)) : ((8'hac) ?
                      $unsigned((8'h9d)) : reg38))) << $signed(($signed((!(7'h43))) ?
                  wire30[(3'h5):(2'h2)] : wire34)));
              reg43 <= (8'ha3);
            end
          reg44 <= $signed((^~$signed(((^reg42) <<< $signed((8'h9c))))));
          reg45 <= ($signed(wire29[(1'h1):(1'h0)]) & $unsigned(({$signed(reg38)} ?
              $signed(wire33) : {(wire32 ? wire34 : wire31), reg38})));
          reg46 <= ({(($unsigned(reg45) ?
                      (wire33 - wire32) : $signed((8'h9e))) ?
                  (^~wire30[(4'hc):(4'ha)]) : $unsigned(((8'h9c) <<< wire31)))} <= reg35);
          reg47 <= {(~&$unsigned(reg45[(2'h2):(1'h1)])),
              (((^$unsigned(reg44)) ?
                  (^~(reg41 > reg43)) : (!reg45)) == (reg46[(1'h1):(1'h1)] ?
                  wire32[(1'h1):(1'h1)] : ($unsigned(reg37) ?
                      $signed(reg41) : (reg37 ? reg35 : wire32))))};
        end
    end
  assign wire48 = reg43;
  assign wire49 = $signed(((+$unsigned($unsigned((8'hb8)))) ^ $unsigned($unsigned((reg41 >> reg42)))));
  assign wire50 = $signed((~&(+((|wire31) ?
                      (reg44 ? wire48 : reg41) : wire29))));
  assign wire51 = $signed(reg37[(3'h7):(3'h4)]);
  assign wire52 = wire30[(1'h1):(1'h1)];
  assign wire53 = ($signed(($signed(wire51) ?
                          $signed((reg44 ~^ wire50)) : (7'h44))) ?
                      (wire29[(1'h1):(1'h0)] ?
                          $signed($signed((&wire32))) : ({$unsigned(reg42),
                              {reg44,
                                  wire34}} >> reg44[(5'h13):(5'h12)])) : {$unsigned(((wire51 && reg39) ?
                              (-reg40) : wire50))});
  assign wire54 = $unsigned($signed($signed(wire32[(3'h5):(3'h5)])));
  assign wire55 = (7'h43);
  assign wire56 = ((((&$unsigned(reg45)) ?
                          (7'h41) : wire50[(4'hb):(4'h8)]) + reg44[(3'h5):(3'h4)]) ?
                      $unsigned($unsigned(reg38)) : ($unsigned(reg46) - (wire29[(2'h2):(2'h2)] >>> wire52)));
  assign wire57 = wire28;
  assign wire58 = $unsigned(reg40);
  assign wire59 = wire52;
endmodule
