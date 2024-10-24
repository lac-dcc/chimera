module top
#(parameter param43 = (-((({(8'haf)} ^~ (!(8'ha2))) ? (^~((8'haa) ? (8'hb5) : (8'hb5))) : (((8'hbb) ? (8'hb3) : (8'had)) <<< ((8'hae) ? (8'hae) : (8'ha6)))) ? (~|(~((8'ha3) ? (8'ha6) : (7'h41)))) : (&(8'hbf)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire18,
                 wire7,
                 wire6,
                 wire5,
                 reg35,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire5 = ((&wire3) == wire1[(3'h5):(3'h5)]);
  assign wire6 = (^(($signed((wire3 | wire2)) && ((wire0 ?
                         wire2 : wire0) + (wire3 < wire1))) ?
                     wire2[(4'hd):(4'hd)] : $signed(wire5[(4'hd):(3'h4)])));
  assign wire7 = $unsigned((+(((~wire0) ?
                         (wire4 ? (8'haa) : wire0) : wire4[(3'h4):(1'h1)]) ?
                     {{wire6, (8'hb3)}} : $signed($signed(wire1)))));
  module8 #() modinst19 (.wire9(wire7), .y(wire18), .wire12(wire2), .wire11(wire5), .wire10(wire3), .clk(clk));
  always
    @(posedge clk) begin
      reg20 <= ((({$unsigned((8'h9f)), wire0} ^ ((wire3 & wire7) ~^ (7'h42))) ?
              wire6 : ($signed((wire7 >= (8'hb4))) ?
                  (wire3 ~^ (wire2 ^ wire0)) : $signed((+(8'ha1))))) ?
          wire18 : (~{$signed(wire7)}));
      if (wire5[(3'h7):(1'h1)])
        begin
          reg21 <= (wire2[(3'h4):(2'h3)] ?
              {wire2[(3'h5):(3'h4)]} : $unsigned($signed((8'ha1))));
          reg22 <= {(8'ha4), $unsigned((^~((^wire2) < wire5)))};
          reg23 <= wire0;
          reg24 <= ((($signed((~&wire4)) << $signed((|reg23))) ?
              (wire1 & $signed((reg22 ?
                  wire2 : (8'hab)))) : (^~$signed(wire3))) ^ $unsigned(wire1[(3'h7):(3'h4)]));
        end
      else
        begin
          reg21 <= $signed(reg21);
        end
      if ($signed({$signed((~^wire3)), (8'hb0)}))
        begin
          reg25 <= (&wire1[(3'h4):(2'h2)]);
          if ($signed(reg25))
            begin
              reg26 <= $signed({reg22[(1'h1):(1'h1)]});
              reg27 <= (~({wire1[(3'h6):(2'h2)]} > ((wire0[(1'h0):(1'h0)] && (wire4 ?
                  reg20 : wire6)) + ($signed(wire2) << reg25))));
              reg28 <= (~&reg20[(3'h4):(2'h2)]);
            end
          else
            begin
              reg26 <= $signed(reg20[(2'h2):(2'h2)]);
              reg27 <= wire6[(4'h8):(2'h2)];
            end
          reg29 <= ($signed((wire1 | (reg26[(3'h5):(3'h4)] ?
              (&reg25) : wire3))) | ($unsigned($unsigned((wire0 ?
              wire7 : wire2))) >>> ($signed(wire1[(3'h4):(3'h4)]) ?
              $unsigned((reg23 ? (8'hbd) : wire4)) : reg25)));
          reg30 <= (~((^~reg23[(4'h9):(3'h5)]) ?
              ((-{wire1}) ? $signed((wire2 | (8'hb4))) : reg22) : reg27));
        end
      else
        begin
          reg25 <= $unsigned((({((8'h9e) || wire2),
                  reg28[(1'h0):(1'h0)]} + (&(|wire18))) ?
              (((~&reg20) ~^ (~^(8'hb0))) ^ (^~{(7'h40)})) : $unsigned(({reg21} + reg23))));
          reg26 <= {{reg22, $signed(wire2[(3'h4):(2'h3)])},
              ((reg29 ?
                      {((8'hb8) * reg26), reg21[(3'h4):(2'h3)]} : ((reg21 ?
                          wire5 : reg28) <= $signed(reg23))) ?
                  wire18 : wire18)};
          reg27 <= {((-$unsigned((-reg20))) >> reg21[(1'h1):(1'h1)])};
          reg28 <= (reg25 != $signed((((^~wire6) || $signed(reg29)) ?
              (wire2 ? $unsigned(reg20) : (wire6 & reg22)) : reg26)));
          reg29 <= {$signed((wire2[(4'ha):(1'h1)] >>> ({reg27} + (wire4 ?
                  (8'h9d) : reg30)))),
              (!(wire0 >> (^~{reg20, reg21})))};
        end
    end
  assign wire31 = wire0;
  assign wire32 = (-reg21[(3'h7):(1'h0)]);
  assign wire33 = wire5[(5'h14):(5'h12)];
  assign wire34 = ((8'hb2) + wire4);
  always
    @(posedge clk) begin
      reg35 <= {reg28};
    end
  assign wire36 = wire4;
  assign wire37 = reg21;
  assign wire38 = ({$signed((~|$unsigned((8'hbf)))),
                          $unsigned((reg22 < (wire1 ? wire3 : (8'hb4))))} ?
                      reg28[(1'h0):(1'h0)] : ($signed(($unsigned(wire7) ?
                          (&(8'ha1)) : reg30[(3'h7):(3'h6)])) > wire5));
  assign wire39 = reg25[(4'h8):(2'h2)];
  assign wire40 = ($signed(wire2) ?
                      (wire3[(2'h2):(1'h0)] ?
                          {wire3,
                              $unsigned($signed(reg23))} : $unsigned(wire36)) : $signed((wire37 ^~ (8'hba))));
  assign wire41 = {((~|wire4[(2'h2):(2'h2)]) ?
                          (8'h9e) : (+(reg24[(5'h13):(4'hd)] >> (wire34 ?
                              reg24 : wire4)))),
                      wire4[(3'h4):(1'h0)]};
  assign wire42 = ($signed(wire40) ? wire0 : wire1);
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  assign y = {wire17, wire16, wire15, wire14, wire13, (1'h0)};
  assign wire13 = wire12[(3'h4):(1'h0)];
  assign wire14 = ($unsigned((~&wire12[(3'h6):(1'h1)])) ?
                      {$signed(($signed(wire11) ^~ $signed(wire13))),
                          wire10[(4'hc):(4'hb)]} : wire10);
  assign wire15 = (7'h41);
  assign wire16 = ((wire11 << ({(wire13 ^~ wire11),
                      (~wire13)} > ($unsigned(wire9) ?
                      {wire12} : $signed((7'h43))))) < ($signed((~&$signed(wire12))) ?
                      (+$unsigned(wire12)) : wire13));
  assign wire17 = wire12[(2'h2):(1'h1)];
endmodule
