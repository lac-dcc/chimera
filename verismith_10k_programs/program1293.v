module top
#(parameter param201 = ((^~(8'ha1)) <= (({((8'hac) ? (7'h40) : (8'hbc))} ? ({(8'hac)} + ((8'hb9) ^~ (8'hb0))) : ((&(8'hb0)) ? (~(8'hbf)) : (~&(8'hbc)))) ? ((((8'hb1) + (8'ha7)) < (7'h42)) ? (~&((8'ha3) > (7'h40))) : (~^{(8'ha6), (8'ha7)})) : (!((8'haf) ? ((8'hb8) + (8'hb8)) : ((8'hae) < (8'h9d)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire [(2'h2):(1'h0)] wire199;
  wire [(4'h9):(1'h0)] wire198;
  wire signed [(4'he):(1'h0)] wire197;
  wire signed [(5'h11):(1'h0)] wire196;
  wire signed [(4'hf):(1'h0)] wire195;
  wire signed [(5'h11):(1'h0)] wire188;
  wire signed [(5'h12):(1'h0)] wire135;
  wire [(5'h13):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire138;
  wire signed [(4'h9):(1'h0)] wire139;
  wire [(3'h7):(1'h0)] wire140;
  wire [(4'hf):(1'h0)] wire186;
  wire signed [(5'h13):(1'h0)] wire190;
  wire [(3'h4):(1'h0)] wire192;
  wire [(5'h13):(1'h0)] wire193;
  reg signed [(3'h4):(1'h0)] reg200 = (1'h0);
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire188,
                 wire135,
                 wire137,
                 wire138,
                 wire139,
                 wire140,
                 wire186,
                 wire190,
                 wire192,
                 wire193,
                 reg200,
                 (1'h0)};
  module4 #() modinst136 (.wire7(wire0), .wire8(wire3), .wire9((8'ha4)), .wire6(wire1), .wire5(wire2), .clk(clk), .y(wire135));
  assign wire137 = wire2;
  assign wire138 = wire2;
  assign wire139 = (-{wire1,
                       (+({wire0, wire135} ?
                           (wire135 ?
                               wire135 : wire138) : (wire2 >>> wire3)))});
  assign wire140 = {($signed(wire135) != $signed({{wire0}}))};
  module141 #() modinst187 (.clk(clk), .wire142(wire135), .wire146(wire139), .wire145(wire137), .wire143(wire2), .wire144(wire3), .y(wire186));
  module141 #() modinst189 (.y(wire188), .wire142(wire2), .clk(clk), .wire146(wire140), .wire143(wire138), .wire144(wire137), .wire145(wire0));
  module12 #() modinst191 (.wire14(wire137), .wire15(wire188), .wire16(wire0), .y(wire190), .wire13(wire2), .clk(clk));
  assign wire192 = wire135;
  module141 #() modinst194 (wire193, clk, wire188, wire1, wire139, wire138, wire137);
  assign wire195 = wire140;
  assign wire196 = $unsigned((($signed($signed(wire3)) >> wire190[(4'h9):(2'h3)]) ?
                       $unsigned($unsigned(((8'hac) ?
                           wire1 : wire2))) : ($signed($unsigned((8'hb2))) ?
                           $signed((wire140 <<< wire137)) : (wire139 ^~ $unsigned(wire135)))));
  assign wire197 = wire135[(1'h0):(1'h0)];
  assign wire198 = $signed(wire192);
  assign wire199 = (-((~|{(~|wire195)}) ? wire138 : (+wire1[(4'hd):(4'hd)])));
  always
    @(posedge clk) begin
      reg200 <= wire140;
    end
endmodule

module module141
#(parameter param185 = (!(^((|((8'h9d) ^ (7'h41))) ? ({(7'h40), (8'ha9)} ? ((8'hab) << (8'hbd)) : ((8'hbd) ? (8'h9e) : (8'ha8))) : (((8'h9d) >= (8'ha5)) - (-(8'ha8)))))))
(y, clk, wire146, wire145, wire144, wire143, wire142);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire146;
  input wire signed [(3'h7):(1'h0)] wire145;
  input wire [(2'h3):(1'h0)] wire144;
  input wire [(4'he):(1'h0)] wire143;
  input wire [(5'h12):(1'h0)] wire142;
  wire signed [(4'hc):(1'h0)] wire184;
  wire signed [(5'h14):(1'h0)] wire182;
  wire signed [(3'h7):(1'h0)] wire147;
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg [(5'h12):(1'h0)] reg155 = (1'h0);
  assign y = {wire184,
                 wire182,
                 wire147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 (1'h0)};
  assign wire147 = $unsigned((~&(({wire142} ^~ wire145) < $unsigned($signed(wire143)))));
  always
    @(posedge clk) begin
      if ($unsigned({wire142, $unsigned(wire143[(4'hb):(3'h7)])}))
        begin
          reg148 <= $signed((((8'hac) ?
                  {wire147[(1'h0):(1'h0)], {(7'h42)}} : (~&$signed(wire142))) ?
              $signed($signed(wire145)) : ((~&wire143) ?
                  (~|(wire143 ? wire145 : wire145)) : $unsigned(wire142))));
          reg149 <= (~^(+($signed($signed(wire147)) == wire146[(3'h6):(3'h4)])));
          if ({wire145})
            begin
              reg150 <= (wire142 ?
                  $unsigned((~|((wire143 >= (8'ha4)) ?
                      (wire147 >> wire142) : wire146))) : $unsigned(($signed(wire144[(2'h3):(2'h3)]) ?
                      $signed(((8'ha6) || wire144)) : $signed((+reg149)))));
            end
          else
            begin
              reg150 <= (wire147[(2'h3):(1'h0)] ?
                  $signed((~|((!wire144) ?
                      reg148[(3'h5):(3'h5)] : reg148[(1'h0):(1'h0)]))) : {(wire143[(3'h4):(3'h4)] ?
                          ((~^wire145) ?
                              $signed(wire147) : (-wire146)) : (reg148 >> {reg150}))});
              reg151 <= (^~(8'hb2));
              reg152 <= $signed(wire144);
            end
        end
      else
        begin
          reg148 <= (+($unsigned((~$signed(reg151))) ?
              ((^~$signed(reg152)) ?
                  {wire143, {reg150}} : (-(8'ha9))) : reg150));
        end
      reg153 <= reg151;
      reg154 <= (reg148[(2'h2):(1'h1)] + (({(~|reg148), $signed(wire147)} ?
              $unsigned($signed(reg152)) : ((reg148 ?
                  (8'hbc) : wire143) || ((8'ha2) ? reg149 : wire145))) ?
          (~reg149) : ((8'haa) ? wire146 : ({(8'h9d)} >= $unsigned((8'hac))))));
      reg155 <= $unsigned(((((wire146 >> reg154) ?
                  $unsigned(reg152) : (^~wire142)) ?
              reg150 : reg153[(1'h1):(1'h1)]) ?
          (~^reg150) : $unsigned($signed((reg152 ? wire144 : reg153)))));
    end
  module156 #() modinst183 (wire182, clk, reg150, reg149, reg152, reg151, reg148);
  assign wire184 = wire147[(3'h4):(2'h2)];
endmodule

module module4
#(parameter param133 = (((((~&(8'h9f)) ? (|(7'h41)) : ((8'ha3) && (7'h43))) >= (~((8'ha1) ? (8'h9d) : (8'haf)))) ^ {(&(&(8'ha4))), (^(|(8'ha7)))}) ? ((({(8'ha8)} ? ((8'h9f) && (8'ha9)) : ((8'haa) << (8'had))) ? (~{(8'hbb), (8'hbc)}) : (|(+(8'hb1)))) ? {({(8'ha7)} | ((8'hb3) + (7'h43))), (((8'ha3) >> (8'hac)) >>> ((8'hb1) >> (8'hba)))} : (8'ha4)) : (^((|((8'h9c) ? (8'h9c) : (8'hb5))) ? ((+(8'haa)) ? (~(8'ha1)) : ((8'hb5) <= (8'hb6))) : ((8'hae) ? ((7'h42) == (8'ha4)) : ((8'ha0) ? (8'hab) : (8'ha4)))))), 
parameter param134 = ((8'h9f) ? param133 : param133))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire5;
  input wire [(4'h9):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire131;
  wire signed [(4'he):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire128;
  wire [(4'h9):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire89;
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire128,
                 wire92,
                 wire91,
                 wire10,
                 wire11,
                 wire44,
                 wire89,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 (1'h0)};
  assign wire10 = ($signed($signed(wire6)) ?
                      {wire7[(2'h3):(2'h2)],
                          wire8} : $signed(wire6[(3'h7):(2'h3)]));
  assign wire11 = wire8[(4'hb):(1'h0)];
  module12 #() modinst45 (wire44, clk, wire6, wire8, wire7, wire5);
  module46 #() modinst90 (.wire47(wire9), .wire49(wire10), .wire48(wire8), .wire51(wire5), .wire50(wire44), .y(wire89), .clk(clk));
  assign wire91 = wire8;
  assign wire92 = {((&(-{wire89,
                          wire5})) ^~ $unsigned(((~^wire8) >> $unsigned(wire6)))),
                      wire11[(3'h6):(3'h4)]};
  always
    @(posedge clk) begin
      reg93 <= $signed((+wire8[(4'hd):(3'h7)]));
      if ($signed($signed($signed($signed($signed(wire92))))))
        begin
          reg94 <= wire6;
          reg95 <= $signed($unsigned({wire6[(3'h4):(1'h1)],
              {reg93, wire89[(3'h4):(1'h1)]}}));
          reg96 <= $signed({wire9, (+(-$signed((8'ha2))))});
        end
      else
        begin
          reg94 <= (^wire44);
        end
      if (($unsigned((wire44 ? reg95 : {$signed(reg93)})) ?
          wire92[(2'h3):(1'h0)] : (reg95 & $unsigned(wire91[(1'h0):(1'h0)]))))
        begin
          reg97 <= (~|($unsigned({$signed(reg93)}) > (+(|(^~(7'h42))))));
          reg98 <= reg96;
          reg99 <= wire8;
        end
      else
        begin
          reg97 <= ((($signed(((8'hbd) && reg98)) <= ((|wire92) + $unsigned(reg98))) >> reg94) ^ ((!$unsigned((reg98 ?
              wire44 : wire5))) != ($signed((wire8 ?
              reg96 : reg96)) >= $signed($signed(reg95)))));
          reg98 <= reg94;
          reg99 <= $signed(wire92);
        end
      reg100 <= (wire89[(1'h1):(1'h0)] ?
          (^~(+($unsigned((8'hbb)) >>> (-wire9)))) : (+{((wire7 ?
                      reg97 : wire8) ?
                  (wire9 ~^ wire5) : $unsigned(wire10))}));
    end
  always
    @(posedge clk) begin
      reg101 <= reg100[(4'hf):(4'he)];
      if ($unsigned($signed($unsigned(wire6))))
        begin
          if (({((8'ha5) ?
                      $signed(reg96[(3'h7):(3'h6)]) : {$unsigned(reg93)})} ?
              wire91 : (-(($unsigned(wire7) ~^ (~&wire89)) || ({reg96} == $unsigned(reg100))))))
            begin
              reg102 <= reg101[(1'h1):(1'h1)];
              reg103 <= $unsigned(((8'hb6) - {((&wire7) ?
                      reg97[(2'h3):(1'h1)] : (^wire6)),
                  wire10[(5'h10):(1'h1)]}));
            end
          else
            begin
              reg102 <= $signed($signed(($signed((wire8 ? wire11 : reg95)) ?
                  reg97[(1'h0):(1'h0)] : reg94[(4'he):(2'h3)])));
            end
          reg104 <= $unsigned(({$signed($unsigned(reg102))} ?
              wire89[(4'hb):(4'hb)] : reg98));
        end
      else
        begin
          reg102 <= $unsigned(((!$unsigned((~|wire7))) ?
              (^~{(wire9 ? wire89 : wire92)}) : (~^$signed((wire10 ?
                  reg98 : reg102)))));
          reg103 <= wire5[(4'hc):(4'ha)];
          reg104 <= reg95;
        end
      reg105 <= {(8'hb5)};
    end
  module106 #() modinst129 (.wire108(wire91), .wire107(wire5), .wire109(wire92), .clk(clk), .wire111(reg102), .wire110(wire89), .y(wire128));
  assign wire130 = (^wire10[(5'h11):(4'hc)]);
  assign wire131 = (~$unsigned($signed(((reg98 ? reg94 : reg103) ?
                       reg102 : (^reg94)))));
  assign wire132 = $signed((8'hbe));
endmodule

module module106
#(parameter param127 = (({(((8'h9d) && (8'haa)) | ((8'hb6) == (7'h40))), (-(8'h9d))} - (~&(^((8'hb1) ? (8'hb5) : (8'hab))))) + (~^(+((^(8'hb7)) ? {(8'hb2)} : (-(8'hac)))))))
(y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire111;
  input wire signed [(3'h6):(1'h0)] wire110;
  input wire signed [(4'h8):(1'h0)] wire109;
  input wire signed [(3'h5):(1'h0)] wire108;
  input wire [(4'h8):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire123;
  wire [(5'h12):(1'h0)] wire122;
  wire [(4'hc):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire119;
  wire signed [(3'h6):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire117;
  wire signed [(3'h4):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  assign y = {wire126,
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
                 wire113,
                 wire112,
                 reg114,
                 (1'h0)};
  assign wire112 = ({(~(wire111 - ((7'h41) - (8'hb8)))),
                       $unsigned($unsigned(wire110))} < {(^({wire107,
                           wire110} ~^ {wire107}))});
  assign wire113 = (wire112 ?
                       $unsigned($signed($signed($signed((8'ha5))))) : (8'h9f));
  always
    @(posedge clk) begin
      reg114 <= wire113[(5'h11):(4'ha)];
    end
  assign wire115 = {((wire109[(2'h3):(1'h1)] ^~ $unsigned((^~wire113))) && (wire112 >>> $signed(wire107)))};
  assign wire116 = ((((wire109 + (wire115 < wire108)) ?
                       wire111[(4'hd):(4'hb)] : (~(~|wire111))) >>> (((wire111 ?
                           wire110 : wire108) < {wire112, wire108}) ?
                       ((~&wire112) ?
                           {reg114, wire112} : wire115) : ((~wire109) ?
                           wire109 : wire115[(2'h3):(2'h2)]))) | (!$signed((wire112 - $unsigned((7'h43))))));
  assign wire117 = (wire111 ?
                       {$unsigned($unsigned(reg114)),
                           $signed((~&$unsigned(wire112)))} : (wire111[(3'h5):(1'h0)] ^~ (+($unsigned(wire116) << $unsigned((7'h44))))));
  assign wire118 = wire113;
  assign wire119 = (-(+($unsigned((^~wire116)) ?
                       $unsigned(wire111[(4'hf):(2'h3)]) : $unsigned($unsigned((8'hb5))))));
  assign wire120 = (wire108 ?
                       $unsigned($signed(wire112[(1'h1):(1'h1)])) : $signed(wire119));
  assign wire121 = wire107;
  assign wire122 = reg114;
  assign wire123 = ($signed(wire122) ?
                       wire118 : $signed(((|wire116) ?
                           wire113 : $unsigned(wire120))));
  assign wire124 = $unsigned($signed((|wire116)));
  assign wire125 = ((^(wire117[(3'h5):(3'h5)] ^ ((wire111 * wire120) ?
                       (reg114 <<< wire112) : (wire108 ~^ wire123)))) && wire112);
  assign wire126 = wire118[(2'h3):(2'h3)];
endmodule

module module46
#(parameter param88 = (((8'hb6) != ((((8'h9e) ? (8'hb6) : (8'had)) ? (|(8'hac)) : ((8'hac) && (8'ha4))) ? ({(8'h9e)} + ((7'h44) & (8'hb8))) : ((+(8'h9f)) ? (~|(8'ha8)) : (!(8'hba))))) ? (&({((8'hb3) ? (8'hb7) : (8'ha1))} ? ({(8'hbc), (8'hb1)} || (~|(7'h40))) : {(+(8'ha0))})) : (8'haf)))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h1b3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire51;
  input wire [(3'h6):(1'h0)] wire50;
  input wire signed [(5'h13):(1'h0)] wire49;
  input wire [(4'he):(1'h0)] wire48;
  input wire signed [(4'h8):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire65,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg85,
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
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg64,
                 reg63,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg52 <= $unsigned({$unsigned(($unsigned(wire50) ?
              (wire47 ? wire51 : wire49) : (wire51 ^~ (8'hb8))))});
      reg53 <= $unsigned(reg52);
      reg54 <= {($unsigned(((wire48 < wire47) ?
              (wire47 ? (8'hb3) : (8'ha2)) : (wire47 ?
                  wire48 : wire51))) * wire50[(3'h5):(1'h1)]),
          {(!((wire51 <<< wire50) ? (~^wire51) : ((8'ha3) ^ wire48))),
              (^{((8'haf) ^ reg53), {wire51}})}};
    end
  assign wire55 = wire47;
  assign wire56 = ($unsigned($unsigned($unsigned($signed(wire48)))) != wire47[(3'h4):(1'h1)]);
  assign wire57 = {((wire47 ?
                          wire48 : reg53) < $unsigned(((wire49 * (8'ha5)) && ((8'hbe) ?
                          (8'hbf) : wire55)))),
                      $signed({($unsigned(wire47) + wire49[(5'h11):(1'h0)]),
                          $unsigned($signed(wire56))})};
  assign wire58 = $signed(reg52);
  assign wire59 = {wire47[(2'h3):(1'h1)]};
  assign wire60 = (7'h43);
  assign wire61 = wire51[(3'h4):(1'h1)];
  assign wire62 = {{$signed(wire57[(3'h6):(3'h6)])}};
  always
    @(posedge clk) begin
      reg63 <= wire55;
      reg64 <= {$unsigned({reg53[(5'h10):(1'h0)],
              $unsigned(reg63[(4'ha):(1'h0)])})};
    end
  assign wire65 = (^~$signed(wire56[(3'h6):(2'h2)]));
  always
    @(posedge clk) begin
      if (($unsigned(wire50) || $signed(wire57)))
        begin
          reg66 <= $unsigned((~|({(^wire48)} <= $unsigned($signed(wire56)))));
          reg67 <= (8'hbb);
          reg68 <= ((wire51[(3'h4):(3'h4)] ?
                  (wire61[(1'h1):(1'h0)] == (wire61[(4'hd):(3'h6)] | $signed((8'h9e)))) : reg63[(2'h2):(2'h2)]) ?
              $signed((((~|wire49) ? $signed(reg66) : $signed(reg67)) ?
                  $signed({wire56,
                      wire49}) : $signed(wire65[(1'h1):(1'h0)]))) : (wire48 & ($unsigned(((8'ha6) ?
                  wire49 : wire49)) ^~ reg52)));
          reg69 <= wire56;
          if (reg54[(2'h3):(2'h2)])
            begin
              reg70 <= $unsigned((~(wire60 + reg52)));
              reg71 <= reg68;
            end
          else
            begin
              reg70 <= ($signed(reg63[(3'h6):(1'h1)]) + {$signed($signed((reg52 < reg68)))});
              reg71 <= {$signed($signed(reg52[(3'h6):(1'h1)])),
                  (|$signed($signed((!wire50))))};
              reg72 <= (|$unsigned(reg69));
              reg73 <= (^((($signed(reg69) & $unsigned(reg52)) | $unsigned(reg67[(4'he):(4'hd)])) ?
                  $unsigned(wire58[(1'h1):(1'h0)]) : ((~$signed(reg72)) - {$signed((7'h43)),
                      $unsigned(reg64)})));
            end
        end
      else
        begin
          reg66 <= (wire61[(4'ha):(1'h0)] == wire60[(1'h0):(1'h0)]);
        end
      if (wire58[(1'h1):(1'h1)])
        begin
          if (reg70[(2'h3):(2'h3)])
            begin
              reg74 <= {(^reg52)};
              reg75 <= ($unsigned($signed((wire48[(4'h8):(4'h8)] > (7'h44)))) ?
                  (8'h9d) : $unsigned(wire55));
              reg76 <= $unsigned(reg67);
            end
          else
            begin
              reg74 <= {wire51[(1'h1):(1'h1)], wire58};
              reg75 <= $signed((~wire50));
              reg76 <= $signed($unsigned((wire49 << {(7'h43)})));
              reg77 <= $unsigned(reg54[(2'h3):(1'h0)]);
              reg78 <= $unsigned(reg63);
            end
        end
      else
        begin
          reg74 <= (8'had);
        end
      reg79 <= $unsigned(reg64[(4'ha):(3'h4)]);
      if (reg72)
        begin
          reg80 <= $unsigned((!$signed((+((8'ha0) >= reg68)))));
          reg81 <= $unsigned((|($signed((wire49 && (8'ha2))) | wire60)));
          reg82 <= $unsigned(wire56[(3'h6):(2'h2)]);
          reg83 <= reg80;
        end
      else
        begin
          reg80 <= ($signed((7'h40)) ^~ reg83);
          reg81 <= $signed(($signed(((~^reg52) >= (reg75 ?
              (8'ha9) : reg74))) * (reg74 ?
              $unsigned((8'hae)) : (wire55 - reg72[(4'ha):(3'h6)]))));
          if ($signed({$unsigned($unsigned((reg76 ? wire56 : (8'hb8)))),
              reg73[(2'h3):(1'h1)]}))
            begin
              reg82 <= $signed(wire59);
              reg83 <= ($signed(((wire57 && wire62[(3'h7):(3'h6)]) ?
                      ({reg79, reg83} << wire61) : ({wire59,
                          wire57} || wire51))) ?
                  ({$signed(wire50)} ?
                      $unsigned((reg82 ?
                          {reg64,
                              reg70} : (^~wire58))) : (reg71 >>> reg74[(2'h2):(1'h1)])) : $signed(reg69[(4'he):(3'h5)]));
              reg84 <= reg80;
            end
          else
            begin
              reg82 <= (~^(8'haa));
              reg83 <= (~^wire47[(3'h4):(3'h4)]);
            end
        end
      reg85 <= $signed($signed($signed($unsigned(wire50[(3'h5):(3'h5)]))));
    end
  assign wire86 = reg82;
  assign wire87 = {wire61[(3'h6):(2'h3)]};
endmodule

module module12
#(parameter param43 = ((((((8'ha0) ? (8'ha3) : (8'ha2)) ? ((8'hab) ? (8'ha6) : (8'hae)) : ((8'hb2) ? (7'h43) : (8'haf))) & (((8'hbf) ? (8'haf) : (8'hbe)) == ((8'ha9) ~^ (8'ha6)))) << (((^(8'h9e)) ? ((8'h9c) ? (8'ha3) : (8'ha9)) : (~|(8'ha1))) ~^ ((7'h42) - {(8'hbd)}))) >= (~(({(8'hbc)} ? ((8'ha2) > (8'hb0)) : ((8'haf) ? (8'hbc) : (8'ha9))) ? ((!(8'hb2)) ? ((8'hbc) - (8'ha5)) : (~(8'ha1))) : (((8'hb5) ? (8'ha9) : (8'hbb)) ? ((8'hb4) ? (8'ha0) : (8'hb0)) : {(8'hbc), (8'hb4)})))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire17;
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  assign y = {wire42,
                 wire17,
                 reg41,
                 reg40,
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
                 (1'h0)};
  assign wire17 = $signed(($signed(((~|wire16) ? $unsigned(wire16) : (8'h9f))) ?
                      (wire16 ^~ (&wire15[(4'hc):(4'hb)])) : wire16));
  always
    @(posedge clk) begin
      reg18 <= wire17[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg19 <= wire13[(3'h5):(3'h5)];
      reg20 <= $unsigned($unsigned(($signed($unsigned(reg18)) ?
          ((~&reg19) ? wire14 : wire14[(4'hb):(1'h1)]) : $signed(reg18))));
      if (($unsigned(wire13[(4'h8):(3'h4)]) ?
          reg20[(4'ha):(4'h9)] : (reg20 ?
              wire14[(5'h11):(4'h9)] : $unsigned(reg19[(5'h10):(1'h0)]))))
        begin
          reg21 <= $signed({(^reg20[(2'h2):(1'h0)]),
              $unsigned(((wire17 - (8'hb3)) ?
                  ((8'ha1) ? reg19 : reg20) : (&(8'hbe))))});
          if (reg18[(4'hb):(4'h9)])
            begin
              reg22 <= wire14;
              reg23 <= wire13;
            end
          else
            begin
              reg22 <= reg18[(4'hc):(3'h5)];
            end
          if ((8'ha6))
            begin
              reg24 <= reg21[(1'h1):(1'h1)];
            end
          else
            begin
              reg24 <= ($unsigned($signed($signed(reg18[(1'h1):(1'h0)]))) << ($signed(wire16) ?
                  (wire17 < (^~$signed(reg22))) : wire13));
              reg25 <= reg20;
              reg26 <= (~^(reg18[(4'h8):(2'h3)] ? (^reg18) : reg23));
            end
          reg27 <= $signed((|({$unsigned(wire16)} ?
              reg19[(4'h9):(1'h1)] : $signed($unsigned(wire17)))));
        end
      else
        begin
          reg21 <= $unsigned($unsigned($unsigned((+wire13[(2'h3):(2'h2)]))));
          reg22 <= (+$signed((~^$unsigned($unsigned(wire15)))));
          reg23 <= (^((((reg25 + reg19) ?
                      wire16[(2'h3):(1'h0)] : $unsigned((8'hb6))) ?
                  (~|((8'hac) > reg23)) : ((reg18 ?
                      (8'hbb) : reg19) == $unsigned(reg25))) ?
              $unsigned((|reg24[(1'h1):(1'h0)])) : $signed($unsigned($unsigned(reg18)))));
          reg24 <= ((reg25[(4'hf):(4'hf)] ? reg25[(3'h4):(1'h1)] : reg21) ?
              reg18 : $unsigned($signed(reg20)));
          reg25 <= $signed(reg22);
        end
      reg28 <= {((reg21 ?
              wire17[(3'h7):(3'h6)] : {reg23[(4'he):(4'h9)]}) != ((+(reg22 + wire15)) ?
              ((reg18 >> wire14) ?
                  reg20[(3'h6):(1'h0)] : (reg22 ? reg25 : reg25)) : reg22)),
          (^~$signed((wire15 >= (7'h43))))};
      if (reg20)
        begin
          reg29 <= $signed($unsigned((reg22[(3'h4):(2'h3)] >= (!(reg23 ?
              reg23 : reg18)))));
          reg30 <= ($signed({reg28[(1'h0):(1'h0)]}) < wire16[(1'h0):(1'h0)]);
        end
      else
        begin
          if ((reg20[(3'h5):(2'h2)] || reg24))
            begin
              reg29 <= $unsigned(reg25);
              reg30 <= wire15;
              reg31 <= $unsigned(((+reg30[(3'h7):(2'h2)]) ?
                  $unsigned(reg21) : (~|({wire15, reg21} ?
                      reg21[(3'h5):(2'h3)] : reg26[(4'hc):(4'h9)]))));
              reg32 <= $unsigned(reg18);
              reg33 <= $unsigned((((!(|(8'hae))) << {$signed(reg30),
                      (^~reg26)}) ?
                  (({(8'haa), wire17} ?
                      (reg20 ? (8'hbc) : wire13) : {reg30}) << ({reg19,
                      reg22} == reg23)) : (~&$signed({reg26, wire15}))));
            end
          else
            begin
              reg29 <= (($unsigned(((wire17 >= reg26) ?
                          (reg26 && (8'hbc)) : reg25[(4'hb):(1'h0)])) ?
                      wire16[(1'h1):(1'h0)] : $unsigned(reg28)) ?
                  reg30 : ((reg24[(3'h6):(3'h5)] + reg33) ?
                      ((~|{reg23}) >= ((~|reg29) ?
                          ((8'h9d) | (8'hbb)) : $unsigned((8'h9f)))) : {$signed({reg28}),
                          ((~&wire16) & {(8'hb6)})}));
            end
          reg34 <= (~&(wire14 * wire14[(4'h9):(4'h9)]));
          reg35 <= reg33[(2'h2):(2'h2)];
          reg36 <= reg29;
          if ($signed((({wire16[(2'h3):(2'h3)],
                  {reg21}} ^ $signed($unsigned(reg34))) ?
              (reg21[(3'h4):(3'h4)] ?
                  {(-reg34),
                      $signed((7'h40))} : reg31) : (~&reg32[(5'h12):(3'h4)]))))
            begin
              reg37 <= reg36;
              reg38 <= $unsigned($unsigned(($unsigned((~|reg26)) ?
                  reg18[(4'h8):(4'h8)] : (wire16 ?
                      $unsigned(reg32) : (!reg31)))));
              reg39 <= wire13;
              reg40 <= $signed(reg19);
              reg41 <= ((({wire17, reg25} ?
                      (reg28 ?
                          ((8'hac) & (8'h9d)) : reg25[(3'h7):(1'h0)]) : (reg31[(4'h9):(4'h8)] ?
                          $signed(wire17) : reg36[(3'h6):(3'h6)])) ?
                  (~reg33) : ({(reg36 ? (8'ha5) : (8'haf))} ?
                      (reg29 ?
                          $unsigned((8'hbd)) : (reg32 <<< reg38)) : reg29[(1'h0):(1'h0)])) == $unsigned(reg20));
            end
          else
            begin
              reg37 <= ((+(((reg39 - reg41) ?
                  ((8'ha7) || reg24) : $unsigned((8'hbe))) ^~ (^~(+reg26)))) <= reg23[(1'h1):(1'h1)]);
              reg38 <= (|($unsigned(reg19) ?
                  (((reg23 >= wire17) ?
                      $unsigned((7'h42)) : (reg22 ?
                          reg22 : reg39)) | ($signed(reg22) ?
                      $signed(reg39) : (~(8'h9e)))) : reg40[(3'h4):(1'h1)]));
            end
        end
    end
  assign wire42 = (^(^((&$signed(reg27)) ? {{reg24, (8'hb4)}} : reg29)));
endmodule

module module156
#(parameter param180 = {{(^{(~(7'h41)), {(8'ha6)}})}}, 
parameter param181 = {param180})
(y, clk, wire161, wire160, wire159, wire158, wire157);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire161;
  input wire signed [(2'h3):(1'h0)] wire160;
  input wire [(3'h5):(1'h0)] wire159;
  input wire signed [(2'h3):(1'h0)] wire158;
  input wire signed [(3'h7):(1'h0)] wire157;
  wire signed [(5'h10):(1'h0)] wire176;
  wire signed [(5'h15):(1'h0)] wire175;
  wire signed [(4'he):(1'h0)] wire174;
  wire signed [(4'h9):(1'h0)] wire173;
  wire [(5'h10):(1'h0)] wire172;
  wire signed [(5'h15):(1'h0)] wire171;
  wire signed [(4'hc):(1'h0)] wire167;
  wire signed [(4'h9):(1'h0)] wire164;
  wire signed [(3'h7):(1'h0)] wire163;
  wire signed [(4'he):(1'h0)] wire162;
  reg signed [(5'h15):(1'h0)] reg179 = (1'h0);
  reg [(4'h8):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg170 = (1'h0);
  reg signed [(4'he):(1'h0)] reg169 = (1'h0);
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg166 = (1'h0);
  reg [(5'h12):(1'h0)] reg165 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire167,
                 wire164,
                 wire163,
                 wire162,
                 reg179,
                 reg178,
                 reg177,
                 reg170,
                 reg169,
                 reg168,
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire162 = $unsigned(wire161[(1'h0):(1'h0)]);
  assign wire163 = wire161;
  assign wire164 = (~|wire159);
  always
    @(posedge clk) begin
      reg165 <= wire162[(4'hd):(4'hd)];
      reg166 <= ((^~(^~wire162)) && ($unsigned((wire161[(2'h2):(1'h0)] != (~wire158))) + (({wire157} ^~ $signed(wire162)) == $signed(wire157[(3'h5):(1'h1)]))));
    end
  assign wire167 = wire162[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      if ($signed((~$unsigned($signed($signed(wire167))))))
        begin
          reg168 <= (reg165 ?
              (~((~|$unsigned((8'hb6))) ?
                  (~|{wire159, reg166}) : (^(reg166 > reg166)))) : {(reg166 ?
                      {wire160[(1'h0):(1'h0)]} : $unsigned((~|wire161)))});
          reg169 <= ({wire164,
              (((+wire160) << wire164[(2'h3):(2'h2)]) ?
                  ($signed(wire159) ?
                      wire163 : wire161[(1'h0):(1'h0)]) : wire157)} ^ (wire160 ~^ reg166[(3'h7):(3'h6)]));
        end
      else
        begin
          reg168 <= {((({reg168, (7'h43)} + $signed((8'h9f))) ?
                      $signed($unsigned(wire160)) : ((8'ha3) ?
                          (^(8'h9e)) : (wire162 ? reg165 : reg169))) ?
                  ($signed((|reg169)) * ((wire163 & wire157) ?
                      (wire157 | wire158) : {(8'ha2),
                          wire161})) : $signed({(~^(7'h42))}))};
          reg169 <= ((((-(-(8'ha7))) ?
                  wire157[(2'h2):(1'h1)] : $signed($unsigned(wire161))) < wire161) ?
              $unsigned(wire160) : (($unsigned({reg165, wire161}) ?
                      wire163[(2'h2):(2'h2)] : $unsigned($unsigned(reg165))) ?
                  (reg169[(4'he):(3'h7)] ?
                      wire160 : {(wire159 || wire167)}) : wire162[(4'h8):(2'h3)]));
          reg170 <= $signed((($signed(reg165[(5'h12):(5'h10)]) * ({reg166} < reg168)) <<< $signed(($signed(wire159) & (reg169 + (8'hae))))));
        end
    end
  assign wire171 = ((7'h42) ?
                       ((&$signed({wire163})) ?
                           (((wire167 - wire163) ?
                                   (reg166 ? reg165 : reg170) : (|reg170)) ?
                               ({reg170, (8'ha4)} ?
                                   ((8'hbb) ? reg165 : wire157) : {wire162,
                                       wire158}) : (!{wire164,
                                   (7'h42)})) : {reg166[(1'h1):(1'h0)],
                               wire157[(1'h0):(1'h0)]}) : (((~(wire160 ?
                               (8'hb5) : wire161)) ?
                           (wire159 ?
                               $signed(reg165) : {reg169}) : $signed(reg169)) >>> {$signed($signed(wire161)),
                           reg168[(3'h5):(2'h3)]}));
  assign wire172 = wire158;
  assign wire173 = $unsigned(($unsigned($signed((reg168 + wire159))) ?
                       (&((wire162 > (8'ha4)) ?
                           wire172 : $signed(wire160))) : $signed(((reg168 - wire172) ?
                           wire163 : wire159[(3'h4):(2'h3)]))));
  assign wire174 = (((&reg165) & $signed(($unsigned((8'ha7)) ?
                       (^wire171) : (8'hb0)))) < ({((8'hb3) ?
                           $signed(reg165) : wire164[(4'h8):(1'h0)]),
                       wire171} >> ($signed($unsigned(wire173)) ?
                       {$signed(wire159)} : $signed(reg170[(3'h7):(3'h4)]))));
  assign wire175 = (reg169[(4'hb):(3'h6)] ^~ wire174[(3'h7):(2'h2)]);
  assign wire176 = (wire163[(1'h1):(1'h0)] ?
                       (wire167[(3'h5):(1'h1)] ?
                           wire172[(3'h4):(1'h0)] : (~^$unsigned((~|wire171)))) : (((~&(wire172 ?
                               reg170 : wire158)) >>> reg165) ?
                           (-($signed(wire167) ?
                               reg170 : reg165)) : {$unsigned((wire175 ?
                                   (8'ha5) : wire173)),
                               $unsigned(reg169)}));
  always
    @(posedge clk) begin
      reg177 <= wire175[(3'h7):(3'h6)];
      reg178 <= ((+wire161) ?
          (reg165 >> wire173[(4'h9):(3'h4)]) : (+$signed(reg169[(4'h9):(3'h7)])));
      reg179 <= wire161;
    end
endmodule
