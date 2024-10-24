module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire168;
  wire signed [(2'h3):(1'h0)] wire167;
  wire [(4'hf):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire164;
  wire [(3'h4):(1'h0)] wire163;
  wire signed [(4'he):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire161;
  wire signed [(4'hc):(1'h0)] wire160;
  wire signed [(3'h6):(1'h0)] wire159;
  wire signed [(2'h2):(1'h0)] wire158;
  wire signed [(4'h8):(1'h0)] wire157;
  wire [(2'h3):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire [(2'h3):(1'h0)] wire154;
  wire signed [(4'ha):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire120;
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg151 = (1'h0);
  reg [(3'h5):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(3'h4):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg [(3'h6):(1'h0)] reg123 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire134,
                 wire122,
                 wire120,
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
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  module4 #() modinst121 (.wire5(wire0), .y(wire120), .clk(clk), .wire7(wire2), .wire8(wire1), .wire6(wire3));
  assign wire122 = wire120[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg123 <= ((wire3[(5'h10):(4'hc)] ? wire122[(5'h10):(3'h5)] : wire122) ?
          ((&wire120[(2'h2):(2'h2)]) == wire2[(1'h0):(1'h0)]) : ($unsigned(((~(8'had)) == (wire0 ?
                  (8'hac) : wire2))) ?
              ($unsigned($unsigned(wire120)) >> $signed(wire3[(5'h12):(4'hc)])) : ((wire3 ?
                  (wire3 ? wire3 : wire120) : $unsigned(wire1)) >= (^(wire120 ?
                  wire1 : wire1)))));
      reg124 <= $signed($unsigned(wire122[(2'h2):(1'h1)]));
      reg125 <= reg124;
      if ({$signed((|(8'hb8)))})
        begin
          reg126 <= ((((|$signed(wire122)) ^ (wire122[(4'h9):(2'h2)] ?
                  ((8'h9e) ?
                      reg125 : wire0) : $signed(wire1))) * $unsigned($signed({(8'ha7),
                  (7'h40)}))) ?
              $unsigned((~^($unsigned(wire122) && (|reg124)))) : {($signed($signed(wire2)) * ((&wire120) <= (wire1 && wire1))),
                  reg125});
          if ($signed($unsigned($unsigned((&wire120)))))
            begin
              reg127 <= reg126;
              reg128 <= $signed(reg123);
              reg129 <= $unsigned((~^$unsigned($unsigned(reg126[(3'h7):(2'h2)]))));
              reg130 <= {((reg123 < (&(~&reg126))) ?
                      reg129 : $unsigned($signed($unsigned(reg124)))),
                  reg128[(4'ha):(1'h0)]};
            end
          else
            begin
              reg127 <= (~^($unsigned((reg130[(1'h1):(1'h1)] ?
                      (reg125 < reg125) : (wire0 ? wire0 : (7'h41)))) ?
                  (~|$signed($signed((8'h9f)))) : $signed($signed($signed(reg125)))));
              reg128 <= $signed($signed((8'ha7)));
            end
        end
      else
        begin
          reg126 <= (^~$signed(reg126[(2'h3):(1'h1)]));
          if ((&wire1[(1'h1):(1'h1)]))
            begin
              reg127 <= reg129;
              reg128 <= wire120;
              reg129 <= (wire3[(3'h6):(3'h6)] ?
                  $signed($signed((reg129 <= $unsigned(reg127)))) : $signed(($unsigned($unsigned((8'hae))) <<< reg128)));
              reg130 <= wire2[(4'hb):(4'ha)];
            end
          else
            begin
              reg127 <= (({((reg127 >> wire2) ?
                      {(8'hb5),
                          reg128} : {reg130})} >> wire120) << ($signed(($unsigned(reg123) || {wire1,
                      reg127})) ?
                  $unsigned((8'h9d)) : ($unsigned((8'ha4)) ?
                      (!$unsigned(reg128)) : ((wire0 ?
                          reg127 : wire2) <= (wire120 - wire1)))));
              reg128 <= wire122[(4'hc):(4'h9)];
              reg129 <= $unsigned(reg124[(2'h3):(2'h3)]);
            end
          if ($unsigned((reg126 ? {$signed((8'hb3))} : reg123[(3'h5):(1'h1)])))
            begin
              reg131 <= ({wire122, (8'hb2)} || (wire3[(5'h10):(5'h10)] ?
                  wire2[(3'h4):(1'h0)] : ({(~|wire0)} + {(8'hbe)})));
              reg132 <= $unsigned(reg128[(1'h0):(1'h0)]);
            end
          else
            begin
              reg131 <= (($unsigned(((reg123 ? (8'hb8) : wire122) ?
                      (!reg132) : ((8'haf) ? wire3 : reg124))) * (~&{((8'ha2) ?
                          reg125 : reg130)})) ?
                  $unsigned(($signed((wire0 ?
                      reg123 : reg128)) - ((~^wire2) <= (~&reg128)))) : $signed($unsigned(reg127)));
              reg132 <= {reg124[(3'h7):(1'h0)]};
            end
        end
      reg133 <= {((wire3 ^~ $signed((-reg125))) ?
              $signed($unsigned((reg126 ?
                  wire0 : wire1))) : (reg125 != (^{(8'ha7), (8'hae)})))};
    end
  assign wire134 = (&$unsigned((((wire2 ? reg127 : wire1) >= ((8'ha7) ?
                           reg132 : reg132)) ?
                       $signed((reg126 ?
                           reg132 : reg129)) : $signed(wire3[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed(wire1))))
        begin
          reg135 <= (($unsigned((reg130 >> (reg125 * reg129))) >>> ((+$signed(reg124)) ?
              wire122[(3'h5):(3'h4)] : {(!(8'hb3))})) <<< (8'hb4));
        end
      else
        begin
          reg135 <= $signed(((wire134 + reg135) ?
              ((reg131 ?
                  ((8'ha4) ? reg130 : reg132) : (reg127 ?
                      reg131 : reg127)) ^ reg131) : (~reg125)));
          reg136 <= (reg130 ?
              (((wire1[(4'ha):(4'h8)] >>> reg124[(4'h9):(2'h2)]) & $signed((reg132 <= reg131))) ?
                  (8'hab) : (&((reg125 == reg135) ?
                      $signed(reg127) : (~|reg133)))) : reg128[(5'h12):(4'h9)]);
          if ($signed(($signed(({(8'ha7)} > reg130)) || (({reg125, reg123} ?
                  ((8'ha7) ? wire0 : reg125) : {reg131, wire0}) ?
              $unsigned({reg126, wire134}) : ($signed(reg130) ?
                  $signed(reg123) : (reg136 >> reg126))))))
            begin
              reg137 <= (($unsigned(((wire2 || reg136) >= $signed(wire122))) ?
                  $signed((~|reg131[(4'h8):(3'h5)])) : (reg124 ?
                      (reg123 ?
                          (^reg132) : (wire120 ?
                              wire0 : reg124)) : (wire1[(4'hd):(3'h4)] >= wire2[(4'hf):(3'h6)]))) && $unsigned(reg133[(2'h3):(1'h0)]));
              reg138 <= $unsigned(((reg127 || $unsigned((reg131 ?
                  wire134 : reg132))) ~^ $unsigned(reg127[(1'h0):(1'h0)])));
            end
          else
            begin
              reg137 <= wire120[(2'h2):(1'h1)];
              reg138 <= $signed(reg133[(2'h3):(2'h2)]);
              reg139 <= wire120[(2'h2):(2'h2)];
            end
          if ($signed(((|reg129[(4'ha):(3'h5)]) ?
              (&(~|$unsigned(reg137))) : $signed($unsigned((~&reg137))))))
            begin
              reg140 <= reg128;
              reg141 <= ($unsigned(wire0) ?
                  $unsigned((((-wire122) ?
                      (8'h9c) : wire1) >> {$unsigned((8'hb8)),
                      $unsigned((8'ha2))})) : (wire2 ^~ $unsigned((-(wire2 * reg126)))));
            end
          else
            begin
              reg140 <= $signed((reg141[(3'h4):(1'h0)] ?
                  ((^~wire3) & (~|$signed(reg136))) : (^$unsigned((reg137 ?
                      reg126 : wire3)))));
              reg141 <= $unsigned($unsigned({$unsigned($signed(wire1))}));
              reg142 <= $unsigned(wire0[(2'h2):(1'h1)]);
              reg143 <= ({(~&reg123[(3'h5):(3'h5)]),
                      {$unsigned((reg136 ? wire1 : reg137))}} ?
                  wire0[(3'h4):(2'h3)] : reg139);
            end
          reg144 <= reg128[(4'hc):(4'h8)];
        end
      reg145 <= $unsigned(reg137[(2'h2):(1'h1)]);
      if (reg145[(1'h1):(1'h0)])
        begin
          if ($signed(((($unsigned(reg129) & reg135) < reg126[(5'h14):(5'h11)]) >> ($unsigned($signed(reg129)) > $unsigned($signed(reg130))))))
            begin
              reg146 <= reg125[(2'h3):(1'h0)];
            end
          else
            begin
              reg146 <= (wire120[(1'h0):(1'h0)] <= reg140);
            end
          reg147 <= $signed($signed(({wire134} ?
              (reg132 > (~&reg135)) : wire134)));
          reg148 <= (reg130 ~^ {(reg124[(2'h3):(2'h3)] ?
                  (wire2 ?
                      $unsigned(wire120) : $unsigned((8'hb9))) : ($signed(reg140) ?
                      $unsigned(reg141) : $unsigned(reg124))),
              $signed($unsigned((reg136 ? (8'ha3) : reg130)))});
        end
      else
        begin
          if ((|$signed(wire0)))
            begin
              reg146 <= $unsigned(wire3[(5'h15):(5'h14)]);
              reg147 <= (^wire122);
              reg148 <= reg148[(3'h4):(3'h4)];
              reg149 <= (~^reg140);
            end
          else
            begin
              reg146 <= $signed((~|(wire0[(2'h3):(1'h1)] <= (8'hbf))));
              reg147 <= ((reg130[(3'h4):(1'h1)] - $unsigned(($unsigned((8'h9d)) ?
                  reg132[(4'h8):(3'h5)] : reg143[(3'h4):(2'h2)]))) | reg143[(1'h1):(1'h1)]);
              reg148 <= reg142;
              reg149 <= ((+(({(8'hb0), wire1} ?
                      $unsigned(wire2) : $unsigned(reg131)) ?
                  (!reg146[(1'h0):(1'h0)]) : (^reg138[(4'he):(4'h9)]))) - $unsigned($signed(($unsigned(reg139) == $unsigned((8'hb2))))));
            end
          if (reg141[(4'he):(4'hb)])
            begin
              reg150 <= $unsigned(wire3);
              reg151 <= reg144;
            end
          else
            begin
              reg150 <= {reg151, $signed(reg130[(3'h4):(2'h2)])};
              reg151 <= {{reg144}};
            end
          reg152 <= reg127;
          reg153 <= $signed($unsigned(wire122[(3'h5):(1'h1)]));
        end
    end
  assign wire154 = ($signed(((reg139 ?
                       {reg152, reg129} : {(8'ha7)}) <<< reg146)) ^~ (8'had));
  assign wire155 = (^((^(reg153[(4'h8):(3'h6)] * ((8'hac) * reg148))) > (({reg132} | $unsigned(reg128)) >= $signed($unsigned(reg152)))));
  assign wire156 = reg131[(1'h1):(1'h0)];
  assign wire157 = $signed({$unsigned($unsigned({(8'hba), (7'h43)})),
                       (~&reg126)});
  assign wire158 = $signed($unsigned(($signed(reg148) - (&wire0[(2'h3):(1'h0)]))));
  assign wire159 = (reg132 ?
                       $signed({(reg152[(4'hd):(3'h5)] ?
                               (reg139 ?
                                   wire2 : reg132) : ((8'hbc) * reg140))}) : ((+reg131[(4'ha):(2'h3)]) <<< reg130[(1'h0):(1'h0)]));
  assign wire160 = {(8'hbe), $unsigned($signed(reg144[(4'he):(3'h5)]))};
  assign wire161 = ((+(reg130[(1'h1):(1'h1)] ~^ (-$signed(wire134)))) || {($unsigned($signed(wire120)) ?
                           ((reg144 ^ reg138) < reg132) : ((wire120 > wire0) || (!wire156)))});
  assign wire162 = reg137[(1'h1):(1'h1)];
  assign wire163 = ((!wire159) ?
                       ((-$signed((reg140 ? reg147 : reg140))) ?
                           {$signed(reg152[(4'hc):(4'hb)])} : reg146) : {reg139,
                           (((reg141 ?
                                   reg128 : reg149) <<< $unsigned(wire155)) ?
                               (wire156[(2'h3):(2'h2)] ?
                                   (reg131 >> reg125) : wire134[(2'h2):(1'h0)]) : (((8'h9d) ?
                                   reg147 : wire0) ^~ wire134))});
  assign wire164 = {((((^reg138) ? reg149 : ((8'ha5) != reg135)) ?
                           (~(8'hb3)) : reg143[(3'h5):(3'h4)]) >>> (((reg153 ?
                               (8'hbc) : reg127) ?
                           $signed((8'ha4)) : $unsigned(reg142)) ^ ((~^reg132) ?
                           $signed(reg128) : (^~reg144)))),
                       (~^((~&(wire158 ?
                           reg135 : reg138)) ^ reg150[(2'h2):(2'h2)]))};
  assign wire165 = reg133;
  assign wire166 = (~reg147);
  assign wire167 = $signed(reg139[(4'hb):(4'h8)]);
  assign wire168 = $signed(reg136[(1'h0):(1'h0)]);
endmodule

module module4
#(parameter param119 = {{({((8'hb3) ? (8'hbb) : (8'hab))} <<< (~^((8'h9d) ? (8'ha1) : (8'ha8)))), (8'ha8)}, (!{(((8'hb9) - (8'hb1)) ? {(8'hb1), (8'hba)} : (^~(8'hbe))), (+(+(8'hb5)))})})
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  input wire signed [(3'h5):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire103;
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire48,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire50,
                 wire51,
                 wire52,
                 wire103,
                 reg116,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= wire6[(4'he):(3'h5)];
      reg10 <= wire6[(3'h5):(2'h2)];
      if ($unsigned($signed((8'hbf))))
        begin
          reg11 <= $signed(((+($unsigned(wire7) + (wire8 ?
              (8'hb6) : (8'ha8)))) & wire6[(3'h4):(3'h4)]));
        end
      else
        begin
          reg11 <= (wire8 >>> (^~wire6));
          if ({wire7})
            begin
              reg12 <= wire5[(2'h2):(2'h2)];
              reg13 <= $unsigned(((&(8'hbe)) ?
                  $signed((|$unsigned(reg9))) : $unsigned(((reg10 ?
                      reg12 : (8'h9c)) < (8'ha1)))));
            end
          else
            begin
              reg12 <= (wire5[(1'h1):(1'h0)] ^~ ($signed(wire7) >= ($signed((wire7 ?
                      reg12 : reg11)) ?
                  (^~(8'ha5)) : reg11)));
              reg13 <= $unsigned(wire5[(3'h5):(1'h1)]);
              reg14 <= $signed($signed((~&reg11)));
              reg15 <= (~((reg13[(4'h9):(3'h5)] ?
                      reg10[(3'h6):(3'h5)] : $unsigned(reg10)) ?
                  ((8'hb9) ^~ $unsigned((reg9 ^~ reg9))) : (~|((~|wire8) ?
                      reg12[(3'h5):(3'h4)] : ((7'h44) && reg10)))));
              reg16 <= {$unsigned(wire6)};
            end
          reg17 <= $unsigned(($signed($unsigned(wire6[(1'h0):(1'h0)])) ^ $unsigned((wire8[(1'h0):(1'h0)] ?
              {wire7, reg16} : $signed(wire6)))));
          reg18 <= (((&wire8) <<< (((wire8 ? (8'had) : reg14) ?
                  reg13 : (^wire5)) == {reg14})) ?
              (reg15[(4'hb):(3'h7)] >= $signed((reg15 ?
                  reg11 : $unsigned(reg11)))) : ((~|$unsigned($unsigned(reg10))) ?
                  wire7 : wire5[(2'h2):(2'h2)]));
          reg19 <= $signed((8'ha8));
        end
      reg20 <= ($unsigned(((^~$unsigned(reg17)) ?
              reg15[(2'h2):(1'h0)] : $unsigned((reg11 >>> reg11)))) ?
          ((8'hb4) | (reg19 ?
              $signed((&reg13)) : reg13[(4'h8):(4'h8)])) : wire5);
      reg21 <= $signed((~|$signed($unsigned($signed(reg13)))));
    end
  assign wire22 = reg16;
  assign wire23 = (wire7 < (reg16 ?
                      (^~(&(reg15 ^ reg10))) : (wire22[(1'h0):(1'h0)] ?
                          reg11[(1'h1):(1'h1)] : {reg21[(4'hb):(1'h1)],
                              reg12[(4'hd):(4'hd)]})));
  assign wire24 = (^reg19[(4'ha):(4'h9)]);
  assign wire25 = reg18[(1'h1):(1'h1)];
  assign wire26 = wire22[(3'h4):(3'h4)];
  module27 #() modinst49 (wire48, clk, reg15, wire22, reg11, reg12, reg17);
  assign wire50 = ((|(($unsigned(wire25) ^~ {reg16}) >>> $unsigned(wire8[(3'h6):(3'h5)]))) ?
                      $signed(reg16[(2'h2):(2'h2)]) : {wire23});
  assign wire51 = $signed($unsigned($signed($unsigned(reg21))));
  assign wire52 = {($signed(wire25) - (($unsigned(wire8) <<< (^~wire5)) ?
                          ($signed(reg17) * reg19[(1'h1):(1'h1)]) : ($signed(reg9) ?
                              wire26[(2'h2):(1'h0)] : reg14[(1'h0):(1'h0)]))),
                      $unsigned((~^wire24[(4'h8):(3'h6)]))};
  module53 #() modinst104 (wire103, clk, wire25, reg12, reg19, reg9, reg18);
  always
    @(posedge clk) begin
      reg105 <= (^~(^wire23[(4'h9):(3'h5)]));
      if ((reg21 <= reg19))
        begin
          reg106 <= (8'h9c);
          if (reg21)
            begin
              reg107 <= $unsigned(($unsigned((~^$unsigned(reg10))) ?
                  wire52 : reg105));
              reg108 <= wire22;
              reg109 <= (wire24 >> ((^$unsigned($signed(wire103))) ?
                  $signed($unsigned(wire23)) : $signed((wire23[(5'h14):(3'h6)] ?
                      {wire6, reg12} : ((8'hbb) - reg10)))));
              reg110 <= ((~|($signed($unsigned(wire51)) * (reg15 ?
                  (8'had) : $unsigned(reg107)))) <= (reg17 > $signed($unsigned((+wire8)))));
              reg111 <= $signed($unsigned($unsigned($unsigned(wire48))));
            end
          else
            begin
              reg107 <= (&(reg10 ?
                  $unsigned((wire51[(3'h5):(3'h4)] ?
                      $signed((8'hb1)) : reg107)) : ({(reg107 >>> reg21)} ?
                      ((reg109 ? wire7 : reg21) ?
                          {wire6} : $unsigned((8'haa))) : $unsigned($unsigned(reg107)))));
              reg108 <= (~&{$signed(reg13),
                  ((wire22[(3'h6):(3'h5)] > $unsigned(reg109)) ?
                      (((8'hb5) ? wire22 : (8'ha1)) ?
                          (reg110 >> reg107) : reg110) : ((-wire103) >>> ((8'hb8) ?
                          (8'hb9) : (8'h9c))))});
              reg109 <= (reg20 ~^ (((^~(reg105 >>> wire24)) ~^ wire24[(4'he):(4'h9)]) || ({(wire8 >= reg9)} ?
                  $signed($signed(reg21)) : reg16)));
              reg110 <= wire26;
            end
        end
      else
        begin
          if ((reg105 ?
              $unsigned(($signed((~(8'haa))) ?
                  reg11[(3'h6):(2'h3)] : $signed($unsigned(reg110)))) : reg17))
            begin
              reg106 <= reg15[(4'hb):(2'h3)];
              reg107 <= reg19;
            end
          else
            begin
              reg106 <= $signed(reg110[(1'h0):(1'h0)]);
              reg107 <= $signed((reg109 ?
                  $signed($signed($signed((8'hbe)))) : {$unsigned(wire6)}));
              reg108 <= $unsigned($signed($unsigned((~&(reg111 ?
                  (8'hb0) : reg108)))));
              reg109 <= (&{((reg105[(4'hb):(4'ha)] || $unsigned(wire23)) ?
                      $unsigned((reg13 ? (7'h43) : reg111)) : ({(8'h9f)} ?
                          wire52 : (^~(8'ha4)))),
                  reg9[(3'h4):(2'h3)]});
              reg110 <= ((8'ha5) ? reg107[(4'h9):(3'h4)] : $signed((8'h9c)));
            end
          reg111 <= $unsigned({reg108[(4'ha):(4'ha)],
              (reg17[(3'h7):(2'h3)] && reg106[(3'h5):(2'h2)])});
          if ((~&((&{(&wire22),
              wire103[(4'hb):(3'h5)]}) >= $signed((~&(8'haf))))))
            begin
              reg112 <= (~|reg105[(5'h11):(3'h5)]);
              reg113 <= $unsigned(wire48);
              reg114 <= wire6;
            end
          else
            begin
              reg112 <= (~^(+(~&({(8'ha4), reg20} - (wire5 < reg112)))));
              reg113 <= (wire8[(2'h2):(1'h1)] <= reg19);
              reg114 <= {(+$unsigned($signed($unsigned((8'hb5)))))};
              reg115 <= (($unsigned({reg106}) - reg17) <= $signed($signed(((&reg114) < reg20[(3'h6):(3'h5)]))));
            end
          reg116 <= {{wire26[(1'h1):(1'h1)]},
              ((8'hb8) ?
                  $unsigned(reg9[(3'h4):(1'h1)]) : $unsigned((((8'hbb) ?
                      reg17 : reg11) * {(8'ha1)})))};
        end
    end
  assign wire117 = {($signed({reg16}) ?
                           (((!(8'had)) ? (wire103 ? wire5 : reg12) : wire48) ?
                               (|(~(8'hb2))) : $unsigned(((8'ha6) >>> reg20))) : (((reg13 != wire23) | $unsigned(reg109)) >= wire7[(3'h6):(3'h4)])),
                       (~&(wire26 <<< reg9[(4'hc):(3'h6)]))};
  assign wire118 = {($signed($unsigned(wire50[(1'h1):(1'h1)])) ~^ (!((reg110 ?
                           wire50 : reg114) <= (reg110 * wire23)))),
                       {(!$unsigned(((8'ha8) ? reg107 : reg115))),
                           (~^{(wire117 ? wire50 : reg113), (|reg10)})}};
endmodule

module module53
#(parameter param101 = (^((((|(8'hb2)) * ((8'hba) > (8'ha6))) ^ (((7'h42) ? (8'h9f) : (8'hbf)) ? (8'hae) : ((8'hb9) - (8'ha5)))) ? (((~|(8'hb0)) < ((8'hbe) ~^ (8'hb1))) ? (!((8'hb8) ? (8'hba) : (8'had))) : (((8'hb7) < (8'h9d)) <<< ((8'hb9) <<< (8'h9c)))) : {({(8'hb7)} ? ((8'hba) >= (8'haf)) : ((8'h9d) << (8'hb2))), (&((8'hb3) ? (8'hb0) : (7'h40)))})), 
parameter param102 = ((((param101 ? (&param101) : param101) >> (8'ha7)) ? (~&param101) : param101) || (~^(^param101))))
(y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire58;
  input wire signed [(5'h13):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  input wire [(5'h14):(1'h0)] wire55;
  input wire [(4'hf):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire signed [(4'hf):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire88,
                 wire87,
                 wire86,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
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
                 (1'h0)};
  assign wire59 = ($signed($unsigned(wire58[(4'hf):(2'h3)])) ?
                      wire54 : (8'ha1));
  assign wire60 = $signed($unsigned(wire59));
  assign wire61 = wire58[(5'h13):(1'h0)];
  assign wire62 = {((&$signed(wire59)) ?
                          $unsigned($signed({(8'h9d)})) : wire61)};
  assign wire63 = (($unsigned($signed(((8'h9f) == wire59))) + (+(8'hb1))) + {({wire54} + $unsigned(wire54[(4'hd):(3'h6)]))});
  assign wire64 = wire59;
  always
    @(posedge clk) begin
      reg65 <= (wire61[(2'h2):(1'h1)] != (wire64[(1'h1):(1'h1)] >= wire55[(3'h6):(1'h1)]));
      if (($signed((+$unsigned({wire54}))) + $signed($signed((^(~^wire59))))))
        begin
          if ($unsigned($unsigned($signed((&$unsigned(wire56))))))
            begin
              reg66 <= (-(((wire63[(3'h5):(2'h2)] ?
                  wire57[(3'h7):(1'h0)] : wire57[(3'h5):(1'h1)]) == $unsigned({wire55})) <= $signed((8'hbb))));
            end
          else
            begin
              reg66 <= (((~$unsigned($unsigned(wire63))) ?
                      wire58 : wire62[(2'h2):(1'h0)]) ?
                  ({((wire62 ^~ wire54) ? wire56 : $unsigned(wire59))} ?
                      ((wire55[(3'h5):(3'h4)] ?
                              $unsigned(reg66) : (wire64 == reg66)) ?
                          (((7'h43) >> wire58) ?
                              $signed(reg65) : (wire54 ?
                                  (8'hbb) : wire56)) : reg66[(1'h1):(1'h1)]) : $unsigned($unsigned(wire64[(2'h3):(1'h1)]))) : $unsigned($unsigned((&(^~wire55)))));
              reg67 <= wire63[(2'h2):(1'h1)];
              reg68 <= $unsigned((wire56[(1'h0):(1'h0)] ?
                  {(+(8'h9c))} : $signed($signed({wire55}))));
            end
          reg69 <= {$signed((wire55[(3'h7):(3'h6)] ?
                  (~&((8'haf) ? (8'ha0) : (7'h44))) : wire56))};
        end
      else
        begin
          if ((wire64 ?
              (+(((reg68 << wire62) - reg69) * wire59[(2'h2):(1'h1)])) : ($unsigned(($signed(reg69) <<< $unsigned(wire58))) ?
                  (((^~reg67) ?
                      wire58[(5'h12):(3'h6)] : reg69) <<< (~|reg66)) : ($unsigned((8'h9d)) >>> $signed(reg66)))))
            begin
              reg66 <= $signed($unsigned(wire61[(1'h1):(1'h1)]));
              reg67 <= reg68[(3'h5):(2'h2)];
              reg68 <= (~$signed(($unsigned($signed(wire62)) ^ ((wire55 * reg69) ?
                  reg67 : $unsigned(wire61)))));
              reg69 <= reg68[(5'h10):(3'h5)];
              reg70 <= $signed(reg65[(4'ha):(2'h2)]);
            end
          else
            begin
              reg66 <= $unsigned({wire61[(1'h1):(1'h0)], wire64});
            end
          reg71 <= ((~^reg67) < (~(~|wire64)));
        end
      if ($unsigned(reg71))
        begin
          reg72 <= wire61[(3'h6):(3'h6)];
          if ({reg65})
            begin
              reg73 <= wire59;
              reg74 <= ((reg66[(2'h2):(1'h0)] ?
                      wire54[(1'h0):(1'h0)] : wire62[(2'h2):(1'h1)]) ?
                  reg73 : $unsigned(wire64));
              reg75 <= ($unsigned(reg66) ?
                  (^~$signed(((wire56 ?
                      wire63 : reg68) <<< reg74[(3'h4):(3'h4)]))) : {$signed((^$signed(reg68))),
                      $unsigned((reg72 <= {reg69}))});
              reg76 <= $signed(reg68[(1'h1):(1'h1)]);
            end
          else
            begin
              reg73 <= $unsigned(reg74);
              reg74 <= wire63;
              reg75 <= reg73[(2'h3):(2'h2)];
              reg76 <= wire54[(4'h9):(2'h2)];
              reg77 <= $signed((^$signed(reg75)));
            end
          reg78 <= $signed((($signed($signed(reg66)) ^ {$unsigned(wire59),
                  (8'hba)}) ?
              $signed({$unsigned(wire55),
                  $signed((7'h41))}) : ($unsigned((~|reg68)) <= $signed(wire59))));
        end
      else
        begin
          reg72 <= (reg70 ? (^~{wire62}) : (7'h41));
          reg73 <= (wire60 || wire56);
          reg74 <= ((~|wire62) ?
              {$signed(((wire63 ? wire57 : reg77) ?
                      (reg69 ? wire57 : wire63) : $unsigned(wire62))),
                  $signed(reg67[(3'h4):(1'h0)])} : $unsigned(wire60[(4'hb):(4'hb)]));
          reg75 <= (-(!wire59));
        end
      if ({(reg77 ~^ wire57), reg75[(1'h1):(1'h0)]})
        begin
          reg79 <= (-$unsigned($signed((8'hac))));
          if ($unsigned(reg79))
            begin
              reg80 <= ($unsigned((^(^wire55[(2'h3):(2'h2)]))) ?
                  (~|{$unsigned((~&reg73)),
                      {reg68,
                          (reg77 ? wire55 : reg72)}}) : wire56[(2'h2):(1'h1)]);
              reg81 <= {$unsigned({reg72, reg74[(4'hb):(3'h5)]})};
              reg82 <= {$unsigned((reg76[(4'hc):(2'h2)] <= ((reg76 != wire62) ^~ $signed(reg66))))};
            end
          else
            begin
              reg80 <= $unsigned(wire57);
              reg81 <= reg69;
              reg82 <= $signed(((~wire59) ?
                  $signed($signed(reg70[(4'hd):(4'hc)])) : wire60[(2'h2):(2'h2)]));
              reg83 <= ($signed(({(~&reg73),
                  reg75[(3'h7):(3'h4)]} > $signed((wire59 & wire61)))) <= $signed(reg80));
              reg84 <= (($unsigned(wire57[(1'h1):(1'h1)]) ?
                      ($signed($signed(wire64)) & ((reg81 ? (7'h43) : reg72) ?
                          (wire59 ? wire59 : reg81) : ((8'hb5) ?
                              reg65 : reg76))) : reg81[(3'h5):(2'h3)]) ?
                  ((|reg66) ?
                      (^(~|reg65[(2'h2):(1'h1)])) : $unsigned((|(reg71 != wire61)))) : {(^{$unsigned(reg70)})});
            end
        end
      else
        begin
          reg79 <= ((wire55[(5'h11):(4'ha)] ?
              {(+wire56)} : wire56) > (reg79[(2'h3):(2'h3)] ?
              reg71[(4'hc):(3'h7)] : $unsigned(reg75[(3'h4):(1'h0)])));
          reg80 <= ((8'hb4) || reg79);
          reg81 <= {(~^(^((~^reg83) ^ (wire62 ? wire54 : reg65))))};
        end
      reg85 <= reg76[(3'h5):(3'h5)];
    end
  assign wire86 = $signed(reg75[(1'h1):(1'h1)]);
  assign wire87 = $signed(reg67);
  assign wire88 = ($unsigned($signed(((reg78 + reg79) ?
                      (^~reg73) : (wire63 ?
                          wire87 : reg82)))) || (^~{(-(|wire59))}));
  always
    @(posedge clk) begin
      reg89 <= reg74[(3'h5):(2'h2)];
      if ((-(^~{wire54,
          ((^~reg77) ? reg70[(4'h9):(3'h5)] : reg75[(3'h7):(3'h6)])})))
        begin
          reg90 <= wire86[(2'h3):(2'h2)];
          if (reg85[(2'h2):(1'h0)])
            begin
              reg91 <= {$unsigned((((8'hbf) ?
                      $signed(reg68) : reg74) != wire64[(3'h5):(3'h5)]))};
              reg92 <= reg83[(3'h6):(2'h3)];
              reg93 <= ((~|reg91[(3'h7):(1'h1)]) ?
                  (reg81[(2'h2):(1'h0)] >> $unsigned(reg82)) : ($unsigned((|reg76)) ?
                      wire62 : ($signed($unsigned(wire87)) & (|(|reg91)))));
              reg94 <= ($unsigned($unsigned($signed($unsigned((8'hb6))))) & reg90[(2'h3):(2'h2)]);
              reg95 <= reg74[(2'h3):(2'h3)];
            end
          else
            begin
              reg91 <= $signed(wire87[(1'h1):(1'h0)]);
              reg92 <= (reg72[(4'hc):(3'h6)] ?
                  $unsigned(reg81[(3'h4):(1'h0)]) : reg95[(3'h5):(1'h1)]);
              reg93 <= ($signed((wire62 > $signed($signed(wire88)))) ?
                  ($unsigned(((^(8'hb3)) < (reg72 < wire60))) ?
                      ((~^wire87) >>> $signed((reg80 ?
                          reg65 : reg95))) : wire54[(2'h3):(2'h3)]) : ($signed(((reg94 ?
                              wire88 : wire55) ?
                          (reg65 ? wire61 : reg76) : (~^wire88))) ?
                      (~^((-reg85) <= reg79[(1'h1):(1'h1)])) : ((~$unsigned(wire58)) ?
                          (&(reg82 & reg93)) : reg90)));
            end
        end
      else
        begin
          reg90 <= $unsigned($unsigned(reg76[(3'h5):(2'h3)]));
          reg91 <= $signed((reg70[(4'hb):(4'h9)] > $unsigned(((reg74 ?
                  reg91 : (8'hb1)) ?
              (~|reg89) : (reg75 + reg90)))));
          reg92 <= (~|wire60[(3'h5):(2'h3)]);
          reg93 <= (reg70 >= reg89);
        end
    end
  assign wire96 = (8'hba);
  assign wire97 = (((((^~reg76) == (reg89 >= reg91)) ?
                              reg70[(4'h8):(1'h1)] : ($unsigned(wire63) ?
                                  (8'ha1) : (reg85 ^ (8'hb5)))) ?
                          (^~$signed((8'had))) : $signed({(8'h9e)})) ?
                      $unsigned({((reg81 ? (8'hb1) : wire55) - reg93),
                          reg94}) : (|$signed(wire56[(1'h0):(1'h0)])));
  assign wire98 = $signed($signed((^(+(&reg89)))));
  assign wire99 = (reg73 >> (&(reg66 ?
                      {{reg85}} : ((~&reg79) ~^ $signed(wire57)))));
  assign wire100 = (~|($unsigned(reg70) >>> $unsigned(reg68[(2'h3):(1'h1)])));
endmodule

module module27
#(parameter param47 = {{((!((8'hbe) || (8'hb1))) ? (((8'h9c) ? (8'hba) : (8'hb8)) ? (8'hb3) : (~(8'hbb))) : {{(8'ha8), (8'hb9)}, (!(8'ha5))})}})
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire32;
  input wire [(4'ha):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 (1'h0)};
  assign wire33 = $unsigned($signed(wire28));
  assign wire34 = wire32;
  assign wire35 = {($unsigned($signed((~^wire33))) ^ wire30[(3'h4):(2'h3)]),
                      wire31[(4'ha):(1'h0)]};
  assign wire36 = $unsigned($signed((($signed(wire30) < (^~(8'hbc))) ?
                      {(~wire34), (8'hae)} : ({wire34, wire32} <<< {wire29}))));
  assign wire37 = (&wire34);
  assign wire38 = $signed(($signed($signed((&wire32))) ?
                      $signed(wire36[(1'h1):(1'h0)]) : {$signed((wire32 != (8'hb3)))}));
  assign wire39 = (^($unsigned(($unsigned(wire36) ? wire34 : wire33)) ?
                      ({$signed((8'ha3)),
                          wire38} ~^ wire38[(3'h7):(3'h7)]) : $unsigned(((wire36 != wire36) ?
                          $signed((8'ha0)) : $signed(wire32)))));
  assign wire40 = $signed($unsigned(((~(wire30 ^~ wire29)) ^~ $unsigned($signed(wire39)))));
  assign wire41 = ((wire37 | (~&wire37[(3'h5):(3'h4)])) ?
                      ($unsigned(({wire37, wire28} != (wire29 >> (8'h9c)))) ?
                          ((&(wire35 ~^ wire37)) ?
                              $unsigned({wire28,
                                  (8'ha1)}) : (8'hbd)) : $signed($unsigned($signed(wire32)))) : wire36[(4'hb):(1'h0)]);
  assign wire42 = $unsigned($signed((wire31[(3'h7):(3'h4)] ^ (wire37[(4'h9):(3'h5)] ?
                      wire34[(4'hd):(4'ha)] : ((8'hb9) ? wire39 : wire35)))));
  assign wire43 = $signed($unsigned($signed($unsigned(wire31[(3'h4):(1'h0)]))));
  assign wire44 = wire43;
  assign wire45 = $unsigned((wire44 == ((~&wire36) ?
                      $signed(((8'hbb) ? (8'hb4) : (8'hb4))) : wire42)));
  assign wire46 = (wire37 << {wire41});
endmodule
