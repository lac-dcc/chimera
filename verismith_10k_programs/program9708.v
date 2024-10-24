module top
#(parameter param27 = (&((^{{(8'ha1)}, ((8'hb7) ? (7'h40) : (8'ha5))}) ? ({(~|(8'hb7)), (&(7'h44))} ~^ {((8'hac) | (7'h43))}) : (((~^(8'hb7)) ^ ((7'h44) ? (8'hbd) : (8'ha9))) >= (((8'hb8) * (7'h42)) ? ((7'h43) & (8'h9f)) : ((7'h44) ? (8'h9d) : (8'h9e)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire26, wire25, wire24, wire22, wire5, reg7, reg6, (1'h0)};
  assign wire5 = wire0[(4'hb):(3'h5)];
  always
    @(posedge clk) begin
      reg6 <= $unsigned((8'had));
      reg7 <= wire4[(4'he):(4'hd)];
    end
  module8 #() modinst23 (.wire10(reg7), .wire11(wire4), .y(wire22), .clk(clk), .wire9(reg6), .wire12(wire1));
  assign wire24 = (((!(|wire4[(3'h4):(2'h2)])) ?
                          $unsigned({(&wire1),
                              wire0[(1'h1):(1'h1)]}) : wire5[(2'h2):(1'h0)]) ?
                      wire4[(3'h4):(2'h3)] : (!(^~(wire2 ?
                          {wire2, (8'h9e)} : (wire1 << wire3)))));
  assign wire25 = reg7[(2'h2):(1'h0)];
  assign wire26 = wire2[(3'h7):(3'h4)];
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  assign y = {wire21,
                 wire14,
                 wire13,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = wire10;
  assign wire14 = $unsigned(wire9[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg15 <= {wire13[(3'h5):(2'h3)], wire13};
      if (({{wire13[(1'h1):(1'h0)]}, (+$unsigned((&wire14)))} ?
          ($signed($signed(wire12[(3'h6):(2'h3)])) >>> $unsigned($unsigned((wire14 ~^ wire14)))) : (reg15[(1'h0):(1'h0)] + {((reg15 <<< wire12) != (reg15 ?
                  wire11 : wire13)),
              $signed((wire11 ? wire13 : wire12))})))
        begin
          reg16 <= (8'h9d);
          reg17 <= $unsigned({$unsigned(((wire14 ?
                  (8'hb4) : reg15) >= (reg15 != (8'hbf)))),
              $signed(wire12[(1'h0):(1'h0)])});
        end
      else
        begin
          reg16 <= wire9[(2'h2):(2'h2)];
          reg17 <= {$unsigned(wire12),
              {$signed($unsigned(wire11)), wire14[(1'h0):(1'h0)]}};
          reg18 <= reg15;
          reg19 <= ((wire11 == $signed((~&(wire10 >= reg17)))) ^ (reg17[(2'h2):(2'h2)] | reg16));
        end
      reg20 <= ({$signed((wire10 ? reg17 : wire12)), reg19} + wire9);
    end
  assign wire21 = {$unsigned(($signed((&(8'hb7))) ? (8'ha3) : wire11)),
                      {(+reg15)}};
endmodule
