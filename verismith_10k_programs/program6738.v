module top
#(parameter param69 = ((~&{((~(8'ha0)) ? ((8'hac) ? (8'ha5) : (8'hb1)) : (~^(8'ha1)))}) <<< ((((+(7'h44)) && ((7'h40) - (8'hbf))) ? ((~^(8'hb8)) ? ((7'h44) ? (7'h43) : (8'hb3)) : (~^(8'hbc))) : ((~|(8'hb8)) >>> {(8'ha0)})) ? ((((8'ha7) ? (8'hb3) : (8'hbe)) ? ((7'h41) ? (8'ha1) : (8'ha4)) : (~|(8'hb4))) != (&((8'hbe) & (8'hb1)))) : ({(|(8'hbf))} ~^ ({(8'hbd)} ? (+(8'hb0)) : ((8'ha5) ? (8'hb2) : (8'hbe)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire65;
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire4,
                 wire5,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire65,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ((&((wire3[(1'h0):(1'h0)] && (wire1 <= wire2)) << $unsigned((^wire1)))) ?
                     wire1 : ((8'ha5) ?
                         {{((8'haa) ? wire2 : wire1), $unsigned(wire1)},
                             wire2[(3'h5):(1'h1)]} : {wire1}));
  assign wire5 = wire4[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg6 <= (wire3 ^~ $signed($signed((~&$unsigned(wire4)))));
      reg7 <= $signed(wire2);
      reg8 <= (|($signed(wire1[(4'hb):(4'h8)]) * (~((~|wire3) >= wire3))));
      reg9 <= (wire0 >> $unsigned((+$signed((~&reg7)))));
      reg10 <= $signed((((^(reg7 ? (8'hb2) : reg9)) > (~(wire4 | (8'ha0)))) ?
          $signed(((&(8'hac)) ?
              wire0[(4'h8):(3'h4)] : (wire1 ?
                  wire4 : (8'ha1)))) : $unsigned(({wire4, reg9} + (wire2 ?
              wire5 : wire3)))));
    end
  assign wire11 = $unsigned({($unsigned((reg10 >= reg8)) & wire5[(4'ha):(2'h2)]),
                      reg8[(2'h2):(1'h1)]});
  assign wire12 = wire1[(3'h4):(2'h2)];
  assign wire13 = (!($unsigned($unsigned($unsigned(reg9))) ?
                      $signed(wire3[(3'h7):(3'h6)]) : wire0));
  assign wire14 = wire2[(3'h5):(2'h3)];
  module15 #() modinst66 (wire65, clk, wire1, wire2, wire3, wire13, wire5);
  assign wire67 = (($signed(($signed(wire65) <<< $unsigned(reg8))) ?
                          (({(8'hbe)} >> wire11[(2'h2):(2'h2)]) ?
                              ({wire13} || (reg7 ?
                                  wire4 : wire2)) : wire5) : reg9[(1'h1):(1'h1)]) ?
                      wire11 : ($unsigned(((wire2 ? wire1 : wire3) ?
                          (wire11 + wire0) : wire2)) & wire13[(1'h1):(1'h0)]));
  assign wire68 = {wire0, wire2};
endmodule

module module15
#(parameter param63 = (((~(((8'hac) ? (8'haa) : (8'had)) ? {(7'h42)} : (~|(8'haa)))) | {{(~(8'h9f))}}) + (~{{((8'hba) ? (7'h41) : (8'ha0)), (+(7'h43))}, (&(|(8'ha5)))})), 
parameter param64 = param63)
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire21;
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire21,
                 (1'h0)};
  assign wire21 = (~&($unsigned(wire20) && $signed(wire19[(2'h3):(2'h3)])));
  module22 #() modinst55 (.y(wire54), .wire26(wire19), .clk(clk), .wire25(wire21), .wire23(wire18), .wire24(wire16));
  assign wire56 = (((wire18[(4'hb):(4'h9)] ?
                          wire20[(1'h1):(1'h0)] : wire17) << $signed(((8'ha3) ?
                          $signed(wire16) : (wire54 ? wire18 : wire18)))) ?
                      {wire20[(1'h0):(1'h0)], wire16} : wire21[(3'h7):(3'h5)]);
  assign wire57 = wire54[(4'hc):(4'ha)];
  assign wire58 = (&$unsigned($unsigned(wire16)));
  assign wire59 = wire17[(3'h5):(3'h4)];
  assign wire60 = {wire18,
                      ({wire59[(1'h0):(1'h0)]} <<< (~$signed((|(8'ha3)))))};
  assign wire61 = (((~^wire60) != {((wire60 < wire58) + wire60),
                      (wire20[(1'h1):(1'h0)] ?
                          $unsigned(wire58) : (^wire60))}) <= wire21);
  assign wire62 = {$unsigned($signed((+$unsigned(wire56)))),
                      $signed({$unsigned($signed(wire61))})};
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire26;
  input wire signed [(4'h9):(1'h0)] wire25;
  input wire signed [(3'h6):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire27;
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire46,
                 wire45,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 reg48,
                 reg47,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg28,
                 (1'h0)};
  assign wire27 = (^((&{$signed(wire24), wire23}) ?
                      $unsigned((wire26[(3'h7):(3'h5)] & $unsigned(wire25))) : (-(8'h9f))));
  always
    @(posedge clk) begin
      reg28 <= (wire25[(3'h5):(2'h3)] ?
          wire24[(1'h0):(1'h0)] : $unsigned(((|{wire26}) ?
              ({wire25, (8'ha7)} ?
                  {wire23} : (wire24 <= wire25)) : $signed((&wire27)))));
    end
  assign wire29 = $signed(({wire26[(4'h9):(3'h4)],
                          (wire25 ? (reg28 + wire24) : (-wire27))} ?
                      (($unsigned(wire23) >= (+(8'ha1))) ?
                          ($signed((7'h41)) ?
                              (reg28 ~^ (8'haf)) : {wire23,
                                  wire26}) : $signed($signed(wire27))) : (8'ha3)));
  assign wire30 = (8'ha7);
  assign wire31 = $unsigned((&wire27));
  assign wire32 = wire26[(3'h6):(2'h3)];
  assign wire33 = $unsigned(wire24[(3'h6):(3'h6)]);
  assign wire34 = ({$signed(($unsigned(wire27) ?
                          ((8'ha8) ?
                              wire32 : wire26) : wire23[(3'h7):(3'h4)]))} >> $unsigned((((&wire32) + wire23[(4'hf):(4'hb)]) - ({wire31} + $signed((8'hbc))))));
  assign wire35 = (wire29 & $signed((($signed(wire30) ^~ (^wire33)) ?
                      (!(wire27 ? wire26 : wire32)) : ({(8'hb9)} ?
                          $signed(reg28) : wire34))));
  assign wire36 = ((!(wire27[(1'h1):(1'h0)] && {(!(8'hbe))})) ^ wire34[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg37 <= ({{wire35[(3'h7):(3'h5)],
              (wire33 >> wire30)}} >>> ((wire29 ~^ reg28) ?
          wire23[(2'h2):(1'h1)] : (wire29[(4'h8):(3'h7)] ^ (wire24[(1'h0):(1'h0)] - wire29[(4'he):(1'h1)]))));
      reg38 <= (8'ha6);
      reg39 <= $unsigned((wire36[(3'h5):(2'h2)] ?
          (($signed((8'hab)) != (wire29 ? wire32 : wire24)) ?
              $unsigned({(8'hb8),
                  wire34}) : {(!(8'hb8))}) : $unsigned(wire26)));
      if ({$signed((($signed(wire34) > wire33[(3'h6):(2'h2)]) & $unsigned((wire25 ?
              (8'hb8) : reg39))))})
        begin
          reg40 <= reg39[(1'h0):(1'h0)];
          if ($unsigned($unsigned($unsigned(((wire35 ? wire29 : wire33) ?
              (~|wire24) : {wire24, wire35})))))
            begin
              reg41 <= wire35[(3'h5):(2'h2)];
            end
          else
            begin
              reg41 <= $signed((wire24 ?
                  $signed({reg37[(1'h0):(1'h0)],
                      (reg37 ? (8'ha8) : (8'ha7))}) : wire36[(3'h4):(3'h4)]));
            end
          reg42 <= ((^~reg38) ?
              {wire33[(4'hb):(2'h3)]} : (((&{wire35, wire34}) ?
                      ($signed(wire23) + reg28[(4'h8):(3'h6)]) : (8'haf)) ?
                  $signed(reg38[(1'h0):(1'h0)]) : wire27[(3'h4):(2'h3)]));
          reg43 <= (8'h9c);
          reg44 <= reg37[(3'h6):(3'h5)];
        end
      else
        begin
          reg40 <= $signed($unsigned(wire24[(3'h6):(3'h6)]));
        end
    end
  assign wire45 = ((((&wire34[(3'h5):(3'h4)]) - $unsigned((8'hb8))) << $unsigned($unsigned(reg41))) == (!(!{(-wire36)})));
  assign wire46 = {(wire36 <<< (~|((reg42 ? wire30 : wire32) ?
                          {wire34} : wire25))),
                      (!(($unsigned(reg39) ?
                          $unsigned(wire30) : $unsigned(reg37)) >>> (~^wire30[(1'h0):(1'h0)])))};
  always
    @(posedge clk) begin
      reg47 <= (wire26[(4'hf):(4'hb)] ?
          ((~|$unsigned((~&wire46))) < {($signed(wire27) ?
                  wire34 : (reg41 ?
                      wire25 : reg28))}) : {(~($unsigned(wire45) ^~ wire23[(3'h5):(3'h4)]))});
    end
  always
    @(posedge clk) begin
      reg48 <= wire27;
    end
  assign wire49 = $unsigned($unsigned({$signed(reg28[(1'h0):(1'h0)])}));
  assign wire50 = $unsigned(((wire27[(1'h0):(1'h0)] && $signed($signed((8'hb1)))) ?
                      {(^~{reg40}),
                          reg28[(3'h6):(2'h3)]} : ({$unsigned((8'ha1)),
                          (wire36 <= reg28)} || (~|((8'hbc) ?
                          wire49 : wire26)))));
  assign wire51 = wire25;
  assign wire52 = ($signed(reg47) ~^ (wire49[(5'h13):(4'hd)] != $unsigned($signed((~&wire32)))));
  assign wire53 = (^$unsigned(wire36));
endmodule
