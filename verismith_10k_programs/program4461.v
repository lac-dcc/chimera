module top
#(parameter param227 = (~|((~(((8'hb1) ? (7'h41) : (8'hb3)) ? {(8'ha2), (8'ha3)} : (^(8'hbe)))) ? ((~^((8'h9d) ? (8'h9d) : (8'ha2))) <<< (((8'haf) ? (8'ha0) : (8'hac)) && (&(8'ha2)))) : (((^~(8'hab)) != {(8'hbf), (8'haf)}) ? (((8'hbd) ? (7'h43) : (7'h43)) ? (-(8'ha5)) : (|(8'ha6))) : (((8'h9d) ? (8'ha9) : (8'h9c)) ? {(8'hbd)} : ((8'hb6) ? (8'hae) : (8'hb2)))))), 
parameter param228 = ((8'ha4) != (((8'hb6) - ((param227 >= param227) + (param227 > param227))) ^~ (~|(~^(param227 ? param227 : param227))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire226;
  wire [(5'h13):(1'h0)] wire224;
  wire [(3'h4):(1'h0)] wire223;
  wire signed [(4'ha):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire221;
  reg signed [(5'h14):(1'h0)] reg225 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  assign y = {wire226,
                 wire224,
                 wire223,
                 wire131,
                 wire56,
                 wire16,
                 wire17,
                 wire54,
                 wire221,
                 reg225,
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
                 reg4,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($unsigned($signed(({wire0} ?
              $unsigned(wire1) : (wire0 ? (8'haf) : wire2)))) ?
          {wire3[(5'h14):(5'h14)]} : ($signed((wire0 > (wire3 ?
              wire1 : wire1))) <<< (~|wire2)));
      reg5 <= wire1[(3'h7):(2'h3)];
      reg6 <= $signed((8'hbc));
      reg7 <= {(wire0 != $unsigned(({reg4} ? (&wire3) : $unsigned(wire1)))),
          wire3};
      if (reg5)
        begin
          if ({(~^({(8'hbb)} ?
                  {$signed(wire0), (reg4 ? reg5 : wire1)} : (&(~|reg6))))})
            begin
              reg8 <= ($unsigned(({wire1, $unsigned((8'had))} ?
                  $signed(reg7[(3'h5):(3'h4)]) : $unsigned(reg6))) == ($signed({(reg6 ~^ wire2)}) ?
                  {wire3} : (&({(8'h9c), (8'h9d)} ?
                      (reg7 ? reg4 : (8'hb1)) : {reg6}))));
              reg9 <= reg7[(1'h0):(1'h0)];
            end
          else
            begin
              reg8 <= (~($signed($signed(reg5)) >= ($unsigned($unsigned(wire1)) ?
                  (wire3 ? (^~reg5) : (&reg9)) : (~reg4[(3'h7):(3'h4)]))));
              reg9 <= $unsigned(reg4);
              reg10 <= reg5[(3'h7):(2'h2)];
              reg11 <= (^(8'hb7));
              reg12 <= $unsigned(($signed($unsigned(reg9[(5'h13):(1'h0)])) || (((-(8'hb6)) >= $signed(reg10)) ?
                  reg9 : $signed($signed((8'hb5))))));
            end
          if ($signed($unsigned({(((7'h42) & wire2) ?
                  wire0[(1'h1):(1'h1)] : $unsigned(reg8)),
              (+reg9[(4'h8):(3'h5)])})))
            begin
              reg13 <= wire3[(3'h5):(1'h0)];
              reg14 <= (^{$signed((~&$unsigned((8'hb2)))),
                  $signed((~{reg12}))});
              reg15 <= reg4[(4'hb):(3'h6)];
            end
          else
            begin
              reg13 <= $unsigned((^~reg13[(4'ha):(4'h9)]));
            end
        end
      else
        begin
          reg8 <= (~^$signed((8'ha9)));
          reg9 <= ($signed($signed(($unsigned(reg11) <<< $unsigned(reg5)))) ?
              reg4 : $signed((^~wire0[(3'h6):(2'h3)])));
          reg10 <= reg10;
          if ($signed((($unsigned({reg13, reg15}) < ((wire0 > reg9) << {(8'hab),
              reg12})) + $unsigned(((^wire2) <<< (reg7 ? reg6 : wire3))))))
            begin
              reg11 <= $unsigned($unsigned($signed($unsigned((reg10 <<< reg10)))));
            end
          else
            begin
              reg11 <= $signed((~$signed(({reg5, reg7} ?
                  (reg4 * reg8) : (~|reg13)))));
            end
          if (reg8)
            begin
              reg12 <= wire0;
              reg13 <= ((~^{((-wire2) ?
                      (reg14 ? reg11 : wire2) : $unsigned(reg10)),
                  reg14[(5'h14):(4'hc)]}) >> $signed($signed((((8'ha5) | wire1) ?
                  $unsigned((8'h9f)) : wire0[(3'h7):(1'h0)]))));
              reg14 <= reg4;
              reg15 <= {$signed(wire1[(3'h6):(2'h3)])};
            end
          else
            begin
              reg12 <= reg9[(5'h12):(4'hd)];
              reg13 <= (wire1 ?
                  (({$unsigned(reg14),
                      $signed(reg14)} > wire0[(2'h2):(2'h2)]) > reg8) : (8'hb6));
              reg14 <= $signed(((!{reg11[(3'h5):(1'h1)]}) ?
                  (+reg13) : (8'haa)));
              reg15 <= ((^(reg9[(4'hb):(4'ha)] == $unsigned((reg8 ?
                      reg5 : (8'had))))) ?
                  reg11[(3'h4):(1'h0)] : (reg4 ?
                      ((^~wire0) ?
                          reg6[(3'h4):(2'h2)] : $unsigned((wire3 ?
                              reg11 : reg12))) : reg9));
            end
        end
    end
  assign wire16 = (($unsigned(($unsigned(reg13) * $unsigned(reg10))) < (((reg6 ?
                          wire3 : reg13) >> $unsigned(reg9)) && $signed($signed(reg6)))) ?
                      ($unsigned($unsigned((|reg13))) < $signed(reg15[(2'h2):(2'h2)])) : (~&(-$unsigned(reg13[(4'h9):(3'h7)]))));
  assign wire17 = (~(~^(~|wire2[(1'h0):(1'h0)])));
  module18 #() modinst55 (.wire20(reg5), .wire19(wire17), .wire22(reg12), .y(wire54), .clk(clk), .wire21(reg11));
  assign wire56 = {(~&(({reg14} ?
                          $signed(wire17) : (reg12 ?
                              reg9 : reg10)) >>> ((~|reg8) ?
                          $signed(wire3) : (wire54 ? reg13 : wire0))))};
  always
    @(posedge clk) begin
      reg57 <= reg15;
      reg58 <= $unsigned($signed(wire1));
      reg59 <= reg57[(4'h9):(4'h9)];
      reg60 <= wire3;
    end
  module61 #() modinst132 (.wire62(reg13), .y(wire131), .wire63(reg11), .wire65(wire1), .clk(clk), .wire64(reg10));
  module133 #() modinst222 (.y(wire221), .wire138(reg12), .clk(clk), .wire134(reg7), .wire137(wire17), .wire136(reg14), .wire135(reg58));
  assign wire223 = $unsigned($unsigned($unsigned(wire56)));
  assign wire224 = (&((&$signed((reg58 ?
                       reg6 : wire54))) > $signed((-$unsigned(wire1)))));
  always
    @(posedge clk) begin
      reg225 <= {$signed(($signed((reg58 ^ reg6)) ? wire221 : wire2))};
    end
  assign wire226 = reg14;
endmodule

module module133
#(parameter param219 = (!(7'h43)), 
parameter param220 = (~&(param219 ? (((8'hbc) > {param219, param219}) < ((param219 && (8'hb6)) <<< (^param219))) : param219)))
(y, clk, wire134, wire135, wire136, wire137, wire138);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire134;
  input wire [(5'h15):(1'h0)] wire135;
  input wire [(4'h9):(1'h0)] wire136;
  input wire [(4'ha):(1'h0)] wire137;
  input wire signed [(5'h15):(1'h0)] wire138;
  wire [(2'h3):(1'h0)] wire218;
  wire signed [(4'hc):(1'h0)] wire217;
  wire [(5'h12):(1'h0)] wire216;
  wire signed [(5'h14):(1'h0)] wire215;
  wire [(5'h11):(1'h0)] wire214;
  wire signed [(5'h10):(1'h0)] wire185;
  wire [(4'h9):(1'h0)] wire187;
  wire signed [(4'ha):(1'h0)] wire188;
  wire [(4'hc):(1'h0)] wire212;
  reg [(2'h3):(1'h0)] reg189 = (1'h0);
  reg [(3'h5):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg191 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg193 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire185,
                 wire187,
                 wire188,
                 wire212,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 (1'h0)};
  module139 #() modinst186 (.y(wire185), .wire140(wire136), .wire143(wire137), .clk(clk), .wire142(wire134), .wire141(wire138));
  assign wire187 = (8'h9e);
  assign wire188 = $signed(wire134);
  always
    @(posedge clk) begin
      reg189 <= wire185;
      reg190 <= ($unsigned({(8'hbe)}) && $signed($signed(((~wire188) >> wire185[(4'hf):(4'h8)]))));
      reg191 <= wire135[(5'h11):(5'h10)];
      reg192 <= wire134;
      reg193 <= (($unsigned(wire134) ^ wire137) ?
          (~|wire135) : $signed({reg192, (~&wire138)}));
    end
  module194 #() modinst213 (.wire195(wire185), .wire198(wire138), .y(wire212), .clk(clk), .wire197(wire188), .wire196(reg191));
  assign wire214 = wire185;
  assign wire215 = wire188[(3'h7):(3'h6)];
  assign wire216 = $unsigned(wire214);
  assign wire217 = (~$signed((!(~wire137))));
  assign wire218 = (|(8'ha9));
endmodule

module module61  (y, clk, wire62, wire63, wire64, wire65);
  output wire [(32'h1c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire62;
  input wire signed [(2'h3):(1'h0)] wire63;
  input wire [(4'hb):(1'h0)] wire64;
  input wire signed [(4'hc):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire120;
  wire signed [(3'h7):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire106;
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  assign y = {wire130,
                 wire125,
                 wire124,
                 wire121,
                 wire120,
                 wire115,
                 wire66,
                 wire83,
                 wire84,
                 wire106,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg123,
                 reg122,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
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
                 (1'h0)};
  assign wire66 = wire64[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      if ($unsigned($unsigned({$unsigned((8'hb1)),
          (wire62[(2'h3):(1'h0)] ^~ wire64[(1'h0):(1'h0)])})))
        begin
          reg67 <= (wire63 & (&(^wire65[(1'h1):(1'h1)])));
          reg68 <= ({wire65,
              $unsigned($signed((wire66 ? wire66 : wire65)))} & reg67);
          reg69 <= $unsigned({$signed(reg67)});
          reg70 <= ($signed($signed({(reg69 ? wire65 : reg68),
              wire64})) <<< (~&wire63));
          if (wire63[(2'h2):(1'h0)])
            begin
              reg71 <= $unsigned(wire66[(3'h4):(1'h1)]);
              reg72 <= wire63[(1'h1):(1'h0)];
              reg73 <= ({(reg69[(2'h3):(1'h1)] ?
                          $unsigned($unsigned(wire63)) : (|$signed(wire65))),
                      wire65[(2'h3):(1'h0)]} ?
                  wire66[(2'h2):(2'h2)] : ($unsigned(({(8'ha7)} >> (8'h9f))) != ({(+wire62)} >> {(~&reg70),
                      (reg67 ~^ (8'ha3))})));
            end
          else
            begin
              reg71 <= (wire62 ?
                  (({reg72} ?
                          {(reg70 ? reg70 : reg71),
                              (^wire66)} : ($signed(wire65) ~^ (wire63 != wire64))) ?
                      $signed(($unsigned(wire64) == $unsigned(reg71))) : ($signed((reg67 ~^ wire63)) ?
                          ($unsigned(reg68) || (8'hb7)) : (~$unsigned(wire63)))) : reg67);
              reg72 <= ((($signed(((8'ha8) <<< wire63)) ?
                      $unsigned((!wire62)) : $unsigned((reg68 ?
                          wire63 : reg73))) <<< {reg70[(1'h0):(1'h0)],
                      ($signed(reg68) ? (reg70 >>> reg69) : (|wire65))}) ?
                  (^reg70) : (((~^wire62) <= (!((8'hbd) ? reg69 : wire64))) ?
                      reg72 : $unsigned((reg73 + $unsigned(wire62)))));
            end
        end
      else
        begin
          reg67 <= $unsigned((wire62[(2'h2):(2'h2)] ?
              ($signed($signed(wire63)) ?
                  reg72 : (+(8'hb5))) : $unsigned((reg73 ?
                  {reg71} : {reg73}))));
          reg68 <= (($unsigned((((8'hbe) ?
                  wire65 : (8'hbd)) >= wire62)) >= reg71) ?
              reg73[(1'h0):(1'h0)] : ($signed($unsigned((reg68 ?
                  wire65 : reg67))) + reg67[(1'h1):(1'h0)]));
        end
      reg74 <= (($signed(reg70) || $signed(wire62)) ~^ (reg71 ^ wire64));
      if ((wire65[(3'h4):(2'h2)] && $signed(({reg71} ^ ((+wire63) ?
          $signed(wire63) : $signed(wire65))))))
        begin
          reg75 <= {reg72[(2'h2):(1'h0)], reg73[(4'hb):(4'hb)]};
          reg76 <= $unsigned($unsigned(reg71));
          reg77 <= (&(~&wire66[(1'h0):(1'h0)]));
          reg78 <= (|$unsigned(((((8'ha2) ? reg76 : reg70) ?
              $signed((8'h9e)) : $signed(reg73)) <= ((+wire64) ?
              (wire65 * reg75) : (+wire63)))));
          if (reg67)
            begin
              reg79 <= ($signed($unsigned(wire63)) ?
                  $unsigned($unsigned(wire63)) : reg70[(3'h5):(3'h4)]);
            end
          else
            begin
              reg79 <= (^(!reg70));
              reg80 <= ((^~(reg77 ?
                  $unsigned(reg69[(2'h2):(2'h2)]) : reg78[(3'h5):(2'h3)])) != reg74[(3'h5):(1'h1)]);
            end
        end
      else
        begin
          reg75 <= $unsigned((~&{$unsigned((!reg71))}));
          reg76 <= (^~wire65);
        end
      reg81 <= $signed((~^(!(~(reg74 ? reg78 : reg77)))));
      reg82 <= {$unsigned($signed(((-wire65) >>> $signed((8'ha7))))),
          {$unsigned((((8'hbc) ^~ reg80) << reg69)),
              $unsigned($unsigned(wire62[(2'h2):(1'h1)]))}};
    end
  assign wire83 = ((~^$unsigned($signed($signed(reg72)))) <<< $signed($unsigned((&reg82))));
  assign wire84 = (~^($unsigned(reg81) ?
                      reg74[(4'hf):(2'h2)] : $unsigned($unsigned((reg80 * reg75)))));
  module85 #() modinst107 (.wire87(reg77), .wire86(wire64), .wire90(reg74), .clk(clk), .wire89(reg73), .y(wire106), .wire88(reg67));
  always
    @(posedge clk) begin
      if ($signed((~(!(reg74 | (reg76 ? wire66 : wire106))))))
        begin
          reg108 <= ({(^($signed(reg75) - (8'ha1)))} >= wire66[(1'h0):(1'h0)]);
          reg109 <= ((~&(-$signed($unsigned(wire65)))) < (7'h43));
        end
      else
        begin
          reg108 <= ((reg80[(1'h0):(1'h0)] ?
              $unsigned(wire106) : wire106) < (8'h9f));
          reg109 <= $unsigned($signed({(reg73[(3'h7):(3'h4)] ?
                  (~^reg69) : $signed(reg74))}));
          reg110 <= $unsigned((((+{wire66, reg68}) ?
                  $signed($signed(reg75)) : reg81) ?
              (wire106 + (~(reg108 ? reg77 : wire64))) : (((reg72 ?
                          wire84 : reg70) ?
                      reg73[(4'h8):(1'h1)] : (!wire63)) ?
                  {$unsigned(reg82), reg71[(2'h2):(2'h2)]} : ($signed(wire106) ?
                      (-reg69) : reg108[(4'hc):(3'h6)]))));
          reg111 <= (|reg109[(3'h4):(3'h4)]);
          reg112 <= ((((reg68 <<< reg68[(2'h2):(1'h1)]) ~^ ($signed(reg111) >>> (reg76 - wire106))) ?
              (($signed(reg71) ? (&reg69) : $signed(reg70)) ?
                  reg77[(1'h1):(1'h0)] : $unsigned((!reg71))) : (|reg74[(4'hf):(4'he)])) << (reg82 & $unsigned({$unsigned((7'h43)),
              (wire63 > reg72)})));
        end
      reg113 <= $unsigned(reg81);
      reg114 <= $unsigned($unsigned((^wire84)));
    end
  assign wire115 = ((+(+(8'ha2))) ?
                       {({(reg82 ? reg79 : reg112)} > (wire64[(3'h4):(2'h3)] ?
                               reg68 : (reg114 < reg71)))} : (((8'hb6) ?
                           (&wire106) : reg69) >> reg78));
  always
    @(posedge clk) begin
      reg116 <= wire83[(2'h2):(1'h0)];
      reg117 <= (wire106[(4'hb):(2'h3)] ?
          reg76 : $unsigned($signed(wire106[(2'h3):(1'h0)])));
      reg118 <= ({$unsigned({reg74[(5'h11):(3'h6)],
              reg74[(5'h11):(1'h1)]})} >>> (reg114[(3'h7):(1'h1)] == ($unsigned(reg68[(2'h3):(1'h1)]) ?
          ((wire65 + wire106) - {(8'hbf)}) : wire83[(2'h3):(1'h1)])));
      reg119 <= wire66[(1'h1):(1'h0)];
    end
  assign wire120 = reg110;
  assign wire121 = ({(($signed(reg78) > $signed(reg82)) << reg109[(3'h5):(1'h1)])} ?
                       $unsigned((-$unsigned($signed(wire84)))) : wire83);
  always
    @(posedge clk) begin
      reg122 <= {wire63, (^~$unsigned((8'h9c)))};
      reg123 <= (^$signed($signed({(reg71 - reg116)})));
    end
  assign wire124 = ($signed((reg118 ? reg77 : (~|reg72))) ?
                       (|reg81[(3'h6):(2'h3)]) : (reg81 - reg78));
  assign wire125 = (reg111[(2'h2):(1'h1)] ?
                       ((~&$unsigned(reg74)) ^ $unsigned({$unsigned(wire63),
                           $signed((8'hbe))})) : reg67);
  always
    @(posedge clk) begin
      reg126 <= (($signed((7'h44)) <<< (((+reg81) >= $signed(reg81)) ?
              reg72[(1'h1):(1'h1)] : (8'ha7))) ?
          {(8'hb5), {(~(wire120 ^~ reg76)), wire84}} : reg70[(2'h3):(1'h0)]);
      reg127 <= $signed((7'h42));
      reg128 <= $signed(((((~|(8'hbb)) ? $unsigned(wire124) : (^~wire64)) ?
              ((reg111 ? reg76 : wire121) < (~wire65)) : ((reg119 > reg112) ?
                  $signed(wire62) : wire63)) ?
          ($unsigned(((8'ha8) ^ reg118)) ? reg122 : wire66) : reg82));
      reg129 <= (wire65 ? wire84[(1'h0):(1'h0)] : $signed($unsigned(reg123)));
    end
  assign wire130 = reg82[(4'hb):(3'h5)];
endmodule

module module18
#(parameter param53 = (8'hae))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire41;
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 (1'h0)};
  module23 #() modinst42 (wire41, clk, wire20, wire19, wire22, wire21);
  assign wire43 = $unsigned(((({(8'hb3), wire21} ?
                          (wire22 ? wire41 : wire21) : {wire19}) ?
                      $signed(wire21[(1'h0):(1'h0)]) : wire20) >>> (wire21 ?
                      (!((7'h41) >>> wire41)) : wire19[(4'hc):(1'h1)])));
  assign wire44 = wire41[(4'hc):(2'h2)];
  assign wire45 = (~&(^~(-$signed({wire41}))));
  assign wire46 = wire45[(4'h8):(3'h4)];
  assign wire47 = wire22;
  assign wire48 = wire44;
  assign wire49 = (($signed(($unsigned((8'ha4)) >> wire41[(4'hc):(3'h6)])) < wire46[(5'h10):(4'hf)]) <= $signed(({(wire47 >>> wire41),
                      (wire43 - wire44)} << ((wire44 ?
                      wire41 : wire41) ~^ $signed(wire46)))));
  assign wire50 = $unsigned(((^~(~^(^wire43))) ^ wire47));
  assign wire51 = (~|$signed({$unsigned((!wire22)), wire44[(1'h1):(1'h1)]}));
  assign wire52 = wire22[(3'h4):(1'h1)];
endmodule

module module23
#(parameter param40 = (|(({(~|(8'hbd))} ? {((8'hbc) - (8'ha9)), ((8'hac) ? (8'hbe) : (8'h9f))} : ({(8'haf)} ? (+(8'hb6)) : ((8'hbf) + (8'hb1)))) ? (~&(~^(|(8'hb2)))) : (~(((8'hb0) | (7'h42)) - ((8'ha9) ? (8'haf) : (8'h9f)))))))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire26;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire28 = $signed(wire25);
  assign wire29 = (wire27[(1'h1):(1'h1)] >= wire28[(3'h5):(2'h3)]);
  assign wire30 = wire26;
  assign wire31 = $unsigned({(~&(wire30 ? (~&(7'h40)) : $unsigned(wire28))),
                      wire28[(2'h2):(1'h0)]});
  assign wire32 = wire25[(4'h8):(1'h1)];
  assign wire33 = wire28;
  assign wire34 = ($unsigned($signed(wire25[(4'hd):(4'hc)])) ?
                      (^(wire26 >>> $unsigned(wire32))) : (~&(wire26 || $unsigned($signed(wire33)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire32[(1'h0):(1'h0)]))
        begin
          reg35 <= $unsigned((($signed($unsigned(wire31)) && wire27[(1'h0):(1'h0)]) ^~ ($unsigned({wire29,
              wire33}) && $signed($unsigned(wire30)))));
        end
      else
        begin
          if (wire24)
            begin
              reg35 <= $signed(wire33);
              reg36 <= ({$signed($unsigned(wire34[(3'h5):(2'h2)]))} - (reg35[(3'h6):(3'h6)] > wire34[(5'h10):(2'h3)]));
            end
          else
            begin
              reg35 <= $signed(((wire24 - wire34) ?
                  wire31[(2'h2):(1'h1)] : ((~|(wire25 ?
                      wire32 : (8'hab))) - {$signed(reg36)})));
              reg36 <= {wire26};
              reg37 <= (&($signed(wire29) | $signed(wire34[(4'ha):(4'h8)])));
            end
          reg38 <= wire28;
          reg39 <= (+$signed((((|(8'hbe)) ?
                  (~|reg36) : (wire31 ? reg35 : wire26)) ?
              wire25 : $signed($signed(wire27)))));
        end
    end
endmodule

module module85
#(parameter param105 = {(~({((8'ha5) == (8'hbc)), {(8'hb8), (8'ha2)}} ? {((7'h44) * (8'h9d))} : (!(&(8'haf))))), ((-({(8'hb2)} - ((8'hab) ? (8'ha8) : (8'hae)))) * (((|(8'ha1)) >>> {(8'ha6), (8'hb8)}) && ((!(8'ha6)) && {(8'hbe), (7'h40)})))})
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire90;
  input wire signed [(3'h7):(1'h0)] wire89;
  input wire [(4'he):(1'h0)] wire88;
  input wire signed [(3'h5):(1'h0)] wire87;
  input wire [(4'hb):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire91 = $unsigned(wire89[(3'h6):(3'h6)]);
  assign wire92 = wire89;
  assign wire93 = $unsigned((~&(^~(&wire88))));
  assign wire94 = $unsigned(($signed(wire89[(1'h1):(1'h1)]) ?
                      $signed(wire93[(4'h8):(4'h8)]) : $signed(((^~wire93) >> wire89))));
  assign wire95 = $signed($unsigned(((wire86 ?
                      (8'ha4) : (-wire86)) >> {$unsigned((8'hb3)),
                      (wire89 | wire89)})));
  assign wire96 = wire90[(5'h13):(4'hc)];
  assign wire97 = $signed($signed((8'ha5)));
  assign wire98 = wire87;
  assign wire99 = wire97;
  always
    @(posedge clk) begin
      reg100 <= wire93[(4'hd):(3'h7)];
      reg101 <= wire99;
      reg102 <= wire90;
    end
  assign wire103 = (~($unsigned($signed({wire92,
                       wire92})) <= wire99[(3'h4):(1'h0)]));
  assign wire104 = ({((^wire103) ?
                               ((wire89 ?
                                   wire98 : (8'h9d)) + $unsigned((8'h9e))) : {$signed(wire93)})} ?
                       {(((+wire94) && (wire99 >>> wire97)) == (~^(wire90 || reg101)))} : ({(((8'ha3) ?
                                   wire99 : (8'ha7)) <= $signed(wire88)),
                               (wire86[(4'h8):(2'h2)] ?
                                   $unsigned(wire103) : (reg102 == wire103))} ?
                           wire94 : wire95[(4'he):(4'ha)]));
endmodule

module module194
#(parameter param210 = {(((|{(8'haa)}) ? ((^(8'h9e)) != (+(8'haa))) : ({(8'ha3)} ? ((8'hac) <<< (8'hba)) : (~^(8'hb5)))) ^~ ((((8'hb9) ? (7'h42) : (8'hbd)) ? ((8'haf) ? (8'h9c) : (8'haa)) : ((8'hb2) ? (8'hb5) : (8'hae))) ? (~&((8'hab) ~^ (8'haa))) : ((^~(8'hae)) ? ((8'hb8) ? (8'hbf) : (8'hb9)) : (8'hb0)))), {(&(~|(^~(8'hb7)))), {(+{(8'hb1)}), {((8'hb9) ? (8'hac) : (8'haf)), (8'hbe)}}}}, 
parameter param211 = param210)
(y, clk, wire198, wire197, wire196, wire195);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire198;
  input wire signed [(4'ha):(1'h0)] wire197;
  input wire signed [(4'hb):(1'h0)] wire196;
  input wire signed [(2'h3):(1'h0)] wire195;
  wire signed [(4'h8):(1'h0)] wire209;
  wire signed [(4'hb):(1'h0)] wire208;
  wire signed [(4'hb):(1'h0)] wire207;
  wire signed [(4'hc):(1'h0)] wire206;
  wire [(5'h15):(1'h0)] wire205;
  wire signed [(5'h11):(1'h0)] wire204;
  wire [(3'h5):(1'h0)] wire203;
  wire [(3'h5):(1'h0)] wire202;
  wire [(5'h14):(1'h0)] wire201;
  wire [(5'h13):(1'h0)] wire200;
  wire signed [(4'hf):(1'h0)] wire199;
  assign y = {wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 (1'h0)};
  assign wire199 = wire197;
  assign wire200 = wire195[(2'h2):(2'h2)];
  assign wire201 = (wire198 ? wire198 : wire197);
  assign wire202 = ($signed(wire200[(4'hc):(3'h5)]) ?
                       $unsigned($unsigned((wire201 ?
                           (wire201 ^~ wire199) : {wire200,
                               wire201}))) : wire196);
  assign wire203 = $unsigned((~{(8'hb2), wire201[(2'h2):(1'h1)]}));
  assign wire204 = $signed(wire200);
  assign wire205 = ({$signed((^(wire199 ? wire201 : wire200)))} ?
                       {$signed((~&(wire197 ? (8'ha7) : wire201))),
                           $unsigned((^~(wire197 ?
                               wire197 : wire197)))} : wire201);
  assign wire206 = wire200[(4'hc):(4'ha)];
  assign wire207 = wire203[(3'h5):(3'h5)];
  assign wire208 = (((^wire204) ?
                       ((&$unsigned(wire199)) | $signed(wire207[(4'ha):(3'h7)])) : (~&(+$signed(wire197)))) + ($unsigned(({wire202,
                           wire203} ?
                       (~^wire206) : $signed((8'ha6)))) & (^$unsigned($signed(wire198)))));
  assign wire209 = ((wire200 ?
                       {($unsigned(wire208) != wire197)} : ((~^(&wire195)) < $signed($signed(wire205)))) - (^~((wire198 - $signed(wire203)) ?
                       ((wire201 ~^ wire198) ?
                           (wire204 ? wire207 : wire195) : {wire203,
                               wire202}) : wire206)));
endmodule

module module139
#(parameter param184 = (~(+(~^(((7'h41) != (8'had)) ? ((8'ha5) < (8'hb3)) : ((7'h44) ? (7'h41) : (7'h44)))))))
(y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire143;
  input wire [(4'ha):(1'h0)] wire142;
  input wire [(5'h15):(1'h0)] wire141;
  input wire signed [(4'h9):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire183;
  wire [(4'hc):(1'h0)] wire182;
  wire signed [(5'h12):(1'h0)] wire160;
  wire [(4'hb):(1'h0)] wire159;
  wire signed [(4'h9):(1'h0)] wire158;
  wire signed [(4'hc):(1'h0)] wire155;
  wire signed [(3'h4):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire149;
  wire signed [(2'h2):(1'h0)] wire148;
  wire signed [(4'h9):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire signed [(4'hd):(1'h0)] wire145;
  wire [(5'h10):(1'h0)] wire144;
  reg [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(4'ha):(1'h0)] reg180 = (1'h0);
  reg [(5'h15):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg178 = (1'h0);
  reg [(3'h5):(1'h0)] reg177 = (1'h0);
  reg [(2'h3):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg175 = (1'h0);
  reg [(5'h15):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg [(4'hf):(1'h0)] reg172 = (1'h0);
  reg [(5'h10):(1'h0)] reg171 = (1'h0);
  reg [(3'h4):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg [(5'h11):(1'h0)] reg167 = (1'h0);
  reg [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  reg [(2'h2):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg [(3'h6):(1'h0)] reg156 = (1'h0);
  reg [(2'h3):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg151 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire160,
                 wire159,
                 wire158,
                 wire155,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
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
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg157,
                 reg156,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 (1'h0)};
  assign wire144 = $unsigned($signed($signed(wire140[(3'h5):(3'h5)])));
  assign wire145 = {(wire143[(3'h4):(1'h1)] ^ (!$signed(wire141))),
                       (wire142 ?
                           ($unsigned(wire144) ?
                               wire144[(4'h9):(4'h8)] : (wire141 <<< (wire144 & (8'hae)))) : (8'hb8))};
  assign wire146 = ({(8'hb8), $unsigned($signed((wire141 && (8'ha8))))} ?
                       $signed(wire142[(4'h9):(3'h7)]) : $unsigned(wire143));
  assign wire147 = (~^wire142[(3'h5):(1'h1)]);
  assign wire148 = wire142;
  assign wire149 = wire145;
  assign wire150 = ((wire148[(1'h1):(1'h1)] ?
                           wire142 : {((8'hbc) ?
                                   (wire148 <= wire141) : (8'hbf)),
                               (^~wire145[(4'hd):(4'ha)])}) ?
                       ($signed($unsigned((wire149 ? (7'h43) : wire144))) ?
                           {wire142[(4'h8):(3'h5)],
                               (~^$signed(wire147))} : ($signed(wire147) ^ $unsigned((&wire141)))) : wire143[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      reg151 <= (|wire140);
      reg152 <= $unsigned($unsigned({(-{wire140, wire149}),
          $unsigned($signed(wire149))}));
      reg153 <= ((~|{wire147[(1'h1):(1'h1)], (^$unsigned(reg152))}) ?
          $unsigned($unsigned((^~((8'ha1) <<< wire144)))) : wire148[(2'h2):(1'h1)]);
      reg154 <= wire147[(3'h4):(1'h0)];
    end
  assign wire155 = wire149;
  always
    @(posedge clk) begin
      reg156 <= (8'ha5);
      reg157 <= {wire155, reg152[(5'h11):(4'hd)]};
    end
  assign wire158 = ($unsigned({$unsigned(wire148[(1'h0):(1'h0)]),
                       (~|(reg156 ?
                           reg154 : wire141))}) - wire146[(3'h6):(1'h1)]);
  assign wire159 = (~|$signed(wire148));
  assign wire160 = {(reg153[(3'h5):(1'h1)] < ($signed((!wire148)) ?
                           wire141 : ({wire150,
                               (7'h43)} ~^ (wire147 || wire144))))};
  always
    @(posedge clk) begin
      reg161 <= $signed(((reg157[(3'h6):(3'h6)] ?
              wire159 : $unsigned((reg151 == wire143))) ?
          $signed(reg152) : $signed({$signed(reg157)})));
      reg162 <= $signed(($signed((~&wire146[(4'hf):(4'ha)])) ?
          {$signed($unsigned(wire145)),
              $signed(wire143[(3'h7):(3'h5)])} : $unsigned({(8'had)})));
      reg163 <= (({wire159, {(reg153 ? wire145 : (8'ha3))}} ?
          $signed($unsigned({reg161})) : wire148) == ((($signed(reg151) ?
          (^wire155) : ((8'ha5) ?
              (8'hbb) : wire144)) < (8'hbb)) != wire143[(3'h5):(1'h0)]));
      reg164 <= wire143;
      if ($unsigned((~|$unsigned(wire160[(4'ha):(2'h2)]))))
        begin
          reg165 <= wire146[(4'ha):(4'h8)];
        end
      else
        begin
          if (reg156[(2'h3):(2'h3)])
            begin
              reg165 <= wire149[(2'h2):(1'h1)];
              reg166 <= {wire155, reg162};
              reg167 <= $unsigned((-(-$unsigned({wire144, reg151}))));
            end
          else
            begin
              reg165 <= (8'hb7);
              reg166 <= ({((wire143[(3'h4):(2'h2)] ?
                      (wire150 * (8'hab)) : (8'h9e)) && {((8'hb6) ~^ wire140),
                      (8'hb9)})} <<< $unsigned(((8'ha9) ?
                  ($unsigned(wire149) ?
                      $signed(wire142) : {(8'haf)}) : (8'h9d))));
              reg167 <= wire155;
              reg168 <= {((8'haa) & $unsigned({{wire146}, reg156})),
                  {wire158, reg162}};
              reg169 <= {wire155[(4'ha):(4'h8)]};
            end
          reg170 <= $unsigned(reg166[(4'h8):(2'h2)]);
          reg171 <= wire147;
          if ((|$unsigned((^~(reg167[(5'h10):(4'hd)] ~^ (-reg168))))))
            begin
              reg172 <= ($signed(((reg168 - $unsigned(reg157)) < reg162[(2'h2):(1'h0)])) ?
                  {reg151} : reg168);
              reg173 <= (+reg157);
              reg174 <= ($signed((~^reg156[(3'h4):(2'h2)])) ?
                  ((wire145 ? (reg173 <= $signed(wire141)) : (7'h40)) ?
                      ({(reg154 >= wire147),
                          $unsigned(reg165)} ^ (&wire140[(2'h2):(2'h2)])) : ($unsigned((~|reg165)) ?
                          (!(~&wire142)) : reg164[(3'h4):(2'h3)])) : (|((wire141 ?
                          reg154[(1'h0):(1'h0)] : $unsigned(reg163)) ?
                      {$unsigned(reg172)} : $unsigned(reg165[(5'h10):(1'h0)]))));
              reg175 <= wire159[(4'h9):(3'h4)];
            end
          else
            begin
              reg172 <= (~&$unsigned((~$unsigned((^~reg151)))));
            end
          reg176 <= reg162;
        end
    end
  always
    @(posedge clk) begin
      reg177 <= $signed((({{(8'hab), wire144}} >> ($unsigned(reg157) ?
          $signed(reg167) : (|(8'ha0)))) ^ reg167));
      reg178 <= reg161[(2'h2):(1'h0)];
      reg179 <= $signed(reg168[(2'h3):(1'h0)]);
      reg180 <= wire142;
      reg181 <= (^~wire149);
    end
  assign wire182 = ((-(^~($unsigned(wire147) ?
                       reg171 : {reg152}))) | {$signed({$unsigned((8'ha3))})});
  assign wire183 = $signed($unsigned((({wire146,
                           reg165} | (wire142 ^~ reg170)) ?
                       ((reg172 | wire144) ?
                           reg177[(1'h1):(1'h0)] : {reg168}) : (8'hbb))));
endmodule
