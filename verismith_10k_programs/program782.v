module top
#(parameter param73 = ((~|{(&((7'h41) ? (8'hbd) : (8'hbd)))}) > ((~&(((7'h42) ? (8'hac) : (7'h41)) ? ((8'ha6) == (8'hba)) : ((8'hb0) < (8'ha2)))) ^ (8'ha9))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire23;
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire4,
                 wire5,
                 wire23,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire4 = ((!(~^{wire2,
                     (wire2 ?
                         wire0 : (8'hb7))})) & $signed(wire1[(1'h0):(1'h0)]));
  assign wire5 = wire0[(1'h0):(1'h0)];
  module6 #() modinst24 (.clk(clk), .wire11(wire4), .y(wire23), .wire8(wire3), .wire7(wire1), .wire9(wire2), .wire10(wire0));
  module25 #() modinst50 (.wire26(wire3), .wire28(wire2), .wire29(wire0), .clk(clk), .wire27(wire4), .y(wire49));
  assign wire51 = (wire49[(2'h3):(1'h0)] ?
                      wire3 : (wire4 ^~ $unsigned({$signed((8'hbe)),
                          (wire0 == wire23)})));
  assign wire52 = wire49;
  assign wire53 = wire4;
  assign wire54 = wire4[(4'ha):(3'h6)];
  assign wire55 = $unsigned((&wire2));
  always
    @(posedge clk) begin
      if ($unsigned(wire2[(4'hf):(4'hd)]))
        begin
          if ((|(~^{$unsigned(wire55[(4'h8):(3'h7)])})))
            begin
              reg56 <= wire49[(2'h3):(2'h3)];
              reg57 <= $unsigned(((8'ha7) * $signed($signed((wire52 ~^ reg56)))));
              reg58 <= $unsigned(wire2);
            end
          else
            begin
              reg56 <= wire54[(5'h10):(4'hf)];
              reg57 <= (+{(8'hbd)});
              reg58 <= $signed(({$signed(reg56),
                  wire2[(4'hc):(2'h3)]} <<< wire4));
            end
          if (wire55)
            begin
              reg59 <= $signed($unsigned({wire0,
                  {wire55[(4'h9):(2'h3)], wire3}}));
              reg60 <= $unsigned({((wire23 <= $signed((8'ha5))) * ((!wire54) ?
                      $signed(wire52) : $unsigned(wire0)))});
              reg61 <= {{(!$signed($unsigned(reg57))), wire51}, $signed(wire5)};
              reg62 <= wire23[(5'h10):(4'ha)];
              reg63 <= wire52;
            end
          else
            begin
              reg59 <= (wire49 ? (!(8'ha5)) : $unsigned(reg58));
              reg60 <= ($unsigned({({reg56, reg60} ?
                      (reg58 > reg61) : $signed(reg57))}) >>> (reg63 ?
                  $signed(((8'hb7) ?
                      (8'hb5) : (wire51 ?
                          reg58 : wire49))) : reg59[(2'h3):(1'h1)]));
              reg61 <= wire51;
              reg62 <= $unsigned({$signed({(&wire23), {(8'hb4), wire53}}),
                  wire54[(4'hd):(4'hd)]});
            end
          if (wire23[(2'h2):(2'h2)])
            begin
              reg64 <= $unsigned(wire23[(3'h6):(3'h5)]);
            end
          else
            begin
              reg64 <= $unsigned(({((-reg58) >> (wire53 <= wire2)), (7'h42)} ?
                  ($signed((wire2 <= (8'ha7))) ?
                      wire5[(4'h8):(1'h1)] : wire23) : wire53));
              reg65 <= wire49[(2'h2):(2'h2)];
              reg66 <= (wire0[(1'h0):(1'h0)] ?
                  $unsigned((~|(&(+(8'hab))))) : $signed((reg63 ?
                      ((+wire0) ?
                          (~reg64) : wire5) : $unsigned($signed(wire4)))));
              reg67 <= {(reg57 >> (8'ha1))};
            end
        end
      else
        begin
          reg56 <= (reg56 ?
              wire5 : ($signed((8'hbe)) ?
                  reg63[(2'h2):(1'h0)] : {$unsigned((reg67 ?
                          wire1 : (8'ha9)))}));
          reg57 <= ($signed($signed(wire2)) ?
              reg65[(2'h3):(1'h1)] : wire0[(2'h3):(1'h1)]);
          reg58 <= $unsigned((reg64 || {$signed($signed((8'ha6))),
              (reg57 != (~&reg67))}));
          if (({$unsigned((wire49[(2'h3):(1'h1)] == (reg64 * wire54))),
              reg66} + ($unsigned(wire49[(1'h1):(1'h1)]) ^~ (reg66[(4'hf):(4'he)] ?
              reg66 : $signed(wire3[(1'h0):(1'h0)])))))
            begin
              reg59 <= ((reg63[(3'h5):(2'h3)] ?
                  reg65 : (8'ha9)) | (wire49 <<< ((^(!reg66)) ?
                  $signed($signed(reg61)) : reg61)));
              reg60 <= $signed(wire53);
              reg61 <= wire4[(4'hd):(3'h6)];
              reg62 <= $unsigned(({$signed(reg67),
                      (reg57[(1'h0):(1'h0)] & $unsigned((8'h9d)))} ?
                  (7'h43) : wire3[(2'h3):(2'h2)]));
              reg63 <= $signed((((wire52 < (~|wire49)) | {(~&(8'hab))}) == (((reg58 || wire54) ?
                  wire5[(4'he):(3'h4)] : $unsigned(wire49)) == wire49[(2'h3):(2'h3)])));
            end
          else
            begin
              reg59 <= (($unsigned(($signed(wire23) + (reg65 ?
                      wire53 : (8'hab)))) || {(|(wire51 - (8'ha8))),
                      {(wire53 ~^ reg58)}}) ?
                  reg61 : wire4[(3'h5):(1'h1)]);
              reg60 <= {(^$unsigned(((~|wire1) ?
                      $unsigned(reg59) : (reg57 ? wire23 : reg64))))};
              reg61 <= wire5[(4'hd):(4'hb)];
            end
          reg64 <= ((^wire3) * $signed((~|$unsigned($signed(reg60)))));
        end
      reg68 <= $unsigned((wire51[(4'h8):(2'h3)] ?
          reg66[(4'h8):(3'h5)] : reg63[(2'h2):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg69 <= (8'h9c);
      reg70 <= $signed((reg56 < {((^~(8'ha1)) <= (~wire3))}));
      reg71 <= wire55[(2'h2):(1'h1)];
      reg72 <= wire0[(2'h2):(1'h1)];
    end
endmodule

module module25
#(parameter param48 = {(((((8'hb5) ? (8'hb8) : (8'hb1)) > (7'h43)) ? (&((8'h9e) > (8'hbd))) : (~(^(8'hae)))) ? (((~|(8'had)) ? ((8'hb1) > (7'h41)) : ((7'h44) ? (8'hb0) : (8'hae))) ? {((8'ha1) <= (8'hb7))} : {((8'h9e) ? (7'h44) : (8'hae))}) : {{((8'h9c) ? (8'hac) : (8'h9c)), ((8'hac) ? (7'h42) : (8'hba))}, ((&(8'hb2)) >= {(8'ha8)})})})
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire signed [(2'h3):(1'h0)] wire27;
  input wire [(4'ha):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire30;
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire30,
                 reg40,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire30 = $unsigned(wire29);
  always
    @(posedge clk) begin
      reg31 <= $signed(wire30);
      reg32 <= wire27[(2'h3):(2'h2)];
      reg33 <= ($signed(wire26) ?
          $unsigned((wire26[(3'h5):(2'h3)] & wire28)) : (^$signed($signed((wire30 ?
              wire26 : wire28)))));
    end
  assign wire34 = wire29[(2'h3):(1'h1)];
  assign wire35 = $signed((^~wire26[(4'h8):(1'h0)]));
  assign wire36 = $unsigned(({wire30[(1'h0):(1'h0)], $signed($signed(wire28))} ?
                      $unsigned(wire28[(1'h0):(1'h0)]) : {$unsigned($unsigned(wire28)),
                          (7'h42)}));
  assign wire37 = (wire26 > reg33[(2'h2):(1'h0)]);
  assign wire38 = (!wire37);
  assign wire39 = (+(^{((~&wire26) ^ $signed(wire36)),
                      (wire28[(4'h8):(1'h1)] ? (reg32 - wire27) : (8'haa))}));
  always
    @(posedge clk) begin
      reg40 <= ($unsigned($unsigned(((^~wire35) ?
          (wire35 || (8'hb0)) : (wire28 ?
              wire36 : wire35)))) == (^~(-$unsigned($signed(wire37)))));
    end
  assign wire41 = $signed(wire37[(1'h0):(1'h0)]);
  assign wire42 = (|wire37);
  assign wire43 = {$unsigned((8'ha2))};
  assign wire44 = reg33[(2'h2):(1'h1)];
  assign wire45 = (wire27[(2'h3):(1'h0)] ?
                      $unsigned($signed((wire43[(3'h6):(3'h5)] ~^ (8'hb0)))) : $unsigned(($signed(((8'ha6) && wire41)) ?
                          $signed(wire29) : (!$unsigned(wire26)))));
  assign wire46 = wire44;
  assign wire47 = wire45;
endmodule

module module6
#(parameter param21 = ((|(7'h42)) ? (&(|(((8'hb0) >= (8'hbd)) ? ((8'h9f) | (8'h9c)) : (-(8'h9f))))) : (7'h40)), 
parameter param22 = param21)
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire12;
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire20,
                 wire14,
                 wire12,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg13,
                 (1'h0)};
  assign wire12 = ((8'haf) > $signed($unsigned(wire7)));
  always
    @(posedge clk) begin
      reg13 <= $unsigned(wire7[(4'h9):(1'h1)]);
    end
  assign wire14 = ((wire9 + (7'h44)) ^ wire8[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg15 <= wire8[(2'h2):(1'h0)];
      reg16 <= (wire9[(4'hc):(2'h3)] ?
          (|reg13[(1'h0):(1'h0)]) : reg13[(2'h2):(1'h0)]);
      reg17 <= ((wire11 ?
              (((reg16 ? wire7 : wire11) ~^ (~&wire11)) && (!(wire8 ?
                  (8'hb3) : wire9))) : (wire12 ?
                  (8'ha4) : (^$unsigned(wire9)))) ?
          ((wire11 >>> wire11[(3'h4):(1'h1)]) ?
              $unsigned($unsigned((wire14 ?
                  reg13 : wire12))) : {reg15}) : $signed($signed(wire11[(3'h7):(1'h0)])));
      reg18 <= (((-wire7) ^ (($signed(reg17) >> {(8'ha0)}) ^~ wire12)) ?
          (wire10[(3'h7):(3'h5)] ?
              $unsigned($signed(reg15)) : (&reg13[(1'h1):(1'h0)])) : $signed(wire7));
      reg19 <= (|wire8);
    end
  assign wire20 = $signed({wire8});
endmodule
