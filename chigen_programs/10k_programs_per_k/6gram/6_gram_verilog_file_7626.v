// Seed: 24161299
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output tri id_2,
    output supply1 id_3
);
  assign id_3 = 1'h0;
  assign module_1.id_0 = 0;
  wire id_5;
  wire id_6;
  wire id_7;
  wire id_8;
  tri  id_9 = 1'b0;
  assign id_8 = id_6;
endmodule
module module_1 (
    input tri1 id_0,
    input logic id_1,
    output supply0 id_2,
    input supply0 id_3,
    input tri id_4,
    output logic id_5,
    output tri1 id_6,
    input tri id_7
);
  always id_5 <= #id_4 id_1;
  nor primCall (id_5, id_3, id_7, id_4);
  module_0 modCall_1 (
      id_7,
      id_0,
      id_6,
      id_2
  );
endmodule
