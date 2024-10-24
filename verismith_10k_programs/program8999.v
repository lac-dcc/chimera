module top
#(parameter param98 = ((|((8'ha1) ? ((7'h43) && (~&(8'haa))) : (~((8'hb8) && (8'ha3))))) ? (~(8'hb9)) : ((({(8'hb0), (8'hbe)} ^ (~(8'h9f))) == (((8'hae) ? (8'ha9) : (8'hb0)) ? ((8'hae) ? (8'hb0) : (8'hb1)) : (^(8'ha4)))) <<< ((|{(8'ha5), (8'haf)}) ? {{(8'ha8), (8'hb7)}, ((8'ha1) != (8'hb6))} : (((8'h9e) >> (8'hba)) < ((8'ha3) > (8'ha7)))))), 
parameter param99 = (param98 ? ({((param98 < param98) ? param98 : (param98 ? param98 : param98))} ? (!((param98 ? param98 : param98) << (param98 || (8'ha5)))) : param98) : (param98 && (((param98 ? param98 : param98) >= (param98 && (8'hbb))) ? {(param98 ? param98 : param98), (+(8'ha5))} : ({param98} ? (param98 ? (8'hb5) : param98) : (|param98))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire94;
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire15,
                 wire16,
                 wire18,
                 wire94,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg17,
                 reg19,
                 (1'h0)};
  assign wire4 = (wire3[(3'h4):(1'h1)] ?
                     ((((wire1 ? wire2 : (8'haf)) ?
                         wire2 : (wire3 & wire0)) != $unsigned($signed(wire0))) == wire1) : $unsigned(wire3));
  assign wire5 = wire2[(3'h7):(1'h1)];
  assign wire6 = wire0;
  assign wire7 = wire4;
  assign wire8 = $unsigned($unsigned({((8'ha9) >>> (wire1 ? wire7 : wire2)),
                     $unsigned($signed(wire6))}));
  assign wire9 = (^{$signed(wire3), (8'hbb)});
  always
    @(posedge clk) begin
      reg10 <= {(wire7 && wire6), wire3};
      reg11 <= $unsigned($unsigned({({wire1, wire0} << $signed(wire6))}));
      reg12 <= (-{(($signed((7'h43)) ?
              (-wire7) : $signed(wire1)) ^ wire8[(3'h7):(3'h4)])});
      reg13 <= $unsigned((~|wire4));
      reg14 <= $signed($signed(wire7));
    end
  assign wire15 = wire3;
  assign wire16 = {(8'hb2),
                      ($unsigned(((-reg10) ?
                              $signed(wire2) : (wire0 ? wire3 : wire3))) ?
                          wire6[(1'h0):(1'h0)] : wire1[(5'h12):(3'h7)])};
  always
    @(posedge clk) begin
      reg17 <= (8'ha6);
    end
  assign wire18 = (+$signed((~&(~|wire1[(4'hb):(4'hb)]))));
  always
    @(posedge clk) begin
      reg19 <= wire9[(3'h7):(3'h6)];
    end
  module20 #() modinst95 (.wire21(wire18), .wire22(reg11), .y(wire94), .wire24(wire1), .wire23(wire4), .clk(clk));
  assign wire96 = ((^wire1) ? $unsigned(wire8) : $unsigned(reg13));
  assign wire97 = ($signed($unsigned(wire8)) ?
                      (!$unsigned(((wire8 ?
                          (8'hb2) : wire7) & (-wire1)))) : (wire16 ?
                          ((wire1 ?
                              wire18[(5'h14):(4'ha)] : wire94) >= $unsigned($signed((8'h9f)))) : reg11));
endmodule

module module20
#(parameter param93 = ((!(~^(((8'ha8) ? (8'ha0) : (8'hba)) >>> ((8'h9d) > (8'hab))))) ^ ({(((7'h40) ? (7'h40) : (8'hb0)) ^~ (!(8'ha6)))} < (^(((8'ha5) ? (8'hbc) : (8'ha2)) ? (8'hb9) : ((8'hac) ? (8'ha2) : (8'hbf)))))))
(y, clk, wire21, wire22, wire23, wire24);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire22;
  input wire [(5'h13):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire47;
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  assign y = {wire92, wire90, wire49, wire25, wire47, reg50, (1'h0)};
  assign wire25 = wire24[(3'h5):(2'h3)];
  module26 #() modinst48 (wire47, clk, wire23, wire21, wire22, wire24, wire25);
  assign wire49 = (~^((~|((wire24 + wire21) ?
                          wire23[(2'h2):(2'h2)] : (!(7'h40)))) ?
                      ({(wire47 < (8'hae)),
                          $unsigned(wire47)} != $unsigned($unsigned(wire22))) : wire21[(5'h13):(4'h9)]));
  always
    @(posedge clk) begin
      reg50 <= (+$signed($unsigned((-$unsigned(wire25)))));
    end
  module51 #() modinst91 (.wire53(wire47), .wire52(wire23), .y(wire90), .wire54(wire49), .clk(clk), .wire55(wire25));
  assign wire92 = reg50[(2'h3):(2'h2)];
endmodule

module module51
#(parameter param89 = ((8'hb0) ? (({((8'hac) ? (8'had) : (8'ha8)), ((8'hb9) ? (8'hbc) : (8'ha3))} ? (~(8'hbc)) : (((8'hb4) ^~ (8'ha5)) >> ((7'h42) ? (8'hac) : (8'h9e)))) ? ((+(~|(8'h9c))) & ((^~(8'hb8)) << ((7'h44) ? (8'hb7) : (8'h9c)))) : {(((8'hbc) ? (8'ha8) : (8'hba)) ? {(8'hab), (8'hbb)} : ((8'ha1) ? (8'hb0) : (8'hbc))), (((8'hb8) ? (8'hb6) : (8'ha9)) ? ((8'haf) ? (8'ha2) : (8'h9c)) : {(8'hb0), (8'hb1)})}) : ((((-(8'hb7)) <<< ((8'hba) ? (8'hb5) : (8'hb4))) + (~&((8'ha6) ? (8'hb5) : (8'ha4)))) ? ((((8'hb4) >= (8'hb2)) ? (-(8'hbb)) : ((8'hbd) >>> (8'ha3))) ~^ ({(8'ha1), (8'hb1)} < ((8'hb7) ? (7'h40) : (8'ha7)))) : (((8'ha6) ? {(8'hba), (8'hae)} : (~|(7'h40))) ? {(~&(8'hb6))} : ((^(8'hb9)) ^ (8'ha6))))))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire55;
  input wire signed [(4'ha):(1'h0)] wire54;
  input wire signed [(5'h11):(1'h0)] wire53;
  input wire [(4'hf):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire56;
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire76,
                 wire75,
                 wire74,
                 wire62,
                 wire61,
                 wire56,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire56 = $unsigned(wire52);
  always
    @(posedge clk) begin
      reg57 <= wire54[(4'h8):(1'h0)];
      reg58 <= wire54;
      reg59 <= {({$signed((+reg57)), wire52[(1'h1):(1'h0)]} ?
              (({reg58} ? $signed((8'hb0)) : wire55) ?
                  reg57 : reg57[(1'h1):(1'h0)]) : (-{(wire54 <= wire55)})),
          $signed(wire52)};
      reg60 <= ((&{reg57[(3'h5):(1'h1)]}) != (!({$unsigned(reg57)} <<< {{wire56,
              reg58},
          {wire52, (8'h9d)}})));
    end
  assign wire61 = (^~{$unsigned(reg59[(4'h9):(2'h2)]), reg58});
  assign wire62 = ((({$signed((7'h42))} ?
                          $unsigned(wire54) : (+(wire56 >>> wire54))) ?
                      wire55[(3'h4):(1'h1)] : (reg60 ?
                          (wire52[(3'h6):(3'h4)] ?
                              (~&wire52) : $signed(wire53)) : (~|(^~(8'ha0))))) >= $unsigned($unsigned({wire56[(3'h5):(2'h2)]})));
  always
    @(posedge clk) begin
      reg63 <= $unsigned(((((^(8'hb4)) ? {reg59} : (~|reg59)) ?
              $signed(wire62) : (^wire56)) ?
          reg59 : {$unsigned($unsigned(wire61)), reg57[(3'h5):(1'h0)]}));
      reg64 <= reg58;
      reg65 <= $unsigned(($unsigned(wire61[(2'h2):(2'h2)]) ? wire61 : wire53));
      reg66 <= reg59;
      reg67 <= (reg64[(3'h4):(3'h4)] < ($signed({$signed(reg57)}) + ($signed(((8'hb8) << (8'hb2))) ?
          $signed($unsigned(reg63)) : $unsigned(reg65))));
    end
  always
    @(posedge clk) begin
      reg68 <= {wire55[(3'h7):(1'h0)], reg63[(4'h8):(3'h5)]};
      if ((~^(wire54 || $unsigned({(wire53 ? (8'hae) : wire56)}))))
        begin
          reg69 <= (~reg63);
          reg70 <= (+$signed(wire62[(3'h7):(3'h7)]));
          reg71 <= reg60[(3'h6):(1'h0)];
        end
      else
        begin
          reg69 <= (reg64[(4'h9):(1'h1)] ?
              {(^~$signed(reg66[(3'h7):(2'h3)]))} : (8'ha8));
          reg70 <= wire53[(4'h8):(2'h2)];
          if (reg60[(3'h6):(3'h6)])
            begin
              reg71 <= {reg57};
            end
          else
            begin
              reg71 <= $unsigned(((reg63[(1'h1):(1'h0)] ?
                      ((reg58 ?
                          reg57 : (8'ha5)) << $unsigned(wire62)) : (!$unsigned((8'hbb)))) ?
                  (wire61[(3'h5):(2'h3)] ?
                      {(~&reg68),
                          ((8'hb4) ? reg70 : (8'ha5))} : ($unsigned(reg58) ?
                          ((8'ha4) ?
                              reg58 : wire56) : (wire56 >= reg68))) : $unsigned($unsigned($signed(wire52)))));
              reg72 <= (reg69[(1'h1):(1'h1)] ?
                  $unsigned($signed(($unsigned(reg68) + reg66))) : ({$unsigned((reg71 + wire56)),
                      reg69} | $signed($signed({(8'hb2)}))));
            end
          reg73 <= ((($signed($signed(wire61)) ?
                  ($signed(reg63) ?
                      wire62 : {wire62,
                          reg59}) : $unsigned(wire55[(5'h10):(4'h9)])) - ($unsigned((~|reg57)) ^ {((8'hb2) ?
                      reg70 : wire52),
                  {wire52}})) ?
              wire61[(3'h6):(3'h5)] : {reg68, (!$unsigned({wire52, reg57}))});
        end
    end
  assign wire74 = $unsigned($unsigned(((&$signed(reg58)) + (&(8'hbd)))));
  assign wire75 = (|wire74[(2'h2):(1'h0)]);
  assign wire76 = ($unsigned((((reg72 ^ wire61) ?
                          $unsigned(reg73) : ((8'hbd) ^ wire56)) ?
                      $signed(wire56) : ($unsigned(reg73) ?
                          reg69[(4'h8):(1'h0)] : {wire74}))) <<< $signed((wire74 ?
                      (~|reg58[(4'hb):(3'h4)]) : reg63[(4'hf):(4'h8)])));
  always
    @(posedge clk) begin
      reg77 <= $unsigned((8'hb7));
      if ((~|$unsigned($signed(({reg65} ? reg67 : reg57)))))
        begin
          if (wire61[(4'hb):(4'ha)])
            begin
              reg78 <= {(reg60[(2'h3):(2'h3)] ? (^~reg67) : reg57)};
              reg79 <= $signed(((~|(!wire62[(3'h6):(3'h5)])) != wire62[(4'he):(3'h5)]));
              reg80 <= wire54;
              reg81 <= {$signed($signed($signed($unsigned(wire76)))),
                  $unsigned(reg57)};
              reg82 <= ($signed((reg78 + wire75)) < $unsigned(((^~(reg79 >>> wire53)) ?
                  {$unsigned(reg58), reg67[(3'h6):(2'h3)]} : reg81)));
            end
          else
            begin
              reg78 <= reg77;
              reg79 <= wire53[(3'h4):(2'h2)];
              reg80 <= (^(~^(reg65 ?
                  $unsigned((wire54 ? (8'had) : reg65)) : $unsigned(wire75))));
            end
          reg83 <= ((~&$unsigned(({reg69, reg78} && $unsigned(reg81)))) ?
              $unsigned(({reg79} ?
                  wire55[(3'h6):(2'h3)] : reg68)) : (reg66[(4'h8):(2'h2)] ?
                  $signed((~|(wire74 ? reg79 : reg60))) : ((^(reg82 ?
                          reg59 : (8'hbd))) ?
                      (reg67 == reg82[(1'h1):(1'h0)]) : ((~&wire75) ?
                          reg81 : (reg72 ? reg72 : reg73)))));
          reg84 <= {(($signed((reg77 > reg64)) ?
                  $signed($unsigned(reg80)) : $unsigned(reg60)) <= {$signed((&reg83)),
                  $unsigned(((8'hbb) ? wire74 : reg58))})};
          if ((reg63 ?
              $unsigned((reg70 <= wire54)) : ($signed(({wire74} ?
                      (+reg60) : $unsigned(reg66))) ?
                  wire56[(1'h0):(1'h0)] : $unsigned(reg73[(3'h5):(1'h0)]))))
            begin
              reg85 <= $signed(reg69[(4'hf):(2'h2)]);
            end
          else
            begin
              reg85 <= $unsigned(($signed(reg80[(3'h7):(3'h7)]) >> (+reg78)));
              reg86 <= wire56;
            end
        end
      else
        begin
          reg78 <= {{((reg79[(2'h2):(2'h2)] ?
                      (reg84 ^ wire75) : (reg69 ? wire76 : reg69)) > (~reg63)),
                  (8'ha5)},
              $signed($unsigned($unsigned($unsigned(wire61))))};
          reg79 <= reg67[(4'h8):(3'h5)];
        end
    end
  assign wire87 = reg67[(3'h6):(3'h6)];
  assign wire88 = (!wire76);
endmodule

module module26
#(parameter param46 = ((((-((8'hb9) ^~ (8'hb0))) ? {(!(8'hb6)), (|(8'hbf))} : (((8'hbf) != (8'hb5)) ? (8'haa) : ((8'hbf) > (8'hbc)))) ? {(~&(8'h9f)), ((~&(8'h9f)) ? ((8'hb0) > (8'haf)) : (!(8'hba)))} : (~&(~^((8'hb2) >= (8'hbb))))) != (((^~((7'h43) << (8'haa))) ? (((8'had) >> (8'hb4)) ~^ ((8'hb0) == (8'hbc))) : ((~&(8'ha4)) ? {(8'ha9)} : ((8'haa) ? (8'hab) : (7'h41)))) ? ((((7'h40) ? (8'h9d) : (8'hba)) * ((8'h9e) + (8'h9e))) ? {(~^(8'hb5)), ((7'h43) << (8'h9e))} : ((~|(8'hb6)) | (!(8'ha5)))) : {(((8'hb2) ^ (8'ha8)) * (|(8'ha5)))})))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire signed [(3'h4):(1'h0)] wire28;
  input wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= (|($unsigned((wire30 < $signed(wire27))) ?
          wire29[(4'he):(3'h6)] : $unsigned(wire29[(5'h12):(4'hb)])));
      if ((|reg32[(4'h9):(2'h2)]))
        begin
          reg33 <= $unsigned({$unsigned((~^{wire28}))});
        end
      else
        begin
          reg33 <= ($signed((~&$signed((reg33 ?
              wire31 : wire28)))) >>> wire27[(1'h1):(1'h1)]);
          if (wire29[(4'hc):(4'h8)])
            begin
              reg34 <= $signed($unsigned(wire31[(5'h12):(3'h5)]));
              reg35 <= (reg33 - reg34[(3'h5):(3'h5)]);
            end
          else
            begin
              reg34 <= (({$unsigned((wire31 - reg32)),
                      ((reg33 ? reg32 : reg35) * (reg32 ?
                          reg35 : (8'ha5)))} ^ (~|$signed(wire29))) ?
                  {((+(reg32 + wire31)) & (-reg33[(3'h7):(3'h7)])),
                      $unsigned((~^wire31[(5'h12):(4'hf)]))} : ((8'ha4) ?
                      ((^reg33) ?
                          (8'had) : (reg32[(1'h1):(1'h1)] && (~|wire31))) : $unsigned((|$signed(wire28)))));
              reg35 <= wire28[(2'h3):(2'h3)];
            end
          reg36 <= (((({wire31} ?
                      wire27[(1'h0):(1'h0)] : (reg33 ? reg34 : wire28)) ?
                  reg33[(2'h3):(2'h3)] : (-(&(7'h43)))) & ($signed(wire29[(5'h11):(1'h1)]) & $unsigned((reg32 & wire28)))) ?
              (^~(+(^$signed((8'haa))))) : reg32);
        end
      if ((~|$signed($signed(wire31[(4'hc):(3'h4)]))))
        begin
          reg37 <= wire27;
          reg38 <= {reg34, reg32};
          if ((reg36 ? {$unsigned($unsigned(reg37))} : (^~reg37)))
            begin
              reg39 <= (^wire31);
            end
          else
            begin
              reg39 <= (({$signed({(8'hbe)})} | wire28[(1'h1):(1'h0)]) ?
                  reg37 : ($signed($unsigned((reg34 ?
                      wire31 : reg39))) ^ ((reg33[(1'h0):(1'h0)] ?
                          (reg36 ? reg35 : reg38) : $signed(wire30)) ?
                      ((reg35 * wire29) ?
                          (|wire28) : (~&reg38)) : (~|wire28[(1'h0):(1'h0)]))));
              reg40 <= wire30[(5'h13):(3'h6)];
            end
          reg41 <= reg35[(2'h2):(1'h0)];
          reg42 <= $unsigned(wire28[(1'h0):(1'h0)]);
        end
      else
        begin
          reg37 <= reg40;
        end
    end
  assign wire43 = ($unsigned((!(7'h43))) << ($signed({$signed(wire30),
                          wire28}) ?
                      wire31 : $unsigned(reg39[(2'h3):(1'h0)])));
  assign wire44 = ((~&$unsigned(wire27[(4'hd):(4'h8)])) ?
                      ($signed((wire31[(1'h1):(1'h0)] ?
                          reg39 : (reg41 || wire28))) - {$signed(wire30[(4'h9):(3'h5)]),
                          ($unsigned((7'h44)) ?
                              reg35 : {wire43,
                                  reg36})}) : $signed($unsigned(reg32[(4'h9):(1'h0)])));
  assign wire45 = ($signed({reg33}) ^~ reg41[(4'hd):(1'h1)]);
endmodule
