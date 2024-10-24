module top
#(parameter param25 = ((~&(-((^~(7'h41)) ? (~&(8'hb4)) : ((8'hb1) ? (8'h9e) : (8'hab))))) & (((((8'ha5) ? (8'h9f) : (8'hac)) < ((8'h9f) * (8'hb5))) ? ({(8'hab)} == ((7'h43) >> (8'h9c))) : (((8'hbc) >= (8'hbe)) ? (^~(8'hb5)) : ((8'hbb) ? (8'hb3) : (8'hb8)))) == (&(8'h9f)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire5 = ($signed(wire1[(1'h1):(1'h0)]) ?
                     ($signed((~|(wire3 ? wire2 : wire3))) ?
                         (wire2[(2'h3):(2'h3)] < $signed(wire1)) : {{(~(8'had))},
                             (&$unsigned((8'h9c)))}) : ($unsigned(wire2[(3'h7):(3'h4)]) > $unsigned(wire3[(5'h13):(3'h7)])));
  assign wire6 = wire5[(4'hb):(4'ha)];
  assign wire7 = $unsigned($unsigned((wire1[(2'h2):(1'h0)] ^ ((wire0 ?
                     wire2 : wire2) - (wire1 ? wire1 : wire3)))));
  assign wire8 = (wire1[(2'h2):(2'h2)] ?
                     $unsigned((($signed(wire0) << $unsigned(wire7)) ?
                         ((wire4 + (8'hb5)) <<< (~&(7'h43))) : $unsigned((~&wire1)))) : (wire6[(5'h12):(2'h2)] ?
                         (~&((8'hb7) < wire3)) : ({(-wire5)} ?
                             (^$signed(wire7)) : ((wire4 ~^ wire3) ?
                                 $unsigned(wire6) : wire4))));
  assign wire9 = ((wire7[(1'h1):(1'h0)] + ((wire0 & wire2) ?
                         ((^~wire2) >> wire4[(3'h6):(3'h5)]) : {$unsigned(wire1),
                             ((8'hb3) <= wire5)})) ?
                     {($unsigned(wire2[(4'hb):(3'h4)]) ?
                             {(wire0 ? wire3 : wire0),
                                 $unsigned(wire7)} : (|(-wire7)))} : (wire7[(2'h2):(1'h0)] ?
                         ((~&wire6) ?
                             $signed({wire6}) : $signed(((7'h44) >>> wire2))) : ($signed((wire8 ?
                             wire0 : wire0)) * $signed($signed(wire4)))));
  assign wire10 = wire7;
  assign wire11 = wire1[(1'h0):(1'h0)];
  assign wire12 = wire6[(1'h0):(1'h0)];
  assign wire13 = (~^(8'had));
  assign wire14 = (!wire12);
  always
    @(posedge clk) begin
      reg15 <= $unsigned((+(^~$unsigned((wire6 ? wire3 : wire11)))));
      reg16 <= wire7[(2'h3):(2'h3)];
      if ((((7'h40) ?
              $signed((((8'haf) ? wire10 : (7'h42)) ?
                  $signed(wire5) : (wire0 < wire1))) : wire7[(3'h7):(2'h2)]) ?
          (wire1 ?
              (~((wire9 != (7'h41)) <= $unsigned(wire3))) : wire12[(3'h5):(3'h5)]) : ({(|(+(8'haa))),
              $signed((wire0 ? wire8 : (8'ha7)))} ^ (((wire10 ? wire9 : reg16) ?
              $signed(reg16) : (wire4 || wire8)) ^~ {wire2[(4'h8):(3'h4)]}))))
        begin
          if ({(8'hb5), wire7[(2'h3):(2'h3)]})
            begin
              reg17 <= (~|reg16);
            end
          else
            begin
              reg17 <= $unsigned((((&reg15) != $unsigned(wire6)) && $signed($unsigned({wire12,
                  wire0}))));
              reg18 <= (+$signed($unsigned($unsigned((^wire10)))));
              reg19 <= wire6[(5'h10):(4'h8)];
              reg20 <= $unsigned(wire11[(5'h14):(4'he)]);
            end
        end
      else
        begin
          reg17 <= wire11[(4'hd):(4'hb)];
          reg18 <= $unsigned($signed($signed($unsigned($signed(wire13)))));
          reg19 <= (({(&(reg18 > (8'hbe)))} * ($unsigned($unsigned(wire5)) ?
                  (+wire10) : (wire9 ? wire7 : $unsigned(reg19)))) ?
              $unsigned(reg17) : $unsigned(($signed(wire2[(3'h5):(1'h0)]) > ((reg16 == wire4) ?
                  wire4[(1'h1):(1'h1)] : (reg19 ? wire14 : reg15)))));
        end
    end
  assign wire21 = wire14;
  assign wire22 = {(!$signed((!wire14))),
                      (~|(~|((wire1 ? wire11 : reg16) ^ (~&reg19))))};
  assign wire23 = (((&$unsigned((8'ha4))) ?
                      $signed($unsigned(wire21)) : reg19[(1'h1):(1'h1)]) < wire0[(2'h2):(2'h2)]);
  assign wire24 = {$unsigned({(wire4[(4'h8):(1'h0)] ?
                              $signed(wire12) : (wire6 << reg15))}),
                      (~^((7'h40) ~^ reg20[(3'h4):(3'h4)]))};
endmodule
