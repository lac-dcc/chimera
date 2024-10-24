module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire18,
                 wire4,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire4 = (((&$signed({wire3})) ?
                         $unsigned($unsigned($unsigned((8'ha6)))) : ($unsigned(wire1) | wire1[(3'h6):(3'h4)])) ?
                     wire3[(4'hc):(1'h0)] : wire2);
  module5 #() modinst19 (.wire9(wire0), .clk(clk), .wire7(wire4), .wire6(wire2), .y(wire18), .wire8(wire1));
  assign wire20 = (wire0 ?
                      wire18 : ({(8'hbb),
                          {(wire18 ? wire1 : wire18),
                              $unsigned(wire0)}} <= $signed($unsigned(((8'ha3) ?
                          wire18 : wire4)))));
  assign wire21 = ($unsigned(wire3) ?
                      wire18[(2'h3):(2'h3)] : $signed($signed(({wire20,
                          wire20} + (wire20 * wire1)))));
  assign wire22 = wire3;
  assign wire23 = (~^wire18);
  assign wire24 = wire0;
  module25 #() modinst59 (.y(wire58), .wire28(wire20), .wire29(wire18), .clk(clk), .wire26(wire24), .wire27(wire1));
  assign wire60 = (((+$unsigned($unsigned(wire3))) ?
                          $signed(wire58) : ($unsigned(wire24) != $unsigned($signed(wire23)))) ?
                      (~|$signed((|((8'ha7) ?
                          wire18 : wire4)))) : ((~|((wire24 * wire18) ?
                          wire22[(4'ha):(1'h1)] : (wire23 ?
                              wire1 : (8'ha0)))) | wire22));
  assign wire61 = $unsigned(((!((wire18 || wire24) <<< {wire21})) && $unsigned(((wire24 ?
                          wire4 : wire20) ?
                      $signed(wire23) : (8'ha6)))));
  assign wire62 = {($signed((~&$unsigned(wire23))) >> ((7'h42) > wire58[(2'h2):(1'h0)])),
                      $signed((wire20 ? (~(^wire2)) : (8'hba)))};
  always
    @(posedge clk) begin
      reg63 <= (wire61[(2'h3):(1'h0)] ~^ (wire61[(3'h7):(3'h6)] ?
          {((^wire1) << $unsigned(wire1))} : wire24[(4'h9):(1'h0)]));
      reg64 <= $unsigned((^~({wire58, (|(7'h43))} ?
          $signed($unsigned(wire1)) : {wire20})));
      reg65 <= $signed(wire18[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg66 <= ((8'h9d) && {($unsigned(wire62[(3'h7):(2'h2)]) ~^ (((8'h9f) ?
                  wire60 : wire0) ?
              $signed(reg63) : (wire2 | wire4)))});
      reg67 <= $unsigned(reg63[(3'h5):(1'h0)]);
    end
  assign wire68 = $signed(wire3);
  assign wire69 = reg66[(1'h1):(1'h0)];
  assign wire70 = wire0[(3'h6):(3'h6)];
  assign wire71 = (|{wire68[(2'h2):(2'h2)],
                      $unsigned(((wire4 < reg64) ?
                          (wire22 ? reg66 : (8'hbe)) : $unsigned((8'hbb))))});
  assign wire72 = wire60;
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire29;
  input wire signed [(4'hd):(1'h0)] wire28;
  input wire signed [(5'h14):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire50,
                 wire46,
                 wire38,
                 wire37,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 reg47,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg30 <= $signed(wire29);
      if (((-(wire28 ?
              (((8'ha5) <= wire26) >= {wire29, (8'h9f)}) : $signed((+reg30)))) ?
          (((&(-(8'hbc))) ?
              ((reg30 <= wire28) >> $signed(wire26)) : $signed((~^wire28))) > wire27[(4'ha):(4'ha)]) : wire27))
        begin
          if (wire26)
            begin
              reg31 <= $signed($signed((wire27[(4'hb):(1'h0)] <<< ((8'ha6) >>> (wire29 ?
                  wire27 : reg30)))));
              reg32 <= {(+(wire29 ?
                      $signed((wire29 == reg31)) : {(~|wire29), (~|reg30)})),
                  wire26[(4'hd):(3'h7)]};
              reg33 <= (({((wire29 >>> reg31) ?
                          $signed(reg32) : wire29[(3'h5):(3'h5)]),
                      (-(!reg30))} ?
                  ((wire27[(4'he):(4'hd)] ? (wire28 >> (7'h43)) : {(8'hbe)}) ?
                      (reg32[(4'h9):(3'h6)] ?
                          $signed(reg32) : $signed(wire26)) : ((8'haf) ?
                          (8'ha7) : reg32)) : (wire26[(2'h2):(1'h1)] ?
                      reg30 : ((reg30 ^~ reg31) <<< $signed((8'h9f))))) == (wire29 ?
                  (reg31[(4'hb):(3'h7)] ~^ {(|reg30),
                      $signed(wire28)}) : reg31[(2'h2):(2'h2)]));
              reg34 <= (7'h43);
              reg35 <= wire28[(3'h7):(2'h3)];
            end
          else
            begin
              reg31 <= $signed((^~(reg34[(1'h1):(1'h0)] * {reg33[(3'h7):(3'h6)],
                  reg33})));
              reg32 <= (($signed(((reg31 - wire26) ? reg33 : (~wire29))) ?
                      (((|wire29) ?
                          wire29 : reg33) || $unsigned($unsigned((8'ha8)))) : ($unsigned(wire27[(4'h8):(4'h8)]) * ((reg33 ?
                              reg32 : reg34) ?
                          wire28 : wire28[(4'hd):(1'h0)]))) ?
                  ((wire29[(2'h2):(2'h2)] ?
                          $signed(((8'ha8) ?
                              reg31 : wire27)) : $signed((reg31 >>> (8'hb7)))) ?
                      wire27 : $unsigned((wire29[(3'h6):(3'h5)] ?
                          (wire27 ^~ reg35) : reg34[(3'h4):(3'h4)]))) : $signed((~|wire26)));
            end
          reg36 <= reg31[(3'h5):(1'h0)];
        end
      else
        begin
          reg31 <= $unsigned(reg33[(2'h3):(1'h0)]);
          reg32 <= (8'hb2);
        end
    end
  assign wire37 = $signed((reg34 <= wire28));
  assign wire38 = (-$signed((^reg32)));
  always
    @(posedge clk) begin
      reg39 <= reg30[(2'h3):(1'h1)];
      if ($unsigned(wire28[(4'hd):(4'h8)]))
        begin
          reg40 <= $unsigned(($signed((~^{reg32, (8'hbe)})) ?
              reg33 : $unsigned($signed($signed(wire27)))));
          reg41 <= $unsigned($unsigned(reg36));
          reg42 <= ($signed($unsigned((^wire27[(5'h10):(4'ha)]))) && $unsigned({reg30[(2'h3):(2'h2)]}));
        end
      else
        begin
          reg40 <= wire28[(3'h4):(3'h4)];
        end
      reg43 <= (((-(!$unsigned(reg40))) | reg31[(4'hf):(4'hd)]) ?
          $signed($unsigned(reg32)) : $signed(wire29[(3'h7):(1'h0)]));
      reg44 <= $signed({{((~|reg34) ? reg43 : $unsigned((8'ha3)))}});
      reg45 <= {(reg40 * (!(((8'hb7) << reg34) ?
              reg42[(3'h5):(1'h0)] : (^~(8'ha9))))),
          ((((~^reg42) < (wire27 <<< reg44)) ? (~$signed(reg36)) : (8'hb6)) ?
              {$unsigned((~reg44)),
                  {wire38[(3'h5):(1'h0)], {reg40, wire38}}} : $signed(reg43))};
    end
  assign wire46 = (^~reg45);
  always
    @(posedge clk) begin
      reg47 <= reg30;
      reg48 <= (&{((8'hac) ? reg39[(1'h0):(1'h0)] : reg43[(3'h6):(2'h3)])});
      reg49 <= reg42;
    end
  assign wire50 = $unsigned((wire38 <= reg32[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      if ({wire26[(4'h9):(3'h5)], (|wire37)})
        begin
          reg51 <= reg47;
          reg52 <= $signed({($signed($signed(wire29)) || wire26),
              $signed(({(8'hbe)} ?
                  (reg34 ? (8'ha5) : wire46) : $signed(reg36)))});
        end
      else
        begin
          if ((~reg52))
            begin
              reg51 <= (wire26 ? reg35 : {reg34[(2'h2):(1'h0)]});
              reg52 <= (8'ha6);
              reg53 <= $signed($signed(($signed((!(7'h42))) ^~ reg48[(2'h3):(1'h0)])));
              reg54 <= reg39;
            end
          else
            begin
              reg51 <= wire29[(3'h6):(3'h5)];
              reg52 <= $signed(reg43);
              reg53 <= (&$signed(reg53[(1'h1):(1'h1)]));
            end
        end
    end
  assign wire55 = $signed(wire50[(2'h2):(1'h1)]);
  assign wire56 = {$signed($unsigned($unsigned((reg47 ? (7'h42) : reg40))))};
  assign wire57 = (($signed(reg47) & (~|reg49[(2'h3):(1'h0)])) ?
                      $signed($signed(wire46[(3'h6):(3'h5)])) : $signed((reg43[(3'h5):(3'h4)] == $unsigned((-reg35)))));
endmodule

module module5
#(parameter param16 = ((-(8'hb8)) ? (^(~&(~&{(7'h41)}))) : (((8'hbf) || (~&(~(7'h44)))) ? (8'hb2) : ((|(~(8'ha2))) ? ((8'ha6) ? ((8'had) ? (8'h9d) : (8'h9e)) : {(8'had)}) : {((8'hb6) || (8'h9d)), ((8'ha7) ? (8'hbd) : (8'ha7))}))), 
parameter param17 = (-(&(&({param16, param16} >= param16)))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  assign y = {wire15, wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = (wire9[(2'h2):(1'h1)] ?
                      {$unsigned($signed($unsigned(wire8)))} : ((8'hb6) ?
                          wire9 : wire7));
  assign wire11 = ($unsigned(((|wire7[(2'h3):(2'h2)]) <= wire10)) & ((~^((~|wire9) * $unsigned(wire10))) ?
                      wire9[(1'h1):(1'h1)] : (((8'hb6) ?
                          (^~wire8) : $unsigned(wire7)) - (wire9[(1'h0):(1'h0)] ?
                          (wire8 | wire6) : wire8))));
  assign wire12 = ((-(8'hac)) ?
                      ((&{wire7[(2'h2):(2'h2)], $signed(wire7)}) ?
                          wire8 : $signed(((wire8 && (8'ha4)) ?
                              wire10 : $unsigned(wire8)))) : (wire6 ?
                          (|$signed({(8'haa),
                              wire10})) : $unsigned($unsigned({wire6,
                              wire7}))));
  assign wire13 = $unsigned(wire8);
  assign wire14 = (^(!((wire9[(1'h0):(1'h0)] == $unsigned(wire12)) * ((wire8 ?
                      wire11 : wire10) ~^ $signed(wire9)))));
  assign wire15 = wire8[(2'h2):(2'h2)];
endmodule
