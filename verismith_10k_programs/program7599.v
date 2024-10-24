module top
#(parameter param88 = ((((8'haf) ^~ {((8'haf) ^~ (8'hac)), ((8'hb7) > (7'h42))}) ? (((-(8'hb3)) & (!(8'ha9))) ? (((8'ha5) ? (8'hba) : (8'hbc)) ? (8'hb1) : ((8'hb8) ? (8'ha6) : (8'h9c))) : ({(8'h9c), (8'ha8)} > {(8'hb4), (8'h9f)})) : ((((8'ha7) - (8'hb5)) ^~ (~&(8'hab))) ~^ {((8'hae) ? (8'h9e) : (8'ha9)), ((7'h40) > (8'hb8))})) ^~ ((({(8'hb4)} ^ (~|(8'ha9))) ? (-((8'hb9) != (8'had))) : (~((7'h43) == (7'h41)))) << ({{(8'hbc)}} ~^ (((7'h43) && (8'had)) ? ((8'hbd) << (7'h40)) : (~^(8'hb9)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire84;
  assign y = {wire87,
                 wire86,
                 wire5,
                 wire6,
                 wire7,
                 wire18,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire84,
                 (1'h0)};
  assign wire5 = ((wire4[(2'h3):(1'h1)] ?
                         (^~wire3) : ($signed((~^wire4)) >> ({wire1} ?
                             ((8'hb6) ? wire3 : wire4) : (wire0 || (7'h40))))) ?
                     $unsigned($signed({(wire3 > wire2),
                         (|wire3)})) : (^(8'h9e)));
  assign wire6 = $unsigned((-(8'hb7)));
  assign wire7 = $signed(wire6[(4'ha):(2'h2)]);
  module8 #() modinst19 (wire18, clk, wire2, wire0, wire7, wire5);
  assign wire20 = $unsigned((~{((~^wire7) ? wire7 : $signed(wire3)),
                      ($unsigned(wire7) ? {wire2} : (wire6 + wire1))}));
  assign wire21 = (wire18 | $unsigned(wire4[(1'h0):(1'h0)]));
  assign wire22 = $unsigned($unsigned({wire5[(4'ha):(3'h4)]}));
  assign wire23 = wire5;
  module24 #() modinst85 (wire84, clk, wire21, wire5, wire4, wire3, wire18);
  assign wire86 = (^$signed($signed($signed(wire3[(5'h14):(4'h9)]))));
  assign wire87 = {(($signed({wire1, wire84}) ?
                          $signed(wire3) : ((+wire1) & (^~wire86))) | $unsigned($signed((wire5 || wire22)))),
                      (wire22[(5'h14):(2'h2)] ~^ wire1[(2'h2):(1'h1)])};
endmodule

module module24
#(parameter param82 = ({{(((8'hbd) <= (8'hb1)) ? ((8'haf) == (8'hbb)) : ((8'hae) ? (8'hbb) : (8'hb1))), (~&{(8'hbf)})}} ? (^((8'hb2) <= (~((7'h43) << (8'hb1))))) : (8'ha5)), 
parameter param83 = param82)
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire29;
  input wire [(4'hf):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire77;
  assign y = {wire81, wire80, wire79, wire77, (1'h0)};
  module30 #() modinst78 (wire77, clk, wire27, wire26, wire29, wire28);
  assign wire79 = $unsigned($unsigned($unsigned({(~wire77),
                      {wire77, wire28}})));
  assign wire80 = ($unsigned(($unsigned($unsigned(wire79)) ?
                      (wire27 + $signed(wire25)) : wire28[(3'h7):(3'h6)])) != ({($signed((8'hb0)) * (wire25 ?
                          wire29 : wire25))} ^ ({(-(8'hbe)),
                      wire77} + (8'had))));
  assign wire81 = $unsigned((wire29 ?
                      ((~&((8'hb4) | wire29)) < $signed($signed((8'hb9)))) : $signed(wire28)));
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  assign y = {wire17, wire16, wire15, wire14, reg13, (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= (+($unsigned({$signed(wire10)}) ?
          wire12 : $signed((~&(wire11 - wire12)))));
    end
  assign wire14 = wire12;
  assign wire15 = ((reg13 == (wire10[(1'h1):(1'h1)] ?
                          wire9[(1'h1):(1'h0)] : $unsigned(((8'hbf) ?
                              (8'hb1) : wire14)))) ?
                      (reg13 ? wire10 : wire12) : wire12[(3'h4):(1'h1)]);
  assign wire16 = $signed($signed((^~$signed($unsigned(reg13)))));
  assign wire17 = ($signed(wire9) ?
                      ((wire16 ? (~|(8'h9c)) : $unsigned($signed(wire15))) ?
                          wire11[(4'h8):(2'h2)] : $unsigned(wire16)) : (|wire9[(3'h5):(2'h3)]));
endmodule

module module30
#(parameter param76 = ((~({((8'h9f) ? (8'hb4) : (8'hbd))} ? (8'h9d) : (((7'h42) ? (8'hb6) : (8'h9c)) & ((8'hbe) ? (8'hbf) : (8'hb8))))) ^~ (~&(((~(8'hb3)) << ((8'hbf) ~^ (7'h40))) ? ({(8'haa)} ? ((8'hbf) ? (8'hbd) : (8'ha7)) : ((7'h44) ? (8'hb1) : (8'hb1))) : (~&(8'ha1))))))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h1cc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire34;
  input wire signed [(5'h15):(1'h0)] wire33;
  input wire signed [(5'h11):(1'h0)] wire32;
  input wire [(3'h7):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(3'h4):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  assign y = {wire75,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire35 = (&($unsigned($signed({(7'h40)})) ?
                      ($signed((~wire31)) ?
                          $signed(wire33[(3'h7):(2'h2)]) : wire33[(5'h12):(2'h3)]) : {$unsigned($unsigned(wire32))}));
  assign wire36 = $signed(wire32);
  assign wire37 = {{(~^(wire32[(4'he):(3'h4)] >= ((8'hbe) >= wire34))),
                          wire32[(4'h9):(4'h8)]},
                      (-($signed(wire36[(4'h9):(3'h4)]) == (+wire35[(1'h0):(1'h0)])))};
  assign wire38 = wire36[(4'hc):(4'h8)];
  assign wire39 = (~wire36);
  always
    @(posedge clk) begin
      if ($signed($unsigned((~|$signed((wire32 ^ wire38))))))
        begin
          reg40 <= (~|wire32[(4'hb):(3'h5)]);
        end
      else
        begin
          reg40 <= wire39;
        end
      reg41 <= ({$signed($signed($signed(wire38))),
          ((wire31 ? $signed(wire34) : (^wire35)) ?
              (~&(+wire37)) : ($unsigned(wire39) || $signed(wire33)))} || (wire34 ?
          (^$unsigned((wire32 * (8'ha0)))) : wire33));
      reg42 <= wire33;
      if ((~$signed({{(wire39 ? wire31 : (8'hbd))}, wire38})))
        begin
          reg43 <= $unsigned({$signed(($unsigned(wire38) >> reg42[(4'hb):(2'h3)]))});
          reg44 <= (((((reg41 ? (7'h43) : wire36) ?
                      $unsigned((8'hac)) : (wire36 ? wire34 : wire37)) ?
                  $unsigned((reg43 <= reg41)) : ((^wire37) || {wire33,
                      wire31})) ?
              $unsigned(wire35[(1'h0):(1'h0)]) : $signed(((^~wire36) <<< {reg40}))) || $signed($signed($unsigned((reg40 ?
              wire36 : reg43)))));
          if ((~(8'hb9)))
            begin
              reg45 <= ($unsigned(wire38) == $unsigned(wire35[(2'h2):(2'h2)]));
              reg46 <= (^~wire32);
              reg47 <= (-((reg46 ? {$unsigned(wire35)} : (8'ha3)) ?
                  wire38[(2'h2):(2'h2)] : wire33));
            end
          else
            begin
              reg45 <= reg43[(2'h3):(2'h3)];
              reg46 <= (reg47[(1'h0):(1'h0)] ? wire36 : wire38);
            end
          reg48 <= ({$signed(wire37[(2'h2):(1'h1)])} ?
              {$signed($unsigned((wire39 ? wire31 : reg42))),
                  wire31[(3'h6):(1'h1)]} : (~^(($signed(reg47) ?
                      (wire36 ? reg41 : wire33) : $signed(reg44)) ?
                  $signed($unsigned(wire39)) : (^(~|wire36)))));
          reg49 <= (wire34 ^ $unsigned($unsigned((+{(8'hbd), reg47}))));
        end
      else
        begin
          reg43 <= (({{$signed(wire32)},
                  $signed($unsigned(reg41))} == (^($unsigned(reg45) <<< wire32[(2'h2):(2'h2)]))) ?
              (~|wire35[(1'h1):(1'h0)]) : ((($unsigned(wire34) ?
                      $signed(reg40) : wire34) ?
                  $signed((wire33 >= reg44)) : wire34[(1'h0):(1'h0)]) >= wire33));
          reg44 <= $signed($signed(({$signed(wire32)} ?
              (^~$signed(reg42)) : ($signed(reg42) ?
                  $unsigned((8'hb0)) : (^~(8'hbb))))));
          reg45 <= reg48;
          if (((wire34 ?
              reg45 : $signed(reg43[(3'h5):(2'h3)])) >= ($unsigned(reg44[(4'hc):(4'ha)]) || $unsigned(((reg48 ?
                  wire34 : reg45) ?
              wire35 : (&wire32))))))
            begin
              reg46 <= reg47;
              reg47 <= ((^~reg44[(1'h0):(1'h0)]) ? reg47 : {reg44});
              reg48 <= reg41[(5'h10):(3'h4)];
              reg49 <= (^(reg47[(1'h0):(1'h0)] ?
                  $unsigned(reg46) : (~|wire39)));
              reg50 <= wire39;
            end
          else
            begin
              reg46 <= ({reg40, (reg49 >> wire36)} ?
                  (8'hbe) : (($unsigned($unsigned(reg47)) ?
                      (+wire39) : wire39) | (-wire36[(3'h5):(3'h5)])));
              reg47 <= $unsigned(((reg41 >> ((|reg43) < (+wire37))) == {$signed(wire33[(5'h11):(1'h1)])}));
              reg48 <= ({(((wire34 == reg44) ~^ {reg49,
                      reg41}) + (^~$signed(wire35)))} + {$unsigned(reg44[(5'h14):(3'h5)]),
                  $unsigned((~&(reg45 ? (8'hb3) : reg45)))});
              reg49 <= {wire33[(5'h12):(3'h4)]};
            end
          reg51 <= reg46[(4'hc):(2'h3)];
        end
      if ($signed($signed(wire39)))
        begin
          reg52 <= $signed(wire36[(4'hd):(3'h5)]);
          reg53 <= $unsigned($signed($unsigned(wire32[(3'h5):(2'h3)])));
        end
      else
        begin
          reg52 <= $signed((reg42[(4'he):(3'h5)] || (~^$unsigned((wire38 ?
              wire37 : reg47)))));
          reg53 <= reg45[(4'ha):(4'h9)];
          reg54 <= wire32;
          if (($unsigned($signed(reg52)) && (+reg42)))
            begin
              reg55 <= wire38;
            end
          else
            begin
              reg55 <= ({(wire36 ?
                          reg47[(1'h1):(1'h1)] : ({reg51,
                              reg42} ^~ (~&reg41)))} ?
                  wire32 : $signed($signed($unsigned(reg50))));
              reg56 <= (~$signed($unsigned($signed((reg46 * wire38)))));
              reg57 <= {$unsigned((wire32 ?
                      $unsigned((reg48 - reg46)) : wire37))};
              reg58 <= $unsigned((~|reg54));
              reg59 <= reg56;
            end
          reg60 <= wire31[(1'h1):(1'h1)];
        end
    end
  assign wire61 = $unsigned({wire34, $unsigned(reg44)});
  assign wire62 = ($signed($signed(wire33)) ?
                      {((^{reg50, reg49}) ^ reg49[(3'h6):(2'h3)]),
                          $unsigned({(reg55 ? wire37 : wire39),
                              (wire38 <= reg47)})} : {reg45});
  assign wire63 = $unsigned(reg43[(1'h1):(1'h0)]);
  assign wire64 = (reg42[(4'hf):(2'h3)] ?
                      $signed($unsigned({$signed(reg49)})) : (!((-$signed(reg53)) + $signed($unsigned(reg53)))));
  assign wire65 = $signed((reg40[(4'h9):(4'h9)] < reg48[(4'hc):(2'h3)]));
  assign wire66 = ({{$signed($unsigned(reg57))}, reg48} ?
                      ((reg58 ? (-reg42) : $signed($signed(wire33))) ?
                          wire63[(3'h5):(2'h3)] : $signed((!wire35[(1'h1):(1'h1)]))) : $signed(reg54[(3'h7):(2'h2)]));
  assign wire67 = $signed(wire33);
  always
    @(posedge clk) begin
      reg68 <= (7'h44);
      if (reg42)
        begin
          reg69 <= ($unsigned(reg42[(3'h4):(2'h3)]) ?
              reg52[(3'h7):(2'h2)] : ((($signed(reg53) >= (reg41 + wire39)) ?
                      reg57 : (-(reg57 <= wire61))) ?
                  $signed(reg68) : $signed(($unsigned(wire33) ?
                      reg68[(1'h1):(1'h0)] : (reg50 ^~ wire66)))));
          reg70 <= $signed(wire67[(3'h6):(2'h3)]);
          reg71 <= (~&$signed((reg40[(2'h3):(2'h3)] ?
              (~^$unsigned(wire65)) : (&$unsigned((8'hb9))))));
          if ((|(8'ha5)))
            begin
              reg72 <= ($unsigned((($signed(wire63) ?
                  reg56 : $signed(reg46)) || reg52)) && $signed(wire61));
              reg73 <= $signed((^~reg71));
              reg74 <= reg55;
            end
          else
            begin
              reg72 <= {({reg70[(4'h8):(1'h1)],
                      ($unsigned(reg57) ?
                          {reg54,
                              reg57} : reg52[(3'h4):(2'h2)])} >> {{$unsigned(wire34),
                          (~(7'h44))},
                      (+((8'h9d) ? reg49 : reg59))})};
            end
        end
      else
        begin
          reg69 <= (|(&(&(&$unsigned(wire34)))));
          reg70 <= (wire32[(5'h11):(4'he)] < {(&wire36[(4'hd):(3'h6)])});
          if ((!(wire34 * $unsigned({{wire39, reg46}, $unsigned(reg53)}))))
            begin
              reg71 <= $signed((~^{(wire66[(3'h4):(3'h4)] ?
                      $signed(wire66) : wire67[(2'h2):(1'h1)]),
                  ((reg43 ^~ wire31) ^ (~wire37))}));
              reg72 <= wire37;
              reg73 <= reg71[(1'h1):(1'h0)];
              reg74 <= $signed(wire63);
            end
          else
            begin
              reg71 <= (~(reg41[(4'hf):(4'h8)] && (-{$signed(reg45)})));
              reg72 <= (|(((~&wire37[(1'h0):(1'h0)]) ?
                  (~|reg69[(3'h4):(1'h0)]) : $signed((-reg60))) & $unsigned(((wire65 ?
                      (8'ha6) : wire62) ?
                  reg56[(2'h2):(1'h1)] : wire36))));
            end
        end
    end
  assign wire75 = wire67[(3'h7):(3'h6)];
endmodule
