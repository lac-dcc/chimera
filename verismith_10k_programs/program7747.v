module top
#(parameter param77 = (({(((8'hb0) ? (8'h9e) : (8'had)) * ((8'had) ? (8'ha2) : (8'hb5)))} ? (~^({(8'hb3), (8'hb0)} ? (^(8'ha3)) : ((8'ha2) ? (7'h40) : (7'h41)))) : (!((~(8'hb8)) == (^~(8'ha7))))) <<< ((~&((|(8'hba)) > ((7'h41) ? (8'hb1) : (8'hbe)))) ? (((~|(8'ha5)) >>> ((7'h42) > (8'ha5))) || (8'h9c)) : ((^((8'had) ? (8'hab) : (8'h9c))) != ((|(8'haf)) ? ((8'ha8) <<< (8'hb9)) : {(8'ha8)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  assign y = {wire75, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (($signed(wire0) <<< wire1) ?
                     $signed(({$unsigned(wire1)} ?
                         $signed($unsigned(wire0)) : ((wire2 > wire0) + (wire1 ?
                             wire0 : (8'hbc))))) : (&(~^wire3)));
  assign wire5 = (^((^~$unsigned(wire3[(2'h2):(1'h1)])) ?
                     {(+(8'hac)),
                         $unsigned($signed(wire3))} : wire1[(4'h8):(4'h8)]));
  assign wire6 = wire3;
  module7 #() modinst76 (.wire8(wire0), .wire9(wire4), .y(wire75), .clk(clk), .wire10(wire6), .wire11(wire3));
endmodule

module module7
#(parameter param73 = (|{(-(((8'hbb) ? (8'ha2) : (8'hb9)) ? (8'hba) : ((8'hb4) ^ (7'h41)))), (|{((8'hbd) & (8'ha7)), ((8'haf) >>> (7'h41))})}), 
parameter param74 = ({(~(8'hac)), param73} ^~ ((((8'had) ? (param73 & param73) : {(8'haa), param73}) << {(&(8'ha3)), {param73}}) >>> param73)))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire66;
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  assign y = {wire72, wire70, wire69, wire68, wire66, reg71, (1'h0)};
  module12 #() modinst67 (.clk(clk), .wire17(wire10), .wire14(wire11), .wire15(wire8), .wire16(wire9), .wire13((8'ha8)), .y(wire66));
  assign wire68 = {$unsigned(wire8[(4'hd):(4'hc)])};
  assign wire69 = wire11[(2'h3):(1'h0)];
  assign wire70 = (wire69[(3'h6):(3'h6)] ? (8'ha6) : wire8);
  always
    @(posedge clk) begin
      reg71 <= wire66;
    end
  assign wire72 = $signed((wire10[(3'h5):(1'h0)] >>> $unsigned(wire9[(2'h2):(1'h1)])));
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h20a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire22,
                 wire19,
                 wire18,
                 reg65,
                 reg64,
                 reg63,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire18 = ((((~(wire16 >>> wire13)) - ({wire14, (8'hb6)} - ((7'h40) ?
                          wire16 : wire17))) ^~ $unsigned(wire13[(3'h5):(2'h3)])) ?
                      (8'ha6) : $unsigned(wire14[(3'h4):(2'h2)]));
  assign wire19 = wire13;
  always
    @(posedge clk) begin
      reg20 <= {$signed((((8'hb3) || wire13) ?
              {$signed(wire17), $signed(wire15)} : wire19[(4'h9):(1'h1)]))};
      reg21 <= {wire16};
    end
  assign wire22 = (~&$unsigned($signed((&(!reg20)))));
  always
    @(posedge clk) begin
      reg23 <= $unsigned(((+((wire14 ? reg20 : reg20) || ((8'hb8) <<< reg21))) ?
          wire15[(1'h0):(1'h0)] : wire16));
      reg24 <= (wire16 ? wire16[(1'h0):(1'h0)] : wire14[(1'h1):(1'h1)]);
      reg25 <= (((8'hb9) ? wire13 : (~({wire15, wire13} ~^ {wire18, wire15}))) ?
          $signed($signed((wire15 ? {wire15} : wire19))) : $signed((~reg20)));
      reg26 <= (8'ha9);
      reg27 <= ($unsigned($signed(((^~(8'hb5)) ?
              $unsigned((7'h41)) : {(7'h43)}))) ?
          (!wire19) : {({$signed(reg25), (reg21 ? wire14 : reg26)} ?
                  ((reg26 == wire17) != (wire14 || wire19)) : $unsigned(((8'ha3) << reg23)))});
    end
  assign wire28 = {$signed((reg20[(1'h1):(1'h1)] >>> wire22)),
                      wire13[(3'h7):(3'h4)]};
  assign wire29 = (!wire17);
  assign wire30 = (&(reg27 - (8'hb4)));
  assign wire31 = wire29[(1'h1):(1'h0)];
  assign wire32 = $unsigned(((8'hb5) && {$unsigned($signed(reg24))}));
  assign wire33 = (^~wire31[(2'h2):(1'h1)]);
  assign wire34 = (wire13 ?
                      $signed((~&$signed(((8'hb1) ?
                          reg25 : wire22)))) : $signed(($unsigned(wire31[(2'h2):(2'h2)]) ?
                          reg21[(5'h11):(4'h9)] : wire14)));
  always
    @(posedge clk) begin
      if ((wire14[(2'h2):(2'h2)] ?
          ($signed(($unsigned(wire18) ?
              $signed(wire15) : (~wire16))) <<< wire29) : reg21[(3'h7):(1'h0)]))
        begin
          reg35 <= wire14;
          reg36 <= (&(|wire28));
          if ((8'ha5))
            begin
              reg37 <= $unsigned(wire31[(1'h0):(1'h0)]);
              reg38 <= $unsigned(wire17[(1'h0):(1'h0)]);
              reg39 <= (!reg26);
              reg40 <= $unsigned((({wire31[(1'h1):(1'h1)]} ?
                  (^~(wire30 ?
                      reg37 : reg20)) : (7'h42)) && (~^(reg37[(2'h2):(2'h2)] ?
                  (reg24 && wire32) : (wire15 * wire34)))));
              reg41 <= ($unsigned((($unsigned(wire22) ?
                      ((8'hbd) != reg21) : (7'h40)) > wire15)) ?
                  $unsigned({(reg39[(5'h12):(5'h12)] ?
                          {reg39,
                              wire31} : reg38[(3'h6):(2'h2)])}) : $unsigned(reg40[(4'hc):(4'h8)]));
            end
          else
            begin
              reg37 <= (7'h41);
              reg38 <= wire16[(3'h4):(1'h1)];
              reg39 <= (wire22 < reg24[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg35 <= (($signed(($unsigned(wire31) & reg21[(3'h7):(1'h1)])) << (^~{(~^(8'ha9)),
                  $unsigned(wire18)})) ?
              $unsigned(reg35[(4'hb):(2'h2)]) : (wire15 * $signed($unsigned((7'h41)))));
          reg36 <= reg25;
        end
      reg42 <= (-$signed(reg26[(2'h2):(1'h1)]));
      if ($unsigned($unsigned(reg23[(3'h7):(3'h4)])))
        begin
          if ($signed((((8'ha0) ?
              reg21 : reg36[(2'h2):(1'h1)]) + wire19[(3'h7):(3'h4)])))
            begin
              reg43 <= (|(reg41 << reg39));
              reg44 <= $signed(((~&$signed(reg23)) ?
                  {$unsigned(((8'hba) ^~ reg41))} : (wire34[(2'h2):(1'h0)] || (!$unsigned(wire14)))));
              reg45 <= reg39;
              reg46 <= reg26[(2'h2):(1'h1)];
            end
          else
            begin
              reg43 <= reg23[(1'h1):(1'h1)];
              reg44 <= {(8'ha6), $unsigned($unsigned($unsigned(reg27)))};
              reg45 <= ((!$signed($unsigned($unsigned((8'h9d))))) <= wire19[(3'h7):(2'h3)]);
              reg46 <= $signed((~$unsigned(($unsigned((8'haa)) ?
                  (reg44 >>> (8'hbe)) : $unsigned(wire18)))));
              reg47 <= ($signed((&(^~wire13[(2'h2):(2'h2)]))) <= {wire28[(4'he):(4'ha)],
                  (8'hb0)});
            end
          reg48 <= $unsigned(wire13);
          reg49 <= (($unsigned((reg25[(4'ha):(4'h8)] | (reg21 ?
                  reg21 : reg37))) || reg39[(4'hd):(4'hc)]) ?
              ($signed({(wire19 ~^ reg23),
                  (reg38 ? reg43 : reg42)}) >> (((wire32 ? (8'ha4) : (8'hb3)) ?
                  ((8'hba) ? (8'h9d) : reg47) : (^wire15)) >>> (reg40 ?
                  $unsigned(reg39) : reg41))) : {$unsigned(wire13[(2'h2):(1'h0)])});
          if ((-reg27[(1'h0):(1'h0)]))
            begin
              reg50 <= $signed(wire33[(1'h1):(1'h1)]);
              reg51 <= (|reg43);
              reg52 <= reg48;
              reg53 <= reg50;
              reg54 <= (wire29[(1'h1):(1'h0)] - wire16);
            end
          else
            begin
              reg50 <= ($unsigned($unsigned((wire34[(1'h1):(1'h0)] ?
                  ((8'h9d) ?
                      wire15 : wire22) : $unsigned(reg45)))) | $unsigned((!{(reg26 < reg52),
                  (reg35 - (8'hbc))})));
            end
          reg55 <= $unsigned(reg39);
        end
      else
        begin
          reg43 <= (~(8'hb8));
          if ((~&reg21))
            begin
              reg44 <= wire16;
            end
          else
            begin
              reg44 <= wire31[(1'h0):(1'h0)];
              reg45 <= reg54;
              reg46 <= $unsigned(((((8'hac) ?
                  $signed(wire28) : reg43) == {(reg25 ?
                      reg49 : (8'h9f))}) >> reg35[(5'h10):(3'h6)]));
              reg47 <= (wire34 ?
                  {((wire22[(2'h3):(2'h2)] <<< reg39[(3'h5):(1'h0)]) - ($signed((8'hb7)) && $signed(reg25)))} : $unsigned((reg53[(3'h4):(3'h4)] & {{wire31,
                          wire32}})));
              reg48 <= $signed($unsigned(reg40[(5'h10):(4'hf)]));
            end
        end
      reg56 <= ($unsigned(({{wire30}, reg55} ?
              (8'ha5) : $signed($unsigned(wire19)))) ?
          (|({$signed(reg40), $signed(reg41)} <<< reg51)) : {({reg40,
                  (reg51 ? reg42 : reg25)} | $signed({(8'hb1), wire16}))});
      if ((-((-(^~$unsigned(reg53))) >> ($signed({wire32}) > reg39[(4'he):(3'h7)]))))
        begin
          reg57 <= reg21;
          reg58 <= ({(reg52[(3'h7):(2'h3)] ? (8'hb9) : (~&(^~reg27))),
              wire32[(3'h7):(3'h6)]} & reg36[(1'h1):(1'h1)]);
          if (reg47)
            begin
              reg59 <= ((!$unsigned((-$unsigned(wire29)))) ?
                  (|({{wire32},
                      {wire16,
                          (8'hba)}} - ((7'h44) == (reg38 ~^ reg46)))) : reg53);
              reg60 <= wire17[(2'h2):(1'h1)];
              reg61 <= reg48[(3'h6):(3'h5)];
              reg62 <= $unsigned($unsigned(wire32[(4'ha):(2'h3)]));
              reg63 <= wire19[(3'h4):(1'h0)];
            end
          else
            begin
              reg59 <= $signed(wire22);
              reg60 <= $unsigned(((wire32 ^ (8'hb9)) ?
                  reg49 : (~(^(reg46 ? (8'h9e) : wire28)))));
              reg61 <= reg59;
              reg62 <= reg50;
            end
          reg64 <= reg51[(4'hc):(3'h7)];
          reg65 <= wire18[(4'hb):(4'hb)];
        end
      else
        begin
          reg57 <= wire28;
          reg58 <= reg35;
          reg59 <= (~|reg62[(2'h2):(1'h1)]);
          reg60 <= reg45[(3'h5):(1'h0)];
        end
    end
endmodule
