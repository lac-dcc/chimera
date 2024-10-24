module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire193;
  wire [(4'hc):(1'h0)] wire192;
  wire signed [(5'h14):(1'h0)] wire191;
  wire signed [(4'hf):(1'h0)] wire190;
  wire signed [(5'h10):(1'h0)] wire189;
  wire signed [(5'h13):(1'h0)] wire188;
  wire signed [(4'hd):(1'h0)] wire186;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire186,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = (~&wire0[(3'h4):(3'h4)]);
  assign wire5 = (&{$signed((8'h9f)), wire2[(4'h8):(4'h8)]});
  assign wire6 = $signed((wire1 + $signed(wire4)));
  assign wire7 = ($unsigned($signed((~^(~^wire1)))) ?
                     ((({wire1, wire6} ? (8'hbd) : $unsigned(wire0)) ?
                         wire1[(1'h0):(1'h0)] : $unsigned((wire0 ?
                             wire4 : wire2))) > $unsigned(wire2[(4'h9):(1'h1)])) : wire1);
  module8 #() modinst187 (.wire11(wire2), .clk(clk), .wire12(wire4), .y(wire186), .wire10(wire1), .wire9(wire3));
  assign wire188 = $unsigned((|wire5[(1'h0):(1'h0)]));
  assign wire189 = ($signed($unsigned((^(wire3 ?
                       wire186 : wire2)))) | $unsigned((wire4 ?
                       (-wire3) : {wire2})));
  assign wire190 = ((~^$unsigned($signed($unsigned(wire186)))) ?
                       {wire186} : $unsigned($signed($signed($signed(wire2)))));
  assign wire191 = wire2[(1'h0):(1'h0)];
  assign wire192 = $unsigned({(~(^~(wire190 ^~ wire4))),
                       (|(wire6 ? (-wire0) : wire188[(3'h5):(3'h4)]))});
  assign wire193 = wire1;
endmodule

module module8
#(parameter param184 = (((^(((8'hbd) & (8'hba)) ? (+(8'ha3)) : (~|(8'hb3)))) ? (~|(~&(~(7'h42)))) : {{((8'hbe) << (8'hbf)), ((7'h43) ? (8'ha5) : (8'ha6))}}) ? (~^((~^(8'hab)) <<< ({(8'h9d), (8'hbf)} <= ((8'ha5) != (8'hbf))))) : (~(~(((8'hb6) ? (8'ha9) : (8'hbc)) ? (~&(7'h44)) : (~^(8'ha7)))))), 
parameter param185 = (param184 >> param184))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h332):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire182;
  wire signed [(4'ha):(1'h0)] wire181;
  wire [(5'h13):(1'h0)] wire180;
  wire signed [(2'h2):(1'h0)] wire179;
  wire signed [(4'he):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire160;
  reg signed [(3'h7):(1'h0)] reg178 = (1'h0);
  reg [(4'h9):(1'h0)] reg177 = (1'h0);
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg174 = (1'h0);
  reg signed [(4'he):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg172 = (1'h0);
  reg [(4'hb):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(5'h14):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg168 = (1'h0);
  reg [(2'h3):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire75,
                 wire32,
                 wire31,
                 wire30,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire104,
                 wire105,
                 wire160,
                 reg178,
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
                 reg162,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 (1'h0)};
  assign wire13 = wire11;
  assign wire14 = $signed((~&wire10[(3'h7):(3'h6)]));
  assign wire15 = (^~(($unsigned((8'h9f)) ?
                          $signed($unsigned(wire13)) : (~&wire12[(3'h5):(2'h3)])) ?
                      (wire14 ?
                          (~^{(8'ha5)}) : (+$unsigned(wire14))) : (^$signed($unsigned((8'hae))))));
  assign wire16 = wire15;
  assign wire17 = wire13;
  assign wire18 = $unsigned($signed((!$unsigned((~wire9)))));
  assign wire19 = $unsigned(({{(wire16 ?
                              wire16 : wire15)}} | {($unsigned(wire10) >> $unsigned(wire18)),
                      (8'hbb)}));
  always
    @(posedge clk) begin
      reg20 <= wire9;
      if (((wire16[(2'h3):(2'h2)] ?
          $unsigned($unsigned(((8'hbc) - wire17))) : $signed(($unsigned(wire19) ?
              wire13[(2'h3):(1'h1)] : $unsigned(wire16)))) ~^ wire15[(4'h8):(1'h0)]))
        begin
          reg21 <= (~$signed($signed($unsigned((wire17 < wire19)))));
          reg22 <= ($signed($signed($signed($unsigned((7'h40))))) ?
              ($signed((wire13 || $unsigned(wire17))) >= (reg21[(4'hd):(3'h4)] ?
                  (+wire17[(1'h0):(1'h0)]) : ($signed(wire13) + reg20[(3'h5):(3'h5)]))) : wire13);
        end
      else
        begin
          if ($signed(wire12))
            begin
              reg21 <= {$signed(wire19), wire16};
            end
          else
            begin
              reg21 <= (wire11 ?
                  (wire11 - ($signed((+wire15)) ?
                      {$signed(wire15)} : $signed(((8'hb7) ?
                          (8'ha3) : reg20)))) : ($signed((wire15[(4'h8):(3'h4)] && $signed(reg20))) - ($unsigned({(8'hb3)}) ?
                      wire16[(1'h1):(1'h0)] : $signed(reg22[(2'h3):(1'h0)]))));
              reg22 <= $unsigned((wire16[(3'h7):(3'h6)] <= (^~reg22)));
            end
          reg23 <= $signed($signed(($signed((wire9 * (8'hbb))) ?
              (reg22[(4'h8):(2'h2)] | wire12) : $signed((wire12 ?
                  reg22 : reg21)))));
          reg24 <= wire18[(3'h7):(3'h4)];
          reg25 <= $signed(wire14[(4'hc):(3'h5)]);
          reg26 <= wire13;
        end
      reg27 <= (8'hac);
      reg28 <= wire10[(4'ha):(1'h0)];
      reg29 <= ($signed(reg27[(5'h10):(4'hd)]) + wire9[(5'h10):(4'he)]);
    end
  assign wire30 = $unsigned((|((~^wire12[(3'h5):(2'h3)]) <<< (wire12 ?
                      {reg27} : (wire14 ~^ wire15)))));
  assign wire31 = $unsigned((^~$signed(($unsigned(wire9) ~^ (wire17 ?
                      wire18 : reg29)))));
  assign wire32 = (~|$unsigned(reg27));
  module33 #() modinst76 (.wire35(reg25), .wire34(wire30), .wire38(wire11), .wire36(reg24), .wire37(wire17), .clk(clk), .y(wire75));
  always
    @(posedge clk) begin
      if ((($signed(reg26[(3'h4):(1'h1)]) ?
              $signed((-(wire31 <<< reg20))) : wire18[(3'h6):(3'h6)]) ?
          reg27[(2'h3):(2'h3)] : (wire10[(3'h7):(3'h6)] | ((reg24 >> wire16[(4'h9):(3'h6)]) || (+{wire30})))))
        begin
          if ({(reg22[(1'h0):(1'h0)] >= reg22[(4'hc):(4'h8)]),
              (((-(reg26 ^~ wire14)) ?
                      $unsigned((wire14 >= wire14)) : ((^~(8'h9e)) ^~ (reg22 ?
                          wire32 : (8'ha8)))) ?
                  ($unsigned($signed(wire17)) ? wire11 : reg22) : wire32)})
            begin
              reg77 <= (8'ha4);
              reg78 <= reg26;
              reg79 <= $unsigned(($unsigned(wire18) & (reg21 ?
                  reg77 : {(wire17 ? wire16 : (7'h44))})));
            end
          else
            begin
              reg77 <= (~&wire9);
              reg78 <= $unsigned(wire31[(3'h4):(1'h0)]);
              reg79 <= $unsigned(($signed($unsigned((reg28 ?
                  (8'ha0) : wire10))) >= (^~reg25[(2'h2):(1'h1)])));
              reg80 <= $signed((+(reg21 & (~&((8'ha1) >= reg22)))));
              reg81 <= wire18;
            end
          reg82 <= reg28[(4'h8):(3'h7)];
        end
      else
        begin
          if ((-$signed($unsigned(wire15))))
            begin
              reg77 <= $signed(($signed(reg82) ?
                  (~|wire9[(4'he):(3'h7)]) : reg20));
              reg78 <= (reg29[(1'h1):(1'h1)] ?
                  wire15 : (($unsigned((wire31 >> wire14)) >= reg21[(4'hf):(1'h0)]) > (~$unsigned(wire19))));
              reg79 <= (8'h9c);
              reg80 <= (reg81 ?
                  (-wire14) : ((~^wire32[(3'h6):(1'h1)]) ?
                      $unsigned(((wire16 ?
                          wire12 : (8'ha7)) ^ wire18[(3'h7):(2'h3)])) : reg77));
              reg81 <= ($unsigned(wire17) ?
                  (~|{$unsigned(reg79[(2'h3):(1'h0)])}) : $signed($signed(((&wire15) ?
                      {reg81, reg25} : $unsigned(wire12)))));
            end
          else
            begin
              reg77 <= (~&(^~$unsigned($unsigned((wire16 ^ reg27)))));
              reg78 <= ($unsigned(reg79) ?
                  $unsigned($unsigned(reg78)) : ((&(wire32 - ((8'ha3) || wire10))) << $signed($signed(reg78[(2'h2):(1'h1)]))));
              reg79 <= $signed($signed(($unsigned(wire30[(4'hf):(1'h1)]) ?
                  ((8'hbe) ? (~reg25) : (wire32 | reg22)) : (((8'h9d) ?
                          wire10 : reg28) ?
                      (~(8'hb3)) : (8'hb6)))));
              reg80 <= wire11;
              reg81 <= reg79;
            end
          reg82 <= reg23[(1'h1):(1'h0)];
          if (reg21)
            begin
              reg83 <= ($signed(reg24[(4'ha):(2'h2)]) ?
                  $unsigned(reg79) : $unsigned(wire12));
              reg84 <= $unsigned(reg82[(1'h0):(1'h0)]);
              reg85 <= reg27;
              reg86 <= {(reg25 <<< reg78[(1'h0):(1'h0)])};
            end
          else
            begin
              reg83 <= wire10;
              reg84 <= (((wire31[(3'h4):(2'h2)] >>> (!(reg24 + reg23))) > (8'hb1)) >>> ({$signed($signed(reg83)),
                  reg23[(4'ha):(3'h6)]} - reg81[(3'h5):(3'h5)]));
              reg85 <= wire9[(4'ha):(4'h9)];
              reg86 <= {wire18[(1'h0):(1'h0)]};
              reg87 <= {(+reg21)};
            end
        end
      reg88 <= {{$unsigned($signed((8'haa)))}};
      if (($signed(((reg27 != $unsigned(reg78)) ?
          wire31[(3'h5):(1'h0)] : ({reg87, reg81} ?
              reg83[(2'h3):(1'h0)] : {reg85}))) > $unsigned(({(~|wire18)} ?
          $unsigned($signed(wire30)) : wire15[(3'h5):(3'h5)]))))
        begin
          reg89 <= $signed(reg87);
          reg90 <= reg29[(1'h0):(1'h0)];
          if (({(reg21[(2'h2):(1'h0)] ?
                  reg77 : $unsigned({(8'hb7), reg90}))} >>> reg27))
            begin
              reg91 <= ((($signed(reg85[(4'ha):(3'h7)]) < ((~|reg78) ?
                      ((8'haf) ? reg28 : reg77) : $signed(wire19))) ?
                  (wire12 <= {$signed(reg83)}) : reg27[(4'hd):(2'h3)]) ~^ $unsigned($signed({(+(8'ha4)),
                  $unsigned(wire10)})));
              reg92 <= $unsigned($unsigned(wire19));
              reg93 <= (((7'h41) ~^ (^$signed($unsigned((8'ha7))))) - ((~|reg29) ?
                  reg89 : $signed((reg26 ? {reg26} : (~|wire32)))));
            end
          else
            begin
              reg91 <= {(~^reg89)};
              reg92 <= ((wire15 ?
                      (&reg85[(3'h5):(3'h4)]) : ($unsigned((reg84 > reg28)) ?
                          $unsigned(wire9) : ({reg85} == reg23))) ?
                  $signed(((+{wire16}) ?
                      $signed((reg20 ? wire15 : wire17)) : $unsigned(((8'had) ?
                          wire75 : wire10)))) : $signed($signed(reg29[(2'h2):(2'h2)])));
            end
          reg94 <= $unsigned(reg22);
          reg95 <= reg29[(1'h0):(1'h0)];
        end
      else
        begin
          reg89 <= $unsigned(((reg91[(4'ha):(1'h1)] <= $signed(reg20[(3'h6):(3'h4)])) >> $signed(($signed(wire75) - $signed(wire12)))));
          reg90 <= $signed(reg22);
          reg91 <= wire9[(5'h10):(2'h3)];
        end
      reg96 <= (+wire75[(3'h5):(1'h0)]);
      if ($unsigned(({{(~|reg77)}, (reg28[(4'ha):(2'h3)] >= (|(8'had)))} ?
          (^((reg88 ~^ wire14) == (reg93 < wire16))) : (~reg81[(4'ha):(3'h5)]))))
        begin
          reg97 <= $signed($unsigned((~&$signed((reg22 ? reg94 : wire12)))));
          if (($signed(((-(reg25 + reg29)) ?
                  ((!wire30) || reg86) : ((reg94 ? reg26 : wire10) >= reg81))) ?
              {$unsigned(({reg94} ? {wire13, reg79} : (&reg88))),
                  $signed(((+reg94) ?
                      reg81 : (reg23 ?
                          reg77 : wire12)))} : $unsigned($unsigned($signed($signed(wire11))))))
            begin
              reg98 <= {reg79[(3'h4):(1'h1)]};
              reg99 <= {reg98[(3'h5):(1'h1)],
                  $unsigned(($unsigned((reg20 * reg23)) ^~ wire15))};
              reg100 <= wire30[(4'hf):(3'h4)];
              reg101 <= $signed((!(wire15 ?
                  ((~|wire14) ?
                      reg25[(2'h2):(1'h0)] : ((8'ha3) <= reg28)) : $unsigned(wire12))));
              reg102 <= reg90[(4'hc):(4'ha)];
            end
          else
            begin
              reg98 <= (&{(8'hab)});
            end
          reg103 <= wire17;
        end
      else
        begin
          reg97 <= $unsigned($unsigned($unsigned($unsigned($signed(wire11)))));
        end
    end
  assign wire104 = $signed((reg95 != (!wire14)));
  assign wire105 = reg82[(1'h1):(1'h0)];
  module106 #() modinst161 (.y(wire160), .clk(clk), .wire109(reg80), .wire110(reg29), .wire107(reg21), .wire108(wire11));
  always
    @(posedge clk) begin
      reg162 <= ((^wire19) ?
          $signed($signed(($signed(reg26) ?
              wire30 : (reg100 ? wire104 : reg22)))) : (~(^wire18)));
      reg163 <= {$signed($signed((~|$unsigned(reg84)))), wire31};
    end
  always
    @(posedge clk) begin
      reg164 <= (^~(reg84[(3'h7):(2'h2)] ?
          reg23 : ((8'hbf) ?
              ($signed(wire10) ?
                  $signed(wire16) : (reg86 < reg80)) : (~^(wire11 < wire15)))));
      if (($unsigned(reg97) ?
          $signed($unsigned(($unsigned(wire12) ?
              {(8'hb5)} : {(7'h44)}))) : (($unsigned((reg85 ?
                  (8'hb9) : wire30)) ~^ reg164) ?
              $signed({reg91[(3'h4):(1'h1)]}) : reg95)))
        begin
          if ((wire16[(3'h5):(3'h5)] == reg23))
            begin
              reg165 <= (wire32 >= wire104[(2'h2):(2'h2)]);
            end
          else
            begin
              reg165 <= reg95[(1'h1):(1'h1)];
            end
          reg166 <= ((&(reg20 <<< ({reg78, wire75} ?
                  (~reg29) : wire15[(3'h6):(3'h6)]))) ?
              ($signed((~&$signed(reg164))) <<< reg94[(5'h12):(4'h9)]) : (&$unsigned({reg79[(2'h2):(1'h0)]})));
          reg167 <= $unsigned($signed(($signed($signed(reg22)) != reg85[(2'h3):(1'h0)])));
        end
      else
        begin
          reg165 <= (-($signed((^(^~reg103))) ?
              $unsigned($unsigned({reg162})) : reg23));
          reg166 <= reg94;
        end
      reg168 <= (~|reg25[(1'h1):(1'h1)]);
      if ((wire30[(4'he):(2'h2)] >> $unsigned($signed($signed(reg28)))))
        begin
          if (((!(wire17[(1'h0):(1'h0)] & $unsigned($signed(wire105)))) ?
              $signed($signed(reg103)) : (reg86[(4'hd):(2'h2)] ?
                  {(&$signed(reg22))} : $signed(wire75[(4'hb):(1'h0)]))))
            begin
              reg169 <= $unsigned(((~^reg92[(5'h15):(5'h14)]) ?
                  $signed(reg29[(3'h5):(3'h5)]) : wire104));
              reg170 <= ($unsigned((($unsigned(reg29) << (reg29 > reg29)) ?
                      reg83 : (reg80[(4'hf):(4'h8)] ?
                          (8'hb0) : {wire75, reg96}))) ?
                  $unsigned((((reg82 ? reg80 : wire11) & wire104) ?
                      $unsigned(reg168) : $signed({reg95,
                          (8'ha7)}))) : ($unsigned(wire75) ?
                      $unsigned(wire30) : (~|(^~$unsigned((8'hb1))))));
              reg171 <= (-reg25);
              reg172 <= (reg90 | reg165);
            end
          else
            begin
              reg169 <= reg27;
              reg170 <= {($signed(((reg81 ? wire17 : wire105) ?
                          (reg24 <= wire105) : reg172)) ?
                      ((~^$signed((8'hb9))) ^ $unsigned((^reg166))) : $unsigned($signed((reg94 << reg20)))),
                  (&$unsigned((~(reg99 <<< reg78))))};
              reg171 <= reg96[(1'h0):(1'h0)];
            end
          if (reg93[(4'h9):(2'h2)])
            begin
              reg173 <= (8'h9d);
              reg174 <= ((+$unsigned((wire9 ?
                  reg170 : (wire13 < reg164)))) <= (wire160[(4'he):(1'h1)] != reg84));
              reg175 <= (wire12[(4'hc):(4'h9)] ?
                  reg103[(2'h2):(2'h2)] : $unsigned((((|reg174) ?
                      $signed(reg85) : $unsigned(reg25)) <<< $unsigned(reg82))));
              reg176 <= ($unsigned(reg22) ?
                  $unsigned(reg163[(4'h9):(4'h9)]) : reg86[(3'h6):(3'h5)]);
              reg177 <= reg171[(4'h9):(2'h2)];
            end
          else
            begin
              reg173 <= reg91[(2'h2):(1'h1)];
              reg174 <= ($signed((-(^~reg97[(3'h7):(3'h4)]))) ?
                  reg20[(3'h5):(1'h1)] : reg176);
              reg175 <= $signed(($unsigned((reg169 ^~ (reg88 != reg169))) ?
                  $unsigned((reg86 ? reg170 : reg163)) : (((7'h40) ?
                          $signed((8'ha0)) : $unsigned(wire19)) ?
                      $unsigned(reg28) : reg166[(1'h1):(1'h1)])));
              reg176 <= reg175[(2'h3):(2'h2)];
            end
        end
      else
        begin
          if ($signed($unsigned((^$unsigned(reg28[(3'h5):(2'h3)])))))
            begin
              reg169 <= reg168[(4'h9):(3'h7)];
              reg170 <= (&(($unsigned((~reg81)) ?
                      $signed($signed(wire160)) : (-$signed(reg94))) ?
                  reg101[(3'h7):(1'h1)] : (reg80 ?
                      ((reg83 ?
                          reg23 : reg170) + $signed(reg92)) : ($unsigned(wire9) && (wire105 ?
                          reg92 : reg26)))));
            end
          else
            begin
              reg169 <= reg21[(3'h6):(3'h5)];
              reg170 <= reg78;
              reg171 <= {(wire16[(4'ha):(3'h4)] ?
                      ($unsigned($signed(reg90)) >= ($unsigned(wire9) & (8'ha9))) : (((reg166 ?
                              reg81 : (8'hb2)) ?
                          ((8'hab) >= reg168) : $unsigned(reg94)) ~^ wire104)),
                  (((&((8'hb4) || wire9)) ?
                          reg92[(5'h12):(3'h6)] : (~&$signed(wire13))) ?
                      {($signed(reg95) || {wire30})} : (+(+(reg170 ?
                          wire19 : reg87))))};
              reg172 <= (~|(reg91[(4'h9):(1'h1)] ?
                  ({(reg103 ? reg172 : reg174),
                      $signed(wire17)} >>> (-reg21[(4'he):(4'hb)])) : reg100[(4'he):(4'hb)]));
              reg173 <= ({((reg169 ?
                          {reg89,
                              (8'ha7)} : $unsigned(wire160)) * wire17[(1'h1):(1'h1)])} ?
                  ($signed($unsigned((wire13 >> reg79))) | $signed((8'hb8))) : ($unsigned((wire9 ?
                      (reg77 << reg23) : $signed(reg98))) < reg98[(2'h2):(2'h2)]));
            end
          reg174 <= $unsigned($signed(reg91));
          reg175 <= $signed(wire32[(3'h4):(1'h0)]);
          reg176 <= $unsigned(((~|$unsigned($signed(reg82))) ?
              $unsigned($signed((reg88 ? reg28 : wire30))) : ({((8'hbc) ?
                          reg103 : reg81),
                      (-wire19)} ?
                  (reg162 ?
                      reg92 : $signed(reg25)) : ((~&reg92) || $signed(wire105)))));
        end
      reg178 <= {((8'hab) ? (&wire160) : (+$signed((~reg168)))),
          ($unsigned((8'hbf)) & reg103[(2'h2):(1'h1)])};
    end
  assign wire179 = $signed(((($signed(reg97) ?
                               reg91[(3'h5):(2'h2)] : (reg178 ?
                                   reg174 : reg90)) ?
                           $unsigned((reg84 << reg20)) : (~&wire75)) ?
                       ($signed(wire104) ?
                           (&$signed((8'haf))) : {(reg175 ~^ reg77)}) : (~|$signed({wire13,
                           wire11}))));
  assign wire180 = ((-(((reg88 ? reg85 : reg83) & (~&reg21)) | ((reg83 ?
                           reg168 : wire18) == reg78[(2'h2):(2'h2)]))) ?
                       (reg165[(1'h1):(1'h0)] * $unsigned((((8'hbf) ?
                           (8'hbf) : (8'ha3)) <= (reg168 & reg26)))) : (((~&reg101[(2'h2):(1'h1)]) ?
                           ((^reg88) == reg86) : {(reg166 ? reg165 : wire15),
                               $signed(reg175)}) & ($signed(reg28) ?
                           $unsigned((wire10 ? reg163 : reg178)) : reg95)));
  assign wire181 = (!reg85[(3'h4):(1'h1)]);
  assign wire182 = wire75[(3'h7):(3'h6)];
  assign wire183 = (^~reg88);
endmodule

module module106
#(parameter param159 = {(((!((8'ha0) ? (8'hac) : (8'hb9))) ? (((8'hb8) ? (8'hb6) : (8'hb0)) ? ((8'ha4) ? (8'hba) : (8'ha0)) : {(7'h41)}) : (((7'h43) || (8'haf)) ^~ ((7'h40) ? (8'ha9) : (8'ha0)))) ~^ (8'ha7))})
(y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'h236):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire110;
  input wire [(5'h12):(1'h0)] wire109;
  input wire [(4'hd):(1'h0)] wire108;
  input wire signed [(4'ha):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire158;
  wire [(5'h12):(1'h0)] wire157;
  wire signed [(5'h14):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire141;
  wire [(2'h3):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire125;
  wire signed [(3'h4):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire120;
  wire [(4'hf):(1'h0)] wire119;
  wire signed [(5'h12):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire112;
  wire signed [(3'h6):(1'h0)] wire111;
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(3'h4):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg [(5'h12):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(4'ha):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(3'h5):(1'h0)] reg117 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire142,
                 wire141,
                 wire140,
                 wire125,
                 wire124,
                 wire121,
                 wire120,
                 wire119,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg123,
                 reg122,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire111 = ({wire109[(2'h2):(2'h2)]} ?
                       wire109 : wire109[(3'h6):(3'h6)]);
  assign wire112 = ($signed(($signed(wire108) ?
                           (wire108[(2'h3):(2'h2)] == (8'haa)) : ((wire108 <<< wire110) && (|(7'h40))))) ?
                       ((((wire110 & (7'h40)) ?
                           wire110[(3'h5):(1'h0)] : wire108[(4'hd):(2'h3)]) || (~(wire108 ?
                           wire107 : wire108))) < (~^wire111[(1'h0):(1'h0)])) : (~|wire110));
  assign wire113 = ($signed((($unsigned(wire107) ?
                           $unsigned(wire110) : $unsigned(wire112)) ?
                       wire108 : $signed((|wire107)))) >>> (~|{(|$signed(wire108)),
                       wire112[(3'h5):(1'h1)]}));
  assign wire114 = (-$signed((8'hb3)));
  assign wire115 = wire107;
  assign wire116 = ($signed(({((8'hbd) >= wire113)} ^ ($signed(wire113) ?
                       (wire110 <<< wire113) : (wire115 ^ wire108)))) >> (~&$signed($signed((wire113 << wire107)))));
  always
    @(posedge clk) begin
      reg117 <= $unsigned(wire113);
      reg118 <= wire107[(1'h0):(1'h0)];
    end
  assign wire119 = $signed({$signed(wire115[(3'h6):(1'h0)]), wire110});
  assign wire120 = (reg117 != (wire119[(4'h9):(2'h2)] ^~ wire119[(4'he):(3'h6)]));
  assign wire121 = wire116[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg122 <= (8'hb6);
      reg123 <= ((8'hba) ~^ {{(+(wire112 << reg117)), {(-(8'hbe))}},
          ($unsigned((&wire115)) ?
              ($signed(wire113) << $signed(wire109)) : $unsigned((8'ha0)))});
    end
  assign wire124 = (^($signed(((+wire114) ?
                           (^~wire116) : wire114[(4'h8):(4'h8)])) ?
                       $signed(wire113[(2'h2):(1'h1)]) : (($signed((8'ha4)) ?
                           {wire111} : wire116[(3'h5):(3'h5)]) >> (~|$signed(reg122)))));
  assign wire125 = ((wire109 ?
                           (+reg118) : $signed(((wire114 ?
                               wire107 : wire116) || wire108))) ?
                       $signed($signed(($signed(wire119) ?
                           wire111 : $signed(wire111)))) : $unsigned(($signed({(8'ha5),
                               (7'h41)}) ?
                           {(reg123 != wire119)} : ($unsigned(wire108) | wire108))));
  always
    @(posedge clk) begin
      reg126 <= (wire108[(3'h4):(3'h4)] ?
          ((^~(~&$signed(wire110))) ?
              ({{(8'hb8),
                      wire119}} & wire111[(1'h1):(1'h1)]) : (8'h9e)) : {wire120[(4'h9):(2'h2)],
              wire109[(4'hb):(3'h7)]});
      reg127 <= $signed(((|(~{wire110,
          (8'hb8)})) <<< (^~(wire112[(2'h3):(1'h1)] ?
          $unsigned(wire121) : {wire108}))));
    end
  always
    @(posedge clk) begin
      reg128 <= $signed({$signed({$signed(wire125), $signed(wire110)}),
          reg118[(4'hf):(3'h4)]});
      if ($signed(wire113))
        begin
          reg129 <= (wire108[(4'h9):(1'h0)] ?
              $signed($unsigned({wire114[(3'h6):(3'h4)],
                  (wire119 != reg123)})) : $signed(wire110[(1'h0):(1'h0)]));
        end
      else
        begin
          reg129 <= ($signed(wire109) ?
              $signed((~^$unsigned((~wire119)))) : (8'h9e));
          if ($unsigned((reg117 ? reg128 : (|$signed($signed(wire114))))))
            begin
              reg130 <= reg128[(3'h6):(2'h2)];
            end
          else
            begin
              reg130 <= (+(^~(&wire116[(4'hc):(4'hc)])));
              reg131 <= $unsigned($unsigned(reg117[(2'h3):(1'h0)]));
              reg132 <= $unsigned((&reg126));
              reg133 <= (~wire121[(3'h6):(1'h1)]);
              reg134 <= $unsigned(wire124);
            end
          reg135 <= wire115;
          reg136 <= $signed(($unsigned({((8'ha6) >= wire113)}) ?
              wire107 : (wire108 >= {wire115[(4'ha):(4'ha)]})));
          reg137 <= reg131[(1'h0):(1'h0)];
        end
      reg138 <= (^~{wire119});
      reg139 <= ($signed(((|reg123[(3'h4):(3'h4)]) >= $signed($unsigned(wire125)))) ?
          $unsigned(($unsigned(reg131[(4'h9):(1'h0)]) >> $unsigned((8'hbc)))) : $unsigned(wire111));
    end
  assign wire140 = (+($signed(((wire114 ~^ reg130) == (wire116 ?
                       wire125 : reg136))) * ({(wire111 >> reg117),
                       {wire110, reg134}} >= ($signed(reg129) ?
                       $signed(reg136) : (reg126 >= wire119)))));
  assign wire141 = {reg127[(3'h4):(1'h1)]};
  assign wire142 = (8'hbf);
  always
    @(posedge clk) begin
      reg143 <= $signed($signed((wire110 ?
          (^$signed(wire107)) : (~((8'ha0) | reg138)))));
      reg144 <= $unsigned($unsigned((wire109 ^ ($signed(reg136) >>> wire114[(4'h8):(3'h7)]))));
      reg145 <= wire109[(4'hc):(3'h6)];
    end
  always
    @(posedge clk) begin
      reg146 <= $signed($unsigned($signed($unsigned((reg144 == reg138)))));
      reg147 <= reg132;
      reg148 <= (8'h9e);
      if (((reg132[(4'hd):(4'h9)] ?
          (8'hb4) : (~reg138[(1'h0):(1'h0)])) >= $unsigned(((8'ha5) ?
          (-(|reg132)) : ($unsigned(reg129) ? wire124 : ((7'h44) + reg146))))))
        begin
          if ($unsigned({wire115[(4'h9):(1'h0)]}))
            begin
              reg149 <= (wire124[(1'h0):(1'h0)] < wire109);
            end
          else
            begin
              reg149 <= wire112;
              reg150 <= $signed(wire113[(1'h0):(1'h0)]);
              reg151 <= (reg126 ? ((-wire109) ? reg117 : (-(8'hb5))) : reg122);
            end
        end
      else
        begin
          reg149 <= $signed(wire125);
          reg150 <= wire125[(3'h6):(1'h1)];
          reg151 <= $unsigned((&($unsigned(reg147) + (8'hbf))));
          reg152 <= (^wire140[(2'h3):(1'h0)]);
          if ((+$unsigned($signed(reg122[(4'hc):(3'h7)]))))
            begin
              reg153 <= reg137;
              reg154 <= ((($signed((~&reg147)) >> reg129[(2'h2):(2'h2)]) <<< $unsigned(wire115[(3'h5):(3'h4)])) ?
                  ($unsigned({(reg127 ^~ wire115), reg123}) >= ((+{wire119}) ?
                      wire108[(4'hc):(4'h8)] : {(reg150 ? wire125 : wire124),
                          (reg132 ?
                              wire124 : (8'hb8))})) : ((~^(reg129[(3'h4):(2'h3)] >> ((8'ha9) <= reg132))) >> ({((8'ha1) >>> wire142),
                      $unsigned(reg126)} != (!{reg123, wire141}))));
              reg155 <= $signed((!$signed(reg148[(3'h5):(3'h5)])));
            end
          else
            begin
              reg153 <= ((reg133 ?
                      reg146 : ($signed((~&reg130)) | ((|reg132) >> {wire120}))) ?
                  wire120[(2'h3):(1'h1)] : {reg151});
              reg154 <= $signed($signed({(~^$unsigned((8'hb4))),
                  wire115[(4'he):(4'he)]}));
            end
        end
    end
  assign wire156 = (|(reg123[(1'h1):(1'h0)] > (reg128 == $signed((+reg117)))));
  assign wire157 = (~^wire107[(2'h3):(2'h2)]);
  assign wire158 = reg129;
endmodule

module module33  (y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire38;
  input wire [(2'h2):(1'h0)] wire37;
  input wire signed [(3'h5):(1'h0)] wire36;
  input wire [(4'h8):(1'h0)] wire35;
  input wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire67,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 (1'h0)};
  assign wire39 = wire34;
  assign wire40 = ($unsigned(({wire38[(3'h6):(3'h6)], wire34} ?
                      $signed({wire37,
                          wire34}) : wire38)) >> wire35[(3'h4):(1'h1)]);
  assign wire41 = $unsigned($unsigned((($unsigned(wire35) ? wire37 : wire36) ?
                      $signed((!wire35)) : {wire34[(2'h2):(1'h1)],
                          (wire35 | wire37)})));
  assign wire42 = ((wire40 ?
                      wire37 : $signed((+(^wire36)))) ^ $signed($signed((wire39[(4'ha):(3'h7)] | (+wire34)))));
  always
    @(posedge clk) begin
      reg43 <= $signed({($signed((wire34 < wire39)) ?
              wire40 : $unsigned($signed((8'had))))});
      reg44 <= ($signed(($signed($signed(wire36)) ?
          ((wire36 && reg43) - (wire39 ?
              wire37 : wire39)) : wire42[(1'h0):(1'h0)])) + {wire39,
          (~|{$signed(wire36), {wire38, wire40}})});
      reg45 <= $signed($signed(reg44[(1'h0):(1'h0)]));
      reg46 <= (8'hb0);
      if ((!{reg46[(4'h9):(4'h9)]}))
        begin
          reg47 <= {$unsigned((+(wire35[(3'h5):(1'h1)] ?
                  (wire42 ? wire39 : wire42) : reg46))),
              wire35[(3'h6):(1'h1)]};
        end
      else
        begin
          if ((~wire38[(3'h5):(3'h4)]))
            begin
              reg47 <= wire37[(1'h0):(1'h0)];
              reg48 <= ((^~(~((reg43 ? wire36 : reg43) * ((8'hbe) ?
                      wire35 : reg46)))) ?
                  wire37[(2'h2):(1'h0)] : ((({(8'hbe),
                      reg47} * $signed(reg44)) < ((reg47 ? wire39 : wire41) ?
                      wire37[(1'h0):(1'h0)] : $unsigned(reg43))) ^~ (-wire39[(4'he):(1'h0)])));
              reg49 <= (-({(-(wire42 ? wire34 : reg43)), (+$signed(wire39))} ?
                  $signed(wire35[(3'h5):(2'h3)]) : wire38));
              reg50 <= (8'ha8);
              reg51 <= ($signed(((8'hb1) && $signed($signed(reg50)))) ?
                  (reg48 ?
                      (((|wire38) << (reg43 - reg43)) + $signed(wire38[(1'h0):(1'h0)])) : (~^$unsigned((wire34 == reg45)))) : ((8'h9f) ?
                      wire41 : $unsigned((~^$signed(wire42)))));
            end
          else
            begin
              reg47 <= $signed((reg44 ?
                  wire40[(1'h0):(1'h0)] : reg49[(2'h3):(1'h1)]));
            end
        end
    end
  always
    @(posedge clk) begin
      reg52 <= (&wire37[(2'h2):(2'h2)]);
    end
  assign wire53 = (wire36[(2'h3):(2'h2)] ?
                      $signed(((^~$signed(wire34)) ?
                          (^~(wire34 * reg44)) : $unsigned(reg51[(4'h8):(1'h0)]))) : $signed((reg46[(4'hb):(2'h3)] ?
                          $signed(reg51[(3'h5):(2'h2)]) : (-$unsigned(wire41)))));
  assign wire54 = {reg49, reg44};
  assign wire55 = (-$unsigned(((^~$signed(reg49)) ?
                      reg50[(4'ha):(3'h4)] : ($unsigned(reg45) ?
                          $unsigned(wire35) : reg43))));
  assign wire56 = wire40;
  assign wire57 = {(8'hb0), wire53[(1'h1):(1'h0)]};
  assign wire58 = reg49;
  always
    @(posedge clk) begin
      if (reg51)
        begin
          reg59 <= (|(8'hb6));
          reg60 <= $signed(({$unsigned(wire54),
              {(^~reg49)}} >= reg49[(4'hc):(3'h5)]));
          if ((|(&$unsigned(((wire55 || wire57) ^ (^wire57))))))
            begin
              reg61 <= ($unsigned($signed((!(!reg45)))) ?
                  $signed(((+$unsigned(reg43)) + $signed($unsigned(reg59)))) : ((|($unsigned(wire34) > $signed(reg50))) >> wire35[(3'h5):(2'h2)]));
              reg62 <= reg60;
            end
          else
            begin
              reg61 <= wire35;
              reg62 <= $signed(((!(8'ha3)) ?
                  $signed(((reg50 + (8'hbb)) ?
                      wire36[(1'h1):(1'h0)] : wire54[(1'h0):(1'h0)])) : (~&{$unsigned(wire54)})));
              reg63 <= (|reg49[(4'h9):(3'h4)]);
            end
        end
      else
        begin
          if ($signed((wire34 != ($signed((wire53 > wire34)) * wire34[(1'h0):(1'h0)]))))
            begin
              reg59 <= $unsigned($unsigned(((^$unsigned(wire35)) + wire57)));
              reg60 <= ($signed($signed((8'h9d))) ?
                  (~^($unsigned($signed(wire58)) < reg44)) : (reg43[(4'hb):(3'h7)] + wire36));
            end
          else
            begin
              reg59 <= {{$signed(((wire38 ? reg61 : reg51) <<< reg52))}};
            end
        end
      reg64 <= $unsigned((^(($signed(reg63) ? (-reg44) : wire56) ?
          wire58 : (~&$unsigned(reg59)))));
      reg65 <= (({{$signed(reg47)}} ?
          ((wire56[(2'h2):(2'h2)] ?
                  (wire36 ? reg51 : (8'h9f)) : $unsigned((8'hb6))) ?
              wire40[(3'h7):(3'h4)] : (reg46 >> (~&wire41))) : reg50) >>> ((!wire36) <= reg48[(4'hf):(4'hf)]));
      reg66 <= ((^{$unsigned($unsigned(reg45)), wire38[(2'h2):(1'h0)]}) ?
          (wire37[(2'h2):(1'h1)] ?
              $unsigned(wire35[(3'h7):(1'h1)]) : wire40) : $signed(wire55[(2'h3):(2'h2)]));
    end
  assign wire67 = ($signed(wire36[(2'h2):(1'h0)]) <= wire41[(5'h11):(4'hc)]);
  always
    @(posedge clk) begin
      reg68 <= {reg65[(2'h2):(2'h2)]};
      reg69 <= (reg51[(3'h4):(1'h0)] >> reg60);
      reg70 <= $unsigned(wire57[(4'h8):(3'h7)]);
      reg71 <= (reg64[(3'h4):(2'h3)] ?
          reg62 : (reg44[(1'h1):(1'h1)] <<< reg44[(2'h2):(2'h2)]));
      reg72 <= reg45;
    end
  assign wire73 = ((reg62[(1'h0):(1'h0)] != ({$signed(reg61),
                          (8'hbf)} && $signed({reg70, (8'hb0)}))) ?
                      $signed((8'ha6)) : ($signed($signed(wire37)) <<< {$signed($signed((8'hbc))),
                          ((&reg71) != $signed(reg65))}));
  assign wire74 = (~&(|reg49[(4'h8):(4'h8)]));
endmodule
