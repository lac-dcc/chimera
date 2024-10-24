module top
#(parameter param95 = ((((|{(8'hbd)}) ? (8'hb1) : (((8'hb0) < (8'ha2)) << ((8'hb3) <<< (8'hac)))) <<< {((~^(8'ha7)) ? ((8'hb9) == (8'hac)) : (8'hb0))}) + (+(^{(~^(8'hb3)), (|(8'hb1))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire6;
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire88, wire6, reg94, reg93, reg92, reg91, reg90, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ((-$unsigned((wire3[(1'h0):(1'h0)] ? {wire2, wire3} : {wire3}))) ?
          $unsigned($unsigned((+wire2[(1'h0):(1'h0)]))) : $unsigned((!$unsigned({wire3}))));
    end
  assign wire6 = (~|$unsigned(reg5[(5'h13):(4'hb)]));
  module7 #() modinst89 (wire88, clk, wire6, wire4, wire1, wire3);
  always
    @(posedge clk) begin
      reg90 <= (((((reg5 ? (8'ha3) : wire3) ?
                  ((8'hb8) < wire2) : $signed(wire2)) ?
              ((^~wire6) ?
                  $signed(wire4) : (wire6 != reg5)) : (&(-reg5))) <<< wire2) ?
          wire0[(4'hb):(2'h3)] : ((|$signed(wire3[(1'h0):(1'h0)])) ?
              {{$unsigned(reg5), $signed(wire0)}} : wire0[(5'h11):(4'hd)]));
      reg91 <= $signed($signed(((^~reg5) > (((7'h41) ? wire3 : wire1) ?
          (wire1 || (8'hb8)) : {wire1, reg90}))));
      reg92 <= ($unsigned($signed(reg91)) ?
          ($signed(((reg91 ? wire4 : wire88) ?
              $signed(wire4) : wire2[(1'h0):(1'h0)])) && ({wire3[(4'hd):(3'h4)]} << $signed($unsigned(wire2)))) : $unsigned(({$unsigned(wire1)} != wire2[(2'h2):(2'h2)])));
      reg93 <= $signed({((&(reg5 - wire0)) ? reg5 : $signed(wire2)), reg90});
      reg94 <= ((wire2[(1'h0):(1'h0)] <<< reg5) ?
          $unsigned((!$signed({wire0, reg93}))) : (&wire4[(1'h1):(1'h0)]));
    end
endmodule

module module7
#(parameter param86 = ((~((((8'hb3) < (8'ha3)) ? ((8'hbe) ^~ (8'haa)) : ((8'hbf) & (8'ha2))) << (((8'hae) ? (8'hb4) : (8'hb0)) | (~(8'hb1))))) ? {(~|((!(8'ha2)) ? ((8'hbd) | (8'ha3)) : (|(8'hb8))))} : {((8'hb4) ? (~|((8'hb8) ? (8'hb6) : (8'hb9))) : (((8'ha8) ^ (8'hac)) != ((7'h43) > (8'hac)))), (8'ha4)}), 
parameter param87 = (((((!param86) && param86) ? {(param86 ? param86 : (8'hac)), (param86 ? param86 : param86)} : param86) | param86) ? (~|{param86, (~param86)}) : {(param86 ? ((param86 ? param86 : (8'hb1)) | param86) : ((param86 ? param86 : (7'h44)) >> param86)), (~^((8'ha2) || (param86 >>> param86)))}))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire82;
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  assign y = {wire40,
                 wire42,
                 wire43,
                 wire44,
                 wire82,
                 reg85,
                 reg84,
                 reg46,
                 reg45,
                 (1'h0)};
  module12 #() modinst41 (.clk(clk), .wire13((8'ha5)), .wire16(wire10), .y(wire40), .wire17(wire8), .wire15(wire9), .wire14(wire11));
  assign wire42 = (~^$signed(wire9));
  assign wire43 = (8'hb2);
  assign wire44 = wire42;
  always
    @(posedge clk) begin
      reg45 <= (~wire44[(3'h6):(2'h2)]);
      reg46 <= $unsigned((-(8'had)));
    end
  module47 #() modinst83 (.clk(clk), .wire51(wire42), .wire50(wire11), .y(wire82), .wire48(wire40), .wire49(wire9), .wire52(wire8));
  always
    @(posedge clk) begin
      reg84 <= ((wire40 ^~ $signed(wire42[(2'h3):(1'h1)])) ?
          {wire9[(3'h6):(3'h6)]} : $unsigned($signed(wire11)));
      reg85 <= (($signed(reg46) * {(reg84[(4'h9):(2'h3)] ?
              $signed(wire82) : reg84[(4'h8):(4'h8)])}) != wire42);
    end
endmodule

module module47
#(parameter param81 = (~&((~^({(8'h9c), (8'ha1)} ? {(8'hb1)} : (~|(8'hae)))) & {(((8'hba) ? (8'hbd) : (7'h42)) >> ((8'ha2) && (8'ha3)))})))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire52;
  input wire [(2'h2):(1'h0)] wire51;
  input wire [(3'h6):(1'h0)] wire50;
  input wire [(5'h15):(1'h0)] wire49;
  input wire [(4'h8):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire53;
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire53,
                 reg78,
                 reg77,
                 reg76,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire53 = $signed((~|$unsigned($unsigned((wire52 ? wire49 : wire49)))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((|(^(+wire50))))))
        begin
          reg54 <= wire48[(3'h4):(1'h0)];
          reg55 <= (((reg54 - (~^(-wire48))) ?
              $unsigned(((^wire49) > $unsigned(wire48))) : (reg54[(3'h6):(3'h4)] + {((8'hbb) && (8'had)),
                  (7'h43)})) - $signed($signed((~$signed(wire50)))));
          reg56 <= (~^{(wire52 ? (~&(8'h9f)) : wire53)});
          reg57 <= (($unsigned(((wire48 ?
                  reg56 : reg56) ^ wire48[(4'h8):(3'h5)])) ^ (wire51 ?
                  (wire48 ?
                      (^(8'hb6)) : $unsigned(wire49)) : (-((8'h9f) * wire51)))) ?
              reg55 : (^($signed((reg56 & wire52)) && wire53[(1'h0):(1'h0)])));
          reg58 <= $unsigned(($signed(reg54) ?
              (^$unsigned((+reg54))) : wire48));
        end
      else
        begin
          reg54 <= $unsigned(wire51[(1'h0):(1'h0)]);
        end
      reg59 <= reg55[(2'h2):(1'h0)];
      reg60 <= (wire52[(4'h8):(4'h8)] ?
          (8'hb6) : (reg59 & $unsigned(wire52[(3'h4):(3'h4)])));
    end
  assign wire61 = $signed((((-(8'hbc)) ?
                      {reg54[(4'hd):(3'h7)]} : $unsigned((|reg54))) - $signed((wire52[(2'h3):(1'h0)] < $signed((7'h41))))));
  assign wire62 = {((8'ha6) << $signed(((wire61 && wire53) ?
                          $signed(reg55) : $unsigned(wire48)))),
                      ($signed(wire61[(1'h1):(1'h0)]) == (((|wire50) * wire48) ?
                          ((wire50 ? (8'hab) : reg59) || reg55) : (wire49 ?
                              reg55 : $signed(wire53))))};
  assign wire63 = wire61;
  assign wire64 = $unsigned((((-$unsigned(wire49)) << $unsigned((reg54 ^~ reg59))) <<< reg55));
  assign wire65 = $signed((8'hb7));
  assign wire66 = $unsigned((wire52[(3'h7):(3'h4)] ?
                      $signed((((8'ha1) >>> wire49) * wire50[(1'h1):(1'h1)])) : reg55));
  assign wire67 = $unsigned($unsigned(reg58));
  always
    @(posedge clk) begin
      reg68 <= wire63;
      reg69 <= wire50[(3'h4):(1'h0)];
      reg70 <= (~|$signed((((reg60 ? wire61 : (8'h9e)) ?
              reg57[(1'h0):(1'h0)] : {reg55, wire61}) ?
          $unsigned(reg56) : $unsigned($unsigned(reg54)))));
      reg71 <= $signed((+($signed((reg70 ? reg55 : wire62)) ?
          wire48 : $unsigned((~^wire52)))));
    end
  assign wire72 = (reg55 && wire66);
  assign wire73 = {$signed((8'hac)),
                      (|(|{(reg59 != (8'ha5)), $signed(reg70)}))};
  assign wire74 = (reg69 || ((~|wire66) - wire48[(1'h1):(1'h1)]));
  assign wire75 = ({(wire66[(4'ha):(2'h3)] ^ reg60)} || (wire73 ?
                      (^~wire53) : $signed((~(8'haf)))));
  always
    @(posedge clk) begin
      reg76 <= (($signed($unsigned(wire67[(4'h8):(3'h4)])) ?
              (~^((reg59 ?
                  reg58 : wire63) < $unsigned(wire66))) : ((~&(wire64 >= reg69)) & $signed((wire48 | wire48)))) ?
          $signed(reg69) : $signed(wire50[(2'h2):(2'h2)]));
      reg77 <= ((~^(wire48[(2'h3):(1'h0)] ?
              {(!wire48)} : ($unsigned(wire53) ?
                  wire67 : (reg57 ? wire72 : wire53)))) ?
          $signed(wire65) : {((~(8'ha5)) & (&(wire53 ? reg60 : reg59))),
              ((~^wire51[(1'h1):(1'h0)]) ?
                  (&$unsigned(wire63)) : (wire64 != wire67[(3'h6):(2'h3)]))});
      reg78 <= $unsigned((8'ha5));
    end
  assign wire79 = wire72[(2'h2):(1'h0)];
  assign wire80 = $unsigned(wire72);
endmodule

module module12
#(parameter param39 = {((~&(|(&(8'ha5)))) ? (({(8'hb0), (8'hb5)} ? (+(8'h9e)) : ((8'hb3) ? (8'haa) : (8'hae))) == (8'h9f)) : (8'hb5))})
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire [(3'h4):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg22,
                 (1'h0)};
  assign wire18 = (|(~(~wire13[(4'ha):(3'h6)])));
  assign wire19 = $signed((|$signed(({wire16} <= wire15))));
  assign wire20 = {((wire15 >>> ($signed(wire17) ^~ {wire18})) == wire14),
                      (8'had)};
  assign wire21 = $signed($unsigned((((wire14 ? wire20 : wire15) ?
                          (wire14 <= wire18) : (8'had)) ?
                      ((~&wire14) ? (~|wire19) : $unsigned(wire20)) : wire17)));
  always
    @(posedge clk) begin
      reg22 <= (wire16[(4'hb):(4'ha)] ^ {({wire15} ?
              wire16 : $unsigned($unsigned(wire20)))});
    end
  assign wire23 = wire15;
  assign wire24 = wire19;
  assign wire25 = ($signed(wire15[(4'he):(4'hb)]) ? (8'hb8) : wire19);
  assign wire26 = wire14;
  assign wire27 = (!({$signed(((8'hbf) * wire23)),
                          $signed((wire19 ^~ wire25))} ?
                      $signed(($unsigned(wire23) ?
                          wire24 : $signed(wire15))) : ($signed(wire13) ?
                          {(wire17 & wire23), $unsigned(wire20)} : ((wire26 ?
                              wire16 : wire25) || (8'h9e)))));
  assign wire28 = wire21;
  always
    @(posedge clk) begin
      reg29 <= (+$signed(($signed(wire26) | $unsigned((wire16 ?
          wire28 : wire26)))));
      if ((~|wire14))
        begin
          reg30 <= $unsigned(wire28);
          reg31 <= $signed($signed(($signed($signed(wire17)) ^~ $unsigned($unsigned(wire24)))));
          if ((wire18[(1'h1):(1'h0)] <<< wire19))
            begin
              reg32 <= $unsigned({($signed(reg29[(4'h8):(1'h0)]) <<< (&(reg29 ?
                      wire13 : wire25))),
                  ($signed($signed((7'h41))) ?
                      wire13[(4'h8):(3'h5)] : (7'h40))});
              reg33 <= $signed(wire17);
              reg34 <= wire20[(4'ha):(1'h0)];
              reg35 <= $signed(((~&(~$signed(wire25))) + $signed((^$signed(wire23)))));
            end
          else
            begin
              reg32 <= $signed($signed($signed(wire28)));
              reg33 <= wire27;
              reg34 <= wire25[(2'h3):(2'h2)];
              reg35 <= $signed({{$signed((reg34 ? wire28 : (7'h41))),
                      $signed((wire28 ? (8'ha8) : wire15))}});
            end
          if (reg34[(2'h3):(2'h2)])
            begin
              reg36 <= wire25[(2'h3):(2'h3)];
            end
          else
            begin
              reg36 <= $signed(((~&wire20[(4'h8):(1'h1)]) & (wire16[(4'ha):(3'h5)] <= wire19[(4'ha):(4'ha)])));
              reg37 <= (reg33[(4'hc):(3'h6)] ?
                  $signed($signed(reg34)) : ((((wire20 ?
                              wire23 : reg22) <= $unsigned(wire19)) ?
                          (|$unsigned(wire18)) : reg32) ?
                      wire28 : (wire24 ?
                          ((wire23 ? wire13 : wire23) ?
                              (reg34 ? wire23 : wire27) : (reg33 ?
                                  reg31 : (8'hb7))) : wire27[(4'h9):(3'h6)])));
            end
        end
      else
        begin
          reg30 <= reg29;
        end
    end
  always
    @(posedge clk) begin
      reg38 <= reg37[(4'hf):(4'hb)];
    end
endmodule
