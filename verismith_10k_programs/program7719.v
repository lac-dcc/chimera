module top
#(parameter param45 = (((8'h9f) | ((~(^~(8'hac))) ? ((^(8'ha7)) ? ((8'haf) - (8'hbe)) : {(8'hb3), (8'hb8)}) : (((8'h9f) ? (8'hb6) : (8'hab)) ? (^~(8'haa)) : (&(8'ha9))))) ^ (!{(~(~&(8'hab))), (((8'hb8) ? (8'hbf) : (7'h41)) ? ((8'hb9) ? (8'ha2) : (8'hb8)) : {(8'haa)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire22,
                 wire21,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg36,
                 reg35,
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
                 (1'h0)};
  assign wire5 = wire2[(4'he):(1'h0)];
  assign wire6 = wire1;
  assign wire7 = {($unsigned(($signed(wire1) ^ ((8'hac) ?
                         (8'haa) : wire6))) <= ($unsigned(wire0[(4'h8):(1'h0)]) ?
                         (|$unsigned(wire0)) : wire6[(2'h3):(2'h3)])),
                     (|$signed(wire2))};
  assign wire8 = ((!wire0) ?
                     $signed($signed((^$unsigned(wire2)))) : {((~^(8'h9c)) * ({wire7,
                             wire2} < wire4[(1'h1):(1'h1)]))});
  always
    @(posedge clk) begin
      reg9 <= ((8'hbf) ?
          (wire3[(3'h7):(1'h1)] ?
              wire3[(1'h1):(1'h1)] : (-{(wire4 ^~ wire2),
                  $unsigned(wire1)})) : (8'hbe));
      if (wire6[(3'h5):(2'h2)])
        begin
          if ((+wire7))
            begin
              reg10 <= $signed($signed($signed(((wire0 ^ (7'h44)) | reg9[(4'ha):(4'ha)]))));
              reg11 <= ($signed((^~($unsigned(wire1) <<< (reg10 >= wire0)))) > (~^((wire5[(2'h2):(2'h2)] ~^ {wire2,
                      (8'hae)}) ?
                  ((8'haa) ?
                      wire1 : (reg10 ? wire4 : wire7)) : ((reg9 | wire4) ?
                      wire1 : wire3[(4'ha):(1'h1)]))));
              reg12 <= (wire5 ^~ (wire1 ?
                  reg10[(4'h9):(3'h6)] : (&((^reg9) ?
                      (wire2 ? reg10 : wire7) : (reg11 ? reg11 : reg10)))));
              reg13 <= ($unsigned(wire4[(3'h5):(2'h2)]) ~^ $signed($unsigned((wire3 == wire8[(3'h7):(3'h4)]))));
            end
          else
            begin
              reg10 <= reg13;
              reg11 <= $unsigned(wire4[(3'h4):(1'h0)]);
              reg12 <= $signed((^~wire5[(2'h2):(1'h1)]));
              reg13 <= $unsigned(((^(^$signed(wire8))) ?
                  $signed(wire8[(4'h8):(3'h5)]) : {wire7,
                      ((wire5 ? reg12 : reg9) >= $unsigned((8'hb1)))}));
            end
          if ($signed((((&$unsigned(wire7)) == (~^reg11)) >= {wire7})))
            begin
              reg14 <= $unsigned({{((wire2 ^ wire8) ?
                          (wire6 >>> reg9) : reg9[(4'h8):(3'h5)])},
                  $unsigned(wire2[(4'hb):(4'ha)])});
              reg15 <= $signed(((-(~{reg9,
                  reg9})) - $unsigned((!$signed(wire1)))));
              reg16 <= reg9[(5'h12):(1'h0)];
              reg17 <= reg11;
              reg18 <= ((-{reg14, (~|$unsigned(wire5))}) ?
                  (8'hba) : $unsigned({(!$signed(reg17)),
                      (wire3[(5'h11):(2'h3)] >= (wire5 ? reg15 : wire6))}));
            end
          else
            begin
              reg14 <= wire2;
              reg15 <= {wire6};
              reg16 <= (($unsigned({(wire7 ? wire6 : wire0),
                      (wire7 ? (8'h9f) : (8'hb0))}) ~^ $signed({{reg18},
                      ((8'hb9) << reg18)})) ?
                  $unsigned(((+(!reg18)) == reg14[(3'h7):(3'h4)])) : wire2[(1'h0):(1'h0)]);
              reg17 <= $signed(((~|(|wire2[(4'h9):(4'h9)])) ?
                  (wire1[(3'h5):(1'h0)] - $unsigned((reg14 ?
                      wire1 : reg18))) : (reg15 ?
                      reg14[(2'h3):(1'h0)] : wire0)));
            end
          reg19 <= (~$signed($unsigned($unsigned($unsigned((8'haf))))));
        end
      else
        begin
          if ({wire0})
            begin
              reg10 <= (~|reg11);
              reg11 <= $unsigned(wire0);
              reg12 <= {$unsigned(($unsigned(reg19[(3'h7):(1'h1)]) | reg11)),
                  (($unsigned(reg10[(1'h0):(1'h0)]) - reg13) >> $unsigned((+(reg9 || (8'ha2)))))};
              reg13 <= $signed(reg18);
            end
          else
            begin
              reg10 <= $signed(reg12[(2'h3):(1'h0)]);
              reg11 <= (reg16 ?
                  (~|$unsigned((~&reg17[(4'h8):(1'h1)]))) : {wire3[(5'h13):(3'h7)]});
              reg12 <= (wire2[(4'hd):(3'h7)] != reg9[(3'h7):(1'h0)]);
              reg13 <= $unsigned($signed(((~(reg17 <<< wire7)) > {(reg11 ?
                      wire5 : wire1),
                  {(8'hae)}})));
            end
          reg14 <= $signed($unsigned(reg9));
          reg15 <= (~&wire6[(3'h5):(1'h1)]);
          reg16 <= (($signed((8'ha9)) ~^ $signed({(wire4 ~^ reg15)})) ?
              $signed(reg12) : $unsigned((reg15[(3'h4):(1'h0)] ?
                  ((!reg12) & $unsigned(reg9)) : $signed((wire0 ~^ reg11)))));
          reg17 <= ((wire4 ?
                  $signed($unsigned((7'h42))) : $signed(($unsigned(reg17) >>> (reg16 ?
                      (8'h9f) : wire3)))) ?
              $unsigned((reg9 ~^ reg9)) : ({wire4[(3'h4):(2'h2)],
                      wire0[(3'h4):(3'h4)]} ?
                  reg18[(1'h1):(1'h0)] : wire2[(4'hb):(3'h7)]));
        end
      reg20 <= ($unsigned(reg19[(3'h5):(3'h4)]) ?
          ($unsigned({(reg18 ? reg9 : wire2)}) <= (((wire0 < reg17) * ((8'hb6) ?
              wire6 : reg18)) * (7'h40))) : (reg12 ?
              $unsigned(($unsigned(reg15) ?
                  reg13 : $signed(reg15))) : $signed(reg13[(3'h4):(2'h2)])));
    end
  assign wire21 = {reg11};
  assign wire22 = reg19[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg23 <= wire7[(4'he):(4'hc)];
      if ($unsigned($unsigned((^reg15[(4'hc):(2'h3)]))))
        begin
          reg24 <= ((reg12[(4'h8):(1'h1)] ^ $unsigned($signed((wire2 <= wire0)))) >> wire1);
          reg25 <= reg11[(1'h1):(1'h1)];
          reg26 <= $unsigned($signed($signed($unsigned(((8'hb8) ?
              reg10 : reg10)))));
          reg27 <= (((|(!((8'hb4) ? reg11 : reg15))) ?
                  $unsigned($signed((wire2 ?
                      (7'h40) : reg10))) : (-(reg10[(4'h8):(2'h3)] ?
                      reg19[(4'ha):(2'h3)] : wire0[(3'h6):(1'h1)]))) ?
              $unsigned($signed(reg15[(4'h9):(3'h7)])) : (reg13[(3'h4):(2'h3)] ?
                  $unsigned(reg20) : ((wire22[(4'hd):(2'h3)] ?
                      $signed(wire1) : (wire3 && wire5)) <= ((wire7 ^ reg18) != $signed(wire3)))));
          reg28 <= ($unsigned((reg12[(3'h7):(1'h0)] ?
                  ($unsigned(wire4) ? (wire5 ~^ wire7) : wire7) : reg13)) ?
              $unsigned((~|(~(8'hbb)))) : reg10[(1'h1):(1'h1)]);
        end
      else
        begin
          reg24 <= reg19[(4'hb):(3'h7)];
          reg25 <= (8'ha1);
        end
      reg29 <= reg23[(4'h8):(1'h1)];
      if ((!(($unsigned((wire1 ? (7'h41) : reg11)) <= (((8'ha9) ?
              reg10 : wire6) ?
          $unsigned(reg23) : reg23)) << wire3[(5'h11):(4'h9)])))
        begin
          reg30 <= $signed($signed(({{(8'hbb), (8'ha7)}} ?
              reg14[(4'hf):(4'hf)] : $unsigned($signed(reg11)))));
        end
      else
        begin
          reg30 <= wire7;
          reg31 <= ((wire21[(1'h0):(1'h0)] ?
              $unsigned(($signed((8'hb3)) ?
                  reg20 : (-reg30))) : reg11) < reg18);
          if ($signed($unsigned(reg29)))
            begin
              reg32 <= reg12[(4'h8):(2'h2)];
              reg33 <= ((($unsigned($signed(reg25)) >> (wire4[(2'h3):(1'h1)] ?
                      $unsigned(reg15) : (reg17 ?
                          reg17 : wire22))) >>> reg10[(4'h9):(3'h4)]) ?
                  (reg23[(3'h5):(2'h2)] ?
                      reg16[(2'h3):(1'h1)] : (((reg25 || (8'haa)) ?
                              (reg24 ? reg19 : reg30) : $unsigned(wire8)) ?
                          (~^reg15[(4'he):(4'hd)]) : reg26)) : wire2);
              reg34 <= {$unsigned(reg30)};
            end
          else
            begin
              reg32 <= reg18[(1'h0):(1'h0)];
              reg33 <= $unsigned(($unsigned(wire22[(2'h3):(1'h1)]) | reg29[(3'h6):(2'h3)]));
              reg34 <= reg23[(4'h9):(3'h7)];
            end
          reg35 <= {{{((reg18 ? reg20 : wire2) ?
                          wire21 : (wire0 || (8'hb9)))}}};
        end
      reg36 <= (~&$signed($unsigned((wire22 ?
          (wire22 ? reg14 : reg33) : (reg20 ? reg30 : wire5)))));
    end
  assign wire37 = wire6[(3'h4):(2'h2)];
  assign wire38 = reg35;
  assign wire39 = ((($signed($signed(reg20)) ?
                          (reg26[(1'h0):(1'h0)] ?
                              (reg17 + (7'h40)) : (reg18 | (8'ha7))) : reg32) - reg25[(4'hc):(1'h0)]) ?
                      $signed({((reg33 ? (8'hb8) : reg33) + (reg26 ^ wire22)),
                          wire5}) : ($unsigned(wire4) ?
                          (7'h40) : ((wire0[(3'h4):(1'h0)] != $unsigned(reg19)) ?
                              ((reg20 < reg23) ?
                                  {(8'h9d), reg15} : {(8'hbe),
                                      wire5}) : (-reg34))));
  assign wire40 = $signed((((^$signed(reg30)) == {wire38}) < reg32));
  assign wire41 = (($signed(($signed(wire8) ?
                      {wire39} : (wire38 ?
                          reg30 : wire1))) < (^~wire5[(3'h4):(1'h1)])) >>> reg26);
  assign wire42 = reg9;
  assign wire43 = $signed((((reg25[(2'h2):(1'h0)] != reg11) ?
                      $unsigned($unsigned(reg23)) : $signed((|reg9))) > {(^~$signed(reg30)),
                      $unsigned(wire4)}));
  assign wire44 = (^~$signed(wire4));
endmodule
