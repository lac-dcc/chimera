module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire31;
  assign y = {wire35, wire34, wire33, wire5, wire6, wire31, (1'h0)};
  assign wire5 = (($unsigned(((-wire4) >> $signed(wire0))) << $unsigned(((^(8'had)) == (8'hb6)))) ?
                     ((wire0 ?
                             (^(&wire4)) : (wire4[(3'h4):(1'h0)] >> wire0[(3'h4):(3'h4)])) ?
                         wire3[(1'h1):(1'h0)] : {{$unsigned(wire2)},
                             wire4[(3'h4):(3'h4)]}) : wire2[(3'h6):(3'h4)]);
  assign wire6 = (wire2[(2'h2):(1'h1)] ? $unsigned(wire0) : wire1);
  module7 #() modinst32 (wire31, clk, wire5, wire3, wire4, wire2, wire1);
  assign wire33 = ((wire6 ?
                      ((wire3 & wire2[(3'h6):(3'h6)]) << (^~(|wire6))) : wire31[(2'h2):(1'h1)]) & wire31[(3'h7):(1'h1)]);
  assign wire34 = wire3[(3'h6):(3'h5)];
  assign wire35 = {(((wire31 ?
                              $signed(wire3) : $unsigned((8'hb4))) >= {wire5[(4'h9):(4'h9)]}) ?
                          wire6[(2'h2):(1'h0)] : (~$unsigned({wire33,
                              wire0})))};
endmodule

module module7
#(parameter param29 = {(!(+(((8'haa) * (8'hbe)) & ((8'ha9) + (8'hbd))))), (~&((~^(^~(8'h9e))) ? ({(7'h44)} ~^ {(8'ha7)}) : {((7'h43) ? (8'hb7) : (8'hba)), ((8'ha3) ? (7'h44) : (8'h9e))}))}, 
parameter param30 = (((8'ha1) >= param29) ? {(((param29 ? param29 : (8'hb1)) != {param29}) <<< {{(8'ha7), param29}})} : ((^~(((8'haa) ? param29 : param29) ~^ (^~param29))) | (8'hbc))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire14,
                 wire13,
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
                 (1'h0)};
  assign wire13 = (8'hac);
  assign wire14 = ((~^(({wire12, (8'hbe)} + {wire9,
                          wire12}) * $unsigned((wire13 < wire11)))) ?
                      $unsigned((~((wire9 ? wire13 : wire8) ?
                          (wire10 ?
                              wire9 : wire9) : $unsigned((8'hbf))))) : $signed(wire9));
  always
    @(posedge clk) begin
      if (wire14)
        begin
          reg15 <= (($unsigned((^~(&wire8))) && {$signed((wire8 ?
                      wire9 : wire9)),
                  $unsigned($unsigned(wire8))}) ?
              ({wire12[(3'h4):(3'h4)]} ?
                  $unsigned($unsigned((wire11 ?
                      wire13 : wire9))) : (wire13[(4'h8):(3'h6)] ^ wire13)) : {$unsigned($unsigned(wire11[(4'he):(3'h6)]))});
          reg16 <= ($signed(reg15[(1'h0):(1'h0)]) ?
              (wire9 ?
                  $signed((~|$signed(wire11))) : {(wire8[(1'h0):(1'h0)] >>> $signed(wire12)),
                      $signed($unsigned(wire9))}) : (^~((~^(wire11 ?
                  wire10 : wire10)) <= wire14[(4'he):(4'h8)])));
          reg17 <= wire8[(3'h5):(2'h3)];
          if ((|(({$signed(wire11),
              $unsigned(reg15)} >>> (reg17[(1'h0):(1'h0)] > reg16)) & (wire14 ?
              wire14[(3'h4):(2'h2)] : (~^(-wire13))))))
            begin
              reg18 <= ($signed({reg17}) ? (!reg15) : $unsigned(wire12));
              reg19 <= wire13;
              reg20 <= {$unsigned(($unsigned($signed((8'hb2))) << $signed((wire11 & wire14))))};
              reg21 <= $signed(($unsigned(wire8[(3'h5):(3'h5)]) ?
                  (~^(reg18 ?
                      (reg17 ?
                          reg16 : wire10) : $signed(wire12))) : $unsigned(((-wire10) ?
                      $unsigned(reg20) : reg20[(3'h5):(1'h1)]))));
              reg22 <= wire10[(3'h5):(2'h2)];
            end
          else
            begin
              reg18 <= wire12[(3'h4):(3'h4)];
            end
        end
      else
        begin
          reg15 <= (^~(($signed((wire12 ? (8'h9c) : (8'hbf))) ?
              (8'ha4) : reg19) >>> $unsigned($signed(reg19[(3'h7):(2'h3)]))));
        end
      reg23 <= $signed(reg18);
      reg24 <= (|(~|((~$signed(wire12)) == reg22[(2'h3):(2'h2)])));
    end
  always
    @(posedge clk) begin
      reg25 <= (8'hae);
    end
  assign wire26 = ({($signed(reg19[(3'h5):(3'h4)]) ?
                          wire14 : {(reg21 ? (8'ha7) : wire10), (~&reg17)}),
                      {$signed($unsigned(reg17)),
                          {(wire14 ?
                                  wire10 : wire12)}}} ~^ reg23[(1'h0):(1'h0)]);
  assign wire27 = wire11[(4'ha):(3'h4)];
  assign wire28 = (&(((reg16 ?
                      {reg22, wire9} : (8'had)) | (|{(8'hb9)})) > wire13));
endmodule
