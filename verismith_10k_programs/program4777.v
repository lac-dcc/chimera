module top
#(parameter param43 = (|((~|(((8'hba) >> (8'hba)) ^ (~(8'hbc)))) <= (~|(((8'hb1) >>> (8'hbd)) * ((8'ha4) + (8'hb9)))))), 
parameter param44 = param43)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire38;
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire16,
                 wire17,
                 wire38,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (~|($signed((7'h41)) ?
          (~&(~|(wire4 ? wire1 : wire3))) : wire3[(2'h2):(1'h1)]));
      reg6 <= (^~((~^($signed(wire0) << {wire0, (8'hb9)})) || wire2));
      if (wire1[(3'h6):(3'h6)])
        begin
          reg7 <= (8'hb9);
        end
      else
        begin
          if (reg7[(3'h5):(3'h5)])
            begin
              reg7 <= wire1[(4'hc):(4'h9)];
              reg8 <= (8'haa);
              reg9 <= $unsigned({$unsigned($unsigned((~|reg6))),
                  $signed({(~|(8'hab)), $signed(reg5)})});
            end
          else
            begin
              reg7 <= (reg8 ?
                  $signed(reg5[(3'h4):(1'h1)]) : $unsigned((-reg8)));
              reg8 <= (~$signed(wire0[(3'h7):(3'h7)]));
            end
          reg10 <= {reg9[(4'h8):(3'h5)]};
          reg11 <= {(wire3[(3'h4):(2'h2)] << (+(^$unsigned(reg6))))};
          if ((&(^(^~reg7[(3'h4):(1'h0)]))))
            begin
              reg12 <= reg7[(3'h4):(1'h0)];
              reg13 <= $unsigned((~|(|{(wire1 != reg8),
                  reg12[(3'h4):(1'h0)]})));
            end
          else
            begin
              reg12 <= $unsigned((7'h44));
              reg13 <= (+((&$unsigned((~reg5))) <= (~&((!reg8) ?
                  (reg12 > wire4) : ((8'ha7) ? reg9 : reg10)))));
              reg14 <= {(reg12[(1'h0):(1'h0)] & ((^(reg12 >= (8'hbb))) ?
                      $unsigned($unsigned((8'hb7))) : (wire3 ?
                          wire4 : (wire2 ^ wire4)))),
                  {($unsigned({(7'h43)}) ?
                          reg10[(1'h0):(1'h0)] : ($signed((8'hb6)) ?
                              (~^wire4) : reg8))}};
            end
          reg15 <= reg10;
        end
    end
  assign wire16 = (~^($signed(({(8'ha8), (8'hb0)} ?
                      $signed(wire3) : (~^reg7))) >= reg14[(2'h2):(2'h2)]));
  assign wire17 = reg9;
  module18 #() modinst39 (.wire19(reg13), .wire21(wire16), .wire22(reg10), .wire20(reg14), .y(wire38), .clk(clk));
  assign wire40 = wire1[(3'h4):(3'h4)];
  assign wire41 = (reg10 * (reg7 <<< (~$unsigned(wire17))));
  assign wire42 = {(~&$signed($unsigned(reg6[(1'h0):(1'h0)]))),
                      $signed(((~^$signed(reg13)) | (wire17[(3'h5):(1'h0)] ?
                          $unsigned(wire0) : (^wire1))))};
endmodule

module module18
#(parameter param37 = (({((7'h40) ^ ((8'hb9) - (8'hb0)))} ? (^((|(8'hbc)) ? ((8'hb9) < (8'hbc)) : (-(7'h44)))) : (|(-(8'haf)))) ? (!{(((8'hae) ? (8'hb6) : (8'ha3)) ^ {(8'hb3)})}) : ((~^({(8'h9c)} == {(8'haa)})) ? ((((8'hb0) < (8'ha2)) | ((8'ha5) == (8'hbc))) ? ((~&(8'ha7)) ? ((8'hab) ? (8'hb5) : (8'h9d)) : (8'h9d)) : (((8'ha4) ? (7'h40) : (8'hac)) ? ((8'haf) && (8'hb6)) : ((8'ha6) && (8'h9e)))) : ((((7'h42) >> (7'h43)) == ((7'h43) ? (8'hb9) : (8'hb7))) | (!((8'ha1) + (7'h41)))))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire [(4'hd):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire25,
                 wire24,
                 wire23,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire23 = (&(~&(wire21 ?
                      ((8'hb7) ?
                          $unsigned(wire19) : {wire20,
                              wire19}) : {wire21[(4'hb):(3'h4)]})));
  assign wire24 = $unsigned((^$unsigned(($signed(wire20) ?
                      (wire21 > wire22) : wire19))));
  assign wire25 = $signed($unsigned((wire23[(1'h1):(1'h0)] ?
                      (((7'h42) < wire21) != wire20) : (((8'hb4) ?
                              wire23 : wire19) ?
                          ((8'had) || (8'hb1)) : ((8'hac) ^~ wire21)))));
  always
    @(posedge clk) begin
      reg26 <= ((({(~^wire20), (wire21 ? wire23 : wire23)} ?
              (8'hbd) : $signed((wire25 << wire19))) + $unsigned((~&$signed(wire19)))) ?
          wire21 : $unsigned($unsigned($signed((wire22 ^~ wire23)))));
      reg27 <= ((^~wire24[(3'h7):(2'h2)]) > $signed(wire20[(3'h4):(2'h3)]));
      if (reg26[(1'h0):(1'h0)])
        begin
          reg28 <= {$unsigned({((wire20 || wire22) ?
                      reg26 : ((8'hb2) ? wire19 : reg26))}),
              (8'hb5)};
          reg29 <= $signed($signed($unsigned((~^(7'h42)))));
          if ({wire21[(3'h7):(1'h1)]})
            begin
              reg30 <= wire19;
              reg31 <= (!((($signed(wire22) - {wire22}) ?
                  ((reg27 ^~ reg30) ?
                      ((8'hb1) ^~ wire19) : $signed(reg26)) : reg30) ^~ (($signed(reg27) != {wire24,
                  reg28}) && reg28[(4'h8):(2'h3)])));
            end
          else
            begin
              reg30 <= (+wire24[(4'ha):(4'h8)]);
            end
          reg32 <= $signed(((7'h42) < $unsigned(wire19[(5'h10):(4'h8)])));
        end
      else
        begin
          reg28 <= (~^reg28);
          reg29 <= $unsigned(($unsigned(reg26[(1'h1):(1'h1)]) ^~ $unsigned($unsigned(reg26))));
          reg30 <= reg26[(3'h4):(2'h3)];
        end
      reg33 <= (^~reg32[(3'h7):(3'h4)]);
      reg34 <= reg28[(5'h11):(4'hb)];
    end
  assign wire35 = $signed((((&wire21[(2'h3):(1'h1)]) - (-reg27[(4'hc):(2'h2)])) ?
                      (!$unsigned(reg30[(4'h8):(2'h3)])) : $signed($unsigned((wire22 || (8'hb7))))));
  assign wire36 = (~^($unsigned(wire19) - wire23));
endmodule
