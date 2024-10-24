module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire5,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (wire3[(1'h0):(1'h0)] ?
                     ((!$unsigned(wire2[(3'h4):(2'h2)])) ?
                         (-((wire2 >= wire4) ?
                             wire2 : (wire2 & wire3))) : (wire1 ?
                             {$unsigned(wire4)} : wire0[(4'hb):(4'h9)])) : {(|$unsigned((wire4 ~^ wire2))),
                         $signed(($unsigned((8'hbc)) ?
                             wire3 : ((8'hb2) * wire0)))});
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire1[(3'h7):(2'h3)]);
      if (wire1[(4'hc):(2'h3)])
        begin
          reg7 <= wire3[(1'h0):(1'h0)];
          reg8 <= (wire1 ?
              $unsigned($signed({{wire0},
                  wire4})) : $signed($unsigned(($signed(wire0) != (wire2 ?
                  wire3 : reg7)))));
          reg9 <= (wire4 ?
              $signed((8'hb9)) : ((((wire4 ~^ wire5) ?
                      reg6 : ((7'h41) > reg7)) + ($unsigned(wire3) ?
                      wire1 : $unsigned((8'hb5)))) ?
                  (^reg6[(4'hd):(2'h3)]) : reg6[(4'hc):(3'h6)]));
          if (reg9[(3'h6):(1'h0)])
            begin
              reg10 <= reg8;
              reg11 <= (((~|wire1) * (((wire0 & reg7) ?
                          (+wire3) : $unsigned(wire5)) ?
                      reg8 : $unsigned(wire3[(2'h2):(1'h1)]))) ?
                  (wire5[(2'h2):(2'h2)] > wire5) : (((^~{(8'hb2)}) ?
                          (reg7 && reg6) : (|((8'ha6) ? reg6 : wire2))) ?
                      (&wire2[(2'h3):(1'h0)]) : $unsigned($signed(reg7))));
            end
          else
            begin
              reg10 <= (~^wire2);
              reg11 <= wire3;
            end
        end
      else
        begin
          reg7 <= (~&(~^$unsigned((8'haa))));
          reg8 <= ((~&wire5[(2'h2):(1'h0)]) ?
              (|(~reg7)) : (&$unsigned(($unsigned((8'hb0)) ?
                  (reg11 + wire5) : $signed(reg9)))));
          if ({(~&wire3), $unsigned(reg9[(2'h3):(1'h0)])})
            begin
              reg9 <= (~|reg11[(3'h4):(2'h2)]);
              reg10 <= reg6[(4'hd):(4'h9)];
            end
          else
            begin
              reg9 <= $signed(wire3);
            end
        end
    end
  assign wire12 = $unsigned(wire3[(1'h0):(1'h0)]);
  assign wire13 = (((8'ha1) ?
                          ($unsigned((wire0 ?
                              wire12 : reg8)) * (((7'h42) >>> reg11) ^ wire3[(1'h0):(1'h0)])) : $unsigned(wire2)) ?
                      ((reg6 ?
                          {reg7} : ($unsigned(wire0) ?
                              $signed((8'hb7)) : $signed(wire3))) & (+(^~reg10))) : (^(8'hb7)));
  assign wire14 = (8'hac);
  assign wire15 = wire13;
  assign wire16 = ($unsigned($unsigned((~(|reg9)))) >> wire12);
  assign wire17 = wire15;
  assign wire18 = reg8[(2'h3):(1'h1)];
  assign wire19 = $signed((|(~^(8'haf))));
  assign wire20 = wire12[(4'h9):(3'h4)];
  assign wire21 = (+(($unsigned(wire4[(2'h2):(1'h1)]) ?
                          ($unsigned(reg10) ?
                              wire16[(1'h1):(1'h1)] : (8'hb5)) : $unsigned((reg6 ?
                              wire20 : wire16))) ?
                      (wire5 ?
                          (((8'hbf) || wire1) <= $unsigned(wire3)) : (!wire13)) : $unsigned(reg6[(4'hc):(1'h0)])));
  assign wire22 = reg11;
  assign wire23 = (+$unsigned($unsigned(wire22)));
endmodule
