// Seed: 4241516555
module module_0 (
    input wor id_0,
    output wire id_1,
    input supply0 id_2,
    output wire id_3,
    output tri id_4,
    input supply1 id_5,
    input wand id_6,
    output tri0 id_7,
    input tri1 id_8,
    output wire id_9,
    input supply0 id_10,
    output supply0 id_11,
    input wire id_12,
    output supply1 id_13,
    input uwire id_14
);
  wire id_16;
  wire id_17;
  assign module_1.id_0 = 0;
  assign id_7 = 1;
  wire id_18;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    output tri id_2,
    output logic id_3,
    input supply0 id_4,
    output uwire id_5
);
  always @(posedge {1{id_4}}) begin : LABEL_0
    id_3 <= id_0;
  end
  module_0 modCall_1 (
      id_4,
      id_5,
      id_0,
      id_1,
      id_2,
      id_0,
      id_4,
      id_5,
      id_4,
      id_5,
      id_4,
      id_1,
      id_0,
      id_1,
      id_4
  );
endmodule
