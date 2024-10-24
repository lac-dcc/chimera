module top
#(parameter param216 = (((^(^((8'ha9) ? (8'ha7) : (8'hb9)))) ? ({(8'ha3), ((8'hbe) < (7'h42))} >>> ((-(8'ha2)) ? (~&(8'hb5)) : (~|(7'h44)))) : {((^(8'hb1)) + ((7'h41) && (8'hb1))), {((8'haa) ^ (7'h40)), ((7'h41) ? (8'hab) : (8'hb4))}}) ? (^(&((~|(8'hb0)) ? {(8'ha7)} : {(7'h42)}))) : (~({(8'hae)} ~^ (((8'ha6) ? (8'hab) : (7'h40)) ? (&(8'haf)) : ((8'hb1) ? (8'hab) : (8'hbc)))))), 
parameter param217 = (((+(+(~&param216))) ~^ (((param216 || param216) || (!param216)) >> param216)) ? ((8'hbd) ? ((&(param216 ? param216 : param216)) ? ({param216, param216} <= (param216 ? (8'ha3) : param216)) : param216) : (8'hb3)) : param216))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire215;
  wire signed [(4'hc):(1'h0)] wire214;
  wire [(4'hc):(1'h0)] wire210;
  wire [(4'h9):(1'h0)] wire208;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire206;
  wire [(5'h12):(1'h0)] wire212;
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  assign y = {wire215,
                 wire214,
                 wire210,
                 wire208,
                 wire62,
                 wire67,
                 wire68,
                 wire69,
                 wire206,
                 wire212,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  module4 #() modinst63 (.wire6(wire0), .clk(clk), .y(wire62), .wire5(wire2), .wire7(wire3), .wire8(wire1));
  always
    @(posedge clk) begin
      reg64 <= $signed((~|wire1));
      reg65 <= $unsigned($unsigned(wire3[(4'hc):(4'hb)]));
      reg66 <= $unsigned($unsigned((((&wire1) >>> (reg65 > wire1)) >= wire3[(4'h8):(2'h2)])));
    end
  assign wire67 = (^$unsigned($signed(wire3[(3'h7):(3'h6)])));
  assign wire68 = $unsigned(reg65);
  assign wire69 = wire2[(3'h6):(2'h2)];
  module70 #() modinst207 (.clk(clk), .wire72(wire1), .y(wire206), .wire73(wire67), .wire71(wire2), .wire75(wire62), .wire74(wire0));
  module80 #() modinst209 (.wire82(wire3), .wire83(wire68), .clk(clk), .wire85(reg64), .wire81(wire69), .wire84(wire62), .y(wire208));
  module70 #() modinst211 (wire210, clk, wire62, wire208, reg64, wire1, reg65);
  module4 #() modinst213 (wire212, clk, reg65, wire68, wire208, wire3);
  assign wire214 = $unsigned(((&(~wire212)) ~^ (+reg64[(3'h6):(1'h1)])));
  assign wire215 = ($unsigned(wire68) ^ $unsigned(((~^wire210[(4'h8):(3'h5)]) ?
                       wire208[(1'h1):(1'h0)] : $signed((~^wire210)))));
endmodule

module module70
#(parameter param205 = ({((((8'hbc) | (8'ha6)) ^ {(8'h9c), (7'h43)}) >= {{(8'hbd), (8'ha3)}, ((8'ha3) ? (8'hba) : (8'hbe))}), ((!((8'hb9) >>> (8'ha0))) ~^ {(~(8'had))})} < (-(|(((8'hb0) || (8'hb6)) ? {(7'h42)} : ((8'had) ? (8'ha5) : (8'ha9)))))))
(y, clk, wire71, wire72, wire73, wire74, wire75);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire71;
  input wire [(4'h9):(1'h0)] wire72;
  input wire signed [(4'he):(1'h0)] wire73;
  input wire signed [(5'h14):(1'h0)] wire74;
  input wire signed [(4'hf):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire203;
  wire signed [(5'h15):(1'h0)] wire184;
  wire signed [(5'h13):(1'h0)] wire183;
  wire signed [(4'he):(1'h0)] wire182;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire138;
  wire signed [(5'h15):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire180;
  reg [(5'h13):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(5'h12):(1'h0)] reg113 = (1'h0);
  assign y = {wire203,
                 wire184,
                 wire183,
                 wire182,
                 wire135,
                 wire100,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire98,
                 wire137,
                 wire138,
                 wire146,
                 wire147,
                 wire180,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 (1'h0)};
  assign wire76 = ($signed((&($unsigned((8'hb9)) ?
                      $signed(wire72) : $unsigned((8'hb8))))) ~^ $unsigned(wire73));
  assign wire77 = (wire73 ?
                      $unsigned(($signed(wire74) >= {(wire76 == wire72)})) : wire76[(2'h2):(1'h0)]);
  assign wire78 = wire73;
  assign wire79 = wire77[(2'h2):(1'h0)];
  module80 #() modinst99 (.y(wire98), .wire84(wire76), .wire82(wire78), .wire85(wire73), .wire81(wire75), .wire83(wire77), .clk(clk));
  assign wire100 = {wire98[(2'h3):(2'h2)]};
  always
    @(posedge clk) begin
      reg101 <= (wire98[(1'h0):(1'h0)] - $signed((wire78[(4'he):(3'h5)] ?
          ((&wire77) * $unsigned(wire72)) : $signed(((8'hb1) ?
              wire74 : wire73)))));
      reg102 <= $signed((-(wire98 ? wire77 : wire76)));
      reg103 <= {(~^{$unsigned(wire73[(4'hb):(2'h3)])}),
          (wire76[(5'h10):(4'h9)] ?
              ((wire75[(4'hb):(1'h0)] * ((8'ha3) ? wire78 : wire100)) ?
                  wire77[(5'h11):(4'hc)] : $unsigned((wire100 ?
                      wire71 : wire71))) : $unsigned($signed(reg101[(5'h10):(3'h6)])))};
      reg104 <= wire76[(5'h12):(1'h0)];
      if ({$signed({((reg104 ^~ (8'hb1)) + reg103)}),
          $signed((~&$unsigned((^(8'h9d)))))})
        begin
          if ((&{(~^{wire73}), {$signed(((8'hab) ^ wire73))}}))
            begin
              reg105 <= $signed($signed(wire74));
              reg106 <= ({(^(wire73 >= reg103)), wire72} ?
                  wire76 : wire76[(4'h8):(1'h1)]);
              reg107 <= (8'hba);
              reg108 <= $unsigned((($unsigned(reg102[(1'h0):(1'h0)]) + reg106[(5'h11):(4'he)]) ?
                  $signed((7'h44)) : {$unsigned($unsigned(reg104)),
                      reg106[(2'h3):(1'h1)]}));
            end
          else
            begin
              reg105 <= $signed($unsigned(wire98[(1'h1):(1'h1)]));
              reg106 <= (wire78 ?
                  (!$unsigned($unsigned(wire79[(3'h7):(1'h1)]))) : ((((wire75 ?
                      (8'hb0) : reg102) ^ wire100) - $unsigned(reg105)) >>> wire74));
              reg107 <= $signed(((!(8'ha1)) ?
                  (({wire72, wire100} ?
                          wire71[(3'h6):(2'h2)] : (reg104 ? (8'hbf) : reg103)) ?
                      $signed((reg105 ?
                          reg104 : reg102)) : reg106) : ($signed({(8'hb0)}) ?
                      wire72 : (wire78 ?
                          reg107[(1'h0):(1'h0)] : wire79[(3'h5):(1'h0)]))));
            end
          if ($unsigned((!(reg107[(4'hd):(2'h3)] + $unsigned((wire75 ?
              reg106 : wire78))))))
            begin
              reg109 <= $signed($signed($signed($signed(reg104))));
              reg110 <= $signed((+((!wire75) ?
                  $signed({wire98, reg109}) : $unsigned((wire78 ?
                      reg108 : reg109)))));
              reg111 <= {(reg102 ^~ {(reg108 ?
                          {wire98} : reg101[(3'h7):(3'h7)]),
                      $signed(wire78)}),
                  (8'hb5)};
            end
          else
            begin
              reg109 <= wire76;
            end
        end
      else
        begin
          reg105 <= reg102;
          if (wire77[(1'h0):(1'h0)])
            begin
              reg106 <= wire100[(2'h2):(1'h0)];
              reg107 <= wire98;
              reg108 <= $signed($signed(($unsigned(reg104[(2'h3):(1'h0)]) ?
                  reg107 : $signed(((8'hb9) ? (8'hbc) : (8'hab))))));
              reg109 <= reg108[(1'h0):(1'h0)];
              reg110 <= $unsigned(((^~$signed({(8'ha4),
                  wire78})) >>> {((reg108 * (8'hbb)) ?
                      (~&(8'hac)) : ((8'hb1) ? reg107 : wire73)),
                  wire71[(4'hb):(1'h1)]}));
            end
          else
            begin
              reg106 <= (&({(wire72[(4'h9):(2'h2)] ?
                      (wire98 ?
                          reg108 : reg110) : $signed((8'hb9)))} & (8'hba)));
              reg107 <= $signed((({wire98[(1'h0):(1'h0)],
                      (reg102 ? (8'ha6) : wire77)} & {(8'ha3)}) ?
                  $signed($signed((reg104 == (8'hab)))) : $signed($signed(wire98[(1'h0):(1'h0)]))));
            end
          reg111 <= $signed(($unsigned((^~(wire73 ~^ (8'h9c)))) ?
              $signed(reg103[(3'h6):(3'h4)]) : $unsigned(wire100[(2'h2):(1'h1)])));
          reg112 <= ((reg106 - $unsigned((&((8'ha9) | reg103)))) ~^ (|($unsigned(reg104) ?
              $unsigned($signed(wire79)) : reg106)));
          reg113 <= reg101[(1'h0):(1'h0)];
        end
    end
  module114 #() modinst136 (.clk(clk), .y(wire135), .wire117(wire71), .wire118(wire78), .wire116(reg109), .wire115(wire76));
  assign wire137 = $unsigned($signed(wire77[(5'h11):(3'h7)]));
  assign wire138 = $unsigned($signed((wire73 >>> $signed($signed(reg109)))));
  always
    @(posedge clk) begin
      reg139 <= wire138;
      if ($signed((-reg101)))
        begin
          reg140 <= $signed($unsigned((^~reg106)));
          reg141 <= wire100[(2'h2):(1'h0)];
          reg142 <= wire137[(3'h5):(2'h2)];
        end
      else
        begin
          reg140 <= ($unsigned({((~^(8'hb4)) | wire75[(2'h3):(1'h1)]),
                  (8'h9e)}) ?
              $signed({($unsigned(wire76) || reg140)}) : (|(reg111[(2'h2):(2'h2)] ?
                  (8'h9c) : $unsigned((reg101 ^ reg139)))));
        end
      reg143 <= ((wire135[(4'h9):(2'h3)] && {($signed(wire75) > $signed((8'ha0))),
              wire78}) ?
          ($signed(($unsigned(reg108) > reg107[(4'he):(4'hd)])) ?
              wire76 : ($unsigned($unsigned(wire71)) ~^ (^(reg108 && reg111)))) : $signed(reg103[(2'h3):(2'h2)]));
      reg144 <= $signed($unsigned({($signed(wire73) && reg105)}));
    end
  always
    @(posedge clk) begin
      reg145 <= reg102;
    end
  assign wire146 = $signed(($signed(({reg140,
                           (8'h9f)} <<< $unsigned((8'h9d)))) ?
                       ((-wire74) ?
                           (^(wire79 ?
                               wire78 : reg109)) : $unsigned((^reg141))) : $unsigned(((+wire135) ?
                           $signed(reg110) : $unsigned(wire135)))));
  assign wire147 = $signed(reg142[(1'h0):(1'h0)]);
  module148 #() modinst181 (wire180, clk, reg109, reg145, reg139, wire138, reg101);
  assign wire182 = $unsigned((wire98[(1'h0):(1'h0)] ^ $unsigned($unsigned({reg143,
                       wire71}))));
  assign wire183 = {$signed(wire135[(2'h2):(2'h2)])};
  assign wire184 = wire74[(4'hf):(3'h6)];
  module185 #() modinst204 (wire203, clk, wire182, reg106, reg105, wire79);
endmodule

module module4
#(parameter param61 = ((({((8'ha7) > (8'h9f)), (+(8'haf))} ? (7'h44) : (((7'h44) && (8'hb0)) ? ((8'hbc) ? (8'ha4) : (8'hb1)) : ((8'hab) ? (8'ha1) : (8'hbd)))) ? (&((~&(8'hb6)) ? ((8'h9f) < (8'hb4)) : ((8'ha4) ? (8'ha6) : (8'hb2)))) : {(((8'haf) ? (8'had) : (8'hb7)) ? (~(8'hbc)) : ((7'h43) ? (8'hbb) : (8'hbe))), ({(8'hbe)} ? ((8'h9d) ? (8'hb2) : (8'h9f)) : (-(8'hb9)))}) <= (-((((8'hbf) <<< (8'h9f)) ? ((8'hb6) ~^ (8'hbf)) : (~&(8'hac))) ^~ (8'hb9)))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire5;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(3'h6):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire51;
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 reg58,
                 reg57,
                 reg56,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= ($unsigned(wire5[(1'h0):(1'h0)]) > wire5[(3'h4):(2'h2)]);
      reg10 <= {$signed((^~((wire6 ? (8'h9c) : wire8) ?
              {wire5} : $signed((8'hb7)))))};
      reg11 <= (^(~$unsigned(reg9[(1'h1):(1'h1)])));
    end
  module12 #() modinst52 (.clk(clk), .wire16(wire5), .y(wire51), .wire13(reg10), .wire15(wire6), .wire14(wire7));
  assign wire53 = reg10;
  assign wire54 = (wire51 ?
                      wire53[(4'h9):(2'h3)] : {{((+wire51) ~^ (reg11 ?
                                  wire7 : wire8))}});
  assign wire55 = $unsigned(wire7[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg56 <= wire53;
      reg57 <= ((((~wire7) ? $signed(reg56) : (~{wire7, wire5})) ?
              wire5 : (~&$unsigned(reg56[(3'h4):(3'h4)]))) ?
          ((((&wire6) ? (^wire53) : (reg10 < wire8)) ?
                  $signed($signed(reg9)) : (wire6 >> wire5)) ?
              reg11[(1'h0):(1'h0)] : reg11) : ($signed($unsigned($signed(wire51))) < reg10[(4'he):(4'hd)]));
      reg58 <= (~^reg56);
    end
  assign wire59 = (+((~|(~^(wire54 ? wire51 : wire6))) ?
                      (((&(8'hae)) <= $signed(wire7)) ?
                          reg10[(3'h4):(2'h3)] : reg58) : reg56));
  assign wire60 = wire51[(4'h9):(2'h2)];
endmodule

module module12
#(parameter param49 = ((^~(+{((8'hb6) ? (8'hba) : (7'h44)), {(8'hb5), (7'h41)}})) & ((-(^~{(8'had)})) & ((((8'hac) ? (8'hb0) : (8'ha2)) ? ((8'hbc) ? (8'hbc) : (8'h9f)) : ((8'haa) == (8'hb8))) ? (|((8'ha5) - (8'hbc))) : ({(7'h44)} > ((8'hb3) != (8'h9f)))))), 
parameter param50 = param49)
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= (wire13 ?
          (^~$signed({((8'hb1) ? wire15 : wire16),
              $unsigned(wire13)})) : wire15[(2'h3):(2'h3)]);
      reg18 <= $unsigned(((((wire14 ?
          wire15 : reg17) ~^ $signed(wire14)) && ({wire14, reg17} ?
          wire13 : (wire13 || wire16))) & ($unsigned(wire15[(4'hd):(4'hc)]) ?
          wire16[(3'h4):(2'h2)] : (~|(reg17 ? wire16 : (8'hbf))))));
      reg19 <= (wire13 >= {wire16[(3'h7):(3'h6)]});
      if ($signed({((+reg18) <= {(7'h44)}),
          (({reg17, (8'hb9)} ?
              reg19 : $signed(wire16)) & $unsigned((^~wire16)))}))
        begin
          if ($signed((~|$signed(wire16))))
            begin
              reg20 <= $signed(((wire15[(4'ha):(3'h6)] ^ (~{wire14, wire16})) ?
                  wire15 : $signed(reg17)));
              reg21 <= ($signed(wire15) << (reg17[(1'h0):(1'h0)] < $signed(wire13)));
              reg22 <= (~$signed((+wire16)));
              reg23 <= (~^(~&(~^(wire15 ? $unsigned(reg19) : (~|wire16)))));
              reg24 <= $unsigned($signed((~&(reg21 ?
                  $unsigned(reg17) : (wire14 ? reg22 : reg21)))));
            end
          else
            begin
              reg20 <= (reg24[(4'hc):(2'h2)] ?
                  ($signed(((!(7'h42)) == wire14)) ?
                      wire15 : $signed(wire14)) : $signed((($unsigned(reg17) ?
                      wire16[(1'h0):(1'h0)] : $signed(reg22)) < (~(reg17 ?
                      wire16 : (7'h42))))));
              reg21 <= (((^~(wire16 ?
                  (wire13 ?
                      (8'hbe) : reg23) : $signed(reg17))) + (((reg21 ~^ reg21) ?
                      (reg22 != reg21) : $signed(wire16)) ?
                  {(8'h9d)} : ((-reg20) ?
                      (reg18 ?
                          wire16 : (8'haf)) : $signed(wire13)))) | (-$unsigned($signed($unsigned(reg20)))));
            end
          reg25 <= reg23[(1'h0):(1'h0)];
          reg26 <= (7'h44);
          if (reg20)
            begin
              reg27 <= ($unsigned((((reg21 ? reg25 : (7'h43)) ?
                      (wire15 && reg20) : (reg23 ~^ reg26)) ?
                  ((reg21 ? reg24 : reg18) ?
                      $unsigned(reg23) : (^~wire14)) : $unsigned($signed(reg21)))) ^~ ((reg17 ~^ wire14) ~^ reg17));
              reg28 <= reg19[(4'hb):(4'ha)];
              reg29 <= ({($signed(reg18) && {reg17[(1'h0):(1'h0)], reg26}),
                  $signed(reg20)} != $signed(reg18));
              reg30 <= (^(-{wire13}));
              reg31 <= (^~(8'hbd));
            end
          else
            begin
              reg27 <= reg21[(1'h1):(1'h1)];
              reg28 <= ($signed($signed($unsigned($unsigned(wire13)))) | {(~&$signed((wire16 ?
                      reg18 : reg27)))});
              reg29 <= $unsigned(wire15[(1'h0):(1'h0)]);
              reg30 <= $unsigned($signed((-$unsigned($unsigned(wire14)))));
            end
          reg32 <= (~&(|($signed(reg31) ? wire14 : $unsigned(reg31))));
        end
      else
        begin
          reg20 <= $unsigned(((^({reg20, reg31} <<< {reg23})) ?
              (wire15[(3'h6):(3'h4)] >>> ((+wire14) < reg30)) : (~($signed(wire15) ?
                  reg20[(3'h4):(2'h2)] : (~^reg21)))));
          reg21 <= $unsigned((($signed($signed(wire16)) ^~ (reg21[(4'hc):(2'h3)] ?
                  $signed(reg28) : reg26)) ?
              reg28 : ((&$unsigned(reg23)) ?
                  ($signed((8'ha1)) ?
                      reg23[(4'hc):(1'h1)] : (reg26 ?
                          reg20 : reg29)) : $unsigned({(8'ha3), (8'hbe)}))));
          if ((~^wire16))
            begin
              reg22 <= (reg24[(4'hf):(1'h1)] ?
                  (((~&(!wire14)) >> {$signed(reg21), (reg26 != reg19)}) ?
                      wire16 : reg31[(1'h0):(1'h0)]) : reg32[(2'h2):(2'h2)]);
              reg23 <= (!wire14[(3'h6):(2'h2)]);
              reg24 <= (wire16[(3'h5):(2'h3)] ?
                  (reg31 ?
                      reg25 : (reg23 << (reg31[(1'h1):(1'h0)] == reg19[(4'he):(3'h6)]))) : ($unsigned(wire14[(3'h6):(3'h4)]) ^ $unsigned((reg28[(4'ha):(1'h0)] ?
                      {reg30} : (reg24 ? reg32 : reg28)))));
            end
          else
            begin
              reg22 <= ((&((reg19[(3'h4):(2'h3)] ^ (7'h41)) ?
                  (^(reg24 == (7'h44))) : (reg27[(4'h8):(3'h5)] ^~ $signed((8'ha4))))) == reg17[(1'h0):(1'h0)]);
              reg23 <= reg30;
              reg24 <= reg32[(4'hf):(4'hb)];
            end
          reg25 <= reg25;
          if ($signed(((((reg27 ? reg28 : (8'hbe)) ?
                  (reg29 ? reg17 : reg19) : $signed(reg29)) <<< {reg25}) ?
              $signed((wire13 ?
                  (reg31 || reg24) : (wire14 >= reg24))) : (($unsigned(reg26) ?
                      (reg30 ? reg20 : reg22) : ((8'h9e) << reg21)) ?
                  ((8'h9e) ?
                      (wire16 ?
                          reg22 : (8'ha8)) : $signed(reg26)) : $signed($unsigned(reg27))))))
            begin
              reg26 <= (!reg17);
              reg27 <= {(reg25[(4'h8):(4'h8)] > $unsigned(reg18[(2'h3):(1'h1)]))};
              reg28 <= {($signed(((reg28 ? (8'hb2) : reg23) < (reg25 ?
                          reg28 : reg17))) ?
                      $signed((((8'hae) ?
                          reg31 : (8'ha7)) - reg18)) : $signed(((reg25 ?
                          wire15 : reg26) ~^ (^~reg23)))),
                  {$unsigned($unsigned(reg21[(3'h6):(3'h6)]))}};
              reg29 <= ({(8'hb0),
                  {($unsigned(reg32) > reg21[(4'hb):(2'h3)]),
                      (((8'ha0) ? (8'hb6) : reg29) & {reg31,
                          (8'h9d)})}} - $unsigned(reg29));
            end
          else
            begin
              reg26 <= ($unsigned($signed(wire16[(2'h2):(1'h0)])) ?
                  (reg25 ?
                      (reg23 ?
                          reg20[(4'ha):(3'h4)] : {(|wire15),
                              reg29[(2'h3):(1'h1)]}) : $unsigned({{reg24},
                          reg25})) : ($signed({$unsigned((7'h43)),
                          $signed((8'ha6))}) ?
                      (8'hbd) : (~|$unsigned((reg25 ? reg23 : reg24)))));
              reg27 <= reg28;
              reg28 <= ($signed($unsigned((reg21 ?
                  $signed(reg31) : (reg32 || (8'hbf))))) - reg30[(2'h2):(2'h2)]);
            end
        end
      if ((reg32 ?
          $signed({reg27[(4'hf):(3'h6)]}) : $unsigned(({(reg31 ?
                  reg27 : reg24)} > reg25[(4'he):(4'hc)]))))
        begin
          reg33 <= wire15;
          reg34 <= $unsigned({$signed($unsigned($unsigned(reg25))),
              ($unsigned($unsigned(reg22)) ?
                  ($unsigned(reg17) ?
                      (-reg24) : reg33[(4'hc):(1'h1)]) : $unsigned((wire14 >> reg31)))});
          reg35 <= ((~|(~(8'hb6))) ~^ $signed(reg21[(3'h7):(3'h4)]));
          reg36 <= (7'h43);
        end
      else
        begin
          reg33 <= (^$unsigned(reg27[(5'h12):(1'h1)]));
        end
    end
  assign wire37 = wire16;
  assign wire38 = ($unsigned({(8'h9e)}) <<< $signed((reg26[(1'h1):(1'h0)] ?
                      ($signed(reg35) ? (~reg23) : {reg25}) : ((reg33 > reg34) ?
                          wire15[(3'h6):(2'h2)] : (wire15 << (8'hbd))))));
  assign wire39 = $unsigned(($unsigned((((8'h9e) ~^ reg29) ?
                          (8'ha6) : wire13[(2'h2):(1'h0)])) ?
                      $signed({(reg22 ? reg20 : reg35),
                          $unsigned(wire37)}) : reg32[(4'hb):(4'hb)]));
  assign wire40 = ((|($signed($signed(reg32)) * {reg32[(4'hd):(4'ha)]})) >= $signed((wire38 | reg26[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg41 <= {reg22};
      reg42 <= $unsigned($unsigned((!(&(reg33 | reg41)))));
      reg43 <= (~|reg36);
      reg44 <= {$unsigned($unsigned($unsigned($unsigned(wire38))))};
      reg45 <= reg26;
    end
  assign wire46 = (!(reg28 * $unsigned(wire40[(4'h9):(4'h8)])));
  assign wire47 = reg33[(3'h6):(1'h1)];
  assign wire48 = $unsigned(((reg26[(1'h1):(1'h1)] ?
                      wire15[(3'h7):(3'h6)] : wire46) * (reg18[(2'h2):(1'h1)] ?
                      $signed($signed(reg29)) : (+reg32))));
endmodule

module module185  (y, clk, wire189, wire188, wire187, wire186);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire189;
  input wire [(3'h4):(1'h0)] wire188;
  input wire [(4'hd):(1'h0)] wire187;
  input wire signed [(5'h11):(1'h0)] wire186;
  wire signed [(5'h11):(1'h0)] wire202;
  wire signed [(3'h7):(1'h0)] wire201;
  wire [(5'h15):(1'h0)] wire200;
  wire [(5'h13):(1'h0)] wire199;
  wire signed [(5'h11):(1'h0)] wire198;
  wire [(4'hb):(1'h0)] wire195;
  wire signed [(5'h13):(1'h0)] wire194;
  wire signed [(2'h2):(1'h0)] wire193;
  wire signed [(5'h14):(1'h0)] wire192;
  wire [(4'hd):(1'h0)] wire191;
  wire signed [(4'h9):(1'h0)] wire190;
  reg [(5'h13):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg196 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 reg197,
                 reg196,
                 (1'h0)};
  assign wire190 = (+{wire186,
                       ((wire188 ?
                               wire187[(4'h8):(3'h7)] : (wire186 ?
                                   wire186 : wire186)) ?
                           {(wire187 ? wire187 : (8'ha8)),
                               wire189[(3'h7):(3'h7)]} : $signed({wire188,
                               wire188}))});
  assign wire191 = wire188[(1'h0):(1'h0)];
  assign wire192 = (+wire191);
  assign wire193 = ($unsigned((8'hb6)) >>> ((~|((wire187 < wire190) ?
                           $signed(wire192) : (wire191 ? wire191 : wire189))) ?
                       $unsigned(wire188[(1'h1):(1'h0)]) : ({(wire187 ?
                                   wire189 : wire187)} ?
                           {{wire191},
                               (wire186 && wire189)} : wire189[(4'h8):(1'h0)])));
  assign wire194 = wire188[(3'h4):(1'h0)];
  assign wire195 = $unsigned((+wire186[(4'h8):(4'h8)]));
  always
    @(posedge clk) begin
      reg196 <= $signed({(~&(!((8'hae) ? wire187 : wire189))),
          $signed(($signed(wire187) ? wire195 : wire194))});
      reg197 <= reg196[(4'h8):(1'h0)];
    end
  assign wire198 = ((!$unsigned(wire194)) ?
                       {(wire191[(3'h4):(1'h1)] ~^ wire191),
                           $signed($signed((reg197 != wire195)))} : ((~&$unsigned((wire193 ^~ wire188))) >>> ($unsigned((^(8'hb2))) ^ $signed((~&(8'hb2))))));
  assign wire199 = $unsigned($unsigned((&((wire187 >>> wire190) != $signed((7'h43))))));
  assign wire200 = ($unsigned($signed(reg196[(3'h7):(2'h2)])) >>> $unsigned($unsigned((((8'ha6) | wire189) ~^ $unsigned(wire194)))));
  assign wire201 = {wire190};
  assign wire202 = ((~^{(wire201 ? $signed((8'hbe)) : wire200),
                       wire200[(4'h9):(3'h7)]}) != wire200);
endmodule

module module148
#(parameter param179 = {(((((8'ha1) == (8'ha2)) >>> {(8'hab), (8'hba)}) ? (~|((8'hb6) != (8'hb7))) : (8'ha0)) ~^ {(|(-(8'haf))), ({(8'ha2), (8'hac)} | ((8'h9e) ? (8'hbc) : (7'h42)))}), (^~({((8'hba) <<< (8'hb9)), ((8'hb0) ? (8'hb7) : (8'ha0))} & ({(8'hb1), (8'ha1)} ? ((8'hb0) == (8'ha7)) : (^(8'ha1)))))})
(y, clk, wire153, wire152, wire151, wire150, wire149);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire153;
  input wire signed [(5'h13):(1'h0)] wire152;
  input wire [(5'h14):(1'h0)] wire151;
  input wire [(4'he):(1'h0)] wire150;
  input wire [(4'ha):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire175;
  wire [(4'h9):(1'h0)] wire174;
  wire signed [(4'he):(1'h0)] wire173;
  wire signed [(5'h12):(1'h0)] wire172;
  wire [(4'he):(1'h0)] wire171;
  wire [(2'h2):(1'h0)] wire158;
  wire signed [(3'h6):(1'h0)] wire157;
  wire signed [(4'hc):(1'h0)] wire156;
  wire [(4'h8):(1'h0)] wire155;
  wire signed [(4'h9):(1'h0)] wire154;
  reg signed [(4'hf):(1'h0)] reg178 = (1'h0);
  reg [(4'h9):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg signed [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg168 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(5'h15):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 reg178,
                 reg177,
                 reg176,
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
                 (1'h0)};
  assign wire154 = (|$signed({wire151[(4'h9):(4'h8)]}));
  assign wire155 = $signed((^wire152[(2'h2):(1'h1)]));
  assign wire156 = wire151;
  assign wire157 = wire150[(4'hd):(3'h4)];
  assign wire158 = wire151[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg159 <= (+$signed({wire149}));
      reg160 <= $signed(($signed($unsigned(wire155)) ^ wire151));
      reg161 <= wire156[(4'hc):(3'h4)];
      reg162 <= (reg160 ?
          ((^~$signed((~wire157))) >> $unsigned((&{(8'hbc),
              wire156}))) : $unsigned($signed(reg161)));
      if (($signed($unsigned($unsigned(((8'hb0) <<< wire155)))) ?
          reg159[(2'h3):(1'h1)] : ((^~($unsigned(reg161) >= $signed(wire156))) * ($unsigned({wire153}) ?
              $signed(((8'ha9) ? (7'h41) : reg160)) : {wire154}))))
        begin
          reg163 <= $unsigned(wire156);
        end
      else
        begin
          reg163 <= ($unsigned((($signed(wire150) >>> $unsigned(wire153)) || $signed((wire149 & reg161)))) ?
              $unsigned(((~|{reg160}) >>> reg161)) : (wire150 ?
                  wire157 : $signed($signed($signed(wire158)))));
          if ((reg162[(2'h3):(2'h2)] ^ reg163[(4'h8):(3'h5)]))
            begin
              reg164 <= wire151[(2'h2):(1'h0)];
              reg165 <= reg162;
              reg166 <= ((&(({wire154, reg162} ?
                      $signed(reg163) : (wire151 != wire157)) <<< reg163[(4'h8):(4'h8)])) ?
                  reg164 : reg162[(3'h5):(2'h2)]);
              reg167 <= reg161;
              reg168 <= reg166[(1'h0):(1'h0)];
            end
          else
            begin
              reg164 <= (~((^~$signed({reg161})) ?
                  (($unsigned(reg159) ? $signed(reg162) : (~&reg164)) ?
                      (reg167[(2'h2):(2'h2)] & $signed(reg167)) : $signed(reg167)) : (&wire155)));
              reg165 <= {(~{reg167[(5'h12):(5'h12)]}),
                  $unsigned($unsigned({(wire156 ? reg164 : wire156)}))};
              reg166 <= ($unsigned((&wire152)) ?
                  $signed((((^reg164) + (wire150 ? wire154 : reg168)) ?
                      ((8'hb2) | {reg164}) : wire157)) : wire154[(4'h9):(1'h1)]);
            end
          reg169 <= $unsigned((~|{$signed((wire149 < reg163)),
              (&$unsigned(wire157))}));
          reg170 <= $signed((($signed($unsigned(reg166)) ?
              reg167[(5'h11):(3'h4)] : wire156) - (~|((reg162 ?
                  wire150 : wire153) ?
              {wire158} : (wire156 <= wire157)))));
        end
    end
  assign wire171 = $unsigned(reg159);
  assign wire172 = (8'ha4);
  assign wire173 = $unsigned($unsigned($unsigned($signed(reg161[(4'h9):(3'h5)]))));
  assign wire174 = $signed(wire158[(2'h2):(1'h1)]);
  assign wire175 = $signed($signed({{$signed((8'ha8)), $signed(wire153)},
                       ((^wire173) != $signed(wire155))}));
  always
    @(posedge clk) begin
      reg176 <= ((8'hb6) ?
          $signed({$signed((reg170 > reg161)),
              {(wire173 && wire172)}}) : wire156[(1'h1):(1'h0)]);
      reg177 <= reg168;
      reg178 <= $unsigned((reg161 + $unsigned((&$unsigned(reg167)))));
    end
endmodule

module module114
#(parameter param133 = {(((((8'ha8) ? (8'had) : (8'hbf)) >> ((8'ha9) ? (8'h9f) : (8'hb9))) >= {((7'h42) & (8'ha0))}) ? ((((8'had) ? (8'ha7) : (7'h44)) ? (-(8'hb1)) : ((8'ha2) ? (8'ha9) : (8'ha8))) >= ((|(8'hb5)) & {(8'ha5), (8'hb1)})) : {(((8'hb1) ? (8'hba) : (8'ha6)) <= {(8'ha2), (8'hb6)})})}, 
parameter param134 = (({((^~param133) ? ((8'ha1) | (8'hab)) : (^(8'ha7))), ((param133 ? param133 : param133) ~^ (8'hb1))} || (~|(~param133))) * param133))
(y, clk, wire118, wire117, wire116, wire115);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire118;
  input wire [(5'h11):(1'h0)] wire117;
  input wire signed [(3'h7):(1'h0)] wire116;
  input wire [(4'hf):(1'h0)] wire115;
  wire [(4'he):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire131;
  wire signed [(3'h4):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire119;
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg126,
                 (1'h0)};
  assign wire119 = wire116[(2'h3):(2'h3)];
  assign wire120 = (^wire117);
  assign wire121 = (({$unsigned((+wire118))} && $signed(wire117[(1'h0):(1'h0)])) >= ((((wire120 ^~ wire117) ?
                           $unsigned(wire116) : (^~wire116)) - {$signed(wire115),
                           $unsigned(wire115)}) ?
                       wire117[(3'h7):(3'h7)] : wire118[(3'h5):(2'h3)]));
  assign wire122 = {wire117,
                       $signed({((+wire116) ?
                               wire117 : wire115[(2'h3):(2'h3)])})};
  assign wire123 = ($signed((~$unsigned((wire120 != wire121)))) >>> wire115[(2'h3):(1'h1)]);
  assign wire124 = $unsigned(wire116[(3'h7):(1'h0)]);
  assign wire125 = wire118[(4'hd):(3'h5)];
  always
    @(posedge clk) begin
      reg126 <= $signed(wire123[(4'hb):(1'h1)]);
    end
  assign wire127 = (wire123 & reg126);
  assign wire128 = $unsigned(wire117[(5'h11):(4'h8)]);
  assign wire129 = {$unsigned((wire115 & ((~&wire128) ^ $unsigned((8'hb6))))),
                       ($unsigned(((wire125 ? reg126 : (8'hb7)) ?
                               (wire125 ?
                                   wire115 : wire117) : $signed(wire122))) ?
                           wire125[(3'h6):(3'h5)] : (((+wire120) <<< wire120) ?
                               (|(wire115 | wire125)) : (-$signed(wire116))))};
  assign wire130 = $unsigned($unsigned(wire115));
  assign wire131 = wire129[(5'h10):(2'h2)];
  assign wire132 = ((!$unsigned(wire118[(4'ha):(3'h6)])) ?
                       (wire118[(2'h3):(2'h2)] ?
                           ((wire131[(3'h6):(3'h6)] ?
                               (wire120 ?
                                   wire128 : wire129) : reg126[(5'h11):(2'h2)]) ~^ wire124[(4'hb):(1'h0)]) : wire129[(4'ha):(2'h3)]) : $signed(wire116));
endmodule

module module80  (y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire85;
  input wire signed [(5'h12):(1'h0)] wire84;
  input wire [(5'h13):(1'h0)] wire83;
  input wire signed [(4'he):(1'h0)] wire82;
  input wire [(2'h2):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire95;
  wire signed [(5'h12):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 (1'h0)};
  assign wire86 = (^~wire81);
  assign wire87 = wire86[(2'h3):(1'h0)];
  assign wire88 = $signed($unsigned($unsigned($signed((wire84 ?
                      wire84 : wire87)))));
  assign wire89 = $unsigned({wire83, wire88[(2'h2):(1'h1)]});
  assign wire90 = $signed(($unsigned($unsigned((wire88 >= wire81))) ?
                      (~&$signed((wire85 <= (8'hb0)))) : ($signed($signed(wire84)) ?
                          ($signed(wire88) ?
                              wire81[(1'h0):(1'h0)] : (wire86 ?
                                  wire83 : wire83)) : ((wire85 ~^ wire85) ?
                              (wire87 ?
                                  (8'hb9) : wire83) : $unsigned(wire81)))));
  assign wire91 = $signed((^wire83));
  assign wire92 = wire84;
  assign wire93 = (8'hb1);
  assign wire94 = (wire87[(2'h2):(2'h2)] ?
                      {(wire86 ~^ $unsigned((wire85 ? wire93 : wire84))),
                          (^~wire92)} : {$signed(wire87), wire93});
  assign wire95 = ({(~&$unsigned((~wire86))), $unsigned(wire87)} <<< {wire85});
  assign wire96 = (^wire88);
  assign wire97 = (8'hb7);
endmodule
