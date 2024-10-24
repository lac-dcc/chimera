module top
#(parameter param57 = ({(^(8'h9f))} - (((~&((7'h40) ? (7'h42) : (8'ha5))) <= {((8'hb2) * (8'had)), (~(8'ha7))}) ? ({((8'hb5) >> (8'hb5)), (-(8'hac))} & (((8'ha5) ? (7'h40) : (8'hb1)) ? ((8'hb4) ^ (7'h42)) : (&(8'h9e)))) : (~^({(8'ha8), (8'ha0)} >>> (^(7'h40)))))), 
parameter param58 = (~param57))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h179):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire25,
                 wire4,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire4 = $signed(wire3[(4'hc):(1'h0)]);
  module5 #() modinst26 (.wire9(wire4), .y(wire25), .clk(clk), .wire8(wire0), .wire6(wire3), .wire7(wire2));
  always
    @(posedge clk) begin
      reg27 <= (+{(wire1[(1'h1):(1'h1)] >> $signed($unsigned(wire4)))});
      reg28 <= {(|(!wire3[(1'h0):(1'h0)]))};
      reg29 <= (!wire1[(4'hc):(1'h0)]);
    end
  assign wire30 = $signed((~^wire3[(4'hc):(4'hb)]));
  assign wire31 = (!$unsigned(reg29));
  assign wire32 = reg28;
  assign wire33 = wire1[(3'h6):(3'h5)];
  assign wire34 = wire3;
  assign wire35 = ((8'hb8) ?
                      $signed(wire30[(2'h3):(1'h1)]) : {wire34[(5'h10):(3'h6)],
                          ({$unsigned(wire31), $signed((8'h9e))} >>> {wire2})});
  assign wire36 = (~^reg27[(1'h0):(1'h0)]);
  assign wire37 = (wire32[(3'h4):(2'h2)] ? (^(8'hb6)) : wire32[(1'h1):(1'h1)]);
  assign wire38 = $signed(((-((^~wire0) << (8'hb8))) || $unsigned((&wire33))));
  assign wire39 = $unsigned($unsigned(wire1[(2'h3):(2'h3)]));
  assign wire40 = $unsigned(wire38);
  assign wire41 = reg29;
  assign wire42 = {wire35};
  assign wire43 = (~&wire3);
  assign wire44 = ((wire25 ?
                      $unsigned($unsigned((wire35 ~^ wire0))) : $signed($unsigned((wire0 > wire4)))) * $signed($signed($signed(wire38))));
  assign wire45 = {($unsigned((~|{reg29, reg29})) ?
                          ({(~^wire30),
                              $signed(wire33)} * wire43[(3'h4):(2'h3)]) : ((wire37 ?
                              (reg29 ? reg27 : wire34) : (wire33 ?
                                  wire4 : wire44)) != reg29)),
                      wire41[(3'h5):(2'h2)]};
  always
    @(posedge clk) begin
      reg46 <= wire40;
      if (wire32[(2'h3):(2'h2)])
        begin
          reg47 <= (~^wire0[(3'h4):(3'h4)]);
          reg48 <= $signed({$signed($signed(wire41[(2'h2):(1'h0)])),
              {wire44[(1'h0):(1'h0)]}});
        end
      else
        begin
          if ($signed((wire32[(1'h1):(1'h1)] != {wire37})))
            begin
              reg47 <= ((&$unsigned($signed(reg47[(2'h2):(1'h0)]))) ^ ($signed(((reg48 ?
                          wire42 : wire39) ?
                      $unsigned((8'h9c)) : $unsigned(wire2))) ?
                  wire34[(3'h4):(2'h3)] : wire34));
            end
          else
            begin
              reg47 <= $unsigned(($signed(((|reg27) ?
                      (wire43 ? reg29 : reg48) : $signed(wire31))) ?
                  {wire42, $signed((!(8'hbb)))} : $unsigned((-wire3))));
              reg48 <= $signed(wire45[(4'h8):(3'h6)]);
            end
          if ($signed((wire43 | (wire43[(2'h3):(2'h3)] <= reg47[(1'h0):(1'h0)]))))
            begin
              reg49 <= $signed((+{(!(wire35 * wire0)),
                  (reg48[(4'h9):(3'h5)] ?
                      (reg27 ? wire32 : reg27) : (&reg29))}));
              reg50 <= $unsigned((reg46 - ($signed((wire41 ?
                  (8'hae) : wire33)) == (+wire4))));
              reg51 <= wire36[(4'hd):(1'h0)];
            end
          else
            begin
              reg49 <= ((reg47 ? $signed((7'h42)) : wire25) ?
                  {((wire0[(3'h7):(3'h7)] ?
                          $unsigned(reg28) : (~&wire30)) <= {(wire42 ?
                              reg48 : wire31),
                          (wire40 - reg49)})} : (($unsigned((wire36 <<< wire45)) * ((^~wire38) - $unsigned((8'hb3)))) ?
                      $signed((-{reg28})) : ({$unsigned(reg47),
                              $unsigned(reg29)} ?
                          wire4[(3'h5):(2'h2)] : (~^$unsigned(reg46)))));
              reg50 <= reg27;
              reg51 <= $unsigned(wire32[(2'h3):(2'h3)]);
            end
          reg52 <= {wire42[(4'h8):(3'h4)]};
          reg53 <= $unsigned(wire43);
          reg54 <= {(~|(-$unsigned((~&wire33)))), wire1[(1'h1):(1'h1)]};
        end
    end
  always
    @(posedge clk) begin
      reg55 <= ((8'ha0) ?
          ((reg54[(2'h3):(1'h1)] + $unsigned((&(8'hb6)))) ?
              reg51 : ((7'h42) - ($unsigned(reg54) <<< (wire39 <<< wire25)))) : (!($signed($unsigned(wire32)) != (reg48 + (~&wire1)))));
      reg56 <= $unsigned($signed((($signed(wire30) ?
              wire42[(4'h8):(3'h4)] : (&(7'h40))) ?
          (reg50[(4'ha):(3'h5)] ? $signed((8'ha4)) : wire34) : ($signed(wire3) ?
              (^wire3) : wire34[(4'hb):(2'h3)]))));
    end
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(2'h2):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  assign y = {wire24,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 (1'h0)};
  assign wire10 = $signed(($signed($signed((!wire9))) ?
                      {wire8[(2'h2):(1'h1)], (8'ha0)} : $signed(wire8)));
  assign wire11 = wire10;
  assign wire12 = $signed($unsigned(($unsigned((~^(8'ha9))) <<< $unsigned(wire8[(1'h1):(1'h1)]))));
  assign wire13 = ($signed(wire8) ?
                      (wire8 >> (&({wire10} ?
                          wire8[(1'h0):(1'h0)] : (~^wire10)))) : ((wire6 ?
                          {(-(8'hae)), (wire6 << (8'had))} : {((8'hba) ?
                                  (8'hae) : (7'h43)),
                              (|wire7)}) | ($unsigned(wire10) <<< ((wire9 || wire6) & {wire6,
                          wire11}))));
  always
    @(posedge clk) begin
      reg14 <= (!wire6[(5'h13):(5'h13)]);
      reg15 <= reg14;
      if (wire9)
        begin
          if ({$unsigned(({{reg15, wire7}, $unsigned(wire9)} ?
                  $signed(wire12[(4'hb):(2'h2)]) : ((wire11 ^~ (8'hbb)) | $signed(wire7))))})
            begin
              reg16 <= $unsigned((~^wire12));
              reg17 <= $signed((!$unsigned((~|(|wire11)))));
            end
          else
            begin
              reg16 <= ((^reg14[(2'h3):(2'h3)]) ?
                  {wire13, (!$signed($signed(wire10)))} : (~|((~{(7'h44),
                      (8'hb5)}) - (^(wire11 << (8'h9e))))));
            end
          reg18 <= wire9[(3'h7):(3'h7)];
          if (reg14[(2'h2):(1'h0)])
            begin
              reg19 <= (+$unsigned((+wire13)));
              reg20 <= (wire6 + wire11);
            end
          else
            begin
              reg19 <= reg16[(1'h1):(1'h0)];
              reg20 <= $signed((^~(wire8[(2'h2):(1'h1)] ?
                  ($unsigned(reg16) ?
                      (reg19 <= wire7) : (wire11 & wire13)) : ((reg18 >> wire7) ?
                      (reg19 ? wire7 : (8'hb3)) : reg19[(1'h1):(1'h1)]))));
              reg21 <= (~|({reg15[(4'hb):(2'h2)],
                  $signed((wire11 ?
                      wire7 : reg15))} >>> $signed(((8'hb8) <<< $signed(reg18)))));
              reg22 <= {(wire9 ^~ wire9[(3'h4):(2'h2)])};
            end
        end
      else
        begin
          reg16 <= ((wire9[(3'h4):(2'h2)] ?
              {(~^$unsigned((8'ha9)))} : $unsigned(reg19)) - (|$unsigned($signed((+(7'h43))))));
          reg17 <= $unsigned({((|(reg15 ? wire9 : reg22)) ?
                  $signed(wire9[(1'h1):(1'h1)]) : reg18)});
        end
      reg23 <= (^~(($unsigned($signed(reg14)) & (~^$unsigned(wire9))) ^ ($signed(reg20[(4'ha):(3'h5)]) ?
          ((reg19 & reg22) + reg18[(1'h1):(1'h1)]) : (reg14[(3'h5):(1'h0)] ?
              reg18 : (~reg15)))));
    end
  assign wire24 = reg21;
endmodule
