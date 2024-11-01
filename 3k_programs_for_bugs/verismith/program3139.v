module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire65;
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire67,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire17,
                 wire18,
                 wire20,
                 wire65,
                 reg19,
                 reg16,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg5 <= wire2[(3'h5):(2'h2)];
          reg6 <= wire1[(5'h11):(4'h8)];
          if ($signed($signed((+({wire0, wire2} && (reg6 || wire4))))))
            begin
              reg7 <= ($unsigned($unsigned((-(wire2 >> (8'hb0))))) != reg6[(4'hc):(3'h5)]);
              reg8 <= (-$signed((~&(wire0[(1'h1):(1'h1)] | reg7))));
              reg9 <= reg6[(4'ha):(3'h6)];
            end
          else
            begin
              reg7 <= (reg7 - $signed((~(|(reg6 <= wire2)))));
              reg8 <= $signed($unsigned({wire3}));
              reg9 <= ($unsigned(reg7) < $signed(((~|(7'h43)) ^~ wire3)));
              reg10 <= (($unsigned((^~$signed(wire2))) ?
                      {$signed(wire3)} : $unsigned((wire2[(1'h1):(1'h1)] | (!(8'ha6))))) ?
                  wire3 : $signed(wire2[(1'h1):(1'h1)]));
              reg11 <= (~^($signed({(wire3 ? wire1 : reg7),
                      (wire4 - (8'ha8))}) ?
                  ($signed({reg10,
                      wire2}) || ($signed(wire2) != (~reg7))) : (!$unsigned({(8'hbd)}))));
            end
        end
      else
        begin
          reg5 <= {wire3[(3'h6):(3'h4)]};
          if (reg6[(3'h7):(3'h6)])
            begin
              reg6 <= reg8;
              reg7 <= wire0[(4'hd):(4'hb)];
              reg8 <= reg10;
              reg9 <= wire4;
            end
          else
            begin
              reg6 <= ((!(&((reg10 ~^ (8'haf)) | wire4[(1'h1):(1'h0)]))) ?
                  {$unsigned((~&(&wire3)))} : reg9[(3'h4):(1'h0)]);
              reg7 <= {wire0[(3'h4):(2'h3)],
                  $unsigned((|wire0[(4'hb):(3'h6)]))};
              reg8 <= reg10;
            end
          reg10 <= $unsigned(wire4);
        end
    end
  assign wire12 = $unsigned((~wire0));
  assign wire13 = $unsigned($signed((wire0 ?
                      ((reg7 + reg10) ? $unsigned(wire3) : (^reg9)) : (wire4 ?
                          $signed((7'h40)) : wire1[(4'he):(3'h5)]))));
  assign wire14 = (((reg10[(5'h11):(5'h11)] <= wire13) == ({reg7} ^ $signed((+wire13)))) == ((^(wire12 ^~ $signed(wire3))) ?
                      ((|{(8'h9f)}) ?
                          $signed($signed(reg5)) : {(reg7 - wire1),
                              reg10}) : ($unsigned((reg6 * reg5)) > reg9[(4'h9):(2'h2)])));
  assign wire15 = wire13;
  always
    @(posedge clk) begin
      reg16 <= ((wire3[(3'h6):(1'h0)] ^ ($signed((wire14 ?
          reg9 : reg8)) < ((&(8'haa)) >>> (wire0 ?
          (7'h43) : reg5)))) < $unsigned($unsigned(reg9)));
    end
  assign wire17 = ($unsigned($unsigned({$signed(wire1)})) > $unsigned((wire1 ?
                      (7'h40) : $unsigned($signed(reg8)))));
  assign wire18 = (7'h41);
  always
    @(posedge clk) begin
      reg19 <= wire1;
    end
  assign wire20 = {wire15[(3'h5):(1'h1)]};
  module21 #() modinst66 (wire65, clk, reg5, wire3, wire0, wire20, reg7);
  assign wire67 = (~&$unsigned($unsigned((&$signed(wire14)))));
endmodule

module module21  (y, clk, wire22, wire23, wire24, wire25, wire26);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire signed [(2'h2):(1'h0)] wire24;
  input wire [(3'h5):(1'h0)] wire25;
  input wire [(5'h14):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire56;
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire41,
                 wire42,
                 wire56,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 (1'h0)};
  assign wire27 = $signed(wire24);
  assign wire28 = $signed((|({(!wire26), (wire24 ~^ wire24)} ?
                      $unsigned(wire24[(1'h1):(1'h1)]) : $signed($unsigned(wire27)))));
  assign wire29 = ($signed($signed($unsigned({wire24,
                      wire26}))) == ($signed((wire28 ?
                          wire25[(3'h4):(1'h0)] : (wire22 ? wire24 : wire23))) ?
                      {wire25, $unsigned(wire28[(3'h4):(1'h1)])} : {wire24,
                          $unsigned($signed(wire26))}));
  assign wire30 = {$signed(((-(wire25 ^~ wire29)) << wire26))};
  assign wire31 = {((+($unsigned(wire25) ? (~wire27) : wire23)) ?
                          $signed(((wire25 & (7'h40)) - (wire28 ?
                              wire25 : wire27))) : (($unsigned(wire23) ?
                              wire22 : (wire26 > wire24)) >>> $unsigned((8'hae))))};
  assign wire32 = wire30[(4'ha):(3'h5)];
  always
    @(posedge clk) begin
      reg33 <= ($unsigned($unsigned($signed(wire25[(3'h5):(2'h2)]))) ?
          {(wire22 - ((wire32 | wire29) != wire30[(3'h4):(1'h0)])),
              $unsigned((~|((8'haf) == (8'hb6))))} : wire26);
      reg34 <= wire30;
      if (({(wire25 ? (~|(wire28 ~^ reg33)) : wire31[(3'h6):(3'h5)]),
              ((wire28 ? wire22[(2'h2):(1'h0)] : ((7'h41) && wire23)) ?
                  (~&(wire22 <= wire23)) : (~wire24))} ?
          (|wire32) : $signed(($signed({reg34}) == (reg34 <<< $signed((8'ha6)))))))
        begin
          if ($signed(wire29[(5'h13):(4'h8)]))
            begin
              reg35 <= $unsigned(($signed($signed((wire28 ? wire30 : reg34))) ?
                  ((~|wire27) - (~^$unsigned(wire23))) : (8'ha6)));
              reg36 <= {$signed((^wire28[(4'h9):(3'h7)]))};
              reg37 <= wire23;
              reg38 <= reg34;
              reg39 <= wire30;
            end
          else
            begin
              reg35 <= $unsigned(wire31);
              reg36 <= ((&reg36) - $signed(wire23));
              reg37 <= ($unsigned($signed(((8'hbe) ?
                  (wire30 ?
                      reg34 : (8'ha5)) : (~^(8'ha1))))) - ($signed(($unsigned((8'h9c)) > reg33[(1'h1):(1'h0)])) ?
                  $unsigned($signed(wire30)) : ((wire29 ?
                      $signed(wire26) : (wire31 || wire26)) || $signed(((8'h9c) ?
                      (8'hb3) : reg36)))));
              reg38 <= wire24[(2'h2):(2'h2)];
            end
          reg40 <= wire31[(2'h3):(1'h1)];
        end
      else
        begin
          if ($unsigned({reg35, $unsigned((~^(wire31 ? (8'hb0) : (7'h43))))}))
            begin
              reg35 <= $unsigned(($unsigned(reg40[(1'h0):(1'h0)]) ?
                  $unsigned((~$signed((8'h9e)))) : ((!(~^wire22)) ?
                      $unsigned((wire22 && reg36)) : (reg34 & {wire25,
                          wire32}))));
              reg36 <= (~|$signed(($unsigned($signed(reg37)) ?
                  (&(reg37 ?
                      wire30 : wire27)) : ($signed((8'h9e)) != (wire22 + reg38)))));
              reg37 <= (wire32 ?
                  ($unsigned($unsigned((wire25 ? wire31 : wire29))) ?
                      (|reg35) : {$unsigned({wire31})}) : ((~|$unsigned({reg38,
                          wire23})) ?
                      wire22 : reg35));
              reg38 <= $signed((reg33[(1'h1):(1'h1)] != ((wire25 > (wire29 ?
                      wire26 : (8'haf))) ?
                  $unsigned((wire29 ? wire27 : wire30)) : {{(8'hbb)}, reg38})));
              reg39 <= ($unsigned(wire32) ?
                  {((wire26 & {wire32}) ?
                          $unsigned(reg35[(5'h10):(4'ha)]) : $signed({reg35})),
                      (reg39[(4'hc):(1'h0)] != $unsigned((reg37 && reg33)))} : reg34);
            end
          else
            begin
              reg35 <= $signed((^wire29[(5'h10):(4'hb)]));
              reg36 <= $signed(({reg37[(5'h13):(1'h1)]} >> wire26[(3'h5):(1'h0)]));
            end
          reg40 <= $unsigned(reg35);
        end
    end
  assign wire41 = reg39;
  assign wire42 = reg35;
  module43 #() modinst57 (.wire47(reg34), .y(wire56), .wire44(wire23), .clk(clk), .wire45(wire32), .wire46(wire27));
  assign wire58 = $signed(reg33[(2'h3):(2'h2)]);
  assign wire59 = wire32;
  assign wire60 = $unsigned(wire24[(1'h0):(1'h0)]);
  assign wire61 = $unsigned($unsigned($unsigned($unsigned({wire29, reg35}))));
  assign wire62 = (|wire30);
  assign wire63 = wire41;
  assign wire64 = (|(!(wire26 & wire63[(1'h0):(1'h0)])));
endmodule

module module43
#(parameter param54 = (~^(~((8'ha3) < (((8'hb8) ^ (8'ha2)) ? {(8'hb2)} : (-(7'h43)))))), 
parameter param55 = (8'hb7))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire47;
  input wire signed [(3'h7):(1'h0)] wire46;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire [(5'h14):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  assign y = {wire52, wire51, wire50, wire49, reg53, reg48, (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= (+wire47);
    end
  assign wire49 = $unsigned($unsigned($signed(({wire45,
                      wire44} ^~ wire47[(4'h8):(2'h2)]))));
  assign wire50 = (wire44 ?
                      wire44[(3'h4):(2'h2)] : ((|wire44[(2'h2):(2'h2)]) ?
                          reg48[(3'h7):(1'h1)] : $unsigned($signed(((7'h40) - (8'hbb))))));
  assign wire51 = wire44;
  assign wire52 = (~^$unsigned($signed($unsigned((wire45 <= reg48)))));
  always
    @(posedge clk) begin
      reg53 <= ($unsigned($unsigned($unsigned($signed(wire46)))) ?
          ($unsigned(($signed(wire47) + (~&wire49))) ?
              $signed(wire45[(5'h10):(3'h5)]) : ((!(wire52 || wire49)) ?
                  wire46[(1'h0):(1'h0)] : $signed((wire51 + wire44)))) : (8'h9e));
    end
endmodule
