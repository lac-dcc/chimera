// Seed: 71602079
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
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
  output wire id_1;
  assign id_2 = id_3;
  module_0(
      id_3, id_3, id_2
  );
endmodule
module module_2 (
    output logic id_0
    , id_2
);
  always @(posedge 1 or posedge 1) begin
    begin
      id_0 <= 1 == id_2;
    end
  end
  module_0(
      id_2, id_2, id_2
  );
endmodule
