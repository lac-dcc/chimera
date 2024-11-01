module top
#(parameter param17 = ((((-{(8'hb1)}) >> (((8'ha7) - (7'h42)) ? (!(8'hbb)) : (8'hb4))) ? (({(8'ha8), (8'hbf)} ? (8'hb2) : {(8'hae), (8'hbc)}) > ((|(8'ha7)) * ((8'hb0) != (8'hbf)))) : (~&(~|((7'h40) | (8'ha4))))) ? (((-((8'hbf) ? (8'ha1) : (8'ha9))) - {{(8'hb5), (8'hbb)}, (8'hb9)}) ? ((|(-(8'hbc))) ? (((7'h42) ? (8'h9f) : (8'hbd)) || ((8'hb7) ? (8'ha1) : (7'h42))) : ({(8'h9e)} ~^ (-(8'ha8)))) : ((((8'hb4) >>> (8'hb8)) >>> ((8'hb1) != (8'ha1))) ? (((8'hb9) ? (8'hb4) : (8'hb0)) ~^ {(8'hb1), (8'hbf)}) : (((8'h9f) ? (8'hb3) : (8'hb2)) >>> ((7'h43) * (8'ha3))))) : (-({(8'ha3)} | (8'hb7)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire16,
                 wire13,
                 wire12,
                 wire11,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = $unsigned($signed(((+wire1) ?
                     wire2 : ($unsigned(wire2) ^ wire3[(5'h10):(3'h7)]))));
  assign wire5 = $signed((-$unsigned($signed({wire4}))));
  assign wire6 = (wire5[(3'h4):(3'h4)] || wire2);
  assign wire7 = $unsigned((wire0[(1'h1):(1'h1)] ?
                     (-(wire2[(2'h3):(2'h2)] - wire2[(4'h8):(4'h8)])) : wire2[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ((-wire2))
        begin
          reg8 <= $unsigned(((wire0[(2'h2):(1'h0)] * {(~&wire7),
              {wire5, wire6}}) < ((~&wire0[(2'h2):(1'h0)]) ?
              wire7[(1'h0):(1'h0)] : wire2)));
          reg9 <= wire7[(4'he):(4'hc)];
        end
      else
        begin
          reg8 <= (~|$unsigned($unsigned($signed(reg9[(2'h3):(2'h3)]))));
          reg9 <= $signed((!$signed(($signed(wire0) ?
              ((7'h43) ^~ wire0) : $signed(wire3)))));
          reg10 <= (wire6 ?
              (((wire6 ? wire0 : $signed(wire4)) ?
                  ($signed(wire4) - reg9[(4'hd):(4'hb)]) : reg9) < (wire7[(4'hd):(4'h8)] ?
                  $unsigned(wire2[(1'h0):(1'h0)]) : wire4[(4'h8):(3'h4)])) : (&(wire5[(3'h7):(3'h6)] ?
                  $signed(((7'h44) ?
                      wire2 : (8'ha2))) : wire7[(4'hb):(3'h5)])));
        end
    end
  assign wire11 = $signed(reg10[(1'h1):(1'h0)]);
  assign wire12 = $unsigned($unsigned(wire2[(1'h0):(1'h0)]));
  assign wire13 = (((8'hbe) << {(reg9[(4'hb):(4'h8)] * (wire7 ?
                              wire4 : (8'hb4)))}) ?
                      ({reg10[(1'h1):(1'h0)]} ^ $unsigned($signed((^~reg9)))) : wire2[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg14 <= $signed(reg9);
      reg15 <= reg14;
    end
  assign wire16 = (wire7 == wire5);
endmodule
