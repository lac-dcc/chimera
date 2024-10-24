module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire55;
  assign y = {wire58, wire57, wire5, wire6, wire7, wire8, wire55, (1'h0)};
  assign wire5 = $signed({{{(~|wire0)},
                         ($unsigned(wire3) ?
                             $signed(wire0) : (wire4 ? wire2 : wire3))}});
  assign wire6 = ((8'hb3) != wire4);
  assign wire7 = ((wire4 ?
                     (^wire1[(4'ha):(3'h6)]) : wire3) >>> ((wire1[(5'h11):(4'h8)] ?
                         (|((7'h41) ? wire6 : wire6)) : (~&$unsigned(wire5))) ?
                     wire3[(1'h0):(1'h0)] : ((~&(8'hb6)) ?
                         $signed((^wire0)) : ((wire4 << wire3) + wire4[(3'h6):(2'h2)]))));
  assign wire8 = $signed($signed(({{wire1},
                     $signed(wire1)} <= wire7[(4'hd):(4'hd)])));
  module9 #() modinst56 (wire55, clk, wire8, wire4, wire1, wire6, wire3);
  assign wire57 = (wire2[(4'h8):(3'h5)] ?
                      (wire4 ?
                          (~|wire55[(4'hb):(1'h0)]) : wire2[(1'h1):(1'h1)]) : (wire0[(4'hd):(2'h3)] || ((^~wire6[(1'h1):(1'h1)]) + $signed($signed((8'hb4))))));
  assign wire58 = ((wire8[(4'h8):(4'h8)] <= $unsigned({(wire6 || wire2)})) ^ $signed(wire4));
endmodule

module module9
#(parameter param53 = ((^{(+((8'ha3) ? (8'hb3) : (8'hae)))}) ? (+{({(8'hb0), (8'ha1)} << ((8'had) ? (8'hb9) : (8'ha5)))}) : (8'ha4)), 
parameter param54 = param53)
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire13;
  input wire signed [(3'h5):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  assign y = {wire52, wire50, wire17, wire16, wire15, (1'h0)};
  assign wire15 = $signed(wire14);
  assign wire16 = wire11[(2'h2):(2'h2)];
  assign wire17 = $unsigned($unsigned({wire11[(2'h2):(2'h2)]}));
  module18 #() modinst51 (wire50, clk, wire11, wire15, wire13, wire16);
  assign wire52 = wire10;
endmodule

module module18
#(parameter param49 = ((+((((8'hbf) > (8'hbb)) + ((7'h41) & (8'haf))) != (~|((8'h9d) > (8'ha5))))) ? (!((((8'ha3) ? (8'hbd) : (8'hb6)) ? ((8'ha2) >>> (8'h9f)) : ((8'ha3) ? (8'hb1) : (8'hbf))) ? (((8'ha3) ~^ (7'h41)) ? {(8'hb5)} : ((8'hb8) ~^ (8'hab))) : ((~|(7'h43)) ? ((8'ha0) ? (7'h40) : (8'hb9)) : ((7'h40) > (8'ha3))))) : (~|({(|(7'h44))} <<< (8'haf)))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire [(4'hb):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire24,
                 wire23,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire23 = $unsigned($unsigned(($unsigned({wire19,
                      wire20}) | (|(wire20 && wire20)))));
  assign wire24 = wire19[(4'hf):(4'h9)];
  always
    @(posedge clk) begin
      reg25 <= {wire19[(4'hd):(3'h4)], $signed(wire21[(4'hf):(4'h8)])};
    end
  always
    @(posedge clk) begin
      reg26 <= $signed($signed($unsigned(($unsigned(wire19) ?
          (reg25 > (8'ha5)) : $signed(reg25)))));
      reg27 <= reg25;
      reg28 <= ($signed((~|(wire22 & $unsigned(wire24)))) < (8'hba));
      if ((reg25 != ((~|$unsigned((wire24 ? (8'ha8) : wire23))) ?
          $signed({wire24, reg25}) : $signed($unsigned((wire19 != reg26))))))
        begin
          if (wire19)
            begin
              reg29 <= ((~|reg27) && (^~wire24));
              reg30 <= reg26[(3'h6):(3'h6)];
              reg31 <= (((|({wire21} ?
                  $unsigned(wire24) : (reg26 - reg25))) || {($unsigned(wire22) ?
                      $unsigned(wire20) : (wire19 ~^ reg30)),
                  reg26[(3'h7):(2'h3)]}) == ({({wire22, reg28} ?
                          (reg26 ^ wire22) : {wire24})} ?
                  reg26[(4'hb):(1'h1)] : (^reg28[(3'h5):(1'h1)])));
            end
          else
            begin
              reg29 <= {(|((wire24 * $unsigned(reg30)) == reg28[(1'h1):(1'h0)])),
                  (&(({reg30, reg31} ? (|(8'ha7)) : reg31) == (+(wire24 ?
                      (8'hb3) : wire23))))};
              reg30 <= $unsigned(reg28[(3'h4):(2'h2)]);
            end
          reg32 <= ($unsigned($unsigned(wire19[(4'hd):(2'h2)])) ?
              wire23[(1'h0):(1'h0)] : ($signed(wire23) + $unsigned(($unsigned((8'ha3)) - $signed((8'hab))))));
          reg33 <= $signed(reg32[(1'h1):(1'h0)]);
          if ($signed($unsigned({(~|$unsigned(reg29)), reg33[(4'ha):(3'h4)]})))
            begin
              reg34 <= {(reg27 >> (^~(reg31[(1'h0):(1'h0)] ?
                      (reg28 && reg27) : ((8'hae) ? reg27 : wire21))))};
            end
          else
            begin
              reg34 <= ($signed($signed((|$signed(reg34)))) >> wire24[(4'he):(4'he)]);
              reg35 <= (+$signed($signed(reg31)));
              reg36 <= (^~reg32);
            end
        end
      else
        begin
          reg29 <= reg32;
          reg30 <= reg26[(3'h7):(3'h7)];
          reg31 <= $signed(wire19);
          reg32 <= ((({((8'hbe) ^~ reg25)} ?
                  wire24[(3'h4):(1'h1)] : {$unsigned(wire22),
                      $unsigned(reg35)}) && $unsigned($unsigned($unsigned(wire22)))) ?
              $signed((~$signed(reg31))) : $unsigned((reg26 && wire22[(3'h4):(2'h3)])));
        end
      reg37 <= $unsigned(wire23);
    end
  assign wire38 = (wire23[(2'h2):(1'h0)] || (reg34 ?
                      reg28[(3'h4):(2'h3)] : (8'hb2)));
  assign wire39 = {$signed(wire23)};
  assign wire40 = ((|reg32[(2'h2):(1'h0)]) ?
                      ($unsigned($unsigned($signed(reg33))) + (reg32[(1'h0):(1'h0)] ?
                          reg30 : (reg27[(4'h9):(3'h6)] ?
                              (reg28 > wire21) : ((7'h40) ?
                                  reg36 : reg34)))) : ((((wire19 | wire23) ?
                                  wire21[(5'h10):(3'h7)] : (!wire19)) ?
                              $signed($unsigned(wire38)) : wire22) ?
                          {$unsigned((wire38 <<< reg28))} : reg36));
  assign wire41 = $unsigned(((reg31[(2'h2):(1'h1)] ?
                      (^~$signed((8'hbf))) : (+(wire40 ?
                          reg28 : (8'ha8)))) >>> wire39[(1'h0):(1'h0)]));
  assign wire42 = (^wire40);
  assign wire43 = $signed($unsigned(reg34[(4'hf):(2'h2)]));
  assign wire44 = reg30[(3'h6):(3'h4)];
  assign wire45 = $signed(reg29);
  assign wire46 = wire24[(5'h12):(4'hc)];
  assign wire47 = ($signed(reg33) ?
                      ((~^{$signed(reg36)}) ?
                          wire41 : {wire46[(4'hf):(4'hf)]}) : (8'hac));
  assign wire48 = reg35[(3'h4):(1'h0)];
endmodule
