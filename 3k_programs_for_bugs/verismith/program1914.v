module top
#(parameter param97 = ((~|(~({(8'hb4), (8'hb2)} >= ((8'h9e) >> (8'hb9))))) ? (!((~^{(8'h9e)}) < (((8'h9c) < (8'ha5)) ? {(8'hbf), (8'hb3)} : ((8'hbe) ? (8'hac) : (8'hbc))))) : (7'h41)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  assign y = {wire83,
                 wire7,
                 wire6,
                 wire5,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire5 = ((wire3 ?
                     (((8'hb1) > {wire0, wire2}) ?
                         ((wire3 ? wire1 : wire4) ?
                             $unsigned(wire4) : wire1) : (8'hb9)) : ({(~wire4)} ?
                         {(wire1 ? wire3 : wire1)} : (wire3 ?
                             (wire2 & wire0) : (wire1 ?
                                 wire0 : wire0)))) <= wire1[(3'h4):(2'h3)]);
  assign wire6 = $signed((&(~^wire4[(2'h2):(1'h1)])));
  assign wire7 = ($unsigned({((wire1 == wire5) || {wire0})}) >>> $signed(($unsigned((wire0 ?
                     wire5 : wire6)) >= $unsigned((wire6 > wire6)))));
  module8 #() modinst84 (.y(wire83), .wire11(wire6), .wire12(wire7), .wire9(wire4), .wire10(wire0), .clk(clk));
  always
    @(posedge clk) begin
      reg85 <= $unsigned(wire7);
      reg86 <= wire6[(4'ha):(4'h9)];
      if (wire4)
        begin
          reg87 <= (~|($signed(wire3[(1'h0):(1'h0)]) ^ (wire0[(3'h6):(3'h6)] ?
              $unsigned(((8'hb0) ?
                  wire1 : wire1)) : ((8'ha7) >= wire2[(4'h8):(2'h3)]))));
        end
      else
        begin
          if ((^~(((reg85 ^~ (wire0 ? wire0 : wire6)) ?
                  $unsigned($signed(reg87)) : $signed((wire3 << wire83))) ?
              ({(!wire4)} > wire6) : {(wire6[(4'ha):(3'h6)] ?
                      {wire1, wire3} : reg87)})))
            begin
              reg87 <= $signed(((|wire3[(1'h1):(1'h0)]) || wire5));
              reg88 <= $unsigned((($unsigned(reg85) ?
                  wire1 : (~&$unsigned((8'ha4)))) | ($unsigned(reg85) ^ (reg85 ?
                  (wire3 >>> (7'h41)) : (wire6 >> wire7)))));
              reg89 <= reg88;
              reg90 <= $unsigned({$unsigned((reg87[(2'h2):(1'h1)] + (reg89 & (8'hb4))))});
              reg91 <= wire7[(4'he):(2'h3)];
            end
          else
            begin
              reg87 <= (|(+$unsigned((^~$signed(reg91)))));
              reg88 <= ($signed(wire0) ?
                  $unsigned(($unsigned(wire4[(4'h8):(3'h6)]) | (^~(~|(8'h9d))))) : $unsigned(((reg87 ?
                          (reg87 & wire2) : {wire3, reg89}) ?
                      ((wire7 ?
                          wire0 : reg85) >>> wire0[(4'hf):(2'h3)]) : $signed(wire3[(1'h0):(1'h0)]))));
              reg89 <= ((8'ha6) * reg85[(3'h7):(3'h5)]);
              reg90 <= reg91;
              reg91 <= reg85;
            end
          if (($unsigned($signed($unsigned(((7'h43) && reg90)))) ?
              (reg90 <= (~wire6[(3'h6):(1'h1)])) : $signed((^(wire3[(2'h2):(1'h1)] ?
                  (wire0 ? wire5 : wire0) : (^reg89))))))
            begin
              reg92 <= (7'h40);
              reg93 <= $signed(wire2);
            end
          else
            begin
              reg92 <= (~&{wire2[(1'h0):(1'h0)],
                  {reg91[(3'h7):(1'h0)], wire3[(1'h1):(1'h0)]}});
              reg93 <= reg92[(4'hf):(4'he)];
              reg94 <= wire6[(3'h5):(2'h3)];
              reg95 <= $unsigned(reg92[(5'h12):(4'ha)]);
              reg96 <= (((reg91 ?
                          $signed($unsigned(reg85)) : $signed((reg94 + (7'h43)))) ?
                      ({(~^(7'h42)), $unsigned(reg95)} ?
                          ((^~reg90) ? {reg89} : (wire7 <= wire7)) : ((+reg87) ?
                              $unsigned(reg88) : (|wire1))) : $unsigned((reg86 ?
                          {reg93} : reg91[(3'h5):(3'h4)]))) ?
                  ($unsigned((wire2 ? reg92 : $signed((8'hb5)))) ?
                      ((|wire83) ?
                          reg85 : (^(|reg88))) : $unsigned(((reg87 <= wire6) | (reg94 ?
                          reg94 : reg89)))) : {$unsigned((8'ha4)),
                      ($signed({wire3,
                          reg87}) - $signed(reg85[(4'hd):(2'h3)]))});
            end
        end
    end
endmodule

module module8
#(parameter param81 = (({(~^(~|(8'hb6)))} ? (((8'hab) * {(8'hb5), (8'ha9)}) ? {(|(8'hae)), ((8'hb1) ~^ (8'hb5))} : (^((8'hba) * (8'h9e)))) : ((((7'h42) >>> (7'h40)) != ((8'ha0) >>> (8'hbe))) ? (~(+(8'hb2))) : (8'hb9))) ? {(|(((8'hb9) ? (8'haa) : (8'ha2)) ? ((7'h44) == (8'hb5)) : (8'ha0))), (^~(((8'ha6) == (8'haf)) ^ ((7'h40) ? (8'ha9) : (7'h43))))} : (((~(7'h40)) ? ({(7'h40), (8'hb1)} ? (8'hb7) : ((8'ha9) ? (8'h9c) : (8'had))) : (8'ha9)) < ({((8'hb3) ? (8'hb7) : (8'hba)), ((8'hba) && (8'hb0))} != ({(8'hbe)} | (&(8'hbc)))))), 
parameter param82 = param81)
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire44,
                 wire42,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
                 (1'h0)};
  assign wire13 = $unsigned(($unsigned(wire11) || (((wire9 && (8'ha0)) ?
                          (wire11 >>> wire10) : (8'ha3)) ?
                      wire10[(2'h3):(1'h1)] : $unsigned((wire10 && wire9)))));
  assign wire14 = wire11[(2'h3):(2'h2)];
  assign wire15 = ((8'hb1) == $unsigned((wire14 ?
                      wire13 : (&wire10[(2'h3):(2'h2)]))));
  assign wire16 = (($signed($unsigned((wire12 - wire9))) ?
                      (((wire11 ^ wire15) && (!wire12)) ?
                          $unsigned((wire11 ^~ wire14)) : $unsigned((8'hb7))) : ((wire14[(4'h8):(1'h1)] * wire9) ?
                          $signed((|wire10)) : $signed(((8'ha2) ?
                              wire15 : wire11)))) ~^ wire11[(3'h6):(3'h5)]);
  assign wire17 = $unsigned(wire10[(2'h3):(2'h2)]);
  module18 #() modinst43 (.wire19(wire16), .wire20(wire14), .wire21(wire17), .clk(clk), .wire22(wire9), .y(wire42));
  assign wire44 = wire10[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg45 <= ($unsigned($signed(((~wire16) != wire9[(3'h5):(1'h0)]))) == wire16[(4'hb):(1'h1)]);
      reg46 <= {(((-(wire14 ? reg45 : (8'had))) ?
                  ($signed(wire42) ?
                      wire44[(4'h9):(3'h5)] : $unsigned(wire14)) : $unsigned((wire16 & wire13))) ?
              wire44 : (reg45[(4'hb):(4'h8)] >> (^$signed(wire9))))};
      if (wire44[(3'h5):(3'h5)])
        begin
          reg47 <= ($signed($unsigned($signed($unsigned(wire12)))) ?
              (8'ha5) : (8'haa));
          reg48 <= wire44[(4'hc):(3'h7)];
          reg49 <= ((reg48 == $signed(wire11)) ?
              $unsigned($unsigned(($signed(wire10) - $unsigned((8'hb1))))) : ($signed(wire13) < {$signed({wire14,
                      wire17}),
                  (^wire11)}));
          reg50 <= $signed(wire12[(3'h7):(3'h4)]);
          reg51 <= reg48[(4'he):(4'ha)];
        end
      else
        begin
          if ((^wire17))
            begin
              reg47 <= $signed(((^$signed((wire9 ? reg49 : wire17))) ?
                  wire16[(4'he):(3'h4)] : wire42));
              reg48 <= ($signed($unsigned(((wire9 ?
                      reg45 : wire16) * wire14))) ?
                  ((($unsigned(wire42) >> (!reg48)) ?
                          ((!(7'h43)) != ((8'ha2) ?
                              wire9 : wire16)) : ((wire16 ? wire16 : wire13) ?
                              $signed(reg45) : wire16)) ?
                      $unsigned({wire15,
                          $unsigned((8'hbf))}) : wire11) : {$unsigned((^reg45))});
              reg49 <= (+$signed($signed($signed((wire10 ? wire12 : wire17)))));
              reg50 <= (|wire9[(1'h0):(1'h0)]);
            end
          else
            begin
              reg47 <= reg51;
              reg48 <= ((reg45[(5'h11):(5'h11)] ?
                      {wire44} : $unsigned($signed($unsigned(wire10)))) ?
                  $signed((($signed(wire16) ? (reg51 + (8'h9f)) : {wire14}) ?
                      (~$signed(reg45)) : wire16[(4'hd):(2'h3)])) : (~reg45[(1'h1):(1'h1)]));
              reg49 <= $unsigned((($signed({wire9, reg51}) >> ((-reg48) ?
                      (wire16 >>> wire16) : $signed(wire13))) ?
                  $signed($unsigned(reg45[(5'h11):(5'h11)])) : reg45[(4'he):(4'hc)]));
            end
          reg51 <= (($signed(((wire11 >= reg48) ? wire12 : (~^wire17))) ?
                  wire9 : (((&(8'h9d)) ? {wire42} : (&reg51)) >= ((wire10 ?
                          wire44 : reg47) ?
                      (wire9 ? reg48 : reg49) : $signed(reg48)))) ?
              (&$unsigned((wire14[(4'hc):(4'ha)] ?
                  (|wire9) : (~^reg50)))) : $signed($unsigned($unsigned((wire10 > wire42)))));
          reg52 <= wire11[(3'h5):(3'h5)];
          if (wire14[(3'h6):(2'h3)])
            begin
              reg53 <= $signed(((~^wire12[(4'h9):(2'h3)]) ?
                  $signed($signed($signed(reg46))) : $unsigned($unsigned((^~wire16)))));
              reg54 <= reg47[(3'h6):(3'h5)];
              reg55 <= $unsigned(reg53);
              reg56 <= {$signed(wire17[(2'h2):(1'h0)])};
              reg57 <= wire13[(2'h3):(1'h0)];
            end
          else
            begin
              reg53 <= (|wire44[(3'h5):(1'h0)]);
              reg54 <= ((~|reg45[(1'h1):(1'h1)]) >> wire44[(3'h6):(1'h1)]);
              reg55 <= (+((wire16[(2'h2):(1'h1)] ?
                  $unsigned((&reg48)) : $unsigned((|wire14))) < reg50));
              reg56 <= ({wire13,
                  (((wire15 >> (7'h43)) ?
                      reg49[(2'h3):(2'h3)] : {reg54}) <= (+$unsigned(reg55)))} << $signed(($unsigned((8'hb1)) ?
                  $unsigned((|wire17)) : $unsigned(reg52[(1'h0):(1'h0)]))));
              reg57 <= $unsigned((wire14[(4'h8):(3'h7)] >> wire14));
            end
          reg58 <= wire10[(3'h7):(2'h2)];
        end
    end
  assign wire59 = $unsigned(($unsigned($signed((~reg50))) >= (reg47[(2'h2):(2'h2)] >>> wire13)));
  assign wire60 = wire42;
  assign wire61 = $signed(reg58);
  assign wire62 = (-wire9[(4'h9):(1'h1)]);
  always
    @(posedge clk) begin
      reg63 <= (8'hae);
      reg64 <= {($unsigned(wire14[(3'h7):(3'h5)]) > wire15[(1'h0):(1'h0)])};
      reg65 <= (~$signed(((+(wire60 ? reg56 : (8'hbc))) < {wire10})));
      reg66 <= $unsigned((~^(-(|wire9))));
      reg67 <= reg46;
    end
  always
    @(posedge clk) begin
      if (wire15)
        begin
          if (reg66[(5'h12):(3'h5)])
            begin
              reg68 <= $signed(({wire12} <= reg49));
              reg69 <= {(^$unsigned(((!reg55) << $signed((8'ha8)))))};
            end
          else
            begin
              reg68 <= (({{(~reg53)}} ? reg58 : (8'h9d)) ?
                  (($unsigned(reg64) ?
                          $signed((8'ha5)) : $signed($signed(wire11))) ?
                      reg47[(4'h8):(2'h3)] : reg47[(3'h6):(1'h0)]) : ($unsigned((~&(wire15 ?
                      (8'ha8) : (8'hbd)))) == (-{(reg66 - wire59),
                      $unsigned(reg46)})));
              reg69 <= ((reg56 ?
                      $signed($unsigned(wire61[(2'h3):(2'h2)])) : $unsigned(($signed(reg45) >>> wire17[(5'h13):(4'hb)]))) ?
                  ((^~(((8'hbc) ? reg45 : reg67) ?
                      $unsigned((8'hb3)) : wire15[(2'h2):(1'h1)])) + reg47[(4'h8):(3'h7)]) : $signed($unsigned(reg56[(3'h4):(2'h3)])));
              reg70 <= reg58[(4'h8):(2'h2)];
            end
        end
      else
        begin
          if ((((^(wire13[(4'h9):(2'h3)] ?
                  reg45 : (wire61 ? (8'had) : reg45))) ?
              ({(reg66 >>> (8'ha6))} ?
                  $signed(reg50) : reg65) : (8'haf)) >> reg46))
            begin
              reg68 <= reg64;
              reg69 <= reg67[(2'h2):(1'h0)];
              reg70 <= (wire12[(4'he):(4'h9)] >= $signed(reg54));
            end
          else
            begin
              reg68 <= reg46[(4'h8):(2'h3)];
              reg69 <= $signed({{($signed(wire12) ? wire16 : $unsigned(wire10)),
                      reg55[(4'h9):(3'h6)]},
                  $signed((8'ha6))});
              reg70 <= ((reg56[(1'h0):(1'h0)] <<< $unsigned(reg65)) ?
                  (!($signed({reg70}) ?
                      $signed($signed(reg55)) : (-{reg50}))) : $signed($unsigned(({reg48} ?
                      (reg56 ? wire61 : reg54) : reg47[(3'h5):(1'h0)]))));
              reg71 <= reg48;
              reg72 <= $signed(wire60);
            end
          reg73 <= $signed(((+((wire10 ?
              reg52 : wire61) < (+(8'hb1)))) - $signed((((8'hb7) ?
              wire13 : reg64) < ((8'hab) < reg51)))));
          reg74 <= (^$signed((~|reg52[(1'h1):(1'h1)])));
        end
      if (((-$unsigned({(reg55 ? reg55 : wire17)})) ?
          {{(~|$unsigned((8'hbc)))}} : $unsigned($signed((&reg53[(4'h9):(1'h1)])))))
        begin
          reg75 <= $unsigned(reg58);
          if (reg52)
            begin
              reg76 <= reg50[(4'h8):(1'h0)];
              reg77 <= ($signed(reg58[(3'h4):(1'h0)]) ?
                  reg47 : ($signed(reg52) ^~ ((reg55 ?
                      wire62[(2'h2):(2'h2)] : reg67[(4'hc):(3'h6)]) == wire13)));
              reg78 <= reg48[(5'h13):(4'hb)];
              reg79 <= $signed($signed(($signed((reg67 << reg45)) ?
                  ((^(8'ha4)) ? wire14 : reg58) : reg72[(1'h0):(1'h0)])));
              reg80 <= $signed({(($unsigned(wire59) > (reg49 == reg51)) - (reg78[(3'h4):(1'h0)] ?
                      {wire13} : ((8'ha7) ? (8'ha0) : reg50)))});
            end
          else
            begin
              reg76 <= reg67[(2'h2):(1'h1)];
            end
        end
      else
        begin
          reg75 <= $signed({($unsigned((^reg51)) ?
                  {(wire42 ? reg73 : reg56)} : (^wire11)),
              $signed(((wire15 ? (8'hb7) : reg57) - $signed(reg73)))});
        end
    end
endmodule

module module18
#(parameter param41 = (!(8'hb0)))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire22;
  input wire signed [(3'h6):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire23 = (~&wire21[(3'h5):(2'h3)]);
  assign wire24 = wire22[(2'h3):(1'h1)];
  assign wire25 = $signed(wire20[(3'h5):(2'h3)]);
  assign wire26 = (~&wire23);
  assign wire27 = ($signed(wire19) ^~ wire21);
  assign wire28 = (~^(($signed((wire27 << wire27)) ^ ((&wire24) ?
                      wire22[(3'h4):(3'h4)] : $signed(wire27))) == wire19));
  assign wire29 = ($unsigned(wire24) ?
                      ((wire28[(1'h1):(1'h0)] == ((wire25 ?
                          wire22 : (8'hb1)) > wire27)) ^~ wire28[(3'h4):(2'h3)]) : (+wire26));
  assign wire30 = wire28[(3'h4):(1'h0)];
  assign wire31 = (~^wire29[(4'h8):(2'h2)]);
  assign wire32 = wire27;
  assign wire33 = $signed(wire26[(5'h14):(3'h4)]);
  assign wire34 = (8'h9c);
  assign wire35 = (~^(wire23[(2'h2):(1'h0)] ? (8'ha9) : wire19));
  always
    @(posedge clk) begin
      reg36 <= wire20[(1'h1):(1'h1)];
      reg37 <= (|$unsigned((((8'ha4) >= wire28[(2'h3):(1'h1)]) ?
          ((wire24 ? wire26 : (8'hae)) || (wire35 ?
              reg36 : wire26)) : wire32)));
      reg38 <= wire23;
    end
  assign wire39 = $unsigned($unsigned((((wire31 + wire28) ?
                      $signed(wire35) : reg37[(2'h2):(1'h1)]) > ((-wire33) ?
                      wire33[(1'h0):(1'h0)] : $signed((8'ha3))))));
  assign wire40 = wire22;
endmodule
