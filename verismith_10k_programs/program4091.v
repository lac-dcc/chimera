module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire49;
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire26,
                 wire49,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
                 (1'h0)};
  assign wire5 = (wire2[(4'h8):(3'h5)] ?
                     (-wire4) : (wire3[(1'h1):(1'h0)] < (~|$signed(wire0))));
  assign wire6 = $signed(wire2[(3'h6):(1'h0)]);
  assign wire7 = wire4;
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg8 <= {(~^$unsigned(wire5)),
              $signed({((wire5 + wire4) == $signed(wire1)),
                  ((wire5 ? wire0 : wire5) | $unsigned(wire0))})};
        end
      else
        begin
          if ($unsigned(($signed(wire1) ? wire5[(2'h2):(1'h0)] : (&wire6))))
            begin
              reg8 <= wire3;
            end
          else
            begin
              reg8 <= $unsigned(wire6);
              reg9 <= (reg8[(3'h7):(1'h1)] < wire1);
              reg10 <= $unsigned({(8'hb7), wire1[(3'h5):(2'h3)]});
              reg11 <= $unsigned(wire2[(4'h9):(2'h2)]);
            end
          reg12 <= ($unsigned(($unsigned(wire7[(3'h4):(2'h2)]) ~^ {reg9})) <<< wire2);
        end
      reg13 <= ($signed($signed((!wire3[(1'h0):(1'h0)]))) | ((&$signed(wire7)) ^ $signed((~|$unsigned(reg12)))));
      reg14 <= wire7[(2'h3):(2'h3)];
      reg15 <= ($unsigned((-$unsigned(reg8))) ?
          wire1 : $signed((wire1 ?
              wire5[(3'h5):(2'h3)] : (&$unsigned(wire6)))));
      if (wire2)
        begin
          reg16 <= $unsigned($signed((~&(~&(~reg13)))));
          reg17 <= {$unsigned({reg11[(3'h4):(2'h3)]}),
              ({($signed((7'h44)) ? reg9 : (wire0 ? wire4 : (8'hb3))),
                      (wire0[(3'h4):(1'h0)] ? $unsigned((7'h41)) : {reg11})} ?
                  (reg8 ?
                      $unsigned($signed(reg11)) : ((reg12 < wire3) ?
                          wire6[(2'h3):(1'h1)] : $signed(wire0))) : reg16[(4'he):(3'h5)])};
          reg18 <= reg9;
        end
      else
        begin
          if ((wire5 ?
              $signed((8'hb4)) : (|{(!((8'hb2) + wire7)),
                  ($signed((8'h9f)) & reg13[(3'h6):(3'h6)])})))
            begin
              reg16 <= ($unsigned($signed(((~|wire3) <= {wire2}))) ?
                  ($signed(((reg11 ? reg13 : wire7) <<< $signed(wire7))) ?
                      (($signed(reg9) <= (wire2 ? wire2 : wire4)) ?
                          (|wire0) : ($signed(reg12) ?
                              (reg9 * reg8) : reg17)) : wire0[(1'h1):(1'h0)]) : (({(reg8 == (8'ha9)),
                              reg11[(1'h0):(1'h0)]} ?
                          (8'hb2) : $unsigned({reg15})) ?
                      $signed((~&(wire4 <= reg8))) : wire0[(1'h1):(1'h0)]));
              reg17 <= ((wire4 ?
                  {((^~(7'h43)) ? (wire2 ^~ wire2) : (reg12 || reg15)),
                      ((7'h40) - $unsigned(reg9))} : (reg18[(4'h9):(2'h3)] ^ ((wire3 ?
                          (8'h9f) : (8'hbd)) ?
                      (8'hb1) : $unsigned(reg15)))) - reg12);
              reg18 <= $signed({($unsigned($unsigned((8'ha9))) ?
                      wire7 : {(wire6 < reg10)})});
              reg19 <= $signed(wire3);
            end
          else
            begin
              reg16 <= reg9[(3'h6):(3'h4)];
              reg17 <= reg16[(5'h11):(4'hc)];
            end
          reg20 <= reg13;
          reg21 <= $unsigned($signed($signed(($signed((8'hb1)) != reg9[(4'h8):(3'h5)]))));
          if ((reg20 ?
              (!(reg11 ^ $signed(reg11))) : {reg8[(3'h5):(3'h4)],
                  $unsigned(wire6[(2'h2):(1'h1)])}))
            begin
              reg22 <= wire6[(1'h0):(1'h0)];
              reg23 <= ($signed(reg18[(4'h9):(2'h3)]) ?
                  $signed($unsigned(wire4)) : (~&((-{reg15, reg19}) ?
                      (~|$unsigned((8'h9e))) : ((reg20 <= reg10) ?
                          reg21 : reg10[(3'h5):(2'h3)]))));
              reg24 <= $signed(((reg13 ^ (&(!reg11))) ~^ (+{(wire0 >>> wire0)})));
            end
          else
            begin
              reg22 <= $unsigned($unsigned($unsigned((~^$unsigned(reg9)))));
              reg23 <= wire2[(3'h6):(1'h0)];
              reg24 <= $unsigned($unsigned($signed(reg9)));
              reg25 <= wire4;
            end
        end
    end
  assign wire26 = (+$unsigned($signed((!$unsigned((8'hb1))))));
  module27 #() modinst50 (.wire29(wire26), .wire32(reg8), .wire30(reg10), .y(wire49), .clk(clk), .wire28(reg14), .wire31(reg18));
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire32;
  input wire [(5'h13):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire [(5'h10):(1'h0)] wire29;
  input wire [(4'hb):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire33 = $signed(wire29[(2'h3):(2'h3)]);
  assign wire34 = wire32[(4'he):(1'h1)];
  assign wire35 = ((|$unsigned($unsigned((wire34 >> wire30)))) ?
                      wire32 : (((((8'hbf) ?
                              wire34 : wire33) || (wire29 >= wire29)) ?
                          (|$signed(wire32)) : $signed($unsigned(wire31))) * (|((^~wire29) ?
                          wire32 : {wire29}))));
  assign wire36 = wire31[(3'h6):(3'h5)];
  assign wire37 = $unsigned(wire34);
  assign wire38 = ($signed((($signed((8'ha2)) ?
                          (wire29 ? wire34 : wire34) : {(8'had)}) ?
                      (&(wire36 ^ (7'h43))) : $unsigned((wire28 ?
                          wire36 : (8'ha4))))) | (wire33 ?
                      (wire36[(1'h0):(1'h0)] ?
                          wire36[(1'h1):(1'h1)] : $unsigned((~^(8'ha0)))) : (!$signed((~|wire32)))));
  assign wire39 = (~|wire32);
  assign wire40 = $signed(wire31);
  assign wire41 = (&({($unsigned(wire40) <<< (-wire37)), $unsigned(wire34)} ?
                      (wire40[(3'h4):(1'h0)] > ((~&wire31) ?
                          $signed(wire40) : (8'ha1))) : ((|(~wire29)) ?
                          wire28 : wire29[(3'h7):(3'h5)])));
  assign wire42 = wire38;
  assign wire43 = $signed(wire31);
  assign wire44 = (|wire35[(4'hd):(2'h2)]);
  assign wire45 = (8'hba);
  always
    @(posedge clk) begin
      reg46 <= wire33[(1'h1):(1'h1)];
      reg47 <= ($signed((wire44 ?
              ((8'ha6) ?
                  ((7'h44) ?
                      wire28 : (7'h40)) : (~|wire45)) : {$unsigned(wire35)})) ?
          (~$signed(((wire32 ?
              wire39 : wire41) <= wire42[(3'h6):(1'h1)]))) : {((wire34 ?
                  {(8'ha3), wire37} : (~&wire38)) >= $unsigned((^~wire42)))});
      reg48 <= (!(+(wire30 == (wire32[(4'ha):(4'h8)] >>> wire40[(4'hc):(1'h1)]))));
    end
endmodule
