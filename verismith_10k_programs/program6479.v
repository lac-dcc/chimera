module top
#(parameter param166 = (~&((+((~(8'ha6)) ? {(8'hb7)} : ((8'hb7) << (8'hba)))) * ((&((8'hb1) & (8'hbe))) ? (((8'hb0) ^~ (7'h44)) ? (|(8'hbe)) : (!(8'ha8))) : ((^(8'ha5)) != ((8'hb5) || (8'hb2)))))), 
parameter param167 = ({param166, (param166 + (param166 ? (~&param166) : (param166 >> param166)))} < ((8'h9d) ? (8'h9e) : (&(((8'had) ? param166 : param166) ? {param166} : param166)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire165;
  wire [(5'h12):(1'h0)] wire160;
  wire signed [(5'h12):(1'h0)] wire125;
  wire [(4'h8):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire119;
  wire signed [(3'h4):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire163;
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  assign y = {wire165,
                 wire160,
                 wire125,
                 wire124,
                 wire119,
                 wire162,
                 wire163,
                 reg121,
                 reg122,
                 reg123,
                 (1'h0)};
  module4 #() modinst120 (wire119, clk, wire1, wire2, wire3, wire0);
  always
    @(posedge clk) begin
      reg121 <= ((wire2[(5'h11):(3'h5)] ?
          wire2 : (wire2[(2'h3):(2'h2)] ?
              $signed((wire0 ?
                  wire0 : wire2)) : wire3[(2'h3):(2'h2)])) << (^~$signed((wire0[(4'he):(4'he)] | (8'hb8)))));
      reg122 <= ($unsigned($signed($unsigned({wire0, (8'ha2)}))) < (wire3 ?
          $signed($unsigned((wire3 << (8'haf)))) : wire1));
      reg123 <= (wire119 > ((~((wire3 ? reg121 : (8'hb2)) ?
              (~^wire3) : (~&wire0))) ?
          wire3 : ((reg121 ? $signed(reg121) : (wire3 ? reg122 : reg122)) ?
              $unsigned((|reg121)) : {(wire3 ? wire1 : (8'hb8))})));
    end
  assign wire124 = (wire1 ?
                       $signed($signed((|(+wire3)))) : reg123[(3'h7):(2'h2)]);
  assign wire125 = reg121;
  module126 #() modinst161 (.wire129(reg121), .wire131(wire2), .clk(clk), .wire130(wire0), .wire128(reg123), .wire127(wire119), .y(wire160));
  assign wire162 = wire125;
  module65 #() modinst164 (.wire69(reg122), .wire68(reg121), .wire67(reg123), .clk(clk), .wire66(wire124), .y(wire163));
  assign wire165 = (($unsigned({(^wire124)}) ?
                           reg123[(3'h5):(3'h5)] : wire160[(5'h10):(4'h8)]) ?
                       ({((wire125 ? wire163 : reg122) ?
                               {wire2} : (wire3 & (8'ha7))),
                           wire125[(4'hb):(1'h1)]} >> (^($signed(wire3) >>> wire0[(1'h0):(1'h0)]))) : wire124);
endmodule

module module126
#(parameter param159 = (8'had))
(y, clk, wire127, wire128, wire129, wire130, wire131);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire127;
  input wire [(4'he):(1'h0)] wire128;
  input wire signed [(5'h15):(1'h0)] wire129;
  input wire signed [(5'h13):(1'h0)] wire130;
  input wire signed [(5'h15):(1'h0)] wire131;
  wire [(5'h11):(1'h0)] wire158;
  wire [(5'h15):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire135;
  wire signed [(4'hc):(1'h0)] wire136;
  wire signed [(4'h9):(1'h0)] wire137;
  wire [(2'h2):(1'h0)] wire138;
  wire signed [(5'h12):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire156;
  assign y = {wire158,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 wire138,
                 wire139,
                 wire156,
                 (1'h0)};
  assign wire132 = {wire128[(4'hd):(4'h9)]};
  assign wire133 = (~$signed((8'hbf)));
  assign wire134 = {wire133[(3'h5):(3'h4)]};
  assign wire135 = wire133;
  assign wire136 = $unsigned($signed(({(!wire132)} < $unsigned((!wire128)))));
  assign wire137 = $unsigned(((wire136[(3'h5):(3'h5)] - ($signed(wire130) <<< $unsigned(wire128))) ?
                       wire128 : wire134[(4'hd):(4'h8)]));
  assign wire138 = (~^wire133[(4'ha):(4'h9)]);
  assign wire139 = ($unsigned(wire135[(2'h2):(1'h0)]) ?
                       (({$signed(wire138)} != (~(wire131 == wire133))) >>> $signed({(wire136 ?
                               wire132 : wire128)})) : {(($signed(wire132) ?
                                   (~&wire133) : (|wire130)) ?
                               $signed($unsigned((8'haf))) : wire131)});
  module140 #() modinst157 (wire156, clk, wire128, wire132, wire136, wire129, wire130);
  assign wire158 = ((wire139 ?
                           {(wire139[(4'hf):(4'h8)] ?
                                   (wire136 ?
                                       wire131 : wire136) : (wire128 | (8'ha9))),
                               ((wire156 ^ wire134) != wire133[(3'h7):(2'h3)])} : $signed(wire128)) ?
                       {$signed($unsigned(wire132[(4'hc):(1'h0)])),
                           wire134[(1'h0):(1'h0)]} : (^((~&(^~wire156)) > $signed($signed(wire138)))));
endmodule

module module4
#(parameter param117 = ((~^{(&(!(8'hb6))), (((8'hb6) <<< (8'ha7)) ? (~|(8'ha0)) : ((8'h9f) | (8'hb6)))}) ? ((!((&(8'ha5)) ? {(8'hb2)} : ((8'h9f) >= (8'ha4)))) ? (((8'ha2) > ((7'h42) ? (8'hae) : (8'hb3))) >= ({(8'ha2)} >> {(8'ha2)})) : ((|{(8'hb9), (8'hb5)}) >> ((!(8'h9d)) ? {(7'h41), (8'ha0)} : ((7'h40) ? (8'h9e) : (8'ha1))))) : (((((8'hbf) ? (8'haf) : (7'h42)) >>> {(8'ha7), (8'hb4)}) ? (((8'hb8) ? (7'h40) : (8'hbf)) + (|(8'hb4))) : {{(8'hb1)}}) ? (&(+((8'hb6) | (8'hb3)))) : (((~|(8'ha0)) ? ((8'hac) ? (8'ha6) : (8'ha8)) : (~&(8'hba))) >= {((8'ha7) ? (8'hb3) : (8'hb7))}))), 
parameter param118 = (~&(7'h41)))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire5;
  input wire [(5'h13):(1'h0)] wire6;
  input wire [(3'h5):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire114;
  wire [(4'ha):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire62;
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire109,
                 wire64,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire27,
                 wire28,
                 wire62,
                 reg113,
                 reg112,
                 reg111,
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
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire9 = wire8;
  assign wire10 = ($signed({wire8[(2'h2):(1'h1)], (8'hb2)}) ?
                      $unsigned(wire5) : ($signed(wire5) <= $signed({(wire7 ?
                              (8'hb1) : wire5)})));
  assign wire11 = ((wire6 >> (($signed(wire10) - $unsigned(wire7)) || {(wire5 ?
                              (8'hb1) : wire5)})) ?
                      wire10 : {wire5, wire9[(3'h4):(3'h4)]});
  assign wire12 = (^~((~|(wire6 != $unsigned((8'hbf)))) ?
                      {{(wire11 ? (8'hb1) : wire7)}} : wire6));
  assign wire13 = wire6;
  always
    @(posedge clk) begin
      reg14 <= $signed((^~$unsigned({$unsigned(wire7), ((8'ha6) < wire9)})));
      reg15 <= (wire10 >> $signed(wire10));
      if (wire12)
        begin
          reg16 <= (wire6 * reg14);
          reg17 <= $signed((reg16 ?
              $signed(($signed(wire6) | wire10[(3'h4):(1'h0)])) : $signed(wire9[(2'h2):(1'h1)])));
          if (reg17[(1'h0):(1'h0)])
            begin
              reg18 <= wire9;
              reg19 <= reg14;
              reg20 <= wire6[(1'h0):(1'h0)];
            end
          else
            begin
              reg18 <= (|($signed(((-reg20) ?
                  (wire5 || wire11) : wire9)) ~^ wire10[(3'h6):(1'h1)]));
              reg19 <= (reg19 ?
                  (wire11 ?
                      reg20 : wire9[(1'h0):(1'h0)]) : $unsigned($signed($unsigned((~reg14)))));
              reg20 <= $unsigned(wire12);
              reg21 <= ({(reg16 ?
                      reg15[(3'h6):(3'h5)] : $signed($signed((8'hbf))))} < ($unsigned($unsigned($unsigned(wire7))) ?
                  wire6 : {(~&{reg16, reg16})}));
              reg22 <= reg17[(2'h2):(1'h1)];
            end
        end
      else
        begin
          reg16 <= wire10;
          reg17 <= $signed(wire10[(3'h6):(2'h3)]);
        end
      if ((~&reg22))
        begin
          reg23 <= $signed(((^reg14) <<< wire13));
          reg24 <= {$unsigned({wire11})};
        end
      else
        begin
          reg23 <= (($signed(wire6[(1'h1):(1'h1)]) << $unsigned(($signed(wire9) ?
              ((8'ha6) <<< reg20) : $unsigned(wire12)))) & reg22);
          reg24 <= $unsigned(({wire11} <<< (~((wire7 ? reg21 : (8'hb5)) ?
              $unsigned(reg18) : $signed(wire13)))));
          reg25 <= $signed($unsigned((($signed(reg20) + (^wire12)) ?
              ($signed(wire11) + $signed(wire8)) : $unsigned($unsigned((7'h40))))));
        end
      reg26 <= (~$signed((&wire13)));
    end
  assign wire27 = wire6;
  assign wire28 = (((wire12 ?
                      (~(reg20 ?
                          (8'hae) : (8'hbb))) : (reg26[(2'h2):(1'h1)] >= (reg16 << wire9))) > reg21) * $signed($unsigned((8'haa))));
  module29 #() modinst63 (.clk(clk), .wire31(wire28), .wire32(reg19), .wire33(reg22), .wire30(wire27), .y(wire62), .wire34(wire8));
  assign wire64 = (+{{wire28}, (^(-$signed(wire28)))});
  module65 #() modinst110 (.clk(clk), .wire66(reg25), .wire68(reg19), .wire69(wire12), .wire67(wire8), .y(wire109));
  always
    @(posedge clk) begin
      reg111 <= $signed({{wire28[(5'h15):(5'h10)]},
          $signed($unsigned(wire12))});
      reg112 <= (wire13[(3'h5):(3'h5)] != (reg26[(2'h3):(2'h2)] | $signed(((-reg23) > (~^wire11)))));
      reg113 <= $unsigned(wire62);
    end
  assign wire114 = (^~(8'haf));
  assign wire115 = $unsigned({($unsigned((!wire6)) ?
                           (+{wire10}) : $unsigned(((8'h9f) ^~ wire10)))});
  assign wire116 = {($unsigned((^reg112)) ?
                           $signed((!(wire11 & reg113))) : reg22[(3'h4):(3'h4)])};
endmodule

module module65
#(parameter param107 = ((((~&(+(8'hba))) + (8'hb6)) && ({(&(8'hbd))} ? (((8'hb6) & (8'ha6)) >= ((7'h41) != (7'h44))) : ({(8'ha0), (8'had)} ? ((8'ha6) ? (8'ha4) : (8'hbc)) : ((8'hb1) <<< (8'hab))))) ^ (({((8'ha7) ? (8'hb4) : (8'ha7))} ? (+{(7'h44)}) : (((8'hb9) >> (8'ha0)) ? ((8'hbd) * (8'hb1)) : {(7'h43)})) > ((((8'ha1) > (8'hb9)) == (^(8'hb9))) ? (8'hab) : ((~&(8'hb5)) ? ((8'ha6) ^ (8'had)) : (|(8'ha4)))))), 
parameter param108 = {(-{(!(param107 <<< param107)), (~(~&param107))})})
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire69;
  input wire [(5'h14):(1'h0)] wire68;
  input wire [(4'hc):(1'h0)] wire67;
  input wire signed [(3'h7):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  assign y = {wire101,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg75,
                 (1'h0)};
  assign wire70 = ($signed({((~|wire68) ?
                          (wire66 ^~ wire68) : $unsigned(wire67)),
                      wire68[(2'h2):(1'h1)]}) || $unsigned($unsigned({(wire67 ?
                          (8'hbc) : wire67)})));
  assign wire71 = wire67;
  assign wire72 = (wire66[(3'h6):(2'h2)] - wire69);
  assign wire73 = (!$unsigned(({$signed(wire66), $signed(wire66)} ?
                      ((|(8'hb4)) * $signed(wire68)) : ($signed((8'hb7)) ?
                          $signed((8'hb3)) : (wire71 ? wire69 : wire67)))));
  assign wire74 = (wire72 ?
                      (~^wire69[(1'h1):(1'h0)]) : ({(~|((8'ha6) >> wire70))} >>> {((|wire67) >> wire68[(4'he):(4'hc)])}));
  always
    @(posedge clk) begin
      reg75 <= $signed(wire69);
    end
  assign wire76 = {$signed(wire71)};
  assign wire77 = (~(({(8'haa)} || {wire72[(1'h1):(1'h1)]}) & wire72[(2'h3):(2'h3)]));
  assign wire78 = (-wire68);
  assign wire79 = $unsigned(wire66);
  always
    @(posedge clk) begin
      reg80 <= $unsigned(wire67[(4'h9):(2'h3)]);
      reg81 <= (wire66 ^ (&wire78[(3'h4):(1'h1)]));
      if ($unsigned(((^wire74) | ($unsigned({wire77,
          wire70}) >>> wire73[(1'h1):(1'h0)]))))
        begin
          reg82 <= reg75;
        end
      else
        begin
          reg82 <= $unsigned(wire70[(4'h9):(3'h5)]);
          if (((8'hbd) <= (^$signed(reg81[(3'h4):(1'h1)]))))
            begin
              reg83 <= (~^$unsigned(wire72));
              reg84 <= ({(reg81[(4'h8):(2'h2)] ?
                      $unsigned((wire71 & reg80)) : {wire79[(3'h4):(2'h2)],
                          {wire71, wire74}})} >= wire72[(2'h2):(1'h0)]);
            end
          else
            begin
              reg83 <= ($signed(wire72[(1'h0):(1'h0)]) != ($signed({reg81[(3'h6):(1'h0)],
                  {reg84}}) + wire66[(3'h5):(2'h3)]));
              reg84 <= (^~$unsigned($signed(wire79)));
            end
          reg85 <= wire73[(1'h0):(1'h0)];
          reg86 <= reg85[(3'h6):(1'h0)];
          if ($unsigned($signed(wire68)))
            begin
              reg87 <= (((^{(wire68 ?
                      reg86 : wire71)}) >= wire71[(1'h1):(1'h1)]) * reg85);
              reg88 <= reg84;
              reg89 <= ($unsigned(reg84) ?
                  $signed($unsigned(reg88[(3'h4):(2'h2)])) : ($unsigned(((~|wire78) ?
                          wire78[(3'h4):(2'h2)] : (~&(8'h9e)))) ?
                      ($signed(wire67) ?
                          $signed((~&reg88)) : $signed(reg84)) : (($signed(wire71) ?
                          (reg80 >> wire71) : (|reg81)) && (-$unsigned(wire68)))));
              reg90 <= (+{{((7'h43) ? wire69 : wire67[(2'h3):(2'h2)]),
                      ($unsigned(wire78) ? $unsigned(wire74) : (|reg83))},
                  reg89[(1'h1):(1'h1)]});
              reg91 <= (-(!$signed($unsigned(wire77))));
            end
          else
            begin
              reg87 <= reg75;
              reg88 <= reg85[(4'hc):(3'h7)];
              reg89 <= wire78[(3'h5):(2'h3)];
              reg90 <= wire72;
            end
        end
      reg92 <= $signed((($signed((reg75 ? reg84 : reg84)) ?
          ((-reg89) <= $unsigned(reg82)) : wire76) << reg86));
      reg93 <= ((($unsigned((reg75 ?
              reg92 : wire71)) <<< $unsigned((~wire66))) << $signed(({wire76} + $unsigned(reg86)))) ?
          (((|(~&reg91)) >>> $unsigned($unsigned(reg88))) ?
              wire77[(4'hb):(4'h9)] : $unsigned($unsigned(wire69))) : {(reg86[(4'ha):(2'h2)] ?
                  (8'h9f) : wire79[(1'h0):(1'h0)]),
              ($unsigned(reg80) != (reg75 ? $signed(reg84) : (~wire68)))});
    end
  always
    @(posedge clk) begin
      if (wire77)
        begin
          reg94 <= $unsigned({wire77[(4'hd):(4'h9)]});
          reg95 <= (reg89[(2'h2):(1'h0)] ?
              $unsigned(((((8'hb2) ? reg80 : wire76) ?
                      (reg94 > wire67) : (reg92 <= wire76)) ?
                  $signed($unsigned(wire77)) : reg94)) : $unsigned($unsigned(($signed(wire66) ^~ reg84))));
          reg96 <= {(-(8'ha1))};
        end
      else
        begin
          if ((~^(8'hb9)))
            begin
              reg94 <= wire71;
            end
          else
            begin
              reg94 <= $signed(reg93);
            end
          reg95 <= ((((reg93[(4'hb):(4'h9)] != (reg86 ? wire66 : reg80)) ?
              $signed($unsigned(wire74)) : reg89) <<< ((~&(~|(8'h9e))) ?
              wire73 : {reg84,
                  (wire76 ^ wire67)})) ^ (reg96[(3'h5):(2'h3)] && $signed((8'ha2))));
          reg96 <= (&wire74);
        end
      reg97 <= ($signed($unsigned($signed($signed(wire70)))) ?
          $unsigned((($unsigned(reg75) ^ reg83[(3'h6):(3'h4)]) ~^ {(!reg81),
              wire77})) : ((|wire78) ?
              $unsigned(reg92) : $unsigned($signed((reg89 != wire66)))));
      reg98 <= {($signed((reg89[(2'h2):(1'h1)] < $signed(reg83))) ?
              $signed(wire74[(4'h8):(3'h7)]) : {(((8'ha6) ? wire78 : (8'h9e)) ?
                      (~^wire79) : (~wire67)),
                  (reg85[(4'h8):(1'h1)] <<< ((7'h41) ? reg84 : (8'hae)))}),
          reg97[(3'h5):(1'h0)]};
      reg99 <= {wire79, reg82};
      reg100 <= $signed(reg86);
    end
  assign wire101 = $unsigned(reg89);
  always
    @(posedge clk) begin
      reg102 <= (($unsigned((reg87[(2'h2):(1'h0)] + $signed(reg85))) <= ({(|reg95)} ?
          (((8'ha6) > reg87) ?
              $signed(reg82) : reg92[(2'h2):(2'h2)]) : $unsigned(wire70[(3'h6):(3'h6)]))) | wire70);
      if ((~&$unsigned($unsigned(({wire101, wire73} ?
          $signed(reg90) : wire68)))))
        begin
          if (wire71[(5'h10):(4'hf)])
            begin
              reg103 <= $unsigned((~^$unsigned($unsigned((-wire69)))));
              reg104 <= (wire68[(5'h10):(2'h3)] & reg96[(4'h9):(4'h8)]);
              reg105 <= ({($unsigned((8'hae)) ?
                      {(reg99 ? wire72 : reg85)} : (|$unsigned(wire67))),
                  $unsigned((^$unsigned(reg100)))} - {reg81,
                  ((~&(wire69 ? reg81 : reg97)) ?
                      reg86 : {(reg99 ? wire73 : wire69), {reg103, wire69}})});
              reg106 <= (-(|((reg96[(1'h1):(1'h0)] | reg103[(5'h12):(3'h6)]) - wire71[(1'h0):(1'h0)])));
            end
          else
            begin
              reg103 <= reg104;
              reg104 <= reg80;
              reg105 <= (~^((($unsigned(reg85) ?
                  reg91 : (reg100 >= reg86)) || {$signed(wire79)}) < wire72));
              reg106 <= $signed({{wire68[(4'hd):(2'h3)]}});
            end
        end
      else
        begin
          reg103 <= reg104[(3'h5):(1'h0)];
          reg104 <= (($signed($signed((wire76 >>> reg100))) ?
              reg93 : ((-reg88[(1'h1):(1'h0)]) ?
                  $signed(reg92[(1'h1):(1'h0)]) : (+(reg106 ?
                      reg81 : wire66)))) + ((-reg106[(1'h0):(1'h0)]) ?
              reg91 : (8'ha3)));
          reg105 <= reg90;
        end
    end
endmodule

module module29
#(parameter param61 = (~|((((^~(8'h9c)) ? ((8'ha7) * (8'ha8)) : ((8'hac) & (8'ha3))) ~^ (~^{(7'h41), (7'h41)})) && ((!(-(8'hbc))) ? (((8'hb7) && (8'ha6)) ^ (~^(8'hb6))) : (((8'hb6) ^~ (8'hb3)) ^ (!(8'haf)))))))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire34;
  input wire signed [(3'h6):(1'h0)] wire33;
  input wire signed [(5'h10):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  input wire signed [(2'h2):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire53,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 (1'h0)};
  assign wire35 = wire31[(4'he):(2'h2)];
  assign wire36 = wire30;
  assign wire37 = ((-wire36[(3'h7):(1'h1)]) ?
                      wire36[(4'hb):(4'hb)] : ({((wire34 < wire35) < $signed(wire30)),
                              {{wire35, (8'ha7)}, {wire35}}} ?
                          ($unsigned(wire32) ?
                              $signed((wire30 ?
                                  wire33 : wire30)) : (!(!wire32))) : wire31[(5'h14):(4'hd)]));
  assign wire38 = $signed(wire34);
  always
    @(posedge clk) begin
      if ($unsigned((8'h9d)))
        begin
          reg39 <= $signed({{(wire36[(1'h0):(1'h0)] - (wire36 ?
                      wire37 : wire31)),
                  (wire31[(4'h9):(4'h9)] <<< wire37[(2'h3):(2'h2)])},
              ((wire30 ? wire32[(4'hb):(3'h7)] : $signed(wire32)) ^ wire38)});
        end
      else
        begin
          reg39 <= ((((wire35[(3'h4):(2'h3)] >> wire30[(1'h1):(1'h0)]) + (^{(8'hb2),
              (8'ha7)})) < $unsigned((~&(~^wire37)))) > $signed(wire30));
          reg40 <= (7'h43);
          if ({((~^($unsigned(reg39) >> (wire32 <<< wire32))) ?
                  ({$unsigned(reg39), (^reg40)} ?
                      reg40[(3'h4):(1'h1)] : ($signed(wire33) ?
                          wire38[(1'h1):(1'h1)] : wire37[(4'h9):(4'h8)])) : $signed(wire31))})
            begin
              reg41 <= $signed((((^~((8'h9d) ?
                      wire33 : wire31)) <= $signed($unsigned(wire37))) ?
                  (~^$unsigned($signed(wire33))) : $unsigned((8'ha2))));
              reg42 <= ($signed((~|reg40[(3'h6):(1'h1)])) * ((8'hbd) ~^ $signed((wire35[(2'h2):(2'h2)] ?
                  (wire34 && wire34) : {reg39, wire33}))));
              reg43 <= (({$signed($signed(wire36)),
                          (wire36[(4'h8):(1'h1)] >> $unsigned(reg42))} ?
                      wire31[(4'ha):(3'h4)] : ((-(!wire34)) ?
                          reg40[(1'h0):(1'h0)] : $signed((+wire36)))) ?
                  reg39[(4'h9):(4'h8)] : $unsigned({(!{wire31, reg41}),
                      $signed($unsigned((8'ha8)))}));
              reg44 <= (wire37 ?
                  (!$signed((8'ha7))) : $unsigned($unsigned(((wire36 ?
                          wire37 : wire36) ?
                      $signed(wire32) : (reg41 || wire36)))));
              reg45 <= wire37;
            end
          else
            begin
              reg41 <= (($signed(reg43[(1'h0):(1'h0)]) <= ($unsigned(((8'h9f) ?
                      reg43 : wire36)) ?
                  $signed((wire31 ?
                      wire31 : wire30)) : $signed($unsigned(wire36)))) == (($unsigned($unsigned(reg42)) ?
                      {reg45[(3'h4):(2'h2)], reg44} : $unsigned((8'h9c))) ?
                  ((((8'hb0) ? (8'hb8) : reg43) ?
                      wire38[(2'h3):(1'h1)] : (wire34 << (8'ha2))) - reg40[(3'h5):(2'h3)]) : (8'ha6)));
              reg42 <= wire38;
              reg43 <= $signed((8'ha0));
              reg44 <= {reg45,
                  ($signed(wire30) ?
                      reg42[(2'h3):(1'h1)] : reg43[(1'h1):(1'h0)])};
            end
          reg46 <= reg42[(2'h2):(2'h2)];
          if (($signed($signed(reg41[(2'h3):(1'h0)])) ?
              ($signed(((reg42 && wire35) ? (wire34 && reg41) : (7'h42))) ?
                  $signed($signed((wire37 ?
                      reg41 : reg41))) : (^~(wire37[(3'h5):(1'h1)] ?
                      $unsigned(reg46) : {wire35}))) : {(~|{(reg41 ?
                          wire35 : wire34)}),
                  (&$unsigned((reg45 ? wire33 : wire37)))}))
            begin
              reg47 <= wire31;
              reg48 <= wire38[(2'h3):(1'h0)];
            end
          else
            begin
              reg47 <= (&{$signed($unsigned(((8'ha1) ? reg44 : wire32))),
                  (reg46[(1'h0):(1'h0)] ?
                      reg44 : $unsigned((reg40 >>> reg44)))});
              reg48 <= reg47;
            end
        end
      reg49 <= {reg39[(2'h2):(1'h1)],
          $unsigned((reg39 < $signed($signed(wire36))))};
      reg50 <= (reg49[(1'h0):(1'h0)] >= (((((8'hb8) * reg39) <<< $unsigned(reg48)) << reg44) ?
          wire31 : ({(reg42 ? wire34 : wire37),
              wire30[(1'h0):(1'h0)]} <= (reg45 ?
              $signed(wire36) : (wire36 + (8'hbc))))));
      reg51 <= (reg39[(5'h10):(4'h9)] + (reg44[(3'h4):(1'h1)] != (!(((8'hbb) << wire33) ~^ $unsigned((8'hab))))));
      reg52 <= reg39[(2'h3):(1'h1)];
    end
  assign wire53 = $unsigned(wire35[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg54 <= (reg49[(2'h3):(1'h0)] ? wire36 : reg47);
      reg55 <= (wire53[(1'h0):(1'h0)] ?
          ($signed((~|$unsigned((8'ha5)))) || $signed(wire33)) : ((~^($signed((8'hb7)) << wire33)) ?
              (reg49 ?
                  ($unsigned(reg49) ?
                      reg49 : (reg48 | reg46)) : reg45[(1'h1):(1'h0)]) : $signed(reg42)));
      reg56 <= (^~wire33[(1'h1):(1'h1)]);
      reg57 <= wire38[(1'h0):(1'h0)];
    end
  assign wire58 = ((($unsigned((wire33 ?
                      reg42 : reg55)) ^ reg44) < reg47[(3'h4):(2'h2)]) << reg50);
  assign wire59 = ((wire37[(1'h0):(1'h0)] ?
                          (reg48[(1'h1):(1'h0)] + reg51) : ($unsigned((wire58 && (8'hba))) ~^ ({wire32} ?
                              {wire32, wire37} : reg43))) ?
                      {reg54[(1'h0):(1'h0)], reg49} : wire36);
  assign wire60 = {reg47};
endmodule

module module140
#(parameter param155 = ((8'had) == {({(|(8'h9c))} ? (|(8'hba)) : (((7'h44) ? (8'ha2) : (8'hae)) > {(8'hba), (8'hb2)})), ((((8'hb1) ? (7'h40) : (8'ha9)) <<< {(8'hb8)}) ? {((8'h9f) ? (7'h44) : (8'ha5)), ((8'ha5) ? (8'h9d) : (8'ha7))} : {{(8'hb8), (8'hae)}, {(8'hb1)}})}))
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire145;
  input wire signed [(4'h8):(1'h0)] wire144;
  input wire signed [(4'hb):(1'h0)] wire143;
  input wire [(5'h15):(1'h0)] wire142;
  input wire [(5'h13):(1'h0)] wire141;
  wire [(4'hf):(1'h0)] wire154;
  wire [(5'h10):(1'h0)] wire148;
  wire signed [(5'h13):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire146;
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  assign y = {wire154,
                 wire148,
                 wire147,
                 wire146,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 (1'h0)};
  assign wire146 = {wire145};
  assign wire147 = ($signed($unsigned(wire146[(4'hf):(1'h1)])) >> (~&wire145[(1'h0):(1'h0)]));
  assign wire148 = {(wire144 >>> ($unsigned((~|wire142)) <= (wire141 ?
                           wire142 : wire141)))};
  always
    @(posedge clk) begin
      if ($unsigned({{(wire148[(4'he):(1'h1)] ?
                  $signed(wire142) : wire145[(3'h4):(1'h0)])},
          $signed({{wire147, (8'haf)}})}))
        begin
          reg149 <= ((~|$signed($signed((~|wire144)))) ?
              wire145 : ({$unsigned($unsigned(wire147))} && wire145[(1'h0):(1'h0)]));
          reg150 <= (~^(wire141 & {$unsigned(wire141)}));
          if ({{($signed({wire147}) ? {$signed(wire146)} : wire146)}})
            begin
              reg151 <= ($signed((($signed((8'hb4)) ?
                      reg150 : (wire146 ? (8'haf) : wire147)) ?
                  (|(~^wire141)) : wire142[(4'he):(4'h9)])) ^~ $unsigned(wire148));
              reg152 <= wire143[(2'h3):(1'h1)];
            end
          else
            begin
              reg151 <= $signed($unsigned(($signed(wire145) + wire142[(2'h2):(1'h0)])));
              reg152 <= $signed(reg151[(4'h9):(3'h4)]);
              reg153 <= $signed({$unsigned($unsigned((wire144 ?
                      (8'h9c) : (8'h9c))))});
            end
        end
      else
        begin
          reg149 <= (wire142[(3'h5):(3'h4)] | ((8'hbf) ?
              wire143[(3'h7):(1'h1)] : (reg152 ?
                  $signed((&wire141)) : $unsigned((reg151 ?
                      (8'hbd) : (8'hbb))))));
        end
    end
  assign wire154 = wire144[(3'h7):(3'h7)];
endmodule
