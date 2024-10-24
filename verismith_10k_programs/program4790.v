module top
#(parameter param27 = ({((((8'hba) ? (8'ha2) : (8'hba)) != (8'ha4)) * ((^(8'hb6)) ? ((8'hb8) ? (8'hb6) : (8'ha7)) : {(8'hac), (8'hb8)})), ((+{(8'ha4), (8'hb5)}) ? (~((8'hb0) ? (8'hb4) : (8'ha7))) : (((8'ha8) && (8'h9f)) ^ (+(8'ha8))))} ? (&(-(((8'hb7) ? (8'hbe) : (8'hac)) ^~ {(8'hb8)}))) : (~|((((7'h44) && (8'hb8)) ? {(8'ha2), (8'hb1)} : {(8'ha7)}) ? (((8'ha1) ? (8'hae) : (8'hbe)) ? {(8'hbd)} : (8'hac)) : (~^((8'h9c) ? (8'had) : (8'had)))))), 
parameter param28 = param27)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ({(~wire3)} <<< wire1[(1'h1):(1'h1)]);
  assign wire5 = (-$unsigned(($signed((wire0 <= wire3)) ?
                     ($unsigned(wire4) - wire0) : ((|wire3) ?
                         wire1[(2'h3):(2'h2)] : (&wire3)))));
  assign wire6 = ({wire0[(3'h6):(3'h4)]} | wire2[(4'he):(4'h8)]);
  assign wire7 = (wire2[(4'hf):(3'h4)] | wire4);
  assign wire8 = ((~(~^(wire1 ? (8'hbd) : {wire0}))) >> $signed(wire2));
  always
    @(posedge clk) begin
      if ((8'had))
        begin
          reg9 <= $signed($signed($signed(wire5)));
          reg10 <= (-wire4);
        end
      else
        begin
          reg9 <= ($signed($unsigned($unsigned($signed(wire6)))) ~^ {(!$unsigned($unsigned(wire5))),
              (^~(|(wire2 ? wire1 : wire7)))});
          reg10 <= wire8;
          reg11 <= $unsigned($signed((({(8'hbf), wire0} ?
                  wire0[(2'h3):(1'h1)] : $signed((8'hb2))) ?
              (7'h44) : {(-reg9)})));
          reg12 <= wire6;
          reg13 <= (({$signed(reg12)} ?
                  $signed($signed($signed(wire4))) : (^~wire0[(1'h0):(1'h0)])) ?
              (~^{(|{(8'hb1), wire1})}) : $unsigned(reg11));
        end
    end
  assign wire14 = wire2;
  assign wire15 = wire0;
  assign wire16 = $unsigned($signed((!wire0[(1'h0):(1'h0)])));
  assign wire17 = $signed($signed(({(wire7 ?
                          wire4 : wire0)} ^~ $signed(reg9))));
  assign wire18 = (^($unsigned($unsigned((wire3 ? wire17 : wire8))) << wire6));
  always
    @(posedge clk) begin
      reg19 <= ((&$signed(reg9[(4'h8):(2'h2)])) && $unsigned($unsigned(((wire0 * wire5) <<< (|wire14)))));
      reg20 <= (($unsigned(wire3[(4'h9):(3'h7)]) ?
          (((wire16 || wire4) ? $signed(wire5) : $signed(wire16)) ?
              (wire4 ?
                  (~^(8'hbe)) : $signed(wire8)) : $unsigned($unsigned(wire1))) : $signed($signed((wire6 ?
              wire1 : reg10)))) >> $unsigned($signed($unsigned({wire7,
          wire6}))));
    end
  assign wire21 = {(!$unsigned($signed(reg11[(2'h2):(2'h2)]))), reg10};
  assign wire22 = $signed((reg19 ?
                      wire0[(4'h9):(3'h4)] : (^~wire17[(4'hb):(4'ha)])));
  assign wire23 = wire22;
  assign wire24 = (($unsigned($signed(wire17)) ?
                          $unsigned(((wire21 <<< (8'ha8)) | $signed(reg13))) : (^~$unsigned(wire21[(5'h11):(1'h0)]))) ?
                      reg20 : wire3[(5'h10):(4'h9)]);
  assign wire25 = (~|(8'ha0));
  assign wire26 = (+(8'hb9));
endmodule
