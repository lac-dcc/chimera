module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire127;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire83;
  assign y = {wire127, wire125, wire5, wire6, wire83, (1'h0)};
  assign wire5 = $signed(wire1);
  assign wire6 = wire5;
  module7 #() modinst84 (.wire9(wire6), .wire12(wire4), .wire8(wire5), .clk(clk), .wire11(wire2), .wire10(wire1), .y(wire83));
  module85 #() modinst126 (.y(wire125), .clk(clk), .wire86(wire83), .wire89(wire3), .wire88(wire5), .wire87(wire6));
  assign wire127 = {wire5[(3'h6):(2'h2)]};
endmodule

module module85  (y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire89;
  input wire [(5'h15):(1'h0)] wire88;
  input wire [(4'hf):(1'h0)] wire87;
  input wire [(5'h10):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire120;
  wire [(3'h5):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire115;
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire115,
                 (1'h0)};
  module90 #() modinst116 (.wire92(wire88), .y(wire115), .wire93(wire87), .wire94(wire86), .wire95(wire89), .clk(clk), .wire91((8'hbf)));
  assign wire117 = (((8'hba) ?
                       (({wire87, (8'h9c)} >>> $signed(wire88)) ?
                           ((wire87 ?
                               (8'h9e) : wire115) >> $unsigned(wire89)) : (&(wire115 ?
                               wire115 : wire89))) : ({(wire89 ?
                               wire86 : (8'hb2)),
                           wire86[(1'h0):(1'h0)]} >> $signed($signed(wire86)))) >>> ($signed(wire87) * wire89));
  assign wire118 = wire117;
  assign wire119 = {((8'hbc) <= wire86[(4'hf):(3'h7)]), $unsigned(wire88)};
  assign wire120 = (($signed(((wire87 - (8'hb3)) - wire89)) && ({wire119,
                               $signed(wire117)} ?
                           $unsigned((wire119 << wire86)) : ({wire115} ?
                               $unsigned(wire119) : (wire119 <<< (8'ha7))))) ?
                       wire87 : wire115);
  assign wire121 = ($signed((wire118[(4'h9):(1'h1)] ?
                           $signed((wire88 >> (8'hb5))) : {(wire119 | wire120)})) ?
                       ($signed(wire89) == $unsigned((^wire87[(3'h6):(2'h2)]))) : (wire120[(4'ha):(2'h2)] ?
                           (wire89[(1'h0):(1'h0)] ?
                               {(wire87 || (7'h44)),
                                   $unsigned(wire87)} : {$signed(wire115)}) : {wire88}));
  assign wire122 = $unsigned((wire87[(2'h2):(1'h0)] - $unsigned({(&(8'hbf)),
                       (&wire115)})));
  assign wire123 = (((~(((8'hbb) ^ wire120) ^~ wire87[(4'hf):(1'h1)])) ?
                           ($signed((^wire117)) ?
                               $signed(wire86[(4'hd):(4'hc)]) : (!$unsigned(wire120))) : (8'hb6)) ?
                       wire119 : $unsigned(wire122[(1'h1):(1'h1)]));
  assign wire124 = ((8'hb1) - wire123[(4'hc):(1'h1)]);
endmodule

module module7
#(parameter param81 = (~&(((|{(8'had), (8'h9c)}) ? ((^~(8'ha1)) > (~|(8'hac))) : {((8'hae) ? (8'ha4) : (8'ha8)), (8'ha6)}) ? ({((8'hbe) ? (8'hb4) : (7'h41)), {(8'ha3)}} ? ((-(8'hba)) << (~|(8'ha1))) : (((8'had) ? (8'hae) : (8'hb5)) ? ((8'ha0) ? (8'ha3) : (8'hb7)) : {(8'hb1)})) : (!(|((8'ha2) ? (7'h41) : (8'hab)))))), 
parameter param82 = param81)
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire13;
  assign y = {wire80, wire79, wire78, wire76, wire13, (1'h0)};
  assign wire13 = ((7'h43) - wire8[(3'h7):(2'h2)]);
  module14 #() modinst77 (wire76, clk, wire8, wire10, wire11, wire13);
  assign wire78 = (|(^(8'ha3)));
  assign wire79 = (($unsigned((~|$signed(wire76))) | $unsigned((^~(wire10 | wire11)))) ?
                      (-$unsigned($unsigned($signed((8'hab))))) : (+wire12));
  assign wire80 = $unsigned(wire76[(5'h10):(4'h9)]);
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h25c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire [(2'h2):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  input wire signed [(5'h11):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire59,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire39,
                 wire25,
                 wire20,
                 wire19,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg58,
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
                 reg38,
                 reg37,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire19 = $unsigned(($signed(wire15) * (wire16[(2'h2):(1'h1)] << ({wire18} ?
                      ((8'ha5) ? wire17 : wire16) : $signed(wire16)))));
  assign wire20 = {((wire19 ?
                          (8'h9d) : ($signed(wire15) <= (wire18 ^~ wire18))) < (|wire19[(5'h13):(4'hb)]))};
  always
    @(posedge clk) begin
      if (((~&wire15) || (~(^~$signed({wire20})))))
        begin
          reg21 <= $signed($unsigned(wire16[(1'h1):(1'h1)]));
        end
      else
        begin
          reg21 <= $unsigned({(($unsigned(wire16) <<< (wire15 ?
                  wire19 : wire19)) ^ (+wire16))});
          reg22 <= ((wire16 ?
              reg21[(4'hd):(1'h0)] : (({reg21} ?
                      (wire20 ? wire15 : (8'hb4)) : (wire18 == wire15)) ?
                  (wire20[(4'h8):(3'h4)] != (wire20 >>> wire17)) : wire17[(1'h1):(1'h0)])) * ($signed($signed((wire20 ?
                  wire18 : wire20))) ?
              reg21[(3'h6):(2'h3)] : wire17[(1'h0):(1'h0)]));
          reg23 <= wire18;
          reg24 <= ($signed({({(8'ha1), reg23} <<< wire15),
              ($unsigned(wire18) ?
                  (reg23 ~^ wire16) : wire20)}) - wire15[(4'hc):(4'h8)]);
        end
    end
  assign wire25 = (|$unsigned((reg24 ^~ {{wire18, reg24}})));
  always
    @(posedge clk) begin
      if (((~^{{$signed(reg22), (wire25 > wire17)}}) <<< wire20))
        begin
          reg26 <= ($signed($signed((((8'hbd) ? reg22 : (8'hbd)) ?
                  (reg23 + wire17) : (reg24 ^ (7'h41))))) ?
              ((~&reg23[(4'h8):(3'h7)]) ~^ $signed(((!wire18) ^~ wire16[(1'h0):(1'h0)]))) : wire20);
        end
      else
        begin
          reg26 <= (^{(8'hbc), $signed($signed((~reg23)))});
          reg27 <= reg23[(3'h7):(2'h2)];
          reg28 <= wire15;
          if ((wire16[(2'h2):(1'h1)] ?
              $signed($signed($unsigned($unsigned(reg22)))) : wire19[(4'hc):(4'h8)]))
            begin
              reg29 <= $unsigned((($signed($unsigned((8'haa))) && ($unsigned(wire16) ?
                      {reg22} : {reg21, wire15})) ?
                  (wire25 ^~ reg24) : wire16));
              reg30 <= $signed(reg26);
              reg31 <= (({reg30} && (8'ha2)) | $unsigned({($signed(reg24) >> (8'hbe))}));
              reg32 <= $signed(({((&(8'ha3)) ?
                          $unsigned(reg22) : reg24[(3'h5):(3'h5)]),
                      ((~&wire17) ? {(8'ha4)} : reg21[(4'hb):(4'h8)])} ?
                  reg27[(3'h6):(1'h1)] : ({$unsigned((8'ha6))} != $signed((8'hb1)))));
              reg33 <= wire18[(3'h5):(1'h0)];
            end
          else
            begin
              reg29 <= (($signed($signed($unsigned(reg33))) != ($unsigned($signed(reg21)) ~^ ({wire18,
                      reg26} ?
                  (^wire16) : wire20))) + reg31);
              reg30 <= $unsigned(reg26);
              reg31 <= {reg27,
                  (reg30[(4'hd):(4'hc)] ?
                      $signed((wire25[(2'h2):(2'h2)] ?
                          $signed(wire25) : $unsigned((8'ha1)))) : $signed({{reg29}}))};
              reg32 <= reg30;
            end
        end
      reg34 <= (^((wire20 ^~ {(~&wire20)}) < (&reg33[(4'h8):(4'h8)])));
      if ($unsigned(reg22))
        begin
          reg35 <= (^($signed($signed($signed(reg30))) ?
              (reg30 ?
                  {{(8'haa), reg33},
                      wire19[(5'h13):(1'h0)]} : {(~&reg33)}) : {(reg27[(2'h3):(2'h2)] ?
                      (reg29 - reg22) : (reg32 * reg29))}));
          if ((&(~^reg26[(4'h8):(1'h0)])))
            begin
              reg36 <= $signed(reg35[(3'h6):(2'h2)]);
              reg37 <= (reg35 ?
                  wire18[(3'h4):(3'h4)] : $unsigned(({reg34[(4'h8):(3'h7)]} <<< (wire19 ?
                      (~^reg24) : reg33))));
              reg38 <= $signed(reg29[(3'h4):(1'h0)]);
            end
          else
            begin
              reg36 <= $signed(wire19[(4'he):(4'hd)]);
            end
        end
      else
        begin
          reg35 <= (7'h41);
        end
    end
  assign wire39 = {reg22, $unsigned($unsigned(wire25))};
  always
    @(posedge clk) begin
      reg40 <= (-$signed(wire19));
      if (wire25)
        begin
          reg41 <= $signed(((8'ha4) ?
              ($unsigned(wire25) ?
                  wire19 : $unsigned((reg24 || reg38))) : (~|$signed($signed(reg35)))));
          if ($unsigned(($signed(wire25[(3'h4):(3'h4)]) ?
              ($signed(reg41[(2'h3):(2'h3)]) << $unsigned($unsigned(reg24))) : (^$unsigned(reg24)))))
            begin
              reg42 <= {{wire19[(3'h5):(2'h3)]}};
              reg43 <= {({(8'ha4)} ~^ $unsigned($signed($signed((8'hb6)))))};
              reg44 <= $unsigned($unsigned((8'h9d)));
            end
          else
            begin
              reg42 <= (((8'hac) == $signed((~^$unsigned(reg42)))) ?
                  $unsigned(wire15) : ({{(wire19 > reg22), $unsigned((8'ha6))},
                      reg22[(1'h0):(1'h0)]} << reg43[(5'h11):(3'h5)]));
              reg43 <= ($unsigned(wire18[(4'h9):(2'h3)]) ?
                  $unsigned({reg41, $unsigned(reg23)}) : $signed(wire19));
              reg44 <= {((reg30 ?
                          ({(8'ha9),
                              reg33} < ((8'ha0) >= reg35)) : $unsigned((wire16 ?
                              reg41 : reg43))) ?
                      $signed(reg30[(3'h4):(1'h0)]) : (({reg37} + (+wire39)) ?
                          reg23 : $signed(wire17[(2'h2):(1'h0)]))),
                  $signed((~|{$unsigned(reg37)}))};
            end
          reg45 <= $unsigned((reg42[(2'h2):(1'h1)] ?
              (reg40 > reg40) : $unsigned(({reg37} || (-reg37)))));
          if ($signed($signed(reg34)))
            begin
              reg46 <= $signed($unsigned(($unsigned((reg40 >> wire19)) >>> $signed((+reg26)))));
              reg47 <= (&($signed(((8'ha0) ?
                  $signed(reg41) : (-(8'hb1)))) & $signed(reg23[(3'h7):(3'h7)])));
              reg48 <= (~^($unsigned(((-(8'hab)) ?
                  reg23 : reg44[(1'h0):(1'h0)])) < ((((8'ha4) + reg45) <<< reg41[(3'h6):(3'h5)]) ?
                  reg24 : reg43[(4'ha):(3'h7)])));
              reg49 <= {($signed($signed($signed(wire16))) ?
                      $unsigned($unsigned(reg26)) : ($unsigned((wire17 != reg28)) ?
                          (8'hba) : $unsigned({reg21}))),
                  (($signed(reg32[(5'h11):(4'hd)]) + $signed((reg32 ?
                      reg23 : reg44))) <= $signed($unsigned($signed(reg27))))};
            end
          else
            begin
              reg46 <= (($unsigned($signed((wire19 ? reg24 : reg30))) ?
                  (^({(8'hb6)} || ((8'had) >>> reg45))) : $unsigned($signed((reg42 <<< reg30)))) <= (wire25 ?
                  reg43 : $unsigned(reg27)));
            end
          reg50 <= reg33[(4'h8):(2'h3)];
        end
      else
        begin
          reg41 <= {(~&$signed((&$signed((8'hb9))))),
              $signed(($signed((wire15 && wire39)) ^~ ((reg32 || wire20) + (!reg48))))};
          reg42 <= (!(!$signed((8'had))));
          reg43 <= (wire16 ?
              ({({wire17} ?
                      ((8'hac) ?
                          reg49 : (8'hb3)) : reg46)} & $signed($signed((reg26 || reg44)))) : (^($signed((reg27 ?
                      reg46 : reg45)) ?
                  ({reg38} ?
                      (reg37 ?
                          reg29 : reg50) : reg49[(3'h7):(2'h3)]) : $signed((~&(8'hbc))))));
          reg44 <= $signed((8'hab));
          if (((!$unsigned((-reg36))) * ({(reg48[(1'h1):(1'h1)] ?
                  {reg35} : wire39[(1'h1):(1'h0)])} >= $signed($unsigned($unsigned(reg35))))))
            begin
              reg45 <= $unsigned(reg49);
              reg46 <= ({(+{reg42})} ?
                  ($signed(reg45) ?
                      $signed((^~(wire16 ^~ reg47))) : wire17) : $unsigned($unsigned((&$signed(reg48)))));
              reg47 <= $signed(wire15[(2'h2):(2'h2)]);
              reg48 <= {reg37, (&$signed(reg29[(2'h2):(1'h1)]))};
              reg49 <= {$signed((reg45 & $signed($unsigned(reg45))))};
            end
          else
            begin
              reg45 <= $unsigned($unsigned(wire19[(4'hd):(1'h1)]));
              reg46 <= $signed(reg40);
              reg47 <= (^~(8'hb0));
              reg48 <= $unsigned((reg22[(2'h2):(2'h2)] <= reg43[(4'hd):(3'h5)]));
              reg49 <= reg32[(4'ha):(2'h2)];
            end
        end
      reg51 <= $signed(reg36);
      reg52 <= (((($unsigned(reg36) + $signed(wire17)) | wire16[(1'h1):(1'h0)]) - (|reg47)) <= (reg46[(4'he):(4'h8)] >>> reg49[(4'h9):(1'h1)]));
      reg53 <= reg26[(1'h1):(1'h0)];
    end
  assign wire54 = reg23;
  assign wire55 = ((wire17[(2'h2):(1'h1)] <<< ($signed(wire17) ^~ $signed(wire39[(4'h9):(4'h9)]))) ?
                      reg38[(4'ha):(3'h4)] : reg38[(4'ha):(4'h8)]);
  assign wire56 = reg51[(2'h3):(1'h0)];
  assign wire57 = ((reg44[(2'h2):(1'h1)] >= (wire18[(2'h3):(2'h2)] ?
                      wire56 : ($unsigned(reg29) && reg44[(2'h3):(1'h1)]))) - (^reg45));
  always
    @(posedge clk) begin
      reg58 <= $signed(reg45);
    end
  assign wire59 = (8'hb2);
  always
    @(posedge clk) begin
      reg60 <= $signed((|$signed($signed((wire55 != (7'h40))))));
      if ({{(~&((+(8'hb9)) >= (8'had))),
              (|$unsigned((reg33 ? wire59 : reg27)))},
          wire20[(2'h3):(1'h0)]})
        begin
          reg61 <= (~&(~^(((reg34 == reg42) <<< reg50) > wire57)));
          if ((&($unsigned(reg42[(2'h3):(1'h1)]) ?
              wire56[(4'he):(3'h5)] : reg30[(4'h9):(3'h5)])))
            begin
              reg62 <= (wire56 ? $unsigned(reg29[(2'h3):(1'h0)]) : reg49);
              reg63 <= wire55[(1'h0):(1'h0)];
              reg64 <= $signed(reg51);
              reg65 <= reg32[(4'hf):(4'h9)];
              reg66 <= ($unsigned({((&reg28) ?
                      $signed(reg32) : reg29)}) >= $signed({(^~$signed(reg63))}));
            end
          else
            begin
              reg62 <= (~|$unsigned((reg28 ?
                  reg49[(3'h6):(3'h5)] : reg21[(4'he):(4'he)])));
              reg63 <= $unsigned($unsigned($signed($signed(reg50[(3'h4):(1'h0)]))));
              reg64 <= $signed((reg40 ?
                  reg63[(4'hb):(1'h0)] : ({(~&wire55)} ?
                      $unsigned((wire18 != (8'ha9))) : $unsigned(wire19[(4'hc):(4'hb)]))));
              reg65 <= $unsigned(reg63[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg61 <= reg21[(3'h4):(3'h4)];
          reg62 <= ({(reg24 <<< reg60[(1'h0):(1'h0)])} ?
              reg37[(1'h0):(1'h0)] : $signed(((&(reg44 & wire20)) <<< reg63[(4'h9):(3'h4)])));
          reg63 <= (((-{$unsigned(reg33), (8'hbb)}) ~^ ((^~reg34) > ((wire56 ?
                  reg21 : reg43) <<< $unsigned(wire19)))) ?
              $unsigned($signed($unsigned((8'hae)))) : reg64[(5'h11):(1'h0)]);
          if (($signed(($unsigned(wire56[(4'hd):(2'h2)]) ?
                  (&$signed(reg36)) : $signed($unsigned(wire18)))) ?
              $unsigned((reg26[(1'h0):(1'h0)] >> ((reg44 < reg28) != (|reg45)))) : {$signed(reg40[(4'ha):(3'h5)])}))
            begin
              reg64 <= ({(-($unsigned(wire19) <= $unsigned(reg27))),
                  ({(&reg21), $signed(wire15)} ?
                      $signed(reg62[(3'h7):(1'h0)]) : reg33)} - reg35);
              reg65 <= $unsigned((&wire54));
              reg66 <= reg44[(1'h0):(1'h0)];
              reg67 <= ((reg61[(2'h3):(2'h3)] >> $signed(reg30)) ?
                  reg43 : (reg21[(4'hc):(3'h4)] && $signed($signed(reg40[(3'h6):(1'h0)]))));
            end
          else
            begin
              reg64 <= $unsigned($signed((($unsigned(wire55) << $unsigned((7'h42))) ?
                  (^reg52) : $unsigned($signed(reg38)))));
              reg65 <= $signed((~$signed((^~$signed(reg60)))));
              reg66 <= $signed($unsigned(reg45[(3'h7):(1'h1)]));
              reg67 <= reg53[(1'h1):(1'h0)];
              reg68 <= ((reg62[(3'h6):(1'h0)] <<< (-wire18[(3'h4):(2'h3)])) + {{($signed(reg48) ?
                          {reg58, reg64} : (reg31 ? reg51 : reg46))},
                  $unsigned(wire39)});
            end
          reg69 <= $signed((~|reg40));
        end
      reg70 <= (reg44[(1'h0):(1'h0)] ?
          {$signed($signed({wire57, (8'hb1)})),
              (((~&wire16) >> (reg31 ?
                  reg52 : (8'hb3))) == reg26)} : wire16[(1'h1):(1'h0)]);
      reg71 <= $unsigned((wire54[(3'h6):(2'h2)] ~^ ((8'ha0) + reg47[(3'h4):(1'h0)])));
    end
  assign wire72 = wire55[(1'h0):(1'h0)];
  assign wire73 = reg31[(4'ha):(3'h7)];
  assign wire74 = reg44[(3'h6):(1'h1)];
  assign wire75 = reg27[(1'h0):(1'h0)];
endmodule

module module90  (y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire95;
  input wire [(5'h10):(1'h0)] wire94;
  input wire [(4'hf):(1'h0)] wire93;
  input wire [(5'h15):(1'h0)] wire92;
  input wire signed [(5'h12):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire109;
  wire signed [(4'hb):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire96;
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire109,
                 wire108,
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
                 reg111,
                 reg110,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire96 = (^((((~&wire95) < (wire91 >= wire95)) ?
                      wire94 : ($signed(wire92) ?
                          wire95[(3'h4):(2'h3)] : $signed((8'hae)))) | (|(wire95[(1'h1):(1'h1)] ?
                      wire92[(5'h11):(4'hf)] : {wire92}))));
  assign wire97 = $unsigned(wire91);
  assign wire98 = wire91[(4'hb):(4'h8)];
  assign wire99 = {((((wire96 ? wire94 : wire96) ?
                          $unsigned(wire97) : (~wire92)) && (-(+wire95))) > (wire97[(3'h4):(1'h1)] ?
                          wire96 : wire98[(1'h0):(1'h0)])),
                      {(^~$unsigned((wire96 ? wire95 : wire94))), (8'hb4)}};
  assign wire100 = $unsigned((wire99 >= $signed(wire91)));
  assign wire101 = $signed($unsigned((wire92[(5'h11):(5'h11)] >= (~$unsigned(wire99)))));
  assign wire102 = ((8'ha1) ?
                       (wire100[(1'h1):(1'h1)] == wire92[(4'hc):(2'h3)]) : $signed({$unsigned(wire91[(4'he):(3'h5)]),
                           ({wire100} ^~ wire91[(4'h8):(3'h6)])}));
  assign wire103 = wire97;
  assign wire104 = (^~wire103[(1'h1):(1'h1)]);
  assign wire105 = ($signed($unsigned((+$signed(wire91)))) ?
                       (((wire96[(1'h1):(1'h1)] ^ (wire97 ^ wire104)) ?
                           (&(wire91 == (8'hb5))) : wire103) == wire97[(1'h0):(1'h0)]) : wire92[(5'h12):(3'h4)]);
  always
    @(posedge clk) begin
      if ($signed({wire97[(1'h0):(1'h0)], (wire98[(1'h0):(1'h0)] == wire95)}))
        begin
          reg106 <= (($unsigned($signed((wire98 ?
                  wire105 : wire95))) <= wire91[(1'h1):(1'h1)]) ?
              $unsigned(((((8'ha6) ?
                  wire104 : wire94) != $unsigned(wire94)) & wire97)) : (($signed({wire95,
                          (8'hab)}) ?
                      $unsigned($signed(wire95)) : $signed({wire99, wire100})) ?
                  (~&(wire101[(3'h4):(1'h1)] ^~ wire103)) : {(wire99[(4'hb):(1'h0)] ?
                          $signed((7'h41)) : $unsigned(wire100)),
                      ($signed(wire99) ? wire95 : wire95[(2'h3):(1'h0)])}));
        end
      else
        begin
          reg106 <= (&(~|wire99[(5'h11):(4'hd)]));
          reg107 <= $signed(((wire95[(1'h0):(1'h0)] ?
              (^~wire101[(2'h2):(1'h0)]) : (-$unsigned((8'ha5)))) != ($signed((wire92 ?
              (7'h44) : reg106)) < wire94[(4'ha):(3'h7)])));
        end
    end
  assign wire108 = wire92;
  assign wire109 = (wire105[(2'h2):(1'h1)] ?
                       (wire105 ?
                           ((8'hbc) < $signed($unsigned(wire94))) : wire94) : $unsigned(({(~^wire100)} != wire104)));
  always
    @(posedge clk) begin
      reg110 <= {(^~{wire91}), wire91};
      reg111 <= $signed((-reg110[(5'h11):(3'h7)]));
    end
  assign wire112 = $signed((|$signed((wire99 * (8'hbb)))));
  assign wire113 = $unsigned((((~|(~reg106)) ?
                           wire102 : ((+wire104) <<< (8'haf))) ?
                       $unsigned($unsigned((|wire108))) : $unsigned(reg107)));
  assign wire114 = (~^($signed($unsigned(wire97)) ?
                       wire113 : $unsigned($signed($signed(wire94)))));
endmodule
