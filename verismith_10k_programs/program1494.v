module top
#(parameter param36 = (({(!((8'ha8) - (8'hbc))), (~((8'ha9) ? (8'hb9) : (8'hb1)))} ? (-(+((8'ha0) ? (8'hb5) : (8'hae)))) : (+(+{(8'hb7)}))) >= {((~&{(8'ha2)}) != (((8'hb0) ? (8'hb6) : (8'hbd)) <<< ((8'hbf) | (8'ha3))))}), 
parameter param37 = (7'h43))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire35,
                 wire34,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($signed(wire1[(4'hc):(3'h7)]) ?
          wire1 : $signed($unsigned(wire0)));
      if ($unsigned(wire3))
        begin
          reg6 <= (~(wire2[(4'hb):(1'h1)] <= $signed(((wire2 && wire2) ?
              (wire3 && wire0) : $unsigned(wire0)))));
          reg7 <= (^~$signed((8'hb2)));
          if (reg7[(2'h2):(1'h1)])
            begin
              reg8 <= wire2[(1'h0):(1'h0)];
              reg9 <= ((~(~^$signed(reg8))) ?
                  wire0[(4'ha):(4'h8)] : (((reg5[(4'hd):(4'hc)] + $signed((7'h44))) ?
                          wire4[(4'hb):(2'h3)] : (~&reg6)) ?
                      wire1 : $unsigned(wire1[(4'he):(4'hd)])));
              reg10 <= $signed(reg5[(3'h6):(3'h5)]);
              reg11 <= $signed((+$signed((~|(wire1 ? reg5 : (8'hb3))))));
              reg12 <= (~$unsigned(wire4));
            end
          else
            begin
              reg8 <= $signed($unsigned($signed($unsigned(reg11))));
              reg9 <= (^~($signed(($unsigned(reg12) - (8'hb6))) ^ reg11));
              reg10 <= reg10[(3'h5):(2'h2)];
              reg11 <= reg7[(2'h3):(1'h0)];
              reg12 <= {$unsigned((!reg6[(5'h10):(4'hb)]))};
            end
          reg13 <= $unsigned($signed(($signed($signed(reg10)) ?
              $signed($signed(reg10)) : reg7[(2'h2):(1'h0)])));
        end
      else
        begin
          reg6 <= wire2[(4'ha):(3'h5)];
          reg7 <= (((+(8'h9d)) <<< (((wire2 << reg8) * wire4[(4'h9):(1'h1)]) * $unsigned((-reg8)))) ?
              $unsigned(reg9[(3'h7):(2'h2)]) : $unsigned((|(~^(8'hbb)))));
          reg8 <= $unsigned(((reg11[(2'h3):(1'h0)] ?
                  reg6[(5'h12):(4'h8)] : (+((8'hb3) ? wire3 : wire2))) ?
              (($unsigned((8'hbb)) ?
                  (reg11 && wire2) : $unsigned(reg12)) << {(-reg10)}) : (($unsigned(wire3) ?
                  {reg10, reg10} : $unsigned(reg8)) < (|(wire0 ?
                  reg10 : reg6)))));
        end
      reg14 <= {wire1[(4'hb):(4'hb)], $unsigned(reg7[(2'h3):(2'h2)])};
      if ($unsigned((!({(8'hb2)} < $signed($unsigned(wire2))))))
        begin
          reg15 <= (reg8[(4'hc):(3'h6)] ?
              (!{$signed((~|reg14))}) : reg5[(1'h0):(1'h0)]);
          reg16 <= (8'hb3);
          reg17 <= {(8'hb9)};
          reg18 <= (wire3 < ((reg10[(4'h8):(2'h2)] ?
              wire3[(1'h0):(1'h0)] : reg11) && {(8'ha1),
              $signed((reg8 ? reg10 : wire3))}));
          reg19 <= wire2;
        end
      else
        begin
          if (reg11[(3'h6):(2'h2)])
            begin
              reg15 <= $unsigned(((~&(^~$signed((8'ha5)))) ?
                  $unsigned(wire4) : reg11));
            end
          else
            begin
              reg15 <= (+($signed((!$signed(reg7))) ?
                  (|reg8[(4'hb):(4'h8)]) : wire3[(5'h10):(3'h5)]));
              reg16 <= (($signed((((7'h40) >> reg9) >>> reg9)) ?
                  (~|$signed(((8'hb3) * reg11))) : wire4) & reg7[(2'h3):(2'h3)]);
              reg17 <= ({reg12,
                  $unsigned((~^(reg12 ?
                      wire0 : reg10)))} != $unsigned((~^$unsigned(reg9))));
              reg18 <= $signed(reg7[(2'h2):(1'h1)]);
              reg19 <= $unsigned((~^$unsigned(reg9[(1'h0):(1'h0)])));
            end
          reg20 <= wire3[(3'h4):(2'h3)];
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned(((reg15[(3'h7):(3'h6)] ?
          (reg7 ?
              $unsigned(wire3) : reg15[(4'h8):(2'h2)]) : (^reg8)) ^~ wire4)))
        begin
          if (((({$signed(wire1),
                  (^reg13)} < ($signed(reg12) && $unsigned(reg16))) ?
              wire0[(4'h8):(1'h0)] : {reg8[(4'hf):(2'h3)],
                  ($signed(wire1) << wire3)}) && (8'hba)))
            begin
              reg21 <= reg10;
              reg22 <= $signed(((wire4[(4'hc):(3'h5)] ? reg18 : (&{reg19})) ?
                  (reg11 ? (8'hab) : reg17) : $unsigned((~reg17))));
              reg23 <= $signed($unsigned($signed(reg16[(3'h4):(3'h4)])));
              reg24 <= (wire1 ?
                  ((|$signed((^reg12))) ?
                      ({reg17[(4'h9):(1'h0)], (reg16 ? reg13 : reg12)} ?
                          (8'h9d) : (reg6 == ((8'hb8) << reg20))) : reg23) : (({$unsigned(reg23),
                      (reg14 && wire1)} != reg23[(4'hb):(3'h4)]) == (~&($signed((8'hba)) ?
                      (&reg21) : (+wire4)))));
              reg25 <= {{(^(((8'hb0) ~^ wire0) ?
                          $signed(reg10) : $unsigned(reg13))),
                      $signed(((reg23 & reg10) ?
                          (reg7 ? reg20 : reg21) : (reg8 ? reg17 : reg17)))},
                  (^reg18)};
            end
          else
            begin
              reg21 <= (reg11[(3'h5):(3'h5)] ?
                  $signed(wire0[(4'hb):(2'h2)]) : (|(~^(reg15[(4'hb):(1'h1)] - (reg12 & reg19)))));
            end
          reg26 <= (+((wire2[(4'he):(4'h8)] ?
              (~|reg12[(1'h1):(1'h1)]) : $unsigned(reg19[(4'hd):(4'hd)])) <<< $unsigned($signed(reg16))));
        end
      else
        begin
          reg21 <= $unsigned(reg25);
        end
    end
  always
    @(posedge clk) begin
      reg27 <= {reg23[(4'hc):(1'h0)]};
      reg28 <= reg19[(3'h5):(3'h4)];
      reg29 <= $unsigned((^~$unsigned(reg19)));
      reg30 <= (+({$unsigned((8'h9f)),
              (reg14[(3'h4):(2'h2)] ?
                  $unsigned(reg29) : reg24[(2'h2):(1'h0)])} ?
          (^~($signed((7'h40)) ~^ (reg7 ?
              wire2 : (8'haf)))) : ($signed(((7'h42) ?
              reg8 : reg25)) != $signed((~(8'ha6))))));
    end
  always
    @(posedge clk) begin
      reg31 <= wire1[(3'h4):(1'h0)];
      reg32 <= (-(~^$signed(((^~(8'hbf)) >>> {reg24, reg26}))));
      reg33 <= reg21;
    end
  assign wire34 = ((~^$signed(($signed(reg17) ?
                      (8'haf) : (reg32 && wire3)))) && reg24[(4'hb):(3'h4)]);
  assign wire35 = (&{reg25,
                      ($unsigned($signed(reg13)) ?
                          reg30[(2'h2):(1'h0)] : ((^reg21) ?
                              (~&reg17) : $signed(wire4)))});
endmodule
