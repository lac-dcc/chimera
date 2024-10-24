module top
#(parameter param63 = ({((8'ha9) ? (~|((8'h9e) & (8'hb7))) : (((8'hb3) ? (8'hb7) : (8'ha0)) | ((8'ha3) ? (7'h40) : (8'haa))))} ? (~^((((8'h9e) ? (8'haa) : (8'hbd)) ? ((8'ha3) + (8'ha7)) : ((8'ha0) ? (8'h9d) : (8'ha1))) << (~^{(8'ha2), (8'hb8)}))) : ((~&{(~&(8'hac)), {(8'ha7), (8'hb9)}}) <= {(|((8'haa) == (8'hae))), ({(8'hbd)} ? ((8'hac) & (7'h40)) : ((8'hba) >>> (8'ha5)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire56;
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire4,
                 wire5,
                 wire6,
                 wire56,
                 (1'h0)};
  assign wire4 = ({wire3[(1'h0):(1'h0)],
                         ((wire3[(1'h1):(1'h0)] ?
                             $signed(wire1) : {wire0,
                                 wire1}) - $unsigned((|(7'h42))))} ?
                     wire0 : ((^~((wire0 ?
                             (8'hb8) : wire1) ~^ wire0[(1'h0):(1'h0)])) ?
                         ((7'h40) - $signed(((8'hbe) ?
                             (8'hbf) : (8'hb9)))) : $unsigned($unsigned({wire1}))));
  assign wire5 = (wire0 ? wire4 : wire2[(2'h2):(1'h1)]);
  assign wire6 = ($signed($unsigned(((wire0 <= wire1) ?
                         $signed(wire0) : (wire5 | wire1)))) ?
                     (!$unsigned(wire2)) : (!wire2));
  module7 #() modinst57 (.wire10(wire1), .wire9(wire4), .wire11(wire3), .wire8(wire0), .y(wire56), .clk(clk), .wire12(wire2));
  assign wire58 = (~(wire56 ?
                      (wire56[(2'h3):(1'h0)] ?
                          (wire5[(3'h7):(2'h2)] != (wire6 ?
                              (8'ha6) : wire1)) : {(wire2 ?
                                  wire1 : wire56)}) : $unsigned((wire2 ?
                          $unsigned(wire4) : (-(8'ha1))))));
  assign wire59 = (~({(wire6[(3'h7):(3'h5)] ? (&(8'had)) : {wire58, wire6}),
                      (8'hb6)} + wire0));
  assign wire60 = (({$unsigned($unsigned((8'hb4)))} ?
                          $unsigned(($unsigned((8'haa)) + (wire3 || (7'h44)))) : $unsigned($unsigned($signed(wire56)))) ?
                      {$unsigned((!$unsigned(wire59))),
                          (($unsigned(wire2) <= $signed(wire58)) & $unsigned((wire2 == wire1)))} : wire5[(3'h7):(1'h1)]);
  assign wire61 = (-wire59);
  assign wire62 = $unsigned(wire6[(3'h4):(2'h3)]);
endmodule

module module7
#(parameter param54 = (~((+(((8'hb3) ? (8'ha8) : (8'h9c)) >= ((8'haa) >>> (8'haa)))) != ((((8'ha6) & (8'haf)) || {(8'ha5), (8'hb8)}) ? (((8'ha0) ? (8'hbe) : (8'hba)) ? {(8'ha0)} : (!(8'hb7))) : (+((8'ha8) * (8'hb6)))))), 
parameter param55 = (8'hb2))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire47;
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  assign y = {wire51, wire50, wire49, wire47, reg53, reg52, (1'h0)};
  module13 #() modinst48 (wire47, clk, wire10, wire12, wire11, wire9, wire8);
  assign wire49 = wire9[(4'hf):(4'h8)];
  assign wire50 = {$unsigned(((!((8'ha7) >>> wire10)) ?
                          (-$signed(wire12)) : ($unsigned(wire12) <<< (wire47 ?
                              (8'ha1) : wire49))))};
  assign wire51 = (($signed(wire49[(2'h2):(1'h1)]) ?
                          ((wire47[(3'h4):(2'h2)] || (wire50 ?
                                  wire8 : (8'ha7))) ?
                              ($unsigned(wire8) ?
                                  $signed((8'h9e)) : wire12) : wire47[(2'h3):(2'h2)]) : (~^wire9[(4'hc):(4'h9)])) ?
                      (($unsigned($signed(wire9)) >> (wire47 != (8'hb8))) ?
                          (8'hbc) : wire10[(5'h10):(4'h8)]) : ((|$signed($signed(wire47))) << wire50[(5'h10):(1'h1)]));
  always
    @(posedge clk) begin
      reg52 <= (wire8 ? $unsigned($unsigned(wire50)) : wire51[(1'h1):(1'h1)]);
      reg53 <= {($unsigned(($unsigned(reg52) ?
              wire12 : (wire50 & wire9))) ^ wire47[(1'h1):(1'h0)])};
    end
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(3'h5):(1'h0)] wire17;
  input wire signed [(3'h5):(1'h0)] wire16;
  input wire signed [(5'h10):(1'h0)] wire15;
  input wire [(4'hd):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg29,
                 (1'h0)};
  assign wire19 = $signed(({(+wire15),
                      ((7'h44) ?
                          {wire14} : $signed(wire18))} != (($signed(wire14) ?
                      (&wire15) : wire15[(4'h8):(2'h2)]) <= wire14[(2'h3):(2'h3)])));
  assign wire20 = $signed(wire14[(2'h3):(2'h3)]);
  assign wire21 = $signed((~^$unsigned($unsigned($signed(wire20)))));
  assign wire22 = wire15[(3'h4):(2'h3)];
  assign wire23 = wire18;
  assign wire24 = wire16;
  assign wire25 = wire14;
  assign wire26 = $signed($signed((!(|(wire19 ? wire14 : wire22)))));
  assign wire27 = $signed(wire20);
  assign wire28 = (8'h9d);
  always
    @(posedge clk) begin
      reg29 <= (wire23 ?
          (~&($signed($signed(wire26)) ?
              $signed((wire17 ?
                  wire16 : wire14)) : wire18[(4'h9):(3'h5)])) : wire22);
    end
  assign wire30 = ($unsigned($signed((8'hba))) <<< $unsigned($unsigned((8'had))));
  assign wire31 = wire30[(4'h9):(3'h5)];
  assign wire32 = wire16[(1'h1):(1'h0)];
  assign wire33 = wire24[(3'h6):(3'h6)];
  assign wire34 = wire27[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (reg29[(3'h6):(3'h6)])
        begin
          reg35 <= {($unsigned(wire27[(2'h3):(2'h2)]) ?
                  ((^(~|wire20)) << wire19) : (|((-wire34) >= wire21))),
              wire23[(2'h2):(1'h0)]};
          reg36 <= wire34;
          if ($unsigned((~^wire24[(2'h2):(1'h0)])))
            begin
              reg37 <= wire22[(2'h2):(2'h2)];
              reg38 <= {(~&$unsigned($signed($unsigned(wire34)))),
                  {$unsigned((+(wire34 ~^ (8'ha9)))), wire23[(4'ha):(1'h0)]}};
              reg39 <= ((^~($unsigned(wire34[(3'h6):(3'h4)]) | ((wire19 ?
                      wire24 : wire17) ?
                  $signed(wire34) : (wire34 ?
                      (8'hb1) : wire16)))) >>> (&wire16));
            end
          else
            begin
              reg37 <= (~|wire15);
              reg38 <= reg39[(3'h6):(2'h2)];
              reg39 <= ($unsigned(wire31) ?
                  $unsigned(($unsigned(wire16) ^ {{reg39},
                      wire16[(2'h2):(2'h2)]})) : (~|$signed(wire27)));
            end
          reg40 <= wire32[(2'h2):(2'h2)];
        end
      else
        begin
          reg35 <= wire14[(3'h6):(2'h3)];
        end
    end
  assign wire41 = $signed((&((reg40[(1'h0):(1'h0)] ?
                          $signed(wire21) : {wire21, wire21}) ?
                      wire27[(3'h5):(2'h3)] : ($unsigned(wire21) - {reg36}))));
  assign wire42 = ((+(reg29[(1'h1):(1'h0)] && reg29)) ?
                      (((wire24 ?
                              wire32[(2'h2):(1'h0)] : wire34[(2'h2):(2'h2)]) ^~ wire32) ?
                          (~^$unsigned({reg39,
                              wire21})) : reg29) : (({$signed(reg29),
                              {(8'hbf), (8'hae)}} & wire21) ?
                          (&$unsigned((wire30 <<< wire15))) : (7'h44)));
  assign wire43 = wire21[(1'h0):(1'h0)];
  assign wire44 = (&($unsigned(wire34[(2'h2):(1'h1)]) >>> $unsigned($signed(wire30))));
  assign wire45 = $unsigned((^~(wire41 ? (8'hae) : {$unsigned(wire34)})));
  assign wire46 = ({$signed((^(reg39 ? (8'hbc) : (8'hb0))))} ?
                      $unsigned($unsigned(wire19)) : $signed(((~|$unsigned(wire23)) + $unsigned((wire41 << (8'hb6))))));
endmodule
