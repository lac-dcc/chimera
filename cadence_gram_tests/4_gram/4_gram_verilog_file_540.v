// Seed: 2884857556
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire \id_5 ;
  wire id_6;
  id_7(
      .id_0(\id_5 )
  );
  wire \id_8 ;
  wire id_9;
  wire id_10;
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  assign id_2 = $realtime;
  xor primCall (id_6, id_1, id_3, id_2, id_8);
  wire id_9;
  wire id_10;
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10,
      id_9
  );
  specify
    (id_11 - => id_12) = (id_5  : id_11  : id_11, id_1  : $realtime : -1'b0);
  endspecify
endmodule
