module module_0 (
    output logic [1 'b0 : id_1] id_2,
    output id_3
);
  id_4 id_5 (
      .id_1(id_2),
      .id_3(id_1)
  );
  assign id_3 = 1'b0;
  id_6 id_7 (
      .id_5(id_3),
      .id_1(1),
      .id_5(id_3),
      .id_3(id_1),
      .id_2(id_5),
      .id_5(id_3),
      .id_5(~id_5),
      .id_2(id_3)
  );
endmodule
