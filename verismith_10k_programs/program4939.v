module top
#(parameter param100 = ((({(^~(8'had)), {(8'ha6), (8'hab)}} ? (((8'hb3) > (8'h9f)) ? ((7'h40) ? (8'hb3) : (8'ha6)) : ((8'haf) > (8'hab))) : (((8'ha3) ^~ (8'hb2)) ? ((8'hbb) ? (8'h9c) : (8'hb2)) : (&(8'ha2)))) ^~ (|(&((8'hbd) ? (7'h42) : (8'h9f))))) ? ((!{(8'ha3), ((8'hb0) ? (8'hb5) : (8'ha9))}) ^~ ((((8'ha6) ? (8'hba) : (8'hb9)) ? (!(8'ha0)) : ((8'hab) + (8'hb4))) ? (((7'h42) ? (8'ha8) : (8'ha2)) ? ((7'h41) ^ (8'ha2)) : {(8'ha5), (8'h9f)}) : ({(8'haf)} ? ((8'hb7) ^~ (8'ha3)) : ((8'hab) ? (8'haf) : (8'hb6))))) : (((((8'hb0) || (8'hb8)) << (!(8'h9f))) * (8'ha9)) == ((~|((8'hb7) * (8'haf))) ^~ (((7'h43) <<< (7'h41)) + (8'had))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire98;
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire24,
                 wire98,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = wire3;
  assign wire6 = (wire0 ? wire2 : wire3);
  assign wire7 = (wire0[(2'h3):(2'h3)] - $signed((wire4[(4'hb):(3'h7)] ?
                     (!$signed(wire3)) : (^~$unsigned(wire1)))));
  assign wire8 = $signed($signed((~&$signed((8'ha4)))));
  always
    @(posedge clk) begin
      reg9 <= wire1;
      reg10 <= ($signed($unsigned($signed(wire2[(3'h5):(2'h3)]))) & $signed(reg9[(1'h0):(1'h0)]));
      reg11 <= ({wire8} * (!$signed($unsigned($signed(reg10)))));
      if (wire6)
        begin
          reg12 <= $signed((^wire6[(5'h10):(2'h2)]));
          reg13 <= $signed($unsigned(wire8));
          if ((reg10 == $signed({((reg11 || (8'ha9)) << $signed(reg13))})))
            begin
              reg14 <= wire2;
              reg15 <= reg11;
              reg16 <= ({(((|wire4) >= (!reg12)) ?
                      (^$signed(wire1)) : $signed(((8'haf) > wire4))),
                  ($unsigned(((8'hab) <<< reg13)) & {wire2[(2'h3):(2'h2)],
                      (wire7 ?
                          wire4 : reg9)})} >= $signed(((reg13 ^ $unsigned((8'hb4))) ?
                  (wire5 ^ $unsigned((8'ha4))) : {wire7[(3'h6):(3'h6)],
                      $signed(reg9)})));
              reg17 <= (((wire3[(4'hf):(1'h0)] ?
                          reg12[(5'h14):(4'h9)] : wire6[(4'hf):(3'h6)]) ?
                      wire3[(4'hc):(2'h3)] : $signed($signed((reg14 & reg11)))) ?
                  (-($signed($unsigned(wire4)) ?
                      $unsigned(reg11[(2'h3):(1'h1)]) : (wire3 << $signed(wire5)))) : wire3);
              reg18 <= reg12[(4'hf):(4'hf)];
            end
          else
            begin
              reg14 <= {(-reg10)};
              reg15 <= $unsigned((+reg9[(3'h4):(2'h3)]));
              reg16 <= {(reg11[(4'hd):(4'hd)] ?
                      reg16[(1'h0):(1'h0)] : $unsigned(wire8))};
              reg17 <= reg10[(4'hb):(2'h2)];
              reg18 <= (wire7 ?
                  $signed((wire8 ?
                      $unsigned((reg10 <<< wire7)) : ((wire2 == wire5) ?
                          (+wire0) : ((8'hbb) > (7'h41))))) : $signed((~&(8'hb5))));
            end
          if ($signed(reg18[(3'h4):(3'h4)]))
            begin
              reg19 <= $unsigned(reg13);
              reg20 <= reg12[(5'h13):(1'h1)];
              reg21 <= wire2;
            end
          else
            begin
              reg19 <= (8'hbe);
              reg20 <= reg9[(1'h0):(1'h0)];
              reg21 <= wire3[(4'hb):(2'h2)];
              reg22 <= {reg9[(1'h1):(1'h0)], $signed(reg19[(5'h14):(5'h12)])};
            end
          reg23 <= wire2[(4'hb):(4'hb)];
        end
      else
        begin
          if ((|((~&$unsigned(reg15)) ? reg15 : $signed(wire4))))
            begin
              reg12 <= $unsigned(wire2[(3'h5):(1'h1)]);
            end
          else
            begin
              reg12 <= $signed((+(reg14 ~^ $signed($unsigned((8'ha3))))));
            end
          reg13 <= reg17[(1'h1):(1'h0)];
          if ((((($signed(reg10) ?
                  (reg16 ?
                      wire6 : wire3) : $unsigned(wire4)) | $unsigned((reg9 ?
                  (8'ha0) : reg9))) >= ($unsigned(reg11[(3'h7):(2'h3)]) ?
                  $unsigned(reg22[(4'hc):(4'hc)]) : reg19)) ?
              ($unsigned($signed((wire7 - reg18))) || (^~(!(^(8'ha8))))) : {($unsigned($signed(reg19)) ^~ wire2)}))
            begin
              reg14 <= ({{$unsigned({wire4}), $signed(reg11)}} ?
                  ($unsigned(wire5) ?
                      reg23 : ($unsigned((8'h9f)) <= (reg9[(1'h0):(1'h0)] && (8'hae)))) : $unsigned(wire6[(3'h6):(2'h3)]));
              reg15 <= ($signed({({reg17} ? {wire4} : $signed((8'hb9)))}) ?
                  $signed({$unsigned(reg15[(3'h4):(3'h4)])}) : wire8);
              reg16 <= reg9;
              reg17 <= $signed(((((reg18 ? wire8 : wire1) ?
                          (~|wire3) : (-reg23)) ?
                      {$signed(reg17),
                          (&(7'h42))} : $unsigned(((7'h42) >>> wire2))) ?
                  $signed(({wire8,
                      (8'hbc)} ^ (wire1 > (8'ha7)))) : (reg10 ^~ reg14[(4'hc):(4'h8)])));
            end
          else
            begin
              reg14 <= $signed($unsigned(($unsigned(wire6[(4'hf):(4'hd)]) > $unsigned($signed(reg17)))));
              reg15 <= (-((reg19 ?
                  (((8'hba) >= reg19) ? (+(8'hb9)) : (~^reg16)) : ((reg20 ?
                      (8'hb9) : wire7) <= (~&wire1))) ~^ reg15[(1'h1):(1'h0)]));
              reg16 <= wire0;
              reg17 <= $unsigned($unsigned((-(reg17 & $unsigned(reg17)))));
              reg18 <= wire3[(4'hc):(3'h4)];
            end
        end
    end
  assign wire24 = {(reg23[(4'h9):(3'h4)] <= wire8[(3'h6):(1'h0)])};
  module25 #() modinst99 (wire98, clk, reg17, reg9, reg20, wire5);
endmodule

module module25  (y, clk, wire26, wire27, wire28, wire29);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire27;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire57;
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire94,
                 wire59,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire57,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire30 = $unsigned((~wire27[(4'hd):(4'ha)]));
  assign wire31 = ((^(^$unsigned((wire29 ^~ wire30)))) ^ ((-((wire26 > wire30) & $unsigned(wire26))) ?
                      $unsigned(wire26[(1'h0):(1'h0)]) : ({(wire29 - wire30)} > $signed(wire30))));
  assign wire32 = wire30[(3'h4):(2'h3)];
  assign wire33 = (&wire32);
  assign wire34 = (!(($unsigned((wire30 ? (8'haa) : wire31)) ?
                          wire31[(1'h1):(1'h1)] : $signed((!wire30))) ?
                      {{$unsigned((8'hbc)), (-wire27)},
                          $signed({wire29, wire32})} : ({wire33[(1'h0):(1'h0)],
                              (wire26 || wire27)} ?
                          wire28 : (wire27[(3'h4):(1'h0)] <<< (wire26 ?
                              (8'hb8) : wire27)))));
  assign wire35 = (wire31[(2'h2):(1'h0)] | (^~wire29));
  module36 #() modinst58 (.wire37(wire35), .wire41(wire28), .wire39(wire26), .y(wire57), .wire38(wire27), .clk(clk), .wire40(wire31));
  assign wire59 = wire29;
  always
    @(posedge clk) begin
      reg60 <= ((8'hb5) ?
          {$unsigned($unsigned({(8'hbf), wire28})),
              ({(wire59 ? wire30 : wire57),
                  $unsigned(wire59)} || wire57)} : $signed($signed((((8'ha4) ?
                  (8'h9e) : (8'h9e)) ?
              (+wire31) : wire33))));
      reg61 <= $unsigned($signed(wire32[(2'h3):(2'h2)]));
      reg62 <= ($signed($unsigned($unsigned((wire34 * (8'ha5))))) ~^ $signed(wire33[(3'h4):(1'h1)]));
      if ($signed($signed(reg61)))
        begin
          reg63 <= (^~(+$unsigned((7'h42))));
        end
      else
        begin
          if ({$unsigned((~(8'hab))), reg62})
            begin
              reg63 <= $unsigned(((wire29[(1'h1):(1'h1)] ? wire59 : wire34) ?
                  reg62 : ($signed((wire59 >>> wire33)) >>> wire59[(5'h13):(4'hb)])));
              reg64 <= (wire34 != (|(-reg61)));
            end
          else
            begin
              reg63 <= $signed($signed(({(wire32 == wire34),
                  $signed(wire33)} + (8'ha7))));
              reg64 <= $signed($unsigned(($signed((~^wire57)) ?
                  (wire32 ?
                      $unsigned(wire30) : {wire33,
                          wire59}) : wire32[(3'h4):(1'h1)])));
              reg65 <= reg63[(3'h7):(1'h1)];
            end
        end
      reg66 <= (|({wire32[(1'h0):(1'h0)], (&{reg60})} ?
          (wire29 > wire29[(3'h6):(3'h6)]) : {(wire57 ?
                  wire29 : $signed(wire28)),
              (8'ha4)}));
    end
  module67 #() modinst95 (.wire68(wire32), .wire70(reg64), .wire71(reg63), .clk(clk), .wire69(wire33), .y(wire94));
  assign wire96 = $signed(wire33);
  assign wire97 = (^(&(~^((wire35 <= wire57) ^~ (wire30 != wire35)))));
endmodule

module module67
#(parameter param92 = ((|(-(((8'hb0) ? (7'h41) : (8'hbb)) < ((8'hb3) ? (8'h9f) : (8'ha3))))) != {(^(((8'hb1) ? (8'hac) : (8'hae)) + ((8'hbc) ? (8'hb2) : (8'hb9))))}), 
parameter param93 = param92)
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire71;
  input wire [(4'hc):(1'h0)] wire70;
  input wire signed [(5'h15):(1'h0)] wire69;
  input wire [(5'h13):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  assign y = {wire91,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire73,
                 wire72,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire72 = (&wire70[(3'h5):(3'h5)]);
  assign wire73 = {{(!wire68[(5'h13):(3'h6)]), wire72[(4'ha):(1'h0)]}};
  always
    @(posedge clk) begin
      reg74 <= (wire71[(3'h6):(2'h3)] ?
          (wire73[(4'h9):(3'h5)] ? (!wire72) : $signed(wire70)) : (-wire72));
      reg75 <= (&(8'haf));
    end
  assign wire76 = ((+reg74[(4'h9):(2'h3)]) ?
                      {(($unsigned(wire73) * reg74) * wire70[(3'h4):(1'h1)]),
                          (((-wire69) ?
                              {wire70, wire70} : {wire71}) && (+{wire72,
                              wire70}))} : $unsigned($signed(($unsigned(wire73) || $unsigned(wire72)))));
  assign wire77 = ((+((8'hb0) ?
                      ($signed(wire76) ?
                          $unsigned(wire72) : {reg75}) : wire69)) <<< $signed((8'hb5)));
  assign wire78 = {$signed((-((wire70 ? wire71 : wire68) ?
                          $unsigned(reg75) : (^wire77))))};
  assign wire79 = (reg74 ? $unsigned(wire68) : $signed({wire77}));
  assign wire80 = $signed(wire78);
  assign wire81 = (wire70[(3'h4):(2'h2)] | $signed($unsigned(((reg74 * wire71) ?
                      wire69 : (wire73 <<< wire70)))));
  assign wire82 = (reg74[(3'h6):(1'h1)] & $unsigned(($signed((~wire81)) == (8'hbd))));
  assign wire83 = $unsigned((((((7'h43) ? wire79 : wire69) ?
                          $signed(wire69) : $unsigned(wire77)) ?
                      wire76[(1'h0):(1'h0)] : {(wire68 ? reg74 : wire77),
                          (wire80 << wire81)}) >>> (^~(8'ha5))));
  always
    @(posedge clk) begin
      if ((~&((wire76 >= ((-wire76) ^ wire70[(3'h7):(3'h4)])) <<< ($unsigned((7'h41)) <= wire71))))
        begin
          reg84 <= (~|$signed({wire83}));
          if ($signed(wire80))
            begin
              reg85 <= $unsigned((|$signed($unsigned((wire77 ?
                  wire79 : wire79)))));
              reg86 <= (8'ha5);
            end
          else
            begin
              reg85 <= {wire70,
                  $signed({wire73[(1'h1):(1'h1)], $unsigned({wire78})})};
              reg86 <= {(wire72 && {{wire82}, {{wire73, wire76}, {wire77}}})};
              reg87 <= $unsigned($signed(wire76));
              reg88 <= $signed(wire81);
              reg89 <= {$unsigned(({wire70, (wire70 ? (8'hb2) : wire70)} ?
                      $signed(reg84) : (wire80[(4'h8):(1'h0)] ?
                          $signed(wire76) : (wire72 ? (8'hba) : wire81)))),
                  (wire71[(2'h3):(1'h0)] | reg87[(4'ha):(3'h7)])};
            end
        end
      else
        begin
          reg84 <= (reg75 != (~^(~&$unsigned($signed(wire78)))));
          reg85 <= (-wire82[(3'h7):(2'h3)]);
          reg86 <= (^~reg75);
          if (reg89)
            begin
              reg87 <= {reg84, wire76[(4'ha):(2'h2)]};
              reg88 <= (~|($signed((^$unsigned(wire80))) <= reg84));
              reg89 <= (wire73 ?
                  {(wire69 ? $unsigned((wire70 ? reg75 : wire68)) : (+reg85)),
                      (wire81[(1'h0):(1'h0)] >> $signed((reg88 * wire76)))} : (($unsigned((wire68 ?
                          wire81 : reg84)) | (wire79 || (8'hb2))) ?
                      wire68 : ((8'hb9) >= $signed($unsigned(wire72)))));
              reg90 <= $signed(reg88);
            end
          else
            begin
              reg87 <= wire70;
            end
        end
    end
  assign wire91 = (~&$unsigned($signed((reg74 || wire71))));
endmodule

module module36
#(parameter param55 = ({(({(8'ha8), (8'ha5)} ? {(8'h9f)} : {(8'h9f), (8'hac)}) - (((8'ha9) ? (8'had) : (8'hb7)) ? {(8'hab), (8'hac)} : (8'hae)))} | ((!(((8'hbc) == (8'had)) ? (|(8'hbb)) : ((8'ha5) >= (8'hb8)))) ? {(~&((8'hbd) != (8'haf))), ({(8'haf), (8'ha1)} >> {(7'h41), (8'hac)})} : {(+((8'hb5) ? (8'hbc) : (8'hb6)))})), 
parameter param56 = param55)
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire [(2'h2):(1'h0)] wire40;
  input wire signed [(4'hc):(1'h0)] wire39;
  input wire [(4'hf):(1'h0)] wire38;
  input wire [(5'h12):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 (1'h0)};
  assign wire42 = ($unsigned($signed((wire37 ~^ (8'hbc)))) | wire38[(1'h1):(1'h1)]);
  assign wire43 = (!((!(~(~&wire41))) || (((wire42 ? wire42 : wire41) ?
                      {(8'hb1)} : wire41[(4'hc):(3'h4)]) ^ $signed((~^wire40)))));
  assign wire44 = (((8'hb0) ? wire43[(3'h6):(2'h3)] : $unsigned(wire39)) ?
                      wire41[(4'he):(2'h2)] : ($signed($unsigned(wire43[(2'h3):(2'h3)])) ?
                          (wire41 | wire43) : (((wire41 <= wire40) ?
                                  wire39 : wire43) ?
                              wire42[(3'h4):(2'h2)] : wire40)));
  assign wire45 = ($unsigned(($signed($signed(wire40)) ?
                          wire41[(4'hb):(4'ha)] : (~^$unsigned(wire44)))) ?
                      wire38 : wire41);
  assign wire46 = (~(^~(~^wire45)));
  assign wire47 = wire44;
  assign wire48 = wire37[(4'hb):(4'ha)];
  assign wire49 = (~($signed((+(wire41 <<< wire44))) ?
                      ($unsigned((wire48 ?
                          wire47 : (7'h40))) ^~ wire46) : wire47[(4'h8):(1'h0)]));
  assign wire50 = (($signed($unsigned((wire38 ?
                          wire49 : wire44))) & $signed((-(wire40 + wire48)))) ?
                      wire47 : ($signed(wire42) ?
                          (~^(!{wire37,
                              wire40})) : $unsigned($signed(wire44[(2'h2):(1'h1)]))));
  assign wire51 = wire38;
  assign wire52 = (^(wire39[(1'h0):(1'h0)] + wire37[(5'h12):(4'he)]));
  assign wire53 = (~{(wire44 ?
                          ($unsigned(wire37) ?
                              $signed(wire45) : (wire37 == (8'ha8))) : (-((8'hb8) ?
                              wire41 : wire44)))});
  assign wire54 = ($signed((((~^wire39) ?
                          (~&(8'had)) : wire39[(2'h2):(1'h0)]) <= {{wire50},
                          $unsigned(wire47)})) ?
                      {$unsigned((wire44[(1'h0):(1'h0)] ?
                              {wire42, wire40} : $unsigned(wire52))),
                          wire45} : $signed(($signed($unsigned(wire50)) << (8'haa))));
endmodule
