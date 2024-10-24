module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h207):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire20;
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire43,
                 wire41,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire4,
                 wire5,
                 wire20,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire3[(1'h0):(1'h0)];
  module6 #() modinst21 (wire20, clk, wire4, wire0, wire5, wire3, wire2);
  assign wire22 = $signed((~&{$signed((wire2 ? wire3 : wire20))}));
  assign wire23 = ((~(-(wire22[(4'he):(4'he)] ?
                      (7'h41) : $signed(wire0)))) ~^ (-wire3[(5'h10):(3'h5)]));
  assign wire24 = (((|{$unsigned(wire2),
                      wire4}) > $unsigned(((~&wire20) >> wire5[(5'h11):(4'ha)]))) & wire22[(3'h5):(3'h4)]);
  assign wire25 = {wire1[(4'hc):(4'h8)]};
  module26 #() modinst42 (.wire28(wire24), .clk(clk), .wire27(wire20), .wire30(wire22), .wire29(wire25), .y(wire41));
  assign wire43 = wire20[(4'h8):(2'h2)];
  always
    @(posedge clk) begin
      if (((8'hb4) + (^~wire0)))
        begin
          reg44 <= wire2;
          reg45 <= ((~&$unsigned((8'h9c))) ^~ wire22);
          reg46 <= {$unsigned((|($signed(wire4) > $unsigned(wire43))))};
          reg47 <= (|((7'h40) ?
              $unsigned(($unsigned(wire1) ?
                  (wire22 != (8'hb7)) : (wire3 ~^ wire41))) : (|{(^~wire20)})));
          reg48 <= wire3[(4'hb):(1'h0)];
        end
      else
        begin
          reg44 <= (-(^~reg47));
          if ($signed($signed(wire24[(3'h6):(3'h4)])))
            begin
              reg45 <= $unsigned(($unsigned(wire0) ^~ ((+(wire3 ?
                      reg46 : wire2)) ?
                  wire2[(2'h2):(2'h2)] : $signed({wire4}))));
              reg46 <= wire2[(4'ha):(2'h2)];
            end
          else
            begin
              reg45 <= $signed((($signed(reg45) ?
                  $signed(reg48[(5'h10):(1'h0)]) : (|reg44)) - $unsigned((+(+reg45)))));
              reg46 <= (wire4[(1'h1):(1'h0)] ~^ {($unsigned((wire0 ~^ wire22)) << {$unsigned(wire0),
                      (wire1 >>> wire2)}),
                  $signed($unsigned(wire4[(3'h7):(2'h3)]))});
              reg47 <= wire24[(3'h6):(1'h1)];
              reg48 <= $signed(((8'hba) && ((reg46[(4'hc):(4'h8)] + ((8'hbf) * reg46)) ?
                  (~&wire0) : $signed((reg48 ? wire23 : wire22)))));
              reg49 <= reg45;
            end
          reg50 <= (|$unsigned(($signed($unsigned(wire25)) ^~ wire41[(4'h9):(4'h9)])));
          reg51 <= wire25;
          reg52 <= $signed($unsigned((($unsigned(wire20) <= $signed(wire4)) ~^ $signed((reg47 && reg44)))));
        end
      if ((^(&(^~$unsigned($unsigned(wire2))))))
        begin
          if ((!$signed(wire0[(4'hb):(3'h4)])))
            begin
              reg53 <= reg48;
              reg54 <= (&(wire23 ? wire23[(3'h7):(3'h4)] : $signed(wire22)));
            end
          else
            begin
              reg53 <= $unsigned($unsigned($unsigned((8'hb8))));
              reg54 <= $signed((7'h44));
            end
        end
      else
        begin
          reg53 <= (($signed({{reg49}, reg45[(1'h1):(1'h1)]}) ?
              reg49[(4'h9):(1'h1)] : $signed(wire5[(4'hf):(4'hf)])) >= wire24);
          reg54 <= $signed(((!((^(7'h44)) ?
              $unsigned(wire3) : (^wire0))) < (wire43[(5'h12):(3'h4)] ?
              ((wire24 ?
                  wire41 : (8'ha4)) != $signed(reg48)) : $signed($signed((8'hb5))))));
          if ($unsigned(wire2[(3'h5):(3'h4)]))
            begin
              reg55 <= wire25;
              reg56 <= wire1;
              reg57 <= $signed(reg53);
            end
          else
            begin
              reg55 <= (-{{($unsigned(wire24) ? (&(8'ha5)) : (&wire5)), wire20},
                  $unsigned({$unsigned((8'hb4)), wire5[(4'hd):(3'h4)]})});
              reg56 <= ($signed(reg50) + ((~&(^$signed(wire23))) ?
                  $signed(($unsigned(wire2) | wire23)) : wire20[(5'h10):(4'hb)]));
              reg57 <= reg48;
              reg58 <= wire2[(4'hf):(2'h2)];
              reg59 <= $signed((reg47[(3'h7):(2'h2)] * {(8'hbd)}));
            end
        end
      if (reg56[(3'h4):(1'h0)])
        begin
          reg60 <= wire23[(1'h0):(1'h0)];
          if ({($unsigned($signed(reg52)) ? wire2 : reg53),
              $signed({(reg52[(4'hd):(3'h5)] || $unsigned(wire2))})})
            begin
              reg61 <= ($unsigned((8'hac)) ?
                  (~|wire20[(4'h8):(4'h8)]) : (wire2[(2'h2):(2'h2)] ~^ $unsigned((~(reg58 ?
                      wire3 : reg47)))));
              reg62 <= wire1[(4'h9):(3'h7)];
            end
          else
            begin
              reg61 <= reg59;
              reg62 <= ($unsigned({$signed((wire5 ?
                      reg46 : (8'hbd)))}) ^~ (~(&((+wire23) ?
                  $signed(wire43) : {wire1}))));
              reg63 <= $signed(wire2[(4'h9):(3'h4)]);
              reg64 <= $signed($unsigned((&(~&(wire1 >= (7'h41))))));
              reg65 <= $signed(reg58[(4'he):(4'hb)]);
            end
          reg66 <= wire43[(2'h2):(1'h1)];
        end
      else
        begin
          if ({$signed(reg50), reg52})
            begin
              reg60 <= (+reg54[(1'h0):(1'h0)]);
              reg61 <= (~reg58);
              reg62 <= ((({reg44} == $signed((+(7'h42)))) ?
                      reg49[(5'h10):(4'he)] : {$signed((!reg65))}) ?
                  $signed((+(reg47 ?
                      $signed((7'h43)) : $unsigned(wire20)))) : reg45);
              reg63 <= {(8'h9c)};
            end
          else
            begin
              reg60 <= ((!(wire24 * ($unsigned(reg55) ?
                  (7'h42) : $unsigned(wire24)))) ^ {($signed($signed(wire1)) < reg59)});
              reg61 <= $unsigned($signed(wire3));
              reg62 <= (~&reg57);
              reg63 <= reg46;
              reg64 <= (^wire0);
            end
          if ($signed((wire23[(2'h2):(1'h0)] ?
              ((8'h9e) ?
                  ($signed(wire3) ?
                      (|reg54) : (wire0 ?
                          wire4 : reg62)) : $unsigned(wire22[(3'h6):(2'h3)])) : reg46)))
            begin
              reg65 <= reg44;
              reg66 <= $signed(reg47);
              reg67 <= reg65;
            end
          else
            begin
              reg65 <= reg47[(3'h6):(2'h3)];
              reg66 <= $unsigned($signed((-wire23[(4'h9):(3'h7)])));
              reg67 <= wire4;
            end
          reg68 <= (!$signed((^~(!reg62[(5'h10):(1'h0)]))));
          reg69 <= (-(((8'ha0) ?
                  ((~^reg56) ?
                      $unsigned(wire1) : (reg62 ?
                          reg46 : wire3)) : reg66[(1'h0):(1'h0)]) ?
              ($unsigned(((8'ha6) ^ reg46)) - {(reg46 >= (8'haf))}) : wire23));
        end
      reg70 <= ((8'hb6) ?
          (((wire4 ? reg53 : reg45[(1'h0):(1'h0)]) ^~ $signed((reg56 ?
                  wire25 : wire2))) ?
              (reg56[(4'h9):(3'h6)] < {reg61,
                  (wire22 >= (8'ha2))}) : reg64[(2'h3):(1'h1)]) : {wire2});
    end
  always
    @(posedge clk) begin
      reg71 <= {(8'hb7)};
      reg72 <= wire0[(3'h5):(2'h3)];
    end
  assign wire73 = (wire25[(3'h5):(1'h0)] ?
                      $unsigned($unsigned(wire0)) : ((&($unsigned(reg52) < reg72)) ?
                          {$unsigned((8'hbc))} : (8'hb5)));
  assign wire74 = reg60;
  assign wire75 = reg54;
  assign wire76 = reg64[(3'h5):(1'h1)];
  assign wire77 = $unsigned((~$signed((!(reg66 - reg69)))));
  assign wire78 = reg44[(1'h1):(1'h1)];
endmodule

module module26
#(parameter param39 = (((+(((8'ha3) ? (8'ha0) : (8'hb4)) ? (+(8'ha7)) : (~^(8'h9e)))) ^~ ((((8'hae) ? (8'hb2) : (7'h40)) ? ((8'h9d) ~^ (8'hb9)) : (+(8'ha9))) * (((8'hb0) ^ (8'h9c)) ? ((8'hbb) ? (7'h40) : (8'had)) : ((8'had) ? (8'hba) : (7'h43))))) ? (~^((~(-(8'hb5))) ^ (((8'h9f) && (8'ha5)) ? {(8'hbb), (8'hb6)} : {(8'h9e), (8'ha2)}))) : (((((8'hac) & (8'ha7)) | (^~(8'hbb))) ? (&{(8'hbb)}) : {(!(8'hb5))}) ? (~&(((7'h41) <<< (8'ha4)) & ((8'hb3) ? (8'ha9) : (8'had)))) : ((~&(-(8'hbb))) ? (((8'ha0) ~^ (8'hba)) ? {(8'hb6)} : {(8'hbb)}) : ({(8'hac)} ~^ ((8'hb3) >>> (8'hbf)))))), 
parameter param40 = param39)
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire30;
  input wire [(3'h5):(1'h0)] wire29;
  input wire [(4'h9):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 (1'h0)};
  assign wire31 = (((($signed(wire27) ?
                          wire28[(3'h4):(2'h2)] : $unsigned(wire27)) ?
                      ((8'ha9) * $signed(wire28)) : wire27[(4'hf):(4'he)]) <<< ($unsigned(((8'ha2) ?
                      wire30 : (8'hba))) & ((wire28 ?
                      wire28 : (8'hb9)) << wire29[(1'h1):(1'h0)]))) - wire29[(2'h3):(2'h3)]);
  assign wire32 = $unsigned($unsigned(wire31[(1'h0):(1'h0)]));
  assign wire33 = {{$unsigned($signed(wire28[(4'h9):(3'h7)])),
                          wire27[(3'h5):(1'h0)]}};
  assign wire34 = $unsigned({$signed((wire31[(3'h4):(1'h0)] ^~ wire28)),
                      wire29[(1'h1):(1'h0)]});
  assign wire35 = $unsigned({(~((wire32 ? wire27 : wire34) ?
                          $unsigned(wire32) : $unsigned(wire29))),
                      wire29[(1'h1):(1'h0)]});
  assign wire36 = $unsigned(($signed(wire35) ^~ $signed($unsigned($unsigned(wire35)))));
  assign wire37 = wire30[(4'hc):(2'h2)];
  assign wire38 = ($unsigned(((^~wire31) ?
                      $signed((~|wire33)) : (~^$unsigned(wire36)))) != $unsigned({wire30}));
endmodule

module module6
#(parameter param18 = (((({(8'hac), (8'ha1)} ? (~|(7'h40)) : ((8'h9f) ? (8'hb1) : (8'h9e))) * {((8'h9e) ? (8'hba) : (8'hab)), {(8'hab), (8'haf)}}) ? ((((8'hb4) == (8'ha8)) ? ((8'haa) ? (8'hb3) : (8'ha9)) : (^(8'ha2))) ? (((8'hbe) ? (8'hb1) : (8'ha6)) ? ((7'h41) + (8'hae)) : {(8'hac)}) : (|(^~(8'ha7)))) : ((8'hb6) ? {(~(7'h41))} : ({(8'had)} ^~ (8'hbc)))) ? (~|(((-(8'hb2)) ? ((8'ha4) << (8'hac)) : (-(8'h9c))) >> (((8'hb9) || (8'ha6)) <<< (~&(8'hae))))) : ((((&(8'ha9)) ? ((8'hb4) && (8'ha0)) : {(8'haf)}) ? ((+(8'hb2)) >= ((8'hba) <= (8'ha9))) : {((7'h44) || (8'hbf)), (~(8'ha7))}) != (8'hab))), 
parameter param19 = param18)
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire11;
  input wire signed [(4'ha):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  assign y = {wire17, wire16, wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = {$signed(wire9), {wire8}};
  assign wire13 = (~|wire10[(2'h2):(1'h0)]);
  assign wire14 = wire13[(4'h9):(1'h1)];
  assign wire15 = wire11[(4'h8):(3'h7)];
  assign wire16 = (~(-$unsigned(wire7[(2'h2):(1'h0)])));
  assign wire17 = $unsigned((wire11[(3'h5):(3'h5)] ?
                      $signed((wire11[(3'h6):(3'h6)] ?
                          $signed(wire9) : {wire7})) : wire12));
endmodule
