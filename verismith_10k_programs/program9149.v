module top
#(parameter param51 = ({((+((8'hb1) ? (8'hbe) : (7'h42))) ^~ (((8'ha9) ? (8'ha2) : (8'ha5)) ? (8'hb8) : (-(8'ha7)))), ((((8'hb0) ~^ (8'hbe)) ? ((8'hbc) > (8'ha5)) : ((7'h40) != (8'h9c))) ? (((8'hba) ? (8'hbc) : (8'hbf)) && ((7'h44) ? (8'hb4) : (8'ha3))) : (((8'ha6) | (8'ha9)) <= (&(8'hab))))} << (((((8'ha7) < (8'hb8)) ? ((8'hbb) ? (8'h9c) : (8'hb1)) : ((8'h9e) - (8'ha6))) ^~ (((8'hb8) && (8'hb1)) ~^ ((8'hbd) <<< (8'ha4)))) || ((((8'hb8) & (8'hbd)) <<< ((8'ha3) ? (8'ha4) : (8'ha9))) << (^((8'hac) ^~ (8'ha3)))))), 
parameter param52 = (!(^~(^~{(param51 ? param51 : param51), (~param51)}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  assign y = {wire50,
                 wire48,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned((8'hbb));
  assign wire5 = wire0;
  assign wire6 = ((($signed(wire5) ?
                         ($unsigned(wire1) >>> (^wire3)) : ($signed((8'ha8)) ?
                             (wire4 << wire4) : $signed(wire4))) <<< $unsigned(wire0)) ?
                     wire1[(5'h10):(3'h6)] : wire4);
  assign wire7 = {(^~((8'hb9) ?
                         $unsigned((wire6 <<< wire5)) : ($signed(wire5) ?
                             (8'ha0) : (wire4 != wire3)))),
                     $unsigned($unsigned(wire1[(2'h3):(1'h0)]))};
  assign wire8 = ($signed(wire4[(1'h0):(1'h0)]) ?
                     (-wire5[(4'h9):(2'h3)]) : $unsigned({(((8'ha0) ?
                                 wire4 : (8'ha9)) ?
                             (wire2 ? wire4 : wire4) : wire4[(2'h2):(2'h2)]),
                         wire6}));
  assign wire9 = wire4;
  assign wire10 = (&$signed(((&$unsigned(wire7)) ?
                      $signed(wire5[(1'h0):(1'h0)]) : $unsigned($signed(wire8)))));
  assign wire11 = $unsigned(wire0[(3'h6):(1'h1)]);
  assign wire12 = $signed((8'hac));
  assign wire13 = ({(wire8[(2'h3):(1'h0)] ?
                              (+(wire4 ?
                                  wire5 : wire5)) : wire12[(1'h1):(1'h0)])} ?
                      (!$unsigned(wire0[(2'h3):(2'h2)])) : ((&($unsigned(wire6) + $signed(wire10))) ~^ $signed(wire10)));
  module14 #() modinst49 (.wire15(wire1), .wire18(wire0), .y(wire48), .wire16(wire4), .clk(clk), .wire17(wire9));
  assign wire50 = wire8;
endmodule

module module14
#(parameter param47 = {(8'hbe)})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(3'h5):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire signed [(4'hb):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
  assign wire19 = (^~$signed($unsigned(wire15)));
  assign wire20 = (^~wire17);
  assign wire21 = $unsigned(((^{(wire17 ?
                          wire15 : wire15)}) + $signed(wire15)));
  assign wire22 = $signed($signed({wire16, wire18}));
  assign wire23 = $unsigned((~&wire21[(4'h8):(4'h8)]));
  assign wire24 = $signed(((|$signed($signed(wire21))) ?
                      ($signed($unsigned(wire22)) ?
                          wire18[(4'hb):(4'ha)] : ((wire20 + wire20) > (wire22 == (7'h44)))) : $unsigned((wire16 != $signed(wire18)))));
  always
    @(posedge clk) begin
      reg25 <= (((^~$unsigned((wire15 ? wire23 : wire15))) ?
          $unsigned($signed(wire19)) : (wire18[(3'h4):(3'h4)] + wire19)) ~^ (((^~(~^wire15)) ^ (wire21 ?
              (wire20 ? wire18 : wire15) : {wire15, wire19})) ?
          (((wire17 * wire21) ?
              wire21[(3'h5):(2'h2)] : $unsigned(wire15)) > ((^~wire17) ?
              wire18 : $signed((8'hb2)))) : $unsigned((&(wire21 && wire24)))));
      reg26 <= ((($signed($unsigned((8'hb7))) ?
          ((wire24 * wire15) ^ (wire18 || (8'hb3))) : wire19[(4'h9):(4'h9)]) > $unsigned((wire18[(3'h4):(2'h3)] == $signed((8'hb9))))) <= wire15[(1'h0):(1'h0)]);
      if ($signed(wire22[(1'h1):(1'h1)]))
        begin
          reg27 <= $signed(wire23[(1'h1):(1'h1)]);
          if (($unsigned(wire17) ?
              reg27 : ((($unsigned(wire18) ?
                      $signed(wire17) : reg25) && wire22) ?
                  wire16[(3'h4):(2'h3)] : wire17)))
            begin
              reg28 <= reg26[(4'hf):(3'h5)];
              reg29 <= (!{wire17,
                  {((-reg27) != (wire24 <= wire19)),
                      (~wire21[(2'h2):(1'h1)])}});
            end
          else
            begin
              reg28 <= reg28[(1'h1):(1'h0)];
            end
          reg30 <= (|wire16[(3'h5):(3'h5)]);
          reg31 <= $unsigned((wire23[(3'h4):(2'h3)] ?
              ({(wire20 <<< wire22)} >= (!(reg26 ?
                  wire17 : wire18))) : $unsigned((~^(wire20 ?
                  (8'hba) : wire22)))));
          reg32 <= wire16[(1'h1):(1'h1)];
        end
      else
        begin
          reg27 <= (wire16 ? (&wire24[(3'h5):(3'h4)]) : $unsigned(wire18));
        end
      reg33 <= $signed(wire17);
    end
  assign wire34 = reg33[(3'h5):(2'h2)];
  assign wire35 = ($unsigned($unsigned(($signed(reg30) <<< reg30[(1'h0):(1'h0)]))) ?
                      (^~$signed(wire24)) : ((wire20 > (~(wire23 ?
                              (8'hbb) : reg31))) ?
                          $signed(wire21[(4'hc):(1'h0)]) : ((~|(wire16 - reg32)) ?
                              wire21[(1'h0):(1'h0)] : $unsigned(wire16[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg36 <= ($signed((~&$signed(reg28[(3'h5):(1'h1)]))) ?
          (^~({(&reg31), (|reg31)} ?
              ($signed(reg25) ~^ {reg28}) : (+(^~wire23)))) : {$unsigned($unsigned($unsigned(wire15)))});
      reg37 <= {$unsigned(((~^{wire21, wire24}) <= {$unsigned(reg30)})),
          {((~(~&reg32)) ? (-reg31) : (^$signed(reg28))), $signed(wire21)}};
      reg38 <= wire21[(1'h0):(1'h0)];
      if ((reg29 | ((~&(|{(8'hbe), (8'h9d)})) ?
          {wire16, (~^$signed(wire22))} : (&wire15))))
        begin
          reg39 <= reg25[(4'hf):(4'ha)];
          reg40 <= reg30[(3'h4):(1'h0)];
        end
      else
        begin
          reg39 <= $signed(($signed({reg29[(4'hd):(4'ha)]}) ?
              ((8'hb6) ?
                  wire16[(1'h0):(1'h0)] : reg32[(3'h4):(2'h3)]) : (reg36[(4'hf):(3'h5)] ?
                  reg27 : (reg38 ? $signed(reg36) : (-wire21)))));
          reg40 <= ({reg38,
              $signed(((wire20 * wire24) & $unsigned(reg28)))} < $unsigned((((reg31 ?
                  reg31 : reg40) | (8'hb1)) ?
              $signed($signed(wire23)) : reg39)));
          reg41 <= $signed(((~&{wire15, (~|wire15)}) ?
              $unsigned(wire19) : (~({reg38, wire22} || {reg29}))));
          if ($signed(($unsigned(reg37) ? reg39 : reg41)))
            begin
              reg42 <= {(wire20[(5'h12):(5'h10)] ?
                      ({(reg29 ?
                              wire34 : wire21)} * (|$signed(reg39))) : $unsigned((-(reg29 ?
                          wire21 : wire15))))};
              reg43 <= (($signed({wire35,
                      {wire16,
                          reg37}}) < ((wire16[(3'h6):(1'h0)] && wire17) && $signed(reg40[(3'h7):(3'h7)]))) ?
                  (^$unsigned((((8'ha6) ? reg42 : wire18) ?
                      {reg36,
                          (8'ha9)} : {reg28}))) : (reg33[(2'h3):(1'h1)] == $unsigned($signed((reg38 <<< reg38)))));
              reg44 <= $signed(reg41);
              reg45 <= {reg29[(3'h4):(1'h1)]};
            end
          else
            begin
              reg42 <= (reg38 + $unsigned(($unsigned(reg38) ?
                  reg26[(1'h1):(1'h1)] : $signed($signed(wire19)))));
            end
        end
      reg46 <= reg30;
    end
endmodule
