module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire22,
                 wire21,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg20,
                 reg12,
                 (1'h0)};
  assign wire4 = (|wire3);
  assign wire5 = (wire0[(2'h2):(1'h0)] <= $signed($signed($signed($unsigned(wire2)))));
  assign wire6 = (~|wire0[(1'h1):(1'h1)]);
  assign wire7 = $signed((wire4[(4'hc):(4'hb)] ?
                     wire3[(3'h6):(1'h1)] : $unsigned(($unsigned(wire5) | wire4[(4'ha):(2'h2)]))));
  assign wire8 = (+$signed(((!(^~wire7)) ?
                     (|wire6) : ($signed(wire7) ?
                         ((8'ha2) ? wire6 : wire2) : (wire2 | wire0)))));
  assign wire9 = ({wire5[(3'h5):(3'h4)]} ?
                     wire2[(2'h2):(1'h0)] : ((wire8 ?
                         $unsigned((wire1 < (8'ha1))) : {wire3[(3'h7):(3'h6)]}) ~^ ($signed($signed(wire6)) || ($signed(wire4) > wire0[(4'hd):(2'h2)]))));
  assign wire10 = wire6[(1'h0):(1'h0)];
  assign wire11 = ((wire10 ?
                      $signed((wire4[(1'h0):(1'h0)] ?
                          wire3[(3'h6):(3'h4)] : (8'hb5))) : wire1) <<< {wire5,
                      (wire2 >= (wire10 < (wire0 ? wire3 : wire7)))});
  always
    @(posedge clk) begin
      reg12 <= wire11[(4'hf):(4'he)];
    end
  assign wire13 = ($unsigned(wire10[(1'h0):(1'h0)]) ? wire10 : wire8);
  assign wire14 = ($unsigned($unsigned($unsigned((wire13 ? wire2 : wire5)))) ?
                      ($unsigned({(-wire5), {wire8, wire3}}) ?
                          (+{$unsigned(wire4)}) : ($signed($unsigned(wire6)) && wire9[(3'h4):(2'h3)])) : $unsigned(wire3[(3'h6):(2'h2)]));
  assign wire15 = {{reg12[(2'h2):(2'h2)]},
                      (($unsigned((wire13 ? wire2 : wire13)) ?
                              $unsigned(wire3) : reg12[(4'hd):(4'hb)]) ?
                          wire8[(5'h12):(3'h4)] : wire14)};
  assign wire16 = $unsigned((~&$signed((wire4 >>> {(8'haa)}))));
  assign wire17 = (8'h9e);
  assign wire18 = wire1;
  assign wire19 = ($signed(($signed(((8'hbf) ? wire9 : wire10)) || ({wire1,
                          wire9} ~^ $unsigned(wire17)))) ?
                      wire7[(1'h0):(1'h0)] : reg12);
  always
    @(posedge clk) begin
      reg20 <= (wire15 ?
          $signed(wire11) : $signed($signed((~^(wire6 ? wire10 : wire7)))));
    end
  assign wire21 = wire2[(3'h4):(2'h2)];
  assign wire22 = wire7;
  always
    @(posedge clk) begin
      reg23 <= (^~wire17);
      reg24 <= $signed(wire0);
      reg25 <= ((|$unsigned(reg20)) - wire13[(4'ha):(4'h8)]);
      reg26 <= ((^~((!$signed(wire8)) <<< $signed($unsigned(wire4)))) << wire22);
    end
  assign wire27 = (wire3 ? {$signed($unsigned($signed((8'hb2))))} : (8'ha3));
  assign wire28 = $signed((wire21[(4'hd):(4'h9)] ?
                      $signed((!(wire18 ~^ wire18))) : {reg12[(4'ha):(2'h2)],
                          $signed($unsigned(wire13))}));
endmodule
