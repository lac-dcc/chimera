module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
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
                 (1'h0)};
  assign wire4 = ({wire0[(5'h13):(3'h6)]} ?
                     (($unsigned(wire0) | {(wire1 ?
                             wire2 : wire3)}) >>> $unsigned($unsigned(wire1))) : $unsigned(wire2));
  assign wire5 = (-(~|((wire1 <= $signed((8'ha5))) | wire0[(3'h4):(2'h3)])));
  assign wire6 = ((((~&(~^wire2)) ?
                         ((|(7'h44)) ?
                             $signed(wire2) : $unsigned(wire0)) : wire2) + $signed($unsigned($signed((8'h9c))))) ?
                     {wire1[(4'h9):(2'h2)], wire3} : wire1);
  assign wire7 = wire2;
  always
    @(posedge clk) begin
      if (wire5)
        begin
          reg8 <= $signed($signed($unsigned(wire1[(1'h0):(1'h0)])));
          reg9 <= wire5[(1'h0):(1'h0)];
        end
      else
        begin
          if (wire6)
            begin
              reg8 <= wire4;
            end
          else
            begin
              reg8 <= wire2[(1'h1):(1'h0)];
              reg9 <= $signed($unsigned(wire1[(4'h8):(3'h4)]));
              reg10 <= $unsigned(reg8[(2'h2):(1'h1)]);
              reg11 <= reg8[(4'hf):(1'h0)];
            end
          if (($signed({reg11[(3'h5):(1'h1)]}) ?
              {$unsigned(wire3[(1'h0):(1'h0)])} : wire6[(4'hd):(1'h1)]))
            begin
              reg12 <= $unsigned(wire4);
              reg13 <= wire5[(3'h5):(3'h4)];
              reg14 <= reg13;
            end
          else
            begin
              reg12 <= $signed($signed(((~&(-(8'ha2))) < ($signed(reg14) - ((8'hb0) >>> (7'h42))))));
            end
          reg15 <= $signed(($signed($unsigned(wire3[(3'h5):(1'h1)])) && wire0[(5'h11):(4'h8)]));
          reg16 <= ($signed((wire3 & (reg11 ? (8'hb0) : $unsigned((8'hba))))) ?
              {(wire7 ?
                      ({wire2, wire5} ?
                          wire7[(4'h9):(3'h4)] : wire5[(3'h7):(3'h6)]) : (!(reg15 >>> reg14))),
                  {(^~wire1[(3'h4):(1'h0)]),
                      $unsigned($signed(reg8))}} : ($signed(reg9) > $unsigned($signed(reg13))));
          reg17 <= (|wire0[(4'h8):(2'h2)]);
        end
      reg18 <= $signed((+({$unsigned(reg14)} | (&(wire7 < reg14)))));
    end
  assign wire19 = $signed(({wire6} ?
                      (~&((reg12 || (8'hb8)) <<< (reg17 ?
                          reg18 : reg18))) : (|$unsigned(wire1[(2'h2):(2'h2)]))));
  assign wire20 = {((wire6 != reg8) ?
                          $signed($signed($signed(reg9))) : (^~wire6[(2'h3):(1'h0)]))};
  assign wire21 = $unsigned(wire20[(1'h0):(1'h0)]);
  assign wire22 = $unsigned(reg13[(3'h7):(1'h0)]);
  assign wire23 = wire3[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg24 <= $signed((($signed({(8'hb4), (8'hb2)}) > wire21[(2'h3):(2'h2)]) ?
          reg18[(4'hc):(3'h5)] : $signed(($unsigned(reg12) ?
              (reg15 | reg13) : reg8))));
      if ((wire3 ? wire2 : $unsigned(reg15)))
        begin
          reg25 <= reg18;
          reg26 <= ({($unsigned(reg10[(2'h3):(1'h1)]) ^~ (~&reg8[(3'h4):(1'h0)]))} ?
              (~reg11[(3'h7):(1'h0)]) : (-((7'h43) ?
                  wire2[(4'h8):(1'h1)] : $unsigned($signed(wire22)))));
          reg27 <= reg18[(4'h8):(4'h8)];
          reg28 <= ((wire19 << {reg26}) & ($unsigned({(reg10 ?
                  wire21 : (8'hbb))}) * (wire1[(4'hb):(1'h1)] >= (reg18 ?
              (reg25 ^ wire2) : reg25[(3'h4):(1'h1)]))));
          if ($unsigned(wire22))
            begin
              reg29 <= ((8'haf) & (~&$unsigned(wire21)));
              reg30 <= ((($unsigned(((8'hac) - (8'hb6))) ^~ $signed($unsigned(wire23))) * $unsigned((!$signed(reg25)))) & reg10[(3'h5):(2'h2)]);
            end
          else
            begin
              reg29 <= reg12;
              reg30 <= $signed(((($unsigned(reg25) >= (8'hb2)) & (~|(~|reg15))) ^~ (&(!(wire23 ?
                  reg10 : reg14)))));
            end
        end
      else
        begin
          if ($unsigned(reg28[(3'h4):(2'h2)]))
            begin
              reg25 <= $unsigned(reg12[(2'h3):(2'h2)]);
              reg26 <= wire4;
            end
          else
            begin
              reg25 <= reg30[(3'h6):(1'h1)];
              reg26 <= ($signed((reg28[(1'h1):(1'h0)] ~^ reg13)) << wire7);
              reg27 <= reg13[(4'ha):(3'h4)];
            end
        end
      reg31 <= (((wire7 ?
              wire4[(5'h12):(1'h1)] : $signed(reg14[(1'h1):(1'h1)])) ?
          (wire0 ?
              $unsigned((&(8'hb0))) : (~$signed(wire4))) : ({$unsigned(reg24)} ?
              $signed($signed(wire23)) : $unsigned($signed(wire5)))) | (reg9[(2'h3):(1'h1)] ?
          ($unsigned(wire20[(2'h3):(1'h0)]) ?
              ((reg27 ?
                  reg26 : wire4) ^~ (^reg28)) : reg17) : ($unsigned((wire2 ?
              reg15 : wire0)) > ((wire3 << reg30) ?
              (reg12 ? reg8 : reg26) : reg13[(4'hd):(4'hb)]))));
      reg32 <= $signed((reg26[(4'hd):(2'h3)] < wire2[(1'h0):(1'h0)]));
    end
  assign wire33 = (($unsigned(reg27[(4'he):(4'hb)]) & ($unsigned($signed(reg29)) * {$signed(reg26)})) ?
                      ((-reg30) + (~(reg31 ?
                          $unsigned(wire2) : $unsigned(reg11)))) : reg27[(2'h3):(1'h1)]);
  assign wire34 = reg14;
  assign wire35 = (reg15[(2'h3):(2'h3)] > ({{wire4[(4'hc):(1'h1)]}} * $unsigned((wire34 ~^ $signed(reg29)))));
  assign wire36 = (((~(wire5 >= (-reg9))) ?
                      {{(^reg25), $signed((8'ha4))},
                          {(wire34 ? wire1 : (8'hbf)),
                              (^wire2)}} : $unsigned($signed(reg31))) & $signed($unsigned((reg31[(4'hf):(4'h8)] > reg18))));
  always
    @(posedge clk) begin
      reg37 <= ({$unsigned(reg24)} ~^ $signed(wire4[(4'hc):(1'h1)]));
      reg38 <= (+$signed((wire7[(3'h4):(2'h2)] < reg29[(4'h9):(4'h8)])));
      reg39 <= $unsigned(wire35[(4'hc):(4'h8)]);
      reg40 <= {((wire35 ?
                  {$unsigned(wire7), reg30[(4'hc):(4'h9)]} : $signed({reg15})) ?
              ({(reg32 + reg31), $signed(wire3)} ?
                  ($signed(reg24) ?
                      (reg12 ? reg11 : reg16) : wire4) : wire34) : ((-(reg27 ?
                  reg11 : wire0)) + ($unsigned(reg15) ?
                  $unsigned(wire7) : (~|(8'ha1))))),
          $unsigned((-(~^(wire19 ? wire0 : (8'hbd)))))};
      reg41 <= (~(+(((reg18 >= reg27) ?
          reg10[(2'h2):(2'h2)] : (+wire19)) * ($unsigned((7'h41)) >> $signed((8'ha3))))));
    end
endmodule
