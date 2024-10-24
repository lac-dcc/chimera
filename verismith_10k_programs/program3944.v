module top
#(parameter param88 = {(((((8'hb9) << (8'hb7)) & ((8'hab) ? (8'ha2) : (8'ha1))) ? ((8'hb5) + ((7'h42) <= (7'h42))) : ({(8'hb0), (8'hb1)} ? ((8'ha2) ? (8'hbc) : (8'haa)) : (|(8'ha1)))) ? ((((8'hb8) <= (8'hac)) || ((8'ha3) && (7'h43))) ? (((8'h9f) ? (8'hba) : (8'hb5)) ? ((8'hb9) ? (8'hb6) : (8'hb9)) : (^(8'hb8))) : (+((8'hae) ? (8'h9f) : (8'hbd)))) : ({((8'h9f) << (8'hb4))} ^~ ((^(8'hb7)) ? ((8'hb1) ? (7'h40) : (8'hbe)) : ((8'h9c) <<< (8'hbe)))))}, 
parameter param89 = param88)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire4 = $signed($signed($signed(wire1[(4'hd):(2'h2)])));
  assign wire5 = ((wire0[(3'h4):(1'h0)] ?
                     (~|wire1[(5'h14):(2'h2)]) : wire4[(1'h1):(1'h1)]) != (($unsigned(wire2[(4'hc):(4'hc)]) ?
                     wire2[(1'h0):(1'h0)] : wire3[(3'h7):(3'h5)]) <<< $unsigned({(~wire0),
                     (wire2 ? wire4 : wire4)})));
  assign wire6 = (!$signed(wire2[(4'hb):(2'h2)]));
  always
    @(posedge clk) begin
      reg7 <= $signed((($signed(wire1[(3'h4):(2'h2)]) != (((8'hb3) >>> wire3) ?
              (wire4 ? (8'ha0) : (8'hac)) : $unsigned((7'h44)))) ?
          (wire0 <= wire0) : $unsigned(wire5[(3'h5):(2'h2)])));
      reg8 <= (wire5[(4'h9):(1'h0)] ?
          reg7[(2'h2):(1'h0)] : (&{$signed($unsigned(wire1)),
              (wire3 ? (^wire5) : $signed(wire4))}));
      reg9 <= (^~((&wire5[(4'h8):(3'h4)]) >> $unsigned($unsigned($unsigned(wire1)))));
    end
  always
    @(posedge clk) begin
      reg10 <= wire5[(3'h4):(2'h2)];
      if ((7'h43))
        begin
          if ((((~&(reg7[(2'h2):(1'h0)] == (^~wire0))) ?
              $unsigned(reg9) : $unsigned((-(wire5 + wire2)))) == wire5[(3'h6):(2'h3)]))
            begin
              reg11 <= {$signed($signed($signed($signed(wire2))))};
              reg12 <= {$signed({((reg7 | reg7) ?
                          $unsigned(wire3) : $unsigned((8'hae))),
                      $signed(reg11)})};
              reg13 <= (7'h43);
              reg14 <= $unsigned((((wire2[(4'ha):(4'h8)] ?
                          (reg11 > wire5) : (!wire2)) ?
                      $unsigned((reg12 ?
                          reg11 : wire2)) : reg7[(2'h2):(1'h1)]) ?
                  {$unsigned(reg10[(2'h2):(1'h0)]),
                      wire1[(2'h2):(1'h1)]} : reg8));
              reg15 <= reg12;
            end
          else
            begin
              reg11 <= $unsigned(((reg8 >> $unsigned($signed(wire1))) ?
                  ($signed((~|reg10)) ?
                      (^~(&wire0)) : wire3) : $signed($signed(reg10[(2'h2):(1'h0)]))));
              reg12 <= (|reg14[(1'h0):(1'h0)]);
            end
          reg16 <= $unsigned(reg14);
        end
      else
        begin
          if (wire3)
            begin
              reg11 <= {($signed(reg9[(2'h3):(2'h3)]) ?
                      (8'hba) : (wire6 ?
                          {(|(8'hbb))} : $signed($unsigned(reg11)))),
                  wire1};
            end
          else
            begin
              reg11 <= wire5;
            end
          reg12 <= $unsigned($unsigned(reg15[(2'h2):(2'h2)]));
        end
      reg17 <= wire1[(3'h4):(1'h1)];
    end
  module18 #() modinst77 (.clk(clk), .wire20(reg14), .wire21(wire4), .wire19(reg8), .wire23(wire5), .wire22(reg17), .y(wire76));
  assign wire78 = wire6;
  assign wire79 = $signed(($signed(reg16) ?
                      $unsigned($unsigned($signed(wire3))) : (^~((reg12 ?
                          wire76 : (7'h40)) ~^ $signed(reg11)))));
  assign wire80 = (~^{$unsigned({reg13, $signed((8'hb7))})});
  assign wire81 = wire79;
  assign wire82 = $signed(wire0[(2'h3):(2'h3)]);
  assign wire83 = {wire2[(3'h6):(1'h0)], (+{($signed(wire79) ^ wire5)})};
  assign wire84 = $signed(wire3[(2'h2):(1'h0)]);
  assign wire85 = (~&$signed({(8'hac), $unsigned((^~reg11))}));
  assign wire86 = (wire78[(1'h1):(1'h0)] ?
                      reg13[(1'h1):(1'h0)] : (|(^(&$unsigned(wire80)))));
  assign wire87 = wire80[(3'h6):(2'h2)];
endmodule

module module18
#(parameter param75 = {(~|((((7'h43) <<< (8'hbb)) && ((8'ha8) ? (8'h9e) : (8'hab))) ? (|(~(8'h9c))) : ((8'ha3) ~^ ((8'haa) ? (8'hbf) : (8'ha2)))))})
(y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire21;
  input wire signed [(2'h2):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire69;
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire24,
                 wire38,
                 wire39,
                 wire69,
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
  assign wire24 = (wire21[(2'h2):(1'h1)] - $signed(wire23[(5'h12):(4'hf)]));
  always
    @(posedge clk) begin
      if ($signed(((~|wire22) ?
          (wire23 > ($unsigned(wire19) ?
              (wire23 ? wire20 : wire19) : (wire23 ?
                  wire24 : wire23))) : $signed(wire22[(1'h0):(1'h0)]))))
        begin
          reg25 <= (~|(+$signed($signed(wire19[(3'h4):(2'h2)]))));
          reg26 <= ($unsigned(wire21) ?
              $unsigned($signed(($signed(reg25) ?
                  ((7'h43) ?
                      reg25 : wire23) : $unsigned(wire21)))) : wire24[(3'h6):(3'h5)]);
        end
      else
        begin
          if ((+reg26[(4'ha):(3'h6)]))
            begin
              reg25 <= wire24;
              reg26 <= $unsigned(wire19);
              reg27 <= ($unsigned(reg25) ?
                  (&$unsigned(reg26[(1'h1):(1'h0)])) : reg26);
              reg28 <= ({($unsigned(wire24[(1'h1):(1'h1)]) ?
                          ((wire21 < wire23) ?
                              wire22 : (wire20 + wire20)) : reg26[(3'h4):(3'h4)]),
                      ({wire20,
                          $unsigned(wire22)} > (reg25 || $unsigned(wire20)))} ?
                  wire20 : (!$unsigned(wire24[(2'h3):(2'h2)])));
            end
          else
            begin
              reg25 <= $signed(reg27[(4'hc):(3'h4)]);
              reg26 <= (~&(reg26 >= ((~&(wire23 == wire23)) ?
                  {$signed((8'hb6)), (wire22 ? wire20 : wire20)} : wire23)));
            end
          reg29 <= (|(|$signed(($signed(wire24) & (reg25 >>> reg27)))));
          reg30 <= $signed((&(((^~wire21) ~^ (^(8'haf))) && wire19[(3'h5):(3'h5)])));
          reg31 <= wire24[(3'h6):(3'h4)];
          if ($signed((reg31 ?
              $unsigned(wire20) : {wire23[(5'h10):(4'hb)],
                  $signed($signed(wire22))})))
            begin
              reg32 <= $unsigned((!reg29[(3'h7):(3'h5)]));
              reg33 <= $signed($unsigned((wire19[(2'h3):(1'h1)] >> $signed({wire23}))));
              reg34 <= {reg33};
              reg35 <= reg34[(1'h0):(1'h0)];
            end
          else
            begin
              reg32 <= (!(+((wire23 ?
                      reg28[(3'h7):(2'h2)] : wire23[(4'hf):(4'ha)]) ?
                  $signed(wire21) : reg29)));
            end
        end
      reg36 <= reg27[(5'h11):(2'h2)];
      reg37 <= $signed(($signed($signed($unsigned(reg29))) * (&$unsigned({reg28,
          (8'hab)}))));
    end
  assign wire38 = $signed(reg33);
  assign wire39 = $signed(reg30[(3'h4):(1'h0)]);
  module40 #() modinst70 (.wire45(reg30), .wire44(reg25), .wire42(wire21), .clk(clk), .wire43(wire23), .y(wire69), .wire41(wire24));
  assign wire71 = reg28[(1'h0):(1'h0)];
  assign wire72 = (($signed((^$unsigned(wire19))) > wire69[(1'h0):(1'h0)]) >> $unsigned(reg32[(5'h15):(3'h5)]));
  assign wire73 = wire20;
  assign wire74 = ($signed((reg27[(4'hf):(4'h9)] >>> reg35[(3'h4):(1'h1)])) + ((+((wire69 && (8'h9d)) ?
                      reg28 : reg31)) > $signed(({wire69, reg31} ?
                      $signed(wire72) : reg31[(1'h0):(1'h0)]))));
endmodule

module module40
#(parameter param67 = ((^~({(+(8'hb1)), ((8'ha6) | (8'h9d))} ? (8'hab) : (((8'hbd) ? (8'h9e) : (8'hae)) ? {(8'ha0), (8'hbd)} : ((7'h40) ? (8'ha7) : (8'ha7))))) <<< (^~(({(8'ha2)} ? ((8'hac) ? (8'h9d) : (7'h42)) : ((8'hbc) - (8'hbd))) & (&((7'h43) <= (8'hae)))))), 
parameter param68 = ((~&((|((8'hab) | param67)) ? (-(param67 || param67)) : (~|param67))) ^ param67))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire45;
  input wire signed [(5'h14):(1'h0)] wire44;
  input wire signed [(4'hc):(1'h0)] wire43;
  input wire signed [(4'he):(1'h0)] wire42;
  input wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire46;
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire61,
                 wire60,
                 wire59,
                 wire56,
                 wire54,
                 wire53,
                 wire52,
                 wire46,
                 reg64,
                 reg63,
                 reg62,
                 reg58,
                 reg57,
                 reg55,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire46 = wire44[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg47 <= {($unsigned(($signed(wire41) ?
              ((8'hb1) | wire46) : (wire45 && (7'h43)))) ~^ $unsigned((wire43 - (wire43 && wire44)))),
          (~|(~|$signed((8'hb7))))};
      reg48 <= (((^$unsigned(wire43)) >>> wire43) ?
          (~^(($signed(wire43) || (~|wire46)) + $signed($unsigned(reg47)))) : (8'ha7));
      reg49 <= ((($signed(wire42) && ($unsigned(wire44) ?
              $unsigned(reg48) : $unsigned(reg47))) - ($unsigned($unsigned(wire46)) ?
              $unsigned(wire44[(4'h8):(3'h4)]) : $signed({wire46}))) ?
          $signed((8'ha4)) : ({wire41, $signed((wire42 <= reg47))} ?
              wire44 : wire45));
      reg50 <= wire41[(1'h0):(1'h0)];
      reg51 <= (-reg47[(3'h5):(3'h4)]);
    end
  assign wire52 = wire43;
  assign wire53 = ((+{{(^wire52), (reg49 == (8'hb1))}}) ?
                      {reg48[(5'h11):(5'h10)]} : ($signed(reg48[(4'hf):(1'h0)]) ?
                          wire45[(1'h1):(1'h0)] : ((~^((8'ha0) || reg51)) ?
                              $unsigned((reg50 ~^ wire43)) : $signed(reg47[(4'h9):(1'h1)]))));
  assign wire54 = $signed((((reg49 ?
                      wire45 : (reg47 > reg51)) <<< ($signed(reg50) == $signed(wire53))) || (~$signed({(8'hba),
                      (8'hb8)}))));
  always
    @(posedge clk) begin
      reg55 <= {$unsigned(((&(8'ha8)) ?
              reg51[(3'h6):(3'h5)] : (^~(~&(8'ha9))))),
          $unsigned(wire41)};
    end
  assign wire56 = {$unsigned(((|(reg47 ? (8'hab) : wire41)) ?
                          (~&$unsigned(reg55)) : (~&(reg51 && wire45))))};
  always
    @(posedge clk) begin
      reg57 <= (|$signed({$signed((wire56 ~^ wire44))}));
      reg58 <= wire45[(2'h2):(2'h2)];
    end
  assign wire59 = reg58;
  assign wire60 = {(~^reg57[(1'h0):(1'h0)]),
                      $signed(((wire59[(1'h1):(1'h1)] <= (reg51 ?
                          (8'hb9) : wire43)) & ((~&wire45) | (~&reg47))))};
  assign wire61 = $unsigned((wire45[(1'h0):(1'h0)] ~^ (|wire45[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg62 <= {((~{wire60[(3'h6):(2'h3)]}) ?
              wire56 : $signed($signed((reg58 << wire59)))),
          (8'ha6)};
      reg63 <= reg62;
      reg64 <= reg63;
    end
  assign wire65 = $signed($unsigned($unsigned({reg47[(3'h4):(2'h2)],
                      (wire41 ? wire42 : reg51)})));
  assign wire66 = {(~|(+((reg50 + reg62) | $signed((8'hb8)))))};
endmodule
