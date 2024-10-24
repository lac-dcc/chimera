module top
#(parameter param17 = ({{(((8'haf) ? (8'h9d) : (7'h44)) ^~ ((8'hac) ? (8'hb4) : (8'hb9))), {{(8'ha8), (8'h9e)}, (!(8'haf))}}} < ((!((8'hbb) ? {(8'ha5), (7'h44)} : (^~(8'ha0)))) ? (((~(8'ha1)) + (&(8'ha2))) ? (+((8'ha5) || (7'h44))) : {{(8'hae), (8'hb2)}, (8'hb3)}) : ((8'ha3) ? ((-(7'h41)) ? (~|(8'haf)) : ((7'h44) ^~ (8'hb8))) : (!((8'hbd) ? (8'ha7) : (7'h41)))))), 
parameter param18 = ({(~param17)} ? ((((param17 - param17) ? (param17 <<< param17) : (!param17)) <= ((^param17) ^ (8'hb2))) ? ({(param17 ? (8'hbb) : (7'h44)), (param17 + param17)} * param17) : {({param17} >> (-(8'ha2)))}) : ((^~(~^(param17 ? param17 : (8'hb4)))) ? (((|param17) ? param17 : (param17 >> param17)) >= (((8'ha7) <= param17) ? param17 : (param17 ? (8'haf) : (8'hb2)))) : param17)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire16,
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
      reg4 <= wire2;
      if (wire2[(1'h0):(1'h0)])
        begin
          reg5 <= (($unsigned((reg4 >>> $signed(wire0))) ?
                  $unsigned(($unsigned(wire3) >>> wire0[(4'h8):(3'h5)])) : ($signed((wire2 ?
                      (8'h9d) : wire0)) <= ($unsigned(wire0) == (wire2 * wire2)))) ?
              wire2[(4'ha):(4'ha)] : (&$unsigned(((wire3 && wire2) | (wire3 ?
                  wire2 : (8'hb4))))));
          reg6 <= (reg4[(3'h4):(1'h1)] << ($unsigned(wire3) - $signed($signed((wire1 ?
              wire1 : (8'hba))))));
        end
      else
        begin
          reg5 <= ($unsigned(reg5) <= ({$signed($unsigned(reg5)), reg6} ?
              {(((8'h9d) || wire3) ? $signed(reg6) : $signed(wire0)),
                  (~^reg5)} : (&((|wire3) ?
                  wire0[(3'h6):(3'h4)] : (reg5 ? reg4 : wire0)))));
          reg6 <= (8'hbf);
          reg7 <= {(((&$unsigned((8'hac))) - (reg4[(2'h3):(1'h0)] | (8'hb6))) != wire2[(4'hb):(4'hb)]),
              (!wire1[(4'ha):(4'h9)])};
        end
    end
  assign wire8 = $unsigned((~(wire1 ?
                     wire2[(3'h7):(1'h1)] : $signed({wire1}))));
  assign wire9 = (~$unsigned(((-(reg4 >> reg5)) && reg7)));
  assign wire10 = (^~wire0[(3'h5):(3'h5)]);
  assign wire11 = wire9;
  assign wire12 = {(~|(+($signed(wire8) && reg6))), (|(8'h9f))};
  assign wire13 = reg7;
  assign wire14 = ($unsigned((-($signed(wire9) ?
                      reg7 : $unsigned(wire12)))) == (-($signed(wire3) ?
                      (&{wire1}) : (~&wire0[(4'h9):(2'h2)]))));
  assign wire15 = $unsigned(wire0);
  assign wire16 = wire9[(1'h1):(1'h0)];
endmodule
