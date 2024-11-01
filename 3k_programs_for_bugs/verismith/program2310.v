module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire29,
                 wire4,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire4 = $unsigned((~$unsigned(wire1)));
  module5 #() modinst30 (wire29, clk, wire3, wire4, wire0, wire1);
  always
    @(posedge clk) begin
      if ($signed($unsigned((wire0 >>> $unsigned((~|wire0))))))
        begin
          reg31 <= $unsigned(wire4[(3'h7):(1'h1)]);
          reg32 <= {wire4, wire0[(4'hd):(4'h8)]};
        end
      else
        begin
          reg31 <= (-((^~{$unsigned((8'ha7))}) <= $unsigned($signed((wire29 ?
              wire1 : (8'h9d))))));
          reg32 <= (|(~|$unsigned($signed($signed(wire4)))));
        end
      if (wire29)
        begin
          reg33 <= (8'haf);
        end
      else
        begin
          reg33 <= ($signed(($unsigned(((7'h43) >> reg31)) ?
                  wire29[(3'h7):(3'h7)] : reg32)) ?
              $signed($unsigned(({wire1} & $unsigned((8'ha6))))) : {$signed($signed((wire0 ?
                      wire4 : wire4))),
                  $signed($signed((wire2 >>> wire29)))});
          reg34 <= (wire29 ?
              (|(((~wire4) ? {wire1, wire29} : wire29) ?
                  $signed({(8'ha7), reg33}) : ($signed(wire3) ?
                      reg31[(3'h5):(3'h4)] : reg33[(1'h0):(1'h0)]))) : (($unsigned($unsigned(wire29)) ?
                  wire0[(4'he):(4'he)] : $unsigned($unsigned((8'hb8)))) | reg31[(4'he):(2'h2)]));
          reg35 <= ($unsigned((|(8'ha8))) ?
              ($signed(((wire29 ? wire4 : (8'hb3)) | $unsigned(wire29))) ?
                  wire0 : wire2) : $signed(wire4));
          reg36 <= (&$signed(wire1[(5'h12):(1'h0)]));
          reg37 <= $unsigned(((&$unsigned(reg36)) ^ (~^(^~(|wire0)))));
        end
      reg38 <= {($unsigned({$unsigned(wire3),
              $unsigned(reg37)}) << $signed($signed((^wire0)))),
          (wire3 ? reg31 : $signed($signed((8'hbc))))};
    end
  assign wire39 = ((wire4[(1'h0):(1'h0)] ?
                      $signed(((reg33 ?
                          reg35 : wire3) >= ((8'hb6) > reg34))) : ((wire0 + (-(8'hb8))) | (~^((8'haf) ?
                          (8'h9e) : wire0)))) > ($unsigned(($signed((8'hbf)) ?
                      (reg33 ? wire4 : (8'hb1)) : {reg31,
                          (8'ha3)})) ~^ ({(reg34 || wire1)} ?
                      $unsigned({reg36}) : (~&((8'haa) ? (8'ha6) : (8'h9f))))));
  assign wire40 = (+((8'ha2) >> $unsigned($signed((wire1 ? reg36 : reg32)))));
  assign wire41 = $signed(((reg31[(5'h11):(4'hd)] ?
                          $signed(((8'hb3) ?
                              wire4 : reg32)) : reg35[(1'h0):(1'h0)]) ?
                      (wire1 + $signed((wire3 ?
                          reg36 : wire3))) : $signed($unsigned((7'h43)))));
endmodule

module module5
#(parameter param27 = ((((&((8'hbb) < (8'ha8))) < {((8'ha9) ? (8'ha5) : (8'hac)), ((8'ha2) ^ (8'hab))}) <<< (&(((8'hb5) ? (8'h9c) : (8'hbc)) ? (8'hb6) : (&(8'ha3))))) ? ((~|(8'hbe)) << ((((8'hbe) ^~ (7'h43)) ? ((8'hbf) ? (8'hb4) : (8'hb7)) : (^~(8'ha9))) ? (-((8'ha3) ? (8'hb7) : (7'h40))) : {{(8'hab)}, (~|(8'hb4))})) : ((~^(8'h9d)) > (~^(8'hba)))), 
parameter param28 = param27)
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire23;
  assign y = {wire26, wire25, wire10, wire23, (1'h0)};
  assign wire10 = (~(&(~&$unsigned($unsigned(wire6)))));
  module11 #() modinst24 (wire23, clk, wire7, wire6, wire8, wire10, wire9);
  assign wire25 = {wire23,
                      {({(wire7 ? wire6 : wire7), $signed(wire7)} | ((8'ha5) ?
                              (~&wire7) : {wire23, wire23}))}};
  assign wire26 = $signed({$signed({(~^(8'ha0))})});
endmodule

module module11
#(parameter param22 = {(8'hb8), (8'h9f)})
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  input wire [(3'h4):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  assign y = {wire21, wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = wire12;
  assign wire18 = ((~^$signed(($signed(wire15) || wire15[(4'ha):(1'h0)]))) ?
                      wire15 : wire14);
  assign wire19 = {$signed(((&wire16) ?
                          wire18[(1'h0):(1'h0)] : {wire17,
                              (wire15 ? wire15 : wire13)})),
                      $unsigned($unsigned($signed(wire14)))};
  assign wire20 = wire14[(1'h0):(1'h0)];
  assign wire21 = wire20[(5'h11):(1'h1)];
endmodule
