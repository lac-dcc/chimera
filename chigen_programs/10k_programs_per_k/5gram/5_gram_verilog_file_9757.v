// Seed: 514462689
module module_0 (
    output tri0 id_0,
    input wire id_1,
    input tri1 id_2,
    input uwire id_3,
    input tri id_4,
    input supply1 id_5,
    output supply1 id_6,
    input wand id_7,
    input uwire id_8
);
  wire id_10;
  tri1 id_11 = 1;
  wire id_12;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input tri id_0,
    output tri0 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input tri1 id_4,
    output logic id_5,
    input supply1 id_6
);
  supply1 id_8 = 1;
  assign id_8 = id_4 ? 1 : {id_2 == id_8, id_8};
  reg id_9;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_1,
      id_6,
      id_3
  );
  always_comb @(posedge {
    1,
    id_3 - id_6
  } or posedge id_3)
    if (1)
      if (1'b0) id_9 <= 1;
      else begin : LABEL_0
        id_5 <= id_9;
      end
endmodule
