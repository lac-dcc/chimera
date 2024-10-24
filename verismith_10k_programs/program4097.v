module top
#(parameter param96 = {(|(!((^~(8'hbd)) ~^ (~(8'hb6))))), {(-((^(7'h40)) <<< ((8'haa) ? (8'hb0) : (8'hab)))), (((+(8'ha9)) ? (-(7'h42)) : (&(8'hb2))) ? (((8'ha6) ? (8'ha4) : (8'haf)) & ((8'had) ? (8'h9f) : (8'hb4))) : (((8'ha2) ? (8'hb6) : (8'hb9)) <<< ((7'h43) ? (8'ha3) : (7'h44))))}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire89;
  assign y = {wire95, wire94, wire93, wire92, wire91, wire89, (1'h0)};
  module5 #() modinst90 (wire89, clk, wire4, wire3, wire0, wire1, wire2);
  assign wire91 = $unsigned(($unsigned({((8'ha3) ? wire1 : wire3),
                          (+(8'hb9))}) ?
                      (wire89[(4'h8):(1'h0)] ?
                          (!wire2) : wire89[(1'h1):(1'h1)]) : ($signed((wire89 - wire1)) != wire2)));
  assign wire92 = wire1;
  assign wire93 = $unsigned(wire3[(1'h1):(1'h0)]);
  assign wire94 = $signed({$signed(((wire4 ? wire92 : wire0) & (|(8'hac)))),
                      ((wire93 >> wire91[(3'h7):(2'h2)]) ?
                          $unsigned({(7'h40)}) : $signed($unsigned(wire1)))});
  assign wire95 = (wire0 ? (&wire89[(4'hc):(2'h2)]) : (^~wire1));
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire83;
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire28,
                 wire12,
                 wire11,
                 wire83,
                 (1'h0)};
  assign wire11 = $unsigned({(wire7 ?
                          $unsigned(((7'h43) != wire10)) : $unsigned($signed(wire10)))});
  assign wire12 = (^{wire9,
                      (wire11 ?
                          ((8'ha5) ?
                              (^~wire6) : {wire6}) : (-wire7[(3'h4):(3'h4)]))});
  module13 #() modinst29 (wire28, clk, wire6, wire9, wire10, wire7, wire12);
  module30 #() modinst84 (wire83, clk, wire12, wire7, wire9, wire11, wire10);
  assign wire85 = (-wire11[(4'hd):(3'h4)]);
  assign wire86 = $unsigned(wire7);
  assign wire87 = ((-wire9[(4'he):(1'h0)]) ?
                      ({$signed((wire83 ? wire10 : wire85)),
                              $unsigned($signed(wire83))} ?
                          {{$signed(wire11),
                                  (^wire10)}} : $signed(((!wire6) <= $unsigned((8'h9e))))) : wire9[(3'h4):(2'h3)]);
  assign wire88 = ((wire11[(5'h15):(2'h2)] >> wire7[(5'h11):(1'h1)]) ?
                      $signed(wire87[(5'h13):(3'h7)]) : {($signed(wire7) ?
                              ($unsigned(wire7) ?
                                  $unsigned(wire7) : (wire87 != wire8)) : $unsigned($unsigned((8'had))))});
endmodule

module module30
#(parameter param82 = ((((((8'hb1) << (8'ha1)) < ((7'h40) <<< (8'ha3))) <= (!((8'hb4) ? (8'haf) : (8'ha7)))) * (~&{(~^(8'ha9)), {(7'h44), (8'ha4)}})) ? ((((~(8'hb4)) < {(8'hbf)}) ? (|((8'hbb) & (8'hb6))) : {((8'hbc) || (7'h43)), ((8'hb0) ? (8'hb9) : (8'hb7))}) != (+(+((8'hb7) - (8'hbc))))) : {(&((8'ha0) || ((8'h9f) >>> (8'hbe))))}))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire [(4'hc):(1'h0)] wire33;
  input wire [(5'h13):(1'h0)] wire32;
  input wire signed [(2'h3):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire59,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
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
                 reg58,
                 reg57,
                 reg56,
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
  assign wire36 = wire32[(4'ha):(3'h5)];
  assign wire37 = $signed(((~({wire32} < (~&wire33))) ?
                      ({$unsigned(wire36), wire35[(3'h6):(3'h5)]} ?
                          wire32 : $unsigned(((8'hb2) && wire34))) : wire35[(1'h0):(1'h0)]));
  assign wire38 = ((wire35[(3'h4):(3'h4)] & ((wire36 ?
                              wire32[(4'hc):(3'h6)] : wire34[(4'he):(4'ha)]) ?
                          ((wire37 ? wire32 : wire33) ?
                              (wire37 > wire32) : (wire31 ?
                                  wire36 : wire31)) : $unsigned((wire37 && wire31)))) ?
                      wire31[(1'h1):(1'h0)] : $signed((((wire34 || wire37) && wire35) <= $signed($unsigned(wire35)))));
  assign wire39 = wire35[(5'h14):(4'hc)];
  always
    @(posedge clk) begin
      reg40 <= ($signed(((+wire35[(4'hd):(3'h6)]) << wire32[(4'hd):(4'hb)])) ?
          (^~(~|(((8'hb2) ?
              wire32 : (8'haa)) <<< {wire38}))) : $signed((+wire33)));
      if ((~((~^reg40[(3'h5):(2'h2)]) ?
          $signed($signed((wire35 + wire36))) : ((+(reg40 <<< wire35)) ?
              {(+(8'hac))} : $signed(((8'ha3) && wire37))))))
        begin
          reg41 <= $unsigned($signed({($unsigned(wire39) > reg40[(3'h7):(3'h7)]),
              wire33[(4'h9):(3'h4)]}));
          reg42 <= $signed(wire37);
        end
      else
        begin
          if ((wire33 ?
              (~($unsigned(((8'hb6) * wire32)) & {wire32[(3'h4):(1'h0)]})) : (8'ha4)))
            begin
              reg41 <= $unsigned($signed((~&reg41[(3'h7):(3'h5)])));
            end
          else
            begin
              reg41 <= (^($signed(($signed((8'hb3)) ?
                      (reg42 >>> wire33) : $unsigned(reg42))) ?
                  (~&$unsigned((reg41 ? wire34 : (8'hb6)))) : ($signed((wire39 ?
                          wire39 : (8'hb1))) ?
                      wire37[(2'h2):(1'h0)] : wire33)));
            end
          reg42 <= ((wire35[(3'h5):(2'h2)] <= {reg40,
                  ((wire35 || (8'ha8)) << reg41[(3'h7):(3'h6)])}) ?
              ((!$unsigned((wire31 ? wire33 : wire31))) ?
                  (((|reg40) ?
                      (reg40 >> reg42) : wire32[(4'hb):(3'h7)]) > $signed((wire33 ~^ wire36))) : $unsigned((^~((8'hb5) ?
                      wire32 : reg42)))) : (wire33 == ((wire34[(1'h1):(1'h0)] ^~ (reg41 < wire38)) * ((wire34 ?
                  wire33 : wire39) + {wire38, wire31}))));
          reg43 <= wire38[(2'h2):(1'h0)];
          if (({reg41, reg40} <= wire39[(4'hc):(4'ha)]))
            begin
              reg44 <= wire32;
              reg45 <= ((({(reg42 == wire37), {(8'hbb)}} <<< $unsigned((wire39 ?
                          wire34 : wire34))) ?
                      reg42[(2'h2):(2'h2)] : $signed($signed((wire32 ?
                          wire33 : reg40)))) ?
                  $signed($signed(wire32)) : (!(8'ha5)));
              reg46 <= wire33[(4'hc):(1'h1)];
              reg47 <= ((wire36 ?
                      wire36[(4'h9):(1'h0)] : (wire31 ?
                          ($signed(reg43) * ((8'haa) ?
                              reg40 : reg44)) : wire32[(4'ha):(3'h4)])) ?
                  {($unsigned(reg46) ?
                          reg43 : (wire33[(2'h2):(2'h2)] ?
                              $unsigned(wire32) : {wire38, reg44})),
                      wire39[(4'he):(3'h4)]} : {wire31, wire34});
              reg48 <= $signed(wire31[(1'h0):(1'h0)]);
            end
          else
            begin
              reg44 <= reg44;
              reg45 <= $unsigned(reg45[(2'h2):(1'h1)]);
              reg46 <= reg47;
              reg47 <= $unsigned($unsigned(((^~$signed(reg45)) >>> $signed((reg48 ?
                  wire39 : reg47)))));
              reg48 <= $signed(wire31[(1'h1):(1'h1)]);
            end
        end
      reg49 <= reg41[(3'h4):(2'h2)];
    end
  assign wire50 = (reg45 ?
                      wire32[(4'hb):(1'h1)] : (((^{reg43}) != (-(reg49 > wire35))) && $signed($signed((reg45 <<< wire36)))));
  assign wire51 = (~^(wire38 ?
                      (&wire36[(4'hb):(2'h3)]) : $unsigned((^~$signed(wire36)))));
  assign wire52 = (((~^$signed($unsigned(wire33))) ^ $unsigned($signed(reg42[(2'h3):(1'h1)]))) ?
                      wire33 : {(reg44 & ((~^reg44) ?
                              reg40[(2'h2):(1'h0)] : (!wire31)))});
  assign wire53 = {(~wire35[(5'h11):(5'h11)])};
  assign wire54 = $signed({$signed({(wire31 ? reg46 : wire34)}), (^reg48)});
  assign wire55 = $signed((wire37 ? $unsigned(reg40) : wire35[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      reg56 <= (|(wire33[(4'hb):(4'h8)] >> {reg40, {reg40, {wire54, reg44}}}));
      reg57 <= $unsigned(wire33);
      reg58 <= (~^(($unsigned(reg42) << (+(reg44 ? wire50 : reg41))) ?
          (!((-(8'ha5)) + (wire52 ? wire54 : (8'hb3)))) : (+{$unsigned(wire35),
              (-wire36)})));
    end
  assign wire59 = (((8'haa) ~^ $unsigned($signed(reg48[(3'h7):(3'h5)]))) * $unsigned($unsigned($signed($signed(reg41)))));
  always
    @(posedge clk) begin
      reg60 <= (+(($signed({wire31, wire36}) ~^ reg58) ?
          {$unsigned(wire51)} : $signed((wire34 & (~wire59)))));
      reg61 <= ($unsigned(($unsigned((!wire31)) ?
          reg45 : {(|reg47), $unsigned(wire35)})) != (&(~{(8'hb3),
          (wire53 < wire52)})));
      reg62 <= $signed((^$signed(($unsigned((8'h9d)) <<< (wire35 ^~ wire37)))));
    end
  always
    @(posedge clk) begin
      if (wire37)
        begin
          if ((wire52[(2'h2):(1'h1)] | wire34[(5'h10):(3'h7)]))
            begin
              reg63 <= {{reg60[(2'h2):(1'h1)],
                      $unsigned($signed($unsigned(reg46)))},
                  {(~|(((8'hbc) * wire33) << reg48[(4'ha):(3'h7)]))}};
              reg64 <= wire59[(2'h3):(2'h3)];
              reg65 <= ($signed(wire34) ?
                  reg42[(2'h3):(1'h0)] : (^~({(reg64 ? reg57 : wire32),
                      {reg63}} < $signed($signed(reg47)))));
              reg66 <= reg42[(1'h1):(1'h0)];
            end
          else
            begin
              reg63 <= (((((reg64 ^~ wire38) ?
                          reg64[(3'h6):(1'h0)] : (reg58 - reg45)) ?
                      reg46 : $signed(wire31[(1'h0):(1'h0)])) && ((~&{reg44,
                          wire59}) ?
                      (~^reg48[(1'h1):(1'h0)]) : $signed((wire38 ?
                          wire51 : wire38)))) ?
                  wire37[(3'h4):(1'h0)] : (!(!((reg40 ?
                      reg42 : wire33) < (wire38 != (8'had))))));
              reg64 <= (reg64[(1'h0):(1'h0)] ?
                  ((($unsigned(reg61) <<< (&reg58)) + ((8'hb6) - wire51[(1'h1):(1'h1)])) ?
                      (~reg47) : (~$unsigned((-reg40)))) : reg65[(2'h2):(1'h1)]);
              reg65 <= {(!reg45[(2'h2):(1'h0)])};
              reg66 <= $unsigned(wire34);
              reg67 <= {$unsigned(reg48[(5'h12):(4'h9)])};
            end
        end
      else
        begin
          reg63 <= $signed((!$signed(((^wire34) ~^ $signed(wire35)))));
          reg64 <= (-(reg47[(5'h11):(3'h7)] ?
              (((~^wire54) <<< (wire53 ~^ reg67)) ?
                  ((wire59 ? reg63 : wire35) ?
                      reg60 : (^~wire53)) : ($unsigned(reg45) ?
                      (8'hb1) : wire54)) : wire34[(3'h6):(2'h2)]));
          if (($signed(((wire53 >> (reg63 ~^ (8'hb0))) ?
                  (~|(^~reg57)) : {wire39})) ?
              wire35[(2'h3):(1'h1)] : $signed(wire52)))
            begin
              reg65 <= $signed(reg67[(2'h2):(2'h2)]);
              reg66 <= ((|(^~$unsigned($signed(reg46)))) ?
                  (reg63 + reg41) : (~^(reg63[(3'h4):(1'h1)] || $signed((reg56 ?
                      reg58 : wire54)))));
            end
          else
            begin
              reg65 <= wire53[(1'h0):(1'h0)];
              reg66 <= $signed(reg44[(1'h1):(1'h1)]);
              reg67 <= (~&reg49[(1'h1):(1'h1)]);
              reg68 <= $signed($unsigned((wire38 & {$signed(reg44)})));
              reg69 <= {(wire53[(3'h4):(1'h1)] ?
                      (!((reg64 ? reg66 : wire32) ?
                          (wire53 & wire39) : wire35)) : wire52[(3'h4):(3'h4)]),
                  {(($signed(wire36) ? $signed(reg64) : $signed(reg62)) ?
                          wire55[(1'h0):(1'h0)] : $signed($unsigned(reg46))),
                      (~&$signed(wire54))}};
            end
          reg70 <= ({((~|reg56) ?
                      wire35[(4'hb):(1'h0)] : (reg45[(1'h0):(1'h0)] != (reg61 >> reg45))),
                  ((+wire32[(3'h5):(3'h5)]) ?
                      (reg66 ?
                          reg65[(4'h9):(3'h6)] : $unsigned(wire38)) : $signed((wire51 ?
                          reg49 : reg49)))} ?
              (({(wire37 ^~ reg57), (^reg58)} ?
                      ($unsigned(wire34) ?
                          ((8'ha9) ^~ (8'h9e)) : (wire35 ^~ wire37)) : (8'hba)) ?
                  ((reg62[(2'h3):(1'h0)] ? (&wire35) : $unsigned(wire54)) ?
                      reg45 : reg43) : (wire34[(4'hb):(4'h9)] <= $unsigned({wire37,
                      wire33}))) : $unsigned((8'hb0)));
        end
      reg71 <= wire53[(2'h2):(1'h1)];
      reg72 <= {$unsigned((($signed((8'hbc)) ? $signed(reg62) : (7'h43)) ?
              $unsigned(wire33) : (^$unsigned(wire54))))};
      reg73 <= reg49;
      reg74 <= (~reg71);
    end
  assign wire75 = $unsigned((^(^$signed((reg64 ? wire53 : (8'hb0))))));
  assign wire76 = (wire54 ?
                      reg71[(4'h8):(3'h5)] : $signed($unsigned($unsigned(wire54))));
  assign wire77 = wire38;
  assign wire78 = $unsigned(({wire39, (~wire33)} ?
                      $unsigned($unsigned((~&(8'hbb)))) : wire31));
  assign wire79 = ($signed({wire54[(2'h3):(1'h0)]}) ?
                      $signed(reg63[(3'h4):(3'h4)]) : ($signed(reg70[(2'h3):(2'h2)]) << wire53[(2'h2):(1'h1)]));
  assign wire80 = {$unsigned((~(~(reg60 >= wire55)))),
                      (|$signed((+(wire59 * reg43))))};
  assign wire81 = $signed((wire31 ?
                      wire53[(3'h4):(3'h4)] : ($unsigned((8'hb0)) ?
                          reg66 : ((reg60 ? wire75 : reg64) + (wire38 ?
                              reg72 : wire51)))));
endmodule

module module13
#(parameter param26 = ((!{((8'hac) ? (~&(8'haf)) : (~(8'hb3))), {{(8'h9f), (7'h42)}, ((8'haf) >> (8'hb5))}}) < (8'hac)), 
parameter param27 = (~|((&((param26 ? (8'hb6) : (8'hb3)) * (~param26))) ? ((^~(|(8'hb6))) < (((8'ha2) ? param26 : param26) ? (~&(7'h40)) : ((8'hb3) & (8'hac)))) : param26)))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  input wire [(4'hd):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  assign y = {wire21, wire20, wire19, reg25, reg24, reg23, reg22, (1'h0)};
  assign wire19 = wire16[(1'h0):(1'h0)];
  assign wire20 = (-$signed({(|$signed(wire16))}));
  assign wire21 = {$unsigned($signed(wire14)),
                      ($signed({(wire16 ? wire20 : wire15),
                          (&wire14)}) != (~^$signed((^~(8'ha9)))))};
  always
    @(posedge clk) begin
      reg22 <= wire15[(3'h6):(3'h5)];
      reg23 <= {wire15[(1'h1):(1'h0)], (^(!(+(wire15 ? reg22 : wire20))))};
      reg24 <= (&({wire15} >= ({(wire16 ? reg22 : (7'h40)),
          $signed(wire19)} & wire18)));
      reg25 <= (($unsigned(wire19[(2'h3):(1'h0)]) != (7'h43)) ?
          wire16[(3'h4):(2'h3)] : $unsigned(reg22));
    end
endmodule
