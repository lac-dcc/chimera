module top
#(parameter param84 = ({(({(8'ha1), (8'hae)} ? (8'haa) : ((8'haa) ^~ (8'hb5))) ? (~{(7'h44), (8'hbf)}) : {((8'h9c) ? (8'ha0) : (8'hb7)), ((8'ha9) && (8'ha8))})} <<< (+({((8'hb9) ^~ (8'hba))} ? (~^((8'hb5) >> (8'ha7))) : (((7'h44) ? (7'h41) : (8'hb6)) || (-(8'hac)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire [(2'h2):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire69;
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire25,
                 wire27,
                 wire38,
                 wire53,
                 wire54,
                 wire55,
                 wire57,
                 wire58,
                 wire69,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg56,
                 (1'h0)};
  module4 #() modinst26 (.wire7(wire1), .y(wire25), .clk(clk), .wire9(wire0), .wire6(wire3), .wire8(wire2), .wire5((8'hb0)));
  assign wire27 = (((&($signed(wire3) ?
                          {(8'ha0),
                              wire25} : wire0)) ^~ ((8'ha4) ~^ $signed(wire3[(4'hb):(4'h8)]))) ?
                      $unsigned($unsigned((!wire3))) : (^$unsigned({$unsigned(wire25)})));
  always
    @(posedge clk) begin
      reg28 <= $signed($signed((wire25 || ((wire0 ? wire3 : wire1) ?
          (wire27 && wire27) : wire1[(4'hf):(4'he)]))));
      reg29 <= wire27[(4'ha):(4'ha)];
      reg30 <= $signed(reg28);
      reg31 <= wire1[(5'h15):(3'h5)];
      reg32 <= $unsigned(reg31[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if (reg32)
        begin
          reg33 <= $signed((|$unsigned(reg31)));
        end
      else
        begin
          reg33 <= (~&((|($unsigned(reg32) * (^~wire3))) != ((8'haf) ?
              (~&(+wire1)) : ((wire0 ^ wire1) ?
                  (reg32 ? wire2 : wire1) : $signed(wire27)))));
          reg34 <= $signed((^~(^wire0[(1'h0):(1'h0)])));
          reg35 <= wire3[(4'hf):(1'h1)];
          reg36 <= reg28;
        end
      reg37 <= $unsigned($unsigned(reg28));
    end
  assign wire38 = (-(~reg30[(4'he):(1'h0)]));
  always
    @(posedge clk) begin
      if ($unsigned((((~&((8'haa) == wire2)) ?
              ($signed(reg31) | reg34[(1'h0):(1'h0)]) : ({reg32} ?
                  {reg30} : (wire1 ? wire3 : (8'ha5)))) ?
          reg31 : (($unsigned(wire38) == {wire2, reg33}) ?
              $unsigned((^~reg34)) : $signed((~|reg31))))))
        begin
          if ((reg37[(1'h0):(1'h0)] < ($unsigned($signed($signed(reg37))) && ($signed(((7'h43) ?
              (8'hbb) : wire3)) << reg37[(2'h2):(1'h1)]))))
            begin
              reg39 <= $signed($unsigned(reg32[(1'h0):(1'h0)]));
              reg40 <= reg37;
            end
          else
            begin
              reg39 <= (wire2[(5'h12):(4'hd)] ?
                  reg36[(4'hb):(2'h2)] : reg32[(2'h2):(1'h1)]);
              reg40 <= (-($signed((reg28 ? {(8'hb0), reg30} : (~&(8'ha0)))) ?
                  $unsigned(wire25[(4'h9):(3'h7)]) : $signed({(reg32 << reg40),
                      wire0[(2'h3):(1'h1)]})));
              reg41 <= reg40;
            end
          if (wire0[(1'h0):(1'h0)])
            begin
              reg42 <= (((($signed(reg35) ?
                      (+(7'h42)) : (wire1 ? reg41 : (8'hb9))) ?
                  ((+(8'h9d)) ?
                      (reg34 <<< wire0) : $unsigned((7'h44))) : $unsigned(wire2[(5'h11):(4'hf)])) >>> $signed($signed({reg34}))) + $unsigned({(^{reg36,
                      reg28}),
                  ($unsigned((8'h9e)) ? {wire27} : ((8'h9e) >> reg32))}));
              reg43 <= $unsigned(reg30[(4'hc):(4'hc)]);
              reg44 <= ((((-(&wire38)) || {{reg31}}) ?
                      reg35[(2'h3):(2'h3)] : reg31[(3'h4):(1'h0)]) ?
                  $unsigned($signed(reg39)) : $unsigned(reg28));
              reg45 <= reg39;
            end
          else
            begin
              reg42 <= {{(+$signed((~^(8'ha0)))), (8'haa)},
                  (~^((&reg45) ? (^~(~reg33)) : {{reg44}}))};
            end
          reg46 <= {(~^reg43)};
        end
      else
        begin
          reg39 <= $unsigned(wire27);
          if ($unsigned(reg36))
            begin
              reg40 <= reg39;
              reg41 <= $signed((reg45[(1'h0):(1'h0)] >= $signed(reg45[(2'h3):(2'h2)])));
              reg42 <= ($signed((8'ha4)) < {reg31[(2'h2):(1'h1)],
                  ($signed((reg33 | reg34)) || wire25)});
              reg43 <= $signed(reg35[(2'h3):(2'h2)]);
            end
          else
            begin
              reg40 <= reg44;
              reg41 <= reg39[(2'h3):(2'h3)];
              reg42 <= (^~reg33);
              reg43 <= (reg46 ?
                  ($signed($signed($unsigned(reg32))) ?
                      $signed((~(~|reg42))) : $unsigned(($signed(wire38) ?
                          wire25 : {(8'hba)}))) : $unsigned((reg39[(1'h0):(1'h0)] ?
                      reg34[(2'h3):(1'h1)] : wire1)));
            end
          reg44 <= reg42;
          reg45 <= wire1;
        end
      if ($unsigned($signed(((wire1 ? (wire1 && (8'ha7)) : $signed(reg33)) ?
          reg43[(3'h5):(2'h3)] : $signed((~&reg30))))))
        begin
          reg47 <= $unsigned({wire38, (|reg34)});
          reg48 <= (8'hb8);
          reg49 <= {$unsigned($signed(reg48))};
          reg50 <= {(&reg49)};
          reg51 <= (reg48 ?
              {(!$unsigned((!reg31)))} : (reg33[(4'h9):(1'h1)] ?
                  $signed($unsigned((wire25 ?
                      reg40 : reg33))) : $unsigned($unsigned(reg42))));
        end
      else
        begin
          reg47 <= ($signed((+({reg40, reg30} ? {wire27} : $signed(reg29)))) ?
              reg43[(1'h1):(1'h1)] : $signed($signed({$signed((7'h43))})));
          reg48 <= ({((((8'h9e) <<< reg46) != reg29) <= (wire27 <= reg31[(4'h9):(4'h9)])),
              $unsigned($signed($signed((8'hba))))} >>> (~&(8'hab)));
          reg49 <= reg40[(3'h5):(2'h3)];
          reg50 <= $signed(((((wire1 <<< (8'hbe)) < (reg32 ?
                  wire27 : (8'hbd))) ^~ (7'h43)) ?
              reg46[(3'h5):(1'h0)] : (|$signed(((8'ha3) << (8'h9c))))));
          reg51 <= ($unsigned((({reg35, wire27} ?
                  (wire27 ?
                      reg45 : reg48) : wire1[(3'h4):(3'h4)]) >> $unsigned({(8'had),
                  reg45}))) ?
              reg48[(1'h1):(1'h0)] : (^reg39[(1'h1):(1'h1)]));
        end
      reg52 <= $signed($unsigned((~^(~|(reg35 ? wire2 : reg35)))));
    end
  assign wire53 = ({reg35} ?
                      (~&$unsigned((+reg51[(4'hd):(3'h5)]))) : (wire1 ?
                          $unsigned($unsigned(reg50)) : $unsigned(((reg36 >>> reg37) ?
                              $signed(reg34) : $signed(wire25)))));
  assign wire54 = ((($signed((reg44 >> (8'hb4))) ?
                      $signed({reg51}) : reg46) && $signed((~|(7'h42)))) > {((8'hbf) >= ($unsigned(reg39) ?
                          reg37[(3'h5):(2'h2)] : (~reg45)))});
  assign wire55 = $unsigned(wire25[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      reg56 <= (reg50[(4'h8):(2'h2)] > $signed($signed($signed((!wire27)))));
    end
  assign wire57 = {$unsigned((~|($unsigned((8'ha5)) >= $signed(wire3))))};
  assign wire58 = ((((reg28[(1'h0):(1'h0)] - (reg47 || (8'haa))) ?
                          {{reg35, reg29}, (reg35 ? reg28 : reg30)} : reg56) ?
                      $signed({reg44}) : (~(((8'hb3) ? (8'ha8) : reg52) ?
                          $unsigned(reg56) : (+reg40)))) * {{(~&reg44[(5'h13):(4'h9)])}});
  module59 #() modinst70 (wire69, clk, reg40, reg35, reg36, wire2);
  always
    @(posedge clk) begin
      reg71 <= (-(~&((reg39[(1'h0):(1'h0)] ~^ (+wire38)) >> ($unsigned(reg47) ?
          reg34[(2'h2):(1'h0)] : $unsigned(reg31)))));
      reg72 <= {reg33};
      reg73 <= $signed((|(7'h40)));
      reg74 <= wire25;
      reg75 <= (wire25 <= $unsigned(reg29[(1'h0):(1'h0)]));
    end
  assign wire76 = (~&($unsigned(wire25[(1'h0):(1'h0)]) ?
                      reg44 : $unsigned($signed($unsigned(wire54)))));
  assign wire77 = {($signed(((!reg45) ?
                          $signed(wire38) : (reg35 ?
                              reg44 : reg45))) >>> $signed($signed((~^wire2))))};
  assign wire78 = $unsigned(reg29[(2'h3):(2'h3)]);
  assign wire79 = (&$signed(reg42));
  assign wire80 = ((~^($unsigned((|(8'haa))) ?
                          $unsigned((reg34 > reg33)) : ($unsigned(reg32) || wire25))) ?
                      $signed($signed($signed(reg34[(2'h2):(2'h2)]))) : wire57[(1'h0):(1'h0)]);
  assign wire81 = (~^(((-((8'hb6) ? (8'hbf) : wire2)) ?
                      (reg45[(2'h2):(1'h0)] ?
                          wire0 : ((8'hba) <<< reg28)) : wire77) >>> $signed(($signed(wire3) & $unsigned(wire53)))));
  assign wire82 = $unsigned({wire38[(1'h1):(1'h0)],
                      $unsigned($unsigned((8'hb5)))});
  assign wire83 = ($signed(($unsigned(reg74[(5'h10):(3'h7)]) >>> $signed($signed(wire58)))) >> $signed($signed($unsigned(wire80[(1'h0):(1'h0)]))));
endmodule

module module59  (y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire63;
  input wire signed [(5'h13):(1'h0)] wire62;
  input wire signed [(2'h2):(1'h0)] wire61;
  input wire [(2'h3):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  assign y = {wire68, wire67, wire66, wire65, wire64, (1'h0)};
  assign wire64 = $signed({wire60, $unsigned($signed((~^wire61)))});
  assign wire65 = $signed($signed(wire64[(1'h0):(1'h0)]));
  assign wire66 = wire60[(1'h1):(1'h1)];
  assign wire67 = {(+$unsigned((!wire61[(1'h0):(1'h0)])))};
  assign wire68 = $unsigned($signed(wire64));
endmodule

module module4
#(parameter param24 = (((8'hae) && (^~(((8'haa) <<< (8'hb6)) ? ((8'hab) > (8'ha9)) : ((8'hb3) ~^ (8'ha8))))) ? {((((8'ha3) ^ (8'hb1)) ? (8'hba) : ((8'ha6) ? (8'ha0) : (8'ha8))) ? (((8'ha1) ~^ (8'hb8)) ? ((8'ha4) ? (8'had) : (8'hbf)) : {(8'hab), (8'h9c)}) : (((8'had) ? (8'hbc) : (8'ha7)) ^ ((8'hb7) ? (8'ha3) : (8'haf))))} : ({{((8'haf) <<< (8'hb0))}, ({(8'ha5), (8'ha4)} ? (|(8'hb5)) : ((8'hbe) ? (8'hb5) : (8'h9e)))} ? (~&(|((8'h9e) ~^ (8'haa)))) : (-(8'hba)))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire6;
  input wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  assign y = {wire23,
                 wire11,
                 wire10,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = $signed($unsigned($signed($unsigned(wire7))));
  assign wire11 = $unsigned(wire7[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire8)
        begin
          if (wire8[(5'h10):(4'hb)])
            begin
              reg12 <= $unsigned({{($unsigned(wire5) <<< wire9),
                      $signed(wire5[(1'h0):(1'h0)])}});
              reg13 <= (~|(wire10[(1'h1):(1'h1)] & wire7[(1'h1):(1'h1)]));
            end
          else
            begin
              reg12 <= $unsigned(wire10);
              reg13 <= $signed($signed(((~|wire11[(4'h9):(3'h5)]) ?
                  ($unsigned(wire5) ?
                      wire6 : $signed(wire8)) : $unsigned({wire8}))));
              reg14 <= wire6[(3'h4):(1'h1)];
              reg15 <= (($unsigned({(wire7 >= wire7)}) > (reg14[(1'h0):(1'h0)] + $signed((reg12 > reg12)))) ?
                  $unsigned(wire10[(3'h5):(3'h4)]) : $signed($signed(wire11)));
            end
          reg16 <= $signed(wire5);
          reg17 <= (~&reg16);
          reg18 <= wire7[(2'h3):(1'h0)];
        end
      else
        begin
          if ({$unsigned({reg13, (8'hac)})})
            begin
              reg12 <= $signed($signed(($signed((~&(8'ha7))) ?
                  wire10 : $unsigned((reg12 ? wire5 : reg14)))));
              reg13 <= (^$signed((((reg18 ? (8'hb0) : reg12) ?
                  reg15 : reg12[(3'h7):(2'h3)]) ~^ (!(+wire5)))));
              reg14 <= $signed($signed({((~^wire5) ?
                      (|wire6) : (wire11 <<< wire9)),
                  (8'ha3)}));
              reg15 <= $unsigned(reg13);
              reg16 <= ($unsigned(reg15[(3'h7):(3'h6)]) * {($unsigned($unsigned(reg17)) ?
                      {(reg12 ? wire10 : reg17),
                          (wire9 ? (8'hac) : wire5)} : reg16[(4'he):(4'hc)]),
                  wire8});
            end
          else
            begin
              reg12 <= $signed((8'hbc));
              reg13 <= ((~|(reg14[(4'hb):(4'h8)] <= $signed(wire9))) ?
                  $signed(wire5) : (+$signed(reg16)));
              reg14 <= {$signed(wire6[(3'h5):(3'h5)]), (8'hb8)};
              reg15 <= ((~(+$signed((wire8 || reg12)))) ?
                  (wire8 + $signed(((|wire9) == reg17))) : (reg12 || $unsigned(($signed(reg17) ?
                      $signed((7'h44)) : wire6))));
              reg16 <= wire10[(3'h7):(3'h7)];
            end
        end
      reg19 <= wire10[(3'h4):(1'h1)];
      reg20 <= wire8[(2'h2):(1'h0)];
      reg21 <= {((~^{(~&(7'h44))}) ?
              (~$unsigned($signed((8'ha1)))) : (reg12 << reg13[(5'h14):(4'h9)]))};
      reg22 <= $signed((wire9 ? $unsigned(reg21) : reg20));
    end
  assign wire23 = (reg21 > (8'hae));
endmodule
