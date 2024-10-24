module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire165;
  wire signed [(2'h2):(1'h0)] wire164;
  wire [(3'h7):(1'h0)] wire162;
  wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  assign y = {wire165,
                 wire164,
                 wire162,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire3[(3'h6):(3'h6)];
  assign wire6 = ((~$unsigned($unsigned(wire4))) || wire5[(3'h4):(2'h3)]);
  assign wire7 = wire3[(2'h2):(2'h2)];
  assign wire8 = wire4[(2'h2):(2'h2)];
  assign wire9 = wire1;
  assign wire10 = $unsigned($signed(wire2[(2'h2):(1'h0)]));
  assign wire11 = ((|$signed(wire0)) ^~ wire6);
  assign wire12 = ((+wire2) ?
                      (((~|$signed(wire1)) ? $signed((!wire5)) : (!wire1)) ?
                          {(wire2[(2'h3):(1'h1)] ? (&wire0) : wire11),
                              wire0} : {$unsigned($signed(wire11)),
                              $unsigned($unsigned(wire6))}) : ({(^(+wire8)),
                              ($unsigned((8'hb1)) || wire2[(3'h7):(2'h3)])} ?
                          $signed($signed({(8'hb1), wire4})) : wire4));
  assign wire13 = $signed(($signed($unsigned((~&(8'haa)))) != ((8'hae) <<< wire8)));
  assign wire14 = $signed(wire1[(4'h9):(2'h2)]);
  assign wire15 = $unsigned($signed((wire4 == ({wire2, wire8} ?
                      $unsigned((8'h9e)) : $unsigned(wire6)))));
  assign wire16 = (7'h42);
  assign wire17 = wire14;
  assign wire18 = wire17;
  assign wire19 = (~^$signed($signed($signed({wire3, (8'hb8)}))));
  assign wire20 = (~&(~^wire14));
  module21 #() modinst163 (wire162, clk, wire11, wire12, wire9, wire16);
  assign wire164 = (wire0 >= $unsigned((8'hb9)));
  assign wire165 = wire5;
endmodule

module module21
#(parameter param161 = (^(((~&((7'h40) ? (7'h41) : (8'haf))) * (~|{(8'hb2), (8'ha7)})) ? (((|(8'ha3)) <<< ((8'ha3) >>> (7'h43))) || (~&(~|(8'had)))) : (+(((8'hbe) != (8'ha8)) ? ((8'haf) ? (7'h43) : (8'hac)) : (+(7'h42)))))))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire23;
  input wire [(3'h4):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire151;
  wire [(5'h11):(1'h0)] wire150;
  wire [(3'h7):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire148;
  wire signed [(3'h7):(1'h0)] wire147;
  wire [(2'h3):(1'h0)] wire146;
  wire signed [(4'ha):(1'h0)] wire145;
  wire signed [(4'hf):(1'h0)] wire143;
  wire [(3'h6):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(2'h3):(1'h0)] reg152 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  assign y = {wire160,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire143,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire37,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 (1'h0)};
  assign wire26 = (~|$signed({((wire22 ? wire25 : wire25) ?
                          {(8'hbb), wire24} : (&wire22))}));
  assign wire27 = wire25[(4'hc):(1'h0)];
  assign wire28 = {wire22[(1'h0):(1'h0)],
                      (^((wire24[(4'h8):(3'h4)] ?
                          wire25[(4'ha):(4'h8)] : (wire23 ?
                              wire22 : wire26)) >= $signed(((8'hbf) ?
                          wire22 : (8'hb3)))))};
  assign wire29 = $unsigned($unsigned($unsigned(({wire22, wire23} ?
                      ((8'had) ? wire22 : wire25) : wire24[(3'h5):(1'h1)]))));
  assign wire30 = (~|((~|$signed((wire29 || wire28))) > ((7'h40) ?
                      ($unsigned(wire24) ?
                          (wire23 ?
                              wire25 : wire27) : wire23) : $signed(wire25))));
  always
    @(posedge clk) begin
      reg31 <= $unsigned(wire23);
    end
  always
    @(posedge clk) begin
      reg32 <= wire25[(1'h0):(1'h0)];
      if ($unsigned(wire26))
        begin
          reg33 <= ((wire28[(1'h1):(1'h0)] ? wire29[(4'h9):(3'h7)] : wire27) ?
              reg32[(5'h10):(4'h8)] : (^reg32));
          if ((|{wire28[(3'h4):(3'h4)]}))
            begin
              reg34 <= ((8'ha5) ?
                  ((^$unsigned(wire23)) ?
                      (^~wire22[(1'h0):(1'h0)]) : (~&wire25[(4'hb):(1'h1)])) : wire23);
              reg35 <= $signed((wire30 == $signed(wire23[(2'h3):(1'h0)])));
            end
          else
            begin
              reg34 <= wire27;
              reg35 <= wire23[(1'h1):(1'h0)];
              reg36 <= wire28;
            end
        end
      else
        begin
          reg33 <= $unsigned($unsigned({{$unsigned(reg35)}}));
          reg34 <= (~&(+$signed((-wire25))));
          reg35 <= (reg31 - {(|{$unsigned(reg36), (wire29 | wire29)})});
        end
    end
  assign wire37 = wire30;
  always
    @(posedge clk) begin
      reg38 <= wire24;
      if ({$signed(wire27[(4'hc):(4'ha)]),
          ($unsigned(wire37[(1'h1):(1'h0)]) ?
              wire29[(4'hb):(2'h2)] : (reg38[(5'h11):(3'h4)] ?
                  wire27 : {reg31}))})
        begin
          reg39 <= $signed((&$signed($unsigned(reg35))));
          reg40 <= (({$signed((^wire26))} ?
              $signed((~^(reg36 ?
                  reg35 : wire37))) : reg39[(3'h7):(3'h4)]) + $unsigned($signed($unsigned($unsigned((8'ha2))))));
        end
      else
        begin
          if (reg35[(3'h7):(2'h3)])
            begin
              reg39 <= ((((wire30[(3'h4):(2'h2)] != reg36[(1'h0):(1'h0)]) ?
                          {(reg31 | reg32)} : reg33) ?
                      (^~(&reg33)) : (^(-$signed(reg38)))) ?
                  (wire26[(3'h5):(2'h3)] * ((reg36 >> reg38) ^~ (wire27[(3'h6):(1'h1)] ?
                      (~|wire37) : wire29[(2'h3):(2'h2)]))) : (&$unsigned((&(reg33 > wire24)))));
              reg40 <= $unsigned(((^~reg33) ? (8'hb2) : wire26));
              reg41 <= $unsigned(reg31);
              reg42 <= wire23;
            end
          else
            begin
              reg39 <= {({({wire22, reg41} < reg35),
                          ((reg33 ? (8'ha1) : reg39) ^~ $signed(reg36))} ?
                      (reg42 ?
                          reg42[(3'h6):(1'h0)] : (+(~reg36))) : ((reg33[(4'h8):(4'h8)] ?
                              reg41[(2'h2):(1'h1)] : $signed((8'hbb))) ?
                          $unsigned(reg39[(4'h8):(3'h7)]) : reg41[(2'h3):(1'h0)])),
                  wire28[(2'h2):(2'h2)]};
              reg40 <= wire30[(3'h4):(3'h4)];
              reg41 <= ({($signed((|reg42)) ?
                          $unsigned((wire37 || reg41)) : reg38),
                      wire28} ?
                  ($unsigned($unsigned({wire24, reg39})) ?
                      (^~(((8'ha8) ?
                          wire37 : reg38) >> (8'hbb))) : ($signed(reg35) <= (~&{reg35,
                          reg34}))) : (((7'h43) ?
                      $unsigned(reg39[(3'h5):(1'h0)]) : ({wire37, wire27} ?
                          $signed(wire28) : {reg40})) <= $signed($unsigned((^reg35)))));
              reg42 <= ((wire37 || (^reg32[(4'hf):(1'h1)])) << $signed((wire22 != ($signed(reg36) ?
                  $signed(wire29) : {reg42, wire22}))));
              reg43 <= {wire23, wire26};
            end
        end
      reg44 <= $signed($unsigned(wire24));
    end
  module45 #() modinst97 (wire96, clk, wire23, wire37, reg33, reg41);
  assign wire98 = $unsigned({wire29[(4'hb):(1'h0)]});
  assign wire99 = ((~&$unsigned($unsigned({reg41}))) ?
                      (8'h9c) : reg36[(2'h3):(2'h2)]);
  assign wire100 = (wire29[(3'h4):(2'h3)] ?
                       ((reg33 << wire28[(3'h4):(3'h4)]) == (8'hb8)) : (^~{((reg33 ?
                               (7'h40) : wire26) ~^ (reg32 ? reg44 : reg39))}));
  module101 #() modinst144 (.y(wire143), .wire103(wire99), .wire106(reg40), .wire104(reg35), .clk(clk), .wire105(wire26), .wire102(reg43));
  assign wire145 = wire25;
  assign wire146 = $unsigned(wire23);
  assign wire147 = (({wire23, (~^(reg41 ? reg33 : wire96))} ?
                       ($unsigned((~&wire25)) <<< (!wire145[(2'h2):(2'h2)])) : (^~(|(reg43 + wire98)))) ~^ reg33);
  assign wire148 = $signed($signed((-(-(wire29 == wire145)))));
  assign wire149 = (^$unsigned((((reg41 ? reg42 : (8'hb8)) ?
                       $signed((8'ha7)) : (wire145 < wire28)) * (+reg31))));
  assign wire150 = $unsigned(wire29);
  assign wire151 = (^({$unsigned($unsigned(reg42))} ?
                       ((+$signed(reg35)) < $unsigned((|wire23))) : (~|(-wire30[(3'h6):(2'h3)]))));
  always
    @(posedge clk) begin
      reg152 <= (&(wire147 ?
          ($unsigned($signed((8'haf))) - ($unsigned((8'hb8)) ?
              (~&reg43) : (wire23 < wire28))) : reg31[(4'h8):(3'h5)]));
      reg153 <= (((!{(!reg41)}) & ((&$unsigned(wire22)) ?
              ((8'had) ?
                  $unsigned(wire29) : (reg34 ? reg44 : wire145)) : {(reg44 ?
                      reg42 : wire29)})) ?
          reg44[(1'h1):(1'h0)] : reg38);
      reg154 <= (wire96[(1'h1):(1'h0)] ? reg40[(1'h0):(1'h0)] : wire23);
      if (reg31)
        begin
          if (({(((reg35 <= wire24) ? $unsigned(reg35) : $signed(reg42)) ?
                      $signed((&wire27)) : wire98),
                  (&$signed($unsigned(wire143)))} ?
              ({($signed(wire28) ? $signed(reg41) : (wire99 ? reg38 : reg43)),
                      wire23[(2'h3):(2'h2)]} ?
                  reg34 : $signed(({reg154} > (wire150 == reg39)))) : reg36[(1'h0):(1'h0)]))
            begin
              reg155 <= $signed(((!$signed((~&(8'hbd)))) ?
                  ($signed($signed(reg154)) << (8'hb5)) : (($unsigned(reg35) ?
                      {wire151} : {reg153, reg31}) & reg31[(3'h6):(1'h1)])));
              reg156 <= wire24[(4'hd):(4'hc)];
            end
          else
            begin
              reg155 <= ($unsigned($unsigned(($signed((8'ha0)) <= wire145))) ?
                  (!$signed($signed(((8'hab) ?
                      reg33 : wire28)))) : ($signed(wire151[(4'h8):(3'h4)]) != {$signed((+wire30))}));
              reg156 <= reg42;
              reg157 <= (!{(($unsigned(reg31) ? wire99 : $unsigned(reg35)) ?
                      ((wire147 * wire147) ?
                          (reg35 ^~ (8'ha0)) : reg39[(3'h7):(2'h2)]) : reg44[(4'hc):(4'hb)]),
                  ((^reg40) ?
                      ((8'haf) ?
                          (wire151 + (8'hb6)) : wire37[(5'h14):(3'h5)]) : reg152[(2'h2):(1'h0)])});
              reg158 <= {(-$signed(wire28))};
            end
        end
      else
        begin
          reg155 <= reg41;
          reg156 <= (+wire145);
        end
      reg159 <= (|$signed(reg153));
    end
  assign wire160 = (reg155 ?
                       wire150[(4'hb):(3'h7)] : (&$unsigned($unsigned($signed((7'h42))))));
endmodule

module module101
#(parameter param142 = (((((~(8'hb0)) ? (-(8'hb3)) : (^~(8'hb3))) ? (!(+(8'h9f))) : ((~^(8'hbd)) ? (-(8'hae)) : ((8'ha4) < (8'ha1)))) <<< ((((8'haf) ^~ (8'hb7)) ? ((8'hba) <<< (8'h9e)) : {(8'hb8)}) ? (&((8'h9d) ? (8'ha0) : (8'hb4))) : (-{(8'h9d)}))) != ((~|(((8'ha9) * (8'hb8)) ? (^(8'hbc)) : ((8'haf) >= (8'ha1)))) ? (((-(8'hb9)) | ((8'ha7) ? (8'hb5) : (8'h9c))) ? (^~(~(8'hbc))) : {((8'hb8) <= (8'hbf))}) : ((~((8'had) | (8'h9d))) | ({(8'hab)} ? ((8'hb9) ? (8'ha0) : (8'h9c)) : ((8'hb0) ? (8'hac) : (8'hab)))))))
(y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire106;
  input wire [(3'h5):(1'h0)] wire105;
  input wire [(3'h4):(1'h0)] wire104;
  input wire signed [(4'h8):(1'h0)] wire103;
  input wire signed [(4'hb):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire139;
  wire signed [(5'h13):(1'h0)] wire138;
  wire [(2'h2):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire [(4'he):(1'h0)] wire134;
  wire [(2'h2):(1'h0)] wire130;
  wire [(5'h14):(1'h0)] wire129;
  wire [(5'h10):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(3'h7):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire130,
                 wire129,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg133,
                 reg132,
                 reg131,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire107 = {{$unsigned(((wire105 ? wire104 : wire105) * wire104)),
                           (((wire106 <<< wire103) ?
                               $unsigned(wire104) : wire105[(2'h2):(1'h0)]) <<< wire103)}};
  assign wire108 = $unsigned((8'hb3));
  assign wire109 = (-$signed($unsigned($signed(wire107))));
  assign wire110 = ($signed(wire108) ?
                       ($unsigned($signed(wire105[(3'h4):(2'h2)])) < ({((8'ha7) ?
                               wire105 : (8'hbd))} < (wire108 ~^ $unsigned(wire109)))) : $unsigned(($unsigned({wire104,
                               (8'ha3)}) ?
                           wire102[(2'h3):(1'h0)] : (wire104 < (&wire103)))));
  assign wire111 = wire110[(1'h1):(1'h1)];
  assign wire112 = wire108[(1'h1):(1'h1)];
  assign wire113 = (($unsigned(wire106) ~^ (~{$unsigned(wire104),
                           wire109[(2'h3):(2'h2)]})) ?
                       (({(^~wire104), wire108[(1'h1):(1'h1)]} ?
                               wire110[(3'h4):(2'h3)] : $unsigned((~|(8'ha8)))) ?
                           {(-wire107[(4'hc):(4'hb)]),
                               wire110} : $signed(wire104[(2'h2):(1'h0)])) : {$signed(($unsigned(wire109) >>> wire107[(2'h3):(2'h2)])),
                           ((~^wire110[(3'h5):(2'h2)]) ~^ ($signed(wire107) ?
                               (+wire112) : (~^wire106)))});
  assign wire114 = (-($signed(wire107) ?
                       $signed($unsigned($unsigned(wire107))) : $unsigned(wire109[(3'h6):(1'h1)])));
  always
    @(posedge clk) begin
      reg115 <= $signed(((!{(wire112 ?
              wire103 : wire111)}) <<< {((8'ha9) >> ((8'hbe) < wire103)),
          ((wire106 ? wire102 : wire110) & $signed((8'ha6)))}));
      if (wire106[(3'h4):(2'h2)])
        begin
          if (({((~wire112[(1'h1):(1'h1)]) ?
                      (wire110 - (|wire109)) : (~^wire104))} ?
              (^~$unsigned($unsigned({wire112, wire113}))) : (-(~((wire106 ?
                  wire109 : wire103) + wire111[(3'h7):(3'h5)])))))
            begin
              reg116 <= wire108;
              reg117 <= ($unsigned(((wire109 ?
                      $unsigned(wire109) : wire112[(4'h8):(3'h5)]) != $unsigned((!wire110)))) ?
                  wire107[(4'hf):(4'h9)] : wire104[(1'h1):(1'h1)]);
              reg118 <= wire107[(4'h9):(3'h4)];
            end
          else
            begin
              reg116 <= $signed({($signed(wire105) < wire108[(1'h0):(1'h0)]),
                  (+((reg118 ? wire105 : wire105) ?
                      $signed(wire108) : wire107))});
              reg117 <= wire110[(1'h1):(1'h0)];
              reg118 <= wire106[(3'h5):(3'h4)];
              reg119 <= wire108[(1'h1):(1'h0)];
              reg120 <= $unsigned($signed($unsigned(wire111[(5'h12):(4'h9)])));
            end
          if ($unsigned(wire109[(3'h4):(2'h3)]))
            begin
              reg121 <= ((wire109[(3'h4):(1'h0)] << (reg116[(3'h6):(1'h0)] ?
                      {$unsigned(reg119)} : wire102)) ?
                  {(~&(wire105[(1'h1):(1'h0)] << (reg119 + reg116)))} : (+wire112[(1'h0):(1'h0)]));
              reg122 <= (~^$unsigned(wire114));
            end
          else
            begin
              reg121 <= $signed((wire113[(1'h0):(1'h0)] ?
                  (reg115 ?
                      reg115[(3'h6):(3'h6)] : {$unsigned(reg116)}) : reg116[(2'h3):(2'h3)]));
              reg122 <= (wire103 ? $signed(wire114[(4'h9):(1'h0)]) : reg120);
              reg123 <= (wire112 ?
                  $signed($signed(wire106[(4'h9):(3'h7)])) : ($unsigned($unsigned($signed(reg117))) ?
                      $signed(($unsigned((7'h42)) << (+wire108))) : ($unsigned($signed(wire109)) ?
                          {$unsigned(wire105)} : wire110)));
              reg124 <= reg123;
            end
          reg125 <= $unsigned((~|reg121));
          reg126 <= ($signed(reg119[(1'h0):(1'h0)]) - reg120);
        end
      else
        begin
          reg116 <= wire107;
          if ((|$signed(reg123[(4'ha):(2'h2)])))
            begin
              reg117 <= (~&({(8'ha7)} < reg122));
              reg118 <= ({$unsigned(((reg126 * wire104) <= {wire105})),
                  (^reg122[(4'hb):(3'h7)])} <<< reg116);
            end
          else
            begin
              reg117 <= $unsigned($unsigned($signed({{reg116, wire111},
                  $signed(reg121)})));
              reg118 <= $signed($unsigned(reg116));
              reg119 <= reg126[(2'h2):(2'h2)];
            end
        end
      reg127 <= wire113[(4'he):(4'h8)];
      reg128 <= wire113;
    end
  assign wire129 = wire113;
  assign wire130 = {{$signed((&$signed(reg121)))},
                       $unsigned($unsigned(reg127))};
  always
    @(posedge clk) begin
      reg131 <= {wire104[(1'h0):(1'h0)],
          $unsigned(((wire107[(4'hd):(3'h4)] ?
                  (wire129 | reg127) : ((8'hbf) << (8'h9d))) ?
              (8'ha7) : (^(wire114 ? reg127 : wire113))))};
      reg132 <= {{($unsigned(wire109) ?
                  ({reg121,
                      reg125} >= $signed(reg120)) : ((wire112 >>> reg119) ?
                      (^reg128) : $unsigned(reg115)))}};
      reg133 <= (((((wire114 >> wire104) && (reg128 != wire109)) ?
                  ((reg132 >> (8'h9c)) + reg119) : wire105) ?
              $unsigned({(reg123 ? reg119 : reg118),
                  ((7'h42) - wire113)}) : $signed({reg127,
                  (wire107 != reg121)})) ?
          reg119[(2'h2):(2'h2)] : ((|reg122) ?
              (wire111[(4'ha):(4'h8)] ?
                  $unsigned($unsigned((8'h9d))) : $signed($signed(reg121))) : ($unsigned(wire111) ?
                  $unsigned((reg126 || reg119)) : (((8'hb6) < reg124) ?
                      $unsigned(wire105) : (~|wire111)))));
    end
  assign wire134 = wire105;
  assign wire135 = reg131[(4'hd):(3'h6)];
  assign wire136 = $signed((8'hae));
  assign wire137 = (~^wire102);
  assign wire138 = reg125;
  assign wire139 = $unsigned((reg133[(2'h2):(1'h0)] ?
                       reg128[(1'h0):(1'h0)] : (&(~^{wire108, reg126}))));
  assign wire140 = $signed(wire102[(3'h4):(1'h1)]);
  assign wire141 = reg122;
endmodule

module module45
#(parameter param95 = (~^({(!((8'hb2) ? (8'hbe) : (8'ha2)))} ? ((((8'hab) * (8'hb0)) ? {(8'hb5)} : (7'h44)) != (((8'hb9) ? (8'hab) : (8'ha2)) ? ((8'hbf) ? (8'hb8) : (8'hb7)) : {(8'haf), (8'h9f)})) : ((((7'h42) >>> (8'h9e)) ? ((8'ha9) ? (8'had) : (8'ha5)) : ((8'hb7) ? (8'ha0) : (8'hbd))) ? (7'h42) : ((~&(8'hae)) ? (-(8'hb8)) : (~^(8'hbc)))))))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire49;
  input wire [(5'h15):(1'h0)] wire48;
  input wire [(5'h14):(1'h0)] wire47;
  input wire signed [(4'hc):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  assign y = {wire92,
                 wire74,
                 wire73,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg94,
                 reg93,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire50 = $signed(wire48);
  assign wire51 = (($signed(wire48) ? wire46 : $signed((!{wire48, wire49}))) ?
                      (!($signed({wire49, wire49}) ?
                          $unsigned((wire49 << wire50)) : $unsigned(wire48))) : ((^~(wire46 >> (wire47 ?
                              wire47 : wire48))) ?
                          $unsigned($unsigned(wire46)) : wire47));
  assign wire52 = ((($signed(((8'hbb) ? wire49 : wire46)) ?
                          (^$signed(wire48)) : {wire46}) <<< (($unsigned(wire46) ?
                          (~wire48) : $signed((8'haf))) >>> ($unsigned((8'haf)) || wire49))) ?
                      wire51[(2'h3):(2'h2)] : ($unsigned(wire46[(4'h8):(2'h3)]) ?
                          $signed((wire46 ?
                              $unsigned((8'hb8)) : (|wire48))) : $unsigned((wire49[(5'h11):(4'h8)] ?
                              ((8'h9e) ? wire47 : wire47) : (~|wire51)))));
  assign wire53 = $signed($signed($signed({wire48})));
  always
    @(posedge clk) begin
      reg54 <= $signed($signed($signed(wire48)));
      reg55 <= ($signed((((^~wire49) ? $unsigned((8'hbe)) : (wire52 * wire46)) ?
          wire50[(3'h5):(2'h2)] : $unsigned(wire47[(4'hf):(4'hf)]))) ^~ ({wire51[(2'h3):(2'h3)],
              ((+(7'h43)) ? wire50[(5'h10):(1'h1)] : (&wire47))} ?
          ($unsigned($unsigned(wire52)) ?
              ((wire49 ^~ (8'hae)) ?
                  wire51[(1'h0):(1'h0)] : $signed(wire50)) : {(~|wire49),
                  (^~wire53)}) : (wire53 ?
              {((8'ha1) ? wire47 : reg54),
                  wire52[(3'h4):(2'h3)]} : wire46[(2'h2):(2'h2)])));
      if ($signed(((&(wire47 & (wire51 >>> wire47))) ?
          ({(wire53 ? wire53 : wire49)} ?
              (wire51 - wire51) : $unsigned((&wire46))) : (!((reg55 > reg55) < wire52[(3'h6):(3'h6)])))))
        begin
          reg56 <= $unsigned((wire49[(3'h4):(2'h3)] ?
              wire46 : {($signed(reg54) ?
                      $unsigned(wire46) : $unsigned(wire53))}));
          reg57 <= (^~wire49);
        end
      else
        begin
          reg56 <= $unsigned(((-reg55) & (($unsigned(wire46) - (~reg57)) ?
              $signed($signed(reg56)) : $signed(wire53[(2'h2):(1'h0)]))));
          reg57 <= ($unsigned($signed((wire52[(1'h1):(1'h0)] ^~ (!wire53)))) & (({$unsigned(wire51),
                  ((8'hb0) ^~ wire46)} > {(reg56 ? (8'ha6) : wire47),
                  $unsigned(wire49)}) ?
              wire46[(3'h4):(1'h1)] : wire48));
          reg58 <= ($signed(((~^(!wire48)) ?
              {$signed(wire47), wire48} : reg57)) & wire51[(3'h5):(1'h0)]);
        end
      reg59 <= ({reg56, reg56[(2'h2):(2'h2)]} >>> wire51[(1'h1):(1'h1)]);
    end
  assign wire60 = reg55[(4'h8):(1'h0)];
  assign wire61 = $unsigned(wire47[(2'h2):(1'h1)]);
  assign wire62 = ($unsigned((wire60 ?
                      {(!(8'hbc)),
                          (~|wire47)} : $signed(reg57[(2'h2):(1'h0)]))) < $unsigned((wire49[(4'h9):(3'h5)] ?
                      ((8'hbe) & wire46[(1'h0):(1'h0)]) : wire48)));
  assign wire63 = (^~$unsigned({($unsigned(wire62) <= ((8'hae) ?
                          reg54 : reg56))}));
  assign wire64 = wire48[(4'h8):(4'h8)];
  assign wire65 = $unsigned((reg54[(2'h2):(1'h1)] ?
                      (reg56[(3'h7):(2'h2)] ?
                          $signed((8'hb2)) : (!reg57)) : (~&$signed((^~wire46)))));
  assign wire66 = ({(^((wire64 ? wire62 : wire53) ?
                              (reg55 + wire63) : $unsigned((7'h40))))} ?
                      $unsigned(((!$unsigned(wire65)) >>> ((wire46 ?
                          wire52 : wire65) + $signed((8'h9f))))) : ((!$unsigned({(8'hb7)})) & $signed((~|(~&wire53)))));
  assign wire67 = (&{$unsigned(reg57[(1'h0):(1'h0)]), wire48});
  always
    @(posedge clk) begin
      if (($signed(reg54[(4'hd):(4'hc)]) ?
          {wire60[(4'h9):(1'h0)]} : (((~&$signed(reg56)) ?
              wire50 : $unsigned((^~wire51))) < $signed((~^(!wire65))))))
        begin
          reg68 <= $signed(wire48[(4'hb):(3'h4)]);
          reg69 <= ($signed($signed((8'ha4))) == ({wire47[(4'h9):(2'h3)],
                  $signed($unsigned(reg57))} ?
              (($unsigned(wire49) ?
                  $signed(wire64) : $unsigned(wire50)) >> reg54[(2'h2):(1'h0)]) : {($signed(wire66) ?
                      $signed(wire52) : $unsigned(reg57))}));
          reg70 <= ($signed((wire60[(1'h1):(1'h0)] >= $signed($signed(wire62)))) ?
              (^$signed(wire51)) : (reg54[(4'h9):(3'h7)] - ($unsigned((8'hbb)) ?
                  (reg68[(1'h1):(1'h1)] ?
                      $signed((8'ha8)) : $unsigned(wire65)) : $unsigned(wire48))));
          reg71 <= {(wire63 ? wire53 : $unsigned($unsigned(wire47))),
              (wire47 ? wire67[(2'h3):(1'h1)] : $signed($signed({reg68})))};
        end
      else
        begin
          reg68 <= reg55[(1'h1):(1'h0)];
          reg69 <= $signed((((8'hae) <<< (wire52[(4'hb):(2'h3)] - reg54)) ?
              wire61 : ($unsigned($unsigned(wire62)) ? (8'haa) : reg55)));
          reg70 <= reg68[(1'h0):(1'h0)];
        end
      reg72 <= $unsigned((~&($unsigned((wire47 ~^ wire64)) ?
          reg59[(1'h0):(1'h0)] : (^wire66))));
    end
  assign wire73 = wire60;
  assign wire74 = wire49;
  always
    @(posedge clk) begin
      reg75 <= $signed($signed((($signed(reg58) | $signed(wire67)) != $signed({wire49}))));
      if (wire46[(3'h5):(1'h0)])
        begin
          if ({wire74, $signed(($signed((~|wire63)) * wire66))})
            begin
              reg76 <= {reg54, $unsigned(wire51)};
              reg77 <= {($signed(((wire53 ^ wire62) * wire65[(2'h3):(2'h2)])) ?
                      reg55 : $unsigned(wire50[(3'h6):(2'h3)])),
                  $signed({$unsigned((reg69 || wire47)), {$signed(wire52)}})};
              reg78 <= $signed($unsigned($signed(((-reg59) ?
                  $signed((8'hb9)) : ((8'hb0) << wire53)))));
            end
          else
            begin
              reg76 <= reg72[(4'h9):(2'h3)];
              reg77 <= $unsigned(($unsigned(reg77[(4'hf):(3'h6)]) >>> (-$signed($unsigned(reg70)))));
              reg78 <= ((~|{((&wire47) && (wire62 ~^ wire53))}) ?
                  $signed({$signed((wire61 * reg69)), wire66}) : wire48);
            end
          reg79 <= reg68;
          if ((8'hbd))
            begin
              reg80 <= reg71[(4'he):(4'hc)];
              reg81 <= ((reg59[(1'h1):(1'h1)] ?
                  wire67 : $unsigned($signed((~|(8'ha7))))) ~^ $signed((^(&{reg58,
                  reg79}))));
              reg82 <= ((reg57 ?
                      (&($unsigned(wire66) ?
                          $signed(reg70) : (^~reg71))) : ($signed(reg54[(4'hd):(4'ha)]) > $signed((wire49 ?
                          wire46 : wire61)))) ?
                  wire49 : (^(&(reg68 >> $unsigned(reg80)))));
              reg83 <= (wire62[(3'h4):(1'h0)] < $unsigned((reg77 >>> reg82)));
            end
          else
            begin
              reg80 <= {(!{reg68}), wire64};
              reg81 <= $unsigned($unsigned($unsigned({$signed(wire65)})));
              reg82 <= {(wire48 ~^ wire65[(2'h2):(1'h0)])};
              reg83 <= (reg77[(4'he):(3'h7)] ? wire53 : wire74);
            end
          if (reg58[(2'h2):(1'h1)])
            begin
              reg84 <= ({$signed(($unsigned(reg81) ?
                          (wire63 ? (8'haa) : reg70) : (reg78 < reg56))),
                      $unsigned((reg59[(1'h1):(1'h1)] * (reg71 | wire53)))} ?
                  $signed($signed((+$signed(wire53)))) : ($unsigned(wire63) ?
                      $unsigned({$signed(reg56),
                          reg83[(1'h1):(1'h0)]}) : (~(~|wire47[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg84 <= {reg79[(4'he):(4'hd)], wire48};
              reg85 <= wire48[(3'h5):(3'h5)];
              reg86 <= $signed(wire66);
            end
          reg87 <= (~&$unsigned(({(wire60 <= wire63),
              {reg56, (7'h42)}} <= ($unsigned(wire62) ?
              (reg77 - wire67) : $signed(wire66)))));
        end
      else
        begin
          if (($unsigned(reg84[(3'h5):(1'h1)]) ?
              $signed((((wire62 ? wire66 : wire66) < (wire60 | reg80)) ?
                  ($unsigned(reg69) ?
                      reg69 : (+wire48)) : (!reg87))) : {($signed((reg75 <<< reg83)) ?
                      reg86 : $signed((8'hac)))}))
            begin
              reg76 <= $signed(((wire60 || (^wire47[(1'h0):(1'h0)])) | $unsigned($signed((~^wire53)))));
              reg77 <= $signed($signed({$unsigned((wire51 ? wire47 : reg59)),
                  reg68}));
              reg78 <= {(((^~(reg76 ? wire63 : reg78)) ?
                          ((&reg54) ?
                              $unsigned(wire60) : $signed(wire49)) : wire61[(3'h4):(1'h0)]) ?
                      $signed((wire47[(4'he):(3'h7)] ^~ $unsigned(reg68))) : reg87[(1'h1):(1'h1)]),
                  ((~^wire53) >> (((reg71 ?
                          wire51 : wire50) ^ wire62[(3'h4):(2'h2)]) ?
                      wire64[(3'h6):(3'h6)] : wire67))};
              reg79 <= {wire66, reg83[(3'h4):(2'h2)]};
            end
          else
            begin
              reg76 <= (8'ha7);
              reg77 <= (wire65[(3'h5):(1'h1)] ?
                  $signed((((8'hae) ^~ (-reg70)) << reg57)) : (|({(!reg87),
                          {reg59}} ?
                      $unsigned((~(7'h44))) : wire65[(3'h6):(3'h6)])));
            end
          reg80 <= (~^((wire53[(1'h1):(1'h0)] ?
                  reg81[(4'h9):(2'h3)] : (~(wire65 ? reg77 : wire66))) ?
              ((8'hbe) ?
                  ($unsigned(reg79) << $unsigned(reg57)) : $signed((reg82 <<< reg85))) : reg75[(2'h3):(2'h3)]));
          reg81 <= (wire61 << ($unsigned($unsigned((wire50 ?
              wire61 : wire53))) > ((~&$unsigned(reg56)) ?
              $unsigned($signed(wire49)) : $unsigned($unsigned(wire67)))));
          reg82 <= reg87;
        end
      reg88 <= (|{(-wire65[(4'h8):(4'h8)])});
      reg89 <= reg88[(4'ha):(2'h2)];
      reg90 <= (($unsigned(($unsigned(reg80) ?
          $signed(wire47) : (reg69 ? wire51 : wire51))) ^ ({{reg76}} ~^ {wire53,
          (wire52 << (7'h41))})) > reg88[(5'h11):(4'h8)]);
    end
  always
    @(posedge clk) begin
      reg91 <= (reg79[(4'h9):(3'h5)] ?
          reg90 : ((~^$unsigned($signed(reg78))) ?
              (^(reg77[(3'h6):(3'h6)] ?
                  reg75 : (reg59 != wire67))) : ($signed(wire66[(3'h6):(1'h0)]) ?
                  $unsigned((reg83 && (8'ha1))) : reg86)));
    end
  assign wire92 = reg76[(5'h10):(2'h3)];
  always
    @(posedge clk) begin
      reg93 <= (+$signed((reg56 ?
          $unsigned(wire62[(2'h3):(2'h3)]) : $unsigned($signed(reg72)))));
      reg94 <= $signed($signed((-(!wire60[(3'h4):(1'h1)]))));
    end
endmodule
