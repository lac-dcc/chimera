module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire58;
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire5,
                 wire58,
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
  assign wire5 = (8'hb9);
  always
    @(posedge clk) begin
      reg6 <= $unsigned((~&(&wire0)));
      reg7 <= $unsigned($unsigned(reg6));
      reg8 <= $unsigned(reg7);
      if ((wire3 * (wire0[(1'h0):(1'h0)] ?
          ((^~$signed(wire2)) > $unsigned($unsigned(wire4))) : (((reg6 == wire0) ?
              $signed(wire4) : $unsigned(wire0)) | ($signed((8'hba)) ?
              (reg8 == reg6) : (~^(8'hbd)))))))
        begin
          reg9 <= {(($signed((wire5 >> (8'ha1))) <= (~|wire0)) << ($signed((wire1 > reg6)) ?
                  reg7[(3'h6):(2'h3)] : wire5[(2'h2):(1'h1)])),
              $signed(($unsigned($unsigned(wire5)) >= $signed($unsigned(wire2))))};
          if (({$unsigned((~|$signed((7'h40))))} ? reg6 : (7'h42)))
            begin
              reg10 <= (+$unsigned(reg7[(5'h14):(4'hd)]));
              reg11 <= wire3;
              reg12 <= $signed(reg10[(3'h4):(1'h0)]);
            end
          else
            begin
              reg10 <= ((~|$signed(($unsigned(wire4) ?
                      $signed(wire4) : wire1))) ?
                  ((+(((8'ha2) ? (8'hb2) : wire3) & $unsigned(wire5))) ?
                      (reg11[(2'h2):(1'h1)] ?
                          wire4 : (^$unsigned(reg11))) : wire2[(1'h0):(1'h0)]) : reg10);
              reg11 <= wire4;
              reg12 <= wire2[(1'h1):(1'h1)];
            end
          if (reg9[(4'h8):(3'h4)])
            begin
              reg13 <= $unsigned(wire0[(2'h3):(2'h3)]);
            end
          else
            begin
              reg13 <= wire2[(2'h2):(2'h2)];
            end
          reg14 <= reg9[(4'h8):(1'h1)];
          reg15 <= $unsigned($unsigned(wire4));
        end
      else
        begin
          reg9 <= {$unsigned($unsigned(reg11[(2'h3):(1'h1)])),
              (((~|(^~wire2)) >> (reg12 ?
                  (reg8 ?
                      reg14 : reg11) : (|reg10))) && (|$signed((reg6 >> reg11))))};
          reg10 <= $signed($signed((^~($unsigned(reg9) ?
              reg6 : reg8[(4'ha):(2'h2)]))));
          reg11 <= (wire3 < (-(reg14[(2'h3):(1'h1)] || reg13)));
        end
      reg16 <= (wire1[(2'h3):(2'h2)] < reg7[(5'h11):(4'hc)]);
    end
  module17 #() modinst59 (.clk(clk), .wire22(reg8), .y(wire58), .wire19(wire5), .wire20(reg7), .wire18(reg11), .wire21(reg14));
  assign wire60 = $unsigned($unsigned(({{reg7,
                          wire2}} ^ $signed(wire1[(3'h5):(1'h0)]))));
  assign wire61 = wire3[(2'h3):(2'h3)];
endmodule

module module17  (y, clk, wire18, wire19, wire20, wire21, wire22);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire46;
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  assign y = {wire57,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire23,
                 wire24,
                 wire25,
                 wire46,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire23 = {(8'hbe)};
  assign wire24 = ($signed((({wire22} ? (wire20 || wire21) : wire19) ?
                      {(-wire23)} : {(~&wire21)})) >>> (wire18[(4'hd):(3'h4)] ?
                      $unsigned(((8'hb9) << wire18[(1'h0):(1'h0)])) : wire21[(3'h6):(2'h3)]));
  assign wire25 = (((~(~|(8'ha4))) & (~&wire19[(4'hd):(4'hc)])) <= ((8'ha0) ?
                      {(wire23 <<< ((8'had) ? wire21 : wire21))} : wire18));
  module26 #() modinst47 (.wire27(wire22), .wire29(wire24), .wire31(wire20), .wire28(wire18), .y(wire46), .clk(clk), .wire30(wire25));
  assign wire48 = wire20[(4'h9):(3'h7)];
  assign wire49 = $unsigned((+wire25));
  assign wire50 = ($signed(wire25[(3'h4):(3'h4)]) ?
                      $unsigned((((wire18 & (7'h44)) ?
                          (wire21 > wire49) : wire20) & $signed(wire24))) : (((8'hb2) ?
                          wire49 : (wire46[(3'h7):(1'h1)] ~^ $unsigned(wire18))) && wire18[(5'h10):(4'hd)]));
  assign wire51 = (wire18[(4'hc):(4'hb)] ?
                      (&wire46[(3'h7):(2'h2)]) : $signed((~$signed((~|wire46)))));
  assign wire52 = {wire48[(4'hd):(1'h1)]};
  assign wire53 = $unsigned(((|{(wire50 >>> wire20), (wire23 | (8'hbc))}) ?
                      wire50[(1'h1):(1'h0)] : $unsigned((+(wire23 ~^ (8'hba))))));
  always
    @(posedge clk) begin
      reg54 <= (wire51 ? wire48 : $signed(wire23));
      reg55 <= reg54[(3'h7):(3'h7)];
      reg56 <= (8'ha8);
    end
  assign wire57 = (((($signed(wire52) & wire49[(4'he):(3'h4)]) ~^ wire52[(4'ha):(3'h4)]) ?
                      wire51[(3'h5):(2'h2)] : ($signed((^wire20)) ~^ {{wire49,
                              wire52}})) && wire20);
endmodule

module module26
#(parameter param44 = ({({{(7'h42), (8'hb8)}} | ((+(8'ha7)) * ((8'h9c) ~^ (8'hbf)))), (^~((^~(7'h44)) == (|(8'hba))))} ? ({(((8'ha5) ? (8'ha7) : (8'hb0)) < {(8'hac)}), (-((8'h9c) || (7'h40)))} > (~^({(8'hb1)} ? ((7'h41) ^ (7'h44)) : {(8'had)}))) : (!((((8'h9c) ? (8'hb5) : (8'ha8)) ~^ (8'ha1)) ? (((8'hbb) ? (8'hb2) : (8'hb2)) ~^ ((7'h42) ? (7'h42) : (8'ha7))) : (((8'ha5) ? (7'h43) : (8'h9e)) < ((8'hb2) ? (8'ha4) : (8'hb4)))))), 
parameter param45 = ((+param44) || (((((8'hb1) * param44) + (param44 ? param44 : param44)) * (((8'h9d) ? param44 : param44) ? ((8'hac) ? param44 : param44) : (~|param44))) * (+(^param44)))))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire signed [(3'h5):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  assign y = {wire43,
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
                 (1'h0)};
  assign wire32 = wire28[(4'hb):(2'h3)];
  assign wire33 = $signed(wire28);
  assign wire34 = $unsigned((~&wire32[(1'h1):(1'h0)]));
  assign wire35 = (8'hb0);
  assign wire36 = wire31;
  assign wire37 = (~(+((wire33 ?
                      (wire29 ? wire27 : wire36) : (8'ha0)) ~^ wire31)));
  assign wire38 = wire29;
  assign wire39 = $signed((^~wire38[(3'h6):(1'h0)]));
  assign wire40 = $unsigned((((8'hb4) ?
                      {wire35[(5'h12):(4'he)]} : $signed((wire35 ?
                          wire33 : (8'ha4)))) * $unsigned((!{(8'ha1),
                      wire35}))));
  assign wire41 = $unsigned(wire40);
  assign wire42 = (^~(&(+(!(wire29 >>> (8'hb3))))));
  assign wire43 = wire36[(3'h5):(2'h3)];
endmodule
