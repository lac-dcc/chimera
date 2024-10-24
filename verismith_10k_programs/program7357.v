module top
#(parameter param47 = {(|(+{((8'hb7) < (8'hbb))}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h202):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg37,
                 reg36,
                 reg35,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = ((wire0 && (~|wire0)) >>> $signed(wire3[(3'h6):(3'h4)]));
  assign wire5 = wire4;
  assign wire6 = (^wire4[(2'h3):(2'h2)]);
  assign wire7 = ($signed({({wire0} || (wire6 ? wire6 : wire3))}) ?
                     (({wire5, wire2} ?
                         wire4 : wire4[(3'h4):(2'h2)]) ~^ wire3[(2'h3):(1'h1)]) : $signed({((wire2 ?
                             wire6 : wire4) | {wire0, wire3})}));
  assign wire8 = ((+wire7[(2'h3):(1'h0)]) * $signed(wire2));
  assign wire9 = (wire7 ^~ ((8'hbc) ? (+(~&{(7'h41)})) : (^~$unsigned(wire8))));
  assign wire10 = $signed((~|wire0));
  always
    @(posedge clk) begin
      reg11 <= ((~wire2) ?
          ((wire5 ?
              $signed($signed(wire8)) : (~&(wire2 ^ (8'ha1)))) + wire6) : {((-wire5) & ($signed(wire2) ?
                  (+wire5) : wire1[(3'h4):(1'h0)])),
              (-((wire2 == wire8) <= (~wire4)))});
      if ((~&(8'hb8)))
        begin
          reg12 <= wire6[(4'ha):(1'h0)];
          reg13 <= wire9[(1'h1):(1'h0)];
          reg14 <= ($signed(reg13[(1'h0):(1'h0)]) - $unsigned($signed($unsigned(wire8[(4'ha):(4'h9)]))));
          reg15 <= ($unsigned($unsigned((wire0[(4'h8):(3'h4)] && wire3[(4'h9):(3'h7)]))) ?
              $signed((-wire8)) : $unsigned({(~^$unsigned((8'ha4))),
                  (reg14 ? wire6 : $unsigned(wire0))}));
        end
      else
        begin
          reg12 <= ($signed((wire7[(4'h9):(3'h7)] ?
                  (~^(wire1 ? reg13 : wire8)) : (((8'hb4) < wire8) ?
                      wire1 : wire2[(1'h0):(1'h0)]))) ?
              ($signed(wire3) ^~ wire0) : ((^~$signed(wire1[(3'h5):(2'h3)])) ?
                  (-$unsigned((8'ha1))) : ((wire9 ?
                      (wire8 < wire10) : {reg12, wire6}) != $signed((wire2 ?
                      reg15 : wire9)))));
        end
      reg16 <= wire10;
      reg17 <= wire5;
      reg18 <= wire2;
    end
  assign wire19 = reg17[(2'h2):(2'h2)];
  assign wire20 = (^reg13[(3'h7):(3'h4)]);
  assign wire21 = $unsigned(((reg13[(1'h1):(1'h1)] ?
                      $unsigned((8'hae)) : $signed({wire10,
                          wire20})) + $unsigned($signed({wire1}))));
  assign wire22 = $unsigned(wire7[(2'h3):(2'h2)]);
  assign wire23 = $unsigned($unsigned((reg16 <<< ({(8'ha1),
                      wire20} >> reg14[(1'h0):(1'h0)]))));
  assign wire24 = (wire9[(2'h2):(2'h2)] & {$unsigned(wire3[(4'h9):(3'h4)])});
  always
    @(posedge clk) begin
      reg25 <= {(($signed(wire0) ~^ {wire9[(1'h1):(1'h0)]}) != ($signed($unsigned(wire19)) ?
              {wire6[(4'hc):(3'h5)]} : reg11))};
      if ($signed((~^wire22)))
        begin
          if ($signed($unsigned($signed({wire2[(2'h2):(1'h1)]}))))
            begin
              reg26 <= wire22[(4'ha):(2'h2)];
              reg27 <= {wire8,
                  (wire23 ?
                      $signed({reg12[(3'h7):(1'h0)], (!wire8)}) : (8'hb4))};
              reg28 <= reg12[(1'h0):(1'h0)];
            end
          else
            begin
              reg26 <= $unsigned({(wire23[(3'h4):(2'h3)] ^~ $signed((^~reg18))),
                  (reg15[(1'h0):(1'h0)] ?
                      $signed((8'h9e)) : ((wire19 ? wire6 : reg14) ?
                          (wire2 ? reg15 : reg18) : $unsigned(reg16)))});
            end
        end
      else
        begin
          reg26 <= $signed((wire24 ?
              reg14 : (wire10[(3'h5):(1'h0)] ?
                  {$unsigned(wire22), reg25[(2'h2):(1'h1)]} : wire20)));
        end
      reg29 <= reg14;
      reg30 <= $signed(reg25[(2'h3):(2'h2)]);
      if (wire4[(1'h0):(1'h0)])
        begin
          reg31 <= reg28;
          reg32 <= $unsigned(($unsigned($signed({reg29, wire9})) ?
              wire6[(4'hf):(4'hc)] : ((~$unsigned(reg31)) ?
                  wire1[(2'h3):(1'h1)] : $unsigned((reg26 ?
                      reg27 : (8'ha9))))));
          reg33 <= (((~^wire21) ?
                  (({(8'h9e), wire1} ? (reg12 ? (8'hae) : (8'hb2)) : reg17) ?
                      {((8'ha1) ? wire4 : wire2)} : {wire21,
                          (~&wire22)}) : (~&((-wire3) ? reg29 : {reg25}))) ?
              (~(~^$signed((~&(8'hbd))))) : (-(~&((~&(8'haa)) <<< $signed(wire22)))));
          if (wire0[(2'h2):(2'h2)])
            begin
              reg34 <= (&reg14);
              reg35 <= (^(7'h41));
              reg36 <= ($unsigned($signed(($signed(reg16) != wire23[(1'h1):(1'h0)]))) ?
                  reg11 : reg17[(3'h5):(3'h4)]);
            end
          else
            begin
              reg34 <= $signed(($signed((-$signed(reg27))) ?
                  $unsigned({{reg13, wire8}, ((8'hb9) >= reg32)}) : (^~reg33)));
              reg35 <= $unsigned(((reg11 ?
                      ((^~reg36) ? {wire19, reg30} : {reg32}) : {(7'h40),
                          $signed(wire1)}) ?
                  reg26[(1'h1):(1'h1)] : reg27));
              reg36 <= ((8'hb0) ?
                  $signed($signed($signed({(8'hba), wire23}))) : wire19);
              reg37 <= (8'hb9);
            end
        end
      else
        begin
          reg31 <= (!wire22);
          reg32 <= ((-({wire19} ? (+{wire23, reg12}) : (!$signed(reg37)))) ?
              (reg12 >>> ($signed(wire6) ?
                  (wire21[(4'h8):(1'h1)] ?
                      wire23 : (^~wire1)) : $unsigned((reg15 ?
                      reg29 : reg33)))) : reg27);
        end
    end
  assign wire38 = (((|$unsigned((wire5 - reg12))) == ((reg26 ^ $unsigned((8'ha8))) ?
                      reg15[(5'h11):(4'h9)] : wire8[(4'he):(4'h8)])) <= $unsigned($unsigned(reg29)));
  assign wire39 = (wire0 ?
                      (|(~|(!(wire3 ?
                          wire24 : reg14)))) : $unsigned(reg33[(2'h2):(1'h1)]));
  assign wire40 = wire39;
  assign wire41 = reg33[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg42 <= $signed($signed($unsigned($signed($unsigned(wire0)))));
      reg43 <= wire19;
      reg44 <= $unsigned(reg34);
      reg45 <= wire22;
      reg46 <= wire6[(2'h3):(2'h2)];
    end
endmodule
