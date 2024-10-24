module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire202;
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire99,
                 wire101,
                 wire102,
                 wire128,
                 wire130,
                 wire131,
                 wire132,
                 wire202,
                 reg6,
                 (1'h0)};
  assign wire4 = ((^~(!(~&(wire0 ^ (7'h43))))) >= wire0[(1'h0):(1'h0)]);
  assign wire5 = {((+wire2[(3'h5):(3'h5)]) ^ ((^(wire2 * (8'hbd))) ?
                         ((wire0 ? wire1 : wire4) ?
                             wire2[(3'h4):(1'h1)] : $signed(wire3)) : wire3))};
  always
    @(posedge clk) begin
      reg6 <= wire0;
    end
  module7 #() modinst100 (.y(wire99), .wire8(wire4), .clk(clk), .wire10(wire3), .wire11(wire0), .wire9(wire5));
  assign wire101 = $unsigned({reg6[(1'h0):(1'h0)],
                       $signed(((~^wire3) ?
                           $signed(wire1) : (wire0 >>> (8'hb6))))});
  assign wire102 = (wire5[(3'h5):(3'h4)] ?
                       $unsigned($signed(wire2)) : $signed({wire2}));
  module103 #() modinst129 (.y(wire128), .wire107(wire102), .wire105(wire99), .wire106(wire5), .wire104(wire1), .clk(clk));
  assign wire130 = wire5;
  assign wire131 = (wire3 >>> ({$unsigned(wire2)} ^ {(-{wire2, wire102}),
                       wire3}));
  assign wire132 = (~&(7'h40));
  module133 #() modinst203 (.wire137(wire3), .wire134(wire132), .y(wire202), .wire135(wire128), .wire136(reg6), .clk(clk));
endmodule

module module133
#(parameter param201 = ({(~&(((8'hab) >>> (8'ha7)) >> ((8'ha1) | (8'hbf)))), ((8'had) - (+(-(8'hbd))))} ? ((|(~^{(7'h41), (8'h9f)})) << ((7'h43) ? (~^(~|(7'h42))) : (~^((8'h9f) ? (8'h9d) : (8'hbb))))) : ((^(((7'h44) ~^ (8'h9f)) > (8'ha0))) != {(-((8'hac) > (7'h43)))})))
(y, clk, wire134, wire135, wire136, wire137);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire134;
  input wire [(4'hb):(1'h0)] wire135;
  input wire [(5'h15):(1'h0)] wire136;
  input wire [(4'hc):(1'h0)] wire137;
  wire signed [(2'h2):(1'h0)] wire200;
  wire signed [(5'h12):(1'h0)] wire199;
  wire signed [(2'h2):(1'h0)] wire198;
  wire signed [(5'h15):(1'h0)] wire197;
  wire [(4'hd):(1'h0)] wire196;
  wire signed [(2'h3):(1'h0)] wire195;
  wire [(5'h13):(1'h0)] wire194;
  wire [(5'h11):(1'h0)] wire193;
  wire signed [(5'h12):(1'h0)] wire192;
  wire [(4'hc):(1'h0)] wire191;
  wire [(4'hc):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire139;
  wire [(3'h4):(1'h0)] wire189;
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire138,
                 wire139,
                 wire189,
                 (1'h0)};
  assign wire138 = $signed(wire135);
  assign wire139 = ({$unsigned(wire135[(3'h7):(1'h0)]),
                       $unsigned((wire136 ?
                           (wire137 ? wire138 : wire138) : {wire135,
                               wire134}))} | $unsigned($unsigned((wire138 & $unsigned(wire135)))));
  module140 #() modinst190 (.wire145(wire136), .clk(clk), .wire144(wire139), .y(wire189), .wire142(wire138), .wire143(wire134), .wire141(wire137));
  assign wire191 = $signed($unsigned(wire135));
  assign wire192 = ((wire137 ?
                       wire136[(4'hd):(3'h6)] : $unsigned((!$unsigned((7'h43))))) ~^ (~|$unsigned($unsigned($unsigned((8'hb7))))));
  assign wire193 = ($signed($unsigned({(wire139 ? wire192 : wire135)})) ?
                       wire134[(3'h7):(3'h4)] : $unsigned((8'hbc)));
  assign wire194 = wire192;
  assign wire195 = wire189;
  assign wire196 = $unsigned(((|(8'hb5)) ^ (($signed(wire194) ?
                           wire139[(3'h4):(1'h0)] : ((8'h9c) || wire194)) ?
                       ((wire195 ? (8'hbe) : wire193) >> (wire135 ?
                           wire192 : wire135)) : {{wire136, wire139},
                           ((8'hbe) ? wire134 : wire191)})));
  assign wire197 = wire191;
  assign wire198 = wire139[(5'h11):(4'he)];
  assign wire199 = ($signed({(~&wire136), wire138}) ^~ (-$signed(wire135)));
  assign wire200 = $unsigned((|(((+wire135) ?
                       wire191[(3'h5):(1'h1)] : (^~wire193)) || (~^{wire139}))));
endmodule

module module103  (y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire107;
  input wire signed [(4'he):(1'h0)] wire106;
  input wire [(5'h13):(1'h0)] wire105;
  input wire [(4'ha):(1'h0)] wire104;
  wire signed [(5'h11):(1'h0)] wire127;
  wire signed [(3'h4):(1'h0)] wire108;
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  assign y = {wire127,
                 wire108,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
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
                 (1'h0)};
  assign wire108 = {wire106,
                       ($unsigned(wire104[(4'h9):(3'h4)]) ?
                           wire105 : ($unsigned((wire107 ? wire107 : wire104)) ?
                               (8'hb9) : $unsigned($unsigned(wire107))))};
  always
    @(posedge clk) begin
      reg109 <= (~&$signed((^~$unsigned(((7'h44) ? wire104 : wire108)))));
      if (wire104)
        begin
          reg110 <= reg109[(1'h0):(1'h0)];
          reg111 <= wire105[(4'hb):(3'h6)];
          reg112 <= reg109;
          reg113 <= reg111[(4'h9):(4'h8)];
        end
      else
        begin
          reg110 <= ((~{$signed((8'ha6))}) ?
              $signed((~|$signed($unsigned((8'ha0))))) : wire104[(4'h9):(3'h5)]);
          reg111 <= $unsigned((($unsigned(wire104) ?
              $unsigned($unsigned(reg113)) : {wire107[(2'h3):(2'h3)],
                  reg112[(1'h0):(1'h0)]}) > $unsigned((((8'ha8) != wire104) && (reg112 ?
              reg110 : wire106)))));
          reg112 <= reg112;
          if (reg109[(3'h4):(1'h1)])
            begin
              reg113 <= (wire105[(1'h1):(1'h1)] ?
                  (~(~^((wire107 >>> (8'hb7)) ?
                      wire108[(3'h4):(2'h2)] : (wire106 | (8'hbb))))) : wire105);
            end
          else
            begin
              reg113 <= {((((^reg111) ?
                          $signed(wire107) : reg110[(1'h1):(1'h0)]) & ($signed(wire104) ?
                          $signed(wire105) : reg110)) ?
                      $signed(((+reg111) < reg109)) : $unsigned($signed((~|(8'hb8))))),
                  ((~|$unsigned((reg109 || (8'hb7)))) ?
                      (+((reg112 != wire105) > (wire104 >= (8'haa)))) : (wire108[(1'h1):(1'h1)] >>> reg113[(5'h14):(4'ha)]))};
              reg114 <= $unsigned($unsigned(wire104[(3'h5):(2'h3)]));
              reg115 <= (+$unsigned(reg109[(4'ha):(4'h8)]));
            end
          reg116 <= reg111;
        end
      reg117 <= wire108;
    end
  always
    @(posedge clk) begin
      reg118 <= $unsigned((((((8'had) ? (8'hb4) : (8'ha3)) ?
              $signed(wire105) : (reg115 ?
                  reg111 : (8'h9d))) >>> (((8'ha9) != reg110) || {reg114})) ?
          $signed(($signed(reg115) && (wire107 != wire105))) : (^~reg112[(2'h2):(1'h1)])));
      reg119 <= ({reg118[(4'hc):(3'h7)]} ?
          (+reg118[(4'hb):(3'h6)]) : (~(((reg118 > wire104) ?
                  (~|wire107) : (reg117 ? wire106 : reg117)) ?
              ((|wire106) ~^ $signed(reg114)) : {{reg111, wire108}})));
      if ((+reg110))
        begin
          if (wire104[(3'h4):(2'h2)])
            begin
              reg120 <= $unsigned(reg109);
            end
          else
            begin
              reg120 <= (($unsigned(((-(8'ha3)) ?
                  (reg118 ? reg113 : (8'hb0)) : (reg109 ?
                      (7'h41) : wire105))) > wire108) >> (~|$unsigned($unsigned(wire105[(5'h10):(2'h2)]))));
              reg121 <= ({{wire108[(1'h0):(1'h0)],
                      $unsigned((wire107 ? reg115 : wire105))},
                  reg113[(4'hd):(3'h5)]} ^ $signed({wire104[(3'h5):(3'h4)]}));
              reg122 <= (~(wire105[(3'h6):(3'h4)] ~^ reg112[(2'h3):(1'h0)]));
              reg123 <= reg114;
            end
          reg124 <= $signed((~|($signed(reg112[(1'h0):(1'h0)]) ?
              (reg111[(1'h0):(1'h0)] != $signed(reg114)) : ((reg109 < wire108) - (~|reg111)))));
        end
      else
        begin
          reg120 <= ($unsigned($unsigned({$unsigned(reg121)})) < (reg116[(2'h3):(1'h1)] && $unsigned(($signed(wire106) <<< wire107[(1'h0):(1'h0)]))));
          reg121 <= $signed(reg111[(4'hf):(3'h7)]);
          reg122 <= reg119[(4'hd):(3'h5)];
          reg123 <= ((((reg122 ?
                  (reg113 ? reg116 : wire106) : $signed(reg117)) ?
              $signed(((8'hae) && (8'hb9))) : $unsigned({reg115,
                  reg122})) < {$signed($unsigned(reg122)),
              reg119}) & wire105[(5'h12):(1'h0)]);
        end
      reg125 <= $unsigned($signed(((^(-reg116)) >>> wire108[(3'h4):(2'h2)])));
      reg126 <= reg112[(2'h2):(1'h1)];
    end
  assign wire127 = ((8'hbc) - reg115[(2'h2):(2'h2)]);
endmodule

module module7
#(parameter param98 = ({(((8'h9f) ? ((8'hb1) && (8'ha2)) : {(8'hb3)}) <= (~^(^(7'h44)))), ((((8'hbf) ? (8'hae) : (8'hac)) ? ((7'h41) - (8'ha7)) : (+(8'hbf))) ? (((8'h9e) > (8'hba)) >> {(8'hae)}) : {(|(8'hb4))})} ? ((7'h42) >= ((((8'hb7) >= (8'hb6)) ? (^(8'h9d)) : ((8'hb8) ? (8'ha8) : (8'hb5))) ? {(^(8'ha2)), {(8'hbe), (8'haa)}} : {(~&(8'ha0)), ((8'hab) | (8'haf))})) : (^~(({(8'hb4)} ? ((8'hb7) << (8'hb5)) : (~^(8'h9e))) ? (((8'ha6) || (8'hbe)) ? (~|(8'h9c)) : ((8'hb0) < (8'ha5))) : (!((8'hbd) ? (8'hbd) : (8'ha0)))))))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  wire [(4'h8):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire56;
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire96,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire59,
                 wire58,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire56,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= wire8[(2'h2):(2'h2)];
      reg13 <= $signed(wire11[(2'h3):(2'h3)]);
      reg14 <= wire9[(3'h5):(3'h5)];
    end
  assign wire15 = ((wire9 < (($unsigned(wire9) ?
                      ((8'h9d) ? wire10 : reg13) : (reg12 ?
                          wire10 : wire10)) > (+((8'hb4) ^~ wire10)))) && (reg13[(1'h1):(1'h0)] ?
                      $unsigned((-$signed(wire11))) : $unsigned(reg13)));
  assign wire16 = wire8;
  assign wire17 = $signed({$unsigned({wire11[(5'h10):(1'h0)]})});
  assign wire18 = (~^wire15[(2'h3):(2'h2)]);
  assign wire19 = (~^{($unsigned($unsigned((8'ha7))) ?
                          ($unsigned(wire9) ?
                              (wire16 ?
                                  reg12 : wire17) : $unsigned(wire18)) : $unsigned({(8'hbc),
                              wire15}))});
  module20 #() modinst57 (.wire21(wire18), .wire23(wire11), .wire25(wire19), .clk(clk), .wire24(wire17), .wire22(wire8), .y(wire56));
  assign wire58 = $signed((^~(&$unsigned((wire17 ? wire16 : wire16)))));
  assign wire59 = ($signed({wire18[(3'h5):(3'h4)]}) ?
                      $unsigned((~^$signed($unsigned(wire16)))) : wire11[(3'h5):(3'h4)]);
  always
    @(posedge clk) begin
      if (wire59)
        begin
          reg60 <= (wire59 && (wire58 ?
              $unsigned((~&(8'hbc))) : $unsigned($signed($signed(wire9)))));
          reg61 <= ($signed(wire17) || ($unsigned(((wire10 ? wire19 : reg13) ?
              {(8'hba)} : $unsigned(wire10))) <= wire10[(1'h1):(1'h1)]));
          reg62 <= {reg12, wire11};
          if (wire18[(4'hc):(3'h5)])
            begin
              reg63 <= wire15;
              reg64 <= reg14[(3'h5):(3'h4)];
              reg65 <= $unsigned(({(&(reg63 ?
                      reg13 : wire17))} > ($signed((wire18 || reg64)) ^~ $signed((wire11 + (8'hb7))))));
              reg66 <= ($unsigned($unsigned(wire19[(3'h5):(3'h4)])) ?
                  $signed(($unsigned($signed(wire58)) ?
                      $signed(wire18) : (+((8'h9d) ~^ wire15)))) : ((reg62[(2'h2):(1'h1)] > $signed(((8'hb3) ?
                          wire18 : wire19))) ?
                      $unsigned(reg62) : wire19[(3'h7):(3'h5)]));
              reg67 <= {reg63[(4'h9):(1'h0)],
                  $signed((reg66 <= ((!reg14) - (reg60 ? reg63 : reg65))))};
            end
          else
            begin
              reg63 <= $signed((reg65[(5'h13):(3'h6)] <= wire59));
              reg64 <= $unsigned((wire15[(2'h2):(2'h2)] ^~ $signed((~&$unsigned(reg13)))));
            end
        end
      else
        begin
          if ($signed($unsigned(wire11[(1'h1):(1'h0)])))
            begin
              reg60 <= $unsigned((+$unsigned((((7'h42) >> wire17) ?
                  reg14[(4'hb):(1'h1)] : $signed((8'h9d))))));
              reg61 <= $unsigned(reg64[(3'h5):(3'h4)]);
              reg62 <= ($signed((-($signed(wire18) == (~|wire17)))) || $unsigned(wire10[(3'h4):(2'h3)]));
            end
          else
            begin
              reg60 <= wire11[(1'h1):(1'h0)];
              reg61 <= $unsigned(wire11[(5'h14):(4'hd)]);
              reg62 <= wire9[(4'ha):(4'h8)];
              reg63 <= $unsigned($signed((~&{{reg64, (8'hb4)}})));
            end
          if (reg64)
            begin
              reg64 <= {($signed((~wire8)) + $signed($unsigned(reg66[(4'hc):(3'h4)]))),
                  $unsigned({$unsigned({wire9, reg13}),
                      $unsigned($unsigned(reg67))})};
              reg65 <= (wire17[(3'h4):(2'h3)] | ((($unsigned((8'ha9)) ^ $signed(wire11)) & (~^{wire9,
                  reg13})) && (~($unsigned(wire59) ^ (~reg14)))));
            end
          else
            begin
              reg64 <= ((+$signed($unsigned($signed(wire17)))) - reg60[(1'h0):(1'h0)]);
              reg65 <= $signed(reg12[(3'h6):(1'h1)]);
              reg66 <= $signed((+($signed({reg14}) ?
                  (wire17 != (wire9 + wire19)) : $signed((reg60 ?
                      reg64 : reg67)))));
              reg67 <= ((~|wire16) ?
                  reg63 : ((wire10[(2'h2):(1'h0)] ?
                          reg62 : (wire59[(4'hf):(4'hd)] ?
                              $signed(reg64) : {wire58, reg14})) ?
                      (~^($unsigned(wire9) >> (~^reg65))) : wire56));
              reg68 <= reg62[(1'h1):(1'h1)];
            end
        end
      reg69 <= ((~&($signed((reg68 ? wire18 : wire15)) ?
              {(~|wire58),
                  reg61[(4'hc):(4'h9)]} : $unsigned($unsigned(reg68)))) ?
          (8'had) : (^~(($signed(reg67) ?
              reg68 : (|reg14)) < ((+(8'ha0)) == $unsigned(wire9)))));
      reg70 <= (8'hb2);
      reg71 <= (|(7'h43));
      if ((+$unsigned({($signed(wire15) ? $signed((8'h9d)) : $unsigned(reg67)),
          (!$unsigned(reg61))})))
        begin
          reg72 <= (reg60[(1'h1):(1'h1)] || (~^{(((8'h9f) ?
                  wire56 : wire15) || (wire19 ? reg67 : reg12))}));
          reg73 <= (reg61 ? wire9[(4'h8):(3'h4)] : reg71);
          reg74 <= $unsigned((+$unsigned(reg12)));
        end
      else
        begin
          reg72 <= {$unsigned(reg14),
              (-(reg65 + (reg71[(1'h0):(1'h0)] ?
                  (reg71 ? reg70 : wire15) : reg62[(1'h0):(1'h0)])))};
        end
    end
  assign wire75 = ((reg72[(2'h3):(2'h2)] ?
                      ($signed((~^reg62)) ?
                          (^$unsigned((7'h43))) : $signed($unsigned(wire59))) : {$unsigned(reg69),
                          $unsigned((wire9 << (7'h42)))}) && (|$signed((!wire19[(1'h0):(1'h0)]))));
  assign wire76 = (|$signed((wire56 ?
                      (reg68[(3'h6):(2'h2)] > wire75) : (+wire10[(2'h3):(2'h2)]))));
  assign wire77 = (wire17 ?
                      $unsigned((reg66[(2'h3):(2'h2)] ?
                          reg65[(1'h1):(1'h1)] : {(wire16 ?
                                  reg14 : wire75)})) : reg63[(3'h4):(2'h2)]);
  assign wire78 = (7'h44);
  assign wire79 = (((reg67 ? reg72[(4'ha):(1'h1)] : wire15) ?
                      reg67 : (8'h9f)) <<< $unsigned(((~|(~wire16)) ?
                      $unsigned((reg64 >> wire56)) : $signed($unsigned(reg72)))));
  assign wire80 = $unsigned((((wire8[(1'h0):(1'h0)] ?
                              {wire77, wire59} : (reg69 || wire17)) ?
                          (|$unsigned((8'hb5))) : (reg72 || (wire78 ^~ wire15))) ?
                      ((reg63 ? ((8'ha7) > reg67) : $signed(wire19)) ?
                          $unsigned((reg13 ?
                              (8'hb8) : reg72)) : $signed((wire11 ?
                              reg12 : wire17))) : reg68[(3'h5):(1'h0)]));
  assign wire81 = {({$signed((reg70 > reg67))} ?
                          (~&(-$signed(reg63))) : $signed($unsigned((reg72 == wire76)))),
                      ($unsigned($unsigned(wire19[(4'hb):(4'hb)])) ?
                          {wire15} : reg60)};
  assign wire82 = wire56;
  assign wire83 = (wire59[(1'h0):(1'h0)] >= $unsigned({{((8'hb5) << wire15),
                          $unsigned(wire56)},
                      reg67}));
  module84 #() modinst97 (.wire86(wire79), .wire88(reg73), .wire87(reg63), .y(wire96), .clk(clk), .wire85(wire10));
endmodule

module module84
#(parameter param95 = (~&(|(((~&(8'hb4)) ? ((7'h42) ~^ (7'h41)) : ((8'hbe) ? (8'hab) : (8'hbb))) >= (((8'hae) ? (8'h9d) : (8'ha2)) ? ((8'hbb) ? (8'ha9) : (8'hbc)) : ((8'hb9) + (8'hbe)))))))
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire88;
  input wire signed [(5'h11):(1'h0)] wire87;
  input wire signed [(3'h5):(1'h0)] wire86;
  input wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire [(5'h15):(1'h0)] wire89;
  assign y = {wire94, wire93, wire92, wire91, wire90, wire89, (1'h0)};
  assign wire89 = wire87;
  assign wire90 = {($unsigned(wire89[(3'h6):(3'h5)]) ?
                          (($unsigned((7'h43)) ?
                              wire85 : wire87) + (wire89[(4'ha):(3'h5)] ?
                              $unsigned((8'hb7)) : $unsigned(wire89))) : wire89[(4'hc):(3'h5)])};
  assign wire91 = wire87;
  assign wire92 = $unsigned(({wire86} ?
                      wire91 : (wire90[(3'h5):(3'h4)] ?
                          $signed($unsigned(wire88)) : {(8'hab),
                              $signed(wire87)})));
  assign wire93 = wire87[(4'ha):(4'ha)];
  assign wire94 = wire88[(2'h2):(1'h1)];
endmodule

module module20
#(parameter param55 = ((!(~^(((8'ha4) ? (8'hb7) : (8'hbd)) >= (7'h41)))) <<< ((((8'ha3) ? {(8'ha0)} : (~^(8'hb2))) >>> (((8'ha4) ? (8'hb1) : (8'h9d)) ? ((8'ha2) ? (8'haa) : (8'hb9)) : (~&(8'h9c)))) ? ((|((8'hac) ^~ (8'hb5))) * {((8'hb0) <<< (8'hb0))}) : (8'ha3))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire24;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire35,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
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
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire26 = wire24;
  assign wire27 = (|{wire24, $unsigned(wire22[(4'h9):(2'h3)])});
  assign wire28 = wire21;
  assign wire29 = (|((wire22[(5'h14):(4'hd)] ?
                          (wire25 ? (8'hb0) : {wire22}) : wire26) ?
                      {wire26[(3'h5):(2'h3)],
                          ({wire22} ?
                              $unsigned(wire25) : $signed(wire26))} : $unsigned($signed($unsigned(wire27)))));
  always
    @(posedge clk) begin
      reg30 <= (^~(-$signed(wire27)));
      reg31 <= wire23[(3'h5):(2'h3)];
      if ((&((8'haf) <<< (($signed(wire25) | $signed((8'hbd))) ^~ wire24[(5'h11):(4'hd)]))))
        begin
          reg32 <= (7'h42);
          reg33 <= $signed($unsigned(((!(wire24 * wire27)) >= ((wire21 || wire21) << (~&(8'hbe))))));
        end
      else
        begin
          reg32 <= ($unsigned(wire21) != wire26[(3'h7):(2'h3)]);
          reg33 <= (-$signed(wire28[(3'h5):(3'h5)]));
          reg34 <= $unsigned(reg31);
        end
    end
  assign wire35 = $signed(wire22);
  always
    @(posedge clk) begin
      reg36 <= (~^(reg31[(2'h2):(2'h2)] ?
          $signed(((^wire26) ?
              wire21[(1'h1):(1'h0)] : $signed((8'ha5)))) : $signed($unsigned($unsigned((8'hbc))))));
      reg37 <= $signed(reg31);
      if (reg36)
        begin
          reg38 <= wire22;
        end
      else
        begin
          if (reg38)
            begin
              reg38 <= (!$unsigned(wire25));
            end
          else
            begin
              reg38 <= (~^wire25[(4'ha):(4'ha)]);
              reg39 <= ({($unsigned((^~reg34)) == $unsigned((reg33 ?
                      reg37 : reg31)))} == (|wire26[(1'h0):(1'h0)]));
              reg40 <= ((wire22 ?
                      $unsigned(((&wire25) <= (reg32 ?
                          reg31 : reg36))) : wire23[(1'h0):(1'h0)]) ?
                  (~|(~|($unsigned(wire21) ?
                      $signed(wire23) : reg36))) : $unsigned(reg37));
              reg41 <= (!$unsigned($signed(reg39)));
              reg42 <= (reg34[(4'h8):(2'h3)] ?
                  {reg39, $signed(((&wire26) ~^ (wire35 ~^ wire24)))} : reg41);
            end
          reg43 <= $unsigned((reg33[(3'h5):(1'h0)] ?
              (~$unsigned($unsigned(wire24))) : (wire28[(1'h0):(1'h0)] ?
                  $unsigned((reg41 && reg32)) : ((8'hbf) ?
                      $unsigned(reg42) : wire28[(1'h1):(1'h1)]))));
          if ((~^reg38[(4'h8):(2'h2)]))
            begin
              reg44 <= ($signed((((reg33 >> wire21) >>> (8'hba)) || reg36)) >> $signed(reg37[(3'h6):(1'h1)]));
              reg45 <= (&wire27);
              reg46 <= ((~&($unsigned((reg34 || (8'hb1))) ?
                  ({reg34, wire22} ?
                      $signed((8'hac)) : $unsigned(wire28)) : (8'h9e))) > $unsigned($signed(((+reg36) << reg37[(3'h4):(3'h4)]))));
              reg47 <= (~((~&$signed((wire28 <<< reg39))) >>> $unsigned(($unsigned(wire22) * {reg43,
                  wire21}))));
            end
          else
            begin
              reg44 <= $signed((|reg41[(4'hf):(2'h2)]));
              reg45 <= $signed(($signed(reg33[(4'h8):(1'h1)]) ?
                  wire22[(4'h8):(3'h6)] : $signed($signed((reg47 ?
                      reg32 : reg40)))));
            end
        end
      reg48 <= $signed(reg33);
      reg49 <= ($unsigned((+$unsigned((reg41 ? wire22 : reg47)))) ?
          {((^(wire29 ? reg46 : wire28)) > (~^(reg36 ?
                  wire24 : wire29)))} : $signed((!(!(reg47 ?
              (7'h43) : reg39)))));
    end
  assign wire50 = reg41;
  assign wire51 = reg37;
  assign wire52 = (wire29 ? $signed(($unsigned(wire29) | reg42)) : wire35);
  assign wire53 = (~$unsigned((reg30 ?
                      reg49[(4'ha):(1'h0)] : ((wire23 ~^ reg39) < $signed(wire52)))));
  assign wire54 = (reg45[(3'h6):(3'h6)] ?
                      $unsigned($signed($signed({wire51,
                          wire29}))) : $signed(reg37));
endmodule

module module140
#(parameter param187 = ((({(+(8'ha7))} >> (^(!(8'hb7)))) ? (!{((8'hb5) ? (8'ha9) : (7'h43))}) : ((~&(!(8'h9f))) <= (((8'ha3) >>> (8'haa)) ? ((8'hac) ? (8'hb4) : (8'hbb)) : (~&(8'had))))) ? {(({(7'h43), (8'hb4)} != ((8'haf) ? (8'ha3) : (8'hb7))) ? (((8'hb0) ~^ (8'ha6)) ? ((7'h42) << (8'hb4)) : (~^(8'hbe))) : (((8'h9e) ? (8'hb4) : (8'ha3)) >>> (~|(8'hbd))))} : (~&((|{(8'ha9), (8'hbc)}) ^~ ((~|(7'h40)) || ((8'ha0) ^~ (8'hac)))))), 
parameter param188 = (param187 <<< ((-param187) ? ((^~((8'h9c) ^ param187)) != (param187 ? (7'h43) : (+param187))) : (((!(8'haf)) - {param187}) != ((param187 || param187) ? param187 : (param187 ? param187 : param187))))))
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire145;
  input wire signed [(5'h12):(1'h0)] wire144;
  input wire [(2'h2):(1'h0)] wire143;
  input wire [(3'h7):(1'h0)] wire142;
  input wire [(4'hc):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire186;
  wire signed [(3'h4):(1'h0)] wire185;
  wire signed [(3'h4):(1'h0)] wire184;
  wire signed [(4'hf):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire180;
  wire signed [(4'hb):(1'h0)] wire179;
  wire signed [(5'h11):(1'h0)] wire167;
  wire signed [(4'hc):(1'h0)] wire165;
  wire signed [(4'h9):(1'h0)] wire159;
  wire [(4'hb):(1'h0)] wire158;
  wire [(3'h6):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire156;
  wire [(5'h14):(1'h0)] wire155;
  wire [(4'hc):(1'h0)] wire147;
  wire [(4'hd):(1'h0)] wire146;
  reg signed [(5'h12):(1'h0)] reg183 = (1'h0);
  reg [(5'h10):(1'h0)] reg182 = (1'h0);
  reg [(4'he):(1'h0)] reg178 = (1'h0);
  reg [(2'h3):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(4'hb):(1'h0)] reg170 = (1'h0);
  reg [(5'h14):(1'h0)] reg169 = (1'h0);
  reg [(5'h14):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg166 = (1'h0);
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg153 = (1'h0);
  reg signed [(4'he):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire181,
                 wire180,
                 wire179,
                 wire167,
                 wire165,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire147,
                 wire146,
                 reg183,
                 reg182,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg166,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  assign wire146 = $signed((~&$unsigned(wire141)));
  assign wire147 = wire141;
  always
    @(posedge clk) begin
      reg148 <= ($unsigned((($unsigned(wire147) ?
              $unsigned(wire141) : $unsigned(wire145)) <= (-(wire145 ?
              wire146 : (8'ha6))))) ?
          wire145 : $unsigned(wire144[(5'h11):(2'h2)]));
      reg149 <= wire146[(3'h4):(1'h1)];
      reg150 <= reg148;
      if (($signed((((wire141 != wire147) >= ((8'hbd) ?
          wire144 : wire141)) ~^ (~|(~|(7'h42))))) > {wire141[(2'h2):(1'h1)],
          $unsigned(wire143[(1'h0):(1'h0)])}))
        begin
          reg151 <= ((wire144[(3'h6):(2'h3)] ?
                  wire143 : ($signed((~&wire144)) & reg148[(1'h1):(1'h0)])) ?
              ((^~{{reg150, reg150}}) ?
                  reg150 : ($unsigned(wire141) ^~ ($signed(reg150) * wire144))) : $signed(reg150[(4'hd):(3'h5)]));
          reg152 <= ((&((~&(8'h9f)) ^~ reg148[(3'h4):(1'h0)])) ?
              reg148 : wire142[(2'h3):(2'h2)]);
          reg153 <= $unsigned((^~(-$signed(((7'h40) ? wire141 : (8'hbc))))));
          reg154 <= {(!(+(~^wire142[(3'h6):(2'h2)]))),
              ((~&{{reg149, reg149}, (^reg148)}) ?
                  $unsigned((!reg148[(3'h5):(2'h2)])) : $signed(({wire141,
                      wire143} ^ $unsigned(wire143))))};
        end
      else
        begin
          reg151 <= wire146;
        end
    end
  assign wire155 = (-$unsigned((8'hb4)));
  assign wire156 = (($signed($signed($unsigned((8'haa)))) ?
                           $signed($unsigned(((8'haa) ?
                               wire144 : reg154))) : (8'ha3)) ?
                       reg153 : (~|wire141[(4'hb):(4'h8)]));
  assign wire157 = (({wire143, $unsigned($unsigned(wire141))} ?
                       wire145[(4'hf):(1'h1)] : reg152) != ((($unsigned(reg149) ?
                               wire141[(1'h1):(1'h1)] : (wire146 == wire156)) ?
                           (((8'hae) ?
                               wire141 : wire144) <= reg151[(3'h6):(2'h2)]) : ($unsigned(reg149) ?
                               (wire155 ?
                                   wire146 : reg153) : $signed(reg154))) ?
                       (&({wire146} ^ $unsigned(wire155))) : reg151));
  assign wire158 = ($signed($unsigned(reg151[(4'hc):(1'h1)])) >= $unsigned({((!reg153) + {wire144,
                           reg152})}));
  assign wire159 = $unsigned($signed($signed((wire144[(3'h4):(2'h3)] >>> wire141))));
  always
    @(posedge clk) begin
      reg160 <= ($unsigned($unsigned((^~$unsigned(wire143)))) ?
          $unsigned((^~wire155)) : $signed($signed({(reg154 & wire156),
              wire145})));
      reg161 <= (((wire142 == (((8'hb8) > reg150) ?
              (wire143 - wire155) : {(8'hae), wire158})) ?
          reg154 : ({reg148[(2'h3):(1'h1)]} << reg148[(3'h4):(1'h1)])) | {$unsigned(reg153)});
      reg162 <= {(reg148 - reg153), wire158};
      reg163 <= (~&(~$unsigned(({reg149} ?
          wire144[(1'h1):(1'h1)] : $unsigned(wire145)))));
      reg164 <= reg163;
    end
  assign wire165 = (((^$unsigned(((8'ha2) + wire147))) ?
                           $unsigned(($unsigned(wire142) & $unsigned(wire145))) : $signed(wire144)) ?
                       ($signed(($unsigned(wire155) ?
                           ((8'had) == reg154) : reg152[(2'h3):(1'h0)])) << $signed(((~&reg148) ?
                           reg164 : $signed(wire145)))) : (-(~{(wire142 < reg163)})));
  always
    @(posedge clk) begin
      reg166 <= $signed(((reg153 ?
              ((wire158 + wire165) ?
                  wire156 : (wire156 <= (8'hb4))) : $signed((reg164 > wire145))) ?
          reg150[(4'he):(1'h0)] : (-(reg164[(4'hd):(3'h6)] ?
              (!reg150) : wire142[(3'h4):(1'h0)]))));
    end
  assign wire167 = ((reg161 ?
                           $signed(((reg154 ? reg162 : wire156) ?
                               (reg161 ^ wire165) : (reg154 ?
                                   wire147 : reg152))) : (~|(~|reg160))) ?
                       (({(reg151 ? wire158 : (8'hbf)), (~|reg164)} ?
                               (&(reg163 & reg149)) : ($signed(reg148) <<< (wire145 ?
                                   reg149 : wire158))) ?
                           (~&(reg148 == $unsigned(reg164))) : (wire143[(2'h2):(1'h0)] || (((8'hb4) ^ (8'ha4)) * wire141[(3'h4):(1'h0)]))) : $unsigned(((wire158 ?
                               $unsigned(wire155) : $signed(wire143)) ?
                           $unsigned((-(8'ha3))) : reg149[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      if (wire147[(4'hb):(4'h9)])
        begin
          reg168 <= wire156;
        end
      else
        begin
          if ($unsigned($unsigned((8'ha5))))
            begin
              reg168 <= $unsigned($signed(((~$signed(reg148)) ?
                  wire141 : $signed((~^reg162)))));
            end
          else
            begin
              reg168 <= (~|wire142[(3'h6):(2'h3)]);
              reg169 <= ($signed(reg166) <= $unsigned(($unsigned({reg168,
                      wire159}) ?
                  reg160 : wire157)));
              reg170 <= $signed(($unsigned(wire155) ?
                  (8'hb5) : (^~(~|reg162[(1'h1):(1'h1)]))));
            end
          reg171 <= $unsigned((reg153[(1'h1):(1'h1)] & (^(reg151[(3'h7):(3'h5)] > {reg161,
              wire158}))));
          reg172 <= (reg168[(3'h5):(1'h0)] ?
              ($unsigned($unsigned((wire158 ?
                  wire158 : wire147))) - ($signed($unsigned(reg171)) != $signed(reg162[(1'h0):(1'h0)]))) : reg148[(3'h5):(2'h2)]);
          if ($signed((~^((wire158[(4'hb):(4'hb)] == {wire156}) + (~{wire155,
              wire165})))))
            begin
              reg173 <= wire147;
              reg174 <= ((reg162[(2'h2):(1'h1)] ?
                      ((reg164 ? ((8'ha3) - wire167) : (~|(8'hbb))) ?
                          ($signed(reg166) == $unsigned(wire155)) : reg164) : $unsigned(reg164[(4'ha):(1'h0)])) ?
                  ((wire159[(2'h3):(1'h1)] >= {(reg173 + wire167),
                      {wire158,
                          (8'hbd)}}) | $unsigned((+(wire141 <<< (8'hbe))))) : (wire159 ?
                      reg166 : $signed(reg150)));
            end
          else
            begin
              reg173 <= (reg151 ?
                  {$unsigned(({reg152, reg169} ?
                          (reg149 > reg169) : $signed(reg160)))} : reg149[(1'h0):(1'h0)]);
              reg174 <= ($signed((reg163[(3'h7):(1'h0)] >= ((reg174 ?
                  (8'haf) : reg170) << (reg173 ?
                  reg149 : reg162)))) <= wire142[(2'h3):(2'h2)]);
              reg175 <= $unsigned(((8'h9f) ?
                  ($signed((reg169 < reg162)) ?
                      $signed(reg152[(3'h7):(2'h3)]) : {wire158,
                          $unsigned(reg148)}) : ($unsigned(reg170[(3'h7):(3'h6)]) ^~ ((^wire143) ~^ ((8'hb2) ^~ wire159)))));
              reg176 <= (wire159[(3'h7):(3'h5)] ?
                  $signed(($signed((wire155 <= wire144)) | (+reg173))) : reg174);
            end
        end
      if ((~^(+(~&((wire156 || reg173) ?
          (reg153 ? wire159 : wire143) : reg152)))))
        begin
          reg177 <= ($unsigned($unsigned($unsigned($signed(reg163)))) >>> {(reg153[(1'h0):(1'h0)] ?
                  wire143[(1'h1):(1'h1)] : ($unsigned(reg175) ?
                      reg163[(3'h7):(3'h5)] : $unsigned(reg171))),
              reg173[(2'h3):(1'h0)]});
        end
      else
        begin
          reg177 <= reg152[(4'ha):(3'h5)];
        end
      reg178 <= (8'hbc);
    end
  assign wire179 = ((!(((^wire159) ?
                           (wire158 + reg153) : (-reg163)) > ((&reg163) ?
                           (wire144 << reg148) : (reg148 ?
                               wire141 : reg169)))) ?
                       $unsigned(wire159) : (!(reg178[(4'hc):(3'h4)] <= ((reg149 ^~ reg150) ?
                           (-reg160) : $unsigned(wire147)))));
  assign wire180 = ($signed((+(^reg177[(1'h0):(1'h0)]))) > (|wire165));
  assign wire181 = $unsigned($unsigned($signed($signed($unsigned(wire143)))));
  always
    @(posedge clk) begin
      reg182 <= {(~^$unsigned((!(!reg151))))};
      reg183 <= {reg161[(1'h0):(1'h0)],
          ({reg160[(4'h8):(3'h7)]} ?
              $unsigned((&wire146[(1'h1):(1'h1)])) : {(((7'h42) ^~ reg172) && (reg151 ?
                      (8'hb4) : (8'haa))),
                  $signed(reg182)})};
    end
  assign wire184 = reg172;
  assign wire185 = {$signed((-$unsigned(reg169[(1'h1):(1'h0)]))),
                       {reg170[(3'h6):(1'h0)], wire165}};
  assign wire186 = reg176[(4'hd):(4'hd)];
endmodule
