// Seed: 1152217082
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  generate
    always @(posedge 1 or posedge 1)
      if (1)
        if (1) begin
          id_6 <= 1'b0;
          fork
            $display(1, id_6, 1 == id_4, id_2, id_1, id_2++, id_6);
            id_10;
          join
        end else begin
          fork
            id_7 = id_8 == id_4;
            #1;
          join_any
          if (id_9) id_5 = 1'b0 == 1;
        end
  endgenerate
  assign id_5 = 1;
  module_0(
      id_4, id_9, id_8, id_9, id_4
  );
  generate
    begin
      assign id_9 = id_3;
    end
  endgenerate
endmodule
