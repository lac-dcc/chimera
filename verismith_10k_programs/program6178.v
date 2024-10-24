module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire38;
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire40,
                 wire9,
                 wire13,
                 wire38,
                 reg12,
                 reg11,
                 reg10,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2;
      reg5 <= ($unsigned($unsigned($signed($signed((8'hac))))) ~^ wire3);
      reg6 <= $unsigned(($signed($unsigned(((7'h40) ?
          wire2 : reg4))) + (^~$unsigned($unsigned(wire3)))));
      reg7 <= ((&{(~^(&wire0))}) ?
          {({$signed(reg4)} << wire1[(1'h0):(1'h0)]),
              ({wire0[(5'h10):(2'h2)], wire3} ?
                  (|(8'ha7)) : ((~^wire3) ?
                      (wire2 ? reg6 : (8'ha3)) : $signed(reg5)))} : reg6);
      reg8 <= {(|(((^reg4) < $unsigned(reg6)) ^~ reg5[(4'hf):(4'hb)])),
          (reg6[(1'h0):(1'h0)] ?
              (reg6[(2'h3):(1'h0)] > reg6) : (^~$signed($signed(reg6))))};
    end
  assign wire9 = (-$unsigned({(^~(wire0 ? reg7 : reg4)), (reg4 != (8'ha7))}));
  always
    @(posedge clk) begin
      reg10 <= reg7[(4'he):(1'h1)];
      reg11 <= (~$signed(reg5));
      reg12 <= $signed(($unsigned((wire9 ? (wire0 ^~ wire0) : $signed(reg6))) ?
          (((wire0 ?
              reg11 : (7'h42)) == (wire9 || reg7)) + reg4) : {$signed($signed((8'hbf))),
              ((^reg7) << {reg4, reg11})}));
    end
  assign wire13 = ($unsigned((reg12[(5'h11):(3'h4)] ?
                      $unsigned($signed((8'haf))) : ((~|wire2) >= ((8'ha8) ?
                          reg6 : reg7)))) && (wire0 ?
                      $unsigned(((~|reg5) <= reg4[(4'hf):(2'h3)])) : ($signed($signed(reg8)) ?
                          $signed(reg5) : ((-reg10) - (8'hb0)))));
  module14 #() modinst39 (.y(wire38), .wire16(wire1), .wire18(reg11), .wire15(wire0), .clk(clk), .wire17(reg6), .wire19(wire2));
  assign wire40 = (wire1 ? wire1 : (wire1 ~^ (~reg6)));
endmodule

module module14
#(parameter param37 = ({(+(((8'hb5) ? (8'hbb) : (7'h40)) ? ((8'ha0) << (8'hab)) : ((8'hbe) ~^ (8'hbf)))), ((((8'ha1) == (8'ha8)) != ((8'ha8) ? (8'hb7) : (8'hba))) != (((8'ha6) || (8'hac)) << ((8'ha5) ? (8'hb2) : (8'hb0))))} ? (((((8'hac) ? (8'ha2) : (8'ha6)) && {(8'hb0)}) ? {((8'hb7) ^ (7'h40)), ((8'h9f) ? (8'ha8) : (8'hbc))} : (((8'hbc) != (8'hbd)) ? ((8'ha3) * (8'had)) : (&(8'hbf)))) ^ (&(-((8'ha7) <<< (8'ha7))))) : {(~&(!(&(8'h9e)))), {({(8'ha4)} * (-(8'ha2))), (((8'ha4) ? (8'haa) : (8'hba)) <= ((8'hba) << (8'ha9)))}}))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire22,
                 wire21,
                 wire20,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire20 = wire18;
  assign wire21 = ($unsigned($signed({{wire20, wire15},
                      (wire15 & wire15)})) ^~ wire18[(3'h5):(1'h1)]);
  assign wire22 = ($signed(($unsigned(wire20) ?
                          $unsigned(((8'ha4) ?
                              wire18 : wire17)) : $signed($signed(wire19)))) ?
                      {$signed((&$signed(wire20))),
                          wire19[(3'h6):(1'h0)]} : (~|$signed(wire16[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg23 <= (wire22 < $unsigned((({wire15} ?
          wire20 : $unsigned((7'h41))) < ($signed(wire19) ?
          (|wire20) : wire15))));
      if (({((reg23[(1'h1):(1'h0)] | (~|wire18)) < $unsigned($unsigned(wire19)))} <<< ((((reg23 ?
                  wire22 : wire21) != (wire18 ? (8'hac) : reg23)) ?
              $unsigned((wire17 ? wire15 : (8'hb6))) : $signed((~|wire16))) ?
          (8'ha1) : wire21[(3'h7):(3'h7)])))
        begin
          reg24 <= wire20[(2'h2):(2'h2)];
          if (((reg24 ?
              (~|{wire21,
                  {(8'hb2)}}) : $unsigned((&$unsigned(wire21)))) <<< ($signed(wire16) ?
              (^~(8'haf)) : $unsigned(wire15))))
            begin
              reg25 <= $signed($signed((+((^~wire17) >>> $unsigned(wire15)))));
              reg26 <= $signed((wire17[(2'h2):(1'h0)] > {wire22[(4'hc):(4'h9)]}));
              reg27 <= wire22[(3'h6):(3'h5)];
            end
          else
            begin
              reg25 <= $signed(((-reg24) ?
                  (((-wire19) ? ((8'hbb) >> reg26) : $unsigned(wire19)) ?
                      {(wire21 <= wire20), (7'h41)} : (&(wire18 ?
                          reg24 : wire15))) : ((&(8'hbf)) ?
                      $signed($unsigned(wire15)) : $signed(wire17))));
              reg26 <= wire15[(3'h6):(2'h3)];
              reg27 <= {wire16[(2'h3):(2'h2)]};
              reg28 <= (-(-($signed($signed(wire20)) ?
                  $signed((|reg24)) : $signed(reg24[(3'h5):(2'h2)]))));
              reg29 <= $signed({wire18, (8'hae)});
            end
          reg30 <= wire21;
          if ({($unsigned(reg29) ? $signed(wire17) : reg26), reg30})
            begin
              reg31 <= reg29;
            end
          else
            begin
              reg31 <= (~&reg28[(4'hf):(4'hd)]);
            end
        end
      else
        begin
          if (reg26)
            begin
              reg24 <= ($unsigned((((+wire22) >>> $unsigned(reg30)) ?
                  ((!wire22) ?
                      $signed(wire22) : (reg24 ?
                          wire15 : wire18)) : $signed(((8'hb5) & (8'hb7))))) == ($signed(($signed((8'h9e)) ?
                      {wire22} : (reg31 ? wire19 : reg29))) ?
                  $signed($signed($unsigned((8'hbd)))) : ($unsigned(wire18) ?
                      $unsigned((wire18 || reg23)) : ((^reg27) | $signed(reg31)))));
              reg25 <= {$unsigned($signed($unsigned($signed((8'h9d))))),
                  (((reg28 ?
                      ((8'hbb) ?
                          reg27 : wire19) : $unsigned((8'h9e))) >>> $unsigned((8'hb6))) > {reg26})};
            end
          else
            begin
              reg24 <= ({$unsigned(((reg27 >= reg29) != $signed(reg23)))} && $unsigned(($signed(reg31[(3'h4):(1'h0)]) <<< $unsigned((~&reg31)))));
              reg25 <= {wire22};
              reg26 <= {({{wire17, ((8'hae) ? (8'hb0) : reg31)}} & {reg23}),
                  $unsigned(wire16[(4'ha):(3'h5)])};
              reg27 <= wire22;
              reg28 <= ($unsigned((8'haa)) - $unsigned((7'h40)));
            end
          reg29 <= ((&$unsigned($unsigned({wire19}))) - reg31[(1'h0):(1'h0)]);
          reg30 <= wire20;
        end
      reg32 <= $unsigned($signed(reg25[(4'h8):(4'h8)]));
    end
  assign wire33 = $signed(($unsigned(wire19) ?
                      wire15[(5'h11):(3'h4)] : $unsigned($unsigned(wire20))));
  assign wire34 = $unsigned($signed($unsigned($unsigned($unsigned(wire21)))));
  assign wire35 = $signed($unsigned((7'h44)));
  assign wire36 = $unsigned((|(~({wire20} ?
                      ((8'h9e) ? (7'h42) : reg27) : wire18))));
endmodule
