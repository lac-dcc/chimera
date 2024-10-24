module top
#(parameter param129 = ((~|(~(((8'ha1) ? (8'h9e) : (8'hb9)) ? ((8'hbb) == (8'hb3)) : ((7'h40) ? (8'hb6) : (8'had))))) ? (~&(!(-((8'ha1) == (8'h9f))))) : (-(^(~^{(8'ha2)})))), 
parameter param130 = (param129 ^ (param129 && (param129 ? ((param129 + param129) || {param129, param129}) : ((param129 ? param129 : param129) ? (param129 ? param129 : (8'ha0)) : ((8'ha4) ? param129 : param129))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire100;
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  assign y = {wire127,
                 wire116,
                 wire103,
                 wire102,
                 wire47,
                 wire100,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 (1'h0)};
  module4 #() modinst48 (.wire7(wire0), .wire6(wire1), .y(wire47), .clk(clk), .wire5(wire2), .wire8(wire3));
  module49 #() modinst101 (wire100, clk, wire0, wire2, wire1, wire3, wire47);
  assign wire102 = (wire100[(1'h0):(1'h0)] * ($signed(((8'hbd) ?
                       wire100 : $unsigned(wire3))) != {wire3, wire0}));
  assign wire103 = wire0;
  always
    @(posedge clk) begin
      if ($unsigned((wire2[(2'h3):(1'h1)] ? (8'h9f) : wire3[(1'h1):(1'h1)])))
        begin
          reg104 <= (^wire2[(4'hf):(3'h6)]);
        end
      else
        begin
          if ($unsigned(((wire0[(4'hf):(3'h4)] * (wire0[(3'h4):(3'h4)] ?
              {wire103, wire2} : reg104[(3'h5):(2'h3)])) <= (&wire100))))
            begin
              reg104 <= reg104[(4'h8):(3'h7)];
            end
          else
            begin
              reg104 <= wire2[(1'h1):(1'h0)];
              reg105 <= ((wire2[(1'h1):(1'h1)] ?
                      (8'ha2) : $signed(wire1[(3'h7):(2'h2)])) ?
                  {wire2[(4'hc):(3'h4)],
                      {$unsigned(reg104)}} : wire100[(2'h2):(1'h1)]);
              reg106 <= {$signed(reg104[(4'hb):(3'h5)]), wire3};
            end
          reg107 <= reg105;
          reg108 <= wire3;
          reg109 <= $unsigned((^((wire47[(3'h7):(2'h2)] ?
              (+reg106) : $unsigned((8'hb2))) + (wire3 >>> {wire2}))));
        end
      if (($unsigned({({reg104} && (wire100 && wire1))}) | ((8'hb5) ?
          $signed(((reg104 == (8'had)) ?
              $signed(reg109) : $signed((8'hbc)))) : ($signed(wire47[(3'h5):(3'h5)]) ?
              $unsigned($signed(reg108)) : wire1))))
        begin
          if ($signed(reg106[(4'hb):(4'h8)]))
            begin
              reg110 <= wire1[(4'he):(4'hd)];
              reg111 <= wire102[(2'h3):(1'h1)];
            end
          else
            begin
              reg110 <= wire0;
              reg111 <= wire3;
              reg112 <= (+((~^($unsigned(wire2) & (~^wire1))) ^ $unsigned($signed(reg109))));
              reg113 <= reg109;
            end
        end
      else
        begin
          reg110 <= $unsigned($unsigned((^reg111)));
          reg111 <= (+(!$unsigned(((reg110 ?
              reg108 : reg111) < reg104[(1'h1):(1'h1)]))));
          reg112 <= reg109[(3'h4):(1'h0)];
          reg113 <= ((~|$unsigned(($signed(wire2) ~^ (~^(8'ha9))))) <= $signed((8'had)));
          reg114 <= wire102;
        end
      reg115 <= (+({reg112[(4'ha):(4'h8)]} << $unsigned(((-(8'ha0)) | $signed(wire0)))));
    end
  assign wire116 = (~^reg104);
  module117 #() modinst128 (wire127, clk, wire102, reg104, reg107, wire116, reg109);
endmodule

module module117  (y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire122;
  input wire signed [(4'ha):(1'h0)] wire121;
  input wire [(3'h6):(1'h0)] wire120;
  input wire [(4'hc):(1'h0)] wire119;
  input wire [(5'h15):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire [(5'h12):(1'h0)] wire123;
  assign y = {wire126, wire125, wire124, wire123, (1'h0)};
  assign wire123 = $unsigned(wire120[(3'h6):(3'h6)]);
  assign wire124 = {(^~$unsigned($unsigned(wire120))),
                       ($unsigned($unsigned(wire120[(2'h2):(1'h0)])) >>> ({$unsigned(wire120)} ?
                           wire118[(5'h12):(4'h8)] : $signed(wire120)))};
  assign wire125 = {(wire123[(4'h9):(3'h6)] ?
                           $unsigned((^~wire124[(3'h5):(1'h1)])) : $signed(wire121[(3'h4):(2'h2)]))};
  assign wire126 = $signed((^{(8'ha9)}));
endmodule

module module49
#(parameter param98 = ((~(((+(7'h41)) && (~|(8'hb1))) | (~^(~&(8'ha7))))) >> ({(((8'ha5) ? (8'hb4) : (7'h44)) ? (&(8'hb8)) : (^~(8'hb8)))} <<< {(((8'h9c) <= (8'hab)) ? ((8'hb6) + (8'h9c)) : ((8'ha2) ? (8'hb0) : (8'hbd))), ((+(8'hba)) ^~ {(8'h9c), (8'hbb)})})), 
parameter param99 = (|(((|(~param98)) <= {{param98}}) < (+((^param98) ? (param98 ? param98 : (7'h42)) : (-param98))))))
(y, clk, wire50, wire51, wire52, wire53, wire54);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire50;
  input wire [(4'hc):(1'h0)] wire51;
  input wire [(5'h11):(1'h0)] wire52;
  input wire [(2'h2):(1'h0)] wire53;
  input wire [(4'hc):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire94;
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire94,
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
  always
    @(posedge clk) begin
      reg55 <= {(8'hb3)};
      reg56 <= ($signed(wire54[(3'h4):(1'h1)]) ^~ wire50);
      if ((({(~&(wire51 ? wire50 : wire51)),
              (wire54 - (8'h9c))} <= {(&(&reg55)),
              $unsigned($signed(wire51))}) ?
          ((wire50 > (~^wire54)) << wire53[(2'h2):(2'h2)]) : $signed($signed($signed((reg56 ?
              (7'h42) : wire53))))))
        begin
          if ((wire51 ?
              wire54[(4'ha):(3'h6)] : {($unsigned($unsigned(wire52)) ?
                      $unsigned($signed(wire50)) : {$unsigned((7'h40))})}))
            begin
              reg57 <= {wire54};
              reg58 <= reg55[(4'hd):(4'h8)];
              reg59 <= (~^($signed(((wire53 ^ (8'h9c)) ?
                  (8'hba) : wire52)) != wire52[(3'h7):(3'h6)]));
              reg60 <= (^~reg58);
              reg61 <= $signed(($unsigned(((wire53 == reg56) ?
                      reg59[(1'h1):(1'h1)] : reg56[(3'h4):(1'h0)])) ?
                  wire51 : $unsigned(($signed(reg55) ?
                      (+wire53) : (reg55 >= reg59)))));
            end
          else
            begin
              reg57 <= {reg60};
            end
          reg62 <= reg61;
          reg63 <= (!($unsigned((reg56[(1'h1):(1'h1)] & (reg61 ?
              (8'hb2) : wire54))) ~^ (reg58 != wire50)));
        end
      else
        begin
          if (reg58)
            begin
              reg57 <= $unsigned(reg58[(5'h13):(4'ha)]);
              reg58 <= (($signed(reg57[(3'h4):(2'h3)]) ?
                      reg60 : ((((8'ha8) ? reg62 : reg62) >>> $signed(reg58)) ?
                          reg58[(4'hd):(4'ha)] : reg58)) ?
                  ($unsigned(($signed(reg62) ? (8'hb7) : $signed(wire53))) ?
                      {(wire52 >> wire52[(3'h5):(2'h3)])} : (~&(7'h41))) : $unsigned($signed(((~|reg60) + ((8'hb2) < wire50)))));
              reg59 <= reg56;
              reg60 <= ((!$signed((((8'ha3) ?
                  wire54 : reg57) < ((8'ha7) >>> wire53)))) >> (reg61 >= reg56));
              reg61 <= wire52;
            end
          else
            begin
              reg57 <= wire51;
            end
        end
      reg64 <= $unsigned(reg59);
      reg65 <= (((wire51 ? ({reg57, wire52} >>> reg60) : reg62[(4'hc):(1'h0)]) ?
              (~&(8'ha5)) : $signed(((reg55 == reg56) ?
                  $unsigned(reg59) : $unsigned(reg63)))) ?
          {($unsigned(reg63[(5'h10):(3'h6)]) | ($signed((8'ha4)) == {(8'ha6)})),
              reg55} : $unsigned((8'hba)));
    end
  module66 #() modinst95 (.clk(clk), .wire70(reg55), .wire69(reg64), .wire68(wire52), .wire67(reg56), .wire71(reg62), .y(wire94));
  assign wire96 = (^~(wire54 ? reg62 : reg62[(4'h8):(3'h7)]));
  assign wire97 = $unsigned($signed(reg58));
endmodule

module module4
#(parameter param45 = ((8'hb7) ? ((8'hb6) && {(((8'hb3) ? (8'h9c) : (8'hbf)) ? {(8'hb4)} : (&(8'ha3)))}) : ({(((8'ha8) == (8'hbf)) ? (^~(8'h9c)) : {(8'hb4), (8'ha5)}), (((8'h9e) > (7'h44)) ? ((8'hb3) ? (8'haa) : (8'haa)) : (~|(8'hba)))} ? (^{(7'h40), (+(7'h40))}) : (+(((8'ha5) >= (8'hab)) < (~&(8'hb3)))))), 
parameter param46 = (8'hbc))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire5;
  input wire signed [(3'h6):(1'h0)] wire6;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire40;
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire16,
                 wire17,
                 wire40,
                 reg15,
                 (1'h0)};
  assign wire9 = (~^(wire5 ~^ wire6[(1'h0):(1'h0)]));
  assign wire10 = $unsigned((-$signed(((+wire6) ? {wire8} : (~&wire7)))));
  assign wire11 = wire6;
  assign wire12 = wire11;
  assign wire13 = (wire11[(3'h6):(1'h0)] ~^ $unsigned({((wire5 ?
                              wire11 : wire12) ?
                          wire12[(2'h2):(1'h0)] : $unsigned(wire12))}));
  assign wire14 = (wire12 < ($signed({wire5}) - $signed({wire12, wire12})));
  always
    @(posedge clk) begin
      reg15 <= $unsigned($unsigned(wire6));
    end
  assign wire16 = $signed(wire7[(2'h2):(1'h0)]);
  assign wire17 = ((wire11 ? wire11[(4'h9):(3'h7)] : wire11) ?
                      (7'h42) : (((~^{wire12}) & $signed((wire10 ?
                          wire9 : wire13))) >>> ((((8'hba) ?
                              wire6 : wire12) && $signed((8'ha3))) ?
                          wire5 : $unsigned({(8'ha9)}))));
  module18 #() modinst41 (.wire19(wire12), .wire20(wire11), .clk(clk), .wire22(wire14), .wire23(wire16), .y(wire40), .wire21(wire8));
  assign wire42 = (~|($unsigned($unsigned({wire14,
                      wire17})) + $unsigned($unsigned(wire10))));
  assign wire43 = ((8'hb4) ? $signed((8'h9c)) : (|wire11[(3'h4):(3'h4)]));
  assign wire44 = $signed($signed({$signed(wire13), $signed($signed(wire5))}));
endmodule

module module18
#(parameter param39 = {(-{(((8'hb4) < (7'h41)) ? ((8'hae) ? (8'hb5) : (8'h9d)) : ((8'hb4) != (8'hb7)))}), (!((^((8'hab) != (8'ha7))) ^~ (((8'hb9) ? (8'ha9) : (8'hb1)) ? ((8'hb7) >> (7'h43)) : (|(8'h9d)))))})
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(2'h3):(1'h0)] wire21;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  assign y = {wire38,
                 wire37,
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
                 reg36,
                 reg25,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((wire20[(3'h7):(3'h6)] & wire21[(1'h1):(1'h1)])))
        begin
          reg24 <= (wire23 ?
              $unsigned(((&{wire21}) & {(&wire21)})) : ($signed((^wire19)) ?
                  (((wire22 ?
                      (8'h9e) : wire21) - (~^wire22)) < wire22) : $unsigned(wire20[(3'h5):(1'h0)])));
        end
      else
        begin
          reg24 <= ((8'hb7) ^~ ($signed($signed(wire22)) ?
              (8'hbb) : (^~wire22[(4'hf):(4'hc)])));
          reg25 <= {wire19[(4'h8):(2'h2)]};
        end
    end
  assign wire26 = (|($unsigned((~^wire20[(3'h4):(1'h1)])) ~^ wire23));
  assign wire27 = $signed(($signed((wire20 ?
                          reg24[(4'ha):(3'h7)] : (~wire20))) ?
                      {wire26[(4'hf):(3'h5)],
                          wire21[(1'h1):(1'h1)]} : ($signed((wire23 > wire26)) ?
                          $signed($signed(reg24)) : $signed({(8'h9c)}))));
  assign wire28 = wire22[(4'ha):(2'h3)];
  assign wire29 = (8'hac);
  assign wire30 = {(wire22[(1'h1):(1'h0)] * (+((wire26 == wire19) + (wire27 ?
                          reg25 : wire20))))};
  assign wire31 = $signed($unsigned((^~$unsigned((wire23 ? wire26 : wire26)))));
  assign wire32 = {wire22,
                      $unsigned($unsigned($signed((wire19 ?
                          wire22 : wire26))))};
  assign wire33 = $unsigned(((-$signed((wire19 ? wire28 : wire22))) ?
                      $unsigned($unsigned($signed(wire26))) : $unsigned((wire27 ^~ $signed(wire23)))));
  assign wire34 = $signed($unsigned(wire29));
  assign wire35 = (8'ha0);
  always
    @(posedge clk) begin
      reg36 <= ($unsigned(wire20[(3'h5):(2'h3)]) * (reg24 >> ($signed({wire34,
          (8'hbf)}) < (^(wire34 ? wire21 : reg25)))));
    end
  assign wire37 = $unsigned((wire28 ?
                      (~|($signed(wire28) ?
                          (+wire33) : wire22)) : $unsigned(wire33)));
  assign wire38 = {(^~(~|wire33[(1'h0):(1'h0)]))};
endmodule

module module66  (y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire71;
  input wire signed [(2'h2):(1'h0)] wire70;
  input wire [(4'hb):(1'h0)] wire69;
  input wire [(5'h11):(1'h0)] wire68;
  input wire signed [(3'h4):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire72;
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  assign y = {wire93,
                 wire85,
                 wire84,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire72 = $signed(wire67);
  assign wire73 = ((wire68[(4'hd):(4'hd)] ?
                      $unsigned((wire67 & (wire72 ?
                          wire70 : wire72))) : wire71) == wire68);
  assign wire74 = wire70;
  assign wire75 = (^~$signed({$signed($unsigned(wire73))}));
  assign wire76 = ($signed((|((+wire70) ?
                          (wire69 ? (8'hbf) : wire74) : {wire70}))) ?
                      wire73 : {(|wire75), wire69[(4'hb):(3'h7)]});
  assign wire77 = ((8'had) >= ({wire67, $signed($unsigned(wire69))} == wire76));
  assign wire78 = (wire76[(3'h4):(2'h2)] > ($unsigned(wire68) ?
                      wire70 : $unsigned(wire67[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg79 <= $unsigned(({((wire74 ? (8'h9d) : wire72) ?
                  (wire74 ? wire74 : (7'h42)) : {wire69})} ?
          ((wire75[(2'h2):(2'h2)] <<< $signed(wire70)) ?
              (wire74[(1'h1):(1'h0)] ?
                  $unsigned(wire70) : $unsigned(wire78)) : ($signed(wire70) && $signed(wire76))) : $signed({$unsigned((8'hb3)),
              $signed((8'hb9))})));
      reg80 <= $signed(wire76[(3'h5):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg81 <= {(8'ha3), {$signed({$unsigned(wire73)}), wire71[(4'hd):(4'ha)]}};
      reg82 <= $signed(wire74[(4'hb):(3'h6)]);
      reg83 <= wire72[(4'he):(3'h6)];
    end
  assign wire84 = (|$unsigned({(|$signed(reg80))}));
  assign wire85 = wire68;
  always
    @(posedge clk) begin
      reg86 <= $signed((|({(&(8'ha6)),
          (wire84 ? wire70 : wire84)} << $unsigned(wire76[(3'h6):(1'h0)]))));
      reg87 <= {(8'hb1), wire67[(3'h4):(2'h2)]};
      reg88 <= wire73[(4'h8):(3'h4)];
      if (wire70)
        begin
          reg89 <= (8'ha1);
          reg90 <= ((reg80[(1'h1):(1'h1)] ^ (-$unsigned({reg80}))) ?
              $signed((reg89[(3'h6):(1'h0)] ?
                  wire73 : reg80)) : $unsigned(wire78[(4'ha):(4'h9)]));
          reg91 <= (-$signed(((|(reg81 < wire76)) >> $signed(reg88))));
          reg92 <= $unsigned(((~((reg89 ? wire71 : wire71) ?
                  (wire67 >= reg89) : reg89)) ?
              ($unsigned({wire70}) >> wire73) : {({(8'hbe)} ?
                      $signed(wire71) : reg81)}));
        end
      else
        begin
          reg89 <= wire72[(4'hc):(2'h2)];
        end
    end
  assign wire93 = $signed((-{$unsigned(reg80)}));
endmodule
