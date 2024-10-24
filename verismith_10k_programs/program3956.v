module top
#(parameter param23 = ((((~{(8'ha4), (8'h9f)}) & {((8'hb9) - (8'hab)), {(8'hb3), (7'h43)}}) == ({((8'hb2) <<< (8'ha2)), ((8'hbf) << (8'hb1))} ? (~^((8'hbd) + (8'hbd))) : ({(8'hb9)} << ((8'hb5) ^~ (8'h9c))))) ? ({(((8'hab) ^~ (7'h41)) ? ((8'hb4) | (8'hb5)) : ((8'hb0) < (8'ha2)))} ? (^~(+((8'ha5) ? (8'haf) : (8'hb0)))) : ((^((8'hbf) ? (8'hb6) : (8'ha7))) ? (((8'had) ? (8'h9c) : (8'hb7)) >>> {(8'ha9), (7'h41)}) : (~|((8'ha5) ~^ (8'hb3))))) : ({({(8'hb6), (8'haa)} <= ((8'ha9) <= (8'hb3))), (8'hac)} * ((^~(!(7'h43))) - {((8'ha8) ? (8'ha2) : (8'ha5)), ((8'hb9) ? (8'ha0) : (7'h43))}))), 
parameter param24 = ((((^~(param23 ? param23 : param23)) ? {(param23 ~^ param23), param23} : (param23 && (param23 ? param23 : param23))) <= ((+(~param23)) - {param23})) ? ((({param23, param23} ? {param23} : param23) ? {param23, param23} : param23) ? param23 : (8'had)) : (param23 ? param23 : ((^{param23}) != ((&param23) > (~|param23))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg12,
                 (1'h0)};
  assign wire4 = wire1[(3'h5):(2'h2)];
  assign wire5 = wire1[(4'ha):(4'h9)];
  assign wire6 = (((wire0[(2'h3):(2'h3)] ?
                         {(wire3 ?
                                 wire0 : wire1)} : wire1[(2'h3):(2'h2)]) << ((8'ha4) >= {wire4})) ?
                     (wire0 ?
                         $signed($signed(wire1[(3'h5):(1'h0)])) : $unsigned((^~(wire4 + wire0)))) : ((+$signed((!wire0))) < (!(wire4 * wire4[(3'h6):(2'h3)]))));
  assign wire7 = $unsigned((|(7'h43)));
  assign wire8 = wire7;
  assign wire9 = (8'hb1);
  assign wire10 = ($signed((!wire4[(3'h6):(3'h6)])) || $signed(wire1));
  assign wire11 = (~|$signed($signed(($unsigned(wire7) ?
                      {wire9} : $signed(wire6)))));
  always
    @(posedge clk) begin
      reg12 <= (wire4 ?
          $signed({({wire10} >= wire10[(5'h12):(5'h11)]),
              ((wire1 || wire5) >= $signed((8'h9f)))}) : (((8'hba) >>> (-(wire6 ?
                  wire0 : wire10))) ?
              {$unsigned((wire8 ? wire8 : wire11)),
                  (!$signed((7'h43)))} : $unsigned($signed((!wire4)))));
    end
  assign wire13 = wire7;
  assign wire14 = $unsigned((((^wire9) ?
                      wire8 : wire10) + wire7[(1'h1):(1'h1)]));
  assign wire15 = wire5;
  assign wire16 = (&$unsigned(($signed(wire9[(3'h5):(1'h0)]) ?
                      $unsigned($signed(wire15)) : $unsigned({wire0, wire2}))));
  always
    @(posedge clk) begin
      reg17 <= (~&($unsigned(wire0) >> (({wire9} ?
          (&(8'ha0)) : (wire16 ?
              wire13 : (8'h9d))) >= (wire10[(5'h13):(4'h8)] || {wire5}))));
    end
  always
    @(posedge clk) begin
      if (($signed($signed(wire7[(1'h0):(1'h0)])) ?
          (((wire16 >= (wire16 ^~ wire0)) ?
                  ($signed(wire14) ? reg17 : (~wire4)) : $signed((^wire15))) ?
              (|(wire9 ? wire9[(3'h5):(2'h3)] : wire3)) : ((&$signed(wire1)) ?
                  wire6[(3'h7):(2'h2)] : ($unsigned(wire16) ?
                      (wire10 ?
                          wire11 : wire6) : (wire6 >>> (8'h9c))))) : wire13))
        begin
          reg18 <= $signed($signed(wire10[(5'h11):(1'h1)]));
          reg19 <= (^~$unsigned($unsigned(($unsigned(wire13) ?
              wire13 : (|wire11)))));
          reg20 <= wire4[(3'h7):(3'h7)];
        end
      else
        begin
          reg18 <= wire11;
          reg19 <= (((!$signed((8'hb3))) ?
              (|$signed($signed((8'hb2)))) : reg19) ^~ wire3);
        end
      if ({$unsigned(wire5[(1'h1):(1'h0)]),
          ((~|($unsigned(wire1) <= $unsigned(wire6))) <<< wire10[(3'h5):(2'h2)])})
        begin
          reg21 <= reg18;
          reg22 <= ((~&$unsigned((wire6 ?
                  ((8'hb2) >= wire8) : ((7'h40) >> wire2)))) ?
              wire5[(1'h0):(1'h0)] : (8'hb1));
        end
      else
        begin
          reg21 <= $signed($unsigned(wire4[(2'h3):(2'h2)]));
          reg22 <= $signed($unsigned((7'h41)));
        end
    end
endmodule
