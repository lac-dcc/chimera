module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire63;
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {wire65,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire63,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = (($signed($signed((wire1 <= wire3))) ?
                     wire4 : $signed((8'hbe))) + ((wire3 >= $signed(wire2)) - (~wire0[(4'h9):(2'h2)])));
  assign wire6 = (~(((-wire2) ?
                         wire1[(3'h6):(3'h4)] : $signed($unsigned(wire4))) ?
                     $unsigned(wire4) : ($signed((wire4 ?
                         wire0 : wire2)) * {wire2, (wire1 ? wire2 : wire1)})));
  assign wire7 = {wire4[(4'h9):(1'h0)],
                     $unsigned($unsigned((wire0 + (wire5 ? wire0 : wire0))))};
  assign wire8 = $signed(({$unsigned((wire3 ^ wire0)),
                         (wire6 < (wire4 * wire7))} ?
                     wire1 : $unsigned((wire1[(5'h12):(4'hc)] <<< (7'h44)))));
  assign wire9 = {((-(wire2[(2'h3):(2'h3)] ?
                             $signed(wire0) : wire7[(4'hc):(4'ha)])) ?
                         ((8'ha3) ?
                             wire7[(1'h0):(1'h0)] : (wire4[(3'h4):(1'h0)] ?
                                 wire6 : (wire8 ? wire2 : (8'hba)))) : (wire4 ?
                             {(~^wire2), wire0} : ({wire6} ? wire5 : wire0)))};
  always
    @(posedge clk) begin
      reg10 <= ($unsigned((~$unsigned(wire8[(4'hc):(3'h6)]))) <<< $signed(wire9));
      reg11 <= (wire4 ?
          ((~^wire1[(1'h1):(1'h1)]) >> (wire3 ~^ wire5[(4'h9):(3'h4)])) : $unsigned($unsigned((wire5[(3'h6):(1'h1)] > $unsigned((8'hac))))));
      reg12 <= $signed(wire1[(3'h4):(1'h1)]);
      reg13 <= (~($unsigned(((wire8 ? wire4 : wire4) ?
          wire5[(5'h11):(1'h0)] : (reg11 ?
              wire3 : reg10))) != ($unsigned($signed(wire5)) ?
          (|(+reg11)) : (wire0 ? reg10[(1'h0):(1'h0)] : (^(8'hb7))))));
    end
  assign wire14 = ($unsigned(wire2) ?
                      {(8'hbc),
                          wire3[(2'h3):(2'h2)]} : ($unsigned(wire9) >= ((7'h43) <<< wire3[(2'h2):(1'h0)])));
  assign wire15 = ($signed((~^$signed(reg12))) ?
                      ((reg12 ^ ($signed(wire7) ?
                          $signed(reg13) : $signed((8'ha2)))) == ((wire0[(4'h8):(3'h6)] ?
                              $signed(wire3) : (wire9 ? wire1 : wire9)) ?
                          (reg10 | $signed(reg13)) : (-wire8))) : wire0[(4'h9):(3'h7)]);
  assign wire16 = {(8'ha9)};
  assign wire17 = (wire9[(4'h8):(3'h4)] >>> $unsigned((~|wire2[(1'h0):(1'h0)])));
  module18 #() modinst64 (.wire23(wire9), .clk(clk), .wire21(wire1), .wire20(wire14), .y(wire63), .wire19(wire5), .wire22(wire4));
  assign wire65 = $unsigned(wire0);
endmodule

module module18
#(parameter param62 = ((&((~&((8'hb9) ? (8'hac) : (8'hae))) || (~(8'ha2)))) ? ({(&(~(8'hba)))} - {((~(8'hb0)) < (-(8'hb9)))}) : ({(-((8'ha3) >>> (8'hb7)))} ? (~|(+(~|(8'h9e)))) : (-(&((8'hb7) ? (8'ha2) : (8'ha1)))))))
(y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire59;
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  assign y = {wire61,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire59,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 (1'h0)};
  assign wire24 = $signed(((wire21[(3'h5):(3'h5)] ~^ (+$unsigned(wire23))) ?
                      wire21[(1'h1):(1'h1)] : {$signed(wire19[(4'hd):(3'h4)]),
                          {((8'hb3) && wire20)}}));
  assign wire25 = ($unsigned($signed(wire23[(3'h4):(1'h1)])) ?
                      (wire23[(3'h6):(3'h6)] ?
                          ({$unsigned(wire20)} == $unsigned(wire21)) : ($unsigned({wire21,
                                  wire24}) ?
                              wire20 : ((wire21 | wire22) - (wire23 ?
                                  wire21 : wire19)))) : (7'h43));
  assign wire26 = (!(+$signed((8'ha4))));
  assign wire27 = wire24[(4'ha):(4'ha)];
  assign wire28 = $unsigned(wire23[(1'h1):(1'h0)]);
  assign wire29 = ((&$signed((wire22[(1'h0):(1'h0)] & (wire20 << (7'h40))))) ?
                      wire22[(1'h1):(1'h0)] : (|wire20[(4'h8):(1'h0)]));
  assign wire30 = wire21;
  assign wire31 = {((wire27[(4'h9):(2'h3)] != (+$unsigned((8'h9e)))) ?
                          wire24[(5'h10):(2'h2)] : ((8'hab) ?
                              wire30 : $unsigned((wire28 - wire23))))};
  assign wire32 = {$signed($signed($signed(wire30[(4'h9):(3'h6)]))),
                      (~|wire23)};
  assign wire33 = wire24[(4'ha):(3'h5)];
  always
    @(posedge clk) begin
      reg34 <= (wire23[(2'h3):(1'h1)] ?
          wire28 : ((-((wire21 ~^ wire29) ?
              (wire33 >>> wire32) : (wire29 ?
                  wire26 : (8'hb6)))) || (~&((~^wire25) ?
              $unsigned(wire26) : wire28[(3'h4):(1'h0)]))));
      if ($signed((wire29[(3'h6):(2'h2)] ?
          (wire29 > wire33) : ($signed($unsigned(wire24)) << $signed((+wire29))))))
        begin
          reg35 <= ($signed($signed((~&((7'h43) >= wire22)))) ?
              (($signed((wire27 ? wire20 : wire20)) >> {$unsigned(wire26),
                      (8'hb5)}) ?
                  wire28 : reg34) : wire30[(2'h3):(2'h3)]);
          reg36 <= $signed((&(~|wire25[(1'h1):(1'h1)])));
        end
      else
        begin
          reg35 <= $unsigned((reg34 + $signed({wire22})));
          if ($signed((&(8'ha7))))
            begin
              reg36 <= wire32[(3'h4):(2'h3)];
            end
          else
            begin
              reg36 <= (|$signed(((&(wire20 ? (8'hbd) : wire20)) << (^(wire32 ?
                  reg36 : reg35)))));
              reg37 <= $signed((8'hab));
              reg38 <= ($signed((reg34 && (reg36[(2'h2):(2'h2)] + (wire23 > wire32)))) * {(wire25 ?
                      ((~wire24) || $signed(reg34)) : $signed($unsigned(wire19)))});
            end
          reg39 <= ($signed($unsigned((~&wire28))) ?
              $signed((~^wire28[(1'h1):(1'h1)])) : $signed((wire19[(2'h3):(2'h3)] >>> (!(^wire27)))));
          reg40 <= $signed({((!$signed(reg38)) > (wire24 ^ {wire29, wire33})),
              $unsigned(((|wire32) ? $signed(wire19) : (&reg34)))});
        end
      reg41 <= $signed(reg39);
      reg42 <= ($signed({$unsigned($unsigned(wire26)), wire32[(1'h0):(1'h0)]}) ?
          wire20[(4'h9):(4'h8)] : (wire20[(4'h8):(2'h3)] <<< wire22));
      if (wire29)
        begin
          reg43 <= $signed(wire21[(3'h4):(2'h2)]);
          reg44 <= reg43[(1'h1):(1'h0)];
          reg45 <= (~reg38[(2'h3):(1'h1)]);
          reg46 <= wire20[(1'h1):(1'h1)];
        end
      else
        begin
          reg43 <= (|((($unsigned(wire27) ?
              $signed(reg36) : wire28) ~^ $signed($unsigned(reg40))) == $unsigned($unsigned((~^wire27)))));
        end
    end
  module47 #() modinst60 (wire59, clk, wire22, wire33, reg42, wire31);
  assign wire61 = $unsigned((reg39 < (~&wire21[(3'h5):(2'h2)])));
endmodule

module module47
#(parameter param57 = ((~^(~(((8'haf) ? (8'hb7) : (7'h42)) < (^(8'hb1))))) ? (-(|(!{(7'h40)}))) : {(((^(8'hba)) ? ((7'h44) ? (8'hb3) : (8'hb3)) : (|(8'haa))) ? (|(^(8'hb9))) : ({(8'hbf), (8'ha2)} ? ((8'ha9) ? (8'ha2) : (8'ha2)) : (8'hb8)))}), 
parameter param58 = param57)
(y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire51;
  input wire [(4'hd):(1'h0)] wire50;
  input wire signed [(3'h5):(1'h0)] wire49;
  input wire signed [(4'ha):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  assign y = {wire56, wire55, wire54, wire53, wire52, (1'h0)};
  assign wire52 = wire49;
  assign wire53 = $signed((($unsigned({wire51, wire52}) ?
                      ((&(8'ha0)) ?
                          wire52 : (8'ha1)) : wire51[(3'h4):(2'h3)]) | (wire48 - ((wire50 <= wire48) ?
                      $signed((8'hb5)) : wire52[(2'h2):(1'h1)]))));
  assign wire54 = wire48[(4'ha):(3'h7)];
  assign wire55 = (((+($unsigned(wire51) || wire51)) ^~ $signed(wire52[(1'h1):(1'h1)])) | $unsigned($signed($signed(wire53[(2'h3):(2'h3)]))));
  assign wire56 = ({{((wire49 && wire48) ?
                              wire50[(1'h1):(1'h0)] : ((8'h9f) || wire50)),
                          (wire54[(3'h4):(2'h2)] ?
                              wire54[(4'h9):(2'h2)] : (wire51 ?
                                  (8'hbf) : wire55))}} ^ $signed($signed(wire49[(1'h0):(1'h0)])));
endmodule
