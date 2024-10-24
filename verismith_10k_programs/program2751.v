module top
#(parameter param207 = ({(((~|(7'h40)) ? ((8'hbb) << (8'hb6)) : ((8'hb3) ? (8'haa) : (8'ha8))) ? (((8'hac) && (8'hb3)) ? {(8'hb2)} : (-(8'hbb))) : (|((8'hb2) ? (8'ha4) : (7'h43)))), ((((8'hb1) >>> (7'h43)) >= (~&(8'ha7))) < {{(8'ha8), (7'h43)}, (~(7'h40))})} ? ((~&(((8'ha5) ? (8'hbd) : (8'hae)) ? (&(8'hb1)) : ((8'hb3) != (8'hb2)))) == ((((8'hbf) > (8'hbe)) - {(8'h9c), (8'haa)}) ? (&((8'hb5) ? (8'hb4) : (7'h42))) : ({(8'hba)} | ((8'ha4) ? (8'hb4) : (7'h41))))) : ((~&(~((8'ha6) ? (8'hba) : (8'ha7)))) && ((~|{(8'hb7), (8'ha7)}) ? {(8'haa)} : (((8'hac) | (8'hb0)) ? ((8'ha8) ? (8'ha8) : (8'hbe)) : ((8'h9c) <= (8'hb0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire206;
  wire signed [(5'h15):(1'h0)] wire204;
  wire signed [(4'hd):(1'h0)] wire184;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  assign y = {wire206,
                 wire204,
                 wire184,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire4 = $signed($unsigned(wire2));
  assign wire5 = $signed(wire2[(3'h6):(3'h4)]);
  assign wire6 = $unsigned((^$signed((~&((8'hbe) <<< (8'ha7))))));
  always
    @(posedge clk) begin
      reg7 <= $unsigned($signed((wire0[(4'hb):(3'h4)] ?
          {{wire5, wire3}, (~|wire4)} : wire1[(2'h2):(1'h0)])));
      if ((~^{wire1[(1'h1):(1'h1)]}))
        begin
          reg8 <= (wire0 >>> {$unsigned($signed((wire3 ? wire3 : reg7))),
              wire3});
          reg9 <= (~|(^~($signed((|(8'hb7))) ~^ wire5[(3'h4):(2'h3)])));
          reg10 <= $signed((7'h44));
          reg11 <= (wire4[(1'h1):(1'h0)] != $signed($unsigned({(-reg9),
              (&reg8)})));
        end
      else
        begin
          if ((~^wire0[(3'h6):(3'h4)]))
            begin
              reg8 <= (wire6[(4'he):(3'h5)] < (8'h9f));
              reg9 <= (((+{wire5[(2'h2):(2'h2)]}) != (wire0[(1'h0):(1'h0)] != wire1)) ?
                  ((($signed(reg9) ? ((8'hbe) <<< wire6) : {wire3, reg11}) ?
                      ($unsigned(wire0) <= $signed(reg11)) : $signed((wire1 && reg10))) && $unsigned({$unsigned(wire2)})) : (&wire1));
              reg10 <= ((|{wire2[(3'h5):(3'h4)], {reg11, {wire4, wire3}}}) ?
                  wire4 : ((((wire0 ? reg8 : wire0) ? wire1 : wire4) ?
                          wire4[(4'hb):(4'h9)] : (|wire0)) ?
                      $signed(((wire4 <= reg10) ?
                          (wire5 ?
                              (7'h44) : wire0) : (|wire1))) : wire3[(5'h13):(2'h2)]));
              reg11 <= (wire5 >>> {((!reg7[(3'h6):(3'h5)]) ^ $signed((reg9 >= wire5))),
                  {$unsigned({reg8, wire2}), (^$signed(reg9))}});
              reg12 <= {wire5};
            end
          else
            begin
              reg8 <= reg12[(2'h2):(1'h0)];
              reg9 <= $unsigned($signed($unsigned($signed(reg7))));
              reg10 <= (+$unsigned(reg11));
              reg11 <= $unsigned((^~$unsigned($unsigned($signed(reg12)))));
            end
          if (wire3)
            begin
              reg13 <= wire0;
              reg14 <= $signed(wire6);
            end
          else
            begin
              reg13 <= $unsigned((($signed(reg9) <= (!(reg14 <<< wire0))) & ($unsigned(reg12) > {wire2})));
            end
          if (reg11[(2'h2):(2'h2)])
            begin
              reg15 <= $signed((!($signed((+reg11)) & wire6[(3'h4):(2'h2)])));
              reg16 <= $signed(reg9);
            end
          else
            begin
              reg15 <= wire4;
            end
          reg17 <= $signed($unsigned($signed(($signed(reg16) ?
              (reg7 ~^ (7'h43)) : $unsigned(wire2)))));
        end
      reg18 <= reg12[(1'h1):(1'h1)];
      reg19 <= $signed(((($unsigned(reg16) ? reg15 : wire3) ?
              $unsigned((8'hb2)) : (~&wire5[(3'h5):(2'h2)])) ?
          wire2[(4'h9):(1'h0)] : ($signed(reg8) * (reg18 - {reg8}))));
    end
  module20 #() modinst185 (wire184, clk, reg15, reg17, reg9, reg18, reg8);
  module186 #() modinst205 (wire204, clk, reg11, reg13, wire4, wire2);
  assign wire206 = (wire0[(3'h4):(2'h3)] ? reg10 : reg7[(4'h8):(2'h2)]);
endmodule

module module186  (y, clk, wire190, wire189, wire188, wire187);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire190;
  input wire signed [(4'h8):(1'h0)] wire189;
  input wire signed [(3'h4):(1'h0)] wire188;
  input wire signed [(5'h14):(1'h0)] wire187;
  wire signed [(4'hb):(1'h0)] wire203;
  wire signed [(4'hf):(1'h0)] wire202;
  wire signed [(4'ha):(1'h0)] wire201;
  wire signed [(5'h15):(1'h0)] wire200;
  wire [(5'h10):(1'h0)] wire199;
  wire [(3'h7):(1'h0)] wire192;
  wire signed [(2'h2):(1'h0)] wire191;
  reg signed [(2'h3):(1'h0)] reg198 = (1'h0);
  reg [(3'h4):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg195 = (1'h0);
  reg [(5'h13):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg193 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire192,
                 wire191,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 (1'h0)};
  assign wire191 = (&$signed($signed(wire189[(3'h6):(3'h5)])));
  assign wire192 = ({(8'hb9)} ?
                       ((~|$signed((^wire189))) ?
                           wire188 : (+$unsigned($unsigned(wire190)))) : wire191[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg193 <= wire189[(1'h1):(1'h1)];
      if (wire189)
        begin
          reg194 <= wire191[(1'h1):(1'h1)];
          reg195 <= (8'hb7);
          reg196 <= {(8'hac)};
        end
      else
        begin
          reg194 <= ((~(7'h41)) && reg195);
          reg195 <= $signed((^(((~&reg196) ?
              reg195 : wire188) & (!(wire190 || wire190)))));
          reg196 <= $unsigned((($signed((&wire190)) == (wire189[(2'h2):(2'h2)] | (wire190 ?
                  reg194 : reg194))) ?
              ($signed(wire192[(3'h4):(1'h0)]) ?
                  (!(~^wire192)) : ((reg195 ? reg195 : wire192) ?
                      reg196[(3'h6):(2'h3)] : $unsigned(wire189))) : ({(reg196 - wire192),
                      $unsigned(wire188)} ?
                  $signed(wire191) : $unsigned(wire192))));
          reg197 <= $unsigned(wire191[(1'h1):(1'h0)]);
        end
      reg198 <= {(+($unsigned(wire190) ?
              ((wire191 ? wire187 : wire191) ?
                  (reg197 ?
                      wire192 : wire190) : reg193) : $signed((+reg195))))};
    end
  assign wire199 = wire187;
  assign wire200 = reg198[(2'h2):(1'h0)];
  assign wire201 = (&{(!wire189)});
  assign wire202 = (8'hbd);
  assign wire203 = ((7'h41) ?
                       (((!wire192) - $signed((reg198 ?
                           reg196 : wire192))) ^~ (~^{reg197})) : wire188[(2'h3):(2'h2)]);
endmodule

module module20
#(parameter param182 = ((~&((!(|(8'hbc))) ~^ (7'h42))) ? ((|((^(7'h43)) ? (~^(8'ha2)) : ((8'hba) ? (8'h9c) : (8'ha6)))) ^~ {{(7'h42)}, (-{(8'ha0)})}) : (((+(^~(8'haa))) ? (((8'haa) ? (7'h42) : (8'ha8)) ? ((8'hb8) ? (8'hb9) : (8'ha4)) : (^(8'hb9))) : ({(7'h40), (7'h43)} ? ((8'ha8) && (8'hbe)) : ((8'ha9) <<< (8'ha4)))) * ((((7'h44) >> (8'hb0)) ? ((8'ha8) > (8'h9e)) : (^~(8'hb8))) >= (((8'hab) ? (8'hbc) : (8'ha8)) ? ((8'ha8) - (8'hba)) : (-(8'hb2)))))), 
parameter param183 = ((((param182 ? (param182 ? param182 : param182) : (8'ha2)) >> param182) || ((((8'hb1) ? (8'hb4) : param182) ? (~param182) : param182) <= {param182})) >= ((((|param182) && param182) ? param182 : {param182, (|param182)}) || {({param182} ? (7'h40) : {param182, param182}), param182})))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire signed [(3'h6):(1'h0)] wire23;
  input wire [(5'h14):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire181;
  wire signed [(4'hf):(1'h0)] wire180;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire178;
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire63,
                 wire27,
                 wire26,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire100,
                 wire109,
                 wire178,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire26 = (8'hb2);
  assign wire27 = (((|$signed((wire23 * wire23))) ?
                      (wire26[(1'h1):(1'h1)] ?
                          wire21[(4'he):(4'hd)] : $unsigned($unsigned(wire23))) : ((8'ha1) <<< ((8'hba) != wire23))) + ($signed({(wire25 << wire21),
                          wire24}) ?
                      $unsigned((~|(~(8'ha7)))) : $unsigned(wire26)));
  module28 #() modinst64 (.wire30(wire26), .wire29(wire25), .clk(clk), .y(wire63), .wire32(wire27), .wire31(wire21), .wire33(wire24));
  assign wire65 = $signed($unsigned((~&(wire27 ? (8'ha2) : (^wire22)))));
  assign wire66 = $unsigned(({wire65[(4'hc):(3'h6)]} < (wire24 * wire22[(3'h6):(2'h2)])));
  assign wire67 = $unsigned(wire25);
  assign wire68 = ($signed((!$signed(wire25))) * $signed(($unsigned((wire27 || wire23)) && $signed({wire24}))));
  module69 #() modinst101 (.clk(clk), .wire72(wire25), .wire73(wire26), .wire70(wire65), .y(wire100), .wire71(wire24));
  always
    @(posedge clk) begin
      reg102 <= wire25;
      if ($signed(((+(^$signed(wire23))) >> wire21[(5'h12):(2'h3)])))
        begin
          reg103 <= $signed((^$unsigned(wire27)));
          reg104 <= $unsigned($signed(wire63));
          reg105 <= $signed(wire66[(5'h12):(4'ha)]);
          reg106 <= (^(wire67 * ((^~$unsigned(wire27)) ?
              wire67 : $signed((|reg102)))));
        end
      else
        begin
          reg103 <= $signed({(wire27 ? $unsigned($unsigned(reg105)) : wire63)});
          reg104 <= $signed(reg102[(4'h8):(1'h0)]);
          reg105 <= $unsigned(((wire24[(3'h7):(3'h7)] ?
              ($unsigned(wire100) & (wire26 ? reg103 : wire65)) : ({wire27,
                      wire65} ?
                  (reg104 << wire63) : {wire27,
                      wire26})) > ((~&wire22[(1'h1):(1'h1)]) > ((^~wire100) ?
              (~&(8'ha2)) : (wire22 ? wire22 : wire65)))));
        end
      reg107 <= $signed(reg106[(1'h0):(1'h0)]);
      reg108 <= reg107[(1'h0):(1'h0)];
    end
  assign wire109 = $unsigned((|(($signed(reg102) ?
                       wire26[(4'hb):(3'h5)] : reg107) || wire25)));
  module110 #() modinst179 (wire178, clk, reg105, wire109, wire21, reg108, wire67);
  assign wire180 = wire109;
  assign wire181 = ($unsigned($signed($unsigned(wire68[(4'h9):(3'h5)]))) || $signed(reg107));
endmodule

module module110
#(parameter param176 = ((((((8'ha5) | (8'h9f)) ? ((8'h9f) ? (8'ha5) : (8'hbf)) : {(8'h9e)}) != ((~|(8'h9d)) ? (^(8'ha2)) : ((8'ha6) ? (8'h9d) : (8'haf)))) || ((&((8'hbc) ? (7'h42) : (8'hab))) ? (((8'hb9) ? (8'hb3) : (8'haf)) != ((8'haf) ? (8'hb2) : (8'ha0))) : (~((8'hba) >>> (8'hbf))))) ? {(((-(8'haa)) < ((8'haf) ? (8'hac) : (8'hbb))) ? {{(8'ha3), (8'hb2)}} : {(-(8'hbb)), (~^(8'ha1))})} : (-{{{(8'hb0)}}})), 
parameter param177 = (8'hb9))
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h2d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire115;
  input wire [(4'h8):(1'h0)] wire114;
  input wire [(5'h13):(1'h0)] wire113;
  input wire signed [(3'h7):(1'h0)] wire112;
  input wire signed [(3'h4):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire175;
  wire [(5'h13):(1'h0)] wire174;
  wire signed [(4'ha):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire146;
  wire [(5'h13):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg [(2'h2):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg171 = (1'h0);
  reg [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(4'h9):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg168 = (1'h0);
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg [(5'h13):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg [(5'h12):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(4'hd):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(2'h2):(1'h0)] reg135 = (1'h0);
  reg [(2'h2):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire147,
                 wire146,
                 wire117,
                 wire116,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
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
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
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
                 (1'h0)};
  assign wire116 = {wire112};
  assign wire117 = {$signed(wire113), (8'ha6)};
  always
    @(posedge clk) begin
      if ((wire117 ?
          $signed(($unsigned((wire115 ? wire114 : wire117)) ?
              wire112[(2'h2):(1'h0)] : $signed(wire114[(3'h7):(3'h7)]))) : (&(wire115[(1'h1):(1'h0)] >= $unsigned(((8'hb4) <= wire116))))))
        begin
          reg118 <= ((~|(8'hb8)) <<< (~&$signed($signed($unsigned(wire113)))));
          reg119 <= wire115;
          reg120 <= wire113;
          reg121 <= ({(|$signed(wire113[(5'h13):(4'hb)]))} ?
              $unsigned(((wire112 <= (wire111 < wire113)) >> ($signed((8'ha8)) ?
                  $unsigned(reg118) : $unsigned(wire112)))) : wire115);
          reg122 <= {($unsigned((~|(|reg119))) >= $signed((+(wire112 ?
                  reg120 : wire116)))),
              (reg118 ?
                  $unsigned({$signed(wire115),
                      (wire113 ^~ wire115)}) : $unsigned($signed(wire116[(3'h5):(1'h0)])))};
        end
      else
        begin
          reg118 <= $signed((~&(({(8'h9c)} <<< (wire113 ^ wire114)) ?
              $signed((reg120 ^~ reg120)) : {(reg118 ? (7'h43) : (8'ha5)),
                  (wire113 || reg121)})));
          reg119 <= wire116[(3'h5):(1'h1)];
          if ((&(~^wire116)))
            begin
              reg120 <= wire117[(1'h0):(1'h0)];
              reg121 <= ($signed(wire114) ?
                  $unsigned(wire115[(3'h4):(3'h4)]) : $signed(((reg119[(4'ha):(4'ha)] * reg118) ?
                      (8'hb0) : (8'hbc))));
            end
          else
            begin
              reg120 <= wire115[(2'h2):(1'h1)];
              reg121 <= reg122;
              reg122 <= reg122;
              reg123 <= (~$unsigned($signed((~&(~wire115)))));
              reg124 <= wire115;
            end
          reg125 <= wire112[(3'h6):(1'h1)];
          reg126 <= ((wire114[(3'h6):(3'h6)] ?
                  $unsigned((|(reg120 + (8'hb5)))) : $unsigned($unsigned(wire111[(3'h4):(1'h1)]))) ?
              wire112[(1'h0):(1'h0)] : $signed((reg123 ?
                  reg123 : $unsigned({reg125}))));
        end
      if (wire115[(2'h3):(1'h1)])
        begin
          if (wire115[(1'h1):(1'h0)])
            begin
              reg127 <= (&(reg118 ? (!wire113) : $signed((!wire112))));
            end
          else
            begin
              reg127 <= (8'ha8);
            end
          if ({{(&(~|(reg123 || (8'ha9))))},
              $unsigned(($signed($signed(wire113)) < wire114[(3'h4):(1'h0)]))})
            begin
              reg128 <= $signed((-(wire116[(4'ha):(3'h7)] < ($signed(reg123) <= $signed(reg119)))));
              reg129 <= (^({$unsigned((wire116 >= wire116)),
                      ({wire112, reg119} ? reg126 : $unsigned(wire116))} ?
                  wire111 : ((8'ha6) ~^ $unsigned(reg121[(1'h1):(1'h1)]))));
              reg130 <= (-wire111);
              reg131 <= reg122[(2'h2):(1'h1)];
            end
          else
            begin
              reg128 <= wire111;
              reg129 <= $unsigned((reg120[(4'h9):(3'h6)] | reg131[(5'h11):(5'h10)]));
              reg130 <= $signed($signed((reg126[(3'h4):(1'h0)] ?
                  reg126 : wire114[(3'h5):(2'h2)])));
              reg131 <= (~&reg124);
            end
          reg132 <= ((~&($unsigned($unsigned(reg130)) ?
              $signed($unsigned(reg127)) : (~^(~&wire115)))) ^ (|{((~^reg131) >= wire117),
              $unsigned($unsigned((8'ha7)))}));
        end
      else
        begin
          reg127 <= ((~&(^~$unsigned(wire111[(1'h0):(1'h0)]))) || wire117[(2'h3):(1'h1)]);
        end
      if ($signed(wire111))
        begin
          reg133 <= ((reg129[(3'h6):(2'h3)] ?
                  (~$signed((~&(8'hbd)))) : $unsigned((((8'hb3) <= (8'ha2)) ?
                      (reg127 >> wire117) : $signed(wire117)))) ?
              ($unsigned($signed(((8'hab) > wire114))) ?
                  (~(|(^wire113))) : wire112[(3'h6):(2'h3)]) : {{reg129[(3'h7):(1'h1)],
                      (+reg123)}});
          if (($signed(wire111) > $signed(($signed(wire115) >> (~&(reg125 > reg132))))))
            begin
              reg134 <= {($unsigned(wire112[(3'h5):(2'h2)]) | (((wire115 ?
                          wire114 : reg133) ?
                      {reg124,
                          reg122} : wire115[(3'h5):(2'h2)]) >= wire117[(4'hc):(3'h6)]))};
              reg135 <= wire115;
            end
          else
            begin
              reg134 <= reg123;
            end
          reg136 <= $signed((~{(reg132 - reg121), wire112}));
          if ((~wire111))
            begin
              reg137 <= ($signed((reg132 <= (~^(reg120 <<< wire111)))) ?
                  ($unsigned($signed(reg119)) ?
                      (+$signed($unsigned(reg121))) : (($unsigned(wire113) || (7'h42)) ?
                          reg133[(1'h1):(1'h0)] : ((wire111 ?
                              reg130 : (8'ha4)) | $unsigned(wire112)))) : (reg127[(2'h2):(1'h0)] ?
                      $signed(($signed(reg135) == $signed(reg126))) : (((reg135 <<< wire111) == $unsigned(reg121)) << ($signed(reg123) << reg135))));
              reg138 <= (^(~|(^($signed(reg130) ?
                  (reg136 ^ reg125) : (^~(8'hab))))));
              reg139 <= wire112;
            end
          else
            begin
              reg137 <= ($unsigned((8'ha9)) - ($unsigned({(8'hb2)}) + (wire114 ?
                  {(8'ha7), reg118} : {$unsigned(wire117)})));
            end
          reg140 <= (^~{(~&$signed((reg122 < (8'hab))))});
        end
      else
        begin
          reg133 <= $unsigned(reg120[(4'hb):(3'h7)]);
          if (reg139)
            begin
              reg134 <= $unsigned((reg120 ?
                  ((8'hb6) ?
                      (~^$signed(reg124)) : $unsigned($unsigned(wire113))) : $unsigned(reg123[(4'h9):(1'h1)])));
              reg135 <= (reg127[(4'ha):(4'h9)] != reg132[(4'ha):(1'h1)]);
              reg136 <= $signed(reg126);
              reg137 <= reg121;
            end
          else
            begin
              reg134 <= (-$signed($unsigned(((reg118 ? reg137 : (7'h40)) ?
                  {wire113, wire116} : (wire117 ? reg134 : wire116)))));
              reg135 <= (reg140[(3'h4):(1'h0)] >>> wire114);
              reg136 <= $unsigned((~^reg136[(3'h7):(3'h6)]));
              reg137 <= wire116;
            end
          reg138 <= $signed(reg125);
          reg139 <= $unsigned((-(($signed((7'h42)) | (reg132 ?
              reg126 : reg120)) == (|$signed(reg140)))));
        end
      if (({reg118[(3'h7):(1'h1)]} ?
          ((^~{(reg136 ? reg132 : wire112), (8'hab)}) ?
              reg121 : (+$signed((~^(8'ha3))))) : (8'hbe)))
        begin
          if ((~($signed((8'ha6)) * (~|((reg119 >> wire117) == $unsigned(wire112))))))
            begin
              reg141 <= (~|reg126);
              reg142 <= wire117;
              reg143 <= $unsigned((8'hba));
              reg144 <= {(~|reg124)};
            end
          else
            begin
              reg141 <= ($signed(reg140) ?
                  (^~reg137) : (|(reg120[(4'hc):(4'hc)] < $unsigned($signed(reg132)))));
              reg142 <= wire114;
              reg143 <= ($signed(reg144[(3'h6):(2'h2)]) - (reg129 ?
                  reg141 : ((^~$unsigned(reg139)) ?
                      wire114 : $unsigned(reg127))));
              reg144 <= (&(wire112[(3'h4):(1'h0)] ?
                  $signed({$unsigned(wire116)}) : reg143));
            end
          reg145 <= ($signed(($unsigned((8'hba)) != (reg125 | wire116[(4'hc):(3'h6)]))) && $signed(((~|$unsigned(reg135)) | $unsigned((^~reg143)))));
        end
      else
        begin
          reg141 <= ((8'ha0) ^ reg145[(3'h4):(1'h1)]);
          reg142 <= $signed(reg132);
        end
    end
  assign wire146 = (-(|(reg134[(2'h2):(1'h1)] ?
                       (~^(~^reg122)) : ((8'ha3) ? {reg126} : reg129))));
  assign wire147 = $unsigned($unsigned(reg142[(3'h6):(2'h3)]));
  always
    @(posedge clk) begin
      if ({$signed((!(wire116 != reg128))), $signed(wire146)})
        begin
          reg148 <= $signed(($signed($signed(wire147[(3'h6):(3'h5)])) != ($unsigned((+reg134)) >> reg138[(1'h0):(1'h0)])));
          reg149 <= (~&((+((reg128 ? reg125 : wire147) && (reg126 << reg143))) ?
              (~^(-$signed(reg123))) : (~^$unsigned((reg128 >= wire147)))));
          reg150 <= (wire112[(1'h1):(1'h1)] ?
              ({(^~wire116),
                      ({reg125} ?
                          $signed(reg149) : (reg135 ? reg130 : reg119))} ?
                  {($signed(reg136) ?
                          reg123[(4'h8):(1'h0)] : $signed(reg142))} : (^~$unsigned(reg118))) : reg145);
          if (((8'hbc) & wire112[(3'h6):(1'h1)]))
            begin
              reg151 <= (8'hb1);
            end
          else
            begin
              reg151 <= {$unsigned($signed(reg128[(3'h5):(1'h0)]))};
              reg152 <= reg118;
            end
          reg153 <= ($signed($signed($unsigned(reg129[(3'h4):(1'h1)]))) < (($unsigned(reg130) >> reg131) && (reg150[(4'h9):(3'h6)] ?
              ($unsigned(wire116) ?
                  {(8'h9f)} : $signed(reg133)) : {$signed(reg131),
                  reg151[(1'h1):(1'h1)]})));
        end
      else
        begin
          reg148 <= reg136[(3'h6):(1'h0)];
        end
      reg154 <= (&(~^$unsigned(reg125[(4'hc):(3'h6)])));
      if ((+((~&((reg141 ? (8'h9f) : reg152) > (8'hb4))) ^~ $signed((8'hb8)))))
        begin
          if (reg133)
            begin
              reg155 <= (reg150[(3'h4):(2'h3)] ?
                  {wire117[(4'ha):(2'h3)]} : (8'ha6));
              reg156 <= (reg151[(4'h8):(3'h6)] ?
                  wire115[(1'h0):(1'h0)] : ({reg150[(4'h9):(3'h6)],
                          wire112[(3'h4):(2'h3)]} ?
                      {(~|$signed(reg129)),
                          $signed((^reg140))} : reg136[(3'h7):(3'h5)]));
              reg157 <= wire111;
            end
          else
            begin
              reg155 <= reg135[(1'h0):(1'h0)];
              reg156 <= {(&$signed($signed($unsigned(reg155)))),
                  $unsigned(((((8'ha7) >>> reg141) >> $signed(reg154)) >= $signed(reg120)))};
            end
          if ((reg133[(2'h2):(2'h2)] ?
              $unsigned((8'hb8)) : $unsigned(((wire117[(4'hc):(4'ha)] + $unsigned((8'hb5))) ?
                  reg148 : (~&wire112[(3'h6):(3'h5)])))))
            begin
              reg158 <= $signed((~&wire112));
              reg159 <= $unsigned($signed($unsigned(({reg125,
                  reg155} >>> $unsigned((7'h42))))));
            end
          else
            begin
              reg158 <= reg132[(4'ha):(1'h0)];
              reg159 <= (~&reg150);
              reg160 <= reg143;
              reg161 <= reg137;
            end
          reg162 <= (reg122 ?
              reg126[(1'h1):(1'h0)] : $signed(((reg158[(5'h13):(4'h8)] ?
                      (^~reg134) : (reg131 < (8'h9d))) ?
                  (^~$unsigned(reg160)) : (reg144 >>> (wire115 | reg157)))));
          if (reg160)
            begin
              reg163 <= ($unsigned($unsigned({reg141})) ?
                  reg123[(3'h6):(3'h6)] : wire147[(1'h1):(1'h1)]);
            end
          else
            begin
              reg163 <= {{reg130, reg151},
                  (reg159[(5'h11):(3'h4)] & (|{wire112, (reg136 != wire117)}))};
              reg164 <= reg142[(3'h5):(1'h0)];
              reg165 <= (~((((^reg140) ? $signed(reg127) : $unsigned(reg160)) ?
                      ((reg138 ? reg159 : wire117) ?
                          ((8'hb9) ? reg141 : reg137) : {reg124,
                              reg122}) : $unsigned((~&reg120))) ?
                  $unsigned(((reg153 ? reg120 : (7'h41)) ?
                      reg129[(1'h1):(1'h0)] : $unsigned(reg143))) : ((reg132[(4'hb):(3'h4)] ?
                          (reg127 && reg164) : reg154) ?
                      {(&reg160), (^reg139)} : ($unsigned(reg161) ?
                          $signed(wire116) : (reg136 ? reg155 : reg163)))));
            end
        end
      else
        begin
          reg155 <= $unsigned($signed((-reg142)));
          if ((reg131[(4'hd):(4'hd)] + (!$signed(reg125))))
            begin
              reg156 <= ($unsigned(reg127) ?
                  reg133 : $signed($signed(reg153[(1'h1):(1'h1)])));
              reg157 <= $unsigned($unsigned(($signed($signed(wire111)) ?
                  ((reg161 >= reg142) <<< (-reg160)) : ($signed((8'hb1)) ?
                      (reg118 ? reg123 : wire111) : $unsigned(reg124)))));
              reg158 <= $signed((!((~&$unsigned(reg124)) && {{wire111}})));
              reg159 <= ($unsigned(($signed($unsigned(wire112)) ?
                  reg140[(3'h5):(1'h0)] : $signed((-reg161)))) != $signed((reg144[(2'h2):(2'h2)] >>> ($unsigned(reg158) && $signed(reg165)))));
              reg160 <= reg157;
            end
          else
            begin
              reg156 <= {((({reg157} ?
                          $signed(reg151) : (reg120 ? (8'hac) : reg151)) ?
                      (^(wire117 ^ wire112)) : reg161[(4'ha):(2'h2)]) | {{(!reg129),
                          reg123[(4'h8):(1'h1)]},
                      reg137[(3'h6):(3'h5)]})};
              reg157 <= (~|reg140);
              reg158 <= reg119[(3'h5):(3'h4)];
              reg159 <= (reg155[(3'h6):(3'h6)] ?
                  $unsigned((($signed(reg138) ?
                      $unsigned(reg145) : (reg154 || reg122)) ^~ ((reg127 ?
                          reg133 : reg124) ?
                      {wire111,
                          wire112} : $unsigned(reg124)))) : $signed({{$unsigned(reg134)}}));
              reg160 <= (8'hb9);
            end
        end
      if (reg144[(3'h5):(2'h3)])
        begin
          reg166 <= reg134;
          reg167 <= reg126;
          if (reg156[(3'h5):(3'h4)])
            begin
              reg168 <= $unsigned(($unsigned(reg155) > {((&(7'h44)) >>> reg159[(4'he):(4'hd)])}));
              reg169 <= (($signed(reg151[(4'hd):(2'h3)]) ^ reg131[(5'h10):(4'h8)]) ?
                  $signed(((reg164[(4'hb):(3'h7)] ?
                          (reg165 ? reg164 : reg148) : {reg162, wire116}) ?
                      $unsigned(reg141) : $signed((reg129 <<< wire111)))) : ({reg138,
                          {reg159[(5'h12):(4'hf)], wire146}} ?
                      reg119 : reg134[(2'h2):(1'h0)]));
              reg170 <= $unsigned((reg128 ?
                  reg130 : (reg118 <= reg152[(4'h9):(3'h7)])));
              reg171 <= (|$signed((wire146 ?
                  $signed(reg162) : (~$signed((8'hb2))))));
              reg172 <= reg143[(3'h5):(3'h5)];
            end
          else
            begin
              reg168 <= reg148[(5'h12):(4'hb)];
            end
          reg173 <= reg172;
        end
      else
        begin
          reg166 <= reg160;
          reg167 <= $unsigned($unsigned(reg148));
          reg168 <= (~reg170[(2'h3):(1'h1)]);
          reg169 <= {(+(|(reg169 != reg149))),
              {{reg160, (^reg151[(4'hb):(3'h4)])},
                  $unsigned($unsigned(wire115[(1'h1):(1'h1)]))}};
        end
    end
  assign wire174 = ($unsigned((!{{reg148}})) < (-reg143[(4'hc):(3'h7)]));
  assign wire175 = (!reg163[(2'h2):(2'h2)]);
endmodule

module module69
#(parameter param99 = (((((+(8'hb4)) <= (&(8'ha4))) ? (((8'h9d) ? (8'hab) : (8'hb5)) ? (8'h9c) : ((8'ha4) && (8'ha4))) : (((8'ha0) ? (8'hb6) : (8'hb1)) ^ {(8'hbb), (8'ha2)})) || ({(-(8'ha3)), (~|(8'hbf))} ? ({(8'h9c)} ? ((8'hbd) < (8'hae)) : {(8'h9d)}) : (8'ha4))) ? ((((~^(8'ha8)) ? ((8'hbe) - (8'hbe)) : ((7'h44) & (8'hbf))) ? (((8'ha9) ^~ (8'hb0)) + (8'hb0)) : ((~^(8'ha9)) & ((7'h43) ? (8'hb9) : (8'hb4)))) ? (~&(((8'haf) ? (8'hab) : (8'hba)) ? (+(8'hb0)) : ((8'h9e) ? (8'h9d) : (8'ha0)))) : (~((~|(8'h9d)) ? (8'ha8) : ((8'ha5) | (8'h9e))))) : (!(((^(8'hbb)) << ((8'hb7) ? (8'h9d) : (7'h42))) | ({(8'hb1), (7'h43)} - {(8'ha4)})))))
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire73;
  input wire [(5'h14):(1'h0)] wire72;
  input wire [(4'he):(1'h0)] wire71;
  input wire [(3'h4):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  assign y = {wire98,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
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
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire73[(4'h9):(3'h6)] < $unsigned(wire73)))
        begin
          reg74 <= $unsigned((~^$signed(wire73)));
          reg75 <= ($unsigned((&((wire70 ~^ (8'had)) ?
              $unsigned(wire73) : (-wire73)))) >>> (^(wire71 ?
              $signed(wire71[(4'hb):(4'h8)]) : wire72[(3'h4):(2'h2)])));
        end
      else
        begin
          reg74 <= $signed(wire72[(4'hb):(4'hb)]);
          reg75 <= wire70[(2'h3):(2'h2)];
          reg76 <= wire73[(4'hb):(1'h1)];
          reg77 <= $unsigned((|reg76));
        end
    end
  assign wire78 = (8'hb4);
  assign wire79 = $unsigned(($signed($unsigned(reg74)) ?
                      $unsigned(reg75) : (!$unsigned({reg77, wire72}))));
  assign wire80 = ((wire73 ?
                          ($signed(reg76[(3'h7):(3'h5)]) >= {reg75}) : $unsigned($unsigned((reg74 ?
                              (8'h9d) : wire79)))) ?
                      {$unsigned((wire72 ?
                              $signed(wire71) : wire78))} : wire73[(1'h0):(1'h0)]);
  assign wire81 = wire71[(3'h4):(3'h4)];
  assign wire82 = ($unsigned(reg76[(1'h1):(1'h1)]) ?
                      ((((reg75 ?
                              wire72 : wire73) != $signed(wire72)) <= $unsigned((wire73 - (8'hb2)))) ?
                          $signed($unsigned($unsigned(reg74))) : ((((8'hac) ?
                                  wire78 : reg77) ?
                              (reg75 <= (8'ha0)) : wire79[(2'h2):(1'h0)]) >= {wire80[(4'ha):(3'h5)]})) : ({wire73} ?
                          reg77[(4'h8):(1'h0)] : (~&{(wire71 - reg75),
                              (wire70 <<< wire71)})));
  assign wire83 = (wire70[(1'h0):(1'h0)] << reg76[(2'h2):(1'h0)]);
  assign wire84 = $unsigned((((+$signed(reg74)) ?
                      (wire81 ^ (wire78 - wire81)) : wire83) & wire71));
  always
    @(posedge clk) begin
      if ($signed(reg76[(1'h0):(1'h0)]))
        begin
          if ((~^(^((7'h40) ?
              wire79 : ((wire72 ? (8'hbd) : wire72) ?
                  (wire78 ? wire72 : wire73) : wire79[(3'h4):(3'h4)])))))
            begin
              reg85 <= $unsigned($signed(($unsigned($signed(wire73)) | ((&reg75) || {(8'had),
                  (8'ha1)}))));
              reg86 <= {(^~wire73)};
              reg87 <= (wire72 >> (($signed(wire71) ?
                      wire81 : $signed(((8'ha1) & (8'ha7)))) ?
                  $unsigned(($signed(wire73) >> $unsigned(wire72))) : {$signed($unsigned(reg75)),
                      $signed((-reg77))}));
            end
          else
            begin
              reg85 <= wire71;
              reg86 <= reg74;
              reg87 <= $unsigned(wire73[(5'h15):(1'h1)]);
              reg88 <= reg74;
            end
          reg89 <= (~^(~(~|($signed(wire81) == $signed(wire82)))));
          reg90 <= {(^~(wire78 ?
                  (((8'ha4) ? wire84 : reg88) ?
                      (~wire72) : $signed(wire71)) : ($signed(reg77) ?
                      $unsigned(reg89) : (reg77 ? wire71 : wire70))))};
          if (({(+reg86[(4'ha):(2'h3)])} ?
              wire78[(1'h0):(1'h0)] : (~{reg76[(4'h8):(3'h5)], reg77})))
            begin
              reg91 <= {(8'hb8)};
              reg92 <= $unsigned((^~$unsigned(reg88)));
            end
          else
            begin
              reg91 <= $unsigned(($signed((8'hab)) & (wire84 ?
                  reg91 : (wire83[(4'h9):(4'h8)] ?
                      wire82[(1'h0):(1'h0)] : $signed(wire82)))));
              reg92 <= $signed(reg75);
              reg93 <= $signed((reg91[(1'h1):(1'h0)] ~^ $unsigned(reg89)));
              reg94 <= (~^((((reg75 ? reg86 : reg88) ?
                  (wire84 ? wire81 : (8'h9e)) : {reg75,
                      (8'hb2)}) < wire81[(4'hf):(3'h7)]) * $signed((|reg74))));
              reg95 <= (8'h9c);
            end
          reg96 <= $signed(((!(^(reg76 ^~ wire79))) >= reg86[(1'h1):(1'h1)]));
        end
      else
        begin
          reg85 <= $signed($unsigned((reg85[(3'h5):(2'h2)] ?
              ({reg75} < wire78) : (^~(reg96 > reg91)))));
        end
      reg97 <= (!(wire80 >= wire72[(2'h2):(2'h2)]));
    end
  assign wire98 = ($signed(wire70) ?
                      (~^reg95[(3'h7):(1'h1)]) : ((~|(~((8'haa) >>> wire70))) << ($signed(wire81[(4'he):(4'hc)]) ?
                          ((&(8'hae)) ?
                              $signed(reg86) : wire81[(3'h6):(2'h2)]) : ($unsigned(reg75) ^ reg77))));
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire34;
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  assign y = {wire62,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire35,
                 wire34,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
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
                 (1'h0)};
  assign wire34 = (($unsigned((~|(wire32 ? wire31 : wire33))) ?
                          wire31 : (wire32[(1'h1):(1'h0)] && ((8'hb8) == $signed(wire32)))) ?
                      wire30 : (^$signed((&((8'ha7) == wire30)))));
  assign wire35 = (~^(+wire32));
  always
    @(posedge clk) begin
      reg36 <= (8'h9d);
      if ($unsigned((({$signed(wire29)} < $signed($signed(wire34))) & $signed($unsigned(wire31)))))
        begin
          if (wire31[(4'he):(1'h1)])
            begin
              reg37 <= {(~(($signed(reg36) ?
                          wire30[(4'hf):(2'h3)] : reg36[(3'h5):(1'h1)]) ?
                      ((!wire34) ?
                          (wire32 ?
                              wire33 : reg36) : $unsigned(wire33)) : $signed((~wire32))))};
            end
          else
            begin
              reg37 <= wire29[(1'h0):(1'h0)];
              reg38 <= wire30;
              reg39 <= (wire33[(2'h3):(2'h2)] ?
                  $unsigned($signed($signed($unsigned(reg38)))) : reg38[(4'he):(4'hc)]);
              reg40 <= ((|({$unsigned(wire30), $unsigned(reg36)} ?
                      $unsigned((wire29 ?
                          reg36 : wire30)) : $signed({reg37}))) ?
                  wire32[(1'h0):(1'h0)] : {reg38,
                      $unsigned($unsigned((&reg39)))});
              reg41 <= (({(!wire30[(3'h5):(1'h0)]),
                          ((8'ha1) ? (~|wire30) : $signed((8'ha8)))} ?
                      reg38[(3'h5):(1'h1)] : ($unsigned($unsigned(wire30)) | wire33)) ?
                  $signed($unsigned($unsigned((+reg38)))) : reg36);
            end
          reg42 <= ({{$unsigned((wire29 ? reg38 : reg36)),
                  (!{wire33, reg37})}} >> $signed(wire33));
          if ((!reg41))
            begin
              reg43 <= wire30;
              reg44 <= wire34;
              reg45 <= wire29;
              reg46 <= ((7'h43) > ((reg36 & ((~^reg40) ?
                      {wire33, reg37} : (^~(8'ha6)))) ?
                  (wire29[(3'h5):(3'h4)] & $unsigned(reg38[(4'he):(1'h1)])) : (~reg39)));
              reg47 <= $signed(reg43);
            end
          else
            begin
              reg43 <= (((wire34[(2'h2):(1'h0)] ?
                          ((8'hb1) ^~ (&reg45)) : ((|reg41) ?
                              $signed(reg47) : (reg47 ? reg47 : reg42))) ?
                      (+reg43) : $signed((|(reg42 ? wire33 : reg46)))) ?
                  $unsigned((^~$signed((reg45 >>> (8'had))))) : reg44);
              reg44 <= (^(8'ha3));
              reg45 <= $unsigned(wire32);
            end
        end
      else
        begin
          reg37 <= wire35;
          reg38 <= $signed((-wire29));
          reg39 <= ({$signed({(reg36 ? (8'had) : reg38)})} ?
              ((reg46[(4'h9):(2'h3)] ?
                      {(reg40 ? reg42 : reg47)} : ({reg42, reg47} ?
                          (8'haa) : wire34[(1'h1):(1'h0)])) ?
                  (8'ha4) : reg44) : $unsigned({wire32[(1'h1):(1'h1)]}));
          reg40 <= reg44;
        end
      if ((~|$unsigned((~$signed(reg37[(4'he):(4'h9)])))))
        begin
          reg48 <= {$unsigned((8'hbe))};
          reg49 <= (~|(wire30 ?
              $unsigned((8'hb3)) : $unsigned((-wire33[(4'h8):(3'h7)]))));
        end
      else
        begin
          reg48 <= (8'h9c);
          reg49 <= $unsigned((|((reg40 ? (^~reg39) : {reg38}) ?
              $unsigned((wire33 >= reg47)) : wire35)));
        end
      reg50 <= $signed((8'hbe));
    end
  assign wire51 = (^reg47);
  assign wire52 = wire29[(3'h7):(3'h4)];
  assign wire53 = reg43[(3'h6):(1'h1)];
  assign wire54 = reg49[(4'hb):(1'h0)];
  assign wire55 = $signed(wire32[(2'h3):(1'h1)]);
  assign wire56 = wire53;
  assign wire57 = ($unsigned($unsigned({(^~wire52), wire35[(4'ha):(3'h7)]})) ?
                      wire54 : (+$signed((reg40 ^~ reg50))));
  always
    @(posedge clk) begin
      reg58 <= $unsigned(reg39[(1'h0):(1'h0)]);
      reg59 <= (~&(reg46 ?
          wire53[(4'h8):(1'h0)] : ($signed((+wire52)) ?
              ((wire57 ? reg47 : reg46) < ((8'had) ?
                  wire53 : reg49)) : (^~reg44))));
      reg60 <= reg39;
      reg61 <= (~|reg37);
    end
  assign wire62 = {((wire35[(1'h1):(1'h0)] ?
                              (~wire57) : $signed({(8'hb7), wire51})) ?
                          wire35 : (^(reg40 ^~ reg58[(1'h0):(1'h0)])))};
endmodule
