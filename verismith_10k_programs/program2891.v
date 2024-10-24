module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {{($unsigned((!wire2)) && (wire0 ?
                  $unsigned(wire1) : $unsigned(wire2)))},
          (((8'hbd) + (wire0[(2'h3):(1'h0)] ?
                  wire3[(1'h0):(1'h0)] : (wire1 & wire2))) ?
              wire3 : {{wire2, (wire3 <<< wire1)}})};
      reg5 <= $unsigned((~&(^~wire0[(2'h2):(1'h1)])));
      reg6 <= (wire0 ?
          $signed($signed($signed($signed(wire0)))) : wire1[(3'h6):(3'h4)]);
      reg7 <= ((wire0 < ({wire2, {reg6}} <<< $signed($signed(wire1)))) ?
          (~reg6) : wire0[(1'h0):(1'h0)]);
    end
  assign wire8 = ((~(~((^~wire0) ?
                     {wire1, reg5} : {reg6,
                         reg5}))) >>> ((reg6[(5'h11):(4'ha)] >> $unsigned($unsigned(reg5))) ?
                     {((+reg4) ?
                             (reg7 ?
                                 (8'hbc) : (8'hab)) : wire0)} : $unsigned(({(8'haa)} & $signed(wire2)))));
  assign wire9 = $unsigned($signed((($unsigned(wire0) >= (reg6 == wire8)) > $signed((8'hbe)))));
  assign wire10 = $signed($signed($unsigned((^(reg4 ? wire8 : reg6)))));
  assign wire11 = (wire8 + $signed((7'h43)));
  assign wire12 = reg4[(4'hc):(3'h7)];
  assign wire13 = (^~(({$signed(wire1)} <<< $signed((~reg6))) ?
                      $unsigned(($unsigned(reg6) ?
                          wire12 : (reg7 >= (8'ha1)))) : $signed((~&$unsigned(reg5)))));
  assign wire14 = (wire0 & {{$unsigned((&wire8)), reg4}});
  assign wire15 = $unsigned(wire14);
  assign wire16 = $signed((~^(((8'hb1) ? wire10[(3'h5):(1'h0)] : wire9) ?
                      (wire1[(3'h5):(1'h1)] & (~wire13)) : reg7)));
  assign wire17 = reg4[(4'hf):(4'h8)];
  assign wire18 = (8'ha8);
  assign wire19 = ($signed($unsigned(($unsigned(wire18) ?
                          (reg4 ? (8'hbb) : (8'ha3)) : wire17))) ?
                      wire12 : $unsigned(wire13[(2'h3):(2'h3)]));
  assign wire20 = $signed(wire19[(3'h5):(1'h1)]);
  assign wire21 = $unsigned($unsigned(wire16));
  assign wire22 = $signed(($unsigned(($unsigned(wire11) > (wire1 ?
                      reg6 : wire10))) || (8'hbc)));
  assign wire23 = ((~|{wire1}) ?
                      reg4[(3'h7):(3'h6)] : $unsigned(wire0[(1'h0):(1'h0)]));
  assign wire24 = (wire17[(3'h4):(3'h4)] <= ((&($unsigned((8'hb8)) ?
                          ((8'hac) ? (8'hbd) : wire15) : $signed(reg6))) ?
                      (7'h44) : $signed($signed($signed(wire23)))));
  assign wire25 = wire2;
endmodule
