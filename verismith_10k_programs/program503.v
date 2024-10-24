module top
#(parameter param62 = ({((((8'hb7) ? (8'had) : (8'ha1)) == ((8'ha8) * (8'hb7))) << (((8'hb5) && (8'haf)) ? ((8'ha6) ? (8'hbb) : (8'hbb)) : (|(8'ha9)))), (+((^~(8'hb7)) ? ((8'hbf) ? (8'hbf) : (7'h41)) : ((8'ha7) ? (7'h41) : (7'h41))))} ? ({(((8'hbf) <= (8'h9e)) ? (~&(8'ha8)) : (!(8'hbf)))} ? ({((8'hb1) ? (8'hab) : (8'h9e))} ? (((7'h40) ? (8'h9e) : (8'hb3)) ? ((8'hb5) ? (8'haf) : (8'ha2)) : (&(8'haa))) : {((8'ha3) ? (8'hb2) : (8'ha3)), ((8'hbd) == (7'h42))}) : {(-(~(8'h9e))), ((&(8'hab)) || {(7'h44), (7'h40)})}) : ((((8'hbc) ? ((8'hba) ~^ (8'ha2)) : ((8'h9c) ? (8'hb0) : (8'ha0))) ? {((8'ha5) < (8'hbc))} : (((8'hb3) ? (7'h44) : (8'hbe)) ? ((8'ha2) >> (8'ha1)) : ((8'ha0) | (8'ha4)))) <= (~^{((8'haf) <= (8'hbb)), ((8'haa) && (8'h9c))}))), 
parameter param63 = {(^((&{(8'hbd), param62}) + {((8'haf) ? param62 : param62), (^param62)})), (-(^~((~|param62) * (param62 ? (8'hb4) : param62))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  assign y = {wire53,
                 wire51,
                 wire37,
                 wire36,
                 wire35,
                 wire24,
                 wire6,
                 wire5,
                 wire4,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  assign wire4 = $unsigned((-{{$unsigned((8'hb1))},
                     $signed((wire0 == wire0))}));
  assign wire5 = (-wire2);
  assign wire6 = (^$signed((7'h43)));
  module7 #() modinst25 (.clk(clk), .wire8(wire0), .wire11(wire2), .y(wire24), .wire9(wire5), .wire10(wire4));
  always
    @(posedge clk) begin
      reg26 <= (($signed($unsigned($unsigned(wire6))) >= wire2) ?
          ((|wire3) != wire1[(3'h7):(2'h3)]) : ((((&wire1) - wire3) >> $unsigned({wire3})) ?
              $unsigned($signed((wire4 + (8'hbb)))) : (8'hb3)));
      reg27 <= ((~wire24) || $signed($unsigned((~&(~wire24)))));
    end
  always
    @(posedge clk) begin
      reg28 <= reg26[(2'h2):(2'h2)];
      reg29 <= reg26;
      reg30 <= ((reg29 ?
              ((^~wire0[(3'h4):(2'h3)]) + (-(~reg29))) : ((wire1[(5'h11):(3'h6)] ?
                  $signed(wire6) : (^~reg28)) - (~|{wire0}))) ?
          (&$unsigned(($unsigned(wire5) | (!reg29)))) : $signed(($unsigned((wire6 >>> (8'hb1))) ?
              $signed((reg29 <= wire1)) : (wire1[(4'hd):(2'h2)] + wire24))));
      reg31 <= {$unsigned(((8'hbc) ?
              {$signed(wire1), ((8'ha8) >>> (8'ha1))} : (~&(wire24 ?
                  wire24 : wire4))))};
    end
  always
    @(posedge clk) begin
      reg32 <= $unsigned($unsigned($unsigned($signed((wire6 - (8'hbe))))));
      reg33 <= reg27;
      reg34 <= wire5;
    end
  assign wire35 = ($unsigned($signed((wire0[(3'h4):(2'h3)] + (reg28 ?
                      reg26 : wire5)))) & {({(reg29 ? reg33 : wire24), wire5} ?
                          wire5 : $unsigned((~^reg30))),
                      (($signed(wire1) > (reg30 <<< wire1)) ?
                          $signed($unsigned((8'ha6))) : (~&((8'hbb) ?
                              reg28 : wire24)))});
  assign wire36 = ((-(wire5[(2'h2):(1'h0)] - $signed((-reg29)))) >> (-(&$unsigned({reg32}))));
  assign wire37 = wire4[(1'h0):(1'h0)];
  module38 #() modinst52 (.y(wire51), .clk(clk), .wire42(wire4), .wire40(reg31), .wire43(reg27), .wire39(reg33), .wire41(wire36));
  assign wire53 = $unsigned({reg30});
  always
    @(posedge clk) begin
      reg54 <= (((^~{wire37}) ?
          reg28[(4'ha):(3'h4)] : wire6[(2'h3):(1'h1)]) == wire4[(4'he):(1'h0)]);
      reg55 <= (&wire24[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if ((|wire35[(1'h1):(1'h0)]))
        begin
          if ($unsigned($unsigned(($unsigned($signed(reg26)) ~^ $signed(reg31)))))
            begin
              reg56 <= ($unsigned($unsigned(wire0[(2'h2):(1'h0)])) > wire51[(3'h4):(1'h1)]);
              reg57 <= ($unsigned((-reg56[(4'ha):(1'h0)])) ?
                  $signed($unsigned($unsigned(wire0))) : (~^(((^reg55) ^ wire1[(2'h3):(1'h0)]) ?
                      $signed(wire24) : wire2[(1'h1):(1'h1)])));
              reg58 <= $unsigned(wire36);
              reg59 <= $signed(((^(((8'hb8) ^~ wire3) && wire51)) << ($signed((reg58 ?
                  reg54 : wire3)) <<< $unsigned(((8'ha5) ? wire1 : (8'h9c))))));
              reg60 <= $unsigned($unsigned((((reg56 == (8'hbe)) ?
                      $signed((8'hbe)) : (wire53 <<< wire36)) ?
                  (wire37 < {wire37,
                      (8'ha0)}) : $unsigned((reg54 <= wire35)))));
            end
          else
            begin
              reg56 <= reg30[(4'hc):(3'h4)];
              reg57 <= $unsigned({$unsigned({$unsigned(reg59)}),
                  (^reg55[(3'h6):(3'h4)])});
              reg58 <= (8'h9e);
              reg59 <= (^~((($unsigned((8'ha7)) >>> (wire3 >= wire4)) ?
                      wire36[(1'h0):(1'h0)] : $signed({wire3})) ?
                  {((^reg56) && $unsigned(wire37))} : (!$unsigned((wire24 < (7'h40))))));
              reg60 <= {wire51, reg58};
            end
          reg61 <= reg34;
        end
      else
        begin
          reg56 <= {({$unsigned($signed((8'hb7)))} == ($unsigned(((8'ha3) <<< (8'ha0))) ?
                  $unsigned((8'ha7)) : (reg55[(3'h5):(3'h4)] ?
                      $unsigned(reg34) : (8'hb1))))};
          reg57 <= {(~^(~(^~reg30[(4'h8):(3'h7)])))};
          reg58 <= $signed($signed($signed({reg33[(1'h1):(1'h0)]})));
        end
    end
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire43;
  input wire [(3'h6):(1'h0)] wire42;
  input wire signed [(2'h3):(1'h0)] wire41;
  input wire signed [(5'h14):(1'h0)] wire40;
  input wire signed [(3'h7):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire44;
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  assign y = {wire50, wire49, wire48, wire47, wire46, wire44, reg45, (1'h0)};
  assign wire44 = {(wire43[(2'h2):(1'h0)] ? wire39[(3'h6):(3'h5)] : wire42),
                      ({(~(wire43 == (7'h43))),
                              ($unsigned((8'hbc)) ? (8'ha4) : (^wire41))} ?
                          wire41 : ($signed((^(8'h9c))) ?
                              (wire43[(2'h2):(2'h2)] ?
                                  (|wire41) : wire43) : wire39))};
  always
    @(posedge clk) begin
      reg45 <= (8'hb1);
    end
  assign wire46 = wire41[(2'h3):(2'h3)];
  assign wire47 = $signed((^~wire40));
  assign wire48 = (wire39[(2'h3):(1'h1)] && (7'h41));
  assign wire49 = wire43[(1'h1):(1'h1)];
  assign wire50 = wire41[(1'h0):(1'h0)];
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire12 = wire11;
  assign wire13 = $signed((~^wire11));
  assign wire14 = ($signed((wire13[(1'h0):(1'h0)] ?
                      ((~&wire9) ?
                          $signed(wire8) : wire13[(1'h0):(1'h0)]) : wire11[(3'h4):(1'h0)])) == $unsigned($signed(($unsigned(wire9) || (|wire12)))));
  assign wire15 = {$signed(wire8[(3'h7):(3'h4)])};
  assign wire16 = (7'h43);
  always
    @(posedge clk) begin
      reg17 <= ((~|(($unsigned(wire15) ? (wire8 == wire14) : wire13) ?
              wire14[(1'h1):(1'h0)] : wire15)) ?
          (-($unsigned($unsigned(wire9)) ?
              ($signed((8'ha2)) ?
                  wire12[(5'h13):(4'hb)] : $unsigned(wire10)) : $unsigned(wire12))) : wire11[(1'h1):(1'h0)]);
      reg18 <= (wire8 ?
          $signed(wire10[(1'h1):(1'h0)]) : $unsigned($signed(reg17)));
      reg19 <= reg17;
      reg20 <= (-(8'hb0));
      reg21 <= (!wire10[(2'h3):(2'h2)]);
    end
  assign wire22 = wire8[(4'h8):(3'h7)];
  assign wire23 = $signed(wire12);
endmodule
