// Seed: 2273540040
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  supply0 id_4 = 1;
  assign id_1 = id_4;
  wire id_5;
  tri1 id_6 = 1'd0;
  always @(posedge id_6) begin
    id_3 <= 1;
  end
endmodule
module module_1 (
    output tri id_0,
    inout logic id_1,
    input uwire id_2,
    output tri1 id_3,
    input supply1 id_4,
    input tri0 id_5,
    output wor id_6,
    input tri0 id_7,
    input tri id_8
);
  reg  id_10;
  wire id_11;
  assign id_11 = id_4 || {1{id_11}} || 1 == id_2 - 1;
  reg id_12;
  module_0(
      id_11, id_11, id_12
  );
  always @(posedge 1 or "") begin
    begin
      id_1 <= id_12;
      id_1 <= id_10;
    end
  end
  nor (id_3, id_12, id_2, id_4, id_5, id_10, id_11, id_1);
endmodule
