module top #(parameter param38 = (8'h9e)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire16;
  assign y = {wire37,
                 wire35,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire16,
                 (1'h0)};
  module4 #() modinst17 (wire16, clk, wire0, wire2, wire3, wire1);
  assign wire18 = ((wire1 ?
                      $signed((wire3[(2'h3):(2'h3)] ?
                          wire3[(2'h2):(1'h1)] : wire2)) : $unsigned((wire3 ?
                          $unsigned(wire16) : (^wire0)))) <= $unsigned(($unsigned({wire3}) >= wire1)));
  assign wire19 = (((+{(wire16 != wire3), (~wire2)}) ?
                      $unsigned($unsigned((!wire18))) : wire16) != $signed(wire0[(2'h3):(1'h0)]));
  assign wire20 = ((((wire3 ^~ wire16) ?
                              wire2 : ($signed(wire1) ?
                                  wire0[(4'hc):(4'hc)] : wire18)) ?
                          (7'h42) : wire2) ?
                      wire2 : (~$unsigned(((8'hba) ^ $signed(wire3)))));
  assign wire21 = $signed($unsigned((((wire0 ? wire2 : wire2) ?
                      (~|wire2) : (wire2 < wire3)) >= wire2[(4'ha):(3'h6)])));
  assign wire22 = ($unsigned($signed($unsigned(wire20[(1'h0):(1'h0)]))) ?
                      {(((wire2 >= (8'hab)) ?
                              $signed(wire18) : wire16[(4'hf):(3'h6)]) << $unsigned((&wire21)))} : (~|wire19));
  assign wire23 = $unsigned($signed(wire19[(4'hd):(4'h8)]));
  assign wire24 = wire3[(3'h7):(1'h0)];
  module25 #() modinst36 (wire35, clk, wire19, wire23, wire16, wire0);
  assign wire37 = wire22;
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire29;
  input wire [(4'he):(1'h0)] wire28;
  input wire signed [(4'hb):(1'h0)] wire27;
  input wire [(4'h9):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  assign y = {wire32, wire31, wire30, reg34, reg33, (1'h0)};
  assign wire30 = ({(wire29 ^ $unsigned(wire27)),
                      ((~(wire29 ? wire28 : wire29)) ^~ wire27)} ~^ (~wire26));
  assign wire31 = wire28;
  assign wire32 = (|wire27[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg33 <= wire27[(3'h6):(1'h1)];
      reg34 <= $unsigned({((~&((8'hbe) ~^ wire26)) && wire27)});
    end
endmodule

module module4
#(parameter param14 = (^(&(|(((8'hbf) >= (7'h40)) ? (~&(8'ha9)) : (^(8'hb9)))))), 
parameter param15 = param14)
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire6;
  input wire signed [(3'h7):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  assign y = {wire13, wire12, wire10, wire9, reg11, (1'h0)};
  assign wire9 = $signed((!wire7[(1'h0):(1'h0)]));
  assign wire10 = ({(8'h9e)} ?
                      $unsigned(($signed(wire6) ?
                          {(wire5 ?
                                  wire8 : wire7)} : wire8)) : $signed($unsigned(((wire5 || wire5) > wire5))));
  always
    @(posedge clk) begin
      reg11 <= (wire10[(5'h10):(3'h4)] ?
          $unsigned(wire7) : wire10[(3'h4):(1'h1)]);
    end
  assign wire12 = (($unsigned((^~$unsigned(wire6))) ?
                      ((~^wire6) < $signed((|wire5))) : $unsigned({(~|wire6)})) >= wire7[(1'h1):(1'h1)]);
  assign wire13 = ($unsigned(wire5) ?
                      $signed((wire6[(3'h5):(3'h5)] ?
                          (~^$unsigned(wire5)) : (wire12[(3'h5):(2'h2)] ?
                              (wire10 ?
                                  wire5 : wire7) : wire12[(2'h3):(1'h0)]))) : wire9[(1'h1):(1'h1)]);
endmodule
