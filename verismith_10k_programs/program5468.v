module top
#(parameter param37 = (^(^~{(((8'ha8) ? (7'h41) : (8'h9f)) ? {(8'hb3), (8'hb2)} : (~&(8'ha8))), (((8'hb9) ? (7'h43) : (8'ha5)) ^~ ((8'ha1) ? (7'h43) : (8'ha0)))})), 
parameter param38 = param37)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg36,
                 reg35,
                 reg34,
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
      if (wire1)
        begin
          reg5 <= (wire3[(2'h2):(2'h2)] || ((^~(^~$unsigned(wire2))) >> {wire4[(1'h1):(1'h0)]}));
          if ($signed(((((+wire2) ?
              $signed(wire1) : (wire0 != wire1)) * wire4) || reg5)))
            begin
              reg6 <= (($unsigned(((+wire3) + $unsigned((8'ha2)))) == $unsigned(wire3[(3'h7):(3'h6)])) ?
                  wire0 : wire0[(3'h6):(1'h1)]);
              reg7 <= {((^$unsigned(((8'hb0) > wire3))) > $signed(wire4))};
            end
          else
            begin
              reg6 <= (~|(reg5 << wire4[(1'h0):(1'h0)]));
            end
          if (wire0[(4'h9):(3'h6)])
            begin
              reg8 <= $unsigned(((((reg7 ?
                      (8'hb1) : wire3) ^ wire2[(4'hc):(4'h8)]) ?
                  (~$unsigned(wire2)) : reg6) < reg6));
              reg9 <= $signed($signed(wire4));
            end
          else
            begin
              reg8 <= $signed((((&(|wire3)) ?
                  $unsigned(wire2[(1'h1):(1'h0)]) : $signed((~&wire3))) >= reg5));
              reg9 <= ({($signed($signed(reg5)) ?
                          $signed((~^reg5)) : ((wire3 ?
                              reg5 : wire4) <<< wire4[(1'h1):(1'h1)])),
                      (($unsigned(reg7) ?
                          (~reg6) : (!(8'hb1))) != $signed($unsigned(wire2)))} ?
                  $signed(reg8[(4'ha):(3'h7)]) : $signed($unsigned($signed((reg8 ?
                      reg9 : reg7)))));
            end
          reg10 <= (wire1 - $signed(reg6[(4'hc):(2'h3)]));
          reg11 <= wire1[(1'h0):(1'h0)];
        end
      else
        begin
          reg5 <= reg8;
          reg6 <= $signed(reg8[(2'h3):(2'h3)]);
        end
      reg12 <= $unsigned(reg9);
      if (({((wire1 ?
              (reg5 ?
                  wire4 : (8'hb4)) : $signed(reg10)) + $unsigned(wire2[(3'h4):(2'h3)])),
          {reg6, {(reg12 ? wire1 : reg6), reg8}}} + {(8'hbb)}))
        begin
          reg13 <= $unsigned(reg11);
          reg14 <= $signed(((8'h9f) ~^ $unsigned({(~^reg11), $signed(reg9)})));
          reg15 <= $unsigned((((&{wire0, reg14}) != (~&(reg11 ~^ wire1))) ?
              ((8'ha5) ?
                  reg10 : (~&$unsigned((8'haa)))) : reg7[(4'he):(3'h4)]));
          reg16 <= {reg9, $unsigned(reg13)};
          if (reg6[(3'h7):(3'h7)])
            begin
              reg17 <= $unsigned(reg9);
              reg18 <= $signed(wire2);
            end
          else
            begin
              reg17 <= ($signed(reg14) >> $unsigned(((&{(7'h42), wire1}) ?
                  {((8'hab) ^~ wire0)} : (+(reg18 & wire0)))));
            end
        end
      else
        begin
          reg13 <= ($unsigned((|(wire3[(1'h0):(1'h0)] || $signed(reg5)))) <<< wire4[(1'h0):(1'h0)]);
          reg14 <= (8'hbe);
          if (reg9[(2'h2):(2'h2)])
            begin
              reg15 <= {((-($signed(wire3) * $unsigned(reg15))) ?
                      (reg16 ?
                          (+$unsigned(reg17)) : ((~^reg10) ?
                              (reg17 | reg17) : (8'ha2))) : {reg11[(3'h6):(3'h4)]}),
                  $signed($unsigned({$signed(wire3), reg18[(3'h5):(3'h4)]}))};
              reg16 <= $signed((8'ha8));
            end
          else
            begin
              reg15 <= reg8[(2'h2):(1'h1)];
              reg16 <= reg13[(4'hf):(2'h2)];
              reg17 <= ({(reg6 ^~ $signed((reg10 != wire3)))} - $unsigned((($unsigned(reg7) ?
                      (reg6 ? wire1 : wire3) : $unsigned(reg10)) ?
                  $signed((wire0 ^ reg7)) : ((^~wire3) ?
                      (~&wire2) : $unsigned(reg5)))));
              reg18 <= (($unsigned($signed({reg10})) ?
                  reg15[(1'h0):(1'h0)] : wire3[(3'h7):(1'h1)]) && $unsigned(wire0[(3'h7):(3'h4)]));
              reg19 <= (^({(reg16 > (8'ha1))} ?
                  $signed(((reg18 ? reg6 : reg16) ?
                      ((8'hb9) ?
                          reg5 : reg12) : reg13[(3'h4):(3'h4)])) : (wire1 >>> (8'ha9))));
            end
          reg20 <= $unsigned(((~$signed((^reg14))) + (8'hae)));
          reg21 <= wire0[(3'h6):(3'h4)];
        end
      reg22 <= $signed({((reg9[(3'h4):(1'h1)] + (reg12 || reg19)) ?
              reg21[(5'h10):(4'h8)] : wire1[(1'h1):(1'h0)])});
      reg23 <= $unsigned(wire2[(3'h4):(2'h2)]);
    end
  assign wire24 = ($signed(($signed((reg5 ^ reg18)) <<< (((8'hb9) ?
                          reg5 : wire2) ?
                      ((7'h41) ?
                          (8'h9d) : wire3) : reg17))) >>> ((~|({(7'h41)} ?
                          (+reg11) : (8'h9c))) ?
                      $unsigned(reg21[(5'h12):(4'hb)]) : reg10[(2'h3):(1'h0)]));
  assign wire25 = $signed((reg6 >>> (-{$unsigned(wire1)})));
  assign wire26 = (^~wire1);
  assign wire27 = (~|wire1);
  assign wire28 = $signed(($signed((reg13[(4'hd):(4'h9)] ?
                      (reg15 ? reg20 : reg12) : (reg18 ?
                          wire1 : wire1))) | ($signed((^~reg15)) ?
                      $unsigned((-reg17)) : wire4[(2'h3):(1'h0)])));
  assign wire29 = {(reg13 == $unsigned($signed((~^wire2))))};
  assign wire30 = reg7;
  assign wire31 = (wire27[(4'ha):(3'h4)] || wire2[(3'h7):(3'h5)]);
  assign wire32 = $unsigned({$signed($unsigned((reg21 ? reg18 : reg19))),
                      reg12[(1'h0):(1'h0)]});
  assign wire33 = (+$unsigned((8'hb4)));
  always
    @(posedge clk) begin
      reg34 <= reg14[(2'h3):(1'h0)];
      reg35 <= {$unsigned($signed($unsigned({wire32, wire0}))), reg16};
      reg36 <= ((reg17[(2'h3):(1'h1)] ?
              $signed($unsigned((8'hb0))) : ((^~(reg35 ?
                  reg19 : (8'h9f))) ~^ reg17[(3'h5):(1'h0)])) ?
          ($unsigned(wire27[(2'h2):(1'h1)]) ?
              (({reg20} ?
                  (wire28 ?
                      wire0 : reg13) : (reg21 || reg34)) >> wire2[(4'h9):(1'h0)]) : $signed($signed((|reg12)))) : $signed(reg9[(2'h3):(2'h2)]));
    end
endmodule
