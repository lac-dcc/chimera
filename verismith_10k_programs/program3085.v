module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire60;
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire77,
                 wire76,
                 wire75,
                 wire73,
                 wire4,
                 wire5,
                 wire6,
                 wire60,
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
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire4 = ({(~^wire2), (8'ha3)} ?
                     wire2 : (wire1[(4'he):(1'h1)] || wire0));
  assign wire5 = $unsigned(({wire3[(1'h1):(1'h0)]} ~^ $unsigned(({wire2,
                     wire4} <= (~wire3)))));
  assign wire6 = (8'hb5);
  module7 #() modinst61 (.wire9(wire1), .wire11(wire3), .clk(clk), .wire8(wire4), .wire12(wire5), .wire10(wire6), .y(wire60));
  module62 #() modinst74 (.wire66(wire5), .wire64(wire0), .y(wire73), .clk(clk), .wire63(wire4), .wire65(wire1));
  assign wire75 = $unsigned(wire5);
  assign wire76 = $unsigned({$unsigned(wire75)});
  assign wire77 = wire3[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg78 <= wire0[(3'h6):(1'h0)];
      reg79 <= (~|$signed($signed((8'ha6))));
      reg80 <= $unsigned(wire60);
      reg81 <= (8'ha4);
    end
  assign wire82 = $unsigned((^~(+(+$signed(wire76)))));
  assign wire83 = $unsigned(wire76);
  always
    @(posedge clk) begin
      reg84 <= (($unsigned($unsigned({(8'h9c)})) ^~ ($signed($unsigned(wire0)) ?
              $signed((wire3 ^~ (8'ha8))) : wire76[(4'hb):(4'ha)])) ?
          $signed(wire83) : wire3[(3'h7):(3'h5)]);
      reg85 <= wire76[(4'hc):(4'hb)];
      reg86 <= $unsigned(($unsigned(((wire73 >>> (8'hb3)) || (!wire1))) <<< ((&$unsigned(wire82)) == ($signed(reg84) == $signed(wire1)))));
      if (reg80[(1'h0):(1'h0)])
        begin
          if ($unsigned({(reg81 + wire3), wire5}))
            begin
              reg87 <= $unsigned($signed($signed(reg81[(3'h7):(1'h0)])));
            end
          else
            begin
              reg87 <= $signed($signed(((-(wire83 ?
                  wire2 : wire60)) + (!wire0))));
              reg88 <= $signed(wire75[(4'h9):(3'h5)]);
              reg89 <= (wire60 | $unsigned(reg78[(3'h5):(1'h0)]));
              reg90 <= (8'hbd);
            end
        end
      else
        begin
          reg87 <= wire0[(2'h3):(1'h0)];
          if (wire82[(3'h4):(1'h1)])
            begin
              reg88 <= $signed(((-$signed((~&reg90))) - (8'hba)));
              reg89 <= wire77;
              reg90 <= $signed((($signed(wire75) ?
                      $unsigned(wire4[(3'h7):(3'h5)]) : ((reg85 ?
                              reg85 : reg87) ?
                          $unsigned(wire73) : (reg89 ? wire5 : wire76))) ?
                  $unsigned(wire82) : (~^((!(8'hbd)) ?
                      (!wire3) : reg81[(4'hc):(3'h4)]))));
            end
          else
            begin
              reg88 <= ((~^wire73) ?
                  (($signed((reg85 ? wire75 : wire73)) | (((8'ha0) ?
                              wire0 : (8'ha1)) ?
                          reg85 : (wire3 ? wire75 : reg85))) ?
                      $unsigned({$unsigned(reg80),
                          ((8'ha3) ?
                              reg86 : (8'h9d))}) : wire60[(4'hf):(2'h2)]) : $signed(reg88[(5'h10):(4'hd)]));
              reg89 <= reg87[(4'h8):(3'h6)];
            end
          reg91 <= (($signed($signed((^reg85))) < $signed(((wire6 ?
                  reg79 : wire83) - {reg85}))) ?
              {(reg81 ?
                      wire73 : ($unsigned(wire5) == reg80))} : {(!reg81[(1'h0):(1'h0)])});
          reg92 <= {(~|reg84[(3'h6):(2'h3)])};
        end
      reg93 <= wire75;
    end
  always
    @(posedge clk) begin
      reg94 <= $unsigned($signed((((+(8'hb6)) ?
          (+(8'hb6)) : $signed((8'ha3))) >= $unsigned((^reg87)))));
    end
endmodule

module module62
#(parameter param71 = {((((^~(8'hb3)) ? (!(8'hb9)) : {(8'ha5)}) == (((8'ha0) >> (8'hbc)) <<< ((8'haf) ? (8'hb7) : (8'haf)))) ? (~^{(~(8'hbc))}) : ((~&{(7'h44)}) * {((8'hb3) != (8'hac))}))}, 
parameter param72 = ((param71 ? ((~param71) <= (param71 * (+param71))) : param71) == param71))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h16):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire66;
  input wire [(4'ha):(1'h0)] wire65;
  input wire [(4'hb):(1'h0)] wire64;
  input wire signed [(4'h8):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  assign y = {wire70, wire69, wire68, wire67, (1'h0)};
  assign wire67 = wire63[(3'h7):(3'h6)];
  assign wire68 = wire65;
  assign wire69 = $unsigned($unsigned($unsigned($unsigned((wire63 ?
                      wire65 : (8'ha9))))));
  assign wire70 = $signed(($unsigned(((|wire63) ^~ {wire64, wire66})) ?
                      wire65[(2'h2):(1'h1)] : (wire66 ?
                          $signed({wire65}) : $unsigned((wire68 ?
                              wire67 : wire64)))));
endmodule

module module7
#(parameter param58 = {(((+{(8'hb9)}) ? (|((8'hbd) >>> (8'hb5))) : ((+(7'h41)) >>> (|(8'ha3)))) >>> ((-((7'h44) ? (7'h41) : (8'hbf))) || ((8'hbe) ? ((8'haf) > (8'hbe)) : ((8'h9c) || (8'ha8)))))}, 
parameter param59 = ((&(8'hae)) ? ((-param58) ? ({param58} ? ((param58 ? (8'hb0) : (8'h9d)) ? (param58 != param58) : ((7'h40) ? param58 : param58)) : ((&param58) ? (param58 ? param58 : param58) : (-param58))) : (~((param58 ? (8'hbf) : param58) * (-param58)))) : (((|(+param58)) - (param58 == {param58})) ? ((-param58) | (~&param58)) : (((&param58) == (+(7'h40))) != param58))))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire53;
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire53,
                 (1'h0)};
  assign wire13 = $signed(wire8);
  assign wire14 = $signed((((~&$unsigned(wire11)) ?
                      {$unsigned(wire12)} : $unsigned((~|(8'hab)))) <= $unsigned(wire13)));
  assign wire15 = (($signed($signed(wire8[(3'h6):(1'h0)])) ?
                      {wire10} : wire13) > wire14);
  assign wire16 = ((+{$signed($signed(wire11))}) ?
                      $signed($unsigned((|{wire12}))) : ((+$signed({wire15})) ?
                          ($unsigned((wire11 ^~ wire9)) ?
                              (&$unsigned((8'ha7))) : (!$signed((8'hb5)))) : wire10));
  module17 #() modinst54 (wire53, clk, wire15, wire8, wire14, wire11, wire13);
  assign wire55 = wire53[(3'h5):(1'h1)];
  assign wire56 = {wire55,
                      (~^(-((wire53 ? wire55 : wire14) <= (wire13 | wire55))))};
  assign wire57 = wire12[(1'h1):(1'h0)];
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
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
                 (1'h0)};
  assign wire23 = wire18;
  assign wire24 = wire23[(3'h7):(3'h7)];
  assign wire25 = ($signed(wire24) ?
                      wire23[(4'hf):(4'he)] : wire20[(4'hc):(3'h5)]);
  assign wire26 = wire22;
  assign wire27 = (wire21 ?
                      (wire21 < wire19[(4'h8):(3'h6)]) : $signed((~^wire23[(2'h2):(1'h1)])));
  assign wire28 = wire20[(2'h2):(1'h1)];
  assign wire29 = wire28;
  assign wire30 = $unsigned({(wire25[(2'h3):(2'h3)] | wire18[(5'h13):(5'h10)])});
  assign wire31 = wire27;
  assign wire32 = (8'hbc);
  always
    @(posedge clk) begin
      reg33 <= $unsigned(($unsigned({wire27[(4'ha):(3'h7)],
          (!wire24)}) ^~ (((wire32 ? wire28 : wire22) ?
              wire24[(4'he):(3'h5)] : wire32) ?
          ((^wire27) ?
              {wire24, wire23} : (wire18 ?
                  wire31 : (7'h43))) : ((|wire29) ~^ $signed((8'hae))))));
      reg34 <= {wire20[(4'hb):(4'hb)],
          ($signed({$signed(wire21), ((8'hb6) ? wire23 : wire27)}) ?
              wire18[(3'h4):(1'h1)] : ($unsigned((wire22 || wire24)) ?
                  ((wire20 ? wire21 : wire19) ?
                      (|wire25) : $unsigned(wire28)) : (~&(reg33 ?
                      wire22 : wire24))))};
      if ((|$unsigned($signed((-wire27)))))
        begin
          reg35 <= $unsigned((8'ha7));
          reg36 <= (-reg35[(3'h5):(3'h4)]);
          if (wire21)
            begin
              reg37 <= $unsigned(wire22);
              reg38 <= reg33[(5'h15):(2'h3)];
              reg39 <= $signed($signed(reg36[(3'h5):(1'h1)]));
              reg40 <= (|(~$signed((~{wire19, reg33}))));
              reg41 <= $unsigned(reg36);
            end
          else
            begin
              reg37 <= ($signed(((wire19[(3'h4):(3'h4)] ?
                      (reg37 ~^ wire32) : ((8'hbd) ?
                          wire19 : wire24)) && (((8'ha6) ^~ wire30) ^ (~&wire29)))) ?
                  ((wire21 ^ (~(^(8'ha2)))) ?
                      reg39[(4'h8):(2'h3)] : reg40) : (wire24 ?
                      {$signed((wire25 ? reg36 : reg36)),
                          {$unsigned(wire30), reg39}} : reg38));
              reg38 <= (((~^$signed((wire31 ?
                      wire25 : wire20))) + $unsigned($unsigned($unsigned(reg35)))) ?
                  ((-($unsigned(wire18) ?
                      (~|wire18) : (reg38 ?
                          wire30 : reg38))) <<< reg41[(3'h7):(3'h6)]) : $unsigned((((!wire24) > {wire31}) + $unsigned(reg39))));
            end
        end
      else
        begin
          reg35 <= $signed(((reg35 ?
                  (wire25[(4'hc):(3'h4)] || (~reg41)) : ($unsigned(reg37) ?
                      $signed((7'h40)) : reg34[(3'h4):(2'h2)])) ?
              $signed($signed({wire21})) : reg36));
        end
      reg42 <= ((reg41[(4'hd):(3'h4)] >= reg41) ?
          {(reg36 ? reg34 : ({wire18} ^ reg35)),
              reg35[(3'h7):(3'h6)]} : wire32[(1'h0):(1'h0)]);
    end
  assign wire43 = ($signed($signed(wire19[(4'h8):(2'h3)])) ?
                      (8'hae) : ({wire30[(3'h4):(1'h1)], reg42[(2'h3):(2'h3)]} ?
                          (wire31[(4'ha):(2'h3)] ?
                              reg34[(4'hb):(2'h3)] : wire25[(4'ha):(3'h7)]) : wire28[(2'h3):(1'h1)]));
  assign wire44 = wire25;
  assign wire45 = $unsigned($unsigned($unsigned(wire27[(3'h4):(2'h2)])));
  assign wire46 = wire31;
  assign wire47 = reg39[(5'h10):(5'h10)];
  assign wire48 = (+wire44[(2'h2):(2'h2)]);
  assign wire49 = $unsigned($unsigned((8'hbc)));
  assign wire50 = {$signed(wire24)};
  assign wire51 = wire20[(2'h3):(1'h1)];
  assign wire52 = (wire32 ?
                      $unsigned(wire47) : $unsigned({$signed((wire25 ?
                              (8'ha3) : (8'ha4))),
                          wire27[(4'h9):(2'h2)]}));
endmodule
