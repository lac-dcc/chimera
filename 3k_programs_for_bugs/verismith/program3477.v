module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(wire2[(4'ha):(2'h3)]);
    end
  assign wire5 = ($unsigned(wire0) || ($signed(wire3) ?
                     (wire0[(3'h6):(3'h4)] * $signed($unsigned(wire1))) : $signed(wire1)));
  assign wire6 = (~^((((wire3 <<< wire2) ? wire0 : $signed((8'haa))) ?
                     wire5 : ((8'hb8) > reg4[(2'h3):(2'h3)])) - (~((+wire5) ?
                     $signed(wire5) : ((8'hb7) ? wire3 : (7'h41))))));
  assign wire7 = wire0;
  assign wire8 = wire1[(1'h1):(1'h1)];
  assign wire9 = $unsigned(reg4);
  always
    @(posedge clk) begin
      reg10 <= ((wire8[(3'h7):(2'h2)] >> {wire8[(4'h8):(2'h2)],
              $signed($unsigned(reg4))}) ?
          ({(~|(~|wire9)), (+$signed(wire5))} ?
              $signed(wire9[(1'h1):(1'h1)]) : wire1[(3'h4):(2'h3)]) : (~^(($unsigned(wire1) ?
                  wire1 : $unsigned(wire8)) ?
              $signed($unsigned(wire3)) : wire7)));
      reg11 <= {(wire1 ?
              ($signed((wire7 ? wire2 : wire9)) ?
                  (wire1 ^ (wire1 >>> (8'ha4))) : wire3[(4'hd):(4'hd)]) : reg4)};
      reg12 <= (reg11 ?
          ((({wire9, wire5} ? (wire1 - wire6) : $signed(wire1)) || {(~&wire1),
              (wire0 * wire0)}) + wire0) : $signed(((|reg11) ?
              (wire7[(2'h3):(2'h3)] < {wire3, wire1}) : wire7)));
      reg13 <= ($signed($signed((8'hb8))) ?
          {((wire6[(3'h7):(2'h3)] || $signed(reg11)) | $unsigned($unsigned(wire3)))} : (^(((~reg10) ?
              (reg11 ? reg12 : reg10) : (wire0 ? wire2 : (7'h42))) >= {(wire0 ?
                  reg10 : (8'ha4)),
              $signed(reg4)})));
      reg14 <= {wire0[(1'h0):(1'h0)], wire8[(4'h8):(3'h7)]};
    end
endmodule
