module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire168;
  wire signed [(3'h7):(1'h0)] wire166;
  wire signed [(4'h9):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire90;
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  assign y = {wire168,
                 wire166,
                 wire4,
                 wire90,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire4 = wire0[(4'hb):(3'h6)];
  module5 #() modinst91 (wire90, clk, wire2, wire4, wire0, wire3, wire1);
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg92 <= (^~$signed($signed(wire0)));
          reg93 <= wire90[(4'ha):(2'h2)];
          if (wire1[(3'h4):(1'h0)])
            begin
              reg94 <= {$unsigned($unsigned($signed((wire3 ? reg93 : wire4)))),
                  (8'hb3)};
              reg95 <= reg93[(3'h5):(2'h2)];
              reg96 <= ((~|($signed(reg94[(1'h0):(1'h0)]) ?
                  ((wire0 >> wire90) ?
                      ((8'ha6) ?
                          wire4 : reg93) : $signed(wire1)) : (|$signed((8'ha1))))) <= (($signed(reg92[(4'ha):(3'h5)]) ?
                      ({reg95} == wire90) : ($unsigned(wire4) >>> {wire3,
                          (8'ha7)})) ?
                  reg93 : reg94));
            end
          else
            begin
              reg94 <= {$unsigned((reg96[(1'h1):(1'h0)] - $signed(reg93[(3'h6):(3'h5)]))),
                  $unsigned(wire2)};
            end
          reg97 <= {$unsigned((($unsigned(wire90) ?
                      wire2 : (wire90 ? wire2 : wire90)) ?
                  {{reg95}, wire0} : reg94)),
              reg96};
        end
      else
        begin
          reg92 <= $signed(wire4[(4'h9):(2'h2)]);
          reg93 <= wire0[(4'h8):(3'h4)];
          reg94 <= ((+(+reg96[(2'h2):(1'h0)])) * reg94[(2'h2):(2'h2)]);
        end
      reg98 <= reg93;
      reg99 <= $unsigned($signed(wire1[(3'h5):(1'h0)]));
    end
  module100 #() modinst167 (.wire105(reg97), .wire104(wire3), .y(wire166), .clk(clk), .wire102(reg95), .wire101(reg99), .wire103(wire4));
  module100 #() modinst169 (.wire105(reg97), .wire103(wire2), .clk(clk), .wire102(wire166), .wire101(wire0), .wire104(wire3), .y(wire168));
endmodule

module module100
#(parameter param164 = (((~|(~&(~^(8'hb6)))) ? ((((7'h43) ? (8'hab) : (8'hb7)) ? {(8'hbe), (8'hb0)} : ((8'ha9) ? (8'ha1) : (8'h9f))) << ((^(8'hb9)) | ((8'hac) ? (8'hb4) : (8'hb4)))) : ((((8'h9d) ? (8'hbc) : (8'ha6)) - ((8'ha9) ? (8'hb6) : (8'hbd))) ? (&((8'hb5) | (8'hac))) : ((~^(8'ha6)) >= {(8'hb1), (8'hb0)}))) && (((^~((8'hbf) ? (8'hb9) : (8'hb5))) & (~^((8'ha3) ^~ (8'hbe)))) << {(8'ha6)})), 
parameter param165 = (8'hbb))
(y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire105;
  input wire [(4'hf):(1'h0)] wire104;
  input wire signed [(3'h7):(1'h0)] wire103;
  input wire [(3'h7):(1'h0)] wire102;
  input wire [(4'hf):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire163;
  wire [(4'hb):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire161;
  wire signed [(4'hb):(1'h0)] wire160;
  wire [(5'h14):(1'h0)] wire158;
  wire [(2'h3):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire signed [(3'h4):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire118;
  wire signed [(2'h3):(1'h0)] wire106;
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire158,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 (1'h0)};
  assign wire106 = $signed(($unsigned($unsigned((wire105 ?
                       wire103 : wire102))) ^~ wire101));
  always
    @(posedge clk) begin
      if ((~wire104))
        begin
          if ($unsigned((wire105 ?
              (~^((wire102 ^~ wire103) ?
                  $signed(wire106) : {wire103,
                      wire101})) : (wire105[(3'h4):(1'h1)] >>> wire105[(2'h2):(1'h0)]))))
            begin
              reg107 <= ($signed(wire105[(2'h3):(1'h0)]) ?
                  ($unsigned(((~&wire104) <<< ((8'hb1) ?
                      wire103 : wire104))) & wire106) : wire103[(1'h1):(1'h1)]);
              reg108 <= ($signed($signed((8'ha5))) ?
                  ($unsigned((+{wire104,
                      reg107})) <= $signed($unsigned((wire104 ?
                      wire105 : wire103)))) : $signed(wire103[(3'h5):(3'h4)]));
              reg109 <= wire101;
              reg110 <= wire105[(1'h0):(1'h0)];
            end
          else
            begin
              reg107 <= reg110;
              reg108 <= $unsigned(wire106);
              reg109 <= ((^~(reg109[(2'h3):(2'h2)] ?
                  reg108[(1'h0):(1'h0)] : reg110)) == $unsigned(wire104[(1'h1):(1'h1)]));
              reg110 <= (((~$signed(wire103)) ?
                  (((wire103 <<< (8'ha7)) ?
                      (^~reg109) : {(8'ha0),
                          (8'ha2)}) != wire105[(2'h2):(1'h1)]) : (+$signed(((8'had) ?
                      reg108 : wire106)))) > $unsigned(wire102[(3'h6):(3'h6)]));
              reg111 <= wire104[(1'h0):(1'h0)];
            end
          if (reg108[(1'h1):(1'h0)])
            begin
              reg112 <= $unsigned({(^~(!$unsigned(reg110))),
                  $signed((reg107[(1'h0):(1'h0)] < $signed(wire105)))});
              reg113 <= ($signed(wire104[(1'h1):(1'h0)]) ?
                  ($signed(reg107[(1'h1):(1'h0)]) ?
                      (-$unsigned($unsigned(wire103))) : wire105) : reg107[(1'h1):(1'h1)]);
            end
          else
            begin
              reg112 <= $signed(((^reg107[(1'h0):(1'h0)]) ?
                  ($unsigned({reg107, (8'hbd)}) ?
                      ($signed(wire106) & wire102) : {wire103,
                          wire101}) : reg107));
              reg113 <= ($unsigned(reg111[(1'h0):(1'h0)]) * $unsigned(reg107[(1'h0):(1'h0)]));
              reg114 <= $signed($unsigned({wire105[(3'h4):(2'h3)], (8'hbc)}));
              reg115 <= (~|$signed((!{(reg113 || reg113), $unsigned(reg109)})));
            end
          reg116 <= reg109;
          reg117 <= {$unsigned($unsigned(((reg107 > reg113) ?
                  $unsigned((8'hb9)) : ((8'haa) ? reg113 : reg115))))};
        end
      else
        begin
          if (((wire103[(2'h3):(2'h3)] ?
                  $unsigned(reg113[(1'h0):(1'h0)]) : $unsigned((wire105[(3'h4):(2'h3)] >>> (reg109 >= wire105)))) ?
              (^~reg112[(4'ha):(2'h2)]) : ((~|$signed(wire104)) && (reg111[(2'h3):(2'h3)] ?
                  ($unsigned(reg115) ^ (+reg108)) : (^~((8'hb1) ^~ reg113))))))
            begin
              reg107 <= $signed(reg113);
              reg108 <= (reg115[(1'h0):(1'h0)] && $unsigned($signed($unsigned((reg113 + wire101)))));
            end
          else
            begin
              reg107 <= ($signed(reg108[(2'h3):(2'h2)]) * $unsigned($unsigned($unsigned(reg110))));
              reg108 <= reg107[(1'h1):(1'h0)];
              reg109 <= ((8'hbd) ?
                  (reg109 ?
                      ($unsigned((reg110 ?
                          wire105 : (8'ha4))) != (reg110 + wire105)) : (-(~&(reg115 < reg107)))) : $signed($unsigned((8'ha1))));
            end
          reg110 <= reg113[(2'h3):(2'h2)];
          reg111 <= $unsigned(reg114);
          reg112 <= $signed($unsigned({reg117[(3'h5):(2'h3)], reg108}));
          if ($unsigned($signed($signed(($signed(reg115) < wire104[(2'h2):(1'h0)])))))
            begin
              reg113 <= (-$unsigned($unsigned(reg110[(4'h9):(3'h6)])));
            end
          else
            begin
              reg113 <= reg108[(1'h0):(1'h0)];
            end
        end
    end
  assign wire118 = wire102[(3'h4):(3'h4)];
  assign wire119 = $signed($unsigned(reg116));
  assign wire120 = $unsigned($unsigned(wire103[(2'h2):(2'h2)]));
  assign wire121 = (~(reg108 ? reg114[(2'h3):(1'h1)] : (8'hb2)));
  module122 #() modinst159 (.wire127(wire104), .wire124(reg110), .wire123(wire105), .wire125(wire120), .y(wire158), .clk(clk), .wire126(wire101));
  assign wire160 = wire101;
  assign wire161 = {wire103};
  assign wire162 = (wire161 == (({reg117} < ((reg113 <= reg115) && wire105)) ?
                       ((~{reg110}) ?
                           (~^$unsigned(reg117)) : $signed($unsigned(reg112))) : $signed((reg108[(1'h1):(1'h1)] ?
                           $unsigned((8'ha4)) : $signed(reg116)))));
  assign wire163 = $signed((($unsigned($signed(reg109)) < (wire158 << $unsigned(wire104))) > {((wire161 ?
                               wire158 : (8'hbe)) ?
                           $unsigned(wire162) : (reg109 ?
                               wire160 : wire160))}));
endmodule

module module5
#(parameter param89 = ((((+((8'had) ~^ (8'hb1))) ? (((8'hba) & (8'hb8)) ^~ ((8'had) * (8'ha8))) : (^~((8'ha2) == (8'ha3)))) | (({(8'ha3), (8'ha3)} ? (~(7'h41)) : ((8'hac) << (8'hb5))) ? (((8'hb3) ? (8'had) : (8'hb3)) > (~|(8'hac))) : ((^~(8'ha8)) >= {(8'hbc)}))) ? ((((!(8'ha5)) ? ((8'ha6) >>> (8'ha8)) : (|(8'ha3))) ? (7'h44) : (((8'had) > (8'hb4)) == ((8'ha2) * (8'hba)))) ^~ ((&((8'hbf) >> (8'hb0))) ? {((8'ha7) ? (8'haa) : (8'hba)), (^(8'ha0))} : (((8'h9d) ^ (8'h9f)) ? (!(8'hb6)) : ((8'h9e) <= (8'hb1))))) : {{((~(7'h42)) ? ((8'hb7) ? (7'h42) : (7'h41)) : ((8'hbe) ? (8'hbf) : (8'hb0)))}, (((-(8'hb5)) ^ (~(8'h9d))) ? (8'hab) : {(8'hab)})}))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire88;
  wire signed [(2'h2):(1'h0)] wire87;
  wire [(4'hb):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire69,
                 wire67,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
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
                 (1'h0)};
  assign wire11 = $unsigned(wire8[(3'h4):(3'h4)]);
  assign wire12 = $unsigned((($unsigned((|wire6)) ?
                          (wire11[(3'h7):(3'h5)] & $signed(wire6)) : wire7) ?
                      (!(^(-wire8))) : $unsigned(((wire6 ?
                          wire8 : wire11) <<< (~|wire6)))));
  assign wire13 = {(-wire9[(1'h0):(1'h0)])};
  assign wire14 = (wire13[(4'hf):(4'h8)] ? wire8 : (wire8 + wire8));
  assign wire15 = $unsigned((($unsigned((|wire11)) && wire10[(3'h6):(3'h5)]) | wire13));
  always
    @(posedge clk) begin
      reg16 <= $signed((-$unsigned($signed((+wire11)))));
      if ($unsigned(wire6[(4'ha):(3'h4)]))
        begin
          if (($unsigned(wire6[(2'h2):(1'h0)]) ?
              wire13 : {((((7'h40) > wire8) >= {(8'ha2)}) ?
                      wire15 : (wire10[(1'h1):(1'h0)] ?
                          (wire6 > wire14) : $unsigned(wire11))),
                  {(wire13 * reg16[(1'h0):(1'h0)]),
                      (~&((7'h40) ? (7'h44) : wire15))}}))
            begin
              reg17 <= (reg16[(4'ha):(4'ha)] ?
                  $unsigned({$signed(wire10[(3'h4):(1'h1)]),
                      wire15[(2'h3):(2'h2)]}) : wire9[(3'h7):(3'h7)]);
            end
          else
            begin
              reg17 <= wire9;
              reg18 <= wire15[(3'h5):(3'h5)];
              reg19 <= reg16;
              reg20 <= reg16;
            end
          reg21 <= ($signed({$signed($signed(wire10))}) ?
              $unsigned(wire8) : $unsigned((reg18 <<< (-(reg16 <<< wire7)))));
          if ((^({(~|(wire8 ? wire11 : (8'hb8)))} ?
              (-(&(~^wire9))) : $signed(reg17[(3'h5):(1'h1)]))))
            begin
              reg22 <= wire14[(2'h2):(1'h1)];
              reg23 <= {{((-$unsigned((8'ha7))) + $unsigned(wire9[(3'h4):(1'h0)]))},
                  ($unsigned(wire12) <<< (reg21[(4'h9):(1'h0)] ?
                      $unsigned((&wire7)) : wire7))};
              reg24 <= $unsigned(wire8);
            end
          else
            begin
              reg22 <= (((~{(^reg20),
                  $unsigned(reg23)}) < wire6[(2'h2):(2'h2)]) << (wire12 ~^ (wire11[(4'he):(1'h1)] > reg22)));
            end
          reg25 <= $signed((8'ha0));
        end
      else
        begin
          reg17 <= reg16[(4'h9):(4'h8)];
        end
      reg26 <= $unsigned(({(wire14 ^~ (-reg24))} ?
          $signed($signed(reg22)) : $unsigned($signed((&reg21)))));
      if ((-$signed(((~&(wire11 < reg19)) ?
          $unsigned((reg19 & reg24)) : {(reg17 ? (7'h44) : wire12)}))))
        begin
          if ($unsigned(reg24[(2'h2):(1'h1)]))
            begin
              reg27 <= (($signed((&reg24)) > $signed(({wire9,
                  reg25} && wire8[(1'h1):(1'h1)]))) <= (((^~$unsigned(reg26)) ^ ($signed(reg24) ?
                  (~^reg17) : (reg21 & reg16))) == reg22[(4'he):(1'h1)]));
              reg28 <= (($unsigned({reg17}) == $signed((^~wire14))) || (&wire8[(1'h0):(1'h0)]));
              reg29 <= (reg20 > $signed((-$signed({wire13, reg23}))));
              reg30 <= {$signed($unsigned($signed((-reg21)))),
                  (wire6 ~^ reg25[(4'hf):(4'hf)])};
            end
          else
            begin
              reg27 <= reg23[(5'h11):(5'h11)];
              reg28 <= wire9;
            end
          reg31 <= reg30[(5'h12):(5'h12)];
          reg32 <= reg28;
          if ($unsigned($unsigned(($signed((~&reg24)) ?
              reg19[(3'h7):(3'h7)] : ($unsigned(reg28) ?
                  $signed(wire7) : $unsigned((8'hb4)))))))
            begin
              reg33 <= $unsigned((^((+(~|wire7)) || (wire7[(4'h8):(3'h7)] * reg23))));
              reg34 <= reg20;
              reg35 <= ((~|(reg23[(5'h11):(4'hf)] + $unsigned($signed(reg21)))) ^~ $unsigned($unsigned($unsigned(reg19[(4'hc):(3'h6)]))));
              reg36 <= ($signed((~|reg19[(4'h8):(2'h2)])) <<< reg32);
              reg37 <= reg33;
            end
          else
            begin
              reg33 <= $signed((((&wire7[(4'h9):(1'h0)]) || (&$unsigned(reg17))) & ((reg18 ?
                      $signed(reg23) : $signed(reg37)) ?
                  (+reg17[(4'hd):(1'h1)]) : $unsigned(reg17[(4'ha):(3'h5)]))));
              reg34 <= reg35;
            end
          reg38 <= $unsigned(wire12[(3'h4):(2'h2)]);
        end
      else
        begin
          reg27 <= ((8'h9e) << ($unsigned((~&reg25[(3'h5):(1'h1)])) + $unsigned($signed(((7'h43) * (8'hbf))))));
          reg28 <= (((((reg35 == reg19) ?
                  wire12[(3'h7):(3'h6)] : (reg35 ?
                      wire7 : reg19)) ~^ $unsigned($signed(reg17))) ~^ {wire8,
                  ((8'hb7) ? wire14 : $unsigned(wire11))}) ?
              $signed(wire11[(4'he):(4'hd)]) : reg19);
          reg29 <= reg21[(5'h11):(4'he)];
          reg30 <= ($unsigned(($signed(wire8[(3'h6):(1'h0)]) ?
                  $signed(((8'ha8) ^~ reg31)) : $signed($signed((8'hb8))))) ?
              reg30 : $signed($unsigned(((reg31 == wire7) ?
                  (wire7 ? reg28 : wire10) : wire14))));
        end
    end
  always
    @(posedge clk) begin
      reg39 <= {{$signed(((reg25 && reg36) ?
                  $signed((8'ha3)) : reg16[(4'hf):(4'hb)]))},
          (~wire11)};
    end
  assign wire40 = {reg24,
                      $unsigned((($unsigned((8'hb1)) ?
                          (reg32 < wire11) : wire8[(1'h1):(1'h1)]) == $unsigned((reg17 ?
                          wire11 : reg17))))};
  assign wire41 = wire10;
  assign wire42 = reg36;
  assign wire43 = ($signed((8'had)) ? wire9 : reg18[(1'h1):(1'h1)]);
  module44 #() modinst68 (wire67, clk, reg22, reg23, wire8, wire13);
  assign wire69 = (8'hbc);
  module70 #() modinst84 (.wire74(wire7), .wire72(reg16), .wire71(reg33), .y(wire83), .wire73(wire6), .clk(clk));
  assign wire85 = ($signed(((wire42[(3'h4):(1'h1)] ?
                              (reg29 <<< reg39) : (~|reg23)) ?
                          reg29 : ((wire13 && wire9) + $signed(reg16)))) ?
                      (^wire41) : (wire9[(4'h8):(3'h6)] > $signed(reg18[(1'h0):(1'h0)])));
  assign wire86 = {(~|$unsigned((((8'hac) < (8'ha7)) ?
                          wire42[(3'h4):(2'h3)] : $signed(reg29)))),
                      $signed($unsigned(($signed((8'hb8)) >>> ((7'h40) > reg33))))};
  assign wire87 = ($signed($unsigned(reg17)) > (reg24[(3'h6):(2'h3)] == $signed(wire83)));
  assign wire88 = reg35[(1'h0):(1'h0)];
endmodule

module module70
#(parameter param82 = ((((&{(8'hb2), (8'hb2)}) >>> (((8'ha1) <<< (8'hab)) ? (^~(8'haf)) : ((8'hb1) ? (8'ha0) : (8'hb4)))) ? {(((8'hb6) ? (8'hbf) : (8'haa)) || (-(8'hb1))), ({(8'hbb)} ? (~(8'haf)) : ((8'hb0) & (8'hb9)))} : {({(8'haa), (8'ha4)} ? ((8'ha2) >> (8'hb4)) : ((7'h43) * (8'h9d))), {(~&(8'h9d)), {(8'ha7), (8'hba)}}}) ~^ (^((^~((7'h44) ? (8'h9d) : (8'hae))) ? (((7'h43) >> (8'hba)) ? ((8'ha4) ? (8'hb3) : (7'h40)) : ((8'hb9) ? (8'ha5) : (8'hab))) : (((8'h9e) && (8'ha4)) ^~ ((8'ha5) ? (8'h9f) : (8'h9e)))))))
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire74;
  input wire [(4'he):(1'h0)] wire73;
  input wire [(3'h4):(1'h0)] wire72;
  input wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  assign y = {wire81, wire76, wire75, reg80, reg79, reg78, reg77, (1'h0)};
  assign wire75 = $signed((&(wire71 ?
                      {(wire74 ? wire73 : wire71),
                          wire71[(3'h7):(3'h7)]} : (^~wire71[(3'h5):(3'h5)]))));
  assign wire76 = $signed((wire72[(2'h2):(1'h0)] ?
                      wire72 : ($unsigned((wire74 && wire71)) <<< (wire74[(1'h1):(1'h0)] ?
                          {(8'h9c)} : {wire73, (7'h40)}))));
  always
    @(posedge clk) begin
      reg77 <= $signed((((~^$unsigned(wire75)) == (7'h43)) * wire75));
      reg78 <= reg77[(3'h6):(1'h0)];
      reg79 <= $unsigned(wire72);
    end
  always
    @(posedge clk) begin
      reg80 <= reg77[(2'h2):(2'h2)];
    end
  assign wire81 = wire71[(2'h2):(2'h2)];
endmodule

module module44
#(parameter param66 = (((&(~&{(8'ha5), (8'hba)})) && ({((8'haa) ? (8'ha7) : (8'ha3))} ^~ (((8'hb8) | (8'hb5)) ? (~|(8'hbb)) : (~(8'h9d))))) < (^((^~((8'ha4) ? (8'hbc) : (8'hb2))) + (8'ha6)))))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire48;
  input wire [(5'h10):(1'h0)] wire47;
  input wire signed [(4'h9):(1'h0)] wire46;
  input wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  assign y = {wire65,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 wire49,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg52,
                 (1'h0)};
  assign wire49 = $signed(wire48[(5'h12):(4'hf)]);
  assign wire50 = $signed(wire46);
  assign wire51 = wire49[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg52 <= {wire47};
    end
  assign wire53 = (+(&wire47));
  assign wire54 = reg52[(4'hb):(3'h4)];
  assign wire55 = reg52[(3'h7):(2'h2)];
  assign wire56 = ((((wire55 << (wire46 ? wire54 : wire54)) ?
                      $unsigned((wire46 < wire51)) : reg52[(4'he):(4'ha)]) || $unsigned($unsigned($signed((8'hbd))))) > $unsigned($unsigned(($signed(wire49) || wire48[(4'hf):(1'h1)]))));
  always
    @(posedge clk) begin
      reg57 <= $unsigned(((($signed(reg52) << wire49[(2'h3):(1'h0)]) ?
              ($unsigned(wire46) && $unsigned(wire49)) : $signed($signed(wire51))) ?
          wire53 : wire45[(5'h10):(1'h1)]));
      reg58 <= $unsigned((8'hbb));
      if (wire49)
        begin
          reg59 <= wire46;
        end
      else
        begin
          reg59 <= ($signed((wire46[(2'h2):(1'h0)] == wire50[(1'h1):(1'h1)])) != $unsigned(((~|reg58[(3'h5):(2'h3)]) <= (reg52 + reg57[(4'he):(1'h1)]))));
          if (reg52[(3'h6):(2'h3)])
            begin
              reg60 <= (~^(wire45[(4'ha):(1'h0)] ?
                  ($unsigned({wire51,
                      wire53}) && ({reg57} != (~^(8'ha4)))) : wire56));
              reg61 <= wire55[(2'h2):(1'h0)];
              reg62 <= ((!$signed({wire55, (wire56 ~^ (8'hbe))})) ?
                  (($unsigned((wire55 - (8'ha5))) ?
                      wire46 : $signed((wire47 ?
                          wire55 : wire53))) != ((wire49 < $unsigned(reg61)) ?
                      ((!reg52) ?
                          reg61 : $signed(wire49)) : reg57[(4'he):(1'h0)])) : {$unsigned(($signed(wire45) | wire51)),
                      wire48});
              reg63 <= ((7'h44) && wire45[(4'h8):(4'h8)]);
            end
          else
            begin
              reg60 <= (wire51[(3'h6):(3'h5)] ?
                  ((7'h43) >= ({wire46, wire47} ?
                      ((wire55 >>> wire56) > $signed(reg62)) : ($signed(reg60) != $signed(wire49)))) : reg58);
              reg61 <= $signed(($signed(reg52) < (reg58[(4'hc):(4'hc)] ?
                  (~&wire56[(1'h1):(1'h1)]) : (wire45[(4'he):(1'h1)] ~^ (wire48 + wire46)))));
              reg62 <= (($signed(reg62) > (^~{reg63, $unsigned(wire49)})) ?
                  (wire56[(3'h4):(2'h3)] ?
                      $signed(wire54) : (&$unsigned({wire54}))) : ($unsigned((reg60 >> reg59[(2'h2):(1'h1)])) > reg52[(4'he):(2'h3)]));
              reg63 <= (|wire49[(2'h2):(1'h0)]);
            end
        end
      reg64 <= (wire50[(4'hc):(3'h4)] ?
          reg63[(2'h2):(1'h0)] : (+($signed(((8'hb9) ? (8'ha9) : wire45)) ?
              reg60 : (+wire46[(2'h3):(2'h2)]))));
    end
  assign wire65 = $signed(reg60);
endmodule

module module122
#(parameter param156 = {(((((8'ha1) << (8'had)) ? {(8'ha1)} : ((8'hb2) <= (8'ha5))) ? (8'hb0) : (&((8'ha4) == (8'ha3)))) || {(((8'hb4) ^~ (8'hb2)) <<< (8'hae)), (|((7'h42) ? (8'hba) : (8'hba)))}), ((~((&(8'hab)) ~^ (~^(7'h44)))) == ((((8'hb5) == (8'hb3)) ? {(8'hb2)} : ((8'ha3) ? (8'hb4) : (8'h9d))) ? ((~&(8'h9c)) >= ((8'ha4) ? (8'hbf) : (8'hb0))) : {((8'hb3) ~^ (8'hbe))}))}, 
parameter param157 = (((((param156 ? param156 : (8'ha8)) ? param156 : (~param156)) <= (param156 ? param156 : (param156 ? param156 : param156))) ? (8'haa) : ((((8'hbc) * param156) ? ((8'hac) ? param156 : (8'hac)) : (param156 >= param156)) ? param156 : ((~&param156) ? (~(7'h40)) : (8'ha2)))) + {(~|param156), ((+((8'ha6) <<< param156)) * ({param156, param156} <<< (param156 ? param156 : param156)))}))
(y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire127;
  input wire signed [(3'h5):(1'h0)] wire126;
  input wire [(3'h5):(1'h0)] wire125;
  input wire [(4'hb):(1'h0)] wire124;
  input wire [(2'h2):(1'h0)] wire123;
  wire signed [(4'h8):(1'h0)] wire155;
  wire [(5'h14):(1'h0)] wire154;
  wire signed [(3'h4):(1'h0)] wire153;
  reg signed [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(4'h8):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 reg152,
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
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg128 <= (|(wire123 == (+$unsigned(wire125))));
      reg129 <= $signed((($signed($unsigned(wire127)) <= (8'hb0)) ?
          {((&wire127) ? (8'hb1) : (wire126 ^~ (8'hb3))),
              $signed(wire124)} : wire126));
      if ((&(({(8'h9d), $unsigned((7'h42))} - $signed($signed(reg128))) ?
          (^~{wire126, ((8'h9d) > wire126)}) : (^{{reg129}, (~&(8'haf))}))))
        begin
          reg130 <= wire123;
        end
      else
        begin
          reg130 <= (wire127[(4'h8):(3'h4)] ?
              $signed(wire126[(3'h4):(2'h2)]) : (((wire127 ?
                      (^wire124) : (8'hb5)) > $signed((+(8'hba)))) ?
                  reg130[(5'h11):(1'h0)] : $signed(wire125)));
          reg131 <= $unsigned((reg128[(1'h0):(1'h0)] ?
              ((~|{reg128}) < $unsigned({reg130})) : (({(8'h9e),
                  wire123} ^ {reg129}) ^~ reg130)));
        end
      reg132 <= ($signed((|wire123)) ^~ (reg131 - (8'ha5)));
      reg133 <= (wire126 * $unsigned($unsigned(reg128)));
    end
  always
    @(posedge clk) begin
      if ((8'hb8))
        begin
          reg134 <= wire126;
          reg135 <= (&reg133[(1'h1):(1'h0)]);
          reg136 <= {(reg134[(1'h1):(1'h1)] ^~ $unsigned(((wire124 >> (7'h42)) ?
                  $signed((8'ha6)) : reg134))),
              reg135};
          if (($signed((~|({reg128, (8'hb1)} << $unsigned(reg128)))) ?
              (8'hbc) : (reg135[(2'h2):(1'h1)] <= $unsigned(((-reg129) ?
                  reg128[(1'h0):(1'h0)] : (reg132 == (8'hba)))))))
            begin
              reg137 <= (reg133 || ($unsigned((reg136 > wire123[(1'h1):(1'h1)])) ?
                  $unsigned(((wire125 << reg129) ?
                      $signed(reg134) : reg135)) : $signed((-$unsigned(reg130)))));
              reg138 <= (((((~&reg132) ? {reg136} : (8'ha3)) ?
                          {reg137,
                              (reg129 || reg131)} : reg135[(3'h6):(1'h0)]) ?
                      {wire126} : $unsigned(reg136[(4'ha):(1'h1)])) ?
                  wire127[(4'hc):(3'h6)] : (reg136 != reg130[(4'hc):(4'h9)]));
              reg139 <= $signed(reg134);
              reg140 <= ((~reg135) ~^ $unsigned((reg137[(4'ha):(3'h6)] ?
                  $unsigned((wire124 * reg131)) : (^reg134))));
            end
          else
            begin
              reg137 <= (~&$signed(((8'h9c) ?
                  $unsigned((~wire125)) : $unsigned({reg134, reg128}))));
              reg138 <= wire125;
              reg139 <= (-{$unsigned(reg134), $unsigned(reg137)});
              reg140 <= reg140;
              reg141 <= $signed({wire125[(2'h3):(1'h0)]});
            end
        end
      else
        begin
          if (($signed(($unsigned((reg136 - (8'hba))) ?
                  reg140 : reg129[(1'h0):(1'h0)])) ?
              $signed(((wire123[(1'h0):(1'h0)] ~^ reg135[(4'ha):(3'h7)]) * (wire123[(1'h0):(1'h0)] ?
                  reg141[(4'he):(4'hb)] : $unsigned(reg138)))) : ({$unsigned((wire124 ?
                          reg134 : wire123))} ?
                  $unsigned((reg141 >>> reg134)) : (reg141[(2'h2):(1'h1)] != $unsigned({wire124,
                      reg135})))))
            begin
              reg134 <= {wire126};
              reg135 <= ((reg131 != ((~&wire126) ?
                      wire127[(4'h9):(1'h0)] : $unsigned(reg134[(3'h5):(2'h2)]))) ?
                  wire126 : (^~reg128));
              reg136 <= reg140[(4'h9):(2'h2)];
              reg137 <= ({{reg141}, $signed((&{(8'hb4)}))} ?
                  $unsigned($unsigned((-wire126))) : reg137);
            end
          else
            begin
              reg134 <= (^reg135[(1'h1):(1'h0)]);
              reg135 <= ($signed((reg129[(3'h7):(2'h2)] != (8'hb0))) ?
                  {reg138} : $unsigned($signed({(~|wire124)})));
              reg136 <= ({(|wire126[(3'h4):(1'h0)])} ?
                  $signed((-(|(reg140 ?
                      reg134 : reg138)))) : ($unsigned((^~reg139)) > reg131));
            end
          reg138 <= reg128[(1'h1):(1'h1)];
          reg139 <= $unsigned(reg141);
        end
      if ($unsigned($unsigned(reg137[(3'h6):(3'h5)])))
        begin
          reg142 <= $unsigned(wire126[(2'h2):(1'h1)]);
          reg143 <= ($unsigned((((reg139 ^ reg139) ?
                  (~|reg141) : reg139[(3'h4):(2'h2)]) ?
              ({reg128, wire125} ~^ $signed(reg131)) : (~&(7'h44)))) == {reg139,
              $unsigned({wire125})});
          reg144 <= $signed((^wire127[(3'h5):(2'h2)]));
          reg145 <= ((&(7'h40)) >> reg134);
        end
      else
        begin
          if ((&$unsigned($signed({(!reg137)}))))
            begin
              reg142 <= ((&$signed(reg128[(1'h1):(1'h1)])) >> $signed(reg137[(4'hb):(4'hb)]));
              reg143 <= ($unsigned($unsigned(reg137[(1'h0):(1'h0)])) ?
                  ((~{reg133[(4'hc):(1'h0)]}) != (((wire125 || (8'hba)) ?
                          reg133 : (reg136 ? reg134 : reg142)) ?
                      reg142 : ($signed((8'h9e)) ?
                          $unsigned(reg143) : (wire123 ?
                              reg138 : reg132)))) : (~^((|$signed(reg137)) ?
                      ($unsigned(reg137) || (wire127 ?
                          wire124 : reg141)) : (8'h9c))));
              reg144 <= (+(8'had));
              reg145 <= reg128[(2'h2):(2'h2)];
            end
          else
            begin
              reg142 <= wire125[(2'h2):(1'h0)];
            end
          if (reg131)
            begin
              reg146 <= $signed((reg143[(2'h2):(1'h0)] == (8'hbf)));
              reg147 <= reg146[(3'h7):(3'h4)];
              reg148 <= (reg137[(4'hc):(3'h5)] || (({{reg129}} != (~^reg143[(3'h5):(2'h3)])) ?
                  (-(^~wire123)) : {$signed(reg136),
                      (reg137[(3'h6):(2'h3)] ? (|reg128) : $signed(wire126))}));
            end
          else
            begin
              reg146 <= reg134;
              reg147 <= ($unsigned(reg130) == {$signed($unsigned((~|reg139))),
                  $unsigned((+reg133[(4'ha):(3'h4)]))});
              reg148 <= (-$unsigned($signed((reg128 ?
                  (reg133 << (8'ha7)) : (reg135 ? wire125 : wire123)))));
              reg149 <= $unsigned($signed($unsigned($unsigned($unsigned((8'hb0))))));
              reg150 <= {$unsigned(reg142),
                  $unsigned((wire125 ?
                      ((^~reg130) ? $unsigned(wire125) : {wire126}) : {{reg141,
                              (8'hb1)},
                          (~&reg145)}))};
            end
        end
    end
  always
    @(posedge clk) begin
      if ($signed(reg139))
        begin
          reg151 <= ((+$unsigned(((-wire123) ?
              $signed((8'ha2)) : (reg134 <<< reg132)))) || {reg137[(4'he):(2'h2)]});
          reg152 <= (((reg147 ?
              {$unsigned(reg150),
                  $unsigned(reg142)} : $signed((reg129 < (8'h9f)))) * {(wire127 ?
                  $signed((8'hbc)) : (!(8'ha8)))}) <= reg128);
        end
      else
        begin
          reg151 <= (~&$unsigned(reg136[(1'h1):(1'h1)]));
        end
    end
  assign wire153 = reg135;
  assign wire154 = reg137;
  assign wire155 = (-reg131);
endmodule
