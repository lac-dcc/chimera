// Seed: 3081878249
module module_0 (
    input supply1 id_0,
    input logic id_1,
    input supply0 id_2,
    input wor id_3,
    output logic id_4
);
  reg  id_6;
  wire id_7;
  wire id_8;
  always @(*) begin
    begin
      wait (id_3 + 1);
      id_6 <= id_1;
      id_4 <= id_0 & id_1;
    end
  end
endmodule
module module_1 (
    input tri1 id_0,
    input logic id_1,
    input wor id_2,
    input tri0 id_3,
    output logic id_4,
    output uwire id_5,
    output tri id_6,
    input supply1 id_7,
    output uwire id_8
);
  always @(id_2 or posedge id_7) begin
    id_4 = id_3 + id_0;
    id_8 = 1;
    #1;
    id_4 <= id_1;
  end
  module_0(
      id_3, id_1, id_0, id_0, id_4
  );
endmodule
