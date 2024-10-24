module top
#(parameter param61 = (~^{((+(~(8'hb9))) ? ((^(8'h9d)) + ((8'hb7) == (8'hba))) : (((8'hba) + (8'h9c)) ? ((8'hab) ? (8'hb3) : (8'ha8)) : ((8'hab) ? (8'hb4) : (7'h44))))}), 
parameter param62 = (((|{(param61 ? param61 : param61), param61}) ^~ param61) < param61))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  assign y = {wire59,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  assign wire4 = (|(wire2 ?
                     $signed(((wire0 ? (7'h41) : wire3) ?
                         {wire0} : $signed(wire2))) : $signed(($unsigned(wire2) ?
                         (|wire0) : (wire0 ? (8'ha4) : (7'h42))))));
  assign wire5 = $signed((wire0[(3'h7):(3'h5)] >>> (((&wire1) ?
                         $unsigned(wire0) : (^wire1)) ?
                     (|(wire2 ^ wire4)) : $unsigned(wire1))));
  assign wire6 = $signed(wire0[(4'hb):(1'h0)]);
  assign wire7 = $unsigned($unsigned((|($unsigned(wire3) ?
                     $signed(wire1) : (+(8'ha1))))));
  assign wire8 = $unsigned(wire6[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if ((|(~&(((wire1 ? wire8 : wire8) ?
              (wire5 ? wire3 : wire2) : ((8'hbf) ^ wire1)) ?
          (wire5 ? wire8 : (wire3 ? wire6 : wire8)) : wire7))))
        begin
          reg9 <= $unsigned(((-wire6[(2'h2):(2'h2)]) == $signed((~|(wire0 ?
              wire1 : wire2)))));
          reg10 <= {wire1[(3'h5):(3'h4)]};
          if ($unsigned((~|$unsigned($unsigned($unsigned(reg9))))))
            begin
              reg11 <= $unsigned(wire7[(3'h7):(3'h7)]);
            end
          else
            begin
              reg11 <= $signed((^~({((8'hb0) ? wire4 : reg11),
                      $signed((8'hba))} ?
                  wire8[(4'hc):(1'h1)] : ($signed(wire3) || (wire8 ?
                      wire4 : wire0)))));
              reg12 <= {(~{($signed(wire0) >>> $signed(wire5)),
                      ((~|reg11) ? $unsigned(wire2) : wire8)})};
              reg13 <= reg9;
            end
        end
      else
        begin
          if ((8'hbd))
            begin
              reg9 <= ((($signed((!wire3)) > ((wire4 ^~ reg13) ?
                      $signed(reg12) : ((8'hb1) ? wire7 : (7'h43)))) ?
                  $signed($unsigned(wire3)) : $unsigned({((7'h44) ?
                          wire7 : reg12)})) >> reg13);
              reg10 <= $signed((wire7 ^ {$signed({wire3})}));
              reg11 <= wire5;
              reg12 <= ((wire6 ? reg9[(2'h2):(2'h2)] : $unsigned(reg13)) ?
                  $unsigned((&wire2)) : (^reg9[(1'h1):(1'h0)]));
            end
          else
            begin
              reg9 <= $unsigned((~|{({wire4, (8'hbf)} ?
                      wire6 : $unsigned((8'ha6)))}));
            end
          if ((wire2[(4'hb):(3'h4)] ?
              $signed((((wire3 ? wire5 : wire6) ?
                      wire1[(4'h9):(2'h3)] : $signed(reg12)) ?
                  $unsigned({(8'hb1), wire6}) : reg9)) : wire7[(2'h2):(1'h0)]))
            begin
              reg13 <= $signed((^~(((wire5 ? reg12 : reg13) ?
                      $unsigned(reg9) : (wire4 <= wire8)) ?
                  wire7 : $signed($signed((8'had))))));
              reg14 <= ({reg11[(4'ha):(2'h3)]} << (wire5[(1'h0):(1'h0)] - (reg11[(4'h8):(2'h2)] <= (&(wire3 >> wire4)))));
              reg15 <= wire0;
              reg16 <= (((&{$signed(wire4), $signed(wire3)}) ?
                  reg9 : {$unsigned(reg12), $signed(reg9)}) ^ wire1);
            end
          else
            begin
              reg13 <= wire6[(2'h3):(1'h0)];
              reg14 <= $unsigned((8'hac));
              reg15 <= (({reg10[(1'h0):(1'h0)],
                      wire4} >>> $signed(($signed(wire6) + (^~reg10)))) ?
                  (wire8 ^ reg9[(2'h2):(1'h0)]) : $signed({reg10, reg14}));
              reg16 <= $unsigned(reg16[(1'h1):(1'h1)]);
            end
          reg17 <= $signed(wire6[(1'h1):(1'h1)]);
        end
      reg18 <= wire1;
    end
  module19 #() modinst60 (.clk(clk), .wire20(reg18), .wire24(reg11), .wire23(wire1), .wire22(reg14), .wire21(wire7), .y(wire59));
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  input wire [(4'ha):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire50,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire25 = $unsigned(wire21);
  assign wire26 = (!(+(wire24 & $unsigned((-wire25)))));
  assign wire27 = {($unsigned(((-wire24) - (~|(8'ha1)))) <<< ($signed((wire21 ?
                          wire22 : wire20)) > (~|$signed(wire24)))),
                      wire24[(4'h9):(4'h9)]};
  assign wire28 = $unsigned($signed(wire26));
  always
    @(posedge clk) begin
      reg29 <= wire25[(3'h7):(3'h4)];
      reg30 <= wire26;
      if (($unsigned({$signed((reg30 ^ wire25)), $signed(wire23)}) || wire20))
        begin
          reg31 <= wire25;
          reg32 <= reg29[(3'h7):(3'h6)];
          if (wire27)
            begin
              reg33 <= wire26[(3'h4):(2'h2)];
              reg34 <= wire28[(3'h7):(1'h0)];
            end
          else
            begin
              reg33 <= (8'ha5);
              reg34 <= (reg32 ?
                  (-$signed(wire25)) : $unsigned($unsigned((wire26 ?
                      ((8'hbf) ? wire23 : wire20) : wire21))));
              reg35 <= (~^wire27);
            end
        end
      else
        begin
          if (reg30)
            begin
              reg31 <= (7'h43);
              reg32 <= wire26[(3'h6):(1'h0)];
              reg33 <= (~|wire28[(1'h0):(1'h0)]);
            end
          else
            begin
              reg31 <= ($signed((reg30 ?
                      (wire24 <<< {(8'hbf),
                          wire23}) : $signed((reg33 | reg29)))) ?
                  reg35 : ((wire21 ?
                          wire22[(2'h3):(1'h1)] : (reg35[(3'h5):(2'h3)] && wire21)) ?
                      $unsigned({(7'h44)}) : $unsigned($signed({wire22}))));
            end
        end
      reg36 <= wire27[(4'hb):(2'h2)];
    end
  module37 #() modinst51 (wire50, clk, wire21, wire26, wire28, reg32, wire22);
  assign wire52 = {(8'h9e)};
  assign wire53 = ($signed(wire28[(5'h11):(4'hd)]) ?
                      wire23[(3'h7):(3'h4)] : (~&wire50));
  always
    @(posedge clk) begin
      reg54 <= $signed($unsigned(wire26[(3'h4):(1'h0)]));
      if (wire50[(1'h0):(1'h0)])
        begin
          reg55 <= (((8'h9f) ?
                  $unsigned(((^(8'ha8)) >>> $signed(reg32))) : $unsigned($unsigned((~wire21)))) ?
              wire25 : (reg30[(2'h2):(1'h0)] <= wire22));
        end
      else
        begin
          reg55 <= reg55;
          reg56 <= $unsigned(wire27);
          reg57 <= ((~wire21[(2'h3):(1'h1)]) || ($unsigned(reg36[(1'h0):(1'h0)]) & reg35[(1'h1):(1'h0)]));
          reg58 <= wire27;
        end
    end
endmodule

module module37
#(parameter param49 = ((~^(~^{((8'hbb) * (8'hb5))})) ? (~({((8'ha7) >>> (8'h9f)), ((8'h9e) >= (7'h41))} ? ((8'h9d) << {(8'hbb), (8'ha8)}) : (~^((8'hbc) ? (8'hbf) : (8'h9f))))) : (~&(!({(8'ha8)} & (~&(8'hb7)))))))
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire42;
  input wire [(4'hf):(1'h0)] wire41;
  input wire signed [(5'h11):(1'h0)] wire40;
  input wire signed [(3'h5):(1'h0)] wire39;
  input wire [(4'ha):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire44;
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  assign y = {wire48, wire47, wire46, wire45, wire44, reg43, (1'h0)};
  always
    @(posedge clk) begin
      reg43 <= wire40[(4'hc):(4'hc)];
    end
  assign wire44 = $signed(((-$unsigned({(8'hb2), wire41})) ?
                      wire38 : {(wire40[(1'h0):(1'h0)] << (7'h42))}));
  assign wire45 = (wire39 ?
                      wire40[(1'h0):(1'h0)] : ($unsigned((!$unsigned(wire38))) ?
                          {(~&$unsigned(wire40))} : reg43[(3'h6):(1'h1)]));
  assign wire46 = (~&{wire41});
  assign wire47 = wire42[(4'hc):(3'h7)];
  assign wire48 = (~^(wire40[(4'ha):(3'h5)] <= ((8'ha0) ? wire46 : wire47)));
endmodule
