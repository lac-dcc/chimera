// Seed: 3434739794
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input uwire id_2,
    output supply1 id_3,
    input supply0 id_4,
    input tri0 id_5,
    input tri id_6,
    input supply0 id_7,
    input supply0 id_8,
    output supply0 id_9,
    input tri id_10,
    input tri id_11
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input logic id_0,
    output supply0 id_1,
    output logic id_2,
    output supply1 id_3,
    input wand id_4,
    output supply1 id_5
);
  wire id_7;
  always @(posedge id_0) begin : LABEL_0
    id_2 <= id_0;
  end
  xor primCall (id_2, id_14, id_9, id_0, id_10, id_11, id_8, id_7, id_12, id_4, id_13);
  wire id_8;
  wire id_9;
  wire id_10 = id_9;
  wire id_11;
  reg  id_12;
  wire id_13;
  wire id_14;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4,
      id_4
  );
  always @(id_13) id_12 <= 1;
endmodule
