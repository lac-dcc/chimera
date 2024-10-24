module top
#(parameter param197 = (((({(8'hb5)} ? ((8'hbc) <= (8'ha2)) : ((7'h41) ? (8'haa) : (8'ha8))) >>> ((|(8'ha9)) <<< {(8'ha3)})) | ((((8'h9c) ? (8'hba) : (8'ha5)) ? ((8'hb6) <= (8'ha2)) : ((7'h43) ? (8'ha5) : (8'h9f))) + ({(8'hb8)} ? ((8'hbb) >>> (8'hae)) : {(8'ha0)}))) ? ((!(((8'ha7) >> (8'ha2)) || (8'hbf))) ? ((((8'hb6) < (8'ha4)) ? (^(8'ha0)) : ((7'h44) ? (8'hbb) : (7'h40))) ? (((7'h40) ? (8'hbb) : (8'ha3)) ? (~&(8'hbe)) : (~^(8'hba))) : ((-(8'h9e)) ? {(8'h9e), (8'hb7)} : {(8'hb6), (8'ha6)})) : {(((8'h9d) <= (8'hb7)) ? ((8'hb8) != (8'hbd)) : (~|(8'h9e)))}) : ({(8'ha8)} ? (({(8'haf)} * (8'hbb)) ? (((8'hb4) ? (8'haf) : (8'hb7)) <<< {(8'hb7), (8'hbb)}) : (7'h42)) : ({{(8'had)}, (^(7'h40))} & ((+(8'hae)) ? ((8'hb9) ? (8'ha0) : (8'h9e)) : ((8'hbf) ? (8'hb3) : (8'had)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire195;
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire18,
                 wire19,
                 wire195,
                 reg17,
                 reg16,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(wire1);
      reg5 <= wire1;
      if ($signed((8'h9c)))
        begin
          reg6 <= (8'had);
          reg7 <= $signed($unsigned((wire0 || wire1[(3'h7):(1'h1)])));
          reg8 <= ((~|($unsigned((8'ha3)) ?
                  {reg7[(2'h2):(1'h1)]} : (wire2 ? $signed((8'h9e)) : wire1))) ?
              ((reg6 && ($signed(wire2) >= wire0)) >>> $signed($unsigned((wire1 ?
                  reg4 : wire2)))) : $signed(wire0[(3'h5):(3'h5)]));
          reg9 <= $unsigned($unsigned(wire2));
          reg10 <= (~^(({(-reg4)} * $unsigned((reg4 * (8'ha4)))) <= (wire3 ?
              ($unsigned(wire1) ? reg4 : reg8[(5'h14):(5'h12)]) : {{reg7},
                  (wire0 ? wire3 : reg7)})));
        end
      else
        begin
          reg6 <= (&(8'haf));
        end
      reg11 <= ($signed($unsigned(((~&wire1) != $unsigned(wire0)))) > reg5);
    end
  assign wire12 = reg7;
  assign wire13 = reg6;
  assign wire14 = {{wire0[(5'h10):(5'h10)]},
                      {(wire3[(2'h3):(1'h0)] ?
                              (reg9 ?
                                  wire1 : reg5) : $signed(((8'had) > wire0)))}};
  assign wire15 = {(wire1[(4'he):(4'h9)] == reg9[(1'h1):(1'h1)]),
                      $signed($signed($signed((~&wire14))))};
  always
    @(posedge clk) begin
      reg16 <= (((wire14 ?
              ((&reg7) <<< $signed(reg9)) : reg7) << reg6[(1'h1):(1'h0)]) ?
          $signed((reg6 < (+{wire2}))) : reg6[(3'h4):(3'h4)]);
      reg17 <= (8'hb6);
    end
  assign wire18 = {$signed($unsigned(reg16))};
  assign wire19 = ((8'ha6) ?
                      (!(reg8 >= reg7[(1'h1):(1'h0)])) : (reg17[(2'h3):(2'h3)] == $unsigned({((8'hb2) ?
                              wire14 : wire15),
                          (reg10 ? wire13 : wire14)})));
  module20 #() modinst196 (.wire21(wire18), .wire24(reg16), .wire23(wire12), .y(wire195), .clk(clk), .wire22(reg5), .wire25(wire0));
endmodule

module module20
#(parameter param193 = (8'ha3), 
parameter param194 = (((-{{(8'h9f)}, {param193}}) << ((+(param193 >= param193)) ~^ {(~^param193), (param193 + param193)})) == ((((param193 ? param193 : param193) ? (param193 ^~ param193) : (&param193)) ? (((8'hac) ? param193 : param193) ? ((8'hb3) ^ param193) : {param193}) : ((param193 ? param193 : param193) || (param193 ? param193 : (8'hae)))) || param193)))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h22a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire signed [(5'h14):(1'h0)] wire24;
  input wire signed [(2'h3):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire142;
  wire [(5'h15):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire191;
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  assign y = {wire118,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire140,
                 wire141,
                 wire142,
                 wire143,
                 wire191,
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
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 (1'h0)};
  assign wire26 = wire23;
  assign wire27 = ((&(wire23[(2'h2):(2'h2)] | (8'hb6))) ?
                      ((wire25 && (^{wire23})) || wire24[(1'h1):(1'h1)]) : wire21[(1'h0):(1'h0)]);
  assign wire28 = (+wire23);
  assign wire29 = $signed({$unsigned(wire23), (!(~^$signed(wire21)))});
  assign wire30 = (8'ha1);
  module31 #() modinst63 (.wire32(wire27), .y(wire62), .wire35(wire21), .wire33(wire24), .clk(clk), .wire34(wire30));
  assign wire64 = wire29[(4'hb):(3'h7)];
  assign wire65 = $signed((-$signed((-wire23[(1'h1):(1'h1)]))));
  assign wire66 = {(wire29[(5'h10):(4'h9)] ?
                          ((~^$signed(wire27)) ?
                              ((~^wire64) ?
                                  $unsigned((8'ha1)) : wire62[(1'h0):(1'h0)]) : (^~wire30)) : wire24[(4'h9):(3'h6)])};
  always
    @(posedge clk) begin
      reg67 <= (~&(|(wire21[(1'h1):(1'h0)] ?
          wire64[(1'h0):(1'h0)] : $signed((wire27 >>> wire66)))));
      reg68 <= ({($unsigned((wire66 ? wire64 : wire65)) ?
              $unsigned((wire62 ? wire21 : reg67)) : (((8'hb3) <<< wire62) ?
                  ((8'hb5) ? wire30 : wire65) : $signed((8'ha1)))),
          (wire26 != (!wire28[(1'h1):(1'h0)]))} || $signed(wire28[(3'h4):(2'h3)]));
      if (wire66[(3'h7):(1'h1)])
        begin
          reg69 <= (8'hbc);
          reg70 <= $signed((|$unsigned($signed(wire25))));
        end
      else
        begin
          reg69 <= (wire21[(3'h4):(3'h4)] ?
              wire64[(5'h15):(3'h4)] : (((^(wire30 ? wire30 : wire22)) ?
                      {(~^reg68)} : wire64) ?
                  ($signed(wire28[(3'h4):(2'h2)]) ^~ $signed((~&wire21))) : {(((8'hac) ?
                              (8'hb5) : wire25) ?
                          (~&reg67) : (wire30 <= wire26)),
                      {$unsigned((8'ha4)), $unsigned((8'haf))}}));
          if ({$unsigned((((~^reg70) ? {wire25} : (^~wire27)) << {(reg70 ?
                      wire66 : wire62),
                  (wire21 ? wire25 : (8'h9c))}))})
            begin
              reg70 <= (~{wire24[(3'h4):(1'h0)]});
              reg71 <= (^{(8'hbe),
                  $signed((wire62 ? (&wire22) : $signed(wire23)))});
              reg72 <= (!(|(wire23 ?
                  $unsigned(wire29[(4'hb):(1'h1)]) : ($unsigned(wire62) ?
                      {reg70, wire28} : (|wire26)))));
              reg73 <= wire22[(3'h6):(1'h1)];
              reg74 <= ($unsigned((($signed((8'ha5)) <<< {wire25, wire65}) ?
                  (&(wire24 > reg69)) : (&$signed(reg73)))) ~^ $signed($unsigned(((+wire65) > ((8'hb9) ?
                  wire21 : reg67)))));
            end
          else
            begin
              reg70 <= $signed(($unsigned($signed(wire64[(3'h6):(1'h0)])) ?
                  $signed((!(wire25 & wire62))) : (($signed(reg69) ?
                      (wire24 ?
                          wire66 : wire22) : $unsigned(wire29)) >> (wire30[(3'h7):(3'h7)] ?
                      $signed(wire66) : $signed(wire29)))));
            end
        end
    end
  module75 #() modinst119 (.y(wire118), .clk(clk), .wire76(wire66), .wire77(reg71), .wire79(wire21), .wire78(wire65));
  always
    @(posedge clk) begin
      reg120 <= {(reg71[(1'h0):(1'h0)] ?
              (((^wire27) ~^ (wire27 ?
                  wire62 : wire25)) ~^ (~&wire28)) : {wire22[(5'h12):(4'h9)]})};
      reg121 <= (~|{(reg74[(3'h4):(1'h0)] | ((^~reg68) ? (|reg74) : (8'ha9)))});
      reg122 <= $signed($signed($signed(reg69[(2'h3):(2'h2)])));
      if ((&((wire28[(1'h0):(1'h0)] ?
              {(reg73 - (8'hb0))} : reg120[(3'h4):(1'h0)]) ?
          (-reg122[(2'h2):(1'h0)]) : wire29[(3'h4):(1'h0)])))
        begin
          if ((8'hb3))
            begin
              reg123 <= (wire30[(1'h1):(1'h1)] & $unsigned($signed((8'hb0))));
              reg124 <= (((^wire22[(4'he):(4'ha)]) ~^ (wire66 ?
                  (((7'h40) ? wire65 : reg123) ? {wire62} : (~&reg72)) : {reg68,
                      (reg70 * (8'ha1))})) >= ($unsigned($signed(reg120[(2'h3):(1'h0)])) ?
                  ({(wire62 >> (7'h44))} && {(8'hbe)}) : (((wire25 ?
                          wire22 : (8'h9f)) + $unsigned(wire23)) ?
                      reg122[(4'hc):(3'h6)] : ((reg67 ? reg73 : wire24) ?
                          {reg71} : (wire28 >= reg120)))));
            end
          else
            begin
              reg123 <= wire62[(2'h2):(1'h1)];
            end
        end
      else
        begin
          reg123 <= $signed($signed(wire27));
          reg124 <= (~^$signed((!($unsigned(wire66) ?
              wire118 : reg120[(2'h2):(1'h0)]))));
          if (wire29)
            begin
              reg125 <= reg68[(1'h1):(1'h0)];
              reg126 <= ($signed($signed(((-reg123) ?
                  reg121 : wire25[(3'h4):(3'h4)]))) == $unsigned((~^(wire24 >= $unsigned(wire65)))));
              reg127 <= (8'hbc);
              reg128 <= {$signed(((wire26[(4'hb):(3'h6)] ?
                      reg127 : $signed(reg123)) < wire29))};
              reg129 <= $signed($signed($unsigned(reg124[(4'hd):(4'hd)])));
            end
          else
            begin
              reg125 <= (|wire64);
            end
        end
      if ({(~|{(reg121 ? (reg124 ? reg72 : wire118) : (8'hbc))}),
          (-{(!(reg67 ? reg128 : (8'ha0))), reg72[(4'hc):(4'h9)]})})
        begin
          reg130 <= (($signed($unsigned((wire27 >> reg69))) > (wire26[(3'h6):(3'h5)] ?
                  reg129 : (reg74 ? $unsigned(reg67) : $unsigned((8'hae))))) ?
              reg73 : $unsigned({$unsigned(reg127)}));
          reg131 <= $signed((((-((8'hb2) <<< reg125)) >>> ($unsigned(wire27) >>> wire28)) <= reg74));
          if (($unsigned(((8'hb6) ?
              $signed($unsigned(reg74)) : wire24)) == (~wire66)))
            begin
              reg132 <= {reg128[(1'h1):(1'h0)],
                  $signed({{(reg122 ? reg67 : wire23)},
                      (wire29 ? $signed(wire30) : $unsigned(reg130))})};
              reg133 <= reg70[(2'h3):(2'h3)];
            end
          else
            begin
              reg132 <= $signed(((reg122[(2'h2):(1'h0)] ^ wire28) != wire118));
              reg133 <= $unsigned((((reg73[(3'h5):(1'h0)] + $signed((8'hb4))) < (~^reg124)) == reg124));
              reg134 <= $unsigned(($signed($signed($unsigned((8'hba)))) ?
                  wire24[(4'h8):(1'h0)] : reg67));
              reg135 <= {((($signed((7'h40)) ?
                      (reg132 >>> reg70) : reg124) == reg71) > wire29),
                  $unsigned((wire28[(3'h6):(2'h2)] ?
                      reg121[(5'h13):(5'h11)] : wire29))};
              reg136 <= reg69;
            end
        end
      else
        begin
          reg130 <= (+wire27[(3'h6):(3'h4)]);
          if (((~^($signed($unsigned(reg72)) | wire118)) ?
              reg134 : (reg133 ^ reg120[(2'h2):(2'h2)])))
            begin
              reg131 <= (reg131[(1'h0):(1'h0)] | (reg69[(2'h3):(1'h0)] ?
                  $unsigned($signed((reg74 ? reg128 : wire64))) : reg136));
              reg132 <= (^~$signed(reg134));
            end
          else
            begin
              reg131 <= (reg127[(3'h7):(3'h6)] ? reg74 : wire62[(2'h2):(2'h2)]);
              reg132 <= (8'ha3);
              reg133 <= reg123[(3'h6):(1'h1)];
              reg134 <= (7'h44);
            end
          reg135 <= $unsigned(wire24[(2'h2):(1'h0)]);
          reg136 <= wire27;
          if (((-(wire64[(4'h9):(3'h7)] ?
                  (|reg74) : $unsigned($signed(wire27)))) ?
              reg123[(3'h6):(1'h0)] : $signed(({(~reg120)} ?
                  reg122 : (-reg72)))))
            begin
              reg137 <= reg73[(5'h10):(3'h5)];
              reg138 <= $unsigned($signed(wire28[(1'h1):(1'h1)]));
            end
          else
            begin
              reg137 <= (((~^($signed(wire28) ?
                          wire29 : (wire25 ? (8'hb7) : reg74))) ?
                      (~|(8'hb0)) : $unsigned({$signed(reg137), (8'had)})) ?
                  reg121[(4'hf):(4'hd)] : $unsigned((~^reg74[(4'ha):(2'h3)])));
              reg138 <= wire24[(5'h14):(3'h4)];
              reg139 <= (8'haf);
            end
        end
    end
  assign wire140 = wire118;
  assign wire141 = ((8'h9e) ?
                       wire118 : $unsigned(($signed($signed(reg122)) ?
                           ((&(8'hbb)) ?
                               (~&reg74) : wire21) : $signed($unsigned(reg131)))));
  assign wire142 = reg138;
  assign wire143 = reg72;
  module144 #() modinst192 (wire191, clk, reg136, reg72, wire21, reg138, reg134);
endmodule

module module144  (y, clk, wire149, wire148, wire147, wire146, wire145);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire149;
  input wire signed [(4'h8):(1'h0)] wire148;
  input wire [(2'h3):(1'h0)] wire147;
  input wire signed [(3'h6):(1'h0)] wire146;
  input wire [(5'h12):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire190;
  wire signed [(4'hb):(1'h0)] wire189;
  wire [(2'h2):(1'h0)] wire182;
  wire [(4'he):(1'h0)] wire179;
  wire signed [(3'h7):(1'h0)] wire178;
  wire signed [(4'hc):(1'h0)] wire177;
  wire [(2'h2):(1'h0)] wire176;
  wire [(4'hb):(1'h0)] wire175;
  wire signed [(2'h2):(1'h0)] wire150;
  reg signed [(4'hb):(1'h0)] reg188 = (1'h0);
  reg [(2'h2):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg186 = (1'h0);
  reg [(5'h15):(1'h0)] reg185 = (1'h0);
  reg [(3'h4):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(2'h2):(1'h0)] reg173 = (1'h0);
  reg [(4'h9):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg [(3'h5):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg169 = (1'h0);
  reg [(4'he):(1'h0)] reg168 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg166 = (1'h0);
  reg [(4'hb):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg164 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(4'he):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg151 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire182,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire150,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg181,
                 reg180,
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
                 reg152,
                 reg151,
                 (1'h0)};
  assign wire150 = wire148[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      if ({({wire145} ? $signed((|wire150)) : {(~|(wire148 ~^ wire147))})})
        begin
          reg151 <= $signed(($unsigned($signed({wire148})) ?
              wire146 : $unsigned(((|(8'hb7)) - $unsigned(wire146)))));
        end
      else
        begin
          reg151 <= wire147[(2'h3):(2'h3)];
          reg152 <= wire150;
          reg153 <= reg151;
        end
      if ({$unsigned((($unsigned(wire148) <= $signed((8'ha1))) ?
              ($signed(wire147) ?
                  ((8'hbc) >>> reg151) : (wire150 << (8'hb6))) : wire149[(1'h0):(1'h0)]))})
        begin
          reg154 <= $signed((($unsigned((reg153 >= reg152)) ?
                  reg152[(1'h1):(1'h1)] : $unsigned(wire148[(3'h4):(2'h3)])) ?
              reg152[(2'h3):(1'h1)] : ($unsigned(wire150[(2'h2):(2'h2)]) < $signed(wire149[(3'h7):(2'h3)]))));
          reg155 <= (^~$unsigned(reg151));
          if (wire148)
            begin
              reg156 <= (~^((wire150[(1'h0):(1'h0)] ?
                      $unsigned((wire146 ?
                          wire148 : (7'h44))) : (reg155 - wire145)) ?
                  wire148 : reg154));
              reg157 <= ($signed($unsigned((^{wire147, wire145}))) ?
                  (~&reg154) : {(((wire148 >= reg156) ?
                              $unsigned(reg151) : {wire145, (8'ha7)}) ?
                          $unsigned(wire148[(1'h1):(1'h0)]) : {$unsigned(reg151)})});
              reg158 <= {$unsigned(wire146),
                  {$unsigned(($unsigned(reg152) ?
                          {(8'hbd)} : $unsigned(reg153)))}};
              reg159 <= (~^$signed(((8'ha9) ?
                  wire147 : ((~|reg155) <= (reg158 ? wire148 : (8'hbb))))));
              reg160 <= $unsigned((&reg152[(3'h4):(2'h2)]));
            end
          else
            begin
              reg156 <= (8'hbe);
            end
          reg161 <= (wire147[(1'h1):(1'h1)] ?
              ((($unsigned(reg160) ?
                  (wire150 << (8'ha5)) : (wire145 ?
                      reg158 : reg156)) == (-$signed(reg151))) << wire145[(4'ha):(4'h8)]) : $signed(reg155[(3'h7):(2'h2)]));
        end
      else
        begin
          reg154 <= (reg151[(4'hd):(4'h9)] & $signed(reg160));
          if ($unsigned($signed(reg159)))
            begin
              reg155 <= $signed(($unsigned({(reg160 | reg161)}) ?
                  ($unsigned($unsigned(reg156)) || ($signed(wire149) ?
                      ((7'h43) ? reg155 : reg156) : (reg161 ?
                          wire147 : wire147))) : (+wire146[(2'h3):(2'h3)])));
              reg156 <= (wire150 ?
                  $unsigned({reg152[(2'h3):(2'h2)],
                      wire150[(1'h1):(1'h0)]}) : $unsigned(({$signed(wire146)} ?
                      ($unsigned(reg158) + $signed((8'h9c))) : $signed({(8'hb1)}))));
              reg157 <= $unsigned(wire145);
              reg158 <= (^~reg158);
            end
          else
            begin
              reg155 <= ($unsigned((reg161 ?
                  {(!reg152), $signed(wire150)} : (reg161[(4'ha):(3'h6)] ?
                      $unsigned(reg151) : $unsigned(wire149)))) ~^ $unsigned(($signed(reg152[(3'h6):(3'h5)]) ?
                  $unsigned((reg157 ? wire149 : (8'hb6))) : $unsigned((reg159 ?
                      reg155 : wire150)))));
              reg156 <= (reg155 ^ {{(|$signed(reg160))}});
            end
          reg159 <= $signed(($unsigned(reg159[(2'h3):(2'h3)]) ?
              ($signed((reg154 ?
                  reg151 : reg159)) || reg152[(3'h5):(2'h2)]) : (&(~&$signed((8'hab))))));
          reg160 <= (wire148[(2'h2):(1'h1)] >> $unsigned({$unsigned(reg161)}));
          if ((!(reg158[(3'h5):(2'h2)] + {($signed(wire149) + (wire148 ?
                  reg154 : (7'h43))),
              (+reg161)})))
            begin
              reg161 <= $signed($unsigned(wire147));
              reg162 <= $signed(wire147);
              reg163 <= $signed($unsigned((|reg151[(5'h10):(4'ha)])));
            end
          else
            begin
              reg161 <= (-reg160[(4'he):(2'h2)]);
              reg162 <= ($unsigned((~reg163)) >>> $unsigned((~|$unsigned(wire145[(4'hb):(4'h8)]))));
              reg163 <= ((8'ha5) ?
                  (~(!(~|(reg154 ? (8'haa) : reg162)))) : ($unsigned(wire148) ?
                      ($unsigned((reg157 >> reg154)) ?
                          (!(reg160 ? reg158 : reg158)) : {{reg159,
                                  reg158}}) : ($unsigned(reg159) ^ {$signed(reg163)})));
            end
        end
      reg164 <= ((((~&reg152) ?
          (!(reg161 != (8'ha5))) : $unsigned($unsigned(reg157))) != ((^~$unsigned(reg159)) == ((reg163 - wire149) >> wire147[(2'h2):(2'h2)]))) <<< (((!wire147) ?
          $unsigned(reg151[(5'h10):(1'h0)]) : reg157[(4'h9):(2'h3)]) & {(8'ha1)}));
      if ((~{{((reg161 ? wire145 : reg159) > reg155[(3'h6):(2'h3)]),
              (~&$signed(wire148))},
          $signed({(reg164 ? reg153 : reg157)})}))
        begin
          if (((((~(reg164 >= reg152)) ?
              reg151 : ($unsigned(reg152) >>> (reg164 < reg161))) << wire145) >>> $unsigned((((wire150 >> reg164) ?
                  (reg156 >>> reg161) : $signed(reg156)) ?
              $unsigned($signed(wire149)) : reg161))))
            begin
              reg165 <= reg158;
            end
          else
            begin
              reg165 <= ($signed(($signed((+reg161)) ?
                  (-$signed((8'ha4))) : $signed(reg161[(3'h6):(2'h3)]))) ^ reg162[(1'h1):(1'h1)]);
              reg166 <= ($unsigned($signed(reg164)) ?
                  $unsigned(reg158[(1'h1):(1'h1)]) : wire145);
              reg167 <= $unsigned(reg163[(3'h5):(2'h3)]);
            end
          if ($unsigned(reg157))
            begin
              reg168 <= reg156[(5'h10):(4'h8)];
            end
          else
            begin
              reg168 <= ({(~^$signed($signed(reg152))),
                      ({wire146[(2'h2):(2'h2)]} ? reg164 : reg162)} ?
                  $unsigned(reg157[(3'h6):(3'h5)]) : ((8'h9c) ?
                      reg168 : ((8'ha9) ?
                          reg159 : (reg167 ? $signed((8'hb4)) : reg158))));
              reg169 <= reg155;
            end
          reg170 <= (&$unsigned({reg162, (~^$signed(wire146))}));
          if ($unsigned($signed(reg168[(1'h0):(1'h0)])))
            begin
              reg171 <= reg167;
            end
          else
            begin
              reg171 <= (^$signed(($signed((reg169 << wire147)) == $signed(reg162))));
              reg172 <= (7'h40);
              reg173 <= (+$unsigned(wire148));
              reg174 <= (!(^reg169[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg165 <= wire147;
          if (($signed($unsigned(reg156)) ?
              $signed($signed(($signed(wire147) >> reg164[(2'h2):(2'h2)]))) : reg170[(2'h3):(2'h2)]))
            begin
              reg166 <= (((((reg151 + reg167) ?
                  (~reg157) : $unsigned(reg158)) || reg168[(4'hc):(4'h9)]) <= ((~^(8'hb3)) && {(reg152 <= (8'hbb)),
                  (7'h43)})) - $unsigned((((reg170 & reg165) ?
                      $signed(reg167) : (wire147 >> (8'hbd))) ?
                  ((!reg162) != reg152[(1'h1):(1'h0)]) : reg157)));
              reg167 <= wire149;
              reg168 <= wire146;
            end
          else
            begin
              reg166 <= (8'hbd);
            end
          reg169 <= $unsigned(reg160[(4'h8):(3'h4)]);
          reg170 <= reg151;
          reg171 <= reg174[(1'h1):(1'h0)];
        end
    end
  assign wire175 = {(($signed(reg163) ^~ {$unsigned(reg157), $signed(reg170)}) ?
                           (reg172 ?
                               ((~reg174) ?
                                   {(8'ha8)} : (reg156 ?
                                       reg170 : (8'h9f))) : {$unsigned(wire149)}) : wire149[(3'h7):(3'h4)])};
  assign wire176 = $unsigned($unsigned((~((~&wire175) + (wire147 | reg172)))));
  assign wire177 = wire147;
  assign wire178 = $unsigned(((~|reg154[(3'h6):(2'h3)]) ?
                       {((~|wire149) ?
                               (reg170 ?
                                   reg165 : wire150) : (reg165 >> (8'hac)))} : (((&reg167) ?
                           $signed(reg166) : (-(8'h9d))) <= reg170[(3'h4):(1'h1)])));
  assign wire179 = ((reg151 ?
                           (~^((wire175 ?
                               wire175 : reg165) ^ $signed(wire145))) : (~&((reg172 ?
                               (8'hb3) : reg158) + $signed(reg172)))) ?
                       reg172[(3'h5):(2'h2)] : (8'ha7));
  always
    @(posedge clk) begin
      reg180 <= (reg159[(2'h2):(2'h2)] <= reg167[(3'h4):(1'h0)]);
      reg181 <= wire146[(3'h5):(2'h2)];
    end
  assign wire182 = reg158[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg183 <= (|(^~wire148[(3'h5):(2'h2)]));
      if ((!{$unsigned((^reg152)), (+(8'had))}))
        begin
          reg184 <= reg162;
        end
      else
        begin
          reg184 <= $unsigned(reg160);
          reg185 <= reg165[(1'h0):(1'h0)];
        end
      reg186 <= {((^wire145[(4'hb):(4'h9)]) || (($unsigned(reg181) ?
                  (reg170 ? reg151 : (7'h43)) : (~&wire149)) ?
              ((^~wire150) ^~ reg167[(4'h8):(3'h6)]) : (reg174[(2'h3):(1'h0)] ?
                  ((8'ha9) ? reg166 : reg169) : (reg153 == reg164)))),
          (~&{{(reg157 ? reg173 : reg185), $signed(wire177)}})};
      reg187 <= $unsigned((-(8'ha7)));
      reg188 <= (wire147[(2'h2):(1'h1)] ^~ (-$unsigned($unsigned(wire178))));
    end
  assign wire189 = (~(^(+wire179[(4'he):(1'h1)])));
  assign wire190 = $unsigned((+$signed(reg186[(1'h0):(1'h0)])));
endmodule

module module75  (y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h1bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire79;
  input wire [(2'h3):(1'h0)] wire78;
  input wire [(2'h2):(1'h0)] wire77;
  input wire signed [(4'h9):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire115;
  wire [(5'h15):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire108;
  wire signed [(4'hf):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire [(4'hc):(1'h0)] wire105;
  wire [(3'h4):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 reg112,
                 reg111,
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
                 (1'h0)};
  assign wire80 = (((((wire78 ? wire77 : wire76) > $unsigned(wire76)) ?
                              wire77[(1'h0):(1'h0)] : $unsigned((|wire79))) ?
                          $signed($unsigned($unsigned(wire77))) : {$signed((&wire79)),
                              (~|$signed(wire76))}) ?
                      (wire78 ?
                          ({wire79} <= (wire78[(2'h3):(2'h3)] - wire77)) : ((~&$signed(wire79)) ?
                              (wire76[(3'h7):(3'h7)] ?
                                  ((8'hbf) ?
                                      wire79 : (8'hb5)) : (wire78 << wire76)) : $unsigned((wire78 ?
                                  wire76 : wire76)))) : wire76[(1'h1):(1'h0)]);
  assign wire81 = ({wire76} ?
                      ($signed($signed((wire80 >= (8'h9d)))) > (~&((8'haa) ~^ wire78[(2'h2):(1'h1)]))) : ($unsigned(wire80[(3'h4):(1'h0)]) ?
                          $signed(wire79[(4'hf):(4'ha)]) : (^~wire80)));
  assign wire82 = (|{(~($unsigned(wire76) <= wire78[(1'h1):(1'h1)])),
                      ((~(wire76 ?
                          wire79 : wire78)) <= wire77[(1'h1):(1'h0)])});
  assign wire83 = wire79[(5'h11):(4'hf)];
  assign wire84 = (^~wire83[(2'h2):(1'h1)]);
  assign wire85 = (&wire80);
  assign wire86 = wire79[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      if ((wire81 ?
          {(wire76 ?
                  (((8'h9d) >>> wire77) ?
                      wire81[(1'h0):(1'h0)] : wire76[(3'h7):(1'h0)]) : ($signed(wire81) > (8'haa)))} : wire82))
        begin
          if ($signed(wire85))
            begin
              reg87 <= ((~^$signed($unsigned($signed((8'hbf))))) >> wire80);
              reg88 <= (wire84[(2'h3):(1'h0)] ?
                  $unsigned(((^~(wire80 & (8'h9f))) ?
                      $unsigned((wire83 | wire83)) : (-$signed(reg87)))) : wire79[(5'h10):(4'hc)]);
            end
          else
            begin
              reg87 <= {(wire81 ?
                      ($signed((8'ha3)) * wire78) : (~^$signed($signed((8'hb1)))))};
              reg88 <= {(8'hbf), (wire76[(3'h4):(1'h0)] || $unsigned(wire82))};
              reg89 <= wire79[(4'hf):(3'h5)];
              reg90 <= $signed(({((&wire81) || (8'haf))} - ((|wire83) - ({wire82,
                  (8'hb3)} != (wire80 ? reg89 : wire86)))));
            end
          if (($unsigned((reg90[(3'h5):(1'h0)] ?
                  {{wire79, wire84},
                      wire83[(4'h8):(2'h2)]} : $signed(wire76[(4'h8):(2'h3)]))) ?
              wire77[(2'h2):(2'h2)] : $signed($signed($unsigned((wire76 << wire84))))))
            begin
              reg91 <= wire77;
              reg92 <= wire81;
              reg93 <= {$unsigned((wire83 >>> {wire86[(2'h3):(2'h2)],
                      {wire77}})),
                  reg89[(4'ha):(1'h0)]};
            end
          else
            begin
              reg91 <= {(reg90 ?
                      (+$signed($unsigned(wire81))) : (($signed(reg89) ?
                          wire82 : $signed(reg88)) >> $unsigned($unsigned(reg87)))),
                  wire80};
              reg92 <= $signed($signed($signed(({wire77} ?
                  (|wire78) : reg90[(2'h3):(1'h1)]))));
              reg93 <= ($signed((^$unsigned(wire82))) < $unsigned($unsigned($signed($signed(wire84)))));
            end
          if ($unsigned(wire86[(2'h2):(1'h1)]))
            begin
              reg94 <= wire77;
              reg95 <= $unsigned(wire78);
              reg96 <= (((~|(reg89 ? reg91[(2'h2):(2'h2)] : wire85)) ?
                      (|wire76[(1'h0):(1'h0)]) : (|$unsigned($unsigned(wire83)))) ?
                  (reg87[(2'h2):(1'h0)] >= (((wire85 ? reg88 : (8'hb0)) ?
                          $unsigned(wire76) : (^~reg90)) ?
                      {wire83[(2'h3):(2'h3)],
                          {wire83}} : $signed((reg90 >>> reg89)))) : $signed((+wire79[(4'hc):(4'hb)])));
              reg97 <= (wire85[(4'hf):(3'h6)] == $unsigned(wire86[(2'h2):(1'h1)]));
              reg98 <= (($unsigned((^~(wire76 ? reg89 : (8'hb9)))) ?
                      ({reg94} ?
                          reg90 : $unsigned(((8'ha5) & wire80))) : (~($signed(reg91) <= {wire85,
                          reg97}))) ?
                  (|$unsigned($unsigned((-(7'h42))))) : wire79[(4'h8):(4'h8)]);
            end
          else
            begin
              reg94 <= reg91;
              reg95 <= $unsigned($signed($unsigned(reg97[(1'h1):(1'h1)])));
              reg96 <= ($unsigned((~&((8'hae) ?
                      (wire76 ^~ wire86) : reg89[(1'h0):(1'h0)]))) ?
                  reg96[(3'h7):(2'h2)] : $signed({reg87[(3'h5):(1'h1)]}));
              reg97 <= reg91[(1'h0):(1'h0)];
              reg98 <= reg93;
            end
          if (((~((~&$unsigned(reg89)) ?
                  $unsigned(reg88) : $signed(((8'ha7) ? reg87 : reg98)))) ?
              $signed((~|wire81[(4'h9):(3'h4)])) : (^wire83[(4'h9):(2'h3)])))
            begin
              reg99 <= $unsigned(reg91);
              reg100 <= wire78;
              reg101 <= ({(&$unsigned({reg100, wire83})), (&reg98)} ?
                  ($signed(({reg91} & (wire83 ? reg97 : (7'h44)))) ?
                      $unsigned(((!reg100) ?
                          wire86[(2'h3):(2'h3)] : wire85)) : reg94[(2'h2):(1'h0)]) : ((reg94[(2'h3):(2'h3)] ?
                          (7'h42) : (~&$signed((8'haa)))) ?
                      $signed(wire86[(3'h4):(1'h1)]) : wire82[(4'ha):(2'h2)]));
              reg102 <= wire78[(2'h2):(1'h1)];
              reg103 <= (reg98[(3'h4):(1'h0)] ^ $signed($unsigned({{wire81}})));
            end
          else
            begin
              reg99 <= $unsigned(reg99[(3'h6):(1'h0)]);
              reg100 <= reg101;
            end
          reg104 <= ((-reg96) << $unsigned($unsigned($unsigned($signed(wire83)))));
        end
      else
        begin
          reg87 <= ({{(8'ha0)}} ?
              ((~^(|reg93)) == $unsigned(wire83)) : ((wire84[(1'h1):(1'h1)] ?
                  $unsigned((~|wire78)) : $signed((reg89 ?
                      wire84 : wire81))) >= (^((wire80 < wire76) != $signed((8'ha9))))));
          if ($signed((&{reg90[(3'h5):(1'h1)]})))
            begin
              reg88 <= reg97;
              reg89 <= $signed((+$unsigned((8'hbd))));
              reg90 <= ({wire82[(4'hb):(1'h1)], reg99} ?
                  reg90 : {reg101[(1'h0):(1'h0)], wire78[(2'h2):(2'h2)]});
            end
          else
            begin
              reg88 <= {reg97,
                  (reg90[(3'h5):(2'h3)] ?
                      ((reg98 + reg99[(3'h6):(1'h0)]) >= wire79) : $unsigned(($unsigned(reg104) ?
                          reg90 : (wire81 ^~ wire83))))};
              reg89 <= $unsigned(wire76[(3'h6):(1'h0)]);
            end
          reg91 <= $signed((+$unsigned((^$unsigned(reg93)))));
          reg92 <= (reg95[(2'h2):(1'h0)] ? reg96 : (~&(!$unsigned({reg90}))));
          reg93 <= (~|((wire84[(2'h3):(1'h1)] ?
              $signed((&wire79)) : ((~wire76) ?
                  ((8'h9d) ^~ wire79) : (^wire85))) <<< wire79));
        end
    end
  assign wire105 = $signed(({{reg98[(1'h0):(1'h0)]}} ~^ (^~(&(reg102 ?
                       reg103 : wire80)))));
  assign wire106 = $unsigned((~$unsigned($signed((~&wire85)))));
  assign wire107 = $signed((+(reg98[(2'h3):(1'h0)] < wire77)));
  assign wire108 = wire84;
  always
    @(posedge clk) begin
      reg109 <= $signed($unsigned((+(+$signed((8'hb2))))));
      reg110 <= wire81[(1'h0):(1'h0)];
      reg111 <= reg91[(2'h2):(2'h2)];
      reg112 <= ($unsigned(($unsigned((wire85 ?
          wire78 : wire81)) ~^ $unsigned($unsigned(reg90)))) | (((((7'h42) ?
                  wire78 : reg109) ?
              reg98 : (reg101 ^ reg95)) ?
          (8'hbb) : reg92[(1'h0):(1'h0)]) <= $unsigned($signed($unsigned(reg110)))));
    end
  assign wire113 = {wire107[(4'hc):(4'h9)]};
  assign wire114 = reg99;
  assign wire115 = ($unsigned($signed((reg109[(2'h3):(1'h0)] ?
                           $unsigned((8'hb0)) : reg95))) ?
                       $unsigned(($unsigned((~wire85)) > reg87)) : reg98[(3'h5):(2'h2)]);
  assign wire116 = ((((~|{wire108, reg99}) ?
                               $signed({wire78}) : $signed(wire78)) ?
                           (7'h43) : $unsigned(reg97[(1'h1):(1'h1)])) ?
                       reg104 : {wire83[(3'h5):(2'h3)]});
  assign wire117 = $signed(((~^((&reg112) ?
                       $unsigned((8'h9d)) : reg99[(3'h5):(2'h3)])) > reg92[(1'h0):(1'h0)]));
endmodule

module module31
#(parameter param60 = (7'h41), 
parameter param61 = {{param60}})
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire35;
  input wire signed [(4'h8):(1'h0)] wire34;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire [(4'ha):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire53,
                 wire37,
                 wire36,
                 reg59,
                 reg58,
                 reg55,
                 reg54,
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
                 (1'h0)};
  assign wire36 = $signed(((&((wire35 != wire32) <<< (+wire33))) ?
                      wire32[(3'h4):(1'h0)] : ($signed((8'haf)) <= $unsigned({wire35}))));
  assign wire37 = {$unsigned(wire35)};
  always
    @(posedge clk) begin
      reg38 <= $signed(((wire32 ?
          $unsigned((&wire37)) : $signed(wire37)) >>> (8'hb0)));
      reg39 <= {wire37[(1'h1):(1'h1)]};
      if ((($unsigned({reg39[(5'h11):(2'h2)], $unsigned(wire37)}) ?
          (7'h44) : wire32[(2'h3):(2'h3)]) > wire32[(4'h8):(4'h8)]))
        begin
          reg40 <= ((-(&reg38[(4'h8):(1'h0)])) | $unsigned(({$unsigned(wire33),
              $signed(wire36)} < ((reg38 ? reg38 : (8'hba)) ?
              ((8'ha0) <<< wire33) : reg39))));
          reg41 <= wire37[(2'h2):(1'h1)];
          reg42 <= ((reg39[(4'h9):(3'h7)] > $signed($unsigned((&reg39)))) | (wire32[(1'h0):(1'h0)] ?
              $unsigned(reg38) : reg40[(2'h3):(2'h2)]));
          reg43 <= $unsigned(reg42);
          reg44 <= (~|reg43[(4'h9):(3'h7)]);
        end
      else
        begin
          reg40 <= wire37;
          reg41 <= wire37;
        end
    end
  always
    @(posedge clk) begin
      if (reg43[(3'h7):(2'h3)])
        begin
          if ((wire37 && {{wire37[(5'h10):(1'h1)]}}))
            begin
              reg45 <= {(($signed($signed(reg42)) ?
                          $signed((~|reg44)) : ((reg44 ?
                              wire35 : wire33) - reg39)) ?
                      reg42[(3'h4):(1'h0)] : $signed(reg42[(4'ha):(2'h3)])),
                  ($signed($signed((wire35 < wire35))) | wire34)};
              reg46 <= (!(reg42 && {(wire32[(3'h7):(1'h1)] ?
                      {wire34, reg43} : wire37[(5'h10):(1'h0)])}));
              reg47 <= ($signed($signed($signed($signed((8'ha3))))) >= (|(((wire36 > reg38) ?
                  (wire35 << wire33) : reg40[(1'h0):(1'h0)]) <<< (-(~|reg39)))));
              reg48 <= reg39[(1'h1):(1'h1)];
              reg49 <= ({wire33[(3'h5):(1'h0)]} ?
                  {reg41[(1'h1):(1'h1)]} : ($unsigned($unsigned((reg44 + reg43))) ?
                      {$signed($signed(reg40))} : reg40[(1'h0):(1'h0)]));
            end
          else
            begin
              reg45 <= reg40[(2'h2):(1'h0)];
            end
          reg50 <= {wire37[(4'ha):(3'h5)]};
          reg51 <= reg46[(1'h1):(1'h0)];
        end
      else
        begin
          reg45 <= $unsigned((~|reg46));
          reg46 <= ($signed({((reg48 ? reg38 : reg50) <<< (reg42 ?
                  (8'ha6) : reg51)),
              {reg47}}) - $signed((~$unsigned(reg51))));
        end
      reg52 <= $unsigned($signed((((-reg39) - $unsigned(reg41)) ?
          (8'hab) : $unsigned(reg49[(2'h2):(2'h2)]))));
    end
  assign wire53 = ((wire37[(3'h4):(2'h3)] ^ (((+reg51) * $unsigned(reg42)) * $signed(wire35[(1'h0):(1'h0)]))) ?
                      $unsigned($unsigned($unsigned((~^(8'hbe))))) : $signed((~(reg49[(4'ha):(1'h0)] >>> reg45))));
  always
    @(posedge clk) begin
      reg54 <= wire34[(2'h2):(2'h2)];
      reg55 <= (reg41 ?
          (((((8'hb6) || (8'hb6)) - $signed(reg42)) != ((wire36 * reg54) - {wire53,
                  reg44})) ?
              $unsigned(wire32) : (~(+(wire35 ?
                  reg47 : reg45)))) : ((-reg52[(4'ha):(1'h1)]) ?
              wire37 : (((+wire32) ? (+(8'haa)) : wire36) ?
                  $unsigned((~&wire53)) : (!$signed(wire33)))));
    end
  assign wire56 = (^~reg42);
  assign wire57 = $signed((!$signed(reg42)));
  always
    @(posedge clk) begin
      reg58 <= $signed(({((-reg40) * wire32[(3'h5):(1'h0)])} * ($signed(reg49[(2'h2):(1'h1)]) ?
          (reg50[(2'h3):(2'h2)] << (8'ha9)) : ({reg40, reg45} ?
              (reg55 ? reg42 : reg52) : (8'hb3)))));
      reg59 <= (reg43[(4'h9):(4'h8)] ?
          (&$unsigned($unsigned({reg48,
              (8'hb9)}))) : (reg55 <<< {$signed((reg43 ? wire37 : wire53)),
              reg41}));
    end
endmodule
