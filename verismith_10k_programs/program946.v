module top
#(parameter param80 = ((~^(^~(((7'h40) + (8'hb4)) * {(8'hbd), (8'ha6)}))) ^~ ((-(-{(7'h40)})) | {(!{(8'hb4), (8'hbb)}), (((7'h40) ? (7'h42) : (8'hb7)) < ((8'hbb) ^~ (8'haf)))})), 
parameter param81 = (((~|(+(param80 ? (8'ha2) : param80))) << param80) * (param80 - param80)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire67;
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire67,
                 reg79,
                 reg76,
                 reg70,
                 (1'h0)};
  module5 #() modinst68 (.wire7(wire4), .wire9(wire0), .clk(clk), .y(wire67), .wire6(wire2), .wire8(wire3));
  assign wire69 = {(+$unsigned({wire2[(5'h10):(3'h6)]})),
                      wire67[(3'h4):(1'h0)]};
  always
    @(posedge clk) begin
      reg70 <= $unsigned(($signed((wire1[(3'h7):(3'h6)] ?
              $unsigned((8'hb3)) : wire69)) ?
          wire69[(1'h1):(1'h0)] : $unsigned((wire3[(1'h0):(1'h0)] ?
              (!wire4) : (wire3 ? wire3 : (8'hbe))))));
    end
  assign wire71 = wire2;
  assign wire72 = $signed(wire67);
  assign wire73 = wire4[(2'h2):(2'h2)];
  assign wire74 = ((~wire4) ?
                      (|$unsigned($unsigned((wire2 & (8'ha1))))) : wire3);
  assign wire75 = $unsigned((!($signed((reg70 ? wire74 : wire4)) ?
                      ((wire69 ^ wire4) ?
                          (wire0 ?
                              wire74 : wire69) : (wire4 >= wire74)) : wire71)));
  always
    @(posedge clk) begin
      reg76 <= $signed((8'ha6));
    end
  assign wire77 = $unsigned($signed(((!$unsigned(wire67)) ?
                      (wire72[(3'h6):(3'h5)] <= (-wire4)) : (8'hbe))));
  assign wire78 = ((7'h41) ?
                      ((wire75[(4'h9):(1'h1)] || (^~$signed(reg70))) && (-(-(wire77 >= wire73)))) : ((reg76[(2'h3):(1'h1)] ?
                              wire77[(1'h0):(1'h0)] : (|reg76[(1'h1):(1'h1)])) ?
                          $signed($signed($signed((8'hb9)))) : {$unsigned(wire73[(4'he):(4'h9)])}));
  always
    @(posedge clk) begin
      reg79 <= {$unsigned(($unsigned($signed(wire69)) ?
              (^~$signed(wire69)) : (|wire75[(4'h8):(4'h8)])))};
    end
endmodule

module module5
#(parameter param66 = (^((~&(((8'ha9) ? (8'ha0) : (8'hb7)) ? (!(8'had)) : (~(8'hae)))) > ({((8'hb3) == (7'h40)), ((7'h40) ? (7'h40) : (7'h42))} * ((~|(8'ha1)) ? ((8'hb6) ^ (8'hbe)) : {(8'hbc)})))))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire6;
  input wire [(2'h2):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire58;
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire10,
                 wire11,
                 wire12,
                 wire17,
                 wire18,
                 wire19,
                 wire29,
                 wire58,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  assign wire10 = ($unsigned(({(wire9 < wire6), $unsigned((8'ha3))} ?
                          ($signed((8'hbe)) ?
                              wire9[(3'h5):(3'h4)] : $unsigned(wire8)) : ((wire9 | wire9) ?
                              wire9[(4'hc):(4'h9)] : wire7[(1'h1):(1'h0)]))) ?
                      (((wire7 <= (wire6 ? wire8 : wire7)) == wire9) ?
                          wire9 : $signed({(wire8 < wire9)})) : {wire7,
                          {(wire9[(5'h13):(4'ha)] ^ wire9)}});
  assign wire11 = (wire6 < wire6);
  assign wire12 = wire7;
  always
    @(posedge clk) begin
      if ($unsigned(wire9[(5'h12):(4'h8)]))
        begin
          reg13 <= (8'hba);
          if ((~({(((8'hb1) ? wire12 : reg13) ?
                  ((8'hab) ?
                      wire9 : reg13) : ((8'h9d) ^~ wire12))} != {{((7'h40) ?
                      wire7 : (8'hbe))},
              (wire9 >> wire11[(1'h0):(1'h0)])})))
            begin
              reg14 <= wire8;
            end
          else
            begin
              reg14 <= {$signed((wire6 != $unsigned((reg14 + (8'hb3))))),
                  $unsigned($signed(wire12[(1'h1):(1'h1)]))};
            end
          reg15 <= $unsigned($signed(wire12));
          reg16 <= (($unsigned(($signed(reg15) ?
                  (+reg13) : (8'hb9))) ^ $unsigned(reg14)) ?
              wire7[(1'h0):(1'h0)] : (~^$unsigned(wire6)));
        end
      else
        begin
          reg13 <= $unsigned(reg16[(3'h4):(1'h0)]);
          if (($unsigned((wire11[(3'h7):(3'h7)] * (^~(~wire8)))) < $unsigned(((~|(-reg14)) | ($unsigned(wire10) == wire7[(1'h0):(1'h0)])))))
            begin
              reg14 <= wire8;
              reg15 <= ($signed((reg14 ?
                  $unsigned((reg14 ?
                      wire8 : wire10)) : {$unsigned(wire6)})) ^ $unsigned($unsigned($unsigned($signed(wire6)))));
            end
          else
            begin
              reg14 <= ($signed(wire6[(2'h2):(1'h0)]) ?
                  (reg14 ?
                      ({$unsigned(reg14)} > ((wire8 + reg16) ?
                          ((8'hbd) != wire6) : (~(7'h44)))) : (~|$unsigned((-wire12)))) : reg16);
              reg15 <= {$signed((~(~wire6[(1'h0):(1'h0)]))),
                  wire12[(2'h2):(1'h0)]};
            end
        end
    end
  assign wire17 = (8'ha6);
  assign wire18 = (^~(!($signed({reg14, (8'hbd)}) <= (~(wire11 <= reg16)))));
  assign wire19 = (&wire17[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg20 <= reg14[(3'h5):(2'h2)];
      if ($signed($signed(((^~(reg14 ? wire9 : (8'hb6))) ^ (+(^~wire8))))))
        begin
          reg21 <= $unsigned(wire9);
          reg22 <= $unsigned(((reg21[(1'h1):(1'h0)] ?
                  reg21[(4'hc):(3'h4)] : (wire7 & (wire9 ? wire19 : wire7))) ?
              reg13[(1'h0):(1'h0)] : {($unsigned(reg15) == (~&(8'ha1))),
                  $signed($signed(reg13))}));
          reg23 <= {reg20,
              (({(-wire10), reg22[(2'h3):(1'h1)]} | reg22[(3'h7):(1'h0)]) ?
                  $unsigned($signed({wire9})) : ((wire10[(4'h9):(1'h1)] ?
                          {wire12} : (~|wire19)) ?
                      wire12 : $signed(wire11[(3'h7):(1'h1)])))};
        end
      else
        begin
          reg21 <= ($signed((|wire11)) ? (8'hae) : $unsigned((-(8'hbf))));
          reg22 <= $unsigned((!(((+wire7) ? (wire10 == reg21) : {reg13}) ?
              wire17[(4'hb):(2'h3)] : ({(8'had)} << $signed(wire10)))));
          reg23 <= {$unsigned({wire11})};
          reg24 <= (($signed(($signed(reg20) >= ((8'hb7) ?
                  wire11 : wire6))) < (8'hb5)) ?
              (~$signed((-$signed(wire8)))) : (~&wire7));
          reg25 <= (^{$unsigned(reg16)});
        end
      reg26 <= ({wire12[(1'h1):(1'h1)],
              ((reg20[(2'h3):(2'h3)] && wire8) < $unsigned(reg14))} ?
          ({reg16,
              (+(~reg22))} >= reg24[(3'h6):(2'h2)]) : ((~&reg22[(3'h5):(2'h3)]) ?
              ($unsigned((reg21 >>> reg22)) ~^ (wire11 + wire7[(2'h2):(1'h1)])) : {(reg22 ?
                      $unsigned(reg15) : (^~reg13)),
                  reg20[(3'h7):(2'h2)]}));
      reg27 <= $signed(wire18);
      reg28 <= reg26[(4'hf):(4'h8)];
    end
  assign wire29 = ((-$unsigned((reg16 ?
                      $signed((7'h43)) : {reg22,
                          reg20}))) > ($signed((~&reg21)) ?
                      $unsigned((-{(8'hb5), reg27})) : {(wire10 ?
                              $unsigned(wire17) : (^~reg25))}));
  module30 #() modinst59 (wire58, clk, wire6, reg20, reg22, reg15);
  assign wire60 = (&wire58);
  assign wire61 = wire7[(1'h0):(1'h0)];
  assign wire62 = wire19[(4'ha):(4'h8)];
  assign wire63 = (~|$signed(((&(wire18 * wire7)) ?
                      ($unsigned((8'had)) ?
                          reg25[(2'h3):(1'h1)] : wire7) : $unsigned(reg15[(5'h14):(4'hf)]))));
  assign wire64 = wire60;
  assign wire65 = (8'hb1);
endmodule

module module30  (y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire34;
  input wire signed [(4'hc):(1'h0)] wire33;
  input wire [(4'h9):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
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
  assign wire35 = ($signed((wire34 ?
                      (wire32[(3'h5):(1'h0)] ?
                          {wire33,
                              wire31} : wire32) : wire34)) >= (($unsigned($signed((8'hbb))) ?
                          {wire33} : wire31) ?
                      ((wire34[(4'hb):(3'h5)] ?
                          wire31[(3'h5):(2'h3)] : $signed((8'ha8))) && $unsigned($signed(wire32))) : (~^$signed((~^wire32)))));
  assign wire36 = {(&wire33[(2'h3):(1'h1)]),
                      ({wire33} > $unsigned(wire35[(1'h0):(1'h0)]))};
  assign wire37 = (&(^~$unsigned(($signed(wire33) > $signed(wire35)))));
  assign wire38 = (wire32 || wire37[(1'h0):(1'h0)]);
  assign wire39 = $unsigned($unsigned(wire37));
  assign wire40 = $unsigned(($unsigned((8'hb3)) ?
                      ($unsigned((wire34 <<< wire31)) < wire39) : (~|$unsigned((~^(8'hbf))))));
  assign wire41 = {(wire35[(1'h0):(1'h0)] ?
                          {(~|((8'hae) ?
                                  wire36 : (8'hae)))} : $signed($unsigned($unsigned(wire31))))};
  assign wire42 = ((^~(+wire35)) ?
                      wire36[(1'h1):(1'h1)] : $unsigned(({$signed(wire40)} ?
                          ($signed((7'h43)) <= (&wire34)) : ((~^(8'ha8)) != wire39[(3'h4):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($signed(((!wire35) ?
          $unsigned($unsigned(wire36[(2'h2):(2'h2)])) : wire35)))
        begin
          reg43 <= wire34;
          reg44 <= (^$unsigned(wire42[(3'h5):(3'h5)]));
          reg45 <= $unsigned($signed($unsigned(($unsigned(wire33) ?
              {wire31} : ((7'h44) ? wire41 : wire32)))));
          if ($signed((8'ha5)))
            begin
              reg46 <= (reg45 ? wire40[(2'h2):(2'h2)] : wire36);
              reg47 <= (&$unsigned($unsigned($signed((^wire40)))));
              reg48 <= $unsigned(((+reg46[(3'h5):(1'h0)]) ?
                  (({wire35, reg43} || (wire37 ?
                      reg47 : wire33)) >> wire34[(4'he):(4'hd)]) : (!(|$unsigned(wire40)))));
              reg49 <= $unsigned(((reg45 ?
                      reg48[(4'hd):(3'h4)] : $signed((wire41 == reg43))) ?
                  wire36 : (reg47 ?
                      $signed($unsigned(wire33)) : reg46[(3'h4):(3'h4)])));
              reg50 <= {wire35[(2'h3):(2'h3)], $unsigned(reg48[(1'h1):(1'h1)])};
            end
          else
            begin
              reg46 <= $signed($unsigned({$unsigned(wire36), (8'hbb)}));
              reg47 <= wire31;
            end
          reg51 <= $signed(wire37);
        end
      else
        begin
          reg43 <= reg43[(2'h2):(1'h0)];
          reg44 <= reg49[(1'h0):(1'h0)];
          reg45 <= ($signed({{(wire35 ? reg46 : (8'hbf)),
                      wire36[(4'h8):(1'h1)]}}) ?
              ((8'hb5) ^ (wire36 ?
                  (^{wire31, wire32}) : wire41)) : $signed({reg47}));
          if ((~|{$signed(($signed(reg48) | $signed(reg51)))}))
            begin
              reg46 <= $unsigned($signed((^~wire34[(1'h1):(1'h1)])));
            end
          else
            begin
              reg46 <= (wire34 ^~ (($unsigned($unsigned((7'h44))) >>> $signed((wire31 < wire38))) + (!$signed($signed(reg45)))));
              reg47 <= (((~^{$unsigned(wire35),
                      {reg51, reg50}}) * (~&$unsigned($signed(wire42)))) ?
                  $unsigned(wire34) : ($signed($signed(wire39)) != (~&$signed($unsigned((7'h44))))));
              reg48 <= (8'hbb);
            end
          reg49 <= $signed(wire40[(1'h1):(1'h1)]);
        end
      reg52 <= reg49;
      reg53 <= ((!$unsigned($unsigned((wire31 ? wire34 : (8'hb3))))) ?
          wire32 : (~&(((7'h42) ? (!reg43) : reg52) ?
              (^~((8'h9f) ? reg49 : reg48)) : ($signed(wire42) ?
                  {wire36, (7'h43)} : (reg44 ? (8'hb7) : wire34)))));
    end
  assign wire54 = wire35;
  assign wire55 = $signed(wire41);
  assign wire56 = reg50;
  assign wire57 = (&(wire54 <<< $signed($signed((!wire40)))));
endmodule
