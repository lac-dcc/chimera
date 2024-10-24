module top
#(parameter param65 = (^{(~^(~{(8'ha3), (8'ha5)})), (((!(8'h9f)) >> ((7'h44) ^ (8'hb6))) ? (((8'hba) ? (8'h9f) : (8'haf)) ? {(8'ha3), (8'had)} : (&(8'hac))) : ((+(8'hb1)) + {(8'ha0), (8'ha3)}))}), 
parameter param66 = param65)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire62;
  assign y = {wire64, wire4, wire5, wire6, wire62, (1'h0)};
  assign wire4 = wire2[(1'h1):(1'h1)];
  assign wire5 = ($unsigned(((((8'hab) ? wire1 : wire2) ?
                         wire3 : ((8'hb4) >> wire4)) ^ ($unsigned((8'ha1)) ?
                         (wire0 >> (8'hb1)) : (wire0 ? (8'h9e) : wire1)))) ?
                     ((~|wire3) - ($unsigned(wire2) ?
                         $signed((wire1 >> wire3)) : wire1)) : (7'h40));
  assign wire6 = $signed(({(|(wire1 ? wire3 : wire3))} ?
                     (wire2 - wire5[(1'h1):(1'h0)]) : $unsigned((~$signed(wire4)))));
  module7 #() modinst63 (wire62, clk, wire1, wire3, wire6, wire5, wire4);
  assign wire64 = (((wire62 ?
                              ($signed(wire1) ?
                                  $unsigned((8'hab)) : $signed(wire0)) : (8'ha2)) ?
                          $unsigned({$signed(wire0)}) : (wire2 ~^ wire4)) ?
                      (8'ha7) : (wire0 && $signed($unsigned((wire62 | (8'ha0))))));
endmodule

module module7
#(parameter param60 = ((8'hb0) ? (-(({(8'hb4)} > {(7'h42), (8'haa)}) * ((8'ha1) ? ((7'h42) ? (8'h9d) : (8'hba)) : ((7'h43) + (8'hbf))))) : ((!{(|(8'hb6)), ((7'h44) ^~ (8'hbe))}) ~^ (((!(8'ha3)) | (~&(8'ha3))) ? (((8'hac) || (8'ha0)) ? {(8'hbb), (7'h42)} : (8'hbb)) : {((7'h43) & (8'hb9)), (|(8'ha3))}))), 
parameter param61 = (-param60))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire12;
  input wire [(3'h6):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire13 = ((7'h43) > wire12[(4'he):(4'h8)]);
  assign wire14 = wire11;
  assign wire15 = (~{(($unsigned(wire9) ? (wire10 && wire13) : (8'h9c)) ?
                          (~&(wire11 | (8'hb0))) : wire13)});
  assign wire16 = (~^((~^((wire9 == wire9) ?
                      $unsigned(wire11) : ((8'ha2) ?
                          wire8 : wire13))) >> (((~&wire10) == wire15) ?
                      {(~wire15)} : (wire9 ?
                          wire9 : (wire12 ? wire14 : wire13)))));
  module17 #() modinst50 (.y(wire49), .wire20(wire14), .wire18(wire13), .wire19(wire8), .wire21(wire10), .clk(clk));
  assign wire51 = (|(((~|(wire16 ? wire11 : wire11)) ?
                          ((wire8 <<< (8'hbb)) ?
                              wire11 : wire16[(1'h0):(1'h0)]) : {(wire49 ?
                                  wire14 : wire12)}) ?
                      $signed($unsigned(wire10)) : wire8));
  assign wire52 = ((wire16[(2'h2):(1'h0)] ?
                          (~&{$unsigned(wire11)}) : (wire9[(4'hb):(1'h1)] ^ (~&wire49[(4'h9):(3'h5)]))) ?
                      ($signed(wire16[(4'hc):(4'h9)]) ~^ $unsigned(((~^wire9) ?
                          $unsigned((7'h42)) : {wire14}))) : $signed((wire13[(3'h5):(3'h4)] != ((!wire11) * (wire13 != wire13)))));
  assign wire53 = $unsigned(wire10);
  assign wire54 = $unsigned((wire52[(5'h14):(4'h9)] | (^wire16)));
  assign wire55 = ($unsigned($signed(($signed(wire9) ?
                      (wire13 ?
                          wire51 : wire9) : wire10[(4'hc):(2'h3)]))) > ((+((~wire51) ?
                          $unsigned(wire10) : $unsigned((7'h44)))) ?
                      wire53 : (8'hbc)));
  always
    @(posedge clk) begin
      reg56 <= {$signed($unsigned(wire52))};
      reg57 <= wire52[(4'h8):(1'h0)];
      reg58 <= wire12;
      reg59 <= (+((-wire13[(3'h5):(2'h2)]) == (&$signed($signed(reg58)))));
    end
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire21;
  input wire [(3'h7):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire24,
                 wire23,
                 wire22,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire22 = {$signed(wire20)};
  assign wire23 = {wire20};
  assign wire24 = ((~&(~^(wire22[(2'h3):(2'h2)] <<< $unsigned(wire20)))) * $signed(wire18));
  always
    @(posedge clk) begin
      reg25 <= $unsigned((~|(8'ha5)));
      reg26 <= (((((wire19 & wire24) ~^ wire19) ?
          $signed(wire24) : $unsigned((~|(8'ha4)))) < (~&(|$unsigned(wire18)))) | ($signed({wire22}) || wire23));
      reg27 <= (wire21[(3'h6):(2'h2)] ?
          $unsigned((8'ha1)) : $signed($unsigned(wire23[(4'h8):(3'h6)])));
      reg28 <= (((^~wire20[(3'h4):(2'h2)]) ?
          $signed(wire21[(4'hc):(4'h8)]) : wire21[(4'h9):(4'h8)]) ^ $signed((((+wire24) & reg26) > wire20)));
      reg29 <= (wire19[(2'h2):(1'h1)] && wire19);
    end
  assign wire30 = (~&((+$unsigned(reg26)) ?
                      reg27[(3'h6):(1'h0)] : {(&reg27[(1'h1):(1'h1)]),
                          ((~^reg28) - (~&wire22))}));
  assign wire31 = ($unsigned(wire24[(2'h3):(1'h0)]) | {(7'h44), wire22});
  assign wire32 = $signed((^~$unsigned(((~&reg27) << {reg25, wire21}))));
  assign wire33 = (wire19 ? wire22 : (8'hb8));
  assign wire34 = (wire18[(3'h7):(2'h3)] << (8'hb8));
  assign wire35 = ($signed({(^(wire23 ? reg27 : (8'hba)))}) << (^~(~&wire30)));
  assign wire36 = wire24[(4'hf):(4'hb)];
  always
    @(posedge clk) begin
      if ((^~(~|(!$unsigned({wire32, wire34})))))
        begin
          if ($signed((!$unsigned((((8'hbe) ^~ wire22) ?
              $unsigned(reg25) : {wire19})))))
            begin
              reg37 <= reg25[(3'h6):(1'h1)];
              reg38 <= $unsigned(reg37[(2'h3):(2'h3)]);
              reg39 <= (($unsigned(reg25) || (((wire30 ? wire23 : wire32) ?
                      (8'hb3) : (wire23 ^ wire19)) > $signed({wire36}))) ?
                  $unsigned(($signed((+reg28)) ^ reg25)) : $signed($unsigned(wire32[(4'h8):(3'h7)])));
              reg40 <= reg28[(1'h1):(1'h0)];
            end
          else
            begin
              reg37 <= (+(^reg38[(4'h8):(3'h7)]));
              reg38 <= $unsigned((reg37 ? wire35 : (&$unsigned(reg38))));
              reg39 <= (reg39 >= wire35);
              reg40 <= {($signed({wire31[(2'h3):(2'h2)],
                      $signed(wire30)}) & $signed(wire33)),
                  reg27[(4'h8):(1'h0)]};
              reg41 <= (~&wire21[(4'hd):(4'ha)]);
            end
        end
      else
        begin
          reg37 <= wire34;
          reg38 <= $signed((-$unsigned(reg40)));
        end
      reg42 <= wire21;
    end
  assign wire43 = (^~reg27);
  assign wire44 = $signed($unsigned(((|((8'haf) ^ reg42)) ?
                      (~^(8'ha4)) : {((8'hba) == wire34)})));
  assign wire45 = reg25;
  assign wire46 = (($signed({wire35[(2'h2):(1'h1)],
                      (wire33 || reg26)}) ^ wire20[(2'h2):(1'h0)]) ^ ($signed(wire18) || $unsigned($signed($signed(wire23)))));
  assign wire47 = reg38;
  assign wire48 = wire43;
endmodule
