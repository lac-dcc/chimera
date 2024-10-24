module top
#(parameter param29 = ((((^~((8'hb2) ? (8'ha0) : (8'h9c))) ? {{(8'ha3), (8'hbf)}} : (&((8'hbf) & (8'ha8)))) ? (8'hbd) : ({(~|(8'ha4)), {(8'h9c)}} <= ({(8'hb7), (8'h9c)} ? (+(8'ha1)) : (8'hac)))) < ((-(((8'h9c) < (8'ha7)) != ((8'hbf) ~^ (8'hbb)))) && (({(8'ha3), (8'hb2)} <= ((8'ha6) ? (8'hac) : (8'haa))) | {((8'ha7) ^~ (8'h9d))}))), 
parameter param30 = ({(8'ha5), {{param29}}} ? param29 : ((((param29 - param29) ^ (~^param29)) ? (param29 ? param29 : ((8'ha6) ^ param29)) : param29) ? param29 : (param29 ^~ ((~&param29) ? (param29 < param29) : param29)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire28,
                 wire26,
                 wire14,
                 wire13,
                 wire12,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(((wire0 ~^ wire0[(3'h4):(3'h4)]) != ($unsigned(wire1) <<< wire0))) & $signed($unsigned($signed(wire2[(5'h12):(2'h3)])))))
        begin
          if ((wire3[(2'h2):(2'h2)] ?
              wire0[(3'h4):(3'h4)] : (-(~|(!(&(8'ha3)))))))
            begin
              reg4 <= wire1;
              reg5 <= $signed((~|reg4));
              reg6 <= reg5[(4'h8):(3'h4)];
            end
          else
            begin
              reg4 <= (reg4[(4'hc):(3'h4)] ?
                  ((^~$signed($signed((8'ha8)))) ?
                      (reg6 * (wire1 ?
                          $signed(wire3) : (reg4 << (8'ha1)))) : reg4[(3'h6):(3'h4)]) : reg4);
              reg5 <= reg4;
              reg6 <= (~|((~|reg6[(1'h1):(1'h1)]) ^ wire3));
              reg7 <= (-$unsigned(wire3));
            end
          reg8 <= ((reg5 ?
                  ($unsigned((wire2 >> wire0)) ^~ (wire0 <= {wire3,
                      reg7})) : (|wire1)) ?
              {{reg6[(3'h5):(2'h2)], $signed($unsigned(wire0))}} : (~&((wire3 ?
                  {reg5, wire3} : (+reg4)) + ({wire3,
                  reg6} || $signed(wire3)))));
          reg9 <= (8'hbc);
          reg10 <= (reg5[(3'h7):(3'h5)] != wire1[(1'h1):(1'h0)]);
          reg11 <= (^reg5);
        end
      else
        begin
          reg4 <= wire2[(4'he):(1'h1)];
          reg5 <= ((wire2[(4'ha):(2'h3)] ?
                  (reg8 + wire2[(5'h11):(4'hc)]) : wire1) ?
              wire0 : (8'haa));
          if (reg4[(3'h6):(1'h0)])
            begin
              reg6 <= wire3;
              reg7 <= $signed(((reg10[(5'h15):(4'hc)] ?
                      ({reg9} ?
                          $signed(wire1) : ((8'ha7) ?
                              wire2 : reg4)) : wire3[(2'h3):(1'h0)]) ?
                  reg4[(4'h9):(2'h2)] : (8'ha8)));
              reg8 <= $unsigned($signed((8'hb7)));
            end
          else
            begin
              reg6 <= ((|$signed($signed($unsigned(reg5)))) ?
                  $unsigned(wire1[(4'hb):(3'h4)]) : reg4);
            end
          reg9 <= (reg5 || $unsigned($unsigned((reg4[(4'hc):(3'h7)] || (^~reg11)))));
        end
    end
  assign wire12 = $unsigned((reg9[(4'ha):(1'h1)] ?
                      ({(wire3 <<< reg11)} == (&{reg7,
                          reg4})) : ($unsigned($signed(wire1)) ?
                          (-(+reg6)) : wire0[(3'h7):(3'h6)])));
  assign wire13 = $signed(reg8);
  assign wire14 = wire13[(4'ha):(3'h5)];
  module15 #() modinst27 (wire26, clk, reg7, wire1, reg8, wire13, reg11);
  assign wire28 = (wire14[(4'h9):(2'h2)] > (^$unsigned((((7'h44) ?
                          reg4 : reg4) ?
                      reg11[(4'hc):(3'h7)] : $signed(reg4)))));
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  assign y = {wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = ((+{($unsigned(wire19) >> $signed(wire17)),
                      ((wire17 ? wire16 : wire19) || (wire20 ?
                          wire16 : wire19))}) != wire19[(1'h1):(1'h0)]);
  assign wire22 = ($unsigned(wire20) >> (wire18[(1'h1):(1'h0)] ?
                      wire17[(3'h4):(2'h2)] : (!{(wire20 ?
                              (8'hb6) : wire17)})));
  assign wire23 = $signed($signed($signed(((wire19 ?
                      wire17 : wire20) <<< (!(8'ha6))))));
  assign wire24 = {(7'h42), wire23[(3'h4):(1'h0)]};
  assign wire25 = $unsigned((($unsigned(wire22[(1'h0):(1'h0)]) ?
                          (wire16[(4'hc):(2'h2)] + wire23) : (wire23[(2'h2):(2'h2)] && $signed(wire23))) ?
                      $signed(wire19) : ({wire19} || wire19)));
endmodule
