module top
#(parameter param33 = (-{(^~(8'hac)), ((((8'hbf) ? (8'h9d) : (8'hae)) != (8'ha8)) ? (~|{(8'hb7), (7'h41)}) : {(&(8'haf)), ((8'hba) ? (8'hb1) : (8'hb4))})}), 
parameter param34 = (param33 ? (&(((param33 != param33) ? {(8'ha2)} : param33) ? ({param33, (8'ha2)} ? param33 : (param33 ? param33 : param33)) : (~param33))) : param33))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire22,
                 wire21,
                 wire11,
                 wire10,
                 wire4,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire1[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg5 <= ((~|wire4[(3'h7):(1'h1)]) ?
          $signed(wire0) : ($signed(($unsigned(wire4) ?
              $signed(wire1) : (wire0 ?
                  wire1 : (8'ha3)))) >>> {wire0[(3'h7):(1'h1)]}));
      reg6 <= $unsigned(wire0[(1'h0):(1'h0)]);
      reg7 <= wire2;
      if ($unsigned((wire2 ?
          $signed((-$signed(reg5))) : ((wire4 ?
              wire2 : $signed(wire3)) == (^$unsigned((8'hb0)))))))
        begin
          reg8 <= {(-$signed($unsigned($unsigned(wire1))))};
          reg9 <= $signed((&($signed((&wire1)) ? (~^(reg7 != reg6)) : wire4)));
        end
      else
        begin
          if ({(+(reg5[(2'h3):(1'h1)] ? $signed(((8'hb9) << reg7)) : wire2)),
              reg9[(3'h4):(1'h0)]})
            begin
              reg8 <= $signed(($signed(wire1) < wire0[(3'h6):(3'h4)]));
            end
          else
            begin
              reg8 <= wire0[(4'he):(3'h4)];
              reg9 <= (reg8 ?
                  ((wire1 ?
                      (((8'hab) ? reg5 : wire4) ?
                          reg6 : wire2[(5'h10):(4'ha)]) : ($unsigned(wire0) ?
                          (reg5 ?
                              reg5 : (8'hb2)) : (reg8 < wire4))) > $signed((~^{wire1}))) : {$signed(reg6)});
            end
        end
    end
  assign wire10 = $signed({$unsigned((^~((8'hb5) >= wire0))), reg6});
  assign wire11 = reg8;
  always
    @(posedge clk) begin
      if (wire11[(1'h0):(1'h0)])
        begin
          reg12 <= (^(reg7 ?
              $signed(($unsigned(reg7) ?
                  (~&(8'haa)) : wire11)) : $signed($signed($unsigned(wire1)))));
          reg13 <= {(+wire2[(1'h1):(1'h1)])};
        end
      else
        begin
          reg12 <= {$unsigned((~|$unsigned(wire10[(3'h6):(2'h3)])))};
          reg13 <= {{wire4[(1'h1):(1'h1)], wire11}};
          reg14 <= (~^(wire1 >= $unsigned(wire3)));
          if (reg13)
            begin
              reg15 <= $unsigned($signed($signed({(reg13 <= reg6), reg14})));
              reg16 <= $signed(((wire0[(2'h2):(1'h1)] >= (~$signed(reg5))) ?
                  (~&$signed($signed((7'h41)))) : wire1[(4'hc):(3'h6)]));
            end
          else
            begin
              reg15 <= $signed($signed({((reg16 - reg7) ?
                      wire1[(4'hc):(4'h8)] : wire3[(3'h5):(1'h0)]),
                  ((wire10 ? wire4 : reg7) >= {(8'hb6), wire2})}));
              reg16 <= ((^~wire0) >>> $unsigned(((((8'hb4) ? wire11 : wire11) ?
                  (wire1 ? wire4 : (8'ha0)) : (reg12 ?
                      reg7 : wire4)) == {(reg9 < reg14)})));
              reg17 <= (7'h43);
              reg18 <= {reg5[(2'h2):(1'h1)],
                  {((~$unsigned(wire0)) > $unsigned((~&reg16)))}};
              reg19 <= (($unsigned(wire0[(4'he):(3'h4)]) ?
                      $unsigned(wire11) : $signed(((reg13 ? reg18 : reg17) ?
                          wire4 : (^~reg15)))) ?
                  ($signed(reg14) ?
                      $unsigned((-reg17)) : $unsigned((|(reg6 ?
                          wire4 : reg15)))) : (~reg9));
            end
          reg20 <= reg15;
        end
    end
  assign wire21 = $signed((!wire1[(4'h8):(3'h4)]));
  assign wire22 = (reg5 ?
                      ($signed(({reg19} ? reg9[(3'h4):(1'h1)] : (^~wire11))) ?
                          $unsigned((|(reg16 ?
                              reg15 : reg12))) : ($signed((reg5 ?
                              reg5 : wire10)) < reg19)) : $unsigned($unsigned(reg18[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire11[(3'h6):(1'h1)])
        begin
          reg23 <= reg12[(3'h6):(3'h6)];
          reg24 <= reg16[(4'h9):(1'h1)];
          reg25 <= (^wire11[(1'h0):(1'h0)]);
          reg26 <= (8'h9c);
        end
      else
        begin
          reg23 <= (reg13[(1'h1):(1'h0)] ?
              $signed(((reg14[(4'hd):(2'h3)] ?
                      ((8'ha2) | reg24) : (reg24 ? reg9 : reg8)) ?
                  (~|reg6) : $unsigned((reg14 ?
                      reg12 : wire11)))) : $unsigned(((~^$signed(wire11)) < reg8[(4'hb):(2'h3)])));
        end
      reg27 <= (($unsigned($signed((~reg17))) ?
              (((+reg8) <<< (reg16 ?
                  reg17 : reg6)) ^ $signed(reg20)) : (wire0[(3'h4):(3'h4)] ?
                  wire1 : reg8[(4'hf):(2'h3)])) ?
          reg14 : $signed($signed(reg7)));
    end
  assign wire28 = $signed(reg18);
  assign wire29 = $signed($signed(reg18));
  assign wire30 = reg12[(4'h8):(2'h3)];
  assign wire31 = (8'ha0);
  assign wire32 = reg9;
endmodule
