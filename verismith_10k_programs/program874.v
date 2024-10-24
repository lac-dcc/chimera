module top
#(parameter param29 = {(((~|(~^(8'hb5))) ? ((-(8'ha8)) ? (^~(8'ha4)) : (+(8'hab))) : (~{(7'h43), (8'h9f)})) ? ((~|((8'hb4) < (8'hb7))) ? (8'ha0) : (+((8'hb3) > (8'hb7)))) : (((^~(8'hb8)) | ((8'ha2) ? (8'hba) : (7'h40))) ? (((8'hb9) ? (8'hb3) : (8'ha9)) ^ ((8'h9c) | (8'hac))) : (8'hb6))), ((((~|(8'hba)) ? ((8'hb8) || (7'h41)) : ((8'hb3) ? (8'h9d) : (8'hbf))) || (+((8'hbd) ^ (8'h9e)))) ? (~|{((8'haa) || (8'ha9))}) : (~|({(8'hab)} || ((8'had) * (8'hb8)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  assign y = {wire28,
                 wire25,
                 wire17,
                 wire16,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg27,
                 reg26,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = wire1[(5'h10):(4'h8)];
  assign wire5 = $unsigned($unsigned($unsigned((wire0[(4'h9):(3'h5)] ^~ (wire0 ?
                     wire2 : wire3)))));
  assign wire6 = wire1[(1'h0):(1'h0)];
  assign wire7 = wire0;
  assign wire8 = {wire6[(2'h2):(2'h2)]};
  assign wire9 = $signed(wire4[(4'h8):(3'h6)]);
  assign wire10 = (wire2[(4'hb):(3'h4)] & {(+wire0[(4'h8):(1'h0)])});
  assign wire11 = wire4[(4'ha):(3'h7)];
  always
    @(posedge clk) begin
      reg12 <= $signed((|wire2));
      reg13 <= $signed((wire11 ? (!wire1) : (|(^~(^wire4)))));
      reg14 <= wire6;
      reg15 <= wire7;
    end
  assign wire16 = (wire5 ?
                      wire5 : ((((wire5 - wire10) >= (reg14 ?
                              reg12 : wire5)) && $signed((wire11 ?
                              wire1 : wire0))) ?
                          reg13[(3'h4):(2'h2)] : reg12[(2'h3):(2'h3)]));
  assign wire17 = $unsigned(wire6[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      if ((reg15 ? $unsigned(wire9[(1'h0):(1'h0)]) : {wire9}))
        begin
          reg18 <= (~|(~|reg15[(3'h6):(3'h4)]));
        end
      else
        begin
          reg18 <= $unsigned(($signed((~&reg13)) ?
              reg14[(4'ha):(4'h9)] : $unsigned(reg18[(3'h4):(3'h4)])));
          reg19 <= $unsigned(wire5);
          reg20 <= $signed($signed($signed($unsigned(wire7))));
          reg21 <= {($unsigned($unsigned($unsigned(wire10))) ~^ {($signed(reg12) || wire9),
                  (~&$signed(wire1))}),
              {((&(&(8'had))) == ((wire6 >> reg20) ?
                      (~&wire5) : (wire17 ? (8'had) : wire4))),
                  reg12[(3'h5):(3'h5)]}};
          if ($signed((wire7 && ((wire5[(4'ha):(4'h8)] << (^(8'hba))) ?
              reg14[(1'h0):(1'h0)] : $signed((wire8 ? wire4 : reg20))))))
            begin
              reg22 <= ((~wire6[(1'h0):(1'h0)]) ?
                  wire11[(2'h3):(1'h1)] : wire7);
            end
          else
            begin
              reg22 <= reg22;
              reg23 <= ($unsigned(wire17[(5'h13):(4'hd)]) >= (~(wire2[(4'h8):(1'h1)] ?
                  wire1[(2'h2):(2'h2)] : $signed(((7'h42) ? wire17 : wire0)))));
              reg24 <= {wire5[(1'h1):(1'h0)]};
            end
        end
    end
  assign wire25 = $unsigned($unsigned($unsigned({$signed(wire8)})));
  always
    @(posedge clk) begin
      reg26 <= (7'h41);
      reg27 <= wire5;
    end
  assign wire28 = ($unsigned($signed((wire10[(4'h8):(3'h7)] == $signed(wire10)))) && ((|((reg20 ?
                              wire8 : reg27) ?
                          (reg12 << reg24) : (~|(8'haf)))) ?
                      wire2[(1'h1):(1'h1)] : wire1));
endmodule
