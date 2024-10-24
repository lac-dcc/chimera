module top
#(parameter param46 = (((8'hb0) >> (|(-((8'h9d) ? (8'hb8) : (8'hb3))))) && ((~^((!(8'hae)) ? ((8'hb5) ? (8'ha5) : (8'hbb)) : (!(8'ha2)))) + (~(((8'hbf) ? (8'hbb) : (8'hb4)) * ((8'hbe) ? (8'hb5) : (8'hbc)))))), 
parameter param47 = (param46 || (((param46 ? (param46 ? (8'ha0) : param46) : (-param46)) && ((param46 || param46) ? (~&param46) : param46)) ? {((param46 >= param46) ? ((8'hb7) ? param46 : param46) : (param46 + param46)), (param46 ? (param46 + param46) : (param46 ? param46 : (8'h9d)))} : ((-(^(8'hbe))) ? (~param46) : ((param46 < param46) ? {param46, param46} : (param46 ? (7'h44) : param46))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire42;
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire5,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire42,
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
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  assign wire5 = wire1[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg6 <= $signed($signed(((wire0[(4'hb):(3'h6)] ?
              (!wire5) : ((8'h9d) && wire0)) ?
          (!$signed(wire1)) : wire1)));
      reg7 <= $signed(($unsigned(wire2) ?
          {wire3[(2'h2):(1'h1)]} : {(~|(wire5 ^~ wire5))}));
    end
  always
    @(posedge clk) begin
      if ((~^(($unsigned(wire0) ?
              (|(wire0 ? wire0 : wire2)) : {{reg6, wire0}}) ?
          (~{(reg7 != wire0)}) : (8'hb3))))
        begin
          reg8 <= ((&{((reg6 ? wire2 : wire2) + ((7'h42) ? wire1 : wire3)),
              ((reg6 - wire3) | (reg6 ? (8'hb3) : wire2))}) ^~ (8'hb3));
          reg9 <= (~|{(-(^~(wire1 & wire3)))});
          reg10 <= wire5;
        end
      else
        begin
          reg8 <= ((~^((&$unsigned((8'hae))) >= wire5)) != $unsigned($signed(wire3)));
          reg9 <= (+$unsigned(wire3[(3'h6):(1'h0)]));
          if ((($unsigned($unsigned({reg8})) < wire3) ?
              (wire0[(4'hf):(1'h0)] >= ((reg10[(3'h4):(1'h1)] ?
                  reg7 : {reg6}) || (-wire5))) : $unsigned(({(~|reg8)} - reg7[(3'h4):(3'h4)]))))
            begin
              reg10 <= $unsigned($signed((8'h9f)));
              reg11 <= $unsigned($unsigned($unsigned($signed(wire3))));
            end
          else
            begin
              reg10 <= wire4[(1'h0):(1'h0)];
              reg11 <= ({({(reg10 >> reg8), wire4} ?
                      {reg9[(3'h4):(2'h2)], wire4[(1'h0):(1'h0)]} : (^wire5)),
                  wire4[(1'h0):(1'h0)]} != reg8);
              reg12 <= (^wire0);
              reg13 <= wire5;
              reg14 <= $signed(wire0[(4'hc):(3'h5)]);
            end
        end
      reg15 <= $unsigned(wire4[(1'h0):(1'h0)]);
    end
  assign wire16 = $signed(reg7[(4'ha):(2'h2)]);
  assign wire17 = (wire4[(1'h1):(1'h0)] ?
                      reg11 : (~$unsigned($signed($unsigned(reg13)))));
  assign wire18 = $signed($signed(((wire17 ?
                      (reg9 <= reg12) : $unsigned(reg6)) + $signed((~^reg8)))));
  assign wire19 = (((wire1 ?
                      reg11[(5'h11):(2'h3)] : $signed({wire3,
                          (8'ha0)})) & ((~|(reg7 == (8'had))) <= $signed((wire16 - wire1)))) && $signed($signed($signed((8'haa)))));
  assign wire20 = ((8'ha3) << (reg10 >> (+($signed(reg15) ?
                      (wire3 ? wire0 : wire0) : $unsigned(wire4)))));
  assign wire21 = (reg10[(4'ha):(1'h1)] ?
                      ($unsigned(reg14[(1'h0):(1'h0)]) == $unsigned($unsigned((reg11 << reg13)))) : wire16[(3'h4):(1'h1)]);
  assign wire22 = wire16;
  always
    @(posedge clk) begin
      reg23 <= wire19[(3'h5):(3'h4)];
      reg24 <= $signed(wire1[(3'h7):(2'h3)]);
      reg25 <= wire3;
      reg26 <= ((&(8'ha3)) + reg13);
      reg27 <= {reg23[(2'h2):(1'h0)], $unsigned($signed((~&{wire22})))};
    end
  module28 #() modinst43 (wire42, clk, wire20, reg13, reg10, reg26);
  assign wire44 = ($unsigned((~(^$signed((8'hbc))))) ?
                      reg12 : $signed(wire5[(4'ha):(1'h1)]));
  assign wire45 = wire44[(4'he):(4'h9)];
endmodule

module module28
#(parameter param41 = {(((8'ha5) - (|((8'ha6) ? (8'hbb) : (8'h9e)))) ^ ({((8'ha4) ? (8'haa) : (8'hbd))} <<< (8'hba))), (~^(^~(-{(8'ha8), (8'had)})))})
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire32;
  input wire [(5'h11):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire30;
  input wire signed [(5'h13):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire33 = (((wire29[(5'h13):(4'ha)] ?
                          ($unsigned(wire29) >>> (wire30 ?
                              wire32 : wire30)) : (8'hb0)) < (($signed(wire30) ?
                              wire29[(4'he):(4'h8)] : (!wire32)) ?
                          (8'hb6) : $unsigned(wire32))) ?
                      (((8'hb8) & wire32[(1'h0):(1'h0)]) ?
                          (-$signed($unsigned((8'hb9)))) : (~&$unsigned(wire29[(5'h12):(4'hb)]))) : wire29[(3'h6):(3'h4)]);
  assign wire34 = $signed((&$unsigned(wire31[(4'hb):(2'h3)])));
  assign wire35 = {wire30[(4'ha):(1'h0)],
                      {$unsigned($unsigned(((8'hb8) < wire29)))}};
  assign wire36 = ($signed($signed(((wire31 || wire35) > (wire32 ?
                      wire33 : wire33)))) == (((wire35[(4'hd):(4'h9)] && $unsigned(wire34)) ?
                          $signed({wire31}) : wire33[(1'h0):(1'h0)]) ?
                      wire33 : (((~^(8'hae)) ?
                          wire30 : $unsigned(wire35)) ~^ wire30[(3'h6):(1'h1)])));
  assign wire37 = ((wire32[(3'h4):(2'h3)] | (((wire33 << (7'h43)) ?
                              (wire33 >= wire30) : ((7'h41) | wire34)) ?
                          $unsigned((+wire36)) : $signed(wire29[(1'h0):(1'h0)]))) ?
                      (wire35 ?
                          $signed(($unsigned(wire31) ?
                              wire33 : (~|wire32))) : (|$unsigned((!wire35)))) : $unsigned((8'ha9)));
  assign wire38 = (((~^(|$signed((8'hae)))) ?
                      (((wire34 >> (8'ha3)) ?
                          $unsigned((8'ha5)) : $unsigned((8'hba))) < $unsigned((+wire31))) : (8'hae)) ~^ (&($signed((|wire33)) ?
                      (8'ha4) : wire31[(4'ha):(3'h4)])));
  always
    @(posedge clk) begin
      reg39 <= wire30[(3'h6):(2'h2)];
      reg40 <= {wire32, $unsigned($unsigned(wire33[(5'h11):(3'h7)]))};
    end
endmodule
