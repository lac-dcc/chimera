module top
#(parameter param23 = (((!(((8'haa) >> (8'hbd)) ? ((8'hb6) ? (8'hb6) : (8'ha6)) : {(8'h9f), (8'haf)})) ? ((((7'h43) & (8'hbf)) ? ((8'had) ? (8'hb6) : (8'ha2)) : {(8'hb5), (7'h40)}) && ((-(8'ha5)) ? ((7'h44) ? (8'hb9) : (8'hb4)) : {(7'h41), (8'ha2)})) : ((^~(~(8'ha2))) >>> ((8'hb7) || ((7'h44) <= (8'hba))))) ? {(|(~{(8'hba), (8'haa)})), {{(~(8'hbe)), ((8'ha9) & (8'ha3))}, (^((8'ha7) ? (8'ha2) : (7'h43)))}} : {((~(~^(8'hb5))) ? (~&{(8'h9e)}) : ({(8'hb9)} ^~ (+(8'hbf)))), ((((8'hbb) + (8'ha8)) ? (|(8'hbd)) : ((7'h42) ? (8'hb7) : (8'h9f))) ? (-(~|(8'ha4))) : (((8'hbf) ? (8'haf) : (8'ha1)) >= {(7'h41)}))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $unsigned($unsigned(((~wire0) ^~ $unsigned($signed(wire0)))));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg6 <= (!(&(wire1[(3'h7):(3'h5)] ?
              $unsigned($unsigned(wire2)) : wire4)));
        end
      else
        begin
          reg6 <= wire2;
          if (wire2)
            begin
              reg7 <= (((^~((wire4 & (8'ha3)) + wire4[(3'h6):(2'h3)])) ?
                  wire1[(4'hd):(3'h7)] : (wire3[(4'ha):(3'h6)] ?
                      ({wire2} ?
                          reg6 : wire4) : {(wire2 ^~ wire4)})) && ($signed((wire4 ?
                      {wire3, wire2} : wire3)) ?
                  wire4[(1'h1):(1'h1)] : wire0[(3'h7):(3'h5)]));
            end
          else
            begin
              reg7 <= wire3;
              reg8 <= reg6[(5'h11):(4'h8)];
            end
        end
      reg9 <= $unsigned(((reg6 ?
          (+wire2[(4'ha):(2'h2)]) : $unsigned((wire3 ^~ wire4))) ^ $unsigned($signed({(8'ha6),
          reg8}))));
      if ($signed($signed($signed($unsigned((~^wire5))))))
        begin
          if ($signed(wire1))
            begin
              reg10 <= {$signed(($signed((wire5 << (8'hb7))) ?
                      $signed($unsigned(wire4)) : (&(wire5 ? reg7 : (8'ha5))))),
                  wire4[(3'h7):(3'h5)]};
              reg11 <= $unsigned((!(+$signed($signed(reg6)))));
              reg12 <= (+reg9);
              reg13 <= $signed(reg6[(2'h3):(1'h0)]);
            end
          else
            begin
              reg10 <= $signed((reg10 ^ $unsigned($signed(wire1[(4'ha):(4'h9)]))));
            end
          if ({$unsigned({$signed($signed(wire1))}),
              {$signed(wire1), {{wire1}}}})
            begin
              reg14 <= $signed((-reg12[(2'h3):(1'h0)]));
              reg15 <= reg13;
              reg16 <= $unsigned(reg11);
              reg17 <= reg16;
            end
          else
            begin
              reg14 <= wire2[(1'h1):(1'h1)];
              reg15 <= reg13[(3'h7):(1'h1)];
              reg16 <= (^~(reg9[(4'hb):(1'h1)] ?
                  ({(|reg6), $signed(reg7)} ?
                      reg12 : wire0[(3'h4):(2'h2)]) : (wire3 ?
                      $unsigned(reg8) : (-{wire5, reg17}))));
            end
          reg18 <= $unsigned($unsigned(reg8[(3'h4):(2'h2)]));
        end
      else
        begin
          reg10 <= {(!((8'h9f) >= reg10[(3'h7):(2'h2)]))};
          if (reg18)
            begin
              reg11 <= reg12;
              reg12 <= reg14;
            end
          else
            begin
              reg11 <= ((reg15 ?
                      (reg6 ?
                          (~^(reg12 ? reg7 : reg10)) : $signed({reg13,
                              (8'ha0)})) : reg6[(5'h11):(4'ha)]) ?
                  wire3 : ($signed((|reg11[(1'h0):(1'h0)])) ?
                      reg9[(3'h6):(1'h0)] : reg15[(1'h1):(1'h1)]));
              reg12 <= $unsigned({(+reg12)});
              reg13 <= (~^$signed($signed(($unsigned(reg13) ?
                  wire2 : (|wire5)))));
              reg14 <= $signed(((|(wire1 ?
                  $signed(wire4) : (wire3 ?
                      reg8 : wire5))) <= {reg14[(4'hc):(1'h0)]}));
              reg15 <= ({($unsigned((wire4 - reg11)) ^ {$unsigned(reg15),
                          reg10[(1'h0):(1'h0)]}),
                      (^~(reg8 != (wire5 >>> reg7)))} ?
                  wire3 : $unsigned($signed(((reg17 != reg13) ~^ $unsigned((7'h43))))));
            end
        end
      reg19 <= wire4;
      reg20 <= (&((8'h9e) ?
          {{$signed(wire0)}, reg9[(5'h12):(4'hd)]} : (~|$signed((-reg15)))));
    end
  assign wire21 = ((^(~|$signed(wire3[(4'hf):(4'h9)]))) ?
                      ($signed(($unsigned(reg15) ?
                              ((8'ha6) ? (8'ha1) : reg19) : (~^reg9))) ?
                          (~&($unsigned(reg13) ~^ (!reg12))) : $signed((reg9[(1'h0):(1'h0)] + {reg14,
                              wire0}))) : {$unsigned($unsigned(reg11))});
  assign wire22 = $unsigned(((&reg8) ?
                      ({(7'h42),
                          (wire1 >= wire4)} ~^ (+$unsigned(reg18))) : $unsigned(($signed(reg18) ?
                          reg15 : $signed((8'ha5))))));
endmodule
