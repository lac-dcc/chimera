module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire53;
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  assign y = {wire20,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire53,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned((-((+wire3) ?
                     wire3[(2'h3):(1'h0)] : {wire3}))));
  assign wire6 = ($signed((((wire5 ? wire2 : wire2) ?
                         (wire2 ?
                             wire4 : wire3) : $signed(wire5)) >>> (+$unsigned((8'h9e))))) ?
                     $signed($unsigned((wire1[(4'hc):(3'h4)] ?
                         (wire3 ?
                             wire1 : (8'ha8)) : $signed(wire4)))) : $signed($signed(wire2)));
  assign wire7 = wire0;
  assign wire8 = {{(~&wire1[(3'h7):(3'h5)]), $unsigned(wire5[(4'hd):(2'h2)])},
                     $unsigned(wire0)};
  module9 #() modinst21 (wire20, clk, wire3, wire5, wire4, wire6, wire0);
  always
    @(posedge clk) begin
      reg22 <= (-wire8);
      reg23 <= wire8;
      reg24 <= (~^(8'hae));
    end
  assign wire25 = $unsigned(wire0[(1'h0):(1'h0)]);
  assign wire26 = wire3;
  assign wire27 = $unsigned(((+(~(reg24 ?
                      (8'hb9) : wire20))) * (^~$unsigned(wire3))));
  assign wire28 = wire7;
  assign wire29 = $signed(wire1[(3'h5):(2'h2)]);
  assign wire30 = wire3[(1'h0):(1'h0)];
  assign wire31 = $signed($unsigned((wire29[(1'h1):(1'h1)] ?
                      $unsigned($unsigned(wire0)) : reg23[(3'h6):(3'h6)])));
  assign wire32 = (~&wire26[(2'h2):(1'h0)]);
  assign wire33 = wire6[(3'h4):(2'h2)];
  module34 #() modinst54 (wire53, clk, wire6, wire32, wire8, wire28, wire2);
endmodule

module module34
#(parameter param52 = (~^(~((((8'h9d) ? (8'h9d) : (8'h9c)) || (-(8'hb9))) ? (8'hb5) : (((8'hae) ? (8'hb7) : (8'hbe)) ? (8'hbb) : ((8'hb2) ? (8'hbf) : (8'h9f)))))))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire39;
  input wire [(3'h4):(1'h0)] wire38;
  input wire [(3'h6):(1'h0)] wire37;
  input wire signed [(5'h10):(1'h0)] wire36;
  input wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  assign y = {wire41,
                 wire40,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = wire37;
  assign wire41 = $unsigned((|((~^wire37[(2'h3):(2'h3)]) == (~^$unsigned(wire36)))));
  always
    @(posedge clk) begin
      reg42 <= (~^(!wire35));
      if ((wire40 && ({{$signed(wire38), wire37[(1'h0):(1'h0)]}, wire39} ?
          wire38 : wire36)))
        begin
          reg43 <= (8'hb2);
          reg44 <= $signed(((+wire38[(3'h4):(1'h0)]) ?
              ({(8'ha5), $unsigned(wire41)} ?
                  $signed((!reg43)) : wire39[(1'h1):(1'h1)]) : ($unsigned(reg43) >> {(~wire41),
                  (~^(7'h41))})));
          reg45 <= (~^{((((8'hac) < (8'ha1)) <= $signed(wire36)) ?
                  {$signed(wire36)} : $signed((reg43 + wire40))),
              wire39});
          reg46 <= ($unsigned(wire36) ?
              {(~|($unsigned((8'hac)) << (wire37 ^ wire36)))} : {(((reg42 != reg42) ?
                          wire40 : $signed(wire37)) ?
                      wire37 : {(reg45 >= wire40)}),
                  ({wire36[(3'h5):(2'h2)], (~&reg45)} ?
                      ($unsigned((8'hbc)) ?
                          (wire37 << (8'hb3)) : wire35[(4'h9):(4'h8)]) : ((!wire40) + reg43[(2'h3):(1'h1)]))});
          reg47 <= {((!(~^(wire35 | reg43))) ?
                  wire41 : ((|(reg43 ~^ reg44)) != {(reg42 ? reg43 : reg43)}))};
        end
      else
        begin
          reg43 <= (^{$unsigned($unsigned({(8'hb2), reg45})), wire40});
          reg44 <= reg42;
          reg45 <= reg47;
          reg46 <= (^~wire38[(2'h3):(1'h0)]);
        end
      reg48 <= {(!($unsigned($unsigned(reg42)) << (reg42[(1'h1):(1'h1)] ?
              $unsigned(reg42) : $unsigned(wire39))))};
      reg49 <= (^(~|(wire38[(2'h2):(2'h2)] ~^ {{wire40}})));
    end
  always
    @(posedge clk) begin
      if ({$signed((^~$signed({reg47, reg43})))})
        begin
          reg50 <= ($unsigned({({reg44, wire39} >>> $signed(reg43))}) ?
              (wire36 ?
                  wire37 : $unsigned($signed(wire35))) : {$signed($signed(wire37[(1'h1):(1'h0)]))});
          reg51 <= ($signed($unsigned(((reg48 & reg44) ?
                  (wire38 - reg49) : (reg44 + reg49)))) ?
              $unsigned({(wire38[(1'h1):(1'h0)] ?
                      $signed(reg44) : (^(8'hbc)))}) : (reg48[(1'h1):(1'h0)] ?
                  wire39[(3'h4):(3'h4)] : wire37[(1'h1):(1'h0)]));
        end
      else
        begin
          reg50 <= $unsigned($unsigned(wire38));
          reg51 <= ((!(reg48[(1'h1):(1'h0)] << ((wire36 ?
                  reg49 : wire40) < (8'had)))) ?
              reg51 : {$unsigned($signed($unsigned(wire38)))});
        end
    end
endmodule

module module9
#(parameter param19 = (!(&(^~(&((8'ha9) ? (8'hb5) : (8'hb1)))))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h20):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  assign y = {wire18, wire16, wire15, reg17, (1'h0)};
  assign wire15 = wire12;
  assign wire16 = ((&(&(((8'hbf) <<< wire11) ?
                      (wire12 ?
                          wire12 : wire10) : wire14))) == wire12[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg17 <= (({wire12,
              ((wire12 ?
                  wire11 : wire10) || (wire13 || (8'hb7)))} ^ {$unsigned((^wire10)),
              wire16}) ?
          wire13 : wire15);
    end
  assign wire18 = (^($signed((^wire14[(3'h5):(1'h1)])) ?
                      $unsigned(((8'hbd) ?
                          wire12[(1'h0):(1'h0)] : $unsigned(wire13))) : $unsigned((~&(wire13 ?
                          wire11 : wire14)))));
endmodule
