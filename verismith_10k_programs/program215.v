module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire101;
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  assign y = {wire61, wire5, wire4, wire101, reg6, reg7, (1'h0)};
  assign wire4 = ($unsigned(wire3) < $unsigned($unsigned((^(wire2 < (7'h44))))));
  assign wire5 = ((((-wire2[(3'h5):(1'h1)]) ^~ (-(wire1 ? wire3 : wire2))) ?
                         wire4 : (wire0[(3'h5):(1'h0)] ~^ $unsigned(wire0[(2'h3):(2'h2)]))) ?
                     {$unsigned(((wire1 == (8'ha6)) ?
                             (^wire4) : (wire0 ? wire1 : wire3)))} : wire2);
  always
    @(posedge clk) begin
      reg6 <= $signed((~&wire3));
      reg7 <= wire3[(1'h1):(1'h0)];
    end
  module8 #() modinst62 (wire61, clk, wire5, wire4, wire0, wire2, wire1);
  module63 #() modinst102 (.y(wire101), .wire64(wire3), .clk(clk), .wire65(reg6), .wire66(wire1), .wire67(wire5));
endmodule

module module63
#(parameter param99 = ((8'hbd) ? (^(~|(8'ha8))) : ((((8'hbb) > ((8'had) + (8'hba))) ? (8'h9f) : {((8'ha6) ? (8'hb9) : (8'hbd))}) ? {(8'hb8)} : (({(8'haa), (7'h42)} + (^(8'hb3))) ? (((8'hba) ? (8'h9d) : (8'hbe)) * (|(7'h42))) : (&(8'ha3))))), 
parameter param100 = {{param99, {(param99 >> ((8'hac) + param99)), (!param99)}}})
(y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire67;
  input wire [(5'h14):(1'h0)] wire66;
  input wire signed [(5'h10):(1'h0)] wire65;
  input wire [(5'h15):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire98;
  wire [(4'hc):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire87;
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  assign y = {wire98,
                 wire89,
                 wire87,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  module68 #() modinst88 (.wire72(wire67), .clk(clk), .wire70(wire64), .wire69((8'ha8)), .y(wire87), .wire73(wire65), .wire71(wire66));
  assign wire89 = ((&{(wire87 + wire64[(5'h15):(5'h11)]),
                      ((wire65 ^~ wire66) | (wire66 >= wire64))}) <<< {$signed(((wire87 ~^ wire64) ?
                          (wire65 | wire66) : wire67))});
  always
    @(posedge clk) begin
      if (($signed((wire64 >= $unsigned({wire67}))) > {$signed(wire67[(4'hb):(4'h8)])}))
        begin
          reg90 <= wire64;
          reg91 <= ((($unsigned({wire89}) != ($unsigned(wire67) <<< $unsigned(wire65))) + (~&wire66)) + wire87[(5'h13):(1'h1)]);
          reg92 <= reg90;
          reg93 <= $signed($signed(($unsigned((8'h9f)) & ((wire65 ?
              (8'hb5) : (8'hb5)) >> (7'h41)))));
        end
      else
        begin
          reg90 <= ((~(+$unsigned(reg91))) <<< (wire66 ^~ $signed(wire89)));
          reg91 <= $signed($signed(((reg90 ?
                  (wire64 ? reg92 : wire67) : $unsigned(wire65)) ?
              reg93 : reg90[(3'h4):(1'h1)])));
          reg92 <= wire67[(4'hf):(1'h1)];
          reg93 <= wire87[(3'h7):(3'h4)];
        end
      reg94 <= (~&($signed($signed({wire67})) ? $unsigned(wire89) : wire67));
      reg95 <= (~&$signed((-$unsigned(wire89[(2'h2):(1'h0)]))));
      reg96 <= (~reg91[(2'h2):(2'h2)]);
      reg97 <= ($signed(reg92[(1'h1):(1'h0)]) ~^ reg93);
    end
  assign wire98 = wire64[(4'h8):(2'h2)];
endmodule

module module8
#(parameter param60 = ((((((8'hb1) != (8'hb7)) * {(8'hb5), (8'ha3)}) ^ (~|(~(8'hbc)))) ? ({(8'hb0)} ? (((8'hb4) ? (8'haa) : (7'h43)) ? {(8'hb8)} : ((8'hbb) * (8'haf))) : (((8'ha6) > (8'hb2)) ? ((8'haf) | (8'ha1)) : {(8'hb6)})) : ((|(~|(7'h44))) <= ((+(8'hb4)) <<< ((8'hb9) ? (7'h41) : (7'h42))))) * ((((~(8'haa)) ? {(8'hb2), (8'hb5)} : ((8'hae) == (8'h9f))) ? (((8'hae) ? (8'hb4) : (7'h43)) ? {(8'ha1), (7'h43)} : (^~(8'ha8))) : (^~(|(8'haa)))) >> (((~&(8'ha9)) ? ((8'ha2) ? (8'h9d) : (8'hb9)) : ((8'hb9) * (8'hb8))) ~^ (|{(8'hba)})))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire signed [(3'h6):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire33;
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire51,
                 wire37,
                 wire36,
                 wire35,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire33,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire14 = wire12;
  assign wire15 = $unsigned((wire10 ?
                      ((wire10 ? $signed((8'hbc)) : wire9) ?
                          $unsigned($unsigned(wire10)) : $signed(wire14[(1'h0):(1'h0)])) : ((+$signed(wire14)) <<< (+(|wire10)))));
  assign wire16 = $unsigned((wire10[(2'h3):(1'h0)] ^~ wire11));
  assign wire17 = ((7'h44) <<< ($unsigned((8'hbb)) ?
                      ({wire12[(4'hd):(4'h9)]} >> {$unsigned(wire11),
                          wire15}) : wire10[(4'hb):(1'h1)]));
  module18 #() modinst34 (.wire23(wire12), .wire19(wire10), .wire20(wire16), .wire21(wire9), .y(wire33), .wire22(wire17), .clk(clk));
  assign wire35 = wire13;
  assign wire36 = ((!(8'ha3)) <<< wire9[(3'h7):(2'h2)]);
  assign wire37 = (|(~^wire15));
  always
    @(posedge clk) begin
      if (wire37)
        begin
          reg38 <= $signed(wire17[(4'h8):(1'h1)]);
          if ({wire36})
            begin
              reg39 <= ($signed((~|wire33)) ?
                  wire36[(1'h0):(1'h0)] : $unsigned($signed((~^wire37))));
              reg40 <= (^((^~wire35[(4'hb):(1'h1)]) ?
                  $signed(wire11) : ($unsigned($signed(wire14)) >>> (&(wire35 >= wire37)))));
            end
          else
            begin
              reg39 <= (8'hb0);
              reg40 <= (~&(wire16 || (~wire15[(2'h2):(2'h2)])));
              reg41 <= (($unsigned(wire36) ?
                      $unsigned((~^wire35)) : $unsigned($signed((8'ha0)))) ?
                  wire12 : (~^(((!wire15) ?
                      wire13 : $unsigned(wire9)) <<< reg39)));
              reg42 <= (wire36 ~^ (((wire9 ?
                      {wire36} : wire11) * wire10[(4'hf):(4'ha)]) ?
                  (reg39 ?
                      wire15 : $signed($unsigned(reg40))) : wire17[(4'ha):(4'h8)]));
              reg43 <= wire15[(3'h6):(2'h2)];
            end
          reg44 <= {reg38[(2'h2):(1'h0)], wire12[(5'h12):(1'h1)]};
          if ({{$unsigned(wire15), $unsigned(reg43[(1'h1):(1'h1)])}})
            begin
              reg45 <= (wire11[(1'h0):(1'h0)] != $unsigned({(8'hbb)}));
              reg46 <= $signed(wire35[(3'h4):(2'h2)]);
            end
          else
            begin
              reg45 <= wire16[(2'h2):(1'h0)];
              reg46 <= (-{reg45, $unsigned((+(^~wire33)))});
            end
        end
      else
        begin
          reg38 <= $unsigned((((|wire35[(5'h14):(5'h12)]) ?
                  $unsigned(((8'hb1) ? reg39 : reg39)) : $unsigned((reg46 ?
                      reg39 : wire16))) ?
              {$unsigned(((8'hab) ? wire15 : reg40))} : wire37));
        end
      reg47 <= (wire12[(2'h3):(1'h0)] ?
          $unsigned((reg46 ~^ ($unsigned(reg41) ?
              (wire11 ? reg40 : wire11) : (reg41 - wire15)))) : wire37);
      reg48 <= (((((reg43 <<< (8'hbf)) | $signed(reg47)) ?
              $signed((&reg46)) : $signed(reg44)) << (reg47 ?
              wire14 : $signed($signed(wire36)))) ?
          (~^wire14[(2'h2):(2'h2)]) : wire9[(5'h13):(4'h9)]);
      if (reg38[(1'h1):(1'h1)])
        begin
          reg49 <= wire17[(4'hb):(4'hb)];
          reg50 <= (reg45 ?
              ((((7'h44) ?
                      reg49[(1'h1):(1'h1)] : {wire37}) ^~ (reg39[(4'h9):(1'h0)] == reg47[(3'h5):(2'h2)])) ?
                  (reg41[(4'hb):(4'hb)] ?
                      $unsigned({(8'ha0), reg48}) : ((wire35 ?
                          wire12 : reg47) >= ((8'hae) ?
                          (8'hbe) : wire37))) : reg42[(4'h9):(3'h7)]) : $signed($signed(wire13)));
        end
      else
        begin
          reg49 <= {(|$signed($unsigned($signed(reg45))))};
        end
    end
  assign wire51 = {reg50, reg39};
  always
    @(posedge clk) begin
      if (reg40)
        begin
          reg52 <= (~^(reg48[(2'h3):(1'h0)] << (+((!wire10) ?
              (wire16 ^~ reg48) : $signed((8'h9e))))));
          reg53 <= $signed({$unsigned(reg48[(1'h1):(1'h1)])});
          reg54 <= (!(~reg45[(1'h0):(1'h0)]));
          reg55 <= reg47[(4'h8):(3'h5)];
        end
      else
        begin
          if (((8'hb5) ?
              (reg47 ?
                  {$unsigned($signed(reg45))} : wire14[(2'h2):(1'h1)]) : ((((wire9 ?
                              wire51 : wire35) ?
                          {wire11} : (reg42 ? wire9 : wire33)) ?
                      {(!(8'hb1))} : ({reg38, reg39} ?
                          $unsigned(reg43) : reg38[(2'h3):(2'h3)])) ?
                  (~|({(8'ha5)} ?
                      $unsigned((8'had)) : (+reg41))) : reg54[(2'h2):(2'h2)])))
            begin
              reg52 <= $unsigned($unsigned(wire14));
              reg53 <= reg40;
              reg54 <= {wire51};
            end
          else
            begin
              reg52 <= (^~{(^{(wire33 ? reg42 : reg47), $unsigned(wire14)}),
                  {($unsigned(reg52) ? reg38[(1'h1):(1'h0)] : {reg42, wire36}),
                      ({wire9} == $signed(wire51))}});
              reg53 <= $signed(($signed(({reg46} | (wire16 <<< wire11))) ?
                  (wire37 ?
                      wire33[(4'he):(4'hc)] : $unsigned($unsigned((8'hbf)))) : (~|reg41[(1'h0):(1'h0)])));
              reg54 <= (8'hac);
            end
          reg55 <= {(($signed((reg45 != wire36)) ?
                  ((reg47 ?
                      wire11 : reg46) >> reg42[(1'h0):(1'h0)]) : reg39[(3'h4):(1'h0)]) + $unsigned(reg39)),
              wire11[(3'h5):(2'h3)]};
        end
    end
  assign wire56 = $unsigned((~|((reg43[(2'h3):(2'h2)] ?
                      $signed(wire33) : $unsigned(reg52)) | $unsigned((~&wire17)))));
  assign wire57 = (!$signed((($signed(reg53) << wire9) ?
                      ((8'ha4) * (reg42 ? wire16 : wire36)) : reg55)));
  assign wire58 = wire9[(4'hb):(3'h4)];
  assign wire59 = $unsigned($signed(reg53));
endmodule

module module18
#(parameter param32 = ((|{({(8'hb9), (8'ha4)} >> {(8'h9e), (8'h9f)})}) ? (((((8'hb6) == (7'h44)) ? (&(8'h9f)) : ((8'hb5) & (8'ha3))) ? (((8'hb7) << (8'hb2)) ? ((8'ha9) ? (8'hab) : (8'hbf)) : ((7'h40) ? (8'ha0) : (8'had))) : {(~&(8'hab))}) - ((((7'h40) ? (8'hae) : (7'h43)) >= ((7'h44) ? (7'h43) : (8'h9c))) ? ({(8'hb3)} >>> (!(7'h44))) : {(8'hbe), ((8'hb2) ? (8'ha9) : (8'hbc))})) : (~^(8'hbe))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire23;
  input wire [(4'he):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire26;
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire26,
                 reg28,
                 reg27,
                 reg25,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= $unsigned((8'hbc));
      reg25 <= ($signed({(^~((8'hb7) >= wire23))}) ?
          (|$signed(wire20)) : wire20);
    end
  assign wire26 = $signed(((&(^~(wire22 ? wire20 : wire23))) ?
                      wire23 : $unsigned($unsigned(wire23[(4'h8):(2'h2)]))));
  always
    @(posedge clk) begin
      reg27 <= wire22;
      reg28 <= reg24;
    end
  assign wire29 = ($unsigned(wire20) >= ({reg27[(1'h0):(1'h0)]} || (wire23 >= $unsigned((8'ha0)))));
  assign wire30 = $signed((^reg24[(2'h2):(1'h0)]));
  assign wire31 = $signed($unsigned({(wire29[(2'h3):(2'h2)] ?
                          $unsigned(wire21) : $signed(reg27)),
                      (&{wire21})}));
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire73;
  input wire [(5'h10):(1'h0)] wire72;
  input wire [(4'ha):(1'h0)] wire71;
  input wire [(5'h15):(1'h0)] wire70;
  input wire [(4'hb):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg78,
                 (1'h0)};
  assign wire74 = ($signed(((wire73 ? (8'hbc) : wire73[(3'h6):(3'h5)]) ?
                      $unsigned((wire70 ~^ wire71)) : wire70)) - $unsigned({wire70[(5'h15):(3'h6)],
                      (|wire73)}));
  assign wire75 = $unsigned($signed($unsigned((wire72 ?
                      wire73 : wire70[(4'h9):(1'h0)]))));
  assign wire76 = $unsigned((+wire74[(2'h3):(2'h2)]));
  assign wire77 = (~^wire72[(4'h8):(1'h1)]);
  always
    @(posedge clk) begin
      reg78 <= (($unsigned(((wire70 ?
          wire69 : wire75) == {wire73})) | (((~&wire75) ?
          (~wire71) : $unsigned(wire69)) >>> wire75)) < wire73[(3'h5):(2'h2)]);
    end
  assign wire79 = $unsigned(wire74[(3'h6):(2'h2)]);
  assign wire80 = {$signed((^$signed((~&(8'ha2))))),
                      (wire77[(1'h1):(1'h0)] ? wire71 : wire76[(4'ha):(3'h4)])};
  assign wire81 = ($signed({$signed($signed(wire73))}) >> ((7'h41) << ($signed((~|wire75)) ?
                      (+((8'ha5) ? wire77 : wire75)) : ($unsigned(wire80) ?
                          $signed(wire79) : wire79))));
  assign wire82 = ($unsigned((~^($signed(wire72) != $unsigned(wire69)))) && wire71);
  assign wire83 = wire76[(3'h5):(2'h2)];
  assign wire84 = $signed(($signed((wire81 || $unsigned(wire72))) * (^~((wire82 ^ (7'h40)) ?
                      wire82[(3'h4):(1'h1)] : $unsigned(wire75)))));
  assign wire85 = {(&(~|wire75)),
                      (((|(wire83 ? wire69 : wire69)) ? (&(8'hb5)) : wire75) ?
                          ($signed($signed(wire80)) ?
                              $signed((wire75 <<< reg78)) : {(~|wire83),
                                  (wire75 ? wire84 : reg78)}) : wire75)};
  assign wire86 = $unsigned((-$signed($unsigned((wire77 ? wire82 : wire72)))));
endmodule
