// Seed: 382264043
module module_0 #(
    parameter id_13 = 32'd2
) (
    output uwire id_0,
    output tri0 id_1,
    input uwire id_2,
    input wire id_3,
    input wand id_4,
    input supply1 id_5,
    input supply1 id_6,
    input wor id_7
);
  reg id_9 = id_3, id_10, id_11;
  wire id_12, _id_13;
  logic [1 : -1] id_14;
  ;
  assign id_10 = id_12;
  struct packed {
    logic id_15;
    logic [-1 : id_13] id_16;
    integer id_17;
  } [-1 'b0 : 1  |  -1 'b0] id_18;
  initial begin : LABEL_0
    assign id_11 = -1'b0;
    id_11 <= id_7;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input uwire id_2,
    output supply0 id_3,
    input supply1 id_4
);
  if (1) begin : LABEL_0
    logic id_6;
  end else begin : LABEL_1
    wire id_7;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_4,
      id_0,
      id_1,
      id_0,
      id_4
  );
endmodule
