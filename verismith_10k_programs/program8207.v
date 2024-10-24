module top
#(parameter param24 = (({(+(&(8'h9f))), {(~(8'hb5))}} ? (!(&(~&(8'hb0)))) : ((((8'h9d) | (8'ha6)) ? {(8'ha6), (8'ha9)} : ((8'ha5) || (8'hb4))) - (^~(^(8'ha4))))) || ((^((~(8'ha1)) ? ((8'hb9) < (8'h9f)) : (&(8'haa)))) ? (~&{(^~(8'hb3))}) : (&(((7'h42) ? (8'hba) : (8'h9d)) ? ((8'ha8) ? (8'hb6) : (7'h41)) : ((8'hbd) ? (8'ha6) : (7'h44)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire2[(2'h2):(1'h0)];
  assign wire5 = wire2;
  assign wire6 = (((~&(wire2[(4'hd):(4'hd)] ? (wire3 <= wire5) : (8'ha3))) ?
                     ((+(^~wire1)) ?
                         (8'ha2) : wire2[(3'h7):(3'h6)]) : wire2[(4'h9):(3'h7)]) <= $signed((wire2 ?
                     {wire4, (wire0 ? wire3 : wire3)} : {wire5[(4'hc):(4'h9)],
                         (wire4 ? wire5 : wire4)})));
  always
    @(posedge clk) begin
      reg7 <= wire4;
      if (wire3)
        begin
          if ((($signed($unsigned(wire1)) <<< $signed(((wire2 ?
                  (8'hb2) : wire5) ?
              $unsigned(reg7) : (wire0 ?
                  wire6 : (8'ha9))))) ^~ wire4[(1'h1):(1'h0)]))
            begin
              reg8 <= {$unsigned($unsigned(reg7)),
                  $unsigned((|reg7[(1'h1):(1'h0)]))};
              reg9 <= wire6;
              reg10 <= (+(+{((+wire1) >= wire2[(4'h8):(4'h8)]),
                  $signed($unsigned(wire6))}));
              reg11 <= (~(reg9[(2'h2):(1'h1)] + wire3));
              reg12 <= (^wire5[(1'h1):(1'h0)]);
            end
          else
            begin
              reg8 <= $unsigned(wire3);
            end
          reg13 <= $signed(($signed((~&(8'ha1))) ~^ (~^$unsigned($signed(reg10)))));
          if (wire5)
            begin
              reg14 <= (+$unsigned((wire0[(2'h3):(2'h3)] ?
                  ({reg12, reg10} ?
                      (reg12 ? reg13 : wire5) : {(8'had), wire5}) : wire1)));
              reg15 <= $signed(wire3);
            end
          else
            begin
              reg14 <= reg11;
              reg15 <= ((^$signed((((7'h43) ?
                  (8'hba) : (8'hbc)) >= $unsigned(wire6)))) * reg15);
              reg16 <= {{wire5[(3'h7):(3'h4)]}};
              reg17 <= reg10;
            end
        end
      else
        begin
          if ((8'ha9))
            begin
              reg8 <= wire2;
            end
          else
            begin
              reg8 <= ((~&$signed($signed(reg11[(1'h0):(1'h0)]))) ^~ ((wire0 ?
                      wire4[(3'h5):(3'h5)] : $signed($signed(reg8))) ?
                  $signed($unsigned((wire4 ?
                      wire0 : wire0))) : ($unsigned($unsigned(wire6)) ?
                      {((7'h43) ? reg17 : (8'hac))} : wire6[(3'h6):(3'h4)])));
              reg9 <= $unsigned(reg12[(1'h0):(1'h0)]);
            end
          if (wire2[(4'hd):(3'h6)])
            begin
              reg10 <= (reg16 || reg10);
              reg11 <= wire5[(4'hc):(1'h1)];
            end
          else
            begin
              reg10 <= reg13[(4'h8):(3'h6)];
              reg11 <= reg7;
              reg12 <= $unsigned((~|reg10[(3'h7):(3'h7)]));
              reg13 <= ((7'h41) ? reg15[(1'h1):(1'h1)] : reg7);
            end
          reg14 <= $signed(($signed((+$signed(wire0))) && reg14[(3'h5):(1'h1)]));
        end
      reg18 <= $unsigned(reg17);
      reg19 <= (reg11[(3'h6):(3'h4)] <= (^~wire1));
      reg20 <= wire3;
    end
  assign wire21 = $unsigned((-(wire1 >> $unsigned($unsigned((7'h43))))));
  assign wire22 = (8'hbf);
  assign wire23 = (~^$signed(wire4[(3'h4):(1'h1)]));
endmodule
