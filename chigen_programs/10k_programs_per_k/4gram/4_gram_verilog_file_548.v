// Seed: 4265478322
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  or primCall (id_2, id_1, id_4, id_3);
  module_2 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_2,
      id_3,
      id_1,
      id_2
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri0 id_5 = 1'b0;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_12;
  always @(*) id_11 = 1;
  always @(posedge {id_5,
    1'b0
  } or 1)
  begin : LABEL_0
    fork
      id_13;
    join
  end
  supply1 id_14;
  assign id_12 = id_1;
  id_15 :
  assert property (@(negedge 0) 1)
  else $display(id_15, 1, id_12);
  wire id_16;
  wire id_17;
  wire id_18;
  id_19(
      .id_0(), .id_1(1), .find(id_14 == 1), .id_2(1), .id_3(1)
  );
endmodule
