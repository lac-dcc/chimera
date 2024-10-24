module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire68,
                 wire17,
                 wire16,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = (~^wire3);
  assign wire6 = $unsigned(((~|($signed((8'hac)) - wire1[(2'h3):(2'h2)])) ?
                     wire4 : wire3[(5'h12):(2'h2)]));
  assign wire7 = (wire6[(1'h0):(1'h0)] <= ($signed(($unsigned(wire3) && $unsigned(wire3))) ?
                     (~|((+wire0) >> (wire6 != wire1))) : wire1[(2'h2):(2'h2)]));
  assign wire8 = wire0;
  assign wire9 = ($signed((^~wire4[(3'h6):(1'h0)])) ?
                     $signed($unsigned(((8'hb4) ?
                         {wire4, (8'hb1)} : ((8'ha4) ?
                             wire7 : wire0)))) : $unsigned(wire0[(1'h0):(1'h0)]));
  assign wire10 = (((|wire3) + wire1[(1'h0):(1'h0)]) ?
                      wire0 : {$signed(wire5), (~^((^~wire0) >>> {wire5}))});
  assign wire11 = wire8[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg12 <= $unsigned((wire2[(2'h2):(1'h1)] | wire2));
      reg13 <= ($signed($signed({wire4[(4'hb):(3'h7)]})) & {{(~&$unsigned(wire9))},
          (wire3 + ($signed(wire0) ? $signed(wire4) : (wire11 >>> wire2)))});
      reg14 <= $unsigned((wire2[(1'h0):(1'h0)] ?
          (wire0[(2'h3):(1'h0)] < ((wire2 ? wire6 : wire3) ?
              (&wire5) : (wire9 ?
                  (8'hba) : reg13))) : $unsigned(wire7[(2'h2):(1'h0)])));
      reg15 <= ($unsigned((wire2[(4'hd):(4'hc)] > wire8[(3'h6):(2'h3)])) ^ {wire5[(1'h0):(1'h0)],
          (wire5 - (~$signed(reg12)))});
    end
  assign wire16 = reg14[(4'h9):(4'h9)];
  assign wire17 = $signed($unsigned((^wire0)));
  module18 #() modinst69 (.wire20(wire4), .wire22(wire17), .wire19(wire1), .clk(clk), .wire21(wire5), .y(wire68));
  assign wire70 = wire4[(4'hb):(4'h9)];
  assign wire71 = wire6[(1'h1):(1'h0)];
endmodule

module module18  (y, clk, wire19, wire20, wire21, wire22);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire50;
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  assign y = {wire66, wire52, wire23, wire50, reg53, (1'h0)};
  assign wire23 = wire22[(1'h1):(1'h0)];
  module24 #() modinst51 (wire50, clk, wire22, wire19, wire20, wire21, wire23);
  assign wire52 = $unsigned(wire20);
  always
    @(posedge clk) begin
      reg53 <= wire21[(4'hc):(1'h1)];
    end
  module54 #() modinst67 (wire66, clk, wire52, wire23, wire20, wire19);
endmodule

module module54
#(parameter param65 = (((^{((8'hb9) ? (8'h9f) : (8'ha9))}) ? ((((7'h40) != (8'hbb)) ? {(8'h9c)} : (|(8'hab))) > ((-(8'hb0)) <<< {(8'ha2), (8'h9f)})) : (^((8'h9c) + (^~(8'h9f))))) == ((({(7'h41)} ? ((8'ha1) ? (8'haf) : (8'hab)) : (|(8'hb6))) ? {((8'ha5) <= (8'hbf)), ((8'hb4) && (8'haf))} : (((8'hbd) ? (8'ha7) : (8'hac)) ? ((8'ha0) + (8'hac)) : ((8'hbc) & (8'h9f)))) ~^ (!{((8'hb4) != (8'hbd))}))))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h22):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire58;
  input wire [(5'h10):(1'h0)] wire57;
  input wire signed [(5'h11):(1'h0)] wire56;
  input wire [(5'h11):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  assign y = {wire64, wire63, wire62, wire61, wire60, wire59, (1'h0)};
  assign wire59 = $signed($signed((($unsigned(wire56) ?
                      ((8'hbb) << wire58) : {wire56}) ^ wire55[(5'h11):(2'h3)])));
  assign wire60 = $unsigned($unsigned((7'h43)));
  assign wire61 = (^{(8'hbd),
                      (({wire56, wire58} <<< $unsigned(wire59)) ?
                          ($unsigned((8'h9e)) ?
                              (+wire58) : $unsigned(wire55)) : $signed((wire60 != wire58)))});
  assign wire62 = wire56;
  assign wire63 = ($unsigned({{(~|wire57)}, wire59[(4'h8):(3'h5)]}) ?
                      wire61[(1'h1):(1'h1)] : wire57[(4'hf):(1'h0)]);
  assign wire64 = $unsigned($signed((wire63[(1'h1):(1'h0)] > ($unsigned(wire56) ?
                      $unsigned(wire56) : (&wire56)))));
endmodule

module module24
#(parameter param48 = ((((((8'hba) ? (8'ha1) : (8'haa)) ? ((7'h41) ? (7'h41) : (8'hb4)) : ((8'haf) ? (7'h43) : (8'hae))) >>> ((^~(8'hbf)) < ((8'ha1) << (8'hb9)))) ? (({(7'h44), (7'h43)} ~^ ((8'hb3) ? (8'hb8) : (8'h9e))) ? (8'hbf) : {((8'ha4) ? (8'ha2) : (8'hb0)), {(8'hbe)}}) : (({(7'h43)} <= ((8'hac) && (8'ha6))) <= {((8'haa) ? (8'hb4) : (8'hb2)), (+(8'hac))})) ? (((|{(8'hb2)}) ? (~&{(8'h9e), (8'hb8)}) : (((7'h40) ? (8'h9c) : (8'ha4)) ^~ {(7'h41), (8'ha1)})) ? ((((8'ha2) ? (8'ha9) : (8'hb2)) < (+(8'ha0))) >= {((8'ha5) || (8'ha3))}) : ((((8'ha0) ? (8'hbc) : (8'ha1)) ? (8'ha9) : {(8'hbd)}) <= (&((8'hbc) ? (8'haf) : (8'ha5))))) : ((^~{((8'hbb) != (8'hb3)), {(8'h9c)}}) == ((((8'hae) ? (8'hb7) : (8'h9c)) ? {(8'h9d), (8'hbc)} : ((8'hb5) ? (8'ha8) : (8'ha5))) ? {(~^(8'ha4)), ((8'hbd) ? (8'h9f) : (8'hb1))} : {{(8'hb5), (8'ha6)}}))), 
parameter param49 = param48)
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire29;
  input wire [(5'h11):(1'h0)] wire28;
  input wire [(4'hd):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 wire31,
                 wire30,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg33,
                 (1'h0)};
  assign wire30 = wire28;
  assign wire31 = {(8'hae)};
  assign wire32 = ($signed(wire26) << (wire26[(3'h5):(1'h0)] ?
                      {((wire31 & wire28) ?
                              $unsigned(wire30) : (wire29 <= wire28))} : ($unsigned((^wire30)) ?
                          (wire31 >> {(8'ha0)}) : (!$signed(wire30)))));
  always
    @(posedge clk) begin
      reg33 <= wire31;
    end
  assign wire34 = wire29[(3'h7):(3'h7)];
  assign wire35 = $signed($signed((|$signed($signed(wire25)))));
  assign wire36 = wire29;
  assign wire37 = $signed((wire36 ^~ (8'hab)));
  always
    @(posedge clk) begin
      if (reg33[(3'h7):(2'h3)])
        begin
          if ((~&$signed($signed(((wire28 ? wire35 : reg33) == (&wire34))))))
            begin
              reg38 <= (+$signed(wire37[(5'h11):(3'h7)]));
              reg39 <= wire32[(1'h1):(1'h1)];
            end
          else
            begin
              reg38 <= (wire26[(4'h9):(2'h2)] ?
                  reg38 : ((((8'hbd) - $signed((8'hb5))) == wire36[(1'h0):(1'h0)]) ?
                      (|(wire34 ?
                          {wire32} : wire32)) : {$unsigned((^(8'hac)))}));
              reg39 <= wire32[(2'h3):(2'h3)];
            end
          reg40 <= ((($signed((reg39 ?
              wire34 : wire26)) || {$unsigned(wire30)}) * wire37[(3'h5):(1'h0)]) && (wire28[(3'h6):(3'h5)] ?
              reg33[(3'h7):(3'h7)] : (^~$signed((wire26 ? wire28 : (8'ha5))))));
          if (wire26[(3'h4):(3'h4)])
            begin
              reg41 <= {{reg38[(1'h1):(1'h0)]}};
              reg42 <= {($unsigned($unsigned(reg39[(1'h1):(1'h0)])) != ($signed((reg33 != reg39)) ?
                      ((wire36 > wire34) ~^ (wire28 && wire26)) : wire34))};
              reg43 <= (^~{(($signed(wire37) ?
                      $signed(reg42) : (8'hb8)) < (reg33[(1'h1):(1'h1)] << $unsigned(reg38))),
                  $unsigned(reg42)});
              reg44 <= wire25[(4'hc):(4'h8)];
            end
          else
            begin
              reg41 <= reg41[(4'hc):(4'hb)];
            end
        end
      else
        begin
          reg38 <= ((($signed(reg44[(3'h4):(2'h2)]) ?
                  (8'hae) : ({reg40} ? (|wire25) : (reg40 >>> reg44))) ?
              wire30[(3'h4):(3'h4)] : (~|(^reg38[(3'h6):(3'h6)]))) & (~&wire27));
          reg39 <= $unsigned((reg41 * ($signed({reg38}) <<< ($unsigned(wire27) & $signed((8'hb0))))));
          reg40 <= {($unsigned(reg42[(1'h0):(1'h0)]) ?
                  (&wire25) : {(~&wire34[(3'h5):(1'h1)]), wire32})};
          reg41 <= ($signed(reg42) ? reg42[(1'h1):(1'h1)] : (8'hb8));
          reg42 <= $unsigned($unsigned($unsigned($unsigned((8'had)))));
        end
      reg45 <= $signed($unsigned(($signed(wire26) && (wire35[(2'h3):(1'h1)] + (wire28 ?
          (8'hbf) : wire27)))));
    end
  assign wire46 = wire37;
  assign wire47 = {((8'hbb) ?
                          (~(wire46[(3'h4):(1'h1)] ^~ $unsigned(reg41))) : $unsigned($signed($unsigned(wire25)))),
                      reg42};
endmodule
