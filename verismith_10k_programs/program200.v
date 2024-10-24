module top
#(parameter param36 = (~&(&((((8'hac) ? (7'h44) : (8'hb4)) != ((8'ha9) ^~ (8'haa))) ~^ (((7'h44) ? (8'ha0) : (7'h42)) - ((8'ha5) >> (8'haa)))))), 
parameter param37 = {((8'haf) ~^ ((^((8'hb6) >> param36)) ~^ ({param36} >> (param36 ? param36 : param36)))), (param36 != param36)})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire28,
                 wire27,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg30,
                 reg29,
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
  assign wire5 = ((((wire4[(4'hb):(3'h7)] >> wire3) ?
                         (wire1 >> wire1) : $signed((wire2 - wire4))) ?
                     wire1[(1'h0):(1'h0)] : wire4) + $unsigned(($unsigned($signed(wire1)) ?
                     $unsigned(wire2) : $unsigned((wire1 + wire4)))));
  assign wire6 = wire4[(2'h3):(2'h2)];
  assign wire7 = wire4[(1'h1):(1'h1)];
  assign wire8 = wire2[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((^~wire8[(1'h0):(1'h0)]))
        begin
          reg9 <= wire6[(4'ha):(2'h2)];
          reg10 <= wire2;
          if ({$unsigned((wire6[(3'h6):(1'h1)] >> (^~((8'ha4) ~^ wire5))))})
            begin
              reg11 <= reg9;
              reg12 <= wire6;
              reg13 <= {(wire6[(3'h5):(3'h5)] >> (8'hbb))};
              reg14 <= wire5[(2'h2):(1'h0)];
              reg15 <= $signed(reg11);
            end
          else
            begin
              reg11 <= (+reg9[(3'h5):(2'h3)]);
              reg12 <= (&reg13);
              reg13 <= $signed($unsigned(wire7));
              reg14 <= ($signed(wire1) <<< $signed(wire5[(2'h2):(2'h2)]));
            end
          reg16 <= (wire1[(1'h1):(1'h1)] ?
              (($unsigned($signed(reg12)) ? (^(|reg10)) : $unsigned(wire1)) ?
                  (&(~|$signed(reg12))) : wire3[(4'hc):(4'h8)]) : (8'hb5));
        end
      else
        begin
          reg9 <= wire4;
          if ((8'hb1))
            begin
              reg10 <= wire5;
              reg11 <= wire1;
              reg12 <= $signed(wire2);
              reg13 <= wire1;
            end
          else
            begin
              reg10 <= ($signed(((-{reg12}) * $signed($unsigned(wire4)))) - (reg11 >>> ((~^{wire4,
                  wire4}) ~^ ($signed((8'h9e)) ?
                  (&wire1) : (reg14 ? wire1 : wire0)))));
              reg11 <= $unsigned(((^~({wire1, (8'h9e)} ?
                  (~reg15) : $signed(wire2))) * (((!reg14) ?
                      $signed(wire6) : $unsigned(wire2)) ?
                  {wire2} : reg15[(5'h14):(4'hd)])));
            end
          reg14 <= ($unsigned((!(wire5 ?
                  $signed(wire5) : (reg15 ? reg14 : reg12)))) ?
              {((wire5[(2'h3):(1'h0)] ?
                          $unsigned(reg11) : (reg12 ? wire5 : reg13)) ?
                      $signed((reg9 <= wire5)) : $unsigned(wire7[(5'h11):(4'hc)]))} : reg10);
          reg15 <= $unsigned($unsigned(($unsigned((wire5 <<< wire0)) ?
              (+$signed(reg16)) : ($unsigned(reg15) >= $unsigned(reg15)))));
          if ((($unsigned(wire5[(1'h1):(1'h1)]) ?
                  {(~$signed(wire5))} : ($unsigned(wire6[(3'h6):(3'h5)]) - $signed((-reg11)))) ?
              (~{((reg12 ?
                      wire7 : (8'hab)) | (~reg10))}) : reg15[(2'h2):(1'h0)]))
            begin
              reg16 <= (~{$unsigned($unsigned($unsigned(reg10)))});
              reg17 <= (((((wire6 <= reg16) ?
                          wire8 : (8'hbe)) >>> {$signed(wire5)}) ?
                      wire8 : $unsigned($signed(((8'h9d) || reg14)))) ?
                  (($signed((wire7 <= reg12)) <<< $signed({wire2,
                      wire2})) >= ({{wire3}, (-wire5)} ?
                      wire4 : $unsigned($signed(wire1)))) : (reg15[(3'h6):(2'h3)] < reg11));
            end
          else
            begin
              reg16 <= (^~$signed(reg15[(4'hb):(4'h9)]));
            end
        end
      if ((|reg11))
        begin
          reg18 <= {wire1[(2'h3):(1'h1)],
              ($signed((!((8'had) * wire3))) ? {(+(8'hb2))} : (8'ha1))};
        end
      else
        begin
          if (wire6[(1'h1):(1'h0)])
            begin
              reg18 <= (8'ha3);
              reg19 <= (~&reg18);
            end
          else
            begin
              reg18 <= (!(~&(((!wire4) ?
                      wire5[(1'h1):(1'h1)] : $signed(wire4)) ?
                  reg14[(4'ha):(2'h2)] : $unsigned((reg16 <= wire4)))));
              reg19 <= $unsigned(($signed(($signed(reg17) && (wire8 & wire0))) || (~^(8'ha4))));
              reg20 <= wire0[(3'h7):(2'h3)];
            end
          if (($signed(reg19) ? $signed(wire4) : (^wire4[(5'h11):(2'h2)])))
            begin
              reg21 <= reg13;
              reg22 <= {(reg12 - ({reg15[(5'h14):(1'h0)]} ?
                      (-reg19[(5'h12):(1'h1)]) : $signed($unsigned((7'h42)))))};
              reg23 <= reg15;
            end
          else
            begin
              reg21 <= {(($signed($signed(reg12)) + (wire6 ?
                      ((8'hbd) || (8'ha6)) : (reg10 > (8'haa)))) & reg10[(3'h4):(3'h4)])};
            end
          if (reg13[(3'h6):(3'h4)])
            begin
              reg24 <= $signed(wire6[(4'ha):(2'h2)]);
            end
          else
            begin
              reg24 <= $unsigned(((reg21 << reg10) << $unsigned(($signed(reg12) - {reg15}))));
              reg25 <= $unsigned((-((8'ha4) ?
                  reg22 : ((~^(8'h9f)) ? reg18 : {reg17}))));
            end
          reg26 <= {{{((~^reg19) ? (wire5 - reg14) : reg22[(1'h0):(1'h0)])}}};
        end
    end
  assign wire27 = reg9;
  assign wire28 = {$signed(reg19[(1'h0):(1'h0)]), reg14[(4'h8):(1'h1)]};
  always
    @(posedge clk) begin
      reg29 <= $signed(reg12);
      reg30 <= (wire3[(3'h6):(2'h3)] ? (wire2 - wire27) : reg24);
    end
  assign wire31 = $signed(((^~(~^(reg17 ? reg18 : reg29))) ?
                      reg13 : ($unsigned((reg21 < wire2)) >> ($unsigned(reg11) >= $signed(wire3)))));
  assign wire32 = {($unsigned((|(wire1 ? reg17 : reg21))) ?
                          ((^~{wire4}) <<< $unsigned((reg19 ^~ wire0))) : $signed(reg9))};
  assign wire33 = wire6;
  assign wire34 = $unsigned((~({(wire5 >> reg22),
                      {(7'h42), wire7}} ^ $unsigned({reg26, wire6}))));
  assign wire35 = (((((^(8'hb5)) <<< wire6[(3'h6):(2'h3)]) >= ($unsigned(wire4) << $unsigned(reg16))) ?
                      (8'hb7) : (-{(wire5 ? reg29 : reg9),
                          (reg24 << wire7)})) < {{(!(8'haa))}});
endmodule
