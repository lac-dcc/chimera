module top
#(parameter param197 = ({(^~((~(8'hb3)) != ((8'hb4) ? (8'hb0) : (8'haf)))), (|(|((8'hbb) ? (8'hb2) : (8'h9c))))} ? (&{(~&((8'haa) >>> (8'hbe))), (~(~(7'h41)))}) : {({{(8'ha9)}} >> ({(8'hb1)} ? ((8'ha9) >= (8'ha9)) : {(8'hbd), (7'h44)}))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire196;
  wire signed [(4'hf):(1'h0)] wire194;
  wire signed [(5'h11):(1'h0)] wire189;
  wire signed [(2'h2):(1'h0)] wire182;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire184;
  wire [(5'h13):(1'h0)] wire185;
  wire signed [(5'h12):(1'h0)] wire187;
  reg signed [(4'h8):(1'h0)] reg193 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg191 = (1'h0);
  reg signed [(4'he):(1'h0)] reg190 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire196,
                 wire194,
                 wire189,
                 wire182,
                 wire5,
                 wire64,
                 wire184,
                 wire185,
                 wire187,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (({wire3[(1'h0):(1'h0)],
                     (wire3 ?
                         {wire3,
                             wire2} : (~^wire4))} == (8'hbc)) < $unsigned(wire3[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg6 <= ((~^$signed($signed(((8'hab) ? wire4 : wire5)))) ?
          wire0 : ((~(~&(wire1 ? wire0 : wire5))) ^ ((wire4 <= {wire4, wire3}) ?
              ((~^wire3) <= $signed(wire3)) : wire3)));
      reg7 <= ((wire1[(4'h9):(1'h1)] >>> wire4) ?
          $signed({$unsigned($signed((8'h9d)))}) : reg6);
      reg8 <= $signed((&$unsigned($signed(((8'hb9) ~^ wire4)))));
      reg9 <= wire1;
    end
  module10 #() modinst65 (wire64, clk, wire0, wire1, wire2, reg8);
  module66 #() modinst183 (.clk(clk), .wire70(wire0), .wire67(wire5), .wire69(reg8), .y(wire182), .wire68(wire2));
  assign wire184 = wire182;
  module24 #() modinst186 (wire185, clk, wire184, wire3, reg9, reg8);
  module77 #() modinst188 (.wire79(reg6), .wire80(wire64), .wire78(wire185), .wire81(reg9), .wire82(wire4), .clk(clk), .y(wire187));
  assign wire189 = (wire182 << reg8);
  always
    @(posedge clk) begin
      reg190 <= wire0[(4'h9):(4'h9)];
      reg191 <= $signed((!(~$signed((reg190 > wire189)))));
      reg192 <= $signed($unsigned((~^(reg8 - $signed(reg9)))));
      reg193 <= ($unsigned(wire189) != {wire2});
    end
  module10 #() modinst195 (wire194, clk, reg190, reg9, reg191, reg193);
  assign wire196 = wire64;
endmodule

module module66
#(parameter param181 = (((^~((8'ha5) >> ((8'hb5) ? (8'hb5) : (8'hbb)))) ~^ ((8'had) ^~ (((8'hb7) > (8'ha0)) ? ((8'hb7) << (8'hac)) : {(8'hb0), (8'hba)}))) ? (^(!((~|(8'haa)) && {(7'h40)}))) : ((+(((8'hab) ? (8'hb5) : (8'hb2)) ? ((8'ha6) ^ (8'hb4)) : ((8'hba) ? (8'hbf) : (8'hb5)))) ? ((^~((8'ha6) ? (8'ha7) : (8'ha4))) * (-((8'ha2) ? (8'hbe) : (8'hb0)))) : (~(-((7'h40) ? (8'hb2) : (8'h9d)))))))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire70;
  input wire signed [(5'h14):(1'h0)] wire69;
  input wire signed [(2'h3):(1'h0)] wire68;
  input wire [(4'hf):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire179;
  assign y = {wire144,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire179,
                 (1'h0)};
  assign wire71 = ($unsigned((((wire68 || wire69) + {wire67,
                      wire68}) < wire68[(1'h1):(1'h1)])) > (~^wire70[(5'h12):(4'hc)]));
  assign wire72 = wire70;
  assign wire73 = wire67;
  assign wire74 = {(((+(wire68 ? wire67 : wire70)) + {wire72, wire71}) ?
                          $unsigned((8'ha9)) : ($unsigned((wire73 ?
                              wire69 : wire69)) | wire73)),
                      wire70[(4'h9):(3'h6)]};
  assign wire75 = $unsigned(wire73);
  assign wire76 = ((&wire67[(4'h8):(4'h8)]) ?
                      {((-(wire73 >>> wire69)) >>> wire73[(1'h0):(1'h0)])} : wire75[(3'h7):(3'h4)]);
  module77 #() modinst145 (wire144, clk, wire71, wire73, wire75, wire67, wire72);
  module146 #() modinst180 (.y(wire179), .wire149(wire75), .clk(clk), .wire151(wire73), .wire150(wire70), .wire148(wire144), .wire147(wire69));
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  input wire [(3'h4):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire15;
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire48,
                 wire36,
                 wire34,
                 wire23,
                 wire22,
                 wire15,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire15 = $unsigned({wire11[(2'h3):(2'h3)],
                      $signed($signed($unsigned(wire14)))});
  always
    @(posedge clk) begin
      if (wire11[(2'h2):(1'h0)])
        begin
          if ((wire15[(4'ha):(2'h2)] ?
              (^($unsigned((wire15 ?
                  wire13 : wire13)) >>> $signed(wire13[(2'h2):(1'h0)]))) : $signed((8'ha9))))
            begin
              reg16 <= (^((wire11[(1'h0):(1'h0)] >= (^~(~&(8'hbe)))) << (!((wire11 ?
                      wire14 : (8'ha0)) ?
                  (~^wire14) : {(8'hb0), wire14}))));
              reg17 <= ({wire15[(3'h4):(1'h0)],
                  ((^~$unsigned(wire11)) ?
                      ((wire12 ? (8'hb3) : wire12) ?
                          (wire14 ?
                              wire13 : reg16) : (8'ha6)) : (~^wire13[(1'h0):(1'h0)]))} && {wire15[(4'hd):(2'h2)],
                  (-(wire11 & (wire13 ? (8'ha7) : (7'h44))))});
            end
          else
            begin
              reg16 <= $unsigned(($unsigned(wire13) ?
                  ((8'hab) <= wire13) : $signed(wire13[(4'ha):(3'h4)])));
              reg17 <= $signed(({$signed((!wire14)),
                  $signed(reg17[(2'h2):(1'h1)])} < $signed((wire12[(2'h2):(1'h0)] || reg17))));
              reg18 <= (reg17[(2'h3):(2'h3)] ?
                  (((wire15[(4'hf):(4'he)] ?
                      (|wire11) : wire12) <= ($unsigned(reg17) ?
                      (reg17 | reg16) : reg16)) & wire12) : wire11);
            end
          reg19 <= $signed({(wire15 <<< (wire14 ?
                  $signed(wire13) : $signed(wire15))),
              ($unsigned($unsigned(wire14)) ?
                  $unsigned((&wire12)) : (!(reg16 == wire13)))});
        end
      else
        begin
          reg16 <= reg18;
        end
      if (wire12[(4'hb):(1'h0)])
        begin
          reg20 <= wire12;
          reg21 <= $signed(((|((wire14 <<< (8'hb1)) ?
              reg17 : reg18)) * $unsigned({reg17, wire15[(1'h1):(1'h0)]})));
        end
      else
        begin
          reg20 <= $signed(($signed(($signed(reg16) == (wire13 ?
              reg16 : reg19))) != $signed({$signed((8'hab))})));
          reg21 <= {reg21};
        end
    end
  assign wire22 = ({(wire13 > (!reg17[(3'h7):(2'h3)]))} ?
                      ((!$unsigned((~wire12))) | (wire15[(2'h3):(1'h0)] ^~ $unsigned(wire11[(3'h4):(3'h4)]))) : ((+reg18) || reg21));
  assign wire23 = (~reg21);
  module24 #() modinst35 (.clk(clk), .wire28(wire22), .wire26(reg21), .y(wire34), .wire27(wire14), .wire25(reg19));
  assign wire36 = (+{(reg21 ? {(reg18 - wire13)} : reg19),
                      reg19[(1'h1):(1'h1)]});
  module37 #() modinst49 (wire48, clk, wire36, wire23, reg18, reg20, reg16);
  always
    @(posedge clk) begin
      reg50 <= reg18;
      reg51 <= ($signed((($unsigned(wire15) ?
              reg19[(1'h1):(1'h1)] : (reg19 ? reg18 : reg50)) ?
          (!$unsigned(wire13)) : ($unsigned(wire23) || $signed(wire23)))) <= (7'h43));
      reg52 <= (($unsigned($signed((&wire22))) ^~ wire36) || $unsigned((|(wire36 >= $signed(reg17)))));
      reg53 <= $unsigned(wire23[(1'h1):(1'h1)]);
    end
  assign wire54 = ({{reg51, wire11}, wire22[(4'hc):(3'h6)]} ?
                      $signed($unsigned({$signed(wire11), reg18})) : reg53);
  assign wire55 = ($signed(reg20) && $signed(((-reg53) ?
                      wire34 : (reg16[(3'h5):(2'h2)] ?
                          (^reg18) : (reg52 ? (7'h42) : reg16)))));
  always
    @(posedge clk) begin
      if ((-(wire14[(4'ha):(4'ha)] ?
          ($signed($unsigned((8'hbe))) << $unsigned((!wire12))) : wire14)))
        begin
          reg56 <= (reg52 - (&(&({wire15} ?
              (^reg51) : wire34[(4'h8):(3'h7)]))));
          if (($unsigned((-(reg50 ?
              $unsigned(wire12) : $signed((8'ha0))))) <<< $signed(($unsigned(reg18) ?
              $signed({wire36, reg18}) : $signed(reg18[(4'hc):(3'h7)])))))
            begin
              reg57 <= ($unsigned((^~(|(!reg52)))) ?
                  wire12[(3'h7):(3'h5)] : $signed((~&{wire36[(4'h9):(4'h8)]})));
              reg58 <= (!{(wire11 <= (-$unsigned(wire14))),
                  wire14[(4'h9):(3'h5)]});
              reg59 <= reg57;
            end
          else
            begin
              reg57 <= $signed((wire54 >= reg52[(2'h2):(1'h1)]));
              reg58 <= reg20;
              reg59 <= ({$signed(wire14)} ^ $unsigned((wire23 | (~|(reg18 ?
                  reg17 : (8'hb2))))));
            end
          reg60 <= wire55[(3'h7):(3'h6)];
          reg61 <= reg60;
          reg62 <= (^((~^((!reg58) ^~ (reg59 >>> reg57))) ?
              (^{(^(8'hb2)), reg59}) : (((reg58 ? wire34 : reg20) ?
                      reg21 : reg19[(3'h7):(2'h3)]) ?
                  reg17 : reg19)));
        end
      else
        begin
          if ((|$unsigned($signed(($unsigned((8'haa)) || wire55)))))
            begin
              reg56 <= $signed(({{{wire23, reg60}, reg60[(3'h5):(1'h0)]}} ?
                  reg18[(3'h5):(2'h2)] : {{reg59, (reg18 ^~ reg59)}}));
              reg57 <= reg58;
            end
          else
            begin
              reg56 <= reg56[(2'h3):(2'h2)];
              reg57 <= (|(wire36[(5'h10):(4'h9)] ?
                  (($unsigned(reg57) >> (reg58 ?
                      wire34 : reg21)) >>> reg20[(3'h5):(1'h1)]) : {($signed(wire15) ?
                          $signed(wire15) : $signed((8'h9f))),
                      (~$unsigned(wire54))}));
            end
          reg58 <= {reg18};
        end
      reg63 <= reg50;
    end
endmodule

module module37
#(parameter param47 = {((({(8'ha1)} * ((8'ha4) ? (8'ha4) : (8'hbb))) > (~^(^~(8'h9e)))) <= (({(8'hb5), (8'h9d)} > ((8'haa) & (8'hbd))) ? (-(-(7'h44))) : ((~|(8'hb9)) ? ((8'hab) * (8'ha8)) : ((8'hbe) ? (8'hb2) : (8'ha4)))))})
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire42;
  input wire signed [(4'h8):(1'h0)] wire41;
  input wire signed [(2'h3):(1'h0)] wire40;
  input wire signed [(3'h7):(1'h0)] wire39;
  input wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  assign y = {wire45, wire44, wire43, reg46, (1'h0)};
  assign wire43 = $signed(($unsigned($unsigned(wire42)) << $unsigned({(~^wire38)})));
  assign wire44 = {$signed(($unsigned(wire40[(1'h0):(1'h0)]) == (+(8'hb0))))};
  assign wire45 = $unsigned(({wire42[(3'h7):(2'h2)]} ?
                      ($signed($unsigned((8'hbe))) ?
                          (8'ha7) : $signed($signed((8'hb5)))) : (((wire38 < wire39) >= wire40) && ((-wire38) <= $signed(wire42)))));
  always
    @(posedge clk) begin
      reg46 <= wire45[(4'hd):(1'h0)];
    end
endmodule

module module24
#(parameter param33 = {((({(8'hbc), (8'hb8)} || {(8'ha2), (7'h43)}) ? {((8'hb8) && (8'hb1)), ((8'hb3) <= (8'hbf))} : ({(8'hbb)} - (^(8'hab)))) & (|({(8'hbb), (8'hb8)} + ((8'hb1) >= (7'h41))))), {((8'ha2) >> (((8'h9f) > (8'had)) ? (~(8'hbe)) : (^(8'hb4))))}})
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire28;
  input wire signed [(3'h6):(1'h0)] wire27;
  input wire signed [(4'hc):(1'h0)] wire26;
  input wire [(4'h8):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  assign y = {wire32, wire31, wire30, wire29, (1'h0)};
  assign wire29 = wire26[(1'h1):(1'h0)];
  assign wire30 = {(wire28[(1'h0):(1'h0)] ?
                          $signed($unsigned(wire27)) : wire26[(3'h4):(1'h1)]),
                      wire25};
  assign wire31 = (~&$signed((!{(~^wire25)})));
  assign wire32 = (wire28 | wire28);
endmodule

module module146  (y, clk, wire151, wire150, wire149, wire148, wire147);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire151;
  input wire [(2'h3):(1'h0)] wire150;
  input wire [(3'h6):(1'h0)] wire149;
  input wire [(5'h11):(1'h0)] wire148;
  input wire signed [(4'h9):(1'h0)] wire147;
  wire signed [(5'h12):(1'h0)] wire178;
  wire signed [(5'h11):(1'h0)] wire177;
  wire [(3'h7):(1'h0)] wire171;
  wire signed [(3'h6):(1'h0)] wire170;
  wire [(5'h12):(1'h0)] wire164;
  wire signed [(4'he):(1'h0)] wire163;
  wire signed [(5'h10):(1'h0)] wire162;
  wire [(4'ha):(1'h0)] wire161;
  wire signed [(3'h5):(1'h0)] wire160;
  wire signed [(5'h11):(1'h0)] wire159;
  wire signed [(3'h6):(1'h0)] wire158;
  wire signed [(5'h14):(1'h0)] wire157;
  wire signed [(4'hf):(1'h0)] wire156;
  wire [(5'h15):(1'h0)] wire155;
  wire [(4'hd):(1'h0)] wire154;
  wire signed [(3'h7):(1'h0)] wire153;
  wire [(5'h14):(1'h0)] wire152;
  reg signed [(4'he):(1'h0)] reg176 = (1'h0);
  reg [(5'h11):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg173 = (1'h0);
  reg [(3'h4):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg [(2'h2):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire171,
                 wire170,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire152 = wire148[(2'h3):(2'h3)];
  assign wire153 = (-$signed((~^wire151[(3'h7):(1'h1)])));
  assign wire154 = (!$signed({wire148}));
  assign wire155 = $signed((((wire152 ? $signed(wire154) : wire154) ?
                           $unsigned(wire151) : wire151) ?
                       wire148 : $signed($unsigned(wire153))));
  assign wire156 = (~($unsigned(wire149[(3'h5):(1'h0)]) >= $signed(((wire154 ?
                           wire153 : wire153) ?
                       (wire149 ?
                           wire151 : wire154) : wire151[(4'h9):(3'h5)]))));
  assign wire157 = (!{wire156[(4'hc):(1'h0)]});
  assign wire158 = (wire148[(4'hd):(1'h0)] ? wire151 : $signed(wire155));
  assign wire159 = (~&(wire152 ?
                       wire154 : (~^($signed(wire156) ?
                           (|wire150) : wire155[(5'h14):(4'h8)]))));
  assign wire160 = ((wire147[(4'h8):(4'h8)] & $unsigned((((7'h44) ?
                       wire154 : wire148) <<< wire159))) | (($signed({wire157,
                               wire149}) ?
                           wire147 : (&(wire159 ? wire156 : wire159))) ?
                       wire157 : $signed($unsigned((wire152 ?
                           wire149 : wire147)))));
  assign wire161 = (~$signed({wire149[(3'h6):(2'h2)]}));
  assign wire162 = wire148[(3'h5):(3'h4)];
  assign wire163 = $signed(($signed(wire161) != wire149));
  assign wire164 = wire159[(4'hd):(4'hb)];
  always
    @(posedge clk) begin
      reg165 <= $signed(wire164[(2'h2):(1'h0)]);
      reg166 <= wire155[(4'hf):(4'hc)];
      reg167 <= $unsigned($signed({(~{wire149}),
          (wire152 | wire161[(1'h1):(1'h1)])}));
      reg168 <= $signed((wire155 & $signed($signed($signed(wire164)))));
      reg169 <= wire152[(3'h6):(3'h4)];
    end
  assign wire170 = ($unsigned($unsigned(((reg167 ?
                       reg166 : (8'ha6)) == (wire152 ~^ wire162)))) >= wire161);
  assign wire171 = $signed((~^$unsigned(wire157[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      if (({wire159[(3'h4):(1'h1)]} ?
          {(&wire161[(1'h1):(1'h1)]),
              (reg166[(2'h2):(2'h2)] ?
                  (&reg169) : $signed(wire161[(3'h7):(3'h5)]))} : $unsigned($signed((7'h41)))))
        begin
          reg172 <= $signed(wire150[(1'h0):(1'h0)]);
          reg173 <= wire170[(2'h3):(2'h2)];
        end
      else
        begin
          reg172 <= $signed((~&wire163));
        end
      reg174 <= ($signed(wire147) || $signed((wire148 != $signed((~wire147)))));
      reg175 <= $unsigned({$signed($unsigned((+wire170))),
          ($signed((wire152 > wire148)) ? (8'ha3) : wire149[(1'h1):(1'h1)])});
      reg176 <= $unsigned($signed(($unsigned((wire151 << (8'hb9))) & $signed($signed((7'h40))))));
    end
  assign wire177 = $unsigned((~|wire155));
  assign wire178 = $unsigned({($unsigned(wire150[(1'h0):(1'h0)]) < ($signed(reg173) ?
                           wire159[(4'h8):(4'h8)] : $unsigned(wire157))),
                       (8'ha0)});
endmodule

module module77  (y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h2b3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire82;
  input wire [(4'h9):(1'h0)] wire81;
  input wire signed [(4'hc):(1'h0)] wire80;
  input wire [(4'hf):(1'h0)] wire79;
  input wire [(5'h11):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire133;
  wire signed [(4'h9):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire83;
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg [(5'h12):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire129,
                 wire96,
                 wire93,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg132,
                 reg131,
                 reg130,
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
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg95,
                 reg94,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire83 = $unsigned((8'hb0));
  assign wire84 = (-$signed(wire78));
  assign wire85 = (($signed(((wire81 ?
                          wire84 : (8'h9f)) != {wire83})) >>> $signed(wire78[(3'h4):(2'h3)])) ?
                      (wire81[(3'h7):(3'h7)] >> (($signed(wire80) + ((8'haf) ?
                          (8'hb1) : wire80)) * $unsigned((wire84 ^ wire83)))) : ($signed((~^(wire78 ^~ wire78))) | (($unsigned(wire80) ?
                              wire83 : (wire84 >> wire81)) ?
                          wire81 : (wire84 > (wire81 ^~ wire82)))));
  assign wire86 = ((|wire82[(5'h14):(1'h0)]) || wire85);
  assign wire87 = (!((-wire83) < $unsigned($signed((wire83 ?
                      wire86 : wire85)))));
  assign wire88 = (8'hb2);
  assign wire89 = $unsigned((wire84[(4'h8):(3'h5)] ^~ $unsigned((wire86 ?
                      (wire81 ? wire86 : (8'ha3)) : (^~(8'hb7))))));
  always
    @(posedge clk) begin
      reg90 <= (|$signed((^~{(8'had), (wire80 ? wire85 : wire89)})));
      reg91 <= $unsigned((^~$signed((&{wire82, reg90}))));
      reg92 <= reg91[(1'h1):(1'h0)];
    end
  assign wire93 = (({($signed(wire85) ? (^(8'ha4)) : $signed(wire78)),
                          {(reg90 >> (7'h40))}} ?
                      $unsigned($signed($signed(wire88))) : $signed(((reg90 ?
                              wire89 : wire82) ?
                          ((8'ha7) ?
                              wire78 : wire87) : $signed(reg91)))) && {((wire80 ?
                              (wire83 * wire86) : wire82[(5'h11):(4'h8)]) ?
                          (((7'h43) ? (8'ha7) : reg92) ?
                              (|reg92) : $unsigned(wire81)) : wire80[(4'hc):(4'ha)]),
                      ($signed(wire79) ?
                          wire79[(4'hb):(4'hb)] : (|$signed(wire78)))});
  always
    @(posedge clk) begin
      reg94 <= (|$unsigned({({(8'hbe), reg92} < wire82),
          $unsigned($signed(wire79))}));
      reg95 <= $unsigned((~^{($signed(wire82) >= $signed(wire82)),
          $signed({wire83})}));
    end
  assign wire96 = $unsigned((($unsigned(wire81[(2'h3):(1'h0)]) ?
                          wire84 : wire88) ?
                      reg95[(1'h0):(1'h0)] : wire81[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg97 <= ((wire80[(3'h6):(3'h4)] + (~^$signed((~reg95)))) << (+$unsigned(($unsigned(wire81) <= {wire84}))));
      reg98 <= (((-($unsigned(wire86) ?
              $signed(reg92) : $unsigned(reg95))) + wire80) ?
          $unsigned(wire85[(3'h5):(3'h4)]) : (8'h9e));
      if ((reg97[(1'h0):(1'h0)] == reg90))
        begin
          reg99 <= $signed($unsigned($unsigned(($unsigned(reg92) | wire89[(4'h9):(4'h8)]))));
          reg100 <= {((-$unsigned(reg99)) ?
                  $signed({$signed(reg98), (wire84 <= wire81)}) : (7'h41)),
              (&(((|wire85) && $unsigned(reg99)) ?
                  $unsigned(wire84) : {reg95[(2'h2):(1'h0)]}))};
        end
      else
        begin
          reg99 <= (reg92[(1'h0):(1'h0)] ?
              reg100[(2'h3):(1'h1)] : $unsigned($signed(reg92)));
          reg100 <= (~^((~((reg100 < (8'hbe)) ?
              (reg95 ? wire80 : wire86) : wire82)) >= ({{wire88,
                  reg91}} + (-{reg95}))));
          reg101 <= ($signed((!($unsigned(wire85) * $signed(reg91)))) == ($unsigned((^~reg98)) ?
              ({(~^reg94), $signed(wire82)} * $unsigned((wire88 ?
                  wire82 : wire80))) : $signed($unsigned(wire96))));
        end
      reg102 <= wire86[(2'h3):(1'h1)];
      if ({$unsigned(((~^reg102[(3'h4):(2'h2)]) ?
              {{wire87, wire84}, (reg91 * wire81)} : $signed(reg97))),
          $signed((wire81 ?
              ($unsigned(wire87) ?
                  reg92[(2'h3):(2'h2)] : (~|wire96)) : $signed(wire85[(1'h1):(1'h1)])))})
        begin
          if ({$signed(($signed(reg101) ^~ reg98))})
            begin
              reg103 <= wire93[(4'ha):(3'h7)];
              reg104 <= $signed((7'h40));
            end
          else
            begin
              reg103 <= (wire80[(3'h6):(1'h0)] ?
                  ({wire82} ?
                      $unsigned($signed((+(8'hb4)))) : $signed(wire83[(4'hc):(3'h4)])) : reg91[(4'ha):(1'h1)]);
              reg104 <= ($unsigned((&$signed(reg95))) ?
                  $unsigned(wire83) : reg90[(3'h6):(2'h3)]);
            end
        end
      else
        begin
          reg103 <= ($signed((8'ha0)) >>> (|$signed(wire93[(3'h4):(2'h2)])));
          if (({($signed(reg103) ?
                      $unsigned($signed(wire83)) : ({wire78} != wire81[(1'h0):(1'h0)]))} ?
              (|wire96[(4'hb):(1'h0)]) : reg104[(4'ha):(3'h4)]))
            begin
              reg104 <= (^(8'hb2));
              reg105 <= ({wire83[(4'hd):(4'h9)],
                      $signed(wire85[(4'h9):(1'h1)])} ?
                  ({(^$signed(wire82)),
                      (&(8'hbf))} ^~ reg102) : $signed((reg90[(3'h4):(2'h2)] ?
                      ((wire78 ? reg101 : wire93) ?
                          $signed((8'ha2)) : $unsigned(wire82)) : ($signed((8'hbc)) - (wire85 ?
                          (8'hbe) : reg99)))));
              reg106 <= (^~reg99[(1'h1):(1'h1)]);
            end
          else
            begin
              reg104 <= reg102[(4'hc):(4'hc)];
              reg105 <= ((wire96[(1'h0):(1'h0)] ?
                  (reg98 ?
                      $signed((wire89 << reg91)) : (8'hb4)) : (reg92 | (~|$unsigned((8'ha3))))) ^ (-($unsigned((wire88 + reg92)) & $signed(((8'hbf) ?
                  reg104 : wire82)))));
              reg106 <= reg103;
              reg107 <= ((-($signed((!(8'h9c))) < $signed((wire79 + wire80)))) ?
                  reg92 : $unsigned(((^$unsigned(reg106)) <= (reg92 > $unsigned(wire88)))));
              reg108 <= reg103;
            end
          if ((|(reg101[(4'hd):(4'h8)] & $signed(((~&reg94) != (reg98 ?
              reg97 : reg91))))))
            begin
              reg109 <= $unsigned(reg92[(2'h3):(2'h3)]);
            end
          else
            begin
              reg109 <= (reg101 ?
                  ($signed((!reg99)) ?
                      ((-{(8'ha8), wire85}) && (|{(8'hb4),
                          reg97})) : $unsigned(reg103)) : $unsigned({(~|(~&reg98))}));
              reg110 <= reg98;
              reg111 <= wire78;
              reg112 <= $signed($unsigned(wire83[(2'h3):(1'h1)]));
            end
          reg113 <= $unsigned($unsigned(($unsigned({(7'h42)}) * ({reg110,
                  reg94} ?
              $signed(reg101) : reg94[(3'h4):(3'h4)]))));
          if (((~|reg103) ?
              $unsigned($signed($unsigned((&reg112)))) : ($signed($unsigned((reg100 * reg103))) ^~ (~&({wire83,
                      reg91} ?
                  (!(8'ha3)) : {reg109})))))
            begin
              reg114 <= wire81[(4'h8):(3'h7)];
              reg115 <= reg102[(4'h8):(1'h1)];
              reg116 <= wire87;
              reg117 <= reg112;
            end
          else
            begin
              reg114 <= $signed(reg94[(4'h8):(3'h4)]);
              reg115 <= reg109[(2'h2):(1'h0)];
              reg116 <= $unsigned((reg102[(3'h7):(3'h7)] ?
                  reg112 : reg110[(3'h7):(3'h4)]));
              reg117 <= ((^$unsigned($signed((wire80 ?
                  reg100 : reg101)))) >> reg113[(4'ha):(2'h2)]);
              reg118 <= reg110[(1'h1):(1'h0)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg119 <= ($unsigned($unsigned((reg111 ?
              (wire81 == reg92) : $signed(reg102)))) ?
          reg104[(2'h3):(2'h2)] : wire80);
      reg120 <= reg95[(2'h2):(1'h1)];
      reg121 <= (wire79 ?
          $signed((((&wire79) ? reg99[(3'h7):(2'h2)] : {reg117, reg98}) ?
              $signed(reg111) : $unsigned(reg117))) : $signed((8'h9f)));
    end
  always
    @(posedge clk) begin
      if ($signed($signed((^~$signed(wire78[(3'h5):(3'h5)])))))
        begin
          reg122 <= $signed(wire84);
          reg123 <= wire83;
          reg124 <= wire93[(4'hd):(4'hb)];
          reg125 <= (!wire87);
          reg126 <= $signed($unsigned($signed($unsigned((reg125 ?
              reg123 : wire93)))));
        end
      else
        begin
          reg122 <= $unsigned(wire80);
          reg123 <= ((+reg117[(5'h13):(4'hd)]) && $signed(reg123[(1'h1):(1'h1)]));
          reg124 <= $signed($unsigned((wire88[(1'h1):(1'h1)] ?
              $signed(reg99[(3'h6):(1'h1)]) : $signed((wire93 != reg90)))));
          reg125 <= (((|((wire80 ?
                  reg122 : (7'h41)) == ((8'haa) >= (8'ha0)))) < ((~$signed(wire85)) ?
                  (&(+wire85)) : {reg91})) ?
              reg100[(4'hb):(3'h5)] : $unsigned($unsigned(reg112[(1'h0):(1'h0)])));
        end
      reg127 <= (^~(((+(~^reg92)) ^~ $unsigned((~&reg125))) ?
          reg92[(2'h2):(1'h0)] : $signed((~&(reg111 ? (8'h9e) : reg109)))));
      reg128 <= (($signed($unsigned(((8'had) ? reg122 : reg121))) ?
          (!reg104) : $unsigned((~|$signed(wire96)))) ^~ reg102[(5'h10):(4'hc)]);
    end
  assign wire129 = (^~$unsigned((+$signed(reg105))));
  always
    @(posedge clk) begin
      reg130 <= (reg111[(1'h1):(1'h0)] >= $signed((reg95[(1'h1):(1'h1)] ?
          ((reg95 ?
              (8'h9c) : reg112) == {(8'ha8)}) : ((reg109 > (8'ha2)) + (wire96 != reg95)))));
      reg131 <= (($signed(({wire88, reg130} ? {wire82} : (wire84 ^ reg100))) ?
          (+($unsigned(reg97) ^ {wire96, reg115})) : {reg110,
              (-reg95[(1'h0):(1'h0)])}) < ((~((reg124 ~^ reg105) != (reg113 ?
              (8'ha7) : reg124))) ?
          (+{(8'hb8)}) : ((~^reg121) >= $unsigned(reg117))));
      reg132 <= $unsigned(wire93);
    end
  assign wire133 = ($unsigned($unsigned(((reg109 ? reg97 : reg102) ?
                       (8'hac) : wire87))) << (^~$signed((&$signed(reg116)))));
  assign wire134 = (-(($signed(((8'ha7) ? (8'hb1) : reg112)) ?
                           reg106 : ($signed(reg92) < $unsigned(reg127))) ?
                       $unsigned($unsigned($unsigned(reg117))) : (|reg131)));
  always
    @(posedge clk) begin
      reg135 <= $signed(($unsigned((~^(reg123 < reg128))) ?
          wire83[(4'hf):(3'h5)] : $signed($signed(reg92))));
      if ((~&{(((wire81 ? (8'hb0) : wire86) * (+reg90)) * $signed((~&reg122))),
          $unsigned(({(8'ha3), reg97} ?
              (wire93 ? wire81 : reg120) : reg91[(1'h0):(1'h0)]))}))
        begin
          reg136 <= wire85;
          reg137 <= $unsigned($unsigned(wire129));
          if (wire83)
            begin
              reg138 <= (~^($unsigned((^~{(8'ha6),
                  reg136})) == (($unsigned(reg104) && $unsigned(reg109)) ^ reg132)));
              reg139 <= ((reg137[(5'h10):(2'h2)] <= (~|reg91)) ^~ ($unsigned(((reg108 ?
                      reg128 : reg127) - (reg138 ^ reg132))) ?
                  (|$unsigned(reg108)) : (&wire96)));
              reg140 <= {$signed((reg94[(4'h8):(2'h2)] ?
                      reg90[(2'h3):(2'h2)] : $signed((-wire129)))),
                  reg132};
              reg141 <= ({(^~((wire88 ?
                      reg120 : wire134) == (reg114 == (8'hba)))),
                  $signed(($signed(reg124) == (^~wire89)))} ~^ (~^(7'h42)));
            end
          else
            begin
              reg138 <= reg106[(3'h7):(2'h3)];
            end
          reg142 <= ({$signed($unsigned(wire81[(1'h0):(1'h0)]))} << reg117[(1'h1):(1'h1)]);
        end
      else
        begin
          if ((reg95[(2'h2):(1'h1)] ? reg98 : reg103))
            begin
              reg136 <= reg137;
              reg137 <= $unsigned($unsigned((&reg126)));
            end
          else
            begin
              reg136 <= reg132[(4'ha):(1'h0)];
              reg137 <= {(!$signed(((wire133 ? reg113 : reg98) ?
                      {reg119} : $unsigned(reg142))))};
              reg138 <= (~&reg127);
            end
          reg139 <= wire133[(4'hc):(4'ha)];
          reg140 <= $signed(reg115[(2'h2):(2'h2)]);
          reg141 <= $signed(((((|reg142) < $signed(reg126)) ?
                  (^~(wire88 ^~ reg128)) : reg116[(2'h2):(1'h1)]) ?
              {{wire81, $signed(reg121)},
                  ((reg124 >>> reg137) & (-wire82))} : $unsigned(reg122[(1'h1):(1'h1)])));
          reg142 <= (((^reg125[(2'h2):(1'h0)]) ?
                  wire83[(3'h4):(1'h1)] : wire93[(5'h11):(3'h7)]) ?
              ((|(^~((8'ha0) ?
                  wire93 : (8'ha5)))) ^ reg121[(2'h2):(1'h1)]) : reg135[(3'h4):(2'h3)]);
        end
      reg143 <= (reg99 > ((({(7'h41), (8'ha0)} ^ (wire85 + reg114)) + reg125) ?
          $unsigned(wire87) : ((~|wire80) ?
              $unsigned(reg103[(4'h8):(3'h6)]) : (-$signed(reg114)))));
    end
endmodule
