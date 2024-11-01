// Seed: 2869009514
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(*) begin
    id_3 <= id_2;
    id_3 <= ~id_2;
  end
endmodule
module module_1 (
    output supply1 id_0,
    output logic   id_1
);
  tri id_3;
  reg id_4;
  always @(posedge 1'h0) begin
    repeat (id_3) begin
      release id_3;
      id_3 = id_3;
      id_1 <= #1 id_4;
      wait (id_3 * id_4 - 1);
      {id_3, 1} += id_3;
    end
  end
  module_0(
      id_3, id_4, id_4
  );
endmodule
