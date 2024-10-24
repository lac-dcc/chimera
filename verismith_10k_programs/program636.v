module top
#(parameter param59 = (~^((((&(8'hae)) ? ((8'hab) == (8'ha5)) : (~(8'hbe))) ? (~|((8'ha2) ? (8'ha4) : (8'ha5))) : (^~((7'h41) | (8'hb8)))) & (^(^((8'ha2) >> (7'h42)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire16;
  reg signed [(3'h5):(1'h0)] reg4 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire33,
                 wire32,
                 wire31,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire5,
                 wire6,
                 wire16,
                 reg4,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0;
    end
  assign wire5 = $signed((wire3[(2'h3):(2'h2)] >> (($signed(wire1) ?
                         wire0[(2'h2):(2'h2)] : $signed(wire1)) ?
                     $signed($unsigned(wire1)) : {wire1,
                         ((8'ha4) ? (7'h40) : wire2)})));
  assign wire6 = $unsigned(reg4);
  module7 #() modinst17 (.wire8(wire3), .wire11(reg4), .wire9(wire0), .wire10(wire5), .clk(clk), .y(wire16));
  assign wire18 = {$signed($unsigned({(!wire6), wire3[(3'h7):(1'h0)]})),
                      {wire3[(1'h0):(1'h0)], wire0}};
  assign wire19 = wire2[(2'h3):(1'h1)];
  assign wire20 = $signed((-$signed({reg4})));
  assign wire21 = (wire0 ?
                      $signed({(wire0 ?
                              (wire3 ?
                                  wire19 : wire3) : (+wire16))}) : (~^({(wire5 ?
                              wire5 : wire5)} - wire3[(1'h1):(1'h0)])));
  assign wire22 = ({(wire21 != $signed($unsigned(wire20)))} ?
                      wire1[(1'h1):(1'h0)] : $signed(($unsigned({wire20,
                              (7'h44)}) ?
                          $signed(reg4) : ((wire2 ^~ wire1) <<< {wire18,
                              wire1}))));
  assign wire23 = wire5;
  assign wire24 = wire21[(3'h5):(1'h0)];
  assign wire25 = ($signed(({(wire22 + wire21), wire1[(1'h1):(1'h1)]} ?
                          (wire1[(2'h3):(1'h1)] ?
                              (~(8'ha5)) : (wire0 ?
                                  wire1 : wire19)) : (((8'ha4) ^ wire22) ?
                              (wire24 ? wire0 : wire2) : $signed((8'h9e))))) ?
                      ((!$unsigned(((8'had) * wire3))) ?
                          ((+$unsigned((8'hba))) - $unsigned($signed(wire16))) : $signed(wire2[(4'hc):(4'ha)])) : (+(($unsigned(wire23) <= $unsigned(wire2)) & (~^(wire2 + wire24)))));
  assign wire26 = {$unsigned((-$signed((wire0 ? wire21 : wire3))))};
  always
    @(posedge clk) begin
      reg27 <= wire21;
      reg28 <= $unsigned(wire18[(2'h3):(1'h1)]);
      reg29 <= {$signed($signed(wire1[(1'h1):(1'h1)]))};
      reg30 <= {$unsigned($signed($unsigned((^~wire25))))};
    end
  assign wire31 = (wire21 ? reg27[(3'h7):(1'h0)] : wire6[(5'h10):(5'h10)]);
  assign wire32 = (wire1 && wire1);
  assign wire33 = $unsigned(((|(~|$unsigned(wire21))) >> $signed(wire21[(3'h5):(2'h3)])));
  module34 #() modinst55 (wire54, clk, reg27, wire16, wire21, wire0, wire20);
  assign wire56 = $unsigned($signed($signed((wire0 ~^ ((8'ha3) ?
                      (8'h9e) : wire31)))));
  assign wire57 = ($signed(wire56) ^ (reg29[(1'h1):(1'h1)] > {(wire3 < reg28[(3'h5):(2'h2)])}));
  assign wire58 = (~^wire25[(1'h0):(1'h0)]);
endmodule

module module34
#(parameter param53 = ((((~(!(8'hb6))) <= (^~((8'ha9) ? (8'hac) : (8'hba)))) ? ((8'ha9) | (((8'ha6) ? (8'hae) : (8'hb9)) ? ((7'h43) >> (8'hbb)) : (~^(8'hac)))) : (~((&(8'h9c)) ? ((8'ha1) ? (8'hb7) : (8'h9e)) : (~|(8'hb6))))) ~^ {({((8'haa) ? (7'h42) : (8'ha5))} << (((8'hb8) != (8'ha6)) | ((8'ha5) || (8'haf)))), ({((8'hb8) <<< (8'hba))} == (^~((8'ha7) ? (8'had) : (8'h9c))))}))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire39;
  input wire signed [(4'hb):(1'h0)] wire38;
  input wire [(4'hd):(1'h0)] wire37;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= ($signed(wire39) == $unsigned(wire38[(2'h2):(1'h1)]));
      reg41 <= {wire36[(4'hf):(3'h5)],
          (~|$unsigned(($unsigned(wire35) != wire38)))};
      reg42 <= $unsigned(wire38);
    end
  assign wire43 = $unsigned(wire37[(3'h4):(1'h0)]);
  assign wire44 = reg42;
  assign wire45 = wire44;
  assign wire46 = wire38[(3'h5):(2'h2)];
  assign wire47 = (8'had);
  assign wire48 = $unsigned((reg40 | ($unsigned((-wire47)) ?
                      reg41 : wire44[(4'ha):(3'h5)])));
  assign wire49 = (~(~|reg42[(3'h4):(1'h1)]));
  assign wire50 = (+($unsigned(wire37) ?
                      (wire45[(2'h2):(1'h0)] ?
                          $signed({wire48}) : $signed($signed(wire48))) : ($unsigned($unsigned(wire44)) ?
                          (((7'h41) && wire44) || (~^reg42)) : $signed($signed(wire44)))));
  assign wire51 = wire48[(4'hd):(1'h0)];
  assign wire52 = $unsigned(($unsigned({(-wire51), (wire51 == wire45)}) ?
                      {(!$signed(wire49)),
                          (^((8'ha6) || wire35))} : wire49[(3'h7):(1'h0)]));
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h1c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  assign y = {wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = wire9;
  assign wire13 = {((wire10 ? wire11 : $signed((~&(8'ha7)))) <<< (&wire9)),
                      (^$signed(wire9))};
  assign wire14 = $unsigned(((8'hb4) || (^($signed(wire12) ^~ (wire8 ?
                      wire9 : wire12)))));
  assign wire15 = ((8'had) - wire14[(1'h0):(1'h0)]);
endmodule
