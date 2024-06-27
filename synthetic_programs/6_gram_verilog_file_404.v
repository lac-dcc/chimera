module module_0 (
    id_1,
    id_2,
    id_3,
    output logic id_4,
    input id_5
);
  assign id_2 = id_4 ? 1 : id_3 ? id_5 : 1'b0;
  id_6 id_7 (
      .id_6(1),
      .id_4(~(1)),
      .id_4(id_5)
  );
  id_8 id_9 (
      .id_3(id_8[id_4]),
      .id_5(id_4),
      .id_2(id_4)
  );
  localparam id_10 = id_4;
  id_11 id_12;
  assign id_12   = id_6;
  assign id_8[1] = (id_8 & id_1);
endmodule
