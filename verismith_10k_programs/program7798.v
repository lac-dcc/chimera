module top
#(parameter param51 = (((&(^~(-(8'hac)))) ? (^(((8'hb3) & (8'h9c)) + ((8'hbe) ? (8'ha7) : (8'hbc)))) : (|({(8'ha8)} <<< ((8'hbf) >> (8'hbe))))) ^ ({((&(8'hba)) ? ((8'hba) ? (8'had) : (8'had)) : ((8'hbd) ? (7'h40) : (7'h42))), {((8'hb5) ? (8'hbd) : (8'ha6)), ((8'h9c) ^~ (8'hb8))}} ? ((((8'hb9) + (8'hb3)) > ((8'hbd) ? (8'hb8) : (8'hb1))) - (((8'h9d) ? (8'hb9) : (8'hb5)) ? (~|(8'ha1)) : ((8'ha9) ^ (8'hac)))) : ((((7'h44) >>> (8'hb4)) <= {(8'hbb)}) ? (+{(8'ha3)}) : ((|(8'ha6)) ? ((8'hbd) - (8'ha0)) : ((8'ha5) ? (8'haf) : (8'hb7)))))), 
parameter param52 = param51)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire48;
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  assign y = {wire50,
                 wire4,
                 wire22,
                 wire48,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire4 = (($unsigned(wire0) ?
                     $unsigned({(~wire1),
                         (wire3 | wire1)}) : wire0) <<< (wire1[(3'h7):(3'h4)] - $signed((^(wire1 ?
                     wire3 : wire2)))));
  always
    @(posedge clk) begin
      reg5 <= wire3[(1'h0):(1'h0)];
      if ({$unsigned((~^(~&(~&reg5)))),
          $signed((wire2[(3'h4):(3'h4)] ?
              (~^$unsigned(wire2)) : {(^~wire4), reg5[(1'h0):(1'h0)]}))})
        begin
          reg6 <= $unsigned($signed($unsigned((8'h9f))));
          reg7 <= (|$unsigned(wire2));
          reg8 <= $unsigned((({wire0, wire2} ?
                  (-((7'h44) ?
                      wire1 : reg5)) : ($unsigned(wire2) != ((8'had) ~^ wire1))) ?
              (wire4 ?
                  ((|wire4) ?
                      wire0 : (reg7 > wire2)) : reg6) : wire2[(1'h1):(1'h1)]));
          reg9 <= (|(reg8[(4'he):(4'he)] ^ reg7));
        end
      else
        begin
          reg6 <= $unsigned(reg5);
          reg7 <= {({reg7} ? reg6 : $unsigned(reg8))};
        end
      reg10 <= $unsigned({(wire4 ? (8'hac) : wire2[(2'h3):(2'h3)]), wire2});
      reg11 <= {((~|($unsigned((8'hbc)) == $signed(reg8))) ?
              (($signed(wire1) ?
                  (reg9 && wire4) : $unsigned(wire4)) <= reg7[(5'h12):(4'hc)]) : wire3),
          reg9[(3'h4):(1'h0)]};
    end
  always
    @(posedge clk) begin
      if (({wire2[(3'h4):(1'h1)],
          $unsigned((!reg9))} || (~&reg8[(3'h4):(3'h4)])))
        begin
          if ((($unsigned(($unsigned(wire1) ? wire0 : (wire0 > wire2))) ?
                  wire2[(2'h2):(1'h1)] : wire1[(3'h5):(2'h2)]) ?
              ((~reg7[(3'h6):(3'h4)]) ?
                  reg11 : wire2[(1'h0):(1'h0)]) : $signed(wire2[(3'h4):(1'h1)])))
            begin
              reg12 <= (^(&($unsigned({wire4,
                  (8'hb0)}) != (wire0[(4'hb):(1'h0)] ?
                  {wire3, wire2} : (reg9 ? wire1 : wire3)))));
              reg13 <= ((~^(&(reg7 ?
                  $signed(reg6) : (reg10 ? wire4 : reg12)))) * reg7);
              reg14 <= $signed((wire1 ?
                  ((8'ha3) > (^wire2[(1'h0):(1'h0)])) : (^~wire1)));
              reg15 <= (({($signed(reg11) ? reg13 : (reg11 > reg11)),
                          (~|$unsigned(wire3))} ?
                      $signed((^~{reg11, wire4})) : (^{wire4[(1'h1):(1'h0)],
                          reg8})) ?
                  ($signed($unsigned(reg6)) && $unsigned(((wire2 ?
                      reg9 : reg12) >>> (&reg7)))) : wire3[(3'h6):(2'h2)]);
            end
          else
            begin
              reg12 <= wire2;
              reg13 <= $signed((-reg11[(2'h3):(2'h3)]));
              reg14 <= $signed(({$unsigned((reg11 ? reg5 : wire2)),
                      ($unsigned(wire3) - {reg7})} ?
                  $unsigned($signed($unsigned(reg10))) : (~(8'hbe))));
            end
          if (($unsigned((8'hac)) ^ wire4))
            begin
              reg16 <= ($signed(reg15) <= reg15);
            end
          else
            begin
              reg16 <= $unsigned(reg14[(4'ha):(1'h0)]);
              reg17 <= $unsigned((~^reg9[(4'ha):(2'h2)]));
              reg18 <= ($signed((((reg10 * wire4) || (~|(8'hac))) & (8'hb1))) - reg15[(4'ha):(1'h1)]);
              reg19 <= $signed((wire4[(1'h1):(1'h0)] >>> reg6[(2'h2):(2'h2)]));
              reg20 <= $unsigned(reg17);
            end
          reg21 <= $signed({{(reg9[(3'h5):(1'h0)] | wire0), $unsigned(reg6)}});
        end
      else
        begin
          reg12 <= ($unsigned({(^~$signed((8'ha9)))}) ?
              (&(!reg8[(3'h6):(1'h0)])) : reg13[(1'h1):(1'h1)]);
          if (({(-({reg6} ? (~|reg18) : ((8'h9d) | reg8)))} ?
              ((~(^$signed(reg12))) ?
                  (&$unsigned(reg8)) : (~&(reg8 ^~ $unsigned((8'h9d))))) : (reg6[(2'h3):(2'h2)] || ($unsigned((reg8 ?
                      reg12 : reg11)) ?
                  $unsigned((reg6 ? reg11 : reg12)) : (!reg5[(2'h3):(1'h0)])))))
            begin
              reg13 <= reg9[(2'h3):(1'h1)];
              reg14 <= $unsigned(($signed({(~^(8'ha1)),
                  $unsigned((7'h44))}) | (reg7[(4'h8):(3'h5)] >>> reg18[(3'h4):(2'h2)])));
              reg15 <= ((8'hbf) > reg7[(3'h7):(2'h3)]);
              reg16 <= (reg5 || reg6[(4'ha):(2'h3)]);
            end
          else
            begin
              reg13 <= $signed((8'ha5));
              reg14 <= reg17[(3'h5):(2'h3)];
              reg15 <= $signed(reg17[(3'h7):(2'h3)]);
            end
        end
    end
  assign wire22 = ((8'h9f) ?
                      $signed((+$unsigned(reg20[(2'h3):(1'h0)]))) : (((!(reg7 ?
                                  reg7 : reg7)) ?
                              $unsigned((reg12 ?
                                  reg21 : (8'hb2))) : $signed($signed((7'h42)))) ?
                          (reg18[(3'h4):(1'h0)] ?
                              ((wire2 > (8'hab)) ?
                                  (reg17 >>> reg15) : $signed((8'ha2))) : {{(7'h43)}}) : reg14));
  module23 #() modinst49 (.y(wire48), .clk(clk), .wire25(reg5), .wire27(reg20), .wire26(wire22), .wire24(reg10));
  assign wire50 = (8'h9f);
endmodule

module module23
#(parameter param47 = (~&(7'h44)))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire26;
  input wire signed [(3'h6):(1'h0)] wire25;
  input wire [(3'h5):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire37,
                 wire36,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire28 = wire24[(2'h2):(1'h0)];
  assign wire29 = {($unsigned(wire27[(3'h4):(2'h3)]) ?
                          $unsigned($signed($unsigned(wire27))) : $unsigned($signed($signed(wire25)))),
                      wire25[(2'h2):(1'h0)]};
  assign wire30 = $unsigned((+$unsigned($signed((wire29 <= wire24)))));
  assign wire31 = ({$unsigned($unsigned($unsigned(wire27)))} < $unsigned(((8'hba) >> wire26)));
  assign wire32 = {$unsigned(wire26)};
  always
    @(posedge clk) begin
      reg33 <= wire31;
      reg34 <= {($signed($signed($unsigned(wire31))) < $unsigned($unsigned(((8'h9c) ?
              reg33 : wire31))))};
      reg35 <= $signed((wire32 >= $signed(wire28)));
    end
  assign wire36 = $signed($signed(wire32[(3'h4):(2'h3)]));
  assign wire37 = {((wire28[(5'h14):(3'h7)] ?
                          wire24[(2'h3):(1'h0)] : wire26) * {(~^(wire30 << wire26))}),
                      (&($unsigned((!wire24)) ?
                          $unsigned(wire28) : ((|(8'h9d)) ?
                              reg35 : wire32[(1'h0):(1'h0)])))};
  always
    @(posedge clk) begin
      reg38 <= reg35[(3'h5):(3'h4)];
      reg39 <= (8'haf);
      reg40 <= wire31;
      reg41 <= $signed(wire24);
      if (reg39)
        begin
          reg42 <= (&wire36[(3'h5):(3'h4)]);
        end
      else
        begin
          reg42 <= ($signed({(wire31[(4'hc):(1'h0)] * reg41),
              $unsigned(wire31[(4'hb):(2'h2)])}) * reg42[(4'hb):(1'h1)]);
          reg43 <= wire31;
          reg44 <= ($signed(reg40) ^~ wire30);
        end
    end
  assign wire45 = (reg44[(1'h0):(1'h0)] ? reg34 : (8'ha1));
  assign wire46 = (~^(8'hb8));
endmodule
