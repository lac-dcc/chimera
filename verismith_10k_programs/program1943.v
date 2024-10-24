module top
#(parameter param24 = (~^(((7'h41) + (~|(+(8'hb5)))) ? ((8'hba) ? (((8'hb5) << (8'ha4)) ? (~^(8'ha6)) : ((8'had) - (7'h40))) : {((8'h9c) ? (8'hbc) : (8'ha2)), (~(8'hbe))}) : {(((8'hac) ? (8'ha9) : (8'ha4)) + ((8'ha5) == (8'ha8))), ({(7'h40)} ? {(8'h9c), (7'h43)} : {(8'haf), (8'haf)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
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
      reg4 <= wire1;
      if (wire2[(1'h0):(1'h0)])
        begin
          reg5 <= wire3[(3'h6):(3'h5)];
          if (wire1)
            begin
              reg6 <= ((($signed($unsigned(reg5)) ?
                      reg5 : $unsigned((-wire2))) ^ (($signed(wire1) ?
                          wire0 : (wire3 ? wire2 : wire3)) ?
                      ((wire3 ? reg4 : wire0) ?
                          {wire3} : (|(7'h44))) : (wire1 && wire3))) ?
                  (8'h9d) : (reg4 ?
                      {$unsigned(reg4[(3'h6):(2'h3)]),
                          (~^(reg4 ? wire2 : reg5))} : $signed(reg4)));
              reg7 <= ((8'ha2) ?
                  {$unsigned($unsigned((^wire0))),
                      reg5[(3'h4):(2'h3)]} : wire1[(5'h13):(5'h10)]);
              reg8 <= $signed(wire0[(1'h1):(1'h0)]);
            end
          else
            begin
              reg6 <= (((-$unsigned($signed(wire3))) ?
                  ((((8'hbf) >> reg8) ?
                      $signed(wire1) : (-wire3)) >= (reg8 - {wire3})) : (($unsigned(reg4) ?
                          wire3 : $signed(wire1)) ?
                      (~reg6) : $signed(reg5))) ~^ ($signed((+(+reg5))) ^~ $unsigned({reg4,
                  (8'ha9)})));
            end
          reg9 <= reg4[(2'h3):(1'h0)];
          if ({wire1[(5'h10):(3'h4)],
              (~$unsigned($unsigned($signed((8'hb6)))))})
            begin
              reg10 <= wire1[(3'h7):(1'h0)];
            end
          else
            begin
              reg10 <= ((-reg6[(1'h0):(1'h0)]) ? wire2 : reg5);
            end
        end
      else
        begin
          reg5 <= ({reg7, reg5[(1'h0):(1'h0)]} ?
              (reg8 ~^ (|wire3)) : ($signed(({reg5, reg6} >>> {reg6})) ?
                  (~|wire1) : ({(^~reg5), {reg7}} != wire2[(1'h0):(1'h0)])));
          reg6 <= (~|{reg10[(4'h8):(3'h7)], (-$unsigned(reg4[(1'h0):(1'h0)]))});
        end
      if ($unsigned(((reg10[(1'h0):(1'h0)] ?
              {$signed((8'hb1)), wire2} : ((reg7 ? reg7 : reg10) ?
                  (^~reg5) : $unsigned(wire1))) ?
          $unsigned(wire1) : wire3[(3'h4):(2'h3)])))
        begin
          reg11 <= wire1;
          reg12 <= (~|{{$unsigned($signed(reg10))},
              (+((reg7 ? wire2 : reg8) ? (8'hb4) : (8'ha6)))});
          reg13 <= (reg9 ?
              ((^~reg5[(2'h3):(2'h3)]) ^~ reg4) : (~$unsigned((+reg8))));
        end
      else
        begin
          reg11 <= (reg12 * $signed(((8'h9d) + $unsigned((reg5 ?
              (7'h44) : wire2)))));
          if ((wire2 ?
              {($signed((reg11 >> wire1)) ?
                      $unsigned($signed(reg13)) : reg7[(2'h3):(1'h0)]),
                  reg13[(1'h1):(1'h0)]} : reg11[(5'h10):(3'h7)]))
            begin
              reg12 <= {($unsigned({wire0}) << (wire3[(4'h8):(2'h2)] ?
                      ((~^reg10) ?
                          (reg11 + reg6) : {reg11,
                              (7'h43)}) : reg7[(3'h6):(1'h0)])),
                  wire0[(2'h2):(1'h1)]};
              reg13 <= $signed((8'ha7));
              reg14 <= (8'h9e);
              reg15 <= wire2[(2'h3):(1'h0)];
              reg16 <= $unsigned({(~{(8'hb7), (reg13 ? wire2 : (8'h9d))})});
            end
          else
            begin
              reg12 <= (~^{reg14[(4'hc):(2'h3)], $signed(reg11)});
              reg13 <= reg7;
            end
          reg17 <= (reg7 >= $unsigned((|{reg11})));
          reg18 <= $unsigned($signed($signed(reg7)));
        end
      reg19 <= $unsigned(({$unsigned(reg16[(2'h3):(1'h0)]), reg17} ?
          (wire3[(4'ha):(1'h1)] ?
              (8'hb3) : (~$unsigned(reg9))) : ($unsigned((|reg13)) ?
              ((reg5 ? (8'hbe) : wire3) ?
                  $unsigned(reg10) : (wire2 > reg17)) : (7'h44))));
      reg20 <= reg10[(4'ha):(4'ha)];
    end
  assign wire21 = ($signed({$unsigned($unsigned((8'hb4)))}) >= $unsigned($signed((~reg19))));
  assign wire22 = $unsigned((8'hb6));
  assign wire23 = wire22[(3'h6):(3'h6)];
endmodule
