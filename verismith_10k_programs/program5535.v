module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = (((8'hba) <= {{(8'hba), $signed(wire1)},
                         wire0[(2'h3):(2'h2)]}) ?
                     $unsigned({wire0,
                         {(wire1 ? wire3 : wire0),
                             (wire2 ? wire0 : wire2)}}) : (8'hae));
  assign wire5 = wire3;
  assign wire6 = wire2;
  assign wire7 = $signed((wire6[(2'h2):(2'h2)] > (^(((8'ha9) <<< (8'haa)) | (wire2 == wire3)))));
  assign wire8 = $signed(((~^(wire5[(3'h6):(1'h1)] ?
                     (wire5 >> wire4) : (wire1 & (8'ha4)))) >= {{((8'hb0) < wire7)}}));
  assign wire9 = {{(!(^(wire2 >> (8'ha1))))}};
  assign wire10 = ($unsigned($signed($unsigned((-wire1)))) ?
                      ((~^(wire0[(2'h2):(1'h0)] <= wire4)) ?
                          $unsigned($signed((wire4 ?
                              wire1 : wire3))) : wire5) : ((~|$unsigned(((8'had) ?
                              wire8 : wire7))) ?
                          wire1[(4'hc):(4'h9)] : (((wire7 ^ (7'h42)) ^ (wire5 ?
                              wire5 : wire0)) & wire3)));
  always
    @(posedge clk) begin
      reg11 <= wire8;
      reg12 <= (+wire0[(2'h2):(2'h2)]);
      if ((wire1[(5'h14):(4'ha)] ? wire7[(4'h8):(1'h1)] : wire0[(1'h1):(1'h1)]))
        begin
          reg13 <= (|$signed($unsigned(((wire0 ? wire4 : wire7) ?
              $unsigned(reg11) : (wire9 ? (8'hb7) : (8'h9e))))));
        end
      else
        begin
          reg13 <= {(+$unsigned((+wire3))), $signed(wire3[(3'h6):(1'h1)])};
          reg14 <= wire0[(2'h2):(1'h1)];
        end
    end
  assign wire15 = (!(!(~&$unsigned($signed(wire7)))));
  assign wire16 = $unsigned((reg14[(4'hc):(3'h4)] * wire5[(3'h6):(3'h4)]));
endmodule
