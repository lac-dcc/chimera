module top
#(parameter param216 = ({(!(~^(+(8'haa)))), (~^(~((7'h41) ^~ (8'hbf))))} ? ({(~^((8'h9e) ? (8'ha6) : (8'hb7)))} == (~&((^(8'haf)) ? ((8'hbc) ? (8'ha6) : (8'hb5)) : ((8'h9c) ? (8'h9d) : (7'h44))))) : (^~((((8'hb7) & (7'h40)) ? ((8'ha8) ? (8'hba) : (8'haf)) : ((8'hac) <<< (7'h44))) ? (((8'hb3) ~^ (8'hb1)) ? (^~(8'hbe)) : (-(8'h9e))) : (((8'ha8) && (8'hb3)) < (^~(8'hac)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire215;
  wire signed [(2'h3):(1'h0)] wire214;
  wire [(5'h11):(1'h0)] wire213;
  wire [(3'h4):(1'h0)] wire195;
  wire [(4'hc):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire103;
  wire [(2'h3):(1'h0)] wire197;
  wire signed [(4'he):(1'h0)] wire198;
  wire [(5'h11):(1'h0)] wire199;
  wire [(3'h4):(1'h0)] wire200;
  reg signed [(4'h8):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg211 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg209 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg208 = (1'h0);
  reg [(3'h6):(1'h0)] reg207 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg204 = (1'h0);
  reg [(4'ha):(1'h0)] reg203 = (1'h0);
  reg [(4'h9):(1'h0)] reg202 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire215,
                 wire214,
                 wire213,
                 wire195,
                 wire5,
                 wire6,
                 wire7,
                 wire103,
                 wire197,
                 wire198,
                 wire199,
                 wire200,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (wire1[(3'h7):(3'h4)] ?
                     (($unsigned(wire4) == $signed($signed((8'hb9)))) != wire4[(4'h8):(3'h7)]) : (wire0 ^ wire0[(3'h6):(3'h5)]));
  assign wire6 = $unsigned($unsigned((~|{$signed(wire0),
                     wire3[(3'h4):(2'h2)]})));
  assign wire7 = wire5[(4'ha):(3'h5)];
  always
    @(posedge clk) begin
      reg8 <= ((-wire1[(4'h9):(1'h0)]) ?
          ((~|$unsigned($signed(wire3))) >>> ((wire0[(3'h5):(3'h4)] ?
              wire1[(3'h4):(2'h2)] : wire4[(3'h5):(3'h4)]) && (((7'h40) * (8'hb0)) ?
              (wire5 ~^ wire4) : (7'h43)))) : $signed($signed($unsigned($signed(wire2)))));
      reg9 <= {wire0};
    end
  module10 #() modinst104 (wire103, clk, wire2, wire1, wire4, wire6, wire7);
  module105 #() modinst196 (wire195, clk, wire1, wire6, wire2, reg8);
  assign wire197 = (+(($unsigned((wire195 ? wire195 : reg8)) ?
                           wire3[(2'h2):(1'h1)] : $signed($signed(wire1))) ?
                       ($unsigned((reg8 ?
                           wire3 : wire2)) >> $signed($unsigned(wire1))) : $unsigned(($unsigned((8'ha3)) <= $unsigned(wire0)))));
  assign wire198 = (((wire197 ?
                               $unsigned((wire0 + wire103)) : (^$unsigned(wire3))) ?
                           $signed(reg9[(2'h2):(2'h2)]) : {(!(wire195 ~^ reg9))}) ?
                       wire0 : $unsigned(wire197));
  assign wire199 = ((&$signed((^~(^~wire2)))) ^ (((^~wire103) ?
                       $signed((wire6 ?
                           wire6 : reg9)) : wire2) ~^ $signed(wire5)));
  module123 #() modinst201 (.wire127(wire4), .wire125(wire6), .wire126(wire0), .clk(clk), .y(wire200), .wire124(reg8));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg202 <= (reg8[(3'h7):(3'h7)] ?
              wire200[(1'h1):(1'h0)] : (reg8 ?
                  (((+reg9) ^~ {reg8, wire3}) ?
                      {(^wire103),
                          (wire2 | (8'hb7))} : (~$signed(wire200))) : {{wire199}}));
          reg203 <= ((+wire200[(2'h3):(1'h0)]) ?
              {wire0[(1'h0):(1'h0)],
                  reg202[(3'h6):(1'h0)]} : $unsigned(wire198[(2'h3):(2'h3)]));
          reg204 <= wire199;
          reg205 <= ((wire0 >> ((!(wire195 ? wire195 : wire103)) ?
                  (wire0[(4'he):(3'h6)] ?
                      (|reg202) : (wire2 <= wire7)) : (^$unsigned(reg202)))) ?
              $signed($signed(wire1[(1'h1):(1'h0)])) : $signed(wire5[(2'h3):(2'h2)]));
          reg206 <= $unsigned((wire197 ?
              (wire195 && (|$signed(wire5))) : {(~^$signed(reg205)),
                  $unsigned(wire198[(2'h2):(1'h1)])}));
        end
      else
        begin
          reg202 <= wire0;
          reg203 <= (8'ha0);
        end
      if (wire198[(3'h7):(2'h2)])
        begin
          reg207 <= wire4[(5'h11):(4'hb)];
          reg208 <= (|wire197[(1'h1):(1'h1)]);
          if ((^~$signed((reg208 && (((8'ha9) ^ wire2) ?
              $unsigned(wire195) : $signed(wire199))))))
            begin
              reg209 <= (+reg206);
              reg210 <= $signed(reg8[(5'h10):(4'hd)]);
              reg211 <= (({((reg8 ? wire1 : wire7) ?
                      {wire0, (8'hbd)} : wire198[(2'h3):(2'h2)]),
                  $signed((^wire200))} * wire3) >= wire198);
              reg212 <= wire199;
            end
          else
            begin
              reg209 <= reg204[(3'h4):(2'h3)];
              reg210 <= $unsigned((+reg210[(4'ha):(3'h5)]));
              reg211 <= $unsigned($unsigned(($signed((~|(8'ha4))) <<< ({(8'h9e)} >= ((8'h9d) ?
                  wire5 : (8'ha9))))));
            end
        end
      else
        begin
          reg207 <= $unsigned((8'h9f));
          reg208 <= {{wire200[(2'h2):(1'h1)]},
              (+(((reg204 ? wire195 : (8'hb0)) <<< $signed(reg212)) + ((wire0 ?
                  reg204 : reg207) + $unsigned(reg211))))};
          if ({reg206,
              $signed($unsigned(((wire195 - wire6) + (reg208 ^ reg8))))})
            begin
              reg209 <= wire7;
              reg210 <= wire197;
              reg211 <= {reg9, {(wire197[(2'h2):(1'h0)] << wire5)}};
              reg212 <= wire198;
            end
          else
            begin
              reg209 <= wire7[(3'h6):(3'h4)];
              reg210 <= (^(8'hbd));
              reg211 <= {($unsigned(($signed(wire1) + wire2[(3'h6):(3'h6)])) <= ((~$unsigned((8'hb9))) ?
                      (reg207[(3'h4):(2'h3)] ?
                          (~^wire198) : {wire198}) : (^(~(7'h43))))),
                  wire3[(2'h2):(1'h1)]};
              reg212 <= ((8'hbc) | ((reg203 >>> wire200[(2'h3):(2'h2)]) ?
                  {$unsigned({(8'ha7), wire197}),
                      reg8[(3'h4):(1'h1)]} : wire195[(3'h4):(1'h0)]));
            end
        end
    end
  assign wire213 = ({(^~(8'h9d)), (~(^{(8'haa)}))} ?
                       $unsigned($unsigned(reg211)) : $signed({(~&(8'hb2))}));
  assign wire214 = reg205[(4'h8):(3'h5)];
  assign wire215 = $signed($unsigned($signed((wire199 && reg8[(2'h2):(1'h1)]))));
endmodule

module module105
#(parameter param193 = ({({((8'ha5) ? (8'had) : (8'haf))} ? (^~(+(8'hb1))) : (|((8'hae) ? (8'hb4) : (8'hba)))), (~&(((8'hb7) ~^ (8'h9d)) ? {(8'hbf), (8'hbf)} : ((8'ha4) || (8'hbf))))} ? (^~({(!(8'hb5))} * {(^(8'ha1))})) : (~|(^{((8'ha4) ? (8'h9f) : (8'ha6))}))), 
parameter param194 = ((~param193) & ((param193 && (8'ha5)) ? param193 : param193)))
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire109;
  input wire [(5'h12):(1'h0)] wire108;
  input wire signed [(4'hb):(1'h0)] wire107;
  input wire [(4'h8):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire182;
  wire signed [(5'h15):(1'h0)] wire181;
  wire signed [(5'h15):(1'h0)] wire151;
  wire signed [(4'h9):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire179;
  reg [(3'h4):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg184 = (1'h0);
  reg [(5'h13):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire151,
                 wire122,
                 wire121,
                 wire120,
                 wire112,
                 wire111,
                 wire110,
                 wire179,
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
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire110 = $unsigned($unsigned((^$unsigned({wire108}))));
  assign wire111 = $unsigned(($unsigned(wire108[(3'h6):(3'h6)]) ?
                       ($signed({wire107}) - (wire106[(2'h3):(1'h1)] ?
                           wire109 : wire110[(1'h0):(1'h0)])) : $signed((wire109 ?
                           (~|wire106) : (-wire107)))));
  assign wire112 = $signed($signed((|wire109[(5'h11):(3'h5)])));
  always
    @(posedge clk) begin
      if (wire109[(4'he):(2'h3)])
        begin
          reg113 <= $unsigned(((8'hb5) & wire110[(1'h1):(1'h0)]));
        end
      else
        begin
          if ($signed($unsigned($unsigned($unsigned((8'ha2))))))
            begin
              reg113 <= (wire112[(2'h3):(2'h2)] ^~ wire106[(2'h2):(2'h2)]);
              reg114 <= $unsigned(($unsigned(wire107) ?
                  wire111[(4'he):(1'h0)] : (wire112[(4'h8):(3'h7)] <<< ($unsigned(wire108) ?
                      wire109 : reg113))));
            end
          else
            begin
              reg113 <= wire109;
              reg114 <= {$unsigned($unsigned(wire106)),
                  ((+wire108[(3'h4):(2'h3)]) ?
                      wire106 : $unsigned($unsigned($unsigned(wire109))))};
            end
          if ((wire107[(3'h4):(3'h4)] || (|wire106[(2'h3):(2'h3)])))
            begin
              reg115 <= reg114;
              reg116 <= (wire109 && ((-(reg113[(1'h1):(1'h1)] > (wire106 >= wire110))) ?
                  $signed((((8'hbf) ~^ wire109) ^ reg115[(2'h2):(1'h1)])) : $signed($unsigned($signed(wire108)))));
            end
          else
            begin
              reg115 <= {$signed({$unsigned($unsigned(reg114))})};
            end
          reg117 <= reg116;
          reg118 <= ($unsigned($unsigned(((~&wire108) ?
              $unsigned(wire110) : $unsigned(wire110)))) << ((($signed(wire110) > (reg115 <<< wire107)) >> (~^(reg117 ?
              wire112 : wire109))) != ((~$unsigned(wire106)) ^ reg117)));
          reg119 <= $unsigned(((((reg116 ? (8'haa) : wire109) ?
                      {reg117} : $unsigned(wire107)) ?
                  wire111 : ((reg118 ? wire110 : (8'hb4)) ?
                      $signed(reg115) : $signed(reg118))) ?
              wire107 : ((8'hba) ?
                  ($signed(wire106) ?
                      $signed(reg116) : $signed(reg114)) : ((!(8'ha1)) < ((7'h40) & reg113)))));
        end
    end
  assign wire120 = reg118[(1'h1):(1'h1)];
  assign wire121 = {wire110[(2'h2):(1'h1)],
                       $unsigned(($unsigned($unsigned(wire110)) ?
                           $signed((wire111 ?
                               reg119 : reg119)) : reg119[(3'h4):(2'h2)]))};
  assign wire122 = (wire112[(1'h0):(1'h0)] ?
                       {(|$signed((reg119 < wire107))),
                           (~^(&(^(7'h42))))} : $unsigned((7'h40)));
  module123 #() modinst152 (.wire125(reg117), .y(wire151), .wire124(wire121), .wire127(wire107), .clk(clk), .wire126(wire110));
  module153 #() modinst180 (wire179, clk, reg114, wire120, wire109, wire106);
  assign wire181 = (!(((wire108 ? (wire107 <<< reg113) : {(8'had), wire109}) ?
                           ((wire122 & wire108) ?
                               ((7'h43) ?
                                   wire111 : wire107) : (~|wire112)) : ((8'hba) ?
                               (wire110 > wire108) : $signed(wire111))) ?
                       ($unsigned(wire107) > (+$signed(wire121))) : (^~wire110[(4'h8):(4'h8)])));
  assign wire182 = $signed((~&((7'h40) * {$unsigned(wire112)})));
  always
    @(posedge clk) begin
      reg183 <= {(wire121[(4'ha):(4'h8)] ?
              wire107[(4'ha):(1'h0)] : (wire121[(1'h1):(1'h0)] <<< (wire108[(3'h7):(3'h5)] ?
                  (|(8'hba)) : $unsigned((8'hb2))))),
          reg116};
      reg184 <= (8'h9f);
      if (reg116[(3'h4):(3'h4)])
        begin
          reg185 <= (~^($signed((wire112[(2'h3):(2'h2)] ?
                  wire151[(2'h3):(1'h1)] : (wire111 ? reg118 : wire110))) ?
              ((((8'hb6) ? reg118 : wire112) == (|wire122)) ?
                  wire107[(4'h8):(2'h2)] : reg114[(1'h0):(1'h0)]) : (($signed(reg117) ?
                      {wire108, wire182} : {wire112}) ?
                  ({wire181, (8'h9f)} && (~reg113)) : (-(8'hb6)))));
          reg186 <= wire106[(3'h6):(2'h3)];
        end
      else
        begin
          reg185 <= (wire120[(5'h10):(5'h10)] * {$unsigned($signed(reg117[(3'h5):(3'h5)])),
              $unsigned((^$unsigned(wire179)))});
          reg186 <= (reg185 <<< reg113[(1'h1):(1'h0)]);
          if (wire121[(5'h15):(4'hc)])
            begin
              reg187 <= (wire107 ?
                  ($signed($unsigned($signed(reg118))) < (8'hb5)) : reg117[(2'h3):(2'h2)]);
              reg188 <= (~(wire179[(4'h8):(2'h2)] ?
                  $signed($unsigned(reg117[(1'h0):(1'h0)])) : $unsigned(wire122)));
              reg189 <= ($signed(reg187[(1'h1):(1'h1)]) || ({(|(8'h9c)),
                      wire121[(1'h1):(1'h0)]} ?
                  {reg115[(4'hb):(4'h9)]} : (($signed(wire111) ?
                      wire182 : wire181) * $signed($unsigned(wire151)))));
              reg190 <= $signed((((8'hb8) >>> (^~$signed((7'h41)))) ?
                  $signed(wire151) : reg187[(3'h4):(1'h1)]));
            end
          else
            begin
              reg187 <= ({(8'hb5), reg118[(1'h1):(1'h1)]} > (^~(((wire111 ?
                      (8'hb8) : wire109) ?
                  $signed(wire111) : $signed(reg183)) == (^reg187))));
              reg188 <= reg115;
              reg189 <= (wire111[(5'h12):(2'h2)] ?
                  $signed($unsigned((reg119 * (reg188 <= reg114)))) : $signed((&reg187[(1'h0):(1'h0)])));
              reg190 <= ((reg185[(1'h0):(1'h0)] <= (8'hb3)) ?
                  (reg185[(4'h8):(3'h7)] || (-wire182)) : (^~(~|wire182[(5'h10):(1'h1)])));
            end
          reg191 <= ($unsigned({$signed($unsigned(wire109))}) ?
              ({(8'h9d)} ^ ($unsigned((~wire151)) & wire181[(4'hd):(3'h4)])) : (({wire111,
                      {reg186, wire106}} | wire151[(3'h6):(3'h4)]) ?
                  $unsigned(((wire106 ?
                      reg183 : wire109) != wire121)) : (wire106 + ((~&wire120) >> wire112[(2'h3):(1'h1)]))));
          reg192 <= {(&$unsigned($signed({reg119}))),
              (~{{{reg186, wire110}}, {reg191, reg117}})};
        end
    end
endmodule

module module10
#(parameter param101 = (({{(-(8'ha1)), ((8'hbd) ? (8'hbc) : (7'h44))}} ? (~&(~(^(8'hb6)))) : ((~|((8'hb3) ? (8'ha7) : (7'h40))) ? (^(~|(8'hb1))) : ((7'h41) || ((8'h9f) ? (8'hac) : (8'hb6))))) || (((!{(8'hbb), (8'hab)}) << {((7'h41) >>> (8'hb1))}) >= ((((8'hba) + (8'hab)) <<< (8'hbf)) ? (~((8'ha7) >>> (8'hbe))) : ({(8'h9f), (7'h41)} ~^ ((8'hb7) ? (8'ha9) : (8'ha7)))))), 
parameter param102 = (~&param101))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire97;
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  assign y = {wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire44,
                 wire97,
                 reg100,
                 reg99,
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
                 (1'h0)};
  assign wire16 = (^~$unsigned(($unsigned($signed(wire13)) ?
                      (wire13 ?
                          (wire14 ?
                              wire12 : (8'hbc)) : $unsigned(wire13)) : $signed((wire13 <<< wire14)))));
  assign wire17 = $signed((8'ha4));
  assign wire18 = (&(^~(&{wire16[(2'h2):(1'h0)], $unsigned(wire12)})));
  assign wire19 = $signed((!(8'ha5)));
  assign wire20 = $signed($signed((((^wire19) ?
                          (wire16 ? wire13 : wire19) : (wire15 ?
                              (8'ha4) : wire19)) ?
                      (8'hb5) : wire17)));
  assign wire21 = $unsigned($unsigned($signed(wire17)));
  assign wire22 = wire17;
  assign wire23 = ((&wire14[(1'h1):(1'h1)]) ^ (wire12 * $unsigned($unsigned((^wire17)))));
  assign wire24 = $signed(wire17);
  assign wire25 = (((($signed(wire17) > (8'ha0)) ?
                          {wire11[(2'h3):(1'h0)]} : (|wire11)) ?
                      wire23 : (&(&(wire12 ? wire22 : wire14)))) >= wire14);
  assign wire26 = $signed((~$unsigned($signed((wire15 != wire12)))));
  always
    @(posedge clk) begin
      reg27 <= {(^wire24[(4'hc):(2'h3)]), wire22[(5'h14):(1'h1)]};
      if ($signed(wire17))
        begin
          reg28 <= (8'ha9);
          reg29 <= wire17;
          reg30 <= (wire22[(4'hc):(4'h8)] == (({$signed(wire24)} ?
              (8'ha3) : wire17) >> (8'ha8)));
          reg31 <= (^~wire11[(2'h3):(2'h2)]);
        end
      else
        begin
          reg28 <= reg31;
          reg29 <= wire13;
          reg30 <= {$signed($signed(({wire15} ?
                  (wire16 == wire12) : {wire24, wire23})))};
        end
    end
  always
    @(posedge clk) begin
      reg32 <= wire24;
      reg33 <= reg30;
      reg34 <= $signed({$signed({(~^(8'ha1))})});
    end
  always
    @(posedge clk) begin
      reg35 <= (8'ha3);
      reg36 <= {(reg33[(1'h0):(1'h0)] < wire25), (8'h9e)};
      reg37 <= $unsigned($unsigned((~|(reg32 >= $signed(wire13)))));
    end
  always
    @(posedge clk) begin
      reg38 <= $unsigned({$signed((wire22 ?
              $signed(wire17) : (wire24 >>> (8'hab)))),
          (($unsigned(wire23) ?
              (8'hb0) : ((8'hb7) ? (8'ha4) : (8'h9d))) > wire20)});
    end
  always
    @(posedge clk) begin
      reg39 <= reg30;
      reg40 <= $signed($signed((+wire13[(4'ha):(4'h8)])));
      reg41 <= reg28[(2'h2):(1'h0)];
      reg42 <= (wire14 ^ (($signed($signed(reg30)) != (!reg37)) ?
          {(((8'hbe) ? wire19 : (8'ha4)) ? wire15 : reg31[(3'h4):(3'h4)]),
              (+$unsigned(reg36))} : $unsigned(wire12)));
      reg43 <= $signed({$signed(wire13[(4'ha):(1'h1)]), reg34});
    end
  assign wire44 = (-{(({reg42} || (reg39 ?
                          reg36 : (8'hbb))) >>> ($signed(wire15) >>> {reg41,
                          reg34}))});
  module45 #() modinst98 (.wire47(reg40), .wire50(wire14), .y(wire97), .wire48(wire18), .wire49(reg29), .wire46(wire13), .clk(clk));
  always
    @(posedge clk) begin
      reg99 <= {(wire13 ?
              $unsigned(($signed(wire18) ?
                  $signed(wire21) : $signed(reg43))) : wire26[(4'hd):(1'h0)]),
          ((((reg36 != wire23) ?
              $unsigned(wire12) : $unsigned((8'ha9))) | ({wire12} <<< {wire14})) && reg42)};
      reg100 <= wire16;
    end
endmodule

module module45
#(parameter param95 = ((8'had) ? (((&(8'hb5)) ? (((8'hbd) * (8'hba)) ? ((8'hbe) == (8'hac)) : {(8'hb0)}) : ({(7'h44)} << {(7'h43), (8'h9c)})) ^ (((8'hbd) >>> ((8'hbb) || (8'haa))) != (((8'hbd) ? (7'h43) : (8'h9c)) ? ((8'ha8) ? (8'hab) : (8'hbd)) : (8'ha9)))) : ((^((&(7'h44)) == ((8'hb9) <<< (8'hb8)))) > ({((8'hb1) & (8'hba))} && ((~|(8'hb8)) <<< (&(8'hb8)))))), 
parameter param96 = ((^{(&(param95 ? param95 : param95))}) ? (+(((param95 ^~ param95) ? (param95 != param95) : param95) ? param95 : ((param95 <= param95) && {param95}))) : param95))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire50;
  input wire [(5'h10):(1'h0)] wire49;
  input wire [(5'h13):(1'h0)] wire48;
  input wire signed [(4'ha):(1'h0)] wire47;
  input wire [(5'h13):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(5'h12):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
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
                 reg66,
                 reg65,
                 reg64,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg51 <= {wire46[(3'h4):(1'h0)], {wire49[(4'ha):(1'h1)]}};
      reg52 <= {(8'ha1)};
      reg53 <= (8'hb1);
      reg54 <= wire49;
    end
  assign wire55 = {wire49};
  assign wire56 = (!wire49);
  assign wire57 = $signed((wire55[(2'h3):(1'h1)] >= (((reg53 && wire56) ?
                          $unsigned(wire56) : (8'hbf)) ?
                      $signed((wire46 ?
                          wire48 : reg52)) : $unsigned($unsigned(reg51)))));
  assign wire58 = $unsigned(wire49[(2'h3):(1'h1)]);
  assign wire59 = {(~{$signed(wire49)}), wire48};
  assign wire60 = (~$unsigned((~^$signed((wire56 ? wire48 : wire50)))));
  assign wire61 = reg52[(4'h8):(2'h3)];
  assign wire62 = wire47[(3'h7):(3'h4)];
  assign wire63 = (reg51[(2'h2):(1'h0)] & (-wire50[(5'h11):(3'h6)]));
  always
    @(posedge clk) begin
      reg64 <= wire57;
      reg65 <= $unsigned((wire59 << $unsigned((8'hb2))));
      if (reg65)
        begin
          reg66 <= $signed((!(^~((^~wire58) ? $signed(wire55) : wire49))));
          reg67 <= $signed(wire58);
          reg68 <= ($signed(((wire55[(3'h4):(1'h1)] && {reg66,
              wire47}) >= {wire46})) >= $signed(wire62[(4'hb):(4'ha)]));
        end
      else
        begin
          reg66 <= reg51;
          reg67 <= $unsigned({wire61,
              ((~wire60) ?
                  ({(7'h41)} ?
                      $unsigned(wire63) : {(8'hbc),
                          wire47}) : {reg54[(3'h5):(2'h3)],
                      wire57[(3'h7):(1'h0)]})});
          if (reg66)
            begin
              reg68 <= $unsigned(($unsigned((~&{reg67, wire50})) ?
                  $signed($unsigned(reg54)) : {{$signed(wire50), (~|wire63)},
                      ($unsigned(wire50) - ((7'h44) != reg52))}));
              reg69 <= (~&$unsigned(wire56));
              reg70 <= $unsigned({(((+wire56) != (reg64 ?
                      wire56 : (8'h9f))) * (reg53[(4'ha):(3'h6)] ?
                      (8'ha6) : {(8'hbc)}))});
              reg71 <= $signed({(((wire61 + (8'hbe)) ?
                          $unsigned((8'ha4)) : wire58) ?
                      ((wire46 >> wire61) ?
                          (~^wire56) : {wire60}) : (+reg64))});
            end
          else
            begin
              reg68 <= wire56;
              reg69 <= (((reg51 ?
                          $unsigned((~^wire63)) : ((reg71 ?
                              reg68 : reg54) >> wire61[(1'h0):(1'h0)])) ?
                      $signed($unsigned($unsigned(wire63))) : ($signed($signed(reg68)) ?
                          (|(wire50 ^ wire46)) : ((reg54 == (8'ha2)) + (-wire60)))) ?
                  $unsigned((($unsigned(wire58) < (wire59 ~^ wire58)) & $signed(wire58))) : ($signed(reg69) ?
                      ({reg71[(5'h11):(1'h0)], $signed(wire48)} ?
                          $signed((!reg70)) : {$unsigned(wire60)}) : wire55));
              reg70 <= $unsigned(((|reg52[(3'h7):(3'h5)]) & reg68[(2'h3):(1'h0)]));
            end
        end
      if (((wire56[(4'hd):(3'h7)] == wire55[(3'h7):(3'h4)]) <= $unsigned($signed(reg52))))
        begin
          reg72 <= ($signed(wire48) ?
              reg68[(3'h5):(2'h2)] : (((reg71 >= (wire62 ?
                      reg64 : reg52)) * $signed(wire49)) ?
                  wire57[(1'h1):(1'h0)] : $unsigned(wire60[(3'h7):(3'h4)])));
          if ($unsigned($unsigned({(wire61[(3'h6):(1'h0)] != reg64)})))
            begin
              reg73 <= {{$signed(wire60[(3'h7):(1'h1)]),
                      (&wire62[(4'hc):(4'h9)])}};
            end
          else
            begin
              reg73 <= wire57[(4'h8):(2'h2)];
              reg74 <= (8'hab);
              reg75 <= $unsigned(reg70[(2'h2):(2'h2)]);
              reg76 <= wire59[(4'h9):(2'h2)];
              reg77 <= wire61[(1'h1):(1'h1)];
            end
          if ($unsigned(wire50))
            begin
              reg78 <= (|$signed(reg73[(1'h0):(1'h0)]));
              reg79 <= $unsigned((-reg77[(1'h0):(1'h0)]));
            end
          else
            begin
              reg78 <= reg71[(3'h5):(3'h5)];
              reg79 <= wire46;
              reg80 <= ({wire46[(3'h6):(3'h6)]} ?
                  $unsigned(({$signed(reg52),
                      $unsigned((8'had))} >= $unsigned((reg68 < reg73)))) : wire56);
              reg81 <= {$signed((|wire50[(5'h14):(4'h9)]))};
            end
          reg82 <= $signed((^wire61));
        end
      else
        begin
          reg72 <= reg77[(2'h2):(1'h1)];
          if ({reg71, {$signed(wire56), {(!(|reg67))}}})
            begin
              reg73 <= (~^($unsigned((reg73 ?
                  $unsigned((8'hbc)) : (-wire46))) == (reg72 != (wire60[(3'h4):(3'h4)] <<< $signed(reg67)))));
              reg74 <= ((&reg69[(1'h1):(1'h0)]) | (wire55 <= $unsigned((&reg54[(1'h1):(1'h0)]))));
              reg75 <= reg67;
              reg76 <= (~($unsigned(wire56) ^ ((!{(8'hb3),
                  wire55}) + (^$unsigned((8'h9c))))));
              reg77 <= (8'ha8);
            end
          else
            begin
              reg73 <= ($unsigned({($signed(reg69) <= (reg51 < reg78)),
                  ((reg77 | reg71) ?
                      (~reg70) : ((8'h9f) << reg75))}) < reg52[(1'h0):(1'h0)]);
            end
        end
      reg83 <= (^({$signed($unsigned(reg73)), $unsigned($signed(reg82))} ?
          wire50[(2'h2):(1'h0)] : reg66[(4'hb):(2'h2)]));
    end
  assign wire84 = ($unsigned($unsigned(reg76[(5'h13):(3'h5)])) ?
                      ($signed(reg83) > wire55) : $unsigned({reg69[(1'h0):(1'h0)]}));
  assign wire85 = (8'hb8);
  assign wire86 = reg76;
  assign wire87 = reg81[(3'h6):(1'h0)];
  assign wire88 = (((($unsigned(reg78) ~^ reg64[(3'h5):(2'h3)]) - $unsigned((wire57 ?
                      wire55 : wire86))) ^ reg51) ~^ $unsigned(($signed($signed(reg73)) ?
                      reg80 : (8'ha4))));
  assign wire89 = $signed(($signed($signed((reg82 ?
                      reg75 : wire84))) & $signed((+$unsigned(reg68)))));
  assign wire90 = $unsigned(wire56);
  assign wire91 = $signed({$signed((8'h9e)), wire61[(4'ha):(3'h5)]});
  assign wire92 = $signed(reg51[(3'h5):(1'h1)]);
  assign wire93 = (+((7'h42) || (|wire58)));
  assign wire94 = $signed($signed((7'h43)));
endmodule

module module153
#(parameter param177 = (+{((~^(8'hae)) ? {((8'ha4) >= (8'hb6))} : ({(8'h9d)} ? ((8'h9c) ? (8'h9e) : (8'ha2)) : {(8'hb4), (8'haa)})), (((~|(8'hbf)) + (!(7'h42))) * (8'h9e))}), 
parameter param178 = param177)
(y, clk, wire157, wire156, wire155, wire154);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire157;
  input wire [(5'h14):(1'h0)] wire156;
  input wire [(5'h12):(1'h0)] wire155;
  input wire [(4'h8):(1'h0)] wire154;
  wire [(2'h2):(1'h0)] wire176;
  wire [(4'hc):(1'h0)] wire175;
  wire signed [(5'h11):(1'h0)] wire174;
  wire signed [(4'he):(1'h0)] wire173;
  wire signed [(4'hf):(1'h0)] wire164;
  wire signed [(3'h6):(1'h0)] wire163;
  wire signed [(4'hc):(1'h0)] wire162;
  wire signed [(4'he):(1'h0)] wire161;
  wire [(4'hd):(1'h0)] wire160;
  wire [(4'ha):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire158;
  reg signed [(4'h9):(1'h0)] reg172 = (1'h0);
  reg signed [(4'he):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg signed [(4'he):(1'h0)] reg165 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire158 = wire157[(3'h5):(2'h3)];
  assign wire159 = {wire158,
                       (($unsigned(wire154[(1'h0):(1'h0)]) == (~wire155)) ?
                           (!$unsigned((~(8'hb0)))) : $unsigned(wire158))};
  assign wire160 = {wire155, (~&wire156)};
  assign wire161 = (-wire159[(2'h3):(2'h2)]);
  assign wire162 = (~^(8'hae));
  assign wire163 = wire157;
  assign wire164 = $unsigned($unsigned(wire155));
  always
    @(posedge clk) begin
      reg165 <= (($signed(wire161[(1'h0):(1'h0)]) ?
          $unsigned($unsigned($unsigned(wire158))) : (~wire157[(3'h4):(2'h3)])) || ({wire162,
              $signed({wire157, wire164})} ?
          $signed(wire157[(3'h4):(3'h4)]) : ($signed((wire158 ?
                  wire154 : wire162)) ?
              wire160[(2'h2):(1'h0)] : wire159)));
      reg166 <= (reg165 ? wire154 : wire158);
      reg167 <= $signed(wire156);
      reg168 <= wire156;
      reg169 <= (&(+$unsigned(((^~wire154) ? $unsigned(wire159) : wire156))));
    end
  always
    @(posedge clk) begin
      reg170 <= ((-(|$signed((wire158 ? wire158 : wire154)))) ?
          $unsigned(wire154) : (8'ha3));
      reg171 <= ((^~{((reg165 + wire162) ?
              (~&reg167) : $unsigned(wire160))}) || reg169[(1'h0):(1'h0)]);
      reg172 <= ((^wire164[(3'h7):(1'h0)]) || $signed((8'haa)));
    end
  assign wire173 = (~|((($signed(wire157) | reg167) ?
                       $unsigned(reg166) : $signed($unsigned(reg167))) >> wire159));
  assign wire174 = $signed(reg172);
  assign wire175 = (~^$unsigned((wire154 ?
                       reg171[(2'h3):(1'h0)] : $unsigned(reg167[(4'h8):(3'h7)]))));
  assign wire176 = (($unsigned((^$signed(reg165))) >>> reg172[(2'h2):(1'h0)]) ?
                       $signed((reg170[(1'h0):(1'h0)] ?
                           wire156[(4'ha):(3'h7)] : (8'hb4))) : {((!((8'ha8) ?
                                   reg169 : reg170)) ?
                               $signed($unsigned(wire155)) : $signed((wire155 ?
                                   wire174 : (8'hbe)))),
                           ($unsigned(wire156) + $signed($unsigned(wire164)))});
endmodule

module module123
#(parameter param149 = ({(~&(&(+(8'ha3)))), (-((^~(8'hb7)) ^~ ((8'hab) ? (8'hbe) : (8'hbd))))} ? {(((~^(8'ha0)) ? {(8'ha0)} : ((8'hb7) ? (8'h9d) : (8'ha4))) <= (((8'hbd) ? (8'hab) : (8'hab)) ? {(7'h44)} : ((8'hbb) <= (8'hac))))} : ((((^~(8'ha3)) ? ((8'h9d) > (8'hac)) : ((8'hb1) ? (8'ha6) : (8'hbe))) ^ (((8'h9c) ? (8'hab) : (8'hab)) != ((8'h9e) && (8'ha3)))) + (&{(7'h44)}))), 
parameter param150 = (((({param149} >>> (param149 | param149)) ^~ ((param149 ^ param149) <<< {param149, param149})) ? ((^~param149) >= (~&{param149})) : (+({param149, param149} != param149))) & (param149 ? {((param149 ? param149 : param149) | ((8'ha3) ? param149 : param149)), {(param149 >= param149)}} : ((7'h44) ~^ (^(param149 ^~ (8'ha2)))))))
(y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire127;
  input wire signed [(4'he):(1'h0)] wire126;
  input wire [(3'h7):(1'h0)] wire125;
  input wire signed [(4'h9):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire138;
  wire [(3'h7):(1'h0)] wire137;
  wire signed [(4'h8):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire135;
  wire signed [(4'hb):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire129;
  wire signed [(3'h5):(1'h0)] wire128;
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(4'hf):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg143 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg132 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
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
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire128 = $signed(wire127);
  assign wire129 = ({wire128, wire127[(1'h0):(1'h0)]} ?
                       ({$unsigned(wire125),
                           $signed($unsigned(wire127))} || $unsigned({$signed((8'hbb)),
                           $signed(wire126)})) : wire125[(3'h7):(1'h0)]);
  assign wire130 = ($unsigned($signed(wire127[(1'h1):(1'h1)])) >= {wire127[(3'h6):(2'h2)]});
  assign wire131 = wire124;
  always
    @(posedge clk) begin
      reg132 <= (wire129 - wire126[(4'hd):(4'h9)]);
      reg133 <= (+$unsigned($signed({wire127[(2'h3):(1'h0)]})));
      reg134 <= reg133[(2'h2):(2'h2)];
    end
  assign wire135 = $signed(wire127[(2'h3):(2'h3)]);
  assign wire136 = $signed(((~$unsigned({wire130, (8'ha5)})) ?
                       $unsigned((|(~^wire126))) : ({$unsigned(wire127),
                           (wire129 ? wire131 : wire127)} >>> wire135)));
  assign wire137 = (|($signed($signed((wire125 ?
                       wire129 : reg132))) < $unsigned(($signed(wire126) ?
                       (reg133 && reg132) : $unsigned(wire129)))));
  assign wire138 = wire131[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg139 <= wire129;
      if (wire129[(4'hf):(3'h7)])
        begin
          reg140 <= ((^~(reg132 < ($signed((8'haa)) != ((7'h44) ?
                  (8'hbe) : wire129)))) ?
              (+(~&($unsigned(wire135) | wire136))) : wire130[(1'h1):(1'h0)]);
          if ($signed((($signed((~^wire126)) <<< {wire127}) ?
              ((&(wire138 && wire131)) ?
                  $unsigned(wire136[(4'h8):(3'h7)]) : $unsigned((^wire129))) : (8'hb6))))
            begin
              reg141 <= $unsigned($signed($signed(((reg133 <<< wire137) ?
                  (reg132 >= wire127) : (wire129 ? wire128 : wire125)))));
              reg142 <= ($unsigned((wire131 ?
                  $signed({reg139,
                      wire135}) : (~&$signed((8'ha3))))) || (-((8'h9e) ?
                  $signed((wire136 > reg140)) : reg132[(3'h4):(2'h3)])));
            end
          else
            begin
              reg141 <= wire126;
              reg142 <= (wire129 ?
                  $signed(wire135) : ({$unsigned($unsigned(reg134)),
                      (reg141 >>> ((7'h40) && reg142))} + $unsigned($unsigned(wire127))));
              reg143 <= (((wire127 != wire131[(4'hb):(3'h4)]) <= $unsigned(wire129[(4'hf):(4'hb)])) && ($signed($signed($signed(reg142))) ?
                  ((reg139[(4'hc):(1'h1)] < reg142) ?
                      $signed($signed(wire129)) : wire135) : {wire127[(1'h1):(1'h0)],
                      $unsigned(wire124[(1'h1):(1'h1)])}));
              reg144 <= $signed($signed($unsigned((wire137[(3'h7):(3'h6)] ?
                  (reg143 > reg134) : (wire137 ? wire138 : wire137)))));
              reg145 <= $unsigned({(|((~reg132) ?
                      $signed(wire128) : $unsigned(wire124))),
                  {wire129[(4'hd):(4'h8)]}});
            end
        end
      else
        begin
          reg140 <= ((-wire136[(2'h2):(2'h2)]) ?
              ({{reg141[(1'h0):(1'h0)]},
                  (8'ha1)} & (!$signed(wire129))) : (8'hbf));
          if ((!$signed($signed(reg142[(4'ha):(4'h8)]))))
            begin
              reg141 <= reg132;
              reg142 <= reg143[(4'hc):(2'h3)];
              reg143 <= $signed($signed((^(reg143[(4'h9):(3'h4)] & (reg141 ?
                  reg134 : reg142)))));
              reg144 <= $signed(((+($unsigned(reg139) ?
                  $unsigned(wire129) : (reg142 <= reg143))) * $unsigned(wire130)));
            end
          else
            begin
              reg141 <= ($unsigned((8'hb5)) <= (wire130[(2'h2):(1'h0)] << wire124[(3'h7):(3'h4)]));
              reg142 <= (|$unsigned(($unsigned(reg133) ?
                  ((reg140 && reg139) ?
                      {reg143} : {wire130}) : $unsigned(reg139[(3'h6):(1'h0)]))));
              reg143 <= $signed(({wire136,
                      $unsigned((wire129 ? wire138 : wire128))} ?
                  $signed(({reg143} ?
                      (wire127 <= wire137) : (wire127 ?
                          reg145 : reg144))) : $unsigned($signed((!wire126)))));
            end
          reg145 <= reg134[(3'h6):(2'h3)];
        end
      reg146 <= (($unsigned($signed(reg141[(2'h3):(1'h1)])) ^ wire126) ?
          $unsigned((wire129 ?
              (^~(-wire137)) : (~&$signed(reg145)))) : $signed((reg142[(3'h5):(3'h5)] ?
              reg134[(5'h14):(4'hf)] : {(reg143 ? reg132 : reg142),
                  $signed(wire126)})));
      reg147 <= (!(~($unsigned($signed(wire131)) & $unsigned((wire127 * (8'had))))));
      reg148 <= $unsigned(reg134[(2'h3):(1'h1)]);
    end
endmodule
