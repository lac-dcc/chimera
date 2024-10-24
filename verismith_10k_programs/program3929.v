module top
#(parameter param40 = (&(~(~(((8'hb9) ? (8'had) : (7'h40)) ? {(8'hbd), (8'ha7)} : (!(8'hb2)))))), 
parameter param41 = {(+((param40 ? (param40 ? param40 : param40) : ((8'hb9) ? param40 : param40)) ? param40 : param40))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire19;
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire39,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire5,
                 wire19,
                 reg38,
                 reg37,
                 reg36,
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
                 (1'h0)};
  assign wire5 = wire1;
  module6 #() modinst20 (wire19, clk, wire3, wire5, wire4, wire1, wire2);
  assign wire21 = wire0[(1'h1):(1'h1)];
  assign wire22 = ($signed(wire5[(4'h9):(1'h0)]) < ($signed($unsigned(wire2)) ?
                      $unsigned(($unsigned(wire5) ?
                          $signed((8'hb8)) : (wire4 ?
                              (8'hb5) : wire1))) : wire19));
  assign wire23 = $signed({(^~wire0)});
  assign wire24 = ($unsigned((-wire19[(1'h0):(1'h0)])) ?
                      ($signed(wire3) ?
                          (!(8'h9c)) : ($signed($unsigned(wire3)) ~^ $signed($unsigned(wire23)))) : wire5);
  assign wire25 = {(((^wire1[(3'h4):(2'h3)]) ?
                              (8'ha3) : $unsigned($unsigned(wire23))) ?
                          wire1 : $signed(($unsigned((8'hb9)) ?
                              $signed(wire5) : (^~(8'hb3)))))};
  always
    @(posedge clk) begin
      if ((|wire24[(1'h1):(1'h0)]))
        begin
          if ($unsigned(((8'hbc) - wire24)))
            begin
              reg26 <= $signed(wire2[(4'hc):(3'h7)]);
              reg27 <= wire1;
              reg28 <= wire19;
            end
          else
            begin
              reg26 <= wire25[(4'h8):(3'h7)];
              reg27 <= ({$unsigned($signed($unsigned(wire25)))} ?
                  wire4 : (wire22[(1'h0):(1'h0)] ?
                      ((wire22 ?
                          (wire0 ? reg28 : reg27) : (reg27 ?
                              wire4 : wire22)) | ((wire21 == reg27) ?
                          {(8'hb1), wire23} : (~&wire2))) : (wire25 ?
                          $signed((wire2 == wire4)) : ((wire22 ?
                              wire3 : wire25) > wire4))));
            end
          if (wire5)
            begin
              reg29 <= $unsigned(((wire19 ? reg28 : (~|(&reg27))) ?
                  (~|(8'hb6)) : wire3[(1'h1):(1'h0)]));
              reg30 <= (&wire23);
              reg31 <= (~^(wire21[(1'h1):(1'h0)] > (&(^~$signed(wire5)))));
              reg32 <= ((($unsigned(((8'hb5) - wire2)) ?
                      $unsigned((wire25 >> wire19)) : $unsigned((wire4 ?
                          wire3 : reg30))) ?
                  $unsigned(((^wire2) ?
                      {wire25} : wire25)) : (~^reg26[(1'h0):(1'h0)])) | ((~|$signed(reg27[(1'h1):(1'h0)])) && {{wire0[(1'h0):(1'h0)]}}));
              reg33 <= $signed((!$signed($signed($unsigned((8'ha6))))));
            end
          else
            begin
              reg29 <= ((~({reg31} ? (8'hbb) : reg33[(4'ha):(3'h4)])) * reg31);
              reg30 <= (($unsigned((((8'ha2) == wire1) ?
                      (&(8'ha4)) : $unsigned(wire22))) ?
                  wire0[(1'h0):(1'h0)] : (((reg28 >> (8'hb3)) ?
                      ((7'h43) ?
                          wire21 : wire21) : (wire1 >= reg33)) ~^ reg29)) ~^ (|{wire19[(1'h1):(1'h0)],
                  $signed($unsigned((8'ha1)))}));
              reg31 <= wire25[(1'h1):(1'h1)];
              reg32 <= $unsigned($unsigned($signed((8'hbb))));
            end
          reg34 <= ((!reg33) & $signed($unsigned(reg28[(2'h2):(1'h1)])));
          reg35 <= (~|$unsigned(((^~(&wire4)) << {(^~wire23), (!wire1)})));
        end
      else
        begin
          if ($signed((+((~|wire2[(4'h9):(2'h3)]) ?
              reg26[(3'h4):(2'h2)] : ((wire2 >>> reg27) ?
                  reg34 : (wire1 <= wire19))))))
            begin
              reg26 <= {wire3};
              reg27 <= {(~&{$signed(wire25),
                      ((reg27 ? (8'ha6) : (8'ha2)) ?
                          (wire0 ? wire23 : reg28) : wire24)})};
            end
          else
            begin
              reg26 <= ($unsigned((^wire24)) < reg28);
              reg27 <= $unsigned({(8'h9e),
                  (+((wire1 >= reg27) >> reg26[(1'h0):(1'h0)]))});
              reg28 <= (&$unsigned({$signed($signed(wire19)),
                  (~reg34[(2'h2):(1'h1)])}));
            end
          reg29 <= $signed(((|$unsigned(((8'haf) || wire1))) ?
              (($unsigned((8'hb8)) + $unsigned(wire0)) ?
                  ((wire2 ?
                      wire1 : wire19) <= wire0[(1'h0):(1'h0)]) : ($unsigned(reg30) ?
                      wire23[(3'h7):(1'h1)] : $unsigned(wire19))) : ($unsigned((~^wire19)) >>> (~$unsigned(wire4)))));
          reg30 <= ($signed(wire1[(4'h8):(2'h2)]) ?
              wire4 : ($unsigned((!$signed(wire0))) ?
                  reg33[(2'h2):(2'h2)] : $unsigned((~^(~|(7'h43))))));
        end
      reg36 <= (wire0 ^ $unsigned($unsigned(reg34[(1'h0):(1'h0)])));
      reg37 <= $signed((-wire4[(2'h3):(1'h0)]));
      reg38 <= wire23;
    end
  assign wire39 = (~^($unsigned(((wire3 - reg33) - (reg38 ? wire0 : reg29))) ?
                      {$unsigned($unsigned(wire0))} : $signed(reg37[(2'h2):(1'h1)])));
endmodule

module module6
#(parameter param17 = ((|(&(8'h9e))) ? ((((^~(8'hb7)) ? {(8'had)} : {(7'h43)}) <<< (((8'ha5) >> (8'hba)) == (&(8'hbf)))) ? ((~&(8'h9c)) ^~ (((8'hb6) ? (8'hae) : (8'hac)) == {(8'h9d), (8'ha3)})) : ((((8'hbc) ^ (8'ha8)) ? ((8'hb0) ? (8'ha1) : (8'hac)) : {(8'ha7), (7'h44)}) ? (~{(8'ha2), (8'ha8)}) : {{(8'ha0)}})) : (&((((7'h43) < (7'h43)) <<< (8'hba)) ? {((8'h9e) ^ (8'hac)), ((8'had) <= (7'h40))} : {(!(8'hba)), (~&(8'ha6))}))), 
parameter param18 = (param17 | (^((((8'haa) ^ param17) <= (!param17)) <= (^~(param17 ? param17 : param17))))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  assign y = {wire16, wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = $unsigned(((8'hb0) <= (~^$signed((wire8 ? wire9 : wire8)))));
  assign wire13 = (($signed(wire7) ?
                      $unsigned((|{wire9})) : (wire11[(2'h2):(1'h0)] ?
                          wire12[(3'h7):(2'h2)] : wire8[(4'ha):(3'h5)])) ^~ $signed(wire11[(2'h2):(1'h1)]));
  assign wire14 = $signed(wire13[(3'h6):(2'h3)]);
  assign wire15 = ((8'ha4) >>> wire8[(3'h7):(3'h6)]);
  assign wire16 = ((wire7[(3'h6):(1'h0)] ?
                      (^$unsigned((wire11 ?
                          wire13 : wire9))) : (7'h40)) ^~ wire12[(4'h9):(3'h5)]);
endmodule
