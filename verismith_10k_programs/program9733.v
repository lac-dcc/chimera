module top
#(parameter param16 = (&(((((8'ha1) ? (8'hb6) : (8'ha2)) ? ((8'hbc) ^ (8'h9f)) : {(8'hb1)}) ? (&(~(8'hab))) : (((8'h9f) || (8'hbc)) << (+(7'h44)))) ? {((~&(8'haa)) ? {(8'hac), (8'hb4)} : ((8'ha3) ? (8'haa) : (8'h9e))), {((8'hbe) >>> (8'haa)), {(7'h40)}}} : ((^~{(8'hb2), (7'h42)}) ? ((^(8'h9d)) ? {(8'hb1), (8'ha7)} : ((8'hab) ? (8'hbc) : (8'ha2))) : (((8'ha5) ? (8'hb4) : (8'hb8)) ? ((8'hb8) ? (8'h9e) : (8'ha1)) : (~|(8'hae)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire15,
                 wire12,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (wire3[(1'h1):(1'h0)] ?
                     ($signed($unsigned((7'h41))) ?
                         wire0 : wire1[(3'h4):(2'h2)]) : $signed($signed(wire3[(4'h9):(4'h8)])));
  assign wire5 = {$unsigned((8'hae)),
                     (wire2[(4'he):(4'he)] <= wire3[(3'h5):(1'h0)])};
  assign wire6 = wire2[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if (($signed((~$unsigned((-wire4)))) ?
          {$unsigned({(wire4 ^~ wire1),
                  (wire0 ? wire0 : wire6)})} : {((~|(~wire5)) ?
                  $unsigned(wire4[(1'h0):(1'h0)]) : $unsigned(wire5[(1'h0):(1'h0)])),
              ($unsigned((wire3 ? wire6 : wire0)) >> (^wire1[(3'h4):(2'h3)]))}))
        begin
          reg7 <= $unsigned(wire4);
        end
      else
        begin
          reg7 <= wire1;
          reg8 <= wire3[(2'h3):(1'h0)];
          reg9 <= $unsigned(wire4[(4'hd):(2'h2)]);
          if (wire1)
            begin
              reg10 <= wire0[(3'h4):(2'h3)];
            end
          else
            begin
              reg10 <= wire1[(3'h5):(2'h3)];
              reg11 <= $unsigned($signed($signed($signed(reg9))));
            end
        end
    end
  assign wire12 = $unsigned({((~&{wire4}) ?
                          $unsigned($unsigned(reg8)) : $signed($signed(reg10))),
                      (+wire2)});
  always
    @(posedge clk) begin
      reg13 <= wire4;
      reg14 <= ((+$unsigned(reg11[(3'h5):(3'h5)])) || wire5[(1'h1):(1'h0)]);
    end
  assign wire15 = reg10;
endmodule
