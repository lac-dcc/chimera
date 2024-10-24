module top
#(parameter param53 = {(8'h9d), (((((8'ha7) ? (8'hb1) : (8'hb9)) ? (-(8'ha5)) : ((8'h9f) && (8'hbb))) >= {((8'hb6) != (7'h41)), ((8'ha3) <= (8'hb2))}) <= (~|(((8'hb9) >= (8'hba)) ? (8'ha6) : ((8'hb6) != (8'hb4)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire52,
                 wire17,
                 wire16,
                 wire15,
                 wire12,
                 wire11,
                 wire10,
                 wire6,
                 wire5,
                 wire4,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
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
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg14,
                 reg13,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $unsigned(((^~$signed($unsigned(wire1))) + wire1[(4'hb):(2'h3)]));
  assign wire5 = wire2[(4'ha):(2'h2)];
  assign wire6 = wire5;
  always
    @(posedge clk) begin
      reg7 <= $signed(wire0);
      reg8 <= (reg7 ? (^$unsigned($signed(wire0))) : wire4);
      reg9 <= wire6;
    end
  assign wire10 = wire5[(1'h0):(1'h0)];
  assign wire11 = (wire1 * $unsigned((~|$signed({wire4, wire4}))));
  assign wire12 = {($signed(($signed(wire5) ?
                              (wire2 ^~ reg8) : wire1[(4'h9):(2'h3)])) ?
                          $signed($signed(reg7)) : {(reg8 ?
                                  $signed(wire1) : wire1),
                              $signed(wire4[(3'h7):(3'h4)])}),
                      wire1[(1'h1):(1'h1)]};
  always
    @(posedge clk) begin
      reg13 <= wire10;
      reg14 <= (wire12 ~^ {(&wire12)});
    end
  assign wire15 = $unsigned((|$unsigned(((~wire4) ?
                      $signed(reg13) : {wire2}))));
  assign wire16 = (-($unsigned(wire1[(1'h1):(1'h0)]) > (!(8'hb0))));
  assign wire17 = wire4[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg18 <= wire16;
      if ($unsigned((!reg18[(5'h10):(4'he)])))
        begin
          if ({($unsigned((-wire1[(4'ha):(4'h8)])) >> (|($signed(wire16) ?
                  wire1[(2'h2):(2'h2)] : (^~reg14)))),
              $unsigned(reg8[(1'h1):(1'h1)])})
            begin
              reg19 <= {$signed({$unsigned($signed((8'ha2)))})};
              reg20 <= ((({wire10[(3'h6):(2'h2)], $signed(reg19)} ?
                          (&((8'hb9) || reg13)) : ($unsigned(wire0) ?
                              (wire3 >= wire2) : (reg8 - wire4))) ?
                      wire0 : reg18) ?
                  wire0[(4'hb):(2'h3)] : (wire6[(4'hb):(3'h7)] ?
                      {$signed({reg9})} : wire1[(3'h6):(2'h2)]));
              reg21 <= wire17[(4'hb):(3'h4)];
              reg22 <= reg21;
              reg23 <= wire11;
            end
          else
            begin
              reg19 <= wire1[(3'h7):(1'h1)];
              reg20 <= $signed($unsigned(wire16[(4'hb):(3'h7)]));
              reg21 <= (($signed({((8'h9f) * wire15),
                      wire1}) ^~ (+$signed((wire0 ? (8'ha1) : reg19)))) ?
                  (~wire3) : {$signed($signed((wire12 != reg19)))});
              reg22 <= wire15[(3'h4):(2'h3)];
              reg23 <= ((({(wire3 ? wire4 : reg23), (8'hb2)} ~^ wire10) ?
                  $signed($unsigned($unsigned(wire5))) : (^wire3[(2'h2):(1'h1)])) & wire15);
            end
          reg24 <= {wire5};
          reg25 <= (({$unsigned((+wire5)), (8'ha0)} - ($signed((reg21 ?
              wire2 : reg19)) | (~&wire0))) || (|(((reg23 - reg13) ?
              ((8'hb5) > wire15) : $signed(reg7)) >> reg14[(4'h9):(3'h4)])));
          reg26 <= $signed(reg9);
          reg27 <= ((((wire0 ?
                      {(8'hb2), reg23} : $unsigned(reg7)) <= ($signed(reg14) ?
                      (~^reg9) : {reg21})) ?
                  wire6 : ((^~(-reg8)) ? reg21 : (~^(wire3 & reg23)))) ?
              {{wire1[(2'h2):(1'h1)]}} : (+reg21));
        end
      else
        begin
          reg19 <= wire6;
          if ({$signed(((~|((7'h43) ? wire2 : reg18)) >> (^~wire4))),
              $unsigned(reg9[(1'h0):(1'h0)])})
            begin
              reg20 <= $signed({$signed((+reg24)), reg13[(1'h1):(1'h1)]});
            end
          else
            begin
              reg20 <= $signed($signed(wire4[(4'he):(4'h8)]));
              reg21 <= (~reg14[(4'ha):(4'h8)]);
              reg22 <= reg14;
              reg23 <= (wire2 ?
                  $unsigned(reg18[(4'hc):(4'h8)]) : $signed($signed(wire3[(1'h0):(1'h0)])));
            end
          reg24 <= $unsigned(({$signed(wire3)} ?
              reg27[(4'hc):(1'h1)] : wire4[(3'h4):(1'h0)]));
        end
      reg28 <= {(8'ha6)};
      reg29 <= reg27;
      reg30 <= $unsigned({reg14[(4'ha):(1'h0)]});
    end
  always
    @(posedge clk) begin
      reg31 <= wire17[(3'h4):(2'h2)];
      if ($unsigned((!reg25[(3'h5):(3'h4)])))
        begin
          reg32 <= $signed(wire15);
        end
      else
        begin
          reg32 <= ((-(wire12 ?
                  (wire12[(2'h3):(2'h2)] + $signed(reg23)) : $signed(reg23))) ?
              (reg23 ?
                  wire10[(3'h5):(1'h0)] : reg28[(1'h0):(1'h0)]) : $unsigned(reg27));
          reg33 <= (8'hbb);
          reg34 <= wire6;
          if (reg7[(4'h8):(3'h5)])
            begin
              reg35 <= ({wire12[(2'h3):(2'h2)]} ?
                  reg8[(4'ha):(3'h7)] : reg26[(3'h6):(3'h5)]);
              reg36 <= reg28[(2'h2):(2'h2)];
            end
          else
            begin
              reg35 <= $signed((-($unsigned(wire6[(4'hc):(4'h9)]) ?
                  (~|(reg33 * (8'ha2))) : (wire12[(4'hc):(2'h3)] ?
                      ((8'hbe) ^~ reg26) : wire6[(4'ha):(3'h5)]))));
              reg36 <= ($unsigned((((reg14 ? (8'ha9) : reg19) ?
                          (+reg22) : (reg13 || (8'ha6))) ?
                      $unsigned(reg21[(2'h3):(1'h1)]) : {reg31[(4'h8):(2'h2)]})) ?
                  $unsigned((^((+reg36) & $signed(wire2)))) : (reg25[(1'h0):(1'h0)] ?
                      wire12 : $signed($unsigned(reg9))));
              reg37 <= $unsigned(reg9);
              reg38 <= wire2[(2'h2):(2'h2)];
            end
        end
      if ($signed(((((reg25 >= reg34) ?
          wire3 : $signed(reg33)) | reg13) | (^~((|reg31) ?
          (8'hac) : reg25[(5'h13):(5'h13)])))))
        begin
          if ({(&reg36)})
            begin
              reg39 <= (^reg32);
              reg40 <= wire0;
              reg41 <= (wire6[(2'h3):(2'h3)] >> (^($signed($signed(wire5)) ^ ((reg37 ?
                  wire4 : reg13) > ((8'hbf) ? reg26 : reg39)))));
              reg42 <= $unsigned($signed((($unsigned(wire10) ?
                  wire15[(5'h13):(5'h11)] : (8'ha6)) ^ {$signed((8'hb0)),
                  (reg19 << reg38)})));
              reg43 <= reg23;
            end
          else
            begin
              reg39 <= ($signed(((~(reg40 - wire17)) - (-reg9[(3'h4):(1'h1)]))) ?
                  (~|(^~wire1)) : $signed(((-$unsigned((8'ha7))) ?
                      reg39 : ({reg40} - reg33[(4'he):(4'hd)]))));
              reg40 <= {$signed(reg23),
                  $signed((-((wire2 && wire12) ?
                      (reg24 ? (8'hb1) : wire16) : ((7'h40) <<< wire5))))};
              reg41 <= ((!reg21[(1'h0):(1'h0)]) + ($signed((((8'haf) ?
                      wire4 : reg43) <<< (wire1 >> reg30))) ?
                  ((reg25[(2'h2):(1'h1)] ?
                      (-reg7) : (reg22 ?
                          wire6 : wire10)) <= $unsigned($unsigned(reg18))) : (~|(|reg13[(3'h5):(1'h0)]))));
              reg42 <= reg34[(2'h3):(2'h3)];
              reg43 <= wire17;
            end
          reg44 <= (wire2[(4'hc):(2'h3)] ?
              reg42[(2'h3):(1'h0)] : $signed(((reg9 ?
                  (-reg22) : $signed(wire4)) >= $signed($signed(wire6)))));
          if ((($unsigned($signed($signed(wire5))) ?
                  $unsigned(wire0[(4'hd):(4'ha)]) : $signed($unsigned((reg21 ?
                      reg23 : reg33)))) ?
              ({($unsigned(reg34) ^ reg13[(1'h1):(1'h1)]),
                      $unsigned(wire12[(2'h2):(1'h1)])} ?
                  ((reg8 <<< (wire15 ? reg28 : reg8)) ?
                      (-reg38[(3'h4):(2'h3)]) : reg9) : (&$signed($unsigned(reg7)))) : wire2[(4'h8):(3'h4)]))
            begin
              reg45 <= (8'hab);
              reg46 <= ($signed((^~reg41)) >>> {(~reg31)});
              reg47 <= wire11;
            end
          else
            begin
              reg45 <= (8'hb4);
            end
        end
      else
        begin
          reg39 <= reg14;
          if ({($unsigned($unsigned(reg45)) ?
                  reg29[(1'h0):(1'h0)] : (~(^~$unsigned(reg22))))})
            begin
              reg40 <= $signed(((($signed(reg45) >>> (~wire5)) >> {reg28[(1'h0):(1'h0)]}) ?
                  $signed(reg13[(2'h2):(1'h1)]) : $unsigned(reg19[(3'h4):(1'h0)])));
              reg41 <= $signed(wire12[(4'hd):(1'h1)]);
              reg42 <= $unsigned(reg32[(1'h0):(1'h0)]);
              reg43 <= ((&{(((8'ha4) <<< reg21) ?
                      (+reg38) : ((8'hbf) ? reg39 : reg19)),
                  (|(^~reg39))}) == $unsigned(wire5));
              reg44 <= {((^(^{(8'h9c), wire16})) ?
                      $unsigned((+(reg42 ?
                          reg41 : wire17))) : reg21[(1'h1):(1'h0)])};
            end
          else
            begin
              reg40 <= (~(&reg27[(5'h11):(3'h5)]));
              reg41 <= $unsigned($unsigned((((8'ha7) ?
                  wire6[(3'h5):(2'h2)] : (^~wire17)) * wire16)));
              reg42 <= (reg37[(1'h1):(1'h0)] ?
                  $unsigned(wire0) : (~|(reg8[(4'h8):(2'h2)] << $signed((reg34 << reg26)))));
              reg43 <= ($signed((wire15[(5'h13):(3'h5)] < (~^(~|wire17)))) >= $signed((((reg26 ?
                          wire12 : (8'hb1)) ?
                      (|reg22) : reg46[(2'h2):(2'h2)]) ?
                  ((reg45 <<< reg31) ?
                      wire6[(4'h9):(2'h2)] : $unsigned(wire3)) : $unsigned((|reg20)))));
              reg44 <= ({$unsigned({$unsigned((8'ha8))})} ?
                  (&$unsigned((8'ha4))) : ((~&(~|{reg24})) & (reg34[(3'h4):(1'h1)] ?
                      $unsigned((reg30 ? reg33 : reg24)) : wire12)));
            end
          reg45 <= ({$unsigned((^~(wire10 * wire5)))} ?
              (reg44[(5'h12):(4'h8)] ?
                  (&$signed($signed(reg35))) : (^~{(wire16 ? reg24 : (8'h9f)),
                      (reg46 ? reg30 : reg33)})) : {$signed({$unsigned(reg19),
                      reg26})});
          if ($signed((reg40 ^~ (wire12 ?
              $signed(reg23[(1'h1):(1'h0)]) : $unsigned((~|wire17))))))
            begin
              reg46 <= (~|$signed(((~^reg34[(2'h2):(2'h2)]) < ($signed(reg8) > reg43))));
              reg47 <= $signed({wire12, wire15});
              reg48 <= $signed($unsigned({(|((8'haa) && reg36))}));
              reg49 <= $signed(($signed((reg46[(4'hd):(3'h4)] == reg35[(5'h11):(3'h4)])) != (reg7 <= (+(reg31 ?
                  reg9 : reg42)))));
            end
          else
            begin
              reg46 <= ($signed($unsigned(({reg20} * (^reg9)))) ?
                  wire1[(3'h6):(1'h0)] : (reg46 != (reg22[(1'h1):(1'h1)] >= ((reg23 ?
                      reg23 : (8'ha2)) || (reg37 ? wire4 : reg28)))));
              reg47 <= (~|(^reg39));
              reg48 <= (|$unsigned($unsigned((~&(^(8'ha3))))));
            end
        end
      reg50 <= (((reg29 * wire10[(4'h8):(3'h5)]) ?
              (^~($unsigned((7'h42)) ?
                  $unsigned(wire6) : (reg35 ?
                      (8'h9c) : reg21))) : reg23[(2'h3):(2'h2)]) ?
          (!(reg26[(4'hf):(4'hd)] < wire16[(4'he):(4'ha)])) : $unsigned({reg20}));
      reg51 <= reg41[(4'ha):(3'h6)];
    end
  assign wire52 = reg37[(5'h13):(4'hc)];
endmodule
