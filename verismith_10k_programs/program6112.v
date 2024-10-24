module top
#(parameter param43 = ({(-{((8'ha6) && (8'ha1))}), ((((8'hbc) == (8'hbb)) ? ((8'hb8) >> (8'hae)) : {(8'hbd), (7'h44)}) ? ({(8'hb0), (7'h42)} + ((8'hac) ? (8'had) : (8'hab))) : (^~(8'hb5)))} || (((-(~|(8'h9c))) ? {((8'ha2) ^~ (8'hb5))} : (((8'hba) - (8'hbb)) ? {(8'ha8), (8'haa)} : {(8'hb5)})) ? ((((8'ha8) & (8'hae)) ? ((8'ha4) <= (8'ha2)) : {(8'ha8), (8'hb6)}) ? (((8'hb1) ? (8'ha5) : (8'hb9)) ? ((8'hb4) | (8'h9d)) : {(8'ha0)}) : ({(7'h44), (8'hb7)} <= {(8'hbf), (8'hb8)})) : (^~{(~^(8'hb8)), ((8'hb6) ? (8'hb5) : (7'h43))}))), 
parameter param44 = param43)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire25;
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire25,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire4 = wire1[(3'h6):(1'h0)];
  assign wire5 = wire3[(4'h9):(1'h0)];
  assign wire6 = $unsigned((~^wire0[(2'h2):(1'h0)]));
  assign wire7 = wire1[(4'h9):(3'h5)];
  module8 #() modinst26 (wire25, clk, wire1, wire7, wire3, wire5, wire0);
  always
    @(posedge clk) begin
      if ((8'hbc))
        begin
          reg27 <= $signed((+($signed((wire5 <= wire1)) ?
              $unsigned((wire6 ? wire5 : wire25)) : $signed(wire6))));
          reg28 <= wire4;
          reg29 <= ((~&(&(^~(wire2 ? wire3 : wire5)))) && wire1[(4'hd):(1'h0)]);
          reg30 <= $signed({{(^~$unsigned((8'hb1))),
                  {(reg27 ? wire25 : wire7), {wire3, wire3}}},
              (|wire2[(4'h8):(3'h7)])});
          if ($signed({(((wire0 ? wire25 : wire6) ? wire1 : wire6) ?
                  wire4[(2'h2):(1'h1)] : wire7)}))
            begin
              reg31 <= $signed((reg30 > (8'h9e)));
              reg32 <= (~^$unsigned({reg28,
                  ((reg30 >> reg29) ? (^~reg29) : (wire0 && wire6))}));
            end
          else
            begin
              reg31 <= wire4[(1'h1):(1'h1)];
              reg32 <= ((7'h44) ?
                  $signed((+(reg30 ?
                      $signed(wire1) : (~wire6)))) : ({wire0} && ((((8'hae) ?
                          reg29 : wire0) > reg31) ?
                      ((~|wire5) ?
                          wire0[(5'h15):(3'h7)] : wire25) : wire7[(4'hd):(1'h0)])));
            end
        end
      else
        begin
          reg27 <= (|wire3);
        end
    end
  assign wire33 = $unsigned((!(^~$unsigned(reg29))));
  assign wire34 = $unsigned(reg30[(3'h6):(1'h1)]);
  always
    @(posedge clk) begin
      if (($signed((^$unsigned($unsigned(wire1)))) ?
          (^~(^{wire2[(4'he):(2'h2)]})) : {wire25[(3'h4):(2'h3)]}))
        begin
          if ((^(~|wire5[(2'h2):(1'h1)])))
            begin
              reg35 <= ((|wire5[(2'h2):(1'h1)]) ? wire34 : (^~wire0));
              reg36 <= ({wire5, wire33} || reg35);
            end
          else
            begin
              reg35 <= ($unsigned(wire25) ?
                  (~((8'hb0) ?
                      $signed($signed(reg28)) : (wire2 ?
                          $signed(wire6) : (reg29 >> wire4)))) : $signed($signed($unsigned($signed(wire25)))));
            end
          reg37 <= wire6[(4'h9):(3'h6)];
          reg38 <= $unsigned(wire5[(5'h13):(5'h11)]);
        end
      else
        begin
          reg35 <= {(&$unsigned(wire34))};
          reg36 <= {(($signed((~wire5)) << $signed((~^reg36))) << (wire5 ?
                  $unsigned((reg36 * wire7)) : $signed((wire33 ?
                      (8'h9c) : wire1)))),
              ((^~reg37) <<< reg31)};
          reg37 <= ((^reg38) != (-$unsigned((|$signed(reg31)))));
          reg38 <= ($signed({$unsigned(wire25),
                  ((wire5 ? reg31 : wire5) ? wire33 : $unsigned(wire4))}) ?
              $unsigned(({$unsigned((8'ha0)),
                  $signed(reg27)} != (wire5[(4'hc):(4'ha)] || $unsigned(reg28)))) : ($signed((8'hb9)) ?
                  {(~&(reg35 <= wire7))} : wire5[(4'h8):(2'h3)]));
        end
      reg39 <= (7'h42);
      reg40 <= reg32;
      reg41 <= wire6;
      reg42 <= (-wire25[(4'h9):(1'h1)]);
    end
endmodule

module module8
#(parameter param23 = ((!(({(7'h43), (8'hb1)} ? ((8'hbe) ? (8'hba) : (8'hb4)) : (~^(8'hb0))) > ((8'ha8) ? (&(8'hbd)) : ((8'ha5) ? (8'ha1) : (8'hb2))))) ? ((~&({(8'h9d), (8'ha1)} | ((8'ha8) ? (8'h9d) : (8'ha2)))) ? {((^(8'h9f)) || ((8'hba) | (8'hb2)))} : {((~|(8'hb5)) ? ((7'h43) * (8'hb1)) : ((8'h9c) ? (7'h41) : (8'h9e)))}) : ((~(((8'ha5) ? (8'haa) : (8'hb5)) ? (8'ha8) : ((7'h41) <= (8'ha6)))) ? {(((8'ha3) != (8'hb5)) || ((8'hb2) ~^ (7'h43)))} : ((((8'haa) ? (8'hae) : (8'hb3)) ? {(8'hbd), (7'h40)} : (8'haf)) ? (^((8'h9e) <= (7'h41))) : (8'hb6)))), 
parameter param24 = (^(((param23 >= (!param23)) - (~&(param23 ? param23 : param23))) ? ((+((8'hb4) > param23)) > (param23 ? (param23 * param23) : (-(8'ha1)))) : {{param23, ((8'ha9) ? (8'hab) : (8'h9f))}, {((8'hb2) + param23)}})))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  assign y = {wire22,
                 wire21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= (wire11[(3'h5):(1'h1)] ?
          ($unsigned((^wire12)) ?
              wire11 : {((^~wire13) ?
                      (wire12 ? (8'h9d) : wire10) : {wire9, wire12}),
                  wire11[(2'h3):(1'h1)]}) : {(^wire11[(3'h6):(3'h6)]),
              (^$unsigned(wire12[(4'hf):(2'h2)]))});
      reg15 <= wire11;
      reg16 <= ((reg14[(3'h4):(3'h4)] > ((&wire12[(3'h4):(3'h4)]) <= wire13)) == {($signed($unsigned(wire10)) > {wire13,
              wire10[(3'h5):(2'h3)]})});
    end
  always
    @(posedge clk) begin
      reg17 <= wire13[(4'he):(2'h2)];
      reg18 <= $signed((reg16 ^ reg16[(3'h7):(3'h6)]));
      reg19 <= ((!($unsigned(reg15[(2'h2):(1'h1)]) ?
              (reg18[(4'he):(3'h7)] >> (reg16 ?
                  (8'ha4) : reg17)) : ($signed(reg17) ?
                  (-wire13) : (wire10 < wire12)))) ?
          wire11[(3'h4):(3'h4)] : wire11[(2'h2):(1'h0)]);
      reg20 <= ((-({{reg18}} ? $signed(reg18) : reg18)) ?
          ((-(!reg15)) - $signed((~(reg14 & (8'haa))))) : reg16[(4'hb):(4'ha)]);
    end
  assign wire21 = $signed(((-(reg20 ?
                      (~&reg20) : (wire9 ? reg18 : (7'h43)))) | wire13));
  assign wire22 = (&(~|{((reg18 ? (8'hb4) : reg17) ?
                          (^~(8'ha1)) : reg18[(5'h14):(4'hf)])}));
endmodule
