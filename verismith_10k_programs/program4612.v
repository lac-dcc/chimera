module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg9,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((($signed(wire1) >= ($signed(wire0) ?
          (-wire3) : $unsigned(wire1))) < ($unsigned($signed((8'h9d))) && (wire3 ?
          wire3[(3'h4):(1'h0)] : wire2[(5'h12):(3'h7)]))) == ((^((~&wire3) ?
          {wire2} : ((8'hb8) >>> (8'ha6)))) < (~^wire1[(1'h1):(1'h1)])));
    end
  assign wire5 = (&$unsigned($signed($unsigned({wire1}))));
  assign wire6 = $signed((($signed((^~wire3)) ?
                     (~^wire2[(4'he):(3'h7)]) : (!(wire3 <= (8'ha0)))) == ($unsigned(wire3) ?
                     (^~wire5[(2'h2):(1'h1)]) : wire1[(2'h3):(2'h2)])));
  assign wire7 = reg4;
  assign wire8 = (^~(&reg4));
  always
    @(posedge clk) begin
      reg9 <= wire6[(1'h1):(1'h1)];
    end
  assign wire10 = $signed((~&$unsigned(($signed(wire0) ?
                      wire3[(4'hd):(2'h2)] : wire3))));
  assign wire11 = ((wire8[(2'h3):(1'h1)] << ((~&reg9) < $signed(wire7[(1'h1):(1'h1)]))) > (~(&((~^(8'hb7)) ?
                      (wire5 ? wire8 : reg4) : (+reg9)))));
  assign wire12 = ($signed((8'ha8)) | ($signed(wire2[(5'h10):(3'h6)]) * ((((8'hb4) <= wire11) << wire2[(5'h12):(4'ha)]) ?
                      $signed(((8'h9f) > wire11)) : ($signed(reg4) ?
                          wire0 : $unsigned((8'ha7))))));
  assign wire13 = (($unsigned(wire1) && ((8'hb8) ?
                      $unsigned($signed(wire11)) : wire2[(4'hd):(3'h5)])) * wire0);
  assign wire14 = wire0;
  assign wire15 = {($signed(($unsigned(wire5) ?
                              (wire7 ?
                                  wire0 : wire10) : wire1[(3'h5):(1'h0)])) ?
                          (((reg4 ? wire11 : wire10) ?
                                  wire12[(1'h1):(1'h1)] : $unsigned((8'hbf))) ?
                              ({wire10, wire11} * wire10) : {(^(8'had)),
                                  {wire10}}) : {(wire1[(3'h5):(3'h4)] ?
                                  ((7'h44) ? wire8 : (8'hab)) : (wire7 ?
                                      wire10 : wire0)),
                              $signed(wire12[(2'h2):(1'h1)])})};
  assign wire16 = wire13;
  assign wire17 = reg4;
  assign wire18 = $signed(($unsigned(wire10) >> reg4[(4'hf):(4'hc)]));
endmodule
