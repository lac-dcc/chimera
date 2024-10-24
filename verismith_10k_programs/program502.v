module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h276):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire130;
  wire [(4'hd):(1'h0)] wire131;
  wire signed [(3'h5):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire136;
  wire signed [(4'hb):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire157;
  wire [(3'h7):(1'h0)] wire158;
  wire [(4'he):(1'h0)] wire159;
  wire [(4'hb):(1'h0)] wire268;
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg143 = (1'h0);
  reg [(5'h10):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  assign y = {wire115,
                 wire8,
                 wire5,
                 wire117,
                 wire118,
                 wire119,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 wire157,
                 wire158,
                 wire159,
                 wire268,
                 reg6,
                 reg7,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg132,
                 reg133,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 (1'h0)};
  assign wire5 = ((~(^((wire2 * wire2) <= $signed(wire3)))) ?
                     wire4[(2'h3):(2'h3)] : $unsigned((~(~(wire2 ?
                         wire0 : wire4)))));
  always
    @(posedge clk) begin
      reg6 <= {wire5[(1'h1):(1'h1)]};
      reg7 <= $signed($unsigned($signed((wire2[(2'h2):(2'h2)] ?
          (wire3 ~^ (8'haa)) : wire5))));
    end
  assign wire8 = ((~&$signed((&((8'hbd) ?
                     wire3 : wire1)))) <<< ($signed(wire5[(3'h4):(2'h3)]) ?
                     (reg6 | ($unsigned(wire4) ?
                         {wire3} : (wire3 >= wire2))) : wire3[(4'ha):(4'h8)]));
  module9 #() modinst116 (.wire10(wire8), .clk(clk), .wire11(reg7), .y(wire115), .wire12(wire3), .wire14(wire1), .wire13(reg6));
  assign wire117 = (((^~{(wire5 ? wire8 : wire2), (wire1 >= reg6)}) ?
                       $signed(wire3) : wire5) & wire2[(2'h2):(2'h2)]);
  assign wire118 = {$signed(($unsigned(wire0) * {wire117, (~^(8'haf))}))};
  assign wire119 = ($signed((((~wire115) ? wire2[(2'h2):(1'h1)] : wire115) ?
                           (-wire1[(1'h1):(1'h0)]) : wire117[(3'h6):(1'h0)])) ?
                       reg6 : (reg7 ?
                           ($unsigned(wire5) ?
                               $unsigned((wire4 ^~ wire2)) : (^~(8'h9e))) : (-$signed((wire3 ?
                               reg6 : reg7)))));
  always
    @(posedge clk) begin
      reg120 <= $signed({wire1[(5'h10):(4'h9)]});
      reg121 <= wire3[(4'hb):(4'hb)];
      reg122 <= (^((~|reg120[(2'h3):(1'h0)]) ?
          (reg7 ? (8'haa) : $unsigned(wire8[(1'h1):(1'h1)])) : (wire4 ?
              {(~&(8'haf)), wire0} : $unsigned($unsigned(wire8)))));
      reg123 <= reg122[(1'h0):(1'h0)];
      reg124 <= ((~|(~|$unsigned(wire2))) == ((^$signed(((8'ha1) ~^ wire8))) >> wire118));
    end
  always
    @(posedge clk) begin
      reg125 <= (~^$signed(({$signed(wire2), reg120} ?
          ((~&reg122) != reg120[(4'hd):(2'h3)]) : {wire3[(3'h4):(2'h2)],
              $signed(reg122)})));
      reg126 <= $unsigned(reg6);
      reg127 <= {($signed((8'h9c)) ?
              $unsigned((^~(wire4 != reg121))) : wire5[(2'h3):(2'h2)])};
    end
  assign wire128 = ((~&(wire4 <<< $signed(wire117))) > (~^{(reg124 * $signed(reg7))}));
  assign wire129 = reg121[(1'h0):(1'h0)];
  assign wire130 = $signed($unsigned((wire5[(1'h1):(1'h0)] ?
                       reg6 : (wire5 ? $signed(reg127) : wire2))));
  assign wire131 = {(~$signed(wire5))};
  always
    @(posedge clk) begin
      reg132 <= {$signed($unsigned(reg124[(4'hd):(4'h8)])),
          {reg125[(3'h7):(3'h5)],
              (~&($signed(reg7) ? wire3[(1'h0):(1'h0)] : (wire119 > reg6)))}};
      reg133 <= reg6;
    end
  assign wire134 = wire115;
  assign wire135 = {(&(wire5 ? (^~(+reg133)) : (reg120 ? wire128 : (&wire3)))),
                       ($unsigned((wire119 <<< {wire118})) ?
                           ((~$signed(reg127)) ?
                               wire0[(3'h6):(3'h6)] : reg7[(4'he):(4'h8)]) : {reg133[(1'h1):(1'h1)],
                               ((reg122 ^ wire131) || reg127)})};
  assign wire136 = {wire2,
                       $signed(($unsigned((wire128 ?
                           (8'hb2) : reg7)) & ((wire129 && wire8) ?
                           $signed(reg124) : (!reg132))))};
  assign wire137 = wire4[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg138 <= ($signed($signed(reg121)) ?
          $signed($signed((+$signed((8'hb8))))) : wire5[(1'h1):(1'h1)]);
      if ((&{(^$signed({reg125})),
          (({wire118} * (!(8'ha6))) ^ ((wire117 ? wire119 : reg7) ?
              (wire118 ? (8'haa) : wire117) : (7'h40)))}))
        begin
          if ((($signed(({reg138, reg132} ? $signed(wire135) : wire115)) ?
                  wire115[(4'h8):(3'h6)] : (($signed((8'ha7)) ^ ((8'hba) ^ wire119)) <<< reg133)) ?
              wire118[(4'hf):(4'he)] : (($unsigned((~|wire4)) << $unsigned(wire5)) >> $unsigned($unsigned($unsigned(wire118))))))
            begin
              reg139 <= $signed(((8'hb2) ?
                  $unsigned($signed((~^wire119))) : $unsigned(($signed(wire128) == $unsigned((8'hae))))));
              reg140 <= ((~^(~($unsigned(wire5) << $signed((8'hb7))))) ?
                  wire115 : $signed((wire134 >= $unsigned((~|reg138)))));
            end
          else
            begin
              reg139 <= (8'hb3);
            end
          if (((|((~|(|wire0)) ?
                  reg127[(4'h9):(1'h0)] : (~$unsigned((8'had))))) ?
              $signed($signed((+(reg132 ?
                  wire2 : (8'h9c))))) : $signed({$signed($unsigned(wire8)),
                  $unsigned((reg132 | reg124))})))
            begin
              reg141 <= $unsigned((|$unsigned((^{reg140}))));
              reg142 <= $signed((&(8'hb2)));
              reg143 <= (|$signed($signed(reg123)));
              reg144 <= (($signed(reg140) ?
                  reg6 : wire4) | wire5[(3'h4):(3'h4)]);
            end
          else
            begin
              reg141 <= ((!wire131[(2'h3):(1'h0)]) <<< ($unsigned(wire130) ?
                  wire0[(2'h2):(1'h0)] : $signed(wire130)));
              reg142 <= $signed(wire134[(3'h5):(3'h5)]);
              reg143 <= reg126;
            end
          if ($signed({({(^reg126)} ^~ (wire129 ?
                  reg133 : (wire137 - (8'ha0))))}))
            begin
              reg145 <= (-(~&$unsigned((~&reg6))));
              reg146 <= reg124;
              reg147 <= ((((reg122 ?
                      $signed((8'ha3)) : $unsigned(reg125)) & reg120) * {({(8'hb7)} ?
                          $signed((8'ha5)) : $signed(reg124)),
                      (^~wire115)}) ?
                  wire8 : $unsigned(({(reg144 || wire115)} ?
                      ((reg132 ?
                          wire137 : reg121) ~^ wire130[(2'h3):(2'h2)]) : ($unsigned(reg132) ?
                          (~^reg120) : $signed(wire135)))));
              reg148 <= wire118;
              reg149 <= wire135;
            end
          else
            begin
              reg145 <= wire3;
              reg146 <= (({(((8'haa) ? reg126 : (8'ha6)) ?
                          reg144 : reg139[(2'h2):(1'h0)])} ?
                  ($unsigned((wire137 ^ wire2)) ?
                      wire3 : ($signed(reg6) ?
                          (8'ha8) : ((8'hbd) >> reg133))) : (~|($unsigned(reg7) ?
                      (reg125 >= wire136) : wire117[(3'h5):(2'h3)]))) >= (!(wire5 ?
                  $signed($unsigned((8'hb8))) : ((reg126 + reg149) << reg138))));
            end
        end
      else
        begin
          reg139 <= wire0;
          reg140 <= $signed((((reg139 || reg146[(2'h3):(1'h1)]) >>> wire136[(3'h4):(2'h3)]) ?
              wire129[(2'h3):(1'h1)] : reg121));
        end
      reg150 <= (|$signed({(reg148 >> reg144)}));
      if (($signed(({((8'hbd) ? wire3 : wire129), ((8'ha1) && reg122)} ?
              wire131[(4'hc):(4'hc)] : ({reg121} || wire8[(2'h2):(1'h0)]))) ?
          {reg143[(1'h1):(1'h1)],
              ({$signed((8'ha2)),
                  (~|reg138)} >= reg127[(4'hb):(1'h0)])} : $unsigned((reg140 || (reg122 - $signed(wire135))))))
        begin
          reg151 <= reg145[(2'h2):(1'h0)];
          reg152 <= $unsigned(($signed({$signed((7'h41)),
              (|wire130)}) > $unsigned((^~{reg133, (8'ha9)}))));
          if ($unsigned((~&reg120)))
            begin
              reg153 <= $signed($unsigned((!(((8'ha5) + wire1) ?
                  (~&reg127) : (reg7 ? reg148 : reg133)))));
              reg154 <= $unsigned(((reg122[(3'h7):(2'h2)] <= ($unsigned(reg138) & ((8'h9c) ?
                      wire129 : reg144))) ?
                  $signed({wire118}) : ((~|wire134) < reg153)));
              reg155 <= wire118[(3'h6):(1'h0)];
              reg156 <= (&reg126);
            end
          else
            begin
              reg153 <= ($signed((reg154[(5'h12):(3'h4)] & ((reg146 ?
                      reg138 : reg141) <= ((8'hb8) ? wire3 : reg147)))) ?
                  ((8'haa) <<< (^(&wire8[(3'h7):(3'h5)]))) : (|$signed(wire130[(1'h1):(1'h1)])));
            end
        end
      else
        begin
          reg151 <= (reg152 > (reg122[(2'h3):(2'h2)] ~^ (reg133[(3'h7):(3'h4)] >>> {(reg124 ?
                  (8'hb9) : reg141)})));
        end
    end
  assign wire157 = {{reg147, $unsigned($signed($unsigned(reg145)))}};
  assign wire158 = (wire5[(2'h2):(1'h1)] ?
                       {(($signed(reg6) > reg149) - $signed({wire157}))} : ((reg147[(2'h3):(2'h3)] ?
                           (^reg142) : ((|reg152) ?
                               $unsigned(wire5) : (~|wire128))) + (reg140 <<< ({reg7,
                           reg6} ~^ $unsigned(reg6)))));
  assign wire159 = reg144[(4'hb):(4'h9)];
  module160 #() modinst269 (wire268, clk, wire129, wire130, wire157, reg121);
endmodule

module module160
#(parameter param266 = (&{(((^(8'h9e)) ? (+(8'ha8)) : ((7'h44) - (8'ha8))) | {((8'hb3) ? (7'h41) : (8'had))}), {{((8'hb9) & (7'h44))}, (8'hb1)}}), 
parameter param267 = (param266 >= param266))
(y, clk, wire161, wire162, wire163, wire164);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire161;
  input wire signed [(5'h14):(1'h0)] wire162;
  input wire signed [(4'hf):(1'h0)] wire163;
  input wire signed [(5'h13):(1'h0)] wire164;
  wire [(4'h8):(1'h0)] wire265;
  wire [(4'he):(1'h0)] wire264;
  wire signed [(3'h6):(1'h0)] wire263;
  wire [(5'h11):(1'h0)] wire262;
  wire signed [(5'h10):(1'h0)] wire261;
  wire signed [(5'h14):(1'h0)] wire260;
  wire [(5'h15):(1'h0)] wire259;
  wire signed [(3'h7):(1'h0)] wire258;
  wire signed [(5'h15):(1'h0)] wire257;
  wire [(4'he):(1'h0)] wire256;
  wire signed [(4'hc):(1'h0)] wire197;
  wire signed [(4'hf):(1'h0)] wire199;
  wire [(3'h6):(1'h0)] wire200;
  wire [(5'h11):(1'h0)] wire211;
  wire [(2'h2):(1'h0)] wire212;
  wire signed [(3'h7):(1'h0)] wire254;
  reg [(3'h6):(1'h0)] reg210 = (1'h0);
  reg [(4'hf):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg207 = (1'h0);
  reg [(5'h12):(1'h0)] reg206 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg205 = (1'h0);
  reg [(5'h15):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg201 = (1'h0);
  assign y = {wire265,
                 wire264,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire259,
                 wire258,
                 wire257,
                 wire256,
                 wire197,
                 wire199,
                 wire200,
                 wire211,
                 wire212,
                 wire254,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 (1'h0)};
  module165 #() modinst198 (wire197, clk, wire161, wire163, wire164, wire162, (8'hbb));
  assign wire199 = (wire197 ?
                       (!wire163[(4'hb):(4'ha)]) : (~$signed(wire163[(4'hc):(1'h0)])));
  assign wire200 = (!$unsigned(wire197));
  always
    @(posedge clk) begin
      if ((wire161[(4'hb):(3'h4)] < (-(wire164 <<< $unsigned((+wire199))))))
        begin
          reg201 <= (|($unsigned(((8'hac) ?
              (wire163 ?
                  wire200 : wire200) : (~&wire199))) > ($signed($signed(wire200)) ?
              {$signed((8'ha5)), wire197} : $signed((wire161 + wire162)))));
          if ($signed($signed(wire161)))
            begin
              reg202 <= $signed((((8'hb1) || $unsigned($signed(wire200))) < wire200[(1'h1):(1'h1)]));
              reg203 <= (8'hab);
              reg204 <= $signed($signed((~|wire163)));
            end
          else
            begin
              reg202 <= (((wire162 ?
                          ({wire162, wire199} ?
                              (8'hb4) : $unsigned(wire199)) : wire164) ?
                      (&$unsigned($unsigned(reg202))) : $signed((wire161 ?
                          (wire199 ? reg201 : wire162) : (wire162 ?
                              wire164 : wire197)))) ?
                  ((((wire163 << (8'hbb)) ?
                          wire161[(4'hb):(3'h4)] : ((8'hb6) ?
                              reg203 : reg202)) ?
                      ($signed((8'had)) ?
                          (!(8'hb0)) : reg202) : ((-(8'hbd)) ^ $unsigned(wire199))) && wire197[(4'hb):(2'h2)]) : $unsigned(wire199[(4'hb):(3'h5)]));
              reg203 <= wire163[(4'hd):(4'hc)];
              reg204 <= ((^reg204) > (^~((wire164 * $unsigned((8'hb1))) < wire199[(1'h1):(1'h1)])));
              reg205 <= (-(wire161[(4'h8):(3'h6)] ~^ ((~|(wire197 ?
                      wire163 : wire161)) ?
                  (wire161[(4'h9):(1'h0)] >> (7'h40)) : wire164)));
            end
          reg206 <= (+$unsigned((~&$signed(reg202[(4'h8):(1'h1)]))));
        end
      else
        begin
          reg201 <= (wire161[(4'h9):(3'h5)] ?
              ((+$unsigned(wire162[(1'h1):(1'h1)])) ?
                  (^$signed($unsigned(wire161))) : wire162[(5'h13):(2'h2)]) : $signed((~reg201[(1'h0):(1'h0)])));
          reg202 <= $signed(reg202[(1'h1):(1'h1)]);
        end
      reg207 <= (reg205[(2'h2):(2'h2)] ? wire200 : wire200);
      reg208 <= (~&wire164[(1'h0):(1'h0)]);
      reg209 <= (&($unsigned($unsigned(wire199[(1'h0):(1'h0)])) > ({(~wire163),
              (~&wire162)} ?
          $unsigned((reg203 ~^ (8'hbb))) : ($unsigned((8'hb1)) ?
              $signed(wire162) : $unsigned((8'ha5))))));
      reg210 <= $signed($unsigned($unsigned((((8'ha1) > wire163) ?
          (reg202 ? reg201 : wire161) : (reg203 ? (8'ha5) : reg209)))));
    end
  assign wire211 = (8'hae);
  assign wire212 = reg201;
  module213 #() modinst255 (wire254, clk, reg202, wire211, reg209, wire200, wire212);
  assign wire256 = ($unsigned(({wire254[(1'h1):(1'h1)],
                       reg206[(2'h3):(2'h2)]} && $signed({reg210,
                       (8'ha8)}))) << $signed(reg210[(3'h6):(2'h3)]));
  assign wire257 = $unsigned({(~^{{reg201, reg206},
                           (wire199 ? (8'haa) : reg209)})});
  assign wire258 = reg205;
  assign wire259 = (reg204[(4'he):(4'he)] ?
                       $unsigned((!reg205[(2'h3):(2'h2)])) : {$signed((8'hb4))});
  assign wire260 = ($signed((reg204 ?
                       (wire200 ?
                           (wire164 ?
                               reg203 : wire256) : $signed(reg204)) : (wire254[(2'h3):(1'h1)] == (&wire161)))) - $signed($unsigned(wire256)));
  assign wire261 = $signed((((~|(wire200 - reg210)) > (~|{wire197})) ?
                       {reg208[(1'h1):(1'h0)],
                           (~|$signed(reg208))} : $unsigned(reg208[(4'hb):(3'h5)])));
  assign wire262 = (~^$unsigned((-(~^$signed(wire200)))));
  assign wire263 = ($unsigned((|reg201[(2'h3):(1'h0)])) < ($unsigned(wire163[(4'ha):(4'ha)]) ?
                       {wire256, $signed(wire163)} : reg201[(3'h4):(2'h2)]));
  assign wire264 = (wire254 ?
                       (reg208 ~^ wire212) : {($unsigned($signed(reg210)) & (~&(wire163 ^ wire254)))});
  assign wire265 = ($signed(wire254[(3'h5):(2'h2)]) + ((|wire162) ?
                       $unsigned(reg203) : $signed((wire212[(1'h0):(1'h0)] ?
                           reg201 : $signed((8'hab))))));
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h38d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire114;
  wire signed [(3'h4):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire104;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire106,
                 wire104,
                 wire77,
                 wire76,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 wire31,
                 wire28,
                 wire16,
                 wire15,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg29,
                 reg30,
                 reg33,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 (1'h0)};
  assign wire15 = $signed(wire13[(1'h1):(1'h1)]);
  assign wire16 = (({((wire12 ? wire13 : (8'hb2)) < (wire13 >> wire11)),
                              ($unsigned(wire12) != (wire11 - wire14))} ?
                          $signed($signed((wire14 ~^ wire15))) : (~&wire15[(2'h3):(1'h0)])) ?
                      ($signed(({(8'ha6)} ?
                          $signed(wire11) : $unsigned(wire11))) ^~ wire12[(4'ha):(1'h1)]) : {wire14,
                          wire14[(2'h3):(1'h0)]});
  always
    @(posedge clk) begin
      reg17 <= {(~&$unsigned($unsigned($signed(wire16))))};
      if (wire12[(2'h3):(1'h1)])
        begin
          reg18 <= $signed(((~&{((7'h40) + wire15)}) <= $unsigned($unsigned($unsigned(wire15)))));
          if (((reg17[(3'h4):(2'h3)] + wire11) || {($signed({(8'hbf)}) && ((reg17 ?
                  wire16 : wire11) < $unsigned(wire16)))}))
            begin
              reg19 <= $unsigned(wire12[(4'h8):(1'h1)]);
              reg20 <= wire10;
              reg21 <= reg17;
              reg22 <= reg17[(4'h8):(3'h4)];
              reg23 <= $signed((reg17 << {((reg22 ? reg21 : wire15) ?
                      (-wire15) : reg18[(3'h6):(3'h6)])}));
            end
          else
            begin
              reg19 <= $unsigned(($signed(({reg17, reg20} ?
                      (wire16 ? reg19 : wire14) : $unsigned(wire13))) ?
                  {(|{wire13}),
                      $unsigned(wire12[(4'h9):(1'h1)])} : {((~^reg17) ?
                          $signed(wire12) : ((8'h9c) >>> reg21)),
                      reg23}));
              reg20 <= $signed((|($unsigned($unsigned(wire10)) ?
                  wire11[(1'h0):(1'h0)] : $unsigned($signed(wire10)))));
            end
          reg24 <= (^~($signed((-(reg18 < reg17))) ?
              (8'h9c) : wire11[(4'h8):(2'h3)]));
          reg25 <= $signed((((^~reg18) ?
              (~reg23[(2'h3):(1'h1)]) : $unsigned($signed(reg24))) <<< (($unsigned(wire16) + $signed(wire12)) ?
              wire13 : $signed(wire15[(3'h5):(1'h0)]))));
        end
      else
        begin
          reg18 <= ((reg20 ?
                  (-(reg21 ^ reg21)) : (wire13 ?
                      ((+reg24) <= {wire16}) : (8'ha8))) ?
              (!$signed(((reg24 || (8'ha5)) >= (wire10 ?
                  wire10 : wire15)))) : (wire15 ?
                  ($signed($signed(reg24)) >>> ((^reg25) ?
                      (wire11 ?
                          wire12 : reg21) : $signed(reg25))) : ((~|$unsigned(wire11)) ?
                      (^~$unsigned((8'hbc))) : (|{(7'h40)}))));
        end
      reg26 <= (((($unsigned(reg17) << wire14[(1'h1):(1'h0)]) ?
                  (~(reg17 ?
                      reg21 : (8'ha0))) : (((7'h43) ^~ reg19) || $unsigned(wire16))) ?
              wire16 : $signed(wire11[(2'h2):(2'h2)])) ?
          reg22[(4'hb):(3'h6)] : (({$unsigned(wire14)} ?
                  (((8'h9f) ~^ wire15) << {reg17}) : {$signed((8'hb7))}) ?
              reg22[(1'h1):(1'h0)] : (^~{wire10[(3'h6):(1'h1)]})));
      reg27 <= wire16[(1'h1):(1'h1)];
    end
  assign wire28 = $signed($signed(reg26[(3'h6):(2'h2)]));
  always
    @(posedge clk) begin
      reg29 <= $unsigned((~(reg17[(2'h3):(1'h1)] & ((reg18 | (8'h9f)) & $signed((8'ha0))))));
      reg30 <= (((((wire16 ? reg27 : wire11) ~^ (reg27 ? reg21 : reg27)) ?
              ({reg22} | {wire16}) : (+(wire12 ? reg29 : wire10))) ?
          ($unsigned((^~(7'h42))) ^~ ((|wire12) >> $signed(reg29))) : (+$signed($unsigned(reg22)))) >= (((&$unsigned(wire12)) - $unsigned((reg22 ?
          reg17 : wire16))) >> $unsigned((+(reg29 ? wire14 : wire28)))));
    end
  assign wire31 = $signed((+$signed((reg24[(3'h5):(1'h0)] ?
                      $signed(reg26) : (reg24 ? reg19 : reg20)))));
  assign wire32 = wire16;
  always
    @(posedge clk) begin
      reg33 <= reg20[(3'h6):(3'h5)];
    end
  assign wire34 = (wire10 >>> $signed((8'hba)));
  assign wire35 = $signed(($unsigned({(reg17 >= wire14)}) != $unsigned(((reg20 ?
                      wire15 : reg17) && {(8'haf), reg29}))));
  assign wire36 = (wire13 == (wire10[(2'h3):(1'h0)] ?
                      {$unsigned($signed(wire32)),
                          $signed($signed(reg17))} : $signed(wire14)));
  assign wire37 = ($signed(({(wire14 <= reg22)} ^ (~&reg23[(2'h2):(1'h1)]))) - ($signed($signed($unsigned(reg33))) ?
                      (&(~^$signed(wire35))) : (wire36 ^ (^~wire14[(5'h13):(5'h11)]))));
  always
    @(posedge clk) begin
      reg38 <= ((reg21[(5'h12):(4'hd)] && $unsigned((~&((8'hb0) * (8'ha7))))) ?
          $unsigned($signed(($unsigned(wire10) ?
              {wire10, (8'haa)} : (wire16 ~^ wire15)))) : (-$signed(reg30)));
      reg39 <= (8'ha1);
      reg40 <= (wire12 * $signed($unsigned(wire10)));
      reg41 <= reg17[(3'h7):(1'h1)];
      reg42 <= {(~($signed($unsigned((8'h9f))) ?
              $unsigned((!reg22)) : {((8'hb3) == reg17), {wire14, (8'hbc)}}))};
    end
  always
    @(posedge clk) begin
      reg43 <= ($signed(((wire31 >> (~&reg30)) & $unsigned(reg27[(4'hf):(2'h2)]))) ~^ $signed($signed(reg25[(4'h9):(2'h3)])));
      if ({(|{(8'h9e), (wire35[(3'h4):(1'h0)] <= (^reg20))})})
        begin
          if ($signed(reg23))
            begin
              reg44 <= (wire16 ?
                  (reg23[(1'h1):(1'h0)] ?
                      (&$signed(reg30)) : $unsigned({(wire11 > reg20),
                          $unsigned(reg41)})) : $signed(($unsigned((|reg25)) ?
                      $signed($unsigned(wire35)) : reg17)));
              reg45 <= $unsigned(((~^wire13[(1'h0):(1'h0)]) > wire35));
              reg46 <= wire14[(4'h8):(3'h6)];
              reg47 <= ((-reg46) << (~^(reg44 ?
                  $signed((~wire11)) : {$unsigned(wire15),
                      (wire35 + (8'ha4))})));
              reg48 <= reg40[(1'h0):(1'h0)];
            end
          else
            begin
              reg44 <= (reg38[(3'h6):(3'h5)] ?
                  (^$signed((^~reg26))) : (reg26[(4'hc):(2'h2)] <= reg29[(1'h1):(1'h0)]));
              reg45 <= reg43;
              reg46 <= ($unsigned(wire35[(4'hb):(1'h0)]) ?
                  $signed((reg33[(4'he):(1'h1)] >> {$unsigned(wire10),
                      wire14[(4'h8):(1'h0)]})) : $unsigned(($signed({reg43,
                      reg44}) + ($unsigned(reg39) ?
                      $unsigned(reg30) : $signed(reg47)))));
              reg47 <= $unsigned($unsigned({$signed(reg38)}));
            end
          reg49 <= (8'hbc);
          reg50 <= (~wire13[(2'h2):(1'h0)]);
        end
      else
        begin
          if ((~&{({$signed(reg39)} ^~ {reg49})}))
            begin
              reg44 <= ((8'ha1) ?
                  (reg22 - ($signed((reg39 != (8'ha6))) << (((8'hbd) ?
                          wire12 : wire11) ?
                      (wire11 ? reg39 : reg20) : reg23))) : (8'haa));
              reg45 <= (&(8'h9c));
              reg46 <= wire37;
            end
          else
            begin
              reg44 <= {(reg40 << reg39[(1'h1):(1'h1)]), (~^reg33)};
              reg45 <= $signed((~^(|(~$unsigned(reg48)))));
              reg46 <= reg20[(4'hb):(1'h1)];
              reg47 <= ($signed((|{wire32})) * reg45);
              reg48 <= reg18;
            end
          reg49 <= {reg33[(3'h4):(1'h0)], $unsigned(reg40)};
          reg50 <= (^~reg45);
          reg51 <= reg18[(2'h3):(1'h0)];
        end
      if ({$unsigned(((wire34[(2'h2):(1'h0)] <= (wire10 >>> reg41)) ?
              (^$unsigned(reg40)) : wire35)),
          $signed(reg48)})
        begin
          if ({(~&(8'hb9))})
            begin
              reg52 <= $signed((^$unsigned($signed($signed(reg30)))));
              reg53 <= reg30;
              reg54 <= wire34[(1'h1):(1'h0)];
              reg55 <= $signed(($unsigned((~&(~(8'hb2)))) ^ ($unsigned({reg29}) ?
                  $signed((reg38 ? reg54 : reg18)) : (^{reg23}))));
            end
          else
            begin
              reg52 <= $unsigned(((reg40 == ($unsigned(reg27) ?
                      $signed((8'had)) : (-reg44))) ?
                  $signed(reg46[(4'hc):(3'h5)]) : ($signed(reg49[(1'h0):(1'h0)]) ?
                      $signed({reg30}) : ($unsigned(reg19) ?
                          {reg38, (8'h9e)} : $signed(wire15)))));
            end
          reg56 <= $signed((reg54 >> $signed((reg55[(4'hf):(4'hb)] ^~ $signed(reg27)))));
        end
      else
        begin
          reg52 <= reg55;
          reg53 <= reg42[(4'hc):(4'hc)];
          if (($unsigned($signed(($unsigned(wire11) || $signed(reg25)))) ?
              (|reg24[(3'h5):(1'h1)]) : ((reg50 ?
                  $signed((8'haf)) : (~|(reg42 ?
                      wire12 : reg45))) && ($signed($signed((8'hb6))) ?
                  ($unsigned(reg47) ?
                      $unsigned(reg50) : reg19[(3'h4):(2'h2)]) : (~$unsigned(wire32))))))
            begin
              reg54 <= (((~^$unsigned(reg23[(1'h0):(1'h0)])) + ($signed($unsigned(reg33)) ?
                      reg18 : (((8'ha9) >>> reg19) ?
                          (reg25 && (8'hba)) : (reg38 > wire36)))) ?
                  wire37 : reg38[(3'h4):(3'h4)]);
              reg55 <= wire16[(4'hc):(1'h1)];
            end
          else
            begin
              reg54 <= $signed((~reg17));
            end
          reg56 <= (~$signed(reg52[(2'h3):(1'h0)]));
          reg57 <= ($unsigned((((reg40 << wire13) | {reg39, reg22}) ?
              wire16 : reg50)) > {(~{((7'h42) ? reg39 : reg53)})});
        end
      reg58 <= wire15[(3'h5):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg59 <= (reg50 ?
          $signed($unsigned(({wire13, reg33} ~^ {reg45,
              wire32}))) : ($signed(($unsigned(reg27) ?
              (!reg44) : $unsigned((7'h42)))) && ((~^reg30[(4'hc):(4'hc)]) ?
              $signed($signed(wire14)) : $signed((^reg17)))));
    end
  always
    @(posedge clk) begin
      reg60 <= (reg42 ? wire10 : reg45[(4'he):(4'h8)]);
      if ({{reg48[(3'h6):(1'h1)],
              (($unsigned((8'hbc)) > (reg19 && wire37)) ?
                  {wire10[(3'h6):(1'h0)]} : (!$unsigned(reg53)))},
          $signed({$unsigned($unsigned((8'hac))), reg47})})
        begin
          reg61 <= reg40;
        end
      else
        begin
          reg61 <= reg48;
          reg62 <= (($unsigned(({reg57} >> reg42[(5'h15):(3'h5)])) ?
              ($signed((reg26 + wire31)) ?
                  (7'h44) : ((reg55 ? wire16 : wire35) ?
                      {reg41, (8'ha5)} : (reg53 ?
                          reg53 : wire35))) : (|$signed($signed(wire35)))) << ({$signed((wire34 <= (8'hba))),
              $unsigned($unsigned(wire35))} ~^ (8'hb8)));
        end
      if ($signed(reg56[(5'h12):(4'ha)]))
        begin
          if ($unsigned((8'h9f)))
            begin
              reg63 <= (^~(^wire37[(5'h13):(5'h13)]));
              reg64 <= wire35[(2'h3):(1'h1)];
              reg65 <= wire37;
              reg66 <= reg52;
            end
          else
            begin
              reg63 <= ({$unsigned((8'h9d)),
                  reg47} >= $signed(($unsigned($signed(reg43)) ?
                  reg49 : (~(reg33 ? reg59 : reg53)))));
            end
          reg67 <= $signed($signed((+reg45)));
          reg68 <= (~&((((wire37 * (8'haa)) ? wire35 : $signed(wire12)) ?
              ($signed((8'hb6)) ?
                  (reg42 && reg17) : $unsigned((8'hb8))) : (wire15[(1'h1):(1'h1)] ?
                  (~wire31) : (reg20 * reg19))) != reg59));
          reg69 <= reg68[(4'ha):(3'h6)];
        end
      else
        begin
          reg63 <= $signed((reg17[(3'h4):(1'h0)] ?
              ($signed((reg58 ^ reg40)) ?
                  wire37[(3'h5):(2'h3)] : (reg23[(1'h1):(1'h0)] >= $signed((8'hb6)))) : reg39));
        end
      if ((({((wire35 ? wire28 : reg22) >>> {reg21, wire31}),
                  ((reg41 >> (8'hb4)) ?
                      (wire16 ? wire37 : reg29) : $signed(reg27))} ?
              (reg48 >>> $unsigned({wire15})) : (^wire12)) ?
          (((wire13 == reg48) ? wire10 : {$signed(wire34)}) ?
              ((reg24[(2'h2):(1'h0)] ?
                  $signed((8'ha5)) : $signed(reg59)) != reg45[(1'h1):(1'h1)]) : wire12) : reg41[(4'hb):(3'h7)]))
        begin
          if ($signed({$signed($signed((wire11 ? reg60 : reg51))),
              $signed($signed($signed(reg66)))}))
            begin
              reg70 <= reg54[(4'h8):(2'h3)];
              reg71 <= {reg50,
                  $unsigned(($unsigned(reg47[(1'h1):(1'h1)]) ?
                      (8'had) : (~^(-reg61))))};
            end
          else
            begin
              reg70 <= reg61[(4'hc):(3'h5)];
              reg71 <= $signed($unsigned(wire37[(4'he):(4'hb)]));
              reg72 <= (reg48[(3'h6):(3'h6)] * ($unsigned($unsigned(((8'hb2) ?
                      reg62 : reg57))) ?
                  wire31 : $unsigned((~^reg57[(2'h3):(1'h0)]))));
              reg73 <= (({$signed((reg26 - (8'hae))),
                      {((7'h40) ? reg62 : reg17)}} != (reg25 ?
                      reg29 : wire15[(3'h4):(3'h4)])) ?
                  reg25 : ($unsigned($unsigned($signed((8'hac)))) > ((~&(reg70 >= reg18)) ?
                      $signed(reg50) : (~&reg21[(4'hf):(3'h4)]))));
              reg74 <= ($unsigned($signed((^~(^reg66)))) >= (^~(($unsigned(reg27) <<< $unsigned(reg55)) ?
                  $unsigned($signed(wire36)) : reg52)));
            end
        end
      else
        begin
          reg70 <= reg67[(4'hb):(3'h7)];
          reg71 <= (|((^$signed($unsigned((8'hac)))) ?
              {(!(reg30 > reg68))} : wire32[(1'h0):(1'h0)]));
        end
      reg75 <= ($signed(({$signed(reg63), reg53[(4'he):(4'h8)]} - (((8'haf) ?
          wire37 : reg41) <<< ((8'ha8) || (8'hb8))))) < $signed(reg20[(4'h9):(3'h6)]));
    end
  assign wire76 = (~&(~reg45));
  assign wire77 = ($signed({((reg29 ? reg73 : reg58) ?
                          (reg61 ? (7'h42) : reg20) : (reg61 ? reg53 : reg70)),
                      reg64[(2'h3):(2'h3)]}) > ($signed(wire28[(3'h5):(3'h4)]) < (+((^reg18) < reg74[(4'h9):(4'h8)]))));
  module78 #() modinst105 (wire104, clk, reg59, reg73, reg33, reg19, reg53);
  assign wire106 = wire37;
  always
    @(posedge clk) begin
      if ($unsigned(((wire106[(2'h2):(1'h0)] ^~ wire16[(4'h8):(1'h0)]) ?
          {((reg47 + reg46) & reg61)} : (~reg67))))
        begin
          reg107 <= $unsigned($unsigned((8'hb4)));
          reg108 <= $unsigned(((|(~$signed(reg107))) ^ $signed($signed($unsigned(reg55)))));
          if ($signed(((wire35 < {(reg17 ?
                  wire32 : wire16)}) >= {$signed((+wire76)),
              {{wire10, reg29}}})))
            begin
              reg109 <= ($signed((~(reg21[(4'hf):(4'hf)] == reg41))) | wire16[(4'ha):(1'h0)]);
              reg110 <= $signed((~|((reg21[(4'hc):(3'h5)] ?
                      $unsigned(reg56) : (reg74 ? reg56 : wire16)) ?
                  reg24[(3'h5):(3'h4)] : wire106[(3'h5):(3'h4)])));
            end
          else
            begin
              reg109 <= (~reg30);
              reg110 <= (wire10 ?
                  reg29 : {{(!reg61[(4'hc):(4'h8)])},
                      ((~^(wire37 >= reg109)) ?
                          ({reg73} >> reg110[(3'h6):(2'h2)]) : $signed({reg65,
                              reg41}))});
            end
          reg111 <= reg45;
        end
      else
        begin
          reg107 <= reg69;
          reg108 <= $signed(($unsigned(wire34[(2'h2):(1'h1)]) ?
              ((reg48[(2'h2):(1'h0)] != $signed((8'haa))) | wire31[(3'h7):(3'h5)]) : reg41[(4'hb):(4'h8)]));
          reg109 <= reg23;
          reg110 <= $unsigned($unsigned((^~$unsigned(reg107))));
          reg111 <= reg42[(1'h1):(1'h1)];
        end
      reg112 <= (reg52 ?
          $unsigned($signed($unsigned((^~(8'hbf))))) : $signed($signed(reg54[(2'h3):(2'h2)])));
    end
  assign wire113 = $signed((~^((reg51 & reg109) ?
                       wire106[(3'h5):(3'h4)] : wire35[(4'hf):(1'h1)])));
  assign wire114 = ($unsigned(($unsigned($unsigned(reg62)) | ((-reg53) + {reg67,
                           reg69}))) ?
                       $signed(((((8'hbf) ~^ reg48) ?
                               (reg69 ? reg51 : reg70) : (reg24 < reg47)) ?
                           (((8'hbe) ? (8'hab) : reg50) ?
                               $signed(wire16) : (8'had)) : {wire32})) : reg110[(4'hc):(3'h4)]);
endmodule

module module78  (y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire83;
  input wire [(4'hf):(1'h0)] wire82;
  input wire signed [(5'h15):(1'h0)] wire81;
  input wire signed [(4'h9):(1'h0)] wire80;
  input wire [(3'h6):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire84;
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire91,
                 wire90,
                 wire84,
                 reg103,
                 reg102,
                 reg93,
                 reg92,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire84 = $signed(wire81);
  always
    @(posedge clk) begin
      reg85 <= $signed($signed((wire82[(4'hf):(4'h8)] + (!wire81[(4'h9):(4'h8)]))));
      if ($unsigned(wire84))
        begin
          reg86 <= wire81[(1'h1):(1'h0)];
          reg87 <= $unsigned($signed(reg86[(1'h0):(1'h0)]));
          reg88 <= wire79[(3'h6):(1'h0)];
        end
      else
        begin
          reg86 <= ((({(reg85 & reg87)} ^~ wire79[(1'h0):(1'h0)]) >= (8'h9e)) ?
              {({wire82, $signed(reg88)} - wire81),
                  (&$signed(reg88))} : $unsigned((wire83 && ((^~wire80) ?
                  $signed(reg88) : $unsigned(wire84)))));
          reg87 <= (reg88[(2'h2):(2'h2)] && (|((~&(-(8'hab))) ?
              (~&$unsigned(wire82)) : {reg86})));
          reg88 <= wire82[(4'hf):(2'h3)];
        end
    end
  always
    @(posedge clk) begin
      reg89 <= reg85;
    end
  assign wire90 = wire83;
  assign wire91 = $unsigned(wire90);
  always
    @(posedge clk) begin
      reg92 <= (wire81 || $signed((((wire91 < wire84) <= $unsigned(wire91)) ?
          reg89[(2'h2):(1'h1)] : (~&reg85))));
      reg93 <= wire91[(2'h3):(2'h2)];
    end
  assign wire94 = $unsigned(reg92[(3'h5):(3'h4)]);
  assign wire95 = wire83;
  assign wire96 = wire94[(1'h0):(1'h0)];
  assign wire97 = wire95[(5'h11):(5'h10)];
  assign wire98 = {wire96};
  assign wire99 = ((+(reg87 ?
                      (reg88 ?
                          (reg89 + wire97) : {wire84,
                              wire91}) : ($unsigned((8'hba)) ^ (wire98 >>> (8'ha4))))) ^ {(({wire95,
                              reg89} ?
                          $signed(wire94) : (wire98 ?
                              wire80 : reg85)) - reg89[(3'h4):(3'h4)])});
  assign wire100 = ((+(~(~reg86[(1'h0):(1'h0)]))) | (&(!reg87[(2'h3):(2'h3)])));
  assign wire101 = $signed(($signed(({wire96, wire95} ?
                       $unsigned(wire79) : (~|wire95))) ^~ $unsigned((wire81 <<< (wire91 - reg89)))));
  always
    @(posedge clk) begin
      reg102 <= ((~wire97[(1'h1):(1'h1)]) <= wire79);
      reg103 <= {((^~(-wire90[(2'h3):(2'h2)])) ?
              $signed(wire81) : $unsigned($unsigned($unsigned(wire100))))};
    end
endmodule

module module213
#(parameter param252 = ((((((8'ha7) ? (8'hbe) : (7'h44)) ? ((7'h40) ? (8'hb2) : (8'ha9)) : ((8'hae) <<< (8'hb5))) ? (-((8'ha6) ? (8'haf) : (8'hb9))) : (((8'hb2) ? (8'haa) : (7'h43)) >> (~&(8'haa)))) <= (((8'ha0) >= ((8'hb2) ? (8'had) : (8'ha9))) ? (~((8'ha7) ? (8'ha5) : (8'hbc))) : (((8'ha7) ? (8'hbc) : (8'hb1)) || (&(8'ha9))))) ? ((~|(((8'hb7) ? (8'ha8) : (7'h41)) <<< {(8'h9e)})) ? ((((8'hae) ? (8'hbf) : (8'hbc)) ? {(8'hbd)} : (-(8'hb5))) ? {((8'h9e) ? (8'ha9) : (8'hae))} : {{(8'hab)}}) : {{((8'ha7) ^ (8'haa))}, (8'haf)}) : (({((8'hb4) || (8'ha6))} ? {{(8'hbb), (8'hb9)}, ((8'ha8) - (7'h41))} : (((8'hbd) ^ (8'hb8)) + ((8'hb7) + (8'h9d)))) || (|({(7'h42)} == ((8'haa) >= (8'hb0)))))), 
parameter param253 = (&(+({((7'h44) ? param252 : param252)} & (~&(|param252))))))
(y, clk, wire218, wire217, wire216, wire215, wire214);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire218;
  input wire [(5'h11):(1'h0)] wire217;
  input wire signed [(4'ha):(1'h0)] wire216;
  input wire [(3'h6):(1'h0)] wire215;
  input wire [(2'h2):(1'h0)] wire214;
  wire signed [(4'hc):(1'h0)] wire251;
  wire [(5'h11):(1'h0)] wire250;
  wire signed [(3'h5):(1'h0)] wire249;
  wire [(5'h14):(1'h0)] wire248;
  wire [(5'h12):(1'h0)] wire247;
  wire [(5'h10):(1'h0)] wire246;
  wire [(4'hb):(1'h0)] wire245;
  wire [(4'hc):(1'h0)] wire244;
  wire signed [(4'he):(1'h0)] wire243;
  wire [(4'hc):(1'h0)] wire237;
  wire [(5'h10):(1'h0)] wire236;
  wire [(3'h4):(1'h0)] wire235;
  wire [(4'hd):(1'h0)] wire234;
  wire [(3'h4):(1'h0)] wire228;
  wire signed [(4'hd):(1'h0)] wire227;
  wire signed [(4'hd):(1'h0)] wire226;
  wire signed [(3'h5):(1'h0)] wire225;
  wire [(3'h5):(1'h0)] wire220;
  wire signed [(3'h4):(1'h0)] wire219;
  reg signed [(3'h7):(1'h0)] reg242 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg241 = (1'h0);
  reg [(4'h8):(1'h0)] reg240 = (1'h0);
  reg [(2'h3):(1'h0)] reg239 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg238 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg233 = (1'h0);
  reg [(4'he):(1'h0)] reg232 = (1'h0);
  reg [(4'ha):(1'h0)] reg231 = (1'h0);
  reg [(5'h14):(1'h0)] reg230 = (1'h0);
  reg [(4'he):(1'h0)] reg229 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg224 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg223 = (1'h0);
  reg [(5'h14):(1'h0)] reg222 = (1'h0);
  reg [(5'h14):(1'h0)] reg221 = (1'h0);
  assign y = {wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire220,
                 wire219,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 (1'h0)};
  assign wire219 = $signed(({$signed(wire217[(4'hf):(4'h9)])} ?
                       $signed(((+wire214) ?
                           (8'ha8) : wire216)) : (($unsigned(wire216) ?
                           ((8'ha0) ^ wire216) : wire216[(2'h2):(1'h0)]) != wire217[(4'h9):(3'h6)])));
  assign wire220 = (-((8'ha8) && ($unsigned(((8'ha1) ^~ (8'ha9))) ~^ $unsigned(wire214[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg221 <= $signed($unsigned(($unsigned((!wire216)) ?
          (~$unsigned((8'ha6))) : wire216)));
      reg222 <= (|wire215[(3'h5):(1'h1)]);
      reg223 <= (7'h42);
      reg224 <= $unsigned((~^{$signed(reg222[(5'h11):(4'he)])}));
    end
  assign wire225 = wire214[(2'h2):(1'h1)];
  assign wire226 = $signed($signed($unsigned($signed($signed(wire219)))));
  assign wire227 = (+(~|(~&$signed(((8'hbc) >> (8'hb2))))));
  assign wire228 = $signed((!reg222[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg229 <= {$unsigned((({wire214} ? (^~reg222) : (|wire226)) ?
              ($unsigned(wire220) >= (reg224 ?
                  wire217 : wire215)) : reg224[(3'h5):(3'h5)]))};
      reg230 <= wire228[(3'h4):(2'h2)];
      reg231 <= ($signed((-wire219[(1'h0):(1'h0)])) ?
          $unsigned((7'h40)) : $unsigned(reg229));
      reg232 <= $unsigned($signed({reg230[(1'h1):(1'h0)]}));
      reg233 <= (~|wire220[(1'h0):(1'h0)]);
    end
  assign wire234 = (reg230[(3'h7):(3'h6)] ?
                       {$unsigned(wire227[(4'ha):(4'h9)])} : {$unsigned($unsigned({wire217})),
                           reg221[(3'h4):(1'h0)]});
  assign wire235 = $unsigned((($signed((wire220 ? (8'haf) : wire234)) ?
                           $signed(reg231) : {reg229}) ?
                       (~$unsigned($unsigned(wire227))) : (~{(reg230 == (8'hbe)),
                           ((8'hb0) ? wire216 : wire220)})));
  assign wire236 = $signed((((wire217 < (reg224 ?
                           (8'h9d) : wire215)) != $signed(reg229)) ?
                       $signed((8'hb7)) : $signed(wire235[(1'h1):(1'h1)])));
  assign wire237 = reg233;
  always
    @(posedge clk) begin
      reg238 <= wire214[(1'h0):(1'h0)];
      reg239 <= ($unsigned(wire214[(1'h1):(1'h0)]) ?
          (^~wire227[(4'hb):(2'h2)]) : ($signed(((wire219 * reg229) ?
              ((8'h9f) ?
                  wire216 : wire227) : $unsigned(reg238))) << $signed($signed({(8'h9c)}))));
      reg240 <= ($signed($signed(wire218)) <<< wire217[(3'h7):(1'h1)]);
      reg241 <= (~(~^(wire214[(2'h2):(1'h0)] >> {(^~wire227)})));
      reg242 <= $signed($unsigned(wire217[(3'h5):(3'h5)]));
    end
  assign wire243 = ((8'ha8) ?
                       (8'hbf) : $unsigned(($signed(wire220[(1'h0):(1'h0)]) ?
                           ((wire236 >>> wire214) + (reg230 ?
                               (8'hba) : wire237)) : $signed(((8'hbd) ?
                               wire218 : wire220)))));
  assign wire244 = {($unsigned((&(8'ha6))) ^~ reg238[(1'h0):(1'h0)])};
  assign wire245 = (^~(8'ha9));
  assign wire246 = reg230;
  assign wire247 = $unsigned(((({wire228, reg241} ?
                           $signed(reg222) : (-wire244)) >>> $signed((~^wire225))) ?
                       wire237[(2'h2):(2'h2)] : $signed({$signed(reg233),
                           wire214[(1'h1):(1'h0)]})));
  assign wire248 = (^~$unsigned(((~&wire218) ?
                       wire245 : $unsigned(((8'ha7) ~^ reg223)))));
  assign wire249 = $unsigned(wire226);
  assign wire250 = $signed((($signed($signed(reg232)) == ((reg229 < wire234) | reg223[(2'h3):(1'h1)])) ?
                       $unsigned(wire243[(4'hb):(3'h5)]) : reg241));
  assign wire251 = wire227[(4'h8):(3'h6)];
endmodule

module module165
#(parameter param196 = {(((((8'had) ? (8'ha5) : (8'hb2)) ? ((8'ha0) ? (8'ha2) : (8'haf)) : {(8'hbc), (8'ha8)}) ? {((8'h9e) ? (8'hb3) : (8'hb4))} : (~(^~(8'hb7)))) || {((|(7'h41)) ? ((7'h40) ? (8'hb9) : (8'h9c)) : (-(8'hbe))), {(+(8'hab)), ((8'h9c) | (7'h41))}}), ((-(^~((8'hb9) ~^ (8'hb0)))) ? (^({(8'hb7)} ? (~|(8'hb8)) : (~(7'h44)))) : ((((8'ha9) ? (7'h40) : (8'hb2)) != ((8'h9e) ? (8'hbe) : (8'hac))) >= ((8'ha3) ? (^~(8'hbe)) : ((8'ha5) && (8'hbe)))))})
(y, clk, wire170, wire169, wire168, wire167, wire166);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire170;
  input wire [(4'hd):(1'h0)] wire169;
  input wire [(2'h3):(1'h0)] wire168;
  input wire [(5'h14):(1'h0)] wire167;
  input wire [(5'h12):(1'h0)] wire166;
  wire [(3'h5):(1'h0)] wire195;
  wire [(4'h8):(1'h0)] wire194;
  wire signed [(5'h12):(1'h0)] wire193;
  wire signed [(5'h13):(1'h0)] wire192;
  wire [(3'h7):(1'h0)] wire191;
  wire [(5'h14):(1'h0)] wire190;
  wire signed [(4'hf):(1'h0)] wire175;
  wire [(5'h12):(1'h0)] wire173;
  wire signed [(3'h4):(1'h0)] wire172;
  wire [(4'hf):(1'h0)] wire171;
  reg signed [(5'h13):(1'h0)] reg189 = (1'h0);
  reg [(3'h7):(1'h0)] reg188 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg187 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg186 = (1'h0);
  reg [(5'h14):(1'h0)] reg185 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg182 = (1'h0);
  reg [(5'h10):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg180 = (1'h0);
  reg [(5'h10):(1'h0)] reg179 = (1'h0);
  reg [(3'h4):(1'h0)] reg178 = (1'h0);
  reg [(5'h11):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(4'he):(1'h0)] reg174 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire175,
                 wire173,
                 wire172,
                 wire171,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg174,
                 (1'h0)};
  assign wire171 = (^~wire166);
  assign wire172 = wire170[(1'h1):(1'h1)];
  assign wire173 = $signed(wire167);
  always
    @(posedge clk) begin
      reg174 <= (|(^wire173));
    end
  assign wire175 = wire166;
  always
    @(posedge clk) begin
      reg176 <= wire172[(1'h0):(1'h0)];
      reg177 <= $signed((({$signed(wire172)} ?
              (reg174[(1'h0):(1'h0)] ? $signed(reg174) : reg174) : {(wire175 ?
                      wire175 : reg176),
                  {wire173}}) ?
          $signed((reg174 ?
              reg176 : (wire171 ?
                  wire173 : wire166))) : ($signed($unsigned((8'h9c))) && wire175)));
      reg178 <= (+wire170[(1'h0):(1'h0)]);
      if ({($signed(($signed(reg176) == (+wire172))) ~^ wire175[(2'h2):(2'h2)])})
        begin
          reg179 <= {{wire168[(1'h0):(1'h0)], wire171},
              {(|wire170[(4'ha):(3'h6)]),
                  ((reg176 == wire172) & $unsigned(wire168[(1'h1):(1'h0)]))}};
          if ((~^wire167))
            begin
              reg180 <= wire173;
              reg181 <= $unsigned($unsigned((~&$signed($signed(wire167)))));
              reg182 <= ((^~(~wire169[(3'h4):(1'h0)])) == $signed((($signed((8'ha7)) | (^~wire175)) > {$signed(reg181),
                  reg181[(3'h7):(2'h3)]})));
              reg183 <= $unsigned(wire170[(3'h4):(3'h4)]);
            end
          else
            begin
              reg180 <= wire169[(4'ha):(3'h7)];
              reg181 <= $unsigned(((wire167 ?
                  (wire175[(4'hc):(4'h9)] ?
                      (reg177 ?
                          wire167 : (8'had)) : (reg178 == reg182)) : $unsigned(wire173[(1'h1):(1'h0)])) + (-$unsigned($signed(wire168)))));
              reg182 <= $unsigned((~&(8'ha9)));
            end
          if ($signed(wire175))
            begin
              reg184 <= ($signed($signed($unsigned(wire168[(1'h1):(1'h0)]))) ?
                  (~&(~($signed((8'hab)) - reg183))) : $unsigned({((reg179 - wire171) ~^ $signed(reg179))}));
              reg185 <= $signed(wire171);
              reg186 <= $unsigned($unsigned(reg181[(4'hf):(4'h8)]));
              reg187 <= $unsigned($signed($unsigned({((8'hba) + reg180)})));
              reg188 <= (wire167 ?
                  (^$unsigned($signed({wire167}))) : ((($signed(wire175) > (wire175 <<< wire166)) ?
                      wire169 : $signed(reg180)) | $unsigned({wire169[(4'hb):(2'h2)],
                      (~|reg179)})));
            end
          else
            begin
              reg184 <= {(reg181 ?
                      $unsigned(($signed(reg179) ?
                          (reg185 ? reg176 : wire172) : (~|reg188))) : reg178),
                  wire173};
              reg185 <= (8'haa);
              reg186 <= (((reg187[(3'h6):(1'h1)] | reg178) ?
                  $unsigned(($unsigned(reg177) ?
                      (+wire169) : $signed((8'hab)))) : (((+reg174) ?
                      wire170[(4'ha):(4'h8)] : (^~wire172)) && (wire172 ?
                      (reg177 ?
                          reg185 : (8'hbc)) : (wire168 - wire168)))) || wire173[(4'h9):(3'h7)]);
              reg187 <= $unsigned((~|wire167[(5'h11):(1'h1)]));
            end
          reg189 <= wire168;
        end
      else
        begin
          reg179 <= (8'hbe);
          reg180 <= $signed($unsigned($signed($signed($unsigned((8'ha8))))));
          reg181 <= $signed(((8'hb1) != $unsigned(wire171[(1'h1):(1'h0)])));
          if ($unsigned((8'h9c)))
            begin
              reg182 <= ((^reg174[(3'h4):(1'h1)]) << $unsigned($unsigned((reg187 ?
                  $signed(reg187) : (&(8'ha9))))));
              reg183 <= $signed(({($signed(wire173) ?
                          {wire169} : (wire166 | (8'hb2)))} ?
                  (($signed(wire170) ?
                      ((8'h9e) == (8'hbd)) : ((8'hb9) >> wire166)) < reg177) : (^(wire172 ?
                      $signed((7'h43)) : reg182[(3'h5):(2'h3)]))));
              reg184 <= {reg176[(1'h0):(1'h0)], (~wire167[(2'h2):(1'h0)])};
              reg185 <= {{((-reg174[(3'h4):(2'h3)]) ?
                          wire169 : ($signed(reg183) ?
                              $unsigned((8'hab)) : wire169)),
                      (&(wire170 ~^ $unsigned((8'hb0))))}};
            end
          else
            begin
              reg182 <= $signed(wire172[(1'h0):(1'h0)]);
              reg183 <= (wire171 & $unsigned(reg181));
              reg184 <= wire172[(1'h0):(1'h0)];
            end
          reg186 <= {(8'ha0), $unsigned(wire170)};
        end
    end
  assign wire190 = ((-$unsigned($signed((reg181 <= reg189)))) == ($signed($unsigned((-reg179))) >= {reg179,
                       ($unsigned(reg174) ?
                           $unsigned(reg186) : reg185[(4'hb):(3'h7)])}));
  assign wire191 = $unsigned($unsigned($signed($unsigned(reg179[(4'he):(4'he)]))));
  assign wire192 = wire175[(4'ha):(3'h6)];
  assign wire193 = $signed(reg184[(3'h7):(3'h4)]);
  assign wire194 = ((~((((8'haf) >= wire166) << $unsigned(reg178)) ?
                       {$unsigned(wire190),
                           reg177} : $signed($signed(wire168)))) * $signed(((&$signed(reg187)) ?
                       (wire166[(4'hf):(3'h7)] > (reg189 + reg184)) : $unsigned((reg178 & wire168)))));
  assign wire195 = (~&{$signed(reg177[(3'h5):(1'h0)]), (~^wire170)});
endmodule
