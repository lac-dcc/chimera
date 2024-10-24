module top
#(parameter param31 = (^(-(({(8'haf)} ^ (^~(8'hab))) | ({(8'hbf), (8'had)} ^~ ((8'had) != (8'ha1)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  assign y = {wire29,
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
                 (1'h0)};
  assign wire4 = ((~^wire3[(4'hb):(3'h4)]) ?
                     wire1[(2'h3):(2'h3)] : (~(-(~|(wire3 >>> wire3)))));
  assign wire5 = $signed($signed((wire0[(4'ha):(4'h8)] > wire0)));
  assign wire6 = $signed((($unsigned(wire4[(2'h2):(2'h2)]) && (wire2 ?
                         $signed(wire1) : $unsigned((8'hb0)))) ?
                     (+wire3[(3'h6):(2'h2)]) : (|(8'hbe))));
  assign wire7 = $unsigned(wire4[(3'h7):(2'h2)]);
  assign wire8 = wire5[(3'h4):(3'h4)];
  assign wire9 = (wire1[(4'hc):(4'hb)] == {(~&wire3), wire5});
  assign wire10 = {$signed(wire1[(2'h2):(1'h1)])};
  assign wire11 = ((&$unsigned(wire1)) ?
                      ((({wire2} ? {wire1, wire10} : {wire3}) ?
                              $unsigned((wire10 >> wire0)) : $unsigned((^(8'ha5)))) ?
                          (~&$unsigned(wire10[(2'h3):(1'h1)])) : wire5) : $unsigned((8'hbc)));
  assign wire12 = $unsigned(wire6[(4'ha):(2'h2)]);
  assign wire13 = $unsigned(((~|(wire12[(2'h3):(1'h1)] ?
                      wire8 : $unsigned(wire3))) && $signed(wire3[(2'h3):(1'h0)])));
  module14 #() modinst30 (wire29, clk, wire4, wire10, wire13, wire6);
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire21,
                 wire20,
                 wire19,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = $signed(wire18[(3'h4):(1'h1)]);
  assign wire20 = {$unsigned(wire18[(4'hf):(4'he)])};
  assign wire21 = ($unsigned((|(wire20[(4'h9):(3'h5)] >>> (7'h41)))) ~^ wire18[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg22 <= (wire16 ?
          wire19[(5'h13):(5'h12)] : ($signed($unsigned($signed((8'hb8)))) >> (wire20 ?
              wire17[(4'h9):(1'h0)] : wire21[(5'h10):(1'h0)])));
      reg23 <= (((wire18 ^~ (~|((8'ha9) ^~ wire21))) ?
          {$unsigned(wire18[(5'h14):(3'h6)]),
              ((8'hbe) | wire18)} : (wire17[(3'h6):(2'h2)] >>> $unsigned({(7'h41),
              reg22}))) == ((($signed(wire20) > wire17[(3'h6):(2'h3)]) - (|wire15[(3'h6):(1'h0)])) | $signed((((7'h43) ?
          wire19 : wire21) & {wire16}))));
      reg24 <= wire18[(3'h6):(3'h4)];
      reg25 <= {reg24[(1'h0):(1'h0)], $signed($unsigned(reg23[(4'hc):(3'h5)]))};
      reg26 <= ($unsigned((!reg23[(1'h1):(1'h1)])) <<< $unsigned(reg23[(4'h9):(1'h1)]));
    end
  assign wire27 = $unsigned($signed(reg22));
  assign wire28 = {($signed(wire15[(2'h3):(2'h2)]) ?
                          reg26[(3'h6):(2'h2)] : {(~&(wire19 + wire17))})};
endmodule
