module top
#(parameter param39 = (^((8'ha3) ? {((+(8'hb4)) == ((8'had) ? (7'h43) : (8'h9e)))} : ((~^(8'ha9)) ^ (((8'ha3) ? (8'hbe) : (8'hb1)) <= {(8'ha0), (8'hbf)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  assign y = {wire38,
                 wire28,
                 wire27,
                 wire23,
                 wire22,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
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
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = {{(!{$unsigned(wire0)}),
                         {((wire0 ? (7'h42) : (8'h9d)) ?
                                 (wire3 >= wire5) : {wire4}),
                             (wire2[(1'h0):(1'h0)] ~^ $signed(wire4))}}};
  assign wire7 = $unsigned($unsigned($signed((8'hb8))));
  assign wire8 = (^$unsigned($signed({wire7[(4'ha):(3'h5)]})));
  assign wire9 = wire7;
  assign wire10 = wire5[(5'h11):(4'hf)];
  always
    @(posedge clk) begin
      if ($signed($signed(((^~$unsigned(wire5)) ? (+wire6) : wire3))))
        begin
          reg11 <= (wire6 ?
              wire4[(4'ha):(2'h3)] : $signed({(^wire5[(2'h3):(2'h3)]),
                  wire2[(1'h0):(1'h0)]}));
          reg12 <= (8'h9c);
          if ($unsigned(($signed(reg11[(1'h0):(1'h0)]) << wire4[(4'ha):(1'h1)])))
            begin
              reg13 <= (wire6 ^ (wire8[(2'h3):(1'h0)] ?
                  (8'hb7) : (wire1[(5'h11):(3'h5)] ?
                      (8'h9f) : (~|$signed(wire0)))));
              reg14 <= (&wire1[(3'h4):(1'h0)]);
            end
          else
            begin
              reg13 <= wire2[(2'h3):(2'h2)];
              reg14 <= {wire3};
              reg15 <= (wire2 ?
                  ((^~((wire5 << reg11) && {(8'haa),
                      wire2})) && (8'had)) : (8'hb0));
              reg16 <= $signed((reg13[(4'hf):(4'hd)] ?
                  $signed((-$unsigned(reg15))) : (wire5[(1'h1):(1'h1)] ?
                      ($unsigned(reg11) <<< wire9) : ((reg15 && reg15) + $unsigned(reg13)))));
              reg17 <= reg13;
            end
          reg18 <= $signed((!($signed($signed(wire2)) == reg12)));
          reg19 <= (-(^~$signed(((reg17 ? wire10 : wire9) ?
              {(7'h40)} : (reg16 & reg17)))));
        end
      else
        begin
          reg11 <= reg18[(2'h3):(2'h3)];
          reg12 <= ($signed({(~|$unsigned(reg12))}) ?
              wire0 : $signed({wire10[(4'ha):(1'h0)]}));
          reg13 <= wire6[(4'h8):(4'h8)];
          reg14 <= $signed($signed(reg19));
          reg15 <= (reg11[(4'hb):(3'h6)] ? wire7 : wire1[(2'h2):(1'h1)]);
        end
      reg20 <= reg16[(1'h1):(1'h1)];
      reg21 <= (8'h9f);
    end
  assign wire22 = (8'ha7);
  assign wire23 = wire7[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg24 <= {$signed(wire0[(4'hf):(2'h3)]), wire1[(4'hc):(1'h0)]};
      reg25 <= (wire6[(4'hb):(4'h8)] ?
          reg11[(4'hb):(2'h2)] : {reg11,
              $signed((wire7[(3'h7):(3'h7)] ?
                  reg15[(4'ha):(3'h4)] : $unsigned(wire7)))});
      reg26 <= (($unsigned(wire22) + $signed((~^(wire5 ?
          wire7 : reg12)))) || reg15);
    end
  assign wire27 = $signed((8'hbd));
  assign wire28 = {reg18};
  always
    @(posedge clk) begin
      if (reg13)
        begin
          reg29 <= reg20;
        end
      else
        begin
          reg29 <= {{$signed((-(^~reg16)))},
              ((!reg15[(1'h1):(1'h0)]) ~^ reg11[(2'h2):(2'h2)])};
          reg30 <= (+reg24);
          if ($unsigned(wire28[(3'h4):(1'h1)]))
            begin
              reg31 <= reg13;
              reg32 <= $unsigned((reg31 >> wire27));
              reg33 <= wire27[(1'h1):(1'h1)];
            end
          else
            begin
              reg31 <= reg33[(1'h1):(1'h0)];
              reg32 <= reg32;
              reg33 <= (8'hb9);
              reg34 <= {{{reg14}, $unsigned(reg30[(3'h7):(1'h0)])}};
              reg35 <= $signed(reg21);
            end
          reg36 <= $unsigned(reg15);
          reg37 <= (8'haa);
        end
    end
  assign wire38 = {($unsigned(({(8'hbe)} ?
                          $unsigned(wire22) : reg16[(1'h0):(1'h0)])) << $signed(reg25))};
endmodule
