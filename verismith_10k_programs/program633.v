module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire168;
  wire signed [(5'h13):(1'h0)] wire167;
  wire signed [(5'h13):(1'h0)] wire166;
  wire signed [(4'hc):(1'h0)] wire165;
  wire [(2'h2):(1'h0)] wire163;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire163,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed($signed(wire2));
      reg5 <= {wire0[(4'hb):(3'h7)],
          (^~((~^((8'h9e) != wire1)) * {wire1[(1'h0):(1'h0)], (8'hb0)}))};
    end
  assign wire6 = {$signed((wire3 + wire3))};
  assign wire7 = (reg4[(2'h2):(2'h2)] - (8'ha7));
  assign wire8 = $signed($unsigned((reg5 + (wire7 ^~ $signed(wire2)))));
  assign wire9 = reg5;
  module10 #() modinst164 (.wire13(wire1), .wire14(wire6), .clk(clk), .wire12(reg4), .wire11(reg5), .y(wire163));
  assign wire165 = ({reg5[(4'hc):(4'hb)]} != (!$signed((~^(wire2 != reg4)))));
  assign wire166 = $signed(((wire0 && $unsigned((wire9 ?
                       wire3 : (8'hb8)))) - ($unsigned((wire163 ?
                           wire2 : (8'hbf))) ?
                       (&wire7[(4'hc):(3'h5)]) : $signed(wire0[(4'h8):(2'h2)]))));
  assign wire167 = ({$signed(({wire8, wire165} ?
                           (wire9 ? (8'ha5) : wire1) : wire2[(3'h5):(1'h1)])),
                       (($unsigned(reg4) <<< $signed(wire6)) ?
                           (wire165 ?
                               (wire7 ?
                                   wire163 : wire166) : (-wire0)) : wire1)} < {$unsigned($signed((wire0 & wire1))),
                       wire6[(3'h5):(2'h3)]});
  assign wire168 = wire163;
endmodule

module module10
#(parameter param162 = (^~{((((8'hbd) ? (8'haa) : (8'hb6)) & ((8'ha6) < (8'hbf))) ? ({(8'hb7)} < (^~(8'h9f))) : (((8'hb8) ? (8'h9c) : (7'h41)) && ((8'ha6) == (8'h9d))))}))
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire13;
  input wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire161;
  wire [(5'h13):(1'h0)] wire160;
  wire signed [(4'ha):(1'h0)] wire159;
  wire signed [(2'h2):(1'h0)] wire157;
  wire signed [(3'h5):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire60;
  reg [(4'h9):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire157,
                 wire155,
                 wire114,
                 wire112,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire60,
                 reg158,
                 reg35,
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
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire15 = wire14;
  assign wire16 = $signed(((($unsigned(wire15) ?
                          (!wire15) : (wire13 ? (8'hb7) : wire12)) ?
                      wire12[(1'h1):(1'h0)] : wire12) || {wire13[(4'hf):(4'hc)]}));
  assign wire17 = {wire14, $unsigned($unsigned($signed(wire11)))};
  assign wire18 = $signed((~^wire14[(1'h1):(1'h1)]));
  assign wire19 = $signed($unsigned(wire12));
  assign wire20 = wire13[(1'h1):(1'h1)];
  assign wire21 = $signed(wire12[(2'h2):(2'h2)]);
  assign wire22 = $signed((wire20 <= wire12));
  always
    @(posedge clk) begin
      reg23 <= wire13;
      if (wire16)
        begin
          if ($unsigned($unsigned($unsigned(wire13[(4'hd):(3'h7)]))))
            begin
              reg24 <= ({wire13[(3'h6):(1'h0)]} ?
                  reg23[(3'h6):(2'h3)] : wire20);
            end
          else
            begin
              reg24 <= (wire11[(3'h4):(3'h4)] ?
                  wire13 : (((~wire18[(4'h8):(2'h3)]) ?
                      $signed((reg24 >= (7'h44))) : (~wire11)) != $unsigned(reg24)));
              reg25 <= $signed($unsigned($signed(wire13[(3'h6):(3'h4)])));
              reg26 <= (8'hb4);
              reg27 <= $unsigned(wire15[(1'h1):(1'h0)]);
              reg28 <= $unsigned(wire21);
            end
          if ({$unsigned(reg27[(2'h2):(1'h0)]), wire15[(1'h1):(1'h0)]})
            begin
              reg29 <= $unsigned(({wire17[(3'h7):(3'h6)],
                  wire19[(3'h5):(3'h5)]} ^ $signed(($signed((8'hb5)) ?
                  wire11[(3'h5):(2'h3)] : $unsigned(wire19)))));
              reg30 <= (7'h40);
              reg31 <= wire17[(1'h1):(1'h0)];
              reg32 <= (wire20[(4'hc):(2'h3)] ?
                  ({reg30[(2'h2):(2'h2)]} ^~ ($signed((~reg28)) ?
                      reg29[(5'h10):(2'h3)] : (+wire21))) : ($unsigned(((8'hbe) && (reg29 >= (8'ha9)))) ?
                      $signed({reg29}) : {$unsigned((-wire17))}));
            end
          else
            begin
              reg29 <= (8'ha0);
              reg30 <= ((|{$signed($unsigned(wire13))}) ? reg27 : wire13);
              reg31 <= $signed(reg23[(4'ha):(3'h5)]);
              reg32 <= reg24[(4'h8):(4'h8)];
            end
          reg33 <= (~|wire19[(4'h8):(3'h7)]);
          reg34 <= (wire21[(4'h8):(3'h7)] ?
              $unsigned(((~(wire15 ? wire13 : wire20)) ?
                  wire20[(4'hf):(2'h3)] : $unsigned(wire20))) : wire16);
          reg35 <= (^(wire21 ? $signed(wire15) : wire12[(1'h1):(1'h1)]));
        end
      else
        begin
          reg24 <= ($unsigned($signed(({wire12, wire13} ?
              (wire15 <= wire15) : {reg26}))) && (~({$signed(wire14),
              $unsigned(wire14)} >>> ((reg31 ? wire18 : wire20) ?
              (~&wire22) : reg28))));
          if (wire16[(3'h5):(1'h1)])
            begin
              reg25 <= $unsigned($signed($signed($unsigned($signed(reg34)))));
              reg26 <= wire16;
              reg27 <= reg34;
            end
          else
            begin
              reg25 <= ($unsigned($signed(wire11)) * ((!{wire14}) ^~ (~wire11)));
              reg26 <= ((~&reg29[(4'hb):(4'h8)]) + {($signed((reg25 & (8'hb0))) + (&reg24)),
                  (8'ha6)});
              reg27 <= (~^(reg26 - (^((wire17 ? wire18 : reg34) & (|reg32)))));
            end
          reg28 <= ($unsigned(wire20[(3'h7):(2'h2)]) - ((|wire22) ?
              reg34 : wire12));
        end
    end
  assign wire36 = ($unsigned($unsigned($signed(wire17[(1'h0):(1'h0)]))) ?
                      (((8'ha8) ?
                          reg30[(4'h8):(3'h5)] : ((reg24 >> reg27) >> $signed(reg26))) | (&$unsigned(reg25[(5'h14):(5'h10)]))) : {$signed(wire19),
                          reg25[(4'hb):(1'h1)]});
  assign wire37 = wire18[(4'hb):(3'h5)];
  assign wire38 = $signed($signed($signed(reg31[(1'h1):(1'h1)])));
  assign wire39 = ({$unsigned((-$signed(reg27)))} ?
                      $signed({$signed((wire15 * wire37))}) : {reg29});
  module40 #() modinst61 (.wire41(reg27), .wire43(reg29), .wire42(reg24), .clk(clk), .y(wire60), .wire44(wire13));
  module62 #() modinst113 (.wire64(wire12), .wire66(wire39), .clk(clk), .wire65(wire20), .wire63(wire15), .y(wire112));
  assign wire114 = wire112[(3'h6):(3'h4)];
  module115 #() modinst156 (wire155, clk, reg29, reg34, wire37, wire38, reg30);
  assign wire157 = $signed({reg29[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      reg158 <= (8'had);
    end
  assign wire159 = {wire12[(2'h3):(1'h0)],
                       $signed((~&{(~wire112), (wire12 && (8'haf))}))};
  assign wire160 = (wire159[(3'h6):(1'h0)] ?
                       $unsigned({(+wire159), $signed((~wire15))}) : ((wire20 ?
                               $signed(reg158[(1'h1):(1'h0)]) : $signed(reg29[(1'h1):(1'h0)])) ?
                           (wire20 ?
                               $signed((wire112 ?
                                   wire20 : wire114)) : ($signed(reg32) + (wire155 && wire18))) : (wire38[(4'hb):(3'h5)] == (~^(^~wire18)))));
  assign wire161 = $signed(wire159[(4'h8):(3'h7)]);
endmodule

module module115
#(parameter param153 = (((8'ha8) ~^ ((~|((8'hbf) | (8'hb6))) || (+(|(8'ha1))))) != ((^~(((8'haa) ? (8'ha4) : (8'hac)) > {(8'hbb)})) ? (~|(((8'h9e) ? (8'hb9) : (8'hb6)) < (+(7'h41)))) : {(((7'h42) ? (8'ha5) : (8'ha0)) ? ((8'ha4) * (8'hb7)) : ((8'ha6) ? (8'hb1) : (8'h9c)))})), 
parameter param154 = {param153})
(y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire120;
  input wire [(5'h15):(1'h0)] wire119;
  input wire [(3'h4):(1'h0)] wire118;
  input wire [(5'h15):(1'h0)] wire117;
  input wire [(3'h4):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire151;
  wire signed [(5'h12):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire144;
  wire [(2'h3):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire [(2'h2):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  wire signed [(4'h8):(1'h0)] wire127;
  wire [(2'h3):(1'h0)] wire125;
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(3'h5):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire145,
                 wire144,
                 wire143,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire125,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
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
                 reg126,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg121 <= wire116;
      reg122 <= wire116;
      reg123 <= (wire116 ? wire119[(4'he):(4'h9)] : wire116);
      reg124 <= wire120[(3'h4):(3'h4)];
    end
  assign wire125 = (~^reg123[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg126 <= (8'h9c);
    end
  assign wire127 = (($unsigned((8'hb9)) ?
                           $signed(reg124) : $signed($unsigned(reg124))) ?
                       reg121 : ((reg124 ^~ ((!wire119) >> $unsigned(wire118))) > $unsigned((!(^(8'hb1))))));
  assign wire128 = ({((~^$signed(reg126)) * $unsigned((-reg122))),
                           (((^~wire127) ?
                               $unsigned((8'hbc)) : $signed(reg122)) == {{wire117},
                               (wire117 & wire119)})} ?
                       reg121 : $signed($signed((8'h9d))));
  assign wire129 = $unsigned(((($unsigned(reg121) ?
                       wire125 : (!wire127)) > (wire118 * reg122)) <<< reg123));
  assign wire130 = $signed(wire119[(4'ha):(1'h0)]);
  assign wire131 = (reg123[(2'h3):(2'h3)] > wire118[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      if (wire128[(1'h1):(1'h1)])
        begin
          reg132 <= (wire131[(1'h0):(1'h0)] > ($signed(($unsigned(reg124) ^~ wire127)) ?
              wire127 : wire117[(3'h7):(3'h5)]));
          reg133 <= $signed(wire128);
          reg134 <= wire118;
        end
      else
        begin
          if (reg124[(4'h8):(2'h3)])
            begin
              reg132 <= ((!$signed(($unsigned(reg126) ?
                  (reg132 ? reg133 : wire117) : (8'hab)))) < (~reg122));
              reg133 <= $unsigned(reg121[(3'h7):(3'h4)]);
              reg134 <= $signed((wire116[(2'h3):(2'h3)] - $signed($unsigned((!wire119)))));
            end
          else
            begin
              reg132 <= reg122;
            end
          if (wire127)
            begin
              reg135 <= (~&wire118[(3'h4):(2'h2)]);
              reg136 <= $signed(((wire116[(2'h2):(2'h2)] || (~|wire125)) ?
                  wire116[(2'h2):(2'h2)] : (wire118[(2'h2):(2'h2)] <= (|$unsigned((8'hb1))))));
              reg137 <= ($unsigned((-wire125)) ?
                  $signed(((~|wire128[(3'h6):(1'h0)]) >> {(wire125 ^ (8'hab))})) : ($signed({$unsigned(reg121)}) ?
                      reg122 : (((|wire117) ~^ (wire125 ? wire129 : reg134)) ?
                          (&reg121) : wire120[(4'h8):(1'h0)])));
            end
          else
            begin
              reg135 <= $signed((^({$unsigned(reg121)} != $signed((reg121 * (8'h9d))))));
              reg136 <= ((|(wire129 != ($unsigned((8'hb0)) ?
                      {wire119} : $signed(reg136)))) ?
                  wire119 : (+(~(^~$signed(reg124)))));
              reg137 <= reg134;
              reg138 <= (|{wire117[(5'h11):(5'h10)]});
              reg139 <= ($unsigned((wire116 - reg135)) ^ $unsigned(($signed((wire117 ?
                  wire117 : reg135)) >> {$unsigned(wire118)})));
            end
          reg140 <= $unsigned((((&(reg121 ? wire130 : wire127)) ?
              $signed(reg124[(1'h0):(1'h0)]) : {$unsigned(reg136)}) + reg126[(1'h0):(1'h0)]));
          reg141 <= $signed($unsigned(reg126[(3'h6):(2'h3)]));
          reg142 <= wire128[(2'h3):(1'h0)];
        end
    end
  assign wire143 = ((reg124[(2'h2):(2'h2)] - reg134) << (~&wire118[(2'h3):(1'h1)]));
  assign wire144 = wire116;
  assign wire145 = (wire117[(5'h11):(4'ha)] ?
                       (~|(wire117 ?
                           ($unsigned(reg132) && (^~wire117)) : wire131)) : (!reg133[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg146 <= reg126;
      reg147 <= (~(wire117[(4'he):(1'h0)] ?
          ((reg141 ? (!wire117) : $signed(wire117)) ?
              $unsigned($unsigned(wire116)) : (reg139 ?
                  ((8'haa) || wire116) : (&reg137))) : ($signed(wire143[(1'h0):(1'h0)]) + (+reg140))));
      reg148 <= reg147[(2'h2):(2'h2)];
      reg149 <= reg121;
      reg150 <= (reg146[(4'h9):(3'h6)] ?
          reg122 : $unsigned((wire129 ?
              ((!reg134) ?
                  reg121[(4'h8):(3'h4)] : (wire120 * reg124)) : ((wire143 >= reg138) <= $unsigned(reg121)))));
    end
  assign wire151 = reg121[(4'h9):(3'h6)];
  assign wire152 = reg148;
endmodule

module module62
#(parameter param111 = (~|{{(^~((8'haf) ^ (8'h9e)))}, (~&(((8'ha4) ? (7'h43) : (8'ha7)) ? ((8'had) >= (8'hab)) : {(8'haa), (8'hac)}))}))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h24b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire66;
  input wire signed [(4'h8):(1'h0)] wire65;
  input wire [(3'h4):(1'h0)] wire64;
  input wire [(4'hd):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire107,
                 wire106,
                 wire105,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire87,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 reg108,
                 reg104,
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
                 (1'h0)};
  assign wire67 = {($unsigned($unsigned(wire66)) ?
                          (~|wire65) : wire66[(4'hc):(2'h2)])};
  assign wire68 = $signed((wire67 ? wire65 : (-{((8'hbf) ? wire67 : wire63)})));
  assign wire69 = ($unsigned((~&wire66)) >> wire64[(3'h4):(2'h2)]);
  assign wire70 = ((-$unsigned(($unsigned(wire69) ?
                          wire63[(4'hd):(3'h5)] : $signed(wire69)))) ?
                      $unsigned((~&$unsigned(wire65[(4'h8):(1'h0)]))) : wire68[(4'ha):(2'h2)]);
  assign wire71 = $signed(wire63);
  assign wire72 = wire70;
  assign wire73 = {$signed(wire63[(4'h9):(4'h9)])};
  always
    @(posedge clk) begin
      if ((-wire65))
        begin
          reg74 <= (^($unsigned($signed((8'h9c))) ?
              $signed((wire73[(3'h6):(3'h6)] >>> wire69)) : (({wire72,
                  wire66} == wire64) <= (|$signed(wire65)))));
          if (wire67[(4'hf):(2'h3)])
            begin
              reg75 <= wire68;
              reg76 <= (-(~&$signed($unsigned($signed((8'h9c))))));
            end
          else
            begin
              reg75 <= ((7'h42) - $unsigned({wire68, (!$unsigned(wire63))}));
              reg76 <= (($unsigned($unsigned(((8'ha6) ?
                      wire73 : reg76))) < wire69) ?
                  wire64[(1'h1):(1'h0)] : reg75);
              reg77 <= (-(8'hb3));
              reg78 <= $unsigned(($signed({((8'h9f) ? wire63 : wire63),
                      wire70}) ?
                  wire63[(4'ha):(4'h8)] : (((reg76 ?
                      reg77 : wire64) ^~ ((8'hb3) >> wire69)) - (!{wire69,
                      reg77}))));
            end
          if ($signed({(wire66 - $signed(wire72[(1'h1):(1'h0)]))}))
            begin
              reg79 <= wire73[(3'h6):(2'h2)];
              reg80 <= $unsigned($signed($signed(wire68[(4'he):(4'ha)])));
              reg81 <= (~|{(reg76 ? reg77[(4'hb):(4'h8)] : $unsigned(reg76))});
              reg82 <= wire69;
              reg83 <= $unsigned($unsigned(($signed((~(8'hb3))) + ($signed(wire68) ?
                  ((8'hbb) ? (8'haa) : (8'hb0)) : ((8'ha5) <= wire66)))));
            end
          else
            begin
              reg79 <= $signed(($unsigned(reg82[(3'h5):(3'h4)]) ?
                  (~$signed((7'h42))) : $unsigned((~$unsigned(reg83)))));
              reg80 <= {(8'hb4),
                  {(wire67 ? (~^reg83) : wire73[(3'h7):(1'h0)])}};
            end
          reg84 <= (|wire72[(1'h0):(1'h0)]);
        end
      else
        begin
          if ((&$signed({(~$signed(reg84))})))
            begin
              reg74 <= reg81;
              reg75 <= reg76;
              reg76 <= $unsigned(wire66);
              reg77 <= wire73;
            end
          else
            begin
              reg74 <= $unsigned($unsigned($signed(reg80)));
              reg75 <= $signed($unsigned(((+wire63) ?
                  ((wire73 ? wire64 : reg79) ?
                      wire66 : (|reg84)) : ($signed(wire72) ?
                      $signed(reg76) : reg80[(4'ha):(3'h5)]))));
              reg76 <= wire65[(1'h0):(1'h0)];
            end
          if ((8'ha6))
            begin
              reg78 <= (~((reg74[(1'h1):(1'h0)] ?
                      $unsigned($unsigned(reg79)) : ((wire67 ^ wire66) ?
                          $unsigned(reg74) : (~^(8'had)))) ?
                  (^$unsigned((^reg83))) : $unsigned(wire63)));
              reg79 <= $unsigned(reg76[(1'h0):(1'h0)]);
              reg80 <= (~(~|(^$unsigned(reg75[(4'he):(2'h2)]))));
            end
          else
            begin
              reg78 <= ((~^(-$signed({(8'ha8),
                  wire72}))) != (^($unsigned(wire72) <= (-$signed(reg74)))));
              reg79 <= (reg82[(4'hb):(3'h6)] >= (~&wire68));
            end
          reg81 <= (~&$unsigned($signed(reg83)));
          if ({({(^~(^reg77)), reg78[(1'h1):(1'h1)]} ?
                  reg80 : $signed($signed($unsigned(reg79)))),
              reg76})
            begin
              reg82 <= ({reg84[(3'h6):(2'h3)],
                  (reg79 ?
                      wire72 : ((+(8'ha7)) & (^~wire72)))} < $unsigned((reg79[(1'h0):(1'h0)] && reg84[(3'h4):(2'h3)])));
            end
          else
            begin
              reg82 <= wire64;
              reg83 <= (+((^~reg75) ?
                  ({$signed(wire73)} > wire67[(4'he):(4'ha)]) : ($signed(reg76) <<< reg83)));
            end
          reg84 <= ($signed((((wire69 != reg75) << {wire70}) ?
                  wire66[(3'h7):(3'h6)] : (~|$unsigned(wire70)))) ?
              wire68[(1'h0):(1'h0)] : wire65[(1'h0):(1'h0)]);
        end
      reg85 <= wire69[(4'hb):(4'hb)];
      reg86 <= ({wire73[(1'h1):(1'h1)],
          wire70} << (reg83 << ($signed($unsigned(wire67)) ?
          reg82 : $unsigned(((8'hbd) ? (8'ha8) : reg83)))));
    end
  assign wire87 = $unsigned(($signed(($signed(wire68) ?
                      $unsigned(reg74) : $signed(reg86))) >= ((&(8'hba)) ?
                      reg80[(4'ha):(1'h1)] : ((^~wire69) ?
                          {(7'h42), reg85} : $signed(reg74)))));
  always
    @(posedge clk) begin
      reg88 <= ($signed((&$signed($unsigned(reg74)))) ?
          reg76[(2'h2):(2'h2)] : $signed((((-reg75) | wire70[(3'h5):(3'h4)]) + (reg84[(2'h3):(2'h3)] & (+reg79)))));
      reg89 <= wire64[(1'h1):(1'h0)];
      reg90 <= (reg89[(4'he):(3'h4)] ? reg76 : wire66[(2'h2):(1'h0)]);
      if (wire67[(4'h8):(3'h6)])
        begin
          reg91 <= reg89[(3'h7):(3'h6)];
          reg92 <= reg84;
          if ($signed($unsigned(reg90[(2'h2):(1'h1)])))
            begin
              reg93 <= ((~&(($signed(reg75) ^~ {(8'ha9),
                  (8'ha4)}) > $unsigned(reg75[(5'h14):(4'h9)]))) ~^ $signed(($signed(wire72) ?
                  ((reg75 ?
                      (8'ha5) : wire63) <<< $signed(reg75)) : {$signed((8'haa))})));
              reg94 <= reg83;
              reg95 <= reg79;
            end
          else
            begin
              reg93 <= $signed($signed($unsigned((8'had))));
            end
          reg96 <= wire73;
          reg97 <= ($signed((((wire72 ? wire63 : reg96) ?
              (~^wire67) : reg94) - reg80[(4'h8):(2'h2)])) < reg80);
        end
      else
        begin
          reg91 <= (reg88 >>> $unsigned((((~|(8'hbd)) & (!reg78)) != wire68[(4'hc):(4'ha)])));
          reg92 <= (-{(!(&{wire87, (7'h40)})),
              ($signed((reg82 <<< reg76)) ?
                  $signed($unsigned(wire69)) : wire65)});
        end
      reg98 <= wire72[(4'he):(1'h0)];
    end
  assign wire99 = ($signed((reg77[(2'h2):(1'h0)] << (reg80 | $signed(reg77)))) ^ ($signed(reg83) + {$unsigned($signed((8'hbd))),
                      wire66[(4'h9):(4'h9)]}));
  assign wire100 = wire87[(2'h2):(2'h2)];
  assign wire101 = wire87;
  assign wire102 = (reg77[(4'h8):(3'h5)] ? reg85 : (8'hbb));
  assign wire103 = (!(^(~|wire65)));
  always
    @(posedge clk) begin
      reg104 <= (|($signed((^$unsigned((8'h9f)))) ^ $signed({$unsigned(reg89),
          $unsigned(wire70)})));
    end
  assign wire105 = (+wire87[(2'h3):(2'h2)]);
  assign wire106 = (((reg80[(3'h4):(1'h1)] ?
                               ($signed(reg79) * reg89[(4'hc):(4'h9)]) : ((reg94 >>> (8'ha4)) ?
                                   reg78[(3'h7):(3'h4)] : (reg88 ?
                                       reg96 : wire64))) ?
                           (reg74[(1'h0):(1'h0)] ?
                               (reg74 ?
                                   (reg96 & wire101) : (8'ha5)) : $unsigned((reg80 ?
                                   wire72 : reg94))) : {reg104}) ?
                       ($unsigned($unsigned($unsigned(reg92))) ?
                           {wire71} : reg95) : (8'ha0));
  assign wire107 = ((reg78 ?
                       (-$unsigned(wire100)) : wire100) * (&(wire102[(2'h3):(2'h3)] || $unsigned(((8'ha5) ?
                       reg88 : reg91)))));
  always
    @(posedge clk) begin
      reg108 <= (^$unsigned($unsigned($unsigned((8'ha0)))));
    end
  assign wire109 = $signed($signed((reg84 ?
                       $signed({wire70, wire102}) : (reg108 >>> reg98))));
  assign wire110 = {$signed((8'hb3))};
endmodule

module module40  (y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire44;
  input wire [(5'h13):(1'h0)] wire43;
  input wire [(3'h7):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire45;
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire46,
                 wire45,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire45 = (wire43 - (wire43[(3'h7):(3'h7)] ?
                      wire43 : ((~&wire42[(3'h6):(3'h6)]) ?
                          $unsigned(wire43[(4'he):(4'h9)]) : $signed($signed(wire43)))));
  assign wire46 = wire41[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg47 <= $unsigned((^~(wire43 < {wire41, ((8'ha4) ? wire42 : (7'h43))})));
      reg48 <= $unsigned((~^(~reg47)));
      reg49 <= ($unsigned((((wire45 && reg47) ?
              $unsigned(wire44) : reg48[(2'h3):(1'h1)]) < $signed($signed((7'h43))))) ?
          reg47[(2'h2):(1'h1)] : $signed((reg48[(1'h0):(1'h0)] < ($unsigned(wire44) >= $unsigned(wire42)))));
      reg50 <= (~$signed(($signed({wire43, (8'haf)}) - reg47[(2'h2):(1'h0)])));
    end
  assign wire51 = $unsigned($unsigned($signed($unsigned((wire42 <= reg48)))));
  assign wire52 = $signed(reg50);
  always
    @(posedge clk) begin
      if ($unsigned((~|wire41)))
        begin
          reg53 <= (^~(wire42[(3'h5):(1'h1)] << $unsigned($unsigned((wire42 ?
              (8'hb3) : reg48)))));
          if ((-(wire52[(3'h5):(1'h0)] << (wire41 << ($signed(wire46) ?
              (reg50 ? wire42 : wire46) : (reg53 ? reg47 : wire43))))))
            begin
              reg54 <= $unsigned($unsigned((reg50[(4'hb):(3'h4)] <= ((~&wire51) ?
                  $signed((8'hb9)) : (reg48 <= reg49)))));
              reg55 <= {((!(~(reg47 ? reg53 : wire52))) * (reg53 > (((8'ha6) ?
                          reg50 : (8'hbb)) ?
                      (wire44 ? wire44 : wire42) : $unsigned((7'h44))))),
                  reg53[(3'h6):(2'h2)]};
              reg56 <= $unsigned(reg50[(2'h3):(1'h0)]);
              reg57 <= reg54;
            end
          else
            begin
              reg54 <= (~^$signed($unsigned((reg56 ? (+reg53) : reg54))));
              reg55 <= {wire52[(4'he):(4'hc)]};
              reg56 <= reg57[(3'h5):(1'h1)];
              reg57 <= wire44;
            end
          reg58 <= wire42;
        end
      else
        begin
          reg53 <= reg50;
          reg54 <= (~wire45);
          reg55 <= reg53;
          if (($signed($signed(($unsigned(reg50) ?
                  {reg57, (8'haf)} : wire51[(4'h8):(2'h3)]))) ?
              ((^~wire42) >>> reg57) : $signed((reg58 ?
                  ($unsigned(reg58) ?
                      ((8'ha6) && (8'hbe)) : $signed(reg48)) : (~(wire42 ?
                      wire43 : reg56))))))
            begin
              reg56 <= ($unsigned({((wire41 <= wire44) ?
                      $unsigned(reg56) : (wire42 >> reg53))}) & reg55);
              reg57 <= reg53;
              reg58 <= (~|(!(|wire42[(3'h6):(3'h6)])));
            end
          else
            begin
              reg56 <= reg57[(3'h7):(1'h0)];
              reg57 <= wire45;
              reg58 <= $unsigned((((~(&reg50)) ?
                  ($signed(wire44) ?
                      (reg47 ?
                          reg58 : reg50) : wire52[(3'h5):(3'h4)]) : (^~((8'hb5) - (8'hba)))) != $signed($signed((reg54 ?
                  reg58 : (7'h40))))));
            end
        end
      reg59 <= reg50[(4'h8):(3'h5)];
    end
endmodule
