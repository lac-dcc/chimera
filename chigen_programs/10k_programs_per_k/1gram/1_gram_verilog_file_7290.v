// Seed: 4290040744
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  union packed {logic id_5;} id_6;
  wire id_7;
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd81,
    parameter id_1 = 32'd75
) (
    input wire _id_0,
    input supply0 _id_1
);
  union packed {
    struct packed {
      logic [-1 : -1] id_3;
      logic id_4;
      logic id_5;
      id_6 id_7;
    } id_8 = 1;
    logic id_9 = "";
    id_10 id_11;
    logic id_12[id_0  .  id_1 : 1 'b0];
  } id_13;
  assign id_13.id_9 = id_13.id_9;
  assign id_13.id_3 = id_13.id_12;
  module_0 modCall_1 (
      id_13,
      id_5,
      id_8,
      id_5
  );
endmodule
