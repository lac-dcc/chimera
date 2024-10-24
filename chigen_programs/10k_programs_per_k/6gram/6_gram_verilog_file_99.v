// Seed: 746332184
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output id_6;
  output id_5;
  output id_4;
  inout id_3;
  output id_2;
  input id_1;
  `define pp_6 0
  assign id_2 = id_1 || 1;
  assign id_4 = 1;
  reg id_7;
  always @(posedge `pp_6 or negedge 1) begin
    if (1) begin
      id_3 <= #id_7{id_3, 1 & id_7 & `pp_6} ? 1'h0 : `pp_6;
      SystemTFIdentifier(id_7);
      id_6 <= 1'h0;
      id_3 <= 1'b0;
    end else id_7 <= 1;
  end
endmodule
