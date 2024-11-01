module top
#(parameter param174 = ((~{{(-(8'hab))}, {((8'ha7) ? (7'h42) : (8'ha5))}}) ? {((8'h9f) || ((+(8'hb7)) ? {(8'haf), (8'haa)} : ((8'hae) << (8'ha0))))} : ((!(~|(^~(8'h9d)))) ? ({((8'hbc) ? (8'hab) : (8'ha8)), (~|(8'ha4))} && ((|(8'had)) ? {(8'hbc), (8'hb2)} : ((8'hbf) ? (8'hb7) : (8'h9c)))) : (^~{(^~(8'ha2)), (-(8'h9f))}))), 
parameter param175 = {((!param174) ? param174 : (((~|param174) - (param174 ~^ param174)) ? (&(~(8'hab))) : param174)), ({(param174 ? (8'hba) : (param174 << param174))} ~^ (~{(-param174), (param174 ? param174 : param174)}))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire134;
  wire [(4'he):(1'h0)] wire135;
  wire signed [(3'h7):(1'h0)] wire136;
  wire signed [(4'hb):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire138;
  wire [(5'h10):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire172;
  assign y = {wire132,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 wire138,
                 wire139,
                 wire172,
                 (1'h0)};
  assign wire5 = ($unsigned(wire2) <= (wire0[(3'h7):(1'h0)] ^ wire0));
  assign wire6 = (($signed($unsigned($unsigned(wire0))) * {$unsigned($unsigned(wire1))}) ?
                     {$signed(wire5),
                         wire4} : $unsigned({($signed(wire0) == $unsigned(wire1)),
                         wire4[(3'h4):(2'h2)]}));
  assign wire7 = ($signed(wire1) >>> (|(~^wire6)));
  assign wire8 = $signed((wire2[(3'h4):(2'h3)] == (wire0[(4'h9):(4'h8)] ?
                     ((~|(8'h9c)) >= wire6) : (~|{wire1, wire4}))));
  assign wire9 = ($signed(wire5) ?
                     $unsigned($unsigned($unsigned(wire0))) : wire3);
  module10 #() modinst133 (wire132, clk, wire5, wire2, wire4, wire3, wire9);
  assign wire134 = $signed(wire3);
  assign wire135 = wire134;
  assign wire136 = ({wire7[(3'h5):(3'h4)], ($unsigned((!wire134)) & wire4)} ?
                       wire7[(3'h6):(3'h5)] : ((({wire2, (8'ha8)} ?
                               wire135[(4'hc):(3'h7)] : (|wire1)) ?
                           wire5 : wire6[(3'h6):(3'h6)]) != $unsigned($unsigned(wire134))));
  assign wire137 = wire9[(4'hc):(2'h3)];
  assign wire138 = $signed(wire8[(5'h12):(4'h8)]);
  assign wire139 = ((({wire3[(4'ha):(4'h9)]} >= wire135) >= ((wire138 ?
                               $unsigned(wire137) : $unsigned(wire2)) ?
                           $unsigned((wire3 ?
                               wire9 : wire1)) : $signed((^~wire4)))) ?
                       (~^wire137) : {wire134[(4'hb):(4'h8)]});
  module140 #() modinst173 (wire172, clk, wire6, wire1, wire7, wire137, wire5);
endmodule

module module140
#(parameter param170 = (({{(~|(8'ha4)), ((7'h43) ? (7'h44) : (8'ha9))}} ? (8'haa) : {({(8'hb8)} || {(8'h9c), (8'hab)}), (~&((8'hbc) ? (8'hb5) : (8'h9d)))}) << (((~^(-(8'ha7))) ? (((8'ha5) & (8'ha9)) == ((8'ha5) - (8'hac))) : (((8'hbe) != (8'hba)) || ((8'ha5) - (8'ha2)))) < (|(((8'ha1) && (8'h9c)) ? ((8'ha4) && (7'h43)) : (~|(8'hb1)))))), 
parameter param171 = param170)
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire145;
  input wire [(3'h7):(1'h0)] wire144;
  input wire [(5'h11):(1'h0)] wire143;
  input wire [(3'h7):(1'h0)] wire142;
  input wire signed [(5'h12):(1'h0)] wire141;
  wire [(4'hb):(1'h0)] wire169;
  wire signed [(4'hb):(1'h0)] wire168;
  wire signed [(3'h5):(1'h0)] wire167;
  wire signed [(5'h12):(1'h0)] wire166;
  wire signed [(3'h5):(1'h0)] wire147;
  wire [(5'h13):(1'h0)] wire146;
  reg signed [(3'h7):(1'h0)] reg165 = (1'h0);
  reg [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(4'he):(1'h0)] reg162 = (1'h0);
  reg [(4'hd):(1'h0)] reg161 = (1'h0);
  reg [(3'h5):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg [(4'hd):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire147,
                 wire146,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
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
                 (1'h0)};
  assign wire146 = wire141[(4'h8):(3'h7)];
  assign wire147 = wire146[(4'he):(3'h4)];
  always
    @(posedge clk) begin
      reg148 <= (|wire144[(3'h5):(1'h0)]);
      reg149 <= wire146[(3'h4):(3'h4)];
      reg150 <= $unsigned((+(~^(~|wire141))));
      reg151 <= $unsigned(($unsigned(reg150) ?
          {($signed(wire143) > $signed((8'hb0)))} : ($signed(wire143[(2'h3):(2'h2)]) <= ({wire146} ?
              (reg150 ? wire144 : wire147) : {reg148, wire144}))));
    end
  always
    @(posedge clk) begin
      reg152 <= (~|{$unsigned({(reg150 ? wire145 : reg150),
              wire147[(3'h4):(2'h3)]})});
      reg153 <= reg150[(4'h8):(3'h5)];
      reg154 <= wire142;
      reg155 <= (($unsigned({(+wire144), (^reg152)}) ?
          wire147 : (!wire145)) ^ reg150[(4'h9):(1'h1)]);
      if ($signed((~|($unsigned(reg152[(4'h9):(3'h5)]) >> wire146))))
        begin
          if ((+wire141[(3'h4):(3'h4)]))
            begin
              reg156 <= $unsigned(((+reg152) * $signed(wire146)));
            end
          else
            begin
              reg156 <= {reg154[(5'h10):(4'hd)],
                  $unsigned(($signed($signed((8'h9f))) == reg150[(3'h7):(3'h7)]))};
            end
          reg157 <= (reg156[(2'h2):(1'h1)] ?
              (&$unsigned($unsigned($signed(reg151)))) : {{((reg155 ?
                              (7'h43) : reg155) ?
                          (wire141 - reg148) : (reg156 ~^ (8'h9d)))}});
          reg158 <= (~|reg154[(2'h3):(1'h0)]);
          reg159 <= ((wire141 ~^ wire146) ?
              $unsigned(wire141) : ($unsigned(reg148) ?
                  reg157[(4'h8):(3'h7)] : ($signed({reg155}) >> wire144)));
        end
      else
        begin
          reg156 <= ($signed($signed(((wire144 ? reg150 : wire143) ?
              reg149 : (!reg151)))) && ((($unsigned((8'hb9)) == (|reg155)) + ($unsigned(wire145) > $unsigned(wire141))) ?
              ($signed(reg156[(2'h2):(1'h1)]) ?
                  $signed((reg149 ?
                      reg149 : (8'hb0))) : reg155[(5'h13):(4'h9)]) : $signed($signed(reg150[(4'h9):(1'h1)]))));
          if ($signed(reg148[(4'hd):(4'hc)]))
            begin
              reg157 <= $unsigned(reg157);
              reg158 <= $unsigned((reg155 ?
                  (~^$signed(wire141[(5'h12):(2'h2)])) : ($unsigned((~^reg149)) ?
                      reg159 : {(wire146 & wire143), (reg151 && reg159)})));
              reg159 <= (^~$unsigned($signed(($unsigned(reg150) > $unsigned(reg156)))));
              reg160 <= (((+(~|wire143[(5'h11):(1'h1)])) > {(wire142 ?
                          reg156[(2'h2):(1'h0)] : (wire145 + reg159)),
                      {(wire147 ? reg156 : wire143)}}) ?
                  $signed((~&(+(&wire141)))) : $unsigned({wire143[(4'hd):(4'h9)]}));
              reg161 <= reg150;
            end
          else
            begin
              reg157 <= (($signed($unsigned({reg157, reg155})) ?
                      $signed({(reg154 ? reg156 : (8'hb0)),
                          wire145}) : $unsigned(($signed(reg157) ?
                          (reg160 || (8'hbe)) : (reg161 ? reg149 : reg150)))) ?
                  $signed(((((7'h41) ?
                          wire146 : reg160) <<< (reg158 ~^ reg153)) ?
                      $unsigned(reg148[(2'h3):(2'h3)]) : (reg154 ?
                          (wire143 ^ reg149) : {(8'hb0),
                              wire142}))) : $signed(({(reg153 >= reg149)} ?
                      (reg155 < ((8'haf) ?
                          wire146 : reg149)) : $unsigned((wire144 ?
                          (8'hbe) : reg149)))));
              reg158 <= wire147;
              reg159 <= reg149;
              reg160 <= (reg158 ^~ (!reg152));
              reg161 <= reg153[(3'h6):(2'h2)];
            end
          if ((-$signed(wire145[(4'hf):(4'h8)])))
            begin
              reg162 <= {reg148[(4'hb):(4'ha)],
                  $unsigned((reg161[(4'ha):(3'h4)] ? (&(~^reg157)) : wire145))};
              reg163 <= reg151[(1'h1):(1'h0)];
              reg164 <= (~wire144);
            end
          else
            begin
              reg162 <= reg155[(1'h0):(1'h0)];
              reg163 <= reg151[(1'h0):(1'h0)];
            end
          reg165 <= (8'hae);
        end
    end
  assign wire166 = reg165[(2'h2):(1'h0)];
  assign wire167 = {(~reg160[(1'h0):(1'h0)]),
                       (&$signed($unsigned((reg161 ^ wire147))))};
  assign wire168 = (&{{{(wire145 ? reg149 : reg149), (-reg153)},
                           reg165[(2'h2):(2'h2)]}});
  assign wire169 = (~|$unsigned($unsigned($unsigned({reg148, wire147}))));
endmodule

module module10
#(parameter param130 = (((-{((8'hb1) | (8'haf))}) ? (~(((8'h9c) + (8'haf)) ? (~&(8'hbd)) : {(8'hb9)})) : (8'ha2)) == {((8'hb5) ? ((&(8'hb3)) ? ((7'h41) ? (8'ha9) : (8'ha0)) : (^~(8'hba))) : ({(8'ha1), (8'ha3)} >> ((8'ha5) & (7'h40))))}), 
parameter param131 = ((param130 ? (((param130 ? param130 : (8'haa)) >> ((8'ha8) ^~ param130)) <<< param130) : param130) ? {(^param130)} : ((^({param130} != param130)) ? (|(&(8'had))) : ((param130 ~^ ((8'ha6) >> param130)) || (param130 ? (param130 ? param130 : param130) : param130)))))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire120;
  wire signed [(5'h14):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire51;
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  assign y = {wire120,
                 wire118,
                 wire53,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire25,
                 wire51,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  assign wire16 = $unsigned((wire14[(3'h4):(1'h1)] ?
                      wire13[(1'h1):(1'h0)] : ((|(+(8'ha5))) ?
                          wire12[(4'hd):(3'h7)] : {wire13[(2'h2):(1'h1)]})));
  assign wire17 = ((8'ha3) ? (wire16 ? wire12 : (|wire13)) : wire11);
  assign wire18 = wire16;
  assign wire19 = (^$unsigned(({(wire18 << wire15), {wire18, wire12}} ?
                      $signed(wire12) : ($unsigned(wire15) ?
                          (wire18 ?
                              wire12 : wire17) : wire15[(1'h1):(1'h1)]))));
  assign wire20 = $signed(($unsigned(wire16) ?
                      (((-wire13) ?
                              wire15[(1'h0):(1'h0)] : wire17[(5'h14):(4'ha)]) ?
                          $signed(wire17[(5'h14):(3'h5)]) : (8'hbf)) : wire17[(4'hf):(4'hf)]));
  assign wire21 = $signed({$signed((~&(wire15 ? wire19 : wire14))), (8'hb1)});
  always
    @(posedge clk) begin
      if (wire14)
        begin
          reg22 <= wire12;
          reg23 <= $unsigned(wire15[(2'h3):(1'h0)]);
        end
      else
        begin
          if ((~^($signed($unsigned($signed(wire13))) && wire16[(3'h6):(2'h3)])))
            begin
              reg22 <= (wire18[(3'h5):(1'h1)] ?
                  wire17 : ($signed(wire19[(3'h4):(1'h1)]) ?
                      wire12[(1'h0):(1'h0)] : wire17[(5'h11):(4'he)]));
              reg23 <= ($unsigned(wire18[(2'h2):(2'h2)]) ?
                  $signed($unsigned(($unsigned(wire16) << (+reg22)))) : (~&wire19[(2'h3):(1'h1)]));
            end
          else
            begin
              reg22 <= ((reg22[(4'he):(4'ha)] > (|$signed((wire14 ?
                      wire21 : wire11)))) ?
                  wire21 : wire13);
              reg23 <= {$unsigned((wire19[(2'h3):(2'h2)] >> reg23))};
              reg24 <= wire12[(5'h10):(4'hc)];
            end
        end
    end
  assign wire25 = (^~reg24[(2'h2):(1'h1)]);
  module26 #() modinst52 (wire51, clk, wire19, wire14, reg22, wire20);
  assign wire53 = wire18[(1'h1):(1'h0)];
  module54 #() modinst119 (wire118, clk, wire14, wire17, wire16, wire12);
  assign wire120 = wire11[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg121 <= {(&wire14), $signed($unsigned(wire53))};
      if ((({(((8'haa) > wire12) ? (wire118 - wire14) : $signed(wire19)),
                  (wire14[(1'h1):(1'h1)] > wire20[(4'h9):(2'h2)])} ?
              $signed($unsigned($signed(wire13))) : (|((wire12 != wire118) - (wire13 ?
                  wire11 : (8'hbd))))) ?
          (|($unsigned((wire16 > wire17)) ?
              (^(wire120 >= reg121)) : $signed(wire11[(1'h0):(1'h0)]))) : wire51))
        begin
          reg122 <= (&$signed($unsigned((~((8'hbb) & wire14)))));
        end
      else
        begin
          reg122 <= wire120;
          if ({$signed(wire51[(4'ha):(1'h1)])})
            begin
              reg123 <= wire17;
              reg124 <= $unsigned((wire25[(1'h1):(1'h0)] + (8'hb4)));
              reg125 <= {(reg121 ? (-$signed($unsigned(wire16))) : wire17)};
            end
          else
            begin
              reg123 <= $signed(wire120[(3'h6):(3'h4)]);
            end
          if ($unsigned(wire14[(3'h7):(3'h6)]))
            begin
              reg126 <= (((^~$unsigned((wire118 ?
                      (8'hb9) : reg22))) ~^ wire120[(1'h0):(1'h0)]) ?
                  $signed($unsigned({(!wire20)})) : $unsigned(wire25[(5'h11):(2'h2)]));
              reg127 <= wire13[(1'h0):(1'h0)];
              reg128 <= wire18[(1'h1):(1'h0)];
              reg129 <= $signed((~(~|$signed($unsigned(reg24)))));
            end
          else
            begin
              reg126 <= ($unsigned((wire18[(2'h2):(1'h1)] ?
                  $signed(((7'h41) ^ wire20)) : ($signed(wire11) > $unsigned(reg124)))) | {reg23[(2'h3):(1'h0)],
                  reg125[(4'h9):(3'h7)]});
            end
        end
    end
endmodule

module module54  (y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h2f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire58;
  input wire signed [(3'h6):(1'h0)] wire57;
  input wire signed [(2'h3):(1'h0)] wire56;
  input wire signed [(4'hd):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire59;
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire64,
                 wire59,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
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
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg66,
                 reg65,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire59 = (^($unsigned(($signed(wire55) ?
                      $signed(wire56) : $signed(wire57))) * ({wire58[(1'h1):(1'h1)],
                          $unsigned(wire57)} ?
                      (wire58[(3'h4):(2'h2)] ?
                          (wire58 != wire55) : $signed(wire57)) : ((wire56 >> wire58) == wire55))));
  always
    @(posedge clk) begin
      if ($signed(wire58))
        begin
          reg60 <= $unsigned({wire55[(3'h6):(3'h5)]});
          reg61 <= $signed(wire57);
          reg62 <= $signed($unsigned($unsigned(((wire57 <= (8'h9d)) ^~ (wire57 << wire58)))));
          reg63 <= $unsigned({(|$unsigned({wire58})),
              $signed(((8'ha6) ? $signed(wire57) : reg62[(1'h0):(1'h0)]))});
        end
      else
        begin
          reg60 <= $unsigned(((wire57[(3'h6):(3'h4)] ?
                  $unsigned($signed(reg62)) : $signed($unsigned(wire58))) ?
              reg63 : wire55[(4'h9):(3'h7)]));
        end
    end
  assign wire64 = reg62;
  always
    @(posedge clk) begin
      reg65 <= $signed($unsigned({(reg61 >>> (&wire55))}));
      reg66 <= $unsigned(reg63[(5'h13):(5'h11)]);
    end
  assign wire67 = (wire57 ? (^reg61[(5'h14):(2'h2)]) : (7'h40));
  assign wire68 = ((8'hae) < ((^~((reg66 ? (8'haf) : wire55) ?
                      $signed(wire67) : (~^wire57))) == (~^((wire55 ?
                          wire57 : reg65) ?
                      $unsigned(wire57) : $signed(wire67)))));
  assign wire69 = $signed((((8'hae) ?
                      (reg66 >> {(8'hbc), wire59}) : (!(reg63 ?
                          reg62 : reg65))) <= ((+$unsigned(wire67)) == $unsigned((&wire58)))));
  assign wire70 = ((~&((~^wire58[(2'h3):(1'h1)]) ?
                      reg63 : $signed($signed(reg63)))) != $unsigned((wire69[(1'h1):(1'h0)] ?
                      $unsigned((reg63 ?
                          reg65 : (8'h9c))) : wire57[(3'h4):(2'h3)])));
  assign wire71 = wire69;
  always
    @(posedge clk) begin
      if ($signed(wire70[(4'hf):(4'he)]))
        begin
          reg72 <= (((!(!wire59[(3'h4):(2'h3)])) ?
              $unsigned(({(8'haa), reg60} ?
                  (reg63 >= reg65) : $unsigned(wire70))) : (8'hbb)) && (~&(^$signed(reg65[(4'he):(2'h3)]))));
          reg73 <= wire68[(1'h1):(1'h0)];
          reg74 <= $signed($signed(((wire71 ?
              wire55[(2'h3):(1'h0)] : $signed(wire55)) ~^ wire56)));
        end
      else
        begin
          reg72 <= ($unsigned(wire70[(3'h6):(1'h1)]) < reg62[(4'h8):(1'h0)]);
          if (wire69)
            begin
              reg73 <= {wire59};
              reg74 <= wire59;
              reg75 <= wire57[(2'h2):(2'h2)];
              reg76 <= $unsigned((~^wire56));
              reg77 <= (~((&((wire58 < reg62) <= $unsigned((8'ha8)))) << $signed($signed(((8'hbe) > reg61)))));
            end
          else
            begin
              reg73 <= (~&reg60);
              reg74 <= ($signed(wire64[(4'hd):(4'hc)]) >> $unsigned($signed(({wire57,
                      reg61} ?
                  {wire68, (8'h9c)} : {reg72, wire64}))));
              reg75 <= $unsigned(((reg74 & wire70) ?
                  (~^($unsigned(reg60) ?
                      (8'h9d) : $signed((7'h42)))) : $unsigned(((wire64 ?
                          reg77 : wire69) ?
                      (reg76 - reg75) : wire56[(2'h3):(2'h2)]))));
            end
          reg78 <= reg74;
          reg79 <= wire68[(3'h5):(1'h1)];
        end
      if ((((8'ha8) - (~((reg66 - wire56) != (^(8'hae))))) <= wire70))
        begin
          reg80 <= wire67[(4'h8):(1'h0)];
          reg81 <= wire68[(3'h7):(3'h5)];
          if ({($unsigned(wire67) < (~&(reg77[(2'h2):(1'h0)] ?
                  (&reg62) : reg74)))})
            begin
              reg82 <= reg61;
            end
          else
            begin
              reg82 <= (wire64[(4'he):(3'h6)] ?
                  (~|($signed($unsigned(wire55)) ?
                      $signed((8'hbf)) : wire68)) : wire71[(2'h2):(2'h2)]);
              reg83 <= $signed($unsigned((^~{$unsigned(wire59),
                  $unsigned(wire59)})));
            end
        end
      else
        begin
          if ((-($signed(reg72) + (reg73 | ($signed(wire68) && (reg72 + reg65))))))
            begin
              reg80 <= {{wire59[(1'h0):(1'h0)],
                      ((wire59[(2'h2):(1'h0)] | (~|reg65)) ?
                          ($unsigned(reg60) * (reg74 ?
                              reg78 : reg79)) : (((8'hb1) ~^ (8'ha9)) ?
                              $signed(reg60) : $unsigned((8'hb5))))},
                  {({wire58[(3'h4):(1'h1)]} ?
                          (-reg73) : ((reg83 ? reg62 : reg83) | (wire71 ?
                              reg82 : reg73))),
                      ($signed($signed(wire57)) ~^ $unsigned((wire58 ?
                          reg76 : reg77)))}};
              reg81 <= {reg81};
            end
          else
            begin
              reg80 <= $signed({reg78[(3'h7):(1'h0)]});
              reg81 <= ((^~((reg60 ? (reg73 ? reg61 : (7'h40)) : (!wire56)) ?
                  ((~reg62) ?
                      $unsigned(wire70) : $signed(wire64)) : $signed(reg74[(4'ha):(1'h0)]))) | reg79);
              reg82 <= $unsigned($signed(reg75));
              reg83 <= reg72[(2'h2):(1'h0)];
              reg84 <= {{($signed($signed(reg73)) ?
                          ($signed(reg79) || (wire68 >>> reg78)) : (~|(reg80 ?
                              wire55 : reg78)))},
                  (wire67 != (((reg74 ~^ wire55) ?
                      $signed(reg77) : wire55[(3'h4):(2'h3)]) == ((reg82 ?
                      reg81 : reg78) >= $signed((8'hb9)))))};
            end
        end
      if ($unsigned($unsigned((8'ha4))))
        begin
          if ((~$unsigned((wire71[(4'h8):(3'h5)] ?
              reg62[(3'h6):(2'h3)] : (+$signed(wire68))))))
            begin
              reg85 <= $unsigned($unsigned(wire70));
              reg86 <= wire64[(4'h8):(1'h1)];
              reg87 <= reg86[(5'h14):(4'hd)];
              reg88 <= {reg77,
                  $signed($unsigned(((reg72 & reg75) ?
                      {wire70, wire56} : $signed(reg80))))};
            end
          else
            begin
              reg85 <= $signed(reg81[(2'h3):(1'h0)]);
              reg86 <= (+$signed((^{(reg84 ? reg60 : reg65),
                  (wire56 ? reg86 : reg76)})));
              reg87 <= reg84;
              reg88 <= (~^reg86[(2'h2):(2'h2)]);
              reg89 <= $unsigned((!(wire70[(4'hc):(4'hc)] ?
                  $signed(((7'h43) ?
                      reg83 : wire71)) : (^~reg76[(4'he):(1'h1)]))));
            end
          reg90 <= $signed({(reg80[(4'he):(1'h1)] ?
                  ($signed(wire67) ?
                      reg80[(4'he):(3'h6)] : reg66[(1'h1):(1'h1)]) : {(^reg86)})});
          reg91 <= reg83;
          reg92 <= wire59;
          if ($signed($signed(reg66)))
            begin
              reg93 <= reg78[(3'h4):(2'h2)];
              reg94 <= $unsigned((^(((reg81 ?
                      reg62 : wire57) && reg80[(1'h0):(1'h0)]) ?
                  {(reg78 ? wire70 : wire59)} : ((~^reg85) ?
                      $unsigned(wire71) : {wire70, reg85}))));
              reg95 <= (-$signed($signed($signed(wire55))));
            end
          else
            begin
              reg93 <= reg84;
              reg94 <= (^~reg89);
              reg95 <= reg82;
              reg96 <= ($unsigned(({(^~wire68)} ?
                      $signed($unsigned(reg65)) : (((8'haf) >> reg66) ?
                          reg82[(3'h4):(1'h0)] : {reg81}))) ?
                  wire71[(3'h6):(3'h6)] : reg75[(4'hd):(4'h9)]);
            end
        end
      else
        begin
          reg85 <= $signed($signed(reg88));
          reg86 <= (8'hb4);
          reg87 <= $unsigned((((8'hb5) - (+$unsigned(wire57))) ?
              (wire64[(4'he):(3'h7)] ?
                  (-reg73) : ($signed((8'hbc)) ?
                      (reg85 ? reg96 : reg84) : (reg72 ?
                          reg76 : reg75))) : (wire67[(3'h5):(2'h3)] >>> reg87[(3'h7):(3'h4)])));
          reg88 <= reg84[(3'h5):(3'h5)];
          reg89 <= reg73[(3'h7):(3'h4)];
        end
    end
  assign wire97 = reg65[(3'h6):(2'h3)];
  assign wire98 = reg86[(3'h6):(2'h3)];
  assign wire99 = reg60;
  assign wire100 = $unsigned($unsigned($signed((^$signed(reg80)))));
  always
    @(posedge clk) begin
      if ((+($unsigned((~&{reg81})) ?
          reg84 : (~(reg85 ? (reg74 != wire97) : $signed(reg65))))))
        begin
          reg101 <= ($unsigned(wire98[(2'h3):(2'h2)]) >> reg89[(4'h9):(3'h6)]);
        end
      else
        begin
          if ($unsigned(((wire100[(1'h1):(1'h1)] == (^reg92[(3'h4):(1'h1)])) >> (reg91 ?
              (~reg84[(2'h2):(1'h1)]) : {reg62[(2'h2):(1'h0)]}))))
            begin
              reg101 <= ({($unsigned({wire67}) | $signed((reg101 ?
                      reg82 : reg85)))} != reg84[(4'hd):(2'h2)]);
            end
          else
            begin
              reg101 <= (+(((+reg82[(4'h9):(1'h0)]) ?
                  $signed((reg83 && reg80)) : $signed((reg95 ?
                      wire99 : wire97))) | {(|(reg78 || reg86))}));
              reg102 <= reg93[(1'h1):(1'h0)];
              reg103 <= ($unsigned(($unsigned((~&wire59)) ?
                  (|(wire71 ? reg92 : (8'hab))) : (-(reg84 ?
                      reg73 : reg87)))) + (reg62 ?
                  {reg89[(1'h1):(1'h1)],
                      wire98[(2'h2):(2'h2)]} : (reg72[(3'h7):(3'h6)] < $unsigned({reg96,
                      wire67}))));
            end
          reg104 <= ($signed($unsigned((~&$unsigned(reg94)))) ?
              $signed(((reg66 << reg102[(4'hb):(4'h8)]) ?
                  (wire100 ?
                      (^~wire58) : (~&reg101)) : {reg62})) : (wire98[(2'h2):(2'h2)] ?
                  reg91 : reg75));
          reg105 <= (~&wire100);
          reg106 <= reg83;
        end
      if (($signed($unsigned(((!(8'hb2)) - reg82))) - (reg65[(4'hf):(3'h4)] ?
          {{$signed(reg88)}} : ($signed((wire71 ?
              reg81 : (8'hbf))) ~^ (&((7'h42) >>> reg82))))))
        begin
          reg107 <= $signed(reg103);
          reg108 <= wire67;
          reg109 <= reg76[(3'h5):(1'h1)];
          reg110 <= reg103[(4'hd):(4'hb)];
          reg111 <= (({(reg76 ? $signed(reg78) : {reg72}),
              (~$unsigned(reg90))} * ($unsigned((~(8'hbc))) ?
              reg75 : (^~$signed((8'hab))))) << wire99[(1'h0):(1'h0)]);
        end
      else
        begin
          reg107 <= ($signed(reg91) ? (8'h9f) : reg93[(1'h1):(1'h0)]);
          reg108 <= $signed((-{wire71}));
          reg109 <= reg101[(3'h4):(2'h3)];
          reg110 <= (reg77 + ($unsigned((8'hb0)) ~^ $signed(wire58[(2'h2):(1'h1)])));
          reg111 <= reg60;
        end
      reg112 <= ((~&(~&(~|$signed((7'h44))))) && $signed((reg73[(2'h2):(2'h2)] == ((reg83 >>> (8'hb3)) <<< reg105[(4'h9):(2'h2)]))));
    end
  assign wire113 = $signed(wire98[(1'h1):(1'h0)]);
  assign wire114 = reg66;
  assign wire115 = $unsigned(reg65);
  assign wire116 = (^($unsigned(({reg73,
                       reg72} >= $unsigned(reg60))) & $unsigned($unsigned($signed(reg87)))));
  assign wire117 = {$signed(reg81),
                       $signed(($unsigned($signed(wire100)) ?
                           ($signed(wire69) >= $unsigned((8'ha9))) : reg93))};
endmodule

module module26
#(parameter param49 = ((^(^((&(8'hbc)) ? ((8'hb2) && (8'h9d)) : ((8'hb2) < (8'hb7))))) ? (8'h9f) : (({((8'hb3) ? (8'hb7) : (8'hbc))} == ({(8'hac)} ? ((8'hab) ? (8'haf) : (7'h43)) : ((8'had) ? (8'hb7) : (8'hb4)))) - ({(8'hbc), {(8'hb0)}} ~^ ({(8'haf)} ? ((8'hbb) >= (8'hb4)) : ((8'hba) ? (8'h9c) : (8'ha3)))))), 
parameter param50 = (+(|(param49 >= (^~param49)))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire [(3'h5):(1'h0)] wire29;
  input wire [(5'h12):(1'h0)] wire28;
  input wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire33,
                 wire32,
                 wire31,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire31 = wire27[(1'h0):(1'h0)];
  assign wire32 = {(~$unsigned(($signed(wire31) ~^ wire31[(4'hb):(2'h2)]))),
                      (((!wire30[(3'h6):(1'h1)]) <<< $unsigned((+(7'h42)))) != $signed(wire30[(1'h1):(1'h1)]))};
  assign wire33 = {($unsigned(($signed((7'h44)) ?
                          $signed(wire31) : wire29[(3'h4):(3'h4)])) ^~ ($signed((wire28 & wire27)) ?
                          $unsigned((8'hbd)) : wire28))};
  always
    @(posedge clk) begin
      reg34 <= $signed(wire30[(1'h0):(1'h0)]);
      if (($signed({$signed((wire31 << wire33))}) >>> (({(|wire32),
          (reg34 != reg34)} && (wire29[(1'h1):(1'h0)] ?
          wire27[(2'h3):(2'h2)] : wire33)) ~^ reg34)))
        begin
          reg35 <= ((8'haf) || {$signed((^~wire28))});
          reg36 <= (!((reg34 ~^ ($signed(wire31) ?
                  $unsigned(wire31) : $unsigned(wire29))) ?
              (!{(wire28 ? (8'hbe) : (8'hb9))}) : $unsigned((~&wire30))));
          reg37 <= (reg36[(4'h9):(4'h9)] ?
              wire29[(1'h1):(1'h0)] : ($unsigned(wire27) ^ wire27[(3'h6):(3'h6)]));
          reg38 <= (+reg35[(4'hb):(2'h3)]);
        end
      else
        begin
          if ($unsigned(wire31[(3'h7):(1'h1)]))
            begin
              reg35 <= (-$unsigned(({reg38, (wire32 ? reg38 : reg34)} ?
                  $unsigned(((8'haf) ? wire33 : reg36)) : (((8'ha4) | wire27) ?
                      (reg36 ~^ wire32) : wire27))));
              reg36 <= $signed(((-($signed(wire27) > $signed(wire33))) ?
                  $signed(reg34) : ((reg35[(3'h6):(3'h5)] == (!(7'h41))) & reg36[(4'hd):(4'hb)])));
              reg37 <= (-reg35);
            end
          else
            begin
              reg35 <= wire28[(4'hb):(1'h0)];
            end
        end
    end
  assign wire39 = $unsigned($unsigned((~$unsigned((7'h40)))));
  assign wire40 = $unsigned((8'hb5));
  assign wire41 = $unsigned({((^(^reg35)) & wire40[(4'hd):(1'h1)])});
  assign wire42 = ($unsigned($unsigned($signed(reg36[(5'h11):(4'hd)]))) >> wire40);
  assign wire43 = wire28;
  assign wire44 = (($signed(wire32) <= wire41[(2'h2):(2'h2)]) ?
                      reg35 : ($signed($signed((wire32 ? reg37 : wire27))) ?
                          reg36[(5'h11):(3'h5)] : $signed(wire29[(1'h0):(1'h0)])));
  assign wire45 = (wire29[(1'h1):(1'h1)] >= wire31[(4'hf):(4'ha)]);
  assign wire46 = {(wire40 ?
                          $signed((~|(wire31 ^~ wire27))) : wire42[(2'h2):(2'h2)]),
                      (-($unsigned(wire39[(2'h2):(2'h2)]) & reg37))};
  assign wire47 = ((($signed((^wire42)) ? wire43 : $signed(((8'hb8) * reg38))) ?
                          ((((8'hae) || wire39) ^ {reg34,
                              wire29}) > $signed({wire44})) : {$signed((wire41 != wire45))}) ?
                      $unsigned((wire39[(2'h3):(1'h0)] ?
                          ((wire29 | reg38) >>> $unsigned(wire31)) : ((reg34 ?
                              wire41 : wire44) * (~^reg37)))) : {$unsigned(($unsigned(wire27) ?
                              (wire46 ? wire44 : wire31) : wire30))});
  assign wire48 = ($signed((($unsigned((7'h43)) >= $signed(wire28)) ~^ (wire47 - (wire32 ~^ (7'h44))))) ?
                      wire29[(2'h2):(2'h2)] : $unsigned($signed($signed($signed((8'hba))))));
endmodule
