module module_0 #(
    parameter id_9  = id_3,
    parameter id_10 = id_9,
    parameter id_11 = id_3
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output id_8;
  output id_7;
  input id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  id_12 id_13 (
      .id_5 (1),
      .id_10(id_5),
      .id_1 (id_2)
  );
  logic id_14;
  always @(posedge id_4 or posedge id_3[id_3]) begin
    if (id_2)
      if (id_6[id_5]) begin
        if (1) id_10 <= 1'b0;
      end else if (id_15) id_15 <= 1;
  end
endmodule
