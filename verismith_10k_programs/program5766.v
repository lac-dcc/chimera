module top
#(parameter param16 = (+({(!((7'h42) ? (8'ha9) : (8'hbf))), ((&(8'ha8)) > (+(8'hbc)))} ? (|(8'hb1)) : (((^(8'h9d)) + ((8'haf) ? (8'haa) : (7'h41))) < {{(8'ha9)}, ((8'haa) << (8'hb9))}))), 
parameter param17 = (param16 << param16))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire15,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ($signed((($unsigned(wire3) ?
                         (~wire2) : wire2[(4'hc):(3'h5)]) & ($unsigned(wire1) >= $unsigned(wire2)))) ?
                     (8'ha6) : wire1[(1'h1):(1'h0)]);
  assign wire5 = wire1[(2'h2):(2'h2)];
  assign wire6 = $unsigned(wire4[(4'hb):(2'h3)]);
  assign wire7 = (~|$unsigned(wire3));
  assign wire8 = ($unsigned((wire1[(1'h1):(1'h0)] << (~|{wire4,
                     wire1}))) ^ $unsigned(wire6));
  always
    @(posedge clk) begin
      if ((wire1[(2'h2):(2'h2)] | $signed($signed(wire3[(3'h6):(2'h3)]))))
        begin
          reg9 <= (wire3[(4'h8):(2'h3)] << ((~|wire1[(1'h1):(1'h0)]) ~^ (|wire1[(1'h0):(1'h0)])));
          reg10 <= reg9;
          reg11 <= (wire4[(1'h1):(1'h0)] ?
              (~|(~|((reg10 ?
                  wire8 : reg10) || (^~wire5)))) : $signed((^~wire6)));
        end
      else
        begin
          reg9 <= $unsigned((wire1[(1'h1):(1'h1)] ?
              ($unsigned((reg10 ? wire7 : wire3)) > ($unsigned(wire3) ?
                  wire6 : reg11[(2'h2):(2'h2)])) : wire6[(4'ha):(3'h7)]));
          reg10 <= $signed((!wire1[(1'h0):(1'h0)]));
          reg11 <= reg11;
          reg12 <= wire8;
          reg13 <= (wire0[(3'h5):(3'h4)] >> (($unsigned($unsigned(reg10)) ?
                  $unsigned($signed(wire0)) : reg10) ?
              reg10[(3'h5):(3'h5)] : wire2));
        end
      reg14 <= (!($signed(wire7) ? {(8'hb1)} : wire5));
    end
  assign wire15 = reg9[(3'h6):(1'h1)];
endmodule
