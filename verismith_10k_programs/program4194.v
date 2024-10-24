module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire53;
  assign y = {wire55, wire5, wire6, wire7, wire53, (1'h0)};
  assign wire5 = $signed((^~$signed(wire2[(5'h10):(5'h10)])));
  assign wire6 = {($unsigned((&$unsigned(wire4))) < ((~^$unsigned(wire1)) ?
                         ({(8'hb5), wire4} ?
                             $unsigned(wire3) : {(8'hb6), wire2}) : (wire2 ?
                             $unsigned(wire3) : (!(8'had))))),
                     wire0[(3'h5):(1'h0)]};
  assign wire7 = wire1[(2'h3):(1'h0)];
  module8 #() modinst54 (wire53, clk, wire7, wire6, wire3, wire0, wire1);
  assign wire55 = wire1[(3'h6):(3'h6)];
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire47;
  assign y = {wire52, wire51, wire50, wire49, wire14, wire47, (1'h0)};
  assign wire14 = {wire10, ((~&wire9[(1'h1):(1'h0)]) && $signed(wire11))};
  module15 #() modinst48 (.wire20(wire13), .wire17(wire11), .wire18(wire9), .y(wire47), .wire19(wire10), .wire16(wire12), .clk(clk));
  assign wire49 = (^$unsigned($signed((8'hbb))));
  assign wire50 = $unsigned(wire9[(3'h7):(3'h7)]);
  assign wire51 = wire47;
  assign wire52 = wire10;
endmodule

module module15
#(parameter param45 = {(((8'h9d) ? ((^~(8'hae)) ? (~&(7'h42)) : ((8'ha6) + (8'hb5))) : {((8'h9d) >>> (8'hb3)), {(8'hb0)}}) ? (((~&(8'hac)) < ((8'hb9) ? (7'h44) : (8'ha4))) > (8'ha8)) : (((-(8'hae)) ? ((8'ha9) ? (7'h43) : (8'ha4)) : ((8'ha2) + (7'h40))) < (-(|(8'h9d))))), (^~{(!(-(8'ha7))), {((8'hbb) ? (8'hb9) : (8'hbd)), ((8'h9d) ? (7'h41) : (8'hba))}})}, 
parameter param46 = ((((((8'hbd) ? param45 : param45) ^~ param45) ? (!(param45 * param45)) : param45) * ((~^(^~(8'h9d))) ? ((param45 >> param45) ^~ (-param45)) : ((~param45) ~^ param45))) ? param45 : (((param45 ? {param45} : {param45, param45}) ^ param45) == ({(param45 <= param45)} || param45))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire [(3'h6):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire22,
                 wire21,
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
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire21 = $unsigned($signed((&(^~wire18))));
  assign wire22 = wire18;
  always
    @(posedge clk) begin
      if (wire22)
        begin
          reg23 <= $signed(($unsigned(wire20) ?
              (&$signed((^wire21))) : {(~{wire21, wire22})}));
          if (($signed((wire16[(3'h4):(1'h1)] ?
              (8'hb9) : (8'hab))) == ((($signed(wire16) * reg23[(5'h11):(3'h6)]) & wire20) ~^ (~^{reg23}))))
            begin
              reg24 <= {(^(((wire18 ? wire20 : wire17) ?
                      {(8'hbf)} : (wire17 - wire17)) * {{wire19, wire17},
                      $signed(wire19)})),
                  {(($unsigned(wire18) ?
                          wire18 : (wire18 ?
                              wire21 : wire16)) == (wire21[(2'h2):(1'h0)] && (8'hac)))}};
              reg25 <= {wire17[(4'hd):(3'h7)],
                  $unsigned(((((8'hb9) ?
                          reg24 : (8'hb4)) <<< (reg23 <<< (8'hb2))) ?
                      $signed($signed(wire17)) : ((wire21 ?
                          reg24 : wire22) >>> ((8'ha5) + reg24))))};
              reg26 <= $unsigned(wire21[(2'h3):(2'h3)]);
              reg27 <= $unsigned(reg23[(3'h6):(2'h2)]);
              reg28 <= (reg27[(3'h6):(1'h0)] ?
                  ({(~&{wire21, reg27})} ?
                      $unsigned($signed(reg24)) : wire20) : (wire22[(1'h0):(1'h0)] * $unsigned(($unsigned(wire19) ?
                      (reg26 - reg24) : (reg24 >= reg24)))));
            end
          else
            begin
              reg24 <= {(wire21 && wire16[(3'h4):(1'h0)]), wire17};
              reg25 <= ((7'h42) ? $signed(wire18) : wire16);
              reg26 <= wire21;
            end
        end
      else
        begin
          if ($unsigned({$signed(reg24[(4'h8):(2'h2)]),
              $signed($unsigned(wire16[(3'h5):(2'h2)]))}))
            begin
              reg23 <= (wire21[(2'h2):(2'h2)] ?
                  (((wire19 ?
                          wire19[(4'ha):(4'h9)] : wire16) < $signed((8'had))) ?
                      ((reg25 ?
                          $unsigned(reg27) : (wire21 ?
                              reg27 : wire19)) >= ((wire21 ?
                          wire18 : wire21) <= (&reg25))) : (8'h9c)) : (!((wire19[(4'ha):(3'h4)] && $signed(reg24)) ?
                      $unsigned((wire22 ?
                          wire17 : reg27)) : ((reg26 <= wire16) ^ (!reg28)))));
              reg24 <= (^$unsigned(($signed((reg23 ?
                  reg25 : reg26)) > ($unsigned(wire18) ?
                  wire17[(1'h1):(1'h0)] : ((7'h40) ? reg23 : wire16)))));
              reg25 <= reg25;
              reg26 <= reg28[(2'h2):(2'h2)];
              reg27 <= {wire20, wire18};
            end
          else
            begin
              reg23 <= (~&(+reg26));
            end
          if ((((8'hae) ?
              (8'hae) : ($unsigned($signed(reg23)) || wire16)) | $unsigned($unsigned({{reg26,
                  wire18},
              reg28}))))
            begin
              reg28 <= (wire16[(1'h1):(1'h0)] << (!$signed((^((8'h9c) ?
                  (8'hac) : reg24)))));
              reg29 <= $unsigned((reg27 ?
                  (($signed(wire21) == (~wire18)) ?
                      {(reg28 ? wire19 : reg25),
                          (wire20 ? wire20 : reg23)} : ((wire20 && wire20) ?
                          $signed(reg24) : (~|reg24))) : wire16));
              reg30 <= (^~$unsigned(reg25[(3'h5):(1'h0)]));
              reg31 <= ($signed((reg28[(2'h2):(1'h0)] ?
                  (8'had) : wire16[(2'h3):(2'h2)])) ^~ wire18);
              reg32 <= (($unsigned(wire20[(2'h2):(2'h2)]) ?
                  (~^(reg31 * reg26[(5'h10):(3'h4)])) : $signed($unsigned($signed(wire17)))) * ((reg31 ?
                      ((~reg24) ?
                          reg25 : $signed(reg23)) : reg24[(4'hc):(2'h3)]) ?
                  $signed((8'hb3)) : $signed(($unsigned(reg27) * $signed((8'h9c))))));
            end
          else
            begin
              reg28 <= (^(^~wire20[(1'h1):(1'h0)]));
              reg29 <= $unsigned(wire16);
              reg30 <= reg32;
              reg31 <= $unsigned({$unsigned({$signed(reg23), (^~wire20)}),
                  ($signed((wire19 ? reg31 : reg28)) ^~ (reg30 ?
                      $unsigned(reg26) : wire19[(4'hc):(1'h1)]))});
              reg32 <= (~(^~{wire17[(3'h4):(2'h3)]}));
            end
          reg33 <= wire20;
          reg34 <= reg28;
        end
    end
  always
    @(posedge clk) begin
      reg35 <= wire20[(1'h0):(1'h0)];
    end
  assign wire36 = ((((reg31[(2'h3):(2'h2)] ? (|reg35) : wire16[(2'h2):(1'h1)]) ?
                              $unsigned((~^reg35)) : $unsigned($unsigned(wire20))) ?
                          $signed((|$signed((8'ha9)))) : (8'h9d)) ?
                      {wire20[(2'h2):(2'h2)]} : reg29[(2'h3):(1'h1)]);
  assign wire37 = ((wire22[(3'h5):(3'h5)] ^ $unsigned($signed(wire36[(2'h2):(2'h2)]))) ?
                      reg24[(4'ha):(4'h8)] : $unsigned((((~^reg31) - (!(7'h42))) << ((reg30 * reg33) ?
                          (reg32 & wire18) : (&wire22)))));
  assign wire38 = reg23[(1'h0):(1'h0)];
  assign wire39 = (8'ha8);
  assign wire40 = {$unsigned(wire39[(1'h0):(1'h0)])};
  assign wire41 = wire17[(3'h5):(3'h4)];
  assign wire42 = (8'h9c);
  assign wire43 = $signed(((((reg24 <= (8'hb9)) ?
                      wire36 : $unsigned(reg26)) != {((8'ha1) ?
                          wire21 : wire38),
                      reg34[(2'h3):(1'h0)]}) || wire41));
  assign wire44 = reg28;
endmodule
