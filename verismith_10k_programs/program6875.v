module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire147;
  wire [(4'h9):(1'h0)] wire143;
  wire [(4'h9):(1'h0)] wire141;
  wire signed [(5'h14):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire104;
  wire [(3'h5):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  assign y = {wire147,
                 wire143,
                 wire141,
                 wire116,
                 wire115,
                 wire114,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg146,
                 reg145,
                 reg144,
                 reg111,
                 reg112,
                 reg113,
                 (1'h0)};
  assign wire5 = wire3[(3'h4):(1'h0)];
  assign wire6 = {($unsigned(wire3) ?
                         $unsigned(((~^wire3) <= (wire5 ?
                             (8'ha2) : wire2))) : ($unsigned((^~(8'hbf))) ?
                             $signed(((8'hb2) & wire5)) : $signed(wire1))),
                     ($unsigned(wire1[(4'hb):(1'h0)]) <= (8'hbf))};
  assign wire7 = wire4;
  assign wire8 = (!$unsigned({$signed((8'h9f))}));
  assign wire9 = wire3;
  module10 #() modinst105 (wire104, clk, wire4, wire3, wire8, wire0);
  assign wire106 = (^wire8);
  assign wire107 = wire1[(1'h1):(1'h0)];
  assign wire108 = $unsigned((8'hbd));
  assign wire109 = (8'hbd);
  assign wire110 = (($signed(({(8'hab), (8'h9e)} ?
                       $signed(wire109) : (8'hb4))) <= $signed($signed($signed(wire4)))) == (&((~^$unsigned(wire104)) ?
                       (7'h41) : wire109)));
  always
    @(posedge clk) begin
      reg111 <= $unsigned(wire110[(1'h0):(1'h0)]);
      reg112 <= {((8'ha9) == wire3[(3'h4):(1'h1)])};
    end
  always
    @(posedge clk) begin
      reg113 <= {wire2,
          ((~|(7'h42)) * (((wire108 ?
              wire107 : wire8) ^~ wire0[(4'hf):(1'h1)]) - $signed((~|wire9))))};
    end
  assign wire114 = $unsigned($unsigned((($unsigned(wire6) ?
                       wire1[(4'h9):(2'h2)] : $unsigned(wire108)) >= {(wire3 | wire5),
                       reg111[(2'h3):(2'h2)]})));
  assign wire115 = wire110;
  assign wire116 = ($signed($signed((wire115[(1'h1):(1'h0)] ?
                       (wire110 >= wire6) : (wire110 ^~ wire2)))) || (reg111[(2'h2):(2'h2)] >> wire108[(5'h10):(2'h2)]));
  module117 #() modinst142 (wire141, clk, reg112, wire106, wire104, wire116, wire3);
  assign wire143 = {wire3[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg144 <= wire115;
      reg145 <= reg112[(3'h4):(2'h3)];
      reg146 <= $unsigned($unsigned(((reg144 ? (wire106 ^ wire115) : wire143) ?
          (wire110[(3'h6):(1'h0)] ? (8'hab) : (8'ha4)) : (8'hb5))));
    end
  assign wire147 = ((~|wire4) ?
                       ((reg112 ^ ($unsigned(wire106) ^ {wire115})) ?
                           (~&($signed(reg113) >= reg144[(1'h1):(1'h1)])) : ($unsigned((~^wire4)) ~^ $unsigned(reg113))) : {$unsigned(({wire104,
                                   reg111} ?
                               (reg144 >= wire143) : wire107))});
endmodule

module module117  (y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire122;
  input wire signed [(3'h4):(1'h0)] wire121;
  input wire signed [(4'ha):(1'h0)] wire120;
  input wire [(4'ha):(1'h0)] wire119;
  input wire [(4'hc):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(3'h5):(1'h0)] wire128;
  wire [(5'h13):(1'h0)] wire127;
  wire signed [(3'h7):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire124;
  wire signed [(5'h12):(1'h0)] wire123;
  reg [(5'h11):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  assign y = {wire139,
                 wire136,
                 wire135,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 reg140,
                 reg138,
                 reg137,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire123 = $unsigned(((+$unsigned($unsigned(wire119))) <= ($unsigned(wire120[(1'h0):(1'h0)]) ?
                       $unsigned(wire121[(3'h4):(3'h4)]) : {(wire120 || wire122)})));
  assign wire124 = wire122[(3'h7):(1'h1)];
  assign wire125 = $unsigned($signed(wire119));
  assign wire126 = $unsigned((($signed($signed(wire119)) < $signed(wire119[(2'h2):(1'h0)])) - $unsigned({(~|wire125),
                       (^wire124)})));
  assign wire127 = (-((!(&(wire123 >= wire125))) ?
                       $unsigned($unsigned(wire119)) : (7'h42)));
  assign wire128 = (wire126[(1'h1):(1'h1)] == $unsigned(($unsigned((wire123 >> wire123)) ?
                       ($signed(wire120) << (~^wire124)) : (-((8'ha6) + wire119)))));
  assign wire129 = (wire120 ? wire123 : (8'hb3));
  assign wire130 = ($signed((^~(~&(wire126 ? wire124 : wire124)))) ?
                       (wire121 + $unsigned(((wire122 ? wire118 : wire126) ?
                           (~|wire124) : $signed(wire125)))) : (~wire128[(3'h4):(3'h4)]));
  assign wire131 = {((((wire127 != wire122) < wire130) ?
                               wire121 : wire120[(1'h1):(1'h1)]) ?
                           (8'hbd) : (7'h41))};
  always
    @(posedge clk) begin
      reg132 <= (~^wire123[(5'h10):(4'hf)]);
      reg133 <= $signed(wire122);
      reg134 <= {{wire127[(4'h8):(3'h7)]}};
    end
  assign wire135 = {wire118[(3'h7):(2'h2)], wire128};
  assign wire136 = $signed($signed(((~(wire125 >>> wire125)) ^~ wire127[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg137 <= wire121[(2'h2):(1'h0)];
      reg138 <= wire131[(1'h1):(1'h0)];
    end
  assign wire139 = wire136[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg140 <= wire124;
    end
endmodule

module module10
#(parameter param102 = (-((^((+(7'h43)) ? ((8'ha4) != (8'hb2)) : (^~(8'haa)))) | {{((8'ha7) ? (8'hb1) : (8'hb6)), (~(8'haf))}, ((8'hbd) >= ((8'ha6) ? (8'hb7) : (8'ha9)))})), 
parameter param103 = param102)
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire90;
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  assign y = {wire97,
                 wire93,
                 wire92,
                 wire33,
                 wire16,
                 wire15,
                 wire90,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg96,
                 reg95,
                 reg94,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
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
                 (1'h0)};
  assign wire15 = (+(wire11 ~^ wire13[(2'h2):(1'h0)]));
  assign wire16 = (~wire13[(2'h2):(1'h1)]);
  module17 #() modinst34 (.y(wire33), .wire20(wire14), .wire18(wire13), .wire22(wire16), .wire21(wire11), .clk(clk), .wire19(wire15));
  always
    @(posedge clk) begin
      if ((8'h9d))
        begin
          reg35 <= wire16;
          if (reg35[(1'h0):(1'h0)])
            begin
              reg36 <= wire12[(4'hc):(3'h4)];
              reg37 <= ($unsigned($signed(wire16)) ?
                  (+(~&wire16[(2'h3):(2'h2)])) : $signed((-{(~&wire14),
                      wire16[(2'h2):(1'h0)]})));
              reg38 <= ($unsigned(wire13) | $unsigned(reg35));
              reg39 <= (reg37 << $unsigned(wire14));
            end
          else
            begin
              reg36 <= $signed((^~$signed(({wire12} ^ $unsigned(wire12)))));
              reg37 <= reg38[(2'h3):(2'h2)];
              reg38 <= (($unsigned(wire16) ~^ $signed({(wire15 && wire13),
                      (8'hb3)})) ?
                  (^(^~(wire33 ? wire16 : $signed(reg36)))) : $signed(wire12));
              reg39 <= $signed($signed((wire15[(4'ha):(3'h6)] ?
                  (~&$unsigned(wire16)) : ((wire14 >>> (8'hab)) - $signed(wire11)))));
            end
          reg40 <= $unsigned($unsigned(wire11[(3'h6):(1'h1)]));
          reg41 <= (reg36[(4'h8):(2'h2)] ?
              reg39[(4'h8):(3'h4)] : {$signed($unsigned((!reg36)))});
          if (reg37)
            begin
              reg42 <= ((^(wire12 | reg35[(4'h8):(3'h5)])) - (^$unsigned(wire16)));
              reg43 <= (~&($unsigned($signed(((8'hab) ^~ wire16))) ?
                  reg38[(5'h10):(3'h5)] : $unsigned((|(~^wire11)))));
              reg44 <= {reg39[(4'hb):(4'h8)],
                  $unsigned($unsigned({{(8'h9d)}}))};
              reg45 <= $unsigned((8'h9c));
            end
          else
            begin
              reg42 <= $unsigned($unsigned((|{$signed(reg36)})));
              reg43 <= wire13[(1'h0):(1'h0)];
              reg44 <= (~|($unsigned($unsigned((~(8'ha6)))) ?
                  $signed(reg42) : reg42[(3'h5):(2'h2)]));
            end
        end
      else
        begin
          reg35 <= reg36;
          if ((wire15 ? wire14 : (wire33 ? $unsigned(reg44) : $signed(wire15))))
            begin
              reg36 <= reg39[(3'h7):(1'h0)];
            end
          else
            begin
              reg36 <= (reg41 ?
                  wire33 : {(reg39[(4'h9):(3'h6)] ?
                          $signed((7'h41)) : {wire33}),
                      (($signed(reg44) <<< $unsigned(reg42)) ?
                          {reg39[(4'h9):(4'h9)], reg44} : wire15)});
              reg37 <= ({reg43[(3'h4):(2'h2)],
                  reg42[(2'h2):(1'h0)]} >> {reg41[(1'h1):(1'h1)], reg36});
              reg38 <= (^~$signed((reg43[(1'h1):(1'h0)] == $unsigned((~|wire15)))));
              reg39 <= (($unsigned(reg44[(3'h5):(2'h2)]) != wire14) ?
                  reg45[(3'h5):(2'h2)] : wire14);
              reg40 <= ($unsigned(reg38) != reg43);
            end
          reg41 <= $unsigned($signed((($unsigned(wire11) ?
              (+(8'hba)) : $signed(reg43)) ^~ (reg35[(3'h7):(1'h0)] & {(8'hb4),
              reg35}))));
          reg42 <= (reg39[(3'h7):(1'h0)] * $unsigned($unsigned({$signed(wire14),
              $unsigned(wire14)})));
          reg43 <= ({(^~(!reg35))} ^~ {(((7'h41) ?
                      $signed(wire33) : reg37[(2'h3):(2'h3)]) ?
                  $signed({wire16}) : $signed((&reg44))),
              $unsigned((&$signed(wire11)))});
        end
      reg46 <= ((reg44[(2'h2):(2'h2)] ?
              reg38 : $signed($unsigned(wire11[(5'h10):(4'h8)]))) ?
          wire14[(4'h8):(4'h8)] : ($unsigned($signed(reg41[(4'hb):(2'h2)])) ?
              reg38[(4'hc):(3'h5)] : (reg40 <<< ((~reg44) <<< (-(8'ha3))))));
      reg47 <= $signed($unsigned((8'ha6)));
      if ($unsigned($signed({$signed($unsigned(reg35))})))
        begin
          if ($unsigned(((reg45[(1'h0):(1'h0)] < $signed((reg35 ?
              wire14 : reg47))) << $unsigned(reg42[(3'h5):(3'h5)]))))
            begin
              reg48 <= $unsigned($signed((~&$unsigned((!reg37)))));
              reg49 <= wire11[(4'hc):(2'h2)];
            end
          else
            begin
              reg48 <= (reg40 ?
                  $unsigned(reg43[(3'h4):(2'h3)]) : $unsigned(wire14[(5'h12):(4'hc)]));
              reg49 <= (wire11 ?
                  wire11[(4'h8):(1'h0)] : (~|(!wire13[(2'h2):(2'h2)])));
              reg50 <= $unsigned(reg35[(3'h6):(2'h2)]);
              reg51 <= $unsigned($signed((((^~reg43) ?
                  wire13 : (reg44 ?
                      wire12 : reg37)) == $unsigned($signed(wire33)))));
              reg52 <= (wire15[(3'h4):(2'h2)] ?
                  $signed($unsigned({(wire11 ? wire16 : reg46),
                      (wire13 ?
                          wire14 : reg45)})) : $signed((&$signed(reg43[(2'h2):(2'h2)]))));
            end
          if ((|{((-(-reg35)) ?
                  ($signed(wire15) < $unsigned(reg40)) : ((+wire13) << (wire12 | reg35))),
              reg36}))
            begin
              reg53 <= reg42;
              reg54 <= {((reg49 ?
                      $unsigned((reg45 ?
                          (8'ha3) : wire15)) : ((reg35 << (8'h9e)) ~^ (reg40 ?
                          reg37 : wire15))) != (!((wire16 ? reg38 : reg39) ?
                      reg40[(5'h10):(4'h9)] : $unsigned(reg42))))};
              reg55 <= reg53[(1'h1):(1'h0)];
            end
          else
            begin
              reg53 <= (^$unsigned(wire33[(5'h10):(4'h9)]));
              reg54 <= {{(reg52 < (reg42 ? (|wire33) : wire15))},
                  reg36[(5'h13):(5'h11)]};
              reg55 <= (-((+$signed($unsigned(reg44))) >>> ((~((8'hb8) ?
                      wire15 : reg45)) ?
                  ((~&reg42) ?
                      $signed((7'h41)) : $unsigned(wire15)) : ((|reg45) ?
                      reg48 : $unsigned(reg41)))));
            end
          reg56 <= $signed((8'hb6));
          reg57 <= $unsigned(wire16[(5'h11):(1'h0)]);
          reg58 <= $unsigned($unsigned((reg47 == (^wire12))));
        end
      else
        begin
          reg48 <= ((&$signed(wire14)) << $signed({reg56, (~^wire11)}));
          reg49 <= (reg41[(3'h7):(3'h4)] ?
              {(^(!(&wire11)))} : ({$unsigned((8'hb2))} ?
                  {wire13[(2'h3):(1'h0)]} : {(~^$unsigned(reg45))}));
          reg50 <= $signed($signed($signed({(wire11 ? reg57 : (7'h40))})));
          reg51 <= ((~^wire33) ?
              {(reg42 ? reg43 : $unsigned($signed(reg35))),
                  $signed(((reg46 ?
                      wire13 : reg58) + $signed((8'hb0))))} : (($signed($unsigned(reg52)) & ((^reg37) ?
                      (~&reg37) : $signed(reg41))) ?
                  reg47[(4'hd):(4'h9)] : {(8'ha0), $signed($unsigned(reg39))}));
        end
      reg59 <= (({{reg56[(2'h3):(2'h3)], (&(8'hab))}, $signed(reg43)} ?
          $unsigned($unsigned(reg46[(2'h3):(2'h2)])) : (wire11 ^~ $unsigned((!reg57)))) >= reg46[(3'h4):(2'h3)]);
    end
  module60 #() modinst91 (wire90, clk, reg56, reg51, wire12, reg52, reg38);
  assign wire92 = reg55[(3'h7):(1'h0)];
  assign wire93 = wire33;
  always
    @(posedge clk) begin
      reg94 <= (reg44[(1'h0):(1'h0)] ?
          ({$unsigned(reg43)} < $unsigned((~|(8'hba)))) : $signed(((wire90[(4'hf):(4'h9)] ?
                  (~&reg39) : ((8'ha9) || reg59)) ?
              (~&{(8'haf)}) : (reg40 ? {reg53, reg43} : (reg52 != reg59)))));
      reg95 <= {$unsigned(($unsigned({reg54}) ?
              (reg37 ?
                  $unsigned(reg49) : $unsigned(reg54)) : ($unsigned(wire13) > reg56[(1'h1):(1'h1)]))),
          reg57[(2'h2):(1'h1)]};
      reg96 <= $signed(((7'h42) ? reg45[(4'hc):(1'h0)] : (&reg58)));
    end
  assign wire97 = ((+(reg49[(1'h1):(1'h1)] * (wire16 <= reg40[(3'h4):(2'h2)]))) * reg44);
  always
    @(posedge clk) begin
      reg98 <= ($signed(($signed((reg96 | reg48)) ?
          $signed((7'h41)) : $unsigned(reg96[(4'hf):(3'h7)]))) ^ $unsigned($signed(((~^reg96) ?
          (^reg56) : (!reg58)))));
      reg99 <= ((reg57[(3'h4):(3'h4)] ?
              reg55[(4'h9):(1'h1)] : $signed(wire13)) ?
          reg42 : ({$unsigned($signed(reg98))} ? reg53 : reg37[(3'h4):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg100 <= wire33;
      reg101 <= (~^wire15);
    end
endmodule

module module60  (y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire65;
  input wire signed [(4'h9):(1'h0)] wire64;
  input wire [(3'h4):(1'h0)] wire63;
  input wire [(5'h11):(1'h0)] wire62;
  input wire [(3'h4):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire71,
                 wire70,
                 wire68,
                 wire67,
                 wire66,
                 reg82,
                 reg73,
                 reg72,
                 reg69,
                 (1'h0)};
  assign wire66 = $unsigned((({$unsigned(wire64)} >> $signed($signed(wire61))) < wire64));
  assign wire67 = $signed(wire62);
  assign wire68 = $unsigned($unsigned(wire65));
  always
    @(posedge clk) begin
      reg69 <= {(~|$unsigned(wire66))};
    end
  assign wire70 = $unsigned((((wire66[(5'h14):(3'h7)] ? (^~wire62) : wire68) ?
                      ($unsigned(wire67) ?
                          $unsigned(wire64) : wire68) : (7'h44)) - $unsigned((!wire63))));
  assign wire71 = $signed($unsigned($signed($signed($signed((8'hbb))))));
  always
    @(posedge clk) begin
      reg72 <= (^$signed(wire64));
      reg73 <= ($signed(((reg72 >= (reg72 ? wire62 : wire65)) ?
              wire61 : ($signed(wire68) != wire66[(3'h5):(1'h0)]))) ?
          (~&(reg69[(1'h0):(1'h0)] | $signed(wire64[(3'h6):(1'h0)]))) : wire65);
    end
  assign wire74 = $unsigned(wire67);
  assign wire75 = reg72[(2'h3):(1'h1)];
  assign wire76 = $unsigned((!({(reg73 ? wire75 : wire61),
                      $signed(wire75)} <= $unsigned($signed(wire71)))));
  assign wire77 = wire74;
  assign wire78 = (^~(|$signed($unsigned((^(8'ha9))))));
  assign wire79 = $unsigned($signed((wire64[(3'h7):(3'h7)] + $unsigned($unsigned(wire71)))));
  assign wire80 = ($unsigned(($signed($signed(wire70)) != wire70)) ?
                      (-{$unsigned($signed(wire74))}) : {$unsigned(wire70[(1'h1):(1'h1)])});
  assign wire81 = wire75;
  always
    @(posedge clk) begin
      reg82 <= (8'hbb);
    end
  assign wire83 = $signed({(~|wire76[(1'h1):(1'h0)])});
  assign wire84 = ($unsigned($signed(((8'h9f) != wire83[(3'h4):(1'h1)]))) <= reg72);
  assign wire85 = wire64;
  assign wire86 = (~&{$unsigned($signed((~|wire77))),
                      (({(8'hb0)} ? wire68 : wire79[(3'h5):(2'h2)]) ?
                          $signed((&wire74)) : $unsigned(((8'hb3) ?
                              wire70 : wire81)))});
  assign wire87 = wire77[(1'h1):(1'h0)];
  assign wire88 = {wire79[(1'h1):(1'h0)], wire62};
  assign wire89 = (8'ha4);
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire22;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire [(3'h7):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire23 = (wire18[(4'h8):(1'h0)] ?
                      (^~$unsigned((wire22[(4'h9):(4'h9)] ^ wire22[(2'h3):(2'h3)]))) : (wire20 ?
                          {((wire18 ? wire19 : wire20) ^ $signed(wire20)),
                              $unsigned((-wire22))} : $unsigned(wire20)));
  assign wire24 = ({((((8'hb6) <<< (8'had)) ?
                          $unsigned(wire21) : $signed(wire22)) ^ (wire22[(3'h4):(1'h0)] << (wire18 ?
                          (8'had) : wire22))),
                      wire19} >> wire19[(3'h5):(1'h1)]);
  assign wire25 = (^~wire23);
  assign wire26 = $signed($signed(wire19));
  always
    @(posedge clk) begin
      reg27 <= (wire25[(4'hb):(4'h8)] ? wire20 : wire23[(3'h6):(1'h1)]);
      reg28 <= $signed((8'h9d));
      reg29 <= (((({(8'hb5)} ? (wire19 ? wire26 : wire26) : (wire24 || reg28)) ?
              ($unsigned(wire20) ?
                  wire23 : (8'hb8)) : {((8'ha4) >>> (8'hae))}) ?
          ((wire25[(4'h8):(1'h1)] ?
              wire26[(5'h12):(2'h3)] : $unsigned(wire19)) > ((8'ha5) ?
              wire24 : (^wire18))) : ((^~(wire24 ?
              wire20 : wire20)) + $unsigned((wire21 ?
              reg28 : wire23)))) <<< $unsigned(((~&(wire26 | wire21)) <= {$signed(wire26),
          {wire19}})));
      reg30 <= wire18;
    end
  assign wire31 = (reg28 || ({(wire23 ? $unsigned(wire25) : (~wire23)),
                          ({reg30} ? (wire22 != wire19) : $signed(wire24))} ?
                      $unsigned(wire22) : {((~|reg28) == (reg28 ?
                              reg30 : reg28)),
                          ($signed((8'ha5)) >= wire24)}));
  assign wire32 = ($unsigned($signed($unsigned((8'ha7)))) ?
                      $signed(({wire19, (wire20 == (8'ha0))} ?
                          (7'h40) : ($signed(reg29) || $signed(wire18)))) : ($signed(wire26) ?
                          reg30 : (^$unsigned((reg29 ~^ wire20)))));
endmodule
