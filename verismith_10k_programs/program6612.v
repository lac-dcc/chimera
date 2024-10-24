module top
#(parameter param34 = {(((~{(8'ha9), (7'h41)}) ? ((&(8'hb8)) - {(8'hb5), (8'h9f)}) : ({(8'hbc)} ~^ ((8'hab) << (8'hab)))) ? (-((~^(8'hb9)) ? (~(8'hba)) : (^(8'ha6)))) : ({((8'hb6) ^~ (7'h43))} <<< (~&(8'ha2))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire33,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = (8'ha7);
  assign wire7 = ({wire4,
                     $unsigned(wire0[(4'hd):(1'h1)])} < wire0[(2'h3):(1'h0)]);
  assign wire8 = ((!wire4) ? (8'h9e) : wire2);
  always
    @(posedge clk) begin
      reg9 <= wire2[(1'h0):(1'h0)];
      reg10 <= $unsigned($signed(wire2[(3'h7):(3'h4)]));
    end
  assign wire11 = (~&wire0);
  always
    @(posedge clk) begin
      reg12 <= {(wire0 ?
              {((reg9 >= reg10) >> wire8[(3'h4):(2'h3)]),
                  (wire11[(5'h10):(1'h0)] >> (wire4 & (8'haa)))} : wire5)};
      reg13 <= wire8;
      reg14 <= wire8;
      reg15 <= $signed($unsigned(($signed((|reg14)) >> wire1[(2'h3):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg16 <= $signed($signed((8'hb7)));
      reg17 <= (wire11 ?
          $unsigned($signed($unsigned(wire3))) : (reg14 >>> (!wire4[(2'h3):(1'h1)])));
      if (reg17)
        begin
          reg18 <= (reg16[(3'h4):(2'h3)] ?
              ($unsigned($signed($unsigned(wire5))) || reg15) : wire4[(1'h0):(1'h0)]);
        end
      else
        begin
          reg18 <= wire2[(3'h6):(3'h6)];
          if (((reg9 ? $unsigned({$signed(wire6)}) : {wire1[(3'h4):(2'h2)]}) ?
              (wire0 ?
                  $unsigned(((^wire4) >= wire3[(4'h9):(3'h7)])) : (reg17[(3'h5):(2'h2)] <= (~^$signed(wire5)))) : ((reg14 & {$signed(wire2),
                  $unsigned(wire7)}) - $signed(reg16))))
            begin
              reg19 <= {((((^(8'haf)) ? reg9 : $signed(reg18)) ?
                          (reg16[(3'h4):(1'h1)] <<< (wire6 * reg13)) : $signed($unsigned(reg15))) ?
                      (wire4[(2'h2):(2'h2)] ?
                          $signed((~|reg10)) : reg18[(2'h2):(1'h1)]) : ($signed(reg14) >>> ($unsigned(reg18) ?
                          (^reg9) : (~&reg14)))),
                  reg17};
              reg20 <= (8'hbf);
            end
          else
            begin
              reg19 <= $unsigned(wire2[(3'h5):(1'h1)]);
              reg20 <= $unsigned({$unsigned(reg18[(1'h0):(1'h0)]),
                  $unsigned(wire2)});
              reg21 <= wire0[(2'h2):(2'h2)];
              reg22 <= {$signed($signed($signed({wire5, reg18}))),
                  $unsigned((^($unsigned(reg15) != wire11[(4'h8):(3'h7)])))};
              reg23 <= {$signed(reg9[(3'h6):(3'h6)])};
            end
          if (reg13)
            begin
              reg24 <= $signed((^wire1[(3'h6):(2'h2)]));
              reg25 <= $unsigned((~$signed(($unsigned(reg17) - reg23[(1'h1):(1'h0)]))));
              reg26 <= (((&$unsigned($signed(reg9))) <= (&((8'hb7) ?
                  reg22 : (reg10 ? reg16 : wire5)))) >> {(($signed(reg10) ?
                      $signed((7'h43)) : (wire7 && reg19)) + wire5)});
            end
          else
            begin
              reg24 <= (reg9 - ({wire8[(3'h5):(2'h2)]} ?
                  (~reg19[(3'h7):(3'h7)]) : {reg25[(4'h8):(3'h4)]}));
              reg25 <= wire2[(4'h8):(3'h5)];
              reg26 <= (reg26 ^ wire3);
              reg27 <= $unsigned(reg22);
              reg28 <= ((&(((~^reg21) ? wire6[(1'h1):(1'h1)] : (+reg16)) ?
                  {{reg18, wire2}} : ({reg12,
                      reg18} ^~ ((8'ha1) <= reg24)))) | reg10[(4'hf):(2'h2)]);
            end
          reg29 <= (wire7[(4'h9):(1'h0)] ?
              (reg27 ?
                  $unsigned($signed(((8'hbb) ?
                      reg26 : (8'ha2)))) : wire3[(2'h2):(1'h0)]) : reg20);
          if ((^reg15))
            begin
              reg30 <= ((reg13 > wire1) ?
                  wire8 : ($signed({(wire11 <= reg19), (reg17 >>> wire7)}) ?
                      {reg23[(3'h4):(2'h2)],
                          (^~(reg25 - reg20))} : (+(reg19 >= (wire5 ?
                          reg19 : (8'hb9))))));
            end
          else
            begin
              reg30 <= (&reg12[(5'h10):(2'h3)]);
              reg31 <= reg24[(4'ha):(1'h0)];
            end
        end
      reg32 <= wire0;
    end
  assign wire33 = {$unsigned({reg21}),
                      (((^$unsigned(reg21)) && $unsigned((~^reg22))) ?
                          reg30[(3'h5):(3'h5)] : ((reg21 + $unsigned(reg9)) ?
                              (reg22[(1'h1):(1'h0)] ?
                                  reg24 : (reg30 <<< (8'ha9))) : $unsigned((~&wire0))))};
endmodule
