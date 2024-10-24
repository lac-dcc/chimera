module top
#(parameter param29 = ({{(((8'ha6) * (7'h44)) ? ((8'hb0) << (7'h44)) : (~^(8'h9f))), (^~(+(7'h43)))}, (|((-(8'h9d)) ? ((8'hb7) == (8'hb5)) : ((7'h42) ? (8'ha2) : (8'h9e))))} > {((!((8'hb8) == (8'hb9))) >> ((~(8'hbc)) | ((7'h42) << (8'hb8)))), ((((8'ha3) ? (7'h43) : (8'hb6)) >>> ((8'hbd) ^~ (8'hba))) ? ((|(8'hab)) ? ((8'ha7) ? (8'hb1) : (8'hbc)) : ((8'ha5) ? (7'h43) : (8'ha5))) : (((7'h43) - (8'hb9)) ? (-(8'had)) : (-(8'ha0))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = $unsigned(wire3[(2'h2):(2'h2)]);
  assign wire5 = ((+$signed(wire4[(4'hb):(4'ha)])) ?
                     wire1 : $unsigned($signed(((~wire2) ?
                         {wire1, wire4} : {wire4, wire4}))));
  assign wire6 = (8'ha3);
  assign wire7 = (~wire1);
  always
    @(posedge clk) begin
      if (wire3[(3'h4):(2'h2)])
        begin
          reg8 <= wire1;
          reg9 <= {$unsigned(($unsigned($signed((8'ha9))) ? (^wire4) : wire4))};
          reg10 <= wire3;
          reg11 <= ($signed($unsigned(({reg9} ~^ wire1))) ?
              $signed($unsigned(wire7[(4'he):(3'h4)])) : (($signed((!wire5)) ?
                  $signed((reg10 ?
                      wire1 : reg8)) : wire6) == (^~$unsigned({wire1}))));
          reg12 <= wire2;
        end
      else
        begin
          reg8 <= {($unsigned(wire5[(4'h9):(4'h9)]) >> reg8)};
          if ($signed($unsigned(((!wire0[(1'h0):(1'h0)]) & {wire1[(3'h7):(2'h3)]}))))
            begin
              reg9 <= wire1[(4'h9):(3'h4)];
              reg10 <= $signed((~(wire5[(2'h2):(1'h1)] || (reg10 ?
                  reg10[(3'h5):(2'h2)] : $signed(wire6)))));
              reg11 <= ({$signed($signed($unsigned(reg11)))} ?
                  wire7 : (((~&((8'hb9) ? reg8 : wire1)) ?
                          $unsigned($unsigned(wire1)) : wire0[(3'h5):(1'h0)]) ?
                      wire4[(3'h7):(2'h3)] : wire7[(4'he):(4'hd)]));
              reg12 <= $unsigned($unsigned(reg10[(1'h0):(1'h0)]));
            end
          else
            begin
              reg9 <= wire1[(3'h4):(1'h1)];
              reg10 <= (|wire2);
              reg11 <= $unsigned($signed($unsigned(wire1[(4'hb):(1'h1)])));
              reg12 <= {reg8[(3'h5):(2'h2)]};
              reg13 <= $unsigned($unsigned($signed(($signed(reg10) == {reg11,
                  wire3}))));
            end
          if ({(~&$signed(wire6)), $unsigned(reg10[(2'h2):(1'h0)])})
            begin
              reg14 <= (^wire2[(1'h1):(1'h1)]);
              reg15 <= (~&(8'haa));
            end
          else
            begin
              reg14 <= wire4[(1'h0):(1'h0)];
              reg15 <= {($signed((&(reg15 ^ wire6))) == $signed(((reg15 ?
                          (8'hb2) : reg15) ?
                      ((8'hac) ? wire2 : wire4) : (wire1 ? wire1 : reg12))))};
              reg16 <= $unsigned((-(7'h42)));
            end
          if (($unsigned($signed($unsigned((reg11 + wire2)))) > (|reg11)))
            begin
              reg17 <= wire2[(3'h6):(2'h3)];
              reg18 <= (reg10 ? reg16 : (8'hb6));
            end
          else
            begin
              reg17 <= (({$signed(reg16[(1'h1):(1'h0)])} == wire4[(4'hc):(1'h0)]) ?
                  ($unsigned((reg18 <<< (reg11 ^~ wire3))) ^ ($unsigned($signed(reg10)) ~^ wire5)) : reg10[(3'h5):(1'h0)]);
              reg18 <= wire2;
              reg19 <= ($signed(reg15) ?
                  (&reg18) : ({(^~$signed(reg13)), reg17} ?
                      wire0[(2'h2):(1'h0)] : ({$unsigned((8'hb5)),
                              $unsigned(wire7)} ?
                          ({reg8, wire0} ?
                              ((8'hbe) ? reg11 : (8'hac)) : (reg10 ?
                                  (8'ha0) : wire3)) : wire1[(3'h7):(3'h4)])));
              reg20 <= (wire4 ?
                  $unsigned($unsigned(reg10)) : ({(reg15 ? reg8 : {wire0}),
                          (~|$signed(reg10))} ?
                      $signed((~^reg17)) : (8'hb0)));
              reg21 <= wire1[(2'h3):(1'h1)];
            end
        end
      reg22 <= $signed((((~^(reg9 ^~ wire6)) ?
              $signed($signed(wire6)) : ((8'hba) ?
                  $unsigned(wire0) : $signed(wire1))) ?
          (!$unsigned((reg14 ? reg13 : reg15))) : (&(&reg19))));
      reg23 <= ({(((reg17 ? reg17 : reg22) ?
              {reg22, reg20} : (7'h44)) == (wire6 || {reg12})),
          reg18[(1'h1):(1'h1)]} | reg10[(4'hc):(2'h3)]);
      reg24 <= reg22[(2'h3):(1'h1)];
      if ($signed(((reg24[(3'h5):(3'h4)] <<< reg14[(1'h1):(1'h0)]) ?
          (8'h9c) : (reg10 < (8'ha0)))))
        begin
          reg25 <= (|$unsigned((7'h43)));
          reg26 <= ((+wire2[(3'h6):(2'h2)]) ?
              $signed(reg23[(3'h7):(3'h7)]) : reg11);
        end
      else
        begin
          if (($unsigned((((reg13 >= reg22) ?
                      (8'hbb) : (reg26 ? wire7 : reg24)) ?
                  ($signed(reg20) ?
                      (reg8 ? reg12 : reg20) : (-reg20)) : (8'hbd))) ?
              {($signed($signed(reg23)) ?
                      $unsigned($unsigned(wire3)) : $signed((!(8'ha5))))} : ((8'hac) ?
                  ((~&(reg14 ?
                      reg25 : reg18)) | reg12) : $signed($unsigned((reg21 ?
                      wire7 : reg22))))))
            begin
              reg25 <= $unsigned(wire5[(1'h1):(1'h0)]);
              reg26 <= wire5[(4'h9):(4'h9)];
              reg27 <= ($signed(($unsigned(wire5[(4'hb):(3'h7)]) | $signed((!reg18)))) ?
                  {(~&wire7[(4'ha):(3'h6)])} : ($unsigned($signed(((8'had) != reg25))) ?
                      (reg23 ?
                          $signed($signed(reg16)) : $signed($unsigned(reg10))) : ($unsigned((reg24 ?
                              wire7 : (7'h42))) ?
                          ($unsigned(reg26) ?
                              (^(8'ha4)) : $unsigned(wire1)) : $signed($unsigned(reg18)))));
            end
          else
            begin
              reg25 <= reg25;
              reg26 <= $unsigned((8'h9f));
              reg27 <= ($unsigned($unsigned(reg22[(4'h8):(3'h4)])) ?
                  $unsigned(reg9[(3'h6):(3'h5)]) : $unsigned(wire5[(3'h6):(1'h1)]));
              reg28 <= $signed(reg23[(4'ha):(4'h8)]);
            end
        end
    end
endmodule
