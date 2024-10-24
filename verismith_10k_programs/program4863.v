module top
#(parameter param186 = ((((~^((8'haa) ? (8'hba) : (7'h43))) ? ((+(8'hae)) ? (~&(8'hb4)) : (~^(8'ha2))) : {(~|(8'hb5)), ((7'h40) < (8'ha8))}) ? (8'hac) : (|(((8'ha1) - (8'ha7)) <<< ((8'hbf) ? (8'h9e) : (8'ha3))))) ^~ (((((8'hb7) ? (8'hb0) : (8'ha0)) ? (+(7'h43)) : ((8'hbc) >= (8'hbc))) ? (((8'h9c) ? (8'haf) : (7'h42)) | ((8'hbd) >= (8'ha0))) : {((8'hbf) > (7'h40))}) ? ((-((8'hbb) ~^ (8'hbb))) ? (((8'hac) ? (8'hb2) : (8'hb1)) ? ((8'hb0) && (8'hac)) : (^~(8'ha2))) : (8'hbb)) : (({(8'hae), (8'hb3)} ? ((8'had) ? (8'hae) : (8'hb4)) : (^(8'hab))) ? ((^~(8'hb4)) + ((7'h43) && (8'hbf))) : (8'hb0)))), 
parameter param187 = param186)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire185;
  wire [(3'h5):(1'h0)] wire183;
  wire signed [(3'h5):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire132;
  wire [(4'hd):(1'h0)] wire131;
  wire [(5'h11):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire129;
  wire [(5'h11):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg138 = (1'h0);
  reg [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  assign y = {wire185,
                 wire183,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire13,
                 wire5,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire5 = $signed((wire4 ?
                     (8'h9e) : (wire4[(1'h1):(1'h0)] ?
                         $signed((wire1 * wire4)) : wire0[(3'h7):(2'h3)])));
  always
    @(posedge clk) begin
      if ({wire5, ((+$signed($signed(wire0))) || {wire5[(2'h3):(2'h3)]})})
        begin
          reg6 <= ({$unsigned((+(^(8'ha3)))),
              (wire2 < wire4)} <<< wire2[(3'h6):(2'h3)]);
          reg7 <= $unsigned(wire5);
          if ($unsigned(wire2[(4'hd):(3'h7)]))
            begin
              reg8 <= (+(((~&(wire4 <= reg6)) ?
                  ((wire1 ? reg7 : (8'ha5)) ?
                      (wire3 > wire2) : {wire2}) : ({wire0} + (-wire3))) & reg7[(4'hf):(4'hd)]));
              reg9 <= {(^~{wire1, (reg7[(3'h4):(2'h3)] >>> (wire3 + reg7))})};
              reg10 <= {wire2,
                  (^((^~(~&reg6)) ?
                      $unsigned($unsigned(reg7)) : $unsigned($unsigned(wire0))))};
              reg11 <= wire2;
              reg12 <= (^{$unsigned((!(^wire4))), reg9});
            end
          else
            begin
              reg8 <= ($signed($signed($unsigned($unsigned(reg8)))) > ($signed(reg9[(3'h4):(3'h4)]) ?
                  $unsigned(((reg9 & (8'hb7)) ?
                      (8'hb3) : (~^reg6))) : $unsigned($signed((8'h9c)))));
              reg9 <= (8'hbc);
              reg10 <= $unsigned({reg9});
            end
        end
      else
        begin
          reg6 <= {$unsigned((wire4 ? reg11 : $unsigned(wire2[(4'hb):(2'h3)]))),
              (|(7'h43))};
        end
    end
  assign wire13 = $unsigned(((($signed(wire3) <<< (wire3 ? wire4 : reg7)) ?
                      reg10[(2'h2):(1'h0)] : wire3[(3'h7):(2'h2)]) & reg7[(4'h9):(1'h0)]));
  module14 #() modinst127 (.clk(clk), .wire16(wire0), .wire18(reg11), .wire15(wire4), .wire17(reg7), .wire19(reg8), .y(wire126));
  assign wire128 = (+{reg8[(4'h8):(1'h1)], reg7[(4'hd):(3'h5)]});
  assign wire129 = (reg10 ?
                       wire1 : ((~&($unsigned(reg11) <= (&(8'ha4)))) ?
                           $signed(wire2) : (^~reg11[(3'h4):(2'h3)])));
  assign wire130 = wire129;
  assign wire131 = $signed({$unsigned({$signed(wire3)})});
  assign wire132 = wire126[(1'h1):(1'h1)];
  assign wire133 = reg8;
  assign wire134 = wire0[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg135 <= (($signed((~^$signed(wire126))) >> $signed($signed((~^reg9)))) ?
          {(^wire0)} : (~|(-(~&wire133))));
      reg136 <= $signed(($signed($unsigned($unsigned(wire134))) ?
          (((~|(8'haf)) ~^ (wire129 ? wire130 : wire134)) ?
              reg12[(4'ha):(1'h0)] : (|wire0)) : wire134));
      reg137 <= ($unsigned((((reg135 ? wire131 : wire13) ?
              wire128[(3'h5):(2'h2)] : $signed(wire134)) <<< $unsigned(((8'hb4) ?
              wire132 : wire132)))) ?
          (wire128 ~^ ((-reg10[(4'he):(3'h7)]) ?
              ((~reg6) ~^ {reg8}) : wire132[(2'h2):(1'h1)])) : ((reg135[(5'h12):(2'h3)] >> (!(reg135 ?
                  wire3 : reg6))) ?
              (^{wire4[(1'h0):(1'h0)],
                  {reg8, reg11}}) : $signed(($signed(wire132) ?
                  $unsigned((8'hbb)) : {reg6, (7'h44)}))));
      reg138 <= (~$signed((|(wire134[(3'h4):(1'h0)] == {reg8}))));
      if ((+$unsigned(((&(wire131 ? reg10 : reg12)) ?
          ((~^reg136) ? $unsigned(reg10) : wire131) : reg136[(2'h3):(2'h3)]))))
        begin
          reg139 <= (!$signed((8'hb3)));
          reg140 <= {((7'h44) ? reg7 : (8'hb2))};
          if ($signed($signed(($signed((wire130 & reg136)) - wire5))))
            begin
              reg141 <= (reg140 ? reg135 : reg9);
              reg142 <= reg11[(3'h6):(2'h3)];
            end
          else
            begin
              reg141 <= wire130[(2'h2):(1'h1)];
              reg142 <= ($signed(wire5) ?
                  (&($signed(reg9[(4'hb):(3'h7)]) ?
                      ((~&reg8) ?
                          $unsigned(wire2) : (reg138 ?
                              wire131 : reg11)) : $signed(reg141))) : ({$unsigned((reg12 & (8'hbb)))} ?
                      ((!(^~reg135)) ?
                          $unsigned($signed(reg11)) : wire5[(3'h6):(2'h3)]) : ($unsigned((~^reg136)) ?
                          $signed(reg137) : ((8'ha5) << (~^wire131)))));
            end
          reg143 <= reg6[(2'h3):(1'h1)];
        end
      else
        begin
          reg139 <= (($signed(reg136[(2'h3):(1'h0)]) <= $signed({reg139})) ?
              ((~|($signed(wire126) ~^ (wire5 || reg137))) ^~ {((reg141 & (8'ha8)) > wire5),
                  (^$signed(reg11))}) : {wire0});
          reg140 <= reg141;
          reg141 <= (+$signed(reg9));
        end
    end
  module144 #() modinst184 (.wire146(reg142), .wire145(wire132), .clk(clk), .wire147(reg139), .y(wire183), .wire148(wire1));
  assign wire185 = (-((~$signed((-reg11))) <= reg143[(2'h3):(1'h1)]));
endmodule

module module144  (y, clk, wire148, wire147, wire146, wire145);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire148;
  input wire signed [(4'h8):(1'h0)] wire147;
  input wire [(2'h2):(1'h0)] wire146;
  input wire signed [(3'h5):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire182;
  wire [(5'h15):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire180;
  wire signed [(2'h2):(1'h0)] wire179;
  wire [(3'h7):(1'h0)] wire177;
  wire signed [(4'h9):(1'h0)] wire156;
  wire [(5'h10):(1'h0)] wire155;
  wire [(2'h3):(1'h0)] wire154;
  wire [(4'he):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire151;
  wire [(2'h3):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire149;
  reg signed [(4'he):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg176 = (1'h0);
  reg [(4'hc):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(5'h10):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg signed [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  reg [(2'h2):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg166 = (1'h0);
  reg [(4'he):(1'h0)] reg165 = (1'h0);
  reg [(4'hd):(1'h0)] reg164 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(4'he):(1'h0)] reg158 = (1'h0);
  reg signed [(4'he):(1'h0)] reg157 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire177,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 reg178,
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
                 (1'h0)};
  assign wire149 = wire146[(1'h1):(1'h1)];
  assign wire150 = ($signed((^$unsigned((wire149 - wire147)))) < {$signed(wire148)});
  assign wire151 = ($signed(($unsigned((wire149 << wire148)) + ($unsigned(wire150) ?
                       $signed(wire148) : (wire145 >= wire149)))) | wire147[(2'h2):(1'h0)]);
  assign wire152 = $signed($unsigned({(wire149[(3'h6):(1'h0)] >= (wire145 ?
                           wire151 : wire151)),
                       $signed((wire150 ? (8'hbe) : wire148))}));
  assign wire153 = (wire145 | ($signed($signed({wire151,
                       wire150})) <<< $signed($unsigned((+wire145)))));
  assign wire154 = (~wire153[(2'h2):(1'h0)]);
  assign wire155 = (~&({(~|wire152), {wire149[(2'h2):(1'h1)]}} >> {(^~(wire148 ?
                           wire151 : wire148)),
                       $unsigned(wire146)}));
  assign wire156 = wire152;
  always
    @(posedge clk) begin
      reg157 <= wire147[(3'h4):(1'h1)];
      if ({(8'ha2), $unsigned($unsigned(wire152))})
        begin
          reg158 <= (&$signed($unsigned($signed((wire152 ^~ wire154)))));
          reg159 <= ($unsigned($signed($unsigned({reg157, wire150}))) ?
              ((wire151[(4'hb):(2'h3)] ?
                      (^$unsigned((8'hae))) : ($signed(reg157) ?
                          (~wire148) : $unsigned((7'h41)))) ?
                  {wire153[(4'ha):(3'h4)]} : (~^(|(~|wire155)))) : $signed($unsigned((^{wire150}))));
          reg160 <= (($unsigned((-$unsigned(reg159))) ?
              wire156[(4'h9):(1'h1)] : ({wire151[(1'h1):(1'h1)],
                      $signed(wire148)} ?
                  wire150 : ((wire150 | wire156) ^ (wire147 > wire149)))) < reg159);
          reg161 <= wire152;
          if ($unsigned((wire153 >> (wire150 + $unsigned((wire145 <<< (8'hba)))))))
            begin
              reg162 <= (wire146[(2'h2):(2'h2)] ?
                  $signed({wire156}) : $signed((!{wire148[(4'he):(3'h7)]})));
              reg163 <= (((($unsigned(wire155) ?
                      (~reg159) : $unsigned((8'ha6))) ?
                  wire147 : ($unsigned(wire147) ?
                      (-(8'ha9)) : wire154)) >>> wire154[(2'h3):(1'h1)]) != $signed((wire153[(4'hb):(4'hb)] ?
                  $signed((wire155 ?
                      reg157 : (8'h9e))) : $unsigned($unsigned(wire151)))));
              reg164 <= (!((wire149 - $signed($signed(wire152))) ?
                  (~(~(~&reg161))) : (~|wire156[(1'h0):(1'h0)])));
            end
          else
            begin
              reg162 <= ((^reg163[(4'h8):(1'h0)]) != $unsigned(wire148));
              reg163 <= reg158[(2'h3):(1'h1)];
            end
        end
      else
        begin
          reg158 <= $unsigned((wire155[(3'h5):(3'h5)] || wire155[(4'ha):(1'h1)]));
          reg159 <= $signed(reg163[(3'h6):(3'h4)]);
          if ((wire147[(2'h3):(2'h2)] ?
              reg163 : ((^~wire155[(4'h9):(4'h8)]) || {$signed((^~wire152))})))
            begin
              reg160 <= $signed($signed(reg162));
              reg161 <= $unsigned((~^$signed(reg164[(3'h5):(2'h3)])));
            end
          else
            begin
              reg160 <= ($signed((&((wire156 ?
                      wire154 : reg162) >> $signed((8'haa))))) ?
                  {(+$signed(reg164[(4'ha):(3'h5)]))} : $unsigned($unsigned(reg158[(4'hc):(3'h7)])));
            end
          if (((wire156 ?
                  ((!(+wire155)) == $signed((wire150 ?
                      wire146 : wire148))) : ((+(reg162 ? (7'h42) : wire155)) ?
                      $signed(wire155[(3'h5):(3'h4)]) : wire153[(3'h6):(2'h2)])) ?
              {(({reg161} ?
                      $unsigned(reg159) : (+reg164)) & $signed($signed(wire156))),
                  reg160} : ($unsigned(($unsigned(wire153) - $unsigned(wire147))) && ($unsigned(wire154[(1'h1):(1'h1)]) ?
                  wire155 : reg160))))
            begin
              reg162 <= (($signed({(wire156 ? wire156 : wire147)}) ?
                  reg161[(4'ha):(3'h7)] : (&{{(8'hb5)}})) & wire149[(3'h4):(1'h0)]);
            end
          else
            begin
              reg162 <= ({(^~$signed($unsigned(wire146))), reg163} ?
                  $signed($signed($unsigned(reg159[(3'h4):(3'h4)]))) : $signed(reg159));
              reg163 <= (reg159[(3'h5):(3'h5)] ?
                  (^$unsigned((~&(wire146 >= reg163)))) : wire147);
            end
          if (((reg158[(2'h2):(1'h0)] ?
              (8'h9e) : (~|$unsigned(wire146[(1'h0):(1'h0)]))) ^~ reg160[(3'h4):(3'h4)]))
            begin
              reg164 <= {((wire153 ?
                          $unsigned((~^reg163)) : (reg157[(4'h9):(2'h3)] ?
                              wire148[(4'hd):(3'h7)] : {wire151, wire151})) ?
                      (!(~^wire151)) : (wire151[(4'h9):(3'h6)] && (-wire149[(2'h2):(2'h2)])))};
              reg165 <= wire148[(2'h2):(2'h2)];
            end
          else
            begin
              reg164 <= reg162;
              reg165 <= (((^~$unsigned((wire147 ? (7'h40) : wire150))) ?
                  $signed(((-reg162) ?
                      wire149 : wire154)) : {reg163[(4'h9):(3'h7)]}) & $unsigned(wire155));
              reg166 <= reg163[(3'h4):(2'h2)];
              reg167 <= $signed(reg161[(3'h7):(2'h3)]);
              reg168 <= (^~$signed(($unsigned($signed(wire147)) >= (wire153[(4'h9):(3'h5)] ?
                  $signed((8'hb8)) : ((8'hbe) == reg167)))));
            end
        end
      if ((~|wire155[(2'h2):(1'h0)]))
        begin
          reg169 <= wire145;
          reg170 <= reg160;
        end
      else
        begin
          reg169 <= $signed($unsigned(((!$signed(wire147)) ?
              wire154 : $signed((|(7'h42))))));
          reg170 <= $signed(wire147[(3'h6):(3'h6)]);
          if ($signed($unsigned($signed(reg167))))
            begin
              reg171 <= (~|((&((reg165 + reg164) << $unsigned(wire153))) == reg170[(4'hc):(4'ha)]));
            end
          else
            begin
              reg171 <= $unsigned($unsigned((wire156[(2'h3):(2'h2)] != (-$signed(reg166)))));
            end
          if (wire155)
            begin
              reg172 <= (8'hbc);
              reg173 <= {(reg172[(2'h3):(1'h0)] ?
                      {reg158[(1'h0):(1'h0)]} : (reg163[(4'ha):(3'h4)] ?
                          ((wire152 ?
                              wire146 : reg172) - reg162[(4'hb):(1'h1)]) : wire155)),
                  $signed((~^$unsigned((wire153 ? wire147 : wire146))))};
              reg174 <= (^$unsigned({(|$signed(reg170))}));
            end
          else
            begin
              reg172 <= $signed($unsigned(reg165[(3'h7):(2'h2)]));
              reg173 <= {{(reg169[(3'h5):(1'h0)] ?
                          $signed($unsigned(wire149)) : $unsigned(reg163[(4'h8):(3'h4)]))}};
              reg174 <= $signed({(|$unsigned({reg166}))});
            end
        end
      reg175 <= reg162;
      reg176 <= $unsigned($unsigned(reg171));
    end
  assign wire177 = (({((reg166 ? wire154 : reg170) ?
                           reg173[(4'hf):(2'h2)] : $signed(wire155))} << $signed($unsigned($unsigned(reg162)))) >> ((reg161 ?
                       wire155[(2'h2):(1'h0)] : wire150) == reg170));
  always
    @(posedge clk) begin
      reg178 <= ($signed(((8'ha1) & $unsigned((|reg165)))) || wire154);
    end
  assign wire179 = ($signed($signed(wire153)) != $unsigned((reg165 == ((!reg158) < $signed((8'hb8))))));
  assign wire180 = $unsigned(reg161[(3'h5):(2'h3)]);
  assign wire181 = $signed(((|reg173) ?
                       ($unsigned($unsigned((8'ha1))) || ((-reg169) ^ (+(8'h9d)))) : $unsigned($unsigned($signed(wire153)))));
  assign wire182 = $signed((|reg162));
endmodule

module module14
#(parameter param124 = ((^~((+((8'h9f) ? (8'ha4) : (7'h41))) ? (8'hbe) : (((8'haf) > (8'hab)) ? (~|(8'hb9)) : {(8'ha5), (7'h41)}))) * ((!(|((8'ha3) ? (8'ha0) : (8'ha7)))) ? (^((~(8'hb0)) ? ((8'hb1) ^~ (8'hb8)) : ((8'hbe) ? (8'hb9) : (8'hbd)))) : (+((8'had) ? ((8'ha7) <<< (8'ha6)) : ((7'h44) << (7'h43)))))), 
parameter param125 = (~^(((~^(param124 == param124)) ? (|(param124 || param124)) : param124) >> param124)))
(y, clk, wire15, wire16, wire17, wire18, wire19);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire123;
  wire [(5'h15):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire118;
  wire signed [(4'h8):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire82;
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire115,
                 wire84,
                 wire82,
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
                 (1'h0)};
  module20 #() modinst83 (wire82, clk, wire19, wire18, wire15, wire16, wire17);
  assign wire84 = {wire18[(3'h7):(3'h5)], wire19};
  always
    @(posedge clk) begin
      if ((wire16[(3'h7):(3'h6)] >= (8'hb6)))
        begin
          reg85 <= ($signed((wire16 ?
                  (&{wire84, (8'h9d)}) : (&(wire15 & wire15)))) ?
              ((+($unsigned(wire84) ? (~&wire84) : (|wire82))) ?
                  wire19 : $unsigned((~{(8'ha2)}))) : wire16);
          reg86 <= {((~wire16) ^~ $signed($unsigned((8'h9d))))};
          reg87 <= reg86[(4'hc):(3'h6)];
          reg88 <= ((~({(^~wire84), $unsigned((7'h42))} ^ (wire18 ?
              $unsigned(wire82) : (wire17 - (8'haa))))) | reg85[(1'h0):(1'h0)]);
        end
      else
        begin
          reg85 <= reg88[(2'h2):(2'h2)];
          reg86 <= ((8'hb6) ^~ ({$unsigned((wire18 ?
                  wire84 : wire18))} - $unsigned($unsigned((wire19 ?
              wire18 : (8'h9f))))));
          reg87 <= $unsigned((&wire82[(4'h9):(3'h5)]));
        end
      reg89 <= (8'h9d);
      if (reg88[(2'h2):(1'h0)])
        begin
          reg90 <= ((({$unsigned(wire84)} ?
                  (~&(^(8'hbf))) : wire18) || (^((8'hb2) == reg89))) ?
              ($signed(wire15) ?
                  ($signed({reg85}) * $signed(reg86)) : reg86[(2'h2):(1'h1)]) : $unsigned({$unsigned({reg88})}));
          reg91 <= reg85;
        end
      else
        begin
          if ((((reg91 ? reg89[(2'h3):(1'h0)] : $unsigned($signed(reg89))) ?
                  ($unsigned((^(8'hae))) < ((8'hbc) ?
                      $signed(wire16) : (wire17 >= reg86))) : $signed($unsigned({wire17}))) ?
              wire84 : (^~(+(wire18[(1'h0):(1'h0)] ?
                  $signed(reg86) : (!reg88))))))
            begin
              reg90 <= $signed($signed($unsigned((|{(8'ha9), (8'h9c)}))));
              reg91 <= $unsigned({$unsigned(((~reg86) - (8'hb4))),
                  ($unsigned($signed((8'hb7))) ?
                      ($unsigned(reg89) == $unsigned(reg88)) : (wire84[(2'h2):(1'h0)] <<< reg87[(4'hb):(3'h4)]))});
            end
          else
            begin
              reg90 <= wire19;
            end
          reg92 <= $signed(wire15[(4'hb):(4'hb)]);
          reg93 <= $signed($signed((~{{reg88}, reg87})));
        end
      reg94 <= $signed($unsigned($signed(wire84[(3'h5):(2'h2)])));
      reg95 <= reg92[(2'h3):(2'h3)];
    end
  module96 #() modinst116 (.wire99(reg95), .wire97(wire82), .clk(clk), .y(wire115), .wire100(wire84), .wire98(reg88));
  assign wire117 = ((~$signed(reg89[(4'hf):(3'h5)])) | ((^{wire15}) <= ((&(wire115 >> (8'ha8))) ^~ reg90)));
  assign wire118 = (wire17 ?
                       $unsigned($signed({((8'hbe) <= reg94),
                           (|wire17)})) : reg87[(5'h12):(3'h6)]);
  assign wire119 = $signed((~^{(8'h9f), wire84[(2'h2):(2'h2)]}));
  assign wire120 = ({(8'hb3),
                           ((~&wire115[(3'h6):(2'h3)]) * (^reg92[(4'h9):(2'h2)]))} ?
                       (wire115[(3'h6):(1'h1)] || $signed($unsigned($signed((8'haa))))) : wire82[(3'h6):(3'h5)]);
  assign wire121 = reg93;
  assign wire122 = wire17[(3'h6):(2'h3)];
  assign wire123 = wire117[(3'h4):(2'h2)];
endmodule

module module96
#(parameter param113 = (8'hb0), 
parameter param114 = (((((param113 * param113) ? param113 : param113) != (|{param113})) ^ {(+param113), ({(8'hb0)} - param113)}) && param113))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire100;
  input wire [(5'h11):(1'h0)] wire99;
  input wire signed [(4'hf):(1'h0)] wire98;
  input wire [(3'h7):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire107;
  wire signed [(5'h10):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 (1'h0)};
  assign wire101 = (-$signed($signed(((wire97 <= wire99) >>> $unsigned(wire99)))));
  assign wire102 = ((~^$unsigned((^~(&wire101)))) ?
                       ((!(&(wire100 & (8'ha8)))) >= (wire97 ^ wire97)) : ($unsigned($signed($signed(wire100))) ?
                           (+(~|$unsigned((7'h43)))) : $signed($signed(wire101))));
  assign wire103 = ((wire98 + wire99[(2'h2):(1'h1)]) ?
                       $unsigned(($unsigned((wire99 << wire101)) ?
                           wire98[(3'h7):(2'h2)] : wire99[(1'h1):(1'h1)])) : (~^(~wire97)));
  assign wire104 = (|$unsigned($signed({{wire97}})));
  assign wire105 = $signed($unsigned(((((8'hbb) ? wire102 : wire98) << {wire104,
                       wire98}) >>> (&wire99[(3'h7):(3'h4)]))));
  assign wire106 = ((~|$signed($signed((wire97 ? wire97 : wire103)))) ?
                       $unsigned(wire103) : wire101[(4'hd):(1'h1)]);
  assign wire107 = wire102[(1'h1):(1'h1)];
  assign wire108 = (8'h9d);
  assign wire109 = (wire104[(3'h6):(3'h5)] ?
                       {(!(wire106[(3'h5):(2'h2)] ?
                               $unsigned(wire106) : $signed(wire101)))} : $signed(wire98));
  assign wire110 = wire102;
  assign wire111 = (wire99 ?
                       $unsigned((&((~^wire99) ?
                           $unsigned(wire101) : (wire109 ?
                               wire102 : wire103)))) : {(((-wire97) + (wire104 != wire97)) ?
                               ((wire99 ?
                                   (8'hbf) : wire105) | (wire100 * wire102)) : $unsigned((wire104 == wire105))),
                           wire102[(4'h8):(3'h4)]});
  assign wire112 = wire105;
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h29b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire25;
  input wire signed [(3'h7):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(4'ha):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire26;
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire56,
                 wire55,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire34,
                 wire26,
                 reg81,
                 reg80,
                 reg79,
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
                 reg54,
                 reg53,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire26 = ((wire25[(2'h2):(1'h0)] ?
                          {(^~(^~wire25)),
                              wire25[(4'ha):(2'h3)]} : wire21[(4'he):(4'hd)]) ?
                      wire23 : (wire22 - {($signed((8'h9d)) == (-wire23)),
                          wire21[(3'h4):(2'h3)]}));
  always
    @(posedge clk) begin
      reg27 <= ($unsigned($signed(wire21[(5'h10):(2'h2)])) != $unsigned($signed(wire21[(4'he):(1'h1)])));
      if (((wire24[(2'h2):(1'h0)] <<< {$unsigned((~wire22)),
              (^(wire23 ^~ reg27))}) ?
          $signed(($signed(((8'hae) + wire24)) >= ($unsigned((7'h43)) ~^ {wire25}))) : (wire25[(3'h4):(2'h3)] > (wire26 ?
              wire24[(2'h3):(1'h1)] : ($unsigned((7'h43)) ?
                  $signed(wire21) : $signed(wire23))))))
        begin
          reg28 <= (^wire21);
          reg29 <= {wire21};
        end
      else
        begin
          if ($unsigned($unsigned(wire26[(4'ha):(4'ha)])))
            begin
              reg28 <= $signed((~^(8'hb5)));
            end
          else
            begin
              reg28 <= ({$unsigned((wire23 ?
                      $unsigned(wire22) : wire26))} <<< $unsigned($signed(wire21)));
            end
          reg29 <= ($unsigned($unsigned(wire26[(4'hc):(3'h4)])) ?
              $unsigned(wire21[(5'h10):(4'hf)]) : reg27[(4'h8):(2'h2)]);
        end
      if ($unsigned(((8'h9e) + ((reg27[(1'h0):(1'h0)] - wire21[(3'h4):(3'h4)]) ?
          (~^reg29[(1'h0):(1'h0)]) : ((reg28 >>> wire25) ?
              ((8'h9f) != reg27) : (wire21 ? wire22 : wire21))))))
        begin
          reg30 <= $signed((wire25 ^ $signed((wire21 | $signed(wire23)))));
          reg31 <= (^~wire26);
          reg32 <= (^~{$signed(((wire25 ? wire25 : (8'ha7)) ?
                  (wire25 < wire23) : (wire25 <= wire21))),
              $unsigned(wire21)});
          reg33 <= ((^~($unsigned((-reg32)) | $signed((wire21 == reg27)))) < (wire23[(2'h2):(2'h2)] ?
              $unsigned((!{(7'h43)})) : $unsigned(($signed(reg27) ?
                  (|(8'hb6)) : (!wire24)))));
        end
      else
        begin
          reg30 <= $unsigned(wire23);
          reg31 <= $signed({{((|reg31) && $signed(wire25)),
                  $signed($signed(wire22))},
              $unsigned(reg32)});
        end
    end
  assign wire34 = $unsigned($unsigned((wire22 & (reg33[(3'h6):(3'h5)] ?
                      $signed(reg32) : (wire23 ? (7'h44) : reg27)))));
  always
    @(posedge clk) begin
      if ((|wire26[(1'h1):(1'h1)]))
        begin
          reg35 <= reg31[(3'h5):(1'h1)];
          if (reg33)
            begin
              reg36 <= (^(^(~^(!reg28))));
            end
          else
            begin
              reg36 <= $signed(($signed($signed(wire26)) ?
                  {(8'ha2),
                      ((^~wire24) ?
                          (^wire26) : (8'h9d))} : (reg29 <<< $unsigned(reg32[(1'h1):(1'h1)]))));
              reg37 <= wire24;
              reg38 <= {$signed($signed((^~$signed(wire21)))),
                  (+(^$unsigned((^reg32))))};
              reg39 <= (!reg32);
              reg40 <= reg38;
            end
          if (((^$signed($signed($unsigned(reg27)))) < reg40[(3'h6):(2'h3)]))
            begin
              reg41 <= (reg38 ?
                  {$signed({$signed(wire21)})} : (^~(reg28 & ((reg29 <= wire25) ?
                      (reg35 ? reg33 : reg27) : $unsigned(reg37)))));
              reg42 <= reg39[(4'hd):(2'h2)];
              reg43 <= ((-((reg40[(3'h5):(3'h4)] >= $signed(reg27)) - reg28[(3'h7):(1'h0)])) ?
                  (+($signed((8'hba)) == {$unsigned(reg31),
                      (|reg41)})) : (~($unsigned((!(8'hb3))) ?
                      ($signed((8'ha8)) ?
                          (~reg36) : (reg31 >= reg37)) : wire25[(4'ha):(2'h2)])));
              reg44 <= (((^reg28) ?
                      $signed((reg30 ?
                          (+wire24) : (wire23 >= reg29))) : ((~|reg40) >>> $signed({reg37,
                          reg38}))) ?
                  reg32[(1'h0):(1'h0)] : {reg29});
              reg45 <= $signed(wire23);
            end
          else
            begin
              reg41 <= ((^~$signed($signed(((8'hbd) >>> reg40)))) ^ ($unsigned($unsigned(wire23)) > $signed((~&$unsigned(reg42)))));
              reg42 <= (($unsigned((~^wire22)) >= (~(reg41 > (reg27 || wire21)))) ?
                  {$signed((!reg42[(1'h1):(1'h1)]))} : ((reg29 ?
                          $unsigned((!reg29)) : ($unsigned(reg37) > $unsigned(reg29))) ?
                      (|reg37[(3'h5):(1'h0)]) : wire22));
              reg43 <= $unsigned(((reg29[(1'h0):(1'h0)] ^ reg39[(4'hc):(4'ha)]) - (^~($signed((8'hbc)) != reg31))));
            end
        end
      else
        begin
          reg35 <= $unsigned(reg43);
          reg36 <= {$signed((reg35[(5'h11):(2'h3)] ?
                  ((reg37 ?
                      reg41 : reg38) <<< (~|reg39)) : ((reg43 << reg42) == $signed(reg38))))};
          reg37 <= {reg36};
          if (reg29)
            begin
              reg38 <= (^($unsigned(reg44) > wire26));
            end
          else
            begin
              reg38 <= reg31;
            end
        end
      reg46 <= $unsigned(((^((|reg43) ?
          ((8'hb6) >> wire22) : $unsigned(wire24))) >> {$signed((8'ha6)),
          ((!reg42) < $signed(reg39))}));
    end
  assign wire47 = {{reg39}};
  assign wire48 = ((reg31[(4'hc):(1'h0)] ?
                      $signed((reg32[(2'h2):(2'h2)] * (~&(8'h9d)))) : ($signed($unsigned(reg42)) ?
                          reg35[(4'hb):(3'h7)] : reg27)) >= ((reg43[(4'ha):(4'h9)] && (reg36 ~^ (reg38 | reg46))) ?
                      $signed((reg30[(2'h3):(2'h3)] ?
                          $signed(wire22) : (wire23 <= reg33))) : $unsigned({(reg44 ?
                              (8'ha5) : wire22),
                          ((8'ha5) ^ wire25)})));
  assign wire49 = ($unsigned($signed(reg43[(3'h5):(3'h4)])) ?
                      ($signed(($signed((7'h44)) ?
                          (reg42 ?
                              (8'had) : reg35) : reg30)) <<< $unsigned((wire22[(3'h5):(1'h0)] && (reg28 > reg38)))) : (~|{$unsigned($unsigned(wire23)),
                          ($unsigned(reg36) == (reg40 ? reg44 : wire23))}));
  assign wire50 = reg30[(2'h3):(1'h0)];
  assign wire51 = wire24;
  assign wire52 = (-($unsigned(((wire51 != wire25) << (reg30 ?
                          reg42 : wire21))) ?
                      ($unsigned($signed((8'ha1))) ?
                          wire34 : ($signed(wire47) ?
                              wire25 : (reg32 ^~ wire21))) : $signed($signed(reg37))));
  always
    @(posedge clk) begin
      reg53 <= (~^$unsigned((($unsigned(reg32) ?
          $signed(reg31) : (wire22 ^~ wire52)) && $unsigned($signed((7'h40))))));
      reg54 <= $unsigned($signed((8'h9c)));
    end
  assign wire55 = $unsigned(reg39);
  assign wire56 = reg43[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg57 <= ($unsigned((-((wire56 ? wire24 : reg41) ?
          (8'hbf) : $unsigned(wire47)))) + $unsigned((^$unsigned((-reg31)))));
      reg58 <= wire34[(2'h3):(1'h0)];
      if ((-(reg40 ^~ {$signed(reg42), (~|((8'hb6) >> (8'hba)))})))
        begin
          reg59 <= ($signed((reg27 ?
                  ((reg36 ? wire48 : reg27) - (reg32 + wire51)) : (7'h43))) ?
              {$signed(reg41)} : (+(~wire25[(3'h7):(3'h6)])));
          reg60 <= wire34;
        end
      else
        begin
          if ((((reg43 != {reg46[(2'h3):(2'h2)], reg40[(2'h2):(1'h1)]}) ?
                  reg54[(3'h7):(3'h6)] : $signed(((^~wire47) ?
                      {wire24, reg46} : $unsigned(wire25)))) ?
              reg32[(2'h3):(2'h2)] : $unsigned((~&wire47[(4'hc):(2'h2)]))))
            begin
              reg59 <= wire23[(4'hb):(3'h4)];
              reg60 <= $signed($signed((8'ha4)));
              reg61 <= reg60[(4'h9):(4'h8)];
            end
          else
            begin
              reg59 <= $signed(reg57[(4'hf):(2'h3)]);
              reg60 <= ((reg57 ?
                  (~$unsigned((reg28 >> reg61))) : $unsigned({$unsigned((8'hb2))})) * ({((^~reg30) <= (wire25 ?
                      reg59 : reg57)),
                  ($unsigned(wire51) ?
                      (8'ha7) : (wire55 ?
                          wire21 : reg45))} ^ ((^~$unsigned(wire22)) ?
                  (~&(reg42 ? wire56 : reg27)) : reg38)));
            end
          if (wire51)
            begin
              reg62 <= (reg42[(3'h4):(3'h4)] ^ reg42);
              reg63 <= wire21;
              reg64 <= ($unsigned(wire49) ?
                  reg58[(5'h10):(5'h10)] : $signed(((~(reg58 ?
                      reg42 : reg41)) ^~ reg29)));
            end
          else
            begin
              reg62 <= ((~reg40[(4'h9):(2'h3)]) ?
                  ($signed($unsigned((wire21 ?
                      reg40 : wire51))) < {(wire34[(4'h8):(1'h1)] >> $unsigned((7'h44)))}) : reg42[(3'h6):(3'h5)]);
              reg63 <= ((8'hb1) ?
                  $signed(reg37) : {$signed(reg64),
                      (reg46[(4'h8):(3'h7)] ?
                          {$signed(reg62), $signed(reg54)} : (^(wire25 ?
                              reg28 : (8'ha5))))});
              reg64 <= $signed((reg60[(2'h3):(2'h2)] - reg43));
              reg65 <= ($signed((^((wire25 && reg63) ~^ (reg62 < wire49)))) ?
                  wire49[(2'h3):(2'h3)] : reg37);
            end
          if ({$signed((~reg39[(4'hb):(4'h8)]))})
            begin
              reg66 <= (~&wire50[(3'h5):(3'h5)]);
              reg67 <= reg60[(4'hc):(3'h4)];
              reg68 <= reg57;
            end
          else
            begin
              reg66 <= $unsigned((8'hbe));
              reg67 <= $unsigned((((~|((8'hae) == (8'hb5))) ?
                  {{(8'ha5), reg28},
                      (+reg37)} : $unsigned((8'hbd))) + ($signed(reg46) && ($signed(wire48) - $signed(wire55)))));
            end
          reg69 <= reg66;
        end
      reg70 <= reg60[(2'h3):(1'h0)];
    end
  assign wire71 = ((wire22[(3'h4):(1'h1)] <<< $unsigned(((wire21 == reg38) ?
                          (reg68 >> reg54) : reg68[(1'h0):(1'h0)]))) ?
                      ((&reg45) ~^ reg41[(4'ha):(1'h0)]) : (+$unsigned((&{wire21}))));
  assign wire72 = (^~(~reg43[(3'h7):(3'h6)]));
  assign wire73 = {reg64};
  assign wire74 = $signed((&$unsigned(wire25)));
  assign wire75 = (^~$unsigned($unsigned((8'h9c))));
  assign wire76 = (~&reg27);
  assign wire77 = (!$signed(reg57[(5'h11):(2'h3)]));
  assign wire78 = (&reg59[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      if ((({(^~(reg54 ? reg41 : wire77)), (~&wire77[(1'h1):(1'h1)])} ?
              (^(!$signed(reg65))) : ((+$unsigned(reg29)) ?
                  $signed(reg45) : $unsigned({wire24}))) ?
          ($unsigned(wire52) <= (({reg29} ? ((8'hab) <<< wire24) : wire25) ?
              $unsigned($signed((8'hbd))) : wire56)) : $unsigned($signed((~&wire72)))))
        begin
          reg79 <= $unsigned((({$signed(reg60),
                  (~&(7'h41))} <= (+$unsigned(reg37))) ?
              (~($unsigned(wire76) <<< wire75)) : reg44[(3'h5):(3'h4)]));
        end
      else
        begin
          reg79 <= $unsigned($signed((^~((wire76 ?
              reg31 : (8'hbc)) < wire76))));
        end
      reg80 <= (^$unsigned({{(reg62 ? reg46 : wire48)},
          {(wire77 == wire78), (reg27 ? reg42 : reg39)}}));
      reg81 <= (reg64 > ({reg40[(4'h8):(1'h0)]} ?
          reg40 : ($signed($unsigned(reg44)) >> wire49)));
    end
endmodule
