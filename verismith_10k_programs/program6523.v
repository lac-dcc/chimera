module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire181;
  wire [(3'h4):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire125;
  wire signed [(4'hd):(1'h0)] wire126;
  wire [(4'hd):(1'h0)] wire179;
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  assign y = {wire181,
                 wire116,
                 wire118,
                 wire119,
                 wire125,
                 wire126,
                 wire179,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  module4 #() modinst117 (wire116, clk, wire1, wire0, wire2, wire3);
  assign wire118 = $unsigned($unsigned(wire1[(4'h9):(2'h2)]));
  assign wire119 = (~^$signed(wire1[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg120 <= (((^~$unsigned($unsigned(wire119))) ?
              $signed(($unsigned(wire116) * wire118[(4'hb):(3'h4)])) : $unsigned($signed((~wire1)))) ?
          ($signed(wire2[(5'h10):(4'ha)]) >> ($signed(wire0) ?
              wire1 : wire118)) : $unsigned(($unsigned($signed(wire0)) ?
              (~$unsigned(wire2)) : ($unsigned(wire116) | (wire116 ?
                  wire116 : wire2)))));
      reg121 <= {(~^(+(~&{reg120, wire2})))};
      reg122 <= wire118;
      reg123 <= $unsigned(wire119);
      reg124 <= (+(&(~^(~$unsigned(reg121)))));
    end
  assign wire125 = (wire116 - wire118);
  assign wire126 = reg124;
  module127 #() modinst180 (.wire131(wire125), .clk(clk), .wire132(wire1), .wire129(reg123), .wire130(wire118), .y(wire179), .wire128(reg124));
  assign wire181 = ($unsigned(wire2) ?
                       $signed($signed($signed($signed((8'hb6))))) : wire116);
endmodule

module module127
#(parameter param178 = (({((^~(8'ha0)) ? {(8'hb1)} : {(8'hae), (8'hbe)})} ~^ ((8'hb9) != {((8'hbe) ? (7'h40) : (7'h41)), ((8'h9e) || (8'had))})) ? (&(~|(((8'hbc) | (8'h9d)) ? ((8'hb2) ? (8'ha0) : (8'hba)) : ((8'ha0) ? (8'h9e) : (8'ha6))))) : ((~^(((8'hbd) ^ (8'hbc)) <= (+(8'hb5)))) <<< (|((~|(8'ha1)) >> ((8'hb6) >> (8'ha3)))))))
(y, clk, wire128, wire129, wire130, wire131, wire132);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire128;
  input wire signed [(5'h12):(1'h0)] wire129;
  input wire signed [(5'h11):(1'h0)] wire130;
  input wire [(2'h2):(1'h0)] wire131;
  input wire signed [(3'h4):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire177;
  wire signed [(4'h9):(1'h0)] wire176;
  wire signed [(3'h5):(1'h0)] wire175;
  wire signed [(3'h5):(1'h0)] wire174;
  wire signed [(4'ha):(1'h0)] wire173;
  wire signed [(2'h2):(1'h0)] wire172;
  wire signed [(3'h6):(1'h0)] wire171;
  wire [(5'h11):(1'h0)] wire133;
  wire [(3'h7):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire169;
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire169,
                 (1'h0)};
  assign wire133 = wire131[(2'h2):(1'h1)];
  assign wire134 = (+$signed(((wire132[(1'h1):(1'h0)] ?
                           (wire129 ? wire129 : wire129) : $unsigned(wire133)) ?
                       {{wire132, wire129},
                           ((8'had) - wire128)} : (wire132 & (wire131 ?
                           (8'hb4) : (7'h43))))));
  assign wire135 = ($unsigned($unsigned(wire129[(4'h9):(1'h0)])) ?
                       wire129[(5'h11):(4'ha)] : wire133);
  assign wire136 = $unsigned($signed($unsigned((&wire132[(3'h4):(3'h4)]))));
  module137 #() modinst170 (.clk(clk), .y(wire169), .wire138(wire133), .wire139(wire128), .wire141(wire134), .wire142(wire129), .wire140(wire136));
  assign wire171 = ($unsigned(($signed(wire130) ?
                           $unsigned($signed((8'ha5))) : ((wire133 >>> wire132) ^ $unsigned(wire129)))) ?
                       $signed($signed((wire135 ?
                           (wire135 == wire169) : wire132[(2'h2):(2'h2)]))) : (((wire133 ?
                           $signed(wire131) : (wire135 ?
                               wire128 : wire130)) ^ (8'hb4)) + wire130[(4'ha):(3'h5)]));
  assign wire172 = wire130[(4'ha):(3'h6)];
  assign wire173 = wire133[(4'hd):(1'h1)];
  assign wire174 = (~|($signed($signed($unsigned(wire136))) + {(7'h40),
                       ((~(8'hb5)) ? (^~wire133) : $signed(wire172))}));
  assign wire175 = (|$unsigned(wire174[(2'h2):(1'h0)]));
  assign wire176 = wire172[(1'h1):(1'h0)];
  assign wire177 = $unsigned(wire135);
endmodule

module module4
#(parameter param114 = ((((^((8'hbc) ? (7'h41) : (8'hbc))) > ((8'hbb) + {(8'ha8), (8'haa)})) ? (&(((7'h43) + (8'hac)) >> ((8'ha5) ? (8'h9e) : (8'ha5)))) : ({((8'hb9) * (8'hb6))} * ({(8'haa)} * ((8'ha1) ? (8'h9f) : (8'ha1))))) ~^ (((((8'ha4) || (8'hab)) || {(8'hac), (8'hac)}) ^~ {(8'ha5)}) ? ({((8'ha9) ? (8'had) : (8'hab))} >> {(|(8'ha1)), ((8'haf) ? (8'haf) : (8'ha7))}) : (-(((8'hb4) ? (8'hb8) : (8'hb3)) ? ((8'h9c) && (8'haf)) : {(8'hbc)})))), 
parameter param115 = (!((-param114) >>> (param114 ? ((param114 ? (8'hae) : param114) ? param114 : (-(8'ha5))) : ((param114 ? param114 : param114) ^~ (param114 || param114))))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire112;
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  assign y = {wire55,
                 wire15,
                 wire9,
                 wire57,
                 wire58,
                 wire112,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
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
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 (1'h0)};
  assign wire9 = ($signed(wire5[(4'h8):(1'h0)]) <= wire6);
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(($unsigned(wire6) ~^ $signed(wire8))) << $signed(((wire6 ?
          wire9 : wire6) <<< (wire5 ? wire6 : wire7))))))
        begin
          if (wire9[(4'h9):(3'h4)])
            begin
              reg10 <= (((wire5 ? (7'h44) : wire9) ?
                  $signed((((8'ha6) ?
                      wire9 : wire7) != (8'hb7))) : wire7) ^~ wire9);
              reg11 <= wire9[(3'h4):(2'h3)];
              reg12 <= $signed(wire6[(5'h11):(5'h10)]);
            end
          else
            begin
              reg10 <= $signed((~|{(8'ha1)}));
              reg11 <= {({(reg11 ~^ $unsigned(wire6)),
                      $unsigned(wire7)} >= (($unsigned((8'ha1)) >> $unsigned(wire6)) ^ $unsigned({wire5,
                      reg10})))};
            end
          reg13 <= (reg12 < {$signed(($signed(reg10) ?
                  $unsigned(reg12) : (^~wire5)))});
        end
      else
        begin
          reg10 <= reg11;
        end
      reg14 <= {wire7[(4'h8):(1'h0)]};
    end
  assign wire15 = ((^reg12) ? (-$signed(wire7)) : wire8[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg16 <= $unsigned((reg12 ?
          $unsigned($signed((wire8 == (8'hbd)))) : reg10));
      reg17 <= reg16;
      if ($unsigned((wire7 ?
          $unsigned($signed($unsigned(wire15))) : $signed(wire9[(1'h0):(1'h0)]))))
        begin
          reg18 <= {$signed($unsigned(((-reg16) || reg10))),
              wire8[(5'h10):(5'h10)]};
          reg19 <= $unsigned((|reg18));
        end
      else
        begin
          if ((reg17[(5'h11):(2'h2)] ? (&reg11[(2'h2):(1'h0)]) : reg12))
            begin
              reg18 <= reg12[(2'h2):(1'h0)];
              reg19 <= reg13;
              reg20 <= wire5[(3'h6):(2'h2)];
              reg21 <= {(8'hb1), (~|reg18)};
              reg22 <= reg10;
            end
          else
            begin
              reg18 <= $unsigned($unsigned(wire7[(2'h2):(1'h0)]));
              reg19 <= (reg10 + wire5);
            end
          reg23 <= (reg10 ?
              ((~^(((8'ha3) >> wire5) * wire8[(3'h5):(1'h1)])) ?
                  $unsigned((8'hbf)) : (((reg11 <<< reg18) ?
                      (reg17 || wire8) : (wire8 >= reg21)) * (|reg17[(5'h11):(3'h7)]))) : (wire15 ?
                  ((-reg17) ?
                      reg21[(3'h5):(3'h4)] : (wire9 ?
                          $signed(wire15) : (-reg14))) : (+($unsigned(wire6) ?
                      $unsigned(reg13) : reg21[(3'h5):(2'h3)]))));
          reg24 <= (-((^$unsigned($signed((8'hbd)))) ?
              (~(((8'hb0) ? reg12 : reg12) ~^ (8'ha4))) : wire9));
        end
      reg25 <= ($unsigned((^wire5[(2'h3):(2'h2)])) ?
          ($unsigned(reg16[(3'h6):(3'h4)]) < wire7[(5'h11):(4'hf)]) : ((+((wire15 ^ reg18) ?
                  reg10[(3'h4):(2'h3)] : (reg22 ? reg14 : wire7))) ?
              (+reg21[(2'h3):(2'h2)]) : ((!wire5[(3'h7):(1'h1)]) ?
                  $unsigned($unsigned(wire6)) : reg19[(3'h4):(2'h2)])));
      reg26 <= $unsigned($unsigned($signed($signed(reg17[(4'hb):(1'h0)]))));
    end
  module27 #() modinst56 (.wire30(reg20), .wire28(wire7), .wire29(reg25), .wire31(reg18), .y(wire55), .clk(clk), .wire32(reg10));
  assign wire57 = reg10[(2'h2):(2'h2)];
  assign wire58 = $unsigned(({reg24} <= (&{(reg19 ? reg21 : wire7)})));
  always
    @(posedge clk) begin
      if ({(($unsigned($unsigned((8'hab))) ? (&(-wire5)) : (8'hb1)) ?
              reg12[(1'h0):(1'h0)] : reg24[(5'h10):(3'h7)])})
        begin
          reg59 <= {((((~&reg19) ? (reg18 ? reg21 : wire57) : {wire58, wire5}) ?
                      wire8[(5'h11):(4'ha)] : (+$signed(reg23))) ?
                  $signed((~|(&wire15))) : (($unsigned(reg25) ?
                      reg21[(3'h5):(3'h4)] : reg24[(1'h0):(1'h0)]) > (wire9 ?
                      reg10 : {wire6}))),
              $unsigned((|wire8[(4'he):(4'h8)]))};
          reg60 <= $signed($signed(wire57));
        end
      else
        begin
          if (($signed(reg19) ?
              $unsigned(((8'hae) ?
                  ((reg20 ?
                      wire8 : wire5) <<< (~^(8'ha5))) : $signed($signed(reg11)))) : reg25[(3'h5):(2'h3)]))
            begin
              reg59 <= wire6;
              reg60 <= wire57[(1'h1):(1'h0)];
            end
          else
            begin
              reg59 <= ((8'ha7) ~^ {((~(wire5 + reg19)) ~^ $signed($unsigned((8'ha4)))),
                  wire8[(4'hf):(1'h0)]});
              reg60 <= $signed((($unsigned({reg14}) ?
                  $signed((reg10 || (8'hb3))) : ($unsigned(reg14) ?
                      reg11[(2'h3):(2'h3)] : (wire7 | reg17))) <<< (-$unsigned(wire7))));
              reg61 <= $signed($signed((&$unsigned((reg19 ? wire57 : reg24)))));
            end
          reg62 <= ($unsigned(reg12) ? reg61 : $unsigned((!reg61)));
          reg63 <= $signed((+((8'hb9) <<< wire8)));
          if ({reg20, $signed($unsigned($signed(reg17)))})
            begin
              reg64 <= ($unsigned((&(8'hbf))) ^ ({$unsigned((~|reg25)),
                      ((reg63 ? wire55 : wire6) | $signed(reg17))} ?
                  reg25[(2'h3):(1'h1)] : ($signed((reg20 ?
                      reg21 : reg13)) >>> ($signed(reg18) ~^ ((8'hbb) - reg18)))));
              reg65 <= $signed($unsigned(((|(reg22 ? wire9 : reg19)) ?
                  $unsigned({(8'hbe), wire8}) : reg62[(2'h2):(2'h2)])));
            end
          else
            begin
              reg64 <= (~$unsigned((((wire55 << wire15) < (reg11 & (8'ha0))) ?
                  reg10[(3'h7):(1'h1)] : ((reg18 >= (8'h9c)) ^ reg18))));
              reg65 <= (8'hb1);
              reg66 <= $signed((reg14[(3'h5):(1'h1)] ?
                  $signed(reg26[(1'h0):(1'h0)]) : reg63));
              reg67 <= wire55[(5'h12):(5'h12)];
            end
          reg68 <= (wire55 && (^~(8'h9e)));
        end
      if ((+$unsigned(($signed((wire5 >> reg65)) - $signed(reg59[(1'h0):(1'h0)])))))
        begin
          reg69 <= $unsigned(($signed((~reg11[(3'h5):(3'h5)])) && reg67));
          reg70 <= reg16[(1'h1):(1'h0)];
        end
      else
        begin
          reg69 <= (&(($signed((reg14 ~^ wire58)) ^~ reg23[(3'h4):(3'h4)]) == reg25[(3'h4):(1'h0)]));
        end
    end
  module71 #() modinst113 (wire112, clk, reg64, reg20, wire5, reg63);
endmodule

module module71
#(parameter param111 = ({(({(8'hbb)} ? ((8'ha3) < (8'had)) : (&(7'h40))) ? (-(!(8'ha6))) : ((!(8'ha2)) ? ((8'h9c) ? (7'h42) : (7'h40)) : (-(8'hab)))), ((((8'hb6) + (8'hbf)) ? (8'hb8) : ((8'hbe) ? (8'hb3) : (8'ha2))) ? ((~|(8'ha9)) ? ((8'h9c) ? (8'h9e) : (8'hb2)) : ((8'hac) < (8'h9c))) : (((8'ha5) ? (8'hbd) : (8'hb4)) ? ((8'hb1) + (8'hbd)) : ((8'hb0) ? (8'ha8) : (8'hb1))))} - (^~({(8'hb4), ((8'ha5) ? (7'h40) : (8'hba))} <<< ((~(7'h43)) < ((8'hb0) ^~ (8'ha1)))))))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire75;
  input wire signed [(5'h15):(1'h0)] wire74;
  input wire signed [(4'h8):(1'h0)] wire73;
  input wire [(4'hc):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(4'ha):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire76;
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire102,
                 wire101,
                 wire84,
                 wire81,
                 wire80,
                 wire78,
                 wire77,
                 wire76,
                 reg104,
                 reg103,
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
                 reg86,
                 reg85,
                 reg83,
                 reg82,
                 reg79,
                 (1'h0)};
  assign wire76 = ($unsigned($unsigned((wire73[(1'h1):(1'h1)] ?
                          ((8'h9f) & wire73) : (~wire73)))) ?
                      wire73[(3'h7):(2'h2)] : ({$signed((wire72 ?
                              wire72 : (8'hbd))),
                          ($signed(wire72) ?
                              (wire75 ?
                                  wire74 : (8'hbc)) : wire73[(3'h6):(3'h5)])} && (&$signed((wire75 && wire74)))));
  assign wire77 = (^wire74[(5'h13):(4'hb)]);
  assign wire78 = $signed($unsigned(wire76[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg79 <= $unsigned(wire77);
    end
  assign wire80 = wire74[(3'h5):(2'h2)];
  assign wire81 = ($unsigned(wire78[(3'h6):(1'h1)]) ?
                      (wire77[(3'h6):(1'h1)] ?
                          wire77[(1'h0):(1'h0)] : (wire80 - {wire77[(3'h6):(3'h5)]})) : (8'hb8));
  always
    @(posedge clk) begin
      reg82 <= wire81[(2'h3):(2'h2)];
      reg83 <= (wire76[(2'h2):(1'h0)] ? reg82[(4'hf):(3'h4)] : wire73);
    end
  assign wire84 = (~^$unsigned((($signed(reg79) ?
                          $unsigned(wire77) : wire76[(1'h1):(1'h0)]) ?
                      (~&(reg82 ? wire78 : wire75)) : wire73)));
  always
    @(posedge clk) begin
      reg85 <= (&($signed(({reg82} ~^ $signed(wire78))) ?
          wire77 : wire73[(3'h4):(3'h4)]));
      if ({wire74,
          ($signed($unsigned((wire73 ? reg83 : wire74))) ?
              wire75 : $unsigned($signed(wire74)))})
        begin
          reg86 <= ((^$unsigned($signed((wire80 ? reg79 : wire78)))) * wire74);
        end
      else
        begin
          reg86 <= wire78[(3'h6):(2'h2)];
          reg87 <= reg85;
        end
      reg88 <= {$unsigned({(+$unsigned((8'hb5)))}),
          $signed($signed($signed($signed(wire84))))};
      if ({$signed($signed(($unsigned(reg82) ?
              (8'ha1) : (reg87 ? reg88 : wire74)))),
          $unsigned(reg87[(4'hb):(4'ha)])})
        begin
          reg89 <= (reg88[(1'h1):(1'h0)] ?
              (reg83[(2'h3):(2'h3)] | (8'h9e)) : wire73[(2'h3):(1'h0)]);
        end
      else
        begin
          reg89 <= (^~{reg83[(2'h2):(1'h1)],
              ($unsigned($signed(wire80)) ~^ reg86)});
          if (wire74)
            begin
              reg90 <= $signed(wire75[(2'h3):(1'h1)]);
              reg91 <= (($unsigned($signed((wire72 ?
                      reg89 : wire77))) - reg88) ?
                  $signed(reg89[(1'h0):(1'h0)]) : reg88[(2'h2):(1'h0)]);
              reg92 <= ({$unsigned($unsigned($signed(reg90)))} - $signed((~^$unsigned(reg88))));
              reg93 <= (~((&((^~(8'hbc)) + $signed(wire73))) | $signed(($signed(wire84) ?
                  (~wire78) : (~|(8'ha2))))));
            end
          else
            begin
              reg90 <= {($unsigned((8'hb3)) > (reg82 ?
                      reg92 : ($unsigned(wire73) > $unsigned(wire76)))),
                  {wire81[(3'h7):(1'h1)]}};
              reg91 <= $unsigned((|(($signed(wire84) ~^ {wire80}) ^ ((8'ha9) ?
                  {wire74, (8'hb2)} : $unsigned(reg87)))));
              reg92 <= ({wire80} + wire77);
            end
          if ($unsigned((8'hb1)))
            begin
              reg94 <= wire72;
              reg95 <= ($signed(reg92) ?
                  {$signed((+(!wire75))),
                      reg89} : $signed((((wire80 ~^ wire76) > (reg87 * wire81)) * reg90)));
              reg96 <= $signed((((reg86 ? (!(8'h9e)) : $unsigned(reg82)) ?
                  (8'hb9) : reg82) <<< (((+reg89) * wire80) ?
                  (wire72[(3'h4):(1'h0)] ~^ (&wire80)) : ($unsigned(reg79) - reg94))));
              reg97 <= (((((~&reg82) ~^ (reg92 >> reg91)) & {(-reg82),
                  (wire77 ? wire81 : reg90)}) + (&{(wire81 ?
                      wire77 : reg82)})) != (reg94 ?
                  (|(8'h9e)) : $signed((reg88 ?
                      (reg95 ? (7'h43) : reg90) : (|reg95)))));
              reg98 <= ((8'hb0) ^ {$signed({(8'haa)})});
            end
          else
            begin
              reg94 <= (~^reg88);
            end
          reg99 <= reg91;
        end
      reg100 <= reg98;
    end
  assign wire101 = $unsigned({reg91});
  assign wire102 = (reg86 & (($unsigned(reg91) ?
                           ((~wire75) ?
                               (~wire76) : $signed((8'hb9))) : ({reg92} ?
                               (^~(8'ha3)) : {reg89})) ?
                       (((wire76 ? reg100 : (8'had)) ? (~|reg95) : (8'hbc)) ?
                           (+(+wire84)) : reg98) : reg79[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg103 <= reg97[(2'h3):(2'h2)];
      reg104 <= (~$signed(wire76));
    end
  assign wire105 = $signed((reg93 || $signed($unsigned((reg94 && reg86)))));
  assign wire106 = (reg92 ~^ ({wire76} <<< ((reg86 ?
                           $signed(reg83) : reg95[(1'h0):(1'h0)]) ?
                       (&$unsigned(reg97)) : reg87)));
  assign wire107 = $unsigned(wire80);
  assign wire108 = {((~{(^wire102),
                           wire84[(4'h8):(3'h4)]}) >> ($unsigned(reg89) >> $unsigned({reg88,
                           (8'hbf)}))),
                       $signed($unsigned((^~wire80)))};
  assign wire109 = reg96[(3'h4):(3'h4)];
  assign wire110 = (!wire102[(1'h1):(1'h1)]);
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire32;
  input wire [(3'h5):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire [(3'h7):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  assign y = {wire54,
                 wire52,
                 wire47,
                 wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg53,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg45,
                 reg34,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= wire29[(2'h3):(2'h3)];
      reg34 <= $unsigned((^($unsigned((wire31 ?
          reg33 : wire30)) >>> ((wire32 + wire30) ?
          {wire29} : (reg33 << reg33)))));
    end
  assign wire35 = $signed({wire29});
  assign wire36 = $unsigned($unsigned($unsigned(wire32)));
  assign wire37 = ({{wire35[(4'hf):(4'hd)]}} ?
                      wire32 : $unsigned((&$unsigned((~|wire28)))));
  assign wire38 = (((^(-wire30[(2'h2):(2'h2)])) ?
                          wire30 : ($signed(((8'hba) ? wire36 : wire29)) ?
                              (-wire30[(2'h2):(1'h1)]) : ((wire30 ?
                                  wire36 : reg33) & (~wire32)))) ?
                      (+$signed($unsigned({wire35}))) : reg33[(2'h3):(1'h1)]);
  assign wire39 = ($unsigned(wire28) ?
                      wire37[(1'h1):(1'h0)] : (~^$unsigned($signed(wire36))));
  assign wire40 = $signed((|(&(~|$unsigned((8'ha2))))));
  assign wire41 = wire28[(3'h7):(3'h7)];
  assign wire42 = $unsigned(wire37[(2'h2):(1'h0)]);
  assign wire43 = reg33[(1'h0):(1'h0)];
  assign wire44 = (~|(wire40 ?
                      ((!((8'h9f) ? wire31 : wire41)) ?
                          (wire37 || ((8'ha8) == wire38)) : wire35[(3'h6):(3'h4)]) : ((~^(-wire38)) * $signed({(8'ha7)}))));
  always
    @(posedge clk) begin
      reg45 <= $unsigned(($signed((wire31 >>> wire35)) ?
          ((~&$signed(wire36)) < $unsigned((wire37 ?
              wire41 : wire43))) : (wire30 ^ $unsigned({wire35, wire28}))));
    end
  assign wire46 = $unsigned((((^(7'h42)) ? wire43 : (!{reg45})) ?
                      wire39[(3'h6):(3'h4)] : $unsigned(((wire40 != wire37) || (wire29 >> (8'hbc))))));
  assign wire47 = ({(wire40[(4'h9):(3'h7)] ?
                          wire36[(2'h3):(2'h3)] : ((~|wire42) > ((8'ha6) << wire30))),
                      $unsigned(($signed(wire40) && $unsigned(wire42)))} - ((wire31 ^ ($signed(wire43) ?
                      {wire36} : $signed(wire38))) && ((&reg34[(1'h1):(1'h1)]) ?
                      (reg34[(1'h1):(1'h0)] ?
                          wire42 : (reg34 > wire38)) : {wire46, wire46})));
  always
    @(posedge clk) begin
      reg48 <= $unsigned(wire30);
      reg49 <= ($signed((|(((8'hba) ? wire46 : (8'hab)) ?
          (reg48 ^~ wire43) : wire47))) != (&reg48[(2'h2):(1'h0)]));
      reg50 <= (~&reg33);
      reg51 <= ($unsigned({reg49}) != reg50[(3'h5):(2'h3)]);
    end
  assign wire52 = ({(((wire40 ? (8'h9f) : wire37) ?
                              (&wire41) : (wire46 * reg33)) ?
                          reg34[(1'h1):(1'h1)] : $signed($signed((8'ha8)))),
                      (wire46 == {(reg49 ~^ wire32),
                          (reg51 <= reg49)})} & ($unsigned(wire30[(1'h0):(1'h0)]) ?
                      $signed(({wire44} == wire30[(3'h4):(1'h1)])) : ($unsigned((&wire32)) & wire35[(4'he):(3'h5)])));
  always
    @(posedge clk) begin
      reg53 <= $signed(wire30[(1'h0):(1'h0)]);
    end
  assign wire54 = $unsigned(((!wire29[(3'h6):(1'h1)]) - wire28));
endmodule

module module137  (y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire142;
  input wire [(2'h3):(1'h0)] wire141;
  input wire [(5'h15):(1'h0)] wire140;
  input wire [(2'h3):(1'h0)] wire139;
  input wire [(4'hf):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire167;
  wire signed [(5'h12):(1'h0)] wire166;
  wire signed [(4'hf):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire164;
  wire signed [(4'he):(1'h0)] wire163;
  wire signed [(3'h4):(1'h0)] wire156;
  wire signed [(2'h3):(1'h0)] wire155;
  wire signed [(5'h12):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire143;
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg161 = (1'h0);
  reg [(4'ha):(1'h0)] reg160 = (1'h0);
  reg [(4'hf):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg157 = (1'h0);
  reg [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire156,
                 wire155,
                 wire145,
                 wire144,
                 wire143,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire143 = wire142[(2'h2):(2'h2)];
  assign wire144 = $unsigned(wire140[(5'h15):(5'h13)]);
  assign wire145 = {wire142};
  always
    @(posedge clk) begin
      reg146 <= wire141[(1'h1):(1'h0)];
      reg147 <= ($unsigned(wire145) + {$signed($signed($unsigned((8'hbd)))),
          $signed($signed(wire143[(3'h6):(1'h1)]))});
      if (((&(((&wire139) ?
          $signed(wire141) : (reg146 ~^ reg146)) ^~ (wire145 >= (wire141 ?
          wire143 : (8'hb4))))) > (8'haf)))
        begin
          reg148 <= ((wire139 ?
              {$unsigned((~^wire145))} : {($signed(wire142) >> $unsigned((8'hb1)))}) <= $signed($unsigned((~|$signed(wire139)))));
        end
      else
        begin
          reg148 <= wire144[(4'hf):(4'hd)];
          reg149 <= $signed((&(wire142 << {{(8'hb0)}})));
          reg150 <= wire144;
          reg151 <= {$unsigned(wire145),
              {(((wire140 ? reg150 : wire143) ? (8'ha4) : (-reg146)) ?
                      wire138[(1'h0):(1'h0)] : (-(~|reg150)))}};
          reg152 <= (((|reg150) ?
                  $signed(((wire143 ? reg150 : wire142) ?
                      (~|reg148) : wire139[(1'h0):(1'h0)])) : (((wire142 ?
                          wire145 : (8'hb8)) & wire141[(2'h2):(2'h2)]) ?
                      reg151[(1'h1):(1'h1)] : wire144[(4'h8):(3'h6)])) ?
              ({(wire138 ~^ {wire139})} ?
                  reg149 : $unsigned($unsigned({wire142,
                      wire139}))) : ($unsigned((((8'hab) ? reg149 : reg150) ?
                  {wire141,
                      wire140} : $signed(wire140))) >>> $signed((&wire140))));
        end
      if (((({(!reg146), (8'haf)} >>> ((~&reg151) ?
          (^~reg148) : $unsigned(reg148))) < wire140[(5'h10):(3'h5)]) == $signed((^reg150))))
        begin
          reg153 <= wire138;
          reg154 <= reg150[(4'hf):(2'h3)];
        end
      else
        begin
          reg153 <= (({$signed((wire144 ^~ wire143))} == $signed(reg154)) ?
              ($unsigned($unsigned((&reg147))) ?
                  (~|wire142[(4'ha):(4'ha)]) : $signed((|wire140))) : $signed((wire144[(1'h1):(1'h1)] == (wire144[(3'h5):(2'h2)] ?
                  reg153[(1'h0):(1'h0)] : {(8'hb9)}))));
        end
    end
  assign wire155 = wire142;
  assign wire156 = (+wire138[(4'hd):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire139[(1'h1):(1'h1)])
        begin
          reg157 <= {(&$unsigned((~reg154))),
              $unsigned({{wire145[(5'h11):(1'h1)]}, {wire140[(3'h6):(3'h6)]}})};
          reg158 <= wire145;
          reg159 <= ((reg146 >= wire140[(4'hd):(3'h7)]) >>> ((wire145 | reg151) ?
              $signed(wire142) : wire140));
        end
      else
        begin
          if ($signed((-(8'ha1))))
            begin
              reg157 <= ((^~{(|reg158[(1'h1):(1'h0)]),
                      ((|wire156) <= reg159[(3'h7):(1'h0)])}) ?
                  wire155[(1'h1):(1'h1)] : $signed(((+(~&reg146)) ?
                      {wire144,
                          (wire139 ? wire140 : reg147)} : $unsigned((reg146 ?
                          reg152 : reg152)))));
            end
          else
            begin
              reg157 <= $unsigned(({wire143} ?
                  wire140 : {$unsigned(((8'had) ? reg158 : wire155))}));
              reg158 <= (reg149[(4'ha):(4'h9)] ?
                  (7'h40) : ($unsigned((+(8'hbb))) ?
                      (wire142[(4'he):(3'h7)] == (((8'hae) << wire144) ?
                          reg146 : (reg148 ^ reg159))) : wire138[(3'h6):(2'h3)]));
              reg159 <= $unsigned(wire141);
              reg160 <= $signed(reg154);
            end
          reg161 <= $unsigned($signed($signed({$signed(reg157), (~&reg149)})));
        end
      reg162 <= (((wire155 & (8'ha5)) | reg158) << (8'hba));
    end
  assign wire163 = reg157[(3'h4):(2'h2)];
  assign wire164 = (^~reg160[(3'h5):(3'h5)]);
  assign wire165 = (~wire156);
  assign wire166 = ($signed(wire143[(3'h4):(1'h1)]) + ((reg162[(3'h6):(3'h5)] ?
                           $signed((~|wire163)) : (~&(wire143 >>> reg151))) ?
                       (8'hb6) : wire139[(2'h3):(1'h1)]));
  assign wire167 = (($unsigned($signed(reg149)) ?
                           $unsigned($signed(reg149)) : ((wire155 ?
                               (wire142 <= wire145) : $unsigned(reg149)) | (^(!reg149)))) ?
                       $unsigned(((reg146[(4'hf):(4'hd)] << $unsigned((8'ha4))) >> $unsigned((reg151 ?
                           wire155 : reg146)))) : {$unsigned($signed((wire141 ?
                               reg154 : wire142))),
                           (reg154 ? (8'ha9) : (~&$unsigned(reg149)))});
  assign wire168 = $unsigned($unsigned((wire141 ?
                       wire145[(4'hc):(4'h9)] : $signed(wire155))));
endmodule
