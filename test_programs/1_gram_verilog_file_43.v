// Seed: 2922862131
module module_0 (
    input tri0 id_0,
    input tri1 id_1
);
  wire id_3;
  assign id_4 = -1;
  module_2 modCall_1 (
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_1 = 0;
  wire id_5;
  wire id_6;
  wire id_7, id_8;
  assign module_1.id_1 = 0;
  assign id_4 = id_0;
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    input tri0 id_2,
    output logic id_3,
    output uwire id_4,
    input supply0 id_5
);
  assign id_4 = -1;
  bufif0 primCall (id_4, id_2, id_1);
  initial id_3 <= !id_1;
  module_0 modCall_1 (
      id_2,
      id_0
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  final
  fork
    if (id_2) id_1 = 1;
    else id_1 = -1 || {id_3 && (id_3) {1'b0}};
  join
  wor id_4, id_5, id_6;
  assign id_4 = 1'b0;
endmodule
