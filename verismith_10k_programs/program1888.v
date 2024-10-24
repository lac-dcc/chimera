module top
#(parameter param24 = (^(8'hbb)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire10,
                 wire6,
                 wire5,
                 reg23,
                 reg22,
                 reg21,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = ($unsigned($signed((|(wire1 ? wire0 : (8'hae))))) ?
                     $signed(wire4) : $unsigned(wire0));
  assign wire6 = ((((wire1[(1'h1):(1'h1)] ? wire0 : wire2[(5'h13):(4'h8)]) ?
                         $unsigned(wire0) : $unsigned(wire1[(3'h5):(3'h4)])) ^ $unsigned($signed((wire5 ?
                         wire1 : wire0)))) ?
                     wire2[(1'h0):(1'h0)] : (-$signed(wire2)));
  always
    @(posedge clk) begin
      reg7 <= $unsigned((~&(({wire0, wire5} ?
              wire4[(4'he):(4'h8)] : $unsigned(wire0)) ?
          $unsigned($unsigned(wire6)) : $unsigned($signed(wire6)))));
      reg8 <= wire2[(4'hc):(1'h0)];
      reg9 <= (((8'hb2) ?
          reg7[(1'h0):(1'h0)] : wire0) >= wire5[(5'h11):(5'h10)]);
    end
  assign wire10 = ((~^($unsigned((wire0 >= wire2)) && (reg9 ?
                      $signed((7'h43)) : wire0[(1'h0):(1'h0)]))) && reg8[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg11 <= $signed(wire3);
      if ((~^{reg8}))
        begin
          reg12 <= $unsigned(({wire6,
              wire6[(4'hf):(4'hf)]} && $unsigned(($unsigned(wire1) - {wire6}))));
        end
      else
        begin
          reg12 <= (($signed(((8'ha9) ?
                  reg12 : $signed((8'hbe)))) * $signed(($unsigned((7'h43)) ?
                  $unsigned(reg8) : (wire5 ? (7'h40) : reg7)))) ?
              (wire2 ?
                  (^~((~^wire3) ?
                      $unsigned((8'hb7)) : (~^(8'hb2)))) : ({((8'hab) ^~ wire4)} ?
                      reg12 : $signed($unsigned(wire1)))) : wire2[(2'h3):(1'h0)]);
          reg13 <= $signed((^((((7'h42) ?
              reg9 : (8'ha7)) * (wire2 ^ (8'ha9))) >> ({wire10} ?
              (8'ha9) : reg12))));
          reg14 <= $unsigned($signed((~^wire0[(1'h1):(1'h0)])));
        end
      if ($signed(reg13))
        begin
          reg15 <= $signed(wire10);
          reg16 <= $unsigned($unsigned(((7'h41) - wire3[(2'h3):(2'h2)])));
        end
      else
        begin
          reg15 <= reg7;
          reg16 <= $unsigned(((reg11[(1'h0):(1'h0)] ?
                  (~|(+wire3)) : reg9[(4'h8):(2'h3)]) ?
              reg8 : (~reg12[(3'h6):(1'h1)])));
          reg17 <= ($unsigned($unsigned(((~&(8'hba)) >>> (reg12 | (8'h9c))))) || reg15);
          reg18 <= ($unsigned((($unsigned(reg8) ?
              wire2[(2'h2):(2'h2)] : reg12) ~^ ((reg12 ? reg17 : reg13) ?
              $signed(reg13) : wire2[(1'h1):(1'h0)]))) * (~|{$unsigned($signed((8'hb0)))}));
        end
    end
  assign wire19 = $signed(($unsigned({(reg11 >> wire6),
                      (reg7 ? reg7 : reg8)}) || (&(^~$signed(wire5)))));
  assign wire20 = (reg8 ?
                      (reg13[(3'h6):(2'h2)] ?
                          reg12[(4'h9):(3'h4)] : $unsigned($unsigned((reg17 ?
                              wire2 : wire6)))) : (({(wire10 ? wire5 : reg7),
                              (reg13 ? wire10 : wire0)} ?
                          (^(reg14 >>> reg17)) : reg8[(2'h3):(1'h1)]) | (wire2 ?
                          ((reg8 ? wire19 : (8'ha2)) || (wire3 ?
                              wire2 : wire1)) : ((8'ha9) | (wire3 != reg17)))));
  always
    @(posedge clk) begin
      if (reg13)
        begin
          reg21 <= wire6;
        end
      else
        begin
          reg21 <= (&reg13[(3'h5):(1'h1)]);
          reg22 <= (~|$signed($signed(wire1)));
          reg23 <= {(wire0[(3'h6):(2'h3)] ?
                  $unsigned((8'hb2)) : (wire1[(2'h2):(1'h1)] ?
                      (wire0 - {reg15, wire0}) : (~&(~^reg12)))),
              wire20};
        end
    end
endmodule
