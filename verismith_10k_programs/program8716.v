module top
#(parameter param59 = (((|(8'hb2)) ^~ (({(8'ha0)} < ((8'ha3) == (8'hb7))) & (8'hb1))) ? ({(^(8'hbe))} * {(+(~^(8'h9d))), {{(8'ha8)}}}) : (!(-((~|(8'ha7)) ^~ (~^(7'h40)))))), 
parameter param60 = ({((~|{(8'hba), param59}) ? (^(^~param59)) : param59)} ? (+(!{(param59 ~^ param59)})) : (param59 ? (((param59 ? param59 : param59) ? {param59, param59} : {param59, param59}) ? ((~param59) ? (param59 ? param59 : (8'ha9)) : (param59 >= (8'hb2))) : (~(param59 ? param59 : param59))) : ((~|(param59 ? param59 : param59)) ~^ param59))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1fa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire42,
                 wire22,
                 wire21,
                 wire19,
                 wire5,
                 wire4,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
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
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire4 = {{(((wire3 ? wire0 : (8'ha4)) >= wire1[(3'h5):(3'h4)]) ?
                             $signed(wire0) : ((&wire3) ?
                                 wire3 : {wire0, (8'hb1)})),
                         (wire2[(2'h2):(1'h0)] ^~ $signed($signed((8'h9e))))},
                     $unsigned($signed({(wire3 && wire0), wire0}))};
  assign wire5 = $signed(wire4);
  module6 #() modinst20 (.y(wire19), .wire9(wire0), .wire8(wire3), .clk(clk), .wire10(wire1), .wire7(wire5));
  assign wire21 = wire0[(4'h8):(1'h1)];
  assign wire22 = wire21[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg23 <= wire19[(2'h3):(2'h2)];
      if ((&$unsigned(wire21[(4'h8):(1'h1)])))
        begin
          reg24 <= (!wire4[(3'h6):(3'h4)]);
          reg25 <= wire19;
          reg26 <= $signed($signed(((+(wire2 - wire19)) ?
              (wire3[(1'h1):(1'h0)] ?
                  $unsigned(wire4) : (~|wire21)) : $signed((wire19 ^ (7'h44))))));
          reg27 <= $unsigned($signed({{{wire1}, $signed(wire21)},
              $signed((~|wire21))}));
        end
      else
        begin
          if (($signed((^reg23)) ?
              (^{$signed(wire0),
                  $signed((wire19 ?
                      wire22 : reg24))}) : ((^$signed(wire0[(4'hb):(3'h5)])) ~^ $signed({reg25[(1'h0):(1'h0)],
                  wire1[(2'h3):(2'h2)]}))))
            begin
              reg24 <= wire22;
              reg25 <= ((~^wire22) != wire2);
              reg26 <= $unsigned($signed({wire3[(2'h2):(1'h0)],
                  ($signed(wire19) - $signed(reg25))}));
              reg27 <= wire19[(1'h1):(1'h0)];
            end
          else
            begin
              reg24 <= $unsigned(reg23);
            end
          reg28 <= $unsigned(wire21[(3'h7):(3'h7)]);
          reg29 <= $signed(wire0[(3'h5):(2'h2)]);
        end
      reg30 <= reg27;
      if ($signed(wire3))
        begin
          if ($unsigned({wire3[(2'h2):(2'h2)], wire5[(1'h0):(1'h0)]}))
            begin
              reg31 <= ($unsigned(reg30[(4'hc):(4'hb)]) ? reg26 : reg29);
              reg32 <= ({$unsigned(((wire3 ?
                          reg24 : wire0) + wire2[(1'h1):(1'h1)])),
                      ($unsigned($unsigned(wire21)) == $unsigned(reg23))} ?
                  $unsigned(wire3[(2'h2):(1'h1)]) : (~&wire22[(3'h6):(3'h5)]));
              reg33 <= $signed(($unsigned(wire3[(3'h6):(1'h0)]) ?
                  (({reg31, wire0} || $signed(reg24)) ?
                      (8'hbf) : (+(reg32 == wire0))) : (&$unsigned(reg28))));
              reg34 <= wire21[(1'h1):(1'h0)];
            end
          else
            begin
              reg31 <= ($unsigned((7'h40)) << wire2);
              reg32 <= reg30;
              reg33 <= $signed(reg26[(3'h6):(3'h4)]);
              reg34 <= wire1[(1'h1):(1'h1)];
              reg35 <= wire2;
            end
          reg36 <= wire5[(3'h4):(2'h2)];
          reg37 <= ($signed(reg25) ?
              ($unsigned({(wire21 ? (8'hb6) : (8'hb4)),
                  wire19[(3'h5):(2'h2)]}) != (reg32 > (reg35[(1'h0):(1'h0)] >> $signed(wire21)))) : {$unsigned((-{wire1,
                      reg26})),
                  ((^$unsigned(wire2)) ?
                      reg26[(2'h2):(1'h1)] : (reg27 ^~ $unsigned(wire21)))});
          reg38 <= wire0[(2'h3):(1'h0)];
          if (reg38[(3'h5):(1'h0)])
            begin
              reg39 <= reg27[(2'h3):(1'h1)];
              reg40 <= (8'hac);
              reg41 <= (reg40[(4'hb):(4'hb)] * reg38);
            end
          else
            begin
              reg39 <= ((reg28 ?
                  wire19[(1'h1):(1'h0)] : $unsigned(((~(8'ha3)) ?
                      $signed(wire1) : wire1))) & {$unsigned(((reg41 ^~ wire5) ?
                      $signed(reg33) : ((8'hb8) ? wire21 : (8'ha7)))),
                  reg31});
              reg40 <= $unsigned(((~^(wire19 ?
                      (reg26 == (7'h42)) : (reg35 >> reg26))) ?
                  (+(wire22 && ((8'ha7) ?
                      wire3 : reg36))) : $signed((~^reg41))));
              reg41 <= ($signed($unsigned($unsigned(wire5[(2'h2):(1'h1)]))) - (reg40[(2'h2):(2'h2)] ?
                  $signed((-(|reg25))) : (+$signed(((8'h9e) - reg30)))));
            end
        end
      else
        begin
          reg31 <= $signed((8'hb6));
        end
    end
  assign wire42 = (-reg30[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg43 <= (|(-{reg32[(3'h7):(3'h7)]}));
    end
  always
    @(posedge clk) begin
      reg44 <= ((((^~reg31[(3'h5):(1'h1)]) >>> $signed($signed((8'ha7)))) ?
              (reg39 ? $signed($unsigned((8'h9c))) : reg39) : (&reg43)) ?
          wire21[(2'h2):(1'h1)] : reg25);
      if (($unsigned((reg31[(3'h5):(2'h2)] ?
          reg32 : reg37)) >>> ({((~^reg27) ^~ reg26[(2'h3):(1'h1)]),
              reg25[(4'hd):(3'h7)]} ?
          (wire5[(3'h4):(2'h2)] ?
              $signed((reg30 ? wire2 : reg34)) : (reg27[(1'h0):(1'h0)] ?
                  $unsigned(wire5) : (reg26 ?
                      reg27 : wire5))) : (reg28 ^ ($signed((8'hbb)) >= $signed(reg35))))))
        begin
          reg45 <= {$signed($signed(($unsigned(wire1) * (-reg39))))};
          reg46 <= (~(reg27 ? reg41[(4'h8):(3'h5)] : reg34));
          reg47 <= (^$signed(($unsigned((8'ha1)) ?
              (&{wire3}) : (!$signed(reg25)))));
          if (({reg45} ? $signed(wire3[(2'h3):(2'h3)]) : reg37[(1'h1):(1'h0)]))
            begin
              reg48 <= $signed($signed($signed($signed(reg45[(5'h14):(2'h3)]))));
              reg49 <= (reg32 <= (({$unsigned(reg32)} ?
                  ((reg25 ?
                      reg41 : reg33) - reg32[(5'h11):(2'h2)]) : {$unsigned(wire2)}) ~^ reg29[(3'h7):(3'h4)]));
              reg50 <= $unsigned($signed(reg37));
            end
          else
            begin
              reg48 <= (8'hbd);
              reg49 <= (((~(((8'ha5) ?
                  reg35 : reg29) & $unsigned((8'haa)))) ^~ (reg24[(3'h5):(2'h2)] && (^reg23))) && (reg23[(1'h0):(1'h0)] ?
                  (8'hb6) : (reg48 >= wire4[(3'h5):(3'h4)])));
            end
          if (reg48[(1'h0):(1'h0)])
            begin
              reg51 <= ($signed(reg26) <= $signed(reg39));
              reg52 <= ($signed(reg45) ^ (8'ha0));
            end
          else
            begin
              reg51 <= ({reg33, (~|reg37)} ~^ reg25);
              reg52 <= ($unsigned(((~(|wire5)) ?
                  (^{reg37}) : (~^$signed((8'ha4))))) || $signed(reg37[(4'he):(1'h1)]));
              reg53 <= reg26;
              reg54 <= wire22;
            end
        end
      else
        begin
          reg45 <= {(8'haf)};
        end
      reg55 <= (reg29[(4'hc):(4'ha)] ?
          (&{$unsigned($signed(wire21)),
              $unsigned(((8'hbf) ? reg47 : reg38))}) : (^$unsigned(wire22)));
      reg56 <= ((8'ha1) == $unsigned($signed(($signed((8'h9f)) ?
          $signed((8'hb6)) : (8'haf)))));
    end
  assign wire57 = $unsigned((&reg24));
  assign wire58 = wire1;
endmodule

module module6
#(parameter param18 = (+{((&((7'h44) <= (8'hbe))) < ((^~(8'haa)) ? ((8'ha3) ? (8'ha9) : (8'hb7)) : (8'hab))), (((^(7'h44)) & (~^(8'hb6))) >= ((&(8'ha6)) >= {(8'ha7)}))}))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire11;
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  assign y = {wire17, wire16, wire15, wire14, wire12, wire11, reg13, (1'h0)};
  assign wire11 = $signed((~&(wire7[(2'h3):(2'h3)] & (&(wire9 ?
                      wire9 : (8'hb1))))));
  assign wire12 = (~^($signed(wire9) ?
                      $signed({$unsigned(wire8),
                          wire7[(1'h1):(1'h0)]}) : $signed(((wire10 ?
                              wire7 : wire9) ?
                          (wire11 <<< wire10) : {wire7}))));
  always
    @(posedge clk) begin
      reg13 <= ($unsigned((~&(^(~|wire9)))) <= (-$unsigned({$signed(wire10)})));
    end
  assign wire14 = $unsigned(wire9);
  assign wire15 = (8'hbc);
  assign wire16 = ({wire9} ?
                      wire9 : $signed({($unsigned(wire8) <= $unsigned(wire10)),
                          (wire12[(1'h1):(1'h1)] >= $signed(wire9))}));
  assign wire17 = wire16;
endmodule
