`define id_0 0
module module_1 (
    id_2,
    id_3,
    id_4
);
  id_5 id_6 (
      .id_3(1'b0),
      .id_5(id_4)
  );
  id_7 id_8 (
      .id_3(1),
      .id_7(id_5),
      .id_5(id_6),
      .id_7(1)
  );
  assign id_5 = id_6 ? 1 : id_3;
endmodule
