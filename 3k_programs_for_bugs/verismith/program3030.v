module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire24,
                 wire23,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
      reg4 <= ((+wire1[(1'h0):(1'h0)]) ? wire1 : (~^(~{wire3[(1'h0):(1'h0)]})));
      reg5 <= $signed($unsigned((8'hab)));
      reg6 <= (wire0[(3'h6):(1'h1)] && (-((reg4 + {wire2, wire0}) <<< ((8'haf) ?
          $unsigned((8'h9f)) : $unsigned(reg4)))));
      if ((wire0[(4'h8):(3'h5)] ?
          (-$signed(wire1)) : {(~|$unsigned((~&wire1)))}))
        begin
          reg7 <= wire1;
        end
      else
        begin
          if ((^reg7))
            begin
              reg7 <= (reg7[(4'ha):(2'h2)] ?
                  ($signed({(wire0 && reg4)}) ?
                      (&$signed((~|reg5))) : ((+{reg4, wire0}) ?
                          $signed(((8'hb2) ?
                              wire0 : reg6)) : (|reg7))) : reg5[(5'h13):(3'h5)]);
              reg8 <= {$signed(wire3[(2'h2):(2'h2)])};
              reg9 <= $signed($signed((!((^~(8'h9e)) | (!(8'ha8))))));
              reg10 <= $signed($signed(({wire2[(3'h7):(1'h1)],
                      $unsigned((7'h41))} ?
                  (~{reg6, reg8}) : {$unsigned(reg6)})));
            end
          else
            begin
              reg7 <= $unsigned($unsigned((^($unsigned(reg7) ?
                  reg6 : (8'hba)))));
              reg8 <= $unsigned((reg6 << $unsigned(((reg7 ?
                  reg10 : (8'hb5)) >>> wire1))));
              reg9 <= reg6;
            end
          reg11 <= wire1[(1'h1):(1'h0)];
          reg12 <= $unsigned((-((^(reg8 > wire3)) ?
              $signed($signed(wire3)) : reg4)));
          reg13 <= {reg4};
          reg14 <= wire3[(1'h1):(1'h1)];
        end
      if ((!(~^reg8[(2'h3):(1'h1)])))
        begin
          if ((reg13 ?
              reg7 : {($unsigned((reg7 == wire0)) >>> {$signed(reg7),
                      reg7[(4'ha):(2'h3)]})}))
            begin
              reg15 <= $unsigned(reg12);
              reg16 <= {reg15[(2'h2):(2'h2)],
                  (&({reg14[(4'he):(4'hd)], (reg14 ? (8'h9c) : (8'ha4))} ?
                      wire2[(1'h0):(1'h0)] : (|{wire0})))};
              reg17 <= $unsigned((|{wire3[(2'h2):(1'h0)]}));
            end
          else
            begin
              reg15 <= wire0[(3'h7):(2'h2)];
              reg16 <= $unsigned(wire0[(1'h1):(1'h1)]);
              reg17 <= (&(reg17[(3'h5):(2'h3)] ?
                  reg17 : ($signed($signed(wire1)) ?
                      $signed(reg11[(4'ha):(1'h1)]) : $unsigned($unsigned(reg10)))));
              reg18 <= $unsigned(reg13[(4'h8):(2'h2)]);
              reg19 <= (&$unsigned(reg5));
            end
          reg20 <= $unsigned(((reg18[(2'h2):(1'h1)] && $unsigned($signed(wire1))) ?
              (8'hb2) : (^$signed((&reg14)))));
          reg21 <= reg8;
        end
      else
        begin
          reg15 <= ($signed($signed(wire3[(1'h1):(1'h0)])) ?
              reg17[(2'h2):(2'h2)] : reg15);
          reg16 <= ((8'hbb) ? wire0[(2'h2):(2'h2)] : reg6[(3'h7):(3'h6)]);
          if ($signed(reg5))
            begin
              reg17 <= wire2;
              reg18 <= $unsigned({((~|reg17) * (8'hae))});
              reg19 <= $unsigned($signed((((reg6 ? wire2 : reg10) ?
                  (&reg5) : (reg20 ?
                      reg18 : (8'hae))) & $unsigned((reg6 + wire0)))));
              reg20 <= $unsigned($unsigned({reg14[(5'h14):(4'h9)],
                  {$signed(wire2), (~|(8'hab))}}));
              reg21 <= ((~(($unsigned(reg19) >> $signed(reg21)) ?
                      $signed($signed((8'h9e))) : reg11[(5'h13):(4'hc)])) ?
                  (-$signed((reg18[(4'h8):(3'h4)] && (reg17 | reg14)))) : reg17);
            end
          else
            begin
              reg17 <= $unsigned(reg7[(2'h2):(1'h1)]);
              reg18 <= $unsigned($unsigned($signed((reg14 < $unsigned(reg7)))));
              reg19 <= (wire2[(4'h8):(3'h6)] ?
                  (&reg6[(2'h2):(1'h0)]) : $unsigned($unsigned($unsigned(((8'ha3) ?
                      wire1 : wire2)))));
              reg20 <= ($unsigned((($signed(wire0) + (reg11 ? reg12 : reg19)) ?
                  (-(reg11 ? reg17 : wire0)) : (+(reg10 ?
                      (8'haa) : reg5)))) >> $unsigned(reg16[(1'h0):(1'h0)]));
            end
          reg22 <= (($signed(($unsigned(reg13) ?
              $signed(reg4) : (reg20 <<< reg7))) <<< reg15) * reg7);
        end
    end
  assign wire23 = {$unsigned(wire0),
                      {$unsigned(((reg17 ? reg9 : reg14) < $signed(reg8)))}};
  assign wire24 = (wire2 ~^ $signed($unsigned((~(!(7'h41))))));
  always
    @(posedge clk) begin
      if (($unsigned(wire3) < $signed((reg14[(4'hf):(3'h4)] ?
          (!(^reg6)) : reg13[(4'ha):(3'h4)]))))
        begin
          reg25 <= {reg11[(1'h1):(1'h0)], reg8[(2'h3):(2'h2)]};
        end
      else
        begin
          reg25 <= $unsigned(((((reg17 ? (8'ha9) : (8'hba)) ?
                      $signed((8'ha9)) : $signed((8'h9c))) ?
                  (~&{reg10, reg21}) : $signed((reg6 <<< reg18))) ?
              reg15 : ($signed((wire24 ? reg19 : (8'hba))) ?
                  ($unsigned(wire2) ?
                      reg17 : $signed(reg15)) : ((~^reg4) ^ {wire24, reg21}))));
          reg26 <= (-{$signed(((reg14 ? wire3 : reg13) ?
                  (reg18 ^~ reg10) : (reg4 || reg11))),
              ((^{(8'ha8)}) > (~&(!reg11)))});
          reg27 <= $signed($signed(wire24[(2'h3):(2'h3)]));
        end
      reg28 <= reg11;
    end
  assign wire29 = {{(8'hab), wire3[(2'h3):(2'h2)]}};
  assign wire30 = (!(wire24[(4'h8):(4'h8)] >>> $signed($unsigned($signed((8'ha1))))));
  assign wire31 = $signed((reg18 <= ((~|reg4) >= $unsigned(reg27))));
  assign wire32 = ({((|(reg6 ~^ reg26)) ?
                              reg17[(1'h0):(1'h0)] : ((reg13 ?
                                      (8'hb2) : (8'ha2)) ?
                                  reg9[(2'h2):(2'h2)] : $signed(reg26))),
                          (|(wire3 & $signed(reg16)))} ?
                      reg12[(1'h0):(1'h0)] : {(^~{$signed(reg5), (+wire23)})});
  assign wire33 = (~|$unsigned(reg26[(3'h5):(3'h4)]));
endmodule
