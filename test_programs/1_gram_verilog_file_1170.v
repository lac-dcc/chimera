// Seed: 4177433417
module module_0 (
    input tri id_0,
    input wor id_1
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri  id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6, id_7;
  module_2 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6
  );
  bit id_8;
  always_latch
    if (-1'b0) id_3 <= id_8;
    else begin : LABEL_0
      id_1 <= #id_8 id_3;
    end
  reg id_9 = id_8;
  and primCall (id_1, id_3, id_2, id_6, id_7);
  wire id_10;
  assign id_1 = id_2;
endmodule
