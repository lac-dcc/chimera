module top
#(parameter param44 = ((((8'hb6) ? (|((8'ha1) == (8'hbb))) : (((8'hbc) + (8'ha8)) == ((8'hb6) ? (8'hb9) : (8'hb0)))) ? ((((8'h9c) ? (8'hac) : (8'ha1)) == ((8'h9d) | (8'ha9))) ? ((^(8'h9c)) ? ((8'ha4) ? (8'hbc) : (8'ha8)) : ((8'ha5) ^ (8'hb7))) : (((8'hbc) == (8'hbe)) ? (&(7'h41)) : (+(8'hbf)))) : (((+(8'ha1)) >= ((8'hbb) >> (8'h9e))) != ((-(8'hb7)) ? (^(8'haf)) : ((8'hbf) ? (8'h9f) : (8'haf))))) ? (((!((8'hb6) ? (8'haf) : (8'hba))) >= ({(7'h40)} ? (~(8'hab)) : ((8'ha9) ? (8'h9e) : (7'h43)))) < ((((8'haa) < (7'h43)) ? (^(8'ha1)) : ((8'hb0) ? (8'hac) : (8'h9d))) ? (((8'h9f) ? (8'ha2) : (8'ha3)) ? (^(8'hb9)) : ((8'hb8) ? (8'hb7) : (8'h9c))) : (!(8'ha9)))) : (((8'ha7) <= {(!(8'ha4))}) >= {(&((8'ha7) ? (8'hb4) : (8'h9f))), ((~&(8'h9d)) && (~^(8'hb6)))})), 
parameter param45 = (~((((param44 ? param44 : param44) & (8'hb9)) ? ((param44 ? param44 : param44) && (~|param44)) : ((param44 >>> param44) ? (^~param44) : param44)) ? (((param44 ? param44 : param44) + {param44}) ? (8'hab) : ({param44} ? (param44 ? param44 : param44) : param44)) : {(^~(~|(8'hb9))), ((param44 || param44) - (8'haa))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire26,
                 wire4,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ((8'ha9) ?
                     wire0[(2'h2):(2'h2)] : $unsigned($signed($signed((!wire1)))));
  always
    @(posedge clk) begin
      reg5 <= wire3;
      if ($signed($unsigned($unsigned(((reg5 ~^ wire2) >>> wire1[(2'h3):(1'h1)])))))
        begin
          reg6 <= (~^$signed(($unsigned(wire4) <= $signed((wire0 < reg5)))));
          if (wire1[(3'h7):(3'h6)])
            begin
              reg7 <= (^~(~^$signed(((wire1 > reg6) != (-wire3)))));
              reg8 <= (8'ha0);
              reg9 <= $unsigned(($unsigned(($unsigned(reg8) + $signed(wire1))) == wire3[(3'h7):(1'h1)]));
            end
          else
            begin
              reg7 <= (reg9 != $signed($unsigned($signed(reg9))));
              reg8 <= {reg9[(1'h1):(1'h0)]};
              reg9 <= $signed(wire1);
              reg10 <= wire0;
            end
          reg11 <= ($unsigned($unsigned(((wire2 <= (8'hb6)) << (reg10 ?
              (8'ha5) : reg8)))) || wire4[(3'h4):(2'h3)]);
        end
      else
        begin
          reg6 <= (+$signed(wire2));
          reg7 <= (reg11[(5'h11):(4'hd)] ?
              reg8 : (&(reg9[(4'ha):(3'h7)] ?
                  ((reg10 ? wire0 : reg6) ?
                      (reg8 > reg11) : (reg5 != wire4)) : ($unsigned(wire4) == (~reg7)))));
        end
      if ((!(reg10[(2'h3):(2'h3)] ? $unsigned((8'hba)) : wire4[(2'h2):(1'h1)])))
        begin
          reg12 <= $unsigned(wire3);
          reg13 <= $signed(((($signed(wire3) * (reg12 | wire2)) + wire2[(3'h4):(3'h4)]) ?
              {(^(-reg10)), ((+wire0) > {(8'h9c)})} : reg5));
          reg14 <= $signed((~&$signed($unsigned((wire2 && reg9)))));
        end
      else
        begin
          reg12 <= ((~^$signed($unsigned((8'ha4)))) ?
              $signed(reg7[(4'hd):(2'h2)]) : ((($unsigned(reg5) ?
                  reg5[(1'h0):(1'h0)] : (~^reg13)) >>> (reg7 ?
                  $signed(reg6) : reg13)) && $unsigned((reg11 >= $unsigned((8'hae))))));
          reg13 <= (reg14 ? ((+$signed({wire2})) + reg5) : wire0);
          if ($unsigned($signed(reg6[(4'h9):(3'h5)])))
            begin
              reg14 <= $unsigned(({$unsigned((wire2 <= wire4))} ?
                  reg6 : wire1));
              reg15 <= ((~wire4[(2'h2):(1'h1)]) || reg12);
              reg16 <= reg11;
              reg17 <= wire1[(4'he):(4'hb)];
            end
          else
            begin
              reg14 <= $unsigned((wire0 ?
                  reg16 : {((wire3 ? reg16 : (7'h40)) ^~ ((7'h44) ?
                          reg8 : wire1))}));
              reg15 <= ($signed($signed($unsigned($unsigned(reg16)))) ?
                  (($unsigned((wire2 || reg13)) >> $signed((wire4 ^~ wire3))) ^~ reg10) : {$signed($signed((reg6 ?
                          reg8 : reg5)))});
            end
        end
      if ((|reg17[(1'h1):(1'h0)]))
        begin
          if (((8'ha6) ? reg17 : $unsigned((~^$unsigned($signed(wire4))))))
            begin
              reg18 <= {reg17};
              reg19 <= reg12;
            end
          else
            begin
              reg18 <= ($unsigned($unsigned(($unsigned(reg17) ?
                      reg16 : (wire2 ^~ reg14)))) ?
                  $unsigned((reg9[(4'h8):(3'h4)] > reg12[(1'h0):(1'h0)])) : ($signed(((reg5 ?
                      reg15 : wire2) || {reg14,
                      reg15})) >> {(~|reg10[(1'h1):(1'h1)])}));
            end
          if ((-$unsigned($signed(wire3))))
            begin
              reg20 <= wire4;
              reg21 <= ((8'hac) ?
                  (!(8'hab)) : $unsigned($signed($signed($unsigned(reg12)))));
              reg22 <= $unsigned({reg15, (!(|$unsigned(wire4)))});
              reg23 <= reg15;
              reg24 <= $unsigned(((|wire4) ? reg5 : $signed(reg10)));
            end
          else
            begin
              reg20 <= {wire0, (8'ha8)};
            end
          reg25 <= ($signed(reg11) ?
              ((reg12 ? ($signed(reg18) <= reg9) : (8'hbd)) ?
                  (^~(~|$signed(reg14))) : $unsigned(reg5[(3'h4):(2'h3)])) : $unsigned((~|(~|reg5[(3'h6):(2'h2)]))));
        end
      else
        begin
          if ($unsigned(($signed(({wire4, reg24} ?
                  $unsigned(reg23) : (reg13 ? wire0 : reg7))) ?
              ((|$unsigned(reg14)) <<< (|$unsigned(reg5))) : $unsigned({reg12[(2'h2):(1'h1)]}))))
            begin
              reg18 <= ((wire1[(4'hf):(3'h6)] >>> (~reg19)) ?
                  {(^((reg6 <<< (8'h9c)) ~^ (8'ha8)))} : reg17[(2'h2):(2'h2)]);
              reg19 <= ($signed($unsigned(wire1)) >= $unsigned(({(reg20 ?
                      reg16 : (8'ha1)),
                  (reg23 <= reg13)} > $unsigned((^reg14)))));
            end
          else
            begin
              reg18 <= reg10[(1'h1):(1'h0)];
              reg19 <= (($signed((+(^~reg12))) ?
                  $unsigned(((&wire3) ?
                      $signed(reg24) : reg23[(3'h4):(2'h3)])) : ((^~{reg5,
                      reg10}) <= reg17)) - (8'hb3));
              reg20 <= reg14;
              reg21 <= {(wire1[(3'h5):(2'h2)] ?
                      $signed($unsigned((reg14 << reg20))) : $unsigned(($signed(reg18) < (reg14 ?
                          reg17 : reg20)))),
                  wire2[(1'h1):(1'h0)]};
            end
          reg22 <= ($unsigned((reg12 ?
                  {(+reg5), (reg21 * reg15)} : $signed($unsigned(reg15)))) ?
              reg6 : {reg5[(4'h8):(3'h5)]});
          reg23 <= ($unsigned((!(~|(reg22 ?
              (7'h40) : reg14)))) + (((+(reg24 >> wire1)) | reg18[(4'ha):(3'h6)]) ?
              ((!wire1) ?
                  reg16[(2'h3):(1'h1)] : (reg16 ?
                      {reg23,
                          reg7} : $signed(reg6))) : ((((8'hb6) & reg24) ^~ wire2[(3'h4):(2'h3)]) ~^ $unsigned((reg13 ?
                  reg13 : reg5)))));
          reg24 <= $signed((((&$signed(reg23)) > $unsigned(reg7[(4'hc):(1'h0)])) ?
              wire0 : $signed((wire1 ? (~&wire4) : ((8'ha6) < reg10)))));
        end
    end
  assign wire26 = ((+reg23[(2'h2):(1'h1)]) * ($signed((&$unsigned(reg8))) ?
                      ($unsigned({reg9, (8'hae)}) ?
                          reg6 : wire2[(3'h6):(2'h2)]) : ((8'hb3) ?
                          ((reg25 ? reg12 : reg15) >>> (~|reg10)) : reg15)));
  always
    @(posedge clk) begin
      if ((reg21[(4'hd):(3'h5)] >> $unsigned(((reg18 == (~^reg13)) ~^ reg25))))
        begin
          reg27 <= $signed($unsigned(($signed($signed((7'h43))) ?
              ((8'hb1) > (reg5 - reg21)) : {(reg18 ? reg6 : wire3)})));
          if (reg10[(3'h5):(1'h1)])
            begin
              reg28 <= ($signed($signed(reg12[(1'h0):(1'h0)])) ^ reg24[(2'h3):(1'h0)]);
              reg29 <= (reg8[(1'h1):(1'h1)] ?
                  $unsigned(reg7[(5'h12):(3'h4)]) : reg19);
              reg30 <= $signed((^(reg24 & reg22)));
              reg31 <= reg23[(2'h2):(1'h0)];
            end
          else
            begin
              reg28 <= $signed((~|reg6));
              reg29 <= {reg8[(1'h1):(1'h1)],
                  (wire3 ? reg11 : (reg8 || (reg7[(3'h7):(2'h3)] ^ wire1)))};
              reg30 <= $signed(wire4[(1'h1):(1'h0)]);
            end
          reg32 <= reg9;
        end
      else
        begin
          reg27 <= wire3[(4'hb):(1'h1)];
        end
      reg33 <= $signed($unsigned((((8'ha9) ?
              (reg17 != reg21) : reg10[(2'h2):(1'h1)]) ?
          wire1[(4'hc):(4'hc)] : reg30[(1'h0):(1'h0)])));
      reg34 <= reg22[(2'h3):(1'h1)];
      reg35 <= (wire0[(3'h6):(3'h4)] ?
          {{{reg19[(3'h4):(2'h3)], (7'h41)},
                  $signed($unsigned(reg29))}} : $unsigned($signed((8'hbf))));
    end
  assign wire36 = (+reg28);
  assign wire37 = (~|($signed({reg21[(4'hb):(3'h4)], reg11[(1'h1):(1'h1)]}) ?
                      reg5[(3'h6):(1'h1)] : $unsigned(reg8)));
  assign wire38 = reg20[(1'h0):(1'h0)];
  assign wire39 = reg23[(3'h5):(2'h2)];
  assign wire40 = {($signed({(+reg23), $unsigned(reg5)}) - reg14), (|wire4)};
  assign wire41 = (|(reg24[(2'h3):(2'h3)] ?
                      ($signed((!reg21)) ?
                          {reg28} : ((reg7 <= wire4) - $unsigned(reg9))) : ({{wire36,
                                  reg6}} ?
                          ((reg32 ?
                              reg30 : reg27) ^~ $signed(wire38)) : $unsigned((reg34 ?
                              reg32 : wire37)))));
  assign wire42 = (~|{reg30[(2'h3):(2'h3)], reg17[(1'h0):(1'h0)]});
  assign wire43 = $signed(reg22);
endmodule
