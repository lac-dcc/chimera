module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire21;
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  assign y = {wire90, wire23, wire21, reg93, reg92, reg24, (1'h0)};
  module4 #() modinst22 (.wire8(wire2), .wire7(wire0), .clk(clk), .y(wire21), .wire5(wire3), .wire6(wire1));
  assign wire23 = wire3;
  always
    @(posedge clk) begin
      reg24 <= wire23;
    end
  module25 #() modinst91 (wire90, clk, reg24, wire1, wire21, wire0, wire3);
  always
    @(posedge clk) begin
      reg92 <= wire2[(4'hc):(4'h9)];
    end
  always
    @(posedge clk) begin
      reg93 <= wire0[(4'hd):(4'hd)];
    end
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire30;
  input wire [(5'h10):(1'h0)] wire29;
  input wire signed [(3'h7):(1'h0)] wire28;
  input wire signed [(5'h12):(1'h0)] wire27;
  input wire [(5'h13):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire34,
                 wire33,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg60,
                 reg59,
                 reg58,
                 reg31,
                 reg32,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg31 <= (!(~|wire28[(3'h7):(1'h1)]));
      reg32 <= ($unsigned((wire29 ?
          ($unsigned(wire29) & (~wire30)) : ($signed(wire30) <= (wire27 ?
              reg31 : wire30)))) && (^wire29[(4'hd):(2'h3)]));
    end
  assign wire33 = $signed($unsigned({(wire30[(4'h8):(1'h1)] ?
                          ((8'hb5) ? (8'hbc) : reg31) : wire30[(2'h2):(1'h1)]),
                      (wire26 | $unsigned(wire29))}));
  assign wire34 = (|wire26[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg35 <= wire33;
      reg36 <= $signed(reg35);
      reg37 <= reg31[(3'h6):(3'h5)];
      reg38 <= ((+(^~wire27)) ? wire29 : reg35);
    end
  module39 #() modinst52 (.wire44(wire27), .wire42(wire30), .y(wire51), .wire41(reg31), .wire40(reg32), .wire43(reg38), .clk(clk));
  assign wire53 = $signed({((~|{wire33, wire26}) >>> ((8'haf) ?
                          (reg32 ? (8'h9d) : (8'h9c)) : $unsigned(reg38)))});
  assign wire54 = {wire33};
  assign wire55 = wire53;
  assign wire56 = ((8'h9e) ?
                      (&((((8'ha2) || wire34) ?
                          $signed(wire55) : wire54[(4'hc):(3'h4)]) ~^ {{wire27}})) : ({(wire27[(2'h3):(1'h1)] ?
                              (reg36 ^ (8'ha5)) : $unsigned(wire53))} || $signed(wire28[(3'h4):(1'h0)])));
  assign wire57 = wire33;
  always
    @(posedge clk) begin
      reg58 <= $signed((($signed(((8'hac) ~^ wire51)) | wire29) - (-wire33)));
      reg59 <= wire28;
      reg60 <= {$unsigned($unsigned(wire29[(1'h1):(1'h1)]))};
    end
  assign wire61 = (8'ha1);
  assign wire62 = (&wire29[(4'hd):(4'h8)]);
  assign wire63 = $unsigned(($signed(reg38[(5'h11):(3'h7)]) || reg60));
  assign wire64 = (+($unsigned($unsigned(wire27)) ?
                      $unsigned(((+reg31) <= {(8'hbb),
                          reg58})) : $unsigned(((reg60 >> wire63) ^~ $signed((7'h43))))));
  assign wire65 = $signed($signed(wire56[(2'h3):(2'h3)]));
  assign wire66 = $signed(wire57);
  assign wire67 = {reg60[(1'h1):(1'h1)]};
  always
    @(posedge clk) begin
      if (wire26[(4'h8):(2'h2)])
        begin
          reg68 <= (wire28[(1'h1):(1'h1)] & (-(^~$signed(wire27[(3'h6):(3'h6)]))));
          reg69 <= $signed((~|(~&((~&wire27) < ((7'h41) ? wire30 : wire62)))));
          reg70 <= ((reg69 ?
                  (wire55[(2'h2):(1'h0)] || (wire51 ?
                      $signed(wire28) : $unsigned(wire51))) : (8'hb8)) ?
              wire51 : (reg32 ^ reg59[(3'h5):(1'h1)]));
        end
      else
        begin
          reg68 <= wire54;
          reg69 <= reg70[(4'h9):(3'h6)];
          reg70 <= (reg70 ^ (wire67[(3'h4):(3'h4)] << $unsigned($unsigned((^wire33)))));
          reg71 <= wire64;
          reg72 <= wire65;
        end
      reg73 <= $signed((~^(reg68 ? reg58 : $unsigned($signed(wire29)))));
      if ((&{(8'h9e)}))
        begin
          reg74 <= reg59;
          reg75 <= $signed(((&((wire51 ? wire53 : wire65) * wire28)) ?
              ($unsigned((wire64 & reg60)) ?
                  ($signed(wire28) ?
                      reg69 : $signed(reg71)) : (wire34[(4'hb):(3'h7)] < (&reg31))) : wire30));
          reg76 <= reg59[(3'h6):(2'h2)];
          reg77 <= reg74[(4'ha):(3'h5)];
          reg78 <= $unsigned(($signed(reg68[(2'h3):(2'h3)]) > ((8'hbf) & {wire34})));
        end
      else
        begin
          reg74 <= ({((^(wire62 ?
                  wire66 : wire30)) << ((~wire55) <<< (wire51 <<< reg32))),
              wire53[(1'h0):(1'h0)]} <<< (reg35[(1'h0):(1'h0)] ?
              ((+wire51[(5'h10):(2'h2)]) != wire57) : $signed($signed({reg71,
                  reg69}))));
        end
      reg79 <= reg78;
      if ($unsigned($unsigned({$signed((+wire54))})))
        begin
          reg80 <= $signed(wire29[(4'ha):(2'h2)]);
          reg81 <= reg37[(4'he):(4'h8)];
          reg82 <= reg37[(4'he):(1'h0)];
        end
      else
        begin
          if ($signed(($signed((+(8'h9e))) || (~^(reg80 ?
              (reg69 ? wire67 : (8'hbc)) : (reg81 ^~ reg70))))))
            begin
              reg80 <= wire27[(4'hd):(3'h7)];
              reg81 <= (wire63[(1'h1):(1'h1)] ^ ((wire53[(1'h1):(1'h1)] ?
                  {$signed(reg32),
                      $signed((7'h44))} : $unsigned($signed(wire64))) ^ (&$unsigned(reg69[(3'h6):(1'h1)]))));
              reg82 <= (wire64 ?
                  reg80 : (($unsigned(wire65) < $unsigned((8'h9e))) | (~wire65[(3'h7):(2'h3)])));
              reg83 <= {reg32[(4'hd):(4'hd)]};
            end
          else
            begin
              reg80 <= wire29;
              reg81 <= (~&{wire33,
                  (&($unsigned(wire28) ?
                      (reg32 ? reg38 : wire57) : (wire56 ? reg76 : (8'hae))))});
              reg82 <= $unsigned((wire29 ?
                  $unsigned(reg35) : reg81[(1'h1):(1'h0)]));
              reg83 <= ($signed($unsigned(reg80[(4'hf):(4'h9)])) * (($unsigned((wire66 ?
                      reg37 : reg83)) ?
                  $signed((wire63 <<< wire63)) : ($signed(reg81) <= (wire29 ?
                      wire66 : reg82))) >> ($unsigned((^~(8'ha2))) ?
                  $unsigned($unsigned(wire55)) : $unsigned(wire30[(2'h2):(2'h2)]))));
            end
          reg84 <= wire66[(3'h6):(1'h1)];
          reg85 <= (reg76[(3'h6):(3'h5)] ?
              wire61 : $signed(reg72[(1'h0):(1'h0)]));
        end
    end
  assign wire86 = $unsigned((reg84[(2'h3):(1'h1)] ^~ reg36));
  assign wire87 = $unsigned({wire62, $unsigned(((8'ha4) ^~ $signed(reg60)))});
  assign wire88 = wire33[(2'h3):(2'h3)];
  assign wire89 = wire87[(4'h9):(4'h8)];
endmodule

module module4
#(parameter param19 = ((~^{(((8'ha4) == (8'h9f)) | ((8'ha1) ? (8'ha0) : (8'hb1)))}) ? {((((8'ha0) <= (8'h9e)) ? ((8'haa) >> (8'ha6)) : (~|(8'hba))) ? (7'h40) : {(^(8'h9f))})} : ((~&(~&(8'had))) | ((|{(8'hb7), (8'ha7)}) ? ((~(8'ha1)) <= ((7'h40) + (8'ha0))) : ((&(8'hb7)) == ((8'hb9) == (8'ha7)))))), 
parameter param20 = ((~{param19, param19}) ? ({{param19, (param19 || param19)}} != (param19 ? (^~(param19 ? param19 : param19)) : param19)) : ((8'hbf) >= (|((param19 + param19) ? (8'ha2) : (^param19))))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  input wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  assign y = {wire18,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire9 = (wire5 << (~|$signed(((wire6 < wire7) ?
                     (wire8 & wire7) : ((8'ha1) ^ (8'h9e))))));
  assign wire10 = wire6[(1'h0):(1'h0)];
  assign wire11 = wire5[(4'h8):(3'h6)];
  assign wire12 = wire11;
  assign wire13 = $signed($unsigned(($signed($unsigned(wire7)) + (wire11[(4'hf):(3'h7)] ?
                      $unsigned((7'h41)) : $signed(wire5)))));
  assign wire14 = ((((~^(+wire7)) ?
                          (^((8'ha3) <= wire6)) : {wire10[(3'h5):(1'h0)]}) + (&(wire6 ?
                          $signed(wire12) : (|wire13)))) ?
                      $signed({({wire8} ?
                              (!wire13) : wire7[(2'h3):(2'h3)])}) : wire13[(5'h11):(4'h8)]);
  always
    @(posedge clk) begin
      reg15 <= $unsigned($unsigned(($unsigned((wire14 ? (8'hb6) : wire9)) ?
          (+(+wire13)) : wire7)));
      reg16 <= (+$signed($signed(reg15)));
      reg17 <= wire8;
    end
  assign wire18 = {$unsigned((wire8 ? wire6 : (~&{reg15}))), (!wire9)};
endmodule

module module39
#(parameter param49 = (^({(7'h40), ((~(8'hbb)) ^ (8'ha3))} ? ((~&(&(8'hbb))) ? (~{(8'hb9), (8'hb9)}) : (((8'h9d) ~^ (8'h9e)) >>> ((8'hbb) ? (8'hb6) : (8'haa)))) : ({((8'ha2) - (8'ha8)), ((8'had) == (8'ha7))} != {{(8'hbb)}}))), 
parameter param50 = (|(8'haa)))
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire44;
  input wire [(5'h14):(1'h0)] wire43;
  input wire signed [(2'h3):(1'h0)] wire42;
  input wire [(5'h13):(1'h0)] wire41;
  input wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  assign y = {wire48, wire47, wire46, wire45, (1'h0)};
  assign wire45 = wire40;
  assign wire46 = ($unsigned(wire40[(2'h2):(1'h1)]) - $unsigned((wire40[(4'hd):(2'h2)] | wire42[(2'h2):(1'h1)])));
  assign wire47 = wire40[(2'h2):(1'h1)];
  assign wire48 = $unsigned(wire45);
endmodule
