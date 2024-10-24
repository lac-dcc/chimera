module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire5,
                 wire4,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = $unsigned((|((&(~wire4)) ?
                     $unsigned($unsigned((8'hbc))) : $signed(wire1))));
  always
    @(posedge clk) begin
      reg6 <= (7'h42);
      if (wire2[(3'h7):(3'h7)])
        begin
          reg7 <= ((!($signed($signed(wire2)) != (+{wire2}))) == wire3);
        end
      else
        begin
          reg7 <= $signed($unsigned(wire0[(4'hd):(1'h0)]));
          if (wire0)
            begin
              reg8 <= ((8'ha9) >= $unsigned(((~^$signed((8'h9c))) ~^ wire4)));
              reg9 <= $signed((~^((wire1[(3'h4):(1'h0)] <= wire2[(4'ha):(4'h8)]) ?
                  ((wire5 ? (8'ha6) : wire3) ?
                      reg7 : wire5[(1'h1):(1'h1)]) : wire2[(3'h5):(3'h4)])));
              reg10 <= ({($signed($unsigned(wire4)) ?
                      wire5 : reg6[(1'h1):(1'h0)])} ~^ ($unsigned($signed($unsigned(wire2))) ?
                  (~|($signed((7'h44)) || {wire0,
                      wire0})) : $signed($signed({wire4, reg7}))));
            end
          else
            begin
              reg8 <= {((~&(8'hae)) && (((8'ha3) >>> (wire2 ? wire5 : wire1)) ?
                      (wire2[(5'h12):(5'h12)] ?
                          (wire1 < wire4) : $unsigned(wire2)) : (reg6 ?
                          (reg9 ? reg9 : wire0) : (^~wire3)))),
                  reg8};
              reg9 <= $unsigned($unsigned($signed(reg8)));
              reg10 <= (|(~((reg6 ?
                  $signed(wire0) : reg8[(3'h5):(2'h3)]) ^~ (&(-reg9)))));
              reg11 <= {$unsigned({reg10})};
              reg12 <= (~&(^~reg8[(3'h6):(3'h6)]));
            end
          reg13 <= reg12;
          reg14 <= (reg6[(1'h0):(1'h0)] >>> ({{(reg7 ?
                      reg11 : (8'hb4))}} <= wire1));
          reg15 <= (reg9[(2'h2):(1'h1)] ?
              $signed((8'h9d)) : $unsigned((|(8'ha3))));
        end
      reg16 <= reg9;
      reg17 <= $signed({$unsigned((8'hbe))});
    end
  always
    @(posedge clk) begin
      reg18 <= $signed((~($signed($signed(reg12)) >= reg13[(3'h5):(1'h1)])));
      reg19 <= ((!$signed(reg15[(2'h2):(2'h2)])) != reg13);
      reg20 <= wire0;
      if ($signed((-reg12)))
        begin
          if (((^(wire0 ? reg11[(4'h9):(3'h7)] : reg11[(3'h5):(3'h4)])) ?
              {($unsigned((wire1 ?
                      wire2 : (8'hb0))) + $unsigned((reg19 || (8'hb0)))),
                  wire5[(1'h0):(1'h0)]} : ((^reg9[(1'h1):(1'h1)]) >>> ({(~reg8)} ?
                  $unsigned($signed(reg15)) : {$signed(reg6)}))))
            begin
              reg21 <= ($signed((reg16[(2'h3):(2'h3)] ~^ (^~$signed((8'hb3))))) ?
                  $signed(reg14[(5'h13):(4'ha)]) : (reg16 ?
                      $signed($unsigned($unsigned(reg6))) : ($unsigned({wire1,
                              reg8}) ?
                          reg7 : $unsigned((wire5 >= wire3)))));
              reg22 <= reg15;
              reg23 <= $signed(($unsigned(wire0[(5'h10):(4'h8)]) ?
                  $unsigned((7'h41)) : (!$signed((reg6 <= (8'haf))))));
            end
          else
            begin
              reg21 <= {(~&($signed($signed(wire3)) >> reg8[(4'h9):(3'h4)]))};
            end
          reg24 <= (-{reg17});
          reg25 <= ($signed(reg16[(2'h2):(1'h1)]) ~^ reg23[(2'h2):(1'h1)]);
          if ((reg14 & $unsigned((($signed(reg9) ?
              (reg16 ? reg13 : reg19) : reg25) >>> $signed((wire2 ?
              reg13 : wire4))))))
            begin
              reg26 <= ((($signed({reg9,
                  wire4}) + (reg12[(3'h4):(3'h4)] == reg24)) <= ({(wire1 ?
                          reg11 : (8'ha0))} ?
                  reg17 : {(~|reg13)})) <= $signed($unsigned({reg16[(2'h3):(2'h2)],
                  (8'h9e)})));
            end
          else
            begin
              reg26 <= (wire1 ?
                  $unsigned($unsigned($signed({reg12,
                      reg9}))) : reg23[(1'h0):(1'h0)]);
              reg27 <= $signed($unsigned((8'hac)));
              reg28 <= $unsigned((^$signed(wire4)));
            end
        end
      else
        begin
          if (((&{$signed({reg7})}) ?
              $signed($unsigned(((8'hb4) ?
                  reg19[(3'h5):(1'h0)] : reg19))) : ($signed(((-reg16) <<< $unsigned((8'hb0)))) < wire4[(5'h14):(5'h14)])))
            begin
              reg21 <= (!reg14);
              reg22 <= {(^~$signed(($unsigned(wire0) ?
                      $unsigned(reg9) : ((8'haa) ? reg22 : (8'hae))))),
                  reg16};
              reg23 <= ({reg23[(4'h9):(3'h4)]} - $unsigned((((~^reg7) ?
                  reg13 : reg20) + $unsigned((7'h43)))));
            end
          else
            begin
              reg21 <= $signed($signed(wire5));
            end
          reg24 <= $signed({reg28, reg11});
          if ((~&(|(!{$signed((8'hb7)), reg17}))))
            begin
              reg25 <= ((^~(reg24 & (((8'ha4) ? (8'ha3) : reg6) ?
                  reg17 : (~^wire0)))) << reg18);
              reg26 <= (~^((wire1[(3'h5):(3'h4)] ?
                  $unsigned((8'hbb)) : $unsigned($signed(wire2))) == ({$unsigned(reg11),
                  (^~reg13)} > reg10[(3'h6):(2'h2)])));
              reg27 <= reg7;
              reg28 <= (|$signed((!((~^reg16) ? reg20 : reg6[(1'h0):(1'h0)]))));
              reg29 <= $unsigned($signed({$unsigned(wire3[(1'h0):(1'h0)])}));
            end
          else
            begin
              reg25 <= (|reg17[(5'h12):(3'h4)]);
              reg26 <= ($unsigned((reg20 != reg25)) ?
                  $unsigned($unsigned((~|$signed(reg27)))) : reg23[(3'h6):(3'h4)]);
              reg27 <= reg15[(3'h4):(2'h2)];
              reg28 <= reg7[(4'h8):(1'h0)];
              reg29 <= $unsigned(((($signed(wire5) ^~ (&reg16)) * reg21[(4'hc):(4'h9)]) ?
                  $signed(((reg7 >> reg26) ?
                      $unsigned(reg20) : $unsigned(reg22))) : $signed(reg20[(4'hb):(2'h2)])));
            end
        end
    end
endmodule
