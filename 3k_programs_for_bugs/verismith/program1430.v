module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire161;
  wire [(5'h13):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire155;
  reg signed [(4'hb):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg159 = (1'h0);
  reg [(4'hf):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  assign y = {wire161,
                 wire67,
                 wire42,
                 wire41,
                 wire39,
                 wire38,
                 wire36,
                 wire5,
                 wire155,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg55,
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
                 reg40,
                 (1'h0)};
  assign wire5 = $signed(($signed({$unsigned(wire0),
                     ((7'h44) ? wire0 : wire0)}) >= wire1));
  module6 #() modinst37 (.wire10(wire0), .y(wire36), .wire9(wire5), .wire8(wire2), .wire7(wire3), .clk(clk));
  assign wire38 = wire0[(4'h8):(1'h1)];
  assign wire39 = (~|($unsigned($unsigned((wire3 ? (8'hb8) : (8'ha7)))) ?
                      (8'ha5) : ((+(8'hbd)) ?
                          (!(^(8'ha5))) : $signed((wire2 ? wire38 : wire38)))));
  always
    @(posedge clk) begin
      reg40 <= (8'hbc);
    end
  assign wire41 = (wire39[(3'h6):(3'h4)] < $unsigned((wire39 - wire39[(2'h2):(2'h2)])));
  assign wire42 = wire5[(4'hc):(3'h4)];
  always
    @(posedge clk) begin
      reg43 <= wire1;
      if (($unsigned((^(^{wire2, wire4}))) ?
          $unsigned(wire5[(1'h0):(1'h0)]) : $unsigned(($unsigned($unsigned(wire42)) || {wire0,
              wire5}))))
        begin
          if (wire36)
            begin
              reg44 <= $signed((~^{((wire3 + (8'hb1)) ?
                      $signed(wire0) : {reg43}),
                  {((8'hb7) + wire38), (wire3 ? wire36 : (8'ha7))}}));
              reg45 <= (reg43[(2'h3):(2'h2)] ?
                  ((|wire0) ?
                      {($unsigned(reg44) && $signed(wire1)),
                          wire3[(5'h11):(4'ha)]} : $signed((|(reg40 != (8'hae))))) : (~&reg40[(4'ha):(2'h3)]));
              reg46 <= ((($unsigned((wire2 | wire4)) ?
                      ((~|reg40) == {reg45, reg44}) : $signed($signed(wire5))) ?
                  (({wire3} ?
                      wire2[(5'h13):(4'h8)] : (8'hab)) != wire3[(4'hb):(4'h9)]) : (($signed(wire5) > (-reg44)) << ($signed(wire1) << reg43))) == $unsigned((wire39[(2'h2):(2'h2)] <= {wire3,
                  wire42[(3'h7):(3'h6)]})));
            end
          else
            begin
              reg44 <= (^wire3);
              reg45 <= (({$unsigned(wire36)} | (wire2[(4'hd):(1'h1)] ?
                      $signed((~wire42)) : reg44[(3'h4):(1'h1)])) ?
                  reg40[(4'hc):(4'ha)] : wire42);
              reg46 <= $unsigned({$signed(((reg40 != wire3) + $unsigned((8'hba))))});
              reg47 <= $unsigned({wire0});
              reg48 <= (wire1 ?
                  (8'ha1) : (-$unsigned((((7'h41) ? wire38 : reg46) ?
                      (wire42 ? wire38 : reg47) : (wire38 >= wire38)))));
            end
          reg49 <= (wire38[(1'h1):(1'h0)] * wire1);
          reg50 <= $signed($unsigned((wire36 == reg40[(2'h2):(1'h1)])));
          if (($unsigned($unsigned(($signed((8'hb0)) ?
                  reg45[(1'h0):(1'h0)] : $signed(reg48)))) ?
              wire36 : (wire36 ? $unsigned(wire2[(4'hc):(2'h2)]) : (^~wire36))))
            begin
              reg51 <= ((8'ha0) ?
                  reg49 : {wire38[(1'h0):(1'h0)],
                      {reg49[(2'h2):(2'h2)], (8'hb7)}});
              reg52 <= (~&$unsigned(wire41));
              reg53 <= {($unsigned(($signed(wire41) <= wire41[(3'h6):(1'h1)])) <<< $signed({(8'h9d)})),
                  $signed({(~(wire5 ? wire0 : wire2)),
                      (reg47 >>> (reg52 ? reg46 : reg44))})};
              reg54 <= wire38[(4'hc):(4'hb)];
            end
          else
            begin
              reg51 <= wire38[(1'h1):(1'h1)];
              reg52 <= $signed({reg54});
              reg53 <= ({$unsigned(({reg43, reg49} < reg47[(2'h2):(1'h0)]))} ?
                  (wire2[(4'he):(3'h5)] ?
                      $unsigned(reg45[(4'h9):(4'h8)]) : wire0) : reg48);
              reg54 <= reg44;
              reg55 <= (($signed($unsigned((reg43 >>> reg45))) - {$signed($unsigned(reg50)),
                  wire42[(2'h3):(2'h3)]}) < wire1[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg44 <= (|$unsigned(reg48));
        end
    end
  module56 #() modinst68 (wire67, clk, reg45, reg43, reg46, wire38);
  module69 #() modinst156 (wire155, clk, wire2, wire41, reg48, wire3);
  always
    @(posedge clk) begin
      reg157 <= $unsigned($signed(($signed((wire5 >>> reg40)) != ($signed(wire36) & $unsigned(reg53)))));
      reg158 <= reg43[(1'h0):(1'h0)];
      reg159 <= (reg50[(3'h6):(1'h0)] ?
          (~^$signed(($unsigned(wire5) <<< (reg49 && (7'h40))))) : {(+($signed(wire67) ?
                  reg45 : reg53[(4'he):(1'h0)])),
              $signed((^$signed(reg46)))});
      reg160 <= (wire5[(5'h10):(3'h5)] ? reg47[(3'h7):(2'h2)] : $signed(reg51));
    end
  assign wire161 = wire1;
endmodule

module module69  (y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire73;
  input wire [(4'he):(1'h0)] wire72;
  input wire signed [(3'h7):(1'h0)] wire71;
  input wire [(4'hd):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire154;
  wire signed [(4'hd):(1'h0)] wire142;
  wire signed [(4'hd):(1'h0)] wire141;
  wire signed [(3'h4):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire138;
  wire signed [(2'h3):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire118;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire74;
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(3'h5):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg [(4'hc):(1'h0)] reg146 = (1'h0);
  reg [(3'h6):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg133 = (1'h0);
  reg [(4'hb):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  assign y = {wire154,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire118,
                 wire75,
                 wire74,
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
                 (1'h0)};
  assign wire74 = (wire73[(3'h5):(2'h2)] ?
                      wire70[(2'h2):(1'h1)] : wire70[(3'h4):(2'h2)]);
  assign wire75 = {wire74[(1'h0):(1'h0)]};
  module76 #() modinst119 (wire118, clk, wire74, wire72, wire73, wire75);
  always
    @(posedge clk) begin
      reg120 <= $unsigned($unsigned(((((7'h43) & wire74) * $unsigned(wire71)) ?
          ((wire71 - wire73) ? (wire73 & wire72) : $signed(wire71)) : wire75)));
      reg121 <= (!$unsigned(((-wire73[(5'h13):(4'hd)]) ?
          (|$unsigned(wire75)) : {(&wire118), (reg120 ? wire73 : wire72)})));
    end
  always
    @(posedge clk) begin
      reg122 <= $signed($signed((((wire70 ? wire70 : (8'hb0)) ?
              $signed(wire118) : (8'hb1)) ?
          ($unsigned(wire75) >> (wire74 <<< wire70)) : $unsigned(wire73))));
      reg123 <= wire74[(1'h1):(1'h0)];
      reg124 <= {reg122};
      reg125 <= {$signed((((^~wire71) - (reg121 && reg123)) ?
              reg123[(4'hd):(4'h8)] : $unsigned(reg120)))};
    end
  always
    @(posedge clk) begin
      if ((~^wire72[(4'h9):(2'h2)]))
        begin
          reg126 <= (&(+wire71[(3'h6):(3'h6)]));
          reg127 <= (reg121 != $signed(((^$signed(reg123)) | reg126[(4'hb):(3'h6)])));
          reg128 <= (~(+(!($unsigned(wire118) ?
              (wire75 <= wire73) : $signed(reg126)))));
        end
      else
        begin
          reg126 <= {({($unsigned((8'hae)) ?
                          $signed(wire118) : $signed((8'haf))),
                      (reg126[(3'h5):(3'h4)] ?
                          (wire73 ~^ (8'hb4)) : {wire75})} ?
                  $signed({wire75,
                      (reg125 * reg128)}) : $signed((~^$signed(wire72))))};
          reg127 <= (reg127 || reg125);
          reg128 <= reg128[(4'hf):(3'h6)];
        end
      if (($signed($unsigned(reg122[(1'h1):(1'h1)])) ?
          ((8'hae) ^ $unsigned(reg120)) : reg127))
        begin
          reg129 <= (reg123 ?
              $signed((((wire118 ?
                  wire72 : reg123) >>> reg124) ^~ (reg121 * $signed(reg124)))) : (reg124[(1'h0):(1'h0)] > wire73[(4'h9):(1'h0)]));
          if (wire73[(5'h12):(4'he)])
            begin
              reg130 <= wire72;
              reg131 <= ($unsigned(reg125) ?
                  $unsigned((&reg123)) : $signed((~^(reg130 ?
                      (-wire118) : (reg122 ? reg125 : (8'hae))))));
            end
          else
            begin
              reg130 <= $signed(((reg129 != reg126) ?
                  ($signed($signed(reg125)) & reg127) : (((&reg128) ?
                      (reg122 ?
                          reg124 : (8'hb1)) : (+wire118)) >= $unsigned($signed(wire71)))));
              reg131 <= {$unsigned((((reg124 | reg129) ?
                      $unsigned((8'h9f)) : $signed(wire71)) ^~ ((reg131 ?
                      reg128 : reg124) ^~ $signed(reg128))))};
              reg132 <= ((&reg121[(3'h6):(3'h6)]) ?
                  $unsigned((^~((wire70 ^~ reg127) ^ {(8'hbb),
                      (8'hbe)}))) : $signed($unsigned((reg128[(4'hd):(4'ha)] | $signed(wire118)))));
            end
          reg133 <= reg122[(2'h2):(1'h0)];
        end
      else
        begin
          reg129 <= (($signed({wire73, reg126}) ?
                  (~wire74[(1'h0):(1'h0)]) : $unsigned((&$signed(reg133)))) ?
              wire75 : reg126);
          reg130 <= (wire75 ?
              $unsigned(reg122[(2'h3):(1'h1)]) : (((wire72[(3'h7):(1'h1)] ?
                          (reg128 ? reg122 : (8'hac)) : ((8'had) ?
                              (8'haf) : reg122)) ?
                      $unsigned((reg121 <<< reg126)) : wire75[(4'h8):(3'h7)]) ?
                  wire73[(4'he):(3'h4)] : $unsigned((|{reg121}))));
          reg131 <= {$signed(($signed(reg123[(4'he):(4'ha)]) || ((reg127 ?
                  wire118 : reg132) >> $unsigned(reg133))))};
        end
      reg134 <= reg130[(4'h8):(1'h0)];
      reg135 <= ({$unsigned({$unsigned(reg124)})} ?
          ((~({wire72, reg121} ?
              wire73 : (^~reg130))) & (~&$signed((wire75 ^ reg133)))) : ($unsigned((-$signed(wire74))) != ($signed(reg120) ?
              $unsigned($unsigned(reg127)) : reg121)));
    end
  assign wire136 = (((reg127 + (^(reg131 >>> reg120))) ^ (^~{(reg120 ?
                           reg132 : reg127)})) ^~ wire75[(4'h9):(3'h6)]);
  assign wire137 = $signed((~^(wire74[(1'h1):(1'h0)] ~^ $signed((8'ha8)))));
  assign wire138 = $unsigned({$unsigned((((8'ha9) <<< reg128) ~^ (^reg124))),
                       ($unsigned((reg124 + (8'h9c))) ?
                           {wire70[(4'h9):(3'h5)],
                               (reg133 && reg132)} : (((8'ha0) * (8'hb8)) - $signed(reg122)))});
  assign wire139 = ($signed({$signed({reg134})}) >= wire137);
  assign wire140 = $signed($signed((((reg121 >>> reg129) ?
                       ((8'hbe) ? reg122 : reg125) : {reg121,
                           reg122}) + {wire73[(4'hd):(4'h9)]})));
  assign wire141 = (&$unsigned((-reg123[(4'hb):(4'hb)])));
  assign wire142 = wire137;
  always
    @(posedge clk) begin
      reg143 <= (^(({(^reg123),
          {reg125}} <= reg124[(3'h6):(3'h4)]) ^ $unsigned(reg132[(1'h0):(1'h0)])));
      reg144 <= ((^~reg133[(4'hc):(4'h8)]) ?
          (wire139 ?
              reg126[(3'h7):(3'h4)] : (|$signed({reg128, reg126}))) : reg124);
      reg145 <= wire137[(2'h3):(2'h2)];
      if (reg143[(4'ha):(1'h0)])
        begin
          reg146 <= {($unsigned(reg143[(4'h8):(3'h7)]) < (($signed(wire73) ?
                      $unsigned(reg121) : $unsigned(reg134)) ?
                  $unsigned((wire140 == reg122)) : ({reg143, wire118} ?
                      $unsigned(reg120) : $signed(reg134)))),
              reg131[(4'h8):(2'h2)]};
          reg147 <= (~|(wire75 ?
              $signed((&{reg131,
                  (7'h44)})) : (reg146 - reg146[(2'h2):(1'h0)])));
        end
      else
        begin
          if (((reg143[(4'h9):(2'h3)] ?
                  $signed(({reg121, reg131} + ((8'ha5) < reg123))) : (wire140 ?
                      reg135[(4'hb):(4'ha)] : reg129)) ?
              ((+$unsigned(reg144)) ?
                  reg143[(3'h5):(3'h4)] : ((((8'hac) && reg131) ?
                      reg129[(4'hf):(3'h4)] : {reg120, wire140}) >> {(reg131 ?
                          reg123 : wire73),
                      $signed(reg120)})) : (|$signed($unsigned($unsigned(wire139))))))
            begin
              reg146 <= $signed((reg144[(5'h11):(4'he)] != $unsigned({(|reg143)})));
              reg147 <= (((({wire137} ? $signed(wire72) : reg129) ?
                  (|(reg145 ?
                      reg143 : wire118)) : reg128[(4'hd):(1'h1)]) || $unsigned(((8'hbe) ?
                  {reg147} : (wire136 ?
                      wire139 : wire70)))) ^ ($signed(reg146) > $signed(reg129)));
              reg148 <= wire74;
              reg149 <= $signed((|wire118[(1'h0):(1'h0)]));
              reg150 <= $signed((wire118[(2'h3):(1'h1)] ?
                  wire137[(1'h1):(1'h0)] : $unsigned(($signed(reg121) ?
                      (wire71 ? reg128 : reg133) : (wire70 << reg143)))));
            end
          else
            begin
              reg146 <= wire73[(4'hb):(2'h3)];
              reg147 <= wire138[(3'h4):(1'h1)];
              reg148 <= reg122;
            end
          reg151 <= (~|(-reg135));
          reg152 <= (8'hb1);
          reg153 <= wire142[(4'ha):(2'h3)];
        end
    end
  assign wire154 = ((8'hbc) ?
                       (~wire139) : $signed(({(reg153 ~^ wire137),
                               ((8'ha1) * wire75)} ?
                           ($signed(reg124) >> wire141[(3'h6):(2'h3)]) : reg146[(2'h2):(1'h0)])));
endmodule

module module56  (y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire60;
  input wire [(3'h5):(1'h0)] wire59;
  input wire [(4'hb):(1'h0)] wire58;
  input wire signed [(4'hc):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  assign y = {wire66, wire65, wire63, wire62, wire61, reg64, (1'h0)};
  assign wire61 = (8'hbc);
  assign wire62 = (^$signed({$signed(wire58)}));
  assign wire63 = $signed((8'h9f));
  always
    @(posedge clk) begin
      reg64 <= (-$signed(wire60));
    end
  assign wire65 = (($unsigned(wire59) <= (7'h40)) != (^~($signed((wire61 > wire57)) ?
                      (^$signed(wire61)) : (^(wire61 && wire61)))));
  assign wire66 = (8'had);
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire30;
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire30,
                 (1'h0)};
  assign wire11 = ((!(~^wire7)) != wire9[(4'hd):(3'h7)]);
  assign wire12 = (+((wire7 ?
                          (8'hba) : $unsigned(((7'h43) ? (8'ha8) : wire11))) ?
                      wire9 : (~&{wire8})));
  assign wire13 = $signed(wire8[(2'h3):(2'h2)]);
  assign wire14 = wire12;
  module15 #() modinst31 (.y(wire30), .wire17(wire12), .clk(clk), .wire16(wire9), .wire20(wire11), .wire19(wire13), .wire18(wire14));
  assign wire32 = ((~|(wire13 ^ {$unsigned(wire12)})) ^~ $signed((^~(^~wire7))));
  assign wire33 = wire9;
  assign wire34 = (~&(wire14[(5'h10):(4'hf)] & (+(-$unsigned(wire12)))));
  assign wire35 = wire13;
endmodule

module module15
#(parameter param28 = (!(+((((8'ha7) + (8'ha8)) <<< ((8'hb4) || (8'hb2))) * (((8'hb0) & (7'h40)) < {(8'hac), (8'hba)})))), 
parameter param29 = (({param28} != {(((8'ha5) ? (8'hbb) : param28) ? param28 : (!param28)), (^(param28 >>> (8'hbf)))}) ? (^((~^(param28 <= (8'ha8))) ? (~|(param28 ? (8'hb7) : param28)) : param28)) : (8'ha7)))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  assign y = {wire27, wire26, wire23, wire22, wire21, reg25, reg24, (1'h0)};
  assign wire21 = wire16;
  assign wire22 = $signed((wire18[(5'h10):(4'hf)] | (wire19[(1'h1):(1'h0)] && (~|{wire19}))));
  assign wire23 = $signed(wire18[(5'h11):(2'h2)]);
  always
    @(posedge clk) begin
      reg24 <= ($unsigned({($unsigned(wire21) ?
                  ((7'h41) ? wire18 : wire23) : wire16),
              wire22[(3'h6):(2'h2)]}) ?
          wire22 : (wire22[(3'h5):(2'h2)] ?
              (7'h43) : ((wire16 ? (^wire20) : (wire19 ? (8'h9f) : wire16)) ?
                  {wire23[(3'h5):(3'h5)],
                      wire17[(4'ha):(3'h6)]} : wire17[(2'h3):(2'h2)])));
      reg25 <= (~^(8'ha1));
    end
  assign wire26 = (wire18 * {(&{(~wire22)}), wire21[(3'h7):(1'h0)]});
  assign wire27 = wire17;
endmodule

module module76
#(parameter param116 = (|((7'h44) ? ({(+(8'haa)), ((8'haa) ? (8'hb6) : (8'haa))} ^~ ((~(7'h44)) ? (!(8'h9c)) : ((8'h9d) ^ (8'hb3)))) : (8'ha0))), 
parameter param117 = (((param116 - (^~{param116})) ? (param116 ? (((8'hb9) != param116) & param116) : ((8'ha6) ? (param116 ? param116 : param116) : (param116 >>> param116))) : {(8'hbd)}) ? (~&(^~((8'hac) ? (|param116) : {param116, param116}))) : {{({param116} < param116), ((param116 || (8'ha6)) ? (param116 && param116) : {param116})}, {param116, (((8'haf) && (7'h42)) >> (param116 << param116))}}))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire80;
  input wire signed [(4'he):(1'h0)] wire79;
  input wire [(5'h13):(1'h0)] wire78;
  input wire [(5'h15):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire99;
  wire signed [(4'ha):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
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
                 reg103,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg81 <= wire77[(3'h7):(2'h3)];
      if (($unsigned((~|reg81[(2'h2):(2'h2)])) ~^ (&(wire77 + ((wire79 ?
          reg81 : wire80) || (wire79 ^ wire78))))))
        begin
          if (wire77)
            begin
              reg82 <= $signed($unsigned(wire78));
              reg83 <= wire80;
              reg84 <= wire80;
            end
          else
            begin
              reg82 <= {$unsigned($signed((((8'ha8) ? reg84 : reg84) ?
                      wire79 : wire77[(5'h14):(4'h8)])))};
              reg83 <= $unsigned(((($signed((8'hb5)) >>> (&reg82)) ?
                      ($signed(wire77) == wire80[(1'h1):(1'h1)]) : reg82) ?
                  reg81 : (+({reg82, wire77} ? wire77 : (8'hae)))));
              reg84 <= ($unsigned((!{(|reg83)})) ?
                  wire80[(1'h0):(1'h0)] : (wire79 ?
                      $unsigned($signed((&(8'hb3)))) : ({(8'hb6),
                              $signed(wire79)} ?
                          reg82 : reg83[(2'h3):(2'h2)])));
              reg85 <= $signed((($unsigned({(8'ha1),
                  reg81}) ~^ ((wire79 <= reg82) ?
                  (reg84 | wire78) : {(7'h41)})) & (8'ha0)));
            end
          reg86 <= $signed(wire78);
          if ((8'hb0))
            begin
              reg87 <= (~^{(7'h40),
                  (((+reg81) || wire78[(5'h11):(3'h4)]) ?
                      reg82 : {reg83[(1'h1):(1'h0)]})});
              reg88 <= $signed($unsigned(reg85));
              reg89 <= (reg81[(4'ha):(3'h5)] + ((-(reg83[(4'h9):(2'h3)] || {reg85,
                  reg84})) || reg82[(1'h0):(1'h0)]));
              reg90 <= reg86;
            end
          else
            begin
              reg87 <= reg89[(4'ha):(1'h1)];
              reg88 <= reg83;
              reg89 <= $unsigned(reg81);
              reg90 <= reg86;
            end
          reg91 <= (!$unsigned($unsigned(reg88[(4'hb):(1'h1)])));
        end
      else
        begin
          reg82 <= $signed($unsigned((reg82[(1'h1):(1'h1)] ?
              ((reg86 ? reg91 : reg91) ?
                  $signed((8'haa)) : {wire78, reg84}) : ({reg83} ?
                  wire80 : $signed(reg84)))));
          if ((&($signed((~|reg91)) ?
              {(reg81[(1'h0):(1'h0)] ?
                      reg90 : {wire80, wire80})} : ({{wire77}} ?
                  (^$unsigned(reg86)) : {$signed(wire77)}))))
            begin
              reg83 <= ($unsigned(($signed(reg83) && (wire80[(1'h0):(1'h0)] ?
                      (~^reg85) : (^~reg84)))) ?
                  (~&(+{reg90})) : (&wire77[(4'ha):(3'h5)]));
              reg84 <= (7'h43);
              reg85 <= reg88;
            end
          else
            begin
              reg83 <= wire79[(4'hc):(2'h2)];
              reg84 <= {reg88[(5'h11):(5'h10)]};
              reg85 <= $signed(wire80);
            end
        end
      reg92 <= $unsigned($signed($unsigned(wire79[(2'h3):(2'h3)])));
      reg93 <= (~^(((((8'hbb) | reg89) ?
              wire80[(2'h2):(1'h1)] : reg85[(3'h6):(1'h0)]) << reg89) ?
          $signed(reg88[(3'h7):(2'h2)]) : (+wire79)));
    end
  always
    @(posedge clk) begin
      reg94 <= {({$signed($signed(reg90))} * $signed(wire77[(1'h0):(1'h0)]))};
      reg95 <= reg92[(2'h3):(1'h1)];
      reg96 <= {reg95, wire80[(2'h2):(1'h1)]};
    end
  assign wire97 = (~(~&reg85[(4'ha):(1'h1)]));
  assign wire98 = reg85[(1'h0):(1'h0)];
  assign wire99 = ($unsigned((+(~&$unsigned(reg96)))) ?
                      $unsigned(wire80[(2'h2):(2'h2)]) : (~^($signed((reg90 ~^ wire80)) ^ wire80[(2'h2):(1'h1)])));
  assign wire100 = (|reg92);
  assign wire101 = wire97[(3'h5):(2'h2)];
  assign wire102 = $signed((reg94[(2'h2):(2'h2)] >= wire77));
  always
    @(posedge clk) begin
      reg103 <= $signed(wire80[(1'h0):(1'h0)]);
      reg104 <= reg83;
    end
  always
    @(posedge clk) begin
      reg105 <= {reg95,
          ((8'hbe) ?
              (((wire102 ? (8'ha3) : wire97) ?
                  $unsigned(reg83) : wire101[(2'h2):(1'h0)]) >> reg96) : $signed(($unsigned(reg86) ^~ reg104)))};
      if (($signed((wire97 <= ($signed(wire98) >>> wire101[(2'h2):(2'h2)]))) && {{{(^wire78),
                  {wire78}},
              {(reg88 < reg81)}},
          (($signed(wire99) ?
                  reg105[(1'h0):(1'h0)] : (wire79 ? reg82 : reg93)) ?
              (+(^~reg93)) : $signed((reg94 ? reg95 : reg85)))}))
        begin
          reg106 <= reg92;
        end
      else
        begin
          reg106 <= ({reg89,
              {(^~(reg87 ? reg106 : reg90)),
                  $signed((^~reg82))}} == (($unsigned((!wire102)) ?
              reg92[(4'hf):(2'h3)] : (reg83[(4'h9):(3'h5)] | ((8'hbe) | wire77))) * ({{wire99,
                  reg96},
              reg83} >>> $signed({reg91, (7'h42)}))));
          reg107 <= $unsigned({reg92});
          reg108 <= $signed($unsigned(reg89[(1'h0):(1'h0)]));
          if (((8'hbb) && ($signed($unsigned(reg90[(2'h2):(1'h0)])) ^ reg94[(4'hc):(1'h1)])))
            begin
              reg109 <= reg95;
              reg110 <= wire102[(3'h6):(1'h0)];
            end
          else
            begin
              reg109 <= reg89[(4'h9):(1'h0)];
              reg110 <= (({wire101,
                      reg82[(3'h4):(1'h1)]} != $signed($unsigned((reg104 ~^ reg105)))) ?
                  $signed((+((~^wire100) * (^~reg107)))) : ((|$signed((reg108 ?
                      reg95 : reg103))) - wire99));
              reg111 <= $unsigned($signed($signed($signed(wire100[(4'he):(3'h4)]))));
              reg112 <= $unsigned($signed({((reg84 ? wire101 : wire101) ?
                      (!reg111) : {wire80, wire99}),
                  ($unsigned((8'had)) ? (reg109 && reg110) : (~^reg87))}));
            end
          reg113 <= reg82;
        end
      reg114 <= {reg93,
          $signed(($unsigned(reg107[(3'h4):(1'h0)]) <= ((reg81 ?
                  reg83 : wire101) ?
              $unsigned(wire98) : (wire78 > wire78))))};
      reg115 <= reg82[(1'h1):(1'h1)];
    end
endmodule
