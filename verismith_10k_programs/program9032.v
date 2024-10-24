module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  assign y = {wire118,
                 wire116,
                 wire95,
                 wire93,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire4 = {($signed(wire0) <= $unsigned($unsigned((wire0 + (8'haa)))))};
  assign wire5 = wire0[(2'h3):(1'h1)];
  assign wire6 = ({$signed($signed(wire2)),
                     ($signed($unsigned((8'ha7))) & wire5[(3'h5):(3'h4)])} >= wire2);
  assign wire7 = (|(wire6 ?
                     ((!(~^wire6)) ?
                         $unsigned((8'ha9)) : ((&wire5) ?
                             (wire2 | wire5) : $unsigned(wire0))) : {(~^(wire1 ?
                             wire2 : wire0))}));
  assign wire8 = ($unsigned($signed(wire2[(1'h0):(1'h0)])) << (({(wire1 & wire1)} ?
                         {wire0, {wire6}} : ((wire6 - wire6) | {wire6})) ?
                     $signed(wire2[(1'h1):(1'h1)]) : $unsigned((~|wire3[(4'he):(4'hb)]))));
  assign wire9 = {wire1, $signed((~^$signed(((8'hac) ? wire5 : wire0))))};
  assign wire10 = wire3;
  assign wire11 = $unsigned(wire0);
  always
    @(posedge clk) begin
      reg12 <= wire11[(2'h3):(1'h0)];
      reg13 <= ((($unsigned((|wire9)) ?
                  (^wire4) : ($unsigned(wire5) ?
                      (wire4 ? wire6 : wire8) : wire3)) ?
              $unsigned($unsigned(wire7[(3'h4):(2'h3)])) : $signed(wire6[(3'h6):(3'h4)])) ?
          (wire7 ?
              (wire9[(5'h14):(4'h9)] > ((wire10 <= wire2) | $unsigned(wire9))) : {((8'hbd) ?
                      (~^wire6) : {reg12})}) : $unsigned((!$signed($signed(wire6)))));
      reg14 <= reg12[(4'hc):(3'h6)];
    end
  assign wire15 = wire6[(1'h0):(1'h0)];
  assign wire16 = (&wire10);
  assign wire17 = (^wire11[(5'h11):(4'hd)]);
  assign wire18 = wire16[(4'hd):(3'h4)];
  assign wire19 = wire0[(3'h6):(1'h1)];
  assign wire20 = wire5;
  assign wire21 = (wire16 ?
                      $unsigned($unsigned(((~|reg13) >>> {wire7,
                          wire0}))) : (((reg14[(4'h8):(3'h6)] >>> (wire0 ?
                                  wire17 : reg13)) ?
                              $signed($signed(wire16)) : (wire5 * wire10)) ?
                          (reg13[(3'h5):(1'h0)] ?
                              wire9[(5'h11):(2'h2)] : $signed((wire17 & wire15))) : (|$signed(wire9))));
  module22 #() modinst94 (.wire26(wire19), .wire24(wire16), .wire25(wire2), .wire23(reg13), .wire27(wire21), .clk(clk), .y(wire93));
  assign wire95 = wire4[(4'hd):(3'h5)];
  module96 #() modinst117 (wire116, clk, wire9, wire6, wire11, wire4);
  assign wire118 = (~^$signed((~&{{wire8}, (~^wire3)})));
endmodule

module module96
#(parameter param114 = ((((((8'hbf) ? (8'had) : (8'hb1)) ? (~(7'h42)) : ((8'hbb) ? (8'ha0) : (8'hb0))) && ({(8'hae)} ? {(8'hbc), (8'haf)} : ((8'hbf) - (8'ha2)))) >> (&(|((8'ha6) ^~ (8'hba))))) ? (~|(~((^~(8'hb8)) - (~&(8'hb3))))) : (((^~((8'hb2) && (8'hb9))) ? ((~^(8'h9f)) ? (!(7'h44)) : {(8'hab)}) : (&(7'h42))) ^~ (!((~|(7'h41)) ? (+(8'ha1)) : (-(7'h43)))))), 
parameter param115 = param114)
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire100;
  input wire [(4'he):(1'h0)] wire99;
  input wire [(5'h12):(1'h0)] wire98;
  input wire [(5'h13):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(5'h13):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire101 = {$unsigned((~($unsigned(wire99) && $unsigned(wire97))))};
  assign wire102 = wire98[(1'h0):(1'h0)];
  assign wire103 = (wire101[(3'h7):(1'h1)] ^ (!(wire99[(4'h9):(3'h4)] | wire97)));
  assign wire104 = wire102[(5'h12):(4'ha)];
  assign wire105 = $unsigned((8'ha9));
  assign wire106 = wire97;
  always
    @(posedge clk) begin
      reg107 <= (^(((wire100 ? (^wire100) : wire103[(3'h4):(2'h2)]) ?
          ({wire101} ?
              $unsigned(wire103) : $unsigned(wire101)) : wire106) * wire101[(1'h1):(1'h1)]));
      reg108 <= (~|($unsigned(wire103) ?
          $unsigned((wire98[(3'h4):(2'h2)] ?
              $unsigned(wire97) : wire101[(4'ha):(1'h1)])) : {(&(wire99 ?
                  wire97 : wire98)),
              wire103[(4'h8):(3'h6)]}));
      reg109 <= wire103[(4'h8):(2'h2)];
      reg110 <= (-wire98[(4'h9):(2'h3)]);
      reg111 <= wire99;
    end
  assign wire112 = ((8'hb7) - (((7'h43) ~^ $signed({wire98,
                       wire102})) - $signed((wire101[(3'h4):(2'h3)] && ((8'hbd) ?
                       wire97 : reg110)))));
  assign wire113 = wire112[(3'h5):(2'h2)];
endmodule

module module22
#(parameter param92 = {(~^((8'ha0) ? (~&(~&(8'ha6))) : ((8'hb9) < ((8'h9f) ? (8'ha7) : (8'h9c)))))})
(y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire23;
  input wire [(4'hf):(1'h0)] wire24;
  input wire [(4'he):(1'h0)] wire25;
  input wire signed [(4'ha):(1'h0)] wire26;
  input wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire78;
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire78,
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
                 (1'h0)};
  assign wire28 = {(&$unsigned($unsigned($unsigned(wire27)))), wire23};
  assign wire29 = $signed($signed({wire26}));
  assign wire30 = wire23[(1'h1):(1'h0)];
  assign wire31 = $unsigned($signed(($unsigned(((8'hba) ^~ wire28)) <= wire26)));
  assign wire32 = {{$signed((^~(+(8'hbd))))}};
  assign wire33 = (^($signed($signed((wire29 && wire27))) <<< ($unsigned(wire27[(3'h4):(1'h0)]) ^ (|(wire27 ?
                      wire29 : (8'hac))))));
  assign wire34 = ((($signed(wire26[(3'h5):(2'h3)]) ^~ $unsigned((-wire23))) != wire23[(1'h0):(1'h0)]) ?
                      (+{$unsigned($unsigned(wire31))}) : (8'hb1));
  module35 #() modinst79 (wire78, clk, wire31, wire25, wire33, wire28, wire26);
  assign wire80 = (!(+$unsigned(wire27[(4'h8):(3'h4)])));
  assign wire81 = wire33;
  always
    @(posedge clk) begin
      reg82 <= {wire29[(2'h2):(1'h1)], wire80[(2'h3):(1'h0)]};
      if (wire33[(2'h3):(1'h1)])
        begin
          if ({wire30})
            begin
              reg83 <= (&$unsigned((($unsigned(wire31) > $signed(wire24)) <= wire78[(4'h9):(2'h3)])));
              reg84 <= $signed((wire78 ~^ $unsigned($signed($signed(wire78)))));
              reg85 <= (~&(($unsigned((wire78 << wire27)) ?
                  {((8'hb3) != wire28)} : (reg82[(1'h1):(1'h0)] ?
                      (wire34 ? wire34 : wire78) : (wire27 ?
                          wire30 : (8'had)))) << (($unsigned(wire26) > (|wire27)) >> $signed(wire31[(4'hb):(1'h1)]))));
            end
          else
            begin
              reg83 <= reg85;
              reg84 <= (($signed($signed({wire27,
                  wire33})) + (+(~|{reg82}))) || (reg83[(1'h1):(1'h1)] ?
                  $unsigned((+wire27[(2'h2):(1'h0)])) : ($signed({wire23}) <<< $signed((wire81 + wire28)))));
              reg85 <= ($signed(wire81) - $unsigned(wire34[(2'h2):(2'h2)]));
            end
        end
      else
        begin
          reg83 <= wire26[(4'ha):(1'h0)];
          if (reg85)
            begin
              reg84 <= wire27[(3'h7):(3'h7)];
              reg85 <= wire24[(1'h1):(1'h1)];
              reg86 <= (wire27 <= ($unsigned({((8'hb0) ^~ (8'haf))}) - ((wire31[(1'h1):(1'h0)] ?
                      ((8'hbd) ? reg84 : wire81) : $signed(wire23)) ?
                  ((^~(8'ha9)) ? reg82 : (~|reg82)) : reg82)));
            end
          else
            begin
              reg84 <= wire26[(3'h4):(1'h1)];
            end
          reg87 <= wire29[(2'h2):(1'h0)];
          reg88 <= wire30[(4'ha):(4'h8)];
          if (wire33)
            begin
              reg89 <= wire30;
            end
          else
            begin
              reg89 <= $signed({(wire34 - reg84[(4'hb):(4'ha)]),
                  $unsigned(wire33[(4'h8):(3'h4)])});
              reg90 <= $unsigned(reg86[(4'ha):(3'h5)]);
              reg91 <= ($unsigned(wire24) ? (^~reg85) : wire25);
            end
        end
    end
endmodule

module module35
#(parameter param77 = (^~({((8'hbf) | ((8'haa) ? (8'hae) : (8'hbb)))} ? ((~{(8'hbf), (8'hb1)}) ? (^(~&(8'hac))) : ((~(8'hbe)) ? {(8'hb5)} : {(8'h9e), (7'h43)})) : (({(8'hac), (8'hae)} ? (8'ha8) : (^~(8'ha5))) ? (!((8'ha4) ? (8'ha6) : (8'ha5))) : (((8'ha6) + (8'ha0)) <<< ((8'h9d) >> (8'hb1)))))))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire40;
  input wire [(2'h2):(1'h0)] wire39;
  input wire signed [(4'hc):(1'h0)] wire38;
  input wire [(4'hb):(1'h0)] wire37;
  input wire signed [(4'ha):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire65,
                 wire64,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg63,
                 reg62,
                 reg61,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({({$signed($signed(wire36))} < $signed($signed((wire36 ?
              wire40 : wire39)))),
          (^~(8'hb1))})
        begin
          reg41 <= wire39[(2'h2):(1'h0)];
          reg42 <= wire37;
        end
      else
        begin
          reg41 <= $signed($unsigned($signed(wire38)));
          if ((8'ha6))
            begin
              reg42 <= wire39[(1'h0):(1'h0)];
              reg43 <= wire39;
              reg44 <= reg42;
              reg45 <= (&(-reg43));
            end
          else
            begin
              reg42 <= (($unsigned($unsigned(reg42[(2'h3):(1'h0)])) - wire40[(1'h0):(1'h0)]) ?
                  $unsigned((&$signed(wire37))) : $signed(((~|((8'h9c) && reg45)) ?
                      $signed({reg44}) : ((wire36 ? wire39 : wire36) ?
                          $signed(reg44) : (reg44 && reg44)))));
            end
          reg46 <= $unsigned((($signed(reg41) ~^ $signed((reg43 >> reg41))) >> wire39));
        end
      if ((|(+wire36)))
        begin
          reg47 <= wire38[(4'ha):(3'h5)];
          reg48 <= {(reg45 >> $signed($unsigned(reg47))),
              ((wire39[(1'h1):(1'h0)] ?
                  $unsigned({reg46}) : $unsigned((reg45 ?
                      wire36 : wire38))) > $unsigned($signed(reg42[(1'h0):(1'h0)])))};
          reg49 <= $unsigned((&(({wire39, reg42} ? (-(8'hbb)) : (~^wire38)) ?
              wire36 : ($signed(reg45) ?
                  ((8'hac) ? reg41 : reg47) : wire37[(3'h7):(1'h0)]))));
          reg50 <= (8'h9c);
        end
      else
        begin
          reg47 <= ((^~reg45[(2'h2):(2'h2)]) ?
              wire38[(2'h2):(1'h1)] : (^~$unsigned(reg44)));
          if ((reg43 ~^ ({$signed($unsigned(reg48))} > {$unsigned(wire37[(1'h1):(1'h0)]),
              ((^reg45) | $signed(reg46))})))
            begin
              reg48 <= ($unsigned(((reg49 >= (wire38 < (8'h9f))) ?
                      (~^(~^(8'ha2))) : (&wire36))) ?
                  $unsigned(reg46[(2'h2):(1'h0)]) : (|(~^($unsigned(wire39) == $unsigned(wire40)))));
              reg49 <= (-((^$signed((^(8'had)))) ?
                  reg41 : ({reg46[(3'h4):(1'h1)]} >>> wire39)));
              reg50 <= wire36[(3'h5):(1'h1)];
              reg51 <= (8'hb7);
            end
          else
            begin
              reg48 <= ((7'h42) & $unsigned((+$unsigned((reg48 ?
                  wire37 : wire39)))));
              reg49 <= $unsigned($signed($signed($signed(((8'ha5) + wire38)))));
              reg50 <= ($unsigned(reg44[(4'hd):(3'h6)]) ?
                  $unsigned((|wire39[(1'h1):(1'h1)])) : $signed($signed(reg49)));
            end
          reg52 <= (7'h43);
          reg53 <= wire37;
          reg54 <= (((+$unsigned(reg52)) | $unsigned(wire40[(3'h5):(1'h1)])) >= reg53[(2'h3):(1'h1)]);
        end
      reg55 <= wire38;
      reg56 <= $unsigned($unsigned($signed(($unsigned(reg44) ?
          (reg45 <= reg42) : {reg45}))));
    end
  assign wire57 = (-{reg49[(3'h4):(3'h4)]});
  assign wire58 = reg46;
  assign wire59 = (-$signed(($signed((~reg51)) ?
                      $signed(((7'h41) ?
                          (8'hb7) : wire40)) : $unsigned($signed(reg48)))));
  assign wire60 = $signed($signed(reg49));
  always
    @(posedge clk) begin
      reg61 <= wire38;
      reg62 <= (($signed($unsigned(wire58[(1'h0):(1'h0)])) & $unsigned(reg43)) ~^ (reg51 ^~ ((wire38[(3'h4):(2'h2)] ?
              (8'h9c) : (7'h44)) ?
          (8'h9c) : (&$signed((8'ha1))))));
      reg63 <= $signed((|((8'hbb) ? reg43 : $unsigned($unsigned((8'hbb))))));
    end
  assign wire64 = $signed(reg48[(3'h6):(2'h3)]);
  assign wire65 = $signed($signed($signed((~&(wire58 != wire59)))));
  always
    @(posedge clk) begin
      reg66 <= (+(~|((&(~|reg48)) ?
          {$signed(reg51)} : ({reg61} ?
              $unsigned(wire65) : $unsigned((8'hb0))))));
      reg67 <= {$signed(wire40[(2'h3):(2'h3)])};
      reg68 <= (reg51 ^ (^reg61));
      reg69 <= ((~|($unsigned((^~wire65)) <<< {(8'ha0),
          (wire36 || reg54)})) || (~&$unsigned((7'h40))));
      if ($unsigned((($signed(reg50) <<< (^$unsigned(reg47))) ?
          ($unsigned($unsigned(reg61)) ?
              wire58 : ($unsigned(reg41) <<< {reg47})) : (-$unsigned(wire38[(3'h5):(3'h5)])))))
        begin
          reg70 <= (((reg54 ?
                  (8'h9c) : ($signed(reg45) ^ (8'h9e))) >= {(-(~|reg62)),
                  wire65[(3'h4):(1'h0)]}) ?
              reg43 : (&{(~$unsigned(wire64)), $signed($signed((8'ha7)))}));
          reg71 <= {$signed(((((8'ha8) ? reg63 : reg61) * reg67) ?
                  reg46 : $signed(wire36[(4'h8):(1'h0)])))};
          reg72 <= $signed((^~wire64[(3'h7):(3'h7)]));
          reg73 <= (8'haf);
        end
      else
        begin
          reg70 <= wire59;
        end
    end
  assign wire74 = ({$unsigned($unsigned($unsigned(reg70)))} ?
                      ((reg56 ?
                              ((reg56 ? wire60 : wire36) << (wire64 ?
                                  reg52 : wire36)) : (reg49[(1'h1):(1'h1)] | (reg72 ?
                                  reg71 : reg61))) ?
                          reg62 : reg62[(3'h5):(3'h5)]) : reg69);
  assign wire75 = ($signed($signed((~reg51))) < wire36);
  assign wire76 = reg72[(4'hb):(2'h2)];
endmodule
