module top
#(parameter param34 = (^(~^(({(8'had), (8'ha7)} >> (^~(8'hb0))) ? (8'hab) : (^~((8'hab) ^~ (8'ha6)))))), 
parameter param35 = (~|param34))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire4,
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
  assign wire4 = (wire3 >>> wire2[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg5 <= (((~(8'hb9)) == (wire4 ? $signed(wire1) : (~^{(8'hba), wire0}))) ?
          ((~&(~&$signed(wire3))) ?
              (~|$signed((wire2 ?
                  wire2 : wire1))) : wire3[(1'h1):(1'h0)]) : $signed((8'hb4)));
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed(($unsigned(wire4[(2'h2):(1'h0)]) ?
          reg5[(3'h4):(3'h4)] : ((wire0 + (7'h43)) ?
              wire1[(3'h4):(2'h3)] : $unsigned(wire2))))))
        begin
          reg6 <= $unsigned((wire0[(4'hb):(4'h9)] >= (({wire2,
                  wire2} << (wire2 >> wire4)) ?
              {{(7'h40)}} : $signed((wire4 + (8'ha6))))));
          reg7 <= (~|($signed((reg6 ? (~^wire3) : reg6[(3'h6):(1'h1)])) ?
              (~^{wire4[(1'h0):(1'h0)]}) : (($signed(wire2) > ((8'ha2) ?
                  wire4 : (8'hb8))) ^~ wire0[(4'hd):(4'ha)])));
          reg8 <= $unsigned(reg5);
          reg9 <= $signed(wire4);
          if ((~|$signed(reg7[(4'ha):(3'h4)])))
            begin
              reg10 <= (!($signed($unsigned({(8'h9f)})) ?
                  (-$unsigned((^wire4))) : $unsigned((wire2[(1'h1):(1'h0)] > reg7))));
              reg11 <= $signed((~&$signed((wire0 && (8'ha5)))));
              reg12 <= $signed(((^(~|$signed(wire4))) ^~ (~|{$signed(reg7)})));
            end
          else
            begin
              reg10 <= ($unsigned($unsigned($unsigned((-reg12)))) ?
                  (~$signed(({wire0} ?
                      ((8'hb5) ? reg9 : wire0) : (reg7 ?
                          reg10 : wire2)))) : (&$signed(reg10[(2'h3):(2'h2)])));
              reg11 <= $signed($unsigned({wire3, $unsigned($signed(wire1))}));
              reg12 <= reg8[(2'h2):(1'h0)];
              reg13 <= $signed(wire1);
              reg14 <= (~|((wire3 - $unsigned((8'hb7))) ^ (reg12 ?
                  $unsigned((~&reg12)) : {(reg12 ? reg8 : reg10)})));
            end
        end
      else
        begin
          if (reg7)
            begin
              reg6 <= $signed((($unsigned((|reg12)) ?
                  (8'ha9) : $signed((wire1 ?
                      wire4 : reg13))) >>> (((~|reg7) | wire2[(3'h7):(3'h6)]) ?
                  ($signed(reg7) + reg9[(2'h3):(1'h0)]) : ((wire4 ?
                          wire0 : reg5) ?
                      (wire4 == wire0) : wire1[(4'h8):(4'h8)]))));
            end
          else
            begin
              reg6 <= $unsigned(reg14);
              reg7 <= $signed($unsigned($signed(((reg10 ^ wire0) <= $unsigned(reg9)))));
              reg8 <= ({(~^(+(~^reg9)))} && $unsigned(wire4[(1'h1):(1'h0)]));
              reg9 <= $unsigned(wire1);
              reg10 <= $signed(reg13[(1'h0):(1'h0)]);
            end
          reg11 <= {(reg14 < $signed($signed(((8'hba) ? reg13 : wire2))))};
          reg12 <= $signed(reg10);
        end
      if ($signed(reg12[(2'h3):(1'h0)]))
        begin
          if ($unsigned(reg9))
            begin
              reg15 <= ((~|$unsigned($signed((+reg10)))) ?
                  reg5[(2'h2):(1'h0)] : reg9[(1'h0):(1'h0)]);
              reg16 <= $signed($signed((8'hb1)));
              reg17 <= $signed($signed(wire1));
            end
          else
            begin
              reg15 <= ({$unsigned(wire2),
                  (~|($unsigned(reg8) ?
                      (wire2 ?
                          (7'h42) : wire2) : reg17[(4'hd):(1'h0)]))} <<< (($unsigned(reg10) ?
                  wire0[(3'h6):(2'h2)] : ((8'h9f) ?
                      reg14[(4'h8):(2'h3)] : {(7'h42),
                          reg8})) << reg16[(2'h3):(1'h1)]));
              reg16 <= $unsigned(($signed({(!(8'hae)),
                  $unsigned(reg17)}) || (reg11[(4'ha):(3'h5)] || ($signed((8'h9f)) + reg11[(4'h8):(3'h4)]))));
              reg17 <= reg10;
              reg18 <= reg17[(5'h10):(3'h4)];
              reg19 <= $unsigned(wire2);
            end
          reg20 <= reg5;
          if ((^(~|reg6)))
            begin
              reg21 <= reg19[(3'h5):(2'h2)];
              reg22 <= (8'h9e);
              reg23 <= (~|reg17);
            end
          else
            begin
              reg21 <= $unsigned((($unsigned((reg10 ? reg15 : reg7)) ?
                      wire4[(1'h1):(1'h0)] : wire0[(4'hf):(1'h0)]) ?
                  wire4 : reg18[(4'ha):(1'h1)]));
              reg22 <= $unsigned(reg13);
              reg23 <= reg5[(3'h7):(1'h1)];
              reg24 <= $signed(($signed(reg19[(4'hd):(3'h4)]) <<< $signed(reg7[(2'h2):(1'h0)])));
              reg25 <= (reg22 ? wire2[(3'h7):(3'h4)] : reg20);
            end
          if ($unsigned(((reg15 ?
                  $signed($signed(reg23)) : {(reg16 ? (8'h9c) : reg22)}) ?
              ((~&((8'hbf) ? reg17 : (8'hb4))) ?
                  $unsigned($unsigned((8'hb3))) : (^(reg15 ?
                      (8'hb2) : reg19))) : (8'ha5))))
            begin
              reg26 <= reg14[(1'h0):(1'h0)];
              reg27 <= (reg13[(2'h3):(2'h2)] ?
                  ($unsigned(reg26[(5'h10):(4'hf)]) < (8'hb3)) : $unsigned((8'ha0)));
              reg28 <= ((|reg22[(2'h3):(2'h2)]) ?
                  $signed((((~|reg16) && (&reg9)) >> ((reg24 ? reg17 : reg19) ?
                      (reg9 ? reg20 : (8'ha9)) : (reg22 ?
                          reg21 : wire2)))) : (((reg27 >> $unsigned(reg10)) | ((reg22 <<< reg10) ?
                          (wire3 ? reg6 : (8'hb3)) : reg6)) ?
                      ((~&$unsigned(reg23)) << reg27[(4'he):(2'h3)]) : (^~reg26[(3'h4):(2'h2)])));
              reg29 <= $unsigned($signed($signed((reg9 > reg12))));
            end
          else
            begin
              reg26 <= $unsigned({$unsigned($signed({reg24, reg27})), {reg27}});
              reg27 <= ((reg14[(3'h6):(2'h3)] <<< reg11) ?
                  (reg6 ^ $signed(reg21)) : {$unsigned((^$unsigned(reg22)))});
              reg28 <= {$signed(((wire3[(3'h5):(3'h5)] ^~ (~^wire4)) ~^ ((reg27 < reg15) == (reg12 <= reg15))))};
              reg29 <= reg20;
              reg30 <= reg8;
            end
        end
      else
        begin
          reg15 <= $signed($signed($unsigned($unsigned((reg14 ?
              wire4 : reg23)))));
          reg16 <= (8'ha5);
          reg17 <= $unsigned(($signed(reg9[(1'h0):(1'h0)]) != ($signed((~&reg23)) ~^ $unsigned(reg26[(4'hb):(4'h8)]))));
        end
    end
  assign wire31 = wire1[(1'h0):(1'h0)];
  assign wire32 = $signed(reg9);
  assign wire33 = $signed(wire1[(2'h2):(1'h1)]);
endmodule
