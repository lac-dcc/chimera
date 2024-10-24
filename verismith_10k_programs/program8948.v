module top
#(parameter param38 = (~|(((8'hae) && ((~(7'h43)) && (~&(8'hab)))) ? ((~((8'hb7) ? (7'h44) : (8'h9f))) ? (^~((8'hbc) ? (8'ha9) : (8'h9e))) : (((8'ha9) ? (8'ha8) : (8'hbc)) ? ((8'hbf) ? (7'h41) : (8'h9c)) : {(8'hb1), (8'hbf)})) : ((((8'hac) ~^ (8'ha0)) > ((8'hb3) ? (8'h9e) : (8'hae))) << {(~(7'h41))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire37,
                 wire22,
                 wire21,
                 wire20,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire5,
                 wire4,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (^wire2[(1'h0):(1'h0)]);
  assign wire5 = $signed(wire4[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      reg6 <= (wire0[(3'h4):(1'h0)] << wire2);
      reg7 <= ((wire2 == (wire2 ?
          ($signed(wire1) & {wire4,
              wire1}) : $signed(wire4))) >> ((^(reg6[(4'h8):(1'h1)] ~^ wire3)) ?
          $signed(reg6[(4'ha):(3'h4)]) : wire1));
      if (({$unsigned((~{wire3}))} ~^ $unsigned($signed(wire5))))
        begin
          if (reg7[(3'h5):(1'h1)])
            begin
              reg8 <= ((^~wire2) | (-($unsigned($signed(reg6)) && (wire4 + wire3))));
            end
          else
            begin
              reg8 <= (wire3 ?
                  ($unsigned(wire2[(3'h7):(3'h4)]) - wire1[(3'h6):(3'h6)]) : wire5[(2'h3):(1'h1)]);
              reg9 <= ($signed(wire0[(3'h4):(2'h2)]) == (~|({wire1[(4'h9):(3'h4)]} ?
                  (wire1 ?
                      wire4 : (wire1 > reg8)) : ($unsigned((8'h9c)) - wire5[(4'hf):(4'h8)]))));
              reg10 <= $unsigned({($unsigned((wire0 ? wire5 : wire2)) ?
                      reg9[(4'ha):(3'h5)] : (((7'h43) ?
                          reg6 : reg6) - $signed(wire5))),
                  $signed(({wire5, wire4} ?
                      (-reg8) : (wire3 ? reg7 : wire1)))});
            end
        end
      else
        begin
          reg8 <= (reg10 ?
              ((^reg7) ?
                  (~^((^~wire0) ?
                      (|(8'ha0)) : $signed(wire4))) : ({$signed((8'hbe))} || reg6)) : reg10[(4'hb):(3'h6)]);
          reg9 <= $signed(wire1);
        end
    end
  assign wire11 = ((-reg6[(4'ha):(1'h1)]) && $signed((8'hbc)));
  assign wire12 = reg6[(2'h3):(1'h0)];
  assign wire13 = ($signed(reg8) ?
                      (~((wire0[(3'h5):(2'h2)] ?
                          {reg8} : $signed(wire1)) >= wire2[(3'h5):(1'h1)])) : wire12[(4'h9):(2'h3)]);
  assign wire14 = $unsigned($signed((8'hb6)));
  always
    @(posedge clk) begin
      reg15 <= $unsigned(reg6[(3'h5):(2'h3)]);
      reg16 <= (reg6[(3'h4):(1'h0)] ?
          $unsigned((wire12[(1'h1):(1'h0)] ?
              $signed((reg15 | reg15)) : (~|(^wire1)))) : {$unsigned({(-(8'hb2))})});
      reg17 <= (($unsigned(wire3) ?
              wire12 : $signed(($unsigned(reg8) - $signed(wire3)))) ?
          $unsigned(wire5) : (|(&(+(wire0 ^~ (8'hb5))))));
      reg18 <= $unsigned(($unsigned(((^~reg9) ?
          $unsigned(reg10) : ((7'h41) || (8'hb4)))) & {$signed(reg7[(1'h0):(1'h0)]),
          (wire5[(5'h12):(4'h8)] == $signed(wire0))}));
      reg19 <= wire0[(4'h8):(4'h8)];
    end
  assign wire20 = (&$signed((~|((~|reg8) ? (+wire1) : $unsigned(reg10)))));
  assign wire21 = (~&wire4[(5'h10):(4'h9)]);
  assign wire22 = wire3[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      reg23 <= (({$signed(reg7)} << {(&(reg8 ? wire1 : wire14)),
          $unsigned((wire11 != (8'hb8)))}) | (wire4[(5'h10):(3'h7)] ~^ (($signed(wire13) ?
              $signed((8'had)) : (wire13 ? wire4 : reg15)) ?
          $signed({wire5}) : $signed((wire21 + wire13)))));
      if (($unsigned(($unsigned(reg23) ?
          $unsigned((wire5 ?
              (7'h40) : wire5)) : wire3)) && wire22[(3'h6):(3'h4)]))
        begin
          reg24 <= $signed({$unsigned($unsigned(reg18))});
        end
      else
        begin
          reg24 <= (~|wire5[(5'h11):(4'hf)]);
          if (reg9)
            begin
              reg25 <= reg18;
              reg26 <= (8'hbf);
              reg27 <= (($signed(($unsigned((8'ha9)) ?
                      (reg26 < reg19) : (~|reg24))) ?
                  ($signed($unsigned(reg15)) ?
                      wire1 : reg9[(3'h4):(2'h2)]) : $unsigned(((wire2 >>> reg10) ?
                      (reg16 ?
                          reg8 : wire5) : wire14[(1'h0):(1'h0)]))) <<< wire3);
            end
          else
            begin
              reg25 <= {$signed(wire20)};
              reg26 <= reg24[(2'h3):(2'h2)];
            end
        end
      reg28 <= reg10;
      if ($signed(reg23[(1'h1):(1'h0)]))
        begin
          reg29 <= ($unsigned($unsigned({reg15, wire1[(3'h6):(3'h5)]})) ?
              $signed((8'hb0)) : $signed($signed(($signed(wire20) ?
                  (reg6 ? wire0 : wire11) : {reg8, wire4}))));
          reg30 <= reg18[(3'h6):(1'h0)];
        end
      else
        begin
          reg29 <= ({reg19[(1'h1):(1'h1)], wire21} ?
              reg30[(1'h1):(1'h0)] : ((((|wire22) * {wire1,
                      reg30}) == reg24[(1'h0):(1'h0)]) ?
                  wire20 : $signed(reg27[(3'h4):(1'h0)])));
          reg30 <= $unsigned((~{wire20[(3'h7):(2'h3)], reg26}));
        end
    end
  always
    @(posedge clk) begin
      reg31 <= (&wire5);
      if (reg17)
        begin
          reg32 <= {($signed($unsigned((wire0 ? reg10 : wire5))) ?
                  $signed(reg27[(3'h4):(1'h0)]) : reg25[(2'h3):(2'h3)]),
              $signed(wire21[(4'ha):(4'h8)])};
          reg33 <= wire5;
          reg34 <= $unsigned({$signed(wire21[(2'h3):(1'h0)]),
              (($signed(wire0) << (8'hae)) ?
                  {{reg29, (8'hbe)}} : $unsigned(reg28[(4'hd):(3'h6)]))});
          reg35 <= reg23;
        end
      else
        begin
          reg32 <= reg25;
        end
      reg36 <= $unsigned(wire14);
    end
  assign wire37 = reg17;
endmodule
