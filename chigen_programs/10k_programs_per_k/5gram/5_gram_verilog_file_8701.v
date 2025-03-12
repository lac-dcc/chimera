// Seed: 1936272841
module module_0 (
    input tri id_0,
    input wor id_1,
    output supply0 id_2,
    input tri0 id_3,
    input tri id_4,
    output tri0 id_5,
    input tri id_6,
    input wor id_7
);
  wire id_9;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    input  wand  id_0,
    input  tri0  id_1,
    output logic id_2,
    output logic id_3,
    output logic id_4,
    input  wand  id_5,
    output logic id_6,
    input  wire  id_7,
    input  wor   id_8,
    input  wand  id_9,
    output tri   id_10,
    input  uwire id_11,
    output wor   id_12,
    input  wand  id_13,
    input  uwire id_14
);
  always @(-1 or posedge -1) begin : LABEL_0
    id_6 <= -1'b0;
    begin : LABEL_1
      id_4 = 1'h0;
      disable id_16;
      id_2 <= id_0 !=? -1;
    end
    id_3 <= id_8;
  end
  module_0 modCall_1 (
      id_8,
      id_11,
      id_12,
      id_13,
      id_9,
      id_12,
      id_7,
      id_5
  );
endmodule
