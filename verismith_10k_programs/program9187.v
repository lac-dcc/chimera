module top
#(parameter param78 = {{((((8'had) - (7'h40)) < {(8'hb0), (8'hb3)}) ^~ (~&((8'hb0) + (8'hab)))), {(^~(8'hb7)), (^((8'hb1) || (8'hae)))}}}, 
parameter param79 = {(^~(((param78 == param78) ^ {param78, param78}) << param78))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire45;
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire45,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  module4 #() modinst46 (wire45, clk, wire0, wire2, wire3, wire1);
  assign wire47 = wire1;
  assign wire48 = $signed($unsigned(($unsigned(wire0) ?
                      wire45[(3'h4):(3'h4)] : wire2[(3'h4):(3'h4)])));
  always
    @(posedge clk) begin
      reg49 <= (wire45 ~^ wire3);
      if (({wire47} << $unsigned($unsigned({wire1}))))
        begin
          reg50 <= (~^(wire3 - $unsigned((|(wire3 ? reg49 : wire3)))));
          reg51 <= $signed((wire45[(1'h0):(1'h0)] | $unsigned((&$unsigned(wire45)))));
          reg52 <= wire1;
        end
      else
        begin
          if ((8'hba))
            begin
              reg50 <= reg52[(3'h6):(1'h1)];
              reg51 <= reg50[(4'hc):(1'h0)];
              reg52 <= wire1;
              reg53 <= wire0;
              reg54 <= $unsigned(wire3);
            end
          else
            begin
              reg50 <= ($unsigned((reg52 ?
                      wire2[(3'h7):(3'h7)] : ((8'had) ^ (wire45 | wire48)))) ?
                  $signed(reg53[(3'h6):(3'h4)]) : $unsigned((!(!(reg52 ?
                      reg51 : reg49)))));
            end
          reg55 <= reg54[(3'h4):(1'h1)];
        end
      if (wire48)
        begin
          if ((wire48 >> wire2))
            begin
              reg56 <= wire48[(1'h1):(1'h1)];
              reg57 <= ((|(-((8'ha1) * (reg53 ^~ reg49)))) == (&$unsigned(((wire3 ?
                      wire2 : reg54) ?
                  (wire47 <<< wire2) : (~|wire1)))));
            end
          else
            begin
              reg56 <= ((!(~&wire2)) <<< $unsigned((~&(~&{reg50, (8'ha6)}))));
              reg57 <= ($unsigned($unsigned({(wire1 * reg55)})) >= $unsigned(wire45));
              reg58 <= ((reg53 & $signed(reg55[(2'h2):(2'h2)])) ?
                  wire2 : $unsigned(wire47[(4'hf):(4'hf)]));
              reg59 <= (!(-(~&$unsigned({reg52}))));
              reg60 <= reg51[(4'hf):(2'h2)];
            end
        end
      else
        begin
          if ($signed(((reg50[(3'h6):(2'h2)] ?
                  wire47[(4'he):(4'hb)] : $signed((wire2 ? wire1 : wire45))) ?
              ($signed((reg53 ? reg58 : wire2)) ?
                  ((^~reg50) >>> $unsigned(reg55)) : (reg56 ?
                      $signed(reg60) : $unsigned(wire48))) : reg53[(2'h2):(1'h1)])))
            begin
              reg56 <= (~|$unsigned($unsigned({reg52[(4'hb):(4'h8)],
                  (wire2 ? reg58 : reg56)})));
              reg57 <= $signed((((&(~^reg56)) >= (-(~^wire47))) >>> $unsigned((wire2[(4'hd):(3'h6)] ?
                  reg49 : reg50))));
              reg58 <= ({$signed($signed({reg58, reg56}))} ?
                  reg51[(3'h5):(3'h5)] : (-($unsigned((reg51 <= wire2)) > (-((8'hbb) ?
                      wire48 : (8'hbe))))));
              reg59 <= wire2[(1'h1):(1'h0)];
              reg60 <= (&(reg52 + reg52));
            end
          else
            begin
              reg56 <= $signed((-(reg57[(4'h9):(3'h5)] ?
                  reg59[(5'h12):(3'h4)] : (~(wire3 <= reg56)))));
              reg57 <= ((+(^((reg55 ?
                  wire2 : reg52) != {wire48}))) <<< $unsigned((8'hbc)));
            end
          reg61 <= $signed(reg54[(3'h4):(3'h4)]);
          reg62 <= (!wire45);
          reg63 <= ({$unsigned($unsigned(wire47)),
              wire45} > $signed(wire47[(4'he):(4'he)]));
        end
    end
  always
    @(posedge clk) begin
      reg64 <= $unsigned((reg53 >>> {{(reg53 | reg56)},
          (((8'h9e) ? reg62 : wire3) ? $signed(reg55) : reg49)}));
      reg65 <= wire48[(3'h4):(3'h4)];
      if (($unsigned((|(((8'ha5) > reg50) >= (wire1 > reg50)))) >>> ((~$signed((~&wire47))) & (reg51 >>> {(&reg53)}))))
        begin
          reg66 <= wire48;
          if ({reg60[(1'h0):(1'h0)]})
            begin
              reg67 <= ((reg66 != (wire48[(4'ha):(1'h0)] >>> (8'h9d))) != (&$unsigned(reg66)));
              reg68 <= (-($signed($unsigned(reg66[(4'he):(2'h2)])) ?
                  ((reg54[(1'h1):(1'h0)] ?
                      {reg56, wire45} : (wire3 ?
                          reg50 : (8'hb4))) + $signed((wire47 ?
                      reg59 : reg53))) : (~|wire48)));
            end
          else
            begin
              reg67 <= (^~$signed(reg49));
              reg68 <= reg66[(4'hf):(4'hd)];
            end
          reg69 <= (~^$signed((^~reg55[(2'h3):(1'h1)])));
        end
      else
        begin
          reg66 <= {reg59[(4'ha):(3'h4)]};
          reg67 <= (^reg50);
        end
    end
  always
    @(posedge clk) begin
      reg70 <= reg52[(4'ha):(3'h4)];
      if ((8'hbd))
        begin
          reg71 <= (~|wire2);
        end
      else
        begin
          reg71 <= $unsigned(reg64);
          reg72 <= $signed({(!((wire0 < reg52) ?
                  $signed((8'hbb)) : reg66[(1'h0):(1'h0)])),
              ((|(~^reg52)) * $signed(wire47))});
          if ($unsigned((wire3[(2'h2):(2'h2)] ?
              (((~|reg67) ? reg68[(4'hb):(4'h8)] : wire47) ?
                  ((wire47 | wire0) ?
                      reg49 : ((8'ha8) ?
                          reg51 : reg56)) : (^reg58)) : $signed(reg59))))
            begin
              reg73 <= $signed((~$signed(($signed(reg72) ?
                  (reg71 ? wire1 : reg64) : (reg65 ^~ (8'haf))))));
            end
          else
            begin
              reg73 <= ($signed(($unsigned(reg61) <<< reg54[(3'h7):(3'h6)])) ?
                  (wire48 ~^ $signed($signed((reg56 > reg72)))) : ((reg57 ?
                          $signed($unsigned(reg59)) : wire47) ?
                      (($signed(reg52) ? wire48[(3'h5):(3'h4)] : (~|reg50)) ?
                          ((+reg58) ~^ reg52) : reg64[(1'h1):(1'h1)]) : wire0[(3'h7):(1'h0)]));
              reg74 <= reg65;
              reg75 <= ($unsigned($signed(wire48)) ?
                  wire2[(4'h9):(2'h2)] : $signed($unsigned(reg61)));
              reg76 <= (~|$unsigned($unsigned($unsigned((reg74 >> reg74)))));
            end
        end
      reg77 <= {$signed(({reg50[(4'hc):(2'h2)], {reg72, reg52}} ?
              ((reg60 ? reg75 : wire3) ?
                  wire3[(1'h0):(1'h0)] : reg55) : (~^$signed(reg56))))};
    end
endmodule

module module4
#(parameter param43 = (!((((^~(8'hb6)) << {(8'hbd), (8'hbe)}) ~^ (&((8'ha8) ? (8'ha5) : (8'hb3)))) && {(~((8'ha4) ? (8'had) : (8'hab))), (((8'h9f) <<< (8'haf)) >= (~(8'ha9)))})), 
parameter param44 = (({(~|(param43 ? param43 : param43)), ((!param43) >= (~&param43))} - param43) ? {(~|((param43 ? param43 : param43) ? param43 : (param43 ? (8'ha7) : param43))), (({param43, param43} ? (8'hbd) : (param43 <= param43)) | ({param43} ? (param43 ? param43 : param43) : {param43, param43}))} : {param43}))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire10;
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire42, wire41, wire39, wire37, wire10, reg40, reg9, (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= {{wire5[(5'h11):(4'he)]},
          ($unsigned((7'h44)) ? wire8[(3'h4):(1'h0)] : wire5[(5'h11):(1'h0)])};
    end
  assign wire10 = (^(|$unsigned((wire8 ?
                      $unsigned(reg9) : (wire5 <<< wire6)))));
  module11 #() modinst38 (wire37, clk, reg9, wire8, wire5, wire6, wire10);
  assign wire39 = wire6;
  always
    @(posedge clk) begin
      reg40 <= (~^wire10);
    end
  assign wire41 = ((($unsigned((wire39 ? wire7 : wire5)) ?
                          wire39 : (wire5 ^~ (wire7 && reg9))) ?
                      (+((wire39 ? (7'h41) : wire39) ^~ (reg40 ?
                          wire39 : wire8))) : (|$unsigned(wire10[(2'h2):(1'h0)]))) == (($signed((wire10 ?
                              wire7 : wire39)) ?
                          (~wire10) : $unsigned({wire37})) ?
                      $unsigned(((~&(8'hba)) ?
                          (wire5 ?
                              wire6 : wire37) : wire37[(3'h5):(2'h2)])) : {((wire6 >= wire7) ?
                              reg9[(5'h11):(4'hb)] : $unsigned(wire37)),
                          $signed(wire10[(3'h6):(3'h4)])}));
  assign wire42 = (&(~|{$signed((reg9 ? wire41 : (8'ha5))), (~&(~wire6))}));
endmodule

module module11
#(parameter param35 = ((~^(^{((8'hb4) ? (8'h9e) : (8'hb0)), (8'ha2)})) && (+{(((8'ha5) ? (8'hb9) : (7'h42)) ? {(8'hbd), (8'hb0)} : ((7'h44) ? (7'h40) : (8'hb2)))})), 
parameter param36 = (param35 ? {(~^(8'hb5)), (~|{(!param35), param35})} : (8'h9d)))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire16;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire signed [(3'h7):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire17;
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  assign y = {wire21,
                 wire17,
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
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire17 = wire12[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg18 <= ($signed(((8'haa) << $unsigned(wire16))) ?
          (+wire16[(4'h8):(3'h6)]) : $signed($signed({wire16[(3'h5):(3'h4)],
              wire13[(2'h2):(1'h0)]})));
      reg19 <= reg18[(3'h4):(3'h4)];
      reg20 <= ((^~reg18) ^~ reg19);
    end
  assign wire21 = wire12;
  always
    @(posedge clk) begin
      reg22 <= (~({(((8'hb1) ? wire12 : wire21) == (^~wire13))} <= wire21));
      reg23 <= wire12[(3'h5):(3'h4)];
      reg24 <= wire17;
      if (($signed(wire14[(1'h1):(1'h1)]) ?
          ((~^wire15) << wire16[(4'he):(3'h7)]) : {$signed((|{reg18})), reg22}))
        begin
          if ((wire16[(4'h9):(3'h7)] >= (|wire21)))
            begin
              reg25 <= wire16;
              reg26 <= $unsigned(wire14);
              reg27 <= ($signed((((wire16 ? (8'hbb) : reg19) ?
                          (reg22 && reg26) : $unsigned(reg23)) ?
                      (-$unsigned(reg19)) : {{reg25}})) ?
                  {$signed(((reg22 > reg20) * (wire12 | reg18)))} : $unsigned(reg19[(1'h1):(1'h0)]));
            end
          else
            begin
              reg25 <= $signed(wire13[(1'h0):(1'h0)]);
              reg26 <= (wire12[(4'hf):(4'hc)] ?
                  $unsigned(wire13) : $signed($signed($unsigned($signed(reg27)))));
              reg27 <= (~^$signed(reg24[(3'h4):(1'h0)]));
              reg28 <= $signed(wire12);
              reg29 <= ((reg19[(3'h5):(2'h3)] <= ($unsigned((reg18 != reg28)) ?
                      (reg27 ?
                          wire16[(4'hb):(2'h3)] : (8'hb8)) : $unsigned((~|reg27)))) ?
                  (&((reg25 ?
                      (wire14 ? wire13 : reg20) : (reg26 ?
                          wire16 : wire13)) - reg24[(3'h7):(1'h0)])) : ($unsigned(((!wire17) >> ((8'hb0) ?
                          (8'hae) : (8'hb0)))) ?
                      ($unsigned($signed((8'hb4))) << ($signed(wire16) ?
                          wire17 : (reg24 || wire16))) : $signed((&(7'h44)))));
            end
          reg30 <= $unsigned($unsigned((({reg24} || $signed(reg19)) ?
              (wire16 < (8'ha7)) : $signed((wire17 <= reg26)))));
        end
      else
        begin
          if ($signed($unsigned({(~&(-reg27))})))
            begin
              reg25 <= {(~|(8'ha3)), reg25};
              reg26 <= (-reg26);
              reg27 <= $unsigned($unsigned($signed(wire12[(3'h7):(3'h6)])));
            end
          else
            begin
              reg25 <= $signed((|reg18[(4'ha):(3'h4)]));
              reg26 <= (($signed((-wire15[(2'h3):(2'h3)])) ?
                  $signed(((reg26 - reg26) & reg28)) : (($signed(wire16) ?
                      (^(8'h9f)) : (~reg29)) ^~ (((8'hb2) <<< reg19) >>> {(8'hae)}))) * reg27[(5'h13):(1'h1)]);
              reg27 <= reg23[(3'h6):(2'h2)];
              reg28 <= ({(&(~reg25))} ?
                  ($signed((^~reg25)) >> (reg27 != $signed($signed(wire15)))) : ((((reg18 ?
                          reg27 : reg26) < $signed((8'hbc))) * (+(~&reg26))) ?
                      {(wire16[(2'h3):(2'h3)] ? $unsigned(reg29) : (~^wire21)),
                          ((^~reg27) ?
                              (reg18 <= wire16) : $signed(wire21))} : (+(+reg22[(2'h2):(2'h2)]))));
            end
          reg29 <= (~&((wire16[(1'h0):(1'h0)] | ($signed(wire14) >>> (!reg27))) ?
              {(-{(8'hb6), reg24})} : ({(wire13 ? reg19 : reg24),
                  $unsigned(wire16)} ~^ $unsigned(wire15))));
          if ((($signed({(~&wire12)}) ?
                  reg30[(4'h8):(2'h3)] : $signed((reg27[(3'h6):(2'h2)] * (wire12 && (8'ha3))))) ?
              {reg25} : (8'hbc)))
            begin
              reg30 <= {$unsigned((($signed((8'hab)) ?
                      $unsigned(reg18) : (reg29 & wire13)) + $signed($unsigned(reg26)))),
                  (8'hb0)};
              reg31 <= (!wire17);
              reg32 <= ((~&((&$unsigned(wire13)) ?
                  ($signed(reg18) >> ((8'hb7) ?
                      reg31 : reg25)) : {$signed(reg31),
                      $signed(wire15)})) >> wire14);
              reg33 <= ($signed(($unsigned(reg24) * {reg26[(3'h5):(3'h5)]})) ?
                  (wire16[(3'h5):(3'h5)] | (reg22 << (+reg28[(4'hd):(4'hb)]))) : ((!(8'hbf)) ?
                      $unsigned(wire12[(4'hc):(3'h7)]) : ($signed(reg27[(5'h15):(4'hb)]) ?
                          ((wire16 > (8'h9d)) >> (wire16 ?
                              reg29 : reg23)) : wire21[(3'h7):(2'h2)])));
              reg34 <= ({{$signed((8'ha5))}, reg24[(4'ha):(3'h7)]} ?
                  ($unsigned(reg25[(3'h7):(2'h2)]) ?
                      {$signed((reg30 - reg31))} : (8'hb9)) : (reg32 ?
                      $signed(((wire13 ?
                          wire21 : reg22) << (-wire17))) : $signed(((reg32 ?
                              reg23 : reg25) ?
                          (reg25 ? (8'ha4) : reg26) : $signed(reg20)))));
            end
          else
            begin
              reg30 <= $unsigned(reg30);
              reg31 <= {reg24[(4'hb):(3'h7)], reg30};
            end
        end
    end
endmodule
