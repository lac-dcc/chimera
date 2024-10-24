module top
#(parameter param44 = ({((&(!(7'h44))) ? (~|{(8'hbe)}) : (^~((8'ha4) ? (8'ha3) : (8'hba)))), ({{(8'ha6)}, ((7'h42) <= (8'hb2))} ^~ (~^(^(8'hb5))))} >>> ((~^((~^(8'ha7)) ^~ (8'had))) ? ((|(~|(8'haa))) ? (-((8'ha6) ? (8'ha0) : (7'h41))) : {((8'h9d) ? (8'ha6) : (8'hbe))}) : {(!(|(8'haf)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire19;
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  assign y = {wire43,
                 wire38,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire19,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire4 = {(8'hac),
                     (wire1 ?
                         wire0[(3'h4):(2'h2)] : (^~((wire2 & wire3) ?
                             (wire2 ? (8'ha8) : wire2) : $signed((8'hbc)))))};
  assign wire5 = (($unsigned((wire0[(3'h6):(1'h0)] ?
                     (wire3 >>> wire2) : $unsigned((8'h9c)))) < $signed(wire0)) ~^ ((-wire4[(2'h3):(1'h0)]) ?
                     wire1[(3'h4):(2'h2)] : $unsigned(($signed(wire2) + wire4))));
  assign wire6 = wire1;
  assign wire7 = wire6;
  module8 #() modinst20 (wire19, clk, wire5, wire0, wire6, wire4, wire3);
  assign wire21 = (8'hba);
  assign wire22 = $unsigned(wire21[(4'he):(2'h2)]);
  assign wire23 = $signed(($signed($signed(wire1[(2'h3):(2'h2)])) ?
                      $unsigned({{wire7}}) : (~(^(|(7'h40))))));
  assign wire24 = ($signed(($unsigned((wire19 == wire5)) ?
                      (wire3[(2'h2):(2'h2)] && {wire2,
                          wire4}) : $signed((!wire3)))) <= $unsigned($signed(wire6)));
  assign wire25 = wire0;
  assign wire26 = {$unsigned($signed(wire23))};
  assign wire27 = {wire23, (!(-wire2[(3'h7):(3'h6)]))};
  assign wire28 = ((wire19[(3'h7):(3'h4)] ?
                      wire2 : ((((8'h9c) >= (8'hb4)) ?
                              wire0 : $unsigned(wire5)) ?
                          (((8'h9f) ? (8'hae) : wire23) ?
                              $signed(wire26) : (wire23 ?
                                  wire19 : wire6)) : $unsigned(((8'hb9) > wire5)))) > wire27);
  assign wire29 = (((8'hb8) ^~ $signed($unsigned({(8'hb1), (8'hbf)}))) ?
                      (~&{$signed((~wire6)),
                          (^wire27[(1'h1):(1'h0)])}) : wire28[(4'hc):(1'h0)]);
  assign wire30 = (wire6 ?
                      ($unsigned(($signed(wire25) ? (~^wire29) : wire22)) ?
                          (((wire29 ? wire7 : (8'hae)) ?
                                  $unsigned(wire26) : (^wire21)) ?
                              wire0[(3'h4):(3'h4)] : ($unsigned((8'haa)) || wire0[(4'hd):(2'h2)])) : $signed(wire23[(5'h10):(1'h0)])) : wire23[(5'h14):(4'hf)]);
  assign wire31 = $signed((|wire7));
  always
    @(posedge clk) begin
      if (($unsigned(wire25) ?
          $signed(wire25) : $signed($unsigned(wire6[(1'h0):(1'h0)]))))
        begin
          if (wire6[(3'h6):(1'h0)])
            begin
              reg32 <= (+$signed($unsigned($signed((wire24 ?
                  wire24 : wire30)))));
              reg33 <= (~&(((wire6[(3'h7):(3'h5)] * (wire19 >= wire26)) - wire30) <<< $signed((wire22[(4'h8):(2'h2)] ?
                  (wire22 >= wire2) : wire27[(3'h5):(1'h1)]))));
            end
          else
            begin
              reg32 <= $signed((($unsigned({wire0}) ?
                      ((wire5 ^ wire4) ?
                          (^~wire29) : wire21[(3'h6):(3'h6)]) : ($unsigned(wire30) ?
                          {wire27, wire5} : $unsigned(wire28))) ?
                  ((-(wire31 ? wire7 : (8'h9e))) ?
                      $signed({wire28,
                          wire24}) : $signed(((8'haa) <= wire25))) : $unsigned({wire29[(2'h2):(1'h0)],
                      ((8'hb1) == wire30)})));
              reg33 <= (wire5[(1'h0):(1'h0)] ?
                  {(8'hb5)} : wire2[(3'h4):(2'h3)]);
              reg34 <= wire29[(1'h1):(1'h0)];
              reg35 <= $unsigned((reg32 != (^~(&(wire7 ? reg34 : wire22)))));
            end
          reg36 <= {(~&wire25[(4'hc):(3'h6)]),
              $unsigned(($signed($unsigned(wire26)) ?
                  {(8'hb5), $signed((8'ha7))} : (wire2 * wire27)))};
        end
      else
        begin
          reg32 <= $signed((wire28 ?
              wire6[(4'h9):(2'h2)] : wire26[(1'h0):(1'h0)]));
          reg33 <= (+wire23);
          reg34 <= wire0[(3'h7):(3'h7)];
          reg35 <= ((~&((~^(wire27 ?
                  (8'hb8) : wire31)) | $signed((~^(8'hbd))))) ?
              $signed($signed(({reg34, wire6} ?
                  $unsigned(wire26) : (&wire26)))) : (~&((^~wire3) << (~^(wire29 ?
                  wire2 : reg32)))));
        end
      reg37 <= ((~^$unsigned($signed(wire6))) ?
          $signed($signed(wire29)) : wire26);
    end
  assign wire38 = wire30[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      reg39 <= wire31;
      reg40 <= wire22;
      reg41 <= $signed((wire30[(4'h8):(1'h1)] ?
          (~&$signed($signed((8'ha1)))) : (($unsigned((8'hb7)) ?
                  reg36 : $unsigned(wire30)) ?
              $signed({reg37, wire31}) : (!(wire0 ? wire30 : wire27)))));
      reg42 <= $signed($signed($signed((~&$unsigned(wire6)))));
    end
  assign wire43 = (-wire27);
endmodule

module module8
#(parameter param18 = (!{{(8'hba)}, ((((8'hb4) ? (8'had) : (8'hb2)) ? (-(8'hb9)) : (-(8'h9f))) ? ({(8'hac)} ? ((8'ha0) ? (8'hb4) : (8'h9e)) : ((8'hb7) ? (8'hae) : (8'hbc))) : (((8'hbc) && (8'h9c)) ? ((8'hbd) ^ (7'h41)) : (~^(8'ha9))))}))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  input wire signed [(3'h6):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  assign y = {wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = $unsigned({(((^~wire13) ? (|wire13) : {wire9}) >> {{wire13,
                              wire13}}),
                      (((wire11 ? wire12 : wire9) ?
                          (~|wire10) : ((8'hb6) ? wire11 : wire10)) <= {(8'ha0),
                          $unsigned(wire12)})});
  assign wire15 = (8'hbc);
  assign wire16 = ((~|(8'ha7)) ~^ (($signed((^~wire13)) ?
                      ($signed(wire11) ?
                          {(8'hb4), (8'hb1)} : (wire10 - wire15)) : {{wire9,
                              wire11},
                          wire11[(2'h3):(1'h0)]}) << (~&((wire11 ?
                          wire13 : (8'ha5)) ?
                      wire15[(4'he):(4'ha)] : wire13[(3'h5):(1'h0)]))));
  assign wire17 = (wire11[(2'h3):(1'h0)] & (wire14 ?
                      ((8'hbf) ?
                          $unsigned($signed(wire11)) : $unsigned(wire13[(1'h0):(1'h0)])) : (wire14 ?
                          (8'hbd) : $signed($unsigned((8'hba))))));
endmodule
