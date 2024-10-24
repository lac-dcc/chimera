module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire214;
  wire signed [(4'ha):(1'h0)] wire213;
  wire [(5'h15):(1'h0)] wire212;
  wire [(3'h4):(1'h0)] wire210;
  wire [(5'h12):(1'h0)] wire209;
  wire signed [(4'hd):(1'h0)] wire208;
  wire [(3'h4):(1'h0)] wire206;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire210,
                 wire209,
                 wire208,
                 wire206,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (wire0[(2'h3):(2'h3)] ?
                     (^~(wire4[(2'h2):(1'h0)] ?
                         $signed(wire0[(2'h3):(2'h2)]) : wire3)) : {wire2,
                         wire1});
  assign wire6 = $signed(wire1[(2'h3):(1'h0)]);
  assign wire7 = ((~^$unsigned($signed((~(8'hb6))))) ?
                     wire6[(3'h4):(2'h3)] : (&$unsigned($signed(wire4))));
  assign wire8 = $signed($unsigned(wire4[(4'ha):(1'h0)]));
  assign wire9 = wire2[(1'h0):(1'h0)];
  assign wire10 = (~&wire5[(1'h1):(1'h0)]);
  assign wire11 = (7'h43);
  assign wire12 = wire4[(3'h5):(3'h5)];
  assign wire13 = $signed($unsigned((wire10 * {(wire10 ? wire7 : (8'ha3))})));
  module14 #() modinst207 (.wire18(wire3), .clk(clk), .wire17(wire1), .wire16(wire4), .y(wire206), .wire15(wire9));
  assign wire208 = $signed($signed((!($signed(wire10) << (wire1 < (8'ha9))))));
  assign wire209 = wire3;
  module20 #() modinst211 (.y(wire210), .wire21(wire6), .wire24(wire7), .wire22(wire10), .clk(clk), .wire23(wire0));
  assign wire212 = wire10[(1'h1):(1'h0)];
  assign wire213 = (~|$unsigned($signed($signed(((8'hae) ?
                       wire209 : (8'hb4))))));
  assign wire214 = wire206;
endmodule

module module14
#(parameter param204 = ((7'h41) >>> (((^~((7'h42) ? (8'hbc) : (8'hb9))) ? (~|((8'hb6) - (7'h44))) : ((~&(8'hb7)) - (|(8'h9f)))) ? ((((8'ha5) * (8'hb4)) <= ((8'hb7) & (8'hbc))) ? ((8'hb4) ? (^(8'hb8)) : ((8'hb8) * (8'ha5))) : (((8'hbd) << (8'hbc)) ^~ {(8'hbb), (8'ha2)})) : ((((8'hac) & (8'h9f)) & (|(8'ha1))) ? (+((7'h44) * (8'hba))) : ({(8'h9d), (8'hb8)} ? ((8'hb9) ? (7'h44) : (8'h9c)) : {(8'hb0), (8'hb1)})))), 
parameter param205 = (+((((param204 ? param204 : param204) < param204) & ((param204 ? (8'haf) : param204) ? (8'hab) : (|param204))) ? (({param204, param204} ? param204 : param204) ? param204 : param204) : {param204})))
(y, clk, wire15, wire16, wire17, wire18);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire16;
  input wire [(4'hf):(1'h0)] wire17;
  input wire [(5'h10):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire203;
  wire signed [(5'h13):(1'h0)] wire201;
  wire [(5'h14):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire72;
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  assign y = {wire203,
                 wire201,
                 wire107,
                 wire106,
                 wire104,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire19,
                 wire40,
                 wire42,
                 wire44,
                 wire45,
                 wire46,
                 wire72,
                 reg79,
                 reg43,
                 (1'h0)};
  assign wire19 = wire18;
  module20 #() modinst41 (.clk(clk), .wire24(wire15), .wire21(wire19), .wire23(wire16), .y(wire40), .wire22(wire18));
  assign wire42 = wire17[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg43 <= wire17[(2'h3):(1'h0)];
    end
  assign wire44 = {({(reg43[(1'h1):(1'h0)] ? (+wire40) : wire17[(2'h3):(1'h0)]),
                              wire40[(3'h5):(3'h4)]} ?
                          $unsigned($unsigned($unsigned(wire17))) : wire18)};
  assign wire45 = wire19[(3'h4):(1'h0)];
  assign wire46 = wire15[(4'ha):(3'h4)];
  module47 #() modinst73 (.wire51(wire44), .wire49(reg43), .y(wire72), .wire48(wire40), .clk(clk), .wire50(wire19));
  assign wire74 = $unsigned($unsigned(reg43[(1'h0):(1'h0)]));
  assign wire75 = {wire18};
  assign wire76 = $signed($unsigned(($unsigned(wire16) ?
                      $unsigned((wire18 ?
                          (8'hbd) : wire75)) : ((wire44 >>> wire44) ?
                          (|wire42) : (^~wire75)))));
  assign wire77 = (reg43 - $signed((&$signed((wire16 ? wire40 : (7'h40))))));
  assign wire78 = ((!(wire18 > ((wire76 ?
                      wire16 : wire19) >= wire42))) <= wire45);
  always
    @(posedge clk) begin
      if (((&wire19) ?
          ($signed(wire18) & (((^~wire45) ?
                  (wire19 ? wire75 : wire45) : (wire17 ? wire76 : wire74)) ?
              ((reg43 ? wire77 : (8'hbe)) ?
                  (wire76 >>> wire16) : {wire40,
                      wire44}) : $unsigned(wire16))) : (~|($unsigned($unsigned(reg43)) ?
              (|wire40[(5'h10):(3'h4)]) : (~&wire72)))))
        begin
          reg79 <= ((~&(&$unsigned((wire77 ? wire72 : wire72)))) ?
              wire74[(2'h3):(2'h3)] : $signed((~^wire78[(4'ha):(3'h4)])));
        end
      else
        begin
          reg79 <= ({$unsigned($unsigned((wire45 ? (8'hb0) : wire15)))} ?
              (+((^~{(8'h9d)}) ?
                  (~^wire18[(3'h4):(3'h4)]) : wire17[(4'h8):(3'h7)])) : ((^~(reg43[(5'h12):(4'h9)] ?
                  ((7'h40) >= wire19) : $signed(wire46))) >>> wire74[(4'h8):(1'h0)]));
        end
    end
  module80 #() modinst105 (wire104, clk, wire16, wire19, wire18, wire15);
  assign wire106 = $signed($unsigned(wire75));
  assign wire107 = $unsigned($unsigned($signed(wire77)));
  module108 #() modinst202 (.clk(clk), .wire111(wire77), .wire112(wire74), .wire109(wire16), .wire110(wire104), .y(wire201));
  assign wire203 = reg43;
endmodule

module module108
#(parameter param199 = (({(((8'ha1) < (8'hac)) >> {(8'h9c)}), (((8'ha5) << (8'hbb)) ? ((8'hb1) ^ (8'hbb)) : ((8'ha1) ? (8'ha5) : (8'hb1)))} >>> ((((8'hb3) + (8'ha7)) - ((8'h9d) > (8'hb5))) ? {((8'hac) + (8'hae))} : {((8'ha0) == (8'ha5))})) ? ({({(8'hbd)} ^ (|(8'h9f))), {(!(8'ha6)), ((8'ha6) ? (8'hbf) : (8'hb4))}} ? {(((8'hbf) == (8'h9c)) < (^~(8'h9d))), {{(8'hae), (8'h9c)}}} : (({(8'ha6)} ? (~|(8'ha4)) : (&(8'hb4))) ? ((8'ha0) ? ((8'hb7) ? (8'hbd) : (8'ha5)) : ((8'hac) <<< (8'hba))) : (((8'hb7) * (8'h9f)) ? ((7'h41) * (8'hbe)) : {(8'ha9)}))) : (((~|(^~(8'ha3))) >= {((8'hb6) - (7'h40)), ((8'hb8) <<< (8'hbb))}) ? (-{(!(8'ha3))}) : (~^(^~((8'hba) ? (8'ha0) : (7'h40)))))), 
parameter param200 = {(~^({param199} << (|(-param199))))})
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h3e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire112;
  input wire [(5'h10):(1'h0)] wire111;
  input wire signed [(4'hb):(1'h0)] wire110;
  input wire signed [(5'h14):(1'h0)] wire109;
  wire signed [(5'h10):(1'h0)] wire198;
  wire [(4'hb):(1'h0)] wire195;
  wire [(2'h3):(1'h0)] wire194;
  wire [(4'hd):(1'h0)] wire181;
  wire signed [(5'h15):(1'h0)] wire180;
  wire signed [(4'hd):(1'h0)] wire179;
  wire signed [(4'h9):(1'h0)] wire178;
  wire [(4'hc):(1'h0)] wire173;
  wire [(3'h4):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire125;
  wire [(4'he):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  reg signed [(4'he):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg196 = (1'h0);
  reg [(4'hc):(1'h0)] reg193 = (1'h0);
  reg [(4'he):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg190 = (1'h0);
  reg [(4'ha):(1'h0)] reg189 = (1'h0);
  reg [(5'h10):(1'h0)] reg188 = (1'h0);
  reg [(5'h14):(1'h0)] reg187 = (1'h0);
  reg [(4'h8):(1'h0)] reg186 = (1'h0);
  reg [(2'h3):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg182 = (1'h0);
  reg [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg174 = (1'h0);
  reg [(3'h6):(1'h0)] reg172 = (1'h0);
  reg [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(4'h9):(1'h0)] reg170 = (1'h0);
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(4'he):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg165 = (1'h0);
  reg [(3'h5):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg162 = (1'h0);
  reg [(3'h4):(1'h0)] reg161 = (1'h0);
  reg [(5'h14):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg159 = (1'h0);
  reg [(3'h4):(1'h0)] reg158 = (1'h0);
  reg [(4'ha):(1'h0)] reg157 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(5'h14):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg [(4'hd):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(5'h10):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  assign y = {wire198,
                 wire195,
                 wire194,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire173,
                 wire146,
                 wire145,
                 wire125,
                 wire124,
                 wire114,
                 wire113,
                 reg197,
                 reg196,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
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
                 reg147,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire113 = wire111;
  assign wire114 = wire110[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg115 <= ((wire114 ?
              $unsigned((|$unsigned(wire114))) : ((~&(wire114 << wire109)) ?
                  $unsigned($signed(wire109)) : ($unsigned(wire113) - {(8'ha5),
                      (8'h9d)}))) ?
          (~{(8'hbb),
              {(&wire113),
                  (&wire114)}}) : (~$signed(($signed(wire109) || ((8'ha5) + (8'hb7))))));
      reg116 <= (wire113[(3'h6):(3'h6)] ?
          (~&(wire109[(4'hb):(3'h4)] ?
              {$signed((8'hbe)), $unsigned(wire112)} : $signed({wire114,
                  (7'h44)}))) : wire110[(3'h6):(3'h5)]);
      if (wire111[(1'h1):(1'h1)])
        begin
          reg117 <= $signed(({(~&$unsigned(reg116))} ~^ {reg115}));
          reg118 <= reg115;
          reg119 <= (~|reg115[(4'hb):(4'h8)]);
          reg120 <= wire112[(3'h7):(1'h1)];
          reg121 <= wire112[(3'h5):(2'h2)];
        end
      else
        begin
          reg117 <= (reg119 ? $unsigned(reg119) : $signed((-wire114)));
        end
      reg122 <= wire114;
      reg123 <= reg120[(1'h1):(1'h0)];
    end
  assign wire124 = (reg123[(3'h6):(3'h5)] ~^ (reg117 ?
                       ($unsigned($signed(reg123)) ^ reg121) : reg122));
  assign wire125 = reg118;
  always
    @(posedge clk) begin
      if (wire114)
        begin
          reg126 <= (|$signed((^reg122[(5'h13):(4'hc)])));
        end
      else
        begin
          if ($signed($unsigned(wire125)))
            begin
              reg126 <= $signed((8'hb4));
              reg127 <= $unsigned(reg123);
            end
          else
            begin
              reg126 <= wire124[(4'hb):(1'h0)];
              reg127 <= $signed($unsigned((!$unsigned(reg116[(4'hb):(4'hb)]))));
              reg128 <= ((reg115 ? (^~wire110) : reg122) ?
                  $unsigned((~&{((8'hb6) - wire114),
                      wire114[(3'h5):(1'h0)]})) : wire125);
              reg129 <= reg117;
            end
        end
      reg130 <= ($unsigned({$unsigned($unsigned((8'hbc))), (8'ha7)}) ?
          reg129[(1'h0):(1'h0)] : (|reg115[(1'h0):(1'h0)]));
      if ({{wire110, reg127},
          ($unsigned({wire114[(3'h6):(3'h4)]}) ?
              $unsigned({((8'hb4) ? (8'ha4) : reg118),
                  ((8'hb3) ?
                      reg129 : reg130)}) : $signed((((8'hb3) * (8'hba)) && {reg127,
                  reg118})))})
        begin
          if ((8'hbb))
            begin
              reg131 <= reg123[(3'h7):(1'h1)];
              reg132 <= $unsigned(reg115);
            end
          else
            begin
              reg131 <= ($signed($unsigned(((wire113 >>> (8'hb8)) << ((7'h44) ?
                  reg121 : reg128)))) > ($signed(reg115[(2'h3):(1'h1)]) && $signed((((8'hbc) > reg123) ?
                  (reg132 != reg123) : {wire111}))));
              reg132 <= (reg131 < (&$signed($signed((reg116 ?
                  wire124 : wire124)))));
              reg133 <= (~^$signed(wire112[(3'h5):(2'h3)]));
            end
          reg134 <= ((-($unsigned($unsigned(wire109)) <= (~$signed((8'hbf))))) ^ (wire109 ?
              wire113 : $signed(reg123[(1'h0):(1'h0)])));
          reg135 <= $unsigned({reg128});
        end
      else
        begin
          reg131 <= (reg120[(3'h4):(2'h3)] ?
              (($unsigned((reg118 ? reg130 : reg134)) ?
                      (^(+reg135)) : ($unsigned(reg121) ?
                          $unsigned((8'ha8)) : (wire124 ? reg129 : reg133))) ?
                  (^~reg115) : (~(~^{reg122}))) : $unsigned({((wire112 ?
                      reg123 : wire124) >>> (reg130 >> wire114))}));
          reg132 <= $signed(reg132);
        end
      if (reg122[(5'h13):(5'h13)])
        begin
          reg136 <= (~|((wire125[(2'h2):(1'h1)] > (^$signed(reg118))) ?
              reg116 : ((reg115[(4'hd):(4'h8)] > (8'ha4)) ?
                  reg135[(3'h5):(1'h0)] : ((~^reg123) ?
                      reg131 : (reg117 ? reg133 : reg133)))));
          if ((-reg121[(5'h13):(4'hb)]))
            begin
              reg137 <= ($unsigned({$signed((^reg121)),
                      $unsigned(reg136[(4'h9):(4'h8)])}) ?
                  ((wire112 ?
                          reg132[(4'ha):(1'h0)] : $unsigned((reg135 ?
                              wire125 : reg123))) ?
                      $signed(reg134[(4'he):(2'h3)]) : ({(-wire114),
                          (~^(8'hb0))} == {$signed((8'ha7))})) : $signed((~|(|(&wire125)))));
              reg138 <= ({(~&($unsigned(reg136) * (reg126 ? reg133 : reg123))),
                  (8'hac)} >= reg128);
              reg139 <= ((~^$unsigned(reg136[(4'ha):(2'h3)])) >>> ({wire113[(3'h7):(3'h7)],
                  (8'hba)} ~^ (($signed(wire124) & (~^wire111)) ?
                  (~|$unsigned(reg116)) : {reg134[(4'hd):(3'h7)]})));
            end
          else
            begin
              reg137 <= reg135;
              reg138 <= $unsigned(reg126[(2'h2):(1'h0)]);
              reg139 <= $unsigned($signed((8'ha3)));
              reg140 <= (|$signed($unsigned($signed($unsigned((8'ha2))))));
              reg141 <= {{(reg140 - ((~|wire109) ?
                          (reg115 ?
                              (8'haa) : wire125) : reg135[(3'h5):(1'h0)]))},
                  reg115[(4'hb):(4'h8)]};
            end
          reg142 <= $signed(reg121);
          reg143 <= $signed(reg140);
        end
      else
        begin
          reg136 <= (-reg142[(4'hc):(3'h6)]);
        end
      reg144 <= reg142[(1'h1):(1'h0)];
    end
  assign wire145 = $unsigned(reg130);
  assign wire146 = $signed(reg130[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      if ((8'hba))
        begin
          if (wire124)
            begin
              reg147 <= wire145[(5'h13):(3'h7)];
              reg148 <= reg134[(4'ha):(3'h5)];
              reg149 <= (reg123[(4'h8):(2'h3)] ?
                  (reg140[(5'h12):(3'h4)] <= $signed($unsigned($signed(reg118)))) : (((~&(-reg140)) != $signed((wire124 && (8'hb6)))) == (&($signed(wire125) ?
                      (reg117 ? (8'hbb) : wire145) : (reg116 ^ reg148)))));
            end
          else
            begin
              reg147 <= $unsigned(((reg121 - (+(reg141 ?
                  reg148 : reg134))) + $unsigned((((8'hbc) >> (8'hbc)) <= (7'h41)))));
              reg148 <= (&reg135[(1'h1):(1'h1)]);
              reg149 <= ((~reg129[(3'h5):(1'h0)]) ?
                  $unsigned($signed($signed($signed(reg131)))) : (^~(($signed(reg128) ^~ $unsigned((8'ha0))) >> ($signed(wire146) ?
                      (reg119 ? (7'h40) : reg127) : $unsigned(wire111)))));
              reg150 <= $signed({reg123, reg116[(3'h7):(2'h3)]});
              reg151 <= reg138[(2'h3):(2'h3)];
            end
          reg152 <= ($unsigned((~^$signed(reg141[(2'h2):(2'h2)]))) ?
              $signed((reg140[(3'h6):(1'h1)] ?
                  ((reg144 ? reg136 : (7'h44)) | (reg137 ?
                      wire125 : reg136)) : (wire110 << reg147))) : ($unsigned({reg120,
                  (+reg147)}) * $signed($signed($unsigned(reg116)))));
          reg153 <= $unsigned(((reg119[(1'h0):(1'h0)] ?
              $signed((reg132 < reg152)) : reg117) <= $unsigned(reg142[(3'h5):(3'h4)])));
        end
      else
        begin
          if (reg139[(4'ha):(2'h2)])
            begin
              reg147 <= $unsigned($unsigned($unsigned((reg116 ~^ $unsigned(wire113)))));
              reg148 <= reg122[(2'h2):(1'h1)];
              reg149 <= ((~|($signed(reg129) | ($unsigned(reg138) ^ $unsigned(reg153)))) ?
                  ((~($unsigned(wire113) >>> reg119[(2'h2):(1'h1)])) ?
                      $unsigned($unsigned((!reg135))) : reg136) : reg120[(3'h6):(3'h5)]);
            end
          else
            begin
              reg147 <= $signed((8'ha5));
              reg148 <= reg121[(4'he):(3'h7)];
            end
          reg150 <= $unsigned(reg138[(5'h10):(4'hb)]);
          reg151 <= reg130[(2'h2):(1'h0)];
          reg152 <= $unsigned((+((reg144[(2'h2):(1'h1)] << (^~reg131)) && reg132)));
        end
      reg154 <= wire114;
      reg155 <= reg123[(3'h5):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg156 <= (-(reg149 < (reg140 ?
          $signed($signed((8'hb9))) : $unsigned((~|wire145)))));
      reg157 <= reg147;
      reg158 <= $unsigned({(^$unsigned(reg129))});
      if ((reg126 ?
          $unsigned((|reg128[(4'hc):(3'h6)])) : reg123[(4'hb):(2'h2)]))
        begin
          reg159 <= wire125;
        end
      else
        begin
          reg159 <= (~&$signed($signed(reg152)));
          reg160 <= (|((|(8'hac)) ?
              (8'ha3) : (((reg117 | wire109) * $unsigned(wire125)) >> ($signed(reg147) ?
                  (reg135 << (8'hb9)) : reg127))));
          reg161 <= (((8'haf) ?
              {(|(reg117 + reg120))} : {((~reg128) ?
                      $unsigned(reg157) : $unsigned(reg128))}) | ($signed($unsigned(wire124[(2'h3):(2'h3)])) ?
              (({wire113} ? wire110[(1'h1):(1'h1)] : $signed(reg132)) ?
                  ($signed(reg149) ?
                      (reg126 ?
                          reg160 : (8'hb5)) : reg148) : reg136[(3'h6):(2'h2)]) : $unsigned($signed($unsigned(reg126)))));
        end
    end
  always
    @(posedge clk) begin
      reg162 <= $unsigned(reg160);
      reg163 <= $signed(wire109);
      reg164 <= $unsigned(reg163[(5'h12):(5'h12)]);
      if (reg120)
        begin
          if ((+reg156[(4'h8):(1'h1)]))
            begin
              reg165 <= (~|$unsigned($signed(wire111[(4'h9):(4'h8)])));
              reg166 <= reg154[(3'h6):(3'h6)];
              reg167 <= wire145[(5'h11):(4'hc)];
            end
          else
            begin
              reg165 <= (^~($unsigned((8'hb7)) + (~|(^~reg140))));
            end
        end
      else
        begin
          if (reg154)
            begin
              reg165 <= $unsigned($unsigned(reg160));
              reg166 <= (|{(^~(-(reg143 ? (8'hb8) : reg129)))});
              reg167 <= $signed((~$unsigned(reg128)));
            end
          else
            begin
              reg165 <= $signed(($unsigned(((reg149 ?
                      reg135 : reg162) <= (reg139 ^ reg154))) ?
                  $unsigned(((reg126 ? reg123 : (8'hb8)) ?
                      reg140 : ((8'ha9) * (8'h9e)))) : ({reg160} >>> $signed((reg166 ?
                      reg135 : reg126)))));
              reg166 <= ((reg150 ^~ $signed($signed((reg127 ?
                      wire111 : reg131)))) ?
                  $signed($unsigned({(8'ha1)})) : {$signed($unsigned($unsigned(reg144)))});
            end
          reg168 <= (8'haa);
          if ($unsigned($signed((~^((reg148 ?
              (8'hb1) : reg128) > $signed(wire146))))))
            begin
              reg169 <= $signed({(($unsigned(reg118) <= reg138) ?
                      (^(wire109 ? reg128 : reg138)) : {{reg162}})});
              reg170 <= (reg137[(2'h2):(1'h0)] ?
                  ((!($unsigned(reg116) ? {wire125, reg153} : (~&wire109))) ?
                      reg141 : (reg117[(5'h12):(4'h9)] ?
                          reg162 : (!((8'ha0) * (8'ha4))))) : reg144[(1'h1):(1'h1)]);
            end
          else
            begin
              reg169 <= (reg154[(4'hc):(4'hc)] ?
                  $unsigned(reg135) : $unsigned(($signed($signed(reg144)) && (wire114 ?
                      (reg160 * reg155) : {reg170, reg121}))));
              reg170 <= {($unsigned($unsigned((~reg152))) != {$signed($unsigned(reg152))})};
              reg171 <= $signed(($signed(wire146[(2'h3):(2'h2)]) ^~ reg149));
              reg172 <= reg129;
            end
        end
    end
  assign wire173 = wire111;
  always
    @(posedge clk) begin
      reg174 <= wire113;
      reg175 <= $signed(reg136[(5'h10):(4'h8)]);
      reg176 <= (reg153 ?
          (($signed($signed(reg174)) ?
                  reg152 : ($unsigned(wire145) ? {(8'ha4)} : reg174)) ?
              $signed((reg121 ?
                  (+(7'h41)) : (8'hb3))) : (wire145[(2'h3):(1'h0)] & ({reg134} ?
                  ((8'hb4) && reg161) : (reg162 << reg148)))) : (($signed($signed(reg141)) | $unsigned((wire112 ?
              reg133 : reg143))) ^~ $unsigned((+(reg119 ?
              (8'hb3) : wire110)))));
      reg177 <= ((({{reg150}, $signed(reg116)} > (|$unsigned(wire110))) ?
              reg161[(2'h2):(2'h2)] : reg174[(3'h4):(3'h4)]) ?
          (((^~(reg122 ? reg139 : reg127)) ^ (wire145 ?
              {reg164,
                  reg127} : (reg116 >>> (8'haf)))) >> ((reg131 <<< reg144[(3'h4):(3'h4)]) ?
              ((reg132 ^~ reg174) << (8'h9f)) : reg135[(2'h3):(1'h1)])) : (reg128 ?
              reg135 : reg161));
    end
  assign wire178 = (^(!(wire112[(3'h4):(1'h1)] ?
                       {(^reg152)} : $unsigned($unsigned(reg116)))));
  assign wire179 = reg151;
  assign wire180 = $unsigned($unsigned((!reg121[(4'he):(4'hb)])));
  assign wire181 = ((-(reg116 ?
                           reg175[(3'h6):(3'h4)] : $signed($unsigned(reg175)))) ?
                       ((wire125[(3'h5):(2'h3)] ?
                           $unsigned($signed(reg133)) : {(-(8'ha3)),
                               {wire145}}) > (-(wire109[(4'h9):(2'h3)] ?
                           ((8'ha8) >= wire114) : reg172[(1'h0):(1'h0)]))) : $signed((+$unsigned((reg175 ?
                           reg159 : reg155)))));
  always
    @(posedge clk) begin
      if ((reg151 ? reg170[(1'h0):(1'h0)] : wire125))
        begin
          reg182 <= ($unsigned((~((reg122 & (8'hb2)) & ((7'h44) < reg161)))) ?
              {(reg144[(2'h2):(2'h2)] < reg152[(4'he):(4'hb)])} : wire111);
          reg183 <= $signed(reg130);
          if ($signed($signed($unsigned((^(reg163 ^~ reg175))))))
            begin
              reg184 <= (reg133[(2'h3):(1'h0)] >>> $signed({{$unsigned(wire111),
                      $signed(reg157)}}));
              reg185 <= (-reg182[(1'h0):(1'h0)]);
              reg186 <= (^wire110);
              reg187 <= reg164[(2'h3):(1'h1)];
            end
          else
            begin
              reg184 <= (+($unsigned(reg177[(1'h1):(1'h1)]) ?
                  {reg168,
                      reg142[(3'h5):(1'h0)]} : $unsigned((!$signed(wire180)))));
              reg185 <= reg171;
            end
          reg188 <= ((^~{({reg122} >= reg174)}) ^ {(reg127 ^ {(~^reg155)}),
              {((reg147 ? reg176 : reg167) ?
                      (reg118 ? wire109 : (7'h44)) : {wire124})}});
          reg189 <= ($signed(wire145) < $unsigned((^~(reg156 == ((8'hbe) ?
              reg148 : reg141)))));
        end
      else
        begin
          reg182 <= (($unsigned((8'h9e)) ?
                  (({wire111} >= wire173) ?
                      $unsigned((+wire113)) : $unsigned({reg169})) : (+(^~(reg142 <= reg149)))) ?
              ((&wire124[(1'h0):(1'h0)]) ?
                  ($signed($unsigned(reg127)) ?
                      {$signed(reg127)} : (^(wire124 * wire145))) : ($unsigned(wire113) ?
                      ($unsigned(wire114) ?
                          wire113 : reg144[(3'h4):(1'h1)]) : reg163[(3'h7):(1'h0)])) : wire125[(2'h2):(1'h1)]);
          reg183 <= {{($unsigned(((8'hba) ?
                      reg147 : (8'hb0))) || (^~$unsigned(reg164)))},
              ((~(reg120 ?
                  (reg164 || reg162) : {reg186})) | reg140[(4'hc):(2'h3)])};
          if ({(8'ha9)})
            begin
              reg184 <= (((+$unsigned(reg161[(3'h4):(2'h3)])) < {((reg136 | wire179) ?
                      reg121[(3'h6):(2'h3)] : (+reg184))}) ^ ((-reg139) ?
                  {({reg128} != (^reg156))} : reg141[(2'h3):(2'h3)]));
              reg185 <= $signed(($unsigned($signed($unsigned(wire180))) ?
                  reg116 : (~^(reg128 || reg150[(3'h5):(2'h3)]))));
            end
          else
            begin
              reg184 <= $signed(reg183[(1'h1):(1'h1)]);
              reg185 <= {{reg115[(1'h1):(1'h1)],
                      ((!reg115[(4'hd):(3'h6)]) != $unsigned((&(8'h9c))))},
                  ((~^$unsigned((^~reg172))) <= wire125)};
              reg186 <= reg139[(3'h4):(3'h4)];
            end
        end
      reg190 <= ((reg121[(5'h12):(2'h2)] != ($unsigned($unsigned(reg189)) ?
              (reg130[(3'h6):(3'h4)] ?
                  (reg127 ? reg188 : wire173) : (+reg160)) : reg186)) ?
          $signed((^{$unsigned(reg186),
              reg177[(1'h0):(1'h0)]})) : (~|($unsigned(wire173[(3'h6):(1'h0)]) ?
              $unsigned((|wire178)) : reg163)));
      reg191 <= {(!(($signed((8'h9f)) ?
              (+reg158) : (-reg157)) < ($signed(wire180) ~^ reg129)))};
      reg192 <= $signed((reg147 ?
          $unsigned($signed((reg126 ?
              reg127 : reg176))) : $unsigned(((reg188 | (8'hb0)) ?
              reg163 : $unsigned(wire110)))));
      reg193 <= ($unsigned($signed(((reg158 ?
          reg187 : wire145) && reg117))) != reg175[(3'h4):(2'h2)]);
    end
  assign wire194 = $signed((reg140[(1'h1):(1'h0)] ^~ wire113));
  assign wire195 = ((7'h42) ?
                       ((^~reg156) ?
                           (wire178 <<< wire113) : reg150) : (~&reg150));
  always
    @(posedge clk) begin
      reg196 <= $signed((8'haa));
      reg197 <= reg150;
    end
  assign wire198 = reg142;
endmodule

module module80
#(parameter param102 = ((~|{(((8'ha3) ? (8'hbe) : (7'h40)) - {(8'hab), (7'h43)})}) ? (~^(((&(8'hb2)) ? (&(8'hb7)) : ((8'ha9) * (8'hbe))) >= (8'hbe))) : (^{{{(8'ha9), (7'h41)}}, (&((8'h9d) ? (8'h9d) : (8'hb0)))})), 
parameter param103 = ({(+(^~(param102 <= param102)))} ~^ (((~|(|param102)) ^ {(&param102)}) <= (({(8'hb3)} ? (8'hb8) : param102) ? param102 : ((-param102) ? {param102, param102} : (+param102))))))
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire84;
  input wire signed [(3'h4):(1'h0)] wire83;
  input wire signed [(5'h10):(1'h0)] wire82;
  input wire [(4'hd):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire94,
                 wire87,
                 wire86,
                 wire85,
                 reg96,
                 reg95,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire85 = (8'ha7);
  assign wire86 = $unsigned($unsigned($signed(($signed((8'hbf)) ?
                      wire84[(3'h6):(1'h1)] : $unsigned(wire85)))));
  assign wire87 = $unsigned((-wire86[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      if (wire86[(3'h5):(3'h4)])
        begin
          if ($unsigned(($unsigned(wire82[(4'hc):(4'hc)]) >= $unsigned(wire85))))
            begin
              reg88 <= wire84[(3'h6):(3'h6)];
              reg89 <= $signed(((((+wire85) <= ((8'ha0) ? wire84 : reg88)) ?
                  {$unsigned(wire82),
                      $signed(wire86)} : wire83[(3'h4):(1'h0)]) ^~ (&((-(8'hab)) ?
                  (+wire84) : (wire86 ? reg88 : wire87)))));
            end
          else
            begin
              reg88 <= ({wire84,
                      (!(wire87[(3'h7):(2'h2)] ?
                          {wire87} : $unsigned((8'ha2))))} ?
                  wire86[(1'h0):(1'h0)] : {((((8'hac) ?
                          wire85 : wire84) ^ wire85[(4'hb):(4'h8)]) <= $unsigned($unsigned(reg88)))});
              reg89 <= $unsigned($signed({$signed($signed((8'ha0)))}));
            end
          reg90 <= ((wire82 * $unsigned({{wire82, reg89}, {wire86, wire86}})) ?
              {($signed($signed(reg88)) < $signed(reg88)),
                  (~^(|$unsigned(wire85)))} : (wire87[(4'ha):(3'h6)] ?
                  ((wire87 + (!wire87)) > (|wire85[(1'h1):(1'h1)])) : (~$unsigned(wire87))));
          reg91 <= ($signed((-wire86)) ^~ {wire86,
              ($unsigned(((8'hb4) ?
                  wire86 : wire83)) ^~ $unsigned((^~(8'ha3))))});
          reg92 <= (reg88 | reg89[(4'h9):(3'h5)]);
        end
      else
        begin
          reg88 <= wire86;
        end
      reg93 <= ((((wire86 ? reg91 : (wire81 ? reg91 : reg88)) ?
                  wire84[(4'h8):(3'h7)] : (reg90[(4'ha):(4'h9)] | $signed(wire87))) ?
              $signed(reg89) : reg90) ?
          (+reg91[(4'h9):(3'h5)]) : (({$unsigned(wire83), (&(8'ha2))} ?
              (wire87[(4'hc):(1'h0)] ?
                  $signed(reg91) : reg92[(3'h7):(2'h2)]) : wire83) >> wire87));
    end
  assign wire94 = $signed(($unsigned(($unsigned((8'hb6)) | wire87)) ?
                      ($signed($signed(wire87)) ?
                          {((8'hb4) + reg92)} : wire87[(2'h3):(1'h0)]) : wire84));
  always
    @(posedge clk) begin
      reg95 <= $signed({(~^(+reg88[(4'h9):(3'h7)])), wire81[(4'hb):(4'h9)]});
      reg96 <= (wire83[(1'h0):(1'h0)] ?
          $signed(((8'had) < (reg95 << wire94))) : (wire87[(2'h3):(2'h3)] >> $signed(wire94)));
    end
  assign wire97 = (+(($unsigned((^reg96)) ? (8'hb4) : (~&{reg88})) ?
                      (reg92 ?
                          $unsigned((reg93 ? (8'ha0) : wire81)) : {(reg91 ?
                                  wire82 : (7'h40)),
                              reg89}) : wire83[(1'h1):(1'h1)]));
  assign wire98 = ({(wire86[(3'h5):(3'h5)] >= wire97)} ?
                      reg95 : $unsigned(($signed((reg96 || (8'ha5))) ?
                          $unsigned((7'h41)) : (8'h9e))));
  assign wire99 = (~^wire98);
  assign wire100 = (~wire99);
  assign wire101 = wire84[(3'h4):(2'h3)];
endmodule

module module47
#(parameter param71 = (-(({{(8'ha6)}} | (~{(7'h43)})) | ((8'ha5) ? ((7'h40) <= ((8'hbd) && (8'hb1))) : {(8'hae)}))))
(y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire51;
  input wire signed [(5'h10):(1'h0)] wire50;
  input wire signed [(5'h12):(1'h0)] wire49;
  input wire [(5'h15):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire52;
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 reg53,
                 (1'h0)};
  assign wire52 = {$signed($unsigned((+{wire50, (8'hbc)}))),
                      $signed($unsigned(((wire50 ?
                          wire50 : wire51) ^ $unsigned(wire48))))};
  always
    @(posedge clk) begin
      reg53 <= (-(8'hb1));
    end
  assign wire54 = $unsigned(wire50[(1'h1):(1'h0)]);
  assign wire55 = wire49[(2'h2):(1'h0)];
  assign wire56 = (^~((reg53 < $signed($signed(wire49))) ?
                      wire50[(4'hf):(3'h6)] : wire48[(1'h1):(1'h1)]));
  assign wire57 = (~&{$unsigned({{(8'hb5), wire56}})});
  assign wire58 = $unsigned(wire49[(3'h4):(3'h4)]);
  assign wire59 = ((wire58[(2'h2):(2'h2)] ~^ wire54) ?
                      (+$unsigned(wire52)) : (((+wire55[(3'h4):(2'h3)]) ?
                              (wire48 <= (wire52 < reg53)) : wire48[(4'hb):(4'h8)]) ?
                          ({$signed(wire57), {wire56}} == ((-wire52) ?
                              ((7'h43) ?
                                  (7'h44) : (8'hb3)) : wire49)) : wire48));
  assign wire60 = {wire59, (-(&({wire58} & wire58[(4'h8):(3'h6)])))};
  assign wire61 = $unsigned((((&wire60[(3'h5):(1'h0)]) || ($unsigned(wire52) & wire50[(4'hf):(4'hf)])) ?
                      $signed(((&(8'hb3)) ?
                          (wire60 ? reg53 : wire60) : wire54)) : wire57));
  assign wire62 = wire61;
  assign wire63 = {$unsigned((((~^wire55) ?
                              wire57[(2'h3):(2'h2)] : $signed(wire49)) ?
                          (wire62[(1'h0):(1'h0)] ^ $signed(wire48)) : ($unsigned(wire49) ?
                              reg53[(1'h1):(1'h0)] : $signed(wire58)))),
                      (+(&wire54[(3'h6):(3'h5)]))};
  assign wire64 = {wire56, wire57};
  assign wire65 = $unsigned($unsigned(((~&(wire51 ? wire59 : reg53)) ?
                      wire54[(3'h4):(1'h1)] : (~&(wire54 > wire61)))));
  assign wire66 = $unsigned(((~&(~|wire62)) - (^wire54[(3'h7):(1'h0)])));
  assign wire67 = (($signed($unsigned((wire66 != (8'ha7)))) || wire51[(4'hb):(4'h8)]) > (wire55[(3'h5):(2'h3)] ?
                      {($unsigned(wire48) ?
                              wire62 : ((8'hb5) ? wire48 : wire58))} : (wire61 ?
                          wire58 : wire50[(4'he):(4'hc)])));
  assign wire68 = wire62;
  assign wire69 = $unsigned(wire48[(2'h3):(2'h3)]);
  assign wire70 = wire63;
endmodule

module module20
#(parameter param38 = ((^~(&({(8'hb6)} ? ((8'haf) - (8'hb6)) : ((8'haa) ? (8'hab) : (8'ha6))))) ? ((|((-(8'h9d)) ~^ ((8'ha9) > (8'hb9)))) >>> (-((~&(8'hb9)) ? (!(8'hb4)) : {(8'ha5), (8'ha4)}))) : ((((!(8'ha0)) ? ((8'ha0) ? (8'h9f) : (8'hab)) : ((8'haa) <= (8'hb9))) ? (!(8'ha5)) : (-((8'hb0) >>> (8'h9c)))) + (&((8'hba) << (!(8'ha9)))))), 
parameter param39 = param38)
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire24;
  input wire [(3'h4):(1'h0)] wire23;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire [(3'h6):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 (1'h0)};
  assign wire25 = wire21[(3'h6):(3'h5)];
  assign wire26 = ((wire22[(3'h7):(3'h5)] ~^ (^(8'ha0))) ?
                      $signed($unsigned((wire22 + {wire22,
                          wire24}))) : $unsigned(((wire25[(4'he):(2'h2)] != wire24) ^ ((wire24 < wire23) == wire23))));
  assign wire27 = (~^(wire23[(1'h1):(1'h1)] <<< $unsigned($unsigned((wire24 >>> wire26)))));
  assign wire28 = wire26[(4'hb):(3'h4)];
  assign wire29 = {$unsigned(($signed((wire27 ? wire28 : wire26)) ?
                          ((wire24 ^~ (8'haa)) ?
                              (wire25 ?
                                  wire22 : (8'hb2)) : $signed(wire24)) : wire25[(4'hb):(4'ha)])),
                      (wire26[(5'h10):(4'hc)] ?
                          wire21 : (!((wire22 < wire28) << (~&(8'ha8)))))};
  assign wire30 = (wire23[(2'h3):(2'h3)] ?
                      $unsigned({$signed(wire29)}) : wire25);
  assign wire31 = $unsigned(wire21);
  assign wire32 = wire28[(3'h7):(2'h3)];
  assign wire33 = ((($signed((wire24 == (8'hbb))) != $signed($unsigned(wire27))) ^~ (8'ha5)) <= ((-{{wire31}}) ?
                      wire24 : (wire26 ? $unsigned($signed(wire29)) : wire21)));
  assign wire34 = (wire22 ?
                      (8'ha4) : $signed($unsigned((((8'h9c) - wire23) ~^ ((8'hab) ~^ wire31)))));
  assign wire35 = ($signed(wire33) ?
                      $unsigned(((|{wire32}) >>> ((wire32 ? wire25 : wire28) ?
                          (~wire29) : (^wire26)))) : wire26);
  assign wire36 = wire35[(4'ha):(1'h1)];
  assign wire37 = {$unsigned((8'ha7)),
                      (wire27 ?
                          $signed($unsigned(wire34[(4'hb):(1'h0)])) : (((~^wire30) ?
                              (7'h40) : $unsigned(wire36)) >> {(wire24 ?
                                  wire34 : wire32)}))};
endmodule
