// Seed: 968015731
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  supply1 id_3, id_4 = 1;
  supply0 id_5;
  assign id_3 = id_5;
  assign module_2.id_1 = 0;
  wire id_6;
  assign #1 id_5 = id_4 ? 1 : id_3;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1 - (id_1[1]);
  module_0 modCall_1 (
      id_2,
      id_2
  );
endmodule
module module_2 ();
  assign id_1 = id_1 * id_1;
  supply0 id_2;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  assign id_1 = id_2;
endmodule
