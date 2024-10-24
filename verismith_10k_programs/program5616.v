module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  assign y = {wire74,
                 wire72,
                 wire28,
                 wire27,
                 wire26,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg75,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire5 = wire2[(2'h3):(1'h1)];
  assign wire6 = (wire1[(1'h0):(1'h0)] ?
                     ({{$signed(wire5), {wire0, wire1}},
                         wire2[(4'hb):(3'h6)]} >> ($unsigned(wire1) >> $unsigned((^wire3)))) : (8'haa));
  assign wire7 = (((wire2[(1'h0):(1'h0)] >> $unsigned($unsigned((8'hb6)))) ?
                         ((+wire6[(4'h8):(2'h2)]) ?
                             ((wire3 ? (8'hb8) : wire1) ?
                                 (wire5 >> wire1) : (wire0 ?
                                     wire5 : (8'hbd))) : wire4) : wire6[(1'h0):(1'h0)]) ?
                     $signed($signed(wire6[(3'h4):(2'h2)])) : (wire4 ^~ wire3[(3'h4):(1'h0)]));
  assign wire8 = (+wire4);
  assign wire9 = {$signed($signed(((wire5 >>> wire2) ^~ wire1[(1'h1):(1'h1)])))};
  assign wire10 = (wire7[(3'h4):(1'h1)] ?
                      wire7 : $signed($signed(($signed(wire2) ?
                          (-(8'hbc)) : (~|wire0)))));
  assign wire11 = (wire0[(3'h4):(3'h4)] >= (($signed(wire4[(1'h0):(1'h0)]) ?
                      {$unsigned((7'h42)),
                          ((8'hac) & wire2)} : $signed(wire7)) | wire3));
  assign wire12 = (8'hb4);
  assign wire13 = wire6[(4'h9):(3'h7)];
  assign wire14 = (wire7 ? $signed($signed(wire6)) : wire12);
  assign wire15 = ($signed(wire2) ?
                      ($signed(((wire11 ? wire13 : wire12) ?
                              (^~wire9) : (wire8 ? wire10 : wire4))) ?
                          $signed($unsigned(wire3)) : wire0) : $unsigned(wire1[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg16 <= (8'hb8);
      reg17 <= ((^($signed((wire9 != wire3)) != $signed({wire13, reg16}))) ?
          (~&(wire12[(3'h6):(3'h5)] + wire1[(1'h0):(1'h0)])) : $unsigned(({(~wire10)} ?
              $signed(wire3) : {wire5, (wire6 & wire10)})));
      if ($signed($signed(((wire6[(3'h4):(3'h4)] ^ (wire6 ?
          wire1 : wire9)) ^~ wire8))))
        begin
          reg18 <= wire6[(4'hf):(1'h1)];
          reg19 <= $signed(reg18[(1'h0):(1'h0)]);
          if ((~|wire11))
            begin
              reg20 <= (((+((8'hba) ? $signed(wire1) : (+(8'hbe)))) ?
                      ($signed((reg18 ?
                          wire1 : reg17)) <= wire12) : ((+wire14) != wire12)) ?
                  ((|($unsigned(reg17) ?
                      (wire2 >>> wire5) : (+wire12))) > wire13[(1'h0):(1'h0)]) : (wire12 ?
                      ($signed(reg16) >>> $signed((-wire7))) : (wire11 ?
                          (~^(wire13 >> reg18)) : wire3)));
              reg21 <= ((|{{$signed(wire13)}}) ?
                  wire14[(4'hc):(4'ha)] : wire13[(1'h1):(1'h1)]);
              reg22 <= {wire15, reg17[(2'h3):(2'h3)]};
              reg23 <= ($signed(wire14) == $unsigned(($signed({wire9}) ?
                  ($signed((7'h41)) ?
                      (wire1 ?
                          wire7 : (8'ha5)) : (8'haa)) : ($unsigned(wire15) < (wire10 ?
                      wire1 : wire12)))));
              reg24 <= ((^~{(~$unsigned(wire3)), (-(-reg20))}) ?
                  (^$signed(({wire8,
                      wire15} + (&wire10)))) : $signed({wire14}));
            end
          else
            begin
              reg20 <= $unsigned($signed(wire15[(4'h8):(3'h5)]));
            end
        end
      else
        begin
          reg18 <= wire11;
        end
    end
  always
    @(posedge clk) begin
      reg25 <= wire13;
    end
  assign wire26 = $unsigned({reg23,
                      (((wire10 < reg22) ?
                          (~^wire15) : wire3[(1'h1):(1'h0)]) <<< (|wire7))});
  assign wire27 = $signed((^~$unsigned(((wire26 | reg22) && (wire10 ?
                      reg18 : wire12)))));
  assign wire28 = wire26;
  module29 #() modinst73 (.wire34(wire12), .wire30(reg22), .wire31(wire4), .wire32(reg18), .y(wire72), .wire33(reg17), .clk(clk));
  assign wire74 = {(~|(~^(+(wire8 ? (8'h9c) : wire0))))};
  always
    @(posedge clk) begin
      reg75 <= $signed($signed(wire0));
    end
endmodule

module module29
#(parameter param70 = ({(!(((8'hb5) >= (8'hae)) ? {(8'h9c)} : ((8'hb7) ? (8'haf) : (8'hbe)))), (&(((8'haf) ? (8'h9c) : (8'ha8)) >>> (~^(7'h42))))} ~^ (8'ha3)), 
parameter param71 = param70)
(y, clk, wire30, wire31, wire32, wire33, wire34);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire30;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire [(5'h12):(1'h0)] wire32;
  input wire [(3'h7):(1'h0)] wire33;
  input wire signed [(4'hc):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire61;
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  assign y = {wire63,
                 wire35,
                 wire61,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire35 = $unsigned(((!wire30[(2'h2):(1'h0)]) ?
                      (~&$unsigned({wire34})) : {wire34,
                          (-wire32[(3'h4):(2'h2)])}));
  module36 #() modinst62 (.wire37(wire30), .wire38(wire34), .wire39(wire32), .wire41(wire35), .y(wire61), .wire40(wire33), .clk(clk));
  assign wire63 = $signed({(wire30 ?
                          $unsigned($unsigned(wire34)) : $unsigned($unsigned(wire34)))});
  always
    @(posedge clk) begin
      reg64 <= ((wire30[(3'h7):(3'h4)] ?
              $unsigned((7'h41)) : wire61[(3'h4):(2'h2)]) ?
          wire34 : ($signed(((wire35 >> wire61) ?
                  wire31[(3'h7):(2'h2)] : $unsigned(wire32))) ?
              $unsigned(wire31) : wire31));
      if ($unsigned(({(~&(^~wire35)), $signed((&wire35))} >= (8'h9e))))
        begin
          reg65 <= wire34;
          reg66 <= $unsigned($signed($signed($signed($unsigned(reg64)))));
        end
      else
        begin
          reg65 <= wire61;
          if ($unsigned($unsigned($unsigned($signed((wire32 <<< wire61))))))
            begin
              reg66 <= $signed($unsigned((wire33 ?
                  $signed((reg65 << wire32)) : $signed(reg64[(1'h1):(1'h0)]))));
              reg67 <= $unsigned(wire30[(4'h9):(3'h5)]);
            end
          else
            begin
              reg66 <= $unsigned($unsigned((((~wire61) ?
                  $unsigned(reg66) : (^~wire35)) >>> wire34)));
              reg67 <= $signed(($unsigned((~^$unsigned(reg66))) ?
                  ($signed($unsigned(wire32)) ?
                      reg65 : ((wire31 ? wire31 : (8'hb2)) ?
                          wire63[(3'h4):(1'h1)] : ((8'hab) ?
                              wire30 : wire35))) : (~&reg66[(2'h2):(2'h2)])));
              reg68 <= {((~^(^~$signed(reg66))) & wire63)};
              reg69 <= ((wire32[(4'hc):(3'h4)] >> (($signed(wire63) ~^ (wire34 ?
                  (8'h9e) : wire33)) >= (~^$signed(wire33)))) | (reg65[(4'h9):(2'h2)] ^~ (wire63 ?
                  wire61 : wire61)));
            end
        end
    end
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire41;
  input wire signed [(3'h5):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire39;
  input wire signed [(4'hc):(1'h0)] wire38;
  input wire signed [(4'h9):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire42;
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  assign y = {wire54,
                 wire42,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
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
                 reg43,
                 (1'h0)};
  assign wire42 = wire39[(5'h11):(4'hc)];
  always
    @(posedge clk) begin
      if ($unsigned(wire40))
        begin
          reg43 <= wire39;
          reg44 <= wire38[(2'h2):(2'h2)];
          if (reg43)
            begin
              reg45 <= wire40;
              reg46 <= $unsigned((wire39 ?
                  $signed(wire39[(4'hd):(3'h4)]) : ($unsigned(reg43[(4'hc):(3'h5)]) || reg43[(4'h9):(3'h5)])));
            end
          else
            begin
              reg45 <= ((({(~wire40)} <<< (~&(wire41 ?
                  wire37 : (8'hb3)))) != $unsigned((^~(-wire42)))) - (~&((8'hbe) || $signed($signed(wire42)))));
              reg46 <= ((+(|reg46[(3'h6):(3'h6)])) < ({(wire40[(2'h2):(1'h1)] ^~ $signed(wire37)),
                      $signed(reg44)} ?
                  $unsigned($signed(wire37[(3'h7):(3'h5)])) : ({(8'hbc)} ^ wire39[(4'ha):(2'h2)])));
              reg47 <= $signed(wire37[(3'h6):(1'h0)]);
              reg48 <= (!(~^$signed(({wire38,
                  wire37} << wire37[(2'h3):(2'h2)]))));
            end
          if (wire42)
            begin
              reg49 <= $signed(reg47);
              reg50 <= wire38[(2'h2):(1'h0)];
              reg51 <= $signed((wire37[(4'h8):(3'h5)] ?
                  reg46 : (({(8'ha8), (8'hb2)} ?
                      reg43[(4'h9):(3'h5)] : wire42) ~^ (7'h44))));
              reg52 <= ($unsigned(((|wire38[(2'h3):(1'h0)]) ?
                  {(+wire41)} : (-reg43[(4'hc):(3'h6)]))) * wire38[(4'h9):(3'h5)]);
              reg53 <= reg46;
            end
          else
            begin
              reg49 <= {$signed($unsigned(reg45[(2'h3):(2'h2)]))};
              reg50 <= ($signed(reg45[(2'h3):(2'h2)]) ?
                  ((~^$signed({reg49, reg44})) ?
                      (({reg52, wire38} ?
                          (+wire40) : (~wire37)) && reg52) : wire40[(1'h1):(1'h1)]) : {(reg44[(4'hb):(1'h1)] >> (~^{wire42,
                          reg48}))});
              reg51 <= wire41[(2'h2):(1'h0)];
              reg52 <= (wire39[(4'h8):(2'h2)] ?
                  reg45 : ({((wire37 && reg50) >>> (wire37 >= reg50))} ?
                      wire38 : (((reg44 < reg45) <<< (^reg46)) ?
                          (((8'hbd) << reg50) < reg47) : (~&(^~reg52)))));
            end
        end
      else
        begin
          reg43 <= $signed($signed($signed(wire37)));
          reg44 <= $signed((8'hbe));
          reg45 <= (^$unsigned($unsigned(wire41)));
          reg46 <= ((-{$signed($signed(wire39))}) < $unsigned(reg44[(4'hc):(2'h2)]));
          reg47 <= (8'h9e);
        end
    end
  assign wire54 = ((~^(wire41[(2'h2):(1'h0)] - (reg44 ?
                          wire40[(3'h4):(2'h3)] : reg50[(3'h5):(3'h5)]))) ?
                      (~{((~|(8'h9e)) ? reg46 : reg48),
                          (reg51 ^~ (~reg46))}) : (~&reg53));
  always
    @(posedge clk) begin
      if (($signed(reg44) < ((wire42 < ((~|wire38) && (wire54 ?
          reg52 : reg46))) | $signed(wire40))))
        begin
          reg55 <= (($unsigned(($signed(wire40) <<< $signed(wire39))) ?
              ((8'hae) ?
                  (&wire54[(2'h3):(2'h2)]) : (~|$unsigned(reg45))) : ((^(wire54 >> wire40)) ?
                  (&$unsigned(reg44)) : $unsigned($unsigned(reg44)))) ~^ $unsigned($unsigned((~wire41))));
          reg56 <= reg51[(1'h1):(1'h0)];
          reg57 <= $unsigned(reg56[(4'ha):(3'h7)]);
        end
      else
        begin
          reg55 <= reg48[(3'h6):(1'h0)];
        end
      reg58 <= $unsigned($unsigned((((-wire42) ~^ $unsigned(reg53)) ?
          ((reg55 >= wire41) == $signed(wire37)) : ($unsigned(reg57) ?
              (~^(8'h9d)) : (~^wire54)))));
      reg59 <= $unsigned({reg56[(3'h7):(2'h2)]});
      reg60 <= $unsigned(reg51);
    end
endmodule
