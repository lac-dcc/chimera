module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire58;
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  module5 #() modinst59 (wire58, clk, wire3, wire2, wire0, wire1, wire4);
  assign wire60 = $unsigned(wire2[(3'h7):(1'h1)]);
  assign wire61 = $unsigned((~{$signed((^wire60)), wire1}));
  assign wire62 = (wire3 * $unsigned(({(wire60 && wire4), (^~wire2)} ?
                      $unsigned((wire61 ? wire3 : (7'h43))) : wire60)));
  always
    @(posedge clk) begin
      if ((^($signed(wire1) ^~ wire0)))
        begin
          if ({$signed($signed(wire60[(2'h3):(2'h3)])),
              $unsigned((wire3[(3'h5):(3'h4)] ?
                  $unsigned({wire62, (8'hb9)}) : $unsigned((wire62 ?
                      wire60 : wire4))))})
            begin
              reg63 <= wire58;
              reg64 <= ($signed((wire0 - (^~$signed(wire62)))) > ($unsigned($signed(wire0)) ?
                  (~^wire2) : (-(!wire61))));
            end
          else
            begin
              reg63 <= (+(wire61[(3'h6):(3'h5)] == $unsigned($signed($unsigned(wire62)))));
            end
          reg65 <= ($signed((+(reg63[(3'h5):(3'h5)] <<< $signed(wire62)))) && wire62[(3'h4):(2'h3)]);
          reg66 <= {wire62[(3'h7):(2'h2)],
              (-(($unsigned(reg63) ?
                  {wire1, (7'h41)} : (+wire4)) >= (+$signed((7'h40)))))};
          reg67 <= ($signed($unsigned({(wire61 - wire4)})) ?
              (wire3 ^ {(-$unsigned(wire2))}) : $unsigned(wire1));
        end
      else
        begin
          if (wire2[(2'h3):(2'h2)])
            begin
              reg63 <= (wire3 ?
                  (^{$signed((8'hb2))}) : ((wire61 ?
                          reg64[(3'h6):(1'h1)] : $signed((reg67 ?
                              wire0 : wire1))) ?
                      (wire61[(3'h5):(3'h4)] ?
                          (~(8'hbb)) : (8'hb9)) : (^$signed(((8'ha5) >> wire4)))));
            end
          else
            begin
              reg63 <= $signed(wire3);
              reg64 <= (~(reg64[(1'h1):(1'h1)] ?
                  (~|$unsigned((wire1 ? wire61 : reg63))) : (~wire0)));
              reg65 <= $signed({((!wire60[(3'h6):(3'h5)]) ?
                      (+(reg65 != reg63)) : ($unsigned(wire0) ?
                          (wire2 + reg67) : $signed(wire1)))});
            end
          reg66 <= wire3[(4'ha):(4'ha)];
          if (wire61)
            begin
              reg67 <= $unsigned(wire60);
              reg68 <= {$unsigned((|reg63))};
              reg69 <= (~&(~(8'hae)));
            end
          else
            begin
              reg67 <= reg69[(3'h6):(2'h2)];
              reg68 <= (!wire60);
              reg69 <= {$unsigned((wire2 * $signed($signed(wire3))))};
              reg70 <= $signed({($signed(wire1) ?
                      wire1[(1'h0):(1'h0)] : reg65)});
              reg71 <= $signed({(~|($signed((8'ha2)) ?
                      (wire0 + reg67) : reg64))});
            end
          reg72 <= reg65;
          reg73 <= (wire60[(1'h1):(1'h1)] ?
              {(^wire4[(3'h5):(1'h0)])} : (~|wire60));
        end
      reg74 <= (wire3 ? reg72[(4'hc):(1'h0)] : reg64);
      if (reg66[(2'h3):(2'h2)])
        begin
          reg75 <= $signed(($unsigned(($signed(wire3) ~^ $signed(reg70))) * $unsigned(wire58[(4'ha):(3'h6)])));
          reg76 <= ($signed((wire62[(3'h7):(1'h1)] ?
              reg75[(1'h0):(1'h0)] : {(~^reg72)})) > $unsigned((8'hbd)));
        end
      else
        begin
          reg75 <= reg64[(3'h5):(3'h4)];
          reg76 <= wire1[(2'h3):(2'h3)];
          if ((reg71 < (|($signed((wire3 ? wire62 : (8'ha8))) ?
              ((reg72 ^ reg76) ?
                  (^reg66) : (^~reg71)) : $unsigned((reg73 && wire61))))))
            begin
              reg77 <= wire1;
              reg78 <= reg69;
            end
          else
            begin
              reg77 <= $unsigned(reg65[(3'h6):(2'h3)]);
              reg78 <= reg76;
            end
        end
      reg79 <= reg77[(1'h1):(1'h0)];
      reg80 <= ($unsigned(((-reg78) != (wire60 ^~ $unsigned(reg73)))) ?
          reg78 : (~^reg69[(2'h2):(2'h2)]));
    end
  assign wire81 = (reg77 && $unsigned(reg71[(3'h7):(1'h0)]));
  assign wire82 = (reg78[(2'h2):(2'h2)] + reg66);
  assign wire83 = reg75[(4'h8):(2'h3)];
endmodule

module module5
#(parameter param57 = (~&((&(((8'hb4) ? (8'hb8) : (8'hbc)) ? (!(8'ha4)) : {(8'hb8), (8'hbc)})) < (8'hbf))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire15;
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire53,
                 wire15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire10;
      reg12 <= ($unsigned((~wire7[(4'he):(4'h9)])) ?
          wire8 : reg11[(2'h3):(2'h2)]);
      reg13 <= ((($unsigned(wire9) <= $signed((wire10 ? wire7 : wire6))) ?
              (reg12 || {$unsigned(wire6),
                  $unsigned(reg11)}) : wire10[(2'h2):(2'h2)]) ?
          {$signed((wire10 <= {wire9,
                  (7'h44)}))} : $signed(wire7[(4'hb):(4'h9)]));
      reg14 <= wire6;
    end
  assign wire15 = reg14;
  module16 #() modinst54 (.wire19(wire15), .wire17(reg13), .wire20(reg12), .clk(clk), .wire18(wire8), .y(wire53));
  assign wire55 = ((reg11 ?
                          (^~(8'h9d)) : ((7'h44) <<< {$unsigned(wire8),
                              $unsigned(reg14)})) ?
                      {{$signed((~^reg12))},
                          ({$signed((7'h41))} ?
                              {(~reg13),
                                  (+(8'h9f))} : wire10)} : (!wire7[(5'h10):(4'he)]));
  assign wire56 = (^wire7[(2'h3):(1'h1)]);
endmodule

module module16
#(parameter param52 = (^((!(~&((8'hbb) != (8'ha8)))) ? (({(8'hb1), (8'hbe)} >>> {(8'ha7), (8'ha1)}) ? ((-(7'h42)) * (~&(8'hab))) : ((~(8'haf)) ? ((8'ha6) ^ (8'hab)) : {(8'hac), (8'ha3)})) : (~&(&(|(7'h44)))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire21;
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire21,
                 reg39,
                 reg38,
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
                 (1'h0)};
  assign wire21 = (wire17[(4'ha):(1'h0)] <= wire18);
  always
    @(posedge clk) begin
      if (wire21)
        begin
          reg22 <= (wire17 | wire18);
        end
      else
        begin
          if ($unsigned((wire21 ? {{{wire19, wire19}}} : (8'haa))))
            begin
              reg22 <= $unsigned(wire20);
              reg23 <= $signed(((!wire19[(4'h8):(3'h6)]) ?
                  wire21 : (((wire19 ? reg22 : wire21) - $signed(wire21)) ?
                      wire19 : (8'ha7))));
            end
          else
            begin
              reg22 <= $signed(wire19);
              reg23 <= ((^reg22) >>> wire20);
              reg24 <= wire21[(2'h3):(2'h3)];
            end
          if ((reg24[(1'h0):(1'h0)] && (reg23 << ($unsigned(reg23) ?
              $unsigned(reg22[(4'he):(1'h0)]) : (8'hb7)))))
            begin
              reg25 <= (^($signed(wire19[(3'h4):(1'h0)]) >> reg22));
            end
          else
            begin
              reg25 <= {$unsigned({$unsigned((wire18 ? wire21 : wire19)),
                      wire19}),
                  $unsigned({$unsigned((~|wire19)),
                      ((wire21 >> wire19) | $unsigned(reg22))})};
              reg26 <= (!(-$signed({wire19})));
              reg27 <= ((reg26[(4'hd):(2'h2)] ?
                      ({wire21,
                          (wire21 ? wire18 : reg25)} ^~ ((wire19 << reg25) ?
                          (~&reg22) : reg26)) : $signed(reg26)) ?
                  (8'ha2) : (8'ha8));
              reg28 <= ({($signed($unsigned(wire19)) ?
                          $signed(reg25[(1'h0):(1'h0)]) : $signed((wire17 | wire18))),
                      (wire18 ? reg24[(1'h1):(1'h1)] : (~{wire17}))} ?
                  $unsigned($unsigned(($unsigned(reg24) >>> (wire18 ?
                      (8'ha0) : (8'hba))))) : (wire20[(1'h0):(1'h0)] ?
                      (^~(|$signed(wire17))) : ($unsigned($unsigned(reg24)) & wire18)));
              reg29 <= $unsigned(($unsigned(($unsigned((8'hb3)) ?
                  wire19 : reg26)) <<< $unsigned($signed(reg26[(5'h11):(1'h1)]))));
            end
          reg30 <= $signed(reg29[(3'h7):(1'h1)]);
        end
      reg31 <= reg29;
      reg32 <= $signed(((7'h42) ?
          ({((8'hbf) < reg29), reg28} ^~ (&reg23)) : reg23));
    end
  assign wire33 = $signed((|wire21));
  assign wire34 = ({$unsigned($signed($unsigned(wire19)))} ?
                      (^(|$signed(reg24))) : (reg29[(1'h0):(1'h0)] >= ((!(wire21 ?
                          wire17 : wire20)) & $unsigned(reg22))));
  assign wire35 = $unsigned((($signed((reg25 ? reg26 : reg29)) ?
                          ((-(8'haa)) | reg28[(3'h4):(1'h0)]) : reg27[(2'h3):(2'h2)]) ?
                      $unsigned(reg26) : wire17[(4'hb):(4'h8)]));
  assign wire36 = reg24;
  assign wire37 = (reg32 & ($signed($unsigned(((8'hb6) ?
                      reg25 : reg22))) >> ({$signed(reg29),
                      $signed((8'hb9))} ^~ $unsigned($signed(reg32)))));
  always
    @(posedge clk) begin
      reg38 <= reg31[(5'h11):(4'hc)];
      reg39 <= $unsigned($unsigned($unsigned(((wire18 ? wire36 : wire21) ?
          $signed(reg25) : reg25))));
    end
  assign wire40 = (^~$signed(wire21[(2'h2):(1'h0)]));
  assign wire41 = (~&reg27);
  assign wire42 = ((^~((~|$signed(reg24)) && (+reg23))) ?
                      {(wire19 + ($signed(wire36) ?
                              (~^wire35) : {wire35}))} : (^reg31));
  assign wire43 = (reg22 & $signed(($signed(((8'haa) ? reg30 : reg32)) ?
                      $unsigned({(8'h9e)}) : $unsigned({reg23}))));
  assign wire44 = $signed({($unsigned({(8'h9e)}) ?
                          $unsigned(((8'hb0) <= wire21)) : (reg28[(1'h1):(1'h1)] & (wire42 ?
                              wire33 : reg38))),
                      (~^reg22[(3'h5):(3'h5)])});
  assign wire45 = $unsigned((^~((reg26[(4'h9):(3'h5)] <= wire40) + $unsigned(wire17[(4'he):(4'he)]))));
  assign wire46 = (-wire42);
  assign wire47 = (wire19[(3'h6):(1'h0)] ?
                      (wire18 ?
                          (~|$signed(reg30[(3'h5):(3'h4)])) : (+((wire40 ^ reg32) ?
                              wire20 : wire17))) : reg32[(5'h12):(4'hd)]);
  assign wire48 = ((~{$signed((~^reg28))}) ?
                      (($signed((-wire47)) - wire21[(3'h5):(2'h3)]) ?
                          $signed(wire34[(2'h2):(1'h1)]) : $unsigned((~&(!wire41)))) : wire36);
  assign wire49 = reg38[(2'h2):(2'h2)];
  assign wire50 = wire49[(3'h7):(3'h7)];
  assign wire51 = {$signed((reg32[(4'ha):(3'h4)] != reg22)),
                      (reg22 ? reg22 : $unsigned(wire33))};
endmodule
