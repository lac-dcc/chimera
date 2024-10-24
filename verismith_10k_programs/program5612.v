module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire150;
  wire [(3'h5):(1'h0)] wire148;
  wire [(4'hd):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire148,
                 wire4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire4 = (wire1[(1'h1):(1'h0)] & $unsigned({$signed(wire0[(3'h6):(3'h5)])}));
  always
    @(posedge clk) begin
      reg5 <= (~wire3);
      reg6 <= $signed((((!$signed(reg5)) >= (^~wire4[(3'h6):(3'h4)])) ?
          wire3 : ((8'ha0) ? wire3 : $signed((wire4 <<< wire0)))));
      reg7 <= $unsigned((wire1[(1'h0):(1'h0)] ~^ ($signed(wire1) ?
          (&wire1) : wire3)));
      reg8 <= $signed(($unsigned((&(wire3 ^ wire2))) | ((reg5[(2'h2):(2'h2)] ?
              (wire2 | wire3) : ((8'hae) ~^ wire1)) ?
          $signed($signed(wire4)) : $unsigned(reg6[(2'h2):(1'h0)]))));
    end
  module9 #() modinst149 (.wire13(wire1), .wire12(reg6), .y(wire148), .wire10(reg5), .wire11(wire0), .clk(clk), .wire14(reg8));
  assign wire150 = $signed(((wire0[(5'h10):(4'he)] ^ reg8) != $unsigned($unsigned((wire4 ?
                       reg5 : reg5)))));
  assign wire151 = ($unsigned($signed($unsigned((wire1 ?
                       (8'ha3) : wire148)))) * ($signed((wire148 ?
                       $signed(wire148) : wire148[(1'h0):(1'h0)])) < reg8));
  assign wire152 = {(wire0 ?
                           wire3 : $unsigned(((wire2 ? wire2 : wire2) ?
                               reg6[(4'hf):(1'h0)] : {wire148, reg8})))};
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h282):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire147;
  wire signed [(4'hc):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire132;
  wire signed [(4'he):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg [(4'hd):(1'h0)] reg145 = (1'h0);
  reg [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  assign y = {wire147,
                 wire134,
                 wire132,
                 wire92,
                 wire66,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire21,
                 wire16,
                 wire15,
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
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 reg55,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire15 = wire11[(5'h12):(5'h12)];
  assign wire16 = {wire12[(5'h10):(5'h10)], $signed((~wire14))};
  always
    @(posedge clk) begin
      reg17 <= wire10;
      reg18 <= wire13[(2'h2):(1'h1)];
      reg19 <= ($unsigned($unsigned((|$unsigned(wire14)))) < ($unsigned((8'ha9)) ?
          {$unsigned(wire13[(3'h4):(2'h2)])} : wire14));
      reg20 <= ((8'hb3) >>> $unsigned(reg17));
    end
  assign wire21 = (wire12 ?
                      (~^wire11) : {$signed((^(+wire14))),
                          wire12[(4'ha):(4'ha)]});
  module22 #() modinst50 (wire49, clk, reg20, wire16, reg18, wire15);
  assign wire51 = {(($signed({reg17}) >= wire12[(4'he):(1'h0)]) >= (^(^{wire15}))),
                      ($signed(wire14) << $signed((wire13 ?
                          $unsigned(wire11) : (reg20 ? wire15 : wire49))))};
  assign wire52 = ({wire49[(3'h4):(2'h2)]} * $signed($unsigned((8'ha5))));
  assign wire53 = (reg17[(4'h8):(1'h0)] ?
                      (~^wire10[(4'h9):(4'h8)]) : {((~&$signed(wire14)) ?
                              ($unsigned(reg17) <= wire13[(2'h2):(1'h1)]) : (reg20[(1'h1):(1'h0)] <<< {reg17}))});
  assign wire54 = reg20[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg55 <= wire12;
      reg56 <= (^($unsigned($signed((~&wire11))) < $signed(($unsigned(wire12) < wire13))));
    end
  always
    @(posedge clk) begin
      reg57 <= $unsigned({({$signed(reg20)} ?
              $unsigned($unsigned((8'ha3))) : (((8'ha3) ? reg55 : wire10) ?
                  wire13 : (reg55 ? reg17 : wire13))),
          $unsigned(((wire53 - (8'hbf)) ?
              (wire10 ? wire52 : wire52) : {wire52, wire11}))});
      reg58 <= ((reg55 >= ($unsigned((|wire51)) >= $unsigned(wire11))) >= ((^(wire15[(3'h4):(3'h4)] ?
          (reg17 || (8'haa)) : reg18)) ^ (^((wire12 + wire11) << (wire49 && wire12)))));
      reg59 <= reg20;
      if ($unsigned((^reg58[(4'h8):(3'h6)])))
        begin
          reg60 <= ((wire51 < $unsigned($unsigned((reg55 ?
              reg18 : (8'hb9))))) != reg57[(4'ha):(2'h3)]);
          if (wire53[(2'h2):(1'h1)])
            begin
              reg61 <= $unsigned(reg56);
              reg62 <= ((wire15[(4'h8):(3'h6)] ?
                  (((|wire52) ? wire15 : wire54) ?
                      ($signed(reg58) ?
                          $unsigned(reg61) : wire11[(4'hc):(3'h4)]) : (^~reg55[(1'h0):(1'h0)])) : (!(reg20 ?
                      (~^wire51) : (~^(8'ha7))))) <<< $unsigned((&reg20)));
              reg63 <= (({wire10[(4'ha):(4'ha)]} ?
                      reg58 : ($signed((|wire16)) ?
                          (wire10[(2'h3):(2'h2)] != ((8'hbf) <<< wire21)) : wire12)) ?
                  (((-(8'had)) <= $signed((reg62 ~^ reg61))) && $signed({(8'h9d),
                      {(7'h41)}})) : reg57);
              reg64 <= (8'h9d);
            end
          else
            begin
              reg61 <= ((|$unsigned($signed(reg60[(4'ha):(3'h4)]))) ~^ (reg59 ?
                  {(reg20[(3'h5):(3'h5)] == reg62[(1'h1):(1'h1)]),
                      (wire16[(3'h4):(1'h0)] << (reg58 ^~ reg58))} : $unsigned($unsigned(wire54))));
              reg62 <= $signed({($signed((wire49 << (7'h43))) ?
                      ((wire51 ?
                          reg55 : (8'ha0)) == {(8'h9d)}) : $signed(wire10)),
                  (!$signed((~^wire11)))});
            end
          reg65 <= ($unsigned((reg62[(1'h1):(1'h1)] ?
                  reg55[(2'h3):(2'h2)] : ((&(8'ha6)) ?
                      wire14[(3'h4):(2'h2)] : (reg60 <<< wire52)))) ?
              (($unsigned($signed(wire53)) ?
                  {{reg61}} : $unsigned((+(8'had)))) != ($signed((reg58 ?
                  reg58 : (8'hbf))) >>> $signed(((8'ha5) | reg18)))) : (wire21[(4'he):(3'h6)] ?
                  reg17 : (wire52 + {(^~(8'ha2))})));
        end
      else
        begin
          reg60 <= wire12[(3'h6):(2'h2)];
          reg61 <= (reg58[(3'h5):(2'h3)] == (reg55 ? reg64 : (8'ha1)));
        end
    end
  assign wire66 = wire52[(3'h4):(1'h0)];
  module67 #() modinst93 (.clk(clk), .wire68(wire16), .y(wire92), .wire71(reg61), .wire69(reg60), .wire70(wire49));
  always
    @(posedge clk) begin
      reg94 <= (reg65 ~^ wire15[(3'h6):(3'h6)]);
      if ((&(~(7'h41))))
        begin
          reg95 <= reg18[(3'h5):(2'h2)];
          reg96 <= reg60;
          reg97 <= $unsigned({$signed((reg55[(2'h2):(1'h0)] ?
                  wire54[(3'h7):(2'h3)] : $signed((8'hbf)))),
              ((((7'h42) > wire10) | $unsigned(wire10)) ?
                  $signed(((8'hbf) ^ wire66)) : (8'h9f))});
          if ((($signed(((|wire54) ^~ wire66)) < $unsigned({reg56})) ?
              ((^reg95[(2'h3):(2'h2)]) != (^~(~|{reg20}))) : {({$signed(reg97)} ?
                      (+(~|(8'had))) : {(wire12 || reg95),
                          (wire15 << reg62)})}))
            begin
              reg98 <= (|$signed((reg55[(2'h3):(1'h1)] ~^ reg64)));
              reg99 <= wire92;
              reg100 <= reg58;
            end
          else
            begin
              reg98 <= {($unsigned({(8'hb0)}) >>> wire49[(3'h6):(3'h6)])};
            end
        end
      else
        begin
          reg95 <= reg56[(4'hd):(4'hd)];
        end
    end
  module101 #() modinst133 (wire132, clk, wire66, wire53, wire15, wire13);
  assign wire134 = $signed(reg63);
  always
    @(posedge clk) begin
      if ($signed(((~|wire52[(3'h5):(3'h4)]) ?
          (~|(8'hbd)) : (~$unsigned($signed(wire52))))))
        begin
          reg135 <= $unsigned(wire53);
          reg136 <= $signed(($signed({$signed((8'hbc)), (reg18 || (8'ha0))}) ?
              reg63[(5'h11):(3'h4)] : (7'h40)));
          reg137 <= (~|wire54[(5'h11):(5'h10)]);
          reg138 <= {$unsigned((wire12[(3'h5):(1'h0)] ?
                  reg136[(2'h2):(2'h2)] : $unsigned($unsigned(wire15)))),
              ((((reg136 ? reg19 : reg61) ?
                  {wire52} : (reg135 * reg64)) && ((wire14 ? reg98 : reg18) ?
                  reg136 : {wire49})) || {$signed($signed(reg18)),
                  reg97[(2'h2):(1'h0)]})};
        end
      else
        begin
          reg135 <= wire134;
          reg136 <= (8'h9e);
          if ((^~$unsigned(wire15)))
            begin
              reg137 <= ($signed(((~^$unsigned(wire66)) <<< reg19[(4'ha):(3'h4)])) ?
                  $unsigned(reg96[(2'h3):(2'h2)]) : $signed(reg60[(5'h14):(3'h4)]));
              reg138 <= $unsigned(($unsigned((-$unsigned(reg94))) || (~|{(8'hb2)})));
              reg139 <= {$signed(reg138[(4'h9):(1'h1)]), wire14[(3'h5):(2'h3)]};
              reg140 <= $unsigned(($unsigned(($signed(reg137) ?
                      reg139 : {reg56, reg57})) ?
                  (((wire134 < reg61) ^~ $unsigned(wire16)) & (wire52 - reg18[(2'h3):(2'h3)])) : (~^(reg137 <<< reg139))));
            end
          else
            begin
              reg137 <= wire13[(3'h6):(2'h3)];
              reg138 <= reg57;
            end
          reg141 <= wire15;
          reg142 <= $signed($unsigned($signed(wire11[(5'h10):(3'h4)])));
        end
      reg143 <= reg64[(4'hd):(4'h8)];
      reg144 <= (~|$signed($unsigned($unsigned($unsigned(reg98)))));
      reg145 <= $unsigned(($signed($signed(reg61[(4'h9):(4'h9)])) && ((~reg58) | reg139)));
      reg146 <= {reg140[(2'h2):(1'h1)], (&$signed($signed($unsigned(wire16))))};
    end
  assign wire147 = (7'h41);
endmodule

module module101
#(parameter param130 = (-(({(~&(8'hae)), {(8'ha6)}} ? {(~(8'ha0))} : {((8'hac) + (8'h9d)), (^(8'ha0))}) ^~ (-(8'ha5)))), 
parameter param131 = (!param130))
(y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire105;
  input wire signed [(5'h10):(1'h0)] wire104;
  input wire signed [(4'h9):(1'h0)] wire103;
  input wire [(3'h6):(1'h0)] wire102;
  wire [(5'h11):(1'h0)] wire128;
  wire [(2'h2):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire126;
  wire signed [(4'h8):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire106;
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  assign y = {wire128,
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
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg129,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire106 = $unsigned(wire102[(3'h5):(1'h1)]);
  assign wire107 = ((wire102[(2'h2):(2'h2)] ?
                       $signed(wire105) : (8'hba)) << $unsigned((8'h9e)));
  assign wire108 = wire107[(2'h2):(1'h0)];
  assign wire109 = (~|(&(8'ha5)));
  assign wire110 = {((wire102[(3'h4):(1'h0)] != $unsigned(wire109)) == (&wire102[(3'h4):(1'h0)]))};
  assign wire111 = (wire106 ?
                       ((({wire102} ?
                               (|wire102) : (~|(8'hbc))) << $signed((^~(8'ha0)))) ?
                           (^~($unsigned(wire104) ?
                               (wire110 >= wire102) : (wire109 > wire104))) : $unsigned((-(wire104 ?
                               wire102 : wire104)))) : $signed(({wire105} == wire102[(2'h3):(2'h2)])));
  assign wire112 = (~(!((wire103 >>> wire107[(1'h0):(1'h0)]) ?
                       $signed(wire103[(1'h1):(1'h0)]) : (wire103 <= $signed(wire109)))));
  assign wire113 = {($signed({(wire107 ?
                               wire107 : wire108)}) >>> $signed({(wire103 ?
                               wire105 : wire110)}))};
  assign wire114 = $unsigned($unsigned((wire111 ?
                       $unsigned((~|(8'ha0))) : ((8'hb0) ?
                           $unsigned(wire112) : (wire113 | wire105)))));
  always
    @(posedge clk) begin
      reg115 <= $unsigned($unsigned(wire110));
      reg116 <= wire111;
    end
  assign wire117 = $signed((wire107[(1'h1):(1'h1)] <<< ((((8'ha5) ?
                           reg115 : reg116) != wire105) ?
                       reg116[(1'h1):(1'h1)] : ((~wire113) ?
                           {wire106, wire112} : (wire111 >= (7'h40))))));
  assign wire118 = wire109[(3'h4):(3'h4)];
  assign wire119 = wire112[(4'hd):(4'h8)];
  assign wire120 = (wire118[(2'h2):(2'h2)] - $unsigned(((wire109[(3'h4):(2'h2)] ?
                           wire107[(1'h1):(1'h1)] : (~wire104)) ?
                       (~&(+wire111)) : {(-wire107)})));
  assign wire121 = wire107;
  assign wire122 = (~&wire108[(2'h3):(1'h1)]);
  assign wire123 = $unsigned(((^~($unsigned(wire122) ?
                       wire110[(2'h2):(2'h2)] : (wire114 ?
                           reg116 : wire107))) == $signed((wire108[(2'h3):(2'h2)] ?
                       $signed(wire106) : (^~wire104)))));
  assign wire124 = $unsigned($signed($unsigned({$signed(wire103),
                       ((8'hb5) < (8'hb4))})));
  assign wire125 = (^wire117[(1'h0):(1'h0)]);
  assign wire126 = {((~|($signed(wire120) ?
                           wire113 : wire103)) >>> (((wire120 >= wire111) << $unsigned(wire103)) >>> ($unsigned(wire108) ?
                           $signed(wire106) : wire117[(3'h7):(3'h7)])))};
  assign wire127 = (&$signed(($signed(wire126) >>> ((wire105 ?
                       wire114 : wire119) >> {(8'hbc), (8'ha0)}))));
  assign wire128 = wire103[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg129 <= $signed((7'h44));
    end
endmodule

module module67
#(parameter param90 = ((((((8'ha6) << (8'hb9)) >> ((8'hbe) ? (8'ha0) : (8'ha6))) ? (((8'hbe) ? (8'hb8) : (7'h44)) ? (8'ha1) : {(8'hbc)}) : ({(7'h41)} * ((7'h41) ? (8'h9d) : (7'h44)))) & (^~((~&(8'haf)) && ((8'ha4) << (8'hbf))))) == ((-(((8'hbc) ? (8'hbe) : (8'hb3)) ? ((8'hb7) + (8'ha2)) : ((8'hbb) - (8'hac)))) - (~^(((8'hbe) - (8'hb1)) ? ((8'h9e) <= (8'h9f)) : (-(8'ha0)))))), 
parameter param91 = (~^((param90 | (param90 ? param90 : (param90 != param90))) ? (~|{param90, (param90 ? param90 : (8'hb2))}) : ({(param90 ? (8'ha4) : (8'hb4)), (param90 + (8'hb6))} <= (param90 || (|(8'hb4)))))))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire71;
  input wire signed [(4'hb):(1'h0)] wire70;
  input wire signed [(5'h14):(1'h0)] wire69;
  input wire [(5'h10):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire72;
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire72,
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
                 (1'h0)};
  assign wire72 = $signed(wire71);
  always
    @(posedge clk) begin
      reg73 <= (+wire71[(4'hc):(4'h8)]);
      reg74 <= $unsigned({wire72});
      if ((+(8'ha0)))
        begin
          if (wire68[(3'h4):(2'h2)])
            begin
              reg75 <= (8'hbc);
            end
          else
            begin
              reg75 <= $unsigned($signed((wire69 ^~ reg75)));
              reg76 <= {($signed(($signed(wire70) ?
                      reg74[(4'h9):(3'h4)] : (wire72 - wire69))) | (^~$unsigned($signed((8'hba))))),
                  $unsigned((wire68[(4'hb):(3'h7)] ? (8'hb0) : wire68))};
              reg77 <= $signed({$unsigned($signed((!wire68))),
                  (($unsigned(reg75) >= (wire72 ? wire71 : reg74)) > {reg73})});
            end
          reg78 <= (|(+((+reg76) ?
              ($signed(wire69) ?
                  (reg76 * reg77) : (8'hb8)) : reg75[(2'h3):(2'h2)])));
          reg79 <= ((^{$unsigned(wire72)}) ? wire68 : wire69);
          reg80 <= reg76[(3'h4):(1'h1)];
          reg81 <= $unsigned((~wire69[(2'h2):(2'h2)]));
        end
      else
        begin
          reg75 <= $signed(reg75);
        end
      reg82 <= (|$unsigned((wire71 ? wire71 : reg81[(3'h7):(1'h1)])));
      reg83 <= $signed($unsigned((wire68[(4'ha):(1'h1)] ?
          (reg76 ?
              ((8'h9f) >= wire71) : reg80[(2'h3):(2'h3)]) : ((^~reg81) ~^ (wire68 ?
              reg82 : reg78)))));
    end
  assign wire84 = wire70;
  assign wire85 = wire68[(3'h7):(3'h5)];
  assign wire86 = {(-reg81[(1'h1):(1'h1)])};
  assign wire87 = reg77;
  assign wire88 = {(reg73[(2'h2):(1'h0)] << $unsigned((!$signed((8'h9e)))))};
  assign wire89 = reg81;
endmodule

module module22
#(parameter param47 = (^~((({(8'h9d)} & (8'ha6)) ? (^~((8'hbe) ^~ (8'ha3))) : ((~(8'ha8)) || (|(8'hbd)))) ? (8'ha6) : (^{((8'hb1) << (8'ha1)), ((8'hb5) < (8'ha9))}))), 
parameter param48 = (-(((|(-param47)) ? param47 : {(param47 ? param47 : param47)}) <<< {{(~^(8'had)), param47}})))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire26;
  input wire signed [(5'h11):(1'h0)] wire25;
  input wire signed [(3'h6):(1'h0)] wire24;
  input wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 (1'h0)};
  assign wire27 = (((((wire23 < wire23) ?
                              $unsigned(wire23) : wire23[(3'h5):(3'h4)]) ^~ wire26[(1'h1):(1'h0)]) ?
                          ((~^$signed(wire25)) ?
                              wire23 : ($unsigned((8'hb7)) - $signed((8'hb6)))) : $signed($signed({(8'ha1),
                              wire24}))) ?
                      (^(~(|wire24))) : (wire25 || ({{wire26}} ?
                          (~(wire24 != wire26)) : $unsigned((!wire25)))));
  assign wire28 = (wire25[(3'h6):(3'h5)] >>> wire27);
  assign wire29 = (^~(~&(((wire26 == wire27) ?
                      wire25[(5'h10):(2'h3)] : $unsigned(wire24)) >= $signed((!wire28)))));
  assign wire30 = ((wire28[(3'h5):(2'h2)] ?
                          $unsigned(wire24[(1'h1):(1'h1)]) : (($unsigned(wire25) ^~ $signed(wire28)) ?
                              (~wire23) : ((~^(8'h9c)) <= (&wire29)))) ?
                      wire28 : $signed(wire29));
  assign wire31 = wire23;
  assign wire32 = (($signed(wire30) ? (8'h9f) : wire29) ?
                      ((wire24[(2'h2):(1'h1)] ? wire28 : (8'h9d)) ?
                          (wire31[(3'h5):(3'h5)] ?
                              wire23 : ($signed(wire24) ?
                                  $unsigned(wire31) : wire26[(2'h2):(2'h2)])) : (wire26 ?
                              $signed({wire29,
                                  (8'ha8)}) : wire31[(4'h8):(2'h2)])) : ({($unsigned(wire29) ^ wire29[(3'h4):(2'h2)])} ?
                          (wire27[(1'h1):(1'h0)] <= (-$unsigned(wire23))) : $signed(((wire26 ?
                                  (8'hbc) : wire29) ?
                              $unsigned(wire23) : $signed(wire26)))));
  assign wire33 = (({(~$unsigned(wire30)), (7'h42)} ?
                      wire29 : {(~^$unsigned(wire30))}) <= (8'haf));
  assign wire34 = (+wire33[(2'h3):(1'h0)]);
  assign wire35 = (wire33[(2'h3):(2'h3)] & $signed($signed(wire23)));
  assign wire36 = wire31;
  assign wire37 = (wire25[(3'h5):(2'h3)] ?
                      ((&$signed(wire24[(1'h0):(1'h0)])) ^~ $unsigned($unsigned((^~wire25)))) : wire36);
  assign wire38 = $signed((^~$signed(wire27[(1'h0):(1'h0)])));
  assign wire39 = (($unsigned(wire38) >= (wire26[(2'h3):(1'h0)] < (!$unsigned(wire37)))) ~^ wire23);
  assign wire40 = (wire32 << $unsigned(($signed($signed(wire33)) >= {(wire30 == wire24)})));
  assign wire41 = $unsigned(wire37[(4'hc):(3'h4)]);
  assign wire42 = (~$signed(wire33[(2'h2):(1'h1)]));
  assign wire43 = $signed((({wire42[(3'h5):(2'h3)]} ?
                      (wire26 ^ $signed(wire35)) : ((&wire32) ?
                          (!wire28) : $unsigned((8'hac)))) >= {(8'haf)}));
  assign wire44 = $signed(wire31[(4'hf):(4'ha)]);
  assign wire45 = (~&{wire32,
                      (~|($signed(wire31) ?
                          (wire41 >> wire25) : $signed(wire28)))});
  assign wire46 = wire24;
endmodule
