module module_0 (
    id_1,
    id_2,
    id_3
);
  input id_3;
  output id_2;
  input id_1;
  assign id_2 = id_1;
endmodule
`timescale 1ps / 1ps
module module_1 (
    id_1,
    id_2,
    id_3
);
  output id_3;
  output id_2;
  input id_1;
  id_4 id_5 (
      .id_3(id_3),
      .id_2(id_1)
  );
endmodule
