// Seed: 657111581
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input wor id_4,
    output tri1 id_5
);
  wire id_7, id_8;
  wire id_9;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    output tri id_2,
    output uwire id_3,
    input wire id_4,
    output supply1 id_5,
    output supply1 id_6,
    output supply0 id_7
);
  assign id_6 = id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_0,
      id_6
  );
  assign modCall_1.id_2 = 0;
  assign id_2 = -1;
  wire id_9, id_10;
  notif0 primCall (id_6, id_1, id_0);
  wire id_11;
endmodule
