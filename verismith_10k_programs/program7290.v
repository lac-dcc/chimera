module top
#(parameter param29 = (^(((!((8'hb3) ? (8'hbe) : (8'ha5))) << ((^~(8'ha6)) ? ((8'ha2) == (8'ha0)) : (8'hbc))) ? (8'had) : {(~|(~&(8'ha9)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire27;
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  assign y = {wire4,
                 wire6,
                 wire7,
                 wire12,
                 wire13,
                 wire27,
                 reg5,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire4 = wire3[(4'hc):(4'hc)];
  always
    @(posedge clk) begin
      reg5 <= (-((($unsigned(wire3) ? wire4 : ((8'hbd) ~^ wire4)) ?
          (^~wire0[(4'hf):(4'h8)]) : ((-wire3) ^~ (wire2 ?
              wire2 : wire4))) << wire3));
    end
  assign wire6 = (+(~|(~^((~^wire3) == (reg5 && wire4)))));
  assign wire7 = wire1[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg8 <= ((^~(((wire2 & (7'h41)) ? reg5[(4'h8):(3'h6)] : (wire4 > wire7)) ?
              $unsigned(wire4[(1'h1):(1'h0)]) : wire4[(3'h4):(3'h4)])) ?
          (wire7[(4'hc):(1'h1)] ?
              $unsigned($signed((wire1 ?
                  wire1 : wire1))) : ((&((8'h9f) > wire1)) ?
                  ($signed(wire6) ?
                      $signed((8'hb7)) : (wire2 < (8'ha2))) : $signed($signed(wire6)))) : ((^~wire4[(3'h7):(3'h5)]) ?
              $signed($unsigned((!wire7))) : (($unsigned(wire4) <<< $signed(wire0)) >>> $unsigned((wire2 ?
                  wire2 : wire2)))));
      reg9 <= (reg8 ?
          (((wire3[(4'hb):(3'h6)] >= (8'hb1)) ^ ((wire6 ?
              wire7 : wire4) <= {reg8})) + (-wire2[(3'h7):(3'h5)])) : wire3);
      reg10 <= ($unsigned((wire6 >>> reg8[(1'h1):(1'h1)])) == {wire6,
          wire2[(3'h7):(1'h1)]});
      reg11 <= (reg9 ?
          ($signed(wire2[(4'h8):(3'h7)]) >= ($signed(reg5) <= wire6[(4'hd):(3'h6)])) : (reg5 ?
              (~&wire0) : ($unsigned((&reg8)) ?
                  {$unsigned(reg5)} : $unsigned(reg10[(4'ha):(3'h6)]))));
    end
  assign wire12 = ({$unsigned((^wire7[(1'h1):(1'h0)]))} ?
                      ({((wire6 - wire6) ? (~^wire6) : {reg9}),
                          $unsigned(wire0[(4'h8):(3'h5)])} >>> ({wire6} ?
                          reg8 : reg8)) : $unsigned($unsigned($unsigned((8'ha9)))));
  assign wire13 = (((^~$signed($unsigned(reg9))) > ((((7'h40) || wire3) ?
                          $signed((8'hb4)) : (reg9 & wire6)) ?
                      wire0 : ((reg5 ? reg9 : wire7) >= (reg5 ?
                          (8'hb4) : reg8)))) ^~ $signed({(wire2[(2'h2):(2'h2)] > (reg9 ?
                          wire7 : reg9))}));
  module14 #() modinst28 (.wire17(reg8), .wire18(wire2), .clk(clk), .wire16(reg10), .wire15(reg9), .y(wire27));
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
                 reg21,
                 (1'h0)};
  assign wire19 = $unsigned(wire18);
  assign wire20 = ($signed((~$unsigned((wire18 <<< wire16)))) >= wire17);
  always
    @(posedge clk) begin
      reg21 <= (&wire18);
    end
  assign wire22 = reg21[(3'h7):(1'h1)];
  assign wire23 = $signed($unsigned($signed(wire15)));
  assign wire24 = ($unsigned(($unsigned($unsigned(wire15)) != wire22[(2'h2):(1'h1)])) < ((8'haf) + ({(wire17 & wire18)} + (wire22 ?
                      $unsigned(wire22) : wire18))));
  assign wire25 = wire22[(2'h3):(2'h3)];
  assign wire26 = (^wire23[(3'h4):(3'h4)]);
endmodule
