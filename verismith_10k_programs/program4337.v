module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1f3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire225;
  wire signed [(4'hf):(1'h0)] wire223;
  wire [(5'h14):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire139;
  wire [(5'h15):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire142;
  wire signed [(3'h5):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire214;
  wire signed [(3'h6):(1'h0)] wire216;
  wire [(3'h4):(1'h0)] wire217;
  wire signed [(5'h11):(1'h0)] wire219;
  wire [(5'h15):(1'h0)] wire220;
  wire [(5'h13):(1'h0)] wire221;
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire225,
                 wire223,
                 wire137,
                 wire22,
                 wire4,
                 wire139,
                 wire140,
                 wire142,
                 wire143,
                 wire214,
                 wire216,
                 wire217,
                 wire219,
                 wire220,
                 wire221,
                 reg141,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire2;
  always
    @(posedge clk) begin
      reg5 <= {wire1};
      reg6 <= $unsigned(((^reg5[(4'h9):(3'h7)]) ~^ $signed(wire3)));
      reg7 <= $signed(wire3[(4'hb):(4'ha)]);
      if ((($signed($signed(reg5)) & wire3) && wire3[(1'h1):(1'h1)]))
        begin
          if ({{(((reg5 ?
                      wire3 : reg7) * reg6[(3'h5):(2'h2)]) || $unsigned($unsigned((8'ha4))))},
              {wire4, wire0[(3'h4):(2'h3)]}})
            begin
              reg8 <= reg6;
              reg9 <= {wire4};
              reg10 <= ((+$signed({$signed(reg9)})) ?
                  (-($signed({reg5,
                      (8'h9f)}) && ($unsigned(reg6) + (wire0 <= wire0)))) : ({$signed((reg5 ?
                              wire2 : (7'h44))),
                          (~wire2[(4'hb):(3'h6)])} ?
                      (reg8 >> wire2) : reg9));
            end
          else
            begin
              reg8 <= ((-$unsigned($unsigned(reg8[(5'h10):(1'h1)]))) ?
                  reg9[(3'h5):(3'h4)] : (8'ha1));
              reg9 <= {$signed($signed($signed((wire0 >> reg6)))),
                  (((^wire1[(3'h5):(3'h5)]) <<< (reg9 ? {reg5} : reg5)) ?
                      (8'ha2) : (((|wire0) ?
                          $unsigned((8'hb2)) : wire1) ~^ reg7))};
              reg10 <= $unsigned(wire1);
            end
          reg11 <= (reg10 ?
              wire4[(2'h2):(1'h0)] : (~|$unsigned($signed(wire2[(4'hf):(3'h5)]))));
        end
      else
        begin
          reg8 <= reg7[(1'h1):(1'h0)];
        end
      if ((wire1[(1'h1):(1'h1)] ?
          $signed(($signed((|wire4)) ?
              (|$signed(reg10)) : (-(8'h9c)))) : ({$unsigned((reg6 ?
                      reg11 : reg11)),
                  reg9} ?
              $signed($unsigned((wire2 ?
                  (8'ha4) : wire3))) : reg6[(3'h4):(2'h3)])))
        begin
          if ((($signed(reg5[(4'hb):(4'h9)]) <= {reg11}) ?
              (($signed($signed((8'ha5))) ?
                      ($unsigned(reg6) | (~reg11)) : $unsigned($unsigned(reg5))) ?
                  $signed((~|(reg7 ~^ wire1))) : $signed((reg7[(4'h8):(3'h6)] ^ (^~reg7)))) : {(((^reg11) ?
                      ((8'haa) >= wire2) : {reg6, (8'ha8)}) + (8'ha4)),
                  (^~($signed((8'haf)) >> (^(8'hbf))))}))
            begin
              reg12 <= $signed({{(reg10 ?
                          $unsigned(reg7) : reg5[(2'h2):(2'h2)]),
                      ($signed(wire4) == (^reg10))}});
              reg13 <= $signed((reg8[(4'he):(1'h1)] << (!((reg10 != (7'h40)) ?
                  reg5[(4'hf):(2'h2)] : (wire4 + (8'hbe))))));
              reg14 <= (((8'hb4) | (wire2[(4'ha):(1'h0)] ?
                      reg11[(5'h10):(4'h8)] : reg7[(2'h2):(1'h0)])) ?
                  wire3 : (!$signed((reg9[(1'h0):(1'h0)] * $unsigned((8'ha6))))));
            end
          else
            begin
              reg12 <= ((+($unsigned((!wire4)) + (|$signed(wire3)))) ?
                  $signed((8'ha7)) : (wire3 ?
                      $unsigned($unsigned((~|reg6))) : ((wire2 ?
                          (reg5 ?
                              wire1 : reg11) : reg5[(4'hd):(4'hb)]) - wire0)));
              reg13 <= $signed(($unsigned($unsigned((wire2 >>> (8'hb3)))) ?
                  reg6[(4'h8):(3'h4)] : reg13[(4'ha):(3'h4)]));
              reg14 <= (reg13[(3'h7):(3'h7)] || ($unsigned((reg14[(3'h6):(3'h6)] ?
                      reg8[(4'ha):(2'h2)] : (-reg12))) ?
                  ((^(wire1 >> wire0)) < (reg12[(2'h3):(2'h3)] ?
                      wire4[(3'h4):(1'h0)] : reg5)) : (!((reg8 ?
                      reg6 : (8'ha9)) << ((8'ha7) > wire4)))));
            end
          reg15 <= wire2;
          if ($signed((($unsigned($signed((8'ha6))) < reg8) ?
              $unsigned(reg10) : (((&wire4) ? (!(8'hb0)) : $unsigned((8'h9d))) ?
                  ((~&reg5) ~^ (~^reg13)) : reg8))))
            begin
              reg16 <= (~|wire4);
              reg17 <= (reg8[(4'h8):(3'h7)] ?
                  $unsigned(reg16[(2'h2):(2'h2)]) : reg9);
              reg18 <= reg15[(1'h0):(1'h0)];
              reg19 <= (&(($unsigned((wire1 < reg7)) | (8'hae)) ?
                  $signed(reg6) : reg7[(4'h8):(4'h8)]));
            end
          else
            begin
              reg16 <= $unsigned(($unsigned($unsigned(reg12)) ?
                  (~^$unsigned($unsigned(wire1))) : (((~|reg9) > $signed(wire0)) ?
                      (reg7[(2'h3):(1'h1)] ?
                          $signed(reg7) : (reg17 > (8'hbb))) : wire3[(4'ha):(3'h6)])));
              reg17 <= wire4[(2'h3):(2'h3)];
            end
          reg20 <= reg15;
          reg21 <= reg15[(2'h2):(1'h0)];
        end
      else
        begin
          reg12 <= (!{(reg7[(3'h7):(1'h0)] ~^ (reg12 != {reg5})), (^~(^reg8))});
        end
    end
  assign wire22 = $unsigned($unsigned($signed((|((8'h9c) + reg12)))));
  module23 #() modinst138 (wire137, clk, reg5, wire3, reg15, reg12, reg10);
  assign wire139 = (8'hb1);
  assign wire140 = reg12;
  always
    @(posedge clk) begin
      reg141 <= {((reg17 ? (~{(8'ha3), wire22}) : (~reg8)) ?
              $unsigned(reg18[(4'hd):(1'h0)]) : $signed(($unsigned(reg15) + $signed(reg10))))};
    end
  assign wire142 = (~reg5[(4'h8):(1'h0)]);
  assign wire143 = $signed({(~reg10[(5'h10):(4'ha)])});
  module144 #() modinst215 (.wire147(reg6), .wire145(wire139), .wire148(reg21), .wire146(wire142), .clk(clk), .wire149(reg9), .y(wire214));
  assign wire216 = (8'ha9);
  module55 #() modinst218 (wire217, clk, reg15, reg12, wire214, wire3);
  assign wire219 = $signed((~&(-(wire140 ? (-(8'h9f)) : {wire214}))));
  assign wire220 = $unsigned($unsigned($unsigned((^~(wire22 - wire137)))));
  module94 #() modinst222 (.wire97(reg17), .clk(clk), .wire95(reg8), .y(wire221), .wire96(reg11), .wire98(wire2));
  module55 #() modinst224 (.y(wire223), .wire59(reg5), .clk(clk), .wire56(wire142), .wire58(wire3), .wire57(reg141));
  assign wire225 = wire220;
endmodule

module module144
#(parameter param213 = (8'ha8))
(y, clk, wire149, wire148, wire147, wire146, wire145);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire149;
  input wire signed [(3'h4):(1'h0)] wire148;
  input wire signed [(4'hf):(1'h0)] wire147;
  input wire [(4'h9):(1'h0)] wire146;
  input wire [(5'h10):(1'h0)] wire145;
  wire [(3'h7):(1'h0)] wire212;
  wire signed [(4'h9):(1'h0)] wire211;
  wire [(4'h9):(1'h0)] wire196;
  wire [(5'h10):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire162;
  wire signed [(4'hf):(1'h0)] wire161;
  wire [(2'h2):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire155;
  wire [(3'h7):(1'h0)] wire154;
  wire signed [(5'h10):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire209;
  reg [(4'hc):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg159 = (1'h0);
  assign y = {wire212,
                 wire211,
                 wire196,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire209,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 (1'h0)};
  assign wire150 = (wire147 ?
                       $unsigned((wire146[(4'h8):(2'h3)] && $unsigned(wire145))) : ((~&$unsigned(wire145)) || $signed(wire149[(4'ha):(4'ha)])));
  assign wire151 = ({((8'hab) || $unsigned((!wire150)))} <= $signed(($unsigned($signed(wire150)) ?
                       ((wire150 - wire145) ?
                           (8'hbe) : $unsigned(wire145)) : wire146[(1'h1):(1'h0)])));
  assign wire152 = $unsigned({$unsigned($unsigned((wire150 ?
                           wire149 : wire146)))});
  assign wire153 = (~wire148);
  assign wire154 = ($signed((($unsigned(wire146) ?
                           $unsigned((8'ha6)) : {wire149, wire151}) ?
                       (^~(wire152 >>> wire149)) : $unsigned($unsigned(wire153)))) && wire146);
  assign wire155 = (^(((|(&wire145)) ?
                           $signed($unsigned(wire152)) : (!wire147[(1'h0):(1'h0)])) ?
                       $unsigned($unsigned((wire150 + wire150))) : wire148[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg156 <= {(((^~wire152[(1'h0):(1'h0)]) >= ($signed(wire150) ?
              wire147 : $unsigned(wire151))) ^~ (~wire145)),
          ((&(|((8'h9f) ? wire151 : wire147))) ?
              ($signed((wire155 ? wire154 : wire147)) ?
                  ($signed(wire151) >>> wire153[(3'h7):(3'h4)]) : $signed({wire145})) : ({(^wire146),
                  {wire150}} && ((wire145 ? wire154 : wire146) ?
                  wire153[(1'h1):(1'h1)] : wire155)))};
      reg157 <= ({(^~wire146[(1'h1):(1'h0)])} ?
          wire148 : (~$unsigned(wire148[(2'h3):(1'h0)])));
      reg158 <= (wire148[(3'h4):(1'h0)] ^ $signed(((!(wire147 ?
          wire155 : wire147)) <<< $signed(wire145))));
      reg159 <= (!($signed(({wire152} || {(8'hb1)})) ~^ (8'hb0)));
    end
  assign wire160 = $unsigned($unsigned(wire145[(4'ha):(4'h9)]));
  assign wire161 = (wire151[(2'h3):(2'h3)] && ($unsigned(wire149[(5'h11):(4'hd)]) || $signed((~|{wire145,
                       wire155}))));
  assign wire162 = $unsigned(($signed($signed((wire161 >> wire149))) ?
                       ($signed($unsigned(wire161)) ?
                           ((wire160 ? wire150 : (8'ha2)) ?
                               ((8'hbc) ?
                                   wire161 : (8'ha1)) : $unsigned(wire151)) : wire161) : (~&wire146[(4'h9):(2'h3)])));
  assign wire163 = {wire150[(4'hc):(1'h0)]};
  module164 #() modinst197 (.y(wire196), .clk(clk), .wire167(wire161), .wire168(wire146), .wire165(reg156), .wire166(wire152));
  module198 #() modinst210 (wire209, clk, wire145, wire151, wire154, reg159, reg156);
  assign wire211 = ($unsigned({wire153[(1'h1):(1'h0)],
                       ($signed(wire155) ?
                           (wire160 + wire147) : $signed((8'haf)))}) >> $unsigned((((wire155 ?
                           wire209 : reg157) >> $signed((8'hae))) ?
                       wire162[(3'h4):(1'h1)] : $unsigned({(8'h9f)}))));
  assign wire212 = {{{($signed(wire160) ?
                                   (wire153 ? reg159 : wire160) : (8'hb2)),
                               (wire153[(1'h1):(1'h0)] || (^wire161))},
                           wire154[(3'h5):(1'h0)]}};
endmodule

module module23
#(parameter param135 = ((((8'ha2) >>> (+((8'hb6) <<< (8'h9c)))) ? {(8'ha1)} : (!(^{(8'hb8), (7'h44)}))) ? {((((8'ha5) ? (8'hb7) : (8'haa)) ^ (^(8'hae))) ? (&((8'ha1) ^ (7'h44))) : (^((8'ha2) < (8'hb1))))} : {(~|({(8'ha0), (8'ha5)} + ((8'h9c) ? (8'had) : (8'hb6))))}), 
parameter param136 = (&(~param135)))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire28;
  input wire signed [(4'hd):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  input wire signed [(5'h11):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire133;
  wire [(4'hc):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  assign y = {wire133,
                 wire93,
                 wire92,
                 wire91,
                 wire87,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire30,
                 wire29,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire29 = wire25;
  assign wire30 = ($signed($signed(((wire26 ?
                      wire25 : wire28) ^~ wire25[(3'h4):(1'h0)]))) >>> {{$signed((^wire25))},
                      $signed(((+wire24) >> $signed(wire25)))});
  module31 #() modinst45 (wire44, clk, wire24, wire25, wire28, wire29);
  assign wire46 = ($unsigned(((^$signed((8'h9e))) ?
                      (&(wire44 ?
                          wire24 : wire44)) : $unsigned($unsigned(wire25)))) * ((8'hbd) * wire25[(1'h0):(1'h0)]));
  assign wire47 = $unsigned(((wire28 ^ (((8'ha8) | (8'hbf)) + (wire30 ?
                      wire25 : (7'h44)))) >> ($signed((^wire44)) ?
                      $signed((wire26 ? wire29 : wire44)) : ({wire28,
                          wire27} == wire44[(5'h10):(3'h5)]))));
  assign wire48 = ((wire29 < $signed(wire28[(2'h2):(1'h1)])) ?
                      $unsigned($signed(wire44[(4'hd):(3'h5)])) : wire28);
  assign wire49 = $signed($signed((($unsigned(wire28) ^~ {wire46,
                      wire26}) - wire26[(5'h12):(4'hb)])));
  assign wire50 = wire48[(4'hc):(1'h0)];
  assign wire51 = (-{(+((^(8'hbc)) ?
                          wire28[(3'h5):(2'h3)] : (wire29 ?
                              (8'haf) : wire49)))});
  assign wire52 = $unsigned($unsigned((-{{wire26, wire50}})));
  assign wire53 = (wire27 * wire44[(5'h10):(1'h0)]);
  assign wire54 = $unsigned({($signed((wire46 && wire52)) ?
                          (^~(7'h42)) : (^$unsigned(wire44)))});
  module55 #() modinst88 (.wire59(wire24), .wire57(wire51), .wire56(wire54), .wire58(wire46), .y(wire87), .clk(clk));
  always
    @(posedge clk) begin
      reg89 <= wire28[(4'he):(4'hb)];
      reg90 <= wire53;
    end
  assign wire91 = (!$unsigned($unsigned({wire54, (|wire44)})));
  assign wire92 = $unsigned(wire29);
  assign wire93 = wire49;
  module94 #() modinst134 (.wire97(wire27), .y(wire133), .wire96(wire28), .wire95(wire30), .clk(clk), .wire98(wire49));
endmodule

module module94
#(parameter param131 = {((|(8'h9c)) << (((8'hb4) ? ((7'h42) ? (8'hb0) : (8'hbf)) : (-(8'hb4))) << {(^(8'ha7)), ((8'ha5) <= (8'ha8))}))}, 
parameter param132 = ((param131 && param131) ? {param131, param131} : (&(~^{(8'hbf)}))))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire98;
  input wire [(4'hd):(1'h0)] wire97;
  input wire [(5'h11):(1'h0)] wire96;
  input wire signed [(3'h5):(1'h0)] wire95;
  wire [(3'h5):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  wire signed [(5'h13):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire103;
  wire [(5'h13):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire99;
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  assign y = {wire130,
                 wire120,
                 wire119,
                 wire118,
                 wire115,
                 wire114,
                 wire113,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg117,
                 reg116,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire99 = $signed(wire98);
  assign wire100 = (($unsigned($unsigned((8'hba))) >> (((^~wire96) ?
                           $unsigned(wire95) : (wire99 ?
                               wire99 : wire96)) == $unsigned({(7'h43),
                           wire98}))) ?
                       (~wire95) : (wire96[(4'hb):(2'h2)] ?
                           ({{wire97}, wire97[(4'hb):(3'h5)]} ?
                               $unsigned(wire95) : {wire98[(3'h4):(1'h1)]}) : $unsigned(({wire95,
                                   wire99} ?
                               wire98 : wire97[(4'h9):(2'h3)]))));
  assign wire101 = $signed($unsigned($signed(((-wire99) ?
                       {wire96} : {wire97}))));
  assign wire102 = (!{wire101[(3'h4):(1'h0)]});
  assign wire103 = $unsigned(wire95[(3'h4):(2'h2)]);
  assign wire104 = (((($unsigned(wire99) ?
                               (wire102 ? wire97 : (8'hb0)) : (&wire97)) ?
                           ($signed(wire102) ?
                               wire95 : wire103[(2'h3):(1'h0)]) : $unsigned((wire96 ?
                               wire103 : (8'ha5)))) ?
                       (~^(+$signed(wire98))) : wire102[(4'h8):(3'h7)]) >= $signed((~{$unsigned(wire102),
                       $signed(wire101)})));
  assign wire105 = $unsigned((~|$unsigned(wire102[(3'h5):(3'h5)])));
  assign wire106 = $unsigned($signed(wire99[(4'h8):(2'h2)]));
  assign wire107 = (wire103 - $signed((~&wire101[(4'hc):(4'ha)])));
  assign wire108 = ($signed((-((wire97 ? wire100 : (7'h44)) ?
                           {wire96} : (~|wire100)))) ?
                       $signed(($unsigned($signed((8'ha3))) ?
                           wire100 : (^~{(8'hb2)}))) : ((((wire98 ?
                               wire98 : wire99) << $unsigned(wire105)) ?
                           (&$signed(wire100)) : $signed($unsigned(wire105))) * $unsigned((wire99 >= $unsigned(wire95)))));
  always
    @(posedge clk) begin
      reg109 <= $signed(wire107[(1'h0):(1'h0)]);
      reg110 <= $signed($unsigned(wire99[(3'h4):(1'h0)]));
      reg111 <= $unsigned({wire105,
          $signed({reg110, (wire101 ? reg110 : wire103)})});
      reg112 <= $unsigned((($unsigned(wire105) ? reg109 : (+$signed((8'ha1)))) ?
          $signed($signed(wire100[(4'hc):(1'h1)])) : (wire106 ?
              wire107 : $unsigned((+wire102)))));
    end
  assign wire113 = wire102;
  assign wire114 = $unsigned(reg109[(5'h11):(4'hf)]);
  assign wire115 = wire98;
  always
    @(posedge clk) begin
      reg116 <= $signed(wire98);
      reg117 <= $signed((^~wire97[(4'h8):(4'h8)]));
    end
  assign wire118 = (-(!$signed(($unsigned(wire115) ? (7'h42) : {reg112}))));
  assign wire119 = (~&$signed($unsigned(reg117[(5'h14):(5'h11)])));
  assign wire120 = {(^wire104[(1'h0):(1'h0)]),
                       (($signed({wire105, reg109}) ?
                           wire100[(4'h8):(1'h1)] : $signed(reg117[(3'h4):(1'h0)])) - $signed(reg109[(1'h1):(1'h0)]))};
  always
    @(posedge clk) begin
      reg121 <= {{(-((8'hbe) ? $unsigned(wire101) : $unsigned((8'ha4)))),
              {((~|(8'ha5)) ?
                      wire101[(5'h11):(2'h2)] : (wire106 ? reg109 : wire98))}}};
      reg122 <= {reg121[(1'h0):(1'h0)],
          ($signed(wire118) ?
              {$signed($signed(wire104)),
                  (8'h9e)} : $unsigned(wire101[(1'h1):(1'h0)]))};
      if ((^~($unsigned(wire119[(3'h7):(1'h1)]) && reg111)))
        begin
          reg123 <= $unsigned($unsigned(wire107));
          reg124 <= ((+wire118) ?
              reg110[(3'h4):(2'h3)] : (~&(wire99[(4'h8):(3'h5)] ?
                  {$signed(reg123), wire119[(1'h1):(1'h0)]} : wire115)));
          reg125 <= (+$signed(reg123));
          if ($signed($unsigned(wire96)))
            begin
              reg126 <= (~($unsigned(wire119[(4'h8):(3'h7)]) ?
                  reg116[(3'h7):(3'h5)] : wire115[(4'he):(3'h5)]));
              reg127 <= (|wire115);
              reg128 <= ($signed({$signed($unsigned(reg124))}) < (wire113 ?
                  wire95 : (~^wire99)));
            end
          else
            begin
              reg126 <= ((((-(8'hb4)) ?
                          ($signed(reg117) && (wire104 >> (8'hb5))) : ($signed((8'hbe)) && $unsigned(wire103))) ?
                      $signed($unsigned((reg111 ?
                          reg116 : wire119))) : $unsigned((^~$unsigned(wire104)))) ?
                  $unsigned((reg123[(1'h1):(1'h0)] | $unsigned($signed(reg122)))) : $signed(((~^(wire107 + wire99)) ?
                      reg116[(3'h5):(3'h4)] : reg128[(1'h1):(1'h0)])));
              reg127 <= ({($signed(wire96) ?
                          wire114[(4'h8):(2'h3)] : $unsigned((reg122 ?
                              reg127 : wire103)))} ?
                  ({((reg121 >> reg122) < $unsigned(wire108))} > (-(8'ha5))) : ($signed((~&{(8'ha1)})) & (^((8'ha1) ?
                      $signed(wire95) : (wire107 ? (8'had) : wire114)))));
              reg128 <= wire120;
              reg129 <= ((($signed((~^reg123)) ?
                      $signed(reg110) : $signed(reg122)) ?
                  ($signed((wire102 >= wire106)) ?
                      {$signed(wire106),
                          (wire104 ? wire98 : reg126)} : ((wire104 != reg124) ?
                          (~|(8'haa)) : $signed(wire108))) : (|reg112[(2'h2):(1'h0)])) >> reg116[(2'h3):(2'h3)]);
            end
        end
      else
        begin
          reg123 <= wire98[(4'ha):(1'h0)];
          reg124 <= (($signed({$unsigned(wire107)}) + reg125) ^ ($signed({((7'h40) ~^ wire102)}) ?
              $signed($signed(wire100[(1'h1):(1'h0)])) : (-$unsigned(wire98))));
          reg125 <= (wire120 ?
              (~($unsigned(wire98) & ((^wire99) ?
                  $signed(reg109) : $signed(wire95)))) : ((~|($signed(reg129) < wire101)) - (~^({reg117,
                  (8'hb3)} << {(8'hae), wire108}))));
          reg126 <= reg123;
        end
    end
  assign wire130 = $signed((|(8'haa)));
endmodule

module module55
#(parameter param85 = (~^({(((8'hbe) << (8'hb2)) ? {(7'h41)} : ((8'hb6) ? (8'hae) : (8'hbd)))} ? ((^~((8'haf) ? (7'h40) : (8'h9d))) - (~|(^~(8'hb8)))) : ((((8'hbc) ? (8'hb8) : (8'hba)) ? {(8'hbb), (7'h43)} : ((8'h9d) ? (8'ha5) : (7'h41))) * {((8'h9c) > (8'h9c)), ((8'hae) ^~ (8'ha8))}))), 
parameter param86 = (~|(^(^~((~|param85) ? param85 : (&(7'h43)))))))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire59;
  input wire signed [(4'hc):(1'h0)] wire58;
  input wire signed [(4'h8):(1'h0)] wire57;
  input wire [(4'hb):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  assign y = {wire84,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire60 = wire58;
  assign wire61 = wire56[(1'h0):(1'h0)];
  assign wire62 = wire57[(2'h2):(1'h0)];
  assign wire63 = $unsigned($signed($signed($unsigned(wire60[(3'h4):(1'h0)]))));
  assign wire64 = ($signed(wire59) ?
                      $signed(($unsigned((wire57 == wire61)) ?
                          $unsigned(wire58) : $signed($signed(wire59)))) : $signed({(|(wire60 <<< wire59))}));
  always
    @(posedge clk) begin
      reg65 <= (~|$signed((~|((&(8'hb1)) ? wire61 : $unsigned((7'h44))))));
      reg66 <= ((($signed((wire62 >>> wire63)) ?
          (-(wire57 ?
              (8'hbf) : wire57)) : wire59[(4'hd):(4'ha)]) <= $unsigned($unsigned(wire56[(4'hb):(4'h8)]))) < wire56[(3'h6):(3'h4)]);
    end
  assign wire67 = $signed($signed(($signed((8'ha1)) ?
                      $unsigned(reg66[(4'hb):(1'h1)]) : wire58)));
  assign wire68 = wire56[(3'h6):(2'h2)];
  assign wire69 = {(wire57 ?
                          {(reg65[(2'h2):(2'h2)] ^ $signed(wire58))} : (-wire56))};
  assign wire70 = ((-($unsigned((8'hbb)) ?
                      (reg66 ?
                          {wire69,
                              (8'hb8)} : wire67) : wire56)) >> (^$signed($signed(wire59))));
  assign wire71 = $signed(wire68[(4'ha):(3'h5)]);
  assign wire72 = {wire63[(2'h3):(1'h0)],
                      (($signed(reg66[(4'ha):(3'h6)]) + $unsigned($unsigned(reg65))) ?
                          (((!reg65) ?
                              (-reg65) : wire57[(2'h3):(1'h0)]) >= (~&{wire70})) : (~(wire64 != (8'ha7))))};
  assign wire73 = (~$signed(({wire64} & (!(wire68 <<< wire58)))));
  assign wire74 = {(8'hbb),
                      (wire72 ?
                          wire67 : {($signed(wire67) >= wire68[(3'h7):(1'h1)]),
                              wire70})};
  always
    @(posedge clk) begin
      if ((((wire69 ?
          ($signed(wire68) >= (wire56 ?
              wire61 : wire59)) : $signed($signed(wire67))) < (~^wire62[(1'h0):(1'h0)])) <= wire62[(1'h0):(1'h0)]))
        begin
          reg75 <= wire62[(1'h1):(1'h0)];
          reg76 <= (-$signed((+$unsigned((8'hb2)))));
        end
      else
        begin
          if ($unsigned($unsigned({($unsigned(wire68) * wire63),
              ($signed(wire61) < (~|wire58))})))
            begin
              reg75 <= wire58[(3'h7):(3'h6)];
              reg76 <= wire57;
            end
          else
            begin
              reg75 <= ($signed(wire58[(3'h5):(1'h1)]) ?
                  wire61[(2'h3):(2'h2)] : wire67);
              reg76 <= (($signed(((+wire67) * wire62)) ?
                      (~&$unsigned({wire73, wire60})) : wire56[(3'h4):(1'h1)]) ?
                  wire70[(4'h8):(4'h8)] : wire61);
              reg77 <= (~^$signed(wire68));
              reg78 <= ($signed($unsigned($signed((7'h44)))) >>> wire71);
              reg79 <= reg77[(3'h4):(3'h4)];
            end
          reg80 <= $signed((($signed((reg77 <<< wire70)) <= wire67[(3'h4):(1'h1)]) ?
              wire67[(1'h1):(1'h0)] : (!(~wire69[(3'h5):(2'h2)]))));
          reg81 <= {($signed($unsigned($signed(wire72))) ?
                  reg66 : $unsigned(wire58[(1'h1):(1'h0)]))};
          reg82 <= ($signed(reg79[(3'h5):(3'h5)]) ?
              ($signed(({reg81, wire57} ? $signed(wire64) : (~|wire67))) ?
                  wire74 : $signed((wire64 ?
                      (!wire70) : wire63))) : {wire71[(2'h3):(1'h1)], wire71});
        end
      reg83 <= (~(wire69[(1'h1):(1'h1)] ?
          (((|wire59) <<< (reg66 && reg78)) <<< reg80) : wire56[(2'h3):(2'h3)]));
    end
  assign wire84 = wire64;
endmodule

module module31  (y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire35;
  input wire signed [(4'hc):(1'h0)] wire34;
  input wire [(3'h5):(1'h0)] wire33;
  input wire [(4'hf):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  assign y = {wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg42,
                 (1'h0)};
  assign wire36 = wire33;
  assign wire37 = wire33[(3'h4):(2'h3)];
  assign wire38 = ({{(~wire37[(1'h1):(1'h0)]), $unsigned(wire36)},
                      ($signed((wire36 ^ wire36)) >> $unsigned($signed(wire34)))} >> {(wire34 ?
                          (wire34 ?
                              $unsigned(wire36) : (wire33 > wire32)) : $signed({wire32,
                              (7'h40)}))});
  assign wire39 = $signed($unsigned(wire38));
  assign wire40 = $unsigned((!wire37));
  assign wire41 = $unsigned(wire39[(4'he):(2'h3)]);
  always
    @(posedge clk) begin
      reg42 <= (wire36[(1'h1):(1'h1)] * wire39);
    end
  assign wire43 = (-(+$signed((wire41 != (-wire40)))));
endmodule

module module198  (y, clk, wire203, wire202, wire201, wire200, wire199);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire203;
  input wire [(3'h6):(1'h0)] wire202;
  input wire signed [(3'h7):(1'h0)] wire201;
  input wire signed [(5'h15):(1'h0)] wire200;
  input wire signed [(4'ha):(1'h0)] wire199;
  wire signed [(5'h11):(1'h0)] wire208;
  wire signed [(3'h4):(1'h0)] wire207;
  wire [(3'h5):(1'h0)] wire206;
  wire [(4'hb):(1'h0)] wire205;
  wire [(4'hf):(1'h0)] wire204;
  assign y = {wire208, wire207, wire206, wire205, wire204, (1'h0)};
  assign wire204 = wire202[(3'h5):(2'h3)];
  assign wire205 = ($signed(wire200) < (+$signed(wire202)));
  assign wire206 = {($signed((8'ha3)) ?
                           $unsigned(($signed((8'haa)) ?
                               {(7'h43),
                                   wire199} : $unsigned(wire204))) : ($signed((wire200 ?
                                   wire204 : wire199)) ?
                               wire204 : (8'hb2)))};
  assign wire207 = wire200;
  assign wire208 = (($unsigned(wire206) ^ wire203[(4'hd):(1'h0)]) + (wire200[(2'h3):(2'h2)] & wire201));
endmodule

module module164  (y, clk, wire168, wire167, wire166, wire165);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire168;
  input wire [(4'hf):(1'h0)] wire167;
  input wire signed [(5'h12):(1'h0)] wire166;
  input wire [(4'hc):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire195;
  wire signed [(5'h10):(1'h0)] wire194;
  wire [(4'hb):(1'h0)] wire193;
  wire [(5'h10):(1'h0)] wire180;
  wire signed [(3'h4):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire178;
  wire signed [(4'hb):(1'h0)] wire177;
  wire signed [(4'hb):(1'h0)] wire176;
  wire [(3'h5):(1'h0)] wire175;
  wire [(5'h12):(1'h0)] wire169;
  reg signed [(3'h4):(1'h0)] reg192 = (1'h0);
  reg [(4'hd):(1'h0)] reg191 = (1'h0);
  reg [(3'h6):(1'h0)] reg190 = (1'h0);
  reg [(5'h15):(1'h0)] reg189 = (1'h0);
  reg [(5'h10):(1'h0)] reg188 = (1'h0);
  reg [(4'hd):(1'h0)] reg187 = (1'h0);
  reg [(4'hf):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(4'he):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg [(4'h8):(1'h0)] reg181 = (1'h0);
  reg signed [(4'he):(1'h0)] reg174 = (1'h0);
  reg [(4'ha):(1'h0)] reg173 = (1'h0);
  reg [(4'h8):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg170 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire169,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 (1'h0)};
  assign wire169 = (((^~$unsigned((^~wire168))) ?
                       {({wire167} << wire167[(3'h6):(2'h3)])} : ($signed($unsigned(wire165)) ?
                           $unsigned(((8'haf) + wire166)) : (~|{wire167,
                               (8'ha4)}))) | (wire167 >> $signed(wire165[(4'hb):(4'ha)])));
  always
    @(posedge clk) begin
      reg170 <= (8'hbb);
      reg171 <= ($unsigned(wire169) ?
          $unsigned($unsigned(((wire167 >>> wire165) ?
              $unsigned(wire169) : reg170))) : $unsigned($unsigned(wire165)));
      reg172 <= ((~^$unsigned($unsigned({reg171, wire168}))) ?
          $unsigned($signed(reg170)) : ((({reg170} >> {(8'h9d), wire167}) ?
                  {(wire167 > (8'hb1)), (wire168 ? reg171 : reg170)} : reg170) ?
              ($signed($signed(wire167)) >> wire165[(2'h2):(1'h0)]) : $signed(wire165)));
      reg173 <= {(8'ha7),
          (wire166[(4'ha):(3'h6)] == ($signed(wire169) ?
              $unsigned((reg172 >> wire166)) : (8'ha1)))};
      reg174 <= (^~reg173);
    end
  assign wire175 = wire169[(3'h7):(3'h6)];
  assign wire176 = (^$signed($unsigned(($unsigned((8'hb9)) ?
                       reg171[(1'h0):(1'h0)] : {wire168}))));
  assign wire177 = (^~{{$unsigned(reg174), reg171}});
  assign wire178 = reg173;
  assign wire179 = (|(+reg171));
  assign wire180 = $signed((wire176 ?
                       reg173[(3'h4):(2'h3)] : (wire167[(2'h2):(1'h1)] >= (wire178[(4'hb):(3'h5)] && (reg172 >> reg173)))));
  always
    @(posedge clk) begin
      reg181 <= (reg173 ^~ $unsigned(wire177));
      reg182 <= $signed(wire180[(3'h6):(2'h2)]);
      if ((reg182[(1'h1):(1'h1)] * (+wire180)))
        begin
          reg183 <= reg182;
          reg184 <= ((^{($unsigned(reg170) ?
                  wire178 : (wire176 ^~ wire178))}) > reg170[(3'h7):(3'h6)]);
          reg185 <= (((~(reg172 || (~^(8'ha9)))) ?
              ((8'hb3) >> ((^~reg173) ?
                  reg183 : $signed(wire180))) : ($signed($signed(wire178)) < ((8'ha1) >= reg183[(3'h7):(3'h7)]))) | reg184[(3'h5):(3'h4)]);
        end
      else
        begin
          reg183 <= (wire177 ?
              $unsigned((~|((wire176 && wire168) ?
                  wire177[(3'h5):(2'h2)] : $unsigned(reg182)))) : (((wire178[(3'h6):(1'h0)] ?
                  (~^reg185) : reg173[(4'h9):(3'h6)]) >> {(wire175 != wire169)}) << (|reg184)));
          if (reg185)
            begin
              reg184 <= (|wire168[(3'h4):(1'h0)]);
              reg185 <= (7'h43);
              reg186 <= reg185;
              reg187 <= (((({(8'ha5), wire179} - $signed(wire167)) ?
                  (wire175 == $signed(reg173)) : reg183) >= (wire177[(4'hb):(3'h5)] ?
                  ($unsigned(reg173) > (wire176 ?
                      reg185 : wire167)) : $unsigned(reg181[(2'h3):(1'h0)]))) || (8'hb4));
              reg188 <= ((+$unsigned(wire165[(3'h5):(3'h5)])) << $signed((-reg174)));
            end
          else
            begin
              reg184 <= (^~(((((7'h42) ?
                      reg181 : (8'hac)) ^~ reg188[(5'h10):(3'h7)]) ?
                  wire169[(1'h0):(1'h0)] : ($signed(wire165) - (reg185 || reg174))) + {reg188}));
              reg185 <= (~&reg173);
              reg186 <= {($signed($signed($unsigned(wire179))) ?
                      (8'hbc) : {($unsigned((8'hbe)) <= reg170)}),
                  (~|$signed($signed((|reg185))))};
              reg187 <= reg184;
              reg188 <= {$unsigned(((^~(wire178 ?
                      reg186 : reg184)) <= $unsigned($unsigned(wire180))))};
            end
          reg189 <= $signed({{{(~|(8'hab)), $signed(reg173)},
                  (wire167 ? (reg171 != (8'hbb)) : (-reg187))},
              wire169});
          reg190 <= {(^~$unsigned(($signed(reg186) ?
                  (wire178 >= reg183) : (reg182 < reg183)))),
              ({reg184[(4'hb):(2'h3)]} ?
                  ((~wire180) ?
                      $unsigned((reg173 ^~ reg186)) : wire176) : wire169[(4'ha):(4'h9)])};
          reg191 <= ($unsigned(reg171[(2'h3):(1'h0)]) ?
              {$unsigned((|(reg181 ~^ wire166)))} : {(((wire177 < reg188) ?
                      $signed(wire166) : (wire169 ~^ (8'h9f))) == (!reg174[(3'h6):(1'h1)])),
                  $unsigned(((~^reg171) ~^ reg187))});
        end
      reg192 <= {wire167[(2'h3):(2'h2)], (~|reg173)};
    end
  assign wire193 = {((~^$signed($unsigned(wire169))) & ((-wire169) ?
                           (~^$unsigned(wire168)) : $unsigned((wire180 ?
                               reg186 : wire180)))),
                       ((-wire165[(3'h7):(3'h6)]) ?
                           (+(wire179 ?
                               $signed(reg171) : $unsigned(wire176))) : reg187[(3'h6):(1'h1)])};
  assign wire194 = (($signed((~|(wire165 ? reg182 : wire175))) ?
                           ((wire175 * wire165[(3'h4):(1'h0)]) ?
                               ((wire179 ? reg188 : reg183) ?
                                   $signed(wire167) : (reg182 ?
                                       (8'hba) : reg184)) : (8'ha0)) : (wire179 ?
                               ((~wire165) != reg183) : $signed($signed(reg189)))) ?
                       reg184[(4'h9):(4'h9)] : (-{reg181[(1'h0):(1'h0)],
                           (-$signed(reg170))}));
  assign wire195 = $unsigned($signed(wire180[(4'hb):(3'h4)]));
endmodule
