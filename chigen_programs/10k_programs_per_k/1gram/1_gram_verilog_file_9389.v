// Seed: 3969398759
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4, id_5;
  wire id_6, id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_4;
  always
    if (id_1)
      @(posedge "")
      fork
        id_4 <= 1;
        begin : LABEL_0
          id_4 <= 1'h0 + 1;
        end
      join_any
  wire id_5, id_6, id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7
  );
  wire id_8;
  xor primCall (id_1, id_4, id_2, id_3);
endmodule
