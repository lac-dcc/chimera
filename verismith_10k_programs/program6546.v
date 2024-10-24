module top
#(parameter param52 = ((((((8'hb1) ? (8'h9d) : (8'hb7)) > ((7'h43) ^~ (8'hac))) ? {((8'hb6) <<< (8'hae))} : (-((8'hb9) ? (8'hb2) : (8'ha5)))) ? ((((8'hba) ? (8'hac) : (8'h9e)) ? (^~(8'hbe)) : ((8'ha1) < (7'h44))) >= ({(8'hba), (8'ha8)} < ((7'h40) ^ (8'hac)))) : ((!(~|(8'hbe))) > ((~|(8'h9c)) * ((8'hbe) >= (8'ha0))))) != {(+((|(8'hb0)) | ((8'ha0) ? (8'had) : (8'had))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire44;
  assign y = {wire51, wire50, wire49, wire48, wire47, wire46, wire44, (1'h0)};
  module5 #() modinst45 (wire44, clk, wire2, wire4, wire3, wire1);
  assign wire46 = $unsigned($signed((({wire4, wire44} ?
                          wire0 : $signed(wire4)) ?
                      $unsigned($unsigned(wire44)) : (~|wire1[(1'h0):(1'h0)]))));
  assign wire47 = wire4;
  assign wire48 = (8'hbb);
  assign wire49 = wire3[(5'h11):(2'h2)];
  assign wire50 = wire0;
  assign wire51 = $signed($signed($unsigned($signed(wire2))));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((^~($signed(wire8[(3'h4):(2'h3)]) ?
          (~wire8) : $unsigned(($unsigned(wire8) ?
              (wire8 ? wire7 : wire9) : (wire9 ? wire7 : (8'had)))))))
        begin
          reg10 <= wire7[(4'hc):(1'h1)];
          reg11 <= ((($unsigned({reg10}) >> (wire9[(2'h3):(2'h3)] >> {(8'ha9),
                      wire6})) ?
                  $signed($unsigned((reg10 - (7'h40)))) : (^~wire7[(2'h3):(1'h0)])) ?
              (wire8 ?
                  $signed($unsigned(wire9)) : $unsigned(($signed(wire8) ?
                      wire8 : $signed((8'ha9))))) : ($signed(wire6) ?
                  $unsigned(wire9) : (|(8'ha2))));
          reg12 <= $unsigned((({(wire9 >> (8'h9c))} | reg11) <= wire8));
          if ((-(wire9[(2'h2):(2'h2)] ?
              $unsigned(({wire9} ? reg10[(4'h9):(2'h2)] : {wire8})) : wire8)))
            begin
              reg13 <= wire9[(1'h1):(1'h0)];
            end
          else
            begin
              reg13 <= (reg12[(2'h3):(2'h2)] >>> {($signed(reg12) != (^~$unsigned(wire7))),
                  {reg12, $unsigned($unsigned(wire9))}});
              reg14 <= (($unsigned($unsigned($signed(reg10))) ?
                  $signed(((wire9 * reg10) >>> reg12[(1'h1):(1'h0)])) : reg13[(3'h5):(3'h5)]) + wire9[(2'h3):(1'h1)]);
            end
          reg15 <= $signed(reg11[(3'h7):(3'h5)]);
        end
      else
        begin
          if ((~^wire6))
            begin
              reg10 <= $unsigned((-wire9[(1'h0):(1'h0)]));
              reg11 <= $signed(reg13[(4'hb):(2'h2)]);
              reg12 <= ($unsigned((8'ha8)) ?
                  (^wire6[(4'h9):(1'h1)]) : $unsigned((reg11[(4'h8):(4'h8)] ?
                      reg12 : ({reg14} || wire6))));
              reg13 <= (+reg15[(3'h5):(2'h3)]);
              reg14 <= reg11[(4'hd):(3'h7)];
            end
          else
            begin
              reg10 <= ((7'h42) && ((reg10[(4'hd):(4'hb)] ?
                      ($signed(reg14) ?
                          $unsigned(reg11) : {reg10}) : $signed((~^reg13))) ?
                  wire8 : (reg12[(2'h3):(1'h1)] ?
                      reg14[(4'ha):(1'h1)] : $unsigned(wire8[(4'he):(3'h5)]))));
              reg11 <= (reg10 ?
                  $unsigned((-(reg14[(4'h9):(3'h4)] != $signed(wire9)))) : $unsigned($unsigned(wire8[(2'h3):(1'h0)])));
              reg12 <= ((((+((8'hb4) ? (8'ha4) : wire8)) | ((wire9 ?
                      reg15 : reg11) - $unsigned(reg12))) != $unsigned((^~(reg15 > reg11)))) ?
                  $signed((8'ha8)) : wire9[(1'h0):(1'h0)]);
              reg13 <= (reg12 ?
                  $signed(wire9[(2'h2):(1'h1)]) : (^~(~&reg11[(4'h8):(3'h6)])));
              reg14 <= {(|$signed(wire6)), reg12[(1'h1):(1'h1)]};
            end
          reg15 <= (|($unsigned(reg13[(3'h5):(3'h5)]) ?
              (((~&reg15) * {(8'hae), reg11}) & (reg14[(3'h5):(2'h3)] ?
                  (wire8 ? reg13 : reg15) : {wire7,
                      reg11})) : reg15[(1'h0):(1'h0)]));
          if (reg13)
            begin
              reg16 <= reg10;
              reg17 <= (wire9[(1'h0):(1'h0)] ?
                  wire9 : $unsigned((reg14[(3'h6):(3'h5)] ?
                      reg16 : $unsigned((reg11 ? reg10 : reg15)))));
              reg18 <= wire9[(1'h0):(1'h0)];
              reg19 <= reg13;
            end
          else
            begin
              reg16 <= reg15[(3'h5):(3'h5)];
              reg17 <= {$unsigned(reg10),
                  $signed((($signed(wire8) | reg18) + reg11))};
            end
          reg20 <= reg18;
        end
      reg21 <= {((~|{$signed((8'hb8)), {(8'ha9)}}) != reg15[(1'h1):(1'h1)]),
          $signed(reg10[(3'h7):(1'h1)])};
      reg22 <= (($signed((reg21 ?
          wire7[(5'h13):(4'h8)] : (+wire7))) < (|{$signed((8'hba)),
          (^~reg19)})) || ($signed(((wire8 || reg15) ?
              $signed((8'h9d)) : (8'h9d))) ?
          {$signed((wire7 ^~ reg20)),
              reg12} : $unsigned(reg13[(3'h5):(1'h0)])));
    end
  assign wire23 = (|$signed(($unsigned(((8'hac) ? wire6 : (8'hb9))) ?
                      $signed((reg16 <= reg20)) : {reg15[(3'h6):(2'h3)]})));
  assign wire24 = reg15[(1'h0):(1'h0)];
  assign wire25 = $unsigned({((^~(|reg18)) * ((!(8'haa)) ?
                          (reg17 - (8'haa)) : $unsigned((8'hb2))))});
  assign wire26 = $unsigned($signed((+(~^{reg17}))));
  always
    @(posedge clk) begin
      reg27 <= $signed((~reg14));
      if ((8'hbb))
        begin
          reg28 <= reg13[(2'h3):(1'h0)];
          reg29 <= $signed($signed(($signed($signed((8'hb3))) * $unsigned((wire7 ?
              (7'h43) : (8'hbe))))));
          if ($signed(wire6))
            begin
              reg30 <= reg17[(4'h9):(3'h5)];
              reg31 <= ((reg15[(3'h4):(2'h2)] ?
                      (~&((wire24 ~^ wire7) > wire8[(3'h7):(3'h6)])) : ({$unsigned(reg11)} ?
                          $unsigned((~&reg19)) : reg22[(4'h8):(3'h4)])) ?
                  {(($unsigned(reg16) ?
                          (~^wire23) : {reg19}) + reg28)} : wire23);
              reg32 <= reg11;
            end
          else
            begin
              reg30 <= reg18[(4'he):(1'h0)];
              reg31 <= ({$unsigned(reg11)} - (|(reg13[(4'h8):(1'h1)] ?
                  $signed(((7'h43) ~^ reg10)) : $unsigned(reg13))));
              reg32 <= (reg14[(4'ha):(3'h6)] < $unsigned((reg19 ^~ ($unsigned(reg32) << reg17))));
              reg33 <= (~&reg20);
              reg34 <= {{($signed(reg10) > {$unsigned(wire26),
                          $unsigned(reg30)}),
                      wire6}};
            end
        end
      else
        begin
          reg28 <= reg22;
        end
    end
  assign wire35 = (!{{$unsigned($signed(reg29))}});
  assign wire36 = (((~^$unsigned((wire7 ? reg34 : reg28))) ?
                      $signed({$signed(reg28),
                          (wire25 == (7'h41))}) : wire8) <= $unsigned($signed(((~^reg27) ?
                      $unsigned(reg28) : (|(7'h40))))));
  assign wire37 = reg13;
  assign wire38 = wire6;
  assign wire39 = {(|(!$unsigned((reg22 ? reg33 : reg12))))};
  assign wire40 = (~^(^reg34));
  assign wire41 = (reg32 ^ wire39);
  assign wire42 = $unsigned($signed($unsigned($signed(((8'hbf) ?
                      reg13 : reg16)))));
  assign wire43 = $signed(reg27);
endmodule
