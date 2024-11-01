module top
#(parameter param38 = (&(((^((8'hb4) ? (8'had) : (7'h40))) <= (-(&(8'ha1)))) ? (!(|(~&(8'ha0)))) : ((((8'hbf) ? (8'hb6) : (7'h40)) ? ((8'ha0) ^ (8'h9d)) : ((8'had) ? (8'hb7) : (8'ha6))) ? (~&(^~(8'ha7))) : ({(8'hb0)} ? ((8'ha8) ? (8'ha8) : (8'ha3)) : ((8'hbd) > (8'hb7)))))), 
parameter param39 = {param38, (~|((&(&param38)) >>> ({param38} && ((8'hb7) ? param38 : param38))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire14,
                 wire4,
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
                 reg16,
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
  assign wire4 = {$signed(wire1[(2'h2):(1'h0)])};
  always
    @(posedge clk) begin
      reg5 <= (-wire4);
      reg6 <= (($unsigned($unsigned($unsigned(reg5))) ?
          (^~(wire2[(2'h2):(2'h2)] + {wire4})) : (wire2 == wire2)) & $signed($unsigned($signed(reg5))));
      reg7 <= ($signed($signed((^$unsigned(reg5)))) >> $unsigned((&{(reg5 - wire3),
          $unsigned(reg5)})));
      reg8 <= $signed((($unsigned({(8'ha3)}) <= reg5) ^ $unsigned(reg6[(3'h7):(3'h5)])));
      if ((^~$signed(wire2[(4'hb):(2'h2)])))
        begin
          if ($signed((8'ha7)))
            begin
              reg9 <= (~^(|($unsigned($unsigned(reg8)) ?
                  (-(wire4 ? wire3 : wire2)) : ((-wire2) ?
                      $signed(wire2) : (wire1 > wire0)))));
              reg10 <= $signed($unsigned((wire0[(3'h6):(1'h0)] >= reg9)));
              reg11 <= wire0;
            end
          else
            begin
              reg9 <= $unsigned(wire1[(2'h3):(1'h1)]);
              reg10 <= wire3[(4'hb):(3'h7)];
              reg11 <= wire3[(4'h8):(1'h1)];
            end
        end
      else
        begin
          reg9 <= $signed((+reg7[(3'h5):(2'h3)]));
          reg10 <= $signed((reg6 <<< (((~wire4) | (+reg9)) ?
              (wire3[(5'h14):(5'h11)] * (reg6 ^~ reg6)) : (wire3[(4'h9):(4'h8)] >>> {wire4,
                  reg8}))));
          reg11 <= $signed($signed((~&$signed(wire4))));
          reg12 <= reg8[(4'h8):(2'h2)];
          reg13 <= ((((~^(reg5 << reg9)) | {$unsigned(wire1),
                  reg12}) <= (((reg7 ? reg7 : wire1) ?
                  (~wire0) : $signed(reg11)) * (reg7 < $unsigned(wire3)))) ?
              $signed(({(reg12 ? reg12 : wire0), $unsigned((8'ha2))} ?
                  (8'ha0) : (-(~|(8'ha3))))) : wire0[(2'h3):(2'h3)]);
        end
    end
  assign wire14 = $signed($unsigned(reg10[(3'h5):(1'h0)]));
  assign wire15 = $unsigned((~(8'hb9)));
  always
    @(posedge clk) begin
      reg16 <= $unsigned($unsigned(wire14));
    end
  assign wire17 = ($unsigned($signed((reg10 | (^~reg16)))) >= reg12[(1'h1):(1'h1)]);
  assign wire18 = $unsigned({{(-((8'hba) ^~ wire15)),
                          (reg8[(3'h5):(3'h5)] ? $unsigned(reg6) : (~|reg6))},
                      {reg5}});
  assign wire19 = (&reg13);
  assign wire20 = reg8[(4'hf):(4'hb)];
  always
    @(posedge clk) begin
      reg21 <= (($signed(reg13) ?
          (+($unsigned(reg12) == $unsigned(reg11))) : reg11) != reg6[(4'h8):(2'h2)]);
      reg22 <= wire19;
      if (reg12[(2'h3):(1'h1)])
        begin
          if (wire15[(4'he):(4'hc)])
            begin
              reg23 <= wire0[(3'h5):(3'h5)];
              reg24 <= $unsigned((8'hac));
              reg25 <= reg21[(5'h10):(4'he)];
              reg26 <= $signed(wire3[(4'h9):(3'h4)]);
            end
          else
            begin
              reg23 <= ((reg25 == ($signed($signed(wire20)) - wire18)) ?
                  $unsigned((((reg12 ? reg23 : reg22) ? reg13 : wire15) ?
                      {{wire1}} : ((reg26 < reg25) * $signed(reg8)))) : ($unsigned($signed(((8'ha0) ?
                          reg11 : reg23))) ?
                      ($signed((wire2 >>> reg7)) ?
                          {wire20} : (~|(!reg26))) : $signed((+$signed(wire3)))));
              reg24 <= reg6[(1'h0):(1'h0)];
              reg25 <= wire0[(3'h5):(2'h3)];
              reg26 <= {$unsigned(wire14)};
            end
          reg27 <= wire0[(3'h4):(3'h4)];
          reg28 <= (!reg5[(2'h3):(2'h2)]);
        end
      else
        begin
          reg23 <= ((reg26[(3'h5):(2'h3)] ?
                  $unsigned($unsigned($signed(reg25))) : (wire2 >> reg27)) ?
              reg9 : $signed(wire14[(4'hf):(4'hb)]));
          reg24 <= $signed(reg12[(1'h1):(1'h0)]);
        end
      if (reg8)
        begin
          reg29 <= (~|(^$unsigned(((^reg23) ?
              ((7'h44) ? (8'ha5) : wire17) : (reg16 + reg24)))));
          if ((reg24[(4'hd):(4'hc)] ?
              wire14 : ((reg9 ?
                  ((!reg27) ?
                      wire4[(2'h2):(2'h2)] : ((7'h41) ?
                          reg27 : wire18)) : ($unsigned(wire0) ?
                      {(8'hb9), wire20} : reg16)) >= (({reg9,
                      reg29} * (&(8'h9f))) ?
                  reg13[(3'h5):(1'h0)] : $unsigned($signed((7'h43)))))))
            begin
              reg30 <= {reg6[(2'h2):(2'h2)]};
              reg31 <= reg26[(3'h7):(3'h5)];
              reg32 <= wire1;
              reg33 <= reg29;
              reg34 <= (^({(8'hb5)} ?
                  {(wire1 & {wire20}),
                      ($signed(reg16) ?
                          (8'hae) : (reg22 ? reg13 : reg32))} : (&reg23)));
            end
          else
            begin
              reg30 <= $unsigned(reg11[(3'h4):(2'h3)]);
              reg31 <= {({$unsigned((reg21 >= reg5)),
                      $signed({reg33})} >>> $signed({(!(7'h43))}))};
            end
        end
      else
        begin
          reg29 <= (~^reg31[(3'h4):(2'h2)]);
        end
    end
  assign wire35 = ((|{wire20[(3'h7):(3'h6)], ((reg30 ^~ reg25) * (~&reg26))}) ?
                      reg27 : reg16);
  assign wire36 = $unsigned($unsigned(wire1[(1'h1):(1'h1)]));
  assign wire37 = (8'ha5);
endmodule
