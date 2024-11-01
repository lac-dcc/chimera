module top
#(parameter param18 = ((!(^~(~{(8'hb0), (8'ha1)}))) ? (((^~(8'ha8)) ? (((8'hab) * (8'ha9)) ? ((8'ha1) ? (8'ha8) : (8'hb1)) : (8'hbe)) : {(!(8'h9c)), {(8'hbb), (8'hbe)}}) ? (~(~((8'hb3) ? (8'hbc) : (8'ha0)))) : ((((8'ha0) ? (8'hb7) : (8'hae)) <<< {(8'ha7)}) ? (|{(8'had), (8'hbe)}) : (((8'ha0) ? (8'hbc) : (7'h43)) * (~|(8'ha2))))) : (((((8'haf) ? (8'h9d) : (8'hbb)) < (8'h9d)) <= (~|((8'hbc) ? (8'ha4) : (8'hbf)))) ? (~|{((8'hb4) ? (8'ha8) : (7'h43)), {(7'h44)}}) : ((((8'ha4) >= (8'hbc)) ? (^(8'haa)) : (8'ha9)) || (-(^(8'ha5)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = wire5;
  always
    @(posedge clk) begin
      reg7 <= wire3[(3'h6):(3'h6)];
      if ((^(~|(8'ha5))))
        begin
          reg8 <= $unsigned(($signed($signed(wire6)) ?
              wire1 : (((reg7 <<< wire3) || $unsigned(wire3)) ?
                  (!{wire4, wire5}) : $unsigned($signed(wire0)))));
          if ($unsigned({wire1, $signed((!(~wire0)))}))
            begin
              reg9 <= (&(($signed((8'haa)) ?
                      {{reg8}, wire3} : (reg8 ?
                          reg7[(1'h1):(1'h1)] : $signed(wire3))) ?
                  ($unsigned((!wire0)) ?
                      $unsigned((wire0 ?
                          (8'ha4) : reg7)) : wire2[(3'h4):(1'h1)]) : $signed({{wire3}})));
              reg10 <= wire6;
              reg11 <= wire1[(3'h5):(2'h3)];
              reg12 <= (~^{$signed(((^~(7'h40)) >>> (8'ha8)))});
            end
          else
            begin
              reg9 <= (+((&((8'hbb) != (~^wire2))) ~^ reg7));
              reg10 <= wire5[(4'h8):(2'h3)];
              reg11 <= wire5[(3'h4):(3'h4)];
            end
          reg13 <= (({((wire6 ? reg7 : wire2) ?
                      (~^(8'ha2)) : wire4[(3'h6):(2'h3)])} * {$signed((wire0 - reg9))}) ?
              wire3 : (wire6 != (^~((!reg8) ?
                  (reg9 ? wire3 : reg11) : $signed(wire1)))));
        end
      else
        begin
          reg8 <= (~^$signed((8'hbd)));
          reg9 <= $signed($signed((~{reg12[(3'h6):(3'h4)]})));
          reg10 <= (wire3[(3'h6):(1'h0)] ?
              (wire6[(3'h7):(2'h2)] >= wire3) : ($signed($signed(reg11)) ?
                  wire2[(1'h1):(1'h0)] : $unsigned(wire4[(3'h7):(3'h7)])));
        end
    end
  assign wire14 = reg7[(2'h2):(1'h0)];
  assign wire15 = (7'h42);
  assign wire16 = ($signed(wire6) > (reg10[(3'h5):(1'h1)] ?
                      $unsigned($signed($unsigned((8'hb4)))) : reg8[(4'hf):(4'he)]));
  assign wire17 = wire2;
endmodule
