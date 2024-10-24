module top
#(parameter param32 = (^{(+({(8'hbe), (8'ha1)} ? {(8'h9f), (8'ha8)} : ((8'ha4) ~^ (8'hab)))), (|(8'hbf))}), 
parameter param33 = (((+(&(+param32))) == (((param32 ~^ (7'h42)) ? (&param32) : (param32 != param32)) ? (&(param32 ? (8'had) : param32)) : ((~|param32) ? param32 : (~|param32)))) ? ((^~(param32 - param32)) ^~ param32) : (+param32)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire24,
                 wire23,
                 wire4,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {((((wire0 ?
                         wire1 : wire0) <= $unsigned(wire2)) & ((&wire1) < (wire0 != wire3))) & {$unsigned((-wire1))})};
  always
    @(posedge clk) begin
      if ((wire4 ? $unsigned($signed(wire3)) : $unsigned(wire1)))
        begin
          if (wire4[(2'h2):(2'h2)])
            begin
              reg5 <= (wire4[(4'h9):(1'h0)] ? (-wire0[(2'h2):(1'h0)]) : wire4);
              reg6 <= $unsigned(wire3);
              reg7 <= ((8'ha3) ?
                  $unsigned($unsigned({$unsigned(wire4),
                      (8'hb9)})) : (!{wire1}));
            end
          else
            begin
              reg5 <= $signed(wire3);
              reg6 <= ((+wire4[(4'hc):(4'h8)]) >> (~|$signed({(~|reg6)})));
              reg7 <= reg6;
              reg8 <= ({((^$unsigned(wire1)) ?
                          {$signed(reg7), $signed(wire2)} : (~^{reg5, wire0})),
                      {(+$unsigned((8'hbf))), $unsigned(reg5)}} ?
                  reg7 : ($unsigned($unsigned($unsigned(wire3))) < $signed(({wire1,
                      wire3} >= (~|(8'hb8))))));
            end
          reg9 <= ({({(|wire0),
                      (|reg5)} >= (wire1[(3'h7):(3'h6)] <= (reg5 == reg8)))} ?
              $unsigned((8'hb0)) : (8'hbf));
        end
      else
        begin
          reg5 <= (((($signed(wire4) ^~ wire3[(3'h4):(3'h4)]) << $signed((reg9 <= wire1))) && wire4[(1'h0):(1'h0)]) ?
              $signed({reg6[(4'h8):(1'h0)]}) : wire0);
          reg6 <= reg5[(3'h5):(1'h1)];
          reg7 <= $signed(((wire4[(3'h5):(2'h2)] ?
              reg5 : reg9) > wire1[(4'ha):(2'h3)]));
          reg8 <= ($unsigned($unsigned((((8'h9c) > wire3) ?
              (-wire4) : $unsigned(wire1)))) ~^ reg8[(4'h8):(3'h4)]);
        end
      if (reg6[(5'h11):(1'h0)])
        begin
          reg10 <= reg7[(1'h1):(1'h1)];
          if ({$unsigned((+(^(reg10 >> wire1))))})
            begin
              reg11 <= wire4;
              reg12 <= $signed((-(&((~^reg11) + reg10))));
              reg13 <= wire4;
            end
          else
            begin
              reg11 <= $signed(reg9);
            end
        end
      else
        begin
          reg10 <= $signed(wire1);
          if ($unsigned(((~|({reg9, reg8} ^ reg6)) ?
              wire2[(1'h1):(1'h1)] : (!{reg10[(5'h13):(4'hd)]}))))
            begin
              reg11 <= ((wire0 >> reg10) ?
                  ($unsigned(reg8[(4'he):(4'h9)]) ^ $unsigned($signed($signed((8'hb8))))) : {($signed((reg10 ~^ reg12)) & $signed((~wire3))),
                      wire4[(1'h0):(1'h0)]});
              reg12 <= (^$signed(($signed(wire1) > {(wire0 - wire3)})));
            end
          else
            begin
              reg11 <= (reg9 + $unsigned({reg13}));
              reg12 <= reg12[(1'h1):(1'h1)];
              reg13 <= $unsigned(reg8[(5'h14):(3'h6)]);
            end
          reg14 <= $signed($unsigned(((+wire1[(4'ha):(2'h3)]) ?
              $unsigned(reg13[(5'h10):(4'hd)]) : wire2[(4'hd):(3'h5)])));
          reg15 <= $signed(reg12);
          reg16 <= ({{(!reg7[(4'h9):(3'h4)]), wire0[(1'h0):(1'h0)]}} ?
              (($signed((wire1 != reg5)) ?
                  ($unsigned(wire4) << $unsigned(wire1)) : wire4) ^ wire0[(1'h1):(1'h1)]) : $signed(($unsigned((wire0 ?
                      reg6 : reg5)) ?
                  (reg7 ?
                      reg15[(4'hd):(4'ha)] : (~^reg6)) : ($unsigned(reg12) + $signed(reg8)))));
        end
      reg17 <= (&(wire3[(2'h2):(1'h0)] & $unsigned($unsigned(reg16))));
      if ((reg17 ?
          $signed(reg13[(3'h7):(3'h7)]) : {(~&reg7[(4'hc):(2'h3)]),
              (wire1 ? reg6 : ($unsigned(wire3) <<< reg14[(1'h1):(1'h1)]))}))
        begin
          reg18 <= (wire0[(2'h3):(2'h3)] ?
              (reg7 | ($signed((~reg15)) != {(&reg8)})) : $signed(((8'hbc) ?
                  $signed((~reg14)) : (reg7 ?
                      $signed(reg17) : (reg13 ? reg12 : reg11)))));
          reg19 <= ($signed((-(~(^wire0)))) ?
              wire4[(3'h7):(2'h3)] : $signed(wire3[(4'h9):(4'h9)]));
          reg20 <= (+reg17[(2'h3):(1'h1)]);
          reg21 <= (wire0 >>> wire1[(4'hb):(2'h2)]);
          reg22 <= $unsigned((8'ha2));
        end
      else
        begin
          reg18 <= $unsigned({$signed((-reg19))});
          reg19 <= ((!{$signed((reg19 ? reg18 : reg7)),
              (((8'hac) ?
                  wire0 : wire1) > $signed((8'hbd)))}) >>> {$unsigned($signed(wire2)),
              ($signed($signed(wire1)) ?
                  reg15[(5'h12):(2'h3)] : ($unsigned(reg16) >> $unsigned(reg9)))});
          reg20 <= (reg15 ? (~wire4) : (+reg10[(4'hd):(1'h0)]));
        end
    end
  assign wire23 = (wire1 ? reg17 : $unsigned(reg11[(4'h8):(3'h6)]));
  assign wire24 = $signed($signed($unsigned((~{reg6, reg19}))));
  always
    @(posedge clk) begin
      reg25 <= reg14;
      reg26 <= $signed(((($signed((8'ha4)) ~^ (reg12 == reg20)) >= ($unsigned(wire24) ?
              wire4[(4'ha):(3'h5)] : (reg16 | reg18))) ?
          (^$signed((reg10 & reg8))) : reg15[(1'h0):(1'h0)]));
      reg27 <= $signed({(^~$signed((reg12 && reg14))),
          $unsigned(wire23[(4'h8):(2'h2)])});
      reg28 <= $unsigned(wire3[(4'hb):(2'h3)]);
    end
  assign wire29 = (~^$unsigned((reg22[(5'h10):(4'hb)] != wire0[(2'h3):(2'h2)])));
  assign wire30 = (^{((!wire1) & reg19)});
  assign wire31 = reg7;
endmodule
