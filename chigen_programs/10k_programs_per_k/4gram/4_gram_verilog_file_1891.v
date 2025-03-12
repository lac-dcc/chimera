// Seed: 1015146275
module module_0 (
    output uwire id_0,
    output tri0 id_1,
    input uwire id_2,
    input supply1 id_3,
    input supply1 id_4,
    output supply0 module_0,
    output supply1 id_6,
    input supply1 id_7
    , id_15,
    output tri0 id_8
    , id_16,
    input supply1 id_9,
    output tri id_10,
    input supply0 id_11,
    output uwire id_12,
    output tri0 id_13
);
  specify
    (id_17 => id_18) = (id_4, id_16[-1] : id_17  : ~id_4);
    if (-1 - -1) (negedge id_19 => (id_20 +: id_15)) = (id_15  : id_7  : id_7,
                                                        id_19  : id_4  : 1 - 1);
    (id_21 => id_22) = (1, -1);
  endspecify
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd30
) (
    input uwire _id_0,
    output supply0 id_1,
    input tri id_2
);
  wire [id_0 : 1 'b0] id_4;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1
  );
endmodule
