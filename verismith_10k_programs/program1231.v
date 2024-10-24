module top
#(parameter param21 = {(((~^((8'had) ? (8'hb3) : (8'ha9))) * (~(~&(8'hbf)))) ? (~&(((8'hb2) ? (8'hb4) : (8'hb4)) ? ((8'hbc) ? (8'hae) : (8'hbd)) : ((8'hb3) >= (8'hbd)))) : ((((7'h41) || (8'hab)) ? (~(7'h43)) : ((8'hbc) ? (8'hb9) : (8'hb5))) > ((^~(8'hb9)) ? {(7'h44)} : (&(7'h40))))), ((-((-(8'had)) - ((8'h9f) ? (8'hb7) : (8'ha1)))) - ((~|((8'hb4) || (7'h41))) >> ({(8'hb5)} ? ((8'hb5) >> (8'ha0)) : ((8'hb7) ? (8'hbe) : (8'hb8)))))}, 
parameter param22 = (~^(param21 | ((!param21) ? param21 : (param21 ? (&param21) : (-param21))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire20,
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
                 wire4,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {((8'hae) <<< $unsigned((|(8'hac)))), wire3};
  always
    @(posedge clk) begin
      reg5 <= wire3;
      reg6 <= ($signed((((wire4 >>> wire4) * wire0[(4'hc):(3'h6)]) ~^ wire4)) ?
          ($signed(((wire3 >>> wire3) ?
              {wire4} : reg5[(1'h0):(1'h0)])) >> wire2[(2'h2):(2'h2)]) : $unsigned({$signed(wire2[(1'h0):(1'h0)]),
              $signed(((7'h40) ? wire4 : (8'ha2)))}));
      reg7 <= $signed(wire0[(4'hb):(4'h9)]);
      reg8 <= $unsigned((({(wire0 > reg5), wire3[(3'h5):(2'h2)]} ?
              $signed($unsigned((8'haf))) : ($signed((8'ha3)) ?
                  (reg6 ? reg5 : reg5) : reg7[(2'h3):(2'h3)])) ?
          wire2[(1'h1):(1'h0)] : $signed(wire3[(3'h6):(1'h0)])));
    end
  assign wire9 = wire3[(3'h5):(1'h0)];
  assign wire10 = (-(+{({reg8, reg7} ? (8'hba) : reg7),
                      ($unsigned(wire4) ?
                          wire4[(4'h9):(1'h1)] : $signed(wire3))}));
  assign wire11 = (($unsigned((wire0[(3'h7):(3'h4)] ?
                      $signed((8'hbd)) : $unsigned(wire9))) || (((8'ha4) ?
                      (^wire9) : $signed(reg7)) && $unsigned((7'h44)))) >>> {{($signed(reg7) ~^ reg6),
                          $signed((reg8 ? wire0 : wire9))},
                      reg8});
  assign wire12 = (|$signed(wire2));
  assign wire13 = $unsigned((reg8 <<< (|((wire0 <= reg8) ?
                      (^~reg6) : (!wire10)))));
  assign wire14 = (|$unsigned($unsigned(wire4)));
  assign wire15 = wire11[(4'h9):(2'h2)];
  assign wire16 = wire3;
  assign wire17 = {(~(($unsigned(wire9) ?
                          (^wire1) : wire16) != ($signed(wire3) ?
                          (~^reg6) : $signed((8'ha8))))),
                      (^~(~(((8'hbb) ? wire13 : wire0) ~^ wire14)))};
  assign wire18 = $signed(($unsigned($unsigned($signed(wire16))) != (-wire15)));
  assign wire19 = wire12;
  assign wire20 = $unsigned(((8'ha9) ?
                      wire19 : (({(8'hb4)} ?
                              $signed(wire12) : (reg8 || wire15)) ?
                          $unsigned($unsigned(wire4)) : ($signed((8'hb3)) + ((7'h43) ~^ wire16)))));
endmodule
