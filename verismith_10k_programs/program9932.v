module top
#(parameter param113 = ((^{{(~^(8'hb6)), ((8'hbf) | (8'hb4))}}) ? {(|{(^~(8'hba))})} : (({((8'hba) && (7'h43))} ? (8'hab) : ({(8'h9c)} >> ((8'hbc) ? (8'hbe) : (8'hba)))) + (^(((8'hb4) ? (8'had) : (8'hbc)) <= ((8'hbf) ? (8'hb5) : (8'hb3)))))), 
parameter param114 = param113)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire101;
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire77,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire79,
                 wire101,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire5 = wire0[(4'ha):(3'h6)];
  assign wire6 = (^$unsigned(wire5[(3'h6):(2'h2)]));
  assign wire7 = $signed($signed(wire5));
  assign wire8 = $unsigned($signed(wire0[(3'h6):(1'h1)]));
  assign wire9 = ((((-$unsigned((8'hac))) ?
                             $signed((wire8 ?
                                 wire5 : wire0)) : $signed($unsigned(wire0))) ?
                         wire0 : ((~&(wire4 & wire8)) >> wire4[(2'h2):(1'h0)])) ?
                     wire7 : (^$signed({$signed(wire5)})));
  assign wire10 = $unsigned(wire5);
  assign wire11 = $unsigned($signed(wire4[(2'h3):(1'h1)]));
  module12 #() modinst78 (.wire14(wire1), .y(wire77), .clk(clk), .wire13(wire7), .wire15(wire5), .wire16(wire8), .wire17(wire3));
  assign wire79 = $unsigned($signed(wire77));
  module80 #() modinst102 (wire101, clk, wire1, wire7, wire6, wire11, wire10);
  always
    @(posedge clk) begin
      reg103 <= $unsigned($signed($unsigned((((8'hb0) <= wire77) ?
          wire5 : (wire77 <= wire9)))));
      reg104 <= ($unsigned(wire101[(2'h2):(2'h2)]) < $unsigned($unsigned(((wire0 < (8'hba)) ?
          $unsigned(wire2) : (wire9 + reg103)))));
      reg105 <= (&(!$signed({(wire7 >> wire79)})));
      reg106 <= (^wire6);
      reg107 <= $unsigned((^~wire5));
    end
  always
    @(posedge clk) begin
      reg108 <= $signed($unsigned((((wire101 || wire77) ?
          (wire8 < wire77) : (wire3 == wire0)) | $signed($signed(wire4)))));
      reg109 <= ({(wire7[(1'h0):(1'h0)] ?
                  $signed(wire7[(4'h9):(2'h3)]) : {(reg104 ? wire3 : wire8)}),
              reg106[(4'hb):(4'ha)]} ?
          $signed(($signed((wire7 <= reg108)) << $unsigned(wire77[(1'h0):(1'h0)]))) : (&wire4));
      reg110 <= wire3[(1'h1):(1'h0)];
    end
  assign wire111 = (|reg105);
  assign wire112 = $signed(($unsigned($signed((reg107 ~^ wire3))) ?
                       (|($unsigned(wire77) ?
                           $signed(reg107) : $unsigned(wire6))) : (-(|wire8))));
endmodule

module module80
#(parameter param99 = ((8'hb7) ? (((|(8'hbe)) ? ((~&(8'hbf)) ? ((8'hac) ? (8'hbb) : (8'hb1)) : ((8'h9f) ^ (8'had))) : (((8'hb0) ? (8'hb5) : (8'hb2)) || {(7'h42), (8'h9d)})) <<< (~|(((8'ha5) << (8'hb0)) ? ((8'hbb) - (8'haa)) : {(8'ha5), (8'hb4)}))) : (((((8'ha6) < (8'h9f)) ? ((8'hb7) >> (8'hb3)) : ((8'hac) ? (8'hab) : (8'ha2))) ~^ (((8'h9f) ^ (8'h9f)) ? {(8'hb8), (8'haf)} : (-(8'ha6)))) >> (((~(8'hb1)) <<< ((8'haa) ? (8'hbf) : (8'hbf))) ^ (~{(7'h40), (8'ha2)})))), 
parameter param100 = (((((!param99) ? (param99 ? (8'h9e) : param99) : param99) > param99) <<< ((^~param99) && (&{param99}))) || (param99 ? (|(~&param99)) : param99)))
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire85;
  input wire signed [(3'h5):(1'h0)] wire84;
  input wire signed [(5'h13):(1'h0)] wire83;
  input wire signed [(4'ha):(1'h0)] wire82;
  input wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire86;
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire86 = wire83;
  assign wire87 = (wire86[(3'h7):(3'h7)] ?
                      wire82 : $signed({(&(wire82 || wire86)),
                          (~$signed(wire82))}));
  assign wire88 = wire87[(3'h4):(1'h0)];
  assign wire89 = $signed(wire81);
  assign wire90 = $unsigned((|((((8'ha1) ?
                      wire85 : wire87) == wire84[(2'h3):(1'h0)]) & {{wire81}})));
  assign wire91 = ((|wire81) & {($unsigned((^~(8'hbf))) < ($signed(wire82) && (wire86 == wire82))),
                      wire89});
  always
    @(posedge clk) begin
      reg92 <= {({((8'hab) ? wire86 : wire87[(3'h7):(2'h2)]),
              {$unsigned(wire86)}} > wire82),
          wire88};
      reg93 <= reg92[(2'h3):(2'h3)];
    end
  assign wire94 = (wire85[(1'h0):(1'h0)] >= (~&(~^(wire89[(3'h6):(3'h6)] ?
                      $unsigned(wire84) : {wire88}))));
  assign wire95 = {{(~|$signed(wire89)),
                          ({(wire85 ? wire90 : wire87),
                              {wire91, wire85}} && $signed(wire85))},
                      (wire84 >>> $signed($signed((~reg93))))};
  assign wire96 = (wire84[(3'h4):(3'h4)] ?
                      (wire91[(3'h5):(1'h1)] ?
                          ($unsigned((!wire91)) >= (+$signed(wire90))) : wire94[(2'h3):(1'h1)]) : (~(($unsigned(reg92) ?
                              (8'hb3) : (wire84 ? reg92 : reg93)) ?
                          $signed(((8'hb7) ?
                              wire87 : wire94)) : ($signed(wire88) ?
                              {reg93} : {wire94, wire83}))));
  assign wire97 = ((8'hb2) >= reg93);
  assign wire98 = (wire81 == wire97);
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h20c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire17;
  input wire [(3'h6):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire18;
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  assign y = {wire67,
                 wire65,
                 wire63,
                 wire48,
                 wire47,
                 wire35,
                 wire34,
                 wire33,
                 wire18,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg66,
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
                 (1'h0)};
  assign wire18 = $unsigned((~|wire16[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      reg19 <= (~|$unsigned((~^(wire13[(5'h10):(3'h5)] < {wire13, wire16}))));
      reg20 <= {(((8'hb4) ?
                  wire13[(2'h3):(2'h2)] : ((wire15 ?
                      (8'ha3) : reg19) >>> {wire14, wire16})) ?
              $signed((^(wire15 ? (8'ha9) : reg19))) : reg19),
          $unsigned(reg19[(3'h6):(2'h2)])};
      if ((+$unsigned($unsigned((&(reg19 ? reg20 : reg20))))))
        begin
          reg21 <= wire13[(4'h8):(1'h0)];
          reg22 <= (!wire16);
        end
      else
        begin
          reg21 <= (-$signed((wire17[(2'h2):(1'h1)] ?
              {wire17} : $unsigned($signed(wire17)))));
          reg22 <= ($unsigned($unsigned($signed((wire18 ? (8'had) : reg19)))) ?
              $unsigned(wire17) : (reg21 + {$signed(((8'hac) ? reg20 : reg19)),
                  (^$unsigned(reg20))}));
        end
      if ($signed(wire17[(2'h2):(2'h2)]))
        begin
          reg23 <= (~|$signed($signed((!(!reg20)))));
        end
      else
        begin
          reg23 <= ({((^wire14) > $unsigned($unsigned(reg23))),
              $signed((!(wire16 + (8'hbc))))} && (&$signed(wire14)));
          reg24 <= (+(wire18[(5'h11):(1'h0)] << $unsigned(reg21[(2'h3):(2'h3)])));
          reg25 <= (8'hbb);
          reg26 <= wire18;
          if (reg19[(3'h4):(3'h4)])
            begin
              reg27 <= $unsigned($signed((((wire16 ?
                  reg26 : reg20) << $unsigned(wire16)) && (wire15[(3'h5):(3'h5)] << (wire15 ?
                  reg26 : wire13)))));
              reg28 <= reg23[(1'h1):(1'h1)];
              reg29 <= $signed((!reg20));
              reg30 <= ((8'ha6) ?
                  (~|$unsigned({(^wire14), $unsigned(reg28)})) : reg26);
              reg31 <= ($signed(wire16[(3'h6):(2'h3)]) >>> $signed(($signed(reg21) <= (8'hbe))));
            end
          else
            begin
              reg27 <= ((reg21 <<< reg30) < $unsigned({reg24}));
              reg28 <= $signed({{{wire14[(4'h9):(1'h0)]},
                      (|reg29[(4'hb):(3'h7)])}});
              reg29 <= ((($unsigned(reg27) << $unsigned(reg25[(4'h8):(3'h4)])) ?
                      reg29 : $signed($unsigned((reg29 ~^ reg31)))) ?
                  $signed($unsigned({reg20[(1'h1):(1'h1)]})) : ($unsigned((^$signed(wire15))) >>> wire15));
              reg30 <= (&(+(reg21 | $unsigned(((8'had) ? reg28 : (8'hb2))))));
              reg31 <= (reg23 <<< (({(8'hb0), (~reg29)} ?
                      wire14[(1'h0):(1'h0)] : wire15) ?
                  {((reg30 ? reg22 : reg28) ? reg28 : (reg25 ? reg24 : reg19)),
                      $signed($unsigned(wire18))} : (^~((wire14 >> wire17) ?
                      ((8'hb1) ~^ reg31) : $unsigned(reg27)))));
            end
        end
      reg32 <= reg23[(2'h2):(2'h2)];
    end
  assign wire33 = $signed($signed(reg29));
  assign wire34 = $unsigned($signed({$unsigned(wire33), reg28}));
  assign wire35 = reg31;
  always
    @(posedge clk) begin
      if ((wire16 ? $signed(reg29) : reg31))
        begin
          reg36 <= $unsigned((!$signed(reg29)));
          reg37 <= reg25;
        end
      else
        begin
          if (reg27[(4'h8):(3'h5)])
            begin
              reg36 <= (({reg25, $unsigned(reg29[(4'h8):(3'h4)])} ?
                      ((8'hae) ?
                          reg24[(1'h0):(1'h0)] : ((~|reg30) ?
                              (reg22 ? wire16 : (8'ha1)) : reg26)) : reg28) ?
                  reg37 : reg29);
              reg37 <= (wire34[(4'hb):(2'h3)] ?
                  (reg37 == $signed($unsigned((wire35 || reg19)))) : ((~{(reg31 && wire18)}) ?
                      ({(&reg22)} ?
                          ($unsigned(wire16) ?
                              $signed((7'h40)) : (reg36 - reg26)) : ($unsigned(wire18) * wire17)) : ($signed((!wire17)) ?
                          reg26[(2'h2):(1'h1)] : $signed($unsigned((8'hb2))))));
              reg38 <= $signed($unsigned($signed(reg37[(3'h7):(3'h5)])));
            end
          else
            begin
              reg36 <= $signed(wire18[(5'h13):(4'hd)]);
              reg37 <= (|$signed((($unsigned(reg31) != reg25) << $unsigned((8'hb7)))));
              reg38 <= $unsigned(({$signed((reg36 ? wire16 : wire34)),
                  $signed((reg20 * wire18))} ^ reg38));
              reg39 <= {reg30, $signed((-wire33[(4'h9):(1'h1)]))};
              reg40 <= $signed($signed(reg27));
            end
          reg41 <= reg23[(1'h1):(1'h0)];
          reg42 <= ($unsigned(($unsigned((~&reg25)) || reg29)) >>> (!reg22));
          if ((reg23[(1'h1):(1'h0)] ?
              reg32[(4'he):(4'hb)] : ($unsigned(((^~reg25) ?
                  (wire35 ?
                      (8'h9e) : reg24) : $unsigned(reg26))) <<< $unsigned(((~|(8'ha1)) ?
                  {reg32, reg36} : $signed((8'ha6)))))))
            begin
              reg43 <= (|$unsigned(reg39[(4'h8):(1'h0)]));
              reg44 <= wire13;
              reg45 <= (^~$unsigned({$unsigned($signed(wire14))}));
            end
          else
            begin
              reg43 <= {$signed({{reg42, (|(8'hb2))}}), (~^(8'ha2))};
            end
          reg46 <= {((+reg28) || reg24[(2'h3):(2'h2)])};
        end
    end
  assign wire47 = $unsigned(((($signed(wire15) ?
                          $unsigned(reg30) : (&reg37)) <<< (reg39 ?
                          $unsigned(reg28) : reg42[(5'h13):(3'h4)])) ?
                      reg30[(4'h8):(3'h7)] : ($signed(reg37) || $unsigned(((8'hac) << (8'ha9))))));
  assign wire48 = $unsigned((-($unsigned($unsigned((8'hac))) ?
                      $signed({reg20}) : reg31)));
  module49 #() modinst64 (wire63, clk, reg43, reg21, reg41, reg44);
  assign wire65 = $signed((((8'h9c) - $unsigned(wire33)) >> (reg19[(3'h5):(2'h3)] | wire17)));
  always
    @(posedge clk) begin
      reg66 <= ($signed({($signed(reg46) ? $signed((8'hb7)) : reg28)}) ?
          reg40[(4'ha):(1'h0)] : $signed((~&(~&(&(8'ha3))))));
    end
  assign wire67 = reg42;
  always
    @(posedge clk) begin
      reg68 <= ((reg23[(2'h2):(1'h1)] ?
          {(((8'hbd) ~^ reg27) ?
                  (reg66 ^~ (8'hb7)) : $signed(wire67))} : ($unsigned({(8'ha5),
                  reg24}) ?
              $unsigned((reg46 > wire13)) : (|(~&(8'hb3))))) & {$unsigned($unsigned((wire13 ?
              reg22 : wire13)))});
      if (reg68[(4'h8):(1'h0)])
        begin
          if (reg31)
            begin
              reg69 <= {$unsigned((&(reg26 ? wire34 : reg22[(3'h7):(1'h1)])))};
              reg70 <= {{$unsigned(((-wire13) || $signed(wire65))),
                      $unsigned($signed($signed(reg38)))}};
            end
          else
            begin
              reg69 <= wire65;
              reg70 <= reg39[(1'h1):(1'h0)];
            end
          reg71 <= (+((((~(8'hab)) ? (|reg27) : (~^reg68)) >= wire18) ?
              $signed($unsigned(reg43)) : {(^$unsigned(wire17))}));
          reg72 <= (($unsigned((((8'hbe) ?
              wire15 : reg37) <= reg25)) || (reg39[(2'h3):(1'h1)] ?
              wire13[(3'h6):(3'h4)] : ($unsigned(reg43) ?
                  $signed(wire34) : ((8'hb0) <<< reg71)))) & (~&({reg36[(2'h2):(2'h2)]} ?
              (!$unsigned((8'ha4))) : reg42[(4'hb):(1'h1)])));
          reg73 <= reg42;
          reg74 <= wire15;
        end
      else
        begin
          if (wire63[(4'hb):(3'h4)])
            begin
              reg69 <= reg68;
              reg70 <= (reg45 ?
                  reg37[(2'h3):(1'h0)] : ($signed(($signed(reg46) ?
                      $unsigned((8'hb4)) : reg20)) <<< $signed(wire18[(1'h0):(1'h0)])));
              reg71 <= (+((~($unsigned(reg72) ?
                  (~wire63) : reg73)) != (((!wire67) ?
                      {wire48, reg38} : reg44[(3'h5):(3'h5)]) ?
                  wire33 : $signed(wire33))));
              reg72 <= reg25[(4'h9):(1'h1)];
            end
          else
            begin
              reg69 <= $signed((+$signed((^~wire63[(3'h4):(2'h3)]))));
              reg70 <= (|reg39[(1'h1):(1'h1)]);
            end
          reg73 <= $signed(($unsigned((!(reg43 - (8'ha2)))) ?
              wire63 : ((~|$unsigned(reg46)) & $unsigned(wire18[(4'ha):(2'h3)]))));
          reg74 <= (reg40 * reg24[(3'h4):(1'h0)]);
        end
      reg75 <= (reg22[(5'h11):(4'hd)] <<< {$unsigned((^~wire47))});
      reg76 <= (!wire47);
    end
endmodule

module module49
#(parameter param61 = ((({{(8'ha8)}} >= (7'h43)) >>> ((~((8'hb3) >>> (8'ha6))) ^~ (^(|(8'ha5))))) != ((((|(8'hac)) ? ((8'hbf) <= (8'ha7)) : ((8'ha8) ? (8'hbd) : (8'hbd))) ^ {{(8'hb2), (8'ha2)}}) <<< ((((8'ha8) || (8'h9c)) | ((8'ha5) >> (8'ha8))) + (~&(^~(8'hb8)))))), 
parameter param62 = (param61 | (param61 & {((param61 | param61) ? (^~(8'ha3)) : {(8'hbd)}), ((^(8'hac)) | param61)})))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire53;
  input wire signed [(5'h10):(1'h0)] wire52;
  input wire signed [(3'h5):(1'h0)] wire51;
  input wire [(2'h2):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire54;
  assign y = {wire60, wire59, wire58, wire57, wire56, wire55, wire54, (1'h0)};
  assign wire54 = {($unsigned(wire50) >>> ($unsigned({wire52}) ?
                          $signed(wire52[(1'h1):(1'h0)]) : wire51)),
                      $signed(($signed(wire50[(2'h2):(1'h0)]) - wire50[(1'h0):(1'h0)]))};
  assign wire55 = ((($unsigned($unsigned(wire53)) + ((wire50 ?
                      wire52 : (8'hae)) & wire51[(2'h3):(2'h3)])) >>> $signed(((8'hb6) ?
                      wire53[(4'hc):(2'h2)] : (^wire52)))) >= (($unsigned(((8'hb7) ?
                      wire51 : (8'h9e))) >>> $signed(((8'ha0) < wire52))) * $signed({(wire50 ^~ wire54),
                      $unsigned(wire52)})));
  assign wire56 = (({$unsigned(wire52[(1'h0):(1'h0)])} + (~&$unsigned(wire50))) ?
                      ((~&$unsigned($unsigned(wire50))) ?
                          {(~|((8'hb7) ?
                                  wire54 : wire54))} : (($unsigned(wire52) ?
                              wire55[(1'h1):(1'h1)] : $unsigned(wire52)) <<< $unsigned((wire55 ?
                              wire55 : (8'ha4))))) : wire51[(2'h2):(1'h1)]);
  assign wire57 = wire51[(1'h0):(1'h0)];
  assign wire58 = ((-wire52) ?
                      ($signed({(+wire53),
                          $signed((8'had))}) < (8'ha8)) : wire51[(1'h0):(1'h0)]);
  assign wire59 = $signed($unsigned(wire58));
  assign wire60 = ((wire59[(2'h2):(1'h1)] || (!wire53)) ^~ {wire57[(2'h3):(1'h1)]});
endmodule
