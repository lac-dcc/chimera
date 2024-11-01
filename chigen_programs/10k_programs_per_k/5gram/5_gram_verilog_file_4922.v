// Seed: 1239822073
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  final begin
    $display(id_2);
    id_3 = #id_4 id_1;
  end
  assign id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1;
  reg id_5 = id_4;
  or (id_3, id_4, id_1);
  module_0(
      id_4, id_3, id_5
  );
  assign id_2 = 1;
  assign id_5 = 1;
  generate
    always @(posedge 1 or posedge 1) begin
      id_5 <= 1;
    end
  endgenerate
endmodule
