module top
#(parameter param35 = (-(((((8'ha6) ? (8'hb8) : (8'haa)) | {(7'h43), (8'hbf)}) ? (~(!(8'hb2))) : (((8'ha0) ? (8'haf) : (8'hbe)) ? (~&(8'hb7)) : (-(8'haf)))) >>> (~&{{(8'hb7), (8'hac)}}))), 
parameter param36 = (param35 & {param35}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire4,
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
  assign wire4 = (-(+$unsigned($signed(wire0))));
  always
    @(posedge clk) begin
      if ({wire1[(2'h3):(2'h3)]})
        begin
          reg5 <= wire3;
          reg6 <= $unsigned((^(($unsigned(wire0) ?
              $unsigned(wire4) : $signed((7'h42))) < $signed((|wire1)))));
          if ({(($unsigned((&wire0)) ?
                  (~$unsigned((8'hb6))) : (~$unsigned(wire4))) > ((reg5[(4'h8):(3'h4)] == $unsigned(wire4)) ?
                  $unsigned(reg5[(5'h13):(4'hf)]) : {(wire4 ^ wire4)})),
              (8'ha8)})
            begin
              reg7 <= ($unsigned($signed(reg5[(5'h11):(4'ha)])) ?
                  (8'h9c) : $unsigned(($unsigned((8'ha5)) ?
                      wire3[(3'h6):(3'h4)] : (~(wire0 * wire4)))));
              reg8 <= {(~|wire4[(5'h10):(4'he)]), {(~|(+{wire4, wire0}))}};
              reg9 <= $signed($unsigned(wire2));
              reg10 <= (+wire4);
            end
          else
            begin
              reg7 <= (&((($unsigned(reg6) && ((8'ha2) ^ reg5)) ?
                      (&(^(7'h42))) : reg5[(1'h1):(1'h0)]) ?
                  wire4 : wire2));
              reg8 <= {wire3,
                  ((+reg8) ?
                      (wire3[(3'h7):(1'h1)] ?
                          $unsigned($signed(reg8)) : wire3[(4'hf):(1'h0)]) : $signed($signed((~|reg5))))};
            end
          reg11 <= (|reg6);
        end
      else
        begin
          reg5 <= $unsigned(wire0[(4'h8):(4'h8)]);
        end
      reg12 <= $unsigned((((&wire3) ^ ($signed(wire4) ?
          $signed(reg6) : $signed(wire0))) && (({(8'ha8), reg11} ?
          wire0[(5'h11):(4'ha)] : $signed(wire3)) < ((^~reg8) ?
          {wire0} : (reg9 ? reg7 : wire0)))));
      reg13 <= (^~reg9);
      if ({reg12[(2'h3):(1'h0)],
          ($signed($signed($signed(reg12))) ~^ (reg7[(3'h6):(1'h0)] ?
              {((8'ha2) ? (8'hb7) : wire4)} : {reg9[(4'hf):(2'h3)]}))})
        begin
          reg14 <= reg11;
          reg15 <= ((^~wire2) ?
              ((wire4 + wire1) ?
                  (reg9[(5'h14):(1'h0)] << reg8[(3'h7):(2'h3)]) : wire3[(3'h6):(1'h1)]) : (&$unsigned(((wire1 << reg9) ?
                  (8'ha6) : {reg5, (8'ha4)}))));
          if ({{$signed(reg6)}, {(wire2 << reg14[(4'ha):(1'h1)])}})
            begin
              reg16 <= $signed({$unsigned((reg8 ^~ reg13)),
                  ($signed((&(8'haa))) | (~|((8'ha7) << (8'ha6))))});
            end
          else
            begin
              reg16 <= $unsigned($signed(wire1[(4'h9):(1'h1)]));
              reg17 <= (reg11[(3'h4):(3'h4)] >= reg11);
            end
          reg18 <= (reg5 ?
              (^(reg9 ?
                  (8'had) : reg10[(1'h0):(1'h0)])) : reg12[(4'h9):(3'h5)]);
        end
      else
        begin
          if ((&(wire1[(2'h2):(1'h0)] ?
              $signed(reg9[(4'he):(3'h4)]) : ($signed($signed(reg8)) ?
                  $signed((reg11 ? reg7 : (8'hbc))) : $unsigned(reg16)))))
            begin
              reg14 <= (!reg15[(1'h0):(1'h0)]);
              reg15 <= $signed($signed($signed(((reg13 ?
                  reg6 : reg9) <<< $unsigned(reg5)))));
              reg16 <= $unsigned($unsigned((-$signed({(8'hb1)}))));
            end
          else
            begin
              reg14 <= wire2;
              reg15 <= wire0;
              reg16 <= ($signed((!wire3)) * $signed(reg17[(2'h2):(1'h1)]));
              reg17 <= ($signed(($unsigned(reg11) ?
                  wire4 : reg7[(4'h8):(3'h4)])) ^~ wire2[(5'h10):(1'h0)]);
              reg18 <= (wire3 >>> wire2);
            end
          reg19 <= (|((($unsigned(reg18) < ((8'hb5) & reg10)) ?
                  ($unsigned(reg16) ?
                      {(7'h43), reg11} : (reg12 ?
                          wire3 : reg12)) : ((~^reg9) != (wire3 == (8'hab)))) ?
              $unsigned(wire1) : reg15[(1'h1):(1'h1)]));
          if (reg18[(4'ha):(1'h0)])
            begin
              reg20 <= (^(~$unsigned($signed(wire3[(3'h6):(3'h6)]))));
              reg21 <= $unsigned((-(({reg16, reg18} ?
                  (reg20 ?
                      wire2 : (8'hb0)) : $signed((8'hb8))) ^ $unsigned($signed((8'ha4))))));
              reg22 <= (-(($unsigned(((7'h43) < wire3)) ?
                      $signed((reg12 | reg14)) : reg15) ?
                  (((~^reg16) ? $unsigned(reg20) : (!reg11)) ?
                      reg16[(4'h9):(4'h8)] : {(reg15 ^~ reg10),
                          reg12}) : wire3[(4'he):(4'he)]));
            end
          else
            begin
              reg20 <= ($signed($unsigned((~^(~^(8'ha3))))) ?
                  reg8 : {($signed(reg21[(1'h1):(1'h0)]) ?
                          ({reg6} ?
                              (|(8'haf)) : (reg8 ?
                                  reg22 : wire1)) : $unsigned(wire2[(5'h13):(3'h5)])),
                      (($signed(reg13) >> (8'hae)) ~^ $signed((^~reg7)))});
            end
          reg23 <= ({wire3, $signed(reg6)} >>> (+$signed({(reg11 ?
                  reg10 : reg15),
              (reg9 ? reg6 : reg11)})));
          if (((reg10 ?
                  {(reg6[(4'h9):(3'h6)] ?
                          (~|(8'ha0)) : (reg15 ? reg16 : reg22))} : (8'hb0)) ?
              (reg20[(4'hb):(1'h0)] ?
                  $signed(reg22[(1'h0):(1'h0)]) : ((reg18[(3'h5):(1'h1)] != (reg6 ?
                          reg6 : reg13)) ?
                      (wire4[(4'hd):(2'h2)] || ((8'ha8) != reg12)) : (~^$unsigned(reg8)))) : $signed($signed({$signed((7'h41))}))))
            begin
              reg24 <= (8'ha1);
              reg25 <= (|(($signed((+reg14)) ?
                      $signed((reg5 >>> (7'h40))) : (~(wire4 || reg7))) ?
                  reg16 : reg6));
              reg26 <= {(reg10 - wire4)};
            end
          else
            begin
              reg24 <= ($signed(reg16) ? reg20 : reg16);
              reg25 <= $unsigned(((~&$unsigned((~^(8'ha2)))) <<< $unsigned(wire4[(4'hd):(3'h5)])));
              reg26 <= $signed(($signed({reg5[(4'h9):(2'h2)]}) == reg23));
            end
        end
    end
  assign wire27 = $signed(((+reg19[(2'h2):(1'h0)]) ?
                      wire0[(4'hb):(3'h6)] : reg19[(2'h3):(1'h0)]));
  assign wire28 = ((~&$signed($unsigned((~^reg7)))) ?
                      (8'hb3) : (!reg12[(5'h11):(5'h11)]));
  assign wire29 = {($unsigned((wire28[(5'h11):(4'h9)] ?
                          (~^(8'hb1)) : (~reg5))) ~^ $signed(reg23))};
  assign wire30 = (|$unsigned(((reg5[(2'h3):(1'h0)] ?
                      reg23 : (~|reg11)) * ((&reg8) ?
                      $unsigned(reg8) : ((7'h42) ? (7'h43) : reg16)))));
  assign wire31 = wire1[(3'h4):(2'h2)];
  assign wire32 = $signed(wire27);
  assign wire33 = (~^reg23);
  assign wire34 = (~|$unsigned(wire1));
endmodule
