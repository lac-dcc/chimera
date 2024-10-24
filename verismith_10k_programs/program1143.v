module top
#(parameter param17 = (~(((((8'ha6) + (8'hb9)) > ((8'hb0) ^~ (8'h9e))) >= ({(8'h9d), (8'h9e)} ^ (8'hbe))) ? (((8'h9e) << ((8'ha4) ? (8'hab) : (8'haa))) << ((^(8'ha5)) == {(8'had)})) : ((^(~&(8'hbb))) >= (&((8'ha5) || (7'h40)))))), 
parameter param18 = ({((!{param17}) == (((8'hb5) ? (7'h40) : (8'hac)) || {(8'hb6)})), (&{param17, (-param17)})} >> (((!(~^param17)) >= ({param17, param17} ? param17 : (param17 || param17))) ? ({(param17 != param17), param17} * (8'hb1)) : {(param17 ? (param17 ? param17 : (8'h9e)) : (+param17)), {(param17 != param17), ((8'ha4) ? param17 : param17)}})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned(wire2));
  assign wire6 = {((wire4 - $signed(wire3)) > wire1[(3'h7):(3'h7)]),
                     $unsigned($signed((!wire2[(4'he):(1'h0)])))};
  assign wire7 = ($signed($signed((^(wire4 < wire5)))) ?
                     $signed({$signed($unsigned((8'ha9)))}) : (wire2 && $unsigned(wire5[(1'h0):(1'h0)])));
  assign wire8 = ($unsigned(wire3) ? wire1 : (~^wire6[(3'h7):(1'h0)]));
  always
    @(posedge clk) begin
      reg9 <= (wire0[(5'h14):(3'h6)] ?
          (-wire5) : $unsigned(wire5[(2'h2):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg10 <= $signed({{wire3}});
      reg11 <= $unsigned($unsigned(reg9[(3'h5):(2'h2)]));
      reg12 <= ($unsigned(reg9) ? wire7 : (wire6 ? wire0 : {reg11}));
      reg13 <= wire5;
    end
  assign wire14 = {$unsigned(((~wire4[(3'h4):(1'h0)]) ?
                          reg13 : (&$signed(wire0)))),
                      wire7[(4'hf):(3'h4)]};
  assign wire15 = wire5[(2'h2):(1'h1)];
  assign wire16 = ($signed(wire14) <<< ({(reg9 ?
                          $unsigned(reg10) : $unsigned(wire6))} > ((&$signed(wire2)) ?
                      {{reg12},
                          (wire14 ?
                              (8'hb6) : wire15)} : (~^reg10[(3'h6):(3'h5)]))));
endmodule
