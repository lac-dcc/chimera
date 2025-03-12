// Seed: 2821772346
macromodule module_0 #(
    parameter id_8 = 32'd20,
    parameter id_9 = 32'd46
) (
    input tri id_0,
    input tri id_1,
    output supply1 id_2,
    output wor id_3,
    input wire id_4,
    output supply0 id_5,
    output tri id_6
);
  wire _id_8;
  wire [id_8 : 1] _id_9;
  logic id_10 = id_9;
  logic id_11, id_12;
  struct packed {logic [id_9 : 1] id_13;} id_14;
  logic id_15;
  ;
  localparam id_16 = 1;
  wire id_17, id_18;
  wire id_19, id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28, id_29;
  if (id_16 << id_16) wire id_30;
  else begin : LABEL_0
    wire id_31;
  end
  wire id_32;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input uwire id_2,
    output tri id_3
    , id_9,
    output tri id_4,
    input wor id_5,
    output supply0 id_6,
    output supply0 id_7
);
  always_ff id_9 = -1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_3,
      id_5,
      id_3,
      id_6
  );
endmodule
