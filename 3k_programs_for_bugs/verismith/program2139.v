module top
#(parameter param92 = (8'hb6), 
parameter param93 = {(param92 > (param92 + ((param92 ? (8'ha5) : param92) ? (^param92) : (param92 & param92))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire7,
                 wire6,
                 reg4,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($unsigned(wire3[(2'h2):(1'h0)]) ?
          ((+wire0) ?
              wire3[(1'h1):(1'h1)] : (((wire3 ? wire3 : (8'hbf)) ?
                      $unsigned(wire1) : (wire0 <<< wire0)) ?
                  wire1 : (+$unsigned(wire1)))) : $signed((($signed(wire0) ?
                  (!wire3) : wire0[(1'h1):(1'h1)]) ?
              $unsigned($signed(wire3)) : $signed(wire0[(4'ha):(4'ha)]))));
      reg5 <= wire3[(3'h6):(3'h4)];
    end
  assign wire6 = (~((wire0 ? $signed(wire2) : (+(reg4 ? wire3 : (8'hb7)))) ?
                     $signed(reg4) : reg5[(2'h3):(2'h3)]));
  assign wire7 = ((-$signed($unsigned(wire2[(4'hc):(1'h0)]))) <<< reg4[(5'h11):(4'ha)]);
  module8 #() modinst84 (.y(wire83), .wire9(wire1), .wire11(wire7), .clk(clk), .wire12(wire0), .wire13(reg4), .wire10(wire6));
  assign wire85 = ((~&(((wire0 & wire7) ?
                          {wire1,
                              wire1} : $unsigned((7'h44))) - ((wire1 <= (8'had)) << (~&wire2)))) ?
                      wire2[(4'hb):(4'h9)] : $unsigned((^$unsigned(wire1))));
  assign wire86 = reg5;
  assign wire87 = (((&wire83[(3'h7):(1'h1)]) >> (~&$unsigned((wire83 > wire85)))) >= wire2[(4'he):(4'hb)]);
  assign wire88 = ((|$signed((&{(8'h9e)}))) * wire3[(3'h4):(1'h1)]);
  assign wire89 = $unsigned((^wire2));
  assign wire90 = {(^~(reg4 ? (!(wire6 > wire1)) : reg4[(4'h8):(3'h6)])),
                      wire83[(1'h0):(1'h0)]};
  assign wire91 = $signed(wire89);
endmodule

module module8
#(parameter param81 = ((((((8'hab) ? (8'ha3) : (7'h43)) * {(8'hab), (8'ha2)}) ? ((8'hb6) ? ((7'h43) * (8'haa)) : {(8'h9c), (8'h9e)}) : (-((8'hb8) ? (8'hb4) : (8'hba)))) ~^ ((~|((8'hbe) ? (8'hae) : (8'ha6))) * {((8'hac) ? (8'ha9) : (8'hb0))})) ? (((~&(^(8'hb6))) & (8'hb5)) ? (({(8'ha9), (8'hae)} ? (8'hbe) : {(8'haa), (8'hbf)}) < ((!(8'hbe)) ? {(8'haa), (8'ha6)} : {(8'hb5)})) : ((|(|(8'hb0))) ? (^((8'hb9) == (8'hb7))) : {((8'hbc) | (8'hba))})) : ((((~|(8'h9d)) ? ((8'h9e) >= (8'hba)) : (8'ha0)) + {((8'h9d) ? (8'hb7) : (8'ha0))}) != ((((8'hb0) ? (8'h9f) : (8'ha4)) + {(8'haa), (8'ha6)}) ? (((8'haa) ? (8'hab) : (8'hbe)) & ((8'ha6) != (8'hae))) : (~&((8'hbb) ? (8'hbe) : (8'haa)))))), 
parameter param82 = (param81 & param81))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  assign y = {wire60,
                 wire15,
                 wire14,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire14 = wire11[(4'hd):(3'h5)];
  assign wire15 = $signed(($unsigned($signed(wire11[(2'h2):(1'h1)])) ~^ wire10[(3'h6):(2'h3)]));
  module16 #() modinst61 (.wire17(wire14), .wire18(wire15), .wire19(wire10), .y(wire60), .wire20(wire11), .clk(clk));
  always
    @(posedge clk) begin
      reg62 <= $unsigned((|$signed(((|wire14) ?
          $signed(wire15) : (wire12 || (8'haf))))));
      reg63 <= ((|wire14) >> $unsigned($unsigned(((^wire15) ?
          (wire13 ? wire9 : wire11) : (reg62 > wire15)))));
      if ($signed((-$signed($signed((wire11 ? wire9 : wire60))))))
        begin
          if ((|$unsigned(wire11)))
            begin
              reg64 <= (~&wire12);
            end
          else
            begin
              reg64 <= ({$signed(((!(8'ha1)) ?
                          (wire14 & wire14) : wire60[(3'h5):(2'h3)]))} ?
                  $unsigned($signed(wire11[(5'h12):(5'h11)])) : wire10[(4'hf):(2'h3)]);
              reg65 <= $signed((((~&(wire9 ? wire15 : wire9)) <= ((8'hba) ?
                  reg63[(4'h9):(3'h5)] : wire13)) != $unsigned($unsigned($unsigned(wire14)))));
              reg66 <= $signed(($unsigned(($unsigned((8'hb8)) ?
                  $signed(wire14) : wire12)) < reg62));
              reg67 <= reg65;
              reg68 <= (~^($signed((!wire10[(4'hb):(3'h7)])) ?
                  (&{{reg67, wire11},
                      $signed(wire12)}) : {(&(reg62 >= (8'hbc))), reg65}));
            end
        end
      else
        begin
          reg64 <= ((wire9[(1'h1):(1'h1)] ?
              $unsigned((((7'h41) != wire13) ?
                  wire14 : (reg67 << reg66))) : $unsigned(wire13[(1'h0):(1'h0)])) * {reg65[(3'h5):(3'h5)],
              ({wire12} ? $unsigned(wire13) : (~&$unsigned(wire9)))});
          if ({$signed($signed(((wire15 | wire9) ^ wire15)))})
            begin
              reg65 <= reg66[(1'h1):(1'h0)];
              reg66 <= $unsigned($signed(wire13));
              reg67 <= $signed(($unsigned(reg63) * reg68));
              reg68 <= (-($signed(reg66) ?
                  $signed($unsigned((reg66 ?
                      (8'hab) : wire9))) : (~&$signed(((8'ha1) ?
                      reg65 : reg66)))));
              reg69 <= reg63[(4'ha):(3'h4)];
            end
          else
            begin
              reg65 <= ((wire9 - wire9) > wire14);
              reg66 <= ($signed((~^$signed($unsigned(reg64)))) ?
                  $signed($unsigned($signed((&(8'hb6))))) : {wire11});
              reg67 <= wire13;
            end
          reg70 <= reg68;
        end
      reg71 <= wire10[(3'h5):(3'h5)];
      if (reg70)
        begin
          if (($signed((|reg65[(2'h3):(1'h1)])) ?
              reg68[(1'h1):(1'h1)] : reg62[(1'h0):(1'h0)]))
            begin
              reg72 <= $unsigned((~^(+reg66)));
              reg73 <= $unsigned((-(-(~&{wire13, wire12}))));
              reg74 <= (^~$unsigned(($signed((wire10 ? reg70 : reg62)) ?
                  reg68[(2'h2):(1'h1)] : $signed($unsigned((8'h9f))))));
              reg75 <= $unsigned(($unsigned(((reg70 ^~ reg70) > {reg71,
                      reg62})) ?
                  $signed($signed((8'ha1))) : ($unsigned($unsigned(reg65)) ?
                      (reg72 ? {reg74} : $signed(wire13)) : (8'hba))));
            end
          else
            begin
              reg72 <= (~^{$unsigned({reg71[(1'h1):(1'h1)]}),
                  $signed((~^(8'ha0)))});
              reg73 <= $signed((~$signed($signed((reg64 ? reg74 : reg67)))));
              reg74 <= $unsigned(($signed($unsigned({wire10,
                  wire13})) >> (~&((reg65 ? reg71 : wire60) && reg66))));
              reg75 <= {((~|((wire12 ? wire13 : wire60) ?
                          wire11 : $unsigned(reg69))) ?
                      reg72 : $unsigned(reg62[(2'h2):(1'h1)]))};
              reg76 <= $signed(wire11);
            end
          reg77 <= $signed((((7'h44) ?
              (^~wire12) : reg70) != $signed($signed(reg62[(2'h2):(1'h1)]))));
          reg78 <= $signed((^~($signed($signed(wire10)) + (^(&reg68)))));
          reg79 <= reg77[(3'h7):(3'h4)];
          reg80 <= ($unsigned((+$signed($unsigned(wire13)))) ?
              (~$signed(((~|wire11) ?
                  wire15[(3'h6):(1'h0)] : $signed(reg68)))) : reg68[(1'h0):(1'h0)]);
        end
      else
        begin
          reg72 <= {wire15,
              ({$unsigned($signed((8'hbd))),
                      {{wire11, reg74}, (reg74 * wire15)}} ?
                  (((+reg68) ~^ reg64) && (|wire13)) : $signed(($unsigned(reg75) >>> $unsigned((8'haa)))))};
          reg73 <= $unsigned($unsigned(((~^{(8'ha6)}) ?
              reg67[(1'h0):(1'h0)] : $signed((reg66 <<< reg69)))));
          if ($unsigned($unsigned((&(~(reg73 ? reg65 : reg75))))))
            begin
              reg74 <= $unsigned($signed(reg66[(5'h12):(4'ha)]));
              reg75 <= (~({(reg79[(2'h3):(2'h3)] ?
                          reg76[(3'h6):(2'h3)] : (reg62 ? wire12 : reg75)),
                      $signed(((8'hbf) ~^ reg67))} ?
                  {(&{reg69})} : ({(reg80 <<< (8'h9c))} < wire13)));
              reg76 <= {(~reg70[(3'h4):(1'h0)]),
                  ($signed(reg67[(1'h1):(1'h0)]) ?
                      $signed({$unsigned(reg62)}) : ($unsigned(reg68) ~^ {wire13[(2'h3):(1'h0)]}))};
            end
          else
            begin
              reg74 <= $unsigned(reg79);
              reg75 <= reg62;
              reg76 <= $unsigned(((((^reg73) ?
                  $signed(wire13) : reg77) * ((reg66 || reg76) <= $unsigned(reg71))) | reg68[(3'h6):(3'h4)]));
            end
        end
    end
endmodule

module module16
#(parameter param58 = ((~{((~(8'ha1)) + (~|(8'haa))), (((8'hb6) ? (7'h42) : (8'hb8)) ~^ ((8'hb6) ? (8'h9d) : (8'ha5)))}) ^ ((~{((8'hb0) ? (8'hbb) : (8'h9e))}) >= {((~(8'hb2)) ? {(8'hab), (8'h9d)} : ((8'hbe) <<< (7'h41))), (((7'h44) ? (8'hab) : (8'ha6)) ? (-(8'hb5)) : (+(8'hba)))})), 
parameter param59 = param58)
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire [(2'h3):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire30,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire21 = ($unsigned($signed(((+(8'ha4)) >= (~&(8'hb4))))) <= wire20);
  assign wire22 = ($unsigned(($signed((wire19 ?
                      wire19 : wire18)) <= $signed(wire20))) ^ wire19);
  assign wire23 = wire20;
  assign wire24 = wire18;
  assign wire25 = (8'hbd);
  assign wire26 = wire25;
  assign wire27 = wire26[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg28 <= (8'hb1);
      reg29 <= wire23;
    end
  assign wire30 = (^~(wire20[(5'h11):(5'h11)] ?
                      wire22[(3'h7):(2'h2)] : $signed((7'h40))));
  always
    @(posedge clk) begin
      reg31 <= (wire30[(1'h0):(1'h0)] ? wire17 : (^wire17[(4'h9):(1'h1)]));
      reg32 <= wire23[(2'h3):(1'h1)];
      reg33 <= $signed({{(|(wire30 == (8'hbc)))}});
    end
  always
    @(posedge clk) begin
      reg34 <= $signed(wire24);
      if ($signed($signed(wire30[(3'h4):(2'h2)])))
        begin
          if (wire19)
            begin
              reg35 <= $signed((($signed($unsigned(wire30)) ?
                  $signed((-wire30)) : $signed(reg28[(1'h1):(1'h0)])) & (~$signed(wire30[(4'h8):(1'h0)]))));
            end
          else
            begin
              reg35 <= (8'had);
            end
          if (reg33[(1'h0):(1'h0)])
            begin
              reg36 <= ($signed((~^(wire27 ?
                  (~reg28) : (wire23 & reg33)))) - $unsigned({((reg31 - wire24) ?
                      wire27[(4'h9):(3'h4)] : wire23),
                  (!$signed(reg29))}));
              reg37 <= $signed({$unsigned(wire25[(1'h0):(1'h0)])});
            end
          else
            begin
              reg36 <= reg29;
              reg37 <= $signed($unsigned($signed($signed(wire27))));
              reg38 <= $unsigned(reg37);
              reg39 <= ($unsigned($unsigned((~wire19[(3'h4):(1'h0)]))) >>> $unsigned(((~|$signed(wire19)) ?
                  wire20 : wire20)));
            end
          reg40 <= (wire19 ^ {reg32[(3'h6):(3'h6)]});
          reg41 <= reg31[(3'h4):(3'h4)];
          if (wire20[(5'h12):(3'h4)])
            begin
              reg42 <= reg32[(2'h2):(1'h1)];
              reg43 <= (wire27 ?
                  (reg36 ?
                      $unsigned(reg40[(4'hc):(3'h5)]) : {((|(8'ha8)) ?
                              $signed(reg36) : (^wire17))}) : ((reg33[(2'h3):(1'h1)] * (~^reg37[(1'h1):(1'h0)])) ?
                      $unsigned((((8'haf) ? wire30 : reg38) ?
                          (|wire24) : (reg42 ~^ reg28))) : $unsigned(reg38)));
              reg44 <= reg37[(3'h5):(2'h3)];
              reg45 <= $unsigned({$unsigned($signed((wire25 - wire27))),
                  $unsigned($signed(reg41[(2'h2):(2'h2)]))});
            end
          else
            begin
              reg42 <= ($unsigned((+wire23[(1'h1):(1'h0)])) ?
                  {{reg35[(1'h0):(1'h0)],
                          ($unsigned(wire30) ?
                              (reg44 ? (8'hae) : reg45) : {wire23,
                                  (8'hb1)})}} : (+(-($signed(reg42) != reg43))));
              reg43 <= {((8'hac) ?
                      $signed(reg34) : {(wire18[(1'h1):(1'h0)] ?
                              $signed(reg33) : (^reg43))})};
              reg44 <= {$unsigned({(wire25[(2'h2):(1'h1)] ?
                          $signed((8'hab)) : reg34),
                      reg34[(1'h0):(1'h0)]}),
                  $unsigned($signed(({wire24, wire30} ? wire26 : reg42)))};
              reg45 <= (^reg36[(1'h1):(1'h1)]);
              reg46 <= $unsigned($unsigned(($signed((reg31 ?
                  (8'hac) : wire19)) - $unsigned(reg34))));
            end
        end
      else
        begin
          if (reg34[(4'hb):(3'h7)])
            begin
              reg35 <= ((($signed(wire17) >>> reg29[(1'h1):(1'h1)]) == $unsigned((wire20 == ((7'h40) ?
                  wire26 : reg28)))) > (8'hb4));
              reg36 <= $signed((({$signed(reg44)} ?
                      (reg42[(4'hc):(3'h4)] ?
                          wire25 : (reg46 ?
                              reg39 : (8'hb6))) : $signed($signed(reg34))) ?
                  reg31 : $unsigned($signed((reg45 << wire18)))));
              reg37 <= {reg36[(2'h2):(1'h1)]};
              reg38 <= (^reg34[(4'h9):(1'h1)]);
              reg39 <= $signed((!(((reg44 ?
                      reg28 : wire21) << reg45[(4'ha):(4'h8)]) ?
                  (~&$signed(reg39)) : reg37[(3'h5):(2'h3)])));
            end
          else
            begin
              reg35 <= reg38[(4'h8):(4'h8)];
              reg36 <= (8'h9e);
              reg37 <= $signed((($unsigned(reg31) ^~ reg32) >> (reg38[(3'h7):(1'h1)] <= wire25)));
              reg38 <= (~$signed(reg43));
              reg39 <= $unsigned((((-$unsigned(reg45)) + ((wire20 ?
                          reg39 : reg40) ?
                      $signed(wire23) : (wire19 <<< wire23))) ?
                  $signed((~|{(8'had)})) : wire21));
            end
          reg40 <= (wire19[(4'h8):(2'h3)] >>> ($unsigned(reg44[(1'h1):(1'h1)]) ?
              reg31 : ($unsigned((reg37 ? reg38 : wire17)) ?
                  (|wire22[(3'h4):(2'h2)]) : $unsigned(reg42[(5'h12):(4'hd)]))));
          reg41 <= $unsigned(reg35[(1'h0):(1'h0)]);
          if (wire20)
            begin
              reg42 <= (!$unsigned({((reg44 ? reg39 : reg36) ?
                      (8'hb3) : (wire26 && reg33)),
                  ((wire21 ? reg46 : (8'haa)) ? (~|wire19) : (+reg46))}));
              reg43 <= $unsigned(({wire25,
                  (-(wire23 && reg40))} ~^ $signed(((|(8'hae)) ?
                  (wire27 || reg46) : (reg42 ? wire20 : reg37)))));
              reg44 <= {$unsigned((((reg43 ? reg45 : (8'h9e)) ?
                          (^wire27) : {reg40}) ?
                      (wire25 ? (7'h42) : reg44) : $signed((~^wire27))))};
              reg45 <= $unsigned({$signed((reg35[(1'h0):(1'h0)] & (8'hac))),
                  ((~^$unsigned(reg40)) + wire30[(4'hc):(3'h4)])});
            end
          else
            begin
              reg42 <= $signed(reg38[(4'hb):(2'h3)]);
              reg43 <= reg35[(2'h2):(2'h2)];
              reg44 <= (8'hbc);
              reg45 <= reg31[(1'h0):(1'h0)];
            end
          reg46 <= ((^reg37[(3'h4):(2'h3)]) & ({(!reg36),
              $signed(wire21)} < $unsigned(reg37)));
        end
    end
  assign wire47 = $unsigned(reg37[(2'h2):(1'h1)]);
  assign wire48 = $unsigned(((wire17 ? $unsigned($signed(wire19)) : reg35) ?
                      reg44[(3'h4):(2'h3)] : (^~(~|(reg35 << wire30)))));
  assign wire49 = reg44;
  assign wire50 = (~|reg37[(1'h0):(1'h0)]);
  assign wire51 = {(wire25[(1'h0):(1'h0)] | $signed(((^(8'ha0)) != ((8'h9e) > reg32))))};
  assign wire52 = $signed((^~$unsigned((8'h9f))));
  assign wire53 = $signed($unsigned(wire48[(1'h0):(1'h0)]));
  assign wire54 = ((reg32 >= (((wire19 ?
                          reg36 : wire49) != $signed(reg46)) <= ($unsigned(reg28) + {wire52}))) ?
                      $signed($unsigned(wire50[(5'h11):(4'he)])) : ($signed(((wire27 > wire49) ?
                              (wire47 ? (8'hb1) : reg32) : {wire51, reg44})) ?
                          ($unsigned($signed(reg39)) ?
                              wire27 : $signed({wire18,
                                  (8'hb7)})) : $unsigned(wire53)));
  assign wire55 = ({wire52} & (~|($unsigned($signed((8'h9d))) ?
                      (~|$unsigned((8'ha9))) : {reg33})));
  assign wire56 = $signed((((!$unsigned(reg29)) ? reg45 : (8'h9c)) ?
                      (wire26 << ($signed(wire21) ?
                          (reg45 ?
                              wire21 : reg34) : reg34)) : (((wire17 & reg36) * wire51) + {$signed(reg35),
                          $unsigned((8'hbb))})));
  assign wire57 = {($signed((+wire51)) + wire23),
                      $unsigned($signed(((~reg45) ?
                          (wire52 ? wire48 : (8'hb4)) : $unsigned(reg43))))};
endmodule
