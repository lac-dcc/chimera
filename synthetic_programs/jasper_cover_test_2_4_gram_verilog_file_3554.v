module module_0 (
    input logic id_1,
    inout [~  id_1 : 1 'b0] id_2,
    input logic id_3,
    input id_4,
    output id_5,
    input [id_4 : id_3] id_6,
    output id_7,
    input [id_2 : id_6] id_8,
    output id_9,
    input [id_2 : id_8] id_10
);
  id_11 id_12 (
      .id_5 (id_8),
      .id_10(id_3)
  );
  id_13 id_14 (
      .id_5 (id_10),
      .id_5 (id_1),
      .id_2 (id_6[id_8 : id_8]),
      .id_1 (id_4),
      .id_9 (id_3),
      .id_10(id_10),
      .id_10(id_5)
  );
  id_15 id_16 (
      .id_3 (id_9),
      .id_4 (id_1),
      .id_14(id_4)
  );
  id_17 id_18 (
      .id_12(id_5),
      .id_16(id_5)
  );
  always @(id_14) begin
    id_16 <= 1'b0;
  end
endmodule
