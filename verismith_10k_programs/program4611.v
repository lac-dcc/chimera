module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire26;
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  assign y = {wire77,
                 wire75,
                 wire29,
                 wire28,
                 wire5,
                 wire6,
                 wire7,
                 wire12,
                 wire13,
                 wire26,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = (8'hb4);
  assign wire7 = (|$signed(wire2[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg8 <= wire2;
      reg9 <= (8'ha0);
      reg10 <= $signed(wire6[(1'h1):(1'h0)]);
      reg11 <= $signed({{reg9, wire7}});
    end
  assign wire12 = {$signed((8'ha9)), {(-$signed($signed(wire7)))}};
  assign wire13 = (8'ha8);
  module14 #() modinst27 (wire26, clk, reg10, wire6, wire0, wire12);
  assign wire28 = $unsigned(reg8);
  assign wire29 = ((~^$signed((wire28[(3'h5):(1'h1)] ?
                          {wire1} : (reg9 > wire7)))) ?
                      $unsigned($signed((reg9[(3'h4):(1'h1)] >= (reg11 ?
                          wire5 : wire6)))) : wire2[(1'h1):(1'h1)]);
  module30 #() modinst76 (wire75, clk, wire28, wire3, reg8, reg11);
  assign wire77 = wire13;
endmodule

module module30
#(parameter param73 = (8'ha3), 
parameter param74 = (~^(param73 ? ({(^(8'hb5)), (param73 ? param73 : param73)} > {(param73 ? param73 : param73), (param73 ? param73 : (7'h40))}) : param73)))
(y, clk, wire31, wire32, wire33, wire34);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire signed [(5'h11):(1'h0)] wire32;
  input wire signed [(4'h8):(1'h0)] wire33;
  input wire signed [(5'h15):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire69;
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  assign y = {wire72,
                 wire40,
                 wire69,
                 reg71,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg35 <= $unsigned($unsigned((8'ha4)));
      reg36 <= ($unsigned(reg35) ? wire31 : $signed($unsigned(wire31)));
      reg37 <= (~(+wire32));
      reg38 <= ($unsigned((wire34[(5'h11):(4'ha)] | ((wire31 <<< wire31) ?
              {reg36, wire34} : $signed(wire31)))) ?
          reg36[(4'h8):(1'h1)] : reg35[(1'h0):(1'h0)]);
      reg39 <= $unsigned(($signed((~$unsigned(reg36))) <<< {reg36[(3'h6):(1'h1)]}));
    end
  assign wire40 = ({(8'hae)} ?
                      (~&$unsigned((|(~&wire33)))) : (+{((wire31 && reg38) ?
                              $unsigned(reg37) : (^~reg36))}));
  module41 #() modinst70 (wire69, clk, reg39, wire40, reg35, wire33, wire32);
  always
    @(posedge clk) begin
      reg71 <= wire32;
    end
  assign wire72 = $unsigned((|$signed((7'h43))));
endmodule

module module14
#(parameter param25 = ((~^((&(~^(8'ha8))) ? (8'hab) : (|((8'hb2) ? (8'haa) : (7'h41))))) ? ((&{(^~(8'hbe)), ((8'ha3) ? (8'h9c) : (8'ha1))}) ? (~(((8'h9e) <<< (8'ha9)) ? {(8'hb0)} : (~^(8'h9e)))) : {(^~{(8'h9f), (8'hb8)}), (7'h40)}) : (({{(8'hbe)}, ((8'hba) >= (8'ha8))} <<< (((8'ha1) <= (8'hbb)) * (~|(8'hbd)))) >= ({((7'h42) * (8'h9c))} ? (&((8'hb7) ? (8'hb5) : (8'hb1))) : (((8'ha5) == (8'ha0)) ? ((8'ha8) <= (8'ha5)) : ((8'hbb) ^~ (8'ha3)))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  assign y = {wire24, wire23, wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = $unsigned({wire17});
  assign wire20 = ((|$unsigned(wire15[(1'h1):(1'h1)])) ?
                      ((8'hb6) + $signed((((8'hb9) ?
                          wire16 : wire16) >> ((8'h9c) << wire19)))) : wire16);
  assign wire21 = $signed(wire16);
  assign wire22 = wire18[(4'h9):(1'h0)];
  assign wire23 = $unsigned(wire22);
  assign wire24 = $signed((~&wire19[(1'h0):(1'h0)]));
endmodule

module module41
#(parameter param67 = ((((^~(8'hb6)) ? {((8'hb5) ? (8'h9c) : (8'hb2))} : ((~^(8'hb0)) < (^(8'hb3)))) ~^ {(((8'hac) ? (8'hbc) : (7'h44)) | (~^(8'hb7))), (((8'haf) ~^ (8'hb9)) ? ((8'h9e) + (8'hb3)) : ((8'hbc) >= (8'ha5)))}) ? {((((8'h9c) == (8'hb2)) ? ((8'hab) ? (8'hbf) : (8'hb0)) : ((8'h9e) ? (8'hbf) : (8'hb8))) ~^ (((8'h9e) >>> (8'hb2)) ? ((8'ha7) ? (7'h41) : (8'hbb)) : ((8'h9d) ? (8'ha9) : (8'hb8)))), (({(8'ha3), (8'ha3)} ? ((7'h40) ? (8'h9e) : (8'hb2)) : ((7'h42) ? (8'hba) : (8'hb4))) ? (((8'ha2) <<< (8'hbb)) ? ((8'hb7) <= (8'hac)) : {(8'had), (8'hb6)}) : (((8'hac) ? (7'h43) : (8'had)) + (8'h9c)))} : (-(((|(7'h40)) <= ((8'hac) ? (8'ha7) : (8'hb3))) ? ({(7'h43), (7'h40)} ? {(8'ha8)} : (~&(8'hbb))) : (((8'ha7) ? (8'hb5) : (8'ha3)) + ((8'hbf) ? (8'hb4) : (8'hbf)))))), 
parameter param68 = (param67 || (-{{param67}, (~|param67)})))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire46;
  input wire [(5'h15):(1'h0)] wire45;
  input wire [(4'h8):(1'h0)] wire44;
  input wire signed [(4'h8):(1'h0)] wire43;
  input wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire47 = $signed($unsigned($unsigned($unsigned((wire46 << wire44)))));
  assign wire48 = ($signed((^$signed(wire44[(1'h1):(1'h1)]))) & (&wire47[(1'h0):(1'h0)]));
  assign wire49 = {(|{(wire45 ? wire45 : $unsigned((8'hb2)))}),
                      (($unsigned(wire44) ?
                              (~&wire48) : (wire42[(3'h5):(1'h1)] ?
                                  (wire47 ~^ wire42) : wire46[(1'h1):(1'h1)])) ?
                          ($signed($unsigned(wire48)) ?
                              (8'ha7) : (~^(~wire42))) : {$unsigned((-wire45)),
                              (wire48 << {wire45})})};
  assign wire50 = {wire42, {{$unsigned((wire44 ? wire48 : wire49))}}};
  assign wire51 = $unsigned($unsigned((($unsigned(wire45) ?
                          (|wire43) : {(8'hb7), wire45}) ?
                      {wire43[(2'h3):(2'h2)], (^~wire42)} : (8'h9e))));
  assign wire52 = wire50[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg53 <= wire47[(1'h1):(1'h0)];
      if ($unsigned((($unsigned((wire42 ^ wire42)) ?
          $unsigned($signed(wire44)) : wire52[(3'h6):(3'h6)]) + wire45[(3'h4):(2'h2)])))
        begin
          reg54 <= wire49[(3'h4):(2'h2)];
        end
      else
        begin
          if (wire51)
            begin
              reg54 <= wire49[(5'h11):(4'hf)];
              reg55 <= {(wire52 ? wire46 : (!(+$unsigned(wire46)))),
                  $signed((((|wire47) ?
                          wire52[(3'h6):(3'h5)] : (wire50 ? reg53 : wire52)) ?
                      $unsigned({(8'hb1), wire50}) : wire45[(4'hd):(4'hd)]))};
            end
          else
            begin
              reg54 <= {((-{(wire52 < (8'hb9)), $signed((8'hb1))}) ?
                      $signed(wire47) : {wire42[(1'h0):(1'h0)],
                          (((8'hb5) > wire51) <<< $unsigned(wire42))})};
              reg55 <= $unsigned($unsigned(($unsigned(wire43) ?
                  (wire48 ?
                      (wire44 ?
                          reg55 : wire42) : ((8'hbe) ^~ (7'h43))) : reg53)));
              reg56 <= wire45;
            end
          reg57 <= $signed(((+{$signed(wire50)}) != {$unsigned(reg53[(2'h3):(2'h2)])}));
        end
      reg58 <= $signed((($signed((wire51 ~^ wire47)) >>> wire44[(3'h7):(3'h6)]) ?
          {{(wire52 ? reg53 : wire50), (~&(8'h9f))}} : $signed({(wire52 ?
                  (8'h9d) : reg55)})));
      reg59 <= $unsigned((reg55[(2'h3):(1'h1)] != wire52));
    end
  assign wire60 = (8'hbc);
  assign wire61 = reg56;
  assign wire62 = $signed($unsigned($signed(((wire51 ?
                      reg56 : reg58) >>> wire45))));
  assign wire63 = wire44;
  assign wire64 = wire42[(4'ha):(4'ha)];
  assign wire65 = wire64;
  assign wire66 = (reg54[(3'h7):(3'h4)] + (^({(8'hb7),
                      $signed(wire49)} && (wire52[(2'h3):(1'h1)] ?
                      ((8'ha4) ? wire45 : wire45) : ((8'hbb) << (8'ha2))))));
endmodule
