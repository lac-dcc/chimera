module top
#(parameter param19 = (((((8'hb8) & (-(8'hb4))) >>> (((8'ha3) != (8'ha7)) < (~&(8'ha8)))) ^ (7'h44)) ? (((((8'ha0) ^~ (8'ha2)) ? {(8'ha4)} : ((7'h43) >= (8'hab))) ? (((8'hb5) >> (8'hbb)) ? ((8'ha0) != (8'hbf)) : ((8'hb1) ? (8'ha2) : (8'hbd))) : (8'hba)) ~^ ((((8'ha5) ? (8'haa) : (7'h43)) ? ((8'hb3) ? (8'hb0) : (8'hb0)) : ((8'ha5) < (8'hb0))) >>> ((|(8'hb9)) & ((8'hba) ? (7'h44) : (8'hbe))))) : (~&(-({(8'had)} ^ ((8'hb9) ? (8'haf) : (8'ha9)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire18,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = ($signed((^(8'h9e))) ?
                     ($signed(wire3[(4'hd):(4'h9)]) > (~&(wire3 <= ((8'h9f) << wire3)))) : $signed(wire0));
  assign wire5 = (wire3[(1'h1):(1'h1)] ?
                     wire2 : ($signed({(&(8'ha5)), $signed(wire1)}) ?
                         $unsigned((wire4[(3'h7):(1'h1)] ?
                             wire3 : (wire1 | wire3))) : (wire1 ?
                             ((wire3 != wire4) ?
                                 $signed(wire4) : wire3[(1'h1):(1'h0)]) : {$unsigned(wire2)})));
  assign wire6 = (wire4 ? $unsigned($signed(wire0)) : wire4);
  always
    @(posedge clk) begin
      reg7 <= (wire5 ?
          wire0[(4'h9):(1'h1)] : $unsigned(($unsigned(wire6[(3'h6):(3'h4)]) != wire0[(4'h9):(1'h0)])));
      reg8 <= $unsigned($unsigned((^~(~^$unsigned(wire0)))));
      reg9 <= wire4[(2'h3):(1'h1)];
      if (($unsigned((((^reg9) ? {wire3} : (wire0 + wire6)) ?
          $unsigned((wire1 ?
              wire1 : wire2)) : wire4[(1'h1):(1'h1)])) - (($unsigned($unsigned(reg8)) * $unsigned($unsigned(wire4))) && wire6)))
        begin
          reg10 <= (^{($signed({reg7}) ?
                  wire6 : ((|(8'hb6)) ? $unsigned(reg8) : reg7))});
          reg11 <= (((^~(wire3 ^~ $signed((8'hb6)))) ?
              reg9[(2'h2):(1'h0)] : $unsigned((!(wire3 <= reg8)))) + ($unsigned($signed(wire2[(3'h4):(1'h0)])) ?
              {(reg7 ? wire0 : (wire6 ? wire0 : wire1)),
                  (wire0 ?
                      (^wire2) : wire5[(4'hb):(4'h8)])} : wire6[(3'h5):(1'h1)]));
          if (((+reg10[(3'h4):(1'h0)]) << wire6[(3'h6):(2'h3)]))
            begin
              reg12 <= (~&$signed(reg10[(3'h5):(2'h3)]));
              reg13 <= wire5;
              reg14 <= (8'ha9);
              reg15 <= reg12;
              reg16 <= $signed({$unsigned((-{reg7, reg8})), reg14});
            end
          else
            begin
              reg12 <= wire6;
              reg13 <= {(~|reg9[(4'hc):(3'h6)]), $unsigned(wire4)};
              reg14 <= (+$signed($unsigned(wire1)));
              reg15 <= ($unsigned((~&{(wire1 << reg12)})) && ($unsigned(((7'h41) ?
                  wire6[(4'hf):(1'h0)] : (reg13 ?
                      reg14 : wire6))) <= $unsigned(wire0[(5'h12):(4'he)])));
            end
          reg17 <= $unsigned($signed($signed($signed($unsigned(wire6)))));
        end
      else
        begin
          reg10 <= $signed($signed(($unsigned((reg13 != wire0)) ?
              reg13[(4'h8):(4'h8)] : $signed($unsigned(reg8)))));
          if (wire2)
            begin
              reg11 <= reg16;
              reg12 <= (reg14 ?
                  $signed((reg15 ?
                      (~&$signed(reg14)) : (!(~|reg15)))) : ($unsigned({wire3}) ?
                      $unsigned((&{reg11})) : wire4));
            end
          else
            begin
              reg11 <= $unsigned(reg8[(4'hb):(3'h5)]);
              reg12 <= $signed(reg13);
              reg13 <= wire5[(4'h8):(3'h5)];
            end
        end
    end
  assign wire18 = ($unsigned($signed((-(reg13 ? reg8 : wire4)))) ?
                      reg11[(3'h5):(2'h3)] : {wire2, reg12[(2'h3):(2'h2)]});
endmodule
