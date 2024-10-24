module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire162;
  wire signed [(4'h9):(1'h0)] wire161;
  wire signed [(5'h14):(1'h0)] wire135;
  wire [(4'he):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire131;
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  reg signed [(4'he):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(5'h15):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg149 = (1'h0);
  reg [(4'hc):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire135,
                 wire134,
                 wire133,
                 wire98,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire131,
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
                 reg147,
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
                 (1'h0)};
  assign wire5 = $signed(((((wire1 ?
                     (7'h43) : wire2) << wire2) || ($signed((8'hac)) != {wire1})) < ((~$unsigned(wire1)) ?
                     ((wire2 & wire3) & wire0[(2'h3):(1'h1)]) : ((wire1 | wire0) ?
                         (~^(8'hae)) : (wire0 >> wire0)))));
  assign wire6 = (($unsigned((wire0[(3'h7):(2'h3)] <<< wire0)) ?
                     (wire5[(1'h1):(1'h1)] ?
                         ((wire3 ? (8'hbd) : (8'hbf)) ?
                             (~|wire2) : $signed((8'had))) : (+{wire3,
                             (8'ha3)})) : wire3[(3'h5):(3'h4)]) ^ $unsigned((wire4[(2'h2):(2'h2)] ^~ $signed(wire2))));
  assign wire7 = (~^(&wire0[(1'h1):(1'h1)]));
  assign wire8 = (wire2 <= $unsigned(wire3[(4'h9):(2'h3)]));
  assign wire9 = ((~^(($signed(wire8) & $signed(wire4)) | (((8'ha1) ?
                             (8'hb3) : wire0) ?
                         ((8'hb2) ? wire5 : (7'h41)) : $signed(wire8)))) ?
                     wire6[(2'h3):(1'h1)] : wire7);
  assign wire10 = {(~^wire7), (~^wire3[(1'h0):(1'h0)])};
  module11 #() modinst99 (.wire14(wire4), .wire15(wire6), .y(wire98), .wire12(wire9), .wire13(wire2), .clk(clk), .wire16(wire1));
  module100 #() modinst132 (wire131, clk, wire3, wire8, wire6, wire7, wire4);
  assign wire133 = $unsigned((^($unsigned($unsigned(wire0)) <= $signed($signed(wire98)))));
  assign wire134 = (((^((-wire1) >>> {wire9})) ?
                       ($unsigned((-wire5)) <<< wire1) : {{$signed(wire9),
                               (|wire2)},
                           (wire131[(3'h7):(3'h6)] ?
                               (wire6 > wire1) : wire9[(1'h0):(1'h0)])}) <= {(wire4[(2'h3):(1'h0)] ?
                           wire4[(1'h1):(1'h0)] : ($signed((7'h42)) ?
                               wire10 : $unsigned(wire4)))});
  assign wire135 = (wire133 ?
                       ((-{wire1, $unsigned((8'hb4))}) ?
                           (~wire133) : $signed((|$unsigned(wire4)))) : {(~wire4[(1'h0):(1'h0)]),
                           wire3});
  always
    @(posedge clk) begin
      reg136 <= $unsigned({(+wire0), $unsigned(wire7[(3'h6):(2'h2)])});
      reg137 <= wire4;
    end
  always
    @(posedge clk) begin
      if ($signed((8'hac)))
        begin
          if ((~&(8'hbe)))
            begin
              reg138 <= ((8'hb1) ?
                  $signed(wire9) : $unsigned($unsigned(wire8[(2'h2):(1'h1)])));
              reg139 <= ((reg138 ?
                  ((wire4[(2'h3):(1'h0)] ?
                      {wire98} : $unsigned((8'hb1))) ^~ $signed({wire134})) : ({$unsigned(reg138),
                          $unsigned((8'hb0))} ?
                      wire2 : ($unsigned(wire5) ?
                          (^wire4) : $unsigned(wire5)))) * $unsigned({($unsigned(wire135) ^~ {wire10})}));
            end
          else
            begin
              reg138 <= wire0;
              reg139 <= ($signed(($unsigned({wire133,
                      wire5}) && wire9[(1'h1):(1'h0)])) ?
                  (~|reg139[(1'h1):(1'h0)]) : wire2[(4'hb):(1'h1)]);
            end
        end
      else
        begin
          reg138 <= ((8'hb3) ?
              $signed($signed((+(wire7 ?
                  (8'hb9) : (8'hb4))))) : $unsigned(($unsigned(reg137[(3'h7):(1'h0)]) ?
                  $unsigned(wire7) : {{wire0, wire8}})));
          reg139 <= (({wire5[(1'h1):(1'h0)]} ?
                  $signed($signed(((8'hb2) ?
                      wire98 : wire7))) : (~wire5[(1'h1):(1'h0)])) ?
              $unsigned(wire0) : ($unsigned((+reg137[(2'h3):(2'h2)])) ?
                  (((wire8 ? wire7 : reg136) ?
                      (-wire98) : ((8'ha2) ?
                          wire4 : wire9)) + (~|wire4)) : wire7[(5'h12):(3'h7)]));
          if ($signed(((8'hbf) ?
              ($signed(((8'hba) == wire2)) || wire0) : ((reg138 && (reg137 ?
                      reg137 : reg136)) ?
                  $signed((~^reg137)) : $signed(wire4[(3'h4):(3'h4)])))))
            begin
              reg140 <= (~(wire0 ~^ $unsigned(((wire8 ? (8'ha8) : wire131) ?
                  $unsigned((8'h9d)) : (wire10 != wire3)))));
              reg141 <= (8'ha1);
              reg142 <= reg141[(1'h0):(1'h0)];
              reg143 <= wire131;
              reg144 <= (&(^(((!wire134) ?
                      (wire0 >> wire9) : $unsigned((8'hb4))) ?
                  (|wire98[(4'hc):(3'h5)]) : (^wire135))));
            end
          else
            begin
              reg140 <= ($signed(((-{wire5,
                  wire133}) < wire8)) | (~|$signed((~$signed(wire0)))));
              reg141 <= $signed(wire6);
              reg142 <= (wire98 <= $signed(wire2));
              reg143 <= ((wire10[(3'h7):(1'h0)] * wire8[(4'ha):(1'h1)]) ?
                  $unsigned($signed($unsigned((wire131 <= (8'hac))))) : wire98[(2'h2):(2'h2)]);
            end
          if (wire135)
            begin
              reg145 <= $signed((~^(~|reg144[(2'h2):(1'h0)])));
              reg146 <= wire10;
              reg147 <= $signed(($unsigned($signed($unsigned(wire5))) < ($unsigned(wire98[(4'h8):(3'h6)]) ?
                  ((~|wire135) ? wire98 : (|wire131)) : {(reg139 ?
                          reg136 : wire2)})));
              reg148 <= ($unsigned($unsigned($signed(((8'h9e) ?
                  reg143 : wire6)))) == (8'haa));
              reg149 <= (wire6 ?
                  $unsigned((wire4[(4'h8):(3'h5)] == wire135)) : reg143);
            end
          else
            begin
              reg145 <= ($signed((($signed(wire4) > $signed(reg138)) <<< $signed(wire1))) ?
                  ($signed((reg144 ?
                      $unsigned(reg146) : $unsigned(wire1))) <<< $signed(wire7[(4'hf):(1'h1)])) : ((wire131[(1'h1):(1'h1)] ?
                      $unsigned(((8'hb5) < wire2)) : ((8'hb7) ?
                          {reg140,
                              reg147} : $unsigned((8'hb2)))) ^~ $signed(($signed(reg144) ?
                      (~^wire4) : (^wire7)))));
              reg146 <= wire4;
              reg147 <= $unsigned((8'hb1));
              reg148 <= ({reg139,
                      {$unsigned({reg136}),
                          (((8'haf) <= wire134) >> $unsigned(wire2))}} ?
                  {$signed(reg140[(4'hc):(1'h1)]),
                      wire8[(3'h6):(2'h3)]} : {wire10,
                      {wire1, $signed($unsigned(wire4))}});
              reg149 <= wire2;
            end
        end
      if ($unsigned((|($signed((~^reg145)) ?
          {(wire7 ? (8'ha8) : wire9),
              reg139} : $unsigned(reg146[(2'h2):(1'h1)])))))
        begin
          reg150 <= ($unsigned($signed(((+(8'ha7)) ?
              (~|reg139) : $signed(reg149)))) && (($unsigned(wire4[(3'h4):(2'h3)]) ?
              (reg144[(2'h2):(2'h2)] < $unsigned(wire133)) : $unsigned(wire6)) + (reg136 ?
              (|wire4[(3'h4):(2'h3)]) : $signed((8'hb2)))));
        end
      else
        begin
          reg150 <= (reg147[(3'h4):(3'h4)] ?
              (wire134[(3'h6):(1'h0)] ?
                  (!{(reg144 ?
                          reg150 : wire1)}) : $signed($unsigned((-wire6)))) : {(^~(-$unsigned(wire4)))});
          reg151 <= $signed((({wire2, (7'h41)} ?
                  wire135[(5'h10):(4'ha)] : $signed((!wire8))) ?
              wire9[(4'hb):(4'hb)] : reg144));
          reg152 <= $signed($signed((~|$signed(reg143[(4'h9):(4'h8)]))));
          reg153 <= wire4;
        end
      reg154 <= wire10;
      if ($unsigned((-(~&wire4))))
        begin
          if ((^~(reg152 ?
              $unsigned($signed((wire0 ^ reg152))) : (^reg137[(3'h5):(3'h4)]))))
            begin
              reg155 <= wire8[(3'h7):(3'h7)];
              reg156 <= $signed(reg139[(3'h7):(3'h7)]);
              reg157 <= (|wire6[(4'he):(4'h8)]);
            end
          else
            begin
              reg155 <= ((8'haa) ?
                  (wire10 > wire5[(1'h0):(1'h0)]) : (wire0 + $signed(reg157[(3'h4):(1'h1)])));
              reg156 <= ((~&(+(reg155[(1'h0):(1'h0)] ?
                  (wire6 ?
                      reg148 : reg153) : $signed(reg157)))) * $signed({$signed((wire8 ?
                      reg141 : reg150))}));
              reg157 <= wire4[(3'h7):(2'h3)];
            end
        end
      else
        begin
          if ((wire131 ?
              $unsigned($signed(reg149)) : $signed((!(wire2[(2'h2):(2'h2)] ?
                  $signed(reg141) : (^~(8'hb3)))))))
            begin
              reg155 <= (&reg137[(3'h5):(3'h4)]);
              reg156 <= $signed(reg152[(2'h2):(2'h2)]);
              reg157 <= {(reg137 ?
                      $signed(wire9) : $signed((-{reg140, reg151}))),
                  ({reg139[(3'h4):(1'h1)],
                          ((&(8'ha2)) && (reg144 ? (8'hb8) : reg143))} ?
                      ($unsigned((wire9 ?
                          reg143 : (8'hab))) && (7'h40)) : reg138)};
            end
          else
            begin
              reg155 <= $unsigned((((~(wire98 ? wire131 : (8'ha5))) ?
                  $signed($signed(reg156)) : $signed($signed(reg153))) >> {$unsigned((+wire131)),
                  reg145[(1'h0):(1'h0)]}));
              reg156 <= {wire3,
                  (($signed(wire0) ?
                      (^~(reg138 ?
                          reg147 : reg141)) : $unsigned($unsigned(wire135))) <= wire0[(4'h8):(3'h6)])};
              reg157 <= (^(($unsigned((reg156 ? (8'hbb) : reg147)) ?
                  {wire2, reg139} : (^reg156)) || ($signed($unsigned((8'hae))) ?
                  {(wire5 == reg138)} : {wire8[(3'h6):(1'h1)]})));
            end
          if ($signed(reg138))
            begin
              reg158 <= reg138[(3'h6):(3'h4)];
              reg159 <= ({reg138[(4'hb):(4'h9)]} ?
                  reg152[(2'h2):(2'h2)] : $signed(($signed(reg144[(1'h1):(1'h0)]) ?
                      {wire0[(1'h0):(1'h0)], $unsigned(reg141)} : wire7)));
              reg160 <= reg157;
            end
          else
            begin
              reg158 <= $signed(($unsigned((reg136[(3'h5):(2'h2)] ?
                  (^reg153) : wire7)) * reg142));
              reg159 <= (reg154 ?
                  ((&$signed({reg148, wire9})) ?
                      $signed((wire5 ?
                          {reg143} : reg155[(4'ha):(3'h4)])) : $unsigned(((+wire7) ^ $signed(reg146)))) : $signed($signed((^~$signed((8'hb4))))));
              reg160 <= wire4[(3'h5):(1'h1)];
            end
        end
    end
  assign wire161 = $unsigned(($unsigned(((+reg150) ?
                       $unsigned(reg149) : $unsigned(wire0))) || $unsigned(((reg140 < reg137) ?
                       (~^wire5) : reg151))));
  assign wire162 = $unsigned($unsigned($signed(wire2[(4'h8):(1'h1)])));
endmodule

module module100  (y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire105;
  input wire signed [(3'h6):(1'h0)] wire104;
  input wire signed [(4'hb):(1'h0)] wire103;
  input wire [(3'h4):(1'h0)] wire102;
  input wire signed [(3'h5):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire126;
  wire signed [(2'h3):(1'h0)] wire125;
  wire [(4'he):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  wire signed [(4'ha):(1'h0)] wire120;
  wire [(3'h6):(1'h0)] wire119;
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
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
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg106 <= (|(!$unsigned((8'had))));
      if ((^~((~|($unsigned(wire102) >>> wire105[(1'h0):(1'h0)])) | (wire101 - ({wire101,
              wire105} ?
          {(7'h44)} : $unsigned(wire102))))))
        begin
          if ((wire103[(2'h3):(1'h0)] < $unsigned(({(wire102 | wire105)} != (((8'haf) ?
                  wire104 : wire103) ?
              $signed(wire101) : (&wire101))))))
            begin
              reg107 <= ({($unsigned(wire101[(3'h4):(2'h3)]) >>> wire105)} ?
                  reg106 : reg106[(3'h5):(2'h2)]);
              reg108 <= $signed(({{{wire101}, wire101},
                  ((-wire105) ?
                      (^wire103) : $signed(wire105))} | $unsigned(((~wire103) | (wire101 ~^ (8'hbe))))));
            end
          else
            begin
              reg107 <= (((~&(((8'ha5) ?
                      reg106 : wire103) < wire104)) ~^ ((^~reg106) ?
                      $unsigned($unsigned(reg108)) : $signed(wire104[(3'h4):(3'h4)]))) ?
                  $unsigned($signed($unsigned(reg108))) : (~(wire105 ?
                      (~^{wire102}) : reg107[(1'h0):(1'h0)])));
              reg108 <= wire102;
              reg109 <= {{wire103[(4'h8):(2'h2)]}};
              reg110 <= reg108;
              reg111 <= $signed(($unsigned($unsigned($signed(wire101))) ?
                  reg106 : reg109[(1'h0):(1'h0)]));
            end
          reg112 <= $unsigned($unsigned((-reg106)));
          reg113 <= reg112[(3'h7):(1'h1)];
          reg114 <= (~|$unsigned({$unsigned(wire101[(3'h5):(2'h3)]), reg106}));
          reg115 <= {wire105};
        end
      else
        begin
          reg107 <= (~(reg112[(3'h4):(2'h3)] >= (~(wire103 ?
              ((8'hb0) ? reg111 : wire103) : (reg114 ? reg107 : wire102)))));
        end
      reg116 <= {(~^(reg114 ?
              $signed((wire102 == (7'h40))) : $signed($signed(reg109)))),
          $signed(($unsigned((reg108 ? reg107 : reg110)) ?
              ($unsigned((7'h44)) && (reg112 ? reg106 : reg109)) : wire102))};
      reg117 <= ($unsigned((($unsigned(reg110) - (!reg113)) ?
          $signed($unsigned(wire105)) : $signed(reg112))) > (reg108 ?
          (~^{reg114,
              (8'hac)}) : ($unsigned($signed(reg111)) >= $signed((!reg106)))));
      reg118 <= (wire105 ?
          {(^~$signed({reg113})),
              ($unsigned($unsigned(reg111)) ?
                  ({reg109, reg109} ?
                      {reg106,
                          reg111} : $signed(reg117)) : reg107)} : {wire102[(1'h0):(1'h0)]});
    end
  assign wire119 = reg118;
  assign wire120 = ($unsigned((({reg106,
                       reg115} - (reg106 ^ wire103)) < reg110[(1'h1):(1'h1)])) - reg110[(3'h7):(1'h1)]);
  assign wire121 = $unsigned(reg118[(3'h4):(2'h2)]);
  assign wire122 = {(&$unsigned(reg115))};
  assign wire123 = ((+(((reg118 <<< reg117) ?
                               (reg110 <<< wire102) : (reg116 ?
                                   reg109 : reg110)) ?
                           ($signed(reg112) >> $unsigned(reg113)) : (((8'ha7) ?
                                   reg106 : wire122) ?
                               reg110[(1'h0):(1'h0)] : (wire105 <<< reg108)))) ?
                       $signed((reg118 ?
                           wire122 : ($unsigned(wire121) + {reg106}))) : {wire102[(3'h4):(3'h4)],
                           (~$signed($unsigned(reg118)))});
  assign wire124 = wire102[(3'h4):(3'h4)];
  assign wire125 = ((^(-(-(wire102 ?
                       (8'ha8) : reg117)))) * (~|$unsigned($unsigned(reg115))));
  assign wire126 = $unsigned(wire121);
  always
    @(posedge clk) begin
      reg127 <= ((^~{(~|$unsigned(wire104))}) >>> {(reg111[(2'h2):(1'h0)] >> (~$signed(wire120)))});
      reg128 <= $unsigned(reg112);
    end
  always
    @(posedge clk) begin
      reg129 <= (wire123[(2'h2):(1'h1)] ? (+reg109) : $unsigned((~^reg113)));
      reg130 <= $signed(((+(~&$signed(wire119))) ?
          ((wire104[(1'h0):(1'h0)] * (reg129 && reg128)) ?
              wire103 : $unsigned(reg117[(4'ha):(1'h1)])) : (wire124 ?
              {$signed(reg109)} : {(^~(8'hb6)), (reg128 >= wire101)})));
    end
endmodule

module module11
#(parameter param97 = (~&(({{(8'ha3)}, ((8'ha7) == (8'hb1))} ? (^((8'hb2) ? (8'hb1) : (8'ha8))) : (~(~^(8'ha7)))) ? {(((8'hbc) ~^ (8'hb8)) >> ((8'hae) ? (8'hbe) : (8'hba)))} : ((((8'hb5) >> (8'hb2)) ~^ (~&(8'hb8))) << (~((8'hbe) ? (8'hb5) : (8'hb3)))))))
(y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h267):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire13;
  input wire [(4'h9):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire signed [(5'h13):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire82;
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire17,
                 wire24,
                 wire42,
                 wire44,
                 wire82,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 (1'h0)};
  assign wire17 = ({(wire16[(4'h8):(3'h5)] ?
                              wire16[(4'h8):(1'h1)] : (((8'hb2) >> (7'h41)) ~^ $signed(wire16)))} ?
                      (~&$signed(wire16)) : (8'hae));
  always
    @(posedge clk) begin
      reg18 <= (wire17[(4'hb):(2'h2)] > wire13[(2'h2):(1'h1)]);
      if ($unsigned(wire15[(4'hc):(3'h5)]))
        begin
          reg19 <= $signed(($unsigned((wire16[(3'h6):(3'h5)] ?
                  (~|wire13) : (wire12 ? wire17 : reg18))) ?
              (reg18[(1'h0):(1'h0)] ?
                  $signed((8'hb1)) : ($signed(wire14) ?
                      wire14 : (+wire15))) : wire15[(4'h9):(4'h8)]));
        end
      else
        begin
          reg19 <= $unsigned(($unsigned($unsigned((wire16 ?
                  wire15 : (8'ha7)))) ?
              $unsigned(wire12[(4'hd):(4'h9)]) : (reg18 ?
                  reg19[(4'h8):(3'h6)] : $signed((reg19 ? (7'h41) : wire14)))));
          reg20 <= $signed(wire17);
          reg21 <= wire12[(3'h7):(1'h1)];
        end
      reg22 <= $unsigned($signed($unsigned($unsigned((wire17 ?
          wire13 : reg20)))));
      reg23 <= wire13;
    end
  assign wire24 = (^~({wire17} ?
                      ($signed(reg19[(3'h6):(3'h6)]) ?
                          (^~$signed(wire13)) : $unsigned(wire13[(3'h4):(2'h2)])) : reg18));
  module25 #() modinst43 (.wire28(wire16), .y(wire42), .wire26(wire14), .wire27(reg22), .wire29(wire13), .clk(clk), .wire30(wire15));
  assign wire44 = $unsigned(reg20);
  always
    @(posedge clk) begin
      reg45 <= $unsigned(reg21[(3'h7):(1'h0)]);
      reg46 <= (~wire16);
      if ($signed($signed(((^~((8'hbc) ? reg46 : wire15)) == reg46))))
        begin
          reg47 <= ({(^(reg46[(2'h3):(1'h0)] ?
                  wire15[(1'h0):(1'h0)] : (wire14 ? wire42 : wire14))),
              (({(8'had), (7'h42)} ? $signed(wire24) : wire17) + ({reg45,
                  reg18} || wire44[(2'h3):(1'h1)]))} ^~ $signed($unsigned((~&$unsigned(reg21)))));
          reg48 <= (wire13[(3'h6):(1'h1)] ?
              (|$signed((~(wire16 ? wire12 : wire44)))) : $unsigned(wire14));
        end
      else
        begin
          reg47 <= reg45;
          reg48 <= $unsigned((reg21[(4'hb):(2'h3)] ?
              reg47 : $unsigned(wire42[(2'h3):(2'h3)])));
          if ({wire44[(3'h4):(1'h1)]})
            begin
              reg49 <= reg45;
            end
          else
            begin
              reg49 <= $signed(wire44);
              reg50 <= (~&(reg46[(2'h3):(1'h0)] ?
                  $unsigned(((~wire14) ? wire24 : {reg19})) : {$signed({reg49,
                          reg47})}));
              reg51 <= $signed({$signed($unsigned({reg46, reg22})), reg45});
            end
          reg52 <= (((8'hb5) ?
                  ((~|(wire44 ?
                      wire17 : reg22)) - wire44) : {$unsigned($signed(reg45))}) ?
              (-((!(&(8'hb3))) >= (reg45 && $unsigned(wire15)))) : (~&wire24));
          reg53 <= $unsigned(reg48);
        end
      if ((&reg45[(3'h4):(2'h3)]))
        begin
          if ($unsigned($signed(reg46[(3'h4):(1'h1)])))
            begin
              reg54 <= ((|{((reg21 ? wire24 : (7'h43)) ? {wire17} : reg23)}) ?
                  {$unsigned(((reg21 ? reg53 : reg22) ?
                          (reg53 ? wire17 : wire14) : wire16)),
                      (wire14 >>> reg18[(4'h8):(2'h2)])} : (8'ha3));
              reg55 <= (reg46[(1'h0):(1'h0)] < $signed(reg18[(2'h3):(1'h0)]));
              reg56 <= wire14[(4'h9):(3'h6)];
              reg57 <= (~&(($signed((8'hb3)) ?
                  $unsigned((reg48 || reg54)) : reg18) - ($unsigned({reg55}) <<< (wire14 ?
                  reg50 : (^reg53)))));
            end
          else
            begin
              reg54 <= wire16[(1'h1):(1'h0)];
              reg55 <= wire14;
              reg56 <= $unsigned($signed({(~|{wire16, reg56})}));
              reg57 <= {(!(reg50 ? reg47[(4'hc):(2'h3)] : (-{reg20, wire15})))};
              reg58 <= $unsigned($signed((~^($signed(reg22) ?
                  $unsigned(reg56) : (reg51 ? reg56 : reg52)))));
            end
          if ({($unsigned($signed($signed(reg52))) & reg50),
              $unsigned(((+reg20) ? reg47 : reg46[(2'h2):(1'h0)]))})
            begin
              reg59 <= {{(((!reg20) ? ((8'h9c) | reg21) : ((8'hbc) == reg22)) ?
                          $signed(reg49[(3'h6):(2'h3)]) : (wire13[(4'hc):(1'h1)] <= ((7'h41) << reg23))),
                      $unsigned({(reg50 ? reg55 : reg56), (^wire17)})}};
            end
          else
            begin
              reg59 <= {reg23[(4'ha):(2'h3)]};
              reg60 <= (((&wire24) ? $signed(reg48) : $unsigned(reg19)) ?
                  reg55 : (~(8'hb2)));
              reg61 <= $unsigned(reg54);
            end
          if (((&(reg60 * $signed((reg19 & (8'haf))))) | $signed({($signed(reg60) ?
                  wire44[(4'he):(4'hb)] : (^reg61))})))
            begin
              reg62 <= reg49;
              reg63 <= ($unsigned(reg22) ?
                  reg52 : (^(-$signed($signed(reg50)))));
            end
          else
            begin
              reg62 <= $unsigned($signed(wire12[(4'hd):(4'hb)]));
              reg63 <= reg63;
              reg64 <= reg59[(1'h0):(1'h0)];
              reg65 <= (~^$unsigned(wire14[(3'h5):(2'h3)]));
              reg66 <= $signed($unsigned($unsigned((reg64[(3'h7):(1'h1)] ?
                  $unsigned((8'ha0)) : $unsigned(reg22)))));
            end
          reg67 <= ($signed($signed(({(8'haf), wire14} * reg51))) ?
              (~^$unsigned({{reg53, (8'hb1)},
                  (8'ha7)})) : ($unsigned((~reg22)) ?
                  (|{((8'ha4) << reg56)}) : {(7'h43),
                      (~(reg20 ? wire12 : reg47))}));
        end
      else
        begin
          reg54 <= (8'h9f);
          if (((reg58 != $signed($unsigned((reg52 < (8'hb3))))) ^~ (~|(8'hb2))))
            begin
              reg55 <= reg51;
              reg56 <= $unsigned((~^(reg58[(1'h1):(1'h0)] * reg20[(1'h0):(1'h0)])));
              reg57 <= {reg62};
              reg58 <= reg22[(5'h14):(1'h1)];
              reg59 <= $unsigned($unsigned((8'hb8)));
            end
          else
            begin
              reg55 <= (~|reg20[(1'h0):(1'h0)]);
              reg56 <= reg67[(2'h2):(1'h1)];
              reg57 <= ($signed(((^~(reg66 == reg55)) >= ($signed(reg56) | (reg64 ?
                  reg45 : reg20)))) + reg62[(4'h9):(3'h4)]);
              reg58 <= reg18[(1'h1):(1'h0)];
              reg59 <= reg46;
            end
          if (reg18[(2'h2):(2'h2)])
            begin
              reg60 <= (+($unsigned((+{reg67, wire14})) ? (^wire17) : (8'h9e)));
              reg61 <= ((wire42[(1'h1):(1'h1)] ?
                      reg64[(4'ha):(3'h6)] : (~($unsigned(wire42) ?
                          wire44[(4'h8):(3'h5)] : reg53))) ?
                  $unsigned($signed($signed($unsigned(reg22)))) : $unsigned(({(^~reg22),
                          reg62[(3'h7):(1'h0)]} ?
                      (+$unsigned(reg58)) : ($signed(reg54) ^ (8'ha3)))));
              reg62 <= reg47[(3'h5):(2'h2)];
              reg63 <= ((^~$unsigned($signed((reg56 ?
                  reg57 : (8'had))))) != wire14);
              reg64 <= {reg55};
            end
          else
            begin
              reg60 <= (|($unsigned(reg64[(1'h0):(1'h0)]) * reg23[(4'hc):(2'h2)]));
              reg61 <= ((reg64[(2'h3):(1'h1)] ?
                  reg57 : ((^$signed(wire24)) ~^ (!$signed(reg57)))) || $unsigned({{reg65,
                      (reg48 != reg50)}}));
              reg62 <= (wire15[(3'h5):(2'h2)] ?
                  wire24 : $signed($unsigned((~(+reg48)))));
              reg63 <= (~&$signed(($signed(reg64[(2'h3):(2'h2)]) || reg55)));
            end
        end
    end
  always
    @(posedge clk) begin
      reg68 <= (~|$signed(((8'hac) ?
          (^reg18[(3'h6):(2'h3)]) : ($signed(reg50) ?
              (wire42 >= reg65) : reg22))));
      reg69 <= reg48[(1'h0):(1'h0)];
      reg70 <= reg65;
      if ((reg55 > $signed({$unsigned((reg51 | reg50)), reg62[(3'h7):(2'h2)]})))
        begin
          reg71 <= ($signed({((~^reg52) * {wire16}), reg63}) ?
              (^~(-$unsigned(reg54[(3'h6):(3'h5)]))) : (^$signed((&(reg62 && (8'hbf))))));
          reg72 <= (~(8'hbf));
        end
      else
        begin
          reg71 <= {reg61, (~^$signed({$signed(reg54), wire13}))};
        end
    end
  module73 #() modinst83 (.wire77(reg51), .wire74(reg58), .y(wire82), .clk(clk), .wire76(wire15), .wire75(reg64));
  always
    @(posedge clk) begin
      reg84 <= ($signed($signed($signed($unsigned(reg53)))) == reg70[(1'h0):(1'h0)]);
      reg85 <= reg62;
      if (reg51)
        begin
          reg86 <= (reg57 ?
              reg64[(4'hd):(3'h7)] : $unsigned((^$unsigned({reg85, reg65}))));
          if ((reg64[(4'hd):(3'h7)] ? reg53 : {$unsigned(reg53), reg46}))
            begin
              reg87 <= (+({reg70[(1'h0):(1'h0)],
                  (^~$signed(wire12))} << ($signed($signed(reg54)) + $unsigned($signed(reg18)))));
              reg88 <= (wire14 ?
                  $unsigned(reg60) : ($unsigned(({(8'hbd), reg53} ?
                          wire44 : (wire82 || reg47))) ?
                      {reg87,
                          ({reg63,
                              reg64} != (|reg20))} : reg70[(2'h2):(1'h1)]));
              reg89 <= ((^wire24) != reg85);
              reg90 <= reg50;
            end
          else
            begin
              reg87 <= {$signed((($unsigned(reg21) ?
                      $signed(reg86) : {(8'hac)}) > reg55)),
                  (((((8'ha4) - wire42) & reg60[(1'h0):(1'h0)]) ?
                      (&(reg59 && reg45)) : (reg53 && reg52)) | (reg55[(1'h0):(1'h0)] ?
                      (~&$unsigned(reg87)) : (&reg86)))};
              reg88 <= reg62[(2'h2):(1'h1)];
              reg89 <= (reg67[(1'h1):(1'h1)] ?
                  {$unsigned($unsigned($unsigned(reg84))),
                      ((+(+(8'hbf))) ?
                          (!{reg58,
                              reg90}) : reg47)} : ($signed((+$signed(reg22))) & (+$signed($signed((8'ha1))))));
              reg90 <= $signed(reg46[(4'ha):(1'h0)]);
            end
          reg91 <= wire15[(4'hf):(4'h9)];
          reg92 <= (wire14 != (~&reg61));
          reg93 <= (~&reg56);
        end
      else
        begin
          reg86 <= ((&reg19[(3'h4):(3'h4)]) ?
              ($signed(($signed(wire16) ?
                  reg50[(2'h2):(1'h1)] : wire16[(2'h3):(1'h0)])) ~^ (~(^$unsigned(wire17)))) : {reg58});
          reg87 <= {($signed(reg90) ^ {$unsigned({(8'hbc)}),
                  (reg56[(4'hd):(4'hc)] ? $signed(reg46) : $signed((8'hb6)))})};
          reg88 <= (&(|({(~&reg88),
              (reg61 <= wire82)} << reg67[(1'h0):(1'h0)])));
          reg89 <= (-{($signed($unsigned((8'ha7))) >= reg57),
              $signed({$unsigned(reg20), (^~reg56)})});
          if (reg55[(1'h0):(1'h0)])
            begin
              reg90 <= $signed($unsigned(reg84[(3'h5):(1'h0)]));
              reg91 <= (reg92[(3'h6):(2'h3)] ?
                  $signed(reg50) : $unsigned(($unsigned($unsigned(reg93)) <<< $signed((reg20 ?
                      reg93 : (8'h9c))))));
              reg92 <= $unsigned({(((reg60 ?
                          reg53 : reg84) >= $signed((8'h9e))) ?
                      reg45 : (~|$unsigned(reg65)))});
            end
          else
            begin
              reg90 <= (({$unsigned(reg52[(4'hb):(2'h2)]),
                      $unsigned(reg92[(4'hd):(4'h9)])} ^ ($signed(((7'h40) ?
                      wire16 : wire42)) & ((wire14 ?
                      wire13 : reg19) | (^reg56)))) ?
                  $unsigned((~|reg51)) : (8'ha8));
              reg91 <= $signed((+wire24[(4'hb):(1'h1)]));
            end
        end
    end
  assign wire94 = (reg56 < (~$unsigned(($signed(reg64) + (!reg72)))));
  assign wire95 = ((^$unsigned((reg68[(3'h6):(2'h3)] ?
                      (~^reg64) : reg89))) > ($unsigned(reg84[(4'hc):(4'hc)]) ?
                      reg62 : $signed(($unsigned(reg61) <= $unsigned(reg93)))));
  assign wire96 = $signed({$unsigned((reg56[(2'h2):(2'h2)] ?
                          {reg72, reg59} : (reg70 ? reg71 : reg85)))});
endmodule

module module73  (y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire77;
  input wire [(5'h14):(1'h0)] wire76;
  input wire [(2'h2):(1'h0)] wire75;
  input wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  assign y = {wire81, wire80, wire79, wire78, (1'h0)};
  assign wire78 = $unsigned(wire77);
  assign wire79 = $signed($unsigned((^~$unsigned(((8'haa) + wire74)))));
  assign wire80 = ((wire78 ?
                          (^{wire77[(5'h12):(3'h7)],
                              (wire79 - (7'h41))}) : (~&wire75[(1'h0):(1'h0)])) ?
                      wire74 : ((({(8'hab)} ?
                              (~^wire75) : wire76[(4'h9):(3'h4)]) | (+$unsigned(wire74))) ?
                          wire75[(1'h1):(1'h1)] : (!wire78[(4'h8):(2'h2)])));
  assign wire81 = (^(~|wire79));
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire30;
  input wire signed [(4'hc):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire [(3'h7):(1'h0)] wire27;
  input wire [(2'h2):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire31 = (^~((wire26 ? (8'hb6) : $signed(((8'hbd) ~^ wire29))) ?
                      wire30 : (wire29 + ($unsigned((7'h40)) ?
                          (wire30 ? wire30 : wire28) : $unsigned((7'h43))))));
  assign wire32 = wire27[(1'h1):(1'h1)];
  assign wire33 = (^$signed(($signed((~^wire28)) ^~ wire32[(1'h1):(1'h1)])));
  assign wire34 = (^($unsigned($signed($signed((8'ha9)))) >> wire27[(3'h5):(1'h1)]));
  assign wire35 = wire26;
  assign wire36 = (wire35 << wire34);
  assign wire37 = $signed((~^wire36));
  assign wire38 = wire33;
  always
    @(posedge clk) begin
      reg39 <= wire27;
      reg40 <= wire26;
      reg41 <= (~&$unsigned(wire37[(1'h1):(1'h0)]));
    end
endmodule
