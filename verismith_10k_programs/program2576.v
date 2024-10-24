module top #(parameter param64 = (8'h9f)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  assign y = {wire63,
                 wire60,
                 wire59,
                 wire58,
                 wire54,
                 wire4,
                 reg62,
                 reg61,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire4 = wire1;
  module5 #() modinst55 (wire54, clk, wire4, wire3, wire0, wire2);
  always
    @(posedge clk) begin
      reg56 <= $signed({{wire4, $signed(wire2)},
          (({wire4, wire54} == $unsigned(wire2)) >= $signed((~^wire0)))});
      reg57 <= $unsigned(wire2);
    end
  assign wire58 = (wire54 ?
                      ((((8'ha7) ?
                              wire0 : $unsigned(wire54)) & wire3[(1'h0):(1'h0)]) ?
                          reg56 : $unsigned(wire2[(2'h2):(1'h1)])) : $unsigned(wire0[(4'h9):(3'h5)]));
  assign wire59 = (~^(~reg57));
  assign wire60 = ((wire58[(3'h4):(3'h4)] ?
                      $signed(wire54) : $signed(wire59)) >> wire2[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      reg61 <= (wire54[(2'h3):(2'h3)] || {wire0[(4'ha):(2'h3)], reg57});
    end
  always
    @(posedge clk) begin
      reg62 <= $signed(wire58);
    end
  assign wire63 = wire0[(4'ha):(4'h8)];
endmodule

module module5
#(parameter param52 = ({(-({(8'hb4)} ? (~(8'ha5)) : (^~(8'h9f))))} - (((^{(8'hb4), (8'hb9)}) >> (((8'hb1) << (8'ha7)) | (^~(8'hac)))) ? {(((8'hae) == (8'ha0)) ? ((8'hb1) ? (8'ha2) : (8'haf)) : ((8'hba) ? (8'haf) : (8'h9f))), (((8'ha6) ? (8'hb0) : (8'hb4)) ? (~^(8'hba)) : ((8'hbd) == (8'ha3)))} : ((((8'hb8) | (8'ha1)) ? ((8'ha7) ? (8'ha8) : (8'haa)) : ((8'had) ? (8'hb5) : (8'haa))) ? (8'hba) : (((7'h44) ? (8'hac) : (8'had)) == {(8'ha0), (8'hb0)})))), 
parameter param53 = param52)
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  assign y = {wire50,
                 wire26,
                 wire11,
                 wire10,
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
                 (1'h0)};
  assign wire10 = $unsigned(wire6[(2'h2):(1'h1)]);
  assign wire11 = ((!wire7) ?
                      (wire10 >> wire6) : ((wire9[(5'h11):(4'h8)] ?
                          $unsigned((^(7'h43))) : (~^(wire8 ?
                              wire6 : wire8))) >= {({wire8, wire6} ?
                              $unsigned(wire9) : (8'ha1)),
                          wire7}));
  always
    @(posedge clk) begin
      if ({(~^$signed(wire10)), (~|wire10)})
        begin
          reg12 <= $signed((^(^~wire8[(3'h4):(2'h2)])));
          reg13 <= ($signed($unsigned(reg12)) > reg12[(4'hc):(2'h3)]);
          reg14 <= (8'ha7);
          reg15 <= reg12[(1'h0):(1'h0)];
          reg16 <= wire10[(1'h0):(1'h0)];
        end
      else
        begin
          if ($unsigned(((wire8 ^~ wire11) & wire11)))
            begin
              reg12 <= reg15[(1'h1):(1'h1)];
              reg13 <= ((~&({$unsigned(reg15)} | (&wire10[(1'h1):(1'h0)]))) ?
                  wire11[(5'h15):(3'h6)] : reg16);
              reg14 <= wire6[(2'h2):(1'h0)];
              reg15 <= wire6[(3'h5):(3'h4)];
            end
          else
            begin
              reg12 <= $unsigned(reg14[(5'h12):(1'h0)]);
              reg13 <= wire6;
              reg14 <= {(wire7 ? $signed($unsigned((~&wire8))) : wire7)};
              reg15 <= reg16;
              reg16 <= reg16;
            end
          reg17 <= reg14;
        end
      reg18 <= $unsigned(($signed((^~$unsigned(reg12))) ?
          $signed({$signed((8'hb9))}) : reg12));
      reg19 <= reg16[(3'h5):(2'h2)];
      if ($unsigned(wire9))
        begin
          if ($signed((-(wire9 >= (~^wire10)))))
            begin
              reg20 <= $signed($unsigned((~^((^~(8'hbe)) <<< ((8'hb9) ?
                  wire7 : (8'hb4))))));
            end
          else
            begin
              reg20 <= ($signed($unsigned(wire10)) >> $signed((reg20[(1'h1):(1'h0)] ?
                  ((~&reg12) ?
                      $unsigned(reg14) : reg20[(2'h3):(1'h0)]) : wire7[(2'h2):(1'h0)])));
              reg21 <= (-(^reg13));
              reg22 <= {$unsigned((~&({reg19, reg21} ?
                      (!reg16) : (reg13 ? reg16 : reg14))))};
              reg23 <= $unsigned(((!$unsigned(wire8[(3'h4):(2'h2)])) ?
                  ((-(wire8 ^~ wire10)) ?
                      {reg18, reg17} : ((~|wire8) | {(7'h43)})) : ((~&(reg15 ?
                      reg16 : (7'h41))) ^ ((&reg18) >>> (reg16 != (8'hbb))))));
            end
        end
      else
        begin
          reg20 <= {{((((8'hbe) ? wire11 : reg14) ?
                      wire10[(2'h2):(1'h1)] : (!reg19)) == ((wire8 ?
                          (8'hba) : reg22) ?
                      $unsigned(wire6) : ((8'hb1) != wire6))),
                  reg20[(1'h1):(1'h1)]},
              ($unsigned($unsigned((^(8'ha0)))) >>> $unsigned(wire8))};
          reg21 <= (reg17[(1'h0):(1'h0)] == $unsigned(reg20));
          reg22 <= reg23[(3'h5):(1'h1)];
          reg23 <= {((((~^(8'ha5)) <<< (wire7 || reg17)) ?
                      $signed((wire10 ? wire10 : reg16)) : reg23) ?
                  (^reg12[(4'h9):(1'h0)]) : (wire9 ? (8'hb9) : (~&wire11)))};
          reg24 <= (-(reg19[(2'h2):(1'h0)] == $signed($unsigned(reg17[(3'h7):(3'h6)]))));
        end
      reg25 <= ((^wire7[(2'h3):(1'h0)]) ?
          (reg22 - $unsigned($unsigned(wire9))) : $signed(reg13[(3'h4):(2'h3)]));
    end
  assign wire26 = reg19[(3'h5):(3'h5)];
  module27 #() modinst51 (.wire29(reg25), .wire28(reg21), .wire30(reg24), .clk(clk), .wire31(reg18), .y(wire50));
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire [(4'hc):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire32 = (($signed((&$unsigned(wire31))) + $signed((-(^~wire30)))) && {((wire28[(4'ha):(3'h4)] ?
                              (wire30 << wire28) : wire28[(4'h8):(3'h7)]) ?
                          (wire30 ?
                              {wire30,
                                  wire31} : $unsigned((8'ha4))) : $signed(wire31)),
                      $signed({$unsigned(wire28), wire28})});
  assign wire33 = $signed(wire29);
  assign wire34 = (!{wire33});
  assign wire35 = (8'ha3);
  assign wire36 = {wire35[(4'hb):(2'h3)], wire33[(3'h7):(3'h7)]};
  assign wire37 = wire28[(1'h1):(1'h1)];
  assign wire38 = (wire35[(4'hf):(4'hf)] ? wire31 : wire32[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      reg39 <= {(wire32 == wire32), (^~$unsigned(($signed(wire38) != wire29)))};
      if (($unsigned($unsigned(((wire36 && (8'hb5)) >>> wire38[(5'h11):(4'hf)]))) < $unsigned(wire35)))
        begin
          reg40 <= {wire38[(1'h1):(1'h0)], $unsigned(wire32[(1'h0):(1'h0)])};
          reg41 <= ({({$unsigned(wire32), wire33[(4'he):(2'h3)]} ?
                  (^~(wire28 * wire33)) : $signed((^wire33)))} == {(+wire35[(4'hb):(3'h4)]),
              (((wire34 ? wire33 : wire37) >> (wire31 & wire38)) ?
                  $unsigned(((8'ha0) ? reg39 : wire33)) : $unsigned({wire31,
                      wire34}))});
          reg42 <= wire34;
        end
      else
        begin
          reg40 <= $signed((^wire38[(4'he):(4'h8)]));
          if ($unsigned((($signed(wire37) > wire33) ?
              $signed((^reg42[(2'h2):(1'h0)])) : {($signed(reg40) <= ((8'h9e) * wire38))})))
            begin
              reg41 <= (|$signed(reg40[(2'h3):(2'h2)]));
              reg42 <= (~^(~wire34[(4'h9):(2'h3)]));
              reg43 <= $signed($signed(wire29[(2'h3):(1'h1)]));
              reg44 <= ($signed(({(reg40 ? wire31 : reg40)} ?
                      reg41[(2'h2):(1'h1)] : $unsigned((8'hb7)))) ?
                  $unsigned(((wire30 ?
                          (wire36 ? reg43 : wire38) : $signed(wire38)) ?
                      reg39 : {(~reg43), wire30})) : (~|reg43[(1'h0):(1'h0)]));
            end
          else
            begin
              reg41 <= {((^~wire32[(1'h0):(1'h0)]) & $signed((wire29 ?
                      wire38[(4'h8):(3'h7)] : wire33))),
                  (~wire30[(3'h5):(3'h4)])};
            end
          if ((-$unsigned(((8'ha6) ?
              wire33[(4'hd):(3'h7)] : ((~^wire33) ?
                  wire37[(4'hc):(4'hb)] : $signed(wire35))))))
            begin
              reg45 <= wire38[(4'he):(3'h6)];
              reg46 <= wire29;
            end
          else
            begin
              reg45 <= reg40[(3'h4):(1'h0)];
            end
          reg47 <= (((~^((8'hb0) >>> $unsigned(reg43))) < (reg41 > $unsigned((!reg43)))) & wire32[(3'h7):(3'h4)]);
        end
    end
  assign wire48 = wire37;
  assign wire49 = reg47[(4'he):(4'he)];
endmodule
