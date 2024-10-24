module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  assign y = {wire70, wire69, wire65, wire5, wire4, reg68, reg67, (1'h0)};
  assign wire4 = wire2;
  assign wire5 = ($unsigned(($signed({wire0, wire4}) + $signed((wire1 ?
                     wire3 : wire3)))) + {$signed(($unsigned(wire1) != wire0))});
  module6 #() modinst66 (.wire7(wire4), .y(wire65), .clk(clk), .wire9(wire2), .wire10(wire0), .wire8(wire5));
  always
    @(posedge clk) begin
      reg67 <= (~$signed((~|wire5[(3'h5):(3'h5)])));
      reg68 <= wire4[(4'ha):(4'h8)];
    end
  assign wire69 = {reg68};
  assign wire70 = $signed((($signed((wire2 ? reg67 : reg67)) ?
                          reg68 : (^wire0)) ?
                      $signed($signed(wire3[(3'h5):(2'h2)])) : wire69));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire48;
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire50,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire48,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire11 = wire8;
  assign wire12 = $signed(wire8);
  assign wire13 = wire9[(3'h4):(2'h3)];
  assign wire14 = $signed(wire10[(1'h1):(1'h0)]);
  module15 #() modinst49 (wire48, clk, wire8, wire7, wire12, wire10, wire11);
  assign wire50 = $unsigned(($signed(wire11[(3'h7):(3'h6)]) ?
                      $signed({$unsigned(wire10),
                          $unsigned(wire7)}) : ($signed($unsigned(wire7)) ?
                          ($unsigned(wire48) << $unsigned((8'hbc))) : ((wire48 - wire12) ?
                              (wire7 ?
                                  (8'h9e) : wire10) : wire8[(2'h3):(2'h2)]))));
  always
    @(posedge clk) begin
      reg51 <= (^~$signed(wire12));
      if ($signed((^wire12)))
        begin
          reg52 <= $signed((~^((wire8[(2'h2):(1'h1)] ?
                  wire7[(4'h9):(3'h4)] : wire11) ?
              ({(8'hbb)} ^ (wire12 ?
                  wire13 : wire9)) : $signed($unsigned(wire12)))));
          reg53 <= wire7;
        end
      else
        begin
          reg52 <= (8'ha3);
        end
      reg54 <= (wire13[(1'h0):(1'h0)] ?
          {$signed(wire10)} : (wire12 | ({wire48, $signed(reg53)} ?
              wire12 : ((~^wire7) + (wire7 * wire50)))));
      reg55 <= reg53;
      reg56 <= wire8[(2'h3):(2'h3)];
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned(((wire14[(3'h7):(3'h7)] ?
          wire9[(1'h1):(1'h0)] : wire10) <= (~(wire11 < wire50))))))
        begin
          reg57 <= $signed(wire48);
        end
      else
        begin
          reg57 <= (+reg57[(1'h0):(1'h0)]);
          reg58 <= (+$signed(((|{wire8, (8'ha8)}) ?
              (|(wire12 ? wire9 : reg54)) : (8'hb2))));
          reg59 <= (-reg57);
          reg60 <= (reg53[(2'h3):(2'h2)] <<< (~(wire11[(4'hf):(1'h1)] ?
              (wire48[(1'h1):(1'h1)] ?
                  (-reg59) : $signed((8'hb2))) : (!$unsigned(wire7)))));
          reg61 <= ((^(($signed(wire10) ?
                  wire9 : ((8'hba) ?
                      reg54 : (8'haa))) < $unsigned((reg54 * wire10)))) ?
              (wire48 ?
                  $unsigned({$signed(wire48), reg60}) : $signed(({wire7,
                      reg53} != wire10[(4'hb):(1'h1)]))) : $signed($signed(((wire14 || wire14) ?
                  (wire7 >= wire50) : $unsigned((8'ha1))))));
        end
      reg62 <= ((+(8'h9e)) ?
          $unsigned((+$unsigned($unsigned(wire13)))) : (^~(({wire12} > {reg55}) ?
              $signed((reg58 ? reg56 : (8'haf))) : (~|(reg53 ?
                  wire14 : reg60)))));
    end
  assign wire63 = $unsigned(({(reg54 ?
                          (&wire11) : (wire13 == wire7))} >>> (((!reg57) < $signed(reg54)) < $signed($signed(reg53)))));
  assign wire64 = $signed(wire50[(3'h4):(2'h2)]);
endmodule

module module15
#(parameter param47 = (8'hb0))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire22,
                 wire21,
                 reg36,
                 reg35,
                 reg34,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire21 = ((~^wire20[(3'h4):(1'h1)]) ?
                      $unsigned(({((8'hb0) ? wire19 : wire16),
                              (wire19 ? wire20 : wire16)} ?
                          ((wire16 ?
                              wire16 : wire17) & (&wire20)) : $unsigned((&wire19)))) : wire16[(1'h1):(1'h1)]);
  assign wire22 = (((-$unsigned(wire17[(2'h2):(1'h1)])) ?
                          $signed($signed({wire19})) : wire20) ?
                      {$unsigned({(^~wire16), $unsigned(wire21)}),
                          $unsigned(wire21[(3'h4):(2'h3)])} : (~(((wire17 ?
                              wire16 : wire16) ?
                          $signed(wire17) : {wire19}) || $signed($unsigned(wire21)))));
  always
    @(posedge clk) begin
      reg23 <= (^(~(((wire20 ? (8'hb3) : wire19) <= (wire21 ?
              wire16 : wire16)) ?
          wire21 : {(wire22 ? wire20 : wire19)})));
      reg24 <= $signed(($signed(wire20[(1'h0):(1'h0)]) != wire21[(2'h2):(1'h0)]));
    end
  assign wire25 = $signed((reg24[(1'h0):(1'h0)] ?
                      $unsigned((^~wire19[(2'h3):(2'h2)])) : $unsigned({$unsigned(wire20)})));
  assign wire26 = $signed($signed(wire20));
  assign wire27 = $signed(($signed($signed({(8'hac)})) + $unsigned($signed((wire25 | wire20)))));
  assign wire28 = (wire20 == ({wire18[(4'h8):(3'h7)]} ?
                      $signed({(wire22 ? (8'hb3) : wire19),
                          (wire21 ~^ wire27)}) : {$unsigned(wire21)}));
  assign wire29 = $unsigned($signed(wire20));
  assign wire30 = {wire19};
  assign wire31 = (((({wire28, wire18} ?
                          (wire16 & wire21) : $signed(wire17)) || $signed((wire21 ~^ reg24))) ^ wire18) ?
                      wire20 : reg24[(3'h4):(1'h1)]);
  assign wire32 = {wire21};
  assign wire33 = wire29[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg34 <= $unsigned(wire20[(2'h2):(1'h1)]);
      reg35 <= ($signed(wire27) ~^ ((^wire21) > (|{wire27[(1'h1):(1'h1)],
          (wire25 | wire26)})));
      reg36 <= (&(&{wire32, ((^wire19) == (wire30 ^~ (8'ha1)))}));
    end
  assign wire37 = wire17[(4'hc):(2'h2)];
  assign wire38 = (wire16[(2'h2):(1'h1)] & reg36);
  assign wire39 = ((wire16 ?
                      $unsigned($unsigned($unsigned(wire18))) : $signed($unsigned($signed(wire33)))) != reg23[(1'h0):(1'h0)]);
  assign wire40 = ((((!$signed(wire39)) < ((wire27 < wire18) ?
                          (8'hb0) : (~^wire38))) >= ($signed(wire32[(4'h9):(2'h3)]) ?
                          (wire19[(4'ha):(1'h0)] == reg23) : {$unsigned(reg24)})) ?
                      (!((|wire39) ?
                          $signed((+(8'hae))) : ($unsigned(wire19) == (wire37 != wire18)))) : $unsigned(((~&$unsigned(wire26)) ?
                          wire37[(4'hc):(2'h3)] : wire33[(1'h1):(1'h1)])));
  assign wire41 = ($signed($unsigned($signed(wire19))) * (!$unsigned({wire33[(3'h5):(2'h3)]})));
  assign wire42 = ((8'ha3) >>> wire19[(4'h9):(4'h8)]);
  assign wire43 = wire40;
  assign wire44 = $unsigned($unsigned(((~^$unsigned(reg34)) ^~ wire33)));
  assign wire45 = (^({$signed((8'ha5))} ? (-{{wire37}}) : wire19));
  assign wire46 = wire43;
endmodule
