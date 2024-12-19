// Seed: 3181462186
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  reg  id_4;
  wire id_5;
  reg  id_6;
  always_ff begin : LABEL_0
    id_6 <= id_4;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_3
  );
endmodule
module module_2;
  static id_1(
      .id_0((1) + 1), .id_1(1'b0)
  );
endmodule
module module_3 (
    input tri0 id_0,
    output tri0 id_1,
    input tri id_2,
    output tri0 id_3,
    input wire id_4,
    output supply1 id_5,
    output supply1 id_6,
    output supply0 id_7,
    output supply0 id_8
);
  assign id_1 = id_0 - 1;
  bufif0 primCall (id_1, id_2, id_4);
  module_2 modCall_1 ();
endmodule
