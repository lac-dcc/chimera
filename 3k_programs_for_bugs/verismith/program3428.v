module top
#(parameter param35 = (((^~(^~{(8'ha6)})) ? (~&{((8'ha7) == (8'had))}) : {((8'hb4) & ((8'hb6) ? (8'hba) : (7'h42))), (((8'hb2) != (8'ha2)) ? (~|(8'h9d)) : {(8'hb5), (8'ha8)})}) ? (((((8'hb9) ? (8'hba) : (8'hbf)) ? (8'hbd) : (~&(8'h9d))) >= (~&((8'hb8) ? (8'hb6) : (7'h43)))) ? ((((8'hb3) ? (8'h9d) : (8'hb4)) ^~ (+(8'h9c))) ? (~|(|(7'h42))) : ((-(8'hbb)) ? {(8'had), (8'had)} : (^(8'ha5)))) : ((!(!(8'h9e))) ? (8'hab) : (((7'h40) ? (8'ha7) : (8'ha1)) ? (|(8'h9e)) : ((7'h43) ? (8'ha2) : (8'haa))))) : (|((|(&(8'hbe))) ? (((8'ha9) < (8'haf)) ? (~(8'h9d)) : (~|(8'hb2))) : ((~(8'hb2)) <<< ((8'ha0) <<< (8'hbd)))))), 
parameter param36 = ((7'h41) - {{((^~param35) ? ((8'ha1) ? param35 : param35) : param35)}, (&param35)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  assign y = {wire34,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire6,
                 wire5,
                 wire4,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
  assign wire4 = wire1[(3'h5):(1'h0)];
  assign wire5 = (8'ha2);
  assign wire6 = $unsigned(wire1[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg7 <= ({(8'ha9), $unsigned($unsigned((wire3 ? wire4 : wire4)))} ?
          $signed((!$signed(wire6[(3'h4):(3'h4)]))) : ((((wire1 ?
                      (8'ha9) : (8'hbf)) ?
                  wire6 : (wire2 != wire3)) ^ ($signed(wire1) ?
                  (8'hb7) : {wire4})) ?
              (~$signed((wire3 | wire2))) : (($unsigned(wire6) >>> $unsigned(wire1)) ?
                  $signed($unsigned(wire2)) : wire1[(4'h9):(4'h8)])));
      reg8 <= ((~(~((!wire1) << $unsigned((8'hbd))))) ?
          (^~(^wire4)) : ((~&reg7) > (wire4[(2'h2):(2'h2)] ?
              (&(^~(8'hac))) : $unsigned({reg7, wire2}))));
      reg9 <= $signed((wire4 ?
          {$unsigned((|wire1)), reg7[(3'h6):(3'h4)]} : ((wire5[(3'h6):(1'h1)] ?
              ((8'hb0) ?
                  (8'hb0) : wire3) : $signed(wire6)) + wire3[(3'h4):(2'h3)])));
      reg10 <= $signed(({$unsigned(reg9),
          $signed($signed(wire6))} && reg9[(2'h2):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg11 <= ((^((reg7[(3'h7):(2'h2)] ~^ wire1) ?
              $unsigned($signed((8'hbd))) : $signed((~|wire0)))) ?
          (wire3 | wire1[(3'h5):(1'h0)]) : wire5);
      reg12 <= wire3[(2'h2):(1'h0)];
      if ((reg8[(1'h0):(1'h0)] ? wire3 : (!$signed((!$signed((8'hae)))))))
        begin
          reg13 <= wire2;
          if (wire5)
            begin
              reg14 <= reg10;
              reg15 <= $signed($signed(reg11[(4'hd):(4'h8)]));
              reg16 <= (wire2 ?
                  ((((+reg8) ? (wire6 >> wire5) : reg11) & ((reg10 ?
                              wire0 : (8'ha5)) ?
                          (~|wire1) : (wire1 ? reg8 : wire1))) ?
                      $signed($signed((~reg8))) : (+wire4[(3'h7):(1'h0)])) : (~{reg8}));
              reg17 <= reg9;
            end
          else
            begin
              reg14 <= wire4;
              reg15 <= (-(&wire4));
            end
          reg18 <= $unsigned($signed($signed(reg10)));
        end
      else
        begin
          reg13 <= reg15;
        end
      reg19 <= $unsigned({$signed((&{reg16, reg15}))});
    end
  assign wire20 = reg16;
  assign wire21 = reg11[(4'h8):(3'h4)];
  assign wire22 = {(wire0[(3'h4):(1'h0)] ?
                          (reg12[(2'h3):(1'h0)] ?
                              $signed((~^reg7)) : ($signed((7'h41)) ?
                                  $signed(reg13) : (reg13 != reg14))) : (&$unsigned((^reg18)))),
                      (~&(($unsigned(wire5) ? (~&reg15) : reg8) && ({reg16} ?
                          ((8'hba) ? wire6 : wire3) : {wire0, reg8})))};
  assign wire23 = $unsigned($unsigned(reg9));
  assign wire24 = (+(((~&reg10[(1'h0):(1'h0)]) < reg11[(4'hd):(4'hd)]) ?
                      ($unsigned(wire4[(2'h3):(1'h1)]) ?
                          $signed({reg7}) : $signed($signed(reg18))) : (~^$unsigned(wire4))));
  assign wire25 = wire3;
  assign wire26 = reg12;
  always
    @(posedge clk) begin
      reg27 <= (({wire20[(4'hc):(3'h7)]} & {((~reg7) >= (^wire2))}) ?
          reg12 : ((((8'haf) ? reg15 : (wire6 ? wire4 : reg9)) >= (8'h9f)) ?
              $unsigned({(wire26 || reg11)}) : {$unsigned({wire25})}));
      reg28 <= (reg18 ? $unsigned($unsigned(reg18)) : wire20);
      reg29 <= reg8;
      if ((((~$unsigned($unsigned(reg7))) <= wire25) != $signed(wire4)))
        begin
          reg30 <= reg19;
          reg31 <= reg17[(4'he):(4'h9)];
        end
      else
        begin
          reg30 <= {(|{(~(reg10 ? reg11 : reg17)), $signed($unsigned(reg7))}),
              $unsigned($signed(reg13[(1'h1):(1'h0)]))};
          reg31 <= (wire1[(2'h3):(1'h0)] ? (8'hb5) : (~&wire26[(2'h2):(1'h0)]));
          reg32 <= reg10[(3'h6):(3'h5)];
        end
      reg33 <= (^(!{$signed(wire25),
          ((|(7'h40)) <= (reg28 ? (8'haf) : (8'ha0)))}));
    end
  assign wire34 = wire2[(4'h8):(1'h0)];
endmodule
