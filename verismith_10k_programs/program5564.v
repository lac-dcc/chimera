module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg26,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = ($unsigned((+(wire2 ? (^~wire0) : (~|(7'h40))))) ?
                     wire0 : {wire2[(3'h5):(3'h5)],
                         $signed(((wire3 ? wire2 : wire0) ?
                             $signed(wire1) : $unsigned(wire4)))});
  assign wire6 = ((~|(-wire3[(5'h15):(3'h6)])) && wire4[(1'h1):(1'h1)]);
  assign wire7 = $signed($unsigned((($signed(wire1) ?
                     (wire3 << (8'hb0)) : wire1) << wire5)));
  assign wire8 = (^~(({wire6[(2'h3):(2'h3)]} || wire1) ?
                     wire7[(2'h2):(1'h1)] : $signed(wire2[(2'h2):(1'h1)])));
  assign wire9 = wire3;
  assign wire10 = ((({$unsigned((8'ha1)), (wire2 ? wire3 : (8'hbf))} ?
                          $signed((-wire1)) : wire3) ?
                      $unsigned(($unsigned(wire4) ?
                          {wire1,
                              (8'hb0)} : $unsigned(wire1))) : (8'hac)) - $signed($unsigned({wire9,
                      wire9[(3'h6):(2'h2)]})));
  assign wire11 = $unsigned((~wire5));
  assign wire12 = wire6[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg13 <= $signed($signed($signed(wire2[(4'h8):(3'h4)])));
      reg14 <= $unsigned((8'ha3));
      reg15 <= wire3[(4'hf):(3'h5)];
      reg16 <= (~|(-({((8'hb9) ? wire12 : wire8), $signed(wire6)} + {wire1,
          wire2[(3'h6):(2'h2)]})));
    end
  assign wire17 = {$signed(($unsigned(reg15[(4'h8):(3'h6)]) ?
                          (((8'ha6) > reg16) ?
                              $unsigned((8'hb3)) : (wire1 ?
                                  wire11 : (8'ha1))) : wire8)),
                      wire3[(3'h4):(2'h3)]};
  assign wire18 = {($unsigned($signed((wire4 > wire8))) > reg13[(5'h12):(4'ha)])};
  assign wire19 = wire6;
  assign wire20 = ((8'ha3) && ($signed(reg15[(3'h7):(3'h7)]) <<< {(~$unsigned(wire3)),
                      (|wire1)}));
  assign wire21 = reg15[(4'h8):(3'h5)];
  assign wire22 = (((8'hac) ~^ (wire21 ?
                      $signed($signed((8'ha6))) : wire9[(2'h2):(2'h2)])) ^ wire21[(3'h5):(1'h1)]);
  assign wire23 = ({$unsigned((^~wire8[(4'he):(3'h7)]))} == wire18[(4'hd):(4'hb)]);
  assign wire24 = $signed(wire9);
  assign wire25 = ($unsigned((^~$unsigned((wire8 ? wire7 : wire6)))) ?
                      ((reg14[(3'h6):(1'h0)] ? (7'h44) : $unsigned((~^reg15))) ?
                          $unsigned($unsigned(wire20[(4'h8):(3'h6)])) : reg15) : (8'ha1));
  always
    @(posedge clk) begin
      reg26 <= wire11[(3'h5):(3'h5)];
    end
endmodule
