module top
#(parameter param161 = (~|(((((7'h43) ? (8'hb7) : (8'hbc)) + ((8'hb9) == (8'had))) >>> (!((8'ha9) ? (8'hac) : (7'h44)))) && (~(^((8'h9c) || (7'h44)))))), 
parameter param162 = ({(|param161)} ? (((param161 ? param161 : (-param161)) != param161) ? (+param161) : param161) : param161))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire160;
  wire [(4'hf):(1'h0)] wire159;
  wire signed [(5'h12):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire153;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire155;
  wire [(2'h2):(1'h0)] wire156;
  reg signed [(2'h3):(1'h0)] reg4 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire153,
                 wire21,
                 wire19,
                 wire8,
                 wire7,
                 wire6,
                 wire155,
                 wire156,
                 reg4,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire1[(2'h2):(1'h0)] + ((8'h9c) <= (!(!wire2))));
      reg5 <= (((reg4[(1'h1):(1'h1)] ? $signed($unsigned(wire3)) : wire2) ?
              ($unsigned((|(8'haa))) ~^ $unsigned((wire2 >= wire0))) : $unsigned((&$unsigned((7'h43))))) ?
          ((wire3 ^ wire2[(1'h1):(1'h0)]) ?
              $signed((wire0[(2'h3):(1'h0)] ?
                  reg4 : wire3)) : wire3) : $signed(($signed(wire1) ?
              (wire3 ? (~wire0) : $unsigned(wire1)) : ((~wire0) ?
                  (+wire3) : $unsigned(wire1)))));
    end
  assign wire6 = ($unsigned(($unsigned((reg5 && wire3)) ?
                         ($signed(reg4) ? wire1 : {reg4, wire0}) : (~wire3))) ?
                     $unsigned($unsigned((wire2 ?
                         (~|wire1) : (!wire1)))) : $signed(wire0));
  assign wire7 = {(+wire3[(2'h2):(1'h0)])};
  assign wire8 = wire6[(5'h11):(4'h8)];
  module9 #() modinst20 (.wire10(wire7), .wire13(wire0), .clk(clk), .wire12(wire6), .y(wire19), .wire11(wire2));
  assign wire21 = (((((wire7 || reg5) ?
                          $unsigned(wire0) : $signed(reg5)) << {((8'hbc) && wire2)}) ?
                      wire7[(4'ha):(4'h9)] : ((-(|wire8)) ?
                          wire7 : $signed($signed(reg4)))) + ((wire2[(2'h3):(2'h2)] || wire3) ?
                      $unsigned($unsigned((wire0 ?
                          wire0 : wire1))) : (((|wire19) >>> $unsigned(reg4)) ?
                          (+$unsigned(reg5)) : $unsigned($signed((8'hb9))))));
  module22 #() modinst154 (wire153, clk, wire21, wire2, wire6, wire7, wire0);
  assign wire155 = wire0[(4'h9):(3'h4)];
  module32 #() modinst157 (wire156, clk, wire2, wire21, reg5, wire155);
  assign wire158 = {((!((!(8'hbf)) ? ((8'hb4) >>> (8'hb7)) : $signed(wire8))) ?
                           wire8 : wire0),
                       {reg5}};
  assign wire159 = wire156[(2'h2):(2'h2)];
  assign wire160 = $signed(($signed(((~&wire156) ?
                           $signed(wire156) : $signed(wire156))) ?
                       {$unsigned(wire21[(4'h9):(4'h9)]),
                           ($signed(wire155) ?
                               ((8'hb7) ?
                                   wire7 : reg4) : wire3[(2'h2):(1'h1)])} : (&$unsigned($signed(wire0)))));
endmodule

module module22
#(parameter param152 = {(((|((8'hbe) ? (8'ha0) : (8'hb9))) ? (((8'ha1) ? (8'h9f) : (8'haf)) == ((8'ha7) ? (8'hb4) : (8'hbc))) : {(~^(8'ha6))}) >= {(-(|(8'h9d))), (~|{(8'hb6)})}), {(-(^{(8'hac)}))}})
(y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire26;
  input wire signed [(4'hf):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire150;
  wire signed [(4'hb):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire121;
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  assign y = {wire150,
                 wire125,
                 wire124,
                 wire123,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire70,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire95,
                 wire121,
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
                 (1'h0)};
  assign wire28 = (+(wire24[(3'h5):(1'h0)] ^ (wire24 ?
                      (wire24 >> wire26) : (^~wire26))));
  assign wire29 = $unsigned($signed(((wire24 >= wire24[(2'h3):(1'h0)]) ?
                      wire24[(4'he):(3'h5)] : wire24[(4'hb):(2'h3)])));
  assign wire30 = (wire28 ?
                      ((8'hba) << $unsigned(((wire24 ? wire28 : wire25) ?
                          $signed(wire24) : $unsigned(wire24)))) : $unsigned($unsigned(((^wire24) < wire24[(3'h4):(1'h1)]))));
  assign wire31 = ((wire26[(2'h2):(2'h2)] ?
                      (8'ha8) : (!$unsigned((8'had)))) - {({(~^(8'had)),
                          (wire26 != wire23)} | (8'hb7)),
                      $signed((~wire25))});
  module32 #() modinst71 (wire70, clk, wire27, wire23, wire31, wire26);
  always
    @(posedge clk) begin
      reg72 <= $unsigned(($signed(((8'hba) >> $signed(wire26))) < wire29[(2'h3):(2'h2)]));
      if ($signed((~&((wire29[(4'hd):(1'h1)] ? (~(8'hbf)) : $unsigned(wire30)) ?
          (~|((8'hbd) ? reg72 : wire30)) : ({wire23, wire24} ?
              (wire23 - wire28) : $signed(reg72))))))
        begin
          if ((8'hb9))
            begin
              reg73 <= ((((~^reg72[(1'h0):(1'h0)]) | wire23[(3'h6):(2'h3)]) ?
                  $unsigned(wire23) : (8'hba)) - (wire25 + ($unsigned($signed(wire70)) - $unsigned((+wire27)))));
            end
          else
            begin
              reg73 <= (-wire70[(3'h5):(2'h2)]);
            end
          reg74 <= (~&(({((8'hb3) ? wire23 : wire25),
                  wire23} ~^ {$unsigned(reg72)}) ?
              (~^wire25) : (($unsigned((8'hb6)) ?
                      (8'hb6) : (wire31 ? (8'ha0) : wire29)) ?
                  wire24 : wire31)));
          reg75 <= (~&{reg72[(1'h1):(1'h1)]});
          reg76 <= (~$signed((|wire26)));
          reg77 <= ($unsigned({reg72[(3'h7):(2'h2)],
              {(+wire70), {(8'hb1), wire23}}}) || $unsigned(({$unsigned(reg75),
                  (7'h43)} ?
              $signed($signed((8'hbd))) : ((wire25 ~^ wire24) >> reg72[(3'h6):(2'h2)]))));
        end
      else
        begin
          reg73 <= {(|$signed(wire31[(4'hc):(4'h8)]))};
          reg74 <= $signed(((^$signed($unsigned(reg76))) <<< $unsigned($signed($unsigned(reg74)))));
          if (((wire27 ?
                  {(&(wire31 | wire28))} : ($unsigned({reg77}) == (&$unsigned(reg73)))) ?
              (8'ha5) : (^($signed($unsigned(reg74)) ^ $signed((~&reg72))))))
            begin
              reg75 <= (($unsigned((|$unsigned(reg75))) && (7'h43)) ^~ $signed((-((~^reg73) ?
                  ((8'hb9) ? wire29 : wire30) : (-(8'hb1))))));
              reg76 <= wire27[(2'h2):(2'h2)];
              reg77 <= wire23;
              reg78 <= $unsigned(wire25[(4'hf):(4'h8)]);
              reg79 <= (($signed((~&{wire23})) ^~ (reg77[(4'hd):(2'h2)] != reg74[(4'hb):(4'h9)])) ?
                  ($signed(reg72[(3'h7):(3'h4)]) ?
                      wire23 : {wire24[(5'h10):(4'h9)]}) : reg74[(3'h5):(1'h1)]);
            end
          else
            begin
              reg75 <= (($unsigned(($signed(wire29) ?
                      $signed(wire29) : $signed(reg78))) ?
                  reg73 : ($signed((wire26 ^~ reg75)) + ($unsigned(wire30) ?
                      $signed(reg72) : (-reg76)))) && (^({$unsigned(wire28)} ?
                  (wire28 ?
                      reg72 : wire31[(4'ha):(3'h6)]) : $unsigned($unsigned(reg72)))));
              reg76 <= wire27[(3'h5):(3'h4)];
              reg77 <= reg72;
              reg78 <= reg73;
              reg79 <= (wire31[(3'h5):(1'h1)] ?
                  wire31 : ($unsigned((~|reg75[(2'h2):(2'h2)])) - (^$unsigned($signed(wire25)))));
            end
          reg80 <= $unsigned(({wire31[(4'ha):(4'h8)]} ?
              wire27[(4'hb):(1'h0)] : reg78[(1'h1):(1'h1)]));
        end
      if ($unsigned(reg79[(1'h1):(1'h1)]))
        begin
          if ($signed((((reg76[(2'h3):(1'h0)] ?
                      (reg80 >= wire28) : (wire31 ? reg72 : reg73)) ?
                  $signed($signed(reg74)) : wire29[(4'hc):(3'h5)]) ?
              (~^$unsigned(((8'haf) ? reg73 : wire24))) : ((^~(wire28 ?
                  reg72 : wire25)) || $signed($unsigned((8'hbf)))))))
            begin
              reg81 <= (8'hb4);
              reg82 <= $unsigned((wire30[(4'ha):(4'ha)] ?
                  $signed((((8'ha7) ? wire27 : reg77) ?
                      $unsigned((8'hb6)) : reg81[(1'h0):(1'h0)])) : {(~(^wire30))}));
              reg83 <= ((|$signed($signed(((8'hb1) < reg79)))) + wire31);
              reg84 <= reg79[(2'h2):(1'h1)];
              reg85 <= ($signed($unsigned(wire23)) ?
                  (~&wire30[(3'h5):(1'h0)]) : $unsigned((~&$signed((-reg80)))));
            end
          else
            begin
              reg81 <= ((~^(reg82 - (~^((8'hb4) ? wire25 : reg76)))) ?
                  $signed($signed(wire70[(3'h6):(3'h6)])) : ({$signed((reg73 ?
                              (7'h40) : reg83)),
                          ((!wire23) ? $signed(wire26) : $signed(reg85))} ?
                      reg74 : $signed(($unsigned(wire24) ~^ $unsigned(reg74)))));
            end
          reg86 <= wire23[(2'h2):(1'h1)];
          reg87 <= ({$signed(reg74[(5'h10):(4'hf)])} << (~^$unsigned(wire28)));
          reg88 <= ((|reg84) ? (reg74[(2'h3):(1'h1)] == reg84) : (8'ha4));
          reg89 <= (~&reg82);
        end
      else
        begin
          reg81 <= reg76[(4'ha):(1'h1)];
          reg82 <= $signed(($signed((reg80[(2'h2):(1'h0)] >= $unsigned(reg74))) || $signed(($signed(reg76) ?
              reg77 : $unsigned(reg85)))));
          reg83 <= $unsigned(reg85[(1'h1):(1'h0)]);
        end
      reg90 <= {(~|((+$signed((8'had))) >> reg81[(1'h1):(1'h1)])), reg88};
    end
  assign wire91 = (+(reg76 >> (reg81[(2'h2):(2'h2)] ?
                      (^(reg85 ? reg72 : wire28)) : ($signed(reg87) ?
                          reg80[(1'h1):(1'h0)] : reg76))));
  assign wire92 = ((!{(8'h9d)}) || {reg81[(1'h0):(1'h0)],
                      $unsigned(((wire27 >> reg82) == $unsigned(reg73)))});
  assign wire93 = $unsigned(reg74);
  assign wire94 = wire92;
  assign wire95 = wire25;
  module96 #() modinst122 (.wire97(reg73), .wire101(reg85), .wire99(wire29), .clk(clk), .y(wire121), .wire98(reg89), .wire100(reg72));
  assign wire123 = (((&reg81[(2'h2):(1'h0)]) ?
                           wire26[(2'h3):(2'h2)] : $signed({(reg88 & wire31),
                               wire24[(4'he):(4'hd)]})) ?
                       {(wire121[(1'h1):(1'h1)] ?
                               ($signed((7'h42)) ?
                                   (wire25 ?
                                       wire121 : reg82) : (!wire93)) : wire26)} : wire28);
  assign wire124 = wire26;
  assign wire125 = wire94;
  module126 #() modinst151 (.wire129(wire123), .y(wire150), .clk(clk), .wire127(reg89), .wire128(reg72), .wire130(wire31));
endmodule

module module9
#(parameter param18 = (~|(~^((((8'haf) ? (7'h42) : (7'h41)) | ((8'hbe) >> (8'hb7))) ? ({(8'hb2), (7'h42)} != {(8'hae), (8'hb6)}) : (((8'ha8) <<< (8'hb4)) && (|(8'h9d)))))))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  assign y = {wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = (8'ha4);
  assign wire15 = wire14[(3'h4):(3'h4)];
  assign wire16 = {wire11[(2'h3):(2'h3)],
                      ($signed(wire14[(1'h1):(1'h0)]) ?
                          $signed(wire15[(5'h10):(3'h5)]) : $unsigned((wire10[(2'h2):(1'h0)] ?
                              $signed(wire11) : $signed(wire10))))};
  assign wire17 = $unsigned(((^~$signed($signed(wire15))) & ((~&wire10) != wire16)));
endmodule

module module126
#(parameter param148 = ((!((!((8'h9f) || (7'h42))) ? (^~(^~(8'hb3))) : (+((8'hbf) + (7'h40))))) ? (-(({(8'hb8)} ? ((8'hbf) ? (7'h41) : (8'ha3)) : ((8'hb1) | (8'ha6))) != (^~{(8'hb0), (8'hbb)}))) : ((+(~|((8'hae) ? (8'hb8) : (8'haa)))) ~^ ((~&(^~(8'hb6))) ? (((8'hb3) ? (8'hbb) : (8'hb2)) >> (~&(8'hb1))) : {(~^(8'hb0)), (7'h40)}))), 
parameter param149 = (((|((~|param148) ? (|param148) : (param148 ? (7'h40) : param148))) ? {param148} : ((!(|param148)) + ((param148 ? param148 : param148) ~^ param148))) | (8'hb7)))
(y, clk, wire130, wire129, wire128, wire127);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire130;
  input wire signed [(5'h15):(1'h0)] wire129;
  input wire signed [(4'h9):(1'h0)] wire128;
  input wire [(4'hc):(1'h0)] wire127;
  wire [(3'h5):(1'h0)] wire146;
  wire [(2'h3):(1'h0)] wire145;
  wire [(4'hb):(1'h0)] wire144;
  wire [(4'hb):(1'h0)] wire135;
  wire signed [(4'ha):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire131;
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(4'hc):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire135,
                 wire132,
                 wire131,
                 reg147,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire131 = (wire128[(2'h3):(2'h2)] ?
                       ($unsigned($signed({wire128, wire130})) >= {((wire129 ?
                               wire127 : wire128) + (wire130 >= wire129)),
                           ((wire128 ? wire130 : wire129) ?
                               (wire130 - wire127) : (wire127 ?
                                   wire127 : wire127))}) : wire127[(4'h9):(1'h1)]);
  assign wire132 = $unsigned(wire129);
  always
    @(posedge clk) begin
      reg133 <= {(!wire132)};
      reg134 <= wire130[(4'h9):(3'h7)];
    end
  assign wire135 = wire131[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg136 <= reg133;
      if ({$signed((wire135[(4'ha):(1'h0)] ?
              wire129[(5'h13):(4'hb)] : ((wire132 >> wire130) - $signed(wire130)))),
          $unsigned(($unsigned((~wire131)) && (wire128[(2'h3):(1'h1)] ?
              (wire130 ? wire130 : wire128) : ((8'ha1) ? (8'hb7) : reg134))))})
        begin
          reg137 <= reg136[(1'h0):(1'h0)];
          if ($unsigned(wire127[(3'h7):(2'h2)]))
            begin
              reg138 <= ($signed(wire135[(1'h0):(1'h0)]) ?
                  (^$unsigned($signed((wire127 > (8'hb4))))) : $signed(wire128[(2'h3):(2'h3)]));
              reg139 <= $unsigned(($signed($signed($signed(wire128))) || (wire128 ?
                  $signed(reg134[(4'ha):(3'h6)]) : reg138[(2'h2):(2'h2)])));
            end
          else
            begin
              reg138 <= wire130;
            end
        end
      else
        begin
          reg137 <= (~&$signed(((((8'haf) > (8'hbe)) ^ (wire127 | (7'h43))) ?
              $unsigned(wire130[(1'h0):(1'h0)]) : (wire129[(3'h4):(3'h4)] ?
                  reg133 : $signed(wire132)))));
          reg138 <= ((|reg134[(3'h4):(1'h0)]) ?
              $unsigned(reg134) : wire127[(2'h2):(1'h0)]);
          reg139 <= wire130;
        end
      reg140 <= $unsigned(($signed($unsigned((~|wire135))) ?
          $unsigned(reg136) : $signed(wire127[(3'h6):(3'h4)])));
      reg141 <= wire129;
      if (reg133[(2'h2):(1'h1)])
        begin
          reg142 <= (~&($signed(((wire131 ?
              wire129 : (8'hb4)) ^ reg133[(2'h2):(1'h1)])) >> $unsigned($signed(wire127))));
          reg143 <= (|($signed(reg138) ?
              (reg134[(5'h10):(2'h3)] ?
                  (reg139 ? wire131 : wire127) : ((reg139 ^~ reg140) ?
                      {reg137} : (~^wire128))) : $signed((|wire129))));
        end
      else
        begin
          reg142 <= {(((reg143 ~^ reg133) ?
                  (~|$unsigned((8'hbc))) : (~&(8'hb2))) ~^ $signed({(8'hbb)}))};
          reg143 <= (wire130 <= (reg139[(2'h2):(2'h2)] ?
              $unsigned((~&$signed(reg143))) : $signed($signed(wire132[(1'h0):(1'h0)]))));
        end
    end
  assign wire144 = (!(wire131 * $unsigned((~^(8'hb0)))));
  assign wire145 = wire128;
  assign wire146 = (^~wire131[(5'h12):(4'hf)]);
  always
    @(posedge clk) begin
      reg147 <= {(wire132 ?
              $signed($signed(wire127[(2'h3):(1'h1)])) : wire145)};
    end
endmodule

module module96  (y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire101;
  input wire [(3'h7):(1'h0)] wire100;
  input wire [(5'h11):(1'h0)] wire99;
  input wire signed [(2'h2):(1'h0)] wire98;
  input wire [(3'h7):(1'h0)] wire97;
  wire signed [(4'hb):(1'h0)] wire120;
  wire signed [(3'h5):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire115;
  wire signed [(3'h4):(1'h0)] wire114;
  wire signed [(2'h2):(1'h0)] wire113;
  wire signed [(5'h15):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire109;
  wire signed [(4'hb):(1'h0)] wire108;
  wire signed [(3'h4):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire105;
  wire [(3'h4):(1'h0)] wire104;
  wire signed [(3'h7):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 (1'h0)};
  assign wire102 = $signed(wire98);
  assign wire103 = {(!wire97[(3'h7):(2'h3)])};
  assign wire104 = (^~$signed((+(wire103 ? $unsigned(wire97) : (~|wire103)))));
  assign wire105 = wire98[(2'h2):(1'h1)];
  assign wire106 = wire97;
  assign wire107 = {(~^{$unsigned($unsigned(wire99))}), wire100};
  assign wire108 = wire104;
  assign wire109 = wire101[(2'h3):(2'h3)];
  assign wire110 = $signed(((-((8'ha2) >> (wire106 == wire100))) ?
                       ((8'ha2) <<< wire103[(2'h3):(1'h1)]) : wire107[(1'h0):(1'h0)]));
  assign wire111 = $unsigned((wire110 > ($signed($unsigned(wire97)) ?
                       ($unsigned(wire105) <= (wire104 ~^ wire100)) : $signed($signed(wire105)))));
  assign wire112 = ((-(8'h9f)) & $signed($signed($unsigned(wire109[(4'hf):(4'hf)]))));
  assign wire113 = $signed((wire110[(4'hd):(1'h0)] ~^ $signed((~&wire107[(1'h0):(1'h0)]))));
  assign wire114 = $signed(((((wire106 ? wire105 : (8'hba)) & $signed(wire98)) ?
                       $unsigned((8'ha5)) : wire98[(1'h0):(1'h0)]) | {wire110[(5'h11):(3'h5)],
                       wire99}));
  assign wire115 = $unsigned($signed($signed(($unsigned(wire99) ?
                       {wire110, wire112} : ((8'hba) ? wire98 : wire107)))));
  assign wire116 = {wire112[(5'h13):(2'h3)], (~&wire104)};
  assign wire117 = (&$signed($unsigned(wire98)));
  assign wire118 = wire108[(2'h3):(2'h3)];
  assign wire119 = (-wire118[(1'h1):(1'h0)]);
  assign wire120 = (wire115[(2'h2):(2'h2)] && ((((8'ha8) ?
                           wire102 : $unsigned(wire104)) ?
                       $signed((wire97 ?
                           (8'hbe) : wire104)) : {wire103[(2'h2):(1'h1)]}) - {$signed((8'ha9))}));
endmodule

module module32
#(parameter param68 = (8'hbc), 
parameter param69 = (^~(&((8'ha9) > (param68 <<< {param68})))))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire36;
  input wire [(4'he):(1'h0)] wire35;
  input wire [(5'h15):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire57,
                 wire56,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire39,
                 wire38,
                 wire37,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg55,
                 reg54,
                 reg53,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire37 = $unsigned(wire33[(2'h3):(1'h0)]);
  assign wire38 = {{wire36}};
  assign wire39 = wire37;
  always
    @(posedge clk) begin
      reg40 <= $unsigned((wire35 ?
          wire39[(4'h8):(3'h4)] : (&(~wire35[(4'he):(4'hd)]))));
      reg41 <= (~^$signed(wire35[(1'h1):(1'h1)]));
      reg42 <= wire38;
      reg43 <= $unsigned({reg41[(1'h0):(1'h0)],
          $signed(wire38[(3'h6):(2'h3)])});
    end
  assign wire44 = (-reg40[(4'hc):(4'h8)]);
  assign wire45 = reg43[(3'h5):(1'h0)];
  assign wire46 = ($unsigned(($signed($signed(reg42)) ?
                      ((wire37 ?
                          wire39 : wire39) << $signed(wire38)) : (^~$unsigned(wire39)))) << wire35[(2'h3):(2'h2)]);
  assign wire47 = wire33[(3'h6):(1'h1)];
  assign wire48 = $unsigned($signed($signed(wire46)));
  assign wire49 = {{reg41[(2'h3):(2'h3)]},
                      {$signed(reg41[(1'h1):(1'h1)]),
                          $signed(reg42[(1'h0):(1'h0)])}};
  assign wire50 = (reg41 < (~&$unsigned($signed(reg43))));
  assign wire51 = $signed($signed((&wire39)));
  assign wire52 = $signed(wire39);
  always
    @(posedge clk) begin
      reg53 <= wire38;
      reg54 <= $signed(((wire48[(1'h1):(1'h0)] ?
              $unsigned((wire52 <<< wire38)) : wire38[(4'h8):(1'h1)]) ?
          (~|$signed(wire51)) : wire46[(2'h3):(1'h1)]));
      reg55 <= reg43[(2'h2):(1'h0)];
    end
  assign wire56 = reg55;
  assign wire57 = $signed((~&{((+wire34) ?
                          (wire46 ? reg55 : wire38) : (|wire36)),
                      (+wire52)}));
  always
    @(posedge clk) begin
      if ((|$unsigned(wire39[(4'hf):(4'h9)])))
        begin
          reg58 <= $unsigned($unsigned((^$unsigned(((8'h9c) & wire46)))));
          reg59 <= (-(~&{wire44[(4'h8):(2'h2)],
              ($unsigned((8'ha5)) ? (wire36 ? wire38 : wire35) : reg43)}));
          if ((-((~&$unsigned({reg58, (8'ha4)})) && (8'hb2))))
            begin
              reg60 <= reg41[(2'h3):(1'h0)];
              reg61 <= reg55[(3'h6):(3'h5)];
            end
          else
            begin
              reg60 <= wire44[(2'h2):(1'h1)];
            end
          if (reg43)
            begin
              reg62 <= $unsigned((|(!({wire36, wire47} ?
                  wire46 : (wire48 ? (8'ha1) : reg40)))));
              reg63 <= wire49;
              reg64 <= $unsigned(wire39[(2'h3):(2'h3)]);
            end
          else
            begin
              reg62 <= wire50;
            end
        end
      else
        begin
          reg58 <= reg43[(3'h4):(1'h0)];
          reg59 <= (^$unsigned((!(!(7'h40)))));
        end
    end
  assign wire65 = (((|(wire44 != (wire46 ? wire38 : wire45))) ?
                      ($signed($signed(reg42)) >> $signed(reg64)) : (7'h43)) >= ({{{(8'hbc),
                              (8'hb8)},
                          (8'ha9)},
                      wire49} & $unsigned(wire57)));
  assign wire66 = $signed($signed(reg54));
  assign wire67 = wire48[(3'h5):(3'h4)];
endmodule
