module top
#(parameter param89 = (({(-((8'ha3) == (8'hbb))), (8'hb6)} ? (!((!(8'hb4)) ~^ ((8'ha9) ? (8'hbb) : (8'hac)))) : ({((8'hb3) & (8'hb9))} <= (((7'h40) ? (8'haf) : (8'ha4)) | (|(8'ha3))))) ? ((!(((8'hbd) ? (7'h41) : (8'hb6)) ? ((8'hba) ? (8'h9f) : (8'hb9)) : ((8'hac) == (7'h40)))) ^~ ((^~((8'ha2) ? (8'hbd) : (8'hb0))) ^ ({(7'h43), (8'hbe)} ? ((8'ha4) ? (7'h43) : (8'hba)) : ((8'ha5) * (8'hbb))))) : {{{(~^(7'h44)), ((8'ha6) > (8'h9c))}}}), 
parameter param90 = ({(((!(8'ha8)) ^~ param89) ^ (-param89))} ? (8'hab) : {(((param89 ? param89 : (8'hb9)) > param89) >> ({param89, param89} >>> (param89 <<< param89)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire76,
                 wire75,
                 wire70,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg88,
                 reg87,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg74,
                 reg73,
                 reg72,
                 reg8,
                 (1'h0)};
  assign wire4 = (wire0 ^ (&(8'h9f)));
  assign wire5 = $unsigned(wire3[(3'h6):(1'h1)]);
  assign wire6 = (((^~(((8'ha0) ? wire2 : (8'hbf)) ?
                             wire5 : (wire4 ? (8'hb4) : (8'hb8)))) ?
                         (((wire2 >> wire4) ?
                             $unsigned((8'hac)) : {(8'had),
                                 wire0}) >>> (&wire0[(4'h9):(3'h7)])) : (^wire4)) ?
                     wire4[(4'h8):(2'h3)] : $signed($unsigned((wire2 ^~ wire4))));
  assign wire7 = (-wire3[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg8 <= $unsigned({(-$signed((wire6 <<< wire4))), wire6});
    end
  assign wire9 = (wire1 ?
                     {$unsigned((wire3[(1'h1):(1'h0)] ? wire1 : wire6)),
                         $unsigned(wire6[(3'h5):(1'h0)])} : wire4[(3'h5):(2'h3)]);
  assign wire10 = (wire6[(1'h1):(1'h1)] < (wire0[(1'h0):(1'h0)] || wire2));
  assign wire11 = ($signed(wire5[(1'h1):(1'h1)]) < wire4[(3'h6):(1'h1)]);
  assign wire12 = $unsigned(wire4);
  assign wire13 = $unsigned(((~^wire3) << (~$unsigned($unsigned((8'haa))))));
  assign wire14 = $signed((8'hb8));
  module15 #() modinst71 (.clk(clk), .y(wire70), .wire17(wire14), .wire19(wire11), .wire16(wire0), .wire18(wire3));
  always
    @(posedge clk) begin
      reg72 <= (wire14[(4'hc):(1'h1)] ?
          {wire0[(3'h6):(1'h1)],
              $signed($unsigned($unsigned(wire70)))} : wire14);
      reg73 <= $unsigned(wire10);
      reg74 <= ($unsigned(wire5[(1'h0):(1'h0)]) - $signed($signed((((8'hab) ?
              (8'hbd) : wire4) ?
          $signed(wire6) : $signed(wire0)))));
    end
  assign wire75 = $unsigned($signed(reg73[(3'h4):(2'h3)]));
  assign wire76 = $signed($signed(($unsigned($signed(wire3)) != (wire9 ^ {wire75}))));
  always
    @(posedge clk) begin
      reg77 <= wire4[(1'h1):(1'h1)];
      if (($signed($signed(((^~wire12) ?
          reg77 : $signed(reg73)))) ~^ (wire5[(1'h1):(1'h0)] ?
          $signed($signed({wire13})) : (8'h9c))))
        begin
          reg78 <= (~$signed(($unsigned((reg74 != wire0)) ?
              (~&wire9) : wire14[(4'hb):(2'h3)])));
          reg79 <= (reg73 & (wire76 || {(wire11 != reg77[(3'h4):(2'h3)])}));
          reg80 <= {reg8[(2'h2):(2'h2)], reg78[(3'h7):(3'h6)]};
          reg81 <= $unsigned((-wire6[(1'h0):(1'h0)]));
        end
      else
        begin
          if ((&(+((8'hb7) & ({wire6} ?
              $signed(reg78) : wire10[(5'h10):(4'he)])))))
            begin
              reg78 <= wire1[(1'h1):(1'h0)];
              reg79 <= wire13;
              reg80 <= ((($signed($signed(wire7)) ? wire70 : reg78) ?
                      $signed(reg80) : wire6) ?
                  (($unsigned((~reg81)) ?
                      {wire70[(1'h0):(1'h0)]} : wire6[(1'h0):(1'h0)]) <= wire7) : $unsigned(wire2[(4'hb):(3'h7)]));
              reg81 <= wire0[(4'h9):(3'h4)];
              reg82 <= wire3[(3'h7):(2'h2)];
            end
          else
            begin
              reg78 <= ($unsigned((reg72[(1'h1):(1'h0)] ?
                  {$unsigned(wire9),
                      (wire13 ?
                          wire11 : wire4)} : wire14)) <= ($unsigned((~|(+(7'h43)))) || (^({reg8,
                  (8'ha8)} | $signed((8'ha3))))));
            end
          reg83 <= reg78[(2'h3):(2'h3)];
          reg84 <= $signed((^~wire1));
        end
    end
  assign wire85 = ({$signed(((^~(7'h42)) ~^ wire0)),
                          (~((wire10 ? wire9 : reg80) ? wire7 : {wire76}))} ?
                      (((7'h42) << {reg84[(3'h7):(3'h4)]}) ?
                          ((~&(wire1 != wire76)) < (wire13[(3'h6):(1'h0)] != ((8'hbc) != wire3))) : reg83[(2'h2):(1'h0)]) : wire9);
  assign wire86 = $unsigned($unsigned($signed((^{reg77}))));
  always
    @(posedge clk) begin
      reg87 <= ({(reg82[(1'h1):(1'h0)] + (^(8'hbd)))} ^~ {(~(^~(wire7 ?
              (8'hbe) : wire10))),
          (-$unsigned($signed(reg73)))});
      reg88 <= $unsigned($signed((wire11[(3'h5):(3'h4)] << ((wire76 << reg78) & $signed(reg73)))));
    end
endmodule

module module15
#(parameter param68 = ((({((8'hba) ? (8'ha9) : (7'h40))} > ((8'hbb) * ((8'hb3) && (8'hbb)))) == {((^(8'hb6)) * ((8'hac) >> (8'hae))), (((8'hb8) ? (8'hae) : (8'hb9)) ? {(8'hb6), (8'ha5)} : {(8'hae)})}) | {(!(-(^(8'hbc))))}), 
parameter param69 = (param68 | (param68 >= param68)))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  assign y = {wire66,
                 wire26,
                 wire25,
                 wire21,
                 wire20,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  assign wire20 = ((~&wire18) > $unsigned($unsigned($signed((7'h43)))));
  assign wire21 = ((((~wire16[(2'h3):(1'h0)]) > wire17[(4'he):(1'h0)]) >> $signed(($signed(wire16) * (^wire16)))) ?
                      (($unsigned(wire17) ?
                          (~&(-wire19)) : wire20) ^~ $signed($signed($unsigned(wire20)))) : $signed($unsigned(wire20)));
  always
    @(posedge clk) begin
      reg22 <= {wire16, wire16[(2'h3):(1'h1)]};
      reg23 <= wire21[(1'h1):(1'h1)];
      reg24 <= $signed(reg23[(1'h0):(1'h0)]);
    end
  assign wire25 = (&$signed(wire16));
  assign wire26 = {wire20, (^~$unsigned($signed((wire17 < wire17))))};
  module27 #() modinst67 (.wire28(wire18), .wire31(reg24), .wire30(wire26), .wire32(wire20), .y(wire66), .clk(clk), .wire29(wire16));
endmodule

module module27
#(parameter param65 = ({(-{((8'ha3) ? (8'hb3) : (8'hb2))})} > {(!{((7'h40) >> (8'h9f))})}))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire32;
  input wire signed [(5'h12):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  assign y = {wire64,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg63,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire33 = $signed($unsigned((~$signed(wire30))));
  assign wire34 = wire32[(5'h10):(4'hb)];
  assign wire35 = (wire34 ?
                      wire31[(4'hc):(4'h9)] : {(wire28[(3'h4):(3'h4)] ^~ wire33[(3'h6):(1'h0)]),
                          (((8'h9e) ? {wire29} : wire32) ?
                              wire28[(3'h4):(2'h3)] : (~(wire34 ?
                                  wire30 : wire28)))});
  assign wire36 = wire28[(3'h5):(3'h5)];
  assign wire37 = (^~{wire29,
                      ($signed({wire32, wire30}) >= wire29[(2'h3):(2'h2)])});
  always
    @(posedge clk) begin
      if (wire33)
        begin
          reg38 <= ((&{$unsigned((wire28 - wire28))}) | (wire33[(2'h2):(2'h2)] ?
              wire31 : {($signed((8'hba)) ~^ (^wire30))}));
          reg39 <= wire28[(1'h0):(1'h0)];
          reg40 <= $unsigned($unsigned((((8'ha1) ? (8'hb3) : wire34) ?
              (reg39[(4'hb):(3'h7)] ? (-(8'hab)) : (^reg39)) : (!{wire28,
                  reg38}))));
        end
      else
        begin
          reg38 <= $unsigned((($signed(wire29[(1'h0):(1'h0)]) ?
              (+((8'ha5) ? reg38 : wire32)) : ((reg38 ~^ (8'haa)) ?
                  (^~wire37) : $unsigned(reg38))) ^~ (~|reg38)));
          if (wire34)
            begin
              reg39 <= wire29[(2'h3):(2'h3)];
              reg40 <= reg39;
            end
          else
            begin
              reg39 <= (^~wire30);
              reg40 <= wire35;
              reg41 <= (~|$unsigned(wire35[(2'h3):(1'h1)]));
            end
          reg42 <= reg38;
          if ($unsigned((~^((reg39 ? wire29[(1'h1):(1'h0)] : {wire34, reg38}) ?
              reg38 : $signed((7'h42))))))
            begin
              reg43 <= $unsigned((((reg39 ?
                  wire32 : $unsigned(reg40)) ^~ reg41) == reg41[(3'h6):(3'h5)]));
              reg44 <= {wire36,
                  ({$unsigned((reg39 >>> wire33))} ?
                      reg43[(5'h12):(5'h10)] : (~^$signed($unsigned(wire29))))};
            end
          else
            begin
              reg43 <= wire30[(2'h3):(2'h2)];
              reg44 <= ((~|wire37[(4'ha):(2'h3)]) ?
                  $signed(((+(+reg42)) ?
                      $unsigned($unsigned(reg40)) : ((reg42 <<< wire36) << (wire35 | wire30)))) : (wire34[(4'hb):(3'h6)] ?
                      $unsigned(wire37) : $signed(wire32[(1'h1):(1'h1)])));
            end
        end
      reg45 <= $signed({reg40, wire36[(2'h2):(2'h2)]});
      reg46 <= ({$signed(((reg41 - (8'hac)) <<< (^reg40))),
              (($unsigned((8'hb7)) < (wire36 || (8'hb6))) * $signed($signed(reg44)))} ?
          wire29[(2'h3):(2'h2)] : (($unsigned((~|wire35)) < ((8'hbb) == {wire37,
              wire36})) != reg45[(1'h1):(1'h0)]));
      reg47 <= $signed(reg42[(2'h2):(1'h1)]);
    end
  assign wire48 = reg46;
  assign wire49 = ((~&wire35[(1'h0):(1'h0)]) != $unsigned($signed(wire29[(1'h1):(1'h0)])));
  assign wire50 = {(reg44 ?
                          {((wire36 >= reg47) >> (^~reg40)),
                              ({reg42} & (~wire30))} : ($unsigned((^reg38)) ?
                              (|(~|wire48)) : ((reg40 ? reg40 : wire34) ?
                                  $signed(reg42) : {wire49, (8'hb5)})))};
  assign wire51 = (~^reg46[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg52 <= wire36;
      reg53 <= wire49;
      reg54 <= ((|reg39[(1'h1):(1'h1)]) ?
          $signed((|wire48[(3'h6):(3'h5)])) : ((|$signed((~|wire30))) ^ (((~&reg47) ?
                  wire36 : (&reg41)) ?
              ((reg42 >> reg43) * reg40) : wire31)));
      reg55 <= ({$unsigned((wire33[(1'h0):(1'h0)] >= reg54[(1'h1):(1'h0)])),
              wire28} ?
          ((~^({reg41} ? wire48[(3'h4):(3'h4)] : (8'ha5))) ?
              ($unsigned((reg54 ?
                  wire48 : wire34)) > $signed($unsigned(wire37))) : reg43[(4'he):(4'he)]) : reg42[(1'h1):(1'h1)]);
    end
  assign wire56 = $unsigned($unsigned($unsigned((~|(wire35 ?
                      wire37 : reg40)))));
  assign wire57 = ($unsigned($unsigned(reg42)) ^~ (~&$unsigned(reg55)));
  assign wire58 = {($signed(reg44[(3'h4):(2'h3)]) * (7'h44))};
  assign wire59 = reg39[(1'h1):(1'h1)];
  assign wire60 = $unsigned(wire33[(4'h8):(2'h3)]);
  assign wire61 = (({($signed(wire56) ?
                              (reg46 | wire37) : ((8'hbc) ?
                                  reg47 : reg46))} - ($unsigned((^~wire35)) >> $unsigned($signed(wire36)))) ?
                      (reg55 ? wire35 : reg38) : reg43[(2'h3):(2'h2)]);
  assign wire62 = (-(wire56 ? $unsigned((~^(reg53 > reg40))) : wire60));
  always
    @(posedge clk) begin
      reg63 <= reg39;
    end
  assign wire64 = $unsigned((^((^~(wire29 ? wire36 : reg45)) ?
                      reg38 : (~&(reg39 & (8'hb3))))));
endmodule
