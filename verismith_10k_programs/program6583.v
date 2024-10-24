module top
#(parameter param41 = {(~((((8'ha0) ? (8'hb8) : (8'hae)) ? ((8'ha4) ? (8'hbb) : (8'hae)) : ((8'ha8) >= (8'hbe))) ? (&(^(7'h44))) : ((-(8'hae)) ? {(8'h9e)} : {(8'h9c), (8'hbf)})))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire38, wire7, wire6, wire5, reg40, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(wire3);
    end
  assign wire5 = ((wire3 ?
                     ($unsigned((8'hb0)) ?
                         wire0[(3'h5):(3'h4)] : (wire2 <<< $unsigned((8'hbd)))) : $unsigned((^(|(8'hbc))))) != (wire1 && wire0));
  assign wire6 = (~&(^~$signed((!wire5))));
  assign wire7 = (wire3[(2'h2):(2'h2)] < ($signed(wire3) ?
                     {(&wire3[(3'h6):(3'h4)]), wire2} : wire5[(3'h4):(2'h3)]));
  module8 #() modinst39 (.wire10(wire2), .wire11(wire7), .wire12(wire6), .wire9(wire0), .y(wire38), .clk(clk));
  always
    @(posedge clk) begin
      reg40 <= $unsigned($unsigned(($unsigned((wire1 ? wire3 : wire3)) ?
          wire7 : wire5)));
    end
endmodule

module module8
#(parameter param37 = (((^(((8'hb8) ? (7'h44) : (8'h9f)) && ((7'h42) * (7'h42)))) ~^ (7'h42)) > ((^~(8'ha5)) ? ((~|(^~(8'hb5))) ? (((8'had) ? (8'ha9) : (8'hbc)) & (!(8'hb2))) : ((&(8'had)) - ((8'hb3) <= (8'haf)))) : ((((8'hb0) << (7'h41)) ? (~^(8'h9c)) : (~|(8'hb2))) | ((!(8'hba)) >= ((8'hb5) ? (8'hbf) : (8'ha0)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire11;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 reg36,
                 reg35,
                 reg34,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= (+wire12);
      if ($unsigned((~&(((wire9 || reg13) <= $signed(wire12)) ^ $signed($signed(wire11))))))
        begin
          reg14 <= {$unsigned((wire12 * ((wire9 > reg13) * (wire11 - reg13))))};
          if (($unsigned({wire9}) * $unsigned(($signed(reg13) || (~&((8'hba) ?
              wire9 : reg14))))))
            begin
              reg15 <= wire12[(1'h1):(1'h0)];
              reg16 <= reg14;
              reg17 <= $unsigned({(8'hb3)});
              reg18 <= {wire10};
              reg19 <= $signed(reg16[(3'h4):(1'h1)]);
            end
          else
            begin
              reg15 <= (^(reg19 ?
                  $signed($signed((~|wire10))) : (({reg13} || (wire10 ?
                          reg14 : reg13)) ?
                      wire10 : (wire11[(4'h9):(2'h2)] == $unsigned(reg19)))));
              reg16 <= reg19[(4'hb):(3'h4)];
              reg17 <= $unsigned(($signed(wire9) << wire9));
            end
          if ((!reg13))
            begin
              reg20 <= $unsigned(wire10);
            end
          else
            begin
              reg20 <= (reg18 ? reg15[(4'hb):(1'h0)] : wire11[(3'h4):(1'h1)]);
              reg21 <= reg15[(4'h9):(4'h9)];
              reg22 <= $unsigned(($unsigned((~^((8'hbe) ? wire12 : wire11))) ?
                  ({reg19[(4'h8):(1'h1)]} ^~ ($unsigned(reg19) ^ (reg17 <= wire9))) : $unsigned(wire12)));
            end
          reg23 <= (-$signed(reg20[(3'h6):(2'h3)]));
          if ($unsigned($signed($signed($signed($unsigned((8'ha9)))))))
            begin
              reg24 <= $signed((((~$signed(reg18)) ^ wire10) ?
                  reg16[(4'h9):(2'h3)] : $signed(((^~wire9) >= {reg15}))));
            end
          else
            begin
              reg24 <= ($unsigned(reg17[(4'ha):(3'h7)]) + {((|(~reg16)) ?
                      ($unsigned(wire9) >>> (reg18 ?
                          (8'h9c) : reg15)) : (!(wire11 ? reg17 : (8'hbd))))});
              reg25 <= $signed(reg23[(1'h1):(1'h1)]);
              reg26 <= reg22;
              reg27 <= reg18;
            end
        end
      else
        begin
          if ((~^(8'ha8)))
            begin
              reg14 <= ((^~(((^wire11) ?
                  (wire12 ?
                      reg16 : reg20) : $signed(reg20)) * $unsigned($signed(reg17)))) != reg19);
              reg15 <= $unsigned($signed($unsigned((~^reg18[(1'h0):(1'h0)]))));
              reg16 <= $unsigned((reg23 ?
                  wire12[(5'h10):(3'h7)] : $signed(((reg26 & (8'hbd)) > $signed((8'hbe))))));
              reg17 <= (reg23[(3'h7):(3'h6)] ?
                  $unsigned($signed($signed(reg20[(1'h1):(1'h1)]))) : ($unsigned({$signed(reg27),
                          wire10[(3'h5):(3'h5)]}) ?
                      (~$unsigned((reg23 ? reg27 : (8'hab)))) : wire12));
              reg18 <= (reg13[(3'h5):(2'h2)] == reg26);
            end
          else
            begin
              reg14 <= $signed(((((~wire11) ? (+(8'hb1)) : ((8'hab) == reg24)) ?
                  reg18 : reg16) != {(^~(reg27 <= wire11))}));
              reg15 <= reg16;
            end
        end
      reg28 <= reg19[(4'hd):(4'hc)];
      reg29 <= (~^(!$unsigned(reg17)));
      reg30 <= {reg22[(4'h9):(4'h8)]};
    end
  assign wire31 = (~(8'hbd));
  assign wire32 = $unsigned(reg23);
  assign wire33 = (((|(~|(^~(8'haf)))) ?
                          $unsigned($signed(reg28[(2'h3):(2'h3)])) : ((!(reg19 ?
                              reg30 : wire12)) & (wire9 ?
                              reg17 : {wire9, reg14}))) ?
                      {reg20[(4'ha):(3'h7)],
                          (($unsigned(reg22) ?
                              (~&reg19) : reg27) + (^(|wire12)))} : ((^~($unsigned((8'ha1)) ?
                          $unsigned((7'h43)) : reg19)) >>> (({reg30} < (reg27 >>> reg23)) << reg20)));
  always
    @(posedge clk) begin
      reg34 <= wire11[(4'h9):(1'h1)];
      reg35 <= (-{(~$signed(((7'h44) ? reg26 : wire10))),
          $unsigned(($unsigned(reg20) || (+reg16)))});
      reg36 <= ((8'had) ?
          (8'hb3) : (-({(reg19 & reg17)} ?
              reg17 : {wire9, ((8'hae) * (8'haf))})));
    end
endmodule
