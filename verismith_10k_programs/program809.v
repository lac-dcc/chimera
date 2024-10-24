module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire28;
  assign y = {wire32, wire31, wire30, wire28, (1'h0)};
  module4 #() modinst29 (.y(wire28), .clk(clk), .wire6(wire3), .wire5(wire0), .wire8(wire1), .wire7(wire2));
  assign wire30 = {$unsigned((wire3 ?
                          ($unsigned(wire2) ?
                              $signed(wire0) : (+wire2)) : ((8'hb0) ?
                              $signed(wire1) : $unsigned(wire3)))),
                      $unsigned({(wire1[(4'hc):(2'h2)] ?
                              wire28[(2'h2):(2'h2)] : {(7'h41), wire2}),
                          (~&wire1)})};
  assign wire31 = wire2;
  assign wire32 = {(8'hb1), {$signed(({wire2, wire0} & $unsigned(wire30)))}};
endmodule

module module4
#(parameter param26 = ((^{((&(8'hb9)) < {(7'h40), (8'hbc)})}) ? (!((-(~&(8'ha0))) <= (((8'ha0) ? (8'haf) : (8'ha6)) ? {(8'hb8), (8'ha5)} : ((8'hb7) ? (8'ha8) : (8'hbe))))) : (~|(({(8'hbc), (8'ha1)} ? ((8'hb9) * (7'h40)) : ((7'h40) <= (8'hb3))) >> {((8'hb8) ^ (8'ha8))}))), 
parameter param27 = param26)
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  input wire [(2'h3):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire9;
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire9,
                 reg25,
                 reg24,
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
                 reg13,
                 reg10,
                 (1'h0)};
  assign wire9 = (((((~&wire7) >> $signed(wire5)) ~^ $signed(wire7[(3'h4):(3'h4)])) >= (wire6 ?
                     (^~(^wire6)) : {{wire5},
                         (wire8 >> wire8)})) <= (!($signed((-wire6)) <= {$signed(wire7)})));
  always
    @(posedge clk) begin
      reg10 <= ($unsigned(wire7) > wire7[(3'h5):(2'h3)]);
    end
  assign wire11 = (((wire8 + ($signed((7'h44)) & ((8'hb2) >> wire7))) ~^ {$signed(wire5[(2'h2):(1'h0)]),
                      $signed($unsigned(reg10))}) + $signed(wire9));
  assign wire12 = $signed($unsigned(($signed(((8'hb8) != wire6)) ?
                      ($signed(wire9) && (-wire11)) : ((wire7 ? wire5 : wire6) ?
                          wire5[(1'h1):(1'h0)] : $signed(wire6)))));
  always
    @(posedge clk) begin
      if (((^(&wire5[(2'h3):(1'h1)])) & ((($unsigned(wire6) ?
              (wire6 ~^ reg10) : $unsigned((8'haa))) >> ({wire6} ?
              $signed(wire9) : (8'h9e))) ?
          $unsigned(wire12[(3'h6):(2'h3)]) : $signed(($signed((8'haf)) ?
              wire11 : (|(8'had)))))))
        begin
          if (wire6[(4'hc):(2'h2)])
            begin
              reg13 <= (-(($signed($signed(wire6)) + wire6[(5'h15):(5'h11)]) ?
                  wire6 : wire12));
            end
          else
            begin
              reg13 <= wire9;
            end
          reg14 <= (|$unsigned(wire11));
          reg15 <= wire5;
          reg16 <= (reg13[(4'hb):(1'h1)] ?
              (&(((wire12 ? (8'hbb) : wire7) ?
                  (reg14 ?
                      reg10 : (8'hab)) : (8'hbc)) && ($signed(wire8) == $unsigned(wire6)))) : wire11);
          reg17 <= (~(reg15 && $unsigned(wire9)));
        end
      else
        begin
          reg13 <= ($signed({wire7}) ?
              wire6 : {(~|(+reg13[(4'h8):(2'h3)])), wire12});
        end
      reg18 <= ((~|$unsigned(reg15)) != $signed((wire11 > $unsigned({wire12}))));
      reg19 <= wire5[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if (reg19[(3'h4):(2'h3)])
        begin
          reg20 <= wire9[(3'h6):(1'h0)];
          reg21 <= reg10;
          reg22 <= ((~|wire6[(2'h3):(1'h0)]) >> reg13);
        end
      else
        begin
          if (wire6[(5'h14):(1'h1)])
            begin
              reg20 <= ($signed((~|reg18)) * reg20);
            end
          else
            begin
              reg20 <= reg22[(4'h9):(3'h6)];
              reg21 <= $unsigned((($unsigned(reg17) ?
                  $signed((~reg14)) : (wire5[(1'h0):(1'h0)] ?
                      {reg17, reg17} : $signed((7'h41)))) <= (~^(~|{reg17,
                  reg13}))));
              reg22 <= {$signed(reg18), reg20[(2'h3):(1'h0)]};
            end
        end
      reg23 <= $unsigned($signed(reg15));
      reg24 <= $unsigned(($signed(reg18[(2'h3):(1'h1)]) || (reg10[(4'ha):(4'h8)] ?
          ((reg16 != wire6) && (reg16 ? reg22 : reg16)) : (~wire5))));
      reg25 <= $signed(((~(~|((8'hb5) ?
          reg17 : (8'hb4)))) >= (&(((8'hae) >>> wire5) ? (~&reg10) : wire7))));
    end
endmodule
