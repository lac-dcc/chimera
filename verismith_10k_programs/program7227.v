module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire56,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = ({$unsigned(wire0[(2'h2):(1'h0)]),
                         {((wire2 ~^ (7'h41)) ?
                                 wire0 : ((8'haf) ? (7'h43) : wire3)),
                             (&(wire2 || wire4))}} ?
                     (-wire2[(4'hd):(4'ha)]) : ($unsigned((wire4[(1'h0):(1'h0)] ?
                         (~(8'h9c)) : (wire1 ?
                             wire4 : wire2))) * $unsigned({((8'hb0) ?
                             wire2 : wire0)})));
  assign wire6 = $signed(((((|wire0) >= (wire1 <= wire2)) ?
                     wire4[(2'h3):(1'h1)] : ((wire4 || (8'hbb)) ?
                         $unsigned(wire4) : wire5[(4'h8):(1'h0)])) <<< $signed(($unsigned(wire0) >= wire1))));
  assign wire7 = (~&$unsigned(wire4[(1'h1):(1'h0)]));
  assign wire8 = (($unsigned(($unsigned(wire0) ?
                         (wire0 == (8'hba)) : (~&wire1))) << (((wire7 ?
                                 wire4 : wire3) ?
                             {wire2} : {wire4, wire5}) ?
                         wire6 : wire0)) ?
                     wire6 : (wire4 & (|(wire4[(1'h0):(1'h0)] && (wire3 > wire1)))));
  module9 #() modinst57 (.wire11(wire8), .wire13(wire6), .clk(clk), .y(wire56), .wire10(wire5), .wire12(wire2));
  assign wire58 = {$signed(wire4[(2'h3):(2'h2)]),
                      ((&({wire6} ? $signed(wire1) : ((8'ha6) || wire56))) ?
                          (&wire4[(2'h2):(1'h1)]) : {(~&(wire4 * wire0)),
                              $signed(wire7)})};
  assign wire59 = (({(^{(8'hbf)})} > $signed(((wire58 ?
                      wire3 : wire2) == {(8'ha0),
                      wire5}))) << wire58[(4'h9):(3'h7)]);
  assign wire60 = wire6;
endmodule

module module9
#(parameter param55 = (^((~(((8'hae) && (8'ha3)) ? ((8'ha7) ? (8'had) : (8'h9d)) : (~^(8'hb7)))) ? (|((8'ha3) ? ((8'h9c) ? (8'hb8) : (8'hb4)) : ((8'hac) - (7'h41)))) : (&((~^(8'hbd)) <<< (~&(8'hb3)))))))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire14;
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire46,
                 wire45,
                 wire43,
                 wire14,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire14 = $signed(({(~|$signed(wire10)),
                      ({wire13} ?
                          (^wire10) : $signed(wire11))} > $signed(wire12[(2'h3):(1'h1)])));
  module15 #() modinst44 (wire43, clk, wire14, wire13, wire12, wire11);
  assign wire45 = wire11[(4'he):(2'h2)];
  assign wire46 = (^~wire43[(4'hc):(4'ha)]);
  always
    @(posedge clk) begin
      if ($unsigned((((~|wire12[(4'h9):(1'h0)]) - wire43[(5'h14):(4'hb)]) != (($signed(wire45) == {wire11,
              (8'ha6)}) ?
          wire14 : $unsigned((wire14 ? wire11 : wire11))))))
        begin
          reg47 <= $signed(({{((8'h9f) > wire11), (&wire12)}} ?
              $signed(wire12) : (!(wire46[(4'ha):(4'ha)] ?
                  wire12 : (~|wire46)))));
        end
      else
        begin
          reg47 <= (reg47[(4'hc):(4'h9)] == wire11[(4'hc):(4'hb)]);
        end
      reg48 <= ((($signed($signed((8'haf))) ? (7'h40) : (!(8'h9e))) ?
          (^(-$unsigned(wire46))) : (((wire13 ~^ wire45) ?
              wire46[(4'h9):(4'h8)] : (wire46 >> wire13)) <= $unsigned($unsigned((8'ha4))))) != $unsigned({$unsigned(wire45[(4'h9):(1'h0)]),
          (wire11[(5'h10):(4'hc)] > wire43[(4'ha):(4'h8)])}));
      reg49 <= {({((wire12 >> wire14) ? wire13 : (~^wire14)),
                  $unsigned((wire10 ~^ wire46))} ?
              $signed($unsigned(reg47)) : $signed(wire13)),
          $signed($signed(($signed(wire13) ? (~wire45) : $signed(reg48))))};
      reg50 <= (wire46 ? wire14 : $unsigned(wire11));
    end
  assign wire51 = (|({wire45[(3'h7):(2'h3)],
                      ((^~(8'hb6)) ?
                          $unsigned(reg50) : $signed(reg50))} ^~ wire43[(4'ha):(4'h9)]));
  assign wire52 = ($signed(wire13[(4'ha):(3'h4)]) < {$unsigned((8'ha0))});
  assign wire53 = (^~(~&(((wire45 ? wire43 : reg48) ?
                      $signed(wire52) : wire12) & (wire12[(3'h5):(3'h5)] < (+wire11)))));
  assign wire54 = wire43;
endmodule

module module15
#(parameter param42 = (((^(^~((8'hbc) < (8'h9e)))) ? (8'ha8) : ({{(8'hba), (8'ha2)}} ? ((~^(8'ha1)) ? ((8'hbb) > (8'ha8)) : {(8'ha8)}) : (|((8'hbe) ? (8'ha2) : (7'h42))))) ? ({{((7'h40) ? (8'hac) : (8'haf))}} ? (((^(8'ha3)) ? {(8'had), (8'hbf)} : ((7'h42) << (8'haf))) + (~^((8'hab) ~^ (8'haa)))) : (({(8'hb3), (7'h43)} >= (-(8'hb2))) ? (|((8'hab) | (7'h42))) : ((^(8'ha9)) ? ((8'ha0) | (8'had)) : ((8'hbc) ? (8'ha9) : (8'h9d))))) : {(~^{((8'ha6) >>> (8'hac)), ((8'hba) << (8'ha5))}), ((~&(~^(8'ha4))) >>> ((&(8'hb8)) ? ((8'hb6) >= (8'hb2)) : ((8'hb0) - (8'ha5))))}))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire18;
  input wire [(4'h9):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire20 = ((wire19 <= (($unsigned(wire17) ?
                              wire16[(4'hf):(4'hf)] : (wire17 * wire18)) ?
                          $signed((^wire18)) : $unsigned((wire19 < wire19)))) ?
                      $signed((wire19[(4'hd):(2'h2)] || ((^~wire18) << {wire19}))) : {wire16,
                          $signed(wire19)});
  assign wire21 = $signed(wire18[(3'h7):(2'h3)]);
  assign wire22 = $signed({$unsigned(wire18[(5'h10):(5'h10)]), wire17});
  assign wire23 = wire17;
  assign wire24 = $signed($signed(($signed(wire17[(3'h5):(3'h5)]) ?
                      (wire21 ?
                          {wire21} : (~|wire16)) : wire22[(1'h1):(1'h1)])));
  assign wire25 = (wire18[(4'h8):(4'h8)] ? wire21 : wire16);
  assign wire26 = (|($signed((~&$signed(wire20))) ?
                      wire20[(2'h2):(2'h2)] : (-wire23[(2'h3):(2'h2)])));
  assign wire27 = $unsigned(($unsigned((-(wire23 ?
                      wire21 : wire21))) * wire18));
  assign wire28 = wire22[(4'h8):(1'h0)];
  assign wire29 = wire28[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg30 <= (wire21 ? wire29 : wire22);
      reg31 <= ($unsigned(($signed(((8'hae) ? wire28 : (8'ha2))) ?
          (!$unsigned(wire16)) : $unsigned((wire28 ?
              wire16 : wire19)))) >> $signed(wire26));
      reg32 <= (+wire23[(1'h1):(1'h1)]);
      reg33 <= $unsigned($unsigned($signed(wire19)));
    end
  assign wire34 = (|$signed($unsigned(wire27)));
  assign wire35 = wire28[(3'h6):(3'h4)];
  assign wire36 = (^~$unsigned(wire28));
  assign wire37 = ((((wire26 ?
                      $unsigned((8'hb5)) : (~^reg32)) <= $unsigned((&wire28))) != wire24[(2'h2):(1'h1)]) != (reg30[(4'h9):(1'h0)] <<< wire34[(1'h0):(1'h0)]));
  assign wire38 = ($signed(((wire17[(3'h4):(1'h1)] ?
                      $unsigned(wire35) : (wire36 ?
                          wire20 : wire21)) >>> ((^(8'hab)) ?
                      (wire19 - wire24) : (wire27 == wire24)))) ^ wire21[(2'h2):(2'h2)]);
  assign wire39 = wire35[(2'h3):(1'h0)];
  assign wire40 = $signed((({(wire20 | wire34),
                      (~|wire16)} ^~ $signed((^(8'haf)))) | ($signed(wire24[(2'h2):(2'h2)]) && wire21)));
  assign wire41 = reg30;
endmodule
