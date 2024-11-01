module top
#(parameter param34 = ((((((7'h41) ^~ (8'h9f)) ? ((8'hac) ~^ (8'hb8)) : ((8'ha7) >> (8'hb2))) ^ {((8'h9f) && (8'ha4))}) ? {{((8'hb5) ? (8'ha9) : (8'h9d)), (8'had)}} : ((-((7'h44) <<< (7'h41))) + ((!(8'hb0)) ? ((8'hbe) ? (8'ha4) : (7'h40)) : {(8'had)}))) == (|((~&(^~(8'hbe))) ? (((7'h43) <= (7'h44)) > (^(8'hb1))) : (8'h9f)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire22,
                 wire21,
                 wire20,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire5,
                 wire4,
                 reg25,
                 reg24,
                 reg23,
                 reg19,
                 reg18,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed(wire0);
  assign wire5 = (^({($unsigned((8'ha7)) ^ {wire2}),
                         ({(8'hbb)} ? (wire3 >> wire3) : $unsigned(wire0))} ?
                     wire0 : (((wire3 * wire1) ? wire2 : wire1) ?
                         wire2 : $signed(wire3[(4'hb):(3'h4)]))));
  always
    @(posedge clk) begin
      reg6 <= wire5[(4'hd):(2'h3)];
      if (({(wire0 & ({wire2, wire1} ?
              $signed(wire4) : $signed(wire4)))} ~^ (|(($unsigned(wire2) ?
          $signed(wire3) : wire4[(3'h7):(1'h0)]) + wire0))))
        begin
          reg7 <= ((&(8'h9d)) ?
              (wire0[(2'h3):(1'h0)] ?
                  $unsigned(wire0) : $signed(wire5[(4'hc):(3'h4)])) : ((8'h9c) << reg6[(3'h4):(3'h4)]));
          reg8 <= (|({wire5} ? (7'h44) : wire1));
          if (wire3)
            begin
              reg9 <= ($unsigned({$signed((wire5 & reg6)),
                      (wire3[(4'hc):(1'h1)] ^ (~&reg6))}) ?
                  $unsigned($signed(reg7)) : reg7[(1'h0):(1'h0)]);
            end
          else
            begin
              reg9 <= reg7[(3'h5):(2'h3)];
            end
        end
      else
        begin
          reg7 <= wire1;
          reg8 <= wire3;
          reg9 <= $unsigned($unsigned(reg8[(1'h0):(1'h0)]));
          reg10 <= (8'ha8);
        end
      reg11 <= (8'h9f);
      reg12 <= (^~$signed(($unsigned(wire5[(4'ha):(1'h0)]) << (8'hab))));
    end
  assign wire13 = $signed($signed((~$signed((~^wire2)))));
  assign wire14 = {$unsigned(wire5[(3'h7):(2'h2)]),
                      ((reg9 ?
                          $signed(reg7) : wire1[(2'h2):(1'h0)]) + $signed((~|$signed((8'hb7)))))};
  assign wire15 = reg11;
  assign wire16 = $signed(wire14[(4'ha):(1'h0)]);
  assign wire17 = (($unsigned((~|$unsigned(reg10))) ?
                      $unsigned({reg7,
                          wire13[(3'h4):(3'h4)]}) : (wire15[(1'h0):(1'h0)] != wire13[(4'h8):(3'h4)])) >>> {(((reg9 ?
                              wire5 : wire5) & (wire5 ? wire16 : reg7)) ?
                          $unsigned($unsigned(reg11)) : $unsigned(wire0[(3'h5):(3'h4)])),
                      wire0});
  always
    @(posedge clk) begin
      reg18 <= wire17;
      reg19 <= (8'had);
    end
  assign wire20 = $unsigned(wire3);
  assign wire21 = (-wire3[(3'h7):(1'h0)]);
  assign wire22 = ($unsigned({$signed(wire17)}) * $signed(reg10));
  always
    @(posedge clk) begin
      reg23 <= ((~|$signed((reg7 ? $signed(wire0) : $signed(wire16)))) ?
          reg7 : (|$unsigned((&$unsigned(wire2)))));
      reg24 <= (((!reg10[(3'h7):(3'h4)]) ?
          (~((-wire1) == (~^reg6))) : $unsigned((~(wire4 < wire21)))) + (wire20 ?
          (((~wire20) ? (reg18 * reg7) : (wire16 < wire1)) - ($signed(wire4) ?
              reg12[(2'h2):(1'h1)] : ((8'ha6) && reg23))) : wire17));
      reg25 <= {{$signed(reg11)}};
    end
  assign wire26 = $signed($signed($signed(({reg24} ?
                      (reg11 ? reg24 : wire2) : wire0[(3'h4):(2'h3)]))));
  assign wire27 = $signed(reg19);
  assign wire28 = {wire4[(4'h8):(4'h8)]};
  assign wire29 = wire16[(1'h0):(1'h0)];
  assign wire30 = $signed(wire15[(1'h0):(1'h0)]);
  assign wire31 = (reg6 >> (((wire15 | wire2) + {(7'h42)}) ?
                      ((+$unsigned(wire0)) ~^ $unsigned(wire30)) : {$unsigned($signed((8'ha4)))}));
  assign wire32 = wire5;
  assign wire33 = wire21;
endmodule
