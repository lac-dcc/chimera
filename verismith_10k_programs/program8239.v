module top
#(parameter param31 = ((~^(~(((8'hbd) << (8'hbb)) <= {(8'hbc)}))) ? (((((8'hb7) ^ (8'ha7)) != (8'hb4)) ? ((~|(8'ha9)) ~^ (8'ha5)) : (~^(!(8'hb6)))) * {{(~(8'hbf))}}) : ((!(|((8'hbe) ? (8'haf) : (8'hbb)))) << (((&(8'ha9)) <= (~(8'had))) | (-((8'hac) | (8'hb3)))))), 
parameter param32 = {(^((&(param31 * param31)) ? param31 : (param31 ? param31 : param31)))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire30,
                 wire27,
                 wire26,
                 reg29,
                 reg28,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($signed({((|wire3) ? (^wire2) : $signed((8'ha5)))})))
        begin
          if (wire0[(2'h2):(1'h0)])
            begin
              reg4 <= wire1;
              reg5 <= wire1[(3'h7):(2'h3)];
              reg6 <= (8'ha2);
              reg7 <= {($signed($unsigned($unsigned((8'ha0)))) ?
                      reg4[(5'h12):(4'he)] : reg6),
                  (|reg5[(3'h6):(3'h6)])};
            end
          else
            begin
              reg4 <= {$unsigned((+$signed((reg5 != wire0)))),
                  (reg4[(1'h0):(1'h0)] ?
                      ($unsigned((wire3 ? reg5 : (8'ha5))) ?
                          reg7 : {(~^wire0),
                              (wire1 * (8'hb2))}) : $signed(((reg4 == reg4) <= (reg4 ?
                          reg5 : reg5))))};
              reg5 <= $signed(($unsigned($signed((8'hae))) >= (~|(8'h9f))));
              reg6 <= $unsigned((^reg4));
              reg7 <= reg4;
            end
        end
      else
        begin
          if ($signed((8'ha5)))
            begin
              reg4 <= ((7'h42) ?
                  {(!((wire2 ? reg6 : reg4) ?
                          $unsigned(wire1) : wire2))} : $unsigned(reg6[(1'h1):(1'h1)]));
              reg5 <= $unsigned({reg7[(1'h1):(1'h1)], reg5});
              reg6 <= {{reg6, $unsigned($unsigned($signed(reg4)))},
                  {({(reg7 ? wire1 : wire0)} | (wire2 ? reg4 : reg6))}};
              reg7 <= (!$unsigned($signed((&$unsigned((8'ha9))))));
              reg8 <= $signed(($unsigned(reg4[(4'h9):(2'h3)]) ^ reg6));
            end
          else
            begin
              reg4 <= ({((~(^~(8'ha5))) ?
                      (((8'hbb) || wire3) ? {wire2} : reg6) : ((wire2 ?
                          wire2 : reg6) >>> (wire2 ~^ reg5))),
                  $signed(reg7[(2'h2):(1'h1)])} == $unsigned($unsigned((&(+wire0)))));
              reg5 <= {(^(^(reg5[(1'h1):(1'h0)] >> $signed(wire1))))};
              reg6 <= $unsigned(reg6[(1'h1):(1'h0)]);
              reg7 <= (~&((~(^~$signed(wire3))) ? wire2 : reg5[(4'ha):(3'h6)]));
              reg8 <= $signed(((^((reg8 | reg7) ?
                  (reg5 ? reg6 : (8'hb3)) : (reg6 ?
                      reg5 : (8'hbe)))) | wire2[(2'h2):(2'h2)]));
            end
          if ((~|reg5[(1'h0):(1'h0)]))
            begin
              reg9 <= $signed($signed(wire2[(1'h0):(1'h0)]));
              reg10 <= $signed((reg8 ?
                  $unsigned({wire2}) : (~&(reg5[(2'h3):(2'h2)] ?
                      reg8[(2'h2):(1'h1)] : (~|wire1)))));
            end
          else
            begin
              reg9 <= {(~^{((reg9 ? reg7 : wire0) ? wire2 : (+reg4))})};
              reg10 <= wire3;
              reg11 <= ($unsigned($signed((reg4 >> $signed((7'h44))))) ?
                  (reg10[(1'h0):(1'h0)] ?
                      (!wire3) : $unsigned($unsigned({reg6}))) : $unsigned($signed(((7'h41) ^ (!reg6)))));
              reg12 <= ({((~|(~|reg4)) | reg4[(4'hd):(4'ha)])} | $unsigned(($unsigned(wire3[(2'h2):(2'h2)]) ?
                  reg4[(2'h3):(2'h3)] : reg4[(5'h10):(2'h3)])));
            end
          if (($signed((reg9[(5'h10):(5'h10)] ?
                  {(reg10 && wire0), reg9} : $signed((wire3 ? reg8 : reg10)))) ?
              (~&(reg6[(1'h1):(1'h0)] ^~ reg5)) : (^~wire1)))
            begin
              reg13 <= ($signed({($signed(reg6) <<< reg4[(5'h11):(3'h7)]),
                      $unsigned((-wire0))}) ?
                  (($unsigned((reg9 ? reg10 : (8'hbd))) < ((reg8 ?
                              (8'hb3) : reg8) ?
                          (&wire2) : (reg10 >> reg10))) ?
                      {(~^$unsigned(reg4))} : $unsigned($signed((+wire2)))) : reg4[(4'hd):(3'h6)]);
              reg14 <= ((^~(((reg8 ? (8'ha2) : reg11) ?
                  reg10 : reg11[(3'h7):(1'h1)]) == reg4[(4'h8):(1'h1)])) ~^ $signed(((wire1[(3'h5):(3'h5)] ?
                      (reg11 < reg9) : reg13) ?
                  (8'hb9) : $unsigned(wire2))));
              reg15 <= (reg14 + ((~|{(!(8'hab)),
                  $signed(wire2)}) + $unsigned(((reg10 & reg5) ?
                  {reg11, reg11} : (reg10 ? reg14 : reg7)))));
            end
          else
            begin
              reg13 <= {$signed($signed(reg14[(1'h0):(1'h0)]))};
              reg14 <= reg8[(4'ha):(4'h9)];
            end
          reg16 <= (reg5[(4'ha):(4'h8)] ?
              $signed((({wire3, reg5} ^ (reg4 ?
                  (8'h9c) : (8'hb1))) ^ $unsigned(reg12))) : $unsigned(wire0));
        end
    end
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg17 <= ($signed($unsigned($signed((reg13 + reg9)))) <<< (-wire1));
          if ($signed((+(wire1 || $signed(wire1)))))
            begin
              reg18 <= $unsigned(((^$signed(reg14[(2'h2):(2'h2)])) ?
                  ($unsigned((reg9 >= reg13)) - $unsigned($unsigned(reg17))) : $unsigned((reg13 ?
                      $signed(reg7) : $signed(reg4)))));
              reg19 <= wire3;
            end
          else
            begin
              reg18 <= (!{reg14[(1'h0):(1'h0)],
                  (((reg16 + reg15) ? $unsigned(reg5) : reg4[(3'h4):(3'h4)]) ?
                      $signed((8'hb9)) : wire1[(3'h7):(2'h2)])});
              reg19 <= $unsigned(reg8[(3'h5):(3'h5)]);
              reg20 <= {(+reg10[(1'h1):(1'h1)]),
                  ($signed(reg7) ? wire2 : wire1[(3'h6):(2'h2)])};
            end
          reg21 <= (~^((^~reg16) > {(wire2[(1'h0):(1'h0)] ?
                  wire3 : (|reg13))}));
          reg22 <= reg16;
        end
      else
        begin
          reg17 <= (~(~&($unsigned((reg17 ~^ (8'had))) ?
              ((|wire2) ^~ reg12) : (^$signed(reg22)))));
        end
      reg23 <= $signed($signed(reg4[(3'h6):(2'h3)]));
      reg24 <= (~^(7'h44));
      reg25 <= ((!(((reg8 << wire0) ?
          (-(8'hb8)) : (reg5 & reg23)) - $signed({(8'hb8)}))) <<< $signed((wire0 ?
          (-reg5[(2'h2):(2'h2)]) : (reg19[(3'h6):(2'h3)] == (reg19 ^ (8'ha0))))));
    end
  assign wire26 = reg12;
  assign wire27 = reg25;
  always
    @(posedge clk) begin
      reg28 <= (reg11[(3'h7):(2'h3)] & $signed($unsigned($unsigned($signed(reg19)))));
      reg29 <= ($unsigned($signed($unsigned(((8'ha0) ?
          reg21 : reg13)))) ^ wire3[(1'h1):(1'h0)]);
    end
  assign wire30 = (!($signed((reg17[(3'h4):(2'h2)] >= wire0)) ?
                      reg8[(2'h3):(2'h2)] : (~^$signed({(8'hac), reg8}))));
endmodule
