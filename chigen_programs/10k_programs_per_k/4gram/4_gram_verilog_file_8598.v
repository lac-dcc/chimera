// Seed: 2963617794
module module_0 (
    output tri1  id_0,
    output logic id_1
);
  initial begin
    id_1 <= id_3[1-1];
  end
endmodule
module module_1 (
    input  wand  id_0,
    output tri   id_1,
    input  logic id_2,
    input  uwire id_3,
    input  uwire id_4,
    input  wor   id_5,
    output wor   id_6,
    output wire  id_7,
    output logic id_8
);
  wor id_10;
  module_0(
      id_6, id_8
  );
  supply0 id_11;
  wire id_12;
  always #1 id_10 = id_11;
  always @(posedge id_3 or posedge !id_10) begin
    #1;
    id_8 = #id_13 id_2;
  end
  wire id_14;
  wire id_15;
  generate
    assign id_1 = 1;
  endgenerate
endmodule
