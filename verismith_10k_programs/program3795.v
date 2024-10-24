module top
#(parameter param147 = ({((^((8'hb6) ? (8'ha1) : (8'hbe))) >= (((8'haa) > (8'ha0)) > (^~(8'hb4)))), {(((8'hb7) ? (8'ha1) : (8'hb8)) ? ((8'hb6) ? (8'ha1) : (8'h9c)) : (-(8'ha9)))}} ? (((~((8'hb1) | (8'hbe))) | (((8'h9c) ? (8'ha1) : (8'hb8)) ? (7'h42) : ((7'h41) ? (8'ha8) : (8'hb5)))) ? (^~(((8'ha2) << (8'ha8)) ? {(8'h9d)} : ((8'haa) ? (8'hbe) : (8'h9d)))) : ((^~((7'h43) ? (8'hb7) : (7'h41))) < ((+(8'h9d)) && (8'h9e)))) : (|(~^(~^((8'hac) ? (8'hbc) : (8'haf)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire146;
  wire [(2'h3):(1'h0)] wire145;
  wire [(4'ha):(1'h0)] wire144;
  wire signed [(4'h8):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire139;
  wire [(3'h4):(1'h0)] wire137;
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire137,
                 (1'h0)};
  module5 #() modinst138 (.wire6(wire3), .wire8(wire4), .wire9(wire0), .wire7(wire2), .y(wire137), .clk(clk));
  assign wire139 = $signed($signed($signed(wire3[(4'h8):(2'h2)])));
  assign wire140 = (7'h42);
  assign wire141 = $signed((wire137 ?
                       {(wire137[(2'h2):(1'h1)] ?
                               $unsigned((8'ha4)) : (8'h9d))} : (wire140[(3'h4):(2'h2)] ?
                           ($unsigned(wire4) ?
                               (wire137 ?
                                   wire137 : wire137) : (+wire1)) : (&wire1))));
  assign wire142 = wire1[(1'h0):(1'h0)];
  assign wire143 = ($signed((wire137 ?
                       wire141 : {{wire139}})) << wire2[(4'ha):(2'h3)]);
  assign wire144 = {wire3, $unsigned(wire4[(3'h4):(1'h1)])};
  assign wire145 = $signed(((~(~^((8'hab) & (7'h43)))) ~^ wire139));
  assign wire146 = $unsigned((!(8'hb8)));
endmodule

module module5
#(parameter param135 = ((~((((8'ha4) ? (8'haa) : (8'had)) >> (+(8'had))) || (!((8'hb1) <<< (7'h43))))) >= (+({((8'haf) ? (8'h9e) : (8'hb8)), ((8'ha7) ? (8'hb4) : (8'haa))} ? (^~(~|(8'hb3))) : ((!(8'hb3)) ~^ (~&(7'h44)))))), 
parameter param136 = {(8'ha7)})
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire134;
  wire [(4'hb):(1'h0)] wire132;
  wire [(5'h15):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire signed [(4'h9):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  assign y = {wire134,
                 wire132,
                 wire104,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire63,
                 wire62,
                 wire61,
                 wire52,
                 wire51,
                 wire26,
                 wire12,
                 wire11,
                 wire10,
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
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg102,
                 reg103,
                 (1'h0)};
  assign wire10 = (wire9 ? wire9 : wire8[(4'ha):(2'h2)]);
  assign wire11 = $unsigned((8'hb5));
  assign wire12 = ($unsigned((8'h9d)) ?
                      (((8'ha0) ?
                              (wire7[(4'hd):(4'hc)] ?
                                  {wire11,
                                      wire8} : wire7[(3'h7):(2'h3)]) : ((wire9 ?
                                  wire9 : wire11) != (-wire10))) ?
                          (((~|(8'hab)) ?
                              (wire8 >> wire11) : (~|wire8)) > wire10) : $signed(((wire8 ?
                              wire6 : wire9) || $signed(wire10)))) : (((wire11 ?
                              (wire9 << wire6) : (wire10 == wire7)) ^ (!((7'h43) || wire6))) ?
                          (~&wire6[(3'h6):(2'h3)]) : ({(|(8'ha8))} ?
                              wire7 : (+(~&wire11)))));
  module13 #() modinst27 (wire26, clk, wire8, wire6, wire12, wire7);
  always
    @(posedge clk) begin
      reg28 <= (($unsigned(wire8[(1'h0):(1'h0)]) ?
          {$signed(wire12),
              (wire11[(3'h6):(1'h0)] || $signed(wire6))} : $signed((wire9 * wire11[(1'h0):(1'h0)]))) >>> wire11[(3'h5):(2'h2)]);
      if ((|$signed(wire12)))
        begin
          reg29 <= (|{(8'hb0)});
          reg30 <= (wire10 > $signed(reg29[(4'hd):(4'hb)]));
          reg31 <= $unsigned((|$signed((^(reg29 ? wire8 : wire26)))));
          if (wire7[(4'hb):(2'h3)])
            begin
              reg32 <= $signed((wire6[(2'h3):(1'h1)] <= wire10));
              reg33 <= $unsigned(($unsigned((-$signed(reg30))) ?
                  $unsigned(wire11) : (wire9 > {$unsigned(reg28),
                      (wire11 ? wire9 : wire12)})));
            end
          else
            begin
              reg32 <= $unsigned({$unsigned($unsigned((^~wire26)))});
              reg33 <= (wire9[(4'h8):(3'h6)] >= $unsigned($signed(((wire6 ?
                      wire12 : reg30) ?
                  wire26[(2'h3):(1'h1)] : (~^(7'h41))))));
              reg34 <= wire8[(4'hf):(3'h7)];
              reg35 <= (8'hb4);
              reg36 <= $unsigned((reg29[(4'hc):(2'h3)] ?
                  ((&(wire11 ? (8'hba) : wire6)) == (|((8'hb1) ?
                      wire10 : (8'h9d)))) : ({(wire10 != wire7),
                          $signed(wire12)} ?
                      ((reg30 ?
                          wire6 : wire12) && reg28) : ((wire10 ^~ wire11) == (wire6 ?
                          reg30 : reg33)))));
            end
          reg37 <= reg31[(2'h3):(2'h2)];
        end
      else
        begin
          reg29 <= reg37;
          reg30 <= (((^(^(wire9 ?
              wire26 : wire8))) << ($signed($unsigned(wire26)) ?
              ((wire6 ? reg29 : reg34) ?
                  (+wire12) : (wire7 & wire11)) : reg35)) ^ (-{((reg35 ?
                  reg30 : reg30) > (reg32 ? reg35 : reg36)),
              $unsigned((wire8 > wire7))}));
          reg31 <= ({$signed($signed((~^reg34)))} ?
              (~&$signed($signed(reg32[(2'h3):(2'h2)]))) : (~|($unsigned(wire6[(4'hd):(3'h6)]) < {(reg35 ?
                      wire9 : wire11),
                  (8'h9d)})));
          reg32 <= (reg35 | ((wire10 >> (^~$signed(wire6))) ?
              (!$unsigned($unsigned(wire10))) : ($unsigned($signed(reg36)) ?
                  wire11 : reg31[(5'h10):(5'h10)])));
        end
      reg38 <= reg33[(2'h2):(1'h0)];
      reg39 <= reg33;
      reg40 <= $signed((reg39[(4'h9):(4'h9)] && {(+(reg35 ^ reg34))}));
    end
  always
    @(posedge clk) begin
      if (wire6)
        begin
          reg41 <= {(wire7[(3'h4):(2'h2)] ?
                  {$signed((~|(8'ha4)))} : ($unsigned((reg32 != (8'ha9))) ?
                      {(reg28 == reg32), wire6} : $unsigned($signed(reg30)))),
              reg35};
          reg42 <= ((~&(((~^reg39) ? $unsigned(reg40) : wire9) ?
                  $unsigned($unsigned(reg28)) : (^(reg32 ? wire7 : reg35)))) ?
              ($unsigned($signed($signed(wire8))) ^ (+(+$unsigned(wire12)))) : wire7);
        end
      else
        begin
          reg41 <= wire11;
        end
      if ($unsigned(((8'hba) ?
          (!reg40[(2'h2):(1'h1)]) : wire12[(4'hf):(3'h4)])))
        begin
          reg43 <= {{(|{$unsigned(wire11)}),
                  (($signed(wire6) < {reg40, wire26}) ?
                      $unsigned((reg41 || reg41)) : reg37[(3'h7):(2'h2)])},
              reg39[(4'ha):(3'h6)]};
          reg44 <= (~^({reg37[(2'h3):(2'h3)]} ?
              reg30 : $unsigned((((7'h42) ?
                  reg31 : (8'hbe)) <<< (reg37 * reg38)))));
          if (($unsigned(($signed(reg30) + reg28[(1'h0):(1'h0)])) * (reg31 && (&(((8'ha1) ^ reg28) ?
              (-wire10) : wire8)))))
            begin
              reg45 <= ($signed($signed(((reg38 ? reg34 : reg36) ?
                  reg30 : wire9))) != $unsigned({(((8'hae) == reg36) ?
                      (~|reg35) : $unsigned((8'ha9)))}));
              reg46 <= $signed(wire7[(3'h6):(1'h0)]);
              reg47 <= (8'hba);
              reg48 <= wire10;
              reg49 <= {(reg34[(1'h0):(1'h0)] > ($signed((reg47 * reg30)) >= $signed($unsigned(reg29))))};
            end
          else
            begin
              reg45 <= wire9[(4'h8):(3'h4)];
              reg46 <= {{{(|(-reg40))},
                      ($unsigned($signed(reg43)) ? reg41 : reg30)},
                  (^(|($signed(reg49) ? $signed((8'haf)) : {reg46})))};
              reg47 <= $signed($signed($unsigned($unsigned($signed(reg36)))));
            end
          reg50 <= wire10;
        end
      else
        begin
          reg43 <= reg48[(2'h2):(2'h2)];
          reg44 <= $unsigned((8'ha8));
          reg45 <= ((~|(8'h9d)) >>> (8'had));
          reg46 <= $signed(reg30);
        end
    end
  assign wire51 = (|($signed(reg43) <<< $signed((reg28 <= $signed(wire9)))));
  assign wire52 = reg33[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if (wire9[(3'h5):(3'h4)])
        begin
          if ($signed(($signed((~^$signed((8'hb2)))) && {(~^$signed(wire9))})))
            begin
              reg53 <= ({(+(&(wire8 ? reg37 : reg33))),
                      $unsigned((reg36 ?
                          wire12[(2'h3):(1'h0)] : $signed(wire7)))} ?
                  (wire9 ?
                      {reg49[(3'h5):(2'h2)]} : ({reg40,
                          (&reg44)} < (wire52[(1'h0):(1'h0)] ?
                          $unsigned((8'haa)) : (reg40 > wire11)))) : reg50);
              reg54 <= reg38[(4'hd):(3'h5)];
              reg55 <= {wire10};
            end
          else
            begin
              reg53 <= reg35;
            end
          if ((+((reg36 ?
              reg34[(2'h3):(2'h3)] : wire10) >>> (~$unsigned($signed(reg32))))))
            begin
              reg56 <= (wire10[(2'h2):(1'h1)] ?
                  (({{wire10}, $signed(wire7)} ?
                      $signed($signed(reg35)) : ($signed(reg37) ~^ reg34[(2'h3):(2'h2)])) < (~&wire12)) : wire6[(4'hd):(4'hd)]);
            end
          else
            begin
              reg56 <= $signed(wire12[(3'h7):(3'h7)]);
              reg57 <= $unsigned((^~wire9));
              reg58 <= ({{reg31[(4'hc):(3'h4)]}} ?
                  $unsigned((^(reg41 ?
                      (reg38 ? wire9 : reg28) : (reg34 ?
                          wire6 : reg32)))) : $unsigned((((-reg50) <<< wire8) * ($signed(reg50) + {reg39,
                      reg55}))));
              reg59 <= reg54[(5'h12):(3'h5)];
            end
          reg60 <= {((({wire10} == $unsigned(wire11)) * $signed((!reg40))) ^ (8'ha8)),
              wire7};
        end
      else
        begin
          reg53 <= reg34[(3'h7):(2'h3)];
          reg54 <= $unsigned((&($unsigned($unsigned((8'hb2))) ?
              reg42 : (~(~^reg44)))));
          reg55 <= $unsigned((~^(((wire51 << (8'haa)) ?
                  reg46[(3'h6):(2'h2)] : (reg33 >= reg60)) ?
              (reg41[(5'h13):(5'h10)] < (+(8'hb7))) : (-((8'hb1) - reg41)))));
          reg56 <= $signed((^$unsigned(reg30)));
          reg57 <= {wire6};
        end
    end
  assign wire61 = {$unsigned($signed($signed($unsigned((8'hbc))))),
                      $unsigned($signed(reg37))};
  assign wire62 = reg47[(4'ha):(4'ha)];
  assign wire63 = (~^wire62[(3'h4):(1'h1)]);
  module64 #() modinst96 (wire95, clk, reg48, reg33, reg60, reg53);
  assign wire97 = reg28[(2'h2):(2'h2)];
  assign wire98 = wire11[(3'h4):(2'h2)];
  assign wire99 = {{($unsigned(wire6) ?
                              {wire61[(1'h0):(1'h0)]} : ($signed(reg35) & $signed(reg38)))}};
  assign wire100 = ((((!wire97) && wire95) != ((^reg50) ?
                       $unsigned($unsigned(reg49)) : (&reg50[(3'h5):(2'h3)]))) ^ ((8'hb6) ~^ reg37));
  assign wire101 = ({$signed($signed((reg41 ?
                           wire61 : reg41)))} == {{(^~{(7'h43)})}});
  always
    @(posedge clk) begin
      if ((wire52 ? reg39[(3'h5):(3'h5)] : reg35[(2'h3):(1'h0)]))
        begin
          reg102 <= wire97;
        end
      else
        begin
          reg102 <= $signed((~|((reg45[(2'h2):(1'h1)] >= $signed(wire52)) ?
              (&$signed(reg58)) : ((wire97 ? reg50 : reg32) ?
                  (wire63 ? wire26 : (8'ha7)) : (reg59 | reg55)))));
        end
      reg103 <= $signed(reg57);
    end
  assign wire104 = {$unsigned($unsigned($unsigned((-wire63))))};
  module105 #() modinst133 (.wire109(reg28), .wire110(reg54), .wire108(wire99), .wire106(wire12), .clk(clk), .wire107(reg31), .y(wire132));
  assign wire134 = ((-wire9) < $signed((8'hb2)));
endmodule

module module105
#(parameter param131 = {(^((+{(8'hae), (8'ha0)}) ? {(|(8'hb2))} : (~|((8'hbd) >= (7'h42))))), (8'ha8)})
(y, clk, wire110, wire109, wire108, wire107, wire106);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire110;
  input wire signed [(3'h7):(1'h0)] wire109;
  input wire signed [(5'h14):(1'h0)] wire108;
  input wire signed [(4'hb):(1'h0)] wire107;
  input wire [(4'ha):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire130;
  wire [(5'h10):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire126;
  wire signed [(2'h2):(1'h0)] wire125;
  wire [(5'h11):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire121;
  wire signed [(3'h7):(1'h0)] wire120;
  wire signed [(4'h8):(1'h0)] wire119;
  wire signed [(5'h12):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire signed [(4'hb):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire112;
  wire signed [(3'h5):(1'h0)] wire111;
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 (1'h0)};
  assign wire111 = (~wire107);
  assign wire112 = $signed({wire109[(3'h4):(2'h3)]});
  assign wire113 = (wire109 | wire110[(4'h8):(1'h0)]);
  assign wire114 = {wire110};
  assign wire115 = ({$unsigned($unsigned((wire106 ? wire106 : wire108)))} ?
                       wire113 : ((({wire106, (8'ha4)} | (wire106 ?
                           wire110 : wire113)) >= {((8'h9e) ^ wire113),
                           {wire112}}) ~^ wire114));
  assign wire116 = (8'ha7);
  assign wire117 = {$signed((($unsigned(wire111) << wire107[(4'ha):(4'h8)]) + (8'had)))};
  assign wire118 = ($unsigned(((8'hb9) && (^~(wire115 <<< wire111)))) ?
                       wire116 : $unsigned(wire108[(4'h8):(4'h8)]));
  assign wire119 = $unsigned({(+$unsigned((wire114 ? wire106 : wire116)))});
  assign wire120 = $unsigned($signed(wire108[(1'h0):(1'h0)]));
  assign wire121 = (&{wire113[(3'h6):(1'h1)]});
  assign wire122 = $signed($signed((~&($unsigned(wire109) ?
                       {wire106, wire115} : (wire110 >>> wire109)))));
  assign wire123 = $signed((($signed({wire110, wire119}) ?
                           $unsigned((wire106 <<< (8'hba))) : {$unsigned(wire109)}) ?
                       wire110 : $unsigned(wire117[(1'h0):(1'h0)])));
  assign wire124 = (($signed(wire112) ~^ ({$unsigned(wire110),
                       wire114} + {(&(7'h42)),
                       ((8'ha5) >= (8'ha1))})) >>> wire111);
  assign wire125 = $unsigned(wire122[(3'h5):(2'h3)]);
  assign wire126 = ((8'hb5) ?
                       wire123 : ($signed((wire115[(4'h8):(1'h1)] ?
                           (wire124 ? wire118 : (8'hac)) : {wire125,
                               wire112})) >>> (((wire110 ? wire107 : wire121) ?
                           $signed(wire120) : (wire117 ?
                               (8'ha0) : wire109)) >>> ((wire117 ?
                               wire121 : (8'ha0)) ?
                           wire107 : (~&wire120)))));
  assign wire127 = $signed((wire124 <= ((~&(!wire114)) ?
                       {(~|wire107),
                           wire125[(2'h2):(1'h1)]} : ((wire124 <= wire123) ?
                           $signed(wire109) : (wire106 ^ wire125)))));
  assign wire128 = $signed(($signed(wire118[(3'h4):(3'h4)]) - ($unsigned((~(8'h9e))) != $signed(wire113))));
  assign wire129 = ($signed({wire107[(3'h7):(3'h7)],
                       $signed(wire106)}) + wire128[(3'h6):(1'h0)]);
  assign wire130 = (~&$unsigned(($unsigned({wire121}) ?
                       ((^~wire123) != $unsigned(wire115)) : wire126)));
endmodule

module module64  (y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire68;
  input wire signed [(3'h6):(1'h0)] wire67;
  input wire [(3'h5):(1'h0)] wire66;
  input wire signed [(4'h8):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire94;
  wire [(2'h2):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
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
  assign wire69 = $unsigned($unsigned((((wire65 - wire67) ?
                          (~^wire67) : wire67) ?
                      wire65[(4'h8):(3'h7)] : (wire65[(2'h3):(1'h1)] ?
                          {wire65} : $unsigned(wire66)))));
  assign wire70 = $signed(wire65);
  assign wire71 = ((7'h41) ?
                      ({$signed($unsigned(wire67)), wire65} + $signed(({wire65,
                          (8'hb2)} ^~ wire66))) : $signed(($unsigned(wire69) ?
                          (-$signed((8'hbe))) : wire66[(3'h5):(1'h0)])));
  assign wire72 = {wire65[(2'h3):(1'h0)]};
  assign wire73 = ((wire69[(4'h9):(3'h4)] ^~ ((&$unsigned(wire72)) ?
                      $signed((wire71 ? wire70 : wire65)) : (((8'h9c) ?
                              wire69 : wire65) ?
                          (~|wire66) : (wire68 | wire67)))) && (~&(~&(^$unsigned(wire67)))));
  assign wire74 = (wire73[(3'h4):(2'h3)] >= wire65);
  assign wire75 = wire74[(4'h9):(2'h2)];
  assign wire76 = wire69[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      if (((+$signed(($signed(wire76) ^ $signed(wire67)))) != wire69))
        begin
          if ((^(wire66 ?
              $signed(wire67) : {$unsigned($unsigned(wire76)),
                  $signed($signed(wire67))})))
            begin
              reg77 <= wire71[(4'ha):(3'h7)];
              reg78 <= wire75;
              reg79 <= wire71;
              reg80 <= reg79;
              reg81 <= (reg80[(2'h2):(2'h2)] ?
                  ($signed({(wire65 ? wire73 : wire68),
                      $unsigned(wire71)}) || {$signed(wire70)}) : $signed(wire73));
            end
          else
            begin
              reg77 <= reg79;
              reg78 <= reg81;
              reg79 <= wire66[(3'h4):(1'h0)];
            end
          reg82 <= $signed(wire76[(2'h3):(1'h1)]);
          reg83 <= ($unsigned(((7'h43) | $unsigned(reg81))) >> ({(wire76[(4'h8):(2'h3)] > ((8'ha8) && reg81)),
              $unsigned({reg79})} ^ $signed(((wire67 != wire74) ?
              $signed(wire69) : (wire76 ? wire69 : wire69)))));
          reg84 <= $unsigned((wire69[(4'h9):(3'h7)] | (+reg82[(1'h1):(1'h1)])));
          if ((!wire68))
            begin
              reg85 <= wire65;
              reg86 <= ($unsigned(wire71[(1'h0):(1'h0)]) ^~ $unsigned(wire71[(2'h2):(1'h0)]));
              reg87 <= reg77[(1'h0):(1'h0)];
            end
          else
            begin
              reg85 <= wire66;
              reg86 <= wire70[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg77 <= $signed((reg81[(2'h2):(1'h0)] & wire66[(2'h2):(2'h2)]));
        end
      reg88 <= $unsigned($unsigned(((((8'hb5) ?
              (7'h42) : reg83) >>> (|wire72)) ?
          (reg86[(4'hb):(2'h2)] ^~ {wire66}) : $unsigned($unsigned(reg78)))));
    end
  assign wire89 = $signed(reg87);
  assign wire90 = ({$signed((!$unsigned(wire73)))} ?
                      $unsigned((+((~^reg78) && reg88))) : (($unsigned((^~wire72)) ?
                              ($signed(reg80) ?
                                  $signed(wire66) : reg77) : wire74) ?
                          (((wire73 ? wire89 : (8'hb2)) ?
                              reg80[(4'hc):(4'hc)] : (!wire69)) <= reg88) : (-(-reg86))));
  assign wire91 = reg80;
  assign wire92 = wire72;
  assign wire93 = ((~reg84[(5'h11):(4'hb)]) != ((((~&wire68) < reg80[(1'h1):(1'h0)]) ?
                      wire65[(1'h1):(1'h1)] : ((!reg80) ?
                          $signed(wire65) : $signed((7'h41)))) == ($unsigned((+(8'hae))) + (&$signed(wire67)))));
  assign wire94 = $signed((wire72 ?
                      $unsigned((wire70[(1'h1):(1'h0)] ?
                          {wire66,
                              wire73} : $signed(reg77))) : reg83[(2'h2):(2'h2)]));
endmodule

module module13
#(parameter param25 = {(((|(|(7'h40))) ^~ (8'had)) ? ((((8'h9f) << (8'hb9)) >= (+(8'hbe))) >> {(-(7'h42)), (~^(8'ha6))}) : ((&((8'hb9) || (8'hbd))) ? ((!(8'hbf)) <<< (~|(8'hb6))) : (((8'ha0) - (8'hb0)) ? (8'hbf) : ((8'hb5) ? (8'hb8) : (8'hab))))), (~&{(~((8'ha1) < (8'ha8)))})})
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire [(4'h9):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  assign y = {wire24, wire23, wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = (~($unsigned(wire17) ? wire17 : wire15));
  assign wire19 = $signed($signed($signed(((8'ha5) ?
                      $signed(wire18) : (~&wire14)))));
  assign wire20 = wire18[(3'h6):(3'h6)];
  assign wire21 = $unsigned($unsigned((8'had)));
  assign wire22 = wire17;
  assign wire23 = $signed(wire16);
  assign wire24 = wire22;
endmodule
