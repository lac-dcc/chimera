module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire50;
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire4,
                 wire5,
                 wire50,
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
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire4 = (~(-wire2[(2'h3):(1'h0)]));
  assign wire5 = ((wire2 ?
                         (((wire0 ? wire1 : wire3) ?
                             $signed(wire4) : $unsigned(wire3)) * {$unsigned(wire3),
                             wire4}) : wire0) ?
                     $unsigned(($signed(wire0[(3'h6):(2'h3)]) ?
                         wire3 : (wire3[(2'h2):(1'h1)] ?
                             {(8'hb6)} : (wire1 | (8'hbc))))) : $signed($signed(wire3[(4'hb):(3'h5)])));
  module6 #() modinst51 (.clk(clk), .wire8(wire0), .wire10(wire4), .wire11(wire1), .wire9(wire3), .y(wire50), .wire7(wire2));
  always
    @(posedge clk) begin
      reg52 <= wire5[(1'h0):(1'h0)];
      reg53 <= wire2;
      reg54 <= ($signed(wire4) & ($unsigned((wire3 & (7'h42))) >= (reg53[(5'h11):(1'h0)] > $signed((wire5 < wire2)))));
    end
  assign wire55 = $signed(((wire2 ?
                      wire5[(3'h5):(3'h4)] : ($signed(reg54) ^ $unsigned(wire1))) <<< (+(8'ha7))));
  assign wire56 = $signed($unsigned((!(&(reg52 >> wire55)))));
  assign wire57 = reg54[(1'h0):(1'h0)];
  assign wire58 = (~^({$unsigned($unsigned(wire56))} ? wire57 : (8'ha4)));
  assign wire59 = wire57[(4'hb):(4'ha)];
  assign wire60 = $unsigned({wire0[(3'h4):(1'h0)],
                      (wire59[(3'h4):(1'h1)] ?
                          (~&wire59[(3'h6):(1'h1)]) : ((~wire50) ?
                              wire0 : (wire55 >> (8'hba))))});
  always
    @(posedge clk) begin
      reg61 <= (({wire50} > wire1[(5'h11):(5'h10)]) ?
          ($unsigned({wire0[(3'h4):(1'h0)], (reg53 ? wire2 : wire2)}) ?
              (reg54 << $signed(wire59[(3'h4):(2'h3)])) : (wire57 >= (8'hb0))) : wire5);
      reg62 <= wire5[(1'h0):(1'h0)];
      reg63 <= (reg52 ?
          wire60[(1'h0):(1'h0)] : {{wire57[(4'h8):(3'h4)]},
              {(+$signed(wire55)), (wire58[(1'h0):(1'h0)] <= wire56)}});
      if (($signed(wire56[(1'h0):(1'h0)]) ^~ wire4[(3'h4):(2'h2)]))
        begin
          reg64 <= (wire56[(1'h0):(1'h0)] - $unsigned($unsigned($signed(wire60))));
          reg65 <= wire50;
          reg66 <= wire0;
          reg67 <= $signed(wire55[(4'ha):(3'h7)]);
          reg68 <= wire55[(2'h2):(1'h0)];
        end
      else
        begin
          reg64 <= (~&reg62[(4'hc):(2'h2)]);
          reg65 <= $signed(reg66);
          if (wire57[(5'h11):(2'h3)])
            begin
              reg66 <= $unsigned((^~(8'ha9)));
              reg67 <= $unsigned($signed(reg63));
            end
          else
            begin
              reg66 <= $unsigned((((~^((8'h9d) == wire5)) * (7'h44)) & {wire57[(4'hd):(4'h8)],
                  $unsigned($signed(wire1))}));
              reg67 <= $signed(wire3);
              reg68 <= (wire56[(1'h1):(1'h0)] ?
                  (reg67[(5'h10):(4'he)] ?
                      reg65 : reg52) : reg64[(3'h6):(2'h3)]);
              reg69 <= wire57;
              reg70 <= (~|(wire0 == $unsigned((-$unsigned(wire56)))));
            end
        end
      reg71 <= $signed($unsigned($unsigned((reg66[(3'h6):(3'h6)] ^ $signed(reg64)))));
    end
endmodule

module module6
#(parameter param49 = ((~^(~|{((8'ha2) ? (8'hb7) : (8'ha1))})) != ((^{((8'haa) - (8'ha7)), ((8'hbc) + (8'hb7))}) ~^ ((((8'ha6) ? (8'ha1) : (8'hbc)) ? ((8'hbf) & (7'h41)) : {(8'hbf), (8'hbb)}) ? ((8'ha3) ? ((7'h42) ? (8'ha6) : (8'haa)) : ((8'hba) - (8'hb7))) : (^((8'ha7) ? (8'ha0) : (8'hbb)))))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire46;
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  assign y = {wire48,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire22,
                 wire46,
                 reg24,
                 reg23,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire12 = ($unsigned(({(wire10 ? wire11 : wire8),
                      {(8'ha3)}} >>> (8'hb9))) || (|wire8));
  assign wire13 = $signed($unsigned(wire9));
  assign wire14 = $unsigned($signed(wire11));
  assign wire15 = (|$signed($unsigned(((wire13 && wire14) | wire10[(3'h4):(3'h4)]))));
  always
    @(posedge clk) begin
      if ($unsigned(wire10[(3'h4):(1'h0)]))
        begin
          reg16 <= {($unsigned(wire8) >> (wire13 ?
                  (|$unsigned(wire13)) : $unsigned($unsigned(wire8))))};
          reg17 <= (8'ha1);
          reg18 <= ((($signed(wire7) ? (^~{wire14}) : {(8'ha3)}) ?
              $unsigned($signed($unsigned(wire7))) : wire8[(3'h5):(3'h5)]) ~^ wire15[(5'h10):(5'h10)]);
          reg19 <= $signed({((~^(|wire11)) ? wire14[(3'h5):(3'h4)] : {wire9}),
              (~&wire7)});
        end
      else
        begin
          reg16 <= $unsigned((wire10[(1'h0):(1'h0)] ~^ wire13[(1'h0):(1'h0)]));
        end
      reg20 <= ((~^$unsigned(reg19[(2'h3):(1'h1)])) ?
          {(^(&reg18)),
              {$signed((wire12 < reg16))}} : $unsigned($unsigned(((reg17 ?
              wire7 : wire13) == $signed(wire14)))));
      reg21 <= ($signed(wire15[(5'h11):(4'he)]) >= {$signed($unsigned((^wire15)))});
    end
  assign wire22 = $signed(wire13);
  always
    @(posedge clk) begin
      reg23 <= wire10[(3'h5):(3'h4)];
      reg24 <= (+(reg23 ? $unsigned($signed(wire12)) : (wire8 <= reg21)));
    end
  module25 #() modinst47 (.wire30(reg19), .clk(clk), .wire28(wire15), .y(wire46), .wire27(wire10), .wire29(reg16), .wire26(wire13));
  assign wire48 = wire10[(3'h7):(3'h5)];
endmodule

module module25
#(parameter param44 = (((^~(((8'hb2) ? (8'ha3) : (8'h9e)) | ((8'hbc) << (8'hb5)))) ? {({(8'h9d), (8'ha7)} ? (8'h9d) : (+(8'hbc)))} : (~^(&(~|(8'hbb))))) <<< ((((~(8'ha7)) == (+(8'haf))) ~^ (((8'hbf) ? (8'hb6) : (8'hb4)) ^~ (~|(8'hb8)))) ~^ (({(8'h9f)} == ((8'h9d) - (8'hbe))) ? (8'hab) : (((7'h40) != (8'ha9)) ? ((8'ha9) | (8'hb5)) : {(8'hb7)})))), 
parameter param45 = param44)
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire29;
  input wire signed [(2'h3):(1'h0)] wire28;
  input wire [(5'h12):(1'h0)] wire27;
  input wire signed [(4'h9):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire32,
                 wire31,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire31 = $signed((&(wire26 ?
                      ({wire27} != (wire28 ?
                          wire29 : wire30)) : $signed((wire27 == wire27)))));
  assign wire32 = wire26;
  always
    @(posedge clk) begin
      reg33 <= $unsigned(wire31[(1'h0):(1'h0)]);
      reg34 <= (^$signed(reg33));
      if (wire29[(2'h2):(2'h2)])
        begin
          reg35 <= (((&{wire30}) != (wire27[(2'h3):(2'h2)] > (&(wire28 ^~ wire29)))) ?
              wire32[(1'h0):(1'h0)] : (wire27[(3'h4):(1'h0)] == wire31[(5'h13):(3'h5)]));
          reg36 <= ($signed((~^(~|(wire30 == (8'hbf))))) >> $unsigned(reg33));
          if ($signed(({reg34, reg36} - ((7'h42) ?
              (+$signed(reg33)) : ($signed(reg34) ?
                  (~reg34) : (wire30 - reg36))))))
            begin
              reg37 <= reg35;
            end
          else
            begin
              reg37 <= ((reg36 <<< ({(~&wire28)} ?
                      ((|wire28) ?
                          $unsigned(wire27) : $signed(wire32)) : {$unsigned(wire29)})) ?
                  wire26 : $signed($unsigned(((reg33 <= reg33) < wire29))));
              reg38 <= wire29[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg35 <= wire26[(3'h5):(3'h5)];
          reg36 <= (8'hbe);
        end
      reg39 <= wire27[(3'h5):(3'h4)];
    end
  assign wire40 = (reg37[(4'hc):(1'h0)] && ((|reg39[(2'h3):(2'h3)]) & ($unsigned({reg39,
                      reg33}) >>> ({wire26} ~^ reg33))));
  assign wire41 = (^wire29);
  assign wire42 = $unsigned(($unsigned($signed((|wire32))) ^ reg36[(2'h3):(1'h1)]));
  assign wire43 = ((wire30 << (reg38[(2'h2):(2'h2)] ?
                          ((reg39 ?
                              wire42 : wire26) >>> wire29[(3'h5):(2'h2)]) : {(wire26 ?
                                  reg36 : wire41),
                              ((8'ha4) ? wire32 : reg35)})) ?
                      wire42[(1'h0):(1'h0)] : (($signed((-wire27)) ?
                          (~|(8'ha3)) : ((~reg39) & reg36[(5'h11):(3'h6)])) ^ $unsigned({$unsigned((8'hb4))})));
endmodule
