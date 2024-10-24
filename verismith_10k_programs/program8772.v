module top
#(parameter param38 = ((((|((8'hab) ? (8'hb8) : (8'hb3))) ^~ (((8'hbd) ? (8'ha7) : (8'ha1)) ? ((8'hbe) ? (8'hba) : (8'hbe)) : ((8'ha7) >>> (7'h41)))) ? (+{(~|(8'h9e))}) : (((^(8'ha6)) ? ((7'h40) <<< (8'hbf)) : (&(8'h9f))) ? (((8'h9c) * (8'ha3)) ? (&(8'haa)) : ((8'hb5) - (8'h9e))) : (8'hb2))) > {(~&(^((8'hae) <<< (8'hb2))))}), 
parameter param39 = ((~^((~&(param38 ? param38 : param38)) ? param38 : (8'hb4))) ? (!((~(param38 ? param38 : param38)) ? (-(param38 >= param38)) : param38)) : (+(((^~(8'hb7)) && (-param38)) ? param38 : ((param38 < param38) ? (8'h9e) : (param38 ^ (8'hb0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire20,
                 wire19,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
                 (1'h0)};
  assign wire4 = ({wire0} ?
                     $signed($signed(((~^wire0) ?
                         (wire0 ?
                             wire2 : wire2) : $unsigned(wire2)))) : $signed(wire3[(3'h7):(1'h1)]));
  assign wire5 = ($signed(((wire3 <= (wire3 || wire4)) + wire4)) ?
                     wire1[(1'h1):(1'h1)] : wire1);
  assign wire6 = $unsigned((8'h9f));
  assign wire7 = (wire5[(3'h4):(2'h3)] ? wire4 : wire2[(4'h9):(3'h5)]);
  always
    @(posedge clk) begin
      reg8 <= wire4[(1'h1):(1'h0)];
    end
  assign wire9 = $signed(((+wire1[(3'h5):(3'h5)]) ?
                     $signed({$unsigned(wire5),
                         ((8'h9e) ?
                             wire6 : wire0)}) : ((wire5[(3'h4):(3'h4)] != {wire0,
                             wire3}) ?
                         (wire4[(1'h1):(1'h0)] ?
                             (-wire1) : $unsigned(wire6)) : ($signed(wire4) ?
                             (!wire5) : $signed((8'hbd))))));
  always
    @(posedge clk) begin
      reg10 <= wire6;
      reg11 <= $unsigned((-({wire3[(2'h2):(1'h0)], wire9[(2'h3):(1'h0)]} ?
          (~$unsigned(wire0)) : $signed({reg10, wire3}))));
      if ($signed($signed((wire4[(5'h11):(4'hc)] ?
          (!(^~wire7)) : ((wire2 <<< wire0) ?
              (wire7 ? wire5 : reg10) : $unsigned(reg11))))))
        begin
          reg12 <= ((wire3[(3'h5):(3'h5)] ?
                  ($signed(reg8) ?
                      wire2 : ((wire9 != (8'hbe)) ?
                          ((8'had) ?
                              wire9 : reg11) : wire5[(3'h6):(2'h3)])) : ((~&(wire9 ?
                          reg8 : reg8)) ?
                      $signed((^wire2)) : $signed({reg11}))) ?
              ($signed((8'hae)) ?
                  wire6 : $signed((!{wire7, wire2}))) : $signed(wire7));
          reg13 <= reg8[(3'h4):(3'h4)];
        end
      else
        begin
          if ($unsigned((({wire4[(1'h1):(1'h1)]} | (~^(wire1 * reg13))) == (reg12 ?
              ($unsigned(wire6) ?
                  (wire7 ? wire7 : reg13) : ((8'hbc) ?
                      wire5 : (8'hb7))) : wire3[(3'h4):(2'h2)]))))
            begin
              reg12 <= (~|$signed({({wire9, reg12} ~^ (reg11 | wire6))}));
              reg13 <= ({wire1[(4'h8):(1'h1)],
                  $signed(wire1[(1'h0):(1'h0)])} == (~&(~|wire9[(3'h5):(3'h5)])));
              reg14 <= (wire5[(2'h3):(1'h1)] ?
                  $signed(($signed((~^wire1)) ?
                      ({wire3} != ((8'h9f) ?
                          wire6 : wire3)) : $signed((wire3 * wire5)))) : reg13[(3'h4):(2'h2)]);
              reg15 <= (8'hb6);
              reg16 <= reg12[(2'h2):(1'h1)];
            end
          else
            begin
              reg12 <= {(~^$unsigned(wire6[(4'hc):(3'h6)]))};
              reg13 <= wire1;
              reg14 <= ((~$signed($unsigned(wire9))) ?
                  (~|{reg11}) : (&$signed((wire5 != (reg10 * wire5)))));
              reg15 <= (|($unsigned(wire0[(5'h10):(1'h0)]) >> wire7[(2'h3):(2'h2)]));
            end
        end
      reg17 <= reg15[(2'h3):(1'h0)];
      reg18 <= (&$unsigned($signed(($unsigned((8'hac)) ?
          (~^wire9) : $signed(wire3)))));
    end
  assign wire19 = ($unsigned($unsigned(((8'had) ?
                      (wire6 > (8'hbd)) : reg10))) != (-(~&(~|(+wire3)))));
  assign wire20 = wire9;
  always
    @(posedge clk) begin
      reg21 <= (reg16[(1'h0):(1'h0)] ?
          {($signed((reg12 ?
                  wire1 : wire9)) >>> wire5[(4'h8):(2'h2)])} : ((8'hb5) & $unsigned((~^wire20[(2'h2):(2'h2)]))));
      if (((reg17[(3'h4):(2'h3)] ?
              ((reg10 ~^ $unsigned(reg10)) || wire6) : $unsigned($unsigned({reg21}))) ?
          $unsigned($signed(reg14)) : (~^$unsigned((wire3[(4'h8):(2'h2)] ?
              (wire2 - (7'h43)) : (^wire0))))))
        begin
          reg22 <= $unsigned(((~^$unsigned(reg8[(3'h7):(1'h1)])) ?
              ((wire3 && reg14[(2'h3):(1'h1)]) ?
                  $unsigned($signed(wire7)) : wire6) : ($signed(reg12[(4'hb):(4'h9)]) && (!wire6))));
          if ((($signed((&$signed(wire9))) ?
                  reg13 : ((!reg17[(3'h5):(1'h0)]) ? wire5 : {(7'h42)})) ?
              reg22[(2'h3):(1'h1)] : $unsigned({{$signed(reg10), (~reg18)},
                  ($signed(wire7) * (reg10 <= wire3))})))
            begin
              reg23 <= wire7;
              reg24 <= ({$unsigned(wire7[(2'h2):(2'h2)]), wire0} ?
                  $signed(reg17) : reg16[(1'h1):(1'h0)]);
              reg25 <= (~&reg11);
              reg26 <= $signed((+((!{wire5}) ?
                  wire2[(4'ha):(2'h3)] : (8'h9c))));
            end
          else
            begin
              reg23 <= (reg25[(3'h4):(3'h4)] ~^ wire6[(5'h11):(5'h11)]);
              reg24 <= (-$unsigned($signed(reg10[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg22 <= $signed($unsigned(reg10));
          reg23 <= $signed(wire20);
          reg24 <= ($signed(reg18) << $signed((^(&(|(8'hac))))));
          reg25 <= ($unsigned(wire7) <<< wire19[(5'h12):(3'h4)]);
        end
    end
  always
    @(posedge clk) begin
      reg27 <= $unsigned(reg11[(4'hb):(3'h4)]);
      reg28 <= $unsigned($signed((($signed(reg22) ?
          $unsigned(reg21) : wire7[(2'h3):(1'h0)]) ~^ ((reg18 >>> reg13) ?
          (~|wire7) : $unsigned(reg14)))));
      reg29 <= reg14;
    end
  assign wire30 = wire7;
  assign wire31 = (~wire4);
  assign wire32 = wire19;
  assign wire33 = $unsigned(wire0);
  assign wire34 = reg17;
  assign wire35 = (&wire33[(2'h2):(2'h2)]);
  assign wire36 = (~&($signed($signed((reg10 >>> reg26))) >= wire2));
  assign wire37 = wire34[(5'h11):(4'he)];
endmodule
