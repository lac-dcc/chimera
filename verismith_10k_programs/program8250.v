module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire6,
                 wire5,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = ($signed((($signed(wire3) ?
                         $unsigned(wire4) : wire4) <= (wire4 ?
                         wire3 : wire2[(3'h5):(3'h4)]))) ?
                     wire3 : $signed(((|wire2) + (wire1[(1'h1):(1'h1)] ?
                         (wire4 ? wire4 : wire4) : wire3[(4'ha):(1'h1)]))));
  assign wire6 = (wire3 << wire5[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed(((wire1 ? wire0 : wire3) - (&(8'ha7)))))))
        begin
          if ((8'ha6))
            begin
              reg7 <= (|($signed(wire5) ? wire5 : wire1[(2'h2):(2'h2)]));
              reg8 <= $signed(((+wire2[(1'h0):(1'h0)]) ?
                  (|wire2[(4'hb):(3'h7)]) : reg7));
            end
          else
            begin
              reg7 <= ((wire3 ?
                  wire3[(1'h1):(1'h1)] : ((wire1[(3'h4):(3'h4)] ?
                      {wire3, reg7} : (wire5 ?
                          wire6 : wire6)) ~^ (reg8[(2'h3):(1'h0)] << wire2[(4'ha):(2'h3)]))) | ({$signed((wire6 ?
                      wire1 : wire4))} + $unsigned(($unsigned(reg8) ?
                  $signed(wire3) : $unsigned(wire6)))));
              reg8 <= $signed(wire2);
            end
        end
      else
        begin
          reg7 <= ({wire6[(2'h3):(2'h3)], wire6} ?
              (^(~^$signed($unsigned(wire1)))) : $unsigned($unsigned($signed((~wire2)))));
          reg8 <= reg8[(1'h1):(1'h1)];
          reg9 <= wire5;
          reg10 <= wire2[(4'ha):(4'h9)];
        end
      reg11 <= wire1;
    end
  assign wire12 = (~wire5[(4'h9):(2'h2)]);
  assign wire13 = $signed((wire2 ?
                      (~{$unsigned(wire6),
                          (reg9 ? reg10 : reg11)}) : wire6[(3'h7):(2'h3)]));
  assign wire14 = (-((reg11 ?
                          (((8'h9c) >> reg11) ?
                              $signed((8'hb1)) : $signed((8'hb0))) : (8'ha0)) ?
                      reg10 : $signed(((reg7 ? wire1 : wire0) || wire12))));
  assign wire15 = wire6[(4'he):(2'h2)];
  always
    @(posedge clk) begin
      reg16 <= $unsigned(($unsigned($signed($signed(reg8))) ?
          (^~$unsigned(wire4[(1'h1):(1'h0)])) : $unsigned($signed(wire15))));
      reg17 <= $signed($signed((&$signed((~^wire15)))));
      reg18 <= $signed(reg16);
      reg19 <= {$unsigned($unsigned($signed(wire4[(1'h0):(1'h0)]))),
          (|reg16[(4'h8):(2'h2)])};
    end
  assign wire20 = (wire12[(3'h5):(2'h2)] - wire1[(2'h3):(2'h3)]);
  assign wire21 = {wire2[(3'h4):(2'h2)], (+(wire3[(4'h8):(4'h8)] - reg18))};
endmodule
