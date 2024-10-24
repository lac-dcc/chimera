module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire145;
  wire signed [(2'h2):(1'h0)] wire146;
  wire signed [(2'h3):(1'h0)] wire147;
  wire [(4'he):(1'h0)] wire188;
  reg [(4'hc):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg173 = (1'h0);
  reg [(4'h8):(1'h0)] reg172 = (1'h0);
  reg [(3'h4):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg167 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  reg [(4'hf):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg162 = (1'h0);
  reg [(5'h11):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg signed [(4'he):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire143,
                 wire10,
                 wire9,
                 wire145,
                 wire146,
                 wire147,
                 wire188,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2[(2'h2):(2'h2)];
      reg6 <= (~{wire4, (reg5[(2'h2):(1'h0)] * (&$unsigned(wire2)))});
      reg7 <= wire0;
      reg8 <= $signed($signed({$unsigned((wire3 ? reg7 : reg5))}));
    end
  assign wire9 = reg6;
  assign wire10 = reg8;
  module11 #() modinst144 (.wire14(reg7), .wire15(wire1), .clk(clk), .wire13(reg8), .y(wire143), .wire16(wire0), .wire12(wire4));
  assign wire145 = (|$signed((($signed(wire0) >> $unsigned(reg6)) ?
                       wire10[(2'h2):(2'h2)] : $unsigned(wire2[(1'h0):(1'h0)]))));
  assign wire146 = $unsigned(((&reg5) ?
                       $unsigned(((reg8 ? wire0 : wire4) ?
                           (+reg6) : $signed(reg5))) : (!reg6[(4'ha):(2'h3)])));
  assign wire147 = $signed((~&$unsigned((((8'hbe) ? wire4 : wire1) ?
                       wire3 : $unsigned(wire4)))));
  always
    @(posedge clk) begin
      reg148 <= (~^$signed($signed((&(-wire9)))));
      if ($unsigned(({({(8'hb1),
              wire9} ~^ ((8'ha7) * wire9))} | ($unsigned($signed(reg8)) < wire145))))
        begin
          reg149 <= (((-$unsigned(((8'ha9) >>> wire10))) ?
              (-$signed($unsigned(reg7))) : (wire143 ?
                  {$unsigned(wire0)} : ({wire2} ?
                      reg148 : $unsigned(reg8)))) - ($signed(((8'ha6) || (&wire9))) || $unsigned($unsigned($signed(reg148)))));
          reg150 <= (~^(wire147 ? wire145 : $unsigned((^$signed(wire3)))));
          reg151 <= (^reg8[(1'h0):(1'h0)]);
          reg152 <= (^~(~&wire147));
          reg153 <= ($unsigned($unsigned($signed((wire2 | wire9)))) ~^ reg150[(5'h11):(4'hf)]);
        end
      else
        begin
          reg149 <= (wire2[(1'h0):(1'h0)] >= {(~(|(8'ha5)))});
          reg150 <= reg7;
          reg151 <= {wire3};
          if (wire145[(3'h5):(1'h1)])
            begin
              reg152 <= $unsigned((reg149[(1'h0):(1'h0)] >>> $unsigned($unsigned(wire4[(4'h9):(4'h8)]))));
              reg153 <= (!(wire143[(5'h12):(4'h8)] ?
                  wire145[(3'h6):(2'h3)] : ((^(reg151 + reg7)) <<< reg151)));
            end
          else
            begin
              reg152 <= ($signed((~^{(wire3 ?
                      (7'h44) : wire2)})) <= {$signed(((reg148 ?
                          wire145 : reg149) ?
                      $unsigned(reg8) : ((8'ha9) ? reg149 : (8'hbc)))),
                  ({reg150} ?
                      (|(wire143 ?
                          (8'ha2) : (7'h44))) : $signed($signed(wire145)))});
              reg153 <= $unsigned(({(reg149 ?
                      (reg6 > reg8) : (reg8 - wire147))} ^~ $unsigned($unsigned((wire10 ?
                  reg148 : reg5)))));
              reg154 <= $unsigned(($signed(wire10) ?
                  reg5[(4'h8):(2'h3)] : (&wire146)));
            end
        end
      if ($unsigned($signed(((^(wire10 ? (8'ha0) : (8'hba))) ?
          $unsigned((wire1 < reg7)) : (~|{reg152, reg154})))))
        begin
          reg155 <= (8'hb6);
          reg156 <= wire10;
          reg157 <= ((!reg5[(3'h4):(1'h1)]) ?
              (!$signed($signed(wire0[(4'h9):(1'h1)]))) : {reg152[(3'h7):(3'h6)]});
          if (reg6)
            begin
              reg158 <= (8'ha7);
              reg159 <= wire143[(4'hb):(4'h9)];
              reg160 <= reg8;
              reg161 <= {((!$signed(reg158[(4'hd):(4'hd)])) != reg157)};
              reg162 <= {wire0};
            end
          else
            begin
              reg158 <= (8'h9e);
              reg159 <= (reg159[(3'h4):(2'h2)] ?
                  reg161 : (reg160 ?
                      (wire146 <<< reg157[(4'h8):(3'h7)]) : ($unsigned((~|(8'had))) < (^~$signed(wire4)))));
            end
        end
      else
        begin
          if ((reg152[(4'ha):(4'ha)] ?
              $unsigned({wire0[(3'h6):(1'h0)],
                  $unsigned($signed(wire2))}) : ((reg160[(1'h0):(1'h0)] ?
                  wire145 : reg160[(1'h1):(1'h1)]) ~^ reg8[(5'h13):(5'h13)])))
            begin
              reg155 <= {wire4[(4'hf):(2'h2)], reg154};
            end
          else
            begin
              reg155 <= $signed($signed((reg155 ^~ (reg5[(4'hc):(3'h5)] ?
                  reg152 : (wire143 <<< (8'hbf))))));
              reg156 <= {(^wire146)};
            end
        end
      if (wire143)
        begin
          reg163 <= (+(wire145 ? {(8'hb9), reg156[(3'h5):(3'h4)]} : reg8));
          reg164 <= {(~|{((wire10 ? reg150 : wire147) ?
                      $unsigned(reg162) : (|(8'ha6))),
                  ($signed(wire3) ^ (reg160 <= wire3))}),
              {(!{(reg153 * wire145), (reg160 == wire1)}),
                  $signed((~(~reg160)))}};
          if ($signed((~|(+(reg153 & (wire2 ? reg157 : reg159))))))
            begin
              reg165 <= $unsigned($signed(({(wire2 && wire2), (-(8'hbd))} ?
                  {(reg157 <= (8'hbd))} : $unsigned(reg7))));
              reg166 <= $signed(reg6[(5'h11):(1'h1)]);
            end
          else
            begin
              reg165 <= reg166[(3'h6):(1'h0)];
              reg166 <= wire0;
              reg167 <= ((8'hb7) ? wire145[(3'h6):(3'h4)] : reg151);
              reg168 <= (({reg154[(3'h6):(3'h6)]} ?
                      $signed($signed({reg149})) : $signed((reg6 + (reg154 ^~ reg6)))) ?
                  (~(~|reg152)) : (-(({wire2} ?
                          (wire2 <<< reg159) : $unsigned(reg8)) ?
                      $unsigned({wire9}) : $unsigned((8'hba)))));
            end
          reg169 <= $signed($signed($signed(reg160[(1'h0):(1'h0)])));
        end
      else
        begin
          reg163 <= $unsigned(wire4);
          reg164 <= (reg157[(4'hb):(3'h5)] && $unsigned((-$signed(((8'ha8) ~^ wire146)))));
          reg165 <= $unsigned((&$unsigned(reg7[(5'h14):(4'hf)])));
          reg166 <= $unsigned(($unsigned($signed($signed(wire4))) >>> ($signed(reg152[(2'h3):(1'h1)]) ?
              wire145[(3'h6):(2'h2)] : reg162[(4'h9):(2'h2)])));
        end
      if ($unsigned(reg7[(2'h3):(2'h3)]))
        begin
          reg170 <= ($signed((|((8'hb9) >>> reg163[(4'hb):(1'h1)]))) ?
              ((((reg6 ? reg164 : (8'ha3)) ? $unsigned((8'hb4)) : wire0) ?
                  ((reg155 ? (8'h9e) : wire4) ?
                      $signed(reg150) : {reg6}) : (wire146 & (wire0 | reg169))) << $signed({(reg153 >= (8'hbf))})) : (&$signed((reg161[(5'h10):(1'h1)] ?
                  ((7'h42) <<< wire3) : wire2[(1'h0):(1'h0)]))));
          if (reg169)
            begin
              reg171 <= ($signed({(&(wire4 ~^ wire145))}) ?
                  (8'h9d) : (&(wire0[(3'h5):(3'h5)] ?
                      $unsigned({(8'hb9), reg167}) : ((reg162 >>> reg164) ?
                          {wire0} : {reg153}))));
              reg172 <= {(!(~^(reg154 >> $signed(reg169))))};
              reg173 <= $signed($unsigned($signed(reg155[(3'h6):(1'h1)])));
              reg174 <= wire10[(4'ha):(3'h4)];
            end
          else
            begin
              reg171 <= $signed($signed(wire145[(1'h1):(1'h1)]));
              reg172 <= $unsigned({$signed((wire1 || $unsigned(reg158)))});
              reg173 <= ({(8'hb0)} - wire146[(1'h1):(1'h0)]);
              reg174 <= reg168[(4'hb):(3'h4)];
            end
          reg175 <= wire10[(4'ha):(2'h3)];
          reg176 <= reg152;
        end
      else
        begin
          if (reg162[(1'h0):(1'h0)])
            begin
              reg170 <= {$signed(($unsigned({wire145, reg171}) ?
                      wire3 : reg148)),
                  (reg7 == ((reg167[(4'hd):(1'h0)] - $signed((8'h9e))) ?
                      reg8[(5'h11):(4'h8)] : ($signed(wire10) ?
                          reg158 : ((8'hbc) | reg170))))};
            end
          else
            begin
              reg170 <= {reg170[(2'h2):(2'h2)]};
              reg171 <= (($unsigned($unsigned(reg166)) ?
                      (wire0 ?
                          reg176[(4'ha):(3'h4)] : (|(^~reg8))) : (({reg168} ?
                          $signed(reg6) : (reg163 <<< wire143)) ~^ $unsigned($unsigned(reg8)))) ?
                  $signed($unsigned($unsigned((~|reg154)))) : (8'h9c));
              reg172 <= $signed((reg172[(3'h5):(2'h2)] ~^ (~reg165[(4'h9):(3'h5)])));
              reg173 <= $unsigned(((((wire143 ?
                      reg168 : reg172) >= (^(8'hb7))) ?
                  $signed((~reg169)) : (^$signed(reg167))) | $signed($signed((wire146 ^~ reg175)))));
            end
        end
    end
  module177 #() modinst189 (.clk(clk), .wire182(wire3), .wire178(wire147), .wire180(reg161), .wire179(reg151), .wire181(wire0), .y(wire188));
endmodule

module module177
#(parameter param187 = ({(^(((8'haa) ? (7'h43) : (8'hba)) && {(8'ha1)}))} == (((+{(8'ha9)}) ? {{(8'ha3), (8'hbb)}} : (8'hac)) ? ((+((8'ha9) ? (8'h9d) : (8'hb1))) ? (&(&(8'hbb))) : ((|(7'h40)) && ((8'hab) || (8'hb2)))) : (~(-(8'h9d))))))
(y, clk, wire182, wire181, wire180, wire179, wire178);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire182;
  input wire [(5'h10):(1'h0)] wire181;
  input wire signed [(3'h5):(1'h0)] wire180;
  input wire [(2'h2):(1'h0)] wire179;
  input wire [(2'h3):(1'h0)] wire178;
  wire signed [(4'hb):(1'h0)] wire186;
  wire [(4'hc):(1'h0)] wire185;
  wire signed [(4'hf):(1'h0)] wire184;
  wire [(4'ha):(1'h0)] wire183;
  assign y = {wire186, wire185, wire184, wire183, (1'h0)};
  assign wire183 = wire179;
  assign wire184 = wire182[(3'h6):(1'h1)];
  assign wire185 = wire180[(2'h3):(1'h1)];
  assign wire186 = (&(wire183[(3'h7):(3'h6)] ?
                       (wire184 != ((wire183 ? (8'h9c) : wire184) ?
                           wire180[(1'h1):(1'h1)] : (wire180 || wire178))) : (~^wire180)));
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire142;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire140;
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  assign y = {wire142,
                 wire20,
                 wire21,
                 wire58,
                 wire60,
                 wire74,
                 wire89,
                 wire91,
                 wire92,
                 wire93,
                 wire96,
                 wire97,
                 wire98,
                 wire140,
                 reg95,
                 reg94,
                 reg17,
                 reg18,
                 reg19,
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
                 reg73,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= $unsigned($unsigned({(~^$signed(wire15)),
          $unsigned(wire12[(4'h9):(1'h0)])}));
      reg18 <= (($signed(reg17) ?
              ((^((8'hb0) ? wire13 : wire15)) ?
                  $signed((wire15 ?
                      wire15 : wire14)) : (~(^wire16))) : ($signed({reg17,
                      wire16}) ?
                  ($unsigned((8'h9d)) ?
                      $unsigned(wire13) : (~reg17)) : reg17)) ?
          $signed($unsigned((~^$signed(wire13)))) : (^~wire15));
      reg19 <= $signed((^~((((8'ha2) | wire16) ?
          (~^(8'hbb)) : $signed(wire14)) - ((reg18 == wire13) <<< (7'h40)))));
    end
  assign wire20 = wire12;
  assign wire21 = (reg17[(5'h11):(3'h7)] == ((wire20[(4'hc):(3'h5)] + (^~$signed(wire16))) ?
                      $unsigned(wire14) : wire14));
  module22 #() modinst59 (wire58, clk, wire15, wire21, reg18, reg19);
  assign wire60 = $unsigned($signed(wire16));
  always
    @(posedge clk) begin
      reg61 <= $signed((-$unsigned($unsigned($signed(wire16)))));
      if (wire21[(2'h2):(2'h2)])
        begin
          reg62 <= $signed(wire15);
          reg63 <= wire15;
          reg64 <= wire14;
        end
      else
        begin
          if (wire21[(2'h2):(1'h0)])
            begin
              reg62 <= ((|((8'ha3) >>> (8'hb5))) ?
                  wire21 : (-$signed($unsigned((wire60 >>> (8'hb2))))));
              reg63 <= (({$unsigned({(8'ha5), wire14})} ~^ ({((8'hbf) ?
                      reg18 : (7'h44))} & $unsigned((wire60 ?
                  wire16 : reg63)))) - {reg64[(2'h2):(2'h2)],
                  ((((8'ha6) ? wire20 : reg62) ?
                      (wire13 & wire58) : $signed(reg62)) ^ $signed((~^wire21)))});
              reg64 <= (wire21[(1'h0):(1'h0)] << reg61);
            end
          else
            begin
              reg62 <= (&{{reg63, reg19[(4'h8):(3'h4)]},
                  wire60[(4'hb):(1'h0)]});
              reg63 <= wire13[(2'h3):(2'h3)];
              reg64 <= $signed($unsigned((|wire58[(5'h11):(3'h7)])));
              reg65 <= (reg19 ?
                  ((^$unsigned((^~reg63))) ?
                      $unsigned(wire60[(5'h12):(4'hf)]) : wire13) : {$unsigned($signed(((8'hb6) ?
                          wire15 : reg64)))});
            end
          reg66 <= wire15[(5'h11):(4'hb)];
          if (wire60[(4'hb):(1'h1)])
            begin
              reg67 <= reg62;
              reg68 <= $unsigned($unsigned(($unsigned($unsigned(reg63)) ?
                  (|reg63) : reg19)));
              reg69 <= reg65[(5'h10):(2'h3)];
              reg70 <= ({(((^reg69) == reg17) >= ($signed(reg18) ?
                      (wire16 + wire13) : (wire58 ?
                          (8'ha4) : wire58)))} <= reg67);
            end
          else
            begin
              reg67 <= ($unsigned(($unsigned((~^reg68)) ?
                      ((reg18 | wire12) ?
                          wire15 : reg65[(4'he):(2'h3)]) : reg19[(3'h5):(1'h0)])) ?
                  ($unsigned(reg66[(2'h2):(1'h0)]) | (|((&reg69) ?
                      $signed(reg69) : (wire14 | reg62)))) : {((wire14 ^ $unsigned(wire60)) ?
                          {$signed(wire20)} : $unsigned((^~wire20)))});
              reg68 <= (($unsigned((((8'ha1) ? reg19 : wire15) ?
                          $unsigned(reg69) : reg65)) ?
                      $signed($unsigned((reg66 <<< reg19))) : reg61) ?
                  wire15[(5'h11):(4'hc)] : ({(~reg66[(1'h1):(1'h1)]),
                      (&{reg65})} < wire21));
            end
          reg71 <= reg63[(3'h6):(1'h1)];
          reg72 <= (reg19[(1'h0):(1'h0)] ?
              {($signed((reg19 ?
                      reg65 : wire12)) ~^ reg63)} : (^~($signed($signed(reg68)) + wire21[(2'h3):(2'h2)])));
        end
      reg73 <= wire21;
    end
  assign wire74 = reg63;
  module75 #() modinst90 (.wire78(wire13), .wire77(reg66), .y(wire89), .wire76(wire20), .wire79(wire12), .clk(clk), .wire80(wire14));
  assign wire91 = $signed(($signed((reg73[(1'h0):(1'h0)] << $unsigned(wire15))) || wire21));
  assign wire92 = (wire74[(3'h5):(3'h5)] ~^ (^reg70));
  assign wire93 = ($signed({{reg62[(2'h2):(1'h0)],
                          (+reg72)}}) | reg70[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg94 <= $unsigned((reg69[(3'h5):(1'h1)] ?
          $unsigned($signed(reg72)) : {wire60[(4'hd):(3'h6)], wire91}));
      reg95 <= reg17[(5'h14):(5'h10)];
    end
  assign wire96 = reg66;
  assign wire97 = ({($unsigned($signed(reg63)) ?
                              ($unsigned(reg68) ?
                                  ((8'ha8) ?
                                      wire15 : reg73) : (~^reg94)) : reg66[(1'h1):(1'h0)]),
                          $signed({(8'hbf), $unsigned(reg72)})} ?
                      $signed((reg67 >= ((reg94 ^ wire15) ?
                          (^(8'hb7)) : wire89[(4'hb):(4'ha)]))) : (((wire93 ?
                          wire14 : {wire58, wire74}) ^ reg71) && reg61));
  assign wire98 = $signed(reg17);
  module99 #() modinst141 (.wire103(reg70), .wire102(wire98), .wire101(wire93), .y(wire140), .wire104(wire96), .wire100(reg67), .clk(clk));
  assign wire142 = {$unsigned(wire98), (^~wire92[(3'h5):(3'h4)])};
endmodule

module module99
#(parameter param138 = (~&{(({(8'ha1), (8'had)} >> ((7'h43) >= (8'hbd))) ? (~|((8'h9e) ? (8'hb7) : (8'hb9))) : (8'haf)), (({(8'ha1)} >> ((8'hb6) - (8'ha5))) >> (^~((8'hba) ? (8'h9d) : (8'h9f))))}), 
parameter param139 = (~|param138))
(y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire104;
  input wire [(5'h11):(1'h0)] wire103;
  input wire [(5'h14):(1'h0)] wire102;
  input wire [(3'h5):(1'h0)] wire101;
  input wire [(4'hb):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire137;
  wire [(3'h4):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire [(4'hc):(1'h0)] wire132;
  wire [(3'h7):(1'h0)] wire131;
  wire [(3'h7):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire128;
  wire signed [(2'h3):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire signed [(3'h4):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg124 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire105 = (8'hb3);
  assign wire106 = (($unsigned($unsigned($signed(wire104))) * wire104) << $signed((((^wire100) ?
                       (-(7'h41)) : $unsigned(wire104)) ^~ $unsigned((+wire104)))));
  assign wire107 = $signed((~^(wire104 ?
                       (wire105 || wire106) : wire105[(2'h2):(2'h2)])));
  assign wire108 = {($signed(((wire103 ? wire105 : wire105) ?
                               wire107 : wire101[(1'h0):(1'h0)])) ?
                           $unsigned({$signed(wire106),
                               (&wire107)}) : (wire100 & $signed((^wire104)))),
                       $signed($unsigned({wire104[(3'h7):(1'h1)],
                           (^~wire104)}))};
  assign wire109 = {(8'ha3)};
  assign wire110 = wire105;
  assign wire111 = {$unsigned(wire105),
                       ((+(wire101[(2'h2):(2'h2)] << (wire108 ?
                           wire104 : wire103))) * {wire103})};
  assign wire112 = $signed({(wire105[(1'h0):(1'h0)] ?
                           ($signed(wire100) || (wire103 >>> wire107)) : $unsigned(wire107)),
                       {((&wire100) ?
                               wire104[(1'h1):(1'h1)] : ((8'ha6) << wire111)),
                           $signed(wire106)}});
  assign wire113 = ((^~(&(((8'hbe) ?
                       wire105 : wire107) * (wire100 - wire105)))) >= ($signed((^(^~wire104))) ?
                       wire105[(2'h2):(2'h2)] : ($signed(((8'hba) >> wire107)) ?
                           wire102 : wire105)));
  assign wire114 = {((((wire104 << wire111) ?
                               $signed(wire103) : $unsigned(wire110)) ?
                           wire111 : wire105[(3'h7):(1'h1)]) <= (+$signed(wire101)))};
  assign wire115 = wire105;
  assign wire116 = wire114;
  always
    @(posedge clk) begin
      reg117 <= wire114;
      reg118 <= ($signed(wire107[(1'h0):(1'h0)]) > $unsigned((|wire113[(1'h0):(1'h0)])));
      reg119 <= (wire116 <<< wire109[(3'h4):(1'h1)]);
      if (wire116)
        begin
          if (((-wire102[(4'h8):(3'h7)]) | wire105))
            begin
              reg120 <= wire104;
              reg121 <= $signed({(!(wire106 ?
                      {wire102, wire101} : $unsigned(reg117))),
                  $unsigned(wire105)});
            end
          else
            begin
              reg120 <= (($unsigned($signed(reg121)) ^~ wire108) >>> (|$signed(($unsigned(reg120) ?
                  (wire101 >> (8'ha3)) : (wire103 >>> wire112)))));
              reg121 <= {$signed((|wire114[(4'h8):(3'h7)])),
                  (-wire110[(1'h0):(1'h0)])};
              reg122 <= ((~&({wire106[(3'h5):(3'h5)]} ~^ (~^(wire111 * wire116)))) ?
                  wire104[(2'h3):(1'h1)] : (8'ha8));
              reg123 <= $unsigned(wire107[(2'h3):(2'h2)]);
              reg124 <= (+((wire107[(2'h2):(1'h1)] ^~ (((8'hb1) != reg118) ?
                      ((8'ha7) ? reg118 : wire106) : wire108[(5'h13):(3'h5)])) ?
                  {wire105[(2'h2):(1'h1)]} : $signed(((wire112 + wire106) ?
                      (reg117 ? wire100 : (8'had)) : $signed(reg120)))));
            end
          reg125 <= ({reg124[(2'h2):(1'h1)], reg124[(2'h2):(2'h2)]} ?
              $signed((($unsigned(wire103) & wire112) ?
                  wire102[(5'h13):(4'he)] : $signed($signed((8'haf))))) : $signed((8'hb2)));
          reg126 <= (($unsigned((wire115 ?
                  $unsigned(reg119) : (reg117 < wire104))) ~^ reg122) ?
              wire105 : (^~$unsigned(wire102)));
          reg127 <= ($signed((($unsigned(wire112) ?
                  (reg123 ? (8'hb1) : wire100) : wire112) ?
              wire112 : $signed((wire111 ?
                  wire107 : wire116)))) == {{$signed(reg123[(2'h3):(1'h1)])}});
        end
      else
        begin
          if (wire106)
            begin
              reg120 <= reg123;
              reg121 <= (^((~|wire114[(3'h6):(3'h5)]) && {{$signed((8'ha0)),
                      wire109[(4'ha):(1'h1)]},
                  (~^wire103[(4'he):(3'h6)])}));
              reg122 <= (+((8'ha3) * reg119));
              reg123 <= $unsigned((|wire113));
            end
          else
            begin
              reg120 <= (wire102 ~^ (+(((reg123 ? wire114 : (8'ha0)) ?
                      {reg118, reg121} : (wire109 ? reg126 : reg119)) ?
                  wire100 : ((reg127 ^ wire104) ?
                      $unsigned(wire109) : ((8'hb6) ? reg126 : wire110)))));
            end
          reg124 <= (+($signed(((wire113 ? reg117 : reg122) ?
              ((8'hb8) ?
                  (8'ha8) : wire104) : reg120[(4'hf):(4'hd)])) < $unsigned(reg127)));
        end
    end
  assign wire128 = ($unsigned(((~$signed(wire116)) ?
                           reg120 : (|$signed(wire106)))) ?
                       (~&wire100) : wire111[(3'h6):(3'h4)]);
  assign wire129 = reg123[(3'h5):(1'h0)];
  assign wire130 = reg121;
  assign wire131 = wire100;
  assign wire132 = (|reg122);
  assign wire133 = (-(&$signed($unsigned((reg121 >>> wire112)))));
  assign wire134 = $signed((!{wire109}));
  assign wire135 = wire105;
  assign wire136 = $unsigned(wire114);
  assign wire137 = wire134;
endmodule

module module75
#(parameter param88 = (-((((~^(8'hb5)) - (-(7'h41))) + {{(8'hbb)}}) ^ (8'ha9))))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire80;
  input wire [(5'h10):(1'h0)] wire79;
  input wire signed [(4'h8):(1'h0)] wire78;
  input wire signed [(3'h4):(1'h0)] wire77;
  input wire signed [(3'h4):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire81;
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  assign y = {wire86, wire85, wire84, wire81, reg87, reg83, reg82, (1'h0)};
  assign wire81 = $signed((&({(-wire76), $unsigned((7'h40))} ?
                      $unsigned((^wire78)) : (~&$signed(wire79)))));
  always
    @(posedge clk) begin
      reg82 <= ($signed(wire77[(1'h1):(1'h0)]) ?
          (wire79 ?
              ({wire80[(4'h8):(3'h7)],
                  {wire77}} < (7'h42)) : ((^wire81[(4'hb):(3'h7)]) ?
                  $unsigned((wire77 <<< wire77)) : $signed((wire81 ?
                      wire79 : (8'ha3))))) : ($unsigned($unsigned((wire77 ?
              wire78 : (7'h43)))) ^~ wire77));
      reg83 <= ((^(-wire81[(2'h2):(1'h1)])) > ((wire79[(4'ha):(3'h6)] ?
          wire81[(3'h7):(2'h3)] : wire77) ~^ $unsigned(wire79[(3'h7):(1'h1)])));
    end
  assign wire84 = $unsigned($signed(reg83[(2'h2):(2'h2)]));
  assign wire85 = (reg83[(4'he):(4'h9)] <<< wire81);
  assign wire86 = (wire84 ? wire78 : reg83);
  always
    @(posedge clk) begin
      reg87 <= reg83;
    end
endmodule

module module22
#(parameter param56 = ((({(7'h41), (~&(8'hb1))} ~^ {(!(8'hb0))}) & ((^~((8'h9c) ? (8'h9e) : (8'ha4))) ? (((8'hb8) & (8'ha9)) ? (~|(8'hb3)) : (|(7'h41))) : (((8'h9f) ? (8'hb7) : (7'h42)) + (|(8'h9e))))) ? {(^~(~((8'h9e) ? (8'ha8) : (8'ha0))))} : (^(((7'h41) == (!(8'haf))) ? ((~^(8'hb9)) ? (~|(8'hb0)) : ((8'ha4) ? (7'h43) : (8'hae))) : (8'hb3)))), 
parameter param57 = param56)
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire25;
  input wire signed [(4'h9):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire27,
                 reg55,
                 reg54,
                 reg53,
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
                 reg38,
                 reg37,
                 reg36,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire27 = wire26[(4'hb):(2'h2)];
  assign wire28 = {($unsigned($signed($unsigned(wire24))) ?
                          ($unsigned(wire24) ?
                              wire27[(3'h6):(3'h6)] : (-{wire23})) : $unsigned(((+wire25) != $unsigned(wire24))))};
  assign wire29 = ((-wire24[(2'h3):(1'h1)]) >>> ((~&$signed((wire25 ?
                          wire23 : wire26))) ?
                      wire23[(1'h0):(1'h0)] : $unsigned((wire24[(3'h6):(3'h6)] ?
                          {wire25, wire28} : $signed(wire23)))));
  always
    @(posedge clk) begin
      reg30 <= {$unsigned(wire25[(3'h6):(2'h2)]),
          $unsigned((^~((wire23 ? wire26 : wire23) ?
              (~|wire27) : ((8'hac) - wire29))))};
      reg31 <= $signed({(-$signed((wire27 < wire26)))});
    end
  assign wire32 = (~^wire25);
  assign wire33 = wire26[(2'h2):(2'h2)];
  assign wire34 = {reg31[(3'h5):(1'h0)]};
  assign wire35 = $unsigned($signed(reg31[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      if (wire26)
        begin
          reg36 <= $signed({reg31[(3'h4):(1'h0)]});
          reg37 <= {(($unsigned($signed(wire27)) ? (~reg30) : $signed(wire24)) ?
                  reg30[(4'hf):(2'h3)] : wire33[(4'hd):(4'ha)])};
          reg38 <= (wire24[(1'h1):(1'h0)] ?
              ({wire26[(4'h9):(3'h6)],
                  wire23[(2'h2):(2'h2)]} - $signed((~|((7'h43) != wire27)))) : ((7'h41) ?
                  ($signed((8'hb8)) ?
                      wire24 : ({wire26, wire24} ?
                          (reg37 ?
                              reg31 : wire35) : $unsigned(wire28))) : {(+$signed(wire25)),
                      $signed(reg36)}));
          reg39 <= $signed($unsigned($signed(wire33)));
          if (wire26)
            begin
              reg40 <= wire33;
              reg41 <= wire34[(1'h0):(1'h0)];
              reg42 <= {wire24};
              reg43 <= (reg31[(3'h5):(1'h1)] && wire35);
            end
          else
            begin
              reg40 <= ((~^{$unsigned($unsigned(wire32)),
                      $unsigned((wire26 ? reg40 : reg37))}) ?
                  $signed((-$unsigned(wire32[(2'h2):(2'h2)]))) : ((8'ha1) && $signed($unsigned($unsigned(reg42)))));
              reg41 <= (&$unsigned((&((wire24 ? reg36 : reg41) ^~ ((7'h41) ?
                  reg42 : wire27)))));
              reg42 <= wire26[(3'h7):(3'h6)];
              reg43 <= reg40;
              reg44 <= (~|$signed($signed((^(reg31 != wire27)))));
            end
        end
      else
        begin
          reg36 <= wire23[(2'h2):(1'h1)];
          reg37 <= reg39[(4'ha):(1'h0)];
          if ((reg31 ?
              (reg43[(4'hd):(3'h4)] <= (wire32[(2'h2):(2'h2)] <<< wire29)) : wire28))
            begin
              reg38 <= (wire25[(1'h1):(1'h1)] ?
                  wire27[(4'hc):(3'h4)] : wire35[(4'hb):(4'hb)]);
              reg39 <= reg31[(3'h5):(1'h0)];
              reg40 <= {($signed({$unsigned(wire27), wire35}) ?
                      $unsigned(reg43) : $signed(((7'h41) ~^ $signed(reg30))))};
              reg41 <= (8'hb8);
              reg42 <= $unsigned((wire29[(3'h4):(1'h0)] ^ $unsigned(reg31)));
            end
          else
            begin
              reg38 <= ($signed(((reg36[(2'h2):(2'h2)] ?
                      (wire35 ? wire27 : reg43) : (^(8'ha5))) ?
                  (~&reg42[(1'h0):(1'h0)]) : {(^~reg38),
                      $signed(reg42)})) ^ $signed((({reg37, (8'ha8)} ?
                      reg39[(1'h1):(1'h0)] : (^~reg44)) ?
                  ((^~wire33) ~^ {wire35, (8'ha1)}) : reg37[(3'h4):(2'h2)])));
              reg39 <= reg40[(2'h3):(2'h3)];
              reg40 <= $signed(($unsigned(((!wire24) + (wire25 >>> wire23))) ?
                  reg38[(4'hb):(4'h8)] : reg41));
              reg41 <= (wire34[(4'hf):(4'he)] * $unsigned($unsigned(((|wire26) == $signed(reg40)))));
            end
          reg43 <= {{$unsigned($signed((^reg39)))},
              $unsigned((+((wire33 ? reg42 : reg42) >> reg39)))};
        end
      reg45 <= reg40;
      if ({($unsigned($signed((wire34 ?
              wire23 : wire32))) < (^~$signed(wire34[(3'h4):(1'h1)])))})
        begin
          reg46 <= reg30;
          if (reg44)
            begin
              reg47 <= ($signed((~|$unsigned((reg42 ? reg45 : (7'h41))))) ?
                  wire23[(2'h2):(1'h1)] : {(~|$unsigned(reg44))});
            end
          else
            begin
              reg47 <= {(&$unsigned($unsigned(wire25[(1'h1):(1'h1)]))),
                  ((~|(&$signed(reg31))) ? (8'h9c) : wire35)};
              reg48 <= wire25[(3'h4):(1'h1)];
              reg49 <= ($unsigned(reg43[(4'hf):(3'h7)]) ^~ ($signed((8'hbc)) ?
                  wire23 : (~$unsigned((reg43 && (8'ha3))))));
            end
        end
      else
        begin
          reg46 <= (8'ha3);
          if ((((~&{wire25,
              (&wire27)}) + reg42) << (&$signed($unsigned(wire34[(4'h8):(4'h8)])))))
            begin
              reg47 <= $signed((8'ha1));
              reg48 <= (((~&$unsigned($unsigned(reg44))) <= ($unsigned(reg38[(4'he):(4'h8)]) ?
                      $signed($unsigned(reg39)) : $unsigned((|wire24)))) ?
                  ((($signed((8'h9e)) ^~ $signed(reg39)) ?
                      $signed($signed(wire34)) : ((reg43 ? (8'hb1) : wire28) ?
                          reg40 : $unsigned(reg39))) + (reg43 ?
                      $unsigned((wire34 ?
                          reg43 : (7'h43))) : (~^$signed(reg36)))) : wire23);
              reg49 <= ($unsigned(reg45) && ({($unsigned(reg40) ?
                      wire33[(4'hc):(3'h4)] : $signed((8'h9e)))} * $unsigned((~^(~^wire27)))));
              reg50 <= reg41;
            end
          else
            begin
              reg47 <= wire29[(3'h4):(2'h2)];
              reg48 <= (reg39[(3'h5):(2'h2)] * $unsigned($unsigned(reg42[(3'h7):(3'h7)])));
              reg49 <= (^(wire33 ?
                  ($signed(reg30) * (reg48[(2'h3):(1'h1)] * $unsigned(wire34))) : $unsigned($unsigned($unsigned(wire27)))));
              reg50 <= (^~(-{(reg45[(4'h9):(4'h8)] >= $unsigned(reg45)),
                  (+reg49)}));
              reg51 <= wire25[(3'h6):(2'h2)];
            end
          reg52 <= (~&((~wire28) && reg40[(3'h7):(3'h6)]));
          if ($signed(wire29[(3'h4):(2'h2)]))
            begin
              reg53 <= ({($unsigned(reg39) >= ($unsigned(reg31) || (8'h9e))),
                  reg39[(3'h7):(2'h2)]} < ({($signed(reg31) != {wire34})} ?
                  ($signed(reg36[(3'h4):(2'h2)]) ?
                      reg38 : reg45[(3'h5):(3'h4)]) : $unsigned({(-reg30),
                      $unsigned((8'ha3))})));
              reg54 <= ({(^~$unsigned($signed(reg38))),
                      (reg41 > (~&(!reg39)))} ?
                  $unsigned(wire26) : (reg51 ?
                      (+(reg43[(5'h10):(4'he)] ?
                          {reg44, wire25} : $unsigned((8'ha5)))) : (7'h40)));
            end
          else
            begin
              reg53 <= $unsigned($signed({wire33,
                  (reg31 ? reg40 : $unsigned(reg30))}));
              reg54 <= $signed($signed(((((8'h9c) >= reg53) < reg41) != ((wire32 ?
                      reg44 : reg41) ?
                  (reg43 ? wire23 : wire33) : wire28[(1'h0):(1'h0)]))));
            end
        end
      reg55 <= (reg49[(4'hf):(3'h4)] && $signed($signed(wire27[(2'h2):(1'h0)])));
    end
endmodule
