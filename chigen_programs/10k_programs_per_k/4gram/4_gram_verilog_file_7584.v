// Seed: 4271718501
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3 = id_2;
  specify
    $setup(id_4, negedge id_5, 1 == 1);
    (id_6, id_7 => id_8) = 1;
    (id_9[1] => id_10) = 1;
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  specify
    (id_11 => id_12) = (id_1  : id_10  : id_10, 1  : id_12  : 1);
    (posedge id_13 => (id_14 +: id_8)) = (id_10, 1);
  endspecify module_0(
      id_3, id_11
  );
endmodule
