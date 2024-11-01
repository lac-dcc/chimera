module top
#(parameter param109 = ((+((+((8'hb9) ? (8'hb7) : (8'ha7))) ~^ {{(8'h9f)}})) ? ((((&(8'hae)) ? (^(8'haa)) : (~(8'had))) & (((8'ha5) <= (8'ha1)) + ((8'ha0) <<< (8'hb3)))) ? ((^(~&(8'h9d))) ? {((8'hbe) ? (8'had) : (7'h42))} : ((!(8'hb2)) ? (!(8'hb7)) : ((8'h9e) ^~ (7'h41)))) : ((((8'ha8) & (8'h9e)) ? {(8'h9f), (8'hb6)} : (!(8'hb8))) ^ (|((8'hb2) ? (8'hb6) : (7'h42))))) : {(7'h44)}), 
parameter param110 = {param109})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  assign y = {wire108,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire5,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire5 = ($signed(wire1[(1'h1):(1'h0)]) == wire1);
  module6 #() modinst96 (.y(wire95), .wire7(wire5), .clk(clk), .wire8(wire1), .wire9(wire0), .wire10(wire4));
  assign wire97 = wire2[(2'h3):(1'h0)];
  assign wire98 = (^~$signed($unsigned($unsigned(wire95[(1'h0):(1'h0)]))));
  assign wire99 = $signed($signed((8'hb4)));
  always
    @(posedge clk) begin
      reg100 <= $unsigned(((^~wire0) ?
          $signed({wire5, (wire97 ? wire5 : wire3)}) : {wire3,
              ((wire97 < wire1) ? $unsigned(wire97) : wire99[(3'h5):(3'h4)])}));
      reg101 <= ((wire3 ? {$unsigned((-wire2))} : (&(&$unsigned(reg100)))) ?
          (((~|(wire99 ? wire4 : wire99)) >>> $signed(wire99)) ?
              (8'ha4) : wire2) : {$signed((8'ha1)),
              (wire95[(1'h1):(1'h0)] ?
                  $signed(wire95[(2'h2):(2'h2)]) : $unsigned($unsigned(wire98)))});
      reg102 <= (~|$unsigned(((^~$signed(wire95)) ?
          $signed((&wire95)) : wire0[(2'h3):(2'h3)])));
      reg103 <= wire97;
    end
  always
    @(posedge clk) begin
      reg104 <= $signed((!$unsigned(wire1)));
      if (($signed(reg100) - wire0[(2'h2):(2'h2)]))
        begin
          reg105 <= $unsigned((($signed({reg100,
                  reg101}) ~^ $unsigned($signed(wire97))) ?
              reg100 : reg104[(3'h6):(2'h2)]));
          reg106 <= {$signed(($unsigned((wire97 & wire5)) >= ((&wire4) ^~ wire99)))};
        end
      else
        begin
          if ($unsigned(wire5[(3'h7):(1'h1)]))
            begin
              reg105 <= (&(^wire3[(2'h3):(1'h0)]));
            end
          else
            begin
              reg105 <= reg100[(2'h3):(2'h2)];
              reg106 <= ({$signed({reg101}),
                      ((~&wire1[(3'h5):(2'h3)]) ?
                          reg100[(3'h4):(1'h1)] : (^~(+wire99)))} ?
                  {(reg100[(4'hc):(3'h7)] ?
                          $unsigned((^~reg105)) : reg104)} : (~reg100));
            end
        end
      reg107 <= $signed(wire0);
    end
  assign wire108 = (wire99 ?
                       (~|(~|reg107[(4'hd):(3'h5)])) : (~^$signed(wire98)));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire89;
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  assign y = {wire94,
                 wire92,
                 wire91,
                 wire13,
                 wire14,
                 wire15,
                 wire28,
                 wire30,
                 wire89,
                 reg93,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $unsigned($unsigned($unsigned(((&wire9) | wire9[(2'h3):(1'h1)]))));
      reg12 <= ((wire9 ^~ wire8[(2'h3):(2'h2)]) ?
          (+$signed(((^~wire7) || (~^wire7)))) : wire9);
    end
  assign wire13 = wire8[(3'h5):(3'h5)];
  assign wire14 = {{($unsigned($signed(wire8)) ?
                              (&reg12[(2'h2):(1'h1)]) : (&(reg12 ^ wire8)))},
                      wire9[(3'h4):(3'h4)]};
  assign wire15 = (wire7 * reg12[(2'h3):(2'h3)]);
  module16 #() modinst29 (wire28, clk, wire15, wire13, wire7, reg11, wire14);
  assign wire30 = (wire15 ?
                      ($unsigned($unsigned({wire15})) >> {$unsigned((~|wire7)),
                          wire14[(2'h2):(1'h1)]}) : (+$unsigned({(~^wire10),
                          (wire9 * wire13)})));
  module31 #() modinst90 (.y(wire89), .wire34(wire7), .wire33(wire15), .clk(clk), .wire32(wire13), .wire35(reg12));
  assign wire91 = $signed($signed(wire89));
  assign wire92 = (($signed({$signed(wire14), ((8'ha7) ? (7'h43) : reg12)}) ?
                      {wire30[(3'h5):(3'h5)]} : {(wire13 <<< wire9)}) <<< (~|(&$signed((wire30 ?
                      wire9 : wire13)))));
  always
    @(posedge clk) begin
      reg93 <= wire7[(1'h0):(1'h0)];
    end
  assign wire94 = $signed((~&(+(^~wire9[(3'h6):(1'h1)]))));
endmodule

module module31
#(parameter param88 = ((((~&(&(7'h41))) ? (+(~^(8'hb9))) : (~|((8'h9d) ? (7'h41) : (8'ha2)))) * ((!((8'had) & (7'h42))) ^~ (((8'ha1) << (8'ha7)) ? {(7'h44)} : ((8'hb5) ? (8'hb4) : (8'hbd))))) ? {((&(-(8'ha2))) || (&(~|(7'h42)))), (((~|(8'h9c)) ? ((8'hb2) ? (8'hb2) : (8'hbc)) : {(8'ha6)}) ? (&((7'h44) << (8'hbc))) : ((~(8'hbd)) < ((8'hbb) ^ (8'hae))))} : ((+((^(7'h44)) ? (^(8'hb8)) : ((8'h9d) ? (8'hb1) : (8'hae)))) ^~ (~&({(8'hbc), (8'h9f)} >= ((8'hae) ? (8'hb0) : (8'hb6)))))))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h269):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire35;
  input wire signed [(3'h4):(1'h0)] wire34;
  input wire [(5'h12):(1'h0)] wire33;
  input wire signed [(4'hb):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire73,
                 wire72,
                 wire71,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire50,
                 wire49,
                 wire37,
                 wire36,
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
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire36 = (~^(($signed(wire33) ?
                      (~|(8'hb5)) : wire34[(2'h2):(2'h2)]) >> (~^(~|wire33))));
  assign wire37 = ($unsigned((!($signed(wire32) ? wire32 : wire35))) ?
                      $unsigned({$signed(wire36[(1'h1):(1'h0)]),
                          wire33[(3'h6):(1'h0)]}) : $unsigned((wire36[(1'h0):(1'h0)] != (~(^(8'ha5))))));
  always
    @(posedge clk) begin
      if ((($unsigned(((wire36 ? wire37 : wire37) ?
              (wire33 << wire34) : $signed(wire37))) ?
          $signed($signed((!wire35))) : wire34) >>> $unsigned(wire35[(5'h11):(4'ha)])))
        begin
          reg38 <= (~(((!$signed(wire34)) ?
              (wire36[(1'h1):(1'h0)] ?
                  {wire37} : $unsigned(wire37)) : $unsigned(wire35[(4'h8):(4'h8)])) > wire32));
          reg39 <= $unsigned((-{{(reg38 ? wire32 : wire34)}}));
          if ({$signed(wire37),
              {$unsigned(wire32[(4'h8):(3'h6)]),
                  ($unsigned($signed(reg39)) >>> reg38[(5'h10):(1'h1)])}})
            begin
              reg40 <= reg38;
              reg41 <= (($signed(((reg39 ?
                  (8'ha9) : reg39) <<< $unsigned(wire33))) <= (8'hb0)) & (wire33[(5'h11):(3'h4)] ?
                  wire34 : $unsigned($unsigned(wire33))));
              reg42 <= $unsigned(wire33);
              reg43 <= wire32[(1'h1):(1'h1)];
              reg44 <= $signed($signed($unsigned($unsigned($unsigned(wire33)))));
            end
          else
            begin
              reg40 <= ($signed((^~(reg38[(1'h1):(1'h0)] ?
                  $signed(wire33) : (~^wire35)))) * ((~|$unsigned($unsigned(wire37))) != reg40[(4'hb):(1'h1)]));
              reg41 <= reg38;
              reg42 <= wire36;
              reg43 <= ((8'ha5) ?
                  (-($unsigned($signed(wire35)) ?
                      wire33[(4'hd):(3'h4)] : (~|$signed(reg44)))) : (reg42 ?
                      ($unsigned((wire35 > (8'hab))) ?
                          $unsigned(wire32) : $unsigned($unsigned((8'hb8)))) : (&$unsigned((~^wire32)))));
              reg44 <= $unsigned($signed(({(wire37 > (8'had))} && $unsigned(wire37))));
            end
        end
      else
        begin
          reg38 <= wire34[(2'h2):(1'h1)];
          reg39 <= ($unsigned($unsigned(wire33[(4'h8):(3'h6)])) ?
              ((8'hbd) ? (~&reg41) : reg39) : wire36[(2'h3):(1'h0)]);
        end
      if (({$unsigned(reg38[(4'hb):(3'h6)]),
          $unsigned((reg41[(3'h7):(3'h5)] ?
              reg44[(2'h2):(1'h1)] : wire36[(2'h3):(2'h2)]))} >> {wire35[(4'ha):(3'h5)],
          $unsigned((8'ha3))}))
        begin
          reg45 <= (({$signed((|reg38)),
                      {reg43[(2'h3):(2'h2)], $unsigned(reg43)}} ?
                  {((&wire32) != {(7'h42), wire34}),
                      {$signed(wire34)}} : reg38) ?
              $signed($unsigned($signed(wire33[(4'hb):(2'h2)]))) : (((8'hb8) ?
                      (reg40 < wire35) : reg44) ?
                  wire33[(4'hf):(3'h6)] : $unsigned(reg39[(1'h1):(1'h1)])));
          if (wire33[(4'hc):(3'h4)])
            begin
              reg46 <= $signed($signed($unsigned($unsigned((+reg41)))));
            end
          else
            begin
              reg46 <= ($signed($signed(reg38)) ?
                  ((!((reg38 ? wire32 : (8'hab)) == $unsigned(reg40))) ?
                      $unsigned(reg39[(3'h6):(2'h2)]) : (reg42 << (8'ha5))) : (|(~&$signed((8'ha7)))));
            end
          reg47 <= (reg40 ~^ ((wire32[(2'h2):(1'h0)] == reg39) << (($signed(reg45) ?
                  reg43[(4'hc):(1'h1)] : (-reg38)) ?
              {(+reg44)} : $unsigned(wire33[(4'h9):(3'h7)]))));
        end
      else
        begin
          reg45 <= $unsigned(($unsigned($signed({reg38})) >= {reg39}));
        end
      reg48 <= $unsigned(wire37[(2'h3):(1'h0)]);
    end
  assign wire49 = {(8'hb8)};
  assign wire50 = $unsigned(wire32);
  always
    @(posedge clk) begin
      reg51 <= reg47;
      reg52 <= (({wire50[(3'h5):(3'h4)], (8'ha3)} || (|$unsigned(((8'hb9) ?
          reg41 : (8'hac))))) && reg40);
      reg53 <= $signed($unsigned(({(+reg41),
          {(8'h9d), (8'hb9)}} << $signed((wire49 ? wire36 : wire33)))));
      reg54 <= reg52[(1'h1):(1'h1)];
      reg55 <= {(^{$signed($signed((8'hb9)))})};
    end
  assign wire56 = (8'hb1);
  assign wire57 = (~^$signed(({(reg54 ? reg52 : reg41), (reg53 << reg47)} ?
                      ((^~wire35) ? (^wire34) : (reg48 * reg45)) : wire32)));
  assign wire58 = reg44[(4'h9):(3'h6)];
  assign wire59 = {wire49};
  assign wire60 = ($signed($unsigned($signed((wire32 ? reg39 : wire37)))) ?
                      wire50 : (+($signed((reg42 ? (8'ha5) : reg44)) ?
                          ((reg46 ?
                              (8'hbe) : wire58) ^ $unsigned(reg54)) : $signed((wire50 | reg43)))));
  assign wire61 = (8'ha2);
  assign wire62 = $signed($unsigned($unsigned($signed(wire57))));
  always
    @(posedge clk) begin
      reg63 <= wire36[(2'h3):(1'h1)];
      reg64 <= wire35;
    end
  always
    @(posedge clk) begin
      if ($signed(($signed(reg41[(5'h12):(1'h0)]) > $signed(wire36[(2'h2):(2'h2)]))))
        begin
          reg65 <= $signed(($unsigned(($unsigned(wire58) ?
              $unsigned(reg47) : (reg47 || reg43))) << $signed(wire32[(1'h1):(1'h1)])));
        end
      else
        begin
          if ($signed(reg52))
            begin
              reg65 <= $signed(wire50[(2'h2):(2'h2)]);
              reg66 <= $signed(wire61[(3'h6):(1'h0)]);
            end
          else
            begin
              reg65 <= reg65;
              reg66 <= reg47;
            end
          reg67 <= ((^($unsigned((-reg44)) ?
              reg44[(4'hb):(1'h0)] : wire33)) || {(!((+(8'h9f)) | $unsigned(reg42))),
              wire36[(2'h2):(2'h2)]});
          reg68 <= $unsigned($unsigned(wire59[(3'h4):(1'h1)]));
        end
      reg69 <= wire34;
      reg70 <= ((wire61[(2'h3):(2'h3)] ?
              wire50[(2'h2):(1'h1)] : ({wire57} < wire59)) ?
          {reg69[(3'h6):(3'h4)]} : $unsigned((~|$unsigned(wire32[(4'h9):(4'h8)]))));
    end
  assign wire71 = wire60;
  assign wire72 = reg65[(2'h2):(1'h1)];
  assign wire73 = $unsigned($signed(wire32));
  always
    @(posedge clk) begin
      reg74 <= $signed((reg51[(3'h4):(1'h1)] ?
          (wire34 ?
              $signed($signed(reg63)) : $unsigned({(8'ha5),
                  (8'hb7)})) : {((reg38 ? wire57 : reg52) ?
                  (8'ha8) : {reg55, reg44})}));
      if ((((~^$signed((wire58 ? reg68 : (8'had)))) ?
              $signed(($unsigned(reg64) <= wire33[(3'h7):(1'h0)])) : (&{{(8'hbc),
                      wire73},
                  $signed(reg43)})) ?
          $unsigned((8'ha7)) : ((~^(!wire73[(3'h4):(1'h0)])) ?
              reg63[(1'h1):(1'h1)] : reg44)))
        begin
          reg75 <= wire50;
          reg76 <= wire62;
          if (({$unsigned(reg42[(2'h2):(2'h2)]),
              reg38} || (reg47[(5'h11):(4'h8)] ?
              ((((8'hb3) ? (8'haf) : (8'hab)) ?
                  $signed(wire58) : $signed(wire59)) < wire33) : (($unsigned(reg38) && (~reg40)) != (wire62[(1'h1):(1'h0)] ?
                  (reg52 >> reg67) : $signed(wire37))))))
            begin
              reg77 <= (((wire58[(3'h6):(2'h2)] ?
                      $signed(wire36) : $unsigned(reg39)) ^~ $unsigned({(reg43 ?
                          reg40 : wire58),
                      (wire60 ? reg48 : (8'hb5))})) ?
                  ((wire32 ? $signed(reg42) : (^~reg42[(1'h0):(1'h0)])) ?
                      (7'h43) : (-((reg51 ? reg65 : (8'ha5)) ?
                          (8'ha2) : reg38[(4'hc):(2'h3)]))) : wire35[(3'h5):(2'h2)]);
              reg78 <= (8'hb8);
              reg79 <= {{wire32},
                  $signed((((~reg53) == (~(8'hab))) ?
                      (8'had) : reg47[(4'ha):(4'h8)]))};
            end
          else
            begin
              reg77 <= $signed({$unsigned((^~$signed(reg70)))});
            end
          reg80 <= $signed((~|(^~{$signed(reg40)})));
        end
      else
        begin
          if ((reg45 > ($unsigned({$signed(reg80)}) ?
              ($signed($signed(reg39)) || wire56[(1'h0):(1'h0)]) : (~^wire35))))
            begin
              reg75 <= $signed($unsigned($signed($signed($signed(reg55)))));
              reg76 <= ($signed((!wire33)) ?
                  (8'hab) : (reg43[(4'hf):(3'h4)] ?
                      (!$signed({reg52})) : $signed(wire50)));
            end
          else
            begin
              reg75 <= reg54[(3'h6):(2'h2)];
              reg76 <= (8'ha1);
              reg77 <= reg38;
              reg78 <= $unsigned((~&((&(reg40 ~^ wire60)) ?
                  wire35[(2'h2):(1'h1)] : wire72)));
              reg79 <= (8'ha5);
            end
          reg80 <= ($signed($signed({(reg44 ? reg78 : reg47), {wire33}})) ?
              reg75[(1'h1):(1'h1)] : (~((&((7'h43) + wire32)) ?
                  ($unsigned(reg52) << wire61) : $unsigned((reg40 ?
                      reg46 : reg54)))));
          if ({(8'hb0), $signed(reg54)})
            begin
              reg81 <= wire59;
              reg82 <= reg70;
            end
          else
            begin
              reg81 <= reg54[(1'h0):(1'h0)];
              reg82 <= (reg38 == $unsigned((((wire61 >= wire33) >> reg42[(1'h1):(1'h1)]) ?
                  {(reg70 ? reg40 : wire36), (reg47 == wire36)} : ((&reg77) ?
                      reg63[(1'h1):(1'h0)] : $signed(reg78)))));
            end
          reg83 <= wire36;
        end
    end
  assign wire84 = wire34;
  assign wire85 = $signed((reg48 ~^ (((|(7'h44)) < ((8'ha9) ~^ reg67)) <<< $unsigned({reg42,
                      (8'hb4)}))));
  assign wire86 = wire71[(4'h9):(4'h9)];
  assign wire87 = wire37[(4'h9):(3'h6)];
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire21;
  input wire [(4'hc):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  input wire signed [(3'h7):(1'h0)] wire18;
  input wire signed [(4'ha):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  assign y = {wire27, wire26, wire23, wire22, reg25, reg24, (1'h0)};
  assign wire22 = wire21[(3'h5):(1'h1)];
  assign wire23 = (({$unsigned(wire19), (8'h9f)} ?
                      $unsigned($signed(wire20)) : wire20[(4'h8):(3'h6)]) >= wire18);
  always
    @(posedge clk) begin
      reg24 <= (~^((-{wire23}) ?
          $signed(wire23) : ($unsigned(wire17[(3'h7):(1'h0)]) < ($signed(wire18) ?
              (wire19 ? wire19 : wire23) : (wire18 ^~ (8'h9e))))));
      reg25 <= wire17[(1'h1):(1'h0)];
    end
  assign wire26 = (wire17 ? $signed((8'hbd)) : reg24);
  assign wire27 = (reg24[(2'h3):(2'h2)] ?
                      ($unsigned(($unsigned(wire23) & wire17[(3'h7):(2'h2)])) ?
                          {wire21} : $signed((wire18[(3'h6):(1'h1)] > $signed(wire19)))) : $signed(wire18[(1'h1):(1'h1)]));
endmodule
