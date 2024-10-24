module top
#(parameter param57 = (~&{(&((~^(8'ha7)) ? ((8'hb9) ? (7'h43) : (8'hb4)) : ((8'hbd) ? (8'hb7) : (8'hb7))))}), 
parameter param58 = (~^(((!param57) ? (!{(8'hb9)}) : (^~(param57 ? param57 : param57))) ? (~param57) : (~(!(~^param57))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire38;
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire41,
                 wire40,
                 wire38,
                 reg53,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  module5 #() modinst39 (wire38, clk, wire0, wire2, wire4, wire1);
  assign wire40 = (($unsigned($signed($unsigned(wire3))) + wire3[(4'h8):(4'h8)]) ?
                      $signed(wire38[(5'h10):(4'h9)]) : wire1[(4'hb):(4'hb)]);
  assign wire41 = $unsigned(wire0);
  always
    @(posedge clk) begin
      reg42 <= (+{(|((wire3 * (8'hb9)) - wire0)), $unsigned(wire41)});
      if ($unsigned(((-(^wire2)) ?
          reg42[(2'h3):(1'h1)] : (((!reg42) ?
              (!wire4) : $unsigned((8'hbc))) ~^ {{reg42}, wire3}))))
        begin
          reg43 <= $unsigned((wire2 >= wire4));
          reg44 <= wire0;
          reg45 <= wire3;
          reg46 <= (~wire41);
        end
      else
        begin
          if (((+(reg44 ?
              (reg43 <<< $signed(reg46)) : ($unsigned((8'h9f)) ?
                  $signed(wire2) : (wire3 ?
                      wire41 : reg44)))) || $signed({reg44[(1'h1):(1'h0)]})))
            begin
              reg43 <= wire1;
              reg44 <= wire2;
              reg45 <= $signed($signed(reg42[(1'h0):(1'h0)]));
              reg46 <= $signed(((reg45[(2'h2):(1'h0)] * (~|$signed(reg43))) ?
                  $signed($unsigned((|wire4))) : $unsigned($signed(wire4))));
              reg47 <= reg44[(2'h3):(1'h0)];
            end
          else
            begin
              reg43 <= ($unsigned((((!wire41) ?
                      $signed(reg43) : (reg45 | wire41)) ?
                  ((~&reg45) ?
                      $unsigned(wire2) : {reg42,
                          wire40}) : $signed((~|wire2)))) || $signed(($unsigned(reg46) ?
                  reg42[(2'h3):(1'h1)] : wire41)));
            end
          reg48 <= $signed({((~&$signed(wire3)) ?
                  ($signed(reg42) ? reg45 : ((8'hab) < wire3)) : reg47),
              reg43[(4'h8):(1'h1)]});
          reg49 <= $signed((wire1 ?
              (&{(~|reg43)}) : (^{(wire41 ? reg44 : wire4),
                  ((8'hb4) || wire41)})));
          reg50 <= $signed($signed(({$unsigned(wire0)} << $unsigned((^wire3)))));
        end
      reg51 <= $signed($unsigned($unsigned(((wire3 << reg46) ?
          $signed(wire3) : wire38))));
    end
  assign wire52 = wire4;
  always
    @(posedge clk) begin
      reg53 <= reg49;
    end
  assign wire54 = (((((wire41 ? reg46 : reg44) ? $signed(reg49) : (8'hb8)) ?
                          reg47[(5'h10):(1'h0)] : ((8'hab) ?
                              (wire3 < (8'hb8)) : (&wire3))) * {reg50,
                          (8'ha5)}) ?
                      wire0[(3'h5):(1'h1)] : wire3[(2'h3):(1'h1)]);
  assign wire55 = wire41[(3'h5):(1'h0)];
  assign wire56 = ($signed($unsigned((~(8'hb9)))) <= wire40[(3'h7):(1'h1)]);
endmodule

module module5
#(parameter param36 = ((~((-(~^(8'hae))) ? ({(8'ha9)} ? ((8'hb7) >>> (8'ha8)) : (!(8'h9e))) : (((8'hb2) ? (7'h41) : (8'had)) && {(8'ha9), (8'hb6)}))) <= (!(^({(8'hb3), (8'h9e)} >>> (!(8'hb3)))))), 
parameter param37 = (param36 <<< ({param36, ((param36 ? param36 : param36) > (param36 ? (8'hb4) : param36))} < (^({param36} ? (~^param36) : (~|param36))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire31;
  assign y = {wire35, wire34, wire33, wire31, (1'h0)};
  module10 #() modinst32 (.wire11(wire8), .wire12(wire6), .wire14(wire7), .y(wire31), .wire13(wire9), .clk(clk));
  assign wire33 = wire31[(3'h5):(3'h5)];
  assign wire34 = $unsigned($signed(((7'h41) != (-$signed(wire33)))));
  assign wire35 = wire34;
endmodule

module module10
#(parameter param30 = (8'ha8))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(2'h3):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= $unsigned($signed(wire13));
      reg16 <= ($signed((&{(wire12 << (8'ha3))})) ^~ reg15);
      reg17 <= wire14;
      reg18 <= ((({wire12[(4'h8):(4'h8)], (+(7'h44))} | ($unsigned(wire14) ?
              wire11[(1'h0):(1'h0)] : (wire13 & wire14))) ?
          $signed({reg17}) : $signed(wire11[(1'h0):(1'h0)])) != (8'hbb));
    end
  assign wire19 = (wire11[(1'h0):(1'h0)] ?
                      (wire14[(3'h7):(2'h2)] ?
                          ({$unsigned((8'hbb)),
                              (wire14 ? (8'hb9) : reg18)} <= ((^wire13) ?
                              $unsigned(reg18) : $signed(reg15))) : (wire14 ?
                              ({reg15,
                                  wire14} < {wire11}) : wire13)) : {(|((wire14 ?
                              wire14 : reg18) <<< $unsigned((8'hb6)))),
                          reg16});
  assign wire20 = wire12;
  assign wire21 = (8'hbb);
  assign wire22 = (+(~^$unsigned($signed((wire19 ? wire12 : wire13)))));
  always
    @(posedge clk) begin
      reg23 <= reg17;
      reg24 <= ($signed($signed((-$signed(wire12)))) ?
          $signed($unsigned((7'h43))) : $signed((~(+wire19))));
    end
  always
    @(posedge clk) begin
      reg25 <= wire13[(1'h1):(1'h1)];
      reg26 <= reg23[(1'h1):(1'h1)];
    end
  assign wire27 = ((~|wire11) <= (~|(wire20 & wire22[(4'ha):(4'h9)])));
  assign wire28 = reg26[(2'h3):(2'h2)];
  assign wire29 = ((|wire27[(5'h11):(4'h9)]) >>> wire11);
endmodule
