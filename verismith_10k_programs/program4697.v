module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire73;
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire75,
                 wire5,
                 wire6,
                 wire73,
                 reg83,
                 reg82,
                 reg78,
                 reg76,
                 (1'h0)};
  assign wire5 = $signed(($unsigned(wire4) ?
                     $unsigned(((wire3 ? wire2 : wire2) ?
                         wire1 : $signed((8'hb1)))) : $unsigned(wire2)));
  assign wire6 = {$signed($unsigned((8'hbd)))};
  module7 #() modinst74 (wire73, clk, wire0, wire4, wire5, wire2, wire3);
  assign wire75 = {$signed((^wire1)), {wire2, wire1}};
  always
    @(posedge clk) begin
      reg76 <= {wire3[(3'h7):(3'h7)], (wire1[(3'h4):(2'h3)] < wire4)};
    end
  assign wire77 = wire1;
  always
    @(posedge clk) begin
      reg78 <= $signed((wire77[(2'h3):(2'h2)] >>> wire6[(3'h7):(3'h5)]));
    end
  assign wire79 = (((^$signed((wire2 ?
                      wire4 : wire1))) | (~($unsigned(reg76) << $signed(wire75)))) || $unsigned(wire1));
  assign wire80 = (7'h42);
  assign wire81 = ($unsigned((~|(^~$unsigned(wire2)))) == (({(wire1 ?
                                  reg78 : (8'hb8)),
                              (~|wire6)} ?
                          ($signed(wire3) ?
                              $unsigned(wire1) : wire1[(4'hb):(4'hb)]) : wire2) ?
                      ($unsigned({wire75,
                          (8'ha5)}) << ($signed(wire4) ^ $unsigned(wire2))) : wire5));
  always
    @(posedge clk) begin
      reg82 <= $signed(wire5[(5'h11):(2'h3)]);
      reg83 <= (8'ha8);
    end
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire64;
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire13,
                 wire14,
                 wire15,
                 wire19,
                 wire64,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire13 = $unsigned(wire8[(4'hf):(4'hd)]);
  assign wire14 = (&$unsigned((wire13[(2'h2):(1'h1)] | wire12[(4'h8):(2'h3)])));
  assign wire15 = ($unsigned(wire10) ?
                      ((!$unsigned((wire13 < wire10))) < $signed({(+wire12),
                          (~^wire12)})) : $unsigned((~^($signed(wire11) & {(8'ha6),
                          (8'h9e)}))));
  always
    @(posedge clk) begin
      reg16 <= wire13[(3'h7):(3'h4)];
      if ({$signed((wire10[(1'h1):(1'h1)] ?
              wire13 : ((wire14 ? (8'hbd) : wire13) >= (wire13 >>> wire13)))),
          $unsigned((^~((wire14 >> reg16) || (wire15 ? wire12 : reg16))))})
        begin
          reg17 <= wire10;
          reg18 <= $unsigned(wire15[(4'hc):(3'h6)]);
        end
      else
        begin
          reg17 <= $signed($signed(($signed(wire15[(4'hb):(3'h7)]) - (wire13 * reg18))));
        end
    end
  assign wire19 = wire10;
  module20 #() modinst65 (.clk(clk), .y(wire64), .wire24(reg17), .wire23(reg18), .wire25(wire8), .wire22(wire15), .wire21(wire12));
  assign wire66 = wire10;
  assign wire67 = (wire11 == ((|{(wire15 ? wire15 : reg18)}) ?
                      $signed($signed((^~wire9))) : (!$signed($signed(wire19)))));
  assign wire68 = reg16[(5'h11):(3'h6)];
  assign wire69 = (wire66 + wire14[(4'hc):(2'h3)]);
  assign wire70 = $unsigned((8'ha9));
  assign wire71 = $signed($signed(reg17[(5'h13):(3'h7)]));
  assign wire72 = ((~&(reg18 ?
                      $unsigned($signed(wire10)) : (!$signed(reg16)))) && ((((&wire15) ?
                          (wire8 ?
                              (8'hb0) : wire70) : wire8[(1'h1):(1'h0)]) & ((&wire69) <= (wire66 <= reg17))) ?
                      (8'hb2) : $signed(((wire9 ? (8'h9c) : wire64) ?
                          ((8'hbb) ^~ wire71) : $unsigned(reg17)))));
endmodule

module module20
#(parameter param63 = ((|({((8'hbc) ? (8'hae) : (8'had)), {(8'hae), (8'ha1)}} ? (~&((7'h40) ? (7'h42) : (8'hbf))) : ({(8'hbb), (8'hb7)} ? ((8'hbe) ^ (8'ha0)) : ((8'ha5) ? (8'hb6) : (8'hae))))) - {({((8'ha8) ? (8'h9e) : (8'h9c)), ((8'hb7) ? (8'h9f) : (8'hae))} == (((8'ha0) != (7'h40)) ? ((8'h9f) ? (8'hbc) : (8'hbc)) : (~&(8'haa))))}))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire25;
  input wire signed [(5'h14):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire47,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
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
                 reg50,
                 reg49,
                 reg48,
                 reg46,
                 reg45,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire26 = (wire25[(2'h2):(1'h1)] ? (8'ha8) : wire22[(3'h7):(2'h3)]);
  assign wire27 = (wire24 & (~|$signed((^(wire26 ? wire26 : wire22)))));
  assign wire28 = (wire22[(4'h8):(1'h0)] ?
                      $unsigned(wire27[(4'ha):(4'h9)]) : $signed((|wire22)));
  assign wire29 = ($unsigned(wire23) ?
                      (&$signed(($unsigned((7'h43)) ?
                          wire23[(4'ha):(2'h2)] : wire22))) : $unsigned(wire27));
  assign wire30 = wire24;
  assign wire31 = wire24[(4'hf):(4'hf)];
  assign wire32 = $signed(wire30);
  assign wire33 = ((wire29[(4'ha):(4'h8)] ?
                          wire28[(2'h3):(1'h1)] : {$signed((+wire23)),
                              {$signed(wire32), $signed(wire32)}}) ?
                      $unsigned($signed(((~^wire24) ?
                          wire25[(3'h6):(1'h0)] : wire25[(1'h0):(1'h0)]))) : wire25[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      if ({(!wire25), wire31[(5'h10):(1'h1)]})
        begin
          reg34 <= (+$signed((wire33 ^ (~|wire25))));
          reg35 <= ($unsigned(wire30[(4'hb):(4'h9)]) ?
              $signed((wire29 ?
                  wire33 : {$unsigned(wire30),
                      (8'hbb)})) : (&(wire22[(1'h1):(1'h0)] - wire33)));
          reg36 <= $signed($signed(wire33));
        end
      else
        begin
          reg34 <= reg34;
          reg35 <= $signed((-wire25[(1'h1):(1'h1)]));
          reg36 <= $signed(wire24);
          reg37 <= ({(($signed(wire24) ? wire25 : $unsigned(wire23)) ?
                  wire21 : $signed((reg34 ? wire21 : wire27))),
              (~^((reg34 ^~ (8'hbd)) | {wire33, wire24}))} << (8'hb9));
        end
    end
  assign wire38 = (~^wire30);
  assign wire39 = ($signed(($unsigned($unsigned(wire22)) ?
                      wire29 : wire26)) || ({$unsigned(wire28),
                          wire26[(3'h4):(3'h4)]} ?
                      $signed({$signed(wire27), {reg37, wire28}}) : (8'hb4)));
  assign wire40 = $unsigned($signed($signed(($unsigned(wire33) ?
                      wire21[(4'h9):(3'h5)] : (8'hb3)))));
  assign wire41 = $signed($signed($unsigned(wire22[(4'h8):(4'h8)])));
  assign wire42 = wire41;
  assign wire43 = (8'hb5);
  assign wire44 = $unsigned($unsigned(($signed((^~wire39)) * wire41[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg45 <= (({(7'h44), (&(^~wire22))} >= (&(wire44 << (wire38 ?
              wire40 : wire24)))) ?
          (+$signed($unsigned((wire30 ?
              wire26 : wire29)))) : $signed(wire39[(1'h0):(1'h0)]));
      reg46 <= {(^wire26[(4'hc):(2'h3)])};
    end
  assign wire47 = ($signed(((^$unsigned(wire21)) ?
                          wire38 : $unsigned((^wire41)))) ?
                      $signed(reg45[(4'hd):(4'hb)]) : wire23);
  always
    @(posedge clk) begin
      reg48 <= wire44[(3'h5):(1'h1)];
      reg49 <= ((^((~|(^~wire30)) ?
              reg45[(3'h6):(1'h0)] : reg48[(3'h5):(2'h2)])) ?
          $unsigned(((!$signed(reg35)) ?
              {(8'hac)} : wire29[(2'h2):(2'h2)])) : ((|($unsigned(wire27) * (reg36 >> reg36))) << $signed((8'hbb))));
      reg50 <= (&{(($signed(wire47) ?
              $signed(wire47) : (~&wire25)) >= $signed(wire44)),
          (8'hbb)});
    end
  always
    @(posedge clk) begin
      if ({$unsigned(($signed((+wire33)) >> ((wire33 >>> (8'hb5)) >>> ((8'hb4) ?
              wire41 : wire33))))})
        begin
          reg51 <= ((((8'had) - ($unsigned(wire23) ?
              (~^wire24) : $unsigned(reg35))) << (-reg37)) << (&(^~((wire30 == reg46) ?
              $signed(wire22) : (+reg50)))));
          if ((^~$signed(wire41[(2'h2):(1'h0)])))
            begin
              reg52 <= wire27[(4'hb):(3'h7)];
              reg53 <= (~|$unsigned((((7'h43) >> $signed((8'hbd))) == (-$signed((8'hb6))))));
              reg54 <= ((~&(~&{wire38[(4'h8):(3'h7)], (reg46 >>> wire25)})) ?
                  $signed(wire40) : $signed($signed(($unsigned((8'ha8)) != $unsigned(wire22)))));
            end
          else
            begin
              reg52 <= $unsigned((+{reg48[(1'h1):(1'h0)], wire42}));
            end
          reg55 <= $signed(wire44);
        end
      else
        begin
          if ($signed(wire40))
            begin
              reg51 <= $signed($signed({wire22[(2'h3):(1'h1)]}));
            end
          else
            begin
              reg51 <= {$unsigned({({wire25, wire32} ?
                          (reg52 << wire29) : reg53[(3'h4):(1'h1)])})};
              reg52 <= reg49;
              reg53 <= ($signed({(&reg50[(3'h6):(1'h0)]),
                  (-(wire22 ? reg36 : wire22))}) && wire30);
              reg54 <= wire31[(4'h8):(4'h8)];
              reg55 <= reg48;
            end
          reg56 <= wire31[(2'h3):(1'h0)];
          reg57 <= wire26[(1'h0):(1'h0)];
        end
      reg58 <= (~^($unsigned($signed($unsigned(wire40))) ?
          (^($signed(wire32) ?
              $unsigned(wire38) : (^reg46))) : wire27[(4'h8):(4'h8)]));
      reg59 <= $signed($signed(reg57));
      reg60 <= ($unsigned($unsigned((wire27 ? {reg53, reg49} : wire31))) ?
          (8'ha9) : $unsigned(wire25[(2'h3):(2'h3)]));
    end
  assign wire61 = $unsigned({({(8'hb4), wire27} ?
                          reg36[(4'hf):(1'h0)] : $unsigned((^reg51))),
                      (&reg56[(1'h1):(1'h1)])});
  assign wire62 = (($signed($signed(reg45)) ?
                          wire41[(3'h7):(1'h0)] : $unsigned((~((8'hbb) ?
                              reg35 : wire23)))) ?
                      $unsigned((~^$signed($signed(wire38)))) : wire32);
endmodule
