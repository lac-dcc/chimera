// Seed: 2293499632
module module_0 (
    input uwire id_0,
    output wire id_1,
    input tri id_2,
    input supply1 id_3,
    output tri id_4,
    output tri0 id_5
);
  wire id_7;
  assign module_1.type_4 = 0;
  wire id_8;
  logic [7:0] id_9;
  assign id_9[1] = 1;
  assign id_5 = 1;
  always @(posedge id_0) force id_7 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output logic id_2,
    input tri id_3,
    output uwire id_4,
    input tri1 id_5,
    input wor id_6,
    input supply1 id_7,
    output uwire id_8
);
  always @(posedge 1) id_2 = #1  ~id_1;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_1,
      id_3,
      id_4,
      id_8
  );
endmodule
