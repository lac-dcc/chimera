module top
#(parameter param99 = ({(({(7'h43), (8'hb7)} ~^ ((8'ha6) ? (8'hb9) : (8'haa))) ? (((8'ha8) != (7'h43)) < (^(8'hb7))) : ((-(8'h9e)) <= ((8'ha7) * (7'h40))))} ? {{(&{(8'hbe), (8'hab)}), (((8'ha3) ? (8'ha1) : (8'hb5)) ? (~|(8'hbc)) : (7'h40))}, ({(-(8'hbe))} || (((8'ha1) ? (7'h43) : (7'h41)) - ((8'hb5) || (8'hb2))))} : (+(~|({(8'ha1), (8'had)} ^~ ((8'hb6) ^~ (8'h9c)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire96;
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire98,
                 wire4,
                 wire5,
                 wire14,
                 wire15,
                 wire16,
                 wire96,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed($unsigned($signed($unsigned(wire2))));
  assign wire5 = (8'haa);
  always
    @(posedge clk) begin
      reg6 <= (8'hb0);
      if ((wire0 ? wire1 : (-$unsigned((^~$signed(wire1))))))
        begin
          reg7 <= $unsigned((($signed(wire3) >>> (!((8'h9c) != wire1))) ?
              {$unsigned(((8'hb1) == (8'hab)))} : $signed(wire2)));
          reg8 <= $signed(wire5);
          reg9 <= ((+($unsigned((8'h9c)) >>> $unsigned($signed(reg6)))) ?
              $signed(wire2[(4'he):(2'h2)]) : $signed((($signed((8'hb6)) ?
                      reg7 : (reg7 < wire5)) ?
                  wire4[(3'h6):(3'h4)] : (~|(~&wire0)))));
          reg10 <= {wire2};
        end
      else
        begin
          if ($unsigned(reg6[(2'h3):(1'h1)]))
            begin
              reg7 <= reg7;
            end
          else
            begin
              reg7 <= $unsigned((~&wire2));
              reg8 <= (+reg6);
              reg9 <= (!{$unsigned(wire2), wire3});
            end
          reg10 <= $signed((-reg10[(4'hd):(3'h5)]));
          reg11 <= $signed({((wire3[(3'h7):(2'h2)] == reg6) > reg7)});
          reg12 <= ($signed({reg10[(4'ha):(3'h5)],
                  $unsigned(wire4[(2'h2):(1'h0)])}) ?
              $unsigned(wire1) : (8'ha6));
        end
      reg13 <= (~^((+$unsigned((wire1 ?
          (8'hab) : reg6))) <= $signed({$signed(wire2)})));
    end
  assign wire14 = (~(+(!{wire2})));
  assign wire15 = ((&(^$signed((wire1 | (8'hac))))) <= (wire3 ?
                      (($unsigned(wire1) != wire0) ?
                          wire0 : reg10) : {$signed((wire4 > reg10)),
                          ((reg10 ^ reg12) ? wire2 : {reg12, reg8})}));
  assign wire16 = {$unsigned((!($signed(reg7) >> (reg10 <= wire15)))),
                      $signed({($unsigned(wire2) == (wire0 == (8'ha6)))})};
  module17 #() modinst97 (wire96, clk, wire3, reg9, wire2, wire1, reg12);
  assign wire98 = reg10[(4'h9):(1'h0)];
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h267):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire [(4'hb):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire56,
                 wire54,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
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
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg30,
                 (1'h0)};
  assign wire23 = wire20[(3'h7):(1'h1)];
  assign wire24 = ({wire23, wire18[(3'h5):(2'h2)]} ?
                      wire20 : $signed((wire21 ^ $signed({wire19, wire19}))));
  assign wire25 = wire20[(2'h3):(1'h0)];
  assign wire26 = ((+$signed({{wire19}})) ?
                      (~|((|(wire25 ?
                          wire20 : wire21)) & $unsigned($unsigned(wire19)))) : ((+((&(8'ha0)) < {wire18,
                          wire25})) == wire18));
  assign wire27 = $unsigned((((~|wire22[(1'h1):(1'h1)]) > $signed(wire18[(3'h6):(3'h6)])) > wire26));
  assign wire28 = $unsigned(wire23);
  assign wire29 = $unsigned(wire22);
  always
    @(posedge clk) begin
      if (wire26[(2'h2):(1'h1)])
        begin
          reg30 <= wire22[(1'h1):(1'h1)];
        end
      else
        begin
          reg30 <= ($signed((((^(8'ha4)) != (wire28 ? wire27 : wire24)) ?
                  wire26 : {(wire18 ? wire27 : wire24)})) ?
              {{wire27, $unsigned(wire20)},
                  $unsigned($unsigned((wire29 ~^ wire23)))} : ($unsigned((^((7'h42) ?
                      wire23 : (8'hb1)))) ?
                  ((wire26[(2'h2):(1'h1)] || (wire26 ?
                      wire25 : wire29)) + wire28) : wire25[(5'h14):(5'h13)]));
        end
    end
  assign wire31 = wire21;
  assign wire32 = (wire31 >>> (~((^$unsigned((7'h42))) ?
                      $signed((wire31 ?
                          wire25 : wire27)) : reg30[(2'h2):(1'h1)])));
  assign wire33 = wire26;
  module34 #() modinst55 (.wire35(wire25), .clk(clk), .wire36(wire29), .y(wire54), .wire38(wire33), .wire37(wire19));
  assign wire56 = (wire32[(4'hd):(4'h9)] <= (wire18[(2'h2):(2'h2)] ?
                      (8'hb0) : ($unsigned((-wire28)) != (((8'hac) & wire24) ?
                          (~&wire29) : (wire19 ? wire18 : wire26)))));
  always
    @(posedge clk) begin
      if ((($signed((wire19 * (&reg30))) != $unsigned(((wire23 ?
              wire21 : wire22) || $unsigned(wire56)))) ?
          $unsigned($signed((wire18[(2'h2):(1'h0)] ?
              (wire29 ?
                  wire24 : wire31) : (wire31 * wire54)))) : ($signed(({wire29,
              (8'hac)} << (wire18 > wire32))) & (wire32[(4'ha):(3'h5)] > $unsigned((8'hb7))))))
        begin
          reg57 <= ($signed(wire29[(2'h3):(2'h3)]) + wire22);
          reg58 <= wire26;
          reg59 <= (reg30 ?
              $signed(wire25[(4'hf):(4'hf)]) : (~^$signed(((wire27 ?
                  reg30 : (8'h9c)) || {wire26}))));
          reg60 <= $unsigned($signed((8'ha4)));
        end
      else
        begin
          reg57 <= {{wire20}};
          if (((~&$signed($unsigned($unsigned(reg58)))) ?
              (reg59 ?
                  (wire24 ?
                      (8'ha2) : $unsigned(((8'ha0) ?
                          reg57 : wire27))) : ($unsigned({(8'ha8)}) ?
                      ($signed(wire33) || $unsigned(wire18)) : {(|wire27)})) : $unsigned($unsigned(wire24))))
            begin
              reg58 <= (($unsigned($unsigned((8'ha1))) ?
                  {$signed((wire33 ?
                          reg59 : wire22))} : $unsigned($unsigned($signed(wire29)))) | (wire29[(4'h9):(3'h4)] ?
                  $unsigned(wire54) : {($unsigned(wire56) >> (^~wire29)),
                      (^$signed(wire31))}));
              reg59 <= ((-(($signed(reg59) + wire25) <= $unsigned((~&wire24)))) <= (8'ha5));
              reg60 <= ((~{reg59}) ? (8'hbc) : wire25[(3'h7):(2'h2)]);
              reg61 <= wire32;
            end
          else
            begin
              reg58 <= ($unsigned((-(~(wire27 ?
                  wire20 : reg58)))) ^~ wire27[(1'h1):(1'h0)]);
              reg59 <= reg57[(1'h0):(1'h0)];
              reg60 <= ($unsigned(($signed((^~wire23)) > $unsigned((wire23 ?
                      wire54 : wire28)))) ?
                  $signed(reg30) : wire54);
              reg61 <= {wire31[(2'h2):(2'h2)], wire24};
            end
          reg62 <= $unsigned(((wire22 || ({wire56} ?
              (^wire28) : wire20)) >> {wire19[(4'hd):(3'h4)],
              ({reg59, reg30} ? (!wire23) : {(8'hb3)})}));
          reg63 <= $signed((~|wire22[(1'h1):(1'h1)]));
          if (($signed(({(wire18 ? reg60 : reg57), $unsigned(wire18)} ?
              wire27 : reg57)) ^~ wire29))
            begin
              reg64 <= $unsigned(($signed(($signed(wire54) > (|reg58))) ?
                  $signed(wire33[(5'h14):(4'hc)]) : $signed(($signed(wire29) | (wire23 ?
                      wire54 : wire25)))));
              reg65 <= $signed(($signed((8'hab)) ?
                  wire31 : (wire22[(1'h1):(1'h1)] ?
                      $unsigned((wire28 == wire28)) : $signed($signed(reg30)))));
              reg66 <= wire56[(3'h4):(1'h0)];
              reg67 <= (reg66 ? $unsigned((~reg66[(1'h0):(1'h0)])) : reg61);
              reg68 <= $unsigned($signed($unsigned($signed((reg30 | (8'hb8))))));
            end
          else
            begin
              reg64 <= reg30[(1'h1):(1'h1)];
              reg65 <= {wire19[(4'hd):(3'h6)], wire21};
              reg66 <= wire56;
              reg67 <= $unsigned($signed(($unsigned(wire25) ?
                  (~|(^~reg66)) : $signed(reg59[(2'h3):(2'h3)]))));
            end
        end
      if ({wire21})
        begin
          if ((-(&(wire23[(2'h3):(2'h3)] ?
              (!$unsigned(reg66)) : (-wire26[(3'h4):(2'h2)])))))
            begin
              reg69 <= (wire25[(4'hc):(2'h3)] | ((^((8'hbc) ?
                  (wire24 >>> wire54) : (&reg67))) < reg57));
              reg70 <= wire20;
            end
          else
            begin
              reg69 <= wire19;
            end
          if ($unsigned((&(8'ha3))))
            begin
              reg71 <= wire25;
            end
          else
            begin
              reg71 <= $unsigned($unsigned($signed((reg60[(3'h5):(2'h3)] ?
                  $unsigned(wire33) : $signed(wire22)))));
              reg72 <= ($unsigned($signed(reg64[(4'h9):(3'h4)])) ?
                  ($signed((wire25[(5'h12):(2'h2)] ?
                      (reg63 ?
                          wire54 : wire54) : (~^wire18))) <<< {reg66}) : (^$unsigned(wire27)));
              reg73 <= $signed(wire29[(4'hb):(3'h7)]);
            end
          reg74 <= ((7'h43) - (wire31 ?
              (reg57 || wire20[(1'h1):(1'h1)]) : (!(~&{wire56, reg71}))));
        end
      else
        begin
          reg69 <= wire25[(4'hd):(4'h9)];
          reg70 <= reg69;
          if ((|$signed($signed($signed((^wire29))))))
            begin
              reg71 <= {{{$unsigned($signed(wire33)),
                          $unsigned({reg65, reg61})},
                      wire31[(1'h1):(1'h1)]},
                  ((8'had) <<< wire22[(1'h0):(1'h0)])};
              reg72 <= ((8'haf) || (+wire27[(2'h2):(2'h2)]));
              reg73 <= reg73;
              reg74 <= (wire26[(2'h2):(1'h0)] - $unsigned(wire27));
              reg75 <= wire31[(4'ha):(1'h0)];
            end
          else
            begin
              reg71 <= (~reg63[(3'h7):(3'h5)]);
              reg72 <= $unsigned((&wire27));
              reg73 <= reg62[(1'h1):(1'h0)];
            end
          reg76 <= {($signed(((wire24 || wire29) ?
                  (|reg30) : $signed(reg75))) != $unsigned(($signed((8'hb9)) ?
                  wire29[(2'h2):(1'h0)] : reg66))),
              reg65};
          if ($signed(reg75[(1'h1):(1'h0)]))
            begin
              reg77 <= $signed($unsigned((+reg72[(4'he):(3'h7)])));
              reg78 <= (!{$unsigned({reg73})});
              reg79 <= {$signed($signed(((~reg64) >>> $signed(wire56))))};
              reg80 <= (reg62[(5'h11):(4'he)] << (|$unsigned(wire33)));
            end
          else
            begin
              reg77 <= wire21[(4'hb):(4'hb)];
              reg78 <= ($unsigned(($unsigned($unsigned(reg71)) <<< ((^wire54) == $signed(reg62)))) ?
                  {wire19} : {(+($unsigned(reg72) <<< {reg76, (8'hbd)})),
                      (reg63[(3'h5):(3'h5)] << ((&(8'had)) ?
                          $signed(wire23) : reg30))});
              reg79 <= ($signed(reg58) ?
                  ({((^~reg72) + wire33[(4'ha):(3'h6)]),
                      wire27} >> (^~((~&reg64) ?
                      $signed(wire32) : reg58))) : $signed(reg62[(4'h9):(3'h5)]));
              reg80 <= reg78;
              reg81 <= $signed($unsigned(reg57[(3'h4):(2'h3)]));
            end
        end
      if (reg78[(5'h10):(1'h0)])
        begin
          reg82 <= $unsigned($unsigned($signed(((reg62 != wire19) <<< $signed(wire27)))));
        end
      else
        begin
          reg82 <= ($unsigned({wire25[(4'hc):(4'h9)]}) ~^ reg61[(3'h4):(1'h1)]);
          reg83 <= $signed($signed($unsigned(wire32)));
          if (reg76[(3'h4):(1'h0)])
            begin
              reg84 <= $unsigned((^~$signed((wire19[(1'h0):(1'h0)] * (~|wire25)))));
              reg85 <= (8'h9e);
              reg86 <= {$unsigned(($signed(reg79[(1'h1):(1'h0)]) != reg67[(5'h11):(4'hd)]))};
              reg87 <= wire20[(3'h7):(3'h5)];
            end
          else
            begin
              reg84 <= $unsigned(reg65);
              reg85 <= (-((8'ha3) ?
                  $signed(((reg83 + wire20) < (wire23 ?
                      wire33 : wire29))) : (reg72[(1'h1):(1'h1)] != reg57[(1'h0):(1'h0)])));
              reg86 <= $unsigned(reg73[(3'h6):(2'h3)]);
              reg87 <= wire32;
              reg88 <= reg72[(2'h2):(2'h2)];
            end
          reg89 <= ($unsigned((|reg57[(1'h0):(1'h0)])) >= ((reg77 ~^ ((8'ha5) ?
                  $signed((8'hbe)) : (8'ha0))) ?
              $unsigned($unsigned((^reg74))) : (reg76[(1'h1):(1'h0)] || ((wire33 >>> reg75) ?
                  {reg78} : (-(8'h9f))))));
          reg90 <= {reg62};
        end
      if ((($unsigned(reg89[(4'hd):(3'h5)]) ?
              reg66[(1'h1):(1'h1)] : $signed($signed({reg75}))) ?
          reg63[(4'h8):(1'h1)] : ((&$signed($signed((8'hb2)))) ^~ ((~|(wire31 <= wire24)) ^~ reg73[(3'h6):(3'h5)]))))
        begin
          if (((8'ha6) ^~ ((8'ha4) & {wire21})))
            begin
              reg91 <= (reg63[(2'h2):(2'h2)] != $signed($unsigned((((8'ha4) != (8'had)) ?
                  wire20 : (reg81 ^ reg74)))));
              reg92 <= $unsigned({$unsigned($signed(reg67))});
            end
          else
            begin
              reg91 <= reg92;
            end
        end
      else
        begin
          reg91 <= (($signed((wire33 ? reg71[(4'hc):(4'hc)] : $signed(reg71))) ?
              ((-reg62) - {wire33}) : $signed(($signed(reg62) ?
                  (~|reg59) : (8'hb5)))) ~^ ($unsigned((^$signed(reg65))) >> $signed({$signed(reg91)})));
        end
    end
  assign wire93 = $unsigned(($unsigned($signed((|(8'hb5)))) ?
                      $signed({$signed((8'hac)),
                          $unsigned(reg71)}) : ($signed($unsigned(wire24)) ?
                          (wire28[(3'h6):(3'h6)] ^~ reg79[(1'h0):(1'h0)]) : reg81[(4'h8):(3'h4)])));
  assign wire94 = (~&wire24[(2'h2):(2'h2)]);
  assign wire95 = reg70[(1'h0):(1'h0)];
endmodule

module module34
#(parameter param52 = ((((+((8'hb9) ? (8'hbf) : (8'ha0))) ? ((8'ha7) ? {(8'hb3)} : ((7'h40) ? (8'hb7) : (8'hbe))) : {(^~(8'hb8))}) << ((((8'hb7) + (8'hb4)) > (~^(7'h40))) ? (7'h43) : {(+(8'hb8))})) ? {((+((8'haf) ? (8'ha5) : (7'h40))) * (|(+(8'ha3)))), (((&(8'hac)) >>> ((8'haf) < (7'h42))) ? ({(8'ha3), (8'hb1)} ^ ((8'hb9) | (8'hb7))) : (~|{(8'hb2), (8'hab)}))} : ((+{((8'ha4) ~^ (8'ha5))}) ? (&((^(7'h43)) <= (^(8'ha5)))) : (~(~((8'ha1) + (8'hac)))))), 
parameter param53 = ((^~{param52}) ? ((7'h41) ? ((~&(8'hbe)) ? param52 : ((+param52) ? param52 : {param52})) : (param52 ? (!param52) : param52)) : (param52 << (param52 != ((param52 ? param52 : param52) <<< ((8'ha7) ? param52 : param52))))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire38;
  input wire [(2'h2):(1'h0)] wire37;
  input wire [(2'h2):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 (1'h0)};
  assign wire39 = wire35;
  assign wire40 = ($signed((!$unsigned((~|wire38)))) ?
                      ($signed(wire39[(3'h6):(2'h2)]) - (8'hb8)) : wire38[(5'h14):(4'hd)]);
  assign wire41 = $signed(wire39);
  assign wire42 = $unsigned($unsigned((^$signed((wire41 || wire38)))));
  assign wire43 = (+$signed((~^wire42[(4'h8):(2'h2)])));
  assign wire44 = wire43[(4'hd):(4'h8)];
  assign wire45 = (&(($signed((wire39 <= wire36)) ?
                          ((wire41 | (8'h9f)) ?
                              (wire40 ?
                                  wire38 : wire39) : wire36[(2'h2):(2'h2)]) : $signed((wire40 ?
                              wire38 : wire35))) ?
                      (((~^wire38) >> wire44) ~^ wire36) : $unsigned((!{wire36,
                          (8'h9c)}))));
  assign wire46 = $unsigned(wire43[(1'h1):(1'h1)]);
  assign wire47 = (wire38 == (wire41[(3'h4):(1'h0)] == ((~&wire38[(4'he):(3'h4)]) * (wire40 <<< $signed(wire43)))));
  assign wire48 = $signed((wire39 ?
                      (((^wire44) ? $signed(wire42) : (^~wire36)) ?
                          (|(wire35 ?
                              wire44 : wire38)) : (8'ha3)) : ({$unsigned(wire44)} ?
                          {wire39[(2'h2):(1'h0)]} : ($signed(wire44) == wire36[(2'h2):(1'h0)]))));
  assign wire49 = ({wire46[(3'h4):(2'h2)]} - wire48);
  assign wire50 = (^$signed($signed((wire38 ?
                      wire40[(3'h4):(1'h1)] : $signed(wire49)))));
  assign wire51 = $signed(wire43);
endmodule
