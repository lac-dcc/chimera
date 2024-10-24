module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire183;
  wire signed [(3'h7):(1'h0)] wire182;
  wire signed [(5'h14):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire180;
  wire signed [(3'h7):(1'h0)] wire179;
  wire [(5'h11):(1'h0)] wire178;
  wire [(4'h9):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire54;
  reg [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(4'hc):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg170 = (1'h0);
  reg [(4'he):(1'h0)] reg169 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire161,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire56,
                 wire54,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
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
                 (1'h0)};
  module4 #() modinst55 (wire54, clk, wire0, wire1, wire3, wire2);
  assign wire56 = {wire3[(2'h2):(1'h0)],
                      ($signed(wire54) ?
                          (wire0[(4'ha):(2'h3)] ?
                              ($unsigned(wire2) ?
                                  (wire3 ?
                                      (8'had) : wire2) : $signed(wire1)) : (8'ha1)) : (((~|wire1) ?
                                  (wire54 < wire3) : (~|wire54)) ?
                              ((wire1 ? wire54 : wire3) ?
                                  wire0[(3'h4):(2'h2)] : wire2) : (wire54[(5'h14):(5'h11)] ?
                                  wire1 : $signed(wire3))))};
  always
    @(posedge clk) begin
      reg57 <= wire56[(4'h8):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg58 <= wire54[(1'h1):(1'h1)];
      reg59 <= ((^~wire2[(4'h8):(3'h7)]) ^~ (reg58 <= $unsigned((8'hb9))));
      if ($signed(((~|($unsigned((8'hae)) > $unsigned(wire54))) == wire1)))
        begin
          reg60 <= ((!($unsigned($unsigned(wire54)) ~^ wire0)) ?
              (^~wire2[(1'h0):(1'h0)]) : (~{(|wire3), $unsigned({wire2})}));
          reg61 <= wire3;
          reg62 <= (wire56 ?
              $signed((wire56[(3'h7):(3'h5)] ?
                  $unsigned((~|wire54)) : $signed((wire54 ?
                      (8'h9e) : (8'ha8))))) : (~^reg60[(3'h5):(3'h4)]));
          if ((~&$signed(((8'haa) || wire56[(3'h4):(1'h1)]))))
            begin
              reg63 <= $unsigned((!((&$signed(reg61)) - wire3[(2'h2):(2'h2)])));
              reg64 <= $unsigned(((^~($signed(reg59) ~^ $unsigned(reg62))) ?
                  $signed(wire0[(4'h8):(1'h1)]) : ($unsigned(wire1[(4'hb):(3'h7)]) || (|{reg57}))));
            end
          else
            begin
              reg63 <= reg60[(3'h5):(2'h3)];
              reg64 <= (&((($unsigned(reg60) ?
                      {wire3, wire1} : (&reg58)) || {{reg61, wire56}}) ?
                  reg61[(4'hc):(4'h8)] : $unsigned({(wire56 ? reg62 : wire3),
                      {(8'ha3)}})));
              reg65 <= (!{wire54});
              reg66 <= {(!$unsigned({$signed(wire56)})), $signed((8'hbc))};
              reg67 <= (!(($unsigned($signed(reg62)) ?
                  ((wire3 ? (8'hab) : reg57) ?
                      (~|reg57) : (reg66 ?
                          reg57 : reg57)) : (~|(8'hb5))) <<< ((|(reg57 && (8'haa))) ?
                  (^~$unsigned(reg63)) : ((wire2 >= reg65) ?
                      reg63[(3'h5):(2'h3)] : (wire54 ? reg60 : reg63)))));
            end
          reg68 <= reg57[(3'h7):(3'h6)];
        end
      else
        begin
          reg60 <= $unsigned($signed($unsigned({$signed(reg57)})));
          reg61 <= reg57[(4'ha):(2'h3)];
          reg62 <= wire1;
          reg63 <= (reg68 ?
              (|(reg64 != wire56[(2'h3):(1'h0)])) : ((^~{reg65[(4'h9):(1'h0)]}) >> $signed(wire56[(3'h7):(1'h0)])));
        end
    end
  assign wire69 = $signed((reg57[(4'hc):(2'h3)] ?
                      ($unsigned((reg63 ~^ wire2)) && ((wire0 ?
                              wire2 : (8'ha8)) ?
                          $signed(reg66) : wire1[(4'h8):(2'h3)])) : ($signed((^~reg59)) == reg60[(3'h6):(2'h3)])));
  assign wire70 = (reg66[(2'h2):(1'h1)] <= (~|((reg67[(2'h2):(1'h0)] ?
                      (reg62 ?
                          (7'h43) : reg59) : wire1[(4'hb):(4'h9)]) << reg63[(4'h9):(2'h2)])));
  assign wire71 = $unsigned((reg61[(4'hb):(3'h4)] ?
                      reg61[(3'h4):(1'h0)] : $unsigned((~|(reg61 > reg59)))));
  assign wire72 = (wire3[(1'h0):(1'h0)] ?
                      {(($unsigned(wire71) ? (reg64 ? reg64 : wire3) : wire71) ?
                              wire71[(1'h0):(1'h0)] : ((reg65 ?
                                      wire54 : (8'hb6)) ?
                                  wire69[(3'h5):(2'h2)] : $signed(reg65)))} : $unsigned($signed(wire2)));
  assign wire73 = $signed($unsigned($unsigned($signed((wire0 ?
                      (8'hb4) : (7'h43))))));
  module74 #() modinst162 (.y(wire161), .wire75(reg59), .wire78(wire1), .clk(clk), .wire76(reg61), .wire77(wire56));
  always
    @(posedge clk) begin
      if ($signed((&reg66[(4'h9):(2'h3)])))
        begin
          reg163 <= ($signed(reg61) - ((reg61[(1'h0):(1'h0)] ?
              $unsigned((wire73 ?
                  wire73 : wire1)) : reg66[(3'h5):(2'h3)]) && $signed($signed(((8'hb1) ?
              wire0 : reg60)))));
          reg164 <= $signed(($unsigned(reg65) + (~({wire69,
              wire2} ^~ (^~wire54)))));
          reg165 <= $unsigned({wire69[(3'h5):(1'h0)], wire0});
          reg166 <= $signed(reg66[(3'h6):(3'h5)]);
          reg167 <= (~|wire70[(3'h4):(2'h3)]);
        end
      else
        begin
          reg163 <= {($signed((|(!(8'hbe)))) ?
                  ((|$signed(wire54)) ?
                      reg63[(3'h7):(1'h1)] : $unsigned((reg64 | wire161))) : ($unsigned((reg61 ?
                          reg163 : wire70)) ?
                      (8'hbc) : $signed(wire54[(3'h4):(3'h4)]))),
              ($unsigned((!wire71)) ?
                  (|(reg66 > ((8'hbc) ?
                      wire56 : wire70))) : $signed($unsigned($unsigned(wire71))))};
          reg164 <= ({(8'ha5), {reg66, reg57[(4'hc):(4'h9)]}} ?
              ((reg164[(4'hb):(2'h2)] >> $unsigned($unsigned(wire72))) || ((&$unsigned(wire0)) - (~|(reg58 >>> wire3)))) : {((reg163[(3'h5):(3'h5)] ?
                      (reg64 >>> reg64) : (wire71 ~^ (7'h43))) ^~ $signed((~|(8'haa)))),
                  $unsigned($signed((reg63 ? reg165 : reg68)))});
        end
      reg168 <= {{$signed($unsigned((|wire1))),
              (($unsigned(wire69) >> {reg167}) ?
                  $unsigned($unsigned(wire73)) : {wire71[(3'h7):(3'h5)]})}};
    end
  always
    @(posedge clk) begin
      if (wire3[(2'h2):(2'h2)])
        begin
          if (reg63[(4'h9):(1'h0)])
            begin
              reg169 <= $unsigned($unsigned(reg63[(4'h9):(3'h4)]));
              reg170 <= (-reg58);
              reg171 <= {wire71[(3'h5):(3'h5)]};
            end
          else
            begin
              reg169 <= (($signed($signed((wire72 ?
                      reg59 : reg61))) <<< {{$unsigned(reg63)}}) ?
                  (~(((reg65 ? wire54 : reg169) ?
                      wire69[(1'h1):(1'h1)] : {reg66, reg68}) == (((8'hbe) ?
                      wire71 : reg171) - reg164))) : (+reg167[(3'h4):(2'h2)]));
              reg170 <= $unsigned((reg163 ?
                  reg63 : $unsigned($unsigned(reg63))));
              reg171 <= reg61[(4'hc):(3'h6)];
              reg172 <= $signed((&$unsigned(((^reg168) ?
                  reg166 : (reg64 ~^ (8'hac))))));
            end
          reg173 <= reg59;
          reg174 <= (reg57 ?
              (!($signed((reg67 ^~ (8'hb0))) >>> (+{wire161}))) : wire0);
        end
      else
        begin
          reg169 <= (^(((~&$unsigned(reg163)) ?
              $unsigned($unsigned(reg167)) : (~&(reg170 ?
                  wire69 : wire161))) < (~&$signed((wire1 ?
              (8'ha2) : (7'h41))))));
          reg170 <= reg64[(1'h0):(1'h0)];
        end
      reg175 <= wire70;
      reg176 <= $unsigned({$unsigned(($signed((8'hbf)) | {(8'ha4)}))});
      reg177 <= {$signed((wire0 ^ $unsigned($signed(wire56)))),
          $signed($unsigned($unsigned({wire56, wire2})))};
    end
  assign wire178 = (reg59[(4'h8):(3'h5)] <<< wire161);
  assign wire179 = ((8'hb0) ?
                       $signed((!$signed((^reg166)))) : wire1[(4'h8):(3'h6)]);
  assign wire180 = ((+reg177) * (({(reg169 || (8'hba)),
                               (reg57 ? wire161 : reg68)} ?
                           {$unsigned((8'h9f)),
                               (reg163 ? wire73 : reg67)} : reg169) ?
                       (($unsigned(wire179) ? (reg57 & reg61) : (~^(8'ha8))) ?
                           (+$signed(wire1)) : wire69) : $signed(((reg164 ?
                           wire2 : (8'hbc)) >>> $signed(reg175)))));
  assign wire181 = wire180;
  assign wire182 = (7'h43);
  assign wire183 = $signed((8'ha9));
endmodule

module module74
#(parameter param159 = ({((((7'h44) ~^ (8'hb8)) && ((8'hb7) ? (8'hb6) : (8'haf))) ? ({(8'hab)} ? ((8'hb6) + (8'hab)) : (8'haf)) : (((8'hbc) - (8'hae)) ? ((8'hbb) + (8'hbf)) : ((8'h9f) ^~ (8'ha7))))} ? ((~&(&((7'h42) | (8'h9e)))) ? ((((8'hab) >= (8'hb5)) ? (8'hab) : (~&(8'hbe))) >> (7'h41)) : ((^~{(7'h40), (8'hb6)}) - ((~(8'hbd)) < ((7'h43) ? (8'ha3) : (8'ha3))))) : ((({(8'h9c), (8'ha7)} ~^ (^~(8'hb3))) ? (((8'haf) | (8'hae)) > ((8'ha4) ? (8'ha4) : (8'h9f))) : ({(8'ha6), (8'ha2)} ? ((8'ha7) != (8'ha0)) : ((8'haf) || (8'hb3)))) ? (^~({(8'hae), (8'h9f)} ? {(8'hb2)} : ((8'h9d) >> (8'hb9)))) : ((|(^(8'ha3))) ? ({(8'hb3), (8'ha2)} ? ((8'hb8) ? (7'h43) : (8'hb0)) : ((8'hb1) << (7'h41))) : {{(8'h9e), (8'haa)}}))), 
parameter param160 = (~|(&param159)))
(y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire78;
  input wire signed [(5'h11):(1'h0)] wire77;
  input wire [(4'hb):(1'h0)] wire76;
  input wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire158;
  wire [(4'hf):(1'h0)] wire157;
  wire signed [(4'ha):(1'h0)] wire156;
  wire signed [(3'h4):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire92;
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 wire102,
                 wire101,
                 wire92,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  module79 #() modinst93 (.y(wire92), .clk(clk), .wire82(wire77), .wire81(wire78), .wire80(wire76), .wire83(wire75));
  always
    @(posedge clk) begin
      if ($unsigned(wire92[(4'hc):(4'ha)]))
        begin
          reg94 <= $signed((8'ha4));
          reg95 <= ((((-(-wire78)) <<< ($signed(reg94) ?
                      (wire92 ? wire76 : wire92) : $signed(wire77))) ?
                  wire77 : wire78[(3'h4):(2'h3)]) ?
              (7'h40) : reg94);
        end
      else
        begin
          reg94 <= ((|wire75[(1'h0):(1'h0)]) ^ (~&$signed(({wire92, reg94} ?
              reg95[(1'h1):(1'h1)] : (reg94 ? (8'hb5) : wire75)))));
        end
      reg96 <= $signed((8'hac));
      if ((^~$unsigned($unsigned(wire75))))
        begin
          reg97 <= $signed(wire75[(3'h6):(1'h0)]);
          reg98 <= ((wire75[(3'h5):(3'h4)] <= $unsigned($signed($signed(wire76)))) != reg95[(1'h1):(1'h1)]);
          reg99 <= ($unsigned($unsigned($unsigned($unsigned(wire76)))) ?
              (~|wire75) : ({reg96[(1'h1):(1'h1)]} <<< (8'h9c)));
          reg100 <= wire75;
        end
      else
        begin
          reg97 <= (reg95 * $unsigned(wire92));
        end
    end
  assign wire101 = reg94;
  assign wire102 = reg99;
  module103 #() modinst154 (.wire107(wire92), .wire105(wire78), .wire104(reg96), .clk(clk), .y(wire153), .wire106(reg99));
  assign wire155 = (($signed((reg97 ?
                               reg97[(2'h2):(1'h1)] : ((8'ha0) ?
                                   reg94 : wire92))) ?
                           $unsigned((reg97 <<< ((8'hab) ?
                               wire153 : wire153))) : $signed((!reg94[(2'h2):(1'h1)]))) ?
                       ({wire101} - $unsigned(($unsigned(wire153) >> (^(7'h40))))) : $unsigned((($unsigned((8'haf)) >> wire78) + (~(8'ha3)))));
  assign wire156 = reg99;
  assign wire157 = $unsigned(wire153);
  assign wire158 = reg95[(1'h1):(1'h1)];
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h1d5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire6;
  input wire [(2'h2):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire9;
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire29,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire9,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg32,
                 reg31,
                 reg30,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire9 = wire7[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      if ($signed((((wire9 ?
          {wire6} : wire5) <<< {((8'hbe) & wire5)}) > (&wire7[(4'hf):(3'h5)]))))
        begin
          reg10 <= ($unsigned(wire8[(1'h0):(1'h0)]) >= {((&(wire6 << (8'hb4))) ?
                  {$unsigned(wire7),
                      wire7[(3'h7):(1'h1)]} : wire5[(1'h0):(1'h0)]),
              wire6});
          reg11 <= (+($unsigned(({reg10} | wire8)) ?
              (~|wire5) : wire9[(1'h1):(1'h1)]));
          if ($unsigned(($unsigned(($unsigned((8'ha8)) ^~ wire7[(3'h6):(3'h6)])) ?
              ((&$signed((8'h9e))) || wire6) : (~^$signed(wire7[(1'h1):(1'h0)])))))
            begin
              reg12 <= (~&(~|(wire5[(1'h1):(1'h0)] << $unsigned((wire6 ?
                  reg10 : reg10)))));
              reg13 <= $signed({$unsigned($unsigned($unsigned(wire8)))});
              reg14 <= (~^(wire5 ? reg11 : (^({reg12} - (~^wire5)))));
            end
          else
            begin
              reg12 <= (wire7 << reg12);
              reg13 <= $unsigned(reg12[(5'h11):(4'hf)]);
              reg14 <= ((^~$signed($unsigned({wire7,
                  reg12}))) - reg14[(1'h1):(1'h0)]);
              reg15 <= $signed(((&((^~reg14) || ((8'ha3) & wire6))) ?
                  reg12 : reg14));
            end
          reg16 <= (-reg11[(4'ha):(2'h2)]);
        end
      else
        begin
          reg10 <= (~wire5[(2'h2):(1'h0)]);
          reg11 <= (-$unsigned({wire6, wire9}));
          reg12 <= wire5[(1'h1):(1'h0)];
        end
      reg17 <= reg14[(1'h0):(1'h0)];
    end
  assign wire18 = reg10[(3'h7):(3'h5)];
  assign wire19 = wire8[(3'h7):(1'h0)];
  assign wire20 = (({$unsigned((reg14 ? reg10 : reg16)),
                          (((8'hae) != (8'hb0)) ?
                              (reg13 ? (8'hb8) : (8'ha1)) : ((8'hb8) ?
                                  wire9 : wire18))} - $signed((~^(-reg14)))) ?
                      ((~^$signed($unsigned((8'hb6)))) ^~ $signed($signed((reg17 < (8'hbf))))) : (wire6[(1'h0):(1'h0)] <<< $signed($signed(reg10))));
  assign wire21 = wire7[(4'hd):(1'h1)];
  always
    @(posedge clk) begin
      if ($signed($unsigned(($signed($signed(wire9)) ?
          {(wire21 ^ reg15),
              wire5} : ($unsigned((8'hb1)) < reg15[(4'hf):(4'hd)])))))
        begin
          reg22 <= (~|reg17[(1'h1):(1'h0)]);
        end
      else
        begin
          reg22 <= {$unsigned($signed($signed($signed((7'h40)))))};
          reg23 <= (reg13 ~^ reg13[(3'h5):(3'h5)]);
          reg24 <= {(($unsigned((wire19 * wire7)) - $signed((~&reg17))) * reg16)};
        end
      reg25 <= {(^~(-(|reg23))), wire20};
      reg26 <= $signed((~|(~$signed((8'hbc)))));
      reg27 <= $signed(($signed((reg14[(1'h0):(1'h0)] ?
          (reg22 ? wire20 : reg22) : $signed(wire20))) ~^ reg14));
      reg28 <= reg27[(2'h2):(1'h0)];
    end
  assign wire29 = (+(|(($unsigned(reg23) ^ $signed(reg17)) >> ($signed(wire20) ?
                      (reg26 + reg25) : (wire9 == reg23)))));
  always
    @(posedge clk) begin
      reg30 <= (reg24[(2'h2):(1'h1)] ^~ (reg25 ?
          wire18[(3'h4):(1'h0)] : ((!(reg13 < (8'h9f))) + $signed(reg15))));
      reg31 <= {$signed(($unsigned((8'hbf)) < $signed(reg14))), reg22};
      reg32 <= ($signed(reg27) ?
          (reg17 ?
              (reg12 >> reg10[(3'h4):(2'h2)]) : ($signed((wire19 ?
                      reg22 : reg28)) ?
                  (^~$signed(reg31)) : (^~$signed(reg11)))) : (-$signed($unsigned((reg31 ?
              (7'h43) : reg25)))));
    end
  assign wire33 = {(wire21 - $unsigned(wire9[(4'h8):(3'h4)])),
                      {((reg32[(1'h0):(1'h0)] - $signed(reg12)) ?
                              (((7'h41) << wire5) & reg22) : $signed($signed(wire21))),
                          (&reg14[(2'h2):(1'h1)])}};
  assign wire34 = reg13[(3'h7):(3'h5)];
  assign wire35 = $signed(reg12[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg36 <= ($signed($signed((~&(7'h41)))) ?
          $signed(wire35[(3'h7):(3'h7)]) : (^(((8'h9e) ?
                  (+(7'h42)) : (~^wire29)) ?
              $unsigned($signed(wire20)) : (|reg11))));
      if ((!(wire35[(4'hd):(4'hc)] ?
          {(((8'hb1) ? reg24 : wire34) ?
                  $signed(wire19) : {wire35, wire33})} : (&{((8'hab) ?
                  wire6 : reg12),
              $signed(reg11)}))))
        begin
          reg37 <= reg32;
          if (($unsigned(((^~(~wire20)) ~^ $unsigned((|wire6)))) == ($unsigned({{reg36,
                  reg15},
              {reg24, reg13}}) > {(reg24 || (!wire20)),
              ((reg26 ? reg15 : reg16) <<< (wire6 | wire19))})))
            begin
              reg38 <= $unsigned($unsigned($unsigned(reg27[(1'h1):(1'h0)])));
            end
          else
            begin
              reg38 <= $signed((^~(+$signed($unsigned((8'h9f))))));
            end
          reg39 <= reg25[(3'h6):(3'h5)];
          reg40 <= $unsigned(($unsigned(((|wire9) ?
                  {wire9, reg26} : (~&(7'h40)))) ?
              $unsigned((|$unsigned(wire7))) : ($unsigned((reg30 != wire19)) >>> $signed(((8'haa) ?
                  wire29 : wire6)))));
          if (wire5)
            begin
              reg41 <= $unsigned($unsigned(wire5[(1'h0):(1'h0)]));
              reg42 <= wire19[(4'h9):(3'h6)];
            end
          else
            begin
              reg41 <= reg23[(2'h2):(1'h0)];
              reg42 <= reg26;
              reg43 <= $signed($unsigned({reg11[(4'ha):(3'h6)]}));
              reg44 <= ((~|$unsigned($unsigned(reg26))) ?
                  ($unsigned($unsigned((+reg25))) >>> {wire19[(2'h3):(1'h0)]}) : ((~^$signed($signed(reg15))) >>> ({(wire19 ?
                          wire9 : reg13)} <<< reg12[(4'hd):(3'h5)])));
            end
        end
      else
        begin
          if (((~^((8'h9f) - ((reg27 ? reg36 : wire9) > (reg32 > reg25)))) ?
              {wire7} : $unsigned($unsigned(reg36))))
            begin
              reg37 <= ((($signed({(8'hac)}) ?
                          $unsigned($signed(wire6)) : ($unsigned(reg44) ?
                              $unsigned(wire21) : {(8'hac), wire6})) ?
                      (|$unsigned($signed(reg15))) : reg32[(4'hd):(3'h5)]) ?
                  (^reg30[(1'h1):(1'h1)]) : $unsigned({($unsigned(wire35) ?
                          (reg15 ? reg15 : wire18) : (reg27 != wire33)),
                      reg43[(3'h4):(3'h4)]}));
              reg38 <= (reg13 ?
                  ((((reg43 | reg40) << $unsigned(wire35)) ?
                      ($signed((8'ha4)) && reg39) : $signed((reg38 - wire6))) >= {{reg37},
                      $signed((wire29 ? reg37 : reg27))}) : $signed(wire5));
              reg39 <= $signed({$signed({wire18}),
                  (wire18[(4'he):(3'h5)] ?
                      (wire8 ? reg15 : wire8) : (^((8'hb0) ?
                          (8'hb9) : reg25)))});
              reg40 <= {($unsigned((wire21[(4'h8):(3'h5)] == reg25[(2'h3):(1'h0)])) <<< (!reg41))};
            end
          else
            begin
              reg37 <= wire6;
            end
          if ((&reg39[(1'h1):(1'h0)]))
            begin
              reg41 <= (^{wire9[(4'h8):(3'h7)],
                  ((!{wire19, wire5}) ? reg31 : (~^(reg28 ? wire8 : reg24)))});
              reg42 <= ((wire19[(2'h2):(1'h1)] < {$unsigned($unsigned((7'h40))),
                      (+(wire35 ? (8'ha2) : (8'ha6)))}) ?
                  reg26 : (~&((8'hbf) != $signed(reg15))));
              reg43 <= (~^({((^~reg40) ? $signed((8'hb0)) : $signed(wire9))} ?
                  reg38 : (|{$unsigned((8'ha4)), (^~wire35)})));
            end
          else
            begin
              reg41 <= (reg30 ?
                  $signed($signed($unsigned($unsigned(wire20)))) : $signed(reg30));
              reg42 <= reg15;
              reg43 <= reg14[(1'h0):(1'h0)];
              reg44 <= $signed((((^~(^reg12)) ^ (^(reg22 || reg28))) ~^ wire19));
            end
        end
      reg45 <= $signed((reg17[(4'hc):(3'h5)] | reg25));
      reg46 <= {wire33[(2'h2):(1'h1)],
          $signed($unsigned((~^$unsigned(wire7))))};
      if (wire20)
        begin
          if ($signed(reg32))
            begin
              reg47 <= ((reg13 ?
                  $signed((reg37 ? (-reg16) : $signed(wire5))) : (~^((8'hac) ?
                      (~^(8'hb2)) : $signed(reg41)))) < wire5);
              reg48 <= reg12[(4'h9):(1'h1)];
            end
          else
            begin
              reg47 <= ($unsigned((((reg39 & (8'ha9)) + (wire33 ?
                      wire5 : (8'ha0))) ?
                  wire9[(1'h1):(1'h1)] : {reg37})) ^ $signed((!$unsigned((reg25 ?
                  reg39 : wire21)))));
              reg48 <= $signed((($unsigned(reg25[(3'h5):(2'h2)]) << (wire35[(2'h3):(2'h3)] ?
                  ((8'hb6) >> reg11) : $unsigned(reg10))) << (!$unsigned((reg36 ?
                  (8'hb7) : reg16)))));
            end
          reg49 <= $signed((+{(~|wire34)}));
        end
      else
        begin
          reg47 <= (reg41 ?
              ($signed($unsigned(reg13[(4'ha):(4'h9)])) ~^ $signed(($unsigned(reg46) ?
                  (reg23 ? reg13 : reg39) : (reg27 ?
                      reg49 : reg48)))) : (wire9[(2'h3):(2'h2)] ?
                  reg22 : (($unsigned(wire29) ?
                          $signed(reg48) : reg48[(3'h6):(2'h3)]) ?
                      reg24[(2'h3):(2'h3)] : ($unsigned((8'hbd)) <= $signed(wire35)))));
          if (((-$unsigned({$unsigned(reg37),
              $unsigned((8'hab))})) << ($unsigned((~^(!reg47))) ^~ (((wire29 ?
              wire34 : reg31) || wire20) - {((8'had) | reg17), wire35}))))
            begin
              reg48 <= ((^~(~^(&wire35))) ?
                  wire29 : ((~^{$signed(wire35)}) ?
                      ((&$signed(reg11)) ?
                          reg17 : reg44[(1'h0):(1'h0)]) : wire21[(2'h3):(1'h1)]));
              reg49 <= $unsigned($unsigned((reg30 ?
                  ($unsigned(reg26) ?
                      {wire29,
                          reg15} : $unsigned(reg40)) : (&reg39[(1'h0):(1'h0)]))));
              reg50 <= reg31;
              reg51 <= wire7[(4'he):(3'h5)];
              reg52 <= $unsigned(reg11[(3'h5):(2'h2)]);
            end
          else
            begin
              reg48 <= (~&($unsigned(reg49) ^ wire29[(1'h1):(1'h0)]));
              reg49 <= $signed($unsigned((^~reg44[(2'h3):(1'h1)])));
            end
          reg53 <= $signed(reg30);
        end
    end
endmodule

module module103
#(parameter param152 = {((!(&{(8'hbe)})) & ({((8'ha8) || (8'hb2))} & ((^~(8'hac)) ~^ (8'hae)))), ({(^~((8'ha5) == (7'h43))), (~|(8'haa))} >= ({(!(8'h9c)), ((8'hbf) != (8'h9c))} ? (((8'ha8) ^ (8'ha1)) ? (~&(8'haf)) : (&(8'hba))) : {(&(8'ha6)), {(8'haf), (8'h9e)}}))})
(y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire107;
  input wire [(3'h5):(1'h0)] wire106;
  input wire [(2'h3):(1'h0)] wire105;
  input wire [(3'h4):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire151;
  wire signed [(5'h13):(1'h0)] wire150;
  wire [(5'h13):(1'h0)] wire149;
  wire signed [(4'hf):(1'h0)] wire148;
  wire signed [(3'h4):(1'h0)] wire136;
  wire signed [(5'h11):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire134;
  wire [(3'h7):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg [(2'h3):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire136,
                 wire135,
                 wire134,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire109,
                 wire108,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg133,
                 reg132,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire108 = ({{wire107[(1'h1):(1'h0)],
                               ($unsigned(wire106) == wire104[(3'h4):(2'h2)])},
                           wire107} ?
                       $unsigned($unsigned(($signed((8'hb3)) ~^ wire105[(1'h0):(1'h0)]))) : wire104[(3'h4):(1'h1)]);
  assign wire109 = wire108;
  always
    @(posedge clk) begin
      reg110 <= {$unsigned(((&(wire109 >>> (8'hb1))) ?
              $unsigned((8'ha9)) : $signed(wire105[(2'h2):(2'h2)]))),
          (^~$signed($signed((~^wire108))))};
      if ($unsigned(wire107))
        begin
          reg111 <= $unsigned((&$unsigned(wire109[(3'h5):(2'h3)])));
          reg112 <= (~&(($unsigned(reg110[(3'h6):(1'h1)]) | $signed(wire104[(2'h3):(2'h3)])) ?
              $unsigned($signed(wire108)) : (reg110 ?
                  ($signed(reg110) + (~wire107)) : reg110[(3'h4):(3'h4)])));
          reg113 <= wire109;
          reg114 <= (({(~&$signed((8'hba)))} ?
              {wire104[(1'h0):(1'h0)],
                  wire109[(3'h5):(2'h3)]} : $unsigned(reg110)) | {reg112,
              $signed(reg110)});
        end
      else
        begin
          reg111 <= wire106;
          reg112 <= reg113[(1'h0):(1'h0)];
          reg113 <= $signed(($unsigned({(~&wire106)}) >> wire106[(1'h1):(1'h0)]));
          if (wire109[(4'h8):(3'h7)])
            begin
              reg114 <= ((reg114[(4'h9):(1'h1)] ?
                  (8'hb1) : $unsigned(reg111[(4'hd):(1'h0)])) + $unsigned(wire108[(4'hb):(3'h6)]));
              reg115 <= wire108[(3'h6):(1'h1)];
              reg116 <= (|reg110[(4'ha):(1'h1)]);
              reg117 <= wire108;
              reg118 <= $unsigned(reg112);
            end
          else
            begin
              reg114 <= ($signed($unsigned((reg110[(3'h5):(2'h2)] ^ $signed(reg114)))) ?
                  ((~(!(wire104 ?
                      reg115 : wire105))) ^ $unsigned($unsigned((wire108 ?
                      (7'h41) : wire108)))) : wire107[(2'h3):(1'h0)]);
              reg115 <= ($unsigned((~^reg116)) * $unsigned(reg115[(3'h6):(2'h3)]));
              reg116 <= $unsigned(reg117);
              reg117 <= (-reg112);
            end
        end
    end
  always
    @(posedge clk) begin
      reg119 <= reg112[(3'h7):(3'h4)];
      reg120 <= $signed((~&({$signed(reg118),
          (reg111 - wire107)} - wire109[(4'hd):(3'h7)])));
      reg121 <= reg114;
    end
  assign wire122 = (^$signed($unsigned(reg119[(1'h0):(1'h0)])));
  assign wire123 = $unsigned({wire105[(1'h0):(1'h0)],
                       $unsigned({reg112[(4'ha):(1'h0)], $signed(wire107)})});
  assign wire124 = {reg120[(2'h2):(1'h0)], (8'h9e)};
  assign wire125 = (~^reg110);
  assign wire126 = reg112[(2'h3):(2'h3)];
  assign wire127 = (reg111 && ((~&(wire107 ?
                           (reg120 ? reg119 : wire109) : reg118)) ?
                       wire125[(1'h1):(1'h0)] : $unsigned(((wire122 << wire122) - (reg113 <<< reg115)))));
  assign wire128 = $unsigned((|$signed($signed((~&wire123)))));
  assign wire129 = (8'ha8);
  assign wire130 = reg116;
  assign wire131 = (^($unsigned({$signed(reg121),
                           (wire105 ? wire124 : reg116)}) ?
                       $unsigned($unsigned((^~wire104))) : reg112[(4'h9):(4'h8)]));
  always
    @(posedge clk) begin
      reg132 <= (($signed(wire125) ?
          reg111[(4'hc):(4'hc)] : (!$unsigned((wire125 ?
              (8'hae) : (8'hb6))))) >> (reg117 >>> (~$signed((wire128 ?
          wire128 : reg120)))));
      reg133 <= (reg114[(4'hb):(1'h0)] + ({($unsigned(wire122) > wire104),
              (|(reg118 ? reg110 : wire126))} ?
          reg118 : {(^(~|wire122))}));
    end
  assign wire134 = (^~(|$signed((reg117[(4'hc):(2'h3)] ~^ wire122[(5'h11):(3'h6)]))));
  assign wire135 = wire125[(2'h2):(1'h0)];
  assign wire136 = $unsigned({wire127, wire123[(3'h5):(2'h3)]});
  always
    @(posedge clk) begin
      if (($signed(($unsigned((-wire129)) <= wire126[(1'h0):(1'h0)])) >> wire135[(1'h0):(1'h0)]))
        begin
          if (((reg117[(4'hc):(4'ha)] ?
                  $signed(wire135) : wire136[(2'h3):(2'h2)]) ?
              $signed(reg114) : $signed((reg111 >>> wire106))))
            begin
              reg137 <= ((-$signed({$unsigned(wire136),
                  ((8'ha9) ^~ wire105)})) ~^ reg120[(2'h3):(2'h2)]);
              reg138 <= (-(~wire128[(2'h3):(1'h0)]));
              reg139 <= $unsigned((($signed((^wire126)) & (^~wire106)) + wire129));
              reg140 <= {wire130[(3'h7):(3'h4)],
                  (reg112 == $signed((+reg120)))};
            end
          else
            begin
              reg137 <= $signed((&(~^$unsigned(wire134[(4'hb):(4'hb)]))));
              reg138 <= $signed(((({(8'hb2),
                  reg118} <<< wire123) ^ reg120[(3'h6):(3'h4)]) >> $unsigned({(wire109 ?
                      wire134 : reg117)})));
              reg139 <= wire134[(4'ha):(3'h6)];
            end
        end
      else
        begin
          reg137 <= reg116[(4'h8):(4'h8)];
          if (($unsigned((!$unsigned((reg133 <<< wire123)))) ^~ ((wire131[(2'h3):(1'h1)] ~^ $signed(wire127[(4'ha):(3'h5)])) ?
              (reg140 << reg133) : reg132[(3'h4):(2'h3)])))
            begin
              reg138 <= wire109;
              reg139 <= (&$signed(($unsigned((-wire131)) <= {(reg111 == wire125),
                  wire134})));
              reg140 <= ((|reg111) ?
                  $unsigned(((((8'hbb) | reg112) ~^ (reg112 == reg120)) ?
                      ((reg132 ?
                          reg132 : wire127) ^~ reg137[(3'h7):(2'h2)]) : $unsigned({wire122}))) : {wire123[(3'h4):(2'h3)]});
            end
          else
            begin
              reg138 <= $signed({($unsigned(((8'ha2) ?
                      wire123 : wire136)) + (reg132[(3'h4):(3'h4)] > $unsigned(reg140)))});
              reg139 <= ($signed({wire122, $unsigned($unsigned(reg133))}) ?
                  (wire106 ?
                      {(^~{reg116}),
                          (((8'hbd) - reg133) >>> ((8'hb4) ?
                              wire123 : (8'ha2)))} : reg119[(3'h4):(3'h4)]) : wire129[(3'h5):(1'h1)]);
              reg140 <= wire130[(2'h2):(2'h2)];
              reg141 <= wire134[(1'h1):(1'h1)];
            end
          if ({$signed(wire130), (~&$signed($signed($unsigned(reg112))))})
            begin
              reg142 <= ($signed(wire108[(5'h12):(4'h8)]) >> (reg113 ?
                  $signed(wire131[(3'h5):(2'h2)]) : {$unsigned(wire106),
                      ($unsigned(reg119) > {wire128, reg110})}));
              reg143 <= reg142;
              reg144 <= wire124;
              reg145 <= reg143[(3'h4):(1'h0)];
              reg146 <= $unsigned(($signed(reg112[(3'h5):(2'h3)]) ~^ ((reg121[(2'h2):(1'h1)] != $signed(reg137)) & wire136)));
            end
          else
            begin
              reg142 <= $unsigned($signed($unsigned(((~&reg146) <<< wire109))));
              reg143 <= ((~$signed((&reg140))) ?
                  reg140 : $signed({($unsigned((8'hb9)) ^ (reg119 ?
                          reg142 : reg133))}));
              reg144 <= (^~((~|(^reg113)) | $unsigned((wire130 ?
                  wire127[(3'h5):(1'h0)] : $signed(reg139)))));
              reg145 <= (~$signed(wire136[(2'h3):(1'h0)]));
            end
        end
      reg147 <= (((wire124 ?
          $unsigned((+wire124)) : ($signed(reg111) ?
              reg137[(3'h6):(3'h5)] : (reg111 >= (8'hac)))) ^~ wire126[(2'h2):(1'h0)]) <= $signed(reg115));
    end
  assign wire148 = ((($unsigned($unsigned(wire128)) ?
                               reg142 : $signed(wire107)) ?
                           ($signed($signed(wire126)) ?
                               reg140 : {reg111[(3'h6):(2'h3)]}) : $signed($signed($unsigned(reg113)))) ?
                       $unsigned((reg120[(4'h8):(4'h8)] <= {(reg141 == reg142),
                           (wire131 >>> wire125)})) : $signed(wire105[(2'h3):(1'h1)]));
  assign wire149 = wire148[(4'hf):(2'h3)];
  assign wire150 = $unsigned(wire149[(1'h1):(1'h0)]);
  assign wire151 = {(-{$unsigned({wire135}), $unsigned({(8'hbb), (8'hb1)})})};
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire83;
  input wire [(4'hf):(1'h0)] wire82;
  input wire [(4'hb):(1'h0)] wire81;
  input wire [(4'hb):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 (1'h0)};
  assign wire84 = (wire82 ?
                      (wire82 & {($signed(wire80) > wire81[(4'ha):(3'h7)])}) : {$unsigned(wire80[(2'h2):(1'h0)])});
  assign wire85 = (((~^wire82[(4'h9):(2'h2)]) ?
                      wire84[(1'h1):(1'h1)] : $unsigned(($unsigned((8'ha3)) == $signed((8'h9e))))) ^~ (~$unsigned((wire83 <<< $unsigned(wire82)))));
  assign wire86 = (|$signed($unsigned($signed((wire80 ? (7'h40) : wire82)))));
  assign wire87 = wire83;
  assign wire88 = ((^(wire80 ? (wire82 <= (-wire83)) : wire84)) ?
                      wire84 : $signed(((|wire80[(3'h7):(1'h0)]) ?
                          (~^$signed(wire80)) : wire83)));
  assign wire89 = ((wire85 >= ({(wire80 ?
                          wire87 : wire80)} - (^~wire83[(1'h0):(1'h0)]))) && $unsigned($signed(((^(8'ha3)) <<< wire86[(2'h3):(2'h2)]))));
  assign wire90 = (wire83 ?
                      (^wire86[(2'h3):(1'h0)]) : ({$signed((-wire84)),
                          wire81[(3'h6):(3'h5)]} ^~ $signed({$signed(wire87),
                          $unsigned(wire85)})));
  assign wire91 = $unsigned(wire81);
endmodule
