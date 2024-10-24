module top
#(parameter param32 = (&(~&({((7'h41) != (8'ha4)), (!(7'h42))} - (((8'haa) > (8'ha8)) ? ((8'hb9) ? (7'h44) : (8'hb7)) : {(8'hb8)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  assign y = {wire31,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = {(8'ha7)};
  assign wire6 = $unsigned($unsigned((&{(wire1 ? (8'h9c) : wire0),
                     $signed(wire0)})));
  assign wire7 = (^~wire0);
  assign wire8 = wire4;
  always
    @(posedge clk) begin
      if ($signed(wire0))
        begin
          reg9 <= $unsigned(wire2[(1'h0):(1'h0)]);
          reg10 <= wire3[(2'h2):(1'h0)];
          if ((wire6[(3'h4):(2'h3)] ? (^~(+(8'hbd))) : (&(8'ha7))))
            begin
              reg11 <= {$unsigned({wire8[(3'h4):(2'h3)],
                      ((~^wire5) ? {wire0} : (wire8 * wire0))})};
            end
          else
            begin
              reg11 <= $signed((($signed((reg9 ? wire1 : wire4)) ?
                  $signed(wire5[(5'h12):(4'h9)]) : wire1) & wire0));
              reg12 <= wire1[(2'h3):(1'h0)];
              reg13 <= (8'hb0);
              reg14 <= $unsigned(wire2[(4'ha):(1'h1)]);
              reg15 <= $unsigned(wire4);
            end
        end
      else
        begin
          reg9 <= $unsigned((^~wire5[(4'ha):(2'h3)]));
          reg10 <= $signed($signed(((+{reg11}) ?
              ($signed((8'h9e)) ?
                  {reg15} : reg9[(1'h1):(1'h1)]) : (~$unsigned(wire7)))));
          reg11 <= $unsigned($signed((&{$signed((8'hb4)),
              $unsigned((8'hab))})));
          reg12 <= reg9[(3'h5):(3'h4)];
        end
      if ($signed(($signed($signed((~&(8'ha8)))) ?
          $unsigned(((|wire3) != $unsigned((8'ha9)))) : reg15)))
        begin
          reg16 <= reg12[(4'hc):(1'h0)];
          if ($unsigned(($unsigned($unsigned((^(8'had)))) ?
              reg10[(1'h1):(1'h1)] : (($unsigned(wire7) ?
                  wire4 : {reg11, reg15}) <= reg13))))
            begin
              reg17 <= reg11;
            end
          else
            begin
              reg17 <= (~^(^~reg12));
              reg18 <= (~^((wire3[(2'h2):(1'h1)] >>> wire2[(4'ha):(4'h8)]) ?
                  ($unsigned((wire4 == reg17)) ^~ $unsigned(reg9)) : (wire2 || (8'ha3))));
              reg19 <= (~(wire0 > {reg10}));
              reg20 <= ($unsigned($signed(wire4)) || wire6[(1'h1):(1'h0)]);
              reg21 <= {$unsigned((!$unsigned($unsigned(wire7))))};
            end
          reg22 <= (~&$signed({$unsigned((8'haf))}));
        end
      else
        begin
          reg16 <= ((wire0 ?
              (reg21[(2'h3):(2'h2)] != (~&{(8'hb0)})) : ((reg11[(2'h2):(1'h0)] << {reg22}) == wire4)) - $signed($unsigned((8'ha2))));
          if (reg21[(2'h3):(1'h0)])
            begin
              reg17 <= $unsigned($unsigned((wire5[(5'h14):(1'h0)] ^~ (~^{reg19}))));
              reg18 <= (wire1[(2'h3):(1'h0)] ?
                  $signed((~reg21[(1'h0):(1'h0)])) : ($unsigned(($signed((8'hb4)) ?
                      reg15 : {reg10})) != (!$unsigned(((8'hb3) >> reg14)))));
            end
          else
            begin
              reg17 <= (~|(8'hb5));
              reg18 <= (reg17[(2'h3):(2'h2)] ?
                  (({(reg10 ? reg14 : reg12), (reg19 <<< reg14)} && wire5) ?
                      reg17 : wire1) : reg15);
              reg19 <= $signed({{(reg22 & reg15),
                      ((reg17 ? (8'had) : wire2) ? wire0 : reg14)},
                  (!($signed(reg12) ? (wire3 & wire8) : wire7))});
              reg20 <= wire1[(1'h0):(1'h0)];
              reg21 <= {(+(8'hae)),
                  ($unsigned(($unsigned(reg20) == $signed(reg20))) || ($unsigned(reg21[(3'h6):(1'h1)]) >= $unsigned((8'hbc))))};
            end
        end
      if ({{($unsigned({reg21, reg10}) ?
                  (~^(wire4 ? reg18 : reg22)) : (reg14 ?
                      ((8'ha2) ? (7'h42) : reg17) : (reg15 - wire3)))}})
        begin
          reg23 <= {($unsigned($unsigned(wire5)) & {$unsigned((~^reg11))}),
              {(reg21 & (wire5[(5'h10):(5'h10)] != {reg22})),
                  reg13[(1'h1):(1'h1)]}};
          if (wire8)
            begin
              reg24 <= wire3[(4'h8):(3'h4)];
            end
          else
            begin
              reg24 <= wire2[(1'h1):(1'h0)];
            end
          reg25 <= $signed((wire8 ?
              $signed(($signed(wire0) ?
                  reg23 : reg22[(1'h0):(1'h0)])) : reg20));
          reg26 <= (^$signed($signed(wire7[(2'h3):(2'h2)])));
          if ((reg24[(4'h9):(4'h8)] >= ($signed($signed((~&reg13))) && reg17)))
            begin
              reg27 <= reg9;
            end
          else
            begin
              reg27 <= $signed(((wire4 ? wire3 : reg24) ?
                  $unsigned(($signed(wire8) ?
                      reg19[(1'h0):(1'h0)] : reg26)) : (reg23 ?
                      (-reg19[(3'h5):(1'h1)]) : {(reg23 ? reg9 : (7'h41))})));
              reg28 <= (&(wire2 <<< (($signed(wire4) ?
                  $unsigned((8'hb0)) : {(7'h43)}) << ((-reg12) ^~ $signed(reg18)))));
              reg29 <= $unsigned((~|reg14[(3'h6):(2'h2)]));
            end
        end
      else
        begin
          reg23 <= wire6[(3'h6):(1'h0)];
        end
      reg30 <= $signed(($unsigned({(^wire2)}) <= {(-{(8'hbd)}), reg20}));
    end
  assign wire31 = $signed($signed($unsigned(($unsigned(reg14) ?
                      wire2[(2'h2):(1'h1)] : wire5))));
endmodule
