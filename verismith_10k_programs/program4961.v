module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire130;
  wire signed [(2'h2):(1'h0)] wire129;
  wire [(3'h6):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire119;
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire121,
                 wire73,
                 wire75,
                 wire85,
                 wire86,
                 wire119,
                 reg124,
                 reg123,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 (1'h0)};
  module4 #() modinst74 (.wire5((8'hbb)), .clk(clk), .wire7(wire3), .wire9(wire1), .y(wire73), .wire6(wire2), .wire8(wire0));
  assign wire75 = ((wire73 ?
                      (^~(|(wire0 ? wire1 : wire0))) : (~&{wire3,
                          (wire2 <= wire73)})) << (+{$signed((wire3 <<< wire73)),
                      wire1[(4'h9):(2'h3)]}));
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg76 <= (-(((~(wire3 ? wire3 : wire2)) ?
              ((wire1 ? (8'hbf) : wire3) ?
                  (~(8'ha0)) : wire73) : wire3) | wire73[(1'h0):(1'h0)]));
          reg77 <= (8'hb6);
          if (wire75[(1'h0):(1'h0)])
            begin
              reg78 <= $signed($unsigned(wire1));
              reg79 <= $unsigned(((((^~wire3) ?
                          (wire0 < (8'ha7)) : (wire0 ? wire1 : wire0)) ?
                      wire75[(2'h2):(1'h1)] : (wire75 + (~&wire1))) ?
                  reg76[(3'h7):(2'h2)] : wire3));
              reg80 <= (-(+wire75));
              reg81 <= (+(((^{wire2, wire2}) ?
                  (^(wire0 ?
                      wire1 : wire2)) : $unsigned(reg77)) >>> (^reg76[(4'ha):(3'h5)])));
              reg82 <= $signed((((wire1[(4'h8):(2'h2)] & reg81[(1'h0):(1'h0)]) == reg81) << reg76));
            end
          else
            begin
              reg78 <= (wire73[(3'h5):(2'h2)] ?
                  $signed(reg76) : ($signed((wire3 == reg77)) ?
                      ($signed((reg81 <= wire2)) <= $signed(reg76)) : $signed($signed($signed(reg82)))));
              reg79 <= $unsigned((+({$unsigned(wire1),
                      (wire73 ? wire1 : (8'ha5))} ?
                  ($unsigned((8'ha9)) <= (8'hb0)) : {{(8'hb9)}})));
              reg80 <= ((8'hb4) ?
                  ((reg76 | (~(wire0 ? reg82 : (8'ha1)))) ?
                      ($unsigned(reg80) ?
                          ((reg76 & (7'h43)) ?
                              (!wire75) : ((8'had) ^~ wire73)) : $unsigned($unsigned(reg80))) : $unsigned($unsigned(wire1))) : (~|(reg76 ^ wire1)));
              reg81 <= wire73[(4'hc):(4'h9)];
              reg82 <= $unsigned((~($unsigned((&reg77)) < (~&(wire0 ^~ reg80)))));
            end
          reg83 <= reg81;
        end
      else
        begin
          reg76 <= (!$signed((^(((8'hab) ?
              wire0 : reg80) >= $unsigned(reg80)))));
          reg77 <= reg77[(1'h0):(1'h0)];
          reg78 <= reg80;
          reg79 <= (reg79[(3'h5):(1'h0)] | (^~$unsigned(wire2)));
          reg80 <= $unsigned(reg76);
        end
      reg84 <= (8'ha0);
    end
  assign wire85 = {$unsigned({(~reg77[(2'h3):(1'h0)])}),
                      ((|(^$unsigned(wire1))) | ((+$unsigned((8'h9e))) ?
                          (wire0 | wire73[(3'h4):(3'h4)]) : wire75[(2'h2):(1'h0)]))};
  assign wire86 = reg84;
  module87 #() modinst120 (.wire90(reg81), .y(wire119), .clk(clk), .wire89(reg77), .wire88(wire0), .wire91(reg84));
  module57 #() modinst122 (.wire61(wire85), .clk(clk), .y(wire121), .wire60(reg79), .wire59(reg82), .wire58(wire86));
  always
    @(posedge clk) begin
      reg123 <= {reg83[(1'h1):(1'h0)]};
      reg124 <= reg123;
    end
  assign wire125 = $signed(((((reg81 ?
                       reg78 : reg76) >= ((7'h44) > wire3)) >>> $signed(reg84[(4'h8):(4'h8)])) >> reg81[(4'hc):(4'h9)]));
  assign wire126 = ($signed($unsigned(((~&reg76) <= ((8'haa) || reg81)))) & reg123);
  assign wire127 = reg82[(4'hc):(4'ha)];
  assign wire128 = reg77[(4'h8):(2'h3)];
  assign wire129 = (reg84[(5'h10):(5'h10)] ?
                       wire119[(3'h7):(2'h3)] : wire126[(2'h2):(1'h1)]);
  assign wire130 = (^~reg84);
endmodule

module module87  (y, clk, wire88, wire89, wire90, wire91);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire88;
  input wire [(4'he):(1'h0)] wire89;
  input wire [(5'h13):(1'h0)] wire90;
  input wire signed [(5'h15):(1'h0)] wire91;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire117;
  assign y = {wire92, wire93, wire94, wire117, (1'h0)};
  assign wire92 = {wire91[(5'h11):(5'h11)]};
  assign wire93 = (((~|((wire90 ~^ wire89) == $signed(wire89))) << $unsigned((wire89[(4'h8):(4'h8)] ?
                          $unsigned(wire91) : $signed(wire92)))) ?
                      (wire89 ?
                          ((~|{wire88}) ?
                              (~|$signed(wire89)) : $signed((~&wire90))) : wire89) : $unsigned(wire92));
  assign wire94 = wire93[(4'h8):(3'h4)];
  module95 #() modinst118 (wire117, clk, wire93, wire92, wire94, wire91, wire89);
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire70;
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  assign y = {wire72,
                 wire54,
                 wire18,
                 wire11,
                 wire10,
                 wire56,
                 wire70,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = (wire5 <= (wire8 ?
                      ((^$signed(wire7)) ?
                          (((8'hbf) ?
                              wire8 : wire5) > $signed(wire5)) : wire7[(5'h11):(3'h4)]) : $signed(wire9[(1'h0):(1'h0)])));
  assign wire11 = wire9[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg12 <= ($unsigned(wire8) ?
          wire10[(2'h2):(2'h2)] : $signed(wire7[(5'h10):(3'h6)]));
      if ($unsigned($unsigned((8'hb5))))
        begin
          reg13 <= reg12[(1'h1):(1'h1)];
          reg14 <= (wire6[(4'he):(2'h2)] ~^ $unsigned(($unsigned($signed(wire7)) >> $unsigned($signed((8'h9d))))));
          reg15 <= (~&(~(~reg13[(1'h1):(1'h1)])));
          reg16 <= (wire7[(4'he):(1'h0)] ?
              reg12[(5'h13):(4'h9)] : (wire9[(4'hc):(3'h4)] ?
                  (~(8'hbf)) : (wire7 ^~ $signed((wire9 ? reg15 : (8'hb3))))));
        end
      else
        begin
          reg13 <= $signed((~^(~&(8'ha2))));
          reg14 <= (~&wire9);
          reg15 <= wire8[(3'h4):(1'h1)];
          reg16 <= (8'hb1);
          reg17 <= (reg16[(3'h6):(3'h6)] ^ ({$signed($signed(reg16))} <<< $signed(((wire9 ?
                  wire8 : reg12) ?
              wire6[(1'h1):(1'h1)] : reg12[(5'h12):(2'h2)]))));
        end
    end
  assign wire18 = $signed({$unsigned(($signed(wire6) > (wire9 ?
                          reg13 : (8'ha1)))),
                      (^~$signed($unsigned(reg17)))});
  module19 #() modinst55 (.wire23(wire5), .wire21(reg17), .wire22(wire8), .clk(clk), .wire20(wire7), .y(wire54));
  assign wire56 = (wire7[(5'h14):(1'h0)] & (!((reg12 >> wire10[(1'h0):(1'h0)]) ?
                      $unsigned(wire7) : {$signed(reg13)})));
  module57 #() modinst71 (.wire59(wire5), .wire60(wire9), .clk(clk), .y(wire70), .wire58(reg13), .wire61(wire18));
  assign wire72 = ($unsigned($signed(((wire56 ? wire18 : (8'hb7)) ?
                      reg17[(3'h5):(3'h4)] : $signed(wire9)))) != $signed((^$signed((wire54 ?
                      wire5 : wire56)))));
endmodule

module module57
#(parameter param68 = (({((~(8'hab)) ? (|(7'h44)) : {(8'ha6)})} ? ((((8'ha6) != (8'hbf)) & {(8'hb7), (8'ha9)}) ? (((7'h41) ^~ (8'ha2)) > ((7'h44) ? (8'had) : (7'h41))) : (((8'hab) >> (8'ha4)) <= (^~(8'hb3)))) : {{((7'h41) & (8'ha1))}}) ? (~^((~|((8'ha5) > (8'hbf))) ? ((^~(8'hb8)) | {(7'h43), (8'hb4)}) : {(!(7'h44)), ((8'hae) ? (8'ha6) : (8'hae))})) : (~|{(((7'h40) ? (8'ha1) : (8'hb9)) < ((7'h44) & (8'hb7))), (((8'h9e) ? (8'hbf) : (8'ha3)) < (^(8'h9f)))})), 
parameter param69 = (|{(8'hb4), param68}))
(y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire61;
  input wire [(2'h2):(1'h0)] wire60;
  input wire [(5'h10):(1'h0)] wire59;
  input wire [(3'h6):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  assign y = {wire66, wire65, wire64, wire63, wire62, reg67, (1'h0)};
  assign wire62 = $signed($unsigned(($signed((wire60 ? wire61 : wire58)) ?
                      (!(wire60 + wire61)) : {$signed(wire58), (-wire58)})));
  assign wire63 = wire59[(2'h2):(1'h0)];
  assign wire64 = wire59;
  assign wire65 = $signed(wire62[(3'h5):(1'h0)]);
  assign wire66 = ((wire61[(5'h14):(1'h0)] ?
                          {($signed((8'ha5)) ?
                                  (~(8'hbe)) : {(7'h41),
                                      wire65})} : (wire62[(4'hd):(4'hc)] || $unsigned(wire63))) ?
                      ($unsigned($signed((wire64 | (8'hbe)))) < (((^~wire58) << (wire58 & wire63)) ?
                          wire63 : ((wire59 == wire62) & wire60))) : (wire63[(2'h3):(1'h1)] ?
                          ($unsigned(wire64[(4'he):(2'h3)]) || wire61) : (({(8'hbd),
                                      wire60} ?
                                  (wire62 <<< (8'hb9)) : (wire58 ?
                                      wire61 : wire64)) ?
                              $unsigned(wire62) : ((|wire59) ?
                                  wire58[(1'h1):(1'h1)] : $signed((8'hbf))))));
  always
    @(posedge clk) begin
      reg67 <= wire65;
    end
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire23;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
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
                 (1'h0)};
  assign wire24 = wire21[(3'h6):(3'h4)];
  assign wire25 = ($unsigned(((wire24 + wire20) - (+wire22[(4'h8):(3'h5)]))) << wire20);
  assign wire26 = $signed($unsigned((wire23 >>> (&(wire22 ?
                      (8'ha6) : wire20)))));
  assign wire27 = wire26;
  assign wire28 = $signed(wire27[(3'h7):(2'h3)]);
  always
    @(posedge clk) begin
      if (((+(wire24 || {(8'hb4),
          (wire20 ? (8'ha8) : wire21)})) > wire20[(2'h3):(1'h0)]))
        begin
          reg29 <= wire20;
          reg30 <= (wire20[(3'h4):(2'h2)] ?
              {(^wire24),
                  (wire27[(1'h1):(1'h0)] >= ($unsigned(wire25) ?
                      $signed(wire27) : $signed(wire28)))} : ({(&(wire20 <= wire24)),
                      $unsigned($signed(wire20))} ?
                  ((8'hbe) * $unsigned({wire23,
                      wire28})) : (wire25[(4'ha):(4'ha)] ?
                      $unsigned($signed(wire25)) : $unsigned((~wire22)))));
          reg31 <= $unsigned((|reg30));
          reg32 <= wire20;
          if ($unsigned($unsigned((^~wire22[(3'h7):(3'h7)]))))
            begin
              reg33 <= ((((reg32[(3'h6):(2'h3)] < (^~reg29)) << reg31[(3'h5):(2'h2)]) ?
                  {({wire20} ? $unsigned((8'ha4)) : wire25)} : wire25) * reg32);
              reg34 <= (8'hb6);
              reg35 <= ($unsigned((8'ha5)) ?
                  ((~^(reg34[(1'h0):(1'h0)] ? wire25 : wire27[(1'h0):(1'h0)])) ?
                      reg32 : $signed(reg31)) : wire23[(4'ha):(3'h5)]);
            end
          else
            begin
              reg33 <= $unsigned((8'hb2));
            end
        end
      else
        begin
          reg29 <= $signed(reg32);
          reg30 <= (+$signed({(^~$signed(wire26)), reg34[(1'h1):(1'h0)]}));
          reg31 <= reg30;
        end
      reg36 <= $unsigned($signed(wire26[(3'h7):(1'h1)]));
      reg37 <= $unsigned((($unsigned($signed(wire21)) ?
          ((~|reg33) | (reg33 ? wire27 : wire28)) : wire22) != (wire25 ?
          {(wire21 != wire22), $signed(reg33)} : reg33[(5'h11):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg38 <= $signed(($signed($unsigned({(8'hb0)})) ?
          $unsigned((wire23[(1'h1):(1'h0)] ?
              wire25 : (wire25 ? wire28 : wire22))) : (8'hbe)));
      reg39 <= $unsigned($signed(reg38[(1'h0):(1'h0)]));
    end
  assign wire40 = ((+wire28[(4'h8):(3'h5)]) ?
                      (($signed(((8'hab) ?
                              reg29 : reg37)) + ($signed(reg37) >= wire23[(4'h8):(3'h7)])) ?
                          (^$signed({reg38})) : $unsigned($unsigned(reg37[(2'h2):(2'h2)]))) : (($unsigned($unsigned(reg30)) ?
                          $unsigned($signed(reg30)) : ((reg38 - wire24) ?
                              wire24[(3'h5):(1'h0)] : wire23)) ~^ (^~$unsigned((wire20 ?
                          reg39 : reg33)))));
  assign wire41 = ($signed(reg35) ?
                      $unsigned($unsigned(((wire21 - wire28) || reg31))) : wire26);
  assign wire42 = (|$signed(wire27[(3'h6):(3'h6)]));
  assign wire43 = $signed($signed(({wire26[(1'h0):(1'h0)]} ?
                      (&wire23) : ((reg34 ? wire23 : (8'ha2)) || {(8'ha1)}))));
  assign wire44 = $unsigned((({(reg32 >> reg35), (reg37 ? (8'hb3) : reg39)} ?
                      wire27[(3'h4):(1'h0)] : {$signed(wire28),
                          wire22[(4'ha):(2'h2)]}) * wire42));
  always
    @(posedge clk) begin
      if (wire42)
        begin
          if ($unsigned(reg35[(1'h1):(1'h0)]))
            begin
              reg45 <= {reg31[(3'h7):(3'h7)], (reg32 < reg29[(4'hb):(4'h9)])};
              reg46 <= $unsigned({((+wire43[(4'hc):(3'h7)]) ?
                      $unsigned((-wire43)) : reg38)});
            end
          else
            begin
              reg45 <= ($signed(($signed((~|reg45)) << $signed($signed((8'h9f))))) ^ (($signed(wire28[(4'hb):(4'ha)]) ?
                      $signed($unsigned(reg32)) : $signed((8'hb6))) ?
                  ($unsigned((^~reg45)) == wire23[(3'h5):(1'h1)]) : reg37));
              reg46 <= ($unsigned($unsigned($signed((-wire44)))) > $unsigned($unsigned($signed($signed((7'h43))))));
            end
          reg47 <= ((($signed({reg46}) ?
                  (|reg46[(2'h2):(1'h0)]) : $unsigned(((8'hba) ^ wire42))) >> {$signed((wire22 ?
                      (8'haf) : wire27))}) ?
              $signed((wire26 ?
                  $unsigned((reg45 << wire23)) : reg33[(3'h7):(2'h2)])) : (^~wire41[(4'h9):(3'h6)]));
        end
      else
        begin
          reg45 <= ($signed($unsigned(wire22[(1'h1):(1'h1)])) ?
              wire41[(3'h7):(1'h0)] : reg30[(4'hd):(4'hb)]);
          reg46 <= wire41;
          reg47 <= ($signed(($signed($unsigned(reg31)) | ((reg47 || reg32) ?
              wire27 : $unsigned(wire28)))) > (|(wire24 ?
              wire42 : ({reg45, reg34} * {reg29}))));
          reg48 <= (~(~{reg32, (~$unsigned(wire22))}));
          reg49 <= $unsigned($signed(reg37));
        end
      reg50 <= (wire22 <<< (($unsigned($signed(reg31)) ~^ (wire42[(2'h2):(1'h1)] ?
          wire41[(3'h5):(3'h5)] : {(7'h43),
              wire20})) ~^ $unsigned($unsigned((8'hae)))));
    end
  assign wire51 = reg32[(5'h14):(1'h1)];
  assign wire52 = $unsigned((reg31 | (|reg35)));
  assign wire53 = wire22[(1'h1):(1'h1)];
endmodule

module module95
#(parameter param115 = ((~|(&(!{(8'hbb)}))) ? ((8'hb4) <<< (8'hba)) : (|(^(8'ha4)))), 
parameter param116 = param115)
(y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire100;
  input wire signed [(3'h7):(1'h0)] wire99;
  input wire [(4'hc):(1'h0)] wire98;
  input wire [(2'h2):(1'h0)] wire97;
  input wire [(4'h8):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire109;
  wire [(5'h12):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg110 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire101 = (~^$signed($signed(wire96)));
  assign wire102 = wire100;
  assign wire103 = ((wire97[(1'h0):(1'h0)] ^~ (7'h42)) ?
                       wire102[(2'h3):(2'h3)] : ({wire100} ?
                           wire102[(1'h1):(1'h0)] : $signed(wire98[(1'h0):(1'h0)])));
  assign wire104 = (8'ha0);
  assign wire105 = $signed(wire97);
  assign wire106 = wire102;
  assign wire107 = wire102;
  assign wire108 = $signed(wire105[(4'h9):(4'h8)]);
  assign wire109 = wire101[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg110 <= {wire106};
      reg111 <= (8'hb0);
    end
  assign wire112 = wire96[(1'h0):(1'h0)];
  assign wire113 = (-(wire109[(4'h9):(1'h0)] && (wire102 ?
                       (wire102[(3'h6):(1'h1)] > wire106) : wire100[(4'ha):(4'h8)])));
  assign wire114 = ($unsigned(wire107[(1'h1):(1'h0)]) < $signed($unsigned($unsigned($unsigned(wire97)))));
endmodule
