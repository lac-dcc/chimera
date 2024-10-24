module top
#(parameter param27 = {(~(|(((8'hb6) << (8'h9c)) ? ((8'ha5) >= (8'ha6)) : ((8'haf) + (8'ha2))))), ((^~({(8'hb7), (8'hac)} ? ((8'ha1) ? (8'haf) : (8'hb3)) : ((8'hb2) ? (8'hb5) : (7'h40)))) ? {(|(|(8'ha8)))} : (~&(~^((7'h43) ? (8'ha8) : (8'hb7)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire11,
                 wire10,
                 wire5,
                 wire4,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg19,
                 reg13,
                 reg12,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = $signed((^$unsigned((~|(^~wire3)))));
  always
    @(posedge clk) begin
      reg6 <= (^~(~$signed((8'ha8))));
      reg7 <= $signed((^~(!(^~(-(8'ha9))))));
      reg8 <= {wire5[(1'h0):(1'h0)]};
      reg9 <= (+($unsigned(wire4) ?
          ($unsigned(wire5[(3'h4):(3'h4)]) == (wire4[(2'h2):(2'h2)] <= (+(8'hbf)))) : ($unsigned({reg8,
              reg8}) - (~^(reg6 + reg7)))));
    end
  assign wire10 = (8'hab);
  assign wire11 = (wire10[(5'h14):(2'h3)] ?
                      reg6[(4'ha):(3'h6)] : $unsigned(reg6[(5'h14):(4'hf)]));
  always
    @(posedge clk) begin
      reg12 <= $unsigned((((-{reg7, wire3}) && (&reg7)) | $unsigned({(&wire3),
          {reg8, wire2}})));
      reg13 <= $unsigned($unsigned(wire2));
    end
  assign wire14 = (8'hbf);
  assign wire15 = (reg7[(2'h3):(1'h0)] > ({$unsigned((+wire11))} ?
                      wire4[(1'h0):(1'h0)] : (~^$signed((~wire10)))));
  assign wire16 = $signed((wire11 >>> $unsigned((|wire3[(1'h0):(1'h0)]))));
  assign wire17 = $signed((~&((^~wire14[(5'h15):(4'hf)]) ^ {$signed(wire0)})));
  assign wire18 = ({((|((8'hb1) ? (8'hbc) : (8'hb1))) * ((^~wire0) ?
                              wire4 : wire11[(3'h6):(3'h4)]))} ?
                      reg9[(1'h1):(1'h1)] : (wire16 ?
                          $unsigned((|$signed(wire4))) : wire2[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg19 <= ({(reg8 + wire17[(1'h0):(1'h0)]),
              ($unsigned(wire18[(2'h3):(2'h2)]) ^ $signed((-wire3)))} ?
          $signed((reg13 + (-$unsigned(wire1)))) : reg9[(4'hd):(3'h4)]);
    end
  assign wire20 = ((!($unsigned((wire1 + wire11)) ?
                      $signed($signed(wire1)) : (wire5 || $signed(wire3)))) ^ wire10[(4'hf):(4'hc)]);
  always
    @(posedge clk) begin
      reg21 <= wire5;
      if ((wire5[(3'h5):(1'h0)] ?
          wire4 : (wire4[(1'h1):(1'h1)] >>> {$unsigned((wire17 ?
                  (8'hab) : wire1)),
              $unsigned({wire11})})))
        begin
          reg22 <= ($unsigned((((wire2 ^~ wire5) <<< wire14[(5'h15):(5'h15)]) == ((+wire11) & $signed(wire5)))) + wire14[(4'hd):(4'hd)]);
        end
      else
        begin
          reg22 <= wire16[(1'h1):(1'h1)];
          reg23 <= (~&((wire10 || $unsigned($unsigned(reg21))) ?
              (wire1 ?
                  ($unsigned(reg22) ~^ $unsigned(wire0)) : $unsigned(wire4)) : (($unsigned((8'hb7)) ?
                  reg21 : ((8'h9d) ?
                      reg22 : (8'ha1))) ~^ $unsigned((wire15 <= reg7)))));
          if ((~|{(!$unsigned(wire1)),
              (reg21[(3'h6):(3'h6)] ?
                  (|reg22[(1'h1):(1'h1)]) : (~|wire5[(3'h6):(3'h4)]))}))
            begin
              reg24 <= (-(^~((&$unsigned(wire3)) ?
                  ((wire2 ? reg9 : reg8) ?
                      wire18 : wire2[(1'h1):(1'h1)]) : reg21[(1'h0):(1'h0)])));
              reg25 <= (~$signed($unsigned($signed((wire18 + wire2)))));
              reg26 <= ($unsigned((-wire15[(2'h3):(2'h3)])) != reg6[(5'h14):(4'he)]);
            end
          else
            begin
              reg24 <= wire20[(3'h6):(2'h3)];
            end
        end
    end
endmodule
