module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire26;
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  assign y = {wire53,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire35,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg34,
                 (1'h0)};
  module5 #() modinst27 (wire26, clk, wire4, wire0, wire3, wire1, wire2);
  assign wire28 = (wire1[(3'h5):(1'h1)] << ((!wire3[(3'h6):(1'h0)]) != ($unsigned(wire1) ?
                      (^$signed(wire1)) : (|wire3[(3'h7):(3'h7)]))));
  assign wire29 = (wire4 == $signed($signed({wire2[(3'h4):(1'h1)]})));
  assign wire30 = $unsigned($signed(({wire3[(2'h2):(2'h2)],
                      wire0} >>> $unsigned((~&wire2)))));
  assign wire31 = (~^wire0);
  assign wire32 = $signed($unsigned((^~$unsigned($signed(wire2)))));
  assign wire33 = (wire3[(1'h0):(1'h0)] ?
                      ($unsigned($signed((wire3 >>> wire32))) ?
                          $unsigned(wire1) : (!(8'hbe))) : {(-(8'hbb))});
  always
    @(posedge clk) begin
      reg34 <= wire4[(2'h3):(2'h3)];
    end
  assign wire35 = ((~^{$signed({wire3}),
                      ($signed((8'had)) ~^ $signed(wire0))}) & $signed($signed(wire26)));
  always
    @(posedge clk) begin
      if ($signed($unsigned($signed(wire29[(3'h7):(3'h6)]))))
        begin
          reg36 <= (wire28 ? (~(8'ha9)) : wire3);
        end
      else
        begin
          reg36 <= (wire4 || (~&wire0[(4'hb):(3'h7)]));
          reg37 <= ($unsigned((wire29 ?
                  ((wire1 || (8'hbf)) ?
                      (|wire3) : (~&wire35)) : $signed(wire35[(3'h4):(3'h4)]))) ?
              {(((wire26 ? wire35 : wire0) >>> {wire28}) ?
                      ($unsigned(wire3) >= (-wire35)) : ((wire32 != (8'hb6)) <= $signed(wire26)))} : $unsigned(($signed(wire3[(1'h0):(1'h0)]) >>> wire28)));
          reg38 <= (wire30[(3'h6):(2'h3)] ?
              ({$signed(wire32[(2'h2):(1'h1)]),
                  wire32} != $signed(wire33[(3'h5):(3'h5)])) : $signed($signed($signed(reg37[(4'h8):(3'h5)]))));
        end
      reg39 <= wire33;
    end
  assign wire40 = (|$unsigned((wire35[(3'h7):(3'h5)] ^ (7'h42))));
  assign wire41 = $unsigned($unsigned(reg34));
  assign wire42 = {wire1, wire41[(2'h3):(2'h3)]};
  assign wire43 = wire32;
  assign wire44 = $signed((wire26 ^~ {($signed((8'h9e)) <= ((8'hbe) == wire1)),
                      ($unsigned((7'h41)) * $signed(wire40))}));
  always
    @(posedge clk) begin
      if ($signed($signed(((&$signed(wire30)) | wire43))))
        begin
          reg45 <= (({($signed(wire3) ?
                      (reg36 ? reg36 : wire41) : $unsigned(wire43))} ?
              $signed(wire44) : wire4) ~^ ((~&(wire1[(4'h8):(2'h2)] ?
              wire3[(4'h9):(3'h5)] : (~^wire30))) ^~ $unsigned(wire3)));
          reg46 <= (wire1 < $signed({(wire43 ^ wire43[(4'he):(1'h0)]),
              (+(wire32 ? (7'h43) : reg39))}));
          reg47 <= ($unsigned($signed($signed((reg45 == wire40)))) ?
              $unsigned((({reg37, wire41} >= wire32) * {(^~reg38),
                  $signed(wire32)})) : $unsigned(wire42[(1'h1):(1'h0)]));
        end
      else
        begin
          reg45 <= $signed($signed($signed((wire42 - (reg39 == wire43)))));
          if ((wire32[(4'hf):(4'hc)] >= $signed({{(wire0 ~^ wire42),
                  ((8'had) <= (8'haf))},
              (~^wire2)})))
            begin
              reg46 <= wire3;
              reg47 <= wire30;
              reg48 <= reg39;
            end
          else
            begin
              reg46 <= ((^reg34[(1'h0):(1'h0)]) ?
                  $unsigned($signed(((reg36 ?
                      reg39 : wire31) ^ (wire1 == wire4)))) : (&$signed((~&(wire30 ?
                      wire40 : (8'hb5))))));
              reg47 <= wire44[(4'h9):(1'h1)];
              reg48 <= {$unsigned((+$unsigned($signed((8'ha8))))),
                  (~|(wire29 == (wire28 ? $unsigned((8'hb6)) : (8'haf))))};
            end
          reg49 <= (+$unsigned($unsigned($signed($unsigned(wire41)))));
        end
      reg50 <= $signed($unsigned(($unsigned(wire44[(2'h3):(2'h3)]) & wire30)));
      reg51 <= wire33[(2'h3):(2'h2)];
      reg52 <= (reg48[(3'h7):(3'h5)] < (($signed((8'hb3)) ?
              $unsigned((wire32 + reg34)) : $unsigned((wire33 | wire42))) ?
          ($unsigned($signed(wire30)) >> (~|wire43[(4'hc):(3'h7)])) : wire2[(4'h8):(2'h3)]));
    end
  assign wire53 = $signed(wire1);
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(3'h6):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
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
                 (1'h0)};
  assign wire11 = $signed($unsigned((!(wire6[(4'he):(3'h6)] ^~ (wire7 ?
                      wire6 : (7'h43))))));
  assign wire12 = (((wire7 ? wire11 : {$unsigned(wire9), $unsigned((7'h40))}) ?
                          wire10[(4'hb):(4'h8)] : wire7) ?
                      (^wire11[(4'h9):(3'h4)]) : wire10[(3'h4):(1'h0)]);
  assign wire13 = $signed(wire9);
  assign wire14 = (wire11[(1'h1):(1'h0)] ~^ $unsigned(wire9));
  assign wire15 = $unsigned($signed(($signed($signed(wire9)) ?
                      (wire9 - (wire7 ? wire12 : wire7)) : wire10)));
  assign wire16 = (&wire8[(2'h3):(2'h2)]);
  assign wire17 = {(wire14 ?
                          (~&wire11[(4'ha):(1'h0)]) : wire15[(4'he):(1'h0)])};
  assign wire18 = (wire16 ? $unsigned($signed(wire10)) : wire7[(3'h6):(3'h6)]);
  assign wire19 = $unsigned($unsigned({(wire7[(2'h3):(2'h3)] >> $signed(wire12)),
                      (8'hb7)}));
  assign wire20 = (~^{wire7[(3'h6):(1'h0)]});
  assign wire21 = (((|(^~(wire11 ? wire17 : wire8))) >> (wire19 ?
                          wire8[(1'h0):(1'h0)] : (!(wire8 ?
                              wire11 : wire15)))) ?
                      {wire15} : wire16[(1'h0):(1'h0)]);
  assign wire22 = (^$unsigned((wire12[(4'h8):(1'h0)] == wire21[(3'h5):(3'h5)])));
  assign wire23 = (+($signed($unsigned($unsigned(wire8))) ? wire14 : (8'hab)));
  assign wire24 = wire10[(3'h6):(2'h3)];
  assign wire25 = ($unsigned((wire18[(4'he):(3'h4)] >>> (~|(~|wire17)))) ?
                      (!wire13) : ($unsigned(wire22) ?
                          wire10[(3'h7):(3'h6)] : ((((7'h42) >= (8'hbd)) > (wire14 ?
                                  wire21 : wire7)) ?
                              ((wire12 != (8'had)) ?
                                  (wire13 ?
                                      wire22 : wire16) : wire12) : wire12[(3'h4):(1'h1)])));
endmodule
