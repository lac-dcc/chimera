module top
#(parameter param21 = (~|(({((8'haa) ? (8'hae) : (8'hbb))} ? (8'ha6) : (((8'ha0) ? (8'ha7) : (8'hba)) & (|(8'hb3)))) ^ (^(((8'hbf) ? (8'hb1) : (8'hb9)) == ((8'ha8) ? (8'hb5) : (7'h44)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg5,
                 (1'h0)};
  assign wire4 = (|({$unsigned(wire3[(3'h7):(1'h0)])} || (((&wire0) <= (^wire3)) && (~&(8'hbc)))));
  always
    @(posedge clk) begin
      reg5 <= ($unsigned((^$unsigned($signed(wire3)))) * $signed($unsigned(((wire3 * wire1) ?
          (~^wire3) : $signed((8'hb4))))));
    end
  assign wire6 = wire1;
  assign wire7 = wire6;
  assign wire8 = ((($signed(wire3) >= (~wire2[(4'hb):(2'h3)])) ?
                         reg5 : ((!{wire1}) <= reg5[(3'h5):(2'h2)])) ?
                     wire6[(3'h5):(3'h5)] : {(((wire7 >>> wire0) < (wire4 + wire3)) ?
                             (wire7[(1'h1):(1'h1)] * {wire0,
                                 wire3}) : (~&wire2)),
                         ((+((8'ha4) ? wire4 : wire7)) ?
                             ($unsigned(wire7) ?
                                 (reg5 ?
                                     wire6 : wire7) : (~&wire7)) : $signed($signed(wire2)))});
  assign wire9 = (~&((((^~wire8) - wire8[(1'h0):(1'h0)]) ?
                         (8'hb3) : (-$unsigned(wire2))) ?
                     wire1 : {wire8}));
  always
    @(posedge clk) begin
      reg10 <= ($unsigned(wire2[(3'h5):(3'h4)]) || $signed((8'h9f)));
      reg11 <= $unsigned(((wire8[(2'h3):(2'h2)] <<< {wire0,
          $unsigned((7'h41))}) && wire6));
      if (($unsigned((+(+{reg11}))) ?
          $signed((((-wire4) << $signed(reg11)) ^~ $unsigned(wire1[(3'h5):(2'h2)]))) : {wire1[(5'h15):(4'h8)],
              ((&(wire4 - wire6)) >> (wire7[(4'h9):(3'h6)] ?
                  wire4 : $unsigned(wire2)))}))
        begin
          reg12 <= $signed(((($unsigned(wire9) >>> (wire4 ?
              wire8 : reg10)) != {(-wire7)}) | wire9[(5'h10):(4'he)]));
          reg13 <= $signed((8'ha1));
        end
      else
        begin
          reg12 <= (((~($unsigned(wire4) ? (!reg5) : wire4)) ?
                  ($signed((wire4 >>> (8'ha7))) + $signed({wire1})) : ($unsigned($unsigned(wire3)) ?
                      {$signed(wire2),
                          $unsigned(wire3)} : ($unsigned(wire4) & (8'hbc)))) ?
              wire1 : $signed((~|{$signed(reg13)})));
          reg13 <= $unsigned($unsigned(wire2));
          reg14 <= wire1;
          reg15 <= reg12[(4'hd):(4'ha)];
        end
      reg16 <= wire6[(3'h5):(3'h4)];
      reg17 <= (^~reg13[(2'h3):(1'h1)]);
    end
  assign wire18 = $unsigned($unsigned($unsigned(reg15[(1'h1):(1'h0)])));
  assign wire19 = $unsigned((~reg16[(3'h4):(2'h2)]));
  assign wire20 = wire18;
endmodule
