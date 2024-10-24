module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire233;
  wire [(4'hf):(1'h0)] wire223;
  wire [(4'hb):(1'h0)] wire222;
  wire [(5'h15):(1'h0)] wire220;
  wire signed [(4'he):(1'h0)] wire219;
  wire [(4'hd):(1'h0)] wire218;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire213;
  reg signed [(4'he):(1'h0)] reg232 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg231 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg229 = (1'h0);
  reg [(5'h11):(1'h0)] reg228 = (1'h0);
  reg [(4'he):(1'h0)] reg227 = (1'h0);
  reg [(5'h14):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg225 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg224 = (1'h0);
  reg signed [(4'he):(1'h0)] reg215 = (1'h0);
  reg [(2'h3):(1'h0)] reg216 = (1'h0);
  reg [(5'h13):(1'h0)] reg217 = (1'h0);
  assign y = {wire233,
                 wire223,
                 wire222,
                 wire220,
                 wire219,
                 wire218,
                 wire101,
                 wire88,
                 wire87,
                 wire85,
                 wire5,
                 wire213,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg215,
                 reg216,
                 reg217,
                 (1'h0)};
  assign wire5 = ((wire2[(2'h3):(2'h3)] | {{wire1, $signed(wire2)},
                         (^wire1[(4'hb):(3'h4)])}) ?
                     ((((^wire3) - wire0) ?
                             wire0[(3'h5):(2'h3)] : wire0[(3'h5):(2'h3)]) ?
                         wire4[(3'h6):(3'h6)] : $unsigned((~^{wire1,
                             wire3}))) : wire1[(4'h9):(3'h4)]);
  module6 #() modinst86 (wire85, clk, wire2, wire4, wire1, wire3);
  assign wire87 = $unsigned(wire3[(2'h3):(2'h3)]);
  assign wire88 = {wire0, wire87};
  module89 #() modinst102 (.wire90(wire88), .wire93(wire5), .wire91(wire4), .clk(clk), .wire92(wire3), .wire94(wire2), .y(wire101));
  module103 #() modinst214 (wire213, clk, wire101, wire3, wire88, wire0, wire4);
  always
    @(posedge clk) begin
      reg215 <= (~$unsigned((8'ha2)));
      reg216 <= wire4;
      reg217 <= ({(wire85 && ((reg216 ? reg215 : (8'hbb)) == {wire1, (8'ha3)})),
          $unsigned(wire4[(2'h2):(1'h0)])} >= ($unsigned(reg215[(3'h6):(1'h1)]) ?
          (&(|wire87)) : (~$signed((8'hb7)))));
    end
  assign wire218 = ($unsigned((reg215[(4'hb):(3'h7)] ?
                       $unsigned(wire3[(4'h8):(3'h4)]) : $unsigned((wire4 >>> wire213)))) ~^ $unsigned(wire85));
  assign wire219 = $unsigned(wire88);
  module181 #() modinst221 (wire220, clk, wire218, reg217, wire1, wire101, wire219);
  assign wire222 = (!((~((reg216 >= wire3) && (wire85 ? wire87 : wire213))) ?
                       (^~(~(8'hb9))) : $unsigned(((^wire2) << (wire3 ~^ wire0)))));
  assign wire223 = wire88;
  always
    @(posedge clk) begin
      if ($signed(wire4))
        begin
          if (({wire222, $signed((!$signed((8'hbe))))} < $unsigned((-wire87))))
            begin
              reg224 <= wire87[(2'h2):(1'h0)];
              reg225 <= wire219[(4'hc):(4'hc)];
              reg226 <= (((reg216[(1'h1):(1'h0)] || (&(wire88 == wire4))) * (^wire213[(4'hf):(4'hf)])) ?
                  {$signed({$unsigned(reg215)}),
                      $signed(($signed(wire0) == (wire2 | wire2)))} : ((~&((8'hbc) ?
                      ((8'ha8) <<< (8'ha0)) : (wire222 == wire101))) <<< {$unsigned(wire88),
                      reg225[(1'h0):(1'h0)]}));
              reg227 <= wire2[(3'h7):(3'h6)];
              reg228 <= (+wire1[(4'ha):(1'h1)]);
            end
          else
            begin
              reg224 <= (+$signed($signed(reg215)));
              reg225 <= wire5;
              reg226 <= (($signed({(|wire88), wire4[(3'h4):(1'h0)]}) ?
                      ($unsigned((^wire218)) || ({wire101, (8'hb6)} || (wire1 ?
                          wire1 : wire2))) : ($unsigned(wire3[(1'h1):(1'h0)]) ?
                          $unsigned((reg224 ?
                              wire85 : wire85)) : $unsigned((wire222 > reg217)))) ?
                  ((wire213 ? (~$signed(wire3)) : $signed((|reg224))) ?
                      wire85[(4'ha):(1'h0)] : (&$signed($signed(reg227)))) : ((wire88 ?
                          (~|(wire85 ? reg217 : wire222)) : ($signed(wire2) ?
                              wire85[(4'hb):(1'h0)] : (^~(8'ha1)))) ?
                      {(-((8'ha3) ?
                              (7'h44) : reg216))} : (~$unsigned($unsigned(wire88)))));
            end
          if (((((8'ha9) ?
              {(~wire2),
                  $signed(reg225)} : {wire87}) + wire222[(4'hb):(2'h3)]) && (((wire213[(5'h14):(3'h4)] ?
              $signed(wire85) : wire222) ^~ $signed((8'hac))) ~^ (8'hba))))
            begin
              reg229 <= (({($unsigned(wire0) == (~wire219)),
                  ($signed(reg225) | (reg224 > wire85))} <<< {((wire220 || (8'hae)) - (wire1 | reg224))}) > wire223[(4'he):(4'h8)]);
            end
          else
            begin
              reg229 <= (reg229 + $unsigned($signed(wire218)));
            end
        end
      else
        begin
          if (($signed(($signed(wire88[(3'h4):(3'h4)]) ?
                  ({reg217} ^ (-(8'hb5))) : (wire85[(3'h7):(3'h4)] ?
                      (~wire3) : $unsigned(wire5)))) ?
              $signed(reg217) : $unsigned((!(&wire85)))))
            begin
              reg224 <= wire213[(2'h2):(1'h0)];
            end
          else
            begin
              reg224 <= reg229;
              reg225 <= wire85[(4'h9):(4'h8)];
              reg226 <= (!$signed((8'ha5)));
              reg227 <= reg216[(1'h1):(1'h0)];
            end
          reg228 <= ($signed($unsigned($unsigned((reg227 && reg215)))) >> $unsigned((7'h40)));
          reg229 <= $signed(((+((|reg215) ^~ (wire87 >= (8'hab)))) ^~ $unsigned(((wire220 ?
                  reg228 : (8'had)) ?
              (|reg216) : (+wire4)))));
        end
      reg230 <= reg224[(3'h4):(3'h4)];
      reg231 <= $signed((wire213 ^ (&wire0)));
      reg232 <= $unsigned((wire5 ?
          {wire1,
              ($unsigned((7'h44)) ?
                  {wire219} : wire1[(4'hd):(2'h2)])} : reg226[(4'hf):(4'hf)]));
    end
  assign wire233 = $unsigned(($signed({{reg217, wire223},
                       $unsigned(reg217)}) != (&$signed(((8'hba) == reg215)))));
endmodule

module module103
#(parameter param211 = ((!((((8'haa) <<< (8'hb7)) != (~&(7'h44))) ? {((8'ha7) && (8'hb0))} : (!(!(8'hb8))))) && ((!(((7'h41) ? (7'h42) : (8'hb2)) ? ((8'hbb) ? (8'hb2) : (8'haf)) : ((8'ha1) ? (8'hbd) : (8'hbe)))) ? ((((8'hac) ? (7'h41) : (8'hae)) ? {(8'h9e)} : {(8'h9d), (8'hb7)}) < (((8'h9e) ? (8'ha2) : (7'h42)) ? (|(8'ha2)) : ((8'ha3) ? (8'hbe) : (8'hae)))) : (~|{(&(7'h44))}))), 
parameter param212 = {(~^((-(param211 ? (8'h9d) : param211)) >>> {(param211 ? param211 : param211)})), (param211 ? param211 : param211)})
(y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire108;
  input wire [(3'h7):(1'h0)] wire107;
  input wire signed [(5'h14):(1'h0)] wire106;
  input wire [(5'h12):(1'h0)] wire105;
  input wire signed [(5'h14):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire210;
  wire [(3'h7):(1'h0)] wire209;
  wire signed [(5'h15):(1'h0)] wire177;
  wire [(5'h14):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire164;
  wire [(5'h14):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire207;
  reg [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(4'hb):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire177,
                 wire166,
                 wire164,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire111,
                 wire110,
                 wire109,
                 wire207,
                 reg180,
                 reg179,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg132,
                 reg133,
                 reg134,
                 (1'h0)};
  assign wire109 = ((wire106 != {wire107}) ?
                       $unsigned(wire108[(4'h9):(4'h8)]) : $unsigned(((8'hb1) ?
                           (!wire104[(5'h13):(5'h10)]) : $signed(wire107))));
  assign wire110 = ({{(((8'ha2) | wire107) ?
                                   wire109[(4'hd):(4'hd)] : wire106[(5'h10):(4'hf)]),
                               wire106},
                           wire105[(4'ha):(3'h4)]} ?
                       {((~$signed(wire108)) ^~ $unsigned($unsigned(wire109)))} : wire108);
  assign wire111 = {((wire105 < (~^wire109)) - ((-wire105[(4'he):(3'h6)]) ?
                           $unsigned(wire106[(3'h5):(3'h5)]) : $signed(wire104)))};
  always
    @(posedge clk) begin
      if (wire107[(3'h6):(2'h2)])
        begin
          reg112 <= (wire106 > ($signed($signed((wire106 ?
                  wire110 : wire105))) ?
              ($unsigned($unsigned(wire105)) ?
                  $signed(wire104[(4'he):(4'hd)]) : wire108) : wire111));
          reg113 <= (wire106 ?
              $signed((^~((wire107 ~^ reg112) <= wire111[(5'h13):(4'he)]))) : $signed($unsigned(wire111)));
          reg114 <= (^wire106[(2'h3):(2'h3)]);
          if ((8'h9c))
            begin
              reg115 <= (-({$signed((~&wire110))} ?
                  $signed((wire111 ?
                      (wire110 ?
                          wire107 : wire111) : $unsigned(reg114))) : (^(wire109 ?
                      $unsigned((8'h9d)) : wire108))));
              reg116 <= $unsigned($unsigned(reg112[(5'h11):(5'h11)]));
            end
          else
            begin
              reg115 <= (wire105 ?
                  (7'h40) : (~(~|$signed((wire105 ? wire109 : wire104)))));
            end
          reg117 <= ($unsigned($unsigned({(^reg114), $signed(wire109)})) ?
              $signed((((~&wire111) == $unsigned((8'hae))) << wire110[(2'h2):(1'h0)])) : wire106);
        end
      else
        begin
          if (wire111)
            begin
              reg112 <= $unsigned({$unsigned((&$unsigned(reg114))),
                  $signed((reg112[(3'h5):(1'h0)] ?
                      (8'hbb) : $unsigned((8'hba))))});
              reg113 <= $signed((8'hab));
              reg114 <= (wire109[(3'h7):(1'h1)] ?
                  $signed(wire109) : ($signed({$unsigned((7'h41))}) >>> (wire104[(4'hb):(3'h5)] >> reg116[(3'h4):(1'h0)])));
              reg115 <= {reg112[(1'h1):(1'h0)]};
            end
          else
            begin
              reg112 <= ((&(reg115[(1'h1):(1'h0)] >= ($signed(reg113) >> (wire106 != wire104)))) ?
                  (wire108[(1'h1):(1'h0)] + ({wire107[(3'h4):(2'h3)]} ?
                      reg114 : (~&(reg115 >> reg113)))) : (8'haa));
              reg113 <= wire111;
              reg114 <= (^~$unsigned((&wire108[(4'hb):(4'h9)])));
            end
          reg116 <= reg116[(1'h0):(1'h0)];
          reg117 <= (8'hbb);
        end
      reg118 <= (!(7'h43));
      if (((~|$signed($unsigned($signed(reg112)))) <<< (wire107[(3'h4):(2'h3)] ~^ $signed(wire110))))
        begin
          if ({((8'ha9) ?
                  $signed((wire107[(1'h1):(1'h0)] | (|(8'haf)))) : (&(8'ha1)))})
            begin
              reg119 <= (~&((^(~{reg117})) << $unsigned(reg116[(2'h3):(2'h2)])));
              reg120 <= (($unsigned(wire109[(3'h4):(1'h0)]) | wire106) & reg119[(4'ha):(2'h3)]);
            end
          else
            begin
              reg119 <= (^~reg118);
            end
          if ($signed(($signed(reg118) > reg114[(3'h5):(3'h4)])))
            begin
              reg121 <= reg113[(1'h0):(1'h0)];
              reg122 <= ((8'hb1) ?
                  wire109[(1'h0):(1'h0)] : ({$unsigned($unsigned(reg120))} ?
                      wire109 : $unsigned(wire106[(4'hb):(3'h4)])));
            end
          else
            begin
              reg121 <= reg120[(1'h1):(1'h0)];
              reg122 <= $unsigned($unsigned(wire111));
            end
          reg123 <= (reg114[(1'h1):(1'h0)] >> ($unsigned($unsigned($signed(wire109))) ?
              (|(reg119 ^ reg116)) : wire105[(5'h11):(4'ha)]));
        end
      else
        begin
          if (reg114[(3'h4):(2'h2)])
            begin
              reg119 <= reg113;
            end
          else
            begin
              reg119 <= wire110;
              reg120 <= $signed(reg118[(2'h3):(1'h1)]);
              reg121 <= reg117;
            end
          reg122 <= (-($signed((~&reg119[(4'hc):(2'h3)])) * ($signed((reg119 << reg116)) <<< (^$signed(reg122)))));
          if ($signed($signed(wire104)))
            begin
              reg123 <= ($unsigned((|$signed(wire107[(2'h3):(1'h1)]))) ?
                  wire106 : $signed({$signed(reg113[(4'hc):(2'h2)])}));
              reg124 <= (&wire110[(1'h0):(1'h0)]);
            end
          else
            begin
              reg123 <= wire105[(5'h10):(4'hc)];
              reg124 <= wire105[(5'h10):(3'h5)];
              reg125 <= $signed($signed((&(wire111[(5'h12):(5'h10)] ?
                  (^(8'hbc)) : $unsigned(wire106)))));
            end
          reg126 <= $signed($signed((~wire108)));
        end
      reg127 <= ((((+$signed(wire108)) & (&(&reg123))) ?
              {(~^(8'hb4)),
                  (wire108 ?
                      wire108 : (reg112 ?
                          (8'hb4) : (8'hae)))} : ($unsigned(reg113) * ((~reg116) + (8'hbc)))) ?
          wire108[(3'h6):(2'h3)] : $unsigned((reg112[(5'h11):(3'h6)] ?
              $unsigned($signed(reg114)) : (((8'had) ? reg116 : reg113) ?
                  (|reg122) : (^wire107)))));
    end
  assign wire128 = {$signed((($unsigned(reg121) ?
                           $signed((8'had)) : wire107) << ((reg114 >> reg116) ?
                           wire104[(4'hf):(4'hc)] : wire108)))};
  assign wire129 = {{$signed(((^reg126) <<< (8'hb6)))}};
  assign wire130 = {wire108[(3'h7):(2'h2)], wire110};
  assign wire131 = (reg124 ~^ ((reg121 ?
                           (|wire129[(3'h4):(2'h2)]) : $unsigned((reg122 - wire107))) ?
                       $signed($signed(reg113[(4'hc):(3'h7)])) : $unsigned((~|$unsigned(reg119)))));
  always
    @(posedge clk) begin
      reg132 <= reg127;
      reg133 <= (8'ha7);
      reg134 <= wire130;
    end
  module135 #() modinst165 (wire164, clk, wire131, wire107, reg114, reg133);
  assign wire166 = (~^($signed((&(reg113 ? wire130 : reg116))) ?
                       reg132[(2'h3):(2'h3)] : reg125[(4'he):(4'h9)]));
  module167 #() modinst178 (.wire169(reg116), .y(wire177), .wire168(reg125), .wire170(reg118), .wire171(wire111), .clk(clk));
  always
    @(posedge clk) begin
      reg179 <= reg112[(4'hc):(3'h7)];
      reg180 <= (wire177[(5'h10):(4'h9)] << reg120);
    end
  module181 #() modinst208 (wire207, clk, reg114, wire177, wire164, wire104, reg122);
  assign wire209 = reg126[(3'h7):(3'h5)];
  assign wire210 = $unsigned(((^$unsigned(reg126[(3'h7):(1'h0)])) >>> $unsigned(reg180[(3'h4):(2'h2)])));
endmodule

module module89
#(parameter param99 = (~(((~^{(8'hb5)}) << (((7'h42) ? (8'hb6) : (8'ha3)) ~^ ((8'hb8) || (8'ha7)))) * {(&{(7'h41), (8'hb4)}), (|((8'hba) * (8'ha4)))})), 
parameter param100 = param99)
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire94;
  input wire [(4'hf):(1'h0)] wire93;
  input wire signed [(3'h6):(1'h0)] wire92;
  input wire signed [(5'h14):(1'h0)] wire91;
  input wire signed [(4'hb):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire95;
  assign y = {wire98, wire97, wire96, wire95, (1'h0)};
  assign wire95 = $signed($signed(wire92));
  assign wire96 = ((({$unsigned(wire94), wire94} ^~ wire92) ?
                      wire93[(4'hd):(4'ha)] : (wire93[(1'h0):(1'h0)] >> $unsigned({wire95,
                          wire92}))) <<< {wire91,
                      (wire95 ? (&(8'h9e)) : (~|$unsigned(wire91)))});
  assign wire97 = (~|(~&{wire92[(1'h0):(1'h0)]}));
  assign wire98 = (~|wire97[(2'h2):(2'h2)]);
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  assign y = {wire83,
                 wire37,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire11 = {((8'ha9) * $unsigned($unsigned(wire9)))};
  assign wire12 = (wire8 ? (|$signed(wire9)) : wire10[(3'h7):(1'h0)]);
  assign wire13 = (!(8'hb2));
  assign wire14 = $unsigned(((($signed(wire13) + (|(8'hbe))) ?
                          wire13[(3'h6):(3'h4)] : wire8[(2'h3):(2'h3)]) ?
                      wire12 : wire11));
  assign wire15 = $signed((&wire14));
  assign wire16 = (&wire10);
  always
    @(posedge clk) begin
      if (wire10)
        begin
          reg17 <= ((&(+wire15)) ?
              wire8[(4'h9):(1'h1)] : (&($signed($unsigned((8'hb4))) ?
                  (wire15[(2'h2):(1'h0)] & {wire9, (8'hbf)}) : {(wire9 ?
                          wire7 : wire8)})));
          reg18 <= {wire15[(4'h8):(3'h4)]};
          reg19 <= $signed(((~|wire13[(5'h13):(4'hf)]) && $signed((wire7 ?
              (8'hbd) : wire15[(3'h6):(3'h6)]))));
          reg20 <= wire10;
          reg21 <= (~&wire15);
        end
      else
        begin
          reg17 <= wire11;
          reg18 <= $unsigned(((8'hb7) < $signed((wire15[(4'hb):(2'h3)] ?
              (~|wire14) : (wire9 + wire14)))));
        end
      reg22 <= wire15[(4'he):(1'h1)];
      reg23 <= $signed(({(^(wire11 > wire16)),
          ((wire15 ? reg20 : wire14) <= (wire9 ?
              (8'hb6) : wire16))} >>> $unsigned($unsigned($signed(wire12)))));
      if (wire11)
        begin
          reg24 <= wire12;
          reg25 <= reg18;
          reg26 <= {({$signed(wire13), reg24[(4'hb):(4'ha)]} ?
                  {$signed((wire11 ? wire14 : reg18))} : $signed(reg24))};
          reg27 <= wire7[(4'h8):(3'h4)];
        end
      else
        begin
          if ($unsigned((&{reg20[(3'h7):(3'h7)],
              (wire14 ? (7'h42) : $unsigned(reg20))})))
            begin
              reg24 <= $unsigned($unsigned((~&$signed($unsigned(wire12)))));
              reg25 <= ((+(wire16 ?
                      reg23 : $signed((wire9 ? reg21 : wire11)))) ?
                  $signed({(wire13[(4'hf):(4'hc)] ? wire14 : {reg22}),
                      ((~&reg17) | $unsigned(reg26))}) : (-{((^wire11) ?
                          wire10 : $unsigned(reg22))}));
              reg26 <= $signed(($signed(((reg24 << (8'hb3)) ?
                      (~wire9) : wire8)) ?
                  (!$unsigned(wire9[(1'h0):(1'h0)])) : (^~wire7)));
            end
          else
            begin
              reg24 <= (reg27[(3'h6):(3'h4)] & wire7[(2'h2):(1'h1)]);
            end
          reg27 <= wire16;
          reg28 <= $signed(($unsigned((^(wire11 ~^ reg24))) ?
              reg22 : $unsigned({(reg27 ? reg20 : wire11), (~reg19)})));
          if ($unsigned(($signed({(+(7'h43)),
              reg28[(5'h10):(4'he)]}) + wire12[(4'ha):(3'h7)])))
            begin
              reg29 <= ((&((~&reg28) - reg22)) + (~wire15));
            end
          else
            begin
              reg29 <= (8'hb1);
              reg30 <= $signed(wire9[(1'h1):(1'h1)]);
              reg31 <= wire8;
            end
          if (reg29)
            begin
              reg32 <= (~&$signed(reg25));
              reg33 <= {(|(wire8[(3'h6):(3'h4)] ?
                      reg21 : $unsigned(((8'ha0) ? (8'hb7) : (8'hb0))))),
                  (!$unsigned(reg18))};
              reg34 <= reg32[(3'h4):(1'h0)];
              reg35 <= wire16[(2'h3):(2'h2)];
              reg36 <= ($unsigned((reg30 ?
                      $signed((reg19 + reg24)) : {(reg29 ? wire15 : reg19)})) ?
                  $signed(((+(wire8 - (7'h44))) >>> wire10)) : ((8'hbe) ?
                      $signed((~^$signed(reg30))) : (wire15 ^ $unsigned((~&wire11)))));
            end
          else
            begin
              reg32 <= (^~wire10[(4'ha):(2'h2)]);
            end
        end
    end
  assign wire37 = (8'hbf);
  always
    @(posedge clk) begin
      reg38 <= (8'hbb);
      if (($unsigned($unsigned($unsigned((wire9 | wire16)))) ?
          $signed($unsigned((&{reg18}))) : ($unsigned($signed({reg18, reg34})) ?
              (~&$unsigned({reg23, reg36})) : (^$unsigned((reg28 ?
                  wire13 : reg24))))))
        begin
          reg39 <= (|reg35[(4'h8):(2'h2)]);
          reg40 <= ((~|(reg39[(2'h3):(2'h3)] != reg27)) ?
              ({(~{reg36}), (^{wire7, (7'h40)})} ?
                  {wire37,
                      reg30} : (^{reg38[(4'ha):(2'h3)]})) : ($signed({reg20}) ?
                  ((reg29[(3'h4):(3'h4)] ? (wire8 << wire8) : wire13) ?
                      wire12 : $unsigned((wire13 < reg22))) : (reg35 ?
                      (~$signed(wire13)) : $unsigned((wire8 > wire12)))));
        end
      else
        begin
          reg39 <= reg36;
          reg40 <= ((wire8 ?
                  $unsigned((~{(8'hba), wire13})) : $unsigned($signed({reg26,
                      reg21}))) ?
              wire10[(2'h3):(2'h2)] : $unsigned({$signed((8'h9f)),
                  (^(reg30 << reg19))}));
          reg41 <= (((8'hbb) ?
              $signed($signed((reg29 > (7'h40)))) : (!($unsigned(reg24) < reg36[(4'hd):(4'ha)]))) ~^ $unsigned((((^~wire37) ?
              (wire37 <<< reg39) : reg19) ^ $signed(reg27))));
        end
      reg42 <= (~$signed($signed((((8'hb6) ? (8'ha0) : reg18) ?
          (!reg24) : reg27))));
    end
  module43 #() modinst84 (wire83, clk, reg30, reg19, wire13, wire11);
endmodule

module module43
#(parameter param81 = (+{((((8'ha4) >>> (8'haa)) | ((8'ha9) << (8'h9c))) * (~&(8'hba))), (({(7'h41), (8'hbc)} == ((8'hbe) ? (8'hb4) : (8'ha9))) ? {((8'h9e) ^ (8'hb8))} : {((8'hac) ? (8'hbe) : (8'ha5)), {(8'hb5), (8'hb9)}})}), 
parameter param82 = (((((param81 ? param81 : param81) >= param81) ? param81 : ({(8'haf)} <= (&(8'ha4)))) ? (({param81, param81} ? {param81, (8'h9c)} : (param81 ? param81 : (8'hb7))) * {((8'hb6) < param81), {param81, param81}}) : (({param81, param81} || {(8'ha8)}) <<< param81)) ? {(((param81 ? param81 : param81) != (param81 ? param81 : param81)) == {(param81 ? param81 : (8'ha2)), (param81 | param81)})} : (8'haa)))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire47;
  input wire [(5'h11):(1'h0)] wire46;
  input wire signed [(5'h15):(1'h0)] wire45;
  input wire [(5'h13):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire80;
  wire [(2'h2):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire48;
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire48 = $unsigned({(($signed(wire44) << wire44[(2'h2):(1'h0)]) + (-wire45[(3'h7):(1'h1)]))});
  assign wire49 = ({$unsigned(wire48)} & wire46);
  assign wire50 = (~^(wire47[(2'h3):(2'h3)] ?
                      wire45[(1'h1):(1'h1)] : $unsigned($unsigned((~&(8'hab))))));
  assign wire51 = $unsigned((wire47 ?
                      $signed($unsigned((wire44 ?
                          wire47 : (8'had)))) : ((+$signed(wire46)) - $unsigned((~^wire48)))));
  assign wire52 = (^~$signed($signed($unsigned($signed(wire46)))));
  always
    @(posedge clk) begin
      reg53 <= $signed($signed((wire46[(1'h1):(1'h0)] ?
          (wire48 ? $unsigned(wire52) : $signed((8'hac))) : (^~(|wire45)))));
      reg54 <= wire51[(2'h3):(1'h1)];
      reg55 <= ((((wire51 ? (wire50 <<< wire44) : ((8'haa) ^ wire46)) ?
          (^~{(8'h9f)}) : $unsigned((~^wire44))) > $signed($signed(wire51))) + {$signed((^(^~wire44))),
          {{wire48[(5'h12):(1'h0)]}, wire50}});
      if (wire50)
        begin
          reg56 <= (~&$signed((reg54[(3'h6):(2'h3)] == $signed((~^wire52)))));
          reg57 <= ((8'h9d) ?
              $signed(({$unsigned(reg55),
                  ((8'ha2) ? wire51 : wire45)} ^~ $signed({wire49,
                  wire46}))) : ($unsigned($unsigned((~|wire44))) | ($unsigned($signed(wire46)) ?
                  $signed((!(8'hb5))) : wire47[(1'h1):(1'h0)])));
          reg58 <= $signed((8'hb3));
        end
      else
        begin
          reg56 <= {(~|((!(wire50 ? reg58 : wire46)) ?
                  ($unsigned(reg53) ?
                      {wire52} : reg54[(1'h1):(1'h1)]) : ($signed(wire46) ?
                      (wire48 < reg55) : (8'hbf))))};
          reg57 <= ($signed((~|$unsigned($unsigned(wire51)))) ~^ ($unsigned((|reg55[(1'h0):(1'h0)])) ?
              ($signed((wire51 ? (8'hbb) : wire47)) >>> $unsigned((reg56 ?
                  reg53 : wire51))) : (reg54[(2'h3):(2'h3)] ?
                  wire46[(4'hb):(4'ha)] : wire48)));
          reg58 <= $unsigned((($unsigned($unsigned((8'hb5))) ^~ wire44[(4'he):(4'hc)]) - reg54[(5'h10):(4'h8)]));
        end
    end
  assign wire59 = ({$unsigned($unsigned((wire46 || reg54))),
                          ((~$unsigned((8'hb8))) >= reg58[(3'h7):(1'h1)])} ?
                      $unsigned((($unsigned(wire51) << (reg58 - wire44)) ?
                          (wire52[(3'h5):(3'h5)] ?
                              wire51[(4'h8):(2'h3)] : ((8'ha9) ?
                                  wire49 : wire46)) : ($unsigned(wire51) > $signed(wire45)))) : (~&(reg55[(1'h0):(1'h0)] <<< wire48[(5'h10):(4'ha)])));
  assign wire60 = {(((+{(8'haa)}) ?
                              ((reg56 && wire47) ?
                                  (~reg58) : wire52) : (reg53[(4'h8):(3'h6)] ?
                                  ((8'hb6) - reg55) : (wire48 ?
                                      wire48 : wire59))) ?
                          wire46[(3'h4):(1'h0)] : (reg57 ?
                              {(wire50 >= reg54)} : $unsigned(((8'haf) || reg53)))),
                      (~&wire44)};
  assign wire61 = (-{(8'hac)});
  assign wire62 = (~$signed({(^~wire52), wire49}));
  assign wire63 = (8'ha5);
  assign wire64 = {$signed((+(wire46 >>> $signed(wire46)))),
                      wire63[(4'hc):(2'h3)]};
  always
    @(posedge clk) begin
      reg65 <= wire51[(4'hb):(3'h5)];
      reg66 <= {$signed((7'h44))};
      if ((~wire59[(3'h7):(2'h2)]))
        begin
          reg67 <= $unsigned(wire50);
        end
      else
        begin
          reg67 <= $unsigned($signed($signed((wire51 >> wire52[(3'h7):(2'h2)]))));
          reg68 <= (~|({reg54,
              $signed(((8'ha3) ?
                  wire62 : wire52))} >> ($signed((!wire47)) | wire47[(3'h6):(1'h0)])));
          reg69 <= ({$unsigned(wire45[(4'hc):(4'hc)]),
              ((-wire46) ^ reg57)} >>> $signed($unsigned($unsigned((wire64 ?
              reg54 : wire44)))));
          reg70 <= {{reg53}, wire59[(3'h6):(1'h0)]};
          reg71 <= ($signed((((wire49 - wire61) >= (wire47 ?
                  reg54 : wire60)) >> wire63)) ?
              $unsigned(wire60[(2'h2):(1'h1)]) : ({wire45} - (8'hb2)));
        end
      if ($signed(reg56))
        begin
          reg72 <= (wire48[(5'h12):(3'h4)] ?
              ((8'h9c) ?
                  ($unsigned(wire59) ?
                      {(8'hbd)} : (reg56 ?
                          wire60[(2'h2):(2'h2)] : reg55)) : $signed($signed($unsigned(reg58)))) : (reg67 ?
                  $signed($unsigned((wire52 ? wire64 : wire51))) : (8'ha7)));
          reg73 <= ($signed(($unsigned(wire64) > (~&(!wire50)))) ?
              $unsigned((~(&(^wire51)))) : (~^($signed(reg66) + reg72)));
          reg74 <= ({$signed(wire51[(2'h2):(1'h1)])} + $unsigned((8'hb7)));
        end
      else
        begin
          reg72 <= (8'hbf);
        end
    end
  assign wire75 = {wire50};
  assign wire76 = ((-(8'hae)) - $unsigned($unsigned(((wire62 ?
                      wire60 : wire49) >> (8'hb0)))));
  assign wire77 = wire64;
  assign wire78 = reg74;
  assign wire79 = $signed($unsigned($unsigned({reg65})));
  assign wire80 = $unsigned({wire62});
endmodule

module module181
#(parameter param206 = (8'ha3))
(y, clk, wire186, wire185, wire184, wire183, wire182);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire186;
  input wire signed [(4'ha):(1'h0)] wire185;
  input wire [(3'h5):(1'h0)] wire184;
  input wire [(5'h10):(1'h0)] wire183;
  input wire signed [(4'he):(1'h0)] wire182;
  wire [(4'hf):(1'h0)] wire193;
  wire [(5'h11):(1'h0)] wire192;
  wire signed [(5'h11):(1'h0)] wire191;
  wire [(4'h9):(1'h0)] wire190;
  wire signed [(4'h8):(1'h0)] wire189;
  wire [(4'hc):(1'h0)] wire188;
  wire signed [(4'ha):(1'h0)] wire187;
  reg [(5'h13):(1'h0)] reg205 = (1'h0);
  reg [(4'h8):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg200 = (1'h0);
  reg signed [(4'he):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg198 = (1'h0);
  reg [(5'h11):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg195 = (1'h0);
  reg [(3'h5):(1'h0)] reg194 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 (1'h0)};
  assign wire187 = (wire182 ^~ $unsigned(($unsigned({wire183}) ?
                       {{wire182, wire182}} : {wire183[(1'h1):(1'h0)]})));
  assign wire188 = (-($signed(($unsigned((8'hb3)) + $unsigned(wire186))) << wire182));
  assign wire189 = $signed($signed((wire187 + $signed($unsigned(wire184)))));
  assign wire190 = {$signed((8'hb2))};
  assign wire191 = {(((wire182 ^~ (&wire185)) ?
                               (^{wire190,
                                   wire187}) : (wire189 <<< (|wire185))) ?
                           $unsigned((&(^~wire182))) : $unsigned(wire182))};
  assign wire192 = wire189;
  assign wire193 = ({({(8'haa)} ? (+{wire185}) : wire186[(3'h6):(3'h4)]),
                           $signed($signed((wire192 || wire184)))} ?
                       ((($unsigned(wire186) + ((8'haa) ^~ (8'haa))) != (^~wire186)) < $signed(wire185[(2'h2):(2'h2)])) : ({$unsigned($unsigned(wire183)),
                           wire183} > (~$signed($unsigned(wire185)))));
  always
    @(posedge clk) begin
      reg194 <= (($signed((~^$unsigned(wire184))) ?
              ((((8'hb7) | (8'hbf)) != ((8'haa) & wire183)) & $unsigned({wire183,
                  wire187})) : $unsigned($unsigned((wire191 ?
                  wire187 : wire184)))) ?
          ((^~$signed(wire191[(3'h5):(1'h0)])) ?
              (($unsigned(wire187) ? (wire182 > wire191) : $signed(wire193)) ?
                  (+$signed(wire187)) : $unsigned(wire185[(1'h0):(1'h0)])) : ({(wire182 ?
                          wire183 : wire187)} ?
                  wire192 : wire184[(3'h5):(1'h1)])) : $signed($unsigned((wire190 >= wire191))));
      reg195 <= {{(wire192 >> (^~{(8'hb2)})), $signed((-{wire186, wire192}))}};
      if (((wire189 < wire187) ?
          $signed($unsigned($signed(reg194[(2'h3):(2'h3)]))) : $signed(wire192)))
        begin
          reg196 <= (~&$signed(($signed($unsigned(wire186)) ?
              (!(wire192 ? wire191 : wire190)) : $unsigned((&wire187)))));
          reg197 <= (wire186 ?
              $unsigned((~wire188[(3'h4):(2'h2)])) : {(~|wire185)});
          reg198 <= wire185[(4'h8):(3'h4)];
          reg199 <= {(-wire192[(3'h6):(2'h2)])};
        end
      else
        begin
          if ((($signed($unsigned(wire193)) ?
              $signed($signed($signed(wire192))) : reg198[(1'h0):(1'h0)]) << (&$unsigned((!reg199)))))
            begin
              reg196 <= $unsigned(wire187[(3'h4):(2'h2)]);
              reg197 <= ((^(wire192 <<< $unsigned($signed(wire182)))) ?
                  wire189 : {(wire184[(3'h5):(1'h0)] ?
                          (~reg199[(4'h8):(3'h6)]) : (((8'ha0) ?
                              wire188 : reg196) + wire183[(3'h5):(2'h3)]))});
              reg198 <= {wire183};
              reg199 <= ((wire182[(4'he):(4'h9)] ?
                  wire190[(3'h4):(2'h3)] : (8'hb8)) > (&($signed($unsigned(wire183)) ?
                  (wire192[(4'h8):(3'h6)] && (8'hba)) : (^~(wire187 ?
                      wire184 : wire187)))));
            end
          else
            begin
              reg196 <= (wire190[(2'h3):(2'h2)] | ($signed(reg194[(2'h3):(2'h3)]) >= ((~wire183) >>> wire188[(4'hc):(4'hc)])));
            end
          reg200 <= (~&wire182);
          reg201 <= reg194;
          if (((^(($unsigned(reg200) ? $signed(wire190) : wire192) ?
              (reg197 * (wire188 & wire185)) : $signed(reg196))) > wire182[(4'h9):(1'h0)]))
            begin
              reg202 <= (-($signed($signed(wire183)) > $unsigned(((+reg197) + wire188[(4'h8):(3'h4)]))));
            end
          else
            begin
              reg202 <= ((~^$unsigned($signed((reg197 | wire185)))) ~^ $unsigned((~^($unsigned(wire189) ~^ $signed(wire191)))));
              reg203 <= (-reg197);
            end
        end
      reg204 <= (!$unsigned($unsigned((~^(wire182 ? reg194 : wire182)))));
      reg205 <= ((!((wire193 ? reg195 : reg202[(4'hd):(2'h3)]) ?
          reg194 : ((-wire187) && {(8'ha3)}))) <= $signed(((~(8'hb0)) ~^ (reg204[(2'h2):(1'h0)] <= wire183))));
    end
endmodule

module module167  (y, clk, wire171, wire170, wire169, wire168);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire171;
  input wire signed [(4'ha):(1'h0)] wire170;
  input wire signed [(3'h6):(1'h0)] wire169;
  input wire [(2'h2):(1'h0)] wire168;
  wire [(3'h4):(1'h0)] wire176;
  wire [(5'h13):(1'h0)] wire175;
  wire signed [(4'h8):(1'h0)] wire174;
  wire signed [(4'he):(1'h0)] wire173;
  wire [(5'h13):(1'h0)] wire172;
  assign y = {wire176, wire175, wire174, wire173, wire172, (1'h0)};
  assign wire172 = (((&$signed(wire169[(1'h0):(1'h0)])) ?
                       wire171 : wire168[(1'h0):(1'h0)]) >> {(~wire168),
                       (wire169 + wire171[(4'hd):(4'hd)])});
  assign wire173 = wire168;
  assign wire174 = ((wire172 * (^~((8'ha4) ?
                           wire169 : wire170[(1'h1):(1'h1)]))) ?
                       wire170[(4'h9):(1'h1)] : $unsigned({$signed(wire172[(5'h12):(1'h1)])}));
  assign wire175 = $signed(wire168[(1'h0):(1'h0)]);
  assign wire176 = (-wire171);
endmodule

module module135
#(parameter param162 = (^~(~|(!((&(8'ha0)) ? ((8'hb1) ? (8'hb1) : (8'haf)) : ((7'h44) == (8'ha9)))))), 
parameter param163 = (&(((+{param162, param162}) ? (^(~&param162)) : (param162 ^ param162)) ? (~|(~|(8'hbd))) : {(~|(param162 ? param162 : param162))})))
(y, clk, wire139, wire138, wire137, wire136);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire139;
  input wire [(3'h4):(1'h0)] wire138;
  input wire [(5'h14):(1'h0)] wire137;
  input wire [(4'he):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire160;
  wire signed [(4'hb):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire158;
  wire [(5'h10):(1'h0)] wire157;
  wire [(3'h6):(1'h0)] wire156;
  wire [(4'ha):(1'h0)] wire155;
  wire [(3'h6):(1'h0)] wire154;
  wire signed [(5'h10):(1'h0)] wire153;
  wire [(4'hb):(1'h0)] wire152;
  wire [(3'h5):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire140;
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg142 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire141,
                 wire140,
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
                 (1'h0)};
  assign wire140 = $unsigned(((-wire136[(4'hc):(4'hc)]) ?
                       $signed(wire136[(3'h4):(3'h4)]) : wire137[(2'h2):(1'h0)]));
  assign wire141 = ($unsigned(($signed(wire136[(4'hd):(3'h7)]) ?
                       ((wire140 ? (8'hb3) : wire136) << (wire140 ?
                           wire136 : wire138)) : ((~^(8'ha8)) >>> $unsigned(wire137)))) >> $signed((~|(wire139 | (wire140 ?
                       wire140 : wire137)))));
  always
    @(posedge clk) begin
      if ((wire138 ?
          $signed((~^(wire140 ?
              $unsigned(wire139) : wire137))) : {(-wire136[(4'hd):(1'h1)]),
              {($signed(wire137) ? $signed(wire140) : $signed(wire138)),
                  wire136}}))
        begin
          reg142 <= (({(~$unsigned(wire136))} ?
              (-{{wire139}, $unsigned(wire136)}) : (((|wire136) <= ((8'ha8) ?
                  wire139 : wire141)) << (((8'ha2) ?
                  (7'h40) : wire137) >>> (wire138 ?
                  wire136 : wire138)))) | $signed(($signed((wire137 <= (8'hb6))) ?
              wire136 : $signed($signed(wire137)))));
        end
      else
        begin
          if ($unsigned($unsigned(((8'ha0) ?
              {wire138, (wire138 <= wire141)} : wire139))))
            begin
              reg142 <= (^(8'hbb));
              reg143 <= ($unsigned((~wire139)) ?
                  (!(8'hb3)) : ((8'hb1) ?
                      {(~^(wire140 ? wire139 : wire138))} : wire136));
              reg144 <= {($unsigned(($signed(wire139) ~^ (reg143 < wire141))) ^ {$unsigned((wire138 ?
                          reg143 : wire136))})};
              reg145 <= (-(reg143 ?
                  wire137 : {(wire137[(3'h4):(1'h0)] <<< (wire141 ?
                          wire137 : reg142)),
                      reg143[(3'h6):(3'h6)]}));
            end
          else
            begin
              reg142 <= ((-{$signed(wire141)}) - reg143);
            end
          reg146 <= wire137;
          reg147 <= $signed(($unsigned(reg142) ?
              ((reg143 ? (wire139 ? reg146 : reg145) : wire137) ?
                  (~|$signed(wire136)) : (^(reg142 & wire137))) : ({(8'hb6)} ?
                  (~^((8'hb5) ? wire137 : (8'ha5))) : (8'hb8))));
          reg148 <= {wire136[(3'h6):(3'h6)], wire138};
        end
      reg149 <= reg144[(1'h0):(1'h0)];
      reg150 <= reg142[(2'h2):(1'h1)];
      reg151 <= {reg146, reg145};
    end
  assign wire152 = ($unsigned({reg143}) * $signed($unsigned($unsigned((reg148 + reg147)))));
  assign wire153 = reg142[(1'h1):(1'h0)];
  assign wire154 = $signed($signed({$unsigned((~^(8'ha8)))}));
  assign wire155 = ((reg151[(3'h4):(2'h2)] && {(~(reg145 ?
                           wire137 : wire140))}) == $unsigned((($unsigned((8'hb9)) - (~|reg146)) >> (^~reg144))));
  assign wire156 = wire152[(1'h0):(1'h0)];
  assign wire157 = $signed((reg150 ?
                       $unsigned((~&(8'hbe))) : $signed(((7'h43) ^ $unsigned(reg147)))));
  assign wire158 = ($unsigned($signed(wire155)) ?
                       ((~wire156) || $signed(reg150[(2'h3):(1'h1)])) : $unsigned(reg145));
  assign wire159 = (~&{(~($signed(wire154) << $signed(wire154))),
                       wire158[(2'h2):(2'h2)]});
  assign wire160 = (($signed(((wire154 ? wire141 : wire137) > wire156)) ?
                           $signed($signed((!reg149))) : (8'hb5)) ?
                       $signed({wire154[(3'h5):(1'h1)]}) : wire138[(3'h4):(1'h1)]);
  assign wire161 = $unsigned($signed(wire139));
endmodule
