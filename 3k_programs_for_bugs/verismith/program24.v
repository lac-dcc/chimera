module top
#(parameter param39 = (((8'ha1) & ((((8'hab) ? (8'hbb) : (8'ha0)) >>> ((8'hac) & (8'hb8))) > (((8'hac) > (8'hb9)) ~^ ((8'hb5) ? (8'hbf) : (8'h9d))))) ? (((((8'hb3) | (8'ha4)) ^~ (+(8'ha3))) ? ((~^(8'hac)) >>> (8'h9d)) : ({(8'hb7), (8'ha9)} ? ((8'hab) ? (7'h40) : (8'ha4)) : (~&(8'had)))) ? (+(((8'hb8) ? (7'h41) : (8'hb6)) ? (+(8'h9f)) : ((8'h9d) ? (8'hbb) : (8'hb1)))) : (({(7'h43), (8'ha6)} ? (8'hbe) : ((8'hba) ? (8'hbf) : (8'haf))) | (^((8'hb2) ? (8'hbd) : (8'ha4))))) : (!({(~(8'hb6)), ((8'hb1) ? (8'ha2) : (8'hbe))} || (((8'hb6) ? (8'hab) : (8'hab)) ? {(8'ha3)} : ((8'hb5) >> (7'h41)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire27,
                 wire24,
                 wire23,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg26,
                 reg25,
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
                 (1'h0)};
  assign wire5 = (wire4 | (wire0 == (|$unsigned(wire1[(1'h0):(1'h0)]))));
  assign wire6 = wire1[(2'h3):(1'h0)];
  assign wire7 = (((7'h42) ?
                         ($signed(wire1) ^ (wire4[(4'hf):(4'hb)] ?
                             (~&wire6) : (wire0 ?
                                 wire4 : wire3))) : $unsigned(wire2)) ?
                     $unsigned(wire5[(3'h7):(1'h1)]) : (~^wire5));
  assign wire8 = (wire6[(1'h1):(1'h0)] - $signed((8'hbd)));
  assign wire9 = {((wire8 <<< $unsigned((8'hb4))) < wire4),
                     $signed($signed(wire8[(4'ha):(2'h2)]))};
  assign wire10 = ((($unsigned(wire6[(1'h0):(1'h0)]) ? (8'hb5) : (^~wire3)) ?
                          {((-(8'hb9)) && $signed(wire4)),
                              {(|(8'hae))}} : {$unsigned(wire2[(2'h3):(2'h3)])}) ?
                      $signed(({(~^(8'h9f))} ?
                          wire6 : wire0)) : wire7[(4'hb):(3'h6)]);
  always
    @(posedge clk) begin
      reg11 <= $signed(wire10[(3'h5):(3'h4)]);
      reg12 <= {wire6, wire2[(1'h0):(1'h0)]};
      reg13 <= (^~($unsigned((wire1[(3'h6):(3'h6)] || (wire5 && wire1))) ?
          $unsigned(((wire8 ? wire0 : wire10) ?
              ((7'h43) | wire6) : $signed((8'ha3)))) : wire1));
      reg14 <= {(&($signed((wire6 ^~ (8'hae))) ?
              ($unsigned(wire1) ? $unsigned(wire1) : (8'ha2)) : {$signed(reg13),
                  wire0[(4'he):(4'h8)]}))};
      if ({reg13[(4'hb):(2'h3)], reg13})
        begin
          if ((8'ha0))
            begin
              reg15 <= (wire10[(1'h1):(1'h1)] ?
                  ((+$unsigned($unsigned((8'h9e)))) == ({(8'hb1),
                          $signed(reg13)} ?
                      ($signed((7'h40)) ? $signed(wire2) : reg14) : ((reg14 ?
                              wire6 : reg12) ?
                          $signed(wire5) : $signed(wire3)))) : $signed($unsigned({{reg14}})));
              reg16 <= ($signed(($signed(reg12) ?
                  reg13[(3'h4):(2'h2)] : (wire8 ^~ (wire7 ?
                      reg14 : reg15)))) > $signed((($signed(wire5) ?
                  $unsigned(reg15) : ((7'h40) ? reg12 : wire7)) & wire7)));
              reg17 <= $signed(reg16);
              reg18 <= ((reg13 + ($unsigned((-wire6)) ?
                  $unsigned({(8'ha5), reg13}) : $signed(reg15))) + {((reg13 ?
                      $signed(wire7) : (^wire2)) != {$signed((8'ha3)),
                      $unsigned(wire1)})});
            end
          else
            begin
              reg15 <= {$signed($signed(((reg15 ? reg11 : wire0) >>> (reg13 ?
                      reg16 : reg17)))),
                  reg11};
              reg16 <= wire10;
            end
          reg19 <= reg15[(3'h7):(2'h3)];
          reg20 <= $unsigned(reg11);
          reg21 <= $signed(($signed($unsigned(wire3[(4'he):(4'hb)])) ~^ ({{reg14,
                  (8'hb6)}} & reg12)));
          reg22 <= $signed({(~^wire8),
              ((~$signed(reg20)) < $signed($signed(wire2)))});
        end
      else
        begin
          reg15 <= (8'ha3);
        end
    end
  assign wire23 = ((8'h9f) >= ($unsigned({(reg19 ?
                          wire5 : reg12)}) >= (8'hbb)));
  assign wire24 = $signed({wire8[(4'hf):(2'h2)]});
  always
    @(posedge clk) begin
      reg25 <= (-(wire5 >= ($unsigned((|wire3)) ?
          {$unsigned(wire6)} : ($signed(wire10) ?
              (~reg21) : (reg15 >> wire23)))));
      reg26 <= (^({$signed((reg19 & reg18)),
          wire1} >= (+$unsigned($signed(reg13)))));
    end
  assign wire27 = (~($signed((-(wire6 ? reg18 : reg13))) ?
                      $unsigned((~$unsigned(reg13))) : $signed((~^wire4))));
  always
    @(posedge clk) begin
      reg28 <= ((8'hab) ?
          (^(reg14 ?
              reg15[(3'h4):(1'h0)] : $signed($signed(wire23)))) : (~$signed(((reg14 ?
              (8'hbb) : wire9) ~^ ((7'h44) ? wire10 : reg25)))));
      reg29 <= (|reg26[(4'h9):(2'h3)]);
      if ((&(($unsigned($signed(reg13)) ?
          wire5 : reg20[(1'h0):(1'h0)]) >>> ((8'h9c) - (~&reg14)))))
        begin
          reg30 <= reg12[(5'h12):(4'hb)];
          reg31 <= (wire3 ? (-reg28) : (8'ha6));
          reg32 <= wire24;
          reg33 <= {wire9[(1'h1):(1'h0)], reg11};
        end
      else
        begin
          if (((~(8'ha2)) ? {reg22[(1'h1):(1'h0)], wire8} : reg19))
            begin
              reg30 <= (reg29[(1'h1):(1'h0)] >> reg15);
              reg31 <= ($signed((8'hbe)) != $signed($signed(reg15)));
              reg32 <= ((wire4 >> $unsigned((^~$signed(reg15)))) & (((~&reg18[(3'h4):(2'h3)]) | $signed((reg12 ?
                      (7'h43) : reg31))) ?
                  (~|(~^(!reg13))) : ((|$signed(reg25)) <<< ((~^reg30) * (reg11 ?
                      reg14 : reg32)))));
              reg33 <= (~|(^~($unsigned($signed(reg16)) <<< ($unsigned((8'ha0)) ?
                  (wire1 && (8'ha5)) : $signed((8'ha3))))));
              reg34 <= $unsigned($unsigned((~|$signed((^(8'hbc))))));
            end
          else
            begin
              reg30 <= $signed(((~|{(wire10 ? (8'hbf) : reg32),
                      reg19[(3'h6):(2'h2)]}) ?
                  wire7[(4'hb):(3'h6)] : wire1));
            end
        end
    end
  assign wire35 = {({((-wire4) * {reg33}),
                          reg22[(3'h6):(1'h0)]} >>> {$signed((reg32 && (8'ha1)))}),
                      $signed(reg28[(2'h2):(1'h0)])};
  assign wire36 = (((8'ha7) == (8'hab)) ?
                      ($signed(wire2[(5'h11):(4'h9)]) ?
                          (8'hb9) : ($unsigned($signed(wire9)) ?
                              {$unsigned((7'h42))} : wire5[(1'h0):(1'h0)])) : ((reg22[(3'h4):(1'h0)] ~^ $unsigned($signed(reg13))) ^~ reg22));
  assign wire37 = reg31[(1'h0):(1'h0)];
  assign wire38 = $signed((8'hb5));
endmodule
