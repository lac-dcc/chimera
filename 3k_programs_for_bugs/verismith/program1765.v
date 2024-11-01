module top
#(parameter param19 = ({((((7'h44) * (8'haf)) * (~^(8'hbb))) ? (&{(8'ha6)}) : (~|((8'hac) | (8'ha8))))} >> ((((|(8'ha1)) | ((7'h42) << (8'hb5))) > {(^~(8'ha5)), ((8'hac) >= (8'ha3))}) <= ((+{(8'ha1)}) ? (|(^(7'h43))) : ({(8'haa)} << (8'ha4))))), 
parameter param20 = ((param19 ? (!(~&(param19 ? param19 : param19))) : (&({param19} ? param19 : param19))) ? ({(param19 ? (param19 >= param19) : param19)} != {((param19 ^ param19) + (param19 >>> param19))}) : (((param19 ? (param19 ? param19 : param19) : (param19 >>> param19)) || (8'hb2)) ? param19 : ({(param19 ? param19 : (8'hb1)), (param19 | param19)} - {(param19 ? param19 : param19), (param19 && param19)}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  assign y = {wire18,
                 wire16,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg15,
                 (1'h0)};
  assign wire5 = (~$unsigned((wire2[(1'h1):(1'h0)] ?
                     $signed(wire2) : wire0[(3'h4):(1'h0)])));
  assign wire6 = ($signed(((|(wire3 ?
                         wire3 : wire1)) >>> $unsigned($signed(wire0)))) ?
                     $signed($unsigned({(wire0 - wire1),
                         wire3})) : $signed($unsigned(wire4)));
  assign wire7 = ($unsigned((((wire1 > wire3) != wire2) ?
                         wire4[(3'h7):(1'h0)] : wire2)) ?
                     $signed($unsigned((wire3 ?
                         $signed(wire4) : (|wire5)))) : wire2[(3'h5):(1'h1)]);
  assign wire8 = $signed($signed({(wire4[(2'h2):(1'h1)] <= wire5)}));
  assign wire9 = wire8[(4'hc):(1'h1)];
  assign wire10 = ((wire1[(3'h5):(1'h1)] ?
                      $unsigned((8'ha5)) : wire2) - ((~|{wire2, (&wire0)}) ?
                      wire5 : ({$signed(wire7)} >>> {(wire8 ? wire7 : (8'hbd)),
                          (^~wire8)})));
  assign wire11 = $unsigned(((wire3[(3'h5):(2'h3)] ^~ {(wire2 * wire2)}) ?
                      ({(wire10 << wire1),
                          (wire8 - wire7)} ^~ wire1[(1'h1):(1'h1)]) : ((wire5[(3'h6):(3'h5)] ?
                              ((8'ha4) ? wire4 : wire8) : ((8'hb1) || wire2)) ?
                          $signed($signed(wire9)) : ($signed(wire0) ?
                              $signed((8'h9e)) : {wire10}))));
  assign wire12 = $signed($signed($signed($signed((8'hb9)))));
  assign wire13 = ($signed({$unsigned($signed(wire5))}) ?
                      $signed((wire12 ?
                          wire3 : (~|wire2[(3'h4):(2'h2)]))) : {(+(&(8'hbd))),
                          $signed(wire0)});
  assign wire14 = $signed(wire13[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg15 <= wire1;
    end
  assign wire16 = wire1;
  always
    @(posedge clk) begin
      reg17 <= ($unsigned(wire0) ?
          wire14 : {(wire6[(2'h2):(2'h2)] ?
                  (wire2 ? $signed(wire9) : wire9) : (8'hbe))});
    end
  assign wire18 = {reg17};
endmodule
