module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire17;
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire17,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  module5 #() modinst18 (.wire6(wire4), .y(wire17), .wire9(wire0), .wire10(wire3), .wire7(wire2), .clk(clk), .wire8(wire1));
  always
    @(posedge clk) begin
      reg19 <= ({$unsigned($signed($unsigned(wire2)))} + wire0[(3'h6):(1'h0)]);
      reg20 <= (8'hb5);
      reg21 <= ((wire4 ?
              {(-wire17),
                  ((|wire4) ?
                      (wire0 ?
                          wire2 : reg20) : $signed(wire0))} : $unsigned(((reg19 + wire2) && (|reg19)))) ?
          wire17[(4'h9):(1'h0)] : (wire0 >>> {$unsigned($signed((8'hb8))),
              ((reg20 ? (8'hab) : wire17) + $unsigned(reg20))}));
      reg22 <= reg20;
    end
  assign wire23 = $signed(((|(~^((8'hb0) ?
                      wire4 : reg20))) << (((~reg21) <= wire2) ?
                      $unsigned((!reg22)) : $unsigned((|reg21)))));
  assign wire24 = ($unsigned(({{(8'ha0)}} * (8'haf))) ?
                      wire1 : (!reg21[(3'h4):(3'h4)]));
  assign wire25 = (wire24 ^~ ({$unsigned((|wire0))} && wire17));
  assign wire26 = $unsigned((~&wire17));
  always
    @(posedge clk) begin
      reg27 <= $unsigned({$signed((((7'h42) ? (7'h42) : wire1) ?
              (~&reg19) : $signed(wire2)))});
      if (wire3)
        begin
          if ($signed($unsigned(wire3)))
            begin
              reg28 <= wire2;
              reg29 <= (~&(reg20 ?
                  ((-$signed(wire1)) ? reg22 : reg27[(4'h9):(1'h1)]) : wire4));
              reg30 <= ((($unsigned((8'hb5)) ^~ (&(8'haf))) ?
                      wire23 : (~((+wire17) ?
                          ((8'ha8) & reg27) : (wire23 >>> (8'ha8))))) ?
                  $signed($unsigned($signed($signed(wire17)))) : $signed(((-$signed(reg28)) ?
                      wire26[(3'h6):(2'h2)] : reg29[(4'hd):(4'hd)])));
              reg31 <= {wire25[(4'he):(3'h7)]};
            end
          else
            begin
              reg28 <= reg21;
              reg29 <= (8'hba);
              reg30 <= $unsigned($unsigned($unsigned({((8'h9c) ~^ wire23),
                  wire25})));
              reg31 <= (^wire0);
            end
          reg32 <= ((($signed(((8'hbb) | reg29)) ?
                      ($signed(wire25) == {(8'hb3),
                          wire23}) : reg28[(3'h5):(2'h3)]) ?
                  wire4 : wire26[(1'h1):(1'h0)]) ?
              $signed({(!(!(8'hb0))),
                  ((wire24 ?
                      reg19 : wire4) ^~ (^~reg29))}) : ($signed(($signed(reg19) <<< $unsigned(wire1))) ?
                  (~|$unsigned(reg30)) : $signed((reg22 ?
                      (~&wire3) : reg30[(3'h6):(2'h2)]))));
          reg33 <= ($signed(wire1) ?
              ($unsigned((reg32 ?
                  (~|(8'ha9)) : $signed(wire0))) == $signed($signed(wire0[(3'h4):(1'h0)]))) : (-reg27));
        end
      else
        begin
          reg28 <= (^~$unsigned(wire24));
        end
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = (wire6[(4'h9):(2'h3)] ?
                      $signed(($unsigned((^wire10)) < wire7[(2'h2):(2'h2)])) : (wire8[(1'h0):(1'h0)] ?
                          (+wire9) : wire9));
  assign wire12 = (wire7 + (wire6[(4'h9):(3'h4)] && wire11));
  assign wire13 = wire8;
  assign wire14 = (wire13 >> ((!(+wire10[(2'h2):(2'h2)])) ?
                      wire6[(4'ha):(2'h3)] : $signed($unsigned(wire7))));
  assign wire15 = (~&wire14);
  assign wire16 = ($signed(wire10) ?
                      (^~wire13[(2'h3):(1'h1)]) : $unsigned(wire8[(2'h3):(1'h0)]));
endmodule
