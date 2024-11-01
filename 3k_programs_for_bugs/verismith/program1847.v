module top
#(parameter param76 = ((+((((8'hb3) || (8'hab)) ? (~|(8'hb3)) : (+(8'h9c))) >>> (~|((8'hac) ? (7'h41) : (8'hae))))) ? (({((8'haf) ? (8'hb2) : (8'h9c)), (7'h42)} >> ((~|(8'ha5)) ? (~&(8'ha0)) : (+(8'ha1)))) > (((8'hb1) | (-(7'h44))) ? (((8'hbd) >= (8'h9f)) ^ ((7'h42) ~^ (8'hba))) : (~{(8'hb5), (7'h40)}))) : {(8'ha4), ((((8'hbb) | (8'ha0)) ? ((7'h40) ? (8'haa) : (7'h41)) : (&(8'h9d))) < ((~^(8'h9f)) - ((8'ha4) && (8'haf))))}), 
parameter param77 = ((~|(param76 >>> ((param76 | (8'ha6)) ? {param76, (7'h42)} : {(8'hbc), param76}))) | param76))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire67,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 reg70,
                 reg6,
                 reg7,
                 (1'h0)};
  assign wire5 = (wire3[(3'h4):(1'h0)] == wire0[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      reg6 <= $unsigned((wire4[(3'h5):(1'h1)] == (($unsigned((7'h44)) ?
          (^wire3) : ((8'ha4) ? wire5 : wire1)) == wire3[(1'h1):(1'h1)])));
      reg7 <= wire4;
    end
  assign wire8 = {wire0,
                     ((~^$signed($signed(wire3))) ^~ $signed(wire2[(3'h5):(3'h5)]))};
  assign wire9 = $unsigned($signed($unsigned({(^~wire1)})));
  assign wire10 = $unsigned(wire8);
  module11 #() modinst68 (wire67, clk, wire5, reg6, wire10, wire8, wire4);
  assign wire69 = $signed(wire2);
  always
    @(posedge clk) begin
      reg70 <= {($signed(wire2[(1'h0):(1'h0)]) ?
              (+wire69) : ($signed({wire3, wire10}) ~^ (wire69[(2'h3):(1'h1)] ?
                  $unsigned(wire8) : (wire8 ? reg6 : reg6))))};
    end
  assign wire71 = $signed(wire0[(2'h2):(1'h0)]);
  assign wire72 = (~wire5);
  assign wire73 = (&$signed((~&{{(8'haa)}})));
  assign wire74 = $unsigned($unsigned(((8'ha0) + {(+wire1),
                      $unsigned(wire67)})));
  assign wire75 = $signed((-$signed((wire5[(4'hb):(4'h9)] ?
                      wire71 : $unsigned(wire10)))));
endmodule

module module11
#(parameter param65 = (8'hb3), 
parameter param66 = ((+({((8'hb3) ? param65 : param65), {param65}} != param65)) & param65))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire37;
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire42,
                 wire37,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((({wire12[(1'h1):(1'h1)], (~(wire14 ? wire12 : wire16))} ?
              (wire13 - (+$signed(wire16))) : wire14) ?
          $unsigned((!(((8'h9e) - wire16) >> wire13))) : (~^$signed(wire16[(3'h6):(3'h6)]))))
        begin
          reg17 <= $unsigned((^~(7'h42)));
          if (($signed((~^(~&(8'ha4)))) ?
              (~|{wire16[(3'h7):(1'h0)], wire14[(3'h7):(1'h1)]}) : wire16))
            begin
              reg18 <= $signed(wire16);
              reg19 <= wire14;
            end
          else
            begin
              reg18 <= wire13[(3'h5):(3'h4)];
              reg19 <= wire13;
              reg20 <= $signed((((&{reg17, wire16}) ?
                  (wire13[(3'h4):(3'h4)] && $signed(reg18)) : ((8'hb8) != $signed(reg19))) >> (((reg17 | reg19) < (8'hb7)) ?
                  $unsigned($signed(wire16)) : {$unsigned(wire16),
                      (^wire13)})));
              reg21 <= wire16[(2'h3):(2'h2)];
            end
          if (reg19[(1'h1):(1'h0)])
            begin
              reg22 <= reg17[(2'h3):(2'h3)];
              reg23 <= (~$unsigned(wire14[(3'h7):(2'h3)]));
            end
          else
            begin
              reg22 <= (8'h9d);
            end
        end
      else
        begin
          reg17 <= $unsigned($unsigned(reg23[(2'h3):(2'h3)]));
          reg18 <= $unsigned(({(^(reg21 || wire14)),
                  ((reg22 && reg22) + wire13)} ?
              (~^($unsigned(wire13) != ((8'ha7) ?
                  wire14 : reg17))) : (~|(wire15[(2'h2):(1'h1)] << $unsigned(reg22)))));
          reg19 <= ($unsigned((wire16[(1'h0):(1'h0)] & ($unsigned((7'h41)) ^ (-wire14)))) ^ $unsigned($unsigned(((~^reg19) ^~ (~&reg20)))));
          reg20 <= (wire12[(2'h2):(2'h2)] >= wire15[(2'h2):(1'h1)]);
        end
    end
  module24 #() modinst38 (.wire27(reg23), .y(wire37), .wire25(wire14), .clk(clk), .wire28(reg21), .wire26(wire15));
  always
    @(posedge clk) begin
      reg39 <= ($signed({reg18[(2'h3):(1'h0)]}) | reg20);
      reg40 <= $unsigned($signed($signed((reg17[(4'hc):(4'hc)] ?
          wire14 : (reg20 ? (8'ha6) : wire12)))));
      reg41 <= wire16;
    end
  assign wire42 = $signed($signed($signed($signed((reg19 ? reg19 : reg39)))));
  module43 #() modinst61 (wire60, clk, reg17, wire12, reg22, reg39, wire42);
  assign wire62 = (reg18 ?
                      reg19 : ($signed(((reg20 != wire16) ?
                              ((8'ha9) >= wire42) : (|reg17))) ?
                          (reg20[(1'h1):(1'h0)] ^~ reg18) : wire14[(3'h6):(3'h4)]));
  assign wire63 = $unsigned((((~^$unsigned(wire42)) >>> {reg18,
                      reg17[(2'h3):(1'h0)]}) || wire60[(5'h10):(2'h3)]));
  assign wire64 = $signed($signed((~^$signed((^reg22)))));
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire48;
  input wire signed [(4'hb):(1'h0)] wire47;
  input wire [(4'ha):(1'h0)] wire46;
  input wire [(4'he):(1'h0)] wire45;
  input wire signed [(3'h7):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire49;
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire49,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire49 = wire47;
  always
    @(posedge clk) begin
      if ((((~wire47) & ($unsigned($unsigned(wire44)) ?
              wire48 : $signed(wire47))) ?
          $unsigned($signed($unsigned($unsigned(wire47)))) : $signed((8'hbb))))
        begin
          reg50 <= {$unsigned(($unsigned(((8'ha2) * wire49)) ^ wire44[(3'h4):(3'h4)]))};
          reg51 <= (((wire48[(3'h7):(3'h6)] ?
                  wire44[(1'h0):(1'h0)] : wire45[(3'h5):(3'h5)]) | wire45[(2'h2):(1'h0)]) ?
              {$unsigned((^(wire46 ?
                      wire46 : wire47)))} : wire44[(3'h7):(1'h1)]);
          reg52 <= {wire45};
        end
      else
        begin
          if ((((~&$signed(((8'hb2) & reg51))) == (reg52 ~^ ((~wire45) - $signed(reg50)))) * reg52))
            begin
              reg50 <= $signed(wire48);
              reg51 <= reg50;
              reg52 <= (($signed($signed($unsigned(wire46))) * (^$signed({wire47,
                      (8'hab)}))) ?
                  (~(((reg51 ^ reg52) ? {wire46} : wire49) ?
                      (8'hbf) : (8'haa))) : (|{($unsigned(reg51) ?
                          wire48 : wire48[(5'h11):(3'h4)]),
                      reg50[(4'ha):(1'h0)]}));
            end
          else
            begin
              reg50 <= {{wire44[(2'h3):(1'h1)], reg52[(3'h5):(2'h2)]}};
            end
          reg53 <= wire45[(1'h1):(1'h1)];
          reg54 <= $unsigned($unsigned(wire44[(3'h4):(2'h3)]));
          reg55 <= $unsigned((((&(7'h44)) <= (wire49 - $signed(reg53))) & wire48[(5'h11):(4'hb)]));
          reg56 <= {(~^(~^$unsigned((reg52 ? (8'ha6) : reg50))))};
        end
    end
  assign wire57 = (8'hac);
  assign wire58 = (8'hab);
  assign wire59 = $signed(wire58);
endmodule

module module24
#(parameter param36 = (((!((!(8'h9d)) ? ((8'hb8) ? (8'hb1) : (8'hbb)) : {(8'ha2), (8'haf)})) * ((+((7'h42) << (8'ha7))) && (+((8'hbe) | (7'h44))))) < ((((~^(7'h40)) ? (-(8'ha5)) : ((7'h43) ~^ (7'h43))) ? (((8'had) || (8'haf)) & ((8'hb1) ? (8'h9c) : (8'hb3))) : {((8'hb0) > (7'h43))}) ? ((((8'hab) ? (8'hb6) : (8'hb2)) ? {(8'hbd)} : (8'hb9)) ? (((8'hbf) >>> (8'hb3)) ? (^~(8'ha6)) : (!(8'hae))) : (((8'hbf) ^ (8'hb6)) ? {(8'hb9), (8'hb3)} : ((8'hb2) ? (8'ha9) : (8'haf)))) : ((((7'h40) <= (8'hb4)) - (!(8'ha5))) ? ((8'hb1) <<< (&(8'h9e))) : ((^(8'hbb)) + (+(8'had)))))))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire27;
  input wire [(5'h13):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  assign y = {wire35, wire34, wire32, wire31, wire30, reg33, reg29, (1'h0)};
  always
    @(posedge clk) begin
      reg29 <= ({(wire25[(3'h4):(2'h2)] <= wire26[(4'h9):(3'h5)])} ~^ wire25);
    end
  assign wire30 = $signed(((~&{(reg29 ? wire26 : (8'hae)),
                      $unsigned(wire26)}) && $unsigned(($signed(wire25) ?
                      (|wire26) : $unsigned(wire27)))));
  assign wire31 = (&wire27[(1'h0):(1'h0)]);
  assign wire32 = wire30[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg33 <= wire32[(4'hb):(4'h9)];
    end
  assign wire34 = (&(-(wire28[(3'h4):(3'h4)] >= wire31[(2'h3):(2'h2)])));
  assign wire35 = $unsigned($signed(($signed((reg29 ~^ (8'h9d))) && (-wire27))));
endmodule
