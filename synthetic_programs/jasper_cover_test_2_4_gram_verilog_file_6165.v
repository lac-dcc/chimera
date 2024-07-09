module module_0 #(
    parameter [id_1 : id_1] id_2 = id_2,
    parameter id_3 = id_3,
    parameter id_4 = id_1
) (
    output [1 : id_3] id_5,
    input [id_5 : id_4] id_6,
    input logic id_7,
    input [id_5 : id_6] id_8,
    output [id_3 : id_6] id_9,
    output id_10,
    input id_11,
    output [id_4 : 1] id_12,
    input [id_10 : id_5] id_13,
    input logic id_14
);
  generate
    id_15 id_16 (
        .id_7 (id_14),
        .id_9 (id_8),
        .id_14(id_4),
        .id_7 (id_3),
        .id_6 (id_13),
        .id_10(1),
        .id_13(id_2)
    );
    case (id_8)
      id_5: begin : id_17
        id_18 id_19 (
            .id_2 (id_7),
            .id_11(id_1)
        );
        id_20 id_21 (
            .id_19(id_2),
            .id_5 (id_2),
            .id_3 (id_9),
            .id_9 (id_7)
        );
        assign id_4 = id_5;
        assign id_4 = id_17;
      end
      id_1: assign id_2 = id_3;
    endcase
  endgenerate
endmodule
