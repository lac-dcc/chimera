module top
#(parameter param31 = (^~((((8'hba) ? ((8'hb0) && (8'h9e)) : ((8'ha7) > (8'ha2))) ? {(^(8'haf)), ((8'ha5) + (8'hb5))} : (8'hb6)) == ((^(!(8'h9e))) & (~|(|(7'h43)))))), 
parameter param32 = {(param31 | (~^param31))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire30,
                 wire9,
                 wire6,
                 wire5,
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
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $unsigned($signed(wire3[(4'ha):(3'h7)]));
  assign wire6 = $signed($unsigned((|({wire1} ? wire5 : $signed(wire0)))));
  always
    @(posedge clk) begin
      reg7 <= wire6;
      reg8 <= $unsigned($signed($unsigned($unsigned(((8'ha3) ^~ wire3)))));
    end
  assign wire9 = wire5;
  always
    @(posedge clk) begin
      if ((&reg8[(3'h4):(3'h4)]))
        begin
          reg10 <= {(!wire6),
              $signed((|((wire4 ? (8'ha2) : wire4) - (8'h9d))))};
          reg11 <= $unsigned(wire4);
          reg12 <= $signed((^~wire3[(4'hc):(3'h6)]));
          if (($unsigned((wire6 ? (+(8'ha4)) : wire4)) ?
              reg11[(4'he):(1'h0)] : $signed(reg7[(3'h7):(3'h5)])))
            begin
              reg13 <= wire6;
              reg14 <= {reg13[(1'h1):(1'h0)]};
            end
          else
            begin
              reg13 <= $unsigned(wire2[(4'h8):(2'h2)]);
              reg14 <= ((&reg10) ?
                  (^((8'ha6) ?
                      $signed($signed(reg10)) : wire6[(4'he):(3'h5)])) : $signed({$unsigned((reg7 << wire4))}));
              reg15 <= (~^$unsigned((((reg13 | wire5) ?
                      wire4 : wire1[(5'h11):(2'h2)]) ?
                  ((wire0 ? wire1 : reg14) ?
                      $signed(reg14) : (wire1 & reg7)) : ({reg8, reg7} ?
                      (wire5 >>> wire4) : $unsigned(reg11)))));
              reg16 <= reg13[(2'h2):(2'h2)];
              reg17 <= wire0;
            end
        end
      else
        begin
          reg10 <= {{(^$unsigned(reg13[(2'h2):(1'h1)]))}};
        end
      if (({($signed((reg16 ? reg14 : wire5)) + wire0)} ~^ reg14))
        begin
          reg18 <= $signed((~&(reg14 * reg17)));
        end
      else
        begin
          reg18 <= ({wire1} ?
              ($signed({{reg14, reg10}}) <<< {{$unsigned((8'h9d))}}) : reg13);
          reg19 <= wire4;
          reg20 <= reg11;
          if ($unsigned((((&(!wire3)) ?
              (&$unsigned((8'had))) : $unsigned((wire1 >> wire6))) == reg13)))
            begin
              reg21 <= ($signed(($signed($signed(wire6)) ?
                  ((wire3 ?
                      reg19 : reg17) ~^ $signed(wire2)) : reg18[(4'hc):(1'h1)])) >> ($unsigned((reg18[(4'h8):(4'h8)] - ((8'ha9) ?
                      reg10 : reg14))) ?
                  $signed(((8'ha2) ^~ $unsigned(wire1))) : (reg18[(4'ha):(3'h5)] || ((reg8 ?
                          wire3 : wire0) ?
                      (reg12 ? wire5 : (8'h9d)) : wire0[(4'h8):(2'h3)]))));
              reg22 <= wire9;
            end
          else
            begin
              reg21 <= reg11;
              reg22 <= {(($unsigned(wire5[(4'h8):(3'h7)]) ?
                      (((8'hae) ? reg19 : reg15) >>> reg8) : {(~reg20),
                          (reg7 + reg10)}) ~^ $unsigned(((8'h9f) ?
                      (wire5 ^ reg15) : reg15[(1'h1):(1'h0)]))),
                  ((reg18[(4'h9):(2'h3)] ?
                      reg8[(1'h0):(1'h0)] : ($signed((8'ha3)) ?
                          (~^wire9) : ((8'hb2) ?
                              reg14 : (8'hae)))) <= $signed((((8'hb6) ?
                          reg13 : reg13) ?
                      {reg18, reg10} : $unsigned(reg21))))};
              reg23 <= (|(~(^(^~(^~wire2)))));
            end
          reg24 <= (~|((-$signed({(8'hb1), reg23})) && ((~&((8'hbd) ?
              reg18 : wire0)) <= {(^~wire6)})));
        end
      reg25 <= (+reg21[(4'h8):(2'h3)]);
      reg26 <= reg7[(3'h4):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg27 <= (reg24 ?
          ((reg8 ?
                  (|$unsigned(reg11)) : ((&wire2) ?
                      (reg21 ? (8'ha9) : reg21) : (~^reg23))) ?
              (+({wire6, reg11} ?
                  $signed(reg7) : $signed(reg7))) : (~|($signed(reg18) ?
                  (wire3 ?
                      wire4 : wire9) : (reg18 <= reg25)))) : ($signed({reg18,
              (8'hbc)}) | $unsigned($signed((&wire3)))));
      reg28 <= (!(+(!(reg21[(4'h9):(3'h7)] ?
          ((8'ha4) ? reg12 : reg14) : (reg17 ? reg26 : (8'hb9))))));
      reg29 <= (($signed({(wire5 ? (8'hb9) : wire9),
          (|reg21)}) ^ $signed((^~{(8'hb2)}))) && ({($signed(reg27) <<< $signed(reg25)),
          $unsigned(reg23[(4'hd):(1'h1)])} & (((~|reg11) ?
          $signed(wire1) : (reg19 ? reg24 : reg23)) >>> (reg17[(3'h5):(3'h5)] ?
          (reg28 || wire6) : (!wire3)))));
    end
  assign wire30 = ($unsigned(reg13[(2'h2):(2'h2)]) ?
                      (|$unsigned(reg8)) : ($unsigned($signed($signed(wire0))) ?
                          reg29 : reg28[(2'h2):(1'h0)]));
endmodule
