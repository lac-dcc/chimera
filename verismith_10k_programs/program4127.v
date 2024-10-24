module top
#(parameter param77 = {(~|(((^(8'hbc)) | {(8'ha5), (8'ha7)}) < (^~((8'hb9) ? (8'ha2) : (8'ha5))))), (((((8'haa) > (8'ha2)) ? (|(8'h9d)) : (^~(8'hbe))) ? (+((8'hbe) ? (8'hb2) : (8'hb9))) : (((8'had) && (8'hbe)) ? {(8'hb1)} : ((8'hba) ? (8'hbd) : (8'h9f)))) ? ((((8'hb0) ? (8'hb1) : (7'h43)) ? (~&(8'hba)) : ((7'h41) ? (8'ha6) : (8'haf))) ? ({(8'ha4)} ? ((8'h9c) ? (8'hba) : (8'h9e)) : ((8'had) ? (8'hb7) : (7'h40))) : ({(8'ha4), (8'hbb)} <= {(8'hb8)})) : {(((8'haa) ? (8'hb8) : (7'h44)) > (7'h40)), (^((8'h9e) ? (8'hb5) : (8'hb8)))})}, 
parameter param78 = (({(!((8'hbe) >> (8'hbf))), (^param77)} ? (|(~(param77 ? param77 : param77))) : (~^param77)) ? (param77 >>> (({param77, param77} ? (~(8'ha9)) : param77) ? (~&{param77, (8'haf)}) : (!param77))) : (8'ha4)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire20;
  assign y = {wire75, wire24, wire23, wire22, wire20, (1'h0)};
  module5 #() modinst21 (wire20, clk, wire2, wire3, wire4, wire1);
  assign wire22 = ((~wire3) >>> wire1);
  assign wire23 = {(~&((~&(^wire4)) ~^ wire20[(2'h3):(2'h3)])),
                      $unsigned((($unsigned(wire22) && $unsigned(wire0)) * wire20[(2'h2):(1'h1)]))};
  assign wire24 = $unsigned(($unsigned((-$unsigned(wire0))) && wire2[(5'h12):(3'h5)]));
  module25 #() modinst76 (wire75, clk, wire22, wire24, wire2, wire1);
endmodule

module module25
#(parameter param74 = (~^((((^~(7'h40)) & ((8'hae) ^ (8'ha9))) ? ((+(8'ha8)) <<< {(8'ha5), (8'hbe)}) : (((7'h42) ? (8'hb2) : (8'haa)) ? (7'h43) : ((7'h41) ? (8'ha9) : (7'h42)))) ? ((((8'hbf) ? (7'h42) : (8'h9f)) ? (^(8'ha1)) : ((8'ha7) == (8'ha0))) ? (7'h40) : {((8'hba) ? (8'hb9) : (7'h40)), ((8'h9d) ^ (8'hbf))}) : (8'hbe))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire29;
  input wire signed [(4'h9):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire27;
  input wire signed [(4'ha):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  assign y = {wire73,
                 wire71,
                 wire69,
                 wire49,
                 wire48,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg72,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire30 = (~^wire29[(1'h0):(1'h0)]);
  assign wire31 = {$unsigned(({{(7'h42)}} != $unsigned((&wire30))))};
  assign wire32 = $signed(($signed({$unsigned((8'hb8)), $unsigned(wire29)}) ?
                      $signed(wire27) : wire30));
  assign wire33 = wire32[(2'h2):(1'h1)];
  assign wire34 = (($unsigned($unsigned($signed(wire30))) * {(~|{wire28,
                          wire27})}) >= $unsigned((^~{wire28[(4'h9):(1'h0)],
                      ((7'h43) < wire27)})));
  assign wire35 = ($unsigned(wire30) ?
                      ((&wire31) ?
                          (wire28[(1'h0):(1'h0)] ?
                              wire31 : ($unsigned(wire32) ?
                                  (~^wire28) : $signed(wire26))) : (((|wire31) ?
                                  ((8'hb4) ? (8'hb2) : wire33) : {wire28}) ?
                              $signed($signed((8'ha3))) : wire34)) : {(~&(^~(wire28 >> (8'ha4))))});
  assign wire36 = wire27[(4'hb):(3'h6)];
  assign wire37 = ((+wire27) ?
                      (^~$unsigned(wire34)) : {$signed(wire36[(2'h2):(2'h2)]),
                          $signed(wire33)});
  assign wire38 = {(!$unsigned(wire30)),
                      ((&(8'hbd)) ?
                          $signed((((8'hb4) == wire34) ?
                              $unsigned(wire34) : wire37)) : $unsigned($unsigned(wire34)))};
  assign wire39 = (~|wire30);
  assign wire40 = (8'ha1);
  assign wire41 = wire32[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned(((!((wire30 ? (8'hb8) : wire33) ?
          wire32 : $unsigned(wire36))) <= {wire35})))
        begin
          reg42 <= ({{$unsigned((+wire34))},
                  (wire28 == wire34[(1'h1):(1'h1)])} ?
              wire27 : wire36);
          if ((((|$unsigned(wire41)) ?
              wire26[(1'h0):(1'h0)] : (~|$unsigned($signed(wire39)))) << $signed($unsigned($signed({wire27})))))
            begin
              reg43 <= ($signed($signed($unsigned((wire28 ?
                      (8'hb3) : (8'hb9))))) ?
                  wire36 : wire38[(4'h8):(3'h7)]);
              reg44 <= wire26[(2'h3):(2'h3)];
            end
          else
            begin
              reg43 <= {$signed(wire33), $signed($unsigned(wire35))};
              reg44 <= wire34[(2'h3):(2'h2)];
            end
        end
      else
        begin
          reg42 <= $signed(wire38[(1'h0):(1'h0)]);
          reg43 <= (($unsigned((+$unsigned(reg44))) != (+wire27)) ^~ ((+(~&$unsigned(wire37))) && wire41[(4'h9):(2'h2)]));
          reg44 <= (reg43[(3'h6):(2'h3)] ? wire33 : reg42);
          reg45 <= wire31;
        end
    end
  always
    @(posedge clk) begin
      reg46 <= $signed({{$unsigned((wire40 <<< wire38)),
              wire38[(2'h3):(1'h1)]}});
      reg47 <= (wire32[(4'h9):(2'h3)] ?
          (^~({(8'ha8)} ?
              (reg45[(1'h0):(1'h0)] ?
                  reg43[(3'h4):(2'h3)] : (wire38 ?
                      wire37 : wire35)) : $unsigned((wire33 ?
                  wire31 : (8'hbb))))) : $signed((8'hbb)));
    end
  assign wire48 = ((wire41[(3'h6):(3'h4)] > wire36[(2'h3):(2'h2)]) > ($signed(((wire29 ?
                          reg42 : (8'haf)) <= (wire38 ? wire32 : wire29))) ?
                      (~(|reg42)) : $unsigned((wire41 ?
                          wire40 : (reg44 ? reg43 : reg46)))));
  assign wire49 = (7'h40);
  module50 #() modinst70 (wire69, clk, wire33, wire39, wire37, wire38);
  assign wire71 = $signed(reg44);
  always
    @(posedge clk) begin
      reg72 <= $unsigned((&wire38));
    end
  assign wire73 = wire34;
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  input wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire10 = $signed(($signed(((|wire8) ^ wire9[(2'h2):(1'h0)])) ?
                      wire6 : wire9));
  assign wire11 = (~&wire7);
  assign wire12 = wire9;
  assign wire13 = (-(&$signed((~wire7[(4'h8):(2'h3)]))));
  always
    @(posedge clk) begin
      reg14 <= ($signed($signed(wire6)) ?
          wire13 : $signed(($signed(wire8[(2'h2):(1'h1)]) < (|$unsigned(wire8)))));
      reg15 <= $unsigned(wire11);
    end
  assign wire16 = $unsigned({(|((~wire10) ^~ (wire9 ? (8'h9c) : wire12)))});
  assign wire17 = ((({(7'h44)} ?
                              {{wire12, wire13},
                                  reg14} : $signed((wire8 >> wire16))) ?
                          ({wire10[(4'hb):(1'h1)],
                              (~wire6)} != (reg14[(4'hc):(3'h6)] ?
                              $unsigned(wire9) : $signed(wire8))) : (wire6 <<< (~&reg14))) ?
                      $signed($signed(($unsigned(wire6) ?
                          $unsigned((8'h9c)) : $unsigned(wire11)))) : wire8[(4'h9):(2'h2)]);
  assign wire18 = (wire7[(4'hf):(3'h4)] >= {wire8, (~wire12)});
  assign wire19 = ((({(wire12 >> wire10),
                          $signed(wire6)} >= wire18[(2'h3):(2'h3)]) | $signed(wire6[(1'h1):(1'h0)])) ?
                      wire16 : {wire9[(5'h12):(1'h0)]});
endmodule

module module50
#(parameter param67 = (7'h42), 
parameter param68 = (8'ha1))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire54;
  input wire signed [(4'he):(1'h0)] wire53;
  input wire [(5'h12):(1'h0)] wire52;
  input wire [(4'h8):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire55;
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire55,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire55 = {$signed(wire51), (~wire54)};
  always
    @(posedge clk) begin
      reg56 <= $unsigned(wire53);
      reg57 <= wire54[(2'h2):(2'h2)];
    end
  assign wire58 = wire53[(4'hd):(3'h5)];
  assign wire59 = reg57;
  assign wire60 = $unsigned($signed(wire55));
  assign wire61 = ($signed(wire51) ?
                      wire59[(4'ha):(2'h2)] : $signed(wire59[(4'h8):(3'h6)]));
  assign wire62 = wire53;
  assign wire63 = ((8'hb4) >>> wire55);
  assign wire64 = wire52[(4'he):(4'hd)];
  assign wire65 = ((^~($unsigned({wire61}) ^ ((wire60 & wire53) <<< (-wire58)))) ?
                      (|$unsigned(wire63)) : (&(^~($unsigned(wire55) ?
                          $unsigned((7'h43)) : {wire63, reg57}))));
  assign wire66 = ($unsigned(((|((7'h40) != wire63)) ?
                      $unsigned((8'h9c)) : (~|reg57[(4'hf):(2'h2)]))) >> (~wire65[(3'h5):(2'h2)]));
endmodule
