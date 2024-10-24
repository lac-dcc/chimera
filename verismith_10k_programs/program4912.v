module top
#(parameter param45 = ((~({{(8'haa)}, (-(8'hbd))} ? (((8'hbd) ~^ (8'hb3)) >> (-(8'hac))) : ({(7'h40)} ? {(8'haf)} : ((8'ha7) ~^ (8'ha6))))) ? {{(|((8'h9f) ? (8'h9f) : (8'hbc))), ((~^(8'hbd)) ? (-(8'hba)) : {(8'ha5), (8'hb4)})}} : (+({{(8'hbd), (8'h9f)}, (&(8'h9c))} ? ((~&(7'h43)) ? ((8'hb7) ? (8'had) : (7'h41)) : ((8'h9e) < (8'hb8))) : {(^(8'h9f)), {(8'hbe), (8'haf)}}))), 
parameter param46 = ((((((8'hbb) ? param45 : param45) && ((8'hbf) ? param45 : param45)) ? ((param45 ? (8'hbe) : param45) ? (param45 ? (7'h40) : param45) : (param45 ? param45 : param45)) : ((param45 * param45) ? param45 : (param45 & param45))) ? (8'hbb) : param45) >= param45))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire8,
                 wire7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {(wire0 >= $signed((-(~&wire1))))};
      reg6 <= ($signed(({$signed(wire0), (!wire1)} ?
              (wire1[(4'h8):(2'h2)] ?
                  $unsigned(wire3) : (|wire2)) : $unsigned($signed(wire3)))) ?
          ((~&((&reg5) ? (wire1 | wire0) : $signed(wire2))) ?
              $unsigned($unsigned((wire4 * (8'ha2)))) : {$signed(wire1),
                  (wire1 ?
                      wire3 : wire2[(3'h5):(3'h5)])}) : ((+(&wire1)) ^ ($unsigned(wire3[(1'h1):(1'h0)]) * ($signed((8'ha3)) ?
              wire4 : $signed(wire3)))));
    end
  assign wire7 = ((!wire4[(2'h3):(2'h3)]) || reg6);
  assign wire8 = (-(((!(&wire0)) ?
                         ((wire4 ~^ wire0) + reg6[(1'h0):(1'h0)]) : $unsigned(wire1[(2'h2):(1'h0)])) ?
                     $signed((~|wire1[(3'h5):(1'h0)])) : (reg6 + ($unsigned((8'ha6)) ?
                         {wire2} : reg5[(2'h3):(2'h3)]))));
  module9 #() modinst38 (wire37, clk, wire7, wire2, wire4, wire3);
  assign wire39 = ((+reg6[(1'h0):(1'h0)]) ?
                      $signed((!wire0)) : ($unsigned(wire37) ?
                          ((reg6 ?
                              wire0 : (!wire8)) && (~&wire1)) : $signed((~|(wire4 == wire7)))));
  assign wire40 = $unsigned({wire39, reg6[(3'h4):(1'h1)]});
  assign wire41 = wire40[(1'h0):(1'h0)];
  assign wire42 = (wire0 | wire40);
  assign wire43 = $unsigned($signed(((reg6[(2'h2):(1'h1)] ?
                      reg5[(2'h3):(1'h0)] : $signed(wire42)) ^ (8'ha5))));
  assign wire44 = $unsigned(wire39);
endmodule

module module9
#(parameter param36 = (&{(8'hb3)}))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  assign y = {wire35,
                 wire27,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg15,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= {$signed(wire10[(3'h6):(2'h2)])};
      reg15 <= wire12[(3'h7):(3'h7)];
    end
  assign wire16 = $signed($unsigned(reg14[(4'ha):(4'h8)]));
  assign wire17 = ($unsigned($unsigned($unsigned({reg15}))) ?
                      $unsigned(wire10) : {(wire12 ?
                              (wire13 <= $signed(reg15)) : (wire13[(3'h5):(3'h4)] | {reg14})),
                          $signed((|(wire12 ? wire12 : wire12)))});
  assign wire18 = $unsigned(reg14);
  assign wire19 = ($signed({(^~(&wire12)),
                          ($unsigned(wire11) <= wire16[(5'h10):(1'h0)])}) ?
                      (($signed(reg15[(4'he):(4'hb)]) ?
                          (&wire16[(4'he):(4'h8)]) : $unsigned({wire13,
                              wire10})) == (wire17 * ((wire11 ?
                              wire17 : wire17) ?
                          $signed(wire18) : wire18[(4'h9):(3'h6)]))) : $unsigned(reg15[(4'ha):(3'h6)]));
  assign wire20 = wire11;
  assign wire21 = wire12;
  assign wire22 = $unsigned((&$unsigned({(wire19 & wire17)})));
  always
    @(posedge clk) begin
      reg23 <= (($unsigned($signed((~^wire13))) || ($signed(reg15[(3'h7):(3'h5)]) ?
          $unsigned((wire11 ? reg15 : wire21)) : ((~^wire20) >>> {wire17,
              reg15}))) > $signed((($unsigned(wire10) & (^~reg15)) <<< (-(^reg14)))));
      reg24 <= wire19;
      reg25 <= ((wire22[(3'h7):(3'h6)] <<< $unsigned((8'ha0))) <<< (8'ha2));
      reg26 <= {wire20,
          ($signed({(^~wire13), (wire16 << wire19)}) ?
              $signed((reg24 >= (reg15 ? reg23 : reg24))) : ((+(wire12 ?
                  reg14 : reg14)) | (((8'hb5) ? (8'ha3) : reg23) ?
                  wire16 : $unsigned(wire21))))};
    end
  assign wire27 = wire13;
  always
    @(posedge clk) begin
      reg28 <= (wire17[(1'h0):(1'h0)] ?
          wire17 : $unsigned($signed(($unsigned((8'hb6)) | {(8'hab)}))));
      reg29 <= wire16;
      if (($signed((~^reg24)) ?
          $signed($unsigned({(~|(8'haa))})) : ((^$signed((wire11 - wire17))) ~^ ($signed($signed((8'hbc))) | {(wire20 ?
                  wire16 : wire13),
              $signed(reg29)}))))
        begin
          reg30 <= reg28;
          reg31 <= {$unsigned((+reg23[(4'hc):(4'h8)]))};
          reg32 <= {($unsigned(((wire19 ?
                      reg25 : wire11) <= wire16[(5'h11):(4'h9)])) ?
                  {reg24[(4'h8):(3'h6)],
                      $unsigned({wire12, wire18})} : wire22[(1'h1):(1'h0)])};
          reg33 <= wire13;
          reg34 <= $unsigned((reg31[(1'h0):(1'h0)] ?
              (($unsigned(reg14) - $signed(wire12)) ?
                  (~^((8'haf) << reg26)) : $signed($unsigned(reg30))) : (^{wire10,
                  {wire12, reg15}})));
        end
      else
        begin
          reg30 <= reg15[(3'h5):(2'h2)];
        end
    end
  assign wire35 = ($signed((|reg32[(4'hf):(3'h5)])) ?
                      $unsigned(reg33) : ($unsigned($signed($signed(wire16))) ?
                          wire22[(2'h3):(1'h0)] : {reg31[(2'h2):(1'h0)]}));
endmodule
