module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire58,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg17,
                 reg16,
                 reg15,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (~($unsigned((~wire1[(2'h3):(2'h3)])) ?
                     wire4[(2'h3):(1'h1)] : ((wire1 < wire2) - $signed(wire3))));
  assign wire6 = (wire0[(1'h1):(1'h0)] ?
                     $unsigned((-$unsigned($signed(wire3)))) : wire1[(2'h3):(1'h1)]);
  assign wire7 = $unsigned(wire6[(4'h9):(2'h3)]);
  assign wire8 = ((($signed((~|wire3)) ?
                             ($unsigned(wire6) >>> wire0) : $signed(wire1)) ?
                         $signed(wire1[(2'h3):(2'h2)]) : wire2[(1'h1):(1'h0)]) ?
                     ((~^wire6[(2'h2):(2'h2)]) ?
                         $unsigned($signed($unsigned((8'hba)))) : (^~($signed(wire6) ?
                             $signed((8'h9c)) : (wire2 ?
                                 (8'ha2) : wire4)))) : wire2);
  always
    @(posedge clk) begin
      reg9 <= ((((-(wire3 | wire7)) ?
              wire6[(1'h0):(1'h0)] : ((wire6 ?
                  wire7 : wire0) + (wire5 >= wire3))) > (wire1 ?
              ((wire5 > wire4) >>> (&wire3)) : (~|{wire4, wire6}))) ?
          $signed($unsigned($signed((^wire0)))) : $signed($signed($signed(wire1[(2'h3):(2'h3)]))));
      reg10 <= {$signed(({$signed(wire1), (wire5 <<< wire2)} ?
              (^(wire8 <= wire7)) : wire7)),
          $unsigned(wire6)};
    end
  assign wire11 = {$signed(($signed($signed(wire8)) ^ ((wire1 ?
                          wire3 : wire4) <= (^wire2)))),
                      $unsigned(wire7[(3'h6):(1'h0)])};
  assign wire12 = {((~&wire3[(5'h11):(5'h11)]) ?
                          $unsigned(wire2[(1'h0):(1'h0)]) : (^~$unsigned(wire7)))};
  assign wire13 = wire8;
  assign wire14 = wire11;
  always
    @(posedge clk) begin
      reg15 <= ($signed(wire14[(4'h9):(3'h7)]) | $signed(wire0));
      reg16 <= wire13[(1'h0):(1'h0)];
      if ($unsigned($signed(wire8)))
        begin
          reg17 <= {$unsigned(wire7[(2'h2):(2'h2)])};
        end
      else
        begin
          reg17 <= (({$signed((reg9 ? reg10 : wire1)), (8'ha6)} ?
                  $signed(wire13[(1'h0):(1'h0)]) : (^~wire12)) ?
              ((^wire0) ?
                  $signed(wire0[(4'h8):(4'h8)]) : (8'hb0)) : (~&(wire11[(2'h3):(2'h3)] ?
                  ((&reg9) >>> (wire13 >= wire0)) : (((8'hbc) && wire2) ?
                      (wire6 ~^ wire4) : (+reg9)))));
        end
    end
  module18 #() modinst59 (wire58, clk, reg17, reg16, wire6, wire11);
  assign wire60 = $signed((8'hb7));
  assign wire61 = $unsigned(wire13[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      if (($signed($unsigned(wire5)) ?
          {(wire8[(2'h2):(1'h1)] - {wire0[(1'h1):(1'h0)],
                  $signed(wire11)})} : wire5[(3'h7):(1'h1)]))
        begin
          reg62 <= $signed(wire4);
        end
      else
        begin
          reg62 <= ((!$signed((+((7'h43) >> wire1)))) != $signed(wire58[(1'h0):(1'h0)]));
        end
      reg63 <= $unsigned($unsigned(((wire61[(2'h3):(2'h2)] <= $signed(wire14)) == ($signed(wire12) >> $signed(wire5)))));
      reg64 <= $unsigned(wire1[(1'h1):(1'h1)]);
      reg65 <= (^~($signed(wire8[(3'h5):(1'h0)]) > $signed($unsigned(wire2[(1'h1):(1'h1)]))));
    end
endmodule

module module18
#(parameter param57 = ((~^(^~((^(7'h43)) ? ((8'haf) ? (8'hb5) : (8'hb7)) : ((8'hbe) ? (8'h9c) : (8'hb0))))) ^~ (((((8'hbe) ? (8'haf) : (7'h44)) ? ((8'ha9) - (8'ha9)) : (^(8'hb0))) ? ({(8'haf)} ? (+(8'haa)) : {(8'h9c)}) : (((8'hbb) ? (7'h40) : (8'hae)) ? ((8'ha8) ^~ (8'ha3)) : (-(8'hb2)))) * (~&(((8'ha6) ? (8'ha3) : (8'ha1)) >= {(8'hb8)})))))
(y, clk, wire19, wire20, wire21, wire22);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire48;
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire23,
                 wire48,
                 (1'h0)};
  assign wire23 = ({$unsigned(((^wire19) ~^ $unsigned(wire19)))} ?
                      wire22 : ({$unsigned(wire21),
                          $signed(wire22)} ^ $unsigned((wire20[(4'hc):(3'h5)] ?
                          $unsigned(wire21) : {wire19, wire22}))));
  module24 #() modinst49 (.wire25(wire23), .wire27(wire22), .clk(clk), .wire26(wire21), .wire28(wire20), .wire29(wire19), .y(wire48));
  assign wire50 = wire22[(5'h14):(3'h6)];
  assign wire51 = (~^((^~{$signed(wire20), wire20}) > wire48[(4'hb):(2'h3)]));
  assign wire52 = $signed((((&((8'hb2) < wire20)) == $unsigned($unsigned((8'had)))) ?
                      ($unsigned($signed(wire21)) | wire19) : ((wire19[(4'hb):(4'hb)] && wire20[(1'h1):(1'h0)]) | wire48)));
  assign wire53 = ({($unsigned($unsigned((8'hab))) & (~|wire21[(4'ha):(4'h9)]))} << $unsigned($signed(((wire21 ?
                      wire51 : wire20) * $unsigned(wire22)))));
  assign wire54 = ($unsigned((~^wire20[(3'h5):(3'h4)])) ?
                      ((wire23[(4'h8):(3'h6)] ?
                          (wire21[(4'he):(4'hd)] > ((7'h42) <<< wire19)) : ($unsigned(wire50) <<< $unsigned(wire20))) != wire51) : (wire51 ?
                          wire19 : {wire51,
                              ($unsigned(wire23) * $signed(wire50))}));
  assign wire55 = (^~$signed($signed((8'ha4))));
  assign wire56 = ((^$signed(wire55)) * {(wire53 ?
                          (((8'h9c) < wire55) ^~ wire50) : (|{(8'ha6)}))});
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire signed [(3'h4):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire27;
  input wire signed [(3'h6):(1'h0)] wire26;
  input wire [(2'h3):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(((((wire29 ? wire25 : wire26) ?
                  (wire27 >>> wire26) : (wire26 ? wire28 : wire28)) ?
              {wire29} : ($signed(wire25) ^ wire26)) ?
          (-$signed(wire29[(2'h2):(1'h0)])) : ((wire29 ?
              wire28 : (~|(8'hbf))) != $signed((!wire27))))))
        begin
          reg30 <= wire26;
        end
      else
        begin
          reg30 <= $unsigned((wire26[(3'h5):(3'h5)] ?
              (({wire29, wire28} ?
                  (^reg30) : reg30) && (+wire25[(1'h1):(1'h0)])) : ($signed($signed((8'hab))) & $unsigned($unsigned(reg30)))));
          reg31 <= $unsigned(wire25);
          reg32 <= {wire26[(1'h1):(1'h0)],
              {($signed($unsigned(reg31)) ?
                      $signed((~wire28)) : ({wire27} ?
                          ((8'hbd) ?
                              wire27 : wire29) : wire27[(4'h9):(2'h3)]))}};
          reg33 <= wire29;
        end
      reg34 <= ((~|(-reg30)) ? (-{wire27[(3'h6):(3'h5)]}) : {wire29});
      reg35 <= ($signed((~&({wire26, reg33} ?
          $unsigned(reg32) : (wire28 == wire26)))) << reg32);
      if ($signed(($unsigned(({wire29} ?
          reg31 : {wire25})) || (~^$unsigned({(8'hb1)})))))
        begin
          reg36 <= $unsigned((~^(reg34[(3'h5):(2'h2)] > reg35[(2'h3):(1'h1)])));
          if (reg33[(1'h1):(1'h0)])
            begin
              reg37 <= (+(reg31[(3'h5):(3'h4)] ?
                  $unsigned($unsigned(wire28)) : $signed(reg35[(4'ha):(1'h0)])));
            end
          else
            begin
              reg37 <= (((!$signed((reg30 == reg32))) ?
                      reg33 : (((wire26 >> wire29) >>> {reg30, wire26}) ?
                          ($signed((8'hb5)) ?
                              {reg34,
                                  reg35} : (wire29 <<< wire25)) : $signed(reg31[(4'hb):(3'h6)]))) ?
                  $unsigned($unsigned(reg33)) : (^reg33[(3'h4):(2'h2)]));
              reg38 <= (~&{$unsigned(wire26),
                  $signed(((reg34 ? reg37 : wire29) > ((8'ha5) >= reg34)))});
              reg39 <= ((+$unsigned((reg38[(3'h7):(3'h4)] ^ (reg31 ?
                  wire26 : (7'h40))))) || wire29);
            end
          reg40 <= (~|{reg35});
        end
      else
        begin
          reg36 <= (reg33 <= ({wire26,
              $signed((reg40 ? (8'hb5) : (8'ha8)))} ^ (($unsigned(reg35) ?
                  reg33[(3'h5):(2'h2)] : wire29) ?
              wire26[(1'h0):(1'h0)] : wire28)));
          if ((!{($signed((|wire27)) ? $signed((reg37 != reg38)) : reg35),
              {reg39[(3'h6):(2'h2)], reg33[(5'h10):(3'h6)]}}))
            begin
              reg37 <= ((^reg31) ? $signed(wire28[(1'h0):(1'h0)]) : wire25);
              reg38 <= $signed($unsigned({$signed((reg39 ^~ (7'h40))),
                  wire27[(4'hb):(1'h0)]}));
            end
          else
            begin
              reg37 <= (($signed(($unsigned((8'ha1)) ?
                  wire29 : wire28)) >> $signed((^(reg31 ?
                  wire25 : wire27)))) <= (&((reg40 ?
                  reg30[(1'h1):(1'h0)] : $signed(wire26)) ~^ ((-reg31) << (-reg30)))));
            end
          reg39 <= (~^$signed(((reg37[(1'h1):(1'h0)] < $signed(reg38)) ?
              reg39 : reg33)));
          reg40 <= (^(reg33[(5'h10):(1'h1)] <<< reg32[(5'h11):(2'h3)]));
        end
    end
  assign wire41 = $unsigned($unsigned(((reg39 ?
                          (-reg38) : (reg38 ? reg35 : (8'hb0))) ?
                      (!(|reg34)) : (|reg37[(3'h4):(3'h4)]))));
  assign wire42 = wire26;
  assign wire43 = ((~^{reg31}) ? $signed(reg40) : reg37[(3'h4):(3'h4)]);
  assign wire44 = (wire28[(2'h2):(1'h0)] || ((7'h43) & ((^(reg37 - reg40)) == {$unsigned(wire42),
                      (8'hb8)})));
  assign wire45 = $unsigned((wire42[(1'h0):(1'h0)] * ({((8'ha0) >>> wire29)} ?
                      $unsigned(reg36[(4'he):(1'h0)]) : (reg40 ?
                          wire27[(5'h13):(4'hd)] : (8'hb0)))));
  assign wire46 = $unsigned((({$signed(wire26)} > reg37) >>> $signed(((~^wire29) == $signed(reg30)))));
  assign wire47 = ((&wire45[(1'h1):(1'h0)]) ?
                      (^~({$signed(wire41)} + reg35[(3'h7):(1'h0)])) : $unsigned(wire28[(1'h0):(1'h0)]));
endmodule
