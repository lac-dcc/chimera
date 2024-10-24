module top
#(parameter param155 = (-((!(~(~^(8'hb2)))) <= (({(8'hbd)} == ((7'h40) << (7'h43))) - {(!(8'hab)), (!(8'h9d))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire154;
  wire signed [(4'h8):(1'h0)] wire153;
  wire [(3'h4):(1'h0)] wire152;
  wire [(3'h7):(1'h0)] wire151;
  wire [(5'h10):(1'h0)] wire146;
  wire [(4'hf):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire143;
  wire signed [(5'h13):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire140;
  wire signed [(4'h8):(1'h0)] wire139;
  wire [(5'h14):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire signed [(5'h14):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire146,
                 wire145,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire134,
                 wire5,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg144,
                 (1'h0)};
  assign wire5 = wire2;
  module6 #() modinst135 (.clk(clk), .y(wire134), .wire10(wire4), .wire7(wire3), .wire8(wire5), .wire9(wire2));
  assign wire136 = wire5;
  assign wire137 = {$signed({({wire4} <= {wire4})})};
  assign wire138 = (+(&$signed($signed((wire1 >= wire5)))));
  assign wire139 = (($unsigned({wire136[(2'h2):(1'h1)],
                               wire137[(1'h1):(1'h0)]}) ?
                           wire1[(1'h1):(1'h0)] : {$unsigned((~|wire5)),
                               (^~$unsigned((8'ha4)))}) ?
                       (^~wire136[(5'h13):(1'h1)]) : {((-{(7'h44), wire136}) ?
                               wire1[(4'he):(3'h5)] : wire1[(4'h9):(2'h3)]),
                           $unsigned((^~wire5[(3'h5):(3'h5)]))});
  assign wire140 = (~&wire136[(4'h8):(2'h2)]);
  assign wire141 = (&(wire3[(4'h9):(2'h3)] >> wire136));
  assign wire142 = wire134;
  assign wire143 = wire142;
  always
    @(posedge clk) begin
      reg144 <= ($signed(wire3) >> ({(~|wire5),
          $signed((~^wire137))} | (wire139[(3'h6):(1'h0)] || wire137)));
    end
  assign wire145 = wire140[(2'h3):(2'h3)];
  assign wire146 = (|((-wire136) ? (8'h9f) : {(8'hb7)}));
  always
    @(posedge clk) begin
      reg147 <= (wire139[(2'h2):(2'h2)] > {wire5,
          $signed({{wire146, wire140}})});
      reg148 <= (wire0[(3'h4):(2'h2)] ?
          $signed(($unsigned($signed(wire137)) >= reg147[(1'h0):(1'h0)])) : $signed(($unsigned($unsigned(wire145)) + ((~^wire139) ?
              $unsigned(wire142) : wire138[(2'h2):(1'h1)]))));
      reg149 <= {(wire0 - $unsigned((~(wire146 ? reg148 : wire3))))};
      reg150 <= wire142;
    end
  assign wire151 = $unsigned(wire1[(3'h6):(3'h4)]);
  assign wire152 = $unsigned($unsigned((reg144[(1'h0):(1'h0)] && ({(7'h40)} + $unsigned(wire5)))));
  assign wire153 = (+(~|((&(reg150 ? wire152 : reg147)) ?
                       (reg150[(3'h7):(3'h4)] ^~ (wire1 ?
                           reg147 : wire134)) : $unsigned($unsigned(wire152)))));
  assign wire154 = wire151;
endmodule

module module6
#(parameter param133 = (!(^(({(8'ha5)} ? {(8'hbb)} : {(8'ha2)}) ? (((8'ha8) != (8'hbf)) & (8'h9c)) : ((-(8'hab)) ? {(8'hb4), (8'hab)} : ((8'hb2) >> (8'h9f)))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(2'h3):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire95;
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  assign y = {wire131,
                 wire97,
                 wire78,
                 wire50,
                 wire49,
                 wire48,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire31,
                 wire32,
                 wire46,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire95,
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
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 (1'h0)};
  assign wire11 = $unsigned((!wire10[(2'h3):(1'h1)]));
  assign wire12 = (((|(-$unsigned(wire9))) >>> (+$unsigned({(8'ha6),
                      wire10}))) ^ (^wire10));
  assign wire13 = $signed(((|{(wire10 < wire8)}) ?
                      wire7 : {(^wire12), {(&wire10), $unsigned(wire11)}}));
  assign wire14 = {wire13};
  assign wire15 = (wire14 < $unsigned(wire8[(4'hc):(3'h6)]));
  assign wire16 = wire15;
  always
    @(posedge clk) begin
      reg17 <= ($unsigned(($unsigned(wire12[(1'h0):(1'h0)]) ?
          $unsigned((~&wire15)) : wire14)) <<< (((wire8[(3'h4):(3'h4)] || (|wire7)) != (~&((7'h41) ?
          wire16 : wire12))) || $unsigned((-$unsigned((8'ha5))))));
      reg18 <= wire13;
      if ((+wire15))
        begin
          reg19 <= $signed(($signed($unsigned((~|(8'hb8)))) ?
              reg18 : {wire13, $unsigned($signed((8'ha6)))}));
          reg20 <= (wire9[(1'h0):(1'h0)] ? (8'haf) : wire9);
        end
      else
        begin
          if (((^~(reg19[(3'h5):(1'h1)] & $unsigned((reg19 ?
                  (8'hb2) : wire14)))) ?
              wire14[(3'h5):(2'h2)] : wire9))
            begin
              reg19 <= ($signed($unsigned($signed({wire8,
                  wire16}))) >> {$unsigned((&wire9))});
              reg20 <= wire15;
              reg21 <= $unsigned((reg17 <= (wire7 ? reg17 : wire13)));
              reg22 <= ((wire15[(2'h2):(1'h1)] ?
                      reg21 : wire13[(4'hb):(4'hb)]) ?
                  (reg18[(2'h2):(1'h0)] ?
                      (~^$unsigned($unsigned(wire16))) : ((~((8'ha3) ?
                          wire14 : wire10)) ^ {wire14[(3'h5):(2'h3)],
                          wire11[(3'h6):(2'h2)]})) : reg20);
              reg23 <= ($unsigned(((^$signed(reg17)) != (|(~reg17)))) >>> $signed((($signed(reg19) ?
                  reg22[(4'h8):(3'h7)] : (~|reg20)) >> wire14)));
            end
          else
            begin
              reg19 <= wire16[(2'h2):(1'h0)];
              reg20 <= (((wire16 - wire16[(2'h3):(1'h1)]) & $unsigned((8'ha1))) << ({$unsigned((reg21 <<< reg19)),
                  (reg21[(1'h1):(1'h0)] ?
                      wire14[(1'h1):(1'h1)] : $signed(wire7))} == ({wire14[(3'h4):(1'h1)]} ?
                  $unsigned(wire11[(4'he):(1'h1)]) : (8'hb2))));
            end
          reg24 <= (^(reg20 | (wire7[(3'h7):(3'h4)] ^ $signed($unsigned(wire10)))));
          if (reg18[(2'h3):(2'h3)])
            begin
              reg25 <= $signed({wire7});
              reg26 <= (^(reg19 <= reg18));
              reg27 <= $unsigned(reg18[(2'h2):(2'h2)]);
              reg28 <= ({$unsigned(wire13)} ? reg19 : wire8);
              reg29 <= ({$unsigned(($unsigned(reg27) == (wire16 ?
                      wire13 : reg17)))} != $signed(reg19[(2'h2):(2'h2)]));
            end
          else
            begin
              reg25 <= $signed(reg25);
              reg26 <= wire15[(1'h1):(1'h0)];
            end
        end
      reg30 <= $unsigned(($signed({(reg29 | reg25),
          $signed(reg28)}) > reg17[(4'hc):(4'hc)]));
    end
  assign wire31 = (+wire10[(2'h2):(2'h2)]);
  assign wire32 = $unsigned(wire15[(2'h2):(2'h2)]);
  module33 #() modinst47 (wire46, clk, wire9, reg22, reg17, reg28, reg19);
  assign wire48 = wire8[(4'hd):(4'h8)];
  assign wire49 = $unsigned(((8'hba) < $signed($signed((|reg19)))));
  assign wire50 = wire49;
  module51 #() modinst79 (.wire54(reg27), .wire55(reg18), .wire53(reg22), .y(wire78), .wire52(wire32), .clk(clk));
  assign wire80 = (reg25 * $signed($unsigned(wire12[(1'h0):(1'h0)])));
  assign wire81 = {wire80[(4'h8):(3'h6)]};
  assign wire82 = (wire31 || ((wire78 & reg25[(3'h5):(1'h0)]) == (~{(reg21 ?
                          wire8 : wire11),
                      $signed(wire48)})));
  assign wire83 = (({{(~&reg21)}, reg17} ?
                      (reg23 ?
                          $unsigned({reg25,
                              reg17}) : wire10) : $unsigned(($signed(wire50) | $signed(wire7)))) == $signed($unsigned(wire9)));
  module84 #() modinst96 (.clk(clk), .wire85(wire82), .y(wire95), .wire88(reg30), .wire86(reg26), .wire89(reg18), .wire87(reg19));
  assign wire97 = (reg18 ?
                      (~&$signed(wire80[(2'h2):(2'h2)])) : (wire81 ?
                          {((-reg28) >>> reg23)} : {$signed(wire78[(2'h3):(1'h1)])}));
  always
    @(posedge clk) begin
      reg98 <= reg19;
      reg99 <= wire50[(2'h3):(1'h1)];
      reg100 <= (8'haf);
      reg101 <= ($signed($signed($signed((wire13 - (8'h9c))))) <<< $signed(reg30[(1'h0):(1'h0)]));
    end
  module102 #() modinst132 (.wire106(reg23), .y(wire131), .wire103(wire7), .wire104(reg24), .wire105(wire82), .clk(clk), .wire107(reg21));
endmodule

module module102  (y, clk, wire107, wire106, wire105, wire104, wire103);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire107;
  input wire [(3'h6):(1'h0)] wire106;
  input wire signed [(5'h15):(1'h0)] wire105;
  input wire signed [(3'h4):(1'h0)] wire104;
  input wire [(3'h5):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire130;
  wire signed [(2'h2):(1'h0)] wire129;
  wire signed [(5'h12):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire127;
  wire [(4'hd):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire125;
  wire [(5'h13):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire108;
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
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
                 (1'h0)};
  assign wire108 = (~&($signed(wire107) ?
                       $signed(({wire104} ?
                           wire104[(2'h3):(1'h1)] : (-wire105))) : wire107[(3'h4):(1'h1)]));
  assign wire109 = wire104;
  assign wire110 = wire104[(3'h4):(1'h1)];
  assign wire111 = (|(!wire109));
  always
    @(posedge clk) begin
      if ((7'h42))
        begin
          reg112 <= (($unsigned(wire109[(5'h12):(3'h6)]) ?
              $signed(wire109) : ({wire104[(1'h0):(1'h0)]} ?
                  (^$unsigned(wire108)) : (wire111[(1'h1):(1'h0)] & (wire104 ?
                      (7'h44) : wire103)))) && (-$unsigned($signed((~wire107)))));
          reg113 <= $unsigned($signed(($unsigned(((7'h42) ?
              wire111 : (8'hab))) | ((~|wire109) < {wire111}))));
        end
      else
        begin
          reg112 <= ((wire104 ?
              wire111[(3'h4):(1'h1)] : ((!(wire107 >= reg113)) && ($unsigned((8'hb0)) ?
                  {(8'ha1)} : (+(8'hb5))))) ^ wire111);
        end
      reg114 <= ($unsigned(wire104[(1'h0):(1'h0)]) ?
          (+wire108[(1'h0):(1'h0)]) : ($signed((^~$signed(wire107))) >>> wire110));
    end
  always
    @(posedge clk) begin
      reg115 <= ($signed($signed({(wire105 || reg113)})) ?
          (~&wire104[(2'h3):(1'h0)]) : wire103[(3'h5):(1'h1)]);
      reg116 <= wire111[(3'h6):(3'h4)];
      reg117 <= (wire106[(3'h4):(2'h3)] ?
          (+wire107[(1'h1):(1'h0)]) : (wire110 ?
              $signed($signed($unsigned(wire109))) : (+reg113)));
      reg118 <= ((reg113[(1'h0):(1'h0)] ^~ (~|wire108[(4'hb):(4'hb)])) ?
          (reg113 << wire106[(1'h1):(1'h1)]) : ($signed(wire109) ?
              (!$unsigned($signed(wire109))) : reg115[(3'h4):(1'h1)]));
      reg119 <= {(~reg118), reg116};
    end
  always
    @(posedge clk) begin
      reg120 <= reg117;
      reg121 <= (+{$unsigned($unsigned(((8'ha1) > wire110))),
          reg120[(1'h1):(1'h1)]});
      reg122 <= (~^(+(wire103[(3'h4):(1'h1)] ?
          wire106 : (reg121[(1'h1):(1'h1)] * $unsigned(reg119)))));
    end
  assign wire123 = ($unsigned((($unsigned(reg117) || $unsigned(wire109)) >>> reg112[(3'h4):(2'h3)])) + $signed(wire111));
  assign wire124 = (~^(wire105 ?
                       $unsigned(wire107[(3'h7):(2'h3)]) : $signed(reg118)));
  assign wire125 = (|$unsigned({wire123, ($signed((8'ha5)) | (-wire109))}));
  assign wire126 = ({$signed(($signed(wire124) ?
                           (wire107 ?
                               (8'ha4) : reg114) : (wire103 == wire103)))} >> {reg119[(3'h5):(3'h5)]});
  assign wire127 = (wire111 ?
                       wire125 : $unsigned({$unsigned($signed(wire110)),
                           (|(7'h41))}));
  assign wire128 = reg118;
  assign wire129 = $unsigned(wire126);
  assign wire130 = ($unsigned($signed({wire123[(3'h7):(3'h4)]})) == (8'hb5));
endmodule

module module84
#(parameter param94 = ((~&(+(^{(8'hb8)}))) ? ((^~((+(7'h43)) << (^(8'hba)))) || ((&((8'hac) ? (8'hba) : (8'h9e))) | {((8'ha4) >> (8'hbd)), ((8'h9e) ^ (8'hb9))})) : ({(((8'ha6) ? (8'ha7) : (8'hb2)) + (|(8'hbb))), (((7'h42) ? (8'had) : (8'hb8)) ? (~&(8'hb5)) : (~&(8'had)))} >> ((|((8'hac) != (8'hae))) == (|((8'hb7) || (8'hb3)))))))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire89;
  input wire signed [(4'he):(1'h0)] wire88;
  input wire [(3'h6):(1'h0)] wire87;
  input wire signed [(5'h15):(1'h0)] wire86;
  input wire [(4'hc):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  assign y = {wire93, wire92, wire91, wire90, (1'h0)};
  assign wire90 = (wire89 ? $signed(wire86) : ({wire87} ? (+wire86) : wire87));
  assign wire91 = (-wire87[(3'h6):(3'h6)]);
  assign wire92 = $signed($signed((&$signed((wire90 ? wire91 : (8'haf))))));
  assign wire93 = wire90[(3'h7):(3'h5)];
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire55;
  input wire [(4'h8):(1'h0)] wire54;
  input wire signed [(5'h10):(1'h0)] wire53;
  input wire signed [(2'h3):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire [(2'h3):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire56 = (((8'hbf) ?
                          ($unsigned($signed((8'ha6))) != {(+wire52)}) : $unsigned($unsigned($unsigned(wire52)))) ?
                      {$unsigned($unsigned($unsigned((8'hb6))))} : wire55[(3'h6):(2'h3)]);
  assign wire57 = wire54[(1'h0):(1'h0)];
  assign wire58 = {$signed(wire57)};
  assign wire59 = (((8'ha9) ?
                      $unsigned((&$unsigned(wire56))) : {wire58[(3'h7):(3'h7)]}) || wire52);
  assign wire60 = wire58[(1'h1):(1'h0)];
  assign wire61 = $signed((^$signed(($signed((8'hb2)) ?
                      ((8'hbc) ? wire58 : (7'h40)) : wire60))));
  assign wire62 = ({(8'hba)} | wire54[(1'h1):(1'h1)]);
  assign wire63 = $signed({{(wire54[(3'h5):(2'h2)] ?
                              (wire62 == (8'ha6)) : {wire54}),
                          $unsigned((wire54 ? wire60 : wire58))}});
  assign wire64 = wire56;
  assign wire65 = wire54[(3'h5):(2'h3)];
  assign wire66 = wire63[(2'h3):(1'h0)];
  assign wire67 = (($signed($unsigned({(8'hb1)})) ^~ (^wire53)) * {$unsigned((!wire58[(3'h5):(2'h3)]))});
  always
    @(posedge clk) begin
      reg68 <= ($signed({$signed(wire61[(2'h3):(1'h0)]),
          $signed($signed(wire59))}) ~^ ($signed((wire57[(4'hb):(3'h6)] ?
          $unsigned(wire65) : wire52[(2'h2):(1'h0)])) & wire64));
      reg69 <= wire54[(3'h4):(3'h4)];
      reg70 <= $signed($unsigned((|{(wire61 << wire61)})));
    end
  assign wire71 = (-((8'hb0) ?
                      $signed($unsigned($signed(reg69))) : wire58[(4'ha):(3'h4)]));
  assign wire72 = wire57;
  assign wire73 = ((8'hab) ?
                      {(($signed(wire53) ?
                              (wire62 ~^ wire65) : (^~wire62)) || (~$signed((8'hbe))))} : wire52[(1'h0):(1'h0)]);
  assign wire74 = (^~((&(8'ha5)) ?
                      wire56 : ($unsigned((wire63 >> reg68)) ?
                          {(wire66 <= wire57)} : (!{wire54, reg68}))));
  assign wire75 = $unsigned(reg68);
  assign wire76 = {$unsigned({($unsigned(reg69) < {(8'hb3)})})};
  assign wire77 = ((wire72 <= reg69[(2'h3):(1'h1)]) + (wire52 ?
                      wire52 : wire59[(2'h2):(1'h1)]));
endmodule

module module33
#(parameter param44 = ((~((((8'hb0) ? (8'hbd) : (8'h9c)) ? (|(8'h9e)) : ((8'hb1) ? (8'hb7) : (8'h9f))) ? (~^(^~(8'h9c))) : {(+(8'ha5))})) ? ((8'hb3) ? (((-(8'ha5)) ~^ ((8'hbd) ? (8'hb2) : (8'ha7))) ? (((8'hb7) ? (7'h41) : (8'hb3)) ? (~&(8'hac)) : ((7'h43) && (8'hb7))) : ((!(8'ha0)) ^ (~^(7'h43)))) : ((&((8'hb7) == (8'h9e))) ^~ (-((8'hbb) ? (8'hb9) : (8'ha1))))) : (((8'h9d) << {((8'ha5) ? (8'hbe) : (8'ha0))}) && {({(8'hb3), (8'hb3)} ? ((8'ha8) ? (8'had) : (8'hb2)) : ((8'ha0) ? (8'hbd) : (8'hbc)))})), 
parameter param45 = (({((8'hb4) >= (param44 ^ param44)), param44} || ((+param44) << (8'hbb))) != ((7'h44) ? param44 : ((8'h9e) ? param44 : ((|param44) >>> (param44 >= param44))))))
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire38;
  input wire [(3'h5):(1'h0)] wire37;
  input wire signed [(4'hf):(1'h0)] wire36;
  input wire signed [(4'h8):(1'h0)] wire35;
  input wire [(3'h7):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  assign y = {wire43, wire42, wire41, wire40, wire39, (1'h0)};
  assign wire39 = $unsigned($signed((&(8'hb6))));
  assign wire40 = (~|$signed(((((8'hae) ? wire36 : (8'hae)) ?
                          (wire37 <= wire35) : wire38[(3'h6):(1'h0)]) ?
                      $signed((wire38 ? wire39 : wire35)) : wire36)));
  assign wire41 = ({(+wire39),
                      (wire38[(2'h3):(1'h0)] * {wire40[(1'h0):(1'h0)]})} <= wire35[(3'h7):(2'h2)]);
  assign wire42 = wire37;
  assign wire43 = wire42;
endmodule
