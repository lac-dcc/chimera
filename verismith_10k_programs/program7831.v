module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire150;
  wire signed [(5'h10):(1'h0)] wire149;
  wire [(4'ha):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire145;
  wire [(4'hd):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire81;
  reg signed [(5'h13):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire84,
                 wire83,
                 wire81,
                 reg4,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((8'hb1) ?
          ($unsigned($signed(wire3)) == ((+wire3) <<< wire0)) : $signed(wire3));
    end
  always
    @(posedge clk) begin
      reg5 <= $signed((wire0 ?
          (wire2 ?
              $unsigned((reg4 >> reg4)) : wire0) : $signed(wire1[(3'h6):(2'h2)])));
    end
  module6 #() modinst82 (.wire10(wire0), .wire7(reg5), .y(wire81), .clk(clk), .wire11(wire1), .wire9(reg4), .wire8(wire3));
  assign wire83 = wire0[(5'h14):(5'h12)];
  assign wire84 = (wire81 != wire1[(4'h9):(2'h3)]);
  module85 #() modinst146 (.clk(clk), .wire90(wire0), .wire88(wire84), .wire86(reg4), .wire89(wire2), .wire87(wire81), .y(wire145));
  assign wire147 = ({$signed(wire2[(3'h7):(1'h0)])} ?
                       {$unsigned((((8'haf) ?
                               (8'hbf) : wire2) >= wire3))} : $unsigned(wire2));
  assign wire148 = (wire81[(5'h11):(3'h7)] ~^ wire3[(2'h2):(1'h0)]);
  assign wire149 = wire147[(2'h2):(1'h0)];
  assign wire150 = wire148;
endmodule

module module85  (y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h24a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire90;
  input wire [(5'h11):(1'h0)] wire89;
  input wire signed [(4'hc):(1'h0)] wire88;
  input wire signed [(4'hf):(1'h0)] wire87;
  input wire signed [(4'hc):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire144;
  wire [(3'h7):(1'h0)] wire143;
  wire [(4'ha):(1'h0)] wire142;
  wire [(4'h8):(1'h0)] wire131;
  wire signed [(3'h5):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire91;
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(3'h6):(1'h0)] reg140 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire131,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire92,
                 wire91,
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
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
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
                 (1'h0)};
  assign wire91 = wire90;
  assign wire92 = wire88;
  always
    @(posedge clk) begin
      if ($unsigned(wire87))
        begin
          reg93 <= (~wire89[(5'h11):(4'h8)]);
        end
      else
        begin
          reg93 <= $unsigned($unsigned(((wire90[(1'h1):(1'h1)] ?
                  ((8'hb0) ? wire91 : wire92) : $signed(wire90)) ?
              wire89[(3'h5):(3'h5)] : wire88[(4'hb):(4'ha)])));
          reg94 <= ((8'hbe) ?
              $unsigned($signed((8'ha7))) : $unsigned($unsigned(((!reg93) - (reg93 >>> wire88)))));
          reg95 <= ({{wire90, $signed((^wire89))}} ?
              wire87 : $unsigned(((-$signed((8'ha6))) ?
                  ($unsigned(wire86) | (8'hb3)) : $signed((wire89 << wire87)))));
        end
      reg96 <= (reg94[(1'h0):(1'h0)] ?
          $signed(($unsigned({wire91}) ?
              (8'hb8) : reg95[(1'h1):(1'h0)])) : (($signed((reg95 <<< wire89)) ~^ $signed($signed(wire86))) ?
              (&$signed((wire90 ? reg94 : reg95))) : (((wire89 ?
                          wire87 : wire87) ?
                      wire90 : (+(8'ha9))) ?
                  $unsigned($unsigned(wire89)) : {$signed(wire89)})));
      if (wire92[(4'hd):(3'h7)])
        begin
          if ({(8'hbd)})
            begin
              reg97 <= ({(|(((8'hbe) ? wire86 : reg96) ?
                          (wire86 ? wire86 : reg95) : wire86[(1'h0):(1'h0)]))} ?
                  $signed((8'ha0)) : wire90);
              reg98 <= (!wire87);
              reg99 <= ((reg95 ?
                      $signed($unsigned((wire91 ? wire92 : reg94))) : (8'hbc)) ?
                  wire92[(4'he):(4'he)] : $signed((reg95 ?
                      $signed((wire90 <= wire92)) : wire89[(4'hf):(3'h5)])));
              reg100 <= wire88;
            end
          else
            begin
              reg97 <= wire87;
            end
          reg101 <= wire91[(5'h10):(4'hf)];
          reg102 <= wire92;
        end
      else
        begin
          reg97 <= reg97;
          reg98 <= (($unsigned($signed((^~wire87))) ?
              $unsigned(((+wire89) ?
                  wire92 : $unsigned(reg100))) : (+(+(wire88 ^~ (8'ha2))))) >>> $unsigned({$unsigned(wire88)}));
        end
      reg103 <= ({$signed(reg94[(1'h1):(1'h0)]),
          $signed({(reg96 ^~ reg96)})} ~^ reg100);
      reg104 <= reg99[(3'h6):(2'h3)];
    end
  assign wire105 = (reg101 ?
                       ((+$signed((wire91 ? reg96 : reg98))) ?
                           ((+(&reg98)) ?
                               (-reg98) : (~|reg101[(3'h6):(3'h5)])) : {reg103}) : (~wire92));
  assign wire106 = (-{({wire91[(1'h1):(1'h1)], wire92} ?
                           (((8'hbc) <= reg103) >= ((8'hb2) & wire90)) : $unsigned(wire89))});
  assign wire107 = $signed((({{wire90}} >> wire87) ?
                       reg93[(2'h2):(2'h2)] : (&(reg99 ?
                           (wire91 < reg103) : $signed(reg93)))));
  assign wire108 = $signed($signed(($unsigned((!(8'hb3))) ?
                       reg98[(3'h4):(2'h3)] : wire89[(4'hc):(4'ha)])));
  always
    @(posedge clk) begin
      reg109 <= ($signed((^~{reg102[(3'h6):(1'h0)]})) + (^~$unsigned($signed((reg98 ?
          (8'ha6) : reg95)))));
      reg110 <= ($unsigned((^~(+$signed(wire108)))) >= $unsigned(reg102[(4'hb):(1'h0)]));
      if ($signed($signed((($signed(wire91) >>> (wire88 > wire90)) ^ ($unsigned(reg101) <<< (wire106 ?
          reg99 : (7'h40)))))))
        begin
          if ({{{(|((8'h9f) < reg99)), ($signed(wire90) << reg110)}},
              wire105[(1'h1):(1'h1)]})
            begin
              reg111 <= (((^~wire106) + wire108) ?
                  (|(|(8'hb7))) : ({reg94, {$signed(wire92)}} ?
                      wire105 : $unsigned(($unsigned((8'ha9)) ?
                          reg99[(1'h1):(1'h1)] : wire105[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg111 <= (^(($unsigned(reg103) & $unsigned(reg111)) >= ({(!(8'hba))} >>> reg109)));
            end
          reg112 <= {$unsigned({((wire88 ? reg97 : reg99) ?
                      wire89[(2'h2):(2'h2)] : {wire87, (8'hb3)})}),
              ({(wire91 <<< (wire90 ? reg104 : reg109))} ?
                  (+{$unsigned(reg99)}) : ((~^$signed(reg109)) != $signed($signed(wire87))))};
        end
      else
        begin
          if ({$unsigned({$unsigned($unsigned(reg95)),
                  (^~(reg97 ? wire88 : reg97))}),
              $signed($signed(({reg102} ?
                  reg102[(4'h9):(2'h3)] : wire105[(1'h0):(1'h0)])))})
            begin
              reg111 <= wire89;
              reg112 <= (+(reg100 ?
                  (wire86 + ((~|reg109) + (8'ha8))) : reg93[(3'h7):(3'h7)]));
              reg113 <= wire87[(4'h8):(1'h0)];
              reg114 <= {reg100, $signed(reg112[(4'ha):(3'h7)])};
              reg115 <= (^~(reg104 ?
                  (+$unsigned(((8'ha4) + (8'hbd)))) : $signed($unsigned((reg93 ?
                      reg109 : reg114)))));
            end
          else
            begin
              reg111 <= wire108;
              reg112 <= reg113[(4'h8):(2'h2)];
              reg113 <= $signed(reg102[(2'h2):(2'h2)]);
              reg114 <= $signed(((!(reg114 ?
                  (~|wire90) : (reg110 != reg98))) || wire106));
              reg115 <= (-(((wire92[(4'hc):(4'ha)] ~^ wire87[(4'hc):(1'h1)]) != (&$signed(reg100))) | $unsigned({reg97[(4'h9):(3'h6)]})));
            end
          reg116 <= (reg104 == wire86[(3'h6):(2'h2)]);
          reg117 <= reg104;
          reg118 <= $unsigned((~|($unsigned(reg93[(3'h5):(2'h2)]) - (~|(reg103 >> reg101)))));
          reg119 <= (^~reg95[(3'h4):(3'h4)]);
        end
    end
  assign wire120 = (reg95[(3'h4):(2'h3)] ?
                       (reg95 ?
                           $signed({(-reg104)}) : reg94[(3'h5):(1'h0)]) : (reg115 ?
                           (^~(8'haf)) : (($unsigned(reg97) > reg117[(3'h4):(1'h0)]) ?
                               {reg115[(2'h2):(1'h0)]} : (reg115[(2'h3):(1'h0)] + $signed(wire92)))));
  assign wire121 = reg110;
  assign wire122 = reg98;
  assign wire123 = ({wire92} >= reg104);
  assign wire124 = (($unsigned((^~(wire91 ? wire121 : reg102))) ?
                       (+wire88[(3'h4):(3'h4)]) : wire86) != ((!wire123[(4'ha):(4'h8)]) ?
                       reg100 : $signed($signed((reg119 | (8'ha3))))));
  assign wire125 = (~|$signed(({reg116[(4'he):(1'h1)],
                       (+wire90)} >>> ((reg116 != reg93) + (^~wire105)))));
  assign wire126 = $signed(reg115[(4'hb):(1'h0)]);
  always
    @(posedge clk) begin
      reg127 <= $signed(((reg110[(1'h1):(1'h1)] <= (|(+wire124))) ?
          (^~(|((8'ha6) == wire126))) : (8'hab)));
      reg128 <= $unsigned((^wire126[(3'h4):(1'h1)]));
      reg129 <= ((reg103 * wire107[(4'h8):(1'h0)]) == ({((+reg99) ?
                  (wire92 ? reg119 : wire121) : $signed(reg118))} ?
          reg97[(2'h3):(2'h2)] : (|$signed((reg115 ~^ reg116)))));
      reg130 <= reg100;
    end
  assign wire131 = $signed($unsigned(reg113[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ((^({$unsigned((reg95 ? reg93 : reg94)), $signed(wire131)} ?
          ($signed(reg93[(4'hb):(4'hb)]) ?
              reg99 : (~|(reg127 >>> reg116))) : reg94[(2'h3):(2'h2)])))
        begin
          if ($signed($unsigned($signed(wire123))))
            begin
              reg132 <= $unsigned(reg100[(3'h4):(1'h0)]);
              reg133 <= $unsigned(((($signed(reg116) ?
                      (-(8'ha3)) : reg128[(3'h6):(2'h3)]) ?
                  wire123[(4'hd):(1'h0)] : (reg100[(2'h3):(2'h3)] >>> (-reg103))) - reg116[(4'he):(2'h3)]));
              reg134 <= wire125[(2'h3):(1'h1)];
              reg135 <= (&($signed((~{wire126})) <= reg109[(4'hc):(3'h6)]));
            end
          else
            begin
              reg132 <= (&(wire108[(4'ha):(3'h7)] > $signed((wire122 ?
                  $unsigned((8'hb4)) : wire123))));
              reg133 <= (&reg133[(3'h5):(1'h1)]);
              reg134 <= $unsigned(reg119[(4'ha):(3'h6)]);
              reg135 <= $signed(({reg116} ?
                  $signed((reg113[(4'h9):(3'h6)] ?
                      $signed(reg130) : $unsigned(reg111))) : ((~^(reg100 ?
                      wire121 : reg98)) < ((reg119 ? wire90 : wire105) ?
                      $signed(reg127) : {wire87}))));
              reg136 <= $signed(reg115[(3'h4):(3'h4)]);
            end
        end
      else
        begin
          reg132 <= $signed($unsigned((~^(|(8'h9c)))));
          reg133 <= wire120;
          reg134 <= (~{($signed((&(8'h9c))) != ($signed(wire107) != $signed(wire122)))});
          if ((($signed(((^~reg135) ? wire122 : {reg94})) ?
                  wire120[(2'h2):(1'h0)] : $unsigned(reg134)) ?
              ((((8'ha0) ~^ reg93[(4'hd):(2'h3)]) ^ $signed(reg109)) ?
                  (($signed(reg94) && reg119[(4'he):(4'hb)]) ?
                      reg118 : $unsigned($unsigned(reg97))) : {(8'hb1)}) : reg133[(1'h1):(1'h0)]))
            begin
              reg135 <= $unsigned($signed((^$unsigned({wire126, reg114}))));
              reg136 <= (^(+$signed(($unsigned((8'had)) ?
                  (~|(8'haa)) : (+reg111)))));
            end
          else
            begin
              reg135 <= wire124[(3'h7):(1'h0)];
              reg136 <= {({reg132,
                      ($unsigned(reg118) ?
                          $signed(wire123) : ((8'ha0) <= reg133))} == (-$signed($unsigned(wire124)))),
                  (((wire88 ?
                      ((8'hbb) & reg95) : (reg134 ?
                          reg113 : wire108)) ~^ reg112[(4'hb):(4'ha)]) ^ reg134)};
            end
          reg137 <= wire120;
        end
      reg138 <= $unsigned(($signed(reg103) == reg116));
      reg139 <= (($signed((&$signed(reg109))) ?
          reg128 : (~|$unsigned((^~wire88)))) & (~|($signed((^~(8'ha6))) == (wire123[(5'h11):(1'h1)] ?
          $unsigned(wire124) : $signed(reg98)))));
      reg140 <= reg93[(2'h2):(1'h0)];
      reg141 <= reg114;
    end
  assign wire142 = ($unsigned({wire124}) | (^reg97));
  assign wire143 = reg98;
  assign wire144 = reg135;
endmodule

module module6
#(parameter param79 = {((&(^~((8'hac) ? (8'had) : (7'h44)))) ? ((!(-(7'h40))) ~^ (((7'h43) ? (8'ha1) : (8'h9f)) ? (^~(8'hba)) : (!(8'ha2)))) : ((((8'hb0) ? (7'h42) : (8'ha3)) <<< ((8'hb7) ? (8'hb0) : (8'hb1))) ? ({(8'ha5), (8'ha6)} >>> {(8'ha6)}) : {(^~(8'ha8)), ((8'h9f) == (8'ha2))}))}, 
parameter param80 = (((~|((param79 || param79) ~^ (|(8'hbf)))) != ((param79 ? param79 : param79) || (~|(^~param79)))) ? (~|param79) : ((((param79 && param79) ? ((8'hb3) >> (8'hbb)) : param79) ? ((8'hb9) > (param79 ? (8'h9d) : param79)) : (8'hac)) ? (!(&(param79 != param79))) : {{{param79}, param79}, ({(8'hbc)} ? {param79} : (param79 * param79))})))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire77;
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  assign y = {wire40, wire42, wire43, wire77, reg44, reg45, (1'h0)};
  module12 #() modinst41 (.wire14(wire8), .wire16(wire9), .clk(clk), .y(wire40), .wire15(wire11), .wire13(wire7));
  assign wire42 = wire9;
  assign wire43 = $unsigned(wire11);
  always
    @(posedge clk) begin
      reg44 <= (&wire11[(2'h2):(2'h2)]);
      reg45 <= (+wire7[(5'h12):(2'h3)]);
    end
  module46 #() modinst78 (.wire47(reg45), .wire49(wire11), .wire50(wire9), .clk(clk), .y(wire77), .wire48(wire10));
endmodule

module module46
#(parameter param76 = (|(~&(((^~(7'h41)) ? (~^(8'hbc)) : {(7'h44), (8'ha4)}) ^~ ((~(8'ha5)) ? ((8'hbe) & (8'h9e)) : (~&(8'hac)))))))
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire50;
  input wire [(3'h5):(1'h0)] wire49;
  input wire [(5'h13):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire51 = wire50;
  assign wire52 = (($signed(wire50[(2'h2):(1'h1)]) ?
                      $signed($signed(((8'ha8) ? wire48 : wire48))) : ((8'hbb) ?
                          wire50 : wire49[(1'h0):(1'h0)])) | ((8'ha7) ?
                      (((+wire50) ?
                          wire51[(5'h13):(5'h13)] : (wire51 ?
                              wire49 : wire50)) != $unsigned(wire49[(1'h0):(1'h0)])) : ((+$unsigned(wire50)) ?
                          wire48 : wire51[(4'h9):(3'h5)])));
  assign wire53 = $unsigned(((^$signed({wire52, wire47})) & (8'hb1)));
  assign wire54 = $signed(wire53[(2'h3):(1'h1)]);
  assign wire55 = $signed(wire50);
  always
    @(posedge clk) begin
      reg56 <= wire52;
      if ($signed((($unsigned((wire48 ? wire48 : wire48)) ?
              ($unsigned((8'hbb)) != {(8'hbb),
                  (8'ha4)}) : ((8'ha5) != wire52[(3'h4):(2'h3)])) ?
          $signed($unsigned((wire53 && wire54))) : ($unsigned((wire54 & wire47)) ?
              ((wire51 >= wire49) ?
                  (+(8'had)) : (+wire51)) : $signed(wire54[(1'h1):(1'h1)])))))
        begin
          if (wire47)
            begin
              reg57 <= {(wire49[(1'h1):(1'h0)] <<< ($unsigned($unsigned(wire55)) >= $signed($unsigned(reg56))))};
              reg58 <= ($signed($unsigned((wire54[(2'h3):(1'h1)] + wire48))) ?
                  (~&reg57[(4'h8):(1'h1)]) : (~|($signed(reg57[(5'h11):(2'h2)]) ?
                      reg57 : (+$unsigned((7'h42))))));
              reg59 <= reg57;
              reg60 <= $signed((~|(+$signed($signed(wire53)))));
              reg61 <= $signed((~&$unsigned(wire48[(4'hc):(4'h9)])));
            end
          else
            begin
              reg57 <= $unsigned(reg59[(4'h8):(4'h8)]);
              reg58 <= {(^($unsigned($signed(reg61)) || (~(reg57 << wire51))))};
            end
        end
      else
        begin
          reg57 <= reg60[(4'ha):(3'h5)];
        end
      reg62 <= (reg56[(2'h3):(1'h1)] ?
          (~|(~|(wire51[(5'h10):(4'he)] ^~ (wire47 == wire47)))) : (($signed(wire49) && $unsigned({wire49,
              reg61})) * $unsigned({wire53[(3'h4):(1'h1)],
              (reg56 ? wire53 : (8'had))})));
    end
  always
    @(posedge clk) begin
      reg63 <= (~^((!((reg57 ?
          reg57 : reg60) - (wire47 || wire50))) & reg61[(4'ha):(3'h5)]));
      if ($signed(((~^reg63) ? reg59 : {$unsigned(wire49[(2'h2):(1'h1)])})))
        begin
          reg64 <= {(^$signed(reg62[(4'h9):(2'h3)])), (8'hbe)};
          reg65 <= $signed(wire55[(5'h10):(3'h4)]);
          reg66 <= ((reg56[(4'hd):(2'h2)] ^~ wire50[(1'h1):(1'h1)]) ?
              ((((wire51 ^ wire50) & (reg57 ?
                      wire49 : wire47)) ^ reg58[(1'h0):(1'h0)]) ?
                  reg61 : (^~({wire54,
                      reg56} >>> (reg59 ^ reg65)))) : $unsigned($unsigned(reg60[(4'ha):(4'ha)])));
          reg67 <= $unsigned(($unsigned($unsigned(reg63[(3'h7):(3'h4)])) - (~^(8'ha5))));
          reg68 <= reg67[(3'h7):(2'h3)];
        end
      else
        begin
          reg64 <= $unsigned({$unsigned($unsigned(wire53)), $signed((8'hbb))});
        end
      reg69 <= reg64;
      reg70 <= wire51[(3'h5):(3'h4)];
      reg71 <= reg61;
    end
  assign wire72 = (({wire51[(4'ha):(3'h7)],
                          {(reg61 ? (8'ha2) : reg57), wire55}} ?
                      (~|$unsigned(reg66[(3'h6):(3'h6)])) : (~{$unsigned(reg59),
                          reg64})) && reg68);
  assign wire73 = (wire52[(4'ha):(4'ha)] && reg67);
  assign wire74 = wire51[(5'h11):(4'hb)];
  assign wire75 = wire55;
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire17;
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  assign y = {wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire21,
                 wire19,
                 wire18,
                 wire17,
                 reg38,
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
                 reg20,
                 (1'h0)};
  assign wire17 = (wire14[(3'h5):(3'h4)] ? (&wire15) : wire14);
  assign wire18 = (^~{$unsigned($signed(((8'hae) ? wire13 : wire15)))});
  assign wire19 = (wire15[(4'hc):(4'hc)] ?
                      ((wire18[(4'ha):(4'h9)] ?
                              wire18 : ((8'ha7) + (wire18 ?
                                  (8'ha3) : wire13))) ?
                          $signed((((8'haa) ? wire13 : (8'h9c)) != (wire13 ?
                              (7'h42) : (8'h9c)))) : wire14[(4'h9):(3'h4)]) : (wire17[(2'h2):(1'h1)] * (((wire18 > wire16) ?
                              wire16 : wire13) ?
                          $unsigned($signed(wire17)) : $unsigned((wire15 ?
                              wire13 : wire13)))));
  always
    @(posedge clk) begin
      reg20 <= $signed(($signed((^~$signed(wire17))) ?
          (+(^~wire19)) : ($signed(wire14[(5'h11):(4'hf)]) ?
              ($signed(wire18) && (wire17 >= wire16)) : $signed((~&wire18)))));
    end
  assign wire21 = $unsigned({$signed((~&$signed(wire18))),
                      (&$signed($signed(wire19)))});
  always
    @(posedge clk) begin
      reg22 <= (|(wire17 ?
          ((^wire15[(4'hc):(2'h2)]) ?
              ({wire15, wire16} >> {wire14,
                  wire17}) : ((+wire16) && $signed(wire21))) : wire19));
      if (wire18[(4'he):(4'hd)])
        begin
          reg23 <= ($signed((wire13 >>> {(reg20 ?
                  wire13 : reg22)})) ^ wire15[(3'h6):(2'h3)]);
          reg24 <= $unsigned(wire19);
          reg25 <= wire21[(4'h8):(2'h3)];
          if (wire18)
            begin
              reg26 <= (wire17[(1'h0):(1'h0)] ^ $unsigned(reg22[(2'h2):(1'h1)]));
              reg27 <= (~&$unsigned(({reg24, reg24[(1'h0):(1'h0)]} ?
                  (~^wire18) : $signed((reg24 == wire13)))));
              reg28 <= wire18[(3'h4):(1'h0)];
              reg29 <= $unsigned(reg25[(2'h3):(1'h0)]);
            end
          else
            begin
              reg26 <= reg25;
            end
        end
      else
        begin
          reg23 <= $unsigned(wire15[(3'h5):(1'h0)]);
          if (wire17[(1'h1):(1'h0)])
            begin
              reg24 <= $unsigned((^~((~^wire18[(1'h0):(1'h0)]) ?
                  (!{wire14, reg24}) : $unsigned((wire21 > wire18)))));
              reg25 <= (+(~^reg26[(3'h4):(1'h0)]));
            end
          else
            begin
              reg24 <= (($unsigned(((^~reg27) << $signed(reg29))) + (~$signed($signed(wire15)))) ?
                  wire18[(4'h9):(3'h5)] : reg22);
              reg25 <= {((wire16[(2'h2):(1'h1)] == ({wire21,
                      wire13} * $unsigned(wire19))) <<< wire18[(3'h4):(2'h3)]),
                  (reg25 ?
                      $signed(((~reg27) >> (reg24 ?
                          wire15 : (8'ha7)))) : ({(~|wire19),
                              $unsigned(reg24)} ?
                          $signed($unsigned(reg28)) : (~&$unsigned((8'hb6)))))};
            end
        end
      reg30 <= {wire14[(1'h0):(1'h0)]};
      reg31 <= ({$unsigned(wire17), (8'hb8)} >>> (((8'ha1) ?
          (^(8'ha4)) : $unsigned(reg25[(4'hf):(4'ha)])) == $unsigned($unsigned((wire17 ^~ (8'hb1))))));
      if (wire15)
        begin
          reg32 <= (wire18[(5'h14):(1'h1)] ?
              $signed($signed({$signed(wire19),
                  (-(8'had))})) : (reg31 - reg20));
        end
      else
        begin
          reg32 <= (^{(7'h42)});
        end
    end
  assign wire33 = (~&reg26[(2'h2):(1'h0)]);
  assign wire34 = (reg20 ?
                      $unsigned((+$signed(wire18))) : reg32[(4'h9):(3'h6)]);
  assign wire35 = reg29[(4'hc):(3'h4)];
  assign wire36 = $signed((((!$signed(reg25)) == (reg23 ?
                          $signed(wire15) : $signed(reg32))) ?
                      $unsigned(wire15[(4'he):(4'hd)]) : reg25[(4'hc):(3'h4)]));
  assign wire37 = {($signed((+$signed(reg20))) ?
                          (^~(+wire16[(1'h1):(1'h0)])) : ($signed(reg31[(2'h2):(2'h2)]) ?
                              reg25[(4'he):(3'h6)] : (!(~(8'hb9)))))};
  always
    @(posedge clk) begin
      reg38 <= {$unsigned($signed(wire19[(1'h0):(1'h0)])), (|$signed(wire17))};
    end
  assign wire39 = ((7'h44) ?
                      (({$unsigned(reg30)} ?
                              wire34[(4'h8):(1'h0)] : $signed((-reg20))) ?
                          (wire15 ?
                              ((wire17 ? wire34 : reg20) | {wire21,
                                  reg24}) : wire36) : (-$unsigned(((8'haa) ?
                              reg26 : (8'hb3))))) : reg27[(2'h2):(2'h2)]);
endmodule
