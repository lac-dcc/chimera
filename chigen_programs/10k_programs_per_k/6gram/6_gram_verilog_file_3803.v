// Seed: 3898235709
module module_0 (
    output wor  id_0,
    input  tri  id_1,
    output tri1 id_2
);
  assign id_0 = id_1;
  wire id_4;
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    output wor   id_2,
    output logic id_3
);
  module_0(
      id_2, id_0, id_2
  );
  always @(posedge id_1 or negedge 1)
    for (id_3 = id_0; id_1 < 1; id_2 = 1) begin
      id_3 <= 1;
    end
  always @(posedge (1'b0))
    case (id_0)
      id_1: id_2 = 1 - (1);
      id_0: id_3 = 1;
      1'b0: id_2 = 1'b0 < 1;
      1'b0: id_3 <= 1;
    endcase
endmodule
