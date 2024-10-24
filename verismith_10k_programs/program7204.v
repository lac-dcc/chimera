module top
#(parameter param34 = ((~&((|((8'hba) ? (8'ha8) : (8'hb8))) >> ((~|(8'hb3)) << (8'hb1)))) >>> (~^((+((7'h44) ? (8'hb6) : (8'hb4))) + (^~(|(8'ha2)))))), 
parameter param35 = (({(~&param34), (param34 || (param34 ? param34 : param34))} ^ ((&(param34 ? param34 : param34)) <<< (((8'hb0) - param34) ? (~&param34) : (~^(8'h9f))))) ? {param34} : (+(((param34 >> (8'haa)) ? {(8'ha8), param34} : {param34, param34}) ~^ (((8'hbf) >= param34) & (8'had))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire12;
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(2'h2):(1'h0)] reg4 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned((7'h42));
      if ((~|$unsigned($signed(reg4[(1'h0):(1'h0)]))))
        begin
          reg5 <= (~|(reg4 ?
              {{$signed(wire3)},
                  $signed((wire1 ~^ wire0))} : ($unsigned($unsigned(wire1)) ?
                  (^$unsigned(wire0)) : (+(wire3 <= wire1)))));
          reg6 <= {$unsigned(wire1[(3'h6):(1'h0)]), (8'ha3)};
          if (((wire0 ?
                  ((&(wire2 ~^ reg4)) & {wire2[(3'h6):(3'h6)],
                      (!wire2)}) : $signed(wire3)) ?
              (~($unsigned((reg6 ? reg5 : wire0)) ?
                  $signed({wire0}) : (~reg6))) : ((($signed(wire3) ?
                          reg5 : $unsigned(reg5)) ?
                      $unsigned($unsigned(reg4)) : reg5[(3'h4):(1'h1)]) ?
                  (8'haa) : wire3[(4'ha):(1'h1)])))
            begin
              reg7 <= ({{{(8'hb6)}}} ?
                  wire1[(3'h7):(1'h0)] : wire1[(3'h4):(2'h3)]);
            end
          else
            begin
              reg7 <= $signed(reg6);
            end
        end
      else
        begin
          reg5 <= ((~|({(!reg6)} ? (&(-(7'h41))) : (|(^~reg7)))) + reg7);
          if ($unsigned($unsigned(reg5)))
            begin
              reg6 <= wire2;
              reg7 <= reg7;
              reg8 <= (reg5[(4'h9):(2'h2)] >>> $signed($signed(($signed(reg7) ?
                  $signed(wire2) : {wire3, (8'ha2)}))));
              reg9 <= reg6[(4'hd):(4'h9)];
              reg10 <= (reg6[(3'h4):(1'h1)] >>> wire3);
            end
          else
            begin
              reg6 <= ((reg10[(3'h5):(3'h4)] > ($unsigned($unsigned((8'h9f))) ?
                  reg7[(4'hc):(4'h9)] : ((~(7'h40)) + (reg10 ?
                      (8'ha6) : wire2)))) ^ reg8[(1'h0):(1'h0)]);
              reg7 <= reg8[(2'h2):(1'h1)];
            end
          reg11 <= $signed(reg9[(4'he):(4'hc)]);
        end
    end
  assign wire12 = reg5[(3'h5):(1'h0)];
  assign wire13 = reg8;
  assign wire14 = (~|reg11);
  assign wire15 = (reg4 == {$unsigned($signed((&wire3)))});
  assign wire16 = (+$unsigned((wire14 ? reg11 : reg6[(4'ha):(3'h4)])));
  always
    @(posedge clk) begin
      reg17 <= wire14[(5'h10):(4'hb)];
      reg18 <= $unsigned($unsigned((!$signed({reg9}))));
      reg19 <= wire3;
      reg20 <= ((wire14[(2'h3):(2'h2)] ?
          (8'ha1) : (($unsigned((8'hbd)) - $signed(wire3)) ^ $signed(reg9))) == (&$signed(wire0[(1'h1):(1'h0)])));
    end
  assign wire21 = (+wire15);
  assign wire22 = $signed($signed((!$signed((&reg20)))));
  assign wire23 = wire16[(3'h5):(2'h3)];
  assign wire24 = (-((((wire1 ? wire13 : wire13) || wire12) ?
                          (reg19 > (8'haa)) : (|(wire2 ? wire14 : (8'h9c)))) ?
                      $signed((((8'ha2) ? wire21 : wire13) ?
                          reg6[(3'h7):(3'h5)] : (8'hb8))) : wire22[(4'hc):(2'h2)]));
  assign wire25 = {($unsigned(wire12[(4'ha):(3'h6)]) ?
                          (-reg17[(1'h0):(1'h0)]) : (8'ha9)),
                      $unsigned(($unsigned(wire21) ?
                          (8'ha9) : ($unsigned(wire2) ?
                              (wire21 ^ wire23) : (reg7 ? reg18 : reg20))))};
  assign wire26 = wire3;
  assign wire27 = wire21;
  assign wire28 = reg20[(5'h10):(4'h8)];
  assign wire29 = (($signed($unsigned($signed((8'ha3)))) ?
                          (((7'h41) ?
                                  $unsigned((8'ha6)) : wire28[(3'h6):(2'h2)]) ?
                              {{wire1, wire12}} : $signed({wire0,
                                  reg11})) : $signed((reg10[(3'h4):(1'h1)] ?
                              $signed((8'hb0)) : (reg19 & wire13)))) ?
                      $signed(((wire0[(3'h4):(2'h3)] ?
                          wire15[(1'h1):(1'h1)] : reg20[(4'h9):(4'h9)]) <= wire13)) : (~^$signed($signed($unsigned((8'hbd))))));
  assign wire30 = (reg8 >> ($unsigned(((|wire15) ? wire21 : (8'ha0))) ?
                      (8'ha7) : {reg11[(2'h2):(2'h2)]}));
  assign wire31 = wire22[(4'h9):(1'h0)];
  assign wire32 = ($unsigned(wire2) > reg5[(1'h0):(1'h0)]);
  assign wire33 = $unsigned((~|$unsigned(wire23[(3'h4):(2'h3)])));
endmodule
