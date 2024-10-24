module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h228):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire173;
  wire [(3'h5):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire165;
  wire signed [(4'hc):(1'h0)] wire162;
  wire [(4'hf):(1'h0)] wire151;
  wire [(4'ha):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire144;
  wire signed [(2'h2):(1'h0)] wire130;
  wire [(4'h8):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg171 = (1'h0);
  reg [(2'h3):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg164 = (1'h0);
  reg [(4'ha):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(5'h12):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire165,
                 wire162,
                 wire151,
                 wire145,
                 wire144,
                 wire130,
                 wire129,
                 wire127,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg164,
                 reg163,
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
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
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
                 (1'h0)};
  assign wire4 = $signed((8'h9c));
  assign wire5 = $unsigned((((wire3[(4'hd):(3'h4)] ?
                         (wire2 >= (8'hbe)) : wire0[(1'h0):(1'h0)]) ?
                     ({wire4} < wire2[(3'h4):(1'h0)]) : wire2[(2'h2):(1'h0)]) >= $signed($signed($signed(wire2)))));
  assign wire6 = (((wire2[(1'h1):(1'h1)] ? wire1[(1'h0):(1'h0)] : wire1) ?
                         wire2[(1'h0):(1'h0)] : (wire0[(3'h4):(3'h4)] ?
                             ((wire5 > wire1) ?
                                 $signed(wire0) : (wire1 && wire0)) : ((wire0 ^ wire1) ?
                                 $signed(wire5) : $unsigned((8'hb5))))) ?
                     ({$unsigned(wire5[(4'h8):(2'h2)]),
                         wire1} >> ($signed((wire3 << wire5)) ?
                         (((8'h9e) >>> (8'h9e)) != $unsigned(wire3)) : wire2[(3'h4):(3'h4)])) : $signed($unsigned(($unsigned((8'hb4)) ~^ (wire0 <<< wire0)))));
  assign wire7 = ($signed($unsigned((wire3[(2'h2):(2'h2)] ?
                     ((8'hb9) < (8'hb0)) : wire6))) + {(-((wire5 ?
                             wire5 : wire0) ?
                         (~wire0) : wire3)),
                     wire1[(2'h3):(2'h2)]});
  module8 #() modinst128 (.wire10(wire4), .y(wire127), .clk(clk), .wire12(wire3), .wire9(wire2), .wire11(wire1));
  assign wire129 = $signed((~(wire6 ?
                       (wire0[(1'h0):(1'h0)] && wire0[(1'h1):(1'h1)]) : ($signed((8'hb4)) ?
                           ((8'ha7) ? wire1 : (8'hb8)) : (^~wire2)))));
  assign wire130 = {((|((wire7 ? wire4 : wire4) ?
                           wire1 : (wire0 && wire7))) <= ((8'hb8) ?
                           $signed((wire6 || wire0)) : $unsigned(wire2)))};
  always
    @(posedge clk) begin
      if ($unsigned($signed(({$unsigned((8'hbc))} ?
          $signed((&wire6)) : (wire129 ?
              (wire129 | wire3) : $unsigned(wire1))))))
        begin
          reg131 <= wire1[(1'h0):(1'h0)];
          reg132 <= (wire1[(1'h0):(1'h0)] ?
              (~&wire4[(4'hf):(3'h5)]) : (~^$signed($signed((8'haa)))));
          if ((reg131[(5'h12):(4'hb)] > wire6[(3'h7):(3'h7)]))
            begin
              reg133 <= wire3[(5'h11):(4'ha)];
              reg134 <= (($unsigned(((-wire2) ?
                          $unsigned(wire1) : $unsigned(wire127))) ?
                      {(((8'hb4) ? (8'hac) : wire0) - (~^wire2)),
                          ((+wire7) ?
                              reg133[(2'h2):(2'h2)] : wire127[(3'h4):(2'h2)])} : wire1[(2'h2):(1'h0)]) ?
                  (reg133[(1'h0):(1'h0)] <= $signed(($signed(reg133) ?
                      $unsigned(wire130) : $unsigned(wire7)))) : (($unsigned($unsigned(reg131)) + {reg131,
                      (wire4 ?
                          reg132 : wire6)}) & $unsigned((wire2[(4'ha):(4'h9)] ^ (+wire4)))));
              reg135 <= (^($signed((|reg134)) >>> (wire5 - ($signed(reg132) ?
                  {(8'hb4), (8'ha7)} : (wire3 ? wire6 : (8'haa))))));
              reg136 <= wire5[(4'hd):(4'hb)];
            end
          else
            begin
              reg133 <= (8'ha0);
              reg134 <= $signed(($unsigned($unsigned((8'ha1))) | ((wire6[(1'h0):(1'h0)] ?
                  {reg131, wire5} : (~|reg131)) << $unsigned(wire129))));
              reg135 <= wire0;
              reg136 <= wire7[(3'h4):(2'h3)];
            end
        end
      else
        begin
          reg131 <= reg134[(1'h1):(1'h1)];
          if ($unsigned(wire0))
            begin
              reg132 <= (wire1[(3'h4):(3'h4)] || {$signed(wire7[(3'h4):(2'h3)])});
              reg133 <= {reg133[(1'h0):(1'h0)], wire4[(5'h10):(4'ha)]};
              reg134 <= reg131[(3'h4):(2'h2)];
              reg135 <= $unsigned(({$signed(((8'h9e) ?
                      reg136 : wire0))} || $signed(reg133)));
            end
          else
            begin
              reg132 <= reg135[(1'h0):(1'h0)];
              reg133 <= (^reg132);
              reg134 <= ((~^(wire4[(5'h12):(3'h6)] ?
                  wire129[(2'h2):(1'h1)] : wire129[(3'h7):(2'h3)])) || wire1);
              reg135 <= $signed(wire127);
              reg136 <= $signed(wire130);
            end
          reg137 <= (^~$signed(wire4[(4'hc):(4'h8)]));
        end
      if ($signed(reg133[(2'h2):(1'h1)]))
        begin
          reg138 <= (8'hb4);
        end
      else
        begin
          reg138 <= ((wire127 ?
              $signed(((wire129 ? wire130 : wire3) ?
                  (wire4 ? (7'h41) : wire4) : (wire3 ?
                      reg131 : reg135))) : (~$signed((7'h40)))) - $signed(wire2));
          reg139 <= (~&((-$signed({wire3, wire129})) ?
              $signed(((+wire4) - {(8'hac)})) : reg138[(4'hd):(3'h6)]));
          reg140 <= reg139[(4'h8):(2'h2)];
          reg141 <= wire1[(1'h1):(1'h0)];
          reg142 <= {wire130, $unsigned($unsigned(reg131))};
        end
      reg143 <= {$signed(wire130[(2'h2):(2'h2)]),
          $signed(((~|(reg139 ^ (8'ha3))) && wire129[(2'h2):(1'h0)]))};
    end
  assign wire144 = (!reg134);
  assign wire145 = ((reg137 ?
                           ($unsigned($unsigned(wire129)) + reg142[(2'h3):(1'h1)]) : wire1) ?
                       $unsigned(reg140[(1'h0):(1'h0)]) : ($unsigned(((wire4 ~^ reg141) != (wire127 ?
                               reg137 : wire130))) ?
                           (wire2[(3'h6):(1'h0)] ?
                               ($signed(wire130) ?
                                   (reg135 ? reg135 : (8'hb6)) : (reg141 ?
                                       reg141 : reg141)) : (wire127 ?
                                   (reg140 == wire7) : (-reg142))) : $unsigned(reg132[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg146 <= (7'h43);
      reg147 <= (8'hab);
      reg148 <= reg142;
      reg149 <= (^~wire1[(1'h1):(1'h0)]);
      reg150 <= ({(~|$signed((reg136 | wire4))),
              $signed(((wire129 < wire145) ?
                  (wire7 * (8'h9d)) : $unsigned(reg140)))} ?
          (-((wire0 ? reg149 : (reg141 >>> wire2)) ?
              ($unsigned(reg135) == {(8'hbc)}) : (~wire2[(1'h1):(1'h0)]))) : (&wire145));
    end
  assign wire151 = (~^wire5);
  always
    @(posedge clk) begin
      reg152 <= wire7;
      if (reg139)
        begin
          reg153 <= reg140[(1'h1):(1'h1)];
          if ($signed({((7'h44) ? reg131[(5'h10):(4'hf)] : wire7)}))
            begin
              reg154 <= ($signed($signed($unsigned(reg148))) ?
                  (({$unsigned(wire151)} == ($signed(reg134) ?
                          $unsigned(reg133) : (reg138 ~^ reg148))) ?
                      (wire127[(4'h9):(1'h0)] >> ($signed(reg134) ?
                          reg153 : reg146)) : (^~$signed((wire5 ^ wire3)))) : ($unsigned($unsigned({wire145,
                          reg146})) ?
                      $unsigned($unsigned((reg134 ?
                          wire129 : reg147))) : wire129[(1'h0):(1'h0)]));
            end
          else
            begin
              reg154 <= {{reg135}, wire5[(4'he):(3'h7)]};
              reg155 <= {$signed($unsigned(((wire145 ? (8'haa) : reg152) ?
                      $signed(reg150) : (reg147 ? reg143 : wire5))))};
            end
        end
      else
        begin
          if (reg154[(2'h2):(1'h0)])
            begin
              reg153 <= $signed($signed((^~reg154[(1'h0):(1'h0)])));
              reg154 <= $signed((reg131[(5'h12):(3'h6)] || (((wire151 ?
                          (8'hbf) : reg141) ?
                      (8'hbc) : ((8'hbd) ? wire1 : reg155)) ?
                  (reg154 != reg132[(2'h3):(1'h0)]) : reg139)));
              reg155 <= reg146[(1'h0):(1'h0)];
              reg156 <= (~&wire1[(1'h0):(1'h0)]);
            end
          else
            begin
              reg153 <= ((-(7'h42)) ?
                  (~$signed((8'haf))) : $unsigned(reg148[(2'h2):(1'h0)]));
            end
          reg157 <= $signed((wire144 ?
              $signed(reg139) : $signed($signed($unsigned(reg142)))));
          reg158 <= ((($unsigned(wire1[(2'h2):(1'h0)]) >= (~|reg157[(2'h3):(2'h2)])) + reg137) ?
              (-(reg142[(1'h0):(1'h0)] ?
                  $signed(wire5) : reg154)) : (reg155 ^~ {(7'h42), reg147}));
          reg159 <= $signed($unsigned($signed(wire127)));
          reg160 <= wire1;
        end
      reg161 <= $unsigned($signed(reg132[(2'h3):(2'h3)]));
    end
  assign wire162 = $signed(({(~^$unsigned(reg147))} ?
                       reg134[(1'h0):(1'h0)] : $unsigned($signed(wire0))));
  always
    @(posedge clk) begin
      reg163 <= (reg148[(2'h3):(2'h3)] ?
          ((^({reg147} ? $signed(reg148) : $signed(wire0))) ?
              $signed($unsigned($signed(wire151))) : (((reg137 <= reg154) ?
                      $signed(wire130) : $signed(wire5)) ?
                  $signed((wire5 & wire6)) : reg134[(3'h4):(3'h4)])) : {reg154[(4'h8):(1'h1)]});
      reg164 <= $unsigned(($signed($signed((~reg155))) ?
          $unsigned(({reg152} | {wire3, wire7})) : $signed({(~reg140)})));
    end
  assign wire165 = $signed($unsigned((reg150[(1'h0):(1'h0)] || reg133[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      if (((-$unsigned($signed($unsigned((8'hbb))))) || ($signed((~&$signed(reg163))) + (-wire7[(4'ha):(3'h7)]))))
        begin
          reg166 <= $signed(reg150);
          reg167 <= ($signed(reg134[(1'h1):(1'h1)]) && {{$unsigned({wire7,
                      reg140}),
                  wire4[(4'h9):(3'h6)]}});
          reg168 <= ({reg140,
              (reg154[(2'h3):(1'h1)] <<< $unsigned(((8'hbf) <= wire3)))} ^~ (^~$unsigned(reg140[(3'h4):(2'h2)])));
          reg169 <= (((&(8'ha8)) ^ $signed(reg160)) & $unsigned(wire162));
        end
      else
        begin
          if ($unsigned((reg139 ?
              (!$signed($signed(wire129))) : (^~$unsigned($signed(reg157))))))
            begin
              reg166 <= ({({$unsigned(reg136), (reg166 << (8'hac))} ?
                          ((reg136 - wire4) << (wire3 | reg164)) : $unsigned($signed((8'hb6)))),
                      $unsigned((^(&(8'ha0))))} ?
                  reg136[(4'hb):(1'h0)] : $unsigned($unsigned((reg156[(4'hf):(4'h8)] ?
                      $unsigned(wire130) : (8'ha3)))));
              reg167 <= $unsigned((~$signed(reg146)));
              reg168 <= {(wire144[(1'h0):(1'h0)] ?
                      reg134[(3'h4):(1'h0)] : reg164[(3'h5):(1'h1)]),
                  ($unsigned(reg138) > (($unsigned((8'h9e)) ?
                      reg168[(3'h5):(3'h4)] : ((8'hb9) & reg160)) < ((^reg148) <= (wire145 || reg143))))};
              reg169 <= ({($signed((~&reg142)) ? wire151 : wire0)} ?
                  {(({reg150} ?
                          $signed(wire5) : wire145) << reg138[(3'h4):(1'h1)]),
                      $signed(reg148[(1'h0):(1'h0)])} : ($signed(reg163[(1'h0):(1'h0)]) <<< (~|((^~(8'hb1)) ?
                      reg149[(1'h1):(1'h0)] : (8'hbf)))));
              reg170 <= (8'hbb);
            end
          else
            begin
              reg166 <= (-((reg147 >> $unsigned((wire7 ?
                  reg136 : reg132))) >>> $unsigned(((reg131 ? reg155 : reg143) ?
                  $signed(reg154) : $signed(reg146)))));
              reg167 <= ($unsigned(reg154[(2'h2):(1'h0)]) * ($unsigned(((8'haa) - reg168)) ?
                  ($signed($unsigned(reg158)) ?
                      wire162[(2'h2):(1'h1)] : (^~reg131)) : $signed($signed($unsigned((8'hbe))))));
            end
          reg171 <= (~$signed(reg169));
        end
    end
  assign wire172 = (({((~&reg166) ? (reg138 ? reg131 : wire151) : reg148),
                           ((reg134 + wire4) | $unsigned(reg134))} ?
                       $unsigned(reg146) : reg139) >= $unsigned((^~reg149)));
  assign wire173 = reg161[(2'h3):(1'h0)];
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h2e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire [(4'ha):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'hc):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire13;
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  assign y = {wire125,
                 wire121,
                 wire120,
                 wire112,
                 wire60,
                 wire59,
                 wire37,
                 wire36,
                 wire13,
                 reg126,
                 reg124,
                 reg123,
                 reg122,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
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
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
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
                 (1'h0)};
  assign wire13 = wire10[(4'ha):(2'h2)];
  always
    @(posedge clk) begin
      reg14 <= wire13;
      reg15 <= ((^~(wire12 ?
          (wire12 ?
              $signed((8'hb6)) : wire13[(2'h3):(1'h0)]) : ($signed(wire12) ?
              {wire10} : $signed((8'hbd))))) | $signed($unsigned($unsigned({reg14,
          (8'h9c)}))));
      reg16 <= {{wire9, {{$unsigned(reg14)}}}, $signed(wire10[(4'h9):(3'h5)])};
    end
  always
    @(posedge clk) begin
      if (((8'hac) - wire11[(3'h5):(3'h4)]))
        begin
          reg17 <= ($unsigned((wire11 >> (|(reg16 | wire11)))) ^~ wire11[(3'h4):(1'h0)]);
          reg18 <= reg15;
          reg19 <= (wire9[(5'h13):(2'h3)] - (-reg15));
          reg20 <= wire9;
          reg21 <= reg18;
        end
      else
        begin
          reg17 <= $unsigned($unsigned($signed((+(reg14 ? wire9 : wire13)))));
          if ((8'hba))
            begin
              reg18 <= ($signed((((~|wire12) ?
                  $signed(reg19) : (wire12 ?
                      wire10 : reg21)) ^~ $unsigned((reg17 == reg17)))) || (~$unsigned(((7'h42) <= (wire10 ^ wire11)))));
            end
          else
            begin
              reg18 <= (($unsigned(((+reg17) ? (~&reg16) : $signed(reg19))) ?
                  reg21[(3'h7):(1'h1)] : (((wire9 ? wire9 : reg16) ?
                      $unsigned(reg15) : wire9) < $unsigned(reg20))) > reg21);
              reg19 <= (reg15[(2'h2):(2'h2)] ?
                  $signed($signed(wire13)) : reg20[(4'h8):(2'h3)]);
              reg20 <= $unsigned($unsigned(reg19));
              reg21 <= wire11[(3'h4):(1'h0)];
              reg22 <= reg16[(5'h13):(3'h7)];
            end
        end
    end
  always
    @(posedge clk) begin
      if (wire9)
        begin
          reg23 <= wire13[(2'h2):(2'h2)];
          if ((wire10[(1'h1):(1'h1)] ?
              (~&$signed($signed(wire13[(4'hb):(3'h4)]))) : $signed($signed((~(wire13 ?
                  reg15 : reg15))))))
            begin
              reg24 <= ($signed((reg18 >>> reg14[(4'hb):(4'h8)])) || (-{reg16[(4'h9):(1'h0)],
                  (|$unsigned(wire10))}));
            end
          else
            begin
              reg24 <= reg23;
            end
          reg25 <= (|(~&(reg17 * reg23[(1'h0):(1'h0)])));
        end
      else
        begin
          reg23 <= $unsigned($signed((~|(&(reg24 ? reg16 : reg15)))));
          reg24 <= $signed($unsigned(($unsigned((~reg18)) ?
              reg14 : $unsigned($unsigned((8'hbb))))));
          reg25 <= (~|$unsigned((((~reg16) ?
                  (~&wire13) : (wire9 ? (8'haa) : reg24)) ?
              $unsigned((~|(8'haa))) : (^~(~^(8'hab))))));
        end
      reg26 <= $signed((((wire10[(1'h1):(1'h1)] ?
          $signed(reg19) : $unsigned(reg22)) < (+reg18)) - $signed($unsigned((+reg20)))));
      if ((8'ha3))
        begin
          reg27 <= ($signed(($signed((-reg14)) >> ((wire10 ?
                  reg17 : reg18) == $signed(wire13)))) ?
              (|wire13) : {{$signed({reg21}), (~^$unsigned((8'ha8)))},
                  $signed($unsigned((reg14 ? reg22 : reg23)))});
          reg28 <= (reg27 << wire11);
        end
      else
        begin
          if (({wire9,
                  (!(reg22[(1'h0):(1'h0)] ?
                      (!(8'hb3)) : (reg24 ? reg23 : reg20)))} ?
              ((~&({reg17} >= reg19)) ?
                  reg18 : $unsigned($signed(reg17))) : $signed(((reg17 ?
                  reg14 : wire13[(4'ha):(2'h3)]) | $signed((^~reg24))))))
            begin
              reg27 <= reg20[(1'h1):(1'h1)];
              reg28 <= reg27;
            end
          else
            begin
              reg27 <= (~|$unsigned((~|(^$unsigned(reg23)))));
            end
          reg29 <= (reg17[(3'h6):(1'h1)] ?
              {$unsigned(reg23),
                  $unsigned(reg23)} : (~|$unsigned($signed((reg18 ?
                  reg24 : reg28)))));
          reg30 <= reg21[(4'hd):(4'ha)];
          if (({(^((8'hab) ? $signed(wire9) : ((8'hb9) ? (8'hbb) : reg15))),
              (|(^~reg30[(2'h2):(2'h2)]))} > $unsigned((^(wire13 ?
              $unsigned(reg23) : reg22)))))
            begin
              reg31 <= $signed((reg19[(2'h2):(1'h0)] > ($signed((~^reg27)) == ($signed(reg25) && reg16[(4'h9):(3'h7)]))));
              reg32 <= $unsigned((!$signed(((~^reg17) ?
                  (~&reg20) : $unsigned(reg26)))));
            end
          else
            begin
              reg31 <= reg21[(4'hc):(1'h1)];
              reg32 <= (~&(reg22[(1'h1):(1'h1)] > $unsigned((reg18 && (^~reg26)))));
              reg33 <= $unsigned({reg30[(3'h7):(3'h7)], (reg29 + reg30)});
              reg34 <= ($unsigned($unsigned((~&reg18[(4'ha):(2'h2)]))) >= ((reg32 ?
                  (!$signed(reg19)) : $unsigned((!reg18))) >> wire10));
              reg35 <= reg33[(2'h2):(1'h0)];
            end
        end
    end
  assign wire36 = $unsigned($signed($signed($unsigned($unsigned(reg32)))));
  assign wire37 = wire11;
  always
    @(posedge clk) begin
      reg38 <= (~|$unsigned((wire13 ~^ (reg21 + (-reg29)))));
      if ($signed($signed(($unsigned(((7'h43) ? reg15 : (8'hb4))) ?
          (reg23 ?
              (wire36 || wire37) : (reg33 ^~ reg29)) : reg31[(3'h4):(3'h4)]))))
        begin
          reg39 <= $signed({wire10[(4'h9):(3'h4)]});
          reg40 <= ($signed(reg34[(3'h6):(2'h3)]) ?
              ($unsigned(wire11[(2'h2):(1'h0)]) << reg18) : (~$unsigned(wire11)));
          if ((((reg25[(3'h6):(3'h6)] | $signed({wire9,
              reg19})) ^~ $signed(reg25)) ~^ $signed((-wire13[(4'hd):(2'h3)]))))
            begin
              reg41 <= ((reg38[(3'h5):(2'h2)] ?
                      $unsigned($unsigned((reg24 ?
                          reg28 : (8'hb8)))) : wire11[(2'h3):(2'h3)]) ?
                  wire11 : (($signed((reg14 ? reg38 : reg24)) ?
                      {(~reg30)} : (8'ha8)) + reg14));
              reg42 <= wire11[(3'h5):(2'h3)];
              reg43 <= $unsigned($unsigned($signed({reg30, $unsigned(reg38)})));
            end
          else
            begin
              reg41 <= {$signed($unsigned(wire11))};
              reg42 <= $signed((($unsigned(reg35[(1'h1):(1'h0)]) >>> $signed((^~(8'hb4)))) <<< reg15));
            end
          reg44 <= (!(|$unsigned(reg40[(2'h2):(1'h0)])));
          reg45 <= (^~reg24);
        end
      else
        begin
          if ((reg17 < (!$signed($unsigned((~|reg14))))))
            begin
              reg39 <= reg30[(1'h1):(1'h0)];
            end
          else
            begin
              reg39 <= (reg43 ?
                  (8'hbb) : ((|$signed(reg18[(3'h6):(3'h5)])) != ($signed($signed(wire36)) != (!reg32[(1'h1):(1'h1)]))));
              reg40 <= reg45;
              reg41 <= ($unsigned(reg17) ?
                  {{($signed(reg35) <<< $signed(wire13)),
                          $unsigned(reg19)}} : $unsigned({((reg39 ?
                          reg29 : reg25) <<< ((8'hb8) ? reg43 : reg30))}));
            end
          if (reg17)
            begin
              reg42 <= $signed((($unsigned($unsigned(reg32)) <<< reg19[(3'h7):(1'h0)]) ?
                  (^~$signed(reg35)) : ($signed($signed(reg38)) ~^ {{(8'ha9),
                          (7'h43)}})));
              reg43 <= $signed({(reg21[(2'h2):(1'h1)] != $signed(reg16)),
                  reg39[(4'h8):(2'h2)]});
              reg44 <= (8'hb8);
            end
          else
            begin
              reg42 <= $signed($unsigned($signed(reg14[(1'h1):(1'h1)])));
              reg43 <= {(($unsigned(reg18) ~^ (+(|reg25))) + ((~|reg31) ?
                      $unsigned((reg15 ?
                          reg21 : reg17)) : $signed(reg42[(4'hc):(1'h0)])))};
              reg44 <= $signed($signed({$unsigned((reg41 * reg45)), reg22}));
              reg45 <= (+(-reg31));
              reg46 <= reg27;
            end
          if (reg20)
            begin
              reg47 <= $signed($signed(((!(8'ha9)) ?
                  $unsigned(reg31) : wire36)));
              reg48 <= {reg19};
              reg49 <= ($signed(reg38[(2'h2):(1'h0)]) ?
                  {reg33} : ($unsigned(((^(8'ha6)) ?
                      (reg16 == reg48) : {(8'hbb)})) ^~ (&($unsigned(reg14) ?
                      (^(8'hbf)) : (^(7'h41))))));
              reg50 <= reg34;
            end
          else
            begin
              reg47 <= (!((-reg44) ? (+(|(+reg18))) : reg22[(3'h5):(2'h3)]));
              reg48 <= (!reg48[(3'h5):(3'h4)]);
              reg49 <= reg18[(4'h9):(1'h0)];
              reg50 <= {({(!reg22)} >= (($unsigned(reg31) & (wire36 ?
                          reg21 : reg50)) ?
                      $signed({(8'had), reg41}) : $signed($unsigned((8'hba))))),
                  reg48[(4'h8):(2'h2)]};
            end
          reg51 <= reg45;
          reg52 <= ($unsigned(reg17[(2'h3):(2'h3)]) & {$signed(($unsigned(reg21) ?
                  wire13 : (reg17 ~^ reg47)))});
        end
      if (reg45[(1'h1):(1'h1)])
        begin
          reg53 <= $signed(reg30[(1'h0):(1'h0)]);
          reg54 <= $signed(wire37[(4'h8):(4'h8)]);
          if ((|({((^~reg31) ? $unsigned((8'haf)) : reg46[(3'h5):(3'h4)]),
              ($signed(reg47) ?
                  $unsigned((7'h41)) : wire13[(4'hc):(4'hb)])} && ((&$unsigned(wire13)) - ((reg49 >>> reg38) ?
              (reg32 ? reg20 : reg23) : reg52)))))
            begin
              reg55 <= (&(+$signed($signed(reg26[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg55 <= (8'hb7);
              reg56 <= {reg27};
            end
          reg57 <= $unsigned(($unsigned($signed(reg25[(1'h1):(1'h1)])) ?
              $signed({{wire36, reg26}}) : (-reg31[(3'h5):(1'h1)])));
          reg58 <= reg32;
        end
      else
        begin
          reg53 <= (7'h40);
          reg54 <= ($signed({{(~^reg34)},
              {((8'ha7) ^ wire12)}}) == $unsigned(($unsigned($unsigned(reg18)) ?
              reg48[(2'h3):(2'h2)] : wire11[(3'h5):(3'h4)])));
        end
    end
  assign wire59 = (reg17[(4'hb):(2'h3)] ?
                      ($signed(($unsigned((8'ha1)) ?
                          (~&reg52) : {reg29})) ^ $unsigned(((~|reg47) ?
                          (+reg56) : (reg40 > reg42)))) : $unsigned((^(^~{reg29}))));
  assign wire60 = reg29;
  module61 #() modinst113 (wire112, clk, reg53, reg52, reg38, reg15, reg56);
  always
    @(posedge clk) begin
      reg114 <= {(!$unsigned({(reg57 & reg52), (wire9 ? wire10 : wire13)})),
          reg14[(4'hc):(3'h7)]};
      if ((&$unsigned($signed($signed((wire37 <= reg41))))))
        begin
          if ($signed(({$unsigned((reg40 ? reg53 : reg58)),
              $signed($unsigned(wire9))} <= $signed($signed($signed(reg58))))))
            begin
              reg115 <= (^$signed((reg51 == {$unsigned(reg54)})));
              reg116 <= ((^$unsigned(reg45)) <<< (~^$signed(reg34)));
              reg117 <= reg40[(3'h4):(2'h3)];
              reg118 <= (reg32 ?
                  ($signed($signed(reg32[(4'hd):(2'h2)])) & (reg44 != ((reg17 ?
                          reg46 : reg22) ?
                      $unsigned(reg55) : (^~reg21)))) : reg20[(1'h0):(1'h0)]);
            end
          else
            begin
              reg115 <= ($signed($signed(reg48)) ?
                  (^(reg34[(3'h4):(2'h2)] && reg53)) : $unsigned($signed($signed(reg17[(3'h5):(2'h3)]))));
              reg116 <= ((((~&$unsigned(reg53)) ^~ $signed(reg16[(4'ha):(2'h3)])) >>> (~&((reg26 > reg114) >>> (8'haf)))) == (!(&reg39)));
            end
          reg119 <= ($unsigned($unsigned(((reg52 ? reg14 : (8'ha2)) ?
              (!wire11) : (reg45 ? reg16 : (8'ha2))))) <= wire9);
        end
      else
        begin
          reg115 <= {$unsigned($signed($signed($unsigned(reg21))))};
          reg116 <= $unsigned(reg55[(4'ha):(3'h7)]);
        end
    end
  assign wire120 = (({$unsigned((^(8'haf))),
                       $signed({(8'ha7)})} != (~|($signed((8'hba)) != {(8'ha5),
                       wire11}))) && ({((reg118 ?
                               (8'h9d) : wire59) && {reg118}),
                           ($unsigned((8'hb8)) << (^wire9))} ?
                       reg57[(5'h15):(3'h5)] : $unsigned($unsigned($unsigned(reg54)))));
  assign wire121 = $signed(($signed(reg27[(3'h7):(3'h5)]) ?
                       (8'ha4) : (((reg14 ?
                           reg29 : reg16) >= $signed((8'ha6))) <<< reg19[(4'h9):(3'h6)])));
  always
    @(posedge clk) begin
      reg122 <= (reg119[(1'h0):(1'h0)] ?
          $unsigned(((reg51 ? (8'hb3) : (~^reg42)) - ({wire36,
              reg29} > $unsigned(reg55)))) : ($unsigned(reg22) ?
              reg115[(1'h1):(1'h0)] : (reg117[(1'h0):(1'h0)] != $unsigned((wire121 - reg45)))));
      reg123 <= ((reg35 + {wire121}) ?
          $signed($unsigned($signed(wire60[(5'h12):(4'h9)]))) : ($unsigned((reg57 << $signed(reg28))) ?
              $unsigned(wire121) : $unsigned((reg25 ?
                  reg116[(3'h6):(1'h0)] : reg47))));
      reg124 <= (~reg17);
    end
  assign wire125 = reg23;
  always
    @(posedge clk) begin
      reg126 <= (~$signed({reg56[(5'h10):(4'hf)]}));
    end
endmodule

module module61  (y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h236):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire66;
  input wire signed [(5'h15):(1'h0)] wire65;
  input wire signed [(4'ha):(1'h0)] wire64;
  input wire signed [(2'h3):(1'h0)] wire63;
  input wire signed [(4'hb):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire signed [(3'h4):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire108;
  wire [(5'h13):(1'h0)] wire107;
  wire [(3'h7):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire86,
                 wire85,
                 wire84,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
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
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg67 <= wire66[(4'hb):(1'h0)];
      if (wire64[(3'h7):(3'h6)])
        begin
          reg68 <= (~(~&wire64[(4'h9):(3'h5)]));
          reg69 <= (wire66[(4'h9):(2'h2)] >>> ($unsigned($signed((wire64 ?
              wire65 : wire66))) <= ((7'h40) ?
              $signed({wire63}) : {(wire65 >>> reg68)})));
          reg70 <= $signed(reg68[(2'h2):(1'h0)]);
          if ($unsigned({($unsigned(((8'ha0) ^ (8'ha0))) ^ ((reg68 ?
                  (8'ha6) : wire62) ^~ (reg70 ? wire64 : (8'ha5)))),
              {(^~$signed(reg67))}}))
            begin
              reg71 <= ((reg70[(2'h3):(1'h0)] ?
                      (wire63 == $signed(reg69)) : reg67) ?
                  wire66[(4'ha):(3'h7)] : $unsigned($unsigned((!$signed(wire66)))));
              reg72 <= (({reg70} + wire65[(5'h11):(4'ha)]) ?
                  reg71[(3'h4):(1'h1)] : $signed(reg69));
              reg73 <= $signed(((reg71 ?
                  reg69[(4'hb):(4'ha)] : (8'ha0)) + (8'hbb)));
              reg74 <= $unsigned((&(-$signed($signed((8'h9c))))));
              reg75 <= (reg73 <= (!$signed((-reg74[(4'h8):(3'h7)]))));
            end
          else
            begin
              reg71 <= $unsigned((($signed($signed(reg72)) ?
                  (^~(wire62 ?
                      reg70 : wire66)) : wire62[(3'h4):(1'h1)]) - wire64));
              reg72 <= $unsigned({wire63});
              reg73 <= $signed(reg69[(3'h4):(3'h4)]);
              reg74 <= $signed(wire63);
            end
          reg76 <= ($unsigned($unsigned(($unsigned(reg68) ?
                  $unsigned(reg71) : $signed(reg73)))) ?
              wire64 : ((reg75[(2'h2):(2'h2)] <= reg70) * $unsigned($unsigned(reg72[(4'hf):(3'h6)]))));
        end
      else
        begin
          reg68 <= (^~wire62);
          reg69 <= ({(7'h43)} <= wire64[(4'h8):(3'h7)]);
          reg70 <= $signed($signed((^~$unsigned($signed(reg72)))));
        end
      reg77 <= {((8'hbc) ^~ (reg67 >= (~&$unsigned(wire66))))};
      if ((-(wire63[(1'h0):(1'h0)] ? reg74[(4'h9):(3'h7)] : {reg69})))
        begin
          reg78 <= wire65;
          if ((reg76 ?
              (-reg67[(5'h10):(4'ha)]) : ((|$unsigned(wire66[(4'hc):(2'h2)])) == reg73[(4'ha):(2'h2)])))
            begin
              reg79 <= $signed(wire65);
              reg80 <= ({$unsigned(reg71[(1'h1):(1'h1)])} ?
                  (^~($signed((~&(8'h9e))) ?
                      $signed(reg74) : $unsigned({reg79}))) : (~&$signed((!reg75))));
              reg81 <= $unsigned($unsigned($signed(($signed(reg70) ?
                  $signed(reg73) : (^(8'hb9))))));
            end
          else
            begin
              reg79 <= wire64[(3'h4):(1'h0)];
              reg80 <= $unsigned((8'ha2));
            end
          reg82 <= $unsigned(((reg67 ? reg72 : (^(reg81 ? reg73 : reg77))) ?
              ((8'haa) <<< {$unsigned(reg81),
                  reg73[(1'h0):(1'h0)]}) : reg76[(3'h4):(2'h2)]));
        end
      else
        begin
          reg78 <= {reg75};
          if (wire64)
            begin
              reg79 <= (8'hbe);
            end
          else
            begin
              reg79 <= $signed(({reg78[(4'hb):(2'h2)]} ?
                  ((^~wire66[(5'h10):(2'h2)]) << reg69[(2'h2):(1'h0)]) : $signed($signed((wire65 ?
                      reg67 : reg79)))));
            end
          reg80 <= ($signed(reg77) ?
              reg81[(3'h4):(2'h2)] : (((~$signed(reg81)) ?
                      $signed((wire63 ? reg80 : reg75)) : ({(8'ha2), reg81} ?
                          reg82[(1'h0):(1'h0)] : (reg68 ? wire65 : (8'haa)))) ?
                  wire65 : wire66));
        end
      reg83 <= wire64;
    end
  assign wire84 = $unsigned(wire64);
  assign wire85 = (|((+(8'hba)) & reg72[(4'he):(2'h3)]));
  assign wire86 = wire63[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg87 <= (((reg75 ?
              {reg81[(2'h3):(1'h0)]} : $signed(reg82[(4'h9):(2'h3)])) ?
          ($signed((|reg73)) | $unsigned(reg79[(2'h2):(2'h2)])) : wire63) <<< (((reg70[(2'h2):(2'h2)] ?
              reg68[(4'hd):(4'h9)] : (|reg71)) ?
          (wire64 ? reg82 : reg80[(4'h8):(1'h0)]) : ((|reg73) * (reg75 ?
              reg81 : reg77))) >= $signed($signed($signed(reg81)))));
      reg88 <= $unsigned((reg74 ?
          reg79 : $signed($signed((reg87 ? reg67 : (8'hb4))))));
      reg89 <= (reg81 ?
          (^~$signed({wire85[(3'h6):(2'h3)]})) : $signed((wire63[(2'h2):(1'h0)] ?
              (^reg76) : ((reg77 ? wire84 : (8'h9f)) ^ (!wire85)))));
      reg90 <= (^(^~$signed(({(8'hb9)} == (reg71 ? (7'h42) : reg75)))));
      if (reg76[(2'h3):(2'h3)])
        begin
          reg91 <= (^$unsigned($unsigned(((wire64 * wire64) > {(8'hb1)}))));
        end
      else
        begin
          reg91 <= reg87;
          reg92 <= ($unsigned((^{reg79})) << reg69);
          reg93 <= ($unsigned(((8'hb4) - reg81)) <<< ((~(+{reg71})) >= $unsigned($signed({(8'had),
              reg68}))));
          reg94 <= reg90;
          reg95 <= $unsigned($signed($unsigned((reg88 + (reg80 ^~ reg89)))));
        end
    end
  assign wire96 = ($unsigned(wire66[(4'hd):(1'h1)]) << reg67[(4'hd):(3'h4)]);
  assign wire97 = $signed((reg91 ?
                      reg70[(1'h1):(1'h1)] : $unsigned($signed((+reg95)))));
  assign wire98 = ((+$unsigned(($signed(reg69) > (reg73 ~^ wire65)))) <= (^~(-reg70)));
  assign wire99 = reg82;
  assign wire100 = $signed({($signed({wire98, reg71}) ?
                           wire66[(4'hd):(4'hb)] : ({reg87} | $signed(wire96))),
                       wire62});
  assign wire101 = $unsigned(wire63);
  always
    @(posedge clk) begin
      reg102 <= wire99[(5'h10):(3'h6)];
      reg103 <= ({wire84} & reg76);
      reg104 <= (($unsigned((!(reg91 ~^ wire97))) ?
          {(|$signed(reg77)),
              wire97[(4'h8):(1'h1)]} : (+reg72)) ~^ $unsigned((reg92 & reg81)));
      reg105 <= reg93;
    end
  assign wire106 = $signed({wire63});
  assign wire107 = ((8'hbd) >= (((8'h9f) ?
                       reg83[(2'h2):(2'h2)] : $unsigned(((8'hab) >>> reg92))) || wire65));
  assign wire108 = $unsigned((~&($signed(((7'h43) ? reg77 : (8'hb8))) ?
                       $unsigned(wire63[(1'h0):(1'h0)]) : (|wire84[(3'h5):(1'h1)]))));
  assign wire109 = reg105;
  assign wire110 = $unsigned(wire99);
  assign wire111 = reg93;
endmodule
