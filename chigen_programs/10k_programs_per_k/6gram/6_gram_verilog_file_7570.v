// Seed: 4018976504
module module_0 (
    input tri1 id_0,
    output logic id_1
    , id_6,
    input uwire id_2,
    output supply0 id_3,
    output tri0 id_4
);
  wire id_7;
  wire id_8;
  always @(posedge (id_7 + -1)) begin : LABEL_0
    id_1 <= -1;
  end
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    input wor id_2,
    output supply1 id_3,
    output supply0 id_4,
    input wire id_5,
    output wire id_6,
    output uwire id_7,
    input supply0 id_8,
    input tri id_9,
    input tri id_10,
    output tri0 id_11,
    output uwire id_12,
    output tri1 id_13,
    input tri1 id_14,
    output supply1 id_15
);
  logic id_17;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_12,
      id_15
  );
  assign modCall_1.id_0 = 0;
  always repeat (id_8[-1'd0]) id_1 = #1 id_10;
endmodule
