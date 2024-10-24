module top
#(parameter param174 = (({((~^(8'hbc)) ? (!(8'haf)) : ((8'ha7) ? (8'hb6) : (8'had)))} & ((|((8'ha3) ? (8'ha6) : (8'ha7))) ? {((8'ha2) ? (8'h9e) : (8'ha9)), (|(8'hbf))} : ({(8'ha4), (7'h42)} == ((8'had) != (8'hbb))))) ? {(^~(^~{(8'hb0)})), (({(8'ha3)} ? {(8'hb0), (8'hbd)} : ((8'ha7) << (8'ha5))) ? (&{(8'h9f), (8'hb4)}) : (((8'hb8) && (8'hbd)) || (8'hb5)))} : ((({(8'hb1), (7'h41)} ? ((8'hb6) >= (8'ha9)) : ((8'ha0) > (7'h43))) ? (((8'hbd) - (8'hbf)) >>> {(8'hb9), (7'h41)}) : {((8'hb5) ? (8'hb8) : (8'hb6)), ((8'ha8) ~^ (7'h43))}) == ((((8'hb2) ? (8'hbd) : (8'ha6)) + ((8'hae) ? (8'hac) : (8'hb4))) - (!((8'ha8) ? (8'hb1) : (8'hb6)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire173;
  wire signed [(5'h14):(1'h0)] wire171;
  wire [(5'h10):(1'h0)] wire169;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  assign y = {wire173, wire171, wire169, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire3[(5'h12):(4'ha)];
  assign wire6 = wire3[(5'h10):(4'h9)];
  assign wire7 = $unsigned($signed((~&$unsigned({wire6, (8'hbd)}))));
  module8 #() modinst170 (.wire12(wire3), .clk(clk), .y(wire169), .wire10(wire5), .wire9(wire7), .wire11(wire4));
  module17 #() modinst172 (.wire20(wire7), .y(wire171), .wire21(wire2), .wire19(wire1), .wire18(wire169), .clk(clk));
  assign wire173 = (8'ha7);
endmodule

module module8
#(parameter param168 = {{(+(!(+(8'h9c))))}, ((|(((8'ha0) * (8'hab)) << ((8'ha5) - (7'h40)))) - (8'ha7))})
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h1f3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire167;
  wire signed [(3'h5):(1'h0)] wire166;
  wire [(5'h12):(1'h0)] wire165;
  wire [(3'h5):(1'h0)] wire164;
  wire signed [(3'h5):(1'h0)] wire163;
  wire signed [(4'ha):(1'h0)] wire161;
  wire [(4'h9):(1'h0)] wire124;
  wire signed [(4'h8):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire122;
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire161,
                 wire124,
                 wire108,
                 wire56,
                 wire54,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire110,
                 wire122,
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
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire13 = (|(^~$signed($unsigned($unsigned(wire9)))));
  assign wire14 = wire13;
  assign wire15 = ($unsigned(wire9[(3'h7):(2'h3)]) ?
                      ((~$unsigned(wire10[(1'h0):(1'h0)])) < $unsigned(((!wire12) << (^(8'hae))))) : wire11[(1'h0):(1'h0)]);
  assign wire16 = {(-wire13[(5'h12):(3'h5)])};
  module17 #() modinst55 (wire54, clk, wire12, wire11, wire9, wire10);
  assign wire56 = ($signed((!(wire12[(4'hb):(2'h2)] ?
                      (wire10 ?
                          (8'had) : wire15) : $signed(wire15)))) >= (8'ha2));
  always
    @(posedge clk) begin
      reg57 <= wire13[(4'he):(1'h0)];
      if (wire54)
        begin
          reg58 <= (wire13 ?
              (~^($signed({wire56}) ?
                  wire13[(5'h11):(4'ha)] : wire54)) : $unsigned($signed(wire54[(1'h1):(1'h0)])));
          reg59 <= {(wire11[(1'h0):(1'h0)] > (reg58 < ((wire12 ?
                  reg58 : wire56) >> (wire11 ? wire54 : reg57))))};
          reg60 <= ($signed(((8'ha4) < ((wire16 ? (8'ha6) : wire15) ?
                  (8'ha9) : $signed((8'hbe))))) ?
              (&$signed($signed($signed(wire12)))) : (wire11[(1'h0):(1'h0)] ?
                  wire56 : (~|(-((8'ha1) << (8'haf))))));
        end
      else
        begin
          reg58 <= $signed(($unsigned((-wire13)) != {((wire56 ?
                      reg59 : wire54) ?
                  $unsigned((8'h9f)) : wire10[(4'he):(2'h3)])}));
          if (wire14[(1'h1):(1'h1)])
            begin
              reg59 <= $signed(($unsigned(wire15) <= $signed(((wire10 ?
                  wire11 : wire9) + {(8'ha3), reg58}))));
              reg60 <= $unsigned((reg59[(3'h5):(1'h1)] ?
                  ((^reg57[(3'h6):(2'h3)]) ?
                      $unsigned(wire10) : $unsigned((|(8'ha8)))) : (8'hb7)));
            end
          else
            begin
              reg59 <= reg58[(1'h0):(1'h0)];
              reg60 <= reg59[(1'h1):(1'h0)];
              reg61 <= reg59[(4'h8):(4'h8)];
              reg62 <= (~{(reg57[(1'h1):(1'h1)] ?
                      $unsigned(wire16) : ({wire12, (7'h42)} ?
                          ((8'hbb) >> reg60) : {(8'hb1), (7'h43)})),
                  ($signed(((8'hb8) && wire56)) ?
                      ($unsigned(reg59) | (reg60 ?
                          wire10 : (8'hb3))) : ($signed(reg60) << (^wire16)))});
              reg63 <= $unsigned($signed((~^$unsigned((wire54 ?
                  wire11 : wire16)))));
            end
          if (($unsigned($unsigned((!$signed(wire10)))) ?
              reg60[(1'h1):(1'h1)] : $unsigned(reg62)))
            begin
              reg64 <= (8'hac);
              reg65 <= {((($unsigned(wire13) ~^ $unsigned(wire12)) >= $signed((wire54 ?
                      wire56 : wire10))) - (-wire54)),
                  $signed($signed({reg57[(2'h2):(2'h2)]}))};
              reg66 <= $signed(wire15);
              reg67 <= wire12[(5'h13):(2'h3)];
              reg68 <= ($unsigned($signed($signed((wire16 ^ wire15)))) || ($signed($unsigned($signed((8'h9c)))) <<< $unsigned(wire10)));
            end
          else
            begin
              reg64 <= $signed($signed((~$unsigned($signed(reg63)))));
              reg65 <= $unsigned($unsigned(($unsigned((reg66 ?
                  wire14 : wire54)) && {$unsigned(wire13)})));
              reg66 <= (~&({(&reg68), (~^$unsigned((7'h40)))} >= reg61));
              reg67 <= (!$unsigned($unsigned(reg62[(3'h6):(2'h2)])));
            end
          reg69 <= (reg61 ?
              (|(-$signed(wire10[(2'h3):(2'h2)]))) : reg62[(3'h6):(3'h5)]);
          if ((!reg67[(3'h5):(1'h1)]))
            begin
              reg70 <= (wire12[(3'h4):(2'h2)] <= reg61[(1'h1):(1'h0)]);
              reg71 <= (wire12 + $unsigned((wire10 && wire16)));
              reg72 <= {{($signed((reg61 ^ (8'hb5))) && $signed(reg60[(3'h7):(3'h5)])),
                      {(~&$unsigned((8'hbe))), reg66}}};
              reg73 <= (~&wire12);
              reg74 <= wire16[(2'h3):(1'h1)];
            end
          else
            begin
              reg70 <= $signed((!{$unsigned((~&reg69))}));
              reg71 <= reg70;
              reg72 <= $unsigned($unsigned($signed(wire14[(3'h5):(3'h4)])));
              reg73 <= ($unsigned($signed($signed((^~wire54)))) - wire13);
              reg74 <= ({(~$unsigned($signed(reg68)))} ~^ $signed(($signed(reg69) ~^ ({wire13,
                  reg62} >>> {wire16}))));
            end
        end
      reg75 <= wire54[(2'h3):(2'h3)];
      reg76 <= ($unsigned({wire11[(4'h8):(3'h6)],
          (reg69 ?
              $unsigned((8'hae)) : (wire15 ^~ wire12))}) + reg59[(4'ha):(4'h8)]);
      if ($unsigned((({$signed(reg58)} == ($unsigned(reg63) && $signed(wire54))) << wire10[(4'hb):(3'h5)])))
        begin
          if (reg65[(1'h1):(1'h1)])
            begin
              reg77 <= {reg70[(5'h11):(2'h3)], reg76[(4'he):(3'h6)]};
              reg78 <= reg76[(4'hd):(1'h0)];
              reg79 <= (8'h9c);
            end
          else
            begin
              reg77 <= $unsigned((~($signed((~|wire11)) < reg69[(4'h9):(3'h4)])));
              reg78 <= (^~($signed($signed($unsigned(wire54))) ?
                  $signed({(reg77 ?
                          reg64 : reg70)}) : (((+wire10) ^ $signed(reg63)) ?
                      $unsigned(reg65) : (reg70[(4'hd):(3'h5)] != (&(8'h9d))))));
            end
        end
      else
        begin
          reg77 <= reg75;
          reg78 <= ((($signed((wire15 ? (7'h41) : wire15)) ?
              (wire13 ?
                  ((8'hbe) ?
                      reg71 : reg69) : reg74) : (((7'h43) - reg75) ^ (reg66 ^~ (8'hbc)))) ^~ $unsigned((|(reg57 ?
              reg65 : reg76)))) ~^ ({(~|{wire11, reg75}),
              $unsigned($signed((8'hbd)))} | $unsigned(((reg74 ?
                  reg75 : reg69) ?
              $unsigned(reg64) : wire56))));
          reg79 <= reg64[(2'h2):(1'h0)];
        end
    end
  module80 #() modinst109 (wire108, clk, reg71, reg77, wire11, reg57, reg72);
  assign wire110 = wire10[(4'h8):(1'h1)];
  module111 #() modinst123 (wire122, clk, wire108, reg60, reg78, reg58, reg59);
  assign wire124 = ($unsigned((~|$unsigned((~|wire122)))) ?
                       (reg74 ^~ $unsigned($signed(wire9))) : wire110);
  module125 #() modinst162 (.wire129(reg68), .clk(clk), .y(wire161), .wire127(reg60), .wire128(wire16), .wire126(wire13));
  assign wire163 = {$signed({{(&reg76), (~^reg79)}, (!(reg58 || wire9))})};
  assign wire164 = reg67;
  assign wire165 = $unsigned(wire122[(4'hf):(4'hc)]);
  assign wire166 = $unsigned(((wire14[(3'h4):(3'h4)] <= ((8'hb1) || $signed((8'haf)))) != ((wire110[(2'h3):(2'h3)] ?
                       $unsigned(wire163) : (reg73 ~^ reg70)) && {reg61})));
  assign wire167 = wire110[(4'ha):(3'h6)];
endmodule

module module125  (y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire129;
  input wire signed [(4'hb):(1'h0)] wire128;
  input wire signed [(4'h8):(1'h0)] wire127;
  input wire signed [(4'hf):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire149;
  wire signed [(4'h9):(1'h0)] wire145;
  wire signed [(5'h13):(1'h0)] wire144;
  wire [(3'h5):(1'h0)] wire141;
  wire [(4'hd):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire133;
  reg signed [(5'h12):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg158 = (1'h0);
  reg [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  assign y = {wire149,
                 wire145,
                 wire144,
                 wire141,
                 wire140,
                 wire139,
                 wire133,
                 reg160,
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
                 reg148,
                 reg147,
                 reg146,
                 reg143,
                 reg142,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg130 <= ($signed(wire128) < $signed((|(8'hb9))));
      reg131 <= ($unsigned($unsigned({(wire126 ?
              wire129 : wire129)})) ^~ (~$signed(($unsigned(wire127) < wire129[(3'h5):(2'h2)]))));
      reg132 <= wire127;
    end
  assign wire133 = $unsigned($unsigned($unsigned((|(reg132 | wire127)))));
  always
    @(posedge clk) begin
      reg134 <= ((~&$unsigned((~|$unsigned(wire133)))) ?
          (reg131 && wire126[(4'ha):(2'h2)]) : $signed($signed(wire127)));
      reg135 <= ($unsigned($signed(reg130[(2'h2):(2'h2)])) || {(~|($unsigned(wire129) ^~ (|wire128)))});
      reg136 <= (((((~|(8'hb1)) <<< (wire127 >> reg135)) != ($signed(reg132) - (~|reg132))) ?
              ((reg135[(1'h1):(1'h1)] ?
                  ((8'hb8) ?
                      (8'h9f) : reg130) : wire127[(1'h1):(1'h1)]) && $unsigned((reg135 ?
                  reg134 : wire127))) : ($unsigned(wire128[(3'h7):(1'h1)]) ?
                  (8'ha1) : (|$signed((8'haa))))) ?
          (-(reg134[(1'h0):(1'h0)] ?
              wire126[(1'h1):(1'h0)] : (8'h9e))) : {(!{$signed(reg132)}),
              $unsigned(wire127[(2'h3):(1'h0)])});
      reg137 <= $unsigned($signed((~&($signed(reg134) ^ (reg130 ?
          reg131 : wire126)))));
      reg138 <= reg131[(4'hd):(4'ha)];
    end
  assign wire139 = (($unsigned((|$signed(wire127))) ?
                       reg136[(3'h4):(3'h4)] : reg136[(2'h3):(2'h2)]) - (((-wire133[(1'h0):(1'h0)]) > wire127) ?
                       $unsigned($unsigned((wire127 ?
                           (8'hb7) : reg138))) : $unsigned(($unsigned(reg132) ?
                           {reg130} : reg137))));
  assign wire140 = (wire139[(2'h3):(2'h3)] ?
                       (|reg132[(1'h1):(1'h1)]) : {wire126[(4'h8):(1'h1)]});
  assign wire141 = wire127[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg142 <= $unsigned(wire141);
      reg143 <= reg136[(2'h3):(1'h1)];
    end
  assign wire144 = $unsigned($signed($unsigned((wire126[(2'h2):(1'h0)] ?
                       (wire126 ? (8'ha6) : wire139) : ((8'hbb) ?
                           reg131 : wire139)))));
  assign wire145 = reg131[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg146 <= reg131;
      reg147 <= wire141;
      reg148 <= {(({(-wire128), (8'h9c)} ~^ reg138) ?
              ((^~wire126[(3'h6):(1'h0)]) ?
                  $unsigned(wire145) : (-$signed(reg131))) : wire129[(1'h0):(1'h0)]),
          ((((reg143 ? wire144 : wire128) ? reg146 : wire133[(1'h1):(1'h0)]) ?
                  reg147[(3'h4):(2'h2)] : ($unsigned(wire128) <<< wire126[(4'hc):(2'h2)])) ?
              $signed($unsigned((|reg135))) : (wire145[(4'h9):(1'h1)] ?
                  (!(reg146 ~^ reg143)) : (-(reg135 <= reg146))))};
    end
  assign wire149 = $unsigned($signed(((((8'ha8) ?
                           reg130 : reg135) | (!(8'ha0))) ?
                       (wire139 <= $unsigned(wire139)) : ($signed((7'h40)) == (wire127 ?
                           reg137 : reg146)))));
  always
    @(posedge clk) begin
      reg150 <= wire139[(1'h0):(1'h0)];
      reg151 <= $signed((&($signed(wire126) ?
          $unsigned(reg134) : $signed((&reg138)))));
      if ({(wire140[(3'h7):(3'h6)] ^~ reg142)})
        begin
          reg152 <= $unsigned({$signed(reg138),
              ($signed($unsigned(wire126)) != {reg134[(1'h1):(1'h0)]})});
          if ((($signed($unsigned($signed(wire141))) & $signed($signed((wire128 <<< reg142)))) <<< reg130[(3'h5):(2'h2)]))
            begin
              reg153 <= {(reg151[(3'h7):(1'h1)] ?
                      wire139[(1'h1):(1'h0)] : $unsigned(($unsigned(reg137) ?
                          $signed(reg150) : {reg148})))};
            end
          else
            begin
              reg153 <= wire126[(4'hd):(4'hb)];
              reg154 <= $unsigned((~^$signed(((reg131 ?
                  reg131 : reg135) - ((8'hbc) ? wire126 : reg136)))));
              reg155 <= {(&($unsigned($unsigned((8'hb2))) ?
                      wire133 : reg132[(2'h3):(1'h1)]))};
              reg156 <= ((8'ha1) ?
                  {reg143[(2'h2):(1'h0)],
                      (((|wire128) ^ (~^reg130)) >= $signed(reg142[(4'ha):(1'h1)]))} : (~^reg146[(2'h2):(1'h1)]));
            end
          reg157 <= (reg132 ?
              $signed(wire149[(1'h1):(1'h0)]) : ($signed(reg143) ~^ $signed($unsigned((reg156 <= reg146)))));
          reg158 <= (^$signed((((wire133 >>> reg150) > $unsigned((8'ha2))) < ($unsigned(wire149) * (~|reg155)))));
        end
      else
        begin
          reg152 <= $signed(reg157);
          reg153 <= (((8'ha9) <= $unsigned(reg134[(2'h2):(1'h1)])) ~^ (wire139[(2'h2):(1'h0)] ^ (reg150 ?
              $unsigned(reg142[(4'ha):(2'h2)]) : ($signed(reg134) ?
                  reg153 : (wire129 >> reg130)))));
          reg154 <= $unsigned($signed($unsigned({reg154,
              reg153[(1'h0):(1'h0)]})));
        end
      reg159 <= $unsigned((8'hb2));
      reg160 <= ((reg151 ? $unsigned($signed(reg148[(2'h3):(2'h2)])) : reg155) ?
          ($unsigned(($signed(reg135) ?
              $unsigned(wire149) : (reg148 >= wire127))) * reg158) : (~&$unsigned(((reg159 ?
              reg137 : wire127) >> wire140))));
    end
endmodule

module module111  (y, clk, wire116, wire115, wire114, wire113, wire112);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire116;
  input wire signed [(5'h15):(1'h0)] wire115;
  input wire [(5'h13):(1'h0)] wire114;
  input wire [(4'hd):(1'h0)] wire113;
  input wire [(4'hb):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire121;
  wire [(4'hc):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire118;
  wire signed [(5'h10):(1'h0)] wire117;
  assign y = {wire121, wire120, wire119, wire118, wire117, (1'h0)};
  assign wire117 = wire114;
  assign wire118 = (($signed($unsigned(wire114)) ?
                       (wire117 & $signed({wire114,
                           wire112})) : (|{wire113})) >= $unsigned($unsigned({wire115,
                       wire113})));
  assign wire119 = wire117[(3'h4):(1'h0)];
  assign wire120 = $signed($unsigned($unsigned(($unsigned(wire116) != wire112[(3'h5):(3'h5)]))));
  assign wire121 = (($unsigned(wire114) ?
                       $unsigned((wire113[(4'ha):(3'h6)] ?
                           wire115 : ((8'hb5) == wire114))) : (~(-wire112))) || (|$signed(wire120[(4'hc):(3'h5)])));
endmodule

module module80
#(parameter param107 = (^~((|((~(8'hbb)) ? ((8'hb0) - (8'hbb)) : ((7'h43) <<< (8'ha4)))) ? ((((8'hbd) && (8'ha1)) ? (+(8'hb4)) : (8'hb3)) ? ((+(8'ha5)) ? ((7'h44) ? (8'ha3) : (8'hb9)) : {(8'hb2), (8'hb4)}) : (((8'hb7) ? (8'hb7) : (7'h41)) ? {(8'hb5), (8'hbd)} : (~(8'hbb)))) : ({{(8'ha4), (8'hbe)}, (~|(8'had))} >>> {(+(8'haa)), ((8'hb3) >>> (8'hae))}))))
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire85;
  input wire [(4'h8):(1'h0)] wire84;
  input wire [(3'h6):(1'h0)] wire83;
  input wire signed [(3'h6):(1'h0)] wire82;
  input wire signed [(4'ha):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire [(4'h8):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  assign y = {wire106,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire86 = wire84;
  assign wire87 = (((wire85 - wire83) ?
                      ((|(wire86 ?
                          wire84 : wire81)) >> ($unsigned(wire85) + $unsigned((8'hbd)))) : ((|wire85[(3'h7):(1'h0)]) ?
                          (wire83[(3'h5):(1'h1)] ?
                              (wire86 > wire86) : (~&(8'ha3))) : (8'hb7))) & $unsigned(wire84));
  assign wire88 = ({wire81[(4'h9):(3'h5)]} ?
                      (~|wire81) : (!(^$unsigned((^wire82)))));
  assign wire89 = {{(~|wire81)}};
  assign wire90 = wire81;
  assign wire91 = (wire88[(3'h7):(3'h4)] ?
                      $signed(wire84) : $signed((wire85 ?
                          $unsigned($signed(wire89)) : $unsigned((wire81 ~^ wire85)))));
  assign wire92 = ((^~(($signed(wire83) & $signed(wire82)) == ((7'h43) ?
                          {wire89} : $unsigned((8'hbc))))) ?
                      wire84 : wire83);
  always
    @(posedge clk) begin
      reg93 <= wire86[(3'h7):(3'h4)];
      if (wire81)
        begin
          reg94 <= ((-({wire83, $signed((7'h41))} * {(wire82 ?
                  (8'h9e) : wire89)})) <= $signed($unsigned($signed($signed(reg93)))));
          if ((wire90[(2'h2):(1'h1)] == reg94[(3'h4):(1'h0)]))
            begin
              reg95 <= (8'ha4);
              reg96 <= $signed({wire85});
            end
          else
            begin
              reg95 <= $signed(wire84);
              reg96 <= wire81[(4'h8):(2'h2)];
              reg97 <= (($unsigned(wire84[(4'h8):(1'h1)]) ?
                  (~&(^~(wire85 || reg94))) : (^$unsigned((wire82 < wire87)))) != wire82);
            end
          if ($unsigned((($signed(((8'hb4) ?
              wire90 : wire90)) == $signed((~wire85))) && reg93)))
            begin
              reg98 <= $unsigned(wire91);
            end
          else
            begin
              reg98 <= {wire90,
                  $signed(((|((8'hba) ^ wire88)) ?
                      reg93 : $unsigned((wire88 ? reg93 : reg96))))};
              reg99 <= $unsigned($signed(wire88[(4'hb):(4'hb)]));
              reg100 <= ({$signed(((reg95 ?
                      (8'ha5) : reg98) || (^wire83)))} <= (wire86[(3'h6):(1'h1)] ?
                  wire89[(1'h0):(1'h0)] : {(wire85 <= (wire91 < wire81)),
                      ({reg99} ?
                          ((8'hb4) ? wire84 : wire90) : $unsigned(wire89))}));
              reg101 <= reg99;
            end
        end
      else
        begin
          reg94 <= $signed(wire83);
        end
      reg102 <= (~|{((!(wire88 ^ (7'h44))) != ((~&reg94) | $signed(wire82))),
          reg93[(2'h3):(1'h0)]});
      reg103 <= {wire89, $unsigned($unsigned(reg102[(2'h2):(1'h1)]))};
      reg104 <= $signed(reg94[(2'h2):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg105 <= $signed((reg96[(2'h2):(2'h2)] < reg100[(4'ha):(3'h5)]));
    end
  assign wire106 = reg102[(2'h2):(1'h0)];
endmodule

module module17
#(parameter param53 = ({((~|(~^(7'h41))) ? ({(8'hbd), (8'ha9)} && ((7'h44) >= (8'ha8))) : (|(!(8'ha5))))} ? (8'ha4) : ((&(^~((8'hb0) ? (8'ha5) : (8'hbb)))) ~^ (~&((^~(8'hac)) != ((8'ha5) ? (8'haf) : (8'ha9)))))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire21;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
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
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire22 = ($unsigned((wire21[(5'h10):(4'he)] ?
                      $unsigned((|wire19)) : wire18)) || (wire21 < $unsigned(({wire20} * wire21))));
  assign wire23 = $unsigned($unsigned((wire19 ?
                      (wire18[(5'h10):(4'hd)] ?
                          $unsigned(wire22) : {wire22}) : (8'ha1))));
  assign wire24 = (-{($signed(wire21) * wire23[(3'h7):(3'h7)]),
                      (wire20 ?
                          wire22[(1'h1):(1'h1)] : $unsigned(wire21[(4'hf):(4'hb)]))});
  assign wire25 = wire23[(4'h9):(4'h8)];
  assign wire26 = (((((wire25 ? wire18 : wire18) ?
                          wire19[(4'ha):(4'h8)] : wire20[(1'h0):(1'h0)]) ?
                      wire20 : ((8'hb7) + (~^wire22))) - {wire23[(5'h10):(4'hc)]}) - ($unsigned($unsigned($unsigned(wire20))) ?
                      $unsigned((-$signed(wire25))) : wire20));
  always
    @(posedge clk) begin
      reg27 <= $unsigned(((+(&wire19[(5'h10):(4'h8)])) && (wire21 ^ wire24[(4'h9):(3'h4)])));
      reg28 <= (8'hb3);
      reg29 <= ({($signed($signed(wire21)) ?
              ((!wire21) ?
                  $signed(wire21) : $unsigned(wire19)) : ((reg27 ~^ wire26) - wire22))} >> $signed($signed($signed($unsigned(wire18)))));
      reg30 <= (~|wire21);
      reg31 <= $signed($signed(((8'had) << (-(-(8'hb8))))));
    end
  assign wire32 = (-reg30);
  assign wire33 = (((-(8'h9d)) ?
                      $signed(((~^wire20) == (wire18 <= wire21))) : {({reg27} ?
                              $signed((8'hb1)) : reg28)}) | $unsigned($unsigned({$unsigned(wire24)})));
  assign wire34 = (&wire22[(4'hc):(4'hb)]);
  assign wire35 = ({wire22[(3'h6):(2'h2)],
                      {(8'hb1), (8'ha9)}} | $unsigned(((~|$signed(wire24)) ?
                      {{wire19, reg28}, ((8'hbf) ? wire23 : reg28)} : wire20)));
  assign wire36 = ((^~(-$unsigned((wire33 ^ (8'hbd))))) ~^ (wire18 << {wire22[(4'hc):(4'hb)],
                      {$signed(reg31), (!reg28)}}));
  assign wire37 = reg28;
  assign wire38 = (^(&(wire25 ?
                      ($signed(wire18) >>> (&wire25)) : $unsigned(wire32[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg39 <= wire22[(4'hc):(2'h2)];
      if ((^$unsigned($unsigned((&(reg29 ? reg30 : reg31))))))
        begin
          if (wire26[(5'h10):(4'hd)])
            begin
              reg40 <= (~|reg29[(3'h7):(3'h4)]);
              reg41 <= {(wire34[(3'h4):(1'h0)] >> (^~$unsigned(wire25[(3'h6):(3'h6)]))),
                  (~^(((wire35 <= wire25) && $unsigned(wire21)) ?
                      $signed((~(8'ha9))) : $signed((|reg28))))};
              reg42 <= ({reg27[(3'h7):(1'h1)]} >= ($signed(wire22) ?
                  $signed((-$signed((8'ha0)))) : ({(wire34 != (8'hb9))} ?
                      {wire21, wire32} : $signed((reg31 > (8'ha4))))));
              reg43 <= ((~|$unsigned(((+wire35) + $signed(wire19)))) ?
                  $signed((^($signed(reg27) ?
                      wire24[(2'h3):(1'h0)] : (-(7'h42))))) : wire24);
            end
          else
            begin
              reg40 <= wire37;
              reg41 <= $signed((wire22 ?
                  $signed(((reg31 << reg27) ?
                      reg41[(4'hb):(2'h2)] : reg39)) : wire37[(3'h4):(2'h3)]));
              reg42 <= $signed((reg41 <<< wire20[(3'h5):(1'h1)]));
              reg43 <= ($unsigned({wire34}) >> (($signed({wire33}) <<< ({wire24,
                      wire18} ?
                  (~^wire36) : (reg42 ?
                      wire19 : wire19))) ^~ wire36[(4'ha):(4'h9)]));
            end
        end
      else
        begin
          if ($unsigned({{(^(reg30 ? wire32 : wire34)), wire36},
              ({wire20} << $signed($signed(wire32)))}))
            begin
              reg40 <= $unsigned($unsigned($unsigned($unsigned(wire20))));
              reg41 <= wire25[(4'h8):(3'h4)];
              reg42 <= $unsigned(wire32[(2'h2):(2'h2)]);
              reg43 <= (wire35 > (wire25[(1'h0):(1'h0)] ?
                  ($unsigned($signed((8'had))) << {$signed(wire34),
                      (reg43 <<< reg28)}) : ({$signed(wire24)} ?
                      ((wire26 && reg40) ?
                          ((8'haf) ?
                              reg41 : wire33) : $signed(wire34)) : $unsigned((|wire19)))));
            end
          else
            begin
              reg40 <= (wire26 ?
                  (wire18 ?
                      wire20[(1'h1):(1'h0)] : wire22[(4'he):(3'h6)]) : reg43);
              reg41 <= (wire22 - ({wire24[(3'h4):(2'h2)], wire34} ?
                  (-wire35[(4'h8):(2'h2)]) : wire32[(1'h0):(1'h0)]));
              reg42 <= wire19[(4'hb):(2'h3)];
            end
          if ((~|$signed(((~&(^~wire35)) ? wire21 : reg28[(1'h0):(1'h0)]))))
            begin
              reg44 <= wire22[(3'h7):(1'h0)];
            end
          else
            begin
              reg44 <= reg41;
              reg45 <= (reg42 ?
                  ($unsigned($signed((|reg28))) <= (+(~|reg30[(1'h0):(1'h0)]))) : ($signed(wire35[(3'h5):(1'h0)]) || ($unsigned((~&wire36)) ?
                      reg30[(1'h0):(1'h0)] : (~|(+wire37)))));
              reg46 <= ((wire36[(5'h12):(3'h5)] ?
                  ($signed(wire26) ?
                      $unsigned((&(8'hb8))) : $signed((!wire23))) : wire33[(1'h0):(1'h0)]) || wire20[(3'h4):(1'h0)]);
              reg47 <= ((~wire20[(3'h4):(2'h3)]) ?
                  ((reg45 | $unsigned((reg43 ^ wire33))) ^~ (reg42 && wire34[(4'h8):(3'h6)])) : (reg44 ?
                      ($unsigned({wire21,
                          reg31}) ^ (~|reg41[(3'h7):(3'h6)])) : reg27[(3'h4):(1'h0)]));
            end
          reg48 <= reg39;
          reg49 <= $signed(((!reg31) ~^ ((~^reg39) << (|{reg41}))));
        end
    end
  assign wire50 = (reg45 | (&reg44));
  assign wire51 = reg45;
  assign wire52 = ((8'ha1) << $unsigned((($unsigned(wire34) ?
                          (~&wire50) : ((8'hab) ? wire51 : wire35)) ?
                      reg39 : $unsigned((&reg43)))));
endmodule
