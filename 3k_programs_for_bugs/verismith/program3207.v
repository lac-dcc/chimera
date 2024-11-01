module top
#(parameter param65 = {(((&(+(8'ha8))) ? (((8'ha9) < (7'h44)) ? (7'h42) : (|(8'ha8))) : ((-(8'hbf)) == ((8'hb2) >> (8'haa)))) ~^ (&(^~(+(8'had))))), (+({{(8'h9f), (8'hb6)}} || (((8'h9e) ? (8'ha1) : (8'hbe)) ? {(8'hb6), (8'ha4)} : ((8'hb5) << (7'h40)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
                 wire8,
                 wire7,
                 wire6,
                 wire4,
                 reg5,
                 (1'h0)};
  assign wire4 = wire0;
  always
    @(posedge clk) begin
      reg5 <= wire0;
    end
  assign wire6 = reg5[(1'h0):(1'h0)];
  assign wire7 = $unsigned(wire2[(3'h6):(3'h6)]);
  assign wire8 = reg5;
  module9 #() modinst60 (wire59, clk, reg5, wire8, wire3, wire2, wire7);
  assign wire61 = {(8'hbe)};
  assign wire62 = $signed(({((8'ha1) ?
                          (reg5 ? wire2 : wire3) : (wire8 ? wire61 : wire1)),
                      wire3[(5'h12):(4'hf)]} ~^ {($signed(reg5) < (wire1 ?
                          (8'h9d) : wire1))}));
  assign wire63 = ((!({wire3[(4'he):(2'h2)], (reg5 ? wire7 : (8'hbd))} ?
                      (wire4[(2'h2):(1'h1)] ~^ wire62[(3'h4):(2'h3)]) : ((wire3 ?
                              wire61 : wire59) ?
                          reg5[(1'h1):(1'h0)] : (wire2 < (8'hbc))))) >= $unsigned($signed(((wire2 >>> wire6) ?
                      reg5[(1'h0):(1'h0)] : wire2[(4'he):(4'he)]))));
  assign wire64 = {wire62[(4'hb):(2'h3)]};
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire signed [(2'h3):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire55;
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire15,
                 wire16,
                 wire55,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  assign wire15 = (~^(^({(wire11 ? wire10 : wire14)} ?
                      (+$signed(wire11)) : wire10[(1'h1):(1'h0)])));
  assign wire16 = $signed($unsigned((wire10 + (^wire12))));
  always
    @(posedge clk) begin
      reg17 <= (((wire13[(3'h6):(1'h1)] ?
              (^~(wire12 ?
                  wire13 : wire14)) : wire12) >> (!$unsigned(wire14[(1'h1):(1'h1)]))) ?
          $unsigned((~^wire12)) : ((~^($unsigned(wire12) ?
              $unsigned(wire14) : (wire10 ?
                  wire10 : wire15))) && (wire16[(4'hb):(1'h0)] == (^$unsigned(wire14)))));
      reg18 <= ((!$unsigned((^~$signed((8'h9c))))) || (|{((wire11 ^ reg17) ^ (!wire16))}));
      reg19 <= $signed($signed((((8'hae) | wire11) ?
          wire14[(1'h0):(1'h0)] : {((8'hbe) ? wire14 : wire16)})));
      if (({wire16, $signed((~&$unsigned(wire14)))} ?
          $signed(reg17[(2'h2):(2'h2)]) : ((((wire10 & reg17) ?
                  (!wire16) : wire14[(1'h0):(1'h0)]) ?
              wire15[(3'h6):(1'h1)] : {reg17[(2'h3):(1'h1)]}) ^ (8'h9f))))
        begin
          if ($unsigned(wire10[(2'h2):(1'h0)]))
            begin
              reg20 <= $signed((~&(reg19 ^~ ($signed(wire11) ?
                  wire11 : (~&wire13)))));
              reg21 <= reg19[(2'h2):(1'h1)];
            end
          else
            begin
              reg20 <= $unsigned($unsigned((|$signed($unsigned(wire15)))));
              reg21 <= ($signed($unsigned(reg21)) | $signed(reg18[(2'h3):(2'h2)]));
            end
        end
      else
        begin
          reg20 <= wire14[(2'h2):(1'h1)];
          reg21 <= ({({(8'ha9), wire11[(4'h9):(1'h1)]} ?
                  reg17 : (reg20 == {(8'hb3),
                      reg17}))} >= ($signed(($unsigned(wire12) ?
              reg21 : (wire10 <= wire16))) | (reg19 ?
              {$signed(reg18),
                  wire10[(2'h3):(2'h2)]} : $unsigned($unsigned(wire13)))));
          reg22 <= $signed(($signed(wire11[(5'h10):(4'hd)]) <<< (~&($unsigned(wire12) <= (wire13 ?
              wire13 : reg20)))));
        end
    end
  module23 #() modinst56 (wire55, clk, wire11, reg21, reg17, reg18);
  assign wire57 = {reg21[(3'h7):(3'h5)]};
  assign wire58 = (reg18[(1'h0):(1'h0)] ?
                      $signed(((wire11 ? wire55[(1'h0):(1'h0)] : (7'h42)) ?
                          ($signed(reg18) | $unsigned((8'hbf))) : ((reg22 != wire57) ?
                              wire11[(4'h9):(2'h2)] : {reg22,
                                  (8'haf)}))) : wire14[(2'h2):(2'h2)]);
endmodule

module module23
#(parameter param53 = (&{((((7'h42) >= (8'ha3)) ? (+(8'haf)) : {(7'h41)}) == ((^(8'hbc)) ? ((8'ha2) ? (8'had) : (8'ha6)) : ((8'hb4) ? (8'ha2) : (8'hb5))))}), 
parameter param54 = (&param53))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire27;
  input wire signed [(4'ha):(1'h0)] wire26;
  input wire signed [(4'ha):(1'h0)] wire25;
  input wire [(4'hc):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire28 = ($signed(($unsigned($unsigned(wire24)) ?
                      (wire24 ^ wire26[(1'h0):(1'h0)]) : ({wire26, wire27} ?
                          wire26 : $signed(wire25)))) < wire25[(4'h8):(1'h0)]);
  assign wire29 = (((^~((-wire24) >= $unsigned(wire25))) ?
                      (((wire28 + (8'hbe)) ?
                              (wire25 ? wire25 : wire28) : (wire28 << wire24)) ?
                          wire26 : wire24) : $signed($signed((wire25 << wire24)))) << {((^$signed(wire28)) ?
                          (|wire28) : wire24[(3'h7):(1'h1)])});
  assign wire30 = $signed($unsigned(($signed(((8'had) ?
                      wire27 : wire27)) ~^ (~^(wire27 * wire24)))));
  assign wire31 = $signed((~&{(+(wire28 ? (8'h9d) : wire26)),
                      (wire27[(2'h2):(1'h0)] ?
                          (+wire30) : (wire25 ? (7'h40) : wire24))}));
  assign wire32 = $signed(wire29[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg33 <= (((((wire27 || wire29) ?
                  $unsigned((7'h43)) : (wire26 ?
                      wire24 : wire24)) && ($signed(wire24) ?
                  $unsigned(wire31) : (wire27 ? wire32 : wire24))) ?
              (-((wire31 >= wire32) ?
                  (wire26 ?
                      wire32 : wire29) : $unsigned(wire24))) : wire32[(4'ha):(3'h4)]) ?
          ({(wire30 - (wire32 >> wire31))} ^~ $signed((^~(~^wire28)))) : (($signed((wire24 ?
                  (8'hbd) : (8'haf))) || {wire28[(3'h4):(2'h3)]}) ?
              {(wire29[(4'h9):(4'h8)] & wire26[(3'h7):(3'h7)])} : wire29));
      reg34 <= (!(&reg33[(1'h1):(1'h0)]));
      reg35 <= (wire26 ?
          {reg34[(4'hc):(4'h8)],
              (((wire27 <<< wire28) && (wire28 - (8'h9c))) >= ((reg34 || (8'ha1)) ^ (+(7'h43))))} : wire26);
      if ((-$unsigned(((^wire26[(3'h6):(1'h0)]) ?
          wire25 : {(wire30 ^ wire29), (reg34 >> wire25)}))))
        begin
          if ($unsigned(wire30))
            begin
              reg36 <= reg33;
              reg37 <= (8'hb6);
              reg38 <= $unsigned(wire24);
              reg39 <= {reg37[(1'h0):(1'h0)]};
            end
          else
            begin
              reg36 <= ($signed((^~($signed(wire25) ?
                  (reg33 != reg39) : $unsigned(reg38)))) * reg39);
            end
        end
      else
        begin
          reg36 <= wire25;
          reg37 <= $signed($unsigned((^~wire28)));
          reg38 <= {(8'hbf)};
          reg39 <= reg38[(3'h6):(1'h0)];
          reg40 <= {wire24[(4'h8):(3'h5)],
              ($signed($unsigned((wire24 | wire30))) ?
                  ((wire29 ? $unsigned(reg37) : {reg33}) ?
                      ($unsigned(wire26) ?
                          (reg37 ? wire28 : (8'had)) : (reg36 ?
                              wire31 : wire28)) : (~^(^wire26))) : (reg35 ?
                      (^~(&reg33)) : (wire31 ? (~^wire32) : $signed(reg38))))};
        end
      reg41 <= ((-{wire31[(3'h6):(1'h1)]}) && (wire30[(3'h4):(1'h0)] ?
          $signed($signed(wire25)) : $signed((reg34 ^ (^~(8'h9d))))));
    end
  assign wire42 = {$signed($signed($signed(reg33))), reg33[(4'hc):(4'hb)]};
  assign wire43 = (8'ha3);
  assign wire44 = wire32;
  assign wire45 = $unsigned($unsigned($signed(($unsigned(wire28) ?
                      $unsigned((8'hb1)) : $signed(reg35)))));
  assign wire46 = reg35;
  assign wire47 = (~{wire25[(1'h0):(1'h0)], (^reg36[(4'he):(4'hb)])});
  assign wire48 = wire47;
  assign wire49 = (reg41[(3'h4):(1'h1)] ^ wire47[(1'h1):(1'h1)]);
  assign wire50 = (wire30 <<< (~^(($unsigned(reg35) ?
                      wire29[(3'h7):(3'h6)] : (~^wire43)) >= wire44[(2'h3):(1'h0)])));
  assign wire51 = ($signed(((~^$unsigned((8'hb9))) ?
                      wire29[(3'h6):(3'h5)] : $unsigned((|(8'hac))))) ^ ((~^(-(reg41 < wire47))) ?
                      $unsigned((reg36 >= $signed(wire44))) : ((wire25 < {reg34}) ?
                          wire32 : (~&(~^wire47)))));
  assign wire52 = $signed(($signed($unsigned($signed((8'hb6)))) ?
                      (|(wire48[(1'h0):(1'h0)] && $signed(wire30))) : $signed($signed({wire50,
                          wire43}))));
endmodule
