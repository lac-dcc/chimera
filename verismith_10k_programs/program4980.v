module top
#(parameter param15 = (((8'hb8) ? ((((8'hb7) - (8'hbc)) ? (^~(8'hbd)) : {(8'hae)}) ? ((~^(8'haa)) ? ((8'h9c) ? (8'hbb) : (8'ha9)) : ((8'ha4) ? (8'had) : (8'had))) : (((8'hb5) && (8'hae)) ? ((7'h40) ? (8'hb6) : (8'hb3)) : ((8'haf) * (8'hb9)))) : ({{(8'hb7), (8'haf)}} - (((8'hb8) > (8'hbd)) ? (^(8'hb5)) : {(8'ha9)}))) ? ((((~(8'hb4)) ~^ (7'h40)) ? (((8'had) - (8'hb6)) < ((8'hab) ? (7'h40) : (8'hb9))) : ((+(8'hab)) ? ((8'hb6) >> (8'hac)) : ((7'h40) + (8'haa)))) < {(~&{(8'hb9)})}) : ((^(((8'h9c) ~^ (8'h9e)) * ((8'ha3) ? (8'ha0) : (8'hac)))) ? {(((8'ha6) ? (8'hb3) : (8'hb6)) >> {(8'hb5), (8'hb2)}), (((7'h44) ? (8'hab) : (8'hb5)) ? {(8'haa)} : ((8'hbe) ^~ (8'had)))} : (((|(8'ha4)) ~^ (~&(8'haa))) ? (~^{(8'ha4), (8'hb8)}) : ((|(8'ha3)) >>> (~(8'hac)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire6;
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire6,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ((wire4[(5'h12):(3'h7)] ^~ (~^($signed(wire0) >= (wire3 ^~ (7'h43))))) && wire4[(5'h15):(1'h0)]);
    end
  assign wire6 = (($unsigned((8'hb0)) ?
                     reg5[(2'h3):(2'h3)] : (($unsigned(reg5) ?
                         $signed(reg5) : wire1[(1'h1):(1'h1)]) && (~^((8'hb5) ?
                         wire2 : (8'hb4))))) < (((^~wire3[(4'hf):(3'h5)]) >>> {wire2[(4'h9):(3'h6)]}) + $unsigned(((wire0 ?
                     wire3 : reg5) >>> {wire2, wire2}))));
  always
    @(posedge clk) begin
      reg7 <= $signed((8'ha3));
      reg8 <= $unsigned({wire0, (|wire3[(4'hd):(4'ha)])});
      reg9 <= wire2;
      if (((-reg5[(4'h8):(3'h5)]) && $signed($signed(reg9))))
        begin
          reg10 <= (((($unsigned(reg9) ? wire3 : reg9) ^~ ((reg7 ?
              wire6 : reg8) ~^ $signed((8'haf)))) + (8'ha6)) << (&($unsigned(wire6[(1'h0):(1'h0)]) ?
              reg5 : ($signed((8'ha8)) - wire1[(4'h8):(1'h1)]))));
          reg11 <= reg5;
        end
      else
        begin
          reg10 <= (reg11 >>> $unsigned(reg5[(2'h3):(1'h0)]));
          reg11 <= {(($unsigned((reg11 == wire0)) ~^ (~^$signed(wire6))) ^ $signed(reg8[(1'h1):(1'h0)]))};
          reg12 <= reg9;
        end
    end
  assign wire13 = (&wire1[(3'h6):(2'h3)]);
  assign wire14 = $signed((({(!reg10)} ?
                          ((reg8 >> reg5) == {wire0,
                              reg7}) : {$unsigned(reg5)}) ?
                      (((reg7 ? wire13 : reg10) - wire0) ?
                          (wire1 >> reg9[(3'h7):(3'h5)]) : reg12) : ($unsigned(wire1[(1'h1):(1'h0)]) + $unsigned({wire4,
                          reg12}))));
endmodule
