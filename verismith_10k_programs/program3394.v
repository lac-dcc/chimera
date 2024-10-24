module top
#(parameter param75 = ({(((&(7'h41)) ? ((8'ha9) ? (8'hb9) : (8'hb2)) : ((8'hb9) ? (8'hb1) : (8'hb3))) ? {((8'hbf) ~^ (7'h42))} : ((!(8'haa)) ? {(8'hb7)} : ((8'ha3) ~^ (8'ha6))))} ? (((|{(8'hbe), (8'haf)}) < (~&((8'ha1) ? (8'h9c) : (8'hbb)))) | {(&(&(7'h43)))}) : (((((8'ha7) ? (8'ha9) : (8'hb6)) != {(8'hb5)}) ? ((8'ha5) * (|(8'haf))) : (((8'hab) <<< (8'ha5)) << ((8'ha9) ~^ (8'hb0)))) || (&{((8'hae) || (8'had))}))), 
parameter param76 = (param75 <= param75))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  assign y = {wire74,
                 wire68,
                 wire6,
                 wire5,
                 wire4,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire4 = ((+wire3) || wire1);
  assign wire5 = ($signed((wire1 ?
                         ((wire0 ?
                             wire1 : wire1) - (~^wire1)) : $signed($signed(wire2)))) ?
                     ($signed(((&wire2) ?
                             $unsigned(wire2) : $signed((8'hb6)))) ?
                         $unsigned($unsigned({wire0})) : $signed(wire4)) : (wire4[(3'h4):(1'h0)] ?
                         $signed($unsigned($signed(wire4))) : wire2));
  assign wire6 = wire4;
  module7 #() modinst69 (wire68, clk, wire6, wire2, wire1, wire3);
  always
    @(posedge clk) begin
      reg70 <= wire1[(3'h5):(2'h2)];
      reg71 <= {wire1};
      reg72 <= (((((wire6 ?
                  wire4 : wire68) >= $unsigned(reg71)) == $signed($signed(reg70))) ?
              (($unsigned(wire6) ? ((8'ha3) && (8'ha5)) : reg71) ?
                  ((wire4 ? wire68 : wire6) ^ (wire3 ?
                      (8'ha0) : wire4)) : ($unsigned(wire5) ?
                      $signed(wire5) : reg71[(4'hb):(2'h3)])) : (~$unsigned(wire3))) ?
          $unsigned(wire1) : $unsigned((^~(wire1 >= reg70[(3'h7):(3'h5)]))));
      reg73 <= (+{(^(~^wire5[(3'h6):(3'h4)]))});
    end
  assign wire74 = (!$unsigned(((wire1 || $unsigned((8'haf))) && $unsigned($signed(reg71)))));
endmodule

module module7
#(parameter param66 = ((((~|{(8'ha6)}) ? (((8'h9f) ? (8'ha8) : (8'hbe)) <= {(8'ha0), (8'hbd)}) : ({(8'had)} < (+(7'h43)))) ? {(^~((8'h9f) - (8'ha2)))} : ((-(+(8'ha0))) ? (((8'had) ? (8'ha5) : (8'hb5)) ? ((8'hae) & (8'hba)) : ((8'hab) ? (8'h9f) : (7'h40))) : (8'had))) ? (-({((8'ha2) ? (8'hb3) : (8'hb9)), ((8'hb9) * (8'hb7))} ? (&((8'hb0) ? (8'hac) : (8'hb7))) : (&((7'h41) * (8'hbe))))) : (^(!((8'hbd) <<< {(8'hbd), (7'h44)})))), 
parameter param67 = param66)
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire35;
  assign y = {wire64,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire12,
                 wire35,
                 (1'h0)};
  assign wire12 = $signed((!($signed(wire11) > {(wire11 == wire10)})));
  module13 #() modinst36 (.wire15(wire10), .y(wire35), .wire17(wire9), .clk(clk), .wire14(wire12), .wire16(wire11), .wire18(wire8));
  assign wire37 = ($unsigned(wire11[(1'h1):(1'h0)]) << $unsigned((!$signed($signed(wire8)))));
  assign wire38 = wire11[(3'h6):(3'h4)];
  assign wire39 = ($unsigned($signed({(wire8 ?
                          wire9 : wire38)})) == $signed((|$unsigned((wire35 < wire38)))));
  assign wire40 = wire39;
  assign wire41 = wire40;
  assign wire42 = (($signed(wire8) >>> $signed(((^wire35) ?
                          wire39[(1'h0):(1'h0)] : (wire37 >>> wire41)))) ?
                      wire11[(1'h1):(1'h1)] : wire39);
  assign wire43 = $unsigned(wire41);
  module44 #() modinst65 (wire64, clk, wire40, wire35, wire37, wire41);
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire48;
  input wire signed [(4'hd):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  input wire signed [(2'h2):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire49 = (|{(-(~&((8'hb9) * wire45)))});
  assign wire50 = wire48[(2'h2):(1'h1)];
  assign wire51 = (!($signed($unsigned($unsigned(wire49))) ?
                      {wire47[(4'h9):(2'h2)],
                          (&wire47[(4'h9):(4'h8)])} : ((|wire47[(3'h4):(1'h0)]) ?
                          $unsigned($signed(wire47)) : ($signed(wire49) ?
                              (8'hb9) : (wire45 ? wire47 : wire48)))));
  assign wire52 = wire49;
  assign wire53 = ($signed(((~|$unsigned(wire46)) ?
                      ($signed(wire52) - (wire50 ?
                          wire48 : wire45)) : (|wire45))) * wire52);
  assign wire54 = ((wire45 ?
                      $unsigned(wire49[(1'h0):(1'h0)]) : (wire50 == (^wire45[(1'h1):(1'h1)]))) ^ wire49);
  assign wire55 = {$signed($signed(wire50[(4'ha):(4'h9)]))};
  assign wire56 = $unsigned($unsigned((!(-{(8'hb6), wire52}))));
  always
    @(posedge clk) begin
      reg57 <= wire51;
      reg58 <= $unsigned({$signed($signed({wire56, wire52})),
          (wire52 < (|{wire50, wire46}))});
    end
  always
    @(posedge clk) begin
      reg59 <= (-({($unsigned(wire53) ?
              wire53 : $signed(wire46))} > (-{wire48[(2'h3):(1'h0)]})));
      reg60 <= $unsigned((+((wire47[(3'h7):(3'h5)] ?
              (wire49 ? wire49 : wire54) : $signed(reg59)) ?
          $signed(wire54[(4'h9):(3'h4)]) : wire55[(4'h9):(3'h7)])));
      reg61 <= ($signed($unsigned(wire47[(4'h9):(1'h0)])) >>> (^~(~|wire49[(2'h2):(1'h0)])));
      reg62 <= wire48;
      reg63 <= $unsigned(($signed($signed(wire54)) ~^ reg60[(1'h0):(1'h0)]));
    end
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire28,
                 wire27,
                 wire20,
                 wire19,
                 reg30,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire19 = $signed($unsigned(wire14[(3'h7):(1'h1)]));
  assign wire20 = wire15;
  always
    @(posedge clk) begin
      if (wire14)
        begin
          reg21 <= wire20;
          reg22 <= ((wire18 ?
                  wire14 : ($signed((wire17 ? (8'hbd) : wire15)) < (~|(reg21 ?
                      wire20 : wire20)))) ?
              (|{($unsigned(wire20) <<< $unsigned(wire16)),
                  $signed(wire17[(2'h2):(1'h1)])}) : ($signed(wire14[(3'h5):(1'h0)]) ?
                  wire15 : $unsigned(($signed(wire15) ?
                      $signed(reg21) : (-wire14)))));
          reg23 <= (($unsigned((+{wire14})) || $unsigned((~^$signed(wire17)))) >> wire16);
          reg24 <= ((!wire16) ^~ reg23);
        end
      else
        begin
          reg21 <= ((reg24[(4'ha):(4'ha)] ?
              wire14[(3'h5):(1'h0)] : (8'hb4)) + reg23[(4'h8):(3'h7)]);
          reg22 <= ($unsigned({reg24[(3'h4):(1'h0)],
              reg24[(4'hc):(3'h4)]}) | (($unsigned((wire14 << wire16)) ?
                  wire15 : reg22) ?
              $signed((wire14[(3'h5):(1'h1)] - (|wire18))) : (+wire16[(4'hb):(3'h4)])));
          if ((wire18 ?
              (reg24[(2'h3):(1'h0)] ?
                  reg21[(1'h0):(1'h0)] : $unsigned(((wire18 ?
                      wire14 : wire19) ^ wire16[(4'hf):(4'hb)]))) : reg21))
            begin
              reg23 <= $signed((wire15 ?
                  $unsigned({(wire20 >= reg23)}) : (((reg24 ? wire20 : wire17) ?
                          $signed(wire17) : wire19) ?
                      $unsigned(reg24) : wire15[(2'h2):(2'h2)])));
              reg24 <= wire20[(1'h0):(1'h0)];
              reg25 <= wire14;
            end
          else
            begin
              reg23 <= reg24;
              reg24 <= (&reg25);
              reg25 <= ($signed(wire16[(2'h3):(1'h1)]) && $unsigned((|(~&(wire14 ?
                  wire19 : wire18)))));
              reg26 <= (8'hb0);
            end
        end
    end
  assign wire27 = wire16;
  assign wire28 = $unsigned({(((wire19 + reg26) ~^ ((8'had) ?
                          wire15 : wire14)) >>> reg24[(2'h2):(1'h1)])});
  assign wire29 = reg26[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg30 <= ((^$signed(wire16[(2'h3):(1'h0)])) ?
          $unsigned($signed(wire29)) : $unsigned(wire27[(2'h2):(1'h0)]));
    end
  assign wire31 = wire14[(3'h6):(3'h6)];
  assign wire32 = {(|((((8'hbc) & reg22) <= ((8'h9e) ?
                          reg21 : reg21)) ^ ((^~wire19) ^~ (wire16 ?
                          wire16 : wire29)))),
                      ($unsigned(($signed(wire28) >= $unsigned(reg24))) - ($unsigned((wire15 <= (7'h44))) ?
                          $signed((~^(8'haa))) : {(^~wire28)}))};
  assign wire33 = wire17;
  assign wire34 = wire31[(3'h4):(2'h3)];
endmodule
