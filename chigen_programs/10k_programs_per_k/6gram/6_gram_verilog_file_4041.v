// Seed: 946461193
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  specify
    if (1) (id_6 => id_7) = 1;
    (id_8 => id_9) = 1;
    specparam id_10 = id_6;
  endspecify
endmodule
module module_1 (
    output supply0 id_0,
    input  uwire   id_1,
    input  supply0 id_2
);
  supply0 id_4;
  wand id_5 = id_2;
  module_0(
      id_4, id_4, id_4, id_4, id_4
  ); specify
    (id_6 => id_7[1]) = 1;
    if (id_2 && id_4) (negedge id_8 => (id_9 +: id_9 + 1)) = (1, 1);
    (posedge id_10 => (id_11 +: 1)) = (id_11 == 1, id_6  : id_11  : 1);
    (id_12 => id_13) = 1;
  endspecify
endmodule
