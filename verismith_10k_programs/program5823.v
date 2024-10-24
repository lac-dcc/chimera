module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire193;
  wire [(2'h3):(1'h0)] wire192;
  wire signed [(3'h7):(1'h0)] wire190;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire190,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire12,
                 wire11,
                 wire7,
                 wire6,
                 wire5,
                 reg8,
                 reg9,
                 reg10,
                 reg13,
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
                 (1'h0)};
  assign wire5 = $unsigned($unsigned({wire3[(2'h3):(2'h3)],
                     $signed((wire0 ? (8'hb9) : wire1))}));
  assign wire6 = ((!$unsigned($unsigned((~|wire1)))) ?
                     $unsigned($signed({$unsigned(wire3)})) : wire1[(5'h13):(3'h5)]);
  assign wire7 = (8'h9d);
  always
    @(posedge clk) begin
      reg8 <= (wire3[(2'h3):(2'h2)] ?
          $unsigned(wire3[(2'h2):(1'h0)]) : (&{(wire1[(3'h5):(1'h1)] && wire3)}));
      reg9 <= (8'hb2);
      reg10 <= wire1[(2'h2):(1'h1)];
    end
  assign wire11 = {((|wire1) ?
                          $signed($unsigned(reg8)) : ($signed($signed(wire1)) ?
                              $signed({wire1}) : (~|$unsigned(reg10))))};
  assign wire12 = $unsigned($unsigned($signed($unsigned((wire11 * wire7)))));
  always
    @(posedge clk) begin
      reg13 <= $unsigned((&(8'hbc)));
    end
  assign wire14 = (^~wire0);
  assign wire15 = (8'h9c);
  assign wire16 = $signed($unsigned($signed($signed((reg13 ^~ wire4)))));
  assign wire17 = $signed(($unsigned((((8'hbb) >= wire12) - $unsigned(wire15))) ^ wire3[(3'h6):(3'h5)]));
  assign wire18 = wire16;
  always
    @(posedge clk) begin
      reg19 <= $signed((($unsigned(wire6[(2'h2):(2'h2)]) ?
          $signed((wire18 ^ reg9)) : ({wire2,
              wire17} && (reg10 - wire15))) << $signed((-(wire6 ~^ reg9)))));
      if ((&(reg13[(4'h9):(2'h2)] == $signed(wire17[(1'h1):(1'h0)]))))
        begin
          reg20 <= (wire11[(1'h0):(1'h0)] || ($signed({wire4,
              $signed(wire18)}) >>> (8'hb9)));
          reg21 <= $signed((((wire18[(2'h2):(1'h0)] ? (&reg10) : wire6) ?
                  wire14 : {$unsigned(wire3)}) ?
              reg19[(2'h3):(2'h3)] : (reg20[(3'h4):(2'h3)] ?
                  (wire6[(3'h7):(3'h6)] | $signed(wire17)) : {((8'hb2) ?
                          wire16 : wire6)})));
          reg22 <= (!$unsigned(reg10));
          reg23 <= (~^wire18);
        end
      else
        begin
          reg20 <= wire7;
          reg21 <= reg13;
        end
      if ((8'hba))
        begin
          reg24 <= $signed($signed(((~&wire0) ?
              $unsigned((-wire17)) : (wire3 ? wire4 : (+wire11)))));
          reg25 <= ((~^((&$signed(wire14)) ^~ ($unsigned(wire11) ?
              {wire7,
                  (8'hbf)} : (wire17 | reg24)))) & (~^(^$unsigned($signed(reg21)))));
          reg26 <= $signed($signed((7'h41)));
          reg27 <= {reg20};
          reg28 <= ({($signed((wire3 ? reg13 : wire6)) ? reg21 : wire16)} ?
              $unsigned((((~&reg8) ^ $unsigned(wire7)) >> (~^((8'ha3) ?
                  reg13 : wire4)))) : reg27[(2'h3):(2'h2)]);
        end
      else
        begin
          reg24 <= ((({(wire1 ?
                  wire7 : wire17)} & wire15[(3'h4):(3'h4)]) + (^~((wire3 | reg23) ?
              {(8'hbb)} : ((8'hb1) > reg21)))) || $unsigned(reg21));
          reg25 <= ($unsigned(wire0) ? $signed(wire17) : (-wire3));
          reg26 <= reg23[(2'h2):(1'h1)];
        end
      reg29 <= (^~$signed((~$unsigned(wire15))));
      reg30 <= $unsigned($signed($unsigned({$signed(wire3),
          reg22[(4'ha):(4'ha)]})));
    end
  assign wire31 = $signed((reg13 >> reg10));
  assign wire32 = ((((wire6[(2'h3):(1'h0)] ~^ (+wire12)) == wire6[(3'h7):(3'h6)]) || $signed(((wire16 == wire11) ?
                          (wire5 >>> (8'hbe)) : (reg13 < wire17)))) ?
                      $signed(($signed(reg21) < $unsigned((wire18 << wire11)))) : (8'ha1));
  assign wire33 = reg30;
  assign wire34 = (((|(~&{wire2})) ? (7'h44) : (~^$signed($unsigned(reg27)))) ?
                      ({$unsigned(reg26[(4'ha):(2'h2)])} ?
                          ((8'hb5) ?
                              wire17[(2'h2):(1'h1)] : wire1[(2'h2):(1'h0)]) : ((^(wire3 ?
                              reg22 : reg21)) & reg30)) : {(wire17 >= wire7)});
  assign wire35 = ((wire17 >>> wire34[(4'hc):(4'h8)]) ?
                      $unsigned(($unsigned(reg27) >>> reg8[(1'h1):(1'h0)])) : wire2);
  module36 #() modinst191 (wire190, clk, wire14, reg28, wire31, wire15, wire17);
  assign wire192 = wire5[(2'h2):(2'h2)];
  assign wire193 = reg22[(4'h8):(2'h3)];
endmodule

module module36
#(parameter param188 = ((^~(-((-(8'hb4)) <<< ((8'ha8) >> (8'ha8))))) ? (({((8'hae) ? (8'hac) : (8'hb1))} ? ((~|(8'h9c)) | ((8'hae) | (8'h9d))) : ((|(8'haf)) <= (~|(8'h9d)))) ? (((|(7'h40)) != ((8'ha1) >>> (8'ha6))) | ({(8'h9f), (8'hb3)} ~^ {(8'hb4)})) : (+((~|(8'ha5)) ? ((8'hbf) ? (8'hbf) : (7'h42)) : {(8'hb8), (8'ha3)}))) : (({((8'hbe) ? (8'ha3) : (8'haf)), ((8'hb7) ? (8'h9d) : (8'hb8))} ? (((8'hb1) ? (8'ha4) : (8'hb7)) ? (!(8'hbd)) : (~^(8'hb8))) : {((8'hbe) ? (7'h43) : (8'hbd)), ((8'hb0) >= (8'hb5))}) > (~^(^~{(8'hae)})))), 
parameter param189 = param188)
(y, clk, wire37, wire38, wire39, wire40, wire41);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire37;
  input wire [(4'hd):(1'h0)] wire38;
  input wire signed [(5'h11):(1'h0)] wire39;
  input wire signed [(5'h14):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire187;
  wire [(3'h7):(1'h0)] wire186;
  wire [(3'h4):(1'h0)] wire185;
  wire signed [(2'h3):(1'h0)] wire184;
  wire signed [(4'hb):(1'h0)] wire183;
  wire signed [(3'h4):(1'h0)] wire181;
  wire signed [(5'h10):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire113;
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire181,
                 wire42,
                 wire43,
                 wire85,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire93,
                 wire113,
                 reg92,
                 (1'h0)};
  assign wire42 = (8'hbd);
  assign wire43 = ((~&$signed(((-wire37) ^ wire40[(5'h14):(4'he)]))) << $signed((~(!{wire37}))));
  module44 #() modinst86 (.y(wire85), .clk(clk), .wire47(wire42), .wire45(wire37), .wire46(wire39), .wire48(wire40));
  assign wire87 = (^~(((^(wire37 != wire40)) == ($unsigned(wire85) ?
                          (wire43 ? wire40 : wire43) : (wire38 ?
                              wire42 : (8'hac)))) ?
                      wire41[(5'h10):(3'h7)] : wire42));
  assign wire88 = $unsigned((8'ha8));
  assign wire89 = wire87;
  assign wire90 = (((8'hb0) && {$unsigned($unsigned(wire39))}) ?
                      ($signed(wire88) ? (&wire39) : (|(~|wire40))) : wire37);
  assign wire91 = ((~&$signed(((wire85 != wire41) << wire41))) ?
                      wire41[(5'h12):(5'h11)] : wire89);
  always
    @(posedge clk) begin
      reg92 <= {$unsigned((wire85[(2'h2):(1'h1)] ?
              ($unsigned(wire42) ? wire91 : wire42) : wire90[(2'h2):(1'h1)])),
          (~(~|((~wire85) || (wire38 ? wire90 : (8'h9e)))))};
    end
  assign wire93 = wire40;
  module94 #() modinst114 (.clk(clk), .wire97(wire43), .y(wire113), .wire95(reg92), .wire96(wire88), .wire98(wire39));
  module115 #() modinst182 (.clk(clk), .wire119(wire91), .y(wire181), .wire117(wire88), .wire116(wire113), .wire118(wire93));
  assign wire183 = ({(wire39[(3'h7):(2'h3)] & (wire38 ?
                               (~&wire89) : $signed(wire38))),
                           ($signed(wire113[(2'h2):(1'h0)]) ?
                               wire43 : $unsigned($unsigned(wire43)))} ?
                       wire87[(2'h2):(2'h2)] : ($unsigned($signed(wire181[(2'h2):(1'h0)])) >> ((+(&wire89)) & wire87)));
  assign wire184 = {$unsigned($unsigned(wire181)), wire93[(1'h0):(1'h0)]};
  assign wire185 = wire43;
  assign wire186 = wire41[(3'h7):(3'h7)];
  assign wire187 = (((~^wire181) - wire91[(4'he):(4'h8)]) * wire185[(1'h1):(1'h1)]);
endmodule

module module115  (y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'h2f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire119;
  input wire signed [(3'h6):(1'h0)] wire118;
  input wire signed [(5'h14):(1'h0)] wire117;
  input wire [(3'h6):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire177;
  wire [(5'h10):(1'h0)] wire152;
  wire [(5'h12):(1'h0)] wire151;
  wire [(2'h2):(1'h0)] wire150;
  wire [(5'h13):(1'h0)] wire144;
  wire signed [(4'h8):(1'h0)] wire142;
  wire [(2'h3):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire140;
  wire signed [(3'h7):(1'h0)] wire139;
  wire signed [(5'h13):(1'h0)] wire138;
  wire signed [(2'h3):(1'h0)] wire137;
  wire signed [(5'h11):(1'h0)] wire136;
  wire [(5'h10):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire120;
  reg [(5'h10):(1'h0)] reg179 = (1'h0);
  reg [(4'hc):(1'h0)] reg178 = (1'h0);
  reg [(4'h8):(1'h0)] reg176 = (1'h0);
  reg [(5'h11):(1'h0)] reg175 = (1'h0);
  reg [(5'h12):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg167 = (1'h0);
  reg signed [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg signed [(4'he):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(5'h11):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  assign y = {wire180,
                 wire177,
                 wire152,
                 wire151,
                 wire150,
                 wire144,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire120,
                 reg179,
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
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg143,
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
                 (1'h0)};
  assign wire120 = wire118;
  always
    @(posedge clk) begin
      reg121 <= wire116;
      reg122 <= (wire116 ?
          (!{$unsigned($signed(reg121)),
              $unsigned((~&(8'hae)))}) : ($signed(((wire119 != reg121) ?
                  $unsigned(wire120) : (~&wire118))) ?
              (wire119 ?
                  (((8'ha6) && (7'h44)) != ((8'ha4) < (8'ha8))) : $signed(wire116)) : ((&(^(8'hbe))) == ((8'hba) ?
                  (wire118 ? wire119 : reg121) : wire117))));
      if ((8'hb3))
        begin
          reg123 <= $unsigned(((8'hbf) ?
              $unsigned(({(8'h9f)} <<< wire116)) : (($unsigned(reg122) >= (~|reg122)) ?
                  wire120 : {(wire117 & wire119)})));
          if ($unsigned({(reg121 ? $unsigned(wire118) : (~^(wire120 < reg122))),
              wire120[(2'h2):(1'h1)]}))
            begin
              reg124 <= (wire118 ?
                  {(reg121 ?
                          wire119[(2'h2):(1'h0)] : $unsigned(wire117[(3'h5):(2'h2)]))} : $unsigned(wire117[(3'h7):(1'h0)]));
              reg125 <= reg122[(1'h0):(1'h0)];
              reg126 <= (wire120[(4'hb):(4'ha)] ?
                  reg124[(2'h3):(2'h2)] : $unsigned($signed($signed($unsigned(reg125)))));
              reg127 <= {$unsigned(reg123)};
              reg128 <= (reg122 ^ (~|(reg127 ?
                  (~|{reg121, wire118}) : $signed($signed(reg124)))));
            end
          else
            begin
              reg124 <= (wire117 != {reg121[(3'h6):(2'h3)]});
            end
          reg129 <= $unsigned($unsigned(wire118));
          if ((reg122 < ($unsigned(((wire118 != wire118) ?
                  wire118[(2'h2):(1'h1)] : $unsigned(wire119))) ?
              (8'hb4) : (((reg129 != reg124) == (reg127 ?
                  reg124 : reg126)) << ({reg127, wire119} ?
                  {reg125} : {wire118})))))
            begin
              reg130 <= ((({$unsigned(wire118)} - $signed({reg126})) ?
                      reg126 : wire116[(1'h0):(1'h0)]) ?
                  wire120 : $unsigned({$unsigned({reg129, reg125}),
                      $signed((^reg126))}));
              reg131 <= wire119;
            end
          else
            begin
              reg130 <= ($signed(((^~((8'h9f) ?
                  reg130 : reg128)) ~^ (+$signed(wire120)))) << reg122);
              reg131 <= reg130[(1'h0):(1'h0)];
              reg132 <= (+(((8'hb7) ?
                      (|$signed(wire119)) : (~$unsigned(reg121))) ?
                  $signed($unsigned($unsigned(reg128))) : reg125));
            end
        end
      else
        begin
          reg123 <= ((^~$signed((wire116 ?
              (reg127 ? wire120 : reg128) : $signed(reg122)))) ^ reg124);
          reg124 <= ((reg131 >> ((reg127 && {reg131, (7'h43)}) ?
              ({reg128, wire119} ?
                  wire120 : {reg128,
                      wire117}) : ($unsigned((8'hab)) * $unsigned((8'hac))))) < ((({(8'ha1)} ?
              $unsigned(wire116) : $unsigned((8'h9f))) ^~ $signed(((7'h43) ?
              (8'h9d) : (8'hae)))) >>> (+$unsigned(reg131[(3'h5):(1'h1)]))));
          reg125 <= ($signed((&wire119)) && (($unsigned((reg125 && (8'hb1))) > ((wire116 ?
              wire118 : reg121) ^ (~|reg124))) ~^ (-((reg130 != wire116) ?
              {reg130, (8'ha0)} : $signed(wire118)))));
        end
      reg133 <= {$unsigned(reg126)};
      reg134 <= ($unsigned(wire118[(1'h1):(1'h1)]) * $unsigned(wire118[(2'h2):(2'h2)]));
    end
  assign wire135 = $signed($signed((~((+wire117) < (reg132 ^ (8'ha1))))));
  assign wire136 = (((wire117 || $signed($unsigned(wire118))) - (reg125 ~^ ((+wire116) ?
                           (~&reg134) : {reg125}))) ?
                       (($signed(((8'hbd) <<< (8'hbf))) ?
                               (^wire120) : (reg130 < (wire135 >= reg125))) ?
                           (8'had) : $signed((^(reg127 || wire116)))) : $unsigned(($unsigned((reg126 ~^ reg123)) ?
                           {reg123} : $signed((wire135 ? (7'h41) : reg131)))));
  assign wire137 = (~&$unsigned((reg121 ?
                       ($unsigned(reg127) ~^ $signed((8'hb8))) : (reg123 ?
                           $signed(reg133) : (reg132 ~^ wire118)))));
  assign wire138 = reg131;
  assign wire139 = ((((wire137[(2'h2):(1'h0)] ?
                               $unsigned(wire117) : (&(8'hab))) ?
                           (8'ha0) : reg128[(3'h7):(3'h6)]) ?
                       wire136[(2'h2):(2'h2)] : (~|((reg134 ?
                               wire137 : wire117) ?
                           reg131 : (reg127 ?
                               wire136 : wire119)))) > {wire116[(3'h5):(3'h5)]});
  assign wire140 = ((({{reg123, (8'ha5)}} ?
                           ((wire135 - (8'hbf)) <<< reg123) : (8'ha5)) ?
                       {reg124} : $unsigned(((wire120 ? reg125 : reg125) ?
                           (~reg130) : reg132))) >= $signed(($signed((wire116 ?
                           reg127 : reg123)) ?
                       {wire117} : (8'ha6))));
  assign wire141 = ($signed(wire118[(3'h5):(2'h2)]) ?
                       (wire117[(3'h7):(2'h2)] ?
                           reg125 : $unsigned(((wire118 ? (8'haa) : wire135) ?
                               reg133 : {(8'hb4)}))) : reg126);
  assign wire142 = $unsigned($signed(($unsigned({reg128}) ?
                       ($signed(wire139) ?
                           ((8'ha8) == wire119) : wire139) : reg127)));
  always
    @(posedge clk) begin
      reg143 <= (+$signed($unsigned($unsigned(reg132[(5'h12):(4'hc)]))));
    end
  assign wire144 = ({reg122} + reg127);
  always
    @(posedge clk) begin
      reg145 <= $signed((((&reg124) > {{wire119, (8'h9f)}, {reg130}}) ?
          wire118 : (8'ha7)));
      reg146 <= reg134;
      reg147 <= $unsigned(wire120[(2'h3):(2'h3)]);
      reg148 <= wire138[(5'h13):(5'h11)];
      reg149 <= $signed((((|$signed(reg129)) ?
          (~^(wire120 ? reg147 : (8'hbe))) : $signed(reg121)) || reg130));
    end
  assign wire150 = ($unsigned(wire138) ?
                       wire142[(1'h0):(1'h0)] : (~&$signed((reg123[(4'ha):(3'h4)] ?
                           {(8'hb4), wire138} : (&wire135)))));
  assign wire151 = (({({reg124} & (8'hb9)), wire136[(3'h5):(3'h5)]} ?
                           $unsigned((^~(reg143 ?
                               reg133 : reg146))) : reg127[(3'h5):(1'h0)]) ?
                       ((reg133[(4'h8):(2'h2)] << (!{reg129})) ?
                           (~^(^(~^wire116))) : (+($unsigned((8'ha2)) ?
                               wire118 : reg143))) : (reg134 ^ (((^~reg121) ?
                               (^~reg127) : (wire118 ? wire144 : wire137)) ?
                           reg148 : (8'hac))));
  assign wire152 = reg131;
  always
    @(posedge clk) begin
      if ($signed(((~|($signed(wire119) * reg147)) ? (!reg123) : reg127)))
        begin
          if ({(((reg127[(1'h1):(1'h0)] ? $unsigned(wire144) : (~|wire138)) ?
                  (|wire140[(5'h15):(3'h6)]) : reg126[(1'h1):(1'h0)]) + wire142),
              wire140})
            begin
              reg153 <= reg121;
              reg154 <= ((+$unsigned(reg128)) ?
                  $unsigned($signed((~&wire136))) : ($unsigned((&$signed(reg128))) | $unsigned({$unsigned(wire150)})));
            end
          else
            begin
              reg153 <= reg149;
              reg154 <= wire142[(3'h4):(3'h4)];
              reg155 <= {{$unsigned($unsigned(reg122))}};
            end
        end
      else
        begin
          if (((~^wire141) ?
              reg145[(3'h6):(1'h1)] : $unsigned((^~((~&(8'hbf)) ?
                  (reg127 && (8'haa)) : (^(8'hbe)))))))
            begin
              reg153 <= $signed(({reg122[(3'h6):(2'h2)],
                      {wire142[(2'h3):(2'h2)], ((7'h43) == reg131)}} ?
                  wire142[(3'h6):(3'h4)] : wire139[(1'h0):(1'h0)]));
              reg154 <= (8'ha2);
              reg155 <= reg134;
            end
          else
            begin
              reg153 <= $signed($signed((reg148[(5'h15):(3'h6)] ?
                  reg155 : wire152)));
              reg154 <= (reg130 ?
                  {($unsigned(wire137[(2'h2):(1'h0)]) <<< ($unsigned(reg133) != $unsigned(wire135))),
                      $unsigned((wire137[(2'h3):(1'h1)] ?
                          (reg145 ?
                              wire151 : wire139) : (wire150 <= reg129)))} : wire144);
              reg155 <= wire144;
              reg156 <= wire138;
              reg157 <= ($signed(reg130) >>> (~$unsigned(((+reg154) * $signed(reg125)))));
            end
          reg158 <= $unsigned(reg130);
        end
      if (({$unsigned(reg147),
          (-$unsigned(reg129[(4'hd):(1'h0)]))} << ((((reg132 - reg157) ^ (^reg143)) >>> (|reg122)) ?
          {reg158[(3'h7):(2'h2)]} : wire141)))
        begin
          reg159 <= wire139[(2'h2):(1'h0)];
          reg160 <= reg129[(3'h4):(1'h1)];
          reg161 <= $unsigned($signed((|(-$signed(wire144)))));
        end
      else
        begin
          if (reg161[(1'h1):(1'h0)])
            begin
              reg159 <= wire151[(4'hb):(3'h6)];
            end
          else
            begin
              reg159 <= ($unsigned(wire117[(3'h5):(2'h2)]) ?
                  ($unsigned(($unsigned((8'ha7)) * wire120)) << reg155) : $signed(($signed(wire116[(1'h0):(1'h0)]) ?
                      (&(reg130 ?
                          reg158 : reg158)) : $unsigned(reg143[(4'he):(4'h9)]))));
            end
          if (reg147[(5'h13):(5'h12)])
            begin
              reg160 <= reg154;
              reg161 <= ($signed((~|($unsigned(wire152) || wire117))) <<< ($unsigned(reg128) <= ({$unsigned(reg131)} != reg156[(4'h8):(1'h1)])));
              reg162 <= $unsigned($signed(((reg154[(2'h3):(2'h3)] >= ((8'ha1) ?
                  wire118 : (8'hb9))) >= (reg132[(5'h10):(4'hc)] ?
                  $signed(reg121) : {wire117, reg132}))));
              reg163 <= $unsigned(((~^reg162) ?
                  {wire117, ($signed(reg155) * reg121)} : reg161));
            end
          else
            begin
              reg160 <= (8'hb0);
              reg161 <= (~$unsigned($signed(wire150[(1'h0):(1'h0)])));
            end
          reg164 <= ((+($signed(wire138) ?
                  $signed($unsigned(wire135)) : {$signed((8'had))})) ?
              (~|({(wire138 ? reg156 : wire152), ((7'h41) >>> wire142)} ?
                  $signed($signed(reg123)) : ({wire150} ?
                      reg162 : reg123[(4'h8):(3'h5)]))) : (&(($unsigned(reg153) > reg145) >= (~|(reg123 > reg133)))));
          reg165 <= $unsigned($signed($signed($signed($unsigned(reg153)))));
          reg166 <= (wire151 << {(reg161[(2'h2):(2'h2)] ?
                  $unsigned(reg147) : {reg143[(2'h2):(2'h2)], reg127})});
        end
      reg167 <= ((!$signed((|$signed(wire136)))) ?
          wire139[(3'h5):(3'h4)] : $unsigned(wire150[(1'h0):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg168 <= {(reg131[(1'h1):(1'h0)] && (+reg131)), reg158[(4'h8):(3'h5)]};
      if (reg147[(2'h3):(2'h2)])
        begin
          if ($unsigned(($signed(reg125[(3'h7):(1'h1)]) || {(((8'hb0) ?
                  (8'hba) : (8'ha6)) * $unsigned(reg163))})))
            begin
              reg169 <= {($unsigned((wire116[(2'h3):(2'h2)] - (reg153 != reg127))) & reg132[(1'h1):(1'h0)]),
                  $unsigned(reg143[(4'hb):(2'h2)])};
              reg170 <= (({(reg123[(4'hd):(3'h6)] >> $unsigned(wire144)),
                      {((8'hbe) >> wire151)}} ?
                  $unsigned(reg123) : reg134) + $signed($signed($signed((reg167 & wire119)))));
              reg171 <= wire136[(2'h3):(1'h1)];
              reg172 <= (!$signed((!$unsigned(reg121[(4'h9):(4'h9)]))));
            end
          else
            begin
              reg169 <= wire142[(3'h7):(3'h6)];
              reg170 <= $signed(reg166[(4'h9):(4'h9)]);
              reg171 <= reg127;
              reg172 <= $signed($unsigned((((wire116 ? (7'h41) : wire137) ?
                      (reg160 >= reg167) : {(8'h9c), reg156}) ?
                  (wire135[(4'hf):(3'h4)] ?
                      reg167 : reg154[(3'h4):(3'h4)]) : reg148[(4'hf):(4'hd)])));
            end
        end
      else
        begin
          if ((!({reg155[(1'h0):(1'h0)]} ^~ $unsigned((^$unsigned(wire138))))))
            begin
              reg169 <= reg164;
              reg170 <= reg146;
              reg171 <= ($unsigned((((reg132 ?
                      reg155 : wire144) ^ (reg154 ^~ reg146)) < reg127[(2'h2):(1'h0)])) ?
                  reg134 : {$signed((8'ha7)), (|$signed($signed(reg168)))});
              reg172 <= ($unsigned((!$signed(reg127))) ?
                  ($unsigned($unsigned(reg159)) ?
                      {($unsigned(wire150) - (!wire144)),
                          ((wire116 ? wire137 : reg133) ?
                              $signed(reg167) : reg146[(3'h6):(3'h4)])} : wire120) : $unsigned(((~^$unsigned(reg124)) ~^ reg159)));
              reg173 <= $signed((8'hb2));
            end
          else
            begin
              reg169 <= $unsigned((wire135[(4'hf):(4'hc)] ?
                  (((8'h9e) >= {reg133,
                      reg157}) + wire151[(1'h0):(1'h0)]) : wire116[(2'h3):(1'h1)]));
            end
          reg174 <= wire135[(4'ha):(4'h8)];
          if (((^~($signed((reg153 << reg123)) & ((~reg145) ?
              (wire120 & wire141) : wire136[(4'hc):(4'hc)]))) || wire118[(2'h3):(2'h3)]))
            begin
              reg175 <= wire138;
            end
          else
            begin
              reg175 <= (((~|($signed(reg161) < $signed(wire150))) ?
                      (&$signed(reg122)) : (|$unsigned(wire142[(1'h0):(1'h0)]))) ?
                  $signed(reg134) : $signed((~reg146)));
              reg176 <= (((|(reg147[(3'h5):(1'h0)] | reg148)) - $signed((+(&reg165)))) ~^ (reg161 ?
                  {({wire142, reg125} >> (8'ha5)),
                      (wire136[(3'h7):(3'h7)] ?
                          reg127[(3'h7):(3'h6)] : (|reg148))} : $unsigned((reg155 ?
                      $unsigned(reg123) : reg148))));
            end
        end
    end
  assign wire177 = ((reg158[(3'h7):(3'h7)] << {reg174[(4'h8):(3'h7)]}) ~^ wire137[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg178 <= $signed(reg174[(4'h8):(1'h1)]);
      reg179 <= wire138[(5'h12):(5'h10)];
    end
  assign wire180 = (reg172 ?
                       $unsigned(reg165) : (wire144[(5'h13):(5'h11)] ?
                           reg158[(3'h5):(1'h1)] : ((reg124 == $signed((8'hb3))) ?
                               (|$unsigned(reg155)) : ($unsigned(wire137) << (&wire177)))));
endmodule

module module94  (y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire98;
  input wire [(4'hf):(1'h0)] wire97;
  input wire signed [(5'h15):(1'h0)] wire96;
  input wire signed [(4'h8):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire104;
  wire signed [(3'h6):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire signed [(3'h4):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire99;
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
                 wire100,
                 wire99,
                 (1'h0)};
  assign wire99 = ($unsigned(wire97) ?
                      $unsigned($signed($unsigned(wire96))) : wire97);
  assign wire100 = (^(|$unsigned((~^(wire99 == wire95)))));
  assign wire101 = {($unsigned((wire97[(2'h2):(1'h0)] ?
                               (+wire99) : (wire99 << (8'hb8)))) ?
                           $unsigned(($signed(wire100) ?
                               (wire100 + wire99) : (wire100 ?
                                   (7'h42) : wire96))) : {$signed((-wire99))})};
  assign wire102 = (|(wire101 > (^~{(wire96 - wire97)})));
  assign wire103 = $signed(wire102[(1'h1):(1'h1)]);
  assign wire104 = ($unsigned($unsigned($signed((wire96 ? wire98 : wire100)))) ?
                       (8'hbf) : $signed(wire101[(2'h2):(1'h0)]));
  assign wire105 = (~wire98);
  assign wire106 = $unsigned((&(~^(-wire105))));
  assign wire107 = (~&wire98[(3'h6):(1'h0)]);
  assign wire108 = (~&(^$signed(((+wire95) >> $signed(wire99)))));
  assign wire109 = (wire103[(1'h1):(1'h0)] ?
                       wire105 : ($unsigned($signed($signed(wire103))) - wire100[(1'h0):(1'h0)]));
  assign wire110 = {(wire101[(3'h7):(2'h3)] ~^ {(+$unsigned(wire101))})};
  assign wire111 = (!$signed((~$unsigned({wire110, wire103}))));
  assign wire112 = wire97;
endmodule

module module44
#(parameter param83 = (({{{(8'hb6)}, ((8'hb6) ? (8'hb4) : (8'hac))}, {((8'hb1) >= (8'hb9)), (&(8'hac))}} ? ((((8'ha6) ? (8'hbe) : (8'hb7)) > ((8'hb6) <<< (8'h9c))) == (~^{(8'hb2)})) : {(^~((8'hb0) <= (8'ha5)))}) ? ((((!(8'ha6)) ? (!(8'hbe)) : ((8'hb9) ~^ (8'ha7))) ? {{(7'h41)}, ((8'h9f) ? (8'hae) : (8'ha6))} : (~&((8'hb8) << (8'haa)))) ? (~^{(&(8'ha8)), ((8'hab) ? (8'hb5) : (8'ha0))}) : {({(8'hae)} ? {(8'had)} : ((8'hbf) > (8'ha0))), (~^((8'ha8) ? (8'h9f) : (8'hbc)))}) : {(~&(((8'h9c) ? (8'ha0) : (8'hba)) ^ ((8'ha2) || (8'hba))))}), 
parameter param84 = (-((param83 ? {(~param83), (-(8'had))} : param83) ~^ ((^(param83 + param83)) ? param83 : ((&(8'hb3)) ? (param83 ~^ param83) : param83)))))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire48;
  input wire signed [(3'h4):(1'h0)] wire47;
  input wire signed [(5'h10):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg79,
                 reg78,
                 reg77,
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
                 (1'h0)};
  assign wire49 = $unsigned(($signed((~|{wire46})) ?
                      wire48 : wire48[(4'hb):(3'h4)]));
  assign wire50 = ($unsigned(wire48[(4'ha):(2'h2)]) ?
                      (wire49 ?
                          {$signed((wire48 ?
                                  (8'hbd) : wire48))} : $signed((wire46[(3'h6):(2'h3)] <<< wire49))) : (+$signed(($signed(wire49) || (wire49 | wire48)))));
  assign wire51 = wire45[(3'h7):(1'h1)];
  assign wire52 = (|$unsigned($signed($unsigned((7'h42)))));
  assign wire53 = wire51[(3'h7):(2'h3)];
  assign wire54 = $signed(wire45);
  always
    @(posedge clk) begin
      reg55 <= wire51;
      if ({((((~^wire53) & $unsigned(wire51)) >= (^~wire49[(4'ha):(1'h1)])) ?
              wire47 : wire53[(1'h1):(1'h1)]),
          $signed(((wire50 ?
              (wire53 ? wire49 : wire46) : (wire51 ?
                  (8'hac) : wire48)) & {((8'ha2) ? (8'hab) : wire47)}))})
        begin
          reg56 <= $signed((({$unsigned(wire54),
              wire48} >> reg55) + reg55[(4'h8):(1'h1)]));
        end
      else
        begin
          reg56 <= (|(($signed((wire50 + wire51)) ?
              wire48[(4'ha):(3'h5)] : (wire46[(3'h5):(2'h2)] ?
                  wire45 : (wire45 ? wire46 : wire54))) != wire51));
          reg57 <= (wire48[(1'h0):(1'h0)] ?
              (^~$unsigned($signed(wire46))) : ((wire50 == $signed((&reg55))) ?
                  $signed((!wire47)) : (wire50[(5'h11):(3'h5)] ?
                      $unsigned((&wire47)) : ((reg56 ? wire45 : (8'hb1)) ?
                          (wire52 <= reg55) : (wire47 ? reg56 : wire50)))));
          if (wire52)
            begin
              reg58 <= $signed(($unsigned({$unsigned(wire49),
                      wire53[(4'h8):(3'h4)]}) ?
                  ($unsigned($signed(wire45)) <<< (wire50[(4'hc):(2'h2)] < $unsigned(reg57))) : reg57));
              reg59 <= wire53[(4'ha):(1'h0)];
              reg60 <= $unsigned((-(-(reg55 << (wire51 ~^ reg57)))));
              reg61 <= $signed($unsigned(wire54));
              reg62 <= {(8'ha3), $signed($signed(wire53[(4'hb):(1'h1)]))};
            end
          else
            begin
              reg58 <= ({(|$signed((-(8'hb5))))} ?
                  ((reg57[(1'h1):(1'h1)] < wire52) ?
                      ($unsigned((reg57 ~^ wire51)) ?
                          $unsigned($unsigned(reg59)) : reg59[(3'h5):(2'h3)]) : $unsigned(({reg62,
                          wire48} <<< reg55))) : reg61[(2'h3):(1'h0)]);
              reg59 <= (8'ha0);
              reg60 <= (((wire51 != (~^{reg61})) ?
                  $unsigned({(wire51 ?
                          reg59 : reg60)}) : (wire54 >= $signed((!(8'hb1))))) && (^wire52));
            end
          if ((reg59 ? reg61 : wire50))
            begin
              reg63 <= wire52;
              reg64 <= wire53[(5'h11):(5'h11)];
              reg65 <= reg59[(3'h4):(1'h0)];
              reg66 <= (reg63[(1'h1):(1'h0)] ?
                  {reg56, reg59[(3'h5):(3'h5)]} : {wire50[(3'h6):(3'h6)],
                      {({wire46} ?
                              (reg65 ? reg60 : reg58) : (wire47 << wire48))}});
              reg67 <= $signed(((reg61 ?
                  reg62[(1'h0):(1'h0)] : ($signed(reg55) ?
                      wire48 : (^~wire53))) | wire45));
            end
          else
            begin
              reg63 <= {($unsigned($signed($signed(reg58))) ^~ ($unsigned(reg62) ?
                      $signed((reg67 ?
                          reg60 : wire52)) : $signed(reg63[(2'h3):(2'h3)]))),
                  wire52};
              reg64 <= reg59[(1'h0):(1'h0)];
              reg65 <= (reg57[(3'h4):(1'h0)] && (+{{$signed(wire46)},
                  wire45[(1'h0):(1'h0)]}));
              reg66 <= {$unsigned({reg55})};
            end
        end
    end
  assign wire68 = $signed({(^((~wire50) <<< (reg62 ? wire47 : wire54))),
                      (+(~{(8'ha3), wire45}))});
  assign wire69 = (reg65 && {(~^$unsigned((wire68 ? reg56 : reg63))),
                      $signed(reg64)});
  assign wire70 = wire50[(2'h2):(2'h2)];
  assign wire71 = wire47;
  assign wire72 = ((8'hb5) ?
                      {((-reg66[(4'hf):(3'h5)]) * ((8'ha5) ?
                              (wire54 ? reg58 : (8'hb6)) : (~&reg57))),
                          $unsigned({{wire70},
                              $unsigned(wire54)})} : $unsigned((^~{reg67[(2'h2):(1'h1)]})));
  assign wire73 = reg64;
  assign wire74 = ($unsigned(wire71) ?
                      (+reg64[(4'hd):(1'h0)]) : $unsigned(($signed(wire52) ?
                          ($signed(reg57) ?
                              (+(8'h9d)) : reg67[(2'h2):(1'h0)]) : ((8'h9c) > (~wire52)))));
  assign wire75 = (^~$signed($signed(wire46[(4'hb):(2'h2)])));
  assign wire76 = (8'h9f);
  always
    @(posedge clk) begin
      reg77 <= (wire54 ? (~^$signed(($signed(wire74) + (^~reg64)))) : wire71);
      reg78 <= $unsigned(($signed((((7'h40) >>> wire47) ?
          (wire74 == wire46) : (wire74 ?
              reg62 : wire71))) ^~ $signed((^~$signed(wire49)))));
      reg79 <= (|reg64);
    end
  assign wire80 = $signed((+$unsigned(wire47)));
  assign wire81 = ((reg77 > (wire50[(5'h11):(2'h3)] >= wire80[(3'h7):(1'h1)])) >> ($unsigned($signed($unsigned(reg60))) ?
                      $unsigned(($signed(wire70) ~^ reg65[(2'h2):(1'h1)])) : {{$signed((8'hb3))}}));
  assign wire82 = wire46;
endmodule
