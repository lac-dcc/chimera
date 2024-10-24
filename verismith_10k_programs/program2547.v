module top
#(parameter param39 = (-(+((^~((8'hb6) * (8'h9e))) == (^~((8'hb6) >>> (7'h42)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2[(2'h3):(2'h3)];
      if (wire2)
        begin
          reg5 <= wire2;
          reg6 <= (wire2 ? wire3 : reg5);
          reg7 <= (~|wire3[(2'h2):(2'h2)]);
          reg8 <= (((~{$signed(reg7), (wire3 > wire0)}) ?
                  (~&(~&reg4)) : {reg7, wire0[(4'h9):(3'h7)]}) ?
              $unsigned(($unsigned($unsigned((8'hbe))) < {$signed(reg5),
                  {(8'ha2),
                      wire3}})) : (wire3 & (reg6[(1'h1):(1'h0)] >> reg6)));
        end
      else
        begin
          reg5 <= (reg8 ? wire0 : {$unsigned({reg7[(3'h6):(3'h5)]})});
          reg6 <= ((^~(^~reg5[(4'h9):(2'h2)])) ?
              ($signed(reg8) >> $unsigned((~^$unsigned(wire3)))) : wire1[(3'h6):(2'h2)]);
        end
      if (reg4[(3'h7):(1'h1)])
        begin
          reg9 <= $unsigned(wire1[(3'h6):(3'h6)]);
        end
      else
        begin
          reg9 <= reg6;
          reg10 <= (wire0[(3'h7):(3'h7)] && reg4[(3'h6):(3'h4)]);
          reg11 <= $unsigned((wire2 ?
              $unsigned((|wire1[(3'h4):(3'h4)])) : ({$signed(reg8)} ?
                  (!(~&wire1)) : (reg4 >> $unsigned(wire1)))));
        end
      reg12 <= $signed($signed(wire2));
      if (reg8)
        begin
          reg13 <= $signed(reg11);
          reg14 <= $unsigned($unsigned({reg4[(1'h1):(1'h0)]}));
          reg15 <= $unsigned(reg10);
          reg16 <= $signed((+(reg5 && $signed(reg5[(4'h9):(1'h0)]))));
        end
      else
        begin
          reg13 <= {$signed(wire1[(3'h7):(1'h0)])};
        end
    end
  always
    @(posedge clk) begin
      reg17 <= ((8'had) > ($signed(reg13[(4'he):(4'h8)]) >> (8'hb6)));
      reg18 <= $signed(reg5[(4'hb):(4'hb)]);
      reg19 <= $unsigned({$signed($unsigned((~|reg8))),
          ((reg6 ^ (~wire0)) ^~ reg10[(3'h4):(1'h0)])});
      if ($signed(reg8[(3'h7):(3'h5)]))
        begin
          reg20 <= $signed($unsigned(reg17));
        end
      else
        begin
          reg20 <= (~^(^~$unsigned(((~|(8'hbb)) & $signed(reg5)))));
          if ((wire2[(3'h7):(2'h3)] >>> ($signed(($signed((8'h9e)) && reg19[(3'h5):(3'h4)])) ?
              (-($unsigned(wire1) <= reg4)) : {reg18[(4'hd):(3'h5)]})))
            begin
              reg21 <= $signed((^~(&((reg17 ? reg10 : reg4) < $signed(reg4)))));
            end
          else
            begin
              reg21 <= {(~^reg14), (wire1 & $signed((~(reg7 && reg16))))};
              reg22 <= ((($unsigned(reg6) ?
                      (reg11 ?
                          reg13[(4'h9):(2'h2)] : (reg4 ?
                              (8'haf) : reg6)) : ((reg4 >> reg5) & $unsigned(wire2))) ?
                  (reg20[(1'h1):(1'h0)] ?
                      ({reg5,
                          reg16} ~^ (wire2 > (8'ha2))) : $signed((reg4 << reg20))) : $signed(((!reg21) ?
                      {reg20} : wire3))) && (reg20[(2'h2):(1'h1)] ?
                  (($unsigned(reg20) ? (reg10 ? reg4 : (8'h9d)) : (7'h42)) ?
                      reg11 : reg21[(3'h4):(1'h0)]) : reg12));
              reg23 <= (^$unsigned((|($signed(reg20) ?
                  (reg15 <<< reg8) : $unsigned((8'hb2))))));
              reg24 <= $signed(wire2);
            end
          reg25 <= (8'hbe);
        end
      reg26 <= (^$signed(reg11[(4'hc):(3'h7)]));
    end
  assign wire27 = $signed($signed($unsigned({$unsigned(reg6)})));
  assign wire28 = $unsigned((reg5 ~^ ($unsigned((&reg7)) ?
                      ((!reg6) >>> $unsigned(reg23)) : $signed((reg20 == wire0)))));
  assign wire29 = (~(&((~&(reg13 != reg4)) ?
                      reg8[(4'h9):(3'h4)] : $signed((&reg16)))));
  assign wire30 = (~|(&(&wire2[(3'h4):(2'h3)])));
  assign wire31 = ((^(^reg6)) & (&{reg10[(3'h7):(2'h2)]}));
  assign wire32 = $unsigned(reg25);
  assign wire33 = ((~|(($unsigned(reg6) ?
                          reg26[(4'ha):(2'h2)] : $unsigned(reg21)) << $unsigned((reg13 < reg12)))) ?
                      (8'had) : $signed({reg26}));
  assign wire34 = {$unsigned((((wire32 ?
                          wire31 : wire30) != (^(8'hb5))) ^ (!(reg21 + reg23))))};
  assign wire35 = reg17;
  assign wire36 = (((($signed(reg5) ? {wire2} : {reg16, reg24}) <<< reg10) ?
                      $unsigned(($unsigned((8'hbe)) ?
                          $signed((7'h40)) : reg21)) : wire33) == wire34);
  assign wire37 = {$signed($unsigned({$unsigned(reg10)}))};
  assign wire38 = ($unsigned($unsigned($signed($unsigned(wire30)))) || wire37[(5'h10):(4'he)]);
endmodule
