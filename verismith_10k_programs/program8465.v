module top
#(parameter param82 = (((((!(8'hbf)) ? ((8'hb7) < (8'ha7)) : ((8'ha1) ^ (8'hb3))) & ((~|(8'ha3)) ? {(8'hb5)} : {(8'ha0), (7'h41)})) ? ((|((8'ha3) ? (8'ha3) : (8'haa))) ? (^((7'h44) ? (8'ha9) : (8'hb3))) : ((^~(8'ha1)) >> ((8'ha9) ? (8'hbe) : (8'hb6)))) : ((((8'h9f) ? (8'hb7) : (8'haa)) | ((8'hac) <= (7'h42))) > (!((8'hb7) ? (8'hac) : (8'h9c))))) || (^~({((8'h9c) >> (8'h9e)), {(7'h43), (8'had)}} ? ((+(7'h42)) >>> ((8'h9d) - (8'hb0))) : (((8'ha1) ? (8'hab) : (7'h44)) ? ((7'h42) | (8'h9c)) : ((8'ha4) ^~ (8'hbc)))))), 
parameter param83 = (+param82))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire5,
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
                 (1'h0)};
  assign wire5 = ($unsigned($signed((~^{wire2, (8'haf)}))) ~^ {wire1, (8'hae)});
  module6 #() modinst62 (.wire7(wire2), .wire8(wire5), .y(wire61), .wire10(wire1), .clk(clk), .wire9(wire4));
  assign wire63 = {($signed((wire61[(1'h1):(1'h1)] | (7'h40))) ?
                          wire5 : wire4)};
  assign wire64 = (~&((((wire0 ? wire0 : wire5) * (wire4 ? wire61 : (8'ha3))) ?
                      wire5 : ({wire63, wire5} ?
                          ((8'ha3) ? wire0 : wire63) : (wire3 ?
                              (8'h9d) : wire61))) ^~ ($unsigned($signed(wire0)) <= ({wire63} ^~ (wire2 ?
                      (8'hb8) : wire0)))));
  assign wire65 = ((~{(wire4[(1'h0):(1'h0)] >= (8'hac)),
                      (|wire2[(4'h9):(4'h9)])}) && $unsigned($signed(wire61[(1'h0):(1'h0)])));
  assign wire66 = ((~(~wire64)) <= wire65);
  assign wire67 = (wire66[(3'h6):(1'h0)] ? $unsigned((~|{wire2})) : (8'h9e));
  assign wire68 = wire64;
  assign wire69 = (wire4[(2'h2):(2'h2)] ? wire3 : (&(+(^wire1))));
  assign wire70 = $unsigned(wire1[(5'h14):(3'h4)]);
  always
    @(posedge clk) begin
      reg71 <= wire70;
      if ((-wire68))
        begin
          if (($unsigned({($unsigned(wire63) ?
                  (-(8'ha1)) : (wire69 ? wire66 : wire69)),
              $signed(((8'hb7) ? wire65 : wire3))}) == (-($unsigned((wire65 ?
              wire65 : wire63)) >= (+((8'hb6) ? wire67 : wire67))))))
            begin
              reg72 <= wire70[(4'hd):(2'h3)];
              reg73 <= reg71;
              reg74 <= ((reg73[(1'h0):(1'h0)] <= (-(wire63 && (wire65 ?
                  (8'hbd) : reg73)))) + $signed((wire2[(2'h3):(2'h2)] & $unsigned((wire3 ?
                  wire66 : wire4)))));
              reg75 <= ($signed({wire1}) ? $unsigned(wire61) : wire66);
            end
          else
            begin
              reg72 <= wire1;
              reg73 <= $signed((wire66[(3'h4):(2'h3)] ~^ ($signed($unsigned((8'hbc))) * ((8'ha5) ?
                  $unsigned(wire63) : $signed(reg75)))));
              reg74 <= reg73[(4'hb):(2'h3)];
            end
          reg76 <= $unsigned($signed($signed(wire66)));
          reg77 <= $unsigned((^$signed((|(wire64 ? (8'haf) : reg72)))));
          reg78 <= (~|wire67);
          reg79 <= (reg77 ^~ wire69[(5'h10):(4'hc)]);
        end
      else
        begin
          reg72 <= (!(~wire64[(3'h6):(2'h2)]));
          reg73 <= $unsigned($signed($signed({wire3[(3'h5):(3'h5)]})));
        end
      reg80 <= {(8'hbe), (~wire0[(2'h3):(2'h2)])};
      reg81 <= $unsigned(wire66);
    end
endmodule

module module6
#(parameter param60 = ({((~&(!(8'ha9))) >> (-(&(8'h9d)))), {((^~(8'hab)) ? {(8'hb7), (8'had)} : (~(8'hb4))), {((8'hb7) ? (8'haa) : (8'ha8)), ((8'h9c) && (8'hba))}}} ~^ (((((8'ha3) ? (8'had) : (8'hab)) ? (8'hb4) : ((8'hb8) ? (8'hbd) : (7'h40))) ? {((7'h42) ? (8'ha9) : (8'ha9))} : ((8'hb8) > ((8'haa) ? (8'hb9) : (8'hb7)))) ? (~&(((8'hbb) ? (7'h41) : (8'ha9)) ? {(8'h9e), (8'hba)} : (~|(8'hb0)))) : ((((8'hb2) ? (8'h9e) : (8'ha2)) ? (~|(8'hbf)) : ((7'h41) <= (8'ha6))) ^ (~|((7'h42) ? (8'hb4) : (8'ha9)))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire37;
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire11,
                 wire12,
                 wire37,
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
                 (1'h0)};
  assign wire11 = $unsigned((~|$unsigned(wire7[(1'h1):(1'h1)])));
  assign wire12 = ((~&(|(+(wire10 < wire10)))) & $signed((wire11 ?
                      (~&(wire11 << wire7)) : (^~wire10))));
  module13 #() modinst38 (.wire16(wire12), .wire14(wire7), .wire15(wire9), .y(wire37), .wire17(wire11), .clk(clk), .wire18(wire8));
  assign wire39 = {(-{$signed($unsigned(wire10))}), (~^$unsigned((8'hae)))};
  assign wire40 = $signed($unsigned((wire9 ^ (+$unsigned(wire37)))));
  assign wire41 = $signed((wire10[(4'hb):(1'h0)] ?
                      $signed({$unsigned(wire7),
                          wire40[(1'h1):(1'h1)]}) : {$unsigned(wire40)}));
  assign wire42 = (8'hb5);
  assign wire43 = ($signed(wire42[(2'h3):(2'h3)]) ?
                      $signed((&((8'hab) ?
                          (wire12 * (8'hbc)) : {wire11}))) : ({({wire40} == $signed(wire8))} << (($signed((8'hbc)) >= $signed(wire39)) | (-(wire7 ?
                          wire41 : wire12)))));
  assign wire44 = (&wire39);
  assign wire45 = (~wire40[(1'h1):(1'h1)]);
  assign wire46 = $unsigned(wire42);
  assign wire47 = (|((wire43[(2'h3):(2'h2)] <<< wire12[(5'h10):(2'h3)]) << $signed(wire12[(4'hc):(1'h0)])));
  assign wire48 = $unsigned(({((~^wire9) ?
                          wire40[(1'h1):(1'h1)] : (wire40 ?
                              wire47 : wire43))} ^ $unsigned(wire37[(3'h6):(2'h2)])));
  always
    @(posedge clk) begin
      reg49 <= wire12[(3'h5):(3'h4)];
      reg50 <= (+wire10);
      reg51 <= $unsigned(wire45[(4'hf):(3'h7)]);
      if ((~&({(((8'hb0) ? wire48 : wire47) ?
                  wire9[(4'h9):(1'h1)] : wire7[(3'h6):(2'h3)])} ?
          (wire37[(3'h7):(3'h4)] <= ((-(8'hb2)) ?
              (wire9 < wire43) : {wire9})) : {(wire7 - $signed(wire37))})))
        begin
          reg52 <= $signed((~^reg50));
          reg53 <= ((($signed($signed((8'hb2))) != ((8'ha5) << (8'hbf))) ?
                  reg50[(2'h2):(2'h2)] : $signed(wire39)) ?
              (reg50 ?
                  ((wire48 ?
                      ((8'hb5) ?
                          wire12 : wire41) : $unsigned(reg52)) + (reg52[(3'h6):(2'h3)] ^ (wire39 ?
                      wire7 : reg49))) : wire37) : $unsigned((|$unsigned(reg49[(3'h6):(2'h2)]))));
          reg54 <= $unsigned((8'ha1));
          reg55 <= $unsigned((wire48 ?
              {$signed($signed((8'ha9))),
                  ((wire37 ? wire10 : reg53) << (8'ha1))} : (!wire41)));
          reg56 <= reg50[(1'h0):(1'h0)];
        end
      else
        begin
          reg52 <= $unsigned({wire45,
              $unsigned($unsigned(wire42[(3'h7):(1'h0)]))});
          if (((~(~($signed(wire37) ? reg50 : $unsigned((8'h9d))))) << (wire37 ?
              (~^$signed(wire8[(4'hc):(4'hc)])) : {{$unsigned(reg49)},
                  (reg50 ? {(7'h44), reg56} : wire39)})))
            begin
              reg53 <= ((~&(~^$unsigned((reg49 ? (8'ha0) : wire10)))) & reg56);
            end
          else
            begin
              reg53 <= $unsigned(wire41);
              reg54 <= (^~(-wire9));
              reg55 <= wire10[(4'ha):(3'h5)];
              reg56 <= ((((^(wire41 ? wire8 : wire8)) > wire9) ?
                  wire8 : {{reg56},
                      {(wire39 ?
                              reg54 : wire11)}}) << ($unsigned($signed(wire47[(2'h2):(1'h1)])) ~^ $signed($unsigned((wire42 ^~ wire11)))));
              reg57 <= $unsigned((wire10 || reg56));
            end
          reg58 <= (($unsigned(wire11) ?
                  $unsigned((~^wire44[(3'h4):(2'h2)])) : $signed(reg56)) ?
              $unsigned(wire42[(3'h5):(3'h4)]) : (reg51[(2'h3):(1'h1)] || $signed({$unsigned(wire7)})));
        end
      reg59 <= $signed((8'ha9));
    end
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  input wire signed [(3'h5):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg21,
                 (1'h0)};
  assign wire19 = $signed(wire18);
  assign wire20 = wire14;
  always
    @(posedge clk) begin
      reg21 <= $signed(wire18);
    end
  assign wire22 = {(+wire17)};
  assign wire23 = (8'hae);
  assign wire24 = $unsigned(($unsigned(wire23) ?
                      $signed(($unsigned((8'hbe)) || (wire18 & (8'ha6)))) : wire18[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      reg25 <= (&{$unsigned(wire19[(4'he):(2'h2)]),
          ($signed(wire24[(3'h5):(3'h4)]) ?
              $signed((wire17 >= wire16)) : wire19)});
      if (wire14[(4'hc):(4'hc)])
        begin
          if ({{($unsigned((~^wire22)) ? reg25 : {$unsigned(wire16)})}, wire14})
            begin
              reg26 <= ($unsigned($signed(($unsigned(reg21) + $unsigned(wire24)))) ?
                  $unsigned($signed($signed(reg21[(3'h6):(1'h1)]))) : {$unsigned(reg21[(2'h3):(1'h1)])});
              reg27 <= $signed(wire18);
            end
          else
            begin
              reg26 <= reg27;
            end
        end
      else
        begin
          reg26 <= $unsigned(((($signed(wire16) == (&reg21)) != ((!(8'ha7)) ?
              (wire20 ? wire19 : reg25) : (^wire18))) != {wire22,
              ((^wire17) != (8'h9f))}));
          if ((wire20[(4'hc):(2'h2)] >>> (8'hbd)))
            begin
              reg27 <= reg26[(4'ha):(2'h3)];
            end
          else
            begin
              reg27 <= $signed(reg21);
            end
          reg28 <= $unsigned($unsigned((((reg27 ?
                  wire22 : (8'h9f)) == $unsigned((8'ha9))) ?
              ($signed(wire20) ?
                  (wire23 > reg21) : (-wire20)) : $unsigned($unsigned(wire24)))));
        end
      reg29 <= reg27[(2'h3):(2'h3)];
      reg30 <= wire24[(1'h0):(1'h0)];
      reg31 <= (($signed((~$unsigned(wire19))) ?
          reg27 : $unsigned(reg28[(4'h8):(2'h3)])) < $signed(($signed((wire22 ?
              wire16 : reg26)) ?
          $unsigned(((8'hb5) ? wire23 : reg27)) : $signed(wire16))));
    end
  assign wire32 = wire14;
  assign wire33 = reg27[(1'h1):(1'h1)];
  assign wire34 = reg28[(2'h3):(1'h1)];
  assign wire35 = ((($signed((~&(8'hb8))) && ((wire16 ^~ wire15) ?
                          reg21[(2'h2):(2'h2)] : $signed(wire14))) ?
                      (wire15 ?
                          wire23 : ((~&reg28) ?
                              (reg25 | wire19) : (-(8'hba)))) : wire24) != reg26[(4'h8):(1'h0)]);
  assign wire36 = {($unsigned((wire20 ?
                          $signed(wire16) : $unsigned(reg31))) <<< ($unsigned((~|wire17)) ?
                          ((+wire33) ?
                              ((8'hb9) ?
                                  (8'h9f) : wire15) : (&wire24)) : ($unsigned(wire19) >= $unsigned(wire16))))};
endmodule
