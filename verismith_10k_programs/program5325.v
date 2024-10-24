module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire32;
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire10,
                 wire11,
                 wire32,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {(^~(^~$unsigned($unsigned((7'h42)))))};
      reg6 <= $unsigned($unsigned({((~&wire3) ? $signed(wire0) : wire1),
          wire4[(3'h4):(2'h2)]}));
      reg7 <= (wire0 >> wire3);
      reg8 <= (~&$signed($unsigned($signed({wire4, wire3}))));
      reg9 <= (&wire4[(4'he):(4'hd)]);
    end
  assign wire10 = wire2[(2'h3):(2'h3)];
  assign wire11 = $signed((8'hb0));
  module12 #() modinst33 (wire32, clk, wire3, reg6, wire2, wire11);
  assign wire34 = wire2[(3'h6):(2'h2)];
  assign wire35 = (8'ha8);
  assign wire36 = $signed($signed(reg9));
endmodule

module module12
#(parameter param30 = ((8'hb0) ? (((((8'hb4) ? (8'ha1) : (8'ha7)) | (&(8'ha4))) >= (~|((8'haa) ? (8'hb8) : (8'h9e)))) ^~ {{((8'hab) ^~ (8'ha2))}}) : (&(((&(8'hbd)) - ((8'hb8) ? (8'hbe) : (8'ha1))) ? ({(7'h42), (8'haa)} - (~^(8'hb4))) : (&((8'h9f) == (8'hb8)))))), 
parameter param31 = (param30 ? ((((!param30) == (+param30)) ? param30 : (((8'hb3) && param30) ? param30 : param30)) ? ((param30 ? (8'h9e) : (param30 <= param30)) ? ((param30 * (8'hbd)) >>> (param30 ? (8'ha9) : param30)) : {param30, (~|param30)}) : ((param30 >= (param30 != param30)) ? param30 : (param30 ? (param30 << (8'hb4)) : param30))) : (~^(param30 ? param30 : {(~param30), {param30, param30}}))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire17 = (wire15[(4'hd):(4'h8)] & wire14);
  assign wire18 = wire13;
  assign wire19 = ((8'hac) + wire17);
  assign wire20 = {$unsigned(($signed(wire19) != (^~(wire18 ?
                          wire17 : wire17)))),
                      wire19[(2'h3):(2'h2)]};
  always
    @(posedge clk) begin
      reg21 <= wire14;
      reg22 <= $signed($signed((^~$unsigned({wire19}))));
      reg23 <= wire17[(2'h2):(2'h2)];
      reg24 <= wire15;
      reg25 <= reg23[(2'h3):(2'h2)];
    end
  assign wire26 = ((((8'hae) ?
                          $unsigned((wire16 >> wire16)) : $unsigned((~wire15))) > wire15) ?
                      $signed((wire17[(3'h6):(2'h3)] + (&wire15))) : reg22[(2'h2):(2'h2)]);
  assign wire27 = ($unsigned(wire26) ?
                      $unsigned($unsigned((8'ha8))) : (({{wire15}} ?
                          ((wire26 ^~ wire18) ?
                              $signed((8'had)) : {reg22,
                                  wire13}) : $unsigned(wire17)) <<< $signed((-reg25))));
  assign wire28 = ((~|($unsigned((~&reg24)) ?
                      $unsigned((reg24 ?
                          reg25 : wire26)) : (~$unsigned(wire17)))) ^~ $unsigned($signed($unsigned(reg23[(1'h0):(1'h0)]))));
  assign wire29 = $unsigned((~|reg22[(1'h0):(1'h0)]));
endmodule
