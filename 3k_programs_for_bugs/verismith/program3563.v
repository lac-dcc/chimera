module top
#(parameter param19 = (((!(8'h9c)) ? {(!(7'h40)), (((7'h42) >= (7'h41)) * (&(8'hb3)))} : (+{((8'hab) <= (8'h9c)), (~(8'hb2))})) & (({((8'ha9) && (8'h9e)), ((7'h41) ? (8'ha9) : (8'ha1))} << ({(7'h44)} ? ((8'ha8) ? (8'hbe) : (8'had)) : ((8'ha0) ? (8'hb0) : (8'ha4)))) || (-((~|(8'ha7)) ? ((8'hb4) - (8'hbc)) : (8'hb9))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = (^~wire3);
  assign wire5 = {(wire1[(4'hb):(3'h5)] + wire2), wire3};
  assign wire6 = {wire2[(2'h2):(1'h1)],
                     (^~$signed(((wire1 ?
                         wire3 : wire2) ^~ (wire3 * (8'ha3)))))};
  assign wire7 = $unsigned($unsigned(wire0));
  assign wire8 = $signed(wire4[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      if ((wire6[(4'he):(3'h6)] != wire7))
        begin
          reg9 <= wire4[(5'h10):(1'h1)];
          reg10 <= {$unsigned((wire3[(3'h4):(2'h2)] ?
                  ({wire0} ? {wire4, wire1} : wire3) : (^{wire7}))),
              ($unsigned($signed((wire5 && wire3))) ? wire0 : wire6)};
          reg11 <= $unsigned((&{(+$unsigned(reg9))}));
          reg12 <= (8'hb6);
        end
      else
        begin
          reg9 <= (wire8[(4'h8):(3'h7)] * ($signed({$signed((8'hbb))}) || (|wire4)));
          reg10 <= $signed($signed((reg10 - $unsigned($unsigned(wire5)))));
        end
      reg13 <= reg9;
      reg14 <= {$signed(($unsigned((reg13 ? wire3 : (8'hb1))) ?
              wire3 : wire3))};
      reg15 <= wire6[(3'h4):(3'h4)];
    end
  assign wire16 = ({{($signed(wire5) ?
                              (wire7 ? wire6 : reg12) : (reg13 <= reg12))},
                      $signed(wire5)} != $unsigned(($unsigned(reg15[(5'h10):(3'h6)]) ?
                      (8'ha6) : $signed($signed(reg9)))));
  assign wire17 = $signed(({(^~$unsigned(reg11)),
                      (-reg14)} >>> $unsigned((&{reg14}))));
  assign wire18 = ((wire2[(1'h1):(1'h0)] ?
                      wire16[(3'h7):(2'h2)] : $unsigned(wire0[(1'h1):(1'h1)])) >= reg11);
endmodule
