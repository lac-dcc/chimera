`celldefine
module module_0 #(
    parameter id_1 = id_1,
    parameter id_2 = id_2,
    parameter id_3 = id_3[1],
    parameter id_4 = id_1,
    parameter id_5 = id_2,
    parameter id_6 = id_5,
    parameter logic id_7 = id_4,
    parameter id_8 = id_4
) (
    output logic id_9,
    output logic [id_3 : id_8] id_10,
    input logic [id_8 : id_3] id_11,
    output [id_6 : id_8] id_12,
    input logic id_13,
    output [id_1 : id_12] id_14,
    input id_15,
    input [id_15 : id_9] id_16,
    input [id_12 : id_8[1]] id_17,
    input logic [id_16 : id_9] id_18
);
  id_19 id_20 (
      .id_11(id_7),
      .id_12(id_7),
      .id_13(id_12),
      .id_14(id_18)
  );
  id_21 id_22 (
      .id_11(id_18),
      .id_18(id_2)
  );
  id_23 id_24 (
      .id_4 (id_12),
      .id_22(id_14),
      .id_5 (id_5),
      .id_6 (id_3)
  );
endmodule
