module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = {(&(((wire3 ? wire1 : wire2) ?
                             $signed(wire3) : $signed(wire3)) ?
                         {wire3} : (^~wire1[(4'ha):(4'ha)]))),
                     ((wire0[(2'h3):(1'h1)] ?
                         (wire0[(3'h6):(3'h4)] ?
                             wire0[(4'ha):(1'h1)] : $unsigned(wire2)) : (8'h9c)) <= ($signed($unsigned(wire2)) ?
                         (|wire3) : wire0))};
  assign wire5 = (-wire2);
  assign wire6 = wire3[(5'h12):(4'hc)];
  assign wire7 = $unsigned($signed(($signed(wire6) != ($signed(wire1) <<< $unsigned((8'hb8))))));
  assign wire8 = (wire1 >> $signed((wire6 == (^(wire2 ^ wire3)))));
  assign wire9 = wire6;
  assign wire10 = {$unsigned((wire0[(4'ha):(4'h9)] ?
                          $signed(wire2) : $unsigned(wire7[(5'h14):(5'h12)])))};
  assign wire11 = wire9[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      reg12 <= wire7;
      if (($signed($signed($unsigned(wire1))) ?
          (reg12[(4'he):(4'hb)] < $signed((|(~&wire9)))) : wire3[(5'h13):(2'h2)]))
        begin
          reg13 <= (^~$unsigned($signed((+(~^wire10)))));
          reg14 <= $unsigned((^~$unsigned($signed($unsigned(wire5)))));
          reg15 <= {(((^~$signed((8'h9c))) ?
                  (8'ha1) : wire7) ~^ $signed(reg13[(1'h0):(1'h0)]))};
        end
      else
        begin
          reg13 <= ($unsigned(((((8'had) == reg12) ?
              {(8'hb4), reg14} : $unsigned(wire7)) ^ $signed((wire6 ?
              reg14 : wire7)))) == $signed($signed((wire5[(2'h3):(1'h1)] < $unsigned((8'hac))))));
          if ((!$unsigned((&(~(7'h43))))))
            begin
              reg14 <= $unsigned(wire0);
              reg15 <= ({(reg12 ?
                          ((wire0 ? reg13 : wire8) ?
                              wire3 : (wire10 ? reg14 : reg14)) : wire2),
                      ($unsigned({(8'ha2)}) ?
                          (~&$unsigned(wire6)) : ((~|wire5) & $signed(reg12)))} ?
                  (8'hb5) : $signed($signed((8'haf))));
            end
          else
            begin
              reg14 <= wire2;
              reg15 <= (^~{(reg13 ?
                      ((&wire5) | $unsigned(reg15)) : $signed(wire4[(4'ha):(2'h3)]))});
            end
          if ($unsigned(($unsigned(((wire3 & reg15) ?
              reg15[(4'hb):(2'h2)] : $unsigned(reg15))) >>> reg13[(3'h5):(1'h0)])))
            begin
              reg16 <= {(~(!(~$signed(wire4)))),
                  (($signed((8'hb1)) + ($unsigned(wire7) * $unsigned((8'h9e)))) ?
                      ($signed((8'ha6)) >> (8'hb1)) : (!$unsigned((reg15 ?
                          reg13 : (8'hb5)))))};
              reg17 <= $signed($unsigned($signed({(^wire10),
                  (reg16 ? wire11 : wire3)})));
              reg18 <= $signed($unsigned((~reg14[(4'hc):(1'h0)])));
            end
          else
            begin
              reg16 <= wire4[(4'h8):(3'h4)];
              reg17 <= ((~|reg16[(4'h8):(1'h1)]) <<< {$unsigned({$signed(wire0)}),
                  (~&wire9[(3'h7):(1'h0)])});
            end
        end
    end
  assign wire19 = (+wire7[(2'h3):(2'h3)]);
  assign wire20 = wire10[(1'h0):(1'h0)];
  assign wire21 = $unsigned(wire8);
endmodule
