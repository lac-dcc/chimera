// Seed: 2897598893
module module_0 (
    output tri0 id_0,
    output wire id_1,
    input supply1 id_2,
    output tri0 id_3
);
  assign id_1 = (id_2);
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    input tri0 id_2,
    input uwire id_3,
    output tri id_4,
    output logic id_5,
    input supply1 id_6,
    output uwire id_7,
    input tri1 id_8
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_1,
      id_7
  );
  always @(posedge 1 or negedge 1) id_5 <= #1 1;
endmodule
