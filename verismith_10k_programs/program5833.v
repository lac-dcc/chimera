module top
#(parameter param37 = {((((|(7'h44)) ? {(8'hab)} : (&(8'ha1))) ? (((8'ha0) ? (8'hbf) : (8'hae)) ? ((8'ha6) ? (8'hb2) : (8'hb1)) : (-(8'haa))) : (^~((8'hbd) * (8'hbc)))) ? ((~&{(8'hae), (8'hb3)}) ? (&((8'ha1) * (8'hb3))) : (^((8'ha3) ? (8'hac) : (8'had)))) : (|(~((8'hbc) ? (8'ha6) : (8'hb8)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire36,
                 wire33,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire14,
                 wire13,
                 wire12,
                 wire4,
                 reg35,
                 reg34,
                 reg32,
                 reg24,
                 reg23,
                 reg22,
                 reg17,
                 reg16,
                 reg15,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {wire0[(3'h6):(3'h5)],
                     ({$unsigned({wire2, wire0})} ? wire2 : (^wire3))};
  always
    @(posedge clk) begin
      reg5 <= wire2;
      if (reg5[(1'h1):(1'h0)])
        begin
          if ((~^($unsigned(($unsigned(wire1) ? reg5 : $unsigned(wire3))) ?
              $unsigned({(^wire4)}) : {$signed($unsigned((7'h42))), wire0})))
            begin
              reg6 <= (({($unsigned((8'h9d)) ?
                      wire0[(3'h7):(3'h4)] : wire2)} | {$unsigned(((7'h43) | wire1))}) != {{((+wire1) && reg5[(5'h13):(1'h1)]),
                      $unsigned(((8'ha0) ? wire3 : wire4))},
                  $signed($unsigned(wire2))});
              reg7 <= ($unsigned((8'hbf)) ?
                  reg6[(4'hf):(3'h7)] : ((~^$signed((~|reg5))) >= $unsigned(wire1)));
              reg8 <= reg6[(2'h3):(2'h3)];
              reg9 <= ($signed((+{$unsigned(reg5), (~|(8'had))})) ?
                  $signed((wire3 ~^ wire4)) : (^$unsigned($unsigned((wire1 ?
                      wire1 : reg8)))));
              reg10 <= ($signed(wire4[(4'h8):(3'h5)]) ?
                  (wire1[(1'h0):(1'h0)] ?
                      (~^(reg8[(4'h9):(4'h8)] ~^ (wire0 < reg9))) : wire2) : ($signed($signed(wire2[(2'h2):(2'h2)])) == (wire1 ?
                      (^~(reg8 && reg7)) : $unsigned(wire1))));
            end
          else
            begin
              reg6 <= wire3;
            end
          reg11 <= $unsigned({$signed($unsigned(wire0[(3'h4):(1'h0)])),
              ($unsigned($unsigned(reg7)) ?
                  (^~$unsigned(wire0)) : ((~&reg7) ?
                      reg6 : (reg8 ? wire2 : reg10)))});
        end
      else
        begin
          reg6 <= reg5[(4'hf):(4'hf)];
          if ((^~$signed((((8'hb0) ? (~|reg11) : (~^wire3)) - (~^(reg11 ?
              (8'hbe) : wire2))))))
            begin
              reg7 <= wire0;
              reg8 <= (~|$signed((({(8'hb3)} < $unsigned(reg11)) ?
                  wire0 : (reg10 <= (8'hb6)))));
              reg9 <= (+(8'h9d));
              reg10 <= ($signed($signed((!$signed(wire4)))) ?
                  (wire0 ?
                      $signed((8'ha6)) : (wire0[(2'h3):(1'h1)] ?
                          wire1[(4'hc):(4'h9)] : reg9)) : ({((wire3 * reg11) * reg8[(4'hb):(3'h7)])} | (~|(~&$unsigned(wire0)))));
            end
          else
            begin
              reg7 <= $unsigned($unsigned(wire4[(4'hc):(4'h8)]));
              reg8 <= $signed($signed(($signed($unsigned(reg7)) ~^ ($signed(wire0) ^~ (&reg6)))));
              reg9 <= ((~^{$unsigned(wire1)}) ?
                  $signed({wire3}) : (wire1[(3'h5):(3'h5)] ?
                      $signed(((reg8 ?
                          wire2 : wire1) ^ (|reg11))) : (^$signed((reg10 ?
                          reg11 : reg10)))));
            end
          reg11 <= {{($signed(reg5[(3'h5):(1'h0)]) >> ((wire1 ?
                          (8'hb1) : reg9) ?
                      (-wire4) : (reg5 * wire2)))},
              (($signed((+wire3)) ^~ $signed((|wire1))) ?
                  $signed(wire3) : $unsigned(reg10))};
        end
    end
  assign wire12 = $signed(wire1[(4'hd):(3'h6)]);
  assign wire13 = (~(8'ha5));
  assign wire14 = $signed((wire13[(4'h9):(4'h8)] + (reg11 ?
                      (7'h40) : (~&$unsigned(wire12)))));
  always
    @(posedge clk) begin
      reg15 <= (^(^~($unsigned($signed(wire0)) ?
          wire2[(2'h2):(1'h0)] : ($signed(reg10) ?
              (wire12 < reg10) : wire3[(2'h3):(2'h2)]))));
      reg16 <= {(wire2[(3'h5):(2'h3)] ?
              (reg10 ?
                  $unsigned({reg8,
                      reg8}) : (&(^~reg6))) : (~^(~|$signed(reg5))))};
      reg17 <= reg11[(2'h3):(1'h1)];
    end
  assign wire18 = $signed($signed(wire4));
  assign wire19 = wire14[(2'h2):(1'h0)];
  assign wire20 = {$signed(reg6[(4'hf):(3'h6)]), wire14[(2'h2):(2'h2)]};
  assign wire21 = $unsigned(wire2[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg22 <= wire18;
      reg23 <= reg8;
      reg24 <= ($signed($unsigned((wire4 ?
              (~^wire14) : ((8'hbb) ? (8'ha4) : wire12)))) ?
          {$unsigned((|((8'hb7) ? wire20 : wire1)))} : wire12);
    end
  assign wire25 = $signed(reg7[(4'he):(3'h6)]);
  assign wire26 = wire14[(1'h0):(1'h0)];
  assign wire27 = (~|$signed((8'hbd)));
  assign wire28 = (8'hab);
  assign wire29 = $unsigned($signed((reg16 ?
                      wire12[(4'ha):(4'h8)] : ((wire18 ? wire0 : reg23) ?
                          (reg24 || wire1) : $signed((8'hba))))));
  assign wire30 = ((({$unsigned(reg22), ((8'hb5) && wire13)} ?
                              $signed((!wire25)) : wire28) ?
                          {wire12} : ((wire28[(3'h7):(3'h5)] != $unsigned(wire1)) ?
                              reg10 : (wire4[(4'hb):(3'h7)] && wire14))) ?
                      wire14 : (8'hb9));
  assign wire31 = $signed(reg17[(4'ha):(1'h0)]);
  always
    @(posedge clk) begin
      reg32 <= (8'haa);
    end
  assign wire33 = ($unsigned(($signed($unsigned(wire14)) > {$signed(wire2)})) ^ (8'h9c));
  always
    @(posedge clk) begin
      reg34 <= $unsigned((wire14 ?
          (~&(~|(wire25 ? wire33 : wire4))) : (reg7 ?
              reg22 : ({reg17} * reg5[(4'hf):(4'h8)]))));
      reg35 <= wire3[(3'h4):(2'h2)];
    end
  assign wire36 = wire1[(3'h7):(3'h5)];
endmodule
