// Seed: 364853840
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  always id_3 <= 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5 = id_1;
  wire id_6;
  module_0(
      id_3, id_1
  );
endmodule
module module_2 (
    output logic id_0,
    input  tri   id_1
);
  wand id_3;
  assign id_3 = 1;
  module_0(
      id_3, id_3
  );
  always begin
    if (id_1) begin
      id_0 <= 1'b0;
    end else @(negedge 1) id_0 = 1'b0;
  end
endmodule
