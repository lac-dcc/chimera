module top
#(parameter param85 = (((({(8'hb7), (8'hb1)} || ((8'ha5) || (8'hb5))) >> {(~|(8'hbd)), {(8'ha0)}}) ^ ({(~^(8'ha6)), ((7'h40) == (7'h42))} ? (((8'hbb) ? (8'hb4) : (8'ha6)) && (7'h40)) : (~|{(7'h40), (8'hba)}))) >> ({{(-(8'hb2))}} ? ((~|(8'hb3)) ^ {((8'ha3) ? (7'h41) : (7'h41)), {(8'hbf), (8'haa)}}) : ((^{(8'hba), (8'hb7)}) ~^ (((8'hac) ? (8'hb4) : (8'h9d)) ? {(8'hb1)} : (8'h9f))))), 
parameter param86 = param85)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire5;
  assign y = {wire84, wire83, wire81, wire5, (1'h0)};
  assign wire5 = (wire3[(3'h4):(1'h0)] || $signed(wire2[(4'hd):(3'h6)]));
  module6 #() modinst82 (.y(wire81), .wire10(wire1), .wire7(wire2), .wire9(wire3), .wire8(wire4), .clk(clk));
  assign wire83 = {$unsigned(wire3[(4'ha):(1'h0)])};
  assign wire84 = wire4;
endmodule

module module6
#(parameter param79 = ((8'hba) <<< ((^(((8'haf) ? (7'h40) : (8'hbc)) ? (~^(8'hb6)) : ((8'hbc) ^~ (8'hbf)))) ^~ (~|(((8'h9d) << (8'h9d)) ? ((8'hb7) << (8'ha4)) : (~^(8'ha9)))))), 
parameter param80 = (param79 ? {{param79}} : {((param79 ? {param79, param79} : (~|param79)) ? {(|param79)} : (-((8'hb9) ^ param79))), ((^{(8'had)}) + (((8'had) ? param79 : param79) ? ((8'ha3) ? param79 : (8'hab)) : (!param79)))}))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire51;
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  assign y = {wire78,
                 wire75,
                 wire72,
                 wire70,
                 wire53,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire30,
                 wire51,
                 reg77,
                 reg76,
                 reg74,
                 reg73,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire11 = wire9;
  assign wire12 = $signed(((7'h41) ?
                      ((^~(wire10 > wire8)) ? wire11 : wire10) : {{wire7,
                              wire9[(3'h4):(2'h3)]},
                          (((8'ha0) > wire9) << $signed(wire7))}));
  assign wire13 = (((|$unsigned($signed(wire9))) <= (^wire12[(2'h3):(2'h3)])) >= {wire10[(2'h2):(2'h2)]});
  assign wire14 = {{($unsigned((~&wire11)) ?
                              wire9[(3'h4):(1'h0)] : $unsigned((wire13 ?
                                  wire11 : wire9))),
                          {((wire11 ?
                                  wire13 : (8'hb6)) <<< wire13[(4'hf):(4'h8)]),
                              ((wire13 ? wire8 : (8'hbc)) ?
                                  (wire8 ?
                                      wire9 : wire9) : $unsigned(wire8))}}};
  assign wire15 = (^~{$signed($unsigned({(8'ha7)})),
                      (wire12[(1'h1):(1'h0)] >> (wire9 ?
                          wire10[(2'h3):(1'h0)] : wire12))});
  assign wire16 = $signed($unsigned($unsigned($unsigned((wire13 >> wire13)))));
  assign wire17 = (8'ha9);
  assign wire18 = $signed($signed(((~&$unsigned(wire11)) ?
                      (8'hb8) : (~^(wire11 ? (8'hbf) : wire16)))));
  assign wire19 = (|{(wire9[(1'h0):(1'h0)] != $signed($unsigned(wire14))),
                      (+$signed($signed(wire13)))});
  always
    @(posedge clk) begin
      if ({(~|(~(^$unsigned(wire9)))), $unsigned(wire12[(2'h2):(1'h0)])})
        begin
          reg20 <= $signed((|wire18));
          if (wire11[(4'hf):(4'hf)])
            begin
              reg21 <= ({(~$unsigned(wire7[(3'h4):(1'h1)])),
                      wire7[(1'h0):(1'h0)]} ?
                  wire18 : wire15);
              reg22 <= (wire11[(3'h6):(3'h5)] ?
                  wire12[(2'h3):(2'h2)] : (8'ha3));
            end
          else
            begin
              reg21 <= (wire13[(4'h9):(3'h7)] << ((-(+$signed(wire7))) > $signed({$unsigned(wire7),
                  $unsigned(wire15)})));
              reg22 <= ({$unsigned(((wire10 == reg22) + $signed(wire7)))} ?
                  (reg22 ?
                      ((8'ha2) ?
                          $unsigned((&wire18)) : wire13[(4'ha):(4'ha)]) : wire9) : (&((~&(+wire15)) != $unsigned((reg22 ?
                      wire8 : wire8)))));
              reg23 <= $signed({reg22[(4'he):(4'hb)],
                  (wire14[(4'hb):(4'h9)] - reg20[(3'h5):(2'h3)])});
              reg24 <= (+((~$unsigned((8'haa))) + ((wire12[(1'h1):(1'h1)] ?
                      (8'h9d) : {wire12, reg23}) ?
                  ((wire12 < wire9) || $unsigned(reg22)) : reg21)));
              reg25 <= wire10[(2'h3):(2'h2)];
            end
          reg26 <= (wire16[(5'h11):(3'h5)] >> wire8);
          reg27 <= wire18;
        end
      else
        begin
          reg20 <= (($signed((^~(!wire16))) | wire13) ?
              {wire14[(2'h3):(2'h2)]} : $unsigned(($signed(wire12) > (8'ha1))));
          reg21 <= (~|(+(-(reg20 >>> (wire10 <<< reg26)))));
          if ($unsigned(wire18))
            begin
              reg22 <= {(~^$signed($unsigned(((7'h43) ? (8'had) : wire8))))};
            end
          else
            begin
              reg22 <= reg24;
              reg23 <= ($signed(wire12[(1'h0):(1'h0)]) ?
                  ((reg24 > (+{wire14, wire11})) ?
                      wire17[(4'h9):(3'h7)] : $unsigned($signed($signed(wire11)))) : (wire9[(1'h1):(1'h1)] ?
                      (^$unsigned(wire8[(1'h1):(1'h0)])) : (8'had)));
              reg24 <= (~^{$unsigned({(-wire8), (reg20 ^ wire9)})});
            end
          reg25 <= (!(-wire14));
        end
      reg28 <= {(8'ha6)};
      reg29 <= $signed((reg25 * $signed($unsigned(wire16))));
    end
  assign wire30 = (reg21 | (|($signed((wire14 ^ reg23)) <= {(^(8'hbf)),
                      {reg27, reg23}})));
  module31 #() modinst52 (wire51, clk, wire17, reg28, wire13, wire7);
  assign wire53 = {{(($unsigned(reg21) <= $signed(reg29)) && ((&wire8) ~^ reg26))},
                      ($unsigned($unsigned((~|wire19))) ?
                          $unsigned(wire30) : $signed($unsigned($signed((8'hae)))))};
  module54 #() modinst71 (.wire58(reg22), .wire56(reg24), .clk(clk), .y(wire70), .wire57(reg23), .wire59(wire53), .wire55(wire10));
  assign wire72 = (8'hb1);
  always
    @(posedge clk) begin
      reg73 <= reg23[(5'h12):(5'h11)];
      reg74 <= $unsigned((|(+(((8'hb8) ? (8'hb8) : wire18) ?
          (wire72 ? (8'ha1) : (8'hb2)) : reg26))));
    end
  assign wire75 = reg27;
  always
    @(posedge clk) begin
      reg76 <= $signed({wire13[(4'ha):(4'h9)]});
      reg77 <= reg28[(3'h4):(3'h4)];
    end
  assign wire78 = wire51[(1'h1):(1'h1)];
endmodule

module module54
#(parameter param68 = ({({(+(8'h9d))} ? {((8'hb8) ? (8'h9c) : (8'hba)), ((8'ha8) >>> (8'hb2))} : (((8'hb6) + (7'h44)) < ((8'hbb) | (8'hb3)))), (8'hba)} ^ (((8'ha1) == {(&(8'hb5))}) ? {((8'ha1) <<< (~(7'h40))), ((~(8'hb1)) ? {(8'hae)} : {(8'hab)})} : ((-(|(7'h43))) + ((^~(8'ha0)) ~^ (~&(8'hb2)))))), 
parameter param69 = {{param68, ((((8'ha2) < param68) ? (param68 || param68) : (~param68)) ? {param68, {param68, param68}} : {param68, ((8'ha6) ~^ param68)})}})
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire59;
  input wire [(4'hf):(1'h0)] wire58;
  input wire signed [(4'ha):(1'h0)] wire57;
  input wire signed [(4'h9):(1'h0)] wire56;
  input wire [(2'h3):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire60 = {(wire57 <= ((|$signed(wire55)) ?
                          $unsigned(wire55) : ($signed(wire57) ?
                              {wire57} : (wire58 ? wire56 : wire56)))),
                      $unsigned((wire56[(1'h0):(1'h0)] + ($unsigned(wire57) ^ (wire58 ?
                          wire58 : (7'h42)))))};
  assign wire61 = {$unsigned((~^(wire57[(3'h6):(2'h3)] >> (wire56 < wire60)))),
                      (^$signed(wire56[(2'h2):(2'h2)]))};
  assign wire62 = (wire58 ?
                      wire61 : (~^($unsigned($unsigned((8'ha6))) <<< wire55)));
  assign wire63 = $signed((wire58[(4'h9):(1'h1)] <<< (wire55 ?
                      $signed(wire59[(2'h2):(2'h2)]) : wire58[(4'h8):(1'h1)])));
  always
    @(posedge clk) begin
      if ((wire60[(4'ha):(3'h5)] ?
          (((wire63[(2'h3):(2'h3)] >>> $unsigned(wire63)) < (wire59[(2'h2):(2'h2)] ?
              $unsigned(wire55) : (wire62 ?
                  (8'ha6) : wire62))) == wire57) : {(wire60[(4'he):(2'h3)] >> $signed((wire63 ?
                  wire62 : (7'h42))))}))
        begin
          reg64 <= ((($signed((-wire63)) ?
                  wire61[(3'h4):(2'h2)] : (wire57[(3'h6):(3'h4)] ?
                      wire57[(1'h1):(1'h0)] : (wire58 ?
                          wire60 : wire59))) << $unsigned({$unsigned(wire58)})) ?
              wire58[(4'h8):(3'h5)] : (wire59 ?
                  $unsigned(wire56) : ($unsigned((~^wire63)) ?
                      ($unsigned(wire61) ?
                          $signed(wire56) : $unsigned(wire58)) : $unsigned($unsigned((8'ha6))))));
          reg65 <= $unsigned({(((reg64 ^~ (8'hbc)) ^~ (^wire59)) * wire60),
              ($signed((!wire56)) ? wire59 : ((~&wire59) * (~wire59)))});
          reg66 <= (wire63[(4'he):(4'he)] ?
              $signed({$signed((wire59 ? wire63 : wire55)),
                  $signed({wire57})}) : (-$unsigned((~|$unsigned(reg65)))));
        end
      else
        begin
          reg64 <= (reg65 ?
              $unsigned({($unsigned(wire58) != (-wire58))}) : ($signed($unsigned(wire55)) >> (wire59[(1'h1):(1'h1)] ?
                  wire61[(5'h15):(4'ha)] : {(wire57 ^~ wire56),
                      ((8'h9e) ? wire59 : wire57)})));
          reg65 <= ((wire62[(2'h3):(2'h3)] * ({((8'haf) ? wire60 : reg66),
                      wire61[(1'h0):(1'h0)]} ?
                  $unsigned((~|wire58)) : $signed((wire62 ? reg66 : reg66)))) ?
              wire63[(1'h0):(1'h0)] : $unsigned(reg64[(2'h3):(1'h0)]));
          reg66 <= (wire57 ?
              (({(8'hb0)} ?
                  (wire63 ?
                      reg65 : wire58) : (reg66 <= $unsigned(wire55))) + $signed($signed({wire59,
                  wire59}))) : {(wire56[(2'h3):(1'h1)] ?
                      (wire57 && reg66[(4'ha):(3'h4)]) : wire56)});
        end
      reg67 <= ((($unsigned($unsigned(wire55)) ?
              $signed(wire60[(4'hc):(3'h4)]) : wire57) ?
          (~|{$unsigned(reg66)}) : (wire63[(3'h4):(1'h0)] ~^ (^$unsigned(reg65)))) >= $signed(wire63[(4'hc):(3'h4)]));
    end
endmodule

module module31
#(parameter param50 = ((~|(((^(8'hb5)) ? ((8'hbf) ? (8'h9d) : (8'ha6)) : (~|(8'ha1))) ? (8'haa) : ({(8'h9c)} ? ((8'hb7) ? (8'hbc) : (8'ha0)) : (+(8'h9e))))) & (((((7'h40) ? (8'ha5) : (8'hb9)) && (~&(8'ha1))) ? (((8'hba) <= (7'h42)) ? ((8'hae) ? (8'h9f) : (8'h9e)) : ((8'ha7) && (8'hae))) : (&{(8'h9f)})) <<< ((~^{(8'had)}) ? (((8'ha0) + (8'hae)) == ((7'h40) ? (8'hb0) : (8'hb4))) : ((8'ha7) ? ((8'hb6) >>> (8'hba)) : ((8'ha1) ~^ (8'ha2)))))))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire35;
  input wire [(4'hf):(1'h0)] wire34;
  input wire signed [(5'h11):(1'h0)] wire33;
  input wire [(5'h12):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire33[(3'h6):(1'h0)]))
        begin
          if (($signed(wire33[(4'ha):(1'h0)]) && (wire35[(3'h4):(1'h0)] ?
              {$unsigned(wire35),
                  $signed(wire34[(2'h2):(2'h2)])} : $unsigned($unsigned((wire35 ?
                  wire35 : wire33))))))
            begin
              reg36 <= $unsigned($signed((wire34[(4'hd):(3'h7)] ?
                  wire32 : (^~(wire33 << wire33)))));
              reg37 <= ($unsigned($signed((|(^~wire32)))) + (($unsigned((!wire33)) ?
                  $signed($unsigned(wire32)) : ($unsigned(wire32) ?
                      wire34 : (&wire32))) == ($unsigned($unsigned((8'hb5))) ?
                  (((8'ha7) ~^ wire35) * {wire35}) : $signed((reg36 << reg36)))));
              reg38 <= reg36[(4'ha):(3'h5)];
              reg39 <= $unsigned(wire34);
              reg40 <= (+reg39[(4'hc):(4'hb)]);
            end
          else
            begin
              reg36 <= ($unsigned($signed($unsigned((reg38 <= wire34)))) < wire34[(1'h0):(1'h0)]);
              reg37 <= (reg38[(3'h6):(3'h4)] << $signed($signed($unsigned(reg39[(3'h5):(1'h1)]))));
              reg38 <= (!$signed(reg36));
              reg39 <= wire35[(1'h1):(1'h1)];
            end
          reg41 <= $unsigned($signed($unsigned((((8'hbd) ?
              reg40 : (7'h42)) * $signed(wire35)))));
          reg42 <= ((^($signed((reg38 << wire34)) ?
                  reg41 : ($signed(reg38) > {reg40, reg39}))) ?
              $signed((8'hb5)) : $signed((wire33 + wire34)));
        end
      else
        begin
          reg36 <= ((reg42 | wire35) ?
              $signed((+((^reg37) ?
                  (8'h9d) : (reg36 ^~ reg36)))) : $unsigned((((reg40 >= reg36) ?
                      (^~reg39) : {reg39, reg41}) ?
                  (~&wire33) : {reg42[(3'h4):(2'h3)]})));
          reg37 <= (+{$unsigned(($signed((8'hae)) ^~ $unsigned(wire33))),
              $unsigned($signed((~^wire34)))});
          reg38 <= $signed($unsigned((~|((~^wire35) ?
              (reg38 ? reg37 : wire34) : (reg38 || reg38)))));
        end
      reg43 <= {reg38, reg39};
    end
  assign wire44 = reg43[(1'h1):(1'h1)];
  assign wire45 = $unsigned(reg39);
  assign wire46 = reg39;
  assign wire47 = reg43;
  assign wire48 = {wire45[(4'h9):(3'h6)], (|wire47[(4'ha):(4'h8)])};
  assign wire49 = $unsigned((~|$unsigned(($unsigned(reg40) ?
                      $unsigned(reg39) : {(8'hbe), wire32}))));
endmodule
