module top
#(parameter param66 = {((|{(&(8'ha3))}) + (({(8'hb9), (8'hb6)} >> ((8'hb7) ? (8'hbc) : (8'ha4))) ? {{(8'hab)}, (-(8'hbf))} : {((8'hb5) >>> (7'h43))}))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire63;
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  assign y = {wire5, wire6, wire63, reg65, (1'h0)};
  assign wire5 = wire3[(4'hb):(4'ha)];
  assign wire6 = (+wire2);
  module7 #() modinst64 (wire63, clk, wire1, wire0, wire6, wire4, wire2);
  always
    @(posedge clk) begin
      reg65 <= (-$unsigned({({wire5, wire63} ? (wire0 | wire0) : wire5),
          wire6}));
    end
endmodule

module module7
#(parameter param61 = ({(+(((8'hb2) << (8'ha1)) ? ((8'haf) ? (8'ha9) : (7'h42)) : ((8'hba) ? (8'hac) : (7'h43))))} ? ((-(~^((8'hae) & (8'h9e)))) ? ({((8'haa) ? (7'h41) : (8'hb1))} || (((8'hb7) ? (7'h42) : (8'ha9)) ? (8'ha3) : ((7'h41) ? (8'hb6) : (8'h9e)))) : ((((8'ha0) != (8'hb1)) >= ((8'h9f) ? (8'hb8) : (8'ha0))) | (~((8'ha9) ? (7'h42) : (7'h43))))) : ((&(((8'hb4) ? (8'ha5) : (8'hbe)) ? ((8'ha7) <<< (8'hb6)) : ((8'hb8) < (8'haa)))) ? ((~^((8'h9d) ? (8'ha6) : (8'hbe))) ? (+((8'hbe) - (8'hab))) : (((8'hbc) + (8'hb4)) ^ ((8'hb3) ? (7'h43) : (7'h43)))) : (^((~&(8'h9f)) < (-(8'hbc)))))), 
parameter param62 = param61)
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  assign y = {wire59,
                 wire30,
                 wire29,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg28,
                 reg23,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire13 = (|wire9);
  assign wire14 = wire10;
  assign wire15 = wire14[(2'h3):(2'h2)];
  assign wire16 = ($unsigned((&(wire15[(3'h6):(3'h4)] ~^ wire15[(1'h1):(1'h0)]))) - (~&$unsigned(((wire13 ?
                      wire11 : wire10) ~^ wire12[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg17 <= ((7'h41) >>> (~(~$signed($signed(wire11)))));
      reg18 <= $signed(wire8);
      if (((-wire8[(5'h12):(5'h11)]) ?
          $unsigned(($unsigned((reg17 != reg18)) * $signed((wire16 ?
              wire14 : wire15)))) : {{(|((8'ha4) ? wire16 : reg17))}}))
        begin
          reg19 <= (!((-(wire11[(4'h8):(3'h7)] && $unsigned(wire13))) && wire10[(2'h3):(2'h2)]));
          reg20 <= ({(8'ha2)} + {$signed($signed(wire12))});
        end
      else
        begin
          reg19 <= reg19;
        end
      reg21 <= wire16[(1'h0):(1'h0)];
    end
  assign wire22 = wire8[(4'h9):(4'h8)];
  always
    @(posedge clk) begin
      reg23 <= $signed($signed((8'ha1)));
    end
  assign wire24 = reg18[(2'h2):(1'h1)];
  assign wire25 = reg23[(3'h7):(2'h3)];
  assign wire26 = ($unsigned(wire12) ~^ $signed(reg23));
  assign wire27 = reg19;
  always
    @(posedge clk) begin
      reg28 <= ($signed($unsigned($unsigned($signed(wire27)))) != (8'hb8));
    end
  assign wire29 = reg18[(1'h1):(1'h1)];
  assign wire30 = {(-reg28[(3'h5):(1'h0)])};
  module31 #() modinst60 (.wire33(wire29), .y(wire59), .wire32(reg21), .wire34(wire11), .wire35(reg18), .clk(clk));
endmodule

module module31
#(parameter param57 = ((~|((((8'hbe) + (8'hb7)) | ((7'h40) | (8'ha2))) > (+(^~(8'h9e))))) >= ((^((^(8'ha7)) ? ((7'h43) + (8'ha8)) : {(8'hba), (8'hb4)})) ? ((+{(8'ha2)}) > (((8'ha0) ^~ (8'ha5)) & {(8'ha5)})) : ((((8'hbc) * (8'had)) ? ((8'hb4) >>> (8'h9c)) : (~|(8'hbf))) ? (((7'h40) * (8'hb8)) ? (8'ha5) : ((7'h44) ? (8'hb0) : (8'hb7))) : ({(8'hb1)} <= ((8'h9f) && (8'hb0)))))), 
parameter param58 = (((!({param57, param57} ? (~|param57) : (param57 && param57))) ? (({param57} ? param57 : (param57 < param57)) && param57) : (param57 ~^ ((param57 ? param57 : param57) ? (param57 | param57) : (param57 ? param57 : param57)))) ? (({{param57}, ((8'ha0) << param57)} ? (8'ha2) : (~^param57)) ? param57 : (+((~&param57) ? (param57 ? param57 : (8'hb0)) : ((7'h43) & param57)))) : param57))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 (1'h0)};
  assign wire36 = ((wire33[(4'h8):(4'h8)] || $unsigned($signed($signed(wire35)))) ?
                      wire32[(4'he):(3'h5)] : $signed(((8'hae) || wire32)));
  assign wire37 = wire32;
  assign wire38 = ($signed($signed(($unsigned(wire37) >>> ((8'ha4) ^ wire32)))) == $unsigned(wire33[(3'h5):(1'h1)]));
  assign wire39 = wire38[(2'h2):(1'h0)];
  assign wire40 = $signed($unsigned((($signed(wire32) + (&wire35)) <= ((wire35 | (8'hba)) ?
                      $signed(wire37) : (8'hbd)))));
  assign wire41 = (wire35[(2'h3):(2'h2)] + ((7'h40) < wire33));
  assign wire42 = $unsigned(wire32[(4'ha):(4'h9)]);
  assign wire43 = (~|((^$signed((wire33 ? wire36 : wire35))) ?
                      wire32[(1'h1):(1'h1)] : wire35));
  assign wire44 = $unsigned(wire32[(4'he):(3'h5)]);
  assign wire45 = $unsigned({wire41[(1'h1):(1'h1)]});
  assign wire46 = (wire40 + wire41[(1'h1):(1'h0)]);
  assign wire47 = ((-($unsigned((&wire40)) ?
                      ($unsigned(wire45) ^ $signed(wire45)) : $signed(wire45))) ^~ wire36);
  assign wire48 = {wire37[(1'h0):(1'h0)]};
  assign wire49 = (&$signed({wire33[(3'h4):(2'h3)],
                      {(&wire36), (wire33 ? wire37 : wire37)}}));
  assign wire50 = ((!(wire42 < {(wire39 ?
                          wire45 : wire35)})) && $unsigned($unsigned(wire48[(3'h6):(1'h0)])));
  assign wire51 = wire49[(3'h7):(1'h1)];
  assign wire52 = (~&$signed(($unsigned(wire34[(3'h7):(3'h5)]) <= {wire38,
                      (wire42 ? wire47 : wire32)})));
  assign wire53 = (wire43[(5'h10):(4'hd)] <= $signed((8'hbd)));
  assign wire54 = $unsigned(wire43[(4'he):(2'h3)]);
  assign wire55 = (((7'h42) ?
                      (wire52[(4'hd):(4'hb)] ?
                          ({wire49, wire38} ?
                              (~^wire46) : {wire35}) : (~&(wire44 ^ (8'hb9)))) : wire43[(5'h10):(4'ha)]) <<< $unsigned(((wire52[(4'h9):(3'h7)] >> (~(8'hbe))) < ((wire43 ?
                          wire41 : wire35) ?
                      $unsigned((8'hb0)) : wire35))));
  assign wire56 = (~&wire55[(5'h11):(4'h8)]);
endmodule
