module top
#(parameter param22 = ((^({(|(8'hbb)), ((8'hab) ? (8'h9d) : (8'hbe))} * (~((8'ha7) ? (7'h40) : (8'hb0))))) || (^((((7'h40) << (7'h44)) ? ((8'hbb) && (8'haf)) : {(8'hb4)}) ? (^~(8'hb4)) : (((8'ha9) >= (8'haf)) << {(8'ha1), (7'h42)})))), 
parameter param23 = (+{(|{param22}), ((~^(param22 ^~ param22)) + param22)}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire16,
                 wire15,
                 wire14,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = $signed($signed($signed((8'haa))));
  assign wire6 = wire4;
  assign wire7 = $signed($signed($unsigned(($signed(wire5) << $unsigned((8'hb8))))));
  assign wire8 = wire2[(1'h1):(1'h1)];
  assign wire9 = $signed($signed($unsigned(wire5)));
  always
    @(posedge clk) begin
      if (($unsigned((!$signed(wire1))) ?
          ($signed((!$unsigned(wire4))) - $signed(wire8)) : $unsigned(wire5)))
        begin
          if ($signed((wire9 ?
              $unsigned(((~&wire4) != $unsigned(wire5))) : ((wire8[(4'hd):(4'hb)] + (^~wire4)) ?
                  ((~wire4) ?
                      wire1 : (wire5 ? wire4 : wire4)) : $unsigned(wire9)))))
            begin
              reg10 <= {$signed((7'h42))};
              reg11 <= ($signed(reg10) ?
                  $unsigned((~^$signed({wire8,
                      wire5}))) : wire3[(3'h6):(2'h3)]);
            end
          else
            begin
              reg10 <= wire0[(4'hb):(4'h8)];
            end
          reg12 <= $signed({wire4[(1'h0):(1'h0)], (|wire5)});
          reg13 <= $unsigned(((($unsigned(reg12) ?
              {wire5} : $unsigned((8'hba))) != ((wire6 ?
              wire1 : wire7) != {wire0})) ^ reg10));
        end
      else
        begin
          reg10 <= (~^reg11);
          reg11 <= ($unsigned(wire4) > (~&$unsigned(wire9)));
        end
    end
  assign wire14 = $signed({(~^({wire0, wire0} >>> wire8)),
                      $unsigned(({wire6, wire3} ?
                          wire6[(3'h4):(1'h0)] : $unsigned(wire1)))});
  assign wire15 = (^wire4);
  assign wire16 = ($unsigned(wire6) ~^ wire3);
  always
    @(posedge clk) begin
      reg17 <= {(-$unsigned(wire9)),
          ((^~(wire0 >= $signed(wire1))) == ($unsigned((!wire5)) ?
              {(wire8 == (8'hbc)), $unsigned(reg10)} : (|(wire14 <= reg13))))};
    end
  assign wire18 = ((!$unsigned(((reg12 ? wire14 : wire16) ?
                          $signed(wire9) : wire3))) ?
                      (8'hae) : $unsigned($unsigned(reg17)));
  assign wire19 = $signed(wire4);
  assign wire20 = wire0;
  assign wire21 = (wire0[(5'h13):(2'h3)] && reg12[(4'h8):(1'h1)]);
endmodule
