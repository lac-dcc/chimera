module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire15;
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 wire16,
                 wire15,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg18,
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
      if ($signed((~|$unsigned(wire2[(3'h5):(1'h1)]))))
        begin
          if ($unsigned(wire3[(2'h3):(1'h1)]))
            begin
              reg4 <= $signed((|wire3[(3'h7):(3'h5)]));
            end
          else
            begin
              reg4 <= (^~$unsigned($signed({$unsigned(reg4)})));
            end
        end
      else
        begin
          reg4 <= wire1;
          if ((~(~&reg4[(4'hb):(2'h2)])))
            begin
              reg5 <= $signed((8'hb4));
              reg6 <= ((-wire2[(4'ha):(3'h5)]) * wire1);
              reg7 <= reg5[(3'h4):(2'h2)];
              reg8 <= reg6;
            end
          else
            begin
              reg5 <= $signed($signed(reg4[(5'h12):(3'h5)]));
              reg6 <= (^wire1[(1'h1):(1'h0)]);
              reg7 <= {$unsigned(reg4[(4'hf):(4'ha)])};
              reg8 <= (reg8[(3'h6):(3'h6)] >= (^(^$unsigned((reg5 * reg4)))));
            end
          reg9 <= (8'ha6);
          reg10 <= (((((reg7 << reg4) ?
              $signed((8'hbb)) : $unsigned(reg9)) == reg7) & $signed(reg5[(1'h1):(1'h1)])) - (8'hb3));
          reg11 <= ($signed(reg9) ?
              $unsigned((-(wire0 ?
                  $unsigned(wire0) : (wire0 ?
                      wire2 : reg9)))) : {($unsigned((reg9 ^~ (8'hb7))) ^~ (8'h9f))});
        end
      reg12 <= ((wire2 || ($signed(wire0[(2'h3):(2'h3)]) ?
          $signed(reg6[(3'h5):(2'h3)]) : ((reg6 ? reg11 : reg11) ?
              (reg7 <= (8'hb0)) : (wire1 || reg10)))) && ((reg10 ?
              (~|reg10) : {$unsigned(reg4)}) ?
          {{wire3}} : (((wire3 != (7'h43)) ~^ $signed((8'ha2))) ?
              $signed((!wire1)) : {wire0[(4'hb):(1'h0)]})));
      reg13 <= $unsigned($unsigned({reg9}));
      reg14 <= ({$unsigned((8'hb4)), $unsigned(wire2[(1'h0):(1'h0)])} ?
          (^((~&((7'h41) & reg4)) - $signed($signed(reg12)))) : $signed(((reg12[(1'h1):(1'h1)] ?
              $signed(wire1) : $unsigned(wire2)) ~^ ((8'hba) ?
              $signed(reg10) : (reg12 ? reg6 : reg6)))));
    end
  assign wire15 = {($signed({reg10[(4'h8):(3'h4)], (reg7 ? (8'hbf) : reg6)}) ?
                          $signed($unsigned(reg13[(2'h2):(1'h0)])) : {wire3}),
                      (((reg4[(1'h0):(1'h0)] ?
                              $unsigned(reg5) : $unsigned(reg11)) ?
                          reg14[(3'h7):(3'h4)] : (|$unsigned((8'hbf)))) ~^ wire2[(3'h4):(2'h2)])};
  assign wire16 = (!$unsigned((($signed(wire1) ?
                      (!(8'h9c)) : wire3[(1'h1):(1'h1)]) <= (~(8'hb8)))));
  assign wire17 = {$signed(wire1[(1'h1):(1'h1)])};
  always
    @(posedge clk) begin
      reg18 <= wire1;
    end
  assign wire19 = {(8'hbc)};
  assign wire20 = wire3[(3'h6):(3'h6)];
  assign wire21 = $unsigned({(+(reg18[(1'h1):(1'h1)] ?
                          {wire16} : (wire16 ? reg5 : reg8))),
                      wire16[(2'h3):(1'h0)]});
  assign wire22 = ({(+wire3)} && wire3[(4'h9):(1'h1)]);
  assign wire23 = ((reg7[(3'h7):(3'h7)] - wire16[(2'h2):(1'h0)]) ?
                      (8'hbc) : ((($signed(wire22) <<< wire16[(3'h6):(1'h0)]) ^ reg9[(5'h11):(3'h7)]) * reg18));
  assign wire24 = wire20;
  always
    @(posedge clk) begin
      reg25 <= $unsigned($signed(((8'hb5) <= wire24[(2'h3):(2'h3)])));
      reg26 <= ((-((^~$unsigned(reg6)) ?
          $signed($unsigned(reg9)) : ((reg11 << wire1) || reg14[(3'h6):(1'h0)]))) ~^ (~&$unsigned(reg8[(5'h11):(4'ha)])));
      reg27 <= ((reg8[(3'h4):(2'h2)] ^~ $unsigned((~^wire23))) ?
          ((((reg26 ^~ reg12) >>> (wire23 ?
              reg8 : wire15)) == (wire15[(3'h5):(2'h3)] ?
              {reg5} : ((8'ha5) ?
                  reg9 : wire15))) * wire1) : (wire20 < $unsigned(($signed((7'h41)) ?
              $unsigned(wire22) : (wire24 ? (8'hac) : reg4)))));
      if (wire1[(1'h0):(1'h0)])
        begin
          reg28 <= $signed(((^~((|reg6) <= $unsigned(wire17))) ?
              (&$signed($unsigned((8'ha1)))) : wire17[(2'h2):(1'h0)]));
        end
      else
        begin
          reg28 <= {wire15};
          reg29 <= ($signed({$signed(wire20),
                  ((reg18 ? reg5 : (8'ha6)) != $unsigned(reg10))}) ?
              $signed($signed($signed((wire22 ?
                  reg13 : reg27)))) : (reg8[(4'h9):(4'h9)] ^ (|(8'ha9))));
          reg30 <= {$unsigned((!(wire15[(3'h7):(3'h4)] ?
                  $unsigned(reg6) : wire3)))};
          reg31 <= $signed(wire22);
          reg32 <= ($unsigned($unsigned($signed(wire2[(3'h5):(3'h4)]))) ?
              reg8[(1'h1):(1'h0)] : $signed($unsigned((|(reg11 ?
                  reg4 : reg29)))));
        end
      reg33 <= ($signed({(reg18 ? (~|wire15) : reg11[(1'h0):(1'h0)]),
              (~$unsigned(wire22))}) ?
          $signed(reg32) : $signed((~&($signed(reg26) ?
              $unsigned(reg14) : (~&reg8)))));
    end
  assign wire34 = ((7'h44) >> reg29[(4'h9):(2'h3)]);
  assign wire35 = ($unsigned({(reg6 ?
                          (reg31 ?
                              wire0 : (8'h9e)) : {wire17})}) >> (-$signed(wire3)));
endmodule
