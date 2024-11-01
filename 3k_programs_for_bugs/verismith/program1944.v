module top
#(parameter param165 = {(~|((^~(~(8'ha1))) ? ((|(8'ha8)) > ((8'ha2) ? (8'hac) : (8'hbb))) : (((8'ha1) && (8'ha2)) ? ((7'h42) + (8'hb3)) : (^~(7'h42)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire164;
  wire [(4'hb):(1'h0)] wire163;
  wire signed [(3'h6):(1'h0)] wire162;
  wire [(5'h13):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire97;
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire158,
                 wire100,
                 wire99,
                 wire97,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 (1'h0)};
  module4 #() modinst98 (.wire6(wire3), .wire8(wire0), .wire9((8'ha5)), .wire7(wire1), .clk(clk), .y(wire97), .wire5(wire2));
  assign wire99 = $unsigned($signed((wire97[(3'h6):(1'h1)] ?
                      wire1[(5'h13):(4'ha)] : ((wire0 ? wire97 : wire97) ?
                          $signed(wire97) : wire1))));
  assign wire100 = (&wire99[(4'hb):(3'h6)]);
  always
    @(posedge clk) begin
      reg101 <= (({((wire99 ? (8'hb5) : wire3) > (!wire3)),
              {(7'h41), $unsigned(wire0)}} ?
          ((+(wire97 < (8'h9e))) ~^ $signed({wire2,
              wire97})) : wire2) * $unsigned(wire97[(3'h5):(1'h1)]));
      reg102 <= ((-$unsigned({$signed(wire97)})) >>> $signed(reg101));
      if ((($unsigned($unsigned(wire2)) >> $signed($unsigned(reg101))) ?
          (~(+wire99)) : (~&wire97[(2'h3):(2'h2)])))
        begin
          if ($unsigned({wire0}))
            begin
              reg103 <= wire100;
              reg104 <= $signed($unsigned($unsigned((wire100[(1'h1):(1'h0)] || wire97[(2'h2):(1'h0)]))));
              reg105 <= reg103[(3'h6):(2'h3)];
              reg106 <= ($unsigned((!$unsigned(wire2[(4'hd):(2'h3)]))) ?
                  ($signed((wire97 ?
                      (wire3 ?
                          reg102 : wire97) : $unsigned(reg101))) * (({wire97,
                      (8'h9d)} ^~ $signed(wire1)) ^ $signed($unsigned(reg101)))) : (reg102[(1'h0):(1'h0)] ?
                      reg105 : ({(reg104 ? reg103 : wire97)} ?
                          (8'hbc) : (~(^~reg104)))));
              reg107 <= ((wire2 ?
                      (8'hac) : $signed((wire2 ?
                          (^~reg106) : reg101[(3'h7):(1'h0)]))) ?
                  $unsigned((wire3 ?
                      (&reg102[(2'h2):(2'h2)]) : wire99[(4'hb):(3'h6)])) : reg101[(4'hc):(2'h3)]);
            end
          else
            begin
              reg103 <= {(reg103[(4'h9):(3'h6)] == $signed(($unsigned(wire1) ^ $signed(wire97))))};
            end
          reg108 <= $signed(wire100[(1'h1):(1'h0)]);
          if ((^~$signed((~&(^wire2)))))
            begin
              reg109 <= reg105;
              reg110 <= wire3;
              reg111 <= (~|($signed($unsigned(reg108)) ?
                  $signed(((+reg108) ^~ wire100[(2'h2):(1'h0)])) : ((8'ha9) <= ((wire0 ?
                          (8'hb4) : (8'hb4)) ?
                      (~^reg106) : reg103))));
            end
          else
            begin
              reg109 <= $unsigned((!(wire1[(5'h14):(5'h10)] ?
                  ({wire3} * wire3[(1'h1):(1'h1)]) : (reg103 ^ {reg107}))));
              reg110 <= (!(($signed($signed(reg106)) ?
                      (&((7'h41) <<< reg109)) : wire0) ?
                  ({$unsigned(wire3)} < reg106) : {$unsigned($unsigned(reg108))}));
              reg111 <= (+reg101);
              reg112 <= ((reg106[(3'h7):(2'h3)] ?
                  ({$unsigned(reg111), wire3[(1'h0):(1'h0)]} ?
                      {$unsigned(reg110),
                          ((8'ha4) >= wire3)} : reg102) : $signed($unsigned(wire1))) == (wire0[(4'hf):(4'hf)] ^~ (8'ha8)));
              reg113 <= $unsigned({$unsigned($signed(reg106[(2'h3):(1'h1)]))});
            end
          reg114 <= reg110;
          reg115 <= ((!{reg110}) ? (~^wire100) : (!$unsigned(reg101)));
        end
      else
        begin
          reg103 <= $signed((reg114[(5'h11):(4'hf)] ?
              (~reg115[(1'h1):(1'h1)]) : reg105));
        end
      if (((((|reg102) ? wire100 : (^(&wire0))) ?
          (~&(&(&(8'h9d)))) : (+$unsigned(wire97))) << (((~&$signed(reg113)) ^ ((reg106 + reg111) >= reg105[(1'h1):(1'h0)])) ?
          (reg109 ?
              wire0 : (wire3 ?
                  (reg103 ?
                      reg114 : reg109) : wire97[(2'h2):(2'h2)])) : (8'haa))))
        begin
          reg116 <= wire2[(4'h8):(1'h1)];
          reg117 <= $signed(((^~wire97[(3'h7):(1'h0)]) <= $unsigned(reg116)));
          reg118 <= ({(((reg105 ? reg116 : (8'hb2)) >= wire2[(4'hd):(1'h0)]) ?
                      (7'h40) : {(reg104 < wire100), (~|reg101)})} ?
              (+(~&$unsigned(((7'h42) && (8'hbd))))) : (~|{({reg108} >> $unsigned(wire100))}));
          reg119 <= (^~(wire97 >= $signed(reg104[(4'hc):(3'h4)])));
        end
      else
        begin
          reg116 <= reg106[(1'h0):(1'h0)];
          reg117 <= ((^{reg115, $unsigned((8'hab))}) ?
              $signed($signed((&$signed(wire97)))) : ($signed({$unsigned(reg101),
                      (&(8'ha2))}) ?
                  $signed(reg106) : {(~wire2), (^~reg104[(3'h5):(1'h0)])}));
        end
      reg120 <= (!($signed(wire99[(4'he):(4'hd)]) ?
          $unsigned(($signed((8'ha9)) ?
              (reg111 - reg110) : (reg102 || reg102))) : {$unsigned(wire2)}));
    end
  module121 #() modinst159 (wire158, clk, wire3, reg108, reg112, reg104, wire1);
  assign wire160 = $signed({reg108[(2'h2):(2'h2)]});
  assign wire161 = reg108[(1'h0):(1'h0)];
  assign wire162 = (-($signed((&reg106)) || {reg118, reg119}));
  assign wire163 = (($signed({$signed(reg108), $unsigned(reg120)}) ?
                           $signed(($signed(reg108) ?
                               reg105 : (~wire161))) : reg106) ?
                       reg119[(1'h0):(1'h0)] : reg116);
  assign wire164 = $unsigned(reg103[(1'h1):(1'h1)]);
endmodule

module module121  (y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire126;
  input wire [(4'hf):(1'h0)] wire125;
  input wire signed [(3'h5):(1'h0)] wire124;
  input wire signed [(4'hf):(1'h0)] wire123;
  input wire signed [(4'h8):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire127;
  reg [(3'h5):(1'h0)] reg157 = (1'h0);
  reg [(4'ha):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  assign y = {wire128,
                 wire127,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
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
                 reg129,
                 (1'h0)};
  assign wire127 = (^(8'h9e));
  assign wire128 = $unsigned(wire124);
  always
    @(posedge clk) begin
      reg129 <= wire122[(4'h8):(1'h0)];
      reg130 <= $unsigned(reg129[(4'hc):(4'h8)]);
      reg131 <= wire126[(1'h0):(1'h0)];
      reg132 <= reg131;
      if ($signed((+((8'hab) <<< wire123))))
        begin
          reg133 <= $unsigned(({wire123,
              $unsigned((^~(7'h43)))} * (~|(wire123[(1'h1):(1'h1)] ?
              $unsigned(reg131) : $signed(wire123)))));
          if ((reg131[(1'h0):(1'h0)] * (($unsigned((!reg133)) ~^ $unsigned($unsigned(wire122))) >= (~^$signed({wire127,
              wire122})))))
            begin
              reg134 <= reg131[(3'h6):(3'h4)];
              reg135 <= $signed((reg130[(4'ha):(1'h0)] != (8'ha2)));
              reg136 <= $signed(wire122[(3'h6):(1'h0)]);
              reg137 <= {(reg129 < $signed($unsigned((+(8'hb5))))),
                  (reg134 ? wire126 : (&(8'hb3)))};
              reg138 <= reg131;
            end
          else
            begin
              reg134 <= ((^~(((wire123 >>> wire124) ?
                  (reg131 >= reg129) : reg137[(1'h1):(1'h1)]) && $signed(wire127))) > (!reg130[(1'h0):(1'h0)]));
            end
          reg139 <= reg134;
        end
      else
        begin
          reg133 <= ($signed(((~&{wire126,
              wire123}) > (|(reg138 & reg138)))) + {(((reg130 <= reg131) ?
                  reg131 : (reg130 || reg132)) >> reg133)});
        end
    end
  always
    @(posedge clk) begin
      if ({((-wire127) ? reg136 : {wire122[(1'h0):(1'h0)], wire127}),
          $signed($signed($signed((^wire123))))})
        begin
          reg140 <= reg139;
          reg141 <= (^~reg131);
          reg142 <= (((|$signed($signed((8'had)))) && $signed(reg136[(3'h6):(3'h4)])) <= $unsigned($unsigned((^~{reg140}))));
          reg143 <= $signed(((reg134 ?
                  (reg138[(1'h0):(1'h0)] ?
                      $unsigned(reg134) : {wire126}) : (~&(^reg139))) ?
              ({reg129[(1'h1):(1'h0)]} ^~ reg135) : (reg133 ?
                  ($signed(reg137) > reg134) : reg139[(4'ha):(4'h8)])));
          reg144 <= (((((reg133 & wire125) <<< $signed(reg135)) >> ($signed((8'hb2)) ?
                      (wire125 ? reg139 : reg134) : reg129)) ?
                  wire128 : (reg143 * reg133[(2'h2):(1'h1)])) ?
              (reg131[(4'hb):(4'ha)] + reg130) : {{$unsigned((~reg136))},
                  $unsigned((!(reg143 ? wire123 : wire122)))});
        end
      else
        begin
          reg140 <= {reg142[(2'h3):(1'h0)]};
        end
      reg145 <= reg142[(3'h7):(1'h0)];
      if ($signed($signed((reg137[(3'h4):(2'h2)] == reg136))))
        begin
          reg146 <= (~^(|$signed(((-reg130) + {reg130}))));
          reg147 <= (reg133[(4'h8):(4'h8)] >> $unsigned((wire126[(1'h1):(1'h1)] ?
              reg141[(4'ha):(4'ha)] : $unsigned(wire123))));
          if ((~^($unsigned($unsigned($signed(reg135))) ?
              reg142[(2'h2):(1'h0)] : $signed((^$signed((8'hbb)))))))
            begin
              reg148 <= $signed($signed((reg131[(4'h8):(1'h0)] ?
                  $signed($signed(reg140)) : (^~wire125[(4'h8):(1'h1)]))));
            end
          else
            begin
              reg148 <= $unsigned($unsigned(($signed(wire124) == $signed((7'h41)))));
              reg149 <= $signed(reg133);
              reg150 <= $unsigned(reg132[(4'ha):(4'h8)]);
            end
          if (reg147[(3'h4):(3'h4)])
            begin
              reg151 <= (^$unsigned(($unsigned((wire125 >>> (8'hb1))) ?
                  $unsigned((reg142 ?
                      (8'ha7) : wire127)) : $signed($unsigned(reg133)))));
              reg152 <= reg145;
              reg153 <= (+reg144[(2'h2):(2'h2)]);
              reg154 <= ({(reg141 ? reg130[(1'h1):(1'h1)] : (+(&reg153)))} ?
                  ($signed($signed((wire127 >> (8'ha8)))) * (((reg136 << wire126) < reg132) && $unsigned($unsigned(reg135)))) : (($signed({reg141,
                      wire125}) * ($unsigned(reg151) & (+wire127))) - $unsigned(wire126)));
              reg155 <= ($unsigned($signed($signed((reg131 >> reg151)))) <<< $unsigned(reg141));
            end
          else
            begin
              reg151 <= ($signed(($unsigned((&(7'h43))) * reg155[(2'h2):(1'h1)])) ?
                  ($signed((^~$signed(reg154))) <<< (~^{(wire127 >>> reg141)})) : $signed((8'hb0)));
            end
          reg156 <= $signed(wire122);
        end
      else
        begin
          if (((^~$unsigned(reg136)) ?
              (reg132 >>> wire128) : $signed((^~((~|reg131) ?
                  reg151[(3'h5):(2'h3)] : {(8'hbb), reg147})))))
            begin
              reg146 <= $signed(reg153);
            end
          else
            begin
              reg146 <= reg153;
              reg147 <= {$signed($signed(reg148))};
            end
          reg148 <= reg138;
        end
      reg157 <= ($unsigned((reg136 >>> (reg145 ^ (!reg131)))) ?
          (wire123[(3'h6):(1'h0)] ?
              (8'hb6) : ($signed(((8'hbd) ? reg130 : reg140)) ?
                  ((reg134 > (8'hb9)) ^ (8'hb9)) : (reg130[(1'h1):(1'h0)] ?
                      (reg132 ?
                          wire123 : reg140) : (~reg153)))) : reg150[(2'h3):(1'h1)]);
    end
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h2f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire5;
  input wire [(3'h7):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire86;
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire86,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
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
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 (1'h0)};
  assign wire10 = wire6[(2'h2):(1'h1)];
  assign wire11 = wire9;
  assign wire12 = wire7;
  assign wire13 = wire10[(4'ha):(2'h3)];
  assign wire14 = $unsigned(wire12);
  assign wire15 = wire8;
  assign wire16 = wire14;
  assign wire17 = (!wire6);
  assign wire18 = (&((^~($signed(wire11) != $signed(wire15))) ?
                      (|(wire9[(2'h2):(2'h2)] ?
                          $signed(wire16) : wire12)) : (-($signed(wire8) ?
                          (-wire6) : {wire9, wire11}))));
  assign wire19 = ($unsigned($unsigned(wire18[(4'he):(4'h8)])) ?
                      (^~(^wire10)) : (!$unsigned($unsigned(wire5))));
  always
    @(posedge clk) begin
      if (((wire13[(3'h5):(2'h3)] ?
              {wire6[(2'h3):(2'h3)]} : $signed((wire5 ~^ wire14))) ?
          (^~(-{(wire16 & wire8), $signed(wire19)})) : wire13[(2'h3):(1'h1)]))
        begin
          if (wire12[(3'h4):(1'h1)])
            begin
              reg20 <= $unsigned($unsigned(wire14));
              reg21 <= ($signed(wire15) ?
                  (&(8'ha0)) : $signed((((wire7 ? wire15 : (8'hae)) ?
                          $unsigned(wire11) : (^~wire12)) ?
                      ((^(8'ha1)) || wire15[(3'h4):(1'h0)]) : {(~|wire8),
                          wire12})));
              reg22 <= $signed((wire11[(5'h11):(4'hb)] ^ $unsigned($unsigned((~^wire19)))));
              reg23 <= $unsigned($unsigned({$signed($signed((8'had))),
                  $signed(reg20[(3'h6):(1'h1)])}));
              reg24 <= $unsigned(reg20[(2'h3):(2'h2)]);
            end
          else
            begin
              reg20 <= $signed((reg23 ?
                  ({wire8[(2'h2):(1'h0)]} ?
                      $signed(((8'hb3) ? wire17 : wire11)) : {wire10,
                          reg20[(2'h2):(1'h0)]}) : ((((8'hbb) ^ reg21) - (!wire16)) - ($unsigned(reg24) == (wire13 ?
                      wire11 : wire14)))));
              reg21 <= wire10[(4'ha):(3'h5)];
              reg22 <= $unsigned((wire12 ?
                  $signed(wire18) : (~($signed(reg24) - (wire15 <= reg21)))));
              reg23 <= reg22[(4'he):(3'h5)];
              reg24 <= ({((+$signed(wire16)) ? (8'ha2) : wire8),
                      ((^~wire11) ? (|wire8) : {$unsigned((8'hbd))})} ?
                  (wire17[(1'h1):(1'h1)] + ((8'hb6) ?
                      ($unsigned(reg24) & $unsigned((7'h43))) : {(&wire8)})) : {{($unsigned(reg23) ?
                              $signed(reg24) : (wire14 ? reg24 : (8'had)))}});
            end
          if (($signed($unsigned($unsigned((reg20 ? wire15 : wire18)))) ?
              (~^wire18) : (wire9[(2'h2):(2'h2)] >= $unsigned({(wire15 ^~ wire12)}))))
            begin
              reg25 <= reg22[(4'h9):(3'h4)];
              reg26 <= (($unsigned({(wire11 ? (8'hb3) : wire16),
                      reg22}) ^ reg25[(2'h3):(2'h3)]) ?
                  $unsigned(wire9[(1'h0):(1'h0)]) : wire19);
              reg27 <= ($signed((8'ha8)) ?
                  reg20 : (&((wire16 ? wire17 : (wire15 || (7'h40))) ?
                      (wire16 ?
                          ((8'hb2) ?
                              wire5 : reg21) : $signed(reg24)) : {wire7[(3'h6):(1'h0)],
                          ((8'hba) >>> wire7)})));
              reg28 <= (!$unsigned((((|wire10) ?
                  (wire12 * (8'ha4)) : $signed(wire6)) <= ((wire14 ?
                  wire18 : wire7) <= (wire15 & (8'ha6))))));
            end
          else
            begin
              reg25 <= {reg24[(2'h2):(2'h2)]};
              reg26 <= {$unsigned(((reg27 ?
                      (|(8'haa)) : (^wire16)) < {((8'hb4) >= reg28)}))};
              reg27 <= reg25;
              reg28 <= (+(wire17[(4'h8):(3'h6)] ?
                  $signed($signed((^~(8'ha8)))) : $unsigned($unsigned({(7'h44)}))));
              reg29 <= wire17[(3'h6):(2'h3)];
            end
          reg30 <= ($signed(wire12[(3'h4):(1'h1)]) == $signed($unsigned((((7'h42) || wire13) - ((7'h42) < (7'h44))))));
          reg31 <= ((($unsigned($unsigned(wire12)) ?
                  (wire11 <<< (|(8'h9e))) : wire7) == $signed((-$unsigned(reg28)))) ?
              {(+$unsigned((8'ha5)))} : {($unsigned(((8'ha0) - reg30)) ~^ $signed({reg30}))});
        end
      else
        begin
          reg20 <= $signed(({(+(wire16 ? (8'h9d) : reg24)),
              $unsigned((wire19 ? wire8 : reg28))} - ($signed({wire16}) ?
              ((~^reg25) || $signed(reg25)) : (~^reg20[(2'h2):(2'h2)]))));
          if ((8'hbf))
            begin
              reg21 <= $unsigned((7'h42));
              reg22 <= wire6[(3'h7):(2'h3)];
              reg23 <= ((|$signed((reg23[(3'h6):(1'h0)] ?
                  (reg20 ? wire9 : wire10) : (~|wire6)))) < (reg22 ?
                  {wire11,
                      {$unsigned(reg29)}} : (($unsigned(wire9) - reg27[(2'h2):(2'h2)]) ?
                      $signed($signed((8'hab))) : (~|wire7))));
            end
          else
            begin
              reg21 <= (({($signed(wire18) ? {wire11} : $unsigned(reg23)),
                      $signed((wire9 ? wire9 : wire15))} ?
                  $signed((~wire18)) : (reg25 < $signed(wire14[(5'h11):(4'he)]))) ^~ $signed($signed(reg21)));
              reg22 <= ((reg30 - $unsigned({(8'ha8)})) >= wire18);
              reg23 <= reg21;
              reg24 <= ({{(+$unsigned(reg28)), wire11[(4'hc):(4'hc)]},
                  wire11[(2'h3):(1'h0)]} <<< reg20[(3'h5):(2'h2)]);
            end
          reg25 <= {wire6,
              (($signed(wire19[(4'hb):(4'h9)]) ^~ $unsigned(((8'ha0) >>> reg22))) <= $unsigned($signed((reg24 != wire17))))};
          reg26 <= (wire5[(3'h5):(1'h1)] ?
              ((&(^$unsigned(reg30))) << wire5) : wire8[(1'h1):(1'h1)]);
        end
      reg32 <= {wire10[(3'h4):(1'h0)]};
      if ((((~(~&$unsigned(reg20))) >>> ($unsigned(wire6[(1'h1):(1'h1)]) >> (8'ha2))) ?
          reg23 : $unsigned(reg26[(3'h4):(1'h1)])))
        begin
          reg33 <= ($signed($unsigned(((^~reg24) ?
              wire16[(1'h0):(1'h0)] : reg25[(3'h7):(1'h1)]))) * $unsigned(reg25[(4'h8):(1'h0)]));
          if ($signed($signed($unsigned(reg23))))
            begin
              reg34 <= reg29[(2'h3):(2'h3)];
              reg35 <= $unsigned((8'hb9));
              reg36 <= ((wire16 ?
                      (reg21 + $signed($unsigned(reg30))) : (reg34 >= $unsigned($unsigned(reg26)))) ?
                  {$unsigned((+$signed(wire6)))} : $unsigned($unsigned(($signed((8'h9d)) << wire7))));
            end
          else
            begin
              reg34 <= (|wire11[(4'ha):(4'h8)]);
              reg35 <= ((~(!{reg34[(4'hf):(4'h9)]})) >> (&$unsigned(reg34)));
            end
        end
      else
        begin
          reg33 <= wire15;
          reg34 <= {wire5[(4'h9):(1'h0)], reg20[(2'h2):(1'h0)]};
          reg35 <= reg24[(5'h12):(5'h11)];
          reg36 <= ((!(~&($unsigned(reg33) ?
                  (wire14 ~^ reg28) : (wire12 ? wire15 : wire6)))) ?
              (wire9[(1'h1):(1'h0)] || $signed($unsigned($unsigned(wire11)))) : reg32);
        end
    end
  always
    @(posedge clk) begin
      if ((reg22 - wire15))
        begin
          reg37 <= (-$unsigned((8'h9d)));
          reg38 <= wire10;
          reg39 <= (+wire17);
        end
      else
        begin
          reg37 <= reg25;
          reg38 <= (!reg37[(1'h0):(1'h0)]);
          reg39 <= $unsigned($unsigned(wire19[(4'h9):(4'h9)]));
          if ({reg31[(4'h9):(4'h9)], reg33})
            begin
              reg40 <= $signed(reg25[(3'h7):(3'h6)]);
              reg41 <= $unsigned(((($signed(wire15) ?
                      $unsigned(reg20) : reg38[(4'he):(4'ha)]) ?
                  (wire15[(4'hb):(4'ha)] >>> (reg33 ?
                      reg22 : reg29)) : $unsigned($signed(wire7))) + wire7[(4'h9):(3'h6)]));
            end
          else
            begin
              reg40 <= (({reg33[(2'h3):(1'h1)]} ? (8'hab) : reg38) ?
                  ((!{((8'hb5) ? wire12 : reg39),
                      $signed(reg34)}) & {(wire11[(3'h5):(3'h4)] > reg21[(1'h1):(1'h0)])}) : (~&reg27));
              reg41 <= $signed((~(&(!((7'h43) ? wire16 : reg26)))));
              reg42 <= reg21;
              reg43 <= ({$unsigned((8'h9e)), $unsigned(reg36)} ?
                  {(((~reg33) || reg37[(3'h6):(1'h0)]) ?
                          reg39[(4'ha):(1'h0)] : $signed((reg27 & reg24))),
                      (^$signed((reg37 ? reg20 : wire7)))} : $unsigned(wire6));
              reg44 <= $signed(((7'h40) ?
                  (8'ha3) : ($signed($signed(reg23)) ?
                      $signed((^~reg29)) : $unsigned((~reg35)))));
            end
        end
      if (((reg27 <<< (reg40 != wire16[(2'h3):(2'h2)])) == wire8))
        begin
          if ($unsigned((+(^reg40))))
            begin
              reg45 <= (^(8'haf));
              reg46 <= wire8;
            end
          else
            begin
              reg45 <= (~|reg45);
              reg46 <= $unsigned(wire17[(1'h1):(1'h0)]);
              reg47 <= $unsigned((!(($unsigned(wire16) ?
                  (wire7 != reg20) : wire7) < ($unsigned(wire11) && (~&reg21)))));
              reg48 <= (wire16 >>> $signed($unsigned(reg46)));
            end
          reg49 <= (&$unsigned((wire8 >>> (reg25[(1'h1):(1'h1)] & reg33[(4'ha):(1'h1)]))));
          reg50 <= (($signed((wire17 >> $signed(reg26))) < ($unsigned((reg23 ~^ (8'hae))) >> reg34)) ?
              $signed(reg26) : $signed(reg34));
          reg51 <= (8'hb9);
          reg52 <= (reg27 ? (~$unsigned((-(wire12 && (8'hb1))))) : (8'had));
        end
      else
        begin
          reg45 <= $signed($unsigned((^reg49[(3'h6):(3'h4)])));
          reg46 <= reg44[(2'h2):(2'h2)];
        end
      reg53 <= reg28;
      if ($signed(wire11[(2'h3):(1'h0)]))
        begin
          reg54 <= ({$unsigned($unsigned($unsigned(wire13))),
              $signed(($unsigned(reg33) ?
                  reg34 : reg50[(3'h4):(1'h1)]))} - wire11[(4'hf):(4'ha)]);
          reg55 <= wire5[(1'h0):(1'h0)];
          if ($unsigned(($unsigned(reg35) == $unsigned((~|$signed(wire17))))))
            begin
              reg56 <= (~^{$signed(($signed(wire13) ?
                      (reg53 ? (8'hbe) : (7'h41)) : (wire13 * reg37))),
                  (-(!$signed(reg51)))});
              reg57 <= {$unsigned(((|(reg33 ? reg46 : wire7)) ?
                      ({reg41} || ((8'hb3) ?
                          wire10 : reg37)) : (|((8'ha4) ~^ reg48)))),
                  $signed(((wire12 ? (reg28 ? (8'ha0) : (8'haa)) : reg45) ?
                      $unsigned((wire11 > reg51)) : ((reg42 ? reg35 : reg54) ?
                          reg43[(3'h6):(3'h6)] : $unsigned(reg35))))};
              reg58 <= (reg33 < wire15);
              reg59 <= ((~|((^~$signed(wire19)) ?
                  (!(~|reg50)) : (~|reg56))) >= {wire14, $unsigned(reg49)});
            end
          else
            begin
              reg56 <= wire9[(1'h0):(1'h0)];
              reg57 <= (wire11 ?
                  $unsigned({(~|(reg22 ?
                          reg25 : reg42))}) : (~^{$signed((-reg37))}));
              reg58 <= $signed((+wire13));
            end
          reg60 <= $unsigned(reg54[(2'h3):(2'h3)]);
        end
      else
        begin
          reg54 <= (wire11 ~^ wire7[(4'hd):(3'h4)]);
          reg55 <= (reg59 ?
              $signed($unsigned(({reg50} ?
                  $signed((7'h41)) : reg37))) : {reg36});
          reg56 <= (!(^~$signed($signed($signed(reg55)))));
          if ((~&wire12))
            begin
              reg57 <= (~^$unsigned((reg59[(4'he):(3'h4)] ?
                  (reg58[(4'hc):(3'h6)] ?
                      wire14[(5'h14):(1'h0)] : (reg25 ?
                          reg20 : wire13)) : $unsigned(wire13))));
              reg58 <= $signed(reg37[(1'h0):(1'h0)]);
              reg59 <= $signed((reg53[(4'h8):(4'h8)] != (~$signed((reg27 != reg33)))));
            end
          else
            begin
              reg57 <= {wire14[(4'h9):(2'h3)],
                  $signed(((~(|(8'hbf))) ?
                      ((reg52 ? (8'ha8) : wire5) ?
                          $signed(reg43) : $unsigned(reg56)) : (((8'ha8) >= reg39) ?
                          reg45[(3'h5):(3'h4)] : (wire5 != reg52))))};
              reg58 <= (reg33[(5'h11):(5'h11)] ?
                  (reg43[(2'h3):(2'h2)] ?
                      ($signed((wire6 ? (8'ha1) : reg40)) ?
                          (7'h42) : reg34) : $signed($signed(reg53))) : $unsigned(reg34[(4'h8):(3'h4)]));
              reg59 <= wire16;
              reg60 <= reg30[(1'h1):(1'h1)];
              reg61 <= ($signed($signed((8'hb3))) >>> $signed(wire8));
            end
        end
    end
  always
    @(posedge clk) begin
      reg62 <= {(&(&$unsigned(reg24)))};
    end
  module63 #() modinst87 (.clk(clk), .y(wire86), .wire64(wire8), .wire67(reg51), .wire65(reg58), .wire66(reg32));
  assign wire88 = reg55;
  assign wire89 = reg51;
  always
    @(posedge clk) begin
      reg90 <= (((reg57[(4'h8):(3'h5)] + ((+reg46) <= {(8'ha0)})) != wire8[(4'h8):(3'h6)]) ^~ reg24[(2'h3):(2'h2)]);
      reg91 <= $unsigned((|$signed((~^$unsigned(reg26)))));
      reg92 <= reg30;
      reg93 <= reg25[(2'h3):(2'h2)];
      if ($unsigned($unsigned((7'h43))))
        begin
          reg94 <= $signed((+reg21[(3'h4):(2'h2)]));
          reg95 <= $signed({wire11[(3'h4):(1'h0)],
              $signed(($signed(reg42) || reg48[(2'h3):(2'h2)]))});
          reg96 <= ($unsigned((((reg54 ~^ (8'ha6)) + $unsigned(reg95)) || $unsigned($signed((8'ha7))))) ?
              {reg92[(3'h7):(3'h5)], $signed((+(-reg21)))} : wire9);
        end
      else
        begin
          reg94 <= $unsigned($signed($signed($unsigned(reg47[(1'h1):(1'h1)]))));
        end
    end
endmodule

module module63
#(parameter param84 = ((^{{(~^(8'ha8)), ((8'ha7) ? (8'hbc) : (8'ha6))}}) ? {(({(8'hba)} > (~(8'hac))) ^~ (((8'ha1) ? (8'hac) : (8'h9c)) - (~&(8'haa))))} : (((|((8'hbf) >> (8'hbd))) || ((~^(7'h41)) ? (!(8'hb8)) : (~^(7'h43)))) ^~ (~|{((8'ha6) ^~ (8'hb5))}))), 
parameter param85 = {{param84}})
(y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire67;
  input wire signed [(3'h7):(1'h0)] wire66;
  input wire signed [(2'h3):(1'h0)] wire65;
  input wire signed [(4'h8):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire68 = wire65[(2'h3):(2'h2)];
  assign wire69 = (((|$signed($unsigned((8'hb1)))) ^ {({wire65} && {wire65}),
                      (8'hb9)}) + $signed({((wire68 ?
                          wire64 : wire66) <= wire65[(1'h1):(1'h1)]),
                      wire66[(2'h3):(1'h1)]}));
  assign wire70 = (-wire68);
  assign wire71 = ((&{((8'ha0) ? (wire65 || wire69) : (~|wire65)),
                      {{(8'h9e), wire66},
                          wire67[(2'h2):(2'h2)]}}) == (({((8'hb1) ?
                              wire65 : (8'hb8)),
                          wire66} ?
                      ($unsigned(wire65) ?
                          wire67 : ((7'h44) ?
                              wire68 : wire66)) : $unsigned(wire67)) <= $unsigned(((wire66 ?
                      (8'hb6) : (8'haf)) * {wire69, (8'haa)}))));
  assign wire72 = wire68[(4'he):(3'h4)];
  always
    @(posedge clk) begin
      reg73 <= (((~wire67[(2'h3):(2'h2)]) > ({(wire66 * wire70)} ?
          $unsigned({wire71}) : $signed(wire68[(4'h9):(1'h0)]))) << wire66[(2'h3):(2'h2)]);
      if ((~|(~&($unsigned((wire67 - wire71)) ?
          ($signed(wire64) | $signed(wire65)) : wire72))))
        begin
          reg74 <= wire67;
          reg75 <= (wire64 ~^ wire71[(3'h7):(2'h3)]);
        end
      else
        begin
          reg74 <= wire66[(3'h4):(2'h2)];
          reg75 <= (+(($signed((wire70 == wire69)) ?
              wire66[(1'h0):(1'h0)] : wire69) - $unsigned({wire67,
              (wire69 ? wire65 : reg75)})));
          reg76 <= reg75;
        end
      reg77 <= {$signed($signed($unsigned(wire65)))};
      reg78 <= ($signed(reg74) ?
          {(!wire64), wire71[(5'h10):(3'h4)]} : $signed((8'ha3)));
    end
  assign wire79 = ($unsigned((reg75[(2'h3):(1'h0)] ?
                          ($signed(reg73) < reg75[(1'h0):(1'h0)]) : {(+wire65)})) ?
                      $signed({$signed(reg78)}) : reg73);
  assign wire80 = (^((reg75 ?
                          ((~|wire79) ?
                              {wire79,
                                  reg74} : wire71[(3'h5):(3'h5)]) : $unsigned((~^wire70))) ?
                      wire79[(2'h3):(1'h0)] : $unsigned($unsigned(reg73[(2'h2):(1'h0)]))));
  assign wire81 = $signed($unsigned(wire71));
  assign wire82 = $unsigned($unsigned(reg74[(5'h10):(4'hf)]));
  assign wire83 = $unsigned(((|(~&$unsigned(wire82))) < {((~&wire80) ?
                          wire69 : (wire80 * wire70))}));
endmodule
