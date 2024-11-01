module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = ((|((|(-wire4)) ^ $signed(wire2))) | (~$signed($signed((+wire0)))));
  assign wire6 = $signed($signed(wire5[(1'h0):(1'h0)]));
  assign wire7 = (wire1 ? $unsigned(wire2) : $unsigned(wire2));
  always
    @(posedge clk) begin
      if ($unsigned((wire0 || wire7[(1'h1):(1'h1)])))
        begin
          if (((($unsigned({(8'h9c)}) << {wire4, $unsigned(wire7)}) ?
                  {wire0[(2'h2):(1'h0)]} : {{$unsigned((8'hb8)),
                          (wire3 ? wire0 : wire4)},
                      ((wire3 >> wire7) <<< $signed((8'hb4)))}) ?
              ($signed(wire6) ?
                  wire5 : wire4[(1'h1):(1'h0)]) : (wire4[(3'h5):(2'h3)] ?
                  (wire4[(2'h3):(2'h3)] * ($unsigned(wire1) ?
                      $signed(wire0) : $signed(wire1))) : ((wire3[(1'h0):(1'h0)] == wire6) ?
                      (((7'h42) ? wire7 : wire7) - {wire6}) : (wire2 ?
                          wire1[(1'h0):(1'h0)] : wire1[(1'h0):(1'h0)])))))
            begin
              reg8 <= $unsigned(((($signed(wire7) == (wire5 ?
                      wire7 : wire7)) ~^ ($signed(wire6) ?
                      wire0[(5'h10):(4'hf)] : wire5[(3'h5):(2'h3)])) ?
                  wire7 : wire3[(1'h0):(1'h0)]));
              reg9 <= (wire7[(1'h0):(1'h0)] ?
                  {reg8[(4'he):(3'h5)],
                      {((wire2 | reg8) == (~|wire7))}} : $unsigned($unsigned((+(reg8 >= reg8)))));
              reg10 <= $signed(wire4[(3'h5):(2'h3)]);
              reg11 <= ({wire7, $signed(wire0)} != (~|($unsigned({wire7,
                  wire0}) ^~ (^(8'hb7)))));
            end
          else
            begin
              reg8 <= {(wire3[(3'h4):(3'h4)] ?
                      wire4[(3'h7):(3'h6)] : {((wire5 ~^ reg11) * $signed(reg11)),
                          ($signed(wire7) <<< (reg9 ? wire5 : wire7))})};
              reg9 <= (((|wire1[(1'h0):(1'h0)]) ?
                  {(wire4 | $unsigned((8'hb1)))} : (reg10 <<< (&$signed(wire5)))) || (!(^~($unsigned(wire6) >>> $signed(reg10)))));
              reg10 <= $signed($unsigned((8'hb7)));
              reg11 <= wire3;
            end
          reg12 <= $signed({{$unsigned((wire3 >> wire0))},
              (&(wire7[(4'h9):(2'h3)] ? wire7 : (reg9 ? wire1 : wire7)))});
        end
      else
        begin
          if ($unsigned((8'h9d)))
            begin
              reg8 <= $signed((wire6[(2'h3):(1'h1)] ?
                  $unsigned(wire2[(4'h8):(3'h5)]) : reg10[(3'h5):(1'h0)]));
              reg9 <= {(&(^~wire0[(5'h14):(5'h14)])),
                  (^($unsigned((|reg10)) >>> wire1))};
            end
          else
            begin
              reg8 <= wire7[(3'h6):(2'h2)];
              reg9 <= wire6[(3'h5):(1'h0)];
              reg10 <= (&$unsigned(reg11[(1'h1):(1'h0)]));
              reg11 <= ((^(|{wire7[(4'h8):(2'h2)]})) <= wire0[(3'h5):(3'h4)]);
              reg12 <= $signed(wire3);
            end
          reg13 <= $signed(wire0[(3'h4):(2'h3)]);
          reg14 <= $unsigned({$unsigned(wire5[(1'h0):(1'h0)]), wire1});
          reg15 <= $signed($unsigned((8'h9c)));
        end
      if ($signed(wire6))
        begin
          reg16 <= ((reg12[(1'h1):(1'h1)] >> (^{wire6[(4'hd):(3'h6)]})) & (^reg13));
          if ($unsigned((|($signed(wire3[(3'h7):(3'h7)]) && $unsigned((wire3 ?
              (7'h44) : wire5))))))
            begin
              reg17 <= $signed($unsigned($signed($signed((reg16 ?
                  (8'hb6) : wire7)))));
              reg18 <= $unsigned((($unsigned(reg9) != $signed($unsigned((8'ha4)))) <= ($unsigned((&reg12)) ^~ ((reg10 ?
                      reg16 : reg17) ?
                  (~|reg14) : (wire6 ? wire0 : wire4)))));
              reg19 <= $unsigned($signed(wire2));
              reg20 <= ($signed($unsigned(reg9)) ?
                  (wire5 - reg12) : (^~(reg12[(1'h1):(1'h1)] << ((^(8'had)) < (&reg17)))));
              reg21 <= reg11;
            end
          else
            begin
              reg17 <= (reg14[(4'h9):(3'h7)] >> $signed(({(wire4 <<< (8'hb1)),
                      reg21} ?
                  (reg8 ?
                      $signed(reg11) : (8'ha3)) : $signed((reg13 ~^ (8'haf))))));
              reg18 <= (~wire1[(1'h1):(1'h1)]);
            end
          if ($unsigned((~|$signed($signed(reg13)))))
            begin
              reg22 <= wire5;
              reg23 <= reg22[(1'h0):(1'h0)];
              reg24 <= reg11[(3'h7):(2'h2)];
              reg25 <= (reg13 ?
                  {{$signed((^reg21))},
                      $signed($signed((!reg8)))} : ((reg20[(3'h7):(3'h4)] ?
                      reg10[(3'h5):(2'h3)] : ((7'h44) ?
                          (reg20 ?
                              wire6 : wire7) : $signed(reg22))) == $signed($signed($signed(wire4)))));
              reg26 <= ($signed({(8'hb2)}) & (($unsigned($unsigned(wire2)) != (~^(reg19 ?
                  reg14 : reg20))) > ($unsigned((!reg8)) ?
                  $unsigned(reg18[(3'h5):(1'h0)]) : (reg22 ~^ wire4[(3'h7):(2'h3)]))));
            end
          else
            begin
              reg22 <= reg19[(4'hc):(4'h8)];
              reg23 <= reg18;
              reg24 <= ((8'ha3) ?
                  reg18 : (~$signed((reg13 ^~ (wire0 ^~ (8'ha2))))));
              reg25 <= (^reg18[(2'h2):(1'h0)]);
            end
        end
      else
        begin
          reg16 <= $unsigned($unsigned(reg18));
          reg17 <= (8'hb7);
        end
    end
  assign wire27 = reg16;
  assign wire28 = $unsigned((&(&(&$signed(reg18)))));
  assign wire29 = (+(~|((~&(wire1 && wire6)) == (|{reg17}))));
  assign wire30 = ((reg22[(3'h7):(2'h3)] ?
                          (~&wire29) : (|(|((8'hb0) ? reg25 : wire1)))) ?
                      $signed(((+(reg18 ? (8'ha3) : reg18)) ?
                          wire6[(4'hf):(4'hb)] : reg12[(5'h12):(3'h7)])) : reg20[(2'h3):(2'h3)]);
endmodule
