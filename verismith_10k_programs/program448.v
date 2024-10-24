module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire176;
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire18,
                 wire19,
                 wire20,
                 wire176,
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
  assign wire4 = $unsigned($signed($signed((~&(8'hb6)))));
  assign wire5 = wire4;
  assign wire6 = {wire2[(2'h2):(2'h2)],
                     $unsigned(((~&wire4[(3'h4):(2'h3)]) ?
                         (-$unsigned(wire4)) : (+$signed(wire0))))};
  assign wire7 = (^~({(wire3[(2'h2):(1'h0)] * $signed(wire4)),
                         ($signed(wire2) ?
                             (wire6 ? wire6 : wire2) : $signed(wire6))} ?
                     ($signed(wire5[(2'h3):(2'h3)]) <<< {wire6[(4'hd):(2'h2)]}) : {wire6,
                         $unsigned(wire0)}));
  assign wire8 = $unsigned($unsigned(((|wire3) || (wire5 ?
                     $signed((8'ha6)) : wire3))));
  always
    @(posedge clk) begin
      reg9 <= ($unsigned($signed(wire3[(2'h2):(1'h0)])) ?
          wire8[(1'h0):(1'h0)] : (($signed((wire4 ? wire3 : wire6)) << wire0) ?
              (8'hb0) : $unsigned(((^wire2) < wire5[(2'h2):(2'h2)]))));
      reg10 <= (8'ha8);
      if (wire2)
        begin
          reg11 <= $signed((~^{(~&(wire1 ? wire7 : wire5))}));
          reg12 <= (~^{(^~(!wire3[(1'h0):(1'h0)])),
              $signed($unsigned((^reg10)))});
          if (((~|wire8[(1'h0):(1'h0)]) ? $signed(wire6) : (&wire1)))
            begin
              reg13 <= $unsigned(reg9);
              reg14 <= (^($unsigned({(wire5 - wire0), wire3}) << (8'hb5)));
              reg15 <= {({$signed((reg12 ?
                          reg14 : reg9))} != ($unsigned($signed(wire6)) <<< reg14[(1'h0):(1'h0)]))};
              reg16 <= $unsigned(((reg12 <= (reg10 ?
                  {reg9} : (wire6 ? wire8 : wire6))) && (8'h9f)));
            end
          else
            begin
              reg13 <= (~^{(&(((8'hb5) ?
                      reg11 : (7'h42)) >> reg11[(4'h9):(1'h1)]))});
              reg14 <= (+($unsigned((&(8'hae))) && reg12[(2'h3):(2'h3)]));
              reg15 <= (wire5 >>> (^reg14));
              reg16 <= wire8;
            end
          reg17 <= $signed(($signed($unsigned((wire5 <<< wire7))) ?
              {reg12[(4'h8):(1'h1)]} : (((wire1 * wire6) ?
                  ((8'haf) ? wire4 : reg15) : $signed((8'h9c))) >>> (wire5 ?
                  {wire1} : ((8'hb9) ? wire5 : wire0)))));
        end
      else
        begin
          reg11 <= (wire8[(2'h3):(2'h2)] ?
              ((((reg9 == wire5) ? reg16 : (reg9 + reg10)) ?
                  ((reg11 ? wire0 : wire7) ?
                      $signed(wire8) : $signed(reg16)) : $unsigned(reg15)) ~^ (8'hae)) : ((+$unsigned(wire2)) & wire6));
          reg12 <= $signed(reg12);
          reg13 <= (^~$unsigned(((-(reg10 << reg12)) ?
              (wire8[(2'h3):(1'h1)] & reg17) : {(|reg10),
                  $unsigned((8'ha7))})));
        end
    end
  assign wire18 = (^$signed($unsigned(wire5)));
  assign wire19 = $unsigned((((^~reg11[(3'h6):(3'h4)]) < $unsigned(wire18[(2'h3):(2'h2)])) ?
                      (&(reg16 ^ $unsigned(reg16))) : {(^reg16[(5'h10):(4'he)])}));
  assign wire20 = ((wire7 ?
                      wire3[(1'h1):(1'h1)] : wire0[(1'h1):(1'h0)]) >> ({reg15[(4'hb):(1'h0)],
                      {(wire8 ? wire5 : wire5)}} > $signed(wire5)));
  module21 #() modinst177 (wire176, clk, wire20, wire2, wire5, reg13);
endmodule

module module21
#(parameter param174 = (^~(((~((8'hba) ? (8'ha4) : (8'hb4))) ^ ((|(7'h42)) ? ((8'hb1) ? (8'hae) : (8'hbe)) : ((8'hbd) ~^ (8'ha4)))) <<< ({((8'hb7) ? (8'ha1) : (7'h43)), ((8'ha2) && (7'h42))} + (((7'h43) ? (8'h9d) : (8'hae)) != ((7'h40) ? (8'hae) : (8'haa)))))), 
parameter param175 = {(((~|(param174 ^ param174)) ? ((^param174) ? param174 : param174) : {(+(7'h44))}) ? (!((param174 ? param174 : param174) ? param174 : {param174})) : (^((param174 == param174) < (8'hae)))), param174})
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire signed [(3'h6):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire173;
  wire [(4'h8):(1'h0)] wire172;
  wire [(3'h6):(1'h0)] wire168;
  wire [(4'hb):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  reg [(3'h5):(1'h0)] reg171 = (1'h0);
  reg [(3'h6):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire168,
                 wire166,
                 wire94,
                 wire93,
                 wire88,
                 wire87,
                 wire85,
                 wire27,
                 wire26,
                 reg171,
                 reg170,
                 reg169,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
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
  assign wire26 = {$unsigned(((+wire25[(2'h3):(2'h3)]) ?
                          ((wire23 <= wire23) ? (|wire24) : wire23) : wire24))};
  assign wire27 = (^((&$unsigned(wire23)) ?
                      $unsigned(wire24) : $signed(((wire24 ? wire26 : (8'ha6)) ?
                          $signed(wire26) : (!wire23)))));
  always
    @(posedge clk) begin
      if ((~$signed(wire22[(4'h8):(3'h4)])))
        begin
          reg28 <= $signed({($unsigned($signed(wire24)) ?
                  $unsigned($signed(wire26)) : {(wire24 << wire22)}),
              ($unsigned($unsigned(wire22)) * (8'h9f))});
          reg29 <= (wire26[(2'h2):(1'h1)] <= wire24[(2'h2):(1'h1)]);
          if (($signed(reg28[(4'hd):(2'h3)]) ?
              (~$signed(((wire25 == (8'h9d)) ?
                  (8'h9c) : reg28))) : (~$unsigned(wire27[(2'h2):(2'h2)]))))
            begin
              reg30 <= ($signed(($unsigned((+wire27)) > (wire26[(4'hc):(4'hb)] != wire25[(3'h7):(3'h4)]))) == wire24[(2'h3):(1'h1)]);
              reg31 <= ($signed($unsigned((~wire22[(4'he):(1'h0)]))) ?
                  (~|((~|$unsigned(wire26)) & {$unsigned((7'h40))})) : $signed(($signed((wire24 << wire26)) ?
                      {wire22[(2'h3):(1'h0)]} : ($signed(wire23) >> (+wire27)))));
              reg32 <= $signed(reg29[(1'h0):(1'h0)]);
              reg33 <= ($signed(reg29[(2'h3):(1'h0)]) ?
                  $signed(wire26) : $unsigned(reg30));
            end
          else
            begin
              reg30 <= reg31;
            end
          reg34 <= (~$unsigned(reg28));
          reg35 <= wire22;
        end
      else
        begin
          reg28 <= $unsigned($signed((!$signed((wire24 ? wire22 : (8'ha0))))));
          reg29 <= reg34[(1'h1):(1'h0)];
        end
      if (wire23)
        begin
          reg36 <= $unsigned(($signed($unsigned((wire23 - wire24))) ?
              ($unsigned({wire22}) & $signed((reg29 ?
                  reg30 : reg29))) : $signed((~^$unsigned(wire25)))));
          reg37 <= $unsigned(($unsigned($signed($signed(reg33))) < wire27[(3'h4):(2'h2)]));
          reg38 <= $unsigned((({$signed(wire26), (wire24 ? reg29 : wire22)} ?
                  wire24[(1'h0):(1'h0)] : $unsigned((^~wire22))) ?
              (~((reg30 ? reg33 : reg37) ?
                  (wire26 + reg37) : (reg37 ? (8'ha7) : reg35))) : (((wire27 ?
                          wire24 : reg29) ?
                      wire22[(3'h6):(3'h6)] : (~reg32)) ?
                  (-(-(8'hbf))) : reg31[(2'h2):(2'h2)])));
          if ((8'h9c))
            begin
              reg39 <= (!reg31);
              reg40 <= ($signed(reg32[(3'h4):(2'h3)]) ?
                  $signed(reg32[(1'h0):(1'h0)]) : ((($unsigned((8'hb7)) ^~ (^reg38)) ?
                      reg30[(3'h4):(2'h3)] : (~^((8'hbe) >>> reg28))) * ($unsigned((reg33 >>> wire22)) == $unsigned({reg37,
                      (8'hbf)}))));
              reg41 <= reg34;
            end
          else
            begin
              reg39 <= {($signed((~$unsigned(reg33))) < (((reg33 < (8'hab)) ?
                          (wire22 << wire26) : $signed(reg36)) ?
                      reg28 : (!(+reg38)))),
                  $unsigned((!(+(wire24 ? wire24 : reg32))))};
            end
        end
      else
        begin
          reg36 <= (((^$signed(reg40[(4'ha):(1'h0)])) ?
                  $signed($signed((reg32 | reg34))) : (wire24 ?
                      reg37[(4'h8):(1'h1)] : ({(7'h40),
                          reg40} + reg30[(3'h4):(1'h0)]))) ?
              (reg29[(5'h10):(3'h4)] >>> (~|wire22)) : $unsigned($unsigned(($signed(reg37) ^ {reg37,
                  wire25}))));
          if (((wire23[(1'h0):(1'h0)] >= {$signed($unsigned(wire22)),
              ($unsigned((7'h44)) ?
                  {reg28, wire22} : {reg39,
                      wire25})}) != (($signed((~^(7'h40))) < (^~{(8'hbb)})) ^~ (reg34[(1'h1):(1'h1)] ?
              reg31 : reg38))))
            begin
              reg37 <= $signed($unsigned(reg38[(1'h0):(1'h0)]));
              reg38 <= {$signed(($signed($unsigned(reg35)) ?
                      wire26 : (~|(&reg35)))),
                  (($unsigned((^(8'h9d))) && wire23[(1'h1):(1'h1)]) ?
                      $unsigned((+$unsigned(reg37))) : (7'h44))};
            end
          else
            begin
              reg37 <= (~(($signed((~^(8'hb5))) ?
                  $signed($signed((8'hac))) : ($unsigned(reg34) ?
                      (reg30 == wire22) : $signed(reg30))) < reg31[(2'h2):(1'h1)]));
              reg38 <= ({({reg38[(2'h3):(2'h2)], (reg38 - (8'hb2))} ?
                      (~&(~wire24)) : ({wire23,
                          (8'h9e)} < $unsigned(reg36)))} >> (8'hb9));
              reg39 <= reg33[(4'h9):(2'h3)];
              reg40 <= $unsigned(({{$unsigned(wire26), (|(8'hb2))},
                  ((+reg34) + reg37[(4'hd):(4'h9)])} >> $signed((!reg36))));
              reg41 <= ({(wire27 ?
                          ({wire22, reg31} ?
                              $signed(reg31) : ((8'ha4) ?
                                  reg34 : reg32)) : (!$signed(reg41)))} ?
                  ($unsigned((8'hba)) ^ wire24) : {($signed(reg29[(4'h8):(3'h6)]) * $unsigned($signed(reg39)))});
            end
          reg42 <= (8'hb2);
          reg43 <= ((wire27[(2'h2):(2'h2)] ? reg40 : {reg37}) ?
              reg37[(1'h1):(1'h0)] : reg28[(3'h4):(3'h4)]);
          reg44 <= wire26;
        end
      reg45 <= (reg40 ?
          $signed($unsigned({{reg34, reg36},
              (reg42 ? reg29 : reg37)})) : $unsigned((~|reg28)));
    end
  module46 #() modinst86 (wire85, clk, reg34, reg44, reg32, reg40);
  assign wire87 = (reg30 ? reg28[(3'h4):(1'h0)] : reg41);
  assign wire88 = ((8'hb8) << (~|(-$signed((wire23 && wire24)))));
  always
    @(posedge clk) begin
      if (reg30[(1'h0):(1'h0)])
        begin
          reg89 <= reg35[(4'h8):(3'h6)];
        end
      else
        begin
          reg89 <= $signed($unsigned((8'hb1)));
          reg90 <= ((wire23[(1'h0):(1'h0)] ?
                  reg32[(4'hb):(3'h5)] : $signed(reg40)) ?
              reg42 : reg29[(4'h9):(3'h4)]);
          reg91 <= reg39[(4'h8):(4'h8)];
        end
      reg92 <= ((^($signed(reg34) ?
              ({reg44, reg28} ?
                  {wire23, reg35} : wire22) : reg35[(4'hd):(4'hc)])) ?
          $signed({wire88[(1'h0):(1'h0)]}) : $unsigned(reg33[(3'h7):(2'h3)]));
    end
  assign wire93 = reg91;
  assign wire94 = $signed(reg31[(1'h1):(1'h1)]);
  module95 #() modinst167 (.wire96(wire94), .wire98(wire24), .y(wire166), .wire99(reg39), .wire97(reg31), .clk(clk));
  assign wire168 = $signed((~^(((~(8'hb5)) ?
                           $signed(wire22) : $unsigned(reg90)) ?
                       $unsigned((wire94 ?
                           wire88 : reg30)) : $unsigned($unsigned((8'hb4))))));
  always
    @(posedge clk) begin
      if ({(^{(8'ha9), reg92}),
          ($unsigned(reg42[(2'h3):(1'h0)]) ?
              (|wire27) : (-((~wire22) ?
                  $signed(wire23) : wire22[(3'h4):(2'h2)])))})
        begin
          reg169 <= $signed($signed(reg30[(1'h0):(1'h0)]));
        end
      else
        begin
          reg169 <= $signed((~^((~((8'hbe) ? reg92 : reg45)) ?
              reg36 : (wire87[(1'h1):(1'h1)] & wire85[(2'h2):(1'h1)]))));
          reg170 <= wire166[(2'h2):(2'h2)];
        end
      reg171 <= (!(|$signed(($signed(wire26) >>> (wire166 | wire27)))));
    end
  assign wire172 = $unsigned({(&({wire27, reg43} ?
                           $signed(wire24) : {(8'ha8)})),
                       wire87});
  assign wire173 = (wire85 | $unsigned((~|$signed((reg91 >>> reg43)))));
endmodule

module module95  (y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h319):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire99;
  input wire [(5'h12):(1'h0)] wire98;
  input wire signed [(4'h9):(1'h0)] wire97;
  input wire signed [(5'h15):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire165;
  wire [(4'h9):(1'h0)] wire162;
  wire signed [(4'hc):(1'h0)] wire158;
  wire signed [(3'h5):(1'h0)] wire157;
  wire [(4'ha):(1'h0)] wire156;
  wire signed [(4'hc):(1'h0)] wire150;
  wire [(4'h9):(1'h0)] wire149;
  wire [(3'h6):(1'h0)] wire148;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(2'h2):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire103;
  reg [(2'h2):(1'h0)] reg164 = (1'h0);
  reg [(4'h9):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg155 = (1'h0);
  reg signed [(4'he):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  assign y = {wire165,
                 wire162,
                 wire158,
                 wire157,
                 wire156,
                 wire150,
                 wire149,
                 wire148,
                 wire129,
                 wire128,
                 wire116,
                 wire103,
                 reg164,
                 reg163,
                 reg161,
                 reg160,
                 reg159,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
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
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg100 <= $unsigned(((wire98[(5'h10):(4'ha)] | wire98) ?
          wire96 : (!(wire96 ?
              $unsigned(wire97) : (wire99 ? wire97 : wire99)))));
      reg101 <= reg100[(2'h2):(1'h1)];
      reg102 <= (^$signed($unsigned((reg101[(3'h6):(2'h3)] ?
          {reg101} : $signed((8'ha2))))));
    end
  assign wire103 = $signed($signed(wire98[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg104 <= (wire98[(4'hf):(3'h5)] ?
          $signed($signed(reg101[(1'h1):(1'h0)])) : (8'hb8));
      reg105 <= (wire98[(5'h12):(4'h8)] ?
          (8'ha5) : $signed(($unsigned($unsigned(wire98)) ?
              (~&reg100[(4'h8):(3'h6)]) : wire96[(4'ha):(3'h6)])));
      reg106 <= {$unsigned($signed($signed((wire99 ? reg105 : wire97)))),
          (^(((reg102 ? reg101 : (8'hbe)) - $unsigned((7'h44))) - wire96))};
      reg107 <= wire103;
      if (reg101[(1'h0):(1'h0)])
        begin
          reg108 <= wire97[(3'h5):(2'h3)];
          reg109 <= (^~wire98);
          reg110 <= (-reg107);
          reg111 <= $signed(reg100);
          reg112 <= reg105;
        end
      else
        begin
          reg108 <= $signed(reg112);
          reg109 <= ((reg106 ?
                  $unsigned((reg101 ?
                      (reg108 + reg106) : (reg107 ?
                          wire99 : (8'haf)))) : (-(7'h42))) ?
              ($signed((reg104[(1'h1):(1'h1)] && (reg105 > reg104))) ?
                  (^~(~$unsigned(reg104))) : reg110) : ($unsigned(wire103) ?
                  ((-{reg106}) ^~ ((8'hb6) ?
                      ((8'ha5) <<< (8'hbd)) : (reg107 && reg105))) : reg110));
          reg110 <= {wire103,
              $unsigned(((&reg102[(4'hd):(4'h9)]) != ((-(8'hac)) || reg111[(2'h3):(1'h0)])))};
          reg111 <= reg106;
        end
    end
  always
    @(posedge clk) begin
      reg113 <= reg101[(3'h7):(1'h1)];
      reg114 <= (+reg110[(4'h9):(3'h4)]);
      reg115 <= ({(+(-(8'hac)))} ?
          (|($signed({wire97, reg100}) ?
              (~&wire97[(3'h6):(2'h3)]) : ($unsigned((8'ha2)) - reg112))) : (reg104[(1'h1):(1'h0)] ?
              ({$unsigned(reg114)} != $signed($signed(wire97))) : reg102[(1'h0):(1'h0)]));
    end
  assign wire116 = $unsigned((($unsigned((reg111 ?
                           reg115 : reg108)) ^~ $signed(reg100)) ?
                       wire99[(3'h5):(3'h5)] : (((!reg111) <<< $unsigned(reg107)) ?
                           (-$unsigned(reg111)) : wire99[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg117 <= (~|(reg111 ?
          (((reg105 << reg100) ? (reg100 ? wire99 : wire97) : wire116) ?
              $unsigned($unsigned(reg101)) : (8'haf)) : reg102));
      if ((((&wire98[(3'h6):(3'h4)]) ?
              $signed($signed((wire97 - reg106))) : $signed($signed(reg113[(1'h0):(1'h0)]))) ?
          $signed((wire97[(2'h3):(2'h3)] ?
              reg110 : $signed((reg111 ?
                  reg110 : reg115)))) : reg100[(1'h0):(1'h0)]))
        begin
          reg118 <= $unsigned((8'hbb));
          reg119 <= ($signed($signed(reg112[(1'h0):(1'h0)])) <= {(reg114 ?
                  (wire99 - reg112) : {(reg100 ? reg106 : reg114),
                      $unsigned(reg100)}),
              {reg102, (reg110 ? $signed((7'h42)) : reg111[(4'he):(4'hb)])}});
          reg120 <= ({(8'ha4),
              (reg107[(4'hf):(4'he)] || $unsigned($unsigned(wire97)))} < wire99[(2'h2):(1'h1)]);
        end
      else
        begin
          reg118 <= reg107[(3'h5):(3'h5)];
          reg119 <= $signed((~reg117));
        end
      reg121 <= (~&($unsigned(reg104[(1'h0):(1'h0)]) ?
          $unsigned({reg111[(2'h3):(1'h1)],
              reg106[(5'h10):(1'h1)]}) : $signed({$signed((8'haa)),
              (reg109 ? reg106 : reg107)})));
      if (reg119[(3'h5):(2'h3)])
        begin
          reg122 <= (-$unsigned($signed((~&$unsigned(reg115)))));
          reg123 <= wire103[(4'h8):(3'h5)];
        end
      else
        begin
          if ($unsigned($signed($signed(((wire103 ?
              reg102 : reg114) - $signed((8'hbd)))))))
            begin
              reg122 <= (+(wire99[(4'h8):(1'h1)] > ($unsigned({reg114,
                  (8'ha3)}) ^~ (+{(8'h9f), wire98}))));
              reg123 <= (&$signed($signed((wire116 + reg105[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg122 <= $signed((!(^$signed(reg111[(1'h0):(1'h0)]))));
              reg123 <= (~|reg104);
              reg124 <= wire99[(3'h5):(2'h2)];
              reg125 <= $signed(($unsigned({(reg110 ? (8'ha2) : (7'h42))}) ?
                  {$signed($signed((8'had))), wire98} : {$signed(reg112),
                      (8'hb6)}));
            end
          reg126 <= (|wire103);
        end
      reg127 <= $unsigned($unsigned($unsigned($unsigned(((8'haf) ^ reg122)))));
    end
  assign wire128 = wire97;
  assign wire129 = $signed(({((8'ha9) || (wire97 <<< reg110)),
                           reg104[(2'h2):(1'h1)]} ?
                       reg113 : $unsigned({(reg111 ? (8'hb6) : reg109)})));
  always
    @(posedge clk) begin
      if ((reg117[(1'h0):(1'h0)] ?
          $signed((reg122 >= reg106)) : $unsigned((($signed((8'hbb)) ?
              (&reg117) : reg109) << reg104[(2'h3):(2'h3)]))))
        begin
          reg130 <= reg122;
          reg131 <= ($signed(($unsigned(reg120) ?
              (8'hb1) : reg100)) ~^ (wire99 ?
              ((&(~|reg115)) == (^$signed(wire129))) : (((reg102 + wire99) && ((8'hb5) != reg108)) ?
                  $unsigned({reg107}) : $unsigned(reg125[(1'h0):(1'h0)]))));
          reg132 <= ((reg106[(4'hb):(4'h8)] << reg127) ?
              $unsigned($signed(((~&wire129) | (reg102 ?
                  reg106 : wire103)))) : $unsigned($signed($unsigned((reg105 >= reg123)))));
          reg133 <= $signed($unsigned((((reg122 << reg108) + (+reg108)) >> {(reg114 << wire116)})));
          reg134 <= (($unsigned(wire128) | reg105) ?
              $unsigned(reg107[(4'hc):(3'h4)]) : ($unsigned((~$signed(reg105))) ?
                  wire116[(3'h4):(1'h0)] : (|$unsigned((wire97 << reg104)))));
        end
      else
        begin
          reg130 <= reg114;
          if ($signed(reg133[(2'h3):(1'h0)]))
            begin
              reg131 <= {(!$signed($unsigned(reg124[(1'h0):(1'h0)])))};
              reg132 <= ((reg133[(2'h3):(2'h2)] >>> (((~reg121) * $signed(reg120)) ?
                  (wire129[(5'h15):(4'hb)] ?
                      reg109 : reg106[(4'h8):(3'h7)]) : $signed($signed(reg127)))) <= ((+((+reg132) ?
                  $signed(reg132) : reg107)) == $unsigned((~$unsigned((8'had))))));
              reg133 <= reg123[(3'h5):(3'h4)];
              reg134 <= ((({(+(8'haa)), $signed((8'hac))} ?
                          reg126[(4'hd):(4'h9)] : (^~$unsigned(reg134))) ?
                      reg122[(3'h4):(3'h4)] : reg127) ?
                  reg118[(2'h3):(1'h1)] : (($signed($signed(reg107)) <<< reg108) ?
                      wire116 : (7'h44)));
            end
          else
            begin
              reg131 <= (+((^reg121) | wire97[(3'h7):(3'h7)]));
              reg132 <= wire116;
            end
          reg135 <= ($signed(reg134) + reg122);
          reg136 <= (+(reg132 ? (&$unsigned(reg127)) : wire103[(4'h9):(2'h2)]));
          reg137 <= reg111;
        end
      reg138 <= $signed(reg111[(3'h6):(3'h6)]);
      reg139 <= ($signed(reg111) ?
          ($signed((^~(reg137 ^~ wire97))) - reg130) : (^reg136));
      if (reg114)
        begin
          if (reg107[(4'h8):(3'h4)])
            begin
              reg140 <= ((~(-((wire129 ?
                  reg111 : reg113) == $signed(reg100)))) ^ $unsigned((^$unsigned(reg112))));
              reg141 <= (wire116 | $signed($unsigned((!{reg135, reg140}))));
              reg142 <= wire98[(5'h12):(4'hf)];
              reg143 <= ((($signed((reg106 ^ reg110)) ?
                      $signed(reg122[(3'h5):(3'h4)]) : {reg104[(2'h3):(2'h2)]}) != reg122[(5'h13):(4'he)]) ?
                  {$signed(reg117),
                      $unsigned(reg100[(4'h8):(4'h8)])} : reg142[(4'hb):(2'h3)]);
              reg144 <= $unsigned({(&(reg107 << wire98[(3'h4):(1'h1)]))});
            end
          else
            begin
              reg140 <= $unsigned(($unsigned((reg133[(2'h3):(2'h3)] ?
                      (reg140 ? reg119 : wire128) : $unsigned(wire96))) ?
                  $signed($signed(reg123)) : ($signed((reg144 ?
                          reg126 : wire128)) ?
                      {$signed(reg112),
                          wire98[(2'h3):(2'h3)]} : $unsigned((reg115 ?
                          reg108 : (8'had))))));
              reg141 <= (|$signed($signed((|(reg133 ? wire116 : (8'hbd))))));
              reg142 <= reg138[(1'h0):(1'h0)];
              reg143 <= ($unsigned({(((8'ha2) ? wire116 : reg132) && wire96),
                  (8'ha2)}) >>> (!(^~((+reg119) ?
                  (reg115 < reg111) : {wire129}))));
            end
          reg145 <= {(reg109[(4'ha):(2'h2)] ?
                  $unsigned((~|$unsigned(reg127))) : reg110)};
          reg146 <= (8'had);
        end
      else
        begin
          reg140 <= (!reg127);
          reg141 <= ($signed({(reg104[(2'h2):(1'h1)] ?
                  (reg127 ?
                      reg126 : (8'hb6)) : $unsigned(reg105))}) <= ({(&reg107)} >>> ((^~$unsigned(reg122)) ?
              (reg119[(1'h1):(1'h0)] + (wire97 < wire99)) : ($signed((8'had)) <= reg115))));
          reg142 <= reg120[(3'h5):(2'h2)];
        end
      reg147 <= (~&$signed(($unsigned(reg126[(3'h5):(3'h5)]) ^~ {reg108[(3'h6):(3'h5)]})));
    end
  assign wire148 = ($unsigned(wire98) << $signed({(reg135[(3'h4):(1'h1)] ?
                           reg112[(4'hb):(3'h7)] : wire98[(2'h2):(1'h0)]),
                       $unsigned({reg146})}));
  assign wire149 = reg101[(3'h5):(2'h2)];
  assign wire150 = {(!$signed(wire99)),
                       {reg130,
                           (($signed(reg111) > reg125) ^~ ((~^reg147) <<< (|reg144)))}};
  always
    @(posedge clk) begin
      reg151 <= ($signed(wire98[(2'h3):(1'h0)]) ?
          {$signed($unsigned($signed(reg117))),
              $signed($unsigned((reg147 + (8'ha8))))} : reg135[(4'h9):(1'h1)]);
      reg152 <= (^~reg118);
      reg153 <= $signed($unsigned((-{$signed(reg105)})));
      reg154 <= ((reg115[(4'hd):(4'hc)] != $unsigned((reg142 ?
              (wire99 < reg152) : {reg133}))) ?
          (&({$signed(reg139), ((8'ha4) ? (8'hbf) : reg134)} ?
              ({wire98} ?
                  reg108[(3'h6):(3'h6)] : (reg112 <<< (8'hb5))) : ({wire129,
                  reg152} * reg118[(3'h5):(2'h3)]))) : $unsigned(reg112[(4'ha):(4'h9)]));
      reg155 <= (($signed((-$unsigned(reg124))) ~^ $signed(reg109)) & (reg121 ?
          (-wire116[(4'ha):(4'ha)]) : (((reg127 ^ reg124) < (|reg124)) == ((wire96 | reg133) <= $unsigned(reg110)))));
    end
  assign wire156 = wire149;
  assign wire157 = (-(reg125 ?
                       (~&(wire99 ^~ $unsigned(reg123))) : {(!reg138[(5'h14):(3'h6)]),
                           $unsigned((reg126 ? reg151 : reg134))}));
  assign wire158 = $unsigned(reg113);
  always
    @(posedge clk) begin
      reg159 <= reg119;
      reg160 <= reg125[(1'h1):(1'h0)];
      reg161 <= reg102[(3'h7):(3'h6)];
    end
  assign wire162 = (!((~((~reg113) ? reg154[(2'h2):(1'h0)] : reg123)) ?
                       reg114 : reg101));
  always
    @(posedge clk) begin
      reg163 <= {wire156[(3'h6):(3'h5)], reg138};
      reg164 <= reg160;
    end
  assign wire165 = (|$unsigned($signed(reg120)));
endmodule

module module46
#(parameter param84 = {(~|((^(~^(8'hbd))) | {((8'ha6) << (8'hae))})), ((^{(~|(8'ha4))}) <<< ((((8'ha2) ? (8'ha7) : (8'hbc)) ? ((8'hb0) ? (7'h42) : (8'h9d)) : {(8'hab), (8'ha7)}) || (~^(~&(7'h40)))))})
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire50;
  input wire signed [(4'hb):(1'h0)] wire49;
  input wire [(5'h11):(1'h0)] wire48;
  input wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire51;
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire51,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire51 = ($unsigned((+wire49[(4'h9):(4'h8)])) || (-wire48));
  always
    @(posedge clk) begin
      if (({((^wire47[(2'h3):(2'h2)]) ?
              $signed((-(8'ha2))) : $signed((~&(8'hbd)))),
          $unsigned(($signed(wire48) + $signed(wire50)))} <= {((8'hb3) > $unsigned((wire49 ?
              wire50 : wire49)))}))
        begin
          reg52 <= (wire48 >= wire51[(2'h3):(1'h1)]);
          if ($unsigned((({(reg52 | wire47),
              wire50[(4'h9):(4'h9)]} <<< (|$signed((8'haf)))) << ((!wire48[(2'h3):(1'h1)]) ?
              wire50[(2'h2):(2'h2)] : wire48[(4'h8):(3'h6)]))))
            begin
              reg53 <= wire48[(5'h11):(4'hb)];
              reg54 <= {reg52[(4'h8):(2'h3)]};
            end
          else
            begin
              reg53 <= ($unsigned($unsigned(reg53)) ?
                  (7'h42) : (({$signed(reg54)} ^~ (((8'h9e) ?
                          wire51 : wire51) || reg53[(3'h6):(2'h2)])) ?
                      reg52 : (7'h40)));
              reg54 <= $signed(($unsigned(reg54) ?
                  $unsigned((^~(wire48 > wire51))) : $signed(((wire47 << wire51) ?
                      wire50 : (wire48 ? wire49 : reg54)))));
              reg55 <= reg54;
              reg56 <= (^$signed(($signed(wire48[(4'h8):(1'h0)]) <<< ({wire49} ^ $signed(wire48)))));
              reg57 <= ($unsigned(($unsigned($signed(wire47)) != $signed(reg55[(3'h5):(3'h4)]))) ?
                  (({wire47, reg55[(3'h4):(1'h0)]} ?
                          {$unsigned(wire48),
                              reg53[(4'hb):(3'h6)]} : ($unsigned(reg56) + wire49)) ?
                      wire47[(2'h2):(2'h2)] : reg54[(4'hf):(2'h2)]) : reg52[(4'hd):(1'h1)]);
            end
          reg58 <= $unsigned(reg56);
        end
      else
        begin
          reg52 <= (+$unsigned($signed((wire51 - (reg57 ? wire51 : reg56)))));
        end
      reg59 <= reg54[(4'he):(4'he)];
      if ($signed(reg56))
        begin
          reg60 <= $signed(reg55[(4'ha):(1'h1)]);
          reg61 <= (+($unsigned($unsigned(reg56[(5'h10):(3'h6)])) >= reg53));
          reg62 <= $signed($unsigned((7'h41)));
          reg63 <= reg54[(4'hb):(4'h8)];
        end
      else
        begin
          reg60 <= ($unsigned(wire48) ?
              reg57 : $unsigned((+$signed($signed((8'ha2))))));
          reg61 <= ($signed(($signed($unsigned(wire50)) ?
                  $unsigned({reg61}) : (^~$unsigned(wire49)))) ?
              (!(+(reg60 ?
                  (wire49 < wire49) : wire50[(3'h7):(1'h1)]))) : (wire49 ?
                  {(^reg61),
                      $unsigned(wire51[(3'h4):(3'h4)])} : (~(~^reg61[(4'hb):(3'h6)]))));
          reg62 <= (({(+$signed(reg56))} ?
              ({(wire51 | (8'hb6))} >>> $signed($unsigned(wire50))) : $signed(reg63)) >> (wire51[(4'h9):(2'h2)] ?
              $unsigned($signed((+wire49))) : ($unsigned($unsigned(reg59)) ?
                  ((~|reg61) ? $unsigned(reg58) : reg55) : (~(wire48 ?
                      reg53 : reg56)))));
          reg63 <= (reg53[(2'h2):(1'h0)] + $signed((reg55 ?
              reg57[(1'h0):(1'h0)] : $unsigned($unsigned((7'h40))))));
          if ({$unsigned($signed((8'h9f))), reg63[(4'he):(4'h9)]})
            begin
              reg64 <= (~|$unsigned($signed((((8'hbd) * wire51) ?
                  $signed(wire49) : {wire49}))));
              reg65 <= ((reg57 <<< ($unsigned((^wire49)) >>> ((wire51 != reg54) != (8'ha9)))) >>> (~reg64[(1'h0):(1'h0)]));
              reg66 <= (~&$unsigned(($unsigned((reg53 ? reg62 : reg55)) ?
                  (&$unsigned(reg62)) : (|wire47[(2'h2):(2'h2)]))));
              reg67 <= $unsigned((reg64 ? reg53 : reg61));
            end
          else
            begin
              reg64 <= $signed($unsigned($unsigned(wire50)));
              reg65 <= reg63[(4'h9):(1'h0)];
              reg66 <= $unsigned(($unsigned(((&reg62) ^~ (reg53 != reg55))) < wire48));
              reg67 <= $unsigned(wire51[(3'h6):(1'h1)]);
            end
        end
      reg68 <= wire49;
      reg69 <= (~reg60[(3'h4):(2'h3)]);
    end
  assign wire70 = $signed((reg60 ?
                      $unsigned($unsigned((+(8'hb3)))) : (^~((|reg65) <<< $signed(wire50)))));
  assign wire71 = (|(reg67[(3'h4):(1'h1)] != wire50));
  assign wire72 = {reg61};
  assign wire73 = $signed((^(^~$signed((reg65 ^~ reg54)))));
  assign wire74 = reg67;
  assign wire75 = ($unsigned($signed($signed($unsigned(reg55)))) ?
                      {{reg62, $signed((reg56 * (8'hb2)))},
                          {$signed((-reg63))}} : $signed(wire73));
  assign wire76 = (reg66[(2'h3):(2'h2)] ? (wire49 >= (8'h9c)) : $signed(reg61));
  assign wire77 = reg57[(4'h9):(4'h8)];
  assign wire78 = $signed(reg67[(2'h3):(1'h0)]);
  assign wire79 = $signed(wire78);
  assign wire80 = ((reg62 ?
                          $unsigned(((^~reg66) * (reg66 ?
                              (8'hb2) : reg69))) : $signed($unsigned(reg59[(4'hb):(1'h1)]))) ?
                      (reg61 ?
                          (reg67 != wire78[(3'h4):(1'h1)]) : $unsigned($unsigned((~^wire70)))) : (-(reg54[(2'h2):(1'h0)] ?
                          (reg53 == $signed(wire70)) : $signed($unsigned(reg57)))));
  assign wire81 = ($signed(((+reg55[(2'h2):(1'h0)]) ?
                      (|$signed(wire70)) : (~|$unsigned(reg59)))) << (({(~|(8'hb6)),
                          (reg69 ? (8'hb7) : (8'hae))} ?
                      (8'h9c) : ((wire51 >>> reg61) >> {reg61,
                          reg60})) + {((wire50 ? reg63 : wire51) - (8'hbb)),
                      (reg59 > (reg54 ? reg55 : reg68))}));
  assign wire82 = wire70[(5'h11):(1'h1)];
  assign wire83 = {{(wire77 ? (~^$unsigned(wire82)) : (!(^reg53))),
                          ($unsigned({wire73}) ?
                              wire70[(2'h2):(1'h0)] : (!wire73[(2'h2):(1'h0)]))},
                      (8'hb7)};
endmodule
