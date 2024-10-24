module top
#(parameter param107 = ((8'ha0) ? (((((8'ha2) ? (8'hbb) : (8'h9f)) ? (~(8'hb9)) : ((8'hbf) ? (8'ha6) : (8'ha2))) << {(~(8'ha6))}) ? ((~|{(8'hb0), (8'h9d)}) | ((&(8'ha7)) ? (8'hb8) : ((8'ha2) >>> (8'hb3)))) : ((^(~^(8'hb9))) * (((7'h44) ? (8'hb1) : (8'hb2)) - (~(8'hb4))))) : ((({(8'hbd), (8'haa)} ? (-(8'hb7)) : (~^(8'ha5))) ^ (|(~&(7'h40)))) ? (~((~(8'hb8)) ? (~&(8'hbd)) : ((8'ha0) ? (8'haf) : (8'ha8)))) : (!(8'hac)))), 
parameter param108 = (-param107))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire105;
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  assign y = {wire4,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire23,
                 wire24,
                 wire32,
                 wire105,
                 reg5,
                 reg6,
                 reg7,
                 reg20,
                 reg21,
                 reg22,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 (1'h0)};
  assign wire4 = ((({wire2, $signed(wire3)} ?
                             $unsigned((!wire1)) : wire0[(2'h2):(1'h0)]) ?
                         $signed(($unsigned(wire0) ~^ {wire0})) : (wire1[(3'h4):(1'h0)] ?
                             (|((8'ha1) ^ wire2)) : wire1)) ?
                     ({{wire1[(3'h5):(1'h1)]}, (^(wire1 ~^ wire2))} ?
                         wire3[(4'hc):(3'h6)] : $signed((&wire0[(3'h4):(3'h4)]))) : (~&(((wire3 ?
                             (8'ha6) : (8'had)) ?
                         (wire3 && wire2) : wire1[(2'h3):(1'h0)]) ~^ (~|$unsigned(wire3)))));
  always
    @(posedge clk) begin
      reg5 <= $unsigned(($unsigned(wire1[(4'h8):(4'h8)]) > {$unsigned($unsigned(wire3)),
          (wire2 ? (!wire2) : wire4)}));
      reg6 <= $signed({{((wire4 ^~ wire2) ? (wire2 <<< wire1) : (~|reg5)),
              reg5}});
      reg7 <= wire0;
    end
  assign wire8 = (^~((^wire1[(3'h5):(2'h2)]) & wire1));
  assign wire9 = (&(wire0[(3'h4):(1'h1)] ?
                     wire2 : (!$signed($unsigned(wire8)))));
  assign wire10 = $signed((8'hb6));
  assign wire11 = ((&(+reg5)) ?
                      (($unsigned(wire9[(1'h0):(1'h0)]) ^~ $signed((reg7 << wire4))) ~^ wire0) : $unsigned({(~&$signed(wire9)),
                          reg5}));
  assign wire12 = (^~($signed(reg5) << wire10));
  assign wire13 = $unsigned((~&wire1[(4'h8):(3'h6)]));
  assign wire14 = wire8[(3'h7):(3'h7)];
  assign wire15 = $unsigned(((+{(reg5 ? reg6 : (7'h41)), wire8}) ?
                      $unsigned($signed(wire10[(3'h7):(3'h5)])) : $signed({(wire2 || wire0),
                          $signed(wire1)})));
  assign wire16 = {wire3[(1'h0):(1'h0)],
                      $unsigned($unsigned((((8'ha7) ^ wire11) ?
                          $unsigned(wire9) : (+wire3))))};
  assign wire17 = {(~^(reg7 ?
                          (~^wire3[(3'h7):(2'h2)]) : wire9[(3'h4):(2'h2)]))};
  assign wire18 = wire13;
  assign wire19 = wire15;
  always
    @(posedge clk) begin
      reg20 <= (~^wire0[(1'h1):(1'h1)]);
      reg21 <= $signed(($signed(wire13[(4'ha):(2'h3)]) ?
          {(8'hbe)} : $signed((8'h9d))));
      reg22 <= $unsigned((wire13[(4'hb):(3'h5)] > ({(~wire12),
          $signed(wire13)} - wire14[(1'h1):(1'h0)])));
    end
  assign wire23 = {wire4};
  assign wire24 = $signed(wire11);
  always
    @(posedge clk) begin
      if ({({$signed($unsigned(wire8))} >= wire23[(2'h2):(2'h2)]),
          (^~{({reg20} ?
                  wire16[(5'h11):(1'h1)] : ((8'hb2) ? wire13 : wire24))})})
        begin
          reg25 <= reg7;
          reg26 <= {((~(8'ha4)) >>> wire19[(4'he):(4'h8)])};
          reg27 <= $signed((~|wire24));
          reg28 <= reg7;
        end
      else
        begin
          if ($signed($signed($signed(((wire18 ? wire18 : wire3) ?
              (8'hac) : $unsigned(wire9))))))
            begin
              reg25 <= (wire11[(1'h0):(1'h0)] & wire24[(3'h5):(3'h5)]);
            end
          else
            begin
              reg25 <= (-(8'hb2));
              reg26 <= (^(((7'h44) > wire19[(1'h1):(1'h0)]) << $signed($signed({(8'ha4),
                  reg7}))));
            end
          if (reg26[(1'h0):(1'h0)])
            begin
              reg27 <= $unsigned((!(((reg7 ? wire2 : wire0) ?
                      (~|(8'hbe)) : wire11) ?
                  ($unsigned(wire4) ?
                      (wire8 ?
                          reg28 : reg5) : (wire23 <<< (7'h44))) : $signed((reg27 ?
                      (8'ha9) : wire17)))));
              reg28 <= wire18;
              reg29 <= wire2[(3'h7):(3'h7)];
              reg30 <= {((((!reg26) * $unsigned(wire24)) ?
                      $unsigned(wire8[(4'h8):(2'h3)]) : $signed($signed(wire8))) < wire24[(4'h9):(3'h4)]),
                  wire17};
              reg31 <= ($signed((8'hb2)) ^~ (wire4 < (wire16 <<< $signed((wire2 ?
                  wire24 : wire1)))));
            end
          else
            begin
              reg27 <= (^$signed(reg5[(5'h11):(2'h3)]));
            end
        end
    end
  assign wire32 = reg21;
  module33 #() modinst106 (.wire34(wire4), .y(wire105), .wire37(wire11), .wire35(wire14), .clk(clk), .wire36(reg7));
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire37;
  input wire signed [(4'hb):(1'h0)] wire36;
  input wire [(4'hb):(1'h0)] wire35;
  input wire [(4'hf):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire103;
  wire [(5'h13):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire55;
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire101,
                 wire69,
                 wire68,
                 wire60,
                 wire57,
                 wire55,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg59,
                 reg58,
                 (1'h0)};
  module38 #() modinst56 (.wire40(wire34), .wire41(wire36), .clk(clk), .y(wire55), .wire42(wire37), .wire39(wire35));
  assign wire57 = wire37;
  always
    @(posedge clk) begin
      reg58 <= $signed(($unsigned({(wire37 ~^ wire55)}) ?
          $unsigned(((!wire34) == (wire37 ?
              wire35 : (8'hb2)))) : (~&(wire55[(5'h14):(4'ha)] ?
              {wire37, wire57} : {wire36, wire55}))));
      reg59 <= (wire36[(1'h0):(1'h0)] ?
          (reg58[(1'h1):(1'h0)] + wire34) : (wire36[(4'ha):(4'h9)] ?
              wire37[(2'h2):(1'h0)] : ($unsigned((wire37 <<< reg58)) << (wire57[(2'h3):(1'h0)] >= wire36[(4'h8):(3'h7)]))));
    end
  assign wire60 = (!$unsigned(($signed($unsigned(wire55)) - (|wire55[(5'h12):(4'hf)]))));
  always
    @(posedge clk) begin
      if ($signed($signed((~(|$unsigned(wire34))))))
        begin
          reg61 <= (wire55[(4'hb):(3'h4)] ?
              (reg58 ?
                  ((wire37[(1'h1):(1'h1)] || reg58[(2'h3):(1'h0)]) ?
                      $unsigned($signed(reg59)) : $signed({wire57})) : $unsigned((~|(wire35 ?
                      (8'ha4) : wire60)))) : ({(~^$signed((8'hab)))} ?
                  reg58[(2'h2):(2'h2)] : wire36[(3'h6):(3'h6)]));
          reg62 <= $signed((!(($unsigned(wire36) >>> $unsigned((8'hbd))) ?
              (-(^reg59)) : ((wire35 ?
                  reg59 : (8'hbb)) == (wire57 < wire55)))));
        end
      else
        begin
          reg61 <= $unsigned($signed($signed(reg58)));
          if (wire35)
            begin
              reg62 <= $signed((^~(|reg58[(1'h1):(1'h1)])));
              reg63 <= reg62;
              reg64 <= $unsigned((~&$signed(wire57)));
              reg65 <= (8'ha4);
              reg66 <= {$signed((((&wire35) == $unsigned(reg65)) ?
                      (8'ha1) : (reg58 ? $signed(wire57) : {wire35})))};
            end
          else
            begin
              reg62 <= wire36;
            end
        end
      reg67 <= ($unsigned(($unsigned((wire35 ? (8'h9f) : wire60)) ^~ reg66)) ?
          $signed(reg61[(3'h5):(2'h3)]) : ((~&($unsigned(reg61) ?
                  (reg62 ? wire35 : reg64) : $unsigned(reg65))) ?
              reg62 : reg62));
    end
  assign wire68 = $signed($unsigned(reg67[(3'h6):(3'h6)]));
  assign wire69 = $unsigned($unsigned((!$unsigned($unsigned(wire55)))));
  module70 #() modinst102 (wire101, clk, wire60, wire34, reg65, reg63);
  assign wire103 = (&$unsigned((8'hb5)));
  assign wire104 = $signed(((((8'hbf) ?
                           $unsigned(wire57) : wire101[(4'hb):(3'h5)]) >= (8'haf)) ?
                       $signed((wire57 ?
                           {wire101} : (reg67 ?
                               wire55 : reg65))) : $signed($unsigned(wire57[(3'h5):(3'h5)]))));
endmodule

module module70
#(parameter param99 = (!({(8'ha6), (~|(!(8'hbc)))} << ((&((8'h9d) ^~ (8'ha0))) | (8'hbd)))), 
parameter param100 = param99)
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire74;
  input wire signed [(4'hb):(1'h0)] wire73;
  input wire [(4'hf):(1'h0)] wire72;
  input wire signed [(3'h7):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire98;
  wire signed [(3'h6):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire75;
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire75,
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
                 (1'h0)};
  assign wire75 = (|wire72);
  always
    @(posedge clk) begin
      if (({{(!(7'h44)), $unsigned(wire73)}} ^~ (wire74[(3'h7):(1'h1)] ?
          wire73[(3'h6):(3'h6)] : (~&(!wire74)))))
        begin
          if (($signed((($unsigned(wire74) <<< {wire71}) && (wire73[(2'h2):(2'h2)] ?
              $unsigned(wire71) : (^wire71)))) == ((($signed((8'had)) * (8'hb3)) < ((8'hbc) == (wire71 >> wire74))) ^ $unsigned(wire74))))
            begin
              reg76 <= $signed((($signed($signed((8'had))) <<< $signed(wire75)) || wire71));
              reg77 <= wire75[(5'h10):(2'h3)];
              reg78 <= (($unsigned(((reg76 * wire73) && wire75[(4'h8):(3'h7)])) ?
                      (~$unsigned($signed(wire72))) : wire74) ?
                  ($signed(wire71[(3'h7):(2'h3)]) ~^ (|{(^~wire75),
                      wire74[(4'hc):(4'h8)]})) : $signed(wire72[(2'h3):(1'h1)]));
              reg79 <= $signed(wire74);
            end
          else
            begin
              reg76 <= reg79;
              reg77 <= (~&$unsigned($signed({$signed(wire75),
                  reg76[(4'h9):(4'h9)]})));
              reg78 <= wire74;
              reg79 <= $unsigned($signed(($signed(reg78[(3'h5):(3'h5)]) ?
                  (reg76 ?
                      (~^wire73) : wire73) : $unsigned($unsigned(reg76)))));
            end
          reg80 <= (~^($unsigned((~(wire73 ?
              reg77 : wire72))) | (|$signed(wire71[(2'h3):(2'h2)]))));
          reg81 <= $signed(wire74[(1'h0):(1'h0)]);
          reg82 <= reg80;
        end
      else
        begin
          reg76 <= reg80;
        end
      reg83 <= $signed(({(&(reg77 != wire74)), $unsigned($unsigned(reg79))} ?
          wire74 : $unsigned(reg79[(2'h2):(1'h0)])));
      reg84 <= ($unsigned($unsigned($unsigned(wire74[(2'h3):(2'h3)]))) <= ((7'h41) ?
          (&($unsigned(reg79) >= (wire71 >>> reg79))) : (wire75 << $unsigned(wire75))));
      if (((~&(wire74[(4'hb):(1'h0)] ^~ $unsigned(wire71[(1'h0):(1'h0)]))) ?
          reg84[(2'h2):(1'h1)] : (reg83[(4'hd):(3'h4)] ?
              (((wire71 - reg78) ?
                  {reg82, reg77} : $signed(reg79)) == (~^(reg80 ?
                  wire75 : reg83))) : $signed((wire73 + (^wire72))))))
        begin
          reg85 <= ((&wire73) >> ((!(|reg77)) ? (|reg80) : reg84));
          reg86 <= (^~((8'hba) < ($unsigned($signed(reg77)) ?
              reg84[(2'h2):(1'h1)] : {{(8'hb9), wire74}})));
        end
      else
        begin
          reg85 <= reg76[(3'h6):(3'h4)];
          reg86 <= (($unsigned($signed(wire74[(2'h3):(1'h0)])) ^~ wire74[(4'hd):(1'h0)]) - reg84[(2'h2):(1'h0)]);
          if (((!$signed((!reg78[(4'h8):(3'h4)]))) + reg81))
            begin
              reg87 <= (~$unsigned(($signed(reg79) >>> reg81)));
              reg88 <= (-reg86);
              reg89 <= {(~|wire73[(4'h8):(3'h4)]),
                  $unsigned($signed($unsigned(reg81)))};
              reg90 <= {$signed((&reg80[(5'h10):(4'ha)])),
                  $signed(($unsigned((~|reg77)) ?
                      (~&(reg83 >= reg88)) : reg85))};
            end
          else
            begin
              reg87 <= $signed($unsigned({($signed(reg83) ?
                      (wire73 ? wire73 : wire75) : reg77),
                  reg76}));
              reg88 <= reg85;
              reg89 <= $signed(reg83[(1'h1):(1'h1)]);
              reg90 <= (~|reg83);
            end
          reg91 <= reg83[(4'he):(4'hb)];
          if (reg76)
            begin
              reg92 <= ($unsigned(((7'h42) ?
                  (((8'ha0) <= (7'h40)) ?
                      (wire71 ?
                          reg76 : wire75) : $signed(reg81)) : $unsigned(reg82[(3'h4):(2'h3)]))) <= $unsigned((wire75[(4'h8):(3'h5)] ?
                  ((reg76 ? reg77 : reg77) ?
                      $unsigned(reg91) : (reg88 ~^ reg83)) : (|{reg90}))));
              reg93 <= $signed((reg82 ?
                  {reg87, (!reg76)} : reg89[(2'h3):(2'h3)]));
              reg94 <= (reg81[(2'h3):(2'h3)] ?
                  (wire75[(4'hb):(3'h6)] ?
                      reg86[(4'h8):(1'h0)] : $unsigned(reg76)) : $unsigned(reg87[(1'h0):(1'h0)]));
              reg95 <= ((reg76 ? {(!$signed(reg80)), reg88} : (8'ha2)) ?
                  {(reg86 & $signed((reg89 ? reg86 : reg88))),
                      $unsigned(((reg88 ? reg89 : reg91) ^~ (wire74 ?
                          (8'hb4) : reg91)))} : ((((~^reg82) ?
                              (reg87 * reg86) : $signed(reg77)) ?
                          ((~(8'ha4)) ?
                              $signed(reg76) : reg76[(2'h3):(2'h3)]) : $unsigned($signed(wire75))) ?
                      (reg83 ?
                          (^~(reg78 ?
                              (8'hbe) : (8'hba))) : (wire73 - $signed(wire75))) : reg80));
            end
          else
            begin
              reg92 <= (($signed($signed(reg92)) ?
                  (&reg92) : reg79[(3'h7):(2'h3)]) - $unsigned($unsigned(reg80[(4'h8):(3'h4)])));
              reg93 <= ((~&$signed(reg80[(4'hd):(2'h3)])) >>> $signed($unsigned((8'ha4))));
              reg94 <= {$signed($unsigned(($signed(reg80) ?
                      (reg88 ? reg91 : (8'ha3)) : (&(8'ha2))))),
                  $unsigned($unsigned(reg91[(3'h4):(1'h1)]))};
              reg95 <= reg77;
            end
        end
    end
  assign wire96 = {($unsigned((~|((8'hac) ? reg88 : reg88))) ?
                          ($unsigned((reg84 | reg94)) > $signed($unsigned(reg81))) : (reg93 & ($unsigned(reg92) ?
                              $unsigned(reg84) : reg82))),
                      (((^reg84[(2'h2):(1'h1)]) ?
                              $unsigned((!reg78)) : (reg91[(3'h6):(1'h1)] ?
                                  (^~wire75) : reg81[(5'h13):(5'h13)])) ?
                          $unsigned((&(8'hac))) : reg93[(1'h0):(1'h0)])};
  assign wire97 = ({(reg79 ? $signed($signed(reg89)) : wire75[(1'h0):(1'h0)])} ?
                      (((8'ha7) ?
                          (!(reg84 ^~ wire74)) : (^~wire96[(3'h5):(3'h5)])) & ((+$unsigned((8'hb6))) << (reg80[(4'hd):(1'h1)] ?
                          (reg92 <<< wire71) : (reg86 ?
                              reg94 : reg87)))) : (reg86 == $unsigned(reg84[(1'h0):(1'h0)])));
  assign wire98 = $signed(($signed((^~reg88)) ?
                      wire97[(3'h6):(3'h4)] : $signed(wire74[(2'h2):(1'h1)])));
endmodule

module module38
#(parameter param54 = ((8'hae) >>> ((8'ha2) ^ {(~(|(7'h42))), (((8'hb2) ? (8'hb6) : (8'hac)) ? {(7'h41)} : (^~(7'h40)))})))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire42;
  input wire [(4'hb):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire40;
  input wire [(4'hb):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire43;
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire45,
                 wire44,
                 wire43,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire43 = wire39;
  assign wire44 = ($signed((($signed((8'ha9)) ?
                      ((8'hac) & wire40) : (+wire39)) ~^ wire40[(3'h4):(2'h2)])) | $unsigned($signed(($signed(wire42) ?
                      (wire40 ? wire41 : (8'hba)) : wire40[(3'h7):(3'h4)]))));
  assign wire45 = {wire44[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg46 <= ($unsigned($unsigned(wire41[(3'h6):(2'h3)])) << wire40);
      reg47 <= wire42[(3'h4):(1'h0)];
    end
  assign wire48 = wire42;
  assign wire49 = (((((~wire40) ?
                              wire44[(3'h5):(1'h0)] : wire42[(3'h4):(2'h2)]) ?
                          $signed($unsigned((8'ha7))) : $signed($unsigned(reg47))) || $signed($signed($signed(wire40)))) ?
                      $unsigned(((&wire41[(2'h3):(1'h1)]) - wire39)) : ($unsigned((^(wire40 | reg46))) == (8'h9d)));
  assign wire50 = (wire40 ? wire45 : $unsigned((^~(!$unsigned((8'hb3))))));
  assign wire51 = ($unsigned((reg46[(5'h11):(4'hd)] != wire45[(4'ha):(2'h2)])) ?
                      ($unsigned($unsigned({wire42,
                          wire42})) >>> (~|((^~wire40) || $unsigned(wire49)))) : $signed($unsigned(($signed(wire39) ^~ $unsigned(wire43)))));
  assign wire52 = wire42;
  assign wire53 = (~|wire43);
endmodule
