module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire32,
                 wire6,
                 wire5,
                 wire4,
                 reg35,
                 reg34,
                 reg33,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $signed(({$signed($unsigned(wire2)),
                         {(wire0 ? wire3 : wire0)}} ?
                     (&{$unsigned(wire1),
                         (wire2 ? (8'ha5) : (8'hb0))}) : wire2[(4'ha):(3'h5)]));
  assign wire5 = wire1[(3'h7):(2'h2)];
  assign wire6 = ((~&({(wire1 ? wire5 : wire0)} || wire5[(3'h7):(1'h1)])) ?
                     $unsigned({(wire2 ^~ (wire3 && wire3))}) : wire3);
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg7 <= $unsigned(wire1[(3'h4):(2'h3)]);
          if (wire2)
            begin
              reg8 <= ($unsigned(wire5[(5'h10):(4'h8)]) ?
                  ($unsigned(((-wire4) ?
                      $unsigned(wire4) : (-wire4))) - ((wire1[(4'ha):(2'h3)] << {wire2,
                      (8'ha4)}) | reg7)) : $signed(wire3[(3'h5):(3'h4)]));
              reg9 <= (reg8 >> wire0);
              reg10 <= reg8;
              reg11 <= $signed(((($unsigned(wire4) ?
                          $signed(reg10) : (wire0 ? wire1 : wire4)) ?
                      wire5 : ((^wire6) ? (8'hba) : wire4)) ?
                  (^{(reg7 ^~ wire2)}) : wire5[(3'h4):(1'h1)]));
            end
          else
            begin
              reg8 <= wire5;
              reg9 <= ((8'ha7) ?
                  (reg9[(2'h3):(1'h1)] ?
                      {reg8[(4'h8):(3'h5)]} : $unsigned(wire3)) : reg7[(3'h7):(1'h0)]);
              reg10 <= (reg8[(4'h9):(3'h4)] && ((reg10[(4'hd):(3'h6)] ^~ wire3[(4'h9):(2'h2)]) | {$signed(wire6)}));
              reg11 <= $signed(($signed((^(wire1 ? reg7 : reg7))) ?
                  $unsigned($signed(reg11[(3'h7):(2'h2)])) : wire4));
            end
        end
      else
        begin
          reg7 <= $signed((($signed(((8'hbe) + reg8)) ?
                  wire2[(3'h5):(3'h4)] : (!$unsigned(reg10))) ?
              wire3[(3'h5):(2'h2)] : reg11[(2'h3):(1'h1)]));
        end
      if (reg10)
        begin
          reg12 <= $unsigned(wire1);
        end
      else
        begin
          if (($unsigned({{reg10[(2'h3):(1'h1)],
                  $signed((8'hb4))}}) >= $signed(reg12)))
            begin
              reg12 <= reg8[(1'h0):(1'h0)];
              reg13 <= reg11;
              reg14 <= (8'ha9);
            end
          else
            begin
              reg12 <= $signed(((8'hae) ?
                  $unsigned(reg12[(5'h11):(3'h6)]) : $signed(((^wire6) ^~ reg14[(1'h1):(1'h1)]))));
            end
          reg15 <= (((~&reg11[(1'h0):(1'h0)]) - ({(reg7 ? reg13 : (8'ha1)),
                      (~^reg12)} ?
                  (&(+wire0)) : {$signed(reg8)})) ?
              (!(-(wire2[(3'h7):(1'h0)] > $signed(reg9)))) : {($signed((reg14 >= wire0)) ?
                      {(reg11 & wire1), $unsigned((8'hb3))} : {(wire2 ?
                              wire5 : (8'ha3)),
                          $unsigned(wire6)}),
                  (wire6 ?
                      reg13 : ((reg8 ? (8'hb1) : reg11) ? wire3 : {wire1}))});
          if ({(8'hb3)})
            begin
              reg16 <= (wire3 ?
                  $signed((7'h40)) : (~^((reg15 < $unsigned(wire2)) | wire0)));
              reg17 <= $signed($signed($unsigned(reg14[(2'h3):(1'h0)])));
            end
          else
            begin
              reg16 <= ($unsigned($signed(reg8[(1'h1):(1'h0)])) >> (^((reg7[(1'h0):(1'h0)] < $signed(wire2)) == (reg17[(2'h2):(1'h0)] >>> reg15[(2'h2):(2'h2)]))));
              reg17 <= $signed({(({(8'h9f)} ?
                      (reg9 ?
                          reg7 : wire0) : reg10[(4'ha):(1'h1)]) && $signed($signed(reg7)))});
              reg18 <= reg11[(4'h9):(2'h3)];
              reg19 <= $unsigned((-$signed(($signed(reg18) ?
                  {reg16} : (^~wire6)))));
              reg20 <= reg16;
            end
          reg21 <= $signed((~|reg10));
          reg22 <= reg14[(3'h6):(1'h1)];
        end
      if ((8'hb9))
        begin
          reg23 <= {reg17[(1'h0):(1'h0)], reg17};
          reg24 <= ($unsigned(wire6) & (&(reg18 < $unsigned($signed((8'hb1))))));
          reg25 <= {($unsigned($signed((reg16 >> reg17))) ^~ (reg21 ?
                  reg24 : $signed((wire1 ? reg18 : wire2))))};
          reg26 <= {wire3, $unsigned(reg12)};
        end
      else
        begin
          if (((+(8'hb2)) >>> reg7[(4'hb):(4'h8)]))
            begin
              reg23 <= $unsigned(reg11);
              reg24 <= $unsigned((~|({reg11[(3'h4):(3'h4)]} != $unsigned((reg25 ?
                  reg14 : wire6)))));
            end
          else
            begin
              reg23 <= ({((^$signed(wire5)) ?
                          reg19[(2'h3):(1'h1)] : (^{reg12}))} ?
                  ({({reg21} + $signed(reg9)), wire3[(3'h5):(2'h3)]} ?
                      wire1 : (^~(~|$signed(reg26)))) : $signed((reg19[(3'h4):(1'h1)] ?
                      (&$signed(reg13)) : ($unsigned(wire5) ~^ (~reg24)))));
              reg24 <= $unsigned(reg12);
              reg25 <= (&(~{(!$signed(reg20)),
                  ({(8'ha4)} ? (8'hbd) : {(8'hb3)})}));
            end
          reg26 <= $unsigned((+(~reg13[(2'h3):(2'h3)])));
          reg27 <= (!(7'h40));
          if ($unsigned(((8'hb3) ?
              (reg18[(1'h1):(1'h1)] ?
                  (!$signed(reg19)) : (wire3[(4'hd):(2'h3)] < wire0[(1'h0):(1'h0)])) : reg21)))
            begin
              reg28 <= wire0;
              reg29 <= ((~$signed(reg14)) || ((($signed(reg20) | (^wire0)) ^~ (~|(wire0 ?
                      reg27 : reg8))) ?
                  $unsigned($signed({reg18, wire1})) : reg14));
            end
          else
            begin
              reg28 <= ((~&reg28[(3'h7):(2'h2)]) ?
                  $signed(((~|((8'hb8) || reg8)) ?
                      {reg16} : (wire5 >> (|(8'hb3))))) : (8'h9d));
              reg29 <= $signed((8'hb4));
              reg30 <= ($signed(reg26) && (~|wire6[(2'h2):(1'h0)]));
              reg31 <= ((reg11[(3'h5):(3'h4)] >> wire4[(4'h9):(3'h6)]) ^ reg24);
            end
        end
    end
  assign wire32 = $signed((+{(&$signed(reg7)), $signed((~^reg21))}));
  always
    @(posedge clk) begin
      reg33 <= (^~((wire4 <<< reg14[(1'h0):(1'h0)]) ?
          {((reg24 ? reg23 : wire1) ? (|(8'hbe)) : (~&reg21)),
              $signed((~&(8'h9d)))} : ($signed($signed(reg26)) != $unsigned((reg24 ?
              wire6 : (8'hbf))))));
      reg34 <= {{($unsigned((wire2 <= (8'hb5))) * $unsigned(reg21)),
              (reg25 >= reg12[(3'h5):(1'h0)])},
          reg24};
      reg35 <= $unsigned($unsigned((8'hb8)));
    end
  assign wire36 = reg11[(3'h5):(3'h4)];
  assign wire37 = reg13;
  assign wire38 = ($signed(reg29) ?
                      ($signed(((reg11 * reg15) ?
                          (reg17 | reg25) : (~reg33))) & ({$unsigned(reg10),
                          ((8'ha6) ^~ wire0)} | {$signed(reg29)})) : (8'hbc));
  assign wire39 = (-$signed($unsigned($signed($signed(reg29)))));
  assign wire40 = $unsigned($unsigned(reg25));
endmodule
