module top
#(parameter param202 = ((((((8'hb5) < (8'haf)) || ((8'hae) ? (8'hbb) : (8'had))) <<< {((8'hac) | (8'hbb))}) & ((~((8'had) ~^ (8'hb5))) > {((8'hbc) < (8'hbb))})) << (&(!(((8'hb6) ? (8'hba) : (8'hbc)) ? ((8'hb5) ~^ (7'h44)) : (^~(8'hb7)))))), 
parameter param203 = ((|param202) ? {param202} : param202))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire201;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire199;
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire201,
                 wire5,
                 wire6,
                 wire12,
                 wire13,
                 wire199,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed(($unsigned(((wire2 ? wire4 : (8'hb7)) ?
                     (^(8'ha5)) : $signed(wire4))) < ($signed($unsigned(wire4)) ?
                     wire4 : $signed((wire4 <= wire2)))));
  assign wire6 = (wire3 & $signed($unsigned((+wire0[(3'h7):(1'h1)]))));
  always
    @(posedge clk) begin
      reg7 <= (+$signed((+(wire5 ? {wire1} : $signed(wire5)))));
      reg8 <= (~^(^$unsigned($signed((wire0 ? reg7 : wire0)))));
      reg9 <= $unsigned($signed($unsigned($unsigned($unsigned(reg8)))));
      reg10 <= wire0[(4'hb):(3'h4)];
      reg11 <= reg8;
    end
  assign wire12 = (reg7 ? wire6 : $unsigned(wire0));
  assign wire13 = (~^(~^reg7));
  module14 #() modinst200 (wire199, clk, reg8, wire13, wire3, reg10, wire0);
  assign wire201 = ((reg7[(4'ha):(3'h4)] ?
                           (^~$signed((wire4 << wire13))) : $signed($unsigned((~|wire199)))) ?
                       ($unsigned($unsigned(wire13)) | (reg7[(2'h3):(2'h3)] << reg8)) : (7'h40));
endmodule

module module14
#(parameter param197 = ((~&(!(8'hba))) && (({((8'h9e) | (7'h44))} ? ((~(8'ha8)) ? (8'hb6) : ((8'hb9) ? (7'h41) : (7'h41))) : (!{(8'hbe), (8'ha8)})) == {(^~((8'hae) ? (8'hba) : (8'hb3)))})), 
parameter param198 = {param197, param197})
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h26b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire195;
  wire [(5'h10):(1'h0)] wire138;
  wire [(4'hc):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire20;
  reg signed [(5'h15):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(3'h7):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  assign y = {wire195,
                 wire138,
                 wire136,
                 wire113,
                 wire65,
                 wire64,
                 wire61,
                 wire59,
                 wire45,
                 wire20,
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
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire20 = (-((((-wire18) << {wire16, wire17}) ?
                          {wire19} : $signed($unsigned((8'had)))) ?
                      wire16 : $unsigned(wire18[(1'h0):(1'h0)])));
  module21 #() modinst46 (wire45, clk, wire19, wire16, wire20, wire17);
  module47 #() modinst60 (.y(wire59), .wire49(wire45), .clk(clk), .wire48(wire17), .wire50(wire16), .wire51(wire18));
  assign wire61 = wire20[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      reg62 <= wire59;
      reg63 <= ($signed((wire16[(4'ha):(4'ha)] ?
              {wire17, wire17} : $unsigned(wire15))) ?
          $unsigned($signed(((~^wire18) || (wire19 ?
              wire45 : wire61)))) : ((($signed(wire59) == reg62) ?
                  ((wire45 != wire59) << (^~wire61)) : (wire59[(4'h9):(2'h2)] ?
                      (wire16 < wire16) : (wire17 * wire45))) ?
              $unsigned($unsigned($signed((8'haf)))) : $unsigned(((wire59 ?
                      wire61 : wire61) ?
                  (~&wire59) : (wire45 ? (7'h44) : wire18)))));
    end
  assign wire64 = $unsigned((($signed((wire59 ^ wire17)) + (wire59 ?
                          (wire20 & (8'ha8)) : wire61)) ?
                      $signed(wire61) : wire61[(3'h7):(2'h3)]));
  assign wire65 = wire64[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if (((wire15[(1'h1):(1'h1)] ?
              {{reg62[(4'ha):(2'h3)],
                      wire17[(4'he):(3'h7)]}} : (wire64[(1'h1):(1'h0)] ?
                  $unsigned(wire15) : wire19)) ?
          ({(wire65[(2'h2):(1'h0)] > (8'hbb))} ?
              wire17 : reg62[(3'h6):(1'h1)]) : $unsigned($unsigned((~^((8'hb3) ?
              wire64 : wire59))))))
        begin
          reg66 <= {$signed(wire18[(3'h4):(1'h1)]),
              ($signed({$signed(wire15)}) ?
                  (^$signed((wire16 ^ wire20))) : (~&{((8'hbb) ?
                          wire59 : wire64)}))};
          reg67 <= wire65;
          reg68 <= wire59[(3'h7):(1'h0)];
        end
      else
        begin
          reg66 <= (8'ha7);
          if ((~|{{wire59, $signed((&(8'hb4)))}}))
            begin
              reg67 <= (~^$signed($signed((((8'ha4) ? wire17 : reg67) ?
                  $unsigned(reg62) : wire64))));
              reg68 <= reg62;
            end
          else
            begin
              reg67 <= ($signed($unsigned($signed(wire64[(1'h1):(1'h1)]))) != {(|$unsigned((wire20 || wire19))),
                  (!$signed((reg68 ? wire45 : wire19)))});
              reg68 <= wire61;
              reg69 <= wire20;
            end
          reg70 <= {$signed(((~&(^~reg68)) || ((wire16 ? reg68 : wire59) ?
                  $unsigned(wire18) : (wire61 ^ (8'ha9)))))};
          reg71 <= reg62;
          reg72 <= {{($unsigned($signed(wire15)) >> wire20)}};
        end
      if ((~&$signed(wire65[(1'h0):(1'h0)])))
        begin
          reg73 <= (($unsigned((|reg67)) ? wire19[(4'hb):(1'h1)] : reg62) ?
              (&$unsigned((^$unsigned(wire65)))) : wire65[(1'h1):(1'h0)]);
          if ($signed(reg73[(3'h7):(1'h0)]))
            begin
              reg74 <= reg69[(3'h6):(2'h3)];
            end
          else
            begin
              reg74 <= $unsigned((reg66[(4'h9):(1'h1)] == wire64[(1'h1):(1'h1)]));
              reg75 <= $signed({$unsigned((~^$unsigned(reg69))),
                  $signed($signed((^wire16)))});
              reg76 <= (!$unsigned((((reg62 ? reg63 : wire65) ?
                  (reg74 <= reg70) : (~|wire20)) | ({reg62} <= $unsigned(reg75)))));
            end
          if ((+{$unsigned((wire64 <<< reg76[(4'he):(3'h4)])),
              wire61[(4'hf):(4'hb)]}))
            begin
              reg77 <= ((^$signed($unsigned({reg71}))) ?
                  {$unsigned(((~|reg74) != $signed(wire16)))} : (8'hb9));
              reg78 <= wire20[(4'h8):(4'h8)];
              reg79 <= $unsigned((|$signed(wire19[(4'hf):(3'h5)])));
              reg80 <= $unsigned(reg76[(4'hc):(3'h5)]);
              reg81 <= (($unsigned(reg72[(3'h4):(1'h0)]) - (reg70 ?
                  (^{(8'ha2)}) : $unsigned((reg78 ?
                      wire20 : (8'ha2))))) && $unsigned($unsigned($unsigned($signed(wire61)))));
            end
          else
            begin
              reg77 <= reg73[(4'h9):(3'h6)];
              reg78 <= $signed({(($signed(wire20) ?
                      reg71[(3'h4):(2'h2)] : (&reg78)) - reg74)});
              reg79 <= $unsigned(($unsigned((wire19[(1'h1):(1'h0)] ?
                  (!reg62) : (reg68 >> wire65))) == ({wire59} ?
                  ((+reg79) < (&reg62)) : wire18)));
              reg80 <= ((reg67 ?
                      (wire17[(5'h11):(2'h2)] ?
                          (reg70[(1'h1):(1'h0)] ?
                              (8'hb7) : (wire45 ?
                                  (8'hb9) : reg78)) : ((wire59 + reg77) ?
                              reg81 : $unsigned(reg75))) : $unsigned(reg70)) ?
                  {($unsigned($signed(wire19)) >= (|(reg69 & wire64))),
                      $unsigned($signed((&(8'hae))))} : (+wire15));
              reg81 <= (~^wire18);
            end
        end
      else
        begin
          reg73 <= wire64[(3'h4):(3'h4)];
        end
    end
  module82 #() modinst114 (wire113, clk, wire45, reg73, reg75, wire18);
  module115 #() modinst137 (.y(wire136), .wire116(wire19), .clk(clk), .wire119(reg76), .wire117(reg63), .wire118(wire65));
  assign wire138 = reg67[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      if (wire20)
        begin
          reg139 <= {wire136[(4'hc):(3'h7)],
              $signed($signed(((^~reg75) <<< wire61[(4'hc):(4'h9)])))};
          reg140 <= (~^{$unsigned({((7'h41) ? (8'ha4) : reg73)}), wire64});
          if ($unsigned((|(reg72[(3'h4):(1'h1)] == wire136))))
            begin
              reg141 <= wire138;
              reg142 <= (wire138[(1'h0):(1'h0)] ?
                  wire45 : $signed(wire20[(3'h6):(1'h0)]));
              reg143 <= $signed(wire61[(4'he):(1'h1)]);
            end
          else
            begin
              reg141 <= {$unsigned((^({(8'hb2), wire61} ^~ (^~reg78)))),
                  $signed(($unsigned((+wire20)) < (-reg62)))};
              reg142 <= ((({{reg68, (8'hba)},
                  wire19} | wire17[(5'h10):(2'h3)]) || {{$signed(reg70),
                      $unsigned(reg74)}}) | $signed(((!(reg74 && reg70)) == $unsigned(wire45[(1'h1):(1'h1)]))));
            end
        end
      else
        begin
          if ($signed(wire17[(4'h8):(4'h8)]))
            begin
              reg139 <= $signed(((~^reg139[(4'hc):(4'hb)]) ? wire45 : reg81));
              reg140 <= wire113;
              reg141 <= $signed($unsigned($signed((-$unsigned(reg76)))));
            end
          else
            begin
              reg139 <= wire16;
              reg140 <= (reg63 ?
                  reg71 : $signed($signed(reg140[(1'h0):(1'h0)])));
            end
          reg142 <= reg78;
          reg143 <= $unsigned((($signed($unsigned(wire138)) ?
                  (&(!reg68)) : reg73[(5'h11):(3'h7)]) ?
              reg77[(1'h0):(1'h0)] : ($unsigned($unsigned(reg72)) ?
                  ($signed(reg74) ?
                      wire17[(4'hb):(3'h5)] : (reg69 ?
                          (8'hb3) : reg78)) : $unsigned(reg76))));
          reg144 <= ($signed(($signed(((8'ha1) ?
                  wire136 : wire61)) > $signed($unsigned(reg63)))) ?
              $unsigned($signed(wire17)) : ($signed(wire15) - {($unsigned((8'hbe)) ?
                      {reg67, wire59} : (!(8'h9c))),
                  wire15}));
        end
      if (reg67[(1'h1):(1'h1)])
        begin
          if ($signed(wire15[(2'h3):(2'h3)]))
            begin
              reg145 <= reg78;
              reg146 <= wire113[(4'h8):(3'h6)];
              reg147 <= reg142[(4'h9):(4'h8)];
            end
          else
            begin
              reg145 <= $unsigned($signed(wire65));
            end
          reg148 <= reg72[(5'h12):(5'h11)];
          reg149 <= (!$signed((7'h44)));
          if (((($unsigned((|reg144)) ?
                  (((8'had) << reg75) ?
                      reg71[(3'h5):(1'h1)] : (reg76 == (8'hb5))) : reg142) != $signed(reg74[(4'h9):(2'h2)])) ?
              ((|{{reg141, wire20}, {wire113, wire16}}) & $unsigned(({reg62,
                      (8'hbd)} ?
                  $signed((8'ha8)) : (!wire19)))) : (-(wire61 ?
                  {((8'hb5) ? (8'hbe) : reg78), $unsigned(wire19)} : (reg81 ?
                      $unsigned(wire20) : {reg68, wire65})))))
            begin
              reg150 <= reg75;
              reg151 <= $unsigned((($signed($unsigned(reg66)) ?
                  reg139[(2'h3):(2'h2)] : reg70[(1'h0):(1'h0)]) <= $unsigned((-wire16[(5'h10):(4'he)]))));
              reg152 <= (+((reg78[(4'hd):(3'h6)] ?
                      $signed((reg80 || reg140)) : wire65) ?
                  (((reg150 ? (8'hb8) : reg151) ~^ (reg67 & (7'h42))) ?
                      (reg142[(5'h12):(5'h12)] <<< (!reg149)) : $unsigned(reg145)) : wire61[(3'h5):(2'h3)]));
              reg153 <= $signed(reg150);
              reg154 <= wire19;
            end
          else
            begin
              reg150 <= {(~^$unsigned(reg139))};
              reg151 <= (($unsigned(reg141) != (~$unsigned($unsigned(wire18)))) >> reg140[(1'h0):(1'h0)]);
              reg152 <= $signed(($signed((&$unsigned(wire113))) <= $unsigned(wire138[(4'ha):(4'h8)])));
            end
          reg155 <= ((7'h40) <<< $unsigned((-reg146[(2'h2):(1'h1)])));
        end
      else
        begin
          if (wire19[(1'h0):(1'h0)])
            begin
              reg145 <= $signed(reg81);
            end
          else
            begin
              reg145 <= {$signed((reg78[(2'h3):(2'h3)] != {(+wire17)})),
                  $unsigned((reg68[(3'h5):(3'h5)] ?
                      reg74 : ((reg66 >= (7'h42)) <<< (reg74 != (8'ha1)))))};
              reg146 <= (($signed((~^$unsigned(wire19))) >>> {$signed((|reg155)),
                      reg142[(1'h1):(1'h0)]}) ?
                  (wire18[(3'h6):(2'h3)] >= $signed(reg79)) : ((wire65 ?
                          reg71[(4'ha):(1'h0)] : (^~$signed(reg79))) ?
                      $unsigned((wire136 ?
                          ((8'hb0) ?
                              (8'ha0) : (8'hbe)) : (^~reg153))) : $unsigned(wire113)));
              reg147 <= $unsigned((&wire61[(4'hf):(4'ha)]));
            end
          reg148 <= $unsigned({reg81});
          reg149 <= $signed(wire61[(4'hc):(2'h2)]);
        end
      reg156 <= ($signed(((-(wire17 ^~ reg153)) ?
              ($signed(wire16) >> $signed(reg145)) : $signed(reg66[(4'ha):(3'h5)]))) ?
          ($unsigned((~reg148)) ?
              reg140[(3'h6):(3'h4)] : ($signed(reg141) ?
                  $unsigned((~&reg63)) : ($signed(reg81) ?
                      reg67 : reg74[(4'hd):(4'h9)]))) : (reg139[(4'he):(4'ha)] ?
              (reg73 & ((-wire16) > reg77[(2'h2):(1'h0)])) : $signed($unsigned(wire61[(4'ha):(3'h5)]))));
    end
  module157 #() modinst196 (.wire159(reg144), .y(wire195), .wire161(reg70), .wire158(reg150), .wire160(reg73), .clk(clk));
endmodule

module module157  (y, clk, wire161, wire160, wire159, wire158);
  output wire [(32'h19a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire161;
  input wire signed [(4'hd):(1'h0)] wire160;
  input wire signed [(3'h4):(1'h0)] wire159;
  input wire signed [(4'hd):(1'h0)] wire158;
  wire signed [(5'h14):(1'h0)] wire194;
  wire [(5'h10):(1'h0)] wire179;
  wire [(5'h13):(1'h0)] wire178;
  wire [(3'h7):(1'h0)] wire177;
  wire [(5'h14):(1'h0)] wire176;
  wire signed [(5'h10):(1'h0)] wire170;
  wire signed [(4'ha):(1'h0)] wire169;
  wire [(2'h2):(1'h0)] wire166;
  wire [(4'hf):(1'h0)] wire165;
  wire signed [(4'hc):(1'h0)] wire164;
  wire [(2'h3):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire162;
  reg signed [(4'hf):(1'h0)] reg193 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg192 = (1'h0);
  reg [(5'h14):(1'h0)] reg191 = (1'h0);
  reg [(3'h5):(1'h0)] reg190 = (1'h0);
  reg [(4'h9):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg188 = (1'h0);
  reg [(5'h15):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg185 = (1'h0);
  reg [(3'h5):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(3'h5):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg174 = (1'h0);
  reg [(4'ha):(1'h0)] reg173 = (1'h0);
  reg [(4'hb):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg168 = (1'h0);
  reg [(2'h2):(1'h0)] reg167 = (1'h0);
  assign y = {wire194,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire170,
                 wire169,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg168,
                 reg167,
                 (1'h0)};
  assign wire162 = $unsigned(wire160);
  assign wire163 = $signed(wire160);
  assign wire164 = wire158;
  assign wire165 = wire161;
  assign wire166 = ({$signed((+(wire159 ? (7'h40) : wire161))),
                           ($unsigned((wire163 >>> wire164)) ~^ $unsigned($unsigned((7'h42))))} ?
                       (8'hbb) : (wire163 >> {{(-wire165), $signed(wire163)},
                           ((wire158 == (8'ha1)) ?
                               $signed((8'hbf)) : $unsigned(wire160))}));
  always
    @(posedge clk) begin
      reg167 <= wire162[(4'hf):(3'h4)];
      reg168 <= $unsigned($signed((((~^wire158) ^~ wire161) ?
          {(wire163 * wire161)} : ((!wire159) >> (^~(8'hb3))))));
    end
  assign wire169 = $signed({(wire165[(3'h7):(1'h1)] + reg167[(1'h0):(1'h0)])});
  assign wire170 = $signed($signed(wire159[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ((wire166 > (wire170 ?
          (wire163 < {$signed(reg167),
              wire163}) : $signed($unsigned((~&wire158))))))
        begin
          reg171 <= ($unsigned((~|(|(reg167 ? (8'hb9) : (8'ha7))))) ?
              wire163 : wire166[(2'h2):(1'h0)]);
          reg172 <= $unsigned(wire166);
          reg173 <= $signed(($unsigned(wire161[(4'h8):(1'h1)]) ?
              $signed(((reg172 ?
                  wire170 : reg167) << (wire161 != (7'h41)))) : $signed({wire164})));
          reg174 <= reg172[(1'h1):(1'h0)];
          reg175 <= (~|(8'ha1));
        end
      else
        begin
          reg171 <= (+$signed(((|reg173) ?
              ($unsigned(reg171) << (^~wire169)) : ((-wire169) ?
                  (|wire160) : reg173[(4'h8):(2'h2)]))));
          reg172 <= wire158[(4'hd):(4'hd)];
        end
    end
  assign wire176 = (~wire166);
  assign wire177 = $unsigned(((~&wire161) ?
                       (reg173[(1'h1):(1'h0)] >>> wire170[(4'hf):(4'h9)]) : ($unsigned((~&wire160)) ^~ ($unsigned(wire160) ?
                           {wire164} : (-wire165)))));
  assign wire178 = (^(~^$unsigned(wire177)));
  assign wire179 = (((reg172 ^~ (~|$signed(wire162))) ?
                       $signed((8'hb1)) : (8'h9f)) ^ $signed(reg171[(4'hf):(1'h0)]));
  always
    @(posedge clk) begin
      reg180 <= wire169;
      reg181 <= $unsigned($signed(reg172[(4'h9):(4'h9)]));
      reg182 <= reg175;
      reg183 <= reg168[(5'h10):(3'h7)];
      if (wire178[(1'h1):(1'h0)])
        begin
          if (wire159)
            begin
              reg184 <= (^wire161);
              reg185 <= $signed(((wire162[(4'ha):(2'h2)] ?
                  wire160[(1'h0):(1'h0)] : $signed(wire165)) != $unsigned(wire161[(1'h1):(1'h0)])));
            end
          else
            begin
              reg184 <= $unsigned($unsigned($signed(wire161[(2'h3):(1'h1)])));
              reg185 <= wire159[(1'h1):(1'h0)];
            end
          if ((|((!(wire166 != (reg185 ?
              (8'hbd) : wire160))) >> (((-wire163) && ((8'h9d) <<< (8'hab))) ?
              $signed((wire164 + reg168)) : ((reg183 <<< wire177) ?
                  reg171[(2'h2):(2'h2)] : $unsigned(reg185))))))
            begin
              reg186 <= (^~$signed(reg180[(4'ha):(4'h9)]));
              reg187 <= (wire176[(4'hf):(4'h9)] <= $unsigned(reg171));
            end
          else
            begin
              reg186 <= (~{wire162[(1'h1):(1'h1)]});
              reg187 <= $signed((~&{reg181[(2'h2):(1'h0)],
                  wire163[(2'h2):(1'h0)]}));
            end
          if ((8'hab))
            begin
              reg188 <= $signed({(^~(!(wire178 ~^ reg172))),
                  {$unsigned((reg168 > wire163))}});
              reg189 <= (+wire176);
            end
          else
            begin
              reg188 <= {$signed($unsigned(wire166[(2'h2):(1'h1)])), wire169};
              reg189 <= reg184[(3'h4):(1'h0)];
              reg190 <= (!(8'ha0));
              reg191 <= (^~wire161);
              reg192 <= (reg172 ^ $unsigned((|$unsigned({reg168, reg183}))));
            end
          reg193 <= $signed(wire161[(2'h3):(2'h2)]);
        end
      else
        begin
          if ($signed(reg180))
            begin
              reg184 <= $signed(wire163);
              reg185 <= (($signed($unsigned(wire162[(3'h4):(2'h2)])) ?
                  $unsigned($signed(reg175)) : ({(8'hac),
                      {wire170}} & ($signed(reg193) || (reg187 ?
                      wire176 : wire164)))) != (8'ha4));
              reg186 <= $signed((reg182 * wire162[(5'h12):(3'h5)]));
              reg187 <= $signed(($unsigned(reg191) < (reg191[(4'he):(2'h2)] ?
                  {reg188, {reg186, wire176}} : {$signed((7'h41))})));
            end
          else
            begin
              reg184 <= reg167[(1'h0):(1'h0)];
              reg185 <= $unsigned(((!wire166) ?
                  (((&reg189) != (reg175 <= reg185)) ?
                      ((reg181 ? reg187 : wire164) ?
                          $unsigned(wire159) : $signed((8'hbe))) : (^~reg173[(1'h0):(1'h0)])) : {reg171[(4'hb):(4'hb)],
                      reg180}));
            end
          reg188 <= (&((((^reg183) & wire166) << (!$signed(reg172))) ?
              (~^$unsigned($signed(wire166))) : ($unsigned(reg191[(5'h10):(4'hd)]) ?
                  reg185 : $unsigned((reg185 <<< reg168)))));
          reg189 <= (8'hb7);
          reg190 <= (^~(($signed(wire179) >> reg167[(1'h1):(1'h1)]) ?
              (wire164 ? reg190 : ((~|wire170) < (!wire166))) : wire179));
          reg191 <= $signed(((+$signed($signed((8'hb9)))) ?
              $unsigned($signed((8'hb2))) : ($signed(reg173) > $signed((wire160 ^ (8'ha3))))));
        end
    end
  assign wire194 = (reg188[(3'h4):(1'h1)] == ($signed({wire162[(3'h4):(2'h2)],
                           $signed(wire162)}) ?
                       $signed(($unsigned((8'hb4)) >>> reg182)) : {((8'hbc) ?
                               $signed(wire170) : (|wire166)),
                           $signed($unsigned(wire179))}));
endmodule

module module115
#(parameter param135 = (((^(8'ha3)) >= ((((8'hb4) <= (8'h9f)) ? {(8'hab), (7'h40)} : (7'h44)) ? ({(8'h9d), (8'ha3)} != ((8'ha9) - (8'hbd))) : ((~|(7'h41)) ? ((8'ha8) ? (8'hb8) : (8'hb6)) : (-(7'h44))))) ? ((8'hb7) ^ ((((8'hb2) ? (8'hae) : (8'ha4)) ~^ ((8'hb5) ? (8'haa) : (8'hb1))) ? ({(7'h44), (8'h9c)} ? ((8'ha1) + (8'hb9)) : ((8'ha8) ? (8'hb5) : (8'ha3))) : ((8'hb2) ? (^~(8'hb3)) : {(8'had)}))) : (((!(|(8'hb5))) ~^ {(8'haf)}) * ((~|((8'hb0) ? (8'h9f) : (8'had))) ? (((7'h44) * (8'hb8)) ? ((8'hb6) >>> (8'hb0)) : ((8'hb8) & (8'haa))) : ({(8'ha0)} >> (8'hb5))))))
(y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire119;
  input wire [(5'h10):(1'h0)] wire118;
  input wire [(5'h15):(1'h0)] wire117;
  input wire [(5'h15):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire133;
  wire signed [(3'h4):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire [(4'hf):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire124;
  wire signed [(2'h2):(1'h0)] wire123;
  wire signed [(3'h6):(1'h0)] wire122;
  wire [(5'h11):(1'h0)] wire121;
  wire signed [(4'ha):(1'h0)] wire120;
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire120 = ($unsigned((|wire117)) ^ $unsigned($signed($unsigned(wire117[(5'h14):(1'h1)]))));
  assign wire121 = ($signed($signed((|{(8'hb3), wire118}))) ?
                       (wire120 ?
                           (({wire117} ?
                                   (wire117 ?
                                       wire117 : wire119) : $signed(wire119)) ?
                               (((8'ha4) ? (8'hbc) : wire120) ?
                                   wire117 : $unsigned(wire116)) : (wire120[(3'h4):(2'h3)] && (~^wire117))) : $signed(wire118)) : $signed($signed($unsigned((wire120 && wire119)))));
  assign wire122 = $unsigned(wire121[(4'hc):(1'h0)]);
  assign wire123 = ((($unsigned((wire119 ^ wire116)) ?
                           (-(^~wire118)) : wire119) ?
                       $signed((-{wire119,
                           (8'hb5)})) : ($unsigned($signed(wire119)) ?
                           wire117 : wire118[(1'h0):(1'h0)])) ^ wire117[(4'hf):(4'hc)]);
  assign wire124 = (-wire118[(5'h10):(3'h5)]);
  assign wire125 = $unsigned(wire121[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg126 <= (wire123[(1'h1):(1'h0)] ?
          (~($unsigned($signed((8'haf))) ?
              wire121 : ({wire118} ?
                  wire122 : wire120))) : $unsigned(((~(wire118 && wire125)) ?
              wire122 : (8'hb4))));
      reg127 <= ($unsigned(wire116[(5'h12):(1'h0)]) <= ({(^$unsigned(wire117)),
          $signed(wire116)} > wire117));
      reg128 <= {wire124, wire124};
    end
  assign wire129 = wire125;
  assign wire130 = reg128;
  assign wire131 = $unsigned($unsigned(($unsigned((wire118 != wire124)) ?
                       (wire118 ^~ (wire120 <= wire118)) : ((reg126 ?
                           wire118 : reg126) > (8'hb9)))));
  assign wire132 = wire116;
  assign wire133 = $signed(($unsigned(wire125) ~^ wire131));
  assign wire134 = $signed(wire122);
endmodule

module module82
#(parameter param112 = (((+(&((8'hb3) ? (8'hb2) : (7'h40)))) <<< (8'h9d)) >= (~((((8'hbd) ~^ (8'hac)) - ((8'haa) ? (8'haa) : (7'h44))) >= (((8'h9c) && (8'hbe)) ? {(8'hb4)} : {(8'hba), (8'hac)})))))
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire86;
  input wire [(5'h13):(1'h0)] wire85;
  input wire [(5'h15):(1'h0)] wire84;
  input wire [(4'hb):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire signed [(4'hf):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire87;
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire87,
                 reg109,
                 reg108,
                 reg107,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire87 = (((^~$signed((wire86 ? wire85 : wire84))) + {(wire86 ?
                              wire84 : {wire83, wire84})}) ?
                      (wire83 ?
                          ($unsigned(wire83) ~^ ((+wire85) ?
                              $unsigned(wire86) : ((8'hbd) ?
                                  wire86 : wire85))) : wire86[(4'ha):(4'ha)]) : ($unsigned((((8'ha3) == wire84) ?
                          {wire84} : (wire84 ?
                              wire83 : wire86))) | ((8'ha1) != (((8'hbd) ?
                          wire86 : (8'hb9)) ~^ wire85))));
  always
    @(posedge clk) begin
      reg88 <= (($unsigned({(wire83 ^~ wire86)}) << wire87) ?
          wire85 : (wire83 ?
              {(^wire84[(3'h5):(3'h4)]),
                  ((wire87 ? wire87 : wire87) >>> (~wire83))} : (~^wire85)));
      reg89 <= (8'hb9);
      reg90 <= $signed((((wire83 || (wire85 < wire86)) ?
          ($unsigned(wire85) ?
              wire83 : (~&reg88)) : (wire85 | $signed(wire85))) <= (wire83[(3'h6):(2'h2)] ?
          wire87[(4'hc):(4'ha)] : ($signed(wire84) >>> $signed(wire87)))));
      if (({wire85} ?
          reg89[(3'h4):(2'h3)] : (wire86 ?
              (^~(|(&wire87))) : $signed(((wire84 << reg88) ?
                  {(8'h9c), (8'hbe)} : {reg90, wire83})))))
        begin
          reg91 <= wire84[(3'h7):(3'h5)];
          reg92 <= reg90;
          reg93 <= (reg90 ^~ $signed((($unsigned(wire86) ?
              reg88[(1'h1):(1'h1)] : reg92[(3'h6):(2'h2)]) * ($unsigned(reg88) ?
              (!reg89) : wire83))));
          reg94 <= {wire85[(1'h1):(1'h0)]};
          reg95 <= (reg93[(3'h5):(3'h4)] == {$unsigned({$unsigned(reg91)}),
              wire84[(4'h8):(1'h1)]});
        end
      else
        begin
          reg91 <= (~&({($unsigned(reg94) >= $unsigned(wire83))} ?
              (wire84 && reg92) : $signed(($unsigned(reg90) * reg93[(4'ha):(4'h9)]))));
          if (reg94)
            begin
              reg92 <= $signed(((~&((!reg95) ? (~^reg89) : wire86)) ?
                  {{{(7'h42), reg95}}} : reg94[(4'ha):(1'h1)]));
              reg93 <= $signed($signed($unsigned(reg94)));
              reg94 <= ((^wire85) ?
                  reg88[(1'h1):(1'h1)] : (((~^(^reg92)) ?
                          $unsigned((wire86 != wire84)) : reg89) ?
                      $signed(((reg88 + reg95) << $unsigned(reg92))) : {$signed($unsigned(wire83)),
                          $signed((~^(7'h40)))}));
            end
          else
            begin
              reg92 <= (^~(^~$signed($unsigned((^(8'ha5))))));
              reg93 <= (wire87[(4'ha):(3'h4)] < reg91[(3'h7):(2'h2)]);
              reg94 <= $signed((~^$signed((8'ha1))));
              reg95 <= $unsigned(($signed((-(wire85 ?
                  (8'hbd) : reg88))) >= $signed(wire84[(4'ha):(3'h7)])));
            end
        end
    end
  assign wire96 = ($signed(wire87) ?
                      $unsigned({$signed((reg90 >= wire83))}) : (~reg90[(1'h0):(1'h0)]));
  assign wire97 = reg90;
  assign wire98 = {($unsigned(reg90) >> reg88[(2'h3):(1'h0)]),
                      {((|(^~(8'haf))) ? wire85 : $unsigned(reg89)), wire96}};
  assign wire99 = {(8'hbe)};
  assign wire100 = wire85[(4'hc):(4'hc)];
  assign wire101 = {$unsigned(wire85),
                       $unsigned(((~|wire86) ?
                           $signed((reg92 ~^ wire100)) : (~|(8'hb1))))};
  assign wire102 = (wire84[(4'h8):(2'h2)] << ((~^$signed((^wire99))) ?
                       ((wire83 ? wire100 : (wire83 ? (8'hba) : wire87)) ?
                           $unsigned((wire87 ?
                               reg93 : (8'had))) : $signed(reg90[(4'hb):(4'h9)])) : $signed($unsigned($signed(wire84)))));
  assign wire103 = $unsigned((~({wire101} ?
                       reg95 : (wire98[(2'h3):(1'h0)] ?
                           (8'haa) : (~&wire99)))));
  assign wire104 = ({reg94[(1'h0):(1'h0)]} ? wire101[(4'h9):(3'h6)] : wire87);
  assign wire105 = ((!$unsigned($signed((8'ha7)))) ?
                       reg90 : $signed((~&wire97)));
  assign wire106 = (8'hbe);
  always
    @(posedge clk) begin
      reg107 <= (((&wire103) >>> $unsigned({(+reg93),
              wire103[(4'ha):(3'h6)]})) ?
          wire83[(3'h5):(3'h5)] : (wire102[(2'h2):(1'h0)] ?
              wire87 : (((wire84 ? reg89 : wire84) - (^wire104)) ^~ ((wire83 ?
                      (8'hb4) : reg89) ?
                  (|wire97) : ((8'hbf) ? wire96 : wire96)))));
      reg108 <= ($unsigned((((|reg95) ?
              (reg88 << wire99) : {wire83}) ^ (reg91 * $unsigned(reg91)))) ?
          (reg107[(1'h1):(1'h0)] - $unsigned({$unsigned((8'hac))})) : ($unsigned({(reg92 <<< wire84),
                  $signed(wire84)}) ?
              {$signed(reg107[(4'h8):(3'h6)]), reg95} : (8'hac)));
      reg109 <= $signed((&(8'ha6)));
    end
  assign wire110 = (+$signed((8'hb7)));
  assign wire111 = $unsigned($signed($signed({(reg109 ? reg108 : wire97),
                       $signed(wire84)})));
endmodule

module module47
#(parameter param58 = ((^((((8'hbf) ? (7'h44) : (8'hab)) + ((8'hbe) ? (8'hbd) : (8'hb8))) > (((8'hab) ? (8'hb4) : (8'hb9)) & ((8'h9f) ? (8'hb0) : (8'hb4))))) ? (~^{(((8'hb1) < (8'ha3)) ? {(7'h41), (8'hb3)} : {(8'hb7), (7'h42)})}) : ((({(8'ha4)} >= (-(8'hae))) ? (-((8'hae) + (8'had))) : (~{(8'ha2), (8'h9e)})) ? (({(8'hb5)} ? (8'had) : (~&(8'ha6))) ? (~^((8'hba) * (8'hb3))) : {((8'ha9) < (8'haa)), ((8'had) ? (8'hb4) : (7'h42))}) : (~&((~^(8'ha8)) ? ((8'ha7) ? (8'ha9) : (8'ha7)) : ((8'ha4) ? (8'hb4) : (8'had)))))))
(y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire51;
  input wire signed [(4'hb):(1'h0)] wire50;
  input wire signed [(5'h10):(1'h0)] wire49;
  input wire [(4'he):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire52;
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  assign y = {wire57, wire56, wire55, wire52, reg54, reg53, (1'h0)};
  assign wire52 = (~&({(-wire49[(4'hf):(4'hd)]),
                      (wire48 <<< wire51)} ^ wire50[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg53 <= (wire52[(3'h4):(1'h1)] ^ (8'hb7));
      reg54 <= (+(((|wire48[(1'h0):(1'h0)]) ?
              ($signed(wire51) * (wire50 ? wire50 : wire51)) : {(^wire52),
                  (reg53 < wire52)}) ?
          (&wire52[(1'h0):(1'h0)]) : $signed($signed(wire49))));
    end
  assign wire55 = ({wire51, ($unsigned({wire52}) << reg53)} ?
                      (wire52[(1'h0):(1'h0)] < $signed((~|$signed(reg53)))) : wire52[(1'h1):(1'h0)]);
  assign wire56 = ($unsigned(wire55[(4'hd):(3'h5)]) ?
                      (~wire49) : {(($unsigned(wire52) ?
                                  {reg53, wire51} : wire55) ?
                              $unsigned((wire50 <<< wire51)) : (8'hae)),
                          reg54});
  assign wire57 = (|(wire48 <= ($unsigned($signed((7'h44))) ?
                      reg54 : wire51[(2'h2):(1'h0)])));
endmodule

module module21
#(parameter param43 = (-{({(^~(8'ha9))} < ({(8'h9d), (8'ha4)} <<< ((8'hac) ? (7'h42) : (8'hab))))}), 
parameter param44 = (param43 ? {(param43 >= {param43}), (~^((^(7'h41)) << (param43 ? (7'h44) : (7'h43))))} : (((!{param43}) ? (param43 ? param43 : {param43}) : (~{(8'hb1)})) * {param43})))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire25;
  input wire [(5'h13):(1'h0)] wire24;
  input wire [(3'h5):(1'h0)] wire23;
  input wire [(2'h3):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  assign y = {wire42,
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
                 wire26,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire26 = (~&$unsigned(wire24[(4'h9):(3'h7)]));
  assign wire27 = ({wire24,
                          ((8'hb9) ?
                              wire25 : {$signed(wire23), (wire23 + wire26)})} ?
                      $signed({$unsigned((~&wire22)),
                          (~|((8'h9f) ?
                              wire26 : wire22))}) : $unsigned(($signed((~wire23)) ?
                          ((wire26 ? wire26 : wire23) < (wire23 ?
                              wire22 : wire25)) : {wire26})));
  assign wire28 = (~$signed($unsigned({wire27[(3'h5):(3'h4)],
                      {(8'hb3), wire26}})));
  assign wire29 = wire26;
  assign wire30 = wire26[(3'h5):(3'h4)];
  assign wire31 = {{$signed(((wire27 | (8'ha2)) <= (wire27 ? wire29 : wire30))),
                          {$unsigned($signed(wire29))}},
                      {(~^(|$signed(wire27)))}};
  assign wire32 = wire30;
  assign wire33 = {(^(~&$unsigned((wire27 | wire23))))};
  assign wire34 = wire24[(4'ha):(1'h0)];
  assign wire35 = $unsigned({(+((wire30 ? wire24 : wire27) ?
                          $signed(wire33) : (wire30 ? wire29 : (8'had))))});
  assign wire36 = wire30;
  assign wire37 = (-(-wire22));
  always
    @(posedge clk) begin
      if ($signed(wire33))
        begin
          reg38 <= wire24[(4'he):(4'hd)];
          reg39 <= wire27;
        end
      else
        begin
          reg38 <= wire34[(1'h1):(1'h1)];
          reg39 <= $signed($unsigned({wire27, (~wire23)}));
          reg40 <= wire23[(2'h3):(2'h2)];
        end
      reg41 <= (8'haa);
    end
  assign wire42 = ((~&$signed((^~reg39))) == $unsigned((^$signed($unsigned(wire36)))));
endmodule
