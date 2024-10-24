module top
#(parameter param33 = (-((8'hbc) ? (((^(8'hb7)) ? (~|(8'ha0)) : (~|(7'h40))) ? {((8'ha1) <= (8'haa))} : (~^(&(8'ha7)))) : {((|(8'ha6)) ? {(8'hb8)} : ((8'hb5) * (8'hab))), {(~|(8'hbc))}})), 
parameter param34 = (((8'hb7) << (-(+(+(8'h9c))))) && (+((!(~^param33)) == (~^(param33 * param33))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire21;
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire21,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire4 = ({(({(7'h40)} - $signed(wire1)) + ((wire1 >> wire0) ?
                         $signed(wire1) : $unsigned(wire2)))} + wire3[(2'h2):(1'h1)]);
  assign wire5 = wire0;
  assign wire6 = ({$signed(wire3[(3'h5):(3'h4)])} != $unsigned((wire1[(1'h1):(1'h0)] ?
                     (wire3 || wire4[(4'h9):(4'h9)]) : ($signed((8'ha5)) || (wire4 ?
                         wire3 : wire4)))));
  assign wire7 = (wire3[(4'hf):(4'hd)] > (7'h41));
  assign wire8 = wire5[(1'h0):(1'h0)];
  module9 #() modinst22 (.wire10(wire0), .clk(clk), .wire12(wire1), .wire13(wire2), .wire14(wire6), .y(wire21), .wire11(wire8));
  always
    @(posedge clk) begin
      reg23 <= $signed($unsigned(wire6[(4'h8):(3'h7)]));
      reg24 <= (((8'ha1) ^ $signed($unsigned((wire5 <= wire4)))) == (|($unsigned($signed((8'hb6))) ?
          ((wire4 == (8'ha3)) ? (8'haa) : wire0[(5'h11):(2'h3)]) : ((reg23 ?
                  wire0 : (8'ha5)) ?
              $signed(wire7) : $signed(wire3)))));
      reg25 <= $unsigned($signed(wire8));
      if ((((~|(^~$unsigned(wire21))) ?
          $signed($unsigned({wire7,
              reg25})) : $unsigned((-wire3[(4'hb):(4'ha)]))) << ((((wire4 <<< wire2) * (8'haa)) + ((wire1 ?
                  (8'hb6) : (7'h42)) ?
              (reg25 == (8'h9f)) : (~(8'hbc)))) ?
          $signed(($signed(wire3) ?
              (wire6 ? wire1 : wire4) : wire4[(3'h6):(2'h2)])) : (8'hb0))))
        begin
          reg26 <= (wire7 ?
              $signed(((+wire2[(4'h8):(1'h1)]) != wire4)) : reg25[(1'h0):(1'h0)]);
        end
      else
        begin
          reg26 <= (~|{reg26, $signed($signed($signed(wire1)))});
          reg27 <= wire5;
          reg28 <= ({$unsigned(($signed(reg23) > wire4))} || $unsigned(((~&reg27[(4'h8):(2'h3)]) ^~ $signed($unsigned(wire6)))));
          if ($unsigned(wire2))
            begin
              reg29 <= {(~|(reg23 ?
                      $unsigned((reg24 != wire8)) : ({reg24, reg26} ?
                          {wire4} : (^~wire7))))};
            end
          else
            begin
              reg29 <= (wire3 - (reg28 ?
                  $unsigned(($signed(wire21) | $signed((8'ha3)))) : (({reg23,
                      (8'h9e)} != (~|(8'hac))) ^ (wire1 + reg23))));
              reg30 <= reg28[(4'hf):(4'ha)];
            end
        end
    end
  assign wire31 = $signed((^wire0));
  assign wire32 = reg27[(4'ha):(3'h5)];
endmodule

module module9
#(parameter param19 = ({((|(+(8'ha0))) <= (~(~&(8'h9c)))), ({{(7'h42)}, {(8'had), (8'hbf)}} - (((8'ha1) < (8'h9f)) >>> ((8'hb9) - (8'hbb))))} && ((((8'hb1) ? ((8'hac) >>> (8'hb9)) : ((7'h42) ~^ (8'ha4))) ? (((7'h42) & (8'ha3)) >= ((8'ha2) * (8'ha1))) : (+(~^(8'h9c)))) ? (^(^((8'h9d) ? (8'h9d) : (7'h42)))) : ({(~(8'hac)), (8'hb4)} >> ((8'hab) ? {(8'h9c), (7'h44)} : ((8'h9f) - (8'hb9)))))), 
parameter param20 = ((~|((param19 && param19) ? ({param19, param19} ? {param19, param19} : (param19 - (8'hba))) : (param19 ? (8'hac) : ((8'ha4) <= param19)))) <= {param19, ({{param19, param19}} ? (|(-param19)) : {((8'hab) > param19), (|param19)})}))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h22):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  assign y = {wire18, wire17, wire16, wire15, (1'h0)};
  assign wire15 = (^$signed((8'ha2)));
  assign wire16 = (8'hb3);
  assign wire17 = (8'hbb);
  assign wire18 = wire11;
endmodule
