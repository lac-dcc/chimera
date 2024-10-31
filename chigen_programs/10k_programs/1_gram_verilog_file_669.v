// Seed: 3614923347
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_13, id_14;
endmodule
module module_1 (
    output logic id_0
);
  initial @(posedge 1) id_0 <= id_2;
  specify
    $setup(id_3, posedge id_4, 1);
    specparam id_5 = 1'b0;
    (id_6 => id_7) = (1);
    specparam id_8 = 1'b0;
    (id_9 => id_10) = id_11;
  endspecify module_0(
      id_11, id_6, id_5, id_9, id_5, id_6, id_7, id_10, id_11, id_10, id_10, id_3
  );
  assign id_10 = id_11;
  wire id_12;
endmodule
