module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire80;
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire20,
                 wire80,
                 reg10,
                 reg11,
                 reg12,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire5 = ((&wire2) == wire0);
  assign wire6 = (&wire5[(2'h2):(1'h1)]);
  assign wire7 = wire2;
  assign wire8 = $unsigned(($signed($unsigned(((8'ha1) >= wire1))) + (|(~wire0[(3'h4):(1'h0)]))));
  assign wire9 = ({(wire2[(4'hb):(1'h1)] == wire0[(2'h2):(1'h1)]),
                         ($signed(wire7[(1'h0):(1'h0)]) - wire5[(3'h5):(2'h3)])} ?
                     $unsigned($unsigned((~^$signed((8'hb9))))) : $unsigned($signed($unsigned(wire6))));
  always
    @(posedge clk) begin
      reg10 <= $unsigned(wire0);
      reg11 <= ($unsigned({$unsigned((~&reg10)),
          ((reg10 ? (8'hbb) : wire6) ?
              (wire9 <= wire3) : {wire0, wire5})}) != wire0);
      reg12 <= wire4;
    end
  assign wire13 = (((|{wire7}) ?
                      $signed(wire2) : ((&(reg11 >= wire0)) * (~(reg11 <= wire8)))) >>> wire4[(2'h2):(2'h2)]);
  assign wire14 = (^~$unsigned((8'hb4)));
  assign wire15 = $signed(wire5[(3'h4):(3'h4)]);
  assign wire16 = (~^wire3[(5'h14):(2'h3)]);
  always
    @(posedge clk) begin
      reg17 <= wire14[(2'h2):(1'h0)];
      reg18 <= (!wire15[(4'ha):(2'h2)]);
      reg19 <= {wire1[(5'h10):(3'h6)]};
    end
  assign wire20 = wire16;
  module21 #() modinst81 (.wire25(wire4), .wire24(wire16), .y(wire80), .clk(clk), .wire23(reg19), .wire22(wire2));
endmodule

module module21
#(parameter param78 = ((((((8'ha6) ? (7'h43) : (8'hb8)) == ((8'ha6) ? (8'hbd) : (8'ha2))) >= ((&(8'hb4)) ? ((8'hae) * (8'ha3)) : (+(8'hbb)))) ? {({(8'haa)} ? ((8'ha0) ? (8'ha6) : (8'haa)) : (~(8'ha7))), (((8'h9e) > (8'hb7)) ? (~(8'hbb)) : ((8'ha4) ^ (8'hbc)))} : {((8'haf) * (8'hb6)), (((8'hb2) == (8'h9e)) ? ((8'hba) <= (8'hb1)) : ((8'ha0) < (7'h40)))}) <= ((8'hb1) ? {((+(8'ha0)) ? ((8'h9e) ? (8'hb8) : (8'hb5)) : (8'haf))} : ({{(8'ha2), (8'ha5)}} >> ((^(8'hac)) > ((8'haf) << (7'h43)))))), 
parameter param79 = param78)
(y, clk, wire22, wire23, wire24, wire25);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire22;
  input wire [(4'hd):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire24;
  input wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire74;
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire37,
                 wire38,
                 wire39,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire74,
                 reg40,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire26 = $signed($signed((wire22[(1'h0):(1'h0)] ?
                      wire25[(2'h2):(2'h2)] : (~&(wire24 ?
                          (8'hbe) : wire24)))));
  assign wire27 = (-$signed(($signed($unsigned((8'h9e))) ?
                      {$signed(wire25)} : $signed($signed(wire23)))));
  assign wire28 = wire26;
  assign wire29 = ($unsigned(($signed(wire22[(2'h2):(1'h1)]) ?
                      $signed((wire25 ^ wire28)) : (~(wire26 ?
                          wire28 : (8'hb7))))) ^ (~^wire23[(1'h0):(1'h0)]));
  assign wire30 = ($unsigned(wire23) ?
                      wire23 : $signed((^($unsigned(wire24) ?
                          (wire27 > wire28) : (wire26 ? wire27 : wire23)))));
  assign wire31 = (((~{(wire29 - wire26), $signed(wire22)}) != ((~^wire24) ?
                          $signed((&wire29)) : ($unsigned(wire25) & (wire28 >= wire24)))) ?
                      wire23 : {($unsigned($unsigned(wire23)) || wire24)});
  assign wire32 = wire26;
  assign wire33 = {(((wire24[(3'h7):(3'h6)] - (wire24 ?
                              wire31 : (8'hbc))) >>> wire23) ?
                          wire24 : wire22)};
  assign wire34 = $signed((wire24 + {(8'hbe), $unsigned((wire31 <= wire30))}));
  always
    @(posedge clk) begin
      reg35 <= (+wire26);
      reg36 <= (~wire23[(4'h8):(1'h1)]);
    end
  assign wire37 = wire23[(3'h4):(2'h3)];
  assign wire38 = wire29[(1'h0):(1'h0)];
  assign wire39 = (reg35[(3'h7):(3'h5)] ?
                      reg35 : $signed($signed({wire37[(4'he):(4'hc)]})));
  always
    @(posedge clk) begin
      reg40 <= $signed(wire39[(3'h4):(1'h0)]);
    end
  assign wire41 = (-((~|{$unsigned(wire28),
                      (|wire38)}) >>> (|(&(wire31 ~^ reg40)))));
  assign wire42 = $signed(wire26[(3'h5):(2'h2)]);
  assign wire43 = wire27[(3'h5):(1'h0)];
  assign wire44 = {$signed({wire41, wire41})};
  assign wire45 = wire33[(3'h4):(2'h2)];
  assign wire46 = wire23;
  module47 #() modinst75 (wire74, clk, wire42, reg36, wire22, wire29, reg40);
  assign wire76 = $signed(($unsigned(wire74) >>> wire43));
  assign wire77 = $signed(reg36);
endmodule

module module47
#(parameter param73 = ((((((8'haa) ? (8'hb7) : (8'hbb)) & ((8'haa) ? (7'h41) : (8'hb8))) ^ ((~&(8'ha8)) ? {(8'hac), (8'hbc)} : {(8'hb2), (8'hb8)})) || (8'ha7)) ? {((8'had) != (!(+(7'h43))))} : (~|(((+(8'h9e)) ? (^~(8'had)) : ((8'hb8) ? (8'hbb) : (8'h9e))) + (~(+(8'hbe)))))))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire52;
  input wire [(3'h7):(1'h0)] wire51;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire signed [(4'ha):(1'h0)] wire49;
  input wire [(5'h13):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire58;
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  assign y = {wire72,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg53 <= $unsigned($unsigned(wire49[(4'h9):(4'h8)]));
      reg54 <= (wire51[(3'h4):(2'h2)] ? wire51 : wire51[(3'h6):(3'h5)]);
      reg55 <= (^((~^$signed({wire48, reg54})) ?
          wire49 : $signed((!(-wire51)))));
      reg56 <= wire52;
      reg57 <= (reg53[(2'h2):(1'h0)] >= $signed($signed((wire52 ?
          reg56[(2'h2):(2'h2)] : {wire48, wire48}))));
    end
  assign wire58 = wire51;
  assign wire59 = (wire50[(2'h2):(1'h0)] ?
                      reg55[(2'h2):(1'h1)] : reg55[(1'h1):(1'h1)]);
  assign wire60 = (8'hb4);
  assign wire61 = {reg54};
  assign wire62 = $unsigned($unsigned(($signed((~|reg55)) ?
                      {wire58[(2'h3):(2'h2)]} : (+$unsigned(wire48)))));
  assign wire63 = reg54[(5'h10):(4'hd)];
  always
    @(posedge clk) begin
      reg64 <= (wire63 || $signed(reg55));
      reg65 <= ({$signed(reg64)} >> $unsigned({$unsigned(wire48[(2'h3):(1'h1)]),
          ((reg64 ? reg64 : wire49) ? reg57[(2'h2):(1'h1)] : $signed(reg56))}));
      reg66 <= (({$signed($signed(reg53)), ((reg54 * wire50) > wire51)} ?
          reg55[(1'h1):(1'h1)] : $unsigned($signed(reg56[(4'h9):(4'h9)]))) ~^ (wire62[(3'h5):(2'h2)] ^ (~|wire58)));
      if (((~^wire62) <= (~|(~^(-wire60[(3'h5):(2'h2)])))))
        begin
          reg67 <= (-($unsigned(reg53[(3'h5):(2'h2)]) >>> (($unsigned(wire50) ?
              reg55[(2'h3):(1'h0)] : reg56[(4'h8):(3'h7)]) << reg65)));
          reg68 <= (wire59[(1'h1):(1'h0)] ^ (&((|(&wire62)) >= $unsigned($unsigned(reg53)))));
          reg69 <= $signed((~wire60[(4'h8):(4'h8)]));
          if ($signed(wire52[(5'h11):(5'h11)]))
            begin
              reg70 <= ((^~{reg56[(2'h2):(1'h1)],
                  {$signed((8'hab)), {reg55, wire61}}}) + $unsigned((reg54 ?
                  wire62 : $unsigned($signed(wire58)))));
            end
          else
            begin
              reg70 <= (reg70 < (&$unsigned(reg64)));
              reg71 <= $signed($signed($unsigned({reg67, $signed(wire61)})));
            end
        end
      else
        begin
          reg67 <= $unsigned(((reg53 ? $unsigned($unsigned((8'hb7))) : wire59) ?
              reg71 : $signed((^~$unsigned(reg64)))));
          reg68 <= $signed((~&((~^(reg57 ?
              wire59 : wire62)) <= wire59[(4'h9):(2'h2)])));
          reg69 <= reg64;
        end
    end
  assign wire72 = ($signed(reg70) <= $signed(((reg55[(1'h1):(1'h1)] ?
                          {reg65} : (8'ha8)) ?
                      $unsigned((reg53 << reg71)) : $unsigned($signed(reg55)))));
endmodule
