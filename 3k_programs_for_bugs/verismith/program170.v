module top
#(parameter param20 = (((~|(((8'haa) ? (8'hba) : (8'hb7)) ? ((8'hb9) ? (8'hbf) : (8'haa)) : ((8'ha6) ? (8'ha5) : (7'h41)))) ~^ {{{(8'h9c)}}}) ? (({(8'hae), ((8'haf) - (8'hb4))} ? {(&(8'hb8)), ((8'hb0) ^~ (8'h9f))} : (^((8'hae) | (8'hac)))) ? (((^~(8'hb7)) >> ((8'hb7) ? (8'h9e) : (7'h43))) ? (-((8'hbf) ? (8'hbf) : (8'ha6))) : (((8'ha5) - (8'hb2)) >> (~|(8'hba)))) : (~^(((8'hb8) ? (8'hb4) : (8'ha0)) || ((8'hac) ? (8'hb8) : (8'hab))))) : (~{(&((8'hbd) ? (8'hb5) : (8'hb5))), (((8'hba) ? (8'ha0) : (7'h40)) ^ {(8'hbb), (8'hbd)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire19,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg18,
                 reg17,
                 reg16,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({$signed((~&$unsigned((~&wire3)))), (8'hb7)})
        begin
          reg4 <= $unsigned((&wire0));
          reg5 <= (($signed(($unsigned(wire0) - {wire1})) == $signed(wire2)) ?
              $unsigned($unsigned(($signed((8'hb2)) ?
                  reg4[(4'hb):(4'h9)] : {reg4,
                      wire3}))) : $unsigned($signed(($signed(wire3) * $unsigned(wire1)))));
          reg6 <= wire1;
          reg7 <= (wire0 != wire3);
          reg8 <= (~&{reg4});
        end
      else
        begin
          reg4 <= ((($unsigned(reg8[(1'h1):(1'h0)]) << (!{reg5})) + reg5[(4'hc):(4'h8)]) ?
              wire1 : (($unsigned({wire3}) << {(wire2 ?
                      wire0 : (8'hae))}) >= $unsigned((~^$signed(wire0)))));
          if ($unsigned($unsigned(wire1[(2'h3):(2'h2)])))
            begin
              reg5 <= $signed(wire3);
            end
          else
            begin
              reg5 <= {(^~reg7),
                  ($unsigned(($signed(wire1) < wire3[(3'h4):(1'h1)])) ?
                      (($unsigned(reg7) ^~ reg6) | $unsigned(reg6[(4'h8):(2'h2)])) : reg6)};
              reg6 <= (($signed((^~wire1[(4'h9):(4'h9)])) ?
                  {(~|(wire0 ? reg4 : reg4)),
                      ((reg5 ? reg6 : (8'h9e)) ?
                          (8'hbe) : (wire2 ?
                              wire1 : wire1))} : reg4[(4'hd):(4'hd)]) >> (($unsigned($signed(reg7)) ?
                  wire1[(3'h5):(2'h3)] : (-wire1)) | {$unsigned(reg8[(3'h4):(1'h1)])}));
              reg7 <= reg5[(2'h2):(2'h2)];
              reg8 <= (^~(reg5[(1'h1):(1'h0)] ?
                  $unsigned($signed(wire3[(3'h7):(2'h3)])) : $signed(reg4[(4'ha):(3'h6)])));
            end
        end
      reg9 <= ($unsigned($signed($signed(reg5))) ?
          $unsigned(($unsigned($signed(wire0)) ?
              ($unsigned(wire2) - $signed(wire3)) : ((^~wire3) ?
                  $unsigned(reg8) : reg5[(4'hc):(4'h8)]))) : (wire3 ?
              wire1[(5'h11):(4'he)] : (reg6 << ((^~reg8) ^~ (reg7 ?
                  (8'ha6) : (8'h9c))))));
      reg10 <= $unsigned((wire0 <= ((~^reg7[(1'h1):(1'h0)]) != $signed((~|reg6)))));
    end
  assign wire11 = (($unsigned(reg4) << (^$unsigned((reg9 | reg10)))) ?
                      $unsigned((~|(^(reg6 ?
                          reg6 : reg5)))) : {$unsigned($signed((wire3 ?
                              reg4 : wire3)))});
  assign wire12 = (^~wire2[(1'h1):(1'h1)]);
  assign wire13 = ((wire2 < (reg10 ?
                          reg8[(3'h5):(3'h4)] : {(reg9 ? (8'had) : wire1),
                              {reg4}})) ?
                      $unsigned($unsigned(reg7[(1'h0):(1'h0)])) : reg8[(2'h2):(1'h1)]);
  assign wire14 = $signed($signed($unsigned($signed(reg7[(3'h4):(1'h0)]))));
  assign wire15 = wire14;
  always
    @(posedge clk) begin
      reg16 <= reg10[(3'h6):(1'h1)];
      reg17 <= (8'hba);
      reg18 <= $unsigned(reg5[(4'hf):(3'h4)]);
    end
  assign wire19 = (~^wire1);
endmodule
