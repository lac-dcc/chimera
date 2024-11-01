module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire24,
                 wire22,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire4 = (~|$signed($unsigned(wire2[(1'h0):(1'h0)])));
  assign wire5 = $unsigned(wire1[(1'h0):(1'h0)]);
  assign wire6 = (~|$unsigned($unsigned($signed((+wire4)))));
  assign wire7 = (8'hb4);
  assign wire8 = (wire6[(2'h3):(2'h2)] <= wire2[(3'h4):(1'h1)]);
  assign wire9 = wire5[(4'hd):(4'hb)];
  assign wire10 = (~{$unsigned($unsigned($unsigned(wire7))),
                      {({wire6} >= wire5)}});
  module11 #() modinst23 (.y(wire22), .clk(clk), .wire12(wire0), .wire15(wire4), .wire13(wire2), .wire14(wire9));
  assign wire24 = wire8[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg25 <= ($signed($unsigned((~wire5))) ?
          (wire7 ~^ {(^wire10), wire7}) : (~^(!wire7)));
    end
  always
    @(posedge clk) begin
      reg26 <= (wire7 ?
          (wire24 >>> ($unsigned($unsigned(wire9)) ?
              wire24 : wire8)) : $signed(wire3[(2'h3):(2'h3)]));
      reg27 <= (($unsigned($unsigned((wire9 >> (8'hb6)))) ^ {wire22[(3'h4):(2'h2)]}) ?
          {wire7[(4'he):(4'he)],
              (wire8[(2'h3):(2'h2)] * (^{wire6,
                  wire4}))} : $unsigned($unsigned(((wire0 * wire4) >= (-wire6)))));
      if (reg25[(3'h4):(2'h2)])
        begin
          if ((wire7[(2'h3):(2'h3)] ?
              $signed(wire2[(2'h3):(1'h0)]) : (!$signed(({wire3, reg25} ?
                  $signed(wire10) : (~&wire8))))))
            begin
              reg28 <= ($signed((+reg25)) ?
                  (~|($signed($unsigned(wire0)) ~^ {$signed(wire3)})) : (^$signed(($unsigned(wire5) ?
                      (wire22 ~^ wire10) : $signed(wire9)))));
            end
          else
            begin
              reg28 <= (wire0[(4'h8):(3'h6)] ?
                  {(8'h9c)} : ($unsigned(wire4[(4'hc):(4'ha)]) ?
                      wire10 : (wire10 ~^ (~|(wire22 && wire1)))));
              reg29 <= reg27;
            end
          if ((((wire2 ~^ (~^((8'ha3) ?
                  wire7 : reg26))) >> $signed($signed(reg25))) ?
              wire22 : (~|$signed(wire24))))
            begin
              reg30 <= $unsigned(wire0[(5'h12):(4'he)]);
              reg31 <= $unsigned(((|$unsigned(wire2[(2'h2):(1'h0)])) <= (($signed((8'hb1)) ?
                      (-wire6) : $unsigned(wire2)) ?
                  wire24[(1'h0):(1'h0)] : {wire22[(2'h3):(2'h3)]})));
              reg32 <= $unsigned((~((|(~wire6)) ?
                  wire4[(4'h8):(3'h5)] : ($unsigned(wire8) ^~ $unsigned(wire5)))));
              reg33 <= $unsigned(($signed((^~(8'hba))) ?
                  reg26 : ($unsigned((wire9 ^ wire2)) && wire22)));
              reg34 <= $signed(((+(~^{wire2, wire24})) ?
                  (~|(reg29 > ((8'hb4) ?
                      reg32 : wire9))) : (reg27 >>> ((wire10 ?
                          (8'h9d) : reg33) ?
                      (reg31 | reg27) : (wire10 ? reg31 : reg25)))));
            end
          else
            begin
              reg30 <= (($signed({wire10, (~|reg28)}) ?
                      (&((+wire22) ?
                          reg33 : $unsigned(wire7))) : $unsigned($signed($signed(wire24)))) ?
                  wire0[(4'hd):(3'h5)] : wire0);
              reg31 <= $unsigned(reg29[(3'h6):(1'h1)]);
              reg32 <= wire6;
              reg33 <= (reg30[(2'h3):(1'h0)] ?
                  (((&$unsigned(wire6)) & wire8) + (^~wire24)) : $unsigned((~reg34)));
              reg34 <= $unsigned({{reg27[(2'h2):(1'h0)]},
                  (((&reg28) & ((8'h9f) >= (8'hbb))) ? {(!reg32)} : wire8)});
            end
          reg35 <= wire3;
          if (wire6[(3'h4):(1'h0)])
            begin
              reg36 <= $signed(((-{(reg28 >= wire9)}) ?
                  $unsigned($signed($signed((8'hae)))) : $signed($signed(reg32[(4'h9):(2'h3)]))));
              reg37 <= ($signed((($signed(wire3) ? $signed(wire1) : wire9) ?
                  wire7 : (wire6[(1'h0):(1'h0)] ~^ (wire8 & reg30)))) || $signed(((reg30 ?
                  (wire3 != reg36) : (wire0 ? wire9 : (8'h9e))) <= (^~(reg27 ?
                  reg33 : wire3)))));
              reg38 <= {(reg35 ^~ (wire9[(1'h0):(1'h0)] ?
                      ($signed(reg34) ?
                          $signed(wire0) : (reg35 ?
                              reg27 : wire22)) : {$unsigned(wire22),
                          $unsigned(reg33)})),
                  (~(reg27[(5'h12):(3'h5)] ?
                      reg28 : ((reg35 ? wire1 : wire0) ?
                          wire7 : (wire0 || (8'hae)))))};
              reg39 <= $signed($unsigned(((-wire2[(1'h0):(1'h0)]) & ((wire0 ?
                      reg35 : wire6) ?
                  (-reg27) : wire2))));
              reg40 <= {$unsigned((((|reg28) ?
                      wire4[(1'h0):(1'h0)] : (reg37 ?
                          reg26 : reg25)) < (!{wire8, reg36})))};
            end
          else
            begin
              reg36 <= reg26;
              reg37 <= (+$signed(reg26));
              reg38 <= $signed(wire3);
              reg39 <= $unsigned(((reg40[(4'hf):(4'h8)] <<< $unsigned((8'hb4))) << reg25));
              reg40 <= $unsigned((~&wire1));
            end
          reg41 <= {$unsigned(((((8'ha8) ~^ wire1) >>> (wire3 ?
                  reg27 : wire1)) + $signed((reg28 & (8'hb7))))),
              reg36[(1'h1):(1'h1)]};
        end
      else
        begin
          reg28 <= (8'hb1);
        end
      reg42 <= wire3;
    end
  assign wire43 = (($signed((|$unsigned(wire7))) >>> $unsigned((((8'hbb) ?
                          reg29 : wire24) ?
                      $unsigned(reg28) : $unsigned(reg37)))) >= $signed((wire4 ?
                      ($signed(reg31) ?
                          wire22[(1'h0):(1'h0)] : reg42[(3'h4):(2'h2)]) : $unsigned({reg38,
                          reg35}))));
  assign wire44 = $signed(wire22[(2'h2):(1'h1)]);
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire [(3'h6):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  assign y = {wire21, wire20, wire19, wire18, wire17, wire16, (1'h0)};
  assign wire16 = $unsigned(wire14[(1'h0):(1'h0)]);
  assign wire17 = (($signed(((wire16 ^ (8'hb8)) > {wire14})) < wire15) << $unsigned($unsigned($unsigned((wire12 ?
                      wire14 : wire12)))));
  assign wire18 = $signed((~^{((!wire14) <<< (wire17 ? wire15 : wire13)),
                      wire17[(4'hc):(3'h6)]}));
  assign wire19 = $signed(((!(+wire12)) ?
                      $unsigned(wire15) : wire12[(3'h5):(3'h4)]));
  assign wire20 = wire19[(3'h7):(3'h6)];
  assign wire21 = ((~^($unsigned({(8'hb2)}) ?
                          {$unsigned(wire17),
                              $signed(wire14)} : (~^$signed(wire13)))) ?
                      {wire20, wire17} : (|{$signed($unsigned(wire15)),
                          $signed(((8'ha5) >>> wire13))}));
endmodule
