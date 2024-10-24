module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed((8'hbf));
  assign wire6 = ({(!$unsigned({wire0, wire3}))} ?
                     $unsigned((($signed(wire1) >> (~wire4)) ~^ (8'ha2))) : ((^~(^{wire4})) ?
                         $unsigned($signed((^~wire3))) : $signed($signed((8'hbb)))));
  assign wire7 = (8'hb6);
  assign wire8 = ($signed($signed(wire1)) ?
                     wire4 : ((&wire7) || ($unsigned($signed(wire6)) ^ $unsigned((|wire7)))));
  assign wire9 = wire1[(2'h3):(2'h2)];
  module10 #() modinst21 (wire20, clk, wire2, wire7, wire8, wire4);
  assign wire22 = $signed({(wire3 ?
                          $unsigned($unsigned(wire4)) : $signed(wire20[(4'hc):(4'ha)])),
                      ($unsigned((wire5 ^~ wire0)) <= (wire3[(1'h1):(1'h1)] > (wire9 ?
                          (7'h41) : (8'ha9))))});
  assign wire23 = ((8'hb7) >>> wire3);
  assign wire24 = ($unsigned($signed((-wire8))) ?
                      $unsigned((~|{wire5,
                          (wire8 >= wire23)})) : ($signed($unsigned(wire20[(2'h2):(2'h2)])) ?
                          (~^(wire3[(1'h0):(1'h0)] ?
                              $unsigned(wire3) : (wire20 != wire6))) : $signed(wire0)));
  assign wire25 = wire4;
  assign wire26 = wire22;
  assign wire27 = (-((&$unsigned(wire22[(4'hc):(1'h0)])) + (wire24 >>> wire22)));
  assign wire28 = $unsigned(wire20[(2'h2):(2'h2)]);
  assign wire29 = (wire2[(4'hb):(1'h1)] || $signed((wire23 ?
                      $signed(wire5) : $unsigned(wire7))));
endmodule

module module10
#(parameter param19 = {({((+(8'haa)) ? (!(8'h9e)) : {(8'hb1), (8'hba)})} <= (((~|(8'ha3)) >> (!(8'had))) ^ ((~&(8'hab)) + (^(8'hbd)))))})
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire [(4'h9):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire15;
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire18, wire15, reg17, reg16, (1'h0)};
  assign wire15 = ($signed((8'hba)) && $unsigned(wire12[(4'h8):(1'h0)]));
  always
    @(posedge clk) begin
      reg16 <= (8'hb9);
    end
  always
    @(posedge clk) begin
      reg17 <= ($unsigned(reg16[(5'h10):(2'h3)]) ?
          ({$signed($unsigned(wire14))} ?
              (wire15[(4'h8):(3'h6)] ?
                  {{wire15},
                      $signed(wire15)} : $unsigned($signed((7'h40)))) : {$unsigned((~^wire14))}) : wire15);
    end
  assign wire18 = $unsigned((~(($signed(wire12) >> wire13) & (|wire12))));
endmodule
