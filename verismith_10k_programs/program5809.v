module top
#(parameter param78 = (8'h9f), 
parameter param79 = param78)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire76;
  assign y = {wire4, wire5, wire6, wire7, wire37, wire76, (1'h0)};
  assign wire4 = wire3[(1'h0):(1'h0)];
  assign wire5 = wire0;
  assign wire6 = wire3;
  assign wire7 = (~&$signed(wire6[(1'h0):(1'h0)]));
  module8 #() modinst38 (wire37, clk, wire3, wire4, wire7, wire2);
  module39 #() modinst77 (.clk(clk), .wire40(wire5), .y(wire76), .wire42(wire7), .wire41(wire2), .wire43(wire6), .wire44(wire1));
endmodule

module module39  (y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire44;
  input wire [(4'hd):(1'h0)] wire43;
  input wire [(5'h15):(1'h0)] wire42;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire [(5'h14):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  assign y = {wire75,
                 wire74,
                 wire72,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 (1'h0)};
  assign wire45 = wire41[(2'h2):(1'h0)];
  assign wire46 = ($unsigned(($signed((~|wire44)) == (wire44 | (wire40 ?
                          (8'hb4) : wire43)))) ?
                      {$unsigned(wire45)} : wire41[(5'h11):(3'h6)]);
  assign wire47 = {($unsigned({(-wire44), (wire45 ^~ wire40)}) ?
                          $signed($signed($signed(wire43))) : $unsigned((8'h9d)))};
  assign wire48 = wire41;
  assign wire49 = wire43;
  assign wire50 = wire42[(5'h14):(3'h7)];
  assign wire51 = wire46;
  assign wire52 = (^~(~^$signed((+(!wire41)))));
  assign wire53 = $unsigned(((-((^(8'ha7)) << $unsigned(wire45))) ?
                      $unsigned((wire44 ?
                          $unsigned(wire43) : wire46[(4'ha):(4'h8)])) : wire47));
  module54 #() modinst73 (.wire55(wire43), .wire57(wire47), .y(wire72), .wire58(wire41), .wire56(wire40), .clk(clk));
  assign wire74 = $unsigned($signed($unsigned(wire43[(4'hd):(4'hb)])));
  assign wire75 = $unsigned(((wire49 ?
                      ((^(8'ha9)) >= {wire53,
                          wire51}) : $unsigned((~^(8'hb5)))) || (7'h44)));
endmodule

module module8
#(parameter param35 = (^~(((((8'hba) ? (8'hb3) : (8'ha9)) ? (~(8'hba)) : (|(8'ha8))) ? ({(7'h43), (8'hbf)} != (&(8'ha7))) : {{(8'hbd)}}) ? {(((8'hb2) ? (8'hb9) : (8'hb2)) ? ((8'hae) != (8'ha9)) : {(8'ha6), (8'hb5)})} : ((((8'haa) <= (8'hbf)) ? ((8'hab) ? (7'h43) : (8'ha6)) : (8'hbb)) ? (|(8'hb0)) : ((~|(8'ha8)) ? ((8'hac) >>> (7'h42)) : ((8'hbf) ? (8'hb9) : (8'hac)))))), 
parameter param36 = param35)
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(4'ha):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg28,
                 reg27,
                 reg22,
                 (1'h0)};
  assign wire13 = wire9;
  assign wire14 = wire9[(3'h5):(1'h1)];
  assign wire15 = $signed(wire11);
  assign wire16 = (8'hb7);
  assign wire17 = ((8'ha3) ?
                      (~|(wire13[(3'h4):(1'h0)] | $unsigned($signed(wire10)))) : (^wire12));
  assign wire18 = ($signed(wire14) >>> wire14);
  assign wire19 = (~^$unsigned($unsigned(($unsigned(wire10) < $signed((7'h42))))));
  assign wire20 = wire9;
  assign wire21 = {$signed($signed({wire14[(1'h0):(1'h0)], $signed((7'h42))})),
                      $unsigned((($unsigned(wire13) ? wire10 : wire20) ?
                          {wire15[(2'h3):(1'h1)]} : wire13))};
  always
    @(posedge clk) begin
      reg22 <= (($unsigned((wire17[(2'h3):(2'h2)] + $signed(wire17))) > wire12[(1'h1):(1'h0)]) ?
          $signed((wire10[(4'h8):(3'h6)] ?
              $unsigned((wire17 ?
                  (7'h43) : wire19)) : wire21)) : ((wire16[(1'h0):(1'h0)] || $unsigned((^~wire20))) ^ $signed($signed(wire10[(2'h3):(1'h1)]))));
    end
  assign wire23 = (|$signed(wire13[(4'hd):(1'h1)]));
  assign wire24 = wire17;
  assign wire25 = (~|$signed((&wire20[(2'h2):(1'h1)])));
  assign wire26 = $unsigned(($signed(wire19[(1'h1):(1'h0)]) >>> ((+((8'hbe) ?
                          wire15 : wire9)) ?
                      (-((8'hac) ?
                          wire19 : wire16)) : $unsigned((wire11 < wire10)))));
  always
    @(posedge clk) begin
      reg27 <= ({wire15[(3'h6):(3'h5)]} != wire17[(4'hd):(4'ha)]);
      reg28 <= {wire25};
    end
  assign wire29 = ((wire10 <= reg22) ?
                      $signed($unsigned(wire20)) : $unsigned(wire10[(4'h8):(4'h8)]));
  assign wire30 = (-$signed(((~^(+wire17)) ?
                      $signed(wire21[(2'h2):(2'h2)]) : {(wire24 ?
                              wire21 : wire29)})));
  assign wire31 = {(|$signed(wire26))};
  assign wire32 = reg27;
  assign wire33 = wire9[(2'h3):(2'h3)];
  assign wire34 = ((($unsigned($unsigned(wire21)) ?
                              reg28 : (reg28[(1'h1):(1'h1)] == wire25[(3'h4):(2'h3)])) ?
                          wire21 : (8'ha3)) ?
                      (~|{($signed(wire17) << (|wire23)),
                          wire14}) : $unsigned($unsigned(wire26[(4'h9):(3'h5)])));
endmodule

module module54
#(parameter param71 = (|(~&({(^~(8'hb2)), ((7'h40) >= (8'hbc))} ^~ {{(8'h9e), (8'hab)}, ((8'hba) ? (8'haf) : (8'hb9))}))))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire58;
  input wire signed [(2'h2):(1'h0)] wire57;
  input wire [(5'h10):(1'h0)] wire56;
  input wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire59 = wire58;
  assign wire60 = $unsigned({wire57});
  assign wire61 = (!(-wire56));
  assign wire62 = {$unsigned((+({wire60} ? wire56[(3'h5):(2'h3)] : wire58)))};
  assign wire63 = wire62[(5'h10):(4'h9)];
  assign wire64 = $signed(wire57);
  assign wire65 = (8'ha7);
  always
    @(posedge clk) begin
      reg66 <= (~|($signed(wire65[(2'h2):(2'h2)]) | $signed($signed(wire57[(2'h2):(1'h0)]))));
      reg67 <= (((((wire61 ? reg66 : wire58) ?
                  wire65 : $signed(wire62)) == $unsigned((-wire59))) ?
              (~^{wire60[(1'h1):(1'h0)]}) : wire63) ?
          wire57 : $signed(((~&$unsigned(wire56)) ?
              $signed((reg66 != (8'ha3))) : $signed(wire58))));
      reg68 <= $signed((reg66[(4'h9):(4'h9)] ?
          wire60 : ({{wire63}} ?
              $unsigned($unsigned(wire55)) : ({wire64, wire64} ?
                  $signed(wire56) : ((8'h9e) ^~ reg67)))));
    end
  assign wire69 = $signed(wire64[(3'h7):(2'h3)]);
  assign wire70 = ($unsigned((wire65 ^ $unsigned($signed(wire57)))) && {$signed((-wire65))});
endmodule
