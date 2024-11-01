module top
#(parameter param29 = {{{(|(8'ha3)), (|{(8'hbc), (8'hac)})}}}, 
parameter param30 = param29)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = $signed($unsigned((($unsigned(wire3) ?
                     $signed(wire1) : {wire3, wire1}) < $unsigned((8'ha8)))));
  assign wire5 = (wire4 ?
                     (^~(!wire0[(4'hc):(4'hb)])) : (((8'h9f) ?
                         wire1[(1'h0):(1'h0)] : wire4) <<< {((~|(8'h9e)) ?
                             (~&wire1) : (wire1 & wire2))}));
  always
    @(posedge clk) begin
      if ({$unsigned(wire2[(5'h10):(2'h2)])})
        begin
          reg6 <= ($signed(((wire4 ?
                      ((8'hbf) ~^ wire3) : wire0[(3'h7):(2'h2)]) ?
                  (wire4[(1'h1):(1'h0)] == wire0[(4'ha):(4'h8)]) : wire0)) ?
              ((((wire2 ?
                  wire1 : (8'h9c)) ^ wire0[(2'h2):(2'h2)]) <= $unsigned((wire1 ?
                  (8'hb6) : wire1))) == wire2[(3'h7):(2'h3)]) : wire2);
          reg7 <= (wire1[(2'h2):(2'h2)] * (^~(~(wire0[(2'h3):(2'h2)] ?
              $unsigned(reg6) : (wire1 & reg6)))));
        end
      else
        begin
          if (($unsigned($unsigned($unsigned((~&(8'hb2))))) >>> ((~|$signed((wire4 ?
              wire1 : wire5))) || (~&$unsigned((~|wire5))))))
            begin
              reg6 <= (!reg6);
              reg7 <= {$signed(wire1[(2'h3):(2'h2)]),
                  ({((8'ha9) && $signed(reg6))} ?
                      ($signed((^~(8'hba))) ?
                          $signed(wire2) : ((reg6 < wire3) ?
                              $signed(wire0) : (wire3 ?
                                  wire5 : wire4))) : $signed({(wire1 || (8'ha4)),
                          {wire3, wire2}}))};
              reg8 <= wire0[(3'h7):(3'h4)];
              reg9 <= $signed(reg7);
            end
          else
            begin
              reg6 <= ($unsigned(wire2[(1'h0):(1'h0)]) ?
                  $signed(wire3[(4'hc):(3'h6)]) : $signed($unsigned(reg8[(2'h2):(1'h1)])));
              reg7 <= wire5[(2'h2):(1'h0)];
              reg8 <= $signed((reg7[(3'h6):(3'h6)] ?
                  $signed($unsigned((wire0 || wire1))) : reg9));
              reg9 <= $unsigned(((wire0 - (8'h9c)) ?
                  wire0[(4'hd):(4'h8)] : $signed((~$signed((8'ha5))))));
              reg10 <= $unsigned(reg9);
            end
          if ((+((+(reg9 ? (+wire1) : reg8[(3'h6):(3'h6)])) ?
              (~|(^~{reg6, wire4})) : $signed((-(~|reg8))))))
            begin
              reg11 <= ($unsigned({($signed(wire5) ^ $unsigned(reg10))}) || ((wire2 == reg8[(2'h3):(2'h3)]) <= (($signed((8'h9e)) >>> $unsigned(wire5)) ?
                  reg7 : reg7[(3'h4):(3'h4)])));
              reg12 <= (((!wire1[(2'h2):(1'h1)]) & ((-{wire0, (8'h9e)}) ?
                      wire0[(4'he):(4'h8)] : (+wire0))) ?
                  ($signed($signed((!wire4))) ?
                      (&((wire3 & (8'had)) | reg9)) : wire2[(4'hf):(3'h4)]) : reg8[(4'h8):(2'h3)]);
              reg13 <= reg6;
            end
          else
            begin
              reg11 <= $unsigned(wire2);
              reg12 <= {($unsigned(($unsigned((7'h40)) ?
                      (wire5 * wire1) : (reg7 <= reg12))) << (&wire1)),
                  reg10};
              reg13 <= wire4[(3'h5):(2'h2)];
              reg14 <= {wire2[(5'h11):(4'hf)],
                  (reg13[(1'h1):(1'h0)] ?
                      ($signed((~(8'had))) ?
                          ((wire4 <= wire5) ?
                              (~|reg8) : $signed(wire3)) : reg6[(1'h1):(1'h1)]) : wire0)};
              reg15 <= ((&reg13) >> (^~$unsigned((8'ha0))));
            end
          reg16 <= ($signed((^~$unsigned({wire1}))) ?
              $signed($signed(({reg11, (8'ha0)} || {reg10,
                  reg6}))) : (~&(wire2[(4'ha):(4'ha)] + (~^reg13[(1'h1):(1'h1)]))));
          reg17 <= $unsigned(((reg16 ?
                  {(reg12 ? reg11 : (8'ha5))} : $unsigned((|reg8))) ?
              reg10[(5'h10):(4'hb)] : (|(^reg7))));
        end
      if ($unsigned(($unsigned($signed((reg8 ? wire1 : reg13))) ?
          ({(8'h9f), (+(8'h9d))} ?
              (-wire4[(1'h0):(1'h0)]) : {$signed((8'hb1)),
                  (reg16 ? reg10 : reg11)}) : $unsigned($unsigned(((8'ha4) ?
              reg10 : reg7))))))
        begin
          reg18 <= (-$unsigned(wire5[(5'h11):(5'h11)]));
          reg19 <= (-$unsigned(($unsigned($signed(reg13)) & $signed($signed((8'ha6))))));
          reg20 <= (~|$signed(reg11[(4'hc):(4'h9)]));
          reg21 <= reg20;
        end
      else
        begin
          reg18 <= ($signed($unsigned(reg17[(3'h4):(1'h0)])) ? reg19 : reg8);
          reg19 <= $unsigned((&(|(^~{reg15}))));
        end
      reg22 <= (8'ha4);
    end
  assign wire23 = wire5;
  assign wire24 = $unsigned($unsigned(reg9[(4'hc):(4'ha)]));
  assign wire25 = {$unsigned(wire0)};
  assign wire26 = (($signed($signed($unsigned(wire2))) * $signed($unsigned(reg10[(4'h8):(1'h1)]))) ?
                      (&$signed((+(wire4 ?
                          reg11 : (8'ha9))))) : ((($signed(reg13) * (reg14 & reg15)) >= $unsigned($signed(wire23))) < $unsigned((~^reg8[(3'h6):(1'h1)]))));
  assign wire27 = ($unsigned(wire3) ?
                      $unsigned((($signed(reg16) - $signed(wire2)) * ($signed(reg21) == (reg8 ?
                          reg15 : wire4)))) : (reg6[(3'h6):(2'h2)] << ($unsigned((reg12 <<< (7'h41))) - wire1)));
  assign wire28 = ((+reg6[(2'h2):(2'h2)]) + ($signed(($signed(wire23) ?
                          (~|reg13) : $unsigned(reg15))) ?
                      ($signed((~&wire25)) - $signed(reg7)) : $signed(({(8'hb6),
                          wire1} & reg17))));
endmodule
