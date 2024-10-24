module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire262;
  wire signed [(5'h14):(1'h0)] wire261;
  wire [(4'h9):(1'h0)] wire259;
  wire signed [(4'hd):(1'h0)] wire258;
  wire signed [(3'h7):(1'h0)] wire257;
  wire signed [(4'hc):(1'h0)] wire256;
  wire signed [(5'h15):(1'h0)] wire255;
  wire signed [(4'hc):(1'h0)] wire254;
  wire signed [(4'hc):(1'h0)] wire253;
  wire signed [(5'h13):(1'h0)] wire252;
  wire signed [(5'h13):(1'h0)] wire251;
  wire [(4'hf):(1'h0)] wire250;
  wire signed [(4'hc):(1'h0)] wire135;
  wire [(5'h14):(1'h0)] wire137;
  wire [(4'hf):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire139;
  wire [(5'h11):(1'h0)] wire191;
  wire signed [(4'hf):(1'h0)] wire193;
  wire [(2'h3):(1'h0)] wire248;
  assign y = {wire262,
                 wire261,
                 wire259,
                 wire258,
                 wire257,
                 wire256,
                 wire255,
                 wire254,
                 wire253,
                 wire252,
                 wire251,
                 wire250,
                 wire135,
                 wire137,
                 wire138,
                 wire139,
                 wire191,
                 wire193,
                 wire248,
                 (1'h0)};
  module5 #() modinst136 (wire135, clk, wire1, wire4, wire3, wire2, wire0);
  assign wire137 = $unsigned(wire135[(1'h1):(1'h1)]);
  assign wire138 = (~&$unsigned($unsigned(((+wire2) << $signed(wire0)))));
  assign wire139 = ((!$unsigned(($unsigned(wire138) | {wire3, wire1}))) ?
                       ({$signed(wire3[(3'h5):(1'h0)]),
                           ($unsigned(wire3) < wire135)} ^ $unsigned($unsigned(wire138))) : $signed($unsigned(($signed(wire138) > (wire3 == wire2)))));
  module140 #() modinst192 (wire191, clk, wire4, wire138, wire135, wire137);
  assign wire193 = $signed(wire3[(1'h0):(1'h0)]);
  module194 #() modinst249 (wire248, clk, wire4, wire0, wire3, wire193, wire2);
  assign wire250 = $signed(((~&wire193) ?
                       (wire137[(2'h2):(1'h1)] & $signed(wire1)) : (~^$unsigned($signed(wire248)))));
  assign wire251 = {$unsigned(($unsigned($unsigned(wire138)) ?
                           (8'ha9) : (wire248[(2'h3):(1'h0)] >>> {(8'h9c)}))),
                       {$unsigned($unsigned($signed(wire248)))}};
  assign wire252 = {(8'hb2), wire251[(4'hb):(3'h4)]};
  assign wire253 = ((($unsigned(wire3[(4'h8):(2'h2)]) > {(wire3 << wire135)}) ?
                           $unsigned(wire138) : $unsigned($unsigned($unsigned(wire0)))) ?
                       $signed(wire250[(2'h2):(2'h2)]) : (wire135 <<< (~(wire248[(2'h2):(1'h1)] ?
                           wire137 : (wire1 ? wire2 : wire191)))));
  assign wire254 = ($unsigned((|wire137)) << {(-(wire248[(2'h3):(1'h1)] << $unsigned(wire3))),
                       $unsigned(($signed((7'h43)) ? wire253 : {wire253}))});
  assign wire255 = ({((&(wire135 ? wire137 : wire4)) ?
                               $unsigned((|wire0)) : wire135),
                           wire193[(4'he):(2'h2)]} ?
                       (wire4 ^ (!({wire251,
                           wire250} * (8'h9e)))) : wire137[(4'h9):(2'h2)]);
  assign wire256 = $unsigned(((8'ha2) ?
                       (^((&wire137) ?
                           (^wire3) : (wire250 == (7'h44)))) : $unsigned(($signed(wire2) ?
                           wire191[(4'h9):(3'h5)] : (wire137 ?
                               (8'hac) : wire0)))));
  assign wire257 = $signed(wire191[(4'hf):(2'h3)]);
  assign wire258 = ({(((wire252 <= wire250) ?
                           wire193 : (&wire257)) ^~ (!wire0[(4'h8):(4'h8)]))} - (^~wire255));
  module54 #() modinst260 (wire259, clk, wire0, wire253, wire252, wire256);
  assign wire261 = wire135[(2'h3):(1'h0)];
  assign wire262 = (8'hb7);
endmodule

module module194
#(parameter param246 = (((+{(~^(8'hb4))}) << ((&((8'h9f) > (8'ha7))) ? (((7'h44) & (8'hb7)) ? ((8'ha3) <= (8'ha8)) : ((8'ha1) ? (8'ha1) : (8'hb7))) : ((8'ha8) << (-(8'ha4))))) | {((((8'ha6) == (7'h43)) ? ((8'hbb) ? (8'hbc) : (7'h40)) : ((8'ha1) ~^ (8'hbc))) ? ((|(8'hb3)) ? ((8'hb2) ? (7'h41) : (8'ha5)) : ((8'hb0) ~^ (8'ha3))) : {{(7'h42)}}), (~^{(^~(8'ha9))})}), 
parameter param247 = param246)
(y, clk, wire195, wire196, wire197, wire198, wire199);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire195;
  input wire [(2'h3):(1'h0)] wire196;
  input wire signed [(5'h10):(1'h0)] wire197;
  input wire [(4'hf):(1'h0)] wire198;
  input wire signed [(5'h15):(1'h0)] wire199;
  wire signed [(2'h2):(1'h0)] wire245;
  wire signed [(2'h2):(1'h0)] wire244;
  wire [(4'hd):(1'h0)] wire243;
  wire signed [(4'hf):(1'h0)] wire242;
  wire signed [(5'h13):(1'h0)] wire200;
  wire signed [(4'hb):(1'h0)] wire201;
  wire signed [(3'h4):(1'h0)] wire203;
  wire signed [(5'h15):(1'h0)] wire217;
  wire [(4'h9):(1'h0)] wire218;
  wire signed [(4'h9):(1'h0)] wire219;
  wire signed [(5'h10):(1'h0)] wire240;
  reg signed [(4'hf):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg207 = (1'h0);
  reg [(4'h9):(1'h0)] reg208 = (1'h0);
  reg [(2'h2):(1'h0)] reg209 = (1'h0);
  reg [(4'hf):(1'h0)] reg210 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg211 = (1'h0);
  reg [(2'h2):(1'h0)] reg212 = (1'h0);
  reg [(2'h3):(1'h0)] reg213 = (1'h0);
  reg [(5'h14):(1'h0)] reg214 = (1'h0);
  reg [(3'h4):(1'h0)] reg215 = (1'h0);
  reg signed [(4'he):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg221 = (1'h0);
  assign y = {wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire200,
                 wire201,
                 wire203,
                 wire217,
                 wire218,
                 wire219,
                 wire240,
                 reg202,
                 reg204,
                 reg205,
                 reg206,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 reg214,
                 reg215,
                 reg216,
                 reg220,
                 reg221,
                 (1'h0)};
  assign wire200 = $unsigned((wire198[(4'hb):(2'h2)] >>> ($unsigned((wire199 ?
                       wire199 : wire195)) || (((8'h9d) ?
                       (8'hb2) : wire195) ~^ wire196))));
  assign wire201 = wire196[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg202 <= (^$unsigned(({(wire200 ? wire199 : wire196), wire200} ?
          wire195 : (^~$signed((8'hb0))))));
    end
  assign wire203 = (8'hab);
  always
    @(posedge clk) begin
      reg204 <= $unsigned(($unsigned(((wire197 ?
          wire195 : (8'h9d)) & (-(8'ha8)))) >>> (($signed(wire198) < $signed(wire199)) >> $unsigned(wire203[(3'h4):(3'h4)]))));
      reg205 <= (|reg204[(3'h5):(3'h4)]);
      reg206 <= {(-($unsigned(wire201) ?
              $unsigned(wire199) : ((wire200 - reg205) ?
                  (|wire195) : {wire198, reg202})))};
      reg207 <= (-({$signed((wire197 ~^ (8'hb3))), $signed({reg204, wire195})} ?
          $signed(wire198[(4'hf):(3'h7)]) : ($unsigned(wire201) ?
              (^~(8'ha0)) : (wire196[(1'h0):(1'h0)] && $signed(wire196)))));
      if (((wire201 ? wire198[(1'h1):(1'h0)] : (8'haa)) == reg204))
        begin
          reg208 <= wire201[(3'h4):(2'h3)];
          reg209 <= ({wire201,
              ($unsigned((^reg207)) && ((~&(8'hb2)) ?
                  wire201[(4'hb):(4'h9)] : {wire200,
                      reg207}))} <= ($unsigned($signed((wire197 ?
                  wire199 : wire196))) ?
              reg202 : {($unsigned(reg208) <= ((8'hb1) ~^ wire203)), wire196}));
          if ((8'ha2))
            begin
              reg210 <= (8'ha4);
              reg211 <= (((+wire203) ? {(^~wire198)} : reg206) <<< wire201);
              reg212 <= reg209;
              reg213 <= $signed(($signed(reg209[(1'h0):(1'h0)]) ?
                  $signed($unsigned($unsigned(wire197))) : (+($signed(wire203) & (wire197 ?
                      wire196 : reg205)))));
            end
          else
            begin
              reg210 <= wire197[(3'h7):(1'h1)];
              reg211 <= $unsigned(wire195[(2'h3):(1'h1)]);
              reg212 <= ((~&((^~reg209[(1'h1):(1'h1)]) & wire201)) ?
                  (8'ha9) : reg205);
            end
          reg214 <= ((($signed($signed((8'hbd))) ?
                  $unsigned((wire201 == wire200)) : $signed((wire197 ?
                      reg209 : wire196))) ?
              wire196[(2'h3):(2'h2)] : (reg202 | $signed((wire197 ?
                  reg204 : reg213)))) >= (8'haa));
          reg215 <= wire200[(4'hc):(4'h9)];
        end
      else
        begin
          reg208 <= $signed(wire196);
          if (reg211[(3'h6):(1'h1)])
            begin
              reg209 <= reg208;
            end
          else
            begin
              reg209 <= wire195;
              reg210 <= ((((wire197 < (~reg202)) ?
                          ((&reg211) <= (7'h44)) : wire201) ?
                      ($unsigned(wire197) | reg210) : $unsigned($signed(((7'h44) ?
                          reg204 : (8'hb5))))) ?
                  wire197 : $signed((~|reg215[(2'h3):(1'h1)])));
            end
          reg211 <= (~(&$signed({reg210[(1'h1):(1'h0)], reg211})));
          reg212 <= (8'haa);
          if ($unsigned(wire198[(4'he):(2'h2)]))
            begin
              reg213 <= $unsigned((reg215 * ($signed({reg215,
                  wire199}) >= (wire200[(2'h2):(1'h0)] ?
                  (|reg208) : {wire201, (8'ha6)}))));
            end
          else
            begin
              reg213 <= (+reg213);
              reg214 <= (((&(~&$signed(reg212))) << reg210[(4'hf):(3'h4)]) ?
                  reg205 : $unsigned(wire198));
              reg215 <= {reg212[(2'h2):(2'h2)]};
              reg216 <= (8'h9e);
            end
        end
    end
  assign wire217 = reg202;
  assign wire218 = $signed((^reg211[(1'h0):(1'h0)]));
  assign wire219 = $signed({(($signed(wire217) > (wire200 + wire196)) ?
                           $unsigned(wire218[(1'h0):(1'h0)]) : ($unsigned(reg206) < {reg211})),
                       reg208[(3'h6):(3'h6)]});
  always
    @(posedge clk) begin
      reg220 <= ((reg215[(2'h3):(1'h0)] | $signed(reg214)) & $signed(reg213[(1'h1):(1'h1)]));
      reg221 <= $unsigned((8'hab));
    end
  module222 #() modinst241 (.wire225(reg214), .wire226(wire198), .wire223(wire218), .y(wire240), .wire224(wire197), .clk(clk));
  assign wire242 = reg204;
  assign wire243 = ((wire198 ?
                           ($signed((wire217 >= reg202)) ?
                               ((^wire242) ^~ $unsigned(reg211)) : $unsigned((|(8'h9d)))) : (((~^reg221) ^~ wire200) ?
                               (reg211[(2'h2):(1'h1)] & reg202) : (&((8'h9c) < wire217)))) ?
                       $unsigned((($signed(wire196) ?
                           (reg202 == (8'ha6)) : $signed(wire218)) ^ $signed($signed(reg216)))) : (reg208[(1'h0):(1'h0)] ?
                           wire199[(1'h0):(1'h0)] : reg213[(1'h0):(1'h0)]));
  assign wire244 = $unsigned((($signed(wire199) != ($signed(reg206) ?
                           {wire203, reg202} : {(8'hb5)})) ?
                       (8'hb3) : (-$signed(reg208[(3'h6):(2'h2)]))));
  assign wire245 = wire243[(4'ha):(4'h8)];
endmodule

module module140
#(parameter param190 = (|{{({(7'h44)} ? {(7'h41)} : ((8'ha3) ? (8'had) : (8'ha6))), (8'h9d)}, (^~(^(8'hab)))}))
(y, clk, wire144, wire143, wire142, wire141);
  output wire [(32'h20e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire144;
  input wire signed [(4'hf):(1'h0)] wire143;
  input wire [(3'h4):(1'h0)] wire142;
  input wire [(4'h9):(1'h0)] wire141;
  wire signed [(4'hf):(1'h0)] wire167;
  wire [(5'h14):(1'h0)] wire152;
  wire signed [(4'hd):(1'h0)] wire151;
  wire signed [(4'h8):(1'h0)] wire150;
  wire [(3'h6):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire148;
  wire signed [(5'h12):(1'h0)] wire145;
  reg signed [(4'hd):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg188 = (1'h0);
  reg [(4'hd):(1'h0)] reg187 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg186 = (1'h0);
  reg [(4'h8):(1'h0)] reg185 = (1'h0);
  reg signed [(4'he):(1'h0)] reg184 = (1'h0);
  reg [(2'h2):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg180 = (1'h0);
  reg [(5'h13):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg174 = (1'h0);
  reg [(5'h10):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg171 = (1'h0);
  reg signed [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  reg [(4'h9):(1'h0)] reg163 = (1'h0);
  reg [(3'h7):(1'h0)] reg162 = (1'h0);
  reg [(4'hc):(1'h0)] reg161 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg [(4'hb):(1'h0)] reg158 = (1'h0);
  reg [(5'h11):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg146 = (1'h0);
  assign y = {wire167,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire145,
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
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
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
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire145 = {(|($signed(wire143[(2'h3):(1'h0)]) >>> $signed((wire144 < wire143)))),
                       (wire144[(4'he):(4'hc)] ?
                           wire141[(2'h2):(1'h1)] : (($unsigned(wire142) ?
                                   wire141[(4'h9):(2'h3)] : (wire143 && wire144)) ?
                               $signed((wire142 ?
                                   wire143 : wire141)) : (wire141 * (~|wire142))))};
  always
    @(posedge clk) begin
      reg146 <= {wire142[(2'h2):(1'h0)]};
      reg147 <= wire143;
    end
  assign wire148 = wire143[(4'h9):(3'h5)];
  assign wire149 = reg146[(2'h3):(2'h2)];
  assign wire150 = wire149[(2'h3):(1'h1)];
  assign wire151 = (((+(wire143 ? $unsigned(wire148) : (8'hae))) ?
                       $unsigned((+wire143[(3'h7):(3'h5)])) : (reg146 ?
                           wire149 : wire143[(4'ha):(1'h1)])) > wire144[(5'h10):(1'h1)]);
  assign wire152 = reg147[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg153 <= $unsigned($unsigned((!((~|(8'hb6)) ?
          wire144[(2'h2):(1'h0)] : wire150))));
      reg154 <= (^(({(reg147 ? (8'ha1) : wire150),
                  (wire142 ? wire150 : wire143)} ?
              wire145 : ($unsigned((8'ha0)) ?
                  wire152[(1'h1):(1'h0)] : wire145)) ?
          wire149[(3'h6):(1'h0)] : ({{wire150}, {reg147}} ?
              $unsigned((wire142 ?
                  wire151 : wire143)) : $signed((wire143 || wire144)))));
      reg155 <= ($unsigned((^((wire142 ? (7'h43) : (8'hbf)) ?
          (wire151 ?
              (8'hac) : wire151) : $unsigned((8'hac))))) - ({{(wire143 >> reg153)}} ?
          ($unsigned(wire141) ?
              $unsigned((wire148 ^ wire145)) : $unsigned($signed(wire141))) : (wire143 ?
              ((wire145 >> reg147) * $unsigned(wire150)) : (!$signed(wire150)))));
      if ((($unsigned((~wire144)) ?
              $signed($unsigned($unsigned(reg155))) : {$unsigned((reg154 != reg146))}) ?
          (&$signed($unsigned(((8'hbd) ? reg146 : wire143)))) : ((~({wire152,
                  (8'haa)} & (wire143 >= reg154))) ?
              $unsigned($unsigned($signed(wire151))) : wire142[(2'h3):(1'h1)])))
        begin
          reg156 <= (reg147[(1'h1):(1'h0)] & $signed((!(|$signed(wire142)))));
        end
      else
        begin
          reg156 <= wire148;
        end
      reg157 <= (-reg156);
    end
  always
    @(posedge clk) begin
      reg158 <= $signed({wire149[(1'h0):(1'h0)]});
      reg159 <= wire143[(1'h0):(1'h0)];
      reg160 <= ($signed(wire145) + (((~|wire152) ~^ (~^reg153[(3'h5):(1'h0)])) ?
          wire144 : (!((wire150 ? reg153 : wire141) && wire152))));
      reg161 <= reg153[(4'hb):(3'h4)];
      if (wire148)
        begin
          reg162 <= ($signed(reg154) ?
              (~&({(reg159 ? wire148 : wire148),
                  wire151[(3'h6):(1'h1)]} ^ ($signed(reg146) ?
                  $unsigned(wire143) : $signed(reg160)))) : ($unsigned((&(reg160 ?
                      (8'h9d) : (8'hbd)))) ?
                  ($signed(wire141[(2'h3):(1'h0)]) ?
                      wire143 : $unsigned($signed(wire141))) : {$unsigned($unsigned((8'hb7)))}));
          reg163 <= {wire152[(5'h11):(4'hb)]};
          reg164 <= (wire144 ?
              $unsigned((^reg147[(1'h1):(1'h0)])) : $signed($signed(reg146)));
          reg165 <= (((({(8'h9c)} ?
              ((8'h9f) * wire143) : (reg164 ?
                  wire144 : (8'hbe))) == reg163[(3'h6):(1'h0)]) >= (-(reg163 && reg160[(1'h0):(1'h0)]))) ^ reg158);
          reg166 <= (8'hb8);
        end
      else
        begin
          reg162 <= (~|(^(wire142[(1'h1):(1'h0)] ? reg162 : (-(!reg166)))));
        end
    end
  assign wire167 = $unsigned(wire144);
  always
    @(posedge clk) begin
      reg168 <= ($unsigned($signed(reg156)) ?
          (wire149 ?
              ((~&$signed(reg163)) ?
                  ($unsigned(reg165) <<< (wire152 >= (8'hac))) : ((wire144 ?
                          reg159 : wire143) ?
                      $signed(wire145) : ((8'hba) ?
                          (8'h9e) : wire145))) : (((reg158 ? reg162 : (8'hb6)) ?
                      $signed((7'h41)) : reg157[(4'he):(1'h0)]) ?
                  $signed({reg155}) : (~^reg154[(4'h8):(4'h8)]))) : $signed((reg161[(3'h6):(3'h4)] >>> $unsigned($unsigned((8'hb0))))));
      if ((^~($signed((^(wire148 >> reg159))) & reg166[(1'h0):(1'h0)])))
        begin
          reg169 <= $signed((^{reg159,
              ((8'ha6) ? (reg155 ? reg166 : reg156) : wire144)}));
          if (reg153[(4'hf):(3'h5)])
            begin
              reg170 <= reg163;
              reg171 <= $unsigned((reg159 << (8'hb2)));
              reg172 <= ($signed($signed($unsigned($signed((8'hb2))))) ?
                  reg153 : (-reg171));
              reg173 <= ((+$signed(reg154)) >>> $signed($unsigned($signed({reg147}))));
            end
          else
            begin
              reg170 <= (^$unsigned((+$unsigned((8'ha1)))));
            end
        end
      else
        begin
          if (wire145)
            begin
              reg169 <= $signed((~&reg159[(5'h13):(4'he)]));
            end
          else
            begin
              reg169 <= wire145[(5'h10):(3'h6)];
              reg170 <= $unsigned(($unsigned(reg163[(3'h4):(3'h4)]) - ({{wire149}} ?
                  reg147[(1'h0):(1'h0)] : reg162[(2'h3):(1'h0)])));
              reg171 <= ({(wire145[(5'h10):(4'hd)] - ($unsigned(reg172) ?
                      $unsigned(wire144) : (~&wire149)))} ~^ wire143);
              reg172 <= ((~$signed(((^(8'hba)) ?
                      $signed(wire145) : wire141[(3'h6):(3'h5)]))) ?
                  reg157 : (reg160[(3'h7):(2'h2)] != $signed((reg156 ?
                      (~^reg146) : $signed(reg156)))));
            end
        end
      reg174 <= $signed($signed(($signed($unsigned(reg164)) ?
          wire150 : (+wire152))));
      if ($signed(((^$unsigned($signed(reg159))) | $signed($unsigned(reg169)))))
        begin
          if (reg155)
            begin
              reg175 <= $unsigned(wire152[(3'h6):(2'h2)]);
              reg176 <= $unsigned((~(wire141 ~^ $signed(wire145))));
              reg177 <= {reg153[(1'h0):(1'h0)]};
            end
          else
            begin
              reg175 <= ({wire141[(4'h8):(3'h6)]} <= (reg147[(1'h1):(1'h0)] ?
                  reg173[(3'h4):(1'h0)] : $unsigned(($unsigned((8'hb0)) ?
                      (reg163 != reg175) : reg168[(2'h2):(2'h2)]))));
              reg176 <= reg161[(4'ha):(4'h8)];
              reg177 <= ($unsigned(reg166) | $signed((^$signed((wire167 & reg157)))));
              reg178 <= ((wire152 & (wire145[(4'h9):(4'h8)] ?
                  (~&(~(8'hb4))) : (((8'hbc) << reg146) > (reg166 ?
                      reg163 : wire141)))) - $signed({$unsigned((~reg171))}));
              reg179 <= (reg171[(4'ha):(3'h7)] <= $signed((~&$signed((&wire148)))));
            end
          reg180 <= (8'ha0);
          reg181 <= (wire142 >> $unsigned({((^~reg165) ?
                  $unsigned(reg175) : reg171[(4'h9):(4'h8)])}));
          reg182 <= ($signed((reg153[(3'h5):(3'h4)] + $signed({reg154}))) ?
              ((reg173[(2'h3):(2'h2)] < $unsigned($signed(reg176))) * $signed(wire151)) : ((~((~&(8'hb4)) <<< $unsigned((7'h44)))) ?
                  (!(~((8'hb6) ^ (8'had)))) : (reg166[(3'h6):(1'h1)] ?
                      $signed($unsigned(wire143)) : ({reg146} ?
                          $signed((8'ha0)) : reg160))));
        end
      else
        begin
          if ((!(&$signed($unsigned((^reg153))))))
            begin
              reg175 <= ($signed($unsigned(($unsigned(reg165) <= wire145))) & reg159[(4'h9):(3'h6)]);
              reg176 <= reg154[(1'h0):(1'h0)];
            end
          else
            begin
              reg175 <= reg180;
              reg176 <= $signed(((&reg179[(5'h10):(3'h4)]) * (((~reg173) ?
                  reg177[(4'hf):(2'h3)] : $signed(reg169)) >= ((reg173 ?
                      (8'ha3) : reg179) ?
                  $signed(reg162) : reg160))));
            end
          if (reg181)
            begin
              reg177 <= reg158[(4'hb):(3'h4)];
              reg178 <= $unsigned($signed(reg161));
              reg179 <= reg176[(2'h2):(1'h0)];
            end
          else
            begin
              reg177 <= $unsigned($signed((7'h44)));
              reg178 <= $unsigned($unsigned(wire141[(3'h4):(2'h2)]));
              reg179 <= (7'h44);
              reg180 <= ((8'h9d) >>> (reg147 >= reg181[(2'h2):(2'h2)]));
            end
          reg181 <= $unsigned(reg176);
          reg182 <= reg155;
          reg183 <= $unsigned({reg158[(4'hb):(4'h8)],
              {($signed(reg147) ?
                      $unsigned(reg178) : (reg159 ? reg162 : reg177))}});
        end
      if (reg171)
        begin
          reg184 <= (($unsigned($unsigned($unsigned(wire152))) ?
                  reg181 : $signed(wire142[(2'h2):(2'h2)])) ?
              $unsigned($signed((~&reg163))) : $unsigned(reg182[(2'h3):(2'h2)]));
          if (reg182)
            begin
              reg185 <= reg183[(1'h1):(1'h1)];
            end
          else
            begin
              reg185 <= $unsigned((({reg162[(3'h7):(3'h5)]} && ($signed(reg153) ^ reg184[(1'h1):(1'h1)])) ?
                  ((wire144[(3'h6):(3'h6)] != $signed(wire144)) >>> (-$signed(reg182))) : $signed($unsigned(reg165))));
              reg186 <= $unsigned(reg174[(3'h5):(3'h5)]);
              reg187 <= $signed((8'haf));
              reg188 <= ($unsigned($unsigned($signed((|wire142)))) < ((^{(wire143 ?
                      (7'h41) : wire145),
                  wire141[(2'h3):(1'h1)]}) | (reg186 && (-$signed((8'hbb))))));
            end
          reg189 <= ($signed($unsigned(($signed(reg147) ?
                  (reg188 != (8'ha3)) : reg157))) ?
              wire143[(3'h7):(3'h6)] : reg156);
        end
      else
        begin
          reg184 <= reg169;
          reg185 <= reg147[(2'h2):(1'h0)];
        end
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h21c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire133;
  wire [(4'h8):(1'h0)] wire132;
  wire signed [(4'h8):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire130;
  wire [(3'h7):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire116;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(5'h13):(1'h0)] wire113;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire45,
                 wire43,
                 wire27,
                 wire26,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= (wire10[(4'hb):(2'h2)] <<< {wire10,
          (~(((8'haf) ? (8'h9d) : wire8) ^~ $signed(wire6)))});
      reg12 <= (~$unsigned($unsigned(wire6[(1'h1):(1'h0)])));
      reg13 <= ($signed($signed($signed({wire7}))) ?
          wire8[(3'h5):(3'h4)] : $unsigned($unsigned($unsigned((wire6 ?
              wire10 : reg11)))));
      reg14 <= (wire7 ?
          (($signed($unsigned(reg12)) || reg12[(4'ha):(3'h5)]) <= $unsigned((reg13 > $signed(wire7)))) : reg12[(1'h1):(1'h0)]);
      if (reg13[(4'h8):(3'h4)])
        begin
          reg15 <= {reg13[(2'h2):(1'h0)], reg11[(2'h3):(2'h2)]};
          reg16 <= ($unsigned(wire6) || {wire6});
          reg17 <= (reg16[(1'h0):(1'h0)] ?
              reg16 : ({$unsigned($signed((8'hbc)))} <<< $signed($unsigned(((8'hb7) ?
                  wire9 : reg14)))));
          reg18 <= $signed(reg16);
        end
      else
        begin
          if ((!((8'h9e) ^~ ((~^{reg17}) ? wire7 : reg13[(3'h7):(1'h0)]))))
            begin
              reg15 <= (({$unsigned((reg15 ? wire9 : wire6)),
                      $signed((reg16 ? wire10 : reg14))} ?
                  (reg13 ?
                      ((wire8 ? (7'h44) : wire8) ?
                          $signed(wire7) : (reg15 == (7'h43))) : $signed((reg16 ?
                          reg11 : (8'hbc)))) : $unsigned(reg11)) && $unsigned($signed(((reg17 ~^ reg14) - wire6))));
              reg16 <= wire9[(3'h7):(1'h1)];
            end
          else
            begin
              reg15 <= $unsigned(reg18);
              reg16 <= reg11;
              reg17 <= ({(8'hb0),
                  (-((7'h43) ^~ (-wire7)))} > ($signed(reg14) >>> $unsigned({reg11[(3'h6):(3'h5)],
                  (8'hb8)})));
              reg18 <= wire7[(2'h2):(1'h0)];
            end
          reg19 <= {$signed(reg12)};
          if ((wire7[(2'h2):(1'h0)] ?
              {$signed((reg17[(1'h1):(1'h0)] >= reg16[(4'h9):(1'h1)])),
                  (8'hac)} : $unsigned($signed((reg19 <<< $unsigned((8'ha4)))))))
            begin
              reg20 <= ($unsigned((~{{reg16}})) ^ reg18);
            end
          else
            begin
              reg20 <= ($signed({reg14, {(reg11 ? (8'hb8) : reg12)}}) ?
                  reg15[(1'h1):(1'h0)] : (wire7[(1'h0):(1'h0)] ?
                      reg12 : $unsigned((reg12[(3'h6):(3'h4)] ?
                          (|reg14) : reg17))));
              reg21 <= ((~(!((reg11 ^ wire7) != wire7[(1'h1):(1'h1)]))) ?
                  (8'hbc) : reg15[(3'h7):(3'h4)]);
              reg22 <= $signed(($signed({(~&reg19),
                  $signed(wire10)}) << (((!reg11) < $signed(reg12)) ?
                  (~^(reg12 >= reg12)) : $unsigned($unsigned(reg15)))));
              reg23 <= reg16[(2'h3):(1'h1)];
              reg24 <= reg13[(3'h4):(2'h2)];
            end
          reg25 <= ((reg15 ?
                  $signed((wire9[(4'hb):(1'h0)] ?
                      $unsigned((8'hb4)) : $signed(reg23))) : $unsigned(((wire10 ?
                      reg12 : reg17) & (|wire10)))) ?
              reg16[(1'h1):(1'h0)] : ((reg22[(2'h3):(1'h0)] != (!(|wire9))) ^ reg22));
        end
    end
  assign wire26 = ($signed($signed(((-(8'hac)) < reg18[(2'h2):(2'h2)]))) ~^ reg16[(3'h7):(1'h0)]);
  assign wire27 = ((~|reg25[(4'hc):(2'h3)]) ?
                      $unsigned($signed($unsigned($unsigned(reg18)))) : reg11[(4'hc):(1'h0)]);
  module28 #() modinst44 (wire43, clk, wire27, reg15, wire7, reg25, reg11);
  assign wire45 = wire10;
  always
    @(posedge clk) begin
      if ($signed((wire9[(4'ha):(3'h7)] || reg14[(2'h2):(1'h1)])))
        begin
          if ({$unsigned($signed(wire27[(4'hc):(1'h0)]))})
            begin
              reg46 <= (~wire8[(3'h7):(2'h2)]);
            end
          else
            begin
              reg46 <= (($unsigned({$unsigned(reg17)}) ?
                      {$signed((reg15 ? reg13 : reg18))} : $signed((~|(reg14 ?
                          (7'h41) : reg14)))) ?
                  ({$unsigned($unsigned((8'ha4))), (!wire8[(3'h6):(2'h2)])} ?
                      wire27 : (8'ha2)) : $signed($signed(reg22)));
              reg47 <= (($signed($signed((reg12 ? (8'haa) : reg14))) ?
                  (reg46[(3'h7):(3'h6)] * $unsigned((reg23 ?
                      reg14 : reg13))) : {(wire43 ?
                          $signed(wire8) : (reg15 ?
                              wire10 : wire7))}) == (~^reg18[(2'h2):(2'h2)]));
              reg48 <= reg14[(3'h5):(3'h5)];
              reg49 <= reg13[(3'h5):(1'h0)];
            end
        end
      else
        begin
          reg46 <= {(-$unsigned(reg17)), reg18[(2'h2):(2'h2)]};
        end
      reg50 <= $unsigned($unsigned(wire6[(3'h4):(1'h0)]));
      reg51 <= $signed((~|{{{wire43, reg22}, wire27}}));
      reg52 <= wire6[(3'h4):(2'h3)];
      reg53 <= reg50[(3'h7):(3'h5)];
    end
  module54 #() modinst114 (.wire56(wire45), .wire55(wire26), .y(wire113), .wire58(reg22), .clk(clk), .wire57(reg12));
  assign wire115 = (~|(^~(|($unsigned(reg22) - reg47[(2'h3):(1'h0)]))));
  assign wire116 = (|({reg16} ?
                       (({(8'hb4), wire113} ^ $signed(reg17)) ?
                           (&reg21) : {reg22}) : $unsigned({reg21,
                           $unsigned(wire7)})));
  assign wire117 = (~wire45);
  assign wire118 = (reg51[(3'h4):(1'h0)] ?
                       reg25[(1'h0):(1'h0)] : ((reg49[(4'ha):(4'h9)] < $signed({reg23})) * $signed(reg51)));
  assign wire119 = $unsigned((reg53[(2'h2):(2'h2)] ?
                       reg15[(1'h0):(1'h0)] : (reg47 ?
                           (|$unsigned(reg24)) : {reg22[(3'h6):(1'h1)],
                               reg23})));
  always
    @(posedge clk) begin
      reg120 <= $unsigned($unsigned({$unsigned($unsigned(reg24)),
          $signed(((8'ha1) <<< (7'h41)))}));
      if ($signed((&$signed(($unsigned(wire117) ?
          {wire115, wire43} : (-wire115))))))
        begin
          reg121 <= reg12;
          if ((^~reg11[(4'he):(4'h9)]))
            begin
              reg122 <= $unsigned(($signed(($unsigned(reg25) << $unsigned(reg16))) & (-((reg48 ?
                      wire118 : (8'hbe)) ?
                  reg16[(3'h7):(3'h5)] : (~|reg20)))));
              reg123 <= reg23;
            end
          else
            begin
              reg122 <= (+reg49[(4'hc):(3'h5)]);
              reg123 <= ($unsigned((($signed(wire113) ?
                      wire118 : (reg53 ? reg18 : wire10)) ?
                  {wire118[(1'h1):(1'h0)]} : ((reg121 | reg18) < reg20))) & ($unsigned({reg14}) ?
                  {$signed(reg15), $signed((^~reg16))} : wire6));
            end
          reg124 <= reg15;
          reg125 <= $signed(reg15[(2'h2):(2'h2)]);
          if (reg24)
            begin
              reg126 <= (((reg123[(4'hc):(4'hb)] ?
                  wire119 : (((8'hb0) & reg124) ?
                      reg49 : ((8'h9f) - wire8))) || ((8'ha1) ?
                  reg51 : reg53)) >= reg124);
            end
          else
            begin
              reg126 <= ((&(|reg11)) + reg53[(2'h3):(1'h1)]);
              reg127 <= (reg50[(3'h6):(2'h3)] ?
                  reg47[(2'h2):(1'h1)] : ((((^reg16) + (reg53 ?
                              reg20 : reg11)) ?
                          (^~(&wire26)) : reg19[(5'h12):(4'ha)]) ?
                      $signed(((~wire8) ?
                          reg24[(3'h7):(3'h7)] : (reg123 ?
                              wire9 : reg25))) : $unsigned($signed((reg121 ?
                          reg123 : reg17)))));
              reg128 <= reg18[(3'h5):(1'h0)];
            end
        end
      else
        begin
          reg121 <= reg21;
          if (reg126[(3'h4):(1'h1)])
            begin
              reg122 <= {wire43[(1'h1):(1'h0)]};
              reg123 <= reg123;
              reg124 <= ((^~(reg15 ?
                      $unsigned((wire43 | reg22)) : (~|wire116[(2'h3):(1'h0)]))) ?
                  {$signed(($unsigned(wire113) + (reg47 ?
                          reg15 : reg19)))} : wire7);
              reg125 <= {({wire7[(2'h2):(2'h2)]} > (~^$signed({reg16, reg19}))),
                  (8'hbc)};
            end
          else
            begin
              reg122 <= $signed((($signed(reg14[(3'h4):(2'h2)]) != {reg46,
                      (wire115 <= reg21)}) ?
                  $unsigned(reg50[(1'h0):(1'h0)]) : ($signed((~^(8'ha1))) ?
                      $signed($unsigned(reg53)) : reg12[(1'h0):(1'h0)])));
              reg123 <= (($unsigned(($signed(wire45) ?
                      $signed(reg52) : $signed(reg25))) <= wire7[(2'h2):(2'h2)]) ?
                  reg20[(5'h14):(4'h8)] : $unsigned($signed($unsigned(reg13))));
            end
          if ($signed(reg50[(2'h3):(1'h1)]))
            begin
              reg126 <= (~^reg51[(1'h1):(1'h1)]);
              reg127 <= $signed($signed((!reg19)));
            end
          else
            begin
              reg126 <= ((~|{(^(reg19 ^~ wire118)),
                  (reg46[(4'hd):(2'h2)] <<< {reg124})}) | wire6);
            end
        end
    end
  assign wire129 = ({(~$unsigned((~wire10))),
                       reg22[(5'h10):(2'h3)]} ~^ wire7[(2'h3):(1'h1)]);
  assign wire130 = wire43[(3'h4):(1'h1)];
  assign wire131 = reg50[(4'h9):(4'h8)];
  assign wire132 = (((reg128[(1'h1):(1'h1)] ?
                               $unsigned((wire26 ?
                                   wire27 : reg52)) : $unsigned((~reg22))) ?
                           ({reg120[(1'h0):(1'h0)],
                                   ((8'haa) ? reg127 : reg128)} ?
                               ((~|(8'ha1)) && $signed(reg126)) : {(^wire130)}) : wire7) ?
                       $unsigned($signed(wire9[(3'h4):(1'h1)])) : $unsigned($unsigned($unsigned((-reg15)))));
  assign wire133 = wire43[(3'h5):(2'h3)];
  assign wire134 = wire9[(3'h6):(2'h3)];
endmodule

module module54
#(parameter param112 = {(((+(8'h9c)) ? ((-(8'hb7)) >> (~|(8'had))) : ((^(8'ha7)) ? (|(8'hb3)) : {(8'ha8), (8'hbb)})) >>> ((+{(7'h40)}) ? ((~(8'hbb)) < ((8'ha1) | (8'ha6))) : {{(7'h44)}}))})
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h281):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire58;
  input wire [(4'hc):(1'h0)] wire57;
  input wire signed [(3'h4):(1'h0)] wire56;
  input wire signed [(4'hc):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire111;
  wire [(4'hb):(1'h0)] wire108;
  wire signed [(3'h6):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  assign y = {wire111,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire74,
                 wire73,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg110,
                 reg109,
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
                 reg92,
                 reg91,
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
                 reg72,
                 reg71,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg59 <= ((wire57[(4'hb):(4'h8)] <= $unsigned(((wire58 ?
                  wire56 : wire58) ?
              wire58 : (wire58 | wire57)))) ?
          ($signed(wire57) != wire57) : wire58[(4'hd):(1'h0)]);
      reg60 <= ((^($unsigned((wire55 ?
          (8'ha7) : wire56)) && wire56[(1'h1):(1'h0)])) > {wire58,
          $unsigned(($signed(wire56) ? reg59 : (wire55 <= wire57)))});
      reg61 <= $signed(wire55);
      reg62 <= $signed(wire56);
      reg63 <= $unsigned({(&$signed((reg62 ? wire55 : wire56))),
          ($signed((|wire55)) ?
              ($signed(wire55) ? wire55[(1'h0):(1'h0)] : {(8'hb5)}) : ({reg62,
                      wire58} ?
                  (~^reg59) : {wire58, wire56}))});
    end
  assign wire64 = ({{(wire57[(4'hc):(1'h0)] + (wire55 ? wire57 : wire58)),
                              reg61}} ?
                      (($signed((8'hb1)) ?
                          $signed((wire55 * reg59)) : wire58[(3'h7):(3'h7)]) << ((8'hb6) <<< ($unsigned(reg62) ?
                          (&reg59) : (8'hb9)))) : {$signed((^(wire57 ^ reg59)))});
  assign wire65 = ((reg59[(1'h1):(1'h1)] << $signed(((wire56 ?
                              (8'haf) : wire64) ?
                          (|(8'haa)) : (reg61 | reg61)))) ?
                      (-reg63[(4'h8):(3'h6)]) : (wire64[(4'hd):(4'h8)] ?
                          wire58[(3'h4):(1'h1)] : $unsigned(((reg61 ?
                              reg62 : wire55) + $signed(reg59)))));
  assign wire66 = (!reg62);
  assign wire67 = ({reg59} ?
                      wire66 : ((reg59[(1'h0):(1'h0)] ?
                          wire66[(1'h1):(1'h1)] : (wire57 ?
                              $unsigned(wire64) : wire65[(2'h2):(1'h0)])) ^~ reg63));
  assign wire68 = (8'hb7);
  assign wire69 = (~&wire66);
  assign wire70 = $unsigned({$signed((^wire67[(5'h10):(4'hf)]))});
  always
    @(posedge clk) begin
      reg71 <= (-reg59);
      reg72 <= ($signed((|$signed((-reg61)))) ?
          ((~(^wire64[(4'ha):(3'h6)])) ^ ({reg61, $signed((8'hb9))} ?
              reg61 : $signed((wire70 ?
                  wire69 : (8'ha2))))) : (($signed((wire64 ?
              reg59 : wire58)) ~^ reg59[(2'h2):(2'h2)]) * wire70[(3'h7):(1'h1)]));
    end
  assign wire73 = wire58[(4'he):(4'hd)];
  assign wire74 = wire65;
  always
    @(posedge clk) begin
      reg75 <= reg71[(4'h8):(1'h0)];
      if ($unsigned((~|((~^$signed((8'hbd))) ^~ $unsigned((~&reg71))))))
        begin
          reg76 <= reg72;
          reg77 <= (^~((reg75[(3'h7):(2'h3)] >= ((wire70 ?
              (8'hb0) : wire73) <= {reg59, reg75})) >>> $unsigned(((wire55 ?
              wire65 : reg72) || wire74))));
          reg78 <= wire67[(5'h13):(4'h9)];
          if (wire73[(2'h2):(1'h0)])
            begin
              reg79 <= wire57;
              reg80 <= wire64;
            end
          else
            begin
              reg79 <= ((reg72 - ($signed(wire73[(1'h1):(1'h1)]) | $signed($signed(wire64)))) ?
                  $unsigned({wire64,
                      ($signed(wire73) << (wire68 ~^ (8'hae)))}) : ($signed((((8'hae) >> reg72) ?
                      $unsigned(reg61) : (&(7'h43)))) | ($signed((!wire74)) ?
                      wire64[(4'he):(4'h8)] : ((+reg76) & reg80[(5'h12):(1'h0)]))));
            end
          reg81 <= {reg79};
        end
      else
        begin
          reg76 <= wire66[(4'hd):(4'hc)];
          reg77 <= wire70;
          reg78 <= (8'hbb);
        end
      reg82 <= reg63;
      if ($unsigned($unsigned(reg60[(5'h12):(2'h2)])))
        begin
          reg83 <= wire69;
          reg84 <= $signed($signed((reg60 || (((8'hab) ? reg80 : reg83) ?
              (wire57 ? reg61 : reg83) : reg77))));
          if (reg75)
            begin
              reg85 <= $signed(reg61);
            end
          else
            begin
              reg85 <= $unsigned((~&wire56));
              reg86 <= reg78;
              reg87 <= wire73;
              reg88 <= $signed($unsigned(wire58));
            end
          if (reg84)
            begin
              reg89 <= (8'ha0);
              reg90 <= (~^wire65);
              reg91 <= ($unsigned(($unsigned((&reg59)) ?
                      reg78[(2'h3):(2'h2)] : wire57[(1'h0):(1'h0)])) ?
                  $unsigned(($signed(reg60[(5'h15):(3'h5)]) ?
                      {(^~reg75),
                          $signed(reg61)} : (~|wire74[(3'h5):(3'h5)]))) : (($signed(reg90[(1'h0):(1'h0)]) >>> wire64) ?
                      $signed((reg79[(4'hb):(1'h0)] & (reg80 ?
                          wire57 : reg61))) : $signed(wire58)));
              reg92 <= (($unsigned((8'ha1)) >>> (((-wire58) ?
                      wire68 : (!reg76)) ?
                  $unsigned($signed(reg83)) : reg88[(1'h0):(1'h0)])) << reg90);
              reg93 <= (~|wire57[(4'h9):(3'h5)]);
            end
          else
            begin
              reg89 <= reg83[(2'h2):(2'h2)];
              reg90 <= $unsigned(((8'had) ?
                  wire69[(3'h5):(3'h5)] : reg87[(3'h4):(3'h4)]));
              reg91 <= reg82;
            end
          reg94 <= reg78;
        end
      else
        begin
          reg83 <= ($unsigned(($signed(reg61[(4'ha):(3'h4)]) && ((wire67 ?
                      reg89 : reg72) ?
                  ((8'hb0) ? wire70 : (8'hb8)) : $unsigned(reg83)))) ?
              $signed($unsigned((~{reg82,
                  reg90}))) : (~{reg62[(4'he):(4'hb)]}));
          reg84 <= (~{reg83, (wire66 ? $signed($unsigned(reg87)) : reg90)});
        end
      if (($unsigned($signed(reg82[(3'h6):(2'h2)])) >> (8'h9d)))
        begin
          reg95 <= reg88;
          reg96 <= {(reg90 ?
                  (~$signed($signed(wire58))) : $signed(wire73[(3'h6):(1'h1)])),
              (((((8'ha9) <= wire66) | (reg63 ? wire67 : reg61)) ?
                      (-$signed((7'h40))) : (((7'h44) ?
                          reg61 : reg85) ^ (wire73 * reg75))) ?
                  ($signed({(7'h44),
                      wire57}) >> wire58[(4'h9):(4'h9)]) : $signed((!(reg82 ?
                      reg60 : (8'hbc)))))};
          if ((($unsigned({wire66[(4'he):(1'h1)], reg62[(2'h3):(2'h3)]}) ?
              (~|(^$signed(reg72))) : (-(7'h43))) == (|{$unsigned($signed(reg60))})))
            begin
              reg97 <= reg96[(1'h0):(1'h0)];
            end
          else
            begin
              reg97 <= ($unsigned(((reg62[(3'h7):(3'h6)] ?
                      (reg60 ? reg80 : wire68) : (reg75 ?
                          wire58 : reg86)) - reg96)) ?
                  $signed({($unsigned(reg90) ?
                          $signed(reg84) : (&wire65))}) : (((~|((8'ha0) ~^ reg96)) ?
                      ($signed(wire66) * (reg93 ?
                          reg63 : reg60)) : reg84[(2'h2):(2'h2)]) * (^((~|reg83) - wire65))));
            end
          reg98 <= $unsigned($signed(($signed(wire55[(1'h0):(1'h0)]) <= ($signed(reg83) ?
              (wire56 ? reg85 : reg61) : (!reg75)))));
        end
      else
        begin
          reg95 <= wire73[(3'h6):(3'h4)];
          if (($signed($signed((+(~&reg80)))) ?
              ((8'hba) ?
                  $signed($signed($unsigned(reg77))) : reg96[(5'h13):(3'h7)]) : (reg93 ?
                  reg62[(4'hc):(4'hb)] : $signed(wire66))))
            begin
              reg96 <= ((reg63 - {reg78}) <= (8'hbc));
              reg97 <= wire67[(4'h9):(4'h9)];
              reg98 <= reg60[(4'h8):(3'h6)];
              reg99 <= reg93;
              reg100 <= $unsigned((7'h44));
            end
          else
            begin
              reg96 <= (|$unsigned(wire73));
              reg97 <= $signed(reg63);
              reg98 <= ((reg60[(4'hd):(2'h3)] + (reg100[(4'hb):(2'h2)] && ($signed(reg59) ?
                  (8'hbb) : $signed((8'hb6))))) - reg83[(3'h7):(2'h2)]);
            end
          reg101 <= ({$signed({reg89, (~&(7'h43))})} != ((8'hb9) ?
              (reg97 ?
                  $unsigned(wire65[(2'h2):(2'h2)]) : reg78[(2'h3):(1'h0)]) : $unsigned($signed({reg80}))));
          if ({reg97[(2'h2):(2'h2)]})
            begin
              reg102 <= ($unsigned(((reg86 ?
                      $unsigned(wire66) : (reg91 ? reg97 : reg76)) ?
                  $signed(reg78) : (^~reg84[(3'h4):(2'h2)]))) + $unsigned((reg96[(4'hb):(4'hb)] << (8'hbb))));
              reg103 <= $signed(((8'hab) ?
                  (-($unsigned((8'hb8)) ^ (reg91 || reg78))) : $signed(reg92[(4'hb):(4'hb)])));
              reg104 <= (7'h43);
            end
          else
            begin
              reg102 <= reg59;
              reg103 <= (reg86[(1'h0):(1'h0)] ?
                  $signed((8'h9d)) : reg92[(4'ha):(2'h2)]);
              reg104 <= (!(|(8'hb0)));
            end
        end
    end
  assign wire105 = reg75[(1'h0):(1'h0)];
  assign wire106 = reg84[(1'h1):(1'h1)];
  assign wire107 = $unsigned((wire106[(3'h4):(1'h1)] ?
                       {$signed($unsigned(reg87))} : (~|{$signed(reg72),
                           $unsigned(reg100)})));
  assign wire108 = reg82[(4'h9):(3'h5)];
  always
    @(posedge clk) begin
      reg109 <= (wire107 <<< reg86);
      reg110 <= ($unsigned($signed(reg82[(5'h14):(3'h4)])) ?
          ((^(wire55 * (reg76 ?
              wire58 : reg87))) <<< wire73) : ((~^reg61) ^~ $signed((!(&reg60)))));
    end
  assign wire111 = {{{(!(reg63 >>> wire67)),
                               ($unsigned(wire73) ?
                                   $unsigned(wire56) : (reg86 ?
                                       reg62 : reg76))},
                           (~|{reg101[(3'h7):(3'h4)]})},
                       ((~|$signed($unsigned(reg76))) <<< ({(reg102 ?
                               reg77 : reg79)} - $signed((|reg99))))};
endmodule

module module28
#(parameter param42 = (((~^(((8'hb6) ? (8'h9c) : (8'ha3)) ? ((8'hb1) ? (8'ha9) : (8'ha4)) : (^~(8'h9c)))) && (!(|(~(8'ha0))))) << (((((8'hae) ? (8'haf) : (8'h9c)) ? (&(8'hb1)) : (+(8'hb7))) ~^ ({(8'ha8)} * {(8'ha6), (8'ha1)})) || (({(8'ha1), (7'h40)} ? ((8'h9e) && (8'hb7)) : ((8'hbe) || (8'h9f))) ? ((~&(8'haf)) ? (&(8'hae)) : ((8'hae) ? (8'hb6) : (7'h44))) : {{(8'ha1)}}))))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire33;
  input wire [(4'hb):(1'h0)] wire32;
  input wire signed [(3'h4):(1'h0)] wire31;
  input wire signed [(4'hd):(1'h0)] wire30;
  input wire [(4'hc):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 (1'h0)};
  assign wire34 = $signed($unsigned(wire29[(2'h2):(1'h1)]));
  assign wire35 = ((^~(~^$signed(wire33[(4'h9):(3'h5)]))) ?
                      (wire34 ?
                          (7'h41) : ($signed((^~wire32)) ?
                              $unsigned((wire33 > wire30)) : $unsigned(((8'had) ?
                                  wire34 : wire31)))) : (wire32[(3'h7):(2'h2)] & $signed(wire34[(4'hc):(2'h3)])));
  assign wire36 = $unsigned(((wire35[(1'h0):(1'h0)] ^~ ((wire31 || wire30) ?
                      $signed(wire31) : $signed((8'h9f)))) < ($signed((wire30 ?
                          wire32 : wire35)) ?
                      wire34 : wire29[(2'h2):(1'h0)])));
  assign wire37 = (wire29 > wire30[(3'h6):(1'h0)]);
  assign wire38 = ($unsigned($unsigned({((8'ha4) & wire33)})) <= ($unsigned($unsigned({wire32,
                          wire32})) ?
                      $signed($signed(wire37[(4'hc):(2'h2)])) : wire33));
  assign wire39 = wire34;
  assign wire40 = wire31[(1'h0):(1'h0)];
  assign wire41 = wire37[(1'h0):(1'h0)];
endmodule

module module222  (y, clk, wire226, wire225, wire224, wire223);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire226;
  input wire [(4'hc):(1'h0)] wire225;
  input wire [(4'hc):(1'h0)] wire224;
  input wire signed [(4'h9):(1'h0)] wire223;
  wire [(3'h5):(1'h0)] wire239;
  wire [(5'h12):(1'h0)] wire232;
  wire signed [(3'h7):(1'h0)] wire231;
  wire signed [(5'h10):(1'h0)] wire230;
  wire signed [(4'hb):(1'h0)] wire227;
  reg signed [(3'h5):(1'h0)] reg238 = (1'h0);
  reg [(5'h11):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg235 = (1'h0);
  reg [(5'h11):(1'h0)] reg234 = (1'h0);
  reg [(5'h10):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg229 = (1'h0);
  reg [(5'h15):(1'h0)] reg228 = (1'h0);
  assign y = {wire239,
                 wire232,
                 wire231,
                 wire230,
                 wire227,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg229,
                 reg228,
                 (1'h0)};
  assign wire227 = ($signed(wire224[(3'h4):(2'h2)]) ?
                       $unsigned(wire225) : ((~&$signed($signed(wire223))) ?
                           $signed((~|(-wire224))) : (wire224[(3'h4):(2'h3)] * $signed((wire226 << (8'hb8))))));
  always
    @(posedge clk) begin
      reg228 <= ((wire225[(3'h5):(3'h5)] ^ {$signed(wire224[(1'h0):(1'h0)]),
          $unsigned((~^wire226))}) > {$unsigned($signed($unsigned(wire225))),
          $signed(wire224[(4'ha):(4'h8)])});
      reg229 <= wire223[(3'h7):(3'h5)];
    end
  assign wire230 = $signed(reg229);
  assign wire231 = (reg229 ? wire223 : wire224);
  assign wire232 = wire224;
  always
    @(posedge clk) begin
      reg233 <= {(reg229 != (^~wire223[(3'h5):(3'h4)])),
          (wire225[(2'h3):(1'h0)] << ((!(wire226 ?
              wire231 : wire232)) | $unsigned($unsigned(wire230))))};
      reg234 <= reg228;
      if ({({($unsigned(wire232) ? (wire232 * wire232) : reg228),
                  $unsigned((-wire226))} ?
              wire226[(4'h8):(3'h5)] : $unsigned(wire226[(1'h0):(1'h0)])),
          (($signed(reg233) ?
              ((wire224 >= reg234) ?
                  wire231[(3'h6):(2'h3)] : $signed(reg229)) : ((-wire227) ^ $signed(wire223))) ^ $signed({wire227[(4'h8):(1'h1)],
              reg233[(2'h3):(2'h2)]}))})
        begin
          if ((((wire223[(2'h3):(1'h0)] == $signed(wire225)) ?
                  (((wire226 ? reg229 : reg228) ?
                      (wire223 ?
                          reg229 : wire223) : $unsigned(wire223)) ^ $unsigned((reg234 ?
                      reg234 : reg233))) : (~&$unsigned((reg229 != wire223)))) ?
              (!reg234[(4'he):(3'h6)]) : $unsigned((^~((wire230 ?
                      wire231 : wire226) ?
                  ((8'hb8) ? reg228 : reg234) : $unsigned(wire227))))))
            begin
              reg235 <= $signed(reg234[(4'hb):(2'h2)]);
            end
          else
            begin
              reg235 <= ({$unsigned($unsigned((wire230 & reg229))),
                  reg233} <<< {wire227});
              reg236 <= $signed(reg235);
            end
          reg237 <= wire226;
        end
      else
        begin
          reg235 <= (!reg233[(1'h0):(1'h0)]);
          reg236 <= (wire227 - wire230[(4'hc):(4'hc)]);
        end
      reg238 <= (~((^~$signed(reg228)) ?
          (wire230 ?
              $signed(reg233[(2'h3):(1'h0)]) : (^reg228[(3'h7):(3'h5)])) : {$unsigned((8'hb5))}));
    end
  assign wire239 = ($unsigned((wire223 == (8'ha8))) != $unsigned($unsigned((+(wire231 ?
                       reg234 : (8'ha2))))));
endmodule
