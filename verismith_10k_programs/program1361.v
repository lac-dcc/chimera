module top
#(parameter param177 = (({{(8'hb7), ((7'h40) || (8'hbb))}} >> ((((7'h42) ? (8'h9c) : (8'hb7)) >= {(8'hb0), (8'hb4)}) ? {(~&(8'hb8)), ((8'ha1) ? (8'haf) : (8'hb1))} : ({(8'ha3)} ? (-(8'ha3)) : (~|(8'hac))))) ? {(^((-(8'ha6)) <<< (~|(8'ha0)))), (-((~^(8'hb3)) ? {(8'hbc), (8'h9c)} : ((8'h9d) > (8'h9e))))} : {({((7'h41) >= (8'ha6))} ? (((8'haf) ^ (7'h41)) == {(8'hb6)}) : ((|(8'hba)) && {(8'haf)}))}), 
parameter param178 = ({((~^(param177 ? param177 : param177)) ? param177 : (~|(param177 >> param177)))} ? ((8'h9e) ? (param177 - param177) : (-param177)) : ((((param177 <= param177) ? (param177 ? param177 : param177) : {param177, param177}) > ((^~(8'hae)) ? (8'ha6) : (|param177))) >= param177)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire176;
  wire [(4'hb):(1'h0)] wire174;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire176,
                 wire174,
                 wire18,
                 wire17,
                 wire16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (~|$unsigned($signed($signed(wire4))));
      reg6 <= wire2[(3'h6):(2'h2)];
      reg7 <= wire0;
      if ((^((&($signed((7'h40)) ? reg6[(1'h0):(1'h0)] : $unsigned(wire1))) ?
          reg7 : (reg5 ? $unsigned((wire2 ^~ wire2)) : wire4[(3'h4):(2'h3)]))))
        begin
          reg8 <= $signed(wire0);
        end
      else
        begin
          reg8 <= $unsigned((wire2[(1'h1):(1'h0)] ?
              {(wire4 ?
                      ((8'had) >>> wire2) : reg8[(3'h6):(1'h1)])} : ($signed((|wire4)) > $signed((wire0 ?
                  (8'h9e) : wire1)))));
        end
      if (wire0)
        begin
          reg9 <= $unsigned((reg6 ?
              wire0[(5'h13):(5'h10)] : (((~|wire4) ?
                  (-reg6) : wire3) >>> reg5)));
          reg10 <= $signed({$signed({reg8[(5'h14):(5'h11)]}),
              (($signed(wire4) ? reg6[(2'h2):(1'h1)] : reg6[(2'h2):(1'h1)]) ?
                  reg6 : ((reg8 >>> reg7) <= (wire4 ? wire0 : wire4)))});
        end
      else
        begin
          reg9 <= ((wire0 | $signed(reg7[(4'hd):(3'h4)])) ?
              reg10 : $signed(((~^(~^wire0)) ?
                  ($signed(reg10) <<< (reg8 ?
                      (8'hb1) : reg5)) : (^~(&wire4)))));
          if (reg8[(4'hb):(3'h7)])
            begin
              reg10 <= reg6;
              reg11 <= reg9[(1'h1):(1'h0)];
              reg12 <= wire2;
              reg13 <= {$signed(reg6[(1'h1):(1'h1)]),
                  ($signed((^~(reg9 >> wire1))) + reg12)};
            end
          else
            begin
              reg10 <= $signed($signed($signed(((+wire2) >>> (reg7 ?
                  (8'hae) : reg12)))));
              reg11 <= {((8'hb9) > (|$unsigned((reg11 ? (8'h9e) : reg9)))),
                  (($signed((-reg8)) ^~ reg8) + {(8'ha5),
                      $unsigned((reg8 | reg8))})};
            end
          reg14 <= {reg13,
              ($unsigned((reg8 ? (reg13 & reg8) : (reg8 ? wire1 : wire3))) ?
                  $signed($signed($unsigned(reg8))) : (((8'ha0) ?
                          (reg8 ? reg13 : wire3) : ((8'h9d) <= (8'ha7))) ?
                      (8'ha9) : (~^(wire3 << (8'hb1)))))};
          reg15 <= (wire2 - $unsigned($unsigned(((8'hb1) ?
              $signed(reg8) : $unsigned(reg14)))));
        end
    end
  assign wire16 = reg9[(3'h4):(2'h3)];
  assign wire17 = wire16;
  assign wire18 = (wire0 || wire4[(4'ha):(4'h8)]);
  module19 #() modinst175 (.wire21(reg6), .clk(clk), .y(wire174), .wire20(reg12), .wire23(reg15), .wire22(reg5));
  assign wire176 = (~({$unsigned($signed(reg12)),
                       reg8[(5'h11):(4'ha)]} <= reg6[(4'ha):(3'h5)]));
endmodule

module module19
#(parameter param173 = (~|(^~((((7'h44) > (8'hb2)) ? ((8'hba) ? (8'hb8) : (8'ha9)) : (~(8'hba))) ? (&((8'hb9) ? (8'ha1) : (7'h40))) : ({(7'h44)} <<< (~^(7'h44)))))))
(y, clk, wire20, wire21, wire22, wire23);
  output wire [(32'h231):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire22;
  input wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire124;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire126;
  wire signed [(3'h6):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire171;
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg152 = (1'h0);
  assign y = {wire124,
                 wire24,
                 wire25,
                 wire26,
                 wire31,
                 wire32,
                 wire88,
                 wire126,
                 wire127,
                 wire128,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire171,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 (1'h0)};
  assign wire24 = ($signed((wire23[(2'h3):(1'h1)] ?
                      (wire23[(3'h5):(2'h3)] ?
                          $signed(wire21) : wire21) : wire22[(2'h2):(2'h2)])) <<< wire23[(2'h3):(2'h3)]);
  assign wire25 = ($signed(wire24[(4'hd):(4'h8)]) ?
                      $signed($unsigned(wire22[(2'h3):(1'h1)])) : $unsigned(wire20[(4'ha):(2'h2)]));
  assign wire26 = ({{wire21}} ^~ (^$signed((~^(wire21 ? (8'hbd) : wire20)))));
  always
    @(posedge clk) begin
      reg27 <= (^~$signed(((&(wire21 ?
          wire26 : wire20)) <<< ($unsigned(wire26) ?
          $unsigned(wire22) : (^wire20)))));
      reg28 <= (($signed($unsigned(wire24)) >= $signed($signed(wire26))) ^~ wire22);
      reg29 <= $signed((~|(&wire23[(3'h5):(2'h3)])));
      reg30 <= ($unsigned({wire20}) & wire24);
    end
  assign wire31 = $unsigned($signed(wire24));
  assign wire32 = $unsigned((wire20 ?
                      wire25 : (((wire21 ? (8'ha1) : reg27) ?
                              (~|(8'hae)) : (reg30 <<< reg28)) ?
                          reg27[(2'h2):(1'h0)] : {reg30[(2'h2):(2'h2)],
                              reg27})));
  always
    @(posedge clk) begin
      if (wire31)
        begin
          reg33 <= reg29;
        end
      else
        begin
          reg33 <= $unsigned({(((wire20 << wire26) >= $signed(reg29)) <= wire20[(3'h7):(1'h1)]),
              {((reg29 ? wire24 : wire23) ? wire22[(3'h4):(1'h0)] : reg33),
                  (reg33 << $unsigned(wire26))}});
          reg34 <= (!(~(^~wire32)));
          if ((&reg34[(4'h8):(3'h6)]))
            begin
              reg35 <= $unsigned(({$signed($signed(wire26)),
                      {$signed(wire24)}} ?
                  ((wire26 ?
                      (reg34 || wire25) : $unsigned(reg33)) >>> reg33) : $unsigned($signed(wire26[(1'h1):(1'h0)]))));
              reg36 <= $unsigned($unsigned($unsigned(((reg27 && wire24) << $unsigned(reg34)))));
              reg37 <= (~(reg34[(4'hb):(1'h1)] ?
                  ($signed($signed(reg36)) <= {(!wire20)}) : $signed(reg27[(2'h2):(1'h0)])));
            end
          else
            begin
              reg35 <= $unsigned((wire22 >= (8'hbd)));
              reg36 <= $unsigned((+(8'hb9)));
              reg37 <= (8'hab);
            end
        end
    end
  module38 #() modinst89 (.clk(clk), .wire42(reg34), .wire41(wire23), .wire40(wire24), .y(wire88), .wire39(wire20));
  module90 #() modinst125 (wire124, clk, wire21, reg28, wire24, wire31);
  assign wire126 = ($unsigned((((reg28 ? (8'hac) : wire20) ?
                           (8'hb6) : $signed(wire32)) && $signed((wire124 - reg33)))) ?
                       $signed(reg33) : (|$unsigned(wire20[(1'h1):(1'h1)])));
  assign wire127 = (~$unsigned(({wire25[(4'hf):(1'h0)]} == reg33)));
  assign wire128 = (~(((reg35 != wire32) > reg35[(4'hb):(4'hb)]) >= (!$unsigned(wire22))));
  always
    @(posedge clk) begin
      reg129 <= $unsigned((reg34[(4'hd):(4'h8)] ?
          (^wire22[(3'h6):(1'h0)]) : reg27[(1'h0):(1'h0)]));
      reg130 <= (8'ha4);
      reg131 <= (~($signed(reg37[(1'h0):(1'h0)]) ?
          ((reg36 < (wire26 ? wire20 : wire31)) ?
              wire31 : ((+wire127) ?
                  $signed(wire25) : (~&reg130))) : (reg28[(2'h3):(1'h0)] ?
              wire20 : wire126[(2'h3):(2'h3)])));
      reg132 <= wire128;
    end
  assign wire133 = $signed($unsigned($unsigned((8'hb7))));
  assign wire134 = {$unsigned((~&($unsigned(wire32) <<< (~^wire21)))),
                       ((($unsigned(wire31) << ((8'hab) ? reg131 : wire31)) ?
                           (8'hbe) : {$unsigned(wire126),
                               $unsigned(reg33)}) && (reg129[(4'h8):(2'h2)] && ((|(8'hbe)) << (8'hac))))};
  assign wire135 = reg35;
  assign wire136 = (wire21 << $unsigned((~^wire134)));
  always
    @(posedge clk) begin
      reg137 <= wire135;
      reg138 <= reg132;
      reg139 <= $signed(wire136[(2'h3):(2'h2)]);
      if ($unsigned(reg131[(1'h0):(1'h0)]))
        begin
          reg140 <= $unsigned((~&($unsigned($unsigned(reg34)) ?
              wire88 : reg37[(4'hb):(3'h6)])));
          reg141 <= wire23[(2'h2):(1'h1)];
          if (reg33)
            begin
              reg142 <= (-{wire20[(4'hf):(4'hc)]});
              reg143 <= $unsigned(reg132);
              reg144 <= ($signed((&$signed((|wire21)))) == $unsigned($signed(((~^reg33) << {wire24,
                  (8'h9c)}))));
            end
          else
            begin
              reg142 <= wire23;
              reg143 <= reg33;
              reg144 <= $signed(reg132);
              reg145 <= $unsigned(wire31);
              reg146 <= (~^(~{reg37, $signed($unsigned(reg28))}));
            end
          reg147 <= {$unsigned((reg139 ? wire88 : reg142[(4'hf):(3'h5)])),
              (reg33[(2'h3):(2'h3)] ? reg129 : reg131)};
          if ((wire22 | $signed((wire20[(2'h3):(1'h1)] ?
              $signed(wire25[(3'h7):(2'h2)]) : reg147[(2'h2):(1'h1)]))))
            begin
              reg148 <= $signed(wire20[(4'ha):(2'h3)]);
              reg149 <= $signed($signed($unsigned((~(wire22 ?
                  wire88 : wire126)))));
              reg150 <= ($unsigned({$unsigned(reg138),
                  (^~$signed(reg145))}) && $unsigned(wire25[(2'h2):(1'h0)]));
              reg151 <= (reg36 >>> (~&(~^($unsigned(wire88) ^~ $unsigned(wire133)))));
              reg152 <= $unsigned({{$signed(wire23[(1'h1):(1'h1)])}});
            end
          else
            begin
              reg148 <= wire23[(1'h0):(1'h0)];
              reg149 <= (reg144[(5'h11):(2'h3)] - $signed($unsigned($signed((!reg144)))));
            end
        end
      else
        begin
          reg140 <= {wire136};
          if ({wire31[(3'h6):(2'h2)]})
            begin
              reg141 <= (+(~&{wire31}));
              reg142 <= ((~((8'h9e) < wire21)) ?
                  $unsigned((^$signed(reg28))) : (reg150[(4'h9):(2'h3)] || ((wire26[(3'h5):(3'h4)] <<< wire128[(2'h3):(2'h2)]) ?
                      ((wire133 ? reg129 : wire126) ?
                          wire24[(4'hd):(4'hb)] : (|reg129)) : wire32[(3'h5):(1'h0)])));
            end
          else
            begin
              reg141 <= {({((reg140 > reg129) + (~reg131)),
                      {(wire26 ? wire127 : reg140),
                          reg147}} > $signed((!$unsigned(reg152)))),
                  (~&(($unsigned(wire26) - wire127) >>> ((reg147 ?
                      reg138 : reg142) > reg130)))};
              reg142 <= reg37[(4'hb):(3'h4)];
              reg143 <= {reg35[(5'h10):(4'h9)]};
              reg144 <= reg145;
            end
          reg145 <= reg150[(1'h1):(1'h0)];
        end
    end
  module153 #() modinst172 (.wire156(reg145), .wire155(wire128), .wire157(reg130), .clk(clk), .wire154(reg132), .y(wire171));
endmodule

module module153
#(parameter param169 = ((8'hbf) ? (((((8'hb0) ? (8'had) : (7'h43)) <= ((7'h40) ? (8'hae) : (8'haa))) ? (((8'ha5) ? (8'ha3) : (8'ha2)) || ((8'ha5) <= (7'h41))) : ({(8'hb7), (8'h9e)} ? {(8'h9d)} : (~|(8'hac)))) ? ({(|(8'hac))} < ((~&(8'hb0)) || ((8'ha4) ? (8'hb4) : (8'hb1)))) : (~((8'hb8) ? ((8'hbb) < (8'ha8)) : {(8'hba), (8'ha6)}))) : ({(~&((8'ha1) >= (8'ha1)))} >>> {(+(8'hac))})), 
parameter param170 = (~^((|((param169 ? param169 : param169) != (param169 ? param169 : (8'hb8)))) ^ (param169 <= {param169}))))
(y, clk, wire157, wire156, wire155, wire154);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire157;
  input wire [(5'h10):(1'h0)] wire156;
  input wire signed [(4'h8):(1'h0)] wire155;
  input wire [(5'h14):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire165;
  wire signed [(5'h14):(1'h0)] wire164;
  wire signed [(5'h11):(1'h0)] wire163;
  wire signed [(4'hf):(1'h0)] wire162;
  wire signed [(3'h4):(1'h0)] wire161;
  wire signed [(2'h3):(1'h0)] wire160;
  wire [(3'h7):(1'h0)] wire159;
  wire [(3'h7):(1'h0)] wire158;
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg166 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 reg168,
                 reg167,
                 reg166,
                 (1'h0)};
  assign wire158 = $signed(wire154[(1'h1):(1'h0)]);
  assign wire159 = wire156;
  assign wire160 = ($signed($signed({$unsigned(wire159)})) ?
                       (($unsigned($signed(wire157)) + $signed($unsigned(wire154))) >> wire156[(1'h1):(1'h1)]) : (((+wire159) >= $signed(wire157[(2'h2):(1'h0)])) ?
                           $unsigned($signed($signed(wire157))) : $unsigned($unsigned(wire154))));
  assign wire161 = $unsigned($signed((8'hbf)));
  assign wire162 = wire159[(3'h5):(1'h1)];
  assign wire163 = $signed((wire154[(5'h13):(5'h12)] + $signed((8'hb0))));
  assign wire164 = $unsigned($signed(wire156));
  assign wire165 = ((wire162 ?
                       $signed($signed((&wire159))) : wire156[(1'h1):(1'h0)]) < wire159[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg166 <= (|$unsigned(wire164));
      reg167 <= ((~((~|(wire163 != wire157)) ?
              ($unsigned(wire161) * (wire165 >>> wire154)) : wire165)) ?
          $unsigned(reg166) : wire157);
      reg168 <= reg167;
    end
endmodule

module module90
#(parameter param123 = (~((^~(&((8'hae) == (8'ha7)))) ? (~^{(~|(8'h9f))}) : (8'hb1))))
(y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire94;
  input wire [(5'h11):(1'h0)] wire93;
  input wire [(2'h2):(1'h0)] wire92;
  input wire [(3'h7):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire95;
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire95 = $signed(wire92);
  assign wire96 = (^~$unsigned((|wire91)));
  assign wire97 = (^$signed((7'h42)));
  assign wire98 = $unsigned(($unsigned((~wire94)) == $signed($signed((wire94 ?
                      wire94 : (8'h9c))))));
  assign wire99 = $unsigned($signed(wire91[(3'h5):(2'h2)]));
  assign wire100 = wire91;
  always
    @(posedge clk) begin
      reg101 <= (($signed(wire99[(1'h1):(1'h1)]) + (7'h44)) ?
          ((8'hbe) ?
              (!($unsigned(wire92) > $signed(wire92))) : $signed($signed((wire93 ?
                  wire92 : (8'ha2))))) : ($signed(wire92[(2'h2):(2'h2)]) << wire94[(3'h5):(1'h1)]));
      reg102 <= $unsigned(wire100[(4'he):(1'h1)]);
      if ((~reg101))
        begin
          if (wire98[(4'h9):(4'h8)])
            begin
              reg103 <= ((|(wire93[(4'h8):(4'h8)] == (!$unsigned((8'hb3))))) ?
                  $unsigned($signed($signed(wire92[(2'h2):(1'h0)]))) : (wire97 ^ (|wire94)));
            end
          else
            begin
              reg103 <= ($unsigned(wire100[(3'h6):(3'h6)]) < $unsigned($unsigned(wire91[(3'h4):(1'h0)])));
              reg104 <= wire91;
              reg105 <= reg101[(3'h5):(1'h1)];
              reg106 <= {reg104,
                  ($signed(reg105[(3'h4):(3'h4)]) ?
                      {$signed($unsigned(reg101)),
                          reg103[(4'hb):(4'h9)]} : $unsigned($unsigned($unsigned(wire93))))};
            end
        end
      else
        begin
          reg103 <= $signed($signed(wire93[(4'hb):(2'h2)]));
          reg104 <= (wire98[(3'h5):(2'h2)] <<< ((8'hae) > $signed((wire97 <<< {wire95,
              (8'hbf)}))));
          if ((reg101 ? $signed(reg103[(4'hb):(3'h5)]) : (8'hb1)))
            begin
              reg105 <= $signed((|($unsigned($unsigned(wire98)) <<< (wire96 ?
                  {(8'hb0), reg106} : $signed((8'hb0))))));
              reg106 <= reg103[(1'h0):(1'h0)];
            end
          else
            begin
              reg105 <= (wire99[(4'hb):(4'h8)] <= $unsigned($signed($unsigned((wire100 ?
                  wire91 : reg104)))));
              reg106 <= wire97;
            end
        end
    end
  assign wire107 = (wire92[(2'h2):(1'h1)] * $signed({wire96[(3'h7):(2'h3)],
                       ((reg103 >> reg105) ? $signed(wire91) : wire93)}));
  assign wire108 = $signed(wire95);
  assign wire109 = (+wire100);
  assign wire110 = $signed((^(reg101[(1'h0):(1'h0)] != wire93)));
  always
    @(posedge clk) begin
      reg111 <= (wire109[(4'ha):(2'h2)] + reg105[(2'h3):(1'h1)]);
      if ((^~$unsigned(wire91[(3'h7):(3'h4)])))
        begin
          reg112 <= reg102;
          if (((8'ha7) ?
              (-(reg105[(2'h3):(1'h0)] ?
                  (~$signed(wire98)) : ((wire94 - wire92) ?
                      (wire92 ?
                          reg103 : reg106) : {(8'ha7)}))) : wire96[(4'hc):(2'h2)]))
            begin
              reg113 <= (&wire91[(3'h5):(3'h4)]);
              reg114 <= {$signed(wire95)};
              reg115 <= wire109;
            end
          else
            begin
              reg113 <= (reg111 == (($unsigned($unsigned(wire110)) ?
                  $unsigned($unsigned(reg113)) : $signed($unsigned(wire92))) ^ $signed(reg111[(4'he):(3'h6)])));
              reg114 <= reg115[(1'h1):(1'h1)];
            end
          if (({{$signed((wire108 ? wire91 : (8'hb9)))},
              (reg104 > (^$signed((8'hb4))))} > $signed({reg101})))
            begin
              reg116 <= {$unsigned((((wire110 ? reg103 : wire100) ?
                      (wire97 >> reg115) : $signed(wire109)) && wire98))};
              reg117 <= (reg106 ?
                  ((!reg105) ?
                      reg116 : reg101) : {$unsigned((~&$signed(wire98))),
                      wire96[(3'h5):(1'h0)]});
              reg118 <= (^~(reg111 ?
                  (({reg102, wire94} && $unsigned(reg102)) ?
                      wire107 : (wire98 ~^ wire98)) : $unsigned(wire98[(3'h5):(3'h4)])));
              reg119 <= wire109;
              reg120 <= reg115[(1'h1):(1'h0)];
            end
          else
            begin
              reg116 <= $unsigned($signed($signed((wire108[(3'h4):(2'h3)] <= $signed(reg120)))));
              reg117 <= reg115[(1'h0):(1'h0)];
              reg118 <= wire97;
            end
        end
      else
        begin
          reg112 <= ($unsigned((~((|reg120) | wire107))) ?
              {wire97,
                  ((((8'ha9) ? wire97 : (8'hb8)) ?
                          (reg102 >= reg119) : $unsigned(wire93)) ?
                      (!(reg112 ?
                          wire98 : wire97)) : $signed($signed((8'hae))))} : wire108[(4'h8):(3'h6)]);
          reg113 <= $unsigned((reg104 ?
              (wire94 ?
                  $signed({wire110}) : {wire98[(2'h3):(1'h1)],
                      reg103[(4'hf):(4'hd)]}) : (~^(!{(7'h42), reg101}))));
          reg114 <= $signed(((~(|(reg120 & reg113))) ^ (wire91[(2'h2):(1'h1)] * ($signed(reg116) == $signed((8'hb8))))));
          reg115 <= ((-$signed((~(wire109 <<< wire110)))) * $signed(($unsigned((wire107 ?
              wire94 : wire108)) >>> $signed(wire95[(2'h2):(1'h0)]))));
        end
      reg121 <= (8'h9d);
      reg122 <= reg111[(4'hd):(4'ha)];
    end
endmodule

module module38
#(parameter param87 = (((-(~|((8'hab) ? (8'haa) : (8'hb3)))) ~^ {(~((8'haf) ? (8'ha6) : (8'ha9))), (((8'h9c) & (7'h42)) ? ((8'hb7) ? (8'hbe) : (8'hbc)) : (~&(7'h44)))}) ? (&(~(((7'h42) >= (7'h40)) ? {(7'h43), (8'hbf)} : (!(8'h9c))))) : (~&(^(&(~^(8'h9c)))))))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire42;
  input wire signed [(3'h7):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire40;
  input wire [(4'h8):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire64,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg83,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((&(wire42[(5'h14):(4'hd)] > wire41[(1'h0):(1'h0)])))
        begin
          reg43 <= (($unsigned({(wire39 ?
                      wire39 : wire41)}) >= $unsigned((|wire42[(2'h2):(1'h0)]))) ?
              ({(((7'h43) <= (7'h41)) > ((8'ha8) ? wire42 : (8'hb0))),
                  ((~wire41) ?
                      ((7'h42) ?
                          wire40 : wire39) : (~wire39))} ~^ {$signed((!wire41)),
                  ($unsigned(wire42) ?
                      $signed(wire41) : (wire39 ? wire40 : wire42))}) : wire41);
          reg44 <= $signed(reg43);
          reg45 <= wire39;
          if ((7'h43))
            begin
              reg46 <= $signed(((reg44[(2'h2):(1'h1)] ?
                      {wire42, (reg45 + wire39)} : $signed({wire41, wire40})) ?
                  (&((wire41 ? reg44 : (8'h9d)) ?
                      reg45[(3'h6):(1'h0)] : reg43[(2'h3):(2'h3)])) : $unsigned(reg43)));
              reg47 <= {({(|$unsigned((7'h41)))} ?
                      $signed(reg44[(1'h0):(1'h0)]) : {(^(+wire41))})};
            end
          else
            begin
              reg46 <= wire40[(2'h2):(2'h2)];
              reg47 <= ({{wire42},
                  $unsigned((~&(+reg46)))} ~^ (((reg45[(2'h3):(1'h0)] <= {reg43}) ?
                      {(~&reg46)} : ($unsigned(reg47) ?
                          (7'h43) : $unsigned(wire41))) ?
                  (|((wire40 ? reg44 : (8'hb3)) ?
                      wire42[(5'h13):(4'h9)] : (~&wire42))) : $unsigned($signed($unsigned(wire42)))));
            end
          reg48 <= ({wire40[(3'h4):(2'h2)],
              ((&(reg46 ? reg46 : (8'ha7))) ?
                  {(+(8'hb2)),
                      $unsigned(reg47)} : (((8'hac) << (7'h42)) >= (wire42 ?
                      reg44 : reg43)))} >>> (($unsigned($unsigned(reg45)) <= $unsigned(wire39[(3'h6):(3'h5)])) ^ reg44[(2'h2):(2'h2)]));
        end
      else
        begin
          reg43 <= {$signed($unsigned((~|reg46)))};
          reg44 <= (({reg48[(4'h9):(3'h4)]} >>> $signed($unsigned((reg46 ^~ wire41)))) || $signed((({reg44} ^~ (reg48 ?
                  reg45 : wire41)) ?
              reg47 : $unsigned((reg43 ? reg44 : reg46)))));
          reg45 <= (!$signed(reg47[(1'h0):(1'h0)]));
          reg46 <= (-$signed($signed($signed((reg46 ? wire40 : wire42)))));
        end
      reg49 <= ((!{$signed((wire39 ? wire41 : wire41))}) ?
          (((~^wire42) >>> (wire41 & (reg45 ? reg47 : reg47))) ?
              ((-(reg47 <= reg47)) ^ $signed(((8'h9c) ?
                  reg47 : reg46))) : $unsigned(($unsigned(reg46) & reg45))) : (~|{$signed((reg46 || wire42))}));
    end
  assign wire50 = $unsigned($unsigned($signed((reg44[(1'h1):(1'h0)] ?
                      (^~reg43) : reg47))));
  assign wire51 = {wire42[(1'h0):(1'h0)]};
  assign wire52 = $unsigned((~|$signed($unsigned(wire39[(3'h4):(2'h2)]))));
  assign wire53 = $signed(wire41[(2'h2):(1'h1)]);
  assign wire54 = wire53[(1'h0):(1'h0)];
  assign wire55 = $unsigned($unsigned($signed((^wire42[(4'ha):(2'h2)]))));
  assign wire56 = $unsigned(wire51[(4'h9):(4'h9)]);
  always
    @(posedge clk) begin
      reg57 <= (wire53[(2'h2):(1'h1)] ?
          (-{(reg47 ?
                  (wire39 >> wire53) : (^~wire54))}) : wire51[(3'h4):(2'h3)]);
      reg58 <= reg45[(3'h5):(2'h3)];
      if ($unsigned((~^$unsigned(($signed(wire54) & (~|reg43))))))
        begin
          reg59 <= $unsigned(wire39[(3'h4):(2'h2)]);
        end
      else
        begin
          reg59 <= ($signed((!reg57[(5'h13):(4'h8)])) ? wire52 : wire51);
          reg60 <= {$unsigned((~(-wire56)))};
          reg61 <= $signed({((+(reg44 ? wire50 : wire39)) <= $unsigned((wire50 ?
                  wire55 : reg46)))});
          reg62 <= (reg45[(3'h5):(3'h5)] ?
              (~(!$signed((^reg49)))) : reg46[(1'h0):(1'h0)]);
        end
      reg63 <= $unsigned(reg62[(3'h5):(2'h2)]);
    end
  assign wire64 = wire52[(4'hb):(3'h4)];
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((|$unsigned($signed(wire54))))))
        begin
          reg65 <= {reg62, (&wire53[(2'h2):(1'h1)])};
          if ((!((wire51[(4'ha):(4'ha)] ?
              ($signed((8'h9f)) >> ((8'haa) >> (8'hbc))) : (wire55 ?
                  (reg63 + reg58) : wire50[(2'h2):(1'h1)])) ^ reg62)))
            begin
              reg66 <= $unsigned((7'h42));
              reg67 <= reg65[(3'h5):(3'h4)];
              reg68 <= (($unsigned(wire41) == wire40) ?
                  ((|reg65[(3'h4):(2'h2)]) && wire42[(3'h7):(1'h0)]) : $signed((!reg46[(2'h2):(1'h1)])));
              reg69 <= reg43[(1'h1):(1'h0)];
              reg70 <= $unsigned($signed(($signed($unsigned(wire54)) ?
                  ((~^wire54) != (reg58 ?
                      reg59 : reg59)) : wire42[(1'h0):(1'h0)])));
            end
          else
            begin
              reg66 <= ($signed(((|{reg47, reg49}) >> (-reg45))) ?
                  {$signed(({reg45, reg70} ?
                          reg49 : (8'ha0)))} : (~&$signed(((wire53 >> reg63) ?
                      {reg68} : reg58[(3'h7):(1'h1)]))));
            end
        end
      else
        begin
          reg65 <= (^reg46[(2'h3):(2'h2)]);
          reg66 <= (wire56 ?
              $signed($signed(((^reg47) ?
                  reg57 : (reg60 ? reg70 : wire42)))) : {(8'hb0)});
          reg67 <= ((wire50 <<< ((reg68[(1'h0):(1'h0)] ?
                  wire40[(2'h3):(2'h3)] : $signed(wire64)) * $unsigned(reg61))) ?
              (wire55[(3'h7):(2'h2)] ?
                  wire56 : wire52[(4'h8):(4'h8)]) : ($signed(reg48[(3'h5):(1'h0)]) ?
                  $signed((reg59[(2'h3):(2'h2)] <<< (reg67 ?
                      reg48 : wire55))) : reg65[(1'h1):(1'h0)]));
          reg68 <= reg48;
          reg69 <= $signed({(({wire42} ?
                  wire51 : $signed(wire56)) ^ $unsigned({reg61}))});
        end
      if (wire54)
        begin
          reg71 <= {(8'hbf)};
          reg72 <= {($signed((|reg44[(2'h2):(1'h1)])) ?
                  (reg49[(2'h3):(2'h2)] ?
                      (-$unsigned(reg65)) : (~|(reg70 ?
                          reg57 : reg47))) : $signed({$signed(reg45),
                      (|wire55)}))};
          reg73 <= (reg57 ? reg57[(4'h9):(2'h2)] : {reg47});
          reg74 <= {((~&$unsigned($signed((8'hab)))) != $signed(wire64[(2'h2):(2'h2)])),
              wire55[(3'h7):(2'h2)]};
        end
      else
        begin
          reg71 <= (((-reg45) > ((((8'hb9) + reg69) << $signed((8'hb8))) ~^ $unsigned(((8'hb5) ?
              reg66 : (8'hbb))))) == reg66[(1'h0):(1'h0)]);
          reg72 <= $unsigned({reg62[(3'h5):(1'h0)], reg74[(4'hf):(2'h3)]});
          if ((reg74 ?
              $signed((reg74[(4'hf):(4'he)] ?
                  reg68 : $unsigned((reg68 <<< reg43)))) : $unsigned($unsigned($unsigned({reg48,
                  reg74})))))
            begin
              reg73 <= $unsigned(wire51[(4'h9):(2'h2)]);
            end
          else
            begin
              reg73 <= reg43[(4'hb):(4'h9)];
              reg74 <= (^($signed(((wire39 ?
                  reg68 : reg62) | (|reg71))) <= ($signed((wire64 | reg43)) * ((-wire64) ?
                  (reg58 * wire52) : (-reg65)))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg75 <= (8'hbd);
      reg76 <= ((~^$signed((+reg47[(1'h0):(1'h0)]))) ?
          (wire41[(3'h7):(2'h3)] & {(|wire56[(3'h4):(2'h3)]),
              $signed(reg49)}) : wire42);
    end
  assign wire77 = $unsigned(reg46);
  assign wire78 = wire56[(3'h5):(1'h0)];
  assign wire79 = $signed($signed(reg60));
  assign wire80 = ($unsigned(wire42) ? (8'hb8) : reg72[(2'h2):(1'h1)]);
  assign wire81 = {({wire79[(2'h2):(2'h2)]} ?
                          (reg63 >= $signed($unsigned(wire54))) : (reg47[(2'h2):(1'h1)] < (~^{reg75,
                              reg66}))),
                      ({$unsigned((8'ha1)), $unsigned((reg65 * reg47))} ?
                          $signed($signed($signed(wire41))) : $unsigned(wire53))};
  assign wire82 = (~reg73[(4'h9):(4'h9)]);
  always
    @(posedge clk) begin
      reg83 <= wire40;
    end
  assign wire84 = {$unsigned($signed(((+wire54) - (^wire42)))),
                      wire81[(4'hf):(2'h2)]};
  assign wire85 = {((7'h44) ?
                          $signed(reg83[(4'hb):(3'h7)]) : $signed((+$unsigned((8'ha7))))),
                      (&(($signed(wire80) ? wire39 : (-(8'h9d))) ?
                          $signed((wire39 == wire54)) : (^$signed(reg69))))};
  assign wire86 = $signed(reg65[(2'h3):(2'h3)]);
endmodule
