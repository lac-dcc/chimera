// Seed: 1291207778
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_1 - id_4;
  always begin
    id_1 = id_2;
  end
  wire id_5;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always
    if (id_1 * id_2) begin
      @(negedge 1) id_1 = id_1;
    end
  always id_2 <= id_2 & id_2;
  module_0(
      id_1, id_1, id_1, id_1
  );
endmodule
