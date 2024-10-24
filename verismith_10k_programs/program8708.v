module top
#(parameter param45 = ((({((8'hba) >= (8'hab)), ((8'had) > (7'h43))} ? ({(8'hb6), (7'h42)} ? (^~(8'hb6)) : (8'h9e)) : (((8'hbe) ? (8'hb5) : (8'hb3)) ? {(8'ha4)} : (8'hbf))) ? (|(8'hab)) : (((!(8'hb4)) ? ((8'hb0) ? (8'h9d) : (8'hbf)) : {(8'hbb), (8'ha4)}) ? (8'h9d) : (((8'hbc) ? (8'ha9) : (8'haf)) ? ((8'h9e) ? (8'hba) : (8'ha0)) : (8'hbb)))) && (((8'hb0) ? ((^~(8'hb8)) ? {(8'hba)} : {(8'hb7)}) : (((8'hb8) && (8'hbd)) ? ((7'h44) ? (8'hbe) : (8'ha4)) : (~^(8'hb4)))) - (8'h9d))), 
parameter param46 = param45)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire24,
                 wire19,
                 wire5,
                 wire4,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
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
  assign wire4 = wire0[(2'h2):(1'h1)];
  assign wire5 = (~|wire4[(4'h8):(1'h0)]);
  always
    @(posedge clk) begin
      reg6 <= $signed((((wire5[(2'h2):(1'h1)] - (|wire4)) ? {{wire5}} : wire0) ?
          (^wire4) : (wire1[(2'h3):(2'h2)] ?
              ($signed(wire4) == (wire3 ? (8'had) : wire5)) : {(~|wire4)})));
      if ({$signed({wire3[(3'h4):(2'h2)]}),
          ((wire3 << wire1[(2'h3):(1'h0)]) >> $unsigned(wire1[(3'h7):(1'h1)]))})
        begin
          reg7 <= ($unsigned((((wire1 ? wire4 : wire4) << (reg6 != wire2)) ?
                  {((8'hb3) * wire5),
                      $signed(wire3)} : $unsigned((reg6 >>> reg6)))) ?
              $signed($signed({$signed(wire2), {wire2, wire4}})) : wire1);
          reg8 <= (+($unsigned(reg7) && (^~(^$unsigned(wire3)))));
          reg9 <= $signed(wire2);
        end
      else
        begin
          reg7 <= wire0;
          if (((~$unsigned(wire0)) > $unsigned((($unsigned(wire5) ?
                  (~wire1) : reg8) ?
              (-(wire0 ^~ reg7)) : wire2[(2'h2):(1'h0)]))))
            begin
              reg8 <= (reg9 || reg7[(3'h5):(1'h0)]);
              reg9 <= reg7[(2'h3):(2'h2)];
              reg10 <= $unsigned($unsigned(((8'ha9) ?
                  {reg6, wire5} : ($signed(reg6) ?
                      wire4 : (wire2 ? (8'hb9) : reg7)))));
              reg11 <= {($signed(wire4[(2'h3):(1'h0)]) ?
                      ($unsigned(wire4) ?
                          {(wire5 ^~ (8'hac)), {wire1}} : {(reg8 ?
                                  reg10 : wire5)}) : {(|$unsigned(wire3))})};
              reg12 <= (reg6 ?
                  wire3[(4'h9):(2'h3)] : $unsigned((reg9 ?
                      $signed({reg7, reg10}) : $signed($unsigned(reg8)))));
            end
          else
            begin
              reg8 <= (((8'hb7) != (|$signed($signed(reg6)))) > $unsigned((wire3[(4'hc):(4'hb)] & $unsigned((|reg10)))));
            end
          if ({{{$signed(reg6[(3'h4):(3'h4)])}}})
            begin
              reg13 <= {$unsigned($unsigned(wire4))};
              reg14 <= wire2[(1'h1):(1'h0)];
              reg15 <= $signed($signed((~^$signed($unsigned(reg13)))));
              reg16 <= wire0[(2'h2):(1'h0)];
            end
          else
            begin
              reg13 <= (($signed(reg11[(3'h5):(2'h2)]) ?
                  reg10[(1'h0):(1'h0)] : ($unsigned(reg12[(4'he):(4'h9)]) ?
                      (((8'hb0) ? (8'h9d) : reg9) > (reg8 ?
                          reg7 : wire2)) : $signed((wire0 & wire4)))) >> {$signed({reg7,
                      (reg16 <= wire2)}),
                  $signed(wire3[(4'hd):(4'hc)])});
            end
          reg17 <= (($signed($unsigned($unsigned((8'hb9)))) <= reg16) >> $unsigned((|($unsigned(reg12) & $unsigned(reg7)))));
          reg18 <= (reg6 | $unsigned($unsigned(((~&(8'h9f)) ?
              $unsigned(wire3) : (!reg16)))));
        end
    end
  assign wire19 = ((-{(|$signed(reg12))}) == reg17);
  always
    @(posedge clk) begin
      reg20 <= $unsigned($signed($unsigned(wire2[(2'h2):(2'h2)])));
      reg21 <= reg13;
      reg22 <= reg20;
      reg23 <= {reg15};
    end
  assign wire24 = $signed((reg10 ?
                      (((reg10 ?
                          reg16 : (8'had)) | $unsigned(reg15)) << $unsigned((wire3 ?
                          reg6 : reg10))) : ((~$unsigned(reg8)) ^ $signed((wire0 ?
                          reg13 : reg12)))));
  always
    @(posedge clk) begin
      reg25 <= $unsigned($signed((^~$signed((~&(8'ha4))))));
      reg26 <= reg20[(5'h15):(1'h1)];
      reg27 <= (reg21 ?
          wire5 : $signed($unsigned(((reg9 ? reg8 : reg7) ?
              reg14 : reg8[(4'he):(2'h2)]))));
      reg28 <= (!((~|reg14) ?
          (reg22[(4'h9):(3'h6)] != (~|$signed((8'ha6)))) : $signed($unsigned(wire3))));
      reg29 <= ((~|(^$signed((^(7'h41))))) ?
          reg10[(2'h2):(2'h2)] : $unsigned(reg17));
    end
  assign wire30 = {$unsigned($signed((~{reg21}))), (&reg28[(5'h10):(3'h7)])};
  assign wire31 = ((!$signed($unsigned($signed(wire30)))) ?
                      (~$unsigned($signed($signed(reg6)))) : {wire30[(1'h0):(1'h0)]});
  assign wire32 = (reg12 - (^~(~&$unsigned($signed(reg22)))));
  assign wire33 = reg17;
  always
    @(posedge clk) begin
      reg34 <= reg23[(2'h3):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg35 <= wire31[(3'h4):(3'h4)];
      reg36 <= (({($signed(wire24) - (reg9 >> wire31)),
          {$signed((8'hb6)),
              (wire33 ?
                  (8'h9c) : reg10)}} & ((^$signed(wire19)) * wire30)) > {(wire2[(1'h0):(1'h0)] >> $signed($signed(wire30))),
          (wire19 ? reg21[(3'h4):(1'h1)] : reg17)});
      reg37 <= (+wire2);
      reg38 <= ($signed($signed($signed($signed((8'hbd))))) == (reg36[(3'h4):(1'h1)] ?
          reg6 : ($unsigned((reg28 ? reg13 : (8'ha6))) ?
              reg15[(2'h3):(2'h3)] : (~|wire32[(4'h9):(3'h7)]))));
      if (($signed(wire24) ^~ $unsigned($unsigned((+$signed((8'haa)))))))
        begin
          reg39 <= (wire1 ?
              $signed($signed($signed(((8'h9f) ?
                  reg13 : (8'h9e))))) : (reg28 > (reg20 ?
                  {$signed((8'hae)), (^~wire30)} : (^(wire4 * reg17)))));
          if ({$unsigned((8'h9d)), reg23[(2'h3):(1'h0)]})
            begin
              reg40 <= $unsigned((8'hbe));
              reg41 <= {$signed($signed(((~^reg35) ?
                      (wire31 ? reg26 : reg9) : $signed(reg15)))),
                  reg26};
            end
          else
            begin
              reg40 <= (!((reg14[(1'h1):(1'h0)] ?
                  ((reg14 ?
                      wire1 : reg28) > {reg20}) : wire19) >> {$signed(reg12[(3'h4):(1'h0)]),
                  wire24}));
              reg41 <= wire3;
              reg42 <= reg26;
              reg43 <= ((|$unsigned(reg35[(3'h4):(1'h1)])) <<< $unsigned(($unsigned((8'hb9)) ?
                  ((reg12 == reg35) + (reg6 ?
                      wire1 : (8'h9e))) : reg6[(1'h0):(1'h0)])));
              reg44 <= wire2;
            end
        end
      else
        begin
          reg39 <= ((reg9[(2'h2):(1'h1)] ?
              reg14 : reg41[(1'h1):(1'h0)]) & $unsigned(wire5[(1'h0):(1'h0)]));
          reg40 <= ((($signed($unsigned(reg41)) ?
                      $unsigned(reg14[(4'he):(2'h3)]) : (8'ha8)) ?
                  {((reg7 ?
                          (8'haf) : wire0) * $unsigned(wire31))} : $unsigned(($signed(reg18) ?
                      (reg23 - (8'ha6)) : wire33[(3'h5):(1'h0)]))) ?
              reg36 : $unsigned(reg22));
          reg41 <= $signed({($unsigned({(8'ha6),
                  wire33}) && reg43[(2'h2):(1'h1)])});
          reg42 <= reg40[(1'h0):(1'h0)];
          reg43 <= wire4[(3'h5):(1'h0)];
        end
    end
endmodule
