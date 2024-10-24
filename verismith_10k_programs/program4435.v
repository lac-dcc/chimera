module top
#(parameter param33 = (^(~^((((8'ha3) ? (8'haa) : (8'hb3)) < ((8'haa) >> (8'hbd))) == {(~^(7'h42)), ((8'hb3) ? (8'ha9) : (8'hbe))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  assign y = {wire29,
                 wire11,
                 wire5,
                 reg32,
                 reg31,
                 reg4,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0;
    end
  assign wire5 = reg4[(5'h13):(3'h5)];
  always
    @(posedge clk) begin
      reg6 <= wire3[(3'h4):(3'h4)];
      reg7 <= ($signed((((~^(8'hac)) ?
              reg4 : wire5[(3'h6):(2'h2)]) >>> $unsigned((wire5 ?
              (8'haa) : wire1)))) ?
          (((8'ha9) ?
              (~|(wire0 ? reg4 : wire1)) : wire5[(1'h1):(1'h1)]) >= {wire3,
              {wire0[(3'h7):(1'h1)],
                  $unsigned(wire2)}}) : (reg4 ^ (^($signed(wire3) ?
              $signed((8'hbb)) : (8'ha8)))));
      reg8 <= {(|((8'h9e) > ({(7'h41), (8'hb7)} != (^~(8'had))))),
          $unsigned((~&(~|{reg7})))};
      reg9 <= (~wire2[(2'h3):(1'h1)]);
      reg10 <= $unsigned((~^(~|$unsigned(reg8))));
    end
  assign wire11 = ((~(reg10 >>> (((7'h42) ?
                      (7'h43) : (8'hac)) < $unsigned(wire0)))) || reg6);
  always
    @(posedge clk) begin
      reg12 <= wire0[(4'h8):(3'h4)];
      reg13 <= $unsigned(((+(((8'ha6) ~^ reg12) - (reg4 >> wire2))) ?
          ({$unsigned((8'h9f))} ?
              ($signed(wire1) || (wire11 + reg4)) : (wire0 ~^ reg4)) : ({(|wire11)} | reg6)));
      reg14 <= {((((reg7 != reg12) ?
                  $unsigned(wire3) : (~|(8'ha7))) & (reg6[(1'h0):(1'h0)] ?
                  reg10 : (!reg7))) ?
              $unsigned((~|$unsigned(reg9))) : wire2)};
      if ((((&(&wire3)) == (reg7 + (wire2 ?
          (reg10 < reg7) : (reg14 <= wire5)))) == $signed($unsigned({(~&wire5)}))))
        begin
          if ((reg13[(3'h4):(1'h1)] ?
              (wire2 ?
                  (&$unsigned(((8'haf) ^ wire1))) : $signed((|reg9))) : (reg14[(3'h6):(1'h0)] ?
                  ((~|(!wire1)) ?
                      (8'ha8) : {(reg9 ? wire5 : reg4),
                          {wire11, reg14}}) : (($signed(wire0) ?
                          reg10 : $unsigned(reg13)) ?
                      reg7[(4'hb):(3'h7)] : $signed((8'ha7))))))
            begin
              reg15 <= ({{((reg13 ? wire5 : reg7) > reg4[(5'h15):(4'he)]),
                          $unsigned(wire5)}} ?
                  $signed(reg7[(3'h7):(3'h5)]) : (-$unsigned(wire1[(1'h0):(1'h0)])));
            end
          else
            begin
              reg15 <= $unsigned($unsigned(($unsigned(((8'hb6) ~^ (8'hba))) ?
                  (&(reg7 << wire11)) : $unsigned($signed(reg14)))));
              reg16 <= $unsigned(wire1[(3'h6):(3'h6)]);
              reg17 <= ($unsigned(($signed((8'hb6)) + reg15[(1'h0):(1'h0)])) >>> {$signed((7'h43))});
            end
        end
      else
        begin
          reg15 <= (($unsigned({$signed(wire3), (-reg12)}) ? reg7 : wire11) ?
              (&$signed((!(+reg17)))) : reg7[(5'h11):(3'h7)]);
        end
      reg18 <= reg8[(1'h1):(1'h0)];
    end
  module19 #() modinst30 (.y(wire29), .wire21(reg4), .clk(clk), .wire24(reg9), .wire22(reg13), .wire23(reg17), .wire20(reg18));
  always
    @(posedge clk) begin
      reg31 <= reg13;
      reg32 <= $unsigned($unsigned($signed(reg17[(2'h3):(1'h1)])));
    end
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire24;
  input wire [(5'h14):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  input wire [(3'h5):(1'h0)] wire21;
  input wire signed [(5'h12):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  assign y = {wire28, wire27, wire26, wire25, (1'h0)};
  assign wire25 = wire20[(3'h6):(2'h3)];
  assign wire26 = wire24;
  assign wire27 = $signed($signed($signed((8'ha1))));
  assign wire28 = $signed(wire20);
endmodule
