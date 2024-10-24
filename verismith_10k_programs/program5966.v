module top
#(parameter param78 = {{{({(8'hbf)} && {(8'hb5)})}}, ((&(((8'hb4) ? (7'h43) : (8'hb7)) ? (8'ha4) : ((8'ha0) ? (8'hac) : (8'h9d)))) ? ((+((8'hbe) ? (8'ha2) : (8'ha1))) >>> ({(8'ha4), (8'hbd)} ? {(8'haf)} : ((8'ha4) ? (8'ha8) : (8'hbf)))) : ((((8'hb2) >>> (7'h41)) ? ((8'hb2) ? (7'h42) : (8'h9c)) : ((8'ha8) ? (8'hab) : (7'h42))) >> (8'ha9)))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire64;
  wire [(2'h3):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg4 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire71,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire7,
                 wire6,
                 wire5,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (((({wire1, wire1} > wire0) ?
              {{(8'ha0)}, wire3[(3'h5):(1'h1)]} : wire0) ?
          ((8'ha1) ?
              {(^wire0)} : (^(wire1 ? wire2 : wire3))) : ({$unsigned(wire1),
                  wire1} ?
              ($unsigned(wire1) ?
                  ((8'hb8) ?
                      (7'h42) : wire1) : $signed(wire0)) : wire2)) ~^ (|(~&$unsigned((wire2 ?
          wire0 : wire2)))));
    end
  assign wire5 = ((wire2 ^~ wire1[(1'h1):(1'h0)]) * (({(wire3 | wire2),
                     $signed(wire1)} <<< $signed((-wire1))) >>> {(~&wire2[(2'h3):(1'h0)]),
                     reg4[(2'h3):(2'h3)]}));
  assign wire6 = ($unsigned(reg4) & (!wire5[(3'h5):(1'h0)]));
  assign wire7 = ((wire3 ?
                     wire6[(1'h1):(1'h0)] : ($signed((~^wire0)) ?
                         reg4 : wire2)) << (wire6 >= wire0[(4'he):(4'ha)]));
  module8 #() modinst62 (.wire11(reg4), .wire12(wire7), .y(wire61), .wire10(wire2), .wire9(wire3), .clk(clk), .wire13(wire5));
  assign wire63 = $signed($signed($signed(wire1[(1'h0):(1'h0)])));
  assign wire64 = wire2[(4'hb):(1'h0)];
  assign wire65 = wire6;
  assign wire66 = (^~(~|$signed((!wire61))));
  always
    @(posedge clk) begin
      reg67 <= (~^$signed(wire3[(2'h3):(1'h1)]));
      reg68 <= ((reg4[(1'h0):(1'h0)] ^~ wire63[(2'h3):(1'h0)]) | $signed($unsigned(($signed(wire7) == wire3))));
      reg69 <= $signed((wire61[(2'h3):(1'h0)] > wire0[(3'h4):(1'h0)]));
      reg70 <= wire63;
    end
  assign wire71 = reg4[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg72 <= (~&wire61[(3'h5):(2'h2)]);
      reg73 <= (reg70 ?
          ($unsigned($signed((8'h9f))) ?
              reg67[(4'h9):(3'h7)] : wire5[(4'hb):(4'ha)]) : $signed((($unsigned(wire61) & $signed((8'hb7))) ?
              $signed({wire3, wire0}) : reg72[(2'h2):(1'h0)])));
      reg74 <= $unsigned(reg68);
      reg75 <= $unsigned($unsigned($signed(($unsigned(wire61) ?
          wire63 : (wire65 ? (8'h9c) : reg4)))));
    end
  assign wire76 = wire63[(1'h1):(1'h1)];
  assign wire77 = wire66;
endmodule

module module8
#(parameter param60 = (^(~&{((^~(8'h9e)) ? ((8'had) > (7'h44)) : (^~(8'hbd))), (((7'h42) <= (8'hba)) ? ((8'hb3) ? (8'hb0) : (8'hb6)) : (8'hb9))})))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire37;
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire37,
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
                 (1'h0)};
  assign wire14 = $signed((((wire10 ?
                      $unsigned(wire13) : {wire12}) * wire11[(2'h2):(1'h0)]) >>> wire11[(3'h4):(1'h0)]));
  assign wire15 = $unsigned(((($signed(wire10) ?
                      (~&wire9) : $signed(wire14)) || ($unsigned(wire11) ?
                      wire10 : wire14)) >> wire9[(1'h1):(1'h1)]));
  assign wire16 = {(^~({(-wire13)} ?
                          $unsigned((wire15 ?
                              wire13 : wire11)) : (!$unsigned(wire14))))};
  assign wire17 = ({$signed($signed({wire10}))} ?
                      wire12[(1'h0):(1'h0)] : wire15);
  module18 #() modinst38 (.wire22(wire16), .wire20(wire10), .y(wire37), .clk(clk), .wire23(wire15), .wire19(wire14), .wire21(wire12));
  always
    @(posedge clk) begin
      if ($unsigned(wire10[(3'h4):(3'h4)]))
        begin
          reg39 <= wire11;
          if (wire11)
            begin
              reg40 <= ((8'ha3) ?
                  wire15[(5'h11):(5'h11)] : ((7'h42) ?
                      wire37 : wire37[(3'h6):(3'h6)]));
              reg41 <= (~|(($unsigned($signed((8'had))) ?
                      $unsigned($signed(wire12)) : wire12) ?
                  (wire10[(3'h7):(3'h6)] & reg40[(3'h4):(2'h2)]) : ($signed(wire14) || wire17)));
              reg42 <= $unsigned($unsigned((wire11 >= $signed(wire15[(5'h13):(5'h13)]))));
              reg43 <= $unsigned(({(^$signed(wire17)),
                      (((8'ha8) > reg40) - wire14[(3'h4):(2'h2)])} ?
                  $signed($signed($signed(wire15))) : (~^(~&wire13))));
              reg44 <= (~^(wire15[(4'hf):(2'h2)] ?
                  wire13[(4'hb):(4'hb)] : $signed(((wire14 >>> reg43) ?
                      wire17[(4'hb):(4'ha)] : (&reg41)))));
            end
          else
            begin
              reg40 <= (wire14 == reg41);
              reg41 <= ((wire9 ? $unsigned((~^wire14)) : (~|(8'hbc))) ?
                  (((~$unsigned(wire9)) ?
                          $unsigned(wire37[(1'h0):(1'h0)]) : $unsigned((wire9 > wire17))) ?
                      $signed(wire10[(3'h7):(3'h4)]) : ((~{reg44}) & $signed($signed(wire13)))) : reg40[(1'h0):(1'h0)]);
              reg42 <= (wire9 | wire10[(3'h6):(3'h4)]);
              reg43 <= ($signed($signed(((^reg44) ~^ $signed(wire12)))) ?
                  wire15[(3'h6):(1'h0)] : (+(reg43[(1'h0):(1'h0)] ?
                      wire16 : $signed(wire37[(4'hd):(4'hd)]))));
            end
        end
      else
        begin
          reg39 <= ($unsigned(($unsigned((wire15 ? wire13 : wire10)) ?
                  ((reg40 & wire9) ? $unsigned(wire9) : wire17) : wire16)) ?
              $signed($signed(reg39)) : $signed($unsigned(reg40[(3'h4):(1'h1)])));
          reg40 <= $unsigned(wire12[(2'h3):(2'h3)]);
        end
      reg45 <= {(($signed((~wire17)) ? wire12 : (~reg42)) ?
              reg39[(4'he):(4'h8)] : $unsigned($signed($signed(wire13))))};
      reg46 <= (wire37 ?
          (~&reg44) : $unsigned(({reg43} ? $unsigned((^reg42)) : wire10)));
      if ((wire17[(4'ha):(4'ha)] ?
          {reg39[(4'h8):(3'h4)], {$unsigned(reg45)}} : reg45))
        begin
          reg47 <= (wire12 ?
              $signed($unsigned($unsigned({wire11}))) : $signed((wire13[(4'h8):(3'h4)] ?
                  ((^~wire9) <<< $signed(reg43)) : ((wire13 ? reg42 : (8'h9d)) ?
                      wire14 : (wire10 ? wire17 : (7'h44))))));
          if ((((+((-(7'h40)) ? {reg46, wire11} : reg47)) ?
              ($unsigned(wire13[(3'h4):(3'h4)]) ?
                  (8'hae) : wire11) : reg42) < ((-reg39) ?
              $unsigned((8'hbc)) : ($signed((wire14 ? (8'h9c) : wire15)) ?
                  {(&wire10)} : wire9))))
            begin
              reg48 <= ($signed((reg43 ? wire12 : $unsigned((^~wire12)))) ?
                  (^reg39) : $unsigned((~&(reg40[(1'h1):(1'h1)] > wire14))));
              reg49 <= wire17;
            end
          else
            begin
              reg48 <= (~&$unsigned($signed({$signed(reg42)})));
              reg49 <= wire16[(4'ha):(1'h1)];
              reg50 <= wire16[(5'h10):(3'h4)];
            end
          reg51 <= wire15[(3'h7):(3'h4)];
        end
      else
        begin
          reg47 <= (~|reg45[(2'h2):(2'h2)]);
          if ((~|((~|$signed((reg50 ? reg39 : reg43))) ?
              reg44[(4'ha):(3'h5)] : (+reg50))))
            begin
              reg48 <= (~^$unsigned((~|$unsigned($signed(wire17)))));
            end
          else
            begin
              reg48 <= wire11[(3'h4):(2'h2)];
              reg49 <= ($unsigned(wire15) ?
                  $unsigned({(wire14[(4'ha):(2'h3)] >> (reg40 ^~ wire17)),
                      (reg46[(4'he):(2'h2)] - $unsigned(reg47))}) : (reg44[(4'h8):(1'h0)] ~^ $unsigned(($unsigned(wire14) >= (^reg45)))));
              reg50 <= ($unsigned(reg41[(5'h11):(3'h5)]) * (~&($signed((^wire10)) != {(8'h9d),
                  (wire11 == reg39)})));
            end
          reg51 <= $signed($signed(((~reg39[(5'h12):(1'h0)]) ?
              ((reg41 ? (8'ha9) : reg43) ?
                  (wire15 ^ reg45) : (reg47 + reg44)) : ((^wire11) && wire10))));
          reg52 <= $unsigned(wire11);
        end
      reg53 <= reg52[(1'h1):(1'h1)];
    end
  assign wire54 = $unsigned($signed((^($signed(wire17) ?
                      (wire16 >>> reg43) : $unsigned(wire9)))));
  assign wire55 = $unsigned($unsigned((wire17 ?
                      reg40 : (wire11[(3'h4):(2'h2)] ^~ $signed(wire11)))));
  assign wire56 = $unsigned($unsigned(reg51));
  assign wire57 = reg41;
  assign wire58 = $signed((reg42[(1'h0):(1'h0)] ?
                      reg51[(3'h7):(2'h2)] : reg51));
  assign wire59 = (((^($unsigned(reg51) > (reg51 ? wire58 : reg46))) ?
                          reg47 : wire37) ?
                      wire11[(3'h5):(3'h5)] : ((+wire16) ?
                          $unsigned((~$unsigned((8'ha7)))) : $signed(((8'h9d) ?
                              $signed(wire12) : $signed(wire55)))));
endmodule

module module18
#(parameter param35 = (^~(~(^~(|{(8'hbb)})))), 
parameter param36 = param35)
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire24;
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire24,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire24 = ((&((~^wire22) << ({wire23} ?
                      {wire22} : wire23[(3'h7):(1'h0)]))) ^ $signed($signed(((wire23 && wire21) >>> wire21))));
  always
    @(posedge clk) begin
      reg25 <= $unsigned((wire22 ?
          wire21 : ($signed(wire22[(3'h7):(3'h4)]) && $signed(wire23[(4'hd):(1'h1)]))));
      reg26 <= {{$signed(wire22[(5'h10):(1'h1)]),
              (~&({wire22} ? (~|wire22) : wire21))}};
    end
  assign wire27 = $unsigned(wire21[(2'h3):(2'h2)]);
  assign wire28 = (^wire21[(1'h1):(1'h0)]);
  assign wire29 = {((+((+wire20) ? wire22 : $signed(wire21))) ?
                          (-$unsigned(reg26)) : ($signed((8'hb6)) ?
                              (~wire27) : (~&(wire24 == wire20))))};
  assign wire30 = $unsigned((8'ha1));
  assign wire31 = reg25[(2'h3):(1'h1)];
  assign wire32 = {wire19};
  assign wire33 = ({$signed(({wire28, wire27} <<< (wire32 ? wire28 : (8'h9e)))),
                      $signed(wire23[(3'h6):(1'h1)])} && (^~(((reg26 ?
                      wire30 : wire20) & (wire23 ?
                      wire20 : (8'haa))) && reg26)));
  assign wire34 = (~&$signed(wire20));
endmodule
