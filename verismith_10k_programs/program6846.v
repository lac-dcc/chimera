module top
#(parameter param82 = (8'hb6), 
parameter param83 = {{(((param82 ^ param82) ? param82 : {(8'hb8)}) > param82), (!param82)}, (^~(((param82 ? param82 : param82) <<< (~|param82)) ^~ param82))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  assign y = {wire80,
                 wire36,
                 wire32,
                 wire30,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire5 = $unsigned($signed(wire1[(2'h2):(1'h1)]));
  assign wire6 = ({(8'ha1)} <<< (-(~^(!(wire3 >>> wire3)))));
  assign wire7 = ((wire2 + wire5) ?
                     ($signed(wire2[(5'h11):(4'hd)]) ?
                         $unsigned(wire2) : (|$unsigned((wire6 ?
                             (8'h9c) : (8'hb0))))) : (!(&(wire5 ?
                         (^wire2) : wire3))));
  assign wire8 = wire7;
  module9 #() modinst31 (wire30, clk, wire7, wire5, wire2, wire8);
  assign wire32 = (wire5 ?
                      wire8[(4'hb):(1'h0)] : ($signed($unsigned(wire2[(3'h6):(3'h6)])) ~^ wire2));
  always
    @(posedge clk) begin
      reg33 <= {wire5[(1'h1):(1'h0)]};
      reg34 <= wire32[(1'h1):(1'h0)];
      reg35 <= ((($signed($unsigned(wire8)) ?
              wire1[(3'h4):(1'h0)] : (^~(wire3 ? (8'hae) : reg33))) ^ wire3) ?
          $signed((((-wire8) ? $unsigned(reg34) : $signed((7'h40))) ?
              $unsigned((^wire3)) : {$signed(reg33), $signed(reg33)})) : wire1);
    end
  assign wire36 = wire7;
  module37 #() modinst81 (wire80, clk, wire4, wire3, wire7, wire36, reg33);
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire42;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire signed [(3'h4):(1'h0)] wire40;
  input wire [(4'h9):(1'h0)] wire39;
  input wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire43 = (7'h41);
  assign wire44 = (-wire39);
  assign wire45 = wire42;
  assign wire46 = $unsigned(wire44[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire41[(3'h4):(1'h0)])
        begin
          if (wire39)
            begin
              reg47 <= wire39[(2'h2):(1'h0)];
            end
          else
            begin
              reg47 <= wire44;
              reg48 <= (~|wire39[(1'h1):(1'h0)]);
            end
          if (wire40)
            begin
              reg49 <= $unsigned(wire46);
              reg50 <= $signed(reg49[(1'h1):(1'h1)]);
              reg51 <= (|(wire41 & ($unsigned($signed(reg50)) ?
                  (&reg47[(1'h0):(1'h0)]) : $unsigned((&wire46)))));
            end
          else
            begin
              reg49 <= {((($signed((8'ha3)) ?
                          {reg51,
                              wire38} : reg51[(2'h3):(1'h1)]) || wire44[(2'h2):(1'h1)]) ?
                      $unsigned({wire46[(4'h8):(3'h6)],
                          wire38}) : (-$unsigned({wire44}))),
                  $unsigned({{wire40}})};
              reg50 <= (~$signed(reg50[(3'h4):(2'h3)]));
              reg51 <= wire43[(4'hb):(3'h6)];
              reg52 <= ((((~^(wire39 == wire39)) ^~ (-$unsigned((8'ha7)))) ?
                      (~|wire40[(2'h2):(1'h1)]) : $unsigned($unsigned((|wire39)))) ?
                  reg48[(1'h1):(1'h0)] : wire44[(4'ha):(4'h8)]);
            end
        end
      else
        begin
          reg47 <= reg52;
          reg48 <= $signed(((|$unsigned(reg52)) ^ wire42[(1'h0):(1'h0)]));
          reg49 <= {reg47, wire45[(1'h0):(1'h0)]};
          reg50 <= ({(~&{(^~wire39), wire45[(3'h7):(3'h6)]}),
              ((!wire46[(1'h0):(1'h0)]) ?
                  $signed((wire40 | reg47)) : (~|(wire45 ?
                      wire39 : wire42)))} ^~ (~^$signed((((8'ha6) ?
                  wire38 : reg48) ?
              $signed(wire44) : $signed(reg48)))));
        end
      reg53 <= (|reg47);
    end
  assign wire54 = (~|wire42[(3'h5):(1'h1)]);
  assign wire55 = {((~^($signed(reg49) ? $signed(wire54) : (^reg47))) ?
                          $signed({{wire41}}) : $signed({$signed(wire39),
                              reg49}))};
  assign wire56 = (8'hb1);
  assign wire57 = wire55[(2'h3):(1'h1)];
  assign wire58 = wire45;
  assign wire59 = (($signed(((wire38 ? wire41 : reg50) ?
                      $unsigned(reg50) : wire41)) << (|$signed((&wire42)))) < $signed((8'ha4)));
  assign wire60 = wire43;
  assign wire61 = ($signed(reg53[(3'h7):(3'h6)]) < $signed($unsigned($unsigned((reg49 + reg47)))));
  always
    @(posedge clk) begin
      reg62 <= (8'hb7);
      if (reg51)
        begin
          reg63 <= ((^wire39[(1'h1):(1'h1)]) - wire44);
        end
      else
        begin
          reg63 <= $unsigned(wire61[(1'h1):(1'h1)]);
          if (wire39[(1'h0):(1'h0)])
            begin
              reg64 <= (~|wire57);
              reg65 <= (($unsigned($unsigned(wire44[(4'h8):(2'h2)])) ?
                  {((wire46 | wire60) && (reg63 ? reg63 : reg48)),
                      wire61} : (!$signed((wire41 >= reg49)))) >> wire46);
              reg66 <= $signed((wire43 ?
                  ({$unsigned(wire44)} < $unsigned((8'hba))) : (^$signed((reg52 ^ (8'hbe))))));
            end
          else
            begin
              reg64 <= $signed($signed({$signed({wire54}), (8'ha1)}));
            end
          reg67 <= $signed(reg52);
        end
      if (((8'hbe) || (^~reg53[(4'h9):(1'h0)])))
        begin
          if (($signed((wire41 ?
                  $unsigned($signed(reg62)) : {reg47[(1'h0):(1'h0)]})) ?
              $signed((~&(reg53[(3'h7):(3'h7)] != wire38[(5'h15):(5'h11)]))) : $unsigned(reg49)))
            begin
              reg68 <= ($unsigned((-(^(~wire45)))) ?
                  wire60[(4'he):(3'h7)] : ((8'hbe) ?
                      ($unsigned(((8'hb1) ? wire59 : wire56)) ?
                          $signed((|wire46)) : {$unsigned(wire44)}) : wire56[(1'h0):(1'h0)]));
              reg69 <= $unsigned(((~^((wire40 ^ (8'hac)) & (reg49 ~^ reg50))) ?
                  reg53 : $signed(reg48)));
              reg70 <= (~&(-{{(8'ha2), $signed(wire44)},
                  (^~(reg63 ? wire56 : reg48))}));
              reg71 <= (~^((+((~(8'ha3)) ? wire46[(3'h7):(2'h3)] : reg68)) ?
                  (+($unsigned(wire55) ?
                      reg48[(2'h3):(1'h1)] : wire40)) : $unsigned($signed(((8'hbb) ?
                      (8'hbb) : (8'h9d))))));
              reg72 <= ($signed(($signed($unsigned((8'hb5))) ?
                  ((wire58 <<< reg67) ?
                      reg47 : wire44) : $signed($unsigned(reg69)))) == reg53[(3'h4):(3'h4)]);
            end
          else
            begin
              reg68 <= wire42;
            end
          reg73 <= wire39[(4'h9):(4'h8)];
          reg74 <= (&$unsigned($unsigned({$signed(wire39)})));
          reg75 <= ((wire46[(5'h10):(4'h8)] == reg70[(1'h1):(1'h1)]) << reg49[(2'h2):(1'h1)]);
          reg76 <= (8'haa);
        end
      else
        begin
          reg68 <= (^~{(($unsigned((8'had)) - $signed(wire45)) ?
                  (reg76 ? reg62 : reg70) : wire60[(4'hb):(3'h4)])});
        end
      if ((^reg67))
        begin
          reg77 <= $signed($signed(((wire59 ?
                  (~reg67) : ((8'ha1) ? reg69 : reg52)) ?
              reg70[(2'h3):(2'h3)] : wire56[(2'h3):(2'h2)])));
        end
      else
        begin
          reg77 <= (wire46[(5'h12):(2'h2)] * reg64);
          reg78 <= $unsigned(reg73);
        end
      reg79 <= (wire59[(3'h5):(1'h0)] & ((8'had) ^~ ((((8'hb4) > reg72) || reg62) ?
          $unsigned(reg78[(2'h2):(1'h1)]) : (|$signed(reg68)))));
    end
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire signed [(3'h6):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire23,
                 wire22,
                 wire21,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg25,
                 reg24,
                 reg20,
                 (1'h0)};
  assign wire14 = (wire13 ?
                      wire12 : (~|$unsigned(($signed(wire12) << (wire12 ?
                          wire11 : wire13)))));
  assign wire15 = (|$unsigned(wire12[(1'h0):(1'h0)]));
  assign wire16 = wire14[(5'h11):(1'h1)];
  assign wire17 = (~^({(^~$unsigned(wire11)), $unsigned(wire16)} ?
                      wire14[(3'h4):(2'h3)] : {((wire16 < wire14) ?
                              wire11[(3'h4):(3'h4)] : (~&wire10))}));
  assign wire18 = wire17;
  assign wire19 = (wire11 + ({((wire14 * wire11) < (wire11 || wire11))} ?
                      $signed($unsigned((wire18 != (8'ha8)))) : $unsigned($signed(wire12))));
  always
    @(posedge clk) begin
      reg20 <= $signed($unsigned((~|wire14)));
    end
  assign wire21 = ((^(((-wire19) ? reg20 : $signed(wire12)) <<< wire14)) ?
                      (~&{wire15}) : $signed((({wire19} >= (|wire19)) != (((8'hac) ?
                          (8'hb1) : wire17) >= {(8'ha4), wire15}))));
  assign wire22 = (^~(((wire10[(1'h0):(1'h0)] ?
                          wire14[(1'h0):(1'h0)] : wire14[(3'h5):(2'h2)]) == {(wire10 ?
                              wire19 : wire12),
                          (-reg20)}) ?
                      $unsigned(($unsigned(wire13) ?
                          wire15[(2'h2):(1'h1)] : (wire13 ?
                              wire19 : wire16))) : (~^(^(~&wire12)))));
  assign wire23 = $signed(((wire13[(4'h8):(3'h6)] || $signed((wire15 ?
                          wire16 : wire16))) ?
                      (wire16 ?
                          $unsigned((reg20 ^~ wire21)) : $signed(wire19[(3'h5):(1'h1)])) : $signed($signed(wire17))));
  always
    @(posedge clk) begin
      reg24 <= $signed(wire13);
      reg25 <= $signed((+wire18[(3'h5):(1'h0)]));
    end
  assign wire26 = $signed((|$signed($signed(wire18[(4'he):(3'h7)]))));
  assign wire27 = (|wire19[(4'ha):(3'h4)]);
  assign wire28 = $unsigned(($unsigned($signed((reg25 ~^ reg25))) ?
                      (-(reg24[(4'h8):(2'h2)] ?
                          (wire27 << wire22) : (8'haf))) : {reg20[(1'h0):(1'h0)]}));
  assign wire29 = $unsigned($signed(reg20[(2'h3):(1'h1)]));
endmodule
