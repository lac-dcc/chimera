module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
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
  always
    @(posedge clk) begin
      if ((^wire0))
        begin
          reg5 <= wire3[(3'h5):(2'h3)];
          if ($signed($signed(wire2)))
            begin
              reg6 <= (~$signed(($unsigned(wire0[(5'h12):(2'h2)]) ?
                  wire2[(2'h3):(2'h2)] : wire4[(3'h4):(1'h0)])));
              reg7 <= $signed($signed(wire2[(4'h9):(3'h4)]));
              reg8 <= wire1;
            end
          else
            begin
              reg6 <= {$unsigned((8'hbd))};
              reg7 <= reg8[(4'hc):(4'ha)];
              reg8 <= wire3;
              reg9 <= (+$signed({reg8, $unsigned($signed(wire3))}));
              reg10 <= wire2[(4'hb):(4'h8)];
            end
          reg11 <= (!wire1);
          reg12 <= (reg7[(4'h9):(2'h2)] ?
              (+$unsigned((~^(reg7 ? wire3 : reg6)))) : reg5[(4'h9):(3'h7)]);
          reg13 <= reg11[(2'h3):(2'h3)];
        end
      else
        begin
          reg5 <= wire2[(4'hf):(2'h3)];
          reg6 <= wire3;
        end
      reg14 <= wire0[(4'hc):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg15 <= wire3[(4'hf):(3'h6)];
    end
  assign wire16 = $signed(($signed($signed((reg10 ?
                      reg8 : wire2))) >= reg8[(5'h13):(5'h10)]));
  assign wire17 = wire3;
  assign wire18 = $signed(((($signed(reg9) ?
                      {wire3,
                          wire17} : (wire0 == reg12)) == wire2[(4'h8):(3'h7)]) <<< ($signed((reg8 ?
                      reg11 : reg6)) ^ $unsigned(wire17[(4'ha):(3'h6)]))));
  assign wire19 = reg5[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      if ({(reg9[(4'ha):(3'h4)] >>> {reg5[(4'hb):(3'h6)]})})
        begin
          reg20 <= $signed(((wire18[(3'h5):(1'h1)] ?
              {$unsigned(reg7)} : $unsigned(wire18[(4'hb):(4'h9)])) | reg15));
          if ($signed(($signed(reg11) << ($unsigned((~|reg12)) ?
              $signed($unsigned(wire4)) : reg14[(3'h5):(3'h5)]))))
            begin
              reg21 <= reg5[(4'ha):(3'h7)];
            end
          else
            begin
              reg21 <= ({reg13} ?
                  $unsigned((|(wire2 ?
                      (reg6 ? wire2 : reg20) : reg6))) : (((~&(wire0 ?
                          wire17 : wire3)) >= $unsigned({reg5})) ?
                      wire16 : (reg10[(2'h2):(1'h1)] ?
                          ($unsigned(reg13) | (!reg7)) : ((reg14 ?
                              (8'hac) : (8'ha8)) >>> (!reg9)))));
              reg22 <= (~$signed($signed(((^wire19) ?
                  (reg5 ~^ wire4) : (^wire1)))));
              reg23 <= $signed($unsigned($unsigned((~^((8'hb8) | (8'haf))))));
            end
          if ($signed((8'had)))
            begin
              reg24 <= reg7;
              reg25 <= (-(~|reg13));
              reg26 <= wire2[(4'he):(4'h8)];
              reg27 <= wire16[(4'hc):(2'h2)];
              reg28 <= $signed(reg7);
            end
          else
            begin
              reg24 <= wire16[(4'h9):(2'h2)];
              reg25 <= wire19;
              reg26 <= wire0;
              reg27 <= (wire1[(1'h0):(1'h0)] ? {reg12} : wire3[(2'h3):(2'h3)]);
              reg28 <= $signed($signed((~|$unsigned({reg6, wire0}))));
            end
          reg29 <= $unsigned(wire4[(1'h1):(1'h1)]);
        end
      else
        begin
          reg20 <= $unsigned($signed($signed(reg22)));
          reg21 <= (&({reg10[(1'h1):(1'h0)],
              $unsigned((wire3 ? (8'h9e) : wire16))} <= wire18));
          if (($signed(wire16) ?
              ((reg11[(2'h2):(2'h2)] >> reg27) ?
                  $signed($signed(reg22)) : $signed((((8'ha7) >>> reg28) ?
                      $signed(reg5) : wire2[(1'h0):(1'h0)]))) : wire3[(4'he):(4'hc)]))
            begin
              reg22 <= (8'hbb);
            end
          else
            begin
              reg22 <= (^(&(~(^$unsigned(reg25)))));
            end
          reg23 <= reg28[(1'h1):(1'h0)];
          if (reg21)
            begin
              reg24 <= (!((wire1 ?
                  reg10[(1'h1):(1'h0)] : reg9[(3'h7):(3'h7)]) == ((wire3[(1'h0):(1'h0)] <<< reg6[(3'h6):(3'h4)]) ?
                  $unsigned((reg8 ? wire18 : (8'hbe))) : $unsigned((&reg14)))));
              reg25 <= (&((+reg5) ?
                  (~((reg20 > (8'hbd)) ?
                      (^reg11) : (!reg6))) : $signed((-((7'h44) ?
                      reg12 : wire16)))));
              reg26 <= (^reg27[(4'h9):(3'h4)]);
              reg27 <= $unsigned({(~(^$signed(reg21))),
                  $signed(((wire0 >> wire3) ~^ (reg26 ? (8'had) : reg22)))});
              reg28 <= reg27;
            end
          else
            begin
              reg24 <= $signed((((+(reg9 ? reg7 : reg7)) ?
                  $unsigned((~&reg7)) : $unsigned(((8'h9d) ^ wire17))) || {{$unsigned(reg22),
                      $unsigned(reg25)},
                  $unsigned((8'ha8))}));
              reg25 <= reg25[(1'h0):(1'h0)];
              reg26 <= reg9;
            end
        end
      reg30 <= ({(8'h9f)} ? (!reg15) : wire1[(2'h3):(1'h0)]);
    end
  assign wire31 = $unsigned(reg15[(2'h2):(1'h1)]);
  assign wire32 = $unsigned(($signed({wire19[(3'h5):(1'h0)], $signed(reg26)}) ?
                      $signed($signed((reg24 ?
                          reg25 : wire18))) : ($signed({reg20,
                          reg26}) ^~ (8'h9e))));
  assign wire33 = {(!(((reg13 ?
                          wire16 : reg12) ^~ $unsigned((8'ha5))) * $signed(reg5[(1'h0):(1'h0)]))),
                      {wire0[(5'h11):(1'h1)]}};
endmodule
