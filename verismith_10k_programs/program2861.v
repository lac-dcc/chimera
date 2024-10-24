module top
#(parameter param20 = ((&{((!(8'hbc)) && ((8'hae) ? (8'hb0) : (8'hab))), {((8'hb6) ? (8'hae) : (8'hb8))}}) >> ((({(8'ha6)} ? ((8'hb6) ? (7'h41) : (8'hba)) : {(7'h42), (8'ha2)}) << ({(8'ha2)} >>> {(8'h9d)})) ? (((!(8'h9f)) - ((8'hb1) ? (8'h9f) : (8'hb5))) ? ((-(8'hb3)) ? (^~(8'hb6)) : ((8'ha4) ? (7'h41) : (8'had))) : (((7'h44) <<< (8'hb2)) == ((8'hb1) ? (8'hb2) : (8'ha6)))) : (!(((8'hb7) ? (8'ha1) : (7'h44)) & ((8'h9d) ? (8'ha3) : (8'hbd)))))), 
parameter param21 = (8'hb6))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire19,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire0[(4'ha):(3'h6)];
  assign wire5 = (~$unsigned(wire1[(3'h4):(2'h3)]));
  assign wire6 = {{(~^$unsigned($signed(wire5))), wire4[(3'h5):(3'h4)]},
                     (^$signed(wire2[(3'h4):(1'h1)]))};
  assign wire7 = $unsigned(({{(wire1 ? (8'hb8) : wire5), $unsigned(wire1)}} ?
                     $unsigned(((~wire1) ~^ (8'hb8))) : wire2));
  always
    @(posedge clk) begin
      reg8 <= (wire3 ?
          (~$unsigned(((wire0 != (8'hbd)) > $unsigned(wire3)))) : {$signed(($signed(wire6) >> wire3)),
              (8'ha5)});
      if ($unsigned($signed((^~$unsigned(wire6)))))
        begin
          if ((~(wire3[(4'h8):(3'h5)] + $signed((~|wire7)))))
            begin
              reg9 <= ($unsigned({(wire0[(1'h1):(1'h0)] * wire3)}) & $unsigned((8'ha9)));
            end
          else
            begin
              reg9 <= {reg9, (wire6[(3'h7):(3'h4)] | (~wire4))};
              reg10 <= (+wire0);
              reg11 <= $signed(wire2);
            end
          reg12 <= (~$unsigned((8'h9e)));
          if (reg12[(2'h2):(1'h0)])
            begin
              reg13 <= ($unsigned((((wire5 != wire6) ?
                      (reg11 ?
                          reg8 : reg10) : $signed(reg12)) || reg10[(3'h6):(2'h3)])) ?
                  ((wire1 > (!(reg8 * wire7))) ~^ reg12) : ({{$signed(wire7)}} ?
                      $signed((reg11[(1'h0):(1'h0)] + $signed(wire6))) : {($unsigned(reg9) | (~^wire6)),
                          wire0[(1'h0):(1'h0)]}));
              reg14 <= (~|$signed((($signed(reg9) < ((8'ha7) - wire5)) ?
                  (~reg13) : reg10)));
              reg15 <= reg13[(4'h8):(3'h6)];
              reg16 <= $signed((reg11 ^ $unsigned((~&(reg12 ?
                  wire1 : wire1)))));
            end
          else
            begin
              reg13 <= reg14[(4'he):(3'h4)];
              reg14 <= wire6;
              reg15 <= (!$unsigned(((8'hb6) ^~ (((8'ha3) ? wire7 : (8'hab)) ?
                  {reg16} : (wire6 ? wire4 : wire0)))));
            end
          reg17 <= (reg10 ?
              $signed((wire0[(4'ha):(4'ha)] && reg9)) : (($unsigned(wire6) ?
                  (reg14 ^ ((8'ha1) | reg10)) : ($signed(wire4) <<< {(8'hbe),
                      wire2})) - $signed((^$signed(wire1)))));
        end
      else
        begin
          reg9 <= (!$unsigned(((reg16[(2'h3):(1'h1)] ?
              {reg12} : (wire0 ? wire1 : reg17)) << (reg10 || reg14))));
          reg10 <= reg14;
          reg11 <= (-((wire3 ? wire4 : reg16[(1'h1):(1'h0)]) ?
              reg9 : reg15[(2'h2):(1'h1)]));
          reg12 <= wire5[(4'hd):(3'h7)];
          reg13 <= wire3;
        end
      reg18 <= (reg9 & $signed(wire3));
    end
  assign wire19 = {$signed($signed((wire5[(3'h6):(3'h6)] ?
                          $signed((8'hbb)) : (~^(8'haa))))),
                      reg11[(2'h2):(1'h1)]};
endmodule
