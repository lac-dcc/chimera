module top
#(parameter param37 = (~|(~^{((^~(8'ha7)) && ((8'ha0) <<< (8'ha4)))})), 
parameter param38 = (((~^((param37 ? (8'ha0) : param37) ? param37 : (param37 << (8'hb8)))) ? {(&{param37, (8'ha1)}), ((param37 ? param37 : param37) <<< (^(8'hb0)))} : (param37 <<< (7'h42))) ? (~|(param37 ? ((8'ha7) * (param37 * param37)) : ((param37 ^ param37) ? (param37 << (8'hae)) : param37))) : ((((param37 == param37) ? (param37 ? param37 : param37) : (8'hac)) ? (+{param37}) : (param37 ? (param37 ? param37 : param37) : (^param37))) & {param37})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire36,
                 wire33,
                 wire32,
                 wire23,
                 wire20,
                 wire19,
                 wire18,
                 wire5,
                 wire4,
                 reg35,
                 reg34,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg22,
                 reg21,
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
                 reg6,
                 (1'h0)};
  assign wire4 = (^(~|wire0[(2'h3):(2'h3)]));
  assign wire5 = ((+($unsigned((!wire3)) | wire1[(1'h0):(1'h0)])) ?
                     wire2[(1'h0):(1'h0)] : $unsigned($unsigned(wire0[(4'h9):(3'h4)])));
  always
    @(posedge clk) begin
      reg6 <= (7'h42);
      reg7 <= (8'ha9);
      if (wire2)
        begin
          reg8 <= (~|wire4);
          reg9 <= ({(wire2 ?
                  $signed(reg7[(1'h0):(1'h0)]) : (-(reg6 <<< (8'hb7)))),
              $signed((^wire3))} >>> wire4[(3'h5):(1'h0)]);
          reg10 <= (8'hb5);
          if (wire5)
            begin
              reg11 <= (^{($signed((+wire2)) ?
                      $unsigned((reg9 ? wire5 : wire0)) : (+(~wire0))),
                  ((~^(wire0 >>> (8'hb9))) ?
                      $signed((reg8 << (8'hbb))) : reg7)});
              reg12 <= ($unsigned((^~reg7[(4'h8):(3'h4)])) <= ((!$signed((~wire0))) ^~ wire3));
              reg13 <= $signed($unsigned(($unsigned(((7'h40) ?
                  reg6 : reg9)) || wire3[(5'h12):(5'h11)])));
            end
          else
            begin
              reg11 <= $signed($unsigned($signed((-{wire3}))));
              reg12 <= $signed(((+reg12[(3'h7):(2'h3)]) || ($signed($unsigned(wire3)) ?
                  reg10[(3'h4):(1'h1)] : wire3)));
              reg13 <= (^~(wire2[(4'hb):(2'h3)] ?
                  (~^(~^$signed(wire4))) : (wire1[(2'h3):(1'h0)] << {$signed((8'hac))})));
            end
          if (reg6)
            begin
              reg14 <= ((8'hab) >= wire4[(3'h6):(3'h4)]);
              reg15 <= wire0[(4'h9):(3'h7)];
              reg16 <= reg12;
              reg17 <= $signed((({$signed((8'h9d)),
                      $unsigned(wire1)} - wire1[(3'h5):(2'h2)]) ?
                  $signed($unsigned((-reg6))) : {{(reg7 ? reg11 : wire1)}}));
            end
          else
            begin
              reg14 <= (!($signed((&$signed(reg13))) ?
                  (-(|reg17[(3'h7):(3'h7)])) : wire3[(4'h8):(1'h1)]));
              reg15 <= reg12;
              reg16 <= wire4;
              reg17 <= $signed((^~(wire5 < reg8)));
            end
        end
      else
        begin
          reg8 <= $signed($signed((8'hbb)));
          reg9 <= $signed(reg7);
          if ((reg17 > $unsigned($signed((reg14 <= reg10[(4'h8):(3'h4)])))))
            begin
              reg10 <= reg10;
              reg11 <= $signed((((7'h42) ?
                      $unsigned(((8'hb6) ?
                          reg14 : reg16)) : $unsigned($unsigned(wire4))) ?
                  (reg10[(3'h4):(1'h0)] || ($unsigned(wire5) ?
                      (reg10 >>> reg14) : {wire0})) : ((((8'ha6) - reg17) == $unsigned(wire0)) >> ($unsigned(reg9) ?
                      wire5 : (~|wire1)))));
              reg12 <= $signed(reg8[(4'h9):(2'h2)]);
              reg13 <= {wire2[(4'h9):(1'h0)]};
              reg14 <= (((reg16 ^~ wire1[(2'h3):(1'h0)]) + {$unsigned((wire4 ?
                      reg8 : reg12))}) ^ ($signed(reg15) ?
                  $signed($unsigned((~^reg9))) : $unsigned($unsigned((reg16 >>> wire3)))));
            end
          else
            begin
              reg10 <= $unsigned($unsigned(reg14[(4'he):(4'hd)]));
            end
          reg15 <= $unsigned(((|((reg15 ? reg8 : reg14) >> $signed(reg8))) ?
              (((wire4 ? reg8 : reg11) ?
                      reg11[(1'h0):(1'h0)] : (reg16 ? wire2 : (8'hb6))) ?
                  $signed($unsigned(reg6)) : {reg6}) : (~($signed(reg14) ?
                  (reg12 ? (8'had) : wire0) : $unsigned((8'ha7))))));
        end
    end
  assign wire18 = $unsigned(($signed(({reg13} ?
                          ((8'hbb) ? wire5 : reg7) : (~&wire4))) ?
                      wire3[(4'hd):(2'h3)] : (8'hbb)));
  assign wire19 = ($unsigned($unsigned(reg17[(5'h12):(4'h8)])) ?
                      $unsigned((($signed(wire2) ?
                          $unsigned(reg15) : (|reg8)) || (reg11 ?
                          (8'ha0) : $signed(reg11)))) : (reg15 ?
                          reg9[(5'h10):(1'h0)] : wire1));
  assign wire20 = reg10[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg21 <= $signed($signed(reg16[(1'h0):(1'h0)]));
      reg22 <= $unsigned(($signed({{reg16}}) ?
          (((wire20 ~^ wire18) << $unsigned((8'h9f))) == $signed($unsigned((8'hb2)))) : (((wire1 && reg9) ?
              reg16[(1'h0):(1'h0)] : (~wire1)) | wire19)));
    end
  assign wire23 = (~&$unsigned(((&reg6) != $unsigned(reg15[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg24 <= ((~|reg15) ?
          $unsigned((~^$signed($signed((8'haa))))) : $unsigned($signed(((8'hb4) | wire0))));
      if ({$unsigned($signed(reg12))})
        begin
          if ($unsigned(reg24))
            begin
              reg25 <= wire0[(4'h9):(3'h6)];
              reg26 <= $signed(wire3[(5'h13):(4'hc)]);
              reg27 <= wire4;
              reg28 <= ((~|$signed($unsigned((wire2 & (8'h9e))))) ?
                  reg11 : wire1);
              reg29 <= reg11[(2'h3):(2'h2)];
            end
          else
            begin
              reg25 <= $unsigned(reg24);
              reg26 <= $unsigned(({(reg26[(4'ha):(1'h1)] ?
                      (reg10 >> reg16) : $signed((7'h42))),
                  {reg22[(1'h1):(1'h0)]}} ^ (~reg8)));
              reg27 <= (&$unsigned(((|reg9[(5'h10):(4'he)]) && reg6[(3'h6):(3'h5)])));
              reg28 <= $signed($unsigned(($signed((&reg10)) <= (reg25 ~^ (^(8'h9d))))));
              reg29 <= $signed($signed($unsigned($unsigned($signed((8'hae))))));
            end
          reg30 <= (8'ha9);
          reg31 <= {($unsigned(($unsigned((8'hb0)) < (&reg29))) || {reg10}),
              $signed($unsigned(reg22[(4'h8):(3'h6)]))};
        end
      else
        begin
          if ((&$signed({(~&(+reg7)), ($signed(reg31) >> reg15)})))
            begin
              reg25 <= (^(^~wire18[(1'h1):(1'h1)]));
              reg26 <= $unsigned((~^reg29[(2'h2):(1'h1)]));
            end
          else
            begin
              reg25 <= reg14;
              reg26 <= (+$signed($signed($signed((|reg22)))));
              reg27 <= ($unsigned((~(+reg16[(2'h3):(1'h1)]))) ?
                  (&(((~|reg31) ? $signed((8'h9d)) : wire2) ?
                      $unsigned(reg11) : (8'hbb))) : reg10);
            end
          reg28 <= $unsigned($signed((~^reg28)));
          reg29 <= $unsigned(reg9[(3'h5):(2'h3)]);
          reg30 <= ($signed((|wire3)) ?
              (wire18[(1'h0):(1'h0)] ?
                  reg6[(1'h1):(1'h1)] : ((|{reg31, wire19}) ?
                      reg29[(3'h6):(3'h4)] : reg7[(4'h8):(1'h0)])) : (7'h40));
          reg31 <= $signed(wire4);
        end
    end
  assign wire32 = (~|$signed(((+reg31[(3'h7):(1'h0)]) ?
                      {reg9[(1'h1):(1'h1)], reg8[(5'h10):(2'h2)]} : reg14)));
  assign wire33 = $signed(reg9[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg34 <= (8'hbc);
      reg35 <= (~&{wire23[(4'ha):(3'h4)],
          $unsigned((wire2 ? $unsigned(reg13) : wire4))});
    end
  assign wire36 = (+$signed($signed(($signed(wire2) ?
                      (reg15 ? reg27 : wire2) : (reg12 ? reg21 : reg27)))));
endmodule
