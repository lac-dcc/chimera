module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire16;
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire20,
                 wire19,
                 wire18,
                 wire16,
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
                 (1'h0)};
  module5 #() modinst17 (.wire7(wire4), .y(wire16), .wire10(wire2), .clk(clk), .wire9(wire3), .wire6(wire0), .wire8(wire1));
  assign wire18 = ((8'ha0) ?
                      (^~((~^wire16) ^ (^wire16))) : (-(^$unsigned((wire1 >> wire0)))));
  assign wire19 = ((8'ha2) | $signed(wire16[(1'h0):(1'h0)]));
  assign wire20 = ((($unsigned($unsigned((8'ha1))) ^ wire19) && $signed($unsigned({wire2,
                      wire16}))) < $unsigned((8'ha3)));
  always
    @(posedge clk) begin
      reg21 <= wire18[(1'h0):(1'h0)];
      reg22 <= $signed(((wire2[(4'he):(3'h7)] ?
          $signed($signed(wire0)) : $signed((wire3 ?
              wire3 : wire1))) || wire18[(1'h1):(1'h1)]));
      if (wire1[(4'hd):(1'h0)])
        begin
          if ((reg21 ? (&(+$signed($unsigned(wire3)))) : wire1[(3'h5):(2'h3)]))
            begin
              reg23 <= ($unsigned($signed($signed({wire20,
                  wire2}))) & wire4[(3'h7):(3'h6)]);
              reg24 <= (wire2 ? wire0[(4'h8):(3'h6)] : wire19[(4'hc):(4'hb)]);
              reg25 <= reg24[(2'h3):(1'h0)];
              reg26 <= (~&wire18);
              reg27 <= wire2[(4'hb):(3'h7)];
            end
          else
            begin
              reg23 <= (+($signed($signed((reg27 != reg21))) ^ $unsigned($signed($signed(wire1)))));
            end
          reg28 <= $unsigned(reg27[(1'h1):(1'h0)]);
          reg29 <= (-(~($signed((8'hac)) ?
              (wire2 < $signed((8'hbf))) : (reg27[(1'h1):(1'h0)] ?
                  $unsigned(wire2) : (|(8'ha7))))));
          reg30 <= $signed((-($unsigned(wire16[(3'h5):(1'h1)]) ?
              ((wire3 ?
                  wire16 : (8'hae)) << reg28[(3'h5):(2'h2)]) : (!((8'ha7) <<< (8'hbb))))));
          if (((reg28[(3'h6):(2'h2)] ?
                  $signed(reg24[(4'ha):(4'h8)]) : $unsigned(wire19)) ?
              wire0 : $signed((((reg28 ? wire3 : (7'h42)) ?
                  ((8'hbe) < reg29) : (reg22 ?
                      reg23 : wire1)) >> (&wire3[(1'h1):(1'h0)])))))
            begin
              reg31 <= $signed(($unsigned((-reg26[(1'h0):(1'h0)])) && ((~(^~wire3)) ^ {(wire2 ?
                      wire2 : wire3),
                  reg21})));
              reg32 <= wire1[(3'h5):(2'h2)];
            end
          else
            begin
              reg31 <= wire1;
              reg32 <= $signed({(wire2[(1'h1):(1'h0)] ?
                      $signed((^~wire3)) : $signed($signed(reg23)))});
              reg33 <= {{((reg29 ~^ (reg23 ?
                          reg29 : (8'hb5))) <<< reg28[(3'h5):(1'h0)]),
                      ($unsigned(reg22) ~^ {(reg24 ~^ (8'hb3)),
                          $unsigned(reg22)})}};
              reg34 <= $signed({reg28[(2'h2):(1'h0)],
                  {$signed((wire20 ? reg23 : wire19)), wire18}});
            end
        end
      else
        begin
          if (reg26)
            begin
              reg23 <= $unsigned((($signed($unsigned((7'h43))) ?
                  reg26[(1'h0):(1'h0)] : reg31) ^~ ($signed({wire16,
                  wire4}) >>> (8'ha5))));
              reg24 <= (wire20[(3'h5):(3'h5)] | $unsigned(reg30));
              reg25 <= (reg32[(5'h10):(4'h8)] ?
                  (wire4[(3'h6):(2'h3)] ?
                      $signed((wire19 ?
                          (+reg26) : $unsigned((8'hb5)))) : $signed(((^~reg22) - $signed(reg32)))) : wire16);
              reg26 <= wire2[(3'h7):(3'h6)];
            end
          else
            begin
              reg23 <= $signed(wire3[(2'h3):(1'h1)]);
              reg24 <= ($unsigned(((~^(+reg31)) ?
                  $unsigned($unsigned(wire4)) : ((wire4 ? reg25 : reg21) ?
                      ((8'hb3) == wire3) : $unsigned(reg34)))) ^ (({(~&reg24)} ?
                  wire3 : (reg33 ?
                      $unsigned((8'haf)) : $unsigned(wire3))) & $unsigned(({reg30,
                  wire4} && reg33[(2'h2):(1'h0)]))));
            end
          reg27 <= reg34[(2'h2):(1'h1)];
        end
      reg35 <= ({($unsigned((~reg33)) != $unsigned((reg31 ~^ reg30))),
              (-reg25)} ?
          wire3[(3'h6):(3'h5)] : ({$unsigned(reg22),
                  ((wire2 ? reg32 : wire20) ? (reg25 - reg26) : reg22)} ?
              $signed(((reg22 == reg23) != reg22)) : (^$unsigned(((8'hb4) && wire1)))));
      reg36 <= ((wire2 ?
          (((reg22 ?
              (8'ha9) : reg21) > {reg28}) << {$signed(reg33)}) : $unsigned((reg29 ?
              (reg32 * wire18) : $signed(reg24)))) ^~ (wire19[(2'h3):(2'h3)] & (reg22 | reg30[(3'h4):(2'h3)])));
    end
  always
    @(posedge clk) begin
      if (($signed($signed(reg29)) != reg27))
        begin
          reg37 <= $signed($unsigned({{(wire1 ? reg31 : reg35), reg24},
              wire4}));
          if ((&wire0))
            begin
              reg38 <= ((^~reg36[(2'h2):(1'h0)]) >>> (~&$signed(((reg32 ^ reg30) ^ {reg29,
                  reg36}))));
            end
          else
            begin
              reg38 <= $signed($signed((reg37[(1'h1):(1'h0)] ?
                  ((wire20 && (8'ha0)) <= {reg28}) : ({(8'hbb)} <= reg23[(3'h4):(2'h3)]))));
              reg39 <= (({{$signed(reg23),
                      (^(8'ha3))}} + $signed((wire4 || (^(8'ha3))))) >>> ($unsigned(reg21) ?
                  reg36[(4'ha):(4'h8)] : (!reg38[(2'h2):(1'h0)])));
              reg40 <= (~^$unsigned(({(reg22 ? (8'hba) : reg34)} ?
                  reg34[(3'h4):(1'h1)] : $signed($unsigned(reg26)))));
            end
          reg41 <= $unsigned($unsigned(reg30));
        end
      else
        begin
          reg37 <= wire3[(2'h3):(1'h0)];
          reg38 <= reg34[(3'h6):(2'h2)];
        end
    end
  assign wire42 = (~|$unsigned($unsigned(({(8'hbd),
                      (8'hae)} == reg39[(4'hc):(4'ha)]))));
  assign wire43 = wire16[(1'h0):(1'h0)];
  assign wire44 = $signed($signed((8'h9c)));
  assign wire45 = reg31[(3'h5):(1'h0)];
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  assign y = {wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = (~|(~&(((8'hae) & (wire7 ^~ wire9)) ?
                      wire6 : $unsigned(wire9[(4'h8):(2'h2)]))));
  assign wire12 = (wire11 ?
                      wire6 : {(((+wire6) ^ (+wire8)) ?
                              ((~&wire6) ?
                                  (~^wire10) : {wire7,
                                      wire9}) : (wire10[(4'hd):(3'h7)] - $signed(wire8))),
                          (wire6 << wire10)});
  assign wire13 = (($unsigned($unsigned(((8'ha8) ? wire9 : wire9))) ?
                      wire6[(3'h4):(2'h2)] : (wire10 == (+$signed(wire11)))) >= wire12);
  assign wire14 = (~$signed((~^wire13[(2'h2):(1'h1)])));
  assign wire15 = wire13[(1'h1):(1'h1)];
endmodule
