module top
#(parameter param110 = (!({(+(8'ha8)), ((~^(8'hb7)) <= {(8'hb7)})} << (|(((8'had) > (8'hb6)) <= {(8'hb0)})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire96;
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire4,
                 wire96,
                 reg109,
                 reg108,
                 reg105,
                 (1'h0)};
  assign wire4 = (8'hbf);
  module5 #() modinst97 (wire96, clk, wire3, wire1, wire2, wire0, wire4);
  assign wire98 = $unsigned($signed(wire0));
  assign wire99 = (^(7'h40));
  assign wire100 = wire4[(3'h4):(1'h0)];
  assign wire101 = (!{$signed($signed($signed(wire100)))});
  assign wire102 = {(wire3 || wire101), wire101[(4'ha):(4'h8)]};
  assign wire103 = ((~&{$unsigned(wire99),
                       wire100}) == {(!$signed(((8'hb6) != wire101))),
                       wire101});
  assign wire104 = wire3[(4'ha):(3'h5)];
  always
    @(posedge clk) begin
      reg105 <= wire100[(2'h2):(1'h1)];
    end
  assign wire106 = reg105[(3'h4):(2'h2)];
  assign wire107 = $signed((&wire100));
  always
    @(posedge clk) begin
      reg108 <= $signed(wire3);
      reg109 <= (wire98[(1'h0):(1'h0)] ?
          ($signed($signed((reg105 >>> (8'hbb)))) ?
              $unsigned($signed(reg108[(1'h0):(1'h0)])) : (^$signed((~wire106)))) : wire103);
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire90;
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire43,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire90,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 (1'h0)};
  module11 #() modinst44 (.clk(clk), .wire12(wire8), .wire15(wire10), .wire13(wire7), .y(wire43), .wire16(wire9), .wire14(wire6));
  always
    @(posedge clk) begin
      if ((!(~wire10)))
        begin
          reg45 <= (wire43 << $signed($unsigned({(wire7 || wire9),
              $unsigned((8'hae))})));
          reg46 <= ({$unsigned({$unsigned(wire43),
                  wire7})} < (((wire10 < (wire6 ? wire9 : reg45)) ?
              $signed({wire9,
                  wire8}) : wire7[(4'he):(1'h1)]) | (~^(wire9[(5'h12):(1'h1)] ?
              (&(8'ha4)) : $signed(reg45)))));
          if ((~((8'hbc) ? (7'h40) : (^(8'hbd)))))
            begin
              reg47 <= $unsigned(wire10[(4'h9):(4'h9)]);
            end
          else
            begin
              reg47 <= ((!reg47[(3'h6):(3'h6)]) != ({(~^reg47[(1'h1):(1'h0)]),
                      $unsigned({wire43})} ?
                  (~^(reg47 ?
                      (+wire9) : $unsigned((8'h9e)))) : (wire6[(2'h2):(1'h1)] ?
                      ($signed(reg45) ?
                          (wire9 >>> wire9) : reg45) : $signed((reg45 & reg46)))));
              reg48 <= reg45[(5'h11):(4'he)];
              reg49 <= $signed((+((~(~reg45)) && $unsigned((~&(8'ha8))))));
              reg50 <= (wire8 & $signed(((^$unsigned(reg47)) >= $unsigned((reg49 ?
                  (8'ha7) : wire43)))));
              reg51 <= {(^$signed($unsigned(reg50[(4'hb):(4'h8)])))};
            end
          reg52 <= ($unsigned((^$signed($signed((8'h9f))))) ~^ $unsigned((^~reg51[(1'h0):(1'h0)])));
        end
      else
        begin
          reg45 <= (reg50 ~^ $unsigned(($unsigned(reg49) ?
              $unsigned($signed((8'hba))) : ((8'hab) ^~ (-(8'hac))))));
        end
    end
  assign wire53 = ($unsigned(reg46[(3'h7):(3'h7)]) ?
                      (wire8 + (~&reg48)) : $signed({(~|(reg49 | wire8)),
                          ((reg45 + reg46) ? (^~reg47) : $unsigned(reg47))}));
  assign wire54 = wire53[(3'h4):(3'h4)];
  assign wire55 = ((~(-$signed((~&(7'h40))))) ^ {({(wire6 ? wire10 : (8'ha5)),
                          reg49} - $signed(wire6)),
                      (-(-$unsigned(reg46)))});
  assign wire56 = reg50[(3'h5):(1'h0)];
  assign wire57 = wire8[(1'h0):(1'h0)];
  module58 #() modinst91 (wire90, clk, wire56, wire9, wire8, reg47);
  assign wire92 = $unsigned(((~^($unsigned(reg49) - {wire90})) <<< ($signed((-(8'hb6))) ?
                      ((~|reg46) > $unsigned(wire6)) : {$signed(reg47),
                          (reg45 ? wire53 : (8'ha1))})));
  assign wire93 = (reg45 >= (wire55[(2'h3):(2'h3)] * (~&(~|wire56))));
  assign wire94 = (^~wire54);
  assign wire95 = wire8;
endmodule

module module58
#(parameter param89 = (({(((8'hb0) >= (7'h42)) ~^ ((8'h9c) <= (8'hb3))), {{(8'hac)}}} >>> (8'hae)) ? ((((^~(8'hb4)) ? ((8'ha7) ? (8'h9c) : (8'ha6)) : ((8'hb6) ? (8'haa) : (7'h42))) ? (((8'ha1) <<< (8'hbb)) >= {(7'h43)}) : (((8'hae) != (8'hb9)) <= (+(8'ha2)))) ? ((((8'h9d) ? (8'had) : (8'ha3)) ? {(8'hae), (8'ha9)} : ((8'hb6) ^~ (8'hba))) > (((7'h41) >= (8'hac)) ? ((7'h43) < (8'ha9)) : ((8'hb0) ? (8'hbe) : (8'hb8)))) : (~^({(8'hbd), (8'ha0)} ? (8'hb1) : (&(8'ha4))))) : (!(^~(((8'h9e) ? (8'hb8) : (8'hab)) ? (8'hb4) : ((8'hba) ? (8'ha7) : (8'hbc)))))))
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire62;
  input wire [(4'h8):(1'h0)] wire61;
  input wire signed [(5'h15):(1'h0)] wire60;
  input wire [(3'h4):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire69,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
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
                 reg68,
                 (1'h0)};
  assign wire63 = $signed(((wire62[(4'h8):(1'h1)] | $unsigned($unsigned(wire61))) ?
                      ($unsigned($unsigned(wire60)) | ($signed(wire60) ^ (wire60 && wire59))) : wire60));
  assign wire64 = wire62;
  assign wire65 = $signed(($signed(wire61[(3'h5):(2'h3)]) << (!(~^wire64[(1'h0):(1'h0)]))));
  assign wire66 = ($signed((~|($unsigned(wire62) ?
                          wire61 : wire62[(3'h4):(1'h1)]))) ?
                      wire63[(3'h5):(2'h2)] : ($unsigned(wire63[(4'h9):(4'h9)]) ?
                          $signed((^~wire65[(4'hb):(3'h7)])) : (8'hbd)));
  assign wire67 = $unsigned(($signed((^~$signed(wire64))) + {((wire63 ^ wire61) ^~ {wire60,
                          wire59})}));
  always
    @(posedge clk) begin
      reg68 <= wire62;
    end
  assign wire69 = {$signed((((8'hb0) << {(8'hac),
                          wire61}) == $unsigned(wire65))),
                      ($unsigned((~(wire60 ? wire61 : wire59))) ?
                          $unsigned(((wire63 ? wire64 : wire65) ?
                              wire59[(1'h1):(1'h0)] : $signed(wire63))) : (((wire62 ?
                                  wire62 : wire65) ?
                              (wire61 ? wire63 : reg68) : (wire64 ?
                                  wire59 : (8'hb9))) != ($unsigned(wire66) <= ((8'hb6) > (8'hb1)))))};
  always
    @(posedge clk) begin
      reg70 <= $signed($unsigned($unsigned($signed(wire59))));
      if (wire59[(1'h1):(1'h0)])
        begin
          reg71 <= (reg68[(1'h0):(1'h0)] ^ (8'hb8));
          reg72 <= (wire63 ^ ($signed((+reg70[(3'h5):(1'h1)])) - wire60[(1'h0):(1'h0)]));
          if (((^~{$signed((wire61 & wire66))}) ?
              (&$unsigned(wire62[(2'h3):(1'h0)])) : wire67))
            begin
              reg73 <= $signed((8'hbf));
            end
          else
            begin
              reg73 <= {$signed(wire69)};
              reg74 <= wire60[(5'h11):(3'h7)];
              reg75 <= ({{reg72}} >= $unsigned(($unsigned(reg74) && reg71)));
              reg76 <= wire66[(1'h0):(1'h0)];
              reg77 <= wire69;
            end
          reg78 <= $signed((&((~$signed(wire59)) ?
              ($signed(wire65) << {wire66, reg70}) : (8'haa))));
        end
      else
        begin
          reg71 <= reg76[(5'h12):(1'h1)];
        end
      reg79 <= (({(&$signed((8'haf)))} && wire64) | (wire67[(3'h5):(2'h3)] ?
          {({reg74,
                  reg74} < $unsigned((8'hab)))} : ($unsigned(wire69[(1'h0):(1'h0)]) ?
              reg73[(3'h5):(1'h1)] : ((+wire59) ?
                  wire69[(4'ha):(3'h4)] : $signed(wire69)))));
      reg80 <= (!wire61[(3'h4):(2'h3)]);
    end
  assign wire81 = $signed(wire60);
  assign wire82 = wire67;
  assign wire83 = $unsigned(reg76);
  assign wire84 = reg77[(1'h0):(1'h0)];
  assign wire85 = ({(~|((reg71 > wire69) ?
                              {wire66, wire63} : (wire81 ? reg72 : reg77)))} ?
                      ((|(~reg74[(3'h4):(1'h0)])) ~^ $signed(reg78[(3'h6):(2'h2)])) : (8'hb5));
  assign wire86 = reg79;
  assign wire87 = $signed(reg80[(2'h2):(1'h0)]);
  assign wire88 = $signed($signed($signed((&$unsigned(wire85)))));
endmodule

module module11
#(parameter param41 = (~|((({(8'hb5), (8'ha2)} ? (|(7'h43)) : (~|(8'haf))) >>> ((-(8'ha8)) | (+(7'h43)))) ^ ((7'h43) * (((8'ha3) ~^ (8'hb2)) ? (8'h9f) : ((8'h9e) - (8'hb1)))))), 
parameter param42 = (-(param41 << (|(!(~param41))))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  assign y = {wire40,
                 wire25,
                 wire18,
                 wire17,
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
                 reg27,
                 reg26,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = ($unsigned(wire12[(4'hc):(4'h9)]) ?
                      ({wire13[(4'hf):(3'h6)],
                              ((~wire13) == wire14[(2'h2):(2'h2)])} ?
                          (wire15[(2'h3):(2'h3)] ^~ {(~|wire12),
                              (&wire13)}) : $unsigned(({wire15,
                              wire13} < $unsigned(wire16)))) : ((+$unsigned((|wire16))) <<< wire13));
  assign wire18 = wire12;
  always
    @(posedge clk) begin
      if ({($signed($unsigned($signed(wire17))) ?
              (+($signed(wire18) - (wire13 >= wire16))) : (wire14 & wire18)),
          {wire12[(4'hb):(3'h7)],
              (wire17[(4'hc):(4'ha)] ? wire18 : $unsigned(wire18))}})
        begin
          reg19 <= {(|wire18[(4'hd):(1'h0)])};
          reg20 <= (wire13[(1'h1):(1'h1)] >= ((wire13 != (&(wire12 ~^ wire14))) ?
              ($signed(wire12[(4'hc):(3'h4)]) ^~ {$signed((7'h43))}) : $unsigned(reg19[(2'h2):(1'h0)])));
          reg21 <= (^$signed({({wire14, reg19} ^~ $unsigned(wire14)),
              $signed($signed(wire12))}));
          reg22 <= wire13[(1'h0):(1'h0)];
          reg23 <= $unsigned(wire17[(4'h9):(3'h5)]);
        end
      else
        begin
          if ((8'hba))
            begin
              reg19 <= {wire15[(1'h0):(1'h0)], reg22[(4'hb):(3'h4)]};
              reg20 <= (~((wire17[(5'h10):(4'h9)] - (|(wire15 ?
                  (8'h9e) : reg22))) || (wire13[(4'hc):(1'h0)] ?
                  reg22[(5'h10):(2'h3)] : wire15)));
            end
          else
            begin
              reg19 <= $signed($signed((wire16[(3'h6):(3'h6)] <<< reg23)));
              reg20 <= $signed(wire12);
              reg21 <= wire16;
              reg22 <= reg21[(2'h3):(1'h1)];
              reg23 <= (($signed(((reg20 ? reg21 : wire15) ?
                          (reg19 >= wire13) : $signed(reg20))) ?
                      wire15[(4'hc):(1'h1)] : reg23[(3'h4):(1'h1)]) ?
                  $unsigned(wire13) : ({wire16[(2'h3):(1'h0)]} ?
                      (reg19[(3'h4):(2'h2)] ?
                          ($unsigned(reg19) * $signed(wire13)) : ((!(8'hb4)) ?
                              (wire16 | reg19) : wire17)) : ((!reg19) == {(~&wire13),
                          (reg19 && wire15)})));
            end
          reg24 <= (^$signed(wire16[(3'h6):(3'h6)]));
        end
    end
  assign wire25 = reg21;
  always
    @(posedge clk) begin
      reg26 <= (8'hb4);
      if (({(wire16 < $signed($signed(reg24))), wire16} < reg23))
        begin
          if ($unsigned((~&{(wire12 && (8'hb4))})))
            begin
              reg27 <= $unsigned(wire13);
              reg28 <= $signed(wire12[(3'h5):(3'h4)]);
            end
          else
            begin
              reg27 <= (^~(&((&$signed((8'hb1))) < {(reg20 >> wire12)})));
              reg28 <= (8'ha9);
              reg29 <= $signed($signed(reg23[(3'h5):(2'h3)]));
              reg30 <= ((&(reg19[(2'h3):(1'h1)] ?
                  {(|wire17),
                      reg22[(1'h0):(1'h0)]} : $signed($unsigned(wire13)))) ^ $unsigned($unsigned({{reg22,
                      reg22},
                  (wire12 + reg29)})));
              reg31 <= (&wire17);
            end
        end
      else
        begin
          reg27 <= wire18;
          reg28 <= reg21[(1'h0):(1'h0)];
        end
      if ({(^~$unsigned({$unsigned(reg28)}))})
        begin
          reg32 <= $unsigned(reg21);
          reg33 <= (7'h44);
          reg34 <= (|($unsigned((|((8'ha8) >> wire25))) + {reg26}));
        end
      else
        begin
          reg32 <= wire14;
          reg33 <= wire17;
          reg34 <= reg27[(3'h6):(1'h0)];
          if ((8'hac))
            begin
              reg35 <= wire13;
            end
          else
            begin
              reg35 <= $unsigned({(~^reg33),
                  ({reg21} ?
                      reg19[(3'h4):(3'h4)] : ((8'hae) ?
                          reg29[(2'h3):(2'h2)] : {wire15, (8'haa)}))});
              reg36 <= ((&(!(!(reg30 ? wire16 : reg32)))) ?
                  (~$signed((((8'ha0) ? reg21 : wire18) ?
                      wire12[(2'h2):(1'h1)] : $unsigned(reg29)))) : ($unsigned((reg29 ?
                          wire13 : (reg21 ? reg26 : (8'hbd)))) ?
                      $signed(($unsigned(reg35) ?
                          $signed(wire14) : reg26[(3'h4):(1'h0)])) : (~|{{reg20,
                              (8'hb3)},
                          {reg31}})));
              reg37 <= ({reg34} != (({reg31} == ({reg36, reg28} - (reg26 ?
                  wire13 : (8'hbb)))) || ({$unsigned(reg21)} <= reg30)));
            end
          reg38 <= reg29;
        end
      reg39 <= {wire17,
          $signed((wire14 ?
              (reg37 ? (!(8'hbf)) : $signed(reg19)) : {(wire13 >>> reg19)}))};
    end
  assign wire40 = reg19;
endmodule
