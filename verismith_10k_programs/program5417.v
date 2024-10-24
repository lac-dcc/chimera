module top
#(parameter param170 = ((8'ha0) ? (+(~&((~|(8'h9f)) & (^~(8'hbf))))) : ((((|(8'h9d)) <<< (|(8'hab))) ^ (((8'ha6) ? (8'hb9) : (8'hb4)) ? (~(8'hbc)) : (^(8'hb1)))) & (~&(((8'hbf) > (8'ha0)) && {(8'hae)})))), 
parameter param171 = ((param170 ? {{(param170 ? param170 : param170)}, {(+param170), ((8'hb4) <<< param170)}} : param170) >= (|((^~(+param170)) ^ (~(param170 ? param170 : (8'h9c)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire169;
  wire signed [(4'h9):(1'h0)] wire168;
  wire signed [(4'hc):(1'h0)] wire167;
  wire [(5'h15):(1'h0)] wire166;
  wire signed [(4'h9):(1'h0)] wire165;
  wire [(4'hf):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire163;
  wire signed [(4'ha):(1'h0)] wire162;
  wire [(4'hf):(1'h0)] wire161;
  wire signed [(3'h7):(1'h0)] wire160;
  wire [(4'hf):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg [(4'ha):(1'h0)] reg150 = (1'h0);
  reg [(3'h5):(1'h0)] reg149 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire138,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (wire3 ^ wire2[(1'h0):(1'h0)]);
  assign wire5 = (7'h40);
  assign wire6 = wire1[(3'h6):(1'h1)];
  module7 #() modinst139 (.wire9(wire1), .clk(clk), .wire11(wire2), .y(wire138), .wire8(wire5), .wire10(wire6));
  always
    @(posedge clk) begin
      reg140 <= ((wire3[(4'h9):(2'h3)] ?
          wire4 : wire6[(2'h2):(2'h2)]) ~^ $signed(($signed({wire3, (8'h9f)}) ?
          ((~^wire138) > wire4) : $signed($signed(wire2)))));
      if ({$signed(($unsigned($unsigned(wire138)) >= ($signed((8'h9e)) ?
              $unsigned(reg140) : (&wire1)))),
          reg140[(4'hf):(4'hc)]})
        begin
          reg141 <= $unsigned((~|(|((wire138 - wire138) || $unsigned(wire6)))));
          if ($signed($unsigned({$unsigned(reg141[(3'h6):(1'h0)]),
              ($signed((8'ha6)) ? ((7'h44) && wire3) : wire4[(2'h2):(2'h2)])})))
            begin
              reg142 <= (((&((wire4 ?
                  reg141 : reg141) ^~ wire1[(1'h0):(1'h0)])) > $signed(wire0)) + (-wire5));
              reg143 <= wire1[(4'hb):(3'h4)];
              reg144 <= ($signed(((~&$signed(wire1)) ?
                  (~^$signed(wire6)) : ((^wire1) ?
                      $unsigned(reg140) : $unsigned(wire2)))) != $signed(((wire2 ?
                      $unsigned(wire0) : wire4[(3'h5):(3'h5)]) ?
                  wire3[(4'h8):(3'h4)] : reg142)));
              reg145 <= wire0[(4'hb):(3'h4)];
              reg146 <= $signed(reg142[(4'hd):(2'h3)]);
            end
          else
            begin
              reg142 <= {(reg140 ?
                      $unsigned({(|reg143)}) : reg146[(1'h1):(1'h0)]),
                  {reg141}};
              reg143 <= ($unsigned(reg143[(2'h2):(1'h1)]) ~^ wire138);
              reg144 <= wire1[(3'h5):(2'h2)];
            end
        end
      else
        begin
          if ($unsigned(((7'h43) < wire0[(4'h9):(2'h3)])))
            begin
              reg141 <= $signed(wire138);
              reg142 <= (8'hb0);
              reg143 <= reg144[(1'h0):(1'h0)];
              reg144 <= ((+(^$signed((wire138 >> wire6)))) ?
                  reg142 : (reg142[(4'h8):(3'h7)] ?
                      $signed($signed((wire138 ^~ (8'hbb)))) : ((-(wire1 > (8'hab))) << (~|$signed(reg141)))));
              reg145 <= $unsigned(((&(reg142 >>> $signed(wire1))) ?
                  $signed(((reg146 ?
                      wire4 : wire5) == reg142)) : {$unsigned($unsigned(reg141)),
                      (reg143 & (wire3 ? reg142 : wire2))}));
            end
          else
            begin
              reg141 <= (|(reg143[(3'h6):(2'h3)] ?
                  $unsigned((-(wire1 | (8'haf)))) : (-$unsigned((~^reg146)))));
              reg142 <= {reg143};
              reg143 <= ((wire138[(4'ha):(4'ha)] ?
                  (~|({reg140, reg140} < (reg144 ?
                      (8'ha8) : wire2))) : $unsigned($unsigned(wire6[(5'h11):(4'he)]))) | (^~wire0));
            end
          if ($signed($unsigned((wire3[(4'h8):(2'h3)] ?
              reg145[(2'h2):(1'h1)] : ($unsigned(reg142) ?
                  wire4 : (reg142 > wire3))))))
            begin
              reg146 <= {(^$signed(($signed((8'hb3)) ?
                      (wire4 ? wire4 : wire138) : $unsigned((8'hb3))))),
                  (~^((+$signed(reg140)) * $unsigned((^reg144))))};
              reg147 <= reg144[(1'h0):(1'h0)];
              reg148 <= {$unsigned($unsigned((8'ha5)))};
              reg149 <= ($unsigned({$signed($unsigned(wire4)),
                      (reg143[(3'h5):(3'h4)] > (-wire2))}) ?
                  reg141 : (-$unsigned({$unsigned(wire3), (wire2 ^ reg148)})));
              reg150 <= $unsigned($unsigned($unsigned((wire3 >>> wire4))));
            end
          else
            begin
              reg146 <= (~|(~&$signed(((wire6 ? reg148 : wire5) ?
                  (reg141 >>> reg147) : reg148))));
              reg147 <= ((-(^{reg148[(2'h3):(1'h0)]})) ?
                  (~|(((reg144 ? reg148 : reg143) ?
                      (~wire0) : $signed((8'ha9))) >= (7'h42))) : ((|wire138) - (reg147 ^ reg141[(4'hb):(4'h9)])));
            end
          if (wire1[(4'hf):(4'h9)])
            begin
              reg151 <= reg144;
              reg152 <= $signed($unsigned($unsigned(reg148)));
              reg153 <= reg146[(1'h0):(1'h0)];
              reg154 <= (wire4[(1'h1):(1'h0)] ?
                  $signed((8'hbb)) : $signed(((~&(&wire4)) ?
                      reg146 : $signed((wire5 ^ reg150)))));
              reg155 <= (8'ha1);
            end
          else
            begin
              reg151 <= reg140[(5'h14):(5'h10)];
              reg152 <= wire4[(2'h2):(1'h0)];
              reg153 <= wire6;
            end
          reg156 <= $signed($signed(wire5[(4'hd):(4'hd)]));
        end
      reg157 <= (wire5 < $unsigned({{$unsigned(reg155),
              (wire2 ? reg153 : (7'h44))},
          $signed(((8'hbc) ? reg141 : reg153))}));
      reg158 <= (!$unsigned(reg140));
      reg159 <= $unsigned(wire6[(4'hf):(2'h2)]);
    end
  assign wire160 = {$signed($signed($unsigned((wire6 + reg156)))),
                       wire3[(3'h4):(2'h3)]};
  assign wire161 = (((~|reg143[(2'h3):(2'h3)]) << {((+reg147) >= wire160)}) * ($unsigned((8'ha6)) ?
                       $signed(((reg156 == reg146) != (reg152 ?
                           wire6 : reg140))) : ((8'hbf) == ($signed(reg144) ?
                           (reg143 ? reg149 : wire3) : wire0[(2'h2):(1'h1)]))));
  assign wire162 = $unsigned({reg154[(3'h5):(1'h0)]});
  assign wire163 = $unsigned({reg147[(1'h0):(1'h0)]});
  assign wire164 = {(^~(!($signed(wire6) == wire4))), reg149[(1'h0):(1'h0)]};
  assign wire165 = {reg150[(4'h8):(3'h6)], reg141};
  assign wire166 = ((+{reg151[(1'h1):(1'h0)]}) ?
                       reg156[(1'h0):(1'h0)] : $signed(reg146[(3'h5):(2'h2)]));
  assign wire167 = ($unsigned($signed(reg155)) || ((8'hba) ~^ reg159[(2'h3):(2'h3)]));
  assign wire168 = (((+{reg159, ((8'ha0) < wire160)}) ?
                           {(^~wire5[(4'hd):(1'h1)]),
                               $unsigned((reg156 ?
                                   wire2 : wire162))} : reg147[(2'h3):(1'h1)]) ?
                       wire167 : (($signed(((8'hb0) ^~ wire160)) ?
                               wire4 : $signed((7'h41))) ?
                           (reg141[(4'h9):(2'h3)] ?
                               {reg140[(5'h12):(4'ha)],
                                   (-reg141)} : {$signed(reg140)}) : $unsigned($signed(((8'haa) <<< reg143)))));
  assign wire169 = (8'ha8);
endmodule

module module7
#(parameter param136 = (&(((8'hb2) ? (~&((7'h41) <= (8'ha4))) : ((|(8'haa)) <= ((7'h43) ? (8'ha0) : (8'hb4)))) ? (((|(8'ha0)) ? ((8'hb7) ^~ (8'hac)) : (8'ha2)) == ({(8'h9f), (8'had)} ? {(7'h40)} : {(8'ha5), (8'ha1)})) : ((((8'hab) ? (8'hb5) : (8'hb7)) <<< (8'ha5)) ? (((8'ha1) ? (8'ha6) : (8'ha4)) & ((8'hb7) * (8'hae))) : (((8'hba) <<< (8'h9d)) ? ((8'h9f) <<< (8'ha0)) : ((7'h40) ? (8'hbe) : (8'ha7)))))), 
parameter param137 = param136)
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire134;
  wire signed [(4'hb):(1'h0)] wire133;
  wire [(4'hf):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire [(4'ha):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire29;
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire95,
                 wire93,
                 wire31,
                 wire12,
                 wire13,
                 wire29,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire12 = wire9[(3'h7):(3'h6)];
  assign wire13 = ((wire8[(5'h12):(3'h4)] ? (~wire11) : wire8[(5'h12):(3'h4)]) ?
                      $signed(wire9[(4'hf):(4'hf)]) : $unsigned(((8'hb7) ~^ wire11)));
  module14 #() modinst30 (.wire15(wire8), .wire16(wire13), .y(wire29), .wire19(wire10), .wire18(wire9), .wire17(wire11), .clk(clk));
  assign wire31 = wire12[(1'h0):(1'h0)];
  module32 #() modinst94 (.clk(clk), .wire35(wire8), .wire36(wire13), .y(wire93), .wire34(wire10), .wire33(wire11));
  assign wire95 = ((~|wire11) < wire29[(2'h2):(2'h2)]);
  module96 #() modinst113 (.wire99(wire9), .wire98(wire31), .y(wire112), .wire100(wire11), .clk(clk), .wire97(wire12));
  assign wire114 = ((~&(^~wire8)) >= ((~($signed((7'h42)) == wire112[(1'h1):(1'h0)])) ?
                       ((((8'hae) ?
                           wire31 : wire13) >>> wire29) & wire31[(4'hf):(4'ha)]) : $unsigned({wire95[(4'hc):(1'h0)],
                           (wire31 ? (8'hb1) : (8'h9e))})));
  assign wire115 = (+wire93[(4'ha):(3'h5)]);
  assign wire116 = wire29[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg117 <= $unsigned($signed(wire13));
      if ($unsigned(((~&$signed(wire31[(4'ha):(2'h2)])) <<< wire12)))
        begin
          reg118 <= $unsigned($signed($signed($signed(wire116))));
          if ({((wire8 ?
                  $signed((~|(8'hbd))) : (wire115 ?
                      (wire31 ?
                          wire8 : wire8) : $signed(wire95))) == (&wire116[(5'h10):(4'hd)])),
              $unsigned(wire12[(3'h5):(1'h0)])})
            begin
              reg119 <= $unsigned((($signed((wire114 > wire95)) ?
                      (wire95 ~^ $signed(wire9)) : wire9[(4'hc):(3'h6)]) ?
                  wire116[(4'he):(4'h8)] : $unsigned(($signed((8'hb9)) ?
                      wire9[(4'hd):(3'h5)] : (reg118 ? (8'hbe) : wire93)))));
            end
          else
            begin
              reg119 <= $signed({(-$unsigned((wire13 ? (8'hb7) : wire12))),
                  $unsigned((8'h9f))});
              reg120 <= $signed((reg118[(2'h2):(1'h1)] ?
                  {$signed(wire93)} : ((+$signed(wire114)) ?
                      wire9[(4'h9):(3'h7)] : $signed(wire31[(4'hb):(4'hb)]))));
              reg121 <= ($signed(reg119[(4'hc):(4'ha)]) & ($unsigned($unsigned($unsigned(wire12))) ?
                  (((wire11 & wire95) | {(8'hbc), wire29}) ?
                      ((^reg120) != (wire112 | (8'haa))) : (~^wire112)) : ((reg119 || $signed(reg118)) ?
                      $unsigned(wire112[(4'ha):(2'h3)]) : ((wire8 ?
                              (8'hb5) : wire95) ?
                          wire12[(1'h1):(1'h0)] : $signed(reg118)))));
            end
          reg122 <= ($signed(((wire12 && reg119) < (wire116[(3'h5):(3'h5)] + (+wire31)))) ~^ reg118);
          if (wire115[(3'h4):(1'h0)])
            begin
              reg123 <= $signed(wire13[(3'h7):(3'h6)]);
              reg124 <= wire95;
            end
          else
            begin
              reg123 <= (((-(wire12 * $signed(reg123))) ?
                      (($unsigned(reg120) ?
                              {wire115} : ((8'hb2) ? wire116 : (8'h9c))) ?
                          reg118[(3'h4):(1'h1)] : ($signed(reg122) ^~ $signed(reg120))) : (^(8'hbd))) ?
                  $signed(($unsigned((reg121 ^~ reg119)) < wire116[(4'hc):(3'h4)])) : reg121[(2'h2):(1'h1)]);
              reg124 <= ((&wire13[(3'h5):(3'h5)]) ?
                  $unsigned(wire9[(4'he):(3'h7)]) : $unsigned((8'hbb)));
              reg125 <= {wire11[(4'ha):(1'h0)]};
            end
        end
      else
        begin
          if (({(~^((8'ha4) ? {(8'ha0)} : (wire31 ? wire112 : wire11)))} ?
              $signed($unsigned((~(reg122 <= wire93)))) : $signed(wire114[(3'h7):(3'h4)])))
            begin
              reg118 <= wire8[(5'h14):(4'hf)];
              reg119 <= reg117;
              reg120 <= {{$unsigned((~|{wire112, (7'h41)})),
                      reg124[(3'h4):(1'h1)]},
                  reg125};
            end
          else
            begin
              reg118 <= $signed((reg119 ?
                  (reg119 ?
                      wire8 : ((wire116 > reg121) ?
                          $signed(wire95) : wire95[(4'hb):(1'h0)])) : wire10));
              reg119 <= ($signed((-wire112[(3'h6):(3'h5)])) ?
                  wire12 : (-reg120[(4'h8):(1'h0)]));
              reg120 <= wire95;
              reg121 <= $signed((wire93 ?
                  ((~|(!(8'ha4))) ?
                      $signed((reg125 ?
                          wire93 : reg124)) : wire112) : reg124[(3'h4):(2'h3)]));
            end
          if ((-($signed(wire9) || ((&$unsigned((7'h44))) ?
              wire114 : (8'hab)))))
            begin
              reg122 <= {(~|($signed(((7'h42) ?
                      wire29 : wire95)) < $unsigned($signed(wire11)))),
                  {{reg117}}};
            end
          else
            begin
              reg122 <= (($unsigned({(reg121 | wire10), $unsigned((8'hb5))}) ?
                      reg119[(3'h6):(2'h3)] : (~^$signed((wire10 == wire93)))) ?
                  wire114 : {(~|$unsigned((~&(8'hbb)))),
                      $signed((reg123[(4'h9):(4'h9)] <<< ((8'hb3) && (8'hae))))});
              reg123 <= {$signed($unsigned((8'hbf)))};
            end
          reg124 <= (~|reg121[(3'h5):(3'h4)]);
          if ({($signed($unsigned((reg125 ?
                  (8'hbf) : wire29))) <= (wire114[(3'h5):(2'h3)] ?
                  $signed(wire115[(4'ha):(4'h9)]) : (!(wire114 ?
                      reg122 : reg117))))})
            begin
              reg125 <= (7'h41);
              reg126 <= $signed(($signed(wire112[(1'h0):(1'h0)]) ?
                  ({(wire11 >>> reg124)} ?
                      (^wire13) : $unsigned((wire31 ?
                          wire114 : reg120))) : ((wire29[(1'h1):(1'h1)] ?
                      (wire95 < reg120) : $signed(wire95)) - (~|wire29))));
              reg127 <= $signed($signed((~^(wire114 | (7'h40)))));
              reg128 <= (^~($unsigned((^~(reg126 >> (8'haa)))) ~^ ($unsigned($unsigned(wire93)) != (~^reg122))));
              reg129 <= (~^{(~(^$unsigned(wire93))), reg120[(4'hc):(1'h1)]});
            end
          else
            begin
              reg125 <= $unsigned((|reg120[(3'h6):(2'h3)]));
              reg126 <= ($signed({$signed(((8'hb5) * wire95))}) ?
                  ({$signed(reg128)} ?
                      (reg123[(3'h4):(3'h4)] ?
                          $unsigned($signed(wire9)) : $unsigned({(8'hbe)})) : {wire95}) : (wire31 * $unsigned(({reg125,
                          wire116} ?
                      reg128 : ((8'hac) && (7'h44))))));
              reg127 <= (&wire114);
              reg128 <= ($unsigned((reg120[(1'h0):(1'h0)] > $signed({(8'hb6)}))) >> $unsigned($signed(reg119)));
              reg129 <= $unsigned(wire9);
            end
          reg130 <= wire115;
        end
      reg131 <= (&(~|{$signed($unsigned(wire115))}));
    end
  assign wire132 = $signed($signed(($signed($signed((8'hb0))) ?
                       $unsigned((wire11 ?
                           (8'hb5) : reg120)) : (|$signed(reg125)))));
  assign wire133 = ($signed($signed(reg125[(4'h9):(2'h2)])) ? wire132 : reg119);
  assign wire134 = $unsigned(((wire95 ?
                       $unsigned((reg121 ?
                           reg119 : wire115)) : $unsigned((~|(8'hb8)))) > (+($unsigned(reg128) ^ reg128[(4'hc):(4'hc)]))));
  assign wire135 = ($signed($unsigned(($signed(wire11) >>> $unsigned(reg118)))) ?
                       (($unsigned($signed(reg121)) ?
                           (reg130 ?
                               $signed(reg126) : (~^(8'hbe))) : reg127) > reg128) : reg120);
endmodule

module module96
#(parameter param111 = ((8'hb4) ? {(~^({(8'hb9)} ? (&(8'hb9)) : (8'hb1))), {(-(8'ha4))}} : (({(^(8'ha2))} || (((8'hae) ? (8'hba) : (8'ha6)) ? ((8'hac) | (8'hb2)) : (8'hb2))) != ((^~{(8'hbb), (8'hbb)}) ? ({(8'haa)} <<< ((8'hb9) ^ (8'hbc))) : ({(8'hb1)} ? {(7'h40), (8'ha4)} : ((8'hb3) ? (8'ha0) : (8'ha0)))))))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire100;
  input wire signed [(4'hc):(1'h0)] wire99;
  input wire [(4'hd):(1'h0)] wire98;
  input wire [(4'h8):(1'h0)] wire97;
  wire signed [(4'hb):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire101 = (^((^($signed((8'hb4)) ?
                       wire98 : (wire99 >>> (8'ha3)))) < (({wire97} ^ $unsigned(wire100)) ?
                       ((|wire100) >>> wire98) : wire98)));
  assign wire102 = (wire98 ?
                       (~&(((wire100 ~^ wire98) <<< $signed(wire100)) ?
                           $unsigned((wire101 | wire97)) : (~&wire99[(1'h0):(1'h0)]))) : (~&(wire100[(4'ha):(3'h6)] ?
                           (|wire101[(2'h2):(1'h1)]) : (wire101 || $signed(wire99)))));
  assign wire103 = $signed(({(~&(wire101 ?
                           wire102 : wire100))} >>> $signed((^(^wire102)))));
  assign wire104 = $signed(wire98[(4'hb):(4'h9)]);
  always
    @(posedge clk) begin
      reg105 <= $unsigned($unsigned($unsigned((&wire99[(3'h7):(1'h1)]))));
      reg106 <= $signed(wire98[(4'hd):(4'h8)]);
      reg107 <= wire104[(2'h2):(1'h0)];
      reg108 <= {$signed(($signed($unsigned(reg105)) ?
              $unsigned((wire103 || reg106)) : wire99))};
    end
  assign wire109 = $signed({(~^reg108), (wire103[(3'h5):(1'h0)] && wire102)});
  assign wire110 = {{$signed(($signed(wire100) ?
                               wire104[(1'h1):(1'h0)] : (wire101 ?
                                   wire103 : reg106)))}};
endmodule

module module32
#(parameter param91 = ((~^((^{(8'hab), (8'hb4)}) ? (((8'had) ? (8'h9c) : (8'hab)) ? (^~(8'hb7)) : (|(8'hba))) : (((8'had) >> (8'h9f)) * ((8'ha7) && (8'hae))))) == (^((8'hac) ? (&((8'hb7) ? (8'ha0) : (8'ha9))) : (|((8'hb6) ? (8'hac) : (8'hb0)))))), 
parameter param92 = ((param91 ? ((param91 && (|param91)) ^ {(!param91)}) : param91) ? (!param91) : ({param91} & (((param91 | (7'h41)) ? (8'hb0) : (&param91)) ? param91 : ((param91 != param91) ^~ {param91, param91})))))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h258):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire35;
  input wire [(5'h11):(1'h0)] wire34;
  input wire [(5'h10):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  assign y = {wire90,
                 wire75,
                 wire74,
                 wire73,
                 wire69,
                 wire68,
                 wire50,
                 wire49,
                 wire48,
                 wire46,
                 wire45,
                 wire38,
                 wire37,
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
                 reg72,
                 reg71,
                 reg70,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg47,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire37 = wire36;
  assign wire38 = {(~&wire35)};
  always
    @(posedge clk) begin
      if (($signed(wire36[(2'h2):(1'h1)]) ?
          ($signed(((^wire35) >= wire34)) ^ $signed((8'hac))) : (({wire35} ^ ((wire33 ?
                  wire37 : wire33) < ((8'hac) ^~ wire35))) ?
              wire36 : wire36[(1'h0):(1'h0)])))
        begin
          if (wire37)
            begin
              reg39 <= {$signed({(|wire36[(1'h0):(1'h0)])}),
                  $signed(wire35[(2'h2):(1'h1)])};
              reg40 <= {$unsigned(($unsigned(((8'hb6) <<< wire33)) ~^ ((-wire36) >= (~(8'had))))),
                  (wire37[(2'h3):(2'h3)] <= wire36[(2'h2):(1'h1)])};
              reg41 <= ((($signed(((8'hb9) << wire36)) ?
                      $signed(reg40[(2'h3):(1'h1)]) : $signed((wire37 | wire38))) <= wire37[(2'h3):(1'h0)]) ?
                  (-$signed($signed(wire37))) : wire35[(4'he):(3'h4)]);
              reg42 <= ($unsigned(wire36) ?
                  $unsigned({$signed(wire37),
                      $signed((reg40 ? reg41 : reg41))}) : $unsigned(wire37));
              reg43 <= $signed(wire34);
            end
          else
            begin
              reg39 <= {wire35};
            end
          reg44 <= reg39;
        end
      else
        begin
          reg39 <= ((wire33[(4'hf):(1'h0)] ?
              (^$signed($signed(wire37))) : ($signed((wire37 | wire33)) << $signed((wire35 ^~ reg40)))) + ($signed((|$signed((7'h43)))) ~^ (|((wire36 ?
              wire37 : wire37) >>> (reg43 ? reg43 : wire38)))));
          reg40 <= (wire37[(2'h2):(2'h2)] ?
              $unsigned($signed(reg39[(1'h0):(1'h0)])) : {$unsigned($unsigned((~(8'had))))});
        end
    end
  assign wire45 = $signed($unsigned(wire37));
  assign wire46 = (wire34 > (&$signed(((-(8'h9d)) > (reg39 >> reg41)))));
  always
    @(posedge clk) begin
      reg47 <= (~&$unsigned($signed({(^~reg43), wire34})));
    end
  assign wire48 = {wire34,
                      {((wire46[(3'h5):(1'h1)] * (reg47 ? reg47 : reg41)) ?
                              $signed(wire35[(3'h6):(1'h0)]) : $unsigned(reg42[(2'h2):(2'h2)]))}};
  assign wire49 = $unsigned($unsigned(wire34));
  assign wire50 = $unsigned((((wire35[(2'h3):(1'h0)] * $signed(wire34)) ?
                          wire33[(3'h4):(3'h4)] : {wire34[(5'h11):(4'hc)]}) ?
                      {{{wire46}, wire36}} : (^~$unsigned(wire38))));
  always
    @(posedge clk) begin
      if ({wire38,
          (($signed($unsigned(reg43)) ?
                  wire49[(4'h9):(1'h1)] : {{wire46, reg47}}) ?
              reg42 : ((~&$unsigned(reg44)) == (^~reg43[(1'h1):(1'h1)])))})
        begin
          if ($signed($unsigned({{wire45[(3'h4):(3'h4)]},
              (reg41[(3'h4):(2'h3)] ? (^~wire36) : (reg44 << reg47))})))
            begin
              reg51 <= reg40[(1'h1):(1'h0)];
              reg52 <= (+$signed($unsigned((reg40[(3'h4):(1'h0)] == (wire50 == wire37)))));
            end
          else
            begin
              reg51 <= {(+$unsigned((((8'ha7) ? wire46 : reg47) ?
                      wire50 : $unsigned(wire34)))),
                  $signed($signed($unsigned((-wire33))))};
              reg52 <= (!$unsigned(wire34));
              reg53 <= $unsigned(reg47);
              reg54 <= (reg51[(3'h6):(3'h5)] >> $signed(wire34));
            end
          reg55 <= $signed(reg41);
          reg56 <= ((({$signed((8'hb1))} ?
                  (-$signed(wire45)) : {wire33[(3'h4):(3'h4)]}) ?
              (reg55 - reg42[(2'h2):(1'h0)]) : $unsigned($signed($unsigned(wire36)))) || (reg52 + (wire33[(4'ha):(4'h9)] + wire46[(2'h2):(1'h0)])));
          if (($unsigned(reg55[(4'he):(4'hc)]) ?
              (~|wire36) : {wire49[(4'h9):(1'h1)]}))
            begin
              reg57 <= reg56;
              reg58 <= ($unsigned((((!wire34) ?
                      $unsigned(wire34) : (reg54 ? reg55 : wire49)) ?
                  $unsigned(wire34[(3'h6):(3'h6)]) : $unsigned($unsigned(reg56)))) >= ($unsigned({$unsigned(wire38)}) ?
                  $unsigned({wire38[(3'h4):(2'h2)]}) : (~^(&(wire33 ?
                      reg57 : wire46)))));
              reg59 <= (^($unsigned((|wire46[(2'h3):(1'h1)])) ?
                  reg57 : (({reg57} ?
                      (-(8'ha8)) : {reg43, reg56}) == ($signed(reg51) ?
                      {(8'hbf)} : wire36))));
              reg60 <= {reg39[(1'h1):(1'h0)], reg51};
              reg61 <= $unsigned(reg43);
            end
          else
            begin
              reg57 <= $unsigned((!{((8'hb1) ^~ ((8'hb0) ? reg61 : reg39))}));
              reg58 <= wire49;
              reg59 <= ((($unsigned((~|reg42)) ?
                      $signed($signed(reg41)) : ((reg61 ^ wire37) == {wire46})) ?
                  ((~&$unsigned(reg54)) ?
                      (reg47 ?
                          (8'hae) : reg56[(3'h4):(1'h1)]) : ((&reg58) >>> $unsigned((8'hac)))) : $unsigned($signed((-reg61)))) ^ $unsigned(reg61[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg51 <= $unsigned(({$signed((reg42 + reg56)),
              ((reg52 | wire35) ? (8'h9f) : (wire37 >> (7'h41)))} != (wire50 ?
              (~&wire46) : $signed($signed(reg59)))));
          reg52 <= (!reg41[(2'h2):(2'h2)]);
          reg53 <= ($signed(((wire34 ? reg51[(4'h8):(3'h5)] : wire33) ?
                  wire45 : (wire34[(2'h3):(1'h1)] ? reg59 : (^~wire35)))) ?
              $unsigned(wire49[(1'h0):(1'h0)]) : (($signed({reg42, (7'h40)}) ?
                  (^{reg52,
                      reg47}) : $signed((reg57 || reg52))) <<< $signed(reg52[(4'hb):(2'h3)])));
        end
      reg62 <= (&($unsigned((reg44 ? {reg51} : (wire35 > reg51))) ?
          $signed((~&(reg56 ~^ wire36))) : (|reg58)));
    end
  always
    @(posedge clk) begin
      if ((((wire36[(1'h1):(1'h1)] * reg62) << (8'haf)) ?
          $signed(wire38[(4'h8):(4'h8)]) : wire33[(4'hf):(3'h5)]))
        begin
          reg63 <= {(8'hb8),
              $signed((+$unsigned(((8'hb1) ? (7'h41) : reg56))))};
          if ((reg59[(2'h3):(2'h3)] ?
              ($signed({(-wire48), (reg40 >>> reg41)}) ?
                  wire37[(1'h1):(1'h1)] : $signed(wire35)) : reg63[(1'h0):(1'h0)]))
            begin
              reg64 <= (~|reg54);
            end
          else
            begin
              reg64 <= $unsigned($unsigned((-reg55)));
              reg65 <= $unsigned($unsigned($unsigned({{reg40, reg52}})));
              reg66 <= reg56[(3'h6):(3'h6)];
              reg67 <= (|reg65[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          reg63 <= (+$signed(reg47));
        end
    end
  assign wire68 = (!$unsigned((($signed(reg56) ?
                      wire46 : wire35) || reg67[(1'h1):(1'h1)])));
  assign wire69 = (reg41[(3'h7):(2'h3)] >= reg52);
  always
    @(posedge clk) begin
      reg70 <= $unsigned(wire38);
      reg71 <= (reg53 >>> ($unsigned($signed({reg53})) ?
          ($unsigned({reg58}) ?
              reg47[(5'h11):(4'hb)] : $signed($signed(reg42))) : $unsigned($signed((^~reg62)))));
      reg72 <= $unsigned(reg44[(2'h3):(2'h2)]);
    end
  assign wire73 = (|(&{((wire34 ? reg44 : reg39) == (wire33 <= reg67))}));
  assign wire74 = $signed(((reg61 ? (+reg72) : reg41[(1'h0):(1'h0)]) ?
                      $unsigned(($unsigned((8'h9f)) + $unsigned(wire49))) : $unsigned(reg60[(3'h4):(2'h2)])));
  assign wire75 = $signed(((((reg60 ?
                          (8'hb6) : wire35) * $signed(reg58)) << $unsigned($unsigned(reg42))) ?
                      $unsigned(reg54) : reg61));
  always
    @(posedge clk) begin
      reg76 <= (reg58 ?
          (~|wire35[(4'ha):(4'ha)]) : ((((reg59 ?
                  (8'h9e) : (8'ha1)) == ((8'hb8) ? reg59 : reg54)) ?
              $unsigned({reg39}) : ((wire48 >= wire46) ?
                  $unsigned(reg41) : $signed(reg42))) != wire75));
      if (reg44)
        begin
          reg77 <= $signed(($unsigned((~^$signed((8'hb3)))) ?
              ((&(+reg65)) && ((!reg43) ~^ wire45)) : (((-reg59) + $unsigned(reg54)) & wire74[(1'h1):(1'h0)])));
          reg78 <= $unsigned($unsigned($signed($signed($signed(reg60)))));
          reg79 <= ((~(wire69[(1'h0):(1'h0)] & wire74)) != $signed(($unsigned(((8'hab) ?
                  reg43 : reg47)) ?
              (reg51[(4'ha):(1'h1)] && (reg39 ?
                  reg44 : wire36)) : (wire69[(3'h6):(1'h0)] ?
                  reg58 : $signed(reg71)))));
        end
      else
        begin
          reg77 <= wire33;
          reg78 <= ((&$unsigned(((8'hb7) ? (|wire34) : reg40))) ?
              (+((&(7'h44)) <<< ((+wire46) ?
                  reg53 : {(7'h42)}))) : $signed(($signed($signed(reg78)) ?
                  {(wire46 >= reg77)} : $unsigned((reg43 ? reg47 : wire69)))));
          if ($signed($unsigned($unsigned({{wire75, reg62}}))))
            begin
              reg79 <= reg76[(5'h10):(5'h10)];
              reg80 <= (wire49[(1'h1):(1'h0)] ?
                  ({$signed($signed(reg39)), reg64[(2'h3):(1'h1)]} ?
                      $signed((reg55 ?
                          $unsigned(wire48) : (reg42 ?
                              reg71 : wire46))) : (~{wire68[(3'h5):(1'h0)],
                          $unsigned((8'hb5))})) : $signed(wire35[(3'h5):(1'h0)]));
            end
          else
            begin
              reg79 <= reg39[(2'h2):(1'h0)];
              reg80 <= (-{((8'ha1) ?
                      (^$signed(wire49)) : ({reg56} ^ (reg41 + wire45)))});
              reg81 <= {$signed({wire69[(3'h5):(1'h0)], reg39})};
            end
        end
      if ($unsigned(wire69[(2'h2):(2'h2)]))
        begin
          if (reg71[(3'h6):(3'h6)])
            begin
              reg82 <= reg47;
              reg83 <= $unsigned(((reg65[(3'h4):(2'h2)] ?
                      {$unsigned((8'hba))} : $signed(((8'hb5) ^~ wire35))) ?
                  $unsigned(reg65[(3'h7):(3'h6)]) : (7'h44)));
            end
          else
            begin
              reg82 <= ($signed(reg65[(4'h8):(4'h8)]) ?
                  reg40[(4'ha):(3'h7)] : {$unsigned(reg53[(2'h3):(1'h1)])});
              reg83 <= $unsigned(($unsigned(reg51) ?
                  reg67[(2'h3):(2'h3)] : {$signed($signed(wire50)),
                      (wire36 >= $unsigned(wire74))}));
            end
          if (({reg83[(1'h1):(1'h0)]} ?
              ((($unsigned(reg62) ?
                  (reg81 ? (8'h9f) : wire33) : $unsigned(reg67)) ^~ (~^(reg54 ?
                  reg65 : reg67))) >>> reg72) : $unsigned($unsigned((-(~^reg54))))))
            begin
              reg84 <= (($signed(({reg42} <= reg47)) ?
                      reg65 : ($unsigned(wire73) ? reg40 : $unsigned(reg40))) ?
                  (reg39 & wire34[(4'hc):(3'h5)]) : (8'hb6));
            end
          else
            begin
              reg84 <= $unsigned($unsigned(wire74[(1'h0):(1'h0)]));
              reg85 <= (^~{reg39[(1'h1):(1'h0)]});
              reg86 <= (~$signed((reg72 ~^ reg76)));
            end
          reg87 <= $unsigned((&((+$unsigned(wire69)) ?
              (wire37 ?
                  reg59[(4'ha):(3'h6)] : (~reg44)) : $unsigned((reg44 == reg82)))));
          reg88 <= reg87;
          reg89 <= (reg72 || ($unsigned(({reg71, reg85} != (wire38 ?
              reg61 : reg70))) >> $unsigned($signed($signed((8'ha0))))));
        end
      else
        begin
          if ((8'h9d))
            begin
              reg82 <= wire45;
              reg83 <= ({$signed(wire34[(4'h9):(2'h3)]),
                      (|$unsigned((wire69 ? (8'haf) : wire35)))} ?
                  reg81 : ((8'had) >>> (^~reg82)));
              reg84 <= $signed((reg39 - $signed(reg59)));
            end
          else
            begin
              reg82 <= {$unsigned($signed((~&(~wire75)))),
                  $signed((&(wire69 + (reg82 ? reg51 : wire34))))};
            end
          reg85 <= $signed((~^(((~|reg54) ? (|reg80) : {(8'hac), wire33}) ?
              wire75[(3'h6):(3'h6)] : reg61[(4'h9):(1'h0)])));
        end
    end
  assign wire90 = (((reg71 <= ((reg61 ?
                      wire34 : wire34) >= (wire49 | reg59))) >= $signed($signed(reg89[(4'ha):(3'h5)]))) * reg52[(1'h1):(1'h1)]);
endmodule

module module14
#(parameter param27 = (7'h44), 
parameter param28 = ((~^(param27 < ((~(8'hab)) != (param27 ? param27 : param27)))) ? (param27 < ((~^(param27 ? param27 : param27)) ? {(~&param27), param27} : ((param27 ? param27 : (8'hab)) == (param27 | param27)))) : (^~(8'hbd))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  assign y = {wire26, wire25, wire24, wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = ($signed(wire15) ?
                      ({{((8'haa) ? wire16 : wire18)},
                          wire18} & $unsigned((wire19 ?
                          wire18[(1'h0):(1'h0)] : (wire16 ~^ wire19)))) : $unsigned(wire16[(2'h3):(1'h0)]));
  assign wire21 = wire15;
  assign wire22 = (8'hb5);
  assign wire23 = (wire15 * wire17[(2'h2):(1'h0)]);
  assign wire24 = {(^$unsigned((wire19 ? wire17 : (wire16 ? wire22 : wire21)))),
                      wire18};
  assign wire25 = $signed({wire15[(3'h5):(2'h3)]});
  assign wire26 = ($signed($signed(((wire22 ? wire23 : wire22) ?
                      (wire17 * (8'hb2)) : $unsigned(wire16)))) - $signed($signed(wire23)));
endmodule
