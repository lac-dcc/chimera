module top
#(parameter param30 = {(((((8'h9e) ? (8'hb1) : (8'hbf)) * {(8'hbd)}) >> ({(8'haf), (8'hac)} ? ((8'ha3) ? (8'had) : (8'had)) : ((8'hac) != (8'ha6)))) ? ((~(^~(8'hb5))) ? (((7'h43) ^~ (8'had)) != (-(8'hb9))) : (((8'hbd) < (8'hbc)) ^ (-(8'hbc)))) : (-(((8'hbf) ? (8'hbb) : (8'hab)) || ((8'ha5) ? (8'hb7) : (8'ha7)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire22,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
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
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire4 = (+wire2[(1'h0):(1'h0)]);
  assign wire5 = (wire0 ? wire3 : wire0[(4'h9):(3'h5)]);
  assign wire6 = ($unsigned(wire3[(5'h11):(4'ha)]) >= wire4[(2'h3):(1'h0)]);
  assign wire7 = $signed((((&(wire0 == (8'hb8))) && ((wire5 ? wire3 : wire3) ?
                         $unsigned(wire2) : (wire0 ? wire5 : wire1))) ?
                     (({(8'ha7), wire0} ?
                             $signed(wire1) : (wire0 ? wire1 : wire4)) ?
                         wire2[(2'h3):(2'h2)] : $signed($signed(wire0))) : $signed({(wire2 ?
                             wire4 : wire5),
                         wire2[(2'h3):(2'h3)]})));
  assign wire8 = $signed((wire0[(4'h9):(3'h6)] >= (!$signed((wire2 ~^ wire3)))));
  assign wire9 = wire2[(2'h2):(2'h2)];
  assign wire10 = (wire3 ^ $unsigned((((wire0 ? wire4 : (8'had)) ?
                          wire1[(1'h0):(1'h0)] : $unsigned(wire0)) ?
                      (wire9[(2'h2):(1'h1)] & (wire5 ?
                          wire9 : wire4)) : wire4[(3'h5):(1'h0)])));
  assign wire11 = (~^(8'h9f));
  assign wire12 = $signed($unsigned(wire4));
  assign wire13 = (!wire4[(2'h2):(2'h2)]);
  assign wire14 = (~|({((~(8'h9c)) >>> (wire10 ^~ wire5))} ?
                      (~^(wire2[(2'h2):(1'h1)] ?
                          $signed(wire11) : wire7)) : {(|wire8[(4'h8):(3'h4)]),
                          $unsigned((-wire8))}));
  assign wire15 = {wire6};
  assign wire16 = $signed((wire8[(3'h5):(3'h5)] < ($unsigned({wire10}) ^ ($signed((8'hbf)) ?
                      $unsigned(wire6) : (!(8'hb3))))));
  assign wire17 = {wire15,
                      $signed($unsigned({wire4[(3'h4):(1'h1)],
                          $unsigned(wire6)}))};
  assign wire18 = $unsigned($unsigned((wire9 ?
                      $signed(wire8[(3'h4):(3'h4)]) : (^wire8))));
  assign wire19 = (wire17[(3'h5):(1'h0)] * ($unsigned($signed(wire14)) <= wire17[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg20 <= ((wire5 <= (-($unsigned(wire13) ?
          (wire5 ^~ wire19) : (-wire9)))) - wire0);
      reg21 <= $signed(($signed(wire4) + ($unsigned(wire3[(2'h2):(2'h2)]) ~^ $signed((wire10 ?
          wire4 : wire19)))));
    end
  assign wire22 = ({(({wire5, wire12} ?
                              $unsigned(reg21) : (wire8 <<< (8'ha4))) ?
                          wire11 : wire15[(4'hd):(4'h9)]),
                      wire13} < wire0);
  always
    @(posedge clk) begin
      reg23 <= $signed((~^wire9));
      reg24 <= wire8[(4'hc):(2'h3)];
      reg25 <= (8'ha4);
      reg26 <= (|$unsigned(wire1));
    end
  assign wire27 = ((~|($unsigned($unsigned(wire3)) & wire8)) ?
                      (~&$unsigned(((wire7 ?
                          reg26 : wire15) < $unsigned(wire4)))) : ((^~wire2) ?
                          wire19[(4'hf):(4'hc)] : (((|wire18) >= (wire12 || reg26)) ?
                              $unsigned($unsigned(reg23)) : wire4[(2'h2):(2'h2)])));
  assign wire28 = (!$unsigned($unsigned((wire19 ?
                      (wire15 * reg20) : $signed(reg20)))));
  assign wire29 = (($unsigned(((wire1 || wire1) ^ $signed((8'ha8)))) * (-$unsigned($signed(wire16)))) << wire27);
endmodule
