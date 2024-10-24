module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  reg [(4'h8):(1'h0)] reg4 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire7,
                 wire6,
                 reg4,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($unsigned(wire3) ?
          (+(8'hb2)) : $signed($signed((wire2 ?
              wire3[(4'h8):(2'h3)] : wire1))));
      reg5 <= $unsigned((reg4 ?
          (!$unsigned(((8'hbd) ?
              wire1 : (8'had)))) : (~$unsigned(wire3[(3'h7):(3'h5)]))));
    end
  assign wire6 = $unsigned({(8'hac), (8'hb8)});
  assign wire7 = (wire0 ^~ $signed((!reg4[(4'h8):(1'h1)])));
  module8 #() modinst61 (.wire11(wire1), .wire10(wire6), .y(wire60), .wire13(reg4), .wire9(wire0), .clk(clk), .wire12(wire2));
  assign wire62 = $signed((~^(^~$unsigned({wire3}))));
  assign wire63 = reg4;
  assign wire64 = {((!(&$unsigned((8'ha1)))) ?
                          $unsigned($signed($signed(wire6))) : wire6[(3'h5):(2'h3)])};
  assign wire65 = {wire7[(1'h1):(1'h0)]};
  assign wire66 = ({($signed(reg4[(3'h4):(3'h4)]) ?
                              reg5 : ((reg5 >> wire64) <<< $signed(wire6))),
                          wire7} ?
                      ($unsigned($signed($unsigned(reg4))) || (^~wire1)) : (((^~$signed(wire3)) ?
                              (wire62 == {wire62}) : (~&{wire3})) ?
                          wire63[(3'h4):(2'h3)] : $unsigned(({wire7} ?
                              wire62 : {wire63}))));
  assign wire67 = ($unsigned((wire66[(1'h0):(1'h0)] ?
                          $unsigned($unsigned(wire0)) : ($signed(wire7) ?
                              (wire7 != wire63) : reg4))) ?
                      (~&wire65[(2'h2):(2'h2)]) : ((&$signed($unsigned(wire63))) >> wire0[(4'hc):(4'hc)]));
  assign wire68 = (($signed((8'haf)) && reg5) ? wire6[(3'h4):(3'h4)] : wire7);
endmodule

module module8
#(parameter param59 = (8'hb1))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  assign y = {wire53,
                 wire51,
                 wire30,
                 wire25,
                 wire24,
                 wire15,
                 wire14,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire14 = wire13[(3'h4):(3'h4)];
  assign wire15 = wire12;
  always
    @(posedge clk) begin
      reg16 <= (^wire10[(3'h4):(2'h3)]);
      reg17 <= $unsigned(((wire15[(1'h1):(1'h1)] | wire15[(4'ha):(2'h3)]) ?
          reg16 : (($unsigned(wire10) & (wire13 == wire9)) ?
              (wire13[(3'h5):(3'h4)] >> $signed((8'ha6))) : $unsigned($unsigned((8'ha2))))));
      if (reg16)
        begin
          reg18 <= $signed(wire9[(4'ha):(4'ha)]);
          reg19 <= {$signed((($signed(wire9) ~^ $signed(wire12)) ?
                  ((wire15 << wire9) || wire15) : ($unsigned(wire14) ?
                      $signed(wire12) : (-wire10)))),
              reg18[(1'h1):(1'h0)]};
          reg20 <= (($signed(wire10[(1'h0):(1'h0)]) & (~|$signed((reg16 ?
                  (8'hb0) : (8'ha0))))) ?
              ((~^(wire10 ?
                  (~reg17) : wire13)) >>> ($signed(wire13[(2'h2):(1'h0)]) | (|wire9))) : $signed(wire14[(1'h1):(1'h0)]));
          reg21 <= ((&wire9[(1'h1):(1'h0)]) ?
              $signed(wire9) : (((wire14[(4'h8):(1'h1)] ?
                  wire13[(3'h4):(1'h0)] : (reg16 ~^ wire13)) ^~ reg16) - $unsigned((wire15[(2'h2):(1'h1)] ?
                  wire13 : $signed(reg18)))));
          reg22 <= wire12[(4'h8):(4'h8)];
        end
      else
        begin
          reg18 <= wire13;
          reg19 <= (^~($unsigned(wire14) ?
              reg22[(1'h0):(1'h0)] : (~^($signed(wire9) ^~ (reg21 + reg18)))));
          reg20 <= (~{(reg19 >= (!(wire10 <= wire13))), (~({wire14} | reg21))});
          reg21 <= wire14[(1'h0):(1'h0)];
        end
      reg23 <= (-wire12[(3'h5):(3'h4)]);
    end
  assign wire24 = ((($signed(wire13) >= reg19) ^~ (wire11[(2'h2):(2'h2)] || $signed(wire12))) ?
                      {$unsigned(reg21), wire11} : reg16);
  assign wire25 = ((~^reg16) > $unsigned(($signed(reg19[(3'h7):(3'h6)]) + wire14[(3'h6):(1'h1)])));
  always
    @(posedge clk) begin
      reg26 <= reg23;
      reg27 <= $unsigned($signed(((wire11[(1'h1):(1'h0)] < $signed(reg22)) < $unsigned(reg16))));
      reg28 <= (^$unsigned($signed((8'haa))));
      reg29 <= (&(|$signed($unsigned((~&reg16)))));
    end
  assign wire30 = $unsigned((~(8'ha4)));
  module31 #() modinst52 (.wire32(reg26), .wire34(reg29), .wire33(wire24), .clk(clk), .wire35(wire13), .y(wire51));
  assign wire53 = ((~^wire14) >>> ($unsigned(reg17) || (~$signed((wire51 - wire14)))));
  always
    @(posedge clk) begin
      reg54 <= wire53;
      if ($signed(reg20))
        begin
          reg55 <= reg20[(2'h2):(2'h2)];
          reg56 <= ((reg21[(2'h2):(1'h1)] ?
              (-$signed({(8'hb0), reg19})) : $unsigned(reg29)) << reg22);
          reg57 <= $signed(($signed(($unsigned(wire24) ?
              wire13 : (wire24 ~^ reg21))) ^~ (wire25 > reg56)));
          reg58 <= $signed((8'ha5));
        end
      else
        begin
          reg55 <= ($unsigned(reg20) ?
              {$signed(wire13)} : $signed(reg57[(4'hb):(4'h8)]));
          reg56 <= ($signed((^((~|reg54) >= wire15))) ?
              wire11 : ($signed((8'haf)) & (reg27 < reg19)));
        end
    end
endmodule

module module31
#(parameter param49 = (~|(-((((8'haf) + (8'hb7)) ? ((8'hb2) ? (8'hb0) : (8'hbd)) : ((8'ha5) >>> (8'ha1))) ^ {((8'hb6) ? (8'hb0) : (8'hbb))}))), 
parameter param50 = param49)
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire35;
  input wire signed [(5'h11):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 (1'h0)};
  assign wire36 = wire35;
  assign wire37 = $signed($signed($signed($signed({wire33}))));
  assign wire38 = $signed((|(+{wire37[(3'h4):(2'h3)]})));
  assign wire39 = ($unsigned((^{{wire34,
                          (8'hb5)}})) >= {(wire34 >>> ($unsigned(wire36) <= wire32[(1'h1):(1'h0)]))});
  assign wire40 = $unsigned(wire33);
  assign wire41 = $unsigned({wire36[(3'h5):(1'h0)]});
  assign wire42 = wire35[(2'h2):(2'h2)];
  assign wire43 = ($unsigned(wire42[(2'h3):(1'h0)]) ?
                      wire36[(2'h2):(2'h2)] : $unsigned({$unsigned((wire38 ?
                              wire40 : wire37)),
                          $unsigned($signed((8'ha1)))}));
  assign wire44 = {(wire34[(4'h8):(3'h6)] ?
                          wire39 : (wire35[(2'h2):(1'h0)] <= ((wire42 ?
                                  wire32 : wire37) ?
                              $signed(wire37) : wire36[(3'h6):(3'h6)])))};
  assign wire45 = ({(wire44[(3'h5):(2'h2)] * (~|((8'ha2) ? wire37 : wire33))),
                      $unsigned(($unsigned((8'hb8)) < $unsigned(wire40)))} | (8'h9f));
  assign wire46 = wire40;
  assign wire47 = $signed({(wire36 >>> $unsigned($unsigned(wire43)))});
  assign wire48 = wire45;
endmodule
