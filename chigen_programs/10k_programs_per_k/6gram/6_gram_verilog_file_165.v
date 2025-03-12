// Seed: 633292436
module module_0 (
    output tri0  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    output tri1  id_3
);
  wire [1 'h0 : 1] id_5;
  wire id_6;
  wire id_7;
  ;
  logic id_8;
  assign module_1.id_0 = 0;
  assign id_6 = id_1;
endmodule
module module_1 (
    output tri0 id_0,
    input supply1 id_1,
    output tri id_2,
    input wor id_3,
    output logic id_4,
    input tri1 id_5,
    input supply0 id_6
);
  initial id_4 <= -1;
  or primCall (id_2, id_3, id_1, id_5, id_6);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_2
  );
endmodule
