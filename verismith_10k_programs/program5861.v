module top
#(parameter param173 = {{{((!(8'haa)) ? ((8'hbb) ? (8'hb3) : (8'haf)) : ((8'hbf) ? (8'ha3) : (8'hbb)))}, (((~(8'haa)) ? ((8'ha1) ? (8'hbd) : (8'hae)) : ((8'hb1) ? (8'h9e) : (8'ha5))) * {((8'h9c) ? (7'h42) : (8'haf))})}, {(|(8'h9e)), (8'had)}})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire171;
  wire [(3'h5):(1'h0)] wire170;
  wire signed [(4'hc):(1'h0)] wire169;
  wire [(4'hc):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire150;
  wire signed [(5'h12):(1'h0)] wire146;
  wire [(4'he):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire144;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(3'h4):(1'h0)] wire153;
  wire [(5'h11):(1'h0)] wire154;
  wire [(3'h7):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire156;
  reg [(4'hc):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg164 = (1'h0);
  reg [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg162 = (1'h0);
  reg [(4'hb):(1'h0)] reg161 = (1'h0);
  reg [(5'h14):(1'h0)] reg160 = (1'h0);
  reg [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire158,
                 wire150,
                 wire146,
                 wire4,
                 wire88,
                 wire90,
                 wire91,
                 wire92,
                 wire144,
                 wire152,
                 wire153,
                 wire154,
                 wire155,
                 wire156,
                 reg172,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire4 = ($unsigned(({wire3, (wire1 | (8'hac))} ?
                         $signed({wire0,
                             wire0}) : ((!wire1) - $unsigned(wire1)))) ?
                     wire1 : $signed((($signed(wire1) ?
                         (wire3 ?
                             wire1 : wire2) : wire2) <= (~wire0[(3'h7):(3'h7)]))));
  module5 #() modinst89 (.y(wire88), .wire9(wire2), .wire8(wire4), .clk(clk), .wire6(wire1), .wire7(wire3));
  assign wire90 = wire88[(1'h1):(1'h0)];
  assign wire91 = (8'hbe);
  assign wire92 = $unsigned((|((|wire1[(2'h3):(1'h0)]) ?
                      {{wire0, wire3}, wire91} : $unsigned(wire90))));
  module93 #() modinst145 (.wire98(wire88), .wire94(wire3), .wire95(wire91), .wire96(wire92), .clk(clk), .wire97(wire2), .y(wire144));
  assign wire146 = ($unsigned(wire3) & (^~$unsigned($unsigned((wire4 ?
                       wire4 : (8'hb5))))));
  always
    @(posedge clk) begin
      reg147 <= $signed((wire90 || wire88));
      reg148 <= {{$unsigned({(^wire91), $unsigned(wire92)})},
          ((wire90[(1'h1):(1'h0)] ^ wire3) << wire91)};
      reg149 <= {$signed(wire4[(3'h5):(1'h0)]), wire144[(4'ha):(4'h8)]};
    end
  module13 #() modinst151 (wire150, clk, wire3, wire2, wire4, wire0, wire146);
  assign wire152 = reg148[(2'h3):(2'h2)];
  assign wire153 = wire88;
  assign wire154 = ((+reg147) ?
                       (reg149 ?
                           wire3[(3'h4):(1'h0)] : {wire150[(3'h4):(2'h2)]}) : {((wire1 ?
                                   $unsigned(wire150) : wire92[(4'h9):(1'h0)]) ?
                               wire91[(1'h1):(1'h1)] : (8'hae))});
  assign wire155 = $signed(((8'h9f) ? wire146[(2'h3):(2'h2)] : wire153));
  module13 #() modinst157 (wire156, clk, wire155, wire4, wire150, wire0, wire91);
  assign wire158 = (7'h40);
  always
    @(posedge clk) begin
      if ((wire155 ?
          $signed((($unsigned(wire88) ?
                  wire0[(1'h1):(1'h0)] : {wire158, (8'h9c)}) ?
              ((wire146 != wire153) && ((8'hae) ?
                  wire92 : wire153)) : $signed((reg148 << wire0)))) : wire2))
        begin
          if ((reg148 << ($unsigned(((wire152 ? wire158 : (8'hab)) ?
                  $signed(wire156) : (~^wire144))) ?
              (wire155 <= $unsigned($unsigned(reg148))) : ((~^{wire153,
                  reg149}) >= $unsigned($unsigned(wire146))))))
            begin
              reg159 <= $signed((wire4 == wire153[(3'h4):(1'h1)]));
              reg160 <= $unsigned(((~&$signed(wire155)) || $unsigned(((wire91 ?
                      wire88 : reg148) ?
                  wire92[(1'h1):(1'h1)] : (&wire2)))));
            end
          else
            begin
              reg159 <= ({wire1} ?
                  wire88[(4'hb):(2'h2)] : {(wire2 != ($unsigned(wire156) ?
                          (wire156 >>> wire92) : $signed(wire155))),
                      $unsigned({$signed(wire91), (~^wire0)})});
              reg160 <= wire0[(1'h0):(1'h0)];
              reg161 <= wire154;
              reg162 <= (-($unsigned($unsigned(wire4)) - wire88));
            end
          if ($unsigned($unsigned((reg161[(3'h5):(3'h5)] ?
              (&{reg147}) : wire152[(3'h4):(2'h3)]))))
            begin
              reg163 <= $unsigned(({$unsigned($unsigned(wire150)),
                  $unsigned(reg162)} ^~ (~^wire3[(1'h0):(1'h0)])));
              reg164 <= {wire155[(2'h3):(2'h3)]};
              reg165 <= $signed((((^~(8'hba)) ? wire155 : $signed(wire156)) ?
                  {(-wire144),
                      $unsigned(((8'ha6) ?
                          wire146 : wire1))} : wire155[(3'h5):(1'h1)]));
              reg166 <= reg165;
              reg167 <= ($signed($unsigned({(8'h9f),
                  $unsigned(reg159)})) != $unsigned((+$signed(((8'hbe) > reg147)))));
            end
          else
            begin
              reg163 <= (reg149 ?
                  ((8'ha6) ? (reg147 >>> wire146) : reg161) : {(-(wire156 ?
                          (wire154 ? wire156 : reg147) : (~|reg166)))});
            end
        end
      else
        begin
          if (reg166)
            begin
              reg159 <= $unsigned($signed({$signed((wire146 ? wire92 : wire4)),
                  $signed(reg162[(1'h1):(1'h0)])}));
              reg160 <= reg149;
              reg161 <= wire0[(4'hc):(4'hc)];
              reg162 <= (($signed((wire152[(4'hb):(3'h6)] ?
                  {reg167,
                      reg159} : $unsigned((8'h9f)))) >> wire2) >>> wire4[(4'h8):(1'h0)]);
            end
          else
            begin
              reg159 <= ($unsigned({(^~(^wire4))}) ?
                  $unsigned(($unsigned((reg162 ?
                      wire158 : wire91)) <<< (((8'h9f) ?
                      wire156 : wire92) <= (wire153 ?
                      (8'hb1) : wire154)))) : {{wire91[(4'ha):(3'h5)],
                          reg148[(4'h9):(1'h1)]},
                      $signed({(reg166 && wire3)})});
              reg160 <= $signed((wire152 ?
                  $unsigned($unsigned({wire88})) : $signed(reg149)));
              reg161 <= $unsigned({(~^reg165[(3'h4):(1'h0)]),
                  $signed(wire91[(3'h6):(3'h4)])});
              reg162 <= (reg148 ?
                  (wire4 ^ ((reg165[(2'h2):(2'h2)] ?
                          (!(8'hb3)) : wire152[(4'h9):(3'h5)]) ?
                      {(+wire150)} : ((|wire154) > $unsigned(wire92)))) : $unsigned((^~reg167[(3'h7):(1'h1)])));
            end
        end
      reg168 <= (wire91[(4'h8):(4'h8)] ?
          $unsigned({(^~{reg167})}) : $signed($unsigned((|$unsigned(reg147)))));
    end
  assign wire169 = $unsigned(($signed(reg161) ?
                       $signed((^~wire158)) : (&reg160[(3'h5):(2'h2)])));
  assign wire170 = ($signed((7'h41)) != reg164[(5'h11):(4'h8)]);
  assign wire171 = $signed(reg161[(4'h9):(1'h1)]);
  always
    @(posedge clk) begin
      reg172 <= $signed((+$unsigned((+(~^wire154)))));
    end
endmodule

module module93  (y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire98;
  input wire signed [(4'hd):(1'h0)] wire97;
  input wire signed [(3'h6):(1'h0)] wire96;
  input wire [(5'h10):(1'h0)] wire95;
  input wire signed [(5'h10):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire142;
  wire [(4'hf):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire129;
  wire [(3'h5):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  reg signed [(4'h8):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg140 = (1'h0);
  reg [(4'hc):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  assign wire99 = (($signed($signed((wire96 ?
                      wire97 : wire94))) & (~wire94[(3'h6):(1'h1)])) ~^ $unsigned(((wire95 <<< {wire97,
                      wire98}) & $unsigned(wire95))));
  assign wire100 = $unsigned(($unsigned((wire99[(4'hc):(2'h3)] ?
                       (~wire94) : (wire94 ?
                           wire98 : wire94))) * $unsigned(wire95[(3'h4):(3'h4)])));
  assign wire101 = ($unsigned(wire99) ?
                       {wire95, wire98[(2'h2):(2'h2)]} : wire96);
  assign wire102 = $signed(wire101[(4'h8):(1'h1)]);
  module103 #() modinst130 (wire129, clk, wire94, wire96, wire98, wire97);
  assign wire131 = wire94[(4'hb):(3'h5)];
  assign wire132 = ((|wire95) && wire129);
  assign wire133 = wire97[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if (wire132[(4'hd):(4'hb)])
        begin
          reg134 <= wire101[(3'h7):(1'h1)];
          reg135 <= ((((8'hb3) | ($unsigned((8'ha7)) ~^ (wire131 + reg134))) ?
                  $signed((^$unsigned(wire96))) : ((&(wire97 ?
                          wire133 : wire99)) ?
                      $signed($unsigned(wire95)) : $unsigned((wire100 ?
                          wire96 : wire96)))) ?
              ($signed($unsigned({wire98})) + $unsigned(wire129[(3'h7):(3'h6)])) : wire129);
        end
      else
        begin
          reg134 <= ($unsigned(wire95[(1'h1):(1'h0)]) << wire101[(2'h2):(2'h2)]);
          reg135 <= (~reg135);
          if ($signed(wire99[(1'h0):(1'h0)]))
            begin
              reg136 <= {$signed({wire96})};
              reg137 <= $unsigned((8'hb2));
              reg138 <= $unsigned($unsigned(((8'h9c) ?
                  $unsigned((|wire94)) : wire95)));
            end
          else
            begin
              reg136 <= wire94[(2'h2):(1'h0)];
            end
        end
      reg139 <= $unsigned(wire131[(2'h3):(2'h2)]);
      reg140 <= wire99[(1'h0):(1'h0)];
      reg141 <= (wire95 - $unsigned((!($signed((8'hb1)) ^~ $signed(wire133)))));
    end
  assign wire142 = ({reg134} ?
                       $unsigned(reg136[(3'h5):(2'h2)]) : (wire94 && wire96));
  assign wire143 = (wire142 ?
                       $unsigned({(~(wire98 ? wire131 : reg134)),
                           {(wire132 & reg139),
                               (wire132 >>> reg138)}}) : $unsigned({$signed(wire99[(4'hf):(3'h5)]),
                           $unsigned((~wire100))}));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire81;
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire45,
                 wire12,
                 wire11,
                 wire10,
                 wire81,
                 (1'h0)};
  assign wire10 = (wire9 ? $signed(wire7) : $unsigned($unsigned((8'h9f))));
  assign wire11 = (^wire9);
  assign wire12 = ($signed(wire6[(4'ha):(3'h7)]) ~^ $signed(wire6[(3'h6):(2'h2)]));
  module13 #() modinst46 (.wire14(wire9), .y(wire45), .wire16(wire8), .wire18(wire11), .wire17(wire10), .clk(clk), .wire15(wire7));
  module47 #() modinst82 (.wire50(wire45), .y(wire81), .wire51(wire12), .wire49(wire10), .wire48(wire8), .wire52(wire9), .clk(clk));
  assign wire83 = {wire10, (!wire81)};
  assign wire84 = wire12[(3'h7):(3'h4)];
  assign wire85 = wire45;
  assign wire86 = ((~&{((~^wire84) << $unsigned(wire8))}) ~^ wire84[(3'h4):(2'h3)]);
  assign wire87 = (($signed((8'hb9)) ?
                      (($signed(wire86) > $signed(wire12)) ?
                          ((|wire12) * (-wire83)) : $unsigned($unsigned(wire86))) : (&$unsigned(wire12[(1'h1):(1'h1)]))) ^ (wire12[(4'h8):(2'h2)] ?
                      (~^$unsigned($signed((8'h9e)))) : ({wire81[(1'h0):(1'h0)]} ?
                          $unsigned(wire6[(3'h5):(2'h3)]) : (((8'hba) << (8'h9d)) || $signed(wire11)))));
endmodule

module module47
#(parameter param79 = (8'ha3), 
parameter param80 = (((&param79) >> (~^((param79 * param79) ? (-param79) : {param79}))) ? param79 : ((((param79 ? param79 : param79) && ((8'haa) ? param79 : (8'hb0))) == (|(-param79))) >>> ((^(param79 ? (8'hbe) : param79)) ? (-param79) : ((!param79) ? {param79, (8'ha8)} : (^param79))))))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire52;
  input wire [(5'h10):(1'h0)] wire51;
  input wire [(4'hd):(1'h0)] wire50;
  input wire [(5'h12):(1'h0)] wire49;
  input wire [(3'h6):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  assign y = {wire68,
                 wire54,
                 wire53,
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
                 reg55,
                 (1'h0)};
  assign wire53 = $unsigned(($signed(wire50[(2'h3):(1'h1)]) ?
                      $unsigned(wire51) : wire49[(4'h9):(3'h7)]));
  assign wire54 = ($signed(wire53[(1'h0):(1'h0)]) ?
                      (+$signed(((wire48 ?
                          wire51 : wire49) << (wire48 <= wire51)))) : (^~wire52[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ($unsigned((!(8'hbf))))
        begin
          reg55 <= (8'hb9);
          if ((~|$unsigned((((wire49 << wire50) || wire49[(4'h9):(2'h2)]) ?
              $unsigned($unsigned(wire48)) : wire48[(2'h2):(1'h1)]))))
            begin
              reg56 <= ($unsigned($unsigned((wire52 ?
                      wire54[(1'h1):(1'h1)] : $unsigned(wire48)))) ?
                  wire51[(4'ha):(3'h5)] : ($signed(((~wire52) ^~ ((8'ha8) < wire54))) ?
                      (-$signed($signed(wire48))) : {({wire51, reg55} ?
                              (8'hb9) : {wire53, wire51})}));
              reg57 <= ((^reg56) ^ wire53[(1'h1):(1'h1)]);
              reg58 <= ({wire54, (~^wire53)} ?
                  (~^(reg57[(2'h2):(1'h0)] + (^wire53[(1'h1):(1'h0)]))) : $signed(wire50[(3'h7):(2'h2)]));
              reg59 <= wire52;
              reg60 <= $signed($signed(({{reg55, (8'ha2)}} ?
                  wire52[(2'h2):(2'h2)] : {(|wire49), {wire51, reg58}})));
            end
          else
            begin
              reg56 <= ((^~reg55) ?
                  {wire53,
                      wire54[(4'ha):(1'h1)]} : (wire52 ~^ (~reg56[(1'h0):(1'h0)])));
            end
          reg61 <= $signed(wire48[(2'h2):(1'h1)]);
          reg62 <= (8'ha9);
          reg63 <= ((wire50 < ($unsigned((^~wire49)) ?
              $unsigned((&wire49)) : wire51)) + $signed((&reg56)));
        end
      else
        begin
          if ({$unsigned(wire49[(4'hd):(3'h7)])})
            begin
              reg55 <= $signed((^~({(wire52 ? wire52 : reg56)} ?
                  (&$unsigned(wire52)) : $signed((~|reg59)))));
              reg56 <= ($unsigned(wire50[(3'h4):(3'h4)]) <<< (^~(|$signed($unsigned(reg56)))));
              reg57 <= wire51[(4'hb):(3'h7)];
              reg58 <= reg63[(4'hc):(4'ha)];
              reg59 <= wire48[(3'h4):(2'h2)];
            end
          else
            begin
              reg55 <= $unsigned(((8'hbd) * (({(8'hab)} ?
                  reg60[(3'h5):(1'h0)] : $unsigned(reg60)) > $signed(((8'ha8) ~^ (7'h40))))));
            end
          reg60 <= $unsigned(($signed($signed($unsigned(wire53))) <= $signed(wire48)));
          reg61 <= wire53;
          if (reg60)
            begin
              reg62 <= ({(~|($signed((8'ha2)) >= (^~wire53))),
                  $unsigned($unsigned($signed(reg56)))} || $unsigned((!(wire48 ?
                  (reg62 <<< reg63) : ((8'hbc) >= reg57)))));
              reg63 <= $signed(({(8'hb5),
                      (reg59[(1'h1):(1'h1)] ?
                          reg56[(2'h2):(2'h2)] : (~^(8'haa)))} ?
                  wire50[(3'h6):(2'h3)] : ($unsigned((-reg59)) ^~ $unsigned($unsigned(reg60)))));
              reg64 <= (8'hb8);
            end
          else
            begin
              reg62 <= reg56[(1'h0):(1'h0)];
            end
          reg65 <= (~^reg63[(4'ha):(1'h1)]);
        end
      reg66 <= $unsigned(reg61[(4'he):(4'h8)]);
      reg67 <= $unsigned($unsigned(((^(reg61 ? reg64 : wire54)) ?
          ($unsigned(reg57) ? (!wire48) : reg57) : reg65[(1'h1):(1'h0)])));
    end
  assign wire68 = $signed(reg57[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      if ((reg60 || reg61[(1'h1):(1'h0)]))
        begin
          reg69 <= $signed($unsigned((|((reg59 ?
              wire51 : reg66) ^ $signed(reg64)))));
        end
      else
        begin
          if ((~&{$unsigned((|$signed(reg63)))}))
            begin
              reg69 <= $signed(wire50);
              reg70 <= ($signed($signed(wire68[(2'h2):(1'h1)])) ?
                  wire54 : $signed(wire52[(3'h4):(1'h0)]));
              reg71 <= $signed($signed($signed($signed({wire54, (8'hab)}))));
            end
          else
            begin
              reg69 <= {(((~(reg58 - reg62)) ~^ (~$signed(reg62))) <= (((&wire51) && $unsigned(reg56)) | {(wire68 <<< wire49)})),
                  $signed(reg58[(2'h2):(1'h1)])};
            end
          reg72 <= (reg61 ? $unsigned(reg71) : reg67[(1'h0):(1'h0)]);
          if (reg60[(4'hb):(2'h2)])
            begin
              reg73 <= (~&((|$unsigned({wire50})) ?
                  {(8'ha4), $signed($signed((8'hae)))} : (($signed(wire49) ?
                          (reg66 | reg65) : $signed(reg71)) ?
                      (^{reg58, (8'ha2)}) : $unsigned((~|reg71)))));
              reg74 <= ((~^reg64) | $unsigned({($signed(wire49) >>> reg66),
                  ((reg70 ? (7'h41) : wire52) ?
                      (reg64 < reg56) : (wire49 ? wire53 : reg71))}));
              reg75 <= reg73;
            end
          else
            begin
              reg73 <= $signed((+(reg60[(3'h4):(1'h1)] == ({reg61,
                  wire52} <= $unsigned(reg72)))));
              reg74 <= $unsigned($unsigned(($signed($unsigned(reg57)) >>> ({reg67,
                      reg58} ?
                  $unsigned(reg71) : reg72))));
            end
        end
      reg76 <= reg75;
      reg77 <= wire68;
      reg78 <= reg76[(1'h0):(1'h0)];
    end
endmodule

module module13
#(parameter param44 = (8'haf))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire [(4'he):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire19;
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire19 = (|wire14[(1'h0):(1'h0)]);
  assign wire20 = wire14[(3'h6):(1'h1)];
  assign wire21 = $signed((~|$signed(((wire20 ? wire18 : (7'h41)) ?
                      $signed(wire14) : (^wire15)))));
  assign wire22 = (wire16[(2'h2):(2'h2)] ^~ (wire20[(3'h4):(2'h3)] ?
                      (wire20 ?
                          {$signed(wire21)} : ((wire15 * wire17) ^ (!(7'h44)))) : $signed((wire17 ?
                          (^wire17) : (wire15 ? (8'ha8) : (8'hba))))));
  assign wire23 = $signed((~&(~&wire14[(5'h10):(3'h4)])));
  assign wire24 = (~&$signed(wire19));
  assign wire25 = ($signed($signed(wire24[(4'hf):(4'hf)])) ?
                      wire14[(3'h7):(2'h2)] : {$unsigned($signed((wire17 ?
                              wire22 : wire22)))});
  assign wire26 = ($unsigned((((wire18 ? wire17 : wire15) | (wire17 ?
                          wire19 : wire14)) & ({wire18} ?
                          (wire19 ? wire14 : (7'h44)) : $signed((8'hbb))))) ?
                      wire24 : $signed((($signed(wire19) ?
                              (wire16 <= wire22) : (wire15 != wire15)) ?
                          ((^wire23) ^ {wire16}) : (wire14 ?
                              (!wire14) : (wire25 ? wire20 : wire24)))));
  assign wire27 = {($unsigned($signed(wire21[(1'h0):(1'h0)])) == wire16[(3'h4):(1'h0)]),
                      wire23};
  assign wire28 = (~wire23[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire17)))
        begin
          reg29 <= {$signed(wire17[(3'h5):(2'h3)])};
          reg30 <= wire23;
          if ({((wire22[(3'h5):(1'h1)] ?
                  wire15 : $signed(wire27[(3'h6):(2'h3)])) | wire15),
              ((~|$signed(wire25[(2'h2):(2'h2)])) ?
                  $signed($unsigned((7'h41))) : (+wire17[(4'hd):(3'h4)]))})
            begin
              reg31 <= (reg29[(4'he):(3'h5)] ?
                  (-wire22[(3'h5):(2'h3)]) : (~|$unsigned((wire16[(3'h5):(1'h1)] ?
                      $signed(wire15) : $signed(wire16)))));
              reg32 <= $signed((~&$unsigned(wire21[(1'h1):(1'h0)])));
              reg33 <= wire26[(4'h9):(3'h4)];
              reg34 <= $signed((((+wire19[(4'he):(1'h0)]) ?
                      wire25 : wire25[(2'h3):(1'h0)]) ?
                  (^((!reg33) ?
                      reg32[(1'h0):(1'h0)] : (8'had))) : $signed((wire16 != $unsigned(wire26)))));
              reg35 <= (~{$unsigned($unsigned((~|wire25))),
                  $unsigned((~|$signed((8'haa))))});
            end
          else
            begin
              reg31 <= $unsigned($signed({((8'hb9) ?
                      $unsigned((8'hbe)) : $unsigned(wire15)),
                  wire25}));
              reg32 <= $unsigned(reg32);
              reg33 <= wire28[(3'h5):(2'h2)];
              reg34 <= (-$unsigned((8'haa)));
              reg35 <= wire19;
            end
          reg36 <= $signed((~&{(&(wire15 >> reg31))}));
          reg37 <= ($unsigned((($signed(wire21) ?
                  wire17[(4'h8):(2'h2)] : (wire22 ?
                      wire17 : wire28)) == reg33)) ?
              (|(~^(8'haf))) : ({$unsigned((wire17 ^ wire24)),
                  (~^(wire18 ? wire27 : wire21))} & $signed(($unsigned(reg35) ?
                  (wire23 >= (8'h9f)) : $unsigned(wire25)))));
        end
      else
        begin
          if (wire14[(3'h6):(3'h4)])
            begin
              reg29 <= (8'hb4);
              reg30 <= reg33;
              reg31 <= $signed($unsigned((!((reg31 ^ wire26) ?
                  {wire26, wire14} : $unsigned((8'hae))))));
              reg32 <= (~^$signed($unsigned(($unsigned(wire18) ?
                  wire22 : {reg30}))));
              reg33 <= (($signed($signed((&(8'ha4)))) ~^ wire19) != (^(!reg30)));
            end
          else
            begin
              reg29 <= (^~(~&wire24[(3'h5):(1'h1)]));
              reg30 <= $unsigned(reg37[(2'h2):(2'h2)]);
              reg31 <= {(^wire28[(3'h7):(2'h3)])};
            end
          reg34 <= $unsigned(wire25[(3'h7):(1'h0)]);
          reg35 <= (+wire23[(2'h3):(2'h3)]);
        end
    end
  assign wire38 = reg29[(3'h5):(2'h2)];
  assign wire39 = $unsigned((^~$unsigned(wire28)));
  assign wire40 = $signed(((reg29[(1'h0):(1'h0)] != ((reg30 ? reg34 : wire28) ?
                          (reg31 ? reg36 : wire39) : {reg32, wire26})) ?
                      ($unsigned($unsigned((8'hb4))) <= {reg30[(1'h0):(1'h0)],
                          (wire39 | wire21)}) : wire25[(2'h2):(1'h1)]));
  assign wire41 = reg37[(2'h2):(2'h2)];
  assign wire42 = (wire15 ? wire26[(2'h3):(2'h2)] : reg36[(3'h5):(3'h5)]);
  assign wire43 = (8'ha3);
endmodule

module module103  (y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire107;
  input wire [(3'h6):(1'h0)] wire106;
  input wire signed [(4'hb):(1'h0)] wire105;
  input wire [(4'hd):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire122;
  wire [(2'h2):(1'h0)] wire108;
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  assign y = {wire128,
                 wire125,
                 wire122,
                 wire108,
                 reg127,
                 reg126,
                 reg124,
                 reg123,
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
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire108 = $unsigned($signed($unsigned($signed((wire106 <= wire106)))));
  always
    @(posedge clk) begin
      if (wire104[(2'h2):(1'h0)])
        begin
          if ({$unsigned($unsigned((^~(wire108 ? wire108 : wire108))))})
            begin
              reg109 <= $unsigned((^wire105[(1'h1):(1'h1)]));
              reg110 <= (reg109[(4'h8):(1'h1)] ?
                  wire106 : ($unsigned(wire104[(4'h8):(3'h6)]) ?
                      $unsigned(((!wire108) < (wire105 ?
                          wire108 : (8'had)))) : {((~|wire105) < ((8'hbe) + (8'ha1)))}));
              reg111 <= {$unsigned(wire108)};
            end
          else
            begin
              reg109 <= (8'hbb);
              reg110 <= (wire105[(3'h6):(2'h3)] ^~ wire105[(3'h4):(2'h3)]);
              reg111 <= ($unsigned((|(~|(^~wire106)))) ^~ (reg111 >= reg111[(2'h2):(1'h0)]));
              reg112 <= ((reg110 ~^ ($unsigned($unsigned(wire106)) ?
                  $signed($signed(reg109)) : (~(~^wire106)))) < {$signed($unsigned($signed(reg110))),
                  wire107[(2'h3):(2'h3)]});
              reg113 <= ($unsigned(reg109) ?
                  ($signed(((8'ha6) ?
                      $unsigned(reg110) : (~^(8'ha1)))) << ($signed($signed((8'h9c))) | {wire104,
                      $signed(wire107)})) : (|$signed(reg112)));
            end
          reg114 <= $signed((+reg113));
          reg115 <= reg114;
          reg116 <= reg111[(3'h4):(3'h4)];
          reg117 <= $signed((!wire104));
        end
      else
        begin
          reg109 <= (wire106[(2'h3):(2'h3)] ?
              ({({reg116} <<< (reg114 ?
                      wire104 : wire108))} - $signed(((!wire107) && ((8'hac) ?
                  reg113 : reg116)))) : ($signed($signed((reg112 ?
                  reg109 : reg113))) ^~ $unsigned($unsigned(reg117))));
        end
      reg118 <= reg115;
      reg119 <= reg112[(1'h0):(1'h0)];
      if ({{reg111,
              ((~$unsigned(reg109)) ?
                  $signed(wire107) : reg111[(2'h3):(2'h2)])},
          wire105})
        begin
          reg120 <= (!($signed(wire105[(3'h4):(3'h4)]) ?
              wire108[(2'h2):(1'h0)] : {$unsigned(reg114),
                  (reg116[(2'h3):(1'h0)] | reg114)}));
          reg121 <= (8'h9d);
        end
      else
        begin
          reg120 <= {$unsigned($unsigned((^~(reg117 ? reg118 : reg115)))),
              reg118};
        end
    end
  assign wire122 = ($unsigned(wire106[(2'h3):(1'h1)]) >> reg113[(4'hc):(4'hc)]);
  always
    @(posedge clk) begin
      reg123 <= ({($unsigned({wire107}) > wire122)} ?
          $signed($signed(reg116[(1'h1):(1'h1)])) : wire104[(1'h1):(1'h1)]);
      reg124 <= wire108;
    end
  assign wire125 = ($unsigned((((reg117 ? wire107 : reg110) >> ((8'ha4) ?
                               reg111 : reg109)) ?
                           $signed((reg116 ? wire108 : wire106)) : reg111)) ?
                       {(-$signed($signed(reg121))),
                           (8'ha4)} : (-reg124[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      reg126 <= ($unsigned(wire108) & (($unsigned($signed((8'ha0))) >= reg124) < (^~($signed((8'ha7)) << (!reg121)))));
      reg127 <= wire104[(4'hd):(4'h9)];
    end
  assign wire128 = reg116;
endmodule
