module top
#(parameter param162 = (((((-(8'ha0)) == (~&(8'hbc))) <= {(~^(8'ha2))}) ^ ((~^((8'hab) + (8'had))) < (((7'h43) ? (8'hb7) : (8'hae)) && ((8'h9f) ? (8'hbb) : (8'hb2))))) + ((((^~(8'hb1)) && {(8'h9d), (7'h44)}) >> (~&(8'hac))) & ((~((8'hba) ? (8'hb4) : (8'hb2))) * {(8'ha2), ((8'hbc) ? (8'hbe) : (8'ha3))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire161;
  wire [(3'h4):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire144;
  wire signed [(2'h2):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  wire [(3'h5):(1'h0)] wire141;
  wire [(5'h14):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire124;
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(4'hd):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(5'h10):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg [(3'h7):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire126,
                 wire4,
                 wire5,
                 wire6,
                 wire124,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
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
                 reg127,
                 (1'h0)};
  assign wire4 = (wire0[(4'hb):(3'h7)] ?
                     (wire2 - $unsigned($signed({(8'h9d),
                         wire3}))) : (&$signed(wire1)));
  assign wire5 = ($signed(wire2) ?
                     ({$signed({(8'hbf),
                             wire4})} >= (^wire1)) : $unsigned($unsigned({wire4[(3'h7):(3'h5)],
                         $unsigned(wire1)})));
  assign wire6 = {(wire5[(4'ha):(3'h7)] ? wire2[(3'h6):(3'h5)] : wire4)};
  module7 #() modinst125 (.clk(clk), .wire12(wire3), .wire9(wire4), .wire10(wire2), .y(wire124), .wire8(wire5), .wire11(wire6));
  assign wire126 = wire1;
  always
    @(posedge clk) begin
      if (wire124)
        begin
          reg127 <= ($unsigned({wire124,
              (~|$signed(wire5))}) == wire6[(3'h4):(1'h0)]);
        end
      else
        begin
          reg127 <= $signed($signed($signed(wire0[(4'hb):(3'h4)])));
          if (((reg127 ?
                  (~{wire3[(2'h2):(2'h2)]}) : ((~$unsigned(wire1)) >> ((wire1 ?
                      wire6 : wire124) ^~ $unsigned(wire0)))) ?
              wire3 : wire0))
            begin
              reg128 <= wire2[(4'hb):(4'h8)];
              reg129 <= $unsigned($unsigned((-wire1)));
            end
          else
            begin
              reg128 <= wire2[(4'hc):(3'h5)];
              reg129 <= reg127;
              reg130 <= ((+$signed(((wire3 ? (8'ha2) : wire124) ?
                      {wire3, wire5} : (wire6 <<< wire124)))) ?
                  reg129[(2'h3):(2'h2)] : $unsigned(wire126));
              reg131 <= $signed($signed($unsigned($unsigned($signed((8'hbd))))));
            end
          if (wire126)
            begin
              reg132 <= $signed(((^~((^~reg127) ?
                  wire4 : $unsigned(reg127))) >= (^~$signed((wire3 ?
                  wire6 : (8'hb1))))));
              reg133 <= $signed(reg127);
              reg134 <= $unsigned(reg128[(4'h8):(1'h1)]);
            end
          else
            begin
              reg132 <= (8'ha6);
              reg133 <= $unsigned(({$signed(wire0),
                  {wire5, (reg134 ? reg127 : wire1)}} << $unsigned(wire6)));
            end
        end
      reg135 <= $signed($unsigned(((^$unsigned(wire0)) | $unsigned({wire6,
          (8'h9c)}))));
      reg136 <= $unsigned(wire4);
      reg137 <= wire6;
    end
  assign wire138 = wire0;
  assign wire139 = (~reg134[(4'ha):(2'h2)]);
  assign wire140 = {$signed(wire139[(4'hb):(4'hb)])};
  assign wire141 = reg137;
  assign wire142 = reg131[(2'h2):(2'h2)];
  assign wire143 = (~&wire138);
  assign wire144 = $unsigned(((reg134 >> $signed($unsigned(wire142))) < $signed((8'haf))));
  always
    @(posedge clk) begin
      reg145 <= {($signed(reg127) ?
              (8'hb6) : ((&(wire126 ?
                  wire6 : wire138)) < $unsigned(wire141[(3'h4):(1'h1)]))),
          (wire141 - (-($unsigned(reg135) ? reg137 : $unsigned((8'hb3)))))};
      reg146 <= $signed((wire143[(1'h0):(1'h0)] ?
          wire139[(4'h9):(3'h5)] : $signed(reg129[(2'h3):(2'h3)])));
      reg147 <= wire2;
      reg148 <= reg127[(2'h3):(2'h2)];
      reg149 <= ($signed($unsigned($unsigned(wire2))) ?
          $signed(wire3[(2'h2):(1'h0)]) : ($unsigned(wire142) ?
              (&reg137[(2'h2):(1'h0)]) : reg148[(3'h6):(2'h3)]));
    end
  always
    @(posedge clk) begin
      if ((~$signed((!(+wire140[(4'h9):(2'h2)])))))
        begin
          reg150 <= reg129[(1'h0):(1'h0)];
          reg151 <= ($signed((~^$unsigned($signed(reg135)))) ?
              (^(+reg146)) : $unsigned((({wire144, wire142} ^ (-wire2)) ?
                  $unsigned($unsigned(reg128)) : reg146[(4'ha):(4'ha)])));
        end
      else
        begin
          reg150 <= $signed($signed(($signed((^reg151)) >>> ((reg148 ?
              reg128 : reg150) >>> {wire139}))));
          reg151 <= (((^wire126) ?
                  (-$unsigned({reg146})) : wire140[(1'h1):(1'h0)]) ?
              (^~wire142[(2'h3):(1'h1)]) : wire144[(4'hb):(3'h6)]);
          if ((|(~|(wire139[(3'h7):(3'h6)] | (reg146 - (reg149 ?
              reg128 : wire126))))))
            begin
              reg152 <= (&wire141[(1'h0):(1'h0)]);
              reg153 <= (|$signed($unsigned((~{(8'hb3), reg132}))));
            end
          else
            begin
              reg152 <= reg133[(1'h0):(1'h0)];
              reg153 <= wire126[(4'h9):(1'h1)];
            end
        end
      reg154 <= $signed(reg132);
      if ({(+((!reg148[(2'h2):(1'h0)]) ?
              $unsigned($signed(reg154)) : ((wire143 || reg153) ?
                  wire143 : $signed((8'ha4)))))})
        begin
          reg155 <= ((-reg135) - $signed({({(8'ha4)} <= (reg135 & reg127))}));
          reg156 <= (((8'hba) + ((8'hbc) * $signed((wire124 ?
              reg131 : reg137)))) & wire5);
          reg157 <= (^~reg153);
        end
      else
        begin
          reg155 <= (~^(~|(reg154[(4'hc):(1'h1)] ?
              (8'hb7) : $signed(wire138))));
          reg156 <= reg154[(1'h0):(1'h0)];
        end
      reg158 <= $unsigned({(~^wire138)});
      reg159 <= reg128;
    end
  assign wire160 = {wire3[(1'h0):(1'h0)],
                       ((^~(^wire6)) ?
                           $signed($signed((!reg129))) : (($unsigned(reg153) ?
                                   ((8'hba) || wire140) : reg154[(3'h5):(1'h0)]) ?
                               reg129[(1'h1):(1'h1)] : wire140))};
  assign wire161 = $unsigned(((reg150 ?
                       (!(reg131 == wire3)) : $unsigned($signed(reg130))) < {{wire124[(4'hc):(3'h7)],
                           wire140[(3'h6):(1'h0)]},
                       (&reg146)}));
endmodule

module module7
#(parameter param123 = ((((^((8'hb8) >>> (8'ha5))) ? {(8'hac)} : ((~(8'hac)) ? ((8'ha5) <<< (8'ha3)) : (+(8'hb1)))) < ((~|((7'h41) ? (8'hac) : (8'ha4))) == (!((8'ha4) ? (8'hb5) : (8'hb2))))) == (({(8'ha4), ((8'ha4) >> (8'ha3))} ? (~^(-(8'ha8))) : {((8'ha6) > (8'hb3))}) ? (+(((8'h9f) + (8'ha6)) ^~ ((8'h9d) ? (8'had) : (8'hbf)))) : (-(((8'hba) ? (8'hab) : (8'ha1)) ? ((8'hb4) ? (8'ha6) : (7'h43)) : ((7'h42) - (8'h9d)))))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire122;
  wire [(4'he):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire114;
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire116,
                 wire53,
                 wire14,
                 wire13,
                 wire55,
                 wire56,
                 wire91,
                 wire114,
                 reg118,
                 (1'h0)};
  assign wire13 = wire11;
  assign wire14 = $signed((!$unsigned((&$unsigned(wire8)))));
  module15 #() modinst54 (.wire17(wire13), .wire19(wire9), .y(wire53), .wire16(wire12), .wire20(wire11), .clk(clk), .wire18(wire10));
  assign wire55 = wire10[(4'h8):(3'h6)];
  assign wire56 = wire55[(1'h0):(1'h0)];
  module57 #() modinst92 (.wire60(wire9), .wire59(wire11), .wire61(wire10), .y(wire91), .wire58(wire56), .clk(clk));
  module93 #() modinst115 (wire114, clk, wire10, wire91, wire11, wire13, wire56);
  assign wire116 = {wire114};
  assign wire117 = (~&((($unsigned(wire12) ? wire53 : wire53) << wire14) ?
                       $unsigned($unsigned(wire11[(2'h3):(1'h1)])) : $unsigned((wire12 ?
                           (~|wire12) : $unsigned((8'ha9))))));
  always
    @(posedge clk) begin
      reg118 <= wire14[(3'h6):(3'h4)];
    end
  assign wire119 = ({wire91[(5'h11):(1'h0)], {wire53}} ?
                       ({(~&(wire11 < (7'h42)))} ?
                           wire8[(3'h4):(3'h4)] : wire56[(5'h12):(4'h8)]) : (wire53[(3'h7):(1'h1)] ?
                           $signed(((wire55 ? wire53 : (8'hb8)) ?
                               (wire9 ?
                                   wire117 : wire9) : wire12[(1'h0):(1'h0)])) : (wire53[(1'h0):(1'h0)] * $unsigned((&wire10)))));
  assign wire120 = $signed($signed({$signed((~wire9)),
                       ($unsigned((8'hb9)) << wire114[(3'h7):(3'h4)])}));
  assign wire121 = $signed((wire14[(3'h4):(1'h1)] <= $signed({wire8[(2'h2):(1'h1)]})));
  assign wire122 = (wire114 >> ($signed(wire117[(4'ha):(1'h0)]) - wire91[(3'h5):(2'h2)]));
endmodule

module module93
#(parameter param113 = ((^~({((8'ha1) * (8'had)), {(8'h9c)}} ^~ (~{(7'h43)}))) ? ({(~|(!(8'ha8))), (((8'hba) ~^ (8'ha7)) ? (~(8'ha2)) : (+(8'ha3)))} ? ((((8'hbd) >= (8'hae)) ? ((8'hb1) ? (7'h43) : (8'ha9)) : (^(8'h9d))) ? (~|((8'h9f) <<< (8'hbf))) : (((8'hbb) < (8'h9d)) << {(8'hb8), (8'hb1)})) : ((~^{(8'hb4)}) ? (((8'had) >> (8'haa)) ? (8'ha0) : ((7'h43) ? (8'hbf) : (8'ha5))) : {(!(8'hba))})) : {((((8'hab) ? (7'h42) : (7'h41)) ? {(8'h9c)} : ((8'hb7) ? (8'ha2) : (8'ha9))) ^ (~((8'had) <<< (8'hac))))}))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire98;
  input wire signed [(4'hc):(1'h0)] wire97;
  input wire [(2'h2):(1'h0)] wire96;
  input wire signed [(5'h10):(1'h0)] wire95;
  input wire signed [(5'h12):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(3'h5):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire signed [(3'h7):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 (1'h0)};
  assign wire99 = wire95;
  assign wire100 = (~|(~wire99[(2'h2):(1'h0)]));
  assign wire101 = (wire94[(2'h2):(1'h1)] - wire100);
  assign wire102 = {{wire97[(4'ha):(4'h8)]},
                       $unsigned($unsigned($signed(wire95[(3'h6):(1'h0)])))};
  assign wire103 = (+$signed(wire101[(3'h6):(1'h0)]));
  assign wire104 = $signed((wire97[(4'h9):(1'h0)] ?
                       {$signed({wire97, (8'hb5)}),
                           (wire99 ?
                               wire96[(1'h0):(1'h0)] : {wire101,
                                   wire97})} : wire95[(2'h2):(2'h2)]));
  assign wire105 = wire101;
  assign wire106 = ((~&wire94[(2'h2):(2'h2)]) ?
                       wire103[(1'h0):(1'h0)] : wire105[(2'h2):(1'h1)]);
  assign wire107 = (-(~|$signed($signed($unsigned(wire103)))));
  assign wire108 = (wire101[(4'hb):(1'h0)] || (wire96 ?
                       ($signed(wire106[(1'h1):(1'h0)]) ?
                           ($signed(wire98) || wire102) : $unsigned({wire103,
                               wire99})) : wire99[(3'h6):(3'h5)]));
  assign wire109 = ((wire98[(3'h6):(3'h4)] ?
                           $signed($signed((wire107 & wire94))) : wire94) ?
                       (wire101[(4'hd):(3'h7)] ?
                           $signed(($unsigned(wire108) >>> wire107[(3'h5):(3'h4)])) : $unsigned($signed($unsigned(wire97)))) : $unsigned(wire102));
  assign wire110 = (&((!wire94[(4'h9):(4'h8)]) ?
                       wire106[(2'h2):(2'h2)] : {$unsigned($signed(wire97)),
                           (^~$signed(wire99))}));
  assign wire111 = $unsigned(wire105[(2'h2):(1'h1)]);
  assign wire112 = wire105;
endmodule

module module57
#(parameter param89 = (((-(((8'hae) * (8'hb7)) >>> {(8'hb3), (8'hb8)})) ? {(|(!(8'ha0))), ((^~(8'hbb)) ? (+(8'ha1)) : (~|(8'ha1)))} : ({(|(8'ha3))} << (((8'hbe) ? (8'ha9) : (8'h9e)) ? ((8'hb5) ? (8'ha8) : (8'ha4)) : (&(8'ha6))))) ? ((^~(((8'hbb) > (8'ha1)) << (7'h40))) ^ ((((8'hba) ? (8'ha2) : (8'hab)) < ((8'ha4) & (8'h9e))) == {(^~(7'h42)), (~&(8'hac))})) : {((~((8'hb7) << (7'h43))) && {{(7'h43)}})}), 
parameter param90 = (8'hae))
(y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire61;
  input wire signed [(5'h15):(1'h0)] wire60;
  input wire signed [(4'ha):(1'h0)] wire59;
  input wire [(4'he):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  assign y = {wire88,
                 wire86,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg87,
                 reg85,
                 reg84,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire62 = (-$unsigned(wire61[(4'h9):(2'h2)]));
  assign wire63 = {(8'hbd)};
  assign wire64 = wire63;
  assign wire65 = $unsigned(wire60);
  assign wire66 = (~&$unsigned($unsigned((wire64[(2'h2):(1'h0)] ?
                      wire61[(3'h6):(3'h6)] : (wire65 - wire63)))));
  assign wire67 = (^((wire62[(3'h6):(3'h4)] && ($signed(wire58) ?
                          (8'ha4) : $unsigned(wire59))) ?
                      wire65 : (wire64[(2'h2):(2'h2)] ?
                          $signed($signed(wire66)) : (+$signed(wire59)))));
  always
    @(posedge clk) begin
      if ((8'hab))
        begin
          reg68 <= wire63;
          reg69 <= ((8'hb6) >= wire65[(4'h9):(4'h9)]);
        end
      else
        begin
          reg68 <= (&{((((8'haf) <<< wire59) ?
                  wire64 : (wire59 & wire58)) <<< $unsigned($signed(wire58))),
              wire66[(1'h1):(1'h0)]});
          reg69 <= $unsigned(wire59[(1'h0):(1'h0)]);
          reg70 <= $unsigned({$unsigned((|wire60)), wire66[(3'h5):(1'h0)]});
        end
      reg71 <= $signed(((((wire63 <<< wire59) ?
          wire63[(2'h2):(1'h1)] : (&reg68)) < ($signed(wire61) <= (wire61 ?
          (8'hbd) : wire62))) <<< (wire64 ~^ $unsigned(wire61[(4'ha):(3'h5)]))));
      reg72 <= $signed(wire66);
      if (reg71)
        begin
          reg73 <= (~&$unsigned($signed($unsigned({wire65, reg70}))));
        end
      else
        begin
          reg73 <= wire58[(1'h0):(1'h0)];
          reg74 <= (reg68[(2'h2):(2'h2)] & $unsigned($unsigned(reg68[(1'h1):(1'h0)])));
        end
      reg75 <= (reg71 < (^(~|(-$signed(reg74)))));
    end
  assign wire76 = $signed(($unsigned(wire60) | wire65[(3'h5):(2'h3)]));
  assign wire77 = {((!{(8'hb1)}) & ($signed((~^reg72)) >= (wire61[(4'he):(4'ha)] > (reg69 ?
                          wire64 : wire67))))};
  assign wire78 = ({wire65} ?
                      wire63 : ((~wire62) ?
                          $unsigned(reg71) : reg71[(3'h7):(2'h3)]));
  assign wire79 = wire63[(4'hb):(3'h5)];
  assign wire80 = wire60;
  assign wire81 = $unsigned($unsigned(wire59));
  assign wire82 = {((reg69 & reg68[(1'h1):(1'h1)]) && reg75),
                      (~|(($signed(wire80) >> (8'h9d)) & wire59))};
  assign wire83 = wire67;
  always
    @(posedge clk) begin
      reg84 <= $unsigned(wire58);
      reg85 <= (|wire67[(3'h4):(1'h0)]);
    end
  assign wire86 = wire76;
  always
    @(posedge clk) begin
      reg87 <= ($signed((8'h9c)) ^~ $signed((($unsigned(reg70) == $unsigned(reg70)) && {(reg69 - (8'hb6))})));
    end
  assign wire88 = wire62[(1'h1):(1'h1)];
endmodule

module module15
#(parameter param52 = ((((((8'hbd) ? (8'ha8) : (8'ha8)) | ((8'hbf) ? (8'hba) : (8'haa))) < (((8'ha3) >= (8'had)) ? (~^(8'hbd)) : ((8'had) < (8'ha4)))) ? ((!((8'hb4) * (8'ha9))) ? (((8'h9c) | (8'hbf)) ? {(8'ha8), (7'h40)} : ((8'hbb) ? (8'hb2) : (8'ha9))) : (((8'hb4) ? (8'ha6) : (8'hb9)) ? ((8'h9d) ? (8'had) : (8'ha9)) : ((8'haa) < (8'hbc)))) : (~&((-(8'hb4)) ^~ ((8'hbf) ? (8'hb0) : (8'h9c))))) <<< (((((8'hb3) > (7'h41)) ? (^(8'hbc)) : ((8'ha0) ? (8'had) : (8'ha5))) << (^~((8'hb7) ? (8'h9e) : (8'ha5)))) ? ({((8'hbf) ? (8'hb0) : (8'had))} ? ({(8'h9f)} ? (7'h44) : ((8'hbc) ? (8'ha0) : (8'hb1))) : ({(7'h44), (8'hb7)} ~^ ((7'h44) ? (8'h9c) : (8'ha6)))) : (((!(8'h9e)) ? {(8'hac), (8'hb7)} : (~|(8'hbb))) == {((8'haa) != (8'hbd))}))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire20;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(3'h4):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire38,
                 wire37,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg41,
                 reg40,
                 reg39,
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
                 (1'h0)};
  assign wire21 = $unsigned(($unsigned(wire18) || {wire19[(2'h3):(1'h1)]}));
  assign wire22 = ($unsigned($unsigned($signed({wire21,
                      (8'h9f)}))) >= (&$unsigned(wire16[(2'h3):(1'h1)])));
  assign wire23 = (($unsigned(($unsigned((8'ha0)) ?
                      wire22[(3'h6):(2'h3)] : $signed((8'ha1)))) ^ wire22[(1'h0):(1'h0)]) >>> (!($signed((wire20 >= wire19)) == ((8'haa) == (wire16 ?
                      wire20 : wire22)))));
  assign wire24 = wire20;
  assign wire25 = (wire21[(2'h2):(1'h1)] & ($signed(((|wire21) ?
                          $signed(wire20) : {wire24, wire23})) ?
                      (&(~^wire22)) : (|(wire21[(2'h2):(1'h1)] >>> (wire23 ?
                          wire20 : wire22)))));
  assign wire26 = ({(~{{wire24}})} ?
                      ($signed(wire19[(1'h1):(1'h1)]) && wire16) : wire20[(3'h7):(2'h3)]);
  always
    @(posedge clk) begin
      reg27 <= (&wire20);
      reg28 <= $unsigned($unsigned($unsigned(wire19[(3'h5):(2'h2)])));
      reg29 <= wire19[(3'h5):(3'h5)];
      if ((reg27 & ((wire23 ? (wire25[(4'h9):(1'h0)] ^~ (+wire17)) : wire22) ?
          (~|({wire16, (8'hbd)} ?
              (reg27 ^ (8'hbb)) : wire24[(3'h5):(2'h3)])) : $unsigned($signed((reg28 ?
              (8'hab) : wire23))))))
        begin
          reg30 <= {wire18};
          reg31 <= (wire24 ?
              (($unsigned((-wire22)) + ($unsigned(wire18) ^~ $unsigned(wire16))) ^~ $signed((~$unsigned(wire20)))) : $unsigned($signed($signed($unsigned((8'h9f))))));
        end
      else
        begin
          reg30 <= reg29[(4'hf):(4'h9)];
          reg31 <= $signed((wire21 && reg28));
          reg32 <= {reg28};
          if ($signed(((~^$unsigned((wire17 ? reg32 : reg28))) ?
              $unsigned(wire17[(3'h4):(3'h4)]) : {$unsigned(wire19)})))
            begin
              reg33 <= ({reg31,
                      $unsigned(($unsigned(reg27) & (wire18 >> reg29)))} ?
                  wire16 : ((!(wire23[(3'h6):(3'h6)] >> (~|wire18))) ?
                      ($unsigned((!wire20)) >>> $unsigned(reg31[(5'h11):(3'h4)])) : (&(-(wire26 ?
                          reg32 : reg30)))));
              reg34 <= wire17;
              reg35 <= ((((~reg34[(4'ha):(3'h4)]) ?
                      reg31[(4'hd):(4'h9)] : ($unsigned(wire16) ?
                          {(8'ha4)} : (~reg31))) ?
                  (8'h9d) : (|$unsigned({reg30}))) ^~ $signed($unsigned(reg31[(2'h2):(2'h2)])));
            end
          else
            begin
              reg33 <= ($unsigned($signed((reg33[(3'h5):(2'h2)] ?
                  wire16[(3'h5):(3'h5)] : $unsigned((8'ha4))))) < ((~|{(reg34 ?
                      wire22 : wire18)}) ~^ wire20[(1'h0):(1'h0)]));
              reg34 <= $signed(wire23[(4'h9):(1'h1)]);
              reg35 <= wire19;
            end
          reg36 <= (^~wire20);
        end
    end
  assign wire37 = wire25[(3'h7):(3'h6)];
  assign wire38 = (reg28 ?
                      (^(reg27[(1'h1):(1'h1)] ?
                          reg36[(3'h5):(1'h1)] : wire17)) : ((!wire19[(3'h4):(2'h2)]) ?
                          (((|reg33) >> $signed(wire26)) ?
                              wire20 : $signed(wire21)) : {$unsigned($unsigned(wire21))}));
  always
    @(posedge clk) begin
      reg39 <= $signed(((+$unsigned($signed(reg31))) ?
          $unsigned(reg29[(5'h10):(4'ha)]) : wire24[(1'h1):(1'h0)]));
      reg40 <= reg30[(1'h1):(1'h0)];
      reg41 <= ({{{(wire25 | (8'had)), $unsigned(reg40)}}} ?
          $unsigned((^~wire25)) : ((-$unsigned((wire26 ? reg33 : wire22))) ?
              reg28 : (((reg32 != (8'hb2)) & ((8'ha0) ? wire38 : wire37)) ?
                  (~|wire24[(2'h2):(1'h0)]) : $signed((wire19 >>> (8'ha8))))));
    end
  assign wire42 = $unsigned((~&(((^~reg35) ?
                          (wire22 ? reg39 : reg30) : (~&reg41)) ?
                      $unsigned((+wire19)) : $signed((reg32 >= reg31)))));
  assign wire43 = {(~^reg35[(1'h0):(1'h0)])};
  assign wire44 = (!$signed(wire38));
  assign wire45 = $unsigned((~|({(wire26 != wire42),
                      (reg31 - reg35)} != wire38[(4'ha):(2'h2)])));
  assign wire46 = ((8'ha5) <<< $signed(($signed((reg30 ?
                      reg30 : reg31)) ~^ {(wire45 ? (8'hb5) : wire37)})));
  assign wire47 = (wire42 ? wire16 : reg35);
  assign wire48 = ({($unsigned($signed(wire25)) ?
                          (!reg30[(2'h2):(2'h2)]) : ((reg27 == reg30) | $unsigned((8'hbc))))} ~^ reg33);
  assign wire49 = reg31[(4'he):(4'hb)];
  assign wire50 = $unsigned(wire24);
  assign wire51 = wire38;
endmodule
