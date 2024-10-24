module top
#(parameter param93 = (({(+((8'h9f) >>> (7'h42)))} ? (&((8'hac) <<< ((8'hbf) ? (8'hb1) : (8'hb3)))) : (!(((8'ha5) ? (8'hbb) : (8'h9d)) ? {(8'hac), (8'ha9)} : {(8'hbf), (7'h40)}))) ? (((((8'ha0) ? (7'h40) : (7'h44)) ? (~(8'hb4)) : ((8'h9d) > (8'ha5))) >= (((8'ha4) ? (8'haa) : (8'h9f)) ? ((8'hb6) ~^ (8'ha0)) : {(8'hbc), (8'hbb)})) && (({(8'ha9)} | {(8'hb9), (7'h40)}) ? ({(8'hb3)} ? ((8'hb3) ? (8'hbd) : (8'ha8)) : ((8'hae) ? (8'ha1) : (8'hb6))) : {{(8'hbd)}, ((8'ha5) ? (8'hb3) : (8'hb7))})) : (((^~{(8'hbe)}) < (+(|(8'hb4)))) >>> ({{(8'hb1)}, ((8'h9c) ? (8'ha2) : (8'h9d))} - (&(~&(8'hb8)))))), 
parameter param94 = param93)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire87;
  wire [(3'h4):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire70;
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire72,
                 wire70,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  module4 #() modinst71 (wire70, clk, wire2, wire3, wire0, wire1, (8'ha3));
  assign wire72 = $signed($signed($unsigned($unsigned(wire1))));
  always
    @(posedge clk) begin
      if ((((wire1[(3'h4):(1'h0)] ?
              $signed($unsigned(wire70)) : {wire2[(5'h12):(5'h11)]}) ?
          $signed($unsigned((wire0 ?
              (7'h43) : wire2))) : $unsigned($signed((&(8'ha7))))) <<< ($signed($signed((wire0 - (8'ha0)))) ~^ $unsigned((^~$unsigned((8'ha5)))))))
        begin
          reg73 <= $signed(wire1);
          reg74 <= wire72[(4'hc):(2'h3)];
          if (($signed(({$unsigned((7'h40))} ~^ $unsigned((wire0 ?
              (8'h9f) : wire3)))) ^~ {($unsigned({wire72,
                  (8'hba)}) == reg73[(4'hb):(2'h2)]),
              (reg74 ?
                  $unsigned(((7'h42) ?
                      wire3 : wire3)) : (wire1 ~^ wire70[(5'h13):(2'h2)]))}))
            begin
              reg75 <= wire1;
              reg76 <= (+(~&wire72[(3'h7):(3'h6)]));
              reg77 <= (8'hb1);
              reg78 <= {$signed($signed($unsigned(reg73[(2'h2):(2'h2)])))};
            end
          else
            begin
              reg75 <= $unsigned((8'hbb));
              reg76 <= $signed((({$unsigned(wire0), $unsigned((7'h44))} ?
                  $signed((reg76 + wire70)) : $unsigned($signed(reg77))) != (((wire0 ?
                      reg76 : wire3) ?
                  (&wire0) : $signed(reg78)) <= ({reg74} <<< reg75[(3'h7):(3'h6)]))));
            end
          if ((^~reg75[(4'hf):(1'h0)]))
            begin
              reg79 <= $signed($unsigned(wire1));
            end
          else
            begin
              reg79 <= (((wire70 ?
                  $signed($signed(reg75)) : reg78[(1'h0):(1'h0)]) >>> wire2) << reg79[(5'h10):(2'h3)]);
              reg80 <= reg79;
              reg81 <= ((+(~reg80)) >= $unsigned({wire1[(4'hf):(4'hf)]}));
              reg82 <= ((^~$signed(($unsigned(reg75) > reg74[(2'h3):(1'h1)]))) ?
                  ((^~reg77[(4'hc):(4'h8)]) ?
                      wire70 : {(-(~^reg74)),
                          $signed((reg81 ? reg80 : reg78))}) : reg79);
              reg83 <= (8'hbd);
            end
        end
      else
        begin
          reg73 <= (-reg78);
          reg74 <= (wire2 ?
              (reg77[(3'h7):(1'h1)] != $unsigned(((^~wire72) ?
                  reg73[(3'h5):(1'h1)] : (!reg81)))) : (~^$unsigned(((&reg76) <<< (7'h40)))));
          if ($unsigned(reg83[(1'h1):(1'h0)]))
            begin
              reg75 <= ({$signed($unsigned(((8'h9f) | wire70))),
                  $signed(wire2)} + (+$unsigned((~&(reg75 ? wire72 : reg75)))));
              reg76 <= $signed((($unsigned((wire72 ?
                      wire70 : reg78)) ^~ $signed(reg80)) ?
                  reg80 : $unsigned(reg81[(3'h7):(3'h6)])));
            end
          else
            begin
              reg75 <= {{(8'hae),
                      ($unsigned((wire1 ? wire72 : (7'h41))) ?
                          $signed($signed(reg81)) : (~{reg80, reg73}))}};
              reg76 <= (($unsigned((reg74 ?
                  (+reg79) : $unsigned(reg79))) >> (wire0 ?
                  (!{wire2,
                      reg73}) : ($unsigned(wire72) > (reg80 <= wire2)))) | ($signed($signed(wire1)) ?
                  ((reg78 << (reg73 ?
                      wire2 : (8'ha6))) > wire72) : reg81[(1'h1):(1'h0)]));
              reg77 <= wire3[(3'h5):(3'h4)];
              reg78 <= {reg78[(2'h2):(1'h0)], wire0[(4'hb):(4'hb)]};
              reg79 <= reg79;
            end
          if (reg79[(4'hd):(1'h1)])
            begin
              reg80 <= (|($unsigned($unsigned($signed((7'h43)))) <<< $signed(reg73)));
              reg81 <= {reg74[(3'h4):(1'h0)], wire1[(4'h8):(3'h7)]};
            end
          else
            begin
              reg80 <= (($unsigned($signed((reg76 & (8'hae)))) > (&reg75[(4'hc):(4'h9)])) <= $unsigned($signed(wire2[(3'h5):(2'h2)])));
              reg81 <= {$unsigned((reg74 ~^ $signed((wire3 ? reg77 : reg80))))};
              reg82 <= ((-({(wire3 ? reg79 : (8'hac))} ?
                      $unsigned(wire2) : $unsigned($signed(reg80)))) ?
                  (+(reg83 ?
                      reg75[(2'h2):(1'h0)] : (~(8'hbd)))) : $unsigned(reg80[(1'h1):(1'h0)]));
              reg83 <= reg80[(4'h8):(1'h0)];
              reg84 <= $unsigned((-(reg74[(4'h8):(2'h3)] ?
                  ((reg74 ? reg75 : reg81) ?
                      $unsigned(reg73) : wire70) : reg73[(3'h5):(2'h2)])));
            end
        end
      reg85 <= $unsigned((|{(^~$unsigned((7'h43))), (wire3 + (^(8'hbb)))}));
    end
  assign wire86 = ($signed(wire3) ?
                      $unsigned(((+$signed(reg77)) + (reg73 | (^reg77)))) : ($signed(((reg73 ?
                              (8'h9d) : wire72) ?
                          $unsigned(reg78) : $signed(wire1))) <= (&{(reg78 ?
                              reg80 : wire2)})));
  assign wire87 = $signed($signed(wire3));
  assign wire88 = reg78[(1'h0):(1'h0)];
  assign wire89 = {$unsigned($signed((-(reg76 ? reg83 : reg85))))};
  assign wire90 = ($unsigned(wire3) && (~(((+reg78) && {reg73}) == ($unsigned((8'hb6)) != $signed((8'hae))))));
  assign wire91 = (~^wire89);
  assign wire92 = $signed(($unsigned(((wire3 ? reg80 : reg76) ?
                      reg73[(2'h2):(1'h0)] : (wire90 || reg82))) + $signed(wire70)));
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire5;
  input wire signed [(3'h7):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire63;
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire10,
                 wire11,
                 wire23,
                 wire37,
                 wire63,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire10 = $unsigned(($unsigned(((+wire7) ?
                          wire5[(4'hc):(3'h7)] : wire5)) ?
                      (^wire9[(1'h1):(1'h1)]) : wire9));
  assign wire11 = (!{(&(~^wire6)), wire10});
  module12 #() modinst24 (.wire15(wire10), .wire16(wire8), .wire13(wire9), .clk(clk), .y(wire23), .wire14(wire7));
  always
    @(posedge clk) begin
      if ($signed(wire7[(4'h9):(4'h9)]))
        begin
          if (((wire5 > (8'h9d)) == (~^{{(-wire6), $signed(wire23)}})))
            begin
              reg25 <= wire6;
            end
          else
            begin
              reg25 <= (8'ha8);
              reg26 <= $unsigned((wire8[(3'h6):(2'h2)] << {$signed(wire11[(5'h11):(1'h1)]),
                  (~|(-wire5))}));
              reg27 <= (wire23 > $unsigned($signed((-(~wire8)))));
              reg28 <= $signed({reg25});
            end
          reg29 <= (-$signed((^~{wire23[(4'h8):(2'h3)], $unsigned(wire11)})));
          if ((wire10[(4'h8):(2'h3)] ?
              wire6[(3'h5):(2'h3)] : (-($unsigned((reg28 * reg29)) + ($unsigned(wire6) ?
                  {reg27} : (reg27 ? reg27 : reg26))))))
            begin
              reg30 <= $signed(reg26);
              reg31 <= (((((8'ha2) > wire7[(5'h12):(4'ha)]) ?
                          wire11 : ({(8'hae)} ? (^wire9) : wire9)) ?
                      reg26 : (~^(&(~wire6)))) ?
                  wire6 : wire9);
              reg32 <= $signed($unsigned((-wire9[(1'h1):(1'h0)])));
              reg33 <= (~(wire11[(4'hc):(3'h5)] ?
                  (8'ha3) : $signed({(7'h42), wire5})));
              reg34 <= (((~&wire11[(4'h9):(3'h4)]) || {({reg31, (7'h43)} ?
                          $unsigned(wire6) : $unsigned(reg30)),
                      ((+wire7) ? (wire6 >= wire7) : wire5[(4'he):(4'ha)])}) ?
                  ((wire6 ? wire8 : $signed(reg32)) ?
                      wire23[(5'h11):(4'ha)] : {(reg29 ^~ reg30[(2'h3):(1'h1)])}) : $unsigned((^(8'h9d))));
            end
          else
            begin
              reg30 <= $signed((wire5[(5'h11):(4'h9)] + reg27[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          reg25 <= (-{((&(|wire23)) > (8'h9c)), (8'hbc)});
          reg26 <= wire6[(1'h0):(1'h0)];
          reg27 <= reg28[(4'ha):(3'h7)];
          reg28 <= (&(wire23 ^~ ((((8'hb8) ? reg27 : wire9) ?
                  wire7[(1'h0):(1'h0)] : $unsigned(reg29)) ?
              reg28 : reg25)));
        end
      reg35 <= $signed(wire7[(3'h4):(3'h4)]);
      reg36 <= (reg25 ?
          (reg35 != {$unsigned((reg31 ?
                  reg26 : (8'h9c)))}) : wire7[(5'h10):(1'h0)]);
    end
  assign wire37 = $unsigned($unsigned(reg27));
  module38 #() modinst64 (.wire43(wire11), .wire41(reg29), .wire42(reg31), .wire40(wire9), .y(wire63), .clk(clk), .wire39(wire7));
  assign wire65 = $unsigned((^~(~&wire10[(1'h0):(1'h0)])));
  assign wire66 = wire10;
  assign wire67 = {(~|((~|wire9) + reg36))};
  assign wire68 = wire7;
  assign wire69 = $unsigned(wire66);
endmodule

module module38
#(parameter param62 = ((+(((~&(8'h9e)) ? {(8'haf), (8'ha7)} : ((8'haf) ? (8'haa) : (8'ha8))) ? (~{(8'hba)}) : (-((8'hb6) ? (8'ha6) : (8'hb6))))) >> {(~((-(8'hb0)) ? (^(8'hbf)) : ((8'haa) ? (8'ha4) : (8'ha4))))}))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire43;
  input wire [(4'hf):(1'h0)] wire42;
  input wire signed [(4'hf):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire40;
  input wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire44 = ((^~($unsigned((+(8'hb0))) << $signed((~|wire41)))) ?
                      ((wire41[(2'h2):(2'h2)] ?
                          wire42 : $signed(wire42)) <= (+$unsigned((wire42 ?
                          wire40 : wire39)))) : $signed((8'ha0)));
  assign wire45 = {(wire41 ?
                          ($unsigned((~&(8'hb9))) && wire40[(1'h1):(1'h1)]) : ($signed((wire39 ?
                                  wire41 : wire41)) ?
                              wire39[(2'h2):(2'h2)] : (-{wire39})))};
  assign wire46 = (8'hb8);
  assign wire47 = (~|$unsigned((wire39[(1'h1):(1'h0)] ?
                      $unsigned($unsigned(wire41)) : (8'ha5))));
  assign wire48 = wire45;
  always
    @(posedge clk) begin
      reg49 <= ({wire44[(1'h1):(1'h1)], {$unsigned({(8'hb3)})}} ?
          {$unsigned($unsigned((wire40 <= wire43))),
              (({wire47} ? {wire43, wire45} : $signed(wire39)) ?
                  {$unsigned(wire41)} : wire39[(4'hc):(1'h0)])} : (|(8'ha2)));
      reg50 <= wire40;
      reg51 <= {(reg50 != wire40)};
      reg52 <= ({wire41, wire48} && (-wire41[(3'h4):(2'h3)]));
      reg53 <= ($unsigned(reg50) ?
          $unsigned(($signed($unsigned(wire48)) & wire40[(4'h8):(3'h5)])) : $unsigned(({$unsigned(wire44)} ^ (-(reg49 << wire46)))));
    end
  assign wire54 = ({wire48[(2'h3):(1'h1)]} || {$unsigned(((|(8'hb9)) * wire48)),
                      (&{(8'hb2), $unsigned(wire40)})});
  assign wire55 = (^~reg53[(3'h7):(2'h2)]);
  assign wire56 = $unsigned((8'hac));
  assign wire57 = $signed((($unsigned((wire43 ~^ wire41)) <<< wire55[(1'h1):(1'h1)]) ?
                      (wire56 == reg53[(3'h5):(1'h0)]) : $signed(wire41[(2'h2):(1'h0)])));
  assign wire58 = wire54[(1'h0):(1'h0)];
  assign wire59 = (wire54[(3'h7):(3'h6)] ?
                      {(~&$unsigned((~|wire47)))} : $signed($signed($unsigned((&wire39)))));
  assign wire60 = ((|((~&(^wire42)) ?
                      $signed(wire44) : $signed((-wire58)))) - $unsigned((wire45[(1'h1):(1'h1)] > (wire54 ?
                      $unsigned(reg53) : wire58[(3'h6):(3'h4)]))));
  assign wire61 = {wire59};
endmodule

module module12
#(parameter param22 = (({(((8'hb8) ? (8'ha6) : (8'hae)) & ((8'hbd) ? (8'ha1) : (8'ha5))), (^~(+(8'hb0)))} | (({(8'hb9)} ? ((8'hbd) ? (8'hba) : (8'haf)) : (~^(8'ha4))) ^ (^~(&(8'hab))))) ? ((~(~&((8'hb6) >> (7'h40)))) ? (8'ha4) : (8'hb6)) : (7'h43)))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire14;
  input wire [(2'h3):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire17;
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  assign y = {wire21, wire20, wire17, reg19, reg18, (1'h0)};
  assign wire17 = wire16;
  always
    @(posedge clk) begin
      reg18 <= ((&wire13) ?
          ($unsigned(($unsigned((8'hbd)) == $signed(wire17))) != (~&(wire14 ?
              wire15 : (+wire17)))) : (wire16 == $signed($signed((wire13 ?
              wire13 : (8'hba))))));
      reg19 <= wire16;
    end
  assign wire20 = (($signed({((8'ha3) && (8'hbe)),
                      $unsigned(reg19)}) | wire13) || wire15[(3'h7):(3'h6)]);
  assign wire21 = ($unsigned(wire14) ^ reg18[(2'h2):(1'h1)]);
endmodule
