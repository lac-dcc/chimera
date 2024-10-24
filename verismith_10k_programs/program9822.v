module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire133;
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire37, wire8, wire5, wire39, wire133, reg7, reg6, (1'h0)};
  assign wire5 = ({{(wire0 ? $signed(wire1) : (wire0 ? wire0 : wire4))},
                         wire1[(3'h5):(2'h2)]} ?
                     $unsigned(((!(wire3 ?
                         wire0 : wire2)) & {wire3[(4'hd):(3'h7)],
                         wire1})) : (-wire4[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg6 <= wire2;
      reg7 <= (~^reg6);
    end
  assign wire8 = $unsigned($signed($unsigned($unsigned($unsigned(reg6)))));
  module9 #() modinst38 (wire37, clk, wire3, wire0, wire5, reg7);
  assign wire39 = (|reg7);
  module40 #() modinst134 (wire133, clk, wire39, reg6, wire8, wire2);
endmodule

module module40
#(parameter param132 = (~(~|(({(8'ha9)} ? (&(8'haf)) : ((7'h44) >> (8'hbc))) ? (~&((7'h44) < (8'hb1))) : (^(!(8'ha3)))))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire44;
  input wire signed [(4'h8):(1'h0)] wire43;
  input wire [(5'h12):(1'h0)] wire42;
  input wire [(5'h13):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire131;
  wire signed [(3'h7):(1'h0)] wire130;
  wire [(4'hc):(1'h0)] wire129;
  wire signed [(4'hb):(1'h0)] wire128;
  wire signed [(3'h5):(1'h0)] wire113;
  wire signed [(5'h14):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire50;
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire94,
                 wire92,
                 wire53,
                 wire52,
                 wire50,
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
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg45 <= ((8'hbf) ?
          $unsigned((wire44[(1'h1):(1'h0)] * (~$unsigned(wire42)))) : ((^~(wire41[(3'h4):(1'h0)] ?
              {wire44, wire42} : $signed(wire41))) & $signed((wire43 ?
              $signed(wire44) : (-(8'hab))))));
      reg46 <= $unsigned(wire41[(4'h8):(3'h7)]);
      reg47 <= wire41[(1'h1):(1'h1)];
      reg48 <= ((reg47 ?
          wire41 : $unsigned((~&(reg45 ? wire43 : reg45)))) ~^ {{((~|wire42) ?
                  reg45 : $unsigned(wire43))},
          reg45[(4'hd):(3'h4)]});
      reg49 <= wire42;
    end
  assign wire50 = (~^($unsigned({(+wire41)}) ?
                      $unsigned(wire41) : ($unsigned((wire43 >> wire44)) ?
                          (&$signed((7'h40))) : $signed($signed(wire43)))));
  always
    @(posedge clk) begin
      reg51 <= $unsigned($unsigned($signed(($unsigned(wire43) ^ (reg46 > (8'hba))))));
    end
  assign wire52 = (wire44 ?
                      ((reg46 ? wire50 : ($unsigned(reg51) ? reg47 : {reg51})) ?
                          reg48[(2'h3):(2'h2)] : ($signed($unsigned(reg49)) > $signed(((8'hb7) ?
                              reg49 : reg45)))) : (reg48 ?
                          reg51[(1'h1):(1'h1)] : ((^~$signed(reg48)) >= (^~(wire43 || wire41)))));
  assign wire53 = (|$signed({((reg47 == wire43) ?
                          (~&wire41) : wire41[(5'h12):(3'h5)]),
                      ($signed(wire44) ?
                          (^~wire44) : (reg48 ? wire43 : wire52))}));
  module54 #() modinst93 (.wire59(wire43), .y(wire92), .wire58(wire41), .wire57(wire42), .wire56(wire53), .clk(clk), .wire55(reg46));
  assign wire94 = $signed($signed(($unsigned((~^wire44)) ?
                      {(wire41 | (8'hb3)), $unsigned(wire43)} : ((^~wire50) ?
                          wire50[(1'h0):(1'h0)] : (wire42 >= wire92)))));
  always
    @(posedge clk) begin
      reg95 <= (+wire44[(3'h5):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if ((~&(reg51[(1'h0):(1'h0)] <<< (~{((8'ha7) >= reg46),
          reg48[(3'h5):(2'h2)]}))))
        begin
          if (reg49[(2'h2):(1'h0)])
            begin
              reg96 <= $signed((-(((reg45 ?
                      reg46 : (8'ha0)) * $unsigned((8'ha1))) ?
                  reg46 : ((~reg47) ? $unsigned(wire44) : (reg45 | reg48)))));
            end
          else
            begin
              reg96 <= (~wire92[(1'h1):(1'h1)]);
              reg97 <= wire92[(1'h1):(1'h1)];
              reg98 <= (reg45[(3'h5):(2'h3)] - reg49);
              reg99 <= (~&wire53[(2'h2):(1'h0)]);
              reg100 <= ((wire53[(4'h8):(3'h5)] ~^ wire94[(3'h4):(2'h2)]) ?
                  (&($unsigned(reg51[(1'h0):(1'h0)]) ?
                      (7'h42) : $unsigned(reg47))) : ($unsigned($unsigned((!wire92))) >> wire41));
            end
          reg101 <= $unsigned(wire42);
          if ((~&wire53))
            begin
              reg102 <= reg95[(1'h0):(1'h0)];
              reg103 <= (7'h40);
              reg104 <= $unsigned(reg103[(1'h1):(1'h0)]);
              reg105 <= (~($signed((~$unsigned(reg99))) <<< {$signed(reg46)}));
              reg106 <= wire41[(1'h1):(1'h0)];
            end
          else
            begin
              reg102 <= (+$unsigned(wire94[(5'h13):(1'h1)]));
              reg103 <= ((+(8'had)) >= {{$signed($unsigned(reg105)),
                      $signed(wire41)}});
            end
        end
      else
        begin
          if ((($unsigned({{reg98, wire44}, {wire94}}) ?
              wire50[(4'hb):(3'h7)] : $signed($unsigned(reg100[(3'h7):(3'h7)]))) * {((8'haa) ?
                  (reg102 ?
                      (^~reg46) : (reg96 ?
                          wire53 : wire52)) : $unsigned((|reg48)))}))
            begin
              reg96 <= (~|$unsigned($unsigned((reg99 ?
                  reg101[(4'hd):(4'ha)] : $unsigned(wire41)))));
            end
          else
            begin
              reg96 <= (&(($unsigned((reg104 ?
                  (8'hb0) : wire53)) + $signed($signed(reg105))) | reg48[(3'h5):(3'h4)]));
              reg97 <= $signed(reg97[(4'h8):(3'h7)]);
              reg98 <= $signed({reg105[(3'h4):(3'h4)], (7'h41)});
            end
          reg99 <= (wire43[(1'h0):(1'h0)] || reg45);
          reg100 <= $signed(reg49);
          reg101 <= (wire52 ?
              ((($signed(reg47) ? reg46 : reg96[(4'h9):(3'h7)]) <= (~(reg104 ?
                  (8'hb2) : wire53))) + (((wire44 ?
                  reg98 : reg51) ~^ (wire53 & reg95)) || {wire92[(4'h8):(3'h5)],
                  $signed(reg104)})) : (reg106 ?
                  $unsigned(wire43) : ({reg101[(4'h9):(3'h6)]} != (~^(wire50 != (8'haf))))));
          if ({reg51, (~(reg101 ? {(-(8'h9f))} : wire94[(5'h12):(1'h0)]))})
            begin
              reg102 <= (|$signed(reg49));
            end
          else
            begin
              reg102 <= $unsigned($signed((~$signed(wire44[(3'h4):(2'h2)]))));
              reg103 <= (reg48 ^~ ((reg100 <= ($signed(reg100) ?
                      ((8'hb3) == reg49) : (reg104 ? wire53 : reg106))) ?
                  {((reg48 ?
                          reg98 : (8'ha2)) * ((7'h40) >> reg45))} : ($unsigned(((8'hbd) >= wire94)) ?
                      reg95[(3'h4):(1'h1)] : $unsigned((reg95 | reg99)))));
              reg104 <= $unsigned((+$unsigned(($signed(wire42) ?
                  $unsigned(reg48) : (reg103 ? (8'hb8) : wire94)))));
              reg105 <= (~|(!$unsigned(((|reg102) ?
                  $signed(reg47) : (reg104 ? reg97 : wire50)))));
              reg106 <= (~|(reg105[(4'h8):(1'h1)] | reg49[(3'h5):(2'h3)]));
            end
        end
    end
  assign wire107 = ((reg99[(3'h7):(3'h6)] && (|($unsigned(reg47) <= wire44))) * (!(^~({wire92} ?
                       (reg51 ? (8'had) : (8'h9c)) : (&wire53)))));
  assign wire108 = reg46;
  assign wire109 = $signed($signed(wire108));
  assign wire110 = ($signed(wire41[(3'h7):(1'h1)]) ?
                       (wire42 ?
                           (($signed(wire108) ?
                               {wire42,
                                   (7'h43)} : reg48) < $signed($unsigned(wire92))) : reg95[(2'h3):(2'h3)]) : $unsigned({(~&{wire42,
                               (8'ha8)}),
                           $signed(reg95[(1'h0):(1'h0)])}));
  assign wire111 = $unsigned((+$unsigned($unsigned((reg49 ?
                       wire94 : wire110)))));
  assign wire112 = (+reg48);
  assign wire113 = $unsigned({$signed((reg103[(3'h5):(2'h2)] ^ {reg104}))});
  always
    @(posedge clk) begin
      reg114 <= ((8'hb9) * {{(&{(8'hab), wire112})}});
      reg115 <= $unsigned(reg100);
      if ($signed($signed($unsigned(($signed(reg115) + $signed((8'hbc)))))))
        begin
          reg116 <= $unsigned(reg45[(5'h10):(3'h6)]);
          reg117 <= (-($unsigned(wire110[(4'hb):(3'h5)]) ?
              (&reg97[(3'h5):(2'h2)]) : $unsigned($unsigned((wire113 || wire94)))));
          reg118 <= (+$signed($signed((((8'ha3) ?
              (8'hac) : reg115) >= reg97))));
          if ($signed(reg105))
            begin
              reg119 <= wire108;
              reg120 <= reg105;
            end
          else
            begin
              reg119 <= $signed((~&(wire42 ?
                  ($unsigned(wire42) > wire112[(3'h4):(2'h3)]) : (wire113[(1'h1):(1'h1)] ?
                      reg96[(4'hf):(4'h9)] : ((8'hb6) || reg116)))));
              reg120 <= {wire94};
              reg121 <= $unsigned(reg117);
            end
          if (reg118)
            begin
              reg122 <= reg121[(2'h3):(1'h1)];
            end
          else
            begin
              reg122 <= wire94[(1'h1):(1'h1)];
              reg123 <= ({{reg118[(2'h3):(1'h1)]}} <<< (reg98[(5'h13):(4'ha)] - ($signed($unsigned(wire94)) == reg119[(4'he):(2'h2)])));
              reg124 <= $signed((~reg115[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg116 <= wire42[(1'h0):(1'h0)];
          reg117 <= ($signed((~|$unsigned(reg98[(5'h10):(4'hb)]))) - ({$unsigned((wire53 ?
                      reg45 : reg104))} ?
              reg117 : {(&(reg104 ? reg117 : reg122))}));
          reg118 <= (~$signed($signed($unsigned(reg46[(1'h1):(1'h0)]))));
          reg119 <= ((-$unsigned({(~&reg97)})) ?
              reg104 : (~^wire41[(4'hd):(4'h9)]));
          reg120 <= $unsigned((((~&reg103[(1'h1):(1'h0)]) << ($unsigned(wire53) ?
                  ((8'hba) >= reg46) : (|reg101))) ?
              ($unsigned((wire41 ? wire52 : reg121)) && ((~^wire42) ?
                  (reg95 * reg48) : $signed(wire112))) : reg116));
        end
      if ((!((reg99 ?
          (((8'hb0) ? wire108 : wire44) ?
              wire50 : {reg114}) : $unsigned($unsigned(wire110))) == reg104[(2'h2):(2'h2)])))
        begin
          reg125 <= ($signed(reg49[(3'h4):(1'h0)]) ?
              reg121 : $unsigned(reg120[(4'h8):(1'h1)]));
          reg126 <= $unsigned(reg48);
        end
      else
        begin
          reg125 <= wire110;
        end
      reg127 <= (^({$signed($signed(wire92))} | $signed(($signed((8'ha3)) ?
          (reg48 && reg47) : wire113[(3'h5):(1'h0)]))));
    end
  assign wire128 = reg123;
  assign wire129 = $signed((($signed($unsigned((8'ha2))) ?
                           {$signed((8'hb8)),
                               (wire53 ? reg97 : reg116)} : $signed((8'hb9))) ?
                       (((reg121 << wire128) ?
                           wire111 : (reg122 == reg103)) || ((!reg47) ?
                           ((8'ha1) ? (8'h9f) : reg123) : wire94)) : (8'hae)));
  assign wire130 = reg102;
  assign wire131 = $signed($unsigned($unsigned($signed(((8'haf) ?
                       reg122 : wire53)))));
endmodule

module module9
#(parameter param35 = ((((^~((8'hb8) ? (8'hb1) : (8'hb4))) >>> (~|((8'h9f) >= (8'hb4)))) ? (({(8'had)} != (&(7'h41))) ? ({(8'hb2), (8'hbf)} ? ((8'hb0) ~^ (8'hb9)) : (~(8'ha3))) : ({(8'ha9), (8'ha7)} ? (|(8'ha5)) : ((8'h9c) ? (8'hb6) : (8'ha7)))) : ((((8'hb3) <= (8'hb4)) ? (~|(8'hb9)) : ((8'hab) ^ (8'h9d))) ? (((8'ha1) ? (7'h43) : (8'hac)) ? {(8'hb0), (8'ha6)} : ((8'hb4) != (7'h44))) : (((8'hbe) <<< (8'hab)) <<< ((7'h43) <<< (7'h44))))) ? {((&((8'hbd) == (8'haf))) >>> ((-(8'hb8)) ? (~&(7'h42)) : (-(8'haa)))), {(8'haf)}} : {(7'h41)}), 
parameter param36 = (~|(&{{(param35 <<< param35), (param35 ? param35 : param35)}, ((~&param35) | {param35})})))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire14 = {(($unsigned(wire12) ? wire10[(2'h3):(2'h3)] : wire10) ?
                          $unsigned($signed({(8'ha6),
                              (8'hb6)})) : ((~|$unsigned(wire12)) <= wire11)),
                      (((^$unsigned(wire10)) ~^ (wire10[(4'h8):(4'h8)] ^ ((8'hb8) ?
                          wire10 : wire13))) < $signed($signed(wire10)))};
  assign wire15 = $signed(wire10[(4'h8):(1'h0)]);
  assign wire16 = $signed(wire14[(1'h1):(1'h0)]);
  assign wire17 = ({wire14} <<< (7'h40));
  assign wire18 = wire12;
  assign wire19 = wire15;
  assign wire20 = {(~|({$unsigned(wire13)} ?
                          (&wire18[(3'h4):(3'h4)]) : $signed(wire10)))};
  always
    @(posedge clk) begin
      reg21 <= $unsigned(({{((8'hbd) ? wire17 : wire15)}} ?
          {(~&(8'hbf)), wire11} : (wire13 ?
              wire20 : (wire15 ?
                  $unsigned(wire16) : ((8'ha6) ? wire19 : wire11)))));
      reg22 <= ((((wire20 ?
              {wire11} : reg21) ^~ $signed((~|reg21))) ^ $signed(((&wire15) >>> wire13))) ?
          $unsigned((wire12[(4'ha):(4'ha)] ?
              {$signed(wire19),
                  wire14[(2'h2):(2'h2)]} : (~(~^wire11)))) : $signed(wire12));
    end
  assign wire23 = (^((!($signed(wire18) <<< $unsigned(reg21))) | wire11[(2'h2):(2'h2)]));
  assign wire24 = (^(&reg21[(3'h4):(3'h4)]));
  assign wire25 = (~($unsigned((~(wire14 ? wire11 : wire18))) ?
                      ((8'hb5) << wire16[(4'ha):(4'ha)]) : (reg21[(4'hd):(3'h5)] - (|$unsigned(wire24)))));
  assign wire26 = (wire20[(3'h5):(3'h4)] || $signed((~|((wire24 ?
                      wire25 : reg22) <= (wire13 ? wire25 : wire19)))));
  always
    @(posedge clk) begin
      reg27 <= reg22[(5'h13):(4'he)];
      reg28 <= (~^$unsigned((($unsigned(wire12) ^ {wire24}) ?
          (&$signed(wire17)) : $signed($signed(wire16)))));
      reg29 <= ($unsigned(wire15) != wire11);
      reg30 <= (wire17 >> (($unsigned((reg27 | reg22)) ?
              $unsigned((wire17 ? wire15 : (8'hb0))) : (reg27[(5'h13):(3'h7)] ?
                  reg29[(3'h7):(3'h6)] : (wire14 ? (8'h9e) : wire14))) ?
          wire17 : $unsigned((-((8'h9c) || (8'ha1))))));
    end
  assign wire31 = $unsigned($unsigned($signed(($signed(wire13) >> (wire16 ?
                      wire12 : wire18)))));
  assign wire32 = $signed((wire10 ? $unsigned(wire12) : wire13[(1'h0):(1'h0)]));
  assign wire33 = ({{reg22[(4'hf):(4'hf)]}} ?
                      {(+reg28)} : (wire24[(3'h6):(1'h1)] <<< ((wire20[(4'hf):(4'he)] ?
                              wire24[(1'h0):(1'h0)] : $unsigned(wire17)) ?
                          $unsigned((wire18 ?
                              wire13 : wire10)) : wire32[(3'h7):(3'h7)])));
  assign wire34 = reg28[(4'hb):(3'h5)];
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire59;
  input wire signed [(5'h13):(1'h0)] wire58;
  input wire [(5'h12):(1'h0)] wire57;
  input wire [(3'h4):(1'h0)] wire56;
  input wire [(3'h5):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire60;
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
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
                 wire70,
                 wire60,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg72,
                 reg71,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire60 = ((8'hb6) ?
                      (($unsigned((&wire55)) ^~ $unsigned((wire55 ?
                              (8'hbd) : wire59))) ?
                          wire55 : $unsigned((+{wire59,
                              wire59}))) : $signed((wire55[(1'h1):(1'h0)] ?
                          (wire59[(2'h3):(2'h2)] ?
                              wire56 : (8'hae)) : $unsigned(wire58[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg61 <= ((|((((8'hae) ? (8'ha5) : wire60) ?
          (wire57 ?
              wire55 : wire58) : $unsigned(wire60)) ~^ {wire55[(1'h0):(1'h0)]})) ^~ (^~wire55));
      if ((|(wire59[(3'h6):(3'h4)] <= {((wire57 ? wire55 : (8'hba)) ?
              (wire55 ? (8'ha9) : wire57) : (|wire57))})))
        begin
          reg62 <= wire58[(1'h1):(1'h1)];
          reg63 <= $signed(($unsigned(wire60[(5'h13):(4'h9)]) > (((8'hbd) ?
              {wire60, wire57} : (wire57 ? wire59 : wire57)) < wire59)));
        end
      else
        begin
          if ($signed(reg61))
            begin
              reg62 <= $unsigned($unsigned($signed(reg62[(1'h1):(1'h1)])));
              reg63 <= ($unsigned($signed({reg63[(5'h13):(5'h12)],
                  reg63[(4'ha):(4'h8)]})) || ({(&reg62),
                      $signed($unsigned(wire57))} ?
                  {((wire55 ? (7'h43) : (8'hbe)) > $signed(wire60)),
                      wire60[(4'ha):(4'ha)]} : reg61[(2'h2):(1'h0)]));
              reg64 <= $signed((^~wire59[(3'h4):(2'h2)]));
              reg65 <= (wire59 << wire55[(1'h1):(1'h0)]);
              reg66 <= ($signed(wire58) - {reg61[(2'h2):(2'h2)]});
            end
          else
            begin
              reg62 <= ($signed(($signed((8'hbf)) < {(wire57 ^ wire57)})) > (wire60 ?
                  $signed((8'hb9)) : (wire55 ?
                      reg61[(1'h0):(1'h0)] : $unsigned(reg64))));
              reg63 <= reg64[(5'h12):(4'h9)];
              reg64 <= (^$signed(($unsigned((reg64 || (8'ha8))) * {reg61[(1'h0):(1'h0)],
                  reg62[(3'h5):(2'h3)]})));
            end
          reg67 <= ($unsigned(($signed(wire55) || $unsigned((~(8'hb2))))) ?
              (+wire55) : $signed(((((8'ha0) & reg66) ~^ (reg64 <<< wire59)) > (wire59 == $unsigned(reg65)))));
          reg68 <= (((reg63[(4'ha):(4'h9)] ?
                      (8'hb5) : $unsigned($signed(reg63))) ?
                  ({((8'h9d) >>> wire55),
                      $signed(reg64)} >> wire59[(4'h8):(2'h3)]) : $unsigned((((8'ha5) < (8'ha2)) - $unsigned((8'hb4))))) ?
              (^~((wire57 ?
                  reg64[(5'h10):(4'hf)] : reg64[(1'h0):(1'h0)]) >>> $unsigned(((8'hb5) ?
                  wire57 : reg63)))) : $signed((((~|wire56) ^ reg64[(5'h14):(3'h4)]) && $unsigned(wire57[(4'h9):(3'h5)]))));
          reg69 <= (8'hbf);
        end
    end
  assign wire70 = (+reg69);
  always
    @(posedge clk) begin
      if ((wire70[(4'hc):(4'ha)] ?
          (((~$unsigned(reg65)) & (-(reg62 ?
              reg64 : reg67))) < $unsigned((8'ha1))) : wire55))
        begin
          reg71 <= (~&wire57);
        end
      else
        begin
          reg71 <= (reg65 * ($unsigned({(wire57 != (8'hbd))}) ~^ (+$unsigned({wire57}))));
          reg72 <= ($signed($signed({wire57})) ?
              wire56[(1'h0):(1'h0)] : $signed((^($signed(reg69) - $signed(reg69)))));
        end
    end
  assign wire73 = reg65;
  assign wire74 = (&($unsigned($unsigned((reg67 ?
                      (8'hbc) : wire59))) || $signed($signed((wire55 ?
                      reg69 : (8'hac))))));
  assign wire75 = reg72[(1'h0):(1'h0)];
  assign wire76 = (reg68 || reg62[(2'h3):(1'h0)]);
  assign wire77 = (^$signed(reg66));
  assign wire78 = $signed((reg68 | $unsigned(wire60[(4'hd):(3'h4)])));
  assign wire79 = $signed($signed(($unsigned(wire59) ?
                      $unsigned((wire56 == reg62)) : $signed((~^reg66)))));
  assign wire80 = reg66;
  assign wire81 = (-($unsigned(wire75[(4'ha):(1'h0)]) <<< ($signed((reg62 ?
                          reg72 : wire79)) ?
                      {(wire77 ? (8'ha9) : reg69),
                          (^~reg65)} : $signed((^wire56)))));
  assign wire82 = (($signed((8'ha2)) - $unsigned($unsigned((~|reg61)))) ?
                      (8'ha3) : $signed($signed($unsigned(wire79[(3'h6):(1'h1)]))));
  assign wire83 = (reg72[(4'h9):(2'h3)] | (($unsigned({(8'ha3)}) - ($signed(wire57) | (reg62 ?
                      (8'hb0) : reg63))) + ((!wire70[(3'h5):(3'h4)]) ?
                      reg64 : ((wire76 ? wire82 : reg66) - (&(8'h9f))))));
  assign wire84 = $signed($unsigned($unsigned(({wire79, reg69} ?
                      (|wire73) : $signed(wire83)))));
  assign wire85 = wire57[(4'h8):(3'h6)];
  assign wire86 = $signed({$signed((wire85[(2'h3):(1'h0)] ?
                          wire81 : (wire74 ? wire59 : (8'hae))))});
  always
    @(posedge clk) begin
      reg87 <= wire56[(1'h1):(1'h0)];
      reg88 <= ({$signed((reg87[(3'h6):(2'h2)] ?
              reg67 : (wire56 ? (8'hb3) : reg66))),
          wire57[(4'hf):(3'h4)]} + (wire70[(3'h4):(3'h4)] << $unsigned($unsigned(((8'h9f) ?
          wire83 : wire84)))));
      reg89 <= ($signed(((~(-reg67)) != ($signed(wire83) ?
          $unsigned(wire58) : $unsigned(wire60)))) < ({reg72,
              (+wire84[(4'h9):(3'h6)])} ?
          (($unsigned(wire74) != (reg88 ~^ (8'hbf))) ?
              wire74[(2'h2):(1'h1)] : $signed($unsigned(reg71))) : {($signed(wire56) || (wire73 < wire80))}));
      reg90 <= wire56[(2'h2):(1'h1)];
      reg91 <= (((reg88[(3'h6):(1'h0)] > $unsigned(wire81[(3'h5):(1'h1)])) ?
              ($unsigned(reg64) && (reg71[(3'h6):(3'h4)] <<< {wire83,
                  reg68})) : wire77) ?
          (7'h40) : ($unsigned(reg63[(5'h12):(1'h1)]) ?
              ({reg67, reg90[(4'he):(1'h1)]} ?
                  wire86[(1'h0):(1'h0)] : ((wire60 ?
                      wire73 : (8'ha4)) || wire81[(2'h2):(1'h0)])) : (8'ha8)));
    end
endmodule
