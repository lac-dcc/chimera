module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    input id_5,
    id_6,
    id_7,
    id_8,
    input logic [1 : ~  id_1] id_9,
    id_10,
    input logic id_11
);
  always @(posedge id_1[id_5] or posedge id_9) begin
    if (id_10) begin
      id_7 = id_11;
      id_5[1 : ~id_8] <= id_10;
    end else begin
      id_12 = 1;
    end
  end
  output id_13;
  logic id_14 (
      .id_13(id_13),
      .id_13(1),
      .id_15(id_15),
      .id_16(id_13[id_16]),
      .id_13(id_15)
  );
endmodule
