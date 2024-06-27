module module_0 #(
    parameter id_1 = id_1[1'b0]
);
  logic id_2;
  assign id_2[(id_1)] = 1'd0;
  id_3 #(
      .id_4(1)
  ) id_5 (
      .id_2(id_4),
      .id_3(id_1[id_4])
  );
endmodule
