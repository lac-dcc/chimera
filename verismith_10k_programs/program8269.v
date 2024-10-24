module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire4,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire4 = ((wire3[(2'h2):(1'h1)] ?
                     wire2[(3'h4):(3'h4)] : {(((7'h43) ?
                             wire3 : (7'h40)) & $unsigned((8'ha9)))}) >= wire3[(4'h8):(2'h3)]);
  module5 #() modinst80 (.wire7(wire1), .wire9(wire2), .clk(clk), .wire6(wire4), .y(wire79), .wire8(wire3));
  assign wire81 = $signed(wire1[(3'h7):(1'h1)]);
  assign wire82 = $signed({$signed($unsigned($signed(wire3))),
                      $signed($signed(wire3))});
  assign wire83 = ((~|wire3[(4'h9):(1'h0)]) ?
                      wire79[(4'hc):(4'ha)] : ($unsigned((+(!wire81))) ?
                          wire0[(3'h4):(1'h1)] : wire79));
  always
    @(posedge clk) begin
      reg84 <= $unsigned(wire83[(5'h10):(2'h2)]);
      reg85 <= $signed(wire79);
      if ((wire79[(2'h2):(2'h2)] ?
          $signed({(^$signed((8'hb0))),
              $unsigned(wire79[(4'hb):(1'h0)])}) : $unsigned($unsigned(wire3))))
        begin
          reg86 <= (~|($unsigned($signed((^~reg84))) & (wire3 <<< reg85)));
          reg87 <= {wire79,
              $signed((((wire79 ? wire79 : wire2) ?
                      (^~wire3) : wire4[(4'hc):(4'h8)]) ?
                  (wire4[(5'h14):(5'h12)] ?
                      wire2[(4'h8):(1'h0)] : $unsigned(reg86)) : wire82[(2'h2):(1'h1)]))};
          reg88 <= (reg85 ^ {(!(reg85 ? $unsigned(wire83) : $signed(wire81)))});
          reg89 <= wire0[(2'h3):(2'h3)];
        end
      else
        begin
          reg86 <= wire82[(2'h2):(1'h1)];
          if ((wire83 ?
              $unsigned({($signed(wire83) ?
                      (wire3 == reg86) : $unsigned(reg89))}) : (reg84[(4'hb):(2'h3)] ?
                  $signed(wire79[(3'h6):(3'h4)]) : $unsigned({(wire81 ?
                          wire83 : wire83),
                      wire2[(2'h2):(1'h1)]}))))
            begin
              reg87 <= {{($signed(wire79[(4'hd):(4'hb)]) ?
                          reg85[(1'h1):(1'h1)] : (|$signed(reg86)))},
                  ($signed(((~^reg85) > (wire81 <= wire2))) ?
                      wire79[(3'h7):(2'h3)] : $unsigned($signed(((8'hb5) ?
                          reg86 : (8'haf)))))};
              reg88 <= $unsigned((wire3[(4'hf):(3'h7)] + ($signed((wire81 - (8'hac))) ~^ {$signed(wire2)})));
              reg89 <= ($unsigned(reg85[(3'h7):(3'h7)]) ?
                  ((-$unsigned((wire79 ?
                      wire82 : wire83))) == (wire1[(3'h4):(1'h1)] ?
                      $signed((^wire3)) : (+wire81[(3'h6):(1'h1)]))) : (~&reg84));
            end
          else
            begin
              reg87 <= $unsigned(reg85[(1'h0):(1'h0)]);
            end
        end
      reg90 <= (~^($signed(wire82[(2'h3):(2'h3)]) ? wire79 : $unsigned(wire4)));
      reg91 <= $unsigned(reg87);
    end
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h21e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire6;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire21;
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire68,
                 wire53,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire23,
                 wire10,
                 wire21,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 (1'h0)};
  assign wire10 = (|((wire9 ?
                      $unsigned((wire7 ?
                          wire9 : wire9)) : ((~^wire9) < (!wire6))) << (7'h42)));
  module11 #() modinst22 (.wire16(wire8), .wire13(wire9), .wire12(wire10), .wire15(wire7), .clk(clk), .wire14(wire6), .y(wire21));
  assign wire23 = ((+$unsigned(((^wire8) ^~ ((8'hb9) != wire6)))) >>> wire8[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg24 <= wire8;
      reg25 <= (($signed(wire8) ?
          reg24[(1'h0):(1'h0)] : reg24) >= {reg24[(3'h5):(3'h5)],
          ({(wire9 ^~ wire8)} ?
              ((~|wire7) == $unsigned(wire8)) : (&$unsigned(wire21)))});
      reg26 <= reg24;
      reg27 <= (wire7 ?
          {(({wire6, wire6} > (reg24 ? wire6 : wire21)) + reg25[(4'h9):(1'h0)]),
              (((&reg26) && wire9[(2'h2):(1'h0)]) ^~ $unsigned((reg24 & reg26)))} : reg26);
    end
  assign wire28 = reg25[(3'h7):(2'h3)];
  assign wire29 = (+reg26);
  assign wire30 = {(!wire29[(4'hd):(4'hd)]), $signed(reg27[(4'ha):(4'h8)])};
  assign wire31 = wire30[(1'h1):(1'h1)];
  assign wire32 = (+wire29[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ($unsigned(({wire23[(2'h2):(1'h1)],
          (wire6[(1'h0):(1'h0)] != (^~wire32))} < $unsigned({{wire29},
          {wire6}}))))
        begin
          reg33 <= (^({$unsigned($signed(wire9))} << $signed((((8'hb5) != (7'h41)) ?
              {reg27} : $signed((8'hae))))));
          reg34 <= {((wire30[(2'h2):(1'h1)] || $unsigned(wire7)) && ($unsigned((reg33 >= wire29)) ?
                  $unsigned((wire32 - reg26)) : (+$unsigned(wire32))))};
          if ((^~$unsigned(wire21)))
            begin
              reg35 <= (wire21[(4'h8):(2'h3)] ?
                  $unsigned(reg24[(3'h5):(2'h3)]) : ({$signed((wire6 >> (8'hba)))} ?
                      (-wire8[(1'h1):(1'h0)]) : ((~&$unsigned(wire23)) ?
                          ((~&reg26) ?
                              $signed(wire23) : wire9) : (~|(~&(8'hb4))))));
              reg36 <= wire21;
              reg37 <= reg34[(3'h6):(1'h1)];
            end
          else
            begin
              reg35 <= $unsigned({(~^{((8'hb0) ? wire29 : reg33),
                      wire29[(2'h2):(1'h1)]}),
                  (($unsigned((8'hb5)) & (8'ha2)) != (wire8 ?
                      reg24[(3'h6):(1'h1)] : wire21[(4'hb):(2'h3)]))});
              reg36 <= $unsigned((&(~^wire23)));
            end
          reg38 <= reg35[(3'h5):(3'h4)];
          reg39 <= wire10[(3'h7):(3'h5)];
        end
      else
        begin
          reg33 <= wire32;
          reg34 <= $unsigned($unsigned(wire6));
          if (({{{(~wire6), reg27},
                  ((-wire9) >>> ((8'h9e) ? (8'haa) : wire32))}} & ((({reg39,
                      reg35} == {wire32, reg24}) ?
                  (!reg39) : (~^(wire31 * wire31))) ?
              $unsigned({(wire9 > reg36)}) : reg25[(4'ha):(4'ha)])))
            begin
              reg35 <= $signed(reg36);
              reg36 <= (~^($unsigned((+$signed(reg34))) ?
                  (&{wire8, wire10[(4'hf):(3'h5)]}) : $unsigned(reg27)));
              reg37 <= {(~reg25), wire6};
              reg38 <= (wire23[(4'ha):(3'h4)] ?
                  $unsigned({wire7, reg27}) : reg38[(1'h1):(1'h0)]);
            end
          else
            begin
              reg35 <= ((^~{$unsigned((-wire23)), wire31[(5'h13):(3'h6)]}) ?
                  wire21[(4'hb):(1'h1)] : reg39[(3'h4):(1'h0)]);
              reg36 <= ($signed((reg38[(3'h5):(3'h4)] * $signed($signed((8'h9e))))) ?
                  wire32[(3'h5):(1'h0)] : (reg25[(1'h1):(1'h1)] ?
                      $unsigned($unsigned((reg36 == wire28))) : wire6));
              reg37 <= (~&(|$unsigned(wire23[(5'h11):(4'hf)])));
            end
          reg39 <= ($unsigned($signed((((8'had) ? reg38 : wire10) ?
                  reg33[(4'h9):(4'h8)] : (^~wire8)))) ?
              (&$signed(reg39[(1'h1):(1'h1)])) : $unsigned(({reg27,
                      $unsigned(reg37)} ?
                  (+(~|wire9)) : (|(wire30 >= wire6)))));
          reg40 <= (reg33 ?
              ($signed(reg24) <= (wire7 - $unsigned(reg34))) : (&(^$signed((~|wire30)))));
        end
      reg41 <= wire32;
      if ((^reg40[(4'hc):(4'h9)]))
        begin
          reg42 <= wire6[(4'h8):(3'h4)];
          reg43 <= reg35[(3'h6):(3'h6)];
          reg44 <= ((($unsigned((^~wire7)) ?
              ((reg41 & reg42) ?
                  ((8'haa) | reg35) : ((8'ha1) ?
                      reg40 : reg42)) : $unsigned((~^wire9))) < (((7'h44) ?
                  (reg43 ? (8'hbe) : reg25) : wire31) ?
              ((reg26 == wire28) ?
                  $signed(wire29) : reg38[(3'h5):(1'h0)]) : reg41)) || reg26);
          reg45 <= ({$signed(wire8[(3'h6):(1'h0)]),
                  (~(reg33[(1'h1):(1'h1)] ?
                      {reg42, wire8} : (wire6 ? reg40 : wire6)))} ?
              {reg39[(3'h5):(3'h5)]} : wire29[(3'h6):(3'h6)]);
        end
      else
        begin
          reg42 <= $signed((wire29 && ({(wire7 ? wire32 : reg26),
                  $unsigned(reg42)} ?
              $unsigned({reg34, reg43}) : ((~wire10) ?
                  $unsigned(wire6) : $unsigned(wire9)))));
          if (wire31)
            begin
              reg43 <= reg34;
              reg44 <= ($unsigned(wire8[(1'h0):(1'h0)]) ?
                  $signed($unsigned($signed(((8'hba) ?
                      reg40 : wire8)))) : {reg34});
              reg45 <= (wire31[(4'h9):(4'h9)] ?
                  $signed((+wire31)) : $signed(reg38));
              reg46 <= reg42;
            end
          else
            begin
              reg43 <= (~$unsigned(($unsigned({wire28,
                  wire32}) << ($signed(reg39) ?
                  (-reg24) : wire29[(5'h13):(3'h6)]))));
            end
        end
      if ($unsigned({$unsigned($unsigned(wire8))}))
        begin
          if ((^wire9[(1'h0):(1'h0)]))
            begin
              reg47 <= reg26[(4'hc):(4'h9)];
              reg48 <= wire28;
              reg49 <= (reg45 ?
                  reg35 : (!{($unsigned(reg36) ? reg37[(4'hc):(1'h0)] : reg39),
                      $signed(reg25[(1'h1):(1'h1)])}));
              reg50 <= (!$unsigned($signed((~reg25[(3'h5):(3'h5)]))));
            end
          else
            begin
              reg47 <= {reg36[(2'h2):(1'h0)],
                  {({$signed(wire7)} >= $signed((reg47 ? wire10 : reg35)))}};
            end
          reg51 <= $unsigned((wire6[(3'h5):(2'h2)] ^~ $signed($signed((+reg37)))));
        end
      else
        begin
          reg47 <= $signed((^~((~|reg36[(2'h2):(1'h1)]) ?
              $unsigned((reg47 ~^ reg34)) : ((~|reg47) ?
                  {wire28, reg42} : wire29[(5'h14):(5'h14)]))));
          reg48 <= (^reg44[(1'h1):(1'h0)]);
          reg49 <= reg25[(1'h0):(1'h0)];
        end
      reg52 <= $unsigned((wire8[(3'h6):(1'h1)] ?
          $unsigned($unsigned({wire32, wire23})) : reg24[(3'h4):(2'h3)]));
    end
  assign wire53 = {(&(~&wire7)), $unsigned($signed(wire8[(4'h8):(3'h4)]))};
  module54 #() modinst69 (wire68, clk, reg46, reg27, reg24, wire30, wire9);
  always
    @(posedge clk) begin
      if ({reg33[(3'h4):(1'h1)]})
        begin
          if (((+$signed(((reg24 ? reg34 : wire8) && $unsigned(reg35)))) ?
              $unsigned((($signed(wire32) ?
                      $signed(wire53) : wire28[(4'h8):(3'h4)]) ?
                  (wire29 | wire6[(4'hd):(4'h9)]) : reg35[(1'h0):(1'h0)])) : $signed(wire7)))
            begin
              reg70 <= (((wire7 ? $unsigned(reg37) : reg33) ?
                      wire30[(3'h5):(1'h1)] : $unsigned(wire32)) ?
                  wire8 : ({$unsigned($unsigned(reg47)),
                      wire32[(4'h8):(3'h7)]} * $signed({(reg48 || wire9),
                      $signed(reg52)})));
              reg71 <= ((reg43[(2'h3):(1'h1)] != reg49[(4'hb):(3'h6)]) ?
                  (reg38 ?
                      $signed(reg33) : (($unsigned((8'h9f)) > $signed(wire21)) + reg24)) : (7'h41));
              reg72 <= wire10[(3'h6):(2'h3)];
              reg73 <= {($unsigned(($signed((8'h9c)) ?
                          (&(8'hb0)) : reg27[(1'h0):(1'h0)])) ?
                      (~|reg41[(3'h6):(2'h2)]) : ((wire30[(1'h0):(1'h0)] ~^ $unsigned((8'h9e))) ?
                          $unsigned(wire32[(4'hf):(4'he)]) : {(!reg40)})),
                  $unsigned(wire8)};
            end
          else
            begin
              reg70 <= reg40;
              reg71 <= (wire23[(4'he):(4'h8)] ^~ reg40);
              reg72 <= (~^$unsigned((reg43[(3'h4):(1'h1)] ?
                  ($unsigned(reg48) < (8'ha3)) : reg47)));
              reg73 <= (wire31[(5'h11):(4'ha)] ?
                  $unsigned($signed(wire23[(4'hc):(4'hb)])) : wire23[(2'h3):(2'h3)]);
              reg74 <= $unsigned(((((reg36 != wire68) || reg51) ?
                      (wire7 - reg37) : $signed((reg46 * wire31))) ?
                  reg46 : reg27[(2'h2):(1'h1)]));
            end
        end
      else
        begin
          if ($signed(reg72))
            begin
              reg70 <= (|$unsigned($unsigned(wire32[(5'h11):(3'h5)])));
              reg71 <= (^reg48);
              reg72 <= {$signed((+(reg40 > reg50))),
                  $signed(((reg33[(1'h1):(1'h0)] <<< $unsigned(reg43)) ^~ {$unsigned(reg42)}))};
              reg73 <= reg44;
            end
          else
            begin
              reg70 <= ($unsigned((~&(^~{(8'hb3)}))) ?
                  (^$signed((&reg48[(1'h0):(1'h0)]))) : reg73[(1'h1):(1'h0)]);
            end
          reg74 <= (reg37[(3'h7):(3'h6)] ^~ wire29[(4'hd):(1'h1)]);
        end
      reg75 <= wire53[(3'h6):(1'h0)];
    end
  assign wire76 = {(reg26 ?
                          $unsigned((reg42 ?
                              ((8'hbd) ~^ reg26) : {reg34})) : $signed((reg49 ?
                              (wire68 ? reg74 : reg43) : $unsigned(reg25)))),
                      ($unsigned(reg40) != reg38)};
  assign wire77 = wire21;
  assign wire78 = ((wire28 ?
                      reg48 : $unsigned({$signed(reg44),
                          reg47[(4'ha):(2'h2)]})) ~^ wire31);
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire59;
  input wire signed [(4'h9):(1'h0)] wire58;
  input wire signed [(5'h15):(1'h0)] wire57;
  input wire signed [(3'h5):(1'h0)] wire56;
  input wire [(3'h7):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg65,
                 (1'h0)};
  assign wire60 = $signed(($signed(((^~wire59) >>> ((8'ha4) ?
                      wire55 : wire55))) == ((-wire58[(2'h3):(1'h1)]) ?
                      (|$unsigned((8'h9e))) : {(wire58 >> wire56)})));
  assign wire61 = $signed((((|(&wire59)) * $signed($unsigned((8'haf)))) - ($unsigned($signed(wire57)) || (~^$unsigned(wire59)))));
  assign wire62 = $signed({((+(wire57 ? wire59 : wire61)) >> $signed((wire60 ?
                          wire61 : (8'ha2)))),
                      ($unsigned($signed(wire60)) ?
                          wire56[(1'h1):(1'h1)] : (-(~wire59)))});
  assign wire63 = $unsigned($signed(wire59[(1'h1):(1'h0)]));
  assign wire64 = ($unsigned({(wire57 || wire63[(3'h4):(1'h1)])}) ?
                      {$signed(wire57[(5'h11):(2'h2)])} : $signed(wire59));
  always
    @(posedge clk) begin
      reg65 <= {(wire63[(1'h1):(1'h0)] == $signed($signed($unsigned((8'hbd)))))};
    end
  assign wire66 = wire58;
  assign wire67 = wire56;
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire signed [(4'h9):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  assign y = {wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = wire13[(2'h3):(1'h1)];
  assign wire18 = {(((-$signed(wire17)) && (8'h9c)) ?
                          (|wire17) : (wire17[(3'h7):(2'h2)] >> $signed($signed((8'ha1)))))};
  assign wire19 = (wire12 ?
                      (!(wire15 >= (wire18 + wire16[(1'h1):(1'h1)]))) : $signed($signed((wire13[(1'h1):(1'h0)] ?
                          (-wire12) : ((8'hb6) ? wire13 : wire13)))));
  assign wire20 = ($unsigned($signed({(~&wire17),
                      (wire14 | wire16)})) >> (~|wire19[(3'h7):(1'h0)]));
endmodule
