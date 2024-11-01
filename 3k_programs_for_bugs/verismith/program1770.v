module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire103;
  reg [(3'h6):(1'h0)] reg4 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire140,
                 wire107,
                 wire106,
                 wire105,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire103,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(($signed((wire2[(2'h2):(2'h2)] ?
          {wire0,
              wire0} : wire3)) - ($signed((8'hb8)) > wire2[(1'h0):(1'h0)])));
      reg5 <= $unsigned(($unsigned((wire1[(4'hc):(2'h3)] ?
          ((8'hb1) - wire1) : $signed((8'ha4)))) <<< ($signed((+wire1)) ?
          (+wire0[(4'h9):(3'h7)]) : (7'h43))));
      reg6 <= $unsigned(((|(wire2 <= wire0)) << $signed($unsigned($signed((7'h41))))));
      reg7 <= ((~^wire2[(2'h2):(2'h2)]) * (reg5 != ($unsigned($unsigned(reg5)) ^ $signed(wire2))));
      reg8 <= $signed($signed(reg7));
    end
  assign wire9 = $signed((^~reg6[(1'h1):(1'h0)]));
  assign wire10 = $signed($signed(reg7[(4'h9):(3'h5)]));
  assign wire11 = (({$signed(wire9[(3'h5):(1'h1)]), reg8[(4'h8):(2'h2)]} ?
                      {(reg6 ? $signed(wire1) : (-reg4)),
                          $unsigned(((8'ha6) ?
                              wire10 : reg8))} : (+(reg8[(2'h3):(2'h2)] ?
                          (~^reg5) : wire0[(3'h4):(2'h2)]))) && ((((8'hb2) ?
                          {wire2} : ((8'h9e) <= (8'hbb))) ?
                      (reg5 ?
                          $unsigned(wire9) : $unsigned(wire9)) : wire9) ~^ {reg7[(1'h0):(1'h0)],
                      reg8}));
  assign wire12 = ($signed($unsigned(({wire0} ?
                      wire0 : $unsigned(reg6)))) + wire9[(4'h9):(4'h8)]);
  assign wire13 = reg4[(3'h4):(1'h1)];
  module14 #() modinst104 (.clk(clk), .wire16(wire9), .wire17(wire1), .wire19(wire13), .wire18(wire11), .wire15(wire12), .y(wire103));
  assign wire105 = ((wire9[(4'hb):(1'h0)] ?
                           $unsigned($signed({wire10})) : ($unsigned(reg8) & wire0)) ?
                       $signed({$signed((wire2 >= reg6))}) : $unsigned({(wire11 << wire2[(2'h2):(2'h2)]),
                           wire3}));
  assign wire106 = (wire105[(1'h1):(1'h1)] ?
                       (({(~^wire12)} ?
                               (8'hab) : $unsigned((reg4 ? wire103 : reg5))) ?
                           ($unsigned((~^reg6)) >> ((wire10 ? reg8 : wire3) ?
                               $unsigned(wire10) : (8'hbf))) : (reg6[(2'h2):(1'h0)] != $unsigned(reg5[(2'h2):(1'h1)]))) : ((($signed(reg5) ?
                               $signed(wire0) : (8'hb3)) && $unsigned(wire12[(5'h14):(5'h12)])) ?
                           (~{$unsigned(wire11), wire1}) : (wire105 | reg8)));
  assign wire107 = reg5[(2'h3):(1'h1)];
  module108 #() modinst141 (wire140, clk, reg6, wire107, wire1, wire103, wire2);
endmodule

module module108
#(parameter param139 = (8'haf))
(y, clk, wire109, wire110, wire111, wire112, wire113);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire109;
  input wire signed [(5'h15):(1'h0)] wire110;
  input wire [(3'h4):(1'h0)] wire111;
  input wire signed [(3'h7):(1'h0)] wire112;
  input wire [(4'hd):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire137;
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  assign y = {wire120,
                 wire121,
                 wire122,
                 wire137,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({(wire113[(4'hb):(4'h9)] ? (8'ha9) : (wire112 ^ wire109))})
        begin
          reg114 <= $unsigned((wire111 < ((~&{(7'h44), wire111}) ?
              ((~&wire112) && $signed(wire110)) : $signed($signed(wire111)))));
        end
      else
        begin
          reg114 <= {wire111[(1'h0):(1'h0)],
              ((!{((7'h43) ? (8'ha5) : (8'h9f))}) ?
                  $unsigned($unsigned($unsigned(wire111))) : $unsigned((wire113[(2'h3):(2'h3)] ?
                      (^(8'ha9)) : (wire110 ^~ wire109))))};
          reg115 <= (8'had);
        end
      if ((wire113[(4'h8):(2'h3)] >= (wire109[(1'h1):(1'h0)] - wire109)))
        begin
          reg116 <= wire112[(1'h1):(1'h0)];
        end
      else
        begin
          reg116 <= reg115;
          reg117 <= $signed($unsigned(((7'h43) ? (~{wire111}) : wire111)));
          reg118 <= ($unsigned(reg117) ?
              $signed(reg117) : {{$unsigned($unsigned(reg116))},
                  $signed(wire110)});
        end
      reg119 <= reg117[(3'h7):(3'h5)];
    end
  assign wire120 = ((-(((~(8'ha2)) + $unsigned(wire110)) ?
                           wire113[(3'h7):(1'h0)] : reg118)) ?
                       {($signed({reg115}) ?
                               (|$unsigned(reg119)) : $signed((reg119 * reg116)))} : (^~((^~reg118) ?
                           $unsigned((reg117 > (8'hb6))) : (~|reg119))));
  assign wire121 = reg116;
  assign wire122 = {{reg115[(3'h7):(2'h2)], reg117[(4'h8):(1'h1)]}};
  module123 #() modinst138 (.clk(clk), .wire125(wire113), .wire124(reg114), .wire127(reg117), .wire126(reg118), .y(wire137));
endmodule

module module14  (y, clk, wire15, wire16, wire17, wire18, wire19);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire [(3'h6):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire98;
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire20,
                 wire55,
                 wire56,
                 wire57,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire98,
                 reg59,
                 reg58,
                 reg54,
                 reg53,
                 reg52,
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
                 (1'h0)};
  assign wire20 = wire17[(4'hd):(3'h4)];
  always
    @(posedge clk) begin
      reg21 <= wire17[(4'he):(2'h2)];
      reg22 <= ((^$unsigned((8'hbb))) ?
          (+(wire17 & wire16[(1'h1):(1'h0)])) : wire15);
      reg23 <= wire16[(2'h2):(2'h2)];
      if (wire15)
        begin
          reg24 <= wire16;
          if ((wire19 ?
              $signed($signed($signed((7'h43)))) : reg21[(1'h1):(1'h1)]))
            begin
              reg25 <= wire16;
              reg26 <= wire16[(2'h2):(1'h0)];
              reg27 <= (wire20[(1'h0):(1'h0)] ?
                  (~^wire20[(1'h1):(1'h0)]) : (8'hb2));
              reg28 <= (reg23 ?
                  $unsigned((wire16 ?
                      ($unsigned(reg25) ?
                          wire16[(3'h5):(3'h5)] : {reg21}) : ($unsigned(wire20) ?
                          (wire17 ?
                              reg26 : reg23) : (&reg21)))) : (reg25[(2'h2):(1'h0)] <= $signed((reg26[(2'h3):(1'h1)] ?
                      ((8'ha5) ? reg21 : wire18) : wire20))));
            end
          else
            begin
              reg25 <= (reg23[(3'h6):(1'h0)] > $signed(wire20[(1'h0):(1'h0)]));
              reg26 <= ($signed({$signed($unsigned(reg22)),
                      ($unsigned(reg27) > reg22)}) ?
                  reg21[(1'h1):(1'h0)] : reg28[(2'h2):(1'h1)]);
              reg27 <= $signed($signed($unsigned(reg23[(3'h4):(2'h2)])));
              reg28 <= $unsigned(wire17[(2'h2):(1'h0)]);
              reg29 <= {reg26[(2'h3):(2'h2)],
                  (reg22 && $signed($signed(reg27[(2'h2):(1'h0)])))};
            end
          reg30 <= $unsigned((+wire18));
          reg31 <= ($signed($unsigned(reg25[(4'hb):(2'h3)])) ?
              (~&((!(wire17 ? reg22 : (8'ha8))) ?
                  $unsigned((wire19 || wire15)) : $unsigned(reg29))) : ($signed($unsigned($signed(reg23))) ?
                  $unsigned(((wire17 ? wire16 : reg27) ?
                      (wire17 ?
                          wire20 : reg29) : $signed((8'ha8)))) : (&((~&reg24) ?
                      $unsigned((7'h42)) : (8'hba)))));
        end
      else
        begin
          reg24 <= wire17[(4'ha):(4'ha)];
          if (reg22[(1'h0):(1'h0)])
            begin
              reg25 <= wire15[(4'ha):(4'h8)];
              reg26 <= {reg24,
                  ((|reg28[(3'h5):(1'h1)]) <<< $signed(($signed(wire20) != ((7'h40) >= wire18))))};
              reg27 <= (~^reg30[(1'h1):(1'h1)]);
              reg28 <= reg24;
              reg29 <= $unsigned(reg24[(2'h2):(1'h1)]);
            end
          else
            begin
              reg25 <= $unsigned((~|($unsigned((|reg22)) ?
                  $unsigned((~^reg24)) : ({reg24, wire20} ?
                      (reg23 ^~ reg21) : (reg27 << wire19)))));
              reg26 <= ($signed($unsigned((^~{(8'hb1)}))) ?
                  reg29[(1'h1):(1'h1)] : (-{(7'h40), $unsigned(reg22)}));
            end
          if ((8'hab))
            begin
              reg30 <= reg29;
              reg31 <= $unsigned($unsigned($signed(wire20[(1'h0):(1'h0)])));
              reg32 <= (reg24[(1'h0):(1'h0)] ?
                  reg25 : $unsigned($unsigned($unsigned((~reg22)))));
              reg33 <= reg25;
              reg34 <= $signed($unsigned(wire20[(1'h0):(1'h0)]));
            end
          else
            begin
              reg30 <= reg27;
              reg31 <= (8'ha4);
              reg32 <= reg25;
              reg33 <= wire16;
              reg34 <= reg23[(2'h2):(2'h2)];
            end
          if ((($unsigned(((wire18 ? reg21 : reg32) | wire18)) ?
              (-((wire15 ? reg25 : reg25) ?
                  $unsigned((8'ha2)) : reg24)) : $signed(($signed(reg33) ?
                  reg23 : wire16[(1'h0):(1'h0)]))) > (^($signed(wire15) >= reg33[(1'h1):(1'h1)]))))
            begin
              reg35 <= reg21;
            end
          else
            begin
              reg35 <= wire20[(1'h0):(1'h0)];
              reg36 <= wire20;
              reg37 <= (((((reg24 ? reg36 : reg23) ?
                          (|reg27) : (reg35 >> reg32)) ?
                      {$unsigned(wire17)} : ((~wire17) ?
                          reg28[(1'h0):(1'h0)] : (8'hb5))) <<< $unsigned(((reg27 ?
                          wire20 : reg30) ?
                      reg24 : $unsigned(reg30)))) ?
                  (-$signed({$signed(wire16),
                      (wire16 ? reg31 : (8'ha6))})) : (reg33[(1'h0):(1'h0)] ?
                      reg27[(3'h4):(1'h0)] : $signed((~|{wire16, reg29}))));
              reg38 <= (wire17[(5'h10):(4'h9)] ^ ({wire20[(1'h0):(1'h0)],
                  {$unsigned((8'ha5))}} * reg32[(1'h0):(1'h0)]));
            end
        end
      if (wire15[(4'hb):(4'h9)])
        begin
          if ((reg26[(1'h0):(1'h0)] ?
              $signed($unsigned(((~reg22) <= (reg34 < reg25)))) : ($unsigned((8'hbd)) >= ((wire15[(3'h5):(2'h3)] & (reg35 >>> (7'h42))) ?
                  reg34[(3'h5):(3'h4)] : $unsigned($signed(reg24))))))
            begin
              reg39 <= (($unsigned($signed(wire16)) == (wire15[(2'h2):(1'h0)] && $signed(reg31[(1'h0):(1'h0)]))) ?
                  ($unsigned((~&reg29)) ?
                      ((-reg37) + (!(reg31 ?
                          reg36 : wire20))) : wire17[(4'ha):(3'h5)]) : (8'ha8));
              reg40 <= (8'hbf);
            end
          else
            begin
              reg39 <= (-wire18[(3'h5):(3'h4)]);
              reg40 <= $signed($signed(({$unsigned(wire15)} ?
                  reg23 : ($unsigned(reg32) ?
                      {reg34} : reg34[(2'h2):(1'h1)]))));
              reg41 <= reg35;
              reg42 <= ((reg33[(1'h1):(1'h1)] > reg25) > {reg35,
                  (reg40 + ((reg30 + (8'hb7)) ? $signed(wire16) : reg38))});
              reg43 <= (~&(((reg35[(2'h3):(2'h2)] <= {wire18}) ?
                      {$unsigned(reg35),
                          reg41[(3'h5):(1'h0)]} : reg23[(3'h7):(3'h5)]) ?
                  reg26 : (!{reg21[(1'h1):(1'h0)]})));
            end
          reg44 <= (&(~|reg27[(2'h3):(2'h3)]));
          if (reg30)
            begin
              reg45 <= $signed(wire16);
              reg46 <= reg36;
              reg47 <= reg23[(2'h2):(1'h1)];
              reg48 <= $unsigned((reg23 ?
                  {reg28} : $unsigned(((8'hb5) ?
                      (reg32 >= reg33) : (reg36 | reg45)))));
            end
          else
            begin
              reg45 <= $unsigned((reg41[(4'h8):(3'h4)] >>> wire16[(1'h0):(1'h0)]));
              reg46 <= (|((({wire17} != reg27) ?
                      ($unsigned(reg42) ?
                          {wire18,
                              reg44} : (^wire18)) : $unsigned((reg24 >> wire18))) ?
                  $unsigned((reg35 == reg23[(2'h3):(2'h2)])) : (reg27[(1'h1):(1'h0)] ?
                      ((reg33 ?
                          reg37 : reg32) ~^ $unsigned(reg23)) : {((8'h9f) ?
                              wire17 : reg21),
                          (wire16 ? (8'hb8) : reg34)})));
              reg47 <= (&((~^((reg34 <= (8'hac)) < (wire20 + reg33))) ?
                  reg25 : ((((8'hb5) && (8'hb1)) == (reg39 ?
                      wire17 : reg22)) < (-(reg41 || wire18)))));
              reg48 <= (~&(8'ha2));
            end
          if (($unsigned(reg30[(1'h1):(1'h0)]) ?
              reg21[(1'h0):(1'h0)] : ((reg48 > (reg47[(1'h1):(1'h0)] ?
                      (8'ha7) : $unsigned(reg32))) ?
                  {($unsigned(reg31) ? ((8'h9c) > reg27) : reg25),
                      $unsigned(reg40)} : reg48)))
            begin
              reg49 <= $unsigned(wire20[(1'h1):(1'h1)]);
              reg50 <= reg41[(3'h7):(1'h0)];
              reg51 <= (~(&{$unsigned($unsigned(reg21)), reg22}));
            end
          else
            begin
              reg49 <= reg31;
              reg50 <= (reg22[(1'h0):(1'h0)] ? wire15 : (~&$unsigned((8'hb3))));
              reg51 <= ($signed(wire19[(3'h4):(3'h4)]) ?
                  {(!$signed(reg28[(3'h4):(1'h1)]))} : $signed($signed(reg48)));
              reg52 <= ((|({(~&reg43)} ?
                      reg47 : ((~^(8'ha2)) ?
                          {(8'hbc), reg40} : $unsigned(reg44)))) ?
                  (((reg37[(3'h5):(3'h5)] ?
                          $unsigned((8'h9d)) : $signed(reg43)) ?
                      (!{reg37,
                          reg31}) : (~&$unsigned(wire18))) - ((reg41 && reg49[(3'h4):(1'h1)]) ?
                      (8'ha5) : reg23)) : $signed({$unsigned(((7'h44) ?
                          reg23 : reg32)),
                      ((~^reg48) >>> (^~reg22))}));
              reg53 <= $signed(reg46[(2'h3):(2'h2)]);
            end
          reg54 <= {reg50[(4'h9):(1'h0)]};
        end
      else
        begin
          reg39 <= reg38;
        end
    end
  assign wire55 = reg48[(2'h3):(1'h1)];
  assign wire56 = ($unsigned(((&(8'hb1)) == reg50)) ?
                      $signed((!(+reg31))) : {(&(reg42[(3'h4):(3'h4)] ^~ (~reg38)))});
  assign wire57 = ($unsigned(reg29[(3'h7):(2'h2)]) ?
                      ($unsigned(reg33) ?
                          ($signed({reg25}) * (8'hbe)) : (($signed(reg26) ?
                                  $unsigned((7'h43)) : $unsigned(wire15)) ?
                              $signed((reg29 <= reg37)) : $unsigned(reg37))) : (reg29[(4'h8):(2'h3)] >>> $unsigned($unsigned((reg22 ?
                          reg25 : reg26)))));
  always
    @(posedge clk) begin
      reg58 <= $unsigned((wire19[(3'h7):(2'h2)] ?
          ((7'h42) ?
              reg42[(3'h4):(3'h4)] : ((wire17 ? reg26 : reg42) ?
                  reg31[(1'h1):(1'h0)] : $unsigned((8'hb2)))) : $unsigned((wire55 >>> (|reg24)))));
      reg59 <= ((~^(({reg54, reg43} ? reg43 : (reg52 | reg21)) ?
              (reg42 ? reg44 : (reg35 ^~ reg33)) : (~&$unsigned(reg49)))) ?
          (8'ha4) : reg23);
    end
  assign wire60 = reg44;
  assign wire61 = (~($unsigned($signed($unsigned((8'hbc)))) ?
                      $unsigned($signed((wire57 > reg42))) : ($signed($unsigned((8'ha9))) ?
                          $signed($signed(wire56)) : (7'h43))));
  assign wire62 = reg58;
  assign wire63 = reg44[(4'ha):(2'h2)];
  assign wire64 = reg39[(4'h8):(2'h3)];
  module65 #() modinst99 (wire98, clk, reg40, wire63, reg42, reg27, reg48);
  assign wire100 = (+reg34);
  assign wire101 = wire100;
  assign wire102 = reg49;
endmodule

module module65  (y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire70;
  input wire signed [(2'h3):(1'h0)] wire69;
  input wire [(5'h11):(1'h0)] wire68;
  input wire signed [(5'h10):(1'h0)] wire67;
  input wire signed [(4'hc):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 reg89,
                 reg88,
                 reg87,
                 reg82,
                 reg81,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg71 <= $unsigned((~|({{wire68, wire69}} ?
          wire66[(3'h5):(3'h4)] : {wire66})));
      reg72 <= wire67;
      reg73 <= $signed($signed({{(!(8'ha2)), reg72}}));
      if (({$signed(((8'ha2) ?
              (wire68 ?
                  wire68 : wire66) : (-wire70)))} ^~ {($unsigned($signed((8'hbe))) ?
              (wire66 ?
                  {reg72,
                      wire70} : wire67[(4'h9):(4'h9)]) : {wire70[(2'h2):(2'h2)],
                  reg72}),
          $unsigned($signed({wire69, (8'hbe)}))}))
        begin
          if (({(~{$unsigned(reg72)})} != reg73))
            begin
              reg74 <= {$signed(reg73[(2'h2):(1'h1)])};
              reg75 <= ($unsigned($unsigned(({reg72, wire70} ?
                      (-reg73) : (wire67 - (8'ha3))))) ?
                  reg72 : reg74);
              reg76 <= $signed(wire66);
              reg77 <= $signed((~|($unsigned(wire66[(4'hb):(4'ha)]) ?
                  $signed((reg76 ? wire69 : reg76)) : $unsigned(reg71))));
              reg78 <= wire70;
            end
          else
            begin
              reg74 <= (8'ha7);
              reg75 <= (wire69[(2'h3):(1'h1)] ?
                  reg78[(1'h1):(1'h1)] : reg77[(3'h4):(1'h0)]);
              reg76 <= (({wire70[(4'hc):(3'h5)]} > ({(reg71 ? reg78 : reg78),
                  (8'hb3)} <<< ($signed(reg73) ?
                  $unsigned(reg75) : {reg71, reg73}))) ^ ((8'hb4) ?
                  {wire66[(3'h6):(3'h6)]} : $unsigned(reg77)));
            end
          reg79 <= reg71;
          reg80 <= ($unsigned({reg71}) ? reg73 : $signed((!(+wire70))));
          reg81 <= $unsigned({(|reg73), $unsigned((~|$unsigned((8'hab))))});
          reg82 <= reg75;
        end
      else
        begin
          reg74 <= wire70;
        end
    end
  assign wire83 = (((8'ha1) ?
                          reg78[(2'h2):(1'h1)] : ((-(~&wire69)) ?
                              ($unsigned((8'hb2)) ?
                                  $signed(wire70) : $signed(reg71)) : wire69)) ?
                      $signed(($unsigned((wire68 ? reg76 : wire69)) ?
                          wire69[(1'h0):(1'h0)] : ($unsigned(reg80) >> (^wire68)))) : wire68[(3'h7):(3'h7)]);
  assign wire84 = (wire69 <= (reg71[(5'h10):(4'hf)] & $unsigned((+(wire83 > wire70)))));
  assign wire85 = (-{$signed(((7'h41) >= $unsigned(reg82))),
                      $signed($signed((reg76 ? reg79 : (8'ha4))))});
  assign wire86 = ({((-(reg72 ? wire85 : reg80)) ?
                              (8'hb8) : $unsigned(((8'hae) | reg74)))} ?
                      reg72 : ($unsigned($unsigned($unsigned((8'hb2)))) ^ reg80));
  always
    @(posedge clk) begin
      reg87 <= (8'hb1);
      reg88 <= (reg72 ^~ (~&$signed(($signed(wire70) ?
          (reg82 ? wire70 : wire70) : wire70))));
      reg89 <= ({(reg72[(1'h1):(1'h0)] ?
              reg80[(4'h8):(3'h7)] : (wire70[(2'h2):(1'h1)] ?
                  $signed(wire68) : $unsigned(reg77)))} <<< $unsigned((reg79[(4'he):(4'ha)] ?
          (+(~^reg80)) : $signed((~reg76)))));
    end
  assign wire90 = reg88[(3'h6):(3'h4)];
  assign wire91 = ((wire67 ?
                          {(reg73[(2'h2):(1'h1)] ?
                                  (|reg79) : $signed(reg88))} : (|$signed((reg89 >> reg79)))) ?
                      (~&($unsigned((reg75 ?
                          reg73 : reg74)) & wire86)) : $unsigned($unsigned($signed(reg81))));
  assign wire92 = wire68[(4'ha):(4'h8)];
  assign wire93 = $unsigned((8'hb9));
  assign wire94 = (reg89[(5'h10):(4'ha)] ?
                      $signed($signed((~reg73[(3'h5):(1'h0)]))) : (wire68 ?
                          $signed($unsigned($unsigned(reg87))) : $signed((8'hbd))));
  assign wire95 = reg88;
  assign wire96 = reg75;
  assign wire97 = (!(+((-(&reg75)) < $signed((reg76 ? wire84 : reg89)))));
endmodule

module module123
#(parameter param136 = {((({(8'ha0)} ? ((8'ha5) + (7'h42)) : (~&(8'haa))) ? ((8'ha4) == (8'hb7)) : ({(8'hb8), (8'hb0)} ? ((8'hb6) ? (8'ha4) : (8'hb3)) : (~&(8'hac)))) ^ ((8'h9f) ? (((8'h9f) * (8'hbe)) ? (~|(7'h43)) : ((8'ha6) ? (8'hb8) : (8'hbb))) : (~^(&(8'h9d)))))})
(y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire127;
  input wire [(4'hc):(1'h0)] wire126;
  input wire [(2'h2):(1'h0)] wire125;
  input wire [(4'h9):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire129;
  wire [(4'h8):(1'h0)] wire128;
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire128 = $signed((({$unsigned(wire125), (wire127 ~^ (8'hba))} ?
                           {((7'h44) * wire125),
                               wire125} : (wire124[(4'h9):(3'h6)] ?
                               $signed((8'ha5)) : (^wire124))) ?
                       $signed((^wire125)) : {(wire124 ?
                               (-wire126) : wire124[(1'h0):(1'h0)])}));
  assign wire129 = {(|(8'hb3))};
  assign wire130 = $signed(((~&wire124) << wire129[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg131 <= wire129;
      reg132 <= ($unsigned(wire125) ?
          (wire126 <= ($signed((~|wire124)) == $unsigned(wire125[(1'h0):(1'h0)]))) : wire124[(4'h8):(3'h6)]);
      reg133 <= (((~&($signed(wire126) ~^ wire129)) ?
          reg131[(1'h0):(1'h0)] : $signed((~(wire130 ?
              wire128 : wire124)))) != (8'ha3));
      reg134 <= {($unsigned($signed($unsigned(wire130))) || (!$unsigned(wire130)))};
      reg135 <= wire128[(3'h4):(1'h1)];
    end
endmodule
