// Seed: 1424945403
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  generate
    reg
        id_4 = 1,
        id_5,
        id_6,
        id_7,
        id_8,
        id_9,
        id_10,
        id_11,
        id_12,
        id_13,
        id_14,
        id_15,
        id_16,
        id_17,
        id_18,
        id_19,
        id_20,
        id_21,
        id_22 = 1;
    always begin
      $display(1, {id_18{1}}, 1, 1'h0, 1, id_8, 1);
      if ({1, id_11}) begin
        $display(id_21);
        fork
          id_20 <= 1;
          $display;
          id_8 = #1 1;
        join
        id_9 = 1;
      end else begin
        $display(id_5);
        id_15 <= id_9 + 1;
        begin
          id_17 = id_6;
        end
      end
      $display(1'b0);
    end
  endgenerate
endmodule
module module_1 ();
  wire id_1;
  module_0(
      id_1, id_1, id_1
  );
  wire id_3;
endmodule
