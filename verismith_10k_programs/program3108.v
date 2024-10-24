module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire207;
  wire [(3'h6):(1'h0)] wire206;
  wire [(4'hb):(1'h0)] wire205;
  wire [(3'h5):(1'h0)] wire203;
  wire [(4'hd):(1'h0)] wire202;
  wire [(4'h9):(1'h0)] wire201;
  wire signed [(3'h4):(1'h0)] wire200;
  wire signed [(2'h2):(1'h0)] wire199;
  wire signed [(4'hf):(1'h0)] wire198;
  wire signed [(4'hb):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire196;
  reg signed [(3'h5):(1'h0)] reg204 = (1'h0);
  assign y = {wire207,
                 wire206,
                 wire205,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire4,
                 wire196,
                 reg204,
                 (1'h0)};
  assign wire4 = (wire3[(4'ha):(3'h7)] && wire3[(3'h7):(2'h2)]);
  module5 #() modinst197 (wire196, clk, wire4, wire0, wire3, wire1, wire2);
  assign wire198 = $unsigned($unsigned(wire0));
  assign wire199 = wire1;
  assign wire200 = $unsigned({(($signed((8'hb3)) ? wire3 : (8'haf)) ?
                           $signed(wire0[(3'h5):(3'h5)]) : $unsigned((wire0 ?
                               wire4 : wire1)))});
  assign wire201 = {$signed($unsigned(wire198[(1'h0):(1'h0)]))};
  assign wire202 = wire196;
  assign wire203 = wire3[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      reg204 <= $unsigned((($unsigned((^wire0)) ?
              $signed(wire0[(4'hc):(1'h0)]) : (8'ha6)) ?
          ($signed(wire1) <<< wire2[(2'h3):(2'h2)]) : (8'hb6)));
    end
  assign wire205 = (~|$signed({wire196}));
  assign wire206 = wire4;
  assign wire207 = (!$signed((8'hb2)));
endmodule

module module5
#(parameter param195 = ({(((-(8'hb8)) ? ((8'hae) << (8'ha9)) : (!(8'hbd))) ? (|((8'ha3) ^ (8'hbe))) : (((8'ha7) ? (8'hb4) : (8'hb9)) ? ((8'hb7) ? (8'hab) : (8'h9c)) : ((8'haf) ? (8'hb8) : (8'hb3))))} ? (((((7'h44) ? (8'hab) : (8'hb7)) ? ((8'ha4) >>> (8'h9f)) : {(8'hb9), (8'had)}) >= (((8'ha8) <<< (8'hb8)) && ((8'hae) ? (8'had) : (7'h40)))) ? (({(8'hb2), (8'ha4)} ? (^(8'hbc)) : (^~(8'hb2))) ? (((8'ha9) ^~ (8'ha7)) ? ((8'hbc) >> (8'hb8)) : (^(8'hba))) : (&((8'ha6) + (8'hbb)))) : ((-((7'h42) + (8'hb5))) | (((8'ha9) >>> (7'h44)) ? ((8'ha5) ~^ (8'haf)) : {(8'h9c), (7'h40)}))) : (((8'hba) == {{(7'h40)}, {(7'h42)}}) ? {{((8'ha1) >>> (8'hbb))}, (^((7'h41) > (8'hbb)))} : (~((~&(7'h43)) ? ((8'haa) || (8'haf)) : (&(7'h42)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire193;
  wire [(4'hc):(1'h0)] wire163;
  wire [(4'hc):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire43;
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  assign y = {wire193,
                 wire163,
                 wire121,
                 wire120,
                 wire118,
                 wire82,
                 wire81,
                 wire80,
                 wire77,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire45,
                 wire43,
                 reg79,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  module11 #() modinst44 (wire43, clk, wire8, wire10, wire9, wire6);
  assign wire45 = (-((8'hac) ?
                      wire8[(4'h8):(1'h0)] : (-(^~(wire9 ? wire43 : wire8)))));
  always
    @(posedge clk) begin
      if (wire9[(4'h8):(4'h8)])
        begin
          reg46 <= $signed(wire6);
        end
      else
        begin
          reg46 <= (($unsigned($signed(wire43[(1'h0):(1'h0)])) ?
                  $unsigned($unsigned((wire43 ?
                      wire10 : wire10))) : $signed($unsigned(wire45))) ?
              (+reg46[(1'h0):(1'h0)]) : reg46);
        end
      reg47 <= $signed($unsigned((+{{wire7, wire6},
          ((8'ha5) ? wire9 : wire43)})));
      reg48 <= {wire7[(2'h3):(2'h2)],
          (($signed((wire45 >> reg47)) >>> {(wire7 >> reg46)}) > (({wire9} ^~ (wire6 ?
              wire6 : wire6)) || wire10))};
    end
  always
    @(posedge clk) begin
      reg49 <= wire45[(3'h6):(1'h0)];
    end
  assign wire50 = ($unsigned($unsigned({$signed(reg46), {(8'ha5), wire10}})) ?
                      ($unsigned(wire7) >= ((^(^reg49)) & wire43[(4'h9):(1'h0)])) : (|(!reg49[(3'h5):(3'h4)])));
  assign wire51 = ($unsigned((8'h9f)) >>> ($unsigned((|$signed(wire8))) < reg47));
  assign wire52 = (+$signed(($signed((reg47 ^~ wire7)) + reg47)));
  assign wire53 = reg49;
  assign wire54 = ((|(-(8'hac))) | wire51);
  module55 #() modinst78 (wire77, clk, wire51, wire43, wire10, wire52);
  always
    @(posedge clk) begin
      reg79 <= ($unsigned(wire10[(3'h5):(2'h3)]) || $signed($unsigned({(!wire9)})));
    end
  assign wire80 = ($signed((!($signed(reg48) <<< (reg79 ? wire9 : (8'hb3))))) ?
                      wire52 : $signed(({(&wire77), wire7[(1'h1):(1'h1)]} ?
                          $unsigned((&reg79)) : (8'hbd))));
  assign wire81 = wire80;
  assign wire82 = wire80;
  module83 #() modinst119 (wire118, clk, wire82, reg47, wire81, wire7, wire77);
  assign wire120 = (wire9[(3'h6):(3'h5)] ? wire8 : wire9);
  assign wire121 = (-({$unsigned(wire10)} ?
                       ($signed($unsigned((8'ha8))) >> wire82[(3'h4):(2'h3)]) : (^~wire118)));
  module122 #() modinst164 (.wire125(wire6), .wire127(wire51), .wire124(wire7), .wire126(wire9), .clk(clk), .y(wire163), .wire123(reg48));
  module165 #() modinst194 (.wire168(reg49), .wire166(wire120), .clk(clk), .y(wire193), .wire167(wire163), .wire169(reg47));
endmodule

module module165
#(parameter param192 = (8'hb5))
(y, clk, wire169, wire168, wire167, wire166);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire169;
  input wire [(5'h13):(1'h0)] wire168;
  input wire signed [(2'h3):(1'h0)] wire167;
  input wire [(5'h10):(1'h0)] wire166;
  wire [(4'h9):(1'h0)] wire190;
  wire signed [(5'h15):(1'h0)] wire189;
  wire signed [(3'h6):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire187;
  wire [(3'h5):(1'h0)] wire186;
  wire signed [(4'he):(1'h0)] wire185;
  wire [(4'h9):(1'h0)] wire180;
  wire signed [(3'h4):(1'h0)] wire179;
  wire [(3'h7):(1'h0)] wire178;
  wire [(4'hf):(1'h0)] wire177;
  wire [(5'h14):(1'h0)] wire176;
  wire [(2'h2):(1'h0)] wire175;
  wire signed [(5'h10):(1'h0)] wire174;
  wire signed [(4'h8):(1'h0)] wire173;
  wire [(5'h12):(1'h0)] wire172;
  wire signed [(5'h13):(1'h0)] wire171;
  wire [(2'h3):(1'h0)] wire170;
  reg [(4'hd):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg183 = (1'h0);
  reg [(3'h5):(1'h0)] reg182 = (1'h0);
  reg [(5'h10):(1'h0)] reg181 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 reg191,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 (1'h0)};
  assign wire170 = wire168[(4'h8):(3'h4)];
  assign wire171 = $unsigned((+wire167));
  assign wire172 = {wire170[(2'h3):(1'h1)]};
  assign wire173 = $signed((-(($signed(wire166) ?
                       ((8'ha5) * wire171) : (+wire167)) <<< (!(wire172 <<< (8'ha2))))));
  assign wire174 = $signed($unsigned(wire170[(2'h3):(2'h3)]));
  assign wire175 = (~wire173[(3'h6):(3'h5)]);
  assign wire176 = wire168;
  assign wire177 = wire167;
  assign wire178 = (wire173 && ((8'had) ?
                       (((&wire176) & wire175[(1'h0):(1'h0)]) ?
                           (~^{wire170,
                               wire176}) : wire176) : wire176[(3'h4):(2'h3)]));
  assign wire179 = ($signed(wire173) ^ (^wire166));
  assign wire180 = $signed(wire172);
  always
    @(posedge clk) begin
      reg181 <= (~&(|$unsigned((+$unsigned(wire178)))));
      reg182 <= ((~&(wire169[(4'ha):(3'h4)] ?
          $signed($signed(wire169)) : (8'h9c))) <<< reg181[(4'hc):(4'h9)]);
      reg183 <= wire175;
      if (wire175[(1'h1):(1'h0)])
        begin
          reg184 <= wire169[(3'h4):(2'h2)];
        end
      else
        begin
          reg184 <= wire173[(3'h4):(3'h4)];
        end
    end
  assign wire185 = {wire166,
                       $signed((~&$unsigned((reg181 ? wire167 : wire176))))};
  assign wire186 = {wire171};
  assign wire187 = ((^$signed($unsigned({wire171, (8'hb2)}))) ?
                       wire185 : $signed((~&{(wire179 ^~ wire174)})));
  assign wire188 = $signed((~|$signed(((!(8'hab)) + $signed(wire173)))));
  assign wire189 = $unsigned(reg181);
  assign wire190 = $signed((&$unsigned($signed(((8'h9e) >> reg183)))));
  always
    @(posedge clk) begin
      reg191 <= wire170[(1'h0):(1'h0)];
    end
endmodule

module module122
#(parameter param161 = (|(~^((|((8'ha9) ? (8'ha2) : (8'ha9))) ? (8'ha0) : {((8'h9f) ? (8'hb4) : (7'h43)), ((8'h9f) ? (7'h41) : (8'h9f))}))), 
parameter param162 = ((((~&(param161 * param161)) ^~ (8'hb9)) ? param161 : ((|((7'h43) ? param161 : param161)) << ((param161 >= (8'ha7)) ^ ((8'ha1) ? param161 : param161)))) ? param161 : (8'hbc)))
(y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire127;
  input wire signed [(4'hd):(1'h0)] wire126;
  input wire [(5'h14):(1'h0)] wire125;
  input wire signed [(4'h9):(1'h0)] wire124;
  input wire signed [(5'h14):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire160;
  wire signed [(4'ha):(1'h0)] wire159;
  wire signed [(4'ha):(1'h0)] wire158;
  wire signed [(5'h12):(1'h0)] wire157;
  wire signed [(4'ha):(1'h0)] wire156;
  wire [(3'h4):(1'h0)] wire155;
  wire signed [(3'h6):(1'h0)] wire154;
  wire signed [(4'he):(1'h0)] wire153;
  wire signed [(3'h7):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire151;
  wire signed [(3'h6):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire148;
  wire [(2'h3):(1'h0)] wire142;
  wire signed [(3'h4):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire130;
  wire signed [(4'hd):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(5'h15):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(5'h13):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire142,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  assign wire128 = (wire127 ?
                       ($unsigned($signed((&wire125))) ?
                           wire123[(4'he):(4'h9)] : (&{$unsigned(wire127),
                               ((8'ha7) ?
                                   wire126 : wire123)})) : $signed((|wire127)));
  assign wire129 = (((+{$unsigned((7'h43)), $unsigned(wire127)}) ?
                           wire123[(5'h10):(2'h3)] : (wire127 - (wire123[(3'h7):(2'h3)] ?
                               {wire123, (8'hb5)} : wire123[(4'he):(4'he)]))) ?
                       wire128 : (((^(+wire124)) ?
                           ((wire126 && wire126) ?
                               $signed((8'ha7)) : (wire126 + (8'hb4))) : $signed(wire124[(4'h8):(3'h6)])) ^~ wire125[(4'ha):(1'h1)]));
  assign wire130 = $signed(wire124);
  assign wire131 = {((wire124[(3'h5):(1'h0)] + $unsigned($unsigned(wire130))) >>> $unsigned(wire130))};
  assign wire132 = wire126;
  assign wire133 = wire132;
  always
    @(posedge clk) begin
      reg134 <= (wire133 ? wire125[(4'hf):(4'he)] : wire129[(3'h4):(2'h2)]);
      reg135 <= ($unsigned(wire129) == (8'hbb));
    end
  always
    @(posedge clk) begin
      if ($signed({$unsigned(((wire126 == wire124) <= (reg134 ?
              wire127 : wire131))),
          wire125}))
        begin
          if ($unsigned((({wire131[(3'h7):(1'h1)]} >>> $unsigned((wire126 <<< wire131))) ?
              wire131 : {(&(+wire129)),
                  ($unsigned(wire130) ?
                      $unsigned(wire128) : wire128[(2'h2):(1'h0)])})))
            begin
              reg136 <= reg135;
              reg137 <= $unsigned((wire123[(4'hb):(3'h5)] <<< (~|$signed(wire133))));
              reg138 <= (&({$unsigned((~|wire129))} ^ ((reg136[(3'h4):(2'h2)] ?
                  (~|wire130) : (^wire127)) | ($signed(wire132) ?
                  (wire127 | (8'ha2)) : (wire124 ? (8'hbd) : reg136)))));
            end
          else
            begin
              reg136 <= (wire124 ?
                  ($signed($signed(reg138[(5'h14):(4'h8)])) ?
                      wire127[(1'h0):(1'h0)] : (($signed(wire130) ?
                              reg135 : wire125) ?
                          wire133 : $unsigned($signed(reg135)))) : ($signed(wire130) <= wire123));
              reg137 <= $unsigned(wire128);
            end
          reg139 <= wire125;
          reg140 <= wire132;
          reg141 <= (~wire132);
        end
      else
        begin
          reg136 <= $signed(($signed((((8'ha8) <= wire127) < (wire128 ?
              wire131 : reg134))) > $unsigned(wire128[(3'h7):(1'h0)])));
        end
    end
  assign wire142 = $signed(wire127);
  always
    @(posedge clk) begin
      reg143 <= {($signed(wire124) << $signed({{wire131},
              ((8'hb5) >>> wire129)}))};
      reg144 <= (7'h42);
      reg145 <= ((((8'ha7) ?
          $signed(((7'h44) ?
              reg136 : (8'hb4))) : (+(^wire123))) > $unsigned(wire133)) <<< (({{wire142,
                      reg136}} ?
              reg143[(3'h4):(1'h1)] : wire133[(3'h4):(2'h2)]) ?
          (8'hbb) : $unsigned(reg134)));
      reg146 <= {(reg140[(2'h2):(2'h2)] ?
              (reg137[(4'h8):(3'h6)] || ($unsigned(wire131) | reg137)) : $signed((((8'hb2) >= wire128) ^~ (8'h9f))))};
      reg147 <= {reg134[(1'h0):(1'h0)], {reg137[(1'h1):(1'h0)]}};
    end
  assign wire148 = $signed((&$unsigned(wire133[(1'h0):(1'h0)])));
  assign wire149 = reg134;
  assign wire150 = $signed($signed(reg145));
  assign wire151 = $signed($signed(wire142));
  assign wire152 = ({reg141[(4'he):(1'h1)], $unsigned(reg144)} ?
                       ({$signed(reg141[(4'ha):(1'h1)])} ?
                           {(+(-wire130)),
                               $signed($unsigned(wire151))} : (^~{(wire148 == (8'ha6))})) : {$unsigned(wire127)});
  assign wire153 = (wire128 * ($unsigned(((wire150 ~^ reg138) || (wire127 || reg135))) ?
                       $unsigned(wire127[(1'h0):(1'h0)]) : wire133[(1'h1):(1'h1)]));
  assign wire154 = ((~({((8'hbb) << wire149)} ?
                       $unsigned((wire132 ?
                           wire148 : wire133)) : ($unsigned(reg141) ?
                           (8'ha4) : (|wire127)))) ~^ wire142);
  assign wire155 = {($unsigned(((wire142 ^~ wire124) >>> reg145)) ?
                           ((|(&wire132)) << reg137[(4'hf):(4'he)]) : wire150[(3'h5):(1'h1)])};
  assign wire156 = (8'ha0);
  assign wire157 = (~&$unsigned(wire142[(2'h2):(1'h0)]));
  assign wire158 = $unsigned((wire123[(5'h12):(3'h6)] ?
                       reg146 : (reg136[(3'h7):(2'h2)] + (wire152[(1'h0):(1'h0)] || (reg144 == reg144)))));
  assign wire159 = $unsigned(wire157);
  assign wire160 = reg143;
endmodule

module module83
#(parameter param116 = ((({((8'ha4) ? (8'ha1) : (8'ha4)), (8'h9f)} ? (((8'hab) == (8'hba)) ? (~|(8'hb5)) : ((7'h43) + (8'hb7))) : (((8'hac) - (8'ha3)) ? ((8'h9f) ? (8'ha2) : (8'hbc)) : (7'h43))) & (~|(~&((7'h43) ? (8'had) : (7'h44))))) != {({(-(8'haf)), (&(8'h9f))} ? ((8'hb6) + (^~(8'ha6))) : (&((8'hb9) ~^ (8'ha7))))}), 
parameter param117 = ({(8'ha0)} ? param116 : (~|((param116 ? (~|param116) : param116) & ({param116, param116} >= (-(8'ha6)))))))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire88;
  input wire signed [(4'h8):(1'h0)] wire87;
  input wire [(5'h10):(1'h0)] wire86;
  input wire signed [(4'hf):(1'h0)] wire85;
  input wire [(3'h6):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire108;
  wire signed [(3'h6):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire103;
  wire [(5'h15):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire89;
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire95,
                 wire89,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire89 = (~|(wire88 >> (!(~$signed(wire84)))));
  always
    @(posedge clk) begin
      reg90 <= ((8'hbc) != (+(|$signed((wire87 ? wire89 : wire88)))));
      reg91 <= (8'haa);
      reg92 <= wire88[(2'h3):(1'h1)];
      reg93 <= (|$signed({wire88[(2'h2):(1'h1)], (^$signed(reg90))}));
      reg94 <= ($unsigned(wire87[(4'h8):(3'h7)]) <<< (7'h41));
    end
  assign wire95 = (8'ha3);
  always
    @(posedge clk) begin
      if (({(8'hb3)} ? $unsigned(wire84) : wire87[(2'h3):(2'h2)]))
        begin
          reg96 <= (~|((wire86 ?
              $unsigned((8'ha0)) : (^wire85)) && $signed({$unsigned(wire86),
              (wire86 < (7'h42))})));
          reg97 <= $unsigned({$unsigned(reg93), (+{wire85})});
          reg98 <= {$signed(reg92), reg96};
          reg99 <= $unsigned(($unsigned($unsigned(wire95)) ^ (reg94 ?
              (^~(!reg93)) : ((reg90 ? reg92 : reg90) ^ wire84))));
        end
      else
        begin
          reg96 <= reg97;
          reg97 <= (|($unsigned((~$unsigned((8'ha8)))) ?
              wire95 : reg98[(1'h1):(1'h1)]));
          reg98 <= $unsigned(((wire88 ? reg96 : $unsigned($unsigned(wire89))) ?
              ({(^~(8'hb3)), wire84} ?
                  reg98 : reg93[(1'h0):(1'h0)]) : ({((8'hb6) ? reg93 : reg98),
                      $signed(wire85)} ?
                  wire86[(4'hb):(4'h9)] : ($unsigned(reg93) ?
                      (-reg91) : reg94))));
          reg99 <= reg93;
        end
      reg100 <= ($unsigned({$signed((wire86 ? wire84 : wire85)),
          {(wire84 >= (7'h43))}}) <= (wire89 ?
          (|(((8'ha8) < (8'hac)) > wire85[(1'h0):(1'h0)])) : ($signed((|wire88)) + (|(wire84 <= (8'h9f))))));
      reg101 <= $signed(($signed(wire84[(3'h6):(3'h4)]) <= reg91));
    end
  assign wire102 = ($signed((reg94 == (+{reg96, wire86}))) ?
                       $signed(((&(~^reg100)) ?
                           {reg97, reg92[(2'h3):(1'h0)]} : ((~wire85) ?
                               reg96 : {reg91, reg93}))) : reg94);
  assign wire103 = reg100;
  assign wire104 = $unsigned(($unsigned((reg100[(4'ha):(4'h9)] ?
                       ((8'hae) ?
                           wire85 : wire95) : wire87[(1'h0):(1'h0)])) ~^ reg91[(3'h4):(1'h0)]));
  assign wire105 = (reg98 == wire84);
  assign wire106 = ($signed(((((8'ha8) ? reg98 : reg92) | {wire88, wire88}) ?
                           wire86[(4'hb):(4'h9)] : $unsigned(reg92))) ?
                       {((+(^~reg90)) ?
                               reg91[(1'h0):(1'h0)] : reg94[(2'h3):(2'h2)]),
                           reg97} : (!(((wire103 <<< wire85) ?
                               (reg100 ? (8'hae) : reg91) : $signed(wire84)) ?
                           reg96 : reg92)));
  assign wire107 = $unsigned($signed($signed($unsigned((&reg101)))));
  assign wire108 = $unsigned($signed($unsigned($unsigned(wire105[(3'h7):(2'h2)]))));
  assign wire109 = $signed(reg92[(3'h5):(1'h1)]);
  assign wire110 = wire88[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg111 <= wire84;
      reg112 <= reg92;
      reg113 <= reg93;
      reg114 <= (((((reg112 ? reg112 : reg113) ?
                  $unsigned(reg100) : $signed(wire107)) ?
              reg94 : $unsigned(reg90)) && $signed(reg93[(3'h4):(2'h3)])) ?
          (reg96 < (^~$signed((reg111 != wire84)))) : reg90);
      reg115 <= $unsigned(($signed(((-reg99) ~^ $unsigned(wire89))) - (8'ha2)));
    end
endmodule

module module55
#(parameter param75 = ((((((8'hbe) ? (8'hbc) : (8'ha5)) || ((8'ha2) ^~ (8'h9e))) ? (((8'hb5) ? (7'h43) : (7'h42)) + (!(7'h44))) : ((~&(7'h42)) ? (~|(8'ha4)) : ((8'hb3) < (8'ha2)))) << ((8'h9d) ? (|((8'hb5) ~^ (8'ha0))) : (+((8'h9f) - (8'hbb))))) != (-((8'haf) != ({(8'hbf)} ^ ((8'hb9) ? (8'h9d) : (8'hb6)))))), 
parameter param76 = param75)
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire59;
  input wire [(2'h2):(1'h0)] wire58;
  input wire signed [(4'hb):(1'h0)] wire57;
  input wire [(3'h7):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  assign y = {wire74,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
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
                 (1'h0)};
  assign wire60 = $unsigned(wire56);
  assign wire61 = $unsigned(wire59);
  assign wire62 = (~|(wire56[(3'h5):(1'h0)] ~^ wire61));
  assign wire63 = wire62[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire59[(2'h3):(1'h1)])
        begin
          if ((wire62[(1'h1):(1'h0)] ?
              wire57[(3'h4):(1'h1)] : $signed((^~$signed($signed(wire59))))))
            begin
              reg64 <= ($unsigned(({(wire58 >= wire57)} ?
                      (^(~&wire60)) : wire56[(3'h5):(1'h1)])) ?
                  (!$unsigned((~^wire61))) : (($unsigned($unsigned(wire59)) ?
                          $signed(wire57[(3'h7):(3'h7)]) : wire57[(3'h7):(3'h7)]) ?
                      (wire60 + (wire63[(3'h4):(2'h2)] ?
                          $signed((8'hba)) : (8'hb9))) : wire56[(1'h1):(1'h0)]));
              reg65 <= {wire61};
              reg66 <= $signed(($signed(wire62) ?
                  $signed((wire63[(3'h4):(1'h1)] > $unsigned((7'h43)))) : reg64));
              reg67 <= reg66;
            end
          else
            begin
              reg64 <= $unsigned($signed((|(8'ha9))));
              reg65 <= $signed(((^$signed($signed(wire60))) ?
                  $signed(reg65[(4'h9):(3'h4)]) : $signed($unsigned($signed(wire57)))));
              reg66 <= $unsigned((($signed($unsigned((8'hb0))) ?
                  ($signed(wire59) & (wire63 + wire62)) : {(wire59 ?
                          wire62 : wire56),
                      wire61}) + $signed((^~$unsigned(reg67)))));
              reg67 <= {$unsigned(wire59), $unsigned(wire63)};
              reg68 <= (wire57[(3'h6):(1'h0)] > reg66[(4'hd):(4'h8)]);
            end
          reg69 <= ($unsigned({$signed(reg64)}) ?
              wire59[(3'h4):(1'h1)] : $unsigned(((|reg67) ?
                  ({wire62,
                      wire63} < reg66) : ((~^(8'hb5)) < (wire56 < reg65)))));
          reg70 <= $unsigned({$signed((reg66[(3'h4):(2'h3)] ?
                  wire60 : ((7'h41) <= reg65))),
              ((reg65[(2'h3):(1'h1)] && (wire61 ?
                  reg67 : reg64)) && ((&reg64) ^ (8'hb8)))});
          reg71 <= $signed($signed(wire58));
        end
      else
        begin
          reg64 <= (!((((reg64 <= wire63) + reg64[(4'he):(2'h3)]) >> $signed($signed(wire56))) ?
              (|((!wire57) ?
                  $signed(reg66) : $signed(reg68))) : (~|wire59[(3'h5):(3'h4)])));
          reg65 <= reg67;
          reg66 <= wire57;
          reg67 <= reg68;
        end
      reg72 <= wire62;
      reg73 <= wire58;
    end
  assign wire74 = $unsigned($signed((+(^~(~^wire60)))));
endmodule

module module11
#(parameter param42 = (^((+({(8'hb4), (8'ha9)} ? {(8'hab)} : ((7'h41) ? (8'ha0) : (8'hb5)))) + (~((~|(8'hb1)) - (~|(7'h43)))))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire17,
                 wire16,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire16 = (|wire14[(4'h8):(3'h5)]);
  assign wire17 = wire12;
  always
    @(posedge clk) begin
      if ($unsigned((wire15[(4'h9):(1'h0)] != $unsigned($signed(wire15[(4'he):(2'h3)])))))
        begin
          reg18 <= $unsigned((&wire13));
          reg19 <= ($unsigned((((wire12 ? wire14 : reg18) ?
                  (wire13 ? wire13 : wire14) : wire14) ?
              wire15[(3'h4):(1'h1)] : ($signed(reg18) >> $signed(wire17)))) + {(!$unsigned((+(8'hb7)))),
              reg18});
          reg20 <= wire17[(2'h2):(1'h1)];
        end
      else
        begin
          if ($signed($unsigned($signed((&(^~wire15))))))
            begin
              reg18 <= wire12;
              reg19 <= {(!{(wire16[(4'he):(4'he)] < (8'hb8)),
                      $unsigned($unsigned(wire16))}),
                  wire17[(4'h9):(3'h6)]};
            end
          else
            begin
              reg18 <= ($signed(((wire15[(5'h10):(4'hf)] != $unsigned(reg19)) < wire17[(2'h3):(2'h2)])) ?
                  wire12 : ($signed($signed(wire17[(1'h0):(1'h0)])) + $signed(wire15)));
              reg19 <= reg20;
              reg20 <= $signed(wire13[(3'h4):(3'h4)]);
              reg21 <= $unsigned(reg19);
            end
        end
      reg22 <= ({wire12,
              ($signed(wire12) == ({(8'hb4)} ? $signed(reg20) : (^reg19)))} ?
          wire13 : $unsigned((8'hab)));
      reg23 <= (+(~{wire13[(3'h4):(1'h1)], $signed((~^(7'h41)))}));
      reg24 <= wire14;
      reg25 <= {($unsigned(reg21[(5'h10):(3'h6)]) != (($signed((8'hbf)) ?
              $unsigned(reg19) : (wire15 ?
                  wire13 : wire17)) && ((^~reg20) <= (&reg21)))),
          (reg23[(4'hc):(1'h0)] ? reg24 : wire13)};
    end
  assign wire26 = (7'h40);
  assign wire27 = ($signed(reg22[(4'hd):(4'hb)]) | wire26[(1'h0):(1'h0)]);
  assign wire28 = $unsigned($unsigned($unsigned((wire14[(1'h0):(1'h0)] ~^ $signed(reg20)))));
  assign wire29 = $unsigned((~(wire14 ?
                      (-$signed(wire16)) : (reg21 == wire15[(4'hd):(4'ha)]))));
  assign wire30 = reg20;
  assign wire31 = $signed(($unsigned(((8'hb7) ?
                          $unsigned(reg21) : $unsigned((8'ha4)))) ?
                      ($signed($unsigned((8'hb4))) <= $unsigned($unsigned(wire29))) : (8'hba)));
  assign wire32 = (($signed(reg18) ?
                      $unsigned((-((8'ha8) ?
                          wire27 : reg19))) : (wire13[(1'h1):(1'h1)] || reg19)) ^ wire30);
  always
    @(posedge clk) begin
      reg33 <= $unsigned(reg21[(5'h12):(4'he)]);
      reg34 <= wire30[(1'h0):(1'h0)];
      reg35 <= wire12[(3'h4):(3'h4)];
      reg36 <= (reg35[(3'h7):(1'h1)] ?
          $signed((((&wire28) == (reg22 ? (8'haf) : reg20)) ?
              (reg18[(1'h1):(1'h0)] ?
                  reg19[(4'hd):(3'h7)] : {reg22,
                      (7'h42)}) : {(~^wire13)})) : (wire17 == $unsigned($signed((^~wire12)))));
      reg37 <= {wire32[(2'h2):(2'h2)],
          $unsigned((wire29 == ($signed(wire31) || $signed(wire12))))};
    end
  always
    @(posedge clk) begin
      reg38 <= wire17;
    end
  assign wire39 = $unsigned((reg22[(4'ha):(3'h4)] <= $unsigned($unsigned(reg37[(4'h8):(3'h4)]))));
  assign wire40 = reg20[(5'h14):(4'hc)];
  assign wire41 = (((((~|wire27) < $signed(wire13)) != (|(reg38 != (8'hba)))) * $signed(reg18[(2'h3):(1'h0)])) ?
                      {(&reg25),
                          $signed($unsigned((wire17 ?
                              wire13 : wire31)))} : {((^$signed(reg22)) ?
                              wire39 : $unsigned($signed(reg34)))});
endmodule
