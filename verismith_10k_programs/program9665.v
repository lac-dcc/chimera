module top
#(parameter param153 = (({(((7'h43) ? (7'h42) : (8'hb2)) <= (^~(8'ha7)))} ? (~((~&(8'hba)) && ((8'ha0) ? (7'h42) : (8'hb2)))) : (((~(8'hb7)) ? (^~(8'hbf)) : ((8'ha0) & (8'ha6))) ? (((8'hb3) - (8'ha7)) - ((8'ha1) ? (8'h9d) : (8'hb6))) : ({(8'ha1), (8'hac)} ? (|(8'hb2)) : ((8'had) ? (8'hb9) : (8'ha5))))) ? ((((~|(8'ha7)) ? (~|(8'hb6)) : ((8'hb2) ~^ (8'hac))) || ((+(8'hbf)) ? ((8'hb5) ~^ (7'h40)) : ((8'hb6) ? (8'hb4) : (8'ha6)))) | ((((8'hb3) ? (8'ha5) : (8'ha9)) ? ((8'hbd) ^~ (8'ha2)) : ((7'h43) ? (8'ha7) : (8'hab))) << ((8'hac) == ((8'hb9) + (8'hbe))))) : (+(((!(8'hbe)) ? ((8'hac) <<< (8'hbc)) : (+(8'hb5))) | ((~(8'h9c)) ? {(8'hba)} : (~|(8'hb4)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire152;
  wire [(3'h4):(1'h0)] wire151;
  wire signed [(4'hf):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire145;
  wire signed [(3'h5):(1'h0)] wire144;
  wire [(4'he):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire133;
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(4'hb):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire145,
                 wire144,
                 wire143,
                 wire5,
                 wire133,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire5 = (-((wire1 >>> (&$signed(wire4))) ~^ {{wire2},
                     ($unsigned(wire4) | $unsigned(wire2))}));
  module6 #() modinst134 (.wire10(wire2), .y(wire133), .wire11(wire3), .clk(clk), .wire7(wire5), .wire9(wire0), .wire8(wire4));
  always
    @(posedge clk) begin
      reg135 <= wire133;
      if ((wire2 * ($signed({$signed(wire4), $unsigned(wire4)}) ?
          (((wire2 ? wire5 : wire0) + wire5) ?
              reg135 : $signed(wire0[(4'hc):(1'h0)])) : wire5)))
        begin
          reg136 <= (^~((wire133 <<< wire2[(4'ha):(4'ha)]) <= (^(^~(wire3 < wire0)))));
          if (($unsigned((wire3 >>> (^(wire1 - wire2)))) ?
              ((^($unsigned(wire5) || $unsigned(wire2))) ^ wire1) : (+{$signed(wire133),
                  reg136})))
            begin
              reg137 <= ({($signed({wire1}) == $signed((8'ha7)))} && ({{$unsigned(wire4)}} ?
                  ({((8'hb7) ? reg135 : wire3),
                      (|reg135)} ^ wire1[(2'h2):(2'h2)]) : (~|(wire1 ?
                      (wire133 ? reg136 : wire1) : wire4))));
              reg138 <= {reg137,
                  $unsigned((~^{(wire5 ? wire1 : (7'h40)),
                      reg137[(3'h4):(2'h3)]}))};
              reg139 <= wire1;
              reg140 <= {(+$signed(reg136)),
                  ({wire4[(3'h5):(3'h4)]} ?
                      ($unsigned((reg135 ?
                          wire133 : wire3)) - $signed({reg138})) : reg136)};
            end
          else
            begin
              reg137 <= (^(reg136[(3'h7):(3'h6)] + $signed({((8'haa) <= (8'h9c)),
                  $unsigned(reg140)})));
              reg138 <= (~$unsigned(reg137[(3'h4):(2'h2)]));
              reg139 <= wire4;
              reg140 <= wire1[(1'h0):(1'h0)];
            end
          reg141 <= $unsigned(reg135);
        end
      else
        begin
          reg136 <= $signed(wire3);
          reg137 <= $unsigned(((~reg138[(3'h7):(3'h7)]) ?
              ($unsigned(reg139) ?
                  $unsigned(wire3) : ($signed(wire1) ?
                      $signed(wire5) : (reg137 >> reg138))) : {(wire2[(3'h4):(2'h3)] ?
                      $signed(wire2) : (!wire5)),
                  ((reg138 << wire4) ? (-reg136) : (^~reg138))}));
          reg138 <= {($signed(((wire5 ?
                  reg135 : wire133) < {(8'hb0)})) << ($unsigned($unsigned(wire133)) ?
                  reg140[(3'h7):(3'h7)] : ({wire3, reg135} ?
                      (~^(8'hab)) : wire3)))};
          reg139 <= wire2[(2'h3):(2'h3)];
          if ($unsigned(reg136[(4'h8):(3'h6)]))
            begin
              reg140 <= (7'h44);
              reg141 <= (reg140[(3'h4):(2'h2)] ?
                  (~^$unsigned(reg141[(1'h1):(1'h1)])) : $signed(((reg140 | (^wire133)) ?
                      ({reg140} | $signed(reg136)) : {(^wire1),
                          $unsigned(reg140)})));
              reg142 <= (wire0 == $unsigned({reg135[(4'h9):(1'h1)],
                  {$signed((8'hbf)), wire5[(4'hf):(4'hd)]}}));
            end
          else
            begin
              reg140 <= wire3;
              reg141 <= ($unsigned(((wire2[(3'h5):(2'h3)] << (reg135 > reg135)) <= {reg139,
                  reg140})) <= $signed((reg135[(1'h1):(1'h1)] <= wire5[(5'h11):(4'hf)])));
              reg142 <= $unsigned(wire2[(2'h2):(2'h2)]);
            end
        end
    end
  assign wire143 = $unsigned(wire4[(3'h7):(3'h7)]);
  assign wire144 = wire133[(4'h9):(2'h3)];
  assign wire145 = (((($signed(wire4) ? $signed(wire1) : wire4) ?
                           ((!reg138) > $unsigned(reg141)) : reg138[(1'h1):(1'h1)]) ?
                       $unsigned(wire5[(2'h3):(1'h1)]) : wire0[(5'h10):(2'h3)]) - reg135);
  always
    @(posedge clk) begin
      reg146 <= $unsigned(reg136[(3'h4):(1'h0)]);
      reg147 <= (~|{($unsigned(wire143[(4'hd):(3'h6)]) ?
              wire133 : $unsigned((8'hb1))),
          $signed(($unsigned(wire144) ?
              (wire0 ? reg137 : reg135) : $unsigned(reg139)))});
      reg148 <= {(~^(8'hb2))};
      reg149 <= {(&wire143)};
    end
  assign wire150 = $signed(reg148[(1'h0):(1'h0)]);
  assign wire151 = (!(&((-(~^wire1)) - (^reg138))));
  assign wire152 = ($signed(reg146[(3'h7):(2'h3)]) ?
                       reg135[(3'h6):(3'h4)] : (^~(reg148[(2'h2):(2'h2)] ?
                           reg146[(2'h2):(2'h2)] : (!(wire133 ?
                               wire143 : wire133)))));
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire59;
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  assign y = {wire131,
                 wire112,
                 wire110,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire74,
                 wire61,
                 wire59,
                 reg76,
                 reg73,
                 reg72,
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
                 (1'h0)};
  module12 #() modinst60 (wire59, clk, wire9, wire7, wire8, wire10);
  assign wire61 = wire9;
  always
    @(posedge clk) begin
      reg62 <= $unsigned(wire59);
      if ({{wire11[(3'h7):(3'h4)], reg62[(1'h0):(1'h0)]}})
        begin
          reg63 <= (wire10[(1'h0):(1'h0)] ?
              {$unsigned((wire9 ? wire7 : (^wire7)))} : ({wire11[(2'h3):(1'h1)],
                      {(-wire7), (wire11 ? wire10 : reg62)}} ?
                  ($signed($signed(wire11)) ?
                      (reg62[(1'h0):(1'h0)] <<< wire10[(2'h2):(1'h1)]) : $signed(wire59[(2'h3):(2'h2)])) : $signed((~&wire59[(3'h5):(3'h5)]))));
        end
      else
        begin
          if ($unsigned(($unsigned((~|((8'ha6) < wire61))) && ({wire9[(2'h2):(1'h1)],
              (~|reg62)} <= $signed(reg62[(2'h2):(1'h1)])))))
            begin
              reg63 <= wire10[(3'h6):(1'h0)];
              reg64 <= (~&wire61);
              reg65 <= wire59[(2'h3):(1'h1)];
            end
          else
            begin
              reg63 <= (~|reg63[(4'ha):(3'h5)]);
              reg64 <= (((((wire7 ? wire59 : (8'h9f)) ?
                          $signed((8'hbd)) : reg62) > (wire10 ^~ (&wire7))) ?
                      reg63 : ((wire9 ?
                          (wire10 > (8'haf)) : (wire10 ?
                              wire8 : wire10)) << (~&{reg62}))) ?
                  ((|(~^wire61)) ?
                      {((~(8'haa)) ?
                              $signed(wire9) : $unsigned((8'h9f)))} : $unsigned(((reg63 ?
                          wire11 : (8'had)) | (wire7 ?
                          (8'ha4) : wire9)))) : $signed((8'hbb)));
              reg65 <= $signed({(wire9[(3'h4):(3'h4)] ?
                      {wire59} : $unsigned(((8'hba) ~^ (8'hb4)))),
                  ($signed((~wire10)) ?
                      ((~reg65) ? (^~(8'ha8)) : (!wire11)) : ((wire9 ?
                          wire9 : wire7) | (wire9 ? wire61 : reg65)))});
            end
          reg66 <= reg65[(2'h3):(2'h2)];
          if ((~|(|{$signed((wire11 & wire11))})))
            begin
              reg67 <= (-$unsigned({(&wire9[(3'h5):(2'h3)]),
                  ((~&wire59) ? (wire59 ? wire7 : wire11) : (&(7'h41)))}));
              reg68 <= wire7[(1'h0):(1'h0)];
              reg69 <= $unsigned(({$unsigned($unsigned(reg65))} - {(8'hb2),
                  reg62}));
              reg70 <= (~((^($unsigned(reg69) ?
                  reg63[(1'h0):(1'h0)] : wire11)) | (~&reg64)));
              reg71 <= $unsigned($signed((~&{$signed((8'hb8))})));
            end
          else
            begin
              reg67 <= (~wire7[(1'h1):(1'h1)]);
              reg68 <= (8'h9f);
            end
          reg72 <= reg65;
          reg73 <= {(($signed((~|reg72)) >= reg68[(3'h7):(2'h2)]) ?
                  (+$signed((&(8'hb2)))) : wire10)};
        end
    end
  assign wire74 = (reg71[(4'hc):(1'h0)] ?
                      ($signed(reg64) ?
                          wire59[(1'h0):(1'h0)] : (^$unsigned(wire11[(3'h7):(3'h6)]))) : $unsigned({(~&wire9[(5'h10):(4'hf)]),
                          reg70[(2'h3):(2'h2)]}));
  assign wire75 = (~(~^(wire9[(5'h14):(5'h10)] ?
                      reg68 : $unsigned((wire10 ? wire74 : wire74)))));
  always
    @(posedge clk) begin
      reg76 <= $unsigned(reg64);
    end
  assign wire77 = $signed((~$signed(({reg76, reg66} ?
                      $signed(wire7) : $unsigned(reg72)))));
  assign wire78 = ((+(($signed(wire11) ? (wire7 ? wire11 : wire10) : wire61) ?
                          (((8'had) <<< wire59) <<< $signed(wire75)) : {$unsigned((8'ha0))})) ?
                      (^~wire77) : $signed(reg65));
  assign wire79 = (~{($unsigned(reg64[(4'hd):(2'h2)]) ?
                          (-(reg63 ?
                              reg68 : wire59)) : ($unsigned(reg63) & (wire7 == reg64)))});
  assign wire80 = ($signed(reg76[(2'h3):(2'h3)]) & reg66[(1'h0):(1'h0)]);
  module81 #() modinst111 (.wire83(reg63), .wire82(wire9), .y(wire110), .wire84(wire77), .clk(clk), .wire85(reg70));
  assign wire112 = reg68;
  module113 #() modinst132 (.y(wire131), .wire117(wire74), .wire115(wire11), .wire114(reg65), .clk(clk), .wire116(reg64));
endmodule

module module113  (y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire117;
  input wire [(5'h13):(1'h0)] wire116;
  input wire [(4'ha):(1'h0)] wire115;
  input wire signed [(4'he):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire118;
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire118,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire118 = (!$signed(wire115));
  always
    @(posedge clk) begin
      reg119 <= $unsigned((~&(wire117 ? wire118 : (&wire115))));
      reg120 <= {(((^~(wire115 ? (8'ha2) : wire115)) ?
              $signed($signed(reg119)) : reg119[(1'h0):(1'h0)]) * (!((reg119 == reg119) >> $unsigned(wire116)))),
          $signed((((wire116 ? wire117 : wire116) ?
              reg119 : $signed(wire115)) || wire117[(2'h2):(1'h0)]))};
      reg121 <= reg119;
      if (reg119[(1'h0):(1'h0)])
        begin
          reg122 <= (8'hb0);
          if ($unsigned((wire114[(4'hd):(3'h7)] ?
              (($signed(reg120) ?
                  {reg122, reg121} : {reg119,
                      reg122}) - reg121) : {(~^{reg122})})))
            begin
              reg123 <= $signed(wire114);
              reg124 <= reg120;
              reg125 <= $signed($unsigned(((~^{(8'hb4)}) ?
                  ((reg124 ? reg119 : wire117) ?
                      wire114 : (reg119 ?
                          reg121 : wire116)) : (~^(~|reg119)))));
            end
          else
            begin
              reg123 <= $signed($signed($unsigned(({reg125,
                  reg121} | {wire117}))));
              reg124 <= (~|((-reg122[(3'h5):(3'h5)]) ? wire116 : (8'ha9)));
              reg125 <= ($signed(reg121[(2'h2):(1'h0)]) * wire114);
              reg126 <= reg119;
              reg127 <= $signed((~|reg126));
            end
          reg128 <= reg124[(3'h5):(2'h2)];
        end
      else
        begin
          reg122 <= (wire117[(4'h8):(3'h6)] ? $unsigned(wire114) : reg125);
          reg123 <= (+(8'haf));
          reg124 <= reg123[(4'ha):(4'ha)];
        end
    end
  assign wire129 = $unsigned((reg128 ^~ reg126[(1'h1):(1'h1)]));
  assign wire130 = (reg123 * (+($unsigned(wire117) | (~&(reg128 ?
                       (8'hbd) : reg119)))));
endmodule

module module81
#(parameter param108 = ({({(7'h41), ((8'h9d) ? (7'h41) : (8'ha0))} ? (((8'ha5) + (7'h44)) != (~(8'haf))) : (((7'h41) ? (8'hae) : (8'haf)) ? ((7'h40) ? (7'h42) : (8'hb8)) : (8'hbe)))} ? {((((8'hb5) || (8'hbd)) <<< ((7'h43) >> (8'hbd))) ? (((7'h44) ? (8'hac) : (8'hb7)) ? ((8'haa) ? (8'hb3) : (8'hbd)) : ((8'ha4) <<< (8'ha4))) : (((8'ha9) ? (8'haa) : (8'hb9)) ? ((8'hab) ? (8'ha9) : (8'haa)) : ((8'ha2) ? (8'hb0) : (8'had)))), ((~|((8'ha5) ? (8'hb3) : (8'ha7))) ? {{(8'h9f), (8'hae)}} : {((8'hbc) ? (8'hb8) : (8'hae)), ((8'ha4) ? (8'hbf) : (8'ha4))})} : {{(-((8'hb3) * (8'hb8)))}}), 
parameter param109 = (^(((!(param108 ? param108 : param108)) ? {param108} : (|(|param108))) ? (^((param108 ? param108 : param108) > (&param108))) : (param108 ^ param108))))
(y, clk, wire85, wire84, wire83, wire82);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire85;
  input wire signed [(5'h12):(1'h0)] wire84;
  input wire [(3'h6):(1'h0)] wire83;
  input wire signed [(5'h14):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire [(4'h8):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire86;
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire91,
                 wire86,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire86 = $unsigned(wire85[(4'h8):(3'h4)]);
  always
    @(posedge clk) begin
      reg87 <= (8'hb3);
    end
  always
    @(posedge clk) begin
      reg88 <= (((wire84 ?
                  $unsigned($unsigned(wire82)) : (wire83[(3'h6):(2'h2)] >= {wire84,
                      (8'hb4)})) ?
              (-$signed(wire82)) : (wire84[(4'hb):(3'h6)] | ((-(8'haa)) <<< (8'hab)))) ?
          $signed((8'hb1)) : (wire84[(5'h10):(3'h4)] ?
              ({$unsigned(wire83)} == $unsigned($unsigned(wire82))) : (wire84[(1'h1):(1'h1)] && (~|(wire85 ~^ wire83)))));
      reg89 <= wire85[(1'h1):(1'h0)];
      reg90 <= ((~^$signed($signed({reg89, wire82}))) ?
          (^(reg89 <= (wire82[(3'h7):(3'h5)] == wire84[(4'he):(4'ha)]))) : $signed(reg88[(2'h2):(1'h0)]));
    end
  assign wire91 = ($signed(wire86) + $signed(((wire83 ?
                      {wire82} : $signed(reg87)) + reg88)));
  always
    @(posedge clk) begin
      reg92 <= $signed($signed($signed({$unsigned(wire82), (|reg87)})));
      reg93 <= reg90;
      reg94 <= reg89;
    end
  always
    @(posedge clk) begin
      reg95 <= reg94[(1'h0):(1'h0)];
      reg96 <= (|wire86);
      reg97 <= (reg88 != ((($unsigned((7'h41)) | $unsigned(reg94)) ?
          (~(&reg94)) : reg92[(2'h3):(2'h3)]) <= ((~&{wire91}) ?
          {wire85[(1'h0):(1'h0)]} : (~^((8'h9e) ? reg90 : reg95)))));
      reg98 <= $signed((&($unsigned((wire91 + (8'ha2))) ?
          reg90 : $unsigned(wire91[(4'h8):(1'h1)]))));
    end
  assign wire99 = (~|({(reg94 ? (reg98 << reg88) : ((8'hb2) ^~ wire85)),
                      ((wire84 >= wire84) || (^~(8'hbc)))} <<< (8'hb6)));
  assign wire100 = $unsigned(wire99);
  assign wire101 = {(^(+(reg94[(1'h1):(1'h1)] ~^ $signed(reg88)))),
                       (($signed(((8'hb9) ? wire85 : (8'ha8))) ?
                           wire85 : (8'haf)) | ((8'ha1) != wire86))};
  assign wire102 = (!($unsigned((8'had)) ?
                       (reg96[(2'h2):(1'h0)] >= ({reg93,
                           reg98} - (wire101 << wire85))) : ((((8'haa) ?
                               wire82 : reg96) && {wire86}) ?
                           (-reg98[(2'h3):(2'h3)]) : $unsigned($unsigned(reg93)))));
  assign wire103 = (&(reg88[(1'h0):(1'h0)] ^ (~^wire82)));
  assign wire104 = (-$signed($signed($signed((~&wire100)))));
  assign wire105 = ($signed($signed(({reg88, wire99} ? {reg92} : wire103))) ?
                       (~|((|wire99) ?
                           $unsigned($signed(reg89)) : (^wire82[(2'h2):(1'h1)]))) : {(&({wire101,
                               wire86} >>> $signed((8'hb6)))),
                           {reg96}});
  assign wire106 = reg98[(1'h1):(1'h0)];
  assign wire107 = wire100;
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire19;
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  assign y = {wire52,
                 wire49,
                 wire48,
                 wire47,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg51,
                 reg50,
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
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= {(({((8'ha3) ? wire16 : (7'h41)),
              wire14[(1'h0):(1'h0)]} >= ($unsigned(wire16) ?
              wire15 : $signed(wire15))) >= (+wire13[(4'hb):(3'h6)]))};
      reg18 <= (^~$signed((^((wire14 == wire15) ?
          $unsigned(wire13) : $signed((8'hb6))))));
    end
  assign wire19 = wire16;
  assign wire20 = wire14;
  assign wire21 = $unsigned(({$signed((wire16 ? reg17 : wire15)),
                      {$signed(wire19),
                          $signed(wire20)}} ^ $signed(wire13[(4'ha):(3'h4)])));
  assign wire22 = ((wire15[(2'h3):(1'h1)] <= wire21) ?
                      reg17[(4'hb):(4'ha)] : $signed(wire15));
  assign wire23 = $unsigned((8'hb2));
  assign wire24 = (~^$unsigned($unsigned($unsigned((-wire22)))));
  assign wire25 = $signed($unsigned(wire24[(4'h8):(2'h3)]));
  assign wire26 = (((((+wire16) ~^ {wire25,
                      wire22}) != ($unsigned(wire13) != ((8'hb8) ?
                      reg17 : wire23))) == $signed(wire19[(3'h5):(2'h3)])) | $signed($unsigned($signed((|reg18)))));
  assign wire27 = (-(+$signed($signed((wire13 ? wire19 : wire20)))));
  assign wire28 = $signed((~|($unsigned((+wire27)) ^~ wire15)));
  assign wire29 = (~&wire13);
  always
    @(posedge clk) begin
      if ({(wire22 ? {(^reg18)} : wire24[(2'h2):(1'h1)])})
        begin
          reg30 <= (((($unsigned(wire25) ?
                  (wire23 ? wire26 : wire15) : wire19[(1'h1):(1'h1)]) ?
              (^~{wire16}) : (8'h9c)) >>> $unsigned((~|wire27[(3'h4):(3'h4)]))) | $unsigned($signed(((wire15 ?
              wire13 : wire15) ^ ((8'hbd) && wire28)))));
          reg31 <= wire28;
          reg32 <= wire21;
          reg33 <= $signed($unsigned($signed(reg18)));
          reg34 <= $unsigned($unsigned(({(&wire16)} < ($unsigned((8'hbc)) || $unsigned(reg33)))));
        end
      else
        begin
          reg30 <= wire16[(3'h4):(3'h4)];
          if ($unsigned({{$signed($unsigned(reg30)),
                  ((+wire26) + (~^wire26))}}))
            begin
              reg31 <= (!{$signed(({wire23} ? $unsigned(wire26) : wire23))});
              reg32 <= $signed((|(^$unsigned($unsigned(reg18)))));
              reg33 <= reg31[(2'h2):(2'h2)];
              reg34 <= ($signed(($signed((^~wire26)) <<< ($signed(reg17) ?
                  {wire22} : $signed(reg34)))) != $unsigned(wire23[(3'h6):(1'h1)]));
            end
          else
            begin
              reg31 <= $signed((reg31[(4'he):(3'h7)] ?
                  $signed((|wire14)) : $signed((wire28 ?
                      (^~wire21) : $unsigned(wire19)))));
              reg32 <= wire23;
            end
        end
      if (((wire13[(2'h3):(1'h0)] || (($unsigned(wire25) << $signed(wire20)) ?
          (~|wire15) : $unsigned(reg34))) && ((~|$signed(wire23[(4'hb):(1'h1)])) ?
          $signed((&$unsigned((8'ha6)))) : reg33)))
        begin
          if (wire19[(3'h7):(1'h1)])
            begin
              reg35 <= (+wire25);
            end
          else
            begin
              reg35 <= (^~$signed(wire19));
              reg36 <= ({reg33, reg34} && ((wire24[(4'h9):(4'h8)] ?
                      ((reg34 & wire23) || $unsigned(reg30)) : $unsigned(wire26)) ?
                  (~|{reg30, wire20[(2'h3):(2'h2)]}) : ((wire20[(4'hd):(1'h0)] ?
                          $signed(reg31) : wire26) ?
                      ((wire24 ~^ reg17) * $signed(wire26)) : wire21[(2'h3):(2'h2)])));
              reg37 <= (~{(reg17 >= reg34)});
              reg38 <= (reg17[(2'h3):(1'h1)] < (((!$unsigned(wire16)) ?
                      ($unsigned(wire19) & reg32[(3'h6):(1'h1)]) : $unsigned((reg17 ~^ reg35))) ?
                  ({(8'h9f)} >>> ((reg36 > wire28) + wire14[(5'h12):(1'h1)])) : $signed($signed($signed(wire14)))));
              reg39 <= reg38;
            end
          reg40 <= ($unsigned(reg34) ?
              ((!reg35[(4'hf):(4'hd)]) ?
                  $signed(wire29) : reg30) : (+wire29[(3'h5):(1'h0)]));
          reg41 <= $signed((wire21 + $signed($unsigned(wire25))));
          if ($signed((|$signed(({reg35, wire24} ?
              (reg35 ? reg34 : reg32) : (8'hb4))))))
            begin
              reg42 <= wire16;
              reg43 <= reg39[(3'h4):(2'h3)];
            end
          else
            begin
              reg42 <= wire27;
              reg43 <= (~|(8'ha0));
              reg44 <= wire27;
            end
          reg45 <= wire27;
        end
      else
        begin
          reg35 <= reg45[(3'h5):(1'h0)];
          reg36 <= (~&(^~$unsigned((~^(+reg32)))));
          reg37 <= reg18[(4'hc):(3'h5)];
          reg38 <= $signed($unsigned((wire29 ?
              ($signed(reg33) < $unsigned(wire22)) : {$signed(reg31)})));
        end
      reg46 <= {(wire14[(5'h12):(3'h4)] + wire23)};
    end
  assign wire47 = (reg18 <= {(reg39[(3'h6):(3'h6)] & $unsigned(reg40[(1'h0):(1'h0)]))});
  assign wire48 = (({$unsigned($unsigned((8'ha2))),
                          (wire25[(3'h4):(1'h0)] ?
                              (wire22 ? wire24 : wire16) : $signed((8'hbe)))} ?
                      {($unsigned(wire29) >>> (reg46 || (8'ha1))),
                          ((^wire14) >= $signed((8'hb7)))} : $signed({(wire14 ^ reg30)})) != $signed((wire13 > $signed(reg37[(4'hd):(3'h7)]))));
  assign wire49 = {(reg18 >= reg34), (&(wire19 << $unsigned(wire23)))};
  always
    @(posedge clk) begin
      reg50 <= $unsigned((&$unsigned($signed((^reg17)))));
      reg51 <= $signed($unsigned(((^reg50[(1'h1):(1'h1)]) ?
          ((&(8'hab)) ? $unsigned(wire47) : $unsigned(reg35)) : ((|reg35) ?
              wire22[(4'hb):(1'h1)] : (8'hbc)))));
    end
  assign wire52 = ({reg35[(5'h11):(3'h4)],
                      wire27} >>> $signed($unsigned((reg38 ?
                      (reg51 == reg46) : (reg38 ? reg45 : reg44)))));
  always
    @(posedge clk) begin
      reg53 <= $unsigned(reg35);
      if (reg35)
        begin
          reg54 <= wire48;
          reg55 <= (~|$signed($unsigned({$signed(reg46), $signed(wire14)})));
        end
      else
        begin
          reg54 <= {$signed(wire27)};
          reg55 <= reg17;
          reg56 <= $signed(wire20[(4'h8):(4'h8)]);
          reg57 <= $unsigned(reg44);
          reg58 <= wire47;
        end
    end
endmodule
