module top
#(parameter param28 = (+{{((~|(8'hb8)) ? (+(8'hbc)) : ((7'h41) >> (7'h40)))}}), 
parameter param29 = (((-(~^(~|param28))) << (-(+(!param28)))) << (8'ha8)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire18;
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire18,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  module4 #() modinst19 (wire18, clk, wire0, wire1, wire2, wire3);
  assign wire20 = ($unsigned((|wire18[(1'h0):(1'h0)])) ?
                      (~|{(wire1[(4'he):(4'hc)] ? wire0 : $unsigned(wire3)),
                          (+$signed(wire1))}) : (wire3 ?
                          (&$unsigned((wire1 ?
                              wire1 : wire18))) : $unsigned($signed((wire3 < wire0)))));
  assign wire21 = wire1;
  assign wire22 = wire0[(5'h15):(4'hc)];
  assign wire23 = ({{((&wire21) && (wire0 ^ wire3))}} ?
                      (7'h42) : ($signed(((wire22 ? (8'haf) : wire3) ?
                          wire0[(4'hf):(3'h4)] : {wire1,
                              wire22})) != wire21[(1'h1):(1'h1)]));
  assign wire24 = (|{wire18[(3'h6):(1'h1)]});
  always
    @(posedge clk) begin
      reg25 <= (^~(!(|wire18[(2'h3):(1'h1)])));
      reg26 <= ({wire23[(3'h6):(1'h0)]} <= wire1[(4'h9):(1'h0)]);
      reg27 <= $unsigned($signed(wire22));
    end
endmodule

module module4
#(parameter param17 = (+({(|{(8'hb5), (8'ha8)}), ({(8'hb6)} ? (8'haf) : ((8'hb0) ? (8'ha9) : (8'hb9)))} ^~ (~(^(&(8'hac)))))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  input wire [(2'h2):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= wire8[(5'h15):(1'h1)];
      reg10 <= ({{$signed({wire6, wire7}), $signed($unsigned(wire7))},
          $unsigned(wire6[(1'h1):(1'h1)])} || $unsigned((reg9[(4'hc):(1'h0)] ?
          wire8 : (!$signed(wire7)))));
      reg11 <= reg9;
      reg12 <= (8'hb4);
    end
  assign wire13 = $signed((~^{wire5, $unsigned(reg9[(5'h11):(3'h5)])}));
  assign wire14 = {$unsigned(($unsigned((!(8'hbd))) ?
                          (+reg12[(3'h7):(3'h5)]) : ({wire8} ?
                              $signed((8'hbb)) : ((8'hae) < (8'hac)))))};
  assign wire15 = $unsigned(reg11[(1'h0):(1'h0)]);
  assign wire16 = {(&$unsigned({$unsigned((8'hb2))}))};
endmodule
