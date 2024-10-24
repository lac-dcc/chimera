module top
#(parameter param311 = {((((|(8'ha7)) ? (~(8'hb1)) : (~(8'hac))) << {((8'hab) ^~ (8'hae))}) ? (({(8'ha2), (8'ha8)} & ((8'hb4) >>> (8'ha6))) ~^ (~(|(8'hb7)))) : ((^{(8'hbe), (8'ha9)}) ? (((8'ha8) << (8'h9d)) && ((8'ha9) ? (8'hb9) : (8'hbb))) : (((8'hb8) ? (8'hb4) : (7'h40)) ? ((8'ha4) >>> (8'hab)) : {(8'ha8)})))}, 
parameter param312 = (((param311 <<< param311) > param311) ? (param311 - (^~(param311 ^ param311))) : (^((param311 - param311) ? param311 : param311))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire129;
  wire signed [(4'h8):(1'h0)] wire309;
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire127,
                 wire129,
                 wire309,
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
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire2);
      reg6 <= $signed($signed(wire2[(4'h8):(4'h8)]));
      if ((|{(|(~^$signed(wire4))), (wire3 ? wire3 : wire0[(1'h0):(1'h0)])}))
        begin
          reg7 <= $unsigned(($signed(reg5[(2'h2):(1'h1)]) ?
              ($unsigned((+reg5)) ?
                  wire3[(4'hd):(3'h7)] : {$signed(reg6),
                      $signed(wire2)}) : (~(wire2 > wire0))));
          reg8 <= (8'ha0);
          reg9 <= ((reg6 | wire2) | ((wire1 ?
              $unsigned(reg5[(2'h2):(1'h0)]) : $unsigned((8'hba))) && {{{wire3,
                      wire3}},
              ($unsigned((8'ha7)) ? reg8 : (wire1 << wire3))}));
        end
      else
        begin
          reg7 <= (~^$unsigned($signed(($unsigned(wire3) ^~ wire1[(1'h0):(1'h0)]))));
          reg8 <= $signed((~{(!{reg8}), wire3[(4'ha):(4'h9)]}));
          reg9 <= ({((reg6[(1'h1):(1'h0)] & (wire1 ?
                      (8'hb2) : wire2)) >>> ($signed(reg8) >>> (-wire0)))} ?
              $signed($unsigned(reg5[(1'h0):(1'h0)])) : $unsigned((+(reg9[(1'h1):(1'h1)] <<< $unsigned(wire2)))));
          if (reg9[(1'h1):(1'h0)])
            begin
              reg10 <= $signed($signed(reg5));
              reg11 <= (reg6[(1'h1):(1'h1)] ?
                  reg10 : (^~$signed(wire3[(4'ha):(4'h9)])));
              reg12 <= (|{(^($signed(wire3) >= wire2[(3'h4):(2'h3)]))});
            end
          else
            begin
              reg10 <= wire3[(3'h4):(2'h2)];
              reg11 <= {((8'haa) >>> reg5[(1'h0):(1'h0)])};
              reg12 <= (-wire3[(4'hc):(3'h5)]);
              reg13 <= (~&wire2[(3'h5):(2'h2)]);
              reg14 <= ($unsigned(wire2[(4'h9):(2'h2)]) ?
                  (((^reg10) == {(reg9 <<< reg8), (reg10 ? wire3 : (8'h9e))}) ?
                      wire1 : {(~|(wire2 ? (8'ha1) : reg8)), reg9}) : {{(wire0 ?
                              $signed(reg7) : (reg9 & wire0))}});
            end
        end
      if ($signed(($signed($unsigned((reg5 ^ wire4))) <= ($signed(wire2[(3'h4):(3'h4)]) ?
          $signed(((7'h41) ? reg11 : wire1)) : ((wire3 ? wire3 : reg10) ?
              wire0[(3'h6):(2'h3)] : wire3[(3'h7):(3'h5)])))))
        begin
          if ($unsigned((reg14[(3'h4):(1'h1)] ^~ $unsigned($signed((!(8'hb4)))))))
            begin
              reg15 <= reg11[(1'h1):(1'h0)];
              reg16 <= {wire0[(3'h7):(3'h7)],
                  $unsigned($unsigned(reg15[(3'h4):(1'h1)]))};
              reg17 <= (($signed(($unsigned(reg9) < {wire3})) ?
                      reg11 : $unsigned((^~(~|wire2)))) ?
                  $signed(wire2[(1'h0):(1'h0)]) : $unsigned(($unsigned(reg10[(2'h2):(1'h1)]) ?
                      ((~|wire0) - reg8[(3'h6):(2'h3)]) : reg13)));
              reg18 <= (8'ha2);
            end
          else
            begin
              reg15 <= $signed({($signed((wire0 > reg8)) && wire3),
                  $unsigned(reg6[(3'h5):(3'h5)])});
              reg16 <= (~&(($signed(reg18) ~^ reg11) >= (^~wire2[(3'h5):(2'h3)])));
            end
          reg19 <= (($signed(($unsigned(reg17) == {reg10})) >> $signed($unsigned(wire0))) | $signed(reg13[(3'h5):(1'h0)]));
          reg20 <= $signed((~$unsigned((~&(^~(8'ha0))))));
        end
      else
        begin
          reg15 <= {{({(&reg6)} ?
                      reg9[(4'hd):(2'h2)] : ($unsigned(reg13) != reg16[(4'h8):(1'h1)]))},
              reg20};
          reg16 <= reg16;
          reg17 <= {reg18};
        end
      reg21 <= $unsigned($signed(reg20));
    end
  module22 #() modinst128 (.wire23(reg8), .clk(clk), .wire24(reg14), .wire26(reg12), .wire27(wire4), .y(wire127), .wire25(wire3));
  assign wire129 = (~^$signed((!((reg12 ? (8'hac) : reg21) ?
                       (reg5 ? wire127 : reg6) : reg14))));
  module130 #() modinst310 (wire309, clk, reg15, reg14, wire129, reg8);
endmodule

module module130
#(parameter param307 = (!((+(((7'h43) ? (8'hb9) : (8'hab)) ^~ ((8'ha5) ? (8'h9e) : (8'haa)))) ? ((8'hb9) ? (~&((8'h9e) <= (8'hb2))) : {{(8'hbd)}}) : ((((7'h43) <<< (8'hae)) <<< {(8'h9f), (8'hbc)}) ? (~&(~^(8'hb7))) : (&((8'hb7) ? (8'ha5) : (7'h41)))))), 
parameter param308 = ((+(~|(param307 ? (param307 || param307) : param307))) ? (^({(param307 ? param307 : param307)} != param307)) : (param307 ? (((param307 + param307) ? (param307 ? param307 : (8'hb4)) : (param307 <= param307)) & ((param307 ? param307 : param307) ~^ {(8'ha0)})) : (((param307 - param307) ? (param307 && param307) : (|param307)) ? {(param307 + param307), (^~param307)} : ((param307 ? param307 : param307) >= (~&param307))))))
(y, clk, wire131, wire132, wire133, wire134);
  output wire [(32'h3a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire131;
  input wire signed [(2'h3):(1'h0)] wire132;
  input wire [(4'hd):(1'h0)] wire133;
  input wire signed [(2'h2):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire306;
  wire signed [(3'h6):(1'h0)] wire264;
  wire [(3'h7):(1'h0)] wire263;
  wire signed [(4'h8):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire137;
  wire signed [(3'h7):(1'h0)] wire138;
  wire signed [(5'h15):(1'h0)] wire139;
  wire signed [(4'hc):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire141;
  wire [(3'h7):(1'h0)] wire142;
  wire signed [(4'hf):(1'h0)] wire151;
  wire [(4'hc):(1'h0)] wire184;
  wire signed [(3'h5):(1'h0)] wire186;
  wire signed [(4'ha):(1'h0)] wire232;
  wire signed [(3'h5):(1'h0)] wire250;
  reg [(3'h4):(1'h0)] reg305 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg304 = (1'h0);
  reg [(2'h2):(1'h0)] reg303 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg302 = (1'h0);
  reg [(3'h4):(1'h0)] reg301 = (1'h0);
  reg [(2'h2):(1'h0)] reg300 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg299 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg298 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg297 = (1'h0);
  reg [(4'hb):(1'h0)] reg296 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg295 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg294 = (1'h0);
  reg [(5'h12):(1'h0)] reg293 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg292 = (1'h0);
  reg [(4'hb):(1'h0)] reg291 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg290 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg289 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg288 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg287 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg286 = (1'h0);
  reg [(4'hf):(1'h0)] reg285 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg284 = (1'h0);
  reg [(5'h14):(1'h0)] reg283 = (1'h0);
  reg [(5'h10):(1'h0)] reg282 = (1'h0);
  reg [(4'he):(1'h0)] reg281 = (1'h0);
  reg [(4'h9):(1'h0)] reg280 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg279 = (1'h0);
  reg [(3'h7):(1'h0)] reg278 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg277 = (1'h0);
  reg [(2'h3):(1'h0)] reg276 = (1'h0);
  reg [(4'h9):(1'h0)] reg275 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg274 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg273 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg272 = (1'h0);
  reg [(5'h14):(1'h0)] reg271 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg270 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg269 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg268 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg267 = (1'h0);
  reg [(5'h13):(1'h0)] reg266 = (1'h0);
  reg [(5'h12):(1'h0)] reg265 = (1'h0);
  reg [(4'hd):(1'h0)] reg262 = (1'h0);
  reg [(4'hd):(1'h0)] reg261 = (1'h0);
  reg [(2'h2):(1'h0)] reg260 = (1'h0);
  reg [(3'h5):(1'h0)] reg259 = (1'h0);
  reg [(3'h4):(1'h0)] reg258 = (1'h0);
  reg [(4'h8):(1'h0)] reg257 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg255 = (1'h0);
  reg [(5'h15):(1'h0)] reg254 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg253 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg252 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg236 = (1'h0);
  reg [(5'h10):(1'h0)] reg235 = (1'h0);
  reg [(5'h13):(1'h0)] reg234 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(5'h15):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg145 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  assign y = {wire306,
                 wire264,
                 wire263,
                 wire136,
                 wire137,
                 wire138,
                 wire139,
                 wire140,
                 wire141,
                 wire142,
                 wire151,
                 wire184,
                 wire186,
                 wire232,
                 wire250,
                 reg305,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg236,
                 reg235,
                 reg234,
                 reg135,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg135 <= wire131[(3'h4):(1'h0)];
    end
  assign wire136 = wire131[(1'h0):(1'h0)];
  assign wire137 = ((~&{wire133[(2'h3):(1'h0)]}) >= wire134[(1'h0):(1'h0)]);
  assign wire138 = wire131;
  assign wire139 = {$unsigned(wire132), wire137};
  assign wire140 = wire137;
  assign wire141 = $unsigned(wire139);
  assign wire142 = wire136[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg143 <= (+$signed($unsigned(((|(8'ha3)) && (-wire137)))));
      reg144 <= (-(8'h9f));
      reg145 <= (wire138[(3'h5):(1'h0)] ?
          (8'ha4) : (^(wire139 ?
              $signed((wire133 ^~ wire136)) : $signed($signed(reg144)))));
      if (wire134)
        begin
          reg146 <= (|$unsigned(reg144));
          reg147 <= ((($signed(wire140) > $unsigned(wire134[(2'h2):(1'h0)])) > $unsigned(wire131)) ?
              (-$unsigned($signed(reg143[(1'h0):(1'h0)]))) : wire140[(3'h5):(2'h3)]);
          reg148 <= (&$unsigned((|wire140)));
        end
      else
        begin
          reg146 <= reg145;
        end
      if ($signed((^~$signed($signed((~|reg144))))))
        begin
          if (((($signed((wire132 ? wire138 : (8'hb3))) ?
              $signed(wire138[(3'h4):(2'h2)]) : $signed((~&wire131))) - reg135) ^ wire138[(2'h2):(1'h0)]))
            begin
              reg149 <= wire142[(3'h5):(2'h3)];
              reg150 <= ({reg144} << (wire139 <<< (($signed(reg144) ?
                  (8'hb8) : $signed(reg146)) << (reg143 ?
                  reg148[(3'h5):(1'h1)] : $signed(wire141)))));
            end
          else
            begin
              reg149 <= $unsigned(reg149[(3'h6):(2'h3)]);
            end
        end
      else
        begin
          reg149 <= ($signed((reg148 >>> wire140[(2'h2):(1'h0)])) ?
              (8'hbe) : reg149);
        end
    end
  assign wire151 = ($signed((reg144[(1'h1):(1'h1)] ?
                           reg135[(1'h1):(1'h1)] : ((wire136 ?
                                   reg148 : reg144) ?
                               $signed(wire139) : $signed(wire140)))) ?
                       {($unsigned({wire140, reg145}) != ((reg146 != wire133) ?
                               wire141[(1'h0):(1'h0)] : (wire134 ?
                                   wire131 : wire140))),
                           (-wire132[(2'h2):(1'h1)])} : {$signed($signed($signed(reg144))),
                           (&({(8'hab)} ? (reg143 > wire136) : (8'ha8)))});
  module152 #() modinst185 (.wire156(wire151), .clk(clk), .wire155(reg144), .wire153(wire131), .y(wire184), .wire154(reg146));
  assign wire186 = $unsigned($unsigned($unsigned(wire136)));
  module187 #() modinst233 (wire232, clk, reg150, reg144, wire132, wire139, reg143);
  always
    @(posedge clk) begin
      reg234 <= wire139;
      reg235 <= ($unsigned(wire133[(4'hb):(4'h8)]) && wire232);
      reg236 <= (+(reg234 >= ((|wire131) <= ($unsigned(reg235) ?
          (-(8'h9c)) : wire133))));
    end
  module237 #() modinst251 (wire250, clk, wire140, wire139, wire131, reg149, reg135);
  always
    @(posedge clk) begin
      reg252 <= ($unsigned({$unsigned(reg234)}) ?
          (^~(((8'haf) >= (wire232 ? wire132 : wire138)) ?
              $unsigned((wire141 || wire141)) : reg144)) : ($signed(reg234[(1'h1):(1'h1)]) & wire133[(2'h2):(1'h0)]));
      reg253 <= $signed($signed(reg144));
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned(reg148)))
        begin
          reg254 <= ((~^reg148) || {reg135});
          reg255 <= wire138[(1'h1):(1'h0)];
          if ($signed({((wire138[(2'h3):(2'h2)] < (reg144 >= reg235)) && (-(-wire140)))}))
            begin
              reg256 <= $signed((~&(((~^(8'hb1)) || (~|wire136)) ?
                  (reg252 != (~|reg254)) : (!reg236))));
              reg257 <= (|reg150[(4'hc):(1'h0)]);
              reg258 <= wire184[(2'h2):(1'h1)];
              reg259 <= wire184[(2'h2):(2'h2)];
            end
          else
            begin
              reg256 <= $unsigned(((wire137 - reg236) ?
                  (({wire186, reg254} != $signed(reg149)) != $unsigned((reg258 ?
                      (8'ha3) : wire133))) : ({$unsigned((8'hb1)),
                      wire133} && (wire133 ?
                      (wire136 >= reg236) : {wire139}))));
              reg257 <= $unsigned((+reg253));
              reg258 <= ((8'ha0) == $signed(wire184[(3'h7):(1'h1)]));
            end
          reg260 <= reg235[(4'h8):(4'h8)];
        end
      else
        begin
          if (wire136[(3'h5):(2'h3)])
            begin
              reg254 <= (+$signed((($signed(reg150) ?
                  (wire132 << wire136) : reg253[(2'h3):(2'h2)]) && $unsigned(wire136))));
            end
          else
            begin
              reg254 <= (($unsigned(reg147) * reg150[(4'he):(4'he)]) ?
                  $unsigned((~^((^reg235) | {reg148}))) : reg257);
              reg255 <= reg260;
              reg256 <= reg253[(2'h3):(2'h2)];
              reg257 <= ((^~reg135) == (~&reg144[(4'hd):(3'h5)]));
              reg258 <= $signed((~^wire131));
            end
          reg259 <= $signed($signed($signed($unsigned($signed(reg236)))));
        end
      reg261 <= wire136;
      reg262 <= reg253[(3'h7):(3'h5)];
    end
  assign wire263 = wire131[(4'h8):(2'h2)];
  assign wire264 = reg254;
  always
    @(posedge clk) begin
      if ((!(|$unsigned($unsigned(wire137[(4'hd):(4'h9)])))))
        begin
          reg265 <= wire132;
          reg266 <= (|(~((~reg265) ? reg148[(2'h2):(1'h1)] : (|wire151))));
          reg267 <= $unsigned($unsigned((($unsigned(reg253) ?
                  (wire151 ? reg254 : reg255) : {reg150}) ?
              ($unsigned(reg145) ?
                  {reg259, wire263} : reg255) : $signed(wire138))));
          if (reg143[(5'h10):(4'hf)])
            begin
              reg268 <= (8'hba);
              reg269 <= wire133[(4'ha):(2'h2)];
              reg270 <= {($signed($signed((~(8'h9d)))) ?
                      $unsigned($unsigned((wire137 ?
                          reg147 : reg148))) : $unsigned($signed((&wire137))))};
              reg271 <= (7'h44);
              reg272 <= $signed($unsigned($unsigned((&$signed(reg258)))));
            end
          else
            begin
              reg268 <= wire133;
              reg269 <= (wire186[(2'h3):(1'h1)] - (((+(reg258 >= reg146)) > {{wire134},
                      (wire264 ? reg269 : wire132)}) ?
                  {reg235[(4'h8):(3'h5)]} : $signed(reg267[(4'hb):(4'ha)])));
              reg270 <= (^reg261);
              reg271 <= reg147;
            end
        end
      else
        begin
          reg265 <= $unsigned($unsigned((((~&reg254) <<< $unsigned(wire250)) ?
              $signed($signed(wire184)) : $signed((reg147 ?
                  reg253 : reg257)))));
          reg266 <= (+(({wire140, reg258[(2'h2):(1'h0)]} ?
                  ((reg259 ?
                      reg257 : reg147) > $signed(reg135)) : (wire186 == $signed(reg145))) ?
              $signed(wire142[(2'h2):(1'h0)]) : (~|wire232)));
          if (($unsigned($signed($unsigned(reg256))) == $signed(wire134[(1'h0):(1'h0)])))
            begin
              reg267 <= reg270;
            end
          else
            begin
              reg267 <= (({(^(wire264 >= reg144))} ?
                  $unsigned(wire142[(3'h7):(3'h7)]) : ($unsigned({(8'hb2),
                      (8'hbe)}) ^~ {$signed(reg256),
                      reg145[(3'h6):(1'h0)]})) * reg236[(3'h4):(1'h1)]);
            end
        end
      if ((8'hba))
        begin
          reg273 <= $signed($unsigned(($signed($signed(reg146)) * ((reg235 ?
              reg252 : (8'hb2)) ~^ (-wire136)))));
          if (reg252[(2'h3):(1'h0)])
            begin
              reg274 <= (~^(reg267 + reg145));
              reg275 <= reg144;
            end
          else
            begin
              reg274 <= $signed(((~^$signed(reg272[(1'h1):(1'h1)])) & $signed(((~&reg256) >>> wire264))));
              reg275 <= {(~^({reg266[(4'ha):(3'h4)]} ? (8'h9d) : (!reg253))),
                  $signed(((~wire134[(1'h1):(1'h0)]) <= (~&(reg252 == reg275))))};
              reg276 <= wire140;
              reg277 <= (^~(8'ha5));
            end
          reg278 <= $unsigned({$signed($unsigned((wire151 & wire232)))});
        end
      else
        begin
          reg273 <= (~wire134[(1'h0):(1'h0)]);
          reg274 <= (($signed($signed((reg149 ?
              reg149 : wire232))) | $signed(($unsigned(reg150) ?
              (reg275 ?
                  (7'h44) : reg236) : $unsigned(wire264)))) * (~&(($signed(reg271) >= {reg269}) ?
              $signed($signed(reg267)) : $signed($signed(reg270)))));
          if ({$signed((reg235[(4'hc):(3'h7)] ^~ (+$unsigned(reg265)))),
              (($unsigned(reg252[(2'h3):(2'h2)]) * reg145[(3'h4):(3'h4)]) ?
                  {{$unsigned(reg135)}} : $unsigned(($unsigned(reg276) ?
                      $signed((8'hbb)) : reg235)))})
            begin
              reg275 <= ({(($unsigned(reg271) ?
                          (wire264 == reg269) : $unsigned(wire133)) ?
                      {{wire131}} : reg143[(2'h3):(2'h3)]),
                  reg253[(3'h4):(1'h1)]} >> (8'hb1));
              reg276 <= (^(8'hba));
              reg277 <= $signed($unsigned(((+$signed(reg135)) ?
                  {(wire136 ? wire134 : reg265),
                      (^~(8'hbc))} : (wire139 ^ (~|reg255)))));
              reg278 <= $signed({wire250});
            end
          else
            begin
              reg275 <= $signed(reg267[(4'hb):(3'h7)]);
            end
          reg279 <= $unsigned(reg278);
          reg280 <= reg265[(3'h7):(2'h3)];
        end
      if ((wire133 <<< reg234[(1'h0):(1'h0)]))
        begin
          if (wire142)
            begin
              reg281 <= (reg269[(5'h10):(4'hc)] ?
                  $unsigned(reg150[(4'hb):(3'h5)]) : ((~^(8'hb0)) != $signed((-(reg270 >= (8'hb5))))));
            end
          else
            begin
              reg281 <= reg258;
              reg282 <= ($signed($signed((!(wire232 ? reg269 : reg255)))) ?
                  $signed(wire184[(2'h3):(1'h1)]) : $signed((((reg273 ?
                              reg256 : reg275) ?
                          reg236 : $signed(reg274)) ?
                      {$unsigned(reg256),
                          reg150[(1'h0):(1'h0)]} : $unsigned(reg234[(3'h4):(1'h0)]))));
              reg283 <= (8'hb9);
              reg284 <= reg236;
            end
          reg285 <= reg272[(3'h4):(2'h2)];
          if (($signed((reg265[(4'ha):(1'h0)] ?
              (8'h9c) : reg254)) == (~^$unsigned($signed((~&reg271))))))
            begin
              reg286 <= wire142[(1'h1):(1'h1)];
              reg287 <= ((^~(reg135 ?
                  (((8'ha7) == wire137) == reg285) : (^~(^~(8'hb6))))) > $signed((&reg268)));
              reg288 <= $unsigned(reg270[(4'ha):(3'h6)]);
              reg289 <= (+wire132);
              reg290 <= (((^(~|reg235[(3'h4):(1'h1)])) ~^ ($unsigned(reg257) ?
                  $unsigned($signed(reg257)) : (reg256 != $signed((7'h44))))) << ((($unsigned(reg275) ?
                      wire141[(2'h3):(1'h1)] : $unsigned(wire232)) ?
                  $signed((^~reg280)) : ($signed(wire134) << {wire264,
                      wire141})) != (reg150[(3'h5):(3'h4)] <= (reg269[(1'h1):(1'h0)] ?
                  wire139[(4'hc):(3'h5)] : $signed(reg277)))));
            end
          else
            begin
              reg286 <= reg148;
              reg287 <= (wire139 ?
                  $signed((~|$unsigned(((7'h42) ?
                      reg262 : reg268)))) : reg272[(3'h4):(3'h4)]);
            end
          reg291 <= ({reg279} != $signed(((&((8'ha3) ?
              reg277 : reg286)) | reg270)));
        end
      else
        begin
          reg281 <= reg278[(1'h0):(1'h0)];
          if (reg259[(1'h0):(1'h0)])
            begin
              reg282 <= $unsigned(wire138);
              reg283 <= $signed((-(~|reg234)));
              reg284 <= $signed((^~((^$signed(reg271)) ?
                  $signed(reg269[(3'h5):(2'h2)]) : $signed((reg150 << wire232)))));
              reg285 <= reg234;
            end
          else
            begin
              reg282 <= {{reg267, reg234[(4'h9):(1'h1)]}};
              reg283 <= $signed((reg278[(3'h5):(2'h2)] ?
                  ((^~$signed(reg265)) ?
                      {$signed(wire141)} : (reg274 < reg260)) : $unsigned(wire151[(2'h3):(2'h2)])));
            end
          reg286 <= $unsigned(wire132[(1'h0):(1'h0)]);
          reg287 <= ((!$signed($signed((~(7'h43))))) <= reg291[(3'h4):(2'h2)]);
        end
      reg292 <= $signed((+$signed(reg148)));
      if ((reg279 ?
          ($unsigned($unsigned(reg287)) << ($unsigned((^~reg281)) >= (((8'hae) + wire137) << ((8'h9c) ?
              wire131 : reg253)))) : (~|(((8'hbc) ?
                  reg236 : (reg144 ? wire263 : reg149)) ?
              reg150[(1'h1):(1'h1)] : $signed(((8'h9c) ? reg289 : reg143))))))
        begin
          reg293 <= (((~&$signed(reg287)) != (wire136[(2'h3):(2'h3)] ?
              $unsigned($signed((8'h9c))) : (^~reg267[(4'hd):(4'hc)]))) << (~^$signed(reg290)));
          reg294 <= (reg292 && ({{reg148, reg260[(2'h2):(1'h0)]}, (+(8'hb0))} ?
              $signed((^~(wire139 <<< wire139))) : reg280[(3'h4):(1'h0)]));
          reg295 <= reg290[(1'h1):(1'h0)];
          reg296 <= $unsigned($unsigned($signed(($signed(reg277) ?
              reg261 : (reg289 ? reg269 : (8'hac))))));
        end
      else
        begin
          if (((7'h43) <<< reg253[(3'h5):(2'h3)]))
            begin
              reg293 <= reg283;
              reg294 <= $signed($signed($signed({$signed(reg269),
                  wire184[(4'hc):(4'h8)]})));
              reg295 <= reg284;
              reg296 <= $signed((|(~&(!(-(8'h9f))))));
              reg297 <= ($signed($signed(($signed(reg288) ?
                      (reg135 ? (8'hb7) : reg288) : reg260))) ?
                  (7'h40) : reg261[(3'h4):(1'h0)]);
            end
          else
            begin
              reg293 <= (!(((8'hb2) ?
                      (wire186 - reg265[(3'h6):(1'h0)]) : $unsigned((reg265 != wire232))) ?
                  ((((8'hb1) ? reg259 : reg256) && (reg145 ?
                          wire250 : reg273)) ?
                      reg292[(3'h6):(2'h3)] : ($signed((7'h43)) || {reg261})) : wire131[(1'h0):(1'h0)]));
              reg294 <= reg287;
              reg295 <= wire140;
              reg296 <= reg148[(2'h3):(2'h3)];
              reg297 <= ((^$signed({(~|reg255), $unsigned(wire184)})) ?
                  (reg261[(1'h1):(1'h1)] | ($unsigned((&reg260)) ^~ wire232[(3'h6):(3'h5)])) : reg257[(2'h2):(1'h0)]);
            end
          reg298 <= $signed(reg266[(4'h8):(1'h0)]);
          if ($unsigned($unsigned($unsigned(reg268[(2'h3):(1'h1)]))))
            begin
              reg299 <= (reg268[(2'h3):(2'h3)] >> wire137[(4'he):(3'h5)]);
              reg300 <= (~(~&$unsigned($unsigned((reg256 || reg282)))));
              reg301 <= $signed(($signed(($unsigned(reg148) ?
                  {reg285, reg147} : (~^reg280))) < ((^~(&wire136)) ?
                  $signed((!reg299)) : (|reg257))));
              reg302 <= (|(reg279[(5'h12):(1'h1)] <= $signed((8'hbf))));
            end
          else
            begin
              reg299 <= {(+(^(~reg270))),
                  ((wire133 < ($signed((8'hac)) ?
                          ((8'hb4) ?
                              (8'hae) : wire184) : reg145[(2'h3):(2'h3)])) ?
                      (~&reg269) : wire141)};
              reg300 <= reg258[(1'h0):(1'h0)];
              reg301 <= {reg287,
                  $signed((((&wire264) > reg285) ?
                      ({reg274,
                          reg276} * (reg261 <<< reg148)) : ($unsigned((8'hb2)) ?
                          (8'hbd) : $signed(reg271))))};
              reg302 <= (reg276[(1'h0):(1'h0)] == (reg255[(4'hd):(1'h1)] ?
                  $signed($unsigned(reg276[(1'h0):(1'h0)])) : $signed(reg287)));
              reg303 <= (~|($signed(($unsigned(reg283) ?
                  (reg288 + (8'hb2)) : $unsigned(reg145))) && ((|$signed(reg299)) ?
                  {$unsigned(reg275), wire137} : reg270)));
            end
          reg304 <= wire133;
          reg305 <= $signed((((~^{reg270, reg300}) ?
                  reg302[(3'h6):(1'h1)] : wire263[(2'h2):(2'h2)]) ?
              (~&$signed(reg287)) : {(!(reg144 >= wire131))}));
        end
    end
  assign wire306 = ($signed(reg265) >= reg275[(1'h0):(1'h0)]);
endmodule

module module22
#(parameter param125 = (+((~&(!(!(8'hb0)))) < ((^~(8'hba)) ? (8'hb0) : (((8'had) ? (8'ha6) : (8'hb6)) ? ((8'hb0) ? (8'ha6) : (8'hbd)) : {(7'h43)})))), 
parameter param126 = (8'ha1))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire27;
  input wire signed [(3'h4):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire25;
  input wire signed [(3'h6):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire124;
  wire signed [(5'h12):(1'h0)] wire123;
  wire [(4'ha):(1'h0)] wire122;
  wire [(4'he):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire104,
                 wire80,
                 wire79,
                 wire74,
                 wire72,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg120,
                 reg119,
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
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 (1'h0)};
  assign wire28 = wire23;
  assign wire29 = (wire24[(2'h2):(1'h1)] <<< wire27[(3'h5):(2'h2)]);
  assign wire30 = wire24;
  assign wire31 = wire27;
  module32 #() modinst73 (.wire36(wire23), .clk(clk), .y(wire72), .wire35(wire28), .wire34(wire30), .wire33(wire29));
  assign wire74 = ($unsigned((~&$unsigned(((7'h41) ?
                      wire23 : (8'hb8))))) + wire31[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      if (wire27)
        begin
          reg75 <= ({$signed(wire28[(1'h0):(1'h0)]), $signed(wire74)} ?
              $signed((-($unsigned(wire25) ?
                  wire29 : wire30[(3'h4):(2'h3)]))) : $signed($signed(wire29[(5'h11):(3'h7)])));
          reg76 <= wire74;
          reg77 <= (wire27[(3'h4):(1'h1)] ?
              $unsigned(reg76[(5'h14):(4'h9)]) : wire25[(4'hc):(1'h1)]);
        end
      else
        begin
          reg75 <= (({$unsigned($unsigned((8'hbd)))} <<< $unsigned($unsigned($signed(wire26)))) <<< wire74);
          reg76 <= $signed((^~{(reg75 > (wire23 | (8'hbf))),
              {{wire31, wire30}, (~&(8'ha0))}}));
          reg77 <= wire24;
        end
      reg78 <= $signed({$signed({wire74})});
    end
  assign wire79 = wire28[(3'h6):(1'h0)];
  assign wire80 = $signed((+((8'hbd) > $unsigned(wire27[(3'h4):(1'h0)]))));
  module81 #() modinst105 (.wire85(reg78), .wire86(wire79), .y(wire104), .wire84(wire28), .wire83(wire25), .wire82(wire30), .clk(clk));
  always
    @(posedge clk) begin
      reg106 <= wire25;
      reg107 <= wire24[(1'h0):(1'h0)];
      reg108 <= wire72[(3'h7):(3'h5)];
      reg109 <= wire26;
      reg110 <= ({($unsigned($signed(wire28)) | $signed((~reg77)))} ~^ ($unsigned($unsigned(reg77)) != {$signed((8'hb9)),
          wire24[(3'h4):(3'h4)]}));
    end
  always
    @(posedge clk) begin
      reg111 <= reg106;
      reg112 <= (|$unsigned(wire24));
      reg113 <= $unsigned(wire80[(3'h5):(3'h4)]);
      if ((reg107[(1'h0):(1'h0)] * {{$unsigned($unsigned(wire74))}}))
        begin
          if ({wire31[(2'h2):(1'h0)]})
            begin
              reg114 <= (($signed({$signed(reg78)}) ?
                  (wire72 ?
                      (8'ha3) : reg109) : wire24) ~^ wire30[(2'h2):(2'h2)]);
              reg115 <= (wire31[(3'h6):(2'h3)] | $signed(((8'hb9) && (reg113[(3'h5):(2'h2)] ?
                  $signed(reg78) : {(8'hae)}))));
              reg116 <= $signed($unsigned({(wire30 <= $unsigned(reg78)),
                  reg115[(4'h9):(3'h7)]}));
              reg117 <= wire80[(3'h5):(3'h5)];
            end
          else
            begin
              reg114 <= $unsigned($signed(reg78[(1'h0):(1'h0)]));
              reg115 <= $signed(reg78);
            end
          reg118 <= wire104;
          reg119 <= (~($signed(reg77[(2'h3):(1'h1)]) ?
              {$signed((+(8'hbf))), $unsigned(reg77)} : wire80[(4'h9):(2'h2)]));
          reg120 <= reg110;
        end
      else
        begin
          if ((~^$unsigned(wire79)))
            begin
              reg114 <= $unsigned(wire31);
            end
          else
            begin
              reg114 <= (wire31[(2'h3):(2'h2)] || wire31[(3'h7):(3'h4)]);
              reg115 <= $unsigned($signed(($unsigned(reg76[(4'ha):(4'h9)]) ~^ {reg77[(3'h5):(2'h2)],
                  $signed(reg114)})));
              reg116 <= (~|$signed(wire29[(4'he):(3'h7)]));
              reg117 <= wire74[(1'h1):(1'h1)];
              reg118 <= (!wire28[(4'h9):(3'h5)]);
            end
          reg119 <= (reg118 ^ $signed(wire74[(3'h7):(3'h5)]));
          reg120 <= {(((~^(wire26 <= wire72)) ?
                  wire23[(4'hd):(4'hb)] : wire31) ^ $signed($unsigned((~&reg115))))};
        end
    end
  assign wire121 = (~wire30);
  assign wire122 = {reg78, (+(-$signed((~^reg76))))};
  assign wire123 = reg117[(1'h1):(1'h1)];
  assign wire124 = (~&$unsigned((8'ha8)));
endmodule

module module81  (y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire86;
  input wire signed [(3'h7):(1'h0)] wire85;
  input wire signed [(4'hc):(1'h0)] wire84;
  input wire signed [(5'h10):(1'h0)] wire83;
  input wire [(3'h5):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire96;
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg87 <= $unsigned({(!{wire83, wire84}),
          $unsigned($unsigned((wire84 ? wire84 : wire83)))});
      reg88 <= $signed($unsigned({{$unsigned(wire85), (!wire84)}}));
      if ($signed(reg88[(4'h9):(2'h2)]))
        begin
          if ({wire84[(1'h1):(1'h1)], wire83[(4'hb):(1'h0)]})
            begin
              reg89 <= ($signed(wire86[(3'h4):(2'h2)]) ?
                  ({wire85,
                      wire86} >>> reg87) : $signed(({reg87[(3'h6):(3'h4)]} | ((wire83 ?
                          (8'ha1) : reg88) ?
                      wire85[(3'h5):(2'h3)] : (wire86 >= reg87)))));
            end
          else
            begin
              reg89 <= (wire84[(3'h6):(3'h4)] != {$signed(wire83)});
              reg90 <= wire82[(3'h4):(3'h4)];
            end
          reg91 <= reg90;
          if ((wire83[(3'h5):(3'h5)] ?
              (8'ha6) : $signed($unsigned(((wire85 ?
                  reg91 : wire83) <= reg88[(4'he):(1'h0)])))))
            begin
              reg92 <= (8'hb2);
            end
          else
            begin
              reg92 <= $unsigned(wire86[(1'h0):(1'h0)]);
              reg93 <= wire83;
            end
          reg94 <= reg91;
        end
      else
        begin
          reg89 <= $signed(reg93);
          if ({$signed(wire85)})
            begin
              reg90 <= (8'ha4);
              reg91 <= $unsigned((!$signed($signed((~|(8'hbe))))));
              reg92 <= $signed(reg91[(2'h3):(1'h0)]);
            end
          else
            begin
              reg90 <= ((~|reg90[(2'h2):(1'h0)]) ?
                  $signed($signed(($unsigned(reg91) ?
                      $unsigned(wire84) : ((8'ha3) ?
                          reg88 : reg89)))) : wire86);
              reg91 <= reg94[(1'h0):(1'h0)];
              reg92 <= (wire82 ?
                  {$signed({(~reg92), wire83}),
                      reg94[(3'h4):(1'h0)]} : $signed((~^reg91[(2'h3):(2'h2)])));
              reg93 <= (wire83 ^~ (+{((8'haa) >>> $unsigned(reg93))}));
            end
          reg94 <= {{(reg91 << (-reg92[(3'h5):(1'h1)])),
                  (+$signed((reg89 ? wire86 : wire82)))}};
          reg95 <= ((&$signed((~&$signed(wire82)))) ?
              (&(((~reg89) ?
                  $unsigned(wire86) : reg90[(3'h6):(1'h0)]) && (|(reg91 != reg89)))) : $unsigned(($unsigned((wire83 ?
                      wire83 : wire86)) ?
                  (!$unsigned(reg91)) : $signed((^(8'hb3))))));
        end
    end
  assign wire96 = reg87[(4'ha):(3'h4)];
  assign wire97 = {(~|((!(~^reg90)) == ((wire85 ? reg93 : reg91) ?
                          $unsigned((8'ha7)) : $signed(reg93)))),
                      $signed(($unsigned((reg87 ?
                          reg90 : wire85)) ~^ $signed({wire86, reg94})))};
  assign wire98 = reg90[(3'h4):(1'h0)];
  assign wire99 = (^(~{((wire83 ? wire82 : wire98) > (wire96 << wire98))}));
  assign wire100 = (reg89[(4'h8):(3'h7)] ?
                       $signed(wire96) : $unsigned(($signed(wire83) ?
                           (|(reg87 ^ (8'hb5))) : (wire86 - wire82))));
  assign wire101 = (-wire83[(4'hc):(2'h3)]);
  assign wire102 = $signed($unsigned({($signed((8'ha9)) ~^ (~reg92))}));
  assign wire103 = ($signed((-wire98)) >>> {(wire102[(2'h2):(1'h0)] ?
                           {$unsigned(reg90)} : reg89),
                       (!reg94)});
endmodule

module module32
#(parameter param71 = {(~((|((7'h43) ^~ (7'h41))) | ((~(8'h9c)) ^~ {(8'hbb), (8'hb2)})))})
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire36;
  input wire signed [(3'h5):(1'h0)] wire35;
  input wire signed [(3'h6):(1'h0)] wire34;
  input wire [(3'h6):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire37;
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  assign y = {wire70,
                 wire61,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire37,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
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
                 (1'h0)};
  assign wire37 = $unsigned($signed({wire35[(3'h4):(3'h4)]}));
  always
    @(posedge clk) begin
      if (wire34)
        begin
          if ({((~&$signed($signed(wire37))) ?
                  {wire33} : ($signed($signed(wire33)) & wire34)),
              (wire33 << (wire34 != ({wire34} == wire34[(2'h2):(2'h2)])))})
            begin
              reg38 <= ({{wire37, $signed($signed(wire34))},
                  wire37} << wire33[(2'h2):(1'h0)]);
              reg39 <= (reg38[(2'h3):(2'h2)] ?
                  ($unsigned((&{wire34})) ?
                      {$signed((+(8'hbe)))} : (+wire36[(1'h0):(1'h0)])) : $signed($signed($signed(wire34[(2'h3):(1'h0)]))));
              reg40 <= $signed({$unsigned(((!wire34) <= ((8'hbc) == wire34)))});
            end
          else
            begin
              reg38 <= (|(wire35[(3'h5):(2'h2)] ^~ (wire33[(3'h6):(3'h6)] ?
                  ((wire37 ? wire36 : (7'h43)) ?
                      (wire33 ?
                          reg40 : wire33) : $signed((7'h40))) : {$unsigned(wire34),
                      reg39[(1'h1):(1'h1)]})));
              reg39 <= $unsigned((reg40[(4'hc):(3'h5)] ?
                  {(^~(~^reg39)),
                      $unsigned(wire33[(1'h0):(1'h0)])} : ($unsigned($signed(wire37)) ?
                      ((reg39 * reg40) & wire33[(1'h1):(1'h0)]) : wire36)));
              reg40 <= {($unsigned(reg38) ?
                      $signed($signed(reg39[(2'h3):(2'h3)])) : ($signed({wire34,
                          (8'hb8)}) - $signed({wire35}))),
                  reg40};
              reg41 <= (~|reg38);
            end
          if ({$unsigned({((reg41 ^~ wire37) ?
                      ((8'h9f) <<< wire36) : {reg40, reg38}),
                  ((reg40 >>> reg40) ? $signed(reg39) : $signed(wire35))}),
              $signed((~&(reg38 * $signed(wire33))))})
            begin
              reg42 <= (~^$signed($signed(($signed(wire33) ~^ wire37))));
              reg43 <= ($signed((+(reg40 << {reg40,
                  wire36}))) >= ($signed({(&wire35),
                  (wire35 - reg40)}) & (^({reg42, wire36} ?
                  ((8'hb9) ? (7'h41) : wire37) : $signed(reg42)))));
              reg44 <= $signed((|$unsigned($unsigned(reg41[(2'h3):(1'h1)]))));
            end
          else
            begin
              reg42 <= $signed(wire33);
              reg43 <= $unsigned(({wire36} ?
                  (~|$signed((8'h9c))) : $signed(($unsigned(reg42) ?
                      {reg41} : (~wire37)))));
              reg44 <= reg44[(3'h6):(1'h1)];
              reg45 <= (reg40 > reg43[(4'h8):(2'h3)]);
            end
          if ($signed(($signed($signed((~reg45))) ?
              (^$unsigned((wire36 <<< wire36))) : (&(reg45[(4'h9):(3'h5)] == (reg42 >= reg44))))))
            begin
              reg46 <= (+(($unsigned({reg39}) ?
                  (reg38[(3'h6):(2'h2)] && $unsigned(reg43)) : {((8'hb8) ?
                          (8'hbf) : reg38),
                      (reg42 ^~ reg43)}) >= reg39[(2'h3):(1'h1)]));
            end
          else
            begin
              reg46 <= reg42[(3'h6):(2'h2)];
            end
        end
      else
        begin
          if ((!$signed((((wire35 > reg44) ?
              (^~reg43) : (|reg38)) <= $signed({reg40, reg45})))))
            begin
              reg38 <= (reg45 && reg45);
              reg39 <= (($unsigned(reg42[(2'h3):(2'h2)]) & ($signed((|reg40)) ?
                  $signed(reg42) : (+wire36))) == (8'hba));
              reg40 <= (~($signed($unsigned(reg44[(4'ha):(4'ha)])) ?
                  wire34[(1'h0):(1'h0)] : ($signed($signed(wire35)) ?
                      ((reg46 ? reg40 : wire33) <= (wire35 ?
                          (7'h44) : reg46)) : reg46)));
              reg41 <= (8'haf);
              reg42 <= (reg38 ^~ ($signed($unsigned((reg41 || reg41))) >>> wire35[(1'h0):(1'h0)]));
            end
          else
            begin
              reg38 <= ($signed($unsigned(reg45)) ^~ (!$unsigned(reg40[(1'h0):(1'h0)])));
              reg39 <= (^(|((~&(wire37 && reg42)) ^ reg45)));
              reg40 <= ($signed({reg39[(2'h3):(2'h3)]}) ?
                  $signed($unsigned(reg40)) : $signed($unsigned((^$unsigned(reg43)))));
              reg41 <= ((-($unsigned(((8'hbd) ?
                      wire34 : reg39)) + reg45[(1'h1):(1'h0)])) ?
                  (~&$signed($signed($signed(reg42)))) : $unsigned(reg40));
            end
          if ((~&reg39))
            begin
              reg43 <= $signed(((($unsigned(reg40) >>> $signed((7'h40))) ^ wire36[(2'h3):(1'h1)]) >= wire33));
              reg44 <= ($signed($signed(wire36)) + $unsigned(reg44[(4'h9):(3'h5)]));
              reg45 <= $signed($unsigned((^~(8'haf))));
              reg46 <= $signed((^~((~|wire34) == reg43)));
              reg47 <= (~|reg46[(1'h1):(1'h0)]);
            end
          else
            begin
              reg43 <= reg42;
              reg44 <= reg47;
              reg45 <= (|reg43);
              reg46 <= $unsigned({$signed($unsigned((reg45 ? reg38 : reg41)))});
            end
        end
      reg48 <= $unsigned(($unsigned(wire36) ?
          reg41[(5'h13):(3'h4)] : (|(wire33[(1'h0):(1'h0)] ^ reg42[(2'h3):(2'h2)]))));
    end
  assign wire49 = $signed({{((-reg43) != (8'hbe))}});
  assign wire50 = wire49;
  assign wire51 = reg38[(3'h5):(2'h3)];
  assign wire52 = (reg44 ? reg42[(1'h1):(1'h1)] : reg40[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg53 <= reg46[(4'hd):(4'h9)];
      reg54 <= ($signed(wire34) > reg45[(3'h4):(2'h3)]);
      if (reg44[(2'h2):(2'h2)])
        begin
          reg55 <= $unsigned((+($signed(wire50) + reg47)));
        end
      else
        begin
          reg55 <= wire35[(3'h5):(3'h4)];
          reg56 <= (~&$unsigned(reg41));
          reg57 <= $unsigned($signed(($unsigned(wire37[(1'h0):(1'h0)]) ?
              (8'h9d) : (!(reg47 ? reg55 : wire33)))));
          reg58 <= reg38;
          reg59 <= wire37[(2'h2):(1'h1)];
        end
      reg60 <= $signed(wire50);
    end
  assign wire61 = $unsigned((^~(^~((reg48 ? reg58 : reg59) ?
                      {wire52} : (wire34 ? wire35 : wire49)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire35[(3'h4):(1'h1)]))
        begin
          reg62 <= {reg54[(4'hb):(3'h5)],
              (^~((!$signed(wire36)) ? reg55 : (!$unsigned(reg55))))};
        end
      else
        begin
          reg62 <= (wire37 <= $unsigned((wire33 ?
              (^~(~|wire33)) : (reg58 ?
                  reg41[(4'hd):(3'h4)] : $signed(wire35)))));
        end
      if ($unsigned($unsigned(reg54[(4'hc):(4'hb)])))
        begin
          reg63 <= $unsigned(((|(~^reg47[(3'h7):(3'h7)])) ?
              $unsigned($unsigned({wire35})) : wire33));
          reg64 <= wire36;
        end
      else
        begin
          if ((wire49 ?
              $unsigned($signed(($signed((8'hb2)) ?
                  $signed(reg64) : $signed(reg55)))) : ($unsigned((8'hbc)) ?
                  (&$signed(reg55[(3'h5):(3'h4)])) : (8'haf))))
            begin
              reg63 <= wire52;
              reg64 <= {reg48[(4'hc):(3'h4)], $signed(reg46[(2'h2):(1'h0)])};
              reg65 <= wire51;
            end
          else
            begin
              reg63 <= $unsigned(($unsigned(reg56[(1'h0):(1'h0)]) > (((wire61 ?
                      reg47 : (8'haa)) ?
                  (8'hb9) : reg45[(4'h8):(3'h6)]) < $signed((wire33 ?
                  wire50 : reg53)))));
              reg64 <= ($unsigned(reg58[(4'h9):(2'h3)]) ?
                  (((|$unsigned(reg58)) ?
                          (8'ha3) : ((reg62 ? wire49 : reg38) ?
                              (~&reg41) : (~^reg47))) ?
                      (7'h41) : $unsigned({$unsigned(reg48)})) : {($signed($signed(reg58)) ?
                          {reg62, wire61[(1'h0):(1'h0)]} : wire37),
                      reg64});
            end
          reg66 <= $unsigned(reg45[(4'h8):(1'h1)]);
          reg67 <= $signed(reg60);
          reg68 <= ({(reg48 != {(-reg55)}), wire52[(5'h10):(4'hc)]} ?
              reg38[(2'h2):(2'h2)] : $unsigned((reg54[(1'h1):(1'h1)] | wire51[(4'hd):(4'h8)])));
        end
      reg69 <= (7'h41);
    end
  assign wire70 = (wire35 ?
                      (~^((8'ha3) ?
                          (^~(~&reg48)) : $signed(reg64[(4'h8):(3'h5)]))) : reg63[(2'h2):(1'h0)]);
endmodule

module module237  (y, clk, wire242, wire241, wire240, wire239, wire238);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire242;
  input wire signed [(5'h15):(1'h0)] wire241;
  input wire signed [(5'h13):(1'h0)] wire240;
  input wire signed [(3'h5):(1'h0)] wire239;
  input wire [(2'h2):(1'h0)] wire238;
  wire signed [(2'h2):(1'h0)] wire249;
  wire signed [(4'ha):(1'h0)] wire248;
  wire [(4'h9):(1'h0)] wire247;
  wire signed [(3'h7):(1'h0)] wire246;
  wire [(3'h5):(1'h0)] wire245;
  wire [(4'ha):(1'h0)] wire244;
  wire signed [(2'h3):(1'h0)] wire243;
  assign y = {wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 (1'h0)};
  assign wire243 = wire240;
  assign wire244 = $unsigned(wire242);
  assign wire245 = wire242[(3'h6):(1'h0)];
  assign wire246 = $unsigned((({(wire243 ^~ (8'hb8))} ?
                           (wire242 << (+wire241)) : $unsigned($signed((8'h9f)))) ?
                       $unsigned(((wire238 < wire243) != (wire240 ?
                           wire243 : wire239))) : $signed((((8'hb3) ~^ wire243) ?
                           (wire245 ? (8'hb3) : wire245) : (wire244 ?
                               wire245 : wire244)))));
  assign wire247 = (wire239[(2'h2):(1'h1)] <<< ($signed(((~wire245) ~^ $signed(wire240))) ?
                       $signed(($unsigned(wire244) < {wire240,
                           wire246})) : {(wire240 ?
                               $unsigned(wire245) : (&wire245))}));
  assign wire248 = wire242[(4'ha):(1'h0)];
  assign wire249 = wire247;
endmodule

module module187
#(parameter param231 = (~^(~(({(8'h9d)} ^ {(8'haf)}) != (((7'h43) ? (8'hb4) : (8'ha1)) == ((7'h44) ? (8'hbc) : (7'h42)))))))
(y, clk, wire192, wire191, wire190, wire189, wire188);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire192;
  input wire signed [(5'h11):(1'h0)] wire191;
  input wire [(2'h2):(1'h0)] wire190;
  input wire signed [(4'hc):(1'h0)] wire189;
  input wire [(5'h12):(1'h0)] wire188;
  wire [(4'h8):(1'h0)] wire230;
  wire [(3'h5):(1'h0)] wire229;
  wire [(4'h9):(1'h0)] wire228;
  wire signed [(3'h4):(1'h0)] wire227;
  wire [(2'h3):(1'h0)] wire226;
  wire signed [(4'hc):(1'h0)] wire225;
  wire [(2'h2):(1'h0)] wire224;
  wire [(3'h6):(1'h0)] wire201;
  wire signed [(5'h15):(1'h0)] wire200;
  wire [(4'h9):(1'h0)] wire196;
  wire signed [(3'h4):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire194;
  wire signed [(5'h15):(1'h0)] wire193;
  reg signed [(4'ha):(1'h0)] reg223 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg222 = (1'h0);
  reg [(2'h3):(1'h0)] reg221 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg219 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg218 = (1'h0);
  reg [(4'hc):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg215 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg214 = (1'h0);
  reg [(3'h6):(1'h0)] reg213 = (1'h0);
  reg [(3'h5):(1'h0)] reg212 = (1'h0);
  reg [(4'ha):(1'h0)] reg211 = (1'h0);
  reg signed [(4'he):(1'h0)] reg210 = (1'h0);
  reg [(4'hc):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg207 = (1'h0);
  reg [(5'h12):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg203 = (1'h0);
  reg [(4'h9):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg197 = (1'h0);
  assign y = {wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire201,
                 wire200,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg199,
                 reg198,
                 reg197,
                 (1'h0)};
  assign wire193 = $unsigned({((^~(^wire190)) << wire188),
                       ((&$signed(wire192)) ?
                           wire192 : $signed(wire188[(4'ha):(1'h0)]))});
  assign wire194 = {$unsigned((^~$signed(wire192))),
                       $signed($signed($signed((wire188 ?
                           (8'hb1) : wire188))))};
  assign wire195 = $signed($signed($signed({(~^(7'h42)), {wire191, (8'ha2)}})));
  assign wire196 = $signed(($signed(wire191) ?
                       (($signed(wire194) >>> wire189[(4'h8):(2'h3)]) <= ({wire189,
                               wire189} ?
                           wire195 : wire192[(3'h4):(1'h0)])) : wire192));
  always
    @(posedge clk) begin
      reg197 <= (~^(&$unsigned(((wire189 == wire193) & (8'hac)))));
      reg198 <= $signed(($signed(($signed(wire194) ?
              $signed(wire189) : $signed(wire194))) ?
          {wire190, (+$unsigned(wire190))} : (~&(((8'hbc) ? wire194 : (8'hb9)) ?
              {wire193} : wire195[(2'h3):(1'h1)]))));
      reg199 <= ((^~(|((wire188 ? wire194 : (8'ha9)) ?
          wire190[(2'h2):(2'h2)] : reg197[(4'hc):(1'h0)]))) - reg197);
    end
  assign wire200 = wire192;
  assign wire201 = reg199[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ((reg199 ?
          $signed((wire192 != {wire195, reg199[(2'h2):(1'h1)]})) : (8'ha4)))
        begin
          reg202 <= reg199[(2'h2):(2'h2)];
          reg203 <= wire193[(1'h0):(1'h0)];
          if ($signed(((~^(~|(^~(8'ha6)))) ?
              ((^(~^wire200)) ?
                  {(wire201 ? (7'h42) : reg199)} : $signed({(8'ha2),
                      wire188})) : wire188)))
            begin
              reg204 <= (~^(^reg199[(4'hb):(1'h0)]));
              reg205 <= ($unsigned($unsigned((8'hb8))) ?
                  $signed($unsigned(wire200[(3'h7):(3'h6)])) : wire190);
            end
          else
            begin
              reg204 <= (wire196 && (reg203[(4'h9):(2'h2)] > $signed($unsigned((|wire191)))));
              reg205 <= (~(8'h9c));
              reg206 <= wire194;
              reg207 <= wire193;
              reg208 <= $signed(reg206[(3'h7):(1'h1)]);
            end
        end
      else
        begin
          reg202 <= reg206;
          reg203 <= $unsigned($signed($signed($unsigned((reg206 ?
              wire195 : wire190)))));
        end
      reg209 <= (((($signed(wire188) << (wire191 ? reg202 : wire201)) ?
              $unsigned(reg203[(3'h7):(1'h1)]) : $unsigned(wire193[(2'h3):(1'h1)])) ^ (wire194 ?
              ({reg203} ? $signed(reg206) : (^wire201)) : wire201)) ?
          $unsigned({$signed((|reg202)),
              ((wire192 < wire192) ?
                  ((8'hb5) != wire192) : reg207)}) : $signed((^($signed(wire200) ?
              (wire189 ? reg199 : wire196) : (reg208 ? reg204 : reg202)))));
      reg210 <= wire193[(2'h2):(2'h2)];
      reg211 <= reg202[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg212 <= $unsigned(reg204[(2'h3):(2'h2)]);
      reg213 <= ((~|wire190[(1'h0):(1'h0)]) ?
          (~wire189[(4'ha):(3'h7)]) : $signed((wire190[(1'h1):(1'h1)] ?
              $unsigned({(8'ha2), wire189}) : reg199)));
      if ($signed($unsigned({(wire192[(3'h7):(1'h1)] | wire188),
          (!(wire192 ? reg208 : reg211))})))
        begin
          reg214 <= wire201;
          if ((~$unsigned((reg204[(3'h4):(2'h3)] <= $signed((reg199 == (7'h43)))))))
            begin
              reg215 <= reg204;
              reg216 <= wire191;
              reg217 <= wire192;
              reg218 <= reg211[(1'h0):(1'h0)];
              reg219 <= wire189[(1'h0):(1'h0)];
            end
          else
            begin
              reg215 <= ($unsigned((8'ha2)) ?
                  (reg205[(3'h7):(3'h4)] ?
                      ($signed(wire200[(5'h14):(4'he)]) && ((-reg205) <<< {reg214,
                          (8'ha5)})) : reg214[(2'h2):(2'h2)]) : $signed((8'haa)));
              reg216 <= {$signed((+(reg203[(4'h9):(3'h7)] * $unsigned(reg203)))),
                  {reg219[(2'h2):(2'h2)], $unsigned(wire200)}};
            end
          reg220 <= ((+$unsigned(reg199)) ?
              wire196[(4'h8):(3'h6)] : $unsigned(reg203[(3'h4):(2'h2)]));
          reg221 <= (+$signed((~{(!wire201), (reg199 ? reg210 : wire196)})));
        end
      else
        begin
          reg214 <= $signed((|((~|{(8'hbc)}) ?
              $unsigned(((8'ha6) ? reg198 : (7'h43))) : ((reg202 >= reg218) ?
                  (reg207 ? (8'ha6) : reg197) : reg219))));
        end
      reg222 <= reg221;
      reg223 <= $unsigned(wire200);
    end
  assign wire224 = $unsigned($signed(reg203[(4'hd):(2'h2)]));
  assign wire225 = reg221[(2'h3):(1'h1)];
  assign wire226 = (~&{{(reg220 | (^~(8'hb5)))},
                       $unsigned($signed($unsigned(reg222)))});
  assign wire227 = (($unsigned($unsigned($signed(wire192))) <<< wire189[(4'ha):(4'ha)]) > wire193);
  assign wire228 = (reg217[(3'h4):(2'h3)] + {reg197,
                       ($unsigned((reg218 ? wire188 : wire193)) ?
                           $signed((~|(8'ha1))) : reg220[(1'h0):(1'h0)])});
  assign wire229 = (&$signed($unsigned(wire226)));
  assign wire230 = (~^$unsigned($signed($signed({wire224}))));
endmodule

module module152
#(parameter param183 = ({((^(-(8'ha0))) ? ((~&(8'ha6)) ? (-(8'hb2)) : ((8'ha3) ? (8'hb0) : (8'hab))) : (((8'hb1) - (7'h43)) == ((8'haa) ^ (8'hb3))))} >= {(~{((7'h42) & (8'ha5)), {(8'h9f), (8'hb6)}})}))
(y, clk, wire156, wire155, wire154, wire153);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire156;
  input wire signed [(5'h15):(1'h0)] wire155;
  input wire signed [(2'h2):(1'h0)] wire154;
  input wire signed [(3'h4):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire182;
  wire [(4'hb):(1'h0)] wire177;
  wire signed [(4'ha):(1'h0)] wire176;
  wire [(5'h11):(1'h0)] wire175;
  wire signed [(3'h4):(1'h0)] wire174;
  wire signed [(5'h12):(1'h0)] wire173;
  wire [(2'h2):(1'h0)] wire172;
  wire signed [(3'h5):(1'h0)] wire171;
  wire [(5'h15):(1'h0)] wire170;
  wire [(5'h13):(1'h0)] wire166;
  wire [(2'h3):(1'h0)] wire165;
  wire [(5'h15):(1'h0)] wire164;
  wire signed [(2'h2):(1'h0)] wire163;
  wire [(2'h2):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire161;
  wire signed [(5'h11):(1'h0)] wire160;
  wire signed [(4'ha):(1'h0)] wire159;
  wire [(3'h5):(1'h0)] wire158;
  wire [(4'hd):(1'h0)] wire157;
  reg signed [(4'hf):(1'h0)] reg181 = (1'h0);
  reg [(3'h5):(1'h0)] reg180 = (1'h0);
  reg [(5'h13):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg168 = (1'h0);
  reg [(4'h9):(1'h0)] reg167 = (1'h0);
  assign y = {wire182,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  assign wire157 = wire156[(4'he):(3'h7)];
  assign wire158 = (8'hac);
  assign wire159 = (+wire158);
  assign wire160 = (!(wire159 ?
                       $unsigned({(+wire158),
                           wire156[(4'ha):(4'h9)]}) : (&{$unsigned(wire156)})));
  assign wire161 = (!$signed(($unsigned(wire156[(4'he):(2'h3)]) == $signed({wire160,
                       wire158}))));
  assign wire162 = ((~^(+((wire157 ? wire158 : wire161) ?
                       $signed(wire161) : (wire154 <= wire160)))) ^~ (&wire159[(4'h8):(3'h7)]));
  assign wire163 = $unsigned(((wire158[(3'h5):(3'h4)] ?
                           (wire161 >>> (|wire159)) : ($signed(wire154) ?
                               (wire157 ? wire161 : wire156) : (~&wire161))) ?
                       wire159[(3'h6):(3'h6)] : wire156));
  assign wire164 = (~&$unsigned($signed({(~|wire163)})));
  assign wire165 = (wire154 * {(~|((~&wire157) - (wire156 <= wire158)))});
  assign wire166 = $signed({wire158});
  always
    @(posedge clk) begin
      reg167 <= $unsigned(wire160[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if ((~|wire153[(1'h1):(1'h0)]))
        begin
          reg168 <= (-$signed(reg167[(2'h2):(2'h2)]));
        end
      else
        begin
          reg168 <= $unsigned(((+wire163[(1'h0):(1'h0)]) ?
              ((!(wire163 ?
                  wire166 : wire164)) || wire156[(1'h0):(1'h0)]) : reg167[(1'h1):(1'h1)]));
        end
      reg169 <= (wire153 ? reg167[(1'h1):(1'h0)] : wire154[(1'h0):(1'h0)]);
    end
  assign wire170 = (|wire156);
  assign wire171 = ($unsigned({(^wire170[(5'h12):(4'ha)])}) - $unsigned((~|($unsigned(wire165) ?
                       (~^wire166) : $signed(wire165)))));
  assign wire172 = $unsigned(($signed($unsigned(((8'h9c) ^~ wire154))) <= wire160));
  assign wire173 = {((wire153 * $unsigned((+wire164))) && wire164[(1'h1):(1'h0)]),
                       $unsigned(((^~(^wire165)) ?
                           (8'h9c) : wire156[(4'hb):(4'hb)]))};
  assign wire174 = wire171;
  assign wire175 = $signed((($unsigned(wire163) < wire173) > ((!wire171[(3'h5):(1'h1)]) < $unsigned($signed(wire154)))));
  assign wire176 = $signed((wire165 + wire173));
  assign wire177 = wire156;
  always
    @(posedge clk) begin
      reg178 <= $unsigned((^~$unsigned(wire162)));
      reg179 <= wire171[(3'h5):(1'h1)];
      reg180 <= (($unsigned((wire175[(1'h0):(1'h0)] ^~ wire155)) && reg169[(3'h6):(1'h1)]) ?
          $unsigned((8'h9d)) : $unsigned({wire174}));
      reg181 <= ($signed((({wire153, wire153} <<< (|wire158)) ?
          wire159[(4'h9):(4'h9)] : ({wire164,
              wire153} ^~ $signed(reg179)))) ^~ (8'hbc));
    end
  assign wire182 = wire173[(2'h2):(1'h1)];
endmodule
