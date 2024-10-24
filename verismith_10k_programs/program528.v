module top
#(parameter param46 = (((|(((8'h9c) ? (7'h43) : (8'ha9)) <<< ((8'hbc) ? (8'ha6) : (8'ha7)))) << ({(&(8'ha8)), ((8'hb7) & (8'ha1))} ^ (8'hae))) ? ((~&(-{(8'hbb), (8'h9c)})) >= {(~^((8'h9e) + (8'hac))), (((8'ha6) > (8'haa)) * {(7'h41), (7'h41)})}) : ((((~^(8'ha2)) ^~ ((8'hb5) ? (8'ha7) : (7'h43))) | (((8'hac) << (7'h41)) ? ((7'h40) ^ (8'ha9)) : (-(8'hb8)))) ? {(((7'h40) ? (8'haf) : (8'hb2)) ? (~|(8'hbe)) : {(8'ha0), (7'h43)})} : (~^(((8'hb8) < (8'hae)) - (^~(8'hbd)))))), 
parameter param47 = (({(param46 ? param46 : (+param46))} <= ({(~^param46), {param46, param46}} || param46)) || param46))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire44;
  assign y = {wire4, wire14, wire16, wire44, (1'h0)};
  assign wire4 = $unsigned(((8'hbd) ? (~&{(wire1 ? wire2 : wire0)}) : (8'hb9)));
  module5 #() modinst15 (wire14, clk, wire2, wire0, wire1, wire4);
  assign wire16 = wire0[(2'h2):(1'h1)];
  module17 #() modinst45 (.wire21(wire14), .wire20(wire2), .wire22(wire1), .wire18(wire16), .y(wire44), .wire19(wire3), .clk(clk));
endmodule

module module17
#(parameter param42 = ((((&(&(8'hba))) && {((7'h44) <= (8'ha5))}) >>> {(((8'hb0) + (8'hbf)) ? ((8'h9c) >> (8'h9f)) : {(8'ha3), (8'haf)}), (^((8'hb2) ? (8'ha1) : (8'ha0)))}) << ((!(+((8'hb9) * (8'hae)))) ? {((^~(8'hb6)) >= {(8'hb9), (8'hbd)}), {{(8'hb5), (8'hb6)}}} : ((^~(-(8'ha3))) ? (~(~(8'h9f))) : ({(8'ha5), (8'hba)} > ((7'h44) ? (8'hae) : (8'ha1)))))), 
parameter param43 = ((({(param42 <<< param42)} ? (param42 ? (param42 ~^ param42) : (-param42)) : {(param42 ? param42 : param42)}) <= ((!(param42 ? param42 : (8'hb5))) ? {param42, (param42 ~^ (8'hbf))} : param42)) != param42))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire22;
  input wire signed [(2'h3):(1'h0)] wire21;
  input wire signed [(2'h3):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= $unsigned($unsigned(wire18));
      reg24 <= $signed((-wire20));
      reg25 <= {wire19};
      reg26 <= wire18[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg27 <= wire22[(1'h1):(1'h0)];
      reg28 <= wire18[(2'h2):(1'h1)];
    end
  assign wire29 = (+wire20[(2'h2):(2'h2)]);
  assign wire30 = ({(7'h43)} ?
                      (+(($signed(wire20) ?
                          reg23[(1'h1):(1'h0)] : wire22[(5'h10):(3'h7)]) <= $signed($unsigned((8'hab))))) : wire22[(4'h8):(1'h0)]);
  assign wire31 = reg24[(2'h3):(2'h2)];
  assign wire32 = ($signed((8'hb3)) ?
                      {((wire30 ?
                              $signed(reg25) : reg26[(3'h6):(1'h0)]) >> reg27[(1'h0):(1'h0)]),
                          $unsigned($signed(wire20))} : (&wire21));
  assign wire33 = ((wire32[(4'h9):(3'h6)] ?
                          (wire22[(4'h8):(3'h6)] <<< reg26) : {wire21[(2'h3):(1'h0)],
                              (((8'hbf) <= (8'hbd)) ? reg23 : (~&reg24))}) ?
                      (reg25[(2'h3):(1'h0)] > wire22[(5'h11):(3'h4)]) : (^~({wire31[(3'h7):(1'h1)]} ?
                          reg25[(4'hf):(3'h4)] : $unsigned(reg28[(4'h8):(3'h6)]))));
  always
    @(posedge clk) begin
      if ((((wire31[(2'h2):(1'h1)] < $signed($signed(reg24))) ?
          $unsigned($signed({wire29})) : $unsigned((8'hbf))) > $signed(wire32[(4'he):(4'hc)])))
        begin
          reg34 <= ($signed(($signed(wire32) != (wire19 ?
              wire18 : wire20))) <<< ((((~^wire19) ?
              $signed(wire31) : $unsigned(wire20)) | $unsigned((!wire19))) == (|{(~|reg28)})));
          reg35 <= ($signed($unsigned((~|((8'hb0) ?
              wire20 : reg27)))) != ({$signed(wire32), (&$unsigned(wire30))} ?
              $signed((wire21[(1'h0):(1'h0)] && wire18[(1'h1):(1'h0)])) : $unsigned(wire33[(4'hc):(4'hc)])));
          reg36 <= wire18;
          reg37 <= reg27;
          if (($unsigned((({reg28, reg28} ?
                  (^wire31) : wire20[(1'h1):(1'h0)]) ^ $signed(wire22[(4'he):(1'h1)]))) ?
              ($signed((~^(|(8'ha9)))) ~^ $signed($unsigned($unsigned(wire30)))) : (&wire20[(2'h3):(2'h3)])))
            begin
              reg38 <= wire20[(1'h1):(1'h0)];
            end
          else
            begin
              reg38 <= ((~^(|reg23[(3'h4):(1'h0)])) ?
                  (((wire21 ? $signed(wire20) : wire21) ?
                      $unsigned((~^(8'h9e))) : $unsigned(wire22)) == {$signed($unsigned(reg25))}) : $signed($signed($signed($signed((8'hb4))))));
              reg39 <= $signed(wire18);
            end
        end
      else
        begin
          if ($signed($unsigned($unsigned(((wire31 ? wire22 : reg26) ?
              reg24 : $signed(wire29))))))
            begin
              reg34 <= (~|reg39);
              reg35 <= reg36[(3'h7):(3'h5)];
              reg36 <= ($signed(wire29) >> (reg35 ?
                  reg26[(3'h4):(1'h0)] : $unsigned(wire19)));
              reg37 <= (-(~&($signed((^reg23)) ?
                  {wire29} : (wire22 ?
                      ((8'hb8) ? reg39 : wire31) : (reg38 ? reg27 : reg26)))));
            end
          else
            begin
              reg34 <= wire19[(2'h3):(1'h0)];
              reg35 <= wire22[(4'hf):(2'h2)];
              reg36 <= $signed((($signed(((8'had) ? wire22 : reg23)) ?
                  (wire31 ^ $signed(reg23)) : $signed((^~wire30))) >>> $signed(wire20)));
            end
        end
    end
  assign wire40 = (~|$unsigned(reg38));
  assign wire41 = $signed($unsigned((~$unsigned((|wire18)))));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  assign y = {wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = wire6;
  assign wire11 = ((~^$signed(wire9)) ?
                      wire6[(1'h1):(1'h1)] : ($unsigned((-(&wire9))) ?
                          {(8'hb8)} : (wire8[(3'h4):(1'h0)] >>> (-(-wire9)))));
  assign wire12 = wire11;
  assign wire13 = (8'h9f);
endmodule
