module top
#(parameter param90 = ((((((7'h41) > (8'ha9)) >= ((8'hac) ? (8'hb0) : (8'ha4))) * (+(|(8'hbb)))) & (({(8'h9c)} ? (|(8'h9c)) : ((8'hbf) ? (8'hbb) : (8'h9d))) ? (^((8'ha2) ? (8'ha1) : (7'h40))) : {((8'hbe) * (8'ha0))})) ? ((8'hbd) * (-(((8'hb9) <= (8'ha1)) != ((8'h9f) == (8'ha3))))) : (((8'hbe) * ((+(8'hbc)) ? (&(8'had)) : (-(8'ha7)))) ? (((~(8'hb8)) > ((8'hb3) - (8'h9f))) ? ({(8'hbc), (8'ha9)} & ((8'ha4) ? (8'hba) : (8'hb6))) : ({(8'hbe)} ? (!(8'hac)) : (|(8'ha2)))) : ((((7'h40) > (8'h9f)) ? ((8'hb9) ? (8'hac) : (8'hae)) : ((7'h42) << (8'ha8))) < (|(~^(8'hb8)))))), 
parameter param91 = (&(~|{(param90 || (param90 >> param90)), (|{param90})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = $signed(wire1);
  assign wire6 = wire0[(1'h0):(1'h0)];
  assign wire7 = $unsigned((wire4 ^ {{(wire5 ? wire5 : wire1),
                         $unsigned(wire1)},
                     ($signed(wire3) + wire5[(1'h0):(1'h0)])}));
  assign wire8 = $unsigned(wire1[(1'h0):(1'h0)]);
  assign wire9 = $unsigned({({wire3[(4'ha):(4'h9)]} >>> (~^$unsigned(wire2))),
                     wire8[(2'h3):(2'h3)]});
  assign wire10 = $unsigned((7'h40));
  always
    @(posedge clk) begin
      reg11 <= {(($unsigned($signed(wire6)) != {(^wire3),
                  wire2[(4'hd):(1'h1)]}) ?
              (~^wire2) : $unsigned((8'ha4)))};
      reg12 <= ($unsigned(({wire0[(1'h1):(1'h1)]} | ((wire4 ?
              wire8 : wire9) ^ wire10))) ?
          {wire9} : (|wire10[(4'hb):(2'h2)]));
    end
  module13 #() modinst61 (wire60, clk, wire2, wire5, wire10, wire8);
  assign wire62 = {wire5[(3'h7):(1'h1)], $unsigned(wire1[(2'h2):(1'h0)])};
  assign wire63 = $signed(wire0[(2'h2):(2'h2)]);
  assign wire64 = wire63;
  always
    @(posedge clk) begin
      reg65 <= (8'ha8);
      if ($signed({$signed(reg11)}))
        begin
          if ((+{$signed($unsigned($signed(wire64)))}))
            begin
              reg66 <= {wire1[(1'h0):(1'h0)],
                  (~|(wire1[(1'h1):(1'h0)] ?
                      wire60[(2'h2):(2'h2)] : {$signed(wire10),
                          $signed(reg65)}))};
              reg67 <= wire0[(2'h2):(2'h2)];
            end
          else
            begin
              reg66 <= (~^((|$signed($signed(wire3))) <<< $signed($signed((8'hb6)))));
              reg67 <= {(reg12[(2'h2):(2'h2)] >> (!(|wire6[(5'h10):(3'h5)]))),
                  $unsigned((-wire0[(2'h3):(1'h1)]))};
            end
          reg68 <= $unsigned((~|$signed(wire60)));
          if (({($signed((wire7 && reg67)) ?
                  ($signed(wire62) ?
                      (+wire2) : $signed(wire63)) : reg66[(1'h1):(1'h1)])} ^~ $unsigned(wire1)))
            begin
              reg69 <= (wire60[(1'h1):(1'h0)] ?
                  $unsigned($unsigned(wire6)) : ($signed((|reg65[(5'h14):(3'h5)])) ?
                      $signed((wire1[(1'h1):(1'h0)] > wire5[(5'h13):(1'h0)])) : wire8));
              reg70 <= wire7;
              reg71 <= (($unsigned(wire3) != (wire8 ?
                      (!$unsigned((8'ha6))) : (!(reg70 ? wire4 : wire64)))) ?
                  ((((wire5 < wire2) >>> (^~wire9)) != $unsigned((~&wire63))) ?
                      wire2[(3'h6):(1'h1)] : $signed(wire1)) : $signed((~(&{reg66}))));
              reg72 <= $unsigned({($signed($unsigned((8'ha8))) ?
                      wire6[(4'he):(4'h9)] : {$unsigned(reg12)}),
                  {wire7, {$signed((8'h9e)), (~^reg71)}}});
            end
          else
            begin
              reg69 <= $signed($signed(reg71[(3'h4):(1'h1)]));
              reg70 <= wire7[(2'h3):(2'h3)];
              reg71 <= (8'hb7);
              reg72 <= reg68[(2'h2):(1'h1)];
            end
          reg73 <= $unsigned((~reg67[(1'h0):(1'h0)]));
        end
      else
        begin
          reg66 <= wire9[(3'h7):(1'h0)];
          reg67 <= {wire60, reg66[(3'h5):(3'h4)]};
        end
      reg74 <= {reg71,
          (((&(-reg11)) ^ wire1) ?
              ((+reg72) ?
                  (&$signed(wire4)) : $signed($signed(wire64))) : $unsigned($unsigned((wire2 * wire4))))};
      if ({(reg67[(1'h1):(1'h1)] ?
              $unsigned($signed((8'h9f))) : (~&$unsigned((+wire9))))})
        begin
          if (reg74)
            begin
              reg75 <= $unsigned($signed((~|(~|wire1))));
              reg76 <= (8'had);
              reg77 <= ($unsigned((8'ha4)) ?
                  ({wire4[(1'h1):(1'h0)], {$unsigned(wire2)}} ?
                      reg71 : {reg70,
                          reg73[(3'h4):(1'h0)]}) : reg76[(2'h2):(1'h0)]);
              reg78 <= (|(wire5 ?
                  wire60 : ((|$signed(reg72)) <<< (((8'hb1) ? reg73 : wire7) ?
                      wire64 : {wire5, reg76}))));
              reg79 <= (8'ha5);
            end
          else
            begin
              reg75 <= {(&$signed($signed(reg68)))};
              reg76 <= wire5;
              reg77 <= (|(+(reg65 ? reg11 : $signed((-reg75)))));
              reg78 <= $unsigned((|(((wire62 * wire8) || reg69[(4'h8):(3'h6)]) < (~(reg70 ?
                  reg69 : reg79)))));
              reg79 <= ((($unsigned(reg67) <= reg67) ?
                  wire62 : (~|{{wire3}, (~&wire4)})) & {(((reg75 ?
                              wire63 : wire3) ?
                          (reg74 & (8'ha7)) : {reg66}) ?
                      ((reg12 ? wire2 : wire60) ?
                          (wire0 ?
                              wire64 : reg67) : (~^wire10)) : ($signed(reg65) + (&(8'h9f)))),
                  (|($unsigned(reg75) << $signed(wire5)))});
            end
          reg80 <= ((wire10 < $signed($signed((reg78 ^ wire60)))) ?
              (^$signed(reg66[(3'h4):(2'h3)])) : (|($signed(reg74[(1'h0):(1'h0)]) | $signed((wire1 ?
                  reg71 : (8'hb2))))));
          reg81 <= $signed(((!(~^$signed((8'ha4)))) ?
              (+reg76) : (~^((reg76 ? wire1 : reg69) <<< reg66))));
          reg82 <= $unsigned(reg70);
          reg83 <= reg75[(1'h0):(1'h0)];
        end
      else
        begin
          reg75 <= (^{$signed($unsigned(wire8))});
        end
    end
  assign wire84 = (&wire3[(3'h6):(1'h1)]);
  assign wire85 = reg77;
  assign wire86 = ($signed(wire7[(1'h0):(1'h0)]) ?
                      ($signed($unsigned((~&wire5))) ?
                          reg65 : {($unsigned(wire8) | wire62[(3'h6):(1'h0)])}) : $unsigned(({reg80} <<< reg82[(1'h1):(1'h0)])));
  assign wire87 = $unsigned(({$unsigned((reg71 >= wire2))} & reg71[(1'h1):(1'h1)]));
  assign wire88 = ({(reg82 + {(reg68 << (8'hb5))}),
                      reg71[(5'h14):(3'h7)]} ^ (reg66[(3'h4):(2'h2)] ?
                      wire3[(3'h5):(3'h4)] : $unsigned(reg71)));
  assign wire89 = $unsigned($unsigned((!((reg74 ? reg78 : reg67) ?
                      (wire1 ? wire5 : (8'hbf)) : reg75[(2'h2):(1'h0)]))));
endmodule

module module13
#(parameter param59 = (&((!{((7'h43) ^ (8'hb2)), ((8'h9c) ? (8'hac) : (8'hbe))}) ? {((8'ha5) <= ((8'ha8) ? (8'ha2) : (8'haa)))} : (|(((8'hb5) ? (8'hb4) : (8'ha4)) & ((8'haa) ? (8'h9c) : (8'hab)))))))
(y, clk, wire14, wire15, wire16, wire17);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire40;
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire51,
                 wire18,
                 wire40,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire18 = $unsigned((|((^$unsigned(wire16)) | wire16[(1'h0):(1'h0)])));
  module19 #() modinst41 (wire40, clk, wire18, wire16, wire17, wire14, wire15);
  always
    @(posedge clk) begin
      if (wire14)
        begin
          reg42 <= ((^~(!(&$unsigned(wire15)))) == wire16[(2'h2):(2'h2)]);
          reg43 <= {wire16[(4'hf):(4'ha)]};
          if (((~$unsigned(({wire14,
              wire18} + (8'hbc)))) & (!(wire16[(4'hc):(4'hb)] ?
              $unsigned($signed(wire17)) : wire40))))
            begin
              reg44 <= $signed(($unsigned($unsigned(((8'ha1) > wire16))) != $signed(wire14)));
            end
          else
            begin
              reg44 <= (|$unsigned($unsigned(($unsigned(reg43) ?
                  $signed(wire18) : (wire15 >= wire15)))));
              reg45 <= (($unsigned(($signed(reg43) ^~ wire14[(4'hd):(2'h3)])) | $unsigned({(8'ha0),
                  $unsigned(reg44)})) >= (+wire14[(1'h1):(1'h1)]));
            end
          reg46 <= {wire15,
              (reg42 ? $unsigned($signed((&reg45))) : reg44[(1'h0):(1'h0)])};
          reg47 <= (reg42[(3'h6):(2'h3)] <= (^~wire17[(4'he):(4'ha)]));
        end
      else
        begin
          reg42 <= ((^~({(wire17 ? wire16 : wire18)} ? wire17 : reg46)) ?
              $signed((8'hba)) : (wire14 ?
                  $signed($unsigned($unsigned((8'h9c)))) : ({$signed(reg45),
                          reg47} ?
                      (wire17 ? $unsigned((8'ha3)) : wire15) : ((|reg45) ?
                          (wire40 ? (8'h9c) : reg45) : {wire16}))));
          reg43 <= $unsigned((&reg43));
          if (((($unsigned((wire17 * wire17)) ?
              ($unsigned(reg42) & {reg45}) : $unsigned($signed((8'ha6)))) || (wire15[(4'hc):(1'h0)] ?
              ($unsigned(reg43) + $unsigned((8'ha3))) : $unsigned({reg42}))) != (7'h41)))
            begin
              reg44 <= {reg47[(3'h6):(1'h0)], reg45};
              reg45 <= wire16[(3'h7):(3'h4)];
            end
          else
            begin
              reg44 <= $unsigned(((~&{((8'hbe) >>> wire14)}) ?
                  (wire18[(3'h5):(2'h3)] == {$signed(reg47)}) : ($unsigned((reg43 >= reg45)) ?
                      (~&(~reg44)) : ($unsigned(reg45) ?
                          $unsigned((8'had)) : (reg47 || reg47)))));
              reg45 <= reg43[(2'h3):(2'h2)];
              reg46 <= wire18[(2'h2):(2'h2)];
            end
          reg47 <= wire15[(4'h8):(3'h6)];
          reg48 <= {$signed({(wire40 ~^ ((8'h9c) ? wire14 : (8'had))),
                  ($signed(reg46) ? $unsigned(reg44) : (^~wire17))})};
        end
      reg49 <= wire40;
      reg50 <= (wire16[(4'h8):(3'h6)] ?
          ((8'hb5) + $signed($unsigned((-(8'hb1))))) : {wire16[(4'hc):(1'h0)]});
    end
  assign wire51 = ((+reg49) ~^ (8'h9e));
  always
    @(posedge clk) begin
      reg52 <= $unsigned(($unsigned({((8'hb5) ? reg49 : wire17)}) & wire16));
      if ($unsigned($signed($unsigned(reg45))))
        begin
          reg53 <= (~^(7'h42));
        end
      else
        begin
          reg53 <= reg42;
          if ((wire17 >= (reg50[(2'h3):(2'h2)] > (~&$signed((reg45 != (7'h43)))))))
            begin
              reg54 <= ((wire18[(1'h0):(1'h0)] & reg52[(3'h5):(3'h5)]) ?
                  wire15 : (reg52 <<< $unsigned(reg45)));
              reg55 <= {((reg45 || $signed((reg52 - (8'hb6)))) ?
                      ((~|reg44) ~^ (7'h44)) : (($unsigned(wire15) ?
                              (!(8'ha1)) : $unsigned(wire14)) ?
                          reg47[(1'h1):(1'h1)] : (~^reg46)))};
            end
          else
            begin
              reg54 <= $unsigned((reg44[(2'h3):(2'h3)] ?
                  (((reg50 ? reg47 : reg52) ?
                          (~|wire40) : wire18[(5'h10):(5'h10)]) ?
                      (reg49[(5'h13):(3'h5)] ?
                          wire16 : $unsigned(wire16)) : ((&wire14) | (+(8'h9c)))) : ($signed(reg46[(4'h9):(4'h9)]) && reg44)));
              reg55 <= ({(!({wire15} < (wire18 != wire14)))} ?
                  wire51 : ($signed(wire15[(5'h10):(1'h1)]) ?
                      reg45[(4'he):(1'h0)] : wire16));
              reg56 <= ($unsigned($unsigned((-$unsigned((8'ha4))))) - ($unsigned(($unsigned(reg44) ?
                      ((8'had) ? reg49 : wire16) : $signed(reg47))) ?
                  reg43 : reg53));
            end
          reg57 <= {(wire40[(2'h2):(1'h0)] >>> $unsigned(wire40[(2'h2):(1'h0)]))};
        end
      reg58 <= (((wire17 ?
          $unsigned({reg54, reg42}) : {wire17, (~wire16)}) - {{{(8'ha5)},
              {(8'hac), reg53}},
          ((reg53 ?
              reg45 : wire14) > $unsigned(reg57))}) < reg52[(1'h0):(1'h0)]);
    end
endmodule

module module19
#(parameter param39 = (((~|(((8'h9f) ? (8'h9c) : (8'hac)) ? ((8'hbf) ? (8'ha5) : (8'hbf)) : {(8'ha7), (8'hb6)})) ? {(((8'hbf) | (8'ha4)) - {(8'ha8), (7'h43)}), (~&{(8'hb2), (7'h44)})} : {((^(8'ha8)) & ((8'haf) >>> (7'h41)))}) ? ({(|{(8'ha5), (8'h9d)}), (((8'ha8) >= (8'ha2)) ? {(8'had), (8'hb8)} : ((8'hbd) ? (8'hbb) : (8'h9c)))} ? {({(8'ha0)} * (~|(8'hbd))), (((8'h9e) ? (8'hab) : (8'ha8)) ? ((8'hab) ? (8'haf) : (8'hb8)) : {(8'hb7)})} : ({(^(8'hbb)), ((8'ha2) ? (8'ha2) : (8'hac))} - ((7'h40) ? (^(8'ha2)) : ((8'hb8) ? (8'ha0) : (8'ha3))))) : {((((8'ha5) ? (7'h41) : (8'hbc)) ? (~^(8'hae)) : ((8'h9f) ? (8'ha3) : (8'hb8))) < (^(&(7'h44))))}))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire23;
  input wire signed [(5'h15):(1'h0)] wire22;
  input wire [(5'h14):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire28;
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire28,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire23 ?
          (^~($signed((wire24 >>> wire23)) != wire22)) : $unsigned((($unsigned(wire22) ?
              wire20 : ((8'h9f) ?
                  wire23 : wire20)) != (|(wire20 >>> (8'hba)))))))
        begin
          reg25 <= (-((8'hb1) + $unsigned(wire23[(2'h3):(1'h1)])));
          reg26 <= $signed(wire21);
          reg27 <= wire20[(3'h5):(1'h1)];
        end
      else
        begin
          reg25 <= ($signed((&$unsigned(reg26[(4'h9):(4'h9)]))) ?
              $signed((((^reg26) ? reg25[(2'h2):(1'h0)] : (reg25 || wire23)) ?
                  ((wire21 ?
                      (8'h9f) : wire20) <= $signed(reg27)) : reg27)) : $unsigned((|reg25)));
        end
    end
  assign wire28 = {wire24[(3'h5):(2'h3)],
                      $signed((((^wire21) == $unsigned(reg27)) | $unsigned((8'hb4))))};
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned($signed((wire24 ?
          reg25 : wire22))) - (reg27[(1'h0):(1'h0)] | $signed($unsigned(wire21))))))
        begin
          reg29 <= $unsigned(reg27);
          reg30 <= $unsigned(reg27);
          if (wire22[(4'h8):(3'h5)])
            begin
              reg31 <= reg30;
              reg32 <= ($unsigned((^~(~|$signed(wire28)))) ?
                  ((8'had) < wire28[(5'h11):(5'h10)]) : $signed((reg26[(4'ha):(1'h0)] ?
                      {{wire23, wire22}, $unsigned(wire22)} : ((wire20 ?
                              wire28 : wire20) ?
                          $signed(wire24) : (reg25 && wire23)))));
              reg33 <= {wire24};
              reg34 <= wire21;
            end
          else
            begin
              reg31 <= $unsigned((($signed((reg34 ? (8'hb1) : (8'hb1))) ?
                      (reg30 << $signed((7'h44))) : {(~wire21)}) ?
                  reg25[(3'h4):(2'h2)] : wire22[(5'h11):(3'h4)]));
              reg32 <= (!(((^~(wire28 == reg27)) + $signed((-reg27))) ?
                  (8'hb1) : $signed({{reg33, reg32}, (reg27 <= reg33)})));
              reg33 <= ($unsigned((^reg27)) ?
                  (wire20 ?
                      $unsigned(wire24[(2'h2):(1'h1)]) : ((+$signed(reg27)) << ((-wire24) ?
                          $unsigned(reg32) : $signed(reg27)))) : $signed((reg30[(1'h1):(1'h0)] ?
                      $signed(reg29) : wire23)));
              reg34 <= reg29;
              reg35 <= $unsigned((((wire22 < (wire22 ?
                  reg29 : (7'h44))) + (+(!wire20))) == wire21));
            end
        end
      else
        begin
          reg29 <= reg33[(4'hf):(4'hf)];
        end
    end
  assign wire36 = (|$signed($unsigned(((!(8'ha9)) << ((8'hb8) != wire24)))));
  assign wire37 = ({reg30[(4'h8):(3'h6)]} == (reg32 ~^ reg31[(5'h10):(2'h2)]));
  assign wire38 = $unsigned({{$unsigned((reg31 ? reg35 : wire36))}});
endmodule
