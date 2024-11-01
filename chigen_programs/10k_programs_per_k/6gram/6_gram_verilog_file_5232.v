// Seed: 3751641469
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(id_5 or id_1) begin
    id_5 <= id_4;
    wait (1);
    if (1) id_4 <= id_1;
  end
  module_0(
      id_3, id_3, id_3, id_2
  );
endmodule
