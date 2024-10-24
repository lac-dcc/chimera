module top
#(parameter param33 = (^(^(^~(((8'ha8) > (8'hb2)) <<< ((7'h41) || (8'haf)))))), 
parameter param34 = (~(^~param33)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire32,
                 wire30,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire6,
                 wire5,
                 reg31,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
  assign wire5 = wire4[(5'h10):(2'h2)];
  assign wire6 = wire3[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg7 <= (wire5[(4'hc):(4'h9)] * {wire4, wire2});
          reg8 <= ((wire4 ?
              (~|$signed(wire5[(2'h3):(2'h3)])) : wire0[(3'h5):(3'h4)]) ^ reg7[(1'h0):(1'h0)]);
          if (wire1[(4'hc):(2'h2)])
            begin
              reg9 <= (+$unsigned((|(^~(reg7 ^~ wire1)))));
              reg10 <= (({wire1, (^~wire1[(4'h9):(3'h4)])} ?
                  (((reg7 <<< reg7) ?
                      (!reg9) : wire0) & wire2[(3'h4):(2'h3)]) : $unsigned($unsigned(wire2[(3'h7):(3'h7)]))) + $signed((&(wire6[(4'ha):(4'ha)] ?
                  $signed((8'ha8)) : (wire6 & wire4)))));
              reg11 <= (reg8[(1'h0):(1'h0)] ?
                  (reg7[(2'h2):(1'h1)] ^ $unsigned(wire2)) : $signed((((~&reg9) == wire6[(3'h4):(3'h4)]) ?
                      $unsigned((reg10 ^~ wire4)) : (~|$unsigned(wire3)))));
            end
          else
            begin
              reg9 <= ($unsigned(({(wire1 | reg10),
                  $unsigned(wire3)} != reg8[(4'h8):(3'h7)])) >> reg9);
            end
          reg12 <= $unsigned($unsigned($unsigned((+$unsigned((8'hb7))))));
        end
      else
        begin
          reg7 <= (-((((reg8 ? (7'h40) : reg10) ?
                  $unsigned(reg7) : (wire5 > reg9)) != (!(wire5 + reg9))) ?
              $signed(reg8[(2'h3):(2'h3)]) : wire2));
          reg8 <= $unsigned(reg10);
        end
      reg13 <= wire3[(3'h7):(3'h5)];
      if ($signed((($unsigned(((8'h9d) >>> wire6)) ?
          $signed($signed(wire4)) : {(8'ha7),
              (wire4 ~^ wire4)}) - $unsigned(((wire4 ? reg10 : wire4) ?
          $unsigned((8'hb4)) : $signed((8'had)))))))
        begin
          reg14 <= (^($signed(reg12[(2'h2):(1'h0)]) <= (8'hb7)));
          reg15 <= ({wire3[(4'hc):(3'h4)],
              ($signed(reg7[(2'h2):(1'h1)]) ?
                  wire1 : (~|$signed(wire4)))} << ($signed($unsigned(wire0)) >> {$signed(reg8[(3'h7):(2'h3)]),
              ($unsigned(wire6) + {reg13})}));
        end
      else
        begin
          reg14 <= (8'hbe);
          reg15 <= reg8[(4'h9):(1'h0)];
        end
    end
  assign wire16 = (~^{((wire6[(4'h8):(1'h0)] * wire3) & ($unsigned((8'ha5)) == $signed((8'hb0))))});
  assign wire17 = wire16;
  assign wire18 = {((wire1[(3'h5):(2'h3)] ?
                              reg7 : ($unsigned(reg15) ?
                                  reg8 : wire5[(2'h2):(2'h2)])) ?
                          $signed($unsigned($signed(wire1))) : $signed((reg10[(2'h2):(1'h1)] ?
                              (~^wire3) : $unsigned(wire17)))),
                      (~^($unsigned({wire0, (8'ha5)}) ?
                          $signed(((8'hb4) ?
                              reg13 : reg14)) : $signed(wire4[(2'h2):(1'h0)])))};
  assign wire19 = (+(8'hb0));
  assign wire20 = $unsigned((-wire1));
  assign wire21 = (!(~|(wire1[(2'h2):(1'h0)] <= wire19)));
  assign wire22 = (8'hb7);
  assign wire23 = ({(({reg11, reg10} ?
                          ((8'h9c) && reg13) : $unsigned(wire4)) + wire2[(3'h6):(3'h5)])} + $unsigned(((&$unsigned((8'hb0))) ?
                      $signed(wire6) : wire21)));
  assign wire24 = {wire6[(1'h1):(1'h0)], $signed(reg14)};
  always
    @(posedge clk) begin
      reg25 <= reg11[(2'h2):(2'h2)];
      reg26 <= wire16[(4'hc):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg27 <= ($unsigned((!reg13)) * $unsigned(($signed((+wire21)) && $unsigned((|reg10)))));
      reg28 <= $signed((8'ha7));
      reg29 <= (-wire5);
    end
  assign wire30 = ({(!$signed(reg9[(4'hc):(4'ha)]))} ?
                      $unsigned($signed($signed($unsigned(wire20)))) : ((~^wire4[(4'h8):(4'h8)]) ~^ (~(reg27 ~^ $unsigned(wire19)))));
  always
    @(posedge clk) begin
      reg31 <= (reg29 ?
          {($signed((reg13 && reg13)) ?
                  wire21[(4'hb):(3'h7)] : (reg14 ?
                      (wire18 ? reg26 : wire5) : reg26))} : wire21);
    end
  assign wire32 = (~&({{(wire23 || reg14), (wire24 ? wire20 : wire2)}} ?
                      reg29 : $signed((wire2 ^~ $signed(reg15)))));
endmodule
