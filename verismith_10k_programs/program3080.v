module top
#(parameter param44 = (((~((&(7'h42)) ? ((7'h41) < (8'hba)) : (8'hac))) > (!(^~((8'h9d) + (8'hba))))) ? ((8'hb1) ? {(~|((8'hbb) ? (8'h9f) : (8'hb3)))} : (-((8'hab) ^ (~^(8'ha6))))) : (({((8'hb8) ? (8'haa) : (7'h43)), (8'hb4)} ? ((&(8'hbf)) >> ((7'h41) > (7'h42))) : (((8'hb2) ^ (8'hba)) << {(8'ha0)})) >= ((~^(&(8'ha0))) ? (~^((8'haa) ? (7'h41) : (8'ha5))) : {((8'hbd) * (8'h9d)), ((8'ha8) ? (8'hb9) : (8'ha0))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire40;
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire5,
                 wire6,
                 wire7,
                 wire11,
                 wire16,
                 wire40,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = ($unsigned(wire4[(2'h3):(2'h3)]) ?
                     wire1 : wire2[(1'h1):(1'h0)]);
  assign wire6 = (^$signed(wire1[(3'h7):(1'h1)]));
  assign wire7 = (8'ha6);
  always
    @(posedge clk) begin
      reg8 <= (($signed(((wire6 ? (8'hb2) : wire2) ?
          {wire2} : wire2[(1'h0):(1'h0)])) <<< ((~|$signed(wire6)) && ($unsigned(wire2) ?
          (wire2 ^~ wire2) : (-wire7)))) * ($unsigned(wire4) ?
          (&(^(~|wire3))) : (^~wire3[(1'h1):(1'h0)])));
      reg9 <= ($unsigned(($unsigned($unsigned(wire7)) ?
          (&(wire2 >>> (8'hb1))) : $signed(wire3[(2'h2):(1'h1)]))) || (&$unsigned(reg8[(3'h6):(1'h1)])));
      reg10 <= {(8'hbb), (8'hb5)};
    end
  assign wire11 = wire5;
  always
    @(posedge clk) begin
      reg12 <= wire7;
      reg13 <= $signed(reg10[(4'hc):(2'h2)]);
      reg14 <= $unsigned((wire3 ? {$unsigned(wire1)} : (~&reg9)));
      reg15 <= ($unsigned(wire1[(5'h13):(5'h10)]) ?
          {((~&(-wire0)) < reg9)} : ((+((reg9 > reg10) ?
              (wire3 * wire6) : $unsigned(wire3))) != {((~wire1) ?
                  $signed(reg12) : $unsigned(wire4))}));
    end
  assign wire16 = (reg15[(1'h1):(1'h0)] ?
                      $unsigned(($unsigned(reg10[(5'h14):(4'hb)]) ?
                          $unsigned((~(8'hb1))) : wire4)) : $unsigned($unsigned(($unsigned(reg12) ?
                          (wire3 >= wire6) : (reg14 ? wire5 : wire4)))));
  module17 #() modinst41 (.wire18(wire0), .wire22(wire16), .wire20(wire7), .wire19(wire6), .y(wire40), .clk(clk), .wire21(wire5));
  assign wire42 = reg8;
  assign wire43 = $unsigned(wire0[(3'h6):(3'h6)]);
endmodule

module module17
#(parameter param39 = ((|((|((8'ha8) - (8'ha2))) ? {(^~(8'ha0)), ((8'hb9) <<< (8'ha7))} : ({(8'ha2), (8'hb7)} ? ((8'haf) * (8'haa)) : ((8'hbb) ^ (8'ha7))))) & ({(+{(8'hb5)}), ((-(8'h9d)) ? (!(8'h9c)) : {(8'ha9)})} ? (~(((8'hb1) * (7'h41)) ? ((8'h9e) ? (8'haa) : (8'h9c)) : ((8'ha7) ? (8'haf) : (8'hbc)))) : ((((8'haa) < (8'ha4)) ? ((7'h40) >= (8'hae)) : ((8'ha9) ? (8'ha8) : (8'hbf))) << (((8'ha3) ~^ (8'ha4)) ? (|(8'hbd)) : ((7'h40) ~^ (8'h9f)))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire22[(3'h4):(1'h0)]))
        begin
          reg23 <= (|$signed((wire21[(5'h10):(1'h1)] >= $unsigned($signed((8'ha7))))));
          reg24 <= (wire18 + ($signed($unsigned(wire22)) << $unsigned((~^(8'ha2)))));
          if (wire22[(1'h0):(1'h0)])
            begin
              reg25 <= wire19[(4'hb):(1'h0)];
              reg26 <= ((|($signed($signed(wire20)) ? reg23 : wire19)) ?
                  ((|$unsigned((wire20 ?
                      wire22 : reg23))) ^~ {$unsigned((8'ha6)),
                      ((^~wire18) >= (~|wire18))}) : ($signed(((reg25 <= wire18) - wire22)) * $signed((wire18[(1'h0):(1'h0)] ?
                      {(8'ha2), (8'ha9)} : {wire19}))));
              reg27 <= reg25[(3'h5):(3'h4)];
              reg28 <= $signed($unsigned(wire18));
            end
          else
            begin
              reg25 <= {((wire18 ?
                      ((wire18 && wire20) ?
                          $signed(reg25) : reg24) : (~|reg24[(3'h4):(1'h1)])) >>> (((wire20 ?
                              reg23 : wire18) ?
                          (|reg24) : wire21[(4'hf):(3'h7)]) ?
                      {(+reg26)} : reg26))};
              reg26 <= (reg23 ?
                  (^~(({wire20, wire22} || ((8'hb9) != reg27)) - (wire19 ?
                      (wire20 >> (8'ha2)) : ((8'ha2) ?
                          reg28 : (8'haf))))) : (~wire20[(2'h3):(2'h3)]));
              reg27 <= $signed(reg26);
            end
          if (((^~(((reg25 ? reg24 : wire20) ?
                      reg28 : (wire18 ? reg28 : reg23)) ?
                  ((!reg23) ?
                      {wire18,
                          reg27} : (!reg28)) : $unsigned((reg27 <<< wire22)))) ?
              reg27 : (~&(reg27 == ($unsigned(reg26) ?
                  ((8'hba) && (8'hb4)) : $signed(reg24))))))
            begin
              reg29 <= $unsigned($unsigned(wire20[(4'h9):(3'h7)]));
              reg30 <= {(($signed($unsigned(reg27)) == $unsigned(wire18)) * reg23[(3'h4):(3'h4)]),
                  wire21[(4'he):(4'hc)]};
              reg31 <= (-((~^{reg23, wire21}) & $unsigned(((reg28 ?
                  reg30 : wire20) >>> (reg29 < wire21)))));
            end
          else
            begin
              reg29 <= $unsigned((|$signed($unsigned($unsigned(reg27)))));
              reg30 <= (wire22 - reg26);
              reg31 <= $unsigned($unsigned({$signed((wire20 > wire19)),
                  $signed($signed(reg31))}));
              reg32 <= $unsigned($signed(wire19[(4'ha):(4'ha)]));
            end
          reg33 <= $signed(((wire20 >> {(reg23 ? reg23 : reg25),
              reg27[(3'h5):(1'h0)]}) < $signed(wire20)));
        end
      else
        begin
          reg23 <= $unsigned($signed(({$unsigned(reg31)} ^~ (reg27 ?
              $unsigned(reg30) : ((8'ha8) || reg33)))));
        end
      reg34 <= $unsigned($signed((8'ha5)));
      reg35 <= ($signed($signed((~^wire21))) ?
          (wire21 ?
              ((^$signed(reg25)) ? reg32 : {$signed(reg34)}) : {reg30,
                  (^(~reg31))}) : reg25[(1'h0):(1'h0)]);
    end
  assign wire36 = reg32[(5'h10):(4'ha)];
  assign wire37 = {reg28};
  assign wire38 = reg23[(2'h3):(1'h1)];
endmodule
