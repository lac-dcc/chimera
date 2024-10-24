module top
#(parameter param115 = (~|(|(((!(8'hae)) > (-(8'hb7))) ? ((~(8'ha9)) ? (8'hbb) : {(8'ha4), (8'hb7)}) : {(-(8'hb5))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire110;
  wire signed [(2'h2):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg106 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire89,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg114,
                 reg113,
                 reg112,
                 reg109,
                 reg108,
                 reg107,
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
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = $signed(((wire0[(2'h2):(1'h0)] ?
                     ((~wire2) ?
                         (wire3 * wire1) : (!(8'hb5))) : wire3[(2'h3):(1'h1)]) ~^ wire4));
  assign wire7 = $unsigned($unsigned((~&((!wire1) < (wire5 ?
                     wire0 : (8'hbf))))));
  assign wire8 = $unsigned((~^(&((+wire1) >>> wire1[(2'h2):(1'h1)]))));
  assign wire9 = ($signed(((wire6 ^~ wire7) ?
                     wire3[(2'h2):(1'h1)] : {$signed(wire0),
                         (!wire6)})) >= (~^(&wire3)));
  module10 #() modinst90 (wire89, clk, wire6, wire0, wire3, wire9);
  always
    @(posedge clk) begin
      reg91 <= ((~wire3) ?
          (wire0 & $unsigned(((|wire6) ?
              (wire7 || wire2) : (8'h9d)))) : wire5[(4'hb):(4'ha)]);
      reg92 <= (+$signed((wire0 ?
          ((~wire89) ?
              {wire0,
                  reg91} : wire1[(2'h2):(1'h0)]) : (wire0[(4'h9):(1'h0)] ^ (-wire7)))));
      reg93 <= $unsigned((~&$unsigned((((8'hb5) ?
          reg92 : wire2) != (-wire2)))));
      if ($unsigned(wire6[(1'h0):(1'h0)]))
        begin
          reg94 <= {($unsigned(wire9) <<< (8'h9c)),
              $unsigned(($signed($signed(wire4)) * ((8'ha8) ?
                  $signed(reg92) : wire9)))};
        end
      else
        begin
          reg94 <= ($signed(({wire8} > wire9[(3'h4):(2'h2)])) ?
              (8'h9e) : reg94[(3'h5):(3'h4)]);
          if ($unsigned((~reg94)))
            begin
              reg95 <= wire0[(5'h11):(4'hc)];
            end
          else
            begin
              reg95 <= wire8;
              reg96 <= ($unsigned((+$unsigned((^~(8'hab))))) || (wire0 ?
                  wire4[(5'h11):(2'h2)] : $unsigned((((8'haf) >> wire4) | $signed(reg92)))));
              reg97 <= wire4[(3'h7):(3'h7)];
              reg98 <= $signed(wire9);
              reg99 <= reg94;
            end
          reg100 <= $signed($unsigned((+$unsigned(wire6))));
          reg101 <= $unsigned($unsigned(wire5));
        end
      if (($signed((!{wire6[(2'h3):(1'h0)]})) - ((~&$signed({wire4})) != (({wire3} ?
          $signed(reg95) : (wire5 * reg98)) ^~ {$unsigned(wire4),
          $unsigned(wire2)}))))
        begin
          if (wire7[(1'h1):(1'h0)])
            begin
              reg102 <= ((!reg95[(3'h4):(1'h1)]) && ((~&$unsigned(wire5)) || (!($unsigned(wire5) ?
                  $unsigned(wire1) : $signed(reg97)))));
              reg103 <= $unsigned(wire0);
              reg104 <= $unsigned(wire7);
              reg105 <= reg104;
            end
          else
            begin
              reg102 <= $signed(($unsigned($unsigned($signed(wire5))) - ({(8'hb9),
                      {wire9}} ?
                  wire5[(4'h8):(3'h4)] : (reg97[(3'h4):(2'h3)] >> reg98[(3'h5):(3'h5)]))));
              reg103 <= $signed(($signed(wire89) ?
                  {$unsigned((wire3 != wire0)),
                      (|reg97)} : $unsigned((reg94[(4'h9):(1'h0)] == $unsigned(wire5)))));
              reg104 <= $unsigned({$unsigned($signed(reg95)),
                  $unsigned(($unsigned(wire6) ?
                      wire1[(1'h1):(1'h0)] : $signed(wire9)))});
              reg105 <= ($signed(($signed((wire0 >> reg91)) ?
                  ((&wire2) ?
                      ((8'ha5) ?
                          wire7 : reg94) : reg92[(4'ha):(1'h0)]) : wire8[(1'h0):(1'h0)])) >>> reg99[(2'h2):(1'h0)]);
              reg106 <= $signed((~&reg99[(1'h0):(1'h0)]));
            end
          if ({({$signed((wire2 > reg104))} == reg97),
              (($signed($unsigned((7'h44))) ?
                  (^$signed(reg96)) : (~(8'ha3))) >>> wire0)})
            begin
              reg107 <= reg101[(4'h8):(1'h1)];
              reg108 <= $unsigned(((^~(wire6[(4'hf):(4'hc)] ~^ $signed((7'h44)))) >>> (!wire8[(1'h0):(1'h0)])));
              reg109 <= $signed(wire2);
            end
          else
            begin
              reg107 <= ((^wire8[(2'h3):(1'h1)]) <<< (|(|(((7'h44) ?
                  reg98 : reg101) * $unsigned(reg102)))));
              reg108 <= (^~reg102[(2'h3):(2'h2)]);
              reg109 <= ({(8'hb8)} ?
                  (reg107 ^~ $signed(($unsigned(wire8) ?
                      $signed(wire1) : (reg98 >= wire89)))) : reg106);
            end
        end
      else
        begin
          if ({({((~reg92) ? reg92 : (-reg97)), reg106[(2'h3):(2'h3)]} ?
                  ($signed($signed(reg96)) == ({(8'ha9),
                      reg101} ^ $signed(reg108))) : reg97[(4'h9):(2'h3)]),
              ((+((wire4 > reg107) ? (~&(8'ha4)) : $unsigned(reg109))) ?
                  ((reg109 ? ((8'ha5) != (8'hbc)) : $signed(reg93)) ?
                      (~&{reg107}) : reg92[(3'h4):(1'h0)]) : (wire0 - ($unsigned((8'hac)) | (reg103 <<< reg106))))})
            begin
              reg102 <= wire4[(4'hc):(3'h6)];
              reg103 <= wire5;
              reg104 <= (((reg100 < $signed(wire6)) ?
                  $signed(wire0[(4'he):(4'hd)]) : (|$signed((reg105 ?
                      (8'haf) : wire6)))) + reg92);
              reg105 <= wire6;
            end
          else
            begin
              reg102 <= ($signed(reg100) >= $signed((reg102 ?
                  $signed((wire6 ? reg107 : wire89)) : reg105[(1'h1):(1'h0)])));
              reg103 <= (reg97 || (+reg97));
              reg104 <= (|reg96[(2'h2):(2'h2)]);
              reg105 <= (~|reg100[(3'h6):(2'h3)]);
              reg106 <= $unsigned(wire4[(1'h0):(1'h0)]);
            end
          reg107 <= (($unsigned(reg108[(1'h1):(1'h0)]) <= (reg94 ?
              wire9 : reg106[(4'he):(1'h1)])) ~^ wire9);
          reg108 <= (~|(wire9 != reg99));
          reg109 <= (reg96[(1'h1):(1'h0)] && {(wire0[(1'h0):(1'h0)] ?
                  $signed((8'ha6)) : $unsigned((wire7 * (8'ha0))))});
        end
    end
  assign wire110 = reg103;
  assign wire111 = reg97;
  always
    @(posedge clk) begin
      reg112 <= {$signed($unsigned(wire110[(1'h1):(1'h1)]))};
      reg113 <= wire89;
      reg114 <= $signed(reg112[(4'ha):(2'h3)]);
    end
endmodule

module module10
#(parameter param87 = (8'haa), 
parameter param88 = (~|(|param87)))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(2'h3):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire80,
                 wire56,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg83,
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
                 (1'h0)};
  assign wire15 = ((+($unsigned(wire11) ?
                      (~^{(8'ha1), wire13}) : {$signed(wire11)})) >> wire12);
  assign wire16 = ((~&($unsigned((wire11 ? wire11 : wire13)) ?
                          (wire15 + $signed(wire15)) : (wire11[(4'ha):(2'h3)] ?
                              (wire15 ? wire14 : wire11) : wire12))) ?
                      ((8'hae) << (8'ha6)) : (wire15 * $signed(wire13[(5'h14):(4'ha)])));
  assign wire17 = $unsigned((wire11 >> (~({wire13} ?
                      $unsigned(wire12) : wire16[(3'h6):(3'h6)]))));
  assign wire18 = ((($signed(((8'hbd) ?
                          wire16 : wire16)) <= $unsigned(wire17)) > wire17) ?
                      (|(wire13[(5'h12):(3'h7)] ~^ wire16)) : wire14[(1'h0):(1'h0)]);
  assign wire19 = wire16[(1'h0):(1'h0)];
  assign wire20 = (~((wire14[(1'h1):(1'h0)] ?
                          wire19[(2'h2):(2'h2)] : ((^~wire15) ?
                              {(8'hac)} : wire16)) ?
                      $unsigned(wire14[(1'h1):(1'h0)]) : $signed(($unsigned(wire14) ?
                          $unsigned((8'ha7)) : wire17[(4'hb):(2'h2)]))));
  assign wire21 = wire17[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (((($signed({wire12}) != wire20[(3'h7):(1'h1)]) ?
          (wire18 ?
              $unsigned((wire19 ?
                  (8'ha6) : wire13)) : $unsigned($unsigned((8'ha3)))) : wire13[(3'h6):(3'h6)]) <<< (&(|wire18))))
        begin
          if (wire21[(4'h8):(2'h3)])
            begin
              reg22 <= $signed({(~$unsigned((~&wire12)))});
              reg23 <= (|(|reg22[(1'h1):(1'h1)]));
              reg24 <= (wire17[(4'he):(4'hc)] >= wire17);
              reg25 <= $signed(wire20[(4'h8):(3'h4)]);
              reg26 <= (reg25[(2'h3):(1'h0)] & $signed((^~$unsigned((&reg22)))));
            end
          else
            begin
              reg22 <= wire18[(3'h6):(1'h1)];
            end
        end
      else
        begin
          if ($unsigned($signed((wire11 ?
              ({wire16, reg24} ?
                  wire20[(3'h6):(2'h2)] : $unsigned(wire14)) : $unsigned((7'h42))))))
            begin
              reg22 <= $signed(reg23);
              reg23 <= wire12;
              reg24 <= (wire18 ^~ wire19[(1'h1):(1'h1)]);
              reg25 <= ($unsigned({$unsigned($signed(reg22)),
                  ((8'ha9) ?
                      $signed((8'ha3)) : {(7'h41),
                          wire15})}) <<< ((~(((7'h40) && reg22) - $signed(wire15))) ?
                  $unsigned(reg22) : wire16));
            end
          else
            begin
              reg22 <= (+(($signed(wire18) << ((-wire21) ?
                  (wire17 >> wire21) : $unsigned((8'hb2)))) < $unsigned(reg23)));
            end
          reg26 <= ($unsigned({({wire18} ?
                      $unsigned(reg22) : reg23[(2'h3):(2'h2)]),
                  ((8'hab) ? wire20 : ((8'hb5) ? wire12 : reg22))}) ?
              ((wire13 ? wire15[(3'h4):(1'h1)] : wire11) & (-({wire21} ?
                  {wire21,
                      wire15} : $signed(wire11)))) : $signed({wire20[(3'h5):(2'h2)]}));
          if (wire16)
            begin
              reg27 <= {((8'hb0) ?
                      {reg22[(3'h7):(2'h2)],
                          ((wire19 ?
                              wire11 : (8'haf)) & $signed(wire15))} : $unsigned(wire14)),
                  reg25[(4'hb):(1'h1)]};
              reg28 <= $unsigned((({$unsigned(reg23),
                  (wire13 <= wire11)} >= wire14) || reg27[(2'h2):(2'h2)]));
              reg29 <= (^~reg27[(2'h2):(1'h0)]);
              reg30 <= (8'hbd);
            end
          else
            begin
              reg27 <= wire21;
              reg28 <= $signed(wire18[(3'h4):(2'h2)]);
            end
          reg31 <= wire15[(4'ha):(3'h4)];
          reg32 <= wire12[(1'h1):(1'h0)];
        end
      reg33 <= $signed((-$signed($signed(wire19))));
      if ($unsigned({(^~(~&wire19[(2'h2):(2'h2)]))}))
        begin
          reg34 <= (~$signed($signed((reg31 ^ (reg26 ? wire21 : (8'hb2))))));
          reg35 <= ($signed($unsigned($unsigned(((8'ha5) ? wire19 : reg24)))) ?
              $signed($unsigned(({wire17,
                  wire20} ^ (+wire11)))) : {(~|($unsigned(wire12) ?
                      {wire19, wire15} : reg34[(4'ha):(1'h1)]))});
          if (reg33[(3'h7):(1'h1)])
            begin
              reg36 <= reg23[(3'h5):(1'h0)];
              reg37 <= ((+$unsigned(reg23)) + {((-(~wire21)) ?
                      $signed($unsigned(reg24)) : reg24[(1'h1):(1'h1)])});
              reg38 <= wire11[(4'hc):(4'ha)];
            end
          else
            begin
              reg36 <= $signed($unsigned((reg26[(3'h4):(3'h4)] ?
                  ($unsigned(reg31) >> reg34[(4'hc):(4'ha)]) : ({wire13,
                          (8'ha8)} ?
                      $signed(reg35) : (~reg23)))));
              reg37 <= $signed((($signed(reg35[(3'h4):(1'h1)]) ?
                      ((reg28 ? wire14 : wire18) < (-(8'hbc))) : {wire14,
                          {(8'hb4)}}) ?
                  reg27 : (((reg37 ? wire17 : reg36) ?
                          $unsigned(reg26) : (^reg24)) ?
                      ((reg38 ? (8'ha8) : wire12) << (wire11 ?
                          reg36 : (8'haf))) : ((&reg23) < (wire17 ?
                          (7'h44) : reg26)))));
            end
        end
      else
        begin
          reg34 <= ($signed({reg32}) >> wire15[(4'ha):(3'h6)]);
          reg35 <= (-(wire17 && {((reg30 >>> reg29) ?
                  (reg34 ? (7'h42) : reg34) : (~reg25)),
              $unsigned($unsigned(reg22))}));
        end
      reg39 <= $signed(wire14);
    end
  module40 #() modinst57 (.clk(clk), .wire44(reg25), .wire41(reg34), .wire45(reg29), .wire43(wire19), .wire42(wire17), .y(wire56));
  module58 #() modinst81 (wire80, clk, reg24, reg22, reg29, reg30);
  assign wire82 = $unsigned(({reg31[(1'h1):(1'h1)], {$signed(wire20), wire16}} ?
                      $unsigned(reg35) : $unsigned(reg38[(4'h9):(2'h2)])));
  always
    @(posedge clk) begin
      reg83 <= (&reg34);
    end
  assign wire84 = reg22;
  assign wire85 = $signed((^~wire21[(4'h9):(2'h3)]));
  assign wire86 = $unsigned(($signed(reg36) != (($signed(wire56) ^ $unsigned(reg32)) ?
                      (8'hb9) : $unsigned(wire84[(2'h3):(1'h1)]))));
endmodule

module module58
#(parameter param78 = ((((~|(+(7'h44))) & (^((7'h40) ? (8'ha6) : (8'hbd)))) & {(((8'ha5) ? (8'hb9) : (8'ha8)) ? ((8'hba) ? (7'h44) : (8'hbf)) : ((8'h9f) ~^ (8'hb4))), (((8'h9c) ? (8'hb5) : (8'h9e)) <= ((8'hb4) * (8'h9c)))}) == (&(~(!((8'ha0) ? (8'ha3) : (8'ha9)))))), 
parameter param79 = ((+((~|param78) ? (param78 << param78) : ((^~param78) ? (param78 ~^ (8'h9f)) : (param78 ? param78 : param78)))) ^ param78))
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire62;
  input wire signed [(5'h13):(1'h0)] wire61;
  input wire [(5'h13):(1'h0)] wire60;
  input wire [(4'ha):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire63;
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 reg64,
                 (1'h0)};
  assign wire63 = wire61[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      reg64 <= wire60;
    end
  assign wire65 = (^~($signed({(8'hac), (wire60 <<< wire63)}) ?
                      (~^wire59[(3'h5):(3'h5)]) : $unsigned($signed((wire61 ?
                          wire60 : wire62)))));
  assign wire66 = (8'ha8);
  assign wire67 = ((~(wire60 + $signed((+(7'h42))))) ?
                      ((|$unsigned($signed(wire65))) ?
                          ($signed(wire62) & $unsigned($signed(wire60))) : (~|((wire63 ?
                                  wire63 : wire61) ?
                              $unsigned(reg64) : $signed((8'ha6))))) : wire59[(3'h4):(3'h4)]);
  assign wire68 = $unsigned($unsigned($signed((wire59[(3'h7):(1'h1)] > {(8'haa)}))));
  assign wire69 = $unsigned(wire62);
  assign wire70 = {((!wire67[(4'he):(1'h1)]) << wire61[(4'hf):(2'h3)])};
  assign wire71 = reg64;
  assign wire72 = wire70[(4'ha):(2'h2)];
  assign wire73 = (&$signed($signed($signed((~^wire60)))));
  assign wire74 = wire71;
  assign wire75 = {wire63[(1'h1):(1'h1)]};
  assign wire76 = (&((wire59 ?
                          ((wire65 >>> (8'hb5)) << $unsigned(wire68)) : (-wire73)) ?
                      (~^(wire62[(4'hc):(1'h0)] >= $unsigned(wire74))) : $signed(((wire75 >> wire62) >= $signed(wire75)))));
  assign wire77 = $unsigned(($signed($signed((~wire70))) >= $unsigned($unsigned($unsigned(wire71)))));
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire45;
  input wire signed [(4'h9):(1'h0)] wire44;
  input wire signed [(4'hb):(1'h0)] wire43;
  input wire signed [(2'h2):(1'h0)] wire42;
  input wire signed [(4'he):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 (1'h0)};
  assign wire46 = $unsigned((!wire41[(4'ha):(3'h5)]));
  assign wire47 = (((wire43[(4'hb):(3'h5)] == ((wire43 > wire42) ?
                          wire43 : $unsigned(wire44))) <= (^wire44[(4'h8):(2'h2)])) ?
                      {(^~(+$signed(wire42))),
                          ((!(+wire42)) ^ $unsigned($signed(wire42)))} : {$signed($signed((~|wire46))),
                          $signed(((wire41 <= (8'h9f)) <<< wire44[(3'h4):(2'h2)]))});
  assign wire48 = ((((^~$signed(wire43)) ?
                      (8'hab) : wire45) ^~ wire43) ^ (($unsigned($unsigned(wire45)) | wire41) ?
                      ($signed(wire44[(3'h6):(3'h6)]) != (~&((8'h9e) ?
                          (8'ha6) : wire42))) : ($signed((wire42 ?
                          (8'hbb) : wire47)) ^ (^$unsigned(wire41)))));
  assign wire49 = wire46;
  assign wire50 = wire42;
  assign wire51 = (-(($signed((wire41 + wire47)) >= (^~(wire50 ?
                          wire44 : wire46))) ?
                      wire48[(4'hc):(4'ha)] : $signed(((wire44 <<< wire42) ?
                          (8'h9f) : ((8'ha9) && wire48)))));
  assign wire52 = $unsigned(wire46[(3'h4):(3'h4)]);
  assign wire53 = (8'hbf);
  assign wire54 = $unsigned({(((+(8'hb0)) ^~ (wire46 & wire49)) ?
                          (|(wire48 < (8'hb9))) : $signed({wire49, wire45})),
                      (($signed(wire44) ? $signed(wire53) : $signed((8'ha5))) ?
                          $signed($signed(wire49)) : (wire43 && wire52))});
  assign wire55 = wire45[(3'h5):(3'h5)];
endmodule
