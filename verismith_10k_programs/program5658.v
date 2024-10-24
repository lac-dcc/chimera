module top
#(parameter param40 = (~(+(&((~^(8'hbf)) >> {(8'hbe)})))), 
parameter param41 = (^((param40 + (param40 >= param40)) ? ((param40 ? ((8'hb2) ? param40 : param40) : {param40}) ? ({param40, param40} > (param40 != param40)) : (~&(^param40))) : (param40 == ((^~(8'had)) ? param40 : param40)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg39,
                 reg38,
                 reg37,
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
  assign wire4 = (wire2 | $unsigned(wire2[(4'hb):(2'h3)]));
  assign wire5 = ($signed(wire3[(3'h7):(1'h0)]) ?
                     (-$unsigned($signed(((8'ha3) ? wire3 : wire2)))) : wire1);
  assign wire6 = $unsigned((~&(|($signed(wire2) + wire4))));
  assign wire7 = ((wire2[(4'hb):(4'h8)] ?
                     (|{{wire5, (8'ha8)},
                         wire5[(3'h5):(3'h4)]}) : {wire1}) || {$signed($signed(wire3[(2'h2):(1'h0)]))});
  assign wire8 = wire6;
  assign wire9 = ($signed((!wire1)) && wire5[(4'hf):(1'h0)]);
  assign wire10 = wire5;
  assign wire11 = $signed(wire9);
  always
    @(posedge clk) begin
      reg12 <= (wire10[(3'h7):(2'h2)] ^~ $signed($signed($signed(((8'hac) ^~ (8'hb1))))));
      reg13 <= ((8'hb0) ?
          (8'haa) : $signed(({(~wire2), (reg12 ? wire8 : (8'hb2))} ?
              wire3 : ((|wire9) <= wire10[(3'h5):(1'h0)]))));
      if ((8'had))
        begin
          reg14 <= wire1;
          reg15 <= {wire8[(3'h5):(3'h5)], $signed(wire4[(1'h1):(1'h0)])};
        end
      else
        begin
          if ((wire1[(3'h7):(2'h2)] ?
              (!((+wire6) ?
                  ($signed(wire6) >= (wire1 > (8'hb7))) : wire2)) : ({((^reg13) ?
                          wire1[(4'hc):(1'h1)] : $signed(wire9))} ?
                  {$signed(wire9), (^~(wire11 ? (8'hbb) : wire11))} : wire7)))
            begin
              reg14 <= $unsigned({$signed(($unsigned((8'hbd)) ?
                      (+wire0) : (wire2 < wire9)))});
              reg15 <= (|(&wire11[(4'hc):(4'hb)]));
              reg16 <= {wire10[(3'h6):(2'h2)],
                  (($signed(reg15) ~^ {(-reg13)}) && $unsigned($unsigned($unsigned(wire4))))};
              reg17 <= (wire10 + $unsigned(reg13[(1'h0):(1'h0)]));
            end
          else
            begin
              reg14 <= {($signed($unsigned($unsigned((8'ha9)))) ?
                      (|((reg15 ^~ reg16) > $signed(wire6))) : (({wire9} || (~&wire5)) * $unsigned((~&(8'h9f)))))};
              reg15 <= ($signed(($signed((reg17 ?
                      reg17 : wire9)) * {(8'hba)})) ?
                  wire5[(4'hd):(4'h9)] : ((+{{wire5, wire11},
                          $signed((8'ha4))}) ?
                      $unsigned((reg14 ?
                          $unsigned(reg16) : (wire6 ?
                              (8'hba) : reg13))) : $signed($unsigned((wire2 ?
                          wire9 : (8'ha5))))));
              reg16 <= {{wire2}};
              reg17 <= {{(wire5 ?
                          (reg15[(4'h9):(2'h3)] ?
                              (wire6 ^~ (8'ha2)) : (wire0 >>> wire7)) : $unsigned((^~wire10)))},
                  $signed(({{(8'hb5)}} >>> (wire0 ?
                      (reg13 << reg14) : (wire10 >> wire6))))};
            end
          if ($unsigned((&wire3)))
            begin
              reg18 <= (~^wire1);
              reg19 <= wire10;
              reg20 <= wire11[(3'h4):(2'h2)];
            end
          else
            begin
              reg18 <= (|($unsigned($unsigned($signed(wire9))) ?
                  {(+wire5[(4'hf):(4'h9)]), reg13} : {reg14,
                      reg20[(1'h1):(1'h1)]}));
            end
          reg21 <= (wire2 ^~ (|wire3[(1'h0):(1'h0)]));
          reg22 <= reg19;
          reg23 <= ((8'hae) >>> $signed((((reg17 ^~ wire4) ?
              wire6 : (~|reg17)) < {$signed(reg19)})));
        end
      if ((-((~&((~wire9) ? (reg22 ? (8'ha1) : reg12) : (+wire7))) ?
          (~|reg19[(4'h9):(4'h9)]) : reg18)))
        begin
          reg24 <= $signed(wire2);
          reg25 <= reg13[(3'h4):(3'h4)];
        end
      else
        begin
          reg24 <= ((wire8 ?
                  reg13 : ({$signed(reg14)} * reg13[(2'h2):(1'h0)])) ?
              {reg12[(3'h6):(1'h1)],
                  ((&wire9) ?
                      ((~|reg15) - reg20) : ((reg17 ? wire7 : reg15) + (reg18 ?
                          (8'ha4) : wire4)))} : $signed(($signed(reg22) || ((reg22 ?
                  reg14 : reg23) | $signed(reg12)))));
          reg25 <= $unsigned(wire9[(3'h6):(2'h2)]);
          reg26 <= $signed((~|(reg21[(2'h2):(2'h2)] <= $unsigned($unsigned(wire2)))));
          if (($unsigned((($unsigned(wire1) ? (reg16 ? wire2 : reg12) : reg20) ?
                  $unsigned($unsigned(reg21)) : reg23[(4'h9):(3'h6)])) ?
              $unsigned((reg12 && $signed((reg15 ?
                  (8'hb9) : wire6)))) : ($unsigned(reg24[(3'h7):(2'h3)]) && $signed($signed((~&reg20))))))
            begin
              reg27 <= (wire1 == (reg24[(3'h4):(3'h4)] ?
                  wire5[(3'h5):(1'h0)] : $signed(((^~reg19) ?
                      wire11 : (wire7 <= wire1)))));
              reg28 <= reg12[(4'ha):(4'h9)];
              reg29 <= {(|(8'hb2))};
            end
          else
            begin
              reg27 <= reg12[(3'h6):(3'h4)];
              reg28 <= $unsigned(($signed(wire4[(1'h1):(1'h1)]) ?
                  $unsigned(wire1[(1'h0):(1'h0)]) : reg21[(3'h4):(3'h4)]));
              reg29 <= (~|$signed($signed($unsigned($unsigned(wire1)))));
              reg30 <= $signed(((((reg24 - reg19) * $signed(reg23)) + ((reg14 ?
                      wire1 : wire1) != reg26[(4'he):(3'h7)])) ?
                  wire9[(2'h2):(1'h0)] : wire1));
              reg31 <= (reg15 > $signed(wire8));
            end
          reg32 <= ((wire5[(4'he):(3'h6)] ?
              $unsigned((~&$signed(reg26))) : $unsigned({(~|(8'hbb))})) < $signed((wire10[(3'h5):(1'h1)] || wire11[(5'h10):(1'h1)])));
        end
      reg33 <= (wire2 ?
          ($unsigned(((+reg27) <= reg28)) ?
              reg16 : $unsigned($unsigned((wire7 ?
                  (7'h40) : (8'h9e))))) : $signed(wire5[(3'h6):(2'h3)]));
    end
  assign wire34 = $unsigned($signed(reg18[(4'ha):(4'h9)]));
  assign wire35 = reg25[(1'h1):(1'h1)];
  assign wire36 = wire3;
  always
    @(posedge clk) begin
      reg37 <= reg17;
      reg38 <= $signed(reg26[(4'he):(4'hd)]);
      reg39 <= wire7[(4'h9):(1'h1)];
    end
endmodule
