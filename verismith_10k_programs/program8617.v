module top
#(parameter param56 = (^(((^~(8'h9f)) ? (((8'ha8) >>> (8'h9c)) | (&(7'h40))) : {((8'ha6) ? (8'hab) : (8'ha8))}) ? (|{(+(7'h40))}) : {(((8'ha7) >>> (7'h41)) ? (^(8'h9f)) : (~|(8'hbf))), (^~((8'h9f) ? (8'hab) : (8'ha3)))})), 
parameter param57 = (+((({(8'hb8)} & (8'hb4)) ? (~(param56 == param56)) : ({param56} ? (~param56) : (7'h43))) <<< (^param56))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h22c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire11;
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire38,
                 wire37,
                 wire36,
                 wire24,
                 wire11,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(((^$signed(wire0)) ?
              (wire4 || (wire1 ^~ wire0)) : (wire4[(3'h5):(3'h5)] ^~ (~&wire0)))) ?
          $signed(wire0[(2'h2):(1'h0)]) : (&$unsigned((wire3 * (wire2 ?
              wire2 : wire2))))))
        begin
          reg5 <= (~^(+(wire4[(4'hc):(3'h7)] || (wire4[(2'h2):(1'h1)] ?
              {wire0} : wire3[(3'h6):(3'h4)]))));
        end
      else
        begin
          reg5 <= (~|(wire3 ?
              $signed(((~^wire0) ?
                  $unsigned(wire2) : (wire3 - reg5))) : $signed(((8'hb8) << wire0[(3'h5):(1'h0)]))));
          reg6 <= {($signed(({wire4, reg5} ?
                  ((8'ha8) || wire4) : wire0[(2'h3):(2'h3)])) <= {$signed((wire4 << wire0))}),
              wire0[(2'h3):(2'h2)]};
          reg7 <= reg5[(3'h5):(3'h5)];
        end
      reg8 <= {wire4,
          $unsigned(($signed(((8'ha3) <<< (7'h44))) ?
              (8'ha2) : (wire3 + (~^(8'hb2)))))};
      reg9 <= ((wire0 ?
          (({reg5} <= wire4) ?
              (wire2[(4'h9):(4'h9)] ?
                  ((8'ha8) ? reg5 : reg5) : (reg7 ?
                      reg8 : wire3)) : ($unsigned(wire1) + $signed(wire1))) : $signed(wire1[(3'h7):(1'h1)])) <= $signed(reg6));
      reg10 <= (((~|{$signed((7'h40))}) ^~ $unsigned((~^$signed(wire3)))) || wire2);
    end
  assign wire11 = $signed({$unsigned((!$signed(reg5)))});
  always
    @(posedge clk) begin
      reg12 <= (~|{((!(reg7 ? reg6 : wire0)) != (wire3 ?
              {reg5, wire11} : (reg10 ? wire4 : reg7))),
          $signed(reg9[(2'h3):(2'h3)])});
      reg13 <= wire1[(3'h7):(2'h3)];
      reg14 <= reg7;
      reg15 <= {$signed($unsigned((~|reg7[(4'ha):(4'h9)]))),
          ({wire4[(4'hc):(2'h3)]} ?
              reg6 : $signed((reg5 ? (reg9 ^~ wire0) : (reg6 || reg14))))};
      if (reg13[(1'h1):(1'h1)])
        begin
          reg16 <= $signed({$unsigned(wire3)});
          if (($unsigned(reg7[(3'h7):(3'h5)]) > wire3))
            begin
              reg17 <= $unsigned((8'hab));
              reg18 <= reg17;
              reg19 <= wire3;
              reg20 <= (-reg10);
            end
          else
            begin
              reg17 <= $signed(((8'haf) ? $signed($signed((|reg18))) : {reg5}));
              reg18 <= (&reg12[(2'h3):(1'h0)]);
              reg19 <= (reg20[(3'h5):(1'h1)] ?
                  (8'ha4) : (reg6[(3'h4):(3'h4)] <<< ($signed((reg10 ?
                          reg9 : wire0)) ?
                      $unsigned(reg18) : $signed({(8'hbb)}))));
              reg20 <= $signed((!wire0[(1'h0):(1'h0)]));
              reg21 <= ($unsigned($unsigned(reg12)) ?
                  reg15[(3'h5):(2'h2)] : ({((~&reg7) ?
                          (reg19 <<< reg15) : {(8'hb3), reg12}),
                      (^{reg8,
                          reg15})} & ($unsigned(((8'haf) <= reg20)) * reg13[(3'h4):(1'h0)])));
            end
        end
      else
        begin
          if (reg5[(3'h4):(2'h3)])
            begin
              reg16 <= reg8[(1'h1):(1'h0)];
              reg17 <= ($signed($unsigned($signed((reg16 ? (8'hb9) : reg5)))) ?
                  {((^~$unsigned(reg9)) ? wire2[(3'h5):(1'h0)] : (!reg19)),
                      reg10} : $signed($unsigned(reg16)));
              reg18 <= $signed($unsigned((((+reg12) >> (reg19 ? wire3 : reg7)) ?
                  reg13 : $signed(wire2[(1'h0):(1'h0)]))));
              reg19 <= (|(($signed((|wire2)) ?
                  (-((8'hba) != reg17)) : $unsigned(wire0)) >>> reg21[(3'h7):(2'h2)]));
            end
          else
            begin
              reg16 <= $signed((($signed(wire2[(3'h7):(3'h4)]) ?
                      (7'h42) : wire2) ?
                  $signed($unsigned(reg17[(1'h1):(1'h0)])) : reg6[(2'h3):(1'h0)]));
              reg17 <= reg21[(1'h0):(1'h0)];
            end
          reg20 <= $signed(wire1[(4'h9):(4'h9)]);
          reg21 <= reg17[(1'h1):(1'h1)];
          reg22 <= reg15[(3'h6):(2'h2)];
          reg23 <= ($unsigned($unsigned(reg9[(1'h0):(1'h0)])) ?
              reg20 : wire2[(4'h8):(4'h8)]);
        end
    end
  assign wire24 = {$unsigned(reg12)};
  always
    @(posedge clk) begin
      if ($unsigned((^((^~(reg13 ? wire11 : (8'hbb))) ?
          reg7[(4'hb):(3'h7)] : $unsigned(wire3[(2'h3):(2'h2)])))))
        begin
          reg25 <= (8'hb8);
          reg26 <= $unsigned({reg12});
          if ($unsigned(wire2[(2'h3):(2'h2)]))
            begin
              reg27 <= (-{(+(+reg17))});
            end
          else
            begin
              reg27 <= {wire4[(3'h5):(1'h0)]};
              reg28 <= wire1;
              reg29 <= $unsigned(reg15[(1'h0):(1'h0)]);
              reg30 <= ($signed(($unsigned(reg15[(1'h1):(1'h1)]) ?
                      ($unsigned(wire4) >>> (reg26 ?
                          (8'hba) : reg25)) : {(^~reg9)})) ?
                  reg19[(3'h5):(3'h5)] : $unsigned((~wire4[(3'h7):(3'h4)])));
              reg31 <= reg30;
            end
        end
      else
        begin
          reg25 <= reg29;
        end
      reg32 <= (((+reg5) ?
              (|$signed((wire3 ? wire4 : reg19))) : ($signed((reg7 ?
                      reg27 : reg29)) ?
                  {(wire0 + reg13), reg28} : {(^~(8'ha9)), (~|(8'hba))})) ?
          (~^reg8[(1'h1):(1'h0)]) : reg6[(3'h5):(2'h3)]);
      reg33 <= (reg12 ? reg32 : $signed(wire2[(3'h7):(3'h5)]));
      reg34 <= ($signed(($signed({reg13}) ? $signed($signed(reg28)) : reg23)) ?
          wire0[(2'h2):(1'h1)] : $signed(((~^(reg18 ?
              (8'h9f) : reg17)) && (~|reg12))));
      reg35 <= (+((7'h44) ?
          $unsigned(reg19) : ($unsigned((reg10 || reg22)) >= reg14[(3'h5):(3'h4)])));
    end
  assign wire36 = (^$signed(($signed($unsigned(reg15)) ?
                      ($signed(wire2) ?
                          (~|(8'hae)) : (^~(8'hbd))) : (~$unsigned(reg9)))));
  assign wire37 = $unsigned({((~|reg5[(2'h3):(1'h1)]) ?
                          (((8'hac) ? reg15 : wire3) ?
                              (wire36 & reg12) : (reg12 << reg5)) : (reg21[(1'h1):(1'h0)] ?
                              (^~wire24) : (wire2 <<< reg13))),
                      reg13});
  assign wire38 = wire11;
  always
    @(posedge clk) begin
      if ($unsigned(reg32[(5'h10):(2'h3)]))
        begin
          reg39 <= (($unsigned(reg31[(4'hc):(2'h3)]) ^~ reg31) >= $unsigned((((!reg25) != wire0) >= (8'hab))));
        end
      else
        begin
          reg39 <= reg6[(3'h4):(1'h1)];
          reg40 <= (&((reg27 != $signed(((8'hb4) >>> wire36))) ^ (~|wire0)));
          if (reg34[(1'h0):(1'h0)])
            begin
              reg41 <= reg22;
              reg42 <= {{(!$unsigned(((8'hb3) ~^ reg26)))}};
              reg43 <= $unsigned(wire1);
              reg44 <= (^(^~$unsigned(((wire24 << reg18) <<< $signed((8'ha8))))));
              reg45 <= reg21;
            end
          else
            begin
              reg41 <= $signed(wire0);
              reg42 <= (~|$signed(wire0[(1'h0):(1'h0)]));
              reg43 <= $unsigned(reg19);
              reg44 <= (reg40[(1'h1):(1'h1)] >>> (~|{((+reg5) ^ (reg22 ^ reg27))}));
              reg45 <= ($unsigned($unsigned(reg40)) ?
                  $signed($unsigned(wire36[(3'h7):(3'h6)])) : (^~reg18));
            end
          reg46 <= {$unsigned((wire36[(3'h6):(1'h1)] ? (^reg12) : wire2))};
          reg47 <= wire0[(2'h2):(1'h0)];
        end
      reg48 <= reg23;
      reg49 <= {(~&$unsigned($unsigned(reg8[(3'h7):(2'h3)]))), $signed(reg20)};
      reg50 <= reg16;
      reg51 <= {wire36[(4'hd):(4'hb)]};
    end
  assign wire52 = (~$unsigned($unsigned($signed($unsigned(reg28)))));
  assign wire53 = reg18[(1'h1):(1'h0)];
  assign wire54 = ((^~($unsigned($unsigned(reg20)) ?
                      $unsigned(reg16[(1'h1):(1'h1)]) : (^$unsigned(reg10)))) != reg5[(3'h5):(1'h0)]);
  assign wire55 = ((^~$signed($signed(reg34[(1'h1):(1'h1)]))) ?
                      $unsigned(({reg49} ?
                          ((+reg25) < $signed(reg30)) : reg29[(3'h4):(2'h3)])) : $unsigned((8'haa)));
endmodule
