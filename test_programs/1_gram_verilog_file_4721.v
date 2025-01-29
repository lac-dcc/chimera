// Seed: 1297324515
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7, id_8;
  wire id_9;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2,
      id_3,
      id_4
  );
  id_7(
      .id_0(id_3), .id_1(id_1 + 1'b0), .id_2(id_6)
  );
  notif1 primCall (id_3, id_2, id_6);
endmodule
