module top
#(parameter param123 = ((((((8'haa) ? (8'haa) : (8'hbc)) ? {(8'hb3)} : ((8'hb6) >> (8'hbb))) ? (((8'ha2) ? (8'hac) : (8'hbf)) || (^(8'ha3))) : (8'hbb)) >> ((~^(8'hbb)) < (^(8'haf)))) ? ((((&(8'hb8)) ? ((8'hbe) ? (8'h9d) : (8'ha9)) : ((8'ha1) + (8'hac))) ^~ ((7'h41) ~^ ((8'hb9) ? (8'h9f) : (8'hb1)))) ~^ (^(~(~&(8'hb1))))) : (((((8'h9f) ? (8'ha5) : (8'ha6)) ^~ ((8'hb5) << (8'ha0))) ? ((~(8'hbb)) ? ((8'hb9) ? (8'hbf) : (8'hb7)) : ((8'hb2) <= (8'ha5))) : (((8'hac) ? (8'ha7) : (8'haa)) ^~ ((8'ha3) & (8'hbf)))) ? {(((8'hbe) | (8'hbf)) ? {(8'h9e)} : (~^(8'ha8))), (!((8'ha1) ? (8'ha2) : (8'hba)))} : {(^((8'haf) ? (8'hbb) : (8'ha7))), (((8'ha3) ? (8'hb4) : (8'ha5)) & {(8'hbc)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire93;
  wire signed [(5'h12):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire111;
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire85,
                 wire4,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire97,
                 wire111,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire4 = wire2;
  module5 #() modinst86 (wire85, clk, wire4, wire2, wire3, wire0, wire1);
  assign wire87 = $signed(wire85);
  assign wire88 = wire1[(3'h4):(3'h4)];
  assign wire89 = (^~wire0[(3'h7):(1'h1)]);
  assign wire90 = (^wire88);
  assign wire91 = (8'h9c);
  assign wire92 = wire90;
  assign wire93 = (~|wire89);
  always
    @(posedge clk) begin
      reg94 <= $unsigned({wire87[(3'h4):(1'h1)]});
      reg95 <= ($unsigned({$signed((wire3 == (8'hbf))), (8'hab)}) ^ wire90);
      reg96 <= ($unsigned($signed((&(^~wire93)))) ?
          wire89[(3'h6):(3'h5)] : $unsigned(($signed(wire90) ?
              (wire91 ? (~wire0) : wire85) : (+((8'ha9) ? wire85 : (8'ha1))))));
    end
  assign wire97 = ($signed(wire93[(2'h3):(1'h1)]) <= {wire2,
                      ($unsigned((reg95 ? wire4 : wire85)) ^ wire90)});
  module98 #() modinst112 (.y(wire111), .clk(clk), .wire99(wire91), .wire102(wire87), .wire100(wire2), .wire101(wire90), .wire103(wire88));
  assign wire113 = (^~(-$unsigned({(wire1 == wire85), (wire87 + wire4)})));
  assign wire114 = (~|((wire3[(4'hc):(1'h1)] >> $unsigned($unsigned(wire0))) ?
                       $signed(wire3) : $signed($unsigned(wire113))));
  always
    @(posedge clk) begin
      reg115 <= (8'hac);
      if ((wire3 >> (^~(^~wire0[(5'h11):(3'h7)]))))
        begin
          if (reg94)
            begin
              reg116 <= wire3;
              reg117 <= ((wire2[(1'h0):(1'h0)] <= wire1[(4'h8):(1'h0)]) ?
                  ($signed($unsigned({wire0})) ?
                      (wire97[(3'h4):(2'h2)] ?
                          wire111[(2'h3):(1'h1)] : wire87) : {wire93}) : wire85[(4'hb):(4'h8)]);
              reg118 <= $unsigned($signed((((wire91 ?
                      wire113 : (8'haa)) != (wire111 ? wire92 : wire90)) ?
                  ((reg117 ? wire97 : wire111) ?
                      (wire89 | wire90) : (!wire111)) : ((wire113 ^~ wire87) - (~&reg96)))));
            end
          else
            begin
              reg116 <= wire4;
              reg117 <= $signed(reg95[(4'ha):(4'ha)]);
              reg118 <= $unsigned({((wire2[(4'he):(4'ha)] <<< (wire92 + wire87)) ?
                      (~|(wire111 ~^ wire88)) : $unsigned(wire4[(1'h1):(1'h0)])),
                  (8'h9f)});
              reg119 <= (((~wire111[(1'h1):(1'h0)]) ^ (~&({wire114,
                  wire93} << {wire87, wire2}))) & (($unsigned($signed(reg118)) ?
                      wire113 : $unsigned(wire92)) ?
                  reg117 : (8'hbe)));
            end
          reg120 <= (~^{((~^wire111[(2'h2):(1'h1)]) != ((&wire0) * (wire3 ^ reg117)))});
          reg121 <= $signed($signed(reg119));
        end
      else
        begin
          reg116 <= (^~(-(8'ha8)));
          reg117 <= $signed(reg121);
          reg118 <= ($signed(($signed($unsigned(wire91)) && (!$unsigned(wire87)))) == (wire113[(1'h1):(1'h1)] && $signed($signed($signed(reg95)))));
          reg119 <= reg96;
        end
      reg122 <= wire111[(1'h0):(1'h0)];
    end
endmodule

module module98
#(parameter param110 = ({(((^~(8'haf)) ? ((8'hb2) ? (7'h43) : (8'ha8)) : {(8'ha6)}) >> (~^(8'hbf))), {({(8'hb9)} ? ((7'h42) <= (8'hae)) : ((7'h40) ? (7'h44) : (8'hb6))), (((7'h41) ? (8'hba) : (8'hb7)) ? ((8'ha4) ? (8'h9f) : (8'hb7)) : (|(8'h9c)))}} < (8'hbb)))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire103;
  input wire signed [(2'h2):(1'h0)] wire102;
  input wire [(5'h15):(1'h0)] wire101;
  input wire [(4'ha):(1'h0)] wire100;
  input wire signed [(2'h3):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire104;
  assign y = {wire109, wire108, wire107, wire106, wire105, wire104, (1'h0)};
  assign wire104 = wire99[(1'h0):(1'h0)];
  assign wire105 = (^~$signed((8'ha1)));
  assign wire106 = wire104;
  assign wire107 = ($unsigned((8'h9e)) ?
                       (($signed((!wire103)) < $unsigned((+wire100))) ?
                           $unsigned($signed(((8'had) && wire101))) : $signed($unsigned(wire101[(3'h5):(3'h5)]))) : (-wire103[(4'hd):(4'hd)]));
  assign wire108 = (^wire101[(5'h15):(4'h9)]);
  assign wire109 = (((-(~|wire99[(2'h3):(1'h1)])) | $unsigned(($unsigned(wire101) ?
                           (wire108 == wire100) : (wire104 << wire107)))) ?
                       (wire103[(5'h10):(5'h10)] <= wire99[(1'h0):(1'h0)]) : ((8'h9d) ?
                           (wire101 ^ $unsigned(wire108[(2'h3):(1'h1)])) : (^~((wire103 ^~ (8'haf)) != (wire100 ?
                               wire103 : wire108)))));
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire13,
                 wire12,
                 wire11,
                 reg84,
                 reg83,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  assign wire11 = wire6;
  assign wire12 = (!((!$signed((+wire7))) ~^ $signed(wire10)));
  assign wire13 = $signed({(8'hbe)});
  always
    @(posedge clk) begin
      reg14 <= ((~^$signed($unsigned(wire6))) < $signed((~|(^~wire7))));
      reg15 <= (^~$unsigned((8'ha6)));
      reg16 <= ((^~wire12[(1'h1):(1'h0)]) ?
          ($signed(wire11) ?
              (&(reg14 ?
                  (reg15 > wire10) : {wire7})) : wire6[(3'h5):(2'h2)]) : (8'hb7));
      reg17 <= (~|{{{(~|reg16), reg16}, wire6[(4'ha):(2'h2)]}});
    end
  always
    @(posedge clk) begin
      reg18 <= {$unsigned((wire13 ? wire6 : $signed((wire10 != wire11)))),
          reg16};
      reg19 <= wire9;
      reg20 <= (($unsigned(wire10) | ($unsigned($signed(wire11)) ?
              {(~&wire12)} : {$unsigned((8'hbc))})) ?
          $unsigned(reg18) : $signed(wire13));
    end
  module21 #() modinst59 (wire58, clk, wire7, reg19, wire13, reg17, reg15);
  assign wire60 = wire9;
  assign wire61 = ({$unsigned(((~wire13) | (wire6 >>> wire8))),
                      ({(wire60 <= wire7),
                          (|wire7)} != (8'ha1))} * (({(reg15 <<< reg14),
                          (!wire6)} <= (^(~|wire13))) ?
                      (~^$signed($unsigned((8'hbf)))) : {$signed($unsigned(reg14))}));
  assign wire62 = (reg15 & $signed($signed($signed((8'hb3)))));
  always
    @(posedge clk) begin
      if ((~wire9))
        begin
          reg63 <= reg18[(1'h0):(1'h0)];
        end
      else
        begin
          reg63 <= (8'h9e);
        end
      reg64 <= (~($signed($unsigned(reg20)) ?
          wire60[(3'h5):(3'h4)] : ({reg16[(3'h4):(2'h3)]} ?
              $signed($signed((8'hbf))) : ({wire7,
                  (8'hac)} >= reg14[(1'h0):(1'h0)]))));
      reg65 <= {reg19[(4'h8):(1'h0)], wire10[(1'h0):(1'h0)]};
      reg66 <= $unsigned(reg63);
      reg67 <= {$unsigned((({reg20, reg19} | $unsigned((7'h43))) ?
              wire7 : wire60[(4'hd):(4'hd)]))};
    end
  assign wire68 = reg67;
  assign wire69 = (+(+{{reg15[(3'h4):(1'h1)], (&reg14)},
                      ((~reg14) ? wire68[(3'h5):(2'h3)] : (8'had))}));
  assign wire70 = $signed(({reg16,
                          ((wire13 ? (8'ha3) : reg67) ?
                              reg17[(3'h4):(3'h4)] : (wire8 ?
                                  (8'h9f) : wire68))} ?
                      ($signed(wire68) ?
                          $unsigned($unsigned(wire6)) : $signed((reg67 ?
                              wire68 : wire8))) : reg20[(4'ha):(3'h7)]));
  assign wire71 = wire7[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg72 <= ($unsigned(reg18[(1'h1):(1'h0)]) ?
          (-(+((wire13 ?
              wire68 : wire61) >= (8'hb2)))) : wire11[(1'h0):(1'h0)]);
      reg73 <= (wire70 ?
          $signed(reg19[(3'h4):(2'h2)]) : (~^((((8'haa) || wire61) ^ ((8'ha5) ?
              wire11 : reg72)) | (~^((8'hb0) && reg66)))));
      if (($unsigned(wire13) ?
          (reg67 >= $signed(((8'hac) < reg65))) : wire10[(2'h2):(2'h2)]))
        begin
          reg74 <= (reg15[(3'h4):(2'h2)] < (7'h43));
          reg75 <= ((~&(reg74 ?
              (wire6 ?
                  $signed(wire7) : $unsigned(reg63)) : ((wire9 > wire10) && $signed(wire13)))) < ({(-(reg73 >>> reg66)),
                  (~(8'hbd))} ?
              (-((+reg73) ?
                  (wire13 << reg19) : (reg19 > wire12))) : $unsigned($signed(reg65[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg74 <= reg17;
        end
      if (wire61[(4'ha):(4'h9)])
        begin
          reg76 <= reg18;
        end
      else
        begin
          if ($signed($unsigned(wire71)))
            begin
              reg76 <= {$signed(wire60), wire61};
              reg77 <= reg17[(3'h6):(1'h1)];
              reg78 <= (~|reg17);
              reg79 <= reg75[(2'h3):(1'h0)];
            end
          else
            begin
              reg76 <= $unsigned($unsigned($signed(reg17[(3'h7):(1'h1)])));
              reg77 <= (({$signed(wire11)} ?
                  (wire71 <= reg19) : (reg64[(2'h3):(2'h2)] >>> ($signed(wire10) ?
                      reg74 : wire11))) >>> wire12);
              reg78 <= (8'ha7);
            end
          if ((($signed($unsigned((^reg17))) ?
                  ({(reg20 ?
                          reg72 : reg77)} < reg73[(3'h4):(2'h3)]) : (^~reg16)) ?
              $unsigned((8'h9e)) : {reg79}))
            begin
              reg80 <= reg66[(4'he):(2'h3)];
              reg81 <= ($signed($unsigned(wire13[(4'hf):(2'h3)])) ?
                  reg78[(3'h5):(1'h0)] : {reg20[(3'h5):(1'h0)],
                      ($unsigned(reg75[(3'h4):(1'h1)]) - reg79)});
            end
          else
            begin
              reg80 <= $signed(reg66);
              reg81 <= (~&reg19);
              reg82 <= wire9[(1'h0):(1'h0)];
              reg83 <= (|reg82[(3'h4):(1'h1)]);
              reg84 <= $signed($unsigned((|(&reg76[(3'h4):(2'h2)]))));
            end
        end
    end
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire26;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire [(5'h14):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(3'h6):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  assign y = {wire57,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire27 = wire25;
  assign wire28 = wire24;
  assign wire29 = (-$unsigned((($signed((8'ha1)) | (~^wire28)) >> (^((8'ha4) ?
                      wire23 : wire22)))));
  assign wire30 = wire29[(5'h12):(1'h0)];
  always
    @(posedge clk) begin
      reg31 <= $unsigned($unsigned($unsigned((wire30 ?
          (wire30 ? wire23 : wire28) : (+wire25)))));
      reg32 <= (+wire25);
      reg33 <= {wire24,
          ($signed(($unsigned((8'h9f)) ?
              wire22 : (^~wire24))) > (!wire30[(1'h0):(1'h0)]))};
      reg34 <= $unsigned(wire29);
    end
  always
    @(posedge clk) begin
      reg35 <= $unsigned(wire26[(1'h0):(1'h0)]);
      reg36 <= $signed(($unsigned(reg33) ?
          $unsigned((~^$unsigned((8'ha2)))) : $unsigned($signed((reg32 != wire22)))));
      reg37 <= wire22[(3'h4):(1'h0)];
      reg38 <= ($unsigned((wire22[(2'h2):(1'h0)] != $signed(wire25))) ?
          reg37[(1'h1):(1'h0)] : reg36[(1'h0):(1'h0)]);
      reg39 <= (+((($signed(wire25) || (wire24 ?
          reg37 : wire30)) << (8'hb6)) ~^ $unsigned($unsigned(((8'ha0) | wire30)))));
    end
  assign wire40 = reg36[(4'hd):(1'h0)];
  assign wire41 = (^~$unsigned(wire27));
  assign wire42 = reg37[(3'h6):(2'h3)];
  assign wire43 = $signed($signed(reg38[(1'h1):(1'h1)]));
  assign wire44 = (wire43 <= $unsigned({reg32}));
  always
    @(posedge clk) begin
      reg45 <= $signed(((reg38 ?
          {(wire27 <<< wire25),
              $unsigned(wire23)} : (((8'h9d) > reg32) >>> (~wire43))) & (~&$unsigned({wire23,
          reg31}))));
    end
  always
    @(posedge clk) begin
      if (reg33[(3'h6):(3'h6)])
        begin
          if (wire43[(1'h0):(1'h0)])
            begin
              reg46 <= (~&(~((!(8'ha4)) << $unsigned((wire29 >> wire30)))));
              reg47 <= $unsigned(((8'hae) | wire42));
            end
          else
            begin
              reg46 <= wire42;
              reg47 <= $signed({$unsigned({(reg34 ? (8'ha4) : reg32)})});
              reg48 <= wire44[(3'h7):(3'h6)];
            end
          if ((reg32[(1'h0):(1'h0)] ?
              (^~wire24) : {(~^$signed(wire26)),
                  ((|(wire42 ? wire30 : reg48)) ? wire26 : (-{wire24}))}))
            begin
              reg49 <= (+(!$signed(wire25[(2'h3):(2'h3)])));
            end
          else
            begin
              reg49 <= reg38;
            end
        end
      else
        begin
          reg46 <= reg38[(1'h0):(1'h0)];
          reg47 <= reg36;
          reg48 <= wire42;
          if ({$unsigned(((8'ha9) - reg48[(2'h3):(1'h0)]))})
            begin
              reg49 <= ($signed(reg47[(1'h0):(1'h0)]) ?
                  (+reg33[(4'hf):(1'h0)]) : ($signed($unsigned((reg47 ?
                          wire30 : reg47))) ?
                      ($signed($signed((8'h9e))) ? wire22 : reg38) : reg38));
            end
          else
            begin
              reg49 <= reg45;
            end
          if ($signed(wire22))
            begin
              reg50 <= wire30[(2'h2):(1'h1)];
              reg51 <= $signed((~$unsigned((+wire28[(2'h2):(1'h0)]))));
              reg52 <= {((((reg31 ? wire44 : wire43) ~^ reg32[(2'h3):(2'h2)]) ?
                      ((wire42 ? reg51 : (7'h43)) ?
                          (reg50 >= (8'h9d)) : wire27) : wire26[(3'h7):(1'h0)]) ^ (~^((wire44 ?
                      wire25 : (7'h42)) + (wire22 << wire23))))};
              reg53 <= $unsigned(reg50);
            end
          else
            begin
              reg50 <= reg35;
              reg51 <= $unsigned((~|(+$signed((wire24 && wire30)))));
            end
        end
      reg54 <= $signed($signed(($unsigned((wire29 ?
          reg51 : reg36)) == (!$signed(reg38)))));
      reg55 <= wire42;
      reg56 <= ((8'hb9) ^~ reg50);
    end
  assign wire57 = ((&(((&reg54) > $unsigned(reg32)) ?
                          $unsigned($unsigned((8'hbf))) : (+$signed(reg32)))) ?
                      {$unsigned(((!reg51) ?
                              (wire42 * wire24) : reg32))} : $signed((^~(|wire41[(4'h8):(3'h4)]))));
endmodule
