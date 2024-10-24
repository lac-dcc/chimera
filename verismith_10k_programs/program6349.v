module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire24,
                 wire21,
                 wire20,
                 wire19,
                 wire6,
                 wire5,
                 wire4,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg26,
                 reg23,
                 reg22,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (~wire1);
  assign wire5 = (^~$unsigned((&$unsigned($unsigned(wire3)))));
  assign wire6 = $signed($signed(wire5[(3'h5):(2'h2)]));
  always
    @(posedge clk) begin
      reg7 <= {(~&$unsigned(($signed(wire2) || $signed(wire1))))};
      if ($unsigned((~|((7'h40) ? (~$signed(wire5)) : wire0[(3'h4):(2'h3)]))))
        begin
          reg8 <= wire3[(5'h13):(3'h7)];
          reg9 <= {((($signed(wire5) ?
                      ((8'hb0) ?
                          wire1 : wire0) : wire5[(4'hd):(4'ha)]) > $unsigned((-wire2))) ?
                  (((reg8 ? wire6 : wire5) == wire5[(4'ha):(3'h6)]) ?
                      ($signed((8'hb8)) == {(8'hbd), reg7}) : {((8'h9c) ?
                              wire1 : (8'hac))}) : ($signed(wire0[(2'h2):(2'h2)]) ?
                      (+(wire4 && wire3)) : $unsigned($signed(wire2))))};
          reg10 <= $signed((($signed(wire4[(2'h2):(1'h0)]) ?
                  {$signed((8'hb9)), {wire2, reg8}} : wire1) ?
              ((~|wire5) && wire3) : reg8));
          reg11 <= $unsigned(wire0[(2'h3):(2'h2)]);
        end
      else
        begin
          if ((+wire3[(3'h5):(2'h3)]))
            begin
              reg8 <= $signed(($unsigned(wire0) || $unsigned(((+reg8) <= (~|reg7)))));
              reg9 <= wire0[(2'h2):(1'h0)];
              reg10 <= wire5[(1'h1):(1'h1)];
            end
          else
            begin
              reg8 <= reg8;
              reg9 <= $unsigned((wire1 ?
                  (((reg8 ?
                      wire0 : wire0) || $unsigned(wire0)) ^~ ((~|(8'ha4)) <<< $signed((8'ha3)))) : $signed(reg11[(2'h2):(2'h2)])));
              reg10 <= $unsigned($unsigned(wire6[(3'h5):(1'h1)]));
              reg11 <= (reg11 >= wire1[(2'h2):(2'h2)]);
              reg12 <= (7'h44);
            end
          reg13 <= (^~$unsigned(wire3[(4'hd):(4'hc)]));
          reg14 <= {{$unsigned($unsigned(wire5[(2'h3):(2'h3)]))}};
          reg15 <= (wire5[(3'h6):(3'h4)] ? (!(!(^(!reg12)))) : wire0);
        end
      reg16 <= (($unsigned((^reg14)) > reg13) ?
          $unsigned(((!{reg13}) <<< {$unsigned(reg13), (~&wire3)})) : ((wire3 ?
                  $unsigned((-reg14)) : (reg15[(5'h10):(2'h3)] ^ (reg11 ?
                      wire3 : reg8))) ?
              ((((8'hb8) ?
                  (8'hb6) : reg8) >= wire6) <<< wire2) : (!$unsigned((wire4 == reg9)))));
      reg17 <= {($unsigned(((~&(8'hba)) != wire0)) ?
              $unsigned($unsigned(((7'h44) ? (8'haf) : reg14))) : (+{{reg15,
                      wire0}}))};
      reg18 <= reg14[(4'hc):(3'h7)];
    end
  assign wire19 = $unsigned($signed(reg8));
  assign wire20 = (^(reg10 ?
                      (reg14 ?
                          $unsigned((reg7 ?
                              reg7 : wire6)) : $unsigned($signed((8'hb0)))) : wire4[(2'h3):(1'h0)]));
  assign wire21 = $unsigned((~&(~((reg12 | (7'h44)) ?
                      {(7'h40), reg13} : reg10))));
  always
    @(posedge clk) begin
      reg22 <= ($signed(reg13) ?
          $unsigned(reg12[(3'h4):(3'h4)]) : $signed((8'ha9)));
      reg23 <= $signed(reg18[(1'h1):(1'h1)]);
    end
  assign wire24 = ((+((8'hb4) ?
                      (wire20 <= ((8'hac) ?
                          reg18 : wire2)) : (!reg23))) | ((~^reg10) ?
                      (^~((wire6 ? reg9 : reg18) ?
                          (~|reg14) : reg14[(4'ha):(2'h3)])) : reg8));
  assign wire25 = $unsigned(($unsigned(($signed(reg9) | wire6)) << $signed(wire2)));
  always
    @(posedge clk) begin
      reg26 <= (~&(!wire3));
    end
  assign wire27 = (^~$signed($signed({(reg15 ^~ wire4), wire5})));
  assign wire28 = $unsigned((($unsigned((reg13 ? reg23 : reg9)) >> wire5) ?
                      {wire20[(3'h5):(1'h0)],
                          wire4} : $unsigned($unsigned((-reg14)))));
  assign wire29 = (((&wire20) * wire19[(3'h5):(1'h0)]) ?
                      $signed($signed(wire3)) : reg9);
  always
    @(posedge clk) begin
      if (wire28[(1'h0):(1'h0)])
        begin
          if (((8'hae) ?
              $signed($unsigned($unsigned(((8'haa) && (8'had))))) : wire25))
            begin
              reg30 <= $unsigned($unsigned($signed((wire24[(3'h4):(1'h1)] ?
                  (!wire5) : $signed(wire25)))));
              reg31 <= wire5[(4'hb):(4'hb)];
              reg32 <= $signed((({$signed(wire24)} ?
                  wire21 : {(wire29 ? reg30 : reg26)}) || $unsigned(wire27)));
              reg33 <= (~|(&(~^(8'ha3))));
            end
          else
            begin
              reg30 <= $signed($unsigned($unsigned(((-reg26) == $signed(wire4)))));
              reg31 <= $unsigned({(({reg30, wire27} ?
                          $unsigned(reg33) : $unsigned((8'haa))) ?
                      (~(wire0 & wire6)) : $unsigned({wire27, wire6})),
                  ((8'haa) < $unsigned({(8'hae)}))});
            end
          if ($signed($unsigned(wire1[(3'h5):(3'h4)])))
            begin
              reg34 <= reg30[(3'h7):(2'h2)];
              reg35 <= (reg16 ^~ (reg30[(4'h8):(1'h0)] ?
                  (wire28 ?
                      reg32[(4'hc):(2'h3)] : reg7[(2'h2):(2'h2)]) : (~^(!reg14[(1'h0):(1'h0)]))));
              reg36 <= ((~^(|($signed((8'hbc)) || reg12[(1'h0):(1'h0)]))) ?
                  {reg31[(2'h3):(2'h2)],
                      (|$unsigned(wire20[(3'h6):(2'h2)]))} : (8'ha6));
              reg37 <= $unsigned(reg14);
              reg38 <= (reg12 <= $signed(($signed((reg9 ?
                  reg16 : (8'ha3))) - ($unsigned(reg23) ?
                  (wire24 ? (8'hac) : reg37) : $unsigned(reg30)))));
            end
          else
            begin
              reg34 <= (~$signed({(8'ha0), $signed((!reg9))}));
              reg35 <= $unsigned($signed($unsigned({(^~wire27)})));
            end
        end
      else
        begin
          reg30 <= wire5;
          reg31 <= ((~|(8'ha1)) ^~ ({$unsigned(reg16[(2'h2):(1'h0)]),
                  reg32[(5'h12):(5'h11)]} ?
              (~&((reg15 || (8'ha2)) ?
                  reg10 : {(8'ha0)})) : $signed($signed(wire2[(1'h1):(1'h1)]))));
          reg32 <= ($signed(wire1) + (((wire25 ?
                      {reg7} : (reg8 ? (8'ha3) : wire0)) ?
                  (|$unsigned(reg26)) : $signed($unsigned(wire5))) ?
              reg13 : (|$unsigned({reg32}))));
        end
    end
  assign wire39 = ((~^(~&reg14)) ? {(+$unsigned(reg15)), reg10} : wire20);
  assign wire40 = $signed({(+((^~wire6) ? (~|wire5) : (reg35 << reg34))),
                      (reg7 ? reg12[(3'h7):(3'h6)] : (7'h40))});
  assign wire41 = $signed($signed(wire2[(1'h0):(1'h0)]));
endmodule
