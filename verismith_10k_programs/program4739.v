module top
#(parameter param80 = (~^(^{({(8'hab)} << (&(8'ha0)))})), 
parameter param81 = {param80, ((&param80) ^~ (^(~|(!param80))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire77;
  assign y = {wire79, wire5, wire6, wire7, wire77, (1'h0)};
  assign wire5 = $unsigned(((8'hb5) ^~ (~^$signed((wire4 ? wire2 : wire0)))));
  assign wire6 = $unsigned((^{wire1, (+$unsigned(wire2))}));
  assign wire7 = wire6;
  module8 #() modinst78 (.wire13(wire7), .y(wire77), .wire10(wire5), .wire11(wire3), .wire12(wire1), .clk(clk), .wire9(wire6));
  assign wire79 = (8'ha5);
endmodule

module module8
#(parameter param75 = ((&(({(8'ha9)} & ((8'h9f) >>> (8'hbc))) ? (((8'hac) ? (8'ha0) : (8'hbb)) >> (+(8'hbc))) : (~^((8'ha2) > (8'hba))))) ? (((((8'hba) || (8'hb3)) ? {(8'hab)} : ((8'hb3) ~^ (8'hae))) << ((&(7'h43)) ? ((8'ha6) ? (8'h9f) : (8'ha6)) : (&(8'ha3)))) ? ((~&((8'hba) ? (7'h41) : (8'ha3))) ? (((7'h40) < (8'hb6)) ? ((7'h41) || (8'h9d)) : ((8'hbf) ? (8'hb1) : (8'ha7))) : ({(8'h9f)} ? {(8'hbe), (7'h40)} : (^~(8'h9e)))) : (~|{((8'hbc) & (8'hac)), {(7'h40)}})) : ((~{((8'ha5) + (7'h41)), {(8'had), (7'h42)}}) ? {(((8'hb5) >> (8'ha3)) ? {(7'h41), (8'hb7)} : (-(8'hab)))} : (~&(((8'ha2) ? (8'ha5) : (8'hbb)) < (-(8'hba)))))), 
parameter param76 = (((-((~param75) ? (-param75) : {param75, param75})) >> (8'ha9)) ? (((param75 && (param75 ? (8'hb3) : param75)) ? {(param75 ^~ (8'ha8)), (~|param75)} : ({param75} ? param75 : {param75})) << (param75 ? {param75, ((8'hb7) & param75)} : param75)) : param75))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire12;
  input wire [(4'ha):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire70;
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire57,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire59,
                 wire60,
                 wire70,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire14 = (({wire9[(2'h2):(2'h2)], (wire12 && wire11)} ?
                          wire9 : (((-wire13) >> $unsigned((8'hbb))) ?
                              (8'h9e) : wire9[(4'h9):(3'h4)])) ?
                      ($signed($unsigned(wire13[(3'h7):(3'h6)])) ?
                          wire13 : wire11) : {$signed($signed((!wire10))),
                          (~$signed(wire12[(3'h4):(1'h0)]))});
  assign wire15 = $signed({((wire13[(1'h1):(1'h0)] ?
                          wire11 : wire12) <<< $signed(wire9))});
  assign wire16 = {(^(8'hb5))};
  assign wire17 = wire13;
  assign wire18 = $signed((!wire12));
  assign wire19 = ((~($signed((~|wire13)) ?
                      wire16 : $signed($unsigned(wire16)))) <= $unsigned($signed(wire14)));
  always
    @(posedge clk) begin
      reg20 <= {$unsigned((8'ha1))};
      reg21 <= wire11[(3'h4):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg22 <= $signed(wire15[(4'hd):(4'h9)]);
      reg23 <= {wire9[(4'hb):(3'h7)], reg20[(2'h3):(1'h1)]};
    end
  assign wire24 = ((^(~^$signed({(8'hb4)}))) ?
                      (~^$signed((8'hac))) : {(^{wire18[(2'h2):(1'h1)]})});
  assign wire25 = ({$unsigned((!(wire12 && reg22)))} == ($signed(({wire12,
                          wire13} ?
                      (wire17 ?
                          wire9 : wire12) : (^~(8'hb7)))) << wire12[(4'h9):(4'h9)]));
  assign wire26 = $unsigned(((|$signed((!wire18))) <<< ((^~(wire17 >> wire9)) <<< wire18)));
  assign wire27 = ($signed($signed((wire18[(1'h0):(1'h0)] == (wire19 ?
                      reg20 : wire26)))) ^~ wire9);
  module28 #() modinst58 (wire57, clk, wire10, wire13, reg23, wire25);
  assign wire59 = $unsigned(($signed((&wire14)) ?
                      wire12[(4'h9):(4'h9)] : reg21));
  assign wire60 = (wire15[(4'ha):(1'h0)] ?
                      (&(wire57 ?
                          (~$signed((8'ha9))) : $unsigned($signed(wire12)))) : $signed(wire59));
  module61 #() modinst71 (wire70, clk, reg23, wire11, wire27, wire60);
  assign wire72 = (^$unsigned(((wire57[(2'h2):(1'h0)] << (^reg20)) ?
                      $signed((~|(7'h40))) : $unsigned($unsigned((8'hba))))));
  assign wire73 = wire15[(3'h6):(2'h2)];
  assign wire74 = wire17;
endmodule

module module61  (y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire65;
  input wire [(3'h6):(1'h0)] wire64;
  input wire signed [(4'he):(1'h0)] wire63;
  input wire signed [(2'h2):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  assign y = {wire69, wire68, wire67, wire66, (1'h0)};
  assign wire66 = wire65[(3'h4):(1'h1)];
  assign wire67 = ((~|$signed($unsigned(wire65))) ? wire64 : {wire64});
  assign wire68 = ({(~$signed($unsigned(wire63)))} ?
                      $signed($signed((wire66 * wire67[(1'h1):(1'h0)]))) : (($unsigned(wire65[(3'h6):(3'h5)]) + (wire65[(2'h3):(1'h0)] ?
                          (-wire64) : {wire65, wire62})) == wire65));
  assign wire69 = wire63[(3'h6):(2'h2)];
endmodule

module module28
#(parameter param55 = (((~{(8'h9e)}) ? (~^{((8'h9e) | (8'hb3))}) : {(~&((8'hbc) ? (8'hbc) : (8'h9e))), (8'ha0)}) ? ((|(^~(^(8'ha1)))) < ((((8'h9c) ? (7'h42) : (8'hac)) ? {(8'hb5)} : ((8'hb5) >>> (8'hb4))) ? {(~(8'h9e)), ((7'h43) != (8'ha6))} : (8'hb0))) : ((8'hb2) ? (({(8'hbf)} ? ((8'ha3) ? (8'h9c) : (8'h9c)) : ((8'ha7) ? (8'ha5) : (8'hb3))) | (((8'h9c) ^ (7'h40)) ? ((8'hb4) ? (8'ha6) : (8'hb1)) : (~^(7'h41)))) : (+(((8'hbc) ? (8'hbb) : (7'h44)) < ((7'h43) ? (8'hac) : (8'hae)))))), 
parameter param56 = param55)
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire32;
  input wire [(4'hc):(1'h0)] wire31;
  input wire [(5'h14):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire34,
                 wire33,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire33 = (wire30 ? $unsigned(wire30) : wire29);
  assign wire34 = $signed({wire30});
  always
    @(posedge clk) begin
      reg35 <= ({($unsigned((wire29 << wire33)) ?
              wire34 : $signed($signed(wire30))),
          wire34} <= (-wire29));
      reg36 <= ($signed(wire30[(4'ha):(2'h3)]) ? (^(~&{(~&wire32)})) : (8'hae));
      if ({reg36})
        begin
          reg37 <= wire32;
        end
      else
        begin
          if ((!(($unsigned(wire33) ?
              ($signed(wire30) << wire32[(5'h12):(4'ha)]) : ($unsigned(wire29) ?
                  ((8'hae) ? wire30 : reg35) : {(8'hba),
                      wire33})) < (wire30[(5'h13):(5'h12)] ?
              $unsigned(reg36[(1'h1):(1'h1)]) : $unsigned(wire34)))))
            begin
              reg37 <= wire31;
              reg38 <= ((~|(&reg37[(1'h1):(1'h1)])) | $signed((^((^~wire30) >= (wire32 || wire34)))));
              reg39 <= ((((reg36[(2'h2):(2'h2)] ?
                          $unsigned(reg37) : (-wire32)) ?
                      ((reg36 == wire33) <<< (wire34 ?
                          (8'hac) : (8'hae))) : $signed((+wire34))) ?
                  wire29 : $signed(((wire34 << wire29) ?
                      $signed((8'hb6)) : reg35[(3'h5):(1'h0)]))) || ((-(&(wire30 ?
                  wire33 : wire32))) != ($signed((reg37 | wire29)) ?
                  {(!reg38)} : (^(reg36 ? reg35 : (8'ha8))))));
              reg40 <= wire30[(3'h7):(3'h4)];
            end
          else
            begin
              reg37 <= reg37[(2'h2):(1'h0)];
              reg38 <= reg38[(1'h0):(1'h0)];
              reg39 <= wire33[(3'h4):(1'h0)];
              reg40 <= ((~^(reg35 ?
                  reg40[(2'h3):(2'h3)] : ({wire32,
                      reg35} == (~^wire32)))) + ((!$signed($unsigned(wire32))) ^ $unsigned((8'hab))));
              reg41 <= $signed((~(($signed(reg36) << {(8'ha4)}) ~^ ({reg40} ?
                  wire34 : $unsigned(reg38)))));
            end
          reg42 <= reg35;
          reg43 <= wire32[(2'h2):(1'h1)];
          reg44 <= (reg37 && ($signed($unsigned((wire30 ?
              (8'hb4) : reg37))) ^~ $unsigned($signed((reg35 ?
              wire29 : reg43)))));
          reg45 <= $unsigned({$unsigned($unsigned({reg41}))});
        end
      reg46 <= reg36[(1'h1):(1'h0)];
      if (((reg44[(5'h12):(3'h7)] >> (($signed(reg43) != (reg46 ?
                  reg35 : wire30)) ?
              (|wire33[(4'he):(1'h1)]) : $signed((reg45 || reg45)))) ?
          {reg42[(4'h8):(2'h3)]} : (~$unsigned(wire31[(4'ha):(2'h3)]))))
        begin
          reg47 <= ({($unsigned((reg35 + reg40)) ?
                  $unsigned((|reg38)) : reg43[(1'h0):(1'h0)]),
              (reg35[(3'h5):(2'h2)] > ((-reg35) ?
                  {reg43} : (~(7'h40))))} >= $unsigned(wire32));
        end
      else
        begin
          reg47 <= (wire32 == ((wire29[(4'ha):(2'h2)] >= wire31[(4'hc):(4'h9)]) ?
              ((|(~reg45)) ?
                  $signed($signed(reg41)) : ((reg38 ? reg43 : reg37) ?
                      reg47 : (reg42 && reg35))) : reg38));
          reg48 <= ((^~reg35) ?
              ((reg45[(1'h0):(1'h0)] <<< (~&((8'hba) ? (8'ha9) : wire34))) ?
                  reg37[(1'h1):(1'h1)] : ($signed($unsigned(reg45)) ?
                      (~&reg39) : (reg36 ?
                          {wire33, reg44} : (reg40 ?
                              reg40 : wire32)))) : $signed($signed(reg40)));
          reg49 <= $unsigned((&(8'hb6)));
          reg50 <= reg45[(2'h2):(1'h0)];
        end
    end
  assign wire51 = $unsigned(wire30[(5'h14):(1'h1)]);
  assign wire52 = $unsigned(($signed((reg50 << $unsigned(reg50))) << $unsigned((~|wire32[(2'h3):(1'h1)]))));
  assign wire53 = wire29;
  assign wire54 = ($unsigned(wire29) < reg49);
endmodule
