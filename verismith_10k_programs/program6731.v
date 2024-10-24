module top
#(parameter param27 = {{(~^(((7'h42) * (8'hb8)) ? (-(8'h9c)) : ((8'hbf) ? (8'hb5) : (8'h9c)))), {(((7'h40) ? (8'hb8) : (8'hab)) ? ((8'hbc) ? (8'ha5) : (8'hac)) : ((8'ha2) <= (8'had))), {{(8'hae)}}}}}, 
parameter param28 = ((^(~((param27 ? param27 : param27) >= (param27 ? (7'h41) : param27)))) ? (8'haa) : param27))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = {$unsigned($unsigned((wire3[(4'hf):(4'hf)] ?
                         wire0[(1'h1):(1'h1)] : (7'h44)))),
                     wire4};
  assign wire6 = $unsigned(wire4);
  assign wire7 = wire2[(3'h7):(3'h6)];
  assign wire8 = wire3;
  assign wire9 = (~&$signed($signed(wire4[(4'he):(2'h2)])));
  always
    @(posedge clk) begin
      reg10 <= ($unsigned($unsigned((~&$signed(wire2)))) ?
          {wire3[(4'ha):(1'h0)]} : (wire1 == ($signed(wire2[(4'hf):(2'h2)]) ?
              {wire4, (wire1 <= wire6)} : ($signed(wire3) ?
                  wire5[(1'h0):(1'h0)] : $signed(wire4)))));
      reg11 <= wire8;
      reg12 <= (8'haa);
    end
  assign wire13 = $unsigned($unsigned(wire0[(3'h4):(3'h4)]));
  assign wire14 = $signed(((wire0 && wire6) << wire8[(3'h7):(3'h7)]));
  assign wire15 = (wire6[(3'h4):(3'h4)] ?
                      (8'hb3) : ($unsigned(reg10) ?
                          (&((wire3 <<< wire1) ?
                              $unsigned(wire2) : wire8)) : ((wire9[(3'h5):(3'h5)] <= (wire1 ?
                              (7'h44) : wire2)) != {$signed(wire2),
                              (reg11 ^~ (8'hb0))})));
  assign wire16 = (reg11 ?
                      (~$unsigned((~|{wire2, reg10}))) : (($unsigned((wire5 ?
                          wire2 : (8'ha9))) < wire9[(1'h1):(1'h0)]) & ($signed($signed(wire8)) || $unsigned(wire13[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg17 <= (($unsigned({(reg11 && wire8), (wire9 << wire15)}) > (wire8 ?
          ($signed((8'hb9)) ^ (~&wire4)) : $signed((wire16 == (8'hbe))))) >>> (($unsigned($signed((8'h9c))) << wire9) < ($unsigned($unsigned(reg11)) | wire5[(3'h4):(2'h3)])));
      reg18 <= ($signed($unsigned($signed((wire13 ?
          wire5 : reg17)))) - $unsigned({reg17, (~wire3[(4'hc):(1'h0)])}));
      reg19 <= (~&wire8);
      reg20 <= reg17;
      reg21 <= {$unsigned((wire14[(3'h4):(1'h1)] ?
              ($signed(wire7) ?
                  reg20 : (reg19 ?
                      reg18 : wire4)) : (^~wire7[(4'h8):(4'h8)])))};
    end
  assign wire22 = wire3;
  assign wire23 = (^$unsigned((8'hbb)));
  assign wire24 = $signed(wire4[(3'h7):(2'h3)]);
  assign wire25 = wire4;
  assign wire26 = $signed($signed(wire14));
endmodule
