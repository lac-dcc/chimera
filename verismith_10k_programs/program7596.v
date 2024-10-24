module top
#(parameter param54 = ({{(((8'hab) ? (8'ha0) : (8'hbd)) ? ((8'hab) ^ (8'hb9)) : (|(8'ha2))), (((8'hb1) ~^ (8'h9f)) > {(8'hb3), (8'haa)})}} ? (({(~&(7'h40)), ((8'hb8) ? (8'hb4) : (8'h9e))} & (~{(8'hbc), (8'h9c)})) ? (!(|(~(8'ha2)))) : ((((8'hb7) ? (8'hb5) : (8'haa)) + (-(8'hb4))) & (((8'ha1) >= (7'h42)) ? {(7'h43), (7'h40)} : ((8'hb0) >> (8'ha4))))) : (((8'haa) ? (~^((8'hb2) - (8'hba))) : ((+(8'hb6)) >= (^~(8'hb5)))) ? ((8'had) ? (~|((8'ha6) & (8'ha9))) : (|((8'ha0) > (8'ha7)))) : (!(((7'h43) ? (7'h43) : (8'hb1)) ? ((8'had) ? (7'h41) : (8'hae)) : {(8'hab), (8'ha9)})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire44;
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  assign y = {wire53,
                 wire4,
                 wire44,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire4 = ($unsigned(($signed((wire0 != wire1)) ?
                     ($unsigned(wire2) ?
                         wire3 : (wire3 > wire1)) : (|(wire1 >> wire3)))) <<< ($unsigned(((wire3 ?
                         (7'h42) : wire1) ?
                     $unsigned((8'h9c)) : $unsigned((8'h9e)))) >>> ((wire1 ?
                         ((8'hb5) ? wire0 : wire2) : $signed(wire2)) ?
                     (wire3 ^ wire0) : $unsigned((wire2 != wire2)))));
  module5 #() modinst45 (wire44, clk, wire2, wire1, wire0, wire3, wire4);
  always
    @(posedge clk) begin
      if ((!wire0))
        begin
          if (wire2)
            begin
              reg46 <= (wire1[(3'h4):(2'h3)] ~^ (+({(|wire3)} ?
                  wire3 : wire2[(3'h4):(3'h4)])));
              reg47 <= $unsigned({(wire44 ?
                      ((wire4 ? wire3 : (8'hb0)) ?
                          {wire3} : (wire0 != wire2)) : ({wire1, wire3} ?
                          (wire1 ? reg46 : wire44) : (wire4 ?
                              wire3 : (8'h9c))))});
              reg48 <= wire4;
              reg49 <= wire4[(5'h11):(1'h1)];
            end
          else
            begin
              reg46 <= ((&reg47) >= reg47[(5'h10):(3'h4)]);
              reg47 <= $unsigned((+(+(~&wire4[(4'hf):(4'hf)]))));
            end
        end
      else
        begin
          reg46 <= reg48;
          reg47 <= $unsigned($signed((&(wire44 == {reg48}))));
          if ({(~&(|$unsigned(reg46))), wire3[(2'h3):(2'h2)]})
            begin
              reg48 <= (^~$signed(({((8'had) ? reg48 : wire44),
                      wire4[(4'he):(4'hc)]} ?
                  wire0 : wire2)));
              reg49 <= (|((((reg49 ? wire3 : (8'had)) ?
                  $unsigned(wire2) : {wire44}) >= ($unsigned(wire1) != reg49)) != (^~{(wire44 ?
                      wire44 : wire0),
                  {wire2}})));
              reg50 <= reg48[(1'h0):(1'h0)];
            end
          else
            begin
              reg48 <= $unsigned(reg49[(4'he):(4'hd)]);
              reg49 <= wire3;
              reg50 <= ($unsigned($signed((8'hbf))) ^~ reg49);
              reg51 <= ($unsigned(reg49[(4'ha):(4'ha)]) ^ reg46);
            end
          reg52 <= (8'hbf);
        end
    end
  assign wire53 = $signed((($signed((reg48 > (7'h41))) ?
                          reg48[(3'h6):(2'h3)] : reg50[(5'h14):(4'ha)]) ?
                      $unsigned((~|$signed((8'hb3)))) : (reg51 <= ((wire4 ?
                              reg47 : (8'hb8)) ?
                          wire44[(3'h5):(3'h5)] : (wire44 || wire1)))));
endmodule

module module5
#(parameter param43 = (|(!(({(8'hb8)} ? ((8'hab) ? (8'hb4) : (8'ha7)) : ((8'haa) >= (8'ha2))) ? (&{(7'h40), (8'ha3)}) : ((+(8'haf)) ? (^~(8'ha4)) : ((8'hb5) ? (8'ha7) : (8'hbf)))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire27;
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire30,
                 wire29,
                 wire11,
                 wire27,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire11 = wire10;
  module12 #() modinst28 (.clk(clk), .wire14(wire11), .wire16(wire8), .wire13(wire9), .y(wire27), .wire15(wire10), .wire17(wire6));
  assign wire29 = (~^wire6);
  assign wire30 = wire29;
  always
    @(posedge clk) begin
      reg31 <= wire30;
      reg32 <= (~^wire8);
      reg33 <= wire8;
    end
  assign wire34 = wire8[(1'h0):(1'h0)];
  assign wire35 = $signed(reg32);
  assign wire36 = wire8;
  assign wire37 = reg32;
  assign wire38 = $unsigned(wire36);
  assign wire39 = $unsigned((~^$signed($unsigned(wire34[(1'h1):(1'h0)]))));
  assign wire40 = (&($signed((&(wire8 ? wire38 : wire36))) ?
                      $unsigned(((reg33 ? wire36 : wire35) * (wire27 ?
                          (8'h9e) : (8'hbe)))) : (!$signed(wire34[(1'h1):(1'h0)]))));
  assign wire41 = wire11[(1'h1):(1'h1)];
  assign wire42 = wire9[(2'h2):(1'h0)];
endmodule

module module12
#(parameter param25 = {{(^~(((8'hb1) ? (8'hba) : (8'h9f)) << (8'ha7))), (((-(8'hba)) ? ((8'hb1) ? (8'hbd) : (8'ha1)) : ((8'h9d) ~^ (8'hb4))) != (&(~(8'ha0))))}, ((~&(~&(~|(8'had)))) ? (~|({(8'h9f)} >> (^(8'h9d)))) : ({(^~(8'hb7))} ? (((8'hb3) ? (8'hab) : (8'hb6)) ? ((8'haa) >> (8'hb3)) : ((7'h42) ? (8'hba) : (7'h42))) : {((8'ha1) ? (8'ha7) : (8'hb4)), ((7'h43) ? (8'hbc) : (8'ha9))}))}, 
parameter param26 = (^((({param25, (8'hb2)} << ((7'h42) ? param25 : param25)) ? {{param25, param25}, (|param25)} : ((!param25) ? (param25 * param25) : {param25})) ? param25 : param25)))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire17;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  assign y = {wire24, wire23, wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = (((~&((wire16 >>> (8'ha1)) ?
                          wire14 : wire14[(3'h6):(3'h5)])) ^~ $signed($signed($signed(wire15)))) ?
                      $unsigned((~|((wire13 | wire13) >>> (wire14 ?
                          wire17 : wire14)))) : wire13);
  assign wire19 = wire18;
  assign wire20 = {$unsigned((~((&wire17) ?
                          (wire19 ? wire13 : (8'hbd)) : wire18)))};
  assign wire21 = (($unsigned((-$signed(wire20))) ^~ wire14[(2'h3):(2'h2)]) ?
                      $unsigned(({$signed(wire16), $signed(wire15)} ?
                          $unsigned($signed(wire14)) : wire19)) : (wire20[(1'h1):(1'h1)] ?
                          $unsigned((~$signed(wire18))) : (~$signed(wire16))));
  assign wire22 = ((wire16[(3'h4):(2'h2)] >> $signed((8'hac))) ?
                      (((^~$unsigned(wire13)) ?
                              (wire18 ^~ (wire15 && (7'h40))) : wire17[(4'ha):(1'h1)]) ?
                          wire20[(1'h1):(1'h0)] : (wire20[(3'h5):(3'h5)] ?
                              (wire14 ?
                                  {(8'hb8)} : wire14[(3'h4):(1'h1)]) : (wire13[(4'hd):(4'hb)] && wire21[(1'h1):(1'h0)]))) : $signed(wire20));
  assign wire23 = ($unsigned(wire20[(3'h7):(1'h0)]) != {wire14,
                      ({(wire18 ? wire18 : wire19)} == {((7'h44) << wire21),
                          wire15})});
  assign wire24 = (+(~&$unsigned($unsigned((&(8'hab))))));
endmodule
