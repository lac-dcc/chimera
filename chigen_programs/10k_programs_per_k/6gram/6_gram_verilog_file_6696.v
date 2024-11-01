// Seed: 3173467807
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_4(
      .id_0(1), .id_1(id_2), .id_2(id_1)
  );
  tri1 id_5;
  always #1 begin
    id_5 = 1'b0;
    id_5 = id_5 - 1;
  end
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    input  logic id_2,
    output logic id_3
);
  assign id_3 = id_2 ? 1 : 1 ? id_1 : id_2;
  always @(1 == id_1) begin
    if (1) id_3 <= id_1;
    else id_0 <= id_2 - id_1;
  end
  specify
    (id_5 => id_6) = 1;
    (id_7 => id_8) = 1;
  endspecify
  assign id_8 = id_7;
  module_0(
      id_8, id_6, id_6
  );
endmodule
