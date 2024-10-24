module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h34a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire102;
  wire [(4'hb):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  assign y = {wire105,
                 wire103,
                 wire102,
                 wire98,
                 wire97,
                 wire93,
                 wire48,
                 wire47,
                 wire37,
                 wire7,
                 wire6,
                 wire5,
                 reg104,
                 reg101,
                 reg100,
                 reg99,
                 reg96,
                 reg95,
                 reg94,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = wire2[(4'hf):(4'he)];
  assign wire7 = (~^$signed($signed((~(wire0 ? wire1 : wire2)))));
  module8 #() modinst38 (.y(wire37), .clk(clk), .wire11(wire0), .wire12(wire3), .wire10(wire6), .wire9(wire7));
  always
    @(posedge clk) begin
      if ($signed($unsigned($unsigned(wire0[(2'h3):(1'h0)]))))
        begin
          if (wire37)
            begin
              reg39 <= $signed((wire4[(4'h9):(1'h1)] ? wire2 : wire37));
              reg40 <= wire3[(4'h8):(4'h8)];
              reg41 <= ($unsigned(($unsigned(((8'hb3) * (7'h42))) ?
                  (+((7'h44) ?
                      wire0 : wire3)) : $signed(reg39[(3'h7):(3'h6)]))) ~^ (wire5 >= (($signed(wire7) ?
                  $unsigned(wire7) : wire3[(1'h0):(1'h0)]) + $signed($signed(wire1)))));
              reg42 <= (wire7 <= (8'hb9));
              reg43 <= (wire4 ^ wire6);
            end
          else
            begin
              reg39 <= wire3[(3'h4):(1'h0)];
              reg40 <= $signed((((~^(wire37 ? reg42 : (8'ha3))) ?
                      wire2 : (reg42[(3'h6):(2'h3)] != (reg43 > reg43))) ?
                  wire0[(1'h0):(1'h0)] : reg40));
            end
        end
      else
        begin
          reg39 <= (^{$signed(($unsigned(wire4) ? $signed(wire7) : (8'hb6))),
              wire7[(2'h2):(1'h1)]});
          reg40 <= {(({$unsigned(reg39)} ?
                      $unsigned((reg41 ? reg39 : wire1)) : ({reg43} ?
                          (wire5 ? reg42 : wire37) : $signed(reg43))) ?
                  {reg39} : $signed($signed((reg40 ? wire2 : wire0))))};
        end
      reg44 <= reg41;
      reg45 <= wire0;
      reg46 <= {wire1};
    end
  assign wire47 = $unsigned({((wire1[(3'h5):(1'h1)] ?
                              (-reg43) : reg41[(1'h1):(1'h0)]) ?
                          $unsigned($unsigned(reg46)) : ((-reg44) + (wire0 ?
                              reg45 : reg41)))});
  assign wire48 = $signed(($signed(wire7[(5'h11):(5'h11)]) ?
                      (({(8'hab), wire0} ^ $unsigned(wire2)) ?
                          wire3[(4'hd):(4'ha)] : $unsigned((~^reg42))) : $unsigned($signed((wire6 > wire6)))));
  always
    @(posedge clk) begin
      if ({(^~{(~&$signed(wire7))})})
        begin
          if ($unsigned($unsigned($signed((^~wire6)))))
            begin
              reg49 <= ({({(wire47 ? reg43 : wire0), wire1[(3'h7):(3'h7)]} ?
                          {wire48, (~&reg40)} : {(wire2 >= reg46),
                              $unsigned(wire48)})} ?
                  {({(^(8'hb6)),
                          (wire7 != reg42)} < wire2)} : ({reg45[(4'ha):(3'h7)],
                      ($unsigned(reg46) ?
                          $unsigned(wire48) : ((8'hba) ?
                              reg45 : wire4))} * ((-(reg39 << reg39)) ?
                      $signed($signed(wire47)) : wire6[(3'h6):(1'h0)])));
              reg50 <= ($signed((-$signed($signed(wire47)))) || $signed(reg45[(3'h6):(3'h4)]));
              reg51 <= (~$signed((($unsigned((8'hb4)) - $signed(reg50)) ?
                  ((&(8'h9e)) ?
                      $unsigned(wire3) : wire7[(2'h2):(1'h1)]) : {(wire47 ?
                          reg45 : reg42)})));
              reg52 <= (|($unsigned((^~reg45)) & (8'ha0)));
              reg53 <= wire0[(2'h3):(2'h3)];
            end
          else
            begin
              reg49 <= wire1;
            end
          if (reg41[(4'hc):(4'hb)])
            begin
              reg54 <= $unsigned(((wire4 <<< reg45) ?
                  $unsigned((~&(wire4 & reg49))) : (7'h40)));
            end
          else
            begin
              reg54 <= reg40[(1'h1):(1'h1)];
            end
          reg55 <= (|$signed(($unsigned((!reg52)) ?
              (reg39[(4'h9):(4'h8)] << reg53[(5'h11):(4'he)]) : reg49[(4'ha):(2'h3)])));
          reg56 <= {$signed($unsigned(wire0))};
        end
      else
        begin
          if ($unsigned({(wire7[(3'h4):(3'h4)] ?
                  $unsigned(((8'hb5) << wire4)) : ((~^(8'hbe)) > $unsigned((7'h41))))}))
            begin
              reg49 <= $signed($unsigned(($signed((|reg52)) ?
                  $unsigned((reg53 ?
                      reg55 : reg51)) : (~^reg50[(4'hc):(3'h7)]))));
            end
          else
            begin
              reg49 <= $unsigned(reg50);
              reg50 <= {((~|reg51) ?
                      ((~$signed(wire7)) ?
                          ({reg43, reg44} >>> (wire6 ?
                              (8'hbd) : wire3)) : $signed(reg54)) : ((reg52 ?
                              $signed(reg46) : wire2[(3'h5):(1'h1)]) ?
                          $unsigned((wire4 >> (8'had))) : reg55[(5'h10):(3'h5)])),
                  (wire7 != {($signed(wire2) ?
                          (wire0 >>> reg51) : (reg43 ? (8'h9f) : wire0))})};
            end
          reg51 <= {$unsigned(reg54[(1'h0):(1'h0)])};
          reg52 <= {(|$unsigned($signed(reg42[(3'h4):(3'h4)])))};
        end
      if ((~&reg53))
        begin
          reg57 <= (~$unsigned($unsigned($signed((^(8'ha9))))));
          reg58 <= wire7;
          reg59 <= wire6[(2'h3):(2'h3)];
          reg60 <= (($signed((!(wire1 ?
              reg50 : reg40))) < reg58[(2'h2):(2'h2)]) || $signed((reg59[(2'h2):(2'h2)] ?
              ({reg55, reg44} > reg39) : wire2[(4'hb):(3'h6)])));
          reg61 <= reg60[(1'h1):(1'h1)];
        end
      else
        begin
          reg57 <= ((reg50 ?
              wire48[(2'h3):(1'h1)] : ({$signed(reg60),
                      (reg55 ? wire3 : reg42)} ?
                  (~$unsigned(reg39)) : $unsigned(reg43[(4'h8):(3'h6)]))) ~^ wire48[(3'h5):(2'h3)]);
          reg58 <= $unsigned(wire47);
          reg59 <= ({wire2, reg50} >> wire47[(4'ha):(2'h2)]);
        end
      if (reg61)
        begin
          reg62 <= {$signed(reg52[(3'h6):(2'h2)])};
          reg63 <= ((($unsigned($unsigned(reg53)) << $unsigned((!(7'h42)))) ?
                  $signed(((reg54 - reg50) ?
                      $signed(wire2) : (reg58 ? reg57 : reg57))) : reg54) ?
              {($unsigned(reg58) ~^ (+wire7[(4'hb):(3'h5)]))} : ((!((wire37 ?
                          reg44 : reg54) ?
                      (reg53 ? reg53 : reg43) : wire2[(4'hc):(1'h1)])) ?
                  wire6[(3'h5):(1'h1)] : reg56));
        end
      else
        begin
          if (reg55[(5'h11):(4'h9)])
            begin
              reg62 <= wire4;
              reg63 <= (wire1[(4'hc):(4'hc)] ?
                  {reg46,
                      (+$unsigned(wire7[(5'h10):(1'h0)]))} : $signed(reg40[(4'hc):(4'h9)]));
              reg64 <= $unsigned((($unsigned((reg44 + reg50)) ?
                      (8'hb3) : reg46[(4'he):(3'h7)]) ?
                  reg56[(2'h2):(2'h2)] : reg44));
              reg65 <= reg43;
              reg66 <= reg65[(4'h9):(1'h0)];
            end
          else
            begin
              reg62 <= wire47;
              reg63 <= (-(((~|$signed((8'haf))) ?
                  $signed($signed((8'hb5))) : wire7[(4'he):(2'h3)]) * $unsigned($unsigned((reg51 ?
                  reg45 : wire2)))));
              reg64 <= {$signed(($signed(wire48) ?
                      wire47[(5'h12):(5'h11)] : reg57[(4'hc):(4'h9)])),
                  (reg54[(3'h6):(1'h1)] >= $signed((reg40[(4'ha):(2'h3)] ?
                      $signed((8'hb7)) : wire0)))};
            end
          reg67 <= (&wire47[(4'h9):(3'h7)]);
          reg68 <= $signed((reg59[(3'h5):(2'h3)] && $signed($unsigned($unsigned((8'hb1))))));
        end
      reg69 <= ($signed((8'ha0)) ^ $unsigned($signed(((&wire48) ?
          reg50 : wire47))));
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned({($unsigned(reg49) ?
              (wire48 ? reg49 : (8'hbc)) : (8'hb0))})))
        begin
          if (reg41)
            begin
              reg70 <= $unsigned((wire5[(3'h7):(2'h3)] ^~ $signed($signed($unsigned(wire6)))));
              reg71 <= ($signed(((reg55 <<< $signed(reg43)) != ($unsigned(reg46) * (wire47 ?
                  wire48 : reg64)))) != (wire7 * ($unsigned((8'ha3)) && (-(reg61 <<< reg59)))));
              reg72 <= ($unsigned((~|wire5)) ^ {((reg39 ?
                          {reg67, reg69} : ((8'hae) ^ wire47)) ?
                      reg63 : (+(reg62 ? wire48 : reg50))),
                  reg56});
            end
          else
            begin
              reg70 <= (reg44[(1'h1):(1'h1)] >> $unsigned($unsigned(reg63)));
              reg71 <= {$unsigned((($signed(reg42) ^ {(8'h9f), reg63}) ?
                      $unsigned(reg51[(1'h0):(1'h0)]) : $signed({reg49})))};
              reg72 <= {wire47, $signed(reg51)};
            end
          reg73 <= $signed((+({reg70[(2'h3):(2'h2)],
                  (reg41 ? wire1 : (8'ha7))} ?
              ($signed(reg39) + reg53[(4'hf):(4'hd)]) : $unsigned($unsigned(reg53)))));
          reg74 <= wire48;
        end
      else
        begin
          reg70 <= reg42;
          if ($unsigned($signed(reg62)))
            begin
              reg71 <= $unsigned(reg73);
              reg72 <= ((reg69 ?
                  ((+(~|reg58)) ?
                      ((reg40 ? reg71 : reg44) ?
                          (reg49 ? reg57 : wire37) : (reg46 ?
                              wire2 : reg55)) : reg70) : ((reg43[(5'h10):(1'h0)] ?
                          (8'hbd) : reg43) ?
                      (reg57[(3'h4):(2'h3)] ?
                          $unsigned(reg53) : $unsigned(reg63)) : reg42)) ~^ $signed((~|(~^reg68))));
              reg73 <= wire5;
              reg74 <= {reg45[(3'h4):(2'h3)]};
            end
          else
            begin
              reg71 <= ((^$signed($signed(reg65))) ?
                  (~^reg69[(4'h8):(3'h4)]) : ($unsigned((8'hac)) > {$signed((~|reg56))}));
              reg72 <= reg40[(4'hc):(1'h0)];
            end
          reg75 <= {$unsigned((-((~|reg49) ? $signed((8'hb4)) : (8'hbb))))};
        end
      if ($unsigned(($unsigned(reg42[(4'h9):(3'h7)]) ? {wire37} : wire7)))
        begin
          if ($signed($unsigned((^$signed($signed(reg70))))))
            begin
              reg76 <= $unsigned($signed($signed({(reg63 & wire1)})));
              reg77 <= (!reg53[(2'h2):(1'h1)]);
            end
          else
            begin
              reg76 <= $unsigned($unsigned($unsigned({((8'haa) - wire4),
                  wire6[(4'h8):(2'h3)]})));
              reg77 <= (reg70 & $unsigned((~|reg41)));
              reg78 <= ($signed(reg42[(4'hc):(2'h2)]) ?
                  ($unsigned((~&(~reg50))) ?
                      (^~reg67[(2'h3):(1'h0)]) : {((~reg59) > (reg77 ?
                              (8'hb1) : reg61)),
                          ((reg77 ? (8'hb5) : reg74) ?
                              $unsigned(reg60) : (^~reg70))}) : reg49);
              reg79 <= (~(^$unsigned(reg77[(2'h3):(2'h2)])));
              reg80 <= (reg59 ?
                  $signed((~($unsigned(reg49) ?
                      $unsigned(reg77) : reg75))) : (^(reg56 ?
                      $unsigned((^wire3)) : reg67)));
            end
          reg81 <= ((|($unsigned(reg62[(1'h1):(1'h1)]) + reg43[(4'ha):(2'h3)])) ?
              ((reg44[(1'h0):(1'h0)] & $signed($signed(reg46))) ~^ (({reg71} ?
                  {reg71} : (wire5 != reg39)) ^ wire3[(3'h5):(3'h4)])) : (8'ha7));
          reg82 <= $signed({$unsigned(({reg45} & reg43))});
          reg83 <= ((+(~|wire47[(3'h4):(2'h2)])) & reg72);
        end
      else
        begin
          reg76 <= {wire6[(1'h0):(1'h0)], wire0[(2'h2):(1'h0)]};
          reg77 <= reg77[(1'h1):(1'h0)];
          reg78 <= reg76;
          reg79 <= $unsigned((reg56[(3'h4):(2'h2)] ?
              wire48[(2'h2):(1'h0)] : (reg43 ?
                  (reg67 | reg49[(4'h8):(3'h7)]) : $unsigned($unsigned(reg65)))));
        end
      reg84 <= ($signed((^~reg73[(4'h8):(2'h2)])) ?
          ($unsigned($unsigned($signed(reg44))) ?
              $unsigned($unsigned($signed(reg41))) : reg57) : $signed(((+(+reg57)) == (^~(|wire5)))));
      if ((~|($signed($unsigned((reg67 ? reg61 : reg44))) ?
          $signed(wire1[(2'h2):(2'h2)]) : reg53)))
        begin
          reg85 <= $unsigned($unsigned(({$unsigned(wire6)} <<< ($unsigned(reg56) ?
              (reg60 ? reg56 : (8'hb7)) : wire5))));
          reg86 <= $unsigned(reg62[(3'h4):(3'h4)]);
          if (($signed(reg44) ?
              (reg76[(1'h1):(1'h0)] == (reg67 ~^ ((reg83 | (8'had)) & (reg50 ?
                  reg40 : reg59)))) : (!reg80[(1'h1):(1'h1)])))
            begin
              reg87 <= ((7'h44) ?
                  $unsigned(($signed(reg60) ?
                      reg70[(2'h3):(2'h2)] : $signed({reg68,
                          reg71}))) : (($unsigned(reg42) ?
                      reg86[(3'h5):(1'h0)] : (^$signed(reg70))) >>> $unsigned((-$signed(wire3)))));
              reg88 <= ($unsigned(($signed($unsigned(reg72)) ?
                      ({reg53} ? reg84 : (reg59 ? reg68 : reg40)) : reg68)) ?
                  reg80 : reg85[(4'ha):(4'ha)]);
            end
          else
            begin
              reg87 <= wire2;
              reg88 <= wire6;
              reg89 <= ((7'h42) > $unsigned((((~^wire1) ^ $signed(reg42)) ?
                  $unsigned(((8'ha2) ? (8'h9e) : reg63)) : ($unsigned(reg83) ?
                      (reg45 <= reg49) : (-wire4)))));
              reg90 <= wire47[(3'h4):(2'h3)];
            end
          reg91 <= $signed((($signed((reg76 ? wire1 : reg45)) ?
                  (|reg70[(2'h2):(1'h0)]) : ((~reg79) ? (|reg55) : reg46)) ?
              ((((8'ha2) <<< reg71) ?
                  (|(7'h42)) : (~&reg83)) ~^ (reg67[(1'h0):(1'h0)] ?
                  reg45[(3'h6):(2'h3)] : {wire7, reg77})) : {{wire47,
                      (reg43 & wire2)}}));
        end
      else
        begin
          if ($signed(((wire5 ?
              reg55 : ((reg71 >= reg67) ?
                  (&reg87) : (reg55 ? wire7 : (8'ha5)))) ^~ wire6)))
            begin
              reg85 <= reg83;
            end
          else
            begin
              reg85 <= (!(&$unsigned((!reg79[(4'hf):(1'h1)]))));
              reg86 <= $unsigned((wire4 << (reg72 ?
                  $unsigned($unsigned(reg54)) : $unsigned((!reg88)))));
            end
        end
      reg92 <= (&reg61[(5'h14):(3'h4)]);
    end
  assign wire93 = (8'hac);
  always
    @(posedge clk) begin
      reg94 <= {{($signed({wire48}) ? reg67 : $unsigned($unsigned(wire47)))},
          (7'h43)};
      reg95 <= ($unsigned({reg55}) < (8'ha4));
      reg96 <= $unsigned((|(reg75 ~^ $signed((reg91 ? wire93 : reg72)))));
    end
  assign wire97 = (~|{(!$unsigned($signed(reg94)))});
  assign wire98 = $unsigned(((wire4[(5'h13):(5'h13)] ^~ reg95[(3'h4):(2'h2)]) <= (^~reg67)));
  always
    @(posedge clk) begin
      reg99 <= wire7;
      reg100 <= ($signed((wire2 ? $signed((~reg76)) : reg53)) ?
          {reg59[(4'hd):(2'h2)]} : ((reg54 || reg77) ^~ (+$unsigned((~reg89)))));
      reg101 <= reg60[(3'h6):(1'h1)];
    end
  assign wire102 = (^$signed($signed(reg94)));
  assign wire103 = reg58[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg104 <= (^(reg94[(3'h6):(1'h0)] ?
          reg101[(3'h7):(3'h5)] : (wire97[(1'h1):(1'h1)] ?
              wire93[(4'hb):(4'h8)] : $signed($signed(reg76)))));
    end
  assign wire105 = $unsigned({(((reg58 + wire0) ?
                           reg76[(1'h1):(1'h0)] : (reg99 < reg66)) != ((~(8'ha4)) ?
                           {wire37, (8'had)} : (reg69 ? wire102 : (8'ha9)))),
                       $unsigned(wire4[(5'h10):(3'h4)])});
endmodule

module module8
#(parameter param36 = ((^(((~&(8'h9e)) != ((8'hb6) ? (8'hb6) : (8'ha4))) ? (((8'ha9) ? (8'hb8) : (8'hbf)) ? ((8'hab) + (8'hbd)) : (8'ha6)) : (8'ha7))) ? {{(((8'hbf) + (8'hbb)) ? (+(8'ha2)) : {(8'ha1), (8'hab)})}} : ((((~|(8'ha3)) && (8'h9d)) && ((~(8'ha8)) ? (~|(8'hb3)) : ((8'ha7) + (8'hb7)))) ? (&({(8'haa)} && ((8'hbd) - (8'hba)))) : (((&(8'ha7)) == ((8'ha4) ? (7'h43) : (8'h9d))) + (-((8'hb2) ? (8'ha5) : (7'h44)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire12;
  input wire [(2'h3):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire13 = ((~&({wire9[(4'h9):(3'h5)],
                      wire10} + $signed(wire9))) | {(~wire10),
                      (~|{(wire11 ? (7'h42) : wire10), (8'hb0)})});
  assign wire14 = {wire11,
                      (wire13 ?
                          {$signed((wire13 ^~ wire11)),
                              $signed((wire12 ?
                                  wire9 : wire12))} : (^(^(^(8'hac)))))};
  assign wire15 = ({(^wire13)} < (!{wire9[(3'h5):(1'h0)]}));
  assign wire16 = wire9[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      if (((8'ha8) > $unsigned(wire9[(4'hc):(3'h4)])))
        begin
          reg17 <= (8'ha9);
        end
      else
        begin
          reg17 <= $unsigned(wire10[(1'h1):(1'h1)]);
          reg18 <= wire12;
          reg19 <= ((!(&(wire10 ?
                  $unsigned(wire10) : (wire15 ? reg17 : wire16)))) ?
              $unsigned($signed($signed((&(8'hbe))))) : (($signed((wire13 <= wire15)) && wire12) | (8'hb2)));
          reg20 <= (|((|{((8'h9f) <= wire10), {(7'h43), (8'ha8)}}) ?
              ({(wire11 > (8'hb4)), $signed(wire9)} ?
                  (reg18[(2'h2):(1'h1)] ?
                      (wire15 | (8'hb0)) : wire16) : (((8'ha2) ?
                          wire15 : wire10) ?
                      (wire15 == reg17) : (8'ha2))) : reg17[(1'h1):(1'h1)]));
          reg21 <= $signed((wire10[(1'h1):(1'h0)] ?
              (wire12[(2'h2):(1'h1)] ?
                  $unsigned($signed(wire15)) : ((reg20 & wire12) ?
                      {wire10,
                          reg17} : reg20[(1'h0):(1'h0)])) : reg17[(4'h8):(2'h2)]));
        end
      if ($signed(((|(wire16 ?
          $unsigned(wire16) : (wire14 ^~ (8'h9e)))) > $signed(wire16))))
        begin
          reg22 <= {$unsigned(wire14)};
          reg23 <= ({$signed($signed((~wire9)))} ^ (+(((!reg18) << $signed(reg17)) ?
              (((8'hb0) <= wire13) ?
                  $unsigned((8'hb0)) : ((8'h9e) ?
                      wire15 : reg18)) : $signed(reg18[(2'h2):(2'h2)]))));
        end
      else
        begin
          reg22 <= $signed({{$unsigned({reg19}), wire10[(3'h6):(3'h6)]},
              (8'ha2)});
        end
      reg24 <= $unsigned({reg21,
          (reg22[(4'h8):(2'h2)] ?
              $unsigned(wire16[(4'hf):(3'h7)]) : $unsigned((reg22 * wire16)))});
      reg25 <= (~|$unsigned((((wire11 ? wire9 : reg17) ?
              $unsigned(reg23) : wire14) ?
          wire12[(1'h1):(1'h1)] : {$unsigned(reg21), $unsigned(wire10)})));
    end
  always
    @(posedge clk) begin
      reg26 <= $unsigned(({((wire11 << (8'ha8)) >>> (-wire13))} >= reg20[(3'h4):(2'h2)]));
      reg27 <= (8'hb0);
      reg28 <= $signed((^~$signed(reg23[(4'hd):(4'h8)])));
    end
  assign wire29 = {(!(reg25[(3'h6):(2'h2)] << (|(reg25 < reg18))))};
  assign wire30 = (wire11 >> wire12);
  assign wire31 = (wire10 & {{($unsigned((8'hbe)) ?
                              wire11 : (wire11 ? reg17 : reg23)),
                          $signed($unsigned((8'hb4)))},
                      $signed((|$unsigned(reg19)))});
  assign wire32 = reg27;
  assign wire33 = {wire32[(4'he):(2'h3)], (~|wire31[(3'h5):(1'h0)])};
  assign wire34 = {$unsigned($signed(($signed(wire16) ?
                          wire13 : (wire29 ? wire15 : wire13))))};
  assign wire35 = {wire15[(2'h3):(1'h1)], {reg20[(1'h0):(1'h0)], {reg24}}};
endmodule
