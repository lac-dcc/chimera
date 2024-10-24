module top
#(parameter param109 = (^({(~|((8'hbd) << (8'hb6)))} ? ((((8'ha3) ? (7'h44) : (8'hbf)) || (8'hbb)) ? {(8'hb8)} : {((8'ha5) - (8'h9c)), ((8'hba) - (7'h40))}) : ({((8'hb2) | (8'hb0)), ((8'ha6) ? (8'h9f) : (8'ha0))} ? (((8'hb0) ? (8'h9d) : (8'ha0)) ? ((7'h42) ? (8'h9f) : (8'ha7)) : {(8'hac), (8'h9c)}) : ((8'hb5) <= ((8'ha1) ? (8'hac) : (8'hbd)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire signed [(5'h14):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire103;
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire103,
                 (1'h0)};
  assign wire4 = ($unsigned(($signed($unsigned(wire0)) ?
                         $unsigned((wire3 ^ wire2)) : (+$unsigned((8'hb2))))) ?
                     ((~^((~(8'hac)) ?
                         {wire2, wire2} : (wire3 ?
                             wire2 : wire0))) * wire2[(2'h3):(2'h2)]) : {((&(wire2 ?
                                 wire2 : wire1)) ?
                             ($signed(wire0) ^~ $signed(wire3)) : wire3[(1'h0):(1'h0)])});
  assign wire5 = (wire3[(3'h6):(3'h5)] - wire3[(1'h1):(1'h0)]);
  assign wire6 = ($signed(((~^$unsigned(wire2)) ?
                     wire3[(2'h2):(2'h2)] : wire2)) - $signed({$unsigned($unsigned(wire1)),
                     (wire0[(4'hb):(3'h5)] ?
                         {wire5, wire1} : (wire3 << wire1))}));
  assign wire7 = {(wire6 > {({(8'hba), wire6} == (wire6 ^~ wire4)),
                         (&$signed(wire3))}),
                     wire6};
  module8 #() modinst104 (wire103, clk, wire0, wire3, wire4, wire5, wire6);
  assign wire105 = $signed(wire2[(2'h3):(1'h1)]);
  assign wire106 = ((~&$unsigned(wire105[(3'h6):(1'h1)])) ?
                       $unsigned(((^~(~wire6)) ?
                           $unsigned((~^wire7)) : wire5[(2'h2):(1'h1)])) : (^~{{wire3,
                               $signed(wire5)},
                           (~|(wire6 ? (8'hb7) : wire7))}));
  assign wire107 = wire106;
  assign wire108 = (~wire1[(2'h3):(2'h2)]);
endmodule

module module8
#(parameter param101 = {(|((^((8'hbc) >= (8'hbc))) >> (((7'h40) ? (8'hb1) : (8'hb0)) ? {(8'h9c), (8'hbc)} : ((7'h42) > (7'h43)))))}, 
parameter param102 = {(~&param101)})
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire96;
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire22,
                 wire23,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire54,
                 wire96,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
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
                 (1'h0)};
  assign wire14 = wire9;
  assign wire15 = $signed((~$signed($signed({wire11}))));
  assign wire16 = wire14;
  assign wire17 = (wire13[(2'h2):(2'h2)] ?
                      ((|(wire10[(1'h1):(1'h0)] | wire15)) < wire12[(1'h0):(1'h0)]) : {$unsigned(wire11)});
  always
    @(posedge clk) begin
      reg18 <= wire11;
      reg19 <= $unsigned((+($signed(((7'h41) ?
          (8'hba) : reg18)) - {wire9[(4'hd):(2'h3)]})));
      reg20 <= $signed(({(!(^(8'ha8)))} > ((wire13 >= wire10) > (-wire10[(3'h6):(2'h3)]))));
      reg21 <= wire16[(2'h2):(2'h2)];
    end
  assign wire22 = wire11[(2'h2):(2'h2)];
  assign wire23 = wire9[(5'h11):(3'h7)];
  always
    @(posedge clk) begin
      reg24 <= $signed($signed(($unsigned((8'ha2)) + wire12[(3'h7):(2'h3)])));
      reg25 <= $signed(wire9[(1'h1):(1'h0)]);
      if (({$unsigned({wire16, wire22}), wire11} ?
          $signed((($signed(wire10) ? $signed(reg19) : (wire17 ^~ reg21)) ?
              wire12 : {$signed(wire10)})) : {wire15[(1'h0):(1'h0)], reg20}))
        begin
          reg26 <= $unsigned($unsigned((($signed(wire17) ^~ $signed(reg21)) - {$unsigned(reg20),
              wire13})));
          if (((8'haf) ? {wire11[(4'hb):(1'h0)], reg26} : reg25[(1'h1):(1'h1)]))
            begin
              reg27 <= wire11[(5'h11):(4'ha)];
            end
          else
            begin
              reg27 <= (((($unsigned(wire10) ? (-reg21) : (reg27 * (7'h44))) ?
                  (!(8'hbe)) : ($unsigned(wire16) << wire12)) << (~^(reg21 ?
                  reg24 : reg24))) ^~ (&($signed(((8'ha5) == wire17)) ~^ ($signed(reg27) ?
                  $signed(wire12) : $unsigned(reg25)))));
              reg28 <= $signed(wire23);
            end
          reg29 <= ($unsigned($unsigned(reg21[(2'h2):(1'h0)])) ?
              (8'ha3) : reg27);
          reg30 <= (8'ha5);
          if (reg19)
            begin
              reg31 <= (wire23[(3'h4):(2'h2)] ?
                  ($signed(($signed(reg25) != reg20[(2'h2):(1'h0)])) - $signed(reg19[(3'h6):(3'h5)])) : {(!((wire14 ?
                              (7'h41) : reg30) ?
                          (^~wire17) : $signed((7'h40)))),
                      {(reg25[(2'h3):(2'h2)] ?
                              (reg30 ? reg25 : wire13) : $signed(wire23)),
                          (wire14[(2'h3):(2'h2)] ?
                              $unsigned(wire12) : wire22)}});
              reg32 <= (^({wire11} ?
                  (-$unsigned((wire12 ?
                      wire11 : reg30))) : $signed(((&reg26) | (reg20 ^ reg31)))));
              reg33 <= wire15[(4'h8):(3'h5)];
              reg34 <= (($signed((wire12[(1'h0):(1'h0)] != (reg24 ?
                          wire15 : reg25))) ?
                      reg33 : (^(8'ha1))) ?
                  $unsigned($signed(reg21[(3'h5):(2'h3)])) : reg20[(1'h1):(1'h1)]);
              reg35 <= ((&$unsigned({wire10[(4'hc):(4'hc)]})) > {reg28[(3'h5):(1'h0)]});
            end
          else
            begin
              reg31 <= (^~{{reg28[(2'h3):(2'h2)]}});
              reg32 <= {($signed(reg19) && wire14)};
              reg33 <= $unsigned(wire13[(3'h5):(3'h5)]);
            end
        end
      else
        begin
          reg26 <= (wire15 ?
              $signed(reg21[(3'h7):(3'h6)]) : $signed((^$unsigned($signed(reg27)))));
          reg27 <= wire10[(3'h5):(2'h2)];
          reg28 <= ($unsigned((~(wire11 ? (reg32 == reg18) : wire14))) ?
              reg32[(1'h1):(1'h1)] : {(($signed(reg19) ?
                      reg26 : $unsigned(reg34)) >> ((reg32 ^ wire10) ?
                      reg33[(1'h1):(1'h0)] : wire23))});
          reg29 <= (&(reg25 >= (reg33 <= $signed((|wire17)))));
          if (wire13[(1'h0):(1'h0)])
            begin
              reg30 <= reg33[(1'h1):(1'h0)];
            end
          else
            begin
              reg30 <= (-(7'h40));
            end
        end
    end
  assign wire36 = (^((wire16[(1'h1):(1'h0)] | $signed((8'hb9))) ?
                      ((reg19[(1'h0):(1'h0)] ?
                          $signed((8'hbf)) : $unsigned(reg28)) - (~&wire17[(1'h1):(1'h1)])) : reg20[(4'hd):(4'h9)]));
  assign wire37 = $unsigned(reg34);
  assign wire38 = $signed(((!reg28[(2'h3):(1'h1)]) ?
                      $signed((reg20 ?
                          $unsigned(reg20) : (~&wire23))) : (~&reg25)));
  assign wire39 = $signed((^~(~&{(wire14 ? reg25 : reg20)})));
  assign wire40 = (wire11 ? (+((8'hbb) ^ reg35)) : $unsigned((8'ha8)));
  assign wire41 = wire10;
  assign wire42 = ({$unsigned(($unsigned(wire22) ?
                          $unsigned(reg21) : reg35))} >>> (($unsigned((reg31 && wire9)) ?
                          $signed($signed((8'h9c))) : ({wire40} ?
                              {wire13, (7'h41)} : wire11[(2'h2):(1'h1)])) ?
                      reg24 : (8'ha9)));
  assign wire43 = $signed($unsigned(reg33));
  assign wire44 = wire38;
  module45 #() modinst55 (wire54, clk, wire13, reg34, reg26, wire41);
  module56 #() modinst97 (wire96, clk, wire16, reg28, reg21, reg19);
  assign wire98 = ((~|wire15) ?
                      {($signed((^~(8'ha2))) ?
                              ($signed((8'hae)) - reg21[(3'h4):(2'h3)]) : $unsigned($signed(wire16))),
                          $signed($signed({wire54,
                              reg24}))} : reg27[(3'h6):(3'h4)]);
  assign wire99 = $unsigned($unsigned($signed(((reg32 < reg25) ?
                      (wire15 - reg26) : $signed(wire9)))));
  assign wire100 = (reg20[(3'h5):(2'h3)] ?
                       $signed({wire42[(4'hc):(1'h0)]}) : wire99[(3'h4):(3'h4)]);
endmodule

module module56
#(parameter param95 = (({(+((8'hb4) ~^ (7'h40))), ((+(8'ha1)) > ((8'hbe) ? (8'hb3) : (8'hb8)))} ? (({(8'hb3)} ? (|(8'ha4)) : (-(8'hb2))) ^ (|{(8'hab)})) : (~&({(8'ha6), (8'hbe)} ? (!(8'hb7)) : ((8'haf) == (8'haf))))) > (((&{(8'hb1)}) ? {((8'ha8) ? (8'hbb) : (8'haf)), (|(8'h9e))} : ((+(8'haf)) ? (&(8'haa)) : ((8'hbf) ? (7'h42) : (8'hb0)))) < ((((8'hac) != (8'hb5)) != ((8'hb7) - (8'ha1))) <<< (~^((8'hbd) > (8'hbf)))))))
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire60;
  input wire signed [(5'h10):(1'h0)] wire59;
  input wire [(4'hc):(1'h0)] wire58;
  input wire signed [(4'ha):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire89;
  wire [(5'h11):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire61;
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  assign y = {wire94,
                 wire91,
                 wire90,
                 wire89,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg93,
                 reg92,
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
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire61 = $signed($signed(wire59));
  assign wire62 = (wire59 << (-$signed((wire60 ?
                      {(8'ha4), wire57} : $signed(wire58)))));
  assign wire63 = ($unsigned(wire59) ?
                      (~&((~|(~|wire62)) && {(~&(8'ha0)),
                          $signed(wire58)})) : wire58);
  assign wire64 = (wire59 <= {(wire58 ?
                          (wire57[(2'h3):(2'h2)] >> $unsigned((8'hb4))) : $signed($unsigned((8'hb9))))});
  assign wire65 = ((-wire62) ?
                      wire62 : (&($unsigned($unsigned(wire63)) <= ((-(8'hbe)) + (wire63 == wire61)))));
  always
    @(posedge clk) begin
      reg66 <= wire61;
      if ((wire63 ^~ ({wire63[(4'hb):(4'h9)]} ~^ ((wire58[(3'h7):(3'h6)] <<< wire62) <= (-$signed(wire60))))))
        begin
          reg67 <= wire65[(5'h12):(4'ha)];
          reg68 <= wire57;
        end
      else
        begin
          if ((reg68 >= $signed(wire59)))
            begin
              reg67 <= (wire59 ?
                  ((~|$signed({(8'haa), reg68})) ?
                      $unsigned((^~(8'ha2))) : (^~(!$unsigned((7'h41))))) : $unsigned(wire57[(3'h6):(1'h0)]));
              reg68 <= ($unsigned((((+wire57) == wire60) && $signed(wire65))) ?
                  $signed((($signed(wire58) ? $signed(wire57) : (8'hac)) ?
                      $unsigned(wire58[(1'h1):(1'h1)]) : (((8'hb2) == reg68) ?
                          wire57 : $unsigned(wire60)))) : $signed((&$unsigned(wire62[(3'h4):(2'h2)]))));
            end
          else
            begin
              reg67 <= wire59[(4'hf):(3'h5)];
              reg68 <= ((($unsigned((wire64 ~^ wire65)) ?
                  wire61 : $unsigned($signed(wire60))) >> wire57) || $signed(wire59));
              reg69 <= reg68[(3'h7):(1'h0)];
              reg70 <= ((+($unsigned($unsigned(reg69)) >= wire65)) - (-wire60));
            end
          reg71 <= wire59;
        end
      reg72 <= $unsigned($signed(((^~wire59[(2'h2):(1'h1)]) ?
          reg71[(4'h9):(2'h3)] : {$signed(wire57), (~^wire60)})));
    end
  assign wire73 = $unsigned($unsigned((!reg66)));
  assign wire74 = $signed(wire73[(3'h4):(3'h4)]);
  assign wire75 = (^~($unsigned($unsigned($signed(wire60))) ?
                      (^~$unsigned({wire57})) : wire64[(2'h2):(1'h0)]));
  assign wire76 = ((^($signed(((8'hb0) ? wire58 : wire60)) ?
                          ($unsigned(reg69) || {reg71, (8'ha8)}) : ((wire59 ?
                                  wire57 : wire60) ?
                              (~^wire57) : reg70[(5'h13):(4'hc)]))) ?
                      reg68 : $signed(((((8'haa) ?
                          reg67 : wire73) ^~ (reg70 + reg66)) != reg66)));
  assign wire77 = (+(!$unsigned($signed((reg70 ^ reg69)))));
  always
    @(posedge clk) begin
      if (reg71)
        begin
          reg78 <= $unsigned(reg67[(4'hc):(3'h6)]);
        end
      else
        begin
          reg78 <= reg69;
          reg79 <= ({reg69,
              {{wire61, (reg71 | reg78)}}} >>> (~&reg69[(4'h8):(3'h6)]));
          reg80 <= wire73[(2'h2):(1'h0)];
        end
      if (wire74[(2'h2):(1'h1)])
        begin
          reg81 <= $unsigned({($signed((-wire61)) == reg79[(3'h6):(1'h0)]),
              reg71});
        end
      else
        begin
          reg81 <= reg79;
          if (wire76)
            begin
              reg82 <= (((($signed(wire63) ?
                      $unsigned(wire76) : wire61) >> reg79) ?
                  $signed(($signed(wire76) ^ (^wire77))) : ($unsigned(((8'hba) - wire62)) ?
                      $signed($unsigned(wire64)) : (!wire58[(4'h8):(3'h7)]))) & ({reg66,
                  ($unsigned(wire58) ?
                      reg80 : (wire76 ?
                          wire60 : (8'hac)))} ^~ $unsigned((~^$signed(reg71)))));
            end
          else
            begin
              reg82 <= (^wire76[(3'h4):(1'h1)]);
              reg83 <= wire60;
              reg84 <= $unsigned((^((-$signed(reg71)) - wire59)));
              reg85 <= wire57[(3'h5):(1'h1)];
              reg86 <= ((~^(({wire77, wire74} ?
                          wire75[(1'h1):(1'h1)] : (wire57 ? reg84 : wire62)) ?
                      (^~$unsigned(reg66)) : (8'hbf))) ?
                  reg85[(4'ha):(1'h0)] : (reg72[(4'ha):(1'h1)] == $signed(wire59[(2'h3):(2'h3)])));
            end
          reg87 <= $signed($unsigned(($signed((!reg82)) ?
              (^~{reg71, wire57}) : $unsigned((reg82 << reg72)))));
        end
      reg88 <= (!{reg67});
    end
  assign wire89 = (reg82[(3'h5):(2'h3)] && $signed($unsigned(wire74)));
  assign wire90 = (reg66 | reg81[(2'h3):(1'h1)]);
  assign wire91 = $signed(($signed(reg85[(1'h1):(1'h0)]) ?
                      wire58[(3'h5):(3'h4)] : wire75[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg92 <= $unsigned(((&$signed($unsigned(wire63))) | $unsigned(reg81)));
      reg93 <= $signed(({(reg81 >= (wire74 >>> reg86))} ?
          wire59 : (({reg88, (8'hb7)} ? (8'hb0) : $unsigned(wire75)) ?
              ($signed(wire59) - reg85[(2'h2):(2'h2)]) : ($unsigned(reg84) + $unsigned(wire75)))));
    end
  assign wire94 = $unsigned(((((8'hb3) ?
                      wire64 : $unsigned(wire58)) + wire64[(1'h0):(1'h0)]) && ((|{reg85}) ?
                      (-wire59) : wire61[(3'h4):(2'h3)])));
endmodule

module module45  (y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire49;
  input wire [(4'he):(1'h0)] wire48;
  input wire [(4'ha):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  assign y = {wire53, wire52, wire51, wire50, (1'h0)};
  assign wire50 = ($unsigned($unsigned(((~wire47) ?
                          ((7'h40) >= (8'hb1)) : ((7'h44) - wire49)))) ?
                      (wire49 >= (8'hb2)) : {$signed(wire49[(3'h6):(3'h5)]),
                          $unsigned(({wire47} ^~ $unsigned(wire46)))});
  assign wire51 = $signed({$unsigned(wire50)});
  assign wire52 = (((wire49[(1'h1):(1'h0)] - wire47[(4'h9):(3'h5)]) || $unsigned($unsigned((wire50 != wire46)))) ?
                      $unsigned((wire49 | $unsigned(wire51[(3'h4):(3'h4)]))) : ($signed(wire48) ?
                          ((+$signed(wire46)) * (|$signed(wire49))) : wire50[(1'h1):(1'h1)]));
  assign wire53 = $signed(wire50[(1'h0):(1'h0)]);
endmodule
