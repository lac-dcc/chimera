module top
#(parameter param15 = (~^(({(8'hbd), {(8'ha6), (8'hb1)}} ? (((8'hab) != (8'hbc)) ? (&(8'hb4)) : ((8'h9f) ? (8'hba) : (8'ha9))) : (((8'ha0) | (8'ha0)) >= (^(8'hbd)))) <<< {({(8'hb2), (8'hb5)} ~^ {(8'hbc)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (~^$signed(wire1[(4'hf):(4'he)]));
  always
    @(posedge clk) begin
      reg6 <= (~&wire0[(3'h6):(3'h6)]);
      reg7 <= {($signed($unsigned({wire3,
              wire2})) & $unsigned((!$unsigned((7'h43)))))};
    end
  assign wire8 = ((reg7 ?
                     wire0 : wire4[(3'h4):(3'h4)]) ~^ $signed((reg6 & $unsigned((wire1 ^~ (8'hb5))))));
  assign wire9 = $unsigned(($signed(((reg6 ^~ wire1) ^~ wire1[(2'h2):(1'h0)])) << $signed({$unsigned((8'ha3)),
                     wire4})));
  assign wire10 = (8'hb1);
  assign wire11 = $unsigned({reg7[(5'h10):(4'hc)],
                      $signed(wire5[(2'h3):(2'h2)])});
  assign wire12 = (^~(~&(|(~(~&wire2)))));
  assign wire13 = $unsigned((-((~^wire9) ?
                      (wire2[(3'h6):(2'h3)] + (!(8'hba))) : (reg6 == wire8[(2'h2):(2'h2)]))));
  assign wire14 = ($signed($unsigned(wire2[(5'h12):(3'h4)])) ?
                      {wire3[(4'hc):(2'h3)]} : {(wire5[(2'h3):(1'h0)] <= ((reg6 == wire1) ?
                              ((8'h9d) << wire1) : $signed((8'ha8)))),
                          ((~^$signed(wire0)) + wire5[(2'h3):(2'h3)])});
endmodule
