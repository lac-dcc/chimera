module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire216;
  wire signed [(3'h6):(1'h0)] wire209;
  wire signed [(4'hc):(1'h0)] wire208;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire204;
  wire signed [(5'h10):(1'h0)] wire206;
  reg [(5'h10):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg214 = (1'h0);
  reg [(4'hb):(1'h0)] reg213 = (1'h0);
  reg [(5'h14):(1'h0)] reg212 = (1'h0);
  reg [(4'hc):(1'h0)] reg211 = (1'h0);
  reg [(4'hb):(1'h0)] reg210 = (1'h0);
  reg [(5'h13):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  assign y = {wire216,
                 wire209,
                 wire208,
                 wire6,
                 wire7,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire204,
                 wire206,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg4,
                 reg5,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed($signed((-{(wire0 && wire2), $signed((7'h42))})));
      reg5 <= ($unsigned((8'hb3)) ?
          (wire0[(3'h7):(3'h7)] ?
              (~^{(wire0 >= (8'hb2)),
                  $unsigned(wire1)}) : wire3) : $unsigned((~&($signed((8'hab)) ?
              (wire0 <<< reg4) : wire0))));
    end
  assign wire6 = reg4[(2'h3):(1'h0)];
  assign wire7 = wire6;
  always
    @(posedge clk) begin
      reg8 <= (^~wire0);
      if ($signed(wire0))
        begin
          reg9 <= reg4[(3'h7):(3'h5)];
          if ((($unsigned((+wire3[(2'h2):(2'h2)])) >= (8'ha5)) ^ ($signed(wire3) ?
              $signed(wire7) : (reg8[(2'h2):(1'h1)] + ({wire3} ?
                  $signed(wire1) : reg8)))))
            begin
              reg10 <= reg4;
              reg11 <= (wire0[(4'h8):(3'h5)] ?
                  reg4[(4'he):(2'h2)] : {$unsigned(reg10[(4'ha):(3'h4)])});
              reg12 <= reg11;
              reg13 <= reg8[(2'h2):(1'h0)];
            end
          else
            begin
              reg10 <= reg9;
              reg11 <= {((~wire1) ?
                      ($unsigned($unsigned(reg9)) ^~ (wire7 < (wire1 != wire6))) : reg13[(5'h13):(4'hf)])};
              reg12 <= reg13[(5'h11):(4'h9)];
              reg13 <= ($unsigned($signed($signed((wire7 ? reg11 : (8'hb0))))) ?
                  $unsigned($signed($unsigned(reg10[(4'hd):(3'h4)]))) : wire3[(4'h8):(3'h4)]);
              reg14 <= wire0[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg9 <= reg4;
          reg10 <= (($unsigned((~|$signed((7'h40)))) ?
              $signed(($unsigned(reg11) == $unsigned(reg4))) : (((wire0 ?
                      reg4 : reg13) ?
                  reg9 : $signed(wire0)) < reg5[(3'h7):(1'h0)])) | (-(reg5 ?
              $unsigned(wire7[(4'hb):(1'h0)]) : wire1[(1'h0):(1'h0)])));
        end
    end
  assign wire15 = ($unsigned($unsigned(((+wire3) <= (8'ha3)))) ?
                      reg4[(4'h8):(1'h1)] : (($unsigned(reg12) ?
                          ((wire1 ? wire1 : reg14) && (reg12 ?
                              (8'hb6) : (8'hbd))) : $signed($signed((8'ha6)))) >>> (8'hba)));
  assign wire16 = $unsigned(((7'h41) ?
                      {$signed({wire1}),
                          ($signed(wire15) < (reg8 ?
                              wire6 : wire2))} : $signed(((|reg10) ?
                          $signed(reg9) : (reg8 ? wire0 : wire1)))));
  assign wire17 = ({reg9} ?
                      {wire16[(5'h12):(5'h11)]} : ($signed((+$unsigned(reg10))) << ((+$signed(wire15)) ?
                          ((~&wire1) ?
                              (reg13 ? wire3 : reg5) : {wire3,
                                  (8'ha0)}) : wire7[(3'h4):(2'h3)])));
  assign wire18 = ({reg9} ?
                      ({reg10,
                          ((8'hb9) ?
                              ((8'ha6) ?
                                  reg10 : (8'haa)) : (wire1 & wire6))} < reg9) : (~&$signed(({reg8} ?
                          $unsigned(reg4) : (+reg10)))));
  assign wire19 = reg4;
  module20 #() modinst205 (.wire21(reg9), .clk(clk), .y(wire204), .wire25(wire17), .wire22(wire0), .wire24(reg12), .wire23(reg11));
  module20 #() modinst207 (.wire22(reg14), .wire23(wire0), .y(wire206), .wire25(reg9), .wire24(reg11), .wire21(reg10), .clk(clk));
  assign wire208 = wire15;
  assign wire209 = {$unsigned(wire208)};
  always
    @(posedge clk) begin
      reg210 <= $unsigned((wire16 << $unsigned((reg8[(1'h0):(1'h0)] >= wire2[(4'h9):(1'h1)]))));
      reg211 <= (-wire16[(2'h2):(2'h2)]);
      reg212 <= ((~^(wire2 && $unsigned((reg8 * wire1)))) << (reg211 ?
          $unsigned($signed(wire208[(4'hb):(4'h9)])) : ((~^$signed((8'haa))) - reg13)));
      if ((8'hb0))
        begin
          reg213 <= (reg4[(4'ha):(3'h4)] << reg14[(3'h4):(3'h4)]);
          reg214 <= $signed((-reg8));
        end
      else
        begin
          reg213 <= reg9;
          reg214 <= $signed((^~(reg213 | reg12[(4'hd):(3'h6)])));
          reg215 <= $signed((-wire16));
        end
    end
  assign wire216 = wire204[(3'h7):(3'h7)];
endmodule

module module20
#(parameter param202 = (&((|(~^(!(8'ha4)))) << {({(7'h42), (8'hbb)} ? ((7'h41) ? (7'h40) : (8'ha6)) : (&(8'hbe)))})), 
parameter param203 = (~|(~^(({param202, param202} << (param202 ? param202 : param202)) ? (8'hb6) : (~^((7'h40) ? param202 : (8'h9f)))))))
(y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire23;
  input wire [(4'h8):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire201;
  wire [(4'hc):(1'h0)] wire200;
  wire signed [(4'ha):(1'h0)] wire199;
  wire signed [(5'h10):(1'h0)] wire198;
  wire signed [(2'h2):(1'h0)] wire197;
  wire signed [(4'h9):(1'h0)] wire196;
  wire [(4'ha):(1'h0)] wire195;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire193;
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire39,
                 wire41,
                 wire42,
                 wire59,
                 wire60,
                 wire91,
                 wire93,
                 wire94,
                 wire108,
                 wire123,
                 wire193,
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
                 (1'h0)};
  module26 #() modinst40 (wire39, clk, wire21, wire22, wire25, wire23);
  assign wire41 = (~|(wire25[(3'h6):(2'h2)] ?
                      wire21 : {wire23, $unsigned((wire22 * wire39))}));
  assign wire42 = (wire21 << ($signed((~^(wire41 ? wire24 : wire22))) ?
                      ($unsigned((wire22 ? wire39 : wire22)) ?
                          wire23 : {(!(8'hbe))}) : (&{((8'haf) + wire23)})));
  always
    @(posedge clk) begin
      reg43 <= {(wire22 ?
              wire23[(3'h4):(2'h2)] : $unsigned(wire25[(3'h5):(3'h5)]))};
      if ((wire23 * ({((8'hb4) > $unsigned(wire22)),
          wire39[(3'h6):(1'h1)]} & $signed($unsigned(((8'ha7) ~^ wire21))))))
        begin
          if ($unsigned(reg43))
            begin
              reg44 <= (!(wire21[(5'h10):(4'h8)] ?
                  {($signed(reg43) ^ wire21)} : (+{$unsigned(wire39),
                      $unsigned(wire21)})));
              reg45 <= (({((wire42 ?
                      wire42 : wire23) || wire21)} + (~&reg44[(3'h4):(1'h0)])) == (~&($unsigned((reg43 ^~ wire39)) ?
                  $unsigned((~wire23)) : ($unsigned(wire22) > (wire21 ?
                      wire24 : wire39)))));
              reg46 <= $signed(wire21[(2'h2):(1'h1)]);
            end
          else
            begin
              reg44 <= $signed((((!(~&wire39)) << {{reg43, wire42},
                      wire21[(4'hd):(3'h4)]}) ?
                  wire24[(1'h1):(1'h0)] : {$signed(reg46)}));
              reg45 <= (wire23 && (8'h9e));
            end
          reg47 <= {(~^(~(~|(~&reg43)))), wire41[(3'h5):(3'h4)]};
          reg48 <= {wire24, $unsigned((-(~^(reg46 ? reg45 : reg43))))};
          reg49 <= {$unsigned((((wire23 ? wire22 : wire39) ~^ (wire25 ?
                      reg48 : reg48)) ?
                  (~wire41) : $unsigned(reg48)))};
        end
      else
        begin
          reg44 <= reg49[(1'h0):(1'h0)];
          reg45 <= $signed(($signed((((8'ha9) || wire39) ?
                  (8'ha2) : wire42[(1'h0):(1'h0)])) ?
              (|reg44) : $signed((&wire41))));
          reg46 <= (($unsigned($unsigned($unsigned(reg45))) >>> $signed(((8'h9e) ?
              wire22[(4'ha):(2'h3)] : (reg43 ?
                  (8'hbd) : reg48)))) > $unsigned($unsigned($signed($unsigned(wire25)))));
          reg47 <= (|$signed(reg44[(2'h3):(1'h1)]));
        end
      reg50 <= (-(wire39[(5'h11):(4'h8)] > reg47));
      if (((($unsigned(reg50[(2'h2):(1'h0)]) ?
          (~^reg50) : wire23) & (+wire41[(3'h7):(1'h0)])) <<< (reg47 == $unsigned(($signed((8'ha5)) ?
          $unsigned((8'hbd)) : (+reg43))))))
        begin
          reg51 <= (~reg47);
          reg52 <= ({wire21,
                  ($signed($signed(wire21)) ?
                      reg43[(1'h1):(1'h1)] : $unsigned({(8'ha0), wire25}))} ?
              (!(reg49[(2'h2):(1'h1)] ?
                  (|(reg50 ^~ reg43)) : $unsigned((reg50 ?
                      (8'h9f) : reg47)))) : ((wire42[(3'h5):(1'h1)] ?
                  {(reg51 ?
                          reg50 : wire41)} : ((wire24 <= wire39) | $signed((8'ha0)))) == (^~(~^(|reg50)))));
          reg53 <= $unsigned((~^$unsigned(($unsigned(wire22) + (^~reg46)))));
          reg54 <= (+$unsigned(((^(wire24 + reg44)) ?
              $signed(wire21) : ($signed(reg51) >> (8'hb6)))));
        end
      else
        begin
          if ((8'ha2))
            begin
              reg51 <= {reg50[(2'h3):(1'h1)], wire42[(4'hc):(3'h4)]};
              reg52 <= ({$unsigned($unsigned((wire25 ? reg51 : reg48))),
                  reg44} && reg44[(3'h4):(3'h4)]);
              reg53 <= (wire24[(3'h4):(1'h1)] ? (7'h42) : (~^(8'h9c)));
              reg54 <= reg53[(1'h1):(1'h0)];
              reg55 <= (reg52[(2'h3):(2'h2)] & reg45);
            end
          else
            begin
              reg51 <= (wire42[(2'h3):(1'h0)] ?
                  reg43[(2'h3):(1'h0)] : $signed(($unsigned($signed(reg47)) ?
                      $unsigned((reg50 == reg43)) : {((7'h41) + reg54)})));
              reg52 <= (&wire39[(3'h4):(1'h0)]);
            end
          reg56 <= reg51;
          reg57 <= {reg47[(2'h2):(2'h2)]};
          reg58 <= (&reg46);
        end
    end
  assign wire59 = (^$unsigned((8'hb7)));
  assign wire60 = $signed(reg50[(3'h4):(2'h3)]);
  module61 #() modinst92 (wire91, clk, wire22, wire25, reg44, reg55);
  assign wire93 = (!$unsigned((reg55[(4'hb):(2'h2)] < (wire24 ?
                      (8'had) : {reg43, reg55}))));
  assign wire94 = wire60;
  module95 #() modinst109 (.wire99(wire39), .wire97(reg52), .wire98(reg48), .y(wire108), .wire96(wire22), .clk(clk));
  module110 #() modinst124 (.y(wire123), .wire112(reg54), .wire113(reg46), .clk(clk), .wire114(wire94), .wire111(wire23));
  module125 #() modinst194 (.y(wire193), .clk(clk), .wire126(reg50), .wire127(wire24), .wire128(reg43), .wire129(reg49));
  assign wire195 = (~&$unsigned(($signed($unsigned(wire25)) ?
                       wire21[(4'h9):(3'h4)] : wire60)));
  assign wire196 = $signed((&reg44[(3'h4):(3'h4)]));
  assign wire197 = (((!(^~$unsigned(wire23))) ?
                       (|(~^wire91[(4'h9):(2'h2)])) : reg45) >> (8'h9f));
  assign wire198 = (~|$unsigned(((~((8'h9c) ?
                       wire42 : (8'hb6))) <= $unsigned((wire39 ?
                       wire94 : (8'ha0))))));
  assign wire199 = reg57[(2'h2):(2'h2)];
  assign wire200 = $unsigned((~&reg45[(2'h3):(2'h2)]));
  assign wire201 = $unsigned($signed({(~|$signed(reg54))}));
endmodule

module module125
#(parameter param191 = (&({(^~{(8'haa)})} || {((~^(8'ha3)) >> ((7'h40) >= (8'hba)))})), 
parameter param192 = ((param191 == param191) ? (((param191 >= (&(8'ha2))) ? (-param191) : {(|param191)}) < (((~param191) ? (param191 ^ param191) : {param191, param191}) > ((~(8'h9e)) ? (param191 < (8'ha4)) : (param191 ? param191 : param191)))) : ((^(^(param191 >>> param191))) ? {((param191 ? (8'hbf) : param191) ? (^param191) : ((8'ha6) || param191)), (!param191)} : param191)))
(y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h28d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire129;
  input wire [(2'h3):(1'h0)] wire128;
  input wire [(2'h2):(1'h0)] wire127;
  input wire [(4'hf):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire190;
  wire signed [(3'h5):(1'h0)] wire189;
  wire [(5'h14):(1'h0)] wire188;
  wire signed [(4'hf):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire164;
  wire signed [(5'h12):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire159;
  wire [(2'h2):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  wire [(5'h15):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire130;
  reg [(5'h12):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg [(3'h5):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg178 = (1'h0);
  reg [(2'h3):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg174 = (1'h0);
  reg [(5'h15):(1'h0)] reg173 = (1'h0);
  reg [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg168 = (1'h0);
  reg [(3'h6):(1'h0)] reg167 = (1'h0);
  reg [(5'h10):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg165 = (1'h0);
  reg [(3'h5):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg161 = (1'h0);
  reg signed [(4'he):(1'h0)] reg160 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg156 = (1'h0);
  reg [(5'h10):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg154 = (1'h0);
  reg [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(3'h7):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg146 = (1'h0);
  reg [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire170,
                 wire169,
                 wire164,
                 wire163,
                 wire159,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
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
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg162,
                 reg161,
                 reg160,
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
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire130 = (~{(wire128 && (!(wire127 * wire129)))});
  assign wire131 = ((8'hac) ?
                       wire126[(2'h2):(2'h2)] : (~&(wire126[(4'hb):(1'h1)] ?
                           wire129 : $unsigned((&(8'hb7))))));
  assign wire132 = ((wire128 + {$signed(wire131),
                           ((!wire131) <<< $unsigned(wire130))}) ?
                       (($signed(wire127) ?
                           wire129 : (|$unsigned(wire129))) <<< (&(wire128 ?
                           wire131[(4'hb):(1'h0)] : wire129[(2'h3):(2'h2)]))) : ((((wire131 + wire126) ?
                                   $unsigned(wire130) : (wire126 ?
                                       wire129 : (8'hae))) ?
                               wire131[(5'h10):(5'h10)] : wire131) ?
                           $unsigned((~&(8'hae))) : $signed(wire129)));
  assign wire133 = (~^$unsigned((($unsigned(wire128) ?
                       $signed(wire131) : (wire131 ?
                           wire128 : (8'hb3))) | {((8'hbe) ?
                           (8'ha8) : wire127)})));
  assign wire134 = $signed($signed((!wire128[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg135 <= wire132;
      if (((reg135 <<< $unsigned($unsigned({wire133, wire128}))) ?
          (|wire126[(4'h8):(2'h3)]) : reg135))
        begin
          if ($unsigned($unsigned($unsigned((~|{(8'ha3)})))))
            begin
              reg136 <= wire132;
              reg137 <= ($signed(((^~$signed(wire132)) - wire131[(2'h2):(2'h2)])) ?
                  ((+$signed((wire126 ?
                      wire132 : wire127))) != $unsigned({wire129})) : wire133[(1'h0):(1'h0)]);
            end
          else
            begin
              reg136 <= {(!$unsigned((reg135[(2'h2):(1'h0)] ~^ {reg136,
                      reg136}))),
                  ($unsigned({$signed((8'h9d))}) ?
                      $unsigned(wire131) : wire132)};
            end
          reg138 <= wire131;
          reg139 <= (|reg137[(3'h6):(3'h5)]);
          reg140 <= (~|(((-(+reg138)) ?
                  {wire132[(1'h1):(1'h0)]} : $unsigned($unsigned(wire130))) ?
              (!(~$signed(wire133))) : ($signed({wire129}) ?
                  ((reg135 ?
                      (8'hae) : reg138) <= {(8'hbe)}) : {$signed((8'hbe))})));
          reg141 <= reg139;
        end
      else
        begin
          reg136 <= reg141;
        end
      reg142 <= {$signed(reg137[(2'h2):(1'h0)]),
          $signed((~&(&wire128[(1'h1):(1'h1)])))};
      reg143 <= wire131;
    end
  always
    @(posedge clk) begin
      reg144 <= ($signed({reg139}) - $unsigned(reg136));
      reg145 <= reg143;
      reg146 <= (reg142[(1'h1):(1'h1)] ?
          ({reg136} ?
              wire134[(1'h1):(1'h1)] : (reg140[(3'h5):(3'h5)] | (^((8'hbe) | (8'h9d))))) : ((8'haa) ?
              ($signed(reg144[(4'h9):(3'h6)]) || ((reg142 ^~ wire129) ?
                  reg141[(5'h11):(4'h8)] : $unsigned(wire128))) : $unsigned(((reg141 ?
                      wire129 : (8'ha7)) ?
                  (wire131 ? reg138 : wire130) : (reg136 == reg135)))));
    end
  always
    @(posedge clk) begin
      reg147 <= ($unsigned(reg144) != $unsigned($signed({$unsigned(reg136),
          $signed(reg143)})));
      reg148 <= wire134;
      reg149 <= reg135[(1'h0):(1'h0)];
      if ($unsigned(reg136))
        begin
          if ((8'hb8))
            begin
              reg150 <= (wire130 ~^ wire129);
              reg151 <= wire131[(5'h14):(4'h8)];
              reg152 <= ((((&(~^wire126)) ?
                  $signed({reg148}) : ((reg143 ? (8'hba) : reg150) ?
                      reg150 : (reg140 ?
                          reg146 : reg146))) ^~ $signed({$signed(reg148)})) ~^ wire134[(1'h0):(1'h0)]);
            end
          else
            begin
              reg150 <= reg141;
              reg151 <= ($signed($signed(reg151[(4'h9):(1'h1)])) ?
                  (reg141[(4'h8):(3'h6)] >= wire131) : $signed((reg139[(1'h1):(1'h0)] != (^~$unsigned(reg138)))));
              reg152 <= reg138;
              reg153 <= $signed(wire130[(1'h0):(1'h0)]);
            end
          reg154 <= reg139[(1'h0):(1'h0)];
          if (reg136)
            begin
              reg155 <= reg145;
              reg156 <= (~|($signed((^~(wire128 ? reg152 : reg140))) ?
                  reg151 : ((~&wire128) ?
                      ((+reg152) ?
                          $signed(wire130) : (wire127 * wire131)) : (((8'hb2) == reg155) != $unsigned(reg154)))));
            end
          else
            begin
              reg155 <= reg142[(1'h0):(1'h0)];
              reg156 <= (reg150[(2'h3):(1'h0)] ?
                  reg154[(2'h3):(2'h2)] : $unsigned((reg152[(3'h4):(2'h2)] ?
                      reg146[(3'h7):(1'h0)] : $signed((~&reg156)))));
              reg157 <= (reg136[(2'h3):(1'h0)] == reg144);
            end
        end
      else
        begin
          if (({$signed(((reg150 * reg156) ? (reg139 || reg152) : (~^wire129))),
                  (reg145 - reg144[(3'h4):(2'h3)])} ?
              wire127[(2'h2):(1'h1)] : $signed({reg146[(5'h12):(4'ha)]})))
            begin
              reg150 <= (7'h41);
              reg151 <= reg141[(3'h6):(2'h3)];
            end
          else
            begin
              reg150 <= (&(+$signed(($signed(reg138) ^ {reg143}))));
              reg151 <= reg146;
              reg152 <= (^$signed((reg139 == (^reg151[(2'h2):(1'h1)]))));
              reg153 <= wire131;
            end
          reg154 <= ($unsigned((|(!(wire131 ? wire127 : reg157)))) <<< ({reg154,
              $unsigned({reg156,
                  (8'hbc)})} >= (reg138[(3'h7):(1'h1)] == (^~reg143))));
          reg155 <= (wire133 ?
              reg146 : ($unsigned(reg153[(4'hc):(2'h3)]) ~^ reg146[(5'h10):(4'hb)]));
          reg156 <= (((7'h43) ? reg136[(2'h2):(1'h1)] : $signed(reg147)) ?
              $unsigned((~^reg142)) : reg155);
          reg157 <= $unsigned(wire134);
        end
      reg158 <= (((7'h43) > wire131[(5'h12):(1'h1)]) != reg154);
    end
  assign wire159 = $unsigned(reg149);
  always
    @(posedge clk) begin
      reg160 <= reg147[(4'hd):(4'hd)];
      reg161 <= $unsigned(reg151);
      reg162 <= $unsigned({(reg161[(2'h2):(1'h1)] ?
              {$unsigned(wire126)} : reg142)});
    end
  assign wire163 = wire131[(4'he):(4'ha)];
  assign wire164 = reg139[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg165 <= $signed(({$unsigned((reg140 ?
              (8'hb2) : wire164))} ^ (($signed(reg150) <= (reg152 ?
          wire159 : reg148)) <= ({reg150} != (wire163 ? (8'hb8) : reg156)))));
      reg166 <= {($unsigned(reg165) ?
              ((reg145[(3'h6):(2'h3)] < (wire127 - reg165)) ?
                  ($signed(wire128) ?
                      reg158 : $unsigned(wire134)) : $unsigned((reg147 ?
                      reg155 : wire159))) : $unsigned(wire134[(1'h0):(1'h0)])),
          ((((~^reg147) ? wire131 : wire134[(1'h0):(1'h0)]) << {(-reg162)}) ?
              (reg137 ?
                  ($unsigned(reg154) | (reg151 ?
                      reg143 : wire132)) : $signed({reg149,
                      reg148})) : ({{reg154, reg155}} ?
                  ($signed(reg155) ?
                      {wire128,
                          reg144} : $signed(reg155)) : wire126[(4'h9):(4'h8)]))};
      reg167 <= ({(8'hb4)} ^~ $unsigned((8'had)));
      reg168 <= reg148[(3'h5):(1'h0)];
    end
  assign wire169 = $unsigned({$unsigned(reg152[(3'h4):(2'h2)]), reg137});
  assign wire170 = {{(~$signed($signed(reg144))), $signed((^wire132))}};
  always
    @(posedge clk) begin
      if (reg161[(1'h0):(1'h0)])
        begin
          reg171 <= $signed((($unsigned((~wire133)) ?
              $unsigned((wire169 ?
                  wire127 : reg156)) : $unsigned($unsigned(wire170))) ^ $unsigned(wire126)));
          reg172 <= $signed((~$unsigned(($signed(reg149) << (wire131 ?
              (8'hbb) : reg143)))));
        end
      else
        begin
          reg171 <= (~&reg146[(2'h2):(2'h2)]);
          reg172 <= $unsigned($signed($unsigned($unsigned(reg165))));
          reg173 <= $unsigned((!{reg146[(3'h5):(2'h2)],
              ((wire130 ? wire127 : wire169) ?
                  (wire131 ? reg149 : reg154) : (wire126 == wire133))}));
          reg174 <= ((^(reg141 <= reg136)) && $signed((($signed(reg141) ^ (reg166 ?
                  reg166 : wire129)) ?
              (wire130 <= ((8'ha7) ?
                  reg143 : reg138)) : reg172[(5'h11):(3'h4)])));
        end
      reg175 <= reg173;
      reg176 <= wire169[(4'h8):(2'h3)];
      reg177 <= reg139[(1'h0):(1'h0)];
      reg178 <= wire133[(3'h5):(2'h3)];
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg140))
        begin
          if ($signed(((~reg138[(4'h8):(3'h4)]) ?
              {$unsigned(reg136[(2'h3):(1'h1)]),
                  {reg138[(4'hd):(4'ha)]}} : $signed(({reg139} == $signed(reg156))))))
            begin
              reg179 <= (8'hb1);
              reg180 <= {($unsigned((^((8'hb7) ?
                      reg160 : reg158))) | ($signed((reg137 - wire127)) ?
                      (reg177 ?
                          $unsigned(reg146) : $unsigned(reg147)) : (~^(reg150 ?
                          reg179 : reg148))))};
              reg181 <= (reg143 >= (((reg168 ?
                      (~&reg142) : ((8'hbd) >> reg137)) > ($signed(reg176) <= (~|reg162))) ?
                  wire170[(4'h8):(4'h8)] : (7'h44)));
              reg182 <= $unsigned((^~$signed($signed(reg139[(1'h0):(1'h0)]))));
              reg183 <= {{(((wire130 < wire159) && (reg178 >>> reg168)) - reg137[(3'h7):(1'h0)])}};
            end
          else
            begin
              reg179 <= ((-($signed($signed(reg156)) ?
                  $unsigned((~^(8'hae))) : ({reg174, reg183} ?
                      {wire134} : (wire134 ?
                          reg147 : (8'h9e))))) <= $unsigned(reg152[(2'h2):(1'h1)]));
              reg180 <= {{reg171}, reg176[(2'h2):(1'h1)]};
              reg181 <= (~&$signed(reg137[(1'h1):(1'h1)]));
            end
          if ((reg145[(3'h6):(3'h6)] || wire131[(4'he):(4'hd)]))
            begin
              reg184 <= reg173;
              reg185 <= (^(8'had));
              reg186 <= $signed(wire130);
              reg187 <= $unsigned((8'ha8));
            end
          else
            begin
              reg184 <= reg148;
              reg185 <= (^reg155);
              reg186 <= reg149;
            end
        end
      else
        begin
          if (reg150[(3'h4):(2'h3)])
            begin
              reg179 <= {($signed(reg171[(3'h7):(3'h7)]) > $unsigned(reg172[(5'h10):(4'hf)])),
                  ($signed($signed($signed(reg156))) ?
                      $signed({reg158[(2'h3):(2'h3)]}) : ($unsigned((reg147 <= reg175)) ?
                          reg142[(1'h1):(1'h1)] : ((wire133 ?
                                  (8'ha6) : (8'hae)) ?
                              reg149[(3'h4):(1'h0)] : (reg181 ?
                                  reg140 : reg184))))};
              reg180 <= (($signed((reg162[(1'h0):(1'h0)] >= reg175[(5'h15):(4'h9)])) ?
                  reg135[(2'h3):(2'h3)] : ({(reg165 ? wire131 : reg175),
                      reg180[(1'h1):(1'h1)]} == (((8'h9e) ? reg184 : wire134) ?
                      reg185 : ((8'ha8) ?
                          reg181 : reg171)))) && wire127[(2'h2):(1'h1)]);
            end
          else
            begin
              reg179 <= reg161[(2'h2):(2'h2)];
              reg180 <= $unsigned(($signed($unsigned((reg174 ?
                  (8'hb3) : (8'had)))) << reg184));
              reg181 <= $unsigned(wire159);
              reg182 <= {($unsigned(reg158[(2'h2):(1'h0)]) == (~wire132[(1'h1):(1'h0)])),
                  (reg144 ?
                      (reg158[(2'h2):(2'h2)] ?
                          reg171[(1'h1):(1'h1)] : wire134[(1'h0):(1'h0)]) : ((reg178 ?
                          {reg166,
                              reg174} : $signed(reg166)) * $signed((reg160 >> reg181))))};
            end
          reg183 <= (((~^(|reg141[(3'h7):(1'h0)])) ?
              reg149[(2'h2):(1'h0)] : $unsigned({(reg184 ? wire132 : reg162),
                  ((8'ha8) < reg142)})) <= reg141);
        end
    end
  assign wire188 = $signed(reg155);
  assign wire189 = ((^~(wire126[(4'h8):(2'h2)] < (wire128 ?
                           reg136 : $unsigned(reg144)))) ?
                       (8'hbe) : $signed((reg136 ?
                           (~&(wire159 << wire132)) : (~&reg136[(2'h2):(1'h0)]))));
  assign wire190 = wire126[(4'h8):(1'h0)];
endmodule

module module110  (y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire114;
  input wire signed [(3'h4):(1'h0)] wire113;
  input wire signed [(2'h3):(1'h0)] wire112;
  input wire [(2'h3):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire119;
  wire signed [(2'h3):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire115;
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire116,
                 wire115,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire115 = wire111[(1'h0):(1'h0)];
  assign wire116 = $unsigned((~$signed($unsigned(wire113[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg117 <= $unsigned((7'h44));
      reg118 <= (~^(8'haf));
    end
  assign wire119 = (~(^wire116));
  assign wire120 = {(wire119 ?
                           (((~&wire116) ? wire116 : wire119[(4'he):(4'hd)]) ?
                               $unsigned((reg117 ?
                                   wire116 : reg118)) : wire119) : $signed($signed((wire119 != (8'hab)))))};
  assign wire121 = wire113[(3'h4):(3'h4)];
  assign wire122 = ({$unsigned($unsigned($unsigned(wire121)))} ~^ wire119[(4'h8):(2'h3)]);
endmodule

module module95
#(parameter param107 = (&(~^((((8'hb7) == (8'h9f)) == ((8'hb1) && (8'hb1))) ? (~|(|(8'hb7))) : ((&(7'h43)) ? {(8'hbb)} : ((8'hbc) ? (8'h9c) : (8'haf)))))))
(y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire99;
  input wire signed [(4'hb):(1'h0)] wire98;
  input wire signed [(5'h14):(1'h0)] wire97;
  input wire [(4'hf):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire101;
  wire [(3'h4):(1'h0)] wire100;
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 (1'h0)};
  assign wire100 = $signed(wire99);
  assign wire101 = wire96[(3'h7):(1'h1)];
  assign wire102 = $signed($unsigned($signed($signed((~^wire99)))));
  assign wire103 = (~|(wire99[(1'h1):(1'h1)] ?
                       (({(8'hbe), (8'ha9)} ?
                               wire97 : (wire101 ? wire96 : wire101)) ?
                           $unsigned((wire96 ?
                               wire97 : wire96)) : $unsigned($unsigned(wire97))) : (wire98[(2'h3):(2'h2)] * $unsigned((wire102 ?
                           (7'h43) : (8'h9e))))));
  assign wire104 = ((($signed(wire98) ? wire97 : wire100) ?
                       (($signed(wire99) ?
                               {wire102, wire97} : wire99[(2'h3):(1'h1)]) ?
                           ((^wire97) + (~|wire103)) : ($unsigned(wire97) ?
                               ((8'haf) ?
                                   wire99 : wire97) : wire96)) : (($unsigned(wire99) * wire97[(5'h10):(4'hc)]) ?
                           $unsigned(((8'hb7) - wire101)) : ($unsigned(wire102) ?
                               $signed(wire98) : (!wire102)))) << wire99[(1'h0):(1'h0)]);
  assign wire105 = wire102[(5'h12):(4'ha)];
  assign wire106 = (^~($signed((wire99 || wire99)) ?
                       $signed(((wire104 ? wire100 : (8'hbb)) ?
                           (wire105 ?
                               wire97 : wire98) : ((8'ha6) ^~ wire97))) : ($signed($unsigned(wire96)) ?
                           $unsigned(wire101) : ($unsigned(wire105) ?
                               wire99[(2'h2):(1'h1)] : wire100))));
endmodule

module module61
#(parameter param90 = (((~^(+(|(8'hbc)))) * ((((8'h9d) ? (8'hb3) : (8'hb8)) ? ((8'hac) ^ (8'hbb)) : (~(7'h40))) ? ({(8'h9c), (8'hbd)} ? (~|(8'h9c)) : {(8'ha3)}) : (!((7'h42) <= (8'hbf))))) * (~((~&((8'hb2) ? (7'h40) : (8'ha2))) ? (!((7'h44) ? (8'ha0) : (8'hb1))) : (((8'hb7) > (7'h43)) ? ((8'ha5) - (8'had)) : (+(8'ha5)))))))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire65;
  input wire [(4'h8):(1'h0)] wire64;
  input wire [(4'h8):(1'h0)] wire63;
  input wire signed [(4'h8):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire66;
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire80,
                 wire79,
                 wire66,
                 reg82,
                 reg81,
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
                 (1'h0)};
  assign wire66 = wire65;
  always
    @(posedge clk) begin
      reg67 <= (wire63[(3'h5):(2'h2)] ?
          $unsigned((~|$signed($signed((8'ha0))))) : wire63);
      reg68 <= wire66;
      reg69 <= $signed((~$unsigned(wire64[(3'h7):(3'h5)])));
      reg70 <= (8'haa);
      if ($signed($unsigned((reg70[(3'h7):(3'h6)] ^ $signed(((7'h40) > reg67))))))
        begin
          if ($unsigned({($unsigned($signed(wire62)) == ((^~reg70) ?
                  {wire63} : (reg69 ^ wire64))),
              (wire63 ?
                  ((wire66 ? reg67 : wire63) ?
                      (~(8'hac)) : (~^(7'h41))) : ($unsigned(reg70) ?
                      $signed(wire62) : (wire62 ? wire62 : wire64)))}))
            begin
              reg71 <= wire62;
              reg72 <= {(~(~|((reg67 >>> reg70) * $signed(wire62))))};
              reg73 <= reg68[(1'h1):(1'h0)];
              reg74 <= (!((~&($signed(reg69) | {reg69,
                  wire64})) > $unsigned($unsigned((reg68 ?
                  (8'ha7) : wire65)))));
            end
          else
            begin
              reg71 <= reg68;
              reg72 <= wire63;
              reg73 <= (($unsigned((^{(8'hb3), wire66})) ?
                      {$unsigned(wire63)} : $signed((wire63 ?
                          wire62 : $unsigned(reg72)))) ?
                  $signed($unsigned(reg70[(2'h2):(1'h0)])) : (!((reg67 ?
                          $signed(wire65) : {reg71, wire66}) ?
                      {$unsigned(wire66)} : $signed((wire66 * reg69)))));
              reg74 <= $unsigned($signed({($unsigned(reg73) != (^reg68)),
                  (~|{wire62})}));
              reg75 <= ($signed(reg74) ?
                  (((wire64 ?
                          (!reg67) : reg69[(1'h1):(1'h0)]) * reg70[(4'h8):(3'h5)]) ?
                      (~|reg69[(3'h4):(1'h1)]) : $unsigned(wire65[(3'h4):(3'h4)])) : ($signed((~wire65)) ?
                      {((~^reg71) >>> reg70)} : wire66[(1'h0):(1'h0)]));
            end
          reg76 <= {((reg71[(1'h1):(1'h0)] ?
                  ($unsigned(reg75) ~^ wire65) : reg75[(1'h0):(1'h0)]) > reg67[(4'h8):(4'h8)])};
          reg77 <= ((^~(reg70[(2'h2):(1'h1)] >= ((reg69 | (8'ha6)) < $unsigned(reg69)))) + (!(^reg75[(3'h7):(3'h4)])));
        end
      else
        begin
          if (reg76[(4'h9):(3'h5)])
            begin
              reg71 <= $unsigned((reg73 ?
                  wire62 : ((~&reg72[(3'h6):(3'h6)]) ?
                      $signed((~&wire66)) : $unsigned(wire65))));
              reg72 <= (reg74[(3'h4):(1'h1)] ?
                  ($signed((~|$unsigned((8'hb3)))) ?
                      ({(-reg71)} + (8'haf)) : reg72[(1'h0):(1'h0)]) : (($signed(reg77[(3'h6):(2'h3)]) << ((reg70 ?
                      reg76 : reg72) * $unsigned(reg73))) <<< {wire66}));
              reg73 <= ($unsigned((reg75[(1'h1):(1'h0)] ?
                  $unsigned(reg71) : reg67)) - ((^(|$unsigned(reg68))) ?
                  wire62 : {$unsigned($signed(wire64)),
                      $unsigned(reg76[(1'h0):(1'h0)])}));
              reg74 <= (~$signed((~^(~^(reg67 != reg76)))));
            end
          else
            begin
              reg71 <= ($unsigned((~&wire63[(2'h2):(1'h1)])) >> reg69);
              reg72 <= (($signed((((7'h42) ? reg76 : reg70) ?
                      reg69 : (wire64 ? wire64 : reg71))) <= wire64) ?
                  {$unsigned(((reg77 ? wire66 : reg67) ?
                          wire66[(4'h8):(3'h4)] : $signed(wire65)))} : (~wire64[(3'h6):(1'h1)]));
            end
          reg75 <= ($signed(reg68) ?
              $signed({$signed(reg73[(4'h9):(1'h1)])}) : $unsigned((+$unsigned(reg74[(4'h8):(2'h2)]))));
          if (reg74[(1'h1):(1'h1)])
            begin
              reg76 <= reg67;
              reg77 <= $unsigned((&$signed((!reg76[(4'he):(4'h8)]))));
              reg78 <= reg71;
            end
          else
            begin
              reg76 <= ((($signed(wire62) ?
                      $signed((wire66 ? reg68 : wire63)) : ((wire62 ?
                          wire66 : reg69) >> ((8'h9f) ? (8'hb3) : reg76))) ?
                  {((reg76 <<< reg75) ? (~^reg78) : (reg73 ? reg70 : wire62)),
                      ((8'ha2) ^~ $signed(reg70))} : wire65[(1'h0):(1'h0)]) - $unsigned($signed((7'h44))));
              reg77 <= $unsigned((!(~$signed(reg74))));
              reg78 <= (8'hbb);
            end
        end
    end
  assign wire79 = reg69[(1'h0):(1'h0)];
  assign wire80 = (~|reg70[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg81 <= (reg78[(3'h5):(1'h1)] ?
          reg71 : (({$unsigned(wire62),
              $unsigned(wire66)} + wire79) ^ $signed((|$signed(reg70)))));
      reg82 <= ((|$signed($signed((reg70 ? reg73 : reg71)))) ?
          ((~|reg70[(2'h3):(2'h3)]) < $unsigned(reg77[(3'h5):(2'h2)])) : wire64);
    end
  assign wire83 = $signed(reg78);
  assign wire84 = reg72;
  assign wire85 = (reg78[(1'h0):(1'h0)] ?
                      (reg68[(1'h1):(1'h1)] ?
                          (wire79 >= $signed((8'ha7))) : ((~$unsigned((7'h44))) < reg82[(1'h0):(1'h0)])) : wire65);
  assign wire86 = ($unsigned($unsigned((|reg82[(1'h0):(1'h0)]))) ?
                      wire63 : wire64[(4'h8):(3'h6)]);
  assign wire87 = wire86;
  assign wire88 = (^reg73);
  assign wire89 = ((($unsigned(wire84) <= (~|{wire66})) + $unsigned(((wire66 <<< wire64) ~^ (~reg69)))) + reg81);
endmodule

module module26
#(parameter param37 = ((((~((8'hbe) ? (8'haf) : (8'had))) >= (((8'ha9) ^~ (8'had)) ? (+(8'hb8)) : (~(8'hbc)))) ^ {(~|(-(8'hb8)))}) ? {(((+(8'h9f)) | (^(8'hba))) ? ((~|(7'h44)) ? {(8'hb1), (8'hbd)} : ((8'hb2) << (7'h44))) : (((7'h41) ? (8'h9d) : (8'hb5)) ? ((8'ha3) <= (8'hb7)) : (~|(8'hb8)))), {{((8'ha5) | (8'had))}}} : ((&(!{(8'h9e)})) ? (({(8'hbf), (8'ha6)} == ((7'h44) ? (8'hab) : (8'hba))) >>> {((7'h43) != (8'hbf)), ((8'haf) ? (8'ha1) : (8'hb5))}) : ((((8'hac) - (8'ha5)) + (|(8'hba))) >= (((8'hb7) ? (8'ha1) : (8'ha3)) < {(8'hbf)})))), 
parameter param38 = param37)
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire [(4'hc):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  assign y = {wire36, wire35, wire34, wire33, wire32, wire31, (1'h0)};
  assign wire31 = $signed(wire29[(3'h6):(3'h6)]);
  assign wire32 = wire29;
  assign wire33 = $unsigned(wire30);
  assign wire34 = (8'hba);
  assign wire35 = (+(($signed((wire34 ? wire32 : wire28)) ?
                      $signed(wire28[(4'hb):(4'h8)]) : wire30[(4'ha):(2'h3)]) != (((^wire31) ^~ wire30[(4'hd):(1'h1)]) - wire30[(5'h10):(3'h6)])));
  assign wire36 = $signed((-(wire34 >> {(wire34 < wire34), (~wire35)})));
endmodule
