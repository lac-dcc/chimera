module top
#(parameter param52 = (((~^{{(8'ha3), (8'hbf)}}) <= ((~^((8'h9c) ? (8'hae) : (8'h9e))) <<< (8'hb1))) * ((((~|(8'hbf)) ? (~&(8'hba)) : ((8'hb6) ? (8'hae) : (7'h44))) ? (((8'hae) ~^ (8'ha8)) * ((7'h44) ? (8'hbf) : (8'hb7))) : (~|{(8'had), (8'hbd)})) && {(((8'hb3) != (7'h41)) <<< (~&(7'h42))), ((!(8'hb8)) + (&(8'h9d)))})), 
parameter param53 = (8'ha7))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire42;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire27,
                 wire29,
                 wire30,
                 wire42,
                 (1'h0)};
  module5 #() modinst28 (wire27, clk, wire2, wire3, wire0, wire4, wire1);
  assign wire29 = ((!wire4[(4'h9):(4'h9)]) ?
                      $signed(($unsigned(wire4) ?
                          ($signed(wire0) <= (wire0 + wire2)) : (+$signed(wire4)))) : $signed($unsigned($signed((wire2 ?
                          wire3 : wire2)))));
  assign wire30 = ($signed($signed($signed($signed(wire4)))) ?
                      $unsigned($unsigned({wire1})) : ($unsigned($unsigned((~|(8'had)))) * $signed({(wire29 ?
                              wire0 : wire4),
                          $unsigned((8'had))})));
  module31 #() modinst43 (.wire32(wire3), .clk(clk), .wire35(wire0), .y(wire42), .wire34(wire4), .wire33(wire30), .wire36(wire27));
  assign wire44 = $signed($unsigned(($signed((wire27 >= wire0)) >>> $signed(wire0[(4'hb):(4'h8)]))));
  assign wire45 = wire4[(1'h0):(1'h0)];
  assign wire46 = wire44[(2'h3):(2'h3)];
  assign wire47 = wire46[(2'h2):(1'h1)];
  assign wire48 = $signed($unsigned(wire46[(1'h0):(1'h0)]));
  assign wire49 = $unsigned((((|wire46) ?
                      wire2 : wire48[(2'h2):(2'h2)]) << ((&(wire0 && wire3)) || $signed((wire44 ^~ wire1)))));
  assign wire50 = $signed($signed((-$signed((wire47 ? wire4 : wire45)))));
  assign wire51 = wire49;
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire36;
  input wire signed [(2'h2):(1'h0)] wire35;
  input wire [(4'h9):(1'h0)] wire34;
  input wire signed [(3'h6):(1'h0)] wire33;
  input wire signed [(4'hd):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire37;
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  assign y = {wire41, wire40, wire37, reg39, reg38, (1'h0)};
  assign wire37 = ((wire34 >> $unsigned($unsigned(wire33))) ?
                      wire36[(3'h4):(3'h4)] : (^wire34[(3'h6):(3'h4)]));
  always
    @(posedge clk) begin
      reg38 <= $unsigned($signed((|(wire33[(3'h6):(3'h6)] & wire35[(1'h0):(1'h0)]))));
      reg39 <= {$unsigned($unsigned(wire37))};
    end
  assign wire40 = $signed(wire35[(1'h1):(1'h1)]);
  assign wire41 = wire35[(2'h2):(1'h1)];
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire signed [(2'h3):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire11 = (wire6[(1'h0):(1'h0)] << $signed((($signed(wire6) ?
                          $signed(wire6) : (wire6 ^ wire8)) ?
                      ({wire10} ? wire7 : (~^wire8)) : $unsigned(wire6))));
  assign wire12 = (&$unsigned(wire7[(2'h3):(2'h2)]));
  assign wire13 = $signed(({(~|$unsigned(wire10)),
                      $signed($signed(wire8))} & wire8[(4'h8):(1'h0)]));
  assign wire14 = wire11[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg15 <= wire9[(1'h0):(1'h0)];
      if ($signed(wire8[(3'h5):(3'h4)]))
        begin
          reg16 <= {{$signed((~((8'hbc) ? (8'ha0) : (8'hac)))), wire12}};
          reg17 <= (({(~^(wire13 >>> wire7)),
                      $unsigned(((8'hac) ? reg15 : reg15))} ?
                  $unsigned((|((8'hba) ?
                      reg15 : (8'hb6)))) : wire8[(4'hb):(2'h3)]) ?
              $unsigned((wire13[(1'h1):(1'h1)] ?
                  wire13[(1'h0):(1'h0)] : $unsigned({wire10,
                      wire7}))) : $unsigned(($signed((&wire10)) ?
                  ($unsigned(wire9) ?
                      $signed(wire6) : wire14[(2'h2):(2'h2)]) : ($signed(wire7) ?
                      wire12 : (~wire13)))));
          reg18 <= $unsigned({(|((reg15 != reg17) && $unsigned((8'hb5)))),
              (wire14 | wire13[(1'h1):(1'h1)])});
        end
      else
        begin
          reg16 <= wire13[(2'h2):(2'h2)];
          reg17 <= ({(wire8[(1'h1):(1'h0)] ?
                      (wire13[(2'h2):(1'h0)] ?
                          (reg17 ?
                              reg16 : (8'ha0)) : reg15[(3'h4):(3'h4)]) : ((wire14 ?
                          reg16 : wire6) ^ $signed(wire7))),
                  $unsigned(wire13[(1'h0):(1'h0)])} ?
              {$signed(reg17[(4'h8):(3'h5)])} : $unsigned((wire12[(5'h15):(3'h6)] > (reg16[(2'h3):(2'h2)] ?
                  wire6[(1'h0):(1'h0)] : (wire6 ? wire14 : reg16)))));
        end
    end
  assign wire19 = $signed($unsigned((^~(!{reg15}))));
  assign wire20 = wire19;
  assign wire21 = (($unsigned((wire11 ?
                              (wire9 ? wire19 : reg17) : (wire12 ?
                                  wire9 : reg15))) ?
                          wire14 : wire14[(1'h0):(1'h0)]) ?
                      wire20[(4'h9):(4'h9)] : $unsigned((~$unsigned((reg18 ?
                          wire10 : wire12)))));
  assign wire22 = ((wire10 - $signed(wire7[(4'h8):(3'h7)])) ?
                      (reg15 ?
                          ($signed((wire13 && (8'ha4))) ?
                              $unsigned($signed(wire12)) : reg17[(2'h2):(1'h0)]) : wire13[(2'h2):(2'h2)]) : $unsigned($unsigned($unsigned($signed(wire10)))));
  assign wire23 = ((wire22 >>> {(^~(wire13 ?
                          wire6 : (7'h40)))}) & $signed(((~$signed(reg18)) ?
                      $signed({(8'hb2)}) : (8'hba))));
  assign wire24 = (($unsigned((wire8 ? $unsigned(wire14) : (wire9 <= wire11))) ?
                      ((~|reg17[(4'h8):(3'h4)]) < (reg17 && (8'h9c))) : reg15[(1'h1):(1'h1)]) == wire7[(1'h1):(1'h1)]);
  assign wire25 = (((reg17 ? wire24[(1'h1):(1'h0)] : (^~(8'hb8))) ?
                      wire7 : $signed($unsigned((wire9 ?
                          reg16 : reg16)))) >> $signed($signed((wire19 ^~ $signed(wire10)))));
  assign wire26 = ((reg17 ?
                      ((8'hb3) ?
                          wire13 : reg16[(2'h2):(2'h2)]) : wire11[(1'h0):(1'h0)]) < reg16);
endmodule
