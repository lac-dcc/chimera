module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire213;
  wire [(4'hf):(1'h0)] wire212;
  wire signed [(5'h11):(1'h0)] wire211;
  wire signed [(2'h2):(1'h0)] wire209;
  wire signed [(5'h13):(1'h0)] wire148;
  wire signed [(4'hc):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire231;
  wire [(5'h11):(1'h0)] wire232;
  wire signed [(5'h11):(1'h0)] wire233;
  wire [(4'hf):(1'h0)] wire234;
  wire [(4'hc):(1'h0)] wire235;
  wire signed [(5'h11):(1'h0)] wire236;
  wire signed [(3'h5):(1'h0)] wire237;
  wire signed [(5'h13):(1'h0)] wire238;
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg216 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg221 = (1'h0);
  reg [(5'h13):(1'h0)] reg222 = (1'h0);
  reg [(5'h12):(1'h0)] reg223 = (1'h0);
  reg [(4'h8):(1'h0)] reg224 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg226 = (1'h0);
  reg [(4'hb):(1'h0)] reg227 = (1'h0);
  reg [(5'h11):(1'h0)] reg228 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg229 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg230 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire209,
                 wire148,
                 wire11,
                 wire10,
                 wire231,
                 wire232,
                 wire233,
                 wire234,
                 wire235,
                 wire236,
                 wire237,
                 wire238,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg215,
                 reg216,
                 reg217,
                 reg218,
                 reg219,
                 reg220,
                 reg221,
                 reg222,
                 reg223,
                 reg224,
                 reg225,
                 reg226,
                 reg227,
                 reg228,
                 reg229,
                 reg230,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (-((^~$signed(wire2)) * {({wire2, wire3} && wire2)}));
    end
  always
    @(posedge clk) begin
      reg5 <= $unsigned($unsigned($signed((~^$signed((8'haf))))));
      reg6 <= ({$unsigned(((~&reg5) ? {wire2} : (wire2 >= reg5))), wire3} ?
          {(|(|(reg5 ? wire1 : wire2))),
              $unsigned(((wire0 <= wire1) ?
                  (wire1 && (8'ha8)) : $signed(wire0)))} : {{(~(wire1 ?
                      wire1 : wire0)),
                  $unsigned($signed(reg4))}});
      reg7 <= (^wire0);
      reg8 <= (~&$unsigned(((~^(wire3 ? wire0 : wire0)) ?
          wire0 : wire1[(1'h0):(1'h0)])));
      reg9 <= {reg6[(1'h1):(1'h0)]};
    end
  assign wire10 = ((~$unsigned((reg6[(3'h4):(2'h3)] ?
                      $signed((8'hbb)) : (wire0 & (8'hbf))))) < wire2[(4'he):(1'h1)]);
  assign wire11 = reg6;
  module12 #() modinst149 (.wire16(wire10), .wire17(reg8), .wire14(reg5), .wire13(wire11), .y(wire148), .wire15(reg9), .clk(clk));
  module150 #() modinst210 (.wire152(reg7), .clk(clk), .wire151(wire148), .wire155(reg9), .wire153(wire1), .y(wire209), .wire154(reg4));
  assign wire211 = $unsigned(reg6[(2'h3):(2'h3)]);
  assign wire212 = wire11;
  module55 #() modinst214 (wire213, clk, reg7, wire2, wire212, reg4, wire10);
  always
    @(posedge clk) begin
      reg215 <= $unsigned(({(|$unsigned((8'ha3)))} | $unsigned($signed($unsigned(wire148)))));
      if ((!$signed(wire0)))
        begin
          reg216 <= wire1;
          reg217 <= reg4;
        end
      else
        begin
          reg216 <= (((|(reg4[(5'h11):(2'h3)] << (~|reg9))) - $signed((reg6 << $signed((8'ha1))))) == {$unsigned((^{reg8}))});
          reg217 <= $signed(((wire148 ?
                  $signed(reg4) : wire148[(4'hc):(2'h2)]) ?
              wire213 : $signed(($unsigned(wire10) ?
                  (-wire11) : ((8'ha9) && (8'haa))))));
        end
    end
  always
    @(posedge clk) begin
      reg218 <= $unsigned($signed($unsigned($unsigned((~^reg6)))));
      reg219 <= (&(({$signed(wire3), {reg218, reg8}} ~^ wire209) ?
          $unsigned(reg7) : wire213[(3'h4):(1'h1)]));
      reg220 <= ($unsigned(wire10[(4'hb):(1'h0)]) | (reg216[(3'h6):(3'h6)] > (-((wire148 ?
              reg8 : wire212) ?
          $unsigned((8'hb6)) : {wire209}))));
      if ((~&((~$unsigned(((8'h9c) == reg218))) ?
          {wire11[(2'h3):(2'h2)],
              {(+(8'hbb)),
                  (~^reg218)}} : (((reg215 ^~ wire209) ^~ $unsigned((8'hb7))) ^~ (^~(wire2 != wire212))))))
        begin
          if ($unsigned(wire211[(2'h2):(2'h2)]))
            begin
              reg221 <= reg215[(4'h9):(3'h4)];
              reg222 <= $signed($signed($unsigned(reg8)));
            end
          else
            begin
              reg221 <= $unsigned(wire1);
              reg222 <= ((reg4 >= $unsigned(wire213)) & ((~(((8'hb3) ?
                          reg218 : reg220) ?
                      (+wire211) : {reg5})) ?
                  $unsigned((8'ha4)) : $signed((((8'hb8) ^ reg216) ?
                      reg222 : wire148[(3'h5):(3'h4)]))));
            end
          if ($signed($unsigned($signed((~|(wire148 ? wire10 : reg9))))))
            begin
              reg223 <= reg220[(4'hb):(1'h0)];
              reg224 <= $unsigned((~(((^reg216) ?
                      $signed(wire211) : (-(8'hbd))) ?
                  {(reg215 ? wire0 : wire213)} : ($signed(wire0) == reg4))));
              reg225 <= reg215;
              reg226 <= reg221[(5'h10):(4'hc)];
            end
          else
            begin
              reg223 <= ($unsigned((8'hb5)) ?
                  wire0 : (reg9 ? wire1[(4'hd):(4'hb)] : reg8));
              reg224 <= ({$unsigned(((^reg8) >>> reg8))} ?
                  $signed({$unsigned((reg222 ? reg224 : reg8)),
                      wire209[(1'h1):(1'h1)]}) : $signed(($unsigned(reg7) ?
                      (((8'haf) ? wire148 : wire211) == (wire209 ?
                          reg9 : reg219)) : $unsigned((reg8 ?
                          reg5 : reg216)))));
              reg225 <= reg218;
              reg226 <= ((({((8'h9f) >>> wire211)} ?
                      wire1[(3'h6):(3'h4)] : wire212) ?
                  (~^((~reg9) ?
                      wire211[(1'h0):(1'h0)] : $signed(reg6))) : wire209) < ((reg6 <= (!$unsigned(reg220))) - wire212));
              reg227 <= {reg217[(4'h8):(4'h8)]};
            end
        end
      else
        begin
          reg221 <= ((|{wire0, wire10}) ?
              ($unsigned($unsigned(reg217)) || {($unsigned((8'hb1)) ?
                      (^wire0) : (wire10 * wire148)),
                  $signed($unsigned(wire212))}) : (({(8'ha3)} ?
                  ((wire3 ? wire10 : reg226) ?
                      (wire2 ?
                          (8'hb0) : (8'h9f)) : (&wire211)) : $unsigned(wire0[(3'h7):(1'h1)])) >>> $unsigned($unsigned((+reg225)))));
          if ((reg217[(3'h6):(3'h6)] - (wire10[(5'h10):(4'h9)] <= ((+(reg225 ?
              wire11 : reg226)) >>> ((^~reg221) ?
              (~reg219) : $unsigned((8'ha3)))))))
            begin
              reg222 <= ((wire209 ?
                      $unsigned(((reg224 ? wire148 : wire1) ?
                          $unsigned(wire11) : (reg6 ?
                              reg219 : (8'hbb)))) : $signed($unsigned($unsigned(wire3)))) ?
                  {{(reg226 + (wire10 & reg5))}} : (8'hba));
              reg223 <= ($unsigned($unsigned((reg225 != reg7[(1'h0):(1'h0)]))) ^~ $signed(wire211));
              reg224 <= $signed({(&reg9), $unsigned((^$signed(reg227)))});
              reg225 <= (^~$unsigned(reg227[(3'h5):(1'h1)]));
            end
          else
            begin
              reg222 <= $unsigned($signed($unsigned(($unsigned(reg220) ^~ ((8'h9f) == reg217)))));
              reg223 <= ((^~(reg6[(3'h4):(1'h0)] ?
                      {$unsigned(reg4),
                          $signed(wire212)} : $signed(wire209[(2'h2):(1'h0)]))) ?
                  wire1[(5'h12):(3'h4)] : (wire2 ?
                      (((&wire3) < (wire211 ?
                          reg217 : reg225)) < reg223) : $signed(reg224)));
              reg224 <= $signed(reg217[(4'he):(3'h6)]);
            end
          reg226 <= reg217;
          if ($unsigned(((|({reg220, (8'hb5)} ^ (+reg215))) <= ({wire3,
                  (^reg223)} ?
              ((^reg219) - $unsigned(reg227)) : $signed((reg4 + reg217))))))
            begin
              reg227 <= $unsigned(wire3);
            end
          else
            begin
              reg227 <= (^$signed(($signed((wire211 ?
                  (8'ha9) : reg223)) * reg218[(2'h2):(1'h0)])));
              reg228 <= ($signed((reg9 > ($signed(wire211) ~^ $unsigned(reg224)))) <<< wire1[(4'ha):(4'ha)]);
            end
        end
    end
  always
    @(posedge clk) begin
      reg229 <= (~|$signed(reg224));
      reg230 <= (wire1[(4'h8):(2'h2)] ?
          {({(wire10 ? wire11 : reg229), $unsigned(wire0)} ?
                  reg229 : reg219[(4'h9):(3'h6)]),
              reg222[(4'hf):(3'h7)]} : (($signed({reg224}) >> $signed((~|wire11))) ^ (!wire10)));
    end
  assign wire231 = wire0;
  assign wire232 = $unsigned((8'hbf));
  assign wire233 = ($signed((((reg223 ?
                           reg223 : wire212) - reg224[(1'h1):(1'h1)]) ?
                       reg9[(3'h7):(3'h4)] : {reg225[(1'h1):(1'h1)]})) ^~ $signed((wire11 ?
                       $signed((reg6 && reg229)) : ({wire213, reg223} ?
                           reg229 : wire0[(4'hd):(4'hb)]))));
  assign wire234 = wire209[(1'h0):(1'h0)];
  assign wire235 = ((-{(reg4 ^~ wire10[(4'h8):(3'h5)])}) ?
                       $unsigned($signed(wire211[(2'h3):(2'h2)])) : $signed((^(wire10 + $signed(reg228)))));
  assign wire236 = (($signed(wire212) ^~ ({reg9} * wire211)) ?
                       $unsigned((~&reg222)) : (wire0 >>> {$unsigned((~^(8'ha5))),
                           (reg7[(1'h1):(1'h0)] > $signed((8'ha1)))}));
  assign wire237 = {$unsigned((reg230 ?
                           (reg230[(2'h2):(1'h1)] ?
                               $signed(reg219) : $signed((8'ha3))) : wire148))};
  module189 #() modinst239 (.clk(clk), .y(wire238), .wire191(reg227), .wire190(wire3), .wire192(reg218), .wire193(reg7));
endmodule

module module150  (y, clk, wire155, wire154, wire153, wire152, wire151);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire155;
  input wire [(4'hb):(1'h0)] wire154;
  input wire signed [(5'h12):(1'h0)] wire153;
  input wire [(5'h12):(1'h0)] wire152;
  input wire signed [(5'h13):(1'h0)] wire151;
  wire signed [(2'h2):(1'h0)] wire207;
  wire signed [(5'h11):(1'h0)] wire188;
  wire signed [(4'h8):(1'h0)] wire187;
  wire [(4'hd):(1'h0)] wire186;
  wire [(4'he):(1'h0)] wire185;
  wire signed [(4'hc):(1'h0)] wire184;
  wire signed [(5'h12):(1'h0)] wire182;
  wire [(4'hc):(1'h0)] wire160;
  wire signed [(4'hc):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire156;
  assign y = {wire207,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire182,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 (1'h0)};
  assign wire156 = ($unsigned((+($signed(wire152) ?
                           (~&wire151) : $signed(wire154)))) ?
                       wire152 : wire152);
  assign wire157 = {wire155,
                       (^~(~^(((8'haf) ? wire152 : wire153) ?
                           (wire153 ^~ wire152) : $signed(wire154))))};
  assign wire158 = wire151;
  assign wire159 = (wire152 ?
                       ($unsigned($signed((wire158 ?
                           (8'ha4) : wire158))) <<< wire153) : (!(+$signed(wire158[(3'h7):(2'h2)]))));
  assign wire160 = $unsigned($unsigned($signed(({(8'hb7)} ?
                       {wire151} : $signed(wire153)))));
  module161 #() modinst183 (wire182, clk, wire158, wire156, wire155, wire151);
  assign wire184 = (~|{wire156[(5'h13):(5'h11)],
                       ($unsigned(wire159[(3'h5):(2'h2)]) ?
                           $unsigned($unsigned(wire154)) : wire157)});
  assign wire185 = $signed(wire182);
  assign wire186 = wire185[(4'h9):(3'h4)];
  assign wire187 = (-(-wire159));
  assign wire188 = (($signed(((wire158 > wire157) ?
                               $unsigned(wire154) : (wire155 != wire159))) ?
                           wire153 : (^$unsigned((wire186 <= wire184)))) ?
                       wire187[(2'h3):(1'h1)] : $signed((&wire151[(1'h0):(1'h0)])));
  module189 #() modinst208 (.wire190(wire188), .y(wire207), .wire192(wire153), .wire191(wire154), .wire193(wire158), .clk(clk));
endmodule

module module12
#(parameter param147 = {{(~^(~^{(8'haa), (8'hbd)}))}})
(y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'h301):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire123;
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg [(4'hb):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg141 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  assign y = {wire18,
                 wire19,
                 wire20,
                 wire123,
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
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire18 = ({((8'hb6) ?
                          (wire14[(4'ha):(3'h7)] ?
                              $unsigned(wire13) : (wire17 <<< wire14)) : wire17[(4'h8):(2'h2)]),
                      wire13[(1'h1):(1'h0)]} & ($signed({{wire13},
                      wire15[(3'h5):(1'h1)]}) >>> {wire15,
                      ($unsigned((8'h9c)) ^~ $signed(wire15))}));
  assign wire19 = wire13[(2'h2):(1'h1)];
  assign wire20 = $unsigned(($unsigned(($signed(wire13) >> (wire18 <<< wire16))) ?
                      (($signed(wire13) ?
                              (wire19 >> wire19) : (wire18 ? wire16 : wire19)) ?
                          wire13 : $signed((8'h9f))) : $signed($unsigned(wire15))));
  always
    @(posedge clk) begin
      reg21 <= wire20[(2'h2):(1'h1)];
      reg22 <= reg21;
      reg23 <= reg22;
      if ($unsigned(({$unsigned({wire19, wire20}),
              ((~wire20) >>> ((8'hbd) ? (8'hb3) : reg22))} ?
          ((7'h41) ? $unsigned(reg22) : wire14) : (|wire14))))
        begin
          reg24 <= $signed({((~&(wire17 + reg22)) >>> (8'haf)),
              $unsigned((^~wire13))});
          reg25 <= wire13[(2'h2):(1'h0)];
          reg26 <= {$unsigned(wire17),
              (^(reg21 & ((wire16 + (8'h9d)) | (reg24 ? reg25 : reg25))))};
          reg27 <= (8'hbd);
          reg28 <= $unsigned(($signed({wire16[(4'ha):(4'ha)]}) ?
              $signed((~&(8'hbc))) : (8'hb8)));
        end
      else
        begin
          reg24 <= (8'ha2);
        end
      reg29 <= reg28;
    end
  always
    @(posedge clk) begin
      if (($signed(wire18[(1'h0):(1'h0)]) ?
          ($unsigned(((reg28 ? reg27 : reg24) ^~ wire20[(3'h4):(2'h3)])) ?
              ($signed((reg22 + reg23)) ?
                  ((8'hae) && (8'hb4)) : reg22) : (!$unsigned((-wire20)))) : (($signed((^reg24)) <= ($signed(reg25) ?
                  $unsigned(wire20) : (reg27 + reg26))) ?
              (&(~&wire19[(3'h7):(2'h2)])) : $signed(({wire20} ?
                  reg28[(4'hd):(4'ha)] : wire15)))))
        begin
          reg30 <= (+(~$unsigned(({reg23} ?
              reg23[(3'h5):(1'h0)] : $unsigned(wire20)))));
          reg31 <= ($signed((~^$signed($signed(reg30)))) ?
              wire14[(3'h6):(1'h0)] : (~&reg30));
          if ($unsigned($signed(((~^wire20) <<< (reg29[(3'h5):(2'h3)] - $signed(reg28))))))
            begin
              reg32 <= (+({{wire14}} ?
                  (^$unsigned((wire14 ? reg24 : reg23))) : (+$unsigned((reg26 ?
                      reg25 : wire14)))));
              reg33 <= reg30;
              reg34 <= ((wire19 ~^ {(8'hae),
                  (~|$signed(wire19))}) || $signed($signed($unsigned(reg29[(3'h7):(3'h5)]))));
              reg35 <= $signed((wire15 > $signed($unsigned((^reg25)))));
              reg36 <= {(~(reg33 + wire17))};
            end
          else
            begin
              reg32 <= reg31[(3'h7):(3'h4)];
            end
          reg37 <= wire15;
          if ($signed($signed(reg25)))
            begin
              reg38 <= reg35[(2'h3):(2'h3)];
              reg39 <= reg34[(2'h3):(1'h1)];
              reg40 <= wire16;
            end
          else
            begin
              reg38 <= $unsigned($signed(($signed((~|reg23)) ?
                  (|reg38) : {$signed(reg34), $unsigned(reg29)})));
              reg39 <= $unsigned(reg30);
            end
        end
      else
        begin
          if ({$signed((reg35[(3'h4):(1'h1)] && reg21)), reg22})
            begin
              reg30 <= (~|$unsigned(reg24[(5'h12):(4'ha)]));
              reg31 <= ({(^~(reg30 ? (wire20 * (8'h9e)) : reg35)),
                  (((wire15 ~^ reg22) && (~reg21)) >> reg33[(1'h0):(1'h0)])} < (8'ha7));
              reg32 <= $unsigned((reg24 || $signed($signed((^~reg40)))));
              reg33 <= (wire16 - (((~|$unsigned((8'hae))) < ((reg23 + reg39) ^~ $signed(reg24))) ~^ reg32));
              reg34 <= reg28[(4'h8):(3'h6)];
            end
          else
            begin
              reg30 <= ((|(+$signed({reg32}))) ?
                  (wire19 ?
                      wire16 : ($unsigned(reg30) * {(-reg32),
                          $unsigned(wire17)})) : (reg24 ?
                      ({(reg22 ? reg32 : reg33)} ?
                          reg34 : reg26) : ((~^((8'hb4) | reg32)) ?
                          (&reg36) : ($signed(reg36) ?
                              {reg27} : (reg21 & reg40)))));
            end
          reg35 <= wire20;
          reg36 <= $signed(({$unsigned(wire17[(3'h7):(3'h7)]),
              $signed(wire16[(4'h9):(1'h1)])} || reg26[(3'h7):(1'h0)]));
          reg37 <= (^{(-wire15), $unsigned($signed(reg32))});
        end
      if ({((($signed(reg23) ? reg33[(5'h10):(3'h7)] : (reg24 | wire15)) ?
              wire20[(3'h7):(3'h4)] : (&reg24[(1'h0):(1'h0)])) == (reg38 ?
              reg27[(2'h3):(2'h3)] : $signed($unsigned(reg25))))})
        begin
          if ($signed(reg29))
            begin
              reg41 <= $signed((^~reg37));
              reg42 <= (reg26[(4'hb):(3'h4)] - ({wire17,
                  reg23} - ((!(reg29 ^~ (8'ha0))) ~^ reg28)));
              reg43 <= $signed((&(~|$unsigned((reg29 << reg24)))));
            end
          else
            begin
              reg41 <= (^~$unsigned((reg29[(3'h6):(1'h1)] ?
                  ((wire14 ? (8'ha3) : reg28) > reg21) : {$unsigned(reg35)})));
            end
          reg44 <= (reg38[(4'hf):(3'h6)] >>> ($signed($unsigned(reg42[(3'h4):(3'h4)])) ?
              $signed((~^$unsigned((8'hb0)))) : (((reg31 || wire17) || ((8'hae) ?
                  reg26 : (8'ha5))) == reg26)));
        end
      else
        begin
          if ({reg34})
            begin
              reg41 <= (({reg38} | $unsigned((reg21[(3'h4):(1'h0)] ?
                      {reg31, (8'ha6)} : (reg41 < reg25)))) ?
                  (reg23[(3'h7):(1'h1)] * (reg40[(4'hb):(4'h8)] * ($signed(reg42) ^ wire15[(3'h7):(3'h5)]))) : wire19);
              reg42 <= $signed(((&{{reg27}}) && wire17[(3'h5):(3'h4)]));
              reg43 <= (($unsigned($signed((&reg36))) | (wire16[(1'h1):(1'h0)] ?
                      {(-(8'h9c)), wire13} : $signed((reg41 ?
                          reg43 : wire16)))) ?
                  reg29 : wire19[(1'h0):(1'h0)]);
              reg44 <= (reg34[(4'h8):(3'h5)] <= $unsigned(((~$unsigned(wire17)) < $unsigned((~|reg28)))));
              reg45 <= $signed($signed(reg22[(4'hb):(4'hb)]));
            end
          else
            begin
              reg41 <= $unsigned(((reg41 ?
                      $signed((reg33 || (8'h9d))) : ((reg26 ?
                          wire18 : reg42) * {reg32, reg38})) ?
                  {((~|reg27) ?
                          (reg31 ?
                              reg36 : (8'ha0)) : (reg33 | reg34))} : {$signed((&reg29)),
                      reg32[(4'hc):(3'h5)]}));
              reg42 <= (|reg25);
            end
          if ($signed($unsigned(wire13)))
            begin
              reg46 <= $unsigned($signed($signed($unsigned(reg22))));
              reg47 <= (|$unsigned($unsigned(reg34[(4'h8):(1'h0)])));
              reg48 <= wire17;
              reg49 <= reg45[(4'h8):(3'h6)];
            end
          else
            begin
              reg46 <= ((^{(-$unsigned(reg48)), (!$signed(reg23))}) ?
                  ($unsigned(((reg30 && reg23) - $signed((8'ha3)))) >>> reg38) : $signed($unsigned(($signed(reg28) ?
                      reg37 : $unsigned(reg29)))));
              reg47 <= $signed(reg49[(1'h1):(1'h0)]);
              reg48 <= $signed(reg46);
            end
          reg50 <= reg27[(2'h2):(1'h1)];
        end
      if (((-(((reg25 >= reg26) > (reg33 ?
              reg27 : (8'hbc))) >= reg35[(3'h5):(2'h3)])) ?
          $unsigned(({(~|reg27)} ?
              reg24 : reg27[(3'h4):(3'h4)])) : reg37[(4'h8):(3'h7)]))
        begin
          if ((($unsigned((reg38 >= $signed(reg50))) ^ {$signed((reg48 <= wire15)),
              $signed($unsigned((8'haf)))}) >> (8'hab)))
            begin
              reg51 <= reg40;
              reg52 <= $signed(reg47[(1'h1):(1'h1)]);
            end
          else
            begin
              reg51 <= {reg51[(3'h4):(2'h2)],
                  {$signed({(^reg41), (reg33 ~^ reg45)})}};
            end
        end
      else
        begin
          reg51 <= (~|(reg37[(4'he):(3'h6)] ?
              $unsigned({{reg25}, (wire14 | (8'hb0))}) : $signed(reg36)));
        end
      reg53 <= $signed($signed(((~$signed(reg25)) & ((reg35 | reg34) >> $unsigned((8'ha5))))));
      reg54 <= (~|(~^reg36));
    end
  module55 #() modinst124 (wire123, clk, reg54, wire13, reg40, reg53, reg37);
  always
    @(posedge clk) begin
      reg125 <= ($unsigned(reg51) - wire13);
      reg126 <= $unsigned({reg35,
          (((8'hbc) ? wire16 : {(8'h9c), reg38}) == reg21)});
      reg127 <= {$unsigned(({(reg47 < reg125), {reg125}} ?
              (~(8'hbc)) : (reg24[(3'h6):(3'h5)] ^ (reg23 <<< reg25))))};
      reg128 <= (($signed($signed((wire17 || reg29))) != ($unsigned(((8'hac) < reg51)) ?
          reg36[(4'h8):(3'h5)] : (+(reg47 - wire15)))) | $signed(((reg25[(2'h2):(1'h1)] ?
              wire19[(4'hc):(3'h5)] : {reg23, wire15}) ?
          (~^(wire123 ~^ wire14)) : ((wire16 ? wire13 : reg125) ?
              {wire18, (8'h9f)} : (~^reg41)))));
      if ({($unsigned(reg46) ?
              (((+reg42) == reg25[(1'h1):(1'h0)]) ^~ $signed((reg27 > reg28))) : wire16)})
        begin
          reg129 <= {(~$signed(((-reg24) || (reg44 ~^ wire19))))};
          reg130 <= reg39;
          if ((^~(!($unsigned((wire15 ? wire20 : reg51)) + (^~(&reg39))))))
            begin
              reg131 <= ($signed($unsigned(($signed(reg44) ?
                  reg51 : {reg26, reg130}))) && $signed((^~(!(reg31 ?
                  reg126 : reg40)))));
            end
          else
            begin
              reg131 <= {reg41[(4'h9):(1'h1)]};
              reg132 <= (8'hbd);
            end
        end
      else
        begin
          reg129 <= $signed($signed($unsigned(((&reg29) + $signed(reg126)))));
        end
    end
  always
    @(posedge clk) begin
      reg133 <= {wire123[(4'hb):(4'hb)], $unsigned($signed(reg28))};
      reg134 <= ((8'hbb) + $unsigned(reg42));
      reg135 <= {$unsigned(reg44[(1'h0):(1'h0)]),
          (({{reg130, reg37}} ?
                  $signed((reg30 ~^ reg28)) : (~|$signed((8'ha4)))) ?
              $signed((8'hb4)) : (8'ha4))};
      reg136 <= reg45[(4'hf):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg137 <= reg135;
      reg138 <= $unsigned((!reg34));
      reg139 <= {reg26[(1'h1):(1'h1)],
          {$unsigned($unsigned((reg43 != reg135))), $signed(reg135)}};
      if (reg24[(5'h12):(3'h7)])
        begin
          if ($signed((~|reg23)))
            begin
              reg140 <= (+reg48);
              reg141 <= (~^reg132);
              reg142 <= reg40;
            end
          else
            begin
              reg140 <= ((~(((wire13 * (8'hb8)) ?
                      (reg22 <<< reg129) : (reg142 ?
                          reg30 : reg41)) > ($signed(reg131) ?
                      (reg35 ? reg33 : reg135) : $unsigned(wire14)))) ?
                  reg44 : {reg31});
            end
          reg143 <= (((7'h44) ^ reg43[(5'h11):(3'h6)]) >>> (-reg126[(2'h2):(2'h2)]));
          reg144 <= ($signed(wire15[(1'h1):(1'h0)]) > ((-$unsigned(reg21[(2'h3):(1'h1)])) ?
              $unsigned($signed(reg51)) : (~|reg22)));
          reg145 <= ($signed($signed((7'h43))) ? $unsigned(wire13) : reg46);
        end
      else
        begin
          if ($unsigned({$unsigned(($signed(wire19) ?
                  $unsigned((7'h41)) : (~&wire16))),
              {reg135, {(~|reg144)}}}))
            begin
              reg140 <= $unsigned(reg21);
            end
          else
            begin
              reg140 <= reg126;
              reg141 <= reg137;
            end
          reg142 <= (|$unsigned($signed((8'ha0))));
          reg143 <= $unsigned({(((reg26 != wire13) < $unsigned(reg24)) || (-(~reg23)))});
        end
      reg146 <= (reg54 + (~($unsigned($signed(reg131)) ?
          $unsigned((reg54 == wire18)) : (reg144[(1'h1):(1'h1)] == (8'hac)))));
    end
endmodule

module module55
#(parameter param121 = ((^(8'hab)) - (((8'ha3) >>> {(8'hb4)}) > ((((8'hb8) + (8'h9e)) <= (8'hbf)) ? (^~((7'h44) ? (8'ha1) : (8'ha7))) : (~(~&(8'haf)))))), 
parameter param122 = ((8'hb0) - {{param121, {(param121 >> (8'ha0))}}, param121}))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h28d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire60;
  input wire signed [(2'h3):(1'h0)] wire59;
  input wire signed [(4'h9):(1'h0)] wire58;
  input wire [(4'hd):(1'h0)] wire57;
  input wire [(4'ha):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire61;
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  assign y = {wire103,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
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
                 reg105,
                 reg104,
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
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire61 = {$signed((($signed(wire60) ?
                          (wire58 ?
                              wire59 : wire58) : wire57) * (wire59[(2'h2):(1'h1)] ?
                          $unsigned(wire59) : wire57))),
                      $signed($unsigned((~|(!wire56))))};
  assign wire62 = ({$signed((wire58[(3'h5):(3'h4)] - (wire61 <= wire58))),
                      (|wire58[(3'h7):(1'h0)])} ^~ (!$signed((&(^~wire57)))));
  assign wire63 = $signed($unsigned((~|wire60[(4'hb):(3'h7)])));
  assign wire64 = (!((~^($signed(wire58) ? (^wire62) : wire63[(4'he):(2'h3)])) ?
                      (-((~&(8'h9f)) <= {wire62, wire63})) : wire56));
  always
    @(posedge clk) begin
      reg65 <= wire58[(3'h5):(2'h2)];
      if ((((wire58 <= (^$unsigned(wire60))) < (((wire64 ? wire62 : wire59) ?
          {reg65} : wire62[(2'h3):(2'h2)]) <= wire63)) ^ {(!(8'hab))}))
        begin
          reg66 <= reg65;
          if (reg66[(1'h0):(1'h0)])
            begin
              reg67 <= (wire62 ?
                  (wire64[(4'ha):(3'h4)] ?
                      (~|wire63[(2'h3):(1'h0)]) : (wire61[(1'h1):(1'h1)] ?
                          reg65 : (~(wire58 ^ wire57)))) : (((-$signed(wire62)) ?
                          $signed(wire60[(3'h5):(3'h4)]) : (wire58 * $unsigned(wire64))) ?
                      (wire62[(4'hf):(4'ha)] <<< $unsigned($signed((8'hb2)))) : ((wire57[(4'h9):(2'h3)] ?
                              (^~wire62) : reg65) ?
                          ((wire61 ? wire56 : (8'hac)) ?
                              $signed(reg65) : (wire64 - wire62)) : $signed(reg65))));
              reg68 <= (!((|reg67[(2'h2):(1'h1)]) ?
                  ($unsigned({reg66, wire63}) ?
                      ($signed(wire59) <= (reg65 > wire62)) : (wire58[(2'h3):(1'h1)] < $unsigned(wire62))) : (|{(-wire60)})));
              reg69 <= (((&(!{wire59})) ?
                      wire57[(2'h3):(1'h1)] : ($signed(reg65[(4'hc):(4'hb)]) ?
                          $unsigned($unsigned(wire60)) : (^wire56[(1'h0):(1'h0)]))) ?
                  {(+reg65), (8'hb8)} : {$signed((wire59[(2'h2):(2'h2)] ?
                          $unsigned(wire61) : (wire61 ? wire60 : wire60))),
                      $signed($unsigned((~&wire62)))});
              reg70 <= $unsigned(reg65[(4'hb):(2'h3)]);
            end
          else
            begin
              reg67 <= $signed($signed($signed(wire56)));
            end
          reg71 <= (~|reg66);
          reg72 <= $unsigned(wire61);
        end
      else
        begin
          reg66 <= (!$signed($signed($signed({wire64}))));
        end
      if (wire64[(2'h2):(1'h0)])
        begin
          reg73 <= ((($unsigned({reg66, reg71}) ?
                  $signed($unsigned((8'hb1))) : reg68) ?
              (~^reg67[(1'h1):(1'h0)]) : (&reg71[(3'h5):(2'h3)])) == ($unsigned(($signed(reg72) - reg72)) ?
              ((reg65[(4'he):(1'h0)] ? (~reg66) : $unsigned(reg65)) << ({wire61,
                  (8'ha2)} >> $signed((8'hb6)))) : (({wire58} ?
                  (reg72 ? wire56 : reg70) : (wire61 ?
                      wire61 : (7'h42))) >>> $unsigned({wire56}))));
          reg74 <= wire63;
          reg75 <= (reg67 - (reg70 ?
              reg70 : (($signed(reg66) ^ {reg74, reg65}) ?
                  (reg73[(3'h6):(1'h0)] ?
                      $signed(wire56) : ((8'hb9) ?
                          wire64 : wire58)) : reg68[(3'h7):(1'h0)])));
        end
      else
        begin
          reg73 <= wire56;
          reg74 <= ({((reg73[(4'hb):(4'hb)] ?
                          (reg71 ? wire60 : wire61) : $signed(wire64)) ?
                      $signed((reg66 ?
                          (8'hba) : wire64)) : wire57[(3'h6):(2'h2)])} ?
              wire61[(3'h7):(3'h6)] : $signed(wire60));
        end
      if ($unsigned(reg66[(2'h2):(2'h2)]))
        begin
          reg76 <= wire60[(2'h2):(1'h1)];
          if ($signed($unsigned(reg76[(1'h0):(1'h0)])))
            begin
              reg77 <= $unsigned($signed($unsigned(((~&reg73) ?
                  (wire61 > wire61) : reg71))));
            end
          else
            begin
              reg77 <= ((8'ha2) | $unsigned((^~reg66)));
              reg78 <= ((reg74[(3'h7):(3'h4)] >>> $signed($unsigned(reg71[(4'hb):(3'h7)]))) && (!$unsigned($unsigned($unsigned(reg77)))));
              reg79 <= {$signed((reg71[(4'ha):(1'h0)] >> wire56))};
            end
          reg80 <= (-(~|wire57));
          reg81 <= (&(8'hb3));
          reg82 <= $signed(((|$unsigned(reg73)) | {($unsigned((8'hab)) ?
                  wire61[(4'hb):(4'h9)] : $unsigned(wire64))}));
        end
      else
        begin
          reg76 <= reg69[(3'h4):(2'h3)];
          reg77 <= (($unsigned((-(wire56 ? wire58 : reg81))) ?
              $unsigned((^~(wire60 ?
                  reg79 : (8'ha1)))) : ((reg70[(4'hf):(4'ha)] ?
                      {reg77} : {wire59}) ?
                  $unsigned({reg74,
                      wire58}) : reg69[(2'h2):(1'h0)])) <= {(|{(~&(8'haf)),
                  reg73}),
              $signed(reg65[(4'hc):(3'h7)])});
          reg78 <= (((^reg74[(1'h1):(1'h0)]) ~^ ($signed((wire59 ?
              wire63 : wire61)) * reg71)) + $unsigned((reg73[(3'h6):(2'h2)] ?
              {reg70[(4'hc):(4'h8)]} : ($unsigned(reg77) ^~ reg74[(3'h6):(2'h3)]))));
          reg79 <= $signed(reg66);
          reg80 <= (reg66[(3'h7):(3'h5)] + reg82);
        end
    end
  assign wire83 = (8'had);
  assign wire84 = ($unsigned(reg74[(4'hb):(2'h3)]) << wire63);
  assign wire85 = reg79;
  assign wire86 = reg82;
  assign wire87 = (~^$unsigned(((reg81[(1'h0):(1'h0)] ?
                          (8'ha1) : reg72[(1'h0):(1'h0)]) ?
                      $unsigned(reg74) : (~$unsigned(wire86)))));
  assign wire88 = (~({(reg79[(5'h11):(5'h10)] ? reg74 : wire85[(3'h7):(2'h2)]),
                      wire87[(3'h5):(2'h2)]} ~^ reg77[(3'h6):(3'h4)]));
  assign wire89 = (reg69 >= {(wire64 ?
                          (wire60 ?
                              wire61[(3'h7):(3'h7)] : (~&(8'hb2))) : (|$signed(wire59)))});
  always
    @(posedge clk) begin
      reg90 <= (~|reg72);
      if (wire57[(2'h2):(2'h2)])
        begin
          if (reg72[(1'h1):(1'h0)])
            begin
              reg91 <= $signed($signed((-wire58[(3'h4):(3'h4)])));
              reg92 <= reg76;
              reg93 <= reg92[(3'h4):(2'h2)];
              reg94 <= (reg92 ?
                  $signed($signed(($signed(wire85) <<< $unsigned(reg66)))) : ({$signed({wire85,
                              (7'h43)})} ?
                      $unsigned($signed($signed((8'hbd)))) : (~{$signed((7'h41))})));
            end
          else
            begin
              reg91 <= ((wire56[(2'h3):(1'h0)] ?
                  $unsigned(reg68[(1'h0):(1'h0)]) : (~&wire88[(1'h1):(1'h1)])) > (8'ha0));
              reg92 <= $unsigned((-wire63));
              reg93 <= $signed($signed($signed({reg94[(2'h2):(1'h1)],
                  $unsigned(wire63)})));
              reg94 <= (~|(reg72[(1'h0):(1'h0)] >>> ({(reg72 ?
                      reg69 : wire88)} >>> $unsigned($signed(reg93)))));
            end
          reg95 <= $signed($unsigned(((reg69[(2'h2):(1'h0)] ?
              $unsigned(wire62) : wire87) > ((wire87 - reg71) ?
              $signed(wire88) : $signed(reg81)))));
          reg96 <= reg76[(2'h2):(2'h2)];
        end
      else
        begin
          reg91 <= (^({{(wire64 ? wire62 : wire57), reg92[(1'h0):(1'h0)]},
              ($signed((8'hb1)) != (reg93 ?
                  wire89 : reg80))} == reg69[(2'h3):(1'h1)]));
        end
      reg97 <= wire86[(4'hf):(2'h3)];
      if ($unsigned((reg65[(3'h7):(3'h6)] ?
          $unsigned(reg90[(3'h6):(1'h1)]) : $signed(reg65[(3'h7):(3'h6)]))))
        begin
          reg98 <= wire58[(1'h0):(1'h0)];
          reg99 <= (^~reg66[(1'h1):(1'h0)]);
          reg100 <= $unsigned($signed(reg99[(3'h5):(3'h5)]));
        end
      else
        begin
          reg98 <= (!$unsigned(($unsigned($signed(wire57)) <= {(wire60 ?
                  wire60 : reg94),
              ((8'had) ? (8'h9f) : reg73)})));
          reg99 <= reg71;
          reg100 <= reg73[(4'ha):(1'h0)];
        end
      reg101 <= ($signed($signed($signed((~^reg98)))) > (|$signed($signed({wire63,
          reg79}))));
    end
  always
    @(posedge clk) begin
      reg102 <= wire83;
    end
  assign wire103 = reg68[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg104 <= reg96;
      reg105 <= (!wire60);
      if ({((-reg104[(3'h6):(3'h5)]) ^~ $unsigned(({wire63} ?
              (wire61 << wire87) : $unsigned(wire61)))),
          ($unsigned(wire58) ?
              $unsigned((|(reg91 == reg97))) : $signed($signed({wire64,
                  wire88})))})
        begin
          reg106 <= $unsigned({wire62, (+(!$unsigned(reg72)))});
          reg107 <= wire56[(4'ha):(3'h6)];
          reg108 <= $signed({reg102});
        end
      else
        begin
          reg106 <= $unsigned($unsigned($unsigned((reg65[(3'h6):(2'h2)] ^ $unsigned(wire56)))));
        end
    end
  always
    @(posedge clk) begin
      reg109 <= (~|$signed($signed(reg106)));
      if ($unsigned((({(8'hb7), {reg79, wire86}} ?
              (~^wire59) : $signed((reg108 <= wire87))) ?
          ($signed(wire60[(4'ha):(2'h2)]) ?
              (reg65[(4'ha):(1'h0)] ?
                  ((8'haf) + wire61) : wire61[(3'h4):(1'h1)]) : $signed((!reg75))) : $signed((~|(|reg71))))))
        begin
          if (wire58[(2'h2):(1'h0)])
            begin
              reg110 <= (wire62 ^~ reg106[(3'h4):(1'h1)]);
              reg111 <= (((-{{reg99, reg104}}) ?
                      $unsigned({(wire85 ?
                              (8'hb7) : reg106)}) : $signed((+(wire57 ?
                          reg67 : (7'h40))))) ?
                  reg76 : (wire62[(4'hf):(4'hf)] ?
                      ((reg81 ? (wire56 && reg90) : $unsigned(wire63)) ?
                          (!{reg107}) : (((8'h9d) ^ reg79) & {reg107,
                              reg105})) : (^~(^(reg74 ? reg91 : (7'h41))))));
            end
          else
            begin
              reg110 <= ((~|(((reg77 ? reg82 : reg93) ?
                          (&wire61) : {wire62, wire89}) ?
                      {wire103} : $unsigned((8'hac)))) ?
                  (($signed($unsigned(wire87)) ^~ $signed($signed(reg97))) - {reg104,
                      $signed($unsigned(wire86))}) : reg92);
              reg111 <= $signed((7'h43));
              reg112 <= $signed((wire64[(3'h7):(2'h2)] ?
                  reg101 : ((~|{reg67, reg76}) ?
                      (~|$unsigned(reg111)) : reg66[(2'h2):(1'h0)])));
            end
          reg113 <= ($signed(reg73[(2'h3):(2'h3)]) + $unsigned(reg96[(2'h2):(1'h0)]));
          if ({reg71[(1'h0):(1'h0)]})
            begin
              reg114 <= $signed(reg112[(2'h3):(1'h0)]);
              reg115 <= ($signed(reg97[(2'h3):(2'h2)]) - ($signed(($signed(reg92) > wire83[(3'h4):(1'h0)])) ?
                  (8'hb0) : reg100[(3'h5):(3'h5)]));
            end
          else
            begin
              reg114 <= $unsigned(reg97[(4'h8):(3'h4)]);
              reg115 <= reg68;
              reg116 <= wire86[(4'h8):(3'h6)];
              reg117 <= $signed((!{$unsigned($unsigned(reg92)), (|(~wire87))}));
            end
        end
      else
        begin
          reg110 <= $signed(reg110);
          reg111 <= (8'hb4);
          reg112 <= ((~|reg77[(1'h1):(1'h0)]) ?
              $unsigned(reg112[(1'h0):(1'h0)]) : $signed(wire84[(1'h1):(1'h0)]));
        end
      reg118 <= reg94[(1'h0):(1'h0)];
      reg119 <= ((8'hb5) ?
          ($signed((-$unsigned(wire84))) >= (($signed(reg74) ?
                  $signed(reg101) : (~|reg101)) ?
              reg97 : (-(wire86 <<< reg65)))) : $unsigned(((~|reg115[(1'h0):(1'h0)]) || wire61[(4'h9):(1'h0)])));
      reg120 <= reg77;
    end
endmodule

module module189  (y, clk, wire193, wire192, wire191, wire190);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire193;
  input wire [(5'h10):(1'h0)] wire192;
  input wire signed [(4'hb):(1'h0)] wire191;
  input wire [(4'h9):(1'h0)] wire190;
  wire [(4'hd):(1'h0)] wire206;
  wire signed [(3'h7):(1'h0)] wire205;
  wire [(3'h7):(1'h0)] wire204;
  wire signed [(5'h10):(1'h0)] wire203;
  wire signed [(5'h13):(1'h0)] wire201;
  wire [(3'h5):(1'h0)] wire200;
  wire [(4'he):(1'h0)] wire199;
  wire [(5'h11):(1'h0)] wire198;
  wire signed [(4'hb):(1'h0)] wire197;
  wire [(4'he):(1'h0)] wire196;
  wire signed [(3'h4):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire194;
  reg [(4'h8):(1'h0)] reg202 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 reg202,
                 (1'h0)};
  assign wire194 = $unsigned((-wire191[(1'h0):(1'h0)]));
  assign wire195 = (-$signed($unsigned($unsigned(wire193))));
  assign wire196 = {wire191[(4'hb):(1'h0)], wire193[(2'h3):(1'h0)]};
  assign wire197 = ({$signed((|wire190))} ?
                       $unsigned((wire196[(2'h3):(1'h0)] ?
                           (^~(wire195 ?
                               wire196 : wire192)) : $unsigned(wire196))) : $signed($unsigned(wire194[(3'h4):(3'h4)])));
  assign wire198 = (~&$signed(($unsigned((~|wire195)) ?
                       (8'ha8) : wire192[(4'hb):(4'ha)])));
  assign wire199 = ((-$unsigned(wire197[(4'h9):(1'h0)])) != ($unsigned((+{wire194})) ~^ wire190));
  assign wire200 = ((~&(~|($signed(wire191) ?
                           $signed(wire198) : wire193[(4'he):(3'h4)]))) ?
                       $signed($unsigned($signed($unsigned(wire192)))) : ($unsigned({$unsigned(wire198),
                               (wire198 ^~ wire190)}) ?
                           {wire199[(4'ha):(3'h7)],
                               $signed(wire197[(1'h0):(1'h0)])} : wire199[(3'h6):(2'h2)]));
  assign wire201 = (-($signed(wire194[(5'h14):(4'h9)]) | wire199[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      reg202 <= wire193[(3'h7):(2'h3)];
    end
  assign wire203 = $unsigned(reg202[(2'h2):(1'h0)]);
  assign wire204 = ((wire191 ?
                           wire203[(5'h10):(4'he)] : $signed($unsigned(reg202[(2'h3):(2'h3)]))) ?
                       $signed($unsigned((((8'had) ? wire200 : wire190) ?
                           (|wire192) : (wire201 >>> wire193)))) : ((wire193[(1'h1):(1'h0)] ^~ (wire192 ?
                           reg202[(1'h1):(1'h1)] : (wire203 ?
                               (8'h9c) : (8'hb3)))) >= $signed(wire201)));
  assign wire205 = wire204[(3'h7):(2'h2)];
  assign wire206 = wire200[(2'h2):(1'h1)];
endmodule

module module161  (y, clk, wire165, wire164, wire163, wire162);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire165;
  input wire signed [(5'h15):(1'h0)] wire164;
  input wire [(5'h15):(1'h0)] wire163;
  input wire signed [(5'h13):(1'h0)] wire162;
  wire signed [(4'h8):(1'h0)] wire181;
  wire signed [(5'h15):(1'h0)] wire180;
  wire [(4'hf):(1'h0)] wire179;
  wire [(4'h8):(1'h0)] wire178;
  wire [(4'ha):(1'h0)] wire177;
  wire [(5'h12):(1'h0)] wire176;
  wire signed [(3'h6):(1'h0)] wire175;
  wire signed [(4'he):(1'h0)] wire171;
  wire [(4'hf):(1'h0)] wire170;
  wire [(5'h15):(1'h0)] wire169;
  wire signed [(3'h6):(1'h0)] wire168;
  wire signed [(4'h8):(1'h0)] wire166;
  reg signed [(4'he):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg172 = (1'h0);
  reg [(5'h13):(1'h0)] reg167 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire166,
                 reg174,
                 reg173,
                 reg172,
                 reg167,
                 (1'h0)};
  assign wire166 = $signed((wire163 <<< $signed(wire163)));
  always
    @(posedge clk) begin
      reg167 <= wire165;
    end
  assign wire168 = $signed((|{(~|(reg167 >> wire162))}));
  assign wire169 = ($unsigned((+wire165)) ?
                       wire168[(2'h2):(1'h0)] : ($unsigned(wire164[(3'h6):(3'h5)]) && ($signed(wire166) ^~ ((wire166 <= wire163) ?
                           wire163 : wire168[(3'h5):(3'h5)]))));
  assign wire170 = (~wire165[(2'h2):(2'h2)]);
  assign wire171 = wire166[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg172 <= ($unsigned($signed(wire163)) ?
          (8'ha6) : ($signed((^$signed(wire166))) ?
              (wire168 <<< (~&$unsigned((8'hb5)))) : (($signed(wire164) >= (wire165 ?
                  reg167 : wire170)) < wire166[(3'h5):(3'h5)])));
      reg173 <= ((+(~^(8'ha9))) ? reg172 : wire169);
      reg174 <= (((~|$unsigned({(8'hbc)})) <= wire165[(4'h9):(3'h7)]) ?
          ((^~(8'hbd)) ?
              $signed(wire163) : (-($unsigned(wire168) ?
                  wire170 : ((8'hba) << reg173)))) : ($signed(($unsigned(reg173) ?
                  reg172[(4'ha):(1'h1)] : reg167)) ?
              wire169 : (wire166 ?
                  (^~(wire163 ^ wire168)) : $signed(((8'ha0) && reg173)))));
    end
  assign wire175 = ({reg172[(3'h6):(3'h6)]} + wire164);
  assign wire176 = $signed((~|wire175[(3'h6):(3'h6)]));
  assign wire177 = {(8'hbb), (wire163 ? wire170 : wire169[(4'hb):(3'h6)])};
  assign wire178 = $signed($unsigned((~^$signed($unsigned(wire176)))));
  assign wire179 = {(wire169[(5'h12):(4'hd)] | ($unsigned($unsigned(wire178)) >= $signed(wire162)))};
  assign wire180 = ($signed((~^((~&(8'hbf)) ?
                           (wire177 ? (8'ha5) : wire176) : $signed(wire171)))) ?
                       reg173 : $signed((((~wire175) & (wire163 >>> wire166)) != ($signed(wire162) ?
                           wire175 : (|wire164)))));
  assign wire181 = wire163;
endmodule
