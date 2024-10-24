module top
#(parameter param146 = ((&((8'h9e) << (((7'h41) || (8'ha8)) == ((7'h44) || (8'hac))))) ? (|{{(^(8'hbd)), ((8'ha6) && (8'ha9))}, (((7'h40) ? (8'ha0) : (8'hbe)) >> (|(8'hac)))}) : (((8'h9e) + (~|((8'ha2) ? (8'hbb) : (8'hae)))) * (8'hb0))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire145;
  wire signed [(4'hc):(1'h0)] wire144;
  wire signed [(2'h2):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire142;
  wire signed [(3'h4):(1'h0)] wire140;
  wire signed [(5'h12):(1'h0)] wire139;
  wire signed [(2'h2):(1'h0)] wire135;
  wire signed [(5'h12):(1'h0)] wire134;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire132;
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire140,
                 wire139,
                 wire135,
                 wire134,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire70,
                 wire72,
                 wire82,
                 wire132,
                 reg141,
                 reg138,
                 reg137,
                 reg136,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire4 = $signed($signed($unsigned($signed((|wire1)))));
  assign wire5 = (wire2 ?
                     $signed(({(wire3 ? wire0 : (8'hbb)),
                         wire0} <<< wire1[(3'h5):(1'h1)])) : wire0);
  assign wire6 = ($unsigned($unsigned(wire0)) ?
                     ({(^$unsigned(wire4)),
                             $unsigned((wire0 ? (8'ha2) : wire2))} ?
                         (~^(8'ha2)) : (~(^~(~^wire0)))) : ({$unsigned(wire4)} ^ (-(~&$unsigned(wire3)))));
  assign wire7 = ($unsigned($unsigned((&$signed((8'ha3))))) ^ $unsigned((wire5[(3'h4):(2'h3)] >> $unsigned($signed(wire1)))));
  assign wire8 = $unsigned($unsigned(wire2[(4'h8):(1'h1)]));
  assign wire9 = (|$unsigned((wire0[(1'h0):(1'h0)] ?
                     $signed($unsigned(wire3)) : (8'hbe))));
  module10 #() modinst71 (wire70, clk, wire9, wire3, wire4, wire5);
  assign wire72 = $signed((((wire0 < wire7[(4'hd):(1'h1)]) ?
                          wire4[(5'h15):(4'ha)] : wire5) ?
                      $signed(wire70[(2'h2):(1'h1)]) : (^~($unsigned((8'hb0)) ?
                          $signed(wire70) : $unsigned(wire8)))));
  always
    @(posedge clk) begin
      reg73 <= $unsigned($unsigned(wire9[(1'h0):(1'h0)]));
      if (wire0)
        begin
          if ((8'hb4))
            begin
              reg74 <= ((|({(8'hb4), (wire2 <<< wire70)} ?
                      ((wire6 ? (8'h9c) : wire5) ?
                          ((8'hb2) * wire5) : wire4) : {(reg73 ? wire1 : wire1),
                          (wire72 ? wire9 : wire6)})) ?
                  $unsigned($signed((8'hbd))) : $signed(wire1));
              reg75 <= wire1[(4'h9):(3'h6)];
              reg76 <= ({({(wire7 ? reg74 : (8'hb5)),
                      (wire7 ?
                          wire1 : wire7)} ~^ (reg73[(2'h3):(2'h3)] || (!wire0))),
                  wire3[(3'h6):(1'h1)]} <= (8'h9f));
            end
          else
            begin
              reg74 <= $signed({($signed({(8'ha5),
                      wire1}) + $signed((+wire3)))});
              reg75 <= ($signed(wire6) ?
                  wire70[(4'h8):(3'h6)] : $unsigned(($signed((~(8'h9f))) << ($unsigned((8'h9f)) ?
                      $unsigned(reg74) : {wire8}))));
              reg76 <= wire6[(3'h5):(3'h4)];
              reg77 <= (|wire5[(4'he):(2'h3)]);
            end
          if ($unsigned((^~wire4)))
            begin
              reg78 <= (~^$unsigned(((wire8[(3'h6):(3'h4)] ?
                  (wire8 ?
                      (8'h9f) : wire5) : reg77[(3'h6):(2'h3)]) ^~ $signed((wire2 ?
                  reg74 : wire1)))));
              reg79 <= (^((+reg74) ?
                  wire3 : (wire0[(3'h7):(3'h6)] ?
                      wire0[(3'h4):(1'h0)] : {(reg74 > wire3)})));
              reg80 <= wire6[(3'h7):(3'h4)];
            end
          else
            begin
              reg78 <= $unsigned($signed(((7'h44) == $signed($signed(wire70)))));
            end
          reg81 <= (~wire8[(2'h2):(2'h2)]);
        end
      else
        begin
          reg74 <= {(~|$unsigned(($signed(reg74) ?
                  (^~wire6) : $signed(wire6))))};
          reg75 <= ((~&(!(((8'hb8) ?
              wire3 : reg77) || reg78[(3'h4):(1'h0)]))) ^~ ($unsigned(reg81[(3'h5):(3'h5)]) - {reg81[(4'he):(4'ha)]}));
          if ($signed((wire4 == ((wire9[(2'h2):(1'h1)] != {wire72}) ?
              wire4 : wire9[(1'h0):(1'h0)]))))
            begin
              reg76 <= $unsigned($signed(($signed({(8'hbd)}) ?
                  reg75[(1'h1):(1'h1)] : $signed(reg81))));
            end
          else
            begin
              reg76 <= $unsigned((reg81[(3'h5):(3'h4)] <<< wire5));
              reg77 <= reg78[(4'ha):(1'h0)];
              reg78 <= $signed($unsigned($unsigned(((reg73 ?
                  reg81 : wire72) != wire1))));
            end
        end
    end
  assign wire82 = wire6[(2'h3):(1'h0)];
  module83 #() modinst133 (.y(wire132), .wire84(reg81), .wire87(wire70), .clk(clk), .wire88(reg80), .wire85(wire2), .wire86(wire6));
  assign wire134 = reg76;
  assign wire135 = (8'ha5);
  always
    @(posedge clk) begin
      reg136 <= ((~^(!(^((8'ha3) + wire4)))) ?
          reg75[(1'h1):(1'h1)] : $unsigned(wire135[(2'h2):(1'h1)]));
      reg137 <= (|($unsigned((wire82[(3'h4):(1'h1)] << (wire9 ?
              (7'h43) : (8'ha6)))) ?
          ((((8'hb5) ? wire134 : wire0) <= (reg75 + (8'h9e))) ?
              (8'hb5) : $unsigned((~|wire70))) : reg78[(4'ha):(2'h3)]));
      reg138 <= $unsigned($signed((8'ha6)));
    end
  assign wire139 = reg137[(1'h0):(1'h0)];
  assign wire140 = wire132[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg141 <= reg138;
    end
  assign wire142 = (&wire5[(1'h1):(1'h1)]);
  assign wire143 = (wire9 ?
                       $unsigned((((reg77 * wire5) ?
                               (reg75 ? wire132 : reg75) : {wire0}) ?
                           (wire140 ?
                               $unsigned(wire82) : {wire9}) : wire7)) : (($unsigned(wire4[(2'h3):(2'h3)]) ?
                           $unsigned((+reg77)) : wire142) - reg80));
  assign wire144 = $unsigned((-$unsigned(($unsigned(wire0) ?
                       reg75 : $unsigned(wire140)))));
  assign wire145 = reg81;
endmodule

module module83
#(parameter param131 = ((+((((8'hbc) ? (8'hab) : (8'hbf)) < {(8'hac), (8'hb2)}) != (&((8'hb4) ? (8'haa) : (8'ha4))))) <<< (((((8'hb0) ? (7'h42) : (8'hbb)) << ((8'hbb) << (8'hb3))) < {{(8'h9c), (8'h9d)}}) != (8'ha3))))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire88;
  input wire [(3'h4):(1'h0)] wire87;
  input wire signed [(4'he):(1'h0)] wire86;
  input wire signed [(4'hf):(1'h0)] wire85;
  input wire [(3'h4):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire130;
  wire [(2'h2):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire [(5'h13):(1'h0)] wire126;
  wire signed [(4'h9):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(4'h9):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(5'h10):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire91,
                 wire90,
                 wire89,
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
                 reg112,
                 reg111,
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
                 (1'h0)};
  assign wire89 = (({((&wire84) ^~ wire86[(3'h6):(2'h3)])} <= $unsigned($signed((wire85 * wire88)))) ^ ((~wire86) || wire84[(1'h0):(1'h0)]));
  assign wire90 = ((|wire86) ^ ((!wire87[(2'h2):(1'h0)]) ^ ($unsigned($signed(wire84)) ?
                      $signed($signed(wire88)) : $unsigned((|wire84)))));
  assign wire91 = (wire87 ? (8'haf) : wire89);
  always
    @(posedge clk) begin
      if ((8'h9e))
        begin
          if ((^$signed($signed((^(wire89 ? (8'hb5) : wire87))))))
            begin
              reg92 <= ({wire90[(3'h4):(1'h0)],
                      (~|$signed(wire85[(4'h8):(1'h0)]))} ?
                  $unsigned(wire89[(4'hd):(4'h9)]) : wire89);
              reg93 <= (wire86 ?
                  wire86 : $unsigned((wire91[(2'h2):(1'h0)] ^~ (wire91 ?
                      wire86[(4'h9):(2'h3)] : (wire91 ? wire88 : wire91)))));
              reg94 <= (~((8'hb1) ?
                  {((~reg93) ^ (wire90 || wire86))} : $signed({(7'h43)})));
              reg95 <= wire86;
            end
          else
            begin
              reg92 <= $unsigned($unsigned($signed($signed($signed(wire90)))));
              reg93 <= ($signed((-$signed($unsigned(wire88)))) ?
                  wire89[(4'hd):(4'hc)] : reg93[(4'hb):(4'h9)]);
            end
          reg96 <= $unsigned(($unsigned(wire91) ?
              $unsigned(({reg92} ?
                  {(8'hac),
                      wire89} : $unsigned(reg95))) : $unsigned(wire91[(2'h3):(1'h1)])));
          reg97 <= (&(($unsigned({(8'ha4)}) ?
                  (&$signed(wire90)) : {$signed(wire91),
                      wire89[(4'ha):(4'h9)]}) ?
              (|(wire87[(2'h3):(2'h3)] ?
                  (wire84 > reg94) : $signed((8'ha1)))) : (~$signed(((8'hb6) * (8'h9e))))));
          reg98 <= wire91;
          if (wire84)
            begin
              reg99 <= (wire86 >>> wire90[(2'h2):(2'h2)]);
              reg100 <= $signed(({($unsigned(reg92) > (wire88 | reg95)),
                      {(8'h9e), (wire88 != wire85)}} ?
                  $signed((~|wire91)) : (!wire86[(4'hd):(4'hb)])));
              reg101 <= ((^~wire86[(3'h7):(1'h1)]) ?
                  (~wire85) : $signed($unsigned($unsigned(reg94))));
              reg102 <= wire89;
              reg103 <= (^{(|(~^$unsigned(reg98))), (~|wire88)});
            end
          else
            begin
              reg99 <= (~|$signed((7'h40)));
            end
        end
      else
        begin
          reg92 <= ((-(($unsigned(reg93) <<< wire84) ?
                  reg102[(3'h4):(3'h4)] : reg95[(5'h10):(1'h1)])) ?
              wire84 : {$signed(reg101)});
          reg93 <= $unsigned((~|(($signed(wire87) != {reg92}) ?
              reg99 : reg101)));
        end
      reg104 <= ((8'hbf) >>> wire88[(1'h0):(1'h0)]);
    end
  assign wire105 = ((((~&((8'h9d) ?
                       reg92 : reg98)) & (8'hb3)) >> reg94) <= ((^~(reg96[(3'h4):(2'h3)] ?
                       $signed((8'ha1)) : (&reg95))) << (($unsigned(reg93) ?
                           $unsigned(wire90) : $unsigned(reg101)) ?
                       (reg95 - (8'hb4)) : $signed(((8'hb5) != reg97)))));
  assign wire106 = reg94;
  assign wire107 = wire89;
  assign wire108 = $signed(({($unsigned((8'hb9)) ?
                               ((8'hb9) ? reg94 : reg101) : $signed(wire107))} ?
                       $signed(reg93) : $signed($unsigned((-reg94)))));
  assign wire109 = $signed((8'ha9));
  assign wire110 = $signed(reg97[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if ((($signed((~&(wire89 || reg98))) ?
          reg98[(1'h0):(1'h0)] : $signed((reg97 ?
              $unsigned((8'hbb)) : reg101))) && ((8'hbb) ?
          ($signed($signed(reg95)) << (~|$unsigned(wire106))) : (8'ha2))))
        begin
          if (wire85)
            begin
              reg111 <= $signed(wire89[(3'h5):(3'h4)]);
              reg112 <= {$signed(wire87)};
              reg113 <= $signed($unsigned(reg94));
              reg114 <= wire88;
            end
          else
            begin
              reg111 <= {$signed(wire110[(3'h4):(2'h3)])};
              reg112 <= {($signed($unsigned((reg113 == wire91))) ?
                      $unsigned({$signed(reg98),
                          {(8'ha8)}}) : $unsigned((~&$unsigned(reg99))))};
              reg113 <= ($unsigned(wire85) ?
                  ($unsigned($signed({reg103,
                      wire106})) ^~ ((^(reg102 && reg113)) ?
                      $unsigned((reg101 ^~ wire108)) : (8'ha6))) : wire108[(4'h8):(3'h6)]);
              reg114 <= $signed(reg111[(3'h4):(2'h2)]);
              reg115 <= (($signed({reg96[(3'h4):(2'h2)]}) ?
                  {(^(^~reg97))} : (8'hb6)) - wire91);
            end
          reg116 <= $signed((((((8'hbc) >> reg99) & (~|reg99)) ?
              reg104 : wire105) ^ wire106[(4'h9):(3'h5)]));
          reg117 <= (8'hbd);
        end
      else
        begin
          reg111 <= reg113;
          reg112 <= reg102[(5'h10):(2'h3)];
          reg113 <= (~|{reg100[(1'h0):(1'h0)],
              {wire109[(4'hb):(3'h7)], reg101}});
          reg114 <= ((~&$unsigned(wire84[(1'h1):(1'h1)])) ?
              {$signed((wire107[(4'h9):(3'h6)] == $signed(reg114)))} : (~$signed((^$signed(wire105)))));
          reg115 <= $signed(reg102[(3'h4):(2'h2)]);
        end
      reg118 <= reg102;
      if ($signed($signed($unsigned((~^(&(8'haf)))))))
        begin
          reg119 <= (({{$signed(wire110), (reg118 ? wire91 : reg102)}} ?
                  (($signed(reg96) ?
                      {wire90} : wire90[(1'h1):(1'h0)]) >> (~&reg102[(4'h9):(4'h8)])) : (({reg102,
                          reg99} * wire108) ?
                      (reg113 ?
                          $signed(reg98) : $signed(reg97)) : $unsigned(wire91))) ?
              {reg115} : {($unsigned($unsigned(reg118)) ?
                      (^reg94) : $unsigned($unsigned(reg101)))});
          reg120 <= (($signed($signed($signed(reg102))) ?
              {wire89,
                  $unsigned($unsigned(wire91))} : $signed(reg94[(4'h8):(2'h3)])) == wire87);
        end
      else
        begin
          reg119 <= wire88;
          reg120 <= $unsigned((reg103[(3'h5):(2'h3)] >> $signed(((reg115 >> wire90) ?
              (reg116 > wire110) : $unsigned(reg98)))));
        end
      if ((+$signed((~$signed((wire86 <= wire110))))))
        begin
          if ({reg93})
            begin
              reg121 <= {(({(-reg103), (wire88 ? wire84 : reg97)} + {(wire91 ?
                              reg95 : reg115),
                          {reg118, (7'h42)}}) ?
                      (wire108[(2'h2):(1'h1)] ?
                          reg116[(3'h5):(3'h5)] : reg100) : reg95[(3'h5):(2'h3)])};
              reg122 <= $signed((wire85[(4'hb):(4'h9)] == (~|reg97)));
              reg123 <= (~$signed(reg101));
            end
          else
            begin
              reg121 <= $unsigned(wire107);
              reg122 <= (^~$unsigned($unsigned($unsigned(wire107))));
              reg123 <= reg98[(4'hb):(3'h7)];
              reg124 <= $signed((&(8'hb5)));
            end
        end
      else
        begin
          reg121 <= $signed($signed({(8'ha5)}));
          reg122 <= ($unsigned($signed(reg104[(3'h6):(2'h3)])) ~^ reg98);
          reg123 <= $unsigned((^(wire107[(3'h7):(2'h2)] ?
              $signed($unsigned(reg115)) : (wire106[(3'h6):(1'h1)] | {(8'hbd),
                  wire107}))));
          reg124 <= $signed((($signed(reg92) >> (-$signed((8'hbf)))) >> (8'had)));
        end
    end
  assign wire125 = (^~$signed(reg96[(3'h5):(1'h0)]));
  assign wire126 = $unsigned((^~$signed($unsigned((wire107 ?
                       reg123 : reg99)))));
  assign wire127 = (^~$unsigned(reg101));
  assign wire128 = reg104;
  assign wire129 = reg115;
  assign wire130 = (reg97[(2'h3):(2'h2)] ?
                       reg115[(5'h13):(4'hc)] : (+(-wire109[(4'hf):(3'h5)])));
endmodule

module module10
#(parameter param69 = (^~(({((8'h9c) != (8'hb0))} ? ((&(8'ha6)) != (^(8'hb0))) : ({(8'hbc), (8'had)} ? ((8'ha4) >= (8'ha9)) : (|(8'hb7)))) <= ({((8'hb5) ? (7'h44) : (8'h9d))} & ((~^(8'hb5)) >= (8'had))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire15;
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  assign y = {wire68,
                 wire63,
                 wire62,
                 wire60,
                 wire15,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire15 = (!$signed(wire11[(1'h0):(1'h0)]));
  module16 #() modinst61 (wire60, clk, wire15, wire14, wire13, wire12);
  assign wire62 = wire11;
  assign wire63 = {(-$signed(wire62)), wire14};
  always
    @(posedge clk) begin
      reg64 <= (($signed(wire14) ?
          (-($signed(wire14) <= $unsigned(wire62))) : $signed({wire13,
              $unsigned(wire13)})) >>> {wire63, wire60[(4'ha):(4'ha)]});
      reg65 <= (+$signed({($unsigned(wire11) << {wire13, wire63}),
          wire15[(3'h4):(1'h0)]}));
      reg66 <= ({wire62} ?
          ($unsigned((8'hbf)) + wire12[(5'h14):(5'h13)]) : $unsigned((($signed(wire15) ?
                  {wire62, wire63} : $unsigned(wire11)) ?
              {(wire62 ? wire15 : wire12),
                  $unsigned(wire62)} : (wire13[(2'h3):(1'h0)] ^~ wire14[(1'h0):(1'h0)]))));
      reg67 <= (~|reg64);
    end
  assign wire68 = $signed({((!wire15) ^~ wire60[(3'h6):(2'h3)])});
endmodule

module module16
#(parameter param59 = (((^~(-(~&(7'h44)))) >> (-(~((8'hb3) >>> (8'hae))))) ? ((^~((^~(8'ha5)) >>> (8'hb3))) ? {(~((7'h42) ? (8'ha8) : (8'hae)))} : ((^~(~|(8'h9e))) ? (|((8'hb8) ? (8'h9c) : (7'h42))) : (((8'haf) ? (8'ha9) : (8'hbd)) & (8'hbd)))) : ({({(8'h9f), (8'hb8)} ? (8'ha1) : ((8'h9c) ? (8'hb4) : (8'hb5))), ({(8'ha1)} - ((8'hbf) | (8'haf)))} ? {(-((8'hbf) ^~ (8'ha1))), (-(!(8'hb2)))} : ((8'hae) ? (~^((8'hba) == (8'hbf))) : {(~|(8'hb5)), (|(8'hbe))}))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire21;
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire21,
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
                 (1'h0)};
  assign wire21 = (8'h9f);
  always
    @(posedge clk) begin
      reg22 <= wire19[(1'h1):(1'h0)];
      if (reg22[(1'h1):(1'h0)])
        begin
          if (wire18)
            begin
              reg23 <= wire19;
              reg24 <= wire21[(3'h4):(2'h2)];
            end
          else
            begin
              reg23 <= (!$unsigned(wire17));
            end
        end
      else
        begin
          reg23 <= reg23;
          reg24 <= wire17;
          reg25 <= $signed((($signed((reg24 + reg24)) ?
                  ((8'h9c) ~^ (8'ha7)) : $unsigned((^(8'hb7)))) ?
              ((~^(reg22 >> wire21)) > $unsigned({wire20,
                  reg24})) : $signed((+(&reg24)))));
          reg26 <= $signed(($unsigned($unsigned(((8'hb4) + wire21))) && (^(wire18 == $signed(reg23)))));
        end
      if ((~reg25))
        begin
          reg27 <= ((-reg26) ?
              (reg26 + reg24[(2'h2):(2'h2)]) : ({wire21,
                  $unsigned($unsigned(wire17))} + (^reg22[(2'h2):(1'h1)])));
          if ($signed({{(wire19 <<< $unsigned(reg22)), reg25}}))
            begin
              reg28 <= (&wire20[(1'h1):(1'h0)]);
              reg29 <= (!$signed($unsigned((8'ha0))));
              reg30 <= (((reg23[(2'h2):(1'h1)] ?
                          ((+reg24) * (~(8'hb0))) : $signed(wire17[(3'h7):(1'h0)])) ?
                      ((reg27[(1'h1):(1'h0)] != (reg22 >= wire19)) == reg27) : (^$signed(reg27))) ?
                  (reg27[(2'h3):(2'h3)] ?
                      $signed(reg27[(2'h3):(1'h0)]) : (~&{$unsigned(reg24),
                          (~reg26)})) : wire20[(1'h1):(1'h0)]);
              reg31 <= $unsigned(($signed(wire20) < (~&$unsigned(wire20[(2'h3):(2'h3)]))));
              reg32 <= wire18;
            end
          else
            begin
              reg28 <= reg30[(4'hb):(2'h2)];
              reg29 <= (8'hae);
              reg30 <= reg28;
            end
          reg33 <= wire18[(3'h4):(2'h2)];
          if ((^~($signed((~$signed(reg28))) >> $signed($signed(wire18)))))
            begin
              reg34 <= {reg26};
              reg35 <= wire20[(2'h3):(2'h2)];
            end
          else
            begin
              reg34 <= (&((-(~$signed(reg23))) ?
                  (((reg28 + (8'ha3)) * $signed(reg28)) ?
                      $signed({reg31,
                          wire17}) : reg29) : (reg22 <= (-{reg32}))));
              reg35 <= $signed(reg27[(2'h3):(1'h0)]);
            end
        end
      else
        begin
          reg27 <= (&((((reg33 ^~ reg28) * reg31[(3'h5):(3'h5)]) != $unsigned((!reg26))) ?
              $unsigned({(reg34 != reg32)}) : reg31[(5'h11):(4'ha)]));
          reg28 <= ((~^$unsigned(wire18)) | reg31[(4'h8):(2'h2)]);
          reg29 <= $signed($signed($signed(wire21)));
          reg30 <= ((8'hb2) == reg27[(1'h1):(1'h0)]);
        end
    end
  assign wire36 = (^(^~reg28[(4'h9):(4'h8)]));
  assign wire37 = reg27[(1'h0):(1'h0)];
  assign wire38 = reg35[(1'h0):(1'h0)];
  assign wire39 = $unsigned((reg27 ?
                      (reg30[(4'h8):(3'h4)] >>> $unsigned(wire21)) : {({reg23} ^~ {reg28})}));
  always
    @(posedge clk) begin
      if (wire39[(2'h3):(2'h3)])
        begin
          reg40 <= ({($unsigned((wire19 ? reg32 : wire21)) ?
                  reg24[(4'h8):(4'h8)] : reg31[(4'he):(4'he)]),
              (reg22[(1'h0):(1'h0)] ~^ ($signed(wire17) == reg29))} * ((reg32[(2'h2):(1'h1)] < (^~wire37)) * {(7'h43)}));
          if ($signed((wire20 ?
              (((wire37 + reg35) ? $unsigned(wire19) : reg25[(3'h5):(2'h2)]) ?
                  wire19 : (8'hac)) : (~$signed(((8'hac) - wire21))))))
            begin
              reg41 <= $signed(wire21[(3'h5):(3'h5)]);
            end
          else
            begin
              reg41 <= ((7'h44) >= $unsigned($unsigned(reg33)));
              reg42 <= (wire37 || $unsigned($signed($signed($signed(wire38)))));
              reg43 <= ({(wire17 <<< $signed((~&wire38)))} | (8'hb3));
            end
          if ((^$signed(wire20[(2'h3):(1'h0)])))
            begin
              reg44 <= wire20[(2'h2):(1'h1)];
            end
          else
            begin
              reg44 <= $signed(({$signed($signed(reg32)),
                      ({reg33, reg28} ? (!reg29) : $unsigned(reg41))} ?
                  (((reg44 ? reg42 : reg27) ?
                      {reg24} : reg34) > {$signed(reg23)}) : reg29[(4'h9):(1'h0)]));
              reg45 <= $unsigned($signed(((8'hb2) ?
                  $unsigned((reg23 ? reg43 : wire36)) : (^~wire19))));
            end
        end
      else
        begin
          reg40 <= ((reg27[(2'h3):(1'h1)] >>> (reg45[(4'ha):(3'h4)] ?
                  {wire18[(1'h0):(1'h0)]} : $signed({wire18}))) ?
              $unsigned($unsigned((^~(+(7'h40))))) : reg24[(2'h2):(1'h1)]);
          reg41 <= ((+{wire19}) ?
              wire39[(3'h5):(2'h3)] : (~&reg33[(1'h1):(1'h1)]));
          reg42 <= $unsigned((-$signed(((reg33 ?
              reg35 : reg23) & $unsigned(wire18)))));
          if (({(~&$unsigned(reg41))} ^~ (reg41 >> (~|reg27[(2'h3):(1'h1)]))))
            begin
              reg43 <= (+{(($signed((7'h40)) ?
                      $signed((8'hbb)) : (-reg43)) >= (+reg32)),
                  $signed(((reg35 ? wire39 : reg41) >= (reg23 ?
                      wire21 : reg27)))});
            end
          else
            begin
              reg43 <= (^$unsigned({(+(wire37 && reg24)),
                  reg28[(4'hf):(4'hd)]}));
              reg44 <= ((&(-$signed((wire20 == reg35)))) ?
                  reg43 : ($signed($signed((wire19 & wire38))) != ((-$signed(wire38)) >> {reg35[(2'h2):(1'h0)],
                      ((8'hb6) ? wire19 : (8'hbf))})));
              reg45 <= (^(|$unsigned(((reg42 ? reg23 : reg22) ?
                  ((7'h40) <<< reg30) : (wire36 ? reg33 : (8'ha1))))));
              reg46 <= $unsigned({reg31,
                  {$signed(((8'hb1) ? (8'ha8) : reg24))}});
            end
          reg47 <= ((($signed((wire20 >= reg31)) ?
                  ($signed(wire17) == reg46[(4'h8):(3'h7)]) : ((^~reg24) ?
                      $signed(reg26) : reg42)) ~^ $signed(((+(8'hb1)) && (wire36 < reg34)))) ?
              reg32[(2'h2):(2'h2)] : wire36[(3'h6):(2'h2)]);
        end
      reg48 <= wire18;
      reg49 <= reg26[(1'h1):(1'h1)];
      reg50 <= reg28;
    end
  assign wire51 = {((reg46[(4'h8):(2'h2)] + reg32) <<< $signed(wire36[(2'h3):(2'h3)]))};
  assign wire52 = reg32[(1'h0):(1'h0)];
  assign wire53 = wire19[(2'h3):(2'h3)];
  assign wire54 = wire39;
  assign wire55 = ((({$unsigned((8'ha8))} - $signed((reg32 <= reg24))) >= reg34) ?
                      (~^reg33[(3'h6):(1'h0)]) : $unsigned({$signed(reg26[(2'h2):(1'h0)]),
                          reg23}));
  assign wire56 = (($unsigned({{wire38, wire36}}) * $unsigned((wire19 ?
                      wire21[(3'h5):(1'h0)] : reg29))) < $signed((reg22[(2'h3):(2'h3)] - (!((7'h43) != reg26)))));
  assign wire57 = wire54[(3'h6):(3'h6)];
  assign wire58 = $signed($signed((~&$signed(((8'ha3) ? reg23 : reg23)))));
endmodule
