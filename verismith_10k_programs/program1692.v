module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire95;
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  assign y = {wire97,
                 wire5,
                 wire6,
                 wire15,
                 wire95,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg16,
                 (1'h0)};
  assign wire5 = wire4[(4'hb):(4'h8)];
  assign wire6 = (wire2 <<< ((wire2 ~^ ($signed(wire5) ?
                         $signed(wire3) : (wire0 ^~ (8'hb0)))) ?
                     {$signed({wire3, wire5})} : wire5[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if ($signed(({wire1[(2'h3):(2'h2)]} * $signed((|{wire5})))))
        begin
          reg7 <= {wire6};
          reg8 <= reg7[(1'h1):(1'h1)];
          reg9 <= $unsigned({$unsigned((|wire0)),
              (wire3[(4'hb):(2'h2)] ^ $unsigned((wire3 ~^ reg7)))});
          if ($unsigned(((!(|(^~wire2))) ? wire5 : (8'hbd))))
            begin
              reg10 <= wire5[(2'h3):(2'h3)];
              reg11 <= wire1[(2'h2):(1'h0)];
            end
          else
            begin
              reg10 <= (^(8'hb7));
              reg11 <= (wire6[(1'h0):(1'h0)] ? wire4 : wire2);
              reg12 <= $unsigned((-$unsigned(((+wire2) ?
                  $signed((8'h9d)) : $unsigned(reg7)))));
              reg13 <= (-$signed(reg9));
              reg14 <= $signed((~^(reg9 >> (wire4[(3'h7):(3'h7)] != (wire6 ?
                  reg8 : (8'hb0))))));
            end
        end
      else
        begin
          reg7 <= (^~reg10);
          reg8 <= ($signed($unsigned(((reg10 <<< (8'ha3)) + $unsigned((8'h9f))))) ?
              $unsigned(((wire2 < (-reg7)) | (-((8'h9d) || wire5)))) : wire0);
        end
    end
  assign wire15 = ((~|(|wire1)) ? reg10 : {(reg11 && (8'hb2))});
  always
    @(posedge clk) begin
      reg16 <= ((&(reg11 << ((wire0 ?
          wire2 : (8'h9e)) < $signed(wire5)))) >>> $unsigned({wire4[(3'h4):(1'h0)],
          (~&(wire4 <= reg11))}));
    end
  module17 #() modinst96 (wire95, clk, reg10, reg11, reg13, wire6);
  assign wire97 = $unsigned($unsigned(($unsigned((wire95 ? wire3 : wire1)) ?
                      (~&{reg13}) : {$unsigned(reg11)})));
endmodule

module module17
#(parameter param94 = {(({((7'h43) > (8'ha7)), ((8'h9c) ? (8'hbf) : (8'ha3))} == ({(8'hbd), (8'hac)} ? {(8'h9c), (8'hb3)} : ((8'ha0) < (8'hb9)))) < (~^(~^((8'hb0) >= (8'hbe)))))})
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire83;
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire39,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire83,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire22 = ($signed((wire18 ?
                      $unsigned((wire21 >>> wire18)) : wire21[(1'h0):(1'h0)])) <<< ((!$signed(wire21[(1'h0):(1'h0)])) == $signed((8'ha2))));
  assign wire23 = wire22[(1'h1):(1'h0)];
  assign wire24 = $signed((~$signed(wire21)));
  assign wire25 = $signed(wire24[(4'h8):(2'h2)]);
  assign wire26 = wire21[(2'h2):(1'h1)];
  module27 #() modinst40 (wire39, clk, wire24, wire23, wire19, wire20, wire26);
  assign wire41 = ({wire23[(4'hd):(3'h6)]} + ($unsigned($signed(wire26)) ?
                      $signed($unsigned((wire20 ?
                          wire25 : wire22))) : ((|$unsigned(wire21)) ?
                          $signed(wire26) : $signed((wire25 ?
                              wire19 : wire18)))));
  assign wire42 = {wire24};
  assign wire43 = wire22;
  assign wire44 = wire23;
  assign wire45 = wire20;
  module46 #() modinst84 (wire83, clk, wire24, wire19, wire22, wire45, wire25);
  always
    @(posedge clk) begin
      reg85 <= $signed($signed($signed((~|$unsigned(wire18)))));
      reg86 <= $unsigned(wire18[(1'h0):(1'h0)]);
      if ($signed($unsigned($unsigned($unsigned(reg85)))))
        begin
          if (wire23[(1'h1):(1'h0)])
            begin
              reg87 <= reg86;
              reg88 <= ($unsigned(((wire24[(4'ha):(4'h9)] >> $unsigned(wire18)) << reg86)) ?
                  {$unsigned(((wire24 >>> wire25) ?
                          (wire18 ? wire23 : wire25) : $signed(wire44))),
                      wire22} : $signed({$unsigned(wire24[(2'h3):(1'h0)]),
                      ($unsigned(wire24) << wire25)}));
              reg89 <= wire23;
            end
          else
            begin
              reg87 <= (wire24 ?
                  reg89[(1'h1):(1'h1)] : (&$signed(((wire43 > wire19) ?
                      (wire44 ? reg87 : wire43) : (wire39 * wire24)))));
              reg88 <= wire22;
            end
          reg90 <= (-(~^({(|wire23)} ?
              ((+reg87) ^~ (8'ha0)) : $signed((wire45 + reg85)))));
          reg91 <= $signed($signed($unsigned((&$unsigned(wire44)))));
        end
      else
        begin
          if (reg90)
            begin
              reg87 <= (^reg85[(3'h5):(3'h4)]);
              reg88 <= (((reg91[(2'h2):(2'h2)] ?
                          ((wire21 >= wire44) ?
                              $unsigned(wire44) : (!wire23)) : ($unsigned(reg86) & wire41)) ?
                      $signed(reg85[(1'h0):(1'h0)]) : ((~{(8'ha2)}) ?
                          reg90 : wire21[(1'h0):(1'h0)])) ?
                  $signed($unsigned($signed((!wire21)))) : ({$signed($unsigned(wire42)),
                          $signed((reg87 ^ wire24))} ?
                      (((wire18 ^ wire41) ?
                          (!wire24) : (&wire20)) >> (reg87[(1'h1):(1'h0)] ?
                          (8'hb0) : wire83[(2'h3):(2'h2)])) : wire42[(2'h3):(1'h1)]));
              reg89 <= ((wire45[(4'ha):(4'h8)] && (~|($unsigned(wire18) ?
                  reg91 : $unsigned(wire25)))) * (~&$signed((8'hb9))));
              reg90 <= {$signed({(~$unsigned(reg89))}),
                  (+(($unsigned(reg86) ~^ (wire42 ? wire18 : wire41)) ?
                      {(~reg87)} : (~^(wire24 ? reg91 : wire20))))};
              reg91 <= $unsigned((+($signed($unsigned(wire20)) >>> (~&((8'ha5) ^~ wire44)))));
            end
          else
            begin
              reg87 <= wire24[(3'h5):(1'h0)];
              reg88 <= {($signed((~|wire18)) * $unsigned(wire83)),
                  $signed($unsigned(((wire18 + wire26) ?
                      $unsigned(wire21) : (~&wire42))))};
              reg89 <= ((-(($unsigned(wire25) != {(8'ha1)}) ?
                  $unsigned(((8'hb2) ?
                      wire20 : (8'ha0))) : ($unsigned((8'hbf)) ?
                      (reg91 && wire23) : wire45))) >= (8'hb7));
            end
        end
    end
  assign wire92 = $signed(wire20);
  assign wire93 = $unsigned(wire25);
endmodule

module module46
#(parameter param81 = (8'ha1), 
parameter param82 = {(+(|(param81 ? param81 : (~param81)))), (~^param81)})
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire51;
  input wire [(5'h12):(1'h0)] wire50;
  input wire [(4'ha):(1'h0)] wire49;
  input wire signed [(4'h8):(1'h0)] wire48;
  input wire [(5'h11):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  assign y = {wire80,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
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
                 reg53,
                 reg52,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg52 <= wire51;
      reg53 <= (+wire48);
    end
  assign wire54 = {(wire48 >>> wire47), (&(~|((~^(7'h42)) > (!wire47))))};
  assign wire55 = $unsigned(reg53);
  assign wire56 = $unsigned(wire47[(4'hb):(2'h2)]);
  assign wire57 = {$signed(({(|reg52), $signed(reg53)} ?
                          (8'hb7) : ((8'hae) ?
                              $signed(reg53) : (reg53 ? wire50 : wire54))))};
  assign wire58 = $unsigned(wire49);
  assign wire59 = $signed({(reg53[(2'h2):(1'h1)] ?
                          wire50[(3'h7):(1'h0)] : {wire49[(1'h1):(1'h1)]}),
                      ((~(8'hbd)) ?
                          ((wire58 ? reg53 : wire51) > {wire56,
                              (8'ha4)}) : ((wire50 || wire56) ?
                              {(8'hab)} : $unsigned(wire48)))});
  assign wire60 = $unsigned((~|(~&$signed(wire59))));
  assign wire61 = $signed(($signed($signed((wire47 ?
                      wire50 : wire56))) == wire57));
  assign wire62 = $unsigned((|$signed((!$signed(wire57)))));
  assign wire63 = ((wire54[(2'h2):(1'h0)] ?
                          wire55[(2'h2):(1'h1)] : ((-wire49[(4'ha):(2'h3)]) ?
                              (8'hbf) : ($unsigned(wire48) <= $unsigned(reg52)))) ?
                      $unsigned(wire47) : $signed(({(8'hb6)} >= (wire58[(3'h7):(1'h0)] + ((8'hbd) ?
                          (7'h44) : wire60)))));
  assign wire64 = (~($signed((|wire48[(2'h3):(1'h1)])) << $unsigned(({wire48,
                          wire56} ?
                      wire57[(2'h3):(2'h3)] : $signed((7'h44))))));
  assign wire65 = (^~$unsigned({$unsigned(wire47[(2'h2):(1'h0)]),
                      ((!wire47) ? wire59 : (!(8'ha7)))}));
  always
    @(posedge clk) begin
      if (((8'ha9) ? $unsigned((~^(wire54 * (wire54 ^~ wire49)))) : wire59))
        begin
          reg66 <= wire56;
          reg67 <= $signed({($unsigned((7'h44)) == $unsigned((wire62 ?
                  wire56 : wire63))),
              wire48});
          if ($unsigned($unsigned({((wire58 + wire58) <= $unsigned(wire49)),
              wire65[(2'h3):(2'h3)]})))
            begin
              reg68 <= (&(^(-{wire62, (wire55 ? reg53 : wire55)})));
              reg69 <= {((|($unsigned(reg52) ?
                      $unsigned(reg67) : (wire49 == reg66))) - (~&(((8'haf) ?
                      wire60 : wire61) << wire56[(4'he):(3'h6)])))};
              reg70 <= (({((wire58 ? reg67 : (8'hab)) + $signed((8'hac)))} ?
                      ((|((8'hb6) != reg67)) ?
                          (reg69[(4'ha):(3'h6)] ?
                              (wire49 ^~ wire65) : (+(8'hb9))) : {$signed(wire58),
                              (wire47 ?
                                  reg68 : wire59)}) : ((&$unsigned(wire63)) ?
                          ($signed((8'hac)) ?
                              (!(8'h9e)) : ((8'hb5) ?
                                  reg66 : (8'h9d))) : {(~^wire65)})) ?
                  (+(|$signed(wire50[(3'h7):(2'h2)]))) : wire50);
              reg71 <= wire61;
              reg72 <= $unsigned((^(&($signed(wire49) - wire55))));
            end
          else
            begin
              reg68 <= $unsigned((+$unsigned(wire54)));
              reg69 <= ((+reg52[(2'h3):(2'h2)]) == reg70[(3'h6):(1'h1)]);
              reg70 <= (reg67[(5'h13):(5'h12)] != reg69);
              reg71 <= {wire58, {wire57[(3'h6):(1'h0)]}};
              reg72 <= ({(((reg72 ? (8'hb7) : wire54) ?
                      $signed(wire51) : $unsigned(wire57)) >= $unsigned((wire60 | reg71))),
                  reg68[(1'h0):(1'h0)]} >> wire60[(3'h7):(2'h3)]);
            end
          reg73 <= reg71;
        end
      else
        begin
          reg66 <= {((((reg53 * wire62) ? (!reg72) : wire54[(1'h1):(1'h1)]) ?
                      $signed($signed(wire63)) : $signed((~&(8'h9c)))) ?
                  wire61 : reg69),
              $signed((~|($unsigned(wire55) <<< wire57)))};
          reg67 <= ($signed(((-(8'ha6)) > wire60[(2'h3):(1'h0)])) ~^ reg71);
          reg68 <= wire51;
          reg69 <= $signed($signed(((~^{reg73, wire47}) ?
              $signed($signed((8'h9e))) : ((reg66 ?
                  (8'hb0) : wire50) & wire55))));
          reg70 <= (~&wire47[(2'h3):(2'h2)]);
        end
      if ($unsigned(((reg66 * wire59) >= wire58[(5'h10):(4'hb)])))
        begin
          reg74 <= $signed($signed({(wire61[(3'h5):(1'h0)] ?
                  $unsigned(reg68) : (~^wire61))}));
          reg75 <= $signed(((wire56 ?
              wire60 : $unsigned(wire58[(3'h6):(1'h0)])) && $unsigned(((reg70 ?
              (8'hb1) : wire64) <<< (~&wire58)))));
          reg76 <= wire61[(4'he):(4'he)];
          reg77 <= $unsigned((!(wire50 ?
              $signed(reg71) : ((wire64 <<< (8'hba)) ?
                  reg74[(4'hc):(2'h2)] : $signed(wire55)))));
          reg78 <= (!wire59);
        end
      else
        begin
          if (wire62[(4'hf):(2'h2)])
            begin
              reg74 <= ($signed((reg78[(2'h3):(2'h2)] ?
                  wire63 : ($signed(wire48) ?
                      {wire63,
                          wire62} : $unsigned(wire59)))) + $signed((~&wire63[(2'h3):(1'h0)])));
              reg75 <= (!$unsigned($unsigned($signed((reg72 + wire59)))));
              reg76 <= reg76;
            end
          else
            begin
              reg74 <= reg73;
              reg75 <= $unsigned(reg77[(2'h3):(1'h0)]);
              reg76 <= $unsigned(((wire54 ?
                  ((&reg76) ?
                      ((8'h9e) != reg70) : ((8'ha4) ?
                          reg76 : (8'haf))) : $unsigned({wire47})) * $signed(reg66)));
            end
          reg77 <= $signed($signed($unsigned(wire50)));
          reg78 <= wire50[(4'hb):(3'h5)];
          reg79 <= reg74[(3'h5):(1'h1)];
        end
    end
  assign wire80 = ($unsigned(($unsigned(wire58) ?
                      ((-wire58) || $signed((8'hab))) : wire62)) == wire48);
endmodule

module module27
#(parameter param38 = (({((|(7'h44)) + ((8'h9e) << (8'hac)))} ? ((~^(8'ha6)) <= ((~^(8'h9e)) ? (^~(8'ha9)) : ((8'hb9) ? (8'hba) : (8'haf)))) : (+(8'h9e))) >> (((((8'hb1) ? (8'hbc) : (8'h9f)) ? {(8'h9f), (8'h9c)} : (~|(8'hb8))) ? (+((8'hb5) || (8'h9c))) : (&((7'h41) ^~ (8'hab)))) ? (+((~&(8'ha4)) <<< ((8'h9d) ^~ (8'hb9)))) : ({(&(8'hb3))} < {{(8'hb5)}, ((7'h40) == (8'hbb))}))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire32;
  input wire signed [(4'hd):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire [(4'hc):(1'h0)] wire29;
  input wire signed [(4'hd):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  assign y = {wire37, wire36, wire35, wire34, wire33, (1'h0)};
  assign wire33 = wire30;
  assign wire34 = (~$unsigned(wire30));
  assign wire35 = (+wire28);
  assign wire36 = wire32[(3'h7):(3'h6)];
  assign wire37 = ((($unsigned((wire32 ?
                          (8'hab) : wire36)) < (wire30[(2'h2):(1'h0)] ?
                          wire29[(3'h4):(3'h4)] : $unsigned(wire31))) >>> wire35) ?
                      $signed($signed($signed(wire31))) : $unsigned(wire30));
endmodule
