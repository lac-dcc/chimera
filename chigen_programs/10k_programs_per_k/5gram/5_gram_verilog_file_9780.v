// Seed: 1807500212
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  assign module_1.id_1 = 0;
  output wire id_2;
  output wire id_1;
  wire [1 : -1] id_7;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input wor id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
module module_2 #(
    parameter id_3 = 32'd23
) (
    input tri0 id_0,
    inout supply1 id_1,
    output tri1 id_2,
    input uwire _id_3,
    output tri0 id_4,
    input wor id_5,
    input supply1 id_6,
    input supply1 id_7
    , id_14,
    input supply1 id_8,
    input uwire id_9,
    input tri id_10,
    output tri1 id_11,
    output supply1 id_12
);
  logic id_15 = 1 == 1;
  struct packed {
    logic id_16;
    logic id_17;
  } [-1 : id_3] id_18;
  assign id_18[1] = id_5 == -1;
  bit id_19;
  ;
  nor primCall (
      id_2, id_17, id_5, id_10, id_7, id_18, id_1, id_6, id_19, id_15, id_9, id_0, id_16, id_8
  );
  module_0 modCall_1 (
      id_15,
      id_15,
      id_15,
      id_15,
      id_14,
      id_14
  );
  generate
    always @("" or posedge -1) begin : LABEL_0
      id_19 <= id_5;
    end
  endgenerate
endmodule
