// Seed: 2759200591
module module_0 (
    input  tri0  id_0,
    input  tri   id_1,
    input  wire  id_2,
    input  wand  id_3,
    output logic id_4,
    input  wor   id_5,
    input  wor   id_6,
    input  wor   id_7
);
  always id_4 = #1 1;
  assign id_4 = 1'h0;
  assign id_4 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    output logic id_2
);
  always @(posedge id_0 or id_1) begin
    id_2 = 1;
    id_2 <= 1;
  end
  module_0(
      id_0, id_1, id_1, id_0, id_2, id_1, id_1, id_0
  );
  wire id_4;
endmodule
