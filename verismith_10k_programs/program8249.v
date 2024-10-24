module top
#(parameter param36 = (((-(~(^~(8'h9f)))) | (^((&(8'hae)) ? {(8'hbb)} : (^(8'ha7))))) ? ((((^(8'hb8)) ? ((8'hb7) ? (8'hbb) : (8'haf)) : ((8'haf) <<< (8'hb1))) ? (~|((8'ha9) ? (8'h9c) : (8'hb7))) : (8'h9d)) ? (|(-((7'h42) ? (8'had) : (7'h44)))) : (^(((8'hab) ? (8'haf) : (8'hba)) <= (~|(8'hbd))))) : (8'ha1)), 
parameter param37 = (!(8'haf)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire8,
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
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ($unsigned((($signed(wire3) ?
                     $signed(wire0) : wire0[(1'h0):(1'h0)]) - (|(8'hbf)))) || {(-(wire2[(4'hd):(3'h7)] ?
                         {wire2, wire1} : wire1))});
  always
    @(posedge clk) begin
      reg5 <= ((~&(-wire4)) + wire4);
      reg6 <= (wire1 ?
          $unsigned(wire0) : $unsigned($signed(wire4[(4'hb):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg7 <= $signed(wire1);
    end
  assign wire8 = wire1;
  always
    @(posedge clk) begin
      if ($signed(($signed({(reg5 >> reg5),
          (8'hbf)}) || $signed(({wire2} || (reg7 ? (8'ha0) : wire8))))))
        begin
          if (wire8[(4'ha):(4'h9)])
            begin
              reg9 <= (~|reg5);
              reg10 <= (+(8'hb4));
              reg11 <= wire8;
              reg12 <= reg5[(3'h5):(1'h1)];
              reg13 <= $unsigned((+wire0[(1'h0):(1'h0)]));
            end
          else
            begin
              reg9 <= {((({reg6,
                      wire2} & wire3[(3'h6):(2'h3)]) | reg6[(2'h2):(1'h1)]) ^ wire0[(1'h0):(1'h0)])};
              reg10 <= ($unsigned((^$signed((-wire0)))) ?
                  (8'haa) : (^~reg12[(2'h3):(2'h2)]));
              reg11 <= (wire2[(2'h2):(1'h1)] >> reg12);
              reg12 <= (^~(wire4[(2'h2):(2'h2)] < reg12[(2'h3):(1'h0)]));
              reg13 <= $unsigned($signed(wire0));
            end
          if (($signed(wire8[(4'hc):(3'h6)]) ?
              ($unsigned({(!wire0)}) >>> (wire4 == wire3)) : (reg10 ?
                  wire2[(5'h10):(2'h3)] : reg12)))
            begin
              reg14 <= reg10[(2'h2):(2'h2)];
              reg15 <= $signed(wire2);
            end
          else
            begin
              reg14 <= reg14[(2'h3):(2'h2)];
              reg15 <= {(&$unsigned($unsigned(reg11)))};
              reg16 <= (8'ha8);
              reg17 <= (|$signed((&(7'h41))));
              reg18 <= wire4[(3'h5):(1'h0)];
            end
          reg19 <= $unsigned(reg5);
          reg20 <= (8'hbc);
          reg21 <= {(~|$unsigned({$unsigned(wire1)})), (8'haf)};
        end
      else
        begin
          reg9 <= {$unsigned((~&reg15))};
          reg10 <= (^~(^~$signed((reg16[(3'h7):(3'h5)] ?
              $unsigned(reg15) : (reg21 ? reg6 : reg6)))));
          if ((!($unsigned((~(!reg15))) >>> (reg9[(1'h1):(1'h0)] ?
              (!reg13) : wire1[(1'h1):(1'h0)]))))
            begin
              reg11 <= reg14;
            end
          else
            begin
              reg11 <= (^~$unsigned($unsigned(reg14[(3'h4):(2'h2)])));
              reg12 <= $unsigned($unsigned(wire4[(1'h0):(1'h0)]));
            end
          if ((!((((reg19 <= reg18) ?
              (reg15 ?
                  reg20 : (8'hb2)) : (reg20 > reg17)) << (|$unsigned(reg15))) ~^ $signed((-(reg21 <= (8'hb6)))))))
            begin
              reg13 <= (reg12[(1'h0):(1'h0)] & (7'h43));
              reg14 <= (~^reg16[(3'h5):(2'h2)]);
              reg15 <= {{reg19[(4'he):(4'hc)], reg16}, wire3[(3'h5):(2'h2)]};
              reg16 <= (~^wire0[(1'h1):(1'h0)]);
            end
          else
            begin
              reg13 <= {wire8[(4'hd):(3'h5)],
                  $unsigned((|$signed($signed(wire8))))};
              reg14 <= reg6;
              reg15 <= (!reg7);
              reg16 <= $unsigned($signed((~reg15[(1'h1):(1'h1)])));
              reg17 <= (+(reg6 ? (7'h42) : (wire4 >= (-{(8'hba), wire8}))));
            end
          reg18 <= ((^(~^$unsigned($unsigned(wire8)))) >> reg15[(1'h1):(1'h1)]);
        end
      if (reg5[(3'h7):(3'h5)])
        begin
          if (reg19)
            begin
              reg22 <= (~&(($signed(wire3[(2'h2):(1'h0)]) == ((~|(8'ha5)) ?
                  (+wire4) : {reg15, reg11})) != $unsigned($signed(((7'h43) ?
                  reg15 : reg11)))));
              reg23 <= {($signed(reg15[(2'h3):(1'h0)]) + (((~&reg7) ?
                          ((8'hbd) ? reg14 : wire3) : $unsigned(wire3)) ?
                      $unsigned((reg10 ?
                          reg17 : reg11)) : $unsigned((8'hb4))))};
              reg24 <= reg15;
              reg25 <= $signed(wire2[(4'hc):(1'h0)]);
              reg26 <= {reg21};
            end
          else
            begin
              reg22 <= (reg15 ?
                  ($signed((~&(wire2 >= wire3))) && (~^((reg21 ?
                      reg19 : reg13) >> $unsigned(reg6)))) : (+$unsigned(((reg22 ?
                      reg26 : wire2) << wire8[(2'h2):(1'h1)]))));
            end
          if ($unsigned((reg21[(4'he):(2'h2)] <<< ($signed(((8'hb3) + wire1)) ?
              ((wire0 ^ (8'hbc)) ?
                  $unsigned(wire8) : reg18[(3'h5):(1'h0)]) : reg14[(4'he):(4'h9)]))))
            begin
              reg27 <= reg18[(2'h2):(2'h2)];
              reg28 <= (8'haa);
              reg29 <= reg26;
              reg30 <= $unsigned($unsigned({(reg13[(1'h1):(1'h0)] ?
                      (-reg6) : $unsigned(reg13))}));
              reg31 <= (reg27[(1'h0):(1'h0)] ? (7'h44) : reg24);
            end
          else
            begin
              reg27 <= $unsigned((!reg9));
              reg28 <= (!($unsigned(reg29[(4'hf):(4'h9)]) ?
                  {$unsigned((reg12 | reg21)), (8'hbb)} : (8'ha3)));
              reg29 <= (reg29 ? $signed(reg22) : reg21);
              reg30 <= $signed((|(reg5[(2'h2):(1'h0)] >= reg5[(3'h7):(3'h5)])));
            end
          reg32 <= wire3[(3'h6):(1'h1)];
          reg33 <= $unsigned((-((~reg5) <= ($unsigned((8'hba)) ?
              $signed(reg30) : $unsigned(reg17)))));
          reg34 <= reg20[(3'h5):(2'h3)];
        end
      else
        begin
          if ((reg18 * $unsigned((&(reg23[(1'h0):(1'h0)] & (!reg33))))))
            begin
              reg22 <= reg18;
              reg23 <= reg31;
              reg24 <= wire8;
              reg25 <= {reg34};
              reg26 <= reg11[(1'h1):(1'h1)];
            end
          else
            begin
              reg22 <= $signed($signed((^reg19[(4'hb):(2'h2)])));
            end
          reg27 <= (|(~^(~{$signed(reg24), (reg12 ? reg12 : reg7)})));
          reg28 <= $signed(wire8[(4'hb):(3'h7)]);
          reg29 <= (reg25 ?
              (~&reg5) : $signed(((^(reg14 ~^ reg19)) ?
                  {(reg10 >> reg28),
                      $unsigned(reg22)} : $unsigned((reg30 != (8'ha6))))));
          reg30 <= $signed(wire4);
        end
      reg35 <= reg12;
    end
endmodule
