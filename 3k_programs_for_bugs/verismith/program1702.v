module top
#(parameter param57 = {((8'ha2) == (~(~((8'ha1) ? (8'hb8) : (8'ha6)))))}, 
parameter param58 = (&((((param57 >> param57) ? param57 : (~param57)) >= param57) ? param57 : (~|(8'ha8)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire26;
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  assign y = {wire56,
                 wire51,
                 wire50,
                 wire26,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
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
                 (1'h0)};
  module5 #() modinst27 (.clk(clk), .y(wire26), .wire9(wire0), .wire8(wire2), .wire10(wire3), .wire7(wire4), .wire6(wire1));
  always
    @(posedge clk) begin
      reg28 <= wire1;
    end
  always
    @(posedge clk) begin
      reg29 <= wire1[(2'h2):(1'h1)];
      if ((&(&$signed(wire3))))
        begin
          reg30 <= $unsigned(wire0);
        end
      else
        begin
          if ((~wire26[(4'h9):(3'h4)]))
            begin
              reg30 <= (($unsigned(wire26[(1'h1):(1'h0)]) ?
                      $signed(($signed(wire1) != $signed(reg29))) : wire4) ?
                  (8'ha4) : reg29[(3'h4):(2'h3)]);
              reg31 <= wire3[(1'h1):(1'h0)];
              reg32 <= (wire2 ?
                  wire1[(4'hb):(1'h0)] : ({wire1,
                      ((wire4 ? (8'ha8) : (8'ha4)) ?
                          reg30[(4'ha):(3'h7)] : wire26[(3'h7):(1'h1)])} != wire3[(2'h3):(2'h3)]));
            end
          else
            begin
              reg30 <= ($signed(wire4) != {(((^~(8'h9c)) ?
                          reg32[(1'h1):(1'h1)] : reg29) ?
                      $signed(wire2[(4'hc):(4'h9)]) : {(~wire26),
                          (reg32 * reg31)}),
                  reg29});
              reg31 <= (8'ha1);
              reg32 <= $signed({(8'h9c),
                  (($unsigned((8'hb4)) ?
                          (reg29 ? wire26 : wire0) : {reg32, reg28}) ?
                      reg30[(4'hb):(2'h2)] : (&((8'h9d) ~^ reg32)))});
              reg33 <= wire0[(4'h9):(3'h5)];
              reg34 <= ($unsigned((($unsigned(reg29) ?
                  (^~reg30) : $unsigned(reg28)) != (-reg30[(4'h8):(4'h8)]))) != (&$signed(({reg28,
                  wire26} - (~&wire2)))));
            end
        end
      reg35 <= $signed($unsigned(($unsigned(reg30[(5'h12):(1'h1)]) ?
          reg33 : wire0[(4'hd):(2'h3)])));
      reg36 <= $unsigned(wire3);
      if ($unsigned((($signed({reg31}) ?
              reg34[(4'h8):(1'h1)] : ((wire26 ? reg36 : wire1) ?
                  $signed(reg31) : {wire2, (8'ha8)})) ?
          (~&$signed($unsigned(wire26))) : {(wire3 <<< $unsigned(wire1)),
              $signed({wire0})})))
        begin
          reg37 <= (wire0 ?
              wire26[(4'ha):(1'h0)] : ($signed(reg32) ?
                  wire1 : wire1[(5'h13):(5'h10)]));
        end
      else
        begin
          reg37 <= $unsigned(reg31[(1'h1):(1'h1)]);
          if ($signed($signed((({wire1, reg36} ?
              $signed(reg33) : (|reg30)) | ($unsigned(wire2) ^ {wire2})))))
            begin
              reg38 <= $unsigned($signed(wire0[(2'h3):(1'h0)]));
              reg39 <= $signed(($unsigned({{reg28, (8'hba)},
                  (~^reg37)}) | $signed((((8'hb1) ? (7'h43) : wire0) ?
                  $unsigned(reg34) : {reg37, (8'had)}))));
              reg40 <= reg34[(1'h0):(1'h0)];
              reg41 <= reg36;
              reg42 <= $signed(((~^(~^(+reg37))) ?
                  (wire2 ?
                      (reg40 ? wire1[(4'he):(3'h4)] : $signed(reg33)) : ({reg37,
                              (8'hb9)} ?
                          (reg39 ^~ (8'ha4)) : ((8'hb1) * wire0))) : $signed((reg29 == $unsigned(wire2)))));
            end
          else
            begin
              reg38 <= reg36;
              reg39 <= wire26;
            end
          reg43 <= reg38[(5'h12):(3'h4)];
          if (wire3)
            begin
              reg44 <= reg38[(4'hb):(3'h5)];
            end
          else
            begin
              reg44 <= wire0;
              reg45 <= wire26;
            end
          if (reg45)
            begin
              reg46 <= (-$signed($signed($signed((reg31 ? (8'hba) : reg36)))));
              reg47 <= (~$signed($signed(((reg31 ?
                  (8'ha5) : wire26) | wire26))));
              reg48 <= (reg39 ?
                  reg28 : (^~(wire0[(3'h6):(3'h5)] ?
                      {reg47[(2'h2):(1'h1)],
                          $unsigned(reg32)} : ((|reg32) >>> (^wire1)))));
            end
          else
            begin
              reg46 <= (&reg45);
              reg47 <= $signed(($signed($signed(reg47[(4'hb):(4'hb)])) ?
                  {(wire26 ? (^~reg34) : ((8'hb3) ? wire1 : reg31)),
                      $unsigned((reg48 ?
                          reg47 : reg46))} : wire26[(4'ha):(4'ha)]));
              reg48 <= reg35[(3'h6):(1'h0)];
              reg49 <= reg46;
            end
        end
    end
  assign wire50 = (^(~&reg35));
  assign wire51 = $signed($signed(reg43[(4'he):(3'h6)]));
  always
    @(posedge clk) begin
      reg52 <= (reg48[(2'h3):(1'h0)] ?
          ((reg37 ?
                  ($unsigned(reg35) & (wire26 ?
                      reg32 : wire1)) : $signed((~|(8'ha5)))) ?
              ((reg30[(3'h5):(2'h3)] ~^ reg38[(1'h1):(1'h0)]) >> ((+reg39) - $unsigned((8'ha7)))) : wire51) : $signed($unsigned($signed((reg47 ?
              reg35 : reg46)))));
      reg53 <= (!reg45);
      reg54 <= (!$signed((|reg44)));
      reg55 <= ((|$unsigned(reg47[(4'hb):(2'h3)])) ?
          wire50[(3'h4):(2'h3)] : $signed(reg47));
    end
  assign wire56 = reg52;
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire11 = $signed($unsigned($signed((^(wire9 * wire6)))));
  assign wire12 = (~{wire9[(1'h1):(1'h1)], (wire11 - (&wire8))});
  assign wire13 = wire8[(3'h5):(2'h3)];
  assign wire14 = (|wire13);
  assign wire15 = wire13[(1'h1):(1'h1)];
  assign wire16 = $signed(wire12[(5'h10):(2'h2)]);
  assign wire17 = (^(^(^((wire7 ? wire13 : wire10) ?
                      $unsigned(wire10) : {wire7}))));
  assign wire18 = $unsigned((^~(((wire11 < wire11) ?
                      (wire16 ^ wire7) : (wire12 >>> wire13)) - $signed((~&wire9)))));
  assign wire19 = wire14[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg20 <= ($unsigned(($signed((wire12 <<< wire11)) <= wire9[(3'h6):(3'h4)])) ?
          $unsigned(wire8) : $signed(wire18));
      if (($unsigned(({$unsigned(wire10), {wire15}} ?
              (~^(wire16 ? wire9 : (7'h41))) : (-(wire11 ? wire10 : wire6)))) ?
          wire9 : $unsigned($unsigned(wire19[(4'h9):(2'h3)]))))
        begin
          reg21 <= {$unsigned((~&$unsigned($signed((7'h44)))))};
          reg22 <= $signed(wire7[(1'h0):(1'h0)]);
        end
      else
        begin
          reg21 <= {wire6, wire12};
          reg22 <= wire6[(3'h4):(2'h3)];
          reg23 <= $unsigned(({($signed(wire18) ?
                      (wire8 <<< wire10) : (wire11 || wire7)),
                  wire13[(2'h3):(2'h2)]} ?
              $signed(wire16) : ({$unsigned(wire13),
                  $signed(wire15)} <<< ((wire15 | wire8) ?
                  reg21 : (wire16 != (7'h41))))));
        end
      reg24 <= $signed((($unsigned(((8'had) - wire8)) < $signed($unsigned(wire17))) ?
          (wire14[(4'h8):(1'h0)] || (wire7[(3'h5):(2'h3)] << (wire15 ^ reg22))) : wire19[(4'ha):(4'ha)]));
      reg25 <= wire19[(3'h5):(2'h2)];
    end
endmodule
