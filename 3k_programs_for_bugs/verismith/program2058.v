module top
#(parameter param21 = {((~&({(8'hb4)} <= ((8'had) + (8'ha1)))) != ((^~(|(8'ha3))) * (((7'h41) ? (7'h40) : (8'haa)) ? {(8'hb6)} : ((8'ha4) ^ (8'h9f)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire14,
                 wire13,
                 wire12,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = wire4[(2'h2):(2'h2)];
  assign wire6 = wire0[(4'hd):(4'hd)];
  assign wire7 = ($signed((!$signed(wire5[(4'h9):(1'h1)]))) <= (wire0 <<< ({(wire1 + wire0),
                         $unsigned((8'ha0))} ?
                     {(8'haa), ((8'ha8) >>> wire2)} : ((wire2 ?
                         wire2 : wire0) + (|wire0)))));
  assign wire8 = (wire1[(2'h3):(2'h2)] ?
                     $unsigned(wire3) : ($unsigned($unsigned((wire1 ?
                             wire7 : wire7))) ?
                         (wire1 > (wire3[(4'hd):(4'hc)] ?
                             (&wire1) : {wire4})) : $signed(wire3[(4'hb):(4'ha)])));
  assign wire9 = (((^((wire2 < wire8) ? $unsigned(wire3) : ((8'ha9) ^ wire7))) ?
                     $unsigned((wire3[(4'hc):(1'h1)] <<< wire7)) : (~wire6)) ^~ wire6);
  always
    @(posedge clk) begin
      reg10 <= (|wire4);
      reg11 <= ($signed($signed($signed({wire3,
          (8'hba)}))) + wire8[(2'h2):(2'h2)]);
    end
  assign wire12 = $signed(wire5[(4'ha):(3'h5)]);
  assign wire13 = wire12;
  assign wire14 = $signed((~$signed(wire8[(4'hc):(3'h7)])));
  always
    @(posedge clk) begin
      reg15 <= wire9[(2'h2):(2'h2)];
      reg16 <= wire14;
      reg17 <= wire7[(3'h5):(1'h0)];
      reg18 <= {$signed(reg15), wire5};
    end
  assign wire19 = $unsigned($signed($unsigned(wire5)));
  assign wire20 = (!$unsigned((wire4 ^ wire4)));
endmodule
