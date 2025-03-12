// Seed: 1452351104
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    output tri0 id_4,
    output tri id_5,
    input tri1 id_6,
    output tri0 id_7
);
  wire id_9;
  wor id_10, id_11;
  wire [1 : -1] id_12, id_13;
  logic id_14;
  ;
  assign id_11 = 1'd0 + -1;
endmodule
module module_1 #(
    parameter id_0  = 32'd50,
    parameter id_1  = 32'd84,
    parameter id_2  = 32'd58,
    parameter id_25 = 32'd20,
    parameter id_4  = 32'd24,
    parameter id_5  = 32'd22,
    parameter id_8  = 32'd69,
    parameter id_9  = 32'd96
) (
    input tri0 _id_0,
    input wand _id_1,
    input wire _id_2,
    input uwire void id_3,
    input wor _id_4,
    input uwire _id_5,
    input supply0 id_6,
    output wire id_7,
    output tri0 _id_8,
    input wand _id_9
);
  union {
    id_11 id_12;
    logic [id_1 : -1] id_13;
    logic id_14;
    struct packed {
      struct packed {
        id_15 id_16;
        id_17 [id_5 : id_9] id_18;
        logic id_19;
      } id_20[!  -1 'b0 &  1 : id_9  ?  id_1 : id_4  &  (  id_9  )];
      logic id_21;
      logic id_22;
    } id_23;
  } id_24;
  ;
  wire [id_5 : -1] _id_25[id_0 : 1  -  id_2], id_26;
  logic id_27[id_25 : id_8];
  ;
  wand id_28, id_29 = 1;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_3,
      id_6,
      id_7,
      id_7,
      id_3,
      id_7
  );
  assign modCall_1.id_5 = 0;
  assign id_24.id_21 = -1;
endmodule
