module top
#(parameter param28 = (~|(((((8'hba) ? (7'h41) : (8'ha1)) & (^(8'hb9))) | (((8'haa) >= (7'h42)) ? ((7'h43) ? (7'h43) : (8'ha3)) : ((8'h9f) < (8'had)))) ? ((^~((8'ha8) ? (8'haf) : (8'hbe))) ? (((8'hbd) ? (8'hb8) : (8'ha1)) <= (~&(7'h41))) : ((~|(8'hb0)) ? ((8'haa) ? (8'haf) : (8'h9e)) : ((7'h41) ? (8'ha1) : (8'ha4)))) : (~(+(8'hab))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire23;
  assign y = {wire27, wire26, wire25, wire23, (1'h0)};
  module4 #() modinst24 (wire23, clk, wire3, wire1, wire2, wire0);
  assign wire25 = (&(((^$unsigned(wire1)) ?
                      ($unsigned(wire2) > wire2[(5'h11):(1'h0)]) : (wire1[(4'hd):(4'hb)] << $unsigned((7'h42)))) + $signed($unsigned($signed(wire3)))));
  assign wire26 = (~|wire23);
  assign wire27 = $unsigned(((wire26[(3'h6):(3'h6)] ?
                          (8'hb3) : $unsigned(wire1[(3'h7):(3'h4)])) ?
                      wire3 : ($unsigned((wire3 < wire0)) ?
                          wire1 : $unsigned((wire0 >= wire0)))));
endmodule

module module4
#(parameter param22 = (((+(((8'hb3) ? (8'hbf) : (8'hbd)) ? (+(8'ha1)) : ((8'haa) == (8'ha1)))) <= (8'ha8)) && (^~(+(((8'hba) ? (8'hb1) : (8'hb1)) ? (&(8'haa)) : {(8'ha4), (8'h9f)})))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire6;
  input wire [(4'hb):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire9 = {($signed($unsigned($unsigned(wire6))) == (wire8 - $signed($unsigned(wire6))))};
  assign wire10 = wire5[(4'ha):(1'h1)];
  assign wire11 = ($signed($unsigned($signed((|(7'h42))))) ?
                      ((8'hbb) >> (((wire7 ?
                              wire10 : wire10) == $unsigned((8'hb1))) ?
                          (wire5 ? wire10 : (!wire5)) : ($unsigned((8'haa)) ?
                              (8'ha4) : (~&wire8)))) : (($unsigned(wire6[(3'h7):(3'h5)]) >> $signed($unsigned(wire10))) <= ((~|wire7) ?
                          $signed(wire8) : $unsigned((wire10 < wire9)))));
  assign wire12 = wire10;
  always
    @(posedge clk) begin
      if (wire11[(5'h12):(4'hb)])
        begin
          reg13 <= $signed((wire12[(2'h2):(1'h1)] ~^ (~|$signed((^~wire7)))));
          if (wire5[(4'h9):(3'h7)])
            begin
              reg14 <= (wire10[(1'h0):(1'h0)] ?
                  reg13[(4'h8):(4'h8)] : $signed($signed(wire6[(4'hf):(4'hf)])));
              reg15 <= {$unsigned((^~$unsigned(reg13[(4'h9):(2'h2)])))};
            end
          else
            begin
              reg14 <= (wire6 ^~ {(~&reg13)});
            end
        end
      else
        begin
          reg13 <= (^~wire5[(4'h9):(2'h2)]);
        end
      reg16 <= (+((reg15[(3'h4):(3'h4)] ? $signed(wire12) : reg14) ?
          wire12[(2'h3):(1'h1)] : $signed({(wire11 != reg13),
              wire5[(3'h7):(1'h1)]})));
      if (reg15[(2'h3):(1'h1)])
        begin
          reg17 <= (wire10 ?
              $unsigned(wire12) : {($signed((-wire7)) ?
                      $unsigned((~^(8'hbb))) : (wire8[(3'h4):(1'h1)] ^ (!wire8)))});
          reg18 <= {{$unsigned(reg14), wire6[(4'hc):(4'hc)]}, wire8};
        end
      else
        begin
          reg17 <= wire5[(4'hb):(3'h4)];
        end
      reg19 <= (8'hb9);
    end
  assign wire20 = wire10;
  assign wire21 = (~$unsigned($unsigned(($signed(wire8) ?
                      $signed(reg14) : ((8'ha0) ^~ wire20)))));
endmodule
