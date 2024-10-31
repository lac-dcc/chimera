// Seed: 2600072136
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 (
    output tri0 id_0,
    input tri1 id_1,
    output logic id_2,
    input uwire id_3,
    output tri1 id_4,
    output tri0 id_5,
    output wire id_6,
    input logic id_7,
    input tri id_8,
    output tri0 id_9,
    input supply1 id_10,
    input tri0 id_11,
    input supply0 id_12,
    input supply1 id_13
);
  wire id_15;
  always @(posedge id_12 or(id_10)) begin
    if (id_12) begin
      id_9 = 1;
      assert (id_8);
      $display(id_10);
      id_5 = 1;
    end else begin
      id_2 <= #id_10 id_7;
    end
  end
  module_0(
      id_15, id_15, id_15, id_15, id_15
  );
endmodule
