module top
#(parameter param70 = ({{(~^((8'hac) ? (8'ha5) : (8'ha3)))}, ((((8'hbb) ? (8'ha2) : (8'ha2)) > ((8'hb7) != (8'hb9))) > ((8'hbe) != (~(8'ha0))))} - ((!(~&((8'hab) ? (8'h9c) : (8'hb7)))) + (&{{(8'h9d)}}))), 
parameter param71 = param70)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire58;
  assign y = {wire69,
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
                 (1'h0)};
  module5 #() modinst59 (wire58, clk, wire4, wire1, wire0, wire2, wire3);
  assign wire60 = ((($unsigned((^~wire1)) || {wire4}) - wire3) >>> ((8'hb6) == $unsigned(wire1[(4'h8):(3'h7)])));
  assign wire61 = (&$unsigned(((-wire1) ?
                      (wire60[(3'h7):(3'h6)] ?
                          $unsigned(wire0) : wire1) : (~$signed(wire3)))));
  assign wire62 = ((wire1[(4'h9):(4'h9)] == $unsigned((~|(^wire60)))) ?
                      wire1[(4'hd):(4'h8)] : $signed((~|wire2[(4'hc):(3'h4)])));
  assign wire63 = (|wire61);
  assign wire64 = wire62;
  assign wire65 = (~wire62);
  assign wire66 = $unsigned($unsigned($signed(wire62)));
  assign wire67 = wire63[(1'h0):(1'h0)];
  assign wire68 = (|$signed({((wire67 ~^ wire0) >> (wire0 << wire61))}));
  assign wire69 = (wire1[(4'hb):(4'hb)] == $signed((&wire61)));
endmodule

module module5
#(parameter param56 = (((^~{((8'hba) ? (8'hbe) : (8'hbe)), ((8'hb1) != (8'hb0))}) ^~ (8'hbf)) ? (((((7'h41) == (7'h41)) ? (|(8'hbc)) : (~|(8'ha9))) >> (8'ha1)) ? (8'hba) : {(((7'h41) ? (8'hb8) : (8'hb8)) ? ((8'h9e) ? (8'ha7) : (7'h44)) : ((8'hb9) ? (8'ha1) : (8'ha5))), (^((8'ha2) <<< (8'hb8)))}) : {(({(8'hab)} ? ((8'hab) >>> (8'hb6)) : ((8'hb0) ? (7'h41) : (8'had))) ? (7'h40) : (((8'h9e) ? (8'hae) : (8'hb1)) ? (~^(8'hae)) : (~|(8'hbd)))), (({(7'h43), (8'hab)} ? ((8'ha1) - (8'hbc)) : (~|(8'hb8))) ? (~&((8'ha0) ~^ (7'h43))) : ((8'ha9) > ((8'hb6) ^ (8'hb5))))}), 
parameter param57 = (^((({param56} - param56) ? ((param56 ? (8'had) : param56) ? {param56, param56} : param56) : (^~param56)) == ((!(^(8'hb1))) | {(|param56)}))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire6;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire47;
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire11,
                 wire47,
                 (1'h0)};
  assign wire11 = {$signed((((wire9 ?
                          wire9 : wire6) ~^ $signed(wire10)) - ((wire7 ?
                          wire8 : (8'hbf)) && $unsigned(wire6))))};
  module12 #() modinst48 (.wire13(wire8), .y(wire47), .wire16(wire11), .wire17(wire7), .wire15(wire9), .clk(clk), .wire14(wire6));
  assign wire49 = (|wire11[(4'hc):(3'h4)]);
  assign wire50 = wire11;
  assign wire51 = $signed(((wire7 <= wire49) >= wire50));
  assign wire52 = $unsigned(((|(((8'hbe) ? (8'hae) : wire51) ?
                      (^wire50) : wire47)) && (!(8'hbf))));
  assign wire53 = wire10;
  assign wire54 = ($signed(($unsigned($unsigned(wire11)) ?
                      (8'hb9) : wire50)) ^~ wire49[(3'h7):(2'h3)]);
  assign wire55 = ($signed({(-$unsigned(wire51)),
                      $unsigned($signed(wire52))}) < (~$unsigned(wire52)));
endmodule

module module12
#(parameter param46 = {(((&((8'had) - (8'had))) ? (^~{(8'hb2)}) : (((8'ha2) ? (8'ha4) : (8'hae)) ? ((8'h9e) ? (8'ha4) : (8'haa)) : {(8'hb3), (8'h9f)})) >>> ((((8'hb6) ? (8'hae) : (8'hbd)) == ((8'haf) + (8'h9d))) ? (((8'hbe) - (8'hb5)) >> ((8'hb1) & (8'hb6))) : ((!(8'ha8)) ? ((8'ha4) << (8'hb7)) : {(8'ha7), (8'had)}))), (~^({((8'hbd) ~^ (8'hb9)), (~(8'h9f))} <<< {((8'h9e) ~^ (8'hbf)), {(8'hb2)}}))})
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire37,
                 wire36,
                 wire35,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg39,
                 reg38,
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
                 (1'h0)};
  assign wire18 = (($unsigned($unsigned(wire13[(3'h6):(3'h6)])) * wire15[(1'h1):(1'h1)]) * wire16[(2'h2):(1'h1)]);
  assign wire19 = $unsigned($signed(wire13));
  assign wire20 = (wire14 ~^ {(~^$signed(wire13[(4'h8):(1'h1)]))});
  assign wire21 = (7'h41);
  assign wire22 = $unsigned({(~&$unsigned($signed(wire20)))});
  assign wire23 = (8'hb8);
  always
    @(posedge clk) begin
      reg24 <= {wire22, wire13[(1'h0):(1'h0)]};
      reg25 <= (^((($unsigned(wire20) >> $signed(wire19)) * wire17[(2'h2):(1'h1)]) ?
          wire23[(3'h5):(2'h3)] : (~|((+wire18) >= (reg24 ~^ wire21)))));
      reg26 <= $signed($signed($signed({$unsigned(wire14), (8'ha6)})));
      if ($signed(reg25))
        begin
          reg27 <= $signed({{reg24[(3'h7):(3'h7)], wire20[(4'hc):(4'ha)]},
              wire19});
          reg28 <= $unsigned(reg25[(2'h2):(1'h0)]);
          if (wire22[(1'h1):(1'h0)])
            begin
              reg29 <= {$unsigned(reg28[(4'hb):(3'h7)])};
              reg30 <= wire18[(5'h10):(4'ha)];
              reg31 <= (8'hae);
              reg32 <= $signed((8'hbc));
              reg33 <= (&(|$signed(reg25[(3'h4):(3'h4)])));
            end
          else
            begin
              reg29 <= (|wire23[(2'h3):(1'h1)]);
              reg30 <= ($unsigned(reg29[(2'h3):(2'h2)]) + $signed({(reg26 ?
                      wire19 : (wire18 ? reg32 : wire23))}));
              reg31 <= {((((wire14 ? reg26 : wire14) ?
                          reg27[(4'h8):(3'h4)] : $signed(reg26)) ^~ wire16[(1'h0):(1'h0)]) ?
                      wire20 : wire19)};
              reg32 <= reg31[(4'h9):(3'h5)];
            end
        end
      else
        begin
          reg27 <= {$unsigned((8'ha1))};
          reg28 <= (((wire22 ?
                  (reg30 ^ (!reg27)) : ($signed((8'ha1)) ?
                      $unsigned(reg32) : (wire18 == reg31))) == (8'hbb)) ?
              wire15[(5'h11):(1'h0)] : {(wire23 <= (~(wire18 ^ wire20))),
                  ((~|((8'ha1) ? reg31 : reg33)) ?
                      reg28[(5'h14):(4'hd)] : wire20[(4'hc):(1'h1)])});
          if ($signed(reg30))
            begin
              reg29 <= (!wire19);
            end
          else
            begin
              reg29 <= (~&{reg29});
            end
          reg30 <= wire16[(2'h2):(2'h2)];
        end
      reg34 <= wire23;
    end
  assign wire35 = $signed({(reg32[(2'h3):(2'h2)] ?
                          $signed(reg27) : (-wire16[(4'h8):(3'h4)])),
                      wire19});
  assign wire36 = $signed($signed((!$unsigned((wire35 <= reg31)))));
  assign wire37 = reg25[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg38 <= wire18;
      reg39 <= (!({((reg33 ? wire17 : (8'h9c)) < (-wire20)),
          reg27} ^~ $unsigned($signed(reg33))));
    end
  assign wire40 = reg31;
  assign wire41 = wire13;
  assign wire42 = reg32;
  assign wire43 = $unsigned($signed((!wire14[(1'h1):(1'h1)])));
  assign wire44 = ((8'hbe) > ($unsigned({reg38, {reg26}}) << reg38));
  assign wire45 = wire44[(2'h3):(2'h3)];
endmodule
