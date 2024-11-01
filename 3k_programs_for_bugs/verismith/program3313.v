module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire41,
                 wire40,
                 wire38,
                 wire7,
                 wire5,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg6,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire5 = $unsigned((&{wire1, (wire1[(2'h3):(1'h1)] ^ $signed(wire2))}));
  always
    @(posedge clk) begin
      reg6 <= (((&$unsigned(((8'ha4) ? wire5 : wire5))) | (8'ha1)) & (wire2 ?
          wire4 : (!(^~$unsigned(wire3)))));
    end
  assign wire7 = (wire5 ?
                     (((~|(-(8'h9f))) ?
                         (wire2 <= (-wire1)) : $signed($unsigned(wire2))) < ({wire2[(3'h7):(2'h3)]} <<< {{(8'hae),
                             (8'ha4)},
                         $signed(wire0)})) : $signed(((^~wire2) ?
                         (|(^~reg6)) : (wire4[(4'hb):(4'hb)] ?
                             wire5 : (wire1 >> wire5)))));
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire7[(1'h1):(1'h1)]);
      reg9 <= wire3;
      reg10 <= (-$signed((+wire2)));
    end
  module11 #() modinst39 (wire38, clk, reg9, reg6, reg8, wire7, wire1);
  assign wire40 = wire5[(2'h2):(2'h2)];
  assign wire41 = $signed($unsigned($unsigned(({(8'hab), wire0} ?
                      $unsigned(wire1) : $signed(wire5)))));
  always
    @(posedge clk) begin
      reg42 <= $signed(wire1[(1'h0):(1'h0)]);
      reg43 <= wire3[(3'h7):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg44 <= reg42[(1'h1):(1'h0)];
      reg45 <= wire41;
      reg46 <= (^~((((reg42 << reg10) >> ((8'ha1) ? wire40 : reg9)) ?
              (~|(8'h9e)) : (wire3 << (wire3 || wire38))) ?
          ($signed({wire0, reg44}) ?
              {$unsigned(reg44)} : wire3[(1'h1):(1'h1)]) : $unsigned((8'ha9))));
    end
  assign wire47 = (8'hac);
  assign wire48 = $signed((8'hb5));
  assign wire49 = reg44[(4'h8):(2'h3)];
  assign wire50 = ((|(-(8'ha3))) << $signed(wire4));
  assign wire51 = (reg46[(3'h5):(3'h5)] == $signed((reg9 ?
                      $unsigned((reg43 ?
                          wire47 : reg46)) : wire40[(4'ha):(3'h4)])));
  always
    @(posedge clk) begin
      reg52 <= $signed(wire5);
      reg53 <= ($signed(reg43) > wire47);
      reg54 <= ($unsigned(({$signed(reg52), wire47[(2'h3):(2'h3)]} ?
          $unsigned((reg9 >> wire3)) : wire47[(3'h4):(1'h1)])) * $unsigned(($unsigned({(8'hb9),
              wire3}) ?
          {(8'haf), $unsigned(reg52)} : $signed(((8'had) | wire50)))));
      if (reg53)
        begin
          reg55 <= {($signed((~wire2)) ?
                  wire0 : ((((8'ha2) + wire1) ?
                      (wire1 ?
                          reg10 : reg53) : {(8'ha3)}) + wire4[(3'h6):(1'h0)]))};
        end
      else
        begin
          reg55 <= (reg55 & reg54[(4'h9):(1'h0)]);
          reg56 <= ((&$signed($signed(wire50[(2'h3):(2'h3)]))) ?
              ((|wire0[(1'h1):(1'h1)]) ?
                  (reg6[(3'h4):(2'h2)] ?
                      (~(+reg45)) : (wire51 ?
                          (!wire41) : (wire3 > reg9))) : wire40) : wire7[(2'h2):(2'h2)]);
        end
    end
  assign wire57 = ($unsigned((~((wire1 ? reg10 : wire51) | (^reg56)))) ?
                      reg53[(1'h1):(1'h1)] : $unsigned({(^(+wire5)),
                          (-wire38[(4'ha):(1'h0)])}));
  assign wire58 = ((~&$unsigned($unsigned({wire4, reg8}))) ?
                      wire0 : $signed($unsigned($unsigned($unsigned((8'ha3))))));
  assign wire59 = reg52[(2'h3):(1'h1)];
  assign wire60 = ({(($unsigned(reg10) ^~ wire41[(5'h10):(4'hb)]) - (wire41 ?
                          $signed(reg56) : (~|wire48)))} <<< wire4);
endmodule

module module11
#(parameter param36 = (({((8'ha2) >= ((8'h9e) ? (8'hbb) : (8'ha6)))} ? (((^(8'had)) < ((8'ha1) ? (8'had) : (8'hbf))) ? ((|(8'hbd)) <= ((8'hb5) ? (8'hb3) : (8'hb7))) : (((8'hb9) - (8'hb3)) <<< (^~(8'ha0)))) : (~|(((8'hb4) ? (8'had) : (8'hb5)) ? ((8'hab) & (7'h43)) : {(8'hac)}))) || (((&((8'hbc) ? (8'had) : (8'haf))) ? (!((8'hbf) ? (8'ha4) : (8'hb5))) : (+(7'h40))) ? (-(((8'hb6) ? (8'ha3) : (7'h41)) ? ((8'hbc) ^~ (8'hab)) : (^~(8'hba)))) : ((~((8'hb3) & (8'h9e))) != ((&(8'hb4)) >>> (8'hbe))))), 
parameter param37 = (param36 ? ((param36 | (((8'hb5) ^~ param36) - (~|param36))) ? (|({param36} ? (8'hb4) : param36)) : ((~|{param36}) ? (8'ha6) : ((param36 | param36) * (param36 * (8'hb3))))) : param36))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  input wire signed [(4'h9):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= (-wire15);
      reg18 <= (&(^~wire16));
    end
  assign wire19 = ($unsigned((!wire12[(4'h8):(2'h3)])) <<< ($unsigned(($signed(reg17) ?
                      (wire16 ?
                          wire12 : wire16) : wire14[(4'h8):(4'h8)])) >= $unsigned(((wire16 * reg17) ?
                      (~^wire12) : ((8'hbb) ? (8'hbd) : wire15)))));
  assign wire20 = (wire12[(1'h0):(1'h0)] ?
                      $signed({(~^(~|wire13))}) : (|(~&wire16[(4'he):(2'h2)])));
  assign wire21 = wire12;
  assign wire22 = (~^({wire21} >= (^~$unsigned(reg18[(5'h13):(4'h8)]))));
  assign wire23 = wire13[(3'h6):(3'h6)];
  assign wire24 = (^$unsigned(wire14));
  assign wire25 = wire23[(1'h1):(1'h0)];
  assign wire26 = $unsigned($unsigned((!((reg17 >>> wire22) << $signed((8'hbc))))));
  assign wire27 = $unsigned($unsigned(reg18));
  assign wire28 = $unsigned($signed($signed(wire27[(3'h7):(1'h1)])));
  assign wire29 = (wire12 * ({{reg18[(5'h12):(2'h3)],
                          (wire19 | reg18)}} > wire22[(4'h8):(3'h6)]));
  assign wire30 = $signed(wire24[(3'h5):(3'h5)]);
  assign wire31 = wire21;
  assign wire32 = $signed((~&$unsigned((wire21[(4'h9):(2'h2)] ?
                      (~wire13) : wire27))));
  assign wire33 = wire13;
  assign wire34 = wire26[(4'hb):(3'h7)];
  assign wire35 = wire28[(4'hc):(4'h9)];
endmodule
