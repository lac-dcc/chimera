module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  assign y = {wire71,
                 wire70,
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
                 wire58,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = $unsigned({(($unsigned(wire1) >= wire5) ?
                         $unsigned(wire4[(3'h6):(3'h5)]) : ($unsigned(wire2) ^ wire2))});
  module7 #() modinst59 (wire58, clk, wire0, wire2, wire1, wire4);
  assign wire60 = (wire4 ?
                      ((~^$signed(wire6)) && $signed($signed(wire1[(4'he):(4'h8)]))) : wire6[(4'h8):(1'h1)]);
  assign wire61 = ($unsigned($unsigned((wire60 ?
                          $unsigned(wire5) : wire1[(4'h9):(3'h4)]))) ?
                      wire58 : ((-wire5) ?
                          $unsigned((8'hb4)) : $signed($unsigned(wire2[(4'ha):(3'h7)]))));
  assign wire62 = wire1;
  assign wire63 = (^$unsigned(((7'h43) > {$signed(wire5)})));
  assign wire64 = ((8'hb5) <<< ((wire1 * $signed($unsigned(wire0))) >= wire3[(3'h5):(3'h5)]));
  assign wire65 = wire2[(4'hf):(1'h0)];
  assign wire66 = $signed({$signed((wire3 * (wire0 == wire64))),
                      $signed({(wire3 > wire1), wire5})});
  assign wire67 = (|(~|wire62));
  assign wire68 = ((!wire66[(2'h3):(1'h1)]) ?
                      {$signed(wire67[(2'h2):(2'h2)])} : wire6[(4'h8):(3'h5)]);
  assign wire69 = (^$signed($unsigned($signed(wire6[(3'h5):(3'h4)]))));
  assign wire70 = (7'h40);
  assign wire71 = (((($signed((8'hbe)) ?
                                  wire70[(2'h3):(1'h1)] : (wire5 ?
                                      wire63 : wire70)) ?
                              wire1[(4'hc):(1'h1)] : wire4) ?
                          (|wire58[(4'h9):(3'h7)]) : wire0) ?
                      (wire6 ?
                          (8'haa) : (-(+(wire66 ?
                              wire0 : wire69)))) : (~&(&$unsigned(wire60))));
endmodule

module module7
#(parameter param56 = (&(&(((~(8'ha3)) || {(8'hba), (8'haa)}) ? ({(8'ha0), (8'hab)} << ((8'h9c) ? (8'ha4) : (8'hbc))) : (((8'hb0) ? (8'hbb) : (8'hb7)) ? (+(8'hbb)) : (~^(8'haa)))))), 
parameter param57 = {(^~(&((param56 ? param56 : param56) ? (param56 | param56) : param56))), param56})
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire48;
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  assign y = {wire55,
                 wire50,
                 wire12,
                 wire48,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire12 = $unsigned($signed((($signed(wire11) ?
                          (wire9 ? wire10 : wire9) : (wire9 || wire8)) ?
                      (((8'ha6) ? wire8 : wire10) ?
                          (wire11 ~^ wire8) : ((7'h44) ?
                              (8'hbc) : wire9)) : $unsigned($unsigned(wire10)))));
  module13 #() modinst49 (wire48, clk, wire11, wire9, wire10, wire12, wire8);
  assign wire50 = wire9[(4'h9):(3'h6)];
  always
    @(posedge clk) begin
      reg51 <= wire11;
    end
  always
    @(posedge clk) begin
      reg52 <= reg51[(3'h5):(2'h2)];
      reg53 <= wire48;
      reg54 <= wire48;
    end
  assign wire55 = ($unsigned(reg52) > ($signed(wire10[(5'h10):(1'h0)]) ?
                      reg53[(4'h8):(3'h4)] : wire12[(3'h5):(3'h4)]));
endmodule

module module13
#(parameter param46 = ((!((((8'hb3) ? (8'ha6) : (8'hbe)) * ((8'hb9) ? (8'hac) : (8'hbf))) >>> (((8'hbb) ? (8'hb1) : (8'hb6)) ? ((8'hac) ? (8'hbd) : (8'had)) : ((8'ha8) ? (8'hb8) : (8'haf))))) ? (&((~^((8'hba) ^ (8'h9c))) && ((~&(8'h9c)) ? {(7'h43), (8'hb7)} : ((7'h43) | (8'hb1))))) : ((+(^~((8'hb7) ? (8'hb0) : (8'h9f)))) ? (~&(((8'h9c) != (8'hb5)) ? ((8'hb9) != (8'haf)) : (+(8'ha8)))) : ((((8'hb1) ? (8'hac) : (8'ha9)) ? ((8'ha3) && (7'h40)) : {(8'hbb), (8'hb5)}) ? (((8'h9c) ? (8'hb0) : (8'hb1)) ? ((8'hba) * (8'had)) : ((8'hbe) ? (8'hac) : (8'hb9))) : {((8'hb4) >>> (8'ha9))}))), 
parameter param47 = ((^~param46) ? param46 : (&{param46, (-param46)})))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire18;
  input wire [(4'h9):(1'h0)] wire17;
  input wire [(3'h5):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire21,
                 wire20,
                 wire19,
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
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = ($unsigned({wire15[(3'h5):(3'h4)],
                      $signed((wire17 ?
                          wire15 : (7'h43)))}) >= ($unsigned($signed((wire14 ?
                          wire16 : wire14))) ?
                      ($signed((wire14 ?
                          wire17 : wire18)) ~^ ((!wire18) << (wire15 ?
                          (8'hbd) : wire15))) : $signed(wire14[(3'h6):(2'h3)])));
  assign wire20 = ((wire17 + (((^~wire17) <<< (8'hb8)) ?
                      {$signed(wire16)} : (^{wire17,
                          wire18}))) >>> (!wire15[(2'h3):(1'h1)]));
  assign wire21 = wire18;
  always
    @(posedge clk) begin
      if ($signed(wire16[(2'h2):(1'h1)]))
        begin
          if ($unsigned($unsigned(wire20[(2'h2):(1'h1)])))
            begin
              reg22 <= (((8'ha3) ~^ wire20[(4'ha):(2'h2)]) ?
                  (wire14[(5'h10):(3'h4)] < (|$signed((wire19 ?
                      (7'h40) : (8'hbf))))) : wire14[(4'hb):(4'ha)]);
            end
          else
            begin
              reg22 <= (&{(($unsigned((8'hb6)) | $unsigned(wire18)) * wire18)});
              reg23 <= $signed(wire18);
              reg24 <= $unsigned((wire18 ?
                  reg22 : ($unsigned((8'ha4)) ?
                      (reg22 ~^ wire18) : $signed($unsigned(wire17)))));
              reg25 <= ((|((8'ha6) ?
                  $unsigned(reg22) : $unsigned({wire21,
                      wire21}))) ~^ $unsigned({reg23[(3'h5):(2'h3)],
                  ((wire15 << wire20) ?
                      (wire16 ? reg24 : wire17) : $unsigned(reg24))}));
            end
          reg26 <= ($signed($signed((+$signed(wire15)))) ?
              ((7'h43) != {(wire17 ^~ (wire17 ?
                      (8'hb4) : wire16))}) : {({(wire16 ? wire21 : reg23),
                      (8'hb8)} < (~^wire21))});
          reg27 <= $signed($signed($unsigned(((reg24 ? wire14 : wire16) ?
              $signed(reg24) : reg22[(2'h2):(1'h1)]))));
          reg28 <= (wire18[(4'h8):(2'h2)] >> $unsigned(reg23[(3'h5):(2'h2)]));
        end
      else
        begin
          reg22 <= wire20;
          reg23 <= ($unsigned(wire20[(1'h1):(1'h0)]) >> $signed($signed($unsigned(reg25[(1'h1):(1'h0)]))));
        end
      reg29 <= (^(((8'h9e) + wire21[(3'h4):(1'h0)]) && wire19[(3'h4):(2'h3)]));
      if (((+$signed((reg27[(2'h2):(1'h1)] ?
              wire16[(2'h3):(2'h2)] : (~^reg29)))) ?
          wire15 : $unsigned(wire15)))
        begin
          reg30 <= reg25[(2'h2):(2'h2)];
          reg31 <= (-((wire20 | $unsigned(reg28)) == (^~((wire18 ?
                  wire21 : wire20) ?
              (wire17 ? reg27 : wire15) : reg29))));
          reg32 <= (wire17 > $signed((8'had)));
          reg33 <= $signed($unsigned((reg31 && reg26)));
        end
      else
        begin
          reg30 <= reg23;
          reg31 <= $signed($unsigned(reg28));
          reg32 <= {$signed((8'ha3))};
          reg33 <= reg22[(1'h1):(1'h1)];
          reg34 <= $unsigned({reg23});
        end
      reg35 <= $signed(((~&$signed((|(8'hb6)))) || (&wire17[(1'h0):(1'h0)])));
      reg36 <= $signed(reg24[(3'h6):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg37 <= (^~wire15);
      reg38 <= reg24[(3'h4):(1'h0)];
    end
  assign wire39 = (^~({reg32, (reg29[(5'h10):(4'h9)] < $signed(reg30))} ?
                      reg38[(5'h10):(4'he)] : $signed($unsigned((wire15 ?
                          reg34 : reg31)))));
  assign wire40 = wire17;
  assign wire41 = ($unsigned($unsigned(($unsigned(reg27) <<< $signed(wire20)))) ?
                      (8'haa) : (reg25 < {((-wire20) ^ {reg37, wire17})}));
  assign wire42 = reg31[(3'h5):(3'h5)];
  assign wire43 = reg32[(1'h0):(1'h0)];
  assign wire44 = (~^(($signed((~&reg34)) ^ wire21) + reg27));
  assign wire45 = (~&{(^~{wire44[(1'h1):(1'h0)]}), wire42});
endmodule
