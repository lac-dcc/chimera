module top
#(parameter param26 = (((((^~(8'haf)) << (8'ha4)) ? ((~^(8'hbb)) ? {(8'h9e)} : ((8'hb6) ? (8'ha8) : (8'ha8))) : ((~|(7'h43)) - {(7'h41)})) | ((+((8'ha9) ? (8'hbf) : (8'hb2))) ? ((8'hbf) >> (+(8'hbe))) : (^~{(8'hb9)}))) != (({(&(8'ha6)), ((8'ha0) && (8'hb8))} ? {((8'ha8) ? (8'ha7) : (8'haf))} : (((8'had) ? (8'hb0) : (8'hbe)) ? ((8'hb5) ? (7'h44) : (8'had)) : (|(8'h9d)))) <<< (~&{((8'hb7) ? (7'h40) : (8'hba)), ((8'hac) ~^ (8'hba))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire4,
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
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed($signed((wire0[(3'h5):(2'h2)] * (wire3[(5'h14):(4'he)] ?
                     $unsigned(wire0) : (wire2 - wire1)))));
  always
    @(posedge clk) begin
      if ($unsigned({$unsigned(($signed(wire3) ? wire0 : $signed(wire2))),
          $unsigned((+$unsigned(wire1)))}))
        begin
          reg5 <= $signed($signed(($unsigned((wire4 - (8'h9f))) << ((|wire4) ?
              (wire0 ? wire0 : wire2) : (wire1 ? wire3 : wire4)))));
          reg6 <= $signed(((-((reg5 >> wire2) ?
                  (&(8'hbc)) : (wire0 ? reg5 : wire0))) ?
              ({wire4[(1'h1):(1'h1)]} ?
                  $signed($unsigned(wire4)) : $signed({wire0,
                      wire4})) : (^~(8'hb0))));
          reg7 <= ((wire4[(2'h3):(2'h2)] ?
              ($signed((reg6 > wire0)) ?
                  (!wire4) : reg6[(4'h8):(3'h4)]) : (7'h40)) * ($unsigned((wire0[(3'h7):(3'h6)] * ((8'hb9) ~^ wire1))) ^ wire3));
          reg8 <= ($unsigned(reg6) ^ (((^(&reg5)) || $signed(wire3)) ^ (~^wire2)));
        end
      else
        begin
          if (({((&wire0) ?
                      ((wire3 * reg6) ?
                          (wire4 > reg8) : (+reg7)) : $unsigned({wire2}))} ?
              ($unsigned($unsigned((&wire2))) ^~ {(~|{wire1, wire3}),
                  wire1[(4'hc):(4'h9)]}) : $unsigned(reg6[(1'h0):(1'h0)])))
            begin
              reg5 <= $signed((~&(wire1 ?
                  (^~wire1) : ((wire3 ~^ reg8) >> $signed((8'hb7))))));
              reg6 <= wire1;
              reg7 <= $unsigned((8'hbb));
              reg8 <= reg8[(1'h0):(1'h0)];
              reg9 <= reg8[(3'h6):(1'h0)];
            end
          else
            begin
              reg5 <= $unsigned((((~|{wire0}) <= $unsigned({wire4})) ?
                  $unsigned(reg6) : $unsigned({(wire0 ? reg5 : reg9)})));
              reg6 <= ($signed((-$unsigned($signed(wire2)))) ?
                  reg6[(4'hb):(3'h5)] : {reg6});
              reg7 <= ($signed((({reg6} ? (reg7 | (7'h40)) : {wire0, wire2}) ?
                  reg5[(4'ha):(4'ha)] : $signed((|reg8)))) * reg5);
            end
        end
      reg10 <= (reg9 ?
          (~|(wire4 ?
              reg8 : (wire0 ? (~|reg6) : (reg6 ? wire2 : reg7)))) : (^reg6));
    end
  always
    @(posedge clk) begin
      if (($unsigned((reg10[(2'h2):(2'h2)] ?
          (^~(wire1 - reg8)) : $signed(((8'hb0) ^~ (8'ha9))))) >> (reg9 ?
          wire4[(2'h2):(1'h0)] : wire2)))
        begin
          reg11 <= reg10[(4'hf):(3'h4)];
          if (wire4)
            begin
              reg12 <= $unsigned({{((reg5 * wire1) ?
                          wire4[(2'h2):(1'h1)] : ((8'hb6) ? reg6 : reg5)),
                      reg6}});
              reg13 <= ((~(8'hb9)) & (8'hb9));
              reg14 <= $signed(($signed(wire4) ?
                  $signed({reg13}) : ((~|$signed(reg10)) == $unsigned((8'hb8)))));
              reg15 <= $unsigned($signed($signed(wire2[(3'h7):(3'h6)])));
            end
          else
            begin
              reg12 <= reg15;
              reg13 <= $signed($signed((+(|reg9[(3'h7):(1'h0)]))));
            end
        end
      else
        begin
          reg11 <= $signed($signed((((reg14 ?
              (8'ha5) : reg6) > (^~reg5)) && (reg7 - (+reg9)))));
          reg12 <= $signed($signed(reg8[(5'h12):(5'h10)]));
          reg13 <= reg8;
          reg14 <= reg15;
        end
      reg16 <= $signed((((~|(reg11 <= reg11)) * $signed(reg13)) >> ((~^reg12[(4'hc):(3'h7)]) ?
          (wire0[(4'hf):(4'ha)] ?
              reg13[(1'h1):(1'h0)] : reg13) : reg13[(2'h2):(2'h2)])));
      reg17 <= wire3;
      if (reg17[(4'h8):(3'h7)])
        begin
          reg18 <= $unsigned($unsigned(reg12));
          if (reg13)
            begin
              reg19 <= reg12;
              reg20 <= (8'hbd);
              reg21 <= $unsigned($unsigned((|{$signed(reg11),
                  (wire4 >> reg11)})));
              reg22 <= reg7[(1'h0):(1'h0)];
              reg23 <= $unsigned(reg10[(5'h13):(4'hf)]);
            end
          else
            begin
              reg19 <= wire1;
              reg20 <= (((({reg15} ?
                          $signed(reg7) : $signed((8'hb3))) | reg5[(2'h2):(1'h1)]) ?
                      (~|((&reg19) ?
                          $unsigned(reg6) : (reg5 && wire2))) : ({(8'haa),
                          (reg21 ? (8'haf) : reg7)} >= (~|{reg21, reg7}))) ?
                  (~{(~reg22[(1'h1):(1'h0)]),
                      ((wire0 << reg17) * $signed(reg7))}) : ($signed(reg13[(3'h4):(2'h3)]) ?
                      $signed($unsigned((~^reg20))) : ($signed({reg20}) ?
                          reg18 : ($unsigned(wire3) ?
                              (^~reg14) : reg22[(1'h0):(1'h0)]))));
            end
        end
      else
        begin
          reg18 <= reg19;
          reg19 <= $unsigned(($unsigned(((reg15 != reg9) ^ {reg8})) ?
              ($unsigned((wire2 && reg7)) != (~&$signed(reg14))) : $unsigned((((8'hab) ^~ (8'ha3)) ?
                  (wire3 + (8'hbd)) : reg17[(3'h7):(3'h5)]))));
          reg20 <= ($signed((|($signed(reg9) ^ (reg9 ?
              reg5 : reg20)))) >= reg8);
          reg21 <= $unsigned($signed(((~&$signed(reg17)) ?
              {$signed((8'hba))} : ($signed((8'ha8)) ?
                  ((8'haa) ^~ reg7) : reg20[(2'h2):(1'h0)]))));
        end
    end
  assign wire24 = $signed((^($signed((reg9 < reg15)) << {reg7,
                      (wire2 ? reg6 : reg21)})));
  assign wire25 = $unsigned((8'hae));
endmodule
