// Seed: 1182880703
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = !id_3;
  module_0(
      id_7, id_6
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  id_8(
      .id_0(id_6), .id_1(1), .id_2(1 && 1)
  );
  wire id_9;
  id_10(
      .id_0(id_4[1]), .id_1(id_7), .id_2(1 ^ id_6), .id_3(), .id_4(~1), .id_5(1)
  );
  reg id_11;
  if (id_3 | 1) begin
    assign id_1 = id_2;
  end else wire id_12;
  module_0(
      id_5, id_12
  );
  always id_11 = #1 id_6;
endmodule
