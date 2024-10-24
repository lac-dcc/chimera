module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire39;
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  assign y = {wire41,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire20,
                 wire22,
                 wire39,
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
                 (1'h0)};
  assign wire4 = $unsigned((8'ha9));
  assign wire5 = wire2[(2'h2):(2'h2)];
  assign wire6 = wire3[(2'h3):(2'h2)];
  assign wire7 = {wire4,
                     (~(((wire3 ? wire4 : wire3) | {wire3, wire1}) < {(wire5 ?
                             wire2 : wire2)}))};
  module8 #() modinst21 (.wire9(wire3), .wire10(wire5), .clk(clk), .wire12(wire2), .y(wire20), .wire11(wire6));
  assign wire22 = (|$signed($unsigned(wire0[(4'ha):(4'ha)])));
  module23 #() modinst40 (wire39, clk, wire5, wire22, wire2, wire0, wire7);
  assign wire41 = $signed(({wire2} * wire2[(4'h9):(1'h1)]));
  always
    @(posedge clk) begin
      reg42 <= ((~|{($signed((7'h40)) - wire39[(5'h11):(5'h10)]),
          (wire0[(4'hc):(3'h4)] >> (wire20 ?
              wire5 : wire20))}) == $unsigned(wire3[(4'hc):(3'h7)]));
      if (((+$signed(($signed(wire41) >>> (wire5 ?
          wire39 : wire0)))) < (+(((~(8'hbe)) + wire22[(4'h8):(2'h2)]) ?
          $unsigned($signed(wire1)) : wire2))))
        begin
          reg43 <= ((+({(wire22 <= wire20), $unsigned(wire41)} ?
                  (-{wire7}) : $signed((wire41 ? wire6 : wire4)))) ?
              (|wire1) : ({{(wire1 && wire20)}} <<< $unsigned($unsigned(wire1))));
          if ((-wire41[(3'h4):(3'h4)]))
            begin
              reg44 <= $signed((~^(&((wire2 >>> wire4) ?
                  {wire20} : (reg42 <<< wire6)))));
              reg45 <= (wire1[(2'h3):(2'h2)] ?
                  $signed((wire6 != wire4[(2'h2):(1'h1)])) : wire39[(3'h4):(2'h2)]);
              reg46 <= ((wire5[(4'ha):(1'h1)] ?
                  reg45[(5'h10):(3'h5)] : reg45[(3'h6):(1'h0)]) <<< (-((^~(+wire6)) <= $signed((wire1 ?
                  (8'h9c) : reg45)))));
              reg47 <= reg42[(4'h9):(3'h7)];
            end
          else
            begin
              reg44 <= wire3;
            end
          reg48 <= ($signed(((^$signed(reg43)) ?
              (-((8'hae) << wire22)) : wire41)) | wire7[(3'h7):(3'h4)]);
          if (($signed(reg47[(1'h0):(1'h0)]) > wire6[(4'hf):(4'hf)]))
            begin
              reg49 <= wire41[(4'he):(1'h1)];
              reg50 <= (^$unsigned(((+$signed(reg46)) >> ($unsigned(wire39) ?
                  $unsigned(wire7) : wire5))));
              reg51 <= wire6[(4'hf):(2'h3)];
              reg52 <= (~$signed((wire1 > reg42)));
              reg53 <= ((($unsigned($signed(reg43)) | $signed({reg47})) ?
                  $signed(reg51[(2'h2):(1'h1)]) : {((wire41 ? wire5 : wire4) ?
                          $signed(wire41) : wire0)}) ~^ reg42[(4'hb):(3'h5)]);
            end
          else
            begin
              reg49 <= $signed($signed($signed(wire22)));
              reg50 <= ((8'ha3) ?
                  (reg44[(1'h0):(1'h0)] ?
                      reg43 : $signed($unsigned(reg49[(4'hc):(3'h6)]))) : (^$signed(($signed(wire4) ?
                      wire2[(4'h9):(2'h3)] : (wire3 ? wire6 : reg52)))));
            end
          if ((!reg50[(5'h10):(4'hd)]))
            begin
              reg54 <= reg42;
              reg55 <= $signed((8'ha9));
              reg56 <= {(($unsigned($signed((8'ha4))) ?
                      {(^reg47),
                          wire41[(4'he):(4'h8)]} : {$unsigned((8'hbb))}) && {reg55,
                      reg53})};
              reg57 <= (|wire20);
            end
          else
            begin
              reg54 <= ((^~$signed({(-(8'ha8)), $unsigned((8'hbb))})) >= reg51);
              reg55 <= (((wire1[(1'h0):(1'h0)] ?
                      ((reg46 ? reg56 : (8'hac)) ?
                          reg57 : $signed(reg44)) : $signed($signed(reg54))) ?
                  (~&(((8'haa) ^~ wire5) == (reg51 >> reg55))) : (reg45[(2'h2):(1'h1)] <<< {(~reg42)})) >= (reg57[(4'h8):(1'h0)] << reg56[(3'h4):(2'h3)]));
            end
        end
      else
        begin
          reg43 <= (+(((+$unsigned(wire41)) ?
              $unsigned($unsigned(reg57)) : (!wire0)) + (-$signed(reg55))));
        end
      if (wire1[(2'h2):(1'h1)])
        begin
          reg58 <= reg56[(4'h8):(3'h5)];
        end
      else
        begin
          reg58 <= ($unsigned(($unsigned(reg56) <= (8'h9f))) & wire1[(1'h0):(1'h0)]);
          reg59 <= $unsigned((|reg47[(3'h5):(2'h2)]));
          reg60 <= $unsigned(reg52[(1'h0):(1'h0)]);
          if ((-$signed((+wire0))))
            begin
              reg61 <= ((^((~(8'h9d)) * (8'hae))) ^ {($unsigned(wire4) >>> wire1[(2'h3):(2'h2)]),
                  (($unsigned(wire1) ?
                      (!wire41) : {(8'h9d), wire39}) & $unsigned({wire22,
                      (8'hb6)}))});
              reg62 <= {($signed($signed((reg58 | wire22))) && (|(+wire22)))};
              reg63 <= $signed(reg42[(3'h5):(2'h3)]);
              reg64 <= ((($signed(((8'hb7) <<< reg62)) ?
                          ((reg51 ? reg42 : wire20) ?
                              wire2[(3'h5):(2'h2)] : $unsigned(reg48)) : ((reg58 != wire1) ^ (~|wire5))) ?
                      reg46[(4'h9):(3'h7)] : reg42) ?
                  wire5[(5'h12):(1'h0)] : $signed({$unsigned((reg46 || reg60)),
                      wire20}));
              reg65 <= (~|(((^~((8'hb5) != wire0)) ?
                      $unsigned(wire22) : (^(^~reg47))) ?
                  ($signed((wire20 ? (8'hb1) : reg52)) > ($signed(wire2) ?
                      $signed(wire39) : ((7'h44) - wire5))) : (!wire39[(4'he):(4'he)])));
            end
          else
            begin
              reg61 <= wire3[(3'h4):(2'h2)];
              reg62 <= ({reg59} >> ($signed((wire6[(4'hf):(3'h4)] >>> (wire5 ?
                      (8'ha2) : reg59))) ?
                  wire22[(2'h3):(2'h2)] : {$unsigned(reg55[(3'h7):(3'h7)])}));
              reg63 <= reg48;
              reg64 <= reg56[(3'h6):(1'h1)];
            end
        end
      reg66 <= (~|$signed(wire5));
      reg67 <= $unsigned(((((reg59 ? (8'ha1) : (8'hae)) ?
          {wire2, reg59} : (~|reg59)) >= {wire22[(1'h0):(1'h0)]}) | {reg60}));
    end
endmodule

module module23
#(parameter param38 = (~|((~&(-((8'hbd) ^~ (8'ha9)))) ^ (((8'ha3) & ((8'hba) ? (8'ha4) : (8'hb0))) ^~ (7'h42)))))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire28;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire signed [(2'h3):(1'h0)] wire26;
  input wire [(4'hb):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire29 = (wire26 ?
                      (((wire24 ?
                                  wire25[(3'h7):(2'h3)] : wire26[(1'h1):(1'h0)]) ?
                              $unsigned($signed((8'hb0))) : (((8'hbd) ?
                                      wire28 : wire26) ?
                                  (&wire26) : wire24[(5'h10):(2'h2)])) ?
                          ((!wire27[(1'h0):(1'h0)]) ?
                              {$signed((7'h40))} : $signed((wire28 >> wire25))) : (~&wire27)) : $unsigned({((^~wire27) ?
                              wire24 : {wire27, wire24}),
                          ($unsigned(wire24) ?
                              (wire25 ? (8'h9f) : (7'h40)) : {(7'h40)})}));
  assign wire30 = wire24[(2'h3):(1'h1)];
  assign wire31 = wire29[(1'h0):(1'h0)];
  assign wire32 = ($unsigned(wire30) ?
                      $signed(((7'h43) ?
                          wire24[(1'h0):(1'h0)] : $signed($signed(wire30)))) : wire24);
  always
    @(posedge clk) begin
      reg33 <= $unsigned(wire26);
      reg34 <= $unsigned(($unsigned(((-wire32) ?
              (wire29 ? wire30 : wire25) : (wire28 ? wire29 : wire32))) ?
          $unsigned($signed((wire31 ? wire32 : wire24))) : (8'ha9)));
      reg35 <= {($signed($unsigned($signed(wire26))) << $signed((|$unsigned((8'hb3))))),
          ((+($unsigned(wire28) ? {wire27} : (+reg33))) ?
              $unsigned(($unsigned((8'hab)) ?
                  wire27 : wire27[(1'h0):(1'h0)])) : ($unsigned(wire24) ?
                  reg34[(4'h9):(2'h3)] : $unsigned($unsigned(wire31))))};
      reg36 <= (wire27[(3'h5):(2'h3)] <= ((+wire29[(2'h3):(1'h0)]) ?
          (($unsigned(wire26) > (~|reg33)) ^ ((reg34 ? reg33 : wire32) ?
              $unsigned(wire28) : $unsigned(wire28))) : {wire24,
              wire25[(1'h0):(1'h0)]}));
      reg37 <= {wire25[(3'h4):(2'h3)],
          $signed($unsigned((~^((8'hbe) ? (8'hbf) : (8'hae)))))};
    end
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  assign y = {wire19, wire18, wire17, wire16, wire15, wire14, wire13, (1'h0)};
  assign wire13 = $signed(((~$unsigned((wire12 ? wire11 : wire9))) ?
                      $unsigned((wire12[(3'h6):(2'h3)] ?
                          (&wire11) : wire12)) : wire12));
  assign wire14 = $signed($unsigned(wire9[(2'h2):(1'h0)]));
  assign wire15 = $signed($unsigned(wire12));
  assign wire16 = (7'h44);
  assign wire17 = $signed(wire15[(3'h5):(1'h1)]);
  assign wire18 = ($unsigned($unsigned(wire13)) ^ ($signed((^wire17)) >= (|$unsigned($signed(wire13)))));
  assign wire19 = ($unsigned(((~&$unsigned(wire10)) > wire18)) ?
                      $signed((~^wire16[(1'h0):(1'h0)])) : $unsigned($unsigned((wire14[(4'h9):(3'h4)] ?
                          (8'h9d) : (~|wire9)))));
endmodule
