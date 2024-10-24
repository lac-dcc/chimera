module top
#(parameter param85 = ((((((8'ha9) ? (8'ha3) : (8'hac)) ? ((8'hb1) ? (8'ha2) : (8'h9f)) : ((8'haa) ? (8'hb4) : (8'ha9))) == ({(8'hb7)} > (8'hb4))) ? {(((8'ha9) <= (8'haf)) ? {(8'hb0)} : (+(8'hbe)))} : ((~|((8'hb6) ? (8'h9d) : (8'hb6))) ? {((8'hb8) ? (8'hae) : (8'h9e))} : (8'hb4))) ^ (((~|(&(8'hab))) * (((7'h41) >> (8'hb1)) ? ((8'hb0) ? (8'ha4) : (7'h42)) : ((7'h40) ? (8'h9d) : (8'hb9)))) | ({((8'had) ? (8'h9d) : (8'hbe)), ((8'hbf) | (8'ha9))} ^ ((|(8'hb5)) >= ((8'hab) ? (8'hae) : (7'h40)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire50;
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire57,
                 wire50,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  module4 #() modinst51 (.wire7(wire2), .wire6(wire1), .wire5(wire3), .wire8(wire0), .y(wire50), .clk(clk));
  always
    @(posedge clk) begin
      if ((|$unsigned(($signed(wire1) ? wire0[(4'ha):(3'h7)] : (&(^~wire50))))))
        begin
          if (wire2[(4'hc):(3'h7)])
            begin
              reg52 <= $signed(((~|wire0[(3'h4):(3'h4)]) ?
                  wire3[(2'h2):(1'h1)] : wire3[(3'h6):(1'h0)]));
              reg53 <= wire2[(3'h6):(3'h4)];
            end
          else
            begin
              reg52 <= (-$unsigned((^~((reg52 ? wire50 : wire50) ?
                  {wire3} : (wire2 ? wire3 : wire50)))));
            end
          reg54 <= $signed(reg53);
          reg55 <= ((+(!(^~(wire0 | wire1)))) ? wire50 : $signed(reg54));
        end
      else
        begin
          if ($signed(wire3[(3'h5):(2'h2)]))
            begin
              reg52 <= ({(-$signed((|wire1)))} == ((~&$signed((+wire2))) | wire2[(4'h9):(4'h8)]));
              reg53 <= (+($unsigned((+(reg54 ? wire1 : wire2))) ?
                  $unsigned((~&(~|wire2))) : ({(reg54 <= reg55),
                      wire50} > (-{wire3, wire3}))));
            end
          else
            begin
              reg52 <= (^(reg54[(2'h3):(1'h1)] ?
                  $signed(reg55) : wire3[(3'h4):(2'h2)]));
              reg53 <= $signed(($unsigned(reg53) ?
                  $signed($signed(wire0[(5'h11):(2'h2)])) : (reg53 + ($signed((8'h9d)) > ((8'hae) == reg53)))));
              reg54 <= (reg53 ?
                  $unsigned(reg55) : {reg52,
                      ($signed(((8'hae) ? reg55 : reg54)) ?
                          ($unsigned(reg54) == $signed(reg54)) : wire2)});
              reg55 <= (+$unsigned(wire3[(2'h3):(2'h3)]));
            end
        end
      reg56 <= reg54;
    end
  assign wire57 = reg55;
  always
    @(posedge clk) begin
      if ($signed((+(($signed(wire3) || wire2) ?
          ((8'ha6) ?
              ((8'hb5) ? reg52 : wire1) : (wire2 == wire2)) : $signed({reg53,
              wire3})))))
        begin
          reg58 <= (~^$unsigned((reg54 || $signed((reg53 >>> wire2)))));
        end
      else
        begin
          reg58 <= (wire2 << ($signed({wire2}) ?
              wire1[(1'h0):(1'h0)] : {$unsigned((reg52 ? reg58 : wire1)),
                  ($signed(reg53) != (8'hbe))}));
          reg59 <= (((((8'ha7) ? (reg55 & wire50) : {wire1, (8'hae)}) ?
                  (&(wire0 + (8'hbd))) : {(8'ha3),
                      reg54}) ^ ({$unsigned(wire2)} ?
                  (reg54[(4'h8):(4'h8)] ?
                      $signed(wire3) : $signed(wire2)) : (|((8'h9d) ?
                      (8'hb1) : (8'ha1))))) ?
              ((^~{{reg55, reg54}, reg55[(5'h11):(4'ha)]}) + reg53) : wire3);
          reg60 <= ($signed(reg58) ? wire0 : {(8'hb5)});
        end
      reg61 <= $signed($signed(((~^(!(8'ha3))) ?
          {(^(8'hb9)), $signed((8'hb5))} : $unsigned(((8'ha3) ?
              reg52 : wire57)))));
      reg62 <= (8'h9f);
      if (reg56)
        begin
          if ($unsigned((reg53[(2'h3):(1'h0)] < $unsigned(((8'h9c) ?
              wire0 : wire3)))))
            begin
              reg63 <= $signed($unsigned({($signed(reg61) ?
                      (wire2 ? reg61 : wire50) : $signed(reg53))}));
              reg64 <= ({reg60} ? (-$signed(reg52)) : reg61);
              reg65 <= ($signed(((|$unsigned((8'haf))) == $unsigned((reg61 << wire0)))) && ($signed($signed(wire0[(5'h11):(4'hd)])) ?
                  $signed($unsigned((-wire0))) : $signed(((~^wire2) | ((8'ha6) & (8'hb3))))));
            end
          else
            begin
              reg63 <= wire3;
            end
          if ($unsigned(reg59))
            begin
              reg66 <= ((~^(reg52[(1'h0):(1'h0)] ?
                      {$signed(reg61)} : ($signed(reg55) ?
                          (^~reg62) : $unsigned(reg63)))) ?
                  (($unsigned($signed((8'hb7))) <= $unsigned($unsigned(reg60))) ?
                      (((reg55 && reg65) << (~&reg55)) ?
                          (reg64 > $signed(wire3)) : $signed(wire57[(3'h7):(2'h3)])) : (^(~|$unsigned(wire0)))) : (!(8'hac)));
              reg67 <= $signed((7'h41));
              reg68 <= (&reg63[(2'h2):(1'h1)]);
              reg69 <= $signed(({({(8'hbb)} <= (&wire57))} && $signed({(reg60 << reg65)})));
              reg70 <= (^~$unsigned($unsigned(reg65)));
            end
          else
            begin
              reg66 <= {($unsigned(((reg66 ? reg65 : reg70) ?
                          (reg54 >> reg64) : $unsigned((8'h9c)))) ?
                      (~|({reg70} ^~ (~reg56))) : $unsigned({reg62[(1'h0):(1'h0)],
                          reg53[(3'h5):(3'h5)]}))};
              reg67 <= $unsigned((^{(&$unsigned(wire0))}));
              reg68 <= (^~reg70[(4'ha):(4'h8)]);
              reg69 <= (~&reg56[(3'h5):(3'h5)]);
            end
          reg71 <= (reg60[(3'h7):(3'h5)] != {(^~((8'hba) ?
                  reg55[(4'hc):(3'h7)] : (wire57 ? reg53 : reg65))),
              ((-(reg66 & reg62)) >= reg64)});
          reg72 <= $signed((reg66 ?
              $signed(reg62) : $unsigned(($signed(wire2) & (reg52 ?
                  reg63 : wire2)))));
        end
      else
        begin
          reg63 <= {$unsigned(($signed($signed((7'h42))) == ((reg66 >> reg70) >> $unsigned(reg59)))),
              {reg61[(1'h0):(1'h0)]}};
        end
      if (reg67)
        begin
          if ((reg68[(3'h4):(3'h4)] + reg64))
            begin
              reg73 <= reg64[(2'h2):(1'h0)];
              reg74 <= reg54[(3'h4):(1'h0)];
              reg75 <= $unsigned(reg53);
              reg76 <= reg73;
            end
          else
            begin
              reg73 <= (^~(&{{{reg75}}}));
              reg74 <= wire3;
              reg75 <= reg69;
            end
          if ((($unsigned({(reg53 ? (8'hac) : reg66), reg53[(3'h4):(1'h1)]}) ?
                  (-reg60) : reg66[(2'h2):(2'h2)]) ?
              (+$signed((^$unsigned(reg74)))) : ({{{(8'hb4)}}} && {$unsigned($unsigned(reg65))})))
            begin
              reg77 <= ($unsigned(wire57) - reg54[(4'h9):(3'h6)]);
              reg78 <= (~&(reg74 <<< $signed(reg72[(1'h1):(1'h1)])));
            end
          else
            begin
              reg77 <= $unsigned(reg58);
              reg78 <= reg77[(3'h6):(3'h5)];
              reg79 <= ($unsigned((reg69 || ((wire57 ? (8'ha4) : (8'h9f)) ?
                  (reg55 ^ reg65) : (reg55 ?
                      wire57 : reg72)))) >= $unsigned(reg69[(4'h8):(1'h1)]));
              reg80 <= (wire1[(1'h1):(1'h1)] && $unsigned((~&$signed((reg61 ?
                  reg67 : reg76)))));
            end
        end
      else
        begin
          reg73 <= ((^wire1) ?
              ((wire57[(1'h1):(1'h1)] ?
                  ($unsigned(reg54) <= (^reg56)) : $signed(reg70)) || (8'hb3)) : ((+$signed((wire3 + reg70))) ?
                  ($signed($signed((8'hbc))) ?
                      reg67 : {(reg60 ? reg73 : reg60), (|reg64)}) : {{(8'hb5)},
                      (~^(!(7'h43)))}));
          reg74 <= (8'hb3);
        end
    end
  assign wire81 = $signed($unsigned((-(reg60[(1'h0):(1'h0)] << (wire50 ?
                      reg74 : reg56)))));
  assign wire82 = $unsigned($unsigned($signed($signed(wire1))));
  assign wire83 = $signed((~($signed((-wire50)) ^~ wire2[(1'h0):(1'h0)])));
  assign wire84 = (|$unsigned({{((8'hb6) ~^ (8'had)), (reg79 >>> wire50)},
                      (^~reg73[(1'h0):(1'h0)])}));
endmodule

module module4
#(parameter param48 = ({((((8'hb3) >>> (8'hab)) - ((7'h44) ~^ (8'h9d))) - (((8'ha7) ? (8'haa) : (8'haa)) && (^(8'hbe)))), (((|(8'h9e)) ? ((8'hbf) * (8'hab)) : ((8'ha8) ? (8'hba) : (8'h9c))) ? (~&(!(8'ha8))) : (((8'h9f) || (7'h40)) > ((8'hb5) ? (8'had) : (8'hb8))))} && ((!(((8'hb3) ? (8'hbb) : (8'ha2)) << ((8'hb4) ? (8'hbe) : (7'h44)))) ? ((-(^~(8'hb1))) * (^((8'hbb) << (8'h9f)))) : {(~|(-(8'hb1)))})), 
parameter param49 = ((param48 ? (~|(+(8'hbf))) : (8'ha9)) ? ((param48 ? {(param48 ? param48 : param48), (param48 - param48)} : ((param48 <<< param48) ? param48 : {param48, param48})) < ((~|(param48 ? param48 : param48)) ? param48 : ((param48 << param48) ? (param48 == param48) : (param48 ? param48 : param48)))) : ({param48, (|(8'hbb))} ? (param48 ? ({param48} ? (param48 ? (8'hac) : (8'h9f)) : (&param48)) : param48) : (param48 & (param48 == param48)))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 (1'h0)};
  assign wire9 = {(+(wire7[(4'ha):(2'h3)] ?
                         ((wire5 < wire5) * wire7[(2'h3):(1'h0)]) : wire7))};
  assign wire10 = wire5;
  assign wire11 = wire5;
  assign wire12 = $unsigned({{wire9, ((wire10 >= (8'haf)) - wire10)},
                      {wire10, wire8[(5'h13):(1'h1)]}});
  assign wire13 = wire7[(5'h11):(2'h3)];
  assign wire14 = $unsigned(wire9[(3'h7):(2'h2)]);
  assign wire15 = $unsigned(wire11);
  assign wire16 = (-$signed(wire9[(4'h8):(1'h0)]));
  module17 #() modinst41 (wire40, clk, wire15, wire14, wire10, wire8);
  assign wire42 = ($unsigned($unsigned((&(wire7 ? wire15 : wire8)))) ?
                      $unsigned((wire11 <<< $unsigned((~&wire16)))) : $unsigned(($signed($signed(wire13)) ?
                          (^~wire40) : wire7[(1'h0):(1'h0)])));
  assign wire43 = wire42;
  assign wire44 = $signed(wire10[(1'h1):(1'h1)]);
  assign wire45 = (($unsigned(wire12) >> {(8'hbd)}) < ($unsigned(((wire43 <<< wire10) ?
                      (wire43 & wire42) : $signed((8'hbb)))) - wire5));
  assign wire46 = ((~&(wire12[(4'ha):(4'ha)] << $unsigned($signed(wire13)))) ?
                      wire16 : (wire15[(1'h1):(1'h1)] <<< (^wire9)));
  assign wire47 = $signed($signed(wire15[(5'h13):(5'h13)]));
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire21;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire [(2'h2):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
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
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= {$signed((($signed(wire18) ?
                  (wire19 != wire21) : wire18[(4'h8):(2'h2)]) ?
              wire18 : ($signed((8'hac)) ? (!wire19) : (wire20 < wire19)))),
          ($signed(({(8'ha3)} ? wire18[(3'h6):(3'h6)] : (&wire21))) ?
              (!$signed((8'hb5))) : $unsigned((wire20 | {wire21})))};
    end
  assign wire23 = $unsigned($signed($unsigned(wire21[(5'h12):(5'h12)])));
  assign wire24 = ($signed($signed((~(~wire20)))) ?
                      ($unsigned($unsigned($signed((8'h9e)))) <= reg22) : (^~(^$unsigned((wire18 ~^ wire19)))));
  assign wire25 = $signed($unsigned(((-wire19[(1'h1):(1'h1)]) <= (wire23 && $unsigned(reg22)))));
  assign wire26 = (wire18 ? wire25 : (~wire25));
  assign wire27 = wire20;
  assign wire28 = {(wire26 ?
                          $signed(((wire19 || wire20) * (wire20 >>> wire19))) : ((wire19[(1'h1):(1'h1)] < wire26[(1'h0):(1'h0)]) <= $unsigned((wire26 ?
                              wire19 : wire23))))};
  assign wire29 = ((&((reg22[(2'h2):(1'h0)] && (-wire26)) ~^ ((~wire26) && $unsigned(wire21)))) ?
                      wire19[(2'h2):(1'h1)] : $unsigned($signed($signed($signed(wire19)))));
  assign wire30 = wire27;
  assign wire31 = ((8'hb7) ? wire23 : wire25[(3'h5):(2'h3)]);
  assign wire32 = ((wire27[(3'h5):(3'h4)] * ((|$unsigned(wire28)) | (wire18[(2'h2):(1'h1)] & (!wire29)))) ?
                      ($signed((+wire26[(2'h2):(1'h0)])) ~^ wire19) : (((8'ha4) ?
                              (8'ha8) : ((+wire28) ?
                                  $signed((8'h9d)) : $unsigned(wire20))) ?
                          {{wire27}} : wire21));
  assign wire33 = (wire26[(4'ha):(3'h5)] ?
                      $unsigned(((reg22[(3'h6):(2'h2)] ?
                              wire29 : $signed(wire32)) ?
                          (!$unsigned(reg22)) : $signed((wire30 ?
                              (8'h9c) : wire19)))) : ((~|($signed(wire24) + wire20)) ?
                          (wire25 ?
                              $unsigned(wire23[(1'h1):(1'h0)]) : ($signed(wire25) << (|reg22))) : $signed({$signed(wire18)})));
  assign wire34 = {($unsigned({wire27}) ?
                          {$unsigned($unsigned(wire21))} : $unsigned((|$unsigned(wire23))))};
  assign wire35 = {$signed({(&$signed(wire33)),
                          (wire29[(4'ha):(1'h1)] ?
                              (wire30 ?
                                  wire30 : wire34) : (wire20 != wire29))})};
  assign wire36 = {wire34[(3'h5):(3'h5)]};
  assign wire37 = wire30[(1'h0):(1'h0)];
  assign wire38 = wire30;
  assign wire39 = reg22[(2'h2):(1'h1)];
endmodule
