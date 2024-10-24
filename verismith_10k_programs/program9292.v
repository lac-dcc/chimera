module top
#(parameter param67 = ((~&((((8'hb3) - (8'had)) ? (!(8'h9c)) : {(8'ha0)}) ? ((~|(8'h9e)) >>> ((8'ha8) ? (7'h42) : (8'ha1))) : {(&(8'hbe))})) ? (&(8'hbb)) : (((~&{(8'h9f)}) ? ((-(8'hbe)) <= ((8'ha0) * (8'hba))) : (-((8'hbc) || (8'ha7)))) ? ((&{(8'hb1), (8'hbd)}) ~^ ((-(8'ha6)) != ((8'ha3) ? (8'had) : (7'h44)))) : ({(|(8'hbf)), (!(7'h41))} ? {((7'h43) ? (8'h9e) : (7'h43)), ((8'hac) ? (7'h41) : (8'hbb))} : (-(^(8'ha8)))))), 
parameter param68 = (^param67))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire41,
                 wire39,
                 wire7,
                 wire6,
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
                 reg43,
                 reg42,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3[(3'h5):(1'h1)];
    end
  assign wire6 = $signed(wire2);
  assign wire7 = ($unsigned(wire6) ? wire4[(3'h7):(3'h5)] : reg5);
  module8 #() modinst40 (wire39, clk, wire4, wire7, wire2, wire6);
  assign wire41 = ((^(^~($signed(wire4) ~^ (wire1 ?
                      wire3 : wire1)))) && (wire39[(3'h7):(3'h4)] ?
                      (+$unsigned(((8'ha6) ?
                          reg5 : wire7))) : (~&$unsigned((wire1 ?
                          wire4 : wire6)))));
  always
    @(posedge clk) begin
      if ((&(((~&(wire7 ? wire41 : wire4)) ?
          $signed((wire2 ? wire0 : wire7)) : (|wire2)) ^~ (wire39 + (reg5 ?
          wire7[(4'ha):(3'h4)] : wire2[(4'ha):(4'h9)])))))
        begin
          reg42 <= (reg5[(3'h4):(1'h1)] ? {wire4} : wire6[(4'h8):(3'h6)]);
          reg43 <= (~wire7);
        end
      else
        begin
          if (wire7[(4'h8):(2'h2)])
            begin
              reg42 <= ($unsigned(wire39) | wire0);
            end
          else
            begin
              reg42 <= reg5;
              reg43 <= ($signed((^~(-((8'hb6) && reg43)))) ^~ wire2);
              reg44 <= ((-(wire1[(5'h12):(2'h2)] > reg42[(3'h5):(3'h5)])) & $signed(wire4));
              reg45 <= wire6;
            end
          if ((($unsigned($unsigned((reg5 == reg44))) ?
              ({(wire7 ? wire7 : wire1), (wire6 ? reg42 : wire1)} > {(reg43 ?
                      wire39 : reg44)}) : $signed($unsigned((|reg5)))) >= $signed(wire39)))
            begin
              reg46 <= (wire4 ?
                  ((wire7[(3'h6):(3'h4)] ?
                      ((^reg45) * wire2[(4'he):(3'h5)]) : (~^(wire3 >>> reg43))) << (^~wire0)) : {({$unsigned(reg44)} ?
                          ((reg43 >>> (7'h43)) ^ reg43[(5'h11):(5'h11)]) : (&{(8'h9c),
                              wire6}))});
            end
          else
            begin
              reg46 <= wire39[(1'h1):(1'h0)];
            end
          reg47 <= ($unsigned(($signed((~^wire39)) | (reg5 ?
              $unsigned(wire7) : (~&reg5)))) >>> ({(wire3 ?
                  (wire1 ? wire41 : wire7) : wire4[(4'ha):(4'ha)]),
              (~$unsigned((8'h9f)))} || $unsigned(((reg43 | reg5) ?
              wire2 : (reg45 ~^ reg5)))));
          reg48 <= reg43;
        end
      reg49 <= reg42;
      if ((|(-wire4[(5'h11):(3'h4)])))
        begin
          if (reg5[(4'ha):(3'h7)])
            begin
              reg50 <= (+$signed(((~&wire2) ?
                  reg5 : ($signed(reg49) ? (-(8'hb6)) : reg45))));
              reg51 <= {$unsigned((($unsigned(wire0) == $signed(wire2)) ^ (|(^(8'ha9)))))};
              reg52 <= $unsigned($unsigned((8'hac)));
              reg53 <= {{$unsigned(reg50[(3'h5):(1'h0)])}};
              reg54 <= wire39[(3'h5):(1'h1)];
            end
          else
            begin
              reg50 <= (7'h42);
            end
          reg55 <= (wire1 && $signed($unsigned({wire7[(3'h4):(2'h2)],
              {wire41}})));
        end
      else
        begin
          reg50 <= {$signed(reg5[(2'h2):(1'h0)]),
              $unsigned((reg44[(2'h2):(1'h0)] - $unsigned($signed(reg46))))};
          reg51 <= ((~(&(~^wire1))) - wire39[(4'h8):(4'h8)]);
          reg52 <= ($signed(reg50) - $signed($unsigned($unsigned((wire2 <= (8'ha5))))));
        end
      if ((^$unsigned(((wire4[(4'ha):(3'h5)] > (~reg52)) + reg53))))
        begin
          reg56 <= (($signed(wire39[(4'h8):(2'h3)]) ?
              ({(~^reg50)} ?
                  ((reg49 ?
                      wire0 : reg55) < reg48) : ({(8'hb3)} ^~ reg55[(1'h1):(1'h1)])) : wire1[(3'h7):(2'h3)]) ^ $signed(reg54));
          reg57 <= $signed($signed($signed((((7'h42) >> (8'haf)) ^~ $unsigned(reg52)))));
        end
      else
        begin
          reg56 <= (8'h9e);
          reg57 <= $signed((+(~^{(-reg54), $unsigned(wire2)})));
          reg58 <= {((!($signed(wire41) ?
                  reg45 : ((8'ha8) << reg5))) << (8'ha5))};
          reg59 <= $signed(wire2[(4'ha):(1'h1)]);
        end
      if (($unsigned(reg59[(1'h0):(1'h0)]) ~^ wire2))
        begin
          reg60 <= $unsigned(((-reg59[(3'h5):(3'h4)]) ?
              $unsigned(($unsigned(reg49) ? (^~reg42) : reg5)) : {(&reg49)}));
          reg61 <= {reg47[(5'h15):(5'h10)],
              ((&(&$signed((8'hbf)))) != ($unsigned((reg46 ?
                  reg48 : reg5)) && (reg48[(4'ha):(4'h9)] ?
                  $unsigned((8'hb8)) : {reg51})))};
          reg62 <= reg5[(2'h2):(1'h0)];
        end
      else
        begin
          reg60 <= (7'h42);
          reg61 <= (|reg53);
          reg62 <= {$unsigned(reg55[(1'h0):(1'h0)]),
              (((8'haf) >>> {((8'hb1) ? (8'hba) : wire39), {(7'h40), reg51}}) ?
                  (-(~wire0)) : {((wire2 ? reg58 : reg44) < {reg42, wire1}),
                      (~^reg56[(1'h0):(1'h0)])})};
        end
    end
  assign wire63 = {$signed({(reg51[(4'h9):(1'h0)] | wire41[(3'h5):(3'h4)])})};
  assign wire64 = reg48[(1'h0):(1'h0)];
  assign wire65 = $unsigned($signed($signed(reg46[(4'h8):(3'h4)])));
  assign wire66 = reg45[(4'h8):(2'h2)];
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire37;
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  assign y = {wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire37,
                 reg19,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= wire11;
    end
  assign wire14 = $signed(wire9);
  assign wire15 = $signed(reg13);
  assign wire16 = ($signed({((-reg13) && (wire9 ?
                          wire12 : wire9))}) >> (~|wire10[(2'h3):(1'h1)]));
  assign wire17 = (~|(~^{((^reg13) <<< (~&wire9)), wire11[(4'hf):(3'h7)]}));
  assign wire18 = reg13;
  always
    @(posedge clk) begin
      reg19 <= (($signed(wire14[(4'hf):(4'h9)]) * wire9) && $signed({reg13}));
    end
  module20 #() modinst38 (wire37, clk, wire16, wire11, wire14, wire12, wire9);
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire25;
  input wire signed [(3'h4):(1'h0)] wire24;
  input wire [(4'hf):(1'h0)] wire23;
  input wire signed [(2'h3):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire26;
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 (1'h0)};
  assign wire26 = $signed((+$unsigned({$signed(wire24)})));
  assign wire27 = (-$signed((~^$unsigned((wire22 ? wire24 : wire26)))));
  assign wire28 = (|($unsigned(wire21) << wire22));
  assign wire29 = ((+(~|$signed({wire28}))) ?
                      $unsigned((wire26 ?
                          $unsigned((wire22 ?
                              wire26 : wire25)) : wire25)) : {(wire24[(3'h4):(1'h1)] ?
                              (wire23[(3'h6):(3'h5)] == $signed(wire28)) : {(wire21 && wire21),
                                  wire25[(4'hd):(2'h3)]}),
                          (8'hae)});
  assign wire30 = (((~wire29) == $signed({{wire23, wire25}})) ?
                      {$signed(wire29)} : (($signed((^~wire26)) >>> wire26[(3'h7):(3'h5)]) ?
                          wire22 : ($unsigned($signed(wire29)) ?
                              $unsigned((-wire25)) : (-(wire24 >= wire21)))));
  assign wire31 = $unsigned({(wire24 ? {$signed(wire27)} : {wire29}),
                      $unsigned(({wire25} & wire23[(4'h8):(3'h6)]))});
  assign wire32 = (wire21 & $unsigned((wire29 != ($unsigned(wire22) ?
                      wire22[(2'h3):(1'h0)] : $signed(wire30)))));
  assign wire33 = $signed(wire27[(3'h6):(1'h0)]);
  assign wire34 = $unsigned(wire30[(3'h4):(1'h0)]);
  assign wire35 = ((-wire33[(3'h6):(1'h1)]) <= $signed({($unsigned((8'hb5)) ?
                          (~&wire25) : ((7'h43) ? wire31 : wire28))}));
  assign wire36 = ((^{$signed(wire34),
                      ((wire27 != wire26) ?
                          {wire32} : $signed(wire32))}) >= (~&$unsigned({wire30})));
endmodule
