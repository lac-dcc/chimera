module top
#(parameter param25 = ((8'h9d) ? (~(~|({(8'ha6)} && {(8'hb2)}))) : (((|(8'ha0)) ^~ (8'ha8)) ? ((~|(~(8'hbc))) || (((7'h43) ? (8'hba) : (8'hb6)) ? ((8'hbc) ? (7'h42) : (8'ha7)) : ((8'hbd) ? (8'h9e) : (8'hb4)))) : ({((8'hbd) ? (8'hab) : (8'hb5))} >= (((8'ha1) ? (8'hac) : (8'hb9)) <<< ((8'hbd) ? (7'h44) : (8'h9d)))))), 
parameter param26 = (^~(~^param25)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg8,
                 (1'h0)};
  assign wire4 = (&{wire2[(3'h4):(2'h2)]});
  assign wire5 = wire0[(3'h6):(1'h0)];
  assign wire6 = {{$unsigned(($signed(wire1) ^ wire0)),
                         (($signed(wire1) + {wire5}) ?
                             $signed({(7'h42)}) : wire5)}};
  assign wire7 = (~&$signed(wire0));
  always
    @(posedge clk) begin
      reg8 <= {$signed($unsigned(wire5[(5'h10):(3'h4)])),
          (&(|$unsigned((wire4 ? (8'ha4) : wire1))))};
      reg9 <= (+$unsigned(($unsigned({wire3, wire0}) ?
          $signed($unsigned(wire2)) : {(-reg8)})));
    end
  always
    @(posedge clk) begin
      reg10 <= $unsigned(($signed((~^((8'ha8) ? reg9 : wire0))) ?
          (wire6[(3'h5):(1'h1)] ?
              {$signed(wire1)} : ((~wire2) ^~ $signed(reg9))) : (~|(8'hbf))));
      if ($unsigned(wire1))
        begin
          reg11 <= reg9[(3'h7):(2'h2)];
          if ((~|(!$unsigned((|(wire0 ? reg9 : wire0))))))
            begin
              reg12 <= (~$signed(wire7));
              reg13 <= ($unsigned(reg11) ?
                  reg12[(4'hf):(4'hf)] : (((8'ha9) ?
                          {{reg10}, $unsigned(wire3)} : ((wire2 > wire1) ?
                              wire6 : $unsigned(reg10))) ?
                      ({{wire0},
                          {wire4}} != {{reg10}}) : wire3[(2'h2):(1'h0)]));
              reg14 <= (reg10[(1'h1):(1'h0)] ?
                  wire6 : ($unsigned((((8'ha0) ? (7'h42) : wire2) ?
                      (wire3 ?
                          wire2 : wire4) : $signed(reg10))) << $signed((wire5[(1'h1):(1'h0)] - (wire4 & wire3)))));
              reg15 <= (wire5[(3'h5):(2'h2)] ? reg8 : wire4[(3'h5):(1'h1)]);
              reg16 <= $unsigned(wire1[(4'ha):(2'h3)]);
            end
          else
            begin
              reg12 <= ($unsigned(wire1[(4'h9):(1'h1)]) ?
                  {reg15} : wire3[(1'h1):(1'h1)]);
              reg13 <= (($unsigned($unsigned(reg14)) <<< $signed(reg13[(2'h2):(2'h2)])) ?
                  ($signed($signed(((8'hb8) || reg15))) ^ ((~|(wire7 && wire1)) && reg16[(2'h2):(2'h2)])) : wire4[(2'h2):(2'h2)]);
              reg14 <= ((wire1 && ((reg10[(2'h2):(1'h1)] ^ $signed(reg16)) ~^ (~&$unsigned(reg12)))) >= reg9[(3'h4):(2'h3)]);
            end
          reg17 <= (({$signed(wire1[(4'h9):(2'h3)])} <= wire6) << {$signed(((wire1 <= reg14) ?
                  $signed(reg15) : ((8'hb1) * (8'hae)))),
              (~^reg15)});
          if ((((&{{(8'hb5)}}) ?
                  (reg17[(1'h0):(1'h0)] ?
                      (wire7[(2'h3):(1'h0)] ?
                          (reg9 | wire0) : wire0[(3'h4):(3'h4)]) : $signed($signed((8'hb1)))) : {{reg9}}) ?
              {$unsigned((8'hae)), wire3[(1'h1):(1'h0)]} : (({(wire2 + wire6)} ?
                  (wire6[(2'h3):(1'h0)] ~^ (wire0 ?
                      wire7 : wire0)) : ((~(8'ha3)) != (wire1 ?
                      wire0 : reg13))) * reg9)))
            begin
              reg18 <= wire1;
              reg19 <= (&(reg11 << (!$signed($signed(reg13)))));
              reg20 <= {$unsigned({$unsigned((reg11 ? reg16 : wire6)),
                      ({(8'hbe)} && wire6[(3'h7):(1'h0)])}),
                  $unsigned((reg9[(4'h8):(3'h5)] ?
                      {(7'h44)} : $unsigned(wire4)))};
              reg21 <= ($signed((^(reg10[(1'h1):(1'h1)] ?
                      ((8'haf) ? reg11 : (8'hb8)) : (|wire7)))) ?
                  $signed(({$unsigned(reg8), reg20[(4'he):(2'h3)]} ?
                      $unsigned($unsigned(reg10)) : $signed($unsigned(wire7)))) : $signed((wire3 ?
                      reg16 : reg20)));
              reg22 <= $unsigned($unsigned($signed(({reg12, (8'hba)} ?
                  $signed(reg17) : ((8'hbb) & reg17)))));
            end
          else
            begin
              reg18 <= (+$signed(wire7));
              reg19 <= $unsigned($signed(reg14));
              reg20 <= reg8[(3'h5):(3'h4)];
            end
        end
      else
        begin
          reg11 <= ((^~$unsigned((wire7 ?
                  (reg9 ? reg11 : wire5) : (reg13 <= reg16)))) ?
              $signed(wire5[(2'h2):(1'h1)]) : (!reg17[(2'h3):(1'h1)]));
          reg12 <= reg12;
          reg13 <= (8'ha2);
          reg14 <= $unsigned($unsigned(reg12[(3'h6):(2'h2)]));
          if ({((reg19 ?
                  wire3 : $signed((reg19 ?
                      reg17 : reg22))) ~^ {(^(wire5 | wire1))})})
            begin
              reg15 <= wire7[(3'h5):(3'h5)];
              reg16 <= reg11[(2'h3):(2'h2)];
              reg17 <= reg9;
              reg18 <= $signed((^~(reg20 | (reg10 & (reg15 ? reg20 : wire7)))));
              reg19 <= reg22;
            end
          else
            begin
              reg15 <= ($unsigned($signed(reg18[(2'h2):(2'h2)])) < wire2);
              reg16 <= $unsigned($signed(({(-reg20),
                  $unsigned(wire2)} >> $unsigned((wire1 >>> wire7)))));
              reg17 <= ($unsigned(((reg8[(2'h2):(2'h2)] >= (reg16 ^~ (7'h42))) ?
                      wire6 : (|$signed(reg10)))) ?
                  reg18 : reg20[(1'h1):(1'h0)]);
            end
        end
      reg23 <= wire7;
      reg24 <= ($signed(($signed((wire1 ? wire1 : reg8)) ?
          reg23 : $unsigned(reg17[(4'h8):(3'h4)]))) <<< wire0);
    end
endmodule
