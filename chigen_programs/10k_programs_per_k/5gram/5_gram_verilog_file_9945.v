// Seed: 4036332958
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input wire id_2,
    input supply1 id_3
);
  wire id_5 = id_5;
  assign id_5 = -1'b0;
  assign module_1.id_13 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd26,
    parameter id_23 = 32'd66
) (
    input tri0 _id_0,
    output supply1 id_1,
    input tri1 id_2,
    input supply0 id_3,
    output supply0 id_4,
    input tri id_5,
    output tri1 id_6,
    inout tri1 id_7,
    output logic id_8,
    input supply1 id_9,
    input uwire id_10,
    output logic id_11
    , id_25,
    input tri1 id_12,
    output logic id_13,
    output logic id_14,
    output wor id_15,
    input wor id_16,
    input supply0 id_17,
    input wor id_18,
    input wor id_19,
    input wire id_20,
    input tri0 id_21,
    input wand id_22,
    input wor _id_23
);
  parameter id_26 = 1;
  localparam id_27 = -1;
  wire id_28;
  assign id_4 = id_27;
  module_0 modCall_1 (
      id_20,
      id_20,
      id_5,
      id_9
  );
  reg [-1 : id_23] id_29;
  xnor primCall (
      id_7, id_10, id_21, id_3, id_16, id_27, id_25, id_12, id_18, id_26, id_2, id_19, id_20, id_28
  );
  always begin : LABEL_0
    {1, id_25, -1, id_18 == id_22, 1, -1} = 1;
    id_11 = id_25;
    `define pp_30 0
    id_13 = id_5 >= id_18;
    id_29 = -1;
    id_14 = id_29;
    $clog2(31);
    ;
    id_8 <= id_26[(id_0)];
  end
endmodule
