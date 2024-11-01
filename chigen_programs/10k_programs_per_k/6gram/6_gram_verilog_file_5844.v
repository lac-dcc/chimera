// Seed: 3980115223
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  module_0(
      id_3, id_2, id_2, id_2, id_3
  );
  always @(negedge id_1[1]) begin
    id_3 = id_1[1];
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  module_0(
      id_1, id_3, id_5, id_4, id_4
  );
  assign id_3 = (1);
  id_6(
      .id_0(id_4), .id_1((1)), .id_2(id_5), .id_3(id_1 - 1'b0), .id_4(1), .id_5(1)
  );
endmodule
