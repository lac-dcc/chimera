module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire21,
                 wire19,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
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
  assign wire4 = $unsigned(wire1);
  assign wire5 = {$signed(wire2[(1'h0):(1'h0)]), wire1[(3'h7):(1'h0)]};
  assign wire6 = ($signed($unsigned(((wire2 ? wire0 : wire2) ?
                     {wire4} : (wire4 << wire2)))) ^~ {$signed(wire5),
                     (((wire0 ? wire2 : wire1) ^ $unsigned(wire3)) <<< (wire5 ?
                         ((8'hb6) ? wire2 : wire4) : $unsigned(wire3)))});
  always
    @(posedge clk) begin
      if ((^~$unsigned((8'ha9))))
        begin
          reg7 <= ((wire6 ?
              $unsigned($signed({wire0})) : (-($unsigned(wire3) ?
                  (wire6 << wire4) : $signed(wire1)))) == ((^(!(wire3 != wire6))) != (&wire6)));
          reg8 <= (^$signed(wire0));
        end
      else
        begin
          reg7 <= $signed(reg7);
          if ((reg7 ?
              $unsigned($signed((~&(wire4 ?
                  wire6 : (8'hb6))))) : ((-(8'hb8)) >= wire4)))
            begin
              reg8 <= reg8[(1'h0):(1'h0)];
              reg9 <= ($signed((!$unsigned({wire5, (8'hb1)}))) ?
                  reg7[(2'h3):(1'h0)] : ($signed(($unsigned(reg8) ?
                      (reg8 ?
                          wire1 : reg7) : (reg8 <= wire3))) | $signed(($signed((8'h9c)) ?
                      wire2[(1'h0):(1'h0)] : wire6[(4'h9):(1'h0)]))));
            end
          else
            begin
              reg8 <= ($unsigned($signed(wire5[(1'h1):(1'h1)])) | wire2);
              reg9 <= reg7[(2'h2):(2'h2)];
              reg10 <= ($signed((^((^reg7) ?
                  wire1 : (reg9 - wire2)))) ^ $unsigned((^(8'ha0))));
              reg11 <= (8'h9e);
            end
        end
      reg12 <= $signed($unsigned((reg9[(1'h1):(1'h1)] ?
          {wire6, (wire5 ? reg7 : wire2)} : ((&wire4) ~^ ((8'h9c) ?
              wire6 : wire3)))));
      reg13 <= $signed(reg7[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg14 <= (|wire2[(1'h1):(1'h0)]);
      reg15 <= (&$unsigned({$signed(((8'hbc) ? wire3 : (8'h9c)))}));
      reg16 <= {{{$unsigned(reg12[(1'h0):(1'h0)]), {reg8}}, (~^(8'ha2))}};
      reg17 <= $signed($unsigned((wire6[(4'h9):(4'h8)] ?
          (|(wire3 ? reg15 : wire2)) : $unsigned({(7'h43)}))));
      reg18 <= reg15;
    end
  assign wire19 = reg14[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg20 <= reg15[(4'ha):(1'h0)];
    end
  assign wire21 = ((^~$unsigned(((^wire6) >> (~^wire6)))) ?
                      $unsigned(wire5) : (^~$signed((wire2[(2'h3):(1'h0)] & $unsigned((8'hba))))));
endmodule
