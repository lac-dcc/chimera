module top
#(parameter param186 = (((!(|((8'ha6) ? (7'h40) : (8'hbe)))) + (^~(8'ha4))) ? (~|(8'hb2)) : ({(^~((8'hab) + (8'hbc))), (((8'hae) ? (8'hb2) : (8'hb7)) ^~ (8'hb5))} ? (^{((8'hab) ? (7'h43) : (8'haa)), {(8'hb4)}}) : {{((7'h44) ^ (8'haa)), ((8'hbf) >= (8'hae))}, (~(~|(8'ha0)))})), 
parameter param187 = ((((|(param186 ? param186 : param186)) == param186) ? param186 : ((param186 ? (param186 + (8'ha6)) : param186) ^~ ((param186 * param186) ? param186 : (param186 >> param186)))) - (param186 ? (+((param186 ? param186 : param186) && (param186 | param186))) : (param186 + (param186 || (param186 != param186))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire185;
  wire signed [(4'hf):(1'h0)] wire184;
  wire signed [(4'hd):(1'h0)] wire180;
  wire signed [(4'hd):(1'h0)] wire179;
  wire [(2'h2):(1'h0)] wire178;
  wire [(4'h9):(1'h0)] wire166;
  wire [(4'ha):(1'h0)] wire165;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire163;
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(4'hd):(1'h0)] reg182 = (1'h0);
  reg [(5'h11):(1'h0)] reg181 = (1'h0);
  reg [(4'hc):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg [(5'h14):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg170 = (1'h0);
  reg [(4'hd):(1'h0)] reg169 = (1'h0);
  reg [(3'h7):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire180,
                 wire179,
                 wire178,
                 wire166,
                 wire165,
                 wire5,
                 wire6,
                 wire7,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire91,
                 wire163,
                 reg183,
                 reg182,
                 reg181,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg8,
                 (1'h0)};
  assign wire5 = ((8'ha0) ? wire3[(4'he):(3'h6)] : wire4[(2'h3):(2'h3)]);
  assign wire6 = wire2[(4'hc):(3'h6)];
  assign wire7 = $unsigned((!$signed(wire5[(3'h4):(1'h0)])));
  always
    @(posedge clk) begin
      reg8 <= $signed(((!$unsigned(wire5[(5'h10):(4'hd)])) ?
          (8'hb1) : $signed({(&wire3), wire5[(5'h11):(1'h0)]})));
    end
  assign wire9 = {wire6[(3'h4):(2'h3)]};
  assign wire10 = $unsigned(wire2);
  assign wire11 = wire9[(4'hc):(1'h0)];
  assign wire12 = {(&$unsigned($signed({wire11}))),
                      $unsigned((((!wire5) > wire4[(2'h2):(2'h2)]) ~^ wire1[(3'h7):(3'h4)]))};
  module13 #() modinst92 (wire91, clk, wire3, wire7, reg8, wire2, wire0);
  module93 #() modinst164 (.clk(clk), .y(wire163), .wire96(reg8), .wire97(wire10), .wire95(wire91), .wire94(wire5));
  assign wire165 = $signed((^~wire0));
  assign wire166 = (($signed(wire91) != wire2[(5'h12):(4'hd)]) ?
                       (wire3[(3'h4):(3'h4)] ?
                           wire10 : ((wire4 ?
                                   (wire6 ? (8'hbb) : wire10) : {wire163}) ?
                               (!wire163) : {$unsigned((8'h9e)),
                                   (wire9 & (8'ha0))})) : $unsigned($signed(wire165[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if (($signed(((^~(wire11 ? (8'hb0) : reg8)) ?
              ((|wire10) >>> (wire12 ? wire2 : (8'ha9))) : (!wire9))) ?
          $signed({(|(wire11 ^ reg8))}) : $unsigned({$unsigned((wire165 ?
                  wire5 : wire166))})))
        begin
          reg167 <= {($signed((8'hb0)) - ((((8'hba) + wire5) ?
                      (wire3 + wire163) : wire5[(4'hc):(1'h1)]) ?
                  (~wire7) : $signed((wire0 ? wire0 : wire166)))),
              wire5[(4'hb):(2'h3)]};
          reg168 <= wire3;
          reg169 <= $signed((^~(reg168[(3'h5):(1'h0)] ?
              wire10 : ((~wire91) ? (wire4 == wire12) : {reg168}))));
          if (wire5[(4'he):(3'h7)])
            begin
              reg170 <= wire5;
              reg171 <= (!(wire2 ?
                  wire4[(2'h3):(2'h3)] : reg169[(4'hc):(3'h6)]));
              reg172 <= wire12[(2'h2):(2'h2)];
            end
          else
            begin
              reg170 <= wire10;
              reg171 <= (wire11 ^ ($signed((wire5[(1'h0):(1'h0)] ^~ (wire7 == reg169))) | $unsigned((|$unsigned(wire9)))));
              reg172 <= (!wire1[(2'h3):(2'h3)]);
              reg173 <= {(wire7[(3'h5):(3'h5)] & wire10)};
            end
        end
      else
        begin
          reg167 <= reg171;
        end
      reg174 <= wire10;
      reg175 <= $signed($unsigned({(wire10 >>> $signed(reg8))}));
      reg176 <= (8'hba);
      reg177 <= ((~^({(~^reg176)} ?
              (wire5 ?
                  (~^wire166) : (reg174 >= reg168)) : ((wire6 - (7'h42)) + {(8'hbf)}))) ?
          reg175[(4'h8):(2'h2)] : ((~^((wire7 & (8'h9c)) ?
              (reg170 ?
                  wire10 : reg173) : (+(8'ha3)))) >= wire91[(3'h5):(2'h3)]));
    end
  assign wire178 = wire9;
  assign wire179 = $signed((({{wire2},
                       (wire166 ?
                           reg172 : (8'haa))} || (|wire12)) == $unsigned(((wire1 == reg174) ?
                       {reg8} : reg8))));
  assign wire180 = $unsigned(reg175[(4'hc):(2'h3)]);
  always
    @(posedge clk) begin
      reg181 <= reg177[(3'h7):(3'h5)];
      reg182 <= $unsigned($unsigned((wire6[(2'h2):(1'h1)] ?
          wire165[(4'ha):(3'h5)] : $unsigned({reg167}))));
      reg183 <= $signed($signed((reg182[(4'h8):(3'h5)] <<< reg167)));
    end
  assign wire184 = $unsigned(reg8);
  assign wire185 = $unsigned((-{$unsigned((reg182 ? reg170 : (7'h44))),
                       $unsigned(wire12[(1'h1):(1'h0)])}));
endmodule

module module93  (y, clk, wire94, wire95, wire96, wire97);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire94;
  input wire [(3'h6):(1'h0)] wire95;
  input wire [(3'h5):(1'h0)] wire96;
  input wire signed [(4'he):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire137;
  wire [(5'h10):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire101;
  wire signed [(5'h12):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire135;
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg [(4'hc):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(4'hc):(1'h0)] reg159 = (1'h0);
  reg [(4'hf):(1'h0)] reg158 = (1'h0);
  reg [(3'h7):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(3'h4):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(2'h3):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  assign y = {wire137,
                 wire98,
                 wire99,
                 wire100,
                 wire101,
                 wire102,
                 wire135,
                 reg162,
                 reg161,
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
                 reg149,
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
                 (1'h0)};
  assign wire98 = $unsigned($signed((($signed(wire96) ?
                          wire97 : $signed(wire97)) ?
                      (^(wire96 ? wire96 : wire95)) : (~&wire96))));
  assign wire99 = ((8'ha1) ?
                      {(!$signed((~wire94))),
                          (wire97 ?
                              ((wire96 ~^ wire96) && wire97) : ((wire97 ?
                                      (7'h41) : wire95) ?
                                  $unsigned(wire95) : (wire95 - wire98)))} : (!wire97[(1'h0):(1'h0)]));
  assign wire100 = $signed(wire98[(1'h0):(1'h0)]);
  assign wire101 = {(8'ha7), (~&(wire97[(4'h8):(2'h3)] == wire94))};
  assign wire102 = wire97[(4'he):(4'hd)];
  module103 #() modinst136 (.wire106(wire98), .wire107(wire101), .wire105(wire99), .wire108(wire102), .wire104(wire96), .clk(clk), .y(wire135));
  assign wire137 = (|{($unsigned((wire98 ? wire97 : wire101)) ?
                           {$unsigned(wire96), {wire101}} : ((wire135 ?
                               wire101 : (8'hae)) | wire98))});
  always
    @(posedge clk) begin
      reg138 <= wire99[(3'h7):(2'h2)];
      if ($unsigned(wire102))
        begin
          if ((($signed(((wire95 ? (8'hbe) : wire98) ?
                      wire98[(3'h7):(3'h5)] : $signed(wire102))) ?
                  wire102[(3'h6):(3'h5)] : wire98) ?
              (wire97[(2'h2):(1'h0)] >= (((reg138 && wire100) ?
                  (~^(8'hbb)) : reg138[(2'h2):(1'h1)]) | ($signed(wire94) ?
                  ((8'hbb) ?
                      wire137 : wire137) : (~^wire135)))) : wire96[(3'h5):(2'h3)]))
            begin
              reg139 <= ((wire94 ?
                  {(!$unsigned(wire97)), {(~&reg138), wire135}} : {{(~(8'hbe))},
                      ((-wire98) >>> wire135[(1'h0):(1'h0)])}) <<< $signed($unsigned($signed((wire99 ?
                  (8'hab) : wire135)))));
              reg140 <= $signed(wire94[(5'h11):(3'h5)]);
            end
          else
            begin
              reg139 <= wire97[(2'h2):(1'h0)];
              reg140 <= $unsigned($unsigned(((|(wire101 || wire95)) ?
                  wire96[(2'h2):(2'h2)] : ($signed(wire97) ?
                      (~^wire99) : (|wire135)))));
            end
          reg141 <= {$unsigned(wire102[(5'h11):(5'h11)]),
              $unsigned(((~^(wire137 >= reg138)) ?
                  $signed(reg139) : $signed(wire135[(1'h1):(1'h0)])))};
          if ((^$signed((((-reg140) ? {reg139, wire137} : wire100) ?
              ($unsigned(wire97) && $unsigned(wire102)) : (+wire94)))))
            begin
              reg142 <= wire98[(4'hf):(3'h6)];
              reg143 <= $signed({{((reg142 ? wire137 : wire94) ?
                          wire137 : (^~reg141))}});
              reg144 <= wire95;
              reg145 <= ($unsigned((($signed(reg138) | (&wire99)) ?
                      ((wire95 + (8'h9e)) ?
                          (wire135 ?
                              reg144 : (7'h42)) : $unsigned(reg141)) : (^~$signed((7'h43))))) ?
                  (-{{(~&wire102),
                          ((8'ha8) ?
                              wire94 : reg138)}}) : wire102[(5'h11):(1'h0)]);
              reg146 <= (reg141[(1'h0):(1'h0)] ?
                  ($signed(reg139[(5'h12):(2'h3)]) ?
                      (^$signed($signed(reg142))) : (^~((wire100 ?
                              wire137 : reg144) ?
                          (reg139 ? reg145 : reg139) : (reg142 ?
                              wire100 : wire99)))) : wire100[(3'h4):(2'h2)]);
            end
          else
            begin
              reg142 <= reg140[(4'hc):(1'h0)];
              reg143 <= reg141;
              reg144 <= {wire96,
                  $unsigned((^((-(8'had)) ?
                      {reg140} : (wire135 ? wire97 : wire135))))};
              reg145 <= reg138;
            end
          reg147 <= wire137[(4'h8):(4'h8)];
          reg148 <= $unsigned((~|(((|(7'h44)) ?
              (~^wire99) : $signed(wire137)) <<< reg141)));
        end
      else
        begin
          reg139 <= {((-(~|$signed(reg140))) ?
                  ($unsigned((^~reg147)) ?
                      {(&reg141), wire137[(2'h2):(1'h0)]} : ((wire94 ?
                              reg141 : wire137) ?
                          (~wire96) : {reg139,
                              reg147})) : $signed(reg146[(3'h4):(1'h1)]))};
          reg140 <= (((^~$unsigned($unsigned((8'hac)))) || (wire102[(4'hb):(2'h3)] && (((8'hb2) >> wire94) ?
                  {wire101} : reg139))) ?
              ($signed(((reg141 + (7'h41)) ?
                      (reg147 ? reg139 : (8'hbd)) : $signed(reg147))) ?
                  (($unsigned(reg142) ? $signed(wire100) : wire102) ?
                      $signed(((8'hb0) ?
                          reg147 : wire96)) : wire99) : $signed(((~&reg148) ?
                      reg138 : wire95[(2'h3):(1'h0)]))) : (+wire102));
          reg141 <= ($signed(((!{(8'hab),
              reg146}) && wire97[(4'he):(2'h3)])) >> reg144);
          if (reg144[(2'h3):(2'h2)])
            begin
              reg142 <= $signed(reg140);
              reg143 <= $unsigned((|($signed({reg141}) ?
                  (wire102[(2'h2):(1'h1)] ?
                      ((8'ha7) ? wire137 : wire99) : (wire94 ?
                          wire101 : reg146)) : $signed((^~reg143)))));
              reg144 <= {({$signed(wire135),
                      $signed((wire96 <= wire137))} <<< ({(|reg145)} ?
                      (^$signed((8'hb5))) : $signed(reg139[(4'hf):(4'he)])))};
            end
          else
            begin
              reg142 <= ($signed((((8'ha3) ?
                  (^(8'ha5)) : $signed(reg140)) | ((reg140 ?
                  wire100 : reg141) != (8'hae)))) + reg146[(2'h3):(2'h2)]);
              reg143 <= wire94[(1'h0):(1'h0)];
              reg144 <= (^reg139);
              reg145 <= reg145;
            end
          if (($unsigned(($unsigned({(8'hba), reg144}) ~^ (((8'haf) >= reg139) ?
              $unsigned((8'hab)) : (&(8'hb1))))) >> $unsigned(wire135)))
            begin
              reg146 <= (^~(+$signed(wire95[(3'h4):(1'h0)])));
              reg147 <= $signed($unsigned($unsigned((!{(8'h9c), wire135}))));
              reg148 <= reg144;
            end
          else
            begin
              reg146 <= wire98;
              reg147 <= (~($unsigned($signed((reg148 == reg147))) ?
                  (-((reg145 ? reg140 : wire99) ?
                      (reg145 ?
                          wire95 : reg143) : $signed(wire135))) : ((((8'hba) ?
                      reg142 : wire96) | wire97) < $unsigned(wire102))));
              reg148 <= reg146[(3'h7):(3'h6)];
            end
        end
      reg149 <= wire97;
      if ((!wire99[(4'h9):(3'h4)]))
        begin
          if (wire137[(5'h10):(4'hf)])
            begin
              reg150 <= ((wire98 && $unsigned({$signed((8'ha5)),
                  wire94[(1'h1):(1'h1)]})) - $signed((~&$unsigned({(8'hbb)}))));
              reg151 <= ({$unsigned((|(~reg146))),
                      ($signed(wire96) ?
                          $unsigned($unsigned(reg148)) : $unsigned(reg141[(1'h0):(1'h0)]))} ?
                  wire101[(3'h6):(3'h5)] : (&(8'hb7)));
            end
          else
            begin
              reg150 <= {($unsigned(reg138) ?
                      $signed(((reg151 | reg148) & $signed(wire95))) : {(8'h9c)})};
              reg151 <= {$unsigned(wire95[(3'h5):(1'h1)]),
                  ($signed(reg144) < reg143[(1'h0):(1'h0)])};
              reg152 <= (-reg142[(3'h4):(1'h0)]);
              reg153 <= reg148;
            end
          reg154 <= $unsigned((8'hba));
          reg155 <= $signed((~&(&($unsigned(reg149) ?
              $signed(reg149) : reg140))));
          reg156 <= (8'ha5);
          if ($signed(reg153))
            begin
              reg157 <= $signed(($unsigned($signed((reg147 ?
                      reg149 : (8'hac)))) ?
                  (($signed((8'hb6)) <<< $signed(reg151)) <<< (^(~|reg141))) : wire99));
              reg158 <= ($unsigned({($signed(reg149) ?
                      ((8'hbc) ?
                          reg155 : reg142) : {reg142})}) * ($unsigned((^(reg149 & reg153))) || $signed({wire96})));
              reg159 <= (^~($signed(wire100[(4'hf):(3'h4)]) <<< $signed(reg158[(3'h7):(3'h4)])));
              reg160 <= $signed(wire96[(2'h3):(2'h3)]);
              reg161 <= reg146;
            end
          else
            begin
              reg157 <= ($unsigned((~&(reg161[(4'h9):(3'h7)] ?
                      (reg138 * reg143) : reg160))) ?
                  ((^(8'ha2)) ?
                      ((8'h9c) ?
                          ((reg160 ^ reg143) ?
                              wire97[(4'ha):(1'h1)] : $unsigned(wire97)) : $signed((8'ha9))) : $unsigned(({reg145,
                          reg154} == $signed(reg159)))) : reg143);
              reg158 <= $unsigned(wire99);
            end
        end
      else
        begin
          reg150 <= (($signed($signed(reg146)) ?
                  (reg139 ?
                      (reg150[(3'h4):(2'h2)] ?
                          (reg141 ?
                              reg157 : reg144) : $unsigned(reg154)) : ($signed(reg148) ?
                          $signed(reg159) : ((8'ha5) ?
                              (8'h9c) : reg141))) : (^~$unsigned((reg158 >= reg155)))) ?
              (reg143 ^~ (7'h42)) : $signed((((reg145 && reg149) <<< $signed((8'hba))) < $unsigned((wire96 | reg153)))));
          reg151 <= reg154;
          reg152 <= ($unsigned({{(8'hb3), wire137},
                  (reg150 ^~ $signed(wire94))}) ?
              (((^(wire94 ? reg152 : reg157)) + $unsigned({wire102})) ?
                  ((8'hba) & ({(8'h9c)} ?
                      {reg154} : $signed(wire101))) : reg145) : {wire100});
        end
      reg162 <= ($signed((wire99 ?
          $unsigned((wire99 ? (8'ha5) : reg142)) : wire137)) ^ (!(!((^wire96) ?
          $unsigned(reg138) : $unsigned(wire95)))));
    end
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  input wire [(4'hc):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire19;
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  assign y = {wire90,
                 wire69,
                 wire67,
                 wire19,
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
                 reg70,
                 (1'h0)};
  assign wire19 = $unsigned(wire14);
  module20 #() modinst68 (.wire21(wire16), .wire24(wire14), .wire23(wire19), .wire22(wire15), .clk(clk), .y(wire67));
  assign wire69 = ((8'hb3) ?
                      wire18[(2'h3):(2'h2)] : ($unsigned(wire16[(1'h1):(1'h1)]) ^~ (+$unsigned($unsigned(wire19)))));
  always
    @(posedge clk) begin
      reg70 <= ($signed(((((7'h41) ^ (7'h44)) << ((8'hb1) ? wire15 : (8'ha2))) ?
          $signed($unsigned(wire19)) : wire17[(4'he):(4'h9)])) || (wire16 ?
          $unsigned({(7'h43)}) : $signed((^wire19))));
      if ((wire67[(1'h0):(1'h0)] >>> wire69[(4'h9):(4'h8)]))
        begin
          reg71 <= (~^(~^wire16[(4'hc):(2'h2)]));
          reg72 <= (&(+wire14));
          reg73 <= ((((^$unsigned(reg70)) >> ($signed(reg72) * {(8'hab),
              wire18})) > wire19[(3'h4):(1'h1)]) >> (($unsigned(reg72) | reg70) ?
              ((^~reg72[(3'h5):(2'h2)]) ?
                  wire17[(4'h9):(4'h8)] : wire14[(5'h11):(4'h9)]) : ($signed((wire19 ^~ reg70)) - wire15[(1'h0):(1'h0)])));
          reg74 <= ((wire15 ^ $unsigned($signed($signed(reg70)))) == (~&(!(8'hb0))));
          if ((wire15[(3'h6):(3'h4)] ^ $signed(wire16)))
            begin
              reg75 <= $signed($signed({(((7'h40) ?
                      wire69 : (8'hac)) | (&(7'h42))),
                  wire18[(2'h3):(1'h1)]}));
            end
          else
            begin
              reg75 <= wire14[(2'h3):(2'h2)];
              reg76 <= (wire19 <= $signed((-$unsigned((wire16 ?
                  wire16 : wire16)))));
              reg77 <= ($signed($unsigned((8'ha5))) - (($signed((reg70 == wire19)) <= $unsigned({wire18,
                      reg76})) ?
                  reg72 : reg76));
              reg78 <= $unsigned($unsigned((^~{$signed(reg75)})));
            end
        end
      else
        begin
          if ($unsigned(((-($signed(wire15) & (reg70 ?
              reg78 : wire14))) ^~ (wire16[(4'hb):(4'ha)] <<< ((8'hba) < {reg71})))))
            begin
              reg71 <= wire18[(2'h2):(1'h0)];
              reg72 <= ((reg75 ?
                  (wire19 ?
                      ($unsigned((8'ha2)) >>> $signed((8'h9c))) : (!(wire67 ?
                          (7'h40) : reg77))) : wire69[(1'h0):(1'h0)]) && $signed($unsigned(($signed(reg72) ?
                  $signed(wire14) : reg75))));
            end
          else
            begin
              reg71 <= $signed({($signed(reg74) >> (reg70[(3'h6):(2'h3)] > $unsigned(reg74))),
                  (((reg73 ? reg74 : reg73) ?
                      reg73[(4'hc):(4'hc)] : wire17[(2'h3):(1'h1)]) <= wire18)});
              reg72 <= wire14;
            end
          reg73 <= (|wire67[(2'h2):(2'h2)]);
          if ((reg70 ? (^reg76[(2'h2):(1'h0)]) : wire67))
            begin
              reg74 <= $unsigned(wire19[(3'h7):(3'h7)]);
            end
          else
            begin
              reg74 <= (((^~wire19[(1'h1):(1'h1)]) ?
                      ({$signed(wire16)} ? wire18 : wire69) : wire18) ?
                  $signed(reg75[(3'h4):(3'h4)]) : (&(($signed(wire67) << wire16[(3'h4):(2'h2)]) ?
                      ($signed((7'h44)) < $signed((8'hb8))) : {(wire15 << reg75)})));
              reg75 <= (wire15 ?
                  $unsigned(($signed(wire18) ~^ $unsigned(wire16))) : (8'h9d));
              reg76 <= (!$signed((wire67 || reg76)));
              reg77 <= reg70[(3'h6):(3'h5)];
              reg78 <= $unsigned($unsigned($signed(reg72[(3'h5):(3'h5)])));
            end
          reg79 <= ((reg70[(4'hb):(3'h6)] == ((~&$signed((7'h40))) ?
              (~&(wire17 ? wire17 : reg75)) : reg77)) || reg70);
        end
      if ((reg76[(1'h1):(1'h1)] ?
          (~&($signed(reg78[(1'h1):(1'h0)]) ~^ {{reg73,
                  reg78}})) : (-$unsigned($unsigned({(8'haa)})))))
        begin
          reg80 <= (($unsigned(wire15) >>> (^~($signed(wire16) ?
                  $unsigned(reg73) : $unsigned(wire19)))) ?
              reg70 : (reg77 ?
                  ($signed(reg78[(3'h5):(1'h1)]) ?
                      (~|$signed(reg79)) : reg76) : reg74[(2'h2):(2'h2)]));
          reg81 <= (($unsigned(reg80) ^ wire18[(2'h2):(1'h0)]) ?
              ((-$signed((reg71 ? wire69 : wire69))) ?
                  (&wire15) : reg71[(2'h2):(2'h2)]) : reg77[(2'h3):(2'h2)]);
          if (($unsigned($signed($signed((wire18 > reg80)))) ?
              {$unsigned(($signed(wire18) > reg76)),
                  (~$unsigned($signed(reg76)))} : $signed((~^$signed(reg70)))))
            begin
              reg82 <= ({$signed(($signed(wire19) >>> $signed(wire19)))} == $unsigned((8'hb6)));
              reg83 <= $signed(($signed(wire69[(4'hd):(4'hd)]) ^ wire17[(4'he):(3'h6)]));
            end
          else
            begin
              reg82 <= ($unsigned(wire67) ? (8'hb7) : (8'hae));
              reg83 <= ((&reg72) ?
                  ({($unsigned(wire15) ?
                          (|reg74) : (reg77 >= reg75))} >> reg76) : (~^reg80));
            end
          if ({$signed((reg77[(3'h4):(3'h4)] >= (~&$unsigned(reg70)))),
              reg81[(5'h10):(2'h3)]})
            begin
              reg84 <= wire69;
              reg85 <= (8'hbb);
              reg86 <= reg78[(2'h3):(2'h3)];
            end
          else
            begin
              reg84 <= (+reg71);
              reg85 <= $unsigned(((~$unsigned((|(8'ha2)))) ?
                  (wire14[(3'h6):(2'h2)] != $unsigned((reg76 | reg85))) : (~&($signed((8'hb8)) ?
                      $unsigned(wire69) : $unsigned(reg81)))));
              reg86 <= reg83;
            end
        end
      else
        begin
          reg80 <= reg79[(3'h5):(2'h3)];
          reg81 <= ((($signed($signed(reg85)) ?
                      wire14[(1'h1):(1'h1)] : wire19[(2'h2):(1'h0)]) ?
                  ((~reg78[(3'h4):(3'h4)]) ^ $unsigned(reg79)) : wire14[(3'h7):(3'h5)]) ?
              (reg70[(3'h7):(2'h3)] ?
                  $unsigned($signed(wire16[(1'h0):(1'h0)])) : $signed(wire18[(1'h1):(1'h0)])) : (wire19 << $unsigned(reg79[(1'h0):(1'h0)])));
        end
      reg87 <= {reg72[(3'h4):(2'h2)]};
      if ((^(reg84 ~^ ($signed($signed(wire67)) != (~|((7'h44) ?
          reg85 : reg84))))))
        begin
          reg88 <= (($unsigned($unsigned((reg74 << reg81))) ?
                  ($signed((reg84 == reg78)) ?
                      wire18 : ({wire69} >= $signed(wire19))) : reg87) ?
              ((8'ha6) - (wire16 < (reg81[(4'he):(4'ha)] ?
                  (reg75 ^~ reg81) : $unsigned((8'hb7))))) : (|wire67));
        end
      else
        begin
          reg88 <= $unsigned((reg84 ?
              ($unsigned(reg81[(3'h6):(2'h2)]) ?
                  wire19[(1'h1):(1'h1)] : (!(wire19 ~^ (8'hb0)))) : $signed(reg70[(3'h6):(1'h0)])));
          reg89 <= (((($signed(reg87) ? (|reg71) : {reg79}) ?
                  $signed($unsigned((8'hbe))) : (&(wire19 ^~ reg70))) ~^ reg84[(1'h1):(1'h1)]) ?
              (~^(wire18 ?
                  ($signed((8'hb1)) ? (+reg76) : wire14) : ({wire19, reg78} ?
                      reg74[(3'h6):(3'h4)] : reg75))) : ((7'h44) ?
                  $signed(wire67[(3'h5):(1'h0)]) : (((reg71 ?
                      reg83 : wire16) ^~ (-reg71)) * reg78[(1'h1):(1'h1)])));
        end
    end
  assign wire90 = (~$signed($signed(((&reg76) << reg71[(1'h0):(1'h0)]))));
endmodule

module module20
#(parameter param65 = (((((8'hbf) ? (|(8'hbd)) : ((8'ha4) <<< (8'hbe))) ? ({(8'had)} >> (^~(8'ha1))) : {(|(8'had))}) ? (8'haf) : (^~(8'hbd))) && ((^(~&(-(8'ha8)))) ? (^(|((8'ha3) ? (8'hb5) : (8'ha4)))) : ((^((8'h9c) ? (7'h41) : (8'hb8))) ? (((8'hb1) ? (8'ha3) : (8'hbd)) ^ ((8'hb5) < (8'hb1))) : ((!(8'hb1)) | ((8'hb0) > (8'had)))))), 
parameter param66 = (((param65 ? {(param65 ? param65 : param65)} : ((param65 ? param65 : param65) && (8'ha0))) ? ((param65 >> {param65}) ? param65 : param65) : param65) + (((((8'h9e) < param65) + (^param65)) + (param65 < param65)) ? {{(&param65)}} : (&(8'hb6)))))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire24;
  input wire [(2'h3):(1'h0)] wire23;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire [(4'hc):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire42,
                 wire28,
                 wire26,
                 wire25,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 reg27,
                 (1'h0)};
  assign wire25 = $unsigned($unsigned($unsigned((wire22 <<< wire21))));
  assign wire26 = wire21;
  always
    @(posedge clk) begin
      reg27 <= wire21;
    end
  assign wire28 = wire23;
  always
    @(posedge clk) begin
      if (($signed((wire24[(1'h0):(1'h0)] ^ {wire24[(1'h0):(1'h0)],
              (~|wire22)})) ?
          $unsigned(wire25) : {reg27[(1'h0):(1'h0)]}))
        begin
          if ((&wire23[(1'h0):(1'h0)]))
            begin
              reg29 <= $signed(({$unsigned((wire24 * wire25)),
                      (wire25[(3'h7):(3'h5)] ?
                          $signed(wire25) : (wire21 ? (8'hae) : wire25))} ?
                  (~|(~&wire24[(2'h2):(2'h2)])) : $unsigned($unsigned((reg27 <= wire21)))));
              reg30 <= $unsigned((wire24[(2'h2):(1'h1)] ?
                  (-wire26[(4'hf):(4'hc)]) : $signed({$unsigned(reg29),
                      {wire28, reg27}})));
              reg31 <= $unsigned(wire28[(1'h1):(1'h1)]);
            end
          else
            begin
              reg29 <= reg29[(4'ha):(4'ha)];
              reg30 <= reg27;
            end
          reg32 <= wire26[(1'h0):(1'h0)];
          reg33 <= wire22;
          reg34 <= $signed(($unsigned(($unsigned(reg27) ?
                  (reg31 ? wire26 : reg30) : {(8'hb0), wire24})) ?
              (reg27 >> reg31[(1'h0):(1'h0)]) : (&(wire24 & (wire22 ?
                  wire24 : reg30)))));
          reg35 <= (wire22 ?
              $unsigned((reg30[(3'h4):(1'h0)] | ((~(8'ha3)) > (reg31 ?
                  reg31 : (8'hbf))))) : reg30[(3'h5):(1'h0)]);
        end
      else
        begin
          reg29 <= (7'h40);
          if (reg32[(2'h2):(1'h0)])
            begin
              reg30 <= {$signed($unsigned(reg33[(3'h4):(1'h0)])),
                  {$unsigned(wire23[(1'h0):(1'h0)]), (^~(7'h41))}};
            end
          else
            begin
              reg30 <= $signed($unsigned((-{$unsigned(wire22),
                  $signed(wire22)})));
              reg31 <= ({$signed(wire23), {(+(!wire21))}} ?
                  wire22 : (reg31 ?
                      ($signed((reg33 ? wire26 : reg30)) ?
                          $signed((wire21 && wire26)) : {(wire25 ?
                                  reg33 : wire21),
                              (~^reg31)}) : wire26[(4'hd):(3'h4)]));
              reg32 <= {$unsigned((~&(wire22 ?
                      (reg30 != wire26) : reg33[(4'h8):(2'h2)])))};
              reg33 <= reg35[(5'h15):(3'h4)];
              reg34 <= $unsigned(($signed(wire28[(1'h1):(1'h1)]) ?
                  $signed(((~|wire21) ?
                      reg33[(3'h6):(3'h6)] : $signed(wire21))) : {wire26[(4'h8):(1'h1)],
                      {(|wire28)}}));
            end
        end
      reg36 <= reg34[(2'h3):(1'h0)];
      reg37 <= (reg29[(1'h1):(1'h1)] ? reg33[(4'h8):(3'h5)] : wire28);
    end
  always
    @(posedge clk) begin
      if (($signed($signed($signed($unsigned(reg31)))) ?
          wire24[(2'h2):(1'h0)] : $signed($signed({(reg29 ?
                  wire24 : (8'hb1))}))))
        begin
          reg38 <= ((~^(~({wire28} != $signed(wire23)))) ?
              $signed(($signed(reg35[(4'hb):(3'h6)]) > wire21)) : ((8'hbc) > $unsigned({(7'h41)})));
          reg39 <= ({$signed(((reg31 >>> (8'h9f)) ?
                      reg37[(1'h0):(1'h0)] : (reg34 ? reg33 : reg38)))} ?
              $unsigned((reg37 ?
                  ((reg32 ? (8'hbe) : wire26) ?
                      (wire21 ?
                          wire23 : wire23) : ((8'haa) + wire21)) : $unsigned({reg31,
                      wire26}))) : $signed((~$signed($unsigned(reg35)))));
        end
      else
        begin
          reg38 <= ((({((8'hbe) ? wire28 : wire28)} == reg36) ?
                  $signed($signed(reg39[(1'h0):(1'h0)])) : (|reg39)) ?
              reg35 : $signed(((wire28 ? (~&wire21) : reg30[(2'h3):(1'h0)]) ?
                  ($signed((8'hb9)) ?
                      wire22 : (~&reg27)) : reg35[(4'he):(2'h2)])));
          reg39 <= $signed(wire26);
          reg40 <= $signed(wire22[(1'h1):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      reg41 <= $unsigned((($signed(wire28) ?
              (+(reg27 ^~ reg29)) : ((wire25 ?
                  reg35 : reg39) ^ $signed(reg27))) ?
          (((reg32 ? reg39 : wire26) ?
              (8'h9d) : reg32) ^ (^~reg37)) : ((^(8'hb4)) ?
              reg30 : reg39[(1'h0):(1'h0)])));
    end
  assign wire42 = ((8'hab) ? wire21[(1'h1):(1'h1)] : wire23);
  always
    @(posedge clk) begin
      reg43 <= reg37;
      if ((|$unsigned(reg35)))
        begin
          if ($unsigned(reg35[(5'h10):(4'hc)]))
            begin
              reg44 <= (|reg27);
            end
          else
            begin
              reg44 <= $unsigned(((~$unsigned($signed(wire23))) ?
                  (wire22[(3'h4):(1'h1)] >> (reg34 ~^ $unsigned(wire24))) : wire25));
              reg45 <= (&($unsigned(wire25[(3'h6):(2'h3)]) != reg31[(4'hf):(4'hb)]));
              reg46 <= $unsigned((reg27 ~^ $signed($signed($unsigned(wire26)))));
            end
        end
      else
        begin
          reg44 <= (((~^$signed($unsigned(reg31))) ^ (({(8'hb4)} + $unsigned(reg31)) & $signed((reg43 ~^ (8'ha3))))) ?
              $unsigned($unsigned({(reg36 ?
                      reg45 : reg39)})) : $unsigned($unsigned(((reg33 ?
                      wire21 : reg41) ?
                  (wire28 ~^ reg37) : (reg38 ? wire24 : reg43)))));
          reg45 <= (($signed(((reg31 * (8'ha5)) ?
                      (+reg41) : ((8'hb9) < wire42))) ?
                  ({reg39[(3'h6):(3'h4)]} >= $signed((8'hba))) : (wire25 ?
                      (~&(reg30 ?
                          reg34 : wire24)) : ((~^reg41) * $signed(wire42)))) ?
              wire21[(1'h0):(1'h0)] : $signed(({(wire24 ?
                      (8'ha3) : reg38)} ^~ $signed({reg41}))));
          if ($unsigned(wire24[(1'h1):(1'h1)]))
            begin
              reg46 <= wire23[(2'h3):(2'h3)];
              reg47 <= $signed((({$unsigned(reg39),
                      (wire26 ? (8'ha2) : wire21)} ~^ reg38[(3'h5):(1'h1)]) ?
                  (~$signed(reg34)) : reg40));
              reg48 <= (wire21 & (~^$unsigned(reg37[(1'h0):(1'h0)])));
            end
          else
            begin
              reg46 <= $signed($signed($signed($signed((~|reg29)))));
              reg47 <= $signed(reg27[(1'h0):(1'h0)]);
              reg48 <= reg30[(1'h0):(1'h0)];
              reg49 <= wire24[(2'h2):(1'h1)];
              reg50 <= reg43;
            end
          reg51 <= reg38;
          reg52 <= $unsigned(((((reg47 >= reg44) ?
              $signed(reg43) : reg48) >= $unsigned((reg46 ?
              reg44 : (8'hba)))) > $unsigned(wire28[(2'h2):(1'h0)])));
        end
    end
  always
    @(posedge clk) begin
      reg53 <= (^((^wire28) & (reg48[(5'h11):(2'h3)] ? reg46 : reg30)));
    end
  assign wire54 = $signed($signed((~&$unsigned(reg29))));
  assign wire55 = (^(($signed(((7'h41) >= reg30)) & wire26) ~^ (reg39 < ((wire42 > reg27) | (reg44 ?
                      (8'hb4) : wire21)))));
  assign wire56 = reg53[(4'h9):(1'h1)];
  assign wire57 = wire56[(3'h4):(1'h1)];
  assign wire58 = (^wire22[(3'h7):(2'h2)]);
  always
    @(posedge clk) begin
      reg59 <= (+(^$unsigned((~reg35))));
      reg60 <= ($unsigned((~$signed($signed(reg49)))) || {$unsigned($signed((^wire55)))});
      if (reg33[(2'h2):(2'h2)])
        begin
          reg61 <= ((~&(($unsigned(wire26) ?
                      reg53[(4'h9):(3'h6)] : $unsigned(reg47)) ?
                  $unsigned((8'h9d)) : reg34)) ?
              ($signed(reg43) <= ($unsigned(reg38[(4'h9):(1'h0)]) >>> (~(~|reg27)))) : $signed(wire23));
          reg62 <= (^({$unsigned(wire28), reg30} ?
              ((8'ha6) ?
                  $signed(wire54[(4'h8):(3'h4)]) : (wire25[(4'hb):(1'h0)] ?
                      $signed((8'hba)) : reg47)) : {(reg38[(1'h1):(1'h0)] < (|reg38))}));
          reg63 <= $signed((+reg50[(2'h2):(1'h1)]));
        end
      else
        begin
          reg61 <= $signed((($unsigned(wire58) ?
                  wire24 : ((reg39 <<< reg60) <<< $signed(reg61))) ?
              reg31[(4'hb):(1'h0)] : (^($unsigned((8'hbd)) >> (wire56 ?
                  wire26 : reg40)))));
          reg62 <= ((8'hb7) ?
              ($signed(($unsigned(wire26) > wire55[(4'he):(4'he)])) ?
                  reg29 : $signed(reg31[(3'h4):(2'h3)])) : (-{wire58,
                  reg41[(1'h1):(1'h1)]}));
          reg63 <= {wire57, wire57[(4'h8):(3'h7)]};
          reg64 <= $signed((reg39[(4'hf):(1'h0)] ? (reg33 <= reg51) : reg31));
        end
    end
endmodule

module module103
#(parameter param133 = ((((~|((8'ha7) ? (8'ha7) : (8'ha0))) - (((8'haa) != (8'hae)) ? (~|(8'hb7)) : ((8'hbe) ? (8'had) : (8'hbf)))) ? (~^(((8'ha8) << (8'hbb)) ~^ ((8'hb7) ? (7'h42) : (8'ha5)))) : (-(((8'hb2) <= (8'hae)) != ((8'ha5) ? (8'hbf) : (8'h9d))))) ? (((((7'h41) ? (8'ha0) : (8'had)) << ((8'h9e) <= (8'ha0))) ^~ (~&(|(8'hb5)))) ? ((^~(~&(8'hb1))) ? ((&(8'hb1)) >>> ((7'h40) <= (8'hbf))) : ((8'hac) ? (^~(8'had)) : (^(8'ha7)))) : (|(~(~^(8'hb0))))) : {((&{(8'h9c), (8'hb0)}) ? (((8'hab) <= (8'hb9)) <= ((8'ha1) ? (8'hb6) : (8'ha6))) : ((8'hae) > (!(7'h41)))), (~(((8'hb2) != (8'ha4)) ? ((8'hb4) ^ (8'ha1)) : (|(7'h41))))}), 
parameter param134 = ((((~^(param133 ? (8'ha7) : param133)) ? ((param133 ? param133 : param133) != (param133 ? param133 : param133)) : ((param133 ? param133 : param133) ^~ (param133 ? param133 : param133))) ? (^~param133) : (+param133)) || ({({param133, param133} ? ((8'h9c) ? param133 : param133) : (param133 | param133)), {{(7'h42), param133}, param133}} ^~ (((param133 ? (7'h42) : param133) != (-param133)) ? (param133 ? {(8'h9d)} : (&(8'ha7))) : ((^param133) ? (-param133) : {param133})))))
(y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire108;
  input wire [(3'h5):(1'h0)] wire107;
  input wire [(5'h10):(1'h0)] wire106;
  input wire signed [(3'h7):(1'h0)] wire105;
  input wire [(3'h5):(1'h0)] wire104;
  wire signed [(4'ha):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire128;
  wire [(5'h13):(1'h0)] wire127;
  wire [(5'h14):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire115;
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire116,
                 wire115,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg109 <= (8'hb8);
      if (($signed($unsigned(((reg109 ^~ wire106) ^ wire106))) > wire106))
        begin
          reg110 <= (!((~{wire106[(4'he):(4'he)]}) ~^ (wire107 ?
              ((reg109 ? wire106 : wire107) + (&reg109)) : wire104)));
        end
      else
        begin
          reg110 <= wire104[(2'h3):(1'h0)];
          reg111 <= reg110;
          reg112 <= reg110[(1'h0):(1'h0)];
          reg113 <= wire108[(4'hc):(3'h4)];
          reg114 <= $signed($unsigned($signed(({reg111, wire104} - wire108))));
        end
    end
  assign wire115 = (reg113[(2'h2):(1'h0)] ?
                       reg109[(4'ha):(3'h6)] : {wire108[(5'h10):(4'h8)]});
  assign wire116 = (8'hbb);
  always
    @(posedge clk) begin
      if ((reg113[(1'h1):(1'h0)] ?
          (((8'ha2) >> ((8'hb0) << {wire107})) ?
              ($signed(reg113) | wire106) : ((~^reg112[(1'h1):(1'h0)]) & reg114[(3'h6):(2'h3)])) : $unsigned(wire107[(2'h3):(2'h2)])))
        begin
          reg117 <= wire108[(2'h2):(1'h0)];
          reg118 <= (~&(reg111 ?
              ({wire108[(5'h10):(1'h1)], (reg112 ? wire108 : wire115)} ?
                  (^~$signed(wire116)) : {(reg114 ^ wire104)}) : $signed((((8'hae) ?
                  reg110 : reg113) <= (!reg113)))));
          if ({(+wire108)})
            begin
              reg119 <= $unsigned($signed(wire107[(3'h4):(2'h2)]));
              reg120 <= reg118[(4'hc):(3'h5)];
              reg121 <= ($signed(reg112[(3'h5):(2'h2)]) ?
                  (((reg120[(3'h7):(3'h5)] ?
                          (^reg111) : ((7'h42) << wire116)) - ((~^reg120) != (~&(8'hbf)))) ?
                      ((wire115[(4'h8):(3'h4)] ?
                          wire108 : wire108) != reg118[(4'hc):(3'h5)]) : (~&(reg117 ?
                          wire104 : (reg118 ?
                              reg111 : (8'hba))))) : (~&({$unsigned(reg114),
                      ((8'hb5) - reg109)} && $unsigned((+reg111)))));
              reg122 <= $unsigned($signed(reg114));
              reg123 <= (wire108 << reg109[(4'h9):(3'h7)]);
            end
          else
            begin
              reg119 <= ($signed((~^{reg117[(3'h6):(3'h4)], (7'h40)})) ?
                  (~($signed(wire116) >= $signed($signed(reg122)))) : reg113[(2'h2):(1'h1)]);
              reg120 <= $signed((^reg121[(3'h4):(3'h4)]));
              reg121 <= reg114[(3'h6):(2'h2)];
              reg122 <= (~^reg110[(3'h4):(2'h2)]);
              reg123 <= wire107;
            end
          reg124 <= ((reg111[(2'h3):(1'h0)] ~^ $signed(wire115)) <= $signed(reg123[(3'h5):(2'h3)]));
        end
      else
        begin
          reg117 <= ($signed((!((reg123 ?
              (7'h44) : (8'haa)) ^~ $unsigned(reg122)))) != $signed($signed($unsigned((reg119 ?
              reg120 : (8'hb3))))));
          reg118 <= reg119;
          if (reg119)
            begin
              reg119 <= (wire104[(1'h1):(1'h1)] <= $unsigned($signed({((8'hbd) ?
                      reg109 : wire106)})));
            end
          else
            begin
              reg119 <= wire115;
            end
        end
      reg125 <= wire115;
    end
  assign wire126 = (reg123 ~^ $unsigned($signed({{wire105}, $signed(reg112)})));
  assign wire127 = $unsigned($unsigned(($signed({(8'hb8)}) ?
                       (wire115 - {reg111, (8'hb2)}) : (|{reg121, wire115}))));
  assign wire128 = reg118;
  assign wire129 = {(reg124[(2'h2):(2'h2)] ?
                           ($signed(reg113) ?
                               reg109[(3'h4):(2'h3)] : ($signed(reg113) ?
                                   reg125[(4'h8):(4'h8)] : $signed(wire126))) : $signed(reg114))};
  assign wire130 = (8'ha0);
  assign wire131 = reg119;
  assign wire132 = $signed({((-(wire130 ?
                           reg124 : reg121)) && ({reg118} ^ $unsigned(reg112))),
                       (wire107 ?
                           wire131 : ((-wire128) ^ (reg109 | (8'ha3))))});
endmodule
