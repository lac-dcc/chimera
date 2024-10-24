module top
#(parameter param83 = ({((((7'h42) ? (8'hae) : (8'hbd)) ? {(8'h9f)} : ((8'hac) ? (8'ha8) : (8'hbd))) ? ((8'ha7) ? ((8'haa) <= (7'h44)) : (!(8'ha5))) : (((8'haf) > (8'ha2)) || ((8'ha1) ? (8'haf) : (8'hab)))), ((8'hb1) ~^ (+((8'hb4) ? (8'hb5) : (7'h41))))} << ((~&((~&(8'h9f)) ? ((7'h42) ? (8'hb5) : (7'h44)) : (^(8'hb1)))) + (^~(-((7'h41) ^~ (7'h41)))))), 
parameter param84 = ((~^(((param83 || param83) ? param83 : (param83 - param83)) ? ((7'h42) ? {param83} : param83) : (-{param83}))) < (param83 <= (-{(&param83)}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire80;
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire82,
                 wire4,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire31,
                 wire61,
                 wire63,
                 wire64,
                 wire65,
                 wire80,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned((((wire3 + $unsigned(wire2)) ?
                     $unsigned((wire3 << wire1)) : {{wire2,
                             wire2}}) * $signed((((8'h9f) ? (8'hb4) : wire0) ?
                     (wire3 ? (8'ha5) : (8'hb9)) : $signed((8'ha0))))));
  always
    @(posedge clk) begin
      reg5 <= wire3[(3'h6):(3'h4)];
      if ($unsigned($unsigned($signed({(wire2 ? wire3 : wire0), (!(8'ha8))}))))
        begin
          reg6 <= (~$unsigned((!$unsigned({wire4}))));
          reg7 <= ($signed($unsigned($signed((wire4 ?
              wire2 : reg6)))) <= (wire4 * {wire1, reg6[(4'hd):(3'h6)]}));
          reg8 <= wire0[(3'h6):(3'h6)];
        end
      else
        begin
          reg6 <= {reg5};
          reg7 <= {$signed($signed((wire4 ? reg6[(3'h7):(3'h4)] : (~^wire2)))),
              ($unsigned(((8'ha0) * {wire3})) | (~|{(~wire1)}))};
          reg8 <= (&$signed(({reg6,
              (wire4 ? wire1 : reg7)} >> reg8[(2'h2):(1'h0)])));
          reg9 <= $unsigned({wire1, reg6});
          if ((((reg6[(3'h6):(2'h2)] || reg6) ^ $signed(reg7[(5'h10):(4'hb)])) ?
              {(wire4 * wire4)} : (8'ha5)))
            begin
              reg10 <= ({(+(~(reg8 || reg6))), $unsigned(wire3)} || wire4);
              reg11 <= $signed($signed(wire4[(4'h9):(3'h5)]));
              reg12 <= (wire2[(3'h4):(2'h2)] >> reg8[(2'h2):(1'h0)]);
              reg13 <= reg12;
              reg14 <= (reg8[(2'h3):(2'h2)] * (reg9 >>> ($unsigned((+reg12)) ?
                  ($unsigned(wire1) + (!reg5)) : reg6[(3'h5):(3'h4)])));
            end
          else
            begin
              reg10 <= (~|reg5[(4'ha):(4'h8)]);
              reg11 <= $signed($signed($unsigned($unsigned((wire1 <= reg8)))));
              reg12 <= $signed($unsigned($signed($signed($signed((8'hab))))));
            end
        end
    end
  assign wire15 = ($signed($unsigned($signed($unsigned((8'ha6))))) > wire2[(4'h9):(4'h8)]);
  assign wire16 = (8'ha8);
  assign wire17 = $unsigned(reg11);
  assign wire18 = $unsigned(($signed($signed({reg7})) || ($unsigned((wire15 ~^ (8'h9e))) ?
                      $unsigned(reg12) : (wire4 > reg7))));
  assign wire19 = $signed($signed($unsigned(({wire17} >>> wire3[(3'h5):(1'h1)]))));
  assign wire20 = (!((&$signed(wire15)) && (((~|reg8) ?
                          (reg12 ? reg6 : (8'ha3)) : (+wire19)) ?
                      (~wire1[(4'he):(4'hc)]) : (wire3 ?
                          reg8 : $signed(reg14)))));
  always
    @(posedge clk) begin
      reg21 <= ($signed({$signed((^wire1))}) ?
          (wire19 > wire1[(3'h5):(1'h1)]) : wire15[(2'h2):(1'h1)]);
      if (({(wire2 | wire18[(3'h6):(3'h4)]), wire18} | (!({(reg13 < reg5),
              $signed(wire3)} ?
          reg12 : $unsigned(((8'hbc) | reg7))))))
        begin
          if (($unsigned($signed(wire1)) ?
              $unsigned($signed(({wire17} ? wire4 : wire18))) : (((+((8'haa) ?
                  wire20 : reg8)) || $signed((wire0 ?
                  wire16 : wire4))) && ({$unsigned((8'ha9))} ?
                  wire2 : $unsigned($signed(wire16))))))
            begin
              reg22 <= (-{($unsigned((reg8 <<< reg21)) ^~ {$signed(wire19)})});
              reg23 <= (~(+$unsigned($unsigned(wire18))));
              reg24 <= wire4;
            end
          else
            begin
              reg22 <= $signed((7'h40));
              reg23 <= $unsigned(($unsigned({(wire17 ?
                      reg14 : reg13)}) * (reg14 ?
                  reg5[(1'h0):(1'h0)] : {$signed(reg6)})));
              reg24 <= reg10;
              reg25 <= (^(~^$signed((|$signed(reg23)))));
            end
          reg26 <= $unsigned((reg12 ^~ $signed(wire4[(3'h6):(2'h3)])));
          reg27 <= (reg24 ? reg14 : wire15[(4'ha):(4'h8)]);
          reg28 <= $unsigned(((^{(reg22 ? wire3 : reg27)}) >= (^{wire3})));
          reg29 <= reg8[(2'h3):(2'h2)];
        end
      else
        begin
          reg22 <= wire3[(4'ha):(3'h6)];
          if (wire18)
            begin
              reg23 <= (((8'hbc) ?
                  ($unsigned((reg7 ? reg14 : wire16)) ^~ $signed((reg23 ?
                      (8'hb0) : wire3))) : $unsigned(reg11[(3'h6):(2'h3)])) & wire19);
              reg24 <= {(~|(reg27[(3'h5):(1'h0)] * ({(8'hbb)} | reg28)))};
              reg25 <= reg5[(4'h8):(4'h8)];
            end
          else
            begin
              reg23 <= $unsigned($signed(reg13[(4'h9):(4'h8)]));
            end
          reg26 <= $unsigned(wire1[(4'he):(2'h3)]);
          if ({wire3, reg7})
            begin
              reg27 <= (!($signed(wire1) >= ((|$signed((8'h9e))) ?
                  ($signed((8'hb0)) > reg11) : reg9)));
              reg28 <= reg9;
            end
          else
            begin
              reg27 <= wire0;
            end
        end
      reg30 <= $signed($unsigned(reg25));
    end
  assign wire31 = (+reg24[(2'h3):(2'h2)]);
  module32 #() modinst62 (wire61, clk, reg21, wire19, wire20, wire15, wire1);
  assign wire63 = {($signed((~&$unsigned(reg7))) ?
                          ($unsigned({wire31}) ^ wire61[(3'h4):(2'h3)]) : reg11),
                      wire16};
  assign wire64 = reg24[(1'h1):(1'h0)];
  assign wire65 = wire31;
  module66 #() modinst81 (.wire69(wire15), .wire70(reg29), .wire67(reg27), .wire68(reg12), .clk(clk), .y(wire80));
  assign wire82 = (($unsigned($unsigned(wire80)) ?
                          $unsigned($unsigned(wire0)) : wire2[(4'ha):(3'h4)]) ?
                      $unsigned(($signed($unsigned(reg26)) ?
                          ({reg13} ?
                              (reg30 ?
                                  reg10 : wire17) : $unsigned(reg9)) : $unsigned((~wire2)))) : (wire65[(2'h2):(2'h2)] ?
                          $unsigned($signed((|wire63))) : reg23[(3'h6):(2'h2)]));
endmodule

module module66
#(parameter param79 = ((((((8'ha9) & (8'ha6)) > {(8'hb4), (8'hbb)}) + {((8'hbf) < (8'ha0)), ((7'h44) ? (8'ha4) : (8'ha3))}) == (~&(((8'ha6) ? (7'h43) : (8'ha9)) ^~ (!(8'haa))))) < ((((8'ha9) == ((8'ha9) ^~ (8'hbc))) ? ((~^(8'ha3)) ^ ((8'ha2) & (8'ha4))) : {((8'ha5) | (8'h9f)), ((8'ha9) + (8'hb4))}) <<< (~^((|(7'h41)) ? ((8'hb5) ? (8'haf) : (8'hbb)) : {(8'h9d), (8'haf)})))))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire70;
  input wire signed [(4'hb):(1'h0)] wire69;
  input wire [(5'h14):(1'h0)] wire68;
  input wire [(4'hb):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg71 <= (wire69[(3'h4):(1'h1)] + (~((8'hb0) & {$unsigned(wire70)})));
      reg72 <= (!$signed({{$unsigned(reg71), $signed(wire68)}}));
      reg73 <= $unsigned(((($unsigned(wire70) ^ (wire69 ? reg72 : reg71)) ?
          reg72[(2'h3):(1'h0)] : $signed(wire69)) == $unsigned((-$signed(reg72)))));
      reg74 <= ({($signed(reg72[(4'h8):(3'h4)]) ?
              (|reg73) : $unsigned($unsigned(wire69))),
          wire68} << reg71);
      reg75 <= $signed({($unsigned(wire70) ^~ {wire67[(4'h9):(2'h2)],
              {wire70}}),
          ((wire67 & {wire67}) <<< $signed($signed(wire68)))});
    end
  assign wire76 = {(~&$unsigned(((wire68 >> reg74) ~^ (~^(8'ha2))))),
                      (reg73 >= reg74)};
  assign wire77 = reg73[(4'hc):(1'h0)];
  assign wire78 = $signed($unsigned($unsigned(wire70[(2'h2):(1'h0)])));
endmodule

module module32
#(parameter param59 = ((~({((8'ha2) || (8'hb1))} ^ (~&{(8'hae)}))) << (8'had)), 
parameter param60 = ((8'h9f) ? ((((param59 ~^ (7'h40)) ? (param59 ? param59 : param59) : (param59 >= param59)) ^~ ((param59 ? param59 : param59) <= (param59 ? param59 : param59))) ? (8'hb7) : (({param59} & (7'h43)) ? ((param59 || param59) + (param59 ? param59 : param59)) : ((7'h40) ? param59 : param59))) : ((^(&(8'hae))) ? {param59, (&param59)} : (~&((param59 ? param59 : param59) * param59)))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire37;
  input wire [(3'h6):(1'h0)] wire36;
  input wire signed [(3'h6):(1'h0)] wire35;
  input wire [(2'h2):(1'h0)] wire34;
  input wire [(3'h4):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  assign y = {wire58,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire38 = ((((((8'hbe) ? wire37 : wire33) ?
                          $unsigned(wire36) : $unsigned(wire33)) ?
                      wire35 : wire33[(2'h2):(1'h1)]) <<< wire36[(3'h4):(3'h4)]) < (wire37 - (({wire36,
                          wire34} ?
                      $signed(wire36) : (~^(8'hbf))) && ($unsigned(wire37) + wire35[(1'h0):(1'h0)]))));
  assign wire39 = (($signed(((^(7'h44)) <<< $unsigned(wire33))) > $signed(wire35)) ?
                      wire36[(1'h0):(1'h0)] : $unsigned((({wire33} ~^ $signed((8'hbd))) != (^$signed((8'hbb))))));
  assign wire40 = (-$signed(wire38));
  assign wire41 = wire34;
  assign wire42 = (-wire38[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg43 <= ($signed(wire40[(1'h0):(1'h0)]) ?
          {$signed(wire38), (wire41 & wire35)} : (^wire33));
      reg44 <= reg43[(2'h2):(1'h0)];
      reg45 <= wire42;
      reg46 <= ($signed($signed($unsigned($signed((8'haf))))) ?
          (-wire37) : ((wire33[(2'h3):(1'h1)] != ((wire34 ? wire34 : wire37) ?
              $signed(wire40) : (!reg45))) <<< (8'hb8)));
    end
  assign wire47 = $unsigned(wire41[(3'h7):(3'h5)]);
  assign wire48 = ($signed(($signed((!wire35)) >= $unsigned(((8'haa) ?
                      reg44 : (8'hb7))))) + $signed(wire47[(1'h0):(1'h0)]));
  assign wire49 = $signed(wire40[(2'h2):(1'h0)]);
  assign wire50 = wire35;
  assign wire51 = (+(^({wire33,
                      (wire38 ? wire33 : wire38)} - $unsigned(wire42))));
  always
    @(posedge clk) begin
      reg52 <= ($signed(wire41) ?
          $signed(wire49) : $unsigned((wire34 ?
              ((wire37 ? (8'hbe) : (8'hae)) ?
                  {(8'hb4), wire47} : wire39[(3'h4):(3'h4)]) : (wire51 ?
                  (wire34 ? wire49 : (8'h9e)) : (7'h42)))));
      reg53 <= $unsigned(((($signed(wire38) ~^ $signed(reg52)) ?
              wire34[(2'h2):(1'h0)] : $unsigned((wire40 || wire50))) ?
          $signed(wire40[(1'h0):(1'h0)]) : $unsigned($signed(reg43))));
      if (wire35)
        begin
          reg54 <= (^~{(wire33[(2'h2):(1'h1)] && $signed(((8'hb8) ?
                  wire47 : (8'hb5)))),
              (~&wire38)});
          reg55 <= {$unsigned((reg52 < $signed((wire38 ? reg45 : reg46))))};
          reg56 <= $signed(wire41);
          reg57 <= (wire39[(1'h1):(1'h0)] ? reg46 : (8'ha0));
        end
      else
        begin
          if (((+$unsigned(reg46[(2'h3):(2'h2)])) >> wire34))
            begin
              reg54 <= (^~reg46[(2'h3):(2'h3)]);
              reg55 <= $unsigned((reg45[(4'h8):(2'h3)] ?
                  $unsigned((wire36[(1'h1):(1'h1)] - wire47[(2'h2):(2'h2)])) : wire48));
              reg56 <= wire36[(2'h2):(2'h2)];
              reg57 <= (8'hb0);
            end
          else
            begin
              reg54 <= (|(8'ha2));
            end
        end
    end
  assign wire58 = (-(({(reg45 <= reg56)} && ($unsigned(wire51) >>> wire34[(1'h1):(1'h0)])) ?
                      {(|wire51)} : reg55[(1'h1):(1'h1)]));
endmodule
