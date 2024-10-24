module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire232;
  wire signed [(4'h9):(1'h0)] wire223;
  wire [(4'h9):(1'h0)] wire222;
  wire [(5'h10):(1'h0)] wire221;
  wire signed [(5'h10):(1'h0)] wire220;
  wire signed [(5'h13):(1'h0)] wire219;
  wire [(5'h13):(1'h0)] wire218;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire153;
  wire signed [(5'h12):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire155;
  wire signed [(5'h14):(1'h0)] wire156;
  wire signed [(5'h10):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire158;
  wire [(5'h10):(1'h0)] wire216;
  reg [(4'hd):(1'h0)] reg233 = (1'h0);
  reg [(5'h11):(1'h0)] reg231 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg230 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg229 = (1'h0);
  reg [(4'h9):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg226 = (1'h0);
  reg [(4'h8):(1'h0)] reg225 = (1'h0);
  reg [(4'hb):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire232,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire5,
                 wire7,
                 wire151,
                 wire153,
                 wire154,
                 wire155,
                 wire156,
                 wire157,
                 wire158,
                 wire216,
                 reg233,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg6,
                 (1'h0)};
  assign wire5 = ((((wire1 ?
                         $signed(wire1) : (^~wire0)) + wire1[(3'h7):(3'h6)]) ?
                     ($signed((~|wire2)) > $signed((wire2 ?
                         wire3 : wire0))) : ($unsigned($signed(wire0)) > ({(8'hb1),
                         wire0} <= (~wire0)))) - ((^~((wire0 ?
                         wire1 : wire0) < $signed(wire0))) ?
                     (~&wire2[(4'he):(4'hd)]) : (($unsigned(wire3) | ((8'hb4) ?
                         wire0 : wire1)) - ($signed(wire0) ?
                         wire2 : $unsigned(wire1)))));
  always
    @(posedge clk) begin
      reg6 <= (^wire0);
    end
  assign wire7 = $unsigned(((8'hb1) <= $signed(wire1[(4'hb):(1'h1)])));
  module8 #() modinst152 (.wire12(wire5), .y(wire151), .clk(clk), .wire10(wire3), .wire11(wire0), .wire9(wire7));
  assign wire153 = $signed(reg6[(3'h6):(3'h6)]);
  assign wire154 = ((((wire5 >> $signed(wire5)) ?
                       {wire2[(3'h4):(1'h1)],
                           wire1[(3'h7):(3'h7)]} : wire4) | (((wire3 ?
                               wire5 : wire4) ?
                           wire0[(5'h11):(4'hb)] : {wire153, wire2}) ?
                       (&(wire153 << (8'h9f))) : wire151)) ~^ $unsigned(({{wire5}} ?
                       $signed($unsigned(wire151)) : ((wire3 <<< (7'h41)) ?
                           reg6[(1'h0):(1'h0)] : wire4))));
  assign wire155 = wire153;
  assign wire156 = $signed($signed($signed(((wire4 ? reg6 : wire1) ?
                       (~&wire0) : (!wire4)))));
  assign wire157 = wire7[(4'he):(4'hc)];
  assign wire158 = (((wire2 < $unsigned(wire153)) | $unsigned(($unsigned(wire156) & (wire156 ?
                       wire156 : wire154)))) >>> (^~$unsigned(({wire4} + wire156))));
  module159 #() modinst217 (.wire161(wire3), .y(wire216), .wire160(wire155), .wire163(wire158), .wire164(wire151), .wire162(wire153), .clk(clk));
  assign wire218 = wire0[(5'h11):(3'h7)];
  assign wire219 = (^(+wire153));
  assign wire220 = (wire156[(4'he):(4'hd)] ?
                       ((8'hbc) - $signed(wire5[(4'hc):(1'h0)])) : $unsigned($unsigned(wire158)));
  assign wire221 = $unsigned({($unsigned(wire5) ?
                           wire153[(5'h13):(5'h13)] : $signed($unsigned(wire1))),
                       (-$unsigned($signed(wire151)))});
  assign wire222 = $signed(wire154[(5'h12):(4'h9)]);
  assign wire223 = $signed($unsigned(wire1[(4'h8):(1'h1)]));
  always
    @(posedge clk) begin
      reg224 <= {{wire218, wire4}};
      reg225 <= (~|$signed((($signed(wire222) ?
          (~wire158) : (~wire3)) && wire216[(2'h3):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg226 <= ((($unsigned($signed((8'hb6))) || (((8'hbe) <= (8'hb3)) ?
          $signed((7'h42)) : wire219[(3'h7):(2'h3)])) << ($unsigned((~^wire223)) < $unsigned({wire156}))) == wire151);
      if ((^~$unsigned($unsigned(wire219))))
        begin
          reg227 <= wire154;
          reg228 <= reg225[(3'h4):(1'h0)];
          reg229 <= $unsigned({($signed((wire7 * wire0)) <= wire3[(5'h12):(3'h7)])});
          reg230 <= (~({reg226[(1'h0):(1'h0)]} ?
              ((8'ha8) * wire154[(1'h1):(1'h0)]) : $signed((~&reg226[(2'h3):(1'h1)]))));
          reg231 <= ((~^wire4) ?
              $signed(wire157) : {($signed(wire7[(4'ha):(4'ha)]) - wire1[(3'h6):(2'h3)])});
        end
      else
        begin
          reg227 <= (7'h42);
          reg228 <= $unsigned(wire151);
        end
    end
  assign wire232 = ((8'hb9) << (((~^(reg224 ^~ wire0)) ?
                           ($unsigned((8'hb3)) ?
                               {wire223,
                                   reg226} : ((8'had) & wire216)) : ((reg224 ?
                                   wire218 : reg231) ?
                               (^~(8'ha8)) : $unsigned((7'h43)))) ?
                       ((&$signed(reg225)) & wire151) : $signed(((reg230 ^~ wire157) > (reg224 ?
                           wire220 : wire156)))));
  always
    @(posedge clk) begin
      reg233 <= $unsigned(wire155);
    end
endmodule

module module159
#(parameter param214 = {{(((~^(7'h42)) ? {(8'hbb), (8'hbe)} : ((7'h42) ? (8'ha9) : (8'h9f))) ? ({(8'hac)} <= ((8'hab) ? (7'h41) : (8'had))) : (+((8'had) * (8'hba)))), ({((7'h42) | (8'hba)), ((8'ha9) ~^ (8'ha5))} | (((8'ha1) != (7'h42)) && {(8'ha9)}))}, (~((-(-(8'ha8))) << (7'h41)))}, 
parameter param215 = (param214 ? (~(~((-param214) ^ (~^(8'h9d))))) : (7'h40)))
(y, clk, wire164, wire163, wire162, wire161, wire160);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire164;
  input wire signed [(5'h11):(1'h0)] wire163;
  input wire [(5'h13):(1'h0)] wire162;
  input wire signed [(4'hb):(1'h0)] wire161;
  input wire [(3'h6):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire213;
  wire [(4'hd):(1'h0)] wire212;
  wire [(4'ha):(1'h0)] wire211;
  wire signed [(2'h3):(1'h0)] wire210;
  wire signed [(4'hb):(1'h0)] wire202;
  wire signed [(4'hd):(1'h0)] wire201;
  wire [(4'hb):(1'h0)] wire200;
  wire [(4'h8):(1'h0)] wire188;
  wire [(2'h3):(1'h0)] wire186;
  wire signed [(4'h9):(1'h0)] wire166;
  wire [(4'h8):(1'h0)] wire165;
  reg signed [(4'h9):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg207 = (1'h0);
  reg [(3'h7):(1'h0)] reg206 = (1'h0);
  reg [(4'h8):(1'h0)] reg205 = (1'h0);
  reg [(2'h2):(1'h0)] reg204 = (1'h0);
  reg [(3'h7):(1'h0)] reg203 = (1'h0);
  reg [(5'h11):(1'h0)] reg199 = (1'h0);
  reg [(5'h14):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg197 = (1'h0);
  reg [(4'ha):(1'h0)] reg196 = (1'h0);
  reg [(5'h11):(1'h0)] reg195 = (1'h0);
  reg [(4'hb):(1'h0)] reg194 = (1'h0);
  reg [(5'h12):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg192 = (1'h0);
  reg [(3'h7):(1'h0)] reg191 = (1'h0);
  reg [(4'hf):(1'h0)] reg190 = (1'h0);
  reg [(4'h8):(1'h0)] reg189 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire202,
                 wire201,
                 wire200,
                 wire188,
                 wire186,
                 wire166,
                 wire165,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 (1'h0)};
  assign wire165 = $signed(wire164);
  assign wire166 = $unsigned($unsigned($signed(wire160[(1'h0):(1'h0)])));
  module167 #() modinst187 (.clk(clk), .wire168(wire161), .wire169(wire160), .y(wire186), .wire170(wire165), .wire171(wire163));
  assign wire188 = $unsigned(wire166[(4'h8):(1'h0)]);
  always
    @(posedge clk) begin
      reg189 <= $signed(wire186[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if (wire163[(3'h4):(1'h0)])
        begin
          reg190 <= $unsigned($signed(reg189));
        end
      else
        begin
          reg190 <= (((wire162[(4'h9):(1'h1)] ?
                  wire163[(2'h3):(1'h0)] : {wire160}) ?
              $unsigned((wire186 ?
                  (wire163 ?
                      reg190 : wire162) : wire166[(3'h6):(2'h3)])) : wire160[(2'h2):(2'h2)]) ~^ ((8'h9d) <<< (&{(wire188 ?
                  reg189 : wire165),
              (wire188 <<< wire165)})));
          reg191 <= wire160[(1'h1):(1'h0)];
          if ($signed(wire161[(3'h7):(3'h6)]))
            begin
              reg192 <= (-wire163[(5'h11):(2'h2)]);
              reg193 <= $unsigned((!$signed((^$signed(reg190)))));
            end
          else
            begin
              reg192 <= reg193;
              reg193 <= $unsigned((~|reg192[(2'h2):(1'h1)]));
              reg194 <= wire188[(3'h7):(2'h3)];
              reg195 <= $unsigned(({{{reg189, (8'ha3)},
                          (reg190 ? reg194 : reg192)}} ?
                  reg189[(1'h1):(1'h1)] : ($signed((wire164 ?
                          wire161 : wire163)) ?
                      (wire163[(3'h5):(1'h0)] > (reg190 ?
                          reg191 : reg194)) : (!reg194))));
              reg196 <= $signed(wire164[(2'h2):(1'h0)]);
            end
          reg197 <= {(!$signed(reg194[(4'h9):(2'h3)]))};
        end
      reg198 <= $signed(((^~reg195[(3'h4):(2'h3)]) | reg195[(4'h8):(1'h1)]));
      reg199 <= ((reg197[(3'h5):(3'h4)] ?
              $unsigned(((~^(8'ha3)) - (-(8'hb5)))) : $signed((^reg198[(4'ha):(2'h2)]))) ?
          (((~|$unsigned(reg196)) >> $signed(wire165[(2'h2):(2'h2)])) ^ (!(~&(^~(8'hbc))))) : (reg195 ?
              $signed(wire165[(3'h7):(3'h6)]) : reg197));
    end
  assign wire200 = wire165[(3'h5):(1'h1)];
  assign wire201 = $unsigned(wire166[(3'h4):(3'h4)]);
  assign wire202 = {(reg193 ^~ ($unsigned($signed(wire165)) ?
                           {{wire200, wire166}, (&wire200)} : (~&(reg193 ?
                               reg196 : wire166))))};
  always
    @(posedge clk) begin
      if ((~{(^~$unsigned((|reg194))),
          (((wire200 >= wire202) ?
                  (wire165 << wire166) : reg198[(5'h10):(3'h7)]) ?
              ($unsigned(reg198) | (reg199 ^ wire164)) : (~(8'ha7)))}))
        begin
          if ((((reg193 ?
                  {(wire161 && reg194)} : $unsigned(wire201)) == reg199) ?
              ($signed(($unsigned(wire163) <= ((8'hbf) & reg199))) ?
                  ($signed(((7'h42) ^ (8'hab))) * (7'h42)) : wire163[(4'hf):(4'hc)]) : wire200[(3'h6):(3'h4)]))
            begin
              reg203 <= $signed($unsigned((~^wire188[(1'h1):(1'h1)])));
            end
          else
            begin
              reg203 <= (wire164 ?
                  reg198[(3'h7):(3'h7)] : {($signed((reg191 && reg193)) ?
                          $signed((wire200 ?
                              wire202 : (7'h41))) : ($signed(wire161) ?
                              reg203[(3'h4):(1'h1)] : (wire160 ^~ wire200)))});
              reg204 <= (((wire166 ?
                          (((8'hb7) << wire166) ?
                              reg190[(4'h9):(3'h4)] : (+wire164)) : ((reg197 * (7'h42)) ~^ (wire160 == reg199))) ?
                      wire201[(4'hd):(2'h2)] : $unsigned((~|reg192[(1'h0):(1'h0)]))) ?
                  (reg191[(3'h7):(2'h2)] ?
                      $signed($signed($signed(wire165))) : reg190) : ($signed($signed((7'h42))) - ($signed(wire163[(5'h10):(2'h3)]) ?
                      reg198[(5'h11):(4'he)] : (-reg193))));
              reg205 <= (reg194 ?
                  $unsigned($signed(reg194)) : wire165[(3'h7):(1'h0)]);
            end
          reg206 <= $signed(reg195);
        end
      else
        begin
          if ((reg190 && wire164))
            begin
              reg203 <= (~|((reg204 ?
                  (~&(!reg195)) : reg203) - $unsigned(reg192)));
              reg204 <= reg206;
              reg205 <= $signed((!reg197[(3'h4):(2'h3)]));
              reg206 <= (wire200 ?
                  $unsigned(($unsigned(reg195) << $signed($unsigned(reg194)))) : ($unsigned($unsigned(reg196)) && (8'hac)));
              reg207 <= $signed((+(($unsigned(reg190) ?
                  (~^reg189) : $unsigned(reg196)) << reg198[(4'he):(4'hc)])));
            end
          else
            begin
              reg203 <= (reg192[(1'h1):(1'h0)] >> wire201[(4'h9):(2'h3)]);
              reg204 <= ((($unsigned(wire200[(4'h8):(3'h4)]) ^~ {(~&wire186)}) ?
                  (wire161[(4'h9):(1'h0)] & ($unsigned(reg204) ?
                      (reg206 > (8'ha7)) : reg198[(4'ha):(4'ha)])) : $signed({$unsigned(reg194),
                      $signed(reg205)})) - (~|$signed((|$signed(wire186)))));
              reg205 <= (~^$signed((8'hac)));
              reg206 <= wire188[(3'h4):(1'h0)];
              reg207 <= ($unsigned((~&$signed((!wire161)))) ?
                  ((~&$unsigned((reg190 ?
                      reg206 : reg191))) >>> $signed({reg191,
                      reg198})) : ({reg192, $signed($unsigned(wire201))} ?
                      ($signed(reg193) > wire201[(4'hc):(3'h7)]) : (+reg203)));
            end
          reg208 <= $signed((8'ha2));
          reg209 <= $signed((~|$signed({{reg196}})));
        end
    end
  assign wire210 = reg205;
  assign wire211 = (-$signed((-wire160[(3'h4):(2'h3)])));
  assign wire212 = (!$unsigned(wire162));
  assign wire213 = (~|wire188[(2'h2):(1'h1)]);
endmodule

module module8
#(parameter param149 = (8'ha6), 
parameter param150 = (-((((param149 ? param149 : param149) && (|param149)) ? ({(8'hbd), param149} < (^~param149)) : {param149}) ? ((~(param149 ? param149 : param149)) ? ((~|param149) ? {(7'h44)} : (param149 >= param149)) : param149) : param149)))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h19a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire148;
  wire signed [(4'hb):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire146;
  wire signed [(3'h7):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire127;
  wire [(4'hf):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire97;
  wire signed [(4'hf):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire125;
  reg [(3'h6):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg132 = (1'h0);
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire13,
                 wire90,
                 wire92,
                 wire97,
                 wire98,
                 wire99,
                 wire111,
                 wire125,
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
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 (1'h0)};
  assign wire13 = wire10[(3'h5):(1'h1)];
  module14 #() modinst91 (.y(wire90), .wire17(wire13), .clk(clk), .wire16(wire9), .wire15(wire11), .wire18(wire10));
  assign wire92 = (~^(+$signed($signed(wire13[(3'h5):(1'h1)]))));
  always
    @(posedge clk) begin
      reg93 <= ($unsigned(($signed($signed((8'ha4))) ?
          $signed({wire90, wire12}) : ($signed(wire90) ?
              wire12 : wire12[(2'h3):(2'h2)]))) | (7'h42));
      reg94 <= (((~|wire92[(4'hb):(4'h9)]) << wire12) ?
          (((((8'h9e) != wire10) ? (^~wire11) : wire90) ?
              (8'h9d) : wire90[(2'h2):(2'h2)]) <= (~($signed(wire10) << $signed(wire13)))) : wire11);
      reg95 <= $signed({(!((wire13 && wire92) ^ $unsigned(wire10)))});
      reg96 <= reg93;
    end
  assign wire97 = ($unsigned((-reg93)) - ({wire10,
                      wire9[(2'h2):(1'h0)]} > {$unsigned(reg94)}));
  assign wire98 = ($signed($unsigned(($unsigned(wire92) ?
                          ((8'ha0) ?
                              wire97 : reg94) : wire97[(4'h8):(4'h8)]))) ?
                      reg93 : $unsigned(wire90));
  assign wire99 = ({wire11[(1'h1):(1'h0)]} * (({(!reg96),
                      (~|wire92)} << $unsigned(wire13[(4'ha):(3'h5)])) || $unsigned((~^$unsigned(wire9)))));
  module100 #() modinst112 (wire111, clk, wire9, wire11, wire90, wire92);
  module113 #() modinst126 (.wire116(wire9), .wire115(wire98), .wire114(wire99), .clk(clk), .y(wire125), .wire117(reg95));
  assign wire127 = wire13;
  assign wire128 = (((reg94[(4'hb):(3'h7)] ?
                           $signed(wire13) : ((wire92 << wire97) ?
                               (wire111 ?
                                   wire13 : wire9) : $unsigned(wire97))) ?
                       $unsigned(wire12[(4'he):(4'h9)]) : $signed(reg96[(2'h3):(1'h1)])) << ({((^~wire9) ?
                           wire13[(1'h0):(1'h0)] : (wire125 ?
                               wire125 : wire90))} * (wire12[(4'hb):(3'h7)] ?
                       wire13 : {(reg95 | reg93), {(8'hbd)}})));
  assign wire129 = {{$unsigned($signed($signed(wire98))),
                           $signed($signed((^wire127)))}};
  assign wire130 = wire125;
  always
    @(posedge clk) begin
      reg131 <= $signed($signed($signed(wire128)));
      reg132 <= ((($unsigned($signed(reg93)) < (-(|wire127))) ?
              (reg96[(1'h1):(1'h1)] ?
                  wire129 : $unsigned(wire9)) : $unsigned($signed((wire111 < wire97)))) ?
          (wire130[(1'h0):(1'h0)] ?
              reg95[(4'hd):(2'h3)] : wire125[(1'h1):(1'h1)]) : wire12[(5'h10):(4'hf)]);
      if ((wire12 ?
          (($signed($unsigned(wire127)) <<< (~|wire99[(5'h10):(3'h5)])) != (wire11 ?
              $unsigned((wire129 <= reg95)) : $signed((wire111 ?
                  reg94 : (8'ha4))))) : (~&$signed(((wire12 <<< reg93) >>> wire9[(5'h13):(5'h13)])))))
        begin
          reg133 <= ({(wire98[(1'h1):(1'h0)] <<< ((reg96 ?
                      (8'ha4) : wire129) ^~ wire92)),
                  wire12} ?
              (^($signed(wire125[(4'he):(1'h0)]) ?
                  {$unsigned((8'ha8)),
                      (wire111 && wire10)} : wire130[(2'h3):(1'h1)])) : $unsigned((8'ha2)));
        end
      else
        begin
          reg133 <= (~^(~($signed((wire111 > wire97)) ?
              $unsigned((reg93 << reg96)) : $signed($unsigned(wire97)))));
          reg134 <= reg133;
          reg135 <= reg131[(3'h6):(2'h3)];
          reg136 <= (-wire111[(4'hd):(3'h5)]);
        end
      reg137 <= $unsigned((^wire90[(5'h10):(5'h10)]));
      reg138 <= ((|(wire97 ?
          (+(~&wire92)) : ((reg96 <= reg132) ^~ reg93))) >= $signed(reg95[(3'h5):(3'h4)]));
    end
  always
    @(posedge clk) begin
      reg139 <= {($unsigned(((+wire98) && (wire9 ?
              reg131 : wire128))) <<< $unsigned(wire12))};
      reg140 <= reg137;
      reg141 <= $unsigned($unsigned(($unsigned((reg136 << wire99)) ?
          ((reg132 <<< reg138) == wire10) : wire9)));
      reg142 <= wire128[(4'hc):(1'h0)];
      if ((~&((8'hb9) > $signed(($signed(reg133) ? (^wire10) : reg96)))))
        begin
          reg143 <= reg135;
        end
      else
        begin
          reg143 <= {({(wire92 ?
                      (wire92 << reg141) : (wire12 ? (8'hab) : wire128)),
                  $signed((reg131 ?
                      reg139 : reg96))} >= (((^reg141) ~^ $unsigned(reg141)) <<< ($signed(wire128) ^~ reg131[(1'h1):(1'h1)]))),
              wire97};
          reg144 <= reg132[(5'h13):(1'h0)];
          reg145 <= wire99;
        end
    end
  assign wire146 = $signed((((wire92 ?
                               $signed(reg133) : (reg135 ? reg132 : (7'h44))) ?
                           {(+reg143)} : $signed((wire129 ?
                               wire12 : (8'hba)))) ?
                       (8'hbf) : (($signed(wire130) == reg145[(1'h0):(1'h0)]) ?
                           (!((8'hae) >> (8'hb5))) : $signed($signed(wire97)))));
  assign wire147 = wire13[(4'hd):(4'hb)];
  assign wire148 = reg96[(2'h3):(1'h1)];
endmodule

module module113  (y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire117;
  input wire signed [(3'h4):(1'h0)] wire116;
  input wire [(4'ha):(1'h0)] wire115;
  input wire signed [(4'hf):(1'h0)] wire114;
  wire signed [(2'h3):(1'h0)] wire124;
  wire signed [(2'h2):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire118;
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire118,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire118 = wire117;
  always
    @(posedge clk) begin
      reg119 <= $unsigned($unsigned(wire114[(1'h0):(1'h0)]));
      reg120 <= (wire117 ? (^$unsigned((+wire115))) : wire117);
      reg121 <= $unsigned($unsigned($unsigned(($unsigned(wire116) ?
          (wire116 ? reg119 : reg120) : wire115))));
    end
  assign wire122 = $signed($unsigned($signed($signed(reg119[(4'h9):(1'h1)]))));
  assign wire123 = (!$signed((($unsigned(reg121) ?
                           wire116[(1'h1):(1'h1)] : wire115[(3'h6):(2'h2)]) ?
                       wire114 : (+$signed(wire118)))));
  assign wire124 = wire118;
endmodule

module module100  (y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire104;
  input wire signed [(3'h7):(1'h0)] wire103;
  input wire [(5'h14):(1'h0)] wire102;
  input wire signed [(3'h7):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  assign y = {wire110, wire106, wire105, reg109, reg108, reg107, (1'h0)};
  assign wire105 = $unsigned(wire102);
  assign wire106 = wire105[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg107 <= ((|wire102) | (wire105[(1'h1):(1'h1)] >= wire103));
      reg108 <= $unsigned({$signed(wire101[(3'h7):(2'h2)])});
      reg109 <= wire101;
    end
  assign wire110 = (reg108 ?
                       $unsigned((((+wire105) ?
                           (wire101 << wire103) : reg108[(1'h1):(1'h0)]) && wire106)) : $unsigned($unsigned(wire102[(2'h2):(2'h2)])));
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h307):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire [(4'hc):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  assign y = {wire89,
                 wire84,
                 wire82,
                 wire81,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire30,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg83,
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
                 reg65,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
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
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire19 = ((8'hb0) + ($unsigned(((wire18 ?
                      wire16 : wire17) > wire15)) || $unsigned(wire15)));
  assign wire20 = wire15[(4'h9):(3'h5)];
  assign wire21 = (((~^$signed((wire20 ?
                          (8'had) : (8'hb1)))) <= wire16[(3'h6):(3'h6)]) ?
                      {$unsigned(wire16[(4'hb):(3'h4)]),
                          wire16[(4'h8):(3'h7)]} : $signed((((wire19 >>> wire18) ?
                          (~&wire17) : (wire16 <<< wire20)) << wire20[(4'h9):(4'h8)])));
  assign wire22 = wire19[(4'hc):(4'h9)];
  assign wire23 = $unsigned($signed((~^{(wire15 ? (8'hbc) : wire19)})));
  assign wire24 = (~^(^((8'ha7) ?
                      (wire17[(2'h2):(1'h0)] ?
                          ((8'ha8) ? wire21 : wire23) : wire16) : ((wire23 ?
                              wire23 : wire20) ?
                          wire16 : (~|(8'hbf))))));
  always
    @(posedge clk) begin
      reg25 <= wire19[(3'h7):(3'h7)];
      reg26 <= $unsigned($unsigned((8'had)));
      reg27 <= (8'ha0);
      reg28 <= wire23[(2'h2):(2'h2)];
      reg29 <= (((~^$unsigned(wire19[(4'ha):(4'h9)])) ?
          $unsigned((!(8'hb0))) : wire18) + $signed(($unsigned(wire23[(1'h0):(1'h0)]) <= $signed((|reg27)))));
    end
  assign wire30 = $signed({wire19,
                      ({wire17[(4'h8):(1'h1)], $unsigned(reg27)} ?
                          $unsigned(wire15[(2'h3):(2'h2)]) : (reg27 ?
                              $unsigned(wire17) : {wire15}))});
  always
    @(posedge clk) begin
      if ($signed($signed(($signed((^wire17)) ?
          $signed({wire18}) : ((+wire19) << wire19)))))
        begin
          reg31 <= wire16;
        end
      else
        begin
          reg31 <= ((~|wire16[(4'h9):(1'h0)]) ?
              $unsigned($signed((+$signed(wire16)))) : (+(wire17 ?
                  ($signed(wire19) >> $unsigned((8'hab))) : ($unsigned((8'hae)) == (wire20 & reg29)))));
          if (reg29[(3'h4):(2'h2)])
            begin
              reg32 <= {$signed(reg26[(2'h3):(2'h2)])};
              reg33 <= {(~&(8'hb5)), reg28};
              reg34 <= reg32[(3'h6):(2'h2)];
              reg35 <= {(~|reg27), (~&reg31[(1'h0):(1'h0)])};
              reg36 <= reg32[(2'h3):(1'h1)];
            end
          else
            begin
              reg32 <= $signed(wire24[(1'h1):(1'h0)]);
              reg33 <= (~&$signed({({(8'ha7), wire17} >> (reg27 == wire19)),
                  $unsigned($signed(wire21))}));
            end
          if ($signed($signed((reg36 == (&(8'ha8))))))
            begin
              reg37 <= (({$unsigned(reg35),
                  wire17} ~^ (^~wire30)) * ($unsigned(((reg26 ^~ wire18) ?
                  reg33 : (7'h43))) << (+($unsigned(wire19) ?
                  $unsigned(wire24) : $signed((8'hb8))))));
            end
          else
            begin
              reg37 <= ((~^$signed((wire21[(1'h0):(1'h0)] <= (wire16 && wire24)))) >= $unsigned($signed(reg31)));
              reg38 <= $signed(reg35);
              reg39 <= reg31;
            end
          reg40 <= $unsigned((&wire15[(3'h5):(2'h3)]));
          reg41 <= ((~^(7'h42)) * ({$signed(reg33[(2'h2):(2'h2)])} != {wire23[(3'h6):(1'h0)]}));
        end
      reg42 <= reg41[(3'h6):(2'h2)];
      reg43 <= wire21;
      if (reg32)
        begin
          reg44 <= reg31;
          if (reg43[(4'h8):(3'h7)])
            begin
              reg45 <= wire21[(4'h8):(1'h1)];
            end
          else
            begin
              reg45 <= ($signed({reg45}) && wire20[(4'h8):(2'h3)]);
              reg46 <= $signed($unsigned(reg34));
              reg47 <= $unsigned($signed((8'hae)));
              reg48 <= ($signed({reg40, $unsigned(wire18[(3'h4):(2'h3)])}) ?
                  (~&$unsigned($unsigned({(8'hb7),
                      wire21}))) : $signed((wire23 ^ reg32[(3'h4):(1'h1)])));
              reg49 <= $unsigned(reg25);
            end
        end
      else
        begin
          if (((wire20 ?
              (^~$signed($signed((8'hbd)))) : (+$unsigned({reg32}))) ~^ ((^reg45[(4'h9):(3'h6)]) ?
              $signed($unsigned(reg27[(4'h8):(4'h8)])) : (reg45 ?
                  $signed($unsigned((8'had))) : wire17))))
            begin
              reg44 <= (~^(8'ha8));
              reg45 <= reg49[(3'h5):(3'h5)];
              reg46 <= wire30;
              reg47 <= {wire20};
            end
          else
            begin
              reg44 <= reg44[(3'h7):(2'h2)];
              reg45 <= (~|reg41[(1'h1):(1'h0)]);
              reg46 <= $unsigned(reg36);
              reg47 <= reg49[(4'ha):(3'h7)];
            end
          if (((~&{$unsigned($unsigned(reg33))}) ?
              (-$unsigned((^(wire22 ?
                  wire19 : reg43)))) : {{$unsigned(reg42)}}))
            begin
              reg48 <= wire19;
              reg49 <= $signed(($unsigned((~(!reg41))) ?
                  ($unsigned($signed(reg42)) ?
                      {(8'hac),
                          $unsigned(reg43)} : reg46[(3'h4):(1'h1)]) : (wire30[(3'h4):(1'h0)] > (~{wire18}))));
              reg50 <= {$signed(({$unsigned(wire23)} ?
                      {(reg48 != (8'ha4))} : $unsigned((~^reg32)))),
                  ($unsigned(($unsigned(reg28) != (reg38 <= reg46))) ?
                      (((~^reg33) | $unsigned(reg27)) > reg45) : ($signed(reg46[(1'h0):(1'h0)]) > reg42))};
            end
          else
            begin
              reg48 <= reg28;
              reg49 <= reg45[(3'h6):(3'h4)];
            end
          reg51 <= $unsigned(reg31[(3'h4):(1'h1)]);
          reg52 <= (((reg31 - $signed((reg44 ? reg35 : reg32))) ?
                  (|(^$signed(reg34))) : reg39) ?
              $unsigned(reg39[(1'h1):(1'h0)]) : ($unsigned((~|(~wire20))) ?
                  $signed($unsigned((reg48 && reg28))) : ((-$unsigned(reg37)) ?
                      reg35 : $signed(((8'ha7) << reg27)))));
        end
      if (($unsigned(((~&(wire18 | reg49)) ?
          {(reg28 ?
                  reg50 : wire22)} : (+(&wire24)))) + $unsigned(reg25[(2'h3):(1'h0)])))
        begin
          reg53 <= ((~^reg47[(3'h7):(3'h4)]) ?
              $signed(reg46) : (~^(|(reg45 ?
                  $signed(reg32) : (wire15 < (7'h44))))));
        end
      else
        begin
          reg53 <= {(((~^wire16) ? (7'h41) : reg50[(1'h0):(1'h0)]) ?
                  wire18 : ((reg36[(3'h4):(2'h3)] >>> $unsigned(wire21)) ?
                      $unsigned((wire16 <<< wire24)) : reg51))};
          if ((reg53[(1'h1):(1'h1)] ?
              (reg26[(3'h6):(3'h4)] >> reg32) : wire18[(2'h2):(1'h0)]))
            begin
              reg54 <= $signed(wire22[(2'h2):(2'h2)]);
              reg55 <= ($unsigned(reg44[(2'h2):(1'h1)]) ^~ $unsigned(wire16[(4'h9):(4'h9)]));
              reg56 <= $signed((reg28[(3'h6):(2'h2)] ?
                  $signed(($unsigned(reg48) ?
                      (reg47 - (8'ha3)) : reg32)) : ({$unsigned(wire18),
                      reg55} - $signed((wire19 ~^ wire17)))));
              reg57 <= ($signed({reg28}) ?
                  $signed((~|($signed(reg45) ?
                      $signed(reg36) : $signed((8'h9d))))) : (|{$signed((-wire30)),
                      {(8'h9e)}}));
              reg58 <= wire30[(4'hb):(2'h2)];
            end
          else
            begin
              reg54 <= ($signed(reg55) - (~^reg40[(3'h6):(2'h2)]));
              reg55 <= (8'hbf);
            end
          if ($unsigned(((((reg34 ? reg47 : reg45) + (wire23 & reg58)) ?
                  reg31[(2'h3):(1'h0)] : (~^(|(8'hb7)))) ?
              $unsigned($unsigned(wire16[(5'h13):(4'h8)])) : (reg50[(4'hc):(4'h9)] ?
                  $unsigned(reg51) : wire15[(3'h6):(2'h2)]))))
            begin
              reg59 <= $unsigned($signed($unsigned((8'hac))));
              reg60 <= $unsigned($unsigned((~reg36)));
            end
          else
            begin
              reg59 <= reg37[(4'h8):(1'h1)];
              reg60 <= wire16[(4'hc):(1'h0)];
              reg61 <= {($signed(($signed(reg32) ?
                      reg53[(2'h2):(1'h1)] : reg51)) > wire20[(2'h2):(1'h0)])};
              reg62 <= (reg59[(1'h1):(1'h0)] ?
                  (~{reg48}) : {$unsigned(($signed(reg28) ?
                          {reg42} : $signed((8'ha7))))});
              reg63 <= reg38;
            end
        end
    end
  assign wire64 = $signed((8'hb7));
  always
    @(posedge clk) begin
      reg65 <= {wire16};
    end
  assign wire66 = reg43[(2'h3):(2'h3)];
  assign wire67 = ($signed($unsigned({(wire17 ^ reg53), (^reg54)})) ?
                      $signed(reg45[(3'h7):(2'h3)]) : reg61[(3'h6):(2'h2)]);
  assign wire68 = reg60[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if ((^($unsigned((((8'h9e) ? reg27 : (8'hbe)) ?
          (wire66 ? reg59 : reg58) : {wire16,
              reg51})) != ($unsigned((wire23 >= reg42)) ?
          $signed((&reg65)) : {$unsigned(wire64), reg44}))))
        begin
          if (({reg60[(3'h7):(3'h7)]} <= (~^(~&reg39[(3'h6):(2'h2)]))))
            begin
              reg69 <= (8'ha7);
              reg70 <= reg43[(4'h9):(1'h0)];
              reg71 <= (reg41 ? reg53[(1'h0):(1'h0)] : reg57);
              reg72 <= reg31[(1'h1):(1'h0)];
              reg73 <= $unsigned({(~|{$signed(reg65)})});
            end
          else
            begin
              reg69 <= $unsigned((((^~$unsigned((8'haa))) <= reg46[(3'h5):(2'h2)]) >>> $signed($signed((^reg28)))));
            end
          reg74 <= (~|(reg65 ?
              (wire67[(4'he):(4'hd)] * (reg50 <<< (reg38 ?
                  reg72 : reg41))) : reg62[(3'h7):(3'h4)]));
          reg75 <= $unsigned({$unsigned((reg38 >>> (reg69 ? wire19 : reg25)))});
          reg76 <= $unsigned({reg62[(1'h0):(1'h0)]});
        end
      else
        begin
          reg69 <= {({$unsigned(reg57),
                  $unsigned(((7'h43) ? reg34 : reg58))} ~^ (((reg55 + reg35) ?
                  (wire67 > wire64) : $signed(reg40)) > reg58))};
          reg70 <= $signed((&($signed($unsigned(reg71)) ?
              (&reg73[(3'h5):(3'h5)]) : (8'ha9))));
          reg71 <= reg69[(3'h5):(3'h5)];
          reg72 <= (~&(8'ha9));
          if (($signed(reg54) != reg45))
            begin
              reg73 <= reg43[(2'h2):(1'h0)];
              reg74 <= (|reg41[(4'h9):(3'h5)]);
            end
          else
            begin
              reg73 <= {(!wire68[(3'h5):(1'h1)])};
              reg74 <= reg36[(3'h6):(2'h3)];
              reg75 <= $unsigned($signed($signed($signed((8'hb2)))));
            end
        end
      reg77 <= (~^reg53);
      reg78 <= $signed(reg38);
      reg79 <= (~$unsigned(($unsigned($signed(reg71)) <= $unsigned($unsigned(reg58)))));
      reg80 <= (wire24 ?
          {($signed((!reg31)) ?
                  (+reg59[(4'h8):(3'h5)]) : ({wire64} ?
                      {(8'hbd)} : reg52))} : reg28[(4'h9):(1'h1)]);
    end
  assign wire81 = (|reg39);
  assign wire82 = reg50;
  always
    @(posedge clk) begin
      reg83 <= (reg77 ?
          ($unsigned(reg40) + wire81) : (reg61 ?
              $unsigned($unsigned((&reg53))) : $unsigned((reg54[(4'he):(4'h9)] ?
                  ((8'ha8) ~^ reg50) : (8'ha4)))));
    end
  assign wire84 = ((^(~($signed(wire21) && reg43))) != wire23);
  always
    @(posedge clk) begin
      reg85 <= reg49[(1'h0):(1'h0)];
      reg86 <= reg83;
      reg87 <= reg57[(3'h7):(2'h2)];
      reg88 <= ({reg59[(4'h8):(3'h5)],
          (~&({reg41,
              reg70} <= $unsigned(reg53)))} == ((8'h9e) + $unsigned(reg70)));
    end
  assign wire89 = wire30;
endmodule

module module167  (y, clk, wire171, wire170, wire169, wire168);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire171;
  input wire [(3'h6):(1'h0)] wire170;
  input wire [(3'h6):(1'h0)] wire169;
  input wire [(4'hb):(1'h0)] wire168;
  wire signed [(5'h10):(1'h0)] wire185;
  wire signed [(2'h3):(1'h0)] wire184;
  wire [(2'h3):(1'h0)] wire183;
  wire [(4'h8):(1'h0)] wire182;
  wire [(5'h11):(1'h0)] wire181;
  wire signed [(5'h12):(1'h0)] wire180;
  wire [(4'h8):(1'h0)] wire179;
  wire signed [(5'h15):(1'h0)] wire178;
  wire signed [(4'hf):(1'h0)] wire177;
  wire signed [(4'hc):(1'h0)] wire176;
  wire [(4'hd):(1'h0)] wire175;
  wire signed [(5'h10):(1'h0)] wire174;
  wire signed [(3'h7):(1'h0)] wire173;
  wire [(4'he):(1'h0)] wire172;
  assign y = {wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 (1'h0)};
  assign wire172 = $unsigned($signed(wire169));
  assign wire173 = {$unsigned($signed((wire172[(4'hd):(3'h6)] ?
                           $unsigned((8'haa)) : $unsigned((8'hab))))),
                       ($signed((~&(+(8'hbf)))) ?
                           $unsigned({{wire171},
                               $signed((7'h41))}) : $unsigned({(~|wire168),
                               wire168[(4'hb):(1'h0)]}))};
  assign wire174 = wire170;
  assign wire175 = wire169;
  assign wire176 = (((&(^~wire175)) ?
                           (($unsigned(wire171) <<< (8'hbc)) | wire170) : $unsigned($unsigned($unsigned((8'hab))))) ?
                       $unsigned($signed($signed((!(8'ha5))))) : wire175);
  assign wire177 = (wire172[(4'he):(3'h4)] ^~ wire170);
  assign wire178 = wire172;
  assign wire179 = wire178[(5'h13):(2'h2)];
  assign wire180 = (wire171 && ($unsigned(($unsigned(wire178) && $signed(wire170))) & $unsigned($signed((wire174 & wire174)))));
  assign wire181 = {$signed(wire175)};
  assign wire182 = $signed(wire178[(2'h3):(1'h0)]);
  assign wire183 = ((!wire181) ^ ((8'hb4) ?
                       (-wire170) : (~&($unsigned(wire176) ?
                           wire169[(3'h5):(3'h4)] : (wire168 ?
                               wire177 : wire174)))));
  assign wire184 = {(+wire183[(2'h3):(2'h3)]),
                       $unsigned(({(|wire170),
                           $unsigned((8'hb6))} ^ (!$signed(wire182))))};
  assign wire185 = (($unsigned({(wire175 + (8'hb6))}) ?
                           $signed(wire184[(1'h0):(1'h0)]) : $unsigned($unsigned({wire179,
                               wire178}))) ?
                       ({wire180} == wire169[(2'h2):(1'h1)]) : wire170[(3'h4):(3'h4)]);
endmodule
