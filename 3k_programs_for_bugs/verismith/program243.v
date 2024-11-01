module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1b1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire161;
  wire signed [(2'h3):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire57;
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  assign y = {wire161,
                 wire85,
                 wire75,
                 wire72,
                 wire71,
                 wire69,
                 wire68,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire7,
                 wire8,
                 wire9,
                 wire57,
                 reg5,
                 reg6,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg70,
                 reg73,
                 reg74,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned((wire2[(2'h3):(1'h1)] > ($signed(wire4) ?
          (wire1 == (7'h43)) : $unsigned((|wire0)))));
      reg6 <= wire3[(4'hc):(4'h8)];
    end
  assign wire7 = {wire0[(1'h0):(1'h0)],
                     (reg6[(2'h3):(1'h1)] >> $unsigned(wire0))};
  assign wire8 = (8'ha0);
  assign wire9 = ({{reg5}, $signed(wire8)} + ((8'ha8) ?
                     $signed((~^$unsigned(wire3))) : wire1));
  module10 #() modinst58 (wire57, clk, reg5, wire4, reg6, wire0, wire7);
  assign wire59 = $unsigned({$signed($signed(wire1[(1'h1):(1'h1)]))});
  assign wire60 = ({(|wire7[(4'h8):(1'h1)]),
                          ($signed((wire7 << (8'had))) >>> wire8)} ?
                      {$unsigned((wire7[(2'h2):(1'h1)] ?
                              (wire9 == reg6) : $signed(wire9)))} : ((wire59[(2'h2):(2'h2)] - wire0[(4'hd):(3'h7)]) ?
                          (((wire2 || wire2) ?
                                  reg6 : (wire1 ? wire2 : wire57)) ?
                              ((+wire2) ?
                                  $signed(reg6) : (+wire59)) : $unsigned((wire4 ?
                                  wire8 : wire2))) : (^~((reg5 ?
                                  wire9 : (8'ha4)) ?
                              {wire59} : $unsigned(wire2)))));
  assign wire61 = reg6;
  assign wire62 = ((wire0[(4'ha):(3'h6)] ?
                      wire0[(1'h0):(1'h0)] : wire3[(3'h7):(2'h3)]) < wire4);
  always
    @(posedge clk) begin
      if (wire8[(4'hb):(1'h1)])
        begin
          if ($unsigned(($unsigned((wire60 & $unsigned(wire8))) | (|{(8'hb1)}))))
            begin
              reg63 <= $signed($unsigned($signed((wire57[(1'h1):(1'h0)] >= wire61))));
              reg64 <= $signed($signed($unsigned(((~wire4) ~^ (wire4 ^~ wire9)))));
              reg65 <= ($unsigned({$signed({wire1, wire4}),
                      ($unsigned(wire9) ~^ $unsigned(wire1))}) ?
                  wire3 : $unsigned($signed(wire1[(4'hc):(1'h1)])));
              reg66 <= $unsigned($signed(wire8));
            end
          else
            begin
              reg63 <= ($signed({reg66[(5'h10):(4'h8)]}) ?
                  reg64[(5'h10):(5'h10)] : reg65);
              reg64 <= $signed(wire60[(4'hf):(4'h9)]);
            end
          reg67 <= (wire60 ^ $signed($signed(reg64)));
        end
      else
        begin
          reg63 <= {$unsigned($unsigned(((|wire61) | $signed(reg67))))};
          reg64 <= wire0;
          reg65 <= $unsigned(wire3[(3'h6):(3'h6)]);
        end
    end
  assign wire68 = reg65[(2'h2):(1'h1)];
  assign wire69 = ($signed((~|wire59[(2'h2):(1'h0)])) - reg65[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      reg70 <= (reg65[(1'h0):(1'h0)] ?
          (|reg67[(4'hb):(4'ha)]) : $signed(({(wire59 + wire9),
              (|wire9)} >> wire59)));
    end
  assign wire71 = (!$unsigned(wire3));
  assign wire72 = (!wire69);
  always
    @(posedge clk) begin
      reg73 <= (^$unsigned(reg65));
      reg74 <= (|$unsigned(wire8[(5'h11):(2'h3)]));
    end
  assign wire75 = ((~^wire57[(2'h3):(2'h3)]) & wire0);
  always
    @(posedge clk) begin
      reg76 <= $unsigned((reg67[(4'hc):(3'h4)] ?
          ((wire8 ?
              (-(8'ha0)) : (7'h42)) > $signed(wire59[(2'h3):(1'h0)])) : wire7));
      if (({$signed(wire4[(4'hb):(4'h8)])} ?
          (7'h40) : ({wire7[(3'h4):(2'h3)], wire0} ? wire71 : wire68)))
        begin
          if (reg73)
            begin
              reg77 <= $unsigned(wire69);
              reg78 <= wire3[(2'h3):(1'h0)];
              reg79 <= (^~$signed((reg76[(5'h10):(2'h2)] & $signed((reg77 ?
                  wire72 : reg67)))));
            end
          else
            begin
              reg77 <= reg6[(4'h9):(3'h5)];
              reg78 <= wire68[(3'h5):(3'h5)];
              reg79 <= (reg64 ^ ($signed((-{reg63, reg65})) ?
                  $signed((((7'h44) >>> reg65) ?
                      (reg6 ^ wire75) : $signed(wire0))) : $unsigned(wire69[(1'h1):(1'h0)])));
              reg80 <= $unsigned((!((~(wire72 ?
                  wire68 : wire72)) >> ($unsigned(wire1) <= (wire75 >> wire59)))));
            end
        end
      else
        begin
          reg77 <= $unsigned($unsigned($unsigned(reg78[(2'h3):(1'h1)])));
          if ($signed({reg79[(4'h9):(2'h3)]}))
            begin
              reg78 <= reg70;
            end
          else
            begin
              reg78 <= (reg76[(4'h9):(4'h9)] | $unsigned($signed((+(-(8'hbb))))));
            end
          if ({$unsigned(((wire57 << wire2[(4'h9):(2'h3)]) ?
                  ((wire1 ? wire4 : wire59) ?
                      (-reg73) : (8'hba)) : {$unsigned(wire68)})),
              ((({wire1} ^ wire68[(1'h1):(1'h0)]) != (~&reg64)) ?
                  reg66[(2'h3):(1'h1)] : (((!reg80) ?
                      reg76 : (wire9 && wire62)) > $signed(reg79)))})
            begin
              reg79 <= reg73;
              reg80 <= (&(wire2[(4'h9):(2'h3)] < ((8'hb0) ^~ (~reg6[(2'h2):(1'h0)]))));
              reg81 <= wire62;
              reg82 <= ($unsigned($signed($signed((wire69 * reg70)))) ?
                  {({wire60[(5'h12):(3'h4)], $signed(reg74)} && ((reg6 ?
                          wire9 : wire3) < (reg81 ? wire69 : reg78)))} : reg70);
              reg83 <= ((reg82 ?
                  wire62[(5'h12):(4'hb)] : $unsigned(wire71[(4'hd):(1'h0)])) + wire0[(4'ha):(3'h7)]);
            end
          else
            begin
              reg79 <= wire72[(4'ha):(3'h6)];
            end
        end
      reg84 <= ($signed((wire62[(2'h2):(2'h2)] && {(7'h43)})) + ({$signed((wire2 >= wire75))} ^~ $unsigned($unsigned($unsigned(wire7)))));
    end
  assign wire85 = reg74[(2'h3):(1'h0)];
  module86 #() modinst162 (.wire87(wire59), .wire90(wire69), .wire89(reg77), .y(wire161), .clk(clk), .wire88(wire2), .wire91(wire0));
endmodule

module module86  (y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire91;
  input wire [(4'he):(1'h0)] wire90;
  input wire signed [(4'hb):(1'h0)] wire89;
  input wire [(4'hf):(1'h0)] wire88;
  input wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire129;
  wire signed [(4'hb):(1'h0)] wire130;
  wire signed [(4'hc):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire159;
  assign y = {wire126,
                 wire92,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire159,
                 (1'h0)};
  assign wire92 = wire89;
  module93 #() modinst127 (wire126, clk, wire88, wire89, wire90, wire92, wire91);
  assign wire128 = $signed((wire91[(1'h1):(1'h0)] << wire88));
  assign wire129 = $signed(wire126);
  assign wire130 = (&(~{wire89[(4'ha):(2'h2)]}));
  assign wire131 = $unsigned((^$unsigned(wire128[(3'h5):(2'h2)])));
  module132 #() modinst160 (.wire137(wire91), .wire133(wire89), .clk(clk), .wire135(wire88), .wire136(wire130), .wire134(wire126), .y(wire159));
endmodule

module module10
#(parameter param56 = (~^({(((8'h9f) ? (7'h41) : (8'hb3)) ? (~(8'hb6)) : (7'h43))} ? ((((8'hb4) ? (8'hbd) : (8'haf)) - ((8'ha2) + (8'hb3))) > (((8'hb2) ? (8'hb0) : (8'hb4)) ? ((7'h41) ? (8'ha4) : (8'hb4)) : (|(8'hba)))) : ({(^(7'h40)), (~&(8'hbc))} ? (!(8'hab)) : (((7'h43) ? (7'h41) : (8'hb4)) ? ((7'h44) & (8'hab)) : ((8'haf) ^ (8'ha2)))))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  assign wire16 = wire15[(3'h5):(3'h4)];
  assign wire17 = wire12;
  assign wire18 = wire12;
  assign wire19 = (wire15[(2'h2):(1'h0)] ?
                      $signed($signed($unsigned(wire12[(4'hc):(3'h5)]))) : {wire13});
  assign wire20 = $signed($signed((~|{wire15, wire18[(2'h2):(2'h2)]})));
  assign wire21 = ((wire14[(4'hd):(3'h7)] ?
                      $unsigned($unsigned(wire19[(1'h0):(1'h0)])) : $unsigned({wire14[(5'h12):(5'h12)],
                          (+wire11)})) || wire17);
  assign wire22 = (wire19[(2'h3):(2'h2)] <<< $signed((-($unsigned(wire21) ?
                      (8'ha1) : (wire18 ? wire13 : (8'ha5))))));
  assign wire23 = ({wire21,
                      ((wire15[(3'h5):(2'h3)] - wire14) ?
                          (!(^wire11)) : wire22)} >> wire13[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg24 <= (wire19[(1'h0):(1'h0)] < $signed($signed(wire13)));
      if ($unsigned(($signed((7'h44)) ?
          wire15 : ((+wire17) ^ (~|wire11[(2'h2):(2'h2)])))))
        begin
          reg25 <= wire13[(3'h4):(2'h2)];
          reg26 <= ($unsigned((&((7'h42) ?
              (wire12 ? wire22 : wire12) : (wire11 ?
                  (8'hac) : (8'hb9))))) <<< {$unsigned($signed((wire14 < reg25)))});
        end
      else
        begin
          reg25 <= (reg24 >> (-wire14[(5'h10):(4'hd)]));
          reg26 <= wire13[(3'h6):(3'h4)];
          if ({$unsigned(wire22), $signed(wire19[(2'h2):(1'h0)])})
            begin
              reg27 <= wire18;
            end
          else
            begin
              reg27 <= $unsigned(wire12);
            end
          reg28 <= wire15[(1'h1):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      reg29 <= ($unsigned(($signed((~^wire15)) - $unsigned(wire21))) && (^~$signed(wire20[(3'h4):(1'h0)])));
      reg30 <= $signed($unsigned($signed((~$signed(wire19)))));
    end
  assign wire31 = wire18;
  assign wire32 = wire22[(3'h7):(1'h1)];
  assign wire33 = wire31;
  assign wire34 = (8'hb3);
  module35 #() modinst51 (.wire38(wire14), .wire39(reg27), .wire37(reg24), .clk(clk), .wire36(reg28), .wire40(wire17), .y(wire50));
  assign wire52 = $signed($unsigned({((^wire14) || (~^reg29))}));
  assign wire53 = $signed($signed({($unsigned((8'ha0)) ?
                          {reg29} : wire19[(3'h5):(3'h5)]),
                      $unsigned($unsigned(wire14))}));
  assign wire54 = (($unsigned((wire21[(5'h10):(1'h1)] - $unsigned((8'hae)))) ?
                          $unsigned(wire33[(1'h0):(1'h0)]) : $unsigned((reg27 ?
                              (wire12 <<< reg29) : wire12[(5'h10):(4'hf)]))) ?
                      (8'hba) : wire34[(2'h2):(2'h2)]);
  assign wire55 = $unsigned($unsigned({$unsigned((wire22 ^ reg28)), wire34}));
endmodule

module module35
#(parameter param49 = (7'h40))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire40;
  input wire [(5'h14):(1'h0)] wire39;
  input wire [(4'hf):(1'h0)] wire38;
  input wire [(4'h9):(1'h0)] wire37;
  input wire signed [(5'h13):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 (1'h0)};
  assign wire41 = (wire38[(4'h9):(2'h2)] ?
                      (wire37[(2'h3):(1'h0)] ?
                          wire38[(4'he):(3'h4)] : ($unsigned((wire36 & wire38)) ?
                              ((~|wire37) ?
                                  (8'ha0) : wire36) : wire38)) : (!$signed($signed((wire40 ?
                          wire38 : wire40)))));
  assign wire42 = $unsigned((~|$signed((|$signed((8'ha1))))));
  assign wire43 = ($unsigned(($unsigned($signed(wire38)) ?
                      ((~&(8'ha9)) ?
                          (^wire41) : $signed(wire38)) : $unsigned(wire37))) ^~ ($signed($signed((8'ha1))) ?
                      wire42 : $signed(((wire36 ?
                          wire40 : wire36) >>> $signed(wire39)))));
  assign wire44 = wire39[(2'h3):(2'h2)];
  assign wire45 = $unsigned(((|($signed(wire44) ?
                          wire38[(3'h6):(1'h0)] : (wire39 ? wire38 : wire39))) ?
                      $signed((wire36[(1'h1):(1'h1)] ?
                          (-wire36) : (&wire36))) : $signed(wire39[(2'h3):(2'h3)])));
  assign wire46 = ($unsigned((((+wire40) ?
                          $signed(wire39) : (wire37 >> wire36)) >>> $signed($unsigned(wire39)))) ?
                      ($unsigned($signed(wire41[(3'h5):(3'h4)])) > wire37) : $signed($signed($signed(wire39))));
  assign wire47 = wire36[(5'h12):(1'h1)];
  assign wire48 = wire44;
endmodule

module module132
#(parameter param158 = ((-(^(((8'ha6) <<< (8'hb3)) ? {(8'ha9)} : (~&(8'hb1))))) * (((~&{(7'h41), (8'hba)}) ? (8'haf) : (((8'ha3) ? (8'ha3) : (7'h43)) ? ((7'h43) << (8'hb3)) : (~|(8'h9f)))) ^~ ((~&((8'ha5) ? (8'ha7) : (7'h41))) < {((8'hb3) & (8'hbe))}))))
(y, clk, wire137, wire136, wire135, wire134, wire133);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire137;
  input wire [(4'hb):(1'h0)] wire136;
  input wire signed [(4'hf):(1'h0)] wire135;
  input wire [(5'h15):(1'h0)] wire134;
  input wire signed [(4'hb):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire156;
  wire [(4'he):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire152;
  wire signed [(5'h11):(1'h0)] wire151;
  wire signed [(5'h13):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire146;
  wire [(4'h8):(1'h0)] wire145;
  wire [(3'h5):(1'h0)] wire139;
  wire signed [(4'h9):(1'h0)] wire138;
  reg signed [(4'hc):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire152,
                 wire151,
                 wire150,
                 wire146,
                 wire145,
                 wire139,
                 wire138,
                 reg154,
                 reg153,
                 reg149,
                 reg148,
                 reg147,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  assign wire138 = wire137;
  assign wire139 = wire135[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg140 <= ((8'h9f) ?
          $signed((wire134 ?
              ({wire138} & $signed(wire137)) : (wire135[(2'h3):(2'h3)] & wire139))) : wire136[(1'h0):(1'h0)]);
      reg141 <= ((&((-(~wire138)) ? $signed((wire136 & wire138)) : reg140)) ?
          {$signed(wire134)} : $unsigned((&(+((8'h9c) ? reg140 : wire135)))));
      reg142 <= $signed(reg140[(2'h2):(1'h1)]);
      reg143 <= $unsigned(reg142);
      reg144 <= ((({(reg140 ? wire138 : reg140), wire136[(4'h8):(3'h4)]} ?
              wire134 : $unsigned($signed(wire139))) ~^ ((+(reg142 ?
                  wire133 : wire137)) ?
              $signed($unsigned(wire138)) : (&(wire136 >>> reg142)))) ?
          ((~&(~|{(8'hb3)})) ?
              $unsigned($unsigned(reg142)) : $unsigned(reg142[(5'h13):(4'hb)])) : $signed((|{$signed(reg141)})));
    end
  assign wire145 = wire133;
  assign wire146 = $signed(wire133[(4'hb):(4'h8)]);
  always
    @(posedge clk) begin
      reg147 <= $unsigned(wire146);
      reg148 <= wire136[(4'hb):(4'h9)];
      reg149 <= $signed(reg147);
    end
  assign wire150 = (wire136[(1'h1):(1'h1)] == (((8'haa) ^~ {reg142,
                           (&wire135)}) ?
                       ($signed((reg148 ?
                           reg141 : reg141)) || (8'haf)) : {$signed((reg143 ?
                               reg143 : (8'haf)))}));
  assign wire151 = reg140[(1'h0):(1'h0)];
  assign wire152 = (~$signed((8'h9f)));
  always
    @(posedge clk) begin
      reg153 <= (8'hb5);
      reg154 <= $signed(wire152);
    end
  assign wire155 = reg140;
  assign wire156 = (^~((wire139[(2'h2):(1'h0)] ?
                           (+((8'hb4) && wire152)) : ($unsigned(wire155) ?
                               (reg153 < wire150) : (wire133 ?
                                   (7'h42) : reg143))) ?
                       (&$signed($signed(reg140))) : $signed((&{(8'ha3)}))));
  assign wire157 = wire145[(3'h5):(2'h3)];
endmodule

module module93
#(parameter param124 = (|{((^((8'h9e) ^ (8'h9c))) || {(^(8'hb1))})}), 
parameter param125 = (param124 ? ((~^param124) ? (8'hbc) : (~^param124)) : (param124 ? (~&(^~(-param124))) : ((~&param124) ? ((8'ha0) ? (param124 ? param124 : param124) : (param124 + param124)) : (&(param124 ? (8'hb2) : param124))))))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire98;
  input wire signed [(4'hb):(1'h0)] wire97;
  input wire [(4'hd):(1'h0)] wire96;
  input wire [(4'ha):(1'h0)] wire95;
  input wire [(2'h3):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'ha):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire111;
  wire [(4'ha):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire99;
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg115,
                 reg114,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire99 = wire96[(2'h2):(2'h2)];
  assign wire100 = $unsigned(((|(~(!wire96))) ?
                       $unsigned(wire96) : $unsigned(wire98[(4'h8):(2'h2)])));
  assign wire101 = $unsigned((8'h9f));
  assign wire102 = (({$signed($unsigned(wire96))} == ({wire96,
                           $signed((8'hbc))} >> $signed((wire97 || wire98)))) ?
                       (~^(wire98 == $signed(wire94[(1'h1):(1'h1)]))) : (~|{(+$unsigned(wire97))}));
  always
    @(posedge clk) begin
      if ($signed(wire99))
        begin
          reg103 <= $signed(((8'haa) - $signed($signed((wire98 >>> wire98)))));
          reg104 <= ((^($signed(wire98[(3'h6):(1'h1)]) ?
                  $signed((wire97 * wire101)) : (-(8'hae)))) ?
              wire96[(1'h0):(1'h0)] : {(wire100[(4'h9):(3'h4)] ?
                      wire102[(3'h4):(3'h4)] : $signed(wire100[(3'h7):(2'h2)])),
                  $signed({(8'ha4), $signed(wire97)})});
          reg105 <= $signed(reg103);
        end
      else
        begin
          reg103 <= $unsigned((({wire100[(1'h1):(1'h1)]} ?
                  $signed((wire100 != (8'ha6))) : $unsigned(reg104)) ?
              wire95 : $unsigned($signed((~|wire102)))));
          reg104 <= ($unsigned(($signed((+reg105)) ?
              (((8'haf) >>> wire100) >>> $signed(wire98)) : ((wire102 ?
                  wire96 : wire101) ^~ $signed(wire97)))) ~^ $signed((8'hbd)));
          if (((({{wire101}, ((8'h9e) ? reg104 : wire94)} ?
              wire101 : wire101[(1'h0):(1'h0)]) != wire96[(4'h8):(3'h6)]) - (^~wire98)))
            begin
              reg105 <= ({{{{wire99, (8'hbb)}}, {wire95}}} == (reg104 ?
                  reg103[(4'hf):(2'h2)] : $signed($unsigned($unsigned(wire98)))));
            end
          else
            begin
              reg105 <= (!(8'hbe));
            end
          reg106 <= wire100;
        end
      reg107 <= ((7'h40) << (|(wire99[(2'h3):(1'h0)] ?
          ({(8'hbb), reg103} <<< (wire98 | wire96)) : (^~(~^reg103)))));
    end
  assign wire108 = ($unsigned(((~|reg103[(4'hf):(1'h1)]) >> (+reg104))) | $signed(reg106[(3'h5):(1'h0)]));
  assign wire109 = (+$signed((($signed(wire108) * (8'hb3)) ?
                       $unsigned((reg106 ?
                           (8'ha9) : wire98)) : (reg105[(4'h8):(3'h4)] != wire98[(4'ha):(3'h7)]))));
  assign wire110 = ($signed(wire95[(2'h3):(1'h0)]) >> wire102[(3'h7):(3'h4)]);
  assign wire111 = wire94[(1'h0):(1'h0)];
  assign wire112 = (($signed(reg103) ?
                       ((~{wire97, wire111}) - ((reg104 ?
                           wire108 : reg103) && wire102[(3'h4):(1'h1)])) : reg103[(1'h0):(1'h0)]) == (reg103[(4'ha):(3'h7)] ?
                       $unsigned((reg103 ?
                           wire109 : (reg105 >= wire111))) : wire111[(1'h0):(1'h0)]));
  assign wire113 = (!$signed(((~|(!(8'hb8))) ?
                       (~^((8'hb1) > wire95)) : $signed(wire112[(3'h5):(1'h0)]))));
  always
    @(posedge clk) begin
      reg114 <= $unsigned($unsigned((!$unsigned({wire97}))));
      reg115 <= (^~reg104[(3'h4):(2'h3)]);
    end
  assign wire116 = $signed(wire113);
  assign wire117 = $signed(wire97[(3'h5):(1'h0)]);
  assign wire118 = wire100;
  assign wire119 = (&((({wire108, wire96} ?
                       (reg105 ?
                           (8'hb2) : wire96) : ((8'ha2) + wire113)) + reg103) != {(~&reg114)}));
  assign wire120 = (wire112[(1'h0):(1'h0)] >> (wire116[(4'hf):(4'hc)] == (8'hb0)));
  assign wire121 = ((~|wire96[(1'h1):(1'h0)]) ?
                       $unsigned($signed((wire108 << $unsigned(wire113)))) : wire94);
  assign wire122 = wire100;
  assign wire123 = {$unsigned($signed(wire98[(4'h9):(3'h5)]))};
endmodule
