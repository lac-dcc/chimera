module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire4;
  assign y = {wire66, wire65, wire64, wire63, wire62, wire60, wire4, (1'h0)};
  assign wire4 = wire1[(3'h4):(2'h3)];
  module5 #() modinst61 (.wire7(wire1), .y(wire60), .wire6(wire0), .wire8(wire4), .wire9(wire2), .clk(clk));
  assign wire62 = wire2;
  assign wire63 = (wire0[(1'h1):(1'h1)] ?
                      {($unsigned((wire60 ? wire1 : wire3)) ?
                              ($signed(wire2) - (~&wire62)) : wire1[(3'h7):(3'h6)])} : ($signed($unsigned((wire1 ?
                              (8'hbc) : wire1))) ?
                          $signed(wire0) : wire4[(3'h5):(2'h2)]));
  assign wire64 = {($signed((wire63[(4'he):(4'h8)] ~^ wire63)) || ((^~(^wire0)) & wire63)),
                      $unsigned($unsigned(wire62))};
  assign wire65 = (wire4 ? wire0 : (8'hb4));
  assign wire66 = $unsigned(((&(wire3[(3'h5):(1'h0)] == (wire65 ?
                      (8'hb6) : wire1))) <= wire65));
endmodule

module module5
#(parameter param58 = (~^(~|((^~((8'hbb) ? (8'ha7) : (8'hac))) ? (((7'h44) || (8'ha7)) << ((8'ha9) ? (8'ha8) : (8'hbf))) : (((8'ha7) << (8'hbd)) || {(8'hac)})))), 
parameter param59 = (param58 ^ ((^param58) <<< {(~&(|param58))})))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  assign y = {wire56,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 (1'h0)};
  assign wire10 = wire7;
  assign wire11 = wire10[(4'hb):(4'h8)];
  assign wire12 = wire8[(1'h0):(1'h0)];
  assign wire13 = $signed((wire11[(1'h0):(1'h0)] != (wire7 ?
                      $unsigned($signed(wire6)) : ((-wire11) ?
                          (wire10 ? wire10 : wire9) : wire9[(3'h6):(3'h5)]))));
  assign wire14 = ({(~{(wire8 * (8'h9f))}),
                      (^wire8[(2'h2):(2'h2)])} < $signed((wire7 ?
                      (((8'h9e) ? wire13 : wire10) ?
                          (wire12 ?
                              wire10 : wire13) : (!(8'hb7))) : $unsigned(wire6))));
  assign wire15 = (wire9 ?
                      wire12 : ({wire11[(2'h2):(1'h1)]} ?
                          wire13 : $signed((+(wire9 ? wire14 : (8'h9f))))));
  assign wire16 = (8'hb6);
  module17 #() modinst57 (.wire21(wire16), .clk(clk), .wire19(wire9), .y(wire56), .wire20(wire12), .wire18(wire10));
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire21;
  input wire [(3'h6):(1'h0)] wire20;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire24,
                 wire23,
                 wire22,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
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
                 (1'h0)};
  assign wire22 = $unsigned(((($signed(wire18) ?
                          $signed(wire19) : wire20[(3'h6):(2'h3)]) ?
                      ($unsigned((8'hbd)) ?
                          {wire21} : wire18[(5'h11):(4'hb)]) : (|(^wire19))) == $unsigned(wire18[(3'h6):(2'h2)])));
  assign wire23 = wire19;
  assign wire24 = $signed({wire21[(5'h13):(3'h6)]});
  always
    @(posedge clk) begin
      reg25 <= wire22;
      if (wire20[(1'h0):(1'h0)])
        begin
          reg26 <= $unsigned((~(~$signed({wire19, wire23}))));
          if ($unsigned(wire21))
            begin
              reg27 <= $signed((^(wire19[(4'he):(4'h8)] ?
                  $signed((+wire18)) : reg26[(2'h3):(2'h2)])));
              reg28 <= wire23[(1'h0):(1'h0)];
            end
          else
            begin
              reg27 <= reg27;
              reg28 <= wire24;
              reg29 <= ($unsigned({($unsigned(reg25) ?
                          {reg25, wire20} : ((8'h9c) > reg26))}) ?
                  $signed($unsigned(((reg27 && wire21) ?
                      $unsigned(wire24) : (wire18 ~^ wire19)))) : $unsigned((((~(8'ha6)) ~^ (wire21 ?
                      wire23 : (8'hb7))) << $unsigned(wire22))));
              reg30 <= $signed({reg28});
            end
          reg31 <= reg28;
          reg32 <= {((^~reg30[(2'h2):(2'h2)]) ?
                  ((reg27[(3'h7):(2'h3)] <<< (wire21 && reg29)) <= $signed((reg28 ?
                      (8'ha3) : reg29))) : (8'hbb))};
        end
      else
        begin
          reg26 <= wire19;
        end
      if ($signed(wire23))
        begin
          reg33 <= $signed(reg31);
          if ($signed($signed({reg31[(5'h12):(3'h7)], wire18})))
            begin
              reg34 <= $unsigned(wire22);
              reg35 <= $signed(reg28);
              reg36 <= (!(($unsigned({reg28, reg35}) != {$unsigned(reg34),
                  $unsigned(reg34)}) + (wire21[(4'hf):(3'h4)] ?
                  (^wire23[(3'h7):(3'h7)]) : (+reg25[(2'h3):(2'h2)]))));
              reg37 <= reg27[(2'h3):(2'h2)];
              reg38 <= $unsigned(($unsigned($signed((reg26 ?
                  reg27 : reg35))) > ($unsigned($signed(wire22)) ~^ $unsigned($unsigned(wire24)))));
            end
          else
            begin
              reg34 <= reg32[(3'h5):(3'h5)];
              reg35 <= (+((8'ha3) >> $signed($unsigned(reg31))));
            end
          reg39 <= (!($unsigned(wire22) ?
              $signed($signed(((8'h9e) ?
                  (8'hb8) : reg28))) : wire23[(1'h1):(1'h0)]));
        end
      else
        begin
          reg33 <= {wire18[(2'h3):(2'h2)], $unsigned(wire22)};
          reg34 <= (-$unsigned(wire18[(1'h0):(1'h0)]));
          if ((+((|((reg32 ? reg37 : wire20) ?
              (wire20 + wire20) : $unsigned(reg36))) | ($unsigned($signed(wire20)) >> wire23))))
            begin
              reg35 <= $signed(($signed((8'had)) ?
                  {((reg38 - reg27) ?
                          (8'ha5) : (8'hb7))} : {reg31[(5'h12):(5'h11)]}));
              reg36 <= (((wire18 ?
                      {((8'hb3) >> reg28)} : reg26[(5'h11):(2'h2)]) + $unsigned({reg35[(2'h3):(1'h1)],
                      (8'hb6)})) ?
                  (|reg32[(2'h3):(1'h0)]) : {$unsigned($unsigned($unsigned((8'ha8)))),
                      $signed((^~{reg34, reg26}))});
              reg37 <= (~&$signed(($signed((reg33 ? wire21 : wire18)) ?
                  ({(8'ha0)} ?
                      (wire24 ?
                          (8'h9e) : reg37) : $unsigned(reg37)) : (reg29 > (reg25 ?
                      wire20 : reg28)))));
            end
          else
            begin
              reg35 <= (8'h9e);
              reg36 <= wire23;
              reg37 <= reg35;
            end
        end
      reg40 <= (^$signed(reg34));
    end
  assign wire41 = ((|(8'h9c)) ?
                      wire22 : $signed($signed(($signed(wire24) ?
                          $signed(reg26) : reg28))));
  assign wire42 = $signed($unsigned((wire24 < ((~reg28) ?
                      ((8'ha0) ? reg37 : reg37) : reg39[(4'h9):(1'h0)]))));
  assign wire43 = $signed($unsigned(reg32));
  assign wire44 = wire18;
  assign wire45 = wire23[(3'h4):(3'h4)];
  assign wire46 = wire20;
  assign wire47 = wire23;
  always
    @(posedge clk) begin
      reg48 <= ((+$signed({(wire47 ? wire42 : (8'hac))})) == (~&reg40));
      reg49 <= $unsigned(reg31[(5'h14):(4'hc)]);
      if ($unsigned($signed((8'h9c))))
        begin
          reg50 <= ((wire20 | $unsigned($signed($signed(wire24)))) ?
              $signed(((-{wire45}) ?
                  (~^(^~wire44)) : reg25[(1'h1):(1'h0)])) : reg49[(4'h9):(1'h1)]);
        end
      else
        begin
          reg50 <= (!((((&wire24) == (reg25 >> reg32)) <<< {reg36}) ?
              ((-wire46) != $signed((8'had))) : $unsigned({wire20[(1'h1):(1'h0)],
                  wire44[(1'h0):(1'h0)]})));
          reg51 <= (8'hae);
          if ((~|(~^($signed({reg35}) | ((wire43 || wire18) << wire20)))))
            begin
              reg52 <= (&reg30[(3'h7):(3'h4)]);
              reg53 <= ((|(^((~&reg36) ~^ (reg38 ^~ reg33)))) ?
                  (reg27 - ($signed((reg38 * reg30)) ?
                      $unsigned({reg25,
                          reg39}) : (+$signed(wire42)))) : (8'hb3));
            end
          else
            begin
              reg52 <= (((-(wire46[(4'hf):(2'h2)] ?
                  reg25[(1'h1):(1'h1)] : (reg25 ?
                      reg52 : reg53))) * reg37[(3'h4):(2'h2)]) > $signed((&(wire41[(3'h4):(2'h3)] ?
                  $signed(reg38) : reg27))));
              reg53 <= $signed((((wire47 ? (^~reg35) : (-wire18)) ?
                  wire44 : $signed(reg29[(1'h1):(1'h1)])) > (^~$unsigned($unsigned(wire42)))));
              reg54 <= ((&$signed((8'hac))) ?
                  reg51[(4'hb):(3'h7)] : wire20[(3'h5):(3'h4)]);
            end
        end
      reg55 <= $unsigned(($unsigned(((|reg25) ^ (~reg54))) != ($signed(reg32) ?
          (~|reg50) : ((8'hbc) ? (|reg25) : ((8'hbb) ? reg30 : reg50)))));
    end
endmodule
