module top
#(parameter param45 = (8'h9c))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h205):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire44,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire27,
                 wire26,
                 wire25,
                 wire6,
                 wire5,
                 reg43,
                 reg42,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
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
                 (1'h0)};
  assign wire5 = ($unsigned($unsigned(wire2[(2'h3):(2'h2)])) ~^ (~&$signed(wire1[(3'h4):(1'h0)])));
  assign wire6 = (^~$unsigned({$unsigned($unsigned(wire1))}));
  always
    @(posedge clk) begin
      reg7 <= ($unsigned((wire1[(3'h4):(2'h2)] && $unsigned(wire3[(2'h2):(1'h1)]))) ~^ (-$signed(wire2[(4'hf):(4'hd)])));
      reg8 <= ($signed((~reg7[(3'h4):(1'h0)])) | $unsigned(wire1[(3'h7):(1'h1)]));
      if ($signed((8'hbf)))
        begin
          if ($signed($signed(wire2[(3'h5):(2'h3)])))
            begin
              reg9 <= $unsigned({(~^$signed((reg8 ? wire1 : (8'haf))))});
              reg10 <= (((wire4[(2'h2):(2'h2)] ?
                          ($signed(wire4) >>> $unsigned(wire3)) : wire5) ?
                      ($signed((wire0 == wire5)) ?
                          wire3[(4'h8):(2'h2)] : {(wire3 & (8'ha1))}) : $signed(wire6)) ?
                  ($unsigned(wire6) ?
                      {$unsigned($signed(wire4))} : (|wire3)) : wire6[(3'h4):(2'h2)]);
              reg11 <= $signed($unsigned((~|wire0[(4'hf):(4'hd)])));
              reg12 <= ((~$unsigned(wire1)) | ($unsigned((wire2 ?
                  wire6[(3'h7):(3'h4)] : reg7)) ^ {($unsigned(reg11) ?
                      reg10 : reg8[(4'hf):(3'h6)]),
                  ((~|reg10) ? $unsigned(wire0) : $unsigned(reg8))}));
            end
          else
            begin
              reg9 <= (~&(($signed(reg12[(2'h2):(1'h1)]) ^~ reg9) ?
                  {$unsigned((^~wire6)), reg8} : {wire4}));
            end
        end
      else
        begin
          reg9 <= wire4[(3'h6):(1'h0)];
          if ((^~(wire3 & ((wire4 ?
              reg11 : (wire3 ? reg7 : reg9)) - $signed(wire3[(4'hd):(4'hb)])))))
            begin
              reg10 <= $signed((($signed((reg7 ? reg8 : wire0)) >>> ((wire1 ?
                  reg12 : (8'hac)) == $signed(reg10))) ^ $signed($unsigned(((8'hbf) && reg12)))));
            end
          else
            begin
              reg10 <= (8'hac);
              reg11 <= wire5[(3'h7):(1'h0)];
              reg12 <= reg11[(1'h0):(1'h0)];
              reg13 <= wire5;
              reg14 <= $unsigned($signed(($signed((^~wire2)) ?
                  (reg7 && (-wire4)) : ((8'hbc) >> (+reg9)))));
            end
        end
      reg15 <= (($unsigned(reg7) != {wire5,
              ($signed(reg10) ? $signed(wire1) : (wire5 >>> reg9))}) ?
          reg7 : reg12[(1'h1):(1'h0)]);
      reg16 <= $signed(reg15);
    end
  always
    @(posedge clk) begin
      reg17 <= $unsigned($unsigned(reg10));
      if ($unsigned(($unsigned((|$signed(reg17))) ^~ reg7[(4'h9):(3'h4)])))
        begin
          reg18 <= (((|$signed((^wire6))) < (~^(~^(~^reg13)))) ^ $signed(((~$unsigned(reg7)) ?
              (7'h43) : (7'h44))));
          if ((($unsigned({{reg17,
                      reg15}}) ~^ $signed(($unsigned(reg15) >> {reg14,
                  wire2}))) ?
              (($signed(wire6) || (8'ha5)) ^~ reg9) : (8'ha6)))
            begin
              reg19 <= (reg9[(4'hf):(3'h4)] ?
                  (reg7 ?
                      (|reg18) : reg11) : $signed(((~|$unsigned(wire5)) <= reg15)));
            end
          else
            begin
              reg19 <= (reg15[(2'h2):(2'h2)] ?
                  ((&(reg12 > wire5)) ?
                      (reg9[(5'h10):(4'he)] + {(!reg11),
                          wire6}) : $unsigned($unsigned(reg7[(4'hc):(3'h5)]))) : wire2);
              reg20 <= $signed(wire6[(4'h8):(3'h7)]);
              reg21 <= reg14;
            end
        end
      else
        begin
          reg18 <= ((7'h41) ?
              ($unsigned($unsigned($unsigned(wire5))) | $signed($unsigned(reg11))) : $signed({(!(reg16 ?
                      reg11 : reg16))}));
          reg19 <= (~^wire0);
          reg20 <= (8'hb7);
        end
      reg22 <= {reg16};
      reg23 <= $signed(((((reg17 ? (8'hb4) : reg18) ?
              (~&reg18) : (wire0 ? reg16 : reg17)) >> reg13[(4'ha):(3'h6)]) ?
          $unsigned(reg12) : {(7'h40)}));
      reg24 <= (~((~&(reg19 ? {reg14, reg17} : {wire1})) ?
          reg23[(1'h1):(1'h1)] : ({{wire6},
              ((8'had) ? wire4 : wire3)} ^ (reg7 >> (8'hbc)))));
    end
  assign wire25 = (!$unsigned($unsigned((~|((8'hb5) <<< wire1)))));
  assign wire26 = $unsigned(wire1[(3'h6):(2'h2)]);
  assign wire27 = ($unsigned($unsigned(reg9[(4'hd):(4'hc)])) && (reg18 ?
                      reg17[(1'h0):(1'h0)] : wire3[(4'hb):(3'h4)]));
  always
    @(posedge clk) begin
      reg28 <= $unsigned(reg18[(3'h4):(2'h3)]);
      reg29 <= $unsigned($signed((~^reg21[(3'h4):(2'h2)])));
      reg30 <= reg28;
      reg31 <= $signed(((((wire25 >> wire26) ? (reg18 <= wire4) : (+wire6)) ?
              $unsigned(reg24[(2'h2):(1'h0)]) : (~^(wire3 ? reg20 : reg20))) ?
          $unsigned($signed(reg20[(3'h4):(1'h1)])) : ({$unsigned(reg24)} ?
              (8'hae) : {(8'hbf)})));
      reg32 <= wire26[(1'h1):(1'h0)];
    end
  assign wire33 = (reg29 ?
                      (($signed($signed(reg8)) && (~&wire6)) ?
                          (8'hb5) : wire3) : {{((reg11 ? wire6 : reg9) ?
                                  (wire26 ?
                                      (8'hb5) : reg8) : $signed(reg22))}});
  assign wire34 = {(reg31 ?
                          $unsigned((^(reg11 << wire33))) : reg32[(1'h0):(1'h0)]),
                      (-($unsigned($signed((8'h9c))) ?
                          ((reg10 ?
                              reg23 : wire27) <= (8'ha5)) : ($signed(reg13) ?
                              $signed(reg8) : $signed(reg31))))};
  assign wire35 = (~&(reg12[(1'h1):(1'h1)] ~^ $unsigned((~&reg13))));
  assign wire36 = reg13;
  assign wire37 = wire5[(4'hb):(1'h1)];
  assign wire38 = $unsigned((|(+{$signed(reg31), (reg14 ? reg30 : reg29)})));
  assign wire39 = $signed(wire34[(5'h15):(4'h8)]);
  assign wire40 = (~|reg12[(4'hb):(2'h2)]);
  assign wire41 = ((((^~(reg24 <= wire33)) ?
                      $signed((~&wire39)) : $unsigned((reg29 ?
                          reg22 : reg7))) * reg31) >= (~(~^wire5[(4'h8):(3'h6)])));
  always
    @(posedge clk) begin
      reg42 <= reg21[(4'he):(4'hc)];
      reg43 <= (8'hbd);
    end
  assign wire44 = {(wire36[(3'h6):(3'h5)] >>> wire25), wire0};
endmodule
