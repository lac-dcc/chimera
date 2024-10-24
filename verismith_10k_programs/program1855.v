module top
#(parameter param93 = {(((!(^(8'ha0))) ? (((8'haf) ? (8'ha0) : (7'h43)) << ((8'hb1) ^ (8'ha6))) : ((~(8'hb5)) ? ((7'h42) ? (7'h41) : (8'ha0)) : ((8'ha9) < (8'hb9)))) ? ((((8'ha9) ^ (8'hbd)) * {(8'hbd)}) ? (^~(~^(8'hbc))) : (|{(7'h41)})) : {({(8'hae), (8'hb8)} ? ((8'ha6) ? (7'h42) : (8'hb2)) : {(8'ha6), (8'hb1)}), (((8'ha7) << (8'hb6)) ? {(8'ha3)} : ((8'ha7) ? (8'ha6) : (8'ha4)))}), (|{(~|((8'hbe) ? (8'hac) : (7'h42)))})})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire55;
  assign y = {wire92,
                 wire90,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire4,
                 wire55,
                 (1'h0)};
  assign wire4 = ((^~$unsigned(wire0)) ^~ $unsigned($unsigned({(-wire0)})));
  module5 #() modinst56 (wire55, clk, wire4, wire1, wire3, wire2, wire0);
  assign wire57 = wire4[(3'h7):(3'h4)];
  assign wire58 = (+(~|wire55[(4'hb):(3'h6)]));
  assign wire59 = (({({wire58} ? (wire1 < wire4) : $signed(wire0)),
                          wire58[(3'h6):(2'h2)]} ?
                      wire4 : (((+wire2) | {(8'h9e), wire4}) ?
                          $unsigned((wire55 ?
                              wire1 : wire57)) : $signed((8'h9f)))) * (({$signed((8'h9e)),
                              ((8'haf) * wire3)} ?
                          $signed($unsigned((8'had))) : ($unsigned(wire4) ?
                              (wire3 && wire55) : (wire57 ? wire3 : wire0))) ?
                      (((wire57 && wire3) ~^ $signed(wire2)) + wire55) : wire3));
  assign wire60 = wire1;
  assign wire61 = ((^({wire1[(4'hc):(1'h0)]} ?
                      wire60[(3'h6):(2'h2)] : ($signed(wire57) || $unsigned(wire55)))) | wire55);
  module62 #() modinst91 (wire90, clk, wire3, wire59, wire4, wire1);
  assign wire92 = wire1;
endmodule

module module62  (y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire66;
  input wire [(4'hb):(1'h0)] wire65;
  input wire [(4'hd):(1'h0)] wire64;
  input wire [(5'h10):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire67;
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire82,
                 wire67,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
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
                 (1'h0)};
  assign wire67 = $signed({{wire64}, wire63[(5'h10):(4'hb)]});
  always
    @(posedge clk) begin
      reg68 <= wire67;
      reg69 <= (8'hab);
      reg70 <= (wire64 ~^ reg69[(1'h0):(1'h0)]);
      reg71 <= reg68;
      if ((^(!($unsigned((-reg70)) & $unsigned((wire64 ~^ wire64))))))
        begin
          reg72 <= ((+$signed({{wire66}})) - reg68);
          reg73 <= (((^~(8'h9d)) ?
              ((~|(reg68 ? reg68 : reg70)) ^~ ($signed((8'h9c)) ?
                  (wire63 ?
                      wire65 : (8'hb4)) : $unsigned(reg70))) : $signed({$unsigned(wire65),
                  (wire64 * wire65)})) << $unsigned($unsigned((7'h41))));
        end
      else
        begin
          if ((&reg68))
            begin
              reg72 <= (&$signed((~$unsigned($signed((8'hb1))))));
              reg73 <= (~($signed($signed((!wire63))) ? reg73 : reg73));
              reg74 <= ($signed((~^wire64)) ?
                  reg71 : {(+wire65), {{reg70, $unsigned(reg70)}, reg73}});
            end
          else
            begin
              reg72 <= wire64;
              reg73 <= (wire63 * (&$signed($unsigned((reg71 & wire64)))));
              reg74 <= {$signed(reg74)};
            end
          reg75 <= (&wire64);
          if ((~^{reg72,
              ((-reg75) ? wire67[(1'h0):(1'h0)] : {$signed(wire63)})}))
            begin
              reg76 <= (($signed($signed(((8'hbf) ? wire63 : reg72))) ?
                  (wire65[(1'h1):(1'h0)] ?
                      (reg74 ?
                          ((8'h9f) ?
                              reg75 : reg71) : wire66[(5'h13):(4'hc)]) : (((8'ha5) ?
                          reg72 : reg73) >= (wire64 <= reg71))) : reg74[(4'h8):(2'h2)]) << (|(((reg68 ?
                      wire66 : wire65) ?
                  $unsigned(reg70) : {reg70}) >>> ((reg69 ? (7'h42) : reg68) ?
                  (reg75 ? reg70 : reg70) : $signed(reg73)))));
              reg77 <= $signed($signed(reg73));
              reg78 <= ((+{reg76[(2'h3):(1'h1)], $unsigned($signed(reg72))}) ?
                  ($signed(reg76[(4'hb):(3'h4)]) ?
                      $signed(reg76[(4'he):(1'h0)]) : {{(reg76 ?
                                  reg71 : wire63)}}) : ($signed(($unsigned(wire65) == {wire66,
                      reg75})) ~^ (reg74[(3'h6):(3'h5)] ?
                      reg74[(4'hb):(3'h5)] : $signed((7'h41)))));
              reg79 <= reg74;
              reg80 <= {$unsigned(reg75), reg68[(4'h8):(3'h4)]};
            end
          else
            begin
              reg76 <= (wire64[(3'h4):(2'h2)] < $unsigned((((reg74 ?
                          reg73 : (8'haa)) ?
                      (8'hbc) : (wire63 ? reg69 : wire63)) ?
                  {$signed(wire65), (^reg78)} : reg75[(1'h1):(1'h0)])));
              reg77 <= {$signed({reg75[(1'h1):(1'h1)]}), reg80};
              reg78 <= (8'hbb);
            end
          reg81 <= {reg72[(3'h4):(3'h4)]};
        end
    end
  assign wire82 = $unsigned(reg72);
  always
    @(posedge clk) begin
      if (reg72)
        begin
          reg83 <= wire82[(4'he):(2'h3)];
          reg84 <= $signed({$signed((+(reg74 ? reg77 : wire64))),
              reg74[(4'hb):(4'ha)]});
          reg85 <= reg78;
          reg86 <= (wire63[(5'h10):(5'h10)] <= (~|$unsigned(((^reg76) ^~ {reg73}))));
          reg87 <= (|reg79[(4'hd):(3'h6)]);
        end
      else
        begin
          reg83 <= (+$unsigned((~reg80)));
          reg84 <= (((8'hb9) ?
                  $signed($signed(reg85)) : $signed(($unsigned(reg83) ?
                      $unsigned(wire63) : (reg74 & reg78)))) ?
              ($signed(reg85[(3'h7):(1'h1)]) > (!$unsigned((reg78 == reg87)))) : {$unsigned(reg87[(3'h4):(3'h4)])});
          reg85 <= $unsigned($signed($signed($unsigned(reg71[(4'he):(4'hb)]))));
        end
    end
  assign wire88 = reg68[(4'h8):(3'h5)];
  assign wire89 = ({reg79[(4'ha):(4'ha)]} <= {reg73[(3'h6):(1'h0)],
                      ((reg69 ?
                          (reg85 >>> reg69) : (^~reg69)) - ($signed((8'hbb)) ?
                          $signed(reg79) : reg68))});
endmodule

module module5
#(parameter param53 = (((~|(((8'hb2) < (8'ha8)) ? ((8'ha7) ? (8'ha7) : (8'hb3)) : {(8'hb2), (8'ha5)})) == (~|(((8'ha6) ^ (8'ha7)) ? ((8'hbb) ? (7'h43) : (8'hbd)) : ((7'h42) >>> (8'hb9))))) ? (((((8'h9c) == (8'hae)) ? {(8'h9f)} : (~^(8'ha6))) ~^ (((8'had) ~^ (8'ha4)) ? {(8'hbf), (8'ha9)} : {(7'h42)})) ? (((-(8'hbf)) ? ((8'ha7) ~^ (8'hba)) : ((7'h44) && (8'ha8))) - (((8'hbc) ? (8'ha7) : (8'hb5)) ? ((7'h42) ? (8'haf) : (8'ha0)) : {(8'ha4)})) : ((((8'hb0) ? (8'hb1) : (8'ha2)) ? (~^(8'ha1)) : ((8'h9f) ^~ (8'hba))) ? ({(8'hb4)} > (~|(8'h9c))) : (((8'hb0) > (7'h40)) || (-(8'hb0))))) : ((|((+(8'ha4)) - {(8'hbe), (8'had)})) ? (!{(!(8'ha7))}) : {(((7'h42) <<< (8'h9c)) < (^~(8'hb1)))})), 
parameter param54 = (((~((8'haa) ? param53 : ((7'h42) >= param53))) ? ({(param53 & param53)} ? {(param53 ? param53 : param53), (param53 <= param53)} : ({(8'hb2), (8'hb6)} >> (param53 ? param53 : param53))) : param53) == (&(param53 ? ((param53 ? param53 : param53) <= ((8'hab) + (8'hbe))) : {(param53 ? param53 : param53)}))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire35;
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire35,
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
                 (1'h0)};
  module11 #() modinst36 (wire35, clk, wire8, wire9, wire6, wire10);
  assign wire37 = $signed($unsigned(($signed($unsigned(wire10)) >= {$signed(wire10)})));
  assign wire38 = (wire8[(4'hc):(4'ha)] ?
                      ((((wire6 ? wire10 : wire7) ? wire6 : $signed((8'ha6))) ?
                              wire9[(3'h6):(2'h3)] : wire37) ?
                          (wire8[(4'h8):(1'h1)] ?
                              (wire6 | $unsigned(wire10)) : (^~wire7[(4'h8):(2'h3)])) : $signed($signed({wire10}))) : wire37);
  assign wire39 = $unsigned($unsigned((((8'h9f) << wire9) ?
                      wire6 : (^~(wire7 && wire8)))));
  always
    @(posedge clk) begin
      reg40 <= ($signed($unsigned((((8'hbf) || wire8) ?
          ((8'h9c) >= wire10) : {(8'h9c)}))) - wire6);
      reg41 <= $signed((8'h9c));
      if ($signed(wire6))
        begin
          reg42 <= $signed($unsigned(($unsigned(wire39[(4'hc):(3'h6)]) <= wire7[(5'h15):(3'h6)])));
          reg43 <= (8'hb8);
          reg44 <= {(8'h9d)};
          if (reg40[(1'h1):(1'h1)])
            begin
              reg45 <= {$signed((|wire8[(1'h1):(1'h0)])),
                  ((wire9[(3'h4):(1'h1)] | $unsigned(wire39[(4'ha):(3'h6)])) ?
                      wire38 : reg44[(3'h6):(3'h4)])};
              reg46 <= $unsigned(reg41);
              reg47 <= ($signed(({$unsigned(wire10),
                      (wire9 ? reg43 : (8'h9f))} ?
                  $signed((wire9 ?
                      wire6 : wire39)) : (((8'hbf) - reg43) != (^~wire38)))) >>> (wire8 ?
                  ((~&$signed(reg41)) ?
                      (7'h43) : (&(8'h9d))) : {((~(8'hb6)) != (~&(8'hab))),
                      ({wire9} >= reg41[(1'h1):(1'h0)])}));
            end
          else
            begin
              reg45 <= reg42;
              reg46 <= (((8'hab) * reg45[(2'h2):(2'h2)]) >> reg43);
              reg47 <= ($signed((~&(reg44[(2'h3):(1'h0)] ?
                  (reg42 >> wire35) : (reg44 ~^ (8'ha2))))) << {(&{(~|reg43)})});
            end
        end
      else
        begin
          reg42 <= $signed($signed((|{(reg46 >= reg40)})));
        end
      reg48 <= (~{{$unsigned($unsigned((8'hbd))), $signed($signed((8'hb1)))},
          reg44});
      reg49 <= ((($unsigned($signed(wire38)) ?
          (!reg46) : reg40) + reg45) < reg47[(4'hb):(3'h7)]);
    end
  always
    @(posedge clk) begin
      reg50 <= $unsigned(($signed(reg44[(2'h3):(1'h1)]) << (($signed(reg42) ?
              $unsigned(reg45) : (^~wire38)) ?
          reg46[(4'hc):(1'h1)] : $unsigned($signed(reg44)))));
      reg51 <= reg42;
      reg52 <= ((+(~^($unsigned(wire7) >> reg43[(1'h1):(1'h1)]))) || $unsigned($signed(((^wire7) ?
          $signed(reg41) : reg43))));
    end
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  input wire signed [(3'h4):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire31,
                 wire29,
                 wire28,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg32,
                 reg30,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire16 = $unsigned((wire13[(1'h1):(1'h1)] <= wire14));
  assign wire17 = ((((wire14 ? (^wire14) : wire14[(1'h0):(1'h0)]) ?
                          $signed($signed(wire14)) : $signed($signed(wire14))) && {wire16,
                          $signed($signed(wire14))}) ?
                      wire13[(2'h3):(2'h2)] : ($signed({$signed((8'had)),
                          $signed(wire16)}) + (wire14[(1'h1):(1'h1)] + ((^~wire12) >> wire16))));
  assign wire18 = $signed($signed($unsigned(wire13)));
  assign wire19 = wire13;
  assign wire20 = wire13;
  assign wire21 = wire19[(4'hc):(3'h4)];
  always
    @(posedge clk) begin
      if ((((wire17[(1'h1):(1'h1)] ~^ wire17[(3'h4):(1'h0)]) >> $signed(($signed(wire15) * {wire21,
              wire21}))) ?
          (~&(~|$signed($signed(wire15)))) : ((7'h42) ?
              $unsigned((wire16[(4'h8):(3'h4)] ?
                  (~&wire18) : (+(7'h43)))) : $signed(($unsigned(wire18) ?
                  wire19[(2'h2):(1'h0)] : (wire13 != wire13))))))
        begin
          reg22 <= ((wire18[(3'h5):(1'h1)] ?
                  wire13 : $unsigned(wire19[(3'h6):(3'h4)])) ?
              $unsigned(wire14[(4'h9):(3'h5)]) : (8'haa));
          reg23 <= {$signed(((wire16 == (~|wire14)) && $unsigned(wire15[(3'h7):(3'h7)])))};
        end
      else
        begin
          reg22 <= $signed(wire12[(4'h9):(4'h9)]);
          if (wire20)
            begin
              reg23 <= ((~(($unsigned(wire17) ?
                      reg22[(2'h3):(2'h3)] : $unsigned(wire21)) ?
                  wire17[(1'h0):(1'h0)] : ((wire17 << wire18) <= (wire12 ^~ wire15)))) <<< (+$unsigned(wire13)));
            end
          else
            begin
              reg23 <= ($unsigned(reg23) <= (-$signed($unsigned({wire14}))));
              reg24 <= wire15[(3'h6):(3'h6)];
              reg25 <= wire19[(4'hb):(4'h9)];
              reg26 <= $signed((reg22[(2'h3):(1'h1)] ^ (&reg23[(1'h0):(1'h0)])));
              reg27 <= $unsigned(wire14);
            end
        end
    end
  assign wire28 = $unsigned(wire13);
  assign wire29 = reg26;
  always
    @(posedge clk) begin
      reg30 <= {$signed($signed((~|wire16[(3'h6):(2'h3)])))};
    end
  assign wire31 = (($signed($signed($unsigned(reg23))) ? wire12 : reg25) ?
                      reg23[(2'h3):(1'h1)] : wire20);
  always
    @(posedge clk) begin
      reg32 <= (+$unsigned($unsigned(((wire12 ? wire31 : wire18) ?
          {wire14, (8'hbc)} : {reg24}))));
    end
  assign wire33 = ((|($unsigned((8'hb9)) ?
                          $signed(reg24) : (-$signed(reg27)))) ?
                      $signed(reg27[(4'hc):(4'hc)]) : {(({wire16, wire21} ?
                                  wire29[(1'h0):(1'h0)] : reg26[(3'h7):(3'h7)]) ?
                              wire16 : $signed($unsigned(wire28))),
                          wire12});
  assign wire34 = $unsigned(wire18[(3'h5):(2'h3)]);
endmodule
