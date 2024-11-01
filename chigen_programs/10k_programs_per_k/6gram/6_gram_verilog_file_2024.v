// Seed: 2265831335
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always begin
    fork
      id_2 = id_1;
      begin
        id_6 <= id_1;
      end
    join
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  module_0(
      id_3, id_3, id_4, id_4, id_4, id_1
  );
  supply1 id_5;
  assign id_3 = 1'b0 - 1'b0;
  initial
    forever
      if (id_5) begin
        id_1 <= {id_3, 1, 1 * id_5, id_5 / 1 + id_3};
      end
endmodule
