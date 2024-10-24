module top
#(parameter param38 = (~^(~(+{((8'hb8) ? (8'ha4) : (8'h9c)), ((7'h43) ? (8'hb2) : (8'hb5))}))), 
parameter param39 = (-((param38 ? param38 : ((8'ha6) << param38)) ? (((param38 ? param38 : param38) - (~(8'hb8))) ? (!((8'h9d) ? param38 : param38)) : ((~^param38) & param38)) : {{(param38 ? param38 : param38)}, param38})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire32;
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  assign y = {wire37,
                 wire4,
                 wire5,
                 wire6,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire32,
                 reg36,
                 reg35,
                 reg34,
                 reg7,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire4 = (8'haa);
  assign wire5 = (wire1[(5'h12):(1'h1)] ?
                     $unsigned(wire1) : $unsigned($signed($unsigned(wire3[(1'h0):(1'h0)]))));
  assign wire6 = wire0[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= wire1[(4'hc):(4'ha)];
    end
  assign wire8 = ($signed(((~{wire5, wire2}) ?
                     $signed(((8'hb6) || wire2)) : ((&wire6) && wire2[(2'h3):(2'h2)]))) <= (wire1[(1'h1):(1'h1)] != wire4[(4'ha):(4'h9)]));
  assign wire9 = ((wire3 ~^ $signed((~^wire0))) > ((~((~wire5) ?
                         wire3[(3'h5):(2'h3)] : (^~wire2))) ?
                     (($unsigned((8'hac)) >>> ((7'h42) ^~ wire8)) ~^ reg7) : ($signed(wire3[(3'h5):(1'h0)]) << (^(wire1 ?
                         wire6 : (8'ha2))))));
  assign wire10 = $signed(($signed(((wire8 >> wire5) ?
                          wire2 : $unsigned(wire3))) ?
                      $signed(wire5) : (wire6 < ($unsigned(wire4) <= wire5[(5'h14):(1'h0)]))));
  assign wire11 = $unsigned($unsigned((~^{reg7, wire8[(3'h7):(1'h1)]})));
  assign wire12 = wire1[(3'h5):(3'h5)];
  assign wire13 = {wire6[(1'h0):(1'h0)]};
  assign wire14 = wire6;
  assign wire15 = (-wire9);
  always
    @(posedge clk) begin
      reg16 <= $signed((({wire12[(4'hd):(3'h4)], {(8'hae)}} ?
              ((^~wire11) - wire9[(2'h2):(1'h0)]) : (8'hb6)) ?
          ((wire6 < (7'h44)) == wire5[(3'h4):(3'h4)]) : ((wire12[(4'he):(3'h4)] >> wire12) ?
              ((~&wire14) ?
                  wire14[(5'h11):(4'h9)] : (wire4 >> wire9)) : $unsigned((wire12 ?
                  wire2 : wire10)))));
      reg17 <= {wire4};
    end
  module18 #() modinst33 (.wire19(wire1), .wire20(wire15), .clk(clk), .wire22(reg17), .y(wire32), .wire21(wire14));
  always
    @(posedge clk) begin
      reg34 <= ((^~{$signed((-wire13))}) ?
          (^{(&(~|(8'hae))), (!$signed(wire12))}) : (wire2 ?
              wire8 : $signed(({(7'h44)} ? (8'hb8) : (wire1 | reg7)))));
      reg35 <= $signed(reg17);
      reg36 <= (wire15 ? {wire6} : wire5);
    end
  assign wire37 = (((wire11 && ((-reg35) <= (reg16 ? wire15 : wire4))) ?
                      (~wire12[(4'h8):(1'h0)]) : $unsigned({(~reg34),
                          (reg17 >= wire10)})) >> $unsigned(((8'hbb) <<< $signed($signed(wire12)))));
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire22;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire [(4'h9):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 (1'h0)};
  assign wire23 = ((~(-$unsigned((-wire20)))) & wire20);
  assign wire24 = $signed(wire22);
  assign wire25 = wire20;
  assign wire26 = $signed(((~|(wire25[(4'h9):(1'h1)] - wire24[(3'h4):(3'h4)])) ?
                      wire22 : wire22[(2'h3):(1'h0)]));
  assign wire27 = ({wire19,
                      (((~wire26) - wire20[(3'h4):(3'h4)]) ?
                          (!(wire25 ?
                              wire25 : wire21)) : wire20[(1'h0):(1'h0)])} <= $signed((+$unsigned(((8'ha1) >>> wire24)))));
  assign wire28 = ($signed((~^(wire27 ? $unsigned((8'hab)) : wire25))) ?
                      wire19[(3'h5):(1'h1)] : ($signed(wire26) <<< wire24));
  assign wire29 = (($unsigned($unsigned(wire23[(3'h4):(1'h1)])) >>> wire20[(1'h0):(1'h0)]) ?
                      wire22 : {(~^wire21), wire26});
  assign wire30 = (wire21[(1'h0):(1'h0)] & $signed($signed(({wire27} ?
                      (wire23 ? wire25 : wire25) : wire26[(2'h2):(1'h1)]))));
  assign wire31 = (wire20[(2'h3):(1'h0)] <= $signed(wire30));
endmodule
