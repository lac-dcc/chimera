module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  reg [(4'he):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire71,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3;
      reg5 <= wire2;
      reg6 <= $signed((!wire1));
    end
  always
    @(posedge clk) begin
      if ((8'hb1))
        begin
          reg7 <= ($signed(($unsigned($unsigned(wire2)) ?
                  $signed($signed(reg5)) : $signed($signed(wire2)))) ?
              (reg4 ?
                  (reg6[(3'h4):(3'h4)] < $signed($signed((8'hbf)))) : reg4) : (!({wire1[(5'h11):(1'h0)]} ?
                  $signed(wire0[(4'hb):(2'h2)]) : ((&(8'hac)) ?
                      (8'ha4) : $unsigned(reg6)))));
          if ((8'ha0))
            begin
              reg8 <= reg4;
              reg9 <= (reg8[(3'h6):(3'h5)] ?
                  (~^(wire1 ?
                      {wire1,
                          wire3[(2'h3):(1'h1)]} : {(~(8'ha1))})) : (wire0[(4'h8):(3'h7)] && ({$signed(reg5)} - ((|reg6) > wire3))));
              reg10 <= {(~&($unsigned((wire3 == reg9)) ?
                      ($signed(wire1) == reg5[(3'h5):(1'h1)]) : (wire2[(3'h6):(1'h0)] ?
                          reg9[(3'h5):(2'h2)] : (8'h9e))))};
              reg11 <= $unsigned(wire3);
            end
          else
            begin
              reg8 <= ($unsigned((reg10 ?
                  $unsigned($signed(wire3)) : ($signed(wire1) ?
                      wire1 : $signed(reg8)))) < (~{reg6, (^(reg6 > wire1))}));
              reg9 <= (8'ha5);
              reg10 <= $unsigned($signed($signed(($unsigned(wire1) >> $unsigned(reg9)))));
            end
        end
      else
        begin
          reg7 <= $unsigned(({((reg5 ^~ reg4) * $unsigned((8'hbe))),
                  (-(+(7'h43)))} ?
              wire1 : $signed(reg9)));
          reg8 <= reg8;
          reg9 <= wire0[(1'h1):(1'h0)];
          if ($unsigned(reg4[(4'hc):(3'h6)]))
            begin
              reg10 <= {(-(^reg5[(1'h0):(1'h0)]))};
              reg11 <= reg4[(2'h3):(2'h3)];
            end
          else
            begin
              reg10 <= ((+(reg7[(2'h3):(1'h1)] ?
                  $unsigned((reg8 ?
                      reg5 : reg4)) : ((~&wire3) < (~|reg5)))) > (reg4 <= reg11));
            end
          reg12 <= ({reg4,
              (reg9 + reg8)} * (~|($unsigned($unsigned(reg9)) <= reg4)));
        end
    end
  assign wire13 = (reg9[(1'h0):(1'h0)] != $unsigned(wire1[(2'h3):(2'h3)]));
  assign wire14 = (reg7 ?
                      $signed((reg4 ?
                          {((7'h43) * wire1)} : $unsigned(reg11[(4'hd):(3'h4)]))) : (~&(8'hb8)));
  assign wire15 = $unsigned(reg12[(4'ha):(3'h6)]);
  assign wire16 = {(reg7[(3'h4):(2'h2)] < (8'ha3))};
  module17 #() modinst72 (.wire22(reg8), .clk(clk), .y(wire71), .wire20(wire1), .wire18(wire2), .wire19(reg5), .wire21(reg9));
  assign wire73 = (&($signed({(^(8'hbd)),
                      wire0[(4'hb):(3'h6)]}) >= (^$unsigned(wire16))));
  assign wire74 = $unsigned((wire1[(3'h5):(1'h0)] ?
                      ($signed($unsigned((7'h40))) != {$unsigned(wire1),
                          {(7'h44)}}) : (^((wire1 ? wire14 : wire71) ?
                          $signed((8'hbe)) : $signed(reg11)))));
endmodule

module module17
#(parameter param69 = (^~((!((!(8'hbd)) & ((8'h9f) ? (8'h9d) : (8'hb7)))) ? ((-((8'hb4) ? (8'ha7) : (8'ha4))) ^ (~(+(8'ha0)))) : ((((7'h41) ? (8'hb7) : (8'ha0)) ? ((8'h9f) ? (8'ha7) : (8'hb9)) : (|(8'hb6))) ? {((8'hbf) - (8'h9f)), ((8'h9f) ? (8'hbb) : (8'h9d))} : {((8'h9c) ? (8'hb0) : (8'hbe))}))), 
parameter param70 = (((((~|(8'hbb)) <= (param69 > param69)) ? (^(8'hac)) : (!(param69 || param69))) >> (|param69)) ? {param69} : (+(((8'ha3) ? param69 : {param69}) << param69))))
(y, clk, wire18, wire19, wire20, wire21, wire22);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire63;
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire23,
                 wire38,
                 wire39,
                 wire63,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  assign wire23 = (+$signed($unsigned($unsigned({wire18}))));
  always
    @(posedge clk) begin
      if (wire21[(3'h5):(3'h5)])
        begin
          reg24 <= $unsigned(wire21);
          if ((reg24 >= wire23))
            begin
              reg25 <= wire18[(2'h3):(1'h1)];
              reg26 <= ($unsigned(wire18) ?
                  ((8'ha5) | (wire23[(3'h6):(1'h1)] ?
                      ($unsigned(reg25) * ((8'ha9) ?
                          (8'ha9) : wire19)) : {wire23})) : (&$signed({$unsigned(wire19)})));
              reg27 <= reg26;
              reg28 <= $unsigned(wire18);
              reg29 <= $signed(wire20[(3'h5):(3'h4)]);
            end
          else
            begin
              reg25 <= (-wire20);
              reg26 <= $signed($signed((reg25[(5'h11):(4'hd)] ?
                  (7'h42) : wire23[(4'he):(2'h2)])));
              reg27 <= $unsigned($signed((wire22 ^ wire21[(2'h2):(2'h2)])));
              reg28 <= $unsigned((wire19 << ($unsigned({(8'ha5), reg25}) ?
                  $unsigned(reg26[(3'h6):(1'h1)]) : $unsigned((reg26 ?
                      reg25 : wire20)))));
              reg29 <= reg25[(4'hd):(3'h7)];
            end
          if (reg27[(1'h0):(1'h0)])
            begin
              reg30 <= (((|{reg29}) != (($unsigned(reg25) ?
                      wire23 : (+wire18)) ?
                  wire22[(4'h8):(4'h8)] : $signed(((8'ha0) ?
                      reg26 : wire19)))) ~^ {$signed((reg24 & $unsigned(wire21)))});
              reg31 <= (((~|({(8'h9c)} + (wire22 && (8'ha6)))) == $unsigned(reg29)) ?
                  reg30[(2'h2):(2'h2)] : $signed((^~(reg24[(3'h6):(1'h0)] != reg25[(4'h8):(3'h5)]))));
            end
          else
            begin
              reg30 <= ((wire21 << reg30[(1'h1):(1'h0)]) << reg25);
              reg31 <= wire21[(4'hb):(2'h3)];
              reg32 <= {(!($signed($signed(wire23)) > $unsigned(reg31)))};
              reg33 <= (~&$unsigned(({reg31[(1'h1):(1'h1)], reg25} ?
                  ($unsigned(reg27) ? {wire19} : $signed((8'hb3))) : wire18)));
              reg34 <= reg27[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg24 <= (wire23[(4'he):(1'h0)] > ($unsigned($signed({reg24,
              reg24})) == (wire23[(2'h2):(2'h2)] <= ((^~(7'h42)) + (8'hb5)))));
          reg25 <= (+$signed({$signed($signed(wire23)),
              ((reg26 ^ wire23) << $signed(reg32))}));
          reg26 <= wire18[(4'hd):(4'hd)];
          reg27 <= $signed(((~^$unsigned(reg31)) ?
              (^wire23[(2'h3):(1'h0)]) : $signed(((~|reg24) ^ ((7'h41) >= reg26)))));
          reg28 <= (($signed(reg24[(2'h2):(1'h0)]) | $unsigned($unsigned(wire20[(4'hb):(3'h5)]))) & $signed((wire23[(1'h0):(1'h0)] ?
              $signed((-wire20)) : reg26[(1'h1):(1'h1)])));
        end
      reg35 <= (7'h41);
      reg36 <= $signed($signed({reg28}));
      reg37 <= wire21[(4'hc):(3'h5)];
    end
  assign wire38 = {wire18, $signed(((&reg30) || reg35[(4'he):(2'h2)]))};
  assign wire39 = (reg31[(3'h4):(3'h4)] <<< {(^~$unsigned((wire20 & wire21)))});
  module40 #() modinst64 (wire63, clk, reg30, wire39, reg29, reg28);
  assign wire65 = ({reg36[(5'h10):(2'h2)]} | wire39);
  assign wire66 = $unsigned((8'hb6));
  assign wire67 = (|(-reg37[(3'h6):(3'h6)]));
  assign wire68 = reg31;
endmodule

module module40  (y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire44;
  input wire [(2'h3):(1'h0)] wire43;
  input wire signed [(2'h2):(1'h0)] wire42;
  input wire signed [(4'hd):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire48,
                 wire47,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg46,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg45 <= $signed(wire41);
      reg46 <= (7'h41);
    end
  assign wire47 = $signed($unsigned($signed(wire42[(1'h1):(1'h1)])));
  assign wire48 = {$signed(((7'h44) >> ((!wire44) ^ wire44)))};
  always
    @(posedge clk) begin
      reg49 <= $signed((wire42[(2'h2):(1'h0)] ?
          (!(+(wire48 ? wire43 : wire47))) : wire47[(3'h6):(2'h2)]));
      if (wire43)
        begin
          if ($signed(reg45))
            begin
              reg50 <= $unsigned({reg45});
              reg51 <= $unsigned({$signed(reg46)});
              reg52 <= ((wire48[(1'h0):(1'h0)] ^~ ((~|$signed((7'h44))) ?
                  reg51[(4'hb):(2'h2)] : $signed($signed(reg46)))) - reg46[(4'hc):(3'h7)]);
              reg53 <= (+$unsigned((+($signed(wire43) >>> (wire47 ?
                  wire41 : reg51)))));
            end
          else
            begin
              reg50 <= $unsigned(($unsigned($signed((~^(7'h42)))) ?
                  reg45[(3'h4):(3'h4)] : $signed(((reg46 << reg53) >>> $signed(reg51)))));
              reg51 <= {(((reg46[(4'h8):(1'h0)] ^ (reg51 ^ (8'had))) <= ((-(7'h44)) & $unsigned(reg53))) ?
                      wire43 : {reg45}),
                  (|(+wire43))};
              reg52 <= (({reg52, (!wire42[(1'h1):(1'h1)])} ?
                      ((+reg52[(3'h4):(2'h3)]) - (-wire41[(3'h5):(3'h4)])) : ($unsigned((wire48 ?
                          wire44 : wire42)) - $unsigned(wire42[(1'h0):(1'h0)]))) ?
                  reg45[(2'h2):(2'h2)] : (reg46 ?
                      (^wire48[(2'h3):(2'h3)]) : (^~(&$signed((7'h44))))));
              reg53 <= $signed((reg50 ?
                  $signed(((+wire48) ?
                      $unsigned((8'ha9)) : $signed(wire41))) : ($signed((+reg49)) ?
                      {((7'h40) ? reg49 : wire41),
                          $signed((8'hbd))} : {(wire47 ? (8'ha4) : reg51),
                          (~^wire41)})));
            end
          reg54 <= (wire41[(1'h1):(1'h0)] ?
              {{(~&{wire44})}, ((8'hb2) != reg46)} : ($unsigned((~&((8'hb0) ?
                  reg50 : wire43))) | (reg50[(1'h0):(1'h0)] ?
                  reg45[(1'h0):(1'h0)] : wire48[(3'h4):(2'h3)])));
          reg55 <= ($unsigned(reg49[(2'h2):(1'h0)]) != ((!(|wire44[(3'h4):(2'h3)])) ?
              reg52[(2'h3):(2'h3)] : (wire42[(1'h1):(1'h1)] >> ((reg53 * reg50) <= $signed(reg50)))));
          reg56 <= (^~$signed(reg45[(2'h2):(1'h1)]));
        end
      else
        begin
          reg50 <= $unsigned(($signed($unsigned((~^(8'hb5)))) ?
              ($signed((^~reg51)) + reg52) : wire43[(2'h3):(1'h1)]));
          reg51 <= wire44[(3'h7):(1'h1)];
          reg52 <= ($signed(((8'hbc) ~^ (~|$signed(reg50)))) ?
              $unsigned(reg52) : reg55[(3'h4):(2'h3)]);
        end
      reg57 <= reg52[(2'h3):(2'h3)];
      reg58 <= (reg56[(1'h0):(1'h0)] == (({reg52} ?
              reg51 : {(reg52 ? reg51 : reg51)}) ?
          reg50[(2'h2):(2'h2)] : ((~^{reg54, wire44}) ?
              ($unsigned(reg53) ?
                  $unsigned(wire43) : (~|reg46)) : (wire42[(1'h0):(1'h0)] ?
                  $unsigned(reg55) : reg51[(3'h4):(2'h2)]))));
    end
  assign wire59 = $unsigned($unsigned((!(reg52[(1'h0):(1'h0)] ?
                      ((8'hb1) >>> (8'hb1)) : ((8'ha2) << wire47)))));
  assign wire60 = ($signed($signed(((~|reg50) ?
                          reg56[(3'h4):(2'h2)] : (reg49 ? reg56 : reg54)))) ?
                      $unsigned(($unsigned((+reg56)) ?
                          (!(wire43 <= wire41)) : (~^(reg46 ?
                              reg53 : reg51)))) : {(wire43[(2'h2):(1'h1)] - ((reg51 ?
                                  reg49 : reg53) ?
                              wire59 : $unsigned(wire48)))});
  assign wire61 = (!(~^reg56[(1'h0):(1'h0)]));
  assign wire62 = {(wire44 <= (-(-wire59))), $unsigned(reg56)};
endmodule
