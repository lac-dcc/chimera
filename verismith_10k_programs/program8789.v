module top
#(parameter param76 = ((((!((7'h41) ? (8'haa) : (8'ha7))) ? {(&(8'h9d)), ((8'hbf) ? (7'h41) : (7'h41))} : (((7'h44) <= (7'h42)) ^~ ((8'hb6) ? (8'hbd) : (7'h41)))) ? ((((8'ha2) <<< (8'hb5)) & ((8'had) >> (8'ha8))) & ((~^(8'ha6)) >> (&(8'hba)))) : ((~&{(8'hb5)}) >= ((~^(8'h9c)) > {(8'ha5)}))) != (((-(~(7'h41))) ? (((7'h44) ? (8'hb7) : (8'hbb)) > (~|(8'ha4))) : (-((8'hbd) ? (8'ha4) : (8'hb3)))) ? (^(((8'h9d) ? (7'h41) : (8'ha3)) * {(8'h9e), (8'hb5)})) : ((((8'hb0) ? (8'hbd) : (8'hb4)) | {(8'hb2), (7'h40)}) <<< {(8'hb0), ((8'hb3) ? (8'ha0) : (8'ha6))}))), 
parameter param77 = (~param76))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire75,
                 wire73,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire4,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ({$signed((wire3 - wire0[(4'h8):(3'h5)]))} ?
                     $unsigned($signed({$unsigned(wire3), wire3})) : wire1);
  always
    @(posedge clk) begin
      reg5 <= wire0[(3'h6):(2'h2)];
      reg6 <= $signed((~&(~^wire3)));
      reg7 <= wire0;
    end
  always
    @(posedge clk) begin
      reg8 <= wire0;
      reg9 <= wire3[(2'h2):(1'h0)];
      reg10 <= $signed(reg5[(1'h1):(1'h1)]);
    end
  assign wire11 = ($unsigned(($unsigned(wire1[(3'h6):(3'h5)]) ?
                      $signed((8'hbe)) : (~&(wire2 ?
                          reg6 : reg6)))) ^ $signed(wire0));
  assign wire12 = reg8[(2'h3):(1'h1)];
  assign wire13 = {({($signed(reg6) * wire0)} <= wire2[(5'h11):(1'h1)])};
  assign wire14 = reg5[(1'h0):(1'h0)];
  module15 #() modinst74 (.wire16(wire4), .wire18(reg10), .clk(clk), .wire19(wire12), .y(wire73), .wire17(reg9));
  assign wire75 = ($signed((+reg8[(3'h7):(1'h1)])) + (((~^(wire12 < (8'hbb))) ~^ wire3[(1'h1):(1'h0)]) ?
                      $unsigned(wire11[(4'hf):(3'h5)]) : wire73[(3'h5):(1'h0)]));
endmodule

module module15
#(parameter param72 = ((+((((8'hb2) * (8'hac)) ? ((8'h9c) ? (8'h9e) : (8'ha0)) : (~|(7'h42))) << (~(-(8'hb0))))) == (^~(^~((^~(8'hb6)) - (^(8'hb4)))))))
(y, clk, wire16, wire17, wire18, wire19);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire61;
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire20,
                 wire21,
                 wire22,
                 wire61,
                 (1'h0)};
  assign wire20 = $unsigned($unsigned(wire18[(3'h5):(2'h3)]));
  assign wire21 = wire18[(4'ha):(2'h3)];
  assign wire22 = (|wire20[(5'h10):(4'he)]);
  module23 #() modinst62 (wire61, clk, wire19, wire22, wire17, wire16, wire18);
  assign wire63 = ((~&({(^wire22), $unsigned(wire18)} ?
                          wire18[(2'h2):(1'h1)] : (!((8'ha1) ?
                              wire18 : wire20)))) ?
                      ((wire16 ?
                              (wire18[(3'h4):(1'h1)] ?
                                  $signed(wire19) : (wire22 || (8'h9f))) : ($unsigned(wire20) ?
                                  wire22 : wire21[(1'h0):(1'h0)])) ?
                          $signed({$unsigned((8'hba)),
                              $signed(wire61)}) : wire61[(2'h3):(2'h2)]) : $signed($unsigned($signed($signed(wire21)))));
  assign wire64 = ({(((wire17 ?
                          (7'h41) : (8'hbb)) + wire20) & ($unsigned(wire22) ?
                          $signed(wire61) : wire21))} <= ({$unsigned(wire61[(1'h1):(1'h1)]),
                          {$signed(wire22)}} ?
                      {(+(wire19 || wire61))} : wire17));
  assign wire65 = (&$unsigned({wire22}));
  assign wire66 = $unsigned(wire22);
  assign wire67 = wire22[(4'hb):(1'h0)];
  assign wire68 = ($signed($unsigned(($unsigned(wire66) <<< wire18))) || (8'ha2));
  assign wire69 = wire63;
  assign wire70 = $unsigned((wire64 ?
                      ((((8'ha9) ? wire61 : wire66) << (wire17 ?
                          (8'hbd) : wire18)) >>> $signed($signed(wire61))) : ({(wire20 ?
                                  wire64 : wire20)} ?
                          $signed(((8'ha8) ? (8'hb4) : wire20)) : wire61)));
  assign wire71 = (!{wire65});
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg29 <= {$signed(wire28), (wire27 ~^ wire24[(3'h4):(1'h1)])};
      reg30 <= $unsigned(($signed(wire28[(2'h3):(1'h1)]) ?
          (wire27[(2'h2):(1'h0)] < (wire27[(2'h2):(2'h2)] ?
              {wire28} : $unsigned(wire26))) : $unsigned(wire25)));
      reg31 <= $unsigned($signed(wire27));
    end
  assign wire32 = wire28[(1'h0):(1'h0)];
  assign wire33 = (reg30[(4'hc):(2'h3)] || wire25);
  assign wire34 = (8'ha4);
  assign wire35 = wire28;
  always
    @(posedge clk) begin
      reg36 <= (wire24[(3'h5):(2'h2)] >= $unsigned((($unsigned(wire34) ?
              (wire26 + reg31) : $signed(wire27)) ?
          {$signed((8'hb1)), (+wire25)} : wire32)));
      reg37 <= {(~&wire33[(3'h4):(1'h1)])};
      reg38 <= {(~&(-$signed($unsigned(wire33)))),
          $signed(({$unsigned(wire32)} | $signed(wire32)))};
      reg39 <= (($unsigned((wire24[(2'h3):(1'h1)] ?
                  (wire28 * wire33) : (^reg31))) ?
              $signed($signed((wire24 ? wire27 : reg37))) : {wire26,
                  (reg31 ? reg30[(3'h7):(2'h2)] : (reg38 - (8'had)))}) ?
          {(reg38 > $signed((reg38 || wire28)))} : (reg30[(3'h7):(2'h2)] * wire27));
      reg40 <= ($unsigned(reg36[(3'h4):(1'h1)]) - (-reg37));
    end
  assign wire41 = $unsigned($signed(wire25[(4'h9):(2'h2)]));
  assign wire42 = $unsigned(((wire26[(1'h0):(1'h0)] & $signed((wire41 >> wire35))) != {reg36[(1'h1):(1'h0)],
                      (8'hb6)}));
  assign wire43 = (+($signed($signed((~^wire32))) || {$signed((-wire28)),
                      ({wire41} && {reg30})}));
  assign wire44 = {((reg36 ^~ $unsigned($signed(reg31))) ?
                          {{wire34[(3'h6):(1'h0)]},
                              $signed($signed(wire42))} : wire25),
                      $signed(wire28)};
  always
    @(posedge clk) begin
      reg45 <= ($unsigned($signed(wire42)) < (-(((reg39 ?
          wire26 : wire27) << wire25) != $signed((~&(8'hb6))))));
      reg46 <= wire35[(3'h5):(3'h4)];
      reg47 <= (~^$signed($unsigned(wire26[(3'h5):(3'h5)])));
      reg48 <= (wire28[(2'h3):(2'h3)] ?
          wire24[(1'h0):(1'h0)] : {$signed(wire44)});
    end
  always
    @(posedge clk) begin
      reg49 <= (~&$signed(wire43));
    end
  always
    @(posedge clk) begin
      reg50 <= (({wire33[(3'h4):(3'h4)]} + (8'hb2)) != $signed(wire34[(4'ha):(4'h8)]));
      if ($signed(reg47[(3'h4):(2'h2)]))
        begin
          reg51 <= (({((reg47 ? reg46 : (8'haa)) <<< wire33),
              wire32[(3'h4):(2'h3)]} >= ($signed((^reg47)) <<< ((wire25 ?
                  reg36 : reg36) ?
              reg38 : wire42[(4'hd):(1'h1)]))) ^~ {((((8'ha9) ?
                      reg37 : wire44) ?
                  (reg36 ? wire28 : (8'hbf)) : $signed(wire43)) & reg36),
              $unsigned(reg46[(2'h3):(1'h0)])});
          reg52 <= wire32[(2'h3):(1'h1)];
          if (reg50)
            begin
              reg53 <= ((~(((~reg37) ?
                      (reg37 ? reg45 : reg38) : ((8'h9c) ?
                          (8'ha0) : reg36)) != ((reg45 ?
                      reg50 : reg45) && wire43[(4'ha):(1'h1)]))) ?
                  (~&((!wire24) < reg49)) : ((^~reg36) ?
                      (reg47[(1'h1):(1'h0)] + ($signed((8'hb0)) ?
                          (reg38 > reg39) : $signed(wire34))) : $signed($unsigned(wire34))));
              reg54 <= $signed($signed({reg39,
                  ((reg40 >>> reg46) ? wire44 : $unsigned(reg30))}));
            end
          else
            begin
              reg53 <= reg50[(4'ha):(4'h8)];
            end
          reg55 <= (reg37 || ($signed($unsigned({wire44, reg51})) == wire35));
          reg56 <= reg46[(1'h1):(1'h1)];
        end
      else
        begin
          reg51 <= (reg30[(3'h5):(1'h0)] | ({reg38} ^ (!$unsigned(reg56[(2'h2):(1'h1)]))));
          reg52 <= ($signed(($unsigned((8'ha7)) ?
              $signed(((8'ha6) ?
                  reg56 : wire33)) : $signed(wire41))) ~^ (^~{((~&reg48) ?
                  wire43[(3'h7):(3'h4)] : (reg51 <<< wire27)),
              (8'ha6)}));
          if (reg49)
            begin
              reg53 <= ($signed(((wire35 >= $unsigned(wire27)) ?
                  ($signed(wire28) >> (+wire28)) : (~&$signed(reg46)))) | reg51);
              reg54 <= reg38;
              reg55 <= $unsigned((($unsigned(((8'had) ? wire25 : wire35)) ?
                      ($unsigned(reg39) ?
                          $unsigned(reg54) : (|wire42)) : $unsigned($unsigned(reg54))) ?
                  ((&reg47) | (^$unsigned(reg50))) : (((reg49 ?
                          wire25 : wire24) ?
                      wire28 : (!wire41)) ~^ $unsigned($signed(reg45)))));
              reg56 <= reg54;
              reg57 <= (8'hb0);
            end
          else
            begin
              reg53 <= $signed((wire27[(4'h9):(4'h9)] == (wire44 ?
                  ($unsigned(reg39) || ((8'hb7) - reg55)) : (reg49 ?
                      ((8'haf) ? wire42 : reg37) : reg37))));
            end
        end
      reg58 <= ($signed(reg29) && $unsigned(wire34[(3'h6):(2'h2)]));
      if ((8'ha1))
        begin
          reg59 <= ((~$signed(wire35)) ^ wire42[(1'h0):(1'h0)]);
        end
      else
        begin
          reg59 <= $unsigned(reg37);
        end
      reg60 <= (wire27 ?
          ((((~&wire27) <= (+wire41)) ~^ $unsigned($signed(wire34))) ?
              (8'hb0) : {reg39}) : wire41);
    end
endmodule
