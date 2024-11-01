module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire21;
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire24,
                 wire23,
                 wire5,
                 wire21,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire5 = (((wire1[(1'h1):(1'h1)] <= (^~(&wire0))) | ($unsigned({(8'ha6),
                             wire3}) ?
                         {$unsigned((8'ha4))} : (^~$unsigned(wire0)))) ?
                     ($unsigned($unsigned((8'hb6))) || wire3) : wire3);
  module6 #() modinst22 (wire21, clk, wire2, wire3, wire1, wire5, wire4);
  assign wire23 = $unsigned(($unsigned((~(wire4 ? wire21 : (8'hb9)))) ?
                      $signed($unsigned($unsigned(wire21))) : (($signed(wire0) == {wire2}) ?
                          ((wire5 ?
                              wire4 : wire0) >> $unsigned(wire4)) : $signed((wire2 ?
                              (8'hbc) : (8'ha0))))));
  assign wire24 = wire4[(4'he):(4'hb)];
  always
    @(posedge clk) begin
      if (($unsigned(wire5) ?
          (wire0[(3'h5):(2'h2)] ?
              wire4 : $signed($unsigned(((8'haf) ?
                  wire3 : wire5)))) : $unsigned((^wire3[(3'h6):(2'h2)]))))
        begin
          reg25 <= $signed((+{$unsigned((|(8'hb9))),
              $unsigned((wire4 >> wire5))}));
          reg26 <= wire23;
        end
      else
        begin
          reg25 <= (($unsigned(($unsigned(wire2) || {wire2,
                  reg25})) != ({reg26[(4'he):(2'h2)]} * wire21[(3'h4):(3'h4)])) ?
              $unsigned(({$signed(wire21)} * $unsigned((^~wire4)))) : wire5[(5'h13):(3'h5)]);
        end
      reg27 <= reg25[(1'h0):(1'h0)];
    end
  assign wire28 = (~^$unsigned((8'ha5)));
  assign wire29 = wire4[(5'h10):(5'h10)];
  assign wire30 = (~&wire21[(4'h9):(3'h4)]);
  assign wire31 = $signed((8'h9f));
  assign wire32 = $unsigned(wire1[(3'h6):(1'h0)]);
  assign wire33 = wire24[(5'h11):(5'h11)];
  assign wire34 = wire33;
  assign wire35 = wire5[(4'hc):(3'h4)];
endmodule

module module6
#(parameter param19 = (~&(-(((&(8'h9e)) ? {(8'hb3)} : ((8'ha8) ? (8'hb7) : (8'ha6))) | ((~|(8'ha5)) - ((7'h44) ? (8'ha4) : (8'hb8)))))), 
parameter param20 = (~^param19))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire12;
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  assign y = {wire18, wire17, wire16, wire15, wire14, wire12, reg13, (1'h0)};
  assign wire12 = {wire11[(4'he):(3'h4)], wire8};
  always
    @(posedge clk) begin
      reg13 <= wire12[(3'h7):(3'h4)];
    end
  assign wire14 = reg13[(1'h0):(1'h0)];
  assign wire15 = (wire14[(3'h5):(3'h5)] ~^ (wire7 <<< {{(wire14 ?
                              wire8 : wire8)}}));
  assign wire16 = $unsigned($unsigned($unsigned((8'ha4))));
  assign wire17 = (wire9 | $signed(wire7));
  assign wire18 = wire14[(3'h5):(2'h3)];
endmodule
