module top
#(parameter param54 = ((&(({(8'hb8), (7'h42)} ? (-(8'hb8)) : ((8'hb8) <<< (8'hb3))) ~^ (-((8'ha0) ? (8'ha6) : (8'hbb))))) ? (~{((&(8'hbc)) ? (8'had) : ((8'hbc) ^~ (8'hbd)))}) : ({(((8'hb6) ? (8'h9c) : (8'hae)) ? {(8'ha2)} : (!(7'h42))), {((8'ha1) ? (7'h41) : (8'hb8)), {(8'hae)}}} && (-(~^((8'ha8) ? (8'hb6) : (8'h9d)))))), 
parameter param55 = (+param54))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h287):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire4,
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
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
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
  assign wire4 = wire1;
  always
    @(posedge clk) begin
      if ((-wire2))
        begin
          if (wire3)
            begin
              reg5 <= (({wire1, wire3} ? wire2 : $unsigned(wire3)) <<< (8'ha8));
            end
          else
            begin
              reg5 <= $signed($signed($signed(wire3)));
              reg6 <= (reg5[(3'h4):(1'h0)] ?
                  wire3 : $unsigned(((wire1 | $signed(wire3)) ?
                      (-wire0[(1'h1):(1'h1)]) : reg5)));
              reg7 <= reg6[(3'h4):(1'h1)];
              reg8 <= $unsigned({(wire2[(1'h0):(1'h0)] + wire4),
                  $unsigned((+wire4))});
              reg9 <= $signed($unsigned(reg5));
            end
          reg10 <= ({(reg8[(4'hb):(3'h4)] >= reg6[(1'h0):(1'h0)])} <<< $signed({$signed($unsigned(reg7))}));
          if ((8'had))
            begin
              reg11 <= (~^wire1[(4'hd):(4'hd)]);
              reg12 <= (~|wire1);
            end
          else
            begin
              reg11 <= reg8[(1'h1):(1'h1)];
              reg12 <= $unsigned($unsigned($signed({(reg10 == reg9)})));
              reg13 <= $unsigned((wire4[(2'h3):(1'h1)] ?
                  {{(reg11 * wire4), wire4},
                      ((reg12 > wire3) ?
                          (8'hb8) : reg10)} : $unsigned((wire1 == (&reg9)))));
            end
        end
      else
        begin
          reg5 <= wire3;
          reg6 <= ((wire1[(2'h3):(1'h0)] ?
                  $unsigned($unsigned($unsigned(reg9))) : (8'h9d)) ?
              $signed(wire0) : $signed(($unsigned(reg8) <<< wire4[(3'h5):(2'h2)])));
          reg7 <= reg10;
          reg8 <= $signed({reg10[(2'h2):(2'h2)]});
          reg9 <= $signed(reg9[(4'hf):(1'h1)]);
        end
    end
  assign wire14 = wire3;
  assign wire15 = ($unsigned(($unsigned($signed(reg7)) || $unsigned((8'hbd)))) + reg12[(4'h9):(4'h8)]);
  assign wire16 = $signed(($unsigned(wire3) ?
                      ($signed(wire4) <= reg10[(2'h3):(1'h1)]) : $signed(wire0[(3'h6):(3'h6)])));
  assign wire17 = ((+(^~{wire3, wire14})) >= $signed($unsigned(($signed(wire4) ?
                      ((8'h9d) && (8'hac)) : $signed(reg10)))));
  always
    @(posedge clk) begin
      reg18 <= (((reg12 ?
              $unsigned(reg11) : (wire4[(3'h5):(1'h0)] * (wire2 ^ reg12))) ?
          (^wire15) : ({(reg8 > wire4)} & ($signed(wire17) ?
              (|(8'hb5)) : (8'ha1)))) != (($unsigned((wire15 ? wire2 : reg12)) ?
          reg13 : (^~(reg12 <<< wire1))) != $unsigned({$signed(wire3),
          (reg10 ~^ wire16)})));
      reg19 <= (($signed(($signed(wire4) ?
              reg12[(4'h9):(4'h8)] : (wire15 ? reg5 : reg12))) == {(((8'hb7) ?
                      reg6 : wire0) ?
                  ((8'hbc) ? wire17 : reg12) : (reg11 * reg18)),
              wire17[(4'h9):(2'h2)]}) ?
          $unsigned($signed((!$signed(wire4)))) : reg7[(4'hc):(3'h6)]);
      if ($signed((~|$signed(reg18))))
        begin
          reg20 <= $unsigned((reg6 ?
              $signed((+$unsigned(wire15))) : (-$unsigned((reg5 ?
                  reg10 : reg13)))));
          if (reg11)
            begin
              reg21 <= reg19[(2'h2):(1'h1)];
              reg22 <= $signed(reg7[(1'h0):(1'h0)]);
              reg23 <= $unsigned(wire4[(1'h1):(1'h0)]);
              reg24 <= ($unsigned($signed(($unsigned(reg20) ?
                  $unsigned(wire4) : reg7[(1'h0):(1'h0)]))) | (~&(8'had)));
            end
          else
            begin
              reg21 <= ($unsigned(reg19[(3'h4):(2'h3)]) ?
                  (!{{(reg18 ? reg23 : reg24)},
                      (|(&(8'hbe)))}) : ($unsigned({wire15[(3'h7):(3'h5)],
                      $unsigned((8'ha9))}) && $unsigned(reg7[(1'h1):(1'h1)])));
              reg22 <= reg13[(1'h1):(1'h1)];
              reg23 <= (-(^~reg7));
              reg24 <= $signed(reg12[(3'h5):(1'h1)]);
            end
          reg25 <= reg6[(2'h3):(1'h0)];
          reg26 <= {$signed(((~&reg19) ?
                  ((~reg5) ? $unsigned(reg20) : (~|reg7)) : $signed((reg5 ?
                      reg20 : (8'hb1)))))};
        end
      else
        begin
          if ({(!wire17[(4'hb):(1'h0)])})
            begin
              reg20 <= ((-((+$signed(wire14)) * ($unsigned((8'h9e)) ?
                      ((8'h9e) <= reg19) : (reg12 ? reg20 : wire0)))) ?
                  ((wire0 >>> (reg5 ?
                      (wire14 ?
                          reg21 : (8'ha5)) : $unsigned((8'ha6)))) > (7'h40)) : {$unsigned($unsigned((^~wire15))),
                      {wire17[(2'h2):(1'h0)]}});
              reg21 <= $unsigned(($unsigned(($unsigned(reg20) >> ((8'ha9) | wire3))) ?
                  (~|wire17[(4'h8):(2'h2)]) : wire15[(3'h4):(1'h1)]));
              reg22 <= {$signed((~&wire17)),
                  ({($unsigned(reg19) + reg7[(4'hd):(1'h0)]),
                          wire16[(4'he):(3'h5)]} ?
                      reg6[(5'h12):(2'h2)] : wire3)};
            end
          else
            begin
              reg20 <= $unsigned(reg23);
              reg21 <= wire15;
              reg22 <= {$signed((~&{(reg7 < reg5), reg10}))};
              reg23 <= reg8[(3'h7):(3'h5)];
              reg24 <= $unsigned($unsigned(reg23));
            end
          if ({$unsigned((!((8'ha0) ^~ {(8'hae), reg22}))),
              $signed((reg9[(4'h9):(1'h1)] ?
                  ((8'hbc) ? (~|reg6) : (reg7 * reg9)) : reg13))})
            begin
              reg25 <= (^~(~&({$signed(reg8), wire2} ?
                  ({(8'ha7)} ~^ (^wire0)) : ((reg11 ^~ wire16) ^ {wire3}))));
              reg26 <= ($unsigned(reg25) ?
                  reg23[(1'h0):(1'h0)] : wire0[(2'h3):(2'h3)]);
              reg27 <= (8'ha0);
              reg28 <= (8'ha5);
              reg29 <= reg13[(1'h0):(1'h0)];
            end
          else
            begin
              reg25 <= (wire15[(4'hd):(1'h1)] || (reg29 ?
                  wire14[(3'h4):(2'h2)] : reg18[(4'hb):(3'h6)]));
            end
          reg30 <= reg18;
        end
      reg31 <= {(^$signed(({(8'hab), reg21} ?
              (reg23 ? (8'hbc) : reg25) : (reg30 ? reg11 : wire2))))};
      reg32 <= (-reg26[(3'h4):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg33 <= reg21;
      reg34 <= {reg8[(4'h9):(2'h2)],
          ($unsigned(reg6[(1'h0):(1'h0)]) >= ($unsigned($signed(reg24)) ?
              $unsigned((reg12 == reg12)) : $unsigned(wire3[(3'h6):(2'h2)])))};
      if ((reg21 > (~^$signed(reg10))))
        begin
          reg35 <= reg13;
          reg36 <= {$unsigned((~|$unsigned(reg33[(3'h5):(2'h2)]))), (8'ha7)};
          if ($unsigned(wire4))
            begin
              reg37 <= {reg34,
                  ((reg23[(3'h6):(3'h4)] ?
                      {{reg35, reg32}} : {wire4}) != (reg25 == reg18))};
              reg38 <= $unsigned(reg18[(3'h7):(3'h7)]);
              reg39 <= $signed($unsigned((&(wire2 <= reg23[(2'h3):(1'h1)]))));
            end
          else
            begin
              reg37 <= $unsigned(reg9[(5'h13):(4'ha)]);
              reg38 <= ($signed(reg27) ?
                  $unsigned($unsigned(((+reg8) && (reg24 + wire0)))) : reg22);
              reg39 <= $unsigned(wire4);
              reg40 <= reg6[(4'hb):(3'h7)];
              reg41 <= $signed($unsigned($signed(reg22[(3'h6):(3'h6)])));
            end
          if ($signed(reg29))
            begin
              reg42 <= ((8'hb3) ?
                  $unsigned($unsigned(wire14[(2'h3):(2'h3)])) : wire17[(1'h0):(1'h0)]);
              reg43 <= $unsigned(((~^($unsigned(reg42) || $signed(wire0))) * (reg36 ?
                  reg30 : ((reg7 ? wire2 : reg25) * reg37[(2'h3):(1'h0)]))));
              reg44 <= ((+(reg43[(3'h7):(3'h4)] - $unsigned(reg6))) >= reg26);
              reg45 <= (~^$signed(reg13[(1'h0):(1'h0)]));
            end
          else
            begin
              reg42 <= {reg31};
              reg43 <= $unsigned($signed($unsigned(reg37)));
              reg44 <= $signed({reg43});
              reg45 <= wire1;
            end
          if (($unsigned(reg32[(2'h3):(2'h3)]) | wire17[(2'h3):(2'h3)]))
            begin
              reg46 <= ({{$signed(reg40), reg18[(4'h9):(3'h4)]},
                  (wire4[(3'h5):(1'h1)] ?
                      reg8 : $unsigned((reg26 >= (8'ha2))))} != (^$signed(reg30[(1'h1):(1'h0)])));
            end
          else
            begin
              reg46 <= $unsigned(reg25[(1'h1):(1'h0)]);
              reg47 <= $signed(reg11[(4'hd):(4'hc)]);
              reg48 <= (+(|$unsigned($unsigned(reg28[(4'ha):(4'h9)]))));
              reg49 <= $unsigned($signed($signed((-$unsigned(reg8)))));
            end
        end
      else
        begin
          reg35 <= $signed($unsigned({reg13[(1'h0):(1'h0)],
              ({(8'hb9)} | {(8'had), wire3})}));
          reg36 <= reg30;
          if (reg20[(2'h3):(1'h1)])
            begin
              reg37 <= reg38;
              reg38 <= (~&reg10);
            end
          else
            begin
              reg37 <= $unsigned((|$unsigned(reg21)));
              reg38 <= reg44;
              reg39 <= (reg44 ?
                  reg38[(1'h0):(1'h0)] : ($signed($signed($unsigned(reg8))) ?
                      $unsigned($unsigned($signed(wire15))) : reg30));
              reg40 <= wire1[(4'hb):(4'ha)];
              reg41 <= $signed(wire17[(4'hc):(3'h5)]);
            end
          reg42 <= {$unsigned((~|reg25[(2'h3):(2'h3)]))};
          if ($unsigned($unsigned((((reg29 - (8'ha1)) ?
              $unsigned(reg46) : (reg33 >> reg8)) ~^ $unsigned((~(8'hb4)))))))
            begin
              reg43 <= reg42[(3'h6):(3'h4)];
              reg44 <= $unsigned($unsigned(((~|{reg48,
                  wire16}) * reg48[(4'hb):(2'h3)])));
            end
          else
            begin
              reg43 <= (reg45 ? reg45[(3'h5):(3'h5)] : reg45[(3'h4):(2'h3)]);
              reg44 <= reg29[(4'h8):(1'h0)];
              reg45 <= (~&(reg39 ?
                  ($unsigned((reg6 ?
                      (7'h42) : (8'hb6))) >>> (reg43[(3'h4):(2'h3)] ?
                      (reg41 <= (8'hbf)) : $unsigned(reg41))) : $unsigned(({(8'hac)} ?
                      (~|reg9) : wire2))));
              reg46 <= reg11[(2'h2):(2'h2)];
              reg47 <= $signed((^~($signed($unsigned((8'ha8))) ?
                  ($signed(reg5) - (reg27 * reg40)) : ($signed(reg12) ^ wire14))));
            end
        end
      reg50 <= $unsigned({(~$signed($signed(reg9)))});
      reg51 <= ((reg6 <= (~&(reg27[(4'h8):(2'h2)] ^ $signed(reg46)))) ?
          reg20 : ((+{$unsigned(wire2), (reg42 || (7'h40))}) ?
              reg10 : $signed({(+reg8), {reg36, reg46}})));
    end
  assign wire52 = $signed(reg26[(1'h0):(1'h0)]);
  assign wire53 = (8'ha4);
endmodule
