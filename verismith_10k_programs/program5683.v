module top
#(parameter param85 = {(~^((((8'hb2) | (8'hbc)) ? ((8'ha6) ? (8'hb3) : (8'hbb)) : ((8'hb0) ? (7'h40) : (8'ha7))) ? {(&(8'ha3))} : (((8'hba) ^~ (8'hb2)) ? ((8'hab) ? (8'haf) : (8'hb6)) : ((8'hbe) ? (8'hac) : (7'h42))))), (+(+(((8'ha6) ? (8'hba) : (8'hb7)) >= ((8'ha0) < (8'had)))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire83;
  assign y = {wire4, wire5, wire6, wire83, (1'h0)};
  assign wire4 = ((wire1[(3'h7):(3'h7)] >>> (wire2[(3'h4):(2'h2)] ?
                     wire0 : wire2)) ~^ ({(+wire0), wire0} ?
                     $signed(((+wire2) ~^ wire3)) : (wire1[(3'h5):(1'h0)] ?
                         {wire3} : (~{wire3, wire1}))));
  assign wire5 = wire0;
  assign wire6 = $signed({(({wire3, wire0} || (~|wire3)) >= $signed({wire4,
                         wire2}))});
  module7 #() modinst84 (.y(wire83), .wire10(wire3), .wire8(wire0), .wire11(wire4), .wire12(wire5), .clk(clk), .wire9(wire6));
endmodule

module module7
#(parameter param82 = (-((^(((8'ha0) ? (8'hbb) : (8'hb7)) << ((8'hbd) ? (7'h44) : (8'had)))) >> ((-((8'ha7) ? (8'h9f) : (7'h42))) & (((8'haf) ? (8'h9d) : (8'hae)) ^ (~^(8'hbe)))))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire29;
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  assign y = {wire80, wire31, wire29, reg13, (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= ((-(wire10[(4'h9):(3'h6)] ?
          wire8[(3'h7):(2'h3)] : wire8[(1'h0):(1'h0)])) >> $unsigned({wire9}));
    end
  module14 #() modinst30 (wire29, clk, wire12, wire10, wire8, wire11);
  assign wire31 = (8'ha4);
  module32 #() modinst81 (.wire36(wire10), .clk(clk), .wire33(wire31), .wire34(wire8), .y(wire80), .wire35(wire29));
endmodule

module module32
#(parameter param79 = {{((((7'h44) ? (8'hb0) : (8'hb8)) ? ((8'hba) ? (8'hb0) : (8'ha1)) : {(8'haf)}) * (8'ha9))}, ((~{((8'h9f) ? (8'hb6) : (8'ha6))}) != ({{(8'hb8)}} ? (((8'hbb) * (8'h9c)) ~^ (-(8'h9f))) : (((8'h9c) ^~ (8'hb1)) ^ (+(8'hae)))))})
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h1d9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire36;
  input wire [(4'he):(1'h0)] wire35;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire signed [(3'h7):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire39,
                 wire38,
                 wire37,
                 reg76,
                 reg75,
                 reg65,
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
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire37 = wire34;
  assign wire38 = (($signed((~&{wire35,
                          wire37})) && $unsigned(wire36[(4'ha):(1'h0)])) ?
                      (($unsigned((~|wire33)) ?
                              $unsigned(wire33) : ((-wire36) <<< wire35)) ?
                          (|wire36) : (wire37[(4'hb):(1'h1)] != wire34[(5'h13):(3'h6)])) : $unsigned(($unsigned((wire33 ^ wire33)) ?
                          wire37 : $signed((8'ha6)))));
  assign wire39 = ((($unsigned($unsigned(wire38)) ^~ $unsigned({wire33})) ?
                          ((8'h9c) | ((~&wire33) | $signed(wire37))) : (+wire35)) ?
                      $unsigned(wire35[(4'hd):(3'h4)]) : $signed(($unsigned($unsigned(wire35)) | (8'ha8))));
  always
    @(posedge clk) begin
      if ({({(wire36[(4'hf):(4'h9)] & (~|(8'hb1))),
              (8'hb8)} != wire35[(3'h4):(2'h3)]),
          ($unsigned($unsigned($signed(wire34))) ?
              $unsigned((+(wire37 + (8'haf)))) : ($signed(wire37[(2'h3):(1'h0)]) >>> ($signed(wire35) ?
                  wire33 : (wire36 ? wire33 : wire39))))})
        begin
          reg40 <= wire37;
        end
      else
        begin
          if ((~^wire35))
            begin
              reg40 <= (wire33 ?
                  wire36 : $unsigned($signed($unsigned((wire39 ?
                      (7'h44) : (8'hab))))));
              reg41 <= $unsigned($unsigned(reg40[(2'h2):(1'h1)]));
              reg42 <= wire35[(4'ha):(3'h6)];
              reg43 <= ($unsigned(reg42[(4'h8):(3'h4)]) <= $unsigned(($unsigned(wire35) ?
                  ((-(7'h43)) << $signed(reg42)) : (reg40[(1'h0):(1'h0)] <= $signed(reg41)))));
            end
          else
            begin
              reg40 <= (wire33 && wire34[(3'h5):(1'h0)]);
              reg41 <= $signed(($signed($signed({wire34, reg41})) ?
                  $unsigned($signed(wire33[(3'h4):(1'h1)])) : wire33[(3'h5):(1'h1)]));
              reg42 <= reg42;
              reg43 <= $signed((+wire35[(3'h6):(2'h3)]));
            end
          reg44 <= $signed((^~($unsigned({reg42}) ? wire34 : reg42)));
          reg45 <= $unsigned(wire39[(3'h5):(3'h5)]);
          reg46 <= wire34;
        end
      reg47 <= $signed(reg44[(2'h3):(2'h2)]);
      if ($signed($unsigned(($signed(((8'hb8) ?
          (8'ha5) : (8'hb6))) >>> (reg40 ^ reg41[(2'h3):(1'h1)])))))
        begin
          reg48 <= reg46;
          reg49 <= reg45[(4'hf):(4'h8)];
          if ((|{$unsigned((((8'hb1) ? wire36 : reg42) + reg43)),
              $unsigned(({wire34} <= $unsigned(reg49)))}))
            begin
              reg50 <= {((((wire34 ?
                          reg41 : wire35) >>> (!reg45)) ~^ $signed((wire37 >> wire36))) ?
                      ($signed(reg42) != ((-reg41) >>> (reg44 > (8'hb4)))) : (|$unsigned($unsigned(reg42)))),
                  $unsigned((wire39 || (!(reg47 >>> wire34))))};
              reg51 <= ($signed((|reg46[(2'h2):(2'h2)])) ?
                  ($signed(wire33[(3'h4):(1'h1)]) ?
                      (~^(-reg47)) : $unsigned({$unsigned(reg42)})) : (~$unsigned(reg49[(4'hb):(4'hb)])));
              reg52 <= (($signed(reg42[(1'h0):(1'h0)]) ?
                      (reg42[(2'h2):(1'h1)] ?
                          $unsigned((wire33 ?
                              reg50 : wire35)) : wire39[(1'h0):(1'h0)]) : $signed((~|(reg49 ?
                          (8'ha6) : wire34)))) ?
                  (((!(~^(8'hba))) << reg46[(3'h5):(1'h0)]) ?
                      (+(wire39 ?
                          $unsigned(wire35) : wire38[(1'h1):(1'h1)])) : (8'hb1)) : $unsigned(wire39[(4'ha):(2'h3)]));
              reg53 <= $unsigned($signed(reg41));
            end
          else
            begin
              reg50 <= wire36;
              reg51 <= (^~reg46);
              reg52 <= $signed(wire34[(5'h13):(2'h2)]);
              reg53 <= wire34[(4'hc):(3'h5)];
            end
        end
      else
        begin
          reg48 <= ($unsigned($signed(reg46)) >>> wire35[(4'h9):(3'h4)]);
        end
      if (wire39)
        begin
          reg54 <= reg45;
          if (($unsigned(reg44) & ($signed(reg46[(2'h3):(2'h2)]) ^~ reg40)))
            begin
              reg55 <= $signed(wire38[(4'ha):(4'h8)]);
            end
          else
            begin
              reg55 <= (~|{reg40, wire39});
            end
        end
      else
        begin
          if (reg44[(1'h1):(1'h1)])
            begin
              reg54 <= (($unsigned($signed((reg40 >> reg50))) >> (-((wire34 ?
                  (8'haa) : wire33) >> $signed(reg42)))) >> {reg46[(4'hb):(4'h9)]});
              reg55 <= ($unsigned((wire37 ?
                  {$unsigned((8'hbf)),
                      (8'ha2)} : $signed((~&wire35)))) & reg44);
              reg56 <= $signed($signed(wire33));
            end
          else
            begin
              reg54 <= wire35[(4'hb):(4'h8)];
              reg55 <= (~&{$unsigned($signed((reg47 ^~ reg40)))});
              reg56 <= reg51[(4'hb):(2'h3)];
              reg57 <= $signed((8'hbc));
            end
          reg58 <= wire39;
          reg59 <= reg41;
        end
      reg60 <= ($unsigned((|wire33)) < (({reg54[(4'hb):(1'h0)]} ?
          (wire35[(2'h3):(1'h1)] == $signed(wire33)) : (+$signed(wire38))) <= wire34[(5'h11):(4'hd)]));
    end
  assign wire61 = $unsigned($unsigned((reg55 ?
                      ($signed(wire39) ?
                          (wire35 >>> wire36) : (wire33 >>> reg57)) : reg47)));
  assign wire62 = $unsigned($signed({reg40,
                      ($signed(reg41) ?
                          (wire38 ? reg55 : wire34) : reg47[(3'h6):(3'h5)])}));
  assign wire63 = reg43[(2'h3):(2'h3)];
  assign wire64 = $signed($signed((((reg51 ? wire39 : reg46) ?
                      wire34[(4'ha):(4'h9)] : reg57[(3'h7):(2'h2)]) <<< ((reg52 ^~ wire62) ?
                      ((8'hae) ? wire33 : wire34) : (wire35 < reg45)))));
  always
    @(posedge clk) begin
      reg65 <= $signed({$unsigned(((wire33 | reg40) ?
              {reg59, reg47} : {wire37, wire36})),
          reg57[(1'h1):(1'h1)]});
    end
  assign wire66 = $signed(reg60);
  assign wire67 = $unsigned((^wire33[(1'h0):(1'h0)]));
  assign wire68 = (($unsigned((~|$signed(wire66))) ?
                          $unsigned(reg41[(2'h3):(1'h0)]) : reg58) ?
                      wire61[(3'h6):(3'h4)] : ((+$signed($unsigned(reg47))) == (((~reg51) ?
                              {reg40} : (reg57 ? reg46 : reg46)) ?
                          ({reg57} ?
                              (wire64 ? reg40 : reg41) : (reg46 ?
                                  wire67 : (8'ha5))) : $unsigned((reg42 >> reg52)))));
  assign wire69 = {($signed(reg60) ?
                          {(wire62 ?
                                  {wire35} : $unsigned(reg48))} : (((^reg50) >= (wire63 ?
                                  reg41 : reg65)) ?
                              wire64 : (^$unsigned(wire36))))};
  assign wire70 = $unsigned(reg52);
  assign wire71 = $unsigned($signed((wire39[(5'h12):(3'h6)] ?
                      $unsigned((~reg44)) : (^$unsigned(reg46)))));
  assign wire72 = ((~wire35[(4'h8):(3'h6)]) ~^ $unsigned($unsigned($unsigned((reg58 > reg44)))));
  assign wire73 = $unsigned($unsigned((((reg65 ^~ (8'haa)) ?
                          $unsigned((8'hb6)) : ((7'h44) + reg54)) ?
                      wire61[(4'hb):(3'h4)] : (wire33 ?
                          ((8'h9f) > reg49) : (!reg51)))));
  assign wire74 = $signed({reg51[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      reg75 <= wire73[(4'hb):(3'h7)];
      reg76 <= (~^wire38);
    end
  assign wire77 = {{(wire63 > (^~reg49))}};
  assign wire78 = {(wire62 ?
                          (($signed(wire38) ? $unsigned(reg76) : {(8'hbd)}) ?
                              (-(reg59 || reg75)) : ((wire74 ?
                                  reg42 : reg47) >= {(8'ha1)})) : (^~(|(~^wire68))))};
endmodule

module module14
#(parameter param27 = (!{((~&(+(8'had))) < (!(&(8'hb5))))}), 
parameter param28 = {((!(~&param27)) >> ((+param27) ? param27 : ((param27 ? param27 : param27) ? (&param27) : {param27, param27})))})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 (1'h0)};
  assign wire19 = ({wire18} ^~ wire15[(3'h6):(2'h3)]);
  assign wire20 = $unsigned((wire16[(2'h2):(2'h2)] ?
                      wire15[(3'h7):(2'h2)] : ($unsigned(wire15[(2'h2):(2'h2)]) <<< (|(wire19 >>> (7'h43))))));
  assign wire21 = wire15;
  assign wire22 = wire18;
  assign wire23 = $unsigned((8'h9e));
  assign wire24 = (~^(~&{({wire18} >>> {wire19, wire18})}));
  assign wire25 = $unsigned($unsigned(wire21));
  assign wire26 = (8'h9d);
endmodule
