module top
#(parameter param45 = (({(~&{(8'hba)})} ? (+{{(8'ha1)}}) : (({(8'hae)} <= ((8'hbb) != (8'hbc))) >= (^~(^~(7'h43))))) ? ((({(8'had), (8'hb3)} <<< ((8'ha2) ? (8'hb4) : (7'h41))) ? {((8'hbb) + (8'hba)), ((8'haa) ^~ (8'hb5))} : {(8'hbc), ((8'hb2) ? (8'ha7) : (8'hbe))}) | ((((8'hbb) ? (8'hba) : (8'had)) != ((8'hb1) + (8'hb0))) | {{(8'hb3), (8'ha7)}, ((8'ha5) >> (8'h9f))})) : {((((8'ha9) ~^ (8'ha8)) ? {(8'hbf)} : (~&(8'ha8))) ? (~|((8'ha4) | (8'h9f))) : (^((8'hb3) * (8'hb3))))}), 
parameter param46 = {((((param45 > param45) << {param45, param45}) ? (^~{(8'had)}) : (param45 <= (param45 << param45))) == (param45 ? {(param45 ? param45 : param45)} : param45)), param45})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire21;
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire32,
                 wire24,
                 wire23,
                 wire8,
                 wire9,
                 wire10,
                 wire21,
                 reg35,
                 reg34,
                 reg33,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed((!$signed($signed(wire3[(4'h9):(3'h5)]))));
      reg6 <= $unsigned(($unsigned(reg5) != ({((8'hb6) ? wire3 : (7'h43)),
              (~|wire1)} ?
          ($signed(wire4) == reg5) : $unsigned($signed(wire0)))));
      reg7 <= $signed(wire3[(3'h5):(3'h4)]);
    end
  assign wire8 = (reg5[(5'h10):(1'h0)] ^~ wire2);
  assign wire9 = (wire0 ?
                     $signed(wire1[(1'h0):(1'h0)]) : (wire2[(3'h7):(2'h2)] ?
                         wire4[(4'hd):(4'hc)] : $signed(wire2[(3'h5):(1'h1)])));
  assign wire10 = $signed($signed(reg6[(4'ha):(3'h5)]));
  module11 #() modinst22 (.wire13(wire10), .wire16(reg6), .wire14(reg7), .clk(clk), .wire12(wire0), .wire15(wire8), .y(wire21));
  assign wire23 = (~reg7);
  assign wire24 = wire3[(4'h9):(3'h7)];
  always
    @(posedge clk) begin
      if (reg5)
        begin
          reg25 <= wire21;
        end
      else
        begin
          if ({(wire10[(4'hc):(2'h3)] ?
                  {$signed({(8'hb9)})} : $signed((!{wire21}))),
              (8'hb7)})
            begin
              reg25 <= $unsigned(wire23[(1'h0):(1'h0)]);
              reg26 <= {$signed((-$signed(wire2[(3'h6):(2'h3)]))),
                  reg6[(4'hc):(3'h5)]};
            end
          else
            begin
              reg25 <= (&{(8'hb2)});
              reg26 <= (wire21[(2'h2):(1'h1)] - wire1);
              reg27 <= $signed((((-$unsigned(reg5)) ?
                  ($unsigned((8'haa)) > (wire2 ? reg25 : reg6)) : ((wire3 ?
                          reg25 : reg26) ?
                      reg25[(2'h2):(1'h0)] : (-reg7))) + {$signed(wire4[(3'h5):(2'h3)]),
                  wire2[(3'h4):(1'h0)]}));
              reg28 <= $unsigned($unsigned(reg25));
            end
          reg29 <= wire8;
        end
      reg30 <= (!(wire10 || wire2[(4'hc):(1'h0)]));
      reg31 <= $unsigned(wire23);
    end
  assign wire32 = {(8'h9f)};
  always
    @(posedge clk) begin
      reg33 <= wire1[(2'h2):(1'h0)];
      reg34 <= $signed(wire24);
      reg35 <= {$signed((-wire10[(5'h10):(4'hd)])), reg6};
    end
  assign wire36 = $unsigned(reg28);
  assign wire37 = $signed((|({reg25,
                      (reg7 ? (8'haa) : wire10)} - ((|wire10) << (reg7 ?
                      reg5 : (8'hab))))));
  assign wire38 = reg31;
  assign wire39 = ({(^~((^~wire36) >= reg25[(3'h5):(2'h2)])),
                          reg27[(2'h3):(1'h0)]} ?
                      (7'h40) : wire4);
  assign wire40 = ((~reg6[(2'h3):(1'h0)]) > ((^$unsigned(wire21)) ?
                      wire37[(1'h0):(1'h0)] : $unsigned(($unsigned(reg5) >>> reg7))));
  assign wire41 = $signed($signed($unsigned(((wire24 ? reg6 : wire10) * (reg6 ?
                      (8'haf) : (8'hbe))))));
  assign wire42 = wire23;
  assign wire43 = (((8'hb8) | (reg25 < (~wire24[(4'hd):(1'h1)]))) ?
                      (reg27 ?
                          ((~|wire1[(3'h6):(1'h0)]) ?
                              $unsigned({wire41,
                                  reg26}) : wire0) : (wire23 * {$unsigned(reg25)})) : wire41);
  assign wire44 = $signed((&$unsigned(wire4[(4'hb):(3'h7)])));
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  assign y = {wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = (!wire12);
  assign wire18 = (&$unsigned($unsigned($unsigned((wire16 ?
                      wire15 : wire15)))));
  assign wire19 = $signed((8'hb2));
  assign wire20 = ($signed(wire17) ?
                      $unsigned((-wire14[(4'hc):(1'h0)])) : ((^$signed(wire19)) ?
                          ($unsigned((+wire18)) <<< (^~$unsigned(wire18))) : (~&(^~(wire14 - (8'hb6))))));
endmodule
