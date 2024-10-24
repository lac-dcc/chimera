module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire54;
  assign y = {wire56, wire5, wire6, wire7, wire54, (1'h0)};
  assign wire5 = ((wire4 ? wire3[(4'hc):(1'h1)] : $signed({(wire1 | wire0)})) ?
                     wire3 : ((8'hb6) ?
                         $signed(wire4[(4'h9):(3'h5)]) : $signed(wire1[(1'h1):(1'h0)])));
  assign wire6 = $unsigned(($signed((~&(wire4 ? wire1 : wire4))) ?
                     {$unsigned($unsigned(wire1)),
                         (wire2[(2'h3):(1'h0)] > (wire3 ^ wire1))} : (~&wire4)));
  assign wire7 = {$signed($unsigned({{wire1}, ((8'hb0) ? wire2 : wire3)})),
                     wire3[(3'h4):(2'h2)]};
  module8 #() modinst55 (.wire13(wire0), .y(wire54), .wire10(wire7), .clk(clk), .wire11(wire3), .wire12(wire6), .wire9(wire1));
  assign wire56 = $unsigned($unsigned(wire3[(2'h3):(2'h3)]));
endmodule

module module8
#(parameter param52 = (((&(((8'ha8) + (8'h9f)) ? (^~(8'h9e)) : ((8'hab) ? (8'hbf) : (8'ha9)))) ? ({(^~(8'ha4)), (~&(7'h44))} > (((8'haa) >= (8'hb0)) > (8'ha5))) : (({(8'hac), (8'haf)} ? ((8'hb1) ? (8'haf) : (8'hb5)) : ((8'ha9) ? (7'h40) : (8'ha4))) ? (((8'ha4) * (8'hae)) ? (~|(8'ha6)) : {(8'ha5), (8'haa)}) : ({(8'ha7)} ? {(8'ha6)} : ((8'hb1) > (8'ha5))))) ? (+(({(8'hb6), (8'h9d)} > (8'hb6)) * {((8'hbe) << (7'h41)), (8'ha1)})) : (&((^(-(8'h9e))) < (((8'hbc) > (8'h9c)) >> {(8'h9d), (8'ha9)})))), 
parameter param53 = ((8'hbb) ^ (|(8'hb2))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(4'ha):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire30;
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire14,
                 wire15,
                 wire16,
                 wire30,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire14 = (($unsigned(((wire12 ? wire13 : wire11) ?
                          (wire10 ? wire11 : wire10) : ((8'haf) ?
                              wire12 : wire11))) ?
                      (!$signed(wire10[(3'h6):(2'h2)])) : $signed($signed(wire10))) ^ {$unsigned($unsigned((8'hbe)))});
  assign wire15 = (((^~wire14[(2'h3):(2'h2)]) ?
                          wire13[(3'h6):(2'h3)] : wire9[(4'h9):(4'h9)]) ?
                      ({wire13[(4'hc):(4'hc)]} ?
                          ($unsigned($signed(wire11)) >>> (wire11[(2'h3):(2'h3)] ?
                              (~wire12) : (8'hae))) : (!$unsigned((wire10 != wire13)))) : wire12[(4'h9):(2'h2)]);
  assign wire16 = (^~$signed(wire11[(2'h2):(1'h0)]));
  module17 #() modinst31 (wire30, clk, wire11, wire10, wire13, wire15, wire9);
  assign wire32 = wire16[(1'h0):(1'h0)];
  assign wire33 = $unsigned(wire32[(4'he):(4'h9)]);
  assign wire34 = wire16;
  assign wire35 = $signed(($signed($signed((wire33 != wire13))) << {(wire12 - (wire11 ?
                          wire34 : wire9)),
                      {$unsigned((8'hb7))}}));
  assign wire36 = ((wire35 < $signed((^{wire11}))) <= ($unsigned((|(wire14 ?
                      (8'hb2) : wire15))) ^ ($unsigned((wire16 * wire12)) ?
                      $unsigned((^wire16)) : (wire11[(1'h1):(1'h0)] == wire33))));
  assign wire37 = {(~|(wire12 && $unsigned(wire34[(2'h2):(2'h2)])))};
  assign wire38 = (wire37[(2'h3):(1'h0)] ?
                      ($signed($unsigned((^(7'h42)))) ?
                          ((|(wire37 ^~ wire37)) ?
                              {{wire32}} : wire13) : ({$unsigned((8'hb4))} ?
                              wire37 : (|wire36[(4'he):(4'h8)]))) : $signed(wire14[(1'h1):(1'h1)]));
  assign wire39 = wire9[(3'h7):(1'h1)];
  assign wire40 = $signed(({wire34[(2'h2):(2'h2)]} != $unsigned(wire37[(2'h3):(1'h1)])));
  assign wire41 = ((~|(wire10 ?
                      ($unsigned(wire11) ?
                          (~&wire36) : (wire34 ?
                              wire9 : wire30)) : $unsigned((~|wire35)))) && (~^(wire34[(2'h2):(1'h1)] ?
                      (8'hbe) : ((wire34 * wire33) ?
                          $signed((8'ha1)) : wire13))));
  assign wire42 = wire39[(1'h1):(1'h0)];
  assign wire43 = $signed($signed(wire37));
  assign wire44 = (|(wire10 ? $signed((~&wire37[(3'h4):(1'h0)])) : {wire10}));
  assign wire45 = {(+(~^(-$unsigned(wire44))))};
  always
    @(posedge clk) begin
      reg46 <= wire36[(2'h3):(1'h1)];
      reg47 <= (8'hbb);
      reg48 <= ((-{wire43[(4'h9):(3'h6)],
          {wire12, wire15}}) + {$signed(wire43[(3'h6):(2'h2)]),
          $unsigned($unsigned((8'hbc)))});
      if (((8'ha6) | (wire9[(4'h9):(1'h0)] ?
          {(&(8'ha0)), wire36} : wire43[(2'h2):(1'h0)])))
        begin
          reg49 <= $signed({(8'hbb)});
          reg50 <= (~&wire40);
        end
      else
        begin
          reg49 <= $unsigned((8'ha6));
          reg50 <= wire39;
        end
      reg51 <= (($signed(wire9) ?
          wire34[(2'h2):(1'h0)] : (~$unsigned(reg46))) | $signed((~|wire37)));
    end
endmodule

module module17
#(parameter param29 = ((((8'haf) ? (((8'ha1) > (8'hb5)) && (~&(8'ha6))) : {((8'ha1) ^~ (8'hb8)), ((8'hbd) | (8'hb8))}) | ((!((8'hbb) >= (8'h9d))) ? (~|(~^(8'hb1))) : (((8'ha7) ? (7'h40) : (7'h43)) ^ (!(8'hb5))))) + ((-((8'ha0) ? (~&(8'haf)) : ((8'haa) ? (8'haf) : (8'hb5)))) | {(-((8'hbe) == (8'ha6))), (((8'hb8) ? (8'hb8) : (8'hbf)) ? {(8'ha6), (8'ha7)} : ((8'hba) ? (8'hba) : (7'h43)))})))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire21;
  input wire [(3'h6):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  assign y = {wire28, wire27, wire26, wire25, wire24, wire23, (1'h0)};
  assign wire23 = (-$signed($unsigned(((wire22 ?
                      wire20 : wire22) || ((8'haa) <<< (8'hbd))))));
  assign wire24 = wire23[(2'h3):(1'h1)];
  assign wire25 = ({(wire19 ? wire22 : (wire21[(4'h9):(3'h4)] | {wire22})),
                          {$signed((wire24 ? wire18 : (8'haf))),
                              wire20[(1'h0):(1'h0)]}} ?
                      wire20[(3'h5):(1'h1)] : wire22);
  assign wire26 = (~^($unsigned($unsigned(wire19)) ?
                      (8'hb1) : (&{$unsigned(wire19), (^wire25)})));
  assign wire27 = wire18[(3'h5):(3'h5)];
  assign wire28 = $unsigned(wire26[(5'h11):(4'h9)]);
endmodule
