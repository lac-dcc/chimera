module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire50;
  assign y = {wire55, wire54, wire53, wire52, wire50, (1'h0)};
  module5 #() modinst51 (.wire9(wire4), .wire8(wire0), .wire7(wire2), .clk(clk), .wire6(wire1), .wire10(wire3), .y(wire50));
  assign wire52 = ((^~(((wire4 ? wire50 : wire3) ?
                          wire4 : $unsigned(wire2)) == ({wire0} & $unsigned(wire4)))) ?
                      {$unsigned(($unsigned(wire2) << $signed(wire0)))} : wire1);
  assign wire53 = (~^(|$signed(wire1)));
  assign wire54 = $unsigned((7'h40));
  assign wire55 = $signed($unsigned((((wire1 ? (7'h41) : wire53) ?
                          wire52 : (wire2 <= wire53)) ?
                      $unsigned(wire50) : ($unsigned(wire2) ?
                          (wire1 ? wire2 : wire3) : wire53[(2'h2):(1'h0)]))));
endmodule

module module5
#(parameter param49 = {((~(((8'ha0) <= (8'hab)) ? ((8'hb4) ? (8'hb9) : (8'hb0)) : (-(8'h9d)))) ? (({(7'h43)} & (~|(8'h9e))) >> (((8'hb2) <<< (8'hb0)) ? {(8'hb5), (8'ha6)} : {(8'ha1)})) : ({((8'haa) ? (8'hae) : (8'hb8)), ((8'hb2) ? (8'ha5) : (8'hbd))} ? (|{(8'h9f), (8'hb8)}) : (((8'hb4) << (8'ha9)) ? {(7'h44)} : {(8'hbe), (8'h9c)}))), {((((8'haa) != (8'hbb)) + (8'hab)) ? (+{(8'ha6)}) : (~^{(8'hb0)}))}})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire11;
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire35,
                 wire11,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg34,
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
                 (1'h0)};
  assign wire11 = wire10[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned((8'h9f)))
        begin
          reg12 <= (^wire6);
          if ((|wire7[(3'h5):(1'h1)]))
            begin
              reg13 <= (8'ha6);
            end
          else
            begin
              reg13 <= $unsigned(wire11);
              reg14 <= (!(^$signed({$unsigned(wire8)})));
            end
          reg15 <= $unsigned((~reg12));
          reg16 <= {((((wire8 ^ reg15) != wire9[(4'h8):(1'h0)]) << (8'hb6)) ?
                  $signed($unsigned((-wire8))) : wire10),
              (($unsigned((~|wire6)) >= (~|(reg13 ? wire7 : (8'hb8)))) ?
                  (((&wire10) ? $signed(reg13) : wire11) ?
                      {$unsigned(reg14),
                          (wire8 ?
                              wire8 : reg14)} : ((^~wire8) ^~ reg14[(4'he):(4'hc)])) : ((~&$unsigned((8'hbb))) ?
                      $unsigned((~|wire6)) : ($unsigned(wire11) ?
                          $signed(wire10) : (reg15 + wire9))))};
        end
      else
        begin
          if (reg14[(2'h2):(1'h0)])
            begin
              reg12 <= ($unsigned($unsigned(reg13)) ?
                  $signed(($unsigned({wire9, reg15}) ?
                      (reg14[(3'h6):(3'h4)] < ((8'hae) >>> wire9)) : ((reg14 ~^ reg12) ?
                          wire7 : $signed(reg13)))) : {(((reg15 ?
                          reg15 : wire9) >= wire8[(2'h3):(1'h1)]) & ($signed(wire11) ?
                          (~wire7) : $signed((8'h9d))))});
              reg13 <= $unsigned(reg14[(4'hf):(4'h8)]);
              reg14 <= ((wire7 != $unsigned(reg16[(2'h2):(2'h2)])) > $unsigned((~&(|$unsigned(wire11)))));
              reg15 <= (wire8 == ($signed({(~&reg15),
                  {wire11,
                      reg15}}) | $signed($unsigned(reg12[(2'h3):(2'h3)]))));
              reg16 <= ((wire9[(4'h8):(2'h2)] ?
                  {wire6[(3'h6):(3'h6)],
                      (reg15[(3'h7):(2'h2)] ?
                          reg12[(4'hb):(3'h7)] : (!reg16))} : ({{reg13,
                              reg16}} ?
                      $signed(reg15) : (wire8 ?
                          (wire9 ?
                              reg16 : wire6) : $signed(reg12)))) | $signed($unsigned((~|$unsigned((8'h9d))))));
            end
          else
            begin
              reg12 <= ((((8'hb3) && $signed($signed((8'ha7)))) ?
                      (8'ha6) : {reg12,
                          ((reg12 ~^ (8'hbe)) ?
                              $unsigned(reg14) : $signed(wire7))}) ?
                  (({$signed(wire7), {reg12, reg12}} < wire8) ?
                      (&{$unsigned(wire11),
                          $unsigned(reg14)}) : reg15) : {(~($signed(reg12) >= ((8'hbc) || wire6))),
                      $signed(((wire10 ? reg16 : reg16) ?
                          {reg12, wire7} : (reg16 ? wire9 : reg14)))});
              reg13 <= (({(wire9[(1'h1):(1'h1)] ?
                          (~^wire10) : wire8[(4'ha):(3'h7)]),
                      (wire8 ? $signed(reg15) : (^reg16))} ?
                  ((~|$unsigned(wire6)) ?
                      (reg13 || $signed(wire7)) : $unsigned($unsigned(reg13))) : wire9[(4'hc):(2'h3)]) & (~^wire7[(4'he):(3'h5)]));
              reg14 <= (((~|(wire9[(4'h8):(4'h8)] ^ reg16[(4'hf):(4'h8)])) ?
                  wire10 : wire7[(4'he):(4'he)]) * (reg15[(4'hc):(3'h6)] >> {wire11[(4'hd):(4'h9)],
                  ($signed(wire10) ? $signed(wire6) : $signed(wire11))}));
              reg15 <= {reg15[(4'hc):(3'h6)]};
              reg16 <= ($unsigned(wire9) ?
                  $signed(((^$signed(wire10)) <<< reg15)) : $unsigned({(reg16[(4'hf):(2'h2)] ?
                          (~^wire11) : $unsigned(wire10)),
                      $signed((~^wire6))}));
            end
          reg17 <= wire6[(1'h1):(1'h0)];
          reg18 <= ((^~{((wire10 ? wire6 : wire7) ?
                  (reg15 ?
                      reg16 : reg17) : $unsigned(wire7))}) > $unsigned($unsigned((~|wire9[(2'h2):(1'h0)]))));
          reg19 <= (8'ha2);
        end
      reg20 <= $signed(wire9[(3'h7):(3'h7)]);
    end
  always
    @(posedge clk) begin
      if ((((reg17[(2'h3):(2'h3)] ?
          $signed(reg17) : ($signed(wire10) ?
              (~reg12) : (~|wire6))) ^ $unsigned((|wire7[(5'h14):(4'h9)]))) <= $signed((+wire10))))
        begin
          reg21 <= $signed((reg14[(3'h6):(1'h0)] ?
              (reg12 ? reg12[(1'h1):(1'h0)] : (~^reg15)) : {((reg12 ?
                      wire7 : wire9) || reg16[(1'h0):(1'h0)])}));
          reg22 <= $unsigned({{$unsigned(wire9),
                  $unsigned(reg19[(2'h3):(2'h2)])}});
          reg23 <= (+(~^($signed((wire9 && wire9)) >= (-reg14[(3'h5):(2'h3)]))));
          reg24 <= $signed((reg22[(2'h2):(1'h0)] ?
              (|($unsigned(reg16) > (reg23 ?
                  reg13 : (8'ha8)))) : $signed($unsigned($unsigned(wire7)))));
        end
      else
        begin
          reg21 <= wire6[(2'h3):(2'h2)];
          reg22 <= $signed((^~(({reg19, wire7} ?
              (8'had) : reg19) <= reg15[(4'h8):(1'h1)])));
          reg23 <= $signed($signed((^~($unsigned(reg23) ?
              (reg15 != reg24) : reg18[(4'hb):(3'h6)]))));
        end
      reg25 <= reg22;
      reg26 <= (8'h9e);
      if (($signed({$signed($unsigned(reg23)), $signed(reg19[(3'h6):(2'h3)])}) ?
          reg21[(4'hb):(4'h9)] : (8'h9d)))
        begin
          reg27 <= reg18[(4'ha):(3'h5)];
          reg28 <= reg14;
          reg29 <= $unsigned(reg27);
          if (reg25[(4'ha):(3'h5)])
            begin
              reg30 <= reg16[(1'h1):(1'h1)];
              reg31 <= (reg23 * $unsigned(reg21));
              reg32 <= (~$signed($signed($signed(reg25))));
            end
          else
            begin
              reg30 <= ((~|$unsigned({$unsigned(reg16)})) | ($unsigned((!(reg25 - (8'hba)))) ?
                  (+($signed((8'h9f)) ?
                      (reg28 & (7'h41)) : (reg31 ~^ reg32))) : ($signed((reg26 ?
                          wire9 : reg18)) ?
                      wire7 : ((|wire9) & reg31))));
              reg31 <= reg23[(1'h1):(1'h0)];
              reg32 <= (reg12[(4'hb):(3'h6)] - ($unsigned($unsigned((|reg19))) >> (~|$signed(reg30))));
            end
        end
      else
        begin
          if ({reg17[(2'h2):(1'h1)], ($unsigned($signed(reg28)) - reg28)})
            begin
              reg27 <= {reg19[(4'hb):(2'h2)],
                  $unsigned(((~$signed(wire11)) > reg30))};
              reg28 <= ($signed(($signed((~^reg28)) ?
                  ((reg31 ? wire11 : reg32) ?
                      $signed(reg22) : (wire6 ?
                          reg29 : reg17)) : (~|$unsigned((8'hab))))) ~^ (wire9[(4'hb):(4'hb)] ?
                  $signed({$unsigned(reg22)}) : (|(|wire6))));
            end
          else
            begin
              reg27 <= ((-$unsigned($unsigned((+(8'hba))))) ?
                  (reg30 == (($signed(reg14) ?
                      $unsigned((8'hba)) : reg18[(2'h2):(2'h2)]) + $unsigned(((8'hae) ?
                      wire9 : reg25)))) : (^~(reg24[(3'h4):(1'h1)] ?
                      ((reg13 ? reg16 : reg26) ^ {reg28}) : reg29)));
              reg28 <= reg29;
              reg29 <= (reg21 ?
                  ((-$signed(reg12[(3'h4):(2'h2)])) | ($signed((wire9 ?
                      (8'hbc) : reg13)) >>> $unsigned((reg29 && wire9)))) : reg12[(1'h1):(1'h0)]);
              reg30 <= reg32;
            end
          reg31 <= $signed(wire7[(4'h8):(1'h1)]);
          reg32 <= ((~|{(~|reg31)}) <<< ($unsigned((reg25[(4'hc):(4'h8)] ?
              $signed(reg13) : reg19[(2'h2):(1'h1)])) != (reg21[(4'h8):(2'h3)] ?
              $signed((reg22 ? wire11 : (8'haa))) : (~reg14[(1'h1):(1'h0)]))));
          reg33 <= (($signed((^{reg16, reg18})) ?
                  {reg32, reg31} : reg28[(3'h6):(2'h3)]) ?
              reg26 : (~^((~wire8) ? reg15 : reg30[(3'h5):(1'h0)])));
        end
      reg34 <= $unsigned($signed((&$unsigned($signed(reg15)))));
    end
  assign wire35 = $unsigned(wire10);
  always
    @(posedge clk) begin
      reg36 <= reg33[(3'h4):(2'h3)];
      if (reg33)
        begin
          reg37 <= {($signed((|$unsigned(reg21))) ^~ (wire10[(3'h4):(2'h3)] ?
                  (~(reg31 ? reg34 : reg12)) : wire6[(3'h6):(2'h3)])),
              $signed({(|$unsigned(reg21))})};
          reg38 <= {$unsigned($unsigned($unsigned($signed(wire35))))};
          reg39 <= ({(&(reg33 ~^ ((8'hb6) >= reg26))),
              reg38} << (~^reg14[(2'h3):(2'h3)]));
          if (($unsigned($unsigned($signed($signed((8'hb6))))) ?
              $unsigned(reg33) : (($unsigned((~reg28)) ^ (reg22 ?
                      $unsigned(reg33) : $unsigned((8'hb4)))) ?
                  reg36[(4'hd):(3'h4)] : (((|reg20) | (reg32 ^ reg34)) || {(reg23 > wire35)}))))
            begin
              reg40 <= (!(|(^~(reg27[(2'h2):(1'h0)] ?
                  (reg18 ? wire6 : (8'hb5)) : $unsigned(reg15)))));
              reg41 <= $unsigned($signed(reg21));
              reg42 <= {$signed((reg29[(1'h1):(1'h0)] > $unsigned(reg37)))};
              reg43 <= wire9[(3'h5):(1'h0)];
            end
          else
            begin
              reg40 <= (8'ha7);
              reg41 <= (reg12 ?
                  (reg30 == ((8'haa) ?
                      (&(reg26 <= reg33)) : ($signed(wire7) <= reg12))) : $unsigned({((~|(8'hbf)) | {reg12,
                          reg21}),
                      (&$signed(reg15))}));
            end
          reg44 <= (~|reg32[(1'h1):(1'h0)]);
        end
      else
        begin
          if ($signed(reg19[(2'h3):(2'h3)]))
            begin
              reg37 <= reg37[(4'hd):(3'h5)];
            end
          else
            begin
              reg37 <= (((((reg38 >= reg22) >> $unsigned(reg15)) & (wire9[(4'hd):(4'hc)] ?
                      reg42 : (reg19 * (8'ha4)))) | reg40[(5'h12):(4'hc)]) ?
                  (reg39[(4'hd):(4'hc)] ?
                      ($signed((~reg34)) << $signed(wire11)) : ($signed(reg24[(1'h0):(1'h0)]) <<< ((!reg28) < (~reg37)))) : $signed((reg27 != reg36)));
              reg38 <= (!reg18);
              reg39 <= {$unsigned(reg21[(3'h4):(1'h1)]), reg13};
            end
          reg40 <= {reg17,
              ((wire35[(1'h0):(1'h0)] ?
                      {$unsigned(reg36)} : (^~((8'ha0) ? reg27 : wire6))) ?
                  $signed((-((8'hae) - reg43))) : $unsigned($signed({reg14,
                      reg12})))};
          if ((((((wire9 < reg34) == reg25[(3'h6):(1'h1)]) * $unsigned(reg31[(2'h3):(1'h1)])) || $unsigned((reg18[(5'h15):(5'h12)] ^ $unsigned(wire6)))) > ($unsigned($unsigned(wire10[(3'h4):(2'h3)])) ?
              (|$signed(((8'hbe) ?
                  reg29 : reg12))) : $signed(((~wire10) ^~ reg23)))))
            begin
              reg41 <= wire11[(1'h1):(1'h1)];
              reg42 <= (reg25 ?
                  (^(reg34[(4'ha):(1'h1)] ?
                      reg29 : (wire10[(1'h0):(1'h0)] >= (~|reg31)))) : ($signed((reg13[(3'h4):(1'h1)] ?
                          {reg31, reg31} : (~|reg14))) ?
                      reg44[(1'h0):(1'h0)] : (~reg31[(2'h2):(1'h0)])));
              reg43 <= reg37[(2'h2):(1'h0)];
            end
          else
            begin
              reg41 <= (~^{(8'ha3), (|(~|(reg33 ? reg18 : reg24)))});
              reg42 <= $signed((!(({reg23} ?
                  (|reg40) : reg44[(1'h0):(1'h0)]) < $signed((-reg43)))));
            end
          reg44 <= ((($unsigned((^reg23)) < $signed($unsigned(reg31))) > reg24[(3'h4):(1'h1)]) ?
              reg43[(4'h8):(2'h3)] : {reg31[(2'h3):(2'h3)],
                  (reg33[(2'h2):(1'h0)] ? $unsigned((^~reg43)) : (-{reg17}))});
          reg45 <= reg39;
        end
    end
  assign wire46 = {($signed(((~reg27) ?
                              wire8[(3'h4):(2'h2)] : $unsigned((8'ha3)))) ?
                          reg37 : $signed((reg27[(1'h1):(1'h0)] << reg30[(4'hf):(3'h7)])))};
  assign wire47 = ($unsigned($signed((reg36[(3'h5):(1'h0)] | reg28[(3'h4):(1'h0)]))) ~^ (reg42 ?
                      (!(reg14[(4'ha):(4'ha)] ?
                          $unsigned(reg40) : $unsigned(reg22))) : $unsigned((^(reg34 ?
                          reg12 : wire35)))));
  assign wire48 = reg24;
endmodule
