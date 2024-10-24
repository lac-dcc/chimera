module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire69,
                 wire67,
                 wire4,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire4 = ($signed(((wire2[(4'ha):(2'h3)] ~^ $signed((8'ha7))) != (8'haf))) >= wire1[(2'h2):(1'h1)]);
  module5 #() modinst68 (wire67, clk, wire2, wire0, wire4, wire1);
  assign wire69 = wire3;
  always
    @(posedge clk) begin
      if ($unsigned(((^~(+$unsigned(wire1))) - wire69[(4'hc):(2'h2)])))
        begin
          reg70 <= wire69;
          reg71 <= reg70;
          reg72 <= {({$unsigned($signed(reg71))} ?
                  (((reg70 ? wire69 : wire67) - wire0) ?
                      ((wire4 + wire67) < $signed(reg71)) : ((wire4 ?
                          wire4 : wire0) != wire3)) : wire69[(4'h9):(3'h7)])};
        end
      else
        begin
          reg70 <= $unsigned((({(wire1 <<< wire67)} != $signed((8'ha6))) ?
              {$signed((wire0 << reg70)),
                  $signed((~^wire1))} : $signed($unsigned($signed(wire2)))));
          reg71 <= {{($unsigned((wire2 ?
                      wire4 : reg72)) | ((~^wire4) + $signed((8'hba))))},
              (~^wire3)};
          if ((^~$unsigned(wire2)))
            begin
              reg72 <= (~|reg72);
            end
          else
            begin
              reg72 <= (wire67[(3'h4):(2'h2)] > ((^~wire67[(2'h2):(1'h1)]) ?
                  ((wire67[(4'h9):(2'h3)] ?
                          (reg72 < wire3) : $unsigned(reg70)) ?
                      (wire69 >>> (|wire3)) : reg70[(4'h9):(3'h7)]) : $unsigned(wire4)));
              reg73 <= wire69;
              reg74 <= $signed(($unsigned(reg71[(2'h3):(1'h1)]) ?
                  $unsigned({(wire0 ? wire1 : wire0),
                      (^(8'haa))}) : (-$unsigned((wire67 ? wire2 : wire2)))));
            end
        end
      reg75 <= $signed($signed($signed((8'ha8))));
      reg76 <= $signed(reg72);
      reg77 <= (~&(|((^reg70) >>> (~&wire2))));
      reg78 <= $unsigned(reg74);
    end
  assign wire79 = $signed($unsigned((!$signed(wire2))));
  assign wire80 = reg72;
  assign wire81 = (($signed(wire2[(2'h3):(2'h3)]) ?
                      wire79 : $unsigned(wire80)) + reg71[(4'hd):(4'h9)]);
  assign wire82 = (+wire79);
  always
    @(posedge clk) begin
      reg83 <= ((~^wire2[(2'h2):(1'h0)]) ?
          reg72[(1'h1):(1'h1)] : reg75[(2'h2):(1'h1)]);
      if (reg78[(5'h10):(3'h7)])
        begin
          reg84 <= ($signed(wire67[(4'hd):(3'h4)]) >> $unsigned((~^(wire81 ?
              (wire80 | wire80) : reg77))));
          reg85 <= (!$unsigned((-$unsigned(reg78))));
          reg86 <= wire81;
        end
      else
        begin
          reg84 <= ((+(((wire80 ? (8'hb9) : wire3) << reg83[(4'h9):(3'h4)]) ?
                  ((~|reg70) ?
                      (8'hb8) : (&reg72)) : $unsigned($signed(reg78)))) ?
              reg71 : $signed(({wire4[(3'h4):(3'h4)]} ?
                  (((8'hb5) ? (8'hb7) : reg83) + (reg76 ?
                      wire80 : reg78)) : wire2[(4'hb):(3'h6)])));
          reg85 <= reg73[(4'hc):(2'h3)];
          if ((~$unsigned(wire67[(4'hc):(4'h8)])))
            begin
              reg86 <= ((~|({((8'hb2) | reg77), wire82} ?
                      $signed(((8'h9e) ?
                          reg70 : reg83)) : $unsigned(wire0[(5'h10):(5'h10)]))) ?
                  $signed(reg71) : $unsigned({wire0[(4'h9):(1'h1)],
                      (!$unsigned(reg75))}));
              reg87 <= reg83[(4'hd):(4'ha)];
              reg88 <= (+reg75[(3'h7):(2'h2)]);
            end
          else
            begin
              reg86 <= $unsigned(($signed(reg76) ?
                  (^(+$signed(reg74))) : $unsigned(($unsigned(wire3) != $unsigned(reg71)))));
              reg87 <= $unsigned({wire81[(3'h7):(1'h1)],
                  (~^wire0[(5'h11):(4'h8)])});
              reg88 <= (8'had);
            end
          reg89 <= reg71;
          reg90 <= (wire3[(2'h2):(1'h1)] ~^ reg84[(2'h2):(2'h2)]);
        end
      reg91 <= ((&(~^(8'haf))) ?
          $signed((reg74 ?
              $signed((wire1 ?
                  wire67 : reg90)) : reg85[(4'ha):(4'ha)])) : ((reg86 == ((wire3 ?
                      reg73 : wire2) ?
                  (reg74 == reg75) : (reg89 >= wire79))) ?
              ($unsigned($signed(reg90)) || ({wire2} ?
                  $unsigned(wire81) : reg86[(4'h8):(1'h0)])) : reg75[(2'h2):(2'h2)]));
    end
endmodule

module module5
#(parameter param66 = ((&((((8'hbb) ? (8'hbf) : (8'hb2)) ^~ (&(8'hbf))) ? (8'ha1) : (((7'h43) ? (8'hac) : (8'hb9)) ? ((8'ha3) + (7'h43)) : ((8'h9d) && (7'h43))))) - (({(^~(8'hb7))} ? (((8'ha2) + (8'haa)) ? (~|(8'hbd)) : (!(8'h9e))) : ((8'hb1) ? ((8'hbe) + (8'hbe)) : (8'ha2))) < (~&((~&(7'h42)) ? ((8'hb5) ? (8'ha5) : (8'ha2)) : (-(8'ha9)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire10 = (((^$unsigned((^wire9))) << {(8'ha6),
                      ($unsigned(wire9) ?
                          wire7 : wire7[(2'h2):(2'h2)])}) | ((~|$unsigned(wire9[(3'h4):(1'h0)])) || {wire7[(3'h4):(1'h0)],
                      wire7}));
  assign wire11 = (((8'ha5) ?
                          (wire6[(2'h3):(1'h0)] ?
                              wire10[(4'hc):(2'h3)] : wire7) : ((7'h43) ?
                              wire7[(3'h5):(2'h2)] : wire8)) ?
                      ((~^(((8'hae) + wire10) ? wire9 : $unsigned((8'ha6)))) ?
                          wire6 : $unsigned(((wire9 >> (8'ha5)) > wire10))) : {wire6,
                          $unsigned(wire6[(1'h1):(1'h0)])});
  assign wire12 = $signed((8'hbf));
  assign wire13 = $signed(wire8[(4'h9):(3'h5)]);
  assign wire14 = (wire10[(5'h12):(4'hb)] >>> wire11[(4'hb):(4'ha)]);
  assign wire15 = ($unsigned({wire13[(2'h2):(2'h2)],
                          $unsigned((wire8 | (8'hab)))}) ?
                      wire13 : wire8);
  assign wire16 = (((~&(wire7[(3'h7):(3'h5)] >= (~^wire11))) ?
                      wire10 : $signed(wire14)) || wire14[(4'h8):(1'h0)]);
  assign wire17 = (^$signed($signed($signed((wire9 - wire6)))));
  assign wire18 = (~(~|$unsigned(wire12[(2'h2):(2'h2)])));
  assign wire19 = $unsigned(($unsigned((~&$signed(wire18))) & $unsigned(wire10)));
  assign wire20 = {(($unsigned((~|wire18)) >= ((wire15 ?
                          (8'h9c) : wire6) && (wire19 != (8'haf)))) >= wire6),
                      (($unsigned((8'hb9)) ?
                          {$signed(wire8)} : $signed($unsigned(wire7))) >= wire11)};
  module21 #() modinst49 (.clk(clk), .wire24(wire14), .wire23(wire18), .y(wire48), .wire25(wire19), .wire22(wire7));
  assign wire50 = ({$signed((wire15 ? (8'h9e) : $signed(wire12))),
                          (&((wire11 ? wire11 : wire10) ?
                              wire14[(3'h7):(3'h4)] : wire13))} ?
                      wire13 : wire6);
  assign wire51 = $signed($signed((wire17 ?
                      wire50[(2'h2):(1'h0)] : {wire14, $signed(wire14)})));
  assign wire52 = $unsigned($unsigned(wire19[(3'h6):(3'h5)]));
  assign wire53 = $unsigned($signed(wire6));
  always
    @(posedge clk) begin
      if ($signed(wire18[(1'h0):(1'h0)]))
        begin
          reg54 <= (|wire52[(3'h7):(2'h3)]);
          reg55 <= wire9;
          reg56 <= $unsigned($signed({wire12[(1'h1):(1'h1)],
              {(~&(8'hbf)), wire10}}));
          reg57 <= {((~^(~|((8'h9c) <= wire53))) ?
                  $signed(((wire7 ?
                      wire50 : wire7) | (~^(8'had)))) : $signed((wire20 ?
                      $signed((8'h9f)) : wire48[(1'h1):(1'h0)])))};
        end
      else
        begin
          reg54 <= (wire12[(2'h2):(2'h2)] <<< ((($unsigned((8'h9d)) ^ (+wire19)) >>> reg55[(4'h9):(3'h6)]) <= $signed({$unsigned(wire6),
              reg55[(4'ha):(3'h6)]})));
          reg55 <= wire18;
        end
      if (wire15)
        begin
          reg58 <= {$unsigned(({(-(7'h42)), {wire51}} & $unsigned((-wire8)))),
              $signed((!$unsigned($unsigned(wire7))))};
        end
      else
        begin
          reg58 <= wire9[(1'h0):(1'h0)];
          reg59 <= reg58;
        end
      reg60 <= (-$unsigned(($unsigned((reg56 - wire16)) ^~ (((8'h9d) ?
          wire52 : wire17) && (+wire48)))));
    end
  always
    @(posedge clk) begin
      reg61 <= $unsigned($signed(($signed({wire51}) >> ((^~wire50) ?
          $signed(reg57) : (reg54 ? reg58 : (8'ha2))))));
      reg62 <= (wire17[(2'h2):(2'h2)] | $signed(($unsigned(wire52[(2'h2):(2'h2)]) ?
          {(wire20 > wire14)} : wire20[(1'h1):(1'h1)])));
    end
  assign wire63 = (($signed((^$signed(wire14))) - $unsigned(((reg60 + wire14) ?
                      {reg58} : (wire18 | (8'hb7))))) * $signed(wire18));
  assign wire64 = $signed(wire17[(3'h4):(3'h4)]);
  assign wire65 = ($unsigned(wire16[(3'h5):(1'h1)]) ?
                      ((reg56[(1'h0):(1'h0)] >= wire14[(4'he):(4'h8)]) ?
                          reg55 : wire20[(1'h0):(1'h0)]) : wire7[(4'h8):(3'h6)]);
endmodule

module module21
#(parameter param47 = (~&({{{(8'hbc)}}} <= {{{(8'hb3), (8'hbb)}, ((8'ha4) ? (8'hbe) : (8'hab))}})))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire [(4'hc):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  assign y = {wire46,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire29,
                 wire27,
                 wire26,
                 reg45,
                 reg44,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg28,
                 (1'h0)};
  assign wire26 = wire25;
  assign wire27 = ($signed((wire23 ?
                          $signed((8'hb7)) : wire23[(1'h0):(1'h0)])) ?
                      wire23 : wire22);
  always
    @(posedge clk) begin
      reg28 <= ($signed(wire24) ?
          $unsigned($unsigned($unsigned($unsigned(wire27)))) : wire22);
    end
  assign wire29 = (($unsigned(wire22[(1'h0):(1'h0)]) ?
                      wire24 : reg28[(2'h2):(2'h2)]) - $unsigned($unsigned(({wire25} << (wire22 << wire26)))));
  always
    @(posedge clk) begin
      reg30 <= wire25;
      reg31 <= ($signed(wire29[(4'hf):(4'h9)]) <= $unsigned((!($unsigned(wire26) ?
          $signed(wire24) : ((8'had) ? reg28 : wire22)))));
      reg32 <= ((($unsigned((+(8'hbd))) ~^ (wire29 ?
                  $signed((8'hb7)) : $signed(wire22))) ?
              (((wire22 ? (8'hb6) : reg30) >> (wire22 ?
                  wire24 : (8'hbc))) == (+$unsigned(wire22))) : ({$unsigned((8'hbf)),
                      $signed(reg30)} ?
                  wire24 : (&$signed(wire23)))) ?
          (8'ha4) : (({((8'hb8) >>> (8'ha6)), (+reg28)} ?
                  reg31 : ((~wire29) ? (~^wire27) : wire29)) ?
              (((~^wire23) - $unsigned(reg30)) < ((reg30 <= wire27) ?
                  (wire27 ?
                      reg30 : reg30) : (+reg28))) : (wire24[(4'hd):(3'h6)] < (|(wire29 ?
                  wire29 : reg28)))));
      if ((reg32[(1'h0):(1'h0)] ?
          (((~&(reg30 ? wire27 : wire29)) ?
              (~^{wire26}) : wire23) != ((^wire25[(2'h3):(2'h3)]) ?
              (reg28 && (^~wire29)) : wire23[(2'h2):(1'h0)])) : (~&$unsigned(((8'hb3) >>> reg30[(2'h3):(2'h2)])))))
        begin
          reg33 <= $unsigned((wire29[(4'he):(4'h9)] ?
              $signed({$unsigned(wire23),
                  wire24[(2'h3):(2'h2)]}) : (-$signed({(8'hbc), reg28}))));
          reg34 <= (!($unsigned((8'h9c)) ?
              wire22[(4'hb):(1'h0)] : $unsigned(((wire22 ?
                  reg32 : wire23) || reg28))));
          reg35 <= {({reg32, (+reg31[(1'h1):(1'h1)])} ?
                  $signed(((~|reg31) || reg34)) : ($unsigned((reg28 <= (8'ha3))) ~^ ((!(8'hbb)) >> {reg28,
                      reg30})))};
          reg36 <= (wire25[(3'h6):(3'h5)] | ($signed(((wire24 ?
              reg31 : reg35) ~^ wire23[(4'hb):(3'h5)])) + ($unsigned((reg34 - wire23)) ?
              $unsigned(wire29[(4'hb):(3'h6)]) : (-(reg32 * reg33)))));
          reg37 <= wire29[(4'hc):(4'hb)];
        end
      else
        begin
          reg33 <= (reg35[(4'h9):(1'h1)] && $signed($signed($unsigned($unsigned(wire26)))));
          if ($unsigned((~&wire26)))
            begin
              reg34 <= (~^((~|wire25[(4'h8):(1'h1)]) != ((~&$unsigned(reg32)) != (!$unsigned((8'hb9))))));
              reg35 <= {$unsigned($signed((-$signed(reg32)))),
                  wire22[(4'ha):(1'h1)]};
              reg36 <= $signed(((8'had) - (~^({wire25} ^ {reg34, reg33}))));
              reg37 <= {(&$unsigned((^(wire24 == wire29))))};
            end
          else
            begin
              reg34 <= reg35;
            end
        end
    end
  assign wire38 = $unsigned($unsigned(wire26[(1'h1):(1'h0)]));
  assign wire39 = (reg33[(3'h6):(2'h2)] <= $unsigned(reg33[(4'h8):(3'h4)]));
  assign wire40 = $unsigned(wire26);
  assign wire41 = $unsigned($unsigned((~^((reg33 < (8'hb4)) >> wire27[(4'ha):(3'h7)]))));
  assign wire42 = wire41;
  assign wire43 = (~^wire29[(4'hd):(4'hd)]);
  always
    @(posedge clk) begin
      reg44 <= (!$signed($signed(reg30[(2'h2):(2'h2)])));
      reg45 <= $signed(wire24[(4'ha):(2'h2)]);
    end
  assign wire46 = $signed(wire24);
endmodule
