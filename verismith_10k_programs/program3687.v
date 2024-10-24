module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire57;
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  assign y = {wire122,
                 wire61,
                 wire60,
                 wire59,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire57,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 (1'h0)};
  assign wire5 = (&(8'ha9));
  assign wire6 = $unsigned($unsigned(wire0));
  assign wire7 = wire6;
  assign wire8 = wire5[(3'h5):(2'h2)];
  assign wire9 = $unsigned({wire8[(3'h6):(2'h2)],
                     $signed(($signed(wire5) ? wire6 : $unsigned(wire3)))});
  module10 #() modinst58 (.wire15(wire5), .clk(clk), .wire14(wire8), .wire12(wire9), .wire11(wire6), .wire13(wire4), .y(wire57));
  assign wire59 = $signed(wire8);
  assign wire60 = wire5;
  assign wire61 = (((((wire6 ?
                      (8'hac) : wire0) >= wire57) && ((wire4 ^~ wire5) ?
                      (wire0 ?
                          wire5 : wire9) : wire1)) & ((wire0[(3'h4):(2'h3)] >>> (~^wire6)) ?
                      (~^(wire3 ? wire0 : wire59)) : {(wire7 ?
                              wire8 : wire3)})) * wire59[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg62 <= wire4;
      if ($unsigned(wire4[(4'hb):(3'h4)]))
        begin
          reg63 <= ($unsigned((($unsigned(wire7) >>> (wire3 == wire5)) < wire57)) ?
              ($signed(($unsigned(wire60) <<< wire59)) ?
                  wire59 : ($signed({wire4, wire6}) | (-wire57))) : wire8);
        end
      else
        begin
          if ($signed(({(8'hbe)} ?
              (wire7 ?
                  $signed($signed(wire5)) : ($unsigned((8'hb2)) != {wire7,
                      (8'hbc)})) : ((~$signed(wire6)) ?
                  (~wire9[(1'h1):(1'h1)]) : (wire5 ?
                      (wire57 & reg63) : (wire4 ? wire59 : wire7))))))
            begin
              reg63 <= ({(^~(wire6 ? {wire1} : reg63))} ?
                  wire1 : {$signed($signed((wire3 > wire8))),
                      ((~^(wire6 || wire59)) ^~ wire59[(1'h0):(1'h0)])});
              reg64 <= ((~^({wire3} + ($signed((7'h42)) ?
                  $unsigned(wire1) : reg63))) != $unsigned((((wire1 ^~ wire4) ~^ (~wire5)) - wire57[(3'h7):(1'h0)])));
              reg65 <= wire59;
            end
          else
            begin
              reg63 <= $unsigned($unsigned($unsigned($unsigned(wire57[(3'h7):(1'h0)]))));
              reg64 <= wire1[(4'hb):(3'h4)];
              reg65 <= reg64;
            end
          reg66 <= wire3;
          reg67 <= $signed(reg66);
          if ($unsigned((8'hb6)))
            begin
              reg68 <= $signed(wire59);
              reg69 <= (&$unsigned($unsigned(wire8)));
            end
          else
            begin
              reg68 <= ($unsigned((($unsigned(wire0) ?
                      (|wire7) : (~&wire57)) * $unsigned(wire6[(4'hf):(4'hd)]))) ?
                  (~($signed(wire6[(5'h13):(5'h12)]) != ((wire61 || reg68) ?
                      (^wire8) : reg63))) : (((wire8 == (reg62 <= wire59)) - (reg66 ?
                      $signed(reg66) : $unsigned((8'ha9)))) ^ reg67));
            end
        end
    end
  module70 #() modinst123 (.wire73(reg67), .wire71(wire3), .y(wire122), .wire74(wire7), .clk(clk), .wire72(wire1), .wire75(wire8));
endmodule

module module70
#(parameter param121 = ((^((8'hbd) ? (^(~^(8'ha3))) : (((7'h44) >> (8'hb2)) ? {(8'ha1), (8'hb7)} : {(7'h43)}))) != ((({(8'hb1)} > ((8'ha2) >= (7'h44))) ? (~|(^(8'hb6))) : ({(7'h42), (8'hb3)} || ((8'ha0) ? (8'hb9) : (8'had)))) ? ((&((7'h43) ? (8'hb2) : (8'hb4))) < (((8'hbf) >> (8'hba)) ? (!(8'hb1)) : ((7'h43) ? (8'hbb) : (8'hb3)))) : ((^((8'hbc) ? (8'ha0) : (8'hb4))) || (((8'hb6) ? (8'hb9) : (8'hb7)) ? ((8'haa) ? (8'hb3) : (8'haf)) : {(8'hb7), (8'h9e)})))))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire75;
  input wire [(4'hc):(1'h0)] wire74;
  input wire signed [(3'h4):(1'h0)] wire73;
  input wire [(4'hd):(1'h0)] wire72;
  input wire signed [(5'h12):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  assign y = {wire120,
                 wire118,
                 wire91,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire77,
                 wire76,
                 reg79,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 (1'h0)};
  assign wire76 = ((~&(wire72[(1'h0):(1'h0)] ?
                          ((wire75 ? wire75 : wire71) ?
                              (wire73 * wire71) : (-wire71)) : $signed((wire73 && wire72)))) ?
                      (wire73 ?
                          ({(wire75 ?
                                  wire75 : wire71)} < wire72) : wire71[(1'h0):(1'h0)]) : (&(!$signed(wire73))));
  assign wire77 = ((+((wire72 && {wire73, wire71}) ~^ (|$unsigned(wire72)))) ?
                      $signed(wire73) : wire76[(1'h1):(1'h0)]);
  assign wire78 = ((wire75 >>> $signed(wire77[(2'h3):(2'h2)])) ?
                      wire71 : wire77[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg79 <= {wire77, $unsigned((^(+(wire74 ? wire75 : wire75))))};
    end
  assign wire80 = ({(wire72 ? wire73 : {reg79, (-reg79)}),
                      $unsigned((wire72[(4'h8):(3'h7)] ^~ $unsigned(wire78)))} > {wire78[(2'h2):(1'h1)]});
  assign wire81 = wire75;
  assign wire82 = $unsigned(({wire76} == ((-wire81[(4'hb):(3'h7)]) ^~ wire71[(3'h6):(3'h5)])));
  always
    @(posedge clk) begin
      reg83 <= $signed(wire73[(2'h3):(1'h1)]);
      reg84 <= ($unsigned(wire77[(1'h1):(1'h1)]) >> ($unsigned($unsigned($signed(wire76))) <<< reg83[(3'h4):(2'h2)]));
      reg85 <= (~|wire72[(4'hc):(2'h3)]);
      if (wire75[(1'h0):(1'h0)])
        begin
          reg86 <= ($signed(wire82) ?
              wire76 : ($unsigned({((8'hb6) * wire77), (reg83 || (8'ha4))}) ?
                  wire80[(3'h5):(2'h2)] : wire71[(1'h0):(1'h0)]));
          if (((&wire73[(2'h2):(1'h0)]) ^ wire74[(1'h1):(1'h1)]))
            begin
              reg87 <= (!(~|(wire76 && {$signed((8'h9f)), wire76})));
            end
          else
            begin
              reg87 <= {$signed((wire80 ^~ ((8'hbc) ?
                      wire74[(2'h2):(1'h0)] : reg83))),
                  wire81[(5'h10):(4'h9)]};
            end
          reg88 <= (((^~$unsigned(((8'ha4) ^ reg83))) + wire72[(3'h5):(3'h5)]) ?
              ($unsigned({$signed(reg87), reg87[(3'h6):(3'h5)]}) ?
                  ($signed((wire81 >> (8'ha2))) >= reg79) : $unsigned(reg83)) : (&$signed((8'ha0))));
          reg89 <= wire74;
        end
      else
        begin
          reg86 <= wire71[(3'h4):(1'h0)];
        end
      reg90 <= $signed({$unsigned((7'h41))});
    end
  assign wire91 = (wire80[(3'h6):(1'h0)] ?
                      $signed((^~({wire80, reg90} ?
                          (reg87 ?
                              wire71 : reg86) : (wire74 && reg89)))) : ($unsigned(((wire76 * reg89) ?
                          wire82[(2'h2):(1'h1)] : (~^reg88))) * ((~&(reg86 ?
                              wire78 : wire72)) ?
                          wire72[(4'hb):(3'h7)] : $unsigned(reg88[(1'h0):(1'h0)]))));
  module92 #() modinst119 (.wire97(reg90), .wire94(wire74), .y(wire118), .clk(clk), .wire95(wire71), .wire93(wire72), .wire96(wire76));
  assign wire120 = wire71;
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire21;
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  assign y = {wire55,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire21,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(wire15) ^~ {$unsigned(((wire11 < wire15) ?
              wire11 : (!wire15)))}))
        begin
          if (wire12)
            begin
              reg16 <= wire11[(5'h13):(3'h5)];
              reg17 <= wire12;
              reg18 <= $unsigned(reg16[(1'h1):(1'h1)]);
              reg19 <= (~&$signed((wire15[(1'h1):(1'h0)] ?
                  (~^(&reg16)) : $unsigned((+wire15)))));
              reg20 <= reg17[(2'h2):(1'h1)];
            end
          else
            begin
              reg16 <= $signed($unsigned((wire12[(2'h3):(2'h2)] < $unsigned($unsigned(wire14)))));
              reg17 <= $unsigned((($unsigned((wire11 - reg17)) ?
                  reg17 : wire14) > $unsigned((-wire11))));
              reg18 <= $unsigned((wire15[(2'h2):(2'h2)] ?
                  ({{reg16}, (wire11 & (8'hb6))} == reg19) : wire14));
              reg19 <= (reg16 ?
                  $unsigned((reg20 ?
                      ((^~reg18) ? (8'hbf) : {reg17, wire12}) : ((8'ha6) ?
                          (wire12 ? wire11 : (8'hb0)) : (reg20 ?
                              (8'hb3) : reg18)))) : ({reg20} ?
                      reg16[(4'hc):(3'h6)] : ((~reg18) ?
                          (7'h44) : $signed($unsigned(wire14)))));
            end
        end
      else
        begin
          reg16 <= {(-$unsigned(reg20[(1'h0):(1'h0)]))};
        end
    end
  assign wire21 = wire11;
  always
    @(posedge clk) begin
      reg22 <= ((8'ha8) <<< $signed((~^reg19[(1'h0):(1'h0)])));
    end
  assign wire23 = $signed({reg19});
  assign wire24 = $signed(((|($unsigned(reg16) < (reg18 || wire13))) >>> {(8'hb2),
                      (((8'ha2) ? reg19 : wire13) ?
                          wire15[(1'h1):(1'h1)] : (|wire23))}));
  assign wire25 = ($unsigned((&wire21[(3'h4):(2'h3)])) ?
                      (wire13 ?
                          wire14[(4'ha):(4'h9)] : (~|wire12[(1'h1):(1'h0)])) : $unsigned($unsigned(($signed(wire13) ?
                          $unsigned(wire13) : (reg17 ? wire23 : reg22)))));
  assign wire26 = $unsigned($signed($unsigned(reg19)));
  assign wire27 = ({$signed(wire24[(1'h0):(1'h0)]),
                      {(~^(8'haa)),
                          $signed((^~wire13))}} || ($unsigned(($signed(reg22) ?
                          ((8'ha2) ? wire21 : wire12) : reg17)) ?
                      $unsigned($unsigned({wire23,
                          wire24})) : $unsigned(((wire13 < wire11) ?
                          $unsigned(reg16) : reg17))));
  assign wire28 = reg17;
  assign wire29 = wire25;
  assign wire30 = $signed((wire11 + reg19[(3'h5):(2'h2)]));
  module31 #() modinst56 (.wire36(wire11), .clk(clk), .wire35(wire28), .wire34(wire25), .y(wire55), .wire32(reg19), .wire33(wire23));
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire36;
  input wire signed [(3'h7):(1'h0)] wire35;
  input wire [(5'h13):(1'h0)] wire34;
  input wire signed [(4'ha):(1'h0)] wire33;
  input wire signed [(5'h12):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((8'haa) << wire36[(4'h8):(1'h0)]))
        begin
          reg37 <= ($unsigned((+(((8'hb6) ? wire36 : (7'h40)) ?
              (wire32 ? wire32 : wire32) : wire35))) ~^ (~$unsigned(wire36)));
          if ($signed(reg37))
            begin
              reg38 <= {wire35, (8'hab)};
            end
          else
            begin
              reg38 <= (^(+({$signed(reg37),
                  (wire34 ? wire32 : wire35)} << reg37[(1'h1):(1'h0)])));
              reg39 <= wire35;
              reg40 <= reg38;
              reg41 <= {($unsigned((&$unsigned(wire35))) ?
                      ($signed(reg39[(4'hd):(3'h6)]) ?
                          $signed({wire32, wire36}) : (((8'hbf) >>> wire33) ?
                              $unsigned(reg37) : $signed(wire34))) : $signed($signed($signed(reg37)))),
                  $unsigned(($unsigned((-reg37)) ?
                      {(wire35 ^~ reg40)} : $signed((wire33 > reg38))))};
              reg42 <= wire33[(2'h3):(2'h3)];
            end
          reg43 <= reg42;
          reg44 <= {wire36[(4'h8):(3'h5)], $signed(reg41[(4'he):(3'h5)])};
          reg45 <= $signed($signed((~&$signed(reg43))));
        end
      else
        begin
          reg37 <= ($signed($unsigned($unsigned((8'ha6)))) * wire33);
        end
      reg46 <= (wire36 >>> ((((wire34 || reg38) || wire32[(5'h10):(4'hf)]) ?
          ((&reg37) >= (~&wire32)) : ((|reg39) <= $unsigned(reg44))) >>> {$signed($unsigned(wire34)),
          reg45[(3'h6):(3'h6)]}));
      reg47 <= reg45[(3'h7):(3'h5)];
    end
  assign wire48 = ({$unsigned(($unsigned(reg43) - $signed(wire35))),
                      ($unsigned(((8'hbc) ?
                          reg38 : reg42)) < reg46)} >= (reg40[(4'h9):(2'h3)] ?
                      wire34[(2'h3):(1'h0)] : reg47[(4'hd):(4'h9)]));
  assign wire49 = ($unsigned((&(~reg40))) << (8'h9f));
  assign wire50 = (8'ha3);
  assign wire51 = (wire33[(1'h0):(1'h0)] ?
                      $unsigned($signed((8'hbc))) : $unsigned(($signed((~|reg44)) ?
                          reg38[(2'h3):(2'h3)] : (wire33[(1'h1):(1'h0)] ?
                              $signed((8'hb0)) : reg46[(1'h1):(1'h0)]))));
  assign wire52 = (^~($unsigned($unsigned(reg43)) & wire34[(3'h4):(1'h0)]));
  assign wire53 = (reg43 ?
                      $unsigned((wire48 ?
                          {reg39[(4'hc):(4'h9)],
                              reg43} : wire51[(4'h9):(3'h7)])) : ((((reg43 || wire50) ^ reg45[(3'h4):(1'h1)]) ?
                          $unsigned({wire52,
                              wire32}) : $unsigned($signed(reg41))) > reg43));
  assign wire54 = wire34;
endmodule

module module92  (y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire97;
  input wire signed [(5'h13):(1'h0)] wire96;
  input wire signed [(5'h11):(1'h0)] wire95;
  input wire signed [(4'hc):(1'h0)] wire94;
  input wire [(4'hd):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire101;
  wire signed [(3'h7):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  assign y = {wire117,
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
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg116,
                 reg115,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire98 = (($unsigned(wire93[(4'h9):(3'h4)]) ?
                      (wire97 ?
                          (!$signed((8'hb1))) : $signed($unsigned((8'hbc)))) : $unsigned({wire95[(2'h3):(2'h2)]})) ^ $signed(wire95[(2'h2):(1'h0)]));
  assign wire99 = $unsigned(wire97[(1'h0):(1'h0)]);
  assign wire100 = wire99;
  assign wire101 = $unsigned($signed(wire96));
  always
    @(posedge clk) begin
      reg102 <= wire94[(1'h1):(1'h0)];
      reg103 <= $signed(($signed($signed((wire95 ?
          (8'h9c) : wire94))) == (($signed(wire94) ?
              (wire101 ? wire99 : wire95) : $unsigned(wire93)) ?
          {$signed(wire98)} : wire99)));
      reg104 <= ($signed(((&(reg103 | (8'ha3))) ?
          wire97 : wire94[(2'h3):(2'h3)])) == (~^wire94[(4'ha):(2'h2)]));
    end
  assign wire105 = (($signed({$unsigned(wire100), (wire98 <= wire101)}) ?
                           $unsigned(reg104[(3'h5):(3'h4)]) : ($unsigned((reg102 ?
                               reg103 : wire96)) | wire95[(4'h8):(1'h0)])) ?
                       ((wire93 ?
                           ((wire101 ? wire99 : (8'hb6)) ?
                               $signed(wire100) : (wire98 <= wire97)) : $unsigned($unsigned(wire99))) < (reg102 < wire97[(4'ha):(2'h2)])) : ($unsigned(((wire95 <<< wire100) << (&wire97))) <= (({wire100,
                               wire101} ?
                           (wire95 ? wire93 : wire99) : ((8'haf) ?
                               wire97 : wire99)) ^ reg102[(1'h0):(1'h0)])));
  assign wire106 = $signed(wire93[(4'h8):(2'h2)]);
  assign wire107 = (($signed((wire98 | {wire99})) ?
                       $signed((!wire97[(3'h4):(1'h1)])) : $signed($signed({wire97}))) || reg103);
  assign wire108 = wire97;
  assign wire109 = {($unsigned((&$signed((8'hbe)))) ~^ (wire96 || (~|(^wire94)))),
                       wire108};
  assign wire110 = $unsigned((~^($unsigned((^~(8'hb1))) ?
                       (wire106[(2'h3):(2'h3)] ?
                           ((8'ha9) ?
                               wire98 : wire108) : $unsigned(wire106)) : (wire95[(3'h4):(2'h2)] ?
                           wire97[(3'h5):(2'h2)] : {(8'h9c), reg102}))));
  assign wire111 = wire110;
  assign wire112 = (wire111[(1'h1):(1'h0)] != {wire105,
                       $signed($unsigned(reg102[(3'h4):(1'h0)]))});
  assign wire113 = ((((~|$signed(wire111)) >= $unsigned($signed(wire105))) ?
                       $signed($unsigned((wire98 | wire111))) : (~^wire107[(4'h8):(4'h8)])) << wire97);
  assign wire114 = {(&(!($unsigned(wire105) ? (~(8'h9e)) : wire112))), (8'haa)};
  always
    @(posedge clk) begin
      reg115 <= wire106[(4'h9):(2'h2)];
      reg116 <= $unsigned(((reg104[(4'h8):(3'h7)] >= $unsigned($signed((8'ha0)))) ?
          wire101[(3'h5):(3'h5)] : (wire95 ?
              ($signed(wire107) - (wire113 >= wire113)) : wire107[(2'h3):(2'h3)])));
    end
  assign wire117 = wire101[(3'h5):(3'h4)];
endmodule
