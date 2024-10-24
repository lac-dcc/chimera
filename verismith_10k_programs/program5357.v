module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire82,
                 wire70,
                 wire67,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
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
                 reg69,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed(((wire4 == wire4) ?
                     {$unsigned({wire1}),
                         wire3[(4'h9):(3'h5)]} : (~|$signed(wire1))));
  assign wire6 = wire2[(5'h12):(3'h7)];
  assign wire7 = ({(wire4[(5'h11):(2'h2)] - $unsigned((wire1 ?
                             wire2 : (8'ha6))))} ?
                     $signed(wire0[(5'h10):(4'h8)]) : (wire2[(2'h2):(2'h2)] >>> (($unsigned((8'hae)) ?
                             wire3[(3'h6):(1'h0)] : wire3) ?
                         $signed((wire2 > wire1)) : (!wire6[(5'h11):(5'h11)]))));
  always
    @(posedge clk) begin
      reg8 <= $unsigned(($signed((&(wire1 < (8'ha1)))) ?
          wire4[(3'h5):(2'h3)] : $unsigned((|{wire3}))));
      reg9 <= (7'h44);
    end
  assign wire10 = ($signed((|$signed($signed((7'h42))))) ?
                      (((^wire3) ?
                          wire7 : (~^wire6)) ^ wire3) : ((($signed(wire3) >> wire2[(4'ha):(3'h5)]) ?
                          wire6 : wire4) > (reg8 ?
                          (8'hae) : $signed(wire3[(2'h3):(2'h2)]))));
  assign wire11 = ({(reg9 ?
                              $signed(wire2[(4'hb):(3'h5)]) : ({wire10,
                                  wire0} && wire6[(4'h8):(3'h7)]))} ?
                      (8'hbc) : $signed(((wire4 ?
                          (wire1 && wire3) : $signed(wire4)) || ({wire0,
                          wire7} ^ (wire3 ? wire5 : wire3)))));
  assign wire12 = wire6;
  assign wire13 = ((~$signed($signed($unsigned(wire7)))) == reg8);
  assign wire14 = $unsigned($unsigned(reg9));
  assign wire15 = wire0;
  assign wire16 = $signed($signed({(~^(wire15 ? wire4 : wire11)),
                      $signed((wire6 ? wire7 : (8'hb6)))}));
  module17 #() modinst68 (.wire18(wire1), .wire20(wire13), .y(wire67), .wire22(wire15), .wire21(wire4), .wire19(reg9), .clk(clk));
  always
    @(posedge clk) begin
      reg69 <= (~&reg8[(3'h7):(3'h6)]);
    end
  assign wire70 = wire0;
  always
    @(posedge clk) begin
      reg71 <= (~^reg9[(3'h5):(2'h2)]);
      reg72 <= ({(wire14 ?
              ({(8'ha6),
                  reg8} | $signed(wire7)) : wire7[(1'h0):(1'h0)])} >= $unsigned({({wire16} ?
              $unsigned(wire2) : (wire0 ? wire1 : reg8))}));
      if (wire0[(5'h12):(4'hc)])
        begin
          if ((&$signed($signed($unsigned({wire67, wire5})))))
            begin
              reg73 <= (&$unsigned((((wire13 ? reg69 : wire70) ?
                  $signed(reg9) : $unsigned(wire16)) ^~ (~|(wire15 ?
                  wire6 : reg69)))));
              reg74 <= $unsigned(reg9);
            end
          else
            begin
              reg73 <= (~(($unsigned(wire4[(5'h10):(3'h4)]) >> wire7) ?
                  (~|$signed($signed(wire67))) : $unsigned((^~$signed((8'hbf))))));
              reg74 <= (reg8 ?
                  reg69[(4'hd):(4'h9)] : $signed($unsigned($unsigned($signed(wire11)))));
              reg75 <= (8'had);
              reg76 <= {$unsigned($signed(($unsigned(reg71) ^ {reg75})))};
            end
          reg77 <= $unsigned($signed($signed(($signed(wire2) ?
              wire7[(1'h1):(1'h1)] : wire4[(3'h6):(3'h6)]))));
          reg78 <= (wire4 ?
              ((-((~wire4) ?
                  $signed(wire12) : wire11)) <= $signed((!$unsigned(wire14)))) : $unsigned((8'hbc)));
          reg79 <= $unsigned(wire7[(1'h1):(1'h0)]);
          reg80 <= (~^{((wire4[(4'h8):(3'h5)] ?
                      (reg75 > wire16) : wire67[(1'h1):(1'h0)]) ?
                  (~&$signed(wire7)) : ($signed(reg74) << (wire14 | wire6)))});
        end
      else
        begin
          reg73 <= $unsigned((8'hb8));
          reg74 <= (-(!$unsigned(($signed(wire11) ~^ {wire16}))));
          reg75 <= ((reg8[(2'h3):(1'h0)] ?
                  (wire6[(5'h14):(4'hc)] ?
                      ((~wire13) != {wire67}) : $signed(reg72)) : wire13[(4'hc):(3'h7)]) ?
              (~|reg9) : $signed(wire11[(1'h1):(1'h0)]));
        end
      reg81 <= ($unsigned((reg9 && (wire2[(1'h1):(1'h1)] ?
              $signed(wire15) : (8'hbb)))) ?
          $unsigned((reg76 ?
              reg73[(3'h5):(3'h5)] : wire7[(1'h0):(1'h0)])) : ($signed(wire14[(1'h1):(1'h1)]) == $unsigned({(reg80 ?
                  wire16 : wire6)})));
    end
  assign wire82 = $unsigned(reg77);
endmodule

module module17
#(parameter param65 = (~^((8'hb6) ? ((8'hb1) ? (^~((8'ha9) & (8'hbe))) : (((8'hbb) == (8'ha7)) ? ((7'h43) ? (8'ha2) : (7'h42)) : (+(8'hb6)))) : ((8'hb7) ? ((^~(8'hb8)) ~^ (|(8'hbc))) : ({(7'h44), (8'hbf)} || {(8'hbf)})))), 
parameter param66 = (+param65))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire23;
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire46,
                 wire44,
                 wire23,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire23 = $unsigned($unsigned(wire22[(1'h1):(1'h1)]));
  module24 #() modinst45 (wire44, clk, wire22, wire21, wire18, wire20);
  assign wire46 = (~|(wire44[(2'h3):(2'h2)] < $signed((7'h43))));
  always
    @(posedge clk) begin
      reg47 <= $signed(((!(~^{(8'hbc), wire18})) ?
          $unsigned($unsigned((~wire20))) : ($signed(((8'ha3) ?
              wire44 : wire46)) * {wire19[(4'hb):(4'h8)], (~|(8'hba))})));
      reg48 <= ($signed($signed((wire22[(2'h2):(2'h2)] | wire46))) != (&$signed(wire19[(3'h4):(1'h0)])));
    end
  assign wire49 = wire46[(2'h2):(1'h0)];
  assign wire50 = $signed($unsigned(reg47));
  always
    @(posedge clk) begin
      reg51 <= $signed((~^wire49));
      if ({wire20,
          $signed(($unsigned($unsigned(wire49)) <<< ({wire22, reg51} ?
              {reg48} : (wire46 ? reg48 : reg48))))})
        begin
          if ((~$signed({reg51, ({wire20, wire44} <<< (|wire46))})))
            begin
              reg52 <= wire44;
            end
          else
            begin
              reg52 <= {$signed((((~^reg51) ?
                      (wire46 ?
                          wire44 : reg52) : $unsigned(wire23)) <= {$signed(wire44),
                      (-wire46)})),
                  $unsigned($signed($signed({wire18})))};
              reg53 <= {reg52};
              reg54 <= wire21[(2'h2):(1'h0)];
              reg55 <= ($signed((~&wire23[(3'h7):(1'h0)])) > ((~&((reg48 ?
                      wire46 : reg47) < wire19)) ?
                  {$signed(reg52),
                      $signed((^wire21))} : (wire22 >> $unsigned($unsigned(reg48)))));
              reg56 <= wire18;
            end
          reg57 <= (reg52 ?
              (-($unsigned({(8'hae),
                  wire18}) <= reg48[(1'h0):(1'h0)])) : (8'h9c));
          if ((~|(($signed(((8'ha5) ? wire21 : reg47)) ?
              ($unsigned(reg54) || reg48) : $signed($unsigned(wire21))) == (~^($signed(reg52) ?
              (wire19 && wire21) : {(8'haf), reg54})))))
            begin
              reg58 <= (wire49 ?
                  (reg53 > (reg52[(2'h3):(1'h1)] << (!$signed(wire21)))) : $unsigned(({(+wire21)} ?
                      ((7'h40) ?
                          $unsigned(reg55) : $signed(wire44)) : $unsigned($signed(wire46)))));
              reg59 <= reg58;
              reg60 <= (reg59[(1'h1):(1'h1)] ?
                  (^~$signed($signed(wire44[(2'h2):(2'h2)]))) : {(($signed(reg53) == $signed(reg56)) << ((-reg53) ?
                          reg47[(1'h0):(1'h0)] : reg54[(4'hd):(2'h3)])),
                      $signed($unsigned(reg59))});
              reg61 <= (~&(reg47 ?
                  ($signed((reg47 >> reg58)) >>> $unsigned($unsigned((8'hb6)))) : $signed($unsigned(wire20))));
            end
          else
            begin
              reg58 <= (({$unsigned((!reg60)),
                      $signed(wire23)} << reg52[(4'hb):(4'hb)]) ?
                  $signed((+$signed(reg51))) : (wire23[(2'h2):(1'h0)] >>> (wire46[(4'h8):(3'h5)] ?
                      reg52 : $signed(wire20))));
              reg59 <= wire23[(4'h8):(4'h8)];
              reg60 <= (($unsigned($unsigned(((8'hbe) <<< wire50))) >> reg47) | wire50);
              reg61 <= $unsigned($unsigned((~&$unsigned((!(8'hb7))))));
              reg62 <= reg53[(3'h4):(2'h3)];
            end
        end
      else
        begin
          reg52 <= reg60[(1'h1):(1'h1)];
          reg53 <= $signed((8'h9d));
          reg54 <= ($signed($unsigned((wire23[(3'h4):(1'h1)] ?
              (reg60 || reg53) : (|reg52)))) != {(((~&reg57) && $unsigned(wire23)) ^~ wire49[(2'h3):(2'h2)])});
        end
      reg63 <= $signed({$unsigned(($unsigned(wire22) - wire23))});
      reg64 <= reg60[(1'h1):(1'h0)];
    end
endmodule

module module24
#(parameter param43 = (((((8'ha8) != (!(8'hb3))) != (((8'ha2) > (8'had)) ? (8'haa) : ((8'ha5) << (7'h42)))) * ({((8'ha4) ? (8'hb0) : (8'ha1)), (^~(8'h9f))} ^~ {((8'haa) ? (8'ha7) : (8'ha4)), ((8'hbe) ? (8'h9d) : (8'hab))})) ? (((((8'hac) ? (8'ha2) : (8'hb7)) ? ((8'hab) ? (8'hae) : (8'hac)) : {(8'hbb)}) <= (7'h41)) - ({((8'hbb) > (8'hb9))} ? {(8'hbc), (+(7'h43))} : ((+(7'h42)) <= ((7'h42) ? (8'hab) : (8'hae))))) : (((((8'ha9) ? (8'hbf) : (8'hb3)) >> ((8'ha7) <<< (8'hb5))) ? ((~^(8'hb0)) ? ((8'ha2) <= (8'hb1)) : ((8'hb3) ^~ (7'h43))) : (((8'hbb) ? (7'h43) : (7'h41)) ? ((8'ha5) ? (8'hbf) : (8'hbb)) : ((8'hbf) ? (8'ha8) : (8'hb5)))) << ((~|(8'hb0)) ? ({(8'ha7)} != ((8'hac) || (8'ha9))) : (((8'ha9) - (8'had)) || {(7'h41)})))))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire26;
  input wire [(4'ha):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire29 = wire25;
  assign wire30 = {(wire25[(1'h0):(1'h0)] ?
                          wire28[(4'h9):(3'h7)] : {(wire26 ?
                                  $unsigned(wire25) : (+wire27))}),
                      ((~^$signed({(8'hb3), wire29})) ?
                          $signed({(wire25 ? wire26 : wire29),
                              (wire27 ?
                                  (8'ha0) : (8'ha6))}) : (|$signed(wire29)))};
  assign wire31 = wire27[(3'h5):(2'h2)];
  assign wire32 = ($signed((!((wire27 ?
                      wire30 : wire27) != $unsigned((8'ha8))))) ^~ ((({wire28,
                      wire26} >= wire31[(4'h8):(3'h6)]) - ((~|wire30) ?
                      $unsigned(wire30) : {wire30, wire29})) > ((8'haf) ?
                      wire25 : (|wire27[(2'h2):(1'h1)]))));
  assign wire33 = wire26[(3'h6):(3'h6)];
  assign wire34 = $unsigned(wire26);
  always
    @(posedge clk) begin
      reg35 <= wire26;
      reg36 <= ({$signed((wire32[(1'h0):(1'h0)] ?
              (wire32 <<< wire31) : (!wire27))),
          (wire25[(1'h0):(1'h0)] ?
              $signed($unsigned(wire29)) : $signed((wire27 << wire28)))} + wire25[(2'h3):(1'h0)]);
    end
  assign wire37 = $unsigned(((&wire33) ?
                      ((~^$signed(wire27)) ?
                          ((~^reg35) >>> ((8'hb7) ?
                              wire27 : wire25)) : $unsigned(wire27[(2'h3):(2'h2)])) : wire33[(2'h3):(2'h3)]));
  assign wire38 = (wire33 ?
                      ($signed((wire27[(4'hc):(4'ha)] ?
                          wire33[(1'h1):(1'h0)] : wire37)) & $signed($signed(wire28))) : wire29[(1'h1):(1'h1)]);
  assign wire39 = wire33[(4'h8):(3'h6)];
  assign wire40 = ($unsigned($signed($signed({wire37}))) > {$signed(($unsigned((8'ha0)) <<< (wire28 ?
                          wire33 : wire39))),
                      ($signed((wire39 >>> wire30)) ^ wire25)});
  assign wire41 = wire28;
  assign wire42 = reg35;
endmodule
