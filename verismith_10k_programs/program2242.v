module top
#(parameter param23 = (((^(((8'hac) ? (8'hab) : (8'ha3)) ? (7'h41) : {(7'h41), (8'hb0)})) ? (~&(((8'hba) || (8'hac)) | ((7'h42) > (8'ha9)))) : ((((8'haf) ? (8'hac) : (8'hbe)) ? {(8'h9e), (8'h9e)} : (!(8'hb4))) ? ({(7'h44)} ? (!(7'h44)) : ((8'had) <<< (8'ha5))) : (((8'ha8) ? (8'haa) : (8'hbd)) ? (-(8'hbb)) : ((8'ha3) ? (8'ha6) : (8'ha4))))) ? (({(~&(8'ha1)), (~&(8'hba))} ? (((8'ha4) | (7'h42)) <<< ((8'ha6) * (8'haf))) : ((+(8'ha6)) ? (-(8'hb4)) : (^(8'haa)))) == (((^~(7'h43)) + ((8'ha6) != (8'had))) ? {((8'hb2) ? (8'hbb) : (7'h41))} : {((8'ha6) ? (8'hae) : (7'h44))})) : (-{((~|(8'hb5)) ? (&(7'h41)) : ((8'hba) ? (8'ha9) : (8'ha0)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = {(8'hb1)};
  assign wire5 = $unsigned($unsigned(wire0[(4'hf):(3'h6)]));
  assign wire6 = wire1;
  assign wire7 = ((+wire1) + $signed($signed($unsigned($unsigned(wire5)))));
  always
    @(posedge clk) begin
      if ((&$unsigned({{{wire7}}, wire2[(4'hd):(3'h6)]})))
        begin
          if ({($unsigned(wire7) - (wire0[(4'h8):(4'h8)] ?
                  ($signed(wire7) ^ $unsigned(wire4)) : (-(wire7 ?
                      wire1 : wire2)))),
              (|$signed(wire5[(2'h2):(1'h0)]))})
            begin
              reg8 <= ((wire4 ? wire4 : (7'h43)) ?
                  ((~&((wire6 ? wire5 : wire0) | wire5[(5'h10):(4'hc)])) ?
                      {wire3,
                          ((wire0 >> wire7) ?
                              (wire6 >= wire6) : {wire2})} : (+wire1[(2'h3):(2'h2)])) : $unsigned($unsigned($signed((8'ha0)))));
              reg9 <= (wire5[(2'h2):(2'h2)] ~^ wire4[(5'h11):(4'hd)]);
              reg10 <= reg9[(4'h9):(3'h5)];
              reg11 <= ({(($unsigned((8'hb0)) | (reg9 ?
                      reg8 : wire1)) <= wire0),
                  $signed(wire3[(3'h7):(1'h1)])} >= $signed(reg8[(4'hb):(4'hb)]));
            end
          else
            begin
              reg8 <= {wire7[(3'h7):(1'h1)], (|wire4[(4'h9):(2'h2)])};
              reg9 <= (&((+reg9[(4'hb):(4'hb)]) ?
                  $unsigned(($signed(wire2) != (!(8'h9e)))) : $unsigned(((reg10 ?
                          reg9 : (8'h9c)) ?
                      (reg8 >= wire0) : (wire7 && reg9)))));
              reg10 <= $signed($signed($signed(wire4)));
            end
          reg12 <= (wire4 ?
              (~^$unsigned($unsigned((wire7 ? (8'h9f) : wire7)))) : wire5);
          reg13 <= wire6;
          reg14 <= (reg12 + (-$unsigned($unsigned($unsigned(reg11)))));
        end
      else
        begin
          reg8 <= {{wire2[(1'h0):(1'h0)], wire6}};
          reg9 <= $unsigned($unsigned($signed(((wire6 ? reg10 : reg9) ?
              (reg11 ? reg10 : wire1) : (wire1 ? (8'haf) : reg10)))));
          reg10 <= {reg9[(4'h8):(3'h4)]};
        end
      reg15 <= wire0;
      reg16 <= $signed({{reg15}, reg14[(4'h8):(3'h7)]});
    end
  assign wire17 = ((reg10 ^ (-reg9)) < ((!$unsigned((~^reg15))) & ({(wire1 ?
                          wire0 : wire3),
                      reg8} > $signed($signed(reg10)))));
  assign wire18 = ($unsigned(reg15[(3'h4):(2'h2)]) > $signed($signed(reg12[(2'h3):(1'h0)])));
  assign wire19 = ((((wire5[(1'h1):(1'h1)] ?
                              (7'h44) : (reg15 ? wire2 : reg14)) << (reg10 ?
                              (~wire6) : $signed((8'haf)))) ?
                          (|{(~|reg16)}) : $unsigned($signed(reg16[(3'h5):(1'h1)]))) ?
                      (reg15 | ($unsigned((reg9 ? (8'ha1) : wire17)) ?
                          wire7 : $unsigned(wire6))) : {$signed({((8'hbc) ?
                                  (8'hb8) : wire0)}),
                          (8'hb3)});
  assign wire20 = reg9[(3'h7):(1'h1)];
  assign wire21 = ($signed(wire6) << {(((wire7 | reg12) >> reg15[(1'h0):(1'h0)]) ?
                          (8'ha4) : (~&$unsigned(wire20))),
                      $signed((&wire7[(3'h7):(1'h1)]))});
  assign wire22 = ($signed((~|$signed(reg8))) + $signed($signed($signed((-reg11)))));
endmodule
