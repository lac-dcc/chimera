module top
#(parameter param133 = ((|(8'hb5)) - ({{((8'h9d) ? (8'h9d) : (8'hb1))}, (^((7'h44) ? (7'h43) : (8'hb1)))} << ((+(^~(8'hae))) ^~ (((7'h41) ? (8'ha4) : (8'hbd)) - (|(8'hb5)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire132;
  wire signed [(5'h11):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire [(5'h14):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire110;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire108;
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire112,
                 wire111,
                 wire110,
                 wire5,
                 wire108,
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
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire5 = wire0;
  module6 #() modinst109 (wire108, clk, wire2, wire4, wire0, wire5, wire1);
  assign wire110 = (~^($unsigned($signed({wire4, wire5})) ?
                       (({wire1, wire108} >>> (wire0 >> wire2)) ?
                           {(wire0 >> (8'hb3)),
                               $unsigned(wire2)} : wire4) : (&((~&wire0) - wire108[(1'h1):(1'h1)]))));
  assign wire111 = $signed((!wire3[(3'h7):(3'h7)]));
  assign wire112 = ((+(8'hbb)) - (((wire0[(1'h0):(1'h0)] ?
                       (&wire111) : wire5[(4'hb):(1'h1)]) + (^(wire108 - wire2))) <= $unsigned($unsigned($unsigned((8'hb8))))));
  always
    @(posedge clk) begin
      if (wire111[(2'h2):(1'h0)])
        begin
          reg113 <= {$unsigned((~&(&(wire110 ^~ wire111))))};
          if ($signed({$signed($unsigned($unsigned(reg113)))}))
            begin
              reg114 <= wire111;
              reg115 <= wire111[(2'h2):(2'h2)];
            end
          else
            begin
              reg114 <= ((&wire3) || $signed((~({wire1} + wire3[(4'h8):(2'h2)]))));
              reg115 <= ((8'ha5) ?
                  $signed($unsigned(($signed(wire3) || $signed(wire111)))) : (($unsigned($unsigned(reg114)) ?
                          $unsigned($signed((8'hb0))) : $signed(reg115)) ?
                      ($signed(wire0) + wire108[(2'h3):(1'h1)]) : $unsigned((wire1[(4'h8):(1'h0)] ?
                          wire2[(4'hb):(3'h5)] : $signed(wire112)))));
              reg116 <= $unsigned((~|wire3));
            end
        end
      else
        begin
          if ((+(8'hbd)))
            begin
              reg113 <= wire4;
              reg114 <= (+$unsigned(({wire108, (reg113 != wire0)} ?
                  reg116 : (wire3 != $signed(wire110)))));
              reg115 <= ($unsigned((|wire1)) <= ((($unsigned(reg116) <= (reg115 ?
                          wire111 : wire3)) ?
                      (wire1[(3'h6):(3'h4)] > (~&wire0)) : ((wire112 ?
                              wire3 : reg116) ?
                          wire5 : $unsigned(reg113))) ?
                  wire4[(4'hd):(3'h7)] : {$unsigned($unsigned(wire2))}));
              reg116 <= reg113[(3'h6):(3'h6)];
            end
          else
            begin
              reg113 <= $unsigned(wire1);
              reg114 <= {$signed((+(|((8'ha9) ? wire4 : wire112)))), wire110};
            end
          reg117 <= wire108[(2'h2):(2'h2)];
        end
      if (reg113[(3'h4):(3'h4)])
        begin
          reg118 <= (~|(reg115[(4'ha):(1'h1)] ?
              $signed((^$signed(wire2))) : (reg116 ?
                  wire108 : wire3[(4'hd):(4'hb)])));
          reg119 <= (((($unsigned(wire2) ?
              $unsigned(reg116) : (!wire0)) ^ wire112[(4'he):(2'h3)]) <<< $signed($signed(wire5))) ~^ (wire3 - $unsigned((wire110[(1'h0):(1'h0)] ?
              wire4 : (wire5 ? wire2 : wire5)))));
          if ({reg113[(3'h6):(1'h1)], reg114[(3'h4):(1'h1)]})
            begin
              reg120 <= (^(($unsigned($signed(reg119)) ? wire1 : reg115) ?
                  $unsigned((&(wire111 ? wire3 : (7'h44)))) : (({wire2} ?
                          $unsigned(wire2) : $unsigned(wire5)) ?
                      wire111 : $signed((reg113 ? reg114 : reg115)))));
              reg121 <= $unsigned(($signed(reg116[(1'h0):(1'h0)]) | reg115[(4'hb):(4'h9)]));
              reg122 <= $signed((($signed($unsigned(wire108)) << $signed($signed((8'haa)))) ?
                  $signed((^~wire111[(3'h4):(1'h0)])) : (-($unsigned(wire110) ?
                      (~|wire0) : (reg113 | reg116)))));
              reg123 <= (~|$signed({(|$unsigned(reg116))}));
              reg124 <= (((wire111[(3'h7):(2'h3)] ?
                  (+$signed(reg121)) : $unsigned((!wire111))) == ((((8'ha5) + (8'hab)) ?
                  ((8'hb2) - wire4) : $signed(wire111)) < ((wire5 == wire5) < $signed(reg116)))) && (-(&wire3)));
            end
          else
            begin
              reg120 <= ((wire112[(5'h13):(3'h6)] == ({(7'h43)} ?
                  wire110[(1'h1):(1'h0)] : (~$unsigned(reg118)))) <= wire2);
              reg121 <= wire1;
            end
          reg125 <= reg120[(3'h5):(2'h2)];
          reg126 <= reg124[(1'h0):(1'h0)];
        end
      else
        begin
          reg118 <= reg117;
        end
      reg127 <= reg115[(1'h1):(1'h0)];
    end
  assign wire128 = (8'ha6);
  assign wire129 = (($unsigned($signed(wire1[(2'h2):(1'h0)])) ?
                       $unsigned(($unsigned(wire4) >>> (wire2 ?
                           reg125 : reg123))) : (wire2 ~^ wire112)) - (&(~&(reg118 ?
                       (|reg115) : (wire5 >= wire5)))));
  assign wire130 = wire3[(3'h7):(3'h6)];
  assign wire131 = wire128[(2'h3):(1'h1)];
  assign wire132 = wire129[(4'h8):(3'h6)];
endmodule

module module6
#(parameter param107 = ((+((((8'ha6) ? (8'hb7) : (7'h43)) + (~^(8'hab))) ? {((8'hb6) || (7'h43)), {(8'h9e), (7'h43)}} : ({(8'hbd)} & ((8'hba) ? (8'hb0) : (8'hbe))))) ? ({(!(~(8'hb0)))} >> (8'ha4)) : (&(({(8'hb6), (8'hb4)} ? ((8'hb5) ? (8'hbf) : (8'ha7)) : (^~(8'hbf))) - {(~^(8'hae))}))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire102;
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire61,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire63,
                 wire64,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire102,
                 reg65,
                 reg66,
                 (1'h0)};
  assign wire12 = (wire7 ?
                      wire10 : (wire11[(4'hd):(2'h3)] | (!$signed(wire11))));
  assign wire13 = $signed(wire11);
  assign wire14 = (($signed(wire13) ?
                      (^~($unsigned(wire10) ?
                          (wire10 ?
                              wire11 : wire9) : $unsigned(wire7))) : (!wire13)) ~^ (8'haa));
  assign wire15 = (^~$signed((^~$signed((wire9 ? (8'haf) : wire14)))));
  assign wire16 = wire12[(2'h3):(2'h3)];
  assign wire17 = $unsigned(wire13);
  assign wire18 = (wire12[(2'h2):(1'h1)] ? wire15 : (^~{(+wire11)}));
  assign wire19 = ((wire9[(1'h1):(1'h1)] ?
                          wire12 : (^~$signed((wire7 ? wire17 : wire14)))) ?
                      ((wire16[(1'h0):(1'h0)] ?
                          $unsigned(((8'ha9) ?
                              wire13 : wire13)) : (~^(8'hbf))) ^~ $unsigned($unsigned(wire15))) : $signed(((~^$unsigned(wire7)) ?
                          wire14[(4'hd):(2'h3)] : ((&(8'hba)) >>> (^wire16)))));
  assign wire20 = wire15;
  module21 #() modinst62 (wire61, clk, wire8, wire18, wire16, wire14, wire20);
  assign wire63 = wire10;
  assign wire64 = $signed((wire14[(4'hb):(3'h5)] ? (!wire13) : wire18));
  always
    @(posedge clk) begin
      reg65 <= $unsigned((~|wire17[(2'h3):(1'h0)]));
      reg66 <= (wire19 ?
          $signed(((~^(wire19 ? wire17 : wire20)) ?
              (wire9 && wire14[(4'h8):(2'h3)]) : wire14[(4'hd):(3'h6)])) : ($unsigned($signed((wire19 ^ wire14))) * wire10));
    end
  assign wire67 = wire8;
  assign wire68 = (wire15 & (wire18 ?
                      ((^~(wire8 || wire16)) ?
                          $signed((~wire8)) : (~&(wire19 ?
                              wire64 : wire15))) : (^$signed($unsigned(wire16)))));
  assign wire69 = wire64[(4'hf):(4'h9)];
  assign wire70 = $signed((wire63[(1'h1):(1'h1)] * $signed($signed($unsigned(wire9)))));
  module71 #() modinst103 (.wire72(wire19), .clk(clk), .wire73(reg65), .wire74(wire18), .y(wire102), .wire75(wire15));
  assign wire104 = wire61;
  assign wire105 = wire14;
  assign wire106 = $unsigned(($unsigned(wire63[(2'h2):(1'h0)]) ?
                       (wire15[(1'h1):(1'h0)] > (~^(wire102 ?
                           wire63 : wire64))) : (({wire69, wire17} ?
                           $unsigned(wire11) : (~wire102)) >= (^$unsigned(wire12)))));
endmodule

module module71
#(parameter param101 = {((~|(((8'hab) ? (8'hb0) : (8'ha5)) ? ((8'hb1) ~^ (8'ha2)) : ((7'h41) ? (8'hbe) : (7'h40)))) << (((-(8'hb5)) + (~&(8'hb2))) ? ((^(7'h43)) * ((8'hba) == (8'ha8))) : ((-(8'ha1)) || ((8'hab) ? (8'hae) : (8'h9c))))), ({(-((8'hb8) << (8'hb3))), (((8'hac) ? (8'h9c) : (8'ha6)) == ((8'h9f) ? (8'haa) : (8'hbf)))} || (^~(((8'hbd) && (8'ha8)) ? ((8'hb0) ? (8'ha7) : (8'ha8)) : ((8'h9c) ? (8'hb5) : (8'ha5)))))})
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire75;
  input wire signed [(5'h10):(1'h0)] wire74;
  input wire signed [(5'h11):(1'h0)] wire73;
  input wire [(3'h6):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire97;
  wire [(5'h14):(1'h0)] wire76;
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire76,
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
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire76 = ($unsigned(wire74) ?
                      wire72 : $unsigned((((wire73 ?
                          wire74 : wire74) ~^ (&wire72)) - (wire73[(5'h11):(4'hf)] ?
                          {wire75} : (wire73 != wire75)))));
  always
    @(posedge clk) begin
      reg77 <= (+(~|wire76));
      reg78 <= ($signed(((8'ha0) ^ wire72[(2'h2):(2'h2)])) ^~ (!(!wire74)));
      if ($signed((wire75[(4'he):(4'hc)] >> $unsigned((reg77 ?
          (wire73 ? wire73 : wire72) : $signed(wire76))))))
        begin
          reg79 <= wire72;
          reg80 <= ((-(8'ha1)) > $signed((-{$unsigned((8'had))})));
          reg81 <= wire73[(2'h2):(2'h2)];
          reg82 <= ({(wire74 >= ((wire74 >> reg78) ^ (wire76 ?
                      wire74 : wire72))),
                  (|({(8'hb8), (8'hab)} ? reg79[(3'h7):(2'h3)] : {wire73}))} ?
              wire75 : (reg78 ?
                  wire73[(4'hd):(3'h4)] : $signed($signed($signed(wire73)))));
        end
      else
        begin
          if ($unsigned($signed($unsigned((^~((8'haa) ? reg80 : reg79))))))
            begin
              reg79 <= reg79;
              reg80 <= reg78;
              reg81 <= $signed(reg82);
            end
          else
            begin
              reg79 <= $unsigned((8'hb3));
              reg80 <= $signed(reg81);
              reg81 <= $unsigned(wire72[(2'h2):(1'h1)]);
              reg82 <= ($signed((^~$signed($unsigned(reg78)))) ?
                  (wire72 ?
                      ((((8'h9d) || wire76) <= reg77[(1'h0):(1'h0)]) >> {$signed((8'hbd)),
                          (&wire72)}) : (reg79 <<< ((reg79 ? reg80 : wire76) ?
                          (reg79 ? reg78 : (8'hb6)) : {wire72,
                              (8'ha3)}))) : wire72[(3'h4):(3'h4)]);
              reg83 <= wire73[(4'he):(3'h7)];
            end
          reg84 <= (~^reg81[(3'h5):(1'h0)]);
        end
      if (($unsigned($signed((+reg80[(2'h3):(1'h0)]))) ?
          reg81 : reg79[(2'h3):(1'h1)]))
        begin
          if ((~&{$signed((!(wire74 ? reg79 : reg81)))}))
            begin
              reg85 <= (wire72[(1'h0):(1'h0)] - reg84);
            end
          else
            begin
              reg85 <= (^~wire72[(3'h5):(2'h2)]);
              reg86 <= $signed(($signed(((wire72 >>> reg78) ?
                      (|reg77) : (wire76 ? wire72 : reg78))) ?
                  {(~|$unsigned((8'hb9))), $unsigned(reg79)} : reg83));
              reg87 <= (wire74 <= ($signed({$unsigned(reg77),
                      wire76[(5'h10):(1'h0)]}) ?
                  ($signed(reg81[(3'h6):(2'h2)]) ?
                      {reg80, $unsigned(reg84)} : reg85) : $signed((wire74 ?
                      {reg83} : (reg77 ? reg84 : reg85)))));
              reg88 <= (-reg79);
            end
        end
      else
        begin
          reg85 <= wire74[(2'h3):(2'h2)];
          if (({{(|reg87)}} <<< reg87[(1'h1):(1'h0)]))
            begin
              reg86 <= ((^~((reg78 * $unsigned(reg79)) ?
                      (&reg87) : $signed((wire75 >>> reg84)))) ?
                  reg82 : $unsigned(((~$signed((8'hb4))) ?
                      reg77[(3'h7):(2'h3)] : $unsigned((wire73 ?
                          wire73 : reg86)))));
              reg87 <= ({{(reg84[(2'h2):(2'h2)] ? (^~reg77) : reg84)},
                  reg87} * (wire74[(2'h2):(2'h2)] ?
                  (&(-reg78)) : (|$unsigned((reg79 ? reg88 : reg87)))));
            end
          else
            begin
              reg86 <= wire72;
              reg87 <= $signed((~|$signed(((&(8'hb9)) * $signed(reg77)))));
            end
          if ($unsigned($unsigned({$unsigned((reg78 & reg79)),
              (wire76 ~^ $unsigned(reg82))})))
            begin
              reg88 <= $signed({$signed(((reg84 ?
                      reg80 : reg87) + reg78[(3'h5):(1'h1)])),
                  wire73});
              reg89 <= {reg80, $signed(wire73)};
            end
          else
            begin
              reg88 <= (wire73[(3'h7):(1'h1)] ?
                  $unsigned(((-$signed(reg87)) ^ (|(reg79 ?
                      wire73 : wire73)))) : (8'ha4));
              reg89 <= $unsigned(wire73);
              reg90 <= wire75[(1'h1):(1'h1)];
              reg91 <= ({reg80[(4'h8):(2'h3)],
                  $unsigned({$signed(reg79)})} >> wire72[(1'h1):(1'h0)]);
            end
          reg92 <= reg78[(1'h0):(1'h0)];
          if ((reg84 ?
              (reg87[(1'h0):(1'h0)] ?
                  ((wire73[(5'h10):(4'h9)] ?
                      (reg80 ?
                          reg78 : reg91) : {reg78}) <= ($unsigned(reg81) * reg78[(2'h3):(1'h0)])) : reg90) : wire72[(1'h1):(1'h1)]))
            begin
              reg93 <= ((^wire72[(3'h5):(2'h3)]) ?
                  $signed({$signed((8'ha4))}) : (wire74[(4'h9):(4'h9)] >> (($signed(reg79) ?
                      ((7'h40) ?
                          (8'haf) : reg78) : reg84[(3'h4):(1'h1)]) - (^reg83[(3'h4):(1'h1)]))));
              reg94 <= (~reg87);
              reg95 <= {reg89[(1'h0):(1'h0)]};
            end
          else
            begin
              reg93 <= reg77;
              reg94 <= ($signed(reg80) <<< (reg88[(1'h0):(1'h0)] >> {$unsigned({wire74,
                      reg91})}));
              reg95 <= ((~&((reg79[(4'hd):(4'ha)] ?
                      $signed(wire76) : reg93[(2'h3):(1'h1)]) >>> (reg95[(2'h3):(2'h2)] ?
                      (^~reg79) : {reg94}))) ?
                  (reg80[(2'h3):(2'h2)] <= $signed($signed(reg86[(2'h2):(1'h1)]))) : (~^({wire73[(4'he):(4'h9)],
                          (8'hb6)} ?
                      $unsigned((reg84 != reg94)) : ((reg87 ? wire72 : reg88) ?
                          wire73[(4'h8):(2'h3)] : (reg92 ^~ reg89)))));
              reg96 <= $signed((^wire75));
            end
        end
    end
  assign wire97 = {wire76[(4'he):(1'h0)]};
  assign wire98 = (7'h41);
  assign wire99 = (((^~$signed((|reg96))) < $signed((~|reg84))) ~^ wire75[(3'h7):(2'h2)]);
  assign wire100 = reg85;
endmodule

module module21
#(parameter param60 = (+{(((8'ha4) <= (~^(8'hb9))) > (((8'hbf) ? (8'hb7) : (8'ha3)) ? ((8'hb1) ~^ (8'hbb)) : (~(8'ha1)))), ((((8'hb8) ? (8'hb0) : (8'ha7)) >= (~^(8'hb0))) >> ((-(8'hbd)) ? ((8'ha0) >> (8'ha4)) : ((8'hb7) > (8'h9f))))}))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire26;
  input wire [(5'h10):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire [(3'h5):(1'h0)] wire23;
  input wire [(3'h5):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire49,
                 wire48,
                 wire28,
                 wire27,
                 reg51,
                 reg50,
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
                 (1'h0)};
  assign wire27 = wire26;
  assign wire28 = wire27[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg29 <= wire23;
      if ({{(~&$unsigned($signed((8'hb1)))), wire25}})
        begin
          reg30 <= wire25;
          reg31 <= ((((wire28[(3'h5):(1'h1)] ?
                  ((8'ha3) ? wire26 : wire23) : wire25) ?
              ((~^wire26) ?
                  {(8'ha1)} : (~&wire27)) : wire28) >>> $unsigned(($signed(reg29) ?
              reg29[(1'h1):(1'h1)] : ((8'hba) ~^ reg30)))) ~^ {wire24,
              (|wire27[(2'h2):(1'h1)])});
        end
      else
        begin
          reg30 <= {$unsigned(wire24[(2'h2):(1'h1)])};
          reg31 <= $signed(($unsigned((|$unsigned(reg29))) ?
              ({{reg29, reg31}, reg31} <= (8'hb0)) : reg29));
          if ($unsigned((wire24 < reg30[(1'h0):(1'h0)])))
            begin
              reg32 <= wire26;
              reg33 <= ((&(^wire23)) - (reg32 ?
                  (!({wire27, reg29} ?
                      $signed(reg31) : (reg31 ~^ reg31))) : {{$unsigned(reg31)}}));
              reg34 <= ($signed(reg29) ?
                  (&reg31) : $unsigned(((~&(reg32 ?
                      wire26 : wire28)) >> $unsigned($unsigned((8'h9c))))));
            end
          else
            begin
              reg32 <= reg29;
              reg33 <= reg31[(3'h4):(1'h0)];
              reg34 <= (wire25 - wire24);
              reg35 <= ($unsigned($unsigned(wire26)) ?
                  ($signed($signed({reg30, reg34})) ?
                      (({reg31, reg33} << (reg31 ?
                          wire25 : wire25)) <<< reg32) : reg32) : $unsigned($signed(wire28[(5'h10):(4'h9)])));
              reg36 <= $unsigned(((+($unsigned(reg29) ?
                  reg29[(2'h2):(1'h1)] : $unsigned(wire25))) == reg35[(5'h13):(1'h0)]));
            end
          if ($unsigned(reg34))
            begin
              reg37 <= $unsigned($signed($unsigned(((|reg29) ?
                  ((8'h9d) || wire28) : $unsigned(reg36)))));
              reg38 <= (-$unsigned((|((&(8'had)) * reg36[(2'h2):(1'h1)]))));
              reg39 <= {reg35[(1'h1):(1'h0)],
                  $unsigned((($signed((8'hb2)) ?
                      reg34 : $unsigned(reg32)) - {{(8'hb4), reg38}}))};
              reg40 <= $signed($signed(reg32));
              reg41 <= ($signed((wire27[(4'ha):(3'h6)] ?
                      ((^~(8'hb8)) * $signed(reg39)) : {$unsigned(wire28)})) ?
                  reg37[(2'h3):(2'h3)] : $unsigned($unsigned((((8'ha4) ?
                      wire26 : reg30) && $signed((8'h9f))))));
            end
          else
            begin
              reg37 <= $unsigned($signed((8'hae)));
              reg38 <= $signed(reg32[(4'hc):(3'h7)]);
            end
        end
      reg42 <= $signed(($signed(((~&wire24) != $signed(reg30))) ?
          (|(wire26 - $unsigned(reg40))) : $unsigned(reg39)));
      reg43 <= ($signed({reg29[(5'h11):(4'h9)]}) ?
          (^~(~$signed($signed(reg29)))) : wire23[(3'h5):(2'h3)]);
      reg44 <= reg32[(4'h8):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg45 <= (~wire27[(3'h4):(1'h1)]);
      reg46 <= {((reg39[(3'h5):(3'h4)] << reg33) ?
              $unsigned(({reg40, reg30} ?
                  $unsigned(reg30) : ((7'h40) ?
                      reg39 : wire27))) : (reg45[(2'h3):(1'h0)] >= (wire26 ?
                  {reg31} : $signed((8'ha5))))),
          (^({wire22, (reg40 ? (8'hb9) : reg39)} ? reg41 : (reg41 > reg38)))};
      reg47 <= ((((!(reg44 && reg33)) ?
                  $signed($signed(reg37)) : $signed((~wire23))) ?
              ((~^(reg44 < reg32)) ?
                  reg34 : reg34[(1'h0):(1'h0)]) : (($signed(reg42) + ((8'hb6) != reg39)) < (reg45 * (reg39 ?
                  (8'h9c) : wire23)))) ?
          (^~(reg46[(4'ha):(3'h7)] ?
              ((reg40 >> wire25) || reg32[(3'h5):(1'h0)]) : $unsigned((reg46 ?
                  reg42 : (8'hb3))))) : $unsigned(((~^{reg37,
              reg46}) & (8'haf))));
    end
  assign wire48 = ((~^reg45[(3'h4):(1'h1)]) >> $unsigned($unsigned((~(!reg47)))));
  assign wire49 = (|wire24[(3'h6):(1'h1)]);
  always
    @(posedge clk) begin
      reg50 <= wire28;
      reg51 <= reg30[(2'h2):(2'h2)];
    end
  assign wire52 = $signed((+$signed(($unsigned(wire26) && (reg44 ?
                      reg33 : reg33)))));
  assign wire53 = reg42[(2'h3):(1'h0)];
  assign wire54 = ({$unsigned(reg29[(4'h9):(3'h7)]),
                      reg34} >= $unsigned((8'hbb)));
  assign wire55 = (~&wire24[(3'h6):(1'h0)]);
  assign wire56 = $unsigned({(+wire49), (reg33 >>> reg51[(3'h7):(3'h7)])});
  assign wire57 = (~|($signed(($unsigned(reg38) ?
                          {(8'ha9)} : $signed(wire25))) ?
                      $signed(($unsigned(wire48) >= (wire54 ?
                          wire55 : wire26))) : wire52[(4'h8):(2'h3)]));
  assign wire58 = reg35[(4'hd):(4'ha)];
  assign wire59 = $unsigned($signed($unsigned((wire27 & reg45[(1'h1):(1'h1)]))));
endmodule
