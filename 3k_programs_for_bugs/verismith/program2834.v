module top
#(parameter param24 = (^~{(-(((8'hb9) == (8'hb8)) ? ((8'hb6) - (8'ha1)) : ((8'ha1) ? (8'ha9) : (8'ha2)))), (|{((8'had) ? (8'hbb) : (7'h44))})}), 
parameter param25 = param24)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire23,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned($signed({$unsigned(wire3[(1'h1):(1'h1)])}));
      reg6 <= wire2;
      if ((8'hb1))
        begin
          if (reg6[(1'h1):(1'h1)])
            begin
              reg7 <= (&(-$unsigned(reg5[(1'h0):(1'h0)])));
              reg8 <= ($unsigned(((~^{wire0, reg5}) ?
                      ($unsigned(reg6) < {(8'ha6)}) : wire0[(3'h5):(1'h1)])) ?
                  {(-{wire4[(5'h13):(1'h1)],
                          (~&wire2)})} : $unsigned($signed(reg5)));
              reg9 <= (wire1 ?
                  wire0[(1'h0):(1'h0)] : (reg6[(1'h0):(1'h0)] ?
                      wire0 : {wire1}));
              reg10 <= {wire0[(3'h4):(1'h0)]};
            end
          else
            begin
              reg7 <= $unsigned((~((+(8'ha3)) ?
                  ((7'h40) ^~ (reg9 != wire0)) : (~^{wire2}))));
              reg8 <= $unsigned(reg8);
              reg9 <= wire2[(2'h3):(1'h0)];
            end
        end
      else
        begin
          reg7 <= (((~&wire0) ?
                  ((~|$signed(wire3)) - $signed(reg7[(4'h9):(2'h3)])) : $unsigned($unsigned(reg7))) ?
              $unsigned(((~wire4) | $unsigned(reg9[(2'h3):(2'h2)]))) : reg9[(3'h6):(3'h6)]);
        end
      reg11 <= ({(&wire1[(3'h6):(1'h1)])} ?
          (reg8 ^~ reg9) : (~reg6[(2'h2):(1'h0)]));
    end
  assign wire12 = ($unsigned(((~^(wire1 < (8'ha9))) ?
                      wire2[(4'ha):(2'h3)] : $unsigned(wire2[(5'h11):(4'h8)]))) << {(^((wire4 >> reg6) != {wire2,
                          reg8})),
                      {(~^$unsigned((8'hbb))),
                          $signed((reg5 ? (7'h42) : reg6))}});
  assign wire13 = $unsigned($unsigned($unsigned(reg7[(3'h7):(2'h3)])));
  assign wire14 = wire13[(3'h4):(3'h4)];
  assign wire15 = $signed(reg5[(1'h1):(1'h0)]);
  assign wire16 = $unsigned($unsigned((8'haf)));
  always
    @(posedge clk) begin
      reg17 <= (((8'hae) <<< $unsigned((reg5[(1'h1):(1'h1)] ?
              $unsigned(reg10) : reg5))) ?
          wire14[(5'h10):(4'ha)] : ($signed($signed((wire14 <= (8'ha4)))) * wire0[(2'h2):(1'h1)]));
      reg18 <= wire0[(2'h2):(2'h2)];
      if (wire14)
        begin
          reg19 <= reg5;
          reg20 <= wire12[(5'h15):(4'h8)];
          reg21 <= reg5[(1'h0):(1'h0)];
          reg22 <= reg8;
        end
      else
        begin
          reg19 <= (~reg10[(3'h6):(1'h0)]);
          reg20 <= wire1[(2'h3):(1'h1)];
        end
    end
  assign wire23 = ({$signed((-reg5[(2'h3):(1'h1)])),
                      {(^wire1), (8'ha3)}} && (~&reg5));
endmodule
