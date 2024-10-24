module top
#(parameter param51 = (~&((8'hb1) > ((+((8'ha9) != (8'hbc))) || {((8'hbd) > (8'hb9))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire49;
  reg signed [(3'h6):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  assign y = {wire12,
                 wire14,
                 wire19,
                 wire49,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg13,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed((!$unsigned(wire3[(1'h1):(1'h0)]))) ?
          ((wire1[(2'h2):(2'h2)] ?
              ((wire3 ? wire0 : (8'h9f)) ?
                  (wire1 <= wire2) : (!wire2)) : $signed((wire3 != wire2))) < (7'h40)) : (!$unsigned(wire3[(3'h4):(1'h0)])));
      if ((($unsigned($signed(wire0)) ?
          ($unsigned(((7'h40) ^~ wire3)) * wire0) : (wire0 >= (~wire3))) << $unsigned($signed((&wire2[(4'hd):(4'hc)])))))
        begin
          reg5 <= $unsigned(((reg4 ?
                  {$unsigned(wire0)} : $signed(wire0[(4'h8):(3'h4)])) ?
              $signed(wire0[(4'hb):(3'h5)]) : (reg4[(1'h1):(1'h0)] ?
                  (8'hb8) : (7'h40))));
        end
      else
        begin
          reg5 <= $signed(((~^$signed($signed(reg4))) & $unsigned($unsigned({reg5}))));
          reg6 <= (|($unsigned((^~$unsigned(wire3))) ?
              ($signed(((8'hb4) ? reg4 : reg4)) != (wire0 ?
                  (wire3 ?
                      wire3 : reg5) : wire3[(2'h2):(1'h1)])) : $unsigned((~^$unsigned(reg5)))));
          reg7 <= {(wire3 >>> (wire1 > $signed((+wire1)))),
              (reg4[(1'h0):(1'h0)] ?
                  (~(!$signed(reg6))) : {((reg6 == (8'hb1)) ?
                          (8'h9f) : (wire2 ? reg6 : wire0)),
                      $unsigned($unsigned(wire1))})};
          reg8 <= reg5;
          reg9 <= wire3;
        end
      reg10 <= {(wire3 ?
              (!$signed(reg5[(3'h6):(2'h2)])) : (!(-wire0[(2'h2):(2'h2)])))};
      reg11 <= wire2[(1'h1):(1'h1)];
    end
  assign wire12 = ($signed($signed((wire0 ?
                      (reg5 ? reg9 : wire3) : $unsigned(reg4)))) > (8'hb1));
  always
    @(posedge clk) begin
      reg13 <= $unsigned({$unsigned(($unsigned(reg7) >= (8'hb8)))});
    end
  assign wire14 = $signed($signed(((~$signed((7'h41))) ? {(&wire2)} : reg4)));
  always
    @(posedge clk) begin
      reg15 <= $unsigned(((-($signed(reg9) ? $unsigned(reg6) : (^~reg13))) ?
          (+$signed((wire2 ? reg4 : wire12))) : reg5[(4'ha):(2'h2)]));
      reg16 <= ($unsigned((~|(~&reg15[(3'h4):(3'h4)]))) ?
          ((reg6[(1'h0):(1'h0)] | reg10) ?
              wire2[(3'h5):(3'h4)] : $unsigned(reg13)) : (reg7 ?
              $unsigned({reg9[(5'h14):(1'h0)],
                  (~|reg4)}) : ($signed(wire14[(2'h2):(1'h0)]) <= reg9)));
      reg17 <= ($signed(((wire0[(3'h5):(2'h3)] ? $signed(reg8) : reg11) ?
              wire2 : ((reg7 | wire14) ?
                  (~(8'hb2)) : (wire2 ? reg5 : wire2)))) ?
          reg11 : ((reg7 ?
              (^~(~|reg4)) : (reg9 ~^ wire12)) >>> (wire14 <<< (reg5 ?
              reg5[(3'h7):(3'h4)] : (wire14 ? wire3 : reg13)))));
      reg18 <= (({(wire3 ~^ $signed(reg10))} ?
          ((reg6[(2'h3):(1'h0)] > ((8'ha9) ? wire3 : reg10)) ?
              wire1[(1'h1):(1'h0)] : ($unsigned(wire1) ?
                  $unsigned(wire2) : $signed(reg9))) : {$signed((reg9 ?
                  (8'hab) : (8'hb0))),
              reg16[(3'h5):(3'h5)]}) == $signed($unsigned($unsigned($unsigned(wire0)))));
    end
  assign wire19 = $signed(reg4[(3'h5):(3'h4)]);
  module20 #() modinst50 (.wire23(wire3), .wire22(reg15), .wire21(reg18), .wire24(reg13), .y(wire49), .clk(clk));
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h1e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire44;
  assign y = {wire48, wire47, wire46, wire44, (1'h0)};
  module25 #() modinst45 (.y(wire44), .wire28(wire21), .wire29(wire24), .wire27(wire23), .wire26(wire22), .clk(clk));
  assign wire46 = wire44;
  assign wire47 = (wire22[(3'h7):(3'h4)] ?
                      $unsigned(($signed(wire21[(4'h9):(3'h6)]) >>> wire21[(4'ha):(4'h9)])) : (($unsigned(wire24[(4'h8):(2'h3)]) && (((8'hb7) * wire44) ?
                          wire22[(4'h9):(3'h7)] : (&(8'hb2)))) * (wire44 ?
                          ({wire22} + {(8'h9d),
                              wire44}) : (+((8'hb2) & wire23)))));
  assign wire48 = wire24[(5'h14):(4'h8)];
endmodule

module module25
#(parameter param42 = {((8'hbd) || (&(((8'h9d) != (8'ha6)) ? (~(7'h44)) : ((8'hb3) >= (8'hb2))))), ((-(((8'ha3) - (8'hbe)) - {(8'ha8), (8'h9e)})) >>> ((~|((7'h44) ? (8'hb9) : (7'h42))) | (!((8'hb6) ? (8'hb7) : (8'hbe)))))}, 
parameter param43 = (~(&{((param42 && (8'ha8)) ? param42 : (param42 ? param42 : param42))})))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire29;
  input wire signed [(4'hd):(1'h0)] wire28;
  input wire [(3'h6):(1'h0)] wire27;
  input wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire30 = ((wire29[(4'he):(4'hd)] ?
                      ($unsigned((wire28 ?
                          wire28 : wire27)) == $signed((wire29 ?
                          wire26 : (7'h42)))) : (-wire29[(4'ha):(4'h8)])) ~^ {$unsigned($unsigned($unsigned(wire26)))});
  assign wire31 = $unsigned(({$signed(wire27[(3'h5):(1'h1)]), wire29} ?
                      $unsigned((wire27 ?
                          ((8'haf) > wire28) : wire26)) : wire28));
  assign wire32 = {(+(({wire31, wire27} ?
                              (wire30 >= wire26) : (wire29 * wire31)) ?
                          ({wire30} ?
                              $signed(wire27) : $unsigned(wire29)) : ($signed((8'h9d)) ?
                              $unsigned(wire28) : (8'haa)))),
                      $signed(wire28[(3'h7):(1'h1)])};
  assign wire33 = $signed($unsigned(($unsigned((wire27 ? wire31 : wire32)) ?
                      {(wire32 >= wire28), $signed(wire27)} : wire31)));
  assign wire34 = ($unsigned($unsigned(($signed((8'hba)) ?
                      $unsigned(wire29) : $signed(wire29)))) - (~|$unsigned(($unsigned(wire27) ?
                      $unsigned(wire32) : wire28))));
  assign wire35 = $signed({wire27[(1'h0):(1'h0)]});
  assign wire36 = $signed($signed((8'hb9)));
  always
    @(posedge clk) begin
      reg37 <= $signed(wire35[(2'h2):(1'h0)]);
      reg38 <= ((^(!{$signed((8'hb4)), {wire28, wire36}})) ?
          $signed(({{wire27}} ?
              (8'hb7) : $unsigned((wire36 ? wire32 : reg37)))) : ({reg37,
                  $unsigned((wire26 ? reg37 : wire27))} ?
              wire26 : {(((8'hbf) ? wire31 : wire28) >> $signed(wire36)),
                  $unsigned($unsigned(reg37))}));
      reg39 <= (wire34[(3'h4):(1'h0)] ? wire26[(4'hb):(1'h0)] : wire29);
    end
  assign wire40 = (wire32 ?
                      ({(~(~wire28)),
                          $signed(wire35[(2'h2):(2'h2)])} + {($unsigned(wire35) ?
                              wire31[(1'h1):(1'h0)] : (^wire26))}) : (wire32[(4'hb):(4'h9)] ?
                          $signed((~&$unsigned(wire32))) : wire30));
  assign wire41 = {{(+$unsigned((!(8'ha8)))), wire31}, wire34[(4'h8):(3'h7)]};
endmodule
