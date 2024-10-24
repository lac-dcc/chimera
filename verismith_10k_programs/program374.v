module top
#(parameter param34 = ((((|((8'h9f) ? (8'ha9) : (8'hba))) ? (((8'hb8) ? (8'hb3) : (8'hbd)) > (!(8'h9c))) : (~^((8'hb4) ? (8'hbd) : (7'h43)))) ? (!(8'ha9)) : ((((7'h40) ? (8'h9d) : (8'hb3)) ^~ (8'hb3)) * ({(8'hbb)} ? ((8'hbf) ? (7'h43) : (8'h9f)) : {(8'ha6), (8'h9c)}))) <= (^~((+((8'ha6) ? (8'hb5) : (8'h9c))) >= ((~&(7'h40)) <<< ((8'hb2) ? (7'h40) : (7'h40)))))), 
parameter param35 = (^(&{(-(param34 | param34))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire17,
                 wire16,
                 wire5,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
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
  assign wire5 = $signed((~&wire1));
  always
    @(posedge clk) begin
      if ($signed((&(wire0 + $unsigned($signed(wire2))))))
        begin
          reg6 <= $unsigned((wire4 ?
              (~(^$unsigned(wire0))) : wire0[(4'he):(4'h9)]));
          reg7 <= (!wire5);
          if (reg6[(2'h2):(1'h0)])
            begin
              reg8 <= (8'ha5);
              reg9 <= $signed($signed(wire2));
            end
          else
            begin
              reg8 <= (reg9[(4'he):(3'h5)] ?
                  $unsigned((($unsigned(wire3) - wire2) ?
                      $signed((~reg9)) : (~wire5))) : $unsigned(wire4[(2'h3):(2'h3)]));
              reg9 <= $unsigned($signed($signed((|wire2))));
            end
          reg10 <= {((reg9 > reg6) >= (({wire3} && (wire0 ?
                      (8'ha4) : (8'hb7))) ?
                  {reg6[(2'h3):(2'h2)], $unsigned(reg9)} : wire4))};
          if (wire4[(3'h4):(2'h2)])
            begin
              reg11 <= $signed((wire2 > wire5));
            end
          else
            begin
              reg11 <= $unsigned((reg7[(1'h1):(1'h0)] ?
                  reg9[(2'h3):(2'h2)] : ($unsigned((|reg6)) ^~ (!{reg11,
                      (8'ha7)}))));
              reg12 <= {(~|(~&$unsigned(reg11[(1'h1):(1'h1)])))};
              reg13 <= $unsigned(($signed((wire5[(1'h1):(1'h1)] ^ ((8'hbd) ?
                  wire5 : wire5))) && (^((reg12 ^~ wire5) + {reg10}))));
              reg14 <= $signed(((($signed((8'hb3)) - $signed((8'hb5))) || (^(~wire1))) > (~^(+{reg7}))));
              reg15 <= {($signed($signed(reg10)) ?
                      reg8[(3'h7):(3'h7)] : reg12)};
            end
        end
      else
        begin
          reg6 <= ((reg15[(4'hf):(4'hb)] ? wire5 : wire3) >= reg7);
          reg7 <= ({(-$signed(reg14)), reg9} ?
              (($unsigned($unsigned(reg7)) ?
                  $signed((reg8 + (8'haa))) : $signed({wire4,
                      reg9})) > wire5[(2'h2):(1'h0)]) : $signed(($signed((reg15 ?
                  reg13 : reg12)) == ((reg10 ^ reg9) ?
                  $signed((8'hab)) : reg15[(4'he):(4'hd)]))));
        end
    end
  assign wire16 = wire2;
  assign wire17 = reg11[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      if ((reg11 <<< {wire3[(4'ha):(4'h8)]}))
        begin
          reg18 <= (&(reg6 >= (((^reg10) ?
              reg14[(3'h4):(3'h4)] : (reg11 ?
                  reg13 : wire4)) <<< (~^$unsigned(reg11)))));
        end
      else
        begin
          if ((|(wire16[(3'h4):(1'h1)] & (+$unsigned(((8'ha7) ?
              reg11 : reg8))))))
            begin
              reg18 <= (($signed($unsigned($signed(wire17))) ?
                  ((^$signed(wire0)) ? wire3 : {(|reg10)}) : {(reg6 ?
                          $signed(reg12) : reg13),
                      (7'h41)}) >> reg11[(3'h4):(1'h1)]);
              reg19 <= ((wire0[(4'hb):(2'h2)] || reg10) >= ($unsigned((reg13[(2'h3):(2'h2)] ?
                  (~^reg7) : (~^reg11))) ^~ wire1[(4'hf):(4'hc)]));
            end
          else
            begin
              reg18 <= reg8;
              reg19 <= ((~&reg10[(3'h4):(2'h2)]) * (reg10 ~^ {$signed(reg12)}));
            end
        end
      reg20 <= (+$unsigned(reg9));
      reg21 <= (-(reg13 ? reg14[(1'h1):(1'h1)] : reg18));
    end
  assign wire22 = {(8'hba)};
  assign wire23 = reg12;
  assign wire24 = $signed(reg20[(2'h3):(2'h2)]);
  assign wire25 = $unsigned(reg10);
  always
    @(posedge clk) begin
      reg26 <= (reg10[(1'h0):(1'h0)] ?
          $unsigned(($unsigned((reg10 ?
              reg18 : (8'ha3))) > reg13)) : $signed($unsigned((!reg13))));
      reg27 <= {(wire3 ? reg15[(2'h2):(1'h0)] : $unsigned($unsigned(reg13)))};
      reg28 <= $unsigned((({(~&wire4)} >= $signed($signed(wire24))) + (((wire17 ?
          reg26 : reg15) >> (~^(7'h44))) & $unsigned($unsigned(reg27)))));
      reg29 <= (((+$unsigned(wire3)) == wire22[(1'h1):(1'h1)]) - $unsigned(reg14));
    end
  assign wire30 = wire2;
  assign wire31 = $signed({((~&(wire5 >>> (8'ha8))) ^ (((8'ha7) > wire1) && (+reg27))),
                      (&((reg12 && reg10) & reg11))});
  assign wire32 = (wire16[(1'h1):(1'h0)] ?
                      ($signed(reg9[(4'ha):(3'h5)]) ?
                          (wire16[(4'hb):(2'h2)] ?
                              $unsigned(reg15) : ((reg15 + wire5) * (wire3 << (8'ha6)))) : $signed((wire31[(3'h6):(1'h1)] <<< wire23[(2'h2):(1'h0)]))) : ((reg18[(1'h1):(1'h1)] < {$unsigned(wire0)}) ?
                          $unsigned(wire3) : (|(8'hb8))));
  assign wire33 = (^(({(reg15 ? reg15 : wire22),
                          (wire22 ^ (8'hb9))} >> reg6[(1'h1):(1'h1)]) ?
                      $unsigned(($signed(reg26) == $unsigned((8'ha4)))) : (((^~wire17) ?
                          $signed(reg10) : wire22[(1'h1):(1'h0)]) && $signed(reg19[(3'h6):(2'h3)]))));
endmodule
