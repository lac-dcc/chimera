module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire4;
  assign y = {wire74, wire72, wire46, wire4, (1'h0)};
  assign wire4 = (~|((wire3[(2'h3):(2'h3)] ?
                         ((wire3 ? (7'h44) : wire1) ?
                             $signed(wire1) : wire1) : wire3) ?
                     wire2[(1'h1):(1'h1)] : $unsigned(((~&wire0) * $unsigned(wire2)))));
  module5 #() modinst47 (wire46, clk, wire2, wire1, wire3, wire0);
  module48 #() modinst73 (.wire49(wire0), .wire52(wire4), .y(wire72), .wire51(wire1), .clk(clk), .wire50(wire46));
  assign wire74 = {(wire1 | ((~|(wire3 ? (8'hb0) : wire4)) ^~ wire0))};
endmodule

module module48
#(parameter param70 = (8'hb1), 
parameter param71 = (param70 ? param70 : ((param70 * (^(param70 ? param70 : param70))) <= (((8'ha6) ~^ {param70, param70}) ? {((8'h9d) * param70)} : (|((8'haf) * (8'hac)))))))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire52;
  input wire signed [(4'hb):(1'h0)] wire51;
  input wire [(3'h5):(1'h0)] wire50;
  input wire [(3'h6):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire58,
                 wire57,
                 wire54,
                 wire53,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire53 = wire49;
  assign wire54 = (^~($unsigned(((~|wire50) ^~ (|wire53))) ^ (wire49[(1'h1):(1'h0)] ?
                      ({(8'hbd)} ?
                          $unsigned(wire51) : wire50) : $unsigned($signed(wire53)))));
  always
    @(posedge clk) begin
      reg55 <= ((!$signed((|wire53[(4'hd):(4'ha)]))) || wire50);
      reg56 <= $unsigned($signed(wire50[(2'h2):(2'h2)]));
    end
  assign wire57 = wire51;
  assign wire58 = ($signed(wire54[(4'ha):(2'h2)]) * (($signed(wire50[(1'h0):(1'h0)]) ?
                          (wire50 ?
                              $signed(reg55) : reg56) : (+$unsigned(wire49))) ?
                      reg55 : $signed(((wire51 ? wire49 : wire52) * wire49))));
  always
    @(posedge clk) begin
      if (wire53[(4'hf):(3'h6)])
        begin
          reg59 <= ($unsigned(wire52[(4'hb):(4'hb)]) + (((8'hbc) <= $signed($unsigned(wire54))) < (8'hbe)));
          reg60 <= (~|$signed(wire50));
          reg61 <= (~&$unsigned($unsigned((reg55 ?
              wire57 : $signed((8'hb8))))));
        end
      else
        begin
          reg59 <= (~&wire54[(1'h1):(1'h1)]);
        end
      reg62 <= (|{(({reg59} <= ((7'h40) ~^ wire57)) ? (8'ha6) : (8'ha0)),
          wire57});
    end
  assign wire63 = reg55;
  assign wire64 = $unsigned(wire49[(1'h1):(1'h0)]);
  assign wire65 = (8'had);
  assign wire66 = ($unsigned((reg55 ?
                      (^~(wire54 && wire49)) : ((^wire63) <<< $signed(reg60)))) >> {$signed((~(wire51 ?
                          reg62 : (8'ha7)))),
                      $signed((wire64 ?
                          $signed(wire50) : (wire52 ? reg59 : reg60)))});
  assign wire67 = {$signed((reg56[(3'h6):(3'h6)] | wire57[(1'h1):(1'h0)])),
                      wire54};
  assign wire68 = ({$signed(wire64),
                          $unsigned({wire54[(3'h4):(1'h0)],
                              ((8'hbd) ? reg56 : wire66)})} ?
                      (wire57 * (((wire57 ? reg62 : wire57) ?
                              reg61 : (wire49 ? wire58 : (8'ha4))) ?
                          $unsigned(reg59) : (wire49[(1'h0):(1'h0)] ?
                              (wire50 ?
                                  wire51 : wire49) : (^~(8'had))))) : ((((8'h9f) ?
                              reg56[(4'h9):(4'h8)] : ((7'h40) && wire54)) >= wire53[(4'ha):(3'h5)]) ?
                          $signed((^~wire53)) : wire57));
  assign wire69 = ((-(!$signed($unsigned(wire67)))) ?
                      ($signed(wire67[(3'h4):(3'h4)]) ^ (+($unsigned(wire53) ?
                          wire65[(2'h2):(2'h2)] : (8'hbf)))) : ((~^wire64[(1'h0):(1'h0)]) - ({(reg56 << reg56),
                              $signed(wire65)} ?
                          (8'ha1) : ((8'ha6) ?
                              wire66[(4'he):(4'hb)] : reg56))));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  assign y = {wire45,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 reg44,
                 reg43,
                 reg42,
                 reg13,
                 (1'h0)};
  assign wire10 = (+$signed($unsigned(wire6)));
  assign wire11 = (&(($signed((wire7 ? wire7 : (8'ha5))) ?
                          ((wire7 ? wire9 : wire9) * ((8'hbb) ?
                              wire8 : wire7)) : (~&$signed(wire9))) ?
                      (wire7 - (|(wire9 ? wire6 : wire10))) : wire9));
  assign wire12 = (~&$unsigned($unsigned($unsigned((wire7 != wire8)))));
  always
    @(posedge clk) begin
      reg13 <= $signed(wire12);
    end
  assign wire14 = $signed({{wire6, $signed($signed(wire12))}});
  module15 #() modinst38 (.y(wire37), .wire18(wire9), .wire16(wire11), .wire17(wire7), .wire19(wire10), .clk(clk));
  assign wire39 = {((^$signed((wire9 << wire14))) ? reg13 : reg13)};
  assign wire40 = (~$signed((((+(8'hac)) < wire6[(2'h2):(1'h0)]) <= (&$unsigned(wire8)))));
  assign wire41 = (wire12[(1'h0):(1'h0)] ^ wire7[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg42 <= ($signed(wire37[(1'h0):(1'h0)]) * ((8'ha7) ?
          wire12[(2'h3):(2'h2)] : {($signed(wire6) ?
                  {(8'hb1)} : $signed(wire12)),
              (wire8[(3'h7):(2'h2)] + (wire7 ? wire14 : (8'hb7)))}));
      reg43 <= {wire39[(2'h3):(2'h2)], wire6};
      reg44 <= (($unsigned(((wire6 || wire14) << (reg43 >= reg13))) ?
              $signed($signed((8'ha5))) : $unsigned(wire14[(4'hb):(3'h6)])) ?
          ($unsigned(reg43) ?
              (((8'hb0) ?
                      (reg42 ? (8'hb3) : reg43) : ((8'h9f) ? reg42 : wire12)) ?
                  wire14[(4'hb):(3'h4)] : (&wire9)) : ((+$unsigned((8'hb9))) ^ $unsigned($unsigned(reg42)))) : {wire14,
              (-(^~(+reg42)))});
    end
  assign wire45 = $signed($signed((^~$unsigned((reg13 ? wire7 : reg44)))));
endmodule

module module15
#(parameter param36 = (((~^(~|(~^(8'hab)))) ? ((&(~(7'h42))) == (^((8'ha6) ~^ (8'hbb)))) : {(^(^(8'hb4))), (8'hab)}) != (((((8'ha1) >>> (8'hb3)) ? ((8'ha7) ? (8'ha8) : (7'h42)) : ((8'ha0) ? (8'hba) : (8'haf))) > ({(7'h41)} == ((8'h9c) ~^ (8'hbc)))) >>> ({((8'hb2) ? (8'hb4) : (8'h9e)), {(8'ha4)}} ^~ (^((8'ha2) || (8'ha7)))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire21,
                 wire20,
                 reg29,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire20 = $unsigned((wire17[(5'h12):(4'hc)] <<< wire18));
  assign wire21 = ((wire19[(2'h3):(2'h3)] < ((((8'ha5) - wire16) ?
                          (^~wire20) : $unsigned(wire18)) <<< $signed(wire18[(4'h9):(1'h1)]))) ?
                      wire18[(4'h8):(1'h0)] : wire17[(4'he):(2'h2)]);
  always
    @(posedge clk) begin
      reg22 <= $signed(wire17[(4'hc):(3'h6)]);
      reg23 <= $signed(wire21[(1'h0):(1'h0)]);
      reg24 <= wire18[(4'hc):(1'h0)];
      reg25 <= $signed((wire16 >>> ($signed(wire18[(4'hc):(4'h8)]) ?
          (~|(reg23 ? wire19 : reg22)) : ((wire17 + wire17) ?
              (8'hb7) : $unsigned(wire20)))));
    end
  assign wire26 = wire19[(1'h0):(1'h0)];
  assign wire27 = reg25;
  assign wire28 = $signed($unsigned((|(wire19 & (7'h41)))));
  always
    @(posedge clk) begin
      reg29 <= (~&$signed((&wire17[(3'h4):(2'h2)])));
    end
  assign wire30 = $signed((8'hb6));
  assign wire31 = {$unsigned(($unsigned({(8'h9c)}) << ($signed(wire30) ?
                          reg22[(4'h9):(3'h6)] : (wire28 < wire18)))),
                      ((($signed(wire17) ^ (+(8'hba))) ?
                              $signed((wire20 - reg25)) : reg23) ?
                          (reg24[(4'h9):(4'h9)] ?
                              {wire17[(2'h2):(1'h1)],
                                  (wire18 ?
                                      wire19 : reg25)} : ((reg23 >= (8'h9c)) ^~ $signed(wire28))) : ((~|{reg24}) ?
                              wire30 : ((-(8'hb9)) >= wire17[(4'hd):(4'hd)])))};
  assign wire32 = (wire16[(3'h6):(2'h2)] ?
                      $unsigned(wire26) : (|$unsigned(($unsigned(reg24) < (^wire28)))));
  assign wire33 = wire17[(4'h8):(3'h5)];
  assign wire34 = $signed($unsigned($unsigned({(+wire27)})));
  assign wire35 = {(wire18[(3'h6):(2'h3)] | (~^wire32[(1'h1):(1'h1)]))};
endmodule
