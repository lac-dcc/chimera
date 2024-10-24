module top
#(parameter param191 = ((((~^((7'h40) ? (8'had) : (8'ha8))) << ((+(8'h9d)) <= (8'h9e))) ? (~|(((8'h9f) - (8'hb4)) ^~ (8'ha0))) : {((+(8'had)) ? (~&(8'ha9)) : (8'hb3))}) ? (|(7'h43)) : ((+{((8'ha1) ? (8'hab) : (8'hab))}) <= (&(-(~^(7'h41)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(4'h9):(1'h0)] wire190;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire188;
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire190,
                 wire4,
                 wire32,
                 wire33,
                 wire34,
                 wire38,
                 wire39,
                 wire188,
                 reg37,
                 reg36,
                 reg35,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {wire2};
  always
    @(posedge clk) begin
      reg5 <= $unsigned((~&wire0));
    end
  always
    @(posedge clk) begin
      reg6 <= ((reg5 >> ($unsigned((wire1 ^~ wire2)) ?
          $unsigned((wire1 ?
              wire3 : (8'ha3))) : {wire4[(4'h9):(1'h1)]})) * reg5[(2'h3):(2'h3)]);
      reg7 <= (reg5[(2'h3):(1'h0)] ^~ (wire4 ? wire3 : (^$signed((-(8'haf))))));
    end
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg8 <= (|($unsigned($unsigned(reg6)) * (reg7 >> $signed(((8'h9e) ?
              reg5 : wire0)))));
        end
      else
        begin
          reg8 <= (($signed(reg8[(3'h5):(1'h0)]) - (~{(wire3 ?
                  reg7 : (8'ha6))})) > (~{(8'ha4), ($unsigned(reg7) < wire2)}));
        end
      if ({$signed(($signed((7'h41)) ~^ $signed({reg5, reg5})))})
        begin
          reg9 <= (8'hbc);
          reg10 <= $unsigned(wire1);
          if ((|wire0))
            begin
              reg11 <= $signed($signed((8'ha9)));
              reg12 <= ((reg5 ?
                      ((reg8 ^~ (wire2 ^ wire1)) && (!$signed(reg7))) : (~^(reg10 ?
                          {wire0, reg9} : $unsigned(reg6)))) ?
                  (wire1 ?
                      ((((8'ha3) ? reg9 : wire4) != (wire2 ? wire0 : wire2)) ?
                          $signed(wire3[(3'h5):(3'h5)]) : $signed($unsigned(wire1))) : ({reg9[(4'hb):(2'h3)]} || $unsigned($signed(reg7)))) : (((-$unsigned((8'hac))) ~^ ((^reg6) ?
                      $unsigned(reg7) : reg7[(3'h4):(3'h4)])) ^~ $signed(reg6[(3'h5):(1'h0)])));
              reg13 <= ($unsigned(reg10[(1'h1):(1'h0)]) >>> $unsigned($unsigned(reg11)));
            end
          else
            begin
              reg11 <= reg12[(1'h1):(1'h1)];
              reg12 <= (^$signed($unsigned((8'ha3))));
              reg13 <= (~|{wire0});
              reg14 <= $signed($unsigned($unsigned((~&reg8))));
              reg15 <= reg13;
            end
          if ((&(reg8 <<< wire1[(2'h2):(1'h1)])))
            begin
              reg16 <= $signed(wire1);
              reg17 <= wire1[(1'h1):(1'h0)];
              reg18 <= $signed($signed((wire3[(4'h8):(1'h0)] ^ reg13[(3'h4):(1'h1)])));
            end
          else
            begin
              reg16 <= wire2[(1'h0):(1'h0)];
              reg17 <= $unsigned((!$unsigned($signed(reg6))));
              reg18 <= (({wire0[(1'h0):(1'h0)],
                  reg16} | (|reg9[(2'h3):(2'h2)])) << {(-(-wire1[(1'h0):(1'h0)])),
                  $unsigned((~(wire4 >> reg7)))});
            end
          if ($unsigned((((wire1 - (wire3 ~^ wire3)) ?
              (&reg15[(2'h2):(2'h2)]) : wire2) ~^ (^$signed((reg6 ?
              reg13 : reg15))))))
            begin
              reg19 <= ((wire1 ?
                  (&($unsigned((8'ha4)) ?
                      (reg13 && reg16) : $signed(reg18))) : reg18[(3'h6):(3'h5)]) ^ ((8'ha3) < $signed((reg6 ?
                  $unsigned(wire3) : wire0[(2'h2):(1'h0)]))));
              reg20 <= ($unsigned($signed(wire4)) & ((((&wire0) ?
                      reg5[(2'h2):(2'h2)] : wire2[(3'h5):(3'h4)]) ?
                  reg15[(3'h7):(3'h4)] : ((reg19 || (8'ha6)) > wire2)) + $signed(wire1)));
              reg21 <= $unsigned((!reg9));
            end
          else
            begin
              reg19 <= reg14[(2'h3):(2'h3)];
              reg20 <= $unsigned({reg7[(1'h0):(1'h0)], {wire1[(2'h2):(1'h1)]}});
              reg21 <= (+reg6[(2'h3):(2'h3)]);
            end
        end
      else
        begin
          reg9 <= (~&(reg15 ?
              ($unsigned((reg5 ? (8'hac) : reg14)) ?
                  {(~|(8'ha0)),
                      wire0[(3'h7):(3'h7)]} : reg11[(3'h5):(2'h3)]) : (~|reg19[(3'h5):(1'h1)])));
          reg10 <= reg5;
          if ({(wire1[(1'h1):(1'h1)] ? reg12[(3'h5):(3'h4)] : reg14)})
            begin
              reg11 <= {(reg7[(1'h0):(1'h0)] >= (~^$unsigned($signed(reg14))))};
              reg12 <= reg8[(2'h3):(2'h3)];
            end
          else
            begin
              reg11 <= {reg5, $unsigned(reg19[(3'h4):(1'h1)])};
            end
        end
      if (($signed(wire2) ? wire4 : wire1[(1'h0):(1'h0)]))
        begin
          if ($signed((-(^~reg15))))
            begin
              reg22 <= reg19[(4'hb):(3'h6)];
              reg23 <= wire1[(1'h1):(1'h1)];
              reg24 <= reg20[(4'hb):(4'hb)];
              reg25 <= $signed((reg19 ?
                  ($unsigned($signed((8'hb0))) * ({(8'had),
                      reg19} >= $signed(reg5))) : reg22[(4'h8):(3'h6)]));
              reg26 <= $unsigned((($unsigned(reg8[(1'h1):(1'h0)]) ?
                      ($signed((8'ha4)) ? reg13 : reg25) : (reg15 * (wire0 ?
                          reg21 : reg9))) ?
                  (&$unsigned(reg5[(2'h3):(1'h1)])) : $signed(reg16)));
            end
          else
            begin
              reg22 <= wire4;
              reg23 <= $signed(reg25);
              reg24 <= reg18[(3'h5):(2'h3)];
              reg25 <= (reg20[(2'h3):(2'h3)] != (reg26 ?
                  ((-$unsigned(reg24)) * ($unsigned(reg25) ^~ $unsigned(reg11))) : ($signed(((8'hbb) ?
                          reg17 : reg16)) ?
                      ((-reg16) ? $signed(reg14) : (&reg11)) : reg24)));
            end
          reg27 <= ($signed(wire4) <<< $unsigned($unsigned((|$unsigned(reg11)))));
          reg28 <= $signed(reg12);
          reg29 <= (^reg19);
        end
      else
        begin
          reg22 <= (~|$unsigned(reg20[(4'h8):(2'h2)]));
          if (reg24[(4'h9):(4'h9)])
            begin
              reg23 <= $signed((wire2[(1'h0):(1'h0)] ?
                  {reg23[(2'h3):(2'h2)],
                      reg8[(2'h2):(1'h0)]} : $signed($signed(reg27))));
            end
          else
            begin
              reg23 <= (8'hb6);
              reg24 <= reg29[(4'he):(4'ha)];
            end
          reg25 <= ({reg5[(1'h1):(1'h1)]} >= reg13[(1'h1):(1'h1)]);
          reg26 <= ($unsigned(reg22[(4'h8):(3'h6)]) <<< $unsigned((reg11[(4'h8):(3'h7)] ~^ (reg8 && $unsigned((8'ha3))))));
        end
      reg30 <= ($signed(reg24) > {$unsigned(reg14)});
      reg31 <= $signed($unsigned($signed($signed((7'h40)))));
    end
  assign wire32 = $unsigned(reg20);
  assign wire33 = $signed(((~reg28) > (8'h9c)));
  assign wire34 = $unsigned($unsigned($unsigned($signed($unsigned(reg10)))));
  always
    @(posedge clk) begin
      reg35 <= (8'hae);
      reg36 <= (8'hb4);
    end
  always
    @(posedge clk) begin
      reg37 <= {reg15};
    end
  assign wire38 = ((+({(reg23 ? reg31 : reg35),
                          $unsigned(reg16)} * reg37[(3'h7):(2'h2)])) ?
                      $unsigned(reg30[(1'h0):(1'h0)]) : ($unsigned({{reg12,
                                  reg9}}) ?
                          ((~|(!reg35)) != (~|$unsigned(reg17))) : ($signed($signed(wire33)) + (wire3[(2'h2):(1'h1)] + (~reg13)))));
  assign wire39 = wire38;
  module40 #() modinst189 (wire188, clk, reg6, wire33, reg20, reg12, reg27);
  assign wire190 = $unsigned(((~((reg14 | (8'ha9)) ?
                           $signed(reg30) : (~&(8'hbd)))) ?
                       reg31[(3'h6):(3'h6)] : (((!(8'ha3)) ?
                               reg31 : reg8[(3'h5):(1'h1)]) ?
                           ((~|reg11) & $unsigned(reg5)) : (-(7'h44)))));
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire45;
  input wire [(5'h11):(1'h0)] wire44;
  input wire signed [(4'hb):(1'h0)] wire43;
  input wire signed [(4'hd):(1'h0)] wire42;
  input wire [(4'he):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire186;
  wire [(5'h13):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire123;
  wire [(5'h11):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire153;
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg122 = (1'h0);
  assign y = {wire186,
                 wire101,
                 wire103,
                 wire104,
                 wire116,
                 wire117,
                 wire118,
                 wire123,
                 wire124,
                 wire153,
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
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 (1'h0)};
  module46 #() modinst102 (.wire50(wire43), .wire47(wire45), .clk(clk), .wire51(wire44), .wire48(wire41), .wire49(wire42), .y(wire101));
  assign wire103 = ($unsigned($signed({(|wire41)})) < $unsigned(wire42));
  assign wire104 = wire42;
  always
    @(posedge clk) begin
      if ($signed($signed((^(~wire41[(3'h4):(3'h4)])))))
        begin
          reg105 <= wire104[(4'h9):(2'h2)];
          if (($unsigned(wire42[(3'h7):(1'h0)]) ?
              (wire104 ?
                  (!wire43[(4'ha):(4'h8)]) : {wire41[(3'h5):(2'h2)],
                      $signed((|wire44))}) : $unsigned($signed($signed($unsigned(wire42))))))
            begin
              reg106 <= $signed((($signed(wire101) ?
                  ($signed(wire42) - (wire103 ?
                      wire103 : reg105)) : reg105) == (8'haa)));
            end
          else
            begin
              reg106 <= ((&wire101[(4'h9):(2'h3)]) ?
                  reg106[(2'h2):(1'h0)] : (reg106[(3'h6):(1'h1)] ?
                      (+((reg105 >= wire101) ?
                          {wire43} : (wire41 ?
                              wire45 : (7'h41)))) : {((|wire42) + (&(8'hac)))}));
              reg107 <= wire45[(4'hb):(2'h3)];
              reg108 <= wire43;
              reg109 <= (^~reg107);
              reg110 <= wire104;
            end
          if ((~reg107))
            begin
              reg111 <= $signed($signed((((reg108 > wire103) ?
                      wire45[(4'he):(2'h2)] : $signed(wire103)) ?
                  {(^~(7'h42))} : $signed(wire103))));
              reg112 <= $unsigned((((~&$unsigned(wire43)) ?
                      (8'hbe) : $unsigned((reg111 ? wire104 : wire42))) ?
                  wire43[(2'h2):(1'h1)] : reg105));
            end
          else
            begin
              reg111 <= wire101;
              reg112 <= {wire103};
              reg113 <= $signed((~^reg106));
            end
          reg114 <= {$unsigned((wire45[(2'h3):(2'h2)] ?
                  (-(wire103 ?
                      wire42 : reg105)) : ((~wire45) < reg110[(1'h0):(1'h0)])))};
          reg115 <= reg108[(1'h0):(1'h0)];
        end
      else
        begin
          reg105 <= $signed((8'hbd));
          if ($signed($signed($signed(wire101))))
            begin
              reg106 <= wire41[(4'he):(1'h0)];
              reg107 <= (~(~^$signed($unsigned(reg114[(1'h0):(1'h0)]))));
              reg108 <= $signed((^~(~^wire44)));
              reg109 <= {reg112,
                  ($unsigned((|(reg105 - (8'h9f)))) ? reg107 : reg108)};
            end
          else
            begin
              reg106 <= $signed($unsigned(wire101));
              reg107 <= (8'hb3);
              reg108 <= $signed((~^$signed(((wire43 ?
                  wire45 : wire42) <<< (reg114 ? wire104 : reg115)))));
              reg109 <= {reg105};
              reg110 <= reg111[(1'h0):(1'h0)];
            end
        end
    end
  assign wire116 = (~(-$signed(wire42[(3'h7):(3'h7)])));
  assign wire117 = ($unsigned({((wire116 ? wire45 : wire103) != (reg108 ?
                               reg110 : wire43)),
                           $signed(reg112[(4'h9):(1'h1)])}) ?
                       {reg106[(3'h4):(2'h2)]} : $signed((wire45 | (wire44 ?
                           (~wire44) : (wire43 + reg105)))));
  assign wire118 = reg105[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg119 <= (!(wire101[(5'h13):(4'hd)] ?
          ($signed((8'ha9)) != ((&wire45) > (+wire43))) : wire116));
      reg120 <= $signed((7'h40));
      reg121 <= $signed((($unsigned($unsigned(reg110)) * (8'hbf)) ?
          (~|((reg110 ? reg107 : (7'h44)) ?
              $unsigned(reg107) : {wire42, reg109})) : reg111));
      reg122 <= {(-(reg112[(3'h4):(1'h0)] ?
              ($unsigned(reg107) ?
                  $unsigned(wire45) : (!reg111)) : ((8'h9d) >>> reg115[(4'hd):(3'h6)]))),
          $signed(wire101)};
    end
  assign wire123 = reg119[(4'ha):(1'h0)];
  assign wire124 = (8'h9d);
  module125 #() modinst154 (wire153, clk, wire124, reg121, reg115, wire44, wire116);
  module155 #() modinst187 (.wire159(reg110), .y(wire186), .wire156(reg112), .wire160(wire101), .clk(clk), .wire157(reg120), .wire158(wire42));
endmodule

module module155
#(parameter param184 = (~|{((((8'hb7) ? (8'hb4) : (8'ha9)) ? ((7'h41) ^ (8'hac)) : ((8'hae) ? (8'ha4) : (8'h9f))) || (((8'hbf) == (8'ha4)) - ((8'hb5) <= (7'h42))))}), 
parameter param185 = ((!{((param184 ? param184 : (7'h43)) ? param184 : {param184, param184}), {{param184}, (param184 || param184)}}) ? param184 : ((param184 ? (-(param184 ? param184 : param184)) : ({(8'hb8), param184} ~^ param184)) < (&{(~|(8'hb5)), param184}))))
(y, clk, wire160, wire159, wire158, wire157, wire156);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire160;
  input wire signed [(2'h3):(1'h0)] wire159;
  input wire signed [(4'hd):(1'h0)] wire158;
  input wire [(3'h6):(1'h0)] wire157;
  input wire [(2'h2):(1'h0)] wire156;
  wire signed [(4'h8):(1'h0)] wire183;
  wire signed [(5'h14):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire181;
  wire signed [(3'h4):(1'h0)] wire180;
  wire [(4'hc):(1'h0)] wire179;
  wire signed [(3'h6):(1'h0)] wire178;
  wire signed [(3'h6):(1'h0)] wire177;
  wire [(3'h5):(1'h0)] wire166;
  wire signed [(5'h11):(1'h0)] wire165;
  wire [(4'h9):(1'h0)] wire164;
  wire [(2'h3):(1'h0)] wire163;
  wire [(5'h15):(1'h0)] wire162;
  wire [(4'hc):(1'h0)] wire161;
  reg [(5'h14):(1'h0)] reg176 = (1'h0);
  reg [(2'h3):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg171 = (1'h0);
  reg [(4'hb):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg168 = (1'h0);
  reg [(3'h5):(1'h0)] reg167 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  assign wire161 = ((wire157 - {$signed((|wire157))}) ?
                       (8'hba) : $signed((&$signed($signed(wire159)))));
  assign wire162 = wire161;
  assign wire163 = ((wire158[(3'h4):(1'h1)] ?
                       wire160[(2'h2):(1'h1)] : (+wire160)) ^ ($unsigned(((wire159 ?
                           wire161 : wire159) ?
                       (wire161 ?
                           wire159 : wire159) : $signed(wire161))) - wire156[(2'h2):(1'h0)]));
  assign wire164 = (+(~^($signed($signed(wire161)) ?
                       wire162[(4'hd):(3'h6)] : {$unsigned(wire162),
                           (wire158 >> wire156)})));
  assign wire165 = {(^~((|(&wire160)) ^ wire164[(2'h3):(2'h2)])),
                       $unsigned(wire157[(1'h1):(1'h0)])};
  assign wire166 = (-($unsigned(wire159) & wire163[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ((^$signed($unsigned(wire163[(2'h2):(1'h1)]))))
        begin
          reg167 <= (((wire160 ?
              {wire156[(1'h1):(1'h1)]} : $signed((wire156 ?
                  (7'h42) : wire163))) | {$signed(wire156),
              $unsigned(wire157)}) >= (^wire162[(4'hc):(1'h1)]));
          reg168 <= ($signed({(wire158[(4'h9):(3'h4)] ^ $unsigned((8'hba))),
              ((wire158 * wire162) ?
                  {reg167} : $signed((8'haa)))}) ~^ ((^~$signed((wire164 ?
                  wire163 : wire166))) ?
              (~&$unsigned(wire158[(2'h3):(1'h0)])) : wire158[(4'h9):(3'h7)]));
          reg169 <= (^{{reg167[(2'h3):(2'h3)]}});
          reg170 <= (reg167[(1'h0):(1'h0)] ?
              $unsigned(wire161[(1'h1):(1'h1)]) : wire165[(5'h10):(3'h7)]);
        end
      else
        begin
          if ($signed($signed($signed(({wire159, wire157} ?
              $signed(wire163) : (wire166 > (8'hb7)))))))
            begin
              reg167 <= (+(((wire166 ? $unsigned(reg167) : (+(8'hb0))) ?
                  $unsigned(wire159) : wire160[(4'h9):(3'h5)]) <<< wire160));
              reg168 <= wire159[(2'h3):(1'h1)];
              reg169 <= (|{wire156});
              reg170 <= {{wire160[(3'h5):(2'h3)],
                      $signed(({reg169} ^ wire161))},
                  wire156};
              reg171 <= (|wire160[(2'h2):(1'h1)]);
            end
          else
            begin
              reg167 <= wire162;
              reg168 <= reg169;
            end
        end
      if ($unsigned((wire159[(1'h1):(1'h0)] ?
          $unsigned(reg169[(3'h6):(1'h1)]) : wire163[(1'h0):(1'h0)])))
        begin
          reg172 <= $unsigned((+{(|(^wire163)), (8'h9e)}));
          reg173 <= reg172;
          reg174 <= ((8'haa) * $signed((8'hbd)));
        end
      else
        begin
          reg172 <= (+({($unsigned(wire159) ?
                  wire166[(3'h5):(3'h5)] : $signed(wire163))} ^ {(^$unsigned(wire161)),
              (reg171 ? (|wire159) : (wire163 ? reg174 : wire163))}));
          reg173 <= (~&$unsigned(wire161));
        end
      reg175 <= $unsigned(reg174);
      reg176 <= reg172[(2'h3):(1'h0)];
    end
  assign wire177 = $unsigned({(~{$unsigned((8'haf))})});
  assign wire178 = ((8'ha0) ?
                       $unsigned(wire177[(2'h3):(2'h3)]) : {(~&wire161[(4'h9):(3'h4)])});
  assign wire179 = (!$unsigned(wire163));
  assign wire180 = ((wire165 << $signed((~|(!wire177)))) ~^ ((~wire156) ?
                       ((~^(+(8'hb1))) ?
                           ({wire179} == $signed(wire161)) : (((8'hb5) ?
                               wire177 : wire158) < reg171[(3'h6):(3'h6)])) : ({{wire158}} ?
                           wire162 : $signed(wire161[(3'h4):(1'h0)]))));
  assign wire181 = ((-($signed((^~wire163)) & $unsigned($signed((8'hba))))) + ((8'ha2) >>> (~$unsigned((reg168 ?
                       (8'ha7) : wire180)))));
  assign wire182 = wire181;
  assign wire183 = wire160;
endmodule

module module125
#(parameter param151 = ((((((8'hb5) ? (8'hb2) : (8'ha3)) || (8'hbf)) <= (~^((8'hb2) ? (8'hbf) : (8'hba)))) ? ((((8'hbf) ? (8'haf) : (8'hb3)) == ((8'h9c) ? (8'hbd) : (8'hb6))) == (~(&(8'ha4)))) : ((^~{(8'hbc), (8'ha7)}) && (((8'hb2) ? (8'hb5) : (8'ha5)) ? ((8'hb1) && (8'hbd)) : {(8'hb2)}))) * {(({(8'ha8), (8'hb0)} ? ((8'ha9) ? (8'hbf) : (8'hb7)) : (8'hb1)) ^~ ((~&(8'ha4)) ? ((8'hb1) ? (8'haa) : (7'h41)) : ((8'haf) ^ (8'ha8))))}), 
parameter param152 = ({(~^((param151 ? param151 : param151) ? ((8'h9f) ? param151 : param151) : (param151 ? param151 : param151)))} ? (!(((|param151) ? param151 : {param151, param151}) ? (~&(~^(8'haa))) : (~&(param151 ? param151 : param151)))) : ((!(&param151)) ? param151 : ({(^param151)} ? {(param151 & param151), (param151 ~^ param151)} : (-(^~param151))))))
(y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire130;
  input wire [(5'h14):(1'h0)] wire129;
  input wire signed [(5'h11):(1'h0)] wire128;
  input wire [(3'h5):(1'h0)] wire127;
  input wire signed [(2'h3):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire148;
  wire [(3'h6):(1'h0)] wire147;
  wire [(3'h7):(1'h0)] wire146;
  wire signed [(3'h6):(1'h0)] wire145;
  wire [(3'h5):(1'h0)] wire144;
  wire signed [(5'h15):(1'h0)] wire134;
  wire [(4'h8):(1'h0)] wire133;
  wire [(4'hb):(1'h0)] wire132;
  wire [(3'h5):(1'h0)] wire131;
  reg [(4'hb):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg135 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire131 = wire128;
  assign wire132 = wire131;
  assign wire133 = $unsigned((8'h9c));
  assign wire134 = wire130;
  always
    @(posedge clk) begin
      reg135 <= {$signed(wire127)};
      reg136 <= wire130;
      reg137 <= wire129[(5'h11):(1'h1)];
      reg138 <= wire134;
      if (wire131[(3'h5):(2'h3)])
        begin
          reg139 <= $unsigned(wire128[(3'h7):(1'h0)]);
          reg140 <= {{($signed(((8'hb7) >> wire133)) ?
                      $unsigned($signed(reg137)) : wire131),
                  {reg138[(2'h3):(2'h3)]}}};
          reg141 <= (($signed($signed((wire127 ? (8'hb8) : reg135))) ?
              ((reg135[(3'h6):(1'h1)] ?
                      (reg138 ? (8'ha4) : wire134) : (reg137 <<< reg137)) ?
                  ((wire129 <<< reg137) ?
                      $unsigned((7'h42)) : (reg135 > (8'h9d))) : (((8'ha1) ?
                      wire133 : wire126) ^~ (wire130 ?
                      reg136 : reg140))) : ((|$unsigned(wire129)) && ((wire129 >> wire126) ?
                  (~wire132) : wire127))) ^~ ({$unsigned((wire126 ~^ reg140))} ?
              ($signed((^wire133)) ?
                  $unsigned($unsigned(reg136)) : ((wire130 ?
                      wire132 : (8'h9e)) > wire129[(1'h1):(1'h1)])) : $signed($unsigned((|reg137)))));
          reg142 <= $signed(wire133[(3'h5):(3'h4)]);
          reg143 <= (&((($unsigned(wire129) >> wire127[(3'h4):(1'h1)]) ?
              reg135[(3'h7):(2'h3)] : (~^reg140[(4'ha):(3'h7)])) * (wire131 ?
              wire129 : reg136)));
        end
      else
        begin
          reg139 <= ((($unsigned($unsigned(wire129)) < $unsigned($signed((8'hb5)))) ?
                  ((8'hae) || (wire130[(5'h11):(4'hd)] == {wire129,
                      wire131})) : $signed({reg139})) ?
              wire133 : reg139[(4'h9):(2'h2)]);
          reg140 <= $unsigned(reg139[(1'h1):(1'h1)]);
          reg141 <= (8'hbd);
        end
    end
  assign wire144 = ((({reg143[(4'ha):(2'h2)]} ?
                           wire126[(1'h0):(1'h0)] : reg140[(5'h11):(4'ha)]) ^~ reg143) ?
                       $unsigned(((^~$unsigned(reg139)) + {reg135,
                           (reg135 ? reg136 : wire133)})) : reg138);
  assign wire145 = $signed((wire133 == (~^(wire131[(3'h5):(1'h1)] && (reg140 << reg136)))));
  assign wire146 = {((wire128 ? (&wire144) : $unsigned(reg136)) >> (^~({reg140,
                           reg141} && (reg142 > wire134))))};
  assign wire147 = wire131[(1'h1):(1'h1)];
  assign wire148 = (wire130[(4'he):(4'hd)] ^~ reg140);
  assign wire149 = ($signed((^{(wire133 < wire126)})) != $unsigned(($unsigned(wire130) ?
                       wire132 : $unsigned($signed(wire146)))));
  assign wire150 = wire144;
endmodule

module module46
#(parameter param100 = (((({(8'h9c)} < (-(8'h9e))) <= ({(8'h9f)} ? ((8'hab) * (8'h9e)) : (+(8'hbb)))) ? ((((8'hbc) ? (7'h43) : (8'hb0)) & ((8'hbf) ? (8'hb9) : (8'hbb))) > (((8'ha6) >= (8'hbc)) << {(8'h9d)})) : {((+(8'had)) << {(8'h9c), (8'hb6)}), ((+(8'hb3)) < (^~(8'h9f)))}) <= ({(~(7'h42)), ((~(8'hae)) ? ((8'ha7) ^ (8'hb0)) : {(8'hb3), (8'ha0)})} ? (^(|((8'hae) >>> (8'ha8)))) : ((~&{(8'haa), (8'hac)}) >= (&((8'hbb) >= (8'ha2)))))))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h23d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire51;
  input wire signed [(3'h6):(1'h0)] wire50;
  input wire signed [(3'h7):(1'h0)] wire49;
  input wire signed [(4'hb):(1'h0)] wire48;
  input wire [(5'h12):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire52;
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire83,
                 wire82,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire61,
                 wire60,
                 wire52,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg81,
                 reg80,
                 reg79,
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
                 reg62,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire52 = $unsigned((!(wire47[(3'h7):(2'h2)] ?
                      (8'haa) : ($signed(wire50) ?
                          wire47[(5'h11):(5'h10)] : {wire48, wire47}))));
  always
    @(posedge clk) begin
      reg53 <= {$unsigned((((&wire51) ? wire51 : (~|wire49)) ?
              (~&wire48[(2'h3):(2'h2)]) : wire51[(3'h6):(1'h0)])),
          $unsigned(((wire48[(3'h4):(1'h1)] ?
              $unsigned(wire51) : (wire48 ? (8'h9d) : wire50)) ~^ (wire50 ?
              (~&wire47) : (wire48 > (8'hbe)))))};
    end
  always
    @(posedge clk) begin
      reg54 <= (wire49[(3'h4):(1'h1)] ?
          (reg53[(3'h5):(3'h4)] ?
              $signed((-(wire51 ?
                  wire51 : wire49))) : (($unsigned(wire48) == $unsigned(wire51)) - $signed($unsigned(wire48)))) : ((^$signed((wire50 != wire48))) ?
              wire48[(3'h4):(3'h4)] : ((!(~^wire52)) ?
                  $signed(reg53[(1'h1):(1'h0)]) : wire48)));
      if (wire52)
        begin
          reg55 <= {($unsigned((8'ha0)) ?
                  $unsigned(((^~wire48) ?
                      (reg53 ?
                          (8'hbe) : wire49) : wire52)) : $signed(($unsigned((8'hbc)) == $signed((8'h9c)))))};
          reg56 <= ((reg55[(5'h10):(4'hb)] ?
                  wire48[(4'h8):(3'h5)] : {$signed((^reg54)),
                      wire52[(3'h4):(1'h1)]}) ?
              (wire49[(2'h3):(1'h1)] ?
                  $signed($unsigned(wire50)) : ((^~reg53[(2'h2):(1'h1)]) ?
                      (8'haf) : {$unsigned(wire50)})) : ((|(wire51 ^ (~&reg53))) ?
                  ($unsigned((wire47 ?
                      (8'ha8) : wire47)) >>> $signed((wire50 <<< reg53))) : (8'ha8)));
          reg57 <= (^~$signed($unsigned({(reg53 ? reg56 : wire50)})));
        end
      else
        begin
          reg55 <= $unsigned((|(($unsigned(reg57) + wire47) <= $signed((~^reg53)))));
          reg56 <= (reg53[(4'h8):(3'h5)] ^~ (reg57[(1'h0):(1'h0)] <= {($signed(reg55) ?
                  {wire51, wire51} : (!reg53)),
              (+(wire50 - reg53))}));
          reg57 <= {(wire48 ? wire52 : {(8'ha4)})};
        end
      reg58 <= $signed({{$unsigned((wire51 - wire52))},
          ((~&((8'h9f) << wire50)) <<< ({wire48} >>> reg56[(4'ha):(3'h4)]))});
      reg59 <= (8'hb9);
    end
  assign wire60 = ({(-$signed($signed(reg54)))} ?
                      $unsigned(({(^~wire48)} >>> $unsigned(reg55[(1'h0):(1'h0)]))) : (($unsigned((&wire49)) ?
                              reg54 : reg58[(3'h6):(1'h1)]) ?
                          $signed(wire50[(1'h1):(1'h1)]) : $signed(reg58)));
  assign wire61 = {((({wire52, reg53} - reg56[(2'h2):(1'h1)]) ?
                              wire60[(4'h9):(1'h1)] : (8'hb3)) ?
                          reg59[(1'h0):(1'h0)] : reg53)};
  always
    @(posedge clk) begin
      if (reg57)
        begin
          reg62 <= (8'h9e);
        end
      else
        begin
          reg62 <= (reg62 <= {(+reg56), (8'ha3)});
          reg63 <= reg54;
          if ($unsigned(reg57[(1'h0):(1'h0)]))
            begin
              reg64 <= reg63;
            end
          else
            begin
              reg64 <= wire60;
            end
          reg65 <= wire60[(2'h2):(2'h2)];
          reg66 <= wire48;
        end
      reg67 <= ($signed({$unsigned((^reg57))}) ?
          wire61 : (-(wire48 ? (~^{(8'hb5)}) : (+$signed(reg56)))));
      reg68 <= (reg65 ?
          ((((reg54 ? wire49 : (8'ha8)) && (8'hbf)) ?
              $signed((^~(7'h41))) : ($signed(wire47) == (reg58 ^ reg57))) & (reg58[(3'h6):(3'h5)] ?
              ((reg59 ?
                  (8'ha0) : reg66) - reg62) : $signed((8'haa)))) : (wire52 ?
              wire61 : (((^(8'hba)) << (+wire60)) >> $signed((|reg63)))));
      if ((((($unsigned(reg68) >= $signed(wire48)) ?
              (&wire61[(2'h2):(2'h2)]) : $signed(reg58)) ?
          $unsigned(reg54) : ((~(-wire51)) ^~ {wire48})) + ($signed(reg65) << (8'hae))))
        begin
          reg69 <= $signed((+((reg63 ? wire47 : $signed(wire51)) << {reg54})));
          reg70 <= (~&(wire61[(2'h3):(2'h3)] ^~ (reg69[(2'h2):(1'h1)] <= $unsigned((~reg59)))));
          reg71 <= ((&(-$signed($signed(reg63)))) <= $signed(reg53[(1'h1):(1'h1)]));
          reg72 <= $unsigned((~&$unsigned(wire61[(2'h3):(1'h0)])));
        end
      else
        begin
          reg69 <= wire51;
          reg70 <= $signed(($signed(wire60[(2'h3):(1'h1)]) - reg72));
          reg71 <= (-(|(reg59 ? (~|(~wire52)) : reg65[(4'h8):(2'h3)])));
          if ((^$signed($signed(wire60))))
            begin
              reg72 <= ({(!$unsigned(reg65)),
                  ((+(reg67 >= reg55)) ?
                      {(~&reg69)} : (8'ha4))} >= $unsigned($signed(({reg58,
                  wire47} >>> {(8'hac), reg54}))));
              reg73 <= reg63;
            end
          else
            begin
              reg72 <= (^$signed($unsigned((wire47 <= (^~reg55)))));
              reg73 <= $unsigned($signed((8'hb0)));
            end
        end
    end
  assign wire74 = reg56;
  assign wire75 = reg73[(4'he):(4'ha)];
  assign wire76 = wire75;
  assign wire77 = {reg59[(1'h0):(1'h0)]};
  assign wire78 = wire75[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg79 <= $unsigned(wire50);
      reg80 <= reg56;
      reg81 <= {wire60[(4'h8):(1'h1)],
          ({$signed((wire47 ? reg68 : reg71))} || $unsigned((~^(reg57 ?
              reg57 : reg73))))};
    end
  assign wire82 = (wire49[(3'h7):(2'h2)] != $unsigned(wire60[(3'h6):(1'h0)]));
  assign wire83 = $unsigned(((!wire75[(4'hc):(4'h9)]) << $unsigned($signed($signed((8'hb0))))));
  always
    @(posedge clk) begin
      reg84 <= $unsigned(((|{(wire61 <<< reg54)}) << (reg63 ?
          reg67[(3'h6):(3'h4)] : ($signed(reg57) ? (^(8'ha2)) : (~|wire61)))));
    end
  always
    @(posedge clk) begin
      reg85 <= (reg67 || (^~$signed($unsigned((~reg54)))));
      if ($signed((((|(~^reg80)) <= reg57[(2'h3):(1'h1)]) ?
          (wire49[(3'h6):(2'h3)] ?
              $signed({(8'ha0), reg64}) : reg80) : wire47[(4'hc):(1'h0)])))
        begin
          reg86 <= reg59;
          reg87 <= ((~|reg62) >> wire48);
          if ($unsigned((reg79 >= (~|wire48))))
            begin
              reg88 <= ($signed(reg73) ?
                  $unsigned(((|$signed(reg87)) ?
                      $unsigned(wire52) : {$unsigned((7'h40)),
                          $unsigned((8'ha3))})) : wire48[(4'hb):(1'h1)]);
              reg89 <= {reg72[(3'h4):(1'h1)], reg56};
              reg90 <= ((+$unsigned($signed((-reg67)))) << (!$signed({{reg72,
                      reg73}})));
              reg91 <= (~&(+(-$signed(reg64[(3'h4):(1'h0)]))));
            end
          else
            begin
              reg88 <= (^$signed((8'h9c)));
              reg89 <= ((wire51[(2'h2):(1'h1)] ?
                  reg73[(4'hd):(3'h4)] : wire61[(1'h0):(1'h0)]) <<< ($unsigned((~&(reg88 ?
                  reg89 : reg89))) * reg79));
              reg90 <= reg81[(3'h4):(2'h2)];
              reg91 <= reg65;
            end
          if ($unsigned(wire83))
            begin
              reg92 <= $unsigned(({wire76[(3'h7):(3'h6)]} ?
                  (!$signed(wire77)) : $unsigned({(~&reg88)})));
              reg93 <= reg81[(3'h6):(3'h5)];
              reg94 <= $unsigned($unsigned(((reg66[(3'h4):(3'h4)] ?
                  reg59[(1'h0):(1'h0)] : (reg79 ?
                      reg87 : wire78)) ^ $unsigned(reg58[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg92 <= ($unsigned(reg85[(4'hd):(4'h9)]) ?
                  {((-reg55) == $unsigned((reg92 ? reg90 : reg55)))} : reg63);
              reg93 <= reg90;
              reg94 <= wire47[(2'h2):(1'h1)];
              reg95 <= $unsigned(((8'hb6) ?
                  $unsigned($signed($signed((8'ha3)))) : reg67));
              reg96 <= (!(~reg92));
            end
          reg97 <= $unsigned(reg65);
        end
      else
        begin
          reg86 <= (reg63 >> wire77[(3'h7):(2'h3)]);
          reg87 <= ((((-$unsigned(wire83)) ^ $signed((reg71 ? reg69 : reg72))) ?
              reg53 : (~^(|(+wire49)))) << {reg94,
              (~^{(!reg67), reg97[(3'h5):(2'h3)]})});
        end
    end
  assign wire98 = ((~^(!wire61[(2'h3):(1'h0)])) ?
                      $signed(reg93[(1'h0):(1'h0)]) : (^~reg63[(4'hf):(4'hf)]));
  assign wire99 = {($unsigned((!{wire49})) - $unsigned((!wire83))),
                      {({(&reg63)} <= (~^{reg81, reg91}))}};
endmodule
