module top
#(parameter param83 = ((^~({((8'h9f) <= (8'h9e)), ((8'hb0) ? (8'hbc) : (8'hbb))} ? (+((8'hbe) ? (7'h42) : (8'ha5))) : (((8'h9e) ? (8'hb3) : (8'hbf)) <<< ((8'h9f) ? (8'hb4) : (8'ha6))))) == ((^~(((8'hb6) ? (8'hac) : (8'hac)) ? ((8'h9f) <<< (8'ha0)) : {(8'ha3), (8'ha8)})) ^~ {({(8'h9e)} ? {(8'haf)} : (^~(8'h9e)))})), 
parameter param84 = ((&param83) + param83))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  assign y = {wire82,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire56,
                 wire20,
                 wire19,
                 wire17,
                 wire5,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire5 = {{wire2}};
  module6 #() modinst18 (.wire10(wire1), .y(wire17), .clk(clk), .wire9(wire3), .wire7(wire4), .wire8(wire0));
  assign wire19 = wire17[(4'ha):(3'h4)];
  assign wire20 = ({$signed(({wire2} ?
                          wire5[(5'h10):(2'h2)] : wire19[(1'h0):(1'h0)]))} || $signed($signed((wire4 ?
                      (wire1 <= wire1) : $signed(wire4)))));
  module21 #() modinst57 (.wire23(wire4), .wire24(wire20), .wire25(wire2), .wire22(wire0), .y(wire56), .clk(clk));
  always
    @(posedge clk) begin
      reg58 <= (((!(8'ha2)) ?
              wire4 : ($unsigned($signed((8'ha8))) ?
                  (~$signed(wire1)) : $unsigned(((8'hb1) < (8'ha7))))) ?
          ((^{$unsigned(wire4)}) - (wire17 ?
              {(wire0 ? wire17 : wire20)} : wire4)) : wire19);
      if (($signed($unsigned((-$signed(wire3)))) ?
          $signed(({wire1, (^wire1)} ^ (8'h9c))) : (~|$signed((|(8'had))))))
        begin
          if (wire4)
            begin
              reg59 <= $unsigned(({$signed($unsigned(reg58)),
                  (!(wire17 << wire20))} >= (-$unsigned($signed(wire56)))));
              reg60 <= (7'h44);
              reg61 <= (^{$signed($signed({wire5})),
                  $unsigned((wire17 ? $unsigned(wire0) : (reg58 && (8'hbc))))});
            end
          else
            begin
              reg59 <= ($signed(($unsigned($signed((8'ha9))) ?
                  wire56[(4'h9):(4'h9)] : $signed((|wire1)))) << ($unsigned({(~^wire5)}) > ($unsigned((wire3 ?
                      reg60 : reg61)) ?
                  ((reg61 ? wire5 : reg61) && (wire1 ?
                      (8'hae) : wire3)) : ({wire19, wire0} >>> wire4))));
            end
          if ((|($unsigned(wire20) | (~&wire5[(4'hd):(3'h5)]))))
            begin
              reg62 <= reg59;
              reg63 <= (&$signed((^$signed($signed((8'hbb))))));
              reg64 <= (wire2[(5'h13):(4'hd)] != wire1[(3'h4):(2'h3)]);
              reg65 <= (!{($signed(((8'ha4) ~^ wire3)) ?
                      $signed({wire1}) : (-wire5))});
            end
          else
            begin
              reg62 <= {reg59};
            end
          reg66 <= wire2[(3'h6):(3'h5)];
          reg67 <= $unsigned(((~&((~^wire4) * reg63[(3'h5):(2'h2)])) << reg63[(4'h8):(4'h8)]));
        end
      else
        begin
          reg59 <= {reg60[(2'h2):(1'h0)],
              (wire0[(4'he):(1'h0)] >> {$unsigned(wire19)})};
        end
      reg68 <= reg67;
      reg69 <= $unsigned($unsigned(wire4));
    end
  assign wire70 = reg64[(4'h9):(4'h9)];
  assign wire71 = ($signed($signed((reg68[(2'h3):(2'h3)] || wire70[(3'h6):(1'h1)]))) ?
                      (reg65[(1'h0):(1'h0)] ?
                          $unsigned(reg68[(4'h8):(3'h5)]) : $signed($unsigned((wire1 ?
                              (8'hb5) : wire0)))) : ((((~&(7'h40)) * wire3[(3'h6):(3'h6)]) ?
                              (8'hac) : reg68[(2'h3):(2'h2)]) ?
                          {(reg58 ? $unsigned(reg65) : ((8'haf) ~^ wire19)),
                              (~|(wire17 ?
                                  reg60 : (8'hbd)))} : ((&(reg63 != wire4)) < ((-reg66) <= (wire5 ?
                              wire19 : reg58)))));
  assign wire72 = reg62;
  assign wire73 = wire17;
  assign wire74 = $signed($signed({($signed(wire17) != (^reg61)),
                      {(reg58 == reg62)}}));
  assign wire75 = $unsigned(((($unsigned(reg66) ~^ {reg58,
                      wire3}) && $unsigned(reg63[(2'h3):(1'h1)])) > ($signed($unsigned((8'ha9))) || $signed((wire72 || wire20)))));
  always
    @(posedge clk) begin
      if ({(~^({wire19} ?
              {(reg66 <<< wire72), wire17[(2'h3):(2'h2)]} : wire72)),
          {$signed($signed((wire1 >>> wire73))), {$unsigned(reg58)}}})
        begin
          reg76 <= (wire71[(5'h13):(1'h1)] ?
              $signed(($signed($signed(wire56)) ?
                  $signed((+wire19)) : $unsigned((reg60 && reg67)))) : $signed((~wire71)));
          reg77 <= $signed(reg60);
          if ((wire4[(3'h6):(2'h3)] ?
              $unsigned(reg60[(3'h5):(2'h3)]) : $signed(reg61)))
            begin
              reg78 <= {(~|(($unsigned(wire19) > (^~wire5)) ^ $unsigned((wire5 && reg61)))),
                  ({({wire19, reg61} | $unsigned(wire72)),
                      wire2} == ((~^$unsigned(reg65)) ^~ ($unsigned(reg69) ?
                      (reg64 & reg59) : (wire4 | reg58))))};
            end
          else
            begin
              reg78 <= $unsigned(wire17);
              reg79 <= reg58[(4'h9):(3'h6)];
              reg80 <= reg66[(3'h4):(1'h0)];
              reg81 <= {wire20[(4'hf):(3'h7)]};
            end
        end
      else
        begin
          reg76 <= $unsigned(((((~&reg58) ?
              {wire4} : reg81) & (+((8'hb4) >>> reg64))) <<< ((8'h9c) ^ reg68[(1'h1):(1'h0)])));
        end
    end
  assign wire82 = {$unsigned($unsigned($signed($unsigned((8'hb8)))))};
endmodule

module module21
#(parameter param54 = ((((^((8'haf) ? (8'h9c) : (8'hba))) ? ({(8'hb0), (8'h9c)} ? ((8'hb5) == (8'h9c)) : ((8'hb0) ? (8'ha4) : (7'h40))) : ((8'h9c) > {(8'hbd), (8'hb8)})) - {({(7'h44)} ? ((8'had) ^ (8'haf)) : (~|(8'haa))), (-((8'hbe) ? (7'h44) : (8'ha4)))}) ? {((((8'haa) ? (8'hb1) : (8'ha7)) ? {(8'hb4)} : {(8'ha8), (8'hbe)}) ? (+((8'hbf) & (8'hbd))) : (((8'h9c) ? (8'ha4) : (8'hbc)) ? (|(8'hac)) : (8'hb3)))} : (~|(({(8'hb4), (8'h9e)} ? (^~(8'hbc)) : ((8'hb7) << (8'hb0))) ? (((8'hb5) ^ (8'hae)) - ((8'ha7) ? (8'haf) : (8'h9e))) : (&(~^(8'hbd)))))), 
parameter param55 = ((param54 ? (&((param54 << param54) ? (param54 ? (8'hb6) : param54) : (&(8'hb4)))) : param54) + (^~param54)))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(4'he):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire27,
                 wire26,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire26 = $signed(($signed(wire23) * (8'haa)));
  assign wire27 = wire26;
  always
    @(posedge clk) begin
      reg28 <= wire23;
      reg29 <= (((~$signed((~^reg28))) ?
              (!(8'hb0)) : (~^((wire27 ?
                  wire23 : wire24) > (wire24 || wire25)))) ?
          (wire23 ?
              ((~|(reg28 && wire25)) ?
                  $unsigned($signed(wire22)) : wire27[(1'h1):(1'h0)]) : reg28[(3'h6):(3'h4)]) : $signed((($unsigned(wire25) - wire25[(2'h3):(1'h0)]) && $unsigned(wire22[(2'h3):(2'h2)]))));
      reg30 <= (wire24[(2'h3):(1'h0)] ?
          (($signed((wire25 || wire22)) ?
                  wire23[(3'h6):(2'h3)] : ({(8'ha6)} >> wire25)) ?
              $unsigned((wire27 >>> (wire23 | reg28))) : ($unsigned(wire26[(3'h4):(2'h2)]) ?
                  wire24[(2'h3):(2'h2)] : (-wire25))) : wire26[(1'h1):(1'h1)]);
      reg31 <= ($signed({(reg28[(3'h5):(1'h0)] <<< (wire26 < wire24)),
          wire24}) || (wire25 ?
          wire26 : (((|(8'ha0)) ? wire24 : reg28) ?
              (8'haf) : $signed(((8'hab) && reg28)))));
    end
  assign wire32 = $unsigned(wire25[(2'h3):(2'h2)]);
  assign wire33 = ($signed($signed($signed(wire24[(1'h1):(1'h1)]))) ?
                      $unsigned(wire23[(2'h2):(1'h1)]) : ((^$signed(wire27)) < $signed(((|reg31) ?
                          (wire26 < wire23) : (^~wire27)))));
  assign wire34 = $signed($unsigned(($unsigned((reg31 <<< wire25)) ?
                      ({wire24, wire33} ?
                          (wire26 - (7'h42)) : $signed(wire25)) : $signed($signed(wire22)))));
  assign wire35 = wire24[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg36 <= wire24[(2'h2):(1'h1)];
      if (($unsigned(reg31[(1'h0):(1'h0)]) ?
          ($signed((~(+wire24))) * wire27) : {{$unsigned((wire25 <= reg31))}}))
        begin
          reg37 <= $unsigned($signed(reg31[(1'h0):(1'h0)]));
          reg38 <= reg37;
          reg39 <= $signed(wire24[(2'h3):(1'h1)]);
          reg40 <= reg37;
          if (((^~$signed((8'ha7))) ~^ {reg29}))
            begin
              reg41 <= ((reg38[(3'h4):(1'h1)] >= (reg40 ?
                  wire24[(2'h3):(2'h3)] : (|(8'ha0)))) <<< (~&$signed($signed((+reg40)))));
              reg42 <= $unsigned(((&{$unsigned(wire27), $signed(wire26)}) ?
                  $signed({$unsigned((8'hbd)),
                      $signed(reg40)}) : reg29[(3'h5):(2'h3)]));
            end
          else
            begin
              reg41 <= (reg37[(2'h2):(2'h2)] | (($signed(reg30[(4'h8):(4'h8)]) ?
                  {wire27} : $signed(wire26[(2'h2):(1'h1)])) == $unsigned($unsigned($signed((8'hb8))))));
              reg42 <= $signed(wire32[(5'h13):(3'h5)]);
            end
        end
      else
        begin
          reg37 <= $unsigned($signed(($signed(reg38[(3'h7):(2'h2)]) ?
              $signed(reg39[(4'hd):(4'ha)]) : (&wire26))));
          reg38 <= wire34[(4'h8):(1'h0)];
          reg39 <= {(($signed(reg39[(5'h12):(4'h8)]) - $unsigned($signed(reg40))) || (8'hba)),
              (($unsigned({wire23, reg37}) ? wire26 : wire34) ?
                  wire22[(3'h7):(1'h0)] : wire25)};
        end
      if ((~wire35))
        begin
          reg43 <= $signed($unsigned($unsigned(reg31[(1'h1):(1'h1)])));
          reg44 <= reg29;
        end
      else
        begin
          if (wire25[(1'h0):(1'h0)])
            begin
              reg43 <= $signed((8'ha1));
              reg44 <= ({{wire27,
                          ($signed((7'h42)) ?
                              (wire33 <<< wire33) : $unsigned((7'h40)))},
                      $unsigned((~|wire32[(5'h14):(4'he)]))} ?
                  (!(+(reg44[(1'h1):(1'h1)] << (|reg40)))) : ($unsigned($unsigned($signed((7'h40)))) ?
                      $signed($unsigned($unsigned(reg42))) : $signed($unsigned((~&wire22)))));
              reg45 <= $signed(wire22);
            end
          else
            begin
              reg43 <= $signed(wire27);
              reg44 <= wire27[(4'he):(3'h7)];
              reg45 <= reg37;
              reg46 <= reg36[(2'h2):(2'h2)];
              reg47 <= wire33;
            end
          reg48 <= (&(reg41 <= $unsigned((^$unsigned(wire33)))));
          reg49 <= (+reg40);
          reg50 <= $unsigned(reg31[(2'h2):(1'h1)]);
          if ((+$signed($unsigned(reg30))))
            begin
              reg51 <= wire32;
              reg52 <= reg47[(1'h1):(1'h1)];
            end
          else
            begin
              reg51 <= $unsigned((($unsigned(reg49) >= (((8'haf) ?
                  reg31 : wire23) <<< $unsigned(reg52))) + $signed($unsigned(wire27[(2'h2):(2'h2)]))));
              reg52 <= (-reg36);
              reg53 <= ((~$signed(wire34[(4'h8):(1'h1)])) < ($unsigned($unsigned(reg30)) ?
                  reg31[(1'h0):(1'h0)] : reg39[(4'hd):(3'h5)]));
            end
        end
    end
endmodule

module module6
#(parameter param16 = (!((^~(((8'hb6) ? (8'haf) : (8'hbd)) == (~^(8'hb8)))) ? (~(((7'h43) == (8'hb7)) ^~ ((7'h42) >>> (8'hbb)))) : (~&((~^(8'ha8)) ? ((8'hb4) + (8'h9d)) : ((8'h9f) * (7'h42)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  assign y = {wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = (8'hb0);
  assign wire12 = $signed({wire9[(1'h0):(1'h0)],
                      ({(~wire9)} != {wire7, $signed(wire10)})});
  assign wire13 = wire9;
  assign wire14 = $signed(wire10);
  assign wire15 = $signed($unsigned($signed((+wire7))));
endmodule
